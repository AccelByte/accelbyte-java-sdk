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
echo "1..419"

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
    --body '{"appId": "vxuJlhXbWhbwPwTo", "appType": "SOFTWARE", "baseAppId": "Bg0tTJg46IewOXE2", "boothName": "AkCh3QIZsUf8lGFX", "categoryPath": "cmwTERHclOdxIwqe", "clazz": "jxe18rNdb8Otq6j1", "displayOrder": 25, "entitlementType": "DURABLE", "ext": {"qUav7k05HAQltnSo": {}, "jV4jT65yclX2FtAz": {}, "0vJjFIYWOaNdsimm": {}}, "features": ["ZkaXZ7vmiEd0JPxV", "yQpshaDwNqTbbFMX", "kW2miH3xRHAKy4Qx"], "images": [{"as": "AMfVXe0GZeMgsRsm", "caption": "H1EQrYmkPKTPOlhT", "height": 39, "imageUrl": "IFg0dnWIYN2NVL70", "smallImageUrl": "Iw157g00jr9b8MuY", "width": 25}, {"as": "7ufFVTOhvQpfbBke", "caption": "8aEdd36xj6wySolt", "height": 60, "imageUrl": "DCvs78mcMdiS76YA", "smallImageUrl": "pGJ9ufwLYkqIgLuZ", "width": 92}, {"as": "WgumrIz4NhGztZpr", "caption": "4U4fwQIiLXgmRasv", "height": 18, "imageUrl": "aOBdPF0JmX8qwU1c", "smallImageUrl": "TuHHPB5S3DvPRCzB", "width": 36}], "itemIds": ["D2NY0kABeGs9yxah", "ld1pO0Gyf5PO3COy", "MvczgEpzZ3Fbtxfh"], "itemQty": {"cRC7IVYa6iZ5uFRY": 82, "sZvD6rmzVr5XT1Nx": 46, "5qTLWUCy0Afgc050": 100}, "itemType": "OPTIONBOX", "listable": false, "localizations": {"ZRW491e94mQjVOOB": {"description": "nIWhunElqZUodp3I", "localExt": {"htCSHy1ei1fIrPvf": {}, "HnRN06EjRwEQlNap": {}, "JRfk4f9Zcw1pEHAy": {}}, "longDescription": "NFxcVTKuAQTGh5Bx", "title": "jWOozGoDtsUuYo5p"}, "8ED5QZAufwNa8lzf": {"description": "jv9oYMXMjlVHY1AH", "localExt": {"wF3vGoav7MK0PcLn": {}, "EkcokKwcQ0baDT9O": {}, "yJ2h23GUS2amU7sy": {}}, "longDescription": "GlElXdEAOrVSnLoc", "title": "LVVYamQc4wcG5nDB"}, "LJoJHbiQ5duE5p4c": {"description": "fs2E41cK8QTwiIAv", "localExt": {"xSvNDlmM5nQFMGzs": {}, "7fzjgyc44mEh9tRk": {}, "8knYSV30lnroQehM": {}}, "longDescription": "Dli6t9unQLYXxm09", "title": "wpGAbpEmDY9vLh3u"}}, "lootBoxConfig": {"rewardCount": 36, "rewards": [{"lootBoxItems": [{"count": 63, "duration": 67, "endDate": "1986-05-30T00:00:00Z", "itemId": "q0Q2Qd2JzRbkF2I0", "itemSku": "3dIjvBbA6bfbYaJC", "itemType": "Jjfk2TUvn95FhO7V"}, {"count": 100, "duration": 60, "endDate": "1999-04-04T00:00:00Z", "itemId": "mbDVMDu87t0ldWf7", "itemSku": "iSGIiKFtWtn4Yr2s", "itemType": "vKM6pqLGZ0TBujEL"}, {"count": 54, "duration": 63, "endDate": "1994-09-07T00:00:00Z", "itemId": "K6mQ5iZgbwwm5iGz", "itemSku": "XtcknrgidKupvXO6", "itemType": "aj4hCmTC34jxW4pI"}], "name": "DwdqXpmRmut9H9Xy", "odds": 0.7781473168767928, "type": "REWARD_GROUP", "weight": 71}, {"lootBoxItems": [{"count": 20, "duration": 3, "endDate": "1987-05-07T00:00:00Z", "itemId": "1c0W338HS6CBgVRy", "itemSku": "ihYNZ84CVhziXV8H", "itemType": "wSmvcvcDKF19yVRa"}, {"count": 11, "duration": 59, "endDate": "1977-03-20T00:00:00Z", "itemId": "PKvqDejvqklTSvDw", "itemSku": "uOrP9lzpiX0VuFpZ", "itemType": "um7izxe7NPzjOa8E"}, {"count": 45, "duration": 19, "endDate": "1997-03-18T00:00:00Z", "itemId": "76PxLv9HBEUe89Aw", "itemSku": "Ew1HO4FnKtx4XLKA", "itemType": "mlDr19uJ3nq6Verz"}], "name": "VCcI8y3Cz0YqCKUh", "odds": 0.9252330004031369, "type": "REWARD_GROUP", "weight": 65}, {"lootBoxItems": [{"count": 60, "duration": 14, "endDate": "1982-06-28T00:00:00Z", "itemId": "h2Dp2SoiIPp1yvfA", "itemSku": "HS0VgLu11A3HTovF", "itemType": "i4tPAGfleyCA6jEt"}, {"count": 6, "duration": 12, "endDate": "1979-06-02T00:00:00Z", "itemId": "9HcLJXJ7mpVI6eTY", "itemSku": "AjdPlCiQQC35cj4K", "itemType": "yOVgvnWbfRJtsB7c"}, {"count": 95, "duration": 88, "endDate": "1985-12-10T00:00:00Z", "itemId": "QUAxJrINPXppPNO3", "itemSku": "AfmXcgwC3IN6tvKg", "itemType": "LB9QmJIOq9dP5szG"}], "name": "71utjsQ4CrRb9gUC", "odds": 0.07633989614475534, "type": "REWARD_GROUP", "weight": 53}], "rollFunction": "CUSTOM"}, "maxCount": 70, "maxCountPerUser": 32, "name": "bZIdhevfZvyV7Aco", "optionBoxConfig": {"boxItems": [{"count": 8, "duration": 9, "endDate": "1972-08-07T00:00:00Z", "itemId": "ZwKjYDdmJOlzwm9S", "itemSku": "u4FnS98QqftSjq7s", "itemType": "n8yreciPLfkVyyJs"}, {"count": 3, "duration": 80, "endDate": "1987-09-15T00:00:00Z", "itemId": "pO6JgehDJxEN7JlZ", "itemSku": "c8LMq1o2jZWu4yA3", "itemType": "r0u4q1bTHXIjfJKy"}, {"count": 65, "duration": 63, "endDate": "1976-11-12T00:00:00Z", "itemId": "l07bhwntCVqiYOJf", "itemSku": "5KwMZQjzvjSozv6C", "itemType": "TRDl0zp9CzHFwink"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 80, "fixedTrialCycles": 17, "graceDays": 20}, "regionData": {"gvqgl6TZ9TGVPmv3": [{"currencyCode": "4h6T7EsufmfxKYB4", "currencyNamespace": "LM6H6QXmpZ9X3fUS", "currencyType": "REAL", "discountAmount": 23, "discountExpireAt": "1990-09-01T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1998-11-02T00:00:00Z", "expireAt": "1979-12-11T00:00:00Z", "price": 11, "purchaseAt": "1985-08-21T00:00:00Z", "trialPrice": 38}, {"currencyCode": "XnlUnqxT1WsRNMZc", "currencyNamespace": "A92hzC7MNa8vVe4M", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1989-02-19T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1990-06-23T00:00:00Z", "expireAt": "1973-10-10T00:00:00Z", "price": 31, "purchaseAt": "1978-04-12T00:00:00Z", "trialPrice": 96}, {"currencyCode": "AyyUJyAK5PRMRMwd", "currencyNamespace": "vl0hv6g62GxBW2tQ", "currencyType": "VIRTUAL", "discountAmount": 9, "discountExpireAt": "1976-11-11T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1980-02-24T00:00:00Z", "expireAt": "1992-10-17T00:00:00Z", "price": 5, "purchaseAt": "1971-11-19T00:00:00Z", "trialPrice": 44}], "YvNQOsDa4bkcgepq": [{"currencyCode": "txjbrztee7QLTGAa", "currencyNamespace": "k7Kaol01DK97D2xn", "currencyType": "REAL", "discountAmount": 6, "discountExpireAt": "1976-10-11T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1999-07-23T00:00:00Z", "expireAt": "1977-09-25T00:00:00Z", "price": 17, "purchaseAt": "1993-06-09T00:00:00Z", "trialPrice": 19}, {"currencyCode": "eR5eQAe1rzmmgqBP", "currencyNamespace": "Rmd6mO4oI8KDqebm", "currencyType": "VIRTUAL", "discountAmount": 67, "discountExpireAt": "1971-11-18T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1983-08-10T00:00:00Z", "expireAt": "1999-10-12T00:00:00Z", "price": 31, "purchaseAt": "1974-07-25T00:00:00Z", "trialPrice": 92}, {"currencyCode": "7axEkvI4oxZEDxGi", "currencyNamespace": "BnNbn0zaf7CaOSlH", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1989-11-18T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1979-05-29T00:00:00Z", "expireAt": "1991-11-04T00:00:00Z", "price": 74, "purchaseAt": "1990-07-29T00:00:00Z", "trialPrice": 55}], "IwEsdOGBXBwnzDX8": [{"currencyCode": "v3xgC1Ge9PdbTTAJ", "currencyNamespace": "2Gp1r0sVZ6LJAOdd", "currencyType": "VIRTUAL", "discountAmount": 98, "discountExpireAt": "1976-01-27T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1992-04-12T00:00:00Z", "expireAt": "1975-09-02T00:00:00Z", "price": 81, "purchaseAt": "1972-08-30T00:00:00Z", "trialPrice": 96}, {"currencyCode": "Kv2LWfXqjr8fS79E", "currencyNamespace": "n3wYowBdkaZ3y6i3", "currencyType": "REAL", "discountAmount": 78, "discountExpireAt": "1982-08-27T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1993-12-04T00:00:00Z", "expireAt": "1979-03-28T00:00:00Z", "price": 48, "purchaseAt": "1978-03-17T00:00:00Z", "trialPrice": 18}, {"currencyCode": "1LyEirURERnEMzpI", "currencyNamespace": "mW6sjAHyCK5tNanG", "currencyType": "VIRTUAL", "discountAmount": 47, "discountExpireAt": "1980-03-25T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1975-10-04T00:00:00Z", "expireAt": "1981-09-17T00:00:00Z", "price": 5, "purchaseAt": "1976-10-09T00:00:00Z", "trialPrice": 93}]}, "saleConfig": {"currencyCode": "xTtmOFMebS4AdlNz", "price": 46}, "seasonType": "PASS", "sectionExclusive": true, "sellable": false, "sku": "F5m77TTh4gUoj8u2", "stackable": false, "status": "INACTIVE", "tags": ["Y48F1dl1q92m3iRl", "LiEtzVlnkflfn7pH", "fnBAk0CwiAsR65yQ"], "targetCurrencyCode": "9ssuHdGmxncCEr0K", "targetNamespace": "cgeqzGbruNB72HHM", "thumbnailUrl": "kjzyBB4UFKiaoV0V", "useCount": 82}' \
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

#- 105 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'WdECaFGzfZ2hxcJ2' \
    --sku 'Fnemn7M23SzUo4hN' \
    > test.out 2>&1
eval_tap $? 105 'GetItemBySku' test.out

#- 106 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'BDh9ZFP1OW0nXOEr' \
    --populateBundle  \
    --region 'QPS4VsRoYIK69yg9' \
    --storeId 'ADCGiXaLs2xjHkin' \
    --sku 'OD975nARHCmhNHSX' \
    > test.out 2>&1
eval_tap $? 106 'GetLocaleItemBySku' test.out

#- 107 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'uqIHsxvaUoXDmwWs' \
    --sku 'ukxncuD3QxCXMd00' \
    > test.out 2>&1
eval_tap $? 107 'GetItemIdBySku' test.out

#- 108 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'YBWCaVVmM45mfIZs,WhkS476dGGJwJ00U,H197MJ6zU7JLMQyM' \
    --storeId 'WzYQCAaPJgoxGJoJ' \
    > test.out 2>&1
eval_tap $? 108 'GetBulkItemIdBySkus' test.out

#- 109 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'aSzUtY4ZD0Xtb0U4' \
    --region 'pH16NUsVY21NVIs7' \
    --storeId 'NRen2Y3Ns0QJQeaW' \
    --itemIds 'ytPfds1BYx0EaURy' \
    > test.out 2>&1
eval_tap $? 109 'BulkGetLocaleItems' test.out

#- 110 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 110 'GetAvailablePredicateTypes' test.out

#- 111 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --userId 'df8ZyyZeHAWGgJUb' \
    --body '{"itemIds": ["UJRMbkcTglbU86Fy", "OjApNHBVfNOURcjY", "3YYT9oTynmfIuBWg"]}' \
    > test.out 2>&1
eval_tap $? 111 'ValidateItemPurchaseCondition' test.out

#- 112 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JTNFfM8M0IW4oe8K' \
    --body '{"changes": [{"itemIdentities": ["Dgy0xZfAcNg14Ws8", "TIP1LKiFQoLDvumf", "qrgSfnx2h61X9dN1"], "itemIdentityType": "ITEM_SKU", "regionData": {"RXBJ6mVV7JS9qjNL": [{"currencyCode": "wvI8JdiY3RRiLilm", "currencyNamespace": "OGF6dLLIeIVIjMcd", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1971-12-23T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1993-09-23T00:00:00Z", "discountedPrice": 40, "expireAt": "1988-12-05T00:00:00Z", "price": 36, "purchaseAt": "1997-01-22T00:00:00Z", "trialPrice": 92}, {"currencyCode": "NL5gJPqTAjgqaTHf", "currencyNamespace": "1ANTJ9Yk997XkGOd", "currencyType": "VIRTUAL", "discountAmount": 35, "discountExpireAt": "1983-10-08T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1980-09-06T00:00:00Z", "discountedPrice": 47, "expireAt": "1996-08-30T00:00:00Z", "price": 35, "purchaseAt": "1994-06-25T00:00:00Z", "trialPrice": 95}, {"currencyCode": "p4n4XCFkD1AJLCws", "currencyNamespace": "zbZxuHSgDOK8bjoF", "currencyType": "VIRTUAL", "discountAmount": 3, "discountExpireAt": "1972-11-05T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1999-08-15T00:00:00Z", "discountedPrice": 49, "expireAt": "1989-02-04T00:00:00Z", "price": 3, "purchaseAt": "1978-06-10T00:00:00Z", "trialPrice": 47}], "ZTGJpqgl2IzNXGTu": [{"currencyCode": "QPIDpor7t1aJLNNz", "currencyNamespace": "6QIVC9Mfuc8VOsnm", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1976-07-16T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1977-04-03T00:00:00Z", "discountedPrice": 43, "expireAt": "1975-08-26T00:00:00Z", "price": 7, "purchaseAt": "1985-06-18T00:00:00Z", "trialPrice": 26}, {"currencyCode": "FjS1GC1d2b92B4vE", "currencyNamespace": "gj3HOmhcWm428Xej", "currencyType": "VIRTUAL", "discountAmount": 64, "discountExpireAt": "1982-11-19T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1988-04-12T00:00:00Z", "discountedPrice": 27, "expireAt": "1980-11-10T00:00:00Z", "price": 33, "purchaseAt": "1980-10-12T00:00:00Z", "trialPrice": 57}, {"currencyCode": "m5bufnBqrpLeqhwV", "currencyNamespace": "hjnnjKMEmtbiWsAQ", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1990-01-28T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1998-10-26T00:00:00Z", "discountedPrice": 25, "expireAt": "1975-09-09T00:00:00Z", "price": 59, "purchaseAt": "1997-10-04T00:00:00Z", "trialPrice": 49}], "QhfIhHtADUQ9zimQ": [{"currencyCode": "TQT95pFJUAJsyAfe", "currencyNamespace": "KOufV4f15NohXu6o", "currencyType": "VIRTUAL", "discountAmount": 9, "discountExpireAt": "1983-12-19T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1987-04-16T00:00:00Z", "discountedPrice": 88, "expireAt": "1980-06-09T00:00:00Z", "price": 33, "purchaseAt": "1992-12-08T00:00:00Z", "trialPrice": 51}, {"currencyCode": "qlkL0diRhLC10ih2", "currencyNamespace": "EQfY3XCv4hdOa6Fd", "currencyType": "REAL", "discountAmount": 83, "discountExpireAt": "1991-04-16T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1971-01-27T00:00:00Z", "discountedPrice": 1, "expireAt": "1978-04-17T00:00:00Z", "price": 13, "purchaseAt": "1987-11-12T00:00:00Z", "trialPrice": 18}, {"currencyCode": "z0F2UBRmMhAbUWmF", "currencyNamespace": "hdYLWzMuv3zkUY0n", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1985-08-03T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1997-03-20T00:00:00Z", "discountedPrice": 47, "expireAt": "1988-01-13T00:00:00Z", "price": 64, "purchaseAt": "1996-01-10T00:00:00Z", "trialPrice": 21}]}}, {"itemIdentities": ["RkPSSITz4TjCrJHX", "GXku2YVuOzhxHmnr", "rV9ZGWrZ05sxe6A6"], "itemIdentityType": "ITEM_SKU", "regionData": {"PhPUTKbonoucNmzw": [{"currencyCode": "OZOK56sDkci5rZ8i", "currencyNamespace": "MlOuksQJCiRFiZWw", "currencyType": "REAL", "discountAmount": 81, "discountExpireAt": "1978-05-22T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1990-01-06T00:00:00Z", "discountedPrice": 94, "expireAt": "1998-04-26T00:00:00Z", "price": 94, "purchaseAt": "1975-08-19T00:00:00Z", "trialPrice": 19}, {"currencyCode": "9YQzUJ9XlYJ8BzP6", "currencyNamespace": "EUmUXGM5anIloyj9", "currencyType": "REAL", "discountAmount": 11, "discountExpireAt": "1974-01-12T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1981-09-02T00:00:00Z", "discountedPrice": 43, "expireAt": "1984-12-11T00:00:00Z", "price": 18, "purchaseAt": "1972-03-12T00:00:00Z", "trialPrice": 19}, {"currencyCode": "JOF7JKZFNk2NKy59", "currencyNamespace": "X8iOg2sVBiCoeC5w", "currencyType": "REAL", "discountAmount": 35, "discountExpireAt": "1989-05-09T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1981-09-10T00:00:00Z", "discountedPrice": 84, "expireAt": "1978-02-06T00:00:00Z", "price": 79, "purchaseAt": "1975-11-18T00:00:00Z", "trialPrice": 68}], "mVjAkO3HKsEp6Klq": [{"currencyCode": "wW4djrexcbHdEtoQ", "currencyNamespace": "vpV344RctmTozCi8", "currencyType": "VIRTUAL", "discountAmount": 8, "discountExpireAt": "1975-02-26T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1996-01-12T00:00:00Z", "discountedPrice": 25, "expireAt": "1971-07-18T00:00:00Z", "price": 24, "purchaseAt": "1988-04-08T00:00:00Z", "trialPrice": 72}, {"currencyCode": "qBBfi7sSF5BoGiTC", "currencyNamespace": "VsXsygWbjE2opXtd", "currencyType": "VIRTUAL", "discountAmount": 48, "discountExpireAt": "1989-12-17T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1997-10-14T00:00:00Z", "discountedPrice": 72, "expireAt": "1998-03-15T00:00:00Z", "price": 40, "purchaseAt": "1995-04-25T00:00:00Z", "trialPrice": 30}, {"currencyCode": "IK9lOLaZaMphKCqT", "currencyNamespace": "q3EVheJjoEEXBLIx", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1977-11-21T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1981-03-05T00:00:00Z", "discountedPrice": 29, "expireAt": "1980-10-16T00:00:00Z", "price": 48, "purchaseAt": "1990-10-07T00:00:00Z", "trialPrice": 33}], "WWPvvCiCf33ViEdq": [{"currencyCode": "QpoGkUWNizk5UcPA", "currencyNamespace": "Gv6c1ESC6hZYTYZb", "currencyType": "VIRTUAL", "discountAmount": 8, "discountExpireAt": "1973-05-13T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1971-08-15T00:00:00Z", "discountedPrice": 55, "expireAt": "1972-11-19T00:00:00Z", "price": 86, "purchaseAt": "1991-06-16T00:00:00Z", "trialPrice": 82}, {"currencyCode": "WfgBAKx27MSBqabU", "currencyNamespace": "XOGkkoMUZn1YXj5z", "currencyType": "REAL", "discountAmount": 83, "discountExpireAt": "1996-08-20T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1992-12-17T00:00:00Z", "discountedPrice": 11, "expireAt": "1980-11-24T00:00:00Z", "price": 18, "purchaseAt": "1982-08-17T00:00:00Z", "trialPrice": 32}, {"currencyCode": "QZSJPOIKrRBrYVzi", "currencyNamespace": "9ui3lvozTt9TsH7A", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1987-01-02T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1992-01-07T00:00:00Z", "discountedPrice": 84, "expireAt": "1984-03-22T00:00:00Z", "price": 53, "purchaseAt": "1976-03-14T00:00:00Z", "trialPrice": 56}]}}, {"itemIdentities": ["1sys6GdkDcos5uVJ", "0BJfZ0jvA54CSqZF", "DsO1skRjOU1SMfQV"], "itemIdentityType": "ITEM_SKU", "regionData": {"a6blj9Rdd85bdYUu": [{"currencyCode": "mPKVSZCg3XTc9vQe", "currencyNamespace": "0dHJfF6KIuvnRCa9", "currencyType": "VIRTUAL", "discountAmount": 22, "discountExpireAt": "1977-06-06T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1983-02-05T00:00:00Z", "discountedPrice": 57, "expireAt": "1972-07-15T00:00:00Z", "price": 30, "purchaseAt": "1976-01-04T00:00:00Z", "trialPrice": 65}, {"currencyCode": "KrEWFw9GYxjiiOQA", "currencyNamespace": "D77ci0vfWVZoRRMP", "currencyType": "REAL", "discountAmount": 91, "discountExpireAt": "1972-04-06T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1994-07-16T00:00:00Z", "discountedPrice": 21, "expireAt": "1989-01-06T00:00:00Z", "price": 75, "purchaseAt": "1984-01-01T00:00:00Z", "trialPrice": 57}, {"currencyCode": "nyI6ulKNKoXa0dgx", "currencyNamespace": "1JgjC56pda3YhtQx", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1973-10-14T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1977-09-06T00:00:00Z", "discountedPrice": 87, "expireAt": "1983-05-19T00:00:00Z", "price": 57, "purchaseAt": "1979-08-28T00:00:00Z", "trialPrice": 7}], "XJcrqKmXDwoEV6tC": [{"currencyCode": "drxw1KOPhuvHuYrG", "currencyNamespace": "WDK41uMOC0mRvSoa", "currencyType": "REAL", "discountAmount": 0, "discountExpireAt": "1973-03-25T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1981-03-19T00:00:00Z", "discountedPrice": 66, "expireAt": "1973-02-23T00:00:00Z", "price": 45, "purchaseAt": "1987-04-22T00:00:00Z", "trialPrice": 42}, {"currencyCode": "JDg9Q3WXiydCOInV", "currencyNamespace": "olsr6CHmj763vLwt", "currencyType": "VIRTUAL", "discountAmount": 63, "discountExpireAt": "1982-10-15T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1994-02-01T00:00:00Z", "discountedPrice": 92, "expireAt": "1987-03-07T00:00:00Z", "price": 32, "purchaseAt": "1996-06-20T00:00:00Z", "trialPrice": 19}, {"currencyCode": "tDtetoQVFL8LNW11", "currencyNamespace": "vtpaTxi7k489jRCn", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1979-06-25T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1976-08-21T00:00:00Z", "discountedPrice": 17, "expireAt": "1992-02-11T00:00:00Z", "price": 39, "purchaseAt": "1989-04-27T00:00:00Z", "trialPrice": 11}], "0Wj1WfzIvc3VlSXr": [{"currencyCode": "A3XUGud4tVjmxEf4", "currencyNamespace": "XvVhFJTxFHITBg9x", "currencyType": "VIRTUAL", "discountAmount": 41, "discountExpireAt": "1992-04-13T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1979-03-28T00:00:00Z", "discountedPrice": 8, "expireAt": "1981-11-30T00:00:00Z", "price": 95, "purchaseAt": "1990-02-14T00:00:00Z", "trialPrice": 69}, {"currencyCode": "NfUDe4g7q6PHEaqb", "currencyNamespace": "zHvDDl1jiLw3XMGB", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1995-10-19T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1996-08-29T00:00:00Z", "discountedPrice": 63, "expireAt": "1979-07-11T00:00:00Z", "price": 55, "purchaseAt": "1976-03-31T00:00:00Z", "trialPrice": 39}, {"currencyCode": "mc4xYiLjLyZrXr9B", "currencyNamespace": "htzn8jAdTn6xBhrc", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1980-06-28T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1977-11-02T00:00:00Z", "discountedPrice": 36, "expireAt": "1977-07-04T00:00:00Z", "price": 78, "purchaseAt": "1979-07-05T00:00:00Z", "trialPrice": 22}]}}]}' \
    > test.out 2>&1
eval_tap $? 112 'BulkUpdateRegionData' test.out

#- 113 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'MEDIA' \
    --limit '0' \
    --offset '6' \
    --sortBy 'uuokpaIjL0Vxe5n9' \
    --storeId 'Lx3QcFo9gxOgvDc7' \
    --keyword 'xMrRKvw8ISP2WKmC' \
    --language 'RRXBxlalCHtWlKxL' \
    > test.out 2>&1
eval_tap $? 113 'SearchItems' test.out

#- 114 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '31' \
    --offset '65' \
    --sortBy 'name:asc,name,displayOrder:desc' \
    --storeId 'tv5guycGiq9j2EyI' \
    > test.out 2>&1
eval_tap $? 114 'QueryUncategorizedItems' test.out

#- 115 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'knfLDpgHnMOn8nc3' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'gUZ8ZFyyEr0KBXuJ' \
    > test.out 2>&1
eval_tap $? 115 'GetItem' test.out

#- 116 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'BqK4QtEydPWLPBYi' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'R3UbJc1ZYapx7C47' \
    --body '{"appId": "7etqgfOJDUT0uKAP", "appType": "GAME", "baseAppId": "Rz3V7YbJM3bNLWHA", "boothName": "bCZixe2cQ6O30lpz", "categoryPath": "cBQMAEcNcJqrKxnM", "clazz": "zSYoc4ZjiMY4H34B", "displayOrder": 58, "entitlementType": "DURABLE", "ext": {"AZ5j24acYHbrryHB": {}, "6GO9zP3FaepA3b3Y": {}, "J9nJM6vtT27xv85K": {}}, "features": ["kd6GEDo08yq5E5Hl", "5MU2qmbeqaVemINd", "ClpF7OvlBIEgjse5"], "images": [{"as": "eLoog4me2NBFp62x", "caption": "lXvVcJerTPW02PWs", "height": 69, "imageUrl": "RDQMBSYAFLqp8PF5", "smallImageUrl": "hCcoukWpnbz4ys7j", "width": 71}, {"as": "lxuU3u2HEG0qfKeg", "caption": "vFTD1sPykS8YLmwt", "height": 1, "imageUrl": "gWGcA0h4G1LZ1HaX", "smallImageUrl": "5UBMbsF44VTsLDRz", "width": 6}, {"as": "nYX2YBF2g7TVtzYE", "caption": "HUodh3iUfBthbepU", "height": 59, "imageUrl": "HF9ejHaILQruAuYy", "smallImageUrl": "JLYGqMv824ouSgkp", "width": 76}], "itemIds": ["q03BGdIk4oEogFVG", "R71rJOBy6lsj1AKG", "BjnHmaAu4YK87DYA"], "itemQty": {"WWcbcbGWmKgE8CZ4": 54, "64Vnwa0ClGQJultJ": 9, "hgFsqHC9h5JPiMEt": 13}, "itemType": "SUBSCRIPTION", "listable": true, "localizations": {"uiGTYgwWv5XldL6r": {"description": "OVGcRAn51rVAQSxp", "localExt": {"4qTB54mKA3V9DKlC": {}, "eZ7mLYsHooOIaxIp": {}, "b1cIOJPS3lJ80YJ4": {}}, "longDescription": "1U4ooQ980ywmg1pW", "title": "pWit1QC7FKe0fnHU"}, "lmU1unGKM0tgfeWy": {"description": "47bbwMI4gGmvK9gW", "localExt": {"596FwBNrFXt3TAuK": {}, "BwBcD12ae6r3hHwy": {}, "a4NpdOzg3hr6ucHf": {}}, "longDescription": "7dbh2iKNUl0qJqzo", "title": "KMRMG541PAiNjULs"}, "x4SnKNXLMUaDSwwQ": {"description": "lnNRZJHBSB4fZWEF", "localExt": {"IZs28Ff1kZp1Zktx": {}, "3N7WNMYIfcDKbLu8": {}, "pnK34oA1keYXJvtg": {}}, "longDescription": "gDdXjbdjMBahFZZG", "title": "MTcqnWrIprOv0BJ9"}}, "lootBoxConfig": {"rewardCount": 92, "rewards": [{"lootBoxItems": [{"count": 27, "duration": 13, "endDate": "1986-03-31T00:00:00Z", "itemId": "JlmD1iEokbUiYzCQ", "itemSku": "h2iNTwtnohddMzMT", "itemType": "Q9P7sYLDWAJOA75K"}, {"count": 61, "duration": 56, "endDate": "1996-10-13T00:00:00Z", "itemId": "dV4D5jftRl9rZmtQ", "itemSku": "Uvro8TWwXWsz9TVm", "itemType": "dMKEohKzuMYDUTLB"}, {"count": 10, "duration": 40, "endDate": "1985-03-09T00:00:00Z", "itemId": "DkUt3yexZBRvxYnE", "itemSku": "BhXtAVxCd3meTrT7", "itemType": "cF9oVCh89wNOkKYs"}], "name": "sVejcL3kR3hCGNga", "odds": 0.5712805578261566, "type": "PROBABILITY_GROUP", "weight": 54}, {"lootBoxItems": [{"count": 41, "duration": 53, "endDate": "1991-10-31T00:00:00Z", "itemId": "HR5BWa9VzIkaQEl1", "itemSku": "iUProNB6hI6IpGcT", "itemType": "oWgFvdRhG9NwV3zD"}, {"count": 42, "duration": 50, "endDate": "1979-12-18T00:00:00Z", "itemId": "VlVTypcYPK8IxrSZ", "itemSku": "uxWl0Je4fJIyFAm3", "itemType": "DQht4JwnPS2urJqe"}, {"count": 35, "duration": 17, "endDate": "1978-01-10T00:00:00Z", "itemId": "IBbcujF8Vk5qb8Nh", "itemSku": "WWwaxyMchkt8l5IP", "itemType": "SrwrJl7wYIVw13NC"}], "name": "o9yXlbQ52FTHTCj6", "odds": 0.7220054462307498, "type": "REWARD", "weight": 53}, {"lootBoxItems": [{"count": 54, "duration": 51, "endDate": "1971-04-07T00:00:00Z", "itemId": "7TOpyiuvvQUm29Ia", "itemSku": "cq4XRLaA643nTMtX", "itemType": "SAyejnny0Ju13b6o"}, {"count": 88, "duration": 41, "endDate": "1982-08-12T00:00:00Z", "itemId": "BBJI5JxytpcubN4A", "itemSku": "UUPFPscZsXeJOD4D", "itemType": "MtqfIGiGJovgWSRx"}, {"count": 88, "duration": 88, "endDate": "1991-04-26T00:00:00Z", "itemId": "4UQ2fg3V1o2x0hL5", "itemSku": "DuBDqMyIAzWze94M", "itemType": "EdJFAy2JTllJkRGB"}], "name": "8jqJEd6eqqsBVyON", "odds": 0.761470986207622, "type": "PROBABILITY_GROUP", "weight": 72}], "rollFunction": "DEFAULT"}, "maxCount": 88, "maxCountPerUser": 40, "name": "wLYW3n4F3LD1EDwB", "optionBoxConfig": {"boxItems": [{"count": 67, "duration": 45, "endDate": "1992-03-10T00:00:00Z", "itemId": "uBYeQZOzATNSV9E9", "itemSku": "yyNb7yaLXzAVYymO", "itemType": "uhCkZu4htrsf8eIF"}, {"count": 90, "duration": 15, "endDate": "1978-09-20T00:00:00Z", "itemId": "vTGXaMsq8ePN1oco", "itemSku": "2jx8Upe8SjMvpqM8", "itemType": "puggOEdG47gD5i2N"}, {"count": 18, "duration": 84, "endDate": "1993-07-31T00:00:00Z", "itemId": "ny4ij4ysYPonb59g", "itemSku": "QffkNOmubxEJr2qE", "itemType": "AuJbpZSrcbc4LWfK"}]}, "purchasable": false, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 4, "fixedTrialCycles": 14, "graceDays": 21}, "regionData": {"tP5TDuI5f6m4KC07": [{"currencyCode": "CnsZe32hqEcB1ExY", "currencyNamespace": "MBb3ckvoaJYdMqGe", "currencyType": "REAL", "discountAmount": 55, "discountExpireAt": "1972-02-12T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1978-12-25T00:00:00Z", "expireAt": "1973-07-25T00:00:00Z", "price": 90, "purchaseAt": "1987-06-25T00:00:00Z", "trialPrice": 92}, {"currencyCode": "BZXN3cjIXmFWRJnj", "currencyNamespace": "8xN7HDPTUEDPN1Kb", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1975-12-06T00:00:00Z", "discountPercentage": 59, "discountPurchaseAt": "1995-08-28T00:00:00Z", "expireAt": "1997-08-27T00:00:00Z", "price": 93, "purchaseAt": "1975-01-13T00:00:00Z", "trialPrice": 62}, {"currencyCode": "55g8LSTs7Nf95lGl", "currencyNamespace": "Prf6obIdnI6Ag7eU", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1978-09-18T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1973-07-27T00:00:00Z", "expireAt": "1992-07-25T00:00:00Z", "price": 62, "purchaseAt": "1996-06-30T00:00:00Z", "trialPrice": 59}], "0X8fBuBSKLSQ4GvL": [{"currencyCode": "tz50D3rpBfBovqLw", "currencyNamespace": "XBuT30EYeRj17xGh", "currencyType": "REAL", "discountAmount": 44, "discountExpireAt": "1985-10-16T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1985-04-27T00:00:00Z", "expireAt": "1982-01-11T00:00:00Z", "price": 10, "purchaseAt": "1975-08-23T00:00:00Z", "trialPrice": 70}, {"currencyCode": "jZUMRf2VJetWsokv", "currencyNamespace": "x3BHuTEczr9KjQ3t", "currencyType": "VIRTUAL", "discountAmount": 52, "discountExpireAt": "1999-02-15T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1995-08-10T00:00:00Z", "expireAt": "1977-06-09T00:00:00Z", "price": 25, "purchaseAt": "1998-08-24T00:00:00Z", "trialPrice": 49}, {"currencyCode": "k29mcjSuz9vbNStq", "currencyNamespace": "PtQmQN6eKAGiZFCf", "currencyType": "VIRTUAL", "discountAmount": 37, "discountExpireAt": "1994-08-10T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1992-09-04T00:00:00Z", "expireAt": "1985-01-28T00:00:00Z", "price": 19, "purchaseAt": "1975-10-08T00:00:00Z", "trialPrice": 95}], "rnulxcCKAru8pOaA": [{"currencyCode": "VLDB4k3JwkdaxR7G", "currencyNamespace": "JpYmuYCPG181q9GA", "currencyType": "REAL", "discountAmount": 61, "discountExpireAt": "1992-07-14T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1974-08-28T00:00:00Z", "expireAt": "1972-09-02T00:00:00Z", "price": 64, "purchaseAt": "1974-10-22T00:00:00Z", "trialPrice": 76}, {"currencyCode": "TsqDTynCewqJligL", "currencyNamespace": "lRxOelKykICRxF6H", "currencyType": "VIRTUAL", "discountAmount": 95, "discountExpireAt": "1976-06-01T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1993-08-07T00:00:00Z", "expireAt": "1999-06-05T00:00:00Z", "price": 32, "purchaseAt": "1983-05-30T00:00:00Z", "trialPrice": 94}, {"currencyCode": "4qrNARATn6KXOutl", "currencyNamespace": "YBbLhL8KXx25FZfQ", "currencyType": "REAL", "discountAmount": 90, "discountExpireAt": "1972-07-28T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1982-05-17T00:00:00Z", "expireAt": "1990-12-13T00:00:00Z", "price": 10, "purchaseAt": "1980-08-10T00:00:00Z", "trialPrice": 22}]}, "saleConfig": {"currencyCode": "pCJBIXLGYcwWVRK6", "price": 95}, "seasonType": "TIER", "sectionExclusive": false, "sellable": true, "sku": "5ozrXA4HZHNyq9od", "stackable": false, "status": "ACTIVE", "tags": ["mLYe2phYOgT5kDTy", "fkycLSVdleSaAyls", "nhR1Zrm3thUvV87y"], "targetCurrencyCode": "Pl3dKF7NXEjrJMki", "targetNamespace": "8jvc3P8Gwjg3IOH0", "thumbnailUrl": "SDHgYKqxJiFJdrmj", "useCount": 29}' \
    > test.out 2>&1
eval_tap $? 116 'UpdateItem' test.out

#- 117 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'vhzgsJwex7wq8ZPl' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'XNaUNgdY2vfJuje5' \
    > test.out 2>&1
eval_tap $? 117 'DeleteItem' test.out

#- 118 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'cPnmGjTvYa5Pqx1K' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 13, "orderNo": "qcAoijBPAp6EPb98"}' \
    > test.out 2>&1
eval_tap $? 118 'AcquireItem' test.out

#- 119 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId '8NzxrDKVpULjjiw3' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'NeVG4DJi9DaMrc0W' \
    > test.out 2>&1
eval_tap $? 119 'GetApp' test.out

#- 120 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'FgKjE945x2CPVYYG' \
    --namespace "$AB_NAMESPACE" \
    --storeId '9WvoGmAmvaVV5Yfx' \
    --body '{"carousel": [{"alt": "nUNcwjr7gSGhnfuF", "previewUrl": "4WZiQVICVpWd3UM0", "thumbnailUrl": "8gMXhdf3juXW4Jpr", "type": "image", "url": "98SgtJd4Z5f8nfaK", "videoSource": "vimeo"}, {"alt": "OJDGCTHIOFjeXbsS", "previewUrl": "gR43kIDzxBwqRJTz", "thumbnailUrl": "rHNZWUsq5lQo2jy2", "type": "video", "url": "9ccTt7Wxw8OQ13t3", "videoSource": "vimeo"}, {"alt": "czRpdk0HATGylx2J", "previewUrl": "G2KNGfhzfCTxxrsR", "thumbnailUrl": "RLee3TcJ7DQIi45a", "type": "video", "url": "Mp3uOQIybqWfG9BJ", "videoSource": "vimeo"}], "developer": "FVKlbYHtbPtaxvag", "forumUrl": "SlpGgVTF6VeDAPOG", "genres": ["Racing", "Casual", "MassivelyMultiplayer"], "localizations": {"86XmRkCEcfHDCdl5": {"announcement": "9Wp9A3tXGve6DdK6", "slogan": "uvg8f2cIoByk9fxt"}, "vsgeAxo57nKAbZps": {"announcement": "bJ4Iu5KJ0ynxGBla", "slogan": "cDCdFe8ATUqVxcSt"}, "hrpnMUBsnUfuQIcS": {"announcement": "bUt5UGkInFGpuUsd", "slogan": "tq4dOwNESzCEW9dU"}}, "platformRequirements": {"VhZjLftC3sCS8CpL": [{"additionals": "CqPD9CeDEdCnnL6K", "directXVersion": "t1Bjj3b8QM8Rr45U", "diskSpace": "LqXQgvwD3PsKDJiW", "graphics": "xQBwaS7rDBf2S54p", "label": "hbdyGDt47f9GWRlE", "osVersion": "9hqz6rjDNo4rhjxU", "processor": "dMM83WekqfWv04vv", "ram": "n9bk5qr8qs2mqtnG", "soundCard": "AqXUjNypF6MMqWpd"}, {"additionals": "EJsPoaIbYz8cK5jl", "directXVersion": "pJdre5ur6yvWJDdv", "diskSpace": "M7T7PX2vamIRZHzs", "graphics": "IYOCUoiCXNjrdQL2", "label": "jdx1eIba1sB0HsJ0", "osVersion": "6DzfbzRYt4OVUyum", "processor": "BeIqdQGZC5kM03HH", "ram": "ijsQRj7N8IAjmson", "soundCard": "jj0ZR50BQ1U6aFD3"}, {"additionals": "O2kXQSc58zgZVl4g", "directXVersion": "IF7v3qbZu9M3OxqV", "diskSpace": "AT4H1lRZ9Z1JBrHR", "graphics": "zEOtIxzPqb6n73m0", "label": "jiaDH86d9rsKgzCs", "osVersion": "MulpB8HZUtVVaJCi", "processor": "LgKOwrSfWhT5B4We", "ram": "dopzwSluBtRFPKTh", "soundCard": "yGnbjmPDKFS6u9FH"}], "uv1M3qfch4SqIV6L": [{"additionals": "QPHlaeYl4csFq65c", "directXVersion": "U66yJaj4ovoKWE4E", "diskSpace": "W0sw8v5peiuxoBJA", "graphics": "TauyD3XCXVMiyEvM", "label": "f9yilUEujk6oqYo1", "osVersion": "HQYTFzwdOMdupwD4", "processor": "O3uNbcIDcIyvZbOy", "ram": "1T4hfwkuVykH4Rpf", "soundCard": "mjIXFGZ5PKdbabJI"}, {"additionals": "kNnt9P1Tkm08luh4", "directXVersion": "dpPRMDbUXBWTbpAo", "diskSpace": "gG2wlZkLhuU5FI8N", "graphics": "ijFI0GKwJ3vfXlsA", "label": "My2Zp2UAGxHnmSxv", "osVersion": "kG9UR5q9neoW6JBc", "processor": "Gp9Rx2RfcRhXpmee", "ram": "Hdvphas9S7ivHEoL", "soundCard": "bUMM47f1UreUpxEk"}, {"additionals": "XIbE1ETzRJZKMavu", "directXVersion": "4Ul2IaieEbPSE7TG", "diskSpace": "keHsYsW9oGBN1pYM", "graphics": "BwbPZTlMlUvFEiGp", "label": "rcNSQ9kEeXBZ6FVr", "osVersion": "BzyhyhoS6a9oe0Ja", "processor": "XFpff28uYbe4Cf2H", "ram": "EHvVevhISjbtBJUK", "soundCard": "5fE3OufPSX3PdOU2"}], "V9yw94oa8UJ34TIe": [{"additionals": "dV3HyoX4VnO2LpBU", "directXVersion": "08wfnlHBXFIqFUmg", "diskSpace": "USMM5au8GJT0mkVP", "graphics": "I6zUtf3QaJPGrTNc", "label": "XXTUIggoH89QNmI1", "osVersion": "7UDb19R6H7r1ta3m", "processor": "7jK5pxe82pgFiAS6", "ram": "piIzmc8rKrKEPGSA", "soundCard": "cong6eNERUf8kjci"}, {"additionals": "1Ctccv9Gv4tOcbnu", "directXVersion": "Cqf0lm6WBkIzjoSV", "diskSpace": "31tvmMB6jzrpRGES", "graphics": "mooHiCV4GUOnXpap", "label": "XQGRakUbcG7PcR4e", "osVersion": "iU3Idi55jNrGNT2V", "processor": "HTKuIT5FwwHj0Ur5", "ram": "F2PWGTTD81xhNP4t", "soundCard": "6kYBUjyXAn3bWQF6"}, {"additionals": "QcAiJpXIrgroixpt", "directXVersion": "ZhckUTGkcBOE4qMc", "diskSpace": "H1Kyi8ZFvGcV8DY0", "graphics": "XOkDstxZcY1HgAnZ", "label": "V4IOglVLqb9lGAJU", "osVersion": "g21Lt7JwgwMUSuC3", "processor": "Bajy3BcEMCtQs2Fc", "ram": "EcvVAyId6Cp85HVD", "soundCard": "sZBQgOnXuXsGThYZ"}]}, "platforms": ["Linux", "Windows", "IOS"], "players": ["LocalCoop", "CrossPlatformMulti", "CrossPlatformMulti"], "primaryGenre": "Simulation", "publisher": "wrFMnPpWgrQD4hEk", "releaseDate": "1998-11-20T00:00:00Z", "websiteUrl": "OLjYsnignE7KcMF7"}' \
    > test.out 2>&1
eval_tap $? 120 'UpdateApp' test.out

#- 121 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'fuDbzRRYMNXWUsp1' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tOibJY9aL9ie6vvM' \
    > test.out 2>&1
eval_tap $? 121 'DisableItem' test.out

#- 122 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'biNURrlm88QlKyuo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'GetItemDynamicData' test.out

#- 123 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'ya4JgakZyUV7t73V' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nSFbuxd4KYZ0jk0U' \
    > test.out 2>&1
eval_tap $? 123 'EnableItem' test.out

#- 124 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'ZdhtnKu9oTc8pVki' \
    --itemId 'yGsj5JdXzRxfNEjU' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MTs8WIObJBTsvsw7' \
    > test.out 2>&1
eval_tap $? 124 'FeatureItem' test.out

#- 125 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature '6uISRX0bKVoWtoUW' \
    --itemId '1P7ocuBAldDSUS7H' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aa6unq1yQOSRvyiL' \
    > test.out 2>&1
eval_tap $? 125 'DefeatureItem' test.out

#- 126 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'BRVtIDi2piIQFVmz' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Midw70KSahpYZdKZ' \
    --populateBundle  \
    --region 'RyR9AX7JjxvNZhM8' \
    --storeId '4DiZk6ySrB9SVFct' \
    > test.out 2>&1
eval_tap $? 126 'GetLocaleItem' test.out

#- 127 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'W7YS0OkL78XeEAtA' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LFI3v8yha4pd5A7M' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 4, "comparison": "includes", "name": "pBD6lKNb8RxvN2u5", "predicateType": "SeasonTierPredicate", "value": "HJkqgS2B37wwoPYO", "values": ["WRrtW870qD88Zcdu", "HiIsxmsLBPBJuNLn", "ZSe7W20UZcDaiq0n"]}, {"anyOf": 63, "comparison": "isLessThanOrEqual", "name": "Z7PyhqFJkDClOsKm", "predicateType": "EntitlementPredicate", "value": "0tRVLMlHi8i9gOVq", "values": ["ajUWrgEsWDtaKzn8", "FbrOMZMgWkFN7Tpk", "dZwnnGeZsZVgbPzP"]}, {"anyOf": 47, "comparison": "excludes", "name": "2XTrFibRAhzzEWzW", "predicateType": "EntitlementPredicate", "value": "ndW2JKmQafUs2bxY", "values": ["wd8DHoCQykmXHYmk", "ztOEyVbKIf1ZbzgU", "Rlg7gYs6unPYQ9jN"]}]}, {"operator": "and", "predicates": [{"anyOf": 81, "comparison": "isLessThan", "name": "1di1ldhOh6HvjnYu", "predicateType": "EntitlementPredicate", "value": "NfC4A2ODiZhbfb8Q", "values": ["FfgK46GjCWaP8huT", "qCyK1XH9D6vl5eFd", "mnq3FGQn3Ahu5wxq"]}, {"anyOf": 7, "comparison": "isGreaterThan", "name": "v9z75SzoCV8ZMi2o", "predicateType": "EntitlementPredicate", "value": "DFQfXFD58sG6uDhF", "values": ["MKclr5igjNTVItrH", "utjS029BiJWOG1m7", "YlrzJBYSeMuJfQec"]}, {"anyOf": 66, "comparison": "isGreaterThan", "name": "hxJgaVfw5Vnyq8Oz", "predicateType": "SeasonTierPredicate", "value": "c6VbE0AGcekjMNHu", "values": ["uyDoN91uc28HoSpG", "t1g0GGbT4Hf2PPKO", "PXtz8tXxrmzafMUg"]}]}, {"operator": "and", "predicates": [{"anyOf": 82, "comparison": "excludes", "name": "GGvi9kg3rMIzNmhJ", "predicateType": "SeasonTierPredicate", "value": "eg9q86IaDFjjx6uZ", "values": ["erWbtwTX9gNRByjb", "qcKLa7LevxNHOSEh", "E8lOLAfTXKLzbrdd"]}, {"anyOf": 88, "comparison": "is", "name": "ZIp693lRwtc43atC", "predicateType": "SeasonPassPredicate", "value": "vQX4yFQFdrRoM6Fo", "values": ["MDji329PfVrvMEPt", "qCYw7AlxO6qdFpc7", "1sSck3ggZWJlSlCQ"]}, {"anyOf": 32, "comparison": "isGreaterThanOrEqual", "name": "zlsCR5rVsyfcH7Wj", "predicateType": "SeasonTierPredicate", "value": "9LVeVskqeUB7RSay", "values": ["bVApebRA09rW8i8k", "rFWJhe03coRFok5d", "qGFguhh3bvadRthd"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 127 'UpdateItemPurchaseCondition' test.out

#- 128 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId '3AyGrZO8GuoXNSoV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "EBG7VbBPUWipz9C0"}' \
    > test.out 2>&1
eval_tap $? 128 'ReturnItem' test.out

#- 129 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --name 'YabFX4FCK5ucTFsA' \
    --offset '64' \
    --tag 'qBmILhtWm8RQvRUb' \
    > test.out 2>&1
eval_tap $? 129 'QueryKeyGroups' test.out

#- 130 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "UDSiefGEdLucrtO2", "name": "gCQD057DrDlgC2nz", "status": "ACTIVE", "tags": ["SiGUjVAw4v3q6JRH", "cn7KaoCEkRdo6qHY", "IZWnXqQ1oHFJ9Q0v"]}' \
    > test.out 2>&1
eval_tap $? 130 'CreateKeyGroup' test.out

#- 131 GetKeyGroupByBoothName
eval_tap 0 131 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 132 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'qsL9SomqWsGA76yx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 132 'GetKeyGroup' test.out

#- 133 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'i0QzZWfmP2sx0KO5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "bEJaPnAFjsodyJQV", "name": "VBrShGbIIuqK8C40", "status": "ACTIVE", "tags": ["HgoXCR6XOMXwKdfq", "k8T4QHK30EX0Fclp", "Dl5HsuracO5Mnjnx"]}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateKeyGroup' test.out

#- 134 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'D1OXkxShFVQTRekL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 134 'GetKeyGroupDynamic' test.out

#- 135 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'fjmy8zosRCRgVwbr' \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '40' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 135 'ListKeys' test.out

#- 136 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'mb01yA7U7dGMjupZ' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 136 'UploadKeys' test.out

#- 137 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'kZQY8CNyT4k3DIbf' \
    --limit '94' \
    --offset '82' \
    --orderNos 'G5NpE130YWSgxpKW,tdtdtVW9anENmxb9,e7vXZV3ig8Jg5VBy' \
    --sortBy 'eI3ycMcYYBixKJXC' \
    --startTime 'ISQdwec1m8BusV9t' \
    --status 'CHARGEBACK_REVERSED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 137 'QueryOrders' test.out

#- 138 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetOrderStatistics' test.out

#- 139 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'h74KVo6Xqjz2xUKL' \
    > test.out 2>&1
eval_tap $? 139 'GetOrder' test.out

#- 140 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'NWSmYyVvyelIJ8Qg' \
    --body '{"description": "aLMqi836ULa7cfZl"}' \
    > test.out 2>&1
eval_tap $? 140 'RefundOrder' test.out

#- 141 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'GetPaymentCallbackConfig' test.out

#- 142 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": true, "notifyUrl": "VuY6rsZyo6CBRRno", "privateKey": "OikIxXKKIR6kPmsw"}' \
    > test.out 2>&1
eval_tap $? 142 'UpdatePaymentCallbackConfig' test.out

#- 143 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'm5TCAU1cKApdJDnE' \
    --externalId '73GLmSZns5owBhoU' \
    --limit '13' \
    --notificationSource 'WXPAY' \
    --notificationType 'sGP6KLPXkvUv2XiX' \
    --offset '0' \
    --paymentOrderNo 's7CbIJ7eHnVWOboM' \
    --startDate 'kyB7FTexsOZ0b2p3' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 143 'QueryPaymentNotifications' test.out

#- 144 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'KrcwIcXMhGy83Xit' \
    --limit '2' \
    --offset '2' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 144 'QueryPaymentOrders' test.out

#- 145 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "oOLGCcg16DqwdQPQ", "currencyNamespace": "9HkSSV8e1MgTTLS2", "customParameters": {"FgarY903INGIyEfR": {}, "BEj7qms9AGQExPhg": {}, "r9gGfC0GjvpgJfuB": {}}, "description": "s1Vpqn47GVghTH2w", "extOrderNo": "ToOnq9U5lyW89Xwt", "extUserId": "3wmRTrDCjhnKvsHe", "itemType": "LOOTBOX", "language": "xK_642", "metadata": {"Hk6lWq6tEeUmU96F": "LEak0mJqjRYldcTp", "deCD9XPRi4bAQL7V": "E2wL8Y4JFVUdzA8b", "vXlDhG7BrorbKIKu": "OXJPm5ztrr09CDA8"}, "notifyUrl": "Ij5bGKSuopWQbaCv", "omitNotification": false, "platform": "hG9xmSnzd7zgUxAo", "price": 12, "recurringPaymentOrderNo": "JZ5z6gujpFzlPspQ", "region": "D9IRIpDDubntPCFx", "returnUrl": "feoW2NdSWzOXjO1N", "sandbox": false, "sku": "UqWHBW78XREZCiTN", "subscriptionId": "Axq26gZrPqCsSDsp", "targetNamespace": "vgM16sZ6rjnkH4Ex", "targetUserId": "ObppC6CMYDm5ge65", "title": "9UDEOF6gp5Ufmjti"}' \
    > test.out 2>&1
eval_tap $? 145 'CreatePaymentOrderByDedicated' test.out

#- 146 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'VbqJnZcrqrPye7fC' \
    > test.out 2>&1
eval_tap $? 146 'ListExtOrderNoByExtTxId' test.out

#- 147 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'wi7Il2wIFlHm9N6o' \
    > test.out 2>&1
eval_tap $? 147 'GetPaymentOrder' test.out

#- 148 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'wMHMtJy1Oqn59tEG' \
    --body '{"extTxId": "m9NYeUT5P0nx8TqS", "paymentMethod": "ZdZ5C8mFI9TnvzEq", "paymentProvider": "XSOLLA"}' \
    > test.out 2>&1
eval_tap $? 148 'ChargePaymentOrder' test.out

#- 149 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'uzUUwyI6Vtd4v9k4' \
    --body '{"description": "fv3kMiuQ3DhsKLxj"}' \
    > test.out 2>&1
eval_tap $? 149 'RefundPaymentOrderByDedicated' test.out

#- 150 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 't5srPFxBgpFtDBmT' \
    --body '{"amount": 78, "currencyCode": "IQF51c4MqJzDSvEL", "notifyType": "CHARGE", "paymentProvider": "CHECKOUT", "salesTax": 57, "vat": 72}' \
    > test.out 2>&1
eval_tap $? 150 'SimulatePaymentOrderNotification' test.out

#- 151 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'e6dboSdhkBzAzPkt' \
    > test.out 2>&1
eval_tap $? 151 'GetPaymentOrderChargeStatus' test.out

#- 152 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 152 'GetPlatformWalletConfig' test.out

#- 153 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    --body '{"allowedBalanceOrigins": ["Playstation", "System", "Xbox"]}' \
    > test.out 2>&1
eval_tap $? 153 'UpdatePlatformWalletConfig' test.out

#- 154 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    > test.out 2>&1
eval_tap $? 154 'ResetPlatformWalletConfig' test.out

#- 155 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 155 'GetRevocationConfig' test.out

#- 156 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "CUSTOM"}, "durable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}' \
    > test.out 2>&1
eval_tap $? 156 'UpdateRevocationConfig' test.out

#- 157 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 157 'DeleteRevocationConfig' test.out

#- 158 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'tHxDb06ZFy3uglSp' \
    --limit '65' \
    --offset '96' \
    --source 'OTHER' \
    --startTime 'xvF2uLXWilRD7HD6' \
    --status 'SUCCESS' \
    --transactionId 'LGgK8aVSCN6oCETQ' \
    --userId '8gIDRdD2wwMXwKVX' \
    > test.out 2>&1
eval_tap $? 158 'QueryRevocationHistories' test.out

#- 159 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'GetRevocationPluginConfig' test.out

#- 160 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "GPhEJsc7rZpxaPHc"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "r8eToFmkHJ6BPOKF"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateRevocationPluginConfig' test.out

#- 161 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 161 'DeleteRevocationPluginConfig' test.out

#- 162 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 162 'UploadRevocationPluginConfigCert' test.out

#- 163 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "xIwKssw647YwDudn", "eventTopic": "GRufOUGfMjTU226l", "maxAwarded": 60, "maxAwardedPerUser": 36, "namespaceExpression": "jPlcYaqYM7YfBmhj", "rewardCode": "I9Y28qVceS9UX48d", "rewardConditions": [{"condition": "KPCFUIeyYEymNXzN", "conditionName": "X6TGh4UdEweeBsJE", "eventName": "vBbAvCmlh6Z1oz9B", "rewardItems": [{"duration": 0, "endDate": "1982-03-07T00:00:00Z", "itemId": "MNOAzXmyHEV4g9P6", "quantity": 0}, {"duration": 60, "endDate": "1999-04-14T00:00:00Z", "itemId": "80S5RNB5dVCsB7xL", "quantity": 99}, {"duration": 0, "endDate": "1971-07-15T00:00:00Z", "itemId": "MOH47CAT7cBP0918", "quantity": 72}]}, {"condition": "wVtt3RVTl0tR00oQ", "conditionName": "gcHdGGK3x76U1EIc", "eventName": "klttmrpgF5szl0sM", "rewardItems": [{"duration": 53, "endDate": "1973-03-15T00:00:00Z", "itemId": "s36r1FgR70eNLHkV", "quantity": 35}, {"duration": 0, "endDate": "1986-04-02T00:00:00Z", "itemId": "Fd8xArWJuCAIfNBS", "quantity": 68}, {"duration": 51, "endDate": "1974-12-14T00:00:00Z", "itemId": "pFNw9K9pmAIc6VSf", "quantity": 63}]}, {"condition": "Nj3ktaDf9B22HGgx", "conditionName": "akPt7IYzaZUTmvsE", "eventName": "zLPnnGsnfmBerp84", "rewardItems": [{"duration": 34, "endDate": "1994-03-15T00:00:00Z", "itemId": "SDRIoMg7Dc5APzfz", "quantity": 39}, {"duration": 60, "endDate": "1990-09-08T00:00:00Z", "itemId": "PxK1os4qR8LaQzEb", "quantity": 100}, {"duration": 38, "endDate": "1986-07-22T00:00:00Z", "itemId": "TdFfC8x5aHLsXHlm", "quantity": 0}]}], "userIdExpression": "RJTTy9JrNz1K5M1q"}' \
    > test.out 2>&1
eval_tap $? 163 'CreateReward' test.out

#- 164 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'gFddYvifGHawNx6y' \
    --limit '15' \
    --offset '59' \
    --sortBy 'rewardCode:desc,namespace:asc' \
    > test.out 2>&1
eval_tap $? 164 'QueryRewards' test.out

#- 165 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 165 'ExportRewards' test.out

#- 166 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 166 'ImportRewards' test.out

#- 167 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'M69XKkLwioRaKnWh' \
    > test.out 2>&1
eval_tap $? 167 'GetReward' test.out

#- 168 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'lh80BhYe2fJDS6T7' \
    --body '{"description": "5Q4ulonMFjmYqE1w", "eventTopic": "JhfogWg2Apm0sUy1", "maxAwarded": 88, "maxAwardedPerUser": 1, "namespaceExpression": "BxMSdOOsn2Nd8Jpa", "rewardCode": "19GJDK46Eehx7xas", "rewardConditions": [{"condition": "qMY9aulsL6NOV5ag", "conditionName": "pS6A5mkufBpWVxIK", "eventName": "9D2bTcgaKoccaSwW", "rewardItems": [{"duration": 5, "endDate": "1994-04-07T00:00:00Z", "itemId": "uwWrCQt86Jrg8tLA", "quantity": 72}, {"duration": 15, "endDate": "1996-03-06T00:00:00Z", "itemId": "pcyNkUvqn6eXr6FN", "quantity": 3}, {"duration": 74, "endDate": "1996-10-17T00:00:00Z", "itemId": "1xsth28NZZgsXycu", "quantity": 88}]}, {"condition": "knXcSaVYcAYp7qSi", "conditionName": "DvsfMUOpWv46sXvp", "eventName": "OjrpRo4mYrCeQUnY", "rewardItems": [{"duration": 29, "endDate": "1978-10-15T00:00:00Z", "itemId": "IH1gBCWVFrvls0Zw", "quantity": 29}, {"duration": 37, "endDate": "1988-10-21T00:00:00Z", "itemId": "DOJ8TNiP8KgEAj3d", "quantity": 2}, {"duration": 6, "endDate": "1993-03-21T00:00:00Z", "itemId": "TI0i6dO3zkbDseh4", "quantity": 40}]}, {"condition": "xt6fX9j7rhZCAlDl", "conditionName": "VKBsLZiBRXszE7CL", "eventName": "1cQCSoqHvH7g63cO", "rewardItems": [{"duration": 47, "endDate": "1977-07-17T00:00:00Z", "itemId": "0pGzazM2BUXnzUEW", "quantity": 94}, {"duration": 17, "endDate": "1985-10-28T00:00:00Z", "itemId": "c4M2O7NrTQO7KLdZ", "quantity": 59}, {"duration": 66, "endDate": "1978-07-07T00:00:00Z", "itemId": "gE5gcfF8AMGZ2FBS", "quantity": 38}]}], "userIdExpression": "Mg6TKwdRMraDLrwh"}' \
    > test.out 2>&1
eval_tap $? 168 'UpdateReward' test.out

#- 169 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '3d0ykRGkgqUNIbJM' \
    > test.out 2>&1
eval_tap $? 169 'DeleteReward' test.out

#- 170 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'J9ABbKVWO2YEDiqk' \
    --body '{"payload": {"wKbpdk7wlDngNiPP": {}, "jpSAlZwFGpea5ObB": {}, "B49Km4ClIQmkIdLC": {}}}' \
    > test.out 2>&1
eval_tap $? 170 'CheckEventCondition' test.out

#- 171 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'vNhZ6P8aqZ2yfrC1' \
    --body '{"conditionName": "V7ZpJZPHCMqvcYme", "userId": "DLYEzs2SQUdKr6vg"}' \
    > test.out 2>&1
eval_tap $? 171 'DeleteRewardConditionRecord' test.out

#- 172 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'qkjycqclNlBORlC8' \
    --limit '65' \
    --offset '21' \
    --start 'zpFd6b5Jc5TETHcu' \
    --storeId 'p8GG0VCMTFJ6svTy' \
    --viewId 'o9RHget5hzB52BDF' \
    > test.out 2>&1
eval_tap $? 172 'QuerySections' test.out

#- 173 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'opxUwkMuSqQnKzDg' \
    --body '{"active": true, "displayOrder": 5, "endDate": "1984-06-05T00:00:00Z", "ext": {"NvgTSgKjCxZjKf8N": {}, "A4cGUaDfy9XnH2r0": {}, "EKrk5VlnKsWCPccA": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 28, "itemCount": 60, "rule": "SEQUENCE"}, "items": [{"id": "25fp1egsx3ErheNw", "sku": "qd5priclNNqLyrlz"}, {"id": "rJ4QHbfnAdtkujxH", "sku": "ff7n1yaNCcjgFhS0"}, {"id": "URBhl0L5FCbOn46W", "sku": "2B2uPQLrt2t6bVpC"}], "localizations": {"gKvPXSDufmKh783c": {"description": "V54JsVBRB0rY0xfW", "localExt": {"ddACyHSmo4KX9TPO": {}, "3K1k5ZM8btmGsgXN": {}, "Xbpqxh76Af5JSwjw": {}}, "longDescription": "2fE2g6jXV7oai2oD", "title": "m9FaP0HJ98tE4Uyo"}, "Qg0b0sGOkzxVt15L": {"description": "KmkQ7YBhsOuJ0ypk", "localExt": {"kt2G4eFh2YNsdoxp": {}, "LTBM9Q8t829Ido1J": {}, "yveSRiBq23kyH9jQ": {}}, "longDescription": "bHWkcVk0X28GS54v", "title": "l7gIKBc7OYTylFRA"}, "JKySnC0cfPl3Z2zS": {"description": "Bbs4PAV72u8AxE2I", "localExt": {"QeoxYV4UcYzswAGp": {}, "XqQxctuVaqPJGAHE": {}, "ZmuQrZ8GaQ4OZ2nD": {}}, "longDescription": "odm4TNs8mAj6IKSY", "title": "FdJwgZsRPOzwuDSd"}}, "name": "Gl1A2vaNeDiSqTfm", "rotationType": "FIXED_PERIOD", "startDate": "1979-01-30T00:00:00Z", "viewId": "g50kOdJagEmTuaxl"}' \
    > test.out 2>&1
eval_tap $? 173 'CreateSection' test.out

#- 174 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xgywkbdOsyxX1tfW' \
    > test.out 2>&1
eval_tap $? 174 'PurgeExpiredSection' test.out

#- 175 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '488oYUT4jyCVJ0V8' \
    --storeId 'obTlGVThz4bm41oI' \
    > test.out 2>&1
eval_tap $? 175 'GetSection' test.out

#- 176 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'cV33yjPxibDjfF7J' \
    --storeId 'kjCVpZKMxkFkBtXM' \
    --body '{"active": false, "displayOrder": 89, "endDate": "1978-10-15T00:00:00Z", "ext": {"OpPTVxEgBFzG8tlk": {}, "xWKCU1XN4gl7yHvE": {}, "qpJSrDXVwCkhOQ16": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 65, "itemCount": 89, "rule": "SEQUENCE"}, "items": [{"id": "yV19cborUHeCpqnZ", "sku": "5NW623WWn2ZJY3Qv"}, {"id": "Ra7CDRTcsAHzD3dZ", "sku": "yyWbUQpbcv3IwmL7"}, {"id": "a1K3zIUYJmdF1YtW", "sku": "NSQlcMzxfppNCrsc"}], "localizations": {"DPbklTHcmgXsrVj3": {"description": "Mjml6BpCODWGOLMm", "localExt": {"CZUeelXYyNrXweiC": {}, "nDldRPRfd6mLZ0GT": {}, "JwEjoZrRtaeWKMC8": {}}, "longDescription": "wsOByQAMAgqFEzEt", "title": "8umj5XhKnw7MHDwF"}, "VKUC2ecnpUDqvLQi": {"description": "xPKVSmWa8TGko16X", "localExt": {"TqHc0cM7ixq8Tjnx": {}, "p5Cl8ggaEmCcuK2h": {}, "HviBEWpbusO6EyVq": {}}, "longDescription": "stpgZpbz77y88rUF", "title": "um2ZcA8iKcF0bkfj"}, "cTEFXcTwEtnHxP5p": {"description": "VtN4jNVIdruEA39u", "localExt": {"CJzsE8WObt6t0w8L": {}, "OBxE15JYj4IqWK09": {}, "l4wkrzahXR1sDEDV": {}}, "longDescription": "KDINE3HjCiVR1dQ8", "title": "kuhb4pUwnGptHUpl"}}, "name": "xzaDa9PDwhu31d8e", "rotationType": "NONE", "startDate": "1986-01-26T00:00:00Z", "viewId": "uBbeuQqm9wM7mgTt"}' \
    > test.out 2>&1
eval_tap $? 176 'UpdateSection' test.out

#- 177 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'UdPVcQijMBhs0kDP' \
    --storeId '6d3nuUZ41mSeS9Sn' \
    > test.out 2>&1
eval_tap $? 177 'DeleteSection' test.out

#- 178 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 178 'ListStores' test.out

#- 179 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "GqhJOvykBcDpzD9z", "defaultRegion": "h6dtPK4fVHLMvrCs", "description": "H3RYxH2Up9VthPjF", "supportedLanguages": ["rK7Hip0eONFDgUPS", "hG8wwFKY9AMpcwJd", "4SrigIxAhbFMZfxa"], "supportedRegions": ["znlDQbzTiFrQB1yU", "onirH4URx3NkKQBY", "rlUaMiFEWUT8cAFO"], "title": "5zEw8GENEJYPKxxO"}' \
    > test.out 2>&1
eval_tap $? 179 'CreateStore' test.out

#- 180 ImportStore
eval_tap 0 180 'ImportStore # SKIP deprecated' test.out

#- 181 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 181 'GetPublishedStore' test.out

#- 182 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 182 'DeletePublishedStore' test.out

#- 183 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 183 'GetPublishedStoreBackup' test.out

#- 184 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 184 'RollbackPublishedStore' test.out

#- 185 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'w7xNQ98IEbc9YITN' \
    > test.out 2>&1
eval_tap $? 185 'GetStore' test.out

#- 186 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '98j4P2AGeidXRRnI' \
    --body '{"defaultLanguage": "AJfKVjOn6rtILNJV", "defaultRegion": "v2DLLUyBt5hDs45s", "description": "iG30Lv9iGa5mkZjn", "supportedLanguages": ["RXVcg6AByNpBo2JY", "kwLdmR97u9MVUii4", "KpYcb1AUsESaBOTH"], "supportedRegions": ["nbX9tC9PQlFAGbMt", "EybfcAl0mnsAkRT2", "k0AzdgIunRkTxsGd"], "title": "rpNELM8Lfkut0wnT"}' \
    > test.out 2>&1
eval_tap $? 186 'UpdateStore' test.out

#- 187 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '24wh59RGSbBMh7jp' \
    > test.out 2>&1
eval_tap $? 187 'DeleteStore' test.out

#- 188 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'szuVk6iPdJ2boQqC' \
    --action 'DELETE' \
    --itemSku 'Dg4FcDwBGyBiHewZ' \
    --itemType 'CODE' \
    --limit '79' \
    --offset '46' \
    --selected  \
    --sortBy 'createdAt,updatedAt,createdAt:asc' \
    --status 'UNPUBLISHED' \
    --type 'VIEW' \
    --updatedAtEnd 'zBBRSknxyWkZObuv' \
    --updatedAtStart 'ig8sMuss76ezTrsD' \
    > test.out 2>&1
eval_tap $? 188 'QueryChanges' test.out

#- 189 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZNYUV48Oh6I45X7H' \
    > test.out 2>&1
eval_tap $? 189 'PublishAll' test.out

#- 190 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vUtPYONZdFk75lkj' \
    > test.out 2>&1
eval_tap $? 190 'PublishSelected' test.out

#- 191 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QNHrjaboGomguUqe' \
    > test.out 2>&1
eval_tap $? 191 'SelectAllRecords' test.out

#- 192 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uZh5qtrRbNnGejdT' \
    --action 'UPDATE' \
    --itemSku 'inL8fBFP1ABaIKrE' \
    --itemType 'EXTENSION' \
    --type 'STORE' \
    --updatedAtEnd '8d3o7cTS9OIIMErn' \
    --updatedAtStart 'NTLXHrsOFsbhRow4' \
    > test.out 2>&1
eval_tap $? 192 'GetStatistic' test.out

#- 193 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iaYKy0IjsDgbJ37D' \
    > test.out 2>&1
eval_tap $? 193 'UnselectAllRecords' test.out

#- 194 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'N2lDvdh7okHl1wMh' \
    --namespace "$AB_NAMESPACE" \
    --storeId 't2Izq7TCUJhDsDef' \
    > test.out 2>&1
eval_tap $? 194 'SelectRecord' test.out

#- 195 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'AS09VyQB1vR1mx6K' \
    --namespace "$AB_NAMESPACE" \
    --storeId '17GL1CrO4ZuoGZSx' \
    > test.out 2>&1
eval_tap $? 195 'UnselectRecord' test.out

#- 196 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Tzm8oMSPIHPtqzIW' \
    --targetStoreId 'Izg8pbjnt1iBV8Dp' \
    > test.out 2>&1
eval_tap $? 196 'CloneStore' test.out

#- 197 ExportStore
eval_tap 0 197 'ExportStore # SKIP deprecated' test.out

#- 198 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGED' \
    --itemId 'QB96ndlO6iPGC9Rh' \
    --limit '52' \
    --offset '33' \
    --sku 'MC7V8BEphnRXnSpC' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    --userId 'yb8FkoxQbrPngi87' \
    > test.out 2>&1
eval_tap $? 198 'QuerySubscriptions' test.out

#- 199 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'K58pQswqKLutINus' \
    > test.out 2>&1
eval_tap $? 199 'RecurringChargeSubscription' test.out

#- 200 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'Osa92F6iwkJIYOLa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 200 'GetTicketDynamic' test.out

#- 201 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'rmpWyvib9CDW21AN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "rlpuXD9H1u1CvzWP"}' \
    > test.out 2>&1
eval_tap $? 201 'DecreaseTicketSale' test.out

#- 202 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'cZwkj1l6bf2F9EXO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 202 'GetTicketBoothID' test.out

#- 203 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'Bj7v8LHYivmD0eky' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 6, "orderNo": "hppgxJhk4EdTZ000"}' \
    > test.out 2>&1
eval_tap $? 203 'IncreaseTicketSale' test.out

#- 204 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'rS92594HLvWFsXHt' \
    --body '{"achievements": [{"id": "MP0k9L5dREQbCqfh", "value": 38}, {"id": "gpABFBER6WNcDOsR", "value": 51}, {"id": "o5DSozCuFsrBMtoO", "value": 10}], "steamUserId": "cvszzQLZBktk0siM"}' \
    > test.out 2>&1
eval_tap $? 204 'UnlockSteamUserAchievement' test.out

#- 205 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'up01kyaFwwD7wecu' \
    --xboxUserId 'Qb4GNQHVZMKGBnzh' \
    > test.out 2>&1
eval_tap $? 205 'GetXblUserAchievements' test.out

#- 206 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '4suaGIzttTncVBf5' \
    --body '{"achievements": [{"id": "g3oeuHiNyLkfPQPm", "percentComplete": 19}, {"id": "ufkDFLYyNBPlMrks", "percentComplete": 9}, {"id": "HlrIfMAvvpkAHRJH", "percentComplete": 95}], "serviceConfigId": "yfrXZmiJX4CjKCeI", "titleId": "RIr997KKpJXTLbYW", "xboxUserId": "pqeXjaf1f5fjNMZj"}' \
    > test.out 2>&1
eval_tap $? 206 'UpdateXblUserAchievement' test.out

#- 207 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'KJ05puX3197WrMnJ' \
    > test.out 2>&1
eval_tap $? 207 'AnonymizeCampaign' test.out

#- 208 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'tovSMFw8X4zxbdfX' \
    > test.out 2>&1
eval_tap $? 208 'AnonymizeEntitlement' test.out

#- 209 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'gunt1oMNZ68eovHS' \
    > test.out 2>&1
eval_tap $? 209 'AnonymizeFulfillment' test.out

#- 210 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'H3xV3URIRVDYBd6h' \
    > test.out 2>&1
eval_tap $? 210 'AnonymizeIntegration' test.out

#- 211 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'MB0l7sg7IfMH5Tu1' \
    > test.out 2>&1
eval_tap $? 211 'AnonymizeOrder' test.out

#- 212 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'ky1ZYvyeHmfoFkUD' \
    > test.out 2>&1
eval_tap $? 212 'AnonymizePayment' test.out

#- 213 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'P864shbnQ3bVvuvp' \
    > test.out 2>&1
eval_tap $? 213 'AnonymizeRevocation' test.out

#- 214 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'sDJXPCWkX4Kpi8CJ' \
    > test.out 2>&1
eval_tap $? 214 'AnonymizeSubscription' test.out

#- 215 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId '88aMPGFFAQZbfbmV' \
    > test.out 2>&1
eval_tap $? 215 'AnonymizeWallet' test.out

#- 216 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'TEbiRq5Juikmpat7' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 216 'GetUserDLCByPlatform' test.out

#- 217 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'rVbN9ZBtzJ33tCwv' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 217 'GetUserDLC' test.out

#- 218 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'H1f451FVZ630HNBY' \
    --activeOnly  \
    --appType 'GAME' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'eMjMzguq6HFIqaqw' \
    --features 'H9J6JLb5f3SBMyJU,dwEBRrHAWUFqTooG,GnPEgY0t7QQWl42b' \
    --itemId 'yOwXgKyPhXmcysae,8HpWH4xiz3fWthJS,u2pUIIuPLFAtcWhj' \
    --limit '54' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 218 'QueryUserEntitlements' test.out

#- 219 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'P57QbWvSSp71zEPP' \
    --body '[{"endDate": "1973-04-08T00:00:00Z", "grantedCode": "mAQiqRRC2caquMRt", "itemId": "QOILcaDqUITBHQR5", "itemNamespace": "ISNoFR3GUxdMuvmL", "language": "vL_XMZa", "quantity": 100, "region": "aeP3Wd0Wrb8s3GW0", "source": "REFERRAL_BONUS", "startDate": "1985-08-06T00:00:00Z", "storeId": "0vAfbq8xoCurq4lp"}, {"endDate": "1988-05-08T00:00:00Z", "grantedCode": "rbVBh60NUA2aKQwn", "itemId": "Xrmi6ya8u4sQPvaf", "itemNamespace": "1AcweR7tJW3MLMob", "language": "HI", "quantity": 71, "region": "FIMyF7CcNu2DYn6E", "source": "REWARD", "startDate": "1987-03-24T00:00:00Z", "storeId": "KxdlAUDFQuGPzAuT"}, {"endDate": "1995-11-06T00:00:00Z", "grantedCode": "JvERxNg8djSb4Vt2", "itemId": "vKQ5vlCdI519Pf2i", "itemNamespace": "ogwxM5DZM0dgozmc", "language": "cr-DNcs", "quantity": 13, "region": "ePkqg6Zt1Lr5BlO8", "source": "REWARD", "startDate": "1990-06-12T00:00:00Z", "storeId": "H4dSaa8XYHug51ZT"}]' \
    > test.out 2>&1
eval_tap $? 219 'GrantUserEntitlement' test.out

#- 220 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ogG0N7Hvnuq1kJ1k' \
    --activeOnly  \
    --appId 'pHcQtnIc9z70LFQM' \
    > test.out 2>&1
eval_tap $? 220 'GetUserAppEntitlementByAppId' test.out

#- 221 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'I0oZuEjY0rNBbbB9' \
    --activeOnly  \
    --limit '39' \
    --offset '53' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 221 'QueryUserEntitlementsByAppType' test.out

#- 222 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'TMBY7Xd0OoENg2Lw' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --itemId 'uepmahXojVZYz2zM' \
    > test.out 2>&1
eval_tap $? 222 'GetUserEntitlementByItemId' test.out

#- 223 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'U9jLzNV3GaG43R6n' \
    --ids 'lRPrEAYqRBeSc5uS,hoj3dGHMeoi5DBOs,Q0Gax0iX05IT9Ags' \
    > test.out 2>&1
eval_tap $? 223 'GetUserActiveEntitlementsByItemIds' test.out

#- 224 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'jl5NmnSHhxNmCe4t' \
    --activeOnly  \
    --entitlementClazz 'LOOTBOX' \
    --sku 'lX6HYVEiaereFCPJ' \
    > test.out 2>&1
eval_tap $? 224 'GetUserEntitlementBySku' test.out

#- 225 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'U2wEzUYUTmZ8JSMe' \
    --appIds 'NmRocp400RZe8Bzx,9aGEI22BTCZs97TJ,I8GPrM24F3celFgM' \
    --itemIds '62HQtgzQhO3nR8j8,DlP6OGbn8vmfMYGL,t1AjKhh3JMX7xSrz' \
    --skus '1EH6X2SM3xzsNrJz,WBcdFlo7oAsOlfLB,1J19b5rTfiL2P3r1' \
    > test.out 2>&1
eval_tap $? 225 'ExistsAnyUserActiveEntitlement' test.out

#- 226 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'a8KIJH33aKkPuWD5' \
    --itemIds '9MgTy1HA58Jt5NaR,OjSKFEuZo2ElXYSS,4ezBRSiOyReviDax' \
    > test.out 2>&1
eval_tap $? 226 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 227 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'lPdhwmcH03yoMxzR' \
    --appId 'R6xd9rTh3ureaIbx' \
    > test.out 2>&1
eval_tap $? 227 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 228 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'M3Wev9pZQjWAN0tn' \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'beVQvgeP9qOHaLwY' \
    > test.out 2>&1
eval_tap $? 228 'GetUserEntitlementOwnershipByItemId' test.out

#- 229 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'nXxrz7sLmP70LxN0' \
    --ids 'f3JA27Qz5SjzQfOL,Yu9O46OOzz9p57qS,pHerzO87cg7TqtMi' \
    > test.out 2>&1
eval_tap $? 229 'GetUserEntitlementOwnershipByItemIds' test.out

#- 230 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qgi7Aj28qCRbwwZc' \
    --entitlementClazz 'APP' \
    --sku 'ZS1NMkrnHs1Iyhwq' \
    > test.out 2>&1
eval_tap $? 230 'GetUserEntitlementOwnershipBySku' test.out

#- 231 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'k140MolIrnlkRVbc' \
    > test.out 2>&1
eval_tap $? 231 'RevokeAllEntitlements' test.out

#- 232 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'X435TDYpkk2Gza6D' \
    --entitlementIds 'rSycophHw3EoEECl' \
    > test.out 2>&1
eval_tap $? 232 'RevokeUserEntitlements' test.out

#- 233 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'TO9SDKnMlnKW9jiN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mu9QVrMeD4bD8gIS' \
    > test.out 2>&1
eval_tap $? 233 'GetUserEntitlement' test.out

#- 234 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'E34yIAZQeigiA3wB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rmBYIlZeheP72AB8' \
    --body '{"endDate": "1986-03-05T00:00:00Z", "nullFieldList": ["O3YrlyrWowUpUDVL", "lTtuJJsHZVsG6izJ", "ZruOJvSRFLDSdj8e"], "startDate": "1976-01-11T00:00:00Z", "status": "INACTIVE", "useCount": 41}' \
    > test.out 2>&1
eval_tap $? 234 'UpdateUserEntitlement' test.out

#- 235 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'bhfIMStMnSqrKWYO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uITlYS2RYaD9WNKG' \
    --body '{"options": ["hbLhjz1v0RBIO2rk", "JGmPaK6HEVIQJd39", "30TGewjRyfo4nWVZ"], "requestId": "ZbKFsKOmgEhjH2wF", "useCount": 53}' \
    > test.out 2>&1
eval_tap $? 235 'ConsumeUserEntitlement' test.out

#- 236 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId '6iQyr5cb5YL6fwBi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aVPmmn0T5uzlmi2N' \
    > test.out 2>&1
eval_tap $? 236 'DisableUserEntitlement' test.out

#- 237 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'Y26xrkPPdg3pXjmt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pNfCrIj9ntYo3dup' \
    > test.out 2>&1
eval_tap $? 237 'EnableUserEntitlement' test.out

#- 238 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'UHNu8abrVVOKxr9P' \
    --namespace "$AB_NAMESPACE" \
    --userId 'a315FKDjG2ApSV94' \
    > test.out 2>&1
eval_tap $? 238 'GetUserEntitlementHistories' test.out

#- 239 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'Jy6yCSXBqJqjAbVw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Saoj1ugjr8mPkr3t' \
    > test.out 2>&1
eval_tap $? 239 'RevokeUserEntitlement' test.out

#- 240 RevokeUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUseCount \
    --entitlementId 'Z506ERSVy5M3rrkx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'u0U9h9gCNVZxHGxh' \
    --body '{"reason": "ZqNXJ6JXSh0Z3SWI", "useCount": 92}' \
    > test.out 2>&1
eval_tap $? 240 'RevokeUseCount' test.out

#- 241 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'DNHto74GcmVf0fbC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'U9QdPuWeMEeL0EJG' \
    --body '{"requestId": "67g4W1eAmDxP23qs", "useCount": 41}' \
    > test.out 2>&1
eval_tap $? 241 'SellUserEntitlement' test.out

#- 242 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '8fFa30pVbhr1BHh1' \
    --body '{"duration": 1, "endDate": "1995-05-24T00:00:00Z", "itemId": "m3V9sirE0JOQxWeH", "itemSku": "ypqCWMDPRI2cCk8z", "language": "HR8VyCC0EQwE0cXo", "metadata": {"kXbwKDtVmrYQu7hZ": {}, "vHfiT9s9pK8HuUY1": {}, "QQHQ0NCEddJtx6GV": {}}, "order": {"currency": {"currencyCode": "01vD7lNLxlpvqaB9", "currencySymbol": "P9GaukfCEIeSBLhT", "currencyType": "REAL", "decimals": 9, "namespace": "zigzHcRuJgYaj4I8"}, "ext": {"Dzyh1N0JEKNoMtHv": {}, "jM7X1fjzknv2HZMI": {}, "L2P2bh14LroFTnAu": {}}, "free": true}, "orderNo": "H2YR6QU7fj6w17ar", "origin": "Xbox", "quantity": 92, "region": "s12hOoLVM7UFnuJD", "source": "REFERRAL_BONUS", "startDate": "1974-02-07T00:00:00Z", "storeId": "gU56xtyJtnbTDXu7"}' \
    > test.out 2>&1
eval_tap $? 242 'FulfillItem' test.out

#- 243 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'FbleSP5PcdOuq0m0' \
    --body '{"code": "rvakR8rcwojLRjhc", "language": "kO", "region": "FK6gB6ZxC6yYUVUJ"}' \
    > test.out 2>&1
eval_tap $? 243 'RedeemCode' test.out

#- 244 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'YnQ3jOGmROIqxqQ0' \
    --body '{"metadata": {"gcNeTflyvUh3w5Zt": {}, "fwmOCKpFSMF0tfGI": {}, "ZCTNiIRc9fEjkZhE": {}}, "origin": "Nintendo", "rewards": [{"currency": {"currencyCode": "T3t99HmcxzjDhTrc", "namespace": "BKtU956hOg8oukDV"}, "item": {"itemId": "dweG0sFHxTHa2k60", "itemSku": "SzCqUgq1gLbcIMev", "itemType": "TmC631p7q794bu49"}, "quantity": 23, "type": "CURRENCY"}, {"currency": {"currencyCode": "FTtERAXT2h3hcQ2w", "namespace": "V3ZbBTnNQnVUhA5W"}, "item": {"itemId": "nzVZdj8tsyzC4QaL", "itemSku": "Xp3o4TDraEEaDNJb", "itemType": "Vd20FVHevCjthJUb"}, "quantity": 13, "type": "CURRENCY"}, {"currency": {"currencyCode": "yvjacKtGqxMnoAXR", "namespace": "lcq0mYWKQYlqMmu2"}, "item": {"itemId": "pvF6rP03bQaq1cT8", "itemSku": "8H6RCW8gJmGzDlqx", "itemType": "tLsR2AGOiPhNt2Id"}, "quantity": 68, "type": "CURRENCY"}], "source": "SELL_BACK", "transactionId": "YUT6mma833TDzk66"}' \
    > test.out 2>&1
eval_tap $? 244 'FulfillRewards' test.out

#- 245 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'ix88sAUrXr7MXxCv' \
    --endTime 'yy7caxz4MQrODLNl' \
    --limit '47' \
    --offset '18' \
    --productId 'X5KjdNrEwfWo2Mwu' \
    --startTime 'lLg4bsO4YHEYLjTS' \
    --status 'VERIFIED' \
    --type 'TWITCH' \
    > test.out 2>&1
eval_tap $? 245 'QueryUserIAPOrders' test.out

#- 246 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'x4rV4CXVMrDYKe2e' \
    > test.out 2>&1
eval_tap $? 246 'QueryAllUserIAPOrders' test.out

#- 247 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tf1axo16GqT2vSLL' \
    --endTime 'iMvcu39YZJypWzpN' \
    --limit '92' \
    --offset '13' \
    --startTime 'UbOZ9WNl3apJmNAb' \
    --status 'FAIL' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 247 'QueryUserIAPConsumeHistory' test.out

#- 248 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '0vflFMxIhlIT8Agy' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "faou", "productId": "bzOrTn2huwPgyUzB", "region": "UWiKoNGtvyk5xEfr", "transactionId": "JDxKsw5Xl7ZZrDZd", "type": "APPLE"}' \
    > test.out 2>&1
eval_tap $? 248 'MockFulfillIAPItem' test.out

#- 249 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'nRhDd9TGkO6aIYqf' \
    --itemId 'tw1SrM2nhSEanfUY' \
    --limit '37' \
    --offset '36' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 249 'QueryUserOrders' test.out

#- 250 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'FQP6rW62CtetBW3p' \
    --body '{"currencyCode": "vAJJieHhveGg97PY", "currencyNamespace": "0txzvYwv7atn9EQv", "discountedPrice": 96, "ext": {"Oj8TFNeGtJGjKbMg": {}, "CeuAYuzrmbWofEaK": {}, "StqdKu4ROnONpJ84": {}}, "itemId": "9chqeiUGQMwNwDlY", "language": "Sli3p8YaAdel3hHM", "options": {"skipPriceValidation": true}, "platform": "Playstation", "price": 16, "quantity": 93, "region": "scGRWzkCl1ZKuPxj", "returnUrl": "DUGRGcCEPjbUy7F8", "sandbox": true, "sectionId": "Adu9BYRHrVTehrqg"}' \
    > test.out 2>&1
eval_tap $? 250 'AdminCreateUserOrder' test.out

#- 251 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'vEtEs2LpE0qfbvdU' \
    --itemId '8hlDoC9FnxqBlPBY' \
    > test.out 2>&1
eval_tap $? 251 'CountOfPurchasedItem' test.out

#- 252 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'J7X6uVy7FWTSfMi2' \
    --userId 'CPVGxjcdpdCqVeeP' \
    > test.out 2>&1
eval_tap $? 252 'GetUserOrder' test.out

#- 253 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'MSqb8y8qJTUQY40Z' \
    --userId 'rpn0vAD9YsPeDWrA' \
    --body '{"status": "CHARGED", "statusReason": "ZSvgWuCuLsUGrVQA"}' \
    > test.out 2>&1
eval_tap $? 253 'UpdateUserOrderStatus' test.out

#- 254 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bhS54ZuQHKersDmJ' \
    --userId 'LUHAKtfXCKOna8Dd' \
    > test.out 2>&1
eval_tap $? 254 'FulfillUserOrder' test.out

#- 255 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'jtZhh6ofsUoRh6r0' \
    --userId 'e0J6vyqPw7YlmV3k' \
    > test.out 2>&1
eval_tap $? 255 'GetUserOrderGrant' test.out

#- 256 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ES0Hi88UYgSV40Ov' \
    --userId 'Y7apPCrN5bEhmuHg' \
    > test.out 2>&1
eval_tap $? 256 'GetUserOrderHistories' test.out

#- 257 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'KeWizEpw1zN0mOYg' \
    --userId 'GhHMz9dddLWJWDuS' \
    --body '{"additionalData": {"cardSummary": "YtCaIv4Lp91wYUJP"}, "authorisedTime": "1971-07-28T00:00:00Z", "chargebackReversedTime": "1982-04-23T00:00:00Z", "chargebackTime": "1984-04-18T00:00:00Z", "chargedTime": "1990-02-02T00:00:00Z", "createdTime": "1997-04-23T00:00:00Z", "currency": {"currencyCode": "neohqhCzroAzWQDv", "currencySymbol": "e0Z2G2N09VIbbsz2", "currencyType": "REAL", "decimals": 11, "namespace": "PGUbSaA00nKxQjYU"}, "customParameters": {"6KlavIiLxU2I1GyJ": {}, "S48Hxu8Ju4XSAnlX": {}, "RYB9BgSZBvkehRn8": {}}, "extOrderNo": "3B0nrW1qx3NJTugV", "extTxId": "WXz8dv7BiEUqnzxs", "extUserId": "2deMF8UAJIHEZv5z", "issuedAt": "1983-01-06T00:00:00Z", "metadata": {"yNJkvA5xF3zHtZSd": "3QzXhkrN4pWryt4X", "TNwpp0ni1YfIgLZ4": "YIzElrLZOBLHCKmL", "BaIwlokbAFW8RgBU": "wBL28BqM8UzvKqeo"}, "namespace": "TiNKGRUMrimGAz6O", "nonceStr": "hmHOpCdr3WzDm3hJ", "paymentMethod": "dd6uaO9TiTPnIh2i", "paymentMethodFee": 0, "paymentOrderNo": "xpGhsFArq6lolbj7", "paymentProvider": "WALLET", "paymentProviderFee": 24, "paymentStationUrl": "tVRCPMjr5M3vw1Gq", "price": 96, "refundedTime": "1976-05-09T00:00:00Z", "salesTax": 19, "sandbox": false, "sku": "Fp6R8mYZwKftVqSE", "status": "INIT", "statusReason": "2hiPuDdOPHcN9drw", "subscriptionId": "qytieXpIZfr5XDq9", "subtotalPrice": 7, "targetNamespace": "iKd9vLPP0w52JRAZ", "targetUserId": "xMWdoleYNHXeOpaR", "tax": 60, "totalPrice": 45, "totalTax": 99, "txEndTime": "1996-10-31T00:00:00Z", "type": "uE5cYVP9tQSa27Bn", "userId": "Pyq3I1BLtGEZDRNk", "vat": 20}' \
    > test.out 2>&1
eval_tap $? 257 'ProcessUserOrderNotification' test.out

#- 258 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Y5PeNr4JmYxH2qs2' \
    --userId '8hePJjMp0TKKUBfP' \
    > test.out 2>&1
eval_tap $? 258 'DownloadUserOrderReceipt' test.out

#- 259 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'NI9f2oLWDPSZexfK' \
    --body '{"currencyCode": "Vxqdxmh5QWxuQuI7", "currencyNamespace": "gdDTDb3WdnOpzTrR", "customParameters": {"zCCafADJfWBspT3M": {}, "LwJZquMQSPp5XD4S": {}, "1ilfgff7Et4uY8nl": {}}, "description": "BwGNHgfgwZwVMvsh", "extOrderNo": "Gmsg6ZJYnkHDnHTl", "extUserId": "RugM7a2UZgeesipb", "itemType": "SUBSCRIPTION", "language": "ynO_756", "metadata": {"pS861c0CJ7LzpFvO": "SF6xKA6yrnvXY5dD", "wneac75C6S2eHsH4": "Y84hL75QboMHCtzE", "F9FSeg6WYgtfuqJH": "rs4e3RnWR30MdBZe"}, "notifyUrl": "zfwc3H0qSbMq4GLj", "omitNotification": false, "platform": "aGsH0qE5p601ak59", "price": 50, "recurringPaymentOrderNo": "IFEcS0ynIMOYWpUY", "region": "UQMooiKT57rmbjEn", "returnUrl": "imeR7EFBz43E9FkO", "sandbox": true, "sku": "qvfDG5jvMOaXrDlE", "subscriptionId": "X42U0syrGNhBmgT2", "title": "q0kIbrJ2S5Pf1Lvg"}' \
    > test.out 2>&1
eval_tap $? 259 'CreateUserPaymentOrder' test.out

#- 260 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '8kYEVylINJpxFY8E' \
    --userId '6pU8eHjh0aTjIOaQ' \
    --body '{"description": "t0snbE0yMvqF7TJ9"}' \
    > test.out 2>&1
eval_tap $? 260 'RefundUserPaymentOrder' test.out

#- 261 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'uB0zypjJiu7BIimN' \
    --body '{"code": "uwB3hBVhuSMHhf5R", "orderNo": "2MkxQTAYGfE6hXZ7"}' \
    > test.out 2>&1
eval_tap $? 261 'ApplyUserRedemption' test.out

#- 262 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'XLoWCGf0dZEeXBd6' \
    --body '{"meta": {"mGG6SHcZbX2wNnT6": {}, "A9zosmDnXoncy7NZ": {}, "Q4PkAPXBCfkE1Fb0": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Playstation", "currencyCode": "KzHnngdfFnOfY9st", "namespace": "XH6LYXXMndxBPKmH"}, "entitlement": {"entitlementId": "VB7cNzHhvxc4xAPZ"}, "item": {"itemIdentity": "86WNnQOhusPn4466", "itemIdentityType": "ITEM_SKU", "origin": "Playstation"}, "quantity": 38, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "qEFXUhGAwpYq1UqZ", "namespace": "ydOB0MThZW6LwcAg"}, "entitlement": {"entitlementId": "57BYBVCbi0ifdPyK"}, "item": {"itemIdentity": "f3SwHekWIz4rXlH5", "itemIdentityType": "ITEM_ID", "origin": "Other"}, "quantity": 63, "type": "ITEM"}, {"currency": {"balanceOrigin": "Epic", "currencyCode": "xCjXWcaXBcfXXeV7", "namespace": "BXefsSgZxSYnVwXq"}, "entitlement": {"entitlementId": "F6K0WA76Kl2mHHoz"}, "item": {"itemIdentity": "6qBQnEDgX49n1xTD", "itemIdentityType": "ITEM_ID", "origin": "Epic"}, "quantity": 70, "type": "CURRENCY"}], "source": "DLC", "transactionId": "Om1sqdIWU6ERylES"}' \
    > test.out 2>&1
eval_tap $? 262 'DoRevocation' test.out

#- 263 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'gf5dXMrPoYSohfrL' \
    --body '{"gameSessionId": "yXMSrC62xYtDwflN", "payload": {"GfufW5cWeg6eSCyp": {}, "sceITTkJGGCVF6Lr": {}, "ILDLviUCzmDAaW5x": {}}, "scid": "z1c7ZuZXUCBYnkY0", "sessionTemplateName": "LEBSYBdUSiTOrhB8"}' \
    > test.out 2>&1
eval_tap $? 263 'RegisterXblSessions' test.out

#- 264 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'hVs29WOKmZRTtgyc' \
    --chargeStatus 'SETUP' \
    --itemId 'CCGBXv4fP4VPzhcH' \
    --limit '30' \
    --offset '97' \
    --sku '2ZnL1Zg2JfH4f73j' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 264 'QueryUserSubscriptions' test.out

#- 265 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'JYzSCIDxWUxgOzeR' \
    --excludeSystem  \
    --limit '80' \
    --offset '63' \
    --subscriptionId 'HIqK5PT404mFw4HJ' \
    > test.out 2>&1
eval_tap $? 265 'GetUserSubscriptionActivities' test.out

#- 266 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'v5T2kIQOecfLsYKT' \
    --body '{"grantDays": 25, "itemId": "JE3uqZz574g31cA0", "language": "PwZxTIZVSGQyTzhs", "reason": "9Asy4d629N4YnolV", "region": "WA2dWxBs056jkPCU", "source": "uE1pgdHvlQKiR7SD"}' \
    > test.out 2>&1
eval_tap $? 266 'PlatformSubscribeSubscription' test.out

#- 267 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'QUDavOlKT5EIHNhJ' \
    --itemId 'Qq94Re5IM1akNKz9' \
    > test.out 2>&1
eval_tap $? 267 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 268 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'IltQUku3n32atB0Q' \
    --userId 'PQPEp5UtwUWGt6to' \
    > test.out 2>&1
eval_tap $? 268 'GetUserSubscription' test.out

#- 269 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'oHP5kAww01zalTdd' \
    --userId 'hAQ1pwqnybvUIfuu' \
    > test.out 2>&1
eval_tap $? 269 'DeleteUserSubscription' test.out

#- 270 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'lmeegRwPPbn7lttd' \
    --userId '21cS6IVE4fzwG3BH' \
    --force  \
    --body '{"immediate": false, "reason": "t753XQB93rOW0guP"}' \
    > test.out 2>&1
eval_tap $? 270 'CancelSubscription' test.out

#- 271 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'oQbYzc1RDVhs2lhd' \
    --userId 'zxxgibuqUuyW3cMz' \
    --body '{"grantDays": 11, "reason": "YyduMomEHcU15St4"}' \
    > test.out 2>&1
eval_tap $? 271 'GrantDaysToSubscription' test.out

#- 272 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'v8ry8IyqNVv0KVpX' \
    --userId 'JTMx3Y8Um1iqehOb' \
    --excludeFree  \
    --limit '12' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 272 'GetUserSubscriptionBillingHistories' test.out

#- 273 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '3OZ9j0HDtbqMFlgH' \
    --userId 'KQIRtLfPngD83roO' \
    --body '{"additionalData": {"cardSummary": "eqE7fcCAeExeQX43"}, "authorisedTime": "1990-09-04T00:00:00Z", "chargebackReversedTime": "1978-03-15T00:00:00Z", "chargebackTime": "1977-12-12T00:00:00Z", "chargedTime": "1972-07-23T00:00:00Z", "createdTime": "1991-05-10T00:00:00Z", "currency": {"currencyCode": "iZeyIrA4QUKSJgEC", "currencySymbol": "zvaWUCA7wKru7ry3", "currencyType": "VIRTUAL", "decimals": 6, "namespace": "Q2sEHvSxjWoM1rNJ"}, "customParameters": {"LM0OOVG5cG6XxENb": {}, "WqlX7idzjpKDfwl6": {}, "XlCF6YxFMD8tJQwZ": {}}, "extOrderNo": "vUVInos5RK100yH8", "extTxId": "9i8ZDPXRL8cbTAnt", "extUserId": "B1STaab1UeibXg7R", "issuedAt": "1985-02-05T00:00:00Z", "metadata": {"PhoNZlXMef7AvS3T": "fKx6ByTygbtOtcQS", "4Cmgw1wRUnIVYxY6": "OhdkrYiCinoVOzo4", "Plv1IlTpEhjTFYdz": "sUNvQAn2LuMjLqwm"}, "namespace": "Vz3zKsfjz1mFkyxo", "nonceStr": "UzfMFoXCOguSq2A4", "paymentMethod": "R3wDdSkNfHJtA3Qi", "paymentMethodFee": 23, "paymentOrderNo": "9ZvtydbaVb0scd97", "paymentProvider": "WXPAY", "paymentProviderFee": 40, "paymentStationUrl": "0GP6djn2Ps3IVT5h", "price": 96, "refundedTime": "1997-04-11T00:00:00Z", "salesTax": 34, "sandbox": false, "sku": "a8GatrjbJ5YT7uvq", "status": "AUTHORISED", "statusReason": "KcSxUc2YgRpk2IFG", "subscriptionId": "IgIpscUpVAciu2XP", "subtotalPrice": 86, "targetNamespace": "CDhshvEF8rHd250n", "targetUserId": "yihcUVGHQczI5ZoT", "tax": 90, "totalPrice": 95, "totalTax": 84, "txEndTime": "1976-10-17T00:00:00Z", "type": "jGoRkPs2SO9XrgXN", "userId": "IaU11cBXLwTfopqe", "vat": 39}' \
    > test.out 2>&1
eval_tap $? 273 'ProcessUserSubscriptionNotification' test.out

#- 274 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'M3JXjEvsj5WcQ99M' \
    --namespace "$AB_NAMESPACE" \
    --userId '1yuXeqV31LX2ehcM' \
    --body '{"count": 28, "orderNo": "pe2tsNczam4Cdd1Q"}' \
    > test.out 2>&1
eval_tap $? 274 'AcquireUserTicket' test.out

#- 275 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yvww4XDokltgq2vX' \
    > test.out 2>&1
eval_tap $? 275 'QueryUserCurrencyWallets' test.out

#- 276 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'tUnY6UhDJ4pe0s0C' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uhl3dU9b4seYCyiB' \
    --body '{"allowOverdraft": true, "amount": 41, "balanceOrigin": "IOS", "balanceSource": "ORDER_REVOCATION", "metadata": {"PGpu27yxb1of79zV": {}, "TWIfgdNphqe9fS1m": {}, "77MAg4KoZQPLhDSJ": {}}, "reason": "x9jzxaRKph4kiIFg"}' \
    > test.out 2>&1
eval_tap $? 276 'DebitUserWalletByCurrencyCode' test.out

#- 277 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'S4fLqlrKGiS3Xxjk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yNfj3XgTRTjI9oNB' \
    --limit '51' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 277 'ListUserCurrencyTransactions' test.out

#- 278 CheckWallet
eval_tap 0 278 'CheckWallet # SKIP deprecated' test.out

#- 279 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode '5AQfzNjQ7IuMSY2e' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pRDJjDyMDKQhuTjt' \
    --body '{"amount": 89, "expireAt": "1980-03-15T00:00:00Z", "metadata": {"yIiAmCL8bNTTfqLC": {}, "v9DYBOProN4UWbQa": {}, "KFrTv4JWElmOCxqP": {}}, "origin": "Oculus", "reason": "2oCn1KvJmbjapW9U", "source": "GIFT"}' \
    > test.out 2>&1
eval_tap $? 279 'CreditUserWallet' test.out

#- 280 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'MgIwkrKFEtwESJCe' \
    --namespace "$AB_NAMESPACE" \
    --userId '2ksG3nZE13H2fILF' \
    --body '{"amount": 51, "metadata": {"X8ERZcKSYLo6y7yJ": {}, "MowQ6LpHCvCYTgX9": {}, "JQwErzjtuP9pUUv7": {}}, "walletPlatform": "Oculus"}' \
    > test.out 2>&1
eval_tap $? 280 'PayWithUserWallet' test.out

#- 281 GetUserWallet
eval_tap 0 281 'GetUserWallet # SKIP deprecated' test.out

#- 282 DebitUserWallet
eval_tap 0 282 'DebitUserWallet # SKIP deprecated' test.out

#- 283 DisableUserWallet
eval_tap 0 283 'DisableUserWallet # SKIP deprecated' test.out

#- 284 EnableUserWallet
eval_tap 0 284 'EnableUserWallet # SKIP deprecated' test.out

#- 285 ListUserWalletTransactions
eval_tap 0 285 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 286 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NNfQSYLFKSl3FNFF' \
    > test.out 2>&1
eval_tap $? 286 'ListViews' test.out

#- 287 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Jnt3rIwZdW02Su6a' \
    --body '{"displayOrder": 59, "localizations": {"i7BycDPckeGJUgU8": {"description": "bD5mGFFmKTTUxG0m", "localExt": {"pmFxxDNXGlGJvHf5": {}, "58h1ltyhiSGhfqXh": {}, "xBJ7zLXioAGkWgSD": {}}, "longDescription": "dDQvpRfGe3z2rtjW", "title": "pJAlKHF0ebxhJ117"}, "6CeD4dWCp4wqlQJc": {"description": "ZroNQiefBnPluOIj", "localExt": {"ZyvlGDQGv6pNNowE": {}, "uVVZM28w4mnYvvlt": {}, "1es7A4PFduN4gx0U": {}}, "longDescription": "C6eWKCFGS97Si6Xy", "title": "LVPrkUxyZ1OH5Nn4"}, "nMT8QOyTuUSD9Imt": {"description": "aPAocOQcpBWSNrCj", "localExt": {"SNEAdojkCMmYyTGO": {}, "07foRZ6FujpIWo0q": {}, "Jtqp4Q6XgICLgMHc": {}}, "longDescription": "P1eE6sjWQllYsONp", "title": "p6QGW56CNiszHE69"}}, "name": "D1MMoaf6KlgRtwaM"}' \
    > test.out 2>&1
eval_tap $? 287 'CreateView' test.out

#- 288 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId '2IoyY1wpIdjcAtTj' \
    --storeId '1IMuuhxxlulfmya7' \
    > test.out 2>&1
eval_tap $? 288 'GetView' test.out

#- 289 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId '3hX0a8Ri85PA9wNp' \
    --storeId 'mrK5Y5heA2ewWnFc' \
    --body '{"displayOrder": 33, "localizations": {"0pv7XeqO8gY3c4Sr": {"description": "yWB4yRaDxvxwaLM8", "localExt": {"HkVOW8PnLkgqkqYZ": {}, "WPZTgKagTzdcYcko": {}, "7U3gH239LhRx2Laa": {}}, "longDescription": "2RdtVb6VgA5yFIH3", "title": "s9UyeaFi8OE7BCK4"}, "FeVGrl5NpUG9zblW": {"description": "EiHaUjyTHb0sSlst", "localExt": {"b3slUe94NxhXsVcq": {}, "TYi1TMBMzaOrxuKv": {}, "tUVtqbDWnJ2i9TRm": {}}, "longDescription": "JOqIl7U12hO5vpk9", "title": "DOSgbsdGVPLD9A5N"}, "muZDUV3yHurgOfba": {"description": "1XeoHYTNoRol84Ul", "localExt": {"kxtP5Vok9sNK1ORg": {}, "3tChsS3fFpaS1uq1": {}, "mH3oYfPK2QiAUhIf": {}}, "longDescription": "i17YrkWHNxiaNyqB", "title": "fgw58Hx0XYL0fJOP"}}, "name": "YpnPqGlPnhBDOWqD"}' \
    > test.out 2>&1
eval_tap $? 289 'UpdateView' test.out

#- 290 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'U8N3DjVUt0n0jfyD' \
    --storeId 'btIXICLkK8ZvbnTg' \
    > test.out 2>&1
eval_tap $? 290 'DeleteView' test.out

#- 291 QueryWallets
eval_tap 0 291 'QueryWallets # SKIP deprecated' test.out

#- 292 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 4, "expireAt": "1984-06-09T00:00:00Z", "metadata": {"nlg8nmzQx1RsYhcR": {}, "lv16Wwe8YK3lZFsl": {}, "ECI9QzuQcsjFehD6": {}}, "origin": "Other", "reason": "cT7sAsv2TKCbYMVk", "source": "REWARD"}, "currencyCode": "zFZsTBHkgcJ0DcEt", "userIds": ["23pci6xEljer6aGJ", "TPX4ig3NVFFkP7O3", "x5OFp3jKEx4aSGdw"]}, {"creditRequest": {"amount": 65, "expireAt": "1989-03-14T00:00:00Z", "metadata": {"vsohRWDyGYIVFDbT": {}, "vRYfpJ4wM9WZfOOx": {}, "Azmsbhi5QJuc2SNB": {}}, "origin": "Epic", "reason": "IcBMJ04508jKedx0", "source": "PROMOTION"}, "currencyCode": "ZrkjRm5Ki0orhXrI", "userIds": ["SEaPZHLQkTHvndQs", "zxidLcAQWGVRg6DV", "CKAO2JRz3CGwtujk"]}, {"creditRequest": {"amount": 39, "expireAt": "1975-04-27T00:00:00Z", "metadata": {"A3JS2xeaJ08JrSHP": {}, "qdhKHn6ZjZMdr1C2": {}, "TIQzRJY7UfYSrdN0": {}}, "origin": "Twitch", "reason": "bbMIu9lu18jIMBUM", "source": "CONSUME_ENTITLEMENT"}, "currencyCode": "7XmemN8LO03mnFSq", "userIds": ["R1Pq4a4uaMfd0SQA", "9jJTVFoFjxZjh5qU", "fYIyzHL8jxakuVu5"]}]' \
    > test.out 2>&1
eval_tap $? 292 'BulkCredit' test.out

#- 293 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "r5B08VZxI4TU3apn", "request": {"allowOverdraft": false, "amount": 59, "balanceOrigin": "Nintendo", "balanceSource": "OTHER", "metadata": {"J4gI4EQKO8xC4D0F": {}, "sUo3IB2kX5REQZsH": {}, "yXzoIXNf0KbL9HyJ": {}}, "reason": "ttdgfLGO3ummplln"}, "userIds": ["ameT2mLkkAMjHyI0", "V6B62P1Kazg73c6U", "pmA4ehxNIIlcrZzg"]}, {"currencyCode": "e2Axj0nZHjmoKHJn", "request": {"allowOverdraft": false, "amount": 24, "balanceOrigin": "Other", "balanceSource": "PAYMENT", "metadata": {"Me1AnQVj6QQjZtkN": {}, "JCnDSrsSey2BqOxg": {}, "wCymCDYsuff3b7G5": {}}, "reason": "FDX4mu0qPHb9Ll2E"}, "userIds": ["FEb8GnsthmQ2Y6ZG", "J5bzDRzbhMxfEDE4", "Oiqrg3lpqN5bOfnq"]}, {"currencyCode": "TrtIHyyMq79EdB9M", "request": {"allowOverdraft": true, "amount": 79, "balanceOrigin": "Epic", "balanceSource": "ORDER_REVOCATION", "metadata": {"F8QHGM2IuQYBO8m0": {}, "HgTth479W8rXqwGV": {}, "IRWgTNHCka3Wb5kH": {}}, "reason": "1BrLWUetP7nmESQD"}, "userIds": ["4ElzL44KEm3uHBMC", "P5ckjphURs4ksgsK", "V3BD1nnEzoUlUWqP"]}]' \
    > test.out 2>&1
eval_tap $? 293 'BulkDebit' test.out

#- 294 GetWallet
eval_tap 0 294 'GetWallet # SKIP deprecated' test.out

#- 295 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'J2R6Jacwwu8W1zvr' \
    --end 'KMRPvwA9k6yJz03N' \
    --start 'ETdywPqYerrpOm4M' \
    > test.out 2>&1
eval_tap $? 295 'SyncOrders' test.out

#- 296 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["2pM4fIfcHBWZM50a", "HbPXRns3qwYL6LwG", "lZGF7XQPLAcIL7Fv"], "apiKey": "AMWqhyyNZH1CducB", "authoriseAsCapture": true, "blockedPaymentMethods": ["y5iMdeBG7REG4meK", "EabfVXBJPIZqZC5d", "6JuFdcfiNf0DOHKw"], "clientKey": "xDF5GJhCjVHiCn2h", "dropInSettings": "TefT8gPFJ4WndMpQ", "liveEndpointUrlPrefix": "hcLK0WTZbtmQkwC8", "merchantAccount": "azx3IRWme3C6p2r4", "notificationHmacKey": "D3NQdjrjkX3AMgK3", "notificationPassword": "JgZufzssA284mG7u", "notificationUsername": "AojLYBsx8oqMzbE0", "returnUrl": "ljQaBtb47V691j0F", "settings": "Zp2vjOXptxzx6kka"}' \
    > test.out 2>&1
eval_tap $? 296 'TestAdyenConfig' test.out

#- 297 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "ZYpl52sQR9Znp5d1", "privateKey": "eSwrG2GBBEWrDbQ1", "publicKey": "ZzhDuLHq9LTBstgu", "returnUrl": "OdN0O7l3GbKPHdDT"}' \
    > test.out 2>&1
eval_tap $? 297 'TestAliPayConfig' test.out

#- 298 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "QDEEE2mTsn1NwJ71", "secretKey": "szsNmnqZSWdEyOVY"}' \
    > test.out 2>&1
eval_tap $? 298 'TestCheckoutConfig' test.out

#- 299 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'rTdDq7IqbTVv8BLs' \
    > test.out 2>&1
eval_tap $? 299 'DebugMatchedPaymentMerchantConfig' test.out

#- 300 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "qQW8HSrEm5Y7jI23", "clientSecret": "2SjktijiNzTUe8Kd", "returnUrl": "izXmrmK0sCUsqxKo", "webHookId": "cHomtjoU1kUqRedw"}' \
    > test.out 2>&1
eval_tap $? 300 'TestPayPalConfig' test.out

#- 301 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["Iu1TSRr6r8mzfMed", "pcKhvHPlvYanGqEk", "n9OEVwLWGT4MXhmz"], "publishableKey": "vRQb7c0vmjWq9fQq", "secretKey": "zulLGfQMqSLQDlRF", "webhookSecret": "YMVfiAMa6Pco7Mfv"}' \
    > test.out 2>&1
eval_tap $? 301 'TestStripeConfig' test.out

#- 302 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "ikslpyL9BYLVVznF", "key": "6hMYfksp8VQhYSFe", "mchid": "BOp0ilGQFwHUtZug", "returnUrl": "blT3aIDKn9qJXncm"}' \
    > test.out 2>&1
eval_tap $? 302 'TestWxPayConfig' test.out

#- 303 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "5igpAewbmnWk0E7Y", "flowCompletionUrl": "aPblcWEyNgvs5LEZ", "merchantId": 35, "projectId": 32, "projectSecretKey": "QXzSQRWRs9EGnRPg"}' \
    > test.out 2>&1
eval_tap $? 303 'TestXsollaConfig' test.out

#- 304 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'YlJElgJ8kx1WEeDb' \
    > test.out 2>&1
eval_tap $? 304 'GetPaymentMerchantConfig' test.out

#- 305 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'ql13FtQMu41rnOzb' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["sFBqg6dziWvdNcwf", "UBMdNuTaiLxFMXRp", "DP9xutntU8xHw4yY"], "apiKey": "JOCViHwunQwpC2eC", "authoriseAsCapture": false, "blockedPaymentMethods": ["UAHZaYSvsWiNJtqX", "ltZF6aSRmHU5iR3h", "XIbzWPKOkzftOgDQ"], "clientKey": "AWhulbrDf7q4cAnp", "dropInSettings": "mLiEu4CNtX2lnqi7", "liveEndpointUrlPrefix": "cHTSdGoLZbC3UJru", "merchantAccount": "U4uIXBZsEYogFWiH", "notificationHmacKey": "9z4E8zmaZ5cg0REt", "notificationPassword": "UWY4fVIdqwCWF5wm", "notificationUsername": "bOubTxAAeDCowR3M", "returnUrl": "eCNL1oNrF3SmgudQ", "settings": "usJLsPlW7ZyORFkN"}' \
    > test.out 2>&1
eval_tap $? 305 'UpdateAdyenConfig' test.out

#- 306 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id '9EbKbTbrDzNgVEcw' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 306 'TestAdyenConfigById' test.out

#- 307 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id '0lxRam16O6v4VjJf' \
    --sandbox  \
    --validate  \
    --body '{"appId": "40LjUdORELVXUFQy", "privateKey": "Vlt9jmxmxpfp41k1", "publicKey": "uDg59PhdUXShabwy", "returnUrl": "YCxTHrDel8oThvr8"}' \
    > test.out 2>&1
eval_tap $? 307 'UpdateAliPayConfig' test.out

#- 308 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'CUEzw4zL1QeR3EYX' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 308 'TestAliPayConfigById' test.out

#- 309 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'BFpUX9y4tY7o5FFi' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "1n10vDgyoHXIlrMl", "secretKey": "2RAukCL26ihdMy9Y"}' \
    > test.out 2>&1
eval_tap $? 309 'UpdateCheckoutConfig' test.out

#- 310 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'CLNJEkvq6SUSt8xd' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 310 'TestCheckoutConfigById' test.out

#- 311 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id '8EgE15XNuw6Y7sTo' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "QNkuZzJ1XBxw01iB", "clientSecret": "BQukgQ94ZvPCWcMX", "returnUrl": "0ov3U2sKjIeyFS97", "webHookId": "dYD7LkcTKYpCfl6H"}' \
    > test.out 2>&1
eval_tap $? 311 'UpdatePayPalConfig' test.out

#- 312 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'Py5cJfAV5iOfzwt3' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 312 'TestPayPalConfigById' test.out

#- 313 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'bpxRNt6lKoMjCPtE' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["KeBWTm78Fn8TvZVT", "e4L2lXrVPX6r5ZTc", "nVVOKMApTcWsFRUl"], "publishableKey": "WBp4gBs9UufgsVbG", "secretKey": "6TUe3jbuQ7HMPO4o", "webhookSecret": "zK705ykRqSPYZgPm"}' \
    > test.out 2>&1
eval_tap $? 313 'UpdateStripeConfig' test.out

#- 314 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id '4JLsXVtBOEetHsxA' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 314 'TestStripeConfigById' test.out

#- 315 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'J8Ny1LRkPU9hrl5n' \
    --validate  \
    --body '{"appId": "kpEdBe8bYWdok4Un", "key": "UEOyP0cPZf5Ovolf", "mchid": "I0mqZctohLheRaQk", "returnUrl": "fMLFW9B7jHZro4hh"}' \
    > test.out 2>&1
eval_tap $? 315 'UpdateWxPayConfig' test.out

#- 316 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'wnANAGp8zGqNGrcQ' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 316 'UpdateWxPayConfigCert' test.out

#- 317 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'yoA1TWPcy83iXfYX' \
    > test.out 2>&1
eval_tap $? 317 'TestWxPayConfigById' test.out

#- 318 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'NdMkdg9TMwxNcQ6C' \
    --validate  \
    --body '{"apiKey": "kVi8fqVPRqNbF5yL", "flowCompletionUrl": "nYSa8xFLvcYexMMM", "merchantId": 16, "projectId": 20, "projectSecretKey": "DFh5RbW021cHN3Qb"}' \
    > test.out 2>&1
eval_tap $? 318 'UpdateXsollaConfig' test.out

#- 319 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'zVuJZH3k54cExxWK' \
    > test.out 2>&1
eval_tap $? 319 'TestXsollaConfigById' test.out

#- 320 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'tdGTW4FILotv5ycT' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "MEDIUM", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 320 'UpdateXsollaUIConfig' test.out

#- 321 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '2' \
    --namespace "$AB_NAMESPACE" \
    --offset '17' \
    --region 'CKt79wAopZL9Cw6K' \
    > test.out 2>&1
eval_tap $? 321 'QueryPaymentProviderConfig' test.out

#- 322 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "h55mwUvhdBOgumV4", "region": "wAsd4ifGd0bkWrlh", "sandboxTaxJarApiToken": "tfTywRW4fmg6btk3", "specials": ["PAYPAL", "ADYEN", "WXPAY"], "taxJarApiToken": "oCWxhubMXbxNvT6w", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 322 'CreatePaymentProviderConfig' test.out

#- 323 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 323 'GetAggregatePaymentProviders' test.out

#- 324 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'ffv4uzKAwiI4wTxN' \
    > test.out 2>&1
eval_tap $? 324 'DebugMatchedPaymentProviderConfig' test.out

#- 325 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 325 'GetSpecialPaymentProviders' test.out

#- 326 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'IefCmtrxWu293551' \
    --body '{"aggregate": "ADYEN", "namespace": "KneoO10ytPdJ8SY3", "region": "qoogOxoPYvdIBJYy", "sandboxTaxJarApiToken": "GURjEjnslEYM8ngV", "specials": ["WALLET", "ALIPAY", "WALLET"], "taxJarApiToken": "7NxKHUHg0c4X7fHd", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 326 'UpdatePaymentProviderConfig' test.out

#- 327 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'Co9gZWdxfIdW8fNA' \
    > test.out 2>&1
eval_tap $? 327 'DeletePaymentProviderConfig' test.out

#- 328 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 328 'GetPaymentTaxConfig' test.out

#- 329 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "M5YdHivK2Q0WwolQ", "taxJarApiToken": "y037hJMOEv5W0v25", "taxJarEnabled": true, "taxJarProductCodesMapping": {"mAvxBxJNPlvvYZw4": "MWzWFTuNPf5JCSDy", "Yy4e5qoTZxSoZbQU": "nUxS6m68WL3HDL4y", "x5I0euBsccHPA2v9": "XP9enfEX7lloLgIY"}}' \
    > test.out 2>&1
eval_tap $? 329 'UpdatePaymentTaxConfig' test.out

#- 330 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'qxFfSNJlHCjxLNnY' \
    --end 'UlGQsFpy9ZVlLIFw' \
    --start 'LgT78nootfUs9559' \
    > test.out 2>&1
eval_tap $? 330 'SyncPaymentOrders' test.out

#- 331 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'ilm3cauhrw9Yn2z5' \
    --storeId 'cnbm7z2Aa24yBTw3' \
    > test.out 2>&1
eval_tap $? 331 'PublicGetRootCategories' test.out

#- 332 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'wfNGyWf3VujS7Bq5' \
    --storeId 'bcfPW4pPZB9YXltC' \
    > test.out 2>&1
eval_tap $? 332 'DownloadCategories' test.out

#- 333 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'xyztUnj17t3gHBXv' \
    --namespace "$AB_NAMESPACE" \
    --language 'jvziexzOLbOWbtcJ' \
    --storeId 'UxM3AWyDkA5LmART' \
    > test.out 2>&1
eval_tap $? 333 'PublicGetCategory' test.out

#- 334 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath '6kulpM4SRtUE5P4k' \
    --namespace "$AB_NAMESPACE" \
    --language 'xmHtFbjqurHix0QY' \
    --storeId 'ycDH5we2Mx0sYCnY' \
    > test.out 2>&1
eval_tap $? 334 'PublicGetChildCategories' test.out

#- 335 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'PT4i4mxc14iRfzJw' \
    --namespace "$AB_NAMESPACE" \
    --language 'Kuc7EpiQEzz5N5os' \
    --storeId 'RYO7wbYh7q02W8tk' \
    > test.out 2>&1
eval_tap $? 335 'PublicGetDescendantCategories' test.out

#- 336 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 336 'PublicListCurrencies' test.out

#- 337 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'TWITCH' \
    > test.out 2>&1
eval_tap $? 337 'GetIAPItemMapping' test.out

#- 338 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'UFmqNc8xhQqptccN' \
    --region 'orRls7EC3nDnhFvD' \
    --storeId 'lFd7iyZpvWVJFK6Z' \
    --appId 'uvlzGCII156hIg0g' \
    > test.out 2>&1
eval_tap $? 338 'PublicGetItemByAppId' test.out

#- 339 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --baseAppId 'HIxpzm9AcFhH4ZlY' \
    --categoryPath 'Y3rEuHMWwQNmCQmG' \
    --features 'CF963CbsOawlRBQJ' \
    --includeSubCategoryItem  \
    --itemType 'OPTIONBOX' \
    --language 'IZVH8q8svV5hMOSf' \
    --limit '32' \
    --offset '15' \
    --region 'yJkJlmJmTkFvB7wk' \
    --sortBy 'createdAt,createdAt:asc,displayOrder:asc' \
    --storeId 'IuxKmBXLi6GpnqAe' \
    --tags 'Mvg3w0FQ1520WM3T' \
    > test.out 2>&1
eval_tap $? 339 'PublicQueryItems' test.out

#- 340 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'xWXSdTiKdva2UREo' \
    --region 'BSFtCLy2CqgCG7Jw' \
    --storeId 'JCDqkzOdFwLJpIPx' \
    --sku 'zLE1V9U1NgpH7Oc4' \
    > test.out 2>&1
eval_tap $? 340 'PublicGetItemBySku' test.out

#- 341 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language '4yjRdfqZgv34Gqqj' \
    --region 'elcN0GJmPwUTWMx0' \
    --storeId 'MiPAjnWIhFrqSn4e' \
    --itemIds 'rXEtU1CaD8AqsMCG' \
    > test.out 2>&1
eval_tap $? 341 'PublicBulkGetItems' test.out

#- 342 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["BNhmUt6fzYRn85br", "Tu8F7cuCPh1TGZJm", "gWNHWnvOBRCt4onq"]}' \
    > test.out 2>&1
eval_tap $? 342 'PublicValidateItemPurchaseCondition' test.out

#- 343 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'SEASON' \
    --limit '29' \
    --offset '7' \
    --region '2PnMSRarKg4coy3A' \
    --storeId 'FpULIn21Nf2FNgDW' \
    --keyword 'NC6yh7kgTHlrxKbs' \
    --language 'V4XtrI7SFBEgkwHi' \
    > test.out 2>&1
eval_tap $? 343 'PublicSearchItems' test.out

#- 344 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'fMHYI581HbF7fMX9' \
    --namespace "$AB_NAMESPACE" \
    --language 'lDXYxGRJM92eX42W' \
    --region 'W2WKf5urEOpASBic' \
    --storeId 'X3ZwzZ7aVhrkmhSO' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetApp' test.out

#- 345 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'EozGOv8D0iVxzrec' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'PublicGetItemDynamicData' test.out

#- 346 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId '5kNwJAxm0Rdm9l6n' \
    --namespace "$AB_NAMESPACE" \
    --language 'IhG5SilDDIsmj4h6' \
    --populateBundle  \
    --region '25dIsMKWBxF9RAIr' \
    --storeId 'I81ZR2kNzh60RQNa' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetItem' test.out

#- 347 GetPaymentCustomization
eval_tap 0 347 'GetPaymentCustomization # SKIP deprecated' test.out

#- 348 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "TEhMXMepgzY9jLiA", "paymentProvider": "ADYEN", "returnUrl": "Rp5e5IvFuN1oUsCn", "ui": "BmGMx5F6EhM3dKvI", "zipCode": "G9MR0hTINvq1VR9S"}' \
    > test.out 2>&1
eval_tap $? 348 'PublicGetPaymentUrl' test.out

#- 349 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'JUfQEX996Mh1sQ3D' \
    > test.out 2>&1
eval_tap $? 349 'PublicGetPaymentMethods' test.out

#- 350 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'w3uyjgQNAs9188Qm' \
    > test.out 2>&1
eval_tap $? 350 'PublicGetUnpaidPaymentOrder' test.out

#- 351 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '3W1De2McGd10wefF' \
    --paymentProvider 'XSOLLA' \
    --zipCode 'gDSj1T6EdeYFmrLT' \
    --body '{"token": "0HbvS4kSSt3CyDgf"}' \
    > test.out 2>&1
eval_tap $? 351 'Pay' test.out

#- 352 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '6eFAiqSkHi0BR2El' \
    > test.out 2>&1
eval_tap $? 352 'PublicCheckPaymentOrderPaidStatus' test.out

#- 353 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'WXPAY' \
    --region 'Ho6gGQ5mChYoKD7y' \
    > test.out 2>&1
eval_tap $? 353 'GetPaymentPublicConfig' test.out

#- 354 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'qCR03RovQZhwfjkq' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetQRCode' test.out

#- 355 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID '9iyTbyD3D01tRpuu' \
    --foreinginvoice 'yIagSSzEL8H4euLu' \
    --invoiceId 'fhQj2KP3LLxl9Hs2' \
    --payload 'L2wlpKBVURxHefz7' \
    --redirectResult '7a9fntCNiHBRUNCP' \
    --resultCode 'Sre5GmZzCQwilS3I' \
    --sessionId 'xSjlyvR9PxG9Lji2' \
    --status 'Vc88W8aLjIxVGpdO' \
    --token 'qguxvRwI9ZBTipMR' \
    --type 'lhK9DMMaI4ryVDvN' \
    --userId 'aruZxwTfh9gEs6GF' \
    --orderNo '247cbBLjUr5z03wx' \
    --paymentOrderNo 'B3E9hrE9f9COFrOr' \
    --paymentProvider 'ALIPAY' \
    --returnUrl 'wJDBwIDsJHNg6TvN' \
    > test.out 2>&1
eval_tap $? 355 'PublicNormalizePaymentReturnUrl' test.out

#- 356 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'GjwI4TbTwBufUorJ' \
    --paymentOrderNo 'ouduhCEJ5XiKDIE9' \
    --paymentProvider 'XSOLLA' \
    > test.out 2>&1
eval_tap $? 356 'GetPaymentTaxValue' test.out

#- 357 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'ugcupLxVBcRkfhRu' \
    > test.out 2>&1
eval_tap $? 357 'GetRewardByCode' test.out

#- 358 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'qkOTHSia7oFd1fEm' \
    --limit '61' \
    --offset '65' \
    --sortBy 'namespace:asc,namespace:desc,rewardCode' \
    > test.out 2>&1
eval_tap $? 358 'QueryRewards1' test.out

#- 359 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'liYmBrqrOc0NIlig' \
    > test.out 2>&1
eval_tap $? 359 'GetReward1' test.out

#- 360 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 360 'PublicListStores' test.out

#- 361 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'BrOkBljwRENjt04Z,pyTTZG1LxLdySvyV,qY8nxBZbHcPHEFuE' \
    --itemIds 'VP9bF07gnWDULkJP,QR0UJMr8ouccGH0B,4LCe2h0iFCCZgFWs' \
    --skus '5s0nT89A88GDOUCl,GyzYgnYTdim6PkRo,q5TO65KWh8ztRJkX' \
    > test.out 2>&1
eval_tap $? 361 'PublicExistsAnyMyActiveEntitlement' test.out

#- 362 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'xUAj3jzZvEaY103Y' \
    > test.out 2>&1
eval_tap $? 362 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 363 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'ZveFMWAFT7l0l1ja' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 364 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'NP2JqQqhISTBT1Go' \
    > test.out 2>&1
eval_tap $? 364 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 365 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'fv4SuaZ8yCB9TVZn,uzgvAZJRm71EC3EN,uvD8OPsp5Z3ez84K' \
    --itemIds 'VB7HeWPnVeFdy5ez,lCU6SGzkMpTL2wxo,bjxAbagqEmXn6U2V' \
    --skus 'eV2emK3JecJA4skq,CbPxRkIAFQh9yDdo,LE2s7mrVrmTJwtBT' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetEntitlementOwnershipToken' test.out

#- 366 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "zQTrNo1LcWNf7xHp", "language": "XD_jDsP-Re", "region": "RkX7iW7VpCngWAv5"}' \
    > test.out 2>&1
eval_tap $? 366 'SyncTwitchDropsEntitlement' test.out

#- 367 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'DAG8dPdkKgQqjyzU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 367 'PublicGetMyWallet' test.out

#- 368 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZR2rFIAuALNhNCys' \
    --body '{"epicGamesJwtToken": "csMBRLsWadk2OQ42"}' \
    > test.out 2>&1
eval_tap $? 368 'SyncEpicGameDLC' test.out

#- 369 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '1q7Nb1vrKthVvU5o' \
    > test.out 2>&1
eval_tap $? 369 'SyncOculusDLC' test.out

#- 370 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'n065ApCkVN3QchuQ' \
    --body '{"serviceLabel": 77}' \
    > test.out 2>&1
eval_tap $? 370 'PublicSyncPsnDlcInventory' test.out

#- 371 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'pntxB648ss7rBnvQ' \
    --body '{"serviceLabels": [83, 68, 55]}' \
    > test.out 2>&1
eval_tap $? 371 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 372 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'X9n3YsjJexnFA9Um' \
    --body '{"appId": "z3KPICya5Fk5TPaE", "steamId": "bX29cV8v7MXctiht"}' \
    > test.out 2>&1
eval_tap $? 372 'SyncSteamDLC' test.out

#- 373 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'xMnIr4b7jyfL3zMk' \
    --body '{"xstsToken": "klGCPISlsnVA6z0u"}' \
    > test.out 2>&1
eval_tap $? 373 'SyncXboxDLC' test.out

#- 374 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'SfNNpJUYzJxnOyvq' \
    --appType 'DLC' \
    --entitlementClazz 'APP' \
    --entitlementName 'swrToyBIQumxDfAx' \
    --features 'NqCUtizYM97ebZcY,qwfIHPWMkOmrT5HL,16jMwECnmwJv4rpq' \
    --itemId 'tzDaz0WUJlBCHzJ2,v9K8c1zOlZg30pag,fP0FfOMBOpeQT4zY' \
    --limit '71' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 374 'PublicQueryUserEntitlements' test.out

#- 375 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'bU4i9mLyX46Alt08' \
    --appId 'rrnG8y2ScXkwjpAp' \
    > test.out 2>&1
eval_tap $? 375 'PublicGetUserAppEntitlementByAppId' test.out

#- 376 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '82pGcxvXaG9LzHpM' \
    --limit '91' \
    --offset '43' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 376 'PublicQueryUserEntitlementsByAppType' test.out

#- 377 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '3jllopwirRo3A8Wx' \
    --entitlementClazz 'CODE' \
    --itemId 'PgT6LMehg047axU5' \
    > test.out 2>&1
eval_tap $? 377 'PublicGetUserEntitlementByItemId' test.out

#- 378 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'ktNywRIvO2Sgz30h' \
    --entitlementClazz 'APP' \
    --sku 'NStWIggmhfAzVdNY' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetUserEntitlementBySku' test.out

#- 379 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'P7Ao1z7FeJM2fWXG' \
    --appIds 'k7JObSHksRkabpmv,Rsc7ZYvXCT6m6mRZ,AlLBczJVeil7GbG1' \
    --itemIds 'ISBCkcnpxKUxLjmx,hBS6YypRW7fNntaI,EtDI6MbhxkQdezbm' \
    --skus 'f392ersoZ2KbMb5j,al0ruZmBXlGSp85q,6fuGfo5wSDHnyabk' \
    > test.out 2>&1
eval_tap $? 379 'PublicExistsAnyUserActiveEntitlement' test.out

#- 380 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '493I3pvHKDaWhTN1' \
    --appId 'qyxpUzWIZWJTDzWg' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 381 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'uhujw1EoR58uCVld' \
    --entitlementClazz 'APP' \
    --itemId 'yQz337LLNCjIySe3' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 382 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '6SA5dxATLv5PkLvr' \
    --ids 'aRzChdjDGdlk2A2j,HbAPNGInvbnf4ewK,FFLoGggX4gQWyZoc' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 383 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'vYfr0Rnl02R1IVNn' \
    --entitlementClazz 'APP' \
    --sku '2bmOikTBJHTEm5PS' \
    > test.out 2>&1
eval_tap $? 383 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 384 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'eyod5L6OooYoQn9i' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HEqWO1cVCUIOx90F' \
    > test.out 2>&1
eval_tap $? 384 'PublicGetUserEntitlement' test.out

#- 385 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'QdwLi3GOQkLtpuRN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eT1CULEMPaOU5nuk' \
    --body '{"options": ["ycAUlkUSZKUrsxNR", "zF3NaUuCyQyze6zP", "Ku5sE89JW8UU0RsB"], "requestId": "6dvrpmInhHYzVVlH", "useCount": 66}' \
    > test.out 2>&1
eval_tap $? 385 'PublicConsumeUserEntitlement' test.out

#- 386 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'd9dG3yzaNbGeASX8' \
    --namespace "$AB_NAMESPACE" \
    --userId '3SLiIbAP2qyUnHnf' \
    --body '{"requestId": "rEdDfY4TTxu8goZg", "useCount": 38}' \
    > test.out 2>&1
eval_tap $? 386 'PublicSellUserEntitlement' test.out

#- 387 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'jgLoJyqwFVBd1Zja' \
    --body '{"code": "RXEdWgS12bSbPgOC", "language": "veP_SaZE", "region": "OPUMrqgEIsMwNbft"}' \
    > test.out 2>&1
eval_tap $? 387 'PublicRedeemCode' test.out

#- 388 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'i0LoTBcNzyoCSw1t' \
    --body '{"excludeOldTransactions": false, "language": "SiYd", "productId": "mGzvx9bSqqyAPha5", "receiptData": "b6PQTPTytHeeXo7g", "region": "OFVLZCBWuVIROZuq", "transactionId": "dJBi8pkn98VtLNka"}' \
    > test.out 2>&1
eval_tap $? 388 'PublicFulfillAppleIAPItem' test.out

#- 389 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'IQJfkFDhSeSGXtZU' \
    --body '{"epicGamesJwtToken": "5SuIhMSaDRp17dUW"}' \
    > test.out 2>&1
eval_tap $? 389 'SyncEpicGamesInventory' test.out

#- 390 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hcjrb6qNeKpOxPrl' \
    --body '{"autoAck": false, "language": "gWp-974", "orderId": "qPbzY1yxl7zeEpmS", "packageName": "PO6KwlJQlj9Ii2jA", "productId": "Rwzowk9OoiPdnq9K", "purchaseTime": 56, "purchaseToken": "7J4irvZ9tktWLtDd", "region": "lmVGK6iolEw6IIpD"}' \
    > test.out 2>&1
eval_tap $? 390 'PublicFulfillGoogleIAPItem' test.out

#- 391 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'c9X5ijmtDGvd9ESd' \
    > test.out 2>&1
eval_tap $? 391 'SyncOculusConsumableEntitlements' test.out

#- 392 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y0eTkBWA44Qqsi5y' \
    --body '{"currencyCode": "Ojvl5sRN2ENn1RLi", "price": 0.92848390201597, "productId": "iMPnbg7o1zYpqUsl", "serviceLabel": 17}' \
    > test.out 2>&1
eval_tap $? 392 'PublicReconcilePlayStationStore' test.out

#- 393 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'p49JFwXG0EvoSHNC' \
    --body '{"currencyCode": "97eEyhnL1QH5AlYR", "price": 0.4196764193324183, "productId": "qCAC2gy1WF9QLNgD", "serviceLabels": [48, 21, 54]}' \
    > test.out 2>&1
eval_tap $? 393 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 394 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '8rzDZ08j6ICP75cm' \
    --body '{"appId": "8YDChFi3zLvfQWC8", "currencyCode": "5MxWxvW0veFl3uU1", "language": "Yn-804", "price": 0.41305959328361397, "productId": "Wxc8f1s2QPMMZsf2", "region": "dvKZyHChRPHvdkcK", "steamId": "W21B5EFtD2pYaKTz"}' \
    > test.out 2>&1
eval_tap $? 394 'SyncSteamInventory' test.out

#- 395 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId '1gcE2XCwTkRUIX6I' \
    --body '{"gameId": "FHNmB9mYBvtOwxjq", "language": "XSa-381", "region": "BYHTHoSVxgQCbpZx"}' \
    > test.out 2>&1
eval_tap $? 395 'SyncTwitchDropsEntitlement1' test.out

#- 396 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '5yMGIQ1ZxVIefYlK' \
    --body '{"currencyCode": "BJyQMqUEfDikX6yO", "price": 0.18701994694395496, "productId": "gZrn0I6T0hvcAFTa", "xstsToken": "SWR4VOGIY7hM6uho"}' \
    > test.out 2>&1
eval_tap $? 396 'SyncXboxInventory' test.out

#- 397 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'nkAe0FdTSSEluBxM' \
    --itemId '47BTww3nBTVmBFZ6' \
    --limit '94' \
    --offset '28' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 397 'PublicQueryUserOrders' test.out

#- 398 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '32SJNPZkEfkAcJTM' \
    --body '{"currencyCode": "S4pVRcCHIGfmCMTr", "discountedPrice": 16, "ext": {"ACnI2sMrEgl7ZR1H": {}, "Ckf2Sw78lLGKjDHu": {}, "Xt358gzqRMuMPrIe": {}}, "itemId": "kxq58fikq83hqJ7H", "language": "ptdE_wDxY", "price": 22, "quantity": 1, "region": "l60ImLBv6nUU0r1r", "returnUrl": "fX9stpvJUuyPdzx8", "sectionId": "BM2wEgTtLRT5stwQ"}' \
    > test.out 2>&1
eval_tap $? 398 'PublicCreateUserOrder' test.out

#- 399 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'FUEbTPQ8p7VMlxEX' \
    --userId 'nqHwMyKpwphjUXvM' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetUserOrder' test.out

#- 400 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '1GqMkZ44UXgdBqtJ' \
    --userId 'aRyDlP9qIZJ5Krx6' \
    > test.out 2>&1
eval_tap $? 400 'PublicCancelUserOrder' test.out

#- 401 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'KkHagEugKJxkU8Y5' \
    --userId '8COtTNjnNSikJDg6' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetUserOrderHistories' test.out

#- 402 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ujKvq0CIa1YCK9Pl' \
    --userId 'MeQprfgLGkHX1tdB' \
    > test.out 2>&1
eval_tap $? 402 'PublicDownloadUserOrderReceipt' test.out

#- 403 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'jKmCBXETZwqdzAX2' \
    > test.out 2>&1
eval_tap $? 403 'PublicGetPaymentAccounts' test.out

#- 404 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id '8DikGk8cWiX44azS' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'WiCpVBwvAffJ3btt' \
    > test.out 2>&1
eval_tap $? 404 'PublicDeletePaymentAccount' test.out

#- 405 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId '0PpQY3Pnnic80yEO' \
    --language '8dL6Jh10XMUGeDav' \
    --region 'CKradJmJFUsU418v' \
    --storeId 'AlmfGg9NO1Z2DvnA' \
    --viewId 'xH3pS3jyCkGKltBN' \
    > test.out 2>&1
eval_tap $? 405 'PublicListActiveSections' test.out

#- 406 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'E2UbhNtH3yYg4Qnn' \
    --chargeStatus 'CHARGED' \
    --itemId 'uhdw7C9Bx1LQOTCb' \
    --limit '54' \
    --offset '68' \
    --sku 'PLC3iqrkyJFOVaew' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 406 'PublicQueryUserSubscriptions' test.out

#- 407 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'lG7rEXi6LEqJERpb' \
    --body '{"currencyCode": "xEq07txnvZZeAf7Q", "itemId": "BuZK5GJlBncg8tQn", "language": "hpNl-ZkpW", "region": "hUjzcMtwINUlrhIp", "returnUrl": "nlam2EefVopbpPhs", "source": "ana0uXG7GUTV1Bwg"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicSubscribeSubscription' test.out

#- 408 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'kLDj4pjVktyoNSsE' \
    --itemId 'Hlzyd0SarkhltUxg' \
    > test.out 2>&1
eval_tap $? 408 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 409 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'bN5eElQNESFLD8hC' \
    --userId 'c9onSNjbQEqFGwnD' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetUserSubscription' test.out

#- 410 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'G8kz4kvEv6tNjGRh' \
    --userId 'rmRAxRGeIKGlCJmD' \
    > test.out 2>&1
eval_tap $? 410 'PublicChangeSubscriptionBillingAccount' test.out

#- 411 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'XpjyvLSHB1y3klHu' \
    --userId 'AGnidOyGuS0OG7oh' \
    --body '{"immediate": false, "reason": "UlenimjIbm0riCaN"}' \
    > test.out 2>&1
eval_tap $? 411 'PublicCancelSubscription' test.out

#- 412 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'p8dUBDinAB6HqIWI' \
    --userId 'i5Bvb1rcuEtWAF76' \
    --excludeFree  \
    --limit '20' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 412 'PublicGetUserSubscriptionBillingHistories' test.out

#- 413 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'q150WEIetOXMt37M' \
    --language 'Xy7Fp7lUfQqXrqGa' \
    --storeId 'dwvKlJFX1ZHV9yo9' \
    > test.out 2>&1
eval_tap $? 413 'PublicListViews' test.out

#- 414 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'Ur1hfhmGEKuVUZdC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'acRGataPrcgTcA71' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetWallet' test.out

#- 415 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'dtqtSUN4zvBzGh3m' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hIDNuMBZegHtB9uT' \
    --limit '59' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 415 'PublicListUserWalletTransactions' test.out

#- 416 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --availableDate 'cNJqRjepck1l0qxR' \
    --baseAppId 'yQ2pi7xuAufJakIP' \
    --categoryPath 'XOQznHZTj8oYfWOb' \
    --features 'yNJKVSQsaCokoGyn' \
    --includeSubCategoryItem  \
    --itemName 'p6xcqNKJnAhrSt96' \
    --itemStatus 'ACTIVE' \
    --itemType 'MEDIA' \
    --limit '54' \
    --offset '0' \
    --region 'RAjHLGV3sNxS8uLB' \
    --sectionExclusive  \
    --sortBy 'name:desc,name:asc,displayOrder:desc' \
    --storeId 'RYIyQLcslTEqgVNG' \
    --tags '8AqktgvjwNJAwIpE' \
    --targetNamespace 'y2ZNpojZ24I2n25s' \
    > test.out 2>&1
eval_tap $? 416 'QueryItems1' test.out

#- 417 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'msrmJFHGiYnyhbqx' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 417 'ImportStore1' test.out

#- 418 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LuTZIxgiUaiyy0aW' \
    --body '{"itemIds": ["rshpmb1C9Al7eWrb", "NRE0xyYPUZHyLGQ5", "2IjGpRJCUJpscOTk"]}' \
    > test.out 2>&1
eval_tap $? 418 'ExportStore1' test.out

#- 419 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WETSJ04c5MGInO4y' \
    --body '{"metadata": {"znh2YpZvvmziSSiS": {}, "pXeWOGayfRkQvoN0": {}, "6SpNOnuSksfm7hcI": {}}, "origin": "System", "rewards": [{"currency": {"currencyCode": "vQOgoaBooTawHLMx", "namespace": "hx9nC3o6pXU5MDJL"}, "item": {"itemId": "CB6WbXWIRpgjooaB", "itemSku": "VemsbkaXZQ6nTj9r", "itemType": "ZpkSntuOeaPAyPeE"}, "quantity": 67, "type": "ITEM"}, {"currency": {"currencyCode": "BepK1Ix4SwjCYjCH", "namespace": "niVSn1gYGal5NrBt"}, "item": {"itemId": "T0om9OlGzpF25qu9", "itemSku": "8RhktX6qwkXbCLbh", "itemType": "8t0zPkQWRUlgE0kx"}, "quantity": 51, "type": "CURRENCY"}, {"currency": {"currencyCode": "FMq9ttbEHAEV7C65", "namespace": "Ans9SquNSJIay5Vd"}, "item": {"itemId": "UdYy9Y9OCSmmT3WK", "itemSku": "ijbqhT3uyQRXvvcU", "itemType": "YDeWPZ8yhwQ0gIdj"}, "quantity": 17, "type": "CURRENCY"}], "source": "CONSUME_ENTITLEMENT", "transactionId": "6C0VJ0fK2m6lQ5Ao"}' \
    > test.out 2>&1
eval_tap $? 419 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE