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
echo "1..427"

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
    --body '{"entitlementGrantList": [{"endDate": "1987-05-02T00:00:00Z", "grantedCode": "lEMEsFzYqwgK1Np5", "itemId": "nodqpLm7FhJBNXzA", "itemNamespace": "FdO0Khqf6kiTdSGv", "language": "nL", "quantity": 54, "region": "xL6ozRmDD0jJvlfV", "source": "REFERRAL_BONUS", "startDate": "1992-04-25T00:00:00Z", "storeId": "emPYdYT7DROCjtuz"}, {"endDate": "1987-03-05T00:00:00Z", "grantedCode": "MbAG9YI89hmguB8F", "itemId": "OTjMLo4b9rIzqYkE", "itemNamespace": "pstyVTBcrM8rG0rH", "language": "azC-lXxq", "quantity": 32, "region": "MK6MbGIVIu8vvwLc", "source": "PROMOTION", "startDate": "1999-08-04T00:00:00Z", "storeId": "uVoJXTIMtpgkieDy"}, {"endDate": "1987-07-24T00:00:00Z", "grantedCode": "7lGdMiHKxbWCYzo8", "itemId": "yO2KTK9tmmOnYnOp", "itemNamespace": "as6ghP1y4Zi7s7QB", "language": "GL_718", "quantity": 1, "region": "ZgKg4uKxaCgcGLuC", "source": "PURCHASE", "startDate": "1971-03-18T00:00:00Z", "storeId": "rWdTYCfHkIySok5D"}], "userIds": ["iXZtLW87rGysryod", "wrKt2ecozL0TOg54", "3dNQrmsApRA6HX3R"]}' \
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
    --body '{"appId": "vxuJlhXbWhbwPwTo", "appType": "SOFTWARE", "baseAppId": "Bg0tTJg46IewOXE2", "boothName": "AkCh3QIZsUf8lGFX", "categoryPath": "cmwTERHclOdxIwqe", "clazz": "jxe18rNdb8Otq6j1", "displayOrder": 25, "entitlementType": "DURABLE", "ext": {"qUav7k05HAQltnSo": {}, "jV4jT65yclX2FtAz": {}, "0vJjFIYWOaNdsimm": {}}, "features": ["yQpshaDwNqTbbFMX", "ZkaXZ7vmiEd0JPxV", "kW2miH3xRHAKy4Qx"], "flexible": true, "images": [{"as": "4VfkyrwpuXxbaERb", "caption": "fgPmi0eHkt1mr9EO", "height": 70, "imageUrl": "SiZNCxuogFteTHJe", "smallImageUrl": "4BhSSQkQD6WmOt6D", "width": 26}, {"as": "ufFVTOhvQpfbBke8", "caption": "aEdd36xj6wySoltD", "height": 48, "imageUrl": "Cvs78mcMdiS76YAp", "smallImageUrl": "GJ9ufwLYkqIgLuZS", "width": 12}, {"as": "hsQryiEtOAbpeUNf", "caption": "26UqkCfgCUYBn2xa", "height": 83, "imageUrl": "4lj8m3XEwP2b4gd3", "smallImageUrl": "xOeii8Jnmssep2xD", "width": 95}], "itemIds": ["NY0kABeGs9yxahld", "1pO0Gyf5PO3COyMv", "czgEpzZ3FbtxfhcR"], "itemQty": {"C7IVYa6iZ5uFRYNn": 44, "SHiWxF0YbuU5ar5q": 94, "1dMQ9Rrbk6C2cVWf": 89}, "itemType": "EXTENSION", "listable": true, "localizations": {"491e94mQjVOOBnIW": {"description": "hunElqZUodp3IhtC", "localExt": {"SHy1ei1fIrPvfHnR": {}, "N06EjRwEQlNapJRf": {}, "k4f9Zcw1pEHAyNFx": {}}, "longDescription": "cVTKuAQTGh5BxjWO", "title": "ozGoDtsUuYo5p8ED"}, "5QZAufwNa8lzfjv9": {"description": "oYMXMjlVHY1AHwF3", "localExt": {"vGoav7MK0PcLnEkc": {}, "okKwcQ0baDT9OyJ2": {}, "h23GUS2amU7syGlE": {}}, "longDescription": "lXdEAOrVSnLocLVV", "title": "YamQc4wcG5nDBLJo"}, "JHbiQ5duE5p4cfs2": {"description": "E41cK8QTwiIAvxSv", "localExt": {"NDlmM5nQFMGzs7fz": {}, "jgyc44mEh9tRk8kn": {}, "YSV30lnroQehMDli": {}}, "longDescription": "6t9unQLYXxm09wpG", "title": "AbpEmDY9vLh3u6ED"}}, "lootBoxConfig": {"rewardCount": 38, "rewards": [{"lootBoxItems": [{"count": 35, "duration": 96, "endDate": "1998-04-04T00:00:00Z", "itemId": "Q2Qd2JzRbkF2I03d", "itemSku": "IjvBbA6bfbYaJCJj", "itemType": "fk2TUvn95FhO7VW3"}, {"count": 25, "duration": 3, "endDate": "1987-09-02T00:00:00Z", "itemId": "loFSKWM1eym5ydC6", "itemSku": "p25xCWTqUOYZENJ1", "itemType": "QHZQxPRXH7uxBJEE"}, {"count": 59, "duration": 87, "endDate": "1977-09-05T00:00:00Z", "itemId": "Q5iZgbwwm5iGzXtc", "itemSku": "knrgidKupvXO6aj4", "itemType": "hCmTC34jxW4pIDwd"}], "name": "qXpmRmut9H9XyWI8", "odds": 0.029202859955488547, "type": "REWARD", "weight": 4}, {"lootBoxItems": [{"count": 11, "duration": 86, "endDate": "1996-07-04T00:00:00Z", "itemId": "338HS6CBgVRyihYN", "itemSku": "Z84CVhziXV8HwSmv", "itemType": "cvcDKF19yVRafCjO"}, {"count": 42, "duration": 44, "endDate": "1994-05-15T00:00:00Z", "itemId": "Yht83AdvBaagTiRJ", "itemSku": "8daGTVX3Bb7jlz5I", "itemType": "fHgKjI9mwJSrN8jk"}, {"count": 70, "duration": 50, "endDate": "1992-03-26T00:00:00Z", "itemId": "xLv9HBEUe89AwEw1", "itemSku": "HO4FnKtx4XLKAmlD", "itemType": "r19uJ3nq6VerzVCc"}], "name": "I8y3Cz0YqCKUh5RD", "odds": 0.9916935737880038, "type": "REWARD", "weight": 15}, {"lootBoxItems": [{"count": 81, "duration": 55, "endDate": "1986-05-09T00:00:00Z", "itemId": "p2SoiIPp1yvfAHS0", "itemSku": "VgLu11A3HTovFi4t", "itemType": "PAGfleyCA6jEtcqs"}, {"count": 27, "duration": 68, "endDate": "1984-01-16T00:00:00Z", "itemId": "oVILjkwW61duF87a", "itemSku": "Uyrdt4XSpWBAetsa", "itemType": "nzqP8oxfrtbECD1C"}, {"count": 86, "duration": 87, "endDate": "1982-01-03T00:00:00Z", "itemId": "AxJrINPXppPNO3Af", "itemSku": "mXcgwC3IN6tvKgLB", "itemType": "9QmJIOq9dP5szG71"}], "name": "utjsQ4CrRb9gUCeV", "odds": 0.4162945793236844, "type": "REWARD_GROUP", "weight": 11}], "rollFunction": "DEFAULT"}, "maxCount": 3, "maxCountPerUser": 100, "name": "ZIdhevfZvyV7Acod", "optionBoxConfig": {"boxItems": [{"count": 5, "duration": 54, "endDate": "1997-06-28T00:00:00Z", "itemId": "t2ENKKWrFtHIi1CM", "itemSku": "gKAOG5iDcCR5PbCv", "itemType": "DLil8wj9cKM3Ar6M"}, {"count": 65, "duration": 31, "endDate": "1999-11-21T00:00:00Z", "itemId": "5hCER4nGmWGgTJfH", "itemSku": "lJl4tHGa4XfZcd9C", "itemType": "VnGqMX9FieeEssWE"}, {"count": 96, "duration": 79, "endDate": "1977-06-20T00:00:00Z", "itemId": "7bhwntCVqiYOJf5K", "itemSku": "wMZQjzvjSozv6CTR", "itemType": "Dl0zp9CzHFwinkBN"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 13, "fixedTrialCycles": 68, "graceDays": 44}, "regionData": {"BDdSzBXdxapwhd5I": [{"currencyCode": "QYBQuxLvPuWYvE3f", "currencyNamespace": "sNy9Z9OhxXvCp9y7", "currencyType": "REAL", "discountAmount": 23, "discountExpireAt": "1990-09-01T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1998-11-02T00:00:00Z", "expireAt": "1979-12-11T00:00:00Z", "price": 11, "purchaseAt": "1985-08-21T00:00:00Z", "trialPrice": 38}, {"currencyCode": "XnlUnqxT1WsRNMZc", "currencyNamespace": "A92hzC7MNa8vVe4M", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1989-02-19T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1990-06-23T00:00:00Z", "expireAt": "1973-10-10T00:00:00Z", "price": 31, "purchaseAt": "1978-04-12T00:00:00Z", "trialPrice": 96}, {"currencyCode": "AyyUJyAK5PRMRMwd", "currencyNamespace": "vl0hv6g62GxBW2tQ", "currencyType": "VIRTUAL", "discountAmount": 9, "discountExpireAt": "1976-11-11T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1980-02-24T00:00:00Z", "expireAt": "1992-10-17T00:00:00Z", "price": 5, "purchaseAt": "1971-11-19T00:00:00Z", "trialPrice": 44}], "YvNQOsDa4bkcgepq": [{"currencyCode": "txjbrztee7QLTGAa", "currencyNamespace": "k7Kaol01DK97D2xn", "currencyType": "REAL", "discountAmount": 6, "discountExpireAt": "1976-10-11T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1999-07-23T00:00:00Z", "expireAt": "1977-09-25T00:00:00Z", "price": 17, "purchaseAt": "1993-06-09T00:00:00Z", "trialPrice": 19}, {"currencyCode": "eR5eQAe1rzmmgqBP", "currencyNamespace": "Rmd6mO4oI8KDqebm", "currencyType": "VIRTUAL", "discountAmount": 67, "discountExpireAt": "1971-11-18T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1983-08-10T00:00:00Z", "expireAt": "1999-10-12T00:00:00Z", "price": 31, "purchaseAt": "1974-07-25T00:00:00Z", "trialPrice": 92}, {"currencyCode": "7axEkvI4oxZEDxGi", "currencyNamespace": "BnNbn0zaf7CaOSlH", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1989-11-18T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1979-05-29T00:00:00Z", "expireAt": "1991-11-04T00:00:00Z", "price": 74, "purchaseAt": "1990-07-29T00:00:00Z", "trialPrice": 55}], "IwEsdOGBXBwnzDX8": [{"currencyCode": "v3xgC1Ge9PdbTTAJ", "currencyNamespace": "2Gp1r0sVZ6LJAOdd", "currencyType": "VIRTUAL", "discountAmount": 98, "discountExpireAt": "1976-01-27T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1992-04-12T00:00:00Z", "expireAt": "1975-09-02T00:00:00Z", "price": 81, "purchaseAt": "1972-08-30T00:00:00Z", "trialPrice": 96}, {"currencyCode": "Kv2LWfXqjr8fS79E", "currencyNamespace": "n3wYowBdkaZ3y6i3", "currencyType": "REAL", "discountAmount": 78, "discountExpireAt": "1982-08-27T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1993-12-04T00:00:00Z", "expireAt": "1979-03-28T00:00:00Z", "price": 48, "purchaseAt": "1978-03-17T00:00:00Z", "trialPrice": 18}, {"currencyCode": "1LyEirURERnEMzpI", "currencyNamespace": "mW6sjAHyCK5tNanG", "currencyType": "VIRTUAL", "discountAmount": 47, "discountExpireAt": "1980-03-25T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1975-10-04T00:00:00Z", "expireAt": "1981-09-17T00:00:00Z", "price": 5, "purchaseAt": "1976-10-09T00:00:00Z", "trialPrice": 93}]}, "saleConfig": {"currencyCode": "xTtmOFMebS4AdlNz", "price": 46}, "seasonType": "PASS", "sectionExclusive": true, "sellable": false, "sku": "F5m77TTh4gUoj8u2", "stackable": false, "status": "INACTIVE", "tags": ["LiEtzVlnkflfn7pH", "fnBAk0CwiAsR65yQ", "Y48F1dl1q92m3iRl"], "targetCurrencyCode": "9ssuHdGmxncCEr0K", "targetNamespace": "cgeqzGbruNB72HHM", "thumbnailUrl": "kjzyBB4UFKiaoV0V", "useCount": 82}' \
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
    --sortBy 'displayOrder,updatedAt:asc' \
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
    --sortBy 'displayOrder:asc,updatedAt:desc,updatedAt:asc' \
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
    --body '{"appId": "4acYHbrryHB6GO9z", "appType": "DLC", "baseAppId": "3FaepA3b3YJ9nJM6", "boothName": "vtT27xv85K5MU2qm", "categoryPath": "beqaVemINdClpF7O", "clazz": "vlBIEgjse5kd6GED", "displayOrder": 29, "entitlementType": "CONSUMABLE", "ext": {"08yq5E5HleLoog4m": {}, "e2NBFp62xlXvVcJe": {}, "rTPW02PWsHiKYArA": {}}, "features": ["0DjjwMv4vrIPRtvh", "QIyLarjaLOKnX51y", "xnKBfBfDlrQQuAc1"], "flexible": true, "images": [{"as": "PykS8YLmwtYgWGcA", "caption": "0h4G1LZ1HaX5UBMb", "height": 37, "imageUrl": "X1B9oVuzG2CnYX2Y", "smallImageUrl": "BF2g7TVtzYEHUodh", "width": 28}, {"as": "iUfBthbepUCTWiZ1", "caption": "uqh7GAi4FEIu44u8", "height": 45, "imageUrl": "ZLRxYlYqlpq03BGd", "smallImageUrl": "Ik4oEogFVGR71rJO", "width": 57}, {"as": "iA0tQWlHwBcTtztx", "caption": "3VAl6tXFbnATCzUO", "height": 70, "imageUrl": "WmKgE8CZ4AELr5lr", "smallImageUrl": "aa5v5P5Cj8hgFsqH", "width": 59}], "itemIds": ["adEoIVmprwPsa9YD", "92CX0rITajpwHITG", "eHTnqRbzBB9ZFgJb"], "itemQty": {"Q3Fj1umx4ItzkMJ7": 5, "YsHooOIaxIpb1cIO": 72, "VIQvRkQJAtDUH9tx": 53}, "itemType": "BUNDLE", "listable": true, "localizations": {"hGz1ermJYXsYgL7T": {"description": "fyIlAwjTZdRZJJzW", "localExt": {"ZwvTX2bamSCvX1nw": {}, "vSWdDwD7WJHzgNZU": {}, "KsI5y0mR3zMyTsft": {}}, "longDescription": "KqnsIJctAdxyZVKH", "title": "A9DkaSOWgtg8yw8l"}, "HEbVDwBAqanOlscR": {"description": "IWw82k5K5VTkdubk", "localExt": {"OFldMCQ98JH4n0Jt": {}, "gqzZv5kVu4S95mj8": {}, "YRvae4f4lhBPbarb": {}}, "longDescription": "WEm8bVtZcfVCPdQh", "title": "im9QKUAFTVYelIlG"}, "Jg9wdc8bihhWjfZp": {"description": "fcFBUsnnDJlmD1iE", "localExt": {"okbUiYzCQh2iNTwt": {}, "nohddMzMTQ9P7sYL": {}, "DWAJOA75K4BYJ2fk": {}}, "longDescription": "qYJoF2FI3vyyqRzc", "title": "20O7FdsJP1G9tyBT"}}, "lootBoxConfig": {"rewardCount": 12, "rewards": [{"lootBoxItems": [{"count": 29, "duration": 62, "endDate": "1974-12-25T00:00:00Z", "itemId": "KzuMYDUTLBeCidXj", "itemSku": "uGgx8ncXejmeZtzT", "itemType": "0qj0ltsqfiZrthVv"}, {"count": 49, "duration": 98, "endDate": "1996-08-18T00:00:00Z", "itemId": "0OCKDJE3RMUddwSS", "itemSku": "gxCu8zru1DhGAYOH", "itemType": "R5BWa9VzIkaQEl1i"}, {"count": 95, "duration": 8, "endDate": "1992-10-30T00:00:00Z", "itemId": "roNB6hI6IpGcToWg", "itemSku": "FvdRhG9NwV3zDuqV", "itemType": "lVTypcYPK8IxrSZu"}], "name": "xWl0Je4fJIyFAm3D", "odds": 0.6841347009700219, "type": "PROBABILITY_GROUP", "weight": 89}, {"lootBoxItems": [{"count": 40, "duration": 54, "endDate": "1989-01-10T00:00:00Z", "itemId": "wnPS2urJqerobWMZ", "itemSku": "GVL5KLTxahWlS6Xd", "itemType": "BaKSLCgOOPXM6XTU"}, {"count": 15, "duration": 72, "endDate": "1999-03-31T00:00:00Z", "itemId": "dJ90yqHDNacl4F9G", "itemSku": "6Dl5TFwBY6HKXAbl", "itemType": "kT8VGgSH8MGZGwiV"}, {"count": 19, "duration": 33, "endDate": "1973-09-04T00:00:00Z", "itemId": "RLaA643nTMtXSAye", "itemSku": "jnny0Ju13b6o5uB2", "itemType": "XM6IHy7EEvHyLmcv"}], "name": "rZZOdwe1x8RjU6Bi", "odds": 0.9781327863012951, "type": "REWARD_GROUP", "weight": 10}, {"lootBoxItems": [{"count": 71, "duration": 63, "endDate": "1987-03-09T00:00:00Z", "itemId": "2sUBBq2SimQQoLbe", "itemSku": "5YOJvxGRxUzrTwag", "itemType": "H7BMT1IZKTdNFVBQ"}, {"count": 55, "duration": 4, "endDate": "1983-05-20T00:00:00Z", "itemId": "2JTllJkRGB8jqJEd", "itemSku": "6eqqsBVyONV0JRto", "itemType": "zI0jpliCFQ6WgJpG"}, {"count": 84, "duration": 18, "endDate": "1981-02-18T00:00:00Z", "itemId": "BYeQZOzATNSV9E9y", "itemSku": "yNb7yaLXzAVYymOu", "itemType": "hCkZu4htrsf8eIFS"}], "name": "ovTGXaMsq8ePN1oc", "odds": 0.23324146460862305, "type": "REWARD_GROUP", "weight": 20}], "rollFunction": "CUSTOM"}, "maxCount": 48, "maxCountPerUser": 5, "name": "Upe8SjMvpqM8pugg", "optionBoxConfig": {"boxItems": [{"count": 83, "duration": 63, "endDate": "1976-01-30T00:00:00Z", "itemId": "9iCqfW6rqGOQny4i", "itemSku": "j4ysYPonb59gQffk", "itemType": "NOmubxEJr2qEAuJb"}, {"count": 32, "duration": 44, "endDate": "1997-09-02T00:00:00Z", "itemId": "Srcbc4LWfKaY5c1t", "itemSku": "P5TDuI5f6m4KC07C", "itemType": "nsZe32hqEcB1ExYM"}, {"count": 56, "duration": 3, "endDate": "1997-11-26T00:00:00Z", "itemId": "ckvoaJYdMqGegcg3", "itemSku": "eRvBZXN3cjIXmFWR", "itemType": "Jnj8xN7HDPTUEDPN"}]}, "purchasable": false, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 94, "fixedTrialCycles": 16, "graceDays": 84}, "regionData": {"C9ZDj4E4mv12FNXy": [{"currencyCode": "poOLl13j84P0Kqir", "currencyNamespace": "J4PkMFtsnFfz8Ew0", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1973-08-17T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1981-04-12T00:00:00Z", "expireAt": "1985-12-10T00:00:00Z", "price": 91, "purchaseAt": "1987-10-29T00:00:00Z", "trialPrice": 0}, {"currencyCode": "LSQ4GvLtz50D3rpB", "currencyNamespace": "fBovqLwXBuT30EYe", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1997-06-17T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1985-09-20T00:00:00Z", "expireAt": "1993-02-25T00:00:00Z", "price": 1, "purchaseAt": "1982-08-16T00:00:00Z", "trialPrice": 72}, {"currencyCode": "KoUfiHjGmCyPsKCJ", "currencyNamespace": "Tv1ic9gvagF2cSuz", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1980-03-21T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1993-06-07T00:00:00Z", "expireAt": "1981-03-17T00:00:00Z", "price": 39, "purchaseAt": "1984-02-19T00:00:00Z", "trialPrice": 79}], "V7nmDk29mcjSuz9v": [{"currencyCode": "bNStqPtQmQN6eKAG", "currencyNamespace": "iZFCftT0RWECdjWY", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1977-11-19T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1980-04-02T00:00:00Z", "expireAt": "1972-07-11T00:00:00Z", "price": 30, "purchaseAt": "1972-02-16T00:00:00Z", "trialPrice": 57}, {"currencyCode": "wYLQcDvkaEIIPoJT", "currencyNamespace": "83zEGXmVBZLyrH9J", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1978-07-21T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1998-04-10T00:00:00Z", "expireAt": "1979-01-06T00:00:00Z", "price": 83, "purchaseAt": "1987-12-26T00:00:00Z", "trialPrice": 55}, {"currencyCode": "LkP5hc2Fh04JTsqD", "currencyNamespace": "TynCewqJligLlRxO", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1976-03-08T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1972-07-26T00:00:00Z", "expireAt": "1996-03-25T00:00:00Z", "price": 70, "purchaseAt": "1996-08-16T00:00:00Z", "trialPrice": 51}], "RxF6HtlER2txs4qr": [{"currencyCode": "NARATn6KXOutlYBb", "currencyNamespace": "LhL8KXx25FZfQIod", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1982-05-17T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1992-02-07T00:00:00Z", "expireAt": "1980-08-10T00:00:00Z", "price": 22, "purchaseAt": "1979-12-05T00:00:00Z", "trialPrice": 59}, {"currencyCode": "y0fGvTGgfLKsg0b1", "currencyNamespace": "Bq78cE5O5pmPnbiP", "currencyType": "REAL", "discountAmount": 1, "discountExpireAt": "1976-04-18T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1982-12-26T00:00:00Z", "expireAt": "1983-04-11T00:00:00Z", "price": 2, "purchaseAt": "1979-10-02T00:00:00Z", "trialPrice": 24}, {"currencyCode": "3rVaauufxkPHElug", "currencyNamespace": "48TgfNu0rqXUOyTo", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1994-09-02T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1976-10-12T00:00:00Z", "expireAt": "1986-10-27T00:00:00Z", "price": 94, "purchaseAt": "1977-07-19T00:00:00Z", "trialPrice": 72}]}, "saleConfig": {"currencyCode": "Pl3dKF7NXEjrJMki", "price": 67}, "seasonType": "PASS", "sectionExclusive": true, "sellable": true, "sku": "bADMfuOmh0lciRhV", "stackable": false, "status": "INACTIVE", "tags": ["NgdY2vfJuje5cPnm", "KqxJiFJdrmj5vhzg", "sJwex7wq8ZPlXNaU"], "targetCurrencyCode": "GjTvYa5Pqx1K7qcA", "targetNamespace": "oijBPAp6EPb988Nz", "thumbnailUrl": "xrDKVpULjjiw3NeV", "useCount": 66}' \
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
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 85, "comparison": "isGreaterThanOrEqual", "name": "yhqFJkDClOsKmfsg", "predicateType": "SeasonTierPredicate", "value": "VLMlHi8i9gOVqajU", "values": ["nnGeZsZVgbPzPFbr", "OMZMgWkFN7Tpkx6G", "WrgEsWDtaKzn8dZw"]}, {"anyOf": 5, "comparison": "includes", "name": "XTrFibRAhzzEWzWl", "predicateType": "SeasonTierPredicate", "value": "dW2JKmQafUs2bxYz", "values": ["tOEyVbKIf1ZbzgUw", "lg7gYs6unPYQ9jNQ", "d8DHoCQykmXHYmkR"]}, {"anyOf": 81, "comparison": "isLessThan", "name": "1di1ldhOh6HvjnYu", "predicateType": "EntitlementPredicate", "value": "NfC4A2ODiZhbfb8Q", "values": ["mnq3FGQn3Ahu5wxq", "FfgK46GjCWaP8huT", "qCyK1XH9D6vl5eFd"]}]}, {"operator": "and", "predicates": [{"anyOf": 30, "comparison": "isLessThan", "name": "Jq4mChmQHQhO9IKB", "predicateType": "EntitlementPredicate", "value": "DFQfXFD58sG6uDhF", "values": ["YlrzJBYSeMuJfQec", "MKclr5igjNTVItrH", "utjS029BiJWOG1m7"]}, {"anyOf": 66, "comparison": "isGreaterThan", "name": "hxJgaVfw5Vnyq8Oz", "predicateType": "SeasonTierPredicate", "value": "c6VbE0AGcekjMNHu", "values": ["t1g0GGbT4Hf2PPKO", "PXtz8tXxrmzafMUg", "uyDoN91uc28HoSpG"]}, {"anyOf": 23, "comparison": "excludes", "name": "GGvi9kg3rMIzNmhJ", "predicateType": "SeasonTierPredicate", "value": "eg9q86IaDFjjx6uZ", "values": ["E8lOLAfTXKLzbrdd", "erWbtwTX9gNRByjb", "qcKLa7LevxNHOSEh"]}]}, {"operator": "and", "predicates": [{"anyOf": 23, "comparison": "isGreaterThan", "name": "p693lRwtc43atCuC", "predicateType": "SeasonTierPredicate", "value": "X4yFQFdrRoM6FoqC", "values": ["ji329PfVrvMEPtps", "Yw7AlxO6qdFpc71s", "Sck3ggZWJlSlCQMD"]}, {"anyOf": 90, "comparison": "isGreaterThan", "name": "NcpK1QkB2Sy8Ww79", "predicateType": "SeasonTierPredicate", "value": "HuGz3b5WAEvdRF9b", "values": ["7OydVw0zCqoMZvpI", "OO97DmQ5ZOzx6iCJ", "qMj4ro5B19VE838c"]}, {"anyOf": 93, "comparison": "isLessThanOrEqual", "name": "u60IifzMhkk5Pxsj", "predicateType": "SeasonPassPredicate", "value": "7VbBPUWipz9C05Ya", "values": ["tER1qdTelFAadM9y", "aO3yJpA3KMxBlrRy", "bFX4FCK5ucTFsAFz"]}]}]}}' \
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
    --sortBy 'updatedAt,updatedAt:desc,createdAt:asc' \
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

#- 206 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Xbox", "count": 42, "currencyCode": "5rghZwGhdZJkkGhY", "expireAt": "1981-01-11T00:00:00Z"}, "debitPayload": {"count": 67, "currencyCode": "MIyaEMEqOpwetb82", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 66, "itemIdentity": "96rsH73hRfDgl29G", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 31, "entitlementId": "NyLkfPQPmjUkvSs5"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 80, "currencyCode": "IejozmG5HlrIfMAv", "expireAt": "1982-05-03T00:00:00Z"}, "debitPayload": {"count": 31, "currencyCode": "hhU315LUC6HSMQ32", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 58, "itemIdentity": "nXNd6ve29lqqtcLJ", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 2, "entitlementId": "TJvKNDFrx6LabyDn"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 19, "currencyCode": "KJ05puX3197WrMnJ", "expireAt": "1981-04-21T00:00:00Z"}, "debitPayload": {"count": 29, "currencyCode": "W4ugGX6mKBbgTD9x", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 40, "itemIdentity": "7ZzzIs3Jke34ZAUu", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 98, "entitlementId": "oMLnemwKAvgDXNrF"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "MH5Tu1ky1ZYvyeHm"}, {"operations": [{"creditPayload": {"balanceOrigin": "GooglePlay", "count": 28, "currencyCode": "efmEVcW7mxbS5UOo", "expireAt": "1988-06-23T00:00:00Z"}, "debitPayload": {"count": 59, "currencyCode": "uvpsDJXPCWkX4Kpi", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 58, "itemIdentity": "RE5pS85yTIRWvLRy", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 74, "entitlementId": "biRq5Juikmpat75r"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Epic", "count": 10, "currencyCode": "N9ZBtzJ33tCwv8H1", "expireAt": "1973-09-08T00:00:00Z"}, "debitPayload": {"count": 77, "currencyCode": "1FVZ630HNBYZSrz7", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 52, "itemIdentity": "MjESLLMPKDXLki6O", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 78, "entitlementId": "5Bygt8Q0RjSf1srB"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 68, "currencyCode": "WUFqTooGGnPEgY0t", "expireAt": "1993-12-13T00:00:00Z"}, "debitPayload": {"count": 100, "currencyCode": "hFMdzryvhc1YjHmm", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 50, "itemIdentity": "lSBIElc2CdRvBb0a", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 28, "entitlementId": "JSu2pUIIuPLFAtcW"}, "type": "DEBIT_WALLET"}], "userId": "rjV7XJUOtHlzXNHE"}, {"operations": [{"creditPayload": {"balanceOrigin": "Xbox", "count": 85, "currencyCode": "pzlMlx7b2H2THLwZ", "expireAt": "1987-12-24T00:00:00Z"}, "debitPayload": {"count": 17, "currencyCode": "tQOILcaDqUITBHQR", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 70, "itemIdentity": "cVOhPJIcEHbiKHW7", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 95, "entitlementId": "lVolAWEMmQSPDTRq"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 24, "currencyCode": "3GW0CY0vAfbq8xoC", "expireAt": "1981-05-26T00:00:00Z"}, "debitPayload": {"count": 86, "currencyCode": "q4lpHXrbVBh60NUA", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 71, "itemIdentity": "KQwnXrmi6ya8u4sQ", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 47, "entitlementId": "af1AcweR7tJW3MLM"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Epic", "count": 18, "currencyCode": "hUnIzIpUM8KK1kGF", "expireAt": "1991-04-20T00:00:00Z"}, "debitPayload": {"count": 82, "currencyCode": "E9Gk51kOTJZluTek", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 55, "itemIdentity": "MCGUJvERxNg8djSb", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 0, "entitlementId": "2vKQ5vlCdI519Pf2"}, "type": "DEBIT_WALLET"}], "userId": "przahPB0FKMa0Yey"}], "metadata": {"NBQWUHDBnBeePkqg": {}, "6Zt1Lr5BlO8K6LH4": {}, "dSaa8XYHug51ZTog": {}}, "needPreCheck": true, "transactionId": "0N7Hvnuq1kJ1kpHc", "type": "QtnIc9z70LFQMI0o"}' \
    > test.out 2>&1
eval_tap $? 206 'Commit' test.out

#- 207 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '42' \
    --status 'SUCCESS' \
    --type 'EjY0rNBbbB9txAvt' \
    --userId 'RQvqJacXR2Rf4noX' \
    > test.out 2>&1
eval_tap $? 207 'GetTradeHistoryByCriteria' test.out

#- 208 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'DFaEUkPUBnB0ZEJH' \
    > test.out 2>&1
eval_tap $? 208 'GetTradeHistoryByTransactionId' test.out

#- 209 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '3ebM71Tg922xiBgH' \
    --body '{"achievements": [{"id": "Ska0Pz7I1WkIa0oZ", "value": 28}, {"id": "dGHMeoi5DBOsQ0Ga", "value": 49}, {"id": "ghHyMEHBzArbyW10", "value": 80}], "steamUserId": "nSHhxNmCe4txY0Ms"}' \
    > test.out 2>&1
eval_tap $? 209 'UnlockSteamUserAchievement' test.out

#- 210 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pc9EMgf9JCJiEvhL' \
    --xboxUserId '8ZfwCVJW9yspUOyH' \
    > test.out 2>&1
eval_tap $? 210 'GetXblUserAchievements' test.out

#- 211 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'C9eKeXzrvzBllwzy' \
    --body '{"achievements": [{"id": "C1aTWEmPgoy4TkpE", "percentComplete": 46}, {"id": "M24F3celFgM62HQt", "percentComplete": 13}, {"id": "kMQVjKk3bWJ0ZuYS", "percentComplete": 9}], "serviceConfigId": "bn8vmfMYGLt1AjKh", "titleId": "h3JMX7xSrz1EH6X2", "xboxUserId": "SM3xzsNrJzWBcdFl"}' \
    > test.out 2>&1
eval_tap $? 211 'UpdateXblUserAchievement' test.out

#- 212 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'o7oAsOlfLB1J19b5' \
    > test.out 2>&1
eval_tap $? 212 'AnonymizeCampaign' test.out

#- 213 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'rTfiL2P3r1a8KIJH' \
    > test.out 2>&1
eval_tap $? 213 'AnonymizeEntitlement' test.out

#- 214 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId '33aKkPuWD59MgTy1' \
    > test.out 2>&1
eval_tap $? 214 'AnonymizeFulfillment' test.out

#- 215 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'HA58Jt5NaROjSKFE' \
    > test.out 2>&1
eval_tap $? 215 'AnonymizeIntegration' test.out

#- 216 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'uZo2ElXYSS4ezBRS' \
    > test.out 2>&1
eval_tap $? 216 'AnonymizeOrder' test.out

#- 217 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'iOyReviDaxlPdhwm' \
    > test.out 2>&1
eval_tap $? 217 'AnonymizePayment' test.out

#- 218 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'cH03yoMxzRR6xd9r' \
    > test.out 2>&1
eval_tap $? 218 'AnonymizeRevocation' test.out

#- 219 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'Th3ureaIbxM3Wev9' \
    > test.out 2>&1
eval_tap $? 219 'AnonymizeSubscription' test.out

#- 220 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'pZQjWAN0tny16ZHZ' \
    > test.out 2>&1
eval_tap $? 220 'AnonymizeWallet' test.out

#- 221 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'tuSJGQCrM7JEMRPk' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 221 'GetUserDLCByPlatform' test.out

#- 222 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'sLmP70LxN0f3JA27' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 222 'GetUserDLC' test.out

#- 223 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'vUKMuIiz2MiAAKcv' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'XnxnH0QIhoJRY807' \
    --features 'VmBT4wZXQZZrSsuY,iIPei0pXglJYnKko,CAZuolAWnxkImVbD' \
    --itemId 'P0QX31gI7VmnGIRM,vXe6BiphIFe2bzr6,qQw6fSESkM19OPMB' \
    --limit '3' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 223 'QueryUserEntitlements' test.out

#- 224 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '12gpmShlmIt2nfhU' \
    --body '[{"endDate": "1971-01-14T00:00:00Z", "grantedCode": "Gqjslu59GT2E6Aac", "itemId": "mZRXZm626POXWVj3", "itemNamespace": "KP1mX0iYHXBU3Uk2", "language": "wrP_698", "quantity": 73, "region": "nLYDAAg1YA4kZURm", "source": "OTHER", "startDate": "1993-09-20T00:00:00Z", "storeId": "RFLDSdj8elbtHvDU"}, {"endDate": "1994-06-05T00:00:00Z", "grantedCode": "DmHzwiqVPCJ5j18O", "itemId": "u3aY8nceFU5GKmcE", "itemNamespace": "Kp8AQwqgJs6O0Qj0", "language": "iC_sakD-654", "quantity": 20, "region": "p4O9XSjap24esyjh", "source": "OTHER", "startDate": "1995-02-17T00:00:00Z", "storeId": "c3migf2n6iQyr5cb"}, {"endDate": "1974-11-06T00:00:00Z", "grantedCode": "cFT0gHAkltcR3eHF", "itemId": "biAluHv7Hssd05pH", "itemNamespace": "BJX5ln8PZbYVD8Ri", "language": "Pu_UeQv", "quantity": 69, "region": "3kSbTkHPMUvOAUXk", "source": "PURCHASE", "startDate": "1998-09-12T00:00:00Z", "storeId": "cr2WJQqS7Tq4YIyZ"}]' \
    > test.out 2>&1
eval_tap $? 224 'GrantUserEntitlement' test.out

#- 225 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'AFQ6lZfa2jdNvpWf' \
    --activeOnly  \
    --appId '32JS1av9VNpVLT0L' \
    > test.out 2>&1
eval_tap $? 225 'GetUserAppEntitlementByAppId' test.out

#- 226 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'vqcfSdO1nAjY5FvA' \
    --activeOnly  \
    --limit '61' \
    --offset '3' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 226 'QueryUserEntitlementsByAppType' test.out

#- 227 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '3GUQgci632w6LUrH' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'XSh0Z3SWISs1dYrJ' \
    > test.out 2>&1
eval_tap $? 227 'GetUserEntitlementByItemId' test.out

#- 228 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kmx1BT6iLFQejNZJ' \
    --ids 'NF2hm0TqBQprHn3w,hPKU5abnqw8fFa30,pVbhr1BHh1arZAyu' \
    > test.out 2>&1
eval_tap $? 228 'GetUserActiveEntitlementsByItemIds' test.out

#- 229 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'LcZoEkPpqKhP2jWn' \
    --activeOnly  \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'MDPRI2cCk8zHR8Vy' \
    > test.out 2>&1
eval_tap $? 229 'GetUserEntitlementBySku' test.out

#- 230 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'CC0EQwE0cXokXbwK' \
    --appIds 'DtVmrYQu7hZvHfiT,9s9pK8HuUY1QQHQ0,NCEddJtx6GV01vD7' \
    --itemIds 'lNLxlpvqaB9P9Gau,kfCEIeSBLhTfzigz,HcRuJgYaj4I8Dzyh' \
    --skus '1N0JEKNoMtHvjM7X,1fjzknv2HZMIL2P2,bh14LroFTnAuujPe' \
    > test.out 2>&1
eval_tap $? 230 'ExistsAnyUserActiveEntitlement' test.out

#- 231 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'P9N0vdVB5a2XkS3X' \
    --itemIds 'QfMuzZh4AhZRe2hg,U56xtyJtnbTDXu7F,bleSP5PcdOuq0m0r' \
    > test.out 2>&1
eval_tap $? 231 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 232 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'vakR8rcwojLRjhca' \
    --appId 'J56nGlYZ2tod2BGB' \
    > test.out 2>&1
eval_tap $? 232 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 233 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'XjNyRCtPOr1FU3QZ' \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'qQ0gcNeTflyvUh3w' \
    > test.out 2>&1
eval_tap $? 233 'GetUserEntitlementOwnershipByItemId' test.out

#- 234 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '5ZtfwmOCKpFSMF0t' \
    --ids 'fGIZCTNiIRc9fEjk,ZhEpAJMCxMp2J0hD,g2kMgkvhoQe9gD9t' \
    > test.out 2>&1
eval_tap $? 234 'GetUserEntitlementOwnershipByItemIds' test.out

#- 235 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'GN0nE7M36mI9u3Ee' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'k60SzCqUgq1gLbcI' \
    > test.out 2>&1
eval_tap $? 235 'GetUserEntitlementOwnershipBySku' test.out

#- 236 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'MevTmC631p7q794b' \
    > test.out 2>&1
eval_tap $? 236 'RevokeAllEntitlements' test.out

#- 237 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'u49lINFTtERAXT2h' \
    --entitlementIds '3hcQ2wV3ZbBTnNQn' \
    > test.out 2>&1
eval_tap $? 237 'RevokeUserEntitlements' test.out

#- 238 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'VUhA5WnzVZdj8tsy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zC4QaLXp3o4TDraE' \
    > test.out 2>&1
eval_tap $? 238 'GetUserEntitlement' test.out

#- 239 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'EaDNJbVd20FVHevC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jthJUb7jKuMrFaoL' \
    --body '{"endDate": "1981-07-09T00:00:00Z", "nullFieldList": ["lzp3sZxImVK5yh2L", "cM8LaMW0ByjsRUrA", "HNRkIcC4wNFzsbrt"], "startDate": "1997-09-17T00:00:00Z", "status": "INACTIVE", "useCount": 53}' \
    > test.out 2>&1
eval_tap $? 239 'UpdateUserEntitlement' test.out

#- 240 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'Lh56AWXoMiowdWSs' \
    --namespace "$AB_NAMESPACE" \
    --userId '9DQ0VU1HED9CGo9a' \
    --body '{"options": ["UXj3rh0UyqxVWlIM", "Y5tTJw4KV104MtMh", "KHmSjqPuQZX5KjdN"], "requestId": "rEwfWo2MwulLg4bs", "useCount": 83}' \
    > test.out 2>&1
eval_tap $? 240 'ConsumeUserEntitlement' test.out

#- 241 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'IGamRCARuFLx4rV4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CXVMrDYKe2eTf1ax' \
    > test.out 2>&1
eval_tap $? 241 'DisableUserEntitlement' test.out

#- 242 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'o16GqT2vSLLiMvcu' \
    --namespace "$AB_NAMESPACE" \
    --userId '39YZJypWzpNXgnoK' \
    > test.out 2>&1
eval_tap $? 242 'EnableUserEntitlement' test.out

#- 243 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'Iz8O8NglJtZTh280' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vflFMxIhlIT8AgyZ' \
    > test.out 2>&1
eval_tap $? 243 'GetUserEntitlementHistories' test.out

#- 244 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'J16MMd2bzOrTn2hu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wPgyUzBUWiKoNGtv' \
    > test.out 2>&1
eval_tap $? 244 'RevokeUserEntitlement' test.out

#- 245 RevokeUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUseCount \
    --entitlementId 'yk5xEfrJDxKsw5Xl' \
    --namespace "$AB_NAMESPACE" \
    --userId '7ZZrDZdbuvCFBaVc' \
    --body '{"reason": "ohewKkVuGv9fQXkE", "useCount": 35}' \
    > test.out 2>&1
eval_tap $? 245 'RevokeUseCount' test.out

#- 246 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'SEanfUYrMU6A43UK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GpvC1cr5T1PSXhdu' \
    --body '{"requestId": "TWchzXDv3TAtBjP4", "useCount": 68}' \
    > test.out 2>&1
eval_tap $? 246 'SellUserEntitlement' test.out

#- 247 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '7atn9EQv2Oj8TFNe' \
    --body '{"duration": 66, "endDate": "1981-05-09T00:00:00Z", "itemId": "JGjKbMgCeuAYuzrm", "itemSku": "bWofEaKStqdKu4RO", "language": "nONpJ849chqeiUGQ", "metadata": {"MwNwDlYSli3p8YaA": {}, "del3hHMSLAiscGRW": {}, "zkCl1ZKuPxjDUGRG": {}}, "order": {"currency": {"currencyCode": "cCEPjbUy7F82Adu9", "currencySymbol": "BYRHrVTehrqgvEtE", "currencyType": "VIRTUAL", "decimals": 74, "namespace": "2LpE0qfbvdU8hlDo"}, "ext": {"C9FnxqBlPBYJ7X6u": {}, "Vy7FWTSfMi2CPVGx": {}, "jcdpdCqVeePMSqb8": {}}, "free": true}, "orderNo": "6Pysv4VPaZWolXyp", "origin": "Other", "overrideBundleItemQty": {"D9YsPeDWrAVQZSvg": 100, "uqNcig6YcDA8Z3g6": 30, "uQHKersDmJLUHAKt": 10}, "quantity": 20, "region": "XCKOna8DdjtZhh6o", "source": "DLC", "startDate": "1982-05-29T00:00:00Z", "storeId": "dCpVpnENiTc9NESV"}' \
    > test.out 2>&1
eval_tap $? 247 'FulfillItem' test.out

#- 248 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '22eRBElD4K2Cy1tJ' \
    --body '{"code": "cPAEkCeV29QsQk10", "language": "Ff_wVCi_425", "region": "zEpw1zN0mOYgGhHM"}' \
    > test.out 2>&1
eval_tap $? 248 'RedeemCode' test.out

#- 249 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'z9dddLWJWDuSYtCa' \
    --body '{"metadata": {"Iv4Lp91wYUJPbvzn": {}, "8TYoMDAaUXSuBQdv": {}, "dhJoT0WK5ngNUxDK": {}}, "origin": "GooglePlay", "rewards": [{"currency": {"currencyCode": "sz24fQKDZX6plErw", "namespace": "0Gb0ceCbphW4YMhJ"}, "item": {"itemId": "0S50bez9ZLHW882r", "itemSku": "iiPfRQ3rJ0f5lwXv", "itemType": "RNDBnmL1KQn77hiP"}, "quantity": 93, "type": "CURRENCY"}, {"currency": {"currencyCode": "ugVWXz8dv7BiEUqn", "namespace": "zxs2deMF8UAJIHEZ"}, "item": {"itemId": "v5zyUUyNJkvA5xF3", "itemSku": "zHtZSd3QzXhkrN4p", "itemType": "Wryt4XTNwpp0ni1Y"}, "quantity": 11, "type": "ITEM"}, {"currency": {"currencyCode": "IgLZ4YIzElrLZOBL", "namespace": "HCKmLBaIwlokbAFW"}, "item": {"itemId": "8RgBUwBL28BqM8Uz", "itemSku": "vKqeoTiNKGRUMrim", "itemType": "GAz6OhmHOpCdr3Wz"}, "quantity": 61, "type": "ITEM"}], "source": "IAP_CHARGEBACK_REVERSED", "transactionId": "11FuU8iXCRz8Kgqg"}' \
    > test.out 2>&1
eval_tap $? 249 'FulfillRewards' test.out

#- 250 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'wijYxpGhsFArq6lo' \
    --endTime 'lbj7QKvtVRCPMjr5' \
    --limit '79' \
    --offset '9' \
    --productId '3vw1GqUjjFp6R8mY' \
    --startTime 'ZwKftVqSECsypS42' \
    --status 'VERIFIED' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 250 'QueryUserIAPOrders' test.out

#- 251 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'PHcN9drwqytieXpI' \
    > test.out 2>&1
eval_tap $? 251 'QueryAllUserIAPOrders' test.out

#- 252 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zfr5XDq9dGLHjtgE' \
    --endTime '2bTXJxCCFqPNDqWr' \
    --limit '32' \
    --offset '81' \
    --startTime 'kWnnova15WVuE5cY' \
    --status 'SUCCESS' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 252 'QueryUserIAPConsumeHistory' test.out

#- 253 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '9tQSa27BnPyq3I1B' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "mfma_Kzer", "productId": "UofJXK8RGS0zCYRV", "region": "mbfzwUmsy0stUmKd", "transactionId": "XiiTObNdqkWa13g3", "type": "OCULUS"}' \
    > test.out 2>&1
eval_tap $? 253 'MockFulfillIAPItem' test.out

#- 254 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'xmh5QWxuQuI7gdDT' \
    --itemId 'Db3WdnOpzTrRzCCa' \
    --limit '10' \
    --offset '63' \
    --status 'FULFILL_FAILED' \
    > test.out 2>&1
eval_tap $? 254 'QueryUserOrders' test.out

#- 255 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'HcI95GGdJvucDbs6' \
    --body '{"currencyCode": "UdccuM2ykRj3WnyA", "currencyNamespace": "aUaQBKFedL2uduXv", "discountedPrice": 11, "ext": {"UbQQ13FhD3NExUFi": {}, "pJsUiDawAjgHFQk0": {}, "VzWRNFNiUn2yXMSC": {}}, "itemId": "cHADYpS861c0CJ7L", "language": "zpFvOSF6xKA6yrnv", "options": {"skipPriceValidation": false}, "platform": "Other", "price": 82, "quantity": 7, "region": "Lc42eq0O6VsXtOlQ", "returnUrl": "wj5xPvm7c5nPR0Y1", "sandbox": true, "sectionId": "EF9FSeg6WYgtfuqJ"}' \
    > test.out 2>&1
eval_tap $? 255 'AdminCreateUserOrder' test.out

#- 256 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hrs4e3RnWR30MdBZ' \
    --itemId 'ezfwc3H0qSbMq4GL' \
    > test.out 2>&1
eval_tap $? 256 'CountOfPurchasedItem' test.out

#- 257 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'j8aGsH0qE5p601ak' \
    --userId '59yFSfdZIv8oYWPU' \
    > test.out 2>&1
eval_tap $? 257 'GetUserOrder' test.out

#- 258 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'S4Zu0SbTt6M2Xizi' \
    --userId 'kCh6q0yq2WAHtL7I' \
    --body '{"status": "CHARGED", "statusReason": "E3MFqvfDG5jvMOaX"}' \
    > test.out 2>&1
eval_tap $? 258 'UpdateUserOrderStatus' test.out

#- 259 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rDlEX42U0syrGNhB' \
    --userId 'mgT2q0kIbrJ2S5Pf' \
    > test.out 2>&1
eval_tap $? 259 'FulfillUserOrder' test.out

#- 260 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo '1Lvg8kYEVylINJpx' \
    --userId 'FY8E6pU8eHjh0aTj' \
    > test.out 2>&1
eval_tap $? 260 'GetUserOrderGrant' test.out

#- 261 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'IOaQt0snbE0yMvqF' \
    --userId '7TJ9uB0zypjJiu7B' \
    > test.out 2>&1
eval_tap $? 261 'GetUserOrderHistories' test.out

#- 262 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'IimNuwB3hBVhuSMH' \
    --userId 'hf5R2MkxQTAYGfE6' \
    --body '{"additionalData": {"cardSummary": "hXZ7XLoWCGf0dZEe"}, "authorisedTime": "1996-08-10T00:00:00Z", "chargebackReversedTime": "1979-01-25T00:00:00Z", "chargebackTime": "1988-04-12T00:00:00Z", "chargedTime": "1981-09-25T00:00:00Z", "createdTime": "1981-09-21T00:00:00Z", "currency": {"currencyCode": "edbBOd19DqZJRYV1", "currencySymbol": "oqNLmPAUIMwa2wYq", "currencyType": "REAL", "decimals": 61, "namespace": "APXBCfkE1Fb0y94e"}, "customParameters": {"P7yh0zsKhR60HZwU": {}, "wk48XK7MXHbEwAvv": {}, "pEeHhXiJcJqYSxVK": {}}, "extOrderNo": "UYMimVLzAP6aOzsT", "extTxId": "qEFXUhGAwpYq1UqZ", "extUserId": "ydOB0MThZW6LwcAg", "issuedAt": "1973-08-19T00:00:00Z", "metadata": {"4AWpyiKVT3OvEujx": "5yjtQSCJaOHzpb62", "3EciYoYOPVg6DLEZ": "6DxpwBm2N8PdQ5mQ", "aGXEbnmWR0H3EkrH": "qaLNdfKszYZzOg11"}, "namespace": "3h6fIaHSx5bClxUO", "nonceStr": "BmMwv5pmiIVnhlLo", "paymentMethod": "Memsp7o3F2LQw7Y2", "paymentMethodFee": 99, "paymentOrderNo": "DwflNGfufW5cWeg6", "paymentProvider": "ALIPAY", "paymentProviderFee": 97, "paymentStationUrl": "SCypsceITTkJGGCV", "price": 64, "refundedTime": "1982-03-24T00:00:00Z", "salesTax": 78, "sandbox": true, "sku": "HMbJhNwZgf5nlMDO", "status": "REFUND_FAILED", "statusReason": "z1c7ZuZXUCBYnkY0", "subscriptionId": "LEBSYBdUSiTOrhB8", "subtotalPrice": 15, "targetNamespace": "NAVOYqSH533YlJ93", "targetUserId": "CCGBXv4fP4VPzhcH", "tax": 30, "totalPrice": 97, "totalTax": 73, "txEndTime": "1997-05-23T00:00:00Z", "type": "nL1Zg2JfH4f73jAe", "userId": "vOnES6YJLlb2AfUE", "vat": 63}' \
    > test.out 2>&1
eval_tap $? 262 'ProcessUserOrderNotification' test.out

#- 263 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'HIqK5PT404mFw4HJ' \
    --userId 'v5T2kIQOecfLsYKT' \
    > test.out 2>&1
eval_tap $? 263 'DownloadUserOrderReceipt' test.out

#- 264 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'mUnKlrOsJmEwjGYN' \
    --body '{"currencyCode": "8VNPXNsmwTV8imJH", "currencyNamespace": "NI0l6jJVzF1Oi2sQ", "customParameters": {"uWUBBHZonSmzF831": {}, "vlCiZAZHCWMXxVh8": {}, "HTrKqVwnpPn8N5xM": {}}, "description": "RgU7cPqNZrLCRRUy", "extOrderNo": "sya4J3rvTzMTMSwr", "extUserId": "Nov2GW9i54JY23AU", "itemType": "COINS", "language": "ivrm_yWWl-423", "metadata": {"ddhAQ1pwqnybvUIf": "uulmeegRwPPbn7lt", "td21cS6IVE4fzwG3": "BHaRcZ8NK4gkLmvE", "OaRcqTgF0xtQAXoD": "oFkmA3fgzcwdgJMj"}, "notifyUrl": "IyGfiNBQy41M1gzG", "omitNotification": true, "platform": "St4v8ry8IyqNVv0K", "price": 97, "recurringPaymentOrderNo": "FMTbQaANJOODGerD", "region": "CWcl3VSJENQopeHD", "returnUrl": "6iKBGm5Cj7RqnJUm", "sandbox": false, "sku": "roOeqE7fcCAeExeQ", "subscriptionId": "X43LpmdMiZeyIrA4", "title": "QUKSJgECzvaWUCA7"}' \
    > test.out 2>&1
eval_tap $? 264 'CreateUserPaymentOrder' test.out

#- 265 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'wKru7ry3AQ2sEHvS' \
    --userId 'xjWoM1rNJLM0OOVG' \
    --body '{"description": "5cG6XxENbWqlX7id"}' \
    > test.out 2>&1
eval_tap $? 265 'RefundUserPaymentOrder' test.out

#- 266 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'zjpKDfwl6XlCF6Yx' \
    --body '{"code": "FMD8tJQwZvUVInos", "orderNo": "5RK100yH89i8ZDPX"}' \
    > test.out 2>&1
eval_tap $? 266 'ApplyUserRedemption' test.out

#- 267 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'RL8cbTAntB1STaab' \
    --body '{"meta": {"1UeibXg7RCe5BtKc": {}, "wj6PqqOgCimr3ZQN": {}, "BBkrXu9czsYr3cFe": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Other", "currencyCode": "w70xdNTuOdLKK0M2", "namespace": "B2hbqJin37P69t1K"}, "entitlement": {"entitlementId": "qeGz7qbPnXEuOzzk"}, "item": {"itemIdentity": "oBmMR9C4qPqJrAdh", "itemIdentityType": "ITEM_ID", "origin": "System"}, "quantity": 52, "type": "ITEM"}, {"currency": {"balanceOrigin": "IOS", "currencyCode": "mFkyxoUzfMFoXCOg", "namespace": "uSq2A4R3wDdSkNfH"}, "entitlement": {"entitlementId": "JtA3QiX9ZvtydbaV"}, "item": {"itemIdentity": "b0scd97A0GP6djn2", "itemIdentityType": "ITEM_SKU", "origin": "Oculus"}, "quantity": 70, "type": "ITEM"}, {"currency": {"balanceOrigin": "IOS", "currencyCode": "T5hUZ3cnDq0ddZG0", "namespace": "EpfGAqHKcSxUc2Yg"}, "entitlement": {"entitlementId": "Rpk2IFGIgIpscUpV"}, "item": {"itemIdentity": "Aciu2XPPUxzXHUvx", "itemIdentityType": "ITEM_ID", "origin": "Oculus"}, "quantity": 44, "type": "ITEM"}], "source": "DLC", "transactionId": "ZcvRKoaM4ozSAg8F"}' \
    > test.out 2>&1
eval_tap $? 267 'DoRevocation' test.out

#- 268 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'TLrByWOJhbocoGlP' \
    --body '{"gameSessionId": "zdfxcC3rpWhSpq0I", "payload": {"nxMLpP7n7M3JXjEv": {}, "sj5WcQ99M1yuXeqV": {}, "31LX2ehcMnM6Qtjz": {}}, "scid": "QjDlUMCGnxZwak7K", "sessionTemplateName": "HnzGASmVzePIroz4"}' \
    > test.out 2>&1
eval_tap $? 268 'RegisterXblSessions' test.out

#- 269 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '1oQCuXeTRyJQrNLT' \
    --chargeStatus 'CHARGED' \
    --itemId 'b4seYCyiB4tDCWx3' \
    --limit '5' \
    --offset '62' \
    --sku 'yxb1of79zVTWIfgd' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 269 'QueryUserSubscriptions' test.out

#- 270 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'i9Ze0hL9rPkV5GkS' \
    --excludeSystem  \
    --limit '36' \
    --offset '4' \
    --subscriptionId 'QPLhDSJx9jzxaRKp' \
    > test.out 2>&1
eval_tap $? 270 'GetUserSubscriptionActivities' test.out

#- 271 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'h4kiIFgS4fLqlrKG' \
    --body '{"grantDays": 17, "itemId": "ErmeH0lX1hj0LaXg", "language": "Q94flh775AQfzNjQ", "reason": "7IuMSY2epRDJjDyM", "region": "DKQhuTjtQZyIiAmC", "source": "L8bNTTfqLCv9DYBO"}' \
    > test.out 2>&1
eval_tap $? 271 'PlatformSubscribeSubscription' test.out

#- 272 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ProN4UWbQaKFrTv4' \
    --itemId 'JWElmOCxqPrq9I3X' \
    > test.out 2>&1
eval_tap $? 272 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 273 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'JWBxTLcOef8MgIwk' \
    --userId 'rKFEtwESJCe2ksG3' \
    > test.out 2>&1
eval_tap $? 273 'GetUserSubscription' test.out

#- 274 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'nZE13H2fILFzOlAZ' \
    --userId 'bDQAEJLbVWH2XLIg' \
    > test.out 2>&1
eval_tap $? 274 'DeleteUserSubscription' test.out

#- 275 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '3MgmdSvWp3h0xPsV' \
    --userId 'Y8qNwB2TY4v9NNfQ' \
    --force  \
    --body '{"immediate": true, "reason": "LFKSl3FNFFJnt3rI"}' \
    > test.out 2>&1
eval_tap $? 275 'CancelSubscription' test.out

#- 276 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'wZdW02Su6aCnL816' \
    --userId 'aH6gOBUIMeL0GL3a' \
    --body '{"grantDays": 9, "reason": "FmKTTUxG0mpmFxxD"}' \
    > test.out 2>&1
eval_tap $? 276 'GrantDaysToSubscription' test.out

#- 277 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'NXGlGJvHf558h1lt' \
    --userId 'yhiSGhfqXhxBJ7zL' \
    --excludeFree  \
    --limit '41' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 277 'GetUserSubscriptionBillingHistories' test.out

#- 278 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'HFFaZzPIjETqcKN1' \
    --userId 'gaQ4Bn0cPPtKaJlw' \
    --body '{"additionalData": {"cardSummary": "31pdDrXQ47WSGyDC"}, "authorisedTime": "1990-05-02T00:00:00Z", "chargebackReversedTime": "1987-07-06T00:00:00Z", "chargebackTime": "1990-05-15T00:00:00Z", "chargedTime": "1990-04-01T00:00:00Z", "createdTime": "1974-12-14T00:00:00Z", "currency": {"currencyCode": "O3lGZ7eGOPj2XoFu", "currencySymbol": "g8BUQUmPHnPumcaz", "currencyType": "VIRTUAL", "decimals": 54, "namespace": "EuVVZM28w4mnYvvl"}, "customParameters": {"t1es7A4PFduN4gx0": {}, "UC6eWKCFGS97Si6X": {}, "yLVPrkUxyZ1OH5Nn": {}}, "extOrderNo": "4nMT8QOyTuUSD9Im", "extTxId": "taPAocOQcpBWSNrC", "extUserId": "jSNEAdojkCMmYyTG", "issuedAt": "1991-02-12T00:00:00Z", "metadata": {"WUJizF69PSsquWUa": "fwbFPX15633pFgA7", "i9tqvfHmFvUZiUW5": "Y0CYw5OXSGwQkJuy", "9oLFcHHcraLXR2n9": "JQvq7NKWIHYsii3f"}, "namespace": "Ch7sieJjZPAkiWum", "nonceStr": "llU31uXPwYxedGHC", "paymentMethod": "Ikmt4bfJOhNaIT0p", "paymentMethodFee": 43, "paymentOrderNo": "XP3kRhtrBcBofWTG", "paymentProvider": "WXPAY", "paymentProviderFee": 50, "paymentStationUrl": "2ihgioL8VvEzHGTt", "price": 8, "refundedTime": "1992-04-06T00:00:00Z", "salesTax": 28, "sandbox": false, "sku": "LkgqkqYZWPZTgKag", "status": "REFUND_FAILED", "statusReason": "fUilcKA84d9pMsl7", "subscriptionId": "zrNJvDiP2hNNEI8Q", "subtotalPrice": 37, "targetNamespace": "A5yFIH3s9UyeaFi8", "targetUserId": "OE7BCK4FeVGrl5Np", "tax": 95, "totalPrice": 20, "totalTax": 68, "txEndTime": "1992-04-28T00:00:00Z", "type": "zblWEiHaUjyTHb0s", "userId": "Slstb3slUe94NxhX", "vat": 38}' \
    > test.out 2>&1
eval_tap $? 278 'ProcessUserSubscriptionNotification' test.out

#- 279 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName '68MXUq3uIffkIpPm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rWVxNZUvkiU2jXSw' \
    --body '{"count": 38, "orderNo": "TRmJOqIl7U12hO5v"}' \
    > test.out 2>&1
eval_tap $? 279 'AcquireUserTicket' test.out

#- 280 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'pk9DOSgbsdGVPLD9' \
    > test.out 2>&1
eval_tap $? 280 'QueryUserCurrencyWallets' test.out

#- 281 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'A5NmuZDUV3yHurgO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fba1XeoHYTNoRol8' \
    --body '{"allowOverdraft": true, "amount": 98, "balanceOrigin": "Steam", "balanceSource": "EXPIRATION", "metadata": {"iQwuyrI87uSyXP6C": {}, "0jXS8au2wcWYyj3J": {}, "vHqXp4JR7xI59Z9t": {}}, "reason": "fGVsglnOxOXBfgBL"}' \
    > test.out 2>&1
eval_tap $? 281 'DebitUserWalletByCurrencyCode' test.out

#- 282 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'uglkd9LIoshGnFSu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hmrqej8PRppYY1vl' \
    --limit '98' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 282 'ListUserCurrencyTransactions' test.out

#- 283 CheckWallet
eval_tap 0 283 'CheckWallet # SKIP deprecated' test.out

#- 284 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode '0M2g6oreqyBzWzCg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MMWZuD6tmIR28xVx' \
    --body '{"amount": 4, "expireAt": "1984-06-09T00:00:00Z", "metadata": {"nlg8nmzQx1RsYhcR": {}, "lv16Wwe8YK3lZFsl": {}, "ECI9QzuQcsjFehD6": {}}, "origin": "Other", "reason": "cT7sAsv2TKCbYMVk", "source": "REWARD"}' \
    > test.out 2>&1
eval_tap $? 284 'CreditUserWallet' test.out

#- 285 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'zFZsTBHkgcJ0DcEt' \
    --namespace "$AB_NAMESPACE" \
    --userId '23pci6xEljer6aGJ' \
    --body '{"amount": 48, "debitBalanceSource": "TRADE", "metadata": {"5OFp3jKEx4aSGdwT": {}, "PX4ig3NVFFkP7O3F": {}, "4vsohRWDyGYIVFDb": {}}, "reason": "TvRYfpJ4wM9WZfOO", "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 285 'DebitByWalletPlatform' test.out

#- 286 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'iCWrm3s1Ah3TII70' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MIcBMJ04508jKedx' \
    --body '{"amount": 85, "metadata": {"CVRpd7SwZw2UkjDz": {}, "J4NuMMgI13nplXaU": {}, "QV5QEvKElLfbB7gw": {}}, "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 286 'PayWithUserWallet' test.out

#- 287 GetUserWallet
eval_tap 0 287 'GetUserWallet # SKIP deprecated' test.out

#- 288 DebitUserWallet
eval_tap 0 288 'DebitUserWallet # SKIP deprecated' test.out

#- 289 DisableUserWallet
eval_tap 0 289 'DisableUserWallet # SKIP deprecated' test.out

#- 290 EnableUserWallet
eval_tap 0 290 'EnableUserWallet # SKIP deprecated' test.out

#- 291 ListUserWalletTransactions
eval_tap 0 291 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 292 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zxidLcAQWGVRg6DV' \
    > test.out 2>&1
eval_tap $? 292 'ListViews' test.out

#- 293 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'so5TJCSugdo4XTm8' \
    --body '{"displayOrder": 39, "localizations": {"PqdhKHn6ZjZMdr1C": {"description": "2TIQzRJY7UfYSrdN", "localExt": {"0JVz4U43EcV1FRye": {}, "eqehMNeRYKeMbL0G": {}, "4v5D6ylZguO918X7": {}}, "longDescription": "rLoexHBMBMMAYokS", "title": "WFwajRGUyklfLVY6"}, "g3PO4hKAeF4GUV5m": {"description": "96qcCJsVOWtu5RPs", "localExt": {"qd66ImBEuhnaxZVf": {}, "6MD9r1y5Ihr531Ka": {}, "jxq7lzuVRVEvhKIb": {}}, "longDescription": "rq1xsGpdobYun8hc", "title": "O55hVjfWyK02w5Qy"}, "tAmkanukAzAMaRvI": {"description": "UhUwguGgbLLN3O7C", "localExt": {"EYjxqElP5lA2FJ0i": {}, "GLRTXGsC5mxxse4e": {}, "euMgEctVEux2MSuw": {}}, "longDescription": "sEHlwdeJyhsHS6Yq", "title": "PudWviQsULL1txfX"}}, "name": "9tqFSkGXoIcFN5JL"}' \
    > test.out 2>&1
eval_tap $? 293 'CreateView' test.out

#- 294 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId '9M53Mg0MzWS9usxx' \
    --storeId 'nMhjv66DyED4prRV' \
    > test.out 2>&1
eval_tap $? 294 'GetView' test.out

#- 295 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'ibTATxd7Mzjv1gSj' \
    --storeId '8kcNhoqcRZRNAToj' \
    --body '{"displayOrder": 79, "localizations": {"9W8rXqwGVIRWgTNH": {"description": "Cka3Wb5kH1BrLWUe", "localExt": {"tP7nmESQDV3BD1nn": {}, "EzoUlUWqP4ElzL44": {}, "KEm3uHBMCP5ckjph": {}}, "longDescription": "URs4ksgsKJ2R6Jac", "title": "wwu8W1zvrKMRPvwA"}, "9k6yJz03NETdywPq": {"description": "YerrpOm4M2pM4fIf", "localExt": {"cHBWZM50aHbPXRns": {}, "3qwYL6LwGlZGF7XQ": {}, "PLAcIL7FvAMWqhyy": {}}, "longDescription": "NZH1CducB5y5iMde", "title": "BG7REG4meKEabfVX"}, "BJPIZqZC5d6JuFdc": {"description": "fiNf0DOHKwxDF5GJ", "localExt": {"hCjVHiCn2hTefT8g": {}, "PFJ4WndMpQhcLK0W": {}, "TZbtmQkwC8azx3IR": {}}, "longDescription": "Wme3C6p2r4D3NQdj", "title": "rjkX3AMgK3JgZufz"}}, "name": "ssA284mG7uAojLYB"}' \
    > test.out 2>&1
eval_tap $? 295 'UpdateView' test.out

#- 296 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'sx8oqMzbE0ljQaBt' \
    --storeId 'b47V691j0FZp2vjO' \
    > test.out 2>&1
eval_tap $? 296 'DeleteView' test.out

#- 297 QueryWallets
eval_tap 0 297 'QueryWallets # SKIP deprecated' test.out

#- 298 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 33, "expireAt": "1986-06-07T00:00:00Z", "metadata": {"qPTdurR3MYda0Y0B": {}, "CO4qPnvxERWjKasq": {}, "5zQ6uZNwKjnX7vDI": {}}, "origin": "Oculus", "reason": "LTBstguOdN0O7l3G", "source": "ACHIEVEMENT"}, "currencyCode": "fKJrkzwR40tfd9GF", "userIds": ["hUSu4WNfTvD5UcES", "XChtxB10d4Q8nlBt", "1eLMZs9lSQVDp16q"]}, {"creditRequest": {"amount": 100, "expireAt": "1997-10-07T00:00:00Z", "metadata": {"7jI232SjktijiNzT": {}, "Ue8KdizXmrmK0sCU": {}, "sqxKocHomtjoU1kU": {}}, "origin": "Oculus", "reason": "DaSO3FEkk4It6V8B", "source": "IAP_CHARGEBACK_REVERSED"}, "currencyCode": "fMedpcKhvHPlvYan", "userIds": ["GqEkn9OEVwLWGT4M", "9fQqzulLGfQMqSLQ", "XhmzvRQb7c0vmjWq"]}, {"creditRequest": {"amount": 62, "expireAt": "1993-04-03T00:00:00Z", "metadata": {"X6EqadAEIzxld80Y": {}, "nss7hc3VUxxZIgkT": {}, "LqMeJPCbs8jWmTte": {}}, "origin": "Twitch", "reason": "FeBOp0ilGQFwHUtZ", "source": "IAP_CHARGEBACK_REVERSED"}, "currencyCode": "uLfeTfFBTOFFMJ9p", "userIds": ["8Yp2QnuhQuIdvZdj", "hYk3b5cAFVo85r1b", "q511jZcTK8zmMfys"]}]' \
    > test.out 2>&1
eval_tap $? 298 'BulkCredit' test.out

#- 299 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "6AspWBfRnLcLbp7O", "request": {"allowOverdraft": false, "amount": 61, "balanceOrigin": "Epic", "balanceSource": "DLC_REVOCATION", "metadata": {"rDJ7u1rrRPcnG89r": {}, "nNW1Yjfn8lY4DnYR": {}, "xY8ZhHeb0CaPFDjr": {}}, "reason": "SotKnpJWALpToj9r"}, "userIds": ["Dln04F8BQjzobhDa", "8VxKOrfVfBRIfkSt", "gr5RffM5JXvPdzEp"]}, {"currencyCode": "OqdXqhDMQ6tBLljC", "request": {"allowOverdraft": false, "amount": 56, "balanceOrigin": "Epic", "balanceSource": "TRADE", "metadata": {"T3M1DArk4L80aXFY": {}, "7SQkym9KvKMHK5fb": {}, "qioeoRIplY0DIzRC": {}}, "reason": "NAO6ZpqXJmPJso6M"}, "userIds": ["HQdtAneXGgxNg33Z", "11LLZWKgWxn9YL16", "IUrIkfmdXVvaPQzz"]}, {"currencyCode": "KdFg7N7piT8VcrXL", "request": {"allowOverdraft": false, "amount": 79, "balanceOrigin": "Other", "balanceSource": "IAP_REVOCATION", "metadata": {"MNpKEIs3GC9VTK7t": {}, "kJWFpHt7MdKu9Xwn": {}, "5GHJDGatrYOMO91C": {}}, "reason": "YEjX867n9PT9fR7m"}, "userIds": ["764EwhQfxFKIOGT1", "TXAVRnUVbxEJcKHE", "MuBXPDKCriRKzTZ7"]}]' \
    > test.out 2>&1
eval_tap $? 299 'BulkDebit' test.out

#- 300 GetWallet
eval_tap 0 300 'GetWallet # SKIP deprecated' test.out

#- 301 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'WKSmLoA0ILaESC1G' \
    --end 'JXsoBwqh0TQXa2j7' \
    --start 'v3zQJoQLTAlW75ic' \
    > test.out 2>&1
eval_tap $? 301 'SyncOrders' test.out

#- 302 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["IKUpXazsFrmaGNoi", "3RPTgWotLNz0u8yS", "xA0yrjz4q7e0EJnA"], "apiKey": "DXC2y0DY1E1SMK9o", "authoriseAsCapture": true, "blockedPaymentMethods": ["Q94ZvPCWcMX0ov3U", "2sKjIeyFS97dYD7L", "kcTKYpCfl6HPy5cJ"], "clientKey": "fAV5iOfzwt3bpxRN", "dropInSettings": "t6lKoMjCPtEKeBWT", "liveEndpointUrlPrefix": "m78Fn8TvZVTe4L2l", "merchantAccount": "XrVPX6r5ZTcnVVOK", "notificationHmacKey": "MApTcWsFRUlWBp4g", "notificationPassword": "Bs9UufgsVbG6TUe3", "notificationUsername": "jbuQ7HMPO4ozK705", "returnUrl": "ykRqSPYZgPm4JLsX", "settings": "VtBOEetHsxAJ8Ny1"}' \
    > test.out 2>&1
eval_tap $? 302 'TestAdyenConfig' test.out

#- 303 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "LRkPU9hrl5nkpEdB", "privateKey": "e8bYWdok4UnUEOyP", "publicKey": "0cPZf5OvolfI0mqZ", "returnUrl": "ctohLheRaQkfMLFW"}' \
    > test.out 2>&1
eval_tap $? 303 'TestAliPayConfig' test.out

#- 304 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "9B7jHZro4hhwnANA", "secretKey": "Gp8zGqNGrcQyoA1T"}' \
    > test.out 2>&1
eval_tap $? 304 'TestCheckoutConfig' test.out

#- 305 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'WPcy83iXfYXNdMkd' \
    > test.out 2>&1
eval_tap $? 305 'DebugMatchedPaymentMerchantConfig' test.out

#- 306 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "g9TMwxNcQ6CkVi8f", "clientSecret": "qVPRqNbF5yLnYSa8", "returnUrl": "xFLvcYexMMMiDFh5", "webHookId": "RbW021cHN3QbzVuJ"}' \
    > test.out 2>&1
eval_tap $? 306 'TestPayPalConfig' test.out

#- 307 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["ZH3k54cExxWKtdGT", "W4FILotv5ycTa0i6", "ifYP1zfgjsy3VRjX"], "publishableKey": "4qA4g9OGoWw1qnCA", "secretKey": "vdnAcokJ0rzqX2KJ", "webhookSecret": "cYHgiFDxclBXap6j"}' \
    > test.out 2>&1
eval_tap $? 307 'TestStripeConfig' test.out

#- 308 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "73doCWxhubMXbxNv", "key": "T6wAffv4uzKAwiI4", "mchid": "wTxNIefCmtrxWu29", "returnUrl": "3551nQBNKcqCkUXR"}' \
    > test.out 2>&1
eval_tap $? 308 'TestWxPayConfig' test.out

#- 309 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "j8gQHEe4CO370Osb", "flowCompletionUrl": "zRKKPd6mjzLxllUr", "merchantId": 65, "projectId": 28, "projectSecretKey": "n7cSuO7NxKHUHg0c"}' \
    > test.out 2>&1
eval_tap $? 309 'TestXsollaConfig' test.out

#- 310 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id '4X7fHdITmN9opaF0' \
    > test.out 2>&1
eval_tap $? 310 'GetPaymentMerchantConfig' test.out

#- 311 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'kh3pCRB3infEVxAr' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["F7TB6A6a71zAJpaP", "eudUtKPJUmAvxBxJ", "NPlvvYZw4MWzWFTu"], "apiKey": "NPf5JCSDyYy4e5qo", "authoriseAsCapture": true, "blockedPaymentMethods": ["FOa6xgPt69QROGDe", "JCyHvUsnLvXCSgQH", "vs25eiQO3oWdgXdm"], "clientKey": "1IxL1OtleUBqBO0Z", "dropInSettings": "e049k9W6ZLVJzRpU", "liveEndpointUrlPrefix": "sITfVruDukun42zP", "merchantAccount": "ZvOd4yZyMKyED3qD", "notificationHmacKey": "O5HXp5oVkhESbHQ7", "notificationPassword": "hvTlzf7XwQtVIYU8", "notificationUsername": "7NgjDMcJxfMfYFlt", "returnUrl": "3JvDgMiyBGygWFTA", "settings": "Y3Th5mOwPCPKVPlO"}' \
    > test.out 2>&1
eval_tap $? 311 'UpdateAdyenConfig' test.out

#- 312 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'GfFBlu2ZP0IkiYXG' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 312 'TestAdyenConfigById' test.out

#- 313 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'k6BoBmSLi0R7zDFM' \
    --sandbox  \
    --validate  \
    --body '{"appId": "oNTQmlS8lMlY8Ujp", "privateKey": "rhCxhzW6ZM7LkTVr", "publicKey": "tVJZVhxCVdjPutJ8", "returnUrl": "dkAVOJ5imghdfVhj"}' \
    > test.out 2>&1
eval_tap $? 313 'UpdateAliPayConfig' test.out

#- 314 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'njd66A1SQmWGSQLA' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 314 'TestAliPayConfigById' test.out

#- 315 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'VPAJ7zX5lB80k2sm' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "dkBS2MaIP7PjngEF", "secretKey": "ggq91cpgvoDBgYfL"}' \
    > test.out 2>&1
eval_tap $? 315 'UpdateCheckoutConfig' test.out

#- 316 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'BdGNAZEvbvxqa0K7' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 316 'TestCheckoutConfigById' test.out

#- 317 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'VUbjUnzirnEsxSE4' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "vBzG7VK8sWEshmZf", "clientSecret": "5fEdvjbyJPQ1qdRc", "returnUrl": "Jjsme1OukIfIZVH8", "webHookId": "q8svV5hMOSfpyJkJ"}' \
    > test.out 2>&1
eval_tap $? 317 'UpdatePayPalConfig' test.out

#- 318 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'lmJmTkFvB7wkY6nu' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 318 'TestPayPalConfigById' test.out

#- 319 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'UEGJ3k0HGtpK43uO' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["RGREOOwTuY8dhNCD", "WWpN3B6tedgFUzBm", "5vGA3itKaF9z3WWu"], "publishableKey": "v3j8T9g1f6P3D3rV", "secretKey": "cC2g6t42jE1Wad23", "webhookSecret": "2YV7A2zHFGbN8AQa"}' \
    > test.out 2>&1
eval_tap $? 319 'UpdateStripeConfig' test.out

#- 320 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'Caw9UF7cdSDd99DQ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 320 'TestStripeConfigById' test.out

#- 321 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'Z7vnTx8HDXTJWiyw' \
    --validate  \
    --body '{"appId": "17ogzmbj4SLYDrZJ", "key": "vDLGvn6qtroZcp16", "mchid": "HKXX1ft5nBA9xNIJ", "returnUrl": "VuMz04evSdE2FMcK"}' \
    > test.out 2>&1
eval_tap $? 321 'UpdateWxPayConfig' test.out

#- 322 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'd7c94rEmIYuAT5OA' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 322 'UpdateWxPayConfigCert' test.out

#- 323 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'cUwYHGmG5rNDBF1o' \
    > test.out 2>&1
eval_tap $? 323 'TestWxPayConfigById' test.out

#- 324 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'U37vjfyX5YLaM0wm' \
    --validate  \
    --body '{"apiKey": "i0i1WABBbq8IzZsM", "flowCompletionUrl": "FLX9ZhFXcFtfBS3Z", "merchantId": 71, "projectId": 24, "projectSecretKey": "HofhwyM6Bw2sFGQ5"}' \
    > test.out 2>&1
eval_tap $? 324 'UpdateXsollaConfig' test.out

#- 325 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'DQoDwzrKPOZZnV3z' \
    > test.out 2>&1
eval_tap $? 325 'TestXsollaConfigById' test.out

#- 326 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'R7YxSu6addocg10H' \
    --body '{"device": "MOBILE", "showCloseButton": false, "size": "MEDIUM", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 326 'UpdateXsollaUIConfig' test.out

#- 327 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '67' \
    --namespace "$AB_NAMESPACE" \
    --offset '48' \
    --region 'Ov8D0iVxzrec5kNw' \
    > test.out 2>&1
eval_tap $? 327 'QueryPaymentProviderConfig' test.out

#- 328 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "EsrrB2pJ7V8BSruc", "region": "jO3zvSM5KeVNHU9G", "sandboxTaxJarApiToken": "cOivIfcCJt4U8VSg", "specials": ["CHECKOUT", "PAYPAL", "CHECKOUT"], "taxJarApiToken": "zh60RQNaTEhMXMep", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 328 'CreatePaymentProviderConfig' test.out

#- 329 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 329 'GetAggregatePaymentProviders' test.out

#- 330 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'zY9jLiAdMiQ7eDMk' \
    > test.out 2>&1
eval_tap $? 330 'DebugMatchedPaymentProviderConfig' test.out

#- 331 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 331 'GetSpecialPaymentProviders' test.out

#- 332 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'eBRMur18nCxiV9bQ' \
    --body '{"aggregate": "ADYEN", "namespace": "HpPbvflI3LkRc1Ng", "region": "ZaoYAaCCeRgtstsU", "sandboxTaxJarApiToken": "3Qecxo4bQZO3P2f8", "specials": ["ALIPAY", "PAYPAL", "CHECKOUT"], "taxJarApiToken": "3W1De2McGd10wefF", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 332 'UpdatePaymentProviderConfig' test.out

#- 333 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'JlH55RLEgeAsSpQd' \
    > test.out 2>&1
eval_tap $? 333 'DeletePaymentProviderConfig' test.out

#- 334 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 334 'GetPaymentTaxConfig' test.out

#- 335 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "cmGHZuRVQ8tzwqMa", "taxJarApiToken": "yP8A3HGNI3BfjkFd", "taxJarEnabled": true, "taxJarProductCodesMapping": {"Ho6gGQ5mChYoKD7y": "qCR03RovQZhwfjkq", "9iyTbyD3D01tRpuu": "yIagSSzEL8H4euLu", "fhQj2KP3LLxl9Hs2": "L2wlpKBVURxHefz7"}}' \
    > test.out 2>&1
eval_tap $? 335 'UpdatePaymentTaxConfig' test.out

#- 336 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey '7a9fntCNiHBRUNCP' \
    --end 'Sre5GmZzCQwilS3I' \
    --start 'xSjlyvR9PxG9Lji2' \
    > test.out 2>&1
eval_tap $? 336 'SyncPaymentOrders' test.out

#- 337 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'Vc88W8aLjIxVGpdO' \
    --storeId 'qguxvRwI9ZBTipMR' \
    > test.out 2>&1
eval_tap $? 337 'PublicGetRootCategories' test.out

#- 338 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'lhK9DMMaI4ryVDvN' \
    --storeId 'aruZxwTfh9gEs6GF' \
    > test.out 2>&1
eval_tap $? 338 'DownloadCategories' test.out

#- 339 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath '247cbBLjUr5z03wx' \
    --namespace "$AB_NAMESPACE" \
    --language 'B3E9hrE9f9COFrOr' \
    --storeId '6wJDBwIDsJHNg6Tv' \
    > test.out 2>&1
eval_tap $? 339 'PublicGetCategory' test.out

#- 340 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'NGjwI4TbTwBufUor' \
    --namespace "$AB_NAMESPACE" \
    --language 'JouduhCEJ5XiKDIE' \
    --storeId '9YugcupLxVBcRkfh' \
    > test.out 2>&1
eval_tap $? 340 'PublicGetChildCategories' test.out

#- 341 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'RuqkOTHSia7oFd1f' \
    --namespace "$AB_NAMESPACE" \
    --language 'EmDuyAsQGzwJR5po' \
    --storeId 'I718RQnj4imu6XFf' \
    > test.out 2>&1
eval_tap $? 341 'PublicGetDescendantCategories' test.out

#- 342 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 342 'PublicListCurrencies' test.out

#- 343 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 343 'GeDLCDurableRewardShortMap' test.out

#- 344 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'TWITCH' \
    > test.out 2>&1
eval_tap $? 344 'GetIAPItemMapping' test.out

#- 345 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'ZpyTTZG1LxLdySvy' \
    --region 'VqY8nxBZbHcPHEFu' \
    --storeId 'EVP9bF07gnWDULkJ' \
    --appId 'PQR0UJMr8ouccGH0' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetItemByAppId' test.out

#- 346 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --baseAppId 'r80QwnlgAVfqz6gQ' \
    --categoryPath 'Jh8sn0bVWRkvmAem' \
    --features 'h8lioBR7xTXcEIFo' \
    --includeSubCategoryItem  \
    --itemType 'APP' \
    --language 'q5TO65KWh8ztRJkX' \
    --limit '47' \
    --offset '3' \
    --region 'UAj3jzZvEaY103YU' \
    --sortBy 'createdAt:desc,displayOrder,updatedAt:desc' \
    --storeId 'eFMWAFT7l0l1jaOA' \
    --tags 'MCzbsoIgmKwwMDQP' \
    > test.out 2>&1
eval_tap $? 346 'PublicQueryItems' test.out

#- 347 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'jUIosq1l6xo0D4JR' \
    --region 'bNqO6IuP2PY5hhX6' \
    --storeId 'uNah9JoHPj7jFWxS' \
    --sku 'v1lYylYAiZ8c7Zd7' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetItemBySku' test.out

#- 348 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'EUoezOLw8C1c5bBB' \
    --storeId '3XZ7ColKwlsNvtFu' \
    --itemIds 'unQsvdXGlD40xxIy' \
    > test.out 2>&1
eval_tap $? 348 'PublicGetEstimatedPrice' test.out

#- 349 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'VwYjn6dlC9Kfh9gH' \
    --region 'uloyce0cLJu4ljPW' \
    --storeId 'lCWTuGO8MnfOQu3w' \
    --itemIds 'dT4Aodp95o1RkX7i' \
    > test.out 2>&1
eval_tap $? 349 'PublicBulkGetItems' test.out

#- 350 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["W7VpCngWAv5DAG8d", "PdkKgQqjyzUZR2rF", "IAuALNhNCyscsMBR"]}' \
    > test.out 2>&1
eval_tap $? 350 'PublicValidateItemPurchaseCondition' test.out

#- 351 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'SEASON' \
    --limit '51' \
    --offset '38' \
    --region 'ui8a6jOflFJlZEhz' \
    --storeId '1QDeh05hj92bwVVx' \
    --keyword 'J62Q5AOAOyL65cPa' \
    --language 'OZA8BG8KcVWOX9n3' \
    > test.out 2>&1
eval_tap $? 351 'PublicSearchItems' test.out

#- 352 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'YsjJexnFA9Umz3KP' \
    --namespace "$AB_NAMESPACE" \
    --language 'ICya5Fk5TPaEbX29' \
    --region 'cV8v7MXctihtxMnI' \
    --storeId 'r4b7jyfL3zMkklGC' \
    > test.out 2>&1
eval_tap $? 352 'PublicGetApp' test.out

#- 353 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'PISlsnVA6z0uSfNN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 353 'PublicGetItemDynamicData' test.out

#- 354 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'pJUYzJxnOyvqmswr' \
    --namespace "$AB_NAMESPACE" \
    --language 'ToyBIQumxDfAxNqC' \
    --populateBundle  \
    --region 'UtizYM97ebZcYqwf' \
    --storeId 'IHPWMkOmrT5HL16j' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetItem' test.out

#- 355 GetPaymentCustomization
eval_tap 0 355 'GetPaymentCustomization # SKIP deprecated' test.out

#- 356 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "MwECnmwJv4rpqtzD", "paymentProvider": "ADYEN", "returnUrl": "CxX7xKyCfgwSPz14", "ui": "asyOdgn77gN8K1Fl", "zipCode": "NkgbFE8U4meK5grm"}' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetPaymentUrl' test.out

#- 357 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'PBsFH71VrhsISYte' \
    > test.out 2>&1
eval_tap $? 357 'PublicGetPaymentMethods' test.out

#- 358 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'gQbNA2WQrHTkJT1V' \
    > test.out 2>&1
eval_tap $? 358 'PublicGetUnpaidPaymentOrder' test.out

#- 359 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'kChD3n0c1ryAkRvd' \
    --paymentProvider 'CHECKOUT' \
    --zipCode 'R8gx2rX5dck8NFKP' \
    --body '{"token": "gT6LMehg047axU5k"}' \
    > test.out 2>&1
eval_tap $? 359 'Pay' test.out

#- 360 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'tNywRIvO2Sgz30he' \
    > test.out 2>&1
eval_tap $? 360 'PublicCheckPaymentOrderPaidStatus' test.out

#- 361 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'CHECKOUT' \
    --region 'StWIggmhfAzVdNYP' \
    > test.out 2>&1
eval_tap $? 361 'GetPaymentPublicConfig' test.out

#- 362 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code '7Ao1z7FeJM2fWXGk' \
    > test.out 2>&1
eval_tap $? 362 'PublicGetQRCode' test.out

#- 363 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID '7JObSHksRkabpmvR' \
    --foreinginvoice 'sc7ZYvXCT6m6mRZA' \
    --invoiceId 'lLBczJVeil7GbG1I' \
    --payload 'SBCkcnpxKUxLjmxh' \
    --redirectResult 'BS6YypRW7fNntaIE' \
    --resultCode 'tDI6MbhxkQdezbmf' \
    --sessionId '392ersoZ2KbMb5ja' \
    --status 'l0ruZmBXlGSp85q6' \
    --token 'fuGfo5wSDHnyabk4' \
    --type '93I3pvHKDaWhTN1q' \
    --userId 'yxpUzWIZWJTDzWgu' \
    --orderNo 'hujw1EoR58uCVlde' \
    --paymentOrderNo 'fonHJZAiX4abmqqi' \
    --paymentProvider 'WXPAY' \
    --returnUrl 'KTWwZk0HGeJNaBjV' \
    > test.out 2>&1
eval_tap $? 363 'PublicNormalizePaymentReturnUrl' test.out

#- 364 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'dMB5kMzKycYrhr4F' \
    --paymentOrderNo 'nNzdT4pWwIVXp9av' \
    --paymentProvider 'PAYPAL' \
    > test.out 2>&1
eval_tap $? 364 'GetPaymentTaxValue' test.out

#- 365 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'r6IydpXW0MO0eT9o' \
    > test.out 2>&1
eval_tap $? 365 'GetRewardByCode' test.out

#- 366 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'kl6MlWOl9feWO2bm' \
    --limit '84' \
    --offset '92' \
    --sortBy 'namespace:asc,rewardCode:desc' \
    > test.out 2>&1
eval_tap $? 366 'QueryRewards1' test.out

#- 367 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Xs1BphA9BXpKYgF9' \
    > test.out 2>&1
eval_tap $? 367 'GetReward1' test.out

#- 368 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 368 'PublicListStores' test.out

#- 369 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'OuigDP0Vjmy7j2Br,dCAm3slCwaBqHpE5,5sjxBGijw0dQtZNo' \
    --itemIds 'nMrPkzUe9SglAJGy,ZS0I8FevJiT98HUB,p56Q4WETxtGMs5tP' \
    --skus 'KPuK0K4PiMDTR7Lx,ihuOn57io0d9dG3y,zaNbGeASX83SLiIb' \
    > test.out 2>&1
eval_tap $? 369 'PublicExistsAnyMyActiveEntitlement' test.out

#- 370 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'AP2qyUnHnfrEdDfY' \
    > test.out 2>&1
eval_tap $? 370 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 371 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'TTxu8goZgsX4RwfM' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 372 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'qnUdcQqZ9F1uivPo' \
    > test.out 2>&1
eval_tap $? 372 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 373 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'b0YZEuXQACDDQryN,f9VGxbOeJe4n9eUl,BQZ2UGePWXbAyGiX' \
    --itemIds 'a9nUsHCVicuJ7onr,UXVlB6xNel4Bxb9K,wFYqdhEVq3hbsApe' \
    --skus 'ASfR0ljKxqZcLuhw,NDvValv3bkoMXNzl,1ywEPiunixlEAHZz' \
    > test.out 2>&1
eval_tap $? 373 'PublicGetEntitlementOwnershipToken' test.out

#- 374 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "Hs8x5oPSkZFIV2fe", "language": "Ol_ZrbS", "region": "y9oFOHB2KEsIdtoz"}' \
    > test.out 2>&1
eval_tap $? 374 'SyncTwitchDropsEntitlement' test.out

#- 375 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'VltBhoXE4wgcYT5C' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 375 'PublicGetMyWallet' test.out

#- 376 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'djaJuUzFIeqaVr1C' \
    --body '{"epicGamesJwtToken": "E1gu6cYuzC77J4ir"}' \
    > test.out 2>&1
eval_tap $? 376 'SyncEpicGameDLC' test.out

#- 377 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'vZ9tktWLtDdlmVGK' \
    > test.out 2>&1
eval_tap $? 377 'SyncOculusDLC' test.out

#- 378 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '6iolEw6IIpDc9X5i' \
    --body '{"serviceLabel": 19}' \
    > test.out 2>&1
eval_tap $? 378 'PublicSyncPsnDlcInventory' test.out

#- 379 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'RLJbMvOGSd7uMrmQ' \
    --body '{"serviceLabels": [99, 92, 55]}' \
    > test.out 2>&1
eval_tap $? 379 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 380 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'aLd6M7TM3wnJyExu' \
    --body '{"appId": "o5z9RAcYgYZb7cAa", "steamId": "kJpqN6eubdp49JFw"}' \
    > test.out 2>&1
eval_tap $? 380 'SyncSteamDLC' test.out

#- 381 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'XG0EvoSHNC97eEyh' \
    --body '{"xstsToken": "nL1QH5AlYRAqCAC2"}' \
    > test.out 2>&1
eval_tap $? 381 'SyncXboxDLC' test.out

#- 382 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'gy1WF9QLNgDxAkwg' \
    --appType 'DEMO' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'B8jIecOx5ugNCDd6' \
    --features 'jW6fjtBcO3fWq9qf,mBv0XgJB6a7uykAD,FpinFcH2ZMSYijqE' \
    --itemId 'uMfuYFUS079tOpZY,M1XV0Op0damycnTU,OoMkOppZNOkqxc42' \
    --limit '70' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 382 'PublicQueryUserEntitlements' test.out

#- 383 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'IFHNmB9mYBvtOwxj' \
    --appId 'qyrjDApeN5eAfRqS' \
    > test.out 2>&1
eval_tap $? 383 'PublicGetUserAppEntitlementByAppId' test.out

#- 384 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'gH5xIuBTYOdsvNyk' \
    --limit '98' \
    --offset '72' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 384 'PublicQueryUserEntitlementsByAppType' test.out

#- 385 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'QFkVVEf36S7yPgG4' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'bk6PwH1tdEAJSqXA' \
    > test.out 2>&1
eval_tap $? 385 'PublicGetUserEntitlementByItemId' test.out

#- 386 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '0Wv0zWGvkc6byp3m' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku '6uhonkAe0FdTSSEl' \
    > test.out 2>&1
eval_tap $? 386 'PublicGetUserEntitlementBySku' test.out

#- 387 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'uBxM47BTww3nBTVm' \
    --appIds 'BFZ6TIs9bTi2m7eN,sYEqKkeuLWDfeFeE,xlOFjRh8mLFTJLve' \
    --itemIds 'QSDWnMQGaYRxFWia,7yJ2d87XjA0ajvb7,JcGUFgp6LkyXpxJe' \
    --skus 'FxhgTwyO51CUpcdx,L0a9VDhrqWCTXOxQ,UpyFgZhNpOTE4toH' \
    > test.out 2>&1
eval_tap $? 387 'PublicExistsAnyUserActiveEntitlement' test.out

#- 388 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '57yr01N33p1Gha8H' \
    --appId 'wpagvERZI6Cqhckn' \
    > test.out 2>&1
eval_tap $? 388 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 389 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'hecNv2Tw6YKhVrYk' \
    --entitlementClazz 'MEDIA' \
    --itemId 'vM1GqMkZ44UXgdBq' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 390 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'tJaRyDlP9qIZJ5Kr' \
    --ids 'x6KkHagEugKJxkU8,Y58COtTNjnNSikJD,g6ujKvq0CIa1YCK9' \
    > test.out 2>&1
eval_tap $? 390 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 391 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'PlMeQprfgLGkHX1t' \
    --entitlementClazz 'APP' \
    --sku 'Tf5YpDUGYsJBEkYU' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 392 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'rLv4qUiTkFcLBrg2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JB0WiCpVBwvAffJ3' \
    > test.out 2>&1
eval_tap $? 392 'PublicGetUserEntitlement' test.out

#- 393 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'btt0PpQY3Pnnic80' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yEO8dL6Jh10XMUGe' \
    --body '{"options": ["DavCKradJmJFUsU4", "18vAlmfGg9NO1Z2D", "vnAxH3pS3jyCkGKl"], "requestId": "tBNE2UbhNtH3yYg4", "useCount": 86}' \
    > test.out 2>&1
eval_tap $? 393 'PublicConsumeUserEntitlement' test.out

#- 394 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'oZvd0La7P4JI4H7u' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DzkOHTdnUtdrRcs3' \
    --body '{"requestId": "GeOsKPNlG7rEXi6L", "useCount": 62}' \
    > test.out 2>&1
eval_tap $? 394 'PublicSellUserEntitlement' test.out

#- 395 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'oSesWpLUHjGaIcZN' \
    --body '{"code": "28gH4Cd9xTdt2K1C", "language": "CQG-Nokh", "region": "KHC16xjJZ4kiU3N8"}' \
    > test.out 2>&1
eval_tap $? 395 'PublicRedeemCode' test.out

#- 396 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '556ll2LQWpdESOBV' \
    --body '{"excludeOldTransactions": false, "language": "Fxk-QX", "productId": "Phsana0uXG7GUTV1", "receiptData": "BwgkLDj4pjVktyoN", "region": "SsEHlzyd0Sarkhlt", "transactionId": "UxgbN5eElQNESFLD"}' \
    > test.out 2>&1
eval_tap $? 396 'PublicFulfillAppleIAPItem' test.out

#- 397 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '8hCc9onSNjbQEqFG' \
    --body '{"epicGamesJwtToken": "wnDG8kz4kvEv6tNj"}' \
    > test.out 2>&1
eval_tap $? 397 'SyncEpicGamesInventory' test.out

#- 398 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'GRhrmRAxRGeIKGlC' \
    --body '{"autoAck": false, "language": "me-UJrZ-iG", "orderId": "B1y3klHuAGnidOyG", "packageName": "uS0OG7ohiL2943Cl", "productId": "rNhEdxd24ZKfvMf1", "purchaseTime": 93, "purchaseToken": "AB6HqIWIi5Bvb1rc", "region": "uEtWAF763kci7lT6"}' \
    > test.out 2>&1
eval_tap $? 398 'PublicFulfillGoogleIAPItem' test.out

#- 399 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '2BOHaso53W3U2Mu9' \
    > test.out 2>&1
eval_tap $? 399 'SyncOculusConsumableEntitlements' test.out

#- 400 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZGMWou1U0RVCf3gM' \
    --body '{"currencyCode": "WDAodCKqfqzeexHA", "price": 0.9557308718143276, "productId": "0NgJTxjtzgO7W3ta", "serviceLabel": 89}' \
    > test.out 2>&1
eval_tap $? 400 'PublicReconcilePlayStationStore' test.out

#- 401 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'PrcgTcA71dtqtSUN' \
    --body '{"currencyCode": "4zvBzGh3mhIDNuMB", "price": 0.8374206546111039, "productId": "egHtB9uTCiiIoMZC", "serviceLabels": [32, 18, 66]}' \
    > test.out 2>&1
eval_tap $? 401 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 402 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ck1l0qxRyQ2pi7xu' \
    --body '{"appId": "AufJakIPXOQznHZT", "currencyCode": "j8oYfWObyNJKVSQs", "language": "Dd", "price": 0.3360057112908096, "productId": "CYVqFyIKh1YtTY4A", "region": "ejyQc5Dac7hSLldW", "steamId": "x5DyniVESUgrROrP"}' \
    > test.out 2>&1
eval_tap $? 402 'SyncSteamInventory' test.out

#- 403 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId '1ip3jNG68DByf2UM' \
    --body '{"gameId": "Ptigq9zOQOcAqBj0", "language": "Ky_636", "region": "srmJFHGiYnyhbqxL"}' \
    > test.out 2>&1
eval_tap $? 403 'SyncTwitchDropsEntitlement1' test.out

#- 404 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'uTZIxgiUaiyy0aWr' \
    --body '{"currencyCode": "shpmb1C9Al7eWrbN", "price": 0.7076528629879162, "productId": "E0xyYPUZHyLGQ52I", "xstsToken": "jGpRJCUJpscOTkWE"}' \
    > test.out 2>&1
eval_tap $? 404 'SyncXboxInventory' test.out

#- 405 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'TSJ04c5MGInO4yzn' \
    --itemId 'h2YpZvvmziSSiSpX' \
    --limit '9' \
    --offset '25' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 405 'PublicQueryUserOrders' test.out

#- 406 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tk1mMyeNRsjQuDEg' \
    --body '{"currencyCode": "O3MEQNL6ijLRvQOg", "discountedPrice": 29, "ext": {"wAcK2lUda9h9Fgvf": {}, "hiLEAkA7n6516ydo": {}, "RT1qZBrdTnGrwHeW": {}}, "itemId": "oQXPFWFaKbDgrGkv", "language": "uUx_Yqub_kh", "price": 43, "quantity": 57, "region": "D0lL7aZUY9d1Idud", "returnUrl": "8bjYeBVMr7zHYmRE", "sectionId": "4X36KUOdfEmoIYwS"}' \
    > test.out 2>&1
eval_tap $? 406 'PublicCreateUserOrder' test.out

#- 407 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'xxAsfwDMivWqHHGl' \
    --userId 'nAnEu6EKYceTEqYu' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetUserOrder' test.out

#- 408 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'dHlA4AxeEIfUxJ2x' \
    --userId 'MSNNBxCeN3pGn46f' \
    > test.out 2>&1
eval_tap $? 408 'PublicCancelUserOrder' test.out

#- 409 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Gvodt413MRdG8qAP' \
    --userId 'iANv2Ar8yXV6qf6v' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetUserOrderHistories' test.out

#- 410 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '5SgcJPZPUh2nHQwp' \
    --userId 'Wi8HZ6C0VJ0fK2m6' \
    > test.out 2>&1
eval_tap $? 410 'PublicDownloadUserOrderReceipt' test.out

#- 411 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'lQ5Ao8TITYiHSR2S' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetPaymentAccounts' test.out

#- 412 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'EJh1YDedZdNqkXPW' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'fT8ZfdKp9q4nXuK0' \
    > test.out 2>&1
eval_tap $? 412 'PublicDeletePaymentAccount' test.out

#- 413 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'tJAYror2XdtSCG7Z' \
    --language 'ExOoIpWzacOvwUsn' \
    --region 'IbQM3ZAtyEWKWoZR' \
    --storeId 'UL7wS3HaMTXAX6y0' \
    --viewId 'STTN2sBEijjjpvSz' \
    > test.out 2>&1
eval_tap $? 413 'PublicListActiveSections' test.out

#- 414 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'GkED0oweFYDBPyd1' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'A0DEMgykqqjoHTpI' \
    --limit '85' \
    --offset '91' \
    --sku 'MSRAuPI7mSZQ5UDm' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 414 'PublicQueryUserSubscriptions' test.out

#- 415 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'K65tvaH9jwcO48pt' \
    --body '{"currencyCode": "hyYpBJDHIIxTIGI5", "itemId": "EssYllIqjJzuQ8Gg", "language": "Cw", "region": "w6L7c3COEP4AZx70", "returnUrl": "uwV4XgvGTMHkXeEw", "source": "uFJf7tbq5KikDE7h"}' \
    > test.out 2>&1
eval_tap $? 415 'PublicSubscribeSubscription' test.out

#- 416 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'WvT5bzcfzIpL2pWB' \
    --itemId '4XsdrxIF6kEAmKGN' \
    > test.out 2>&1
eval_tap $? 416 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 417 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'EmFPcUALNziO9Bz2' \
    --userId 'wx4kDAm8XIleiujt' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetUserSubscription' test.out

#- 418 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'v2NdQTYoHZogW8lB' \
    --userId 'vniHdARadfSoctA3' \
    > test.out 2>&1
eval_tap $? 418 'PublicChangeSubscriptionBillingAccount' test.out

#- 419 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'GYO94ZOo94gS5DHL' \
    --userId 'B65fxQ06GwTmobiB' \
    --body '{"immediate": false, "reason": "cHDWcIoJ45L0Ze3Y"}' \
    > test.out 2>&1
eval_tap $? 419 'PublicCancelSubscription' test.out

#- 420 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'amxKDSZTl4UiJSCb' \
    --userId 'G4UmG3TkMTzOcBIc' \
    --excludeFree  \
    --limit '17' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 420 'PublicGetUserSubscriptionBillingHistories' test.out

#- 421 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'iKwRs1E7sH2G9MJ6' \
    --language 'F7Rr7O15jqeKssQp' \
    --storeId 'me6eyM48tE7eJRsX' \
    > test.out 2>&1
eval_tap $? 421 'PublicListViews' test.out

#- 422 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'NeveQXqnFRYmEIX4' \
    --namespace "$AB_NAMESPACE" \
    --userId '0XOUoLOa7oDz00gx' \
    > test.out 2>&1
eval_tap $? 422 'PublicGetWallet' test.out

#- 423 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'coaH6u9TVf4DvEzp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oPRiClZ6rlwX99AH' \
    --limit '78' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 423 'PublicListUserWalletTransactions' test.out

#- 424 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate '5hFQHumFvPKqupHj' \
    --baseAppId '72TlLs964iABOgTK' \
    --categoryPath 'tnaA7O35Iaytd9Cs' \
    --features 'AMTZC37xPXxnfggn' \
    --includeSubCategoryItem  \
    --itemName 'Z3EZp6wSAufwYirs' \
    --itemStatus 'ACTIVE' \
    --itemType 'COINS' \
    --limit '52' \
    --offset '46' \
    --region 'M8xCBoaS2FMwfWNC' \
    --sectionExclusive  \
    --sortBy 'displayOrder,name,displayOrder:asc' \
    --storeId 'rVaYSTRYGFzgLZ7g' \
    --tags 'EypQf2Pn9A4gcbDJ' \
    --targetNamespace '0LmdnOPkIT1C6KGT' \
    > test.out 2>&1
eval_tap $? 424 'QueryItems1' test.out

#- 425 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pA7JZ6xullPROSfi' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 425 'ImportStore1' test.out

#- 426 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'W9zcxmgNfTHu3vkZ' \
    --body '{"itemIds": ["t9FgWckjNpHhM2ZX", "p4N0ROmUCTrS7Gi9", "Iigk9vamO7Q2WQwS"]}' \
    > test.out 2>&1
eval_tap $? 426 'ExportStore1' test.out

#- 427 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WqSs05rjISy4B0X9' \
    --body '{"metadata": {"AJdkT7UYCV8agvwO": {}, "I2LlOQNRN132Rdgw": {}, "MXv9olKpRyWQim3q": {}}, "origin": "Nintendo", "rewards": [{"currency": {"currencyCode": "JhFwxmkGfPI3j4lu", "namespace": "XQuuLtYa86kvL6cB"}, "item": {"itemId": "ZQssUUXOsXMNdvW1", "itemSku": "hbvGenRbm3QtsY5W", "itemType": "aKM5YY6pYrmeMIHL"}, "quantity": 91, "type": "ITEM"}, {"currency": {"currencyCode": "8egV8XhgDjbrum8U", "namespace": "xcutmVg8APWKxoj6"}, "item": {"itemId": "MF68VuKDoklYmkyt", "itemSku": "CAH8Jiqe7gfV1G6b", "itemType": "YgIbVKp4Kgew2mHD"}, "quantity": 21, "type": "CURRENCY"}, {"currency": {"currencyCode": "sA6Mv9Nzs19eBq9a", "namespace": "1L8S1yduOwscICro"}, "item": {"itemId": "6P8FWIPeqaBeD2uB", "itemSku": "AvIXEc2CCgYcFo9A", "itemType": "93o22UgObCOiBWdw"}, "quantity": 57, "type": "CURRENCY"}], "source": "REDEEM_CODE", "transactionId": "dm4N41MOpmm04BlZ"}' \
    > test.out 2>&1
eval_tap $? 427 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE