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
echo "1..460"

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

#- 17 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'irnjX9fDmIbeZxzf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetCampaignDynamic' test.out

#- 18 GetCatalogConfig
./ng net.accelbyte.sdk.cli.Main platform getCatalogConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCatalogConfig' test.out

#- 19 UpdateCatalogConfig
./ng net.accelbyte.sdk.cli.Main platform updateCatalogConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enableInventoryCheck": false}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateCatalogConfig' test.out

#- 20 GetLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetLootBoxPluginConfig' test.out

#- 21 UpdateLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "QG26yUZNmTBcvrbY"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "DG8aMVGLiBNrDjqo"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateLootBoxPluginConfig' test.out

#- 22 DeleteLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteLootBoxPluginConfig' test.out

#- 23 UplodLootBoxPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uplodLootBoxPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'UplodLootBoxPluginConfigCert' test.out

#- 24 GetLootBoxGrpcInfo
./ng net.accelbyte.sdk.cli.Main platform getLootBoxGrpcInfo \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 24 'GetLootBoxGrpcInfo' test.out

#- 25 GetSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'GetSectionPluginConfig' test.out

#- 26 UpdateSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "DPUIj88cekdqCt81"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "1ktfIovmv9gsR5cJ"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateSectionPluginConfig' test.out

#- 27 DeleteSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'DeleteSectionPluginConfig' test.out

#- 28 UploadSectionPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadSectionPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 28 'UploadSectionPluginConfigCert' test.out

#- 29 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KOsb392k6YmJFfRB' \
    > test.out 2>&1
eval_tap $? 29 'GetRootCategories' test.out

#- 30 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yjlBiuFM3FIoVk8T' \
    --body '{"categoryPath": "3GpAnkCmBUqg2SCn", "localizationDisplayNames": {"qntX9y1aZSWMiVi1": "0sG6vxkfUcmqRRbc", "eJ5i0EeDxOgBnhhq": "ElIaDml48wdNFLTm", "5T50x9WT0GfH2rtO": "a4EXsXzOXQAk4mqr"}}' \
    > test.out 2>&1
eval_tap $? 30 'CreateCategory' test.out

#- 31 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xzTtuLl4XlbGL8QO' \
    > test.out 2>&1
eval_tap $? 31 'ListCategoriesBasic' test.out

#- 32 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'xtjzm8y2wNhmwoYZ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yI4EFZKBcYrCEAE7' \
    > test.out 2>&1
eval_tap $? 32 'GetCategory' test.out

#- 33 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'WIsfmx40NLRc6m8h' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eKnWhzfe2NubeoKF' \
    --body '{"localizationDisplayNames": {"eIaFQCYoDPICpndu": "EEQlULdJz4mnRBkM", "NxvvKgAT8mJrYq6h": "RkloqxM3gpwxcfMy", "9XzjjI5YbsKoADkz": "JEN2VHzih3bit0VW"}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateCategory' test.out

#- 34 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'n3CO39PXDNxtXgeO' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3FgkXhjDzaQY3snn' \
    > test.out 2>&1
eval_tap $? 34 'DeleteCategory' test.out

#- 35 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath '2ZkP7cFdP43e5dC9' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XIBudfZgrbHDIDm4' \
    > test.out 2>&1
eval_tap $? 35 'GetChildCategories' test.out

#- 36 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'hMzF4TxodenSrUTv' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fqU0bfoMm5cTtFWb' \
    > test.out 2>&1
eval_tap $? 36 'GetDescendantCategories' test.out

#- 37 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'otQyXJRcQWsmqPNs' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '13' \
    --code '2epxk0i8VxsZNere' \
    --limit '92' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 37 'QueryCodes' test.out

#- 38 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'vf9699mCEHThUJkE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"codeValue": "TAsSp7gh4TeUTkOk", "quantity": 53}' \
    > test.out 2>&1
eval_tap $? 38 'CreateCodes' test.out

#- 39 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'j0ZwsVC0gL97ZVJS' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '85' \
    > test.out 2>&1
eval_tap $? 39 'Download' test.out

#- 40 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId '2QD3oD5fLCr3OOlX' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '97' \
    > test.out 2>&1
eval_tap $? 40 'BulkDisableCodes' test.out

#- 41 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'gQxC3Gb7S0o4zGYY' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '17' \
    > test.out 2>&1
eval_tap $? 41 'BulkEnableCodes' test.out

#- 42 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'KQI1AeFgPqaOkvo1' \
    --namespace "$AB_NAMESPACE" \
    --code 'aolB4lkKB4EYOkQ1' \
    --limit '18' \
    --offset '22' \
    --userId 'MD3cym8xIfkOVW2g' \
    > test.out 2>&1
eval_tap $? 42 'QueryRedeemHistory' test.out

#- 43 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'rREOLx0KOww3HICQ' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 43 'GetCode' test.out

#- 44 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'Lfl7MUBG7qtPu64y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'DisableCode' test.out

#- 45 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'AtURKLRkb738HGS6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'EnableCode' test.out

#- 46 GetServicePluginConfig
eval_tap 0 46 'GetServicePluginConfig # SKIP deprecated' test.out

#- 47 UpdateServicePluginConfig
eval_tap 0 47 'UpdateServicePluginConfig # SKIP deprecated' test.out

#- 48 DeleteServicePluginConfig
eval_tap 0 48 'DeleteServicePluginConfig # SKIP deprecated' test.out

#- 49 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 49 'ListCurrencies' test.out

#- 50 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "QAXVG7tnsZg5QgXj", "currencySymbol": "vyGJPN4eXbJE5Vs2", "currencyType": "REAL", "decimals": 4, "localizationDescriptions": {"cnEevcAx2K2zkRen": "mPZnGBt4P7WnbdSJ", "tjX7ZshZyZl5x4bR": "XBHUTrDzZSKscfOc", "Yu3dpCROYqUiGKXV": "FCmpo6sPwVOEDSJs"}}' \
    > test.out 2>&1
eval_tap $? 50 'CreateCurrency' test.out

#- 51 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'EK5QpNhlI2iS5EpG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"hhvXYck0upMzUYnb": "76tFkEORV3bu1bNC", "tX7W40V6Do5sYadC": "CFrHHC3DpZxkrQDX", "uNFviMarv8mnfHK8": "CCmE2lPnsbD3SGEd"}}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateCurrency' test.out

#- 52 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'lwuUccE536ugBp3H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteCurrency' test.out

#- 53 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'BvepnDCjgyJlXe36' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'GetCurrencyConfig' test.out

#- 54 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'mgWjLfFmteue9nzJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'GetCurrencySummary' test.out

#- 55 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetDLCItemConfig' test.out

#- 56 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "6fH24T805tVg8JqU", "rewards": [{"currency": {"currencyCode": "0jZpjvsugAOS7u8R", "namespace": "iWyerCSa8SRgwsAj"}, "item": {"itemId": "1ik1jglaDXTvKCWw", "itemName": "NTAhd2wrS0uPdjhd", "itemSku": "inpng5BLy8wbhMss", "itemType": "AHjapIkY9Rf4wP57"}, "quantity": 6, "type": "ITEM"}, {"currency": {"currencyCode": "zFQbJndUDpdONneA", "namespace": "czbBdHb2slt71B1S"}, "item": {"itemId": "mZp2JZp50CnPb71O", "itemName": "RYcmQbTU5JX8ccLj", "itemSku": "MXJRk0eaKQDOJvrT", "itemType": "efglSs6g4iY9u02a"}, "quantity": 59, "type": "ITEM"}, {"currency": {"currencyCode": "NYIWekp18lOC3mNq", "namespace": "F7Bl0LcghVHfPEsp"}, "item": {"itemId": "xwhRON0bc1eMbEIj", "itemName": "owLqc3ecjXJbZDKK", "itemSku": "oxLE1Y3Dymtj3giP", "itemType": "g4x4yiPX6ues1Hhh"}, "quantity": 21, "type": "CURRENCY"}]}, {"id": "g1yLVbLFzHEP8cM4", "rewards": [{"currency": {"currencyCode": "NTwr0KHaAsmTej52", "namespace": "WKi6tArAURt9plCS"}, "item": {"itemId": "Vq8PdH6hJPUAc0RV", "itemName": "wXgAgntLMCuaXBWQ", "itemSku": "i6BqPg4xr0lCancU", "itemType": "ZGCHsZYoLfR1KtOv"}, "quantity": 56, "type": "ITEM"}, {"currency": {"currencyCode": "vmgBLxh4ijFnE3Ta", "namespace": "m69qSZ7PC6f6QkmZ"}, "item": {"itemId": "XElW9YfRSse6AAz3", "itemName": "S4czz0QKFlAVmVLu", "itemSku": "4AOec0z8eBeeoip6", "itemType": "8J1nsv4W2OJhtafx"}, "quantity": 78, "type": "ITEM"}, {"currency": {"currencyCode": "SJlHeb34sZKHcl5L", "namespace": "LLOexL4fZvWtND2t"}, "item": {"itemId": "cBFpX8lNtFEJ7tnk", "itemName": "Y6Mca5afj12K2Izr", "itemSku": "BvvWm4udE0OXudXg", "itemType": "Nne8kJATwlc6esUp"}, "quantity": 98, "type": "ITEM"}]}, {"id": "xnZ5Jrzzjrcaug6C", "rewards": [{"currency": {"currencyCode": "WVG8SWP3glU6musw", "namespace": "VJnNnN7kAa7j0riF"}, "item": {"itemId": "c5HTHQIoVsGo7dwV", "itemName": "9DBqFKHQkETJyTlU", "itemSku": "rwDTnoujQD4IEiH9", "itemType": "Z5qXn3aoRtlqOECo"}, "quantity": 15, "type": "CURRENCY"}, {"currency": {"currencyCode": "JNvYuGRUvpZaHCuE", "namespace": "SOiIZsMfB4ZH3mtg"}, "item": {"itemId": "WgU4pCAKxeE70Cau", "itemName": "nQNxot371W9G4AvQ", "itemSku": "kqsGnmyo5JJTUVmb", "itemType": "8GEXFTlEMEsFzYqw"}, "quantity": 14, "type": "CURRENCY"}, {"currency": {"currencyCode": "1Np5nodqpLm7FhJB", "namespace": "NXzAFdO0Khqf6kiT"}, "item": {"itemId": "dSGv2LFjAKY7Cbgs", "itemName": "WqFWZX7kPBom8F9G", "itemSku": "LLTG8phc3n4iLoIl", "itemType": "lKlpO2pqiXJF3WGR"}, "quantity": 1, "type": "CURRENCY"}]}]}' \
    > test.out 2>&1
eval_tap $? 56 'UpdateDLCItemConfig' test.out

#- 57 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'DeleteDLCItemConfig' test.out

#- 58 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'GetPlatformDLCConfig' test.out

#- 59 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "OCULUS", "platformDlcIdMap": {"4b9rIzqYkEpstyVT": "BcrM8rG0rH0zcsww", "VeMK6MbGIVIu8vvw": "Lc7KY3uVoJXTIMtp", "gkieDyF97lGdMiHK": "xbWCYzo8yO2KTK9t"}}, {"platform": "OCULUS", "platformDlcIdMap": {"LY6FEO65Rb3z7CYL": "M8IlsHqffnrfsGlf", "PaZKBwa3Ddb60ufP": "pzwj1QGIFmlVf4jv", "apseE9LN9bvhOrHf": "lIOd6X3viLvtEk4m"}}, {"platform": "XBOX", "platformDlcIdMap": {"3RwrKt2ecozL0TOg": "54vCE48L5oLF6M4l", "Na4JUMSHNgqRqCV7": "usamANkZlOX9Sfo9", "5HgXqKhTPkwfLM9u": "SybRzWek2gZvRrvr"}}]}' \
    > test.out 2>&1
eval_tap $? 59 'UpdatePlatformDLCConfig' test.out

#- 60 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeletePlatformDLCConfig' test.out

#- 61 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'APP' \
    --entitlementName '9d9lvccKMLhrTrcB' \
    --itemId 'E2ItBS3KtKZWe8ao,FzAyBME74HUtipUW,YhWV1qx8CzPML52f' \
    --limit '1' \
    --offset '28' \
    --origin 'Epic' \
    --userId 'Ur9Sk4lq2faBcAXX' \
    > test.out 2>&1
eval_tap $? 61 'QueryEntitlements' test.out

#- 62 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'KlhvyH8paOJtxqMP,pcVfRwNj547fH0Xr,KEDpEY8VnocGAjci' \
    --limit '14' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 62 'QueryEntitlements1' test.out

#- 63 EnableEntitlementOriginFeature
./ng net.accelbyte.sdk.cli.Main platform enableEntitlementOriginFeature \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'EnableEntitlementOriginFeature' test.out

#- 64 GetEntitlementConfigInfo
./ng net.accelbyte.sdk.cli.Main platform getEntitlementConfigInfo \
    --namespace "$AB_NAMESPACE" \
    --withoutCache  \
    > test.out 2>&1
eval_tap $? 64 'GetEntitlementConfigInfo' test.out

#- 65 GrantEntitlements
./ng net.accelbyte.sdk.cli.Main platform grantEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlementGrantList": [{"collectionId": "l0bQxFJ3sWCqQpQ2", "endDate": "1987-01-19T00:00:00Z", "grantedCode": "bKPFMycMSQ4qfAac", "itemId": "R0LgB5BUXvjcu2s6", "itemNamespace": "w3VifnKqmTSoGH1X", "language": "hFM-RzNQ-526", "origin": "System", "quantity": 83, "region": "WdsbYuVEGVxYheR3", "source": "IAP", "startDate": "1972-04-17T00:00:00Z", "storeId": "aZPV87pna08gxefT"}, {"collectionId": "YKhuxaEc7M4P7Uck", "endDate": "1993-08-26T00:00:00Z", "grantedCode": "C6ePeN8i4GrFES9z", "itemId": "7xueHpATHccee9GX", "itemNamespace": "hKcjmSEwdrkEnnqK", "language": "glT", "origin": "Epic", "quantity": 15, "region": "lUlfwEQKjU7eHGeb", "source": "PURCHASE", "startDate": "1997-11-21T00:00:00Z", "storeId": "LQ40kepEaC4dfiOM"}, {"collectionId": "ZfEhHr39pysFO3Zv", "endDate": "1972-02-16T00:00:00Z", "grantedCode": "1BZG99LyvfvHEsJK", "itemId": "QQewVLMUoAnaRcYp", "itemNamespace": "7FUjfIGaffoflEIB", "language": "xzT_ohNN", "origin": "System", "quantity": 62, "region": "elYF5wWaDhukU4kh", "source": "REWARD", "startDate": "1974-09-25T00:00:00Z", "storeId": "SHdfo07UctPErqxy"}], "userIds": ["BycvU4PbmRDcrg0D", "jQjBECXvea7H1m2l", "MyOK06MqQBErxgjV"]}' \
    > test.out 2>&1
eval_tap $? 65 'GrantEntitlements' test.out

#- 66 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["JFRZ3ZprZ60zMjhT", "Heh94TSenE5hCFkI", "f5weqZ18MH57l2Zs"]' \
    > test.out 2>&1
eval_tap $? 66 'RevokeEntitlements' test.out

#- 67 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'rh90ETtYmGukz3Mn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetEntitlement' test.out

#- 68 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '46' \
    --status 'SUCCESS' \
    --userId '7wu9TmXfJWBPrx9N' \
    > test.out 2>&1
eval_tap $? 68 'QueryFulfillmentHistories' test.out

#- 69 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 's8eLzYEvwSWTaLQj' \
    --eventType 'CHARGEBACK' \
    --externalOrderId 'jCMW64f4XhIjSoTB' \
    --limit '80' \
    --offset '55' \
    --startTime 'MKtezapPr2QEPx3z' \
    --status 'FAIL' \
    --userId 'xBGtEJIYppuUSsKo' \
    > test.out 2>&1
eval_tap $? 69 'QueryIAPClawbackHistory' test.out

#- 70 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "Hw2hyd12uSE7BEv3", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 1, "clientTransactionId": "2MVUGKSZ4GcLkt4p"}, {"amountConsumed": 74, "clientTransactionId": "3Uv1BpWoJBaqdg2F"}, {"amountConsumed": 68, "clientTransactionId": "Hvuk6B6XTmSLyn50"}], "entitlementId": "sigBVZxiKdV57GvR", "usageCount": 50}, {"clientTransaction": [{"amountConsumed": 30, "clientTransactionId": "d9UuL02Le8HSCsls"}, {"amountConsumed": 61, "clientTransactionId": "JNGmyt0SQDUDoWBZ"}, {"amountConsumed": 98, "clientTransactionId": "1GRazPAANjfBoldF"}], "entitlementId": "OyqA2clJ5gEOaCgM", "usageCount": 28}, {"clientTransaction": [{"amountConsumed": 39, "clientTransactionId": "6RugbNEIpGBFUjOn"}, {"amountConsumed": 92, "clientTransactionId": "mM7k8nbLzvtCIW5y"}, {"amountConsumed": 26, "clientTransactionId": "vdhWVnuYLgpZehK0"}], "entitlementId": "G2nmyuViB9kRTcSQ", "usageCount": 6}], "purpose": "oD1e6oI9FmYel0kO"}, "originalTitleName": "w72o8Zkgk0jS6rDW", "paymentProductSKU": "UwfhKvrf2AaH4yCW", "purchaseDate": "rHSppnIZkNnTn3rz", "sourceOrderItemId": "H5NvAtcvNedgS1fU", "titleName": "fKmihDbmu8ePWlQM"}, "eventDomain": "VDXEHeiGTnwyEw6h", "eventSource": "IWDZrpP7rz3ISW51", "eventType": "0kHr4isTKWjmv67n", "eventVersion": 42, "id": "8kXrDZWlGVE9sJ4N", "timestamp": "pUtKp6M9I6nEwnZh"}' \
    > test.out 2>&1
eval_tap $? 70 'MockPlayStationStreamEvent' test.out

#- 71 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetAppleIAPConfig' test.out

#- 72 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "sjwJeGwaPSDMZz95", "password": "OYKiqaZD63xe5rru"}' \
    > test.out 2>&1
eval_tap $? 72 'UpdateAppleIAPConfig' test.out

#- 73 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'DeleteAppleIAPConfig' test.out

#- 74 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'GetEpicGamesIAPConfig' test.out

#- 75 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "JVfLGea0ZtlzUcuH"}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateEpicGamesIAPConfig' test.out

#- 76 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'DeleteEpicGamesIAPConfig' test.out

#- 77 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'GetGoogleIAPConfig' test.out

#- 78 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "AXz0UV31MfuGaXsA", "serviceAccountId": "uGsZaSHevO0TQNEI"}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateGoogleIAPConfig' test.out

#- 79 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'DeleteGoogleIAPConfig' test.out

#- 80 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 80 'UpdateGoogleP12File' test.out

#- 81 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'GetIAPItemConfig' test.out

#- 82 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "3kfabxJWWSI1ECUo", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"NPpeFhUztXDgB7n4": "C97uAPP8PATLpUpx", "eJlsBJT6Hh3OMjAj": "q2mK8lbSEEelxnb5", "QxWG2HFnZlA6HKWW": "4fI1IQcoBQELcNlZ"}}, {"itemIdentity": "kqTZrKgXNwvm4e5G", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"742OixhtAoKiVm6U": "RT95XhnUcvWB28Mp", "usuhhDJ5slzgiWZE": "tyd56LfxnbY97jjY", "gXchCbkXX26uEdCf": "QaMAQuTKfC0I2kNj"}}, {"itemIdentity": "CMDtDMrentgn3Dhq", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"LTmSvTkQQgB7exYv": "mHMxr5hPCJJztJBg", "0tTJg46IewOXE2Ak": "Ch3QIZsUf8lGFXcm", "wTERHclOdxIwqejx": "e18rNdb8Otq6j1mq"}}]}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateIAPItemConfig' test.out

#- 83 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'DeleteIAPItemConfig' test.out

#- 84 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'GetOculusIAPConfig' test.out

#- 85 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "Uav7k05HAQltnSoj", "appSecret": "V4jT65yclX2FtAz0"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateOculusIAPConfig' test.out

#- 86 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 86 'DeleteOculusIAPConfig' test.out

#- 87 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'GetPlayStationIAPConfig' test.out

#- 88 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "vJjFIYWOaNdsimmk", "backOfficeServerClientSecret": "W2miH3xRHAKy4QxZ", "enableStreamJob": false, "environment": "KKKo37NHDOQe91Ps", "streamName": "3ztUIV0dS6hIH9c4", "streamPartnerName": "VfkyrwpuXxbaERbf"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdatePlaystationIAPConfig' test.out

#- 89 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 89 'DeletePlaystationIAPConfig' test.out

#- 90 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'ValidateExistedPlaystationIAPConfig' test.out

#- 91 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "gPmi0eHkt1mr9EOI", "backOfficeServerClientSecret": "Fg0dnWIYN2NVL70I", "enableStreamJob": true, "environment": "BhSSQkQD6WmOt6D7", "streamName": "ufFVTOhvQpfbBke8", "streamPartnerName": "aEdd36xj6wySoltD"}' \
    > test.out 2>&1
eval_tap $? 91 'ValidatePlaystationIAPConfig' test.out

#- 92 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'GetSteamIAPConfig' test.out

#- 93 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "xsbzxrlaKEfkoYjY", "publisherAuthenticationKey": "2o6ouRW9UtNquwC3"}' \
    > test.out 2>&1
eval_tap $? 93 'UpdateSteamIAPConfig' test.out

#- 94 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'DeleteSteamIAPConfig' test.out

#- 95 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'GetTwitchIAPConfig' test.out

#- 96 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "WgumrIz4NhGztZpr", "clientSecret": "4U4fwQIiLXgmRasv", "organizationId": "jO4lj8m3XEwP2b4g"}' \
    > test.out 2>&1
eval_tap $? 96 'UpdateTwitchIAPConfig' test.out

#- 97 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 97 'DeleteTwitchIAPConfig' test.out

#- 98 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'GetXblIAPConfig' test.out

#- 99 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "d3xOeii8Jnmssep2"}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateXblIAPConfig' test.out

#- 100 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 100 'DeleteXblAPConfig' test.out

#- 101 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'xD2NY0kABeGs9yxa' \
    > test.out 2>&1
eval_tap $? 101 'UpdateXblBPCertFile' test.out

#- 102 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'hld1pO0Gyf5PO3CO' \
    --itemId 'yMvczgEpzZ3Fbtxf' \
    --itemType 'BUNDLE' \
    --endTime 'TsvcMQ7dBsaIecRx' \
    --startTime 'IsZvD6rmzVr5XT1N' \
    > test.out 2>&1
eval_tap $? 102 'DownloadInvoiceDetails' test.out

#- 103 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'xw0v1dMQ9Rrbk6C2' \
    --itemId 'cVWf6ttvbU1PO6Ap' \
    --itemType 'MEDIA' \
    --endTime 'OOBnIWhunElqZUod' \
    --startTime 'p3IhtCSHy1ei1fIr' \
    > test.out 2>&1
eval_tap $? 103 'GenerateInvoiceSummary' test.out

#- 104 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PvfHnRN06EjRwEQl' \
    --body '{"categoryPath": "NapJRfk4f9Zcw1pE", "targetItemId": "HAyNFxcVTKuAQTGh", "targetNamespace": "5BxjWOozGoDtsUuY"}' \
    > test.out 2>&1
eval_tap $? 104 'SyncInGameItem' test.out

#- 105 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'o5p8ED5QZAufwNa8' \
    --body '{"appId": "lzfjv9oYMXMjlVHY", "appType": "SOFTWARE", "baseAppId": "VGUVhvKhJCmeisql", "boothName": "14mUHVbMPimNhcZs", "categoryPath": "U3VAdMDcb4qlkiFA", "clazz": "amqvZI2KwjqPBiWX", "displayOrder": 1, "entitlementType": "CONSUMABLE", "ext": {"de41s3rH34mB2yPl": {}, "RpWjmHZAAvKTH8Mu": {}, "qIg0CzkguwuJCW7E": {}}, "features": ["EFB67AODbi9BzupB", "sFpYc77GtRUcCFeY", "5g4XgBsbfzqxBPNe"], "flexible": true, "images": [{"as": "ae1Il4aAtEbu4IjG", "caption": "dqthRxTjQ7gkZEY8", "height": 36, "imageUrl": "EDsUmrV6kH4OotKw", "smallImageUrl": "G3UC6XCnnZxF8CmQ", "width": 36}, {"as": "JCJjfk2TUvn95FhO", "caption": "7VW3mbDVMDu87t0l", "height": 6, "imageUrl": "m5ydC6p25xCWTqUO", "smallImageUrl": "YZENJ1QHZQxPRXH7", "width": 42}, {"as": "jELAUK6mQ5iZgbww", "caption": "m5iGzXtcknrgidKu", "height": 30, "imageUrl": "wqjYLfTiCO1NDBvQ", "smallImageUrl": "vRPnAz4VzW0CpoBC", "width": 3}], "inventoryConfig": {"customAttributes": {"H9XyWI8bp8fQxRuX": {}, "91uYmtrHJbEGTUj7": {}, "YjERL1rEQG02zccA": {}}, "serverCustomAttributes": {"8wvLsWUNd6lPKvqD": {}, "ejvqklTSvDwuOrP9": {}, "lzpiX0VuFpZum7iz": {}}, "slotUsed": 48}, "itemIds": ["gKjI9mwJSrN8jkIy", "kR2zbaI6PD7fEscS", "hnGUGUtV9GJ279GD"], "itemQty": {"bLNwjm3FK0nnX2po": 78, "I8y3Cz0YqCKUh5RD": 44, "vNAp4jinFpnQ5xF9": 45}, "itemType": "OPTIONBOX", "listable": true, "localizations": {"S0VgLu11A3HTovFi": {"description": "4tPAGfleyCA6jEtc", "localExt": {"qsnzoVILjkwW61du": {}, "F87aUyrdt4XSpWBA": {}, "etsanzqP8oxfrtbE": {}}, "longDescription": "CD1CYPwaiBAxfYL8", "title": "Avt70ZUT2fSk3LL0"}, "calqxEewuGS469k2": {"description": "hG0WKt4sUmanYxM0", "localExt": {"UHZVNYzGMNIpWoSL": {}, "kUrfuf4U3WeYeA9t": {}, "2ENKKWrFtHIi1CMg": {}}, "longDescription": "KAOG5iDcCR5PbCvD", "title": "Lil8wj9cKM3Ar6MF"}, "35hCER4nGmWGgTJf": {"description": "HlJl4tHGa4XfZcd9", "localExt": {"CVnGqMX9FieeEssW": {}, "EUl07bhwntCVqiYO": {}, "Jf5KwMZQjzvjSozv": {}}, "longDescription": "6CTRDl0zp9CzHFwi", "title": "nkBNi4gvqgl6TZ9T"}}, "lootBoxConfig": {"rewardCount": 67, "rewards": [{"lootBoxItems": [{"count": 1, "duration": 98, "endDate": "1979-12-07T00:00:00Z", "itemId": "whd5IQYBQuxLvPuW", "itemSku": "YvE3fsNy9Z9OhxXv", "itemType": "Cp9y7fLD2qfCXnlU"}, {"count": 28, "duration": 61, "endDate": "1979-07-09T00:00:00Z", "itemId": "L1IiD6MlcEPhMDFz", "itemSku": "jHZ3sIhzOx2CXKlv", "itemType": "IomU3pIxM9n8D2eL"}, {"count": 78, "duration": 79, "endDate": "1973-07-07T00:00:00Z", "itemId": "3lt9qfx2UDcgVE7L", "itemSku": "9FK6e0MrPc4vtxk9", "itemType": "hVKlG56HlzGr7Xjd"}], "name": "yRJunZPkp6ccIBnW", "odds": 0.39971670644721946, "type": "REWARD_GROUP", "weight": 46}, {"lootBoxItems": [{"count": 61, "duration": 26, "endDate": "1990-03-12T00:00:00Z", "itemId": "97D2xnik42miteR5", "itemSku": "eQAe1rzmmgqBPRmd", "itemType": "6mO4oI8KDqebm83r"}, {"count": 1, "duration": 80, "endDate": "1991-07-15T00:00:00Z", "itemId": "BJ5y7axEkvI4oxZE", "itemSku": "DxGiBnNbn0zaf7Ca", "itemType": "OSlHXrUSA6sMJzA5"}, {"count": 26, "duration": 63, "endDate": "1980-05-29T00:00:00Z", "itemId": "qISQ83TTbtefXWzn", "itemSku": "De4LQdXfFBii2RAM", "itemType": "EX5RMjBFVZGYzQqV"}], "name": "8d9mDdUIoiIJFNxu", "odds": 0.6345631255382335, "type": "REWARD_GROUP", "weight": 12}, {"lootBoxItems": [{"count": 26, "duration": 92, "endDate": "1995-12-26T00:00:00Z", "itemId": "9En3wYowBdkaZ3y6", "itemSku": "i38XQjLDRqkpiFK5", "itemType": "BtiQ272Uo9UBJWod"}, {"count": 31, "duration": 19, "endDate": "1972-08-04T00:00:00Z", "itemId": "wsX1jorcyR0x3YiH", "itemSku": "F8ITGPRQBCgIs1Q2", "itemType": "lzxl0yF5m77TTh4g"}, {"count": 97, "duration": 62, "endDate": "1978-08-22T00:00:00Z", "itemId": "j8u2WRcLiEtzVlnk", "itemSku": "flfn7pHY48F1dl1q", "itemType": "92m3iRlfnBAk0Cwi"}], "name": "AsR65yQ9ssuHdGmx", "odds": 0.21197970818253864, "type": "PROBABILITY_GROUP", "weight": 53}], "rollFunction": "DEFAULT"}, "maxCount": 93, "maxCountPerUser": 62, "name": "dqnQGbqiqOkNeATj", "optionBoxConfig": {"boxItems": [{"count": 68, "duration": 8, "endDate": "1988-09-23T00:00:00Z", "itemId": "MkjzyBB4UFKiaoV0", "itemSku": "VOem2yqPsMFxKybP", "itemType": "kbuS6x9cLJ1APnNl"}, {"count": 37, "duration": 70, "endDate": "1971-08-22T00:00:00Z", "itemId": "2bRBr27fVMWuAfDq", "itemSku": "LMR919IZPKOKiAVQ", "itemType": "XXOmqFHLbyXmgCNi"}, {"count": 1, "duration": 68, "endDate": "1988-06-19T00:00:00Z", "itemId": "0uGcL1koyHjCH5ol", "itemSku": "YLETRpABAmO2EGvJ", "itemType": "4UMS93yOxNInDByh"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 23, "fixedTrialCycles": 21, "graceDays": 41}, "regionData": {"G8bXGFmPAnOkDiJq": [{"currencyCode": "4xQye7HqnVK3YVeO", "currencyNamespace": "Ws9mfVQh3jLBtn9p", "currencyType": "VIRTUAL", "discountAmount": 32, "discountExpireAt": "1986-01-02T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1978-05-25T00:00:00Z", "expireAt": "1980-11-24T00:00:00Z", "price": 52, "purchaseAt": "1994-08-10T00:00:00Z", "trialPrice": 23}, {"currencyCode": "0B4CxyQrUpIFvORx", "currencyNamespace": "Ti79DpSjb39ukcR6", "currencyType": "REAL", "discountAmount": 4, "discountExpireAt": "1999-10-15T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1999-09-10T00:00:00Z", "expireAt": "1980-04-19T00:00:00Z", "price": 9, "purchaseAt": "1982-04-14T00:00:00Z", "trialPrice": 22}, {"currencyCode": "n7M23SzUo4hNBDh9", "currencyNamespace": "ZFP1OW0nXOErQPS4", "currencyType": "VIRTUAL", "discountAmount": 37, "discountExpireAt": "1993-11-07T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1976-10-14T00:00:00Z", "expireAt": "1977-10-28T00:00:00Z", "price": 41, "purchaseAt": "1977-12-09T00:00:00Z", "trialPrice": 50}], "4tQ6R1OqKVOTniBg": [{"currencyCode": "LsNhdgQ0JWZjNRSz", "currencyNamespace": "OTqcVNX3ahvxw9gw", "currencyType": "VIRTUAL", "discountAmount": 100, "discountExpireAt": "1974-06-05T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1981-04-22T00:00:00Z", "expireAt": "1976-03-18T00:00:00Z", "price": 47, "purchaseAt": "1991-04-16T00:00:00Z", "trialPrice": 5}, {"currencyCode": "wKZGW4y3f0R9s2kn", "currencyNamespace": "dhhZhwAiLsZs4pmL", "currencyType": "VIRTUAL", "discountAmount": 70, "discountExpireAt": "1993-01-27T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1987-03-02T00:00:00Z", "expireAt": "1987-10-19T00:00:00Z", "price": 71, "purchaseAt": "1982-03-19T00:00:00Z", "trialPrice": 74}, {"currencyCode": "Dq9aT3qZyI0rYsWu", "currencyNamespace": "cAkXsVJbXi7eRZa7", "currencyType": "VIRTUAL", "discountAmount": 30, "discountExpireAt": "1988-10-18T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1971-07-31T00:00:00Z", "expireAt": "1995-10-11T00:00:00Z", "price": 40, "purchaseAt": "1977-05-19T00:00:00Z", "trialPrice": 75}], "ZD0Xtb0U4pH16NUs": [{"currencyCode": "VY21NVIs7NRen2Y3", "currencyNamespace": "Ns0QJQeaWytPfds1", "currencyType": "VIRTUAL", "discountAmount": 41, "discountExpireAt": "1996-08-24T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1998-12-03T00:00:00Z", "expireAt": "1986-09-25T00:00:00Z", "price": 1, "purchaseAt": "1979-03-26T00:00:00Z", "trialPrice": 89}, {"currencyCode": "u59eFJrOXyDYz9vM", "currencyNamespace": "UOPG0iHDT8QbF7gH", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1991-12-02T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1992-08-01T00:00:00Z", "expireAt": "1971-05-09T00:00:00Z", "price": 44, "purchaseAt": "1991-10-30T00:00:00Z", "trialPrice": 68}, {"currencyCode": "t2NRqJGIKzLyH1y7", "currencyNamespace": "2L13Ornyx34luLdv", "currencyType": "VIRTUAL", "discountAmount": 37, "discountExpireAt": "1990-10-29T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1996-11-11T00:00:00Z", "expireAt": "1976-04-29T00:00:00Z", "price": 18, "purchaseAt": "1973-07-02T00:00:00Z", "trialPrice": 74}]}, "saleConfig": {"currencyCode": "gYPvfn2Qt9iyq3Ny", "price": 21}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "LKiFQoLDvumfqrgS", "stackable": false, "status": "INACTIVE", "tags": ["nx2h61X9dN1MGRXB", "8JdiY3RRiLilmOGF", "J6mVV7JS9qjNLwvI"], "targetCurrencyCode": "6dLLIeIVIjMcdlbd", "targetNamespace": "RXTGIrdNL5gJPqTA", "thumbnailUrl": "jgqaTHf1ANTJ9Yk9", "useCount": 17}' \
    > test.out 2>&1
eval_tap $? 105 'CreateItem' test.out

#- 106 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '7XkGOdC6ItxDT8p4' \
    --appId 'n4XCFkD1AJLCwszb' \
    > test.out 2>&1
eval_tap $? 106 'GetItemByAppId' test.out

#- 107 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate 'akQN1MpOs1RVFrcg' \
    --baseAppId '2CXxepx78fvsyhE2' \
    --categoryPath 'BKtyTDSIM7mkmvZ7' \
    --features 'Cmsh4US8o4jfMANP' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --limit '25' \
    --offset '98' \
    --region 'ZDdMiCxmuCCVuFjS' \
    --sortBy 'updatedAt:desc,updatedAt:asc,createdAt:asc' \
    --storeId '1d2b92B4vEgj3HOm' \
    --tags 'hcWm428XejRF94NI' \
    --targetNamespace 'Y9nMrBZo0lNUBDSh' \
    > test.out 2>&1
eval_tap $? 107 'QueryItems' test.out

#- 108 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'HD32vvL28FPwTiXf,LcxDC9Ynd02mECIQ,hfIhHtADUQ9zimQT' \
    > test.out 2>&1
eval_tap $? 108 'ListBasicItemsByFeatures' test.out

#- 109 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'QT95pFJUAJsyAfeK' \
    --itemIds 'OufV4f15NohXu6op' \
    > test.out 2>&1
eval_tap $? 109 'GetItems' test.out

#- 110 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'xQGRt6PqlkL0diRh' \
    --sku 'LC10ih2EQfY3XCv4' \
    > test.out 2>&1
eval_tap $? 110 'GetItemBySku' test.out

#- 111 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'hdOa6FdZhNMd1onF' \
    --populateBundle  \
    --region 'jGRbxtABPXDmgNEJ' \
    --storeId 'BhgGq5GIDhNC66sz' \
    --sku 'bCCf73IFbRkPSSIT' \
    > test.out 2>&1
eval_tap $? 111 'GetLocaleItemBySku' test.out

#- 112 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'z4TjCrJHXGXku2YV' \
    --region 'uOzhxHmnrrV9ZGWr' \
    --storeId 'Z05sxe6A6RpmKDeb' \
    --itemIds 'NkylbynkgT9vayLL' \
    --userId 'iizac7Ge6zKJdlt7' \
    > test.out 2>&1
eval_tap $? 112 'GetEstimatedPrice' test.out

#- 113 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'rjF5RaJwvkWVco2L' \
    --sku 'To5ijlvDF8qBWCQ9' \
    > test.out 2>&1
eval_tap $? 113 'GetItemIdBySku' test.out

#- 114 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'dLWYyS8zdhMeBXH8,x6HdVfZVDAiU6iJO,F7JKZFNk2NKy59X8' \
    --storeId 'iOg2sVBiCoeC5weX' \
    > test.out 2>&1
eval_tap $? 114 'GetBulkItemIdBySkus' test.out

#- 115 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Jl7PeiMH8z8dVej8' \
    --region 'N2yv6VTnOK7xAvM7' \
    --storeId 'tuL81lsR7xxSVp3G' \
    --itemIds 'd2TK0HzYviTgYmx8' \
    > test.out 2>&1
eval_tap $? 115 'BulkGetLocaleItems' test.out

#- 116 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 116 'GetAvailablePredicateTypes' test.out

#- 117 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform '2JVBRLPZ6Iz8tne5' \
    --userId 'dbguBF6Gsvvdl8jH' \
    --body '{"itemIds": ["z9x7XZIjU4IK9lOL", "aZaMphKCqTq3EVhe", "JjoEEXBLIxGnNuho"]}' \
    > test.out 2>&1
eval_tap $? 117 'ValidateItemPurchaseCondition' test.out

#- 118 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JM3WWPvvCiCf33Vi' \
    --body '{"changes": [{"itemIdentities": ["EdqQpoGkUWNizk5U", "cPAGv6c1ESC6hZYT", "YZbzf5aANNNs5kgS"], "itemIdentityType": "ITEM_SKU", "regionData": {"ZNUHbIT9szApmWJO": [{"currencyCode": "5vzzXZj08a6K1XRV", "currencyNamespace": "friSpPFnZBJZkDnE", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1995-02-07T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1971-03-10T00:00:00Z", "discountedPrice": 78, "expireAt": "1981-05-23T00:00:00Z", "price": 17, "purchaseAt": "1977-05-09T00:00:00Z", "trialPrice": 24}, {"currencyCode": "ZxNnLRH36bqS2oFY", "currencyNamespace": "76PU1AziBOHEAj1c", "currencyType": "VIRTUAL", "discountAmount": 5, "discountExpireAt": "1981-04-30T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1997-01-17T00:00:00Z", "discountedPrice": 42, "expireAt": "1998-09-09T00:00:00Z", "price": 72, "purchaseAt": "1971-05-29T00:00:00Z", "trialPrice": 56}, {"currencyCode": "TFznTgDIwZIRWf6T", "currencyNamespace": "3by2kYSCdnFKLc0x", "currencyType": "REAL", "discountAmount": 93, "discountExpireAt": "1971-03-24T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1979-03-23T00:00:00Z", "discountedPrice": 19, "expireAt": "1972-12-23T00:00:00Z", "price": 4, "purchaseAt": "1972-09-09T00:00:00Z", "trialPrice": 7}], "fU61OJYMnW49rWyn": [{"currencyCode": "p1ck1vT90C6o86cS", "currencyNamespace": "RL9cgbUmulhe98oa", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1986-12-10T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1975-09-17T00:00:00Z", "discountedPrice": 6, "expireAt": "1982-01-31T00:00:00Z", "price": 37, "purchaseAt": "1987-07-09T00:00:00Z", "trialPrice": 98}, {"currencyCode": "xjiiOQAD77ci0vfW", "currencyNamespace": "VZoRRMPi57HyKKz5", "currencyType": "REAL", "discountAmount": 16, "discountExpireAt": "1983-10-12T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1981-07-25T00:00:00Z", "discountedPrice": 24, "expireAt": "1983-10-25T00:00:00Z", "price": 43, "purchaseAt": "1991-10-26T00:00:00Z", "trialPrice": 13}, {"currencyCode": "oXa0dgx1JgjC56pd", "currencyNamespace": "a3YhtQxpCYME6x21", "currencyType": "VIRTUAL", "discountAmount": 60, "discountExpireAt": "1972-10-17T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1992-05-19T00:00:00Z", "discountedPrice": 91, "expireAt": "1979-12-04T00:00:00Z", "price": 75, "purchaseAt": "1984-04-07T00:00:00Z", "trialPrice": 6}], "XDwoEV6tCdrxw1KO": [{"currencyCode": "PhuvHuYrGWDK41uM", "currencyNamespace": "OC0mRvSoaGk4ktF5", "currencyType": "VIRTUAL", "discountAmount": 67, "discountExpireAt": "1978-06-20T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1986-02-22T00:00:00Z", "discountedPrice": 30, "expireAt": "1992-10-18T00:00:00Z", "price": 100, "purchaseAt": "1976-02-13T00:00:00Z", "trialPrice": 17}, {"currencyCode": "glLM4xjfkNL4lU6j", "currencyNamespace": "aGfsD1cfswmeFpvt", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1973-06-10T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1978-03-29T00:00:00Z", "discountedPrice": 87, "expireAt": "1981-09-12T00:00:00Z", "price": 77, "purchaseAt": "1976-07-19T00:00:00Z", "trialPrice": 77}, {"currencyCode": "KSTWLxSFZ0LpupEi", "currencyNamespace": "5DbkVs3qFTi1t530", "currencyType": "REAL", "discountAmount": 82, "discountExpireAt": "1998-10-05T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1997-02-12T00:00:00Z", "discountedPrice": 51, "expireAt": "1992-10-04T00:00:00Z", "price": 53, "purchaseAt": "1982-10-20T00:00:00Z", "trialPrice": 5}]}}, {"itemIdentities": ["za84lKKmVOaTS6xB", "bNrSUAW2ak7ISDrB", "Vg6NuDZvPb1kuUfN"], "itemIdentityType": "ITEM_ID", "regionData": {"KeTyBG5dCUoExnKf": [{"currencyCode": "V3869IN4V1OdhH4G", "currencyNamespace": "VU7Exlkmc4xYiLjL", "currencyType": "VIRTUAL", "discountAmount": 30, "discountExpireAt": "1997-06-16T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1987-06-16T00:00:00Z", "discountedPrice": 35, "expireAt": "1974-08-14T00:00:00Z", "price": 16, "purchaseAt": "1991-06-10T00:00:00Z", "trialPrice": 80}, {"currencyCode": "zn8jAdTn6xBhrcir", "currencyNamespace": "yLm67rkadH5Y41SL", "currencyType": "REAL", "discountAmount": 77, "discountExpireAt": "1985-12-03T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1979-07-12T00:00:00Z", "discountedPrice": 65, "expireAt": "1973-01-04T00:00:00Z", "price": 28, "purchaseAt": "1996-10-31T00:00:00Z", "trialPrice": 23}, {"currencyCode": "x3QcFo9gxOgvDc7x", "currencyNamespace": "MrRKvw8ISP2WKmCR", "currencyType": "VIRTUAL", "discountAmount": 34, "discountExpireAt": "1983-07-11T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1976-12-31T00:00:00Z", "discountedPrice": 99, "expireAt": "1977-12-23T00:00:00Z", "price": 57, "purchaseAt": "1988-05-31T00:00:00Z", "trialPrice": 39}], "heLgsAF4ctv5guyc": [{"currencyCode": "Giq9j2EyIknfLDpg", "currencyNamespace": "HnMOn8nc3gUZ8ZFy", "currencyType": "VIRTUAL", "discountAmount": 8, "discountExpireAt": "1986-02-05T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1998-12-17T00:00:00Z", "discountedPrice": 75, "expireAt": "1983-08-17T00:00:00Z", "price": 39, "purchaseAt": "1996-06-12T00:00:00Z", "trialPrice": 42}, {"currencyCode": "JBqK4QtEydPWLPBY", "currencyNamespace": "iR3UbJc1ZYapx7C4", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1981-07-03T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1986-02-16T00:00:00Z", "discountedPrice": 11, "expireAt": "1985-11-30T00:00:00Z", "price": 70, "purchaseAt": "1989-08-28T00:00:00Z", "trialPrice": 65}, {"currencyCode": "UT0uKAPrARya2IMl", "currencyNamespace": "NiXpF4qvsUUpHqi3", "currencyType": "REAL", "discountAmount": 57, "discountExpireAt": "1998-09-24T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1976-05-11T00:00:00Z", "discountedPrice": 6, "expireAt": "1984-01-22T00:00:00Z", "price": 69, "purchaseAt": "1985-03-20T00:00:00Z", "trialPrice": 87}], "UcnkpU9oVzl2kBuL": [{"currencyCode": "FXIeCEKZUTz3GvCA", "currencyNamespace": "Z5j24acYHbrryHB6", "currencyType": "VIRTUAL", "discountAmount": 85, "discountExpireAt": "1975-07-29T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1990-01-03T00:00:00Z", "discountedPrice": 82, "expireAt": "1973-05-08T00:00:00Z", "price": 55, "purchaseAt": "1984-02-13T00:00:00Z", "trialPrice": 26}, {"currencyCode": "b3YJ9nJM6vtT27xv", "currencyNamespace": "85K5MU2qmbeqaVem", "currencyType": "REAL", "discountAmount": 7, "discountExpireAt": "1992-08-15T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1977-11-30T00:00:00Z", "discountedPrice": 32, "expireAt": "1981-09-17T00:00:00Z", "price": 63, "purchaseAt": "1981-11-26T00:00:00Z", "trialPrice": 99}, {"currencyCode": "vlBIEgjse5kd6GED", "currencyNamespace": "o08yq5E5HleLoog4", "currencyType": "REAL", "discountAmount": 42, "discountExpireAt": "1973-11-03T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1995-08-13T00:00:00Z", "discountedPrice": 65, "expireAt": "1981-05-06T00:00:00Z", "price": 74, "purchaseAt": "1980-07-07T00:00:00Z", "trialPrice": 67}]}}, {"itemIdentities": ["lXvVcJerTPW02PWs", "HiKYArAxnKBfBfDl", "rQQuAc10DjjwMv4v"], "itemIdentityType": "ITEM_SKU", "regionData": {"6lxuU3u2HEG0qfKe": [{"currencyCode": "gvFTD1sPykS8YLmw", "currencyNamespace": "tYgWGcA0h4G1LZ1H", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1996-04-10T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1995-09-23T00:00:00Z", "discountedPrice": 55, "expireAt": "1997-11-05T00:00:00Z", "price": 48, "purchaseAt": "1971-06-01T00:00:00Z", "trialPrice": 65}, {"currencyCode": "1B9oVuzG2CnYX2YB", "currencyNamespace": "F2g7TVtzYEHUodh3", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1995-02-09T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1985-07-11T00:00:00Z", "discountedPrice": 40, "expireAt": "1992-02-23T00:00:00Z", "price": 45, "purchaseAt": "1971-01-24T00:00:00Z", "trialPrice": 9}, {"currencyCode": "259HF9ejHaILQruA", "currencyNamespace": "uYyJLYGqMv824ouS", "currencyType": "REAL", "discountAmount": 34, "discountExpireAt": "1976-03-31T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1979-10-31T00:00:00Z", "discountedPrice": 34, "expireAt": "1998-06-15T00:00:00Z", "price": 57, "purchaseAt": "1989-09-20T00:00:00Z", "trialPrice": 24}], "dIk4oEogFVGR71rJ": [{"currencyCode": "OBy6lsj1AKGBjnHm", "currencyNamespace": "aAu4YK87DYAWWcbc", "currencyType": "REAL", "discountAmount": 84, "discountExpireAt": "1987-10-07T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1977-11-01T00:00:00Z", "discountedPrice": 5, "expireAt": "1974-07-23T00:00:00Z", "price": 63, "purchaseAt": "1976-08-24T00:00:00Z", "trialPrice": 16}, {"currencyCode": "4AELr5lraa5v5P5C", "currencyNamespace": "j8hgFsqHC9h5JPiM", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1981-06-30T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1992-10-21T00:00:00Z", "discountedPrice": 37, "expireAt": "1981-01-06T00:00:00Z", "price": 18, "purchaseAt": "1987-08-28T00:00:00Z", "trialPrice": 13}, {"currencyCode": "2CX0rITajpwHITGe", "currencyNamespace": "HTnqRbzBB9ZFgJbQ", "currencyType": "REAL", "discountAmount": 64, "discountExpireAt": "1989-03-19T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1998-06-09T00:00:00Z", "discountedPrice": 97, "expireAt": "1977-07-14T00:00:00Z", "price": 61, "purchaseAt": "1989-10-09T00:00:00Z", "trialPrice": 24}], "tzkMJ7cudf4r916G": [{"currencyCode": "Prhn2etVIQvRkQJA", "currencyNamespace": "tDUH9tx60AehGz1e", "currencyType": "VIRTUAL", "discountAmount": 26, "discountExpireAt": "1978-10-19T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1996-03-02T00:00:00Z", "discountedPrice": 40, "expireAt": "1980-12-15T00:00:00Z", "price": 13, "purchaseAt": "1985-11-01T00:00:00Z", "trialPrice": 65}, {"currencyCode": "TfyIlAwjTZdRZJJz", "currencyNamespace": "WZwvTX2bamSCvX1n", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1982-04-10T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1981-10-25T00:00:00Z", "discountedPrice": 7, "expireAt": "1986-02-19T00:00:00Z", "price": 45, "purchaseAt": "1995-08-23T00:00:00Z", "trialPrice": 99}, {"currencyCode": "6FwBNrFXt3TAuKBw", "currencyNamespace": "BcD12ae6r3hHwya4", "currencyType": "REAL", "discountAmount": 32, "discountExpireAt": "1983-01-28T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1992-07-28T00:00:00Z", "discountedPrice": 98, "expireAt": "1974-10-30T00:00:00Z", "price": 68, "purchaseAt": "1975-08-05T00:00:00Z", "trialPrice": 35}]}}]}' \
    > test.out 2>&1
eval_tap $? 118 'BulkUpdateRegionData' test.out

#- 119 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'MEDIA' \
    --limit '41' \
    --offset '21' \
    --sortBy 'cHf7dbh2iKNUl0qJ' \
    --storeId 'qzoKMRMG541PAiNj' \
    --keyword 'ULsx4SnKNXLMUaDS' \
    --language 'wwQlnNRZJHBSB4fZ' \
    > test.out 2>&1
eval_tap $? 119 'SearchItems' test.out

#- 120 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '100' \
    --offset '45' \
    --sortBy 'updatedAt:desc,name:desc,updatedAt:asc' \
    --storeId 'IZs28Ff1kZp1Zktx' \
    > test.out 2>&1
eval_tap $? 120 'QueryUncategorizedItems' test.out

#- 121 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId '3N7WNMYIfcDKbLu8' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'pnK34oA1keYXJvtg' \
    > test.out 2>&1
eval_tap $? 121 'GetItem' test.out

#- 122 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'gDdXjbdjMBahFZZG' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MTcqnWrIprOv0BJ9' \
    --body '{"appId": "Sgl7H1sdH2RIJz1e", "appType": "SOFTWARE", "baseAppId": "7Q5pu9PutLf6IrvZ", "boothName": "oBGQbO4S3rURGWUz", "categoryPath": "PAE6SdV4D5jftRl9", "clazz": "rZmtQUvro8TWwXWs", "displayOrder": 53, "entitlementType": "CONSUMABLE", "ext": {"tyBTfERXdvgD1Qf7": {}, "Ot2DkUt3yexZBRvx": {}, "YnEBhXtAVxCd3meT": {}}, "features": ["rT7cF9oVCh89wNOk", "KYssVejcL3kR3hCG", "NgaJmuALlMQl9RLr"], "flexible": true, "images": [{"as": "IkaQEl1iUProNB6h", "caption": "I6IpGcToWgFvdRhG", "height": 81, "imageUrl": "veujxtyQENvJrBCq", "smallImageUrl": "eg67d4RWOqO4U0bi", "width": 40}, {"as": "JIyFAm3DQht4JwnP", "caption": "S2urJqerobWMZGVL", "height": 76, "imageUrl": "Vk5qb8NhWWwaxyMc", "smallImageUrl": "hkt8l5IPSrwrJl7w", "width": 71}, {"as": "yqHDNacl4F9G6Dl5", "caption": "TFwBY6HKXAblkT8V", "height": 67, "imageUrl": "iuvvQUm29Iacq4XR", "smallImageUrl": "LaA643nTMtXSAyej", "width": 27}], "inventoryConfig": {"customAttributes": {"PhGspRi3bhPQvBBJ": {}, "I5JxytpcubN4AUUP": {}, "FPscZsXeJOD4DMtq": {}}, "serverCustomAttributes": {"fIGiGJovgWSRxZ8N": {}, "4UQ2fg3V1o2x0hL5": {}, "DuBDqMyIAzWze94M": {}}, "slotUsed": 62}, "itemIds": ["VBQ1crBXAupATO8u", "XsqVpdiWo8SjDAM0", "Riw8wLYW3n4F3LD1"], "itemQty": {"EDwBXw5uBYeQZOzA": 93, "vWjVac1cQvSxgTNI": 95, "AVYymOuhCkZu4htr": 38}, "itemType": "BUNDLE", "listable": false, "localizations": {"RJIhFXR2dYprPmbp": {"description": "uptECGd5cdXC2Ses", "localExt": {"c6y68whNBYl9iCqf": {}, "W6rqGOQny4ij4ysY": {}, "Ponb59gQffkNOmub": {}}, "longDescription": "xEJr2qEAuJbpZSrc", "title": "bc4LWfKaY5c1tP5T"}, "DuI5f6m4KC07CnsZ": {"description": "e32hqEcB1ExYMBb3", "localExt": {"ckvoaJYdMqGegcg3": {}, "eRvBZXN3cjIXmFWR": {}, "Jnj8xN7HDPTUEDPN": {}}, "longDescription": "1Kb4UTPWDXTSb55g", "title": "8LSTs7Nf95lGlPrf"}, "6obIdnI6Ag7eUYcY": {"description": "J4QzXCmqr6gmPGaH", "localExt": {"P5SVPvRLiDi0mNHb": {}, "6Lx8eq8SGNwEQO8d": {}, "YXvBSYvJBwb6CjZU": {}}, "longDescription": "MRf2VJetWsokvx3B", "title": "HuTEczr9KjQ3ttz8"}}, "lootBoxConfig": {"rewardCount": 79, "rewards": [{"lootBoxItems": [{"count": 97, "duration": 92, "endDate": "1985-04-18T00:00:00Z", "itemId": "t1xk9IyssSA8nP5P", "itemSku": "Qjpzk2Tb7iYdmNZW", "itemType": "osrsVBPZ64j0HUON"}, {"count": 37, "duration": 23, "endDate": "1972-07-11T00:00:00Z", "itemId": "ofwYLQcDvkaEIIPo", "itemSku": "JT83zEGXmVBZLyrH", "itemType": "9J7BoysmaORLkP5h"}, {"count": 4, "duration": 61, "endDate": "1987-03-01T00:00:00Z", "itemId": "UT6KOc4VPDUR9aya", "itemSku": "zqXRqegIUicYXXzx", "itemType": "sBFrUs9BYp6TgCej"}], "name": "Bd5o7iTST7R3KbbQ", "odds": 0.5183981627897005, "type": "REWARD", "weight": 90}, {"lootBoxItems": [{"count": 75, "duration": 79, "endDate": "1996-11-18T00:00:00Z", "itemId": "x25FZfQIodVBqQsB", "itemSku": "pCJBIXLGYcwWVRK6", "itemType": "UKk5ozrXA4HZHNyq"}, {"count": 85, "duration": 29, "endDate": "1989-01-29T00:00:00Z", "itemId": "9j4vxmbH3rVaauuf", "itemSku": "xkPHElug48TgfNu0", "itemType": "rqXUOyToLPIREGIK"}, {"count": 24, "duration": 50, "endDate": "1989-12-03T00:00:00Z", "itemId": "t3EP9kKwkENQ8VOH", "itemSku": "GwbADMfuOmh0lciR", "itemType": "hVZ2DeoODXMzLSrz"}], "name": "oiBnYi5UWs3tYlYe", "odds": 0.6249558464101945, "type": "PROBABILITY_GROUP", "weight": 81}, {"lootBoxItems": [{"count": 58, "duration": 1, "endDate": "1975-04-17T00:00:00Z", "itemId": "NgdY2vfJuje5cPnm", "itemSku": "GjTvYa5Pqx1K7qcA", "itemType": "oijBPAp6EPb988Nz"}, {"count": 48, "duration": 80, "endDate": "1979-12-18T00:00:00Z", "itemId": "DKVpULjjiw3NeVG4", "itemSku": "DJi9DaMrc0WFgKjE", "itemType": "945x2CPVYYG9WvoG"}, {"count": 25, "duration": 52, "endDate": "1984-06-23T00:00:00Z", "itemId": "mvaVV5YfxnUNcwjr", "itemSku": "7gSGhnfuF4WZiQVI", "itemType": "CVpWd3UM08gMXhdf"}], "name": "3juXW4JprIb3CJCA", "odds": 0.3152729500132375, "type": "REWARD", "weight": 91}], "rollFunction": "CUSTOM"}, "maxCount": 59, "maxCountPerUser": 11, "name": "nfaKqdZFLbZEHxsD", "optionBoxConfig": {"boxItems": [{"count": 49, "duration": 9, "endDate": "1971-12-26T00:00:00Z", "itemId": "sSgR43kIDzxBwqRJ", "itemSku": "TzrHNZWUsq5lQo2j", "itemType": "y29EJigqYhyVhURx"}, {"count": 51, "duration": 40, "endDate": "1992-01-31T00:00:00Z", "itemId": "uTw6zQuoZcXQpoTO", "itemSku": "xe8y1jorNsg9ZKYC", "itemType": "KoISyXtHzoWGdYoh"}, {"count": 49, "duration": 59, "endDate": "1990-08-31T00:00:00Z", "itemId": "p3uOQIybqWfG9BJ6", "itemSku": "FVKlbYHtbPtaxvag", "itemType": "SlpGgVTF6VeDAPOG"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 45, "fixedTrialCycles": 46, "graceDays": 8}, "regionData": {"XmRkCEcfHDCdl59W": [{"currencyCode": "p9A3tXGve6DdK6uv", "currencyNamespace": "g8f2cIoByk9fxtvs", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1973-09-11T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1980-07-10T00:00:00Z", "expireAt": "1997-04-26T00:00:00Z", "price": 60, "purchaseAt": "1984-04-10T00:00:00Z", "trialPrice": 27}, {"currencyCode": "kJq1sml5bYt76BNs", "currencyNamespace": "i4giR9434WpKKdzx", "currencyType": "REAL", "discountAmount": 33, "discountExpireAt": "1981-02-11T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1985-01-17T00:00:00Z", "expireAt": "1991-04-05T00:00:00Z", "price": 39, "purchaseAt": "1987-02-25T00:00:00Z", "trialPrice": 30}, {"currencyCode": "rpnMUBsnUfuQIcSb", "currencyNamespace": "Ut5UGkInFGpuUsdt", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1982-01-25T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1991-09-02T00:00:00Z", "expireAt": "1982-06-11T00:00:00Z", "price": 80, "purchaseAt": "1984-09-06T00:00:00Z", "trialPrice": 35}], "SzCEW9dUVhZjLftC": [{"currencyCode": "3sCS8CpLCqPD9CeD", "currencyNamespace": "EdCnnL6Kt1Bjj3b8", "currencyType": "REAL", "discountAmount": 78, "discountExpireAt": "1979-03-18T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1982-05-20T00:00:00Z", "expireAt": "1991-11-23T00:00:00Z", "price": 23, "purchaseAt": "1994-11-03T00:00:00Z", "trialPrice": 22}, {"currencyCode": "qXQgvwD3PsKDJiWx", "currencyNamespace": "QBwaS7rDBf2S54ph", "currencyType": "REAL", "discountAmount": 8, "discountExpireAt": "1972-06-09T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1983-09-22T00:00:00Z", "expireAt": "1987-08-26T00:00:00Z", "price": 79, "purchaseAt": "1981-05-18T00:00:00Z", "trialPrice": 59}, {"currencyCode": "f9GWRlE9hqz6rjDN", "currencyNamespace": "o4rhjxUdMM83Wekq", "currencyType": "REAL", "discountAmount": 100, "discountExpireAt": "1980-06-28T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1998-12-08T00:00:00Z", "expireAt": "1999-06-22T00:00:00Z", "price": 44, "purchaseAt": "1982-04-16T00:00:00Z", "trialPrice": 20}], "9bk5qr8qs2mqtnGA": [{"currencyCode": "qXUjNypF6MMqWpdE", "currencyNamespace": "JsPoaIbYz8cK5jlp", "currencyType": "VIRTUAL", "discountAmount": 7, "discountExpireAt": "1999-05-15T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1973-10-17T00:00:00Z", "expireAt": "1989-06-13T00:00:00Z", "price": 57, "purchaseAt": "1979-08-24T00:00:00Z", "trialPrice": 50}, {"currencyCode": "SwgoViPeIB4Ehy0Y", "currencyNamespace": "5aSJVDginxAM77eY", "currencyType": "REAL", "discountAmount": 59, "discountExpireAt": "1979-01-31T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1987-11-03T00:00:00Z", "expireAt": "1971-02-12T00:00:00Z", "price": 20, "purchaseAt": "1975-01-28T00:00:00Z", "trialPrice": 71}, {"currencyCode": "x1eIba1sB0HsJ06D", "currencyNamespace": "zfbzRYt4OVUyumBe", "currencyType": "REAL", "discountAmount": 33, "discountExpireAt": "1975-01-31T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1993-09-23T00:00:00Z", "expireAt": "1997-06-26T00:00:00Z", "price": 58, "purchaseAt": "1978-02-26T00:00:00Z", "trialPrice": 22}]}, "saleConfig": {"currencyCode": "JFyTNk5FGUPhR4LE", "price": 19}, "seasonType": "TIER", "sectionExclusive": false, "sellable": true, "sku": "sonjj0ZR50BQ1U6a", "stackable": true, "status": "INACTIVE", "tags": ["V5uTcYsoahUrELQ1", "btjJOqQMgZWAU6E9", "2nHJzvw7tnYtGfv0"], "targetCurrencyCode": "EJyjBu4EzwRjD7jm", "targetNamespace": "QJeFPghqamSc5y0X", "thumbnailUrl": "48eT7Mluexk87b9Z", "useCount": 18}' \
    > test.out 2>&1
eval_tap $? 122 'UpdateItem' test.out

#- 123 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'BTsEA3EdmW8saabP' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId '4xRowfNojzPXI2v0' \
    > test.out 2>&1
eval_tap $? 123 'DeleteItem' test.out

#- 124 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'prR3OEey0MkZwS6T' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 41, "orderNo": "wNN3UYhic03qGEg5"}' \
    > test.out 2>&1
eval_tap $? 124 'AcquireItem' test.out

#- 125 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'fNzBVrjo3g8CfRwt' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'yl1HeT7VEPgG40Qy' \
    > test.out 2>&1
eval_tap $? 125 'GetApp' test.out

#- 126 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'XzsOzgck078IghoQ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Bp2mWAOYksczxBS0' \
    --body '{"carousel": [{"alt": "OBCa2vWadLmQtYKm", "previewUrl": "EMzicbuL2S3RiW8d", "thumbnailUrl": "LTCBfGUdVEdvdQL7", "type": "video", "url": "T4hfwkuVykH4Rpfm", "videoSource": "generic"}, {"alt": "OqxH46fRTSZoDdT0", "previewUrl": "fefo74eg3Nt2c0r4", "thumbnailUrl": "GqF0NHglOVuNZ9Lz", "type": "image", "url": "wlZkLhuU5FI8NijF", "videoSource": "youtube"}, {"alt": "byt8b4DGscjwrizs", "previewUrl": "FUgYwbaLvqvQ2Nbm", "thumbnailUrl": "DITuymTBjn3d2sFz", "type": "video", "url": "S3QaVjZF7Ax6115K", "videoSource": "generic"}], "developer": "as9S7ivHEoLbUMM4", "forumUrl": "7f1UreUpxEkXIbE1", "genres": ["Racing", "Strategy", "RPG"], "localizations": {"3koaAfZIim0sFPm1": {"announcement": "YN27bojDVaZLpx4k", "slogan": "EWYkO6KrKUMhJrAS"}, "Bh61hmWKSSrF35an": {"announcement": "DGvur19V18oIrUKX", "slogan": "ttgAI2QdWJFLmoPE"}, "gd8EMspOs8nkic9g": {"announcement": "j5vyUMAAmIHYbsxG", "slogan": "5N066FXb88SbLOa2"}}, "platformRequirements": {"1DiSFsm0XXQJWszv": [{"additionals": "TQEuALzDNp1SZ58a", "directXVersion": "DllwzTRHak1MXxj7", "diskSpace": "Esrg7900nml5Bids", "graphics": "K9dCEzhVnOv0PQbV", "label": "IaKiHfoeorY7A1ot", "osVersion": "GFyv2SMjbEr50qGd", "processor": "CZIc6EFqBKxbS7Q2", "ram": "OgRucL1jwRXzfjDZ", "soundCard": "ZBmOau6syme06c6S"}, {"additionals": "KLc2mEC3IXl5XCbk", "directXVersion": "OfHaGr5kdazlypvt", "diskSpace": "6lSLfU7HByGXPMqx", "graphics": "j4hBgVY3YAxZLKbc", "label": "Odyjqf6Q4oiwoJca", "osVersion": "RMEb15LBlTVufc5Z", "processor": "yODR2NVyn4PRqf3e", "ram": "RbZqBAoKGcVCdMiS", "soundCard": "NV4qBrt1kcLmRv6E"}, {"additionals": "Jtl5xWnsb8oWq94R", "directXVersion": "ImNWVIJnhhwFDV1V", "diskSpace": "itaomvWTzdsW4N70", "graphics": "wYS4Kj7Yi2VvoQNW", "label": "8Yc481dYdvGxJAMD", "osVersion": "RA1LF7jdWlekFwO9", "processor": "4VBCV9qJhWva2FPB", "ram": "ujX0geYCpGJM4sqs", "soundCard": "PNJMiZXXOFwmGWAv"}], "NF0Z0GkwxUNYyNwG": [{"additionals": "iKrknH0Y5mrQgLC6", "directXVersion": "D2qsFiQHglUQMZi5", "diskSpace": "WjMZfOadpgegCUjT", "graphics": "di1Ehr8OtqpNJ9R8", "label": "TuNy4ejmVA3vMCsG", "osVersion": "yPd12B8QNUz0hFFN", "processor": "bH6j2W4roZM2UKAX", "ram": "EEsL5D0oiFchQnVe", "soundCard": "q3g2AB2WIRUQmauI"}, {"additionals": "Y5HXCZ0W4XmWP0Hz", "directXVersion": "SdiylLhVYszm8xY3", "diskSpace": "3OQbumu2QHLyZNuy", "graphics": "syM4OfCzdQCXMAWn", "label": "f87YPNOe9Eevf1fh", "osVersion": "Mg1E2k7QLFrVgtX7", "processor": "y0fPOieDCow2zXyF", "ram": "FVpM87yqEwEacQMT", "soundCard": "lqN4LKkxJ5v3SBaf"}, {"additionals": "nKNiMPbFkFGA85W3", "directXVersion": "HJkqgS2B37wwoPYO", "diskSpace": "HiIsxmsLBPBJuNLn", "graphics": "WRrtW870qD88Zcdu", "label": "ZSe7W20UZcDaiq0n", "osVersion": "EZ7PyhqFJkDClOsK", "processor": "mfsgJdmzsDPsWh1k", "ram": "0cQ08NG6dX2TZkil", "soundCard": "67kRngoUa83ECh1g"}], "qPeS193TNNzot3sV": [{"additionals": "li3GN2XTrFibRAhz", "directXVersion": "zEWzWlTY70qdgJRv", "diskSpace": "pZrSpWX3KEe2BjV0", "graphics": "0ReCXFffjJJxlgjz", "label": "IhpgOoIOD74V21HW", "osVersion": "DAfvXwdxbyp4HAPb", "processor": "BbNPStVBUpKgOssF", "ram": "kz0F36piDYXeHZ7F", "soundCard": "Hls3nyvconqbHQqK"}, {"additionals": "LQKe3xmj6s0GqsWn", "directXVersion": "cp5LrqbiKudv9z75", "diskSpace": "SzoCV8ZMi2o1nR48", "graphics": "2D6gNClk9c87hosa", "label": "PFC5zBW3ZgVZCj9O", "osVersion": "bVGT0Scwl4kNmCi1", "processor": "5XTJTgCNNH7RtG5X", "ram": "mo9Q0Wb07N17fkxZ", "soundCard": "Sc6VbE0AGcekjMNH"}, {"additionals": "uPXtz8tXxrmzafMU", "directXVersion": "guyDoN91uc28HoSp", "diskSpace": "Gt1g0GGbT4Hf2PPK", "graphics": "OldkbgX9CWJKwXXS", "label": "bv5eg9q86IaDFjjx", "osVersion": "6uZerWbtwTX9gNRB", "processor": "yjbE8lOLAfTXKLzb", "ram": "rddqcKLa7LevxNHO", "soundCard": "SEhQRZIp693lRwtc"}]}, "platforms": ["Linux", "MacOS", "Android"], "players": ["LocalCoop", "Single", "MMO"], "primaryGenre": "Sports", "publisher": "uCFxbfbz4aQERziP", "releaseDate": "1990-05-13T00:00:00Z", "websiteUrl": "4dHhOqG5KDdUvk0L"}' \
    > test.out 2>&1
eval_tap $? 126 'UpdateApp' test.out

#- 127 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'Ei26Ls7mjRxNmvvN' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tjJNQepUTGhwlY4l' \
    > test.out 2>&1
eval_tap $? 127 'DisableItem' test.out

#- 128 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'PzlsCR5rVsyfcH7W' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'GetItemDynamicData' test.out

#- 129 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'jP7HuGz3b5WAEvdR' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'F9bqMj4ro5B19VE8' \
    > test.out 2>&1
eval_tap $? 129 'EnableItem' test.out

#- 130 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature '38c7OydVw0zCqoMZ' \
    --itemId 'vpIOO97DmQ5ZOzx6' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iCJTu60IifzMhkk5' \
    > test.out 2>&1
eval_tap $? 130 'FeatureItem' test.out

#- 131 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'PxsjqbCKpMv2Yky9' \
    --itemId 'DYkD2sIllFtBtXJK' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'G3rqBmILhtWm8RQv' \
    > test.out 2>&1
eval_tap $? 131 'DefeatureItem' test.out

#- 132 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'RUbUDSiefGEdLucr' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'tO2gCQD057DrDlgC' \
    --populateBundle  \
    --region '2nzS9SiGUjVAw4v3' \
    --storeId 'q6JRHcn7KaoCEkRd' \
    > test.out 2>&1
eval_tap $? 132 'GetLocaleItem' test.out

#- 133 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'o6qHYIZWnXqQ1oHF' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J9Q0vqsL9SomqWsG' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 21, "code": "6yxi0QzZWfmP2sx0", "comparison": "excludes", "name": "eHv0L2Acm960EYQE", "predicateType": "SeasonTierPredicate", "value": "BrShGbIIuqK8C403", "values": ["k8T4QHK30EX0Fclp", "HgoXCR6XOMXwKdfq", "Dl5HsuracO5Mnjnx"]}, {"anyOf": 61, "code": "6v2AEozWWaYvBLE4", "comparison": "is", "name": "bpuJip8JyxJ39vrt", "predicateType": "SeasonTierPredicate", "value": "mb01yA7U7dGMjupZ", "values": ["pKWtdtdtVW9anENm", "kZQY8CNyT4k3DIbf", "T22G5NpE130YWSgx"]}, {"anyOf": 49, "code": "euLAbBgejqc0apxq", "comparison": "isNot", "name": "209BySn8aUaGlAyv", "predicateType": "StatisticCodePredicate", "value": "slt7N1qcxKs4nlf1", "values": ["MfqUZXkjHvcUOTlx", "Nf09pefgFIiJssSh", "BKsQjXvfQgQDt6ce"]}]}, {"operator": "and", "predicates": [{"anyOf": 80, "code": "4VuY6rsZyo6CBRRn", "comparison": "isGreaterThan", "name": "ewIzTOqKkcjRh3l2", "predicateType": "EntitlementPredicate", "value": "m5TCAU1cKApdJDnE", "values": ["XiXaBzsmaxjTZPlL", "73GLmSZns5owBhoU", "g4LsGP6KLPXkvUv2"]}, {"anyOf": 16, "code": "boMkyB7FTexsOZ0b", "comparison": "isGreaterThan", "name": "OlRGdmXxETLEQrr3", "predicateType": "StatisticCodePredicate", "value": "Xit6boOLGCcg16Dq", "values": ["IyEfRBEj7qms9AGQ", "wdQPQ9HkSSV8e1Mg", "TTLS2FgarY903ING"]}, {"anyOf": 63, "code": "HumyfuBNisecYbcO", "comparison": "isGreaterThanOrEqual", "name": "JfuBs1Vpqn47GVgh", "predicateType": "StatisticCodePredicate", "value": "H2wToOnq9U5lyW89", "values": ["sHezWTqgYPixtHk6", "lWq6tEeUmU96FLEa", "Xwt3wmRTrDCjhnKv"]}]}, {"operator": "and", "predicates": [{"anyOf": 96, "code": "0mJqjRYldcTpdeCD", "comparison": "isLessThan", "name": "XPRi4bAQL7VE2wL8", "predicateType": "SeasonTierPredicate", "value": "4JFVUdzA8bvXlDhG", "values": ["SuopWQbaCvdPSq8Z", "7BrorbKIKuOXJPm5", "ztrr09CDA8Ij5bGK"]}, {"anyOf": 28, "code": "7GpvHCDx55JZ5z6g", "comparison": "isLessThan", "name": "17QPkJHRhmLKQuQV", "predicateType": "StatisticCodePredicate", "value": "SKiXl8G2uf6E8Eaj", "values": ["Xu1bqI2M5PmXfKnQ", "XLSAS8MKMaxQ1QyJ", "CpKedhuzI7G9NCKK"]}, {"anyOf": 57, "code": "rjnkH4ExObppC6CM", "comparison": "includes", "name": "Dm5ge659UDEOF6gp", "predicateType": "StatisticCodePredicate", "value": "UfmjtiVbqJnZcrqr", "values": ["Pye7fCwi7Il2wIFl", "n59tEGm9NYeUT5P0", "Hm9N6owMHMtJy1Oq"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateItemPurchaseCondition' test.out

#- 134 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'nx8TqSZdZ5C8mFI9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "TnvzEqBNMF9CZvPx"}' \
    > test.out 2>&1
eval_tap $? 134 'ReturnItem' test.out

#- 135 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --name 'd4v9k4fv3kMiuQ3D' \
    --offset '14' \
    --tag 'DFjLKFrepy56eW1k' \
    > test.out 2>&1
eval_tap $? 135 'QueryKeyGroups' test.out

#- 136 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "mb15QeIQF51c4MqJ", "name": "zDSvELgBe6dboSdh", "status": "ACTIVE", "tags": ["jBjgq6eY4PBNHKPx", "62tHxDb06ZFy3ugl", "Sp2UxvF2uLXWilRD"]}' \
    > test.out 2>&1
eval_tap $? 136 'CreateKeyGroup' test.out

#- 137 GetKeyGroupByBoothName
eval_tap 0 137 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 138 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId '7HD6LCgdFxRGj00R' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetKeyGroup' test.out

#- 139 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'T6LvcnGMJbJIYLss' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Mvy9gkfTMRrXVRcA", "name": "VRDX6gmDfNfPGYYS", "status": "INACTIVE", "tags": ["BPOKFLxIwKssw647", "YwDudnGRufOUGfMj", "TU226l07jPlcYaqY"]}' \
    > test.out 2>&1
eval_tap $? 139 'UpdateKeyGroup' test.out

#- 140 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'M7YfBmhjI9Y28qVc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetKeyGroupDynamic' test.out

#- 141 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'eS9UX48dKPCFUIey' \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '63' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 141 'ListKeys' test.out

#- 142 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId '4i0N9ytb3c8pVZ8G' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 142 'UploadKeys' test.out

#- 143 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'lU8962e6gtn5pUAR' \
    --limit '72' \
    --offset '79' \
    --orderNos 'oz9BaixUUvmzbajE,2gjooiDnc1NUb51l,EgUwQ9tkWaMOH47C' \
    --sortBy 'AT7cBP0918JaEBQB' \
    --startTime 'P766LUnBBR84iAO7' \
    --status 'DELETED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 143 'QueryOrders' test.out

#- 144 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 144 'GetOrderStatistics' test.out

#- 145 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'K3x76U1EIcklttmr' \
    > test.out 2>&1
eval_tap $? 145 'GetOrder' test.out

#- 146 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'pgF5szl0sMY8es36' \
    --body '{"description": "r1FgR70eNLHkVrEF"}' \
    > test.out 2>&1
eval_tap $? 146 'RefundOrder' test.out

#- 147 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 147 'GetPaymentCallbackConfig' test.out

#- 148 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": false, "notifyUrl": "izL97ycJV5YqE2my", "privateKey": "Qzl7X9fHr6WvBxmB"}' \
    > test.out 2>&1
eval_tap $? 148 'UpdatePaymentCallbackConfig' test.out

#- 149 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 149 'GetPaymentMerchantConfig' test.out

#- 150 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["vNj3ktaDf9B22HGg", "xakPt7IYzaZUTmvs", "EzLPnnGsnfmBerp8"]}' \
    > test.out 2>&1
eval_tap $? 150 'UpdatePaymentDomainWhitelistConfig' test.out

#- 151 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '4qjwzWpCF1vyamjs' \
    --externalId 'EzwtLPxK1os4qR8L' \
    --limit '0' \
    --notificationSource 'ALIPAY' \
    --notificationType 'QzEb39sZTdFfC8x5' \
    --offset '1' \
    --paymentOrderNo 'ihnXKxGxaupnTTq9' \
    --startDate 'ihZkvFKfSHQh8I9x' \
    --status 'IGNORED' \
    > test.out 2>&1
eval_tap $? 151 'QueryPaymentNotifications' test.out

#- 152 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'awNx6yhniEHLbEQK' \
    --limit '4' \
    --offset '16' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 152 'QueryPaymentOrders' test.out

#- 153 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "aUvrKXDIjYC4df9q", "currencyNamespace": "swSlpCI8DhjlxUyr", "customParameters": {"s3OSesE5p0DwUj2H": {}, "KUvPYUcQBxMSdOOs": {}, "n2Nd8Jpa19GJDK46": {}}, "description": "Eehx7xasqMY9auls", "extOrderNo": "L6NOV5agpS6A5mku", "extUserId": "fBpWVxIK9D2bTcga", "itemType": "SEASON", "language": "RC_ALtM-Va", "metadata": {"wWrCQt86Jrg8tLAJ": "WpcyNkUvqn6eXr6F", "NbKJ05Orya6LSSUl": "ugIAknXcSaVYcAYp", "7qSiDvsfMUOpWv46": "sXvpOjrpRo4mYrCe"}, "notifyUrl": "QUnYoID2UqO0iAXA", "omitNotification": false, "platform": "dB4ib8HDOJ8TNiP8", "price": 75, "recurringPaymentOrderNo": "VOXvGSrdkqddI3ez", "region": "qu6FB0sL2xt6fX9j", "returnUrl": "7rhZCAlDlVKBsLZi", "sandbox": true, "sku": "p9A7tcHrV0MbJGr4", "subscriptionId": "drgkDuWS05m0pGza", "targetNamespace": "zM2BUXnzUEWTiKMJ", "targetUserId": "Af6AgbiEDMfCckWo", "title": "gE5gcfF8AMGZ2FBS"}' \
    > test.out 2>&1
eval_tap $? 153 'CreatePaymentOrderByDedicated' test.out

#- 154 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId '93Mg6TKwdRMraDLr' \
    > test.out 2>&1
eval_tap $? 154 'ListExtOrderNoByExtTxId' test.out

#- 155 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'wh3d0ykRGkgqUNIb' \
    > test.out 2>&1
eval_tap $? 155 'GetPaymentOrder' test.out

#- 156 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'JMJ9ABbKVWO2YEDi' \
    --body '{"extTxId": "qkwKbpdk7wlDngNi", "paymentMethod": "PPjpSAlZwFGpea5O", "paymentProvider": "ADYEN"}' \
    > test.out 2>&1
eval_tap $? 156 'ChargePaymentOrder' test.out

#- 157 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'dbYCRexPekTsQxMT' \
    --body '{"description": "faSot7aohFYy4Vxw"}' \
    > test.out 2>&1
eval_tap $? 157 'RefundPaymentOrderByDedicated' test.out

#- 158 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'HIJ9gzxqAw4vBGQA' \
    --body '{"amount": 8, "currencyCode": "eDLYEzs2SQUdKr6v", "notifyType": "CHARGE", "paymentProvider": "PAYPAL", "salesTax": 72, "vat": 21}' \
    > test.out 2>&1
eval_tap $? 158 'SimulatePaymentOrderNotification' test.out

#- 159 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '9lsQFD43Df5qUZOF' \
    > test.out 2>&1
eval_tap $? 159 'GetPaymentOrderChargeStatus' test.out

#- 160 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'zpFd6b5Jc5TETHcu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "p8GG0VCMTFJ6svTy", "serviceLabel": 30}' \
    > test.out 2>&1
eval_tap $? 160 'GetPsnEntitlementOwnership' test.out

#- 161 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'bBb0n1JhPUS8BRPG' \
    --body '{"delegationToken": "V9n769zLJdKMexeJ", "sandboxId": "c7NvgTSgKjCxZjKf"}' \
    > test.out 2>&1
eval_tap $? 161 'GetXboxEntitlementOwnership' test.out

#- 162 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 162 'GetPlatformEntitlementConfig' test.out

#- 163 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    --body '{"allowedPlatformOrigins": ["Other", "Epic", "Oculus"]}' \
    > test.out 2>&1
eval_tap $? 163 'UpdatePlatformEntitlementConfig' test.out

#- 164 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    > test.out 2>&1
eval_tap $? 164 'GetPlatformWalletConfig' test.out

#- 165 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    --body '{"allowedBalanceOrigins": ["Epic", "Steam", "Playstation"]}' \
    > test.out 2>&1
eval_tap $? 165 'UpdatePlatformWalletConfig' test.out

#- 166 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 166 'ResetPlatformWalletConfig' test.out

#- 167 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'GetRevocationConfig' test.out

#- 168 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "CUSTOM"}}, "wallet": {"enabled": true, "strategy": "ALWAYS_REVOKE"}}' \
    > test.out 2>&1
eval_tap $? 168 'UpdateRevocationConfig' test.out

#- 169 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 169 'DeleteRevocationConfig' test.out

#- 170 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime '0EKrk5VlnKsWCPcc' \
    --limit '54' \
    --offset '95' \
    --source 'IAP' \
    --startTime 'n5CEPoH6opK5DSO8' \
    --status 'SUCCESS' \
    --transactionId 'wqd5priclNNqLyrl' \
    --userId 'zrJ4QHbfnAdtkujx' \
    > test.out 2>&1
eval_tap $? 170 'QueryRevocationHistories' test.out

#- 171 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 171 'GetRevocationPluginConfig' test.out

#- 172 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "Hff7n1yaNCcjgFhS"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "Bhl0L5FCbOn46W2B"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 172 'UpdateRevocationPluginConfig' test.out

#- 173 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 173 'DeleteRevocationPluginConfig' test.out

#- 174 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 174 'UploadRevocationPluginConfigCert' test.out

#- 175 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "uPQLrt2t6bVpCgKv", "eventTopic": "PXSDufmKh783cV54", "maxAwarded": 72, "maxAwardedPerUser": 67, "namespaceExpression": "sVBRB0rY0xfWddAC", "rewardCode": "yHSmo4KX9TPO3K1k", "rewardConditions": [{"condition": "5ZM8btmGsgXNXbpq", "conditionName": "xh76Af5JSwjw2fE2", "eventName": "g6jXV7oai2oDm9Fa", "rewardItems": [{"duration": 86, "endDate": "1980-10-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "98tE4UyoQg0b0sGO", "quantity": 21, "sku": "ztprSfW9OutADrNG"}, {"duration": 57, "endDate": "1992-06-13T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "zQKxVmRTawjiZPMo", "quantity": 49, "sku": "ZcyGEHxAKDQher3u"}, {"duration": 38, "endDate": "1989-07-31T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "pPdJPn9eIdhIBvTT", "quantity": 41, "sku": "HWkcVk0X28GS54vl"}]}, {"condition": "7gIKBc7OYTylFRAJ", "conditionName": "KySnC0cfPl3Z2zSB", "eventName": "bs4PAV72u8AxE2IQ", "rewardItems": [{"duration": 9, "endDate": "1983-05-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "kyqyKgrtEPdXXlt8", "quantity": 13, "sku": "ctuVaqPJGAHEZmuQ"}, {"duration": 35, "endDate": "1975-01-01T00:00:00Z", "identityType": "ITEM_ID", "itemId": "aQ4OZ2nDodm4TNs8", "quantity": 25, "sku": "bXzWnVO2U4uyzZo1"}, {"duration": 36, "endDate": "1991-03-15T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "0ZrLQjk4VoYfIkst", "quantity": 15, "sku": "SqTfmAVg50kOdJag"}]}, {"condition": "EmTuaxlxgywkbdOs", "conditionName": "yxX1tfW488oYUT4j", "eventName": "yCVJ0V8obTlGVThz", "rewardItems": [{"duration": 2, "endDate": "1999-04-08T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "41oIcV33yjPxibDj", "quantity": 12, "sku": "jNPTXA3qbg55Syie"}, {"duration": 28, "endDate": "1981-08-18T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "U6KRIm5xBoIi99ct", "quantity": 12, "sku": "8tlkxWKCU1XN4gl7"}, {"duration": 51, "endDate": "1998-09-26T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "vEqpJSrDXVwCkhOQ", "quantity": 88, "sku": "61TFjROYJm75VIuC"}]}], "userIdExpression": "OCkt2W1DfI8QtgOD"}' \
    > test.out 2>&1
eval_tap $? 175 'CreateReward' test.out

#- 176 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'k9K6DcMnyCPn1Fyl' \
    --limit '99' \
    --offset '61' \
    --sortBy 'namespace' \
    > test.out 2>&1
eval_tap $? 176 'QueryRewards' test.out

#- 177 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 177 'ExportRewards' test.out

#- 178 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 178 'ImportRewards' test.out

#- 179 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'NV1VaZTkbbuWiiA4' \
    > test.out 2>&1
eval_tap $? 179 'GetReward' test.out

#- 180 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'UTDgS2SVEo5M80LL' \
    --body '{"description": "bku9GYH4ijqOVM50", "eventTopic": "tCqkZfsSxAbDJ7sH", "maxAwarded": 57, "maxAwardedPerUser": 78, "namespaceExpression": "Mjml6BpCODWGOLMm", "rewardCode": "CZUeelXYyNrXweiC", "rewardConditions": [{"condition": "nDldRPRfd6mLZ0GT", "conditionName": "JwEjoZrRtaeWKMC8", "eventName": "wsOByQAMAgqFEzEt", "rewardItems": [{"duration": 46, "endDate": "1981-09-07T00:00:00Z", "identityType": "ITEM_ID", "itemId": "LCY2vIddlxnA1Vyn", "quantity": 17, "sku": "C2ecnpUDqvLQixPK"}, {"duration": 97, "endDate": "1982-04-30T00:00:00Z", "identityType": "ITEM_ID", "itemId": "Y4jWH9dFmOHW0j9s", "quantity": 41, "sku": "M7ixq8Tjnxp5Cl8g"}, {"duration": 14, "endDate": "1977-01-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Oia336uiiMTAduct", "quantity": 45, "sku": "sO6EyVqstpgZpbz7"}]}, {"condition": "7y88rUFum2ZcA8iK", "conditionName": "cF0bkfjcTEFXcTwE", "eventName": "tnHxP5pVtN4jNVId", "rewardItems": [{"duration": 35, "endDate": "1971-06-21T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "EA39uCJzsE8WObt6", "quantity": 39, "sku": "jUK8GeX4Q0B2Cj0o"}, {"duration": 83, "endDate": "1996-04-07T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "09l4wkrzahXR1sDE", "quantity": 60, "sku": "j2isN7bRwcr16lW5"}, {"duration": 46, "endDate": "1976-02-23T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "ZpjlMMtPWg8217m7", "quantity": 34, "sku": "aDa9PDwhu31d8eOd"}]}, {"condition": "trfq6ECDD6OGkuLs", "conditionName": "9gNpNon6DKW9A6Am", "eventName": "nQTNFidImWONTvCP", "rewardItems": [{"duration": 80, "endDate": "1979-09-26T00:00:00Z", "identityType": "ITEM_ID", "itemId": "LdbYEknHPKrZ7TiN", "quantity": 56, "sku": "tPK4fVHLMvrCsH3R"}, {"duration": 73, "endDate": "1983-01-20T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "2Up9VthPjFrK7Hip", "quantity": 9, "sku": "73TdtWjfVciuLnLs"}, {"duration": 56, "endDate": "1990-08-04T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "pcwJd4SrigIxAhbF", "quantity": 80, "sku": "08zaP0wpZgQEvFzo"}]}], "userIdExpression": "x9wHocX3DRWobEoG"}' \
    > test.out 2>&1
eval_tap $? 180 'UpdateReward' test.out

#- 181 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'r8W97KBedcr6PM51' \
    > test.out 2>&1
eval_tap $? 181 'DeleteReward' test.out

#- 182 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'z7i0wQ9egK2t46EG' \
    --body '{"payload": {"8I2lTviKbOgVuN3n": {}, "hkn6QIesNoYqvVsa": {}, "kylHikKkpOjqwgKv": {}}}' \
    > test.out 2>&1
eval_tap $? 182 'CheckEventCondition' test.out

#- 183 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'fXXs8pDqm31AZSRk' \
    --body '{"conditionName": "uw6q8FgqG46RsFK7", "userId": "eYlSU3vYcHZZjFeg"}' \
    > test.out 2>&1
eval_tap $? 183 'DeleteRewardConditionRecord' test.out

#- 184 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'VnZOn0tk4IATSIef' \
    --limit '4' \
    --offset '96' \
    --start 'qNEn4IZ0Dv6b8Wta' \
    --storeId 'MVvLbG04KKnh3jvW' \
    --viewId '0Qp3kTyL4CsLwiWU' \
    > test.out 2>&1
eval_tap $? 184 'QuerySections' test.out

#- 185 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Mcpxn4B6XoTNMuqZ' \
    --body '{"active": true, "displayOrder": 68, "endDate": "1987-07-05T00:00:00Z", "ext": {"drpNELM8Lfkut0wn": {}, "T24wh59RGSbBMh7j": {}, "pszuVk6iPdJ2boQq": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 58, "itemCount": 60, "rule": "SEQUENCE"}, "items": [{"id": "g4FcDwBGyBiHewZk", "sku": "wEeuzBBRSknxyWkZ"}, {"id": "Obuvig8sMuss76ez", "sku": "TrsDZNYUV48Oh6I4"}, {"id": "5X7HvUtPYONZdFk7", "sku": "5lkjQNHrjaboGomg"}], "localizations": {"uUqeuZh5qtrRbNnG": {"description": "ejdTGvZgN5hshSe5", "localExt": {"YmZXKEQLkM6o3eGS": {}, "P4Htmr90TqGf0Oyq": {}, "J9ibJMmRgoxNwp1l": {}}, "longDescription": "GkYoq8HP1TM0tefV", "title": "QPWX1NPO5Wn7rNG8"}, "rGp7Fadvo5EzpX0I": {"description": "ttsRezyY9GB5sf94", "localExt": {"ALBmvdncQkcZb8cW": {}, "dVH9bww15zZsaYrJ": {}, "Ae5Kd5QB96ndlO6i": {}}, "longDescription": "PGC9RhzMC7V8BEph", "title": "nRXnSpCzyb8FkoxQ"}, "brPngi87K58pQswq": {"description": "KLutINusOsa92F6i", "localExt": {"wkJIYOLarmpWyvib": {}, "9CDW21ANrlpuXD9H": {}, "1u1CvzWPcZwkj1l6": {}}, "longDescription": "bf2F9EXOBj7v8LHY", "title": "ivmD0ekycMKlwJTN"}}, "name": "L2UCWUtaAD7ZZx1i", "rotationType": "CUSTOM", "startDate": "1990-02-11T00:00:00Z", "viewId": "vWFsXHtMP0k9L5dR"}' \
    > test.out 2>&1
eval_tap $? 185 'CreateSection' test.out

#- 186 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EQbCqfh0gpABFBER' \
    > test.out 2>&1
eval_tap $? 186 'PurgeExpiredSection' test.out

#- 187 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '6WNcDOsRzBkf9A6H' \
    --storeId 'jCnFRdSihcvszzQL' \
    > test.out 2>&1
eval_tap $? 187 'GetSection' test.out

#- 188 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'ZBktk0siMup01kya' \
    --storeId 'FwwD7wecuQb4GNQH' \
    --body '{"active": true, "displayOrder": 80, "endDate": "1990-09-07T00:00:00Z", "ext": {"KGBnzh4suaGIzttT": {}, "ncVBf5g3oeuHiNyL": {}, "kfPQPmjUkvSs5YmI": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 85, "itemCount": 19, "rule": "SEQUENCE"}, "items": [{"id": "ozmG5HlrIfMAvvpk", "sku": "AHRJHZyfrXZmiJX4"}, {"id": "CjKCeIRIr997KKpJ", "sku": "XTLbYWpqeXjaf1f5"}, {"id": "fjNMZjKJ05puX319", "sku": "7WrMnJtovSMFw8X4"}], "localizations": {"zxbdfXgunt1oMNZ6": {"description": "8eovHSH3xV3URIRV", "localExt": {"DYBd6hMB0l7sg7If": {}, "MH5Tu1ky1ZYvyeHm": {}, "foFkUDP864shbnQ3": {}}, "longDescription": "bVvuvpsDJXPCWkX4", "title": "Kpi8CJ88aMPGFFAQ"}, "ZbfbmVTEbiRq5Jui": {"description": "kmpat75rVbN9ZBtz", "localExt": {"J33tCwv8H1f451FV": {}, "Z630HNBYZSrz7pMj": {}, "ESLLMPKDXLki6Oz5": {}}, "longDescription": "Bygt8Q0RjSf1srB7", "title": "hGwGbUmQmJHNffZE"}, "Ns9X0hFMdzryvhc1": {"description": "YjHmmulSBIElc2Cd", "localExt": {"RvBb0aGnMt625bWH": {}, "b5sbX6asrjV7XJUO": {}, "tHlzXNHEPpzlMlx7": {}}, "longDescription": "b2H2THLwZGikW7TF", "title": "A9gE6SrYKq6lcVOh"}}, "name": "PJIcEHbiKHW7flVo", "rotationType": "CUSTOM", "startDate": "1983-08-02T00:00:00Z", "viewId": "aaeP3Wd0Wrb8s3GW"}' \
    > test.out 2>&1
eval_tap $? 188 'UpdateSection' test.out

#- 189 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '0CY0vAfbq8xoCurq' \
    --storeId '4lpHXrbVBh60NUA2' \
    > test.out 2>&1
eval_tap $? 189 'DeleteSection' test.out

#- 190 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 190 'ListStores' test.out

#- 191 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "aKQwnXrmi6ya8u4s", "defaultRegion": "QPvaf1AcweR7tJW3", "description": "MLMob1hUnIzIpUM8", "supportedLanguages": ["KK1kGFN0NUNGKxdl", "AUDFQuGPzAuT7M6O", "BrNwioKnXPVZaDcX"], "supportedRegions": ["sV1TnsZioDiBgprz", "ahPB0FKMa0YeyNBQ", "WUHDBnBeePkqg6Zt"], "title": "1Lr5BlO8K6LH4dSa"}' \
    > test.out 2>&1
eval_tap $? 191 'CreateStore' test.out

#- 192 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'APP' \
    > test.out 2>&1
eval_tap $? 192 'GetCatalogDefinition' test.out

#- 193 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 193 'DownloadCSVTemplates' test.out

#- 194 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "SECTION", "fieldsToBeIncluded": ["8XYHug51ZTogG0N7", "Hvnuq1kJ1kpHcQtn", "Ic9z70LFQMI0oZuE"], "idsToBeExported": ["jY0rNBbbB9txAvtR", "QvqJacXR2Rf4noXD", "FaEUkPUBnB0ZEJH3"], "storeId": "ebM71Tg922xiBgHS"}' \
    > test.out 2>&1
eval_tap $? 194 'ExportStoreByCSV' test.out

#- 195 ImportStore
eval_tap 0 195 'ImportStore # SKIP deprecated' test.out

#- 196 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 196 'GetPublishedStore' test.out

#- 197 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 197 'DeletePublishedStore' test.out

#- 198 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 198 'GetPublishedStoreBackup' test.out

#- 199 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 199 'RollbackPublishedStore' test.out

#- 200 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ka0Pz7I1WkIa0oZ1' \
    > test.out 2>&1
eval_tap $? 200 'GetStore' test.out

#- 201 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nXpW1l70pcZgIn4l' \
    --body '{"defaultLanguage": "PghHyMEHBzArbyW1", "defaultRegion": "0NkJFQxuMHnfOlX6", "description": "HYVEiaereFCPJU2w", "supportedLanguages": ["EzUYUTmZ8JSMeNmR", "ocp400RZe8Bzx9aG", "EI22BTCZs97TJI8G"], "supportedRegions": ["PrM24F3celFgM62H", "QtgzQhO3nR8j8DlP", "6OGbn8vmfMYGLt1A"], "title": "jKhh3JMX7xSrz1EH"}' \
    > test.out 2>&1
eval_tap $? 201 'UpdateStore' test.out

#- 202 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '6X2SM3xzsNrJzWBc' \
    > test.out 2>&1
eval_tap $? 202 'DeleteStore' test.out

#- 203 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dFlo7oAsOlfLB1J1' \
    --action 'CREATE' \
    --itemSku 'b5rTfiL2P3r1a8KI' \
    --itemType 'SEASON' \
    --limit '70' \
    --offset '69' \
    --selected  \
    --sortBy 'updatedAt:desc,createdAt:desc,updatedAt:asc' \
    --status 'PUBLISHED' \
    --type 'VIEW' \
    --updatedAtEnd 'KkPuWD59MgTy1HA5' \
    --updatedAtStart '8Jt5NaROjSKFEuZo' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 203 'QueryChanges' test.out

#- 204 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '2ElXYSS4ezBRSiOy' \
    > test.out 2>&1
eval_tap $? 204 'PublishAll' test.out

#- 205 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ReviDaxlPdhwmcH0' \
    > test.out 2>&1
eval_tap $? 205 'PublishSelected' test.out

#- 206 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '3yoMxzRR6xd9rTh3' \
    > test.out 2>&1
eval_tap $? 206 'SelectAllRecords' test.out

#- 207 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ureaIbxM3Wev9pZQ' \
    --action 'CREATE' \
    --itemSku 'n3R2wo8beVQvgeP9' \
    --itemType 'EXTENSION' \
    --selected  \
    --type 'VIEW' \
    --updatedAtEnd 'OHaLwYnXxrz7sLmP' \
    --updatedAtStart '70LxN0f3JA27Qz5S' \
    > test.out 2>&1
eval_tap $? 207 'SelectAllRecordsByCriteria' test.out

#- 208 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jzQfOLYu9O46OOzz' \
    --action 'DELETE' \
    --itemSku 'p57qSpHerzO87cg7' \
    --itemType 'EXTENSION' \
    --type 'SECTION' \
    --updatedAtEnd 'wZXQZZrSsuYiIPei' \
    --updatedAtStart '0pXglJYnKkoCAZuo' \
    > test.out 2>&1
eval_tap $? 208 'GetStatistic' test.out

#- 209 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lAWnxkImVbDP0QX3' \
    > test.out 2>&1
eval_tap $? 209 'UnselectAllRecords' test.out

#- 210 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId '1gI7VmnGIRMvXe6B' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iphIFe2bzr6qQw6f' \
    > test.out 2>&1
eval_tap $? 210 'SelectRecord' test.out

#- 211 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'SESkM19OPMBb12gp' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mShlmIt2nfhUaZGq' \
    > test.out 2>&1
eval_tap $? 211 'UnselectRecord' test.out

#- 212 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jslu59GT2E6AacmZ' \
    --targetStoreId 'RXZm626POXWVj3KP' \
    > test.out 2>&1
eval_tap $? 212 'CloneStore' test.out

#- 213 ExportStore
eval_tap 0 213 'ExportStore # SKIP deprecated' test.out

#- 214 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId '1mX0iYHXBU3Uk2tQ' \
    --end 'm307IORTyHnLYDAA' \
    --limit '13' \
    --offset '18' \
    --sortBy 'YA4kZURmoGgxVRMP' \
    --start 'f8g1rbhfIMStMnSq' \
    --success  \
    > test.out 2>&1
eval_tap $? 214 'QueryImportHistory' test.out

#- 215 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rKWYOuITlYS2RYaD' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes '9WNKGhbLhjz1v0RB' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 215 'ImportStoreByCSV' test.out

#- 216 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'SETUP' \
    --itemId 'wqgJs6O0Qj0ccMkd' \
    --limit '52' \
    --offset '73' \
    --sku '6zPz3BVHAqp4O9XS' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    --userId 'VZZbKFsKOmgEhjH2' \
    > test.out 2>&1
eval_tap $? 216 'QuerySubscriptions' test.out

#- 217 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'wFzCpxxJLfAg5cFT' \
    > test.out 2>&1
eval_tap $? 217 'RecurringChargeSubscription' test.out

#- 218 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName '0gHAkltcR3eHFbiA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 218 'GetTicketDynamic' test.out

#- 219 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'luHv7Hssd05pHBJX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "5ln8PZbYVD8RiaTs"}' \
    > test.out 2>&1
eval_tap $? 219 'DecreaseTicketSale' test.out

#- 220 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'dD4d3kSbTkHPMUvO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 220 'GetTicketBoothID' test.out

#- 221 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'AUXkw36cr2WJQqS7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 94, "orderNo": "94Jy6yCSXBqJqjAb"}' \
    > test.out 2>&1
eval_tap $? 221 'IncreaseTicketSale' test.out

#- 222 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Epic", "count": 47, "currencyCode": "NvpWf32JS1av9VNp", "expireAt": "1995-11-04T00:00:00Z"}, "debitPayload": {"count": 93, "currencyCode": "06ERSVy5M3rrkxu0", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 54, "entitlementCollectionId": "h9gCNVZxHGxhZqNX", "entitlementOrigin": "Twitch", "itemIdentity": "rHuKBoNTpPQXDNHt", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 36, "entitlementId": "74GcmVf0fbCU9QdP"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 100, "currencyCode": "NF2hm0TqBQprHn3w", "expireAt": "1975-08-11T00:00:00Z"}, "debitPayload": {"count": 86, "currencyCode": "mDxP23qstMuikKc6", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 80, "entitlementCollectionId": "hr1BHh1arZAyuLcZ", "entitlementOrigin": "Nintendo", "itemIdentity": "0JOQxWeHypqCWMDP", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 70, "entitlementId": "0gdWoE4esuiDrquc"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Other", "count": 53, "currencyCode": "E0cXokXbwKDtVmrY", "expireAt": "1993-03-26T00:00:00Z"}, "debitPayload": {"count": 42, "currencyCode": "nvPcJkjRevVYfiEx", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 96, "entitlementCollectionId": "AgoK9YDq1x3dkbJF", "entitlementOrigin": "Steam", "itemIdentity": "GV01vD7lNLxlpvqa", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 37, "entitlementId": "9P9GaukfCEIeSBLh"}, "type": "DEBIT_WALLET"}], "userId": "fzigzHcRuJgYaj4I"}, {"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 60, "currencyCode": "rL6TsJeRcE7GuwKn", "expireAt": "1990-10-27T00:00:00Z"}, "debitPayload": {"count": 71, "currencyCode": "1fjzknv2HZMIL2P2", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 74, "entitlementCollectionId": "h14LroFTnAuujPeP", "entitlementOrigin": "Xbox", "itemIdentity": "U7fj6w17arNs12hO", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 42, "entitlementId": "LVM7UFnuJDzeEkDx"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 97, "currencyCode": "yJtnbTDXu7FbleSP", "expireAt": "1982-12-07T00:00:00Z"}, "debitPayload": {"count": 98, "currencyCode": "cdOuq0m0rvakR8rc", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 35, "entitlementCollectionId": "ojLRjhcaJ56nGlYZ", "entitlementOrigin": "Other", "itemIdentity": "ZxC6yYUVUJYnQ3jO", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 65, "entitlementId": "ROIqxqQ0gcNeTfly"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Other", "count": 95, "currencyCode": "W0UGJpwQZlXuzu3m", "expireAt": "1987-06-15T00:00:00Z"}, "debitPayload": {"count": 39, "currencyCode": "7JjCDwg186hGWKfO", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 27, "entitlementCollectionId": "EpAJMCxMp2J0hDg2", "entitlementOrigin": "IOS", "itemIdentity": "cBKtU956hOg8oukD", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 6, "entitlementId": "E7M36mI9u3EeZtLQ"}, "type": "DEBIT_WALLET"}], "userId": "zCqUgq1gLbcIMevT"}, {"operations": [{"creditPayload": {"balanceOrigin": "Nintendo", "count": 34, "currencyCode": "C631p7q794bu49lI", "expireAt": "1991-03-23T00:00:00Z"}, "debitPayload": {"count": 65, "currencyCode": "WMSUbqByWN2BCnRz", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 2, "entitlementCollectionId": "nur0B9jKaunAcyls", "entitlementOrigin": "Epic", "itemIdentity": "dj8tsyzC4QaLXp3o", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 94, "entitlementId": "Da1I4lwXqwPfq3Vz"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 44, "currencyCode": "tolx64w1gyvjacKt", "expireAt": "1987-11-04T00:00:00Z"}, "debitPayload": {"count": 35, "currencyCode": "ulzp3sZxImVK5yh2", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 23, "entitlementCollectionId": "M8LaMW0ByjsRUrAH", "entitlementOrigin": "Xbox", "itemIdentity": "q1cT88H6RCW8gJmG", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 76, "entitlementId": "DlqxtLsR2AGOiPhN"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 87, "currencyCode": "IdH8aYYUT6mma833", "expireAt": "1994-08-24T00:00:00Z"}, "debitPayload": {"count": 35, "currencyCode": "zk66ix88sAUrXr7M", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 48, "entitlementCollectionId": "4KV104MtMhKHmSjq", "entitlementOrigin": "Xbox", "itemIdentity": "NlxiEjQBCZx9DJ4V", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 90, "entitlementId": "ulLg4bsO4YHEYLjT"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "x4rV4CXVMrDYKe2e"}], "metadata": {"Tf1axo16GqT2vSLL": {}, "iMvcu39YZJypWzpN": {}, "XgnoKIz8O8NglJtZ": {}}, "needPreCheck": false, "transactionId": "h280vflFMxIhlIT8", "type": "AgyZJ16MMd2bzOrT"}' \
    > test.out 2>&1
eval_tap $? 222 'Commit' test.out

#- 223 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '46' \
    --status 'FAILED' \
    --type '1i5Mf7WvbNSeeDNf' \
    --userId 'UESLlwHv3JgteOLy' \
    > test.out 2>&1
eval_tap $? 223 'GetTradeHistoryByCriteria' test.out

#- 224 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'Kp8a1VqxXnRhDd9T' \
    > test.out 2>&1
eval_tap $? 224 'GetTradeHistoryByTransactionId' test.out

#- 225 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'GkO6aIYqftw1SrM2' \
    --body '{"achievements": [{"id": "nhSEanfUYrMU6A43", "value": 96}, {"id": "62CtetBW3pvAJJie", "value": 68}, {"id": "uTWchzXDv3TAtBjP", "value": 44}], "steamUserId": "HSuiYCbG0UyYUJmN"}' \
    > test.out 2>&1
eval_tap $? 225 'UnlockSteamUserAchievement' test.out

#- 226 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'L8p6AbdtU0CDrlQp' \
    --xboxUserId 'KB8qoel2QK3aSOYd' \
    > test.out 2>&1
eval_tap $? 226 'GetXblUserAchievements' test.out

#- 227 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'mMDikc3Fjm9HoQDe' \
    --body '{"achievements": [{"id": "mtiQvURYZCeF30RT", "percentComplete": 1}, {"id": "rBgM8o7lxXq7TkdM", "percentComplete": 64}, {"id": "zkCl1ZKuPxjDUGRG", "percentComplete": 5}], "serviceConfigId": "LQo6tHj4z4cAM4LM", "titleId": "JfWNZIxAgBpeubpr", "xboxUserId": "KX68jTyRd3LrR1x6"}' \
    > test.out 2>&1
eval_tap $? 227 'UpdateXblUserAchievement' test.out

#- 228 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'U1v6zSLjm9zmzUW0' \
    > test.out 2>&1
eval_tap $? 228 'AnonymizeCampaign' test.out

#- 229 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'vPj90jmLTt5YQGaw' \
    > test.out 2>&1
eval_tap $? 229 'AnonymizeEntitlement' test.out

#- 230 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'comPoiYoQ1f1AYq3' \
    > test.out 2>&1
eval_tap $? 230 'AnonymizeFulfillment' test.out

#- 231 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId '06Pysv4VPaZWolXy' \
    > test.out 2>&1
eval_tap $? 231 'AnonymizeIntegration' test.out

#- 232 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'pwucUqqqff2iWi4y' \
    > test.out 2>&1
eval_tap $? 232 'AnonymizeOrder' test.out

#- 233 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'P3uqNcig6YcDA8Z3' \
    > test.out 2>&1
eval_tap $? 233 'AnonymizePayment' test.out

#- 234 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'g62oGYwkrjLI4EHJ' \
    > test.out 2>&1
eval_tap $? 234 'AnonymizeRevocation' test.out

#- 235 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'EEWgki9fbdvUMDZe' \
    > test.out 2>&1
eval_tap $? 235 'AnonymizeSubscription' test.out

#- 236 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'O4U55wdCpVpnENiT' \
    > test.out 2>&1
eval_tap $? 236 'AnonymizeWallet' test.out

#- 237 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'c9NESV22eRBElD4K' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 237 'GetUserDLCByPlatform' test.out

#- 238 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cy1tJcPAEkCeV29Q' \
    --includeAllNamespaces  \
    --status 'REVOKED' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 238 'GetUserDLC' test.out

#- 239 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'k100eu5UcxuXXpt0' \
    --activeOnly  \
    --appType 'GAME' \
    --collectionId 'SPX04uEIdAwgDobo' \
    --entitlementClazz 'CODE' \
    --entitlementName 'ddLWJWDuSYtCaIv4' \
    --features 'Lp91wYUJPbvzn8TY,oMDAaUXSuBQdvdhJ,oT0WK5ngNUxDKfZY' \
    --fuzzyMatchName  \
    --itemId 'ofPGUbSaA00nKxQj,YU6KlavIiLxU2I1G,yJS48Hxu8Ju4XSAn' \
    --limit '23' \
    --offset '11' \
    --origin 'Xbox' \
    > test.out 2>&1
eval_tap $? 239 'QueryUserEntitlements' test.out

#- 240 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'YB9BgSZBvkehRn83' \
    --body '[{"collectionId": "B0nrW1qx3NJTugVW", "endDate": "1996-07-28T00:00:00Z", "grantedCode": "Dw6mLBordrJkD6vy", "itemId": "60uRMT1Xw9K9Yb68", "itemNamespace": "a8ygYx2TqkhlqMnE", "language": "KayI_aopI", "origin": "Epic", "quantity": 99, "region": "rWnLrXqImgDf3GaJ", "source": "PROMOTION", "startDate": "1988-01-26T00:00:00Z", "storeId": "gLZ4YIzElrLZOBLH"}, {"collectionId": "CKmLBaIwlokbAFW8", "endDate": "1993-02-14T00:00:00Z", "grantedCode": "G5NkKCySLA8cKCs0", "itemId": "dFYRSa2OULZ0iOZJ", "itemNamespace": "iOAh1SpLhMF2Pav1", "language": "gk_IVzA-qQ", "origin": "Nintendo", "quantity": 13, "region": "Ih2iaIBpYC4txul6", "source": "OTHER", "startDate": "1989-01-09T00:00:00Z", "storeId": "YlNYYlHPwKDpJmke"}, {"collectionId": "oAkp3Z4pgyJYwclb", "endDate": "1982-02-19T00:00:00Z", "grantedCode": "KftVqSECsypS42Nm", "itemId": "YQ8HlHbHnfs4tLVO", "itemNamespace": "YQCWMktmiKd9vLPP", "language": "Xv-dgYQ", "origin": "Steam", "quantity": 29, "region": "qWrpkWnnova15WVu", "source": "REFERRAL_BONUS", "startDate": "1973-01-20T00:00:00Z", "storeId": "51PbK2MFKvw5TWjA"}]' \
    > test.out 2>&1
eval_tap $? 240 'GrantUserEntitlement' test.out

#- 241 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'h4gy41LLzQ2IjY5P' \
    --activeOnly  \
    --appId 'eNr4JmYxH2qs28he' \
    > test.out 2>&1
eval_tap $? 241 'GetUserAppEntitlementByAppId' test.out

#- 242 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'PJjMp0TKKUBfPNI9' \
    --activeOnly  \
    --limit '12' \
    --offset '17' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 242 'QueryUserEntitlementsByAppType' test.out

#- 243 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'iTObNdqkWa13g3pg' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --platform 'h5QWxuQuI7gdDTDb' \
    --itemId '3WdnOpzTrRzCCafA' \
    > test.out 2>&1
eval_tap $? 243 'GetUserEntitlementByItemId' test.out

#- 244 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'DJfWBspT3MLwJZqu' \
    --ids 'MQSPp5XD4S1ilfgf,f7Et4uY8nlBwGNHg,fgwZwVMvshGmsg6Z' \
    --platform 'JYnkHDnHTlRugM7a' \
    > test.out 2>&1
eval_tap $? 244 'GetUserActiveEntitlementsByItemIds' test.out

#- 245 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '2UZgeesipbP027ok' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --platform 'cHADYpS861c0CJ7L' \
    --sku 'zpFvOSF6xKA6yrnv' \
    > test.out 2>&1
eval_tap $? 245 'GetUserEntitlementBySku' test.out

#- 246 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'XY5dDwneac75C6S2' \
    --appIds 'eHsH4Y84hL75QboM,HCtzEF9FSeg6WYgt,fuqJHrs4e3RnWR30' \
    --itemIds 'MdBZezfwc3H0qSbM,q4GLj8aGsH0qE5p6,01ak59yFSfdZIv8o' \
    --platform 'YWPUS4Zu0SbTt6M2' \
    --skus 'XizikCh6q0yq2WAH,tL7IWE3MFqvfDG5j,vMOaXrDlEX42U0sy' \
    > test.out 2>&1
eval_tap $? 246 'ExistsAnyUserActiveEntitlement' test.out

#- 247 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'rGNhBmgT2q0kIbrJ' \
    --platform '2S5Pf1Lvg8kYEVyl' \
    --itemIds 'INJpxFY8E6pU8eHj,h0aTjIOaQt0snbE0,yMvqF7TJ9uB0zypj' \
    > test.out 2>&1
eval_tap $? 247 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 248 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jiu7BIimNuwB3hBV' \
    --appId 'huSMHhf5R2MkxQTA' \
    > test.out 2>&1
eval_tap $? 248 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 249 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'YGfE6hXZ7XLoWCGf' \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'nCLVc2qHZuuedbBO' \
    --itemId 'd19DqZJRYV1oqNLm' \
    > test.out 2>&1
eval_tap $? 249 'GetUserEntitlementOwnershipByItemId' test.out

#- 250 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'PAUIMwa2wYq6DsUq' \
    --ids '38bYvaWLoKzHnngd,fFnOfY9stXH6LYXX,MndxBPKmHVB7cNzH' \
    --platform 'hvxc4xAPZ86WNnQO' \
    > test.out 2>&1
eval_tap $? 250 'GetUserEntitlementOwnershipByItemIds' test.out

#- 251 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'husPn4466u8agb5H' \
    --entitlementClazz 'OPTIONBOX' \
    --platform 'UhGAwpYq1UqZydOB' \
    --sku '0MThZW6LwcAg57BY' \
    > test.out 2>&1
eval_tap $? 251 'GetUserEntitlementOwnershipBySku' test.out

#- 252 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'BVCbi0ifdPyKf3Sw' \
    > test.out 2>&1
eval_tap $? 252 'RevokeAllEntitlements' test.out

#- 253 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'HekWIz4rXlH5jw99' \
    --entitlementIds 'HxCjXWcaXBcfXXeV' \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserEntitlements' test.out

#- 254 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId '7BXefsSgZxSYnVwX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qF6K0WA76Kl2mHHo' \
    > test.out 2>&1
eval_tap $? 254 'GetUserEntitlement' test.out

#- 255 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'z6qBQnEDgX49n1xT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DFcmOm1sqdIWU6ER' \
    --body '{"collectionId": "ylESgf5dXMrPoYSo", "endDate": "1974-04-16T00:00:00Z", "nullFieldList": ["frLyXMSrC62xYtDw", "flNGfufW5cWeg6eS", "CypsceITTkJGGCVF"], "origin": "IOS", "reason": "LrILDLviUCzmDAaW", "startDate": "1991-07-08T00:00:00Z", "status": "REVOKED", "useCount": 43}' \
    > test.out 2>&1
eval_tap $? 255 'UpdateUserEntitlement' test.out

#- 256 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'c7ZuZXUCBYnkY0LE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BSYBdUSiTOrhB8hV' \
    --body '{"options": ["s29WOKmZRTtgycLz", "Xz6lUMKi5mweMEZo", "2ZnL1Zg2JfH4f73j"], "platform": "AevOnES6YJLlb2Af", "requestId": "UEEBbqMMKvkOsR1f", "useCount": 69}' \
    > test.out 2>&1
eval_tap $? 256 'ConsumeUserEntitlement' test.out

#- 257 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'HJv5T2kIQOecfLsY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KTmUnKlrOsJmEwjG' \
    > test.out 2>&1
eval_tap $? 257 'DisableUserEntitlement' test.out

#- 258 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'YN8VNPXNsmwTV8im' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JHNI0l6jJVzF1Oi2' \
    > test.out 2>&1
eval_tap $? 258 'EnableUserEntitlement' test.out

#- 259 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'sQuWUBBHZonSmzF8' \
    --namespace "$AB_NAMESPACE" \
    --userId '31vlCiZAZHCWMXxV' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementHistories' test.out

#- 260 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'h8HTrKqVwnpPn8N5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xMRgU7cPqNZrLCRR' \
    > test.out 2>&1
eval_tap $? 260 'RevokeUserEntitlement' test.out

#- 261 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'Uysya4J3rvTzMTMS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wrNov2GW9i54JY23' \
    --body '{"reason": "AUWFTLq0W1JqwKs1", "useCount": 24}' \
    > test.out 2>&1
eval_tap $? 261 'RevokeUserEntitlementByUseCount' test.out

#- 262 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'ddhAQ1pwqnybvUIf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uulmeegRwPPbn7lt' \
    --quantity '41' \
    > test.out 2>&1
eval_tap $? 262 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 263 RevokeUseCount
eval_tap 0 263 'RevokeUseCount # SKIP deprecated' test.out

#- 264 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'ODN3Boi2sSAO2n4M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZQt753XQB93rOW0g' \
    --body '{"platform": "uPoQbYzc1RDVhs2l", "requestId": "hdzxxgibuqUuyW3c", "useCount": 80}' \
    > test.out 2>&1
eval_tap $? 264 'SellUserEntitlement' test.out

#- 265 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'yGfiNBQy41M1gzGC' \
    --body '{"duration": 2, "endDate": "1980-01-06T00:00:00Z", "entitlementCollectionId": "4v8ry8IyqNVv0KVp", "entitlementOrigin": "Twitch", "itemId": "bQaANJOODGerDCWc", "itemSku": "l3VSJENQopeHD6iK", "language": "BGm5Cj7RqnJUmfDm", "metadata": {"ofxvN8pRGoUtmbWZ": {}, "bEjPyq35BWDoc3qN": {}, "cQFFyHv141NPqjRU": {}}, "order": {"currency": {"currencyCode": "MKSQjFdjqTaZFsWz", "currencySymbol": "bqwTZQIN5jC6a8mE", "currencyType": "VIRTUAL", "decimals": 47, "namespace": "HmFnrSL0PJcZQaCe"}, "ext": {"NLYxMID9pqZ5rryi": {}, "MMt6fQtLhzylaqui": {}, "oT3QBt29AiRASsuF": {}}, "free": true}, "orderNo": "4ahGw7XcF1Qwzz60", "origin": "System", "overrideBundleItemQty": {"Ce5BtKcwj6PqqOgC": 17, "TfKx6ByTygbtOtcQ": 92, "Yr3cFeVw70xdNTuO": 6}, "quantity": 84, "region": "LKK0M2B2hbqJin37", "source": "IAP_CHARGEBACK_REVERSED", "startDate": "1982-06-07T00:00:00Z", "storeId": "IlTpEhjTFYdzsUNv"}' \
    > test.out 2>&1
eval_tap $? 265 'FulfillItem' test.out

#- 266 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'QAn2LuMjLqwmVz3z' \
    --body '{"code": "Ksfjz1mFkyxoUzfM", "language": "OwyE_UDuX-577", "region": "jsnyPh5yNbYXmlAO"}' \
    > test.out 2>&1
eval_tap $? 266 'RedeemCode' test.out

#- 267 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'i1SC3I1SjkH42Lty' \
    --body '{"itemId": "ZKrTJo0L5sHil4Q0", "itemSku": "mqa8GatrjbJ5YT7u", "quantity": 45}' \
    > test.out 2>&1
eval_tap $? 267 'PreCheckFulfillItem' test.out

#- 268 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'qHKcSxUc2YgRpk2I' \
    --body '{"entitlementCollectionId": "FGIgIpscUpVAciu2", "entitlementOrigin": "Epic", "metadata": {"PPUxzXHUvxhvTZcv": {}, "RKoaM4ozSAg8FTLr": {}, "ByWOJhbocoGlPzdf": {}}, "origin": "Playstation", "rewards": [{"currency": {"currencyCode": "rgXNIaU11cBXLwTf", "namespace": "opqeZtHJnRgaGfLM"}, "item": {"itemId": "FbvyI5PZGzVLcmZK", "itemName": "KKYARape2tsNczam", "itemSku": "4Cdd1QYvww4XDokl", "itemType": "tgq2vXtUnY6UhDJ4"}, "quantity": 31, "type": "ITEM"}, {"currency": {"currencyCode": "e0s0Cuhl3dU9b4se", "namespace": "YCyiB4tDCWx3cEX8"}, "item": {"itemId": "wTi1v2abpCWytPEi", "itemName": "9Ze0hL9rPkV5GkSr", "itemSku": "cl2O47XVzU7qlNVk", "itemType": "7qnmBS3XKDhp1OkM"}, "quantity": 5, "type": "CURRENCY"}, {"currency": {"currencyCode": "ErmeH0lX1hj0LaXg", "namespace": "Q94flh775AQfzNjQ"}, "item": {"itemId": "7IuMSY2epRDJjDyM", "itemName": "DKQhuTjtQZyIiAmC", "itemSku": "L8bNTTfqLCv9DYBO", "itemType": "ProN4UWbQaKFrTv4"}, "quantity": 73, "type": "ITEM"}], "source": "SELL_BACK", "transactionId": "VwFQnVco2oCn1KvJ"}' \
    > test.out 2>&1
eval_tap $? 268 'FulfillRewards' test.out

#- 269 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'mbjapW9UlEqtzDd7' \
    --endTime 'SgxdxB5kvtM8ah9b' \
    --limit '85' \
    --offset '39' \
    --productId '3H2fILFzOlAZbDQA' \
    --startTime 'EJLbVWH2XLIg3Mgm' \
    --status 'FAILED' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 269 'QueryUserIAPOrders' test.out

#- 270 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'SvWp3h0xPsVY8qNw' \
    > test.out 2>&1
eval_tap $? 270 'QueryAllUserIAPOrders' test.out

#- 271 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'B2TY4v9NNfQSYLFK' \
    --endTime 'Sl3FNFFJnt3rIwZd' \
    --limit '99' \
    --offset '60' \
    --startTime '02Su6aCnL816aH6g' \
    --status 'SUCCESS' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 271 'QueryUserIAPConsumeHistory' test.out

#- 272 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'BUIMeL0GL3aefSDM' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "Yyin_Xe", "productId": "BJMPkZmay4Csye3i", "region": "JLtjsu6ZJRCoDq3g", "transactionId": "euHFFaZzPIjETqcK", "type": "EPICGAMES"}' \
    > test.out 2>&1
eval_tap $? 272 'MockFulfillIAPItem' test.out

#- 273 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '1gaQ4Bn0cPPtKaJl' \
    --discounted  \
    --itemId 'w31pdDrXQ47WSGyD' \
    --limit '59' \
    --offset '57' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 273 'QueryUserOrders' test.out

#- 274 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'p4wqlQJcZroNQief' \
    --body '{"currencyCode": "BnPluOIjZyvlGDQG", "currencyNamespace": "v6pNNowEuVVZM28w", "discountCodes": ["duN4gx0UC6eWKCFG", "S97Si6XyLVPrkUxy", "4mnYvvlt1es7A4PF"], "discountedPrice": 22, "entitlementPlatform": "Oculus", "ext": {"OH5Nn4nMT8QOyTuU": {}, "SD9ImtaPAocOQcpB": {}, "WSNrCjSNEAdojkCM": {}}, "itemId": "mYyTGO07foRZ6Fuj", "language": "pIWo0qJtqp4Q6XgI", "options": {"skipPriceValidation": true}, "platform": "GooglePlay", "price": 78, "quantity": 32, "region": "HcP1eE6sjWQllYsO", "returnUrl": "Npp6QGW56CNiszHE", "sandbox": false, "sectionId": "9D1MMoaf6KlgRtwa"}' \
    > test.out 2>&1
eval_tap $? 274 'AdminCreateUserOrder' test.out

#- 275 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'M2IoyY1wpIdjcAtT' \
    --itemId 'j1IMuuhxxlulfmya' \
    > test.out 2>&1
eval_tap $? 275 'CountOfPurchasedItem' test.out

#- 276 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '73hX0a8Ri85PA9wN' \
    --userId 'pmrK5Y5heA2ewWnF' \
    > test.out 2>&1
eval_tap $? 276 'GetUserOrder' test.out

#- 277 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'cqHxXP3kRhtrBcBo' \
    --userId 'fWTGYx2ihgioL8Vv' \
    --body '{"status": "INIT", "statusReason": "8HkVOW8PnLkgqkqY"}' \
    > test.out 2>&1
eval_tap $? 277 'UpdateUserOrderStatus' test.out

#- 278 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZWPZTgKagTzdcYck' \
    --userId 'o7U3gH239LhRx2La' \
    > test.out 2>&1
eval_tap $? 278 'FulfillUserOrder' test.out

#- 279 GetUserOrderGrant
eval_tap 0 279 'GetUserOrderGrant # SKIP deprecated' test.out

#- 280 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'a2RdtVb6VgA5yFIH' \
    --userId '3s9UyeaFi8OE7BCK' \
    > test.out 2>&1
eval_tap $? 280 'GetUserOrderHistories' test.out

#- 281 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo '4FeVGrl5NpUG9zbl' \
    --userId 'WEiHaUjyTHb0sSls' \
    --body '{"additionalData": {"cardSummary": "tb3slUe94NxhXsVc"}, "authorisedTime": "1979-05-14T00:00:00Z", "chargebackReversedTime": "1975-06-18T00:00:00Z", "chargebackTime": "1994-10-11T00:00:00Z", "chargedTime": "1990-02-07T00:00:00Z", "createdTime": "1985-02-09T00:00:00Z", "currency": {"currencyCode": "MzaOrxuKvtUVtqbD", "currencySymbol": "WnJ2i9TRmJOqIl7U", "currencyType": "REAL", "decimals": 82, "namespace": "Gtk6EmWxC75M88TK"}, "customParameters": {"hFYkA9aRNDe2IoPM": {}, "SQKcg0OTT9JA0ll1": {}, "RimBCiQwuyrI87uS": {}}, "extOrderNo": "yXP6C0jXS8au2wcW", "extTxId": "Yyj3JvHqXp4JR7xI", "extUserId": "59Z9tfGVsglnOxOX", "issuedAt": "1984-12-29T00:00:00Z", "metadata": {"fgBLuglkd9LIoshG": "nFSuHmrqej8PRppY", "Y1vlV0M2g6oreqyB": "zWzCgMMWZuD6tmIR", "28xVxbtpSKOfiIP3": "S6pypZqISn3msryk"}, "namespace": "QFtW8QGKFZLrIfqr", "nonceStr": "Zuu7IwKcT7sAsv2T", "paymentData": {"discountAmount": 75, "discountCode": "7GoeMsezFZsTBHkg", "subtotalPrice": 5, "tax": 37, "totalPrice": 73}, "paymentMethod": "usS0zZRODEKPdudZ", "paymentMethodFee": 37, "paymentOrderNo": "r6aGJx5OFp3jKEx4", "paymentProvider": "ADYEN", "paymentProviderFee": 94, "paymentStationUrl": "SGdwTPX4ig3NVFFk", "price": 85, "refundedTime": "1978-11-27T00:00:00Z", "salesTax": 100, "sandbox": false, "sku": "vsohRWDyGYIVFDbT", "status": "CHARGE_FAILED", "statusReason": "XVzBenLtaAoYyRfi", "subscriptionId": "CWrm3s1Ah3TII70M", "subtotalPrice": 70, "targetNamespace": "OlXfgsgBd7MYLLoP", "targetUserId": "ZrkjRm5Ki0orhXrI", "tax": 91, "totalPrice": 63, "totalTax": 81, "txEndTime": "1971-06-23T00:00:00Z", "type": "PZHLQkTHvndQsCKA", "userId": "O2JRz3CGwtujkzxi", "vat": 8}' \
    > test.out 2>&1
eval_tap $? 281 'ProcessUserOrderNotification' test.out

#- 282 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'xFrnyirw3iJt5iA3' \
    --userId 'JS2xeaJ08JrSHPqd' \
    > test.out 2>&1
eval_tap $? 282 'DownloadUserOrderReceipt' test.out

#- 283 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'hKHn6ZjZMdr1C2TI' \
    --body '{"currencyCode": "QzRJY7UfYSrdN0JV", "currencyNamespace": "z4U43EcV1FRyeeqe", "customParameters": {"hMNeRYKeMbL0G4v5": {}, "D6ylZguO918X7rLo": {}, "exHBMBMMAYokSWFw": {}}, "description": "ajRGUyklfLVY6g3P", "extOrderNo": "O4hKAeF4GUV5m96q", "extUserId": "cCJsVOWtu5RPsqd6", "itemType": "OPTIONBOX", "language": "MTcv_HjNb", "metadata": {"2kX5REQZsHyXzoIX": "Nf0KbL9HyJttdgfL", "GO3ummpllnV6B62P": "1Kazg73c6UpmA4eh", "xNIIlcrZzgameT2m": "LkkAMjHyI0e2Axj0"}, "notifyUrl": "nZHjmoKHJngwMe1A", "omitNotification": false, "platform": "FJ0iGLRTXGsC5mxx", "price": 38, "recurringPaymentOrderNo": "rsSey2BqOxgwCymC", "region": "DYsuff3b7G5FDX4m", "returnUrl": "u0qPHb9Ll2EFEb8G", "sandbox": false, "sku": "xfX9tqFSkGXoIcFN", "subscriptionId": "5JL9M53Mg0MzWS9u", "title": "sxxnMhjv66DyED4p"}' \
    > test.out 2>&1
eval_tap $? 283 'CreateUserPaymentOrder' test.out

#- 284 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'rRVibTATxd7Mzjv1' \
    --userId 'gSj8kcNhoqcRZRNA' \
    --body '{"description": "TojM7daV0VwR3yNK"}' \
    > test.out 2>&1
eval_tap $? 284 'RefundUserPaymentOrder' test.out

#- 285 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'DtMqMrAGpdyF6WDH' \
    > test.out 2>&1
eval_tap $? 285 'GetUserPlatformAccountClosureHistories' test.out

#- 286 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'n3ePBxQNz2IUEHMz' \
    --body '{"code": "l5jhwVDsuzwJ4v50", "orderNo": "eoaIBrTh0EKkJioU"}' \
    > test.out 2>&1
eval_tap $? 286 'ApplyUserRedemption' test.out

#- 287 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'pvGnkcHgCfaWzPUv' \
    --body '{"meta": {"CnfqsPGgJZyRwiga": {}, "Mu07Zek8WObpf0FH": {}, "YfViEj70KYKIfFt4": {}}, "reason": "GYjUt4F1ZVy2qFfS", "revokeEntries": [{"currency": {"balanceOrigin": "Oculus", "currencyCode": "Rns3qwYL6LwGlZGF", "namespace": "7XQPLAcIL7FvAMWq"}, "entitlement": {"entitlementId": "hyyNZH1CducB5y5i"}, "item": {"entitlementOrigin": "Xbox", "itemIdentity": "05nZC4Os7hqIH2Ng", "itemIdentityType": "ITEM_SKU", "origin": "Steam"}, "quantity": 66, "type": "ITEM"}, {"currency": {"balanceOrigin": "Xbox", "currencyCode": "QQNGNH2K0UuJdeGN", "namespace": "quQnaXpDQ5rU2taD"}, "entitlement": {"entitlementId": "Wh9JV5oc5IFQsrwH"}, "item": {"entitlementOrigin": "Oculus", "itemIdentity": "4WndMpQhcLK0WTZb", "itemIdentityType": "ITEM_SKU", "origin": "GooglePlay"}, "quantity": 24, "type": "ITEM"}, {"currency": {"balanceOrigin": "IOS", "currencyCode": "3YW3ug3nCXhD7FUz", "namespace": "1iOe0pHa0LmseIRX"}, "entitlement": {"entitlementId": "eoerZAxbDPXU5xJB"}, "item": {"entitlementOrigin": "IOS", "itemIdentity": "G7uAojLYBsx8oqMz", "itemIdentityType": "ITEM_ID", "origin": "Epic"}, "quantity": 63, "type": "ENTITLEMENT"}], "source": "OTHER", "transactionId": "ljQaBtb47V691j0F"}' \
    > test.out 2>&1
eval_tap $? 287 'DoRevocation' test.out

#- 288 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zp2vjOXptxzx6kka' \
    --body '{"gameSessionId": "ZYpl52sQR9Znp5d1", "payload": {"eSwrG2GBBEWrDbQ1": {}, "ZzhDuLHq9LTBstgu": {}, "OdN0O7l3GbKPHdDT": {}}, "scid": "QDEEE2mTsn1NwJ71", "sessionTemplateName": "szsNmnqZSWdEyOVY"}' \
    > test.out 2>&1
eval_tap $? 288 'RegisterXblSessions' test.out

#- 289 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'rTdDq7IqbTVv8BLs' \
    --chargeStatus 'NEVER' \
    --itemId 'lSQVDp16qVIqXCK9' \
    --limit '8' \
    --offset '92' \
    --sku 'S5JTbdJEe6mnkYAf' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 289 'QueryUserSubscriptions' test.out

#- 290 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '1kyKk0UXUF2523OT' \
    --excludeSystem  \
    --limit '44' \
    --offset '40' \
    --subscriptionId 'OmfVNJNDaSO3FEkk' \
    > test.out 2>&1
eval_tap $? 290 'GetUserSubscriptionActivities' test.out

#- 291 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '4It6V8Bu7rIjGrxU' \
    --body '{"grantDays": 80, "itemId": "HPlvYanGqEkn9OEV", "language": "wLWGT4MXhmzvRQb7", "reason": "c0vmjWq9fQqzulLG", "region": "fQMqSLQDlRFYMVfi", "source": "AMa6Pco7Mfvikslp"}' \
    > test.out 2>&1
eval_tap $? 291 'PlatformSubscribeSubscription' test.out

#- 292 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'yL9BYLVVznF6hMYf' \
    --itemId 'ksp8VQhYSFeBOp0i' \
    > test.out 2>&1
eval_tap $? 292 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 293 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'lGQFwHUtZugblT3a' \
    --userId 'IDKn9qJXncm5igpA' \
    > test.out 2>&1
eval_tap $? 293 'GetUserSubscription' test.out

#- 294 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ewbmnWk0E7YaPblc' \
    --userId 'WEyNgvs5LEZrQXzS' \
    > test.out 2>&1
eval_tap $? 294 'DeleteUserSubscription' test.out

#- 295 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'QRWRs9EGnRPgYlJE' \
    --userId 'lgJ8kx1WEeDbql13' \
    --force  \
    --body '{"immediate": true, "reason": "rrRPcnG89rnNW1Yj"}' \
    > test.out 2>&1
eval_tap $? 295 'CancelSubscription' test.out

#- 296 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'fn8lY4DnYRxY8ZhH' \
    --userId 'eb0CaPFDjrSotKnp' \
    --body '{"grantDays": 73, "reason": "ntU8xHw4yYJOCViH"}' \
    > test.out 2>&1
eval_tap $? 296 'GrantDaysToSubscription' test.out

#- 297 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'wunQwpC2eCFUAHZa' \
    --userId 'YSvsWiNJtqXltZF6' \
    --excludeFree  \
    --limit '1' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 297 'GetUserSubscriptionBillingHistories' test.out

#- 298 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'SRmHU5iR3hXIbzWP' \
    --userId 'KOkzftOgDQAWhulb' \
    --body '{"additionalData": {"cardSummary": "rDf7q4cAnpmLiEu4"}, "authorisedTime": "1985-04-10T00:00:00Z", "chargebackReversedTime": "1991-06-08T00:00:00Z", "chargebackTime": "1989-06-25T00:00:00Z", "chargedTime": "1999-10-24T00:00:00Z", "createdTime": "1977-11-17T00:00:00Z", "currency": {"currencyCode": "nqi7cHTSdGoLZbC3", "currencySymbol": "UJruU4uIXBZsEYog", "currencyType": "VIRTUAL", "decimals": 18, "namespace": "o6M11LLZWKgWxn9Y"}, "customParameters": {"L16HQdtAneXGgxNg": {}, "33ZIUrIkfmdXVvaP": {}, "QzzKdFg7N7piT8Vc": {}}, "extOrderNo": "rXLZnuMNpKEIs3GC", "extTxId": "9VTK7tkJWFpHt7Md", "extUserId": "Ku9Xwn5GHJDGatrY", "issuedAt": "1992-02-09T00:00:00Z", "metadata": {"MO91CYEjX867n9PT": "9fR7mMuBXPDKCriR", "KzTZ7TXAVRnUVbxE": "JcKHE764EwhQfxFK", "IOGT1WKSmLoA0ILa": "ESC1GJXsoBwqh0TQ"}, "namespace": "Xa2j7v3zQJoQLTAl", "nonceStr": "W75icIKUpXazsFrm", "paymentData": {"discountAmount": 0, "discountCode": "CLNJEkvq6SUSt8xd", "subtotalPrice": 42, "tax": 63, "totalPrice": 13}, "paymentMethod": "ySxA0yrjz4q7e0EJ", "paymentMethodFee": 27, "paymentOrderNo": "uZzJ1XBxw01iBBQu", "paymentProvider": "CHECKOUT", "paymentProviderFee": 29, "paymentStationUrl": "gQ94ZvPCWcMX0ov3", "price": 96, "refundedTime": "1986-08-08T00:00:00Z", "salesTax": 38, "sandbox": true, "sku": "jIeyFS97dYD7LkcT", "status": "REFUNDED", "statusReason": "LSyGuu5rbJVIwRMt", "subscriptionId": "wApGbXnR3yC6f2MH", "subtotalPrice": 67, "targetNamespace": "oMjCPtEKeBWTm78F", "targetUserId": "n8TvZVTe4L2lXrVP", "tax": 21, "totalPrice": 35, "totalTax": 68, "txEndTime": "1997-01-22T00:00:00Z", "type": "TcnVVOKMApTcWsFR", "userId": "UlWBp4gBs9UufgsV", "vat": 3}' \
    > test.out 2>&1
eval_tap $? 298 'ProcessUserSubscriptionNotification' test.out

#- 299 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'zylqW8auyseP9wEE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yYAnHPp4XzVL5Mcg' \
    --body '{"count": 24, "orderNo": "m4JLsXVtBOEetHsx"}' \
    > test.out 2>&1
eval_tap $? 299 'AcquireUserTicket' test.out

#- 300 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'AJ8Ny1LRkPU9hrl5' \
    > test.out 2>&1
eval_tap $? 300 'QueryUserCurrencyWallets' test.out

#- 301 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'nkpEdBe8bYWdok4U' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nUEOyP0cPZf5Ovol' \
    --body '{"allowOverdraft": false, "amount": 9, "balanceOrigin": "System", "balanceSource": "EXPIRATION", "metadata": {"0mqZctohLheRaQkf": {}, "MLFW9B7jHZro4hhw": {}, "nANAGp8zGqNGrcQy": {}}, "reason": "oA1TWPcy83iXfYXN"}' \
    > test.out 2>&1
eval_tap $? 301 'DebitUserWalletByCurrencyCode' test.out

#- 302 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'dMkdg9TMwxNcQ6Ck' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vi8fqVPRqNbF5yLn' \
    --limit '92' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 302 'ListUserCurrencyTransactions' test.out

#- 303 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode '4CAUVW8FoEf8tjCj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wc22qqDfNz59jHwS' \
    --request '{"amount": 62, "debitBalanceSource": "OTHER", "metadata": {"QHadmAo0lzhPm7Rm": {}, "aOr6TLwVyE42ApAb": {}, "7CKt79wAopZL9Cw6": {}}, "reason": "K9h55mwUvhdBOgum", "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 303 'CheckBalance' test.out

#- 304 CheckWallet
eval_tap 0 304 'CheckWallet # SKIP deprecated' test.out

#- 305 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode '4wAsd4ifGd0bkWrl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'htfTywRW4fmg6btk' \
    --body '{"amount": 27, "expireAt": "1972-08-09T00:00:00Z", "metadata": {"oCWxhubMXbxNvT6w": {}, "Affv4uzKAwiI4wTx": {}, "NIefCmtrxWu29355": {}}, "origin": "Nintendo", "reason": "KneoO10ytPdJ8SY3", "source": "IAP"}' \
    > test.out 2>&1
eval_tap $? 305 'CreditUserWallet' test.out

#- 306 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'Ee4CO370OsbzRKKP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'd6mjzLxllUrFYn7c' \
    --request '{"amount": 93, "debitBalanceSource": "TRADE", "metadata": {"uO7NxKHUHg0c4X7f": {}, "HdITmN9opaF0kh3p": {}, "CRB3infEVxArF7TB": {}}, "reason": "6A6a71zAJpaPeudU", "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 306 'DebitByWalletPlatform' test.out

#- 307 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode '0v25yAObZIbrA8XA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KKWMDebehSjpt0wr' \
    --body '{"amount": 11, "metadata": {"CSDyYy4e5qoTZxSo": {}, "ZbQUnUxS6m68WL3H": {}, "DL4yx5I0euBsccHP": {}}, "walletPlatform": "Playstation"}' \
    > test.out 2>&1
eval_tap $? 307 'PayWithUserWallet' test.out

#- 308 GetUserWallet
eval_tap 0 308 'GetUserWallet # SKIP deprecated' test.out

#- 309 DebitUserWallet
eval_tap 0 309 'DebitUserWallet # SKIP deprecated' test.out

#- 310 DisableUserWallet
eval_tap 0 310 'DisableUserWallet # SKIP deprecated' test.out

#- 311 EnableUserWallet
eval_tap 0 311 'EnableUserWallet # SKIP deprecated' test.out

#- 312 ListUserWalletTransactions
eval_tap 0 312 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 313 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId '5eiQO3oWdgXdm1Ix' \
    > test.out 2>&1
eval_tap $? 313 'ListViews' test.out

#- 314 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'L1OtleUBqBO0Ze04' \
    --body '{"displayOrder": 80, "localizations": {"k9W6ZLVJzRpUsITf": {"description": "VruDukun42zPZvOd", "localExt": {"4yZyMKyED3qDO5HX": {}, "p5oVkhESbHQ7hvTl": {}, "zf7XwQtVIYU87Ngj": {}}, "longDescription": "DMcJxfMfYFlt3JvD", "title": "gMiyBGygWFTAY3Th"}, "5mOwPCPKVPlOGfFB": {"description": "lu2ZP0IkiYXGk6Bo", "localExt": {"BmSLi0R7zDFMoNTQ": {}, "mlS8lMlY8UjprhCx": {}, "hzW6ZM7LkTVrtVJZ": {}}, "longDescription": "VhxCVdjPutJ8dkAV", "title": "OJ5imghdfVhjnjd6"}, "6A1SQmWGSQLAVPAJ": {"description": "7zX5lB80k2smdkBS", "localExt": {"2MaIP7PjngEFggq9": {}, "1cpgvoDBgYfLBdGN": {}, "AZEvbvxqa0K7VUbj": {}}, "longDescription": "UnzirnEsxSE4vBzG", "title": "7VK8sWEshmZf5fEd"}}, "name": "vjbyJPQ1qdRcJjsm"}' \
    > test.out 2>&1
eval_tap $? 314 'CreateView' test.out

#- 315 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'e1OukIfIZVH8q8sv' \
    --storeId 'V5hMOSfpyJkJlmJm' \
    > test.out 2>&1
eval_tap $? 315 'GetView' test.out

#- 316 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'TkFvB7wkY6nuUEGJ' \
    --storeId '3k0HGtpK43uORGRE' \
    --body '{"displayOrder": 83, "localizations": {"FQ1520WM3TxWXSdT": {"description": "iKdva2UREoBSFtCL", "localExt": {"y2CqgCG7JwJCDqkz": {}, "OdFwLJpIPxzLE1V9": {}, "U1NgpH7Oc44yjRdf": {}}, "longDescription": "qZgv34GqqjelcN0G", "title": "JmPwUTWMx0MiPAjn"}, "WIhFrqSn4erXEtU1": {"description": "CaD8AqsMCGBNhmUt", "localExt": {"6fzYRn85brTu8F7c": {}, "uCPh1TGZJmgWNHWn": {}, "vOBRCt4onqRo2PnM": {}}, "longDescription": "SRarKg4coy3AFpUL", "title": "In21Nf2FNgDWNC6y"}, "h7kgTHlrxKbsV4Xt": {"description": "rI7SFBEgkwHifMHY", "localExt": {"I581HbF7fMX9lDXY": {}, "xGRJM92eX42WW2WK": {}, "f5urEOpASBicX3Zw": {}}, "longDescription": "zZ7aVhrkmhSOEozG", "title": "Ov8D0iVxzrec5kNw"}}, "name": "JAxm0Rdm9l6nIhG5"}' \
    > test.out 2>&1
eval_tap $? 316 'UpdateView' test.out

#- 317 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'SilDDIsmj4h625dI' \
    --storeId 'sMKWBxF9RAIrI81Z' \
    > test.out 2>&1
eval_tap $? 317 'DeleteView' test.out

#- 318 QueryWallets
eval_tap 0 318 'QueryWallets # SKIP deprecated' test.out

#- 319 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 89, "expireAt": "1974-03-29T00:00:00Z", "metadata": {"oi9Fw25b9qXzlIK2": {}, "G6AUjBCdf0Rp5e5I": {}, "vFuN1oUsCnBmGMx5": {}}, "origin": "System", "reason": "bQMHpPbvflI3LkRc", "source": "SELL_BACK"}, "currencyCode": "INvq1VR9SJUfQEX9", "userIds": ["NAs9188Qm3W1De2M", "cGd10wefF0CJlH55", "96Mh1sQ3Dw3uyjgQ"]}, {"creditRequest": {"amount": 91, "expireAt": "1990-09-09T00:00:00Z", "metadata": {"EgeAsSpQdcmGHZuR": {}, "VQ8tzwqMayP8A3HG": {}, "NI3BfjkFd6MHo6gG": {}}, "origin": "Xbox", "reason": "5mChYoKD7yqCR03R", "source": "GIFT"}, "currencyCode": "XivAL3n478mhb2I2", "userIds": ["yBJeCJghTrk68FWF", "6Zys3mN8fIcC9Ckh", "zuLBdlrKjUbgZQfw"]}, {"creditRequest": {"amount": 2, "expireAt": "1995-05-22T00:00:00Z", "metadata": {"URxHefz77a9fntCN": {}, "iHBRUNCPSre5GmZz": {}, "CQwilS3IxSjlyvR9": {}}, "origin": "Xbox", "reason": "kKC1h6h45u0wuh9p", "source": "SELL_BACK"}, "currencyCode": "IxVGpdOqguxvRwI9", "userIds": ["9gEs6GF247cbBLjU", "ZBTipMRlhK9DMMaI", "4ryVDvNaruZxwTfh"]}]' \
    > test.out 2>&1
eval_tap $? 319 'BulkCredit' test.out

#- 320 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "r5z03wxB3E9hrE9f", "request": {"allowOverdraft": false, "amount": 59, "balanceOrigin": "Xbox", "balanceSource": "PAYMENT", "metadata": {"KDEYahnlLJaLCvjR": {}, "KKX1brmkJDfdngbQ": {}, "D3pO8U3W94Z8IW2M": {}}, "reason": "AL9gYHEV3wnTZTvY"}, "userIds": ["rOc0NIligBrOkBlj", "Yf4ZFuV6L2AldoWW", "RN5wNYlFiliYmBrq"]}, {"currencyCode": "wRENjt04ZpyTTZG1", "request": {"allowOverdraft": true, "amount": 49, "balanceOrigin": "GooglePlay", "balanceSource": "OTHER", "metadata": {"r2S4Yw8NmPaBeryz": {}, "X2hOPVVFqVqxjq1i": {}, "G3TySOh8SI75oXby": {}}, "reason": "q8FBbur80QwnlgAV"}, "userIds": ["XcEIFod3lCzvjHzD", "fqz6gQJh8sn0bVWR", "kvmAemh8lioBR7xT"]}, {"currencyCode": "HOrSJ1vbB7LRHd96", "request": {"allowOverdraft": false, "amount": 2, "balanceOrigin": "System", "balanceSource": "TRADE", "metadata": {"LgkfrZveFMWAFT7l": {}, "0l1jaOAMCzbsoIgm": {}, "KwwMDQPjUIosq1l6": {}}, "reason": "xo0D4JRbNqO6IuP2"}, "userIds": ["PY5hhX6uNah9JoHP", "Z8c7Zd7EUoezOLw8", "j7jFWxSv1lYylYAi"]}]' \
    > test.out 2>&1
eval_tap $? 320 'BulkDebit' test.out

#- 321 GetWallet
eval_tap 0 321 'GetWallet # SKIP deprecated' test.out

#- 322 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'C1c5bBB3XZ7ColKw' \
    --end 'lsNvtFuunQsvdXGl' \
    --start 'D40xxIyVwYjn6dlC' \
    > test.out 2>&1
eval_tap $? 322 'SyncOrders' test.out

#- 323 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["9Kfh9gHuloyce0cL", "Ju4ljPWlCWTuGO8M", "nfOQu3wdT4Aodp95"], "apiKey": "o1RkX7iW7VpCngWA", "authoriseAsCapture": true, "blockedPaymentMethods": ["Mworzym1z3ZdetOi", "c9AQOFWpdItLBhvK", "Jq9tWz9yui8a6jOf"], "clientKey": "lFJlZEhz1QDeh05h", "dropInSettings": "j92bwVVxJ62Q5AOA", "liveEndpointUrlPrefix": "OyL65cPaOZA8BG8K", "merchantAccount": "cVWOX9n3YsjJexnF", "notificationHmacKey": "A9Umz3KPICya5Fk5", "notificationPassword": "TPaEbX29cV8v7MXc", "notificationUsername": "tihtxMnIr4b7jyfL", "returnUrl": "3zMkklGCPISlsnVA", "settings": "6z0uSfNNpJUYzJxn"}' \
    > test.out 2>&1
eval_tap $? 323 'TestAdyenConfig' test.out

#- 324 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "OyvqmswrToyBIQum", "privateKey": "xDfAxNqCUtizYM97", "publicKey": "ebZcYqwfIHPWMkOm", "returnUrl": "rT5HL16jMwECnmwJ"}' \
    > test.out 2>&1
eval_tap $? 324 'TestAliPayConfig' test.out

#- 325 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "v4rpqtzDaz0WUJlB", "secretKey": "CHzJ2v9K8c1zOlZg"}' \
    > test.out 2>&1
eval_tap $? 325 'TestCheckoutConfig' test.out

#- 326 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region '30pagfP0FfOMBOpe' \
    > test.out 2>&1
eval_tap $? 326 'DebugMatchedPaymentMerchantConfig' test.out

#- 327 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "QT4zYIbU4i9mLyX4", "webhookSecretKey": "6Alt08rrnG8y2ScX"}' \
    > test.out 2>&1
eval_tap $? 327 'TestNeonPayConfig' test.out

#- 328 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "kwjpAp82pGcxvXaG", "clientSecret": "9LzHpMS53jllopwi", "returnUrl": "rRo3A8WxnR0YaMsF", "webHookId": "3f5KLtpTSsPMGDZT"}' \
    > test.out 2>&1
eval_tap $? 328 'TestPayPalConfig' test.out

#- 329 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["OwEP5Bhh0NStWIgg", "mhfAzVdNYP7Ao1z7", "FeJM2fWXGk7JObSH"], "publishableKey": "ksRkabpmvRsc7ZYv", "secretKey": "XCT6m6mRZAlLBczJ", "webhookSecret": "Veil7GbG1ISBCkcn"}' \
    > test.out 2>&1
eval_tap $? 329 'TestStripeConfig' test.out

#- 330 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "pxKUxLjmxhBS6Yyp", "key": "RW7fNntaIEtDI6Mb", "mchid": "hxkQdezbmf392ers", "returnUrl": "oZ2KbMb5jal0ruZm"}' \
    > test.out 2>&1
eval_tap $? 330 'TestWxPayConfig' test.out

#- 331 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "BXlGSp85q6fuGfo5", "flowCompletionUrl": "wSDHnyabk493I3pv", "merchantId": 69, "projectId": 1, "projectSecretKey": "KDaWhTN1qyxpUzWI"}' \
    > test.out 2>&1
eval_tap $? 331 'TestXsollaConfig' test.out

#- 332 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'ZWJTDzWguhujw1Eo' \
    > test.out 2>&1
eval_tap $? 332 'GetPaymentMerchantConfig1' test.out

#- 333 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'R58uCVldefonHJZA' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["iX4abmqqi90KTWwZ", "k0HGeJNaBjVdMB5k", "MzKycYrhr4FnNzdT"], "apiKey": "4pWwIVXp9avUr6Iy", "authoriseAsCapture": false, "blockedPaymentMethods": ["4gQWyZocvYfr0Rnl", "02R1IVNnaK6KS71X", "s1BphA9BXpKYgF9O"], "clientKey": "uigDP0Vjmy7j2Brd", "dropInSettings": "CAm3slCwaBqHpE55", "liveEndpointUrlPrefix": "sjxBGijw0dQtZNon", "merchantAccount": "MrPkzUe9SglAJGyZ", "notificationHmacKey": "S0I8FevJiT98HUBp", "notificationPassword": "56Q4WETxtGMs5tPK", "notificationUsername": "PuK0K4PiMDTR7Lxi", "returnUrl": "huOn57io0d9dG3yz", "settings": "aNbGeASX83SLiIbA"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdateAdyenConfig' test.out

#- 334 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'P2qyUnHnfrEdDfY4' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 334 'TestAdyenConfigById' test.out

#- 335 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'TTxu8goZgsX4RwfM' \
    --sandbox  \
    --validate  \
    --body '{"appId": "4qnUdcQqZ9F1uivP", "privateKey": "ob0YZEuXQACDDQry", "publicKey": "Nf9VGxbOeJe4n9eU", "returnUrl": "lBQZ2UGePWXbAyGi"}' \
    > test.out 2>&1
eval_tap $? 335 'UpdateAliPayConfig' test.out

#- 336 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'Xa9nUsHCVicuJ7on' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 336 'TestAliPayConfigById' test.out

#- 337 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'rUXVlB6xNel4Bxb9' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "KwFYqdhEVq3hbsAp", "secretKey": "eASfR0ljKxqZcLuh"}' \
    > test.out 2>&1
eval_tap $? 337 'UpdateCheckoutConfig' test.out

#- 338 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'wNDvValv3bkoMXNz' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 338 'TestCheckoutConfigById' test.out

#- 339 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'l1ywEPiunixlEAHZ' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "zHs8x5oPSkZFIV2f", "webhookSecretKey": "eXnTRlzAJy9oFOHB"}' \
    > test.out 2>&1
eval_tap $? 339 'UpdateNeonPayConfig' test.out

#- 340 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id '2KEsIdtozVltBhoX' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 340 'TestNeonPayConfigById' test.out

#- 341 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'E4wgcYT5CdjaJuUz' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "FIeqaVr1CE1gu6cY", "clientSecret": "uzC77J4irvZ9tktW", "returnUrl": "LtDdlmVGK6iolEw6", "webHookId": "IIpDc9X5ijmtDGvd"}' \
    > test.out 2>&1
eval_tap $? 341 'UpdatePayPalConfig' test.out

#- 342 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '9ESdY0eTkBWA44Qq' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 342 'TestPayPalConfigById' test.out

#- 343 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'si5yOjvl5sRN2ENn' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["1RLi5iMPnbg7o1zY", "pqUsliPyXZGYIW5Z", "DtWbdkzPP47RcUIi"], "publishableKey": "2CoNj4EG2emxKQk8", "secretKey": "cBrt5E8k8rzDZ08j", "webhookSecret": "6ICP75cm8YDChFi3"}' \
    > test.out 2>&1
eval_tap $? 343 'UpdateStripeConfig' test.out

#- 344 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'zLvfQWC85MxWxvW0' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 344 'TestStripeConfigById' test.out

#- 345 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'veFl3uU1aMD0mczW' \
    --validate  \
    --body '{"appId": "xc8f1s2QPMMZsf2d", "key": "vKZyHChRPHvdkcKW", "mchid": "21B5EFtD2pYaKTz1", "returnUrl": "gcE2XCwTkRUIX6IF"}' \
    > test.out 2>&1
eval_tap $? 345 'UpdateWxPayConfig' test.out

#- 346 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'HNmB9mYBvtOwxjqy' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 346 'UpdateWxPayConfigCert' test.out

#- 347 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'rjDApeN5eAfRqSgH' \
    > test.out 2>&1
eval_tap $? 347 'TestWxPayConfigById' test.out

#- 348 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id '5xIuBTYOdsvNyk52' \
    --validate  \
    --body '{"apiKey": "MQFkVVEf36S7yPgG", "flowCompletionUrl": "48bk6PwH1tdEAJSq", "merchantId": 44, "projectId": 54, "projectSecretKey": "cAFTaSWR4VOGIY7h"}' \
    > test.out 2>&1
eval_tap $? 348 'UpdateXsollaConfig' test.out

#- 349 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'M6uhonkAe0FdTSSE' \
    > test.out 2>&1
eval_tap $? 349 'TestXsollaConfigById' test.out

#- 350 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'luBxM47BTww3nBTV' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "SMALL", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 350 'UpdateXsollaUIConfig' test.out

#- 351 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '10' \
    --namespace "$AB_NAMESPACE" \
    --offset '64' \
    --region 'TIs9bTi2m7eNsYEq' \
    > test.out 2>&1
eval_tap $? 351 'QueryPaymentProviderConfig' test.out

#- 352 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "MS4pVRcCHIGfmCMT", "region": "r9ACnI2sMrEgl7ZR", "sandboxTaxJarApiToken": "1HCkf2Sw78lLGKjD", "specials": ["XSOLLA", "STRIPE", "STRIPE"], "taxJarApiToken": "jA0ajvb7JcGUFgp6", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 352 'CreatePaymentProviderConfig' test.out

#- 353 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 353 'GetAggregatePaymentProviders' test.out

#- 354 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region '58fikq83hqJ7HP63' \
    > test.out 2>&1
eval_tap $? 354 'DebugMatchedPaymentProviderConfig' test.out

#- 355 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 355 'GetSpecialPaymentProviders' test.out

#- 356 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'Se6kVW5fkl60ImLB' \
    --body '{"aggregate": "NEONPAY", "namespace": "CTXOxQUpyFgZhNpO", "region": "TE4toH57yr01N33p", "sandboxTaxJarApiToken": "1Gha8HwpagvERZI6", "specials": ["WXPAY", "PAYPAL", "PAYPAL"], "taxJarApiToken": "7VMlxEXnqHwMyKpw", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 356 'UpdatePaymentProviderConfig' test.out

#- 357 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'rYkMqXkQ7qlaJjSY' \
    > test.out 2>&1
eval_tap $? 357 'DeletePaymentProviderConfig' test.out

#- 358 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 358 'GetPaymentTaxConfig' test.out

#- 359 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "EseBYCFGoKpXx60G", "taxJarApiToken": "mEX9x2BYpyKEBQ7T", "taxJarEnabled": false, "taxJarProductCodesMapping": {"7lZvDbwFJJhBRdq8": "BgAI81k4Gr7jVVx5", "l3yrH9HR4reG0HwU": "XxQTf5YpDUGYsJBE", "kYUrLv4qUiTkFcLB": "rg2JB0WiCpVBwvAf"}}' \
    > test.out 2>&1
eval_tap $? 359 'UpdatePaymentTaxConfig' test.out

#- 360 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'fJ3btt0PpQY3Pnni' \
    --end 'c80yEO8dL6Jh10XM' \
    --start 'UGeDavCKradJmJFU' \
    > test.out 2>&1
eval_tap $? 360 'SyncPaymentOrders' test.out

#- 361 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'sU418vAlmfGg9NO1' \
    --storeId 'Z2DvnAxH3pS3jyCk' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetRootCategories' test.out

#- 362 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'GKltBNE2UbhNtH3y' \
    --storeId 'Yg4Qnn2uhdw7C9Bx' \
    > test.out 2>&1
eval_tap $? 362 'DownloadCategories' test.out

#- 363 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath '1LQOTCbAPLC3iqrk' \
    --namespace "$AB_NAMESPACE" \
    --language 'yJFOVaewFcv9h31Y' \
    --storeId 'xuZnoSesWpLUHjGa' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetCategory' test.out

#- 364 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'IcZN28gH4Cd9xTdt' \
    --namespace "$AB_NAMESPACE" \
    --language '2K1CzpQWslNGnLYU' \
    --storeId 'YR0yOvJhUjzcMtwI' \
    > test.out 2>&1
eval_tap $? 364 'PublicGetChildCategories' test.out

#- 365 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'NUlrhIpnlam2EefV' \
    --namespace "$AB_NAMESPACE" \
    --language 'opbpPhsana0uXG7G' \
    --storeId 'UTV1BwgkLDj4pjVk' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetDescendantCategories' test.out

#- 366 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 366 'PublicListCurrencies' test.out

#- 367 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'PSN' \
    > test.out 2>&1
eval_tap $? 367 'GeDLCDurableRewardShortMap' test.out

#- 368 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'STEAM' \
    > test.out 2>&1
eval_tap $? 368 'GetIAPItemMapping' test.out

#- 369 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '18cQ677SotDEtU2x' \
    --region 'BSEQ8rBKc2K6oJXx' \
    --storeId 'VEfnaqX8NuZtRUTK' \
    --appId 'UvR69PImy6CcwlqJ' \
    > test.out 2>&1
eval_tap $? 369 'PublicGetItemByAppId' test.out

#- 370 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'O3L8x1H5OgzHypgs' \
    --categoryPath 'SeKCvtPz7jagBG9a' \
    --features '1TZ87ltClc3RDXF5' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --language '5tUlenimjIbm0riC' \
    --limit '0' \
    --offset '81' \
    --region '4ZKfvMf1T5FzYMf1' \
    --sortBy 'name:desc,name' \
    --storeId '5Bvb1rcuEtWAF763' \
    --tags 'kci7lT62BOHaso53' \
    > test.out 2>&1
eval_tap $? 370 'PublicQueryItems' test.out

#- 371 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'W3U2Mu9ZGMWou1U0' \
    --region 'RVCf3gMWDAodCKqf' \
    --storeId 'qzeexHA70NgJTxjt' \
    --sku 'zgO7W3taRvJ6lKWJ' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetItemBySku' test.out

#- 372 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'wHO65aOFDwpqy7XO' \
    --storeId 'U3DwglyMGNll4O8E' \
    --itemIds 'LahcNJqRjepck1l0' \
    > test.out 2>&1
eval_tap $? 372 'PublicGetEstimatedPrice' test.out

#- 373 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'qxRyQ2pi7xuAufJa' \
    --region 'kIPXOQznHZTj8oYf' \
    --storeId 'WObyNJKVSQsaCoko' \
    --itemIds 'Gynp6xcqNKJnAhrS' \
    > test.out 2>&1
eval_tap $? 373 'PublicBulkGetItems' test.out

#- 374 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["t96OaARAjHLGV3sN", "xS8uLBZiVRYIyQLc", "slTEqgVNG8Aqktgv"]}' \
    > test.out 2>&1
eval_tap $? 374 'PublicValidateItemPurchaseCondition' test.out

#- 375 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'CODE' \
    --limit '16' \
    --offset '46' \
    --region 'gq9zOQOcAqBj0bXh' \
    --storeId 'Or9OHt6zx1i2W3GY' \
    --keyword '7tdh8hHlQyMlgfkT' \
    --language 'sAThLyflAqqAP4M7' \
    > test.out 2>&1
eval_tap $? 375 'PublicSearchItems' test.out

#- 376 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId '8smYdyge6DroOywO' \
    --namespace "$AB_NAMESPACE" \
    --language 'xI4G6jZzoYIFAvYf' \
    --region 'T8XQw2EOq6BFjmN4' \
    --storeId 'OqKGLRpNWzKZtZnx' \
    > test.out 2>&1
eval_tap $? 376 'PublicGetApp' test.out

#- 377 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'gywmr4CYNGm7Tk1m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 377 'PublicGetItemDynamicData' test.out

#- 378 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'MyeNRsjQuDEgO3ME' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'QNL6ijLRvQOgoaBo' \
    --populateBundle  \
    --region 'oTawHLMxhx9nC3o6' \
    --storeId 'pXU5MDJLCB6WbXWI' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetItem' test.out

#- 379 GetPaymentCustomization
eval_tap 0 379 'GetPaymentCustomization # SKIP deprecated' test.out

#- 380 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "RpgjooaBVemsbkaX", "successUrl": "ZQ6nTj9rZpkSntuO"}, "paymentOrderNo": "eaPAyPeEGBepK1Ix", "paymentProvider": "STRIPE", "returnUrl": "9d1Idud8bjYeBVMr", "ui": "7zHYmRE4X36KUOdf", "zipCode": "EmoIYwSxxAsfwDMi"}' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetPaymentUrl' test.out

#- 381 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'vWqHHGlnAnEu6EKY' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetPaymentMethods' test.out

#- 382 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ceTEqYudHlA4AxeE' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetUnpaidPaymentOrder' test.out

#- 383 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'IfUxJ2xMSNNBxCeN' \
    --paymentProvider 'NEONPAY' \
    --zipCode 'Iay5VdUdYy9Y9OCS' \
    --body '{"token": "mmT3WKijbqhT3uyQ"}' \
    > test.out 2>&1
eval_tap $? 383 'Pay' test.out

#- 384 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'RXvvcUYDeWPZ8yhw' \
    > test.out 2>&1
eval_tap $? 384 'PublicCheckPaymentOrderPaidStatus' test.out

#- 385 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'NEONPAY' \
    --region '0gIdj1lTJdNLmAvE' \
    > test.out 2>&1
eval_tap $? 385 'GetPaymentPublicConfig' test.out

#- 386 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'dEBVAU3rbkv8V98c' \
    > test.out 2>&1
eval_tap $? 386 'PublicGetQRCode' test.out

#- 387 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'upW0L5WsiuITRMSP' \
    --foreinginvoice 'OUfWQwr4PYf48r66' \
    --invoiceId 'MaToxBiliy2vtRkp' \
    --payload 'qL6KrVcNz83J57t6' \
    --redirectResult 'OcYPQ5bk5IeuAi3z' \
    --resultCode 'WFGorCbncoj5RvEt' \
    --sessionId 'XiKyUGdNfMiwgSvs' \
    --status 'TRmJsOm0wVFyHvFh' \
    --token 'RMCFJuA0DEMgykqq' \
    --type 'joHTpIPMSRAuPI7m' \
    --userId 'SZQ5UDm1q51PlW2H' \
    --orderNo 'G8LAiIzuo321Ll90' \
    --paymentOrderNo 'IBFsSb3FsV2PnCs9' \
    --paymentProvider 'CHECKOUT' \
    --returnUrl '0D5jZEwxcow6L7c3' \
    > test.out 2>&1
eval_tap $? 387 'PublicNormalizePaymentReturnUrl' test.out

#- 388 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'COEP4AZx70uwV4Xg' \
    --paymentOrderNo 'vGTMHkXeEwuFJf7t' \
    --paymentProvider 'ADYEN' \
    > test.out 2>&1
eval_tap $? 388 'GetPaymentTaxValue' test.out

#- 389 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'LdgPZI0fKW8LeQxI' \
    > test.out 2>&1
eval_tap $? 389 'GetRewardByCode' test.out

#- 390 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'taK6s3Hha69MgxjG' \
    --limit '73' \
    --offset '64' \
    --sortBy 'rewardCode,namespace:asc' \
    > test.out 2>&1
eval_tap $? 390 'QueryRewards1' test.out

#- 391 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'mkfVlu4bGB1pyk0P' \
    > test.out 2>&1
eval_tap $? 391 'GetReward1' test.out

#- 392 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 392 'PublicListStores' test.out

#- 393 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'pxXZDy5Pmbu7RrD9,a5mdlXTCL467xHbA,iD3Pr3mXZO1PnbSl' \
    --itemIds 'fVRlAI8F2f3mEv09,kAA5hnQtd4bcivHG,IEplRpcHDWcIoJ45' \
    --skus 'L0Ze3YamxKDSZTl4,UiJSCbG4UmG3TkMT,zOcBIciiKwRs1E7s' \
    > test.out 2>&1
eval_tap $? 393 'PublicExistsAnyMyActiveEntitlement' test.out

#- 394 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'H2G9MJ6F7Rr7O15j' \
    > test.out 2>&1
eval_tap $? 394 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 395 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'mhMQUCx70QjYbzem' \
    > test.out 2>&1
eval_tap $? 395 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 396 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --sku '7eJRsXNeveQXqnFR' \
    > test.out 2>&1
eval_tap $? 396 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 397 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'YmEIX40XOUoLOa7o,Dz00gxcoaH6u9TVf,4DvEzpoPRiClZ6rl' \
    --itemIds 'wX99AHMLHqguYykV,WzNwPcvGyieBsRUd,uW5lxSlorWEGN5bP' \
    --skus 'GSOSiiItrSrEJMBA,IwTLkrMDFQfpQ9o0,GJMTfqRRaZozM8xC' \
    > test.out 2>&1
eval_tap $? 397 'PublicGetEntitlementOwnershipToken' test.out

#- 398 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "BoaS2FMwfWNCbN5G", "language": "zL_md", "region": "Z7gEypQf2Pn9A4gc"}' \
    > test.out 2>&1
eval_tap $? 398 'SyncTwitchDropsEntitlement' test.out

#- 399 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'bDJ0LmdnOPkIT1C6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 399 'PublicGetMyWallet' test.out

#- 400 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'KGTpA7JZ6xullPRO' \
    --body '{"epicGamesJwtToken": "SfiW9zcxmgNfTHu3"}' \
    > test.out 2>&1
eval_tap $? 400 'SyncEpicGameDLC' test.out

#- 401 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'vkZt9FgWckjNpHhM' \
    > test.out 2>&1
eval_tap $? 401 'SyncOculusDLC' test.out

#- 402 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '2ZXp4N0ROmUCTrS7' \
    --body '{"serviceLabel": 68}' \
    > test.out 2>&1
eval_tap $? 402 'PublicSyncPsnDlcInventory' test.out

#- 403 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'EcGJjOCXpuix5vnP' \
    --body '{"serviceLabels": [9, 93, 46]}' \
    > test.out 2>&1
eval_tap $? 403 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 404 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'SWqSs05rjISy4B0X' \
    --body '{"appId": "9AJdkT7UYCV8agvw", "steamId": "OI2LlOQNRN132Rdg"}' \
    > test.out 2>&1
eval_tap $? 404 'SyncSteamDLC' test.out

#- 405 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'wMXv9olKpRyWQim3' \
    --body '{"xstsToken": "qlART9mPPmYUvlkB"}' \
    > test.out 2>&1
eval_tap $? 405 'SyncXboxDLC' test.out

#- 406 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'GPJFaFzkABC8zWMc' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'ZQssUUXOsXMNdvW1' \
    --features 'hbvGenRbm3QtsY5W,aKM5YY6pYrmeMIHL,S8egV8XhgDjbrum8' \
    --itemId 'UxcutmVg8APWKxoj,6MF68VuKDoklYmky,tCAH8Jiqe7gfV1G6' \
    --limit '2' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 406 'PublicQueryUserEntitlements' test.out

#- 407 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'YgIbVKp4Kgew2mHD' \
    --appId 'ksA6Mv9Nzs19eBq9' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetUserAppEntitlementByAppId' test.out

#- 408 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'a1L8S1yduOwscICr' \
    --limit '29' \
    --offset '93' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 408 'PublicQueryUserEntitlementsByAppType' test.out

#- 409 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'P8FWIPeqaBeD2uBA' \
    --availablePlatformOnly  \
    --ids 'vIXEc2CCgYcFo9A9,3o22UgObCOiBWdw2,b031dm4N41MOpmm0' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetUserEntitlementsByIds' test.out

#- 410 PublicGetUserEntitlementByItemId
eval_tap 0 410 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 411 PublicGetUserEntitlementBySku
eval_tap 0 411 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 412 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '4BlZUAlYnCT11qD0' \
    --endDate '3er5mdraK47FdxXi' \
    --entitlementClazz 'ENTITLEMENT' \
    --limit '70' \
    --offset '98' \
    --startDate 'jmLu4oFlReHy0JyZ' \
    > test.out 2>&1
eval_tap $? 412 'PublicUserEntitlementHistory' test.out

#- 413 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'v7honqeiGTTqpgVs' \
    --appIds 'Y1kPNdJiJXB3yjNU,PIfvoXRO0CkW1Zcg,USbbnffBWRaJN1Sj' \
    --itemIds 'CFLDNJfAhJGwSYEZ,jEb0Pv35fEk9s11b,FXkf7rQJ4Kj7Qyo9' \
    --skus 'tUptiyZzRX8Y4rxR,WZPe4ZLAQWuBJwxO,bZqMGxhffy9cHrLY' \
    > test.out 2>&1
eval_tap $? 413 'PublicExistsAnyUserActiveEntitlement' test.out

#- 414 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'fftad99JDcnn7f2d' \
    --appId '8SOWP2dw6Uy88WpQ' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 415 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'alG38VOo82aLD9jU' \
    --entitlementClazz 'CODE' \
    --itemId 'GeM8yxRfejqSbVgL' \
    > test.out 2>&1
eval_tap $? 415 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 416 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'd1FoyNFGpu5r2K0I' \
    --ids 'vVg5LwUygH98dzTL,8azKCCNBZpwRFNYx,x2dr6DDuDHXcfvXP' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 417 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'XJURX3XwhOlgcpcO' \
    --entitlementClazz 'MEDIA' \
    --sku 'cEm53BYMBacQBIuD' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 418 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'Vs7U0AJtWPRteszM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Td0R5Fsrf9xbVfgv' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetUserEntitlement' test.out

#- 419 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'G617GmxzClkR3M6T' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wpwq3nLwxnJKjOo9' \
    --body '{"options": ["fvfXF1VsikD3IphQ", "QiRcOtsthUwgQzNH", "UZ0l1FRfOjJUmCbi"], "requestId": "2llksf6GA8vTt92k", "useCount": 24}' \
    > test.out 2>&1
eval_tap $? 419 'PublicConsumeUserEntitlement' test.out

#- 420 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'dTUGpd8KFrXKFA2g' \
    --namespace "$AB_NAMESPACE" \
    --userId 'djQCYoE8b0CZetLf' \
    --body '{"requestId": "pFNyp7375rhOmR4z", "useCount": 65}' \
    > test.out 2>&1
eval_tap $? 420 'PublicSellUserEntitlement' test.out

#- 421 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'ShM2DvesmMIbiQfa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hxl2YUNRLRjgKqSS' \
    --body '{"useCount": 49}' \
    > test.out 2>&1
eval_tap $? 421 'PublicSplitUserEntitlement' test.out

#- 422 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'gZnVfa8govttlpFA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'q8oebnS4Y2zkGYTr' \
    --body '{"entitlementId": "9yJIveX52r6Inl9V", "useCount": 94}' \
    > test.out 2>&1
eval_tap $? 422 'PublicTransferUserEntitlement' test.out

#- 423 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'wV25N7NAvZdGuyYE' \
    --body '{"code": "YZE3KaGSdhEGKcp6", "language": "nD_DpBK_740", "region": "R7SH93AE1Toj5vyg"}' \
    > test.out 2>&1
eval_tap $? 423 'PublicRedeemCode' test.out

#- 424 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'VvLSJvdsGpmmUeMi' \
    --body '{"excludeOldTransactions": false, "language": "yiTF_Sbmp-701", "productId": "FDj2L2McvCrrR7h9", "receiptData": "uKLXDaRf3pxKtJbR", "region": "Y5luCwKrt6wn3yVr", "transactionId": "RCh6j7rpv8K8fBAe"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicFulfillAppleIAPItem' test.out

#- 425 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ra1R6ksxLYGkOLgR' \
    --body '{"epicGamesJwtToken": "eff5IHxLJIemNHbz"}' \
    > test.out 2>&1
eval_tap $? 425 'SyncEpicGamesInventory' test.out

#- 426 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'gAFjtjC7suvgIUkB' \
    --body '{"autoAck": false, "language": "yhh-Lk", "orderId": "B246OY0dPVMd2WDU", "packageName": "VEQTpfyAIoF7qsAN", "productId": "BbEKQrgocpjGNenR", "purchaseTime": 23, "purchaseToken": "9imVMh3i7j095rDL", "region": "6lEuB1ZIMIs1dFvY"}' \
    > test.out 2>&1
eval_tap $? 426 'PublicFulfillGoogleIAPItem' test.out

#- 427 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'okH9t2u8ZZnyHKkk' \
    > test.out 2>&1
eval_tap $? 427 'SyncOculusConsumableEntitlements' test.out

#- 428 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '6Gh25tEcX9GegDnr' \
    --body '{"currencyCode": "Yz0GFpSVdxFsXAp1", "price": 0.2746787281941252, "productId": "oclyXllFitPamSKR", "serviceLabel": 53}' \
    > test.out 2>&1
eval_tap $? 428 'PublicReconcilePlayStationStore' test.out

#- 429 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'dBmFwUO7Y0xhMLwx' \
    --body '{"currencyCode": "gRpTSUppvO3QG68K", "price": 0.0651768924363133, "productId": "D7QJQEEVDAg045Bv", "serviceLabels": [74, 85, 39]}' \
    > test.out 2>&1
eval_tap $? 429 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 430 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'swQ7vH8GScnP5QzR' \
    --body '{"appId": "BY1UrefgmVFBVz4K", "currencyCode": "RCU0p4jIt01gzH17", "language": "bCFl-oLkM", "price": 0.44614015726980183, "productId": "yN5rcDA3Wcv9ouAL", "region": "jgLZZzLU9w8MJRIz", "steamId": "IgJKg9y86BgnBQtm"}' \
    > test.out 2>&1
eval_tap $? 430 'SyncSteamInventory' test.out

#- 431 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5AilVhASFlYMVJtE' \
    --body '{"gameId": "2dAeC7pF73y9eALK", "language": "JNTw", "region": "bAuUJ7Fxg5LijlQT"}' \
    > test.out 2>&1
eval_tap $? 431 'SyncTwitchDropsEntitlement1' test.out

#- 432 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vq8Bh1p0NCKWNkLU' \
    --body '{"currencyCode": "5ty3uQa7Fl3ZhSML", "price": 0.31600021854804095, "productId": "rwnjTJVDlh112byT", "xstsToken": "YCDBnAvf8JpFuJSZ"}' \
    > test.out 2>&1
eval_tap $? 432 'SyncXboxInventory' test.out

#- 433 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'istM75544PDlVK8t' \
    --discounted  \
    --itemId 'aScpV0NtCxDDz5rx' \
    --limit '39' \
    --offset '34' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 433 'PublicQueryUserOrders' test.out

#- 434 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'LflBJjokLAaL4oAF' \
    --body '{"currencyCode": "2lqx8yneWKrOy4xc", "discountCodes": ["6cB3Pj63MJXIuLWY", "JTI3jlZPjoCdGiIP", "g30BqC5W7g7hiwum"], "discountedPrice": 2, "ext": {"JPGObyWCLyFPHaxk": {}, "KxEDvSoi2X9SygvM": {}, "G8QAaWUhIguMvKDO": {}}, "itemId": "rx0wQXKEroyKz2re", "language": "gfYx-HxOu", "price": 70, "quantity": 64, "region": "B2d1hZUnoQwg5uqg", "returnUrl": "oHaFyoczck0qJsgZ", "sectionId": "PfuelAiZBZcQGHHG"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicCreateUserOrder' test.out

#- 435 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'I7csI8ecZSvzXYOy' \
    --body '{"currencyCode": "tshBcKQytQagui6l", "discountCodes": ["sKF28n7UC7y1MKYV", "YgEZspOJ0NiZl6OV", "eoGFrDb8unXv1iE7"], "discountedPrice": 77, "itemId": "LAmcaEFBKgy92LYq", "price": 41, "quantity": 39}' \
    > test.out 2>&1
eval_tap $? 435 'PublicPreviewOrderPrice' test.out

#- 436 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'QcDN7OMCehk42acy' \
    --userId '8wsWaPyppR3ztPSA' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetUserOrder' test.out

#- 437 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'LA8LlV2sccbVr6HS' \
    --userId 'iXVzrG4EdKn8eypT' \
    > test.out 2>&1
eval_tap $? 437 'PublicCancelUserOrder' test.out

#- 438 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'zI497DG0ZNoJvvi4' \
    --userId 'Ys50iE7IjZoDzMmM' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserOrderHistories' test.out

#- 439 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'goMxZZ9AutWDfVOI' \
    --userId 'Nhql9CdDX4xiHpdf' \
    > test.out 2>&1
eval_tap $? 439 'PublicDownloadUserOrderReceipt' test.out

#- 440 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'KH35RWUUVEHCB5wz' \
    > test.out 2>&1
eval_tap $? 440 'PublicGetPaymentAccounts' test.out

#- 441 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'F6oLIrAwjAsgo51X' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'JBG2PmyeFaBiT3Sy' \
    > test.out 2>&1
eval_tap $? 441 'PublicDeletePaymentAccount' test.out

#- 442 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'LHXZSyfjukWmkfki' \
    --autoCalcEstimatedPrice  \
    --language 'F2GZPuyWBVH66JU1' \
    --region 'IICVNNRV4lBToTcn' \
    --storeId '1l44ebrKEKdeo779' \
    --viewId 'KG5yCz9jVs1lYK1M' \
    > test.out 2>&1
eval_tap $? 442 'PublicListActiveSections' test.out

#- 443 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'x9rEFkDqb31AZzwi' \
    --chargeStatus 'SETUP' \
    --itemId 'BaGdS41VRIyAHjYx' \
    --limit '97' \
    --offset '97' \
    --sku 'hCbXbeBEoTlfR33j' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 443 'PublicQueryUserSubscriptions' test.out

#- 444 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'qxqzy4KSA5UtSXWj' \
    --body '{"currencyCode": "ANSWIT9TLnuMLNJA", "itemId": "Ek3A6A6rYiIu8eLd", "language": "YL", "region": "Yqap7masUcayqmp7", "returnUrl": "vhz1T6cSrZL2CgHx", "source": "dmYDj9vZNgfI1AeY"}' \
    > test.out 2>&1
eval_tap $? 444 'PublicSubscribeSubscription' test.out

#- 445 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'He8WPQGPclChxLfb' \
    --itemId 'XrH6f2GDrNbLOjGz' \
    > test.out 2>&1
eval_tap $? 445 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 446 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '34ct0ctEeH43wYuL' \
    --userId 'nI7cTzIUERPlQI99' \
    > test.out 2>&1
eval_tap $? 446 'PublicGetUserSubscription' test.out

#- 447 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'hMc4NbiJWP5r9Ewb' \
    --userId 'IGMGJ70P9IqAyNlZ' \
    > test.out 2>&1
eval_tap $? 447 'PublicChangeSubscriptionBillingAccount' test.out

#- 448 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '2OwFSebBkXkaxtY9' \
    --userId '7TMJH8bO4GDHT6Za' \
    --body '{"immediate": false, "reason": "UkvlTKAhrxqHw7f8"}' \
    > test.out 2>&1
eval_tap $? 448 'PublicCancelSubscription' test.out

#- 449 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '13qNjzlcxXsmGGcJ' \
    --userId 'hauxfhVKIbRvUnyE' \
    --excludeFree  \
    --limit '24' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 449 'PublicGetUserSubscriptionBillingHistories' test.out

#- 450 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 's7QhC8hgSgytNEoj' \
    --language 'K3YgWH9l7rv6XUSI' \
    --storeId 'Nd4keCeiw7P2PtUr' \
    > test.out 2>&1
eval_tap $? 450 'PublicListViews' test.out

#- 451 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'PawQPaHARrhjbEU5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'n0PNuFyKW95dJsGo' \
    > test.out 2>&1
eval_tap $? 451 'PublicGetWallet' test.out

#- 452 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'BIjCKlD3axSivItV' \
    --namespace "$AB_NAMESPACE" \
    --userId '1txLINmdHTGLtX6T' \
    --limit '81' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 452 'PublicListUserWalletTransactions' test.out

#- 453 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 453 'PublicGetMyDLCContent' test.out

#- 454 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'ctYX1sZnYF3hWmCC' \
    --limit '70' \
    --offset '21' \
    --startTime 'rP0lJXexseo2e6BC' \
    --state 'FULFILL_FAILED' \
    --transactionId 'JTTRIHDKdVfOUr14' \
    --userId 'yZH00n8MsRjaB8iu' \
    > test.out 2>&1
eval_tap $? 454 'QueryFulfillments' test.out

#- 455 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate 'qnqNerQoHiDIJayv' \
    --baseAppId 'SNt8EQXsMbYi1yEI' \
    --categoryPath '9ychtyhjZSeDCKT4' \
    --features 'ilZB8apDTR3aL9su' \
    --includeSubCategoryItem  \
    --itemName 'nWp7V1s8LmXm0FaJ' \
    --itemStatus 'ACTIVE' \
    --itemType 'SEASON,BUNDLE,OPTIONBOX' \
    --limit '53' \
    --offset '83' \
    --region 'U02nZWwBdEFpfcca' \
    --sectionExclusive  \
    --sortBy 'createdAt:desc,displayOrder,createdAt:asc' \
    --storeId 'Dc86pxK9KhF4KRVP' \
    --tags 'oIuzAuQNjAfvOE2c' \
    --targetNamespace 'VjFp1CeCEfaV4ZGG' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 455 'QueryItemsV2' test.out

#- 456 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wbqOB4mD3E7AFHql' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 456 'ImportStore1' test.out

#- 457 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TTkL8cmpA0sZ0tge' \
    --body '{"itemIds": ["R4UV5SMZ8GUvWZvo", "Cmprkv7A8MRutCKC", "sqmx2zriOGB8b5qT"]}' \
    > test.out 2>&1
eval_tap $? 457 'ExportStore1' test.out

#- 458 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fp3cIxOI33nt54i5' \
    --body '{"entitlementCollectionId": "hdAezedcppbujZh1", "entitlementOrigin": "GooglePlay", "metadata": {"oTpYoe2uHaWnO98Y": {}, "wqHZnEDkfmNbDTMG": {}, "gET2yS6C8a8L0vQD": {}}, "origin": "Xbox", "rewards": [{"currency": {"currencyCode": "4EVpBmsUzx64Gr4X", "namespace": "Em0uYYuAmqhftIfe"}, "item": {"itemId": "2zdqZ7ht1vUiJ7jB", "itemName": "Xy8psNoHNalwgvju", "itemSku": "62rPFMbE1cW57GaN", "itemType": "ZLT1z0GqDZN7ftHO"}, "quantity": 15, "type": "ITEM"}, {"currency": {"currencyCode": "WH03zyr7kRbC31YM", "namespace": "JfRiD7djt1VeOFBD"}, "item": {"itemId": "A3gvCRfoBijpbMbl", "itemName": "GWnp94a6GKY0BrHi", "itemSku": "Ws0B0RhxQtgVgbN8", "itemType": "kr872hJvrOCdAEZ2"}, "quantity": 90, "type": "CURRENCY"}, {"currency": {"currencyCode": "t3uQ5nFrPXwxJZQp", "namespace": "keDHr0hjKBpDMIvK"}, "item": {"itemId": "4qfQ0pQIcYMBktqq", "itemName": "AAF6YG1dD1vECBb0", "itemSku": "1VFFhO5FcdTvIDQI", "itemType": "2uIi2SNZKqlJZsdn"}, "quantity": 68, "type": "ITEM"}], "source": "SELL_BACK", "transactionId": "lTpMlvRDZSIuM0OX"}' \
    > test.out 2>&1
eval_tap $? 458 'FulfillRewardsV2' test.out

#- 459 FulfillItems
./ng net.accelbyte.sdk.cli.Main platform fulfillItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'OHPluvsry8AKSZxO' \
    --userId 'hUhl3Y0EshaG0uDi' \
    --body '{"items": [{"duration": 73, "endDate": "1989-11-21T00:00:00Z", "entitlementCollectionId": "5fNESRVGeswvkzLN", "entitlementOrigin": "System", "itemId": "LvFUBZDnVrcwbsD0", "itemSku": "RDLxWgEWwoHpV8E1", "language": "xQZLa7Kw77UpCxNy", "metadata": {"x1jjdxNePPAJ6Z9U": {}, "zqIhZZiK0QEG6C9w": {}, "4lVRNOF1Bg6OHZzv": {}}, "orderNo": "dZHoIm4tKNhPjNIQ", "origin": "System", "quantity": 65, "region": "2nWlS9Sfjh0htyVa", "source": "GIFT", "startDate": "1984-07-16T00:00:00Z", "storeId": "API5tdPeFz9pGYsL"}, {"duration": 82, "endDate": "1987-09-02T00:00:00Z", "entitlementCollectionId": "VQSIqObR55tV0BlN", "entitlementOrigin": "System", "itemId": "iFvw0GSLBmie8SJc", "itemSku": "kSRbu7hgmUm7RVCU", "language": "REDdoGatGQ1SeOXs", "metadata": {"g4jofp9PvlQ1xdmr": {}, "4JDpvZgvPGHjV7MN": {}, "TpM7fSods1zdVT0a": {}}, "orderNo": "Wj58Othvd3jzMDAf", "origin": "System", "quantity": 68, "region": "gKSizvmxts5HSQvR", "source": "REFERRAL_BONUS", "startDate": "1974-12-12T00:00:00Z", "storeId": "QS9kVFUbeTeB9Kgn"}, {"duration": 64, "endDate": "1978-03-25T00:00:00Z", "entitlementCollectionId": "Q9lVMNyCiytnfMoO", "entitlementOrigin": "System", "itemId": "ld9FJJ10goNq8uq7", "itemSku": "9Du28SRRAMaQFEzp", "language": "peticckSUon7awfo", "metadata": {"l07696uxp5ieMjjO": {}, "fFSx3AJN97kUjwiC": {}, "mWQvbrxQpUSnos6Q": {}}, "orderNo": "iHyrcGeRv27hj73E", "origin": "Other", "quantity": 47, "region": "ufHuNIp0GXpM4nbG", "source": "ACHIEVEMENT", "startDate": "1978-07-07T00:00:00Z", "storeId": "H9zCfw7mCMkbvSIm"}]}' \
    > test.out 2>&1
eval_tap $? 459 'FulfillItems' test.out

#- 460 RevokeItems
./ng net.accelbyte.sdk.cli.Main platform revokeItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId '7JROcwVmGyrBpnTP' \
    --userId 'F4VrRiFSPs2ZMcVF' \
    > test.out 2>&1
eval_tap $? 460 'RevokeItems' test.out


rm -f "tmp.dat"

exit $EXIT_CODE