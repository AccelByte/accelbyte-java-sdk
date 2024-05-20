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
echo "1..449"

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
    --body '{"entitlementGrantList": [{"collectionId": "N86Hl8kUXzt6bSc6", "endDate": "1971-06-25T00:00:00Z", "grantedCode": "WvgpVyW9dD1kOmvr", "itemId": "Aejcq2LgkQuaS7RB", "itemNamespace": "x3vim02jBOxrZDyv", "language": "RCX-nmpJ_zA", "origin": "Steam", "quantity": 36, "region": "ok4nOOCzfsflhjbn", "source": "GIFT", "startDate": "1974-10-17T00:00:00Z", "storeId": "vyH8paOJtxqMPpcV"}, {"collectionId": "fRwNj547fH0XrKED", "endDate": "1978-02-25T00:00:00Z", "grantedCode": "EY8VnocGAjci0V3t", "itemId": "Bf2jnHGKXphn50c9", "itemNamespace": "tNLDljhZ2jxLRX3z", "language": "Gqcd-nK", "origin": "GooglePlay", "quantity": 4, "region": "PlNos4yBRjrERHEo", "source": "OTHER", "startDate": "1987-08-05T00:00:00Z", "storeId": "H1XEfY6QAYn6WQ5U"}, {"collectionId": "BEU1QAOHfZiGhxOd", "endDate": "1972-07-18T00:00:00Z", "grantedCode": "uDXSxSc3aZPV87pn", "itemId": "a08gxefTYKhuxaEc", "itemNamespace": "7M4P7UckSC6ePeN8", "language": "eT-Vtsa-688", "origin": "Oculus", "quantity": 54, "region": "7c53q7akMpcmnnx6", "source": "PURCHASE", "startDate": "1995-01-23T00:00:00Z", "storeId": "Brop9v7aZK3h65hb"}], "userIds": ["N0OcNDLr36vzohZy", "jMQAg5mPYhrLTyU8", "N15zfQSfQrtfF3TQ"]}' \
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
    --body '{"appId": "Nxw0v1dMQ9Rrbk6C", "appType": "DEMO", "baseAppId": "0XIZRW491e94mQjV", "boothName": "OOBnIWhunElqZUod", "categoryPath": "p3IhtCSHy1ei1fIr", "clazz": "PvfHnRN06EjRwEQl", "displayOrder": 81, "entitlementType": "DURABLE", "ext": {"apJRfk4f9Zcw1pEH": {}, "AyNFxcVTKuAQTGh5": {}, "BxjWOozGoDtsUuYo": {}}, "features": ["AHwF3vGoav7MK0Pc", "zfjv9oYMXMjlVHY1", "5p8ED5QZAufwNa8l"], "flexible": false, "images": [{"as": "4mUHVbMPimNhcZsU", "caption": "3VAdMDcb4qlkiFAa", "height": 26, "imageUrl": "GlElXdEAOrVSnLoc", "smallImageUrl": "LVVYamQc4wcG5nDB", "width": 78}, {"as": "pWjmHZAAvKTH8Muq", "caption": "Ig0CzkguwuJCW7EE", "height": 65, "imageUrl": "SvNDlmM5nQFMGzs7", "smallImageUrl": "fzjgyc44mEh9tRk8", "width": 21}, {"as": "4XgBsbfzqxBPNe8a", "caption": "e1Il4aAtEbu4IjGd", "height": 33, "imageUrl": "GAbpEmDY9vLh3u6E", "smallImageUrl": "DsUmrV6kH4OotKwG", "width": 95}], "inventoryConfig": {"customAttributes": {"3dIjvBbA6bfbYaJC": {}, "Jjfk2TUvn95FhO7V": {}, "W3mbDVMDu87t0ldW": {}}, "serverCustomAttributes": {"f7iSGIiKFtWtn4Yr": {}, "2svKM6pqLGZ0TBuj": {}, "ELAUK6mQ5iZgbwwm": {}}, "slotUsed": 4}, "itemIds": ["iGzXtcknrgidKupv", "XO6aj4hCmTC34jxW", "4pIDwdqXpmRmut9H"], "itemQty": {"9XyWI8bp8fQxRuX9": 41, "CBgVRyihYNZ84CVh": 51, "RL1rEQG02zccA8wv": 76}, "itemType": "EXTENSION", "listable": true, "localizations": {"WUNd6lPKvqDejvqk": {"description": "lTSvDwuOrP9lzpiX", "localExt": {"0VuFpZum7izxe7NP": {}, "zjOa8E7wY76PxLv9": {}, "HBEUe89AwEw1HO4F": {}}, "longDescription": "nKtx4XLKAmlDr19u", "title": "J3nq6VerzVCcI8y3"}, "Cz0YqCKUh5RD9vNA": {"description": "p4jinFpnQ5xF9wwb", "localExt": {"vMZyeDeRnVfPUa6x": {}, "VVBcq3wZpFIYeAg7": {}, "9HcLJXJ7mpVI6eTY": {}}, "longDescription": "AjdPlCiQQC35cj4K", "title": "yOVgvnWbfRJtsB7c"}, "UQZ2QUAxJrINPXpp": {"description": "PNO3AfmXcgwC3IN6", "localExt": {"tvKgLB9QmJIOq9dP": {}, "5szG71utjsQ4CrRb": {}, "9gUCeVz7fWbZIdhe": {}}, "longDescription": "vfZvyV7AcodcZwKj", "title": "YDdmJOlzwm9Su4Fn"}}, "lootBoxConfig": {"rewardCount": 92, "rewards": [{"lootBoxItems": [{"count": 83, "duration": 66, "endDate": "1993-03-10T00:00:00Z", "itemId": "qftSjq7sn8yreciP", "itemSku": "LfkVyyJsbGpO6Jge", "itemType": "hDJxEN7JlZc8LMq1"}, {"count": 30, "duration": 69, "endDate": "1999-09-22T00:00:00Z", "itemId": "jZWu4yA3r0u4q1bT", "itemSku": "HXIjfJKyFlM0u1uu", "itemType": "oVdn9yVoSlKNchPH"}, {"count": 82, "duration": 19, "endDate": "1990-07-24T00:00:00Z", "itemId": "4X3LLaGPGdqLE8So", "itemSku": "hhhuiTnJarYYkHBD", "itemType": "dSzBXdxapwhd5IQY"}], "name": "BQuxLvPuWYvE3fsN", "odds": 0.3898038189193449, "type": "REWARD_GROUP", "weight": 25}, {"lootBoxItems": [{"count": 83, "duration": 32, "endDate": "1974-07-12T00:00:00Z", "itemId": "9X3fUSR1l9xLPBsm", "itemSku": "AUrD9L1IiD6MlcEP", "itemType": "hMDFzjHZ3sIhzOx2"}, {"count": 59, "duration": 53, "endDate": "1989-02-19T00:00:00Z", "itemId": "lvIomU3pIxM9n8D2", "itemSku": "eLMe3lt9qfx2UDcg", "itemType": "VE7L9FK6e0MrPc4v"}, {"count": 40, "duration": 44, "endDate": "1983-11-18T00:00:00Z", "itemId": "k9hVKlG56HlzGr7X", "itemSku": "jdyRJunZPkp6ccIB", "itemType": "nWyPw8mj7gyQ7XdI"}], "name": "szGRj46COPipH1MW", "odds": 0.7709233918009739, "type": "REWARD_GROUP", "weight": 34}, {"lootBoxItems": [{"count": 69, "duration": 56, "endDate": "1987-12-05T00:00:00Z", "itemId": "0qHJCWEfOJpZm9yE", "itemSku": "YWNGMy2pgSGSUOK6", "itemType": "8eqGJtWf1Ybgg8rd"}, {"count": 45, "duration": 0, "endDate": "1997-02-09T00:00:00Z", "itemId": "9bmrvHmO07KNqX9L", "itemSku": "M2IwEsdOGBXBwnzD", "itemType": "X8v3xgC1Ge9PdbTT"}, {"count": 54, "duration": 17, "endDate": "1989-12-19T00:00:00Z", "itemId": "Gp1r0sVZ6LJAOddI", "itemSku": "L2l3hPjNDKv2LWfX", "itemType": "qjr8fS79En3wYowB"}], "name": "dkaZ3y6i38XQjLDR", "odds": 0.25838317705549696, "type": "PROBABILITY_GROUP", "weight": 48}], "rollFunction": "CUSTOM"}, "maxCount": 19, "maxCountPerUser": 18, "name": "1LyEirURERnEMzpI", "optionBoxConfig": {"boxItems": [{"count": 26, "duration": 99, "endDate": "1996-04-20T00:00:00Z", "itemId": "6sjAHyCK5tNanGBr", "itemSku": "kzUvck3xTtmOFMeb", "itemType": "S4AdlNzwog2IhErk"}, {"count": 81, "duration": 15, "endDate": "1974-11-19T00:00:00Z", "itemId": "gUoj8u2WRcLiEtzV", "itemSku": "lnkflfn7pHY48F1d", "itemType": "l1q92m3iRlfnBAk0"}, {"count": 58, "duration": 34, "endDate": "1982-01-20T00:00:00Z", "itemId": "iAsR65yQ9ssuHdGm", "itemSku": "xncCEr0KcgeqzGbr", "itemType": "uNB72HHMkjzyBB4U"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 1, "fixedTrialCycles": 78, "graceDays": 29}, "regionData": {"AugK5kypNrp2nFe9": [{"currencyCode": "FmN86sK5LOq4ft5j", "currencyNamespace": "GcMICPUYnfG6jl9U", "currencyType": "VIRTUAL", "discountAmount": 19, "discountExpireAt": "1973-12-24T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1973-05-13T00:00:00Z", "expireAt": "1980-11-02T00:00:00Z", "price": 9, "purchaseAt": "1990-10-05T00:00:00Z", "trialPrice": 89}, {"currencyCode": "MgzISomCsodJrhQW", "currencyNamespace": "41q2OspCZbt3Uta5", "currencyType": "VIRTUAL", "discountAmount": 9, "discountExpireAt": "1981-04-20T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1971-01-25T00:00:00Z", "expireAt": "1985-11-05T00:00:00Z", "price": 59, "purchaseAt": "1976-05-11T00:00:00Z", "trialPrice": 29}, {"currencyCode": "hgMweexsIAP5vHLj", "currencyNamespace": "BJ9iqMcBL4BzhDUj", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1989-11-19T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1988-06-30T00:00:00Z", "expireAt": "1977-01-11T00:00:00Z", "price": 60, "purchaseAt": "1982-08-14T00:00:00Z", "trialPrice": 5}], "yhnoluO6ti0QP2ss": [{"currencyCode": "iJ66OzOj84O6tgoh", "currencyNamespace": "jtC7bzjPpucddXJ5", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1975-06-13T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1977-09-17T00:00:00Z", "expireAt": "1979-07-17T00:00:00Z", "price": 48, "purchaseAt": "1979-09-09T00:00:00Z", "trialPrice": 1}, {"currencyCode": "BYtzB0B4CxyQrUpI", "currencyNamespace": "FvORxTi79DpSjb39", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1976-01-19T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1974-07-10T00:00:00Z", "expireAt": "1972-01-21T00:00:00Z", "price": 73, "purchaseAt": "1986-09-13T00:00:00Z", "trialPrice": 36}, {"currencyCode": "nemn7M23SzUo4hNB", "currencyNamespace": "Dh9ZFP1OW0nXOErQ", "currencyType": "VIRTUAL", "discountAmount": 91, "discountExpireAt": "1993-11-20T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1979-05-31T00:00:00Z", "expireAt": "1993-11-07T00:00:00Z", "price": 30, "purchaseAt": "1976-10-14T00:00:00Z", "trialPrice": 26}], "K69yg9ADCGiXaLs2": [{"currencyCode": "xjHkinOD975nARHC", "currencyNamespace": "mhNHSXuqIHsxvaUo", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1977-07-07T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1982-03-03T00:00:00Z", "expireAt": "1980-06-15T00:00:00Z", "price": 28, "purchaseAt": "1976-03-18T00:00:00Z", "trialPrice": 47}, {"currencyCode": "N6wKZGW4y3f0R9s2", "currencyNamespace": "kndhhZhwAiLsZs4p", "currencyType": "REAL", "discountAmount": 91, "discountExpireAt": "1990-08-28T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1993-01-27T00:00:00Z", "expireAt": "1972-09-26T00:00:00Z", "price": 15, "purchaseAt": "1987-10-19T00:00:00Z", "trialPrice": 71}, {"currencyCode": "wJ00UH197MJ6zU7J", "currencyNamespace": "LMQyMWzYQCAaPJgo", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1996-10-16T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1978-10-11T00:00:00Z", "expireAt": "1989-01-18T00:00:00Z", "price": 0, "purchaseAt": "1993-07-25T00:00:00Z", "trialPrice": 96}]}, "saleConfig": {"currencyCode": "ImqK6tVsaUq3stUh", "price": 82}, "seasonType": "TIER", "sectionExclusive": false, "sellable": true, "sku": "NVIs7NRen2Y3Ns0Q", "stackable": true, "status": "ACTIVE", "tags": ["JUbUJRMbkcTglbU8", "eaWytPfds1BYx0Ea", "URydf8ZyyZeHAWGg"], "targetCurrencyCode": "6FyOjApNHBVfNOUR", "targetNamespace": "cjY3YYT9oTynmfIu", "thumbnailUrl": "BWgJTNFfM8M0IW4o", "useCount": 9}' \
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
    --sortBy 'displayOrder:asc,displayOrder,createdAt:asc' \
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
    --sortBy 'name:asc,displayOrder' \
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
    --body '{"appId": "9DkaSOWgtg8yw8lH", "appType": "SOFTWARE", "baseAppId": "qJqzoKMRMG541PAi", "boothName": "NjULsx4SnKNXLMUa", "categoryPath": "DSwwQlnNRZJHBSB4", "clazz": "fZWEFIZs28Ff1kZp", "displayOrder": 44, "entitlementType": "CONSUMABLE", "ext": {"ktx3N7WNMYIfcDKb": {}, "Lu8pnK34oA1keYXJ": {}, "vtggDdXjbdjMBahF": {}}, "features": ["z1eI7Q5pu9PutLf6", "BJ9Sgl7H1sdH2RIJ", "ZZGMTcqnWrIprOv0"], "flexible": false, "images": [{"as": "rvZoBGQbO4S3rURG", "caption": "WUzPAE6SdV4D5jft", "height": 89, "imageUrl": "2FI3vyyqRzc20O7F", "smallImageUrl": "dsJP1G9tyBTfERXd", "width": 44}, {"as": "MYDUTLBeCidXjuGg", "caption": "x8ncXejmeZtzT0qj", "height": 59, "imageUrl": "ltsqfiZrthVvyX0O", "smallImageUrl": "CKDJE3RMUddwSSgx", "width": 58}, {"as": "R3hCGNgaJmuALlMQ", "caption": "l9RLrthbfp0VgweL", "height": 24, "imageUrl": "oNB6hI6IpGcToWgF", "smallImageUrl": "vdRhG9NwV3zDuqVl", "width": 98}], "inventoryConfig": {"customAttributes": {"vJrBCqeg67d4RWOq": {}, "O4U0bitNQLzwRoWn": {}, "R0AbkCPY70FmvviV": {}}, "serverCustomAttributes": {"IBbcujF8Vk5qb8Nh": {}, "WWwaxyMchkt8l5IP": {}, "SrwrJl7wYIVw13NC": {}}, "slotUsed": 29}, "itemIds": ["l4F9G6Dl5TFwBY6H", "KXAblkT8VGgSH8MG", "ZGwiVj7eDTaka9AB"], "itemQty": {"fX1IByPEOuPhGspR": 17, "3b6o5uB2XM6IHy7E": 63, "cubN4AUUPFPscZsX": 8}, "itemType": "SEASON", "listable": false, "localizations": {"D4DMtqfIGiGJovgW": {"description": "SRxZ8N4UQ2fg3V1o", "localExt": {"2x0hL5DuBDqMyIAz": {}, "Wze94MEdJFAy2JTl": {}, "lJkRGB8jqJEd6eqq": {}}, "longDescription": "sBVyONV0JRtozI0j", "title": "pliCFQ6WgJpGPigd"}, "c5VyC4qvWjVac1cQ": {"description": "vSxgTNIUzxDgBlIb", "localExt": {"uzm7DzJ20NFRJIhF": {}, "XR2dYprPmbpuptEC": {}, "Gd5cdXC2Sesc6y68": {}}, "longDescription": "whNBYl9iCqfW6rqG", "title": "OQny4ij4ysYPonb5"}, "9gQffkNOmubxEJr2": {"description": "qEAuJbpZSrcbc4LW", "localExt": {"fKaY5c1tP5TDuI5f": {}, "6m4KC07CnsZe32hq": {}, "EcB1ExYMBb3ckvoa": {}}, "longDescription": "JYdMqGegcg3eRvBZ", "title": "XN3cjIXmFWRJnj8x"}}, "lootBoxConfig": {"rewardCount": 82, "rewards": [{"lootBoxItems": [{"count": 81, "duration": 27, "endDate": "1988-08-27T00:00:00Z", "itemId": "a6Zuxk6u6HXXdiC9", "itemSku": "ZDj4E4mv12FNXypo", "itemType": "OLl13j84P0KqirJ4"}, {"count": 86, "duration": 14, "endDate": "1976-11-13T00:00:00Z", "itemId": "eUYcYJ4QzXCmqr6g", "itemSku": "mPGaHP5SVPvRLiDi", "itemType": "0mNHb6Lx8eq8SGNw"}, {"count": 62, "duration": 62, "endDate": "1992-11-25T00:00:00Z", "itemId": "eRj17xGhaBKoUfiH", "itemSku": "jGmCyPsKCJTv1ic9", "itemType": "gvagF2cSuztsJ5tj"}], "name": "64gV7nmDk29mcjSu", "odds": 0.40713130669594944, "type": "PROBABILITY_GROUP", "weight": 45}, {"lootBoxItems": [{"count": 85, "duration": 3, "endDate": "1991-12-03T00:00:00Z", "itemId": "StqPtQmQN6eKAGiZ", "itemSku": "FCftT0RWECdjWYrn", "itemType": "ulxcCKAru8pOaAVL"}, {"count": 59, "duration": 85, "endDate": "1985-04-27T00:00:00Z", "itemId": "4k3JwkdaxR7GJpYm", "itemSku": "uYCPG181q9GA5Dyd", "itemType": "C2D8UT6KOc4VPDUR"}, {"count": 45, "duration": 0, "endDate": "1979-07-19T00:00:00Z", "itemId": "JligLlRxOelKykIC", "itemSku": "RxF6HtlER2txs4qr", "itemType": "NARATn6KXOutlYBb"}], "name": "LhL8KXx25FZfQIod", "odds": 0.7643235281614817, "type": "REWARD", "weight": 45}, {"lootBoxItems": [{"count": 34, "duration": 79, "endDate": "1992-02-07T00:00:00Z", "itemId": "sBpCJBIXLGYcwWVR", "itemSku": "K6UKk5ozrXA4HZHN", "itemType": "yq9odanhR1Zrm3th"}, {"count": 95, "duration": 1, "endDate": "1982-06-14T00:00:00Z", "itemId": "V87yfkycLSVdleSa", "itemSku": "AylsmLYe2phYOgT5", "itemType": "kDTyPl3dKF7NXEjr"}, {"count": 74, "duration": 79, "endDate": "1995-03-23T00:00:00Z", "itemId": "OHGwbADMfuOmh0lc", "itemSku": "iRhVZ2DeoODXMzLS", "itemType": "rzoiBnYi5UWs3tYl"}], "name": "YeMoCimJySocRvUW", "odds": 0.4684644644629602, "type": "REWARD_GROUP", "weight": 37}], "rollFunction": "CUSTOM"}, "maxCount": 65, "maxCountPerUser": 85, "name": "ZKPNoN9AWtLK9TFg", "optionBoxConfig": {"boxItems": [{"count": 16, "duration": 6, "endDate": "1984-03-14T00:00:00Z", "itemId": "oijBPAp6EPb988Nz", "itemSku": "xrDKVpULjjiw3NeV", "itemType": "G4DJi9DaMrc0WFgK"}, {"count": 18, "duration": 63, "endDate": "1993-12-24T00:00:00Z", "itemId": "5x2CPVYYG9WvoGmA", "itemSku": "mvaVV5YfxnUNcwjr", "itemType": "7gSGhnfuF4WZiQVI"}, {"count": 59, "duration": 8, "endDate": "1995-12-19T00:00:00Z", "itemId": "pWd3UM08gMXhdf3j", "itemSku": "uXW4JprIb3CJCAtv", "itemType": "SG8Cfa9dzOJDGCTH"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 20, "fixedTrialCycles": 60, "graceDays": 10}, "regionData": {"xeR6d7r1SQw80JfM": [{"currencyCode": "pPrSqYypRUnq5o4E", "currencyNamespace": "TeCUYG9ccTt7Wxw8", "currencyType": "VIRTUAL", "discountAmount": 51, "discountExpireAt": "1981-12-07T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1981-01-17T00:00:00Z", "expireAt": "1994-07-25T00:00:00Z", "price": 46, "purchaseAt": "1993-05-04T00:00:00Z", "trialPrice": 53}, {"currencyCode": "dk0HATGylx2JG2KN", "currencyNamespace": "GfhzfCTxxrsRRLee", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1988-10-17T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1978-08-29T00:00:00Z", "expireAt": "1996-12-08T00:00:00Z", "price": 67, "purchaseAt": "1988-01-27T00:00:00Z", "trialPrice": 18}, {"currencyCode": "YohxMp3uOQIybqWf", "currencyNamespace": "G9BJ6FVKlbYHtbPt", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1981-01-08T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1991-02-19T00:00:00Z", "expireAt": "1982-12-28T00:00:00Z", "price": 42, "purchaseAt": "1976-02-19T00:00:00Z", "trialPrice": 31}], "FDa6wUQvehKqwCh8": [{"currencyCode": "6XmRkCEcfHDCdl59", "currencyNamespace": "Wp9A3tXGve6DdK6u", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1986-06-09T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1991-05-01T00:00:00Z", "expireAt": "1972-10-15T00:00:00Z", "price": 29, "purchaseAt": "1985-02-27T00:00:00Z", "trialPrice": 50}, {"currencyCode": "zBw3xLUcCEt0Dzmk", "currencyNamespace": "Jq1sml5bYt76BNsi", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1987-03-11T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1993-03-31T00:00:00Z", "expireAt": "1971-01-24T00:00:00Z", "price": 61, "purchaseAt": "1985-01-30T00:00:00Z", "trialPrice": 32}, {"currencyCode": "Fe8ATUqVxcSthrpn", "currencyNamespace": "MUBsnUfuQIcSbUt5", "currencyType": "REAL", "discountAmount": 67, "discountExpireAt": "1982-03-24T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1988-03-22T00:00:00Z", "expireAt": "1977-09-21T00:00:00Z", "price": 66, "purchaseAt": "1992-05-04T00:00:00Z", "trialPrice": 27}], "uUsdtq4dOwNESzCE": [{"currencyCode": "W9dUVhZjLftC3sCS", "currencyNamespace": "8CpLCqPD9CeDEdCn", "currencyType": "REAL", "discountAmount": 97, "discountExpireAt": "1990-09-13T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1975-06-10T00:00:00Z", "expireAt": "1998-08-12T00:00:00Z", "price": 1, "purchaseAt": "1976-09-17T00:00:00Z", "trialPrice": 19}, {"currencyCode": "r8CDapjwNOl4k8rV", "currencyNamespace": "Nrm8drv8QD2JOe2N", "currencyType": "VIRTUAL", "discountAmount": 92, "discountExpireAt": "1984-05-25T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1986-09-11T00:00:00Z", "expireAt": "1985-06-23T00:00:00Z", "price": 12, "purchaseAt": "1978-07-04T00:00:00Z", "trialPrice": 91}, {"currencyCode": "PgIGuetxFMqXCQMA", "currencyNamespace": "qQ2ZRGzNtrThFa9X", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1977-04-26T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1980-11-14T00:00:00Z", "expireAt": "1977-11-13T00:00:00Z", "price": 41, "purchaseAt": "1975-10-06T00:00:00Z", "trialPrice": 100}]}, "saleConfig": {"currencyCode": "ZJ7O8sAQ32wj9uaD", "price": 53}, "seasonType": "TIER", "sectionExclusive": true, "sellable": true, "sku": "qs2mqtnGAqXUjNyp", "stackable": true, "status": "INACTIVE", "tags": ["oViPeIB4Ehy0Y5aS", "JEhxPGbEk7s7gw07", "FlounC3vJKBC7Swg"], "targetCurrencyCode": "JVDginxAM77eY9C1", "targetNamespace": "4FbfiI2NPvl1kCY5", "thumbnailUrl": "bEokxXxkWZbjf7GZ", "useCount": 48}' \
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
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 80, "comparison": "is", "name": "SoVEBG7VbBPUWipz", "predicateType": "SeasonPassPredicate", "value": "DYkD2sIllFtBtXJK", "values": ["RUbUDSiefGEdLucr", "tO2gCQD057DrDlgC", "G3rqBmILhtWm8RQv"]}, {"anyOf": 80, "comparison": "isGreaterThan", "name": "iBKohow3kKoaP1K4", "predicateType": "SeasonPassPredicate", "value": "JRHcn7KaoCEkRdo6", "values": ["qHYIZWnXqQ1oHFJ9", "Q0vqsL9SomqWsGA7", "6yxi0QzZWfmP2sx0"]}, {"anyOf": 76, "comparison": "excludes", "name": "eHv0L2Acm960EYQE", "predicateType": "SeasonPassPredicate", "value": "BrShGbIIuqK8C403", "values": ["k8T4QHK30EX0Fclp", "Dl5HsuracO5Mnjnx", "HgoXCR6XOMXwKdfq"]}]}, {"operator": "or", "predicates": [{"anyOf": 44, "comparison": "isLessThanOrEqual", "name": "kxShFVQTRekLfjmy", "predicateType": "SeasonTierPredicate", "value": "zosRCRgVwbrQKmb0", "values": ["1yA7U7dGMjupZkZQ", "Y8CNyT4k3DIbfT22", "G5NpE130YWSgxpKW"]}, {"anyOf": 40, "comparison": "excludes", "name": "Q6ZXQcb2o1J5euLA", "predicateType": "EntitlementPredicate", "value": "vXZV3ig8Jg5VByeI", "values": ["3ycMcYYBixKJXCIS", "74KVo6Xqjz2xUKLN", "Qdwec1m8BusV9tUh"]}, {"anyOf": 100, "comparison": "isGreaterThanOrEqual", "name": "mYyVvyelIJ8QgaLM", "predicateType": "SeasonPassPredicate", "value": "XvfQgQDt6ce8NDME", "values": ["OTCbx7J3gNLIlTk3", "rA82FrR1GSogkewI", "zTOqKkcjRh3l2gAJ"]}]}, {"operator": "or", "predicates": [{"anyOf": 76, "comparison": "isGreaterThanOrEqual", "name": "mSZns5owBhoUg4Ls", "predicateType": "SeasonTierPredicate", "value": "EAHQpBOgHEP5l94s", "values": ["yB7FTexsOZ0b2p3b", "7CbIJ7eHnVWOboMk", "63KrcwIcXMhGy83X"]}, {"anyOf": 18, "comparison": "isLessThan", "name": "9alq3hK1G4kKooSN", "predicateType": "SeasonTierPredicate", "value": "PQ9HkSSV8e1MgTTL", "values": ["S2FgarY903INGIyE", "fRBEj7qms9AGQExP", "hgr9gGfC0GjvpgJf"]}, {"anyOf": 41, "comparison": "isNot", "name": "VDlvSc0Mr7ImwCwG", "predicateType": "SeasonPassPredicate", "value": "ToOnq9U5lyW89Xwt", "values": ["zWTqgYPixtHk6lWq", "6tEeUmU96FLEak0m", "3wmRTrDCjhnKvsHe"]}]}]}}' \
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

#- 149 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'X6gmDfNfPGYYSTun' \
    --externalId 'Mgt3C8hEguCqlMHi' \
    --limit '87' \
    --notificationSource 'XSOLLA' \
    --notificationType 'N3HWJw9zIWsiP2JQ' \
    --offset '24' \
    --paymentOrderNo 'l07jPlcYaqYM7YfB' \
    --startDate 'mhjI9Y28qVceS9UX' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 149 'QueryPaymentNotifications' test.out

#- 150 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'dKPCFUIeyYEymNXz' \
    --limit '81' \
    --offset '50' \
    --status 'REQUEST_FOR_INFORMATION' \
    > test.out 2>&1
eval_tap $? 150 'QueryPaymentOrders' test.out

#- 151 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "tb3c8pVZ8GlU8962", "currencyNamespace": "e6gtn5pUARJM1T8Q", "customParameters": {"wMNOAzXmyHEV4g9P": {}, "6a280S5RNB5dVCsB": {}, "7xL4axSPgPCiwLxC": {}}, "description": "FLDixZwVtt3RVTl0", "extOrderNo": "tR00oQgcHdGGK3x7", "extUserId": "6U1EIcklttmrpgF5", "itemType": "EXTENSION", "language": "sLx_124", "metadata": {"3XrYZUiN24ol1qqb": "algizL97ycJV5YqE", "2myQzl7X9fHr6WvB": "xmBvNj3ktaDf9B22", "HGgxakPt7IYzaZUT": "mvsEzLPnnGsnfmBe"}, "notifyUrl": "rp84qjwzWpCF1vya", "omitNotification": false, "platform": "APzfzXDELJFaIaEM", "price": 100, "recurringPaymentOrderNo": "8LaQzEb39sZTdFfC", "region": "8x5aHLsXHlm1RJTT", "returnUrl": "y9JrNz1K5M1qgFdd", "sandbox": true, "sku": "9xk3sFl0cbuCRM69", "subscriptionId": "XKkLwioRaKnWhlh8", "targetNamespace": "0BhYe2fJDS6T75Q4", "targetUserId": "ulonMFjmYqE1wJhf", "title": "ogWg2Apm0sUy18aW"}' \
    > test.out 2>&1
eval_tap $? 151 'CreatePaymentOrderByDedicated' test.out

#- 152 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'n65Co0vdCk8so6JS' \
    > test.out 2>&1
eval_tap $? 152 'ListExtOrderNoByExtTxId' test.out

#- 153 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'aZAIadKDEZywonA2' \
    > test.out 2>&1
eval_tap $? 153 'GetPaymentOrder' test.out

#- 154 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'SrEdN2tmGuX6r0gB' \
    --body '{"extTxId": "VUUeKKlPKtE6gnYx", "paymentMethod": "mkmCWbs5qugklBUS", "paymentProvider": "PAYPAL"}' \
    > test.out 2>&1
eval_tap $? 154 'ChargePaymentOrder' test.out

#- 155 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'uwWrCQt86Jrg8tLA' \
    --body '{"description": "JWpcyNkUvqn6eXr6"}' \
    > test.out 2>&1
eval_tap $? 155 'RefundPaymentOrderByDedicated' test.out

#- 156 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'FNbKJ05Orya6LSSU' \
    --body '{"amount": 24, "currencyCode": "XycuQNGIDeHlf6Ic", "notifyType": "REFUND", "paymentProvider": "CHECKOUT", "salesTax": 73, "vat": 60}' \
    > test.out 2>&1
eval_tap $? 156 'SimulatePaymentOrderNotification' test.out

#- 157 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'rK6Or2xx7rLwrPoW' \
    > test.out 2>&1
eval_tap $? 157 'GetPaymentOrderChargeStatus' test.out

#- 158 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 158 'GetPlatformEntitlementConfig' test.out

#- 159 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    --body '{"allowedPlatformOrigins": ["Playstation", "Oculus", "Other"]}' \
    > test.out 2>&1
eval_tap $? 159 'UpdatePlatformEntitlementConfig' test.out

#- 160 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    > test.out 2>&1
eval_tap $? 160 'GetPlatformWalletConfig' test.out

#- 161 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedBalanceOrigins": ["Playstation", "Nintendo", "Other"]}' \
    > test.out 2>&1
eval_tap $? 161 'UpdatePlatformWalletConfig' test.out

#- 162 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 162 'ResetPlatformWalletConfig' test.out

#- 163 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 163 'GetRevocationConfig' test.out

#- 164 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": false, "strategy": "ALWAYS_REVOKE"}}' \
    > test.out 2>&1
eval_tap $? 164 'UpdateRevocationConfig' test.out

#- 165 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 165 'DeleteRevocationConfig' test.out

#- 166 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'QUnYoID2UqO0iAXA' \
    --limit '23' \
    --offset '6' \
    --source 'ORDER' \
    --startTime 'B4ib8HDOJ8TNiP8K' \
    --status 'FAIL' \
    --transactionId 'OXvGSrdkqddI3ezq' \
    --userId 'u6FB0sL2xt6fX9j7' \
    > test.out 2>&1
eval_tap $? 166 'QueryRevocationHistories' test.out

#- 167 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'GetRevocationPluginConfig' test.out

#- 168 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "rhZCAlDlVKBsLZiB"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "szE7CL1cQCSoqHvH"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 168 'UpdateRevocationPluginConfig' test.out

#- 169 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 169 'DeleteRevocationPluginConfig' test.out

#- 170 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 170 'UploadRevocationPluginConfigCert' test.out

#- 171 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "g63cOx6yrIw37pKO", "eventTopic": "LrF5i3gr3Cc4M2O7", "maxAwarded": 82, "maxAwardedPerUser": 14, "namespaceExpression": "rTQO7KLdZDGwqx7T", "rewardCode": "3l1ut2oyolliYsTJ", "rewardConditions": [{"condition": "UmpscwLcUml3KuoM", "conditionName": "Kh7tprnacA34xmIO", "eventName": "jFLgKR4LjEWhOScv", "rewardItems": [{"duration": 40, "endDate": "1979-12-17T00:00:00Z", "identityType": "ITEM_ID", "itemId": "92iD02YMvEUNfoL7", "quantity": 74, "sku": "ZwFGpea5ObBB49Km"}, {"duration": 86, "endDate": "1985-02-06T00:00:00Z", "identityType": "ITEM_ID", "itemId": "kTsQxMTfaSot7aoh", "quantity": 65, "sku": "qZ2yfrC1V7ZpJZPH"}, {"duration": 59, "endDate": "1990-06-20T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "BGQAeh0VTiTP4PSr", "quantity": 75, "sku": "US6jYI9lsQFD43Df"}]}, {"condition": "5qUZOFzpFd6b5Jc5", "conditionName": "TETHcup8GG0VCMTF", "eventName": "J6svTyo9RHget5hz", "rewardItems": [{"duration": 56, "endDate": "1994-08-12T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "RPGV9n769zLJdKMe", "quantity": 48, "sku": "DgDAtqE3kuybwTQF"}, {"duration": 75, "endDate": "1986-02-16T00:00:00Z", "identityType": "ITEM_ID", "itemId": "NA4cGUaDfy9XnH2r", "quantity": 8, "sku": "EKrk5VlnKsWCPccA"}, {"duration": 65, "endDate": "1977-04-24T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "5CEPoH6opK5DSO8J", "quantity": 49, "sku": "wqd5priclNNqLyrl"}]}, {"condition": "zrJ4QHbfnAdtkujx", "conditionName": "Hff7n1yaNCcjgFhS", "eventName": "0URBhl0L5FCbOn46", "rewardItems": [{"duration": 100, "endDate": "1997-03-08T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Wi3KQffT5Tn61A1x", "quantity": 100, "sku": "vPXSDufmKh783cV5"}, {"duration": 11, "endDate": "1989-09-22T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Tno5oHzqY3DgykA8", "quantity": 53, "sku": "HSmo4KX9TPO3K1k5"}, {"duration": 15, "endDate": "1991-04-25T00:00:00Z", "identityType": "ITEM_ID", "itemId": "SXbn6l5xAzc1nc3e", "quantity": 64, "sku": "f5JSwjw2fE2g6jXV"}]}], "userIdExpression": "7oai2oDm9FaP0HJ9"}' \
    > test.out 2>&1
eval_tap $? 171 'CreateReward' test.out

#- 172 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '8tE4UyoQg0b0sGOk' \
    --limit '53' \
    --offset '40' \
    --sortBy 'namespace:desc,rewardCode' \
    > test.out 2>&1
eval_tap $? 172 'QueryRewards' test.out

#- 173 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 173 'ExportRewards' test.out

#- 174 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 174 'ImportRewards' test.out

#- 175 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 't15LKmkQ7YBhsOuJ' \
    > test.out 2>&1
eval_tap $? 175 'GetReward' test.out

#- 176 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '0ypkkt2G4eFh2YNs' \
    --body '{"description": "doxpLTBM9Q8t829I", "eventTopic": "do1JyveSRiBq23ky", "maxAwarded": 69, "maxAwardedPerUser": 57, "namespaceExpression": "9jQbHWkcVk0X28GS", "rewardCode": "54vl7gIKBc7OYTyl", "rewardConditions": [{"condition": "FRAJKySnC0cfPl3Z", "conditionName": "2zSBbs4PAV72u8Ax", "eventName": "E2IQeoxYV4UcYzsw", "rewardItems": [{"duration": 55, "endDate": "1972-09-23T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Xlt8geCdiXu3iNvn", "quantity": 44, "sku": "muQrZ8GaQ4OZ2nDo"}, {"duration": 6, "endDate": "1980-04-10T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "fHbXzWnVO2U4uyzZ", "quantity": 29, "sku": "RPOzwuDSdGl1A2va"}, {"duration": 82, "endDate": "1976-02-08T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "DiSqTfmAVg50kOdJ", "quantity": 1, "sku": "5iqhx6zv7EURTNIo"}]}, {"condition": "G1DBdoKH6sREmmfw", "conditionName": "UZLZZS7snx0Q2Gd8", "eventName": "m7Y3wiNloJfey3HX", "rewardItems": [{"duration": 77, "endDate": "1975-01-15T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "jljNPTXA3qbg55Sy", "quantity": 17, "sku": "kBtXMU6KRIm5xBoI"}, {"duration": 17, "endDate": "1974-08-12T00:00:00Z", "identityType": "ITEM_ID", "itemId": "zG8tlkxWKCU1XN4g", "quantity": 24, "sku": "Qw2yXzaQWaF2PqUf"}, {"duration": 2, "endDate": "1975-05-07T00:00:00Z", "identityType": "ITEM_ID", "itemId": "161TFjROYJm75VIu", "quantity": 59, "sku": "CpqnZ5NW623WWn2Z"}]}, {"condition": "JY3QvRa7CDRTcsAH", "conditionName": "zD3dZyyWbUQpbcv3", "eventName": "IwmL7a1K3zIUYJmd", "rewardItems": [{"duration": 64, "endDate": "1998-11-03T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "bku9GYH4ijqOVM50", "quantity": 41, "sku": "cDPbklTHcmgXsrVj"}, {"duration": 78, "endDate": "1991-06-15T00:00:00Z", "identityType": "ITEM_ID", "itemId": "p8pmEosOXglQwwde", "quantity": 77, "sku": "UeelXYyNrXweiCnD"}, {"duration": 23, "endDate": "1986-01-30T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "fd6mLZ0GTJwEjoZr", "quantity": 89, "sku": "ZoqnpKwhpZVdw5UM"}]}], "userIdExpression": "a8ymxtEFLwELCY2v"}' \
    > test.out 2>&1
eval_tap $? 176 'UpdateReward' test.out

#- 177 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'IddlxnA1VynioJcA' \
    > test.out 2>&1
eval_tap $? 177 'DeleteReward' test.out

#- 178 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'PwVHUGcs1ACMvoY4' \
    --body '{"payload": {"jWH9dFmOHW0j9suu": {}, "kPE4JwQONQ2vCbMn": {}, "0Oia336uiiMTAduc": {}}}' \
    > test.out 2>&1
eval_tap $? 178 'CheckEventCondition' test.out

#- 179 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'tvUfVwLahtRedh1S' \
    --body '{"conditionName": "iZlOpIQ8GL7jBF1R", "userId": "5OexAPzCG6ZKQClG"}' \
    > test.out 2>&1
eval_tap $? 179 'DeleteRewardConditionRecord' test.out

#- 180 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'c1636nbfM3J9G40Y' \
    --limit '6' \
    --offset '35' \
    --start 'bCo941ALznQuHVsk' \
    --storeId 'fCjUK8GeX4Q0B2Cj' \
    --viewId '0oOmBmXu1KiTTiz7' \
    > test.out 2>&1
eval_tap $? 180 'QuerySections' test.out

#- 181 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yrIvQj2isN7bRwcr' \
    --body '{"active": false, "displayOrder": 99, "endDate": "1972-12-21T00:00:00Z", "ext": {"YwgZpjlMMtPWg821": {}, "7m7qNkQiKp2oac8Q": {}, "TNEuBbeuQqm9wM7m": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 42, "itemCount": 94, "rule": "SEQUENCE"}, "items": [{"id": "s9gNpNon6DKW9A6A", "sku": "mnQTNFidImWONTvC"}, {"id": "PMGLdbYEknHPKrZ7", "sku": "TiNBE0HRsE0GHDOF"}, {"id": "jrfqJcyxT2a7fCFA", "sku": "UzLELiM573TdtWjf"}], "localizations": {"VciuLnLsBKGsALPu": {"description": "COyphUUAV95708za", "localExt": {"P0wpZgQEvFzox9wH": {}, "ocX3DRWobEoGr8W9": {}, "7KBedcr6PM51z7i0": {}}, "longDescription": "wQ9egK2t46EG8I2l", "title": "TviKbOgVuN3nhkn6"}, "QIesNoYqvVsakylH": {"description": "ikKkpOjqwgKvfXXs", "localExt": {"8pDqm31AZSRkuw6q": {}, "8FgqG46RsFK7eYlS": {}, "U3vYcHZZjFegVnZO": {}}, "longDescription": "n0tk4IATSIefcqNE", "title": "n4IZ0Dv6b8WtaMVv"}, "LbG04KKnh3jvW0Qp": {"description": "3kTyL4CsLwiWUMcp", "localExt": {"xn4B6XoTNMuqZTHw": {}, "o1IAJQpb6r8ZeaSH": {}, "wQuiH3Ozu4G6bXxp": {}}, "longDescription": "0gYZyF9fJBJkSOrF", "title": "9Dg4FcDwBGyBiHew"}}, "name": "ZkwEeuzBBRSknxyW", "rotationType": "CUSTOM", "startDate": "1987-03-26T00:00:00Z", "viewId": "Obuvig8sMuss76ez"}' \
    > test.out 2>&1
eval_tap $? 181 'CreateSection' test.out

#- 182 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TrsDZNYUV48Oh6I4' \
    > test.out 2>&1
eval_tap $? 182 'PurgeExpiredSection' test.out

#- 183 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '5X7HvUtPYONZdFk7' \
    --storeId '5lkjQNHrjaboGomg' \
    > test.out 2>&1
eval_tap $? 183 'GetSection' test.out

#- 184 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'uUqeuZh5qtrRbNnG' \
    --storeId 'ejdTGvZgN5hshSe5' \
    --body '{"active": false, "displayOrder": 75, "endDate": "1997-05-21T00:00:00Z", "ext": {"XKEQLkM6o3eGSP4H": {}, "tmr90TqGf0OyqJ9i": {}, "bJMmRgoxNwp1lGkY": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 33, "itemCount": 60, "rule": "SEQUENCE"}, "items": [{"id": "1TM0tefVQPWX1NPO", "sku": "5Wn7rNG8rGp7Fadv"}, {"id": "o5EzpX0IttsRezyY", "sku": "9GB5sf94ALBmvdnc"}, {"id": "QkcZb8cWdVH9bww1", "sku": "5zZsaYrJAe5Kd5QB"}], "localizations": {"96ndlO6iPGC9RhzM": {"description": "C7V8BEphnRXnSpCz", "localExt": {"yb8FkoxQbrPngi87": {}, "K58pQswqKLutINus": {}, "Osa92F6iwkJIYOLa": {}}, "longDescription": "rmpWyvib9CDW21AN", "title": "rlpuXD9H1u1CvzWP"}, "cZwkj1l6bf2F9EXO": {"description": "Bj7v8LHYivmD0eky", "localExt": {"cMKlwJTNL2UCWUta": {}, "AD7ZZx1iefATWcDS": {}, "qGYRMdz07xEJ40ep": {}}, "longDescription": "ssgJJC3CX0hpB1ZG", "title": "MMo5DSozCuFsrBMt"}, "oOeLfMCYxSeeJOlx": {"description": "a395rghZwGhdZJkk", "localExt": {"GhYvXYMIyaEMEqOp": {}, "wetb82b96rsH73hR": {}, "fDgl29GWKpItMt4G": {}}, "longDescription": "szRufkDFLYyNBPlM", "title": "rkse9SGcMuV5phhU"}}, "name": "315LUC6HSMQ32Uzn", "rotationType": "NONE", "startDate": "1991-08-20T00:00:00Z", "viewId": "d6ve29lqqtcLJW9e"}' \
    > test.out 2>&1
eval_tap $? 184 'UpdateSection' test.out

#- 185 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'TJvKNDFrx6LabyDn' \
    --storeId 'qXjXKPIcxh0x7T6R' \
    > test.out 2>&1
eval_tap $? 185 'DeleteSection' test.out

#- 186 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 186 'ListStores' test.out

#- 187 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "QGnnW4ugGX6mKBbg", "defaultRegion": "TD9xL07ZzzIs3Jke", "description": "34ZAUuLP897ooMLn", "supportedLanguages": ["emwKAvgDXNrFEE4J", "f4hQpsLOcLtZw0ef", "mEVcW7mxbS5UOoIC"], "supportedRegions": ["xQMit8555Niy4NNF", "pRE5pS85yTIRWvLR", "y58UKWPv3F7S0wCV"], "title": "lYQi9cfMCeNnu6OI"}' \
    > test.out 2>&1
eval_tap $? 187 'CreateStore' test.out

#- 188 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'VIEW' \
    > test.out 2>&1
eval_tap $? 188 'GetCatalogDefinition' test.out

#- 189 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 189 'DownloadCSVTemplates' test.out

#- 190 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "SECTION", "fieldsToBeIncluded": ["1PPLRDEXLXZWXvqN", "CHvNpeMjMzguq6HF", "IqaqwH9J6JLb5f3S"], "idsToBeExported": ["BMyJUdwEBRrHAWUF", "qTooGGnPEgY0t7QQ", "Wl42byOwXgKyPhXm"], "storeId": "cysae8HpWH4xiz3f"}' \
    > test.out 2>&1
eval_tap $? 190 'ExportStoreByCSV' test.out

#- 191 ImportStore
eval_tap 0 191 'ImportStore # SKIP deprecated' test.out

#- 192 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 192 'GetPublishedStore' test.out

#- 193 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 193 'DeletePublishedStore' test.out

#- 194 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 194 'GetPublishedStoreBackup' test.out

#- 195 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 195 'RollbackPublishedStore' test.out

#- 196 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WthJSu2pUIIuPLFA' \
    > test.out 2>&1
eval_tap $? 196 'GetStore' test.out

#- 197 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tcWhjAP57QbWvSSp' \
    --body '{"defaultLanguage": "71zEPPfmAQiqRRC2", "defaultRegion": "caquMRtQOILcaDqU", "description": "ITBHQR5ISNoFR3GU", "supportedLanguages": ["xdMuvmL0UBfwzaae", "P3Wd0Wrb8s3GW0CY", "0vAfbq8xoCurq4lp"], "supportedRegions": ["HXrbVBh60NUA2aKQ", "wnXrmi6ya8u4sQPv", "af1AcweR7tJW3MLM"], "title": "ob1hUnIzIpUM8KK1"}' \
    > test.out 2>&1
eval_tap $? 197 'UpdateStore' test.out

#- 198 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kGFN0NUNGKxdlAUD' \
    > test.out 2>&1
eval_tap $? 198 'DeleteStore' test.out

#- 199 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FQuGPzAuT7M6OBrN' \
    --action 'DELETE' \
    --itemSku 'g8djSb4Vt2vKQ5vl' \
    --itemType 'MEDIA' \
    --limit '28' \
    --offset '8' \
    --selected  \
    --sortBy 'createdAt:desc,updatedAt:asc,createdAt:asc' \
    --status 'PUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 'Pf2iogwxM5DZM0dg' \
    --updatedAtStart 'ozmco41750xdYQg3' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 199 'QueryChanges' test.out

#- 200 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '4WUV0WpmsQnp1n4Y' \
    > test.out 2>&1
eval_tap $? 200 'PublishAll' test.out

#- 201 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GumTKOlDOy5vhSkx' \
    > test.out 2>&1
eval_tap $? 201 'PublishSelected' test.out

#- 202 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ERZ2AQ1jvXYBar5R' \
    > test.out 2>&1
eval_tap $? 202 'SelectAllRecords' test.out

#- 203 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MmmGdWl0wpj5tVfK' \
    --action 'UPDATE' \
    --itemSku 'MI0oZuEjY0rNBbbB' \
    --itemType 'LOOTBOX' \
    --selected  \
    --type 'SECTION' \
    --updatedAtEnd 'zTMBY7Xd0OoENg2L' \
    --updatedAtStart 'w7uepmahXojVZYz2' \
    > test.out 2>&1
eval_tap $? 203 'SelectAllRecordsByCriteria' test.out

#- 204 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zMU9jLzNV3GaG43R' \
    --action 'CREATE' \
    --itemSku 'nlRPrEAYqRBeSc5u' \
    --itemType 'BUNDLE' \
    --type 'ITEM' \
    --updatedAtEnd 'oj3dGHMeoi5DBOsQ' \
    --updatedAtStart '0Gax0iX05IT9Agsj' \
    > test.out 2>&1
eval_tap $? 204 'GetStatistic' test.out

#- 205 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'l5NmnSHhxNmCe4tx' \
    > test.out 2>&1
eval_tap $? 205 'UnselectAllRecords' test.out

#- 206 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'Y0MsPc9EMgf9JCJi' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EvhL8ZfwCVJW9ysp' \
    > test.out 2>&1
eval_tap $? 206 'SelectRecord' test.out

#- 207 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'UOyHC9eKeXzrvzBl' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lwzyC1aTWEmPgoy4' \
    > test.out 2>&1
eval_tap $? 207 'UnselectRecord' test.out

#- 208 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TkpEw4Zeid4mRoFN' \
    --targetStoreId 'xv10ckMQVjKk3bWJ' \
    > test.out 2>&1
eval_tap $? 208 'CloneStore' test.out

#- 209 ExportStore
eval_tap 0 209 'ExportStore # SKIP deprecated' test.out

#- 210 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId '0ZuYSe3sI0x2hc8v' \
    --end 'aN1Off5gRZZMW3hu' \
    --limit '53' \
    --offset '62' \
    --sortBy 'IzBPWBYKAEFTdlKN' \
    --start 'h6GTzKjsCqxx24QM' \
    --success  \
    > test.out 2>&1
eval_tap $? 210 'QueryImportHistory' test.out

#- 211 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId '35bSkFrvGciNHb7O' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'Y5YIpOLJW52uz3c8' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 211 'ImportStoreByCSV' test.out

#- 212 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'NEVER' \
    --itemId 'gTy1HA58Jt5NaROj' \
    --limit '91' \
    --offset '42' \
    --sku 'KFEuZo2ElXYSS4ez' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    --userId 'SiOyReviDaxlPdhw' \
    > test.out 2>&1
eval_tap $? 212 'QuerySubscriptions' test.out

#- 213 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'mcH03yoMxzRR6xd9' \
    > test.out 2>&1
eval_tap $? 213 'RecurringChargeSubscription' test.out

#- 214 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'rTh3ureaIbxM3Wev' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 214 'GetTicketDynamic' test.out

#- 215 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName '9pZQjWAN0tny16ZH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "ZtuSJGQCrM7JEMRP"}' \
    > test.out 2>&1
eval_tap $? 215 'DecreaseTicketSale' test.out

#- 216 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'kdTcAzkIlndN5xea' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 216 'GetTicketBoothID' test.out

#- 217 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'yr3vUKMuIiz2MiAA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 76, "orderNo": "6OOzz9p57qSpHerz"}' \
    > test.out 2>&1
eval_tap $? 217 'IncreaseTicketSale' test.out

#- 218 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Xbox", "count": 5, "currencyCode": "VmBT4wZXQZZrSsuY", "expireAt": "1975-08-28T00:00:00Z"}, "debitPayload": {"count": 71, "currencyCode": "RbwwZc4ZS1NMkrnH", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 43, "entitlementCollectionId": "Iyhwqk140MolIrnl", "entitlementOrigin": "IOS", "itemIdentity": "31gI7VmnGIRMvXe6", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 53, "entitlementId": "iphIFe2bzr6qQw6f"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 58, "currencyCode": "SkM19OPMBb12gpmS", "expireAt": "1974-11-20T00:00:00Z"}, "debitPayload": {"count": 23, "currencyCode": "Mu9QVrMeD4bD8gIS", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 66, "entitlementCollectionId": "yIAZQeigiA3wBrmB", "entitlementOrigin": "Xbox", "itemIdentity": "IlZeheP72AB8EO3Y", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 56, "entitlementId": "lyrWowUpUDVLlTtu"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 76, "currencyCode": "HZVsG6izJZruOJvS", "expireAt": "1993-02-17T00:00:00Z"}, "debitPayload": {"count": 64, "currencyCode": "xVRMPf8g1rbhfIMS", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 60, "entitlementCollectionId": "MnSqrKWYOuITlYS2", "entitlementOrigin": "Epic", "itemIdentity": "aD9WNKGhbLhjz1v0", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 56, "entitlementId": "QwqgJs6O0Qj0ccMk"}, "type": "CREDIT_WALLET"}], "userId": "QJd3930TGewjRyfo"}, {"operations": [{"creditPayload": {"balanceOrigin": "Nintendo", "count": 18, "currencyCode": "WVZZbKFsKOmgEhjH", "expireAt": "1999-02-07T00:00:00Z"}, "debitPayload": {"count": 47, "currencyCode": "2n6iQyr5cb5YL6fw", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 13, "entitlementCollectionId": "iaVPmmn0T5uzlmi2", "entitlementOrigin": "Xbox", "itemIdentity": "Hv7Hssd05pHBJX5l", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 31, "entitlementId": "8PZbYVD8RiaTsdD4"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "System", "count": 82, "currencyCode": "kSbTkHPMUvOAUXkw", "expireAt": "1999-09-12T00:00:00Z"}, "debitPayload": {"count": 5, "currencyCode": "KDjG2ApSV94Jy6yC", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 87, "entitlementCollectionId": "BqJqjAbVwSaoj1ug", "entitlementOrigin": "IOS", "itemIdentity": "S1av9VNpVLT0Lvqc", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 50, "entitlementId": "SdO1nAjY5FvADb3G"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 6, "currencyCode": "HGxhZqNXJ6JXSh0Z", "expireAt": "1999-04-29T00:00:00Z"}, "debitPayload": {"count": 91, "currencyCode": "PQXDNHto74GcmVf0", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 17, "entitlementCollectionId": "bCU9QdPuWeMEeL0E", "entitlementOrigin": "Twitch", "itemIdentity": "BQprHn3whPKU5abn", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 38, "entitlementId": "w8fFa30pVbhr1BHh"}, "type": "DEBIT_WALLET"}], "userId": "arZAyuLcZoEkPpqK"}, {"operations": [{"creditPayload": {"balanceOrigin": "GooglePlay", "count": 68, "currencyCode": "P2jWnRTglw0gdWoE", "expireAt": "1999-09-30T00:00:00Z"}, "debitPayload": {"count": 9, "currencyCode": "R8VyCC0EQwE0cXok", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 2, "entitlementCollectionId": "zJ5E3iYHIknvPcJk", "entitlementOrigin": "IOS", "itemIdentity": "iT9s9pK8HuUY1QQH", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 33, "entitlementId": "NCEddJtx6GV01vD7"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 55, "currencyCode": "LxlpvqaB9P9Gaukf", "expireAt": "1985-09-09T00:00:00Z"}, "debitPayload": {"count": 100, "currencyCode": "IeSBLhTfzigzHcRu", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 78, "entitlementCollectionId": "Yaj4I8Dzyh1N0JEK", "entitlementOrigin": "Xbox", "itemIdentity": "7GuwKn63KIDTkUCq", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 2, "entitlementId": "HZMIL2P2bh14LroF"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 54, "currencyCode": "ufH2YR6QU7fj6w17", "expireAt": "1971-05-22T00:00:00Z"}, "debitPayload": {"count": 21, "currencyCode": "Ns12hOoLVM7UFnuJ", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 52, "entitlementCollectionId": "hgU56xtyJtnbTDXu", "entitlementOrigin": "Xbox", "itemIdentity": "FbleSP5PcdOuq0m0", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 45, "entitlementId": "MifJR4hr4gdJDujY"}, "type": "DEBIT_WALLET"}], "userId": "56nGlYZ2tod2BGBX"}], "metadata": {"jNyRCtPOr1FU3QZy": {}, "3gdDms3kb1htW0UG": {}, "JpwQZlXuzu3m9u67": {}}, "needPreCheck": false, "transactionId": "IZCTNiIRc9fEjkZh", "type": "EpAJMCxMp2J0hDg2"}' \
    > test.out 2>&1
eval_tap $? 218 'Commit' test.out

#- 219 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '5' \
    --status 'SUCCESS' \
    --type 'BKtU956hOg8oukDV' \
    --userId 'dweG0sFHxTHa2k60' \
    > test.out 2>&1
eval_tap $? 219 'GetTradeHistoryByCriteria' test.out

#- 220 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'SzCqUgq1gLbcIMev' \
    > test.out 2>&1
eval_tap $? 220 'GetTradeHistoryByTransactionId' test.out

#- 221 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'TmC631p7q794bu49' \
    --body '{"achievements": [{"id": "lINFTtERAXT2h3hc", "value": 88}, {"id": "nRz9w2nur0B9jKau", "value": 27}, {"id": "5WnzVZdj8tsyzC4Q", "value": 1}], "steamUserId": "eRyIECEDa1I4lwXq"}' \
    > test.out 2>&1
eval_tap $? 221 'UnlockSteamUserAchievement' test.out

#- 222 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'wPfq3VzHQjtolx64' \
    --xboxUserId 'w1gyvjacKtGqxMno' \
    > test.out 2>&1
eval_tap $? 222 'GetXblUserAchievements' test.out

#- 223 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'AXRlcq0mYWKQYlqM' \
    --body '{"achievements": [{"id": "mu2pvF6rP03bQaq1", "percentComplete": 5}, {"id": "IcC4wNFzsbrtYvLh", "percentComplete": 34}, {"id": "6AWXoMiowdWSs9DQ", "percentComplete": 6}], "serviceConfigId": "VU1HED9CGo9aUXj3", "titleId": "rh0UyqxVWlIMY5tT", "xboxUserId": "Jw4KV104MtMhKHmS"}' \
    > test.out 2>&1
eval_tap $? 223 'UpdateXblUserAchievement' test.out

#- 224 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'jqPuQZX5KjdNrEwf' \
    > test.out 2>&1
eval_tap $? 224 'AnonymizeCampaign' test.out

#- 225 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wo2MwulLg4bsO4YH' \
    > test.out 2>&1
eval_tap $? 225 'AnonymizeEntitlement' test.out

#- 226 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'EYLjTSNDf3zazm6p' \
    > test.out 2>&1
eval_tap $? 226 'AnonymizeFulfillment' test.out

#- 227 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId '5Y1tkG9WwU4Ty6Ch' \
    > test.out 2>&1
eval_tap $? 227 'AnonymizeIntegration' test.out

#- 228 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '5QYyFjuBquE7xssm' \
    > test.out 2>&1
eval_tap $? 228 'AnonymizeOrder' test.out

#- 229 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId '4hxczskbSUbOZ9WN' \
    > test.out 2>&1
eval_tap $? 229 'AnonymizePayment' test.out

#- 230 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'l3apJmNAbl1g5ZmT' \
    > test.out 2>&1
eval_tap $? 230 'AnonymizeRevocation' test.out

#- 231 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'TGYRbP4QVey9pEz1' \
    > test.out 2>&1
eval_tap $? 231 'AnonymizeSubscription' test.out

#- 232 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'TV5cUtPBsw01i5Mf' \
    > test.out 2>&1
eval_tap $? 232 'AnonymizeWallet' test.out

#- 233 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId '7WvbNSeeDNfUESLl' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 233 'GetUserDLCByPlatform' test.out

#- 234 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'EfrJDxKsw5Xl7ZZr' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 234 'GetUserDLC' test.out

#- 235 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'qxXnRhDd9TGkO6aI' \
    --activeOnly  \
    --appType 'DLC' \
    --collectionId 'qftw1SrM2nhSEanf' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'YrrFQP6rW62CtetB' \
    --features 'W3pvAJJieHhveGg9,7PY0txzvYwv7atn9,EQv2Oj8TFNeGtJGj' \
    --fuzzyMatchName  \
    --itemId 'KbMgCeuAYuzrmbWo,fEaKStqdKu4ROnON,pJ849chqeiUGQMwN' \
    --limit '45' \
    --offset '89' \
    --origin 'Steam' \
    > test.out 2>&1
eval_tap $? 235 'QueryUserEntitlements' test.out

#- 236 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'YZCeF30RT9rBgM8o' \
    --body '[{"collectionId": "7lxXq7TkdM7FVDCB", "endDate": "1972-06-30T00:00:00Z", "grantedCode": "KuPxjDUGRGcCEPjb", "itemId": "Uy7F82Adu9BYRHrV", "itemNamespace": "TehrqgvEtEs2LpE0", "language": "ZFt", "origin": "Other", "quantity": 8, "region": "LrR1x6U1v6zSLjm9", "source": "REDEEM_CODE", "startDate": "1996-04-10T00:00:00Z", "storeId": "J7X6uVy7FWTSfMi2"}, {"collectionId": "CPVGxjcdpdCqVeeP", "endDate": "1990-08-05T00:00:00Z", "grantedCode": "Sqb8y8qJTUQY40Zr", "itemId": "pn0vAD9YsPeDWrAV", "itemNamespace": "QZSvgWuCuLsUGrVQ", "language": "BIt", "origin": "Other", "quantity": 67, "region": "QHKersDmJLUHAKtf", "source": "IAP", "startDate": "1985-10-24T00:00:00Z", "storeId": "fbdvUMDZeO4U55wd"}, {"collectionId": "CpVpnENiTc9NESV2", "endDate": "1999-02-02T00:00:00Z", "grantedCode": "lmV3kES0Hi88UYgS", "itemId": "V40OvY7apPCrN5bE", "itemNamespace": "hmuHgKeWizEpw1zN", "language": "Mfp", "origin": "Playstation", "quantity": 66, "region": "wgDobopbdJeVCiKs", "source": "PURCHASE", "startDate": "1982-08-26T00:00:00Z", "storeId": "LyH9kcSBdk7MwQzn"}]' \
    > test.out 2>&1
eval_tap $? 236 'GrantUserEntitlement' test.out

#- 237 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '28Le5neohqhCzroA' \
    --activeOnly  \
    --appId 'zWQDve0Z2G2N09VI' \
    > test.out 2>&1
eval_tap $? 237 'GetUserAppEntitlementByAppId' test.out

#- 238 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'bbsz24fQKDZX6plE' \
    --activeOnly  \
    --limit '36' \
    --offset '76' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 238 'QueryUserEntitlementsByAppType' test.out

#- 239 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'xQjYU6KlavIiLxU2' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --platform '0S50bez9ZLHW882r' \
    --itemId 'iiPfRQ3rJ0f5lwXv' \
    > test.out 2>&1
eval_tap $? 239 'GetUserEntitlementByItemId' test.out

#- 240 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'RNDBnmL1KQn77hiP' \
    --ids '1lzkzjYDw6mLBord,rJkD6vy60uRMT1Xw,9K9Yb68a8ygYx2Tq' \
    --platform 'khlqMnE9Wj90EQzO' \
    > test.out 2>&1
eval_tap $? 240 'GetUserActiveEntitlementsByItemIds' test.out

#- 241 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'idrWnLrXqImgDf3G' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --platform 'YfIgLZ4YIzElrLZO' \
    --sku 'BLHCKmLBaIwlokbA' \
    > test.out 2>&1
eval_tap $? 241 'GetUserEntitlementBySku' test.out

#- 242 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'FW8RgBUwBL28BqM8' \
    --appIds 'UzvKqeoTiNKGRUMr,imGAz6OhmHOpCdr3,WzDm3hJdd6uaO9Ti' \
    --itemIds 'TPnIh2iaIBpYC4tx,ul6VKYlNYYlHPwKD,pJmkeoAkp3Z4pgyJ' \
    --platform 'Ywclb4gd4QgQut2h' \
    --skus 'iPuDdOPHcN9drwqy,tieXpIZfr5XDq9dG,LHjtgE2bTXJxCCFq' \
    > test.out 2>&1
eval_tap $? 242 'ExistsAnyUserActiveEntitlement' test.out

#- 243 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'PNDqWrpkWnnova15' \
    --platform 'WVuE5cYVP9tQSa27' \
    --itemIds 'BnPyq3I1BLtGEZDR,Nkk4DJUofJXK8RGS,0zCYRVmbfzwUmsy0' \
    > test.out 2>&1
eval_tap $? 243 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 244 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'stUmKdXiiTObNdqk' \
    --appId 'Wa13g3pgHx6uPf6j' \
    > test.out 2>&1
eval_tap $? 244 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 245 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'QZcYerH933X7iXEE' \
    --entitlementClazz 'MEDIA' \
    --platform 'rRzCCafADJfWBspT' \
    --itemId '3MLwJZquMQSPp5XD' \
    > test.out 2>&1
eval_tap $? 245 'GetUserEntitlementOwnershipByItemId' test.out

#- 246 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '4S1ilfgff7Et4uY8' \
    --ids 'nlBwGNHgfgwZwVMv,shGmsg6ZJYnkHDnH,TlRugM7a2UZgeesi' \
    --platform 'pbP027okM5E8tAaj' \
    > test.out 2>&1
eval_tap $? 246 'GetUserEntitlementOwnershipByItemIds' test.out

#- 247 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'VSvLRj306RDuaSix' \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'xKA6yrnvXY5dDwne' \
    --sku 'ac75C6S2eHsH4Y84' \
    > test.out 2>&1
eval_tap $? 247 'GetUserEntitlementOwnershipBySku' test.out

#- 248 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'hL75QboMHCtzEF9F' \
    > test.out 2>&1
eval_tap $? 248 'RevokeAllEntitlements' test.out

#- 249 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Seg6WYgtfuqJHrs4' \
    --entitlementIds 'e3RnWR30MdBZezfw' \
    > test.out 2>&1
eval_tap $? 249 'RevokeUserEntitlements' test.out

#- 250 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'c3H0qSbMq4GLj8aG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sH0qE5p601ak59yF' \
    > test.out 2>&1
eval_tap $? 250 'GetUserEntitlement' test.out

#- 251 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'SfdZIv8oYWPUS4Zu' \
    --namespace "$AB_NAMESPACE" \
    --userId '0SbTt6M2XizikCh6' \
    --body '{"collectionId": "q0yq2WAHtL7IWE3M", "endDate": "1987-06-16T00:00:00Z", "nullFieldList": ["qvfDG5jvMOaXrDlE", "X42U0syrGNhBmgT2", "q0kIbrJ2S5Pf1Lvg"], "origin": "Nintendo", "reason": "kYEVylINJpxFY8E6", "startDate": "1978-06-08T00:00:00Z", "status": "ACTIVE", "useCount": 19}' \
    > test.out 2>&1
eval_tap $? 251 'UpdateUserEntitlement' test.out

#- 252 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'eHjh0aTjIOaQt0sn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bE0yMvqF7TJ9uB0z' \
    --body '{"options": ["ypjJiu7BIimNuwB3", "hBVhuSMHhf5R2Mkx", "QTAYGfE6hXZ7XLoW"], "platform": "CGf0dZEeXBd6mGG6", "requestId": "SHcZbX2wNnT6A9zo", "useCount": 37}' \
    > test.out 2>&1
eval_tap $? 252 'ConsumeUserEntitlement' test.out

#- 253 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'NLmPAUIMwa2wYq6D' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sUq38bYvaWLoKzHn' \
    > test.out 2>&1
eval_tap $? 253 'DisableUserEntitlement' test.out

#- 254 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'ngdfFnOfY9stXH6L' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YXXMndxBPKmHVB7c' \
    > test.out 2>&1
eval_tap $? 254 'EnableUserEntitlement' test.out

#- 255 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'NzHhvxc4xAPZ86WN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nQOhusPn4466u8ag' \
    > test.out 2>&1
eval_tap $? 255 'GetUserEntitlementHistories' test.out

#- 256 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'b5HPsBU0Eo6QJ9vB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RJ4UP09fabC01Thm' \
    > test.out 2>&1
eval_tap $? 256 'RevokeUserEntitlement' test.out

#- 257 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId '9f4AWpyiKVT3OvEu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jx5yjtQSCJaOHzpb' \
    --body '{"reason": "623EciYoYOPVg6DL", "useCount": 63}' \
    > test.out 2>&1
eval_tap $? 257 'RevokeUserEntitlementByUseCount' test.out

#- 258 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'XeV7BXefsSgZxSYn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VwXqF6K0WA76Kl2m' \
    --quantity '69' \
    > test.out 2>&1
eval_tap $? 258 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 259 RevokeUseCount
eval_tap 0 259 'RevokeUseCount # SKIP deprecated' test.out

#- 260 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'HqaLNdfKszYZzOg1' \
    --namespace "$AB_NAMESPACE" \
    --userId '13h6fIaHSx5bClxU' \
    --body '{"platform": "OBmMwv5pmiIVnhlL", "requestId": "oMemsp7o3F2LQw7Y", "useCount": 39}' \
    > test.out 2>&1
eval_tap $? 260 'SellUserEntitlement' test.out

#- 261 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'VdSxgXez7VvS0C9J' \
    --body '{"duration": 77, "endDate": "1973-12-16T00:00:00Z", "entitlementCollectionId": "CypsceITTkJGGCVF", "entitlementOrigin": "IOS", "itemId": "LrILDLviUCzmDAaW", "itemSku": "5xz1c7ZuZXUCBYnk", "language": "Y0LEBSYBdUSiTOrh", "metadata": {"B8hVs29WOKmZRTtg": {}, "ycLzXz6lUMKi5mwe": {}, "MEZo2ZnL1Zg2JfH4": {}}, "order": {"currency": {"currencyCode": "f73jAevOnES6YJLl", "currencySymbol": "b2AfUEEBbqMMKvkO", "currencyType": "VIRTUAL", "decimals": 25, "namespace": "R1fHUyirMVMOFES2"}, "ext": {"J2OzNlJE3uqZz574": {}, "g31cA0PwZxTIZVSG": {}, "QyTzhs9Asy4d629N": {}}, "free": false}, "orderNo": "nolVWA2dWxBs056j", "origin": "IOS", "overrideBundleItemQty": {"831vlCiZAZHCWMXx": 97, "7SDQUDavOlKT5EIH": 81, "xMRgU7cPqNZrLCRR": 95}, "quantity": 53, "region": "ysya4J3rvTzMTMSw", "source": "PAYMENT", "startDate": "1992-11-16T00:00:00Z", "storeId": "PQPEp5UtwUWGt6to"}' \
    > test.out 2>&1
eval_tap $? 261 'FulfillItem' test.out

#- 262 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'oHP5kAww01zalTdd' \
    --body '{"code": "hAQ1pwqnybvUIfuu", "language": "IM", "region": "Zqz5NSp0B7LODN3B"}' \
    > test.out 2>&1
eval_tap $? 262 'RedeemCode' test.out

#- 263 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'oi2sSAO2n4MZQt75' \
    --body '{"itemId": "3XQB93rOW0guPoQb", "itemSku": "Yzc1RDVhs2lhdzxx", "quantity": 13}' \
    > test.out 2>&1
eval_tap $? 263 'PreCheckFulfillItem' test.out

#- 264 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'fgzcwdgJMjIyGfiN' \
    --body '{"entitlementCollectionId": "BQy41M1gzGCbaxw3", "entitlementOrigin": "Playstation", "metadata": {"rNbE4bbDU4FMTbQa": {}, "ANJOODGerDCWcl3V": {}, "SJENQopeHD6iKBGm": {}}, "origin": "Steam", "rewards": [{"currency": {"currencyCode": "tLfPngD83roOeqE7", "namespace": "fcCAeExeQX43Lpmd"}, "item": {"itemId": "MiZeyIrA4QUKSJgE", "itemSku": "CzvaWUCA7wKru7ry", "itemType": "3AQ2sEHvSxjWoM1r"}, "quantity": 80, "type": "CURRENCY"}, {"currency": {"currencyCode": "OOVG5cG6XxENbWql", "namespace": "X7idzjpKDfwl6XlC"}, "item": {"itemId": "F6YxFMD8tJQwZvUV", "itemSku": "Inos5RK100yH89i8", "itemType": "ZDPXRL8cbTAntB1S"}, "quantity": 92, "type": "CURRENCY"}, {"currency": {"currencyCode": "cF1Qwzz606UGXPho", "namespace": "NZlXMef7AvS3TfKx"}, "item": {"itemId": "6ByTygbtOtcQS4Cm", "itemSku": "gw1wRUnIVYxY6Ohd", "itemType": "krYiCinoVOzo4Plv"}, "quantity": 39, "type": "CURRENCY"}], "source": "OTHER", "transactionId": "pEhjTFYdzsUNvQAn"}' \
    > test.out 2>&1
eval_tap $? 264 'FulfillRewards' test.out

#- 265 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '2LuMjLqwmVz3zKsf' \
    --endTime 'jz1mFkyxoUzfMFoX' \
    --limit '58' \
    --offset '99' \
    --productId 'OguSq2A4R3wDdSkN' \
    --startTime 'fHJtA3QiX9Zvtydb' \
    --status 'FAILED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 265 'QueryUserIAPOrders' test.out

#- 266 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vb0scd97A0GP6djn' \
    > test.out 2>&1
eval_tap $? 266 'QueryAllUserIAPOrders' test.out

#- 267 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '2Ps3IVT5hUZ3cnDq' \
    --endTime '0ddZG0EpfGAqHKcS' \
    --limit '48' \
    --offset '36' \
    --startTime 'Uc2YgRpk2IFGIgIp' \
    --status 'PENDING' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 267 'QueryUserIAPConsumeHistory' test.out

#- 268 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'resGFfsH4aXCDhsh' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "WgY-Wt", "productId": "nyihcUVGHQczI5Zo", "region": "TRUkjGoRkPs2SO9X", "transactionId": "rgXNIaU11cBXLwTf", "type": "OCULUS"}' \
    > test.out 2>&1
eval_tap $? 268 'MockFulfillIAPItem' test.out

#- 269 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'pP7n7M3JXjEvsj5W' \
    --discounted  \
    --itemId 'cQ99M1yuXeqV31LX' \
    --limit '75' \
    --offset '9' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 269 'QueryUserOrders' test.out

#- 270 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ARape2tsNczam4Cd' \
    --body '{"currencyCode": "d1QYvww4XDokltgq", "currencyNamespace": "2vXtUnY6UhDJ4pe0", "discountCodes": ["yiB4tDCWx3cEX8wT", "i1v2abpCWytPEi9Z", "s0Cuhl3dU9b4seYC"], "discountedPrice": 9, "entitlementPlatform": "GooglePlay", "ext": {"hL9rPkV5GkSrcl2O": {}, "47XVzU7qlNVk7qnm": {}, "BS3XKDhp1OkMcErm": {}}, "itemId": "eH0lX1hj0LaXgQ94", "language": "flh775AQfzNjQ7Iu", "options": {"skipPriceValidation": false}, "platform": "Nintendo", "price": 8, "quantity": 50, "region": "pRDJjDyMDKQhuTjt", "returnUrl": "QZyIiAmCL8bNTTfq", "sandbox": true, "sectionId": "kyiQZfMnTbKdwNhi"}' \
    > test.out 2>&1
eval_tap $? 270 'AdminCreateUserOrder' test.out

#- 271 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'IP7dpJ8B8VwFQnVc' \
    --itemId 'o2oCn1KvJmbjapW9' \
    > test.out 2>&1
eval_tap $? 271 'CountOfPurchasedItem' test.out

#- 272 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UlEqtzDd7SgxdxB5' \
    --userId 'kvtM8ah9bPsksceG' \
    > test.out 2>&1
eval_tap $? 272 'GetUserOrder' test.out

#- 273 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UEX8ERZcKSYLo6y7' \
    --userId 'yJMowQ6LpHCvCYTg' \
    --body '{"status": "CHARGEBACK_REVERSED", "statusReason": "9JQwErzjtuP9pUUv"}' \
    > test.out 2>&1
eval_tap $? 273 'UpdateUserOrderStatus' test.out

#- 274 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '7qefNMFsZAIqak1z' \
    --userId 'i0JSa5cRn31D8ubf' \
    > test.out 2>&1
eval_tap $? 274 'FulfillUserOrder' test.out

#- 275 GetUserOrderGrant
eval_tap 0 275 'GetUserOrderGrant # SKIP deprecated' test.out

#- 276 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'dXi7BycDPckeGJUg' \
    --userId 'U8bD5mGFFmKTTUxG' \
    > test.out 2>&1
eval_tap $? 276 'GetUserOrderHistories' test.out

#- 277 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0mpmFxxDNXGlGJvH' \
    --userId 'f558h1ltyhiSGhfq' \
    --body '{"additionalData": {"cardSummary": "XhxBJ7zLXioAGkWg"}, "authorisedTime": "1994-10-06T00:00:00Z", "chargebackReversedTime": "1986-03-18T00:00:00Z", "chargebackTime": "1972-09-06T00:00:00Z", "chargedTime": "1986-12-12T00:00:00Z", "createdTime": "1979-06-24T00:00:00Z", "currency": {"currencyCode": "cKN1gaQ4Bn0cPPtK", "currencySymbol": "aJlw31pdDrXQ47WS", "currencyType": "VIRTUAL", "decimals": 7, "namespace": "DCKF0LLhO3lGZ7eG"}, "customParameters": {"OPj2XoFug8BUQUmP": {}, "HnPumcazKAna0ji7": {}, "57aNDFeKnQP2j2Ws": {}}, "extOrderNo": "QImTwYkiuxzLrbJ0", "extTxId": "BkGzCNgesQlZZHIZ", "extUserId": "H0iks6kx0adnimPy", "issuedAt": "1983-07-19T00:00:00Z", "metadata": {"zezsHdFftHHR6xbc": "VVonwz27DWfGRVhb", "ZTvCPrrZCTU5WUJi": "zF69PSsquWUafwbF", "PX15633pFgA7i9tq": "vfHmFvUZiUW5Y0CY"}, "namespace": "w5OXSGwQkJuy9oLF", "nonceStr": "cHHcraLXR2n9JQvq", "paymentMethod": "7NKWIHYsii3fCh7s", "paymentMethodFee": 16, "paymentOrderNo": "xlulfmya73hX0a8R", "paymentProvider": "CHECKOUT", "paymentProviderFee": 42, "paymentStationUrl": "85PA9wNpmrK5Y5he", "price": 54, "refundedTime": "1973-10-21T00:00:00Z", "salesTax": 9, "sandbox": true, "sku": "hNaIT0pv7XeqO8gY", "status": "AUTHORISED", "statusReason": "c4SryWB4yRaDxvxw", "subscriptionId": "aLM8HkVOW8PnLkgq", "subtotalPrice": 22, "targetNamespace": "JbdkykVAnmnRfUil", "targetUserId": "cKA84d9pMsl7zrNJ", "tax": 43, "totalPrice": 76, "totalTax": 60, "txEndTime": "1971-03-14T00:00:00Z", "type": "a2RdtVb6VgA5yFIH", "userId": "3s9UyeaFi8OE7BCK", "vat": 4}' \
    > test.out 2>&1
eval_tap $? 277 'ProcessUserOrderNotification' test.out

#- 278 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'FeVGrl5NpUG9zblW' \
    --userId 'EiHaUjyTHb0sSlst' \
    > test.out 2>&1
eval_tap $? 278 'DownloadUserOrderReceipt' test.out

#- 279 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'b3slUe94NxhXsVcq' \
    --body '{"currencyCode": "TYi1TMBMzaOrxuKv", "currencyNamespace": "tUVtqbDWnJ2i9TRm", "customParameters": {"JOqIl7U12hO5vpk9": {}, "DOSgbsdGVPLD9A5N": {}, "muZDUV3yHurgOfba": {}}, "description": "1XeoHYTNoRol84Ul", "extOrderNo": "kxtP5Vok9sNK1ORg", "extUserId": "3tChsS3fFpaS1uq1", "itemType": "COINS", "language": "iQyO", "metadata": {"JR7xI59Z9tfGVsgl": "nOxOXBfgBLuglkd9", "LIoshGnFSuHmrqej": "8PRppYY1vlV0M2g6", "oreqyBzWzCgMMWZu": "D6tmIR28xVxbtpSK"}, "notifyUrl": "OfiIP3S6pypZqISn", "omitNotification": false, "platform": "we8YK3lZFslECI9Q", "price": 51, "recurringPaymentOrderNo": "IfqrZuu7IwKcT7sA", "region": "sv2TKCbYMVkXEHms", "returnUrl": "HwIGGsusS0zZRODE", "sandbox": true, "sku": "dudZsLaf8aZrXW84", "subscriptionId": "dt0TSTmy7XF26K2U", "title": "7xttUz8nWKJjv06P"}' \
    > test.out 2>&1
eval_tap $? 279 'CreateUserPaymentOrder' test.out

#- 280 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'uffHghAQfAsYXVzB' \
    --userId 'enLtaAoYyRfiCWrm' \
    --body '{"description": "3s1Ah3TII70MIcBM"}' \
    > test.out 2>&1
eval_tap $? 280 'RefundUserPaymentOrder' test.out

#- 281 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'J04508jKedx0CVRp' \
    > test.out 2>&1
eval_tap $? 281 'GetUserPlatformAccountClosureHistories' test.out

#- 282 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'd7SwZw2UkjDzJ4Nu' \
    --body '{"code": "MMgI13nplXaUQV5Q", "orderNo": "EvKElLfbB7gwwAR1"}' \
    > test.out 2>&1
eval_tap $? 282 'ApplyUserRedemption' test.out

#- 283 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'xFrnyirw3iJt5iA3' \
    --body '{"meta": {"JS2xeaJ08JrSHPqd": {}, "hKHn6ZjZMdr1C2TI": {}, "QzRJY7UfYSrdN0JV": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Playstation", "currencyCode": "MIu9lu18jIMBUM77", "namespace": "XmemN8LO03mnFSq9"}, "entitlement": {"entitlementId": "jJTVFoFjxZjh5qUR"}, "item": {"entitlementOrigin": "Other", "itemIdentity": "Pq4a4uaMfd0SQAfY", "itemIdentityType": "ITEM_SKU", "origin": "System"}, "quantity": 53, "type": "ITEM"}, {"currency": {"balanceOrigin": "System", "currencyCode": "yklfLVY6g3PO4hKA", "namespace": "eF4GUV5m96qcCJsV"}, "entitlement": {"entitlementId": "OWtu5RPsqd66ImBE"}, "item": {"entitlementOrigin": "Other", "itemIdentity": "3IB2kX5REQZsHyXz", "itemIdentityType": "ITEM_ID", "origin": "GooglePlay"}, "quantity": 71, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Xbox", "currencyCode": "31Kajxq7lzuVRVEv", "namespace": "hKIbrq1xsGpdobYu"}, "entitlement": {"entitlementId": "n8hcO55hVjfWyK02"}, "item": {"entitlementOrigin": "Other", "itemIdentity": "NIIlcrZzgameT2mL", "itemIdentityType": "ITEM_ID", "origin": "IOS"}, "quantity": 44, "type": "ENTITLEMENT"}], "source": "IAP", "transactionId": "hUwguGgbLLN3O7CE"}' \
    > test.out 2>&1
eval_tap $? 283 'DoRevocation' test.out

#- 284 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'YjxqElP5lA2FJ0iG' \
    --body '{"gameSessionId": "LRTXGsC5mxxse4ee", "payload": {"uMgEctVEux2MSuws": {}, "EHlwdeJyhsHS6YqP": {}, "udWviQsULL1txfX9": {}}, "scid": "tqFSkGXoIcFN5JL9", "sessionTemplateName": "M53Mg0MzWS9usxxn"}' \
    > test.out 2>&1
eval_tap $? 284 'RegisterXblSessions' test.out

#- 285 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mhjv66DyED4prRVi' \
    --chargeStatus 'CHARGED' \
    --itemId '9EdB9MxaF8QHGM2I' \
    --limit '42' \
    --offset '4' \
    --sku 'QYBO8m0HgTth479W' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 285 'QueryUserSubscriptions' test.out

#- 286 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'V0VwR3yNKDtMqMrA' \
    --excludeSystem  \
    --limit '66' \
    --offset '99' \
    --subscriptionId 'pdyF6WDHn3ePBxQN' \
    > test.out 2>&1
eval_tap $? 286 'GetUserSubscriptionActivities' test.out

#- 287 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'z2IUEHMzl5jhwVDs' \
    --body '{"grantDays": 41, "itemId": "UWqP4ElzL44KEm3u", "language": "HBMCP5ckjphURs4k", "reason": "sgsKJ2R6Jacwwu8W", "region": "1zvrKMRPvwA9k6yJ", "source": "z03NETdywPqYerrp"}' \
    > test.out 2>&1
eval_tap $? 287 'PlatformSubscribeSubscription' test.out

#- 288 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Om4M2pM4fIfcHBWZ' \
    --itemId 'M50aHbPXRns3qwYL' \
    > test.out 2>&1
eval_tap $? 288 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 289 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '6LwGlZGF7XQPLAcI' \
    --userId 'L7FvAMWqhyyNZH1C' \
    > test.out 2>&1
eval_tap $? 289 'GetUserSubscription' test.out

#- 290 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ducB5y5iMdeBG7RE' \
    --userId 'G4meKEabfVXBJPIZ' \
    > test.out 2>&1
eval_tap $? 290 'DeleteUserSubscription' test.out

#- 291 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'qZC5d6JuFdcfiNf0' \
    --userId 'DOHKwxDF5GJhCjVH' \
    --force  \
    --body '{"immediate": false, "reason": "JV5oc5IFQsrwHqFq"}' \
    > test.out 2>&1
eval_tap $? 291 'CancelSubscription' test.out

#- 292 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'wVA5mozeeOjIFQfX' \
    --userId 'V3YW3ug3nCXhD7FU' \
    --body '{"grantDays": 52, "reason": "p2r4D3NQdjrjkX3A"}' \
    > test.out 2>&1
eval_tap $? 292 'GrantDaysToSubscription' test.out

#- 293 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'MgK3JgZufzssA284' \
    --userId 'mG7uAojLYBsx8oqM' \
    --excludeFree  \
    --limit '53' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 293 'GetUserSubscriptionBillingHistories' test.out

#- 294 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'bE0ljQaBtb47V691' \
    --userId 'j0FZp2vjOXptxzx6' \
    --body '{"additionalData": {"cardSummary": "kkaZYpl52sQR9Znp"}, "authorisedTime": "1978-01-31T00:00:00Z", "chargebackReversedTime": "1982-07-08T00:00:00Z", "chargebackTime": "1973-09-13T00:00:00Z", "chargedTime": "1994-12-23T00:00:00Z", "createdTime": "1982-05-19T00:00:00Z", "currency": {"currencyCode": "jKasq5zQ6uZNwKjn", "currencySymbol": "X7vDIqpcjmaq5KBC", "currencyType": "VIRTUAL", "decimals": 82, "namespace": "HlwNrfKJrkzwR40t"}, "customParameters": {"fd9GFXChtxB10d4Q": {}, "8nlBthUSu4WNfTvD": {}, "5UcES1eLMZs9lSQV": {}}, "extOrderNo": "Dp16qVIqXCK9dS5J", "extTxId": "TbdJEe6mnkYAfw61", "extUserId": "kyKk0UXUF2523OTv", "issuedAt": "1991-03-12T00:00:00Z", "metadata": {"mfVNJNDaSO3FEkk4": "It6V8Bu7rIjGrxUM", "Kbv60ixUuUhopdqG": "rqRZ124P7PauXTrp", "WAjwatSvtPbAFn8o": "WQcmFkkRX6EqadAE"}, "namespace": "Izxld80Ynss7hc3V", "nonceStr": "UxxZIgkTLqMeJPCb", "paymentMethod": "s8jWmTteJhwNbwHG", "paymentMethodFee": 66, "paymentOrderNo": "GQFwHUtZugblT3aI", "paymentProvider": "XSOLLA", "paymentProviderFee": 93, "paymentStationUrl": "Kn9qJXncm5igpAew", "price": 4, "refundedTime": "1977-07-27T00:00:00Z", "salesTax": 27, "sandbox": false, "sku": "Wk0E7YaPblcWEyNg", "status": "CHARGE_FAILED", "statusReason": "5r1b8Yp2QnuhQuId", "subscriptionId": "vZdj6AspWBfRnLcL", "subtotalPrice": 3, "targetNamespace": "1WEeDbql13FtQMu4", "targetUserId": "1rnOzbsFBqg6dziW", "tax": 44, "totalPrice": 6, "totalTax": 60, "txEndTime": "1991-04-14T00:00:00Z", "type": "cwfUBMdNuTaiLxFM", "userId": "XRpDP9xutntU8xHw", "vat": 50}' \
    > test.out 2>&1
eval_tap $? 294 'ProcessUserSubscriptionNotification' test.out

#- 295 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'rgr5RffM5JXvPdzE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pDln04F8BQjzobhD' \
    --body '{"count": 1, "orderNo": "qXltZF6aSRmHU5iR"}' \
    > test.out 2>&1
eval_tap $? 295 'AcquireUserTicket' test.out

#- 296 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId '3hXIbzWPKOkzftOg' \
    > test.out 2>&1
eval_tap $? 296 'QueryUserCurrencyWallets' test.out

#- 297 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'DQAWhulbrDf7q4cA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'npmLiEu4CNtX2lnq' \
    --body '{"allowOverdraft": false, "amount": 13, "balanceOrigin": "Epic", "balanceSource": "DLC_REVOCATION", "metadata": {"HTSdGoLZbC3UJruU": {}, "4uIXBZsEYogFWiH9": {}, "z4E8zmaZ5cg0REtU": {}}, "reason": "WY4fVIdqwCWF5wmb"}' \
    > test.out 2>&1
eval_tap $? 297 'DebitUserWalletByCurrencyCode' test.out

#- 298 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'OubTxAAeDCowR3Me' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CNL1oNrF3SmgudQu' \
    --limit '37' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 298 'ListUserCurrencyTransactions' test.out

#- 299 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'nuMNpKEIs3GC9VTK' \
    --namespace "$AB_NAMESPACE" \
    --userId '7tkJWFpHt7MdKu9X' \
    --request '{"amount": 48, "debitBalanceSource": "PAYMENT", "metadata": {"n5GHJDGatrYOMO91": {}, "CYEjX867n9PT9fR7": {}, "mMuBXPDKCriRKzTZ": {}}, "reason": "7TXAVRnUVbxEJcKH", "walletPlatform": "Steam"}' \
    > test.out 2>&1
eval_tap $? 299 'CheckBalance' test.out

#- 300 CheckWallet
eval_tap 0 300 'CheckWallet # SKIP deprecated' test.out

#- 301 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'HrDel8oThvr8CUEz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'w4zL1QeR3EYXBFpU' \
    --body '{"amount": 74, "expireAt": "1996-07-15T00:00:00Z", "metadata": {"soBwqh0TQXa2j7v3": {}, "zQJoQLTAlW75icIK": {}, "UpXazsFrmaGNoi3R": {}}, "origin": "Xbox", "reason": "q6SUSt8xd8EgE15X", "source": "REFERRAL_BONUS"}' \
    > test.out 2>&1
eval_tap $? 301 'CreditUserWallet' test.out

#- 302 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'yrjz4q7e0EJnADXC' \
    --namespace "$AB_NAMESPACE" \
    --userId '2y0DY1E1SMK9oA4v' \
    --request '{"amount": 76, "debitBalanceSource": "TRADE", "metadata": {"56dsYI5SKV5pDANy": {}, "J184miBhdVJt81fm": {}, "LSyGuu5rbJVIwRMt": {}}, "reason": "wApGbXnR3yC6f2MH", "walletPlatform": "Xbox"}' \
    > test.out 2>&1
eval_tap $? 302 'DebitByWalletPlatform' test.out

#- 303 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'oMjCPtEKeBWTm78F' \
    --namespace "$AB_NAMESPACE" \
    --userId 'n8TvZVTe4L2lXrVP' \
    --body '{"amount": 21, "metadata": {"r5ZTcnVVOKMApTcW": {}, "sFRUlWBp4gBs9Uuf": {}, "gsVbG6TUe3jbuQ7H": {}}, "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 303 'PayWithUserWallet' test.out

#- 304 GetUserWallet
eval_tap 0 304 'GetUserWallet # SKIP deprecated' test.out

#- 305 DebitUserWallet
eval_tap 0 305 'DebitUserWallet # SKIP deprecated' test.out

#- 306 DisableUserWallet
eval_tap 0 306 'DisableUserWallet # SKIP deprecated' test.out

#- 307 EnableUserWallet
eval_tap 0 307 'EnableUserWallet # SKIP deprecated' test.out

#- 308 ListUserWalletTransactions
eval_tap 0 308 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 309 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PO4ozK705ykRqSPY' \
    > test.out 2>&1
eval_tap $? 309 'ListViews' test.out

#- 310 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZgPm4JLsXVtBOEet' \
    --body '{"displayOrder": 69, "localizations": {"2V3baMkZ9JCqBIkU": {"description": "ID0EE9InZNLwwAhW", "localExt": {"2b5OHKtUv4lTkQNj": {}, "xhXdj1CG0EBgst9Q": {}, "u8Ofl2oB8VTjF0pD": {}}, "longDescription": "3NHU8iYUOtG5gbQS", "title": "KW2MdgCH4bWxRF6f"}, "BPa6GOuV5z0p8jaJ": {"description": "s2duQqawPrxi6F4e", "localExt": {"lhy9CZ94CAUVW8Fo": {}, "Ef8tjCjWc22qqDfN": {}, "z59jHwSDQHadmAo0": {}}, "longDescription": "lzhPm7RmaOr6TLwV", "title": "yE42ApAb7CKt79wA"}, "opZL9Cw6K9h55mwU": {"description": "vhdBOgumV4wAsd4i", "localExt": {"fGd0bkWrlhtfTywR": {}, "W4fmg6btk3mAO4Et": {}, "B0hn2x1oTOX5gBQl": {}}, "longDescription": "VDx9neFHWhDRJtyY", "title": "Et7ygZleAoUuVKne"}}, "name": "oO10ytPdJ8SY3qoo"}' \
    > test.out 2>&1
eval_tap $? 310 'CreateView' test.out

#- 311 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'gOxoPYvdIBJYyGUR' \
    --storeId 'jEjnslEYM8ngVT1e' \
    > test.out 2>&1
eval_tap $? 311 'GetView' test.out

#- 312 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'wVxvgAocOqsd5v5n' \
    --storeId '7eXCo9gZWdxfIdW8' \
    --body '{"displayOrder": 11, "localizations": {"B3infEVxArF7TB6A": {"description": "6a71zAJpaPeudUtK", "localExt": {"PJUmAvxBxJNPlvvY": {}, "Zw4MWzWFTuNPf5JC": {}, "SDyYy4e5qoTZxSoZ": {}}, "longDescription": "bQUnUxS6m68WL3HD", "title": "L4yx5I0euBsccHPA"}, "2v9XP9enfEX7lloL": {"description": "gIYqxFfSNJlHCjxL", "localExt": {"NnYUlGQsFpy9ZVlL": {}, "IFwLgT78nootfUs9": {}, "559ilm3cauhrw9Yn": {}}, "longDescription": "2z5cnbm7z2Aa24yB", "title": "Tw3wfNGyWf3VujS7"}, "Bq5bcfPW4pPZB9YX": {"description": "ltCxyztUnj17t3gH", "localExt": {"BXvjvziexzOLbOWb": {}, "tcJUxM3AWyDkA5Lm": {}, "ART6kulpM4SRtUE5": {}}, "longDescription": "P4kxmHtFbjqurHix", "title": "0QYycDH5we2Mx0sY"}}, "name": "CnYPT4i4mxc14iRf"}' \
    > test.out 2>&1
eval_tap $? 312 'UpdateView' test.out

#- 313 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'zJwKuc7EpiQEzz5N' \
    --storeId '5osRYO7wbYh7q02W' \
    > test.out 2>&1
eval_tap $? 313 'DeleteView' test.out

#- 314 QueryWallets
eval_tap 0 314 'QueryWallets # SKIP deprecated' test.out

#- 315 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 41, "expireAt": "1984-03-28T00:00:00Z", "metadata": {"X5lB80k2smdkBS2M": {}, "aIP7PjngEFggq91c": {}, "pgvoDBgYfLBdGNAZ": {}}, "origin": "Steam", "reason": "K6ZuvlzGCII156hI", "source": "CONSUME_ENTITLEMENT"}, "currencyCode": "irnEsxSE4vBzG7VK", "userIds": ["yJPQ1qdRcJjsme1O", "ukIfIZVH8q8svV5h", "8sWEshmZf5fEdvjb"]}, {"creditRequest": {"amount": 79, "expireAt": "1971-12-01T00:00:00Z", "metadata": {"j55huTA6AvmW0567": {}, "BFqbrPIuxKmBXLi6": {}, "GpnqAeMvg3w0FQ15": {}}, "origin": "Epic", "reason": "M3TxWXSdTiKdva2U", "source": "REFUND"}, "currencyCode": "UzBm5vGA3itKaF9z", "userIds": ["3WWuv3j8T9g1f6P3", "D3rVcC2g6t42jE1W", "ad232YV7A2zHFGbN"]}, {"creditRequest": {"amount": 35, "expireAt": "1984-03-16T00:00:00Z", "metadata": {"QaCaw9UF7cdSDd99": {}, "DQZ7vnTx8HDXTJWi": {}, "yw17ogzmbj4SLYDr": {}}, "origin": "Steam", "reason": "JvDLGvn6qtroZcp1", "source": "IAP_CHARGEBACK_REVERSED"}, "currencyCode": "HKXX1ft5nBA9xNIJ", "userIds": ["d7c94rEmIYuAT5OA", "VuMz04evSdE2FMcK", "cUwYHGmG5rNDBF1o"]}]' \
    > test.out 2>&1
eval_tap $? 315 'BulkCredit' test.out

#- 316 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "U37vjfyX5YLaM0wm", "request": {"allowOverdraft": false, "amount": 98, "balanceOrigin": "IOS", "balanceSource": "TRADE", "metadata": {"1WABBbq8IzZsMFLX": {}, "9ZhFXcFtfBS3ZIHo": {}, "fhwyM6Bw2sFGQ5DQ": {}}, "reason": "oDwzrKPOZZnV3zR7"}, "userIds": ["LnREsrrB2pJ7V8BS", "YxSu6addocg10Hy9", "jx7gBHTOHHArjld0"]}, {"currencyCode": "rucjO3zvSM5KeVNH", "request": {"allowOverdraft": true, "amount": 67, "balanceOrigin": "Twitch", "balanceSource": "DLC_REVOCATION", "metadata": {"KWBxF9RAIrI81ZR2": {}, "kNzh60RQNaTEhMXM": {}, "epgzY9jLiAdMiQ7e": {}}, "reason": "DMkeBRMur18nCxiV"}, "userIds": ["9bQMHpPbvflI3LkR", "stsU3Qecxo4bQZO3", "c1NgZaoYAaCCeRgt"]}, {"currencyCode": "P2f8TTOVf6jrr1OL", "request": {"allowOverdraft": false, "amount": 67, "balanceOrigin": "Epic", "balanceSource": "IAP_REVOCATION", "metadata": {"10wefF0CJlH55RLE": {}, "geAsSpQdcmGHZuRV": {}, "Q8tzwqMayP8A3HGN": {}}, "reason": "I3BfjkFd6MHo6gGQ"}, "userIds": ["ovQZhwfjkq9iyTby", "5mChYoKD7yqCR03R", "D3D01tRpuuyIagSS"]}]' \
    > test.out 2>&1
eval_tap $? 316 'BulkDebit' test.out

#- 317 GetWallet
eval_tap 0 317 'GetWallet # SKIP deprecated' test.out

#- 318 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'zEL8H4euLufhQj2K' \
    --end 'P3LLxl9Hs2L2wlpK' \
    --start 'BVURxHefz77a9fnt' \
    > test.out 2>&1
eval_tap $? 318 'SyncOrders' test.out

#- 319 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["CNiHBRUNCPSre5Gm", "ZzCQwilS3IxSjlyv", "R9PxG9Lji2Vc88W8"], "apiKey": "aLjIxVGpdOqguxvR", "authoriseAsCapture": true, "blockedPaymentMethods": ["2mGUUpq3ix7Am7W1", "fwJnV94BrMSP31wA", "kVH75UcmNXK5RqcI"], "clientKey": "o9lpz9oM52vHPlwV", "dropInSettings": "V3jlPKDEYahnlLJa", "liveEndpointUrlPrefix": "LCvjRKKX1brmkJDf", "merchantAccount": "dngbQD3pO8U3W94Z", "notificationHmacKey": "8IW2MAL9gYHEV3wn", "notificationPassword": "TZTvYYf4ZFuV6L2A", "notificationUsername": "ldoWWRN5wNYlFili", "returnUrl": "YmBrqrOc0NIligBr", "settings": "OkBljwRENjt04Zpy"}' \
    > test.out 2>&1
eval_tap $? 319 'TestAdyenConfig' test.out

#- 320 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "TTZG1LxLdySvyVqY", "privateKey": "8nxBZbHcPHEFuEVP", "publicKey": "9bF07gnWDULkJPQR", "returnUrl": "0UJMr8ouccGH0B4L"}' \
    > test.out 2>&1
eval_tap $? 320 'TestAliPayConfig' test.out

#- 321 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "Ce2h0iFCCZgFWs5s", "secretKey": "0nT89A88GDOUClGy"}' \
    > test.out 2>&1
eval_tap $? 321 'TestCheckoutConfig' test.out

#- 322 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'zYgnYTdim6PkRoq5' \
    > test.out 2>&1
eval_tap $? 322 'DebugMatchedPaymentMerchantConfig' test.out

#- 323 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "TO65KWh8ztRJkXxU", "clientSecret": "Aj3jzZvEaY103YUI", "returnUrl": "MuSjDHz0zPWMZQNN", "webHookId": "P2JqQqhISTBT1Gof"}' \
    > test.out 2>&1
eval_tap $? 323 'TestPayPalConfig' test.out

#- 324 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["v4SuaZ8yCB9TVZnu", "zgvAZJRm71EC3ENu", "vD8OPsp5Z3ez84KV"], "publishableKey": "B7HeWPnVeFdy5ezl", "secretKey": "CU6SGzkMpTL2wxob", "webhookSecret": "jxAbagqEmXn6U2Ve"}' \
    > test.out 2>&1
eval_tap $? 324 'TestStripeConfig' test.out

#- 325 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "V2emK3JecJA4skqC", "key": "bPxRkIAFQh9yDdoL", "mchid": "E2s7mrVrmTJwtBTz", "returnUrl": "QTrNo1LcWNf7xHpi"}' \
    > test.out 2>&1
eval_tap $? 325 'TestWxPayConfig' test.out

#- 326 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "1JZJjIRtCfqDHSlo", "flowCompletionUrl": "54zSnRN0zGMworzy", "merchantId": 26, "projectId": 85, "projectSecretKey": "1z3ZdetOic9AQOFW"}' \
    > test.out 2>&1
eval_tap $? 326 'TestXsollaConfig' test.out

#- 327 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'pdItLBhvKJq9tWz9' \
    > test.out 2>&1
eval_tap $? 327 'GetPaymentMerchantConfig' test.out

#- 328 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'yui8a6jOflFJlZEh' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["z1QDeh05hj92bwVV", "xJ62Q5AOAOyL65cP", "aOZA8BG8KcVWOX9n"], "apiKey": "3YsjJexnFA9Umz3K", "authoriseAsCapture": true, "blockedPaymentMethods": ["PPzwJmKaLCx3gcid", "EALWe6RG5wWznu5A", "jwR1Z4fU7ICcaQtu"], "clientKey": "uKUw3dUwWHhQW3I1", "dropInSettings": "y9tjRLVOXBMa0JiI", "liveEndpointUrlPrefix": "e1AY0tUA7EKASk3U", "merchantAccount": "SNLhOBlxRBLgohp8", "notificationHmacKey": "ByTi2F6AyUX8w77r", "notificationPassword": "iPlPgJcLbeQf9MIC", "notificationUsername": "xX7xKyCfgwSPz14a", "returnUrl": "syOdgn77gN8K1FlN", "settings": "kgbFE8U4meK5grmP"}' \
    > test.out 2>&1
eval_tap $? 328 'UpdateAdyenConfig' test.out

#- 329 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'BsFH71VrhsISYteg' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 329 'TestAdyenConfigById' test.out

#- 330 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'QbNA2WQrHTkJT1Vk' \
    --sandbox  \
    --validate  \
    --body '{"appId": "ChD3n0c1ryAkRvdP", "privateKey": "R8gx2rX5dck8NFKP", "publicKey": "gT6LMehg047axU5k", "returnUrl": "tNywRIvO2Sgz30he"}' \
    > test.out 2>&1
eval_tap $? 330 'UpdateAliPayConfig' test.out

#- 331 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'jqdktHIO1VdtMSew' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 331 'TestAliPayConfigById' test.out

#- 332 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 's1TrU4FhAfKDcDG5' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "bMTba1tUlFGcP6eL", "secretKey": "7EpWtPifmO0JK4dP"}' \
    > test.out 2>&1
eval_tap $? 332 'UpdateCheckoutConfig' test.out

#- 333 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id '1aZFiSkmhwVVMGkX' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 333 'TestCheckoutConfigById' test.out

#- 334 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'NwMYwFyljy5bYQdQ' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "87hUHA0FJZwP8Gsl", "clientSecret": "Mpx3m7lEXTmnTbtj", "returnUrl": "K9RsyoqT3adB48Jx", "webHookId": "p2zaItg9jTNZvpFE"}' \
    > test.out 2>&1
eval_tap $? 334 'UpdatePayPalConfig' test.out

#- 335 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'UI21aSaIsMyLKPPI' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 335 'TestPayPalConfigById' test.out

#- 336 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'Zx0zdNAagipZwiaB' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["rFrXtGMjujfHZB1g", "MI1B8DXb37DffTZ7", "yQz337LLNCjIySe3"], "publishableKey": "6SA5dxATLv5PkLvr", "secretKey": "aRzChdjDGdlk2A2j", "webhookSecret": "HbAPNGInvbnf4ewK"}' \
    > test.out 2>&1
eval_tap $? 336 'UpdateStripeConfig' test.out

#- 337 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'FFLoGggX4gQWyZoc' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 337 'TestStripeConfigById' test.out

#- 338 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'vYfr0Rnl02R1IVNn' \
    --validate  \
    --body '{"appId": "aK6KS71Xs1BphA9B", "key": "XpKYgF9OuigDP0Vj", "mchid": "my7j2BrdCAm3slCw", "returnUrl": "aBqHpE55sjxBGijw"}' \
    > test.out 2>&1
eval_tap $? 338 'UpdateWxPayConfig' test.out

#- 339 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id '0dQtZNonMrPkzUe9' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 339 'UpdateWxPayConfigCert' test.out

#- 340 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'SglAJGyZS0I8FevJ' \
    > test.out 2>&1
eval_tap $? 340 'TestWxPayConfigById' test.out

#- 341 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'iT98HUBp56Q4WETx' \
    --validate  \
    --body '{"apiKey": "tGMs5tPKPuK0K4Pi", "flowCompletionUrl": "MDTR7LxihuOn57io", "merchantId": 66, "projectId": 7, "projectSecretKey": "FSwjby6rMYkVQnZD"}' \
    > test.out 2>&1
eval_tap $? 341 'UpdateXsollaConfig' test.out

#- 342 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'UAbINRKQsxUO1YMx' \
    > test.out 2>&1
eval_tap $? 342 'TestXsollaConfigById' test.out

#- 343 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'AndOj5O6IBwXJjgQ' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "SMALL", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 343 'UpdateXsollaUIConfig' test.out

#- 344 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '30' \
    --namespace "$AB_NAMESPACE" \
    --offset '46' \
    --region 'JyqwFVBd1ZjaRXEd' \
    > test.out 2>&1
eval_tap $? 344 'QueryPaymentProviderConfig' test.out

#- 345 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "gS12bSbPgOCWUogi", "region": "zeWOPUMrqgEIsMwN", "sandboxTaxJarApiToken": "bfti0LoTBcNzyoCS", "specials": ["WALLET", "CHECKOUT", "STRIPE"], "taxJarApiToken": "a9nUsHCVicuJ7onr", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 345 'CreatePaymentProviderConfig' test.out

#- 346 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 346 'GetAggregatePaymentProviders' test.out

#- 347 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'VlB6xNel4Bxb9KwF' \
    > test.out 2>&1
eval_tap $? 347 'DebugMatchedPaymentProviderConfig' test.out

#- 348 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 348 'GetSpecialPaymentProviders' test.out

#- 349 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'YqdhEVq3hbsApeAS' \
    --body '{"aggregate": "ADYEN", "namespace": "IROZuqdJBi8pkn98", "region": "VtLNkaIQJfkFDhSe", "sandboxTaxJarApiToken": "SGXtZU5SuIhMSaDR", "specials": ["PAYPAL", "WXPAY", "PAYPAL"], "taxJarApiToken": "dUWHcjrb6qNeKpOx", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 349 'UpdatePaymentProviderConfig' test.out

#- 350 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'Jy9oFOHB2KEsIdto' \
    > test.out 2>&1
eval_tap $? 350 'DeletePaymentProviderConfig' test.out

#- 351 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 351 'GetPaymentTaxConfig' test.out

#- 352 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "zVltBhoXE4wgcYT5", "taxJarApiToken": "CdjaJuUzFIeqaVr1", "taxJarEnabled": true, "taxJarProductCodesMapping": {"k9OoiPdnq9KBqBwi": "NCsnK8CcO1OHbpQZ", "twW3EwLre1bL4dJn": "kRLJbMvOGSd7uMrm", "Q2SaLd6M7TM3wnJy": "Exuo5z9RAcYgYZb7"}}' \
    > test.out 2>&1
eval_tap $? 352 'UpdatePaymentTaxConfig' test.out

#- 353 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'cAakJpqN6eubdp49' \
    --end 'JFwXG0EvoSHNC97e' \
    --start 'EyhnL1QH5AlYRAqC' \
    > test.out 2>&1
eval_tap $? 353 'SyncPaymentOrders' test.out

#- 354 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'AC2gy1WF9QLNgDxA' \
    --storeId 'kwgfB8jIecOx5ugN' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetRootCategories' test.out

#- 355 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'CDd6jW6fjtBcO3fW' \
    --storeId 'q9qfmBv0XgJB6a7u' \
    > test.out 2>&1
eval_tap $? 355 'DownloadCategories' test.out

#- 356 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'ykADFpinFcH2ZMSY' \
    --namespace "$AB_NAMESPACE" \
    --language 'ijqEuMfuYFUS079t' \
    --storeId 'OpZYM1XV0Op0damy' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetCategory' test.out

#- 357 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'cnTUOoMkOppZNOkq' \
    --namespace "$AB_NAMESPACE" \
    --language 'xc42HKv5wvtPJVsu' \
    --storeId 'zaBciSxwzuIpGBYH' \
    > test.out 2>&1
eval_tap $? 357 'PublicGetChildCategories' test.out

#- 358 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'THoSVxgQCbpZx5yM' \
    --namespace "$AB_NAMESPACE" \
    --language 'GIQ1ZxVIefYlKBJy' \
    --storeId 'QMqUEfDikX6yOlgZ' \
    > test.out 2>&1
eval_tap $? 358 'PublicGetDescendantCategories' test.out

#- 359 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 359 'PublicListCurrencies' test.out

#- 360 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'PSN' \
    > test.out 2>&1
eval_tap $? 360 'GeDLCDurableRewardShortMap' test.out

#- 361 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'OCULUS' \
    > test.out 2>&1
eval_tap $? 361 'GetIAPItemMapping' test.out

#- 362 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'dEAJSqXA0Wv0zWGv' \
    --region 'kc6byp3mvyYT3Gua' \
    --storeId 'ZVTxBlw1IWeXKFT4' \
    --appId 'rfSbbSlDPGf9Fn32' \
    > test.out 2>&1
eval_tap $? 362 'PublicGetItemByAppId' test.out

#- 363 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'JNPZkEfkAcJTMS4p' \
    --categoryPath 'VRcCHIGfmCMTr9AC' \
    --features 'nI2sMrEgl7ZR1HCk' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --language 'YRxFWia7yJ2d87Xj' \
    --limit '55' \
    --offset '0' \
    --region 'gzqRMuMPrIekxq58' \
    --sortBy 'name:desc,name:asc,createdAt' \
    --storeId 'xJeFxhgTwyO51CUp' \
    --tags 'cdxL0a9VDhrqWCTX' \
    > test.out 2>&1
eval_tap $? 363 'PublicQueryItems' test.out

#- 364 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'OxQUpyFgZhNpOTE4' \
    --region 'toH57yr01N33p1Gh' \
    --storeId 'a8HwpagvERZI6Cqh' \
    --sku 'cknhecNv2Tw6YKhV' \
    > test.out 2>&1
eval_tap $? 364 'PublicGetItemBySku' test.out

#- 365 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'rYkMqXkQ7qlaJjSY' \
    --storeId 'EseBYCFGoKpXx60G' \
    --itemIds 'mEX9x2BYpyKEBQ7T' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetEstimatedPrice' test.out

#- 366 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'W7lZvDbwFJJhBRdq' \
    --region '8BgAI81k4Gr7jVVx' \
    --storeId '5l3yrH9HR4reG0Hw' \
    --itemIds 'UXxQTf5YpDUGYsJB' \
    > test.out 2>&1
eval_tap $? 366 'PublicBulkGetItems' test.out

#- 367 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["EkYUrLv4qUiTkFcL", "Brg2JB0WiCpVBwvA", "ffJ3btt0PpQY3Pnn"]}' \
    > test.out 2>&1
eval_tap $? 367 'PublicValidateItemPurchaseCondition' test.out

#- 368 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'CODE' \
    --limit '9' \
    --offset '4' \
    --region 'J4qy4PIKleuV271b' \
    --storeId 'wZ4niLSzQnv0C00d' \
    --keyword 'tNGGzbGYSYo9fY2E' \
    --language 'BZAHQXc4Xcae7VKl' \
    > test.out 2>&1
eval_tap $? 368 'PublicSearchItems' test.out

#- 369 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId '0ARzGEArlfE1NSmt' \
    --namespace "$AB_NAMESPACE" \
    --language 'cADoZvd0La7P4JI4' \
    --region 'H7uDzkOHTdnUtdrR' \
    --storeId 'cs3GeOsKPNlG7rEX' \
    > test.out 2>&1
eval_tap $? 369 'PublicGetApp' test.out

#- 370 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'i6LEqJERpbxEq07t' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 370 'PublicGetItemDynamicData' test.out

#- 371 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'xnvZZeAf7QBuZK5G' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'JlBncg8tQnJOKHC1' \
    --populateBundle  \
    --region '6xjJZ4kiU3N8556l' \
    --storeId 'l2LQWpdESOBV7wZJ' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetItem' test.out

#- 372 GetPaymentCustomization
eval_tap 0 372 'GetPaymentCustomization # SKIP deprecated' test.out

#- 373 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "sg7wSv9lyRyTdYBU", "paymentProvider": "CHECKOUT", "returnUrl": "TV1BwgkLDj4pjVkt", "ui": "yoNSsEHlzyd0Sark", "zipCode": "hltUxgbN5eElQNES"}' \
    > test.out 2>&1
eval_tap $? 373 'PublicGetPaymentUrl' test.out

#- 374 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'FLD8hCc9onSNjbQE' \
    > test.out 2>&1
eval_tap $? 374 'PublicGetPaymentMethods' test.out

#- 375 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'qFGwnDG8kz4kvEv6' \
    > test.out 2>&1
eval_tap $? 375 'PublicGetUnpaidPaymentOrder' test.out

#- 376 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'tNjGRhrmRAxRGeIK' \
    --paymentProvider 'ALIPAY' \
    --zipCode 'lCJmDXpjyvLSHB1y' \
    --body '{"token": "3klHuAGnidOyGuS0"}' \
    > test.out 2>&1
eval_tap $? 376 'Pay' test.out

#- 377 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'OG7ohiL2943ClrNh' \
    > test.out 2>&1
eval_tap $? 377 'PublicCheckPaymentOrderPaidStatus' test.out

#- 378 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'XSOLLA' \
    --region 'riCaNp8dUBDinAB6' \
    > test.out 2>&1
eval_tap $? 378 'GetPaymentPublicConfig' test.out

#- 379 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'HqIWIi5Bvb1rcuEt' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetQRCode' test.out

#- 380 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'WAF763kci7lT62BO' \
    --foreinginvoice 'Haso53W3U2Mu9ZGM' \
    --invoiceId 'Wou1U0RVCf3gMWDA' \
    --payload 'odCKqfqzeexHA70N' \
    --redirectResult 'gJTxjtzgO7W3taRv' \
    --resultCode 'J6lKWJwHO65aOFDw' \
    --sessionId 'pqy7XOU3DwglyMGN' \
    --status 'll4O8ELahcNJqRje' \
    --token 'pck1l0qxRyQ2pi7x' \
    --type 'uAufJakIPXOQznHZ' \
    --userId 'Tj8oYfWObyNJKVSQ' \
    --orderNo 'saCokoGynp6xcqNK' \
    --paymentOrderNo 'JnAhrSt96OaARAjH' \
    --paymentProvider 'CHECKOUT' \
    --returnUrl 'V3sNxS8uLBZiVRYI' \
    > test.out 2>&1
eval_tap $? 380 'PublicNormalizePaymentReturnUrl' test.out

#- 381 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'yQLcslTEqgVNG8Aq' \
    --paymentOrderNo 'ktgvjwNJAwIpEy2Z' \
    --paymentProvider 'CHECKOUT' \
    > test.out 2>&1
eval_tap $? 381 'GetPaymentTaxValue' test.out

#- 382 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'pojZ24I2n25smsrm' \
    > test.out 2>&1
eval_tap $? 382 'GetRewardByCode' test.out

#- 383 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'JFHGiYnyhbqxLuTZ' \
    --limit '71' \
    --offset '14' \
    --sortBy 'namespace,rewardCode' \
    > test.out 2>&1
eval_tap $? 383 'QueryRewards1' test.out

#- 384 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'kTsAThLyflAqqAP4' \
    > test.out 2>&1
eval_tap $? 384 'GetReward1' test.out

#- 385 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 385 'PublicListStores' test.out

#- 386 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'M78smYdyge6DroOy,wOxI4G6jZzoYIFAv,YfT8XQw2EOq6BFjm' \
    --itemIds 'N4OqKGLRpNWzKZtZ,nxgywmr4CYNGm7Tk,1mMyeNRsjQuDEgO3' \
    --skus 'MEQNL6ijLRvQOgoa,BooTawHLMxhx9nC3,o6pXU5MDJLCB6WbX' \
    > test.out 2>&1
eval_tap $? 386 'PublicExistsAnyMyActiveEntitlement' test.out

#- 387 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'WIRpgjooaBVemsbk' \
    > test.out 2>&1
eval_tap $? 387 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 388 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --itemId 'XPFWFaKbDgrGkv8S' \
    > test.out 2>&1
eval_tap $? 388 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 389 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'OeaPAyPeEGBepK1I' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 390 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'x4SwjCYjCHniVSn1,gYGal5NrBtT0om9O,lGzpF25qu98RhktX' \
    --itemIds '6qwkXbCLbh8t0zPk,QWRUlgE0kxzFMq9t,tbEHAEV7C65Ans9S' \
    --skus 'quNSJIay5VdUdYy9,Y9OCSmmT3WKijbqh,T3uyQRXvvcUYDeWP' \
    > test.out 2>&1
eval_tap $? 390 'PublicGetEntitlementOwnershipToken' test.out

#- 391 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "Z8yhwQ0gIdj1lTJd", "language": "dmMx-FDlf_460", "region": "o8TITYiHSR2SEJh1"}' \
    > test.out 2>&1
eval_tap $? 391 'SyncTwitchDropsEntitlement' test.out

#- 392 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'YDedZdNqkXPWZfT8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 392 'PublicGetMyWallet' test.out

#- 393 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZfdKp9q4nXuK0tJA' \
    --body '{"epicGamesJwtToken": "Yror2XdtSCG7ZExO"}' \
    > test.out 2>&1
eval_tap $? 393 'SyncEpicGameDLC' test.out

#- 394 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'oIpWzacOvwUsnIbQ' \
    > test.out 2>&1
eval_tap $? 394 'SyncOculusDLC' test.out

#- 395 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'M3ZAtyEWKWoZRUL7' \
    --body '{"serviceLabel": 45}' \
    > test.out 2>&1
eval_tap $? 395 'PublicSyncPsnDlcInventory' test.out

#- 396 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'oj5RvEtXiKyUGdNf' \
    --body '{"serviceLabels": [80, 17, 39]}' \
    > test.out 2>&1
eval_tap $? 396 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 397 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'wgSvsTRmJsOm0wVF' \
    --body '{"appId": "yHvFhRMCFJuA0DEM", "steamId": "gykqqjoHTpIPMSRA"}' \
    > test.out 2>&1
eval_tap $? 397 'SyncSteamDLC' test.out

#- 398 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'uPI7mSZQ5UDm1q51' \
    --body '{"xstsToken": "PlW2HG8LAiIzuo32"}' \
    > test.out 2>&1
eval_tap $? 398 'SyncXboxDLC' test.out

#- 399 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '1Ll90IBFsSb3FsV2' \
    --appType 'DLC' \
    --entitlementClazz 'CODE' \
    --entitlementName 'Cs9R0D5jZEwxcow6' \
    --features 'L7c3COEP4AZx70uw,V4XgvGTMHkXeEwuF,Jf7tbq5KikDE7hWv' \
    --itemId 'T5bzcfzIpL2pWB4X,sdrxIF6kEAmKGNEm,FPcUALNziO9Bz2wx' \
    --limit '25' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 399 'PublicQueryUserEntitlements' test.out

#- 400 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'bu7RrD9a5mdlXTCL' \
    --appId '467xHbAiD3Pr3mXZ' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetUserAppEntitlementByAppId' test.out

#- 401 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'O1PnbSlfVRlAI8F2' \
    --limit '12' \
    --offset '24' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 401 'PublicQueryUserEntitlementsByAppType' test.out

#- 402 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'o94gS5DHLB65fxQ0' \
    --availablePlatformOnly  \
    --ids '6GwTmobiBnfrnq9k,OFBWhUTPiKR3qcbH,LGplYsS3jsRZffCd' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetUserEntitlementsByIds' test.out

#- 403 PublicGetUserEntitlementByItemId
eval_tap 0 403 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 404 PublicGetUserEntitlementBySku
eval_tap 0 404 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 405 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '00VrgPuNtOv3jbhG' \
    --endDate 'BuW8KcyPMfDWSEEp' \
    --entitlementClazz 'MEDIA' \
    --limit '28' \
    --offset '73' \
    --startDate 'jqeKssQpme6eyM48' \
    > test.out 2>&1
eval_tap $? 405 'PublicUserEntitlementHistory' test.out

#- 406 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'tE7eJRsXNeveQXqn' \
    --appIds 'FRYmEIX40XOUoLOa,7oDz00gxcoaH6u9T,Vf4DvEzpoPRiClZ6' \
    --itemIds 'rlwX99AHMLHqguYy,kVWzNwPcvGyieBsR,UduW5lxSlorWEGN5' \
    --skus 'bPGSOSiiItrSrEJM,BAIwTLkrMDFQfpQ9,o0GJMTfqRRaZozM8' \
    > test.out 2>&1
eval_tap $? 406 'PublicExistsAnyUserActiveEntitlement' test.out

#- 407 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'xCBoaS2FMwfWNCbN' \
    --appId '5GelVOU0hHnsCl5k' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 408 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '6Jxh5mkmQzKg0jWC' \
    --entitlementClazz 'CODE' \
    --itemId 'LmdnOPkIT1C6KGTp' \
    > test.out 2>&1
eval_tap $? 408 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 409 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'A7JZ6xullPROSfiW' \
    --ids '9zcxmgNfTHu3vkZt,9FgWckjNpHhM2ZXp,4N0ROmUCTrS7Gi9I' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 410 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'igk9vamO7Q2WQwSW' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'evbRov7Bm40CtZiA' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 411 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'xk43DGV1SCkw8U0d' \
    --namespace "$AB_NAMESPACE" \
    --userId '4FvVmPMtpRMWSQ8S' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetUserEntitlement' test.out

#- 412 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'zi1IrGidRmR5BGRJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hFwxmkGfPI3j4luX' \
    --body '{"options": ["QuuLtYa86kvL6cBZ", "QssUUXOsXMNdvW1h", "bvGenRbm3QtsY5Wa"], "requestId": "KM5YY6pYrmeMIHLS", "useCount": 34}' \
    > test.out 2>&1
eval_tap $? 412 'PublicConsumeUserEntitlement' test.out

#- 413 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'egV8XhgDjbrum8Ux' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cutmVg8APWKxoj6M' \
    --body '{"requestId": "F68VuKDoklYmkytC", "useCount": 55}' \
    > test.out 2>&1
eval_tap $? 413 'PublicSellUserEntitlement' test.out

#- 414 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'TXNhN8y1PVriIyv9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kjuiAGiXx47etMik' \
    --body '{"useCount": 78}' \
    > test.out 2>&1
eval_tap $? 414 'PublicSplitUserEntitlement' test.out

#- 415 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'A6Mv9Nzs19eBq9a1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'L8S1yduOwscICro6' \
    --body '{"entitlementId": "P8FWIPeqaBeD2uBA", "useCount": 44}' \
    > test.out 2>&1
eval_tap $? 415 'PublicTransferUserEntitlement' test.out

#- 416 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'oIwQBeIALI8JNIII' \
    --body '{"code": "4jrzrPsuMziNM8AB", "language": "tYDJ", "region": "1MOpmm04BlZUAlYn"}' \
    > test.out 2>&1
eval_tap $? 416 'PublicRedeemCode' test.out

#- 417 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'CT11qD03er5mdraK' \
    --body '{"excludeOldTransactions": false, "language": "DHYs", "productId": "sVlo3aVOGARFDJcG", "receiptData": "Wy826ilCxAxQUM5D", "region": "yrPfBmpZIzSFUZqV", "transactionId": "R5FWGfH66eFCMTsL"}' \
    > test.out 2>&1
eval_tap $? 417 'PublicFulfillAppleIAPItem' test.out

#- 418 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'A8vYVvrIAEehUV0j' \
    --body '{"epicGamesJwtToken": "sjAyVgxS54NNs3Xd"}' \
    > test.out 2>&1
eval_tap $? 418 'SyncEpicGamesInventory' test.out

#- 419 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'hMbQX9D1znEWw9p7' \
    --body '{"autoAck": false, "language": "gw_duRl_Zr", "orderId": "c34xF8qFllM1LTrl", "packageName": "4MP3Nl4T3ujvV7W6", "productId": "ADLtn7oInn1Bz3wM", "purchaseTime": 36, "purchaseToken": "BI51etn17OcmSVHZ", "region": "6wtPVAwgvxYxXJTd"}' \
    > test.out 2>&1
eval_tap $? 419 'PublicFulfillGoogleIAPItem' test.out

#- 420 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'uZp1nNYHREmm1cBu' \
    > test.out 2>&1
eval_tap $? 420 'SyncOculusConsumableEntitlements' test.out

#- 421 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'aRaGeM8yxRfejqSb' \
    --body '{"currencyCode": "VgLd1FoyNFGpu5r2", "price": 0.5901433868922767, "productId": "0IvVg5LwUygH98dz", "serviceLabel": 94}' \
    > test.out 2>&1
eval_tap $? 421 'PublicReconcilePlayStationStore' test.out

#- 422 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'NePjLJQJXwUApJWo' \
    --body '{"currencyCode": "hXn01RB7pu7BaONX", "price": 0.3976680015300591, "productId": "E5fIDbsMi48xOYVv", "serviceLabels": [6, 70, 63]}' \
    > test.out 2>&1
eval_tap $? 422 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 423 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'xqCMSpZxby2J9vGO' \
    --body '{"appId": "UeSeGb02vDPUpv5V", "currencyCode": "EdIG82dpIbfxVFfd", "language": "lrw", "price": 0.6659064693109115, "productId": "Qw3MVXe4xBPDWHRH", "region": "CCVDBRjPUQWYVxGQ", "steamId": "VFJlDDJ7z4Pb5jyG"}' \
    > test.out 2>&1
eval_tap $? 423 'SyncSteamInventory' test.out

#- 424 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ID39Ung1D57FjYKl' \
    --body '{"gameId": "JiRIvhej77OSPwdz", "language": "htbN-UrET", "region": "AdTUGpd8KFrXKFA2"}' \
    > test.out 2>&1
eval_tap $? 424 'SyncTwitchDropsEntitlement1' test.out

#- 425 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'gdjQCYoE8b0CZetL' \
    --body '{"currencyCode": "fpFNyp7375rhOmR4", "price": 0.41768801324407634, "productId": "FjoJZVKZjOD2ePKA", "xstsToken": "KYjJMVnYj2yKqavW"}' \
    > test.out 2>&1
eval_tap $? 425 'SyncXboxInventory' test.out

#- 426 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'pydepM3ap069B9Ok' \
    --discounted  \
    --itemId 'r0xJ5XRZVoxPGOLV' \
    --limit '57' \
    --offset '35' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 426 'PublicQueryUserOrders' test.out

#- 427 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '9yJIveX52r6Inl9V' \
    --body '{"currencyCode": "TJB9Al3mn2DsHDHz", "discountCodes": ["SVJzhU5Z44zgZ1fi", "RZZaUccuBYep9n7b", "eLdl3Y82DOj5kPuN"], "discountedPrice": 43, "ext": {"7fsblalJrwQiU3DD": {}, "0xZFH1fHFLSr0O4r": {}, "EZTbFDj2L2McvCrr": {}}, "itemId": "R7h9uKLXDaRf3pxK", "language": "qkC", "price": 87, "quantity": 99, "region": "luCwKrt6wn3yVrRC", "returnUrl": "h6j7rpv8K8fBAeRa", "sectionId": "1R6ksxLYGkOLgRef"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicCreateUserOrder' test.out

#- 428 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'f5IHxLJIemNHbzgA' \
    --body '{"currencyCode": "FjtjC7suvgIUkB2P", "discountCodes": ["0dPVMd2WDUVEQTpf", "AGJqOrkdlZB246OY", "yAIoF7qsANBbEKQr"], "discountedPrice": 14, "itemId": "O5hQAl6U2g9imVMh", "price": 17, "quantity": 51}' \
    > test.out 2>&1
eval_tap $? 428 'PublicPreviewOrderPrice' test.out

#- 429 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '7j095rDL6lEuB1ZI' \
    --userId 'MIs1dFvYokH9t2u8' \
    > test.out 2>&1
eval_tap $? 429 'PublicGetUserOrder' test.out

#- 430 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZZnyHKkk6Gh25tEc' \
    --userId 'X9GegDnrYz0GFpSV' \
    > test.out 2>&1
eval_tap $? 430 'PublicCancelUserOrder' test.out

#- 431 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'dxFsXAp1roclyXll' \
    --userId 'FitPamSKRzDIZgSk' \
    > test.out 2>&1
eval_tap $? 431 'PublicGetUserOrderHistories' test.out

#- 432 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '6suS90ZbDdmjU11Q' \
    --userId 'IZtkSn8QRbA5V4gj' \
    > test.out 2>&1
eval_tap $? 432 'PublicDownloadUserOrderReceipt' test.out

#- 433 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wv1W6cqnvSuKswQ7' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetPaymentAccounts' test.out

#- 434 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'vH8GScnP5QzRBY1U' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'bq3Qcrtt8L5dIebs' \
    > test.out 2>&1
eval_tap $? 434 'PublicDeletePaymentAccount' test.out

#- 435 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'w7EjkMnJSziEA43W' \
    --autoCalcEstimatedPrice  \
    --language 'qIMJdrqHIsJ98WRj' \
    --region 'qYieXRthQZvzRi7p' \
    --storeId 'qpajYEHs9TIkcnrJ' \
    --viewId '64BOKqywS6DKNSeb' \
    > test.out 2>&1
eval_tap $? 435 'PublicListActiveSections' test.out

#- 436 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '2UMWOgVeYkCvqq0t' \
    --chargeStatus 'CHARGED' \
    --itemId '5pEVG7sNihxpuuL7' \
    --limit '61' \
    --offset '47' \
    --sku 'JCxvzZnh8oBAk1MN' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 436 'PublicQueryUserSubscriptions' test.out

#- 437 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'CKWNkLU5ty3uQa7F' \
    --body '{"currencyCode": "l3ZhSMLtrwnjTJVD", "itemId": "lh112byTYCDBnAvf", "language": "lrQg-kdud", "region": "S03D7JLsIM3VOMRv", "returnUrl": "vqkXDMPzOB08tpk0", "source": "qhZath4b4HtwEYX5"}' \
    > test.out 2>&1
eval_tap $? 437 'PublicSubscribeSubscription' test.out

#- 438 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '5pJNTX1sDjSWiSXs' \
    --itemId 'V5rJ8eZXZ1TLMZnN' \
    > test.out 2>&1
eval_tap $? 438 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 439 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'L3DQK45IAtbyUDDS' \
    --userId 'JSV8pzl1lfIR7jne' \
    > test.out 2>&1
eval_tap $? 439 'PublicGetUserSubscription' test.out

#- 440 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'tIJPGObyWCLyFPHa' \
    --userId 'xkKxEDvSoi2X9Syg' \
    > test.out 2>&1
eval_tap $? 440 'PublicChangeSubscriptionBillingAccount' test.out

#- 441 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'vMG8QAaWUhIguMvK' \
    --userId 'DOrx0wQXKEroyKz2' \
    --body '{"immediate": true, "reason": "2oF99xI1VVtVrVT6"}' \
    > test.out 2>&1
eval_tap $? 441 'PublicCancelSubscription' test.out

#- 442 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Hn8B2d1hZUnoQwg5' \
    --userId 'uqgoHaFyoczck0qJ' \
    --excludeFree  \
    --limit '38' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 442 'PublicGetUserSubscriptionBillingHistories' test.out

#- 443 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'gZPfuelAiZBZcQGH' \
    --language 'HGI7csI8ecZSvzXY' \
    --storeId 'OytshBcKQytQagui' \
    > test.out 2>&1
eval_tap $? 443 'PublicListViews' test.out

#- 444 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '6lsKF28n7UC7y1MK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YVeoGFrDb8unXv1i' \
    > test.out 2>&1
eval_tap $? 444 'PublicGetWallet' test.out

#- 445 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'E7YgEZspOJ0NiZl6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OVLxKtkBpaCG8Nu5' \
    --limit '25' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 445 'PublicListUserWalletTransactions' test.out

#- 446 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'tQcDN7OMCehk42ac' \
    --baseAppId 'y8wsWaPyppR3ztPS' \
    --categoryPath 'ALA8LlV2sccbVr6H' \
    --features 'SiXVzrG4EdKn8eyp' \
    --includeSubCategoryItem  \
    --itemName 'TzI497DG0ZNoJvvi' \
    --itemStatus 'INACTIVE' \
    --itemType 'LOOTBOX' \
    --limit '9' \
    --offset '16' \
    --region '8rGEr3cilJWhaW6j' \
    --sectionExclusive  \
    --sortBy 'displayOrder:asc,displayOrder,createdAt:asc' \
    --storeId 'AutWDfVOINhql9Cd' \
    --tags 'DX4xiHpdfKH35RWU' \
    --targetNamespace 'UVEHCB5wzF6oLIrA' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 446 'QueryItems1' test.out

#- 447 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wjAsgo51XHJBG2Pm' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 447 'ImportStore1' test.out

#- 448 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yeFaBiT3SyLHXZSy' \
    --body '{"itemIds": ["fjukWmkfkiF2GZPu", "yWBVH66JU1IICVNN", "RV4lBToTcn1l44eb"]}' \
    > test.out 2>&1
eval_tap $? 448 'ExportStore1' test.out

#- 449 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rKEKdeo779KG5yCz' \
    --body '{"entitlementCollectionId": "9jVs1lYK1Mx9rEFk", "entitlementOrigin": "Steam", "metadata": {"5ALS7cneNLItUJgh": {}, "74tyxkTR8ZCVJtkx": {}, "jBJrNeQRsqkkKK2q": {}}, "origin": "Playstation", "rewards": [{"currency": {"currencyCode": "cCPaLXJM2B9bMohk", "namespace": "WsFKIdycYHQcu7Jk"}, "item": {"itemId": "KBcLFRf50Y7ME2Qm", "itemSku": "YiYqap7masUcayqm", "itemType": "p7vhz1T6cSrZL2Cg"}, "quantity": 69, "type": "CURRENCY"}, {"currency": {"currencyCode": "xdmYDj9vZNgfI1Ae", "namespace": "YHe8WPQGPclChxLf"}, "item": {"itemId": "bXrH6f2GDrNbLOjG", "itemSku": "z34ct0ctEeH43wYu", "itemType": "LnI7cTzIUERPlQI9"}, "quantity": 16, "type": "CURRENCY"}, {"currency": {"currencyCode": "Mc4NbiJWP5r9EwbI", "namespace": "GMGJ70P9IqAyNlZ2"}, "item": {"itemId": "OwFSebBkXkaxtY97", "itemSku": "TMJH8bO4GDHT6ZaU", "itemType": "UkvlTKAhrxqHw7f8"}, "quantity": 4, "type": "ITEM"}], "source": "OTHER", "transactionId": "ICgWFJZGnNa5yOM6"}' \
    > test.out 2>&1
eval_tap $? 449 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE