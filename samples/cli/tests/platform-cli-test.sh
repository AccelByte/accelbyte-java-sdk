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
echo "1..423"

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
    --body '{"description": "N9A3sNm84hddSpHt", "items": [{"extraSubscriptionDays": 7, "itemId": "P7MIIR7CkyF6C7du", "itemName": "uyZ0GhDogqrhBRd8", "quantity": 23}, {"extraSubscriptionDays": 59, "itemId": "MYzYiKWe5dNRljv7", "itemName": "IPrDQQRgat0SevkL", "quantity": 66}, {"extraSubscriptionDays": 79, "itemId": "nIuMBvaO35llzQRa", "itemName": "T5kPxUfofvnnSuB0", "quantity": 50}], "maxRedeemCountPerCampaignPerUser": 91, "maxRedeemCountPerCode": 78, "maxRedeemCountPerCodePerUser": 99, "maxSaleCount": 25, "name": "UlrMdI4sNveabntB", "redeemEnd": "1993-04-20T00:00:00Z", "redeemStart": "1982-06-14T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["Iv53HGCiljvjKoyD", "6SCwGrncqmLtjQHA", "f8TgoNm03VLisV6z"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'Vo3twu0MesTCf9x4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'rt69lna7qxNeIxPz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "6MbwL6IY69z1UaLq", "items": [{"extraSubscriptionDays": 31, "itemId": "SYWytLPziZMdjxcB", "itemName": "ZufQxGiHPllG4cYE", "quantity": 52}, {"extraSubscriptionDays": 12, "itemId": "o5Vwdo3fePqIJA8I", "itemName": "Htrkmu0hpDDWVAla", "quantity": 24}, {"extraSubscriptionDays": 43, "itemId": "5BYNtIuS5S5XUdjs", "itemName": "oqwGyzzWi9gwQYv7", "quantity": 39}], "maxRedeemCountPerCampaignPerUser": 50, "maxRedeemCountPerCode": 42, "maxRedeemCountPerCodePerUser": 30, "maxSaleCount": 98, "name": "TTr1DmrhZv15T7qu", "redeemEnd": "1988-02-12T00:00:00Z", "redeemStart": "1991-06-25T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["TVU6RBt0zYoMcHyC", "UEXlAvxJMdalwSyl", "iWMNW5NyLu0M3VHh"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId '2EI8JlDbPWbQ6Q9l' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetCampaignDynamic' test.out

#- 18 GetLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetLootBoxPluginConfig' test.out

#- 19 UpdateLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "NmqRBaAkLnvxkT1X"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "cmDc3fxU8MyKrQpM"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateLootBoxPluginConfig' test.out

#- 20 DeleteLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'DeleteLootBoxPluginConfig' test.out

#- 21 UplodLootBoxPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uplodLootBoxPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'UplodLootBoxPluginConfigCert' test.out

#- 22 GetLootBoxGrpcInfo
./ng net.accelbyte.sdk.cli.Main platform getLootBoxGrpcInfo \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 22 'GetLootBoxGrpcInfo' test.out

#- 23 GetSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetSectionPluginConfig' test.out

#- 24 UpdateSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "Dlym6puQ23xoJ8ae"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "F51TkhjYnaq6foWv"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateSectionPluginConfig' test.out

#- 25 DeleteSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'DeleteSectionPluginConfig' test.out

#- 26 UploadSectionPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadSectionPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 26 'UploadSectionPluginConfigCert' test.out

#- 27 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PUvmEejtGeoyIPa8' \
    > test.out 2>&1
eval_tap $? 27 'GetRootCategories' test.out

#- 28 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZRrvjj7il35MXbN9' \
    --body '{"categoryPath": "oCMNqq98SjTvhZNk", "localizationDisplayNames": {"SQ70D0H6BXksUC9b": "6i5lZC9xv32e8c5c", "sSovoqsZNBdte9ND": "UPVJf6c2Z0QZxfgP", "ubTDIHrvqAThuwjR": "HpKKTlmVr9XuoJbR"}}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCategory' test.out

#- 29 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FQSKVPHbn4Xxtu7L' \
    > test.out 2>&1
eval_tap $? 29 'ListCategoriesBasic' test.out

#- 30 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'QRENjEEztx1WsYSi' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Zqan0nSBJroav91G' \
    > test.out 2>&1
eval_tap $? 30 'GetCategory' test.out

#- 31 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'XlvPG6bFYReVHQip' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cCx9Zw5D2L7vIYhG' \
    --body '{"localizationDisplayNames": {"GSyEW4ZJJ42d3PBd": "dN8S48l9lyNApflx", "qMrj3oZk03QXcKMD": "YDDxHSZjtqXyJ58f", "7Gc26SaiGVkydwYW": "QG26yUZNmTBcvrbY"}}' \
    > test.out 2>&1
eval_tap $? 31 'UpdateCategory' test.out

#- 32 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'CwZtxFHyPLtI8ilb' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yDPUIj88cekdqCt8' \
    > test.out 2>&1
eval_tap $? 32 'DeleteCategory' test.out

#- 33 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath '1P1ktfIovmv9gsR5' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cJcHm3SZLxoRDFuu' \
    > test.out 2>&1
eval_tap $? 33 'GetChildCategories' test.out

#- 34 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'uySj29a9LJE8HoRS' \
    --namespace "$AB_NAMESPACE" \
    --storeId '1X2PFAAMwzHPxB1U' \
    > test.out 2>&1
eval_tap $? 34 'GetDescendantCategories' test.out

#- 35 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'skYs4Yw20DOqOBSC' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '18' \
    --code 'DKHRuPMMWH8Yb33T' \
    --limit '5' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 35 'QueryCodes' test.out

#- 36 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'eJ5i0EeDxOgBnhhq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 63}' \
    > test.out 2>&1
eval_tap $? 36 'CreateCodes' test.out

#- 37 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'WEi8KlloeH0JT1yd' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '41' \
    > test.out 2>&1
eval_tap $? 37 'Download' test.out

#- 38 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'T50x9WT0GfH2rtOa' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '38' \
    > test.out 2>&1
eval_tap $? 38 'BulkDisableCodes' test.out

#- 39 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'EXsXzOXQAk4mqrxz' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '94' \
    > test.out 2>&1
eval_tap $? 39 'BulkEnableCodes' test.out

#- 40 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId '4SqYUTLDx9gIiDan' \
    --namespace "$AB_NAMESPACE" \
    --code 'dpGT2t24aOMh5eC3' \
    --limit '71' \
    --offset '63' \
    --userId 'HeHSKLCa3xreNDUW' \
    > test.out 2>&1
eval_tap $? 40 'QueryRedeemHistory' test.out

#- 41 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'ehwH3q31A806DJga' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 41 'GetCode' test.out

#- 42 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 's4b6z3LNUj7fdgLA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DisableCode' test.out

#- 43 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code '84Z8YYk6QEgJjBbE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'EnableCode' test.out

#- 44 GetServicePluginConfig
eval_tap 0 44 'GetServicePluginConfig # SKIP deprecated' test.out

#- 45 UpdateServicePluginConfig
eval_tap 0 45 'UpdateServicePluginConfig # SKIP deprecated' test.out

#- 46 DeleteServicePluginConfig
eval_tap 0 46 'DeleteServicePluginConfig # SKIP deprecated' test.out

#- 47 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 47 'ListCurrencies' test.out

#- 48 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "ULdJz4mnRBkMNxvv", "currencySymbol": "KgAT8mJrYq6hRklo", "currencyType": "VIRTUAL", "decimals": 54, "localizationDescriptions": {"xM3gpwxcfMy9Xzjj": "I5YbsKoADkzJEN2V", "Hzih3bit0VWn3CO3": "9PXDNxtXgeO3FgkX", "hjDzaQY3snn2ZkP7": "cFdP43e5dC9XIBud"}}' \
    > test.out 2>&1
eval_tap $? 48 'CreateCurrency' test.out

#- 49 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'fZgrbHDIDm4hMzF4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"TxodenSrUTvfqU0b": "foMm5cTtFWbotQyX", "JRcQWsmqPNs92epx": "k0i8VxsZNereSvf9", "699mCEHThUJkETAs": "Sp7gh4TeUTkOkAYf"}}' \
    > test.out 2>&1
eval_tap $? 49 'UpdateCurrency' test.out

#- 50 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'JB8AT9t4Tv207Y2Q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteCurrency' test.out

#- 51 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'D3oD5fLCr3OOlXVv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'GetCurrencyConfig' test.out

#- 52 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode '8ZGF7uYnGzpipNDi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetCurrencySummary' test.out

#- 53 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'GetDLCItemConfig' test.out

#- 54 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "gNJma1MbqqZtfNWq", "rewards": [{"currency": {"currencyCode": "l4nmwAft4gqkNNlW", "namespace": "kD9eOziYRFOn0jJL"}, "item": {"itemId": "HC9LxhvNXTwGBCto", "itemSku": "hLtl9Zuhytm5UDrT", "itemType": "6QXCs5SPBbRPZTF6"}, "quantity": 30, "type": "ITEM"}, {"currency": {"currencyCode": "QAXVG7tnsZg5QgXj", "namespace": "vyGJPN4eXbJE5Vs2"}, "item": {"itemId": "GcyomQoIXimBJehy", "itemSku": "xlNsjUgxBkF6wFPo", "itemType": "JeQediogEhhM2rIi"}, "quantity": 51, "type": "CURRENCY"}, {"currency": {"currencyCode": "BHUTrDzZSKscfOcY", "namespace": "u3dpCROYqUiGKXVF"}, "item": {"itemId": "Cmpo6sPwVOEDSJsE", "itemSku": "K5QpNhlI2iS5EpGh", "itemType": "hvXYck0upMzUYnb7"}, "quantity": 82, "type": "ITEM"}]}, {"id": "RxpzwLR2AK6eXUGP", "rewards": [{"currency": {"currencyCode": "Jsw1fiP80G9Pclxc", "namespace": "ft2ulIJzPyrVEiOG"}, "item": {"itemId": "4UcqsuGKHhMRWLVd", "itemSku": "3DlhLuIpomM8sm1M", "itemType": "iaI1mX2tJoARtdbB"}, "quantity": 9, "type": "ITEM"}, {"currency": {"currencyCode": "7udsMrok0WvGYYnx", "namespace": "4V709xbnGezKsDwG"}, "item": {"itemId": "2omOR2nvYI9TVqJd", "itemSku": "vzcWbfUpaXp5JMl5", "itemType": "LL4bTxBmZjdrrIxs"}, "quantity": 56, "type": "CURRENCY"}, {"currency": {"currencyCode": "0NRsB1fPqqRRulpq", "namespace": "pymDkQhtrHWwRVnw"}, "item": {"itemId": "VBOqOHi8pWGd1juY", "itemSku": "hiqjRJOqB5F93zFQ", "itemType": "bJndUDpdONneAczb"}, "quantity": 57, "type": "CURRENCY"}]}, {"id": "dHb2slt71B1SmZp2", "rewards": [{"currency": {"currencyCode": "JZp50CnPb71ORYcm", "namespace": "QbTU5JX8ccLjMXJR"}, "item": {"itemId": "k0eaKQDOJvrTefgl", "itemSku": "Ss6g4iY9u02aCNYI", "itemType": "Wekp18lOC3mNqF7B"}, "quantity": 24, "type": "ITEM"}, {"currency": {"currencyCode": "0LcghVHfPEspxwhR", "namespace": "ON0bc1eMbEIjowLq"}, "item": {"itemId": "c3ecjXJbZDKKoxLE", "itemSku": "1Y3Dymtj3giPg4x4", "itemType": "yiPX6ues1Hhhkg1y"}, "quantity": 76, "type": "CURRENCY"}, {"currency": {"currencyCode": "bLFzHEP8cM4NTwr0", "namespace": "KHaAsmTej52WKi6t"}, "item": {"itemId": "ArAURt9plCSVq8Pd", "itemSku": "H6hJPUAc0RVwXgAg", "itemType": "ntLMCuaXBWQi6BqP"}, "quantity": 13, "type": "CURRENCY"}]}]}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateDLCItemConfig' test.out

#- 55 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'DeleteDLCItemConfig' test.out

#- 56 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetPlatformDLCConfig' test.out

#- 57 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"2XcrciYNEzvSZIPk": "hSgORcz5S5BvmgBL", "xh4ijFnE3Tam69qS": "Z7PC6f6QkmZXElW9", "YfRSse6AAz3S4czz": "0QKFlAVmVLu4AOec"}}, {"platform": "XBOX", "platformDlcIdMap": {"z8eBeeoip68J1nsv": "4W2OJhtafxMSJlHe", "b34sZKHcl5LLLOex": "L4fZvWtND2tcBFpX", "8lNtFEJ7tnkY6Mca": "5afj12K2IzrBvvWm"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"udE0OXudXgNne8kJ": "ATwlc6esUp6Sw1I9", "8jeZQ7hfxnhLd3Kn": "aknoed9DHhLOqQGh", "CUr6iTrjyEgarAdN": "JOIG36I6tRbRcrEv"}}]}' \
    > test.out 2>&1
eval_tap $? 57 'UpdatePlatformDLCConfig' test.out

#- 58 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'DeletePlatformDLCConfig' test.out

#- 59 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'MdAdiPKDUVSC00PY' \
    --itemId 'eDcagginxnFIna3y,ddcbsPheTH26IUJN,vYuGRUvpZaHCuESO' \
    --limit '16' \
    --offset '0' \
    --userId 'IZsMfB4ZH3mtgWgU' \
    > test.out 2>&1
eval_tap $? 59 'QueryEntitlements' test.out

#- 60 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds '4pCAKxeE70CaunQN,xot371W9G4AvQkqs,Gnmyo5JJTUVmb8GE' \
    --limit '0' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 60 'QueryEntitlements1' test.out

#- 61 GrantEntitlements
./ng net.accelbyte.sdk.cli.Main platform grantEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlementGrantList": [{"endDate": "1987-05-02T00:00:00Z", "grantedCode": "lEMEsFzYqwgK1Np5", "itemId": "nodqpLm7FhJBNXzA", "itemNamespace": "FdO0Khqf6kiTdSGv", "language": "nL", "quantity": 54, "region": "xL6ozRmDD0jJvlfV", "source": "REFERRAL_BONUS", "startDate": "1992-04-25T00:00:00Z", "storeId": "emPYdYT7DROCjtuz"}, {"endDate": "1987-03-05T00:00:00Z", "grantedCode": "MbAG9YI89hmguB8F", "itemId": "OTjMLo4b9rIzqYkE", "itemNamespace": "pstyVTBcrM8rG0rH", "language": "azC-lXxq", "quantity": 32, "region": "MK6MbGIVIu8vvwLc", "source": "PROMOTION", "startDate": "1999-08-04T00:00:00Z", "storeId": "uVoJXTIMtpgkieDy"}, {"endDate": "1987-07-24T00:00:00Z", "grantedCode": "7lGdMiHKxbWCYzo8", "itemId": "yO2KTK9tmmOnYnOp", "itemNamespace": "as6ghP1y4Zi7s7QB", "language": "GL_718", "quantity": 1, "region": "ZgKg4uKxaCgcGLuC", "source": "PURCHASE", "startDate": "1971-03-18T00:00:00Z", "storeId": "rWdTYCfHkIySok5D"}], "userIds": ["iXZtLW87rGysryod", "3dNQrmsApRA6HX3R", "wrKt2ecozL0TOg54"]}' \
    > test.out 2>&1
eval_tap $? 61 'GrantEntitlements' test.out

#- 62 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["vCE48L5oLF6M4lNa", "4JUMSHNgqRqCV7us", "amANkZlOX9Sfo95H"]' \
    > test.out 2>&1
eval_tap $? 62 'RevokeEntitlements' test.out

#- 63 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'gXqKhTPkwfLM9uSy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'GetEntitlement' test.out

#- 64 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '89' \
    --status 'FAIL' \
    --userId 'zWek2gZvRrvr0n9d' \
    > test.out 2>&1
eval_tap $? 64 'QueryFulfillmentHistories' test.out

#- 65 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime '9lvccKMLhrTrcBE2' \
    --eventType 'OTHER' \
    --externalOrderId 'tBS3KtKZWe8aoFzA' \
    --limit '49' \
    --offset '57' \
    --startTime 'BME74HUtipUWYhWV' \
    --status 'INIT' \
    --userId 'qx8CzPML52faXUr9' \
    > test.out 2>&1
eval_tap $? 65 'QueryIAPClawbackHistory' test.out

#- 66 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "Sk4lq2faBcAXXKlh", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 45, "clientTransactionId": "OUn18G5MlfDTk8aG"}, {"amountConsumed": 90, "clientTransactionId": "0NlncceIZSwgAIkg"}, {"amountConsumed": 51, "clientTransactionId": "Y8VnocGAjci0V3tB"}], "entitlementId": "f2jnHGKXphn50c9t", "usageCount": 80}, {"clientTransaction": [{"amountConsumed": 64, "clientTransactionId": "LDljhZ2jxLRX3z46"}, {"amountConsumed": 84, "clientTransactionId": "B5BUXvjcu2s6w3Vi"}, {"amountConsumed": 10, "clientTransactionId": "jrERHEonAZR8GmEu"}], "entitlementId": "0q1p6QCyY6vSkVFW", "usageCount": 6}, {"clientTransaction": [{"amountConsumed": 11, "clientTransactionId": "sbYuVEGVxYheR3j5"}, {"amountConsumed": 26, "clientTransactionId": "aZPV87pna08gxefT"}, {"amountConsumed": 89, "clientTransactionId": "KhuxaEc7M4P7UckS"}], "entitlementId": "C6ePeN8i4GrFES9z", "usageCount": 48}], "purpose": "3BAHZ7c53q7akMpc"}, "originalTitleName": "mnnx6RVBrop9v7aZ", "paymentProductSKU": "K3h65hbN15zfQSfQ", "purchaseDate": "rtfF3TQN0OcNDLr3", "sourceOrderItemId": "6vzohZyjMQAg5mPY", "titleName": "hrLTyU8OhgfY9JQY"}, "eventDomain": "GF4bYXEcENx9xZlA", "eventSource": "chob44lONDDwMvgI", "eventType": "0HlyPR7wZNiVsF6x", "eventVersion": 66, "id": "0meGelYF5wWaDhuk", "timestamp": "U4khGG4vZFTYnPkm"}' \
    > test.out 2>&1
eval_tap $? 66 'MockPlayStationStreamEvent' test.out

#- 67 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetAppleIAPConfig' test.out

#- 68 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "Su4PWam1jxR7SETW", "password": "jteoc8fgvZDDhoO0"}' \
    > test.out 2>&1
eval_tap $? 68 'UpdateAppleIAPConfig' test.out

#- 69 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeleteAppleIAPConfig' test.out

#- 70 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'GetEpicGamesIAPConfig' test.out

#- 71 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "5oKqymxLD1Lcvw6T"}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateEpicGamesIAPConfig' test.out

#- 72 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'DeleteEpicGamesIAPConfig' test.out

#- 73 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'GetGoogleIAPConfig' test.out

#- 74 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "6mZEiwxxElpMYSWI", "serviceAccountId": "eVzm7z9noowmlTIK"}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateGoogleIAPConfig' test.out

#- 75 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'DeleteGoogleIAPConfig' test.out

#- 76 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 76 'UpdateGoogleP12File' test.out

#- 77 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'GetIAPItemConfig' test.out

#- 78 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "Vowi0RY2VN4ZONJR", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"7l2Zsrh90ETtYmGu": "kz3MnlrjcHp6B8Vj", "7rXFgDnDkdZ9bpjb": "1tdA3QhjCMW64f4X", "hIjSoTB2NMKtezap": "Pr2QEPx3zTxBGtEJ"}}, {"itemIdentity": "IYppuUSsKoHw2hyd", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"2uSE7BEv3aevq6io": "hU1cg4W1IS3Uv1Bp", "WoJBaqdg2FHcunsS": "1lnaO2m9vqjhbeK2", "qN8g6x2PyYDo5R3h": "LiD5sf5y1JsxJNGm"}}, {"itemIdentity": "yt0SQDUDoWBZVGLl", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"zPAANjfBoldFOyqA": "2clJ5gEOaCgM6Yn6", "RugbNEIpGBFUjOn5": "mM7k8nbLzvtCIW5y", "nMKquUicAeIVXtoW": "AXhMlW4tLqX7OICf"}}]}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateIAPItemConfig' test.out

#- 79 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'DeleteIAPItemConfig' test.out

#- 80 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 80 'GetOculusIAPConfig' test.out

#- 81 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "5oD1e6oI9FmYel0k", "appSecret": "Ow72o8Zkgk0jS6rD"}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateOculusIAPConfig' test.out

#- 82 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'DeleteOculusIAPConfig' test.out

#- 83 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'GetPlayStationIAPConfig' test.out

#- 84 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "WUwfhKvrf2AaH4yC", "backOfficeServerClientSecret": "WrHSppnIZkNnTn3r", "enableStreamJob": true, "environment": "j2jZtEYT8sIPSE1X", "streamName": "XPzySa0sZoFS6xCO", "streamPartnerName": "WMpyh9pMsQgb64EL"}' \
    > test.out 2>&1
eval_tap $? 84 'UpdatePlaystationIAPConfig' test.out

#- 85 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'DeletePlaystationIAPConfig' test.out

#- 86 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 86 'ValidateExistedPlaystationIAPConfig' test.out

#- 87 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "bzDMwyo4nIRysQdb", "backOfficeServerClientSecret": "ufXjYnSoIFeouC2m", "enableStreamJob": true, "environment": "8kXrDZWlGVE9sJ4N", "streamName": "pUtKp6M9I6nEwnZh", "streamPartnerName": "sjwJeGwaPSDMZz95"}' \
    > test.out 2>&1
eval_tap $? 87 'ValidatePlaystationIAPConfig' test.out

#- 88 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'GetSteamIAPConfig' test.out

#- 89 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "OYKiqaZD63xe5rru", "publisherAuthenticationKey": "JVfLGea0ZtlzUcuH"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateSteamIAPConfig' test.out

#- 90 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'DeleteSteamIAPConfig' test.out

#- 91 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 91 'GetTwitchIAPConfig' test.out

#- 92 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "AXz0UV31MfuGaXsA", "clientSecret": "uGsZaSHevO0TQNEI", "organizationId": "3kfabxJWWSI1ECUo"}' \
    > test.out 2>&1
eval_tap $? 92 'UpdateTwitchIAPConfig' test.out

#- 93 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'DeleteTwitchIAPConfig' test.out

#- 94 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'GetXblIAPConfig' test.out

#- 95 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "1NPpeFhUztXDgB7n"}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateXblIAPConfig' test.out

#- 96 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'DeleteXblAPConfig' test.out

#- 97 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password '4C97uAPP8PATLpUp' \
    > test.out 2>&1
eval_tap $? 97 'UpdateXblBPCertFile' test.out

#- 98 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'xeJlsBJT6Hh3OMjA' \
    --itemId 'jq2mK8lbSEEelxnb' \
    --itemType 'SUBSCRIPTION' \
    --endTime '6bswAgt65X4N1LQZ' \
    --startTime 'mB61JMdtwCVUrYQu' \
    > test.out 2>&1
eval_tap $? 98 'DownloadInvoiceDetails' test.out

#- 99 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'e84dwmbwFEnAZaWs' \
    --itemId 'QJtRYoagRJK5PX9U' \
    --itemType 'APP' \
    --endTime '6URT95XhnUcvWB28' \
    --startTime 'MpusuhhDJ5slzgiW' \
    > test.out 2>&1
eval_tap $? 99 'GenerateInvoiceSummary' test.out

#- 100 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZEtyd56LfxnbY97j' \
    --body '{"categoryPath": "jYgXchCbkXX26uEd", "targetItemId": "CfQaMAQuTKfC0I2k", "targetNamespace": "NjCMDtDMrentgn3D"}' \
    > test.out 2>&1
eval_tap $? 100 'SyncInGameItem' test.out

#- 101 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hqciwIeShF9RKb9v' \
    --body '{"appId": "vxuJlhXbWhbwPwTo", "appType": "SOFTWARE", "baseAppId": "Bg0tTJg46IewOXE2", "boothName": "AkCh3QIZsUf8lGFX", "categoryPath": "cmwTERHclOdxIwqe", "clazz": "jxe18rNdb8Otq6j1", "displayOrder": 25, "entitlementType": "DURABLE", "ext": {"qUav7k05HAQltnSo": {}, "jV4jT65yclX2FtAz": {}, "0vJjFIYWOaNdsimm": {}}, "features": ["ZkaXZ7vmiEd0JPxV", "kW2miH3xRHAKy4Qx", "yQpshaDwNqTbbFMX"], "flexible": true, "images": [{"as": "4VfkyrwpuXxbaERb", "caption": "fgPmi0eHkt1mr9EO", "height": 70, "imageUrl": "SiZNCxuogFteTHJe", "smallImageUrl": "4BhSSQkQD6WmOt6D", "width": 26}, {"as": "ufFVTOhvQpfbBke8", "caption": "aEdd36xj6wySoltD", "height": 48, "imageUrl": "Cvs78mcMdiS76YAp", "smallImageUrl": "GJ9ufwLYkqIgLuZS", "width": 12}, {"as": "hsQryiEtOAbpeUNf", "caption": "26UqkCfgCUYBn2xa", "height": 83, "imageUrl": "4lj8m3XEwP2b4gd3", "smallImageUrl": "xOeii8Jnmssep2xD", "width": 95}], "itemIds": ["NY0kABeGs9yxahld", "1pO0Gyf5PO3COyMv", "czgEpzZ3FbtxfhcR"], "itemQty": {"C7IVYa6iZ5uFRYNn": 44, "SHiWxF0YbuU5ar5q": 94, "1dMQ9Rrbk6C2cVWf": 89}, "itemType": "EXTENSION", "listable": true, "localizations": {"491e94mQjVOOBnIW": {"description": "hunElqZUodp3IhtC", "localExt": {"SHy1ei1fIrPvfHnR": {}, "N06EjRwEQlNapJRf": {}, "k4f9Zcw1pEHAyNFx": {}}, "longDescription": "cVTKuAQTGh5BxjWO", "title": "ozGoDtsUuYo5p8ED"}, "5QZAufwNa8lzfjv9": {"description": "oYMXMjlVHY1AHwF3", "localExt": {"vGoav7MK0PcLnEkc": {}, "okKwcQ0baDT9OyJ2": {}, "h23GUS2amU7syGlE": {}}, "longDescription": "lXdEAOrVSnLocLVV", "title": "YamQc4wcG5nDBLJo"}, "JHbiQ5duE5p4cfs2": {"description": "E41cK8QTwiIAvxSv", "localExt": {"NDlmM5nQFMGzs7fz": {}, "jgyc44mEh9tRk8kn": {}, "YSV30lnroQehMDli": {}}, "longDescription": "6t9unQLYXxm09wpG", "title": "AbpEmDY9vLh3u6ED"}}, "lootBoxConfig": {"rewardCount": 38, "rewards": [{"lootBoxItems": [{"count": 35, "duration": 96, "endDate": "1998-04-04T00:00:00Z", "itemId": "Q2Qd2JzRbkF2I03d", "itemSku": "IjvBbA6bfbYaJCJj", "itemType": "fk2TUvn95FhO7VW3"}, {"count": 25, "duration": 3, "endDate": "1987-09-02T00:00:00Z", "itemId": "loFSKWM1eym5ydC6", "itemSku": "p25xCWTqUOYZENJ1", "itemType": "QHZQxPRXH7uxBJEE"}, {"count": 59, "duration": 87, "endDate": "1977-09-05T00:00:00Z", "itemId": "Q5iZgbwwm5iGzXtc", "itemSku": "knrgidKupvXO6aj4", "itemType": "hCmTC34jxW4pIDwd"}], "name": "qXpmRmut9H9XyWI8", "odds": 0.029202859955488547, "type": "REWARD", "weight": 4}, {"lootBoxItems": [{"count": 11, "duration": 86, "endDate": "1996-07-04T00:00:00Z", "itemId": "338HS6CBgVRyihYN", "itemSku": "Z84CVhziXV8HwSmv", "itemType": "cvcDKF19yVRafCjO"}, {"count": 42, "duration": 44, "endDate": "1994-05-15T00:00:00Z", "itemId": "Yht83AdvBaagTiRJ", "itemSku": "8daGTVX3Bb7jlz5I", "itemType": "fHgKjI9mwJSrN8jk"}, {"count": 70, "duration": 50, "endDate": "1992-03-26T00:00:00Z", "itemId": "xLv9HBEUe89AwEw1", "itemSku": "HO4FnKtx4XLKAmlD", "itemType": "r19uJ3nq6VerzVCc"}], "name": "I8y3Cz0YqCKUh5RD", "odds": 0.9916935737880038, "type": "REWARD", "weight": 15}, {"lootBoxItems": [{"count": 81, "duration": 55, "endDate": "1986-05-09T00:00:00Z", "itemId": "p2SoiIPp1yvfAHS0", "itemSku": "VgLu11A3HTovFi4t", "itemType": "PAGfleyCA6jEtcqs"}, {"count": 27, "duration": 68, "endDate": "1984-01-16T00:00:00Z", "itemId": "oVILjkwW61duF87a", "itemSku": "Uyrdt4XSpWBAetsa", "itemType": "nzqP8oxfrtbECD1C"}, {"count": 86, "duration": 87, "endDate": "1982-01-03T00:00:00Z", "itemId": "AxJrINPXppPNO3Af", "itemSku": "mXcgwC3IN6tvKgLB", "itemType": "9QmJIOq9dP5szG71"}], "name": "utjsQ4CrRb9gUCeV", "odds": 0.4162945793236844, "type": "REWARD_GROUP", "weight": 11}], "rollFunction": "DEFAULT"}, "maxCount": 3, "maxCountPerUser": 100, "name": "ZIdhevfZvyV7Acod", "optionBoxConfig": {"boxItems": [{"count": 5, "duration": 54, "endDate": "1997-06-28T00:00:00Z", "itemId": "t2ENKKWrFtHIi1CM", "itemSku": "gKAOG5iDcCR5PbCv", "itemType": "DLil8wj9cKM3Ar6M"}, {"count": 65, "duration": 31, "endDate": "1999-11-21T00:00:00Z", "itemId": "5hCER4nGmWGgTJfH", "itemSku": "lJl4tHGa4XfZcd9C", "itemType": "VnGqMX9FieeEssWE"}, {"count": 96, "duration": 79, "endDate": "1977-06-20T00:00:00Z", "itemId": "7bhwntCVqiYOJf5K", "itemSku": "wMZQjzvjSozv6CTR", "itemType": "Dl0zp9CzHFwinkBN"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 13, "fixedTrialCycles": 68, "graceDays": 44}, "regionData": {"BDdSzBXdxapwhd5I": [{"currencyCode": "QYBQuxLvPuWYvE3f", "currencyNamespace": "sNy9Z9OhxXvCp9y7", "currencyType": "REAL", "discountAmount": 23, "discountExpireAt": "1990-09-01T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1998-11-02T00:00:00Z", "expireAt": "1979-12-11T00:00:00Z", "price": 11, "purchaseAt": "1985-08-21T00:00:00Z", "trialPrice": 38}, {"currencyCode": "XnlUnqxT1WsRNMZc", "currencyNamespace": "A92hzC7MNa8vVe4M", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1989-02-19T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1990-06-23T00:00:00Z", "expireAt": "1973-10-10T00:00:00Z", "price": 31, "purchaseAt": "1978-04-12T00:00:00Z", "trialPrice": 96}, {"currencyCode": "AyyUJyAK5PRMRMwd", "currencyNamespace": "vl0hv6g62GxBW2tQ", "currencyType": "VIRTUAL", "discountAmount": 9, "discountExpireAt": "1976-11-11T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1980-02-24T00:00:00Z", "expireAt": "1992-10-17T00:00:00Z", "price": 5, "purchaseAt": "1971-11-19T00:00:00Z", "trialPrice": 44}], "YvNQOsDa4bkcgepq": [{"currencyCode": "txjbrztee7QLTGAa", "currencyNamespace": "k7Kaol01DK97D2xn", "currencyType": "REAL", "discountAmount": 6, "discountExpireAt": "1976-10-11T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1999-07-23T00:00:00Z", "expireAt": "1977-09-25T00:00:00Z", "price": 17, "purchaseAt": "1993-06-09T00:00:00Z", "trialPrice": 19}, {"currencyCode": "eR5eQAe1rzmmgqBP", "currencyNamespace": "Rmd6mO4oI8KDqebm", "currencyType": "VIRTUAL", "discountAmount": 67, "discountExpireAt": "1971-11-18T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1983-08-10T00:00:00Z", "expireAt": "1999-10-12T00:00:00Z", "price": 31, "purchaseAt": "1974-07-25T00:00:00Z", "trialPrice": 92}, {"currencyCode": "7axEkvI4oxZEDxGi", "currencyNamespace": "BnNbn0zaf7CaOSlH", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1989-11-18T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1979-05-29T00:00:00Z", "expireAt": "1991-11-04T00:00:00Z", "price": 74, "purchaseAt": "1990-07-29T00:00:00Z", "trialPrice": 55}], "IwEsdOGBXBwnzDX8": [{"currencyCode": "v3xgC1Ge9PdbTTAJ", "currencyNamespace": "2Gp1r0sVZ6LJAOdd", "currencyType": "VIRTUAL", "discountAmount": 98, "discountExpireAt": "1976-01-27T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1992-04-12T00:00:00Z", "expireAt": "1975-09-02T00:00:00Z", "price": 81, "purchaseAt": "1972-08-30T00:00:00Z", "trialPrice": 96}, {"currencyCode": "Kv2LWfXqjr8fS79E", "currencyNamespace": "n3wYowBdkaZ3y6i3", "currencyType": "REAL", "discountAmount": 78, "discountExpireAt": "1982-08-27T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1993-12-04T00:00:00Z", "expireAt": "1979-03-28T00:00:00Z", "price": 48, "purchaseAt": "1978-03-17T00:00:00Z", "trialPrice": 18}, {"currencyCode": "1LyEirURERnEMzpI", "currencyNamespace": "mW6sjAHyCK5tNanG", "currencyType": "VIRTUAL", "discountAmount": 47, "discountExpireAt": "1980-03-25T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1975-10-04T00:00:00Z", "expireAt": "1981-09-17T00:00:00Z", "price": 5, "purchaseAt": "1976-10-09T00:00:00Z", "trialPrice": 93}]}, "saleConfig": {"currencyCode": "xTtmOFMebS4AdlNz", "price": 46}, "seasonType": "PASS", "sectionExclusive": true, "sellable": false, "sku": "F5m77TTh4gUoj8u2", "stackable": false, "status": "INACTIVE", "tags": ["LiEtzVlnkflfn7pH", "Y48F1dl1q92m3iRl", "fnBAk0CwiAsR65yQ"], "targetCurrencyCode": "9ssuHdGmxncCEr0K", "targetNamespace": "cgeqzGbruNB72HHM", "thumbnailUrl": "kjzyBB4UFKiaoV0V", "useCount": 82}' \
    > test.out 2>&1
eval_tap $? 101 'CreateItem' test.out

#- 102 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '5kypNrp2nFe9FmN8' \
    --appId '6sK5LOq4ft5jGcMI' \
    > test.out 2>&1
eval_tap $? 102 'GetItemByAppId' test.out

#- 103 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate '2bRBr27fVMWuAfDq' \
    --baseAppId 'LMR919IZPKOKiAVQ' \
    --categoryPath 'XXOmqFHLbyXmgCNi' \
    --features 'XH8uenbC5CphgMwe' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --limit '47' \
    --offset '29' \
    --region 'sIAP5vHLjBJ9iqMc' \
    --sortBy 'updatedAt:asc,displayOrder' \
    --storeId '4UMS93yOxNInDByh' \
    --tags 'noluO6ti0QP2ssiJ' \
    --targetNamespace '66OzOj84O6tgohjt' \
    > test.out 2>&1
eval_tap $? 103 'QueryItems' test.out

#- 104 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'C7bzjPpucddXJ5zi,fF8y959anrNSleyw,HbHig6IKWVZ77KeR' \
    > test.out 2>&1
eval_tap $? 104 'ListBasicItemsByFeatures' test.out

#- 105 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'WdECaFGzfZ2hxcJ2' \
    --itemIds 'Fnemn7M23SzUo4hN' \
    > test.out 2>&1
eval_tap $? 105 'GetItems' test.out

#- 106 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'BDh9ZFP1OW0nXOEr' \
    --sku 'QPS4VsRoYIK69yg9' \
    > test.out 2>&1
eval_tap $? 106 'GetItemBySku' test.out

#- 107 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'ADCGiXaLs2xjHkin' \
    --populateBundle  \
    --region 'OD975nARHCmhNHSX' \
    --storeId 'uqIHsxvaUoXDmwWs' \
    --sku 'ukxncuD3QxCXMd00' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItemBySku' test.out

#- 108 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'YBWCaVVmM45mfIZs' \
    --storeId 'WhkS476dGGJwJ00U' \
    --itemIds 'H197MJ6zU7JLMQyM' \
    --userId 'WzYQCAaPJgoxGJoJ' \
    > test.out 2>&1
eval_tap $? 108 'GetEstimatedPrice' test.out

#- 109 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'aSzUtY4ZD0Xtb0U4' \
    --sku 'pH16NUsVY21NVIs7' \
    > test.out 2>&1
eval_tap $? 109 'GetItemIdBySku' test.out

#- 110 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'NRen2Y3Ns0QJQeaW,ytPfds1BYx0EaURy,df8ZyyZeHAWGgJUb' \
    --storeId 'UJRMbkcTglbU86Fy' \
    > test.out 2>&1
eval_tap $? 110 'GetBulkItemIdBySkus' test.out

#- 111 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'OjApNHBVfNOURcjY' \
    --region '3YYT9oTynmfIuBWg' \
    --storeId 'JTNFfM8M0IW4oe8K' \
    --itemIds 'Dgy0xZfAcNg14Ws8' \
    > test.out 2>&1
eval_tap $? 111 'BulkGetLocaleItems' test.out

#- 112 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'GetAvailablePredicateTypes' test.out

#- 113 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --userId 'TIP1LKiFQoLDvumf' \
    --body '{"itemIds": ["qrgSfnx2h61X9dN1", "MGRXBJ6mVV7JS9qj", "NLwvI8JdiY3RRiLi"]}' \
    > test.out 2>&1
eval_tap $? 113 'ValidateItemPurchaseCondition' test.out

#- 114 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lmOGF6dLLIeIVIjM' \
    --body '{"changes": [{"itemIdentities": ["cdlbdRXTGIrdNL5g", "JPqTAjgqaTHf1ANT", "J9Yk997XkGOdC6It"], "itemIdentityType": "ITEM_SKU", "regionData": {"XqvUWDjU1G0EVjVZ": [{"currencyCode": "w1ToLuPakQN1MpOs", "currencyNamespace": "1RVFrcg2CXxepx78", "currencyType": "REAL", "discountAmount": 74, "discountExpireAt": "1981-05-08T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1979-07-17T00:00:00Z", "discountedPrice": 14, "expireAt": "1975-04-02T00:00:00Z", "price": 63, "purchaseAt": "1999-10-06T00:00:00Z", "trialPrice": 56}, {"currencyCode": "zNXGTuQPIDpor7t1", "currencyNamespace": "aJLNNz6QIVC9Mfuc", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1997-11-22T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1980-01-28T00:00:00Z", "discountedPrice": 27, "expireAt": "1990-04-08T00:00:00Z", "price": 17, "purchaseAt": "1977-08-23T00:00:00Z", "trialPrice": 23}, {"currencyCode": "xmuCCVuFjS1GC1d2", "currencyNamespace": "b92B4vEgj3HOmhcW", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1974-09-04T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1996-01-30T00:00:00Z", "discountedPrice": 85, "expireAt": "1976-03-30T00:00:00Z", "price": 90, "purchaseAt": "1984-09-11T00:00:00Z", "trialPrice": 44}], "NIY9nMrBZo0lNUBD": [{"currencyCode": "ShHD32vvL28FPwTi", "currencyNamespace": "XfLcxDC9Ynd02mEC", "currencyType": "VIRTUAL", "discountAmount": 88, "discountExpireAt": "1980-02-27T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1994-10-08T00:00:00Z", "discountedPrice": 99, "expireAt": "1975-08-21T00:00:00Z", "price": 68, "purchaseAt": "1979-06-09T00:00:00Z", "trialPrice": 55}, {"currencyCode": "XHLLa31oQf7BULnZ", "currencyNamespace": "DhutDM6BqguqD5xx", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1985-05-01T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1974-06-15T00:00:00Z", "discountedPrice": 27, "expireAt": "1981-10-23T00:00:00Z", "price": 30, "purchaseAt": "1995-05-05T00:00:00Z", "trialPrice": 9}, {"currencyCode": "xQGRt6PqlkL0diRh", "currencyNamespace": "LC10ih2EQfY3XCv4", "currencyType": "REAL", "discountAmount": 8, "discountExpireAt": "1983-12-01T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1971-11-22T00:00:00Z", "discountedPrice": 10, "expireAt": "1987-04-10T00:00:00Z", "price": 6, "purchaseAt": "1978-02-27T00:00:00Z", "trialPrice": 83}], "NMd1onFjGRbxtABP": [{"currencyCode": "XDmgNEJBhgGq5GID", "currencyNamespace": "hNC66szbCCf73IFb", "currencyType": "VIRTUAL", "discountAmount": 22, "discountExpireAt": "1990-12-07T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1993-11-23T00:00:00Z", "discountedPrice": 92, "expireAt": "1988-08-07T00:00:00Z", "price": 93, "purchaseAt": "1998-07-25T00:00:00Z", "trialPrice": 64}, {"currencyCode": "4TjCrJHXGXku2YVu", "currencyNamespace": "OzhxHmnrrV9ZGWrZ", "currencyType": "VIRTUAL", "discountAmount": 47, "discountExpireAt": "1980-03-22T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1997-01-31T00:00:00Z", "discountedPrice": 47, "expireAt": "1984-04-18T00:00:00Z", "price": 30, "purchaseAt": "1993-05-04T00:00:00Z", "trialPrice": 86}, {"currencyCode": "mKDebNkylbynkgT9", "currencyNamespace": "vayLLiizac7Ge6zK", "currencyType": "REAL", "discountAmount": 8, "discountExpireAt": "1991-03-29T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1981-03-24T00:00:00Z", "discountedPrice": 39, "expireAt": "1979-12-16T00:00:00Z", "price": 19, "purchaseAt": "1989-09-14T00:00:00Z", "trialPrice": 58}]}}, {"itemIdentities": ["5RaJwvkWVco2LTo5", "ijlvDF8qBWCQ9dLW", "YyS8zdhMeBXH8x6H"], "itemIdentityType": "ITEM_ID", "regionData": {"9lhbvuQdW2jwKUck": [{"currencyCode": "c794ryY91lX8DD4M", "currencyNamespace": "YXlrJ81lHvv9rqvE", "currencyType": "REAL", "discountAmount": 9, "discountExpireAt": "1990-03-05T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1997-09-24T00:00:00Z", "discountedPrice": 25, "expireAt": "1995-07-29T00:00:00Z", "price": 19, "purchaseAt": "1984-01-31T00:00:00Z", "trialPrice": 21}, {"currencyCode": "Vej8N2yv6VTnOK7x", "currencyNamespace": "AvM7tuL81lsR7xxS", "currencyType": "REAL", "discountAmount": 90, "discountExpireAt": "1999-01-18T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1981-01-26T00:00:00Z", "discountedPrice": 26, "expireAt": "1999-04-27T00:00:00Z", "price": 75, "purchaseAt": "1984-08-23T00:00:00Z", "trialPrice": 68}, {"currencyCode": "i8HeV6jbalHmqBBf", "currencyNamespace": "i7sSF5BoGiTCVsXs", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1987-05-30T00:00:00Z", "discountPercentage": 2, "discountPurchaseAt": "1982-03-16T00:00:00Z", "discountedPrice": 44, "expireAt": "1986-01-29T00:00:00Z", "price": 23, "purchaseAt": "1978-05-03T00:00:00Z", "trialPrice": 20}], "XtdsJQeJ1too0qvx": [{"currencyCode": "phTLEEBGTtZyTjdK", "currencyNamespace": "NKgYazujsmSmylT1", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1989-07-11T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1988-05-10T00:00:00Z", "discountedPrice": 100, "expireAt": "1995-12-02T00:00:00Z", "price": 1, "purchaseAt": "1982-11-10T00:00:00Z", "trialPrice": 44}, {"currencyCode": "b48jISd97KORRhxS", "currencyNamespace": "WLWLNfHRD3V15QaG", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1993-08-15T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1974-06-17T00:00:00Z", "discountedPrice": 49, "expireAt": "1997-10-14T00:00:00Z", "price": 94, "purchaseAt": "1987-05-29T00:00:00Z", "trialPrice": 2}, {"currencyCode": "beqWBdQuWfgBAKx2", "currencyNamespace": "7MSBqabUXOGkkoMU", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1983-03-17T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1998-07-23T00:00:00Z", "discountedPrice": 0, "expireAt": "1987-10-30T00:00:00Z", "price": 9, "purchaseAt": "1998-11-23T00:00:00Z", "trialPrice": 59}], "RVfriSpPFnZBJZkD": [{"currencyCode": "nEiyfa2LrnpZxNnL", "currencyNamespace": "RH36bqS2oFY76PU1", "currencyType": "VIRTUAL", "discountAmount": 20, "discountExpireAt": "1984-03-26T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1998-08-07T00:00:00Z", "discountedPrice": 82, "expireAt": "1980-10-06T00:00:00Z", "price": 51, "purchaseAt": "1986-05-30T00:00:00Z", "trialPrice": 54}, {"currencyCode": "6GdkDcos5uVJ0BJf", "currencyNamespace": "Z0jvA54CSqZFDsO1", "currencyType": "VIRTUAL", "discountAmount": 22, "discountExpireAt": "1976-12-21T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1993-11-27T00:00:00Z", "discountedPrice": 58, "expireAt": "1994-01-23T00:00:00Z", "price": 28, "purchaseAt": "1994-09-11T00:00:00Z", "trialPrice": 78}, {"currencyCode": "KLc0xcTjqjdcEfU6", "currencyNamespace": "1OJYMnW49rWynp1c", "currencyType": "REAL", "discountAmount": 44, "discountExpireAt": "1981-12-18T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1973-01-28T00:00:00Z", "discountedPrice": 58, "expireAt": "1988-10-14T00:00:00Z", "price": 30, "purchaseAt": "1973-09-18T00:00:00Z", "trialPrice": 5}]}}, {"itemIdentities": ["KIuvnRCa9JktyBdx", "kZKrEWFw9GYxjiiO", "QAD77ci0vfWVZoRR"], "itemIdentityType": "ITEM_SKU", "regionData": {"Pi57HyKKz5nyI6ul": [{"currencyCode": "KNKoXa0dgx1JgjC5", "currencyNamespace": "6pda3YhtQxpCYME6", "currencyType": "VIRTUAL", "discountAmount": 35, "discountExpireAt": "1998-08-11T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1986-01-27T00:00:00Z", "discountedPrice": 72, "expireAt": "1999-01-13T00:00:00Z", "price": 87, "purchaseAt": "1979-12-30T00:00:00Z", "trialPrice": 34}, {"currencyCode": "PAd9sxoLnWGP1Paf", "currencyNamespace": "IjLX8ce0KbNN7Ycl", "currencyType": "VIRTUAL", "discountAmount": 74, "discountExpireAt": "1990-02-09T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1977-08-20T00:00:00Z", "discountedPrice": 87, "expireAt": "1998-04-30T00:00:00Z", "price": 26, "purchaseAt": "1976-12-22T00:00:00Z", "trialPrice": 45}, {"currencyCode": "vSoaGk4ktF5wnJDg", "currencyNamespace": "9Q3WXiydCOInVols", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1985-09-30T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1975-03-20T00:00:00Z", "discountedPrice": 1, "expireAt": "1988-02-10T00:00:00Z", "price": 37, "purchaseAt": "1981-08-27T00:00:00Z", "trialPrice": 78}], "1cfswmeFpvtDteto": [{"currencyCode": "QVFL8LNW11vtpaTx", "currencyNamespace": "i7k489jRCn48bvkC", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1989-04-27T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1998-07-03T00:00:00Z", "discountedPrice": 99, "expireAt": "1996-03-11T00:00:00Z", "price": 82, "purchaseAt": "1998-10-05T00:00:00Z", "trialPrice": 99}, {"currencyCode": "ZZQAJza84lKKmVOa", "currencyNamespace": "TS6xBbNrSUAW2ak7", "currencyType": "VIRTUAL", "discountAmount": 48, "discountExpireAt": "1979-09-16T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1988-10-06T00:00:00Z", "discountedPrice": 13, "expireAt": "1994-08-14T00:00:00Z", "price": 82, "purchaseAt": "1974-06-20T00:00:00Z", "trialPrice": 60}, {"currencyCode": "x4unq3eOMHIKeTyB", "currencyNamespace": "G5dCUoExnKfV3869", "currencyType": "REAL", "discountAmount": 81, "discountExpireAt": "1975-11-04T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1982-11-25T00:00:00Z", "discountedPrice": 6, "expireAt": "1990-02-25T00:00:00Z", "price": 67, "purchaseAt": "1988-08-11T00:00:00Z", "trialPrice": 53}], "GVU7Exlkmc4xYiLj": [{"currencyCode": "LyZrXr9Bhtzn8jAd", "currencyNamespace": "Tn6xBhrciryLm67r", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1971-01-29T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1988-06-14T00:00:00Z", "discountedPrice": 28, "expireAt": "1996-03-24T00:00:00Z", "price": 32, "purchaseAt": "1997-12-28T00:00:00Z", "trialPrice": 92}, {"currencyCode": "IjL0Vxe5n9Lx3QcF", "currencyNamespace": "o9gxOgvDc7xMrRKv", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1973-10-09T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1994-05-24T00:00:00Z", "discountedPrice": 84, "expireAt": "1995-05-15T00:00:00Z", "price": 100, "purchaseAt": "1975-10-26T00:00:00Z", "trialPrice": 25}, {"currencyCode": "VzW1QqxnWR5sheLg", "currencyNamespace": "sAF4ctv5guycGiq9", "currencyType": "REAL", "discountAmount": 88, "discountExpireAt": "1998-12-06T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1983-07-21T00:00:00Z", "discountedPrice": 90, "expireAt": "1988-03-27T00:00:00Z", "price": 8, "purchaseAt": "1977-06-26T00:00:00Z", "trialPrice": 10}]}}]}' \
    > test.out 2>&1
eval_tap $? 114 'BulkUpdateRegionData' test.out

#- 115 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'MEDIA' \
    --limit '77' \
    --offset '98' \
    --sortBy 'DpgHnMOn8nc3gUZ8' \
    --storeId 'ZFyyEr0KBXuJBqK4' \
    --keyword 'QtEydPWLPBYiR3Ub' \
    --language 'Jc1ZYapx7C477etq' \
    > test.out 2>&1
eval_tap $? 115 'SearchItems' test.out

#- 116 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '12' \
    --offset '11' \
    --sortBy 'updatedAt:desc,updatedAt:asc,displayOrder:asc' \
    --storeId 'JDUT0uKAPrARya2I' \
    > test.out 2>&1
eval_tap $? 116 'QueryUncategorizedItems' test.out

#- 117 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'MlNiXpF4qvsUUpHq' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'i33TcBGkc0HjUcnk' \
    > test.out 2>&1
eval_tap $? 117 'GetItem' test.out

#- 118 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'pU9oVzl2kBuLFXIe' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CEKZUTz3GvCAZ5j2' \
    --body '{"appId": "4acYHbrryHB6GO9z", "appType": "DLC", "baseAppId": "3FaepA3b3YJ9nJM6", "boothName": "vtT27xv85K5MU2qm", "categoryPath": "beqaVemINdClpF7O", "clazz": "vlBIEgjse5kd6GED", "displayOrder": 29, "entitlementType": "CONSUMABLE", "ext": {"08yq5E5HleLoog4m": {}, "e2NBFp62xlXvVcJe": {}, "rTPW02PWsHiKYArA": {}}, "features": ["0DjjwMv4vrIPRtvh", "QIyLarjaLOKnX51y", "xnKBfBfDlrQQuAc1"], "flexible": true, "images": [{"as": "PykS8YLmwtYgWGcA", "caption": "0h4G1LZ1HaX5UBMb", "height": 37, "imageUrl": "X1B9oVuzG2CnYX2Y", "smallImageUrl": "BF2g7TVtzYEHUodh", "width": 28}, {"as": "iUfBthbepUCTWiZ1", "caption": "uqh7GAi4FEIu44u8", "height": 45, "imageUrl": "ZLRxYlYqlpq03BGd", "smallImageUrl": "Ik4oEogFVGR71rJO", "width": 57}, {"as": "iA0tQWlHwBcTtztx", "caption": "3VAl6tXFbnATCzUO", "height": 70, "imageUrl": "WmKgE8CZ4AELr5lr", "smallImageUrl": "aa5v5P5Cj8hgFsqH", "width": 59}], "itemIds": ["adEoIVmprwPsa9YD", "92CX0rITajpwHITG", "eHTnqRbzBB9ZFgJb"], "itemQty": {"Q3Fj1umx4ItzkMJ7": 5, "YsHooOIaxIpb1cIO": 72, "VIQvRkQJAtDUH9tx": 53}, "itemType": "BUNDLE", "listable": true, "localizations": {"hGz1ermJYXsYgL7T": {"description": "fyIlAwjTZdRZJJzW", "localExt": {"ZwvTX2bamSCvX1nw": {}, "vSWdDwD7WJHzgNZU": {}, "KsI5y0mR3zMyTsft": {}}, "longDescription": "KqnsIJctAdxyZVKH", "title": "A9DkaSOWgtg8yw8l"}, "HEbVDwBAqanOlscR": {"description": "IWw82k5K5VTkdubk", "localExt": {"OFldMCQ98JH4n0Jt": {}, "gqzZv5kVu4S95mj8": {}, "YRvae4f4lhBPbarb": {}}, "longDescription": "WEm8bVtZcfVCPdQh", "title": "im9QKUAFTVYelIlG"}, "Jg9wdc8bihhWjfZp": {"description": "fcFBUsnnDJlmD1iE", "localExt": {"okbUiYzCQh2iNTwt": {}, "nohddMzMTQ9P7sYL": {}, "DWAJOA75K4BYJ2fk": {}}, "longDescription": "qYJoF2FI3vyyqRzc", "title": "20O7FdsJP1G9tyBT"}}, "lootBoxConfig": {"rewardCount": 12, "rewards": [{"lootBoxItems": [{"count": 29, "duration": 62, "endDate": "1974-12-25T00:00:00Z", "itemId": "KzuMYDUTLBeCidXj", "itemSku": "uGgx8ncXejmeZtzT", "itemType": "0qj0ltsqfiZrthVv"}, {"count": 49, "duration": 98, "endDate": "1996-08-18T00:00:00Z", "itemId": "0OCKDJE3RMUddwSS", "itemSku": "gxCu8zru1DhGAYOH", "itemType": "R5BWa9VzIkaQEl1i"}, {"count": 95, "duration": 8, "endDate": "1992-10-30T00:00:00Z", "itemId": "roNB6hI6IpGcToWg", "itemSku": "FvdRhG9NwV3zDuqV", "itemType": "lVTypcYPK8IxrSZu"}], "name": "xWl0Je4fJIyFAm3D", "odds": 0.6841347009700219, "type": "PROBABILITY_GROUP", "weight": 89}, {"lootBoxItems": [{"count": 40, "duration": 54, "endDate": "1989-01-10T00:00:00Z", "itemId": "wnPS2urJqerobWMZ", "itemSku": "GVL5KLTxahWlS6Xd", "itemType": "BaKSLCgOOPXM6XTU"}, {"count": 15, "duration": 72, "endDate": "1999-03-31T00:00:00Z", "itemId": "dJ90yqHDNacl4F9G", "itemSku": "6Dl5TFwBY6HKXAbl", "itemType": "kT8VGgSH8MGZGwiV"}, {"count": 19, "duration": 33, "endDate": "1973-09-04T00:00:00Z", "itemId": "RLaA643nTMtXSAye", "itemSku": "jnny0Ju13b6o5uB2", "itemType": "XM6IHy7EEvHyLmcv"}], "name": "rZZOdwe1x8RjU6Bi", "odds": 0.9781327863012951, "type": "REWARD_GROUP", "weight": 10}, {"lootBoxItems": [{"count": 71, "duration": 63, "endDate": "1987-03-09T00:00:00Z", "itemId": "2sUBBq2SimQQoLbe", "itemSku": "5YOJvxGRxUzrTwag", "itemType": "H7BMT1IZKTdNFVBQ"}, {"count": 55, "duration": 4, "endDate": "1983-05-20T00:00:00Z", "itemId": "2JTllJkRGB8jqJEd", "itemSku": "6eqqsBVyONV0JRto", "itemType": "zI0jpliCFQ6WgJpG"}, {"count": 84, "duration": 18, "endDate": "1981-02-18T00:00:00Z", "itemId": "BYeQZOzATNSV9E9y", "itemSku": "yNb7yaLXzAVYymOu", "itemType": "hCkZu4htrsf8eIFS"}], "name": "ovTGXaMsq8ePN1oc", "odds": 0.23324146460862305, "type": "REWARD_GROUP", "weight": 20}], "rollFunction": "CUSTOM"}, "maxCount": 48, "maxCountPerUser": 5, "name": "Upe8SjMvpqM8pugg", "optionBoxConfig": {"boxItems": [{"count": 83, "duration": 63, "endDate": "1976-01-30T00:00:00Z", "itemId": "9iCqfW6rqGOQny4i", "itemSku": "j4ysYPonb59gQffk", "itemType": "NOmubxEJr2qEAuJb"}, {"count": 32, "duration": 44, "endDate": "1997-09-02T00:00:00Z", "itemId": "Srcbc4LWfKaY5c1t", "itemSku": "P5TDuI5f6m4KC07C", "itemType": "nsZe32hqEcB1ExYM"}, {"count": 56, "duration": 3, "endDate": "1997-11-26T00:00:00Z", "itemId": "ckvoaJYdMqGegcg3", "itemSku": "eRvBZXN3cjIXmFWR", "itemType": "Jnj8xN7HDPTUEDPN"}]}, "purchasable": false, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 94, "fixedTrialCycles": 16, "graceDays": 84}, "regionData": {"C9ZDj4E4mv12FNXy": [{"currencyCode": "poOLl13j84P0Kqir", "currencyNamespace": "J4PkMFtsnFfz8Ew0", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1973-08-17T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1981-04-12T00:00:00Z", "expireAt": "1985-12-10T00:00:00Z", "price": 91, "purchaseAt": "1987-10-29T00:00:00Z", "trialPrice": 0}, {"currencyCode": "LSQ4GvLtz50D3rpB", "currencyNamespace": "fBovqLwXBuT30EYe", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1997-06-17T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1985-09-20T00:00:00Z", "expireAt": "1993-02-25T00:00:00Z", "price": 1, "purchaseAt": "1982-08-16T00:00:00Z", "trialPrice": 72}, {"currencyCode": "KoUfiHjGmCyPsKCJ", "currencyNamespace": "Tv1ic9gvagF2cSuz", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1980-03-21T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1993-06-07T00:00:00Z", "expireAt": "1981-03-17T00:00:00Z", "price": 39, "purchaseAt": "1984-02-19T00:00:00Z", "trialPrice": 79}], "V7nmDk29mcjSuz9v": [{"currencyCode": "bNStqPtQmQN6eKAG", "currencyNamespace": "iZFCftT0RWECdjWY", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1977-11-19T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1980-04-02T00:00:00Z", "expireAt": "1972-07-11T00:00:00Z", "price": 30, "purchaseAt": "1972-02-16T00:00:00Z", "trialPrice": 57}, {"currencyCode": "wYLQcDvkaEIIPoJT", "currencyNamespace": "83zEGXmVBZLyrH9J", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1978-07-21T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1998-04-10T00:00:00Z", "expireAt": "1979-01-06T00:00:00Z", "price": 83, "purchaseAt": "1987-12-26T00:00:00Z", "trialPrice": 55}, {"currencyCode": "LkP5hc2Fh04JTsqD", "currencyNamespace": "TynCewqJligLlRxO", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1976-03-08T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1972-07-26T00:00:00Z", "expireAt": "1996-03-25T00:00:00Z", "price": 70, "purchaseAt": "1996-08-16T00:00:00Z", "trialPrice": 51}], "RxF6HtlER2txs4qr": [{"currencyCode": "NARATn6KXOutlYBb", "currencyNamespace": "LhL8KXx25FZfQIod", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1982-05-17T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1992-02-07T00:00:00Z", "expireAt": "1980-08-10T00:00:00Z", "price": 22, "purchaseAt": "1979-12-05T00:00:00Z", "trialPrice": 59}, {"currencyCode": "y0fGvTGgfLKsg0b1", "currencyNamespace": "Bq78cE5O5pmPnbiP", "currencyType": "REAL", "discountAmount": 1, "discountExpireAt": "1976-04-18T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1982-12-26T00:00:00Z", "expireAt": "1983-04-11T00:00:00Z", "price": 2, "purchaseAt": "1979-10-02T00:00:00Z", "trialPrice": 24}, {"currencyCode": "3rVaauufxkPHElug", "currencyNamespace": "48TgfNu0rqXUOyTo", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1994-09-02T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1976-10-12T00:00:00Z", "expireAt": "1986-10-27T00:00:00Z", "price": 94, "purchaseAt": "1977-07-19T00:00:00Z", "trialPrice": 72}]}, "saleConfig": {"currencyCode": "Pl3dKF7NXEjrJMki", "price": 67}, "seasonType": "PASS", "sectionExclusive": true, "sellable": true, "sku": "bADMfuOmh0lciRhV", "stackable": false, "status": "INACTIVE", "tags": ["KqxJiFJdrmj5vhzg", "sJwex7wq8ZPlXNaU", "NgdY2vfJuje5cPnm"], "targetCurrencyCode": "GjTvYa5Pqx1K7qcA", "targetNamespace": "oijBPAp6EPb988Nz", "thumbnailUrl": "xrDKVpULjjiw3NeV", "useCount": 66}' \
    > test.out 2>&1
eval_tap $? 118 'UpdateItem' test.out

#- 119 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'fZbpTJezzriCDWXT' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId '59SRu0YqUxKDc84O' \
    > test.out 2>&1
eval_tap $? 119 'DeleteItem' test.out

#- 120 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'MIzvTScdbKBsAyJM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 51, "orderNo": "wjr7gSGhnfuF4WZi"}' \
    > test.out 2>&1
eval_tap $? 120 'AcquireItem' test.out

#- 121 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'QVICVpWd3UM08gMX' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'hdf3juXW4JprIb3C' \
    > test.out 2>&1
eval_tap $? 121 'GetApp' test.out

#- 122 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'JCAtvSG8Cfa9dzOJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DGCTHIOFjeXbsSgR' \
    --body '{"carousel": [{"alt": "43kIDzxBwqRJTzrH", "previewUrl": "NZWUsq5lQo2jy29E", "thumbnailUrl": "JigqYhyVhURx1yPe", "type": "image", "url": "Tw6zQuoZcXQpoTOx", "videoSource": "generic"}, {"alt": "2KNGfhzfCTxxrsRR", "previewUrl": "Lee3TcJ7DQIi45aC", "thumbnailUrl": "DHN9mVug2zkVf6Kg", "type": "video", "url": "FVKlbYHtbPtaxvag", "videoSource": "youtube"}, {"alt": "ugFDa6wUQvehKqwC", "previewUrl": "h86XmRkCEcfHDCdl", "thumbnailUrl": "59Wp9A3tXGve6DdK", "type": "image", "url": "uvg8f2cIoByk9fxt", "videoSource": "vimeo"}], "developer": "UcCEt0DzmkJq1sml", "forumUrl": "5bYt76BNsi4giR94", "genres": ["Racing", "Racing", "Adventure"], "localizations": {"pKKdzxoufCNlFoOc": {"announcement": "WQQy4bjmQeEweoBH", "slogan": "TdwAk7ZQnbqY1cQw"}, "VEtAr5kKKAo9MM2C": {"announcement": "qm84jVi9kIpqgrzp", "slogan": "UkNOBWydXV0Fi02a"}, "Fr8CDapjwNOl4k8r": {"announcement": "VNrm8drv8QD2JOe2", "slogan": "Ntz7EFvowPgIGuet"}}, "platformRequirements": {"xFMqXCQMAqQ2ZRGz": [{"additionals": "NtrThFa9XU8moslu", "directXVersion": "iHZJ7O8sAQ32wj9u", "diskSpace": "aDzsr9xYiWRuuzQJ", "graphics": "iLc1eI9w3JEhxPGb", "label": "Ek7s7gw07FlounC3", "osVersion": "vJKBC7SwgoViPeIB", "processor": "4Ehy0Y5aSJVDginx", "ram": "AM77eY9C14FbfiI2", "soundCard": "NPvl1kCY5bEokxXx"}, {"additionals": "kWZbjf7GZxaossQm", "directXVersion": "jo69wohJFyTNk5FG", "diskSpace": "UPhR4LEZvz3EjFR7", "graphics": "996Ug5m4axDV5uTc", "label": "YsoahUrELQ1btjJO", "osVersion": "qQMgZWAU6E92nHJz", "processor": "vw7tnYtGfv0EJyjB", "ram": "u4EzwRjD7jmQJeFP", "soundCard": "ghqamSc5y0X48eT7"}, {"additionals": "Mluexk87b9Z5BTsE", "directXVersion": "A3EdmW8saabP4xRo", "diskSpace": "wfNojzPXI2v0prR3", "graphics": "OEey0MkZwS6TYwNN", "label": "3UYhic03qGEg5fNz", "osVersion": "BVrjo3g8CfRwtyl1", "processor": "HeT7VEPgG40QyXzs", "ram": "Ozgck078IghoQBp2", "soundCard": "mWAOYksczxBS0OBC"}], "a2vWadLmQtYKmEMz": [{"additionals": "icbuL2S3RiW8dLTC", "directXVersion": "BfGUdVEdvdQL7sVw", "diskSpace": "cZ2PofaJoSqtrEOq", "graphics": "xH46fRTSZoDdT0fe", "label": "fo74eg3Nt2c0r4Gq", "osVersion": "F0NHglOVuNZ9LzNe", "processor": "JnBurh54CWbYb0Pe", "ram": "byt8b4DGscjwrizs", "soundCard": "FUgYwbaLvqvQ2Nbm"}, {"additionals": "DITuymTBjn3d2sFz", "directXVersion": "MS3QaVjZF7Ax6115", "diskSpace": "Kg9U8vrQJXQxoIbV", "graphics": "i2CLEk277Ivjj1A6", "label": "47XQ3koaAfZIim0s", "osVersion": "FPm1YN27bojDVaZL", "processor": "px4kEWYkO6KrKUMh", "ram": "JrASBh61hmWKSSrF", "soundCard": "35anDGvur19V18oI"}, {"additionals": "rUKXttgAI2QdWJFL", "directXVersion": "moPEgd8EMspOs8nk", "diskSpace": "ic9gj5vyUMAAmIHY", "graphics": "bsxG5N066FXb88Sb", "label": "LOa21DiSFsm0XXQJ", "osVersion": "WszvTQEuALzDNp1S", "processor": "Z58aDllwzTRHak1M", "ram": "Xxj7Esrg7900nml5", "soundCard": "BidsK9dCEzhVnOv0"}], "PQbVIaKiHfoeorY7": [{"additionals": "A1otGFyv2SMjbEr5", "directXVersion": "0qGdCZIc6EFqBKxb", "diskSpace": "S7Q2OgRucL1jwRXz", "graphics": "fjDZZBmOau6syme0", "label": "6c6SKLc2mEC3IXl5", "osVersion": "XCbkOfHaGr5kdazl", "processor": "ypvt6lSLfU7HByGX", "ram": "PMqxj4hBgVY3YAxZ", "soundCard": "LKbcOdyjqf6Q4oiw"}, {"additionals": "oJcaRMEb15LBlTVu", "directXVersion": "fc5ZyODR2NVyn4PR", "diskSpace": "qf3eRbZqBAoKGcVC", "graphics": "dMiSNV4qBrt1kcLm", "label": "Rv6EJtl5xWnsb8oW", "osVersion": "q94RImNWVIJnhhwF", "processor": "DV1VitaomvWTzdsW", "ram": "4N70wYS4Kj7Yi2Vv", "soundCard": "oQNW8Yc481dYdvGx"}, {"additionals": "JAMDRA1LF7jdWlek", "directXVersion": "FwO94VBCV9qJhWva", "diskSpace": "2FPBujX0geYCpGJM", "graphics": "4sqsPNJMiZXXOFwm", "label": "GWAvNF0Z0GkwxUNY", "osVersion": "yNwGiKrknH0Y5mrQ", "processor": "gLC6D2qsFiQHglUQ", "ram": "MZi5WjMZfOadpgeg", "soundCard": "CUjTdi1Ehr8OtqpN"}]}, "platforms": ["Windows", "IOS", "MacOS"], "players": ["Single", "Coop", "Single"], "primaryGenre": "Sports", "publisher": "uNy4ejmVA3vMCsGy", "releaseDate": "1992-06-18T00:00:00Z", "websiteUrl": "d12B8QNUz0hFFNbH"}' \
    > test.out 2>&1
eval_tap $? 122 'UpdateApp' test.out

#- 123 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId '6j2W4roZM2UKAXEE' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sL5D0oiFchQnVeq3' \
    > test.out 2>&1
eval_tap $? 123 'DisableItem' test.out

#- 124 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'g2AB2WIRUQmauIY5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 124 'GetItemDynamicData' test.out

#- 125 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'HXCZ0W4XmWP0HzSd' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iylLhVYszm8xY33O' \
    > test.out 2>&1
eval_tap $? 125 'EnableItem' test.out

#- 126 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'Qbumu2QHLyZNuysy' \
    --itemId 'M4OfCzdQCXMAWnf8' \
    --namespace "$AB_NAMESPACE" \
    --storeId '7YPNOe9Eevf1fhMg' \
    > test.out 2>&1
eval_tap $? 126 'FeatureItem' test.out

#- 127 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature '1E2k7QLFrVgtX7y0' \
    --itemId 'fPOieDCow2zXyFFV' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pM87yqEwEacQMTlq' \
    > test.out 2>&1
eval_tap $? 127 'DefeatureItem' test.out

#- 128 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'N4LKkxJ5v3SBafnK' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'NiMPbFkFGA85W3HJ' \
    --populateBundle  \
    --region 'kqgS2B37wwoPYOHi' \
    --storeId 'IsxmsLBPBJuNLnWR' \
    > test.out 2>&1
eval_tap $? 128 'GetLocaleItem' test.out

#- 129 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'rtW870qD88ZcduZS' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'e7W20UZcDaiq0nEZ' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 85, "comparison": "isGreaterThanOrEqual", "name": "yhqFJkDClOsKmfsg", "predicateType": "SeasonTierPredicate", "value": "VLMlHi8i9gOVqajU", "values": ["WrgEsWDtaKzn8dZw", "OMZMgWkFN7Tpkx6G", "nnGeZsZVgbPzPFbr"]}, {"anyOf": 5, "comparison": "includes", "name": "XTrFibRAhzzEWzWl", "predicateType": "SeasonTierPredicate", "value": "dW2JKmQafUs2bxYz", "values": ["tOEyVbKIf1ZbzgUw", "lg7gYs6unPYQ9jNQ", "d8DHoCQykmXHYmkR"]}, {"anyOf": 81, "comparison": "isLessThan", "name": "1di1ldhOh6HvjnYu", "predicateType": "EntitlementPredicate", "value": "NfC4A2ODiZhbfb8Q", "values": ["FfgK46GjCWaP8huT", "qCyK1XH9D6vl5eFd", "mnq3FGQn3Ahu5wxq"]}]}, {"operator": "and", "predicates": [{"anyOf": 30, "comparison": "isLessThan", "name": "Jq4mChmQHQhO9IKB", "predicateType": "EntitlementPredicate", "value": "DFQfXFD58sG6uDhF", "values": ["MKclr5igjNTVItrH", "YlrzJBYSeMuJfQec", "utjS029BiJWOG1m7"]}, {"anyOf": 66, "comparison": "isGreaterThan", "name": "hxJgaVfw5Vnyq8Oz", "predicateType": "SeasonTierPredicate", "value": "c6VbE0AGcekjMNHu", "values": ["uyDoN91uc28HoSpG", "t1g0GGbT4Hf2PPKO", "PXtz8tXxrmzafMUg"]}, {"anyOf": 23, "comparison": "excludes", "name": "GGvi9kg3rMIzNmhJ", "predicateType": "SeasonTierPredicate", "value": "eg9q86IaDFjjx6uZ", "values": ["erWbtwTX9gNRByjb", "qcKLa7LevxNHOSEh", "E8lOLAfTXKLzbrdd"]}]}, {"operator": "and", "predicates": [{"anyOf": 23, "comparison": "isGreaterThan", "name": "p693lRwtc43atCuC", "predicateType": "SeasonTierPredicate", "value": "X4yFQFdrRoM6FoqC", "values": ["ji329PfVrvMEPtps", "Yw7AlxO6qdFpc71s", "Sck3ggZWJlSlCQMD"]}, {"anyOf": 90, "comparison": "isGreaterThan", "name": "NcpK1QkB2Sy8Ww79", "predicateType": "SeasonTierPredicate", "value": "HuGz3b5WAEvdRF9b", "values": ["OO97DmQ5ZOzx6iCJ", "7OydVw0zCqoMZvpI", "qMj4ro5B19VE838c"]}, {"anyOf": 93, "comparison": "isLessThanOrEqual", "name": "u60IifzMhkk5Pxsj", "predicateType": "SeasonPassPredicate", "value": "7VbBPUWipz9C05Ya", "values": ["bFX4FCK5ucTFsAFz", "tER1qdTelFAadM9y", "aO3yJpA3KMxBlrRy"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 129 'UpdateItemPurchaseCondition' test.out

#- 130 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId '66Drf4SSGGt3MiBK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "ohow3kKoaP1K4CDu"}' \
    > test.out 2>&1
eval_tap $? 130 'ReturnItem' test.out

#- 131 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --name 'cn7KaoCEkRdo6qHY' \
    --offset '70' \
    --tag 'R5dShqiBUI9esSsX' \
    > test.out 2>&1
eval_tap $? 131 'QueryKeyGroups' test.out

#- 132 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "egSEhrPpK2q8kxR4", "name": "BuEksS2A9VOA8H9V", "status": "ACTIVE", "tags": ["EJaPnAFjsodyJQVV", "BrShGbIIuqK8C403", "HgoXCR6XOMXwKdfq"]}' \
    > test.out 2>&1
eval_tap $? 132 'CreateKeyGroup' test.out

#- 133 GetKeyGroupByBoothName
eval_tap 0 133 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 134 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'k8T4QHK30EX0Fclp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 134 'GetKeyGroup' test.out

#- 135 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'Dl5HsuracO5Mnjnx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "D1OXkxShFVQTRekL", "name": "fjmy8zosRCRgVwbr", "status": "INACTIVE", "tags": ["Kmb01yA7U7dGMjup", "ZkZQY8CNyT4k3DIb", "fT22G5NpE130YWSg"]}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateKeyGroup' test.out

#- 136 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'xpKWtdtdtVW9anEN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'GetKeyGroupDynamic' test.out

#- 137 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'mxb9e7vXZV3ig8Jg' \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --offset '97' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 137 'ListKeys' test.out

#- 138 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId '209BySn8aUaGlAyv' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 138 'UploadKeys' test.out

#- 139 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'Islt7N1qcxKs4nlf' \
    --limit '40' \
    --offset '79' \
    --orderNos 'Uh74KVo6Xqjz2xUK,LNWSmYyVvyelIJ8Q,gaLMqi836ULa7cfZ' \
    --sortBy 'l4VuY6rsZyo6CBRR' \
    --startTime 'noOikIxXKKIR6kPm' \
    --status 'DELETED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 139 'QueryOrders' test.out

#- 140 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetOrderStatistics' test.out

#- 141 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '2gAJOTCbx7J3gNLI' \
    > test.out 2>&1
eval_tap $? 141 'GetOrder' test.out

#- 142 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'lTk3Bpclrk4hIRn0' \
    --body '{"description": "znIKzAEAHQpBOgHE"}' \
    > test.out 2>&1
eval_tap $? 142 'RefundOrder' test.out

#- 143 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 143 'GetPaymentCallbackConfig' test.out

#- 144 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": false, "notifyUrl": "iXaBzsmaxjTZPlLi", "privateKey": "tytGka7Kv5TacQKF"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdatePaymentCallbackConfig' test.out

#- 145 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '4OlRGdmXxETLEQrr' \
    --externalId '3KCAV9alq3hK1G4k' \
    --limit '74' \
    --notificationSource 'XSOLLA' \
    --notificationType 'ooSNNUZuiynZ64Iw' \
    --offset '27' \
    --paymentOrderNo 'gTTLS2FgarY903IN' \
    --startDate 'GIyEfRBEj7qms9AG' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 145 'QueryPaymentNotifications' test.out

#- 146 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'HumyfuBNisecYbcO' \
    --limit '32' \
    --offset '73' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 146 'QueryPaymentOrders' test.out

#- 147 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "fuBs1Vpqn47GVghT", "currencyNamespace": "H2wToOnq9U5lyW89", "customParameters": {"Xwt3wmRTrDCjhnKv": {}, "sHezWTqgYPixtHk6": {}, "lWq6tEeUmU96FLEa": {}}, "description": "k0mJqjRYldcTpdeC", "extOrderNo": "D9XPRi4bAQL7VE2w", "extUserId": "L8Y4JFVUdzA8bvXl", "itemType": "MEDIA", "language": "IDh-FReB-394", "metadata": {"Pm5ztrr09CDA8Ij5": "bGKSuopWQbaCvdPS", "q8Z27GpvHCDx55JZ": "5z6gujpFzlPspQD9", "IRIpDDubntPCFxfe": "oW2NdSWzOXjO1NQU"}, "notifyUrl": "qWHBW78XREZCiTNA", "omitNotification": true, "platform": "9NCKKXu1bqI2M5Pm", "price": 80, "recurringPaymentOrderNo": "fKnQ7BYGjCUDMOrb", "region": "moRvWnfmGFy0eUoO", "returnUrl": "Bd90h9EDqSTOfoNe", "sandbox": true, "sku": "JnZcrqrPye7fCwi7", "subscriptionId": "Il2wIFlHm9N6owMH", "targetNamespace": "MtJy1Oqn59tEGm9N", "targetUserId": "YeUT5P0nx8TqSZdZ", "title": "5C8mFI9TnvzEqBNM"}' \
    > test.out 2>&1
eval_tap $? 147 'CreatePaymentOrderByDedicated' test.out

#- 148 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'F9CZvPxT5zbreMc9' \
    > test.out 2>&1
eval_tap $? 148 'ListExtOrderNoByExtTxId' test.out

#- 149 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'fBoU3RHNDFjLKFre' \
    > test.out 2>&1
eval_tap $? 149 'GetPaymentOrder' test.out

#- 150 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'py56eW1kmb15QeIQ' \
    --body '{"extTxId": "F51c4MqJzDSvELgB", "paymentMethod": "e6dboSdhkBzAzPkt", "paymentProvider": "ALIPAY"}' \
    > test.out 2>&1
eval_tap $? 150 'ChargePaymentOrder' test.out

#- 151 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'PBNHKPx62tHxDb06' \
    --body '{"description": "ZFy3uglSp2UxvF2u"}' \
    > test.out 2>&1
eval_tap $? 151 'RefundPaymentOrderByDedicated' test.out

#- 152 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'LXWilRD7HD6LCgdF' \
    --body '{"amount": 49, "currencyCode": "8aVSCN6oCETQ8gID", "notifyType": "CHARGE", "paymentProvider": "XSOLLA", "salesTax": 78, "vat": 47}' \
    > test.out 2>&1
eval_tap $? 152 'SimulatePaymentOrderNotification' test.out

#- 153 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ssMvy9gkfTMRrXVR' \
    > test.out 2>&1
eval_tap $? 153 'GetPaymentOrderChargeStatus' test.out

#- 154 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    > test.out 2>&1
eval_tap $? 154 'GetPlatformWalletConfig' test.out

#- 155 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    --body '{"allowedBalanceOrigins": ["Nintendo", "Playstation", "Epic"]}' \
    > test.out 2>&1
eval_tap $? 155 'UpdatePlatformWalletConfig' test.out

#- 156 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 156 'ResetPlatformWalletConfig' test.out

#- 157 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 157 'GetRevocationConfig' test.out

#- 158 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "ALWAYS_REVOKE"}}' \
    > test.out 2>&1
eval_tap $? 158 'UpdateRevocationConfig' test.out

#- 159 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'DeleteRevocationConfig' test.out

#- 160 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'eToFmkHJ6BPOKFLx' \
    --limit '71' \
    --offset '15' \
    --source 'ORDER' \
    --startTime 'EguCqlMHiQN3HWJw' \
    --status 'FAIL' \
    --transactionId 'zIWsiP2JQ24meDrw' \
    --userId 'EuTyM2qohglzO8AE' \
    > test.out 2>&1
eval_tap $? 160 'QueryRevocationHistories' test.out

#- 161 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 161 'GetRevocationPluginConfig' test.out

#- 162 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "l6A9sh2x2ur2ccp7"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "7OqPqIjS4i0N9ytb"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 162 'UpdateRevocationPluginConfig' test.out

#- 163 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 163 'DeleteRevocationPluginConfig' test.out

#- 164 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 164 'UploadRevocationPluginConfigCert' test.out

#- 165 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "h4UdEweeBsJEvBbA", "eventTopic": "vCmlh6Z1oz9BaixU", "maxAwarded": 95, "maxAwardedPerUser": 53, "namespaceExpression": "vmzbajE2gjooiDnc", "rewardCode": "1NUb51lEgUwQ9tkW", "rewardConditions": [{"condition": "aMOH47CAT7cBP091", "conditionName": "8JaEBQBP766LUnBB", "eventName": "R84iAO7sBQt6YJ2t", "rewardItems": [{"duration": 100, "endDate": "1972-07-04T00:00:00Z", "itemId": "klttmrpgF5szl0sM", "quantity": 53}, {"duration": 8, "endDate": "1975-06-04T00:00:00Z", "itemId": "3XrYZUiN24ol1qqb", "quantity": 0}, {"duration": 63, "endDate": "1976-09-16T00:00:00Z", "itemId": "gizL97ycJV5YqE2m", "quantity": 51}]}, {"condition": "gpFNw9K9pmAIc6VS", "conditionName": "fE9nbE2PMv12ZSRJ", "eventName": "kujxbCu1HFaj6Vxs", "rewardItems": [{"duration": 62, "endDate": "1987-07-23T00:00:00Z", "itemId": "uA4S1dS7H7yIS7b5", "quantity": 94}, {"duration": 19, "endDate": "1994-06-29T00:00:00Z", "itemId": "DRIoMg7Dc5APzfzX", "quantity": 60}, {"duration": 77, "endDate": "1986-12-06T00:00:00Z", "itemId": "LJFaIaEMW5bhJyL7", "quantity": 100}]}, {"condition": "sZTdFfC8x5aHLsXH", "conditionName": "lm1RJTTy9JrNz1K5", "eventName": "M1qgFddYvifGHawN", "rewardItems": [{"duration": 48, "endDate": "1972-01-16T00:00:00Z", "itemId": "yhniEHLbEQKc0aUv", "quantity": 36}, {"duration": 27, "endDate": "1990-03-04T00:00:00Z", "itemId": "DIjYC4df9qswSlpC", "quantity": 72}, {"duration": 86, "endDate": "1986-02-27T00:00:00Z", "itemId": "ulonMFjmYqE1wJhf", "quantity": 29}]}], "userIdExpression": "DwUj2HKUvPYUcQBx"}' \
    > test.out 2>&1
eval_tap $? 165 'CreateReward' test.out

#- 166 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'MSdOOsn2Nd8Jpa19' \
    --limit '66' \
    --offset '73' \
    --sortBy 'rewardCode:asc,rewardCode' \
    > test.out 2>&1
eval_tap $? 166 'QueryRewards' test.out

#- 167 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'ExportRewards' test.out

#- 168 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 168 'ImportRewards' test.out

#- 169 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'K46Eehx7xasqMY9a' \
    > test.out 2>&1
eval_tap $? 169 'GetReward' test.out

#- 170 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ulsL6NOV5agpS6A5' \
    --body '{"description": "mkufBpWVxIK9D2bT", "eventTopic": "cgaKoccaSwWcZmzC", "maxAwarded": 100, "maxAwardedPerUser": 36, "namespaceExpression": "GI1cIQcPWAShIhie", "rewardCode": "SKUf3zKbyQk2vQTY", "rewardConditions": [{"condition": "X1xsth28NZZgsXyc", "conditionName": "uQNGIDeHlf6IcX1K", "eventName": "9JrK6Or2xx7rLwrP", "rewardItems": [{"duration": 30, "endDate": "1979-11-29T00:00:00Z", "itemId": "iywnxuDLLuIaSxol", "quantity": 30}, {"duration": 72, "endDate": "1988-08-31T00:00:00Z", "itemId": "H1gBCWVFrvls0Zwo", "quantity": 37}, {"duration": 69, "endDate": "1989-08-30T00:00:00Z", "itemId": "hDlLfTKxpVOXvGSr", "quantity": 6}]}, {"condition": "RTI0i6dO3zkbDseh", "conditionName": "4tJdoGcwMBmegqVU", "eventName": "aWMJBjrV0p9A7tcH", "rewardItems": [{"duration": 36, "endDate": "1990-01-17T00:00:00Z", "itemId": "MbJGr4drgkDuWS05", "quantity": 24}, {"duration": 49, "endDate": "1998-05-18T00:00:00Z", "itemId": "pGzazM2BUXnzUEWT", "quantity": 17}, {"duration": 59, "endDate": "1989-01-21T00:00:00Z", "itemId": "MJAf6AgbiEDMfCck", "quantity": 66}]}, {"condition": "ogE5gcfF8AMGZ2FB", "conditionName": "S93Mg6TKwdRMraDL", "eventName": "rwh3d0ykRGkgqUNI", "rewardItems": [{"duration": 3, "endDate": "1999-10-12T00:00:00Z", "itemId": "xmIOjFLgKR4LjEWh", "quantity": 84}, {"duration": 20, "endDate": "1994-07-01T00:00:00Z", "itemId": "cvtQ92iD02YMvEUN", "quantity": 11}, {"duration": 31, "endDate": "1978-11-03T00:00:00Z", "itemId": "AlZwFGpea5ObBB49", "quantity": 75}]}], "userIdExpression": "exPekTsQxMTfaSot"}' \
    > test.out 2>&1
eval_tap $? 170 'UpdateReward' test.out

#- 171 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '7aohFYy4VxwHIJ9g' \
    > test.out 2>&1
eval_tap $? 171 'DeleteReward' test.out

#- 172 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'zxqAw4vBGQAeh0VT' \
    --body '{"payload": {"iTP4PSrXUS6jYI9l": {}, "sQFD43Df5qUZOFzp": {}, "Fd6b5Jc5TETHcup8": {}}}' \
    > test.out 2>&1
eval_tap $? 172 'CheckEventCondition' test.out

#- 173 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'GG0VCMTFJ6svTyo9' \
    --body '{"conditionName": "RHget5hzB52BDFop", "userId": "xUwkMuSqQnKzDgDA"}' \
    > test.out 2>&1
eval_tap $? 173 'DeleteRewardConditionRecord' test.out

#- 174 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'tqE3kuybwTQFYEJj' \
    --limit '72' \
    --offset '53' \
    --start 'YwqfSRy8GgVk77fd' \
    --storeId '1GS5YkyhAiAItnWU' \
    --viewId 'mD225fp1egsx3Erh' \
    > test.out 2>&1
eval_tap $? 174 'QuerySections' test.out

#- 175 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eNwqd5priclNNqLy' \
    --body '{"active": true, "displayOrder": 37, "endDate": "1976-11-26T00:00:00Z", "ext": {"zrJ4QHbfnAdtkujx": {}, "Hff7n1yaNCcjgFhS": {}, "0URBhl0L5FCbOn46": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 57, "itemCount": 100, "rule": "SEQUENCE"}, "items": [{"id": "uPQLrt2t6bVpCgKv", "sku": "PXSDufmKh783cV54"}, {"id": "JsVBRB0rY0xfWddA", "sku": "CyHSmo4KX9TPO3K1"}, {"id": "k5ZM8btmGsgXNXbp", "sku": "qxh76Af5JSwjw2fE"}], "localizations": {"2g6jXV7oai2oDm9F": {"description": "aP0HJ98tE4UyoQg0", "localExt": {"b0sGOkzxVt15LKmk": {}, "Q7YBhsOuJ0ypkkt2": {}, "G4eFh2YNsdoxpLTB": {}}, "longDescription": "M9Q8t829Ido1Jyve", "title": "SRiBq23kyH9jQbHW"}, "kcVk0X28GS54vl7g": {"description": "IKBc7OYTylFRAJKy", "localExt": {"SnC0cfPl3Z2zSBbs": {}, "4PAV72u8AxE2IQeo": {}, "xYV4UcYzswAGpXqQ": {}}, "longDescription": "xctuVaqPJGAHEZmu", "title": "QrZ8GaQ4OZ2nDodm"}, "4TNs8mAj6IKSYFdJ": {"description": "wgZsRPOzwuDSdGl1", "localExt": {"A2vaNeDiSqTfmAVg": {}, "50kOdJagEmTuaxlx": {}, "gywkbdOsyxX1tfW4": {}}, "longDescription": "88oYUT4jyCVJ0V8o", "title": "bTlGVThz4bm41oIc"}}, "name": "V33yjPxibDjfF7Jk", "rotationType": "CUSTOM", "startDate": "1984-08-24T00:00:00Z", "viewId": "3qbg55SyienCODZ0"}' \
    > test.out 2>&1
eval_tap $? 175 'CreateSection' test.out

#- 176 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mnOpPTVxEgBFzG8t' \
    > test.out 2>&1
eval_tap $? 176 'PurgeExpiredSection' test.out

#- 177 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'lkxWKCU1XN4gl7yH' \
    --storeId 'vEqpJSrDXVwCkhOQ' \
    > test.out 2>&1
eval_tap $? 177 'GetSection' test.out

#- 178 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '161TFjROYJm75VIu' \
    --storeId 'COCkt2W1DfI8QtgO' \
    --body '{"active": true, "displayOrder": 72, "endDate": "1976-10-28T00:00:00Z", "ext": {"QvRa7CDRTcsAHzD3": {}, "dZyyWbUQpbcv3Iwm": {}, "L7a1K3zIUYJmdF1Y": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 2, "itemCount": 99, "rule": "SEQUENCE"}, "items": [{"id": "NSQlcMzxfppNCrsc", "sku": "DPbklTHcmgXsrVj3"}, {"id": "Mjml6BpCODWGOLMm", "sku": "CZUeelXYyNrXweiC"}, {"id": "nDldRPRfd6mLZ0GT", "sku": "JwEjoZrRtaeWKMC8"}], "localizations": {"wsOByQAMAgqFEzEt": {"description": "8umj5XhKnw7MHDwF", "localExt": {"VKUC2ecnpUDqvLQi": {}, "xPKVSmWa8TGko16X": {}, "TqHc0cM7ixq8Tjnx": {}}, "longDescription": "p5Cl8ggaEmCcuK2h", "title": "HviBEWpbusO6EyVq"}, "stpgZpbz77y88rUF": {"description": "um2ZcA8iKcF0bkfj", "localExt": {"cTEFXcTwEtnHxP5p": {}, "VtN4jNVIdruEA39u": {}, "CJzsE8WObt6t0w8L": {}}, "longDescription": "OBxE15JYj4IqWK09", "title": "l4wkrzahXR1sDEDV"}, "KDINE3HjCiVR1dQ8": {"description": "kuhb4pUwnGptHUpl", "localExt": {"xzaDa9PDwhu31d8e": {}, "Odtrfq6ECDD6OGku": {}, "Ls9gNpNon6DKW9A6": {}}, "longDescription": "AmnQTNFidImWONTv", "title": "CPMGLdbYEknHPKrZ"}}, "name": "7TiNBE0HRsE0GHDO", "rotationType": "NONE", "startDate": "1980-03-22T00:00:00Z", "viewId": "H3RYxH2Up9VthPjF"}' \
    > test.out 2>&1
eval_tap $? 178 'UpdateSection' test.out

#- 179 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'rK7Hip0eONFDgUPS' \
    --storeId 'hG8wwFKY9AMpcwJd' \
    > test.out 2>&1
eval_tap $? 179 'DeleteSection' test.out

#- 180 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 180 'ListStores' test.out

#- 181 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "4SrigIxAhbFMZfxa", "defaultRegion": "znlDQbzTiFrQB1yU", "description": "onirH4URx3NkKQBY", "supportedLanguages": ["rlUaMiFEWUT8cAFO", "5zEw8GENEJYPKxxO", "w7xNQ98IEbc9YITN"], "supportedRegions": ["98j4P2AGeidXRRnI", "AJfKVjOn6rtILNJV", "v2DLLUyBt5hDs45s"], "title": "iG30Lv9iGa5mkZjn"}' \
    > test.out 2>&1
eval_tap $? 181 'CreateStore' test.out

#- 182 ImportStore
eval_tap 0 182 'ImportStore # SKIP deprecated' test.out

#- 183 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 183 'GetPublishedStore' test.out

#- 184 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 184 'DeletePublishedStore' test.out

#- 185 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 185 'GetPublishedStoreBackup' test.out

#- 186 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 186 'RollbackPublishedStore' test.out

#- 187 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RXVcg6AByNpBo2JY' \
    > test.out 2>&1
eval_tap $? 187 'GetStore' test.out

#- 188 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kwLdmR97u9MVUii4' \
    --body '{"defaultLanguage": "KpYcb1AUsESaBOTH", "defaultRegion": "nbX9tC9PQlFAGbMt", "description": "EybfcAl0mnsAkRT2", "supportedLanguages": ["k0AzdgIunRkTxsGd", "rpNELM8Lfkut0wnT", "24wh59RGSbBMh7jp"], "supportedRegions": ["szuVk6iPdJ2boQqC", "CyJfThvCJieqRSGN", "8Mm74HlSZzp4aEW4"], "title": "GkHG5OIVuGv47XJp"}' \
    > test.out 2>&1
eval_tap $? 188 'UpdateStore' test.out

#- 189 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kMiopQrVL3ZZTVxq' \
    > test.out 2>&1
eval_tap $? 189 'DeleteStore' test.out

#- 190 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'a9XM2gY14iWk12Jf' \
    --action 'CREATE' \
    --itemSku '75lkjQNHrjaboGom' \
    --itemType 'BUNDLE' \
    --limit '51' \
    --offset '41' \
    --selected  \
    --sortBy 'updatedAt:desc,createdAt:asc,updatedAt' \
    --status 'UNPUBLISHED' \
    --type 'VIEW' \
    --updatedAtEnd 'euZh5qtrRbNnGejd' \
    --updatedAtStart 'TGvZgN5hshSe5YmZ' \
    > test.out 2>&1
eval_tap $? 190 'QueryChanges' test.out

#- 191 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XKEQLkM6o3eGSP4H' \
    > test.out 2>&1
eval_tap $? 191 'PublishAll' test.out

#- 192 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tmr90TqGf0OyqJ9i' \
    > test.out 2>&1
eval_tap $? 192 'PublishSelected' test.out

#- 193 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bJMmRgoxNwp1lGkY' \
    > test.out 2>&1
eval_tap $? 193 'SelectAllRecords' test.out

#- 194 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oq8HP1TM0tefVQPW' \
    --action 'UPDATE' \
    --itemSku '1NPO5Wn7rNG8rGp7' \
    --itemType 'OPTIONBOX' \
    --type 'CATEGORY' \
    --updatedAtEnd 'advo5EzpX0IttsRe' \
    --updatedAtStart 'zyY9GB5sf94ALBmv' \
    > test.out 2>&1
eval_tap $? 194 'GetStatistic' test.out

#- 195 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dncQkcZb8cWdVH9b' \
    > test.out 2>&1
eval_tap $? 195 'UnselectAllRecords' test.out

#- 196 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'ww15zZsaYrJAe5Kd' \
    --namespace "$AB_NAMESPACE" \
    --storeId '5QB96ndlO6iPGC9R' \
    > test.out 2>&1
eval_tap $? 196 'SelectRecord' test.out

#- 197 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'hzMC7V8BEphnRXnS' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pCzyb8FkoxQbrPng' \
    > test.out 2>&1
eval_tap $? 197 'UnselectRecord' test.out

#- 198 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'i87K58pQswqKLutI' \
    --targetStoreId 'NusOsa92F6iwkJIY' \
    > test.out 2>&1
eval_tap $? 198 'CloneStore' test.out

#- 199 ExportStore
eval_tap 0 199 'ExportStore # SKIP deprecated' test.out

#- 200 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'LarmpWyvib9CDW21' \
    --limit '55' \
    --offset '80' \
    --sku 'NrlpuXD9H1u1CvzW' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    --userId 'Zwkj1l6bf2F9EXOB' \
    > test.out 2>&1
eval_tap $? 200 'QuerySubscriptions' test.out

#- 201 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'j7v8LHYivmD0ekyc' \
    > test.out 2>&1
eval_tap $? 201 'RecurringChargeSubscription' test.out

#- 202 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'MKlwJTNL2UCWUtaA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 202 'GetTicketDynamic' test.out

#- 203 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'D7ZZx1iefATWcDSq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "GYRMdz07xEJ40eps"}' \
    > test.out 2>&1
eval_tap $? 203 'DecreaseTicketSale' test.out

#- 204 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'sgJJC3CX0hpB1ZGM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 204 'GetTicketBoothID' test.out

#- 205 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'Mo5DSozCuFsrBMto' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 83, "orderNo": "hcvszzQLZBktk0si"}' \
    > test.out 2>&1
eval_tap $? 205 'IncreaseTicketSale' test.out

#- 206 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mup01kyaFwwD7wec' \
    --body '{"achievements": [{"id": "uQb4GNQHVZMKGBnz", "value": 15}, {"id": "tb82b96rsH73hRfD", "value": 12}, {"id": "g3oeuHiNyLkfPQPm", "value": 19}], "steamUserId": "ufkDFLYyNBPlMrks"}' \
    > test.out 2>&1
eval_tap $? 206 'UnlockSteamUserAchievement' test.out

#- 207 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'e9SGcMuV5phhU315' \
    --xboxUserId 'LUC6HSMQ32UznXNd' \
    > test.out 2>&1
eval_tap $? 207 'GetXblUserAchievements' test.out

#- 208 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '6ve29lqqtcLJW9eT' \
    --body '{"achievements": [{"id": "JvKNDFrx6LabyDnq", "percentComplete": 20}, {"id": "jXKPIcxh0x7T6RQG", "percentComplete": 28}, {"id": "tovSMFw8X4zxbdfX", "percentComplete": 12}], "serviceConfigId": "xL07ZzzIs3Jke34Z", "titleId": "AUuLP897ooMLnemw", "xboxUserId": "KAvgDXNrFEE4Jf4h"}' \
    > test.out 2>&1
eval_tap $? 208 'UpdateXblUserAchievement' test.out

#- 209 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'QpsLOcLtZw0efmEV' \
    > test.out 2>&1
eval_tap $? 209 'AnonymizeCampaign' test.out

#- 210 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'cW7mxbS5UOoICxQM' \
    > test.out 2>&1
eval_tap $? 210 'AnonymizeEntitlement' test.out

#- 211 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'it8555Niy4NNFpRE' \
    > test.out 2>&1
eval_tap $? 211 'AnonymizeFulfillment' test.out

#- 212 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId '5pS85yTIRWvLRy58' \
    > test.out 2>&1
eval_tap $? 212 'AnonymizeIntegration' test.out

#- 213 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'UKWPv3F7S0wCVlYQ' \
    > test.out 2>&1
eval_tap $? 213 'AnonymizeOrder' test.out

#- 214 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'i9cfMCeNnu6OIG1P' \
    > test.out 2>&1
eval_tap $? 214 'AnonymizePayment' test.out

#- 215 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'PLRDEXLXZWXvqNCH' \
    > test.out 2>&1
eval_tap $? 215 'AnonymizeRevocation' test.out

#- 216 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'vNpeMjMzguq6HFIq' \
    > test.out 2>&1
eval_tap $? 216 'AnonymizeSubscription' test.out

#- 217 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'aqwH9J6JLb5f3SBM' \
    > test.out 2>&1
eval_tap $? 217 'AnonymizeWallet' test.out

#- 218 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'yJUdwEBRrHAWUFqT' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 218 'GetUserDLCByPlatform' test.out

#- 219 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'QmJHNffZENs9X0hF' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 219 'GetUserDLC' test.out

#- 220 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '2byOwXgKyPhXmcys' \
    --activeOnly  \
    --appType 'DEMO' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'e8HpWH4xiz3fWthJ' \
    --features 'Su2pUIIuPLFAtcWh,jAP57QbWvSSp71zE,PPfmAQiqRRC2caqu' \
    --itemId 'MRtQOILcaDqUITBH,QR5ISNoFR3GUxdMu,vmL0UBfwzaaeP3Wd' \
    --limit '61' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 220 'QueryUserEntitlements' test.out

#- 221 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'TRqjlvwnnCA5tfK5' \
    --body '[{"endDate": "1981-06-03T00:00:00Z", "grantedCode": "xoCurq4lpHXrbVBh", "itemId": "60NUA2aKQwnXrmi6", "itemNamespace": "ya8u4sQPvaf1Acwe", "language": "KLTX_ntms", "quantity": 2, "region": "6iic1FIMyF7CcNu2", "source": "REFERRAL_BONUS", "startDate": "1987-11-22T00:00:00Z", "storeId": "n6E9Gk51kOTJZluT"}, {"endDate": "1973-12-08T00:00:00Z", "grantedCode": "kDMCGUJvERxNg8dj", "itemId": "Sb4Vt2vKQ5vlCdI5", "itemNamespace": "19Pf2iogwxM5DZM0", "language": "AH_Co", "quantity": 30, "region": "BQWUHDBnBeePkqg6", "source": "PURCHASE", "startDate": "1979-04-10T00:00:00Z", "storeId": "Lr5BlO8K6LH4dSaa"}, {"endDate": "1991-07-19T00:00:00Z", "grantedCode": "YHug51ZTogG0N7Hv", "itemId": "nuq1kJ1kpHcQtnIc", "itemNamespace": "9z70LFQMI0oZuEjY", "language": "zoI_BbCY-957", "quantity": 40, "region": "Y7Xd0OoENg2Lw7ue", "source": "OTHER", "startDate": "1986-04-12T00:00:00Z", "storeId": "FaEUkPUBnB0ZEJH3"}]' \
    > test.out 2>&1
eval_tap $? 221 'GrantUserEntitlement' test.out

#- 222 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ebM71Tg922xiBgHS' \
    --activeOnly  \
    --appId 'ka0Pz7I1WkIa0oZ1' \
    > test.out 2>&1
eval_tap $? 222 'GetUserAppEntitlementByAppId' test.out

#- 223 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'nXpW1l70pcZgIn4l' \
    --activeOnly  \
    --limit '85' \
    --offset '49' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 223 'QueryUserEntitlementsByAppType' test.out

#- 224 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '0iX05IT9Agsjl5Nm' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --itemId 'kJFQxuMHnfOlX6HY' \
    > test.out 2>&1
eval_tap $? 224 'GetUserEntitlementByItemId' test.out

#- 225 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'VEiaereFCPJU2wEz' \
    --ids 'UYUTmZ8JSMeNmRoc,p400RZe8Bzx9aGEI,22BTCZs97TJI8GPr' \
    > test.out 2>&1
eval_tap $? 225 'GetUserActiveEntitlementsByItemIds' test.out

#- 226 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'M24F3celFgM62HQt' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --sku 'kMQVjKk3bWJ0ZuYS' \
    > test.out 2>&1
eval_tap $? 226 'GetUserEntitlementBySku' test.out

#- 227 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'e3sI0x2hc8vaN1Of' \
    --appIds 'f5gRZZMW3huAIzBP,WBYKAEFTdlKNh6GT,zKjsCqxx24QM35bS' \
    --itemIds 'kFrvGciNHb7OY5YI,pOLJW52uz3c8pz63,M0g4xXT5Ts4e0uR4' \
    --skus '7OzUGHeBKtpvyRNg,jZkdDppvEJiUiDGX,gh8BKcLqtRZ93LuR' \
    > test.out 2>&1
eval_tap $? 227 'ExistsAnyUserActiveEntitlement' test.out

#- 228 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '8OEyICvwgwBFehwt' \
    --itemIds 'dJLdn3R2wo8beVQv,geP9qOHaLwYnXxrz,7sLmP70LxN0f3JA2' \
    > test.out 2>&1
eval_tap $? 228 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 229 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '7Qz5SjzQfOLYu9O4' \
    --appId '6OOzz9p57qSpHerz' \
    > test.out 2>&1
eval_tap $? 229 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 230 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'O87cg7TqtMiQgi7A' \
    --entitlementClazz 'CODE' \
    --itemId 'suYiIPei0pXglJYn' \
    > test.out 2>&1
eval_tap $? 230 'GetUserEntitlementOwnershipByItemId' test.out

#- 231 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'KkoCAZuolAWnxkIm' \
    --ids 'VbDP0QX31gI7VmnG,IRMvXe6BiphIFe2b,zr6qQw6fSESkM19O' \
    > test.out 2>&1
eval_tap $? 231 'GetUserEntitlementOwnershipByItemIds' test.out

#- 232 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'PMBb12gpmShlmIt2' \
    --entitlementClazz 'CODE' \
    --sku 'rMeD4bD8gISE34yI' \
    > test.out 2>&1
eval_tap $? 232 'GetUserEntitlementOwnershipBySku' test.out

#- 233 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'AZQeigiA3wBrmBYI' \
    > test.out 2>&1
eval_tap $? 233 'RevokeAllEntitlements' test.out

#- 234 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'lZeheP72AB8EO3Yr' \
    --entitlementIds 'lyrWowUpUDVLlTtu' \
    > test.out 2>&1
eval_tap $? 234 'RevokeUserEntitlements' test.out

#- 235 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'JJsHZVsG6izJZruO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JvSRFLDSdj8elbtH' \
    > test.out 2>&1
eval_tap $? 235 'GetUserEntitlement' test.out

#- 236 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'vDU91DmHzwiqVPCJ' \
    --namespace "$AB_NAMESPACE" \
    --userId '5j18Ou3aY8nceFU5' \
    --body '{"endDate": "1987-11-07T00:00:00Z", "nullFieldList": ["KmcEKp8AQwqgJs6O", "0Qj0ccMkdz6zPz3B", "VHAqp4O9XSjap24e"], "startDate": "1980-09-12T00:00:00Z", "status": "REVOKED", "useCount": 38}' \
    > test.out 2>&1
eval_tap $? 236 'UpdateUserEntitlement' test.out

#- 237 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'jh6Wc3migf2n6iQy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'r5cb5YL6fwBiaVPm' \
    --body '{"options": ["mn0T5uzlmi2NY26x", "rkPPdg3pXjmtpNfC", "rIj9ntYo3dupUHNu"], "requestId": "8abrVVOKxr9Pa315", "useCount": 65}' \
    > test.out 2>&1
eval_tap $? 237 'ConsumeUserEntitlement' test.out

#- 238 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'cr2WJQqS7Tq4YIyZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AFQ6lZfa2jdNvpWf' \
    > test.out 2>&1
eval_tap $? 238 'DisableUserEntitlement' test.out

#- 239 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId '32JS1av9VNpVLT0L' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vqcfSdO1nAjY5FvA' \
    > test.out 2>&1
eval_tap $? 239 'EnableUserEntitlement' test.out

#- 240 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'Db3GUQgci632w6LU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rHuKBoNTpPQXDNHt' \
    > test.out 2>&1
eval_tap $? 240 'GetUserEntitlementHistories' test.out

#- 241 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'o74GcmVf0fbCU9Qd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PuWeMEeL0EJG67g4' \
    > test.out 2>&1
eval_tap $? 241 'RevokeUserEntitlement' test.out

#- 242 RevokeUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUseCount \
    --entitlementId 'W1eAmDxP23qstMui' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kKc6VNU8570siWm3' \
    --body '{"reason": "V9sirE0JOQxWeHyp", "useCount": 33}' \
    > test.out 2>&1
eval_tap $? 242 'RevokeUseCount' test.out

#- 243 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'WnRTglw0gdWoE4es' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uiDrquccz4J6fFQe' \
    --body '{"requestId": "zJ5E3iYHIknvPcJk", "useCount": 19}' \
    > test.out 2>&1
eval_tap $? 243 'SellUserEntitlement' test.out

#- 244 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'iT9s9pK8HuUY1QQH' \
    --body '{"duration": 88, "endDate": "1986-05-13T00:00:00Z", "itemId": "NCEddJtx6GV01vD7", "itemSku": "lNLxlpvqaB9P9Gau", "language": "kfCEIeSBLhTfzigz", "metadata": {"HcRuJgYaj4I8Dzyh": {}, "1N0JEKNoMtHvjM7X": {}, "1fjzknv2HZMIL2P2": {}}, "order": {"currency": {"currencyCode": "bh14LroFTnAuujPe", "currencySymbol": "P9N0vdVB5a2XkS3X", "currencyType": "REAL", "decimals": 10, "namespace": "OoLVM7UFnuJDzeEk"}, "ext": {"DxaVogxHrOon2OW4": {}, "Zw5QwVKWNy2tnF2M": {}, "ifJR4hr4gdJDujYn": {}}, "free": false}, "orderNo": "nGlYZ2tod2BGBXjN", "origin": "Playstation", "overrideBundleItemQty": {"YnQ3jOGmROIqxqQ0": 12, "Dms3kb1htW0UGJpw": 87, "wmOCKpFSMF0tfGIZ": 59}, "quantity": 46, "region": "TNiIRc9fEjkZhEpA", "source": "PAYMENT", "startDate": "1990-08-22T00:00:00Z", "storeId": "9HmcxzjDhTrcBKtU"}' \
    > test.out 2>&1
eval_tap $? 244 'FulfillItem' test.out

#- 245 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '956hOg8oukDVdweG' \
    --body '{"code": "0sFHxTHa2k60SzCq", "language": "zGTQ_zmFB", "region": "cIMevTmC631p7q79"}' \
    > test.out 2>&1
eval_tap $? 245 'RedeemCode' test.out

#- 246 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '4bu49lINFTtERAXT' \
    --body '{"metadata": {"2h3hcQ2wV3ZbBTnN": {}, "QnVUhA5WnzVZdj8t": {}, "syzC4QaLXp3o4TDr": {}}, "origin": "Epic", "rewards": [{"currency": {"currencyCode": "I4lwXqwPfq3VzHQj", "namespace": "tolx64w1gyvjacKt"}, "item": {"itemId": "GqxMnoAXRlcq0mYW", "itemSku": "KQYlqMmu2pvF6rP0", "itemType": "3bQaq1cT88H6RCW8"}, "quantity": 14, "type": "ITEM"}, {"currency": {"currencyCode": "JmGzDlqxtLsR2AGO", "namespace": "iPhNt2IdH8aYYUT6"}, "item": {"itemId": "mma833TDzk66ix88", "itemSku": "sAUrXr7MXxCvyy7c", "itemType": "axz4MQrODLNlxiEj"}, "quantity": 88, "type": "CURRENCY"}, {"currency": {"currencyCode": "BCZx9DJ4V97SJLlr", "namespace": "wXmIGamRCARuFLx4"}, "item": {"itemId": "rV4CXVMrDYKe2eTf", "itemSku": "1axo16GqT2vSLLiM", "itemType": "vcu39YZJypWzpNXg"}, "quantity": 28, "type": "CURRENCY"}], "source": "ORDER_REVOCATION", "transactionId": "OZ9WNl3apJmNAbl1"}' \
    > test.out 2>&1
eval_tap $? 246 'FulfillRewards' test.out

#- 247 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'g5ZmTTGYRbP4QVey' \
    --endTime '9pEz1TV5cUtPBsw0' \
    --limit '43' \
    --offset '17' \
    --productId 'wPgyUzBUWiKoNGtv' \
    --startTime 'yk5xEfrJDxKsw5Xl' \
    --status 'FAILED' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 247 'QueryUserIAPOrders' test.out

#- 248 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'VqxXnRhDd9TGkO6a' \
    > test.out 2>&1
eval_tap $? 248 'QueryAllUserIAPOrders' test.out

#- 249 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'IYqftw1SrM2nhSEa' \
    --endTime 'nfUYrMU6A43UKGpv' \
    --limit '58' \
    --offset '40' \
    --startTime '1cr5T1PSXhduTWch' \
    --status 'PENDING' \
    --type 'TWITCH' \
    > test.out 2>&1
eval_tap $? 249 'QueryUserIAPConsumeHistory' test.out

#- 250 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'PY0txzvYwv7atn9E' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "ZKwu", "productId": "L8p6AbdtU0CDrlQp", "region": "KB8qoel2QK3aSOYd", "transactionId": "mMDikc3Fjm9HoQDe", "type": "OCULUS"}' \
    > test.out 2>&1
eval_tap $? 250 'MockFulfillIAPItem' test.out

#- 251 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'GQMwNwDlYSli3p8Y' \
    --itemId 'aAdel3hHMSLAiscG' \
    --limit '88' \
    --offset '64' \
    --status 'FULFILL_FAILED' \
    > test.out 2>&1
eval_tap $? 251 'QueryUserOrders' test.out

#- 252 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'VDCBcvVegrZddP8l' \
    --body '{"currencyCode": "LQo6tHj4z4cAM4LM", "currencyNamespace": "JfWNZIxAgBpeubpr", "discountedPrice": 74, "ext": {"2LpE0qfbvdU8hlDo": {}, "C9FnxqBlPBYJ7X6u": {}, "Vy7FWTSfMi2CPVGx": {}}, "itemId": "jcdpdCqVeePMSqb8", "language": "y8qJTUQY40Zrpn0v", "options": {"skipPriceValidation": true}, "platform": "Other", "price": 61, "quantity": 41, "region": "9YsPeDWrAVQZSvgW", "returnUrl": "uCuLsUGrVQAbhS54", "sandbox": false, "sectionId": "uQHKersDmJLUHAKt"}' \
    > test.out 2>&1
eval_tap $? 252 'AdminCreateUserOrder' test.out

#- 253 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'fXCKOna8DdjtZhh6' \
    --itemId 'ofsUoRh6r0e0J6vy' \
    > test.out 2>&1
eval_tap $? 253 'CountOfPurchasedItem' test.out

#- 254 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'qPw7YlmV3kES0Hi8' \
    --userId '8UYgSV40OvY7apPC' \
    > test.out 2>&1
eval_tap $? 254 'GetUserOrder' test.out

#- 255 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rN5bEhmuHgKeWizE' \
    --userId 'pw1zN0mOYgGhHMz9' \
    --body '{"status": "CHARGEBACK_REVERSED", "statusReason": "pbdJeVCiKs2vLyH9"}' \
    > test.out 2>&1
eval_tap $? 255 'UpdateUserOrderStatus' test.out

#- 256 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'kcSBdk7MwQzn28Le' \
    --userId '5neohqhCzroAzWQD' \
    > test.out 2>&1
eval_tap $? 256 'FulfillUserOrder' test.out

#- 257 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 've0Z2G2N09VIbbsz' \
    --userId '24fQKDZX6plErw0G' \
    > test.out 2>&1
eval_tap $? 257 'GetUserOrderGrant' test.out

#- 258 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'b0ceCbphW4YMhJ0S' \
    --userId '50bez9ZLHW882rii' \
    > test.out 2>&1
eval_tap $? 258 'GetUserOrderHistories' test.out

#- 259 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'PfRQ3rJ0f5lwXvRN' \
    --userId 'DBnmL1KQn77hiP1l' \
    --body '{"additionalData": {"cardSummary": "zkzjYDw6mLBordrJ"}, "authorisedTime": "1976-07-14T00:00:00Z", "chargebackReversedTime": "1986-05-29T00:00:00Z", "chargebackTime": "1999-06-20T00:00:00Z", "chargedTime": "1972-07-23T00:00:00Z", "createdTime": "1973-11-15T00:00:00Z", "currency": {"currencyCode": "0uRMT1Xw9K9Yb68a", "currencySymbol": "8ygYx2TqkhlqMnE9", "currencyType": "REAL", "decimals": 52, "namespace": "90EQzOidrWnLrXqI"}, "customParameters": {"mgDf3GaJsdCZND0w": {}, "gYOilX1e1825iasu": {}, "nESjcgr2drXG5NkK": {}}, "extOrderNo": "CySLA8cKCs0dFYRS", "extTxId": "a2OULZ0iOZJiOAh1", "extUserId": "SpLhMF2Pav11FuU8", "issuedAt": "1975-06-21T00:00:00Z", "metadata": {"XCRz8KgqgwijYxpG": "hsFArq6lolbj7QKv", "tVRCPMjr5M3vw1Gq": "UjjFp6R8mYZwKftV", "qSECsypS42NmYQ8H": "lHbHnfs4tLVOYQCW"}, "namespace": "MktmiKd9vLPP0w52", "nonceStr": "JRAZxMWdoleYNHXe", "paymentMethod": "OpaRDwYLge851PbK", "paymentMethodFee": 88, "paymentOrderNo": "MFKvw5TWjAh4gy41", "paymentProvider": "XSOLLA", "paymentProviderFee": 76, "paymentStationUrl": "ZDRNkk4DJUofJXK8", "price": 89, "refundedTime": "1988-09-21T00:00:00Z", "salesTax": 91, "sandbox": true, "sku": "0zCYRVmbfzwUmsy0", "status": "CHARGED", "statusReason": "fPNI9f2oLWDPSZex", "subscriptionId": "fKVxqdxmh5QWxuQu", "subtotalPrice": 71, "targetNamespace": "ZcYerH933X7iXEEM", "targetUserId": "2KOusNEHcI95GGdJ", "tax": 44, "totalPrice": 78, "totalTax": 43, "txEndTime": "1990-01-15T00:00:00Z", "type": "wJZquMQSPp5XD4S1", "userId": "ilfgff7Et4uY8nlB", "vat": 45}' \
    > test.out 2>&1
eval_tap $? 259 'ProcessUserOrderNotification' test.out

#- 260 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'duXvZUbQQ13FhD3N' \
    --userId 'ExUFipJsUiDawAjg' \
    > test.out 2>&1
eval_tap $? 260 'DownloadUserOrderReceipt' test.out

#- 261 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'HFQk0VzWRNFNiUn2' \
    --body '{"currencyCode": "yXMSCcHADYpS861c", "currencyNamespace": "0CJ7LzpFvOSF6xKA", "customParameters": {"6yrnvXY5dDwneac7": {}, "5C6S2eHsH4Y84hL7": {}, "5QboMHCtzEF9FSeg": {}}, "description": "6WYgtfuqJHrs4e3R", "extOrderNo": "nWR30MdBZezfwc3H", "extUserId": "0qSbMq4GLj8aGsH0", "itemType": "EXTENSION", "language": "fiQe", "metadata": {"IEqIFEcS0ynIMOYW": "pUYUQMooiKT57rmb", "jEnimeR7EFBz43E9": "FkOPVu2fDtOjW1iS", "YQbcebBd5wb5H3qp": "poCiHMD4iBK2O7qY"}, "notifyUrl": "tOHV5hnpjc5CNLnn", "omitNotification": true, "platform": "xFY8E6pU8eHjh0aT", "price": 20, "recurringPaymentOrderNo": "eJg7y4Q9CU3fjSRa", "region": "XD4HDmdvhMXxiKR2", "returnUrl": "9LKIhNU43K8bihdw", "sandbox": false, "sku": "prp0UHlWUxkBefhx", "subscriptionId": "Rtrqbv56oqwnCLVc", "title": "2qHZuuedbBOd19Dq"}' \
    > test.out 2>&1
eval_tap $? 261 'CreateUserPaymentOrder' test.out

#- 262 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ZJRYV1oqNLmPAUIM' \
    --userId 'wa2wYq6DsUq38bYv' \
    --body '{"description": "aWLoKzHnngdfFnOf"}' \
    > test.out 2>&1
eval_tap $? 262 'RefundUserPaymentOrder' test.out

#- 263 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y9stXH6LYXXMndxB' \
    --body '{"code": "PKmHVB7cNzHhvxc4", "orderNo": "xAPZ86WNnQOhusPn"}' \
    > test.out 2>&1
eval_tap $? 263 'ApplyUserRedemption' test.out

#- 264 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '4466u8agb5HPsBU0' \
    --body '{"meta": {"Eo6QJ9vBRJ4UP09f": {}, "abC01Thm9f4AWpyi": {}, "KVT3OvEujx5yjtQS": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Steam", "currencyCode": "z4rXlH5jw99HxCjX", "namespace": "WcaXBcfXXeV7BXef"}, "entitlement": {"entitlementId": "sSgZxSYnVwXqF6K0"}, "item": {"itemIdentity": "WA76Kl2mHHoz6qBQ", "itemIdentityType": "ITEM_ID", "origin": "Oculus"}, "quantity": 61, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Steam", "currencyCode": "YZzOg113h6fIaHSx", "namespace": "5bClxUOBmMwv5pmi"}, "entitlement": {"entitlementId": "IVnhlLoMemsp7o3F"}, "item": {"itemIdentity": "2LQw7Y2VdSxgXez7", "itemIdentityType": "ITEM_SKU", "origin": "Epic"}, "quantity": 59, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "JLVQQPa7PPx4Zi6W", "namespace": "aC8wk7HMbJhNwZgf"}, "entitlement": {"entitlementId": "5nlMDORYuXnPNJga"}, "item": {"itemIdentity": "yPFcyUnKXA3mcyMm", "itemIdentityType": "ITEM_SKU", "origin": "System"}, "quantity": 15, "type": "ENTITLEMENT"}], "source": "IAP", "transactionId": "8hVs29WOKmZRTtgy"}' \
    > test.out 2>&1
eval_tap $? 264 'DoRevocation' test.out

#- 265 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'cLzXz6lUMKi5mweM' \
    --body '{"gameSessionId": "EZo2ZnL1Zg2JfH4f", "payload": {"73jAevOnES6YJLlb": {}, "2AfUEEBbqMMKvkOs": {}, "R1fHUyirMVMOFES2": {}}, "scid": "J2OzNlJE3uqZz574", "sessionTemplateName": "g31cA0PwZxTIZVSG"}' \
    > test.out 2>&1
eval_tap $? 265 'RegisterXblSessions' test.out

#- 266 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'QyTzhs9Asy4d629N' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'nolVWA2dWxBs056j' \
    --limit '20' \
    --offset '86' \
    --sku '31vlCiZAZHCWMXxV' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 266 'QueryUserSubscriptions' test.out

#- 267 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'HTrKqVwnpPn8N5xM' \
    --excludeSystem  \
    --limit '90' \
    --offset '87' \
    --subscriptionId 'gU7cPqNZrLCRRUys' \
    > test.out 2>&1
eval_tap $? 267 'GetUserSubscriptionActivities' test.out

#- 268 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ya4J3rvTzMTMSwrN' \
    --body '{"grantDays": 30, "itemId": "QPEp5UtwUWGt6too", "language": "HP5kAww01zalTddh", "reason": "AQ1pwqnybvUIfuul", "region": "meegRwPPbn7lttd2", "source": "1cS6IVE4fzwG3BHa"}' \
    > test.out 2>&1
eval_tap $? 268 'PlatformSubscribeSubscription' test.out

#- 269 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'RcZ8NK4gkLmvEOaR' \
    --itemId 'cqTgF0xtQAXoDoFk' \
    > test.out 2>&1
eval_tap $? 269 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 270 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'mA3fgzcwdgJMjIyG' \
    --userId 'fiNBQy41M1gzGCba' \
    > test.out 2>&1
eval_tap $? 270 'GetUserSubscription' test.out

#- 271 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'xw33rNbE4bbDU4FM' \
    --userId 'TbQaANJOODGerDCW' \
    > test.out 2>&1
eval_tap $? 271 'DeleteUserSubscription' test.out

#- 272 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'cl3VSJENQopeHD6i' \
    --userId 'KBGm5Cj7RqnJUmfD' \
    --force  \
    --body '{"immediate": false, "reason": "OeqE7fcCAeExeQX4"}' \
    > test.out 2>&1
eval_tap $? 272 'CancelSubscription' test.out

#- 273 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '3LpmdMiZeyIrA4QU' \
    --userId 'KSJgECzvaWUCA7wK' \
    --body '{"grantDays": 36, "reason": "MKSQjFdjqTaZFsWz"}' \
    > test.out 2>&1
eval_tap $? 273 'GrantDaysToSubscription' test.out

#- 274 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'bqwTZQIN5jC6a8mE' \
    --userId 'VCXHmFnrSL0PJcZQ' \
    --excludeFree  \
    --limit '1' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 274 'GetUserSubscriptionBillingHistories' test.out

#- 275 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'CeNLYxMID9pqZ5rr' \
    --userId 'yiMMt6fQtLhzylaq' \
    --body '{"additionalData": {"cardSummary": "uioT3QBt29AiRASs"}, "authorisedTime": "1981-01-13T00:00:00Z", "chargebackReversedTime": "1987-11-11T00:00:00Z", "chargebackTime": "1984-04-19T00:00:00Z", "chargedTime": "1971-06-09T00:00:00Z", "createdTime": "1974-08-14T00:00:00Z", "currency": {"currencyCode": "Gw7XcF1Qwzz606UG", "currencySymbol": "XPhoNZlXMef7AvS3", "currencyType": "REAL", "decimals": 10, "namespace": "r3ZQNBBkrXu9czsY"}, "customParameters": {"r3cFeVw70xdNTuOd": {}, "LKK0M2B2hbqJin37": {}, "P69t1KqeGz7qbPnX": {}}, "extOrderNo": "EuOzzkoBmMR9C4qP", "extTxId": "qJrAdh1HIk7vCEq7", "extUserId": "FQ2S5VeW9ddxzLPV", "issuedAt": "1999-06-26T00:00:00Z", "metadata": {"wDdSkNfHJtA3QiX9": "ZvtydbaVb0scd97A", "0GP6djn2Ps3IVT5h": "UZ3cnDq0ddZG0Epf", "GAqHKcSxUc2YgRpk": "2IFGIgIpscUpVAci"}, "namespace": "u2XPPUxzXHUvxhvT", "nonceStr": "ZcvRKoaM4ozSAg8F", "paymentMethod": "TLrByWOJhbocoGlP", "paymentMethodFee": 51, "paymentOrderNo": "O9XrgXNIaU11cBXL", "paymentProvider": "WALLET", "paymentProviderFee": 48, "paymentStationUrl": "TfopqeZtHJnRgaGf", "price": 77, "refundedTime": "1991-09-15T00:00:00Z", "salesTax": 5, "sandbox": false, "sku": "Q99M1yuXeqV31LX2", "status": "AUTHORISE_FAILED", "statusReason": "YARape2tsNczam4C", "subscriptionId": "dd1QYvww4XDokltg", "subtotalPrice": 33, "targetNamespace": "mVzePIroz41oQCuX", "targetUserId": "eTRyJQrNLTcqLVTN", "tax": 51, "totalPrice": 87, "totalTax": 16, "txEndTime": "1973-08-14T00:00:00Z", "type": "4tjPGpu27yxb1of7", "userId": "9zVTWIfgdNphqe9f", "vat": 91}' \
    > test.out 2>&1
eval_tap $? 275 'ProcessUserSubscriptionNotification' test.out

#- 276 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'L9rPkV5GkSrcl2O4' \
    --namespace "$AB_NAMESPACE" \
    --userId '7XVzU7qlNVk7qnmB' \
    --body '{"count": 91, "orderNo": "FgS4fLqlrKGiS3Xx"}' \
    > test.out 2>&1
eval_tap $? 276 'AcquireUserTicket' test.out

#- 277 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'jkyNfj3XgTRTjI9o' \
    > test.out 2>&1
eval_tap $? 277 'QueryUserCurrencyWallets' test.out

#- 278 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'NBzgQ4CRwg0sKVeS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pMny0GrvKI5EVB9Z' \
    --body '{"allowOverdraft": true, "amount": 20, "balanceOrigin": "Twitch", "balanceSource": "IAP_REVOCATION", "metadata": {"NsjdCFtKY0KsxR0r": {}, "CFkyiQZfMnTbKdwN": {}, "hiIP7dpJ8B8VwFQn": {}}, "reason": "Vco2oCn1KvJmbjap"}' \
    > test.out 2>&1
eval_tap $? 278 'DebitUserWalletByCurrencyCode' test.out

#- 279 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'W9UlEqtzDd7Sgxdx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'B5kvtM8ah9bPsksc' \
    --limit '10' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 279 'ListUserCurrencyTransactions' test.out

#- 280 CheckWallet
eval_tap 0 280 'CheckWallet # SKIP deprecated' test.out

#- 281 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'GUEX8ERZcKSYLo6y' \
    --namespace "$AB_NAMESPACE" \
    --userId '7yJMowQ6LpHCvCYT' \
    --body '{"amount": 14, "expireAt": "1999-02-26T00:00:00Z", "metadata": {"9JQwErzjtuP9pUUv": {}, "7qefNMFsZAIqak1z": {}, "i0JSa5cRn31D8ubf": {}}, "origin": "Epic", "reason": "aCnL816aH6gOBUIM", "source": "CONSUME_ENTITLEMENT"}' \
    > test.out 2>&1
eval_tap $? 281 'CreditUserWallet' test.out

#- 282 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode '8bD5mGFFmKTTUxG0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mpmFxxDNXGlGJvHf' \
    --body '{"amount": 59, "metadata": {"58h1ltyhiSGhfqXh": {}, "xBJ7zLXioAGkWgSD": {}, "dDQvpRfGe3z2rtjW": {}}, "walletPlatform": "Oculus"}' \
    > test.out 2>&1
eval_tap $? 282 'PayWithUserWallet' test.out

#- 283 GetUserWallet
eval_tap 0 283 'GetUserWallet # SKIP deprecated' test.out

#- 284 DebitUserWallet
eval_tap 0 284 'DebitUserWallet # SKIP deprecated' test.out

#- 285 DisableUserWallet
eval_tap 0 285 'DisableUserWallet # SKIP deprecated' test.out

#- 286 EnableUserWallet
eval_tap 0 286 'EnableUserWallet # SKIP deprecated' test.out

#- 287 ListUserWalletTransactions
eval_tap 0 287 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 288 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PtKaJlw31pdDrXQ4' \
    > test.out 2>&1
eval_tap $? 288 'ListViews' test.out

#- 289 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId '7WSGyDCKF0LLhO3l' \
    --body '{"displayOrder": 67, "localizations": {"roNQiefBnPluOIjZ": {"description": "yvlGDQGv6pNNowEu", "localExt": {"VVZM28w4mnYvvlt1": {}, "es7A4PFduN4gx0UC": {}, "6eWKCFGS97Si6XyL": {}}, "longDescription": "VPrkUxyZ1OH5Nn4n", "title": "MT8QOyTuUSD9Imta"}, "PAocOQcpBWSNrCjS": {"description": "NEAdojkCMmYyTGO0", "localExt": {"7foRZ6FujpIWo0qJ": {}, "tqp4Q6XgICLgMHcP": {}, "1eE6sjWQllYsONpp": {}}, "longDescription": "6QGW56CNiszHE69D", "title": "1MMoaf6KlgRtwaM2"}, "IoyY1wpIdjcAtTj1": {"description": "IMuuhxxlulfmya73", "localExt": {"hX0a8Ri85PA9wNpm": {}, "rK5Y5heA2ewWnFcq": {}, "HxXP3kRhtrBcBofW": {}}, "longDescription": "TGYx2ihgioL8VvEz", "title": "HGTt9emdCLmzJbdk"}}, "name": "ykVAnmnRfUilcKA8"}' \
    > test.out 2>&1
eval_tap $? 289 'CreateView' test.out

#- 290 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId '4d9pMsl7zrNJvDiP' \
    --storeId '2hNNEI8QrQ6H1ro5' \
    > test.out 2>&1
eval_tap $? 290 'GetView' test.out

#- 291 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'CtU8UjgyCUpM1JBc' \
    --storeId 'Tzf4dz1BojPoQg97' \
    --body '{"displayOrder": 17, "localizations": {"409vFd5z9r4nJWUv": {"description": "Lp1wxGF747468MXU", "localExt": {"q3uIffkIpPmrWVxN": {}, "ZUvkiU2jXSwsBBRo": {}, "pVl38d4NZGtk6EmW": {}}, "longDescription": "xC75M88TKhFYkA9a", "title": "RNDe2IoPMSQKcg0O"}, "TT9JA0ll1RimBCiQ": {"description": "wuyrI87uSyXP6C0j", "localExt": {"XS8au2wcWYyj3JvH": {}, "qXp4JR7xI59Z9tfG": {}, "VsglnOxOXBfgBLug": {}}, "longDescription": "lkd9LIoshGnFSuHm", "title": "rqej8PRppYY1vlV0"}, "M2g6oreqyBzWzCgM": {"description": "MWZuD6tmIR28xVxb", "localExt": {"tpSKOfiIP3S6pypZ": {}, "qISn3msrykQFtW8Q": {}, "GKFZLrIfqrZuu7Iw": {}}, "longDescription": "KcT7sAsv2TKCbYMV", "title": "kXEHmsHwIGGsusS0"}}, "name": "zZRODEKPdudZsLaf"}' \
    > test.out 2>&1
eval_tap $? 291 'UpdateView' test.out

#- 292 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId '8aZrXW84dt0TSTmy' \
    --storeId '7XF26K2U7xttUz8n' \
    > test.out 2>&1
eval_tap $? 292 'DeleteView' test.out

#- 293 QueryWallets
eval_tap 0 293 'QueryWallets # SKIP deprecated' test.out

#- 294 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 76, "expireAt": "1987-10-20T00:00:00Z", "metadata": {"4vsohRWDyGYIVFDb": {}, "TvRYfpJ4wM9WZfOO": {}, "xAzmsbhi5QJuc2SN": {}}, "origin": "Steam", "reason": "MIcBMJ04508jKedx", "source": "SELL_BACK"}, "currencyCode": "PZrkjRm5Ki0orhXr", "userIds": ["sCKAO2JRz3CGwtuj", "kzxidLcAQWGVRg6D", "ISEaPZHLQkTHvndQ"]}, {"creditRequest": {"amount": 99, "expireAt": "1980-03-10T00:00:00Z", "metadata": {"o5TJCSugdo4XTm8t": {}, "1YTWqItjNWXm9sra": {}, "eMA78YSRS2fPy5fp": {}}, "origin": "Epic", "reason": "JVz4U43EcV1FRyee", "source": "IAP"}, "currencyCode": "77XmemN8LO03mnFS", "userIds": ["UR1Pq4a4uaMfd0SQ", "AfYIyzHL8jxakuVu", "q9jJTVFoFjxZjh5q"]}, {"creditRequest": {"amount": 87, "expireAt": "1979-11-28T00:00:00Z", "metadata": {"5B08VZxI4TU3apnZ": {}, "XoJ4gI4EQKO8xC4D": {}, "0FsUo3IB2kX5REQZ": {}}, "origin": "Oculus", "reason": "r1y5Ihr531Kajxq7", "source": "GIFT"}, "currencyCode": "JttdgfLGO3ummpll", "userIds": ["nV6B62P1Kazg73c6", "UpmA4ehxNIIlcrZz", "gameT2mLkkAMjHyI"]}]' \
    > test.out 2>&1
eval_tap $? 294 'BulkCredit' test.out

#- 295 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "0e2Axj0nZHjmoKHJ", "request": {"allowOverdraft": false, "amount": 63, "balanceOrigin": "GooglePlay", "balanceSource": "EXPIRATION", "metadata": {"wMe1AnQVj6QQjZtk": {}, "NJCnDSrsSey2BqOx": {}, "gwCymCDYsuff3b7G": {}}, "reason": "5FDX4mu0qPHb9Ll2"}, "userIds": ["EFEb8GnsthmQ2Y6Z", "GOiqrg3lpqN5bOfn", "qJ5bzDRzbhMxfEDE"]}, {"currencyCode": "4TrtIHyyMq79EdB9", "request": {"allowOverdraft": true, "amount": 79, "balanceOrigin": "Epic", "balanceSource": "ORDER_REVOCATION", "metadata": {"F8QHGM2IuQYBO8m0": {}, "HgTth479W8rXqwGV": {}, "IRWgTNHCka3Wb5kH": {}}, "reason": "1BrLWUetP7nmESQD"}, "userIds": ["P5ckjphURs4ksgsK", "4ElzL44KEm3uHBMC", "V3BD1nnEzoUlUWqP"]}, {"currencyCode": "J2R6Jacwwu8W1zvr", "request": {"allowOverdraft": false, "amount": 80, "balanceOrigin": "GooglePlay", "balanceSource": "PAYMENT", "metadata": {"aMu07Zek8WObpf0F": {}, "HYfViEj70KYKIfFt": {}, "4GYjUt4F1ZVy2qFf": {}}, "reason": "Sr3psWjOyHLyKe2f"}, "userIds": ["Vs05nZC4Os7hqIH2", "oqsVIfgBTr8RcxRQ", "R0NYdJzf3TMhSayn"]}]' \
    > test.out 2>&1
eval_tap $? 295 'BulkDebit' test.out

#- 296 GetWallet
eval_tap 0 296 'GetWallet # SKIP deprecated' test.out

#- 297 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'NgARSG3QQNGNH2K0' \
    --end 'UuJdeGNquQnaXpDQ' \
    --start '5rU2taDWh9JV5oc5' \
    > test.out 2>&1
eval_tap $? 297 'SyncOrders' test.out

#- 298 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["IFQsrwHqFqwVA5mo", "zeeOjIFQfXV3YW3u", "g3nCXhD7FUz1iOe0"], "apiKey": "pHa0LmseIRXeoerZ", "authoriseAsCapture": true, "blockedPaymentMethods": ["ZufzssA284mG7uAo", "jLYBsx8oqMzbE0lj", "QaBtb47V691j0FZp"], "clientKey": "2vjOXptxzx6kkaZY", "dropInSettings": "pl52sQR9Znp5d1eS", "liveEndpointUrlPrefix": "wrG2GBBEWrDbQ1Zz", "merchantAccount": "hDuLHq9LTBstguOd", "notificationHmacKey": "N0O7l3GbKPHdDTQD", "notificationPassword": "EEE2mTsn1NwJ71sz", "notificationUsername": "sNmnqZSWdEyOVYrT", "returnUrl": "dDq7IqbTVv8BLsqQ", "settings": "W8HSrEm5Y7jI232S"}' \
    > test.out 2>&1
eval_tap $? 298 'TestAdyenConfig' test.out

#- 299 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "jktijiNzTUe8Kdiz", "privateKey": "XmrmK0sCUsqxKocH", "publicKey": "omtjoU1kUqRedwIu", "returnUrl": "1TSRr6r8mzfMedpc"}' \
    > test.out 2>&1
eval_tap $? 299 'TestAliPayConfig' test.out

#- 300 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "KhvHPlvYanGqEkn9", "secretKey": "OEVwLWGT4MXhmzvR"}' \
    > test.out 2>&1
eval_tap $? 300 'TestCheckoutConfig' test.out

#- 301 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'Qb7c0vmjWq9fQqzu' \
    > test.out 2>&1
eval_tap $? 301 'DebugMatchedPaymentMerchantConfig' test.out

#- 302 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "lLGfQMqSLQDlRFYM", "clientSecret": "VfiAMa6Pco7Mfvik", "returnUrl": "slpyL9BYLVVznF6h", "webHookId": "MYfksp8VQhYSFeBO"}' \
    > test.out 2>&1
eval_tap $? 302 'TestPayPalConfig' test.out

#- 303 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["p0ilGQFwHUtZugbl", "T3aIDKn9qJXncm5i", "gpAewbmnWk0E7YaP"], "publishableKey": "blcWEyNgvs5LEZrQ", "secretKey": "XzSQRWRs9EGnRPgY", "webhookSecret": "lJElgJ8kx1WEeDbq"}' \
    > test.out 2>&1
eval_tap $? 303 'TestStripeConfig' test.out

#- 304 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "l13FtQMu41rnOzbs", "key": "FBqg6dziWvdNcwfU", "mchid": "BMdNuTaiLxFMXRpD", "returnUrl": "P9xutntU8xHw4yYJ"}' \
    > test.out 2>&1
eval_tap $? 304 'TestWxPayConfig' test.out

#- 305 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "OCViHwunQwpC2eCF", "flowCompletionUrl": "UAHZaYSvsWiNJtqX", "merchantId": 22, "projectId": 48, "projectSecretKey": "tZF6aSRmHU5iR3hX"}' \
    > test.out 2>&1
eval_tap $? 305 'TestXsollaConfig' test.out

#- 306 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'IbzWPKOkzftOgDQA' \
    > test.out 2>&1
eval_tap $? 306 'GetPaymentMerchantConfig' test.out

#- 307 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'WhulbrDf7q4cAnpm' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["LiEu4CNtX2lnqi7c", "HTSdGoLZbC3UJruU", "4uIXBZsEYogFWiH9"], "apiKey": "z4E8zmaZ5cg0REtU", "authoriseAsCapture": false, "blockedPaymentMethods": ["fVIdqwCWF5wmbOub", "TxAAeDCowR3MeCNL", "1oNrF3SmgudQusJL"], "clientKey": "sPlW7ZyORFkN9EbK", "dropInSettings": "bTbrDzNgVEcw0lxR", "liveEndpointUrlPrefix": "am16O6v4VjJf40Lj", "merchantAccount": "UdORELVXUFQyVlt9", "notificationHmacKey": "jmxmxpfp41k1uDg5", "notificationPassword": "9PhdUXShabwyYCxT", "notificationUsername": "HrDel8oThvr8CUEz", "returnUrl": "w4zL1QeR3EYXBFpU", "settings": "X9y4tY7o5FFi1n10"}' \
    > test.out 2>&1
eval_tap $? 307 'UpdateAdyenConfig' test.out

#- 308 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'vDgyoHXIlrMl2RAu' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 308 'TestAdyenConfigById' test.out

#- 309 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'kCL26ihdMy9YCLNJ' \
    --sandbox  \
    --validate  \
    --body '{"appId": "Ekvq6SUSt8xd8EgE", "privateKey": "15XNuw6Y7sToQNku", "publicKey": "ZzJ1XBxw01iBBQuk", "returnUrl": "gQ94ZvPCWcMX0ov3"}' \
    > test.out 2>&1
eval_tap $? 309 'UpdateAliPayConfig' test.out

#- 310 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'U2sKjIeyFS97dYD7' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 310 'TestAliPayConfigById' test.out

#- 311 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'LkcTKYpCfl6HPy5c' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "JfAV5iOfzwt3bpxR", "secretKey": "Nt6lKoMjCPtEKeBW"}' \
    > test.out 2>&1
eval_tap $? 311 'UpdateCheckoutConfig' test.out

#- 312 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'Tm78Fn8TvZVTe4L2' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 312 'TestCheckoutConfigById' test.out

#- 313 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'lXrVPX6r5ZTcnVVO' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "KMApTcWsFRUlWBp4", "clientSecret": "gBs9UufgsVbG6TUe", "returnUrl": "3jbuQ7HMPO4ozK70", "webHookId": "5ykRqSPYZgPm4JLs"}' \
    > test.out 2>&1
eval_tap $? 313 'UpdatePayPalConfig' test.out

#- 314 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'XVtBOEetHsxAJ8Ny' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 314 'TestPayPalConfigById' test.out

#- 315 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id '1LRkPU9hrl5nkpEd' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["Be8bYWdok4UnUEOy", "P0cPZf5OvolfI0mq", "ZctohLheRaQkfMLF"], "publishableKey": "W9B7jHZro4hhwnAN", "secretKey": "AGp8zGqNGrcQyoA1", "webhookSecret": "TWPcy83iXfYXNdMk"}' \
    > test.out 2>&1
eval_tap $? 315 'UpdateStripeConfig' test.out

#- 316 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'dg9TMwxNcQ6CkVi8' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 316 'TestStripeConfigById' test.out

#- 317 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'fqVPRqNbF5yLnYSa' \
    --validate  \
    --body '{"appId": "8xFLvcYexMMMiDFh", "key": "5RbW021cHN3QbzVu", "mchid": "JZH3k54cExxWKtdG", "returnUrl": "TW4FILotv5ycTa0i"}' \
    > test.out 2>&1
eval_tap $? 317 'UpdateWxPayConfig' test.out

#- 318 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id '6ifYP1zfgjsy3VRj' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 318 'UpdateWxPayConfigCert' test.out

#- 319 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'X4qA4g9OGoWw1qnC' \
    > test.out 2>&1
eval_tap $? 319 'TestWxPayConfigById' test.out

#- 320 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'AvdnAcokJ0rzqX2K' \
    --validate  \
    --body '{"apiKey": "JcYHgiFDxclBXap6", "flowCompletionUrl": "j73doCWxhubMXbxN", "merchantId": 43, "projectId": 94, "projectSecretKey": "T6wAffv4uzKAwiI4"}' \
    > test.out 2>&1
eval_tap $? 320 'UpdateXsollaConfig' test.out

#- 321 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'wTxNIefCmtrxWu29' \
    > test.out 2>&1
eval_tap $? 321 'TestXsollaConfigById' test.out

#- 322 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id '3551nQBNKcqCkUXR' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "SMALL", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 322 'UpdateXsollaUIConfig' test.out

#- 323 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '33' \
    --namespace "$AB_NAMESPACE" \
    --offset '63' \
    --region 'oogOxoPYvdIBJYyG' \
    > test.out 2>&1
eval_tap $? 323 'QueryPaymentProviderConfig' test.out

#- 324 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "jEjnslEYM8ngVT1e", "region": "wVxvgAocOqsd5v5n", "sandboxTaxJarApiToken": "7eXCo9gZWdxfIdW8", "specials": ["ALIPAY", "XSOLLA", "WXPAY"], "taxJarApiToken": "infEVxArF7TB6A6a", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 324 'CreatePaymentProviderConfig' test.out

#- 325 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 325 'GetAggregatePaymentProviders' test.out

#- 326 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region '37hJMOEv5W0v25yA' \
    > test.out 2>&1
eval_tap $? 326 'DebugMatchedPaymentProviderConfig' test.out

#- 327 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 327 'GetSpecialPaymentProviders' test.out

#- 328 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'ObZIbrA8XAKKWMDe' \
    --body '{"aggregate": "ADYEN", "namespace": "zWFTuNPf5JCSDyYy", "region": "4e5qoTZxSoZbQUnU", "sandboxTaxJarApiToken": "xS6m68WL3HDL4yx5", "specials": ["WALLET", "ALIPAY", "XSOLLA"], "taxJarApiToken": "uBsccHPA2v9XP9en", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 328 'UpdatePaymentProviderConfig' test.out

#- 329 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'EX7lloLgIYqxFfSN' \
    > test.out 2>&1
eval_tap $? 329 'DeletePaymentProviderConfig' test.out

#- 330 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 330 'GetPaymentTaxConfig' test.out

#- 331 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "JlHCjxLNnYUlGQsF", "taxJarApiToken": "py9ZVlLIFwLgT78n", "taxJarEnabled": false, "taxJarProductCodesMapping": {"2zPZvOd4yZyMKyED": "3qDO5HXp5oVkhESb", "HQ7hvTlzf7XwQtVI": "YU87NgjDMcJxfMfY", "Flt3JvDgMiyBGygW": "FTAY3Th5mOwPCPKV"}}' \
    > test.out 2>&1
eval_tap $? 331 'UpdatePaymentTaxConfig' test.out

#- 332 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'PlOGfFBlu2ZP0Iki' \
    --end 'YXGk6BoBmSLi0R7z' \
    --start 'DFMoNTQmlS8lMlY8' \
    > test.out 2>&1
eval_tap $? 332 'SyncPaymentOrders' test.out

#- 333 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'UjprhCxhzW6ZM7Lk' \
    --storeId 'TVrtVJZVhxCVdjPu' \
    > test.out 2>&1
eval_tap $? 333 'PublicGetRootCategories' test.out

#- 334 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'tJ8dkAVOJ5imghdf' \
    --storeId 'Vhjnjd66A1SQmWGS' \
    > test.out 2>&1
eval_tap $? 334 'DownloadCategories' test.out

#- 335 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'QLAVPAJ7zX5lB80k' \
    --namespace "$AB_NAMESPACE" \
    --language '2smdkBS2MaIP7Pjn' \
    --storeId 'gEFggq91cpgvoDBg' \
    > test.out 2>&1
eval_tap $? 335 'PublicGetCategory' test.out

#- 336 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'YfLBdGNAZEvbvxqa' \
    --namespace "$AB_NAMESPACE" \
    --language '0K7VUbjUnzirnEsx' \
    --storeId 'SE4vBzG7VK8sWEsh' \
    > test.out 2>&1
eval_tap $? 336 'PublicGetChildCategories' test.out

#- 337 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'mZf5fEdvjbyJPQ1q' \
    --namespace "$AB_NAMESPACE" \
    --language 'dRcJjsme1OukIfIZ' \
    --storeId 'VH8q8svV5hMOSfpy' \
    > test.out 2>&1
eval_tap $? 337 'PublicGetDescendantCategories' test.out

#- 338 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 338 'PublicListCurrencies' test.out

#- 339 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'STEAM' \
    > test.out 2>&1
eval_tap $? 339 'GeDLCDurableRewardShortMap' test.out

#- 340 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 340 'GetIAPItemMapping' test.out

#- 341 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'AvmW0567BFqbrPIu' \
    --region 'xKmBXLi6GpnqAeMv' \
    --storeId 'g3w0FQ1520WM3TxW' \
    --appId 'XSdTiKdva2UREoBS' \
    > test.out 2>&1
eval_tap $? 341 'PublicGetItemByAppId' test.out

#- 342 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --baseAppId 'tCLy2CqgCG7JwJCD' \
    --categoryPath 'qkzOdFwLJpIPxzLE' \
    --features '1V9U1NgpH7Oc44yj' \
    --includeSubCategoryItem  \
    --itemType 'APP' \
    --language '7A2zHFGbN8AQaCaw' \
    --limit '68' \
    --offset '95' \
    --region 'JmPwUTWMx0MiPAjn' \
    --sortBy 'updatedAt:desc,name:asc,updatedAt' \
    --storeId 'HDXTJWiyw17ogzmb' \
    --tags 'j4SLYDrZJvDLGvn6' \
    > test.out 2>&1
eval_tap $? 342 'PublicQueryItems' test.out

#- 343 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'qtroZcp16HKXX1ft' \
    --region '5nBA9xNIJVuMz04e' \
    --storeId 'vSdE2FMcKd7c94rE' \
    --sku 'mIYuAT5OAcUwYHGm' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetItemBySku' test.out

#- 344 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'G5rNDBF1oU37vjfy' \
    --storeId 'X5YLaM0wmi0i1WAB' \
    --itemIds 'Bbq8IzZsMFLX9ZhF' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetEstimatedPrice' test.out

#- 345 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'XcFtfBS3ZIHofhwy' \
    --region 'M6Bw2sFGQ5DQoDwz' \
    --storeId 'rKPOZZnV3zR7YxSu' \
    --itemIds '6addocg10Hy9jx7g' \
    > test.out 2>&1
eval_tap $? 345 'PublicBulkGetItems' test.out

#- 346 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["BHTOHHArjld0LnRE", "srrB2pJ7V8BSrucj", "O3zvSM5KeVNHU9Gc"]}' \
    > test.out 2>&1
eval_tap $? 346 'PublicValidateItemPurchaseCondition' test.out

#- 347 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'SUBSCRIPTION' \
    --limit '100' \
    --offset '17' \
    --region 'BxF9RAIrI81ZR2kN' \
    --storeId 'zh60RQNaTEhMXMep' \
    --keyword 'gzY9jLiAdMiQ7eDM' \
    --language 'keBRMur18nCxiV9b' \
    > test.out 2>&1
eval_tap $? 347 'PublicSearchItems' test.out

#- 348 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'QMHpPbvflI3LkRc1' \
    --namespace "$AB_NAMESPACE" \
    --language 'NgZaoYAaCCeRgtst' \
    --region 'sU3Qecxo4bQZO3P2' \
    --storeId 'f8TTOVf6jrr1OL60' \
    > test.out 2>&1
eval_tap $? 348 'PublicGetApp' test.out

#- 349 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '6QpqCgxt0NgDSj1T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 349 'PublicGetItemDynamicData' test.out

#- 350 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId '6EdeYFmrLT0HbvS4' \
    --namespace "$AB_NAMESPACE" \
    --language 'kSSt3CyDgf6eFAiq' \
    --populateBundle  \
    --region 'SkHi0BR2ElF6z6eJ' \
    --storeId 'KuOW61akRFizqxCm' \
    > test.out 2>&1
eval_tap $? 350 'PublicGetItem' test.out

#- 351 GetPaymentCustomization
eval_tap 0 351 'GetPaymentCustomization # SKIP deprecated' test.out

#- 352 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "udSXivAL3n478mhb", "paymentProvider": "ADYEN", "returnUrl": "I2yBJeCJghTrk68F", "ui": "WFzuLBdlrKjUbgZQ", "zipCode": "fw6Zys3mN8fIcC9C"}' \
    > test.out 2>&1
eval_tap $? 352 'PublicGetPaymentUrl' test.out

#- 353 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'kharfqaoMsGyv1Ru' \
    > test.out 2>&1
eval_tap $? 353 'PublicGetPaymentMethods' test.out

#- 354 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'SNdycDssUeHiVDXz' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetUnpaidPaymentOrder' test.out

#- 355 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'SJ8kbFAyidbnXdMS' \
    --paymentProvider 'WALLET' \
    --zipCode 'vR9PxG9Lji2Vc88W' \
    --body '{"token": "8aLjIxVGpdOqguxv"}' \
    > test.out 2>&1
eval_tap $? 355 'Pay' test.out

#- 356 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'RwI9ZBTipMRlhK9D' \
    > test.out 2>&1
eval_tap $? 356 'PublicCheckPaymentOrderPaidStatus' test.out

#- 357 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ALIPAY' \
    --region 'aI4ryVDvNaruZxwT' \
    > test.out 2>&1
eval_tap $? 357 'GetPaymentPublicConfig' test.out

#- 358 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'fh9gEs6GF247cbBL' \
    > test.out 2>&1
eval_tap $? 358 'PublicGetQRCode' test.out

#- 359 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'jUr5z03wxB3E9hrE' \
    --foreinginvoice '9f9COFrOr6wJDBwI' \
    --invoiceId 'DsJHNg6TvNGjwI4T' \
    --payload 'bTwBufUorJouduhC' \
    --redirectResult 'EJ5XiKDIE9Yugcup' \
    --resultCode 'LxVBcRkfhRuqkOTH' \
    --sessionId 'Sia7oFd1fEmDuyAs' \
    --status 'QGzwJR5poI718RQn' \
    --token 'j4imu6XFfRcWDXhq' \
    --type '1YmGeygr2S4Yw8Nm' \
    --userId 'PaBeryzX2hOPVVFq' \
    --orderNo 'Vqxjq1iG3TySOh8S' \
    --paymentOrderNo 'I75oXbyq8FBbur80' \
    --paymentProvider 'ALIPAY' \
    --returnUrl 'wnlgAVfqz6gQJh8s' \
    > test.out 2>&1
eval_tap $? 359 'PublicNormalizePaymentReturnUrl' test.out

#- 360 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'n0bVWRkvmAemh8li' \
    --paymentOrderNo 'oBR7xTXcEIFod3lC' \
    --paymentProvider 'WXPAY' \
    > test.out 2>&1
eval_tap $? 360 'GetPaymentTaxValue' test.out

#- 361 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '65KWh8ztRJkXxUAj' \
    > test.out 2>&1
eval_tap $? 361 'GetRewardByCode' test.out

#- 362 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '3jzZvEaY103YUIMu' \
    --limit '92' \
    --offset '78' \
    --sortBy 'rewardCode,namespace:asc' \
    > test.out 2>&1
eval_tap $? 362 'QueryRewards1' test.out

#- 363 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Hz0zPWMZQNNP2JqQ' \
    > test.out 2>&1
eval_tap $? 363 'GetReward1' test.out

#- 364 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 364 'PublicListStores' test.out

#- 365 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'qhISTBT1Gofv4Sua,Z8yCB9TVZnuzgvAZ,JRm71EC3ENuvD8OP' \
    --itemIds 'sp5Z3ez84KVB7HeW,PnVeFdy5ezlCU6SG,zkMpTL2wxobjxAba' \
    --skus 'gqEmXn6U2VeV2emK,3JecJA4skqCbPxRk,IAFQh9yDdoLE2s7m' \
    > test.out 2>&1
eval_tap $? 365 'PublicExistsAnyMyActiveEntitlement' test.out

#- 366 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'rVrmTJwtBTzQTrNo' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 367 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'GO8MnfOQu3wdT4Ao' \
    > test.out 2>&1
eval_tap $? 367 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 368 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --sku 'RtCfqDHSlo54zSnR' \
    > test.out 2>&1
eval_tap $? 368 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 369 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'N0zGMworzym1z3Zd,etOic9AQOFWpdItL,BhvKJq9tWz9yui8a' \
    --itemIds '6jOflFJlZEhz1QDe,h05hj92bwVVxJ62Q,5AOAOyL65cPaOZA8' \
    --skus 'BG8KcVWOX9n3YsjJ,exnFA9Umz3KPICya,5Fk5TPaEbX29cV8v' \
    > test.out 2>&1
eval_tap $? 369 'PublicGetEntitlementOwnershipToken' test.out

#- 370 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "7MXctihtxMnIr4b7", "language": "YF_020", "region": "GCPISlsnVA6z0uSf"}' \
    > test.out 2>&1
eval_tap $? 370 'SyncTwitchDropsEntitlement' test.out

#- 371 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'NNpJUYzJxnOyvqms' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 371 'PublicGetMyWallet' test.out

#- 372 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'wrToyBIQumxDfAxN' \
    --body '{"epicGamesJwtToken": "qCUtizYM97ebZcYq"}' \
    > test.out 2>&1
eval_tap $? 372 'SyncEpicGameDLC' test.out

#- 373 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'wfIHPWMkOmrT5HL1' \
    > test.out 2>&1
eval_tap $? 373 'SyncOculusDLC' test.out

#- 374 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '6jMwECnmwJv4rpqt' \
    --body '{"serviceLabel": 53}' \
    > test.out 2>&1
eval_tap $? 374 'PublicSyncPsnDlcInventory' test.out

#- 375 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'MICxX7xKyCfgwSPz' \
    --body '{"serviceLabels": [1, 75, 4]}' \
    > test.out 2>&1
eval_tap $? 375 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 376 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'syOdgn77gN8K1FlN' \
    --body '{"appId": "kgbFE8U4meK5grmP", "steamId": "BsFH71VrhsISYteg"}' \
    > test.out 2>&1
eval_tap $? 376 'SyncSteamDLC' test.out

#- 377 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'QbNA2WQrHTkJT1Vk' \
    --body '{"xstsToken": "ChD3n0c1ryAkRvdP"}' \
    > test.out 2>&1
eval_tap $? 377 'SyncXboxDLC' test.out

#- 378 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'R8gx2rX5dck8NFKP' \
    --appType 'DEMO' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'T6LMehg047axU5kt' \
    --features 'NywRIvO2Sgz30hej,qdktHIO1VdtMSews,1TrU4FhAfKDcDG5b' \
    --itemId 'MTba1tUlFGcP6eL7,EpWtPifmO0JK4dP1,aZFiSkmhwVVMGkXN' \
    --limit '47' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 378 'PublicQueryUserEntitlements' test.out

#- 379 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'MYwFyljy5bYQdQ87' \
    --appId 'hUHA0FJZwP8GslMp' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetUserAppEntitlementByAppId' test.out

#- 380 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'x3m7lEXTmnTbtjK9' \
    --limit '89' \
    --offset '37' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 380 'PublicQueryUserEntitlementsByAppType' test.out

#- 381 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'yoqT3adB48Jxp2za' \
    --entitlementClazz 'MEDIA' \
    --itemId 'ZmBXlGSp85q6fuGf' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetUserEntitlementByItemId' test.out

#- 382 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'o5wSDHnyabk493I3' \
    --entitlementClazz 'CODE' \
    --sku 'NAagipZwiaBrFrXt' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetUserEntitlementBySku' test.out

#- 383 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'GMjujfHZB1gMI1B8' \
    --appIds 'DXb37DffTZ7yQz33,7LLNCjIySe36SA5d,xATLv5PkLvraRzCh' \
    --itemIds 'djDGdlk2A2jHbAPN,GInvbnf4ewKFFLoG,ggX4gQWyZocvYfr0' \
    --skus 'Rnl02R1IVNnaK6KS,71Xs1BphA9BXpKYg,F9OuigDP0Vjmy7j2' \
    > test.out 2>&1
eval_tap $? 383 'PublicExistsAnyUserActiveEntitlement' test.out

#- 384 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'BrdCAm3slCwaBqHp' \
    --appId 'E55sjxBGijw0dQtZ' \
    > test.out 2>&1
eval_tap $? 384 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 385 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'NonMrPkzUe9SglAJ' \
    --entitlementClazz 'MEDIA' \
    --itemId 'kUSZKUrsxNRzF3Na' \
    > test.out 2>&1
eval_tap $? 385 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 386 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'UuCyQyze6zPKu5sE' \
    --ids '89JW8UU0RsB6dvrp,mInhHYzVVlHGFSwj,by6rMYkVQnZDUAbI' \
    > test.out 2>&1
eval_tap $? 386 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 387 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'NRKQsxUO1YMxAndO' \
    --entitlementClazz 'CODE' \
    --sku 'Y4TTxu8goZgsX4Rw' \
    > test.out 2>&1
eval_tap $? 387 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 388 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'fM4qnUdcQqZ9F1ui' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vPob0YZEuXQACDDQ' \
    > test.out 2>&1
eval_tap $? 388 'PublicGetUserEntitlement' test.out

#- 389 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'ryNf9VGxbOeJe4n9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eUlBQZ2UGePWXbAy' \
    --body '{"options": ["GiXa9nUsHCVicuJ7", "onrUXVlB6xNel4Bx", "b9KwFYqdhEVq3hbs"], "requestId": "ApeASfR0ljKxqZcL", "useCount": 43}' \
    > test.out 2>&1
eval_tap $? 389 'PublicConsumeUserEntitlement' test.out

#- 390 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'pkn98VtLNkaIQJfk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FDhSeSGXtZU5SuIh' \
    --body '{"requestId": "MSaDRp17dUWHcjrb", "useCount": 11}' \
    > test.out 2>&1
eval_tap $? 390 'PublicSellUserEntitlement' test.out

#- 391 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'qNeKpOxPrlG9svdq' \
    --body '{"code": "siVTqPbzY1yxl7ze", "language": "fPM_pvlX_rA", "region": "lj9Ii2jARwzowk9O"}' \
    > test.out 2>&1
eval_tap $? 391 'PublicRedeemCode' test.out

#- 392 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'oiPdnq9KBqBwiNCs' \
    --body '{"excludeOldTransactions": false, "language": "lLU_epDi", "productId": "bpQZtwW3EwLre1bL", "receiptData": "4dJnkRLJbMvOGSd7", "region": "uMrmQ2SaLd6M7TM3", "transactionId": "wnJyExuo5z9RAcYg"}' \
    > test.out 2>&1
eval_tap $? 392 'PublicFulfillAppleIAPItem' test.out

#- 393 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'YZb7cAakJpqN6eub' \
    --body '{"epicGamesJwtToken": "dp49JFwXG0EvoSHN"}' \
    > test.out 2>&1
eval_tap $? 393 'SyncEpicGamesInventory' test.out

#- 394 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'C97eEyhnL1QH5AlY' \
    --body '{"autoAck": true, "language": "Qhd_NXGl_sR", "orderId": "LNgDxAkwgfB8jIec", "packageName": "Ox5ugNCDd6jW6fjt", "productId": "BcO3fWq9qfmBv0Xg", "purchaseTime": 74, "purchaseToken": "l3uU1aMD0mczWxc8", "region": "f1s2QPMMZsf2dvKZ"}' \
    > test.out 2>&1
eval_tap $? 394 'PublicFulfillGoogleIAPItem' test.out

#- 395 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'yHChRPHvdkcKW21B' \
    > test.out 2>&1
eval_tap $? 395 'SyncOculusConsumableEntitlements' test.out

#- 396 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '5EFtD2pYaKTz1gcE' \
    --body '{"currencyCode": "2XCwTkRUIX6IFHNm", "price": 0.44869822014553784, "productId": "9mYBvtOwxjqyrjDA", "serviceLabel": 31}' \
    > test.out 2>&1
eval_tap $? 396 'PublicReconcilePlayStationStore' test.out

#- 397 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'GBYHTHoSVxgQCbpZ' \
    --body '{"currencyCode": "x5yMGIQ1ZxVIefYl", "price": 0.5879447815570428, "productId": "BJyQMqUEfDikX6yO", "serviceLabels": [13, 47, 23]}' \
    > test.out 2>&1
eval_tap $? 397 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 398 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'H1tdEAJSqXA0Wv0z' \
    --body '{"appId": "WGvkc6byp3mvyYT3", "currencyCode": "GuaZVTxBlw1IWeXK", "language": "ucvS_tBOB_788", "price": 0.0847726750186325, "productId": "9Fn32SJNPZkEfkAc", "region": "JTMS4pVRcCHIGfmC", "steamId": "MTr9ACnI2sMrEgl7"}' \
    > test.out 2>&1
eval_tap $? 398 'SyncSteamInventory' test.out

#- 399 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZR1HCkf2Sw78lLGK' \
    --body '{"gameId": "jDHuXt358gzqRMuM", "language": "vRgj", "region": "p6LkyXpxJeFxhgTw"}' \
    > test.out 2>&1
eval_tap $? 399 'SyncTwitchDropsEntitlement1' test.out

#- 400 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'yO51CUpcdxL0a9VD' \
    --body '{"currencyCode": "hrqWCTXOxQUpyFgZ", "price": 0.12247239281804312, "productId": "NpOTE4toH57yr01N", "xstsToken": "33p1Gha8HwpagvER"}' \
    > test.out 2>&1
eval_tap $? 400 'SyncXboxInventory' test.out

#- 401 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZI6CqhcknhecNv2T' \
    --itemId 'w6YKhVrYkMqXkQ7q' \
    --limit '24' \
    --offset '0' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 401 'PublicQueryUserOrders' test.out

#- 402 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '4UXgdBqtJaRyDlP9' \
    --body '{"currencyCode": "qIZJ5Krx6KkHagEu", "discountedPrice": 12, "ext": {"Q7TW7lZvDbwFJJhB": {}, "Rdq8BgAI81k4Gr7j": {}, "VVx5l3yrH9HR4reG": {}}, "itemId": "0HwUXxQTf5YpDUGY", "language": "kXc-Kabv-428", "price": 16, "quantity": 21, "region": "TkFcLBrg2JB0WiCp", "returnUrl": "VBwvAffJ3btt0PpQ", "sectionId": "Y3Pnnic80yEO8dL6"}' \
    > test.out 2>&1
eval_tap $? 402 'PublicCreateUserOrder' test.out

#- 403 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Jh10XMUGeDavCKra' \
    --userId 'dJmJFUsU418vAlmf' \
    > test.out 2>&1
eval_tap $? 403 'PublicGetUserOrder' test.out

#- 404 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Gg9NO1Z2DvnAxH3p' \
    --userId 'S3jyCkGKltBNE2Ub' \
    > test.out 2>&1
eval_tap $? 404 'PublicCancelUserOrder' test.out

#- 405 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hNtH3yYg4Qnn2uhd' \
    --userId 'w7C9Bx1LQOTCbAPL' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserOrderHistories' test.out

#- 406 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'C3iqrkyJFOVaewFc' \
    --userId 'v9h31YxuZnoSesWp' \
    > test.out 2>&1
eval_tap $? 406 'PublicDownloadUserOrderReceipt' test.out

#- 407 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'LUHjGaIcZN28gH4C' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetPaymentAccounts' test.out

#- 408 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'd9xTdt2K1CzpQWsl' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'KHC16xjJZ4kiU3N8' \
    > test.out 2>&1
eval_tap $? 408 'PublicDeletePaymentAccount' test.out

#- 409 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId '556ll2LQWpdESOBV' \
    --language '7wZJsg7wSv9lyRyT' \
    --region 'dYBUljvBzvYNEtfg' \
    --storeId 'BFikt18cQ677SotD' \
    --viewId 'EtU2xBSEQ8rBKc2K' \
    > test.out 2>&1
eval_tap $? 409 'PublicListActiveSections' test.out

#- 410 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '6oJXxVEfnaqX8NuZ' \
    --chargeStatus 'NEVER' \
    --itemId 'jbQEqFGwnDG8kz4k' \
    --limit '45' \
    --offset '46' \
    --sku 'Ev6tNjGRhrmRAxRG' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 410 'PublicQueryUserSubscriptions' test.out

#- 411 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'KGlCJmDXpjyvLSHB' \
    --body '{"currencyCode": "1y3klHuAGnidOyGu", "itemId": "S0OG7ohiL2943Clr", "language": "MIfS", "region": "xd24ZKfvMf1T5FzY", "returnUrl": "Mf1jaCgZosntPzP1", "source": "vXXB92q150WEIetO"}' \
    > test.out 2>&1
eval_tap $? 411 'PublicSubscribeSubscription' test.out

#- 412 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'XMt37MXy7Fp7lUfQ' \
    --itemId 'qXrqGadwvKlJFX1Z' \
    > test.out 2>&1
eval_tap $? 412 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 413 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'HV9yo9Ur1hfhmGEK' \
    --userId 'uVUZdCacRGataPrc' \
    > test.out 2>&1
eval_tap $? 413 'PublicGetUserSubscription' test.out

#- 414 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'gTcA71dtqtSUN4zv' \
    --userId 'BzGh3mhIDNuMBZeg' \
    > test.out 2>&1
eval_tap $? 414 'PublicChangeSubscriptionBillingAccount' test.out

#- 415 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'HtB9uTCiiIoMZCjG' \
    --userId 'iOZJpUf9RpcfEQn0' \
    --body '{"immediate": true, "reason": "6D8PGQuazAypgWhT"}' \
    > test.out 2>&1
eval_tap $? 415 'PublicCancelSubscription' test.out

#- 416 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ED5YmPTBUkm2Fyvd' \
    --userId 'guCYVqFyIKh1YtTY' \
    --excludeFree  \
    --limit '15' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetUserSubscriptionBillingHistories' test.out

#- 417 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'rSt96OaARAjHLGV3' \
    --language 'sNxS8uLBZiVRYIyQ' \
    --storeId 'LcslTEqgVNG8Aqkt' \
    > test.out 2>&1
eval_tap $? 417 'PublicListViews' test.out

#- 418 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'gvjwNJAwIpEy2ZNp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ojZ24I2n25smsrmJ' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetWallet' test.out

#- 419 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'FHGiYnyhbqxLuTZI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xgiUaiyy0aWrshpm' \
    --limit '2' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 419 'PublicListUserWalletTransactions' test.out

#- 420 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --availableDate '78smYdyge6DroOyw' \
    --baseAppId 'OxI4G6jZzoYIFAvY' \
    --categoryPath 'fT8XQw2EOq6BFjmN' \
    --features '4OqKGLRpNWzKZtZn' \
    --includeSubCategoryItem  \
    --itemName 'xgywmr4CYNGm7Tk1' \
    --itemStatus 'ACTIVE' \
    --itemType 'BUNDLE' \
    --limit '79' \
    --offset '89' \
    --region 'yeNRsjQuDEgO3MEQ' \
    --sectionExclusive  \
    --sortBy 'displayOrder,name:asc,displayOrder:asc' \
    --storeId 'm7hcIFdkdrwAcK2l' \
    --tags 'Uda9h9FgvfhiLEAk' \
    --targetNamespace 'A7n6516ydoRT1qZB' \
    > test.out 2>&1
eval_tap $? 420 'QueryItems1' test.out

#- 421 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rdTnGrwHeWoQXPFW' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 421 'ImportStore1' test.out

#- 422 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FaKbDgrGkv8SVwLy' \
    --body '{"itemIds": ["S4VbHJvD0lL7aZUY", "9d1Idud8bjYeBVMr", "7zHYmRE4X36KUOdf"]}' \
    > test.out 2>&1
eval_tap $? 422 'ExportStore1' test.out

#- 423 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EmoIYwSxxAsfwDMi' \
    --body '{"metadata": {"vWqHHGlnAnEu6EKY": {}, "ceTEqYudHlA4AxeE": {}, "IfUxJ2xMSNNBxCeN": {}}, "origin": "Twitch", "rewards": [{"currency": {"currencyCode": "pGn46fGvodt413MR", "namespace": "dG8qAPiANv2Ar8yX"}, "item": {"itemId": "V6qf6v5SgcJPZPUh", "itemSku": "2nHQwpWi8HZ6C0VJ", "itemType": "0fK2m6lQ5Ao8TITY"}, "quantity": 18, "type": "CURRENCY"}, {"currency": {"currencyCode": "HSR2SEJh1YDedZdN", "namespace": "qkXPWZfT8ZfdKp9q"}, "item": {"itemId": "4nXuK0tJAYror2Xd", "itemSku": "tSCG7ZExOoIpWzac", "itemType": "OvwUsnIbQM3ZAtyE"}, "quantity": 99, "type": "CURRENCY"}, {"currency": {"currencyCode": "orCbncoj5RvEtXiK", "namespace": "yUGdNfMiwgSvsTRm"}, "item": {"itemId": "JsOm0wVFyHvFhRMC", "itemSku": "FJuA0DEMgykqqjoH", "itemType": "TpIPMSRAuPI7mSZQ"}, "quantity": 38, "type": "ITEM"}], "source": "DLC", "transactionId": "m1q51PlW2HG8LAiI"}' \
    > test.out 2>&1
eval_tap $? 423 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE