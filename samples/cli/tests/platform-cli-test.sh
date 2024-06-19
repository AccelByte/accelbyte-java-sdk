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
echo "1..456"

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
    --body '{"data": [{"id": "6fH24T805tVg8JqU", "rewards": [{"currency": {"currencyCode": "0jZpjvsugAOS7u8R", "namespace": "iWyerCSa8SRgwsAj"}, "item": {"itemId": "1ik1jglaDXTvKCWw", "itemSku": "NTAhd2wrS0uPdjhd", "itemType": "inpng5BLy8wbhMss"}, "quantity": 55, "type": "CURRENCY"}, {"currency": {"currencyCode": "japIkY9Rf4wP57dB", "namespace": "ZNR88YbCtmKy8M9z"}, "item": {"itemId": "VrjfGXZnqAQUoY1G", "itemSku": "jlIIk0iKoTTS1j02", "itemType": "o7JjTXAQN0qdskdQ"}, "quantity": 97, "type": "ITEM"}, {"currency": {"currencyCode": "k0eaKQDOJvrTefgl", "namespace": "Ss6g4iY9u02aCNYI"}, "item": {"itemId": "Wekp18lOC3mNqF7B", "itemSku": "l0LcghVHfPEspxwh", "itemType": "RON0bc1eMbEIjowL"}, "quantity": 33, "type": "CURRENCY"}]}, {"id": "esKoELCpobBEG8X6", "rewards": [{"currency": {"currencyCode": "45xpdXpai0rYaT5h", "namespace": "OPjaf3H0tYighU0V"}, "item": {"itemId": "UfcYHJbBfAKSiPW3", "itemSku": "VgsZXiR1DJ7HVWqM", "itemType": "kNSawQUWDFJvJBWi"}, "quantity": 4, "type": "CURRENCY"}, {"currency": {"currencyCode": "7UkBeIXuqDuAXI66", "namespace": "bQ71w0deoV9Lx5RD"}, "item": {"itemId": "A1l2XcrciYNEzvSZ", "itemSku": "IPkhSgORcz5S5Bvm", "itemType": "gBLxh4ijFnE3Tam6"}, "quantity": 33, "type": "ITEM"}, {"currency": {"currencyCode": "Z7PC6f6QkmZXElW9", "namespace": "YfRSse6AAz3S4czz"}, "item": {"itemId": "0QKFlAVmVLu4AOec", "itemSku": "0z8eBeeoip68J1ns", "itemType": "v4W2OJhtafxMSJlH"}, "quantity": 9, "type": "CURRENCY"}]}, {"id": "lLKWUtDQs61OQAox", "rewards": [{"currency": {"currencyCode": "yyQpRWCiiPDGQhNP", "namespace": "EwiJCf2XJVrlzqQl"}, "item": {"itemId": "s1ozhLVA3kE8jKvg", "itemSku": "atOEBM70TdlNBJYO", "itemType": "mpu1VCarzBsV6xnZ"}, "quantity": 73, "type": "CURRENCY"}, {"currency": {"currencyCode": "rzzjrcaug6CWVG8S", "namespace": "WP3glU6muswVJnNn"}, "item": {"itemId": "N7kAa7j0riFc5HTH", "itemSku": "QIoVsGo7dwV9DBqF", "itemType": "KHQkETJyTlUrwDTn"}, "quantity": 30, "type": "ITEM"}, {"currency": {"currencyCode": "ujQD4IEiH9Z5qXn3", "namespace": "aoRtlqOECohViHA5"}, "item": {"itemId": "CzgFSy8X1A3PrIfa", "itemSku": "pq5AAeMe4L3mDWOR", "itemType": "BVXTIIJM9XsYIIZx"}, "quantity": 17, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "PSN", "platformDlcIdMap": {"NMR9BgaWcFX3SUBh": "yoTsMWPAxUMkawaG", "pAyrIwMif3BOdkoc": "VTd4BxqGWV6mTJ0s", "Qs6XNbjvqhnUVLWu": "8olKdxL6ozRmDD0j"}}, {"platform": "XBOX", "platformDlcIdMap": {"ZX7kPBom8F9GLLTG": "8phc3n4iLoIllKlp", "O2pqiXJF3WGRaoQo": "mSJC4DdrKF7SUQPL", "G59e0k5ZtX6wK7Pp": "UlcIW32iK7MGt1ix"}}, {"platform": "XBOX", "platformDlcIdMap": {"5rA1WoVeJIePF8Zr": "QzP4zvtdxdbZUpd6", "FJtHJ1pyVwyKQLY6": "FEO65Rb3z7CYLM8I", "lsHqffnrfsGlfPaZ": "KBwa3Ddb60ufPpzw"}}]}' \
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
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName '1QGIFmlVf4jvapse' \
    --itemId 'E9LN9bvhOrHflIOd,6X3viLvtEk4mTIpU,A9gxo8SV38nEhoXm' \
    --limit '78' \
    --offset '57' \
    --origin 'Steam' \
    --userId 'W7l6jHMA2rG3nako' \
    > test.out 2>&1
eval_tap $? 61 'QueryEntitlements' test.out

#- 62 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'pAywelu01nryEJ0N,qoTow0qiOiC4j0ik,tm0ZPLkLOsp0LZ5n' \
    --limit '20' \
    --offset '99' \
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
    --body '{"entitlementGrantList": [{"collectionId": "N86Hl8kUXzt6bSc6", "endDate": "1971-06-25T00:00:00Z", "grantedCode": "WvgpVyW9dD1kOmvr", "itemId": "Aejcq2LgkQuaS7RB", "itemNamespace": "x3vim02jBOxrZDyv", "language": "RCX-nmpJ_zA", "origin": "Steam", "quantity": 36, "region": "ok4nOOCzfsflhjbn", "source": "GIFT", "startDate": "1974-10-17T00:00:00Z", "storeId": "vyH8paOJtxqMPpcV"}, {"collectionId": "fRwNj547fH0XrKED", "endDate": "1978-02-25T00:00:00Z", "grantedCode": "EY8VnocGAjci0V3t", "itemId": "Bf2jnHGKXphn50c9", "itemNamespace": "tNLDljhZ2jxLRX3z", "language": "Gqcd-nK", "origin": "GooglePlay", "quantity": 4, "region": "PlNos4yBRjrERHEo", "source": "OTHER", "startDate": "1987-08-05T00:00:00Z", "storeId": "H1XEfY6QAYn6WQ5U"}, {"collectionId": "BEU1QAOHfZiGhxOd", "endDate": "1972-07-18T00:00:00Z", "grantedCode": "uDXSxSc3aZPV87pn", "itemId": "a08gxefTYKhuxaEc", "itemNamespace": "7M4P7UckSC6ePeN8", "language": "eT-Vtsa-688", "origin": "Oculus", "quantity": 54, "region": "7c53q7akMpcmnnx6", "source": "PURCHASE", "startDate": "1995-01-23T00:00:00Z", "storeId": "Brop9v7aZK3h65hb"}], "userIds": ["N15zfQSfQrtfF3TQ", "jMQAg5mPYhrLTyU8", "N0OcNDLr36vzohZy"]}' \
    > test.out 2>&1
eval_tap $? 65 'GrantEntitlements' test.out

#- 66 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["OhgfY9JQYGF4bYXE", "cENx9xZlAchob44l", "ONDDwMvgI0HlyPR7"]' \
    > test.out 2>&1
eval_tap $? 66 'RevokeEntitlements' test.out

#- 67 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'wZNiVsF6xG2mXEQd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetEntitlement' test.out

#- 68 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '65' \
    --status 'SUCCESS' \
    --userId '5wWaDhukU4khGG4v' \
    > test.out 2>&1
eval_tap $? 68 'QueryFulfillmentHistories' test.out

#- 69 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'ZFTYnPkmSu4PWam1' \
    --eventType 'CHARGEBACK_REVERSED' \
    --externalOrderId 'K06MqQBErxgjVByc' \
    --limit '43' \
    --offset '96' \
    --startTime 'DDhoO05oKqymxLD1' \
    --status 'SUCCESS' \
    --userId 'cvw6T6mZEiwxxElp' \
    > test.out 2>&1
eval_tap $? 69 'QueryIAPClawbackHistory' test.out

#- 70 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "MYSWIeVzm7z9noow", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 25, "clientTransactionId": "SenE5hCFkIf5weqZ"}, {"amountConsumed": 83, "clientTransactionId": "8MH57l2Zsrh90ETt"}, {"amountConsumed": 14, "clientTransactionId": "mGukz3MnlrjcHp6B"}], "entitlementId": "8Vj7rXFgDnDkdZ9b", "usageCount": 32}, {"clientTransaction": [{"amountConsumed": 43, "clientTransactionId": "jb1tdA3QhjCMW64f"}, {"amountConsumed": 38, "clientTransactionId": "XhIjSoTB2NMKteza"}, {"amountConsumed": 31, "clientTransactionId": "AATPY8P8P3cfoivv"}], "entitlementId": "QxevecWw7Rry0KK5", "usageCount": 36}, {"clientTransaction": [{"amountConsumed": 12, "clientTransactionId": "2uSE7BEv3aevq6io"}, {"amountConsumed": 16, "clientTransactionId": "Z4GcLkt4pK32sJxl"}, {"amountConsumed": 28, "clientTransactionId": "cCTpTdRtCHvuk6B6"}], "entitlementId": "XTmSLyn50sigBVZx", "usageCount": 16}], "purpose": "8g6x2PyYDo5R3hLi"}, "originalTitleName": "D5sf5y1JsxJNGmyt", "paymentProductSKU": "0SQDUDoWBZVGLlkU", "purchaseDate": "etzCAWc9x1aMjgGi", "sourceOrderItemId": "m51T107XIZRZ7tZd", "titleName": "Is0xf4czdt7zqmSK"}, "eventDomain": "xOEQlVcx6GqsBq8v", "eventSource": "dhWVnuYLgpZehK0G", "eventType": "2nmyuViB9kRTcSQd", "eventVersion": 92, "id": "D1e6oI9FmYel0kOw", "timestamp": "72o8Zkgk0jS6rDWU"}' \
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
    --body '{"bundleId": "wfhKvrf2AaH4yCWr", "password": "HSppnIZkNnTn3rzH"}' \
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
    --body '{"sandboxId": "5NvAtcvNedgS1fUf"}' \
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
    --body '{"applicationName": "KmihDbmu8ePWlQMV", "serviceAccountId": "DXEHeiGTnwyEw6hI"}' \
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
    --body '{"data": [{"itemIdentity": "WDZrpP7rz3ISW510", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"XjYnSoIFeouC2m38": "kXrDZWlGVE9sJ4Np", "UtKp6M9I6nEwnZhs": "jwJeGwaPSDMZz95O", "YKiqaZD63xe5rruJ": "VfLGea0ZtlzUcuHA"}}, {"itemIdentity": "Xz0UV31MfuGaXsAu", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"E35YhyiDV90SeI5y": "ppBHoytVznCgNyx9", "fbT63ShEh8PbGikL": "jgjcj34uulU6FYBZ", "sWFbr3RSP0W9nBhv": "hf8Q0DtJMcYQdN66"}}, {"itemIdentity": "bswAgt65X4N1LQZm", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"I1IQcoBQELcNlZkq": "TZrKgXNwvm4e5GX6", "H742OixhtAoKiVm6": "URT95XhnUcvWB28M", "pusuhhDJ5slzgiWZ": "Etyd56LfxnbY97jj"}}]}' \
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
    --body '{"appId": "YgXchCbkXX26uEdC", "appSecret": "fQaMAQuTKfC0I2kN"}' \
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
    --body '{"backOfficeServerClientId": "jCMDtDMrentgn3Dh", "backOfficeServerClientSecret": "qciwIeShF9RKb9vv", "enableStreamJob": true, "environment": "vmHMxr5hPCJJztJB", "streamName": "g0tTJg46IewOXE2A", "streamPartnerName": "kCh3QIZsUf8lGFXc"}' \
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
    --body '{"backOfficeServerClientId": "mwTERHclOdxIwqej", "backOfficeServerClientSecret": "xe18rNdb8Otq6j1m", "enableStreamJob": true, "environment": "fHZinxNfgPAwkMBs", "streamName": "znlBUqnLT4AbGptK", "streamPartnerName": "aWNvPbpg7yrRvXfZ"}' \
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
    --body '{"appId": "6rvgvEY3Hht1SwqT", "publisherAuthenticationKey": "sKKKo37NHDOQe91P"}' \
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
    --body '{"clientId": "s3ztUIV0dS6hIH9c", "clientSecret": "4VfkyrwpuXxbaERb", "organizationId": "fgPmi0eHkt1mr9EO"}' \
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
    --body '{"relyingPartyCert": "IFg0dnWIYN2NVL70"}' \
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
    --password 'Iw157g00jr9b8MuY' \
    > test.out 2>&1
eval_tap $? 101 'UpdateXblBPCertFile' test.out

#- 102 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'mmeKTmBNvGYxEQdf' \
    --itemId '3ewoGGoY7xmFNAmj' \
    --itemType 'MEDIA' \
    --endTime 'DxsbzxrlaKEfkoYj' \
    --startTime 'Y2o6ouRW9UtNquwC' \
    > test.out 2>&1
eval_tap $? 102 'DownloadInvoiceDetails' test.out

#- 103 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature '3WgumrIz4NhGztZp' \
    --itemId 'r4U4fwQIiLXgmRas' \
    --itemType 'INGAMEITEM' \
    --endTime 'xaOBdPF0JmX8qwU1' \
    --startTime 'cTuHHPB5S3DvPRCz' \
    > test.out 2>&1
eval_tap $? 103 'GenerateInvoiceSummary' test.out

#- 104 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BrVUxmDOj3cvRFaT' \
    --body '{"categoryPath": "C11W0TGTCm4fZWuk", "targetItemId": "6pQxDQpKqxLGeMvr", "targetNamespace": "9TsvcMQ7dBsaIecR"}' \
    > test.out 2>&1
eval_tap $? 104 'SyncInGameItem' test.out

#- 105 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xIsZvD6rmzVr5XT1' \
    --body '{"appId": "Nxw0v1dMQ9Rrbk6C", "appType": "DEMO", "baseAppId": "0XIZRW491e94mQjV", "boothName": "OOBnIWhunElqZUod", "categoryPath": "p3IhtCSHy1ei1fIr", "clazz": "PvfHnRN06EjRwEQl", "displayOrder": 81, "entitlementType": "DURABLE", "ext": {"apJRfk4f9Zcw1pEH": {}, "AyNFxcVTKuAQTGh5": {}, "BxjWOozGoDtsUuYo": {}}, "features": ["AHwF3vGoav7MK0Pc", "zfjv9oYMXMjlVHY1", "5p8ED5QZAufwNa8l"], "flexible": false, "images": [{"as": "4mUHVbMPimNhcZsU", "caption": "3VAdMDcb4qlkiFAa", "height": 26, "imageUrl": "GlElXdEAOrVSnLoc", "smallImageUrl": "LVVYamQc4wcG5nDB", "width": 78}, {"as": "pWjmHZAAvKTH8Muq", "caption": "Ig0CzkguwuJCW7EE", "height": 65, "imageUrl": "SvNDlmM5nQFMGzs7", "smallImageUrl": "fzjgyc44mEh9tRk8", "width": 21}, {"as": "4XgBsbfzqxBPNe8a", "caption": "e1Il4aAtEbu4IjGd", "height": 33, "imageUrl": "GAbpEmDY9vLh3u6E", "smallImageUrl": "DsUmrV6kH4OotKwG", "width": 95}], "inventoryConfig": {"customAttributes": {"3dIjvBbA6bfbYaJC": {}, "Jjfk2TUvn95FhO7V": {}, "W3mbDVMDu87t0ldW": {}}, "serverCustomAttributes": {"f7iSGIiKFtWtn4Yr": {}, "2svKM6pqLGZ0TBuj": {}, "ELAUK6mQ5iZgbwwm": {}}, "slotUsed": 4}, "itemIds": ["iGzXtcknrgidKupv", "XO6aj4hCmTC34jxW", "4pIDwdqXpmRmut9H"], "itemQty": {"9XyWI8bp8fQxRuX9": 41, "CBgVRyihYNZ84CVh": 51, "RL1rEQG02zccA8wv": 76}, "itemType": "EXTENSION", "listable": true, "localizations": {"WUNd6lPKvqDejvqk": {"description": "lTSvDwuOrP9lzpiX", "localExt": {"0VuFpZum7izxe7NP": {}, "zjOa8E7wY76PxLv9": {}, "HBEUe89AwEw1HO4F": {}}, "longDescription": "nKtx4XLKAmlDr19u", "title": "J3nq6VerzVCcI8y3"}, "Cz0YqCKUh5RD9vNA": {"description": "p4jinFpnQ5xF9wwb", "localExt": {"vMZyeDeRnVfPUa6x": {}, "VVBcq3wZpFIYeAg7": {}, "9HcLJXJ7mpVI6eTY": {}}, "longDescription": "AjdPlCiQQC35cj4K", "title": "yOVgvnWbfRJtsB7c"}, "UQZ2QUAxJrINPXpp": {"description": "PNO3AfmXcgwC3IN6", "localExt": {"tvKgLB9QmJIOq9dP": {}, "5szG71utjsQ4CrRb": {}, "9gUCeVz7fWbZIdhe": {}}, "longDescription": "vfZvyV7AcodcZwKj", "title": "YDdmJOlzwm9Su4Fn"}}, "lootBoxConfig": {"rewardCount": 92, "rewards": [{"lootBoxItems": [{"count": 83, "duration": 66, "endDate": "1993-03-10T00:00:00Z", "itemId": "qftSjq7sn8yreciP", "itemSku": "LfkVyyJsbGpO6Jge", "itemType": "hDJxEN7JlZc8LMq1"}, {"count": 30, "duration": 69, "endDate": "1999-09-22T00:00:00Z", "itemId": "jZWu4yA3r0u4q1bT", "itemSku": "HXIjfJKyFlM0u1uu", "itemType": "oVdn9yVoSlKNchPH"}, {"count": 82, "duration": 19, "endDate": "1990-07-24T00:00:00Z", "itemId": "4X3LLaGPGdqLE8So", "itemSku": "hhhuiTnJarYYkHBD", "itemType": "dSzBXdxapwhd5IQY"}], "name": "BQuxLvPuWYvE3fsN", "odds": 0.3898038189193449, "type": "REWARD_GROUP", "weight": 25}, {"lootBoxItems": [{"count": 83, "duration": 32, "endDate": "1974-07-12T00:00:00Z", "itemId": "9X3fUSR1l9xLPBsm", "itemSku": "AUrD9L1IiD6MlcEP", "itemType": "hMDFzjHZ3sIhzOx2"}, {"count": 59, "duration": 53, "endDate": "1989-02-19T00:00:00Z", "itemId": "lvIomU3pIxM9n8D2", "itemSku": "eLMe3lt9qfx2UDcg", "itemType": "VE7L9FK6e0MrPc4v"}, {"count": 40, "duration": 44, "endDate": "1983-11-18T00:00:00Z", "itemId": "k9hVKlG56HlzGr7X", "itemSku": "jdyRJunZPkp6ccIB", "itemType": "nWyPw8mj7gyQ7XdI"}], "name": "szGRj46COPipH1MW", "odds": 0.7709233918009739, "type": "REWARD_GROUP", "weight": 34}, {"lootBoxItems": [{"count": 69, "duration": 56, "endDate": "1987-12-05T00:00:00Z", "itemId": "0qHJCWEfOJpZm9yE", "itemSku": "YWNGMy2pgSGSUOK6", "itemType": "8eqGJtWf1Ybgg8rd"}, {"count": 45, "duration": 0, "endDate": "1997-02-09T00:00:00Z", "itemId": "9bmrvHmO07KNqX9L", "itemSku": "M2IwEsdOGBXBwnzD", "itemType": "X8v3xgC1Ge9PdbTT"}, {"count": 54, "duration": 17, "endDate": "1989-12-19T00:00:00Z", "itemId": "Gp1r0sVZ6LJAOddI", "itemSku": "L2l3hPjNDKv2LWfX", "itemType": "qjr8fS79En3wYowB"}], "name": "dkaZ3y6i38XQjLDR", "odds": 0.25838317705549696, "type": "PROBABILITY_GROUP", "weight": 48}], "rollFunction": "CUSTOM"}, "maxCount": 19, "maxCountPerUser": 18, "name": "1LyEirURERnEMzpI", "optionBoxConfig": {"boxItems": [{"count": 26, "duration": 99, "endDate": "1996-04-20T00:00:00Z", "itemId": "6sjAHyCK5tNanGBr", "itemSku": "kzUvck3xTtmOFMeb", "itemType": "S4AdlNzwog2IhErk"}, {"count": 81, "duration": 15, "endDate": "1974-11-19T00:00:00Z", "itemId": "gUoj8u2WRcLiEtzV", "itemSku": "lnkflfn7pHY48F1d", "itemType": "l1q92m3iRlfnBAk0"}, {"count": 58, "duration": 34, "endDate": "1982-01-20T00:00:00Z", "itemId": "iAsR65yQ9ssuHdGm", "itemSku": "xncCEr0KcgeqzGbr", "itemType": "uNB72HHMkjzyBB4U"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 1, "fixedTrialCycles": 78, "graceDays": 29}, "regionData": {"AugK5kypNrp2nFe9": [{"currencyCode": "FmN86sK5LOq4ft5j", "currencyNamespace": "GcMICPUYnfG6jl9U", "currencyType": "VIRTUAL", "discountAmount": 19, "discountExpireAt": "1973-12-24T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1973-05-13T00:00:00Z", "expireAt": "1980-11-02T00:00:00Z", "price": 9, "purchaseAt": "1990-10-05T00:00:00Z", "trialPrice": 89}, {"currencyCode": "MgzISomCsodJrhQW", "currencyNamespace": "41q2OspCZbt3Uta5", "currencyType": "VIRTUAL", "discountAmount": 9, "discountExpireAt": "1981-04-20T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1971-01-25T00:00:00Z", "expireAt": "1985-11-05T00:00:00Z", "price": 59, "purchaseAt": "1976-05-11T00:00:00Z", "trialPrice": 29}, {"currencyCode": "hgMweexsIAP5vHLj", "currencyNamespace": "BJ9iqMcBL4BzhDUj", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1989-11-19T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1988-06-30T00:00:00Z", "expireAt": "1977-01-11T00:00:00Z", "price": 60, "purchaseAt": "1982-08-14T00:00:00Z", "trialPrice": 5}], "yhnoluO6ti0QP2ss": [{"currencyCode": "iJ66OzOj84O6tgoh", "currencyNamespace": "jtC7bzjPpucddXJ5", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1975-06-13T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1977-09-17T00:00:00Z", "expireAt": "1979-07-17T00:00:00Z", "price": 48, "purchaseAt": "1979-09-09T00:00:00Z", "trialPrice": 1}, {"currencyCode": "BYtzB0B4CxyQrUpI", "currencyNamespace": "FvORxTi79DpSjb39", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1976-01-19T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1974-07-10T00:00:00Z", "expireAt": "1972-01-21T00:00:00Z", "price": 73, "purchaseAt": "1986-09-13T00:00:00Z", "trialPrice": 36}, {"currencyCode": "nemn7M23SzUo4hNB", "currencyNamespace": "Dh9ZFP1OW0nXOErQ", "currencyType": "VIRTUAL", "discountAmount": 91, "discountExpireAt": "1993-11-20T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1979-05-31T00:00:00Z", "expireAt": "1993-11-07T00:00:00Z", "price": 30, "purchaseAt": "1976-10-14T00:00:00Z", "trialPrice": 26}], "K69yg9ADCGiXaLs2": [{"currencyCode": "xjHkinOD975nARHC", "currencyNamespace": "mhNHSXuqIHsxvaUo", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1977-07-07T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1982-03-03T00:00:00Z", "expireAt": "1980-06-15T00:00:00Z", "price": 28, "purchaseAt": "1976-03-18T00:00:00Z", "trialPrice": 47}, {"currencyCode": "N6wKZGW4y3f0R9s2", "currencyNamespace": "kndhhZhwAiLsZs4p", "currencyType": "REAL", "discountAmount": 91, "discountExpireAt": "1990-08-28T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1993-01-27T00:00:00Z", "expireAt": "1972-09-26T00:00:00Z", "price": 15, "purchaseAt": "1987-10-19T00:00:00Z", "trialPrice": 71}, {"currencyCode": "wJ00UH197MJ6zU7J", "currencyNamespace": "LMQyMWzYQCAaPJgo", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1996-10-16T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1978-10-11T00:00:00Z", "expireAt": "1989-01-18T00:00:00Z", "price": 0, "purchaseAt": "1993-07-25T00:00:00Z", "trialPrice": 96}]}, "saleConfig": {"currencyCode": "ImqK6tVsaUq3stUh", "price": 82}, "seasonType": "TIER", "sectionExclusive": false, "sellable": true, "sku": "NVIs7NRen2Y3Ns0Q", "stackable": true, "status": "ACTIVE", "tags": ["eaWytPfds1BYx0Ea", "URydf8ZyyZeHAWGg", "JUbUJRMbkcTglbU8"], "targetCurrencyCode": "6FyOjApNHBVfNOUR", "targetNamespace": "cjY3YYT9oTynmfIu", "thumbnailUrl": "BWgJTNFfM8M0IW4o", "useCount": 9}' \
    > test.out 2>&1
eval_tap $? 105 'CreateItem' test.out

#- 106 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'w6gYPvfn2Qt9iyq3' \
    --appId 'Nyk8ncu2Z3eDHH9W' \
    > test.out 2>&1
eval_tap $? 106 'GetItemByAppId' test.out

#- 107 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'mfqrgSfnx2h61X9d' \
    --baseAppId 'N1MGRXBJ6mVV7JS9' \
    --categoryPath 'qjNLwvI8JdiY3RRi' \
    --features 'LilmOGF6dLLIeIVI' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --limit '66' \
    --offset '79' \
    --region 'lyZVQ4X67tPZSTpP' \
    --sortBy 'displayOrder,createdAt:asc,displayOrder:asc' \
    --storeId 'xjrElvvDgw0ag7kS' \
    --tags 'WE0Hiqm5IuLryiEX' \
    --targetNamespace 'qvUWDjU1G0EVjVZw' \
    > test.out 2>&1
eval_tap $? 107 'QueryItems' test.out

#- 108 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features '1ToLuPakQN1MpOs1,RVFrcg2CXxepx78f,vsyhE2BKtyTDSIM7' \
    > test.out 2>&1
eval_tap $? 108 'ListBasicItemsByFeatures' test.out

#- 109 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'mkmvZ7Cmsh4US8o4' \
    --itemIds 'jfMANPpmZDdMiCxm' \
    > test.out 2>&1
eval_tap $? 109 'GetItems' test.out

#- 110 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'uCCVuFjS1GC1d2b9' \
    --sku '2B4vEgj3HOmhcWm4' \
    > test.out 2>&1
eval_tap $? 110 'GetItemBySku' test.out

#- 111 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '28XejRF94NIY9nMr' \
    --populateBundle  \
    --region 'BZo0lNUBDShHD32v' \
    --storeId 'vL28FPwTiXfLcxDC' \
    --sku '9Ynd02mECIQhfIhH' \
    > test.out 2>&1
eval_tap $? 111 'GetLocaleItemBySku' test.out

#- 112 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'tADUQ9zimQTQT95p' \
    --region 'FJUAJsyAfeKOufV4' \
    --storeId 'f15NohXu6opxQGRt' \
    --itemIds '6PqlkL0diRhLC10i' \
    --userId 'h2EQfY3XCv4hdOa6' \
    > test.out 2>&1
eval_tap $? 112 'GetEstimatedPrice' test.out

#- 113 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'FdZhNMd1onFjGRbx' \
    --sku 'tABPXDmgNEJBhgGq' \
    > test.out 2>&1
eval_tap $? 113 'GetItemIdBySku' test.out

#- 114 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku '5GIDhNC66szbCCf7,3IFbRkPSSITz4TjC,rJHXGXku2YVuOzhx' \
    --storeId 'HmnrrV9ZGWrZ05sx' \
    > test.out 2>&1
eval_tap $? 114 'GetBulkItemIdBySkus' test.out

#- 115 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'e6A6RpmKDebNkylb' \
    --region 'ynkgT9vayLLiizac' \
    --storeId '7Ge6zKJdlt7rjF5R' \
    --itemIds 'aJwvkWVco2LTo5ij' \
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
    --platform 'lvDF8qBWCQ9dLWYy' \
    --userId 'S8zdhMeBXH8x6HdV' \
    --body '{"itemIds": ["fZVDAiU6iJOF7JKZ", "FNk2NKy59X8iOg2s", "VBiCoeC5weXJl7Pe"]}' \
    > test.out 2>&1
eval_tap $? 117 'ValidateItemPurchaseCondition' test.out

#- 118 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iMH8z8dVej8N2yv6' \
    --body '{"changes": [{"itemIdentities": ["VTnOK7xAvM7tuL81", "lsR7xxSVp3Gd2TK0", "HzYviTgYmx82JVBR"], "itemIdentityType": "ITEM_ID", "regionData": {"PZ6Iz8tne5dbguBF": [{"currencyCode": "6Gsvvdl8jHz9x7XZ", "currencyNamespace": "IjU4IK9lOLaZaMph", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1979-07-22T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1994-03-16T00:00:00Z", "discountedPrice": 63, "expireAt": "1972-10-29T00:00:00Z", "price": 16, "purchaseAt": "1991-02-07T00:00:00Z", "trialPrice": 76}, {"currencyCode": "JjoEEXBLIxGnNuho", "currencyNamespace": "JM3WWPvvCiCf33Vi", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1972-11-30T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1993-12-15T00:00:00Z", "discountedPrice": 89, "expireAt": "1978-03-02T00:00:00Z", "price": 30, "purchaseAt": "1982-09-23T00:00:00Z", "trialPrice": 92}, {"currencyCode": "kUWNizk5UcPAGv6c", "currencyNamespace": "1ESC6hZYTYZbzf5a", "currencyType": "VIRTUAL", "discountAmount": 7, "discountExpireAt": "1991-12-10T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1981-11-23T00:00:00Z", "discountedPrice": 100, "expireAt": "1980-02-16T00:00:00Z", "price": 13, "purchaseAt": "1976-08-17T00:00:00Z", "trialPrice": 14}], "AKx27MSBqabUXOGk": [{"currencyCode": "koMUZn1YXj5zFZeO", "currencyNamespace": "COR9NvBQZSJPOIKr", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1986-05-21T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1997-07-18T00:00:00Z", "discountedPrice": 98, "expireAt": "1973-08-02T00:00:00Z", "price": 0, "purchaseAt": "1975-11-10T00:00:00Z", "trialPrice": 42}, {"currencyCode": "rnpZxNnLRH36bqS2", "currencyNamespace": "oFY76PU1AziBOHEA", "currencyType": "REAL", "discountAmount": 67, "discountExpireAt": "1998-01-27T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1976-08-27T00:00:00Z", "discountedPrice": 5, "expireAt": "1981-04-30T00:00:00Z", "price": 39, "purchaseAt": "1997-01-17T00:00:00Z", "trialPrice": 42}, {"currencyCode": "2FbrTFznTgDIwZIR", "currencyNamespace": "Wf6T3by2kYSCdnFK", "currencyType": "REAL", "discountAmount": 97, "discountExpireAt": "1998-12-14T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1971-01-18T00:00:00Z", "discountedPrice": 93, "expireAt": "1971-03-24T00:00:00Z", "price": 22, "purchaseAt": "1979-03-23T00:00:00Z", "trialPrice": 19}], "9Rdd85bdYUumPKVS": [{"currencyCode": "ZCg3XTc9vQe0dHJf", "currencyNamespace": "F6KIuvnRCa9JktyB", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1978-03-27T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1997-09-14T00:00:00Z", "discountedPrice": 74, "expireAt": "1990-05-21T00:00:00Z", "price": 24, "purchaseAt": "1986-12-10T00:00:00Z", "trialPrice": 100}, {"currencyCode": "icdrxVhrtwSd9QWV", "currencyNamespace": "MYz7TU1TsxsChScl", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1989-01-06T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1984-01-01T00:00:00Z", "discountedPrice": 57, "expireAt": "1977-03-07T00:00:00Z", "price": 51, "purchaseAt": "1988-10-22T00:00:00Z", "trialPrice": 41}, {"currencyCode": "zyv6gFZXI5nXJ7hL", "currencyNamespace": "i6HweweRmyo91dIn", "currencyType": "VIRTUAL", "discountAmount": 35, "discountExpireAt": "1998-08-11T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1986-01-27T00:00:00Z", "discountedPrice": 72, "expireAt": "1999-01-13T00:00:00Z", "price": 87, "purchaseAt": "1979-12-30T00:00:00Z", "trialPrice": 34}]}}, {"itemIdentities": ["PAd9sxoLnWGP1Paf", "IjLX8ce0KbNN7Ycl", "2JfmQplvGjVQ4aeb"], "itemIdentityType": "ITEM_ID", "regionData": {"F5wnJDg9Q3WXiydC": [{"currencyCode": "OInVolsr6CHmj763", "currencyNamespace": "vLwtYEJTSiXjcY5Z", "currencyType": "REAL", "discountAmount": 22, "discountExpireAt": "1992-06-19T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1987-11-05T00:00:00Z", "discountedPrice": 23, "expireAt": "1983-11-05T00:00:00Z", "price": 75, "purchaseAt": "1991-11-03T00:00:00Z", "trialPrice": 45}, {"currencyCode": "xSFZ0LpupEi5DbkV", "currencyNamespace": "s3qFTi1t530Wj1Wf", "currencyType": "VIRTUAL", "discountAmount": 86, "discountExpireAt": "1988-07-31T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1989-01-18T00:00:00Z", "discountedPrice": 52, "expireAt": "1998-12-26T00:00:00Z", "price": 97, "purchaseAt": "1977-12-29T00:00:00Z", "trialPrice": 23}, {"currencyCode": "XrA3XUGud4tVjmxE", "currencyNamespace": "f4XvVhFJTxFHITBg", "currencyType": "VIRTUAL", "discountAmount": 48, "discountExpireAt": "1997-06-23T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1992-04-13T00:00:00Z", "discountedPrice": 3, "expireAt": "1979-03-28T00:00:00Z", "price": 8, "purchaseAt": "1981-11-30T00:00:00Z", "trialPrice": 95}], "MHIKeTyBG5dCUoEx": [{"currencyCode": "nKfV3869IN4V1Odh", "currencyNamespace": "H4GVU7Exlkmc4xYi", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1971-11-07T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1983-04-29T00:00:00Z", "discountedPrice": 43, "expireAt": "1979-09-16T00:00:00Z", "price": 42, "purchaseAt": "1979-03-02T00:00:00Z", "trialPrice": 56}, {"currencyCode": "XONgUwJnUpryDeRc", "currencyNamespace": "pUvlrw2MwC1uuokp", "currencyType": "REAL", "discountAmount": 92, "discountExpireAt": "1988-11-04T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1975-11-05T00:00:00Z", "discountedPrice": 59, "expireAt": "1998-11-30T00:00:00Z", "price": 98, "purchaseAt": "1979-07-12T00:00:00Z", "trialPrice": 65}, {"currencyCode": "e5n9Lx3QcFo9gxOg", "currencyNamespace": "vDc7xMrRKvw8ISP2", "currencyType": "REAL", "discountAmount": 74, "discountExpireAt": "1996-04-08T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1985-07-31T00:00:00Z", "discountedPrice": 89, "expireAt": "1996-12-17T00:00:00Z", "price": 87, "purchaseAt": "1985-05-15T00:00:00Z", "trialPrice": 49}], "xnWR5sheLgsAF4ct": [{"currencyCode": "v5guycGiq9j2EyIk", "currencyNamespace": "nfLDpgHnMOn8nc3g", "currencyType": "REAL", "discountAmount": 9, "discountExpireAt": "1997-10-15T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1983-06-02T00:00:00Z", "discountedPrice": 49, "expireAt": "1973-09-09T00:00:00Z", "price": 9, "purchaseAt": "1980-12-21T00:00:00Z", "trialPrice": 75}, {"currencyCode": "yt4udIv22M18uux9", "currencyNamespace": "xBomQFPFWy5cwNPI", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1987-04-30T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1973-06-12T00:00:00Z", "discountedPrice": 46, "expireAt": "1979-08-31T00:00:00Z", "price": 12, "purchaseAt": "1997-02-10T00:00:00Z", "trialPrice": 58}, {"currencyCode": "OJDUT0uKAPrARya2", "currencyNamespace": "IMlNiXpF4qvsUUpH", "currencyType": "VIRTUAL", "discountAmount": 18, "discountExpireAt": "1972-12-20T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1991-01-18T00:00:00Z", "discountedPrice": 57, "expireAt": "1998-09-24T00:00:00Z", "price": 22, "purchaseAt": "1976-05-11T00:00:00Z", "trialPrice": 6}]}}, {"itemIdentities": ["zcBQMAEcNcJqrKxn", "MzSYoc4ZjiMY4H34", "B6wVd8ipcKDwQeUW"], "itemIdentityType": "ITEM_SKU", "regionData": {"HB6GO9zP3FaepA3b": [{"currencyCode": "3YJ9nJM6vtT27xv8", "currencyNamespace": "5K5MU2qmbeqaVemI", "currencyType": "REAL", "discountAmount": 7, "discountExpireAt": "1992-08-15T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1977-11-30T00:00:00Z", "discountedPrice": 32, "expireAt": "1981-09-17T00:00:00Z", "price": 63, "purchaseAt": "1981-11-26T00:00:00Z", "trialPrice": 99}, {"currencyCode": "vlBIEgjse5kd6GED", "currencyNamespace": "o08yq5E5HleLoog4", "currencyType": "REAL", "discountAmount": 42, "discountExpireAt": "1973-11-03T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1995-08-13T00:00:00Z", "discountedPrice": 65, "expireAt": "1981-05-06T00:00:00Z", "price": 74, "purchaseAt": "1980-07-07T00:00:00Z", "trialPrice": 67}, {"currencyCode": "lXvVcJerTPW02PWs", "currencyNamespace": "HiKYArAxnKBfBfDl", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1992-08-23T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1972-06-15T00:00:00Z", "discountedPrice": 30, "expireAt": "1984-06-18T00:00:00Z", "price": 5, "purchaseAt": "1976-05-06T00:00:00Z", "trialPrice": 60}], "nbz4ys7j6lxuU3u2": [{"currencyCode": "HEG0qfKegvFTD1sP", "currencyNamespace": "ykS8YLmwtYgWGcA0", "currencyType": "REAL", "discountAmount": 91, "discountExpireAt": "1978-09-28T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1998-10-03T00:00:00Z", "discountedPrice": 77, "expireAt": "1988-02-22T00:00:00Z", "price": 37, "purchaseAt": "1988-07-31T00:00:00Z", "trialPrice": 1}, {"currencyCode": "VmaGYxUX1B9oVuzG", "currencyNamespace": "2CnYX2YBF2g7TVtz", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1987-12-30T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1997-04-22T00:00:00Z", "discountedPrice": 86, "expireAt": "1972-02-29T00:00:00Z", "price": 32, "purchaseAt": "1999-04-18T00:00:00Z", "trialPrice": 17}, {"currencyCode": "nVfxPwc259HF9ejH", "currencyNamespace": "aILQruAuYyJLYGqM", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1999-12-23T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1978-06-14T00:00:00Z", "discountedPrice": 23, "expireAt": "1993-02-19T00:00:00Z", "price": 34, "purchaseAt": "1976-03-31T00:00:00Z", "trialPrice": 32}], "pq03BGdIk4oEogFV": [{"currencyCode": "GR71rJOBy6lsj1AK", "currencyNamespace": "GBjnHmaAu4YK87DY", "currencyType": "VIRTUAL", "discountAmount": 27, "discountExpireAt": "1995-08-05T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1994-01-18T00:00:00Z", "discountedPrice": 59, "expireAt": "1971-07-29T00:00:00Z", "price": 5, "purchaseAt": "1995-01-08T00:00:00Z", "trialPrice": 84}, {"currencyCode": "GWmKgE8CZ4AELr5l", "currencyNamespace": "raa5v5P5Cj8hgFsq", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1972-03-01T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1978-10-16T00:00:00Z", "discountedPrice": 71, "expireAt": "1992-03-09T00:00:00Z", "price": 26, "purchaseAt": "1990-05-07T00:00:00Z", "trialPrice": 63}, {"currencyCode": "rwPsa9YD92CX0rIT", "currencyNamespace": "ajpwHITGeHTnqRbz", "currencyType": "VIRTUAL", "discountAmount": 91, "discountExpireAt": "1985-07-11T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1997-09-15T00:00:00Z", "discountedPrice": 34, "expireAt": "1974-10-25T00:00:00Z", "price": 56, "purchaseAt": "1971-12-20T00:00:00Z", "trialPrice": 25}]}}]}' \
    > test.out 2>&1
eval_tap $? 118 'BulkUpdateRegionData' test.out

#- 119 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'OPTIONBOX' \
    --limit '74' \
    --offset '20' \
    --sortBy 'A3V9DKlCeZ7mLYsH' \
    --storeId 'ooOIaxIpb1cIOJPS' \
    --keyword '3lJ80YJ41U4ooQ98' \
    --language '0ywmg1pWpWit1QC7' \
    > test.out 2>&1
eval_tap $? 119 'SearchItems' test.out

#- 120 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '65' \
    --offset '93' \
    --sortBy 'displayOrder,name:asc' \
    --storeId 'yIlAwjTZdRZJJzWZ' \
    > test.out 2>&1
eval_tap $? 120 'QueryUncategorizedItems' test.out

#- 121 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'wvTX2bamSCvX1nwv' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'SWdDwD7WJHzgNZUK' \
    > test.out 2>&1
eval_tap $? 121 'GetItem' test.out

#- 122 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'sI5y0mR3zMyTsftK' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qnsIJctAdxyZVKHA' \
    --body '{"appId": "9DkaSOWgtg8yw8lH", "appType": "SOFTWARE", "baseAppId": "qJqzoKMRMG541PAi", "boothName": "NjULsx4SnKNXLMUa", "categoryPath": "DSwwQlnNRZJHBSB4", "clazz": "fZWEFIZs28Ff1kZp", "displayOrder": 44, "entitlementType": "CONSUMABLE", "ext": {"ktx3N7WNMYIfcDKb": {}, "Lu8pnK34oA1keYXJ": {}, "vtggDdXjbdjMBahF": {}}, "features": ["z1eI7Q5pu9PutLf6", "BJ9Sgl7H1sdH2RIJ", "ZZGMTcqnWrIprOv0"], "flexible": false, "images": [{"as": "rvZoBGQbO4S3rURG", "caption": "WUzPAE6SdV4D5jft", "height": 89, "imageUrl": "2FI3vyyqRzc20O7F", "smallImageUrl": "dsJP1G9tyBTfERXd", "width": 44}, {"as": "MYDUTLBeCidXjuGg", "caption": "x8ncXejmeZtzT0qj", "height": 59, "imageUrl": "ltsqfiZrthVvyX0O", "smallImageUrl": "CKDJE3RMUddwSSgx", "width": 58}, {"as": "R3hCGNgaJmuALlMQ", "caption": "l9RLrthbfp0VgweL", "height": 24, "imageUrl": "oNB6hI6IpGcToWgF", "smallImageUrl": "vdRhG9NwV3zDuqVl", "width": 98}], "inventoryConfig": {"customAttributes": {"vJrBCqeg67d4RWOq": {}, "O4U0bitNQLzwRoWn": {}, "R0AbkCPY70FmvviV": {}}, "serverCustomAttributes": {"IBbcujF8Vk5qb8Nh": {}, "WWwaxyMchkt8l5IP": {}, "SrwrJl7wYIVw13NC": {}}, "slotUsed": 29}, "itemIds": ["l4F9G6Dl5TFwBY6H", "KXAblkT8VGgSH8MG", "ZGwiVj7eDTaka9AB"], "itemQty": {"fX1IByPEOuPhGspR": 17, "3b6o5uB2XM6IHy7E": 63, "cubN4AUUPFPscZsX": 8}, "itemType": "SEASON", "listable": false, "localizations": {"D4DMtqfIGiGJovgW": {"description": "SRxZ8N4UQ2fg3V1o", "localExt": {"2x0hL5DuBDqMyIAz": {}, "Wze94MEdJFAy2JTl": {}, "lJkRGB8jqJEd6eqq": {}}, "longDescription": "sBVyONV0JRtozI0j", "title": "pliCFQ6WgJpGPigd"}, "c5VyC4qvWjVac1cQ": {"description": "vSxgTNIUzxDgBlIb", "localExt": {"uzm7DzJ20NFRJIhF": {}, "XR2dYprPmbpuptEC": {}, "Gd5cdXC2Sesc6y68": {}}, "longDescription": "whNBYl9iCqfW6rqG", "title": "OQny4ij4ysYPonb5"}, "9gQffkNOmubxEJr2": {"description": "qEAuJbpZSrcbc4LW", "localExt": {"fKaY5c1tP5TDuI5f": {}, "6m4KC07CnsZe32hq": {}, "EcB1ExYMBb3ckvoa": {}}, "longDescription": "JYdMqGegcg3eRvBZ", "title": "XN3cjIXmFWRJnj8x"}}, "lootBoxConfig": {"rewardCount": 82, "rewards": [{"lootBoxItems": [{"count": 81, "duration": 27, "endDate": "1988-08-27T00:00:00Z", "itemId": "a6Zuxk6u6HXXdiC9", "itemSku": "ZDj4E4mv12FNXypo", "itemType": "OLl13j84P0KqirJ4"}, {"count": 86, "duration": 14, "endDate": "1976-11-13T00:00:00Z", "itemId": "eUYcYJ4QzXCmqr6g", "itemSku": "mPGaHP5SVPvRLiDi", "itemType": "0mNHb6Lx8eq8SGNw"}, {"count": 62, "duration": 62, "endDate": "1992-11-25T00:00:00Z", "itemId": "eRj17xGhaBKoUfiH", "itemSku": "jGmCyPsKCJTv1ic9", "itemType": "gvagF2cSuztsJ5tj"}], "name": "64gV7nmDk29mcjSu", "odds": 0.40713130669594944, "type": "PROBABILITY_GROUP", "weight": 45}, {"lootBoxItems": [{"count": 85, "duration": 3, "endDate": "1991-12-03T00:00:00Z", "itemId": "StqPtQmQN6eKAGiZ", "itemSku": "FCftT0RWECdjWYrn", "itemType": "ulxcCKAru8pOaAVL"}, {"count": 59, "duration": 85, "endDate": "1985-04-27T00:00:00Z", "itemId": "4k3JwkdaxR7GJpYm", "itemSku": "uYCPG181q9GA5Dyd", "itemType": "C2D8UT6KOc4VPDUR"}, {"count": 45, "duration": 0, "endDate": "1979-07-19T00:00:00Z", "itemId": "JligLlRxOelKykIC", "itemSku": "RxF6HtlER2txs4qr", "itemType": "NARATn6KXOutlYBb"}], "name": "LhL8KXx25FZfQIod", "odds": 0.7643235281614817, "type": "REWARD", "weight": 45}, {"lootBoxItems": [{"count": 34, "duration": 79, "endDate": "1992-02-07T00:00:00Z", "itemId": "sBpCJBIXLGYcwWVR", "itemSku": "K6UKk5ozrXA4HZHN", "itemType": "yq9odanhR1Zrm3th"}, {"count": 95, "duration": 1, "endDate": "1982-06-14T00:00:00Z", "itemId": "V87yfkycLSVdleSa", "itemSku": "AylsmLYe2phYOgT5", "itemType": "kDTyPl3dKF7NXEjr"}, {"count": 74, "duration": 79, "endDate": "1995-03-23T00:00:00Z", "itemId": "OHGwbADMfuOmh0lc", "itemSku": "iRhVZ2DeoODXMzLS", "itemType": "rzoiBnYi5UWs3tYl"}], "name": "YeMoCimJySocRvUW", "odds": 0.4684644644629602, "type": "REWARD_GROUP", "weight": 37}], "rollFunction": "CUSTOM"}, "maxCount": 65, "maxCountPerUser": 85, "name": "ZKPNoN9AWtLK9TFg", "optionBoxConfig": {"boxItems": [{"count": 16, "duration": 6, "endDate": "1984-03-14T00:00:00Z", "itemId": "oijBPAp6EPb988Nz", "itemSku": "xrDKVpULjjiw3NeV", "itemType": "G4DJi9DaMrc0WFgK"}, {"count": 18, "duration": 63, "endDate": "1993-12-24T00:00:00Z", "itemId": "5x2CPVYYG9WvoGmA", "itemSku": "mvaVV5YfxnUNcwjr", "itemType": "7gSGhnfuF4WZiQVI"}, {"count": 59, "duration": 8, "endDate": "1995-12-19T00:00:00Z", "itemId": "pWd3UM08gMXhdf3j", "itemSku": "uXW4JprIb3CJCAtv", "itemType": "SG8Cfa9dzOJDGCTH"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 20, "fixedTrialCycles": 60, "graceDays": 10}, "regionData": {"xeR6d7r1SQw80JfM": [{"currencyCode": "pPrSqYypRUnq5o4E", "currencyNamespace": "TeCUYG9ccTt7Wxw8", "currencyType": "VIRTUAL", "discountAmount": 51, "discountExpireAt": "1981-12-07T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1981-01-17T00:00:00Z", "expireAt": "1994-07-25T00:00:00Z", "price": 46, "purchaseAt": "1993-05-04T00:00:00Z", "trialPrice": 53}, {"currencyCode": "dk0HATGylx2JG2KN", "currencyNamespace": "GfhzfCTxxrsRRLee", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1988-10-17T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1978-08-29T00:00:00Z", "expireAt": "1996-12-08T00:00:00Z", "price": 67, "purchaseAt": "1988-01-27T00:00:00Z", "trialPrice": 18}, {"currencyCode": "YohxMp3uOQIybqWf", "currencyNamespace": "G9BJ6FVKlbYHtbPt", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1981-01-08T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1991-02-19T00:00:00Z", "expireAt": "1982-12-28T00:00:00Z", "price": 42, "purchaseAt": "1976-02-19T00:00:00Z", "trialPrice": 31}], "FDa6wUQvehKqwCh8": [{"currencyCode": "6XmRkCEcfHDCdl59", "currencyNamespace": "Wp9A3tXGve6DdK6u", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1986-06-09T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1991-05-01T00:00:00Z", "expireAt": "1972-10-15T00:00:00Z", "price": 29, "purchaseAt": "1985-02-27T00:00:00Z", "trialPrice": 50}, {"currencyCode": "zBw3xLUcCEt0Dzmk", "currencyNamespace": "Jq1sml5bYt76BNsi", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1987-03-11T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1993-03-31T00:00:00Z", "expireAt": "1971-01-24T00:00:00Z", "price": 61, "purchaseAt": "1985-01-30T00:00:00Z", "trialPrice": 32}, {"currencyCode": "Fe8ATUqVxcSthrpn", "currencyNamespace": "MUBsnUfuQIcSbUt5", "currencyType": "REAL", "discountAmount": 67, "discountExpireAt": "1982-03-24T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1988-03-22T00:00:00Z", "expireAt": "1977-09-21T00:00:00Z", "price": 66, "purchaseAt": "1992-05-04T00:00:00Z", "trialPrice": 27}], "uUsdtq4dOwNESzCE": [{"currencyCode": "W9dUVhZjLftC3sCS", "currencyNamespace": "8CpLCqPD9CeDEdCn", "currencyType": "REAL", "discountAmount": 97, "discountExpireAt": "1990-09-13T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1975-06-10T00:00:00Z", "expireAt": "1998-08-12T00:00:00Z", "price": 1, "purchaseAt": "1976-09-17T00:00:00Z", "trialPrice": 19}, {"currencyCode": "r8CDapjwNOl4k8rV", "currencyNamespace": "Nrm8drv8QD2JOe2N", "currencyType": "VIRTUAL", "discountAmount": 92, "discountExpireAt": "1984-05-25T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1986-09-11T00:00:00Z", "expireAt": "1985-06-23T00:00:00Z", "price": 12, "purchaseAt": "1978-07-04T00:00:00Z", "trialPrice": 91}, {"currencyCode": "PgIGuetxFMqXCQMA", "currencyNamespace": "qQ2ZRGzNtrThFa9X", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1977-04-26T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1980-11-14T00:00:00Z", "expireAt": "1977-11-13T00:00:00Z", "price": 41, "purchaseAt": "1975-10-06T00:00:00Z", "trialPrice": 100}]}, "saleConfig": {"currencyCode": "ZJ7O8sAQ32wj9uaD", "price": 53}, "seasonType": "TIER", "sectionExclusive": true, "sellable": true, "sku": "qs2mqtnGAqXUjNyp", "stackable": true, "status": "INACTIVE", "tags": ["JEhxPGbEk7s7gw07", "FlounC3vJKBC7Swg", "oViPeIB4Ehy0Y5aS"], "targetCurrencyCode": "JVDginxAM77eY9C1", "targetNamespace": "4FbfiI2NPvl1kCY5", "thumbnailUrl": "bEokxXxkWZbjf7GZ", "useCount": 48}' \
    > test.out 2>&1
eval_tap $? 122 'UpdateItem' test.out

#- 123 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'yumBeIqdQGZC5kM0' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId '3HHijsQRj7N8IAjm' \
    > test.out 2>&1
eval_tap $? 123 'DeleteItem' test.out

#- 124 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'sonjj0ZR50BQ1U6a' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 64, "orderNo": "DV5uTcYsoahUrELQ"}' \
    > test.out 2>&1
eval_tap $? 124 'AcquireItem' test.out

#- 125 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId '1btjJOqQMgZWAU6E' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '92nHJzvw7tnYtGfv' \
    > test.out 2>&1
eval_tap $? 125 'GetApp' test.out

#- 126 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId '0EJyjBu4EzwRjD7j' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mQJeFPghqamSc5y0' \
    --body '{"carousel": [{"alt": "X48eT7Mluexk87b9", "previewUrl": "Z5BTsEA3EdmW8saa", "thumbnailUrl": "bP4xRowfNojzPXI2", "type": "video", "url": "ThyGnbjmPDKFS6u9", "videoSource": "youtube"}, {"alt": "TYwNN3UYhic03qGE", "previewUrl": "g5fNzBVrjo3g8CfR", "thumbnailUrl": "wtyl1HeT7VEPgG40", "type": "video", "url": "yXzsOzgck078Igho", "videoSource": "youtube"}, {"alt": "TauyD3XCXVMiyEvM", "previewUrl": "f9yilUEujk6oqYo1", "thumbnailUrl": "HQYTFzwdOMdupwD4", "type": "video", "url": "CBfGUdVEdvdQL7sV", "videoSource": "vimeo"}], "developer": "hfwkuVykH4RpfmjI", "forumUrl": "XFGZ5PKdbabJIkNn", "genres": ["MassivelyMultiplayer", "Adventure", "FreeToPlay"], "localizations": {"P1Tkm08luh4dpPRM": {"announcement": "DbUXBWTbpAogG2wl", "slogan": "ZkLhuU5FI8NijFI0"}, "GKwJ3vfXlsAMy2Zp": {"announcement": "2UAGxHnmSxvkG9UR", "slogan": "5q9neoW6JBcGp9Rx"}, "2RfcRhXpmeeHdvph": {"announcement": "as9S7ivHEoLbUMM4", "slogan": "7f1UreUpxEkXIbE1"}}, "platformRequirements": {"ETzRJZKMavu4Ul2I": [{"additionals": "aieEbPSE7TGkeHsY", "directXVersion": "sW9oGBN1pYMBwbPZ", "diskSpace": "TlMlUvFEiGprcNSQ", "graphics": "9kEeXBZ6FVrBzyhy", "label": "hoS6a9oe0JaXFpff", "osVersion": "28uYbe4Cf2HEHvVe", "processor": "vhISjbtBJUK5fE3O", "ram": "ufPSX3PdOU2V9yw9", "soundCard": "4oa8UJ34TIedV3Hy"}, {"additionals": "oX4VnO2LpBU08wfn", "directXVersion": "lHBXFIqFUmgUSMM5", "diskSpace": "au8GJT0mkVPI6zUt", "graphics": "f3QaJPGrTNcXXTUI", "label": "ggoH89QNmI17UDb1", "osVersion": "9R6H7r1ta3m7jK5p", "processor": "xe82pgFiAS6piIzm", "ram": "c8rKrKEPGSAcong6", "soundCard": "eNERUf8kjci1Ctcc"}, {"additionals": "v9Gv4tOcbnuCqf0l", "directXVersion": "m6WBkIzjoSV31tvm", "diskSpace": "MB6jzrpRGESmooHi", "graphics": "CV4GUOnXpapXQGRa", "label": "kUbcG7PcR4eiU3Id", "osVersion": "i55jNrGNT2VHTKuI", "processor": "T5FwwHj0Ur5F2PWG", "ram": "TTD81xhNP4t6kYBU", "soundCard": "jyXAn3bWQF6QcAiJ"}], "pXIrgroixptZhckU": [{"additionals": "TGkcBOE4qMcH1Kyi", "directXVersion": "8ZFvGcV8DY0XOkDs", "diskSpace": "txZcY1HgAnZV4IOg", "graphics": "lVLqb9lGAJUg21Lt", "label": "7JwgwMUSuC3Bajy3", "osVersion": "BcEMCtQs2FcEcvVA", "processor": "yId6Cp85HVDsZBQg", "ram": "OnXuXsGThYZrmm0w", "soundCard": "rFMnPpWgrQD4hEk0"}, {"additionals": "OLjYsnignE7KcMF7", "directXVersion": "fuDbzRRYMNXWUsp1", "diskSpace": "tOibJY9aL9ie6vvM", "graphics": "biNURrlm88QlKyuo", "label": "ya4JgakZyUV7t73V", "osVersion": "nSFbuxd4KYZ0jk0U", "processor": "ZdhtnKu9oTc8pVki", "ram": "yGsj5JdXzRxfNEjU", "soundCard": "MTs8WIObJBTsvsw7"}, {"additionals": "6uISRX0bKVoWtoUW", "directXVersion": "1P7ocuBAldDSUS7H", "diskSpace": "aa6unq1yQOSRvyiL", "graphics": "BRVtIDi2piIQFVmz", "label": "Midw70KSahpYZdKZ", "osVersion": "RyR9AX7JjxvNZhM8", "processor": "4DiZk6ySrB9SVFct", "ram": "W7YS0OkL78XeEAtA", "soundCard": "LFI3v8yha4pd5A7M"}], "YcpBD6lKNb8RxvN2": [{"additionals": "u5J7baOeLH19fqBw", "directXVersion": "NbNe1ffYRtIvQaKy", "diskSpace": "evWYtZjK6J29v8Mp", "graphics": "BSpo3AKRmnJkzJHA", "label": "ckUyBksYQfDm0RNF", "osVersion": "wiz70tRVLMlHi8i9", "processor": "gOVqajUWrgEsWDta", "ram": "Kzn8dZwnnGeZsZVg", "soundCard": "bPzPFbrOMZMgWkFN"}, {"additionals": "7Tpkx6GcfyOg6ZUr", "directXVersion": "rp9ubg9mndW2JKmQ", "diskSpace": "afUs2bxYztOEyVbK", "graphics": "If1ZbzgUwd8DHoCQ", "label": "ykmXHYmkRlg7gYs6", "osVersion": "unPYQ9jNQN1di1ld", "processor": "hOh6HvjnYuV7NfC4", "ram": "A2ODiZhbfb8QqCyK", "soundCard": "1XH9D6vl5eFdFfgK"}, {"additionals": "46GjCWaP8huTmnq3", "directXVersion": "FGQn3Ahu5wxq6oJq", "diskSpace": "4mChmQHQhO9IKBXD", "graphics": "FQfXFD58sG6uDhFY", "label": "lrzJBYSeMuJfQecu", "osVersion": "tjS029BiJWOG1m7M", "processor": "Kclr5igjNTVItrH2", "ram": "X78hxJgaVfw5Vnyq", "soundCard": "8OzTE89WDNoMcOmb"}]}, "platforms": ["Android", "Windows", "Windows"], "players": ["LocalCoop", "LocalCoop", "MMO"], "primaryGenre": "Strategy", "publisher": "JQIj1haAosKglqaC", "releaseDate": "1996-07-19T00:00:00Z", "websiteUrl": "E9ytpIO8btO3OwNE"}' \
    > test.out 2>&1
eval_tap $? 126 'UpdateApp' test.out

#- 127 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'GSW5TaW4to7QCY2N' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GGvi9kg3rMIzNmhJ' \
    > test.out 2>&1
eval_tap $? 127 'DisableItem' test.out

#- 128 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'TNQjKlwjfJ3TJ2xV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'GetItemDynamicData' test.out

#- 129 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'pge70WsLfgbZieRv' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JI5sT9DH3DfLCv8q' \
    > test.out 2>&1
eval_tap $? 129 'EnableItem' test.out

#- 130 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature '4Thmq09bBgPAYxrB' \
    --itemId 'E9jlnTgtgW33wDwD' \
    --namespace "$AB_NAMESPACE" \
    --storeId '9RKvQX4yFQFdrRoM' \
    > test.out 2>&1
eval_tap $? 130 'FeatureItem' test.out

#- 131 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature '6FoqCYw7AlxO6qdF' \
    --itemId 'pc71sSck3ggZWJlS' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lCQMDji329PfVrvM' \
    > test.out 2>&1
eval_tap $? 131 'DefeatureItem' test.out

#- 132 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'EPtpsSNcpK1QkB2S' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'y8Ww79LVeVskqeUB' \
    --populateBundle  \
    --region '7RSayqGFguhh3bva' \
    --storeId 'dRthdbVApebRA09r' \
    > test.out 2>&1
eval_tap $? 132 'GetLocaleItem' test.out

#- 133 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'W8i8krFWJhe03coR' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Fok5d3AyGrZO8Guo' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 80, "comparison": "is", "name": "SoVEBG7VbBPUWipz", "predicateType": "SeasonPassPredicate", "value": "DYkD2sIllFtBtXJK", "values": ["RUbUDSiefGEdLucr", "tO2gCQD057DrDlgC", "G3rqBmILhtWm8RQv"]}, {"anyOf": 80, "comparison": "isGreaterThan", "name": "iBKohow3kKoaP1K4", "predicateType": "SeasonPassPredicate", "value": "JRHcn7KaoCEkRdo6", "values": ["6yxi0QzZWfmP2sx0", "qHYIZWnXqQ1oHFJ9", "Q0vqsL9SomqWsGA7"]}, {"anyOf": 76, "comparison": "excludes", "name": "eHv0L2Acm960EYQE", "predicateType": "SeasonPassPredicate", "value": "BrShGbIIuqK8C403", "values": ["HgoXCR6XOMXwKdfq", "k8T4QHK30EX0Fclp", "Dl5HsuracO5Mnjnx"]}]}, {"operator": "or", "predicates": [{"anyOf": 44, "comparison": "isLessThanOrEqual", "name": "kxShFVQTRekLfjmy", "predicateType": "SeasonTierPredicate", "value": "zosRCRgVwbrQKmb0", "values": ["1yA7U7dGMjupZkZQ", "G5NpE130YWSgxpKW", "Y8CNyT4k3DIbfT22"]}, {"anyOf": 40, "comparison": "excludes", "name": "Q6ZXQcb2o1J5euLA", "predicateType": "EntitlementPredicate", "value": "vXZV3ig8Jg5VByeI", "values": ["3ycMcYYBixKJXCIS", "74KVo6Xqjz2xUKLN", "Qdwec1m8BusV9tUh"]}, {"anyOf": 100, "comparison": "isGreaterThanOrEqual", "name": "mYyVvyelIJ8QgaLM", "predicateType": "SeasonPassPredicate", "value": "XvfQgQDt6ce8NDME", "values": ["OTCbx7J3gNLIlTk3", "rA82FrR1GSogkewI", "zTOqKkcjRh3l2gAJ"]}]}, {"operator": "or", "predicates": [{"anyOf": 76, "comparison": "isGreaterThanOrEqual", "name": "mSZns5owBhoUg4Ls", "predicateType": "SeasonTierPredicate", "value": "EAHQpBOgHEP5l94s", "values": ["7CbIJ7eHnVWOboMk", "yB7FTexsOZ0b2p3b", "63KrcwIcXMhGy83X"]}, {"anyOf": 18, "comparison": "isLessThan", "name": "9alq3hK1G4kKooSN", "predicateType": "SeasonTierPredicate", "value": "PQ9HkSSV8e1MgTTL", "values": ["fRBEj7qms9AGQExP", "hgr9gGfC0GjvpgJf", "S2FgarY903INGIyE"]}, {"anyOf": 41, "comparison": "isNot", "name": "VDlvSc0Mr7ImwCwG", "predicateType": "SeasonPassPredicate", "value": "ToOnq9U5lyW89Xwt", "values": ["3wmRTrDCjhnKvsHe", "zWTqgYPixtHk6lWq", "6tEeUmU96FLEak0m"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateItemPurchaseCondition' test.out

#- 134 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'JqjRYldcTpdeCD9X' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "PRi4bAQL7VE2wL8Y"}' \
    > test.out 2>&1
eval_tap $? 134 'ReturnItem' test.out

#- 135 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --name '0BWCMqPsRk5htdM5' \
    --offset '94' \
    --tag 'rorbKIKuOXJPm5zt' \
    > test.out 2>&1
eval_tap $? 135 'QueryKeyGroups' test.out

#- 136 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "rr09CDA8Ij5bGKSu", "name": "opWQbaCvdPSq8Z27", "status": "ACTIVE", "tags": ["pvHCDx55JZ5z6guj", "pFzlPspQD9IRIpDD", "ubntPCFxfeoW2NdS"]}' \
    > test.out 2>&1
eval_tap $? 136 'CreateKeyGroup' test.out

#- 137 GetKeyGroupByBoothName
eval_tap 0 137 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 138 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'WzOXjO1NQUqWHBW7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetKeyGroup' test.out

#- 139 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId '8XREZCiTNAxq26gZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "rPqCsSDspvgM16sZ", "name": "6rjnkH4ExObppC6C", "status": "ACTIVE", "tags": ["YDm5ge659UDEOF6g", "p5UfmjtiVbqJnZcr", "qrPye7fCwi7Il2wI"]}' \
    > test.out 2>&1
eval_tap $? 139 'UpdateKeyGroup' test.out

#- 140 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'FlHm9N6owMHMtJy1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetKeyGroupDynamic' test.out

#- 141 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'Oqn59tEGm9NYeUT5' \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '35' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 141 'ListKeys' test.out

#- 142 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'DVUGgGHkapTCafFM' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 142 'UploadKeys' test.out

#- 143 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'dvYiCBuzUUwyI6Vt' \
    --limit '8' \
    --offset '52' \
    --orderNos 'v9k4fv3kMiuQ3Dhs,KLxjt5srPFxBgpFt,DBmTLH9kP9U53z6j' \
    --sortBy 'oBAhAlJGI2YYb6aj' \
    --startTime 'Bjgq6eY4PBNHKPx6' \
    --status 'REFUNDED' \
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
    --orderNo 'tHxDb06ZFy3uglSp' \
    > test.out 2>&1
eval_tap $? 145 'GetOrder' test.out

#- 146 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '2UxvF2uLXWilRD7H' \
    --body '{"description": "D6LCgdFxRGj00RT6"}' \
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
    --body '{"dryRun": true, "notifyUrl": "vcnGMJbJIYLssMvy", "privateKey": "9gkfTMRrXVRcAVRD"}' \
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
    --body '{"domains": ["X6gmDfNfPGYYSTun", "Mgt3C8hEguCqlMHi", "QN3HWJw9zIWsiP2J"]}' \
    > test.out 2>&1
eval_tap $? 150 'UpdatePaymentDomainWhitelistConfig' test.out

#- 151 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'Q24meDrwEuTyM2qo' \
    --externalId 'hglzO8AEl6A9sh2x' \
    --limit '41' \
    --notificationSource 'PAYPAL' \
    --notificationType 'X48dKPCFUIeyYEym' \
    --offset '82' \
    --paymentOrderNo '0N9ytb3c8pVZ8GlU' \
    --startDate '8962e6gtn5pUARJM' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 151 'QueryPaymentNotifications' test.out

#- 152 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'QwMNOAzXmyHEV4g9' \
    --limit '84' \
    --offset '30' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 152 'QueryPaymentOrders' test.out

#- 153 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "a280S5RNB5dVCsB7", "currencyNamespace": "xL4axSPgPCiwLxCF", "customParameters": {"LDixZwVtt3RVTl0t": {}, "R00oQgcHdGGK3x76": {}, "U1EIcklttmrpgF5s": {}}, "description": "zl0sMY8es36r1FgR", "extOrderNo": "70eNLHkVrEFd8xAr", "extUserId": "WJuCAIfNBSHgpFNw", "itemType": "SEASON", "language": "iQ_xjWC-FW", "metadata": {"E9nbE2PMv12ZSRJk": "ujxbCu1HFaj6Vxs3", "GuA4S1dS7H7yIS7b": "5TSDRIoMg7Dc5APz", "fzXDELJFaIaEMW5b": "hJyL72WDyhBsCCbn"}, "notifyUrl": "fihnXKxGxaupnTTq", "omitNotification": true, "platform": "ihZkvFKfSHQh8I9x", "price": 22, "recurringPaymentOrderNo": "GHawNx6yhniEHLbE", "region": "QKc0aUvrKXDIjYC4", "returnUrl": "df9qswSlpCI8Dhjl", "sandbox": true, "sku": "nMFjmYqE1wJhfogW", "subscriptionId": "g2Apm0sUy18aWn65", "targetNamespace": "Co0vdCk8so6JSaZA", "targetUserId": "IadKDEZywonA2SrE", "title": "dN2tmGuX6r0gBVUU"}' \
    > test.out 2>&1
eval_tap $? 153 'CreatePaymentOrderByDedicated' test.out

#- 154 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'eKKlPKtE6gnYxmkm' \
    > test.out 2>&1
eval_tap $? 154 'ListExtOrderNoByExtTxId' test.out

#- 155 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'CWbs5qugklBUS6uw' \
    > test.out 2>&1
eval_tap $? 155 'GetPaymentOrder' test.out

#- 156 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'WrCQt86Jrg8tLAJW' \
    --body '{"extTxId": "pcyNkUvqn6eXr6FN", "paymentMethod": "bKJ05Orya6LSSUlu", "paymentProvider": "ALIPAY"}' \
    > test.out 2>&1
eval_tap $? 156 'ChargePaymentOrder' test.out

#- 157 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'cuQNGIDeHlf6IcX1' \
    --body '{"description": "K9JrK6Or2xx7rLwr"}' \
    > test.out 2>&1
eval_tap $? 157 'RefundPaymentOrderByDedicated' test.out

#- 158 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'PoWiywnxuDLLuIaS' \
    --body '{"amount": 49, "currencyCode": "nYoID2UqO0iAXA9d", "notifyType": "REFUND", "paymentProvider": "CHECKOUT", "salesTax": 47, "vat": 3}' \
    > test.out 2>&1
eval_tap $? 158 'SimulatePaymentOrderNotification' test.out

#- 159 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'osKhDlLfTKxpVOXv' \
    > test.out 2>&1
eval_tap $? 159 'GetPaymentOrderChargeStatus' test.out

#- 160 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'GSrdkqddI3ezqu6F' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "B0sL2xt6fX9j7rhZ", "serviceLabel": 58}' \
    > test.out 2>&1
eval_tap $? 160 'GetPsnEntitlementOwnership' test.out

#- 161 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'qVUaWMJBjrV0p9A7' \
    --body '{"delegationToken": "tcHrV0MbJGr4drgk", "sandboxId": "DuWS05m0pGzazM2B"}' \
    > test.out 2>&1
eval_tap $? 161 'GetXboxEntitlementOwnership' test.out

#- 162 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Oculus' \
    > test.out 2>&1
eval_tap $? 162 'GetPlatformEntitlementConfig' test.out

#- 163 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedPlatformOrigins": ["Nintendo", "Playstation", "IOS"]}' \
    > test.out 2>&1
eval_tap $? 163 'UpdatePlatformEntitlementConfig' test.out

#- 164 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 164 'GetPlatformWalletConfig' test.out

#- 165 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    --body '{"allowedBalanceOrigins": ["Oculus", "IOS", "Steam"]}' \
    > test.out 2>&1
eval_tap $? 165 'UpdatePlatformWalletConfig' test.out

#- 166 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
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
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "CUSTOM"}, "durable": {"enabled": true, "strategy": "CUSTOM"}}, "wallet": {"enabled": true, "strategy": "ALWAYS_REVOKE"}}' \
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
    --endTime 'TQO7KLdZDGwqx7T3' \
    --limit '24' \
    --offset '64' \
    --source 'ORDER' \
    --startTime 'AMGZ2FBS93Mg6TKw' \
    --status 'FAIL' \
    --transactionId 'cwLcUml3KuoMKh7t' \
    --userId 'prnacA34xmIOjFLg' \
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
    --body '{"appConfig": {"appName": "KR4LjEWhOScvtQ92"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "wlDngNiPPjpSAlZw"}, "extendType": "APP"}' \
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
    --body '{"description": "pea5ObBB49Km4ClI", "eventTopic": "QmkIdLCvNhZ6P8aq", "maxAwarded": 50, "maxAwardedPerUser": 49, "namespaceExpression": "VxwHIJ9gzxqAw4vB", "rewardCode": "GQAeh0VTiTP4PSrX", "rewardConditions": [{"condition": "US6jYI9lsQFD43Df", "conditionName": "5qUZOFzpFd6b5Jc5", "eventName": "TETHcup8GG0VCMTF", "rewardItems": [{"duration": 73, "endDate": "1995-05-28T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "yHq4bBb0n1JhPUS8", "quantity": 57, "sku": "BDFopxUwkMuSqQnK"}, {"duration": 52, "endDate": "1983-08-27T00:00:00Z", "identityType": "ITEM_ID", "itemId": "gDAtqE3kuybwTQFY", "quantity": 62, "sku": "f8NA4cGUaDfy9XnH"}, {"duration": 36, "endDate": "1973-02-02T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "1GS5YkyhAiAItnWU", "quantity": 25, "sku": "n5CEPoH6opK5DSO8"}]}, {"condition": "JyX4IE1z3rDwZ1HK", "conditionName": "sOpyq8agQuz86nc6", "eventName": "jLF9DIW2ncJJKpqm", "rewardItems": [{"duration": 13, "endDate": "1993-06-18T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Bhl0L5FCbOn46W2B", "quantity": 17, "sku": "uPQLrt2t6bVpCgKv"}, {"duration": 85, "endDate": "1978-03-26T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "qmd87ir9op4YfGTn", "quantity": 30, "sku": "RB0rY0xfWddACyHS"}, {"duration": 26, "endDate": "1996-04-28T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "KX9TPO3K1k5ZM8bt", "quantity": 25, "sku": "bn6l5xAzc1nc3eFm"}]}, {"condition": "950dtVAo7w4e3v5m", "conditionName": "h6Rum5pbgEt39uJQ", "eventName": "pgEtchTe3nt7t9zt", "rewardItems": [{"duration": 32, "endDate": "1995-05-18T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "SfW9OutADrNGBWSJ", "quantity": 49, "sku": "zQKxVmRTawjiZPMo"}, {"duration": 49, "endDate": "1997-05-06T00:00:00Z", "identityType": "ITEM_ID", "itemId": "LTBM9Q8t829Ido1J", "quantity": 50, "sku": "pPdJPn9eIdhIBvTT"}, {"duration": 41, "endDate": "1988-05-04T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "kcVk0X28GS54vl7g", "quantity": 70, "sku": "HNfIZwrMxf3EnzZV"}]}], "userIdExpression": "nkLT0Lb85nmpdN26"}' \
    > test.out 2>&1
eval_tap $? 175 'CreateReward' test.out

#- 176 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'BY5YI0jeO2zMDSy4' \
    --limit '22' \
    --offset '51' \
    --sortBy 'rewardCode,rewardCode:desc,namespace:desc' \
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
    --rewardId 'KgrtEPdXXlt8geCd' \
    > test.out 2>&1
eval_tap $? 179 'GetReward' test.out

#- 180 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'iXu3iNvn7vLZ7h6a' \
    --body '{"description": "lhJNGZF07lsPP5Of", "eventTopic": "HbXzWnVO2U4uyzZo", "maxAwarded": 84, "maxAwardedPerUser": 36, "namespaceExpression": "OzwuDSdGl1A2vaNe", "rewardCode": "DiSqTfmAVg50kOdJ", "rewardConditions": [{"condition": "agEmTuaxlxgywkbd", "conditionName": "OsyxX1tfW488oYUT", "eventName": "4jyCVJ0V8obTlGVT", "rewardItems": [{"duration": 16, "endDate": "1977-07-30T00:00:00Z", "identityType": "ITEM_ID", "itemId": "3wiNloJfey3HXL6S", "quantity": 19, "sku": "jfF7JkjCVpZKMxkF"}, {"duration": 21, "endDate": "1973-08-13T00:00:00Z", "identityType": "ITEM_ID", "itemId": "tXMU6KRIm5xBoIi9", "quantity": 65, "sku": "ctgFXasxp5h780kt"}, {"duration": 18, "endDate": "1977-12-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "yHvEqpJSrDXVwCkh", "quantity": 83, "sku": "MpRl6xRyV19cborU"}]}, {"condition": "HeCpqnZ5NW623WWn", "conditionName": "2ZJY3QvRa7CDRTcs", "eventName": "AHzD3dZyyWbUQpbc", "rewardItems": [{"duration": 43, "endDate": "1996-03-09T00:00:00Z", "identityType": "ITEM_ID", "itemId": "wmL7a1K3zIUYJmdF", "quantity": 78, "sku": "YtWNSQlcMzxfppNC"}, {"duration": 36, "endDate": "1997-05-23T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "cDPbklTHcmgXsrVj", "quantity": 78, "sku": "Mjml6BpCODWGOLMm"}, {"duration": 58, "endDate": "1973-11-07T00:00:00Z", "identityType": "ITEM_ID", "itemId": "pmXqRwVjc3W2ANmE", "quantity": 89, "sku": "VVsQ1fm9EUdiaRju"}]}, {"condition": "LsKZoqnpKwhpZVdw", "conditionName": "5UMa8ymxtEFLwELC", "eventName": "Y2vIddlxnA1Vynio", "rewardItems": [{"duration": 72, "endDate": "1973-01-20T00:00:00Z", "identityType": "ITEM_ID", "itemId": "APwVHUGcs1ACMvoY", "quantity": 0, "sku": "jWH9dFmOHW0j9suu"}, {"duration": 21, "endDate": "1975-12-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "E4JwQONQ2vCbMn0O", "quantity": 16, "sku": "CcuK2hHviBEWpbus"}, {"duration": 84, "endDate": "1973-09-11T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "yVqstpgZpbz77y88", "quantity": 35, "sku": "Q8GL7jBF1R5OexAP"}]}], "userIdExpression": "zCG6ZKQClGc1636n"}' \
    > test.out 2>&1
eval_tap $? 180 'UpdateReward' test.out

#- 181 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'bfM3J9G40Y62bCo9' \
    > test.out 2>&1
eval_tap $? 181 'DeleteReward' test.out

#- 182 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId '41ALznQuHVskfCjU' \
    --body '{"payload": {"K8GeX4Q0B2Cj0oOm": {}, "BmXu1KiTTiz7yrIv": {}, "Qj2isN7bRwcr16lW": {}}}' \
    > test.out 2>&1
eval_tap $? 182 'CheckEventCondition' test.out

#- 183 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId '5YwgZpjlMMtPWg82' \
    --body '{"conditionName": "17m7qNkQiKp2oac8", "userId": "QTNEuBbeuQqm9wM7"}' \
    > test.out 2>&1
eval_tap $? 183 'DeleteRewardConditionRecord' test.out

#- 184 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'mgTtUdPVcQijMBhs' \
    --limit '54' \
    --offset '21' \
    --start '6AmnQTNFidImWONT' \
    --storeId 'vCPMGLdbYEknHPKr' \
    --viewId 'Z7TiNBE0HRsE0GHD' \
    > test.out 2>&1
eval_tap $? 184 'QuerySections' test.out

#- 185 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OFjrfqJcyxT2a7fC' \
    --body '{"active": false, "displayOrder": 55, "endDate": "1987-05-18T00:00:00Z", "ext": {"zLELiM573TdtWjfV": {}, "ciuLnLsBKGsALPuC": {}, "OyphUUAV95708zaP": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 46, "itemCount": 24, "rule": "SEQUENCE"}, "items": [{"id": "DQbzTiFrQB1yUoni", "sku": "rH4URx3NkKQBYrlU"}, {"id": "aMiFEWUT8cAFO5zE", "sku": "w8GENEJYPKxxOw7x"}, {"id": "NQ98IEbc9YITN98j", "sku": "4P2AGeidXRRnIAJf"}], "localizations": {"KVjOn6rtILNJVv2D": {"description": "LLUyBt5hDs45siG3", "localExt": {"0Lv9iGa5mkZjnRXV": {}, "cg6AByNpBo2JYkwL": {}, "dmR97u9MVUii4KpY": {}}, "longDescription": "cb1AUsESaBOTHnbX", "title": "9tC9PQlFAGbMtEyb"}, "fcAl0mnsAkRT2k0A": {"description": "zdgIunRkTxsGdrpN", "localExt": {"ELM8Lfkut0wnT24w": {}, "h59RGSbBMh7jpszu": {}, "Vk6iPdJ2boQqCCyJ": {}}, "longDescription": "fThvCJieqRSGN8Mm", "title": "74HlSZzp4aEW4GkH"}, "G5OIVuGv47XJpkMi": {"description": "opQrVL3ZZTVxqa9X", "localExt": {"M2gY14iWk12Jffk8": {}, "dwKNPUOHNZxML3yo": {}, "BM9qxd6PWz7sVnMx": {}}, "longDescription": "ge2inL8fBFP1ABaI", "title": "KrEt8d3o7cTS9OII"}}, "name": "MErnNTLXHrsOFsbh", "rotationType": "NONE", "startDate": "1975-05-03T00:00:00Z", "viewId": "bJMmRgoxNwp1lGkY"}' \
    > test.out 2>&1
eval_tap $? 185 'CreateSection' test.out

#- 186 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oq8HP1TM0tefVQPW' \
    > test.out 2>&1
eval_tap $? 186 'PurgeExpiredSection' test.out

#- 187 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'X1NPO5Wn7rNG8rGp' \
    --storeId '7Fadvo5EzpX0Itts' \
    > test.out 2>&1
eval_tap $? 187 'GetSection' test.out

#- 188 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'RezyY9GB5sf94ALB' \
    --storeId 'mvdncQkcZb8cWdVH' \
    --body '{"active": false, "displayOrder": 99, "endDate": "1982-10-10T00:00:00Z", "ext": {"w15zZsaYrJAe5Kd5": {}, "QB96ndlO6iPGC9Rh": {}, "zMC7V8BEphnRXnSp": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 84, "itemCount": 52, "rule": "SEQUENCE"}, "items": [{"id": "yb8FkoxQbrPngi87", "sku": "K58pQswqKLutINus"}, {"id": "Osa92F6iwkJIYOLa", "sku": "rmpWyvib9CDW21AN"}, {"id": "rlpuXD9H1u1CvzWP", "sku": "cZwkj1l6bf2F9EXO"}], "localizations": {"Bj7v8LHYivmD0eky": {"description": "cMKlwJTNL2UCWUta", "localExt": {"AD7ZZx1iefATWcDS": {}, "qGYRMdz07xEJ40ep": {}, "ssgJJC3CX0hpB1ZG": {}}, "longDescription": "MMo5DSozCuFsrBMt", "title": "oOeLfMCYxSeeJOlx"}, "a395rghZwGhdZJkk": {"description": "GhYvXYMIyaEMEqOp", "localExt": {"wetb82b96rsH73hR": {}, "fDgl29GWKpItMt4G": {}, "szRufkDFLYyNBPlM": {}}, "longDescription": "rkse9SGcMuV5phhU", "title": "315LUC6HSMQ32Uzn"}, "XNd6ve29lqqtcLJW": {"description": "9eTJvKNDFrx6Laby", "localExt": {"DnqXjXKPIcxh0x7T": {}, "6RQGnnW4ugGX6mKB": {}, "bgTD9xL07ZzzIs3J": {}}, "longDescription": "ke34ZAUuLP897ooM", "title": "LnemwKAvgDXNrFEE"}}, "name": "4Jf4hQpsLOcLtZw0", "rotationType": "CUSTOM", "startDate": "1987-02-09T00:00:00Z", "viewId": "kUDP864shbnQ3bVv"}' \
    > test.out 2>&1
eval_tap $? 188 'UpdateSection' test.out

#- 189 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'uvpsDJXPCWkX4Kpi' \
    --storeId '8CJ88aMPGFFAQZbf' \
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
    --body '{"defaultLanguage": "bmVTEbiRq5Juikmp", "defaultRegion": "at75rVbN9ZBtzJ33", "description": "tCwv8H1f451FVZ63", "supportedLanguages": ["0HNBYZSrz7pMjESL", "LMPKDXLki6Oz5Byg", "t8Q0RjSf1srB7hGw"], "supportedRegions": ["GbUmQmJHNffZENs9", "X0hFMdzryvhc1YjH", "mmulSBIElc2CdRvB"], "title": "b0aGnMt625bWHb5s"}' \
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
    --body '{"catalogType": "SECTION", "fieldsToBeIncluded": ["X6asrjV7XJUOtHlz", "XNHEPpzlMlx7b2H2", "THLwZGikW7TFA9gE"], "idsToBeExported": ["6SrYKq6lcVOhPJIc", "EHbiKHW7flVolAWE", "MmQSPDTRqjlvwnnC"], "storeId": "A5tfK5ushaKTPVjy"}' \
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
    --storeId 'OUpR3uUdgNlyU4IJ' \
    > test.out 2>&1
eval_tap $? 200 'GetStore' test.out

#- 201 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nqtrjCOsE8VjvzhJ' \
    --body '{"defaultLanguage": "wNX4bhqCjlwrmsSR", "defaultRegion": "V86iic1FIMyF7CcN", "description": "u2DYn6E9Gk51kOTJ", "supportedLanguages": ["ZluTekDMCGUJvERx", "Ng8djSb4Vt2vKQ5v", "lCdI519Pf2iogwxM"], "supportedRegions": ["5DZM0dgozmco4175", "0xdYQg34WUV0Wpms", "Qnp1n4YGumTKOlDO"], "title": "y5vhSkxERZ2AQ1jv"}' \
    > test.out 2>&1
eval_tap $? 201 'UpdateStore' test.out

#- 202 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XYBar5RMmmGdWl0w' \
    > test.out 2>&1
eval_tap $? 202 'DeleteStore' test.out

#- 203 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pj5tVfKU3D8WVPh0' \
    --action 'DELETE' \
    --itemSku 'YiGE2cyzTMBY7Xd0' \
    --itemType 'SUBSCRIPTION' \
    --limit '1' \
    --offset '29' \
    --selected  \
    --sortBy 'createdAt,updatedAt:desc,updatedAt' \
    --status 'PUBLISHED' \
    --type 'VIEW' \
    --updatedAtEnd 'f4noXDFaEUkPUBnB' \
    --updatedAtStart '0ZEJH3ebM71Tg922' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 203 'QueryChanges' test.out

#- 204 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xiBgHSka0Pz7I1Wk' \
    > test.out 2>&1
eval_tap $? 204 'PublishAll' test.out

#- 205 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ia0oZ1nXpW1l70pc' \
    > test.out 2>&1
eval_tap $? 205 'PublishSelected' test.out

#- 206 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZgIn4lPghHyMEHBz' \
    > test.out 2>&1
eval_tap $? 206 'SelectAllRecords' test.out

#- 207 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ArbyW10NkJFQxuMH' \
    --action 'CREATE' \
    --itemSku '4txY0MsPc9EMgf9J' \
    --itemType 'MEDIA' \
    --selected  \
    --type 'VIEW' \
    --updatedAtEnd 'JU2wEzUYUTmZ8JSM' \
    --updatedAtStart 'eNmRocp400RZe8Bz' \
    > test.out 2>&1
eval_tap $? 207 'SelectAllRecordsByCriteria' test.out

#- 208 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'x9aGEI22BTCZs97T' \
    --action 'UPDATE' \
    --itemSku '4TkpEw4Zeid4mRoF' \
    --itemType 'SUBSCRIPTION' \
    --type 'STORE' \
    --updatedAtEnd '2HQtgzQhO3nR8j8D' \
    --updatedAtStart 'lP6OGbn8vmfMYGLt' \
    > test.out 2>&1
eval_tap $? 208 'GetStatistic' test.out

#- 209 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '1AjKhh3JMX7xSrz1' \
    > test.out 2>&1
eval_tap $? 209 'UnselectAllRecords' test.out

#- 210 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'EH6X2SM3xzsNrJzW' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BcdFlo7oAsOlfLB1' \
    > test.out 2>&1
eval_tap $? 210 'SelectRecord' test.out

#- 211 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'J19b5rTfiL2P3r1a' \
    --namespace "$AB_NAMESPACE" \
    --storeId '8KIJH33aKkPuWD59' \
    > test.out 2>&1
eval_tap $? 211 'UnselectRecord' test.out

#- 212 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MgTy1HA58Jt5NaRO' \
    --targetStoreId 'jSKFEuZo2ElXYSS4' \
    > test.out 2>&1
eval_tap $? 212 'CloneStore' test.out

#- 213 ExportStore
eval_tap 0 213 'ExportStore # SKIP deprecated' test.out

#- 214 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ezBRSiOyReviDaxl' \
    --end 'PdhwmcH03yoMxzRR' \
    --limit '49' \
    --offset '76' \
    --sortBy 'd9rTh3ureaIbxM3W' \
    --start 'ev9pZQjWAN0tny16' \
    --success  \
    > test.out 2>&1
eval_tap $? 214 'QueryImportHistory' test.out

#- 215 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZHZtuSJGQCrM7JEM' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'RPkdTcAzkIlndN5x' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 215 'ImportStoreByCSV' test.out

#- 216 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGED' \
    --itemId 'A27Qz5SjzQfOLYu9' \
    --limit '82' \
    --offset '54' \
    --sku '46OOzz9p57qSpHer' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    --userId 'VmBT4wZXQZZrSsuY' \
    > test.out 2>&1
eval_tap $? 216 'QuerySubscriptions' test.out

#- 217 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iIPei0pXglJYnKko' \
    > test.out 2>&1
eval_tap $? 217 'RecurringChargeSubscription' test.out

#- 218 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'CAZuolAWnxkImVbD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 218 'GetTicketDynamic' test.out

#- 219 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'P0QX31gI7VmnGIRM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "vXe6BiphIFe2bzr6"}' \
    > test.out 2>&1
eval_tap $? 219 'DecreaseTicketSale' test.out

#- 220 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'qQw6fSESkM19OPMB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 220 'GetTicketBoothID' test.out

#- 221 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'b12gpmShlmIt2nfh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 95, "orderNo": "D4bD8gISE34yIAZQ"}' \
    > test.out 2>&1
eval_tap $? 221 'IncreaseTicketSale' test.out

#- 222 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "GooglePlay", "count": 0, "currencyCode": "igiA3wBrmBYIlZeh", "expireAt": "1973-12-11T00:00:00Z"}, "debitPayload": {"count": 75, "currencyCode": "72AB8EO3YrlyrWow", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 24, "entitlementCollectionId": "UDVLlTtuJJsHZVsG", "entitlementOrigin": "IOS", "itemIdentity": "YA4kZURmoGgxVRMP", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 8, "entitlementId": "g1rbhfIMStMnSqrK"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Other", "count": 73, "currencyCode": "ITlYS2RYaD9WNKGh", "expireAt": "1971-09-24T00:00:00Z"}, "debitPayload": {"count": 78, "currencyCode": "KmcEKp8AQwqgJs6O", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 20, "entitlementCollectionId": "K6HEVIQJd3930TGe", "entitlementOrigin": "Other", "itemIdentity": "qp4O9XSjap24esyj", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 82, "entitlementId": "6Wc3migf2n6iQyr5"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 2, "currencyCode": "Ag5cFT0gHAkltcR3", "expireAt": "1973-09-30T00:00:00Z"}, "debitPayload": {"count": 42, "currencyCode": "FbiAluHv7Hssd05p", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 56, "entitlementCollectionId": "pXjmtpNfCrIj9ntY", "entitlementOrigin": "Nintendo", "itemIdentity": "TsdD4d3kSbTkHPMU", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 49, "entitlementId": "OAUXkw36cr2WJQqS"}, "type": "FULFILL_ITEM"}], "userId": "4Jy6yCSXBqJqjAbV"}, {"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 80, "currencyCode": "Saoj1ugjr8mPkr3t", "expireAt": "1997-11-03T00:00:00Z"}, "debitPayload": {"count": 93, "currencyCode": "06ERSVy5M3rrkxu0", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 54, "entitlementCollectionId": "h9gCNVZxHGxhZqNX", "entitlementOrigin": "Twitch", "itemIdentity": "rHuKBoNTpPQXDNHt", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 36, "entitlementId": "74GcmVf0fbCU9QdP"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 100, "currencyCode": "NF2hm0TqBQprHn3w", "expireAt": "1975-08-11T00:00:00Z"}, "debitPayload": {"count": 86, "currencyCode": "mDxP23qstMuikKc6", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 80, "entitlementCollectionId": "hr1BHh1arZAyuLcZ", "entitlementOrigin": "Nintendo", "itemIdentity": "0JOQxWeHypqCWMDP", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 70, "entitlementId": "0gdWoE4esuiDrquc"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Other", "count": 53, "currencyCode": "E0cXokXbwKDtVmrY", "expireAt": "1993-03-26T00:00:00Z"}, "debitPayload": {"count": 42, "currencyCode": "nvPcJkjRevVYfiEx", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 96, "entitlementCollectionId": "AgoK9YDq1x3dkbJF", "entitlementOrigin": "Steam", "itemIdentity": "GV01vD7lNLxlpvqa", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 37, "entitlementId": "9P9GaukfCEIeSBLh"}, "type": "DEBIT_WALLET"}], "userId": "fzigzHcRuJgYaj4I"}, {"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 60, "currencyCode": "rL6TsJeRcE7GuwKn", "expireAt": "1990-10-27T00:00:00Z"}, "debitPayload": {"count": 71, "currencyCode": "1fjzknv2HZMIL2P2", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 74, "entitlementCollectionId": "h14LroFTnAuujPeP", "entitlementOrigin": "Xbox", "itemIdentity": "U7fj6w17arNs12hO", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 42, "entitlementId": "LVM7UFnuJDzeEkDx"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 97, "currencyCode": "yJtnbTDXu7FbleSP", "expireAt": "1982-12-07T00:00:00Z"}, "debitPayload": {"count": 98, "currencyCode": "cdOuq0m0rvakR8rc", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 35, "entitlementCollectionId": "ojLRjhcaJ56nGlYZ", "entitlementOrigin": "Other", "itemIdentity": "ZxC6yYUVUJYnQ3jO", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 65, "entitlementId": "ROIqxqQ0gcNeTfly"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Other", "count": 95, "currencyCode": "W0UGJpwQZlXuzu3m", "expireAt": "1987-06-15T00:00:00Z"}, "debitPayload": {"count": 39, "currencyCode": "7JjCDwg186hGWKfO", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 27, "entitlementCollectionId": "EpAJMCxMp2J0hDg2", "entitlementOrigin": "IOS", "itemIdentity": "cBKtU956hOg8oukD", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 6, "entitlementId": "E7M36mI9u3EeZtLQ"}, "type": "DEBIT_WALLET"}], "userId": "zCqUgq1gLbcIMevT"}], "metadata": {"mC631p7q794bu49l": {}, "INFTtERAXT2h3hcQ": {}, "2wV3ZbBTnNQnVUhA": {}}, "needPreCheck": true, "transactionId": "WnzVZdj8tsyzC4Qa", "type": "LXp3o4TDraEEaDNJ"}' \
    > test.out 2>&1
eval_tap $? 222 'Commit' test.out

#- 223 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '85' \
    --status 'FAILED' \
    --type 'd20FVHevCjthJUb7' \
    --userId 'jKuMrFaoLulzp3sZ' \
    > test.out 2>&1
eval_tap $? 223 'GetTradeHistoryByCriteria' test.out

#- 224 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'xImVK5yh2LcM8LaM' \
    > test.out 2>&1
eval_tap $? 224 'GetTradeHistoryByTransactionId' test.out

#- 225 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'W0ByjsRUrAHNRkIc' \
    --body '{"achievements": [{"id": "C4wNFzsbrtYvLh56", "value": 54}, {"id": "tLsR2AGOiPhNt2Id", "value": 68}, {"id": "U1HED9CGo9aUXj3r", "value": 15}], "steamUserId": "k66ix88sAUrXr7MX"}' \
    > test.out 2>&1
eval_tap $? 225 'UnlockSteamUserAchievement' test.out

#- 226 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'xCvyy7caxz4MQrOD' \
    --xboxUserId 'LNlxiEjQBCZx9DJ4' \
    > test.out 2>&1
eval_tap $? 226 'GetXblUserAchievements' test.out

#- 227 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'V97SJLlrwXmIGamR' \
    --body '{"achievements": [{"id": "CARuFLx4rV4CXVMr", "percentComplete": 60}, {"id": "1tkG9WwU4Ty6Ch5Q", "percentComplete": 51}, {"id": "vSLLiMvcu39YZJyp", "percentComplete": 100}], "serviceConfigId": "zskbSUbOZ9WNl3ap", "titleId": "JmNAbl1g5ZmTTGYR", "xboxUserId": "bP4QVey9pEz1TV5c"}' \
    > test.out 2>&1
eval_tap $? 227 'UpdateXblUserAchievement' test.out

#- 228 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'UtPBsw01i5Mf7Wvb' \
    > test.out 2>&1
eval_tap $? 228 'AnonymizeCampaign' test.out

#- 229 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'NSeeDNfUESLlwHv3' \
    > test.out 2>&1
eval_tap $? 229 'AnonymizeEntitlement' test.out

#- 230 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'JgteOLyKp8a1VqxX' \
    > test.out 2>&1
eval_tap $? 230 'AnonymizeFulfillment' test.out

#- 231 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'nRhDd9TGkO6aIYqf' \
    > test.out 2>&1
eval_tap $? 231 'AnonymizeIntegration' test.out

#- 232 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'tw1SrM2nhSEanfUY' \
    > test.out 2>&1
eval_tap $? 232 'AnonymizeOrder' test.out

#- 233 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'rMU6A43UKGpvC1cr' \
    > test.out 2>&1
eval_tap $? 233 'AnonymizePayment' test.out

#- 234 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '5T1PSXhduTWchzXD' \
    > test.out 2>&1
eval_tap $? 234 'AnonymizeRevocation' test.out

#- 235 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'v3TAtBjP4HSuiYCb' \
    > test.out 2>&1
eval_tap $? 235 'AnonymizeSubscription' test.out

#- 236 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'G0UyYUJmNL8p6Abd' \
    > test.out 2>&1
eval_tap $? 236 'AnonymizeWallet' test.out

#- 237 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'tU0CDrlQpKB8qoel' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 237 'GetUserDLCByPlatform' test.out

#- 238 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'QK3aSOYdmMDikc3F' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 238 'GetUserDLC' test.out

#- 239 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '49chqeiUGQMwNwDl' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --collectionId 'Sli3p8YaAdel3hHM' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'Xq7TkdM7FVDCBcvV' \
    --features 'egrZddP8lLQo6tHj,4z4cAM4LMJfWNZIx,AgBpeubprKX68jTy' \
    --fuzzyMatchName  \
    --itemId 'Rd3LrR1x6U1v6zSL,jm9zmzUW0vPj90jm,LTt5YQGawcomPoiY' \
    --limit '30' \
    --offset '98' \
    --origin 'Xbox' \
    > test.out 2>&1
eval_tap $? 239 'QueryUserEntitlements' test.out

#- 240 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'eePMSqb8y8qJTUQY' \
    --body '[{"collectionId": "40Zrpn0vAD9YsPeD", "endDate": "1996-02-13T00:00:00Z", "grantedCode": "rAVQZSvgWuCuLsUG", "itemId": "rVQAbhS54ZuQHKer", "itemNamespace": "sDmJLUHAKtfXCKOn", "language": "Ww_KUEp", "origin": "IOS", "quantity": 96, "region": "6ofsUoRh6r0e0J6v", "source": "REDEEM_CODE", "startDate": "1986-05-12T00:00:00Z", "storeId": "SV22eRBElD4K2Cy1"}, {"collectionId": "tJcPAEkCeV29QsQk", "endDate": "1998-11-19T00:00:00Z", "grantedCode": "00eu5UcxuXXpt0YS", "itemId": "PX04uEIdAwgDobop", "itemNamespace": "bdJeVCiKs2vLyH9k", "language": "Qt_Kvnk_363", "origin": "Twitch", "quantity": 93, "region": "e5neohqhCzroAzWQ", "source": "REFERRAL_BONUS", "startDate": "1989-06-23T00:00:00Z", "storeId": "oT0WK5ngNUxDKfZY"}, {"collectionId": "ofPGUbSaA00nKxQj", "endDate": "1996-01-16T00:00:00Z", "grantedCode": "6KlavIiLxU2I1GyJ", "itemId": "S48Hxu8Ju4XSAnlX", "itemNamespace": "RYB9BgSZBvkehRn8", "language": "cm_229", "origin": "Nintendo", "quantity": 42, "region": "zkzjYDw6mLBordrJ", "source": "IAP", "startDate": "1983-09-01T00:00:00Z", "storeId": "s2deMF8UAJIHEZv5"}]' \
    > test.out 2>&1
eval_tap $? 240 'GrantUserEntitlement' test.out

#- 241 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'zyUUyNJkvA5xF3zH' \
    --activeOnly  \
    --appId 'tZSd3QzXhkrN4pWr' \
    > test.out 2>&1
eval_tap $? 241 'GetUserAppEntitlementByAppId' test.out

#- 242 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'yt4XTNwpp0ni1YfI' \
    --activeOnly  \
    --limit '12' \
    --offset '57' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 242 'QueryUserEntitlementsByAppType' test.out

#- 243 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'YIzElrLZOBLHCKmL' \
    --activeOnly  \
    --entitlementClazz 'LOOTBOX' \
    --platform 'sunESjcgr2drXG5N' \
    --itemId 'kKCySLA8cKCs0dFY' \
    > test.out 2>&1
eval_tap $? 243 'GetUserEntitlementByItemId' test.out

#- 244 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'RSa2OULZ0iOZJiOA' \
    --ids 'h1SpLhMF2Pav11Fu,U8iXCRz8KgqgwijY,xpGhsFArq6lolbj7' \
    --platform 'QKvtVRCPMjr5M3vw' \
    > test.out 2>&1
eval_tap $? 244 'GetUserActiveEntitlementsByItemIds' test.out

#- 245 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '1GqUjjFp6R8mYZwK' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --platform '4QgQut2hiPuDdOPH' \
    --sku 'cN9drwqytieXpIZf' \
    > test.out 2>&1
eval_tap $? 245 'GetUserEntitlementBySku' test.out

#- 246 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'r5XDq9dGLHjtgE2b' \
    --appIds 'TXJxCCFqPNDqWrpk,Wnnova15WVuE5cYV,P9tQSa27BnPyq3I1' \
    --itemIds 'BLtGEZDRNkk4DJUo,fJXK8RGS0zCYRVmb,fzwUmsy0stUmKdXi' \
    --platform 'iTObNdqkWa13g3pg' \
    --skus 'Hx6uPf6jQZcYerH9,33X7iXEEM2KOusNE,HcI95GGdJvucDbs6' \
    > test.out 2>&1
eval_tap $? 246 'ExistsAnyUserActiveEntitlement' test.out

#- 247 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'UdccuM2ykRj3WnyA' \
    --platform 'aUaQBKFedL2uduXv' \
    --itemIds 'ZUbQQ13FhD3NExUF,ipJsUiDawAjgHFQk,0VzWRNFNiUn2yXMS' \
    > test.out 2>&1
eval_tap $? 247 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 248 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'CcHADYpS861c0CJ7' \
    --appId 'LzpFvOSF6xKA6yrn' \
    > test.out 2>&1
eval_tap $? 248 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 249 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'vXY5dDwneac75C6S' \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'eHsH4Y84hL75QboM' \
    --itemId 'HCtzEF9FSeg6WYgt' \
    > test.out 2>&1
eval_tap $? 249 'GetUserEntitlementOwnershipByItemId' test.out

#- 250 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'fuqJHrs4e3RnWR30' \
    --ids 'MdBZezfwc3H0qSbM,q4GLj8aGsH0qE5p6,01ak59yFSfdZIv8o' \
    --platform 'YWPUS4Zu0SbTt6M2' \
    > test.out 2>&1
eval_tap $? 250 'GetUserEntitlementOwnershipByItemIds' test.out

#- 251 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'XizikCh6q0yq2WAH' \
    --entitlementClazz 'ENTITLEMENT' \
    --platform '3E9FkOPVu2fDtOjW' \
    --sku '1iSYQbcebBd5wb5H' \
    > test.out 2>&1
eval_tap $? 251 'GetUserEntitlementOwnershipBySku' test.out

#- 252 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '3qppoCiHMD4iBK2O' \
    > test.out 2>&1
eval_tap $? 252 'RevokeAllEntitlements' test.out

#- 253 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '7qYtOHV5hnpjc5CN' \
    --entitlementIds 'LnnEvo25aEtdjls5' \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserEntitlements' test.out

#- 254 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'oadseJg7y4Q9CU3f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jSRaXD4HDmdvhMXx' \
    > test.out 2>&1
eval_tap $? 254 'GetUserEntitlement' test.out

#- 255 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'iKR29LKIhNU43K8b' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ihdw3prp0UHlWUxk' \
    --body '{"collectionId": "BefhxRtrqbv56oqw", "endDate": "1978-01-28T00:00:00Z", "nullFieldList": ["CLVc2qHZuuedbBOd", "19DqZJRYV1oqNLmP", "AUIMwa2wYq6DsUq3"], "origin": "GooglePlay", "reason": "bYvaWLoKzHnngdfF", "startDate": "1978-06-04T00:00:00Z", "status": "SOLD", "useCount": 12}' \
    > test.out 2>&1
eval_tap $? 255 'UpdateUserEntitlement' test.out

#- 256 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'hR60HZwUwk48XK7M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XHbEwAvvpEeHhXiJ' \
    --body '{"options": ["cJqYSxVKUYMimVLz", "AP6aOzsTqEFXUhGA", "wpYq1UqZydOB0MTh"], "platform": "ZW6LwcAg57BYBVCb", "requestId": "i0ifdPyKf3SwHekW", "useCount": 71}' \
    > test.out 2>&1
eval_tap $? 256 'ConsumeUserEntitlement' test.out

#- 257 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'CJaOHzpb623EciYo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YOPVg6DLEZ6DxpwB' \
    > test.out 2>&1
eval_tap $? 257 'DisableUserEntitlement' test.out

#- 258 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'm2N8PdQ5mQaGXEbn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mWR0H3EkrHqaLNdf' \
    > test.out 2>&1
eval_tap $? 258 'EnableUserEntitlement' test.out

#- 259 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'KszYZzOg113h6fIa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HSx5bClxUOBmMwv5' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementHistories' test.out

#- 260 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'pmiIVnhlLoMemsp7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'o3F2LQw7Y2VdSxgX' \
    > test.out 2>&1
eval_tap $? 260 'RevokeUserEntitlement' test.out

#- 261 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'ez7VvS0C9JLVQQPa' \
    --namespace "$AB_NAMESPACE" \
    --userId '7PPx4Zi6WaC8wk7H' \
    --body '{"reason": "MbJhNwZgf5nlMDOR", "useCount": 43}' \
    > test.out 2>&1
eval_tap $? 261 'RevokeUserEntitlementByUseCount' test.out

#- 262 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'c7ZuZXUCBYnkY0LE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BSYBdUSiTOrhB8hV' \
    --quantity '38' \
    > test.out 2>&1
eval_tap $? 262 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 263 RevokeUseCount
eval_tap 0 263 'RevokeUseCount # SKIP deprecated' test.out

#- 264 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'VOYqSH533YlJ93CC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GBXv4fP4VPzhcH4U' \
    --body '{"platform": "JrrCKvrOAi7lMgkV", "requestId": "WJYzSCIDxWUxgOze", "useCount": 89}' \
    > test.out 2>&1
eval_tap $? 264 'SellUserEntitlement' test.out

#- 265 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'EEBbqMMKvkOsR1fH' \
    --body '{"duration": 95, "endDate": "1989-07-18T00:00:00Z", "entitlementCollectionId": "v5T2kIQOecfLsYKT", "entitlementOrigin": "Nintendo", "itemId": "JE3uqZz574g31cA0", "itemSku": "PwZxTIZVSGQyTzhs", "language": "9Asy4d629N4YnolV", "metadata": {"WA2dWxBs056jkPCU": {}, "uE1pgdHvlQKiR7SD": {}, "QUDavOlKT5EIHNhJ": {}}, "order": {"currency": {"currencyCode": "Qq94Re5IM1akNKz9", "currencySymbol": "IltQUku3n32atB0Q", "currencyType": "REAL", "decimals": 87, "namespace": "v2GW9i54JY23AUWF"}, "ext": {"TLq0W1JqwKs1mO80": {}, "L7IOHlf6j8PZOzUi": {}, "QKZqz5NSp0B7LODN": {}}, "free": false}, "orderNo": "Boi2sSAO2n4MZQt7", "origin": "Xbox", "overrideBundleItemQty": {"QB93rOW0guPoQbYz": 4, "0xtQAXoDoFkmA3fg": 52, "uqUuyW3cMz9YyduM": 28}, "quantity": 25, "region": "1M1gzGCbaxw33rNb", "source": "SELL_BACK", "startDate": "1979-11-25T00:00:00Z", "storeId": "bbDU4FMTbQaANJOO"}' \
    > test.out 2>&1
eval_tap $? 265 'FulfillItem' test.out

#- 266 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'DGerDCWcl3VSJENQ' \
    --body '{"code": "opeHD6iKBGm5Cj7R", "language": "NNG_ReON", "region": "eqE7fcCAeExeQX43"}' \
    > test.out 2>&1
eval_tap $? 266 'RedeemCode' test.out

#- 267 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'LpmdMiZeyIrA4QUK' \
    --body '{"itemId": "SJgECzvaWUCA7wKr", "itemSku": "u7ry3AQ2sEHvSxjW", "quantity": 30}' \
    > test.out 2>&1
eval_tap $? 267 'PreCheckFulfillItem' test.out

#- 268 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'qwTZQIN5jC6a8mEV' \
    --body '{"entitlementCollectionId": "CXHmFnrSL0PJcZQa", "entitlementOrigin": "Steam", "metadata": {"Dfwl6XlCF6YxFMD8": {}, "tJQwZvUVInos5RK1": {}, "00yH89i8ZDPXRL8c": {}}, "origin": "Epic", "rewards": [{"currency": {"currencyCode": "FM4ahGw7XcF1Qwzz", "namespace": "606UGXPhoNZlXMef"}, "item": {"itemId": "7AvS3TfKx6ByTygb", "itemSku": "tOtcQS4Cmgw1wRUn", "itemType": "IVYxY6OhdkrYiCin"}, "quantity": 30, "type": "ITEM"}, {"currency": {"currencyCode": "VOzo4Plv1IlTpEhj", "namespace": "TFYdzsUNvQAn2LuM"}, "item": {"itemId": "jLqwmVz3zKsfjz1m", "itemSku": "FkyxoUzfMFoXCOgu", "itemType": "Sq2A4R3wDdSkNfHJ"}, "quantity": 40, "type": "ITEM"}, {"currency": {"currencyCode": "bYXmlAOi1SC3I1Sj", "namespace": "kH42LtyZKrTJo0L5"}, "item": {"itemId": "sHil4Q0mqa8Gatrj", "itemSku": "bJ5YT7uvqarTvrG1", "itemType": "DXZAWlvz3c3XALMr"}, "quantity": 10, "type": "CURRENCY"}], "source": "PAYMENT", "transactionId": "VAciu2XPPUxzXHUv"}' \
    > test.out 2>&1
eval_tap $? 268 'FulfillRewards' test.out

#- 269 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'xhvTZcvRKoaM4ozS' \
    --endTime 'Ag8FTLrByWOJhboc' \
    --limit '30' \
    --offset '84' \
    --productId 'GlPzdfxcC3rpWhSp' \
    --startTime 'q0InxMLpP7n7M3JX' \
    --status 'FAILED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 269 'QueryUserIAPOrders' test.out

#- 270 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Evsj5WcQ99M1yuXe' \
    > test.out 2>&1
eval_tap $? 270 'QueryAllUserIAPOrders' test.out

#- 271 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'qV31LX2ehcMnM6Qt' \
    --endTime 'jzQjDlUMCGnxZwak' \
    --limit '75' \
    --offset '60' \
    --startTime 'HnzGASmVzePIroz4' \
    --status 'PENDING' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 271 'QueryUserIAPConsumeHistory' test.out

#- 272 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'J4pe0s0Cuhl3dU9b' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "vz-FcUU", "productId": "DCWx3cEX8wTi1v2a", "region": "bpCWytPEi9Ze0hL9", "transactionId": "rPkV5GkSrcl2O47X", "type": "STADIA"}' \
    > test.out 2>&1
eval_tap $? 272 'MockFulfillIAPItem' test.out

#- 273 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'zU7qlNVk7qnmBS3X' \
    --discounted  \
    --itemId 'KDhp1OkMcErmeH0l' \
    --limit '82' \
    --offset '10' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 273 'QueryUserOrders' test.out

#- 274 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'j3XgTRTjI9oNBzgQ' \
    --body '{"currencyCode": "4CRwg0sKVeSpMny0", "currencyNamespace": "GrvKI5EVB9ZFzLNs", "discountCodes": ["IP7dpJ8B8VwFQnVc", "jdCFtKY0KsxR0rCF", "kyiQZfMnTbKdwNhi"], "discountedPrice": 28, "entitlementPlatform": "Oculus", "ext": {"2oCn1KvJmbjapW9U": {}, "lEqtzDd7SgxdxB5k": {}, "vtM8ah9bPsksceGU": {}}, "itemId": "EX8ERZcKSYLo6y7y", "language": "JMowQ6LpHCvCYTgX", "options": {"skipPriceValidation": true}, "platform": "Other", "price": 37, "quantity": 62, "region": "VY8qNwB2TY4v9NNf", "returnUrl": "QSYLFKSl3FNFFJnt", "sandbox": true, "sectionId": "cRn31D8ubfdXi7By"}' \
    > test.out 2>&1
eval_tap $? 274 'AdminCreateUserOrder' test.out

#- 275 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'cDPckeGJUgU8bD5m' \
    --itemId 'GFFmKTTUxG0mpmFx' \
    > test.out 2>&1
eval_tap $? 275 'CountOfPurchasedItem' test.out

#- 276 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'xDNXGlGJvHf558h1' \
    --userId 'ltyhiSGhfqXhxBJ7' \
    > test.out 2>&1
eval_tap $? 276 'GetUserOrder' test.out

#- 277 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'zLXioAGkWgSDdDQv' \
    --userId 'pRfGe3z2rtjWpJAl' \
    --body '{"status": "REFUNDING", "statusReason": "Jlw31pdDrXQ47WSG"}' \
    > test.out 2>&1
eval_tap $? 277 'UpdateUserOrderStatus' test.out

#- 278 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'yDCKF0LLhO3lGZ7e' \
    --userId 'GOPj2XoFug8BUQUm' \
    > test.out 2>&1
eval_tap $? 278 'FulfillUserOrder' test.out

#- 279 GetUserOrderGrant
eval_tap 0 279 'GetUserOrderGrant # SKIP deprecated' test.out

#- 280 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'PHnPumcazKAna0ji' \
    --userId '757aNDFeKnQP2j2W' \
    > test.out 2>&1
eval_tap $? 280 'GetUserOrderHistories' test.out

#- 281 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'sQImTwYkiuxzLrbJ' \
    --userId '0BkGzCNgesQlZZHI' \
    --body '{"additionalData": {"cardSummary": "ZH0iks6kx0adnimP"}, "authorisedTime": "1983-12-02T00:00:00Z", "chargebackReversedTime": "1983-07-19T00:00:00Z", "chargebackTime": "1984-02-02T00:00:00Z", "chargedTime": "1981-07-28T00:00:00Z", "createdTime": "1995-05-27T00:00:00Z", "currency": {"currencyCode": "SD9ImtaPAocOQcpB", "currencySymbol": "WSNrCjSNEAdojkCM", "currencyType": "REAL", "decimals": 86, "namespace": "YyTGO07foRZ6Fujp"}, "customParameters": {"IWo0qJtqp4Q6XgIC": {}, "LgMHcP1eE6sjWQll": {}, "YsONpp6QGW56CNis": {}}, "extOrderNo": "zHE69D1MMoaf6Klg", "extTxId": "RtwaM2IoyY1wpIdj", "extUserId": "cAtTj1IMuuhxxlul", "issuedAt": "1973-12-13T00:00:00Z", "metadata": {"mya73hX0a8Ri85PA": "9wNpmrK5Y5heA2ew", "WnFcqHxXP3kRhtrB": "cBofWTGYx2ihgioL", "8VvEzHGTt9emdCLm": "zJbdkykVAnmnRfUi"}, "namespace": "lcKA84d9pMsl7zrN", "nonceStr": "JvDiP2hNNEI8QrQ6", "paymentData": {"subtotalPrice": 68, "tax": 65, "totalPrice": 71}, "paymentMethod": "ro5CtU8UjgyCUpM1", "paymentMethodFee": 72, "paymentOrderNo": "K4FeVGrl5NpUG9zb", "paymentProvider": "CHECKOUT", "paymentProviderFee": 100, "paymentStationUrl": "76409vFd5z9r4nJW", "price": 95, "refundedTime": "1971-06-25T00:00:00Z", "salesTax": 77, "sandbox": true, "sku": "p1wxGF747468MXUq", "status": "CHARGE_FAILED", "statusReason": "TMBMzaOrxuKvtUVt", "subscriptionId": "qbDWnJ2i9TRmJOqI", "subtotalPrice": 23, "targetNamespace": "38d4NZGtk6EmWxC7", "targetUserId": "5M88TKhFYkA9aRND", "tax": 10, "totalPrice": 97, "totalTax": 71, "txEndTime": "1983-04-30T00:00:00Z", "type": "HurgOfba1XeoHYTN", "userId": "oRol84UlkxtP5Vok", "vat": 42}' \
    > test.out 2>&1
eval_tap $? 281 'ProcessUserOrderNotification' test.out

#- 282 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'sNK1ORg3tChsS3fF' \
    --userId 'paS1uq1mH3oYfPK2' \
    > test.out 2>&1
eval_tap $? 282 'DownloadUserOrderReceipt' test.out

#- 283 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'QiAUhIfi17YrkWHN' \
    --body '{"currencyCode": "xiaNyqBfgw58Hx0X", "currencyNamespace": "YL0fJOPYpnPqGlPn", "customParameters": {"hBDOWqDU8N3DjVUt": {}, "0n0jfyDbtIXICLkK": {}, "8ZvbnTg3znlg8nmz": {}}, "description": "Qx1RsYhcRlv16Wwe", "extOrderNo": "8YK3lZFslECI9Qzu", "extUserId": "QcsjFehD6uTDYnqy", "itemType": "SUBSCRIPTION", "language": "vp_zEnn_fg", "metadata": {"HmsHwIGGsusS0zZR": "ODEKPdudZsLaf8aZ", "rXW84dt0TSTmy7XF": "26K2U7xttUz8nWKJ", "jv06PuffHghAQfAs": "YXVzBenLtaAoYyRf"}, "notifyUrl": "iCWrm3s1Ah3TII70", "omitNotification": false, "platform": "IcBMJ04508jKedx0", "price": 59, "recurringPaymentOrderNo": "ZrkjRm5Ki0orhXrI", "region": "SEaPZHLQkTHvndQs", "returnUrl": "CKAO2JRz3CGwtujk", "sandbox": true, "sku": "AR1xFrnyirw3iJt5", "subscriptionId": "iA3JS2xeaJ08JrSH", "title": "PqdhKHn6ZjZMdr1C"}' \
    > test.out 2>&1
eval_tap $? 283 'CreateUserPaymentOrder' test.out

#- 284 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '2TIQzRJY7UfYSrdN' \
    --userId '0JVz4U43EcV1FRye' \
    --body '{"description": "eqehMNeRYKeMbL0G"}' \
    > test.out 2>&1
eval_tap $? 284 'RefundUserPaymentOrder' test.out

#- 285 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId '4v5D6ylZguO918X7' \
    > test.out 2>&1
eval_tap $? 285 'GetUserPlatformAccountClosureHistories' test.out

#- 286 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'rLoexHBMBMMAYokS' \
    --body '{"code": "WFwajRGUyklfLVY6", "orderNo": "g3PO4hKAeF4GUV5m"}' \
    > test.out 2>&1
eval_tap $? 286 'ApplyUserRedemption' test.out

#- 287 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '96qcCJsVOWtu5RPs' \
    --body '{"meta": {"qd66ImBEuhnaxZVf": {}, "6MD9r1y5Ihr531Ka": {}, "jxq7lzuVRVEvhKIb": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Oculus", "currencyCode": "mpllnV6B62P1Kazg", "namespace": "73c6UpmA4ehxNIIl"}, "entitlement": {"entitlementId": "crZzgameT2mLkkAM"}, "item": {"entitlementOrigin": "IOS", "itemIdentity": "hUwguGgbLLN3O7CE", "itemIdentityType": "ITEM_ID", "origin": "System"}, "quantity": 48, "type": "ITEM"}, {"currency": {"balanceOrigin": "Oculus", "currencyCode": "ngwMe1AnQVj6QQjZ", "namespace": "tkNJCnDSrsSey2Bq"}, "entitlement": {"entitlementId": "OxgwCymCDYsuff3b"}, "item": {"entitlementOrigin": "Epic", "itemIdentity": "G5FDX4mu0qPHb9Ll", "itemIdentityType": "ITEM_SKU", "origin": "Oculus"}, "quantity": 64, "type": "ITEM"}, {"currency": {"balanceOrigin": "Steam", "currencyCode": "LL1txfX9tqFSkGXo", "namespace": "IcFN5JL9M53Mg0Mz"}, "entitlement": {"entitlementId": "WS9usxxnMhjv66Dy"}, "item": {"entitlementOrigin": "Steam", "itemIdentity": "tIHyyMq79EdB9Mxa", "itemIdentityType": "ITEM_ID", "origin": "Other"}, "quantity": 88, "type": "ITEM"}], "source": "DLC", "transactionId": "GM2IuQYBO8m0HgTt"}' \
    > test.out 2>&1
eval_tap $? 287 'DoRevocation' test.out

#- 288 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'h479W8rXqwGVIRWg' \
    --body '{"gameSessionId": "TNHCka3Wb5kH1BrL", "payload": {"WUetP7nmESQDV3BD": {}, "1nnEzoUlUWqP4Elz": {}, "L44KEm3uHBMCP5ck": {}}, "scid": "jphURs4ksgsKJ2R6", "sessionTemplateName": "Jacwwu8W1zvrKMRP"}' \
    > test.out 2>&1
eval_tap $? 288 'RegisterXblSessions' test.out

#- 289 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'vwA9k6yJz03NETdy' \
    --chargeStatus 'NEVER' \
    --itemId 'fViEj70KYKIfFt4G' \
    --limit '71' \
    --offset '20' \
    --sku 'fcHBWZM50aHbPXRn' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 289 'QueryUserSubscriptions' test.out

#- 290 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '3qwYL6LwGlZGF7XQ' \
    --excludeSystem  \
    --limit '85' \
    --offset '11' \
    --subscriptionId 'LAcIL7FvAMWqhyyN' \
    > test.out 2>&1
eval_tap $? 290 'GetUserSubscriptionActivities' test.out

#- 291 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZH1CducB5y5iMdeB' \
    --body '{"grantDays": 66, "itemId": "C4Os7hqIH2NgARSG", "language": "3QQNGNH2K0UuJdeG", "reason": "NquQnaXpDQ5rU2ta", "region": "DWh9JV5oc5IFQsrw", "source": "HqFqwVA5mozeeOjI"}' \
    > test.out 2>&1
eval_tap $? 291 'PlatformSubscribeSubscription' test.out

#- 292 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'FQfXV3YW3ug3nCXh' \
    --itemId 'D7FUz1iOe0pHa0Lm' \
    > test.out 2>&1
eval_tap $? 292 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 293 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'seIRXeoerZAxbDPX' \
    --userId 'U5xJBhIpJ9b0Ap7C' \
    > test.out 2>&1
eval_tap $? 293 'GetUserSubscription' test.out

#- 294 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'mSiKPjcwAw5Gdxpv' \
    --userId 'Lfa4b4hTaZBGdX66' \
    > test.out 2>&1
eval_tap $? 294 'DeleteUserSubscription' test.out

#- 295 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'DqPTdurR3MYda0Y0' \
    --userId 'BCO4qPnvxERWjKas' \
    --force  \
    --body '{"immediate": true, "reason": "BEWrDbQ1ZzhDuLHq"}' \
    > test.out 2>&1
eval_tap $? 295 'CancelSubscription' test.out

#- 296 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '9LTBstguOdN0O7l3' \
    --userId 'GbKPHdDTQDEEE2mT' \
    --body '{"grantDays": 38, "reason": "FXChtxB10d4Q8nlB"}' \
    > test.out 2>&1
eval_tap $? 296 'GrantDaysToSubscription' test.out

#- 297 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'thUSu4WNfTvD5UcE' \
    --userId 'S1eLMZs9lSQVDp16' \
    --excludeFree  \
    --limit '34' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 297 'GetUserSubscriptionBillingHistories' test.out

#- 298 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Y7jI232SjktijiNz' \
    --userId 'TUe8KdizXmrmK0sC' \
    --body '{"additionalData": {"cardSummary": "UsqxKocHomtjoU1k"}, "authorisedTime": "1995-11-20T00:00:00Z", "chargebackReversedTime": "1979-08-31T00:00:00Z", "chargebackTime": "1992-12-28T00:00:00Z", "chargedTime": "1973-01-28T00:00:00Z", "createdTime": "1992-06-30T00:00:00Z", "currency": {"currencyCode": "3FEkk4It6V8Bu7rI", "currencySymbol": "jGrxUMKbv60ixUuU", "currencyType": "REAL", "decimals": 28, "namespace": "opdqGrqRZ124P7Pa"}, "customParameters": {"uXTrpWAjwatSvtPb": {}, "AFn8oWQcmFkkRX6E": {}, "qadAEIzxld80Ynss": {}}, "extOrderNo": "7hc3VUxxZIgkTLqM", "extTxId": "eJPCbs8jWmTteJhw", "extUserId": "NbwHGG39YAZJ4HuL", "issuedAt": "1973-04-02T00:00:00Z", "metadata": {"eTfFBTOFFMJ9pq51": "1jZcTK8zmMfyshYk", "3b5cAFVo85r1b8Yp": "2QnuhQuIdvZdj6As", "pWBfRnLcLbp7Omcr": "DJ7u1rrRPcnG89rn"}, "namespace": "NW1Yjfn8lY4DnYRx", "nonceStr": "Y8ZhHeb0CaPFDjrS", "paymentData": {"subtotalPrice": 30, "tax": 86, "totalPrice": 40}, "paymentMethod": "9xutntU8xHw4yYJO", "paymentMethodFee": 58, "paymentOrderNo": "RffM5JXvPdzEpDln", "paymentProvider": "XSOLLA", "paymentProviderFee": 64, "paymentStationUrl": "aYSvsWiNJtqXltZF", "price": 11, "refundedTime": "1971-02-12T00:00:00Z", "salesTax": 90, "sandbox": true, "sku": "mHU5iR3hXIbzWPKO", "status": "CHARGEBACK", "statusReason": "tBLljC7gcT3M1DAr", "subscriptionId": "k4L80aXFY7SQkym9", "subtotalPrice": 74, "targetNamespace": "X2lnqi7cHTSdGoLZ", "targetUserId": "bC3UJruU4uIXBZsE", "tax": 72, "totalPrice": 30, "totalTax": 25, "txEndTime": "1974-12-05T00:00:00Z", "type": "FWiH9z4E8zmaZ5cg", "userId": "0REtUWY4fVIdqwCW", "vat": 65}' \
    > test.out 2>&1
eval_tap $? 298 'ProcessUserSubscriptionNotification' test.out

#- 299 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'Ng33ZIUrIkfmdXVv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aPQzzKdFg7N7piT8' \
    --body '{"count": 97, "orderNo": "udQusJLsPlW7ZyOR"}' \
    > test.out 2>&1
eval_tap $? 299 'AcquireUserTicket' test.out

#- 300 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'FkN9EbKbTbrDzNgV' \
    > test.out 2>&1
eval_tap $? 300 'QueryUserCurrencyWallets' test.out

#- 301 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'Ecw0lxRam16O6v4V' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jJf40LjUdORELVXU' \
    --body '{"allowOverdraft": true, "amount": 98, "balanceOrigin": "GooglePlay", "balanceSource": "EXPIRATION", "metadata": {"R7mMuBXPDKCriRKz": {}, "TZ7TXAVRnUVbxEJc": {}, "KHE764EwhQfxFKIO": {}}, "reason": "GT1WKSmLoA0ILaES"}' \
    > test.out 2>&1
eval_tap $? 301 'DebitUserWalletByCurrencyCode' test.out

#- 302 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'C1GJXsoBwqh0TQXa' \
    --namespace "$AB_NAMESPACE" \
    --userId '2j7v3zQJoQLTAlW7' \
    --limit '55' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 302 'ListUserCurrencyTransactions' test.out

#- 303 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'ukCL26ihdMy9YCLN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JEkvq6SUSt8xd8Eg' \
    --request '{"amount": 64, "debitBalanceSource": "PAYMENT", "metadata": {"15XNuw6Y7sToQNku": {}, "ZzJ1XBxw01iBBQuk": {}, "gQ94ZvPCWcMX0ov3": {}}, "reason": "U2sKjIeyFS97dYD7", "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 303 'CheckBalance' test.out

#- 304 CheckWallet
eval_tap 0 304 'CheckWallet # SKIP deprecated' test.out

#- 305 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode '1fmLSyGuu5rbJVIw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RMtwApGbXnR3yC6f' \
    --body '{"amount": 81, "expireAt": "1976-09-29T00:00:00Z", "metadata": {"KoMjCPtEKeBWTm78": {}, "Fn8TvZVTe4L2lXrV": {}, "PX6r5ZTcnVVOKMAp": {}}, "origin": "Epic", "reason": "oswEPTvzwwGnpbx8", "source": "REFERRAL_BONUS"}' \
    > test.out 2>&1
eval_tap $? 305 'CreditUserWallet' test.out

#- 306 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'fgsVbG6TUe3jbuQ7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HMPO4ozK705ykRqS' \
    --request '{"amount": 86, "debitBalanceSource": "TRADE", "metadata": {"McglFCrjxqqxAYqX": {}, "G2V3baMkZ9JCqBIk": {}, "UID0EE9InZNLwwAh": {}}, "reason": "W2b5OHKtUv4lTkQN", "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 306 'DebitByWalletPlatform' test.out

#- 307 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'volfI0mqZctohLhe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RaQkfMLFW9B7jHZr' \
    --body '{"amount": 29, "metadata": {"3NHU8iYUOtG5gbQS": {}, "KW2MdgCH4bWxRF6f": {}, "BPa6GOuV5z0p8jaJ": {}}, "walletPlatform": "Oculus"}' \
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
    --storeId 'Q6CkVi8fqVPRqNbF' \
    > test.out 2>&1
eval_tap $? 313 'ListViews' test.out

#- 314 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId '5yLnYSa8xFLvcYex' \
    --body '{"displayOrder": 80, "localizations": {"f8tjCjWc22qqDfNz": {"description": "59jHwSDQHadmAo0l", "localExt": {"zhPm7RmaOr6TLwVy": {}, "E42ApAb7CKt79wAo": {}, "pZL9Cw6K9h55mwUv": {}}, "longDescription": "hdBOgumV4wAsd4if", "title": "Gd0bkWrlhtfTywRW"}, "4fmg6btk3mAO4EtB": {"description": "0hn2x1oTOX5gBQlV", "localExt": {"Dx9neFHWhDRJtyYE": {}, "t7ygZleAoUuVKneo": {}, "O10ytPdJ8SY3qoog": {}}, "longDescription": "OxoPYvdIBJYyGURj", "title": "EjnslEYM8ngVT1ew"}, "VxvgAocOqsd5v5n7": {"description": "eXCo9gZWdxfIdW8f", "localExt": {"NAM5YdHivK2Q0Wwo": {}, "lQy037hJMOEv5W0v": {}, "25yAObZIbrA8XAKK": {}}, "longDescription": "WMDebehSjpt0wrfW", "title": "PXaI1Jb75o2MFOa6"}}, "name": "xgPt69QROGDeJCyH"}' \
    > test.out 2>&1
eval_tap $? 314 'CreateView' test.out

#- 315 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'vUsnLvXCSgQHvs25' \
    --storeId 'eiQO3oWdgXdm1IxL' \
    > test.out 2>&1
eval_tap $? 315 'GetView' test.out

#- 316 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId '1OtleUBqBO0Ze049' \
    --storeId 'k9W6ZLVJzRpUsITf' \
    --body '{"displayOrder": 98, "localizations": {"FwLgT78nootfUs95": {"description": "59ilm3cauhrw9Yn2", "localExt": {"z5cnbm7z2Aa24yBT": {}, "w3wfNGyWf3VujS7B": {}, "q5bcfPW4pPZB9YXl": {}}, "longDescription": "tCxyztUnj17t3gHB", "title": "XvjvziexzOLbOWbt"}, "cJUxM3AWyDkA5LmA": {"description": "RT6kulpM4SRtUE5P", "localExt": {"4kxmHtFbjqurHix0": {}, "QYycDH5we2Mx0sYC": {}, "nYPT4i4mxc14iRfz": {}}, "longDescription": "JwKuc7EpiQEzz5N5", "title": "osRYO7wbYh7q02W8"}, "tkTURUFmqNc8xhQq": {"description": "ptccNorRls7EC3nD", "localExt": {"nhFvDlFd7iyZpvWV": {}, "JFK6ZuvlzGCII156": {}, "hIg0g8HIxpzm9AcF": {}}, "longDescription": "hH4ZlYY3rEuHMWwQ", "title": "NmCQmGCF963CbsOa"}}, "name": "wlRBQJH6fNekhk07"}' \
    > test.out 2>&1
eval_tap $? 316 'UpdateView' test.out

#- 317 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId '7gxaj55huTA6AvmW' \
    --storeId '0567BFqbrPIuxKmB' \
    > test.out 2>&1
eval_tap $? 317 'DeleteView' test.out

#- 318 QueryWallets
eval_tap 0 318 'QueryWallets # SKIP deprecated' test.out

#- 319 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 23, "expireAt": "1990-03-04T00:00:00Z", "metadata": {"HGtpK43uORGREOOw": {}, "TuY8dhNCDWWpN3B6": {}, "tedgFUzBm5vGA3it": {}}, "origin": "Twitch", "reason": "qgCG7JwJCDqkzOdF", "source": "IAP_CHARGEBACK_REVERSED"}, "currencyCode": "f6P3D3rVcC2g6t42", "userIds": ["dSDd99DQZ7vnTx8H", "jE1Wad232YV7A2zH", "FGbN8AQaCaw9UF7c"]}, {"creditRequest": {"amount": 62, "expireAt": "1980-05-18T00:00:00Z", "metadata": {"TJWiyw17ogzmbj4S": {}, "LYDrZJvDLGvn6qtr": {}, "oZcp16HKXX1ft5nB": {}}, "origin": "Playstation", "reason": "GZJmgWNHWnvOBRCt", "source": "TRADE"}, "currencyCode": "2FMcKd7c94rEmIYu", "userIds": ["aM0wmi0i1WABBbq8", "DBF1oU37vjfyX5YL", "AT5OAcUwYHGmG5rN"]}, {"creditRequest": {"amount": 72, "expireAt": "1974-08-02T00:00:00Z", "metadata": {"kwHifMHYI581HbF7": {}, "fMX9lDXYxGRJM92e": {}, "X42WW2WKf5urEOpA": {}}, "origin": "Nintendo", "reason": "BicX3ZwzZ7aVhrkm", "source": "CONSUME_ENTITLEMENT"}, "currencyCode": "10Hy9jx7gBHTOHHA", "userIds": ["KeVNHU9GcOivIfcC", "rjld0LnREsrrB2pJ", "7V8BSrucjO3zvSM5"]}]' \
    > test.out 2>&1
eval_tap $? 319 'BulkCredit' test.out

#- 320 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "Jt4U8VSgXoi9Fw25", "request": {"allowOverdraft": false, "amount": 82, "balanceOrigin": "Epic", "balanceSource": "IAP_REVOCATION", "metadata": {"TEhMXMepgzY9jLiA": {}, "dMiQ7eDMkeBRMur1": {}, "8nCxiV9bQMHpPbvf": {}}, "reason": "lI3LkRc1NgZaoYAa"}, "userIds": ["CCeRgtstsU3Qecxo", "jrr1OL606QpqCgxt", "4bQZO3P2f8TTOVf6"]}, {"currencyCode": "0NgDSj1T6EdeYFmr", "request": {"allowOverdraft": false, "amount": 5, "balanceOrigin": "System", "balanceSource": "EXPIRATION", "metadata": {"bvS4kSSt3CyDgf6e": {}, "FAiqSkHi0BR2ElF6": {}, "z6eJKuOW61akRFiz": {}}, "reason": "qxCmudSXivAL3n47"}, "userIds": ["8mhb2I2yBJeCJghT", "UbgZQfw6Zys3mN8f", "rk68FWFzuLBdlrKj"]}, {"currencyCode": "IcC9CkharfqaoMsG", "request": {"allowOverdraft": true, "amount": 45, "balanceOrigin": "Epic", "balanceSource": "TRADE", "metadata": {"9fntCNiHBRUNCPSr": {}, "e5GmZzCQwilS3IxS": {}, "jlyvR9PxG9Lji2Vc": {}}, "reason": "88W8aLjIxVGpdOqg"}, "userIds": ["uxvRwI9ZBTipMRlh", "K9DMMaI4ryVDvNar", "uZxwTfh9gEs6GF24"]}]' \
    > test.out 2>&1
eval_tap $? 320 'BulkDebit' test.out

#- 321 GetWallet
eval_tap 0 321 'GetWallet # SKIP deprecated' test.out

#- 322 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey '7cbBLjUr5z03wxB3' \
    --end 'E9hrE9f9COFrOr6w' \
    --start 'JDBwIDsJHNg6TvNG' \
    > test.out 2>&1
eval_tap $? 322 'SyncOrders' test.out

#- 323 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["jwI4TbTwBufUorJo", "uduhCEJ5XiKDIE9Y", "ugcupLxVBcRkfhRu"], "apiKey": "qkOTHSia7oFd1fEm", "authoriseAsCapture": true, "blockedPaymentMethods": ["FiliYmBrqrOc0NIl", "igBrOkBljwRENjt0", "4ZpyTTZG1LxLdySv"], "clientKey": "yVqY8nxBZbHcPHEF", "dropInSettings": "uEVP9bF07gnWDULk", "liveEndpointUrlPrefix": "JPQR0UJMr8ouccGH", "merchantAccount": "0B4LCe2h0iFCCZgF", "notificationHmacKey": "Ws5s0nT89A88GDOU", "notificationPassword": "ClGyzYgnYTdim6Pk", "notificationUsername": "Roq5TO65KWh8ztRJ", "returnUrl": "kXxUAj3jzZvEaY10", "settings": "3YUIMuSjDHz0zPWM"}' \
    > test.out 2>&1
eval_tap $? 323 'TestAdyenConfig' test.out

#- 324 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "ZQNNP2JqQqhISTBT", "privateKey": "1Gofv4SuaZ8yCB9T", "publicKey": "VZnuzgvAZJRm71EC", "returnUrl": "3ENuvD8OPsp5Z3ez"}' \
    > test.out 2>&1
eval_tap $? 324 'TestAliPayConfig' test.out

#- 325 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "84KVB7HeWPnVeFdy", "secretKey": "5ezlCU6SGzkMpTL2"}' \
    > test.out 2>&1
eval_tap $? 325 'TestCheckoutConfig' test.out

#- 326 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'wxobjxAbagqEmXn6' \
    > test.out 2>&1
eval_tap $? 326 'DebugMatchedPaymentMerchantConfig' test.out

#- 327 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "U2VeV2emK3JecJA4", "webhookSecretKey": "skqCbPxRkIAFQh9y"}' \
    > test.out 2>&1
eval_tap $? 327 'TestNeonPayConfig' test.out

#- 328 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "DdoLE2s7mrVrmTJw", "clientSecret": "tBTzQTrNo1LcWNf7", "returnUrl": "xHpi1JZJjIRtCfqD", "webHookId": "HSlo54zSnRN0zGMw"}' \
    > test.out 2>&1
eval_tap $? 328 'TestPayPalConfig' test.out

#- 329 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["orzym1z3ZdetOic9", "AQOFWpdItLBhvKJq", "9tWz9yui8a6jOflF"], "publishableKey": "JlZEhz1QDeh05hj9", "secretKey": "2bwVVxJ62Q5AOAOy", "webhookSecret": "L65cPaOZA8BG8KcV"}' \
    > test.out 2>&1
eval_tap $? 329 'TestStripeConfig' test.out

#- 330 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "WOX9n3YsjJexnFA9", "key": "Umz3KPICya5Fk5TP", "mchid": "aEbX29cV8v7MXcti", "returnUrl": "htxMnIr4b7jyfL3z"}' \
    > test.out 2>&1
eval_tap $? 330 'TestWxPayConfig' test.out

#- 331 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "MkklGCPISlsnVA6z", "flowCompletionUrl": "0uSfNNpJUYzJxnOy", "merchantId": 44, "projectId": 57, "projectSecretKey": "qmswrToyBIQumxDf"}' \
    > test.out 2>&1
eval_tap $? 331 'TestXsollaConfig' test.out

#- 332 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'AxNqCUtizYM97ebZ' \
    > test.out 2>&1
eval_tap $? 332 'GetPaymentMerchantConfig1' test.out

#- 333 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'cYqwfIHPWMkOmrT5' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["HL16jMwECnmwJv4r", "pqtzDaz0WUJlBCHz", "J2v9K8c1zOlZg30p"], "apiKey": "agfP0FfOMBOpeQT4", "authoriseAsCapture": true, "blockedPaymentMethods": ["K5grmPBsFH71Vrhs", "ISYtegQbNA2WQrHT", "kJT1VkChD3n0c1ry"], "clientKey": "AkRvdPR8gx2rX5dc", "dropInSettings": "k8NFKPgT6LMehg04", "liveEndpointUrlPrefix": "7axU5ktNywRIvO2S", "merchantAccount": "gz30hejqdktHIO1V", "notificationHmacKey": "dtMSews1TrU4FhAf", "notificationPassword": "KDcDG5bMTba1tUlF", "notificationUsername": "GcP6eL7EpWtPifmO", "returnUrl": "0JK4dP1aZFiSkmhw", "settings": "VVMGkXNwMYwFyljy"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdateAdyenConfig' test.out

#- 334 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id '5bYQdQ87hUHA0FJZ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 334 'TestAdyenConfigById' test.out

#- 335 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'wP8GslMpx3m7lEXT' \
    --sandbox  \
    --validate  \
    --body '{"appId": "mnTbtjK9RsyoqT3a", "privateKey": "dB48Jxp2zaItg9jT", "publicKey": "NZvpFEUI21aSaIsM", "returnUrl": "yLKPPIZx0zdNAagi"}' \
    > test.out 2>&1
eval_tap $? 335 'UpdateAliPayConfig' test.out

#- 336 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'pZwiaBrFrXtGMjuj' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 336 'TestAliPayConfigById' test.out

#- 337 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'fHZB1gMI1B8DXb37' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "DffTZ7yQz337LLNC", "secretKey": "jIySe36SA5dxATLv"}' \
    > test.out 2>&1
eval_tap $? 337 'UpdateCheckoutConfig' test.out

#- 338 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id '5PkLvraRzChdjDGd' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 338 'TestCheckoutConfigById' test.out

#- 339 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'lk2A2jHbAPNGInvb' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "nf4ewKFFLoGggX4g", "webhookSecretKey": "QWyZocvYfr0Rnl02"}' \
    > test.out 2>&1
eval_tap $? 339 'UpdateNeonPayConfig' test.out

#- 340 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'R1IVNnaK6KS71Xs1' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 340 'TestNeonPayConfigById' test.out

#- 341 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'BphA9BXpKYgF9Oui' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "gDP0Vjmy7j2BrdCA", "clientSecret": "m3slCwaBqHpE55sj", "returnUrl": "xBGijw0dQtZNonMr", "webHookId": "PkzUe9SglAJGyZS0"}' \
    > test.out 2>&1
eval_tap $? 341 'UpdatePayPalConfig' test.out

#- 342 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'I8FevJiT98HUBp56' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 342 'TestPayPalConfigById' test.out

#- 343 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'Q4WETxtGMs5tPKPu' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["K0K4PiMDTR7Lxihu", "On57io0d9dG3yzaN", "bGeASX83SLiIbAP2"], "publishableKey": "qyUnHnfrEdDfY4TT", "secretKey": "xu8goZgsX4RwfM4q", "webhookSecret": "nUdcQqZ9F1uivPob"}' \
    > test.out 2>&1
eval_tap $? 343 'UpdateStripeConfig' test.out

#- 344 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id '0YZEuXQACDDQryNf' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 344 'TestStripeConfigById' test.out

#- 345 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id '9VGxbOeJe4n9eUlB' \
    --validate  \
    --body '{"appId": "QZ2UGePWXbAyGiXa", "key": "9nUsHCVicuJ7onrU", "mchid": "XVlB6xNel4Bxb9Kw", "returnUrl": "FYqdhEVq3hbsApeA"}' \
    > test.out 2>&1
eval_tap $? 345 'UpdateWxPayConfig' test.out

#- 346 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'SfR0ljKxqZcLuhwN' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 346 'UpdateWxPayConfigCert' test.out

#- 347 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'DvValv3bkoMXNzl1' \
    > test.out 2>&1
eval_tap $? 347 'TestWxPayConfigById' test.out

#- 348 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'ywEPiunixlEAHZzH' \
    --validate  \
    --body '{"apiKey": "s8x5oPSkZFIV2feX", "flowCompletionUrl": "nTRlzAJy9oFOHB2K", "merchantId": 63, "projectId": 93, "projectSecretKey": "sIdtozVltBhoXE4w"}' \
    > test.out 2>&1
eval_tap $? 348 'UpdateXsollaConfig' test.out

#- 349 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'gcYT5CdjaJuUzFIe' \
    > test.out 2>&1
eval_tap $? 349 'TestXsollaConfigById' test.out

#- 350 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'qaVr1CE1gu6cYuzC' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "SMALL", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 350 'UpdateXsollaUIConfig' test.out

#- 351 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '46' \
    --namespace "$AB_NAMESPACE" \
    --offset '16' \
    --region 'iNCsnK8CcO1OHbpQ' \
    > test.out 2>&1
eval_tap $? 351 'QueryPaymentProviderConfig' test.out

#- 352 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "twW3EwLre1bL4dJn", "region": "kRLJbMvOGSd7uMrm", "sandboxTaxJarApiToken": "Q2SaLd6M7TM3wnJy", "specials": ["WXPAY", "PAYPAL", "WALLET"], "taxJarApiToken": "RN2ENn1RLi5iMPnb", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 352 'CreatePaymentProviderConfig' test.out

#- 353 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 353 'GetAggregatePaymentProviders' test.out

#- 354 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region '7o1zYpqUsliPyXZG' \
    > test.out 2>&1
eval_tap $? 354 'DebugMatchedPaymentProviderConfig' test.out

#- 355 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 355 'GetSpecialPaymentProviders' test.out

#- 356 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'YIW5ZDtWbdkzPP47' \
    --body '{"aggregate": "CHECKOUT", "namespace": "cUIi2CoNj4EG2emx", "region": "KQk8cBrt5E8k8rzD", "sandboxTaxJarApiToken": "Z08j6ICP75cm8YDC", "specials": ["ALIPAY", "CHECKOUT", "XSOLLA"], "taxJarApiToken": "W6fjtBcO3fWq9qfm", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 356 'UpdatePaymentProviderConfig' test.out

#- 357 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '0veFl3uU1aMD0mcz' \
    > test.out 2>&1
eval_tap $? 357 'DeletePaymentProviderConfig' test.out

#- 358 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 358 'GetPaymentTaxConfig' test.out

#- 359 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "Wxc8f1s2QPMMZsf2", "taxJarApiToken": "dvKZyHChRPHvdkcK", "taxJarEnabled": true, "taxJarProductCodesMapping": {"p0damycnTUOoMkOp": "pZNOkqxc42HKv5wv", "tPJVsuzaBciSxwzu": "IpGBYHTHoSVxgQCb", "pZx5yMGIQ1ZxVIef": "YlKBJyQMqUEfDikX"}}' \
    > test.out 2>&1
eval_tap $? 359 'UpdatePaymentTaxConfig' test.out

#- 360 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey '6yOlgZrn0I6T0hvc' \
    --end 'AFTaSWR4VOGIY7hM' \
    --start '6uhonkAe0FdTSSEl' \
    > test.out 2>&1
eval_tap $? 360 'SyncPaymentOrders' test.out

#- 361 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'uBxM47BTww3nBTVm' \
    --storeId 'BFZ6TIs9bTi2m7eN' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetRootCategories' test.out

#- 362 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'sYEqKkeuLWDfeFeE' \
    --storeId 'xlOFjRh8mLFTJLve' \
    > test.out 2>&1
eval_tap $? 362 'DownloadCategories' test.out

#- 363 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'QSDWnMQGaYRxFWia' \
    --namespace "$AB_NAMESPACE" \
    --language '7yJ2d87XjA0ajvb7' \
    --storeId 'JcGUFgp6LkyXpxJe' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetCategory' test.out

#- 364 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'FxhgTwyO51CUpcdx' \
    --namespace "$AB_NAMESPACE" \
    --language 'L0a9VDhrqWCTXOxQ' \
    --storeId 'UpyFgZhNpOTE4toH' \
    > test.out 2>&1
eval_tap $? 364 'PublicGetChildCategories' test.out

#- 365 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath '57yr01N33p1Gha8H' \
    --namespace "$AB_NAMESPACE" \
    --language 'wpagvERZI6Cqhckn' \
    --storeId 'hecNv2Tw6YKhVrYk' \
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
    --platform 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 368 'GetIAPItemMapping' test.out

#- 369 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'GqMkZ44UXgdBqtJa' \
    --region 'RyDlP9qIZJ5Krx6K' \
    --storeId 'kHagEugKJxkU8Y58' \
    --appId 'COtTNjnNSikJDg6u' \
    > test.out 2>&1
eval_tap $? 369 'PublicGetItemByAppId' test.out

#- 370 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'k4Gr7jVVx5l3yrH9' \
    --categoryPath 'HR4reG0HwUXxQTf5' \
    --features 'YpDUGYsJBEkYUrLv' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --language 'qUiTkFcLBrg2JB0W' \
    --limit '16' \
    --offset '17' \
    --region 'CpVBwvAffJ3btt0P' \
    --sortBy 'createdAt:asc,displayOrder:desc,displayOrder:asc' \
    --storeId 'Y3Pnnic80yEO8dL6' \
    --tags 'Jh10XMUGeDavCKra' \
    > test.out 2>&1
eval_tap $? 370 'PublicQueryItems' test.out

#- 371 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'dJmJFUsU418vAlmf' \
    --region 'Gg9NO1Z2DvnAxH3p' \
    --storeId 'S3jyCkGKltBNE2Ub' \
    --sku 'hNtH3yYg4Qnn2uhd' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetItemBySku' test.out

#- 372 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'w7C9Bx1LQOTCbAPL' \
    --storeId 'C3iqrkyJFOVaewFc' \
    --itemIds 'v9h31YxuZnoSesWp' \
    > test.out 2>&1
eval_tap $? 372 'PublicGetEstimatedPrice' test.out

#- 373 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'LUHjGaIcZN28gH4C' \
    --region 'd9xTdt2K1CzpQWsl' \
    --storeId 'NGnLYUYR0yOvJhUj' \
    --itemIds 'zcMtwINUlrhIpnla' \
    > test.out 2>&1
eval_tap $? 373 'PublicBulkGetItems' test.out

#- 374 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["m2EefVopbpPhsana", "0uXG7GUTV1BwgkLD", "j4pjVktyoNSsEHlz"]}' \
    > test.out 2>&1
eval_tap $? 374 'PublicValidateItemPurchaseCondition' test.out

#- 375 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'LOOTBOX' \
    --limit '40' \
    --offset '8' \
    --region 'DEtU2xBSEQ8rBKc2' \
    --storeId 'K6oJXxVEfnaqX8Nu' \
    --keyword 'ZtRUTKUvR69PImy6' \
    --language 'CcwlqJ4MO3L8x1H5' \
    > test.out 2>&1
eval_tap $? 375 'PublicSearchItems' test.out

#- 376 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'OgzHypgsSeKCvtPz' \
    --namespace "$AB_NAMESPACE" \
    --language '7jagBG9a1TZ87ltC' \
    --region 'lc3RDXF5055tUlen' \
    --storeId 'imjIbm0riCaNp8dU' \
    > test.out 2>&1
eval_tap $? 376 'PublicGetApp' test.out

#- 377 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'BDinAB6HqIWIi5Bv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 377 'PublicGetItemDynamicData' test.out

#- 378 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'b1rcuEtWAF763kci' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '7lT62BOHaso53W3U' \
    --populateBundle  \
    --region '2Mu9ZGMWou1U0RVC' \
    --storeId 'f3gMWDAodCKqfqze' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetItem' test.out

#- 379 GetPaymentCustomization
eval_tap 0 379 'GetPaymentCustomization # SKIP deprecated' test.out

#- 380 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "exHA70NgJTxjtzgO", "successUrl": "7W3taRvJ6lKWJwHO"}, "paymentOrderNo": "65aOFDwpqy7XOU3D", "paymentProvider": "STRIPE", "returnUrl": "DNuMBZegHtB9uTCi", "ui": "iIoMZCjGiOZJpUf9", "zipCode": "RpcfEQn0O6D8PGQu"}' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetPaymentUrl' test.out

#- 381 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'azAypgWhTED5YmPT' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetPaymentMethods' test.out

#- 382 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'BUkm2FyvdguCYVqF' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetUnpaidPaymentOrder' test.out

#- 383 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'yIKh1YtTY4AejyQc' \
    --paymentProvider 'ADYEN' \
    --zipCode 'Dac7hSLldWx5Dyni' \
    --body '{"token": "VESUgrROrP1ip3jN"}' \
    > test.out 2>&1
eval_tap $? 383 'Pay' test.out

#- 384 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'G68DByf2UMPtigq9' \
    > test.out 2>&1
eval_tap $? 384 'PublicCheckPaymentOrderPaidStatus' test.out

#- 385 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'WALLET' \
    --region 'wIpEy2ZNpojZ24I2' \
    > test.out 2>&1
eval_tap $? 385 'GetPaymentPublicConfig' test.out

#- 386 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'n25smsrmJFHGiYny' \
    > test.out 2>&1
eval_tap $? 386 'PublicGetQRCode' test.out

#- 387 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'hbqxLuTZIxgiUaiy' \
    --foreinginvoice 'y0aWrshpmb1C9Al7' \
    --invoiceId 'eWrbNRE0xyYPUZHy' \
    --payload 'LGQ52IjGpRJCUJps' \
    --redirectResult 'cOTkWETSJ04c5MGI' \
    --resultCode 'nO4yznh2YpZvvmzi' \
    --sessionId 'SSiSpXeWOGayfRkQ' \
    --status 'voN06SpNOnuSksfm' \
    --token '7hcIFdkdrwAcK2lU' \
    --type 'da9h9FgvfhiLEAkA' \
    --userId '7n6516ydoRT1qZBr' \
    --orderNo 'dTnGrwHeWoQXPFWF' \
    --paymentOrderNo 'aKbDgrGkv8SVwLyS' \
    --paymentProvider 'WALLET' \
    --returnUrl 'VbHJvD0lL7aZUY9d' \
    > test.out 2>&1
eval_tap $? 387 'PublicNormalizePaymentReturnUrl' test.out

#- 388 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '1Idud8bjYeBVMr7z' \
    --paymentOrderNo 'HYmRE4X36KUOdfEm' \
    --paymentProvider 'NEONPAY' \
    > test.out 2>&1
eval_tap $? 388 'GetPaymentTaxValue' test.out

#- 389 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '5qu98RhktX6qwkXb' \
    > test.out 2>&1
eval_tap $? 389 'GetRewardByCode' test.out

#- 390 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'CLbh8t0zPkQWRUlg' \
    --limit '62' \
    --offset '62' \
    --sortBy 'rewardCode,namespace:desc,namespace:asc' \
    > test.out 2>&1
eval_tap $? 390 'QueryRewards1' test.out

#- 391 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'udHlA4AxeEIfUxJ2' \
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
    --appIds 'xMSNNBxCeN3pGn46,fGvodt413MRdG8qA,PiANv2Ar8yXV6qf6' \
    --itemIds 'v5SgcJPZPUh2nHQw,pWi8HZ6C0VJ0fK2m,6lQ5Ao8TITYiHSR2' \
    --skus 'SEJh1YDedZdNqkXP,WZfT8ZfdKp9q4nXu,K0tJAYror2XdtSCG' \
    > test.out 2>&1
eval_tap $? 393 'PublicExistsAnyMyActiveEntitlement' test.out

#- 394 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId '7ZExOoIpWzacOvwU' \
    > test.out 2>&1
eval_tap $? 394 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 395 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'Q5bk5IeuAi3zWFGo' \
    > test.out 2>&1
eval_tap $? 395 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 396 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'RUL7wS3HaMTXAX6y' \
    > test.out 2>&1
eval_tap $? 396 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 397 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds '0STTN2sBEijjjpvS,zGkED0oweFYDBPyd,1jJBxbrbuFay9PXg' \
    --itemIds 'EQS4871QSmsspn5s,NfifK65tvaH9jwcO,48pthyYpBJDHIIxT' \
    --skus 'IGI5EssYllIqjJzu,Q8GglVgxjOGQGlHm,8VTN56tJKwD8O07L' \
    > test.out 2>&1
eval_tap $? 397 'PublicGetEntitlementOwnershipToken' test.out

#- 398 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "9GG1uenDihceaLdg", "language": "IKje_yyWm", "region": "5bzcfzIpL2pWB4Xs"}' \
    > test.out 2>&1
eval_tap $? 398 'SyncTwitchDropsEntitlement' test.out

#- 399 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'drxIF6kEAmKGNEmF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 399 'PublicGetMyWallet' test.out

#- 400 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'PcUALNziO9Bz2wx4' \
    --body '{"epicGamesJwtToken": "kDAm8XIleiujtv2N"}' \
    > test.out 2>&1
eval_tap $? 400 'SyncEpicGameDLC' test.out

#- 401 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'dQTYoHZogW8lBvni' \
    > test.out 2>&1
eval_tap $? 401 'SyncOculusDLC' test.out

#- 402 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'HdARadfSoctA3GYO' \
    --body '{"serviceLabel": 12}' \
    > test.out 2>&1
eval_tap $? 402 'PublicSyncPsnDlcInventory' test.out

#- 403 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId '4ZOo94gS5DHLB65f' \
    --body '{"serviceLabels": [88, 3, 47]}' \
    > test.out 2>&1
eval_tap $? 403 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 404 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'civHGIEplRpcHDWc' \
    --body '{"appId": "IoJ45L0Ze3YamxKD", "steamId": "SZTl4UiJSCbG4UmG"}' \
    > test.out 2>&1
eval_tap $? 404 'SyncSteamDLC' test.out

#- 405 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '3TkMTzOcBIciiKwR' \
    --body '{"xstsToken": "s1E7sH2G9MJ6F7Rr"}' \
    > test.out 2>&1
eval_tap $? 405 'SyncXboxDLC' test.out

#- 406 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '7O15jqeKssQpme6e' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'M48tE7eJRsXNeveQ' \
    --features 'XqnFRYmEIX40XOUo,LOa7oDz00gxcoaH6,u9TVf4DvEzpoPRiC' \
    --itemId 'lZ6rlwX99AHMLHqg,uYykVWzNwPcvGyie,BsRUduW5lxSlorWE' \
    --limit '66' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 406 'PublicQueryUserEntitlements' test.out

#- 407 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'N5bPGSOSiiItrSrE' \
    --appId 'JMBAIwTLkrMDFQfp' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetUserAppEntitlementByAppId' test.out

#- 408 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q9o0GJMTfqRRaZoz' \
    --limit '79' \
    --offset '43' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 408 'PublicQueryUserEntitlementsByAppType' test.out

#- 409 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kd925u3fFLV0YeMr' \
    --availablePlatformOnly  \
    --ids 'VaYSTRYGFzgLZ7gE,ypQf2Pn9A4gcbDJ0,LmdnOPkIT1C6KGTp' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetUserEntitlementsByIds' test.out

#- 410 PublicGetUserEntitlementByItemId
eval_tap 0 410 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 411 PublicGetUserEntitlementBySku
eval_tap 0 411 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 412 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'A7JZ6xullPROSfiW' \
    --endDate '9zcxmgNfTHu3vkZt' \
    --entitlementClazz 'MEDIA' \
    --limit '65' \
    --offset '13' \
    --startDate 's0sibQNBz81zRPnt' \
    > test.out 2>&1
eval_tap $? 412 'PublicUserEntitlementHistory' test.out

#- 413 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'xpgi7tXIcNEcGJjO' \
    --appIds 'CXpuix5vnPeTu9ev,bRov7Bm40CtZiAxk,43DGV1SCkw8U0d4F' \
    --itemIds 'vVmPMtpRMWSQ8Szi,1IrGidRmR5BGRJhF,wxmkGfPI3j4luXQu' \
    --skus 'uLtYa86kvL6cBZQs,sUUXOsXMNdvW1hbv,GenRbm3QtsY5WaKM' \
    > test.out 2>&1
eval_tap $? 413 'PublicExistsAnyUserActiveEntitlement' test.out

#- 414 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '5YY6pYrmeMIHLS8e' \
    --appId 'gV8XhgDjbrum8Uxc' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 415 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'utmVg8APWKxoj6MF' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId '8VuKDoklYmkytCAH' \
    > test.out 2>&1
eval_tap $? 415 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 416 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '8Jiqe7gfV1G6bYgI' \
    --ids 'bVKp4Kgew2mHDksA,6Mv9Nzs19eBq9a1L,8S1yduOwscICro6P' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 417 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '8FWIPeqaBeD2uBAv' \
    --entitlementClazz 'MEDIA' \
    --sku 'IwQBeIALI8JNIII4' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 418 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'jrzrPsuMziNM8AB7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RRxiZH3ngnitURdM' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetUserEntitlement' test.out

#- 419 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'jZLYCaeklQcFY1QI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'k1h5EKvMGd6hQ2mH' \
    --body '{"options": ["jmLu4oFlReHy0JyZ", "v7honqeiGTTqpgVs", "Y1kPNdJiJXB3yjNU"], "requestId": "PIfvoXRO0CkW1Zcg", "useCount": 96}' \
    > test.out 2>&1
eval_tap $? 419 'PublicConsumeUserEntitlement' test.out

#- 420 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'vYVvrIAEehUV0jsj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AyVgxS54NNs3XdhM' \
    --body '{"requestId": "bQX9D1znEWw9p7g4", "useCount": 96}' \
    > test.out 2>&1
eval_tap $? 420 'PublicSellUserEntitlement' test.out

#- 421 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'Xkf7rQJ4Kj7Qyo9t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UptiyZzRX8Y4rxRW' \
    --body '{"useCount": 24}' \
    > test.out 2>&1
eval_tap $? 421 'PublicSplitUserEntitlement' test.out

#- 422 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'Pe4ZLAQWuBJwxObZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qMGxhffy9cHrLYff' \
    --body '{"entitlementId": "tad99JDcnn7f2d8S", "useCount": 84}' \
    > test.out 2>&1
eval_tap $? 422 'PublicTransferUserEntitlement' test.out

#- 423 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'AwgvxYxXJTduZp1n' \
    --body '{"code": "NYHREmm1cBuaRaGe", "language": "juZJ_FxEt", "region": "bmtK7MTxcCWnMiCL"}' \
    > test.out 2>&1
eval_tap $? 423 'PublicRedeemCode' test.out

#- 424 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'sjroKHPApA8GsGwy' \
    --body '{"excludeOldTransactions": false, "language": "WD_Kaml-365", "productId": "pJWohXn01RB7pu7B", "receiptData": "aONXyE5fIDbsMi48", "region": "xOYVvEcEm53BYMBa", "transactionId": "cQBIuDVs7U0AJtWP"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicFulfillAppleIAPItem' test.out

#- 425 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'RteszMTd0R5Fsrf9' \
    --body '{"epicGamesJwtToken": "xbVfgvG617GmxzCl"}' \
    > test.out 2>&1
eval_tap $? 425 'SyncEpicGamesInventory' test.out

#- 426 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'kR3M6Twpwq3nLwxn' \
    --body '{"autoAck": true, "language": "sKJp", "orderId": "WYVxGQVFJlDDJ7z4", "packageName": "Pb5jyGID39Ung1D5", "productId": "7FjYKlJiRIvhej77", "purchaseTime": 83, "purchaseToken": "llksf6GA8vTt92kl", "region": "dCoyRdiOikUdqGoc"}' \
    > test.out 2>&1
eval_tap $? 426 'PublicFulfillGoogleIAPItem' test.out

#- 427 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'LYBaRC7T5qSl7WN3' \
    > test.out 2>&1
eval_tap $? 427 'SyncOculusConsumableEntitlements' test.out

#- 428 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'ncPkqiTKzz72PKXj' \
    --body '{"currencyCode": "ShM2DvesmMIbiQfa", "price": 0.5438009263610069, "productId": "xl2YUNRLRjgKqSSY", "serviceLabel": 12}' \
    > test.out 2>&1
eval_tap $? 428 'PublicReconcilePlayStationStore' test.out

#- 429 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'depM3ap069B9Okr0' \
    --body '{"currencyCode": "xJ5XRZVoxPGOLVBI", "price": 0.18387353708768817, "productId": "FgTAsXgqx3mfB5Zw", "serviceLabels": [56, 97, 53]}' \
    > test.out 2>&1
eval_tap $? 429 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 430 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'N7NAvZdGuyYEYZE3' \
    --body '{"appId": "KaGSdhEGKcp6g1A8", "currencyCode": "O9N9cbYBK6XOBDpR", "language": "uC-EfPv", "price": 0.23324598337061886, "productId": "j5vygVvLSJvdsGpm", "region": "mUeMikW3s54zffAL", "steamId": "2DZ7gBhy77iRVFfF"}' \
    > test.out 2>&1
eval_tap $? 430 'SyncSteamInventory' test.out

#- 431 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vWenMNV00KVuLF9W' \
    --body '{"gameId": "DnGO3bpQWmnS52Zu", "language": "XVO-sQdx", "region": "rcoXzSOEGEDYfiGP"}' \
    > test.out 2>&1
eval_tap $? 431 'SyncTwitchDropsEntitlement1' test.out

#- 432 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yo2K3dN3YBOJfvV6' \
    --body '{"currencyCode": "SuHovoQlk5wL2oXD", "price": 0.8234491732687824, "productId": "20Bw2H4tz6KUC4jX", "xstsToken": "Gj2G0GZ3JBYi9bBK"}' \
    > test.out 2>&1
eval_tap $? 432 'SyncXboxInventory' test.out

#- 433 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'BRpdbLCiwxOx2XQn' \
    --discounted  \
    --itemId '94xPqXhqeNMDGA3O' \
    --limit '4' \
    --offset '14' \
    --status 'DELETED' \
    > test.out 2>&1
eval_tap $? 433 'PublicQueryUserOrders' test.out

#- 434 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'QAl6U2g9imVMh3i7' \
    --body '{"currencyCode": "j095rDL6lEuB1ZIM", "discountCodes": ["ZnyHKkk6Gh25tEcX", "9GegDnrYz0GFpSVd", "Is1dFvYokH9t2u8Z"], "discountedPrice": 47, "ext": {"nB2LFVrZRrOntm2K": {}, "jbfCOuW3dBmFwUO7": {}, "Y0xhMLwxgRpTSUpp": {}}, "itemId": "vO3QG68KeD7QJQEE", "language": "ybG_554", "price": 74, "quantity": 85, "region": "swQ7vH8GScnP5QzR", "returnUrl": "BY1UrefgmVFBVz4K", "sectionId": "RCU0p4jIt01gzH17"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicCreateUserOrder' test.out

#- 435 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'IcfJyGulmByN5rcD' \
    --body '{"currencyCode": "A3Wcv9ouALjgLZZz", "discountCodes": ["y86BgnBQtm5AilVh", "ASFlYMVJtE2dAeC7", "LU9w8MJRIzIgJKg9"], "discountedPrice": 31, "itemId": "qq0tO15pEVG7sNih", "price": 48, "quantity": 55}' \
    > test.out 2>&1
eval_tap $? 435 'PublicPreviewOrderPrice' test.out

#- 436 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'puuL7DJCxvzZnh8o' \
    --userId 'BAk1MNCAUmdnLaVR' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetUserOrder' test.out

#- 437 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Uu5VbjwPa9rYgHax' \
    --userId 'eTT3ebuaYPNBp9wA' \
    > test.out 2>&1
eval_tap $? 437 'PublicCancelUserOrder' test.out

#- 438 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '4LxO2n7WJQFzBCD9' \
    --userId 'S03D7JLsIM3VOMRv' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserOrderHistories' test.out

#- 439 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'vqkXDMPzOB08tpk0' \
    --userId 'qhZath4b4HtwEYX5' \
    > test.out 2>&1
eval_tap $? 439 'PublicDownloadUserOrderReceipt' test.out

#- 440 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '5pJNTX1sDjSWiSXs' \
    > test.out 2>&1
eval_tap $? 440 'PublicGetPaymentAccounts' test.out

#- 441 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'V5rJ8eZXZ1TLMZnN' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId '3DQK45IAtbyUDDSJ' \
    > test.out 2>&1
eval_tap $? 441 'PublicDeletePaymentAccount' test.out

#- 442 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'SV8pzl1lfIR7jnet' \
    --autoCalcEstimatedPrice  \
    --language 'IJPGObyWCLyFPHax' \
    --region 'kKxEDvSoi2X9Sygv' \
    --storeId 'MG8QAaWUhIguMvKD' \
    --viewId 'Orx0wQXKEroyKz2r' \
    > test.out 2>&1
eval_tap $? 442 'PublicListActiveSections' test.out

#- 443 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'eP63EVHT72VuhoGP' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'IFXGU5hujEfCMt95' \
    --limit '60' \
    --offset '13' \
    --sku 'EjxqhgYqmMqIdlRr' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 443 'PublicQueryUserSubscriptions' test.out

#- 444 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'uILkeRUafUDP5b6B' \
    --body '{"currencyCode": "Wfm7cYCpDIJG42IL", "itemId": "hUoCh8lmKKocC5Ea", "language": "kHOF-GPSh_031", "region": "unXv1iE7YgEZspOJ", "returnUrl": "0NiZl6OVLxKtkBpa", "source": "CG8Nu5m4ctwUNV8n"}' \
    > test.out 2>&1
eval_tap $? 444 'PublicSubscribeSubscription' test.out

#- 445 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'cebaJ0DCuIeEStt3' \
    --itemId 'PbyctX7HC2haQwVW' \
    > test.out 2>&1
eval_tap $? 445 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 446 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ONEpAPedzI2Adlqi' \
    --userId 'yEJIQcbZJJ3AhkrM' \
    > test.out 2>&1
eval_tap $? 446 'PublicGetUserSubscription' test.out

#- 447 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'i0bnppEJFISze88r' \
    --userId 'GEr3cilJWhaW6jNs' \
    > test.out 2>&1
eval_tap $? 447 'PublicChangeSubscriptionBillingAccount' test.out

#- 448 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'M94E2FQb6S0VmaTR' \
    --userId '7E3mkDSQkgVMhLbM' \
    --body '{"immediate": true, "reason": "MnNSKd0KStITvGQt"}' \
    > test.out 2>&1
eval_tap $? 448 'PublicCancelSubscription' test.out

#- 449 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'zwjGtGTr238G8Aev' \
    --userId 'k3k14782W2oNo3X4' \
    --excludeFree  \
    --limit '25' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 449 'PublicGetUserSubscriptionBillingHistories' test.out

#- 450 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId '6wms9SPaHlqtDPry' \
    --language '2vMON7sdhlilfpDT' \
    --storeId '8o2iFrYtGfCZCcrv' \
    > test.out 2>&1
eval_tap $? 450 'PublicListViews' test.out

#- 451 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'sV2I4X26p21iDBZG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'J8ZMLwPJ871nV5AL' \
    > test.out 2>&1
eval_tap $? 451 'PublicGetWallet' test.out

#- 452 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'S7cneNLItUJgh74t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yxkTR8ZCVJtkxjBJ' \
    --limit '35' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 452 'PublicListUserWalletTransactions' test.out

#- 453 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'lfR33jqIRoXcCPaL' \
    --baseAppId 'XJM2B9bMohkWsFKI' \
    --categoryPath 'dycYHQcu7JkKBcLF' \
    --features 'Rf50Y7ME2QmYiYqa' \
    --includeSubCategoryItem  \
    --itemName 'p7masUcayqmp7vhz' \
    --itemStatus 'INACTIVE' \
    --itemType 'EXTENSION,CODE,APP' \
    --limit '22' \
    --offset '92' \
    --region 'dAbdOT6iSRdEg8NY' \
    --sectionExclusive  \
    --sortBy 'createdAt:desc,displayOrder:asc,name' \
    --storeId 'gfI1AeYHe8WPQGPc' \
    --tags 'lChxLfbXrH6f2GDr' \
    --targetNamespace 'NbLOjGz34ct0ctEe' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 453 'QueryItemsV2' test.out

#- 454 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'H43wYuLnI7cTzIUE' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 454 'ImportStore1' test.out

#- 455 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RPlQI99hMc4NbiJW' \
    --body '{"itemIds": ["P5r9EwbIGMGJ70P9", "IqAyNlZ2OwFSebBk", "XkaxtY97TMJH8bO4"]}' \
    > test.out 2>&1
eval_tap $? 455 'ExportStore1' test.out

#- 456 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GDHT6ZaUUkvlTKAh' \
    --body '{"entitlementCollectionId": "rxqHw7f813qNjzlc", "entitlementOrigin": "Playstation", "metadata": {"ZGnNa5yOM68r4W1f": {}, "DZL80oPQ0s7QhC8h": {}, "gSgytNEojK3YgWH9": {}}, "origin": "IOS", "rewards": [{"currency": {"currencyCode": "7qjDHMS49dkv8vxy", "namespace": "g6giNKzeFnlgGRgY"}, "item": {"itemId": "K3SeYvULYNIhs5PZ", "itemSku": "GTJmgofq7nlF5Ch8", "itemType": "J2Qs990APOU4hcdw"}, "quantity": 23, "type": "CURRENCY"}, {"currency": {"currencyCode": "TGLtX6TN5ctYX1sZ", "namespace": "nYF3hWmCCIrP0lJX"}, "item": {"itemId": "exseo2e6BCNJTTRI", "itemSku": "HDKdVfOUr14yZH00", "itemType": "n8MsRjaB8iurBWW5"}, "quantity": 19, "type": "ITEM"}, {"currency": {"currencyCode": "SJi0seeGJIqnatME", "namespace": "8GnNWfAY1yY6D1Eu"}, "item": {"itemId": "usf0eOzoSyKttYwU", "itemSku": "UlMRG8vO0OSsJmhO", "itemType": "JDUyyag9jBDJFJGO"}, "quantity": 62, "type": "CURRENCY"}], "source": "IAP_CHARGEBACK_REVERSED", "transactionId": "J8cLrryS5a6A4tL8"}' \
    > test.out 2>&1
eval_tap $? 456 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE