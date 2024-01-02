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
echo "1..436"

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
    --origin 'System' \
    --userId 'pq5AAeMe4L3mDWOR' \
    > test.out 2>&1
eval_tap $? 59 'QueryEntitlements' test.out

#- 60 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'BVXTIIJM9XsYIIZx,iXNMR9BgaWcFX3SU,BhyoTsMWPAxUMkaw' \
    --limit '0' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 60 'QueryEntitlements1' test.out

#- 61 EnableEntitlementOriginFeature
./ng net.accelbyte.sdk.cli.Main platform enableEntitlementOriginFeature \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'EnableEntitlementOriginFeature' test.out

#- 62 GetEntitlementConfigInfo
./ng net.accelbyte.sdk.cli.Main platform getEntitlementConfigInfo \
    --namespace "$AB_NAMESPACE" \
    --withoutCache  \
    > test.out 2>&1
eval_tap $? 62 'GetEntitlementConfigInfo' test.out

#- 63 GrantEntitlements
./ng net.accelbyte.sdk.cli.Main platform grantEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlementGrantList": [{"endDate": "1987-05-02T00:00:00Z", "grantedCode": "lEMEsFzYqwgK1Np5", "itemId": "nodqpLm7FhJBNXzA", "itemNamespace": "FdO0Khqf6kiTdSGv", "language": "nL", "origin": "Playstation", "quantity": 47, "region": "KY7CbgsWqFWZX7kP", "source": "REFERRAL_BONUS", "startDate": "1992-04-25T00:00:00Z", "storeId": "emPYdYT7DROCjtuz"}, {"endDate": "1987-03-05T00:00:00Z", "grantedCode": "MbAG9YI89hmguB8F", "itemId": "OTjMLo4b9rIzqYkE", "itemNamespace": "pstyVTBcrM8rG0rH", "language": "azC-lXxq", "origin": "Oculus", "quantity": 79, "region": "UlcIW32iK7MGt1ix", "source": "PROMOTION", "startDate": "1999-08-04T00:00:00Z", "storeId": "uVoJXTIMtpgkieDy"}, {"endDate": "1987-07-24T00:00:00Z", "grantedCode": "7lGdMiHKxbWCYzo8", "itemId": "yO2KTK9tmmOnYnOp", "itemNamespace": "as6ghP1y4Zi7s7QB", "language": "GL_718", "origin": "Epic", "quantity": 14, "region": "KBwa3Ddb60ufPpzw", "source": "IAP", "startDate": "1980-12-11T00:00:00Z", "storeId": "dTYCfHkIySok5DiX"}], "userIds": ["ZtLW87rGysryod3d", "Kt2ecozL0TOg54vC", "NQrmsApRA6HX3Rwr"]}' \
    > test.out 2>&1
eval_tap $? 63 'GrantEntitlements' test.out

#- 64 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["E48L5oLF6M4lNa4J", "UMSHNgqRqCV7usam", "ANkZlOX9Sfo95HgX"]' \
    > test.out 2>&1
eval_tap $? 64 'RevokeEntitlements' test.out

#- 65 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'qKhTPkwfLM9uSybR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'GetEntitlement' test.out

#- 66 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '20' \
    --status 'FAIL' \
    --userId '86Hl8kUXzt6bSc6b' \
    > test.out 2>&1
eval_tap $? 66 'QueryFulfillmentHistories' test.out

#- 67 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'WvgpVyW9dD1kOmvr' \
    --eventType 'REFUND' \
    --externalOrderId 'S3KtKZWe8aoFzAyB' \
    --limit '79' \
    --offset '63' \
    --startTime 'vim02jBOxrZDyvpc' \
    --status 'SUCCESS' \
    --userId 'OWA8NjxOnaEok4nO' \
    > test.out 2>&1
eval_tap $? 67 'QueryIAPClawbackHistory' test.out

#- 68 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "OCzfsflhjbngJOUn", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 32, "clientTransactionId": "8G5MlfDTk8aG40Nl"}, {"amountConsumed": 27, "clientTransactionId": "547fH0XrKEDpEY8V"}, {"amountConsumed": 28, "clientTransactionId": "TU0Am4DZhl0bQxFJ"}], "entitlementId": "3sWCqQpQ2FbKPFMy", "usageCount": 6}, {"clientTransaction": [{"amountConsumed": 19, "clientTransactionId": "MSQ4qfAacR0LgB5B"}, {"amountConsumed": 96, "clientTransactionId": "BeMfPlNos4yBRjrE"}, {"amountConsumed": 90, "clientTransactionId": "mTSoGH1XEfY6QAYn"}], "entitlementId": "6WQ5UBEU1QAOHfZi", "usageCount": 67}, {"clientTransaction": [{"amountConsumed": 41, "clientTransactionId": "hxOdcuDXSxSc3aZP"}, {"amountConsumed": 98, "clientTransactionId": "vwv7K8Asvt1j1Rx5"}, {"amountConsumed": 49, "clientTransactionId": "hesNWy2NvZ85DDKD"}], "entitlementId": "AF8KDsBZOuYQJ03B", "usageCount": 54}], "purpose": "HpATHccee9GXhKcj"}, "originalTitleName": "mSEwdrkEnnqKzFsL", "paymentProductSKU": "fYalUlfwEQKjU7eH", "purchaseDate": "GebSVu0LQ40kepEa", "sourceOrderItemId": "C4dfiOMZfEhHr39p", "titleName": "ysFO3Zvc1BZG99Ly"}, "eventDomain": "vfvHEsJKQQewVLMU", "eventSource": "oAnaRcYp7FUjfIGa", "eventType": "ffoflEIByYqeKN0m", "eventVersion": 8, "id": "XEQdbzIVy8alncV7", "timestamp": "vWgSHdfo07UctPEr"}' \
    > test.out 2>&1
eval_tap $? 68 'MockPlayStationStreamEvent' test.out

#- 69 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'GetAppleIAPConfig' test.out

#- 70 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "qxyMyOK06MqQBErx", "password": "gjVBycvU4PbmRDcr"}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateAppleIAPConfig' test.out

#- 71 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'DeleteAppleIAPConfig' test.out

#- 72 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'GetEpicGamesIAPConfig' test.out

#- 73 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "g0DjQjBECXvea7H1"}' \
    > test.out 2>&1
eval_tap $? 73 'UpdateEpicGamesIAPConfig' test.out

#- 74 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'DeleteEpicGamesIAPConfig' test.out

#- 75 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'GetGoogleIAPConfig' test.out

#- 76 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "m2lJFRZ3ZprZ60zM", "serviceAccountId": "jhTHeh94TSenE5hC"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateGoogleIAPConfig' test.out

#- 77 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'DeleteGoogleIAPConfig' test.out

#- 78 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 78 'UpdateGoogleP12File' test.out

#- 79 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'GetIAPItemConfig' test.out

#- 80 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "FkIf5weqZ18MH57l", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"z9F1BxNNgnke4akn": "cw7wu9TmXfJWBPrx", "9Ns8eLzYEvwSWTaL": "QjctvrK2jhsYpKPl", "Xn77AtYoFzLAATPY": "8P8P3cfoivvQxeve"}}, {"itemIdentity": "cWw7Rry0KK5rgAGO", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"BEv3aevq6iohU1cg": "4W1IS3Uv1BpWoJBa", "qdg2FHcunsS1lnaO": "2m9vqjhbeK2qN8g6", "x2PyYDo5R3hLiD5s": "f5y1JsxJNGmyt0SQ"}}, {"itemIdentity": "DUDoWBZVGLlkUetz", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"jfBoldFOyqA2clJ5": "gEOaCgM6Yn6RugbN", "EIpGBFUjOn5mM7k8": "nbLzvtCIW5ynMKqu", "UicAeIVXtoWAXhMl": "W4tLqX7OICf5oD1e"}}]}' \
    > test.out 2>&1
eval_tap $? 80 'UpdateIAPItemConfig' test.out

#- 81 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'DeleteIAPItemConfig' test.out

#- 82 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'GetOculusIAPConfig' test.out

#- 83 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "6oI9FmYel0kOw72o", "appSecret": "8Zkgk0jS6rDWUwfh"}' \
    > test.out 2>&1
eval_tap $? 83 'UpdateOculusIAPConfig' test.out

#- 84 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'DeleteOculusIAPConfig' test.out

#- 85 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'GetPlayStationIAPConfig' test.out

#- 86 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "Kvrf2AaH4yCWrHSp", "backOfficeServerClientSecret": "pnIZkNnTn3rzH5Nv", "enableStreamJob": true, "environment": "EYT8sIPSE1XXPzyS", "streamName": "a0sZoFS6xCOWMpyh", "streamPartnerName": "9pMsQgb64ELbzDMw"}' \
    > test.out 2>&1
eval_tap $? 86 'UpdatePlaystationIAPConfig' test.out

#- 87 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'DeletePlaystationIAPConfig' test.out

#- 88 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'ValidateExistedPlaystationIAPConfig' test.out

#- 89 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "yo4nIRysQdbufXjY", "backOfficeServerClientSecret": "nSoIFeouC2m38kXr", "enableStreamJob": true, "environment": "fwnwGioVwVzmmBVV", "streamName": "Ffpqx1AeLtzcPJ3j", "streamPartnerName": "tDYBo4FUTH7CGfKS"}' \
    > test.out 2>&1
eval_tap $? 89 'ValidatePlaystationIAPConfig' test.out

#- 90 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'GetSteamIAPConfig' test.out

#- 91 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "yxgRR1DiCqSMzpqI", "publisherAuthenticationKey": "FGLkDs7ACC1RgBfo"}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateSteamIAPConfig' test.out

#- 92 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'DeleteSteamIAPConfig' test.out

#- 93 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'GetTwitchIAPConfig' test.out

#- 94 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "NrHlFi2qJLgmBLE3", "clientSecret": "5YhyiDV90SeI5ypp", "organizationId": "BHoytVznCgNyx9fb"}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateTwitchIAPConfig' test.out

#- 95 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'DeleteTwitchIAPConfig' test.out

#- 96 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'GetXblIAPConfig' test.out

#- 97 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "T63ShEh8PbGikLjg"}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateXblIAPConfig' test.out

#- 98 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'DeleteXblAPConfig' test.out

#- 99 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'jcj34uulU6FYBZsW' \
    > test.out 2>&1
eval_tap $? 99 'UpdateXblBPCertFile' test.out

#- 100 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'Fbr3RSP0W9nBhvhf' \
    --itemId '8Q0DtJMcYQdN66bs' \
    --itemType 'INGAMEITEM' \
    --endTime '2HFnZlA6HKWW4fI1' \
    --startTime 'IQcoBQELcNlZkqTZ' \
    > test.out 2>&1
eval_tap $? 100 'DownloadInvoiceDetails' test.out

#- 101 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'rKgXNwvm4e5GX6H7' \
    --itemId '42OixhtAoKiVm6UR' \
    --itemType 'SUBSCRIPTION' \
    --endTime '95XhnUcvWB28Mpus' \
    --startTime 'uhhDJ5slzgiWZEty' \
    > test.out 2>&1
eval_tap $? 101 'GenerateInvoiceSummary' test.out

#- 102 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'd56LfxnbY97jjYgX' \
    --body '{"categoryPath": "chCbkXX26uEdCfQa", "targetItemId": "MAQuTKfC0I2kNjCM", "targetNamespace": "DtDMrentgn3Dhqci"}' \
    > test.out 2>&1
eval_tap $? 102 'SyncInGameItem' test.out

#- 103 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wIeShF9RKb9vvxuJ' \
    --body '{"appId": "lhXbWhbwPwToC6kn", "appType": "DLC", "baseAppId": "TJg46IewOXE2AkCh", "boothName": "3QIZsUf8lGFXcmwT", "categoryPath": "ERHclOdxIwqejxe1", "clazz": "8rNdb8Otq6j1mqUa", "displayOrder": 43, "entitlementType": "CONSUMABLE", "ext": {"7k05HAQltnSojV4j": {}, "T65yclX2FtAz0vJj": {}, "FIYWOaNdsimmkW2m": {}}, "features": ["haDwNqTbbFMXAMfV", "iH3xRHAKy4QxZkaX", "Z7vmiEd0JPxVyQps"], "flexible": true, "images": [{"as": "e0GZeMgsRsmH1EQr", "caption": "YmkPKTPOlhTtSiZN", "height": 59, "imageUrl": "nWIYN2NVL70Iw157", "smallImageUrl": "g00jr9b8MuYmmeKT", "width": 26}, {"as": "TOhvQpfbBke8aEdd", "caption": "36xj6wySoltDxsbz", "height": 47, "imageUrl": "8mcMdiS76YApGJ9u", "smallImageUrl": "fwLYkqIgLuZS6hsQ", "width": 35}, {"as": "Iz4NhGztZpr4U4fw", "caption": "QIiLXgmRasvjO4lj", "height": 64, "imageUrl": "m3XEwP2b4gd3xOei", "smallImageUrl": "i8Jnmssep2xD2NY0", "width": 20}], "itemIds": ["Oj3cvRFaTC11W0TG", "TCm4fZWuk6pQxDQp", "KqxLGeMvr9TsvcMQ"], "itemQty": {"7dBsaIecRxIsZvD6": 36, "WxF0YbuU5ar5qTLW": 95, "Q9Rrbk6C2cVWf6tt": 44}, "itemType": "APP", "listable": false, "localizations": {"1PO6ApCD2VXidT7w": {"description": "0Oc15N8WXBPp17PA", "localExt": {"ewqSm5x3B4t7WQnp": {}, "8jXZedgt5cyNe27H": {}, "LtwtVOaxgP6Jbct8": {}}, "longDescription": "puMybYGxD9IPmmsL", "title": "mu3kaPj0O4zd8Tb7"}, "cUNGPTBxiFFCrn7d": {"description": "jjs69FTFVGUVhvKh", "localExt": {"JCmeisql14mUHVbM": {}, "PimNhcZsU3VAdMDc": {}, "b4qlkiFAamqvZI2K": {}}, "longDescription": "wjqPBiWXade41s3r", "title": "H34mB2yPlRpWjmHZ"}, "AAvKTH8MuqIg0Czk": {"description": "guwuJCW7EEFB67AO", "localExt": {"Dbi9BzupBsFpYc77": {}, "GtRUcCFeY5g4XgBs": {}, "bfzqxBPNe8ae1Il4": {}}, "longDescription": "aAtEbu4IjGdqthRx", "title": "TjQ7gkZEY8rG0q0Q"}}, "lootBoxConfig": {"rewardCount": 98, "rewards": [{"lootBoxItems": [{"count": 88, "duration": 8, "endDate": "1976-10-05T00:00:00Z", "itemId": "JzRbkF2I03dIjvBb", "itemSku": "A6bfbYaJCJjfk2TU", "itemType": "vn95FhO7VW3mbDVM"}, {"count": 61, "duration": 92, "endDate": "1981-10-26T00:00:00Z", "itemId": "87t0ldWf7iSGIiKF", "itemSku": "tWtn4Yr2svKM6pqL", "itemType": "GZ0TBujELAUK6mQ5"}, {"count": 17, "duration": 18, "endDate": "1997-02-13T00:00:00Z", "itemId": "Bg7Jxc9pUnZmvhid", "itemSku": "wCkZwqjYLfTiCO1N", "itemType": "DBvQvRPnAz4VzW0C"}], "name": "poBCbyJsF5IjF1c0", "odds": 0.7816434083319361, "type": "REWARD_GROUP", "weight": 42}, {"lootBoxItems": [{"count": 69, "duration": 92, "endDate": "1998-06-09T00:00:00Z", "itemId": "CBgVRyihYNZ84CVh", "itemSku": "ziXV8HwSmvcvcDKF", "itemType": "19yVRafCjOuSYht8"}, {"count": 33, "duration": 54, "endDate": "1976-01-29T00:00:00Z", "itemId": "lTSvDwuOrP9lzpiX", "itemSku": "0VuFpZum7izxe7NP", "itemType": "zjOa8E7wY76PxLv9"}, {"count": 69, "duration": 1, "endDate": "1984-10-06T00:00:00Z", "itemId": "EUe89AwEw1HO4FnK", "itemSku": "tx4XLKAmlDr19uJ3", "itemType": "nq6VerzVCcI8y3Cz"}], "name": "0YqCKUh5RD9vNAp4", "odds": 0.15190691285038793, "type": "PROBABILITY_GROUP", "weight": 30}, {"lootBoxItems": [{"count": 28, "duration": 18, "endDate": "1987-10-06T00:00:00Z", "itemId": "pnQ5xF9wwbvMZyeD", "itemSku": "eRnVfPUa6xVVBcq3", "itemType": "wZpFIYeAg79HcLJX"}, {"count": 72, "duration": 19, "endDate": "1976-04-13T00:00:00Z", "itemId": "wW61duF87aUyrdt4", "itemSku": "XSpWBAetsanzqP8o", "itemType": "xfrtbECD1CYPwaiB"}, {"count": 54, "duration": 36, "endDate": "1982-10-14T00:00:00Z", "itemId": "fYL8Avt70ZUT2fSk", "itemSku": "3LL0calqxEewuGS4", "itemType": "69k2hG0WKt4sUman"}], "name": "YxM0UHZVNYzGMNIp", "odds": 0.7850676762606038, "type": "PROBABILITY_GROUP", "weight": 71}], "rollFunction": "CUSTOM"}, "maxCount": 78, "maxCountPerUser": 16, "name": "kUrfuf4U3WeYeA9t", "optionBoxConfig": {"boxItems": [{"count": 19, "duration": 62, "endDate": "1996-11-15T00:00:00Z", "itemId": "DdmJOlzwm9Su4FnS", "itemSku": "98QqftSjq7sn8yre", "itemType": "ciPLfkVyyJsbGpO6"}, {"count": 74, "duration": 58, "endDate": "1974-09-09T00:00:00Z", "itemId": "ehDJxEN7JlZc8LMq", "itemSku": "1o2jZWu4yA3r0u4q", "itemType": "1bTHXIjfJKyFlM0u"}, {"count": 2, "duration": 42, "endDate": "1974-06-16T00:00:00Z", "itemId": "wntCVqiYOJf5KwMZ", "itemSku": "QjzvjSozv6CTRDl0", "itemType": "zp9CzHFwinkBNi4g"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 34, "fixedTrialCycles": 60, "graceDays": 13}, "regionData": {"dSzBXdxapwhd5IQY": [{"currencyCode": "BQuxLvPuWYvE3fsN", "currencyNamespace": "y9Z9OhxXvCp9y7fL", "currencyType": "VIRTUAL", "discountAmount": 48, "discountExpireAt": "1998-11-02T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1992-02-12T00:00:00Z", "expireAt": "1985-08-21T00:00:00Z", "price": 38, "purchaseAt": "1996-04-05T00:00:00Z", "trialPrice": 26}, {"currencyCode": "AUrD9L1IiD6MlcEP", "currencyNamespace": "hMDFzjHZ3sIhzOx2", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1989-02-19T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1990-06-23T00:00:00Z", "expireAt": "1973-10-10T00:00:00Z", "price": 31, "purchaseAt": "1978-04-12T00:00:00Z", "trialPrice": 96}, {"currencyCode": "AyyUJyAK5PRMRMwd", "currencyNamespace": "vl0hv6g62GxBW2tQ", "currencyType": "VIRTUAL", "discountAmount": 9, "discountExpireAt": "1976-11-11T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1980-02-24T00:00:00Z", "expireAt": "1992-10-17T00:00:00Z", "price": 5, "purchaseAt": "1971-11-19T00:00:00Z", "trialPrice": 44}], "YvNQOsDa4bkcgepq": [{"currencyCode": "txjbrztee7QLTGAa", "currencyNamespace": "k7Kaol01DK97D2xn", "currencyType": "REAL", "discountAmount": 6, "discountExpireAt": "1976-10-11T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1999-07-23T00:00:00Z", "expireAt": "1977-09-25T00:00:00Z", "price": 17, "purchaseAt": "1993-06-09T00:00:00Z", "trialPrice": 19}, {"currencyCode": "eR5eQAe1rzmmgqBP", "currencyNamespace": "Rmd6mO4oI8KDqebm", "currencyType": "VIRTUAL", "discountAmount": 67, "discountExpireAt": "1971-11-18T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1983-08-10T00:00:00Z", "expireAt": "1999-10-12T00:00:00Z", "price": 31, "purchaseAt": "1974-07-25T00:00:00Z", "trialPrice": 92}, {"currencyCode": "7axEkvI4oxZEDxGi", "currencyNamespace": "BnNbn0zaf7CaOSlH", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1989-11-18T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1979-05-29T00:00:00Z", "expireAt": "1991-11-04T00:00:00Z", "price": 74, "purchaseAt": "1990-07-29T00:00:00Z", "trialPrice": 55}], "IwEsdOGBXBwnzDX8": [{"currencyCode": "v3xgC1Ge9PdbTTAJ", "currencyNamespace": "2Gp1r0sVZ6LJAOdd", "currencyType": "VIRTUAL", "discountAmount": 98, "discountExpireAt": "1976-01-27T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1992-04-12T00:00:00Z", "expireAt": "1975-09-02T00:00:00Z", "price": 81, "purchaseAt": "1972-08-30T00:00:00Z", "trialPrice": 96}, {"currencyCode": "Kv2LWfXqjr8fS79E", "currencyNamespace": "n3wYowBdkaZ3y6i3", "currencyType": "REAL", "discountAmount": 78, "discountExpireAt": "1982-08-27T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1993-12-04T00:00:00Z", "expireAt": "1979-03-28T00:00:00Z", "price": 48, "purchaseAt": "1978-03-17T00:00:00Z", "trialPrice": 18}, {"currencyCode": "1LyEirURERnEMzpI", "currencyNamespace": "mW6sjAHyCK5tNanG", "currencyType": "VIRTUAL", "discountAmount": 47, "discountExpireAt": "1980-03-25T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1975-10-04T00:00:00Z", "expireAt": "1981-09-17T00:00:00Z", "price": 5, "purchaseAt": "1976-10-09T00:00:00Z", "trialPrice": 93}]}, "saleConfig": {"currencyCode": "xTtmOFMebS4AdlNz", "price": 46}, "seasonType": "PASS", "sectionExclusive": true, "sellable": false, "sku": "F5m77TTh4gUoj8u2", "stackable": false, "status": "INACTIVE", "tags": ["Y48F1dl1q92m3iRl", "fnBAk0CwiAsR65yQ", "LiEtzVlnkflfn7pH"], "targetCurrencyCode": "9ssuHdGmxncCEr0K", "targetNamespace": "cgeqzGbruNB72HHM", "thumbnailUrl": "kjzyBB4UFKiaoV0V", "useCount": 82}' \
    > test.out 2>&1
eval_tap $? 103 'CreateItem' test.out

#- 104 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '5kypNrp2nFe9FmN8' \
    --appId '6sK5LOq4ft5jGcMI' \
    > test.out 2>&1
eval_tap $? 104 'GetItemByAppId' test.out

#- 105 QueryItems
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
eval_tap $? 105 'QueryItems' test.out

#- 106 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'C7bzjPpucddXJ5zi,fF8y959anrNSleyw,HbHig6IKWVZ77KeR' \
    > test.out 2>&1
eval_tap $? 106 'ListBasicItemsByFeatures' test.out

#- 107 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'WdECaFGzfZ2hxcJ2' \
    --itemIds 'Fnemn7M23SzUo4hN' \
    > test.out 2>&1
eval_tap $? 107 'GetItems' test.out

#- 108 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'BDh9ZFP1OW0nXOEr' \
    --sku 'QPS4VsRoYIK69yg9' \
    > test.out 2>&1
eval_tap $? 108 'GetItemBySku' test.out

#- 109 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'ADCGiXaLs2xjHkin' \
    --populateBundle  \
    --region 'OD975nARHCmhNHSX' \
    --storeId 'uqIHsxvaUoXDmwWs' \
    --sku 'ukxncuD3QxCXMd00' \
    > test.out 2>&1
eval_tap $? 109 'GetLocaleItemBySku' test.out

#- 110 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'YBWCaVVmM45mfIZs' \
    --storeId 'WhkS476dGGJwJ00U' \
    --itemIds 'H197MJ6zU7JLMQyM' \
    --userId 'WzYQCAaPJgoxGJoJ' \
    > test.out 2>&1
eval_tap $? 110 'GetEstimatedPrice' test.out

#- 111 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'aSzUtY4ZD0Xtb0U4' \
    --sku 'pH16NUsVY21NVIs7' \
    > test.out 2>&1
eval_tap $? 111 'GetItemIdBySku' test.out

#- 112 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'NRen2Y3Ns0QJQeaW,ytPfds1BYx0EaURy,df8ZyyZeHAWGgJUb' \
    --storeId 'UJRMbkcTglbU86Fy' \
    > test.out 2>&1
eval_tap $? 112 'GetBulkItemIdBySkus' test.out

#- 113 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'OjApNHBVfNOURcjY' \
    --region '3YYT9oTynmfIuBWg' \
    --storeId 'JTNFfM8M0IW4oe8K' \
    --itemIds 'Dgy0xZfAcNg14Ws8' \
    > test.out 2>&1
eval_tap $? 113 'BulkGetLocaleItems' test.out

#- 114 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'GetAvailablePredicateTypes' test.out

#- 115 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --userId 'TIP1LKiFQoLDvumf' \
    --body '{"itemIds": ["qrgSfnx2h61X9dN1", "MGRXBJ6mVV7JS9qj", "NLwvI8JdiY3RRiLi"]}' \
    > test.out 2>&1
eval_tap $? 115 'ValidateItemPurchaseCondition' test.out

#- 116 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lmOGF6dLLIeIVIjM' \
    --body '{"changes": [{"itemIdentities": ["cdlbdRXTGIrdNL5g", "JPqTAjgqaTHf1ANT", "J9Yk997XkGOdC6It"], "itemIdentityType": "ITEM_SKU", "regionData": {"XqvUWDjU1G0EVjVZ": [{"currencyCode": "w1ToLuPakQN1MpOs", "currencyNamespace": "1RVFrcg2CXxepx78", "currencyType": "REAL", "discountAmount": 74, "discountExpireAt": "1981-05-08T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1979-07-17T00:00:00Z", "discountedPrice": 14, "expireAt": "1975-04-02T00:00:00Z", "price": 63, "purchaseAt": "1999-10-06T00:00:00Z", "trialPrice": 56}, {"currencyCode": "zNXGTuQPIDpor7t1", "currencyNamespace": "aJLNNz6QIVC9Mfuc", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1997-11-22T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1980-01-28T00:00:00Z", "discountedPrice": 27, "expireAt": "1990-04-08T00:00:00Z", "price": 17, "purchaseAt": "1977-08-23T00:00:00Z", "trialPrice": 23}, {"currencyCode": "xmuCCVuFjS1GC1d2", "currencyNamespace": "b92B4vEgj3HOmhcW", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1974-09-04T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1996-01-30T00:00:00Z", "discountedPrice": 85, "expireAt": "1976-03-30T00:00:00Z", "price": 90, "purchaseAt": "1984-09-11T00:00:00Z", "trialPrice": 44}], "NIY9nMrBZo0lNUBD": [{"currencyCode": "ShHD32vvL28FPwTi", "currencyNamespace": "XfLcxDC9Ynd02mEC", "currencyType": "VIRTUAL", "discountAmount": 88, "discountExpireAt": "1980-02-27T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1994-10-08T00:00:00Z", "discountedPrice": 99, "expireAt": "1975-08-21T00:00:00Z", "price": 68, "purchaseAt": "1979-06-09T00:00:00Z", "trialPrice": 55}, {"currencyCode": "XHLLa31oQf7BULnZ", "currencyNamespace": "DhutDM6BqguqD5xx", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1985-05-01T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1974-06-15T00:00:00Z", "discountedPrice": 27, "expireAt": "1981-10-23T00:00:00Z", "price": 30, "purchaseAt": "1995-05-05T00:00:00Z", "trialPrice": 9}, {"currencyCode": "xQGRt6PqlkL0diRh", "currencyNamespace": "LC10ih2EQfY3XCv4", "currencyType": "REAL", "discountAmount": 8, "discountExpireAt": "1983-12-01T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1971-11-22T00:00:00Z", "discountedPrice": 10, "expireAt": "1987-04-10T00:00:00Z", "price": 6, "purchaseAt": "1978-02-27T00:00:00Z", "trialPrice": 83}], "NMd1onFjGRbxtABP": [{"currencyCode": "XDmgNEJBhgGq5GID", "currencyNamespace": "hNC66szbCCf73IFb", "currencyType": "VIRTUAL", "discountAmount": 22, "discountExpireAt": "1990-12-07T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1993-11-23T00:00:00Z", "discountedPrice": 92, "expireAt": "1988-08-07T00:00:00Z", "price": 93, "purchaseAt": "1998-07-25T00:00:00Z", "trialPrice": 64}, {"currencyCode": "4TjCrJHXGXku2YVu", "currencyNamespace": "OzhxHmnrrV9ZGWrZ", "currencyType": "VIRTUAL", "discountAmount": 47, "discountExpireAt": "1980-03-22T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1997-01-31T00:00:00Z", "discountedPrice": 47, "expireAt": "1984-04-18T00:00:00Z", "price": 30, "purchaseAt": "1993-05-04T00:00:00Z", "trialPrice": 86}, {"currencyCode": "mKDebNkylbynkgT9", "currencyNamespace": "vayLLiizac7Ge6zK", "currencyType": "REAL", "discountAmount": 8, "discountExpireAt": "1991-03-29T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1981-03-24T00:00:00Z", "discountedPrice": 39, "expireAt": "1979-12-16T00:00:00Z", "price": 19, "purchaseAt": "1989-09-14T00:00:00Z", "trialPrice": 58}]}}, {"itemIdentities": ["5RaJwvkWVco2LTo5", "ijlvDF8qBWCQ9dLW", "YyS8zdhMeBXH8x6H"], "itemIdentityType": "ITEM_ID", "regionData": {"9lhbvuQdW2jwKUck": [{"currencyCode": "c794ryY91lX8DD4M", "currencyNamespace": "YXlrJ81lHvv9rqvE", "currencyType": "REAL", "discountAmount": 9, "discountExpireAt": "1990-03-05T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1997-09-24T00:00:00Z", "discountedPrice": 25, "expireAt": "1995-07-29T00:00:00Z", "price": 19, "purchaseAt": "1984-01-31T00:00:00Z", "trialPrice": 21}, {"currencyCode": "Vej8N2yv6VTnOK7x", "currencyNamespace": "AvM7tuL81lsR7xxS", "currencyType": "REAL", "discountAmount": 90, "discountExpireAt": "1999-01-18T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1981-01-26T00:00:00Z", "discountedPrice": 26, "expireAt": "1999-04-27T00:00:00Z", "price": 75, "purchaseAt": "1984-08-23T00:00:00Z", "trialPrice": 68}, {"currencyCode": "i8HeV6jbalHmqBBf", "currencyNamespace": "i7sSF5BoGiTCVsXs", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1987-05-30T00:00:00Z", "discountPercentage": 2, "discountPurchaseAt": "1982-03-16T00:00:00Z", "discountedPrice": 44, "expireAt": "1986-01-29T00:00:00Z", "price": 23, "purchaseAt": "1978-05-03T00:00:00Z", "trialPrice": 20}], "XtdsJQeJ1too0qvx": [{"currencyCode": "phTLEEBGTtZyTjdK", "currencyNamespace": "NKgYazujsmSmylT1", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1989-07-11T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1988-05-10T00:00:00Z", "discountedPrice": 100, "expireAt": "1995-12-02T00:00:00Z", "price": 1, "purchaseAt": "1982-11-10T00:00:00Z", "trialPrice": 44}, {"currencyCode": "b48jISd97KORRhxS", "currencyNamespace": "WLWLNfHRD3V15QaG", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1993-08-15T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1974-06-17T00:00:00Z", "discountedPrice": 49, "expireAt": "1997-10-14T00:00:00Z", "price": 94, "purchaseAt": "1987-05-29T00:00:00Z", "trialPrice": 2}, {"currencyCode": "beqWBdQuWfgBAKx2", "currencyNamespace": "7MSBqabUXOGkkoMU", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1983-03-17T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1998-07-23T00:00:00Z", "discountedPrice": 0, "expireAt": "1987-10-30T00:00:00Z", "price": 9, "purchaseAt": "1998-11-23T00:00:00Z", "trialPrice": 59}], "RVfriSpPFnZBJZkD": [{"currencyCode": "nEiyfa2LrnpZxNnL", "currencyNamespace": "RH36bqS2oFY76PU1", "currencyType": "VIRTUAL", "discountAmount": 20, "discountExpireAt": "1984-03-26T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1998-08-07T00:00:00Z", "discountedPrice": 82, "expireAt": "1980-10-06T00:00:00Z", "price": 51, "purchaseAt": "1986-05-30T00:00:00Z", "trialPrice": 54}, {"currencyCode": "6GdkDcos5uVJ0BJf", "currencyNamespace": "Z0jvA54CSqZFDsO1", "currencyType": "VIRTUAL", "discountAmount": 22, "discountExpireAt": "1976-12-21T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1993-11-27T00:00:00Z", "discountedPrice": 58, "expireAt": "1994-01-23T00:00:00Z", "price": 28, "purchaseAt": "1994-09-11T00:00:00Z", "trialPrice": 78}, {"currencyCode": "KLc0xcTjqjdcEfU6", "currencyNamespace": "1OJYMnW49rWynp1c", "currencyType": "REAL", "discountAmount": 44, "discountExpireAt": "1981-12-18T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1973-01-28T00:00:00Z", "discountedPrice": 58, "expireAt": "1988-10-14T00:00:00Z", "price": 30, "purchaseAt": "1973-09-18T00:00:00Z", "trialPrice": 5}]}}, {"itemIdentities": ["KIuvnRCa9JktyBdx", "kZKrEWFw9GYxjiiO", "QAD77ci0vfWVZoRR"], "itemIdentityType": "ITEM_SKU", "regionData": {"Pi57HyKKz5nyI6ul": [{"currencyCode": "KNKoXa0dgx1JgjC5", "currencyNamespace": "6pda3YhtQxpCYME6", "currencyType": "VIRTUAL", "discountAmount": 35, "discountExpireAt": "1998-08-11T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1986-01-27T00:00:00Z", "discountedPrice": 72, "expireAt": "1999-01-13T00:00:00Z", "price": 87, "purchaseAt": "1979-12-30T00:00:00Z", "trialPrice": 34}, {"currencyCode": "PAd9sxoLnWGP1Paf", "currencyNamespace": "IjLX8ce0KbNN7Ycl", "currencyType": "VIRTUAL", "discountAmount": 74, "discountExpireAt": "1990-02-09T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1977-08-20T00:00:00Z", "discountedPrice": 87, "expireAt": "1998-04-30T00:00:00Z", "price": 26, "purchaseAt": "1976-12-22T00:00:00Z", "trialPrice": 45}, {"currencyCode": "vSoaGk4ktF5wnJDg", "currencyNamespace": "9Q3WXiydCOInVols", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1985-09-30T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1975-03-20T00:00:00Z", "discountedPrice": 1, "expireAt": "1988-02-10T00:00:00Z", "price": 37, "purchaseAt": "1981-08-27T00:00:00Z", "trialPrice": 78}], "1cfswmeFpvtDteto": [{"currencyCode": "QVFL8LNW11vtpaTx", "currencyNamespace": "i7k489jRCn48bvkC", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1989-04-27T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1998-07-03T00:00:00Z", "discountedPrice": 99, "expireAt": "1996-03-11T00:00:00Z", "price": 82, "purchaseAt": "1998-10-05T00:00:00Z", "trialPrice": 99}, {"currencyCode": "ZZQAJza84lKKmVOa", "currencyNamespace": "TS6xBbNrSUAW2ak7", "currencyType": "VIRTUAL", "discountAmount": 48, "discountExpireAt": "1979-09-16T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1988-10-06T00:00:00Z", "discountedPrice": 13, "expireAt": "1994-08-14T00:00:00Z", "price": 82, "purchaseAt": "1974-06-20T00:00:00Z", "trialPrice": 60}, {"currencyCode": "x4unq3eOMHIKeTyB", "currencyNamespace": "G5dCUoExnKfV3869", "currencyType": "REAL", "discountAmount": 81, "discountExpireAt": "1975-11-04T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1982-11-25T00:00:00Z", "discountedPrice": 6, "expireAt": "1990-02-25T00:00:00Z", "price": 67, "purchaseAt": "1988-08-11T00:00:00Z", "trialPrice": 53}], "GVU7Exlkmc4xYiLj": [{"currencyCode": "LyZrXr9Bhtzn8jAd", "currencyNamespace": "Tn6xBhrciryLm67r", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1971-01-29T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1988-06-14T00:00:00Z", "discountedPrice": 28, "expireAt": "1996-03-24T00:00:00Z", "price": 32, "purchaseAt": "1997-12-28T00:00:00Z", "trialPrice": 92}, {"currencyCode": "IjL0Vxe5n9Lx3QcF", "currencyNamespace": "o9gxOgvDc7xMrRKv", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1973-10-09T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1994-05-24T00:00:00Z", "discountedPrice": 84, "expireAt": "1995-05-15T00:00:00Z", "price": 100, "purchaseAt": "1975-10-26T00:00:00Z", "trialPrice": 25}, {"currencyCode": "VzW1QqxnWR5sheLg", "currencyNamespace": "sAF4ctv5guycGiq9", "currencyType": "REAL", "discountAmount": 88, "discountExpireAt": "1998-12-06T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1983-07-21T00:00:00Z", "discountedPrice": 90, "expireAt": "1988-03-27T00:00:00Z", "price": 8, "purchaseAt": "1977-06-26T00:00:00Z", "trialPrice": 10}]}}]}' \
    > test.out 2>&1
eval_tap $? 116 'BulkUpdateRegionData' test.out

#- 117 SearchItems
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
eval_tap $? 117 'SearchItems' test.out

#- 118 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '12' \
    --offset '11' \
    --sortBy 'updatedAt:asc,displayOrder:asc,updatedAt:desc' \
    --storeId 'JDUT0uKAPrARya2I' \
    > test.out 2>&1
eval_tap $? 118 'QueryUncategorizedItems' test.out

#- 119 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'MlNiXpF4qvsUUpHq' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'i33TcBGkc0HjUcnk' \
    > test.out 2>&1
eval_tap $? 119 'GetItem' test.out

#- 120 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'pU9oVzl2kBuLFXIe' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CEKZUTz3GvCAZ5j2' \
    --body '{"appId": "4acYHbrryHB6GO9z", "appType": "DLC", "baseAppId": "3FaepA3b3YJ9nJM6", "boothName": "vtT27xv85K5MU2qm", "categoryPath": "beqaVemINdClpF7O", "clazz": "vlBIEgjse5kd6GED", "displayOrder": 29, "entitlementType": "CONSUMABLE", "ext": {"08yq5E5HleLoog4m": {}, "e2NBFp62xlXvVcJe": {}, "rTPW02PWsHiKYArA": {}}, "features": ["QIyLarjaLOKnX51y", "0DjjwMv4vrIPRtvh", "xnKBfBfDlrQQuAc1"], "flexible": true, "images": [{"as": "PykS8YLmwtYgWGcA", "caption": "0h4G1LZ1HaX5UBMb", "height": 37, "imageUrl": "X1B9oVuzG2CnYX2Y", "smallImageUrl": "BF2g7TVtzYEHUodh", "width": 28}, {"as": "iUfBthbepUCTWiZ1", "caption": "uqh7GAi4FEIu44u8", "height": 45, "imageUrl": "ZLRxYlYqlpq03BGd", "smallImageUrl": "Ik4oEogFVGR71rJO", "width": 57}, {"as": "iA0tQWlHwBcTtztx", "caption": "3VAl6tXFbnATCzUO", "height": 70, "imageUrl": "WmKgE8CZ4AELr5lr", "smallImageUrl": "aa5v5P5Cj8hgFsqH", "width": 59}], "itemIds": ["adEoIVmprwPsa9YD", "92CX0rITajpwHITG", "eHTnqRbzBB9ZFgJb"], "itemQty": {"Q3Fj1umx4ItzkMJ7": 5, "YsHooOIaxIpb1cIO": 72, "VIQvRkQJAtDUH9tx": 53}, "itemType": "BUNDLE", "listable": true, "localizations": {"hGz1ermJYXsYgL7T": {"description": "fyIlAwjTZdRZJJzW", "localExt": {"ZwvTX2bamSCvX1nw": {}, "vSWdDwD7WJHzgNZU": {}, "KsI5y0mR3zMyTsft": {}}, "longDescription": "KqnsIJctAdxyZVKH", "title": "A9DkaSOWgtg8yw8l"}, "HEbVDwBAqanOlscR": {"description": "IWw82k5K5VTkdubk", "localExt": {"OFldMCQ98JH4n0Jt": {}, "gqzZv5kVu4S95mj8": {}, "YRvae4f4lhBPbarb": {}}, "longDescription": "WEm8bVtZcfVCPdQh", "title": "im9QKUAFTVYelIlG"}, "Jg9wdc8bihhWjfZp": {"description": "fcFBUsnnDJlmD1iE", "localExt": {"okbUiYzCQh2iNTwt": {}, "nohddMzMTQ9P7sYL": {}, "DWAJOA75K4BYJ2fk": {}}, "longDescription": "qYJoF2FI3vyyqRzc", "title": "20O7FdsJP1G9tyBT"}}, "lootBoxConfig": {"rewardCount": 12, "rewards": [{"lootBoxItems": [{"count": 29, "duration": 62, "endDate": "1974-12-25T00:00:00Z", "itemId": "KzuMYDUTLBeCidXj", "itemSku": "uGgx8ncXejmeZtzT", "itemType": "0qj0ltsqfiZrthVv"}, {"count": 49, "duration": 98, "endDate": "1996-08-18T00:00:00Z", "itemId": "0OCKDJE3RMUddwSS", "itemSku": "gxCu8zru1DhGAYOH", "itemType": "R5BWa9VzIkaQEl1i"}, {"count": 95, "duration": 8, "endDate": "1992-10-30T00:00:00Z", "itemId": "roNB6hI6IpGcToWg", "itemSku": "FvdRhG9NwV3zDuqV", "itemType": "lVTypcYPK8IxrSZu"}], "name": "xWl0Je4fJIyFAm3D", "odds": 0.6841347009700219, "type": "PROBABILITY_GROUP", "weight": 89}, {"lootBoxItems": [{"count": 40, "duration": 54, "endDate": "1989-01-10T00:00:00Z", "itemId": "wnPS2urJqerobWMZ", "itemSku": "GVL5KLTxahWlS6Xd", "itemType": "BaKSLCgOOPXM6XTU"}, {"count": 15, "duration": 72, "endDate": "1999-03-31T00:00:00Z", "itemId": "dJ90yqHDNacl4F9G", "itemSku": "6Dl5TFwBY6HKXAbl", "itemType": "kT8VGgSH8MGZGwiV"}, {"count": 19, "duration": 33, "endDate": "1973-09-04T00:00:00Z", "itemId": "RLaA643nTMtXSAye", "itemSku": "jnny0Ju13b6o5uB2", "itemType": "XM6IHy7EEvHyLmcv"}], "name": "rZZOdwe1x8RjU6Bi", "odds": 0.9781327863012951, "type": "REWARD_GROUP", "weight": 10}, {"lootBoxItems": [{"count": 71, "duration": 63, "endDate": "1987-03-09T00:00:00Z", "itemId": "2sUBBq2SimQQoLbe", "itemSku": "5YOJvxGRxUzrTwag", "itemType": "H7BMT1IZKTdNFVBQ"}, {"count": 55, "duration": 4, "endDate": "1983-05-20T00:00:00Z", "itemId": "2JTllJkRGB8jqJEd", "itemSku": "6eqqsBVyONV0JRto", "itemType": "zI0jpliCFQ6WgJpG"}, {"count": 84, "duration": 18, "endDate": "1981-02-18T00:00:00Z", "itemId": "BYeQZOzATNSV9E9y", "itemSku": "yNb7yaLXzAVYymOu", "itemType": "hCkZu4htrsf8eIFS"}], "name": "ovTGXaMsq8ePN1oc", "odds": 0.23324146460862305, "type": "REWARD_GROUP", "weight": 20}], "rollFunction": "CUSTOM"}, "maxCount": 48, "maxCountPerUser": 5, "name": "Upe8SjMvpqM8pugg", "optionBoxConfig": {"boxItems": [{"count": 83, "duration": 63, "endDate": "1976-01-30T00:00:00Z", "itemId": "9iCqfW6rqGOQny4i", "itemSku": "j4ysYPonb59gQffk", "itemType": "NOmubxEJr2qEAuJb"}, {"count": 32, "duration": 44, "endDate": "1997-09-02T00:00:00Z", "itemId": "Srcbc4LWfKaY5c1t", "itemSku": "P5TDuI5f6m4KC07C", "itemType": "nsZe32hqEcB1ExYM"}, {"count": 56, "duration": 3, "endDate": "1997-11-26T00:00:00Z", "itemId": "ckvoaJYdMqGegcg3", "itemSku": "eRvBZXN3cjIXmFWR", "itemType": "Jnj8xN7HDPTUEDPN"}]}, "purchasable": false, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 94, "fixedTrialCycles": 16, "graceDays": 84}, "regionData": {"C9ZDj4E4mv12FNXy": [{"currencyCode": "poOLl13j84P0Kqir", "currencyNamespace": "J4PkMFtsnFfz8Ew0", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1973-08-17T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1981-04-12T00:00:00Z", "expireAt": "1985-12-10T00:00:00Z", "price": 91, "purchaseAt": "1987-10-29T00:00:00Z", "trialPrice": 0}, {"currencyCode": "LSQ4GvLtz50D3rpB", "currencyNamespace": "fBovqLwXBuT30EYe", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1997-06-17T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1985-09-20T00:00:00Z", "expireAt": "1993-02-25T00:00:00Z", "price": 1, "purchaseAt": "1982-08-16T00:00:00Z", "trialPrice": 72}, {"currencyCode": "KoUfiHjGmCyPsKCJ", "currencyNamespace": "Tv1ic9gvagF2cSuz", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1980-03-21T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1993-06-07T00:00:00Z", "expireAt": "1981-03-17T00:00:00Z", "price": 39, "purchaseAt": "1984-02-19T00:00:00Z", "trialPrice": 79}], "V7nmDk29mcjSuz9v": [{"currencyCode": "bNStqPtQmQN6eKAG", "currencyNamespace": "iZFCftT0RWECdjWY", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1977-11-19T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1980-04-02T00:00:00Z", "expireAt": "1972-07-11T00:00:00Z", "price": 30, "purchaseAt": "1972-02-16T00:00:00Z", "trialPrice": 57}, {"currencyCode": "wYLQcDvkaEIIPoJT", "currencyNamespace": "83zEGXmVBZLyrH9J", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1978-07-21T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1998-04-10T00:00:00Z", "expireAt": "1979-01-06T00:00:00Z", "price": 83, "purchaseAt": "1987-12-26T00:00:00Z", "trialPrice": 55}, {"currencyCode": "LkP5hc2Fh04JTsqD", "currencyNamespace": "TynCewqJligLlRxO", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1976-03-08T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1972-07-26T00:00:00Z", "expireAt": "1996-03-25T00:00:00Z", "price": 70, "purchaseAt": "1996-08-16T00:00:00Z", "trialPrice": 51}], "RxF6HtlER2txs4qr": [{"currencyCode": "NARATn6KXOutlYBb", "currencyNamespace": "LhL8KXx25FZfQIod", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1982-05-17T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1992-02-07T00:00:00Z", "expireAt": "1980-08-10T00:00:00Z", "price": 22, "purchaseAt": "1979-12-05T00:00:00Z", "trialPrice": 59}, {"currencyCode": "y0fGvTGgfLKsg0b1", "currencyNamespace": "Bq78cE5O5pmPnbiP", "currencyType": "REAL", "discountAmount": 1, "discountExpireAt": "1976-04-18T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1982-12-26T00:00:00Z", "expireAt": "1983-04-11T00:00:00Z", "price": 2, "purchaseAt": "1979-10-02T00:00:00Z", "trialPrice": 24}, {"currencyCode": "3rVaauufxkPHElug", "currencyNamespace": "48TgfNu0rqXUOyTo", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1994-09-02T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1976-10-12T00:00:00Z", "expireAt": "1986-10-27T00:00:00Z", "price": 94, "purchaseAt": "1977-07-19T00:00:00Z", "trialPrice": 72}]}, "saleConfig": {"currencyCode": "Pl3dKF7NXEjrJMki", "price": 67}, "seasonType": "PASS", "sectionExclusive": true, "sellable": true, "sku": "bADMfuOmh0lciRhV", "stackable": false, "status": "INACTIVE", "tags": ["KqxJiFJdrmj5vhzg", "sJwex7wq8ZPlXNaU", "NgdY2vfJuje5cPnm"], "targetCurrencyCode": "GjTvYa5Pqx1K7qcA", "targetNamespace": "oijBPAp6EPb988Nz", "thumbnailUrl": "xrDKVpULjjiw3NeV", "useCount": 66}' \
    > test.out 2>&1
eval_tap $? 120 'UpdateItem' test.out

#- 121 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'fZbpTJezzriCDWXT' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId '59SRu0YqUxKDc84O' \
    > test.out 2>&1
eval_tap $? 121 'DeleteItem' test.out

#- 122 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'MIzvTScdbKBsAyJM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 51, "orderNo": "wjr7gSGhnfuF4WZi"}' \
    > test.out 2>&1
eval_tap $? 122 'AcquireItem' test.out

#- 123 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'QVICVpWd3UM08gMX' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'hdf3juXW4JprIb3C' \
    > test.out 2>&1
eval_tap $? 123 'GetApp' test.out

#- 124 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'JCAtvSG8Cfa9dzOJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DGCTHIOFjeXbsSgR' \
    --body '{"carousel": [{"alt": "43kIDzxBwqRJTzrH", "previewUrl": "NZWUsq5lQo2jy29E", "thumbnailUrl": "JigqYhyVhURx1yPe", "type": "image", "url": "Tw6zQuoZcXQpoTOx", "videoSource": "generic"}, {"alt": "2KNGfhzfCTxxrsRR", "previewUrl": "Lee3TcJ7DQIi45aC", "thumbnailUrl": "DHN9mVug2zkVf6Kg", "type": "video", "url": "FVKlbYHtbPtaxvag", "videoSource": "youtube"}, {"alt": "ugFDa6wUQvehKqwC", "previewUrl": "h86XmRkCEcfHDCdl", "thumbnailUrl": "59Wp9A3tXGve6DdK", "type": "image", "url": "uvg8f2cIoByk9fxt", "videoSource": "vimeo"}], "developer": "UcCEt0DzmkJq1sml", "forumUrl": "5bYt76BNsi4giR94", "genres": ["Racing", "Racing", "Adventure"], "localizations": {"pKKdzxoufCNlFoOc": {"announcement": "WQQy4bjmQeEweoBH", "slogan": "TdwAk7ZQnbqY1cQw"}, "VEtAr5kKKAo9MM2C": {"announcement": "qm84jVi9kIpqgrzp", "slogan": "UkNOBWydXV0Fi02a"}, "Fr8CDapjwNOl4k8r": {"announcement": "VNrm8drv8QD2JOe2", "slogan": "Ntz7EFvowPgIGuet"}}, "platformRequirements": {"xFMqXCQMAqQ2ZRGz": [{"additionals": "NtrThFa9XU8moslu", "directXVersion": "iHZJ7O8sAQ32wj9u", "diskSpace": "aDzsr9xYiWRuuzQJ", "graphics": "iLc1eI9w3JEhxPGb", "label": "Ek7s7gw07FlounC3", "osVersion": "vJKBC7SwgoViPeIB", "processor": "4Ehy0Y5aSJVDginx", "ram": "AM77eY9C14FbfiI2", "soundCard": "NPvl1kCY5bEokxXx"}, {"additionals": "kWZbjf7GZxaossQm", "directXVersion": "jo69wohJFyTNk5FG", "diskSpace": "UPhR4LEZvz3EjFR7", "graphics": "996Ug5m4axDV5uTc", "label": "YsoahUrELQ1btjJO", "osVersion": "qQMgZWAU6E92nHJz", "processor": "vw7tnYtGfv0EJyjB", "ram": "u4EzwRjD7jmQJeFP", "soundCard": "ghqamSc5y0X48eT7"}, {"additionals": "Mluexk87b9Z5BTsE", "directXVersion": "A3EdmW8saabP4xRo", "diskSpace": "wfNojzPXI2v0prR3", "graphics": "OEey0MkZwS6TYwNN", "label": "3UYhic03qGEg5fNz", "osVersion": "BVrjo3g8CfRwtyl1", "processor": "HeT7VEPgG40QyXzs", "ram": "Ozgck078IghoQBp2", "soundCard": "mWAOYksczxBS0OBC"}], "a2vWadLmQtYKmEMz": [{"additionals": "icbuL2S3RiW8dLTC", "directXVersion": "BfGUdVEdvdQL7sVw", "diskSpace": "cZ2PofaJoSqtrEOq", "graphics": "xH46fRTSZoDdT0fe", "label": "fo74eg3Nt2c0r4Gq", "osVersion": "F0NHglOVuNZ9LzNe", "processor": "JnBurh54CWbYb0Pe", "ram": "byt8b4DGscjwrizs", "soundCard": "FUgYwbaLvqvQ2Nbm"}, {"additionals": "DITuymTBjn3d2sFz", "directXVersion": "MS3QaVjZF7Ax6115", "diskSpace": "Kg9U8vrQJXQxoIbV", "graphics": "i2CLEk277Ivjj1A6", "label": "47XQ3koaAfZIim0s", "osVersion": "FPm1YN27bojDVaZL", "processor": "px4kEWYkO6KrKUMh", "ram": "JrASBh61hmWKSSrF", "soundCard": "35anDGvur19V18oI"}, {"additionals": "rUKXttgAI2QdWJFL", "directXVersion": "moPEgd8EMspOs8nk", "diskSpace": "ic9gj5vyUMAAmIHY", "graphics": "bsxG5N066FXb88Sb", "label": "LOa21DiSFsm0XXQJ", "osVersion": "WszvTQEuALzDNp1S", "processor": "Z58aDllwzTRHak1M", "ram": "Xxj7Esrg7900nml5", "soundCard": "BidsK9dCEzhVnOv0"}], "PQbVIaKiHfoeorY7": [{"additionals": "A1otGFyv2SMjbEr5", "directXVersion": "0qGdCZIc6EFqBKxb", "diskSpace": "S7Q2OgRucL1jwRXz", "graphics": "fjDZZBmOau6syme0", "label": "6c6SKLc2mEC3IXl5", "osVersion": "XCbkOfHaGr5kdazl", "processor": "ypvt6lSLfU7HByGX", "ram": "PMqxj4hBgVY3YAxZ", "soundCard": "LKbcOdyjqf6Q4oiw"}, {"additionals": "oJcaRMEb15LBlTVu", "directXVersion": "fc5ZyODR2NVyn4PR", "diskSpace": "qf3eRbZqBAoKGcVC", "graphics": "dMiSNV4qBrt1kcLm", "label": "Rv6EJtl5xWnsb8oW", "osVersion": "q94RImNWVIJnhhwF", "processor": "DV1VitaomvWTzdsW", "ram": "4N70wYS4Kj7Yi2Vv", "soundCard": "oQNW8Yc481dYdvGx"}, {"additionals": "JAMDRA1LF7jdWlek", "directXVersion": "FwO94VBCV9qJhWva", "diskSpace": "2FPBujX0geYCpGJM", "graphics": "4sqsPNJMiZXXOFwm", "label": "GWAvNF0Z0GkwxUNY", "osVersion": "yNwGiKrknH0Y5mrQ", "processor": "gLC6D2qsFiQHglUQ", "ram": "MZi5WjMZfOadpgeg", "soundCard": "CUjTdi1Ehr8OtqpN"}]}, "platforms": ["Windows", "IOS", "MacOS"], "players": ["Single", "Coop", "Single"], "primaryGenre": "Sports", "publisher": "uNy4ejmVA3vMCsGy", "releaseDate": "1992-06-18T00:00:00Z", "websiteUrl": "d12B8QNUz0hFFNbH"}' \
    > test.out 2>&1
eval_tap $? 124 'UpdateApp' test.out

#- 125 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId '6j2W4roZM2UKAXEE' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sL5D0oiFchQnVeq3' \
    > test.out 2>&1
eval_tap $? 125 'DisableItem' test.out

#- 126 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'g2AB2WIRUQmauIY5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 126 'GetItemDynamicData' test.out

#- 127 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'HXCZ0W4XmWP0HzSd' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iylLhVYszm8xY33O' \
    > test.out 2>&1
eval_tap $? 127 'EnableItem' test.out

#- 128 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'Qbumu2QHLyZNuysy' \
    --itemId 'M4OfCzdQCXMAWnf8' \
    --namespace "$AB_NAMESPACE" \
    --storeId '7YPNOe9Eevf1fhMg' \
    > test.out 2>&1
eval_tap $? 128 'FeatureItem' test.out

#- 129 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature '1E2k7QLFrVgtX7y0' \
    --itemId 'fPOieDCow2zXyFFV' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pM87yqEwEacQMTlq' \
    > test.out 2>&1
eval_tap $? 129 'DefeatureItem' test.out

#- 130 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'N4LKkxJ5v3SBafnK' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'NiMPbFkFGA85W3HJ' \
    --populateBundle  \
    --region 'kqgS2B37wwoPYOHi' \
    --storeId 'IsxmsLBPBJuNLnWR' \
    > test.out 2>&1
eval_tap $? 130 'GetLocaleItem' test.out

#- 131 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'rtW870qD88ZcduZS' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'e7W20UZcDaiq0nEZ' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 85, "comparison": "isGreaterThanOrEqual", "name": "yhqFJkDClOsKmfsg", "predicateType": "SeasonTierPredicate", "value": "VLMlHi8i9gOVqajU", "values": ["nnGeZsZVgbPzPFbr", "WrgEsWDtaKzn8dZw", "OMZMgWkFN7Tpkx6G"]}, {"anyOf": 5, "comparison": "includes", "name": "XTrFibRAhzzEWzWl", "predicateType": "SeasonTierPredicate", "value": "dW2JKmQafUs2bxYz", "values": ["lg7gYs6unPYQ9jNQ", "tOEyVbKIf1ZbzgUw", "d8DHoCQykmXHYmkR"]}, {"anyOf": 81, "comparison": "isLessThan", "name": "1di1ldhOh6HvjnYu", "predicateType": "EntitlementPredicate", "value": "NfC4A2ODiZhbfb8Q", "values": ["mnq3FGQn3Ahu5wxq", "FfgK46GjCWaP8huT", "qCyK1XH9D6vl5eFd"]}]}, {"operator": "and", "predicates": [{"anyOf": 30, "comparison": "isLessThan", "name": "Jq4mChmQHQhO9IKB", "predicateType": "EntitlementPredicate", "value": "DFQfXFD58sG6uDhF", "values": ["utjS029BiJWOG1m7", "MKclr5igjNTVItrH", "YlrzJBYSeMuJfQec"]}, {"anyOf": 66, "comparison": "isGreaterThan", "name": "hxJgaVfw5Vnyq8Oz", "predicateType": "SeasonTierPredicate", "value": "c6VbE0AGcekjMNHu", "values": ["PXtz8tXxrmzafMUg", "uyDoN91uc28HoSpG", "t1g0GGbT4Hf2PPKO"]}, {"anyOf": 23, "comparison": "excludes", "name": "GGvi9kg3rMIzNmhJ", "predicateType": "SeasonTierPredicate", "value": "eg9q86IaDFjjx6uZ", "values": ["E8lOLAfTXKLzbrdd", "erWbtwTX9gNRByjb", "qcKLa7LevxNHOSEh"]}]}, {"operator": "and", "predicates": [{"anyOf": 23, "comparison": "isGreaterThan", "name": "p693lRwtc43atCuC", "predicateType": "SeasonTierPredicate", "value": "X4yFQFdrRoM6FoqC", "values": ["Sck3ggZWJlSlCQMD", "ji329PfVrvMEPtps", "Yw7AlxO6qdFpc71s"]}, {"anyOf": 90, "comparison": "isGreaterThan", "name": "NcpK1QkB2Sy8Ww79", "predicateType": "SeasonTierPredicate", "value": "HuGz3b5WAEvdRF9b", "values": ["OO97DmQ5ZOzx6iCJ", "7OydVw0zCqoMZvpI", "qMj4ro5B19VE838c"]}, {"anyOf": 93, "comparison": "isLessThanOrEqual", "name": "u60IifzMhkk5Pxsj", "predicateType": "SeasonPassPredicate", "value": "7VbBPUWipz9C05Ya", "values": ["aO3yJpA3KMxBlrRy", "tER1qdTelFAadM9y", "bFX4FCK5ucTFsAFz"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 131 'UpdateItemPurchaseCondition' test.out

#- 132 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId '66Drf4SSGGt3MiBK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "ohow3kKoaP1K4CDu"}' \
    > test.out 2>&1
eval_tap $? 132 'ReturnItem' test.out

#- 133 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --name 'cn7KaoCEkRdo6qHY' \
    --offset '70' \
    --tag 'R5dShqiBUI9esSsX' \
    > test.out 2>&1
eval_tap $? 133 'QueryKeyGroups' test.out

#- 134 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "egSEhrPpK2q8kxR4", "name": "BuEksS2A9VOA8H9V", "status": "ACTIVE", "tags": ["EJaPnAFjsodyJQVV", "BrShGbIIuqK8C403", "HgoXCR6XOMXwKdfq"]}' \
    > test.out 2>&1
eval_tap $? 134 'CreateKeyGroup' test.out

#- 135 GetKeyGroupByBoothName
eval_tap 0 135 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 136 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'k8T4QHK30EX0Fclp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'GetKeyGroup' test.out

#- 137 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'Dl5HsuracO5Mnjnx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "D1OXkxShFVQTRekL", "name": "fjmy8zosRCRgVwbr", "status": "INACTIVE", "tags": ["Kmb01yA7U7dGMjup", "ZkZQY8CNyT4k3DIb", "fT22G5NpE130YWSg"]}' \
    > test.out 2>&1
eval_tap $? 137 'UpdateKeyGroup' test.out

#- 138 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'xpKWtdtdtVW9anEN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetKeyGroupDynamic' test.out

#- 139 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'mxb9e7vXZV3ig8Jg' \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --offset '97' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 139 'ListKeys' test.out

#- 140 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId '209BySn8aUaGlAyv' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 140 'UploadKeys' test.out

#- 141 QueryOrders
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
eval_tap $? 141 'QueryOrders' test.out

#- 142 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'GetOrderStatistics' test.out

#- 143 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '2gAJOTCbx7J3gNLI' \
    > test.out 2>&1
eval_tap $? 143 'GetOrder' test.out

#- 144 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'lTk3Bpclrk4hIRn0' \
    --body '{"description": "znIKzAEAHQpBOgHE"}' \
    > test.out 2>&1
eval_tap $? 144 'RefundOrder' test.out

#- 145 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 145 'GetPaymentCallbackConfig' test.out

#- 146 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": false, "notifyUrl": "iXaBzsmaxjTZPlLi", "privateKey": "tytGka7Kv5TacQKF"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdatePaymentCallbackConfig' test.out

#- 147 QueryPaymentNotifications
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
eval_tap $? 147 'QueryPaymentNotifications' test.out

#- 148 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'HumyfuBNisecYbcO' \
    --limit '32' \
    --offset '73' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 148 'QueryPaymentOrders' test.out

#- 149 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "fuBs1Vpqn47GVghT", "currencyNamespace": "H2wToOnq9U5lyW89", "customParameters": {"Xwt3wmRTrDCjhnKv": {}, "sHezWTqgYPixtHk6": {}, "lWq6tEeUmU96FLEa": {}}, "description": "k0mJqjRYldcTpdeC", "extOrderNo": "D9XPRi4bAQL7VE2w", "extUserId": "L8Y4JFVUdzA8bvXl", "itemType": "MEDIA", "language": "IDh-FReB-394", "metadata": {"Pm5ztrr09CDA8Ij5": "bGKSuopWQbaCvdPS", "q8Z27GpvHCDx55JZ": "5z6gujpFzlPspQD9", "IRIpDDubntPCFxfe": "oW2NdSWzOXjO1NQU"}, "notifyUrl": "qWHBW78XREZCiTNA", "omitNotification": true, "platform": "9NCKKXu1bqI2M5Pm", "price": 80, "recurringPaymentOrderNo": "fKnQ7BYGjCUDMOrb", "region": "moRvWnfmGFy0eUoO", "returnUrl": "Bd90h9EDqSTOfoNe", "sandbox": true, "sku": "JnZcrqrPye7fCwi7", "subscriptionId": "Il2wIFlHm9N6owMH", "targetNamespace": "MtJy1Oqn59tEGm9N", "targetUserId": "YeUT5P0nx8TqSZdZ", "title": "5C8mFI9TnvzEqBNM"}' \
    > test.out 2>&1
eval_tap $? 149 'CreatePaymentOrderByDedicated' test.out

#- 150 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'F9CZvPxT5zbreMc9' \
    > test.out 2>&1
eval_tap $? 150 'ListExtOrderNoByExtTxId' test.out

#- 151 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'fBoU3RHNDFjLKFre' \
    > test.out 2>&1
eval_tap $? 151 'GetPaymentOrder' test.out

#- 152 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'py56eW1kmb15QeIQ' \
    --body '{"extTxId": "F51c4MqJzDSvELgB", "paymentMethod": "e6dboSdhkBzAzPkt", "paymentProvider": "ALIPAY"}' \
    > test.out 2>&1
eval_tap $? 152 'ChargePaymentOrder' test.out

#- 153 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'PBNHKPx62tHxDb06' \
    --body '{"description": "ZFy3uglSp2UxvF2u"}' \
    > test.out 2>&1
eval_tap $? 153 'RefundPaymentOrderByDedicated' test.out

#- 154 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'LXWilRD7HD6LCgdF' \
    --body '{"amount": 49, "currencyCode": "8aVSCN6oCETQ8gID", "notifyType": "CHARGE", "paymentProvider": "XSOLLA", "salesTax": 78, "vat": 47}' \
    > test.out 2>&1
eval_tap $? 154 'SimulatePaymentOrderNotification' test.out

#- 155 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ssMvy9gkfTMRrXVR' \
    > test.out 2>&1
eval_tap $? 155 'GetPaymentOrderChargeStatus' test.out

#- 156 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    > test.out 2>&1
eval_tap $? 156 'GetPlatformEntitlementConfig' test.out

#- 157 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    --body '{"allowedPlatformOrigins": ["Nintendo", "Playstation", "Epic"]}' \
    > test.out 2>&1
eval_tap $? 157 'UpdatePlatformEntitlementConfig' test.out

#- 158 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 158 'GetPlatformWalletConfig' test.out

#- 159 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedBalanceOrigins": ["Epic", "GooglePlay", "Nintendo"]}' \
    > test.out 2>&1
eval_tap $? 159 'UpdatePlatformWalletConfig' test.out

#- 160 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Oculus' \
    > test.out 2>&1
eval_tap $? 160 'ResetPlatformWalletConfig' test.out

#- 161 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 161 'GetRevocationConfig' test.out

#- 162 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "CUSTOM"}}, "wallet": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}' \
    > test.out 2>&1
eval_tap $? 162 'UpdateRevocationConfig' test.out

#- 163 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 163 'DeleteRevocationConfig' test.out

#- 164 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'FmkHJ6BPOKFLxIwK' \
    --limit '38' \
    --offset '41' \
    --source 'ORDER' \
    --startTime 'CqlMHiQN3HWJw9zI' \
    --status 'SUCCESS' \
    --transactionId 'fMjTU226l07jPlcY' \
    --userId 'aqYM7YfBmhjI9Y28' \
    > test.out 2>&1
eval_tap $? 164 'QueryRevocationHistories' test.out

#- 165 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 165 'GetRevocationPluginConfig' test.out

#- 166 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "qVceS9UX48dKPCFU"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "qIjS4i0N9ytb3c8p"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 166 'UpdateRevocationPluginConfig' test.out

#- 167 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'DeleteRevocationPluginConfig' test.out

#- 168 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 168 'UploadRevocationPluginConfigCert' test.out

#- 169 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Z8GlU8962e6gtn5p", "eventTopic": "UARJM1T8QwMNOAzX", "maxAwarded": 25, "maxAwardedPerUser": 3, "namespaceExpression": "yHEV4g9P6a280S5R", "rewardCode": "NB5dVCsB7xL4axSP", "rewardConditions": [{"condition": "gPCiwLxCFLDixZwV", "conditionName": "tt3RVTl0tR00oQgc", "eventName": "HdGGK3x76U1EIckl", "rewardItems": [{"duration": 39, "endDate": "1993-06-07T00:00:00Z", "itemId": "nP1oK3c4RVfjB0zi", "quantity": 36}, {"duration": 37, "endDate": "1996-09-12T00:00:00Z", "itemId": "UiN24ol1qqbalgiz", "quantity": 77}, {"duration": 54, "endDate": "1979-07-17T00:00:00Z", "itemId": "JuCAIfNBSHgpFNw9", "quantity": 75}]}, {"condition": "fHr6WvBxmBvNj3kt", "conditionName": "aDf9B22HGgxakPt7", "eventName": "IYzaZUTmvsEzLPnn", "rewardItems": [{"duration": 67, "endDate": "1973-05-31T00:00:00Z", "itemId": "S7H7yIS7b5TSDRIo", "quantity": 79}, {"duration": 65, "endDate": "1974-06-28T00:00:00Z", "itemId": "Dc5APzfzXDELJFaI", "quantity": 0}, {"duration": 62, "endDate": "1979-11-14T00:00:00Z", "itemId": "R8LaQzEb39sZTdFf", "quantity": 59}]}, {"condition": "CbnfihnXKxGxaupn", "conditionName": "TTq9ihZkvFKfSHQh", "eventName": "8I9xk3sFl0cbuCRM", "rewardItems": [{"duration": 68, "endDate": "1990-01-12T00:00:00Z", "itemId": "KkLwioRaKnWhlh80", "quantity": 56}, {"duration": 15, "endDate": "1972-02-19T00:00:00Z", "itemId": "e2fJDS6T75Q4ulon", "quantity": 79}, {"duration": 50, "endDate": "1987-05-25T00:00:00Z", "itemId": "jmYqE1wJhfogWg2A", "quantity": 32}]}], "userIdExpression": "KUvPYUcQBxMSdOOs"}' \
    > test.out 2>&1
eval_tap $? 169 'CreateReward' test.out

#- 170 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'n2Nd8Jpa19GJDK46' \
    --limit '63' \
    --offset '61' \
    --sortBy 'namespace,rewardCode' \
    > test.out 2>&1
eval_tap $? 170 'QueryRewards' test.out

#- 171 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 171 'ExportRewards' test.out

#- 172 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 172 'ImportRewards' test.out

#- 173 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ZywonA2SrEdN2tmG' \
    > test.out 2>&1
eval_tap $? 173 'GetReward' test.out

#- 174 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'uX6r0gBVUUeKKlPK' \
    --body '{"description": "tE6gnYxmkmCWbs5q", "eventTopic": "ugklBUS6uwWrCQt8", "maxAwarded": 88, "maxAwardedPerUser": 72, "namespaceExpression": "cPWAShIhieSKUf3z", "rewardCode": "KbyQk2vQTYX1xsth", "rewardConditions": [{"condition": "28NZZgsXycuQNGID", "conditionName": "eHlf6IcX1K9JrK6O", "eventName": "r2xx7rLwrPoWiywn", "rewardItems": [{"duration": 48, "endDate": "1978-06-18T00:00:00Z", "itemId": "4mYrCeQUnYoID2Uq", "quantity": 82}, {"duration": 58, "endDate": "1998-03-05T00:00:00Z", "itemId": "VFrvls0ZwosKhDlL", "quantity": 11}, {"duration": 81, "endDate": "1994-03-10T00:00:00Z", "itemId": "KxpVOXvGSrdkqddI", "quantity": 6}]}, {"condition": "ezqu6FB0sL2xt6fX", "conditionName": "9j7rhZCAlDlVKBsL", "eventName": "ZiBRXszE7CL1cQCS", "rewardItems": [{"duration": 29, "endDate": "1980-05-15T00:00:00Z", "itemId": "4drgkDuWS05m0pGz", "quantity": 1}, {"duration": 52, "endDate": "1979-11-17T00:00:00Z", "itemId": "KOLrF5i3gr3Cc4M2", "quantity": 84}, {"duration": 55, "endDate": "1991-02-22T00:00:00Z", "itemId": "rTQO7KLdZDGwqx7T", "quantity": 11}]}, {"condition": "l1ut2oyolliYsTJU", "conditionName": "mpscwLcUml3KuoMK", "eventName": "h7tprnacA34xmIOj", "rewardItems": [{"duration": 64, "endDate": "1971-11-09T00:00:00Z", "itemId": "KVWO2YEDiqkwKbpd", "quantity": 21}, {"duration": 18, "endDate": "1982-09-03T00:00:00Z", "itemId": "lDngNiPPjpSAlZwF", "quantity": 66}, {"duration": 29, "endDate": "1978-02-05T00:00:00Z", "itemId": "GxxXdbYCRexPekTs", "quantity": 87}]}], "userIdExpression": "kIdLCvNhZ6P8aqZ2"}' \
    > test.out 2>&1
eval_tap $? 174 'UpdateReward' test.out

#- 175 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'yfrC1V7ZpJZPHCMq' \
    > test.out 2>&1
eval_tap $? 175 'DeleteReward' test.out

#- 176 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'vcYmeDLYEzs2SQUd' \
    --body '{"payload": {"Kr6vgqkjycqclNlB": {}, "ORlC8ZkjsxYtgxpl": {}, "HTPLzynjFZgF3erw": {}}}' \
    > test.out 2>&1
eval_tap $? 176 'CheckEventCondition' test.out

#- 177 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId '7UsyHq4bBb0n1JhP' \
    --body '{"conditionName": "US8BRPGV9n769zLJ", "userId": "dKMexeJc7NvgTSgK"}' \
    > test.out 2>&1
eval_tap $? 177 'DeleteRewardConditionRecord' test.out

#- 178 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'jCxZjKf8NA4cGUaD' \
    --limit '10' \
    --offset '49' \
    --start 'GgVk77fd1GS5Ykyh' \
    --storeId 'AiAItnWUmD225fp1' \
    --viewId 'egsx3ErheNwqd5pr' \
    > test.out 2>&1
eval_tap $? 178 'QuerySections' test.out

#- 179 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iclNNqLyrlzrJ4QH' \
    --body '{"active": false, "displayOrder": 88, "endDate": "1973-06-21T00:00:00Z", "ext": {"nAdtkujxHff7n1ya": {}, "NCcjgFhS0URBhl0L": {}, "5FCbOn46W2B2uPQL": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 11, "itemCount": 39, "rule": "SEQUENCE"}, "items": [{"id": "Tn61A1xW6okIqmd8", "sku": "7ir9op4YfGTno5oH"}, {"id": "zqY3DgykA8zBJX0r", "sku": "kOHUkY5aSlqhYoSX"}, {"id": "bn6l5xAzc1nc3eFm", "sku": "950dtVAo7w4e3v5m"}], "localizations": {"h6Rum5pbgEt39uJQ": {"description": "pgEtchTe3nt7t9zt", "localExt": {"prSfW9OutADrNGBW": {}, "SJ1zQKxVmRTawjiZ": {}, "PMoZZcyGEHxAKDQh": {}}, "longDescription": "er3usApPdJPn9eId", "title": "hIBvTTupABJ4RwH3"}, "EdKmYtbqQHNfIZwr": {"description": "Mxf3EnzZVnkLT0Lb", "localExt": {"85nmpdN26BY5YI0j": {}, "eO2zMDSy4kyqyKgr": {}, "tEPdXXlt8geCdiXu": {}}, "longDescription": "3iNvn7vLZ7h6alhJ", "title": "NGZF07lsPP5OfHbX"}, "zWnVO2U4uyzZo1rj": {"description": "0ZrLQjk4VoYfIkst", "localExt": {"h24cZBpdDFfvzeU5": {}, "iqhx6zv7EURTNIoG": {}, "1DBdoKH6sREmmfwU": {}}, "longDescription": "ZLZZS7snx0Q2Gd8m", "title": "7Y3wiNloJfey3HXL"}}, "name": "6SjljNPTXA3qbg55", "rotationType": "NONE", "startDate": "1976-07-24T00:00:00Z", "viewId": "FkBtXMU6KRIm5xBo"}' \
    > test.out 2>&1
eval_tap $? 179 'CreateSection' test.out

#- 180 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ii99ctgFXasxp5h7' \
    > test.out 2>&1
eval_tap $? 180 'PurgeExpiredSection' test.out

#- 181 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '80ktjQw2yXzaQWaF' \
    --storeId '2PqUfbpMpRl6xRyV' \
    > test.out 2>&1
eval_tap $? 181 'GetSection' test.out

#- 182 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '19cborUHeCpqnZ5N' \
    --storeId 'W623WWn2ZJY3QvRa' \
    --body '{"active": false, "displayOrder": 57, "endDate": "1983-08-31T00:00:00Z", "ext": {"CPn1FylWdaNV1VaZ": {}, "TkbbuWiiA4UTDgS2": {}, "SVEo5M80LLbku9GY": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 18, "itemCount": 48, "rule": "SEQUENCE"}, "items": [{"id": "fppNCrscDPbklTHc", "sku": "mgXsrVj3Mjml6BpC"}, {"id": "ODWGOLMmCZUeelXY", "sku": "yNrXweiCnDldRPRf"}, {"id": "d6mLZ0GTJwEjoZrR", "sku": "taeWKMC8wsOByQAM"}], "localizations": {"AgqFEzEt8umj5XhK": {"description": "nw7MHDwFVKUC2ecn", "localExt": {"pUDqvLQixPKVSmWa": {}, "8TGko16XTqHc0cM7": {}, "ixq8Tjnxp5Cl8gga": {}}, "longDescription": "EmCcuK2hHviBEWpb", "title": "usO6EyVqstpgZpbz"}, "77y88rUFum2ZcA8i": {"description": "KcF0bkfjcTEFXcTw", "localExt": {"EtnHxP5pVtN4jNVI": {}, "druEA39uCJzsE8WO": {}, "bt6t0w8LOBxE15JY": {}}, "longDescription": "j4IqWK09l4wkrzah", "title": "XR1sDEDVKDINE3Hj"}, "CiVR1dQ8kuhb4pUw": {"description": "nGptHUplxzaDa9PD", "localExt": {"whu31d8eOdtrfq6E": {}, "CDD6OGkuLs9gNpNo": {}, "n6DKW9A6AmnQTNFi": {}}, "longDescription": "dImWONTvCPMGLdbY", "title": "EknHPKrZ7TiNBE0H"}}, "name": "RsE0GHDOFjrfqJcy", "rotationType": "FIXED_PERIOD", "startDate": "1994-05-05T00:00:00Z", "viewId": "2a7fCFAUzLELiM57"}' \
    > test.out 2>&1
eval_tap $? 182 'UpdateSection' test.out

#- 183 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '3TdtWjfVciuLnLsB' \
    --storeId 'KGsALPuCOyphUUAV' \
    > test.out 2>&1
eval_tap $? 183 'DeleteSection' test.out

#- 184 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 184 'ListStores' test.out

#- 185 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "95708zaP0wpZgQEv", "defaultRegion": "Fzox9wHocX3DRWob", "description": "EoGr8W97KBedcr6P", "supportedLanguages": ["M51z7i0wQ9egK2t4", "6EG8I2lTviKbOgVu", "N3nhkn6QIesNoYqv"], "supportedRegions": ["VsakylHikKkpOjqw", "gKvfXXs8pDqm31AZ", "SRkuw6q8FgqG46Rs"], "title": "FK7eYlSU3vYcHZZj"}' \
    > test.out 2>&1
eval_tap $? 185 'CreateStore' test.out

#- 186 ImportStore
eval_tap 0 186 'ImportStore # SKIP deprecated' test.out

#- 187 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 187 'GetPublishedStore' test.out

#- 188 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 188 'DeletePublishedStore' test.out

#- 189 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 189 'GetPublishedStoreBackup' test.out

#- 190 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 190 'RollbackPublishedStore' test.out

#- 191 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FegVnZOn0tk4IATS' \
    > test.out 2>&1
eval_tap $? 191 'GetStore' test.out

#- 192 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IefcqNEn4IZ0Dv6b' \
    --body '{"defaultLanguage": "8WtaMVvLbG04KKnh", "defaultRegion": "3jvW0Qp3kTyL4CsL", "description": "wiWUMcpxn4B6XoTN", "supportedLanguages": ["MuqZTHwo1IAJQpb6", "r8ZeaSHwQuiH3Ozu", "4G6bXxp0gYZyF9fJ"], "supportedRegions": ["BJkSOrF9Dg4FcDwB", "GyBiHewZkwEeuzBB", "RSknxyWkZObuvig8"], "title": "sMuss76ezTrsDZNY"}' \
    > test.out 2>&1
eval_tap $? 192 'UpdateStore' test.out

#- 193 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UV48Oh6I45X7HvUt' \
    > test.out 2>&1
eval_tap $? 193 'DeleteStore' test.out

#- 194 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PYONZdFk75lkjQNH' \
    --action 'DELETE' \
    --itemSku 'OHNZxML3yoBM9qxd' \
    --itemType 'EXTENSION' \
    --limit '85' \
    --offset '41' \
    --selected  \
    --sortBy 'updatedAt:desc,createdAt:desc,updatedAt' \
    --status 'PUBLISHED' \
    --type 'SECTION' \
    --updatedAtEnd 'NnGejdTGvZgN5hsh' \
    --updatedAtStart 'Se5YmZXKEQLkM6o3' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 194 'QueryChanges' test.out

#- 195 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eGSP4Htmr90TqGf0' \
    > test.out 2>&1
eval_tap $? 195 'PublishAll' test.out

#- 196 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OyqJ9ibJMmRgoxNw' \
    > test.out 2>&1
eval_tap $? 196 'PublishSelected' test.out

#- 197 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'p1lGkYoq8HP1TM0t' \
    > test.out 2>&1
eval_tap $? 197 'SelectAllRecords' test.out

#- 198 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'efVQPWX1NPO5Wn7r' \
    --action 'UPDATE' \
    --itemSku 'UJhDsDefAS09VyQB' \
    --itemType 'INGAMEITEM' \
    --selected  \
    --type 'VIEW' \
    --updatedAtEnd 'R1mx6K17GL1CrO4Z' \
    --updatedAtStart 'uoGZSxTzm8oMSPIH' \
    > test.out 2>&1
eval_tap $? 198 'SelectAllRecordsByCriteria' test.out

#- 199 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PtqzIWIzg8pbjnt1' \
    --action 'CREATE' \
    --itemSku 'Ae5Kd5QB96ndlO6i' \
    --itemType 'SUBSCRIPTION' \
    --type 'CATEGORY' \
    --updatedAtEnd 'GC9RhzMC7V8BEphn' \
    --updatedAtStart 'RXnSpCzyb8FkoxQb' \
    > test.out 2>&1
eval_tap $? 199 'GetStatistic' test.out

#- 200 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rPngi87K58pQswqK' \
    > test.out 2>&1
eval_tap $? 200 'UnselectAllRecords' test.out

#- 201 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'LutINusOsa92F6iw' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kJIYOLarmpWyvib9' \
    > test.out 2>&1
eval_tap $? 201 'SelectRecord' test.out

#- 202 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'CDW21ANrlpuXD9H1' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'u1CvzWPcZwkj1l6b' \
    > test.out 2>&1
eval_tap $? 202 'UnselectRecord' test.out

#- 203 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'f2F9EXOBj7v8LHYi' \
    --targetStoreId 'vmD0ekycMKlwJTNL' \
    > test.out 2>&1
eval_tap $? 203 'CloneStore' test.out

#- 204 ExportStore
eval_tap 0 204 'ExportStore # SKIP deprecated' test.out

#- 205 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'UCWUtaAD7ZZx1ief' \
    --limit '54' \
    --offset '100' \
    --sku 'TWcDSqGYRMdz07xE' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    --userId '0epssgJJC3CX0hpB' \
    > test.out 2>&1
eval_tap $? 205 'QuerySubscriptions' test.out

#- 206 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '1ZGMMo5DSozCuFsr' \
    > test.out 2>&1
eval_tap $? 206 'RecurringChargeSubscription' test.out

#- 207 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'BMtoOeLfMCYxSeeJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 207 'GetTicketDynamic' test.out

#- 208 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'Olxa395rghZwGhdZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "JkkGhYvXYMIyaEME"}' \
    > test.out 2>&1
eval_tap $? 208 'DecreaseTicketSale' test.out

#- 209 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'qOpwetb82b96rsH7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 209 'GetTicketBoothID' test.out

#- 210 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName '3hRfDgl29GWKpItM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 40, "orderNo": "fPQPmjUkvSs5YmIe"}' \
    > test.out 2>&1
eval_tap $? 210 'IncreaseTicketSale' test.out

#- 211 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "IOS", "count": 24, "currencyCode": "ozmG5HlrIfMAvvpk", "expireAt": "1984-10-05T00:00:00Z"}, "debitPayload": {"count": 89, "currencyCode": "15LUC6HSMQ32UznX", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 6, "entitlementOrigin": "GooglePlay", "itemIdentity": "6ve29lqqtcLJW9eT", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 31, "entitlementId": "KNDFrx6LabyDnqXj"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Epic", "count": 43, "currencyCode": "xh0x7T6RQGnnW4ug", "expireAt": "1987-07-04T00:00:00Z"}, "debitPayload": {"count": 26, "currencyCode": "4zxbdfXgunt1oMNZ", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 22, "entitlementOrigin": "Nintendo", "itemIdentity": "e34ZAUuLP897ooML", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 7, "entitlementId": "emwKAvgDXNrFEE4J"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Other", "count": 16, "currencyCode": "ky1ZYvyeHmfoFkUD", "expireAt": "1992-01-21T00:00:00Z"}, "debitPayload": {"count": 99, "currencyCode": "64shbnQ3bVvuvpsD", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 100, "entitlementOrigin": "Xbox", "itemIdentity": "kX4Kpi8CJ88aMPGF", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 89, "entitlementId": "QZbfbmVTEbiRq5Ju"}, "type": "DEBIT_WALLET"}], "userId": "0wCVlYQi9cfMCeNn"}, {"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 73, "currencyCode": "6OIG1PPLRDEXLXZW", "expireAt": "1996-06-17T00:00:00Z"}, "debitPayload": {"count": 33, "currencyCode": "0HNBYZSrz7pMjESL", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 78, "entitlementOrigin": "Twitch", "itemIdentity": "PKDXLki6Oz5Bygt8", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 89, "entitlementId": "JUdwEBRrHAWUFqTo"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 66, "currencyCode": "JHNffZENs9X0hFMd", "expireAt": "1984-07-18T00:00:00Z"}, "debitPayload": {"count": 35, "currencyCode": "OwXgKyPhXmcysae8", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 24, "entitlementOrigin": "Oculus", "itemIdentity": "c2CdRvBb0aGnMt62", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 70, "entitlementId": "WHb5sbX6asrjV7XJ"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 99, "currencyCode": "tHlzXNHEPpzlMlx7", "expireAt": "1971-12-26T00:00:00Z"}, "debitPayload": {"count": 89, "currencyCode": "H2THLwZGikW7TFA9", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 34, "entitlementOrigin": "Steam", "itemIdentity": "UITBHQR5ISNoFR3G", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 49, "entitlementId": "HbiKHW7flVolAWEM"}, "type": "DEBIT_WALLET"}], "userId": "3Wd0Wrb8s3GW0CY0"}, {"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 40, "currencyCode": "Afbq8xoCurq4lpHX", "expireAt": "1979-12-27T00:00:00Z"}, "debitPayload": {"count": 3, "currencyCode": "3uUdgNlyU4IJnqtr", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 25, "entitlementOrigin": "Steam", "itemIdentity": "i6ya8u4sQPvaf1Ac", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 33, "entitlementId": "eR7tJW3MLMob1hUn"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "System", "count": 70, "currencyCode": "MyF7CcNu2DYn6E9G", "expireAt": "1976-10-25T00:00:00Z"}, "debitPayload": {"count": 47, "currencyCode": "1kOTJZluTekDMCGU", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 83, "entitlementOrigin": "Steam", "itemIdentity": "BrNwioKnXPVZaDcX", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 97, "entitlementId": "vlCdI519Pf2iogwx"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 65, "currencyCode": "M0dgozmco41750xd", "expireAt": "1997-08-09T00:00:00Z"}, "debitPayload": {"count": 88, "currencyCode": "eePkqg6Zt1Lr5BlO", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 77, "entitlementOrigin": "Other", "itemIdentity": "H4dSaa8XYHug51ZT", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 12, "entitlementId": "2AQ1jvXYBar5RMmm"}, "type": "CREDIT_WALLET"}], "userId": "dWl0wpj5tVfKU3D8"}], "metadata": {"WVPh0Z7YiGE2cyzT": {}, "MBY7Xd0OoENg2Lw7": {}, "uepmahXojVZYz2zM": {}}, "needPreCheck": false, "transactionId": "3ebM71Tg922xiBgH", "type": "Ska0Pz7I1WkIa0oZ"}' \
    > test.out 2>&1
eval_tap $? 211 'Commit' test.out

#- 212 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '7' \
    --status 'SUCCESS' \
    --type 'pW1l70pcZgIn4lPg' \
    --userId 'hHyMEHBzArbyW10N' \
    > test.out 2>&1
eval_tap $? 212 'GetTradeHistoryByCriteria' test.out

#- 213 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'kJFQxuMHnfOlX6HY' \
    > test.out 2>&1
eval_tap $? 213 'GetTradeHistoryByTransactionId' test.out

#- 214 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'VEiaereFCPJU2wEz' \
    --body '{"achievements": [{"id": "UYUTmZ8JSMeNmRoc", "value": 31}, {"id": "9eKeXzrvzBllwzyC", "value": 0}, {"id": "BTCZs97TJI8GPrM2", "value": 9}], "steamUserId": "F3celFgM62HQtgzQ"}' \
    > test.out 2>&1
eval_tap $? 214 'UnlockSteamUserAchievement' test.out

#- 215 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'hO3nR8j8DlP6OGbn' \
    --xboxUserId '8vmfMYGLt1AjKhh3' \
    > test.out 2>&1
eval_tap $? 215 'GetXblUserAchievements' test.out

#- 216 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'JMX7xSrz1EH6X2SM' \
    --body '{"achievements": [{"id": "3xzsNrJzWBcdFlo7", "percentComplete": 29}, {"id": "sCqxx24QM35bSkFr", "percentComplete": 43}, {"id": "iL2P3r1a8KIJH33a", "percentComplete": 75}], "serviceConfigId": "W52uz3c8pz63M0g4", "titleId": "xXT5Ts4e0uR47OzU", "xboxUserId": "GHeBKtpvyRNgjZkd"}' \
    > test.out 2>&1
eval_tap $? 216 'UpdateXblUserAchievement' test.out

#- 217 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'DppvEJiUiDGXgh8B' \
    > test.out 2>&1
eval_tap $? 217 'AnonymizeCampaign' test.out

#- 218 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'KcLqtRZ93LuR8OEy' \
    > test.out 2>&1
eval_tap $? 218 'AnonymizeEntitlement' test.out

#- 219 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'ICvwgwBFehwtdJLd' \
    > test.out 2>&1
eval_tap $? 219 'AnonymizeFulfillment' test.out

#- 220 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'n3R2wo8beVQvgeP9' \
    > test.out 2>&1
eval_tap $? 220 'AnonymizeIntegration' test.out

#- 221 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'qOHaLwYnXxrz7sLm' \
    > test.out 2>&1
eval_tap $? 221 'AnonymizeOrder' test.out

#- 222 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'P70LxN0f3JA27Qz5' \
    > test.out 2>&1
eval_tap $? 222 'AnonymizePayment' test.out

#- 223 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'SjzQfOLYu9O46OOz' \
    > test.out 2>&1
eval_tap $? 223 'AnonymizeRevocation' test.out

#- 224 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'z9p57qSpHerzO87c' \
    > test.out 2>&1
eval_tap $? 224 'AnonymizeSubscription' test.out

#- 225 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'g7TqtMiQgi7Aj28q' \
    > test.out 2>&1
eval_tap $? 225 'AnonymizeWallet' test.out

#- 226 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'CRbwwZc4ZS1NMkrn' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 226 'GetUserDLCByPlatform' test.out

#- 227 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'AZuolAWnxkImVbDP' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 227 'GetUserDLC' test.out

#- 228 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'QX31gI7VmnGIRMvX' \
    --activeOnly  \
    --appType 'DEMO' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'BiphIFe2bzr6qQw6' \
    --features 'fSESkM19OPMBb12g,pmShlmIt2nfhUaZG,qjslu59GT2E6Aacm' \
    --fuzzyMatchName  \
    --itemId 'ZRXZm626POXWVj3K,P1mX0iYHXBU3Uk2t,Qm307IORTyHnLYDA' \
    --limit '53' \
    --offset '66' \
    --origin 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 228 'QueryUserEntitlements' test.out

#- 229 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '6izJZruOJvSRFLDS' \
    --body '[{"endDate": "1972-12-08T00:00:00Z", "grantedCode": "j8elbtHvDU91DmHz", "itemId": "wiqVPCJ5j18Ou3aY", "itemNamespace": "8nceFU5GKmcEKp8A", "language": "jWpR_029", "origin": "Epic", "quantity": 69, "region": "cMkdz6zPz3BVHAqp", "source": "REDEEM_CODE", "startDate": "1991-02-15T00:00:00Z", "storeId": "9XSjap24esyjh6Wc"}, {"endDate": "1999-03-01T00:00:00Z", "grantedCode": "migf2n6iQyr5cb5Y", "itemId": "L6fwBiaVPmmn0T5u", "itemNamespace": "zlmi2NY26xrkPPdg", "language": "Pkz", "origin": "Nintendo", "quantity": 40, "region": "n8PZbYVD8RiaTsdD", "source": "ACHIEVEMENT", "startDate": "1988-11-22T00:00:00Z", "storeId": "kSbTkHPMUvOAUXkw"}, {"endDate": "1999-09-12T00:00:00Z", "grantedCode": "cr2WJQqS7Tq4YIyZ", "itemId": "AFQ6lZfa2jdNvpWf", "itemNamespace": "32JS1av9VNpVLT0L", "language": "sRu", "origin": "Playstation", "quantity": 92, "region": "5M3rrkxu0U9h9gCN", "source": "GIFT", "startDate": "1983-01-23T00:00:00Z", "storeId": "HGxhZqNXJ6JXSh0Z"}]' \
    > test.out 2>&1
eval_tap $? 229 'GrantUserEntitlement' test.out

#- 230 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '3SWISs1dYrJKmx1B' \
    --activeOnly  \
    --appId 'T6iLFQejNZJNF2hm' \
    > test.out 2>&1
eval_tap $? 230 'GetUserAppEntitlementByAppId' test.out

#- 231 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '0TqBQprHn3whPKU5' \
    --activeOnly  \
    --limit '0' \
    --offset '2' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 231 'QueryUserEntitlementsByAppType' test.out

#- 232 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'qstMuikKc6VNU857' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'h1arZAyuLcZoEkPp' \
    --itemId 'qKhP2jWnRTglw0gd' \
    > test.out 2>&1
eval_tap $? 232 'GetUserEntitlementByItemId' test.out

#- 233 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'WoE4esuiDrquccz4' \
    --ids 'J6fFQezJ5E3iYHIk,nvPcJkjRevVYfiEx,pAgoK9YDq1x3dkbJ' \
    --platform 'FDEBEOOvJ5BKeipI' \
    > test.out 2>&1
eval_tap $? 233 'GetUserActiveEntitlementsByItemIds' test.out

#- 234 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'ldsgB4hOxb88WgKS' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --platform 'LhTfzigzHcRuJgYa' \
    --sku 'j4I8Dzyh1N0JEKNo' \
    > test.out 2>&1
eval_tap $? 234 'GetUserEntitlementBySku' test.out

#- 235 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'MtHvjM7X1fjzknv2' \
    --appIds 'HZMIL2P2bh14LroF,TnAuujPeP9N0vdVB,5a2XkS3XQfMuzZh4' \
    --itemIds 'AhZRe2hgU56xtyJt,nbTDXu7FbleSP5Pc,dOuq0m0rvakR8rcw' \
    --platform 'ojLRjhcaJ56nGlYZ' \
    --skus '2tod2BGBXjNyRCtP,Or1FU3QZy3gdDms3,kb1htW0UGJpwQZlX' \
    > test.out 2>&1
eval_tap $? 235 'ExistsAnyUserActiveEntitlement' test.out

#- 236 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'uzu3m9u67JjCDwg1' \
    --platform '86hGWKfO9MnoT3t9' \
    --itemIds '9HmcxzjDhTrcBKtU,956hOg8oukDVdweG,0sFHxTHa2k60SzCq' \
    > test.out 2>&1
eval_tap $? 236 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 237 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ugq1gLbcIMevTmC6' \
    --appId '31p7q794bu49lINF' \
    > test.out 2>&1
eval_tap $? 237 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 238 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'TtERAXT2h3hcQ2wV' \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'ZbBTnNQnVUhA5Wnz' \
    --itemId 'VZdj8tsyzC4QaLXp' \
    > test.out 2>&1
eval_tap $? 238 'GetUserEntitlementOwnershipByItemId' test.out

#- 239 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '3o4TDraEEaDNJbVd' \
    --ids '20FVHevCjthJUb7j,KuMrFaoLulzp3sZx,ImVK5yh2LcM8LaMW' \
    --platform '0ByjsRUrAHNRkIcC' \
    > test.out 2>&1
eval_tap $? 239 'GetUserEntitlementOwnershipByItemIds' test.out

#- 240 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '4wNFzsbrtYvLh56A' \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'LsR2AGOiPhNt2IdH' \
    --sku '8aYYUT6mma833TDz' \
    > test.out 2>&1
eval_tap $? 240 'GetUserEntitlementOwnershipBySku' test.out

#- 241 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'k66ix88sAUrXr7MX' \
    > test.out 2>&1
eval_tap $? 241 'RevokeAllEntitlements' test.out

#- 242 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'xCvyy7caxz4MQrOD' \
    --entitlementIds 'LNlxiEjQBCZx9DJ4' \
    > test.out 2>&1
eval_tap $? 242 'RevokeUserEntitlements' test.out

#- 243 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'V97SJLlrwXmIGamR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CARuFLx4rV4CXVMr' \
    > test.out 2>&1
eval_tap $? 243 'GetUserEntitlement' test.out

#- 244 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'DYKe2eTf1axo16Gq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'T2vSLLiMvcu39YZJ' \
    --body '{"endDate": "1983-07-13T00:00:00Z", "nullFieldList": ["pWzpNXgnoKIz8O8N", "glJtZTh280vflFMx", "IhlIT8AgyZJ16MMd"], "origin": "Epic", "reason": "bzOrTn2huwPgyUzB", "startDate": "1995-11-19T00:00:00Z", "status": "CONSUMED", "useCount": 10}' \
    > test.out 2>&1
eval_tap $? 244 'UpdateUserEntitlement' test.out

#- 245 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'KoNGtvyk5xEfrJDx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ksw5Xl7ZZrDZdbuv' \
    --body '{"options": ["CFBaVcohewKkVuGv", "9fQXkErF0drbYrrF", "QP6rW62CtetBW3pv"], "platform": "AJJieHhveGg97PY0", "requestId": "txzvYwv7atn9EQv2", "useCount": 83}' \
    > test.out 2>&1
eval_tap $? 245 'ConsumeUserEntitlement' test.out

#- 246 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'yYUJmNL8p6AbdtU0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CDrlQpKB8qoel2QK' \
    > test.out 2>&1
eval_tap $? 246 'DisableUserEntitlement' test.out

#- 247 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId '3aSOYdmMDikc3Fjm' \
    --namespace "$AB_NAMESPACE" \
    --userId '9HoQDemtiQvURYZC' \
    > test.out 2>&1
eval_tap $? 247 'EnableUserEntitlement' test.out

#- 248 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'eF30RT9rBgM8o7lx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xq7TkdM7FVDCBcvV' \
    > test.out 2>&1
eval_tap $? 248 'GetUserEntitlementHistories' test.out

#- 249 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'egrZddP8lLQo6tHj' \
    --namespace "$AB_NAMESPACE" \
    --userId '4z4cAM4LMJfWNZIx' \
    > test.out 2>&1
eval_tap $? 249 'RevokeUserEntitlement' test.out

#- 250 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'AgBpeubprKX68jTy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rd3LrR1x6U1v6zSL' \
    --body '{"reason": "jm9zmzUW0vPj90jm", "useCount": 76}' \
    > test.out 2>&1
eval_tap $? 250 'RevokeUserEntitlementByUseCount' test.out

#- 251 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'fMi2CPVGxjcdpdCq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VeePMSqb8y8qJTUQ' \
    --quantity '84' \
    > test.out 2>&1
eval_tap $? 251 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 252 RevokeUseCount
eval_tap 0 252 'RevokeUseCount # SKIP deprecated' test.out

#- 253 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId '40Zrpn0vAD9YsPeD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WrAVQZSvgWuCuLsU' \
    --body '{"platform": "GrVQAbhS54ZuQHKe", "requestId": "rsDmJLUHAKtfXCKO", "useCount": 28}' \
    > test.out 2>&1
eval_tap $? 253 'SellUserEntitlement' test.out

#- 254 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'dvUMDZeO4U55wdCp' \
    --body '{"duration": 98, "endDate": "1974-05-10T00:00:00Z", "entitlementOrigin": "Nintendo", "itemId": "r0e0J6vyqPw7YlmV", "itemSku": "3kES0Hi88UYgSV40", "language": "OvY7apPCrN5bEhmu", "metadata": {"HgKeWizEpw1zN0mO": {}, "YgGhHMz9dddLWJWD": {}, "uSYtCaIv4Lp91wYU": {}}, "order": {"currency": {"currencyCode": "JPbvzn8TYoMDAaUX", "currencySymbol": "SuBQdvdhJoT0WK5n", "currencyType": "REAL", "decimals": 81, "namespace": "9VIbbsz24fQKDZX6"}, "ext": {"plErw0Gb0ceCbphW": {}, "4YMhJ0S50bez9ZLH": {}, "W882riiPfRQ3rJ0f": {}}, "free": false}, "orderNo": "BvkehRn83B0nrW1q", "origin": "Playstation", "overrideBundleItemQty": {"hiP1lzkzjYDw6mLB": 29, "EUqnzxs2deMF8UAJ": 71, "Xw9K9Yb68a8ygYx2": 94}, "quantity": 49, "region": "qkhlqMnE9Wj90EQz", "source": "GIFT", "startDate": "1978-01-31T00:00:00Z", "storeId": "Wryt4XTNwpp0ni1Y"}' \
    > test.out 2>&1
eval_tap $? 254 'FulfillItem' test.out

#- 255 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'fIgLZ4YIzElrLZOB' \
    --body '{"code": "LHCKmLBaIwlokbAF", "language": "St-lm", "region": "CySLA8cKCs0dFYRS"}' \
    > test.out 2>&1
eval_tap $? 255 'RedeemCode' test.out

#- 256 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'a2OULZ0iOZJiOAh1' \
    --body '{"itemId": "SpLhMF2Pav11FuU8", "itemSku": "iXCRz8KgqgwijYxp", "quantity": 67}' \
    > test.out 2>&1
eval_tap $? 256 'PreCheckFulfillItem' test.out

#- 257 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'pYC4txul6VKYlNYY' \
    --body '{"entitlementOrigin": "Nintendo", "metadata": {"tVRCPMjr5M3vw1Gq": {}, "UjjFp6R8mYZwKftV": {}, "qSECsypS42NmYQ8H": {}}, "origin": "IOS", "rewards": [{"currency": {"currencyCode": "drwqytieXpIZfr5X", "namespace": "Dq9dGLHjtgE2bTXJ"}, "item": {"itemId": "xCCFqPNDqWrpkWnn", "itemSku": "ova15WVuE5cYVP9t", "itemType": "QSa27BnPyq3I1BLt"}, "quantity": 67, "type": "ITEM"}, {"currency": {"currencyCode": "LzQ2IjY5PeNr4JmY", "namespace": "xH2qs28hePJjMp0T"}, "item": {"itemId": "KKUBfPNI9f2oLWDP", "itemSku": "SZexfKVxqdxmh5QW", "itemType": "xuQuI7gdDTDb3Wdn"}, "quantity": 83, "type": "CURRENCY"}, {"currency": {"currencyCode": "EEM2KOusNEHcI95G", "namespace": "GdJvucDbs6UdccuM"}, "item": {"itemId": "2ykRj3WnyAaUaQBK", "itemSku": "FedL2uduXvZUbQQ1", "itemType": "3FhD3NExUFipJsUi"}, "quantity": 60, "type": "CURRENCY"}], "source": "ACHIEVEMENT", "transactionId": "HTlRugM7a2UZgees"}' \
    > test.out 2>&1
eval_tap $? 257 'FulfillRewards' test.out

#- 258 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'ipbP027okM5E8tAa' \
    --endTime 'jVSvLRj306RDuaSi' \
    --limit '47' \
    --offset '47' \
    --productId 'EdloYZBkatNLc42e' \
    --startTime 'q0O6VsXtOlQwj5xP' \
    --status 'FULFILLED' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 258 'QueryUserIAPOrders' test.out

#- 259 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '75QboMHCtzEF9FSe' \
    > test.out 2>&1
eval_tap $? 259 'QueryAllUserIAPOrders' test.out

#- 260 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'g6WYgtfuqJHrs4e3' \
    --endTime 'RnWR30MdBZezfwc3' \
    --limit '69' \
    --offset '66' \
    --startTime '0qSbMq4GLj8aGsH0' \
    --status 'PENDING' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 260 'QueryUserIAPConsumeHistory' test.out

#- 261 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'E5p601ak59yFSfdZ' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "NjO-BOuI-aB", "productId": "ikCh6q0yq2WAHtL7", "region": "IWE3MFqvfDG5jvMO", "transactionId": "aXrDlEX42U0syrGN", "type": "GOOGLE"}' \
    > test.out 2>&1
eval_tap $? 261 'MockFulfillIAPItem' test.out

#- 262 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'poCiHMD4iBK2O7qY' \
    --itemId 'tOHV5hnpjc5CNLnn' \
    --limit '63' \
    --offset '47' \
    --status 'FULFILLED' \
    > test.out 2>&1
eval_tap $? 262 'QueryUserOrders' test.out

#- 263 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'FY8E6pU8eHjh0aTj' \
    --body '{"currencyCode": "IOaQt0snbE0yMvqF", "currencyNamespace": "7TJ9uB0zypjJiu7B", "discountedPrice": 71, "ext": {"LKIhNU43K8bihdw3": {}, "prp0UHlWUxkBefhx": {}, "Rtrqbv56oqwnCLVc": {}}, "itemId": "2qHZuuedbBOd19Dq", "language": "ZJRYV1oqNLmPAUIM", "options": {"skipPriceValidation": true}, "platform": "Epic", "price": 81, "quantity": 46, "region": "Q4PkAPXBCfkE1Fb0", "returnUrl": "y94eP7yh0zsKhR60", "sandbox": true, "sectionId": "6LYXXMndxBPKmHVB"}' \
    > test.out 2>&1
eval_tap $? 263 'AdminCreateUserOrder' test.out

#- 264 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId '7cNzHhvxc4xAPZ86' \
    --itemId 'WNnQOhusPn4466u8' \
    > test.out 2>&1
eval_tap $? 264 'CountOfPurchasedItem' test.out

#- 265 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'agb5HPsBU0Eo6QJ9' \
    --userId 'vBRJ4UP09fabC01T' \
    > test.out 2>&1
eval_tap $? 265 'GetUserOrder' test.out

#- 266 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hm9f4AWpyiKVT3Ov' \
    --userId 'Eujx5yjtQSCJaOHz' \
    --body '{"status": "CLOSED", "statusReason": "5jw99HxCjXWcaXBc"}' \
    > test.out 2>&1
eval_tap $? 266 'UpdateUserOrderStatus' test.out

#- 267 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'fXXeV7BXefsSgZxS' \
    --userId 'YnVwXqF6K0WA76Kl' \
    > test.out 2>&1
eval_tap $? 267 'FulfillUserOrder' test.out

#- 268 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo '2mHHoz6qBQnEDgX4' \
    --userId '9n1xTDFcmOm1sqdI' \
    > test.out 2>&1
eval_tap $? 268 'GetUserOrderGrant' test.out

#- 269 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'WU6ERylESgf5dXMr' \
    --userId 'PoYSohfrLyXMSrC6' \
    > test.out 2>&1
eval_tap $? 269 'GetUserOrderHistories' test.out

#- 270 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo '2xYtDwflNGfufW5c' \
    --userId 'Weg6eSCypsceITTk' \
    --body '{"additionalData": {"cardSummary": "JGGCVF6LrILDLviU"}, "authorisedTime": "1985-02-21T00:00:00Z", "chargebackReversedTime": "1984-02-10T00:00:00Z", "chargebackTime": "1977-09-03T00:00:00Z", "chargedTime": "1977-08-03T00:00:00Z", "createdTime": "1977-01-03T00:00:00Z", "currency": {"currencyCode": "MDORYuXnPNJgayPF", "currencySymbol": "cyUnKXA3mcyMmX6W", "currencyType": "REAL", "decimals": 56, "namespace": "jtNAVOYqSH533YlJ"}, "customParameters": {"93CCGBXv4fP4VPzh": {}, "cH4UJrrCKvrOAi7l": {}, "MgkVWJYzSCIDxWUx": {}}, "extOrderNo": "gOzeRNHIqK5PT404", "extTxId": "mFw4HJv5T2kIQOec", "extUserId": "fLsYKTmUnKlrOsJm", "issuedAt": "1986-02-22T00:00:00Z", "metadata": {"wjGYN8VNPXNsmwTV": "8imJHNI0l6jJVzF1", "Oi2sQuWUBBHZonSm": "zF831vlCiZAZHCWM", "XxVh8HTrKqVwnpPn": "8N5xMRgU7cPqNZrL"}, "namespace": "CRRUysya4J3rvTzM", "nonceStr": "TMSwrNov2GW9i54J", "paymentMethod": "Y23AUWFTLq0W1Jqw", "paymentMethodFee": 74, "paymentOrderNo": "alTddhAQ1pwqnybv", "paymentProvider": "ALIPAY", "paymentProviderFee": 82, "paymentStationUrl": "uulmeegRwPPbn7lt", "price": 41, "refundedTime": "1991-01-24T00:00:00Z", "salesTax": 61, "sandbox": false, "sku": "Boi2sSAO2n4MZQt7", "status": "REQUEST_FOR_INFORMATION", "statusReason": "NK4gkLmvEOaRcqTg", "subscriptionId": "F0xtQAXoDoFkmA3f", "subtotalPrice": 12, "targetNamespace": "buqUuyW3cMz9Yydu", "targetUserId": "MomEHcU15St4v8ry", "tax": 82, "totalPrice": 70, "totalTax": 3, "txEndTime": "1983-09-09T00:00:00Z", "type": "qNVv0KVpXJTMx3Y8", "userId": "Um1iqehObg3OZ9j0", "vat": 70}' \
    > test.out 2>&1
eval_tap $? 270 'ProcessUserOrderNotification' test.out

#- 271 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'QopeHD6iKBGm5Cj7' \
    --userId 'RqnJUmfDmofxvN8p' \
    > test.out 2>&1
eval_tap $? 271 'DownloadUserOrderReceipt' test.out

#- 272 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'RGoUtmbWZbEjPyq3' \
    --body '{"currencyCode": "5BWDoc3qNcQFFyHv", "currencyNamespace": "141NPqjRUMKSQjFd", "customParameters": {"jqTaZFsWzbqwTZQI": {}, "N5jC6a8mEVCXHmFn": {}, "rSL0PJcZQaCeNLYx": {}}, "description": "MID9pqZ5rryiMMt6", "extOrderNo": "fQtLhzylaquioT3Q", "extUserId": "Bt29AiRASsuFM4ah", "itemType": "OPTIONBOX", "language": "tuz", "metadata": {"ab1UeibXg7RCe5Bt": "Kcwj6PqqOgCimr3Z", "QNBBkrXu9czsYr3c": "FeVw70xdNTuOdLKK", "0M2B2hbqJin37P69": "t1KqeGz7qbPnXEuO"}, "notifyUrl": "zzkoBmMR9C4qPqJr", "omitNotification": true, "platform": "Ksfjz1mFkyxoUzfM", "price": 64, "recurringPaymentOrderNo": "5VeW9ddxzLPV8wDj", "region": "snyPh5yNbYXmlAOi", "returnUrl": "1SC3I1SjkH42LtyZ", "sandbox": true, "sku": "djn2Ps3IVT5hUZ3c", "subscriptionId": "nDq0ddZG0EpfGAqH", "title": "KcSxUc2YgRpk2IFG"}' \
    > test.out 2>&1
eval_tap $? 272 'CreateUserPaymentOrder' test.out

#- 273 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'IgIpscUpVAciu2XP' \
    --userId 'PUxzXHUvxhvTZcvR' \
    --body '{"description": "KoaM4ozSAg8FTLrB"}' \
    > test.out 2>&1
eval_tap $? 273 'RefundUserPaymentOrder' test.out

#- 274 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'yWOJhbocoGlPzdfx' \
    --body '{"code": "cC3rpWhSpq0InxML", "orderNo": "pP7n7M3JXjEvsj5W"}' \
    > test.out 2>&1
eval_tap $? 274 'ApplyUserRedemption' test.out

#- 275 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'cQ99M1yuXeqV31LX' \
    --body '{"meta": {"2ehcMnM6QtjzQjDl": {}, "UMCGnxZwak7KHnzG": {}, "ASmVzePIroz41oQC": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Other", "currencyCode": "e0s0Cuhl3dU9b4se", "namespace": "YCyiB4tDCWx3cEX8"}, "entitlement": {"entitlementId": "wTi1v2abpCWytPEi"}, "item": {"entitlementOrigin": "Oculus", "itemIdentity": "Ze0hL9rPkV5GkSrc", "itemIdentityType": "ITEM_ID", "origin": "Xbox"}, "quantity": 78, "type": "ITEM"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "47XVzU7qlNVk7qnm", "namespace": "BS3XKDhp1OkMcErm"}, "entitlement": {"entitlementId": "eH0lX1hj0LaXgQ94"}, "item": {"entitlementOrigin": "GooglePlay", "itemIdentity": "oNBzgQ4CRwg0sKVe", "itemIdentityType": "ITEM_ID", "origin": "Twitch"}, "quantity": 28, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Playstation", "currencyCode": "pRDJjDyMDKQhuTjt", "namespace": "QZyIiAmCL8bNTTfq"}, "entitlement": {"entitlementId": "LCv9DYBOProN4UWb"}, "item": {"entitlementOrigin": "Xbox", "itemIdentity": "iIP7dpJ8B8VwFQnV", "itemIdentityType": "ITEM_ID", "origin": "Xbox"}, "quantity": 28, "type": "ENTITLEMENT"}], "source": "ORDER", "transactionId": "oCn1KvJmbjapW9Ul"}' \
    > test.out 2>&1
eval_tap $? 275 'DoRevocation' test.out

#- 276 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'EqtzDd7SgxdxB5kv' \
    --body '{"gameSessionId": "tM8ah9bPsksceGUE", "payload": {"X8ERZcKSYLo6y7yJ": {}, "MowQ6LpHCvCYTgX9": {}, "JQwErzjtuP9pUUv7": {}}, "scid": "qefNMFsZAIqak1zi", "sessionTemplateName": "0JSa5cRn31D8ubfd"}' \
    > test.out 2>&1
eval_tap $? 276 'RegisterXblSessions' test.out

#- 277 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xi7BycDPckeGJUgU' \
    --chargeStatus 'SETUP' \
    --itemId 'bD5mGFFmKTTUxG0m' \
    --limit '31' \
    --offset '70' \
    --sku 'mFxxDNXGlGJvHf55' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 277 'QueryUserSubscriptions' test.out

#- 278 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'e3iJLtjsu6ZJRCoD' \
    --excludeSystem  \
    --limit '33' \
    --offset '52' \
    --subscriptionId 'geuHFFaZzPIjETqc' \
    > test.out 2>&1
eval_tap $? 278 'GetUserSubscriptionActivities' test.out

#- 279 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'KN1gaQ4Bn0cPPtKa' \
    --body '{"grantDays": 73, "itemId": "HF0ebxhJ1176CeD4", "language": "dWCp4wqlQJcZroNQ", "reason": "iefBnPluOIjZyvlG", "region": "DQGv6pNNowEuVVZM", "source": "28w4mnYvvlt1es7A"}' \
    > test.out 2>&1
eval_tap $? 279 'PlatformSubscribeSubscription' test.out

#- 280 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '4PFduN4gx0UC6eWK' \
    --itemId 'CFGS97Si6XyLVPrk' \
    > test.out 2>&1
eval_tap $? 280 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 281 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'UxyZ1OH5Nn4nMT8Q' \
    --userId 'OyTuUSD9ImtaPAoc' \
    > test.out 2>&1
eval_tap $? 281 'GetUserSubscription' test.out

#- 282 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OQcpBWSNrCjSNEAd' \
    --userId 'ojkCMmYyTGO07foR' \
    > test.out 2>&1
eval_tap $? 282 'DeleteUserSubscription' test.out

#- 283 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Z6FujpIWo0qJtqp4' \
    --userId 'Q6XgICLgMHcP1eE6' \
    --force  \
    --body '{"immediate": true, "reason": "qvfHmFvUZiUW5Y0C"}' \
    > test.out 2>&1
eval_tap $? 283 'CancelSubscription' test.out

#- 284 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Yw5OXSGwQkJuy9oL' \
    --userId 'FcHHcraLXR2n9JQv' \
    --body '{"grantDays": 33, "reason": "wpIdjcAtTj1IMuuh"}' \
    > test.out 2>&1
eval_tap $? 284 'GrantDaysToSubscription' test.out

#- 285 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'xxlulfmya73hX0a8' \
    --userId 'Ri85PA9wNpmrK5Y5' \
    --excludeFree  \
    --limit '16' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 285 'GetUserSubscriptionBillingHistories' test.out

#- 286 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'bfJOhNaIT0pv7Xeq' \
    --userId 'O8gY3c4SryWB4yRa' \
    --body '{"additionalData": {"cardSummary": "DxvxwaLM8HkVOW8P"}, "authorisedTime": "1978-01-30T00:00:00Z", "chargebackReversedTime": "1990-08-21T00:00:00Z", "chargebackTime": "1976-11-03T00:00:00Z", "chargedTime": "1974-04-14T00:00:00Z", "createdTime": "1979-07-28T00:00:00Z", "currency": {"currencyCode": "kqYZWPZTgKagTzdc", "currencySymbol": "Ycko7U3gH239LhRx", "currencyType": "VIRTUAL", "decimals": 76, "namespace": "DiP2hNNEI8QrQ6H1"}, "customParameters": {"ro5CtU8UjgyCUpM1": {}, "JBcTzf4dz1BojPoQ": {}, "g976409vFd5z9r4n": {}}, "extOrderNo": "JWUvLp1wxGF74746", "extTxId": "8MXUq3uIffkIpPmr", "extUserId": "WVxNZUvkiU2jXSws", "issuedAt": "1985-12-21T00:00:00Z", "metadata": {"BRopVl38d4NZGtk6": "EmWxC75M88TKhFYk", "A9aRNDe2IoPMSQKc": "g0OTT9JA0ll1RimB", "CiQwuyrI87uSyXP6": "C0jXS8au2wcWYyj3"}, "namespace": "JvHqXp4JR7xI59Z9", "nonceStr": "tfGVsglnOxOXBfgB", "paymentMethod": "Luglkd9LIoshGnFS", "paymentMethodFee": 42, "paymentOrderNo": "PYpnPqGlPnhBDOWq", "paymentProvider": "XSOLLA", "paymentProviderFee": 98, "paymentStationUrl": "U8N3DjVUt0n0jfyD", "price": 3, "refundedTime": "1990-06-09T00:00:00Z", "salesTax": 80, "sandbox": true, "sku": "CLkK8ZvbnTg3znlg", "status": "REFUNDING", "statusReason": "nmzQx1RsYhcRlv16", "subscriptionId": "Wwe8YK3lZFslECI9", "subtotalPrice": 86, "targetNamespace": "rIfqrZuu7IwKcT7s", "targetUserId": "Asv2TKCbYMVkXEHm", "tax": 37, "totalPrice": 94, "totalTax": 69, "txEndTime": "1985-06-30T00:00:00Z", "type": "HkgcJ0DcEt23pci6", "userId": "xEljer6aGJx5OFp3", "vat": 20}' \
    > test.out 2>&1
eval_tap $? 286 'ProcessUserSubscriptionNotification' test.out

#- 287 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'dt0TSTmy7XF26K2U' \
    --namespace "$AB_NAMESPACE" \
    --userId '7xttUz8nWKJjv06P' \
    --body '{"count": 42, "orderNo": "WDyGYIVFDbTvRYfp"}' \
    > test.out 2>&1
eval_tap $? 287 'AcquireUserTicket' test.out

#- 288 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'J4wM9WZfOOxAzmsb' \
    > test.out 2>&1
eval_tap $? 288 'QueryUserCurrencyWallets' test.out

#- 289 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'hi5QJuc2SNBaOlXf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gsgBd7MYLLoPZrkj' \
    --body '{"allowOverdraft": false, "amount": 93, "balanceOrigin": "Other", "balanceSource": "OTHER", "metadata": {"Zw2UkjDzJ4NuMMgI": {}, "13nplXaUQV5QEvKE": {}, "lLfbB7gwwAR1xFrn": {}}, "reason": "yirw3iJt5iA3JS2x"}' \
    > test.out 2>&1
eval_tap $? 289 'DebitUserWalletByCurrencyCode' test.out

#- 290 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'eaJ08JrSHPqdhKHn' \
    --namespace "$AB_NAMESPACE" \
    --userId '6ZjZMdr1C2TIQzRJ' \
    --limit '89' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 290 'ListUserCurrencyTransactions' test.out

#- 291 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'UfYSrdN0JVz4U43E' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cV1FRyeeqehMNeRY' \
    --request '{"amount": 76, "debitBalanceSource": "OTHER", "metadata": {"eMbL0G4v5D6ylZgu": {}, "O918X7rLoexHBMBM": {}, "MAYokSWFwajRGUyk": {}}, "reason": "lfLVY6g3PO4hKAeF", "walletPlatform": "Xbox"}' \
    > test.out 2>&1
eval_tap $? 291 'CheckBalance' test.out

#- 292 CheckWallet
eval_tap 0 292 'CheckWallet # SKIP deprecated' test.out

#- 293 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode '4TU3apnZXoJ4gI4E' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QKO8xC4D0FsUo3IB' \
    --body '{"amount": 49, "expireAt": "1976-02-12T00:00:00Z", "metadata": {"REQZsHyXzoIXNf0K": {}, "bL9HyJttdgfLGO3u": {}, "mmpllnV6B62P1Kaz": {}}, "origin": "GooglePlay", "reason": "O55hVjfWyK02w5Qy", "source": "IAP_CHARGEBACK_REVERSED"}' \
    > test.out 2>&1
eval_tap $? 293 'CreditUserWallet' test.out

#- 294 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'crZzgameT2mLkkAM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jHyI0e2Axj0nZHjm' \
    --request '{"amount": 30, "debitBalanceSource": "TRADE", "metadata": {"KHJngwMe1AnQVj6Q": {}, "QjZtkNJCnDSrsSey": {}, "2BqOxgwCymCDYsuf": {}}, "reason": "f3b7G5FDX4mu0qPH", "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 294 'DebitByWalletPlatform' test.out

#- 295 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'dWviQsULL1txfX9t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qFSkGXoIcFN5JL9M' \
    --body '{"amount": 3, "metadata": {"3Mg0MzWS9usxxnMh": {}, "jv66DyED4prRVibT": {}, "ATxd7Mzjv1gSj8kc": {}}, "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 295 'PayWithUserWallet' test.out

#- 296 GetUserWallet
eval_tap 0 296 'GetUserWallet # SKIP deprecated' test.out

#- 297 DebitUserWallet
eval_tap 0 297 'DebitUserWallet # SKIP deprecated' test.out

#- 298 DisableUserWallet
eval_tap 0 298 'DisableUserWallet # SKIP deprecated' test.out

#- 299 EnableUserWallet
eval_tap 0 299 'EnableUserWallet # SKIP deprecated' test.out

#- 300 ListUserWalletTransactions
eval_tap 0 300 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 301 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BO8m0HgTth479W8r' \
    > test.out 2>&1
eval_tap $? 301 'ListViews' test.out

#- 302 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XqwGVIRWgTNHCka3' \
    --body '{"displayOrder": 99, "localizations": {"pdyF6WDHn3ePBxQN": {"description": "z2IUEHMzl5jhwVDs", "localExt": {"uzwJ4v50eoaIBrTh": {}, "0EKkJioUpvGnkcHg": {}, "CfaWzPUvCnfqsPGg": {}}, "longDescription": "JZyRwigaMu07Zek8", "title": "WObpf0FHYfViEj70"}, "KYKIfFt4GYjUt4F1": {"description": "ZVy2qFfSr3psWjOy", "localExt": {"HLyKe2foqsVIfgBT": {}, "r8RcxRQR0NYdJzf3": {}, "TMhSaynVs05nZC4O": {}}, "longDescription": "s7hqIH2NgARSG3QQ", "title": "NGNH2K0UuJdeGNqu"}, "QnaXpDQ5rU2taDWh": {"description": "9JV5oc5IFQsrwHqF", "localExt": {"qwVA5mozeeOjIFQf": {}, "XV3YW3ug3nCXhD7F": {}, "Uz1iOe0pHa0LmseI": {}}, "longDescription": "RXeoerZAxbDPXU5x", "title": "JBhIpJ9b0Ap7CmSi"}}, "name": "KPjcwAw5GdxpvLfa"}' \
    > test.out 2>&1
eval_tap $? 302 'CreateView' test.out

#- 303 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId '4b4hTaZBGdX66DqP' \
    --storeId 'TdurR3MYda0Y0BCO' \
    > test.out 2>&1
eval_tap $? 303 'GetView' test.out

#- 304 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId '4qPnvxERWjKasq5z' \
    --storeId 'Q6uZNwKjnX7vDIqp' \
    --body '{"displayOrder": 4, "localizations": {"BstguOdN0O7l3GbK": {"description": "PHdDTQDEEE2mTsn1", "localExt": {"NwJ71szsNmnqZSWd": {}, "EyOVYrTdDq7IqbTV": {}, "v8BLsqQW8HSrEm5Y": {}}, "longDescription": "7jI232SjktijiNzT", "title": "Ue8KdizXmrmK0sCU"}, "sqxKocHomtjoU1kU": {"description": "qRedwIu1TSRr6r8m", "localExt": {"zfMedpcKhvHPlvYa": {}, "nGqEkn9OEVwLWGT4": {}, "MXhmzvRQb7c0vmjW": {}}, "longDescription": "q9fQqzulLGfQMqSL", "title": "QDlRFYMVfiAMa6Pc"}, "o7MfvikslpyL9BYL": {"description": "VVznF6hMYfksp8VQ", "localExt": {"hYSFeBOp0ilGQFwH": {}, "UtZugblT3aIDKn9q": {}, "JXncm5igpAewbmnW": {}}, "longDescription": "k0E7YaPblcWEyNgv", "title": "s5LEZrQXzSQRWRs9"}}, "name": "EGnRPgYlJElgJ8kx"}' \
    > test.out 2>&1
eval_tap $? 304 'UpdateView' test.out

#- 305 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId '1WEeDbql13FtQMu4' \
    --storeId '1rnOzbsFBqg6dziW' \
    > test.out 2>&1
eval_tap $? 305 'DeleteView' test.out

#- 306 QueryWallets
eval_tap 0 306 'QueryWallets # SKIP deprecated' test.out

#- 307 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 45, "expireAt": "1972-08-31T00:00:00Z", "metadata": {"NcwfUBMdNuTaiLxF": {}, "MXRpDP9xutntU8xH": {}, "w4yYJOCViHwunQwp": {}}, "origin": "Steam", "reason": "zEpDln04F8BQjzob", "source": "CONSUME_ENTITLEMENT"}, "currencyCode": "JtqXltZF6aSRmHU5", "userIds": ["cAnpmLiEu4CNtX2l", "OgDQAWhulbrDf7q4", "iR3hXIbzWPKOkzft"]}, {"creditRequest": {"amount": 29, "expireAt": "1988-05-09T00:00:00Z", "metadata": {"K5fbqioeoRIplY0D": {}, "IzRCNAO6ZpqXJmPJ": {}, "so6M11LLZWKgWxn9": {}}, "origin": "Steam", "reason": "L16HQdtAneXGgxNg", "source": "TRADE"}, "currencyCode": "mbOubTxAAeDCowR3", "userIds": ["QusJLsPlW7ZyORFk", "MeCNL1oNrF3Smgud", "N9EbKbTbrDzNgVEc"]}, {"creditRequest": {"amount": 46, "expireAt": "1981-04-03T00:00:00Z", "metadata": {"Xwn5GHJDGatrYOMO": {}, "91CYEjX867n9PT9f": {}, "R7mMuBXPDKCriRKz": {}}, "origin": "GooglePlay", "reason": "Z7TXAVRnUVbxEJcK", "source": "PURCHASE"}, "currencyCode": "THrDel8oThvr8CUE", "userIds": ["zw4zL1QeR3EYXBFp", "0vDgyoHXIlrMl2RA", "UX9y4tY7o5FFi1n1"]}]' \
    > test.out 2>&1
eval_tap $? 307 'BulkCredit' test.out

#- 308 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "ukCL26ihdMy9YCLN", "request": {"allowOverdraft": false, "amount": 63, "balanceOrigin": "IOS", "balanceSource": "PAYMENT", "metadata": {"vq6SUSt8xd8EgE15": {}, "XNuw6Y7sToQNkuZz": {}, "J1XBxw01iBBQukgQ": {}}, "reason": "94ZvPCWcMX0ov3U2"}, "userIds": ["sKjIeyFS97dYD7Lk", "cTKYpCfl6HPy5cJf", "AV5iOfzwt3bpxRNt"]}, {"currencyCode": "6lKoMjCPtEKeBWTm", "request": {"allowOverdraft": false, "amount": 87, "balanceOrigin": "System", "balanceSource": "TRADE", "metadata": {"n8TvZVTe4L2lXrVP": {}, "X6r5ZTcnVVOKMApT": {}, "cWsFRUlWBp4gBs9U": {}}, "reason": "ufgsVbG6TUe3jbuQ"}, "userIds": ["SPYZgPm4JLsXVtBO", "7HMPO4ozK705ykRq", "EetHsxAJ8Ny1LRkP"]}, {"currencyCode": "U9hrl5nkpEdBe8bY", "request": {"allowOverdraft": true, "amount": 8, "balanceOrigin": "GooglePlay", "balanceSource": "EXPIRATION", "metadata": {"W2b5OHKtUv4lTkQN": {}, "jxhXdj1CG0EBgst9": {}, "Qu8Ofl2oB8VTjF0p": {}}, "reason": "D3NHU8iYUOtG5gbQ"}, "userIds": ["SKW2MdgCH4bWxRF6", "fBPa6GOuV5z0p8ja", "Js2duQqawPrxi6F4"]}]' \
    > test.out 2>&1
eval_tap $? 308 'BulkDebit' test.out

#- 309 GetWallet
eval_tap 0 309 'GetWallet # SKIP deprecated' test.out

#- 310 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'elhy9CZ94CAUVW8F' \
    --end 'oEf8tjCjWc22qqDf' \
    --start 'Nz59jHwSDQHadmAo' \
    > test.out 2>&1
eval_tap $? 310 'SyncOrders' test.out

#- 311 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["0lzhPm7RmaOr6TLw", "VyE42ApAb7CKt79w", "AopZL9Cw6K9h55mw"], "apiKey": "UvhdBOgumV4wAsd4", "authoriseAsCapture": false, "blockedPaymentMethods": ["J0rzqX2KJcYHgiFD", "xclBXap6j73doCWx", "hubMXbxNvT6wAffv"], "clientKey": "4uzKAwiI4wTxNIef", "dropInSettings": "CmtrxWu293551nQB", "liveEndpointUrlPrefix": "NKcqCkUXRj8gQHEe", "merchantAccount": "4CO370OsbzRKKPd6", "notificationHmacKey": "mjzLxllUrFYn7cSu", "notificationPassword": "O7NxKHUHg0c4X7fH", "notificationUsername": "dITmN9opaF0kh3pC", "returnUrl": "RB3infEVxArF7TB6", "settings": "A6a71zAJpaPeudUt"}' \
    > test.out 2>&1
eval_tap $? 311 'TestAdyenConfig' test.out

#- 312 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "KPJUmAvxBxJNPlvv", "privateKey": "YZw4MWzWFTuNPf5J", "publicKey": "CSDyYy4e5qoTZxSo", "returnUrl": "ZbQUnUxS6m68WL3H"}' \
    > test.out 2>&1
eval_tap $? 312 'TestAliPayConfig' test.out

#- 313 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "DL4yx5I0euBsccHP", "secretKey": "A2v9XP9enfEX7llo"}' \
    > test.out 2>&1
eval_tap $? 313 'TestCheckoutConfig' test.out

#- 314 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'LgIYqxFfSNJlHCjx' \
    > test.out 2>&1
eval_tap $? 314 'DebugMatchedPaymentMerchantConfig' test.out

#- 315 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "LNnYUlGQsFpy9ZVl", "clientSecret": "LIFwLgT78nootfUs", "returnUrl": "9559ilm3cauhrw9Y", "webHookId": "n2z5cnbm7z2Aa24y"}' \
    > test.out 2>&1
eval_tap $? 315 'TestPayPalConfig' test.out

#- 316 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["BTw3wfNGyWf3VujS", "7Bq5bcfPW4pPZB9Y", "XltCxyztUnj17t3g"], "publishableKey": "HBXvjvziexzOLbOW", "secretKey": "btcJUxM3AWyDkA5L", "webhookSecret": "mART6kulpM4SRtUE"}' \
    > test.out 2>&1
eval_tap $? 316 'TestStripeConfig' test.out

#- 317 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "5P4kxmHtFbjqurHi", "key": "x0QYycDH5we2Mx0s", "mchid": "YCnYPT4i4mxc14iR", "returnUrl": "fzJwKuc7EpiQEzz5"}' \
    > test.out 2>&1
eval_tap $? 317 'TestWxPayConfig' test.out

#- 318 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "N5osRYO7wbYh7q02", "flowCompletionUrl": "W8tkTURUFmqNc8xh", "merchantId": 88, "projectId": 92, "projectSecretKey": "qptccNorRls7EC3n"}' \
    > test.out 2>&1
eval_tap $? 318 'TestXsollaConfig' test.out

#- 319 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'DnhFvDlFd7iyZpvW' \
    > test.out 2>&1
eval_tap $? 319 'GetPaymentMerchantConfig' test.out

#- 320 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'VJFK6ZuvlzGCII15' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["6hIg0g8HIxpzm9Ac", "FhH4ZlYY3rEuHMWw", "QNmCQmGCF963CbsO"], "apiKey": "awlRBQJH6fNekhk0", "authoriseAsCapture": false, "blockedPaymentMethods": ["hMOSfpyJkJlmJmTk", "FvB7wkY6nuUEGJ3k", "0HGtpK43uORGREOO"], "clientKey": "wTuY8dhNCDWWpN3B", "dropInSettings": "6tedgFUzBm5vGA3i", "liveEndpointUrlPrefix": "tKaF9z3WWuv3j8T9", "merchantAccount": "g1f6P3D3rVcC2g6t", "notificationHmacKey": "42jE1Wad232YV7A2", "notificationPassword": "zHFGbN8AQaCaw9UF", "notificationUsername": "7cdSDd99DQZ7vnTx", "returnUrl": "8HDXTJWiyw17ogzm", "settings": "bj4SLYDrZJvDLGvn"}' \
    > test.out 2>&1
eval_tap $? 320 'UpdateAdyenConfig' test.out

#- 321 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id '6qtroZcp16HKXX1f' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 321 'TestAdyenConfigById' test.out

#- 322 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 't5nBA9xNIJVuMz04' \
    --sandbox  \
    --validate  \
    --body '{"appId": "evSdE2FMcKd7c94r", "privateKey": "EmIYuAT5OAcUwYHG", "publicKey": "mG5rNDBF1oU37vjf", "returnUrl": "yX5YLaM0wmi0i1WA"}' \
    > test.out 2>&1
eval_tap $? 322 'UpdateAliPayConfig' test.out

#- 323 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'BBbq8IzZsMFLX9Zh' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 323 'TestAliPayConfigById' test.out

#- 324 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'FXcFtfBS3ZIHofhw' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "yM6Bw2sFGQ5DQoDw", "secretKey": "zrKPOZZnV3zR7YxS"}' \
    > test.out 2>&1
eval_tap $? 324 'UpdateCheckoutConfig' test.out

#- 325 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'u6addocg10Hy9jx7' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 325 'TestCheckoutConfigById' test.out

#- 326 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'gBHTOHHArjld0LnR' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "EsrrB2pJ7V8BSruc", "clientSecret": "jO3zvSM5KeVNHU9G", "returnUrl": "cOivIfcCJt4U8VSg", "webHookId": "Xoi9Fw25b9qXzlIK"}' \
    > test.out 2>&1
eval_tap $? 326 'UpdatePayPalConfig' test.out

#- 327 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '2G6AUjBCdf0Rp5e5' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 327 'TestPayPalConfigById' test.out

#- 328 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'IvFuN1oUsCnBmGMx' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["5F6EhM3dKvIG9MR0", "hTINvq1VR9SJUfQE", "X996Mh1sQ3Dw3uyj"], "publishableKey": "gQNAs9188Qm3W1De", "secretKey": "2McGd10wefF0CJlH", "webhookSecret": "55RLEgeAsSpQdcmG"}' \
    > test.out 2>&1
eval_tap $? 328 'UpdateStripeConfig' test.out

#- 329 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'HZuRVQ8tzwqMayP8' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 329 'TestStripeConfigById' test.out

#- 330 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'A3HGNI3BfjkFd6MH' \
    --validate  \
    --body '{"appId": "o6gGQ5mChYoKD7yq", "key": "CR03RovQZhwfjkq9", "mchid": "iyTbyD3D01tRpuuy", "returnUrl": "IagSSzEL8H4euLuf"}' \
    > test.out 2>&1
eval_tap $? 330 'UpdateWxPayConfig' test.out

#- 331 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'hQj2KP3LLxl9Hs2L' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 331 'UpdateWxPayConfigCert' test.out

#- 332 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id '2wlpKBVURxHefz77' \
    > test.out 2>&1
eval_tap $? 332 'TestWxPayConfigById' test.out

#- 333 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'a9fntCNiHBRUNCPS' \
    --validate  \
    --body '{"apiKey": "re5GmZzCQwilS3Ix", "flowCompletionUrl": "SjlyvR9PxG9Lji2V", "merchantId": 5, "projectId": 41, "projectSecretKey": "88W8aLjIxVGpdOqg"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdateXsollaConfig' test.out

#- 334 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'uxvRwI9ZBTipMRlh' \
    > test.out 2>&1
eval_tap $? 334 'TestXsollaConfigById' test.out

#- 335 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'K9DMMaI4ryVDvNar' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "MEDIUM", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 335 'UpdateXsollaUIConfig' test.out

#- 336 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '55' \
    --namespace "$AB_NAMESPACE" \
    --offset '93' \
    --region 'kVH75UcmNXK5RqcI' \
    > test.out 2>&1
eval_tap $? 336 'QueryPaymentProviderConfig' test.out

#- 337 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "jUr5z03wxB3E9hrE", "region": "9f9COFrOr6wJDBwI", "sandboxTaxJarApiToken": "DsJHNg6TvNGjwI4T", "specials": ["ADYEN", "PAYPAL", "ALIPAY"], "taxJarApiToken": "wBufUorJouduhCEJ", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 337 'CreatePaymentProviderConfig' test.out

#- 338 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 338 'GetAggregatePaymentProviders' test.out

#- 339 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'KDIE9YugcupLxVBc' \
    > test.out 2>&1
eval_tap $? 339 'DebugMatchedPaymentProviderConfig' test.out

#- 340 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 340 'GetSpecialPaymentProviders' test.out

#- 341 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'RkfhRuqkOTHSia7o' \
    --body '{"aggregate": "ADYEN", "namespace": "5wNYlFiliYmBrqrO", "region": "c0NIligBrOkBljwR", "sandboxTaxJarApiToken": "ENjt04ZpyTTZG1Lx", "specials": ["STRIPE", "ALIPAY", "WXPAY"], "taxJarApiToken": "S4Yw8NmPaBeryzX2", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 341 'UpdatePaymentProviderConfig' test.out

#- 342 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'OPVVFqVqxjq1iG3T' \
    > test.out 2>&1
eval_tap $? 342 'DeletePaymentProviderConfig' test.out

#- 343 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 343 'GetPaymentTaxConfig' test.out

#- 344 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "ySOh8SI75oXbyq8F", "taxJarApiToken": "Bbur80QwnlgAVfqz", "taxJarEnabled": false, "taxJarProductCodesMapping": {"Ws5s0nT89A88GDOU": "ClGyzYgnYTdim6Pk", "Roq5TO65KWh8ztRJ": "kXxUAj3jzZvEaY10", "3YUIMuSjDHz0zPWM": "ZQNNP2JqQqhISTBT"}}' \
    > test.out 2>&1
eval_tap $? 344 'UpdatePaymentTaxConfig' test.out

#- 345 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey '1Gofv4SuaZ8yCB9T' \
    --end 'VZnuzgvAZJRm71EC' \
    --start '3ENuvD8OPsp5Z3ez' \
    > test.out 2>&1
eval_tap $? 345 'SyncPaymentOrders' test.out

#- 346 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language '84KVB7HeWPnVeFdy' \
    --storeId '5ezlCU6SGzkMpTL2' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetRootCategories' test.out

#- 347 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'wxobjxAbagqEmXn6' \
    --storeId 'U2VeV2emK3JecJA4' \
    > test.out 2>&1
eval_tap $? 347 'DownloadCategories' test.out

#- 348 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'skqCbPxRkIAFQh9y' \
    --namespace "$AB_NAMESPACE" \
    --language 'DdoLE2s7mrVrmTJw' \
    --storeId 'tBTzQTrNo1LcWNf7' \
    > test.out 2>&1
eval_tap $? 348 'PublicGetCategory' test.out

#- 349 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'xHpi1JZJjIRtCfqD' \
    --namespace "$AB_NAMESPACE" \
    --language 'HSlo54zSnRN0zGMw' \
    --storeId 'orzym1z3ZdetOic9' \
    > test.out 2>&1
eval_tap $? 349 'PublicGetChildCategories' test.out

#- 350 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'AQOFWpdItLBhvKJq' \
    --namespace "$AB_NAMESPACE" \
    --language '9tWz9yui8a6jOflF' \
    --storeId 'JlZEhz1QDeh05hj9' \
    > test.out 2>&1
eval_tap $? 350 'PublicGetDescendantCategories' test.out

#- 351 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 351 'PublicListCurrencies' test.out

#- 352 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'PSN' \
    > test.out 2>&1
eval_tap $? 352 'GeDLCDurableRewardShortMap' test.out

#- 353 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'STEAM' \
    > test.out 2>&1
eval_tap $? 353 'GetIAPItemMapping' test.out

#- 354 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'VxJ62Q5AOAOyL65c' \
    --region 'PaOZA8BG8KcVWOX9' \
    --storeId 'n3YsjJexnFA9Umz3' \
    --appId 'KPICya5Fk5TPaEbX' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetItemByAppId' test.out

#- 355 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --autoCalcEstimatedPrice  \
    --baseAppId '9cV8v7MXctihtxMn' \
    --categoryPath 'Ir4b7jyfL3zMkklG' \
    --features 'CPISlsnVA6z0uSfN' \
    --includeSubCategoryItem  \
    --itemType 'SUBSCRIPTION' \
    --language 'I1y9tjRLVOXBMa0J' \
    --limit '17' \
    --offset '94' \
    --region 'Ie1AY0tUA7EKASk3' \
    --sortBy 'displayOrder:desc,createdAt:desc' \
    --storeId 'izYM97ebZcYqwfIH' \
    --tags 'PWMkOmrT5HL16jMw' \
    > test.out 2>&1
eval_tap $? 355 'PublicQueryItems' test.out

#- 356 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'ECnmwJv4rpqtzDaz' \
    --region '0WUJlBCHzJ2v9K8c' \
    --storeId '1zOlZg30pagfP0Ff' \
    --sku 'OMBOpeQT4zYIbU4i' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetItemBySku' test.out

#- 357 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region '9mLyX46Alt08rrnG' \
    --storeId '8y2ScXkwjpAp82pG' \
    --itemIds 'cxvXaG9LzHpMS53j' \
    > test.out 2>&1
eval_tap $? 357 'PublicGetEstimatedPrice' test.out

#- 358 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'llopwirRo3A8WxnR' \
    --region '0YaMsF3f5KLtpTSs' \
    --storeId 'PMGDZTOwEP5Bhh0N' \
    --itemIds 'StWIggmhfAzVdNYP' \
    > test.out 2>&1
eval_tap $? 358 'PublicBulkGetItems' test.out

#- 359 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["7Ao1z7FeJM2fWXGk", "7JObSHksRkabpmvR", "sc7ZYvXCT6m6mRZA"]}' \
    > test.out 2>&1
eval_tap $? 359 'PublicValidateItemPurchaseCondition' test.out

#- 360 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'CODE' \
    --limit '1' \
    --offset '78' \
    --region 'ZFiSkmhwVVMGkXNw' \
    --storeId 'MYwFyljy5bYQdQ87' \
    --keyword 'hUHA0FJZwP8GslMp' \
    --language 'x3m7lEXTmnTbtjK9' \
    > test.out 2>&1
eval_tap $? 360 'PublicSearchItems' test.out

#- 361 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'RsyoqT3adB48Jxp2' \
    --namespace "$AB_NAMESPACE" \
    --language 'zaItg9jTNZvpFEUI' \
    --region '21aSaIsMyLKPPIZx' \
    --storeId '0zdNAagipZwiaBrF' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetApp' test.out

#- 362 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'rXtGMjujfHZB1gMI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 362 'PublicGetItemDynamicData' test.out

#- 363 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId '1B8DXb37DffTZ7yQ' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'z337LLNCjIySe36S' \
    --populateBundle  \
    --region 'A5dxATLv5PkLvraR' \
    --storeId 'zChdjDGdlk2A2jHb' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetItem' test.out

#- 364 GetPaymentCustomization
eval_tap 0 364 'GetPaymentCustomization # SKIP deprecated' test.out

#- 365 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "APNGInvbnf4ewKFF", "paymentProvider": "PAYPAL", "returnUrl": "r6IydpXW0MO0eT9o", "ui": "kl6MlWOl9feWO2bm", "zipCode": "OikTBJHTEm5PSeyo"}' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetPaymentUrl' test.out

#- 366 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'd5L6OooYoQn9iHEq' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetPaymentMethods' test.out

#- 367 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'WO1cVCUIOx90FQdw' \
    > test.out 2>&1
eval_tap $? 367 'PublicGetUnpaidPaymentOrder' test.out

#- 368 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Li3GOQkLtpuRNeT1' \
    --paymentProvider 'XSOLLA' \
    --zipCode 'ZNonMrPkzUe9SglA' \
    --body '{"token": "JGyZS0I8FevJiT98"}' \
    > test.out 2>&1
eval_tap $? 368 'Pay' test.out

#- 369 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'HUBp56Q4WETxtGMs' \
    > test.out 2>&1
eval_tap $? 369 'PublicCheckPaymentOrderPaidStatus' test.out

#- 370 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'XSOLLA' \
    --region 'tPKPuK0K4PiMDTR7' \
    > test.out 2>&1
eval_tap $? 370 'GetPaymentPublicConfig' test.out

#- 371 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'LxihuOn57io0d9dG' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetQRCode' test.out

#- 372 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID '3yzaNbGeASX83SLi' \
    --foreinginvoice 'IbAP2qyUnHnfrEdD' \
    --invoiceId 'fY4TTxu8goZgsX4R' \
    --payload 'wfM4qnUdcQqZ9F1u' \
    --redirectResult 'ivPob0YZEuXQACDD' \
    --resultCode 'QryNf9VGxbOeJe4n' \
    --sessionId '9eUlBQZ2UGePWXbA' \
    --status 'yGiXa9nUsHCVicuJ' \
    --token '7onrUXVlB6xNel4B' \
    --type 'xb9KwFYqdhEVq3hb' \
    --userId 'sApeASfR0ljKxqZc' \
    --orderNo 'LuhwNDvValv3bkoM' \
    --paymentOrderNo 'XNzl1ywEPiunixlE' \
    --paymentProvider 'WXPAY' \
    --returnUrl 'hMSaDRp17dUWHcjr' \
    > test.out 2>&1
eval_tap $? 372 'PublicNormalizePaymentReturnUrl' test.out

#- 373 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'b6qNeKpOxPrlG9sv' \
    --paymentOrderNo 'dqsiVTqPbzY1yxl7' \
    --paymentProvider 'WXPAY' \
    > test.out 2>&1
eval_tap $? 373 'GetPaymentTaxValue' test.out

#- 374 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'oXE4wgcYT5CdjaJu' \
    > test.out 2>&1
eval_tap $? 374 'GetRewardByCode' test.out

#- 375 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'UzFIeqaVr1CE1gu6' \
    --limit '5' \
    --offset '6' \
    --sortBy 'namespace:desc,namespace:asc' \
    > test.out 2>&1
eval_tap $? 375 'QueryRewards1' test.out

#- 376 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'zC77J4irvZ9tktWL' \
    > test.out 2>&1
eval_tap $? 376 'GetReward1' test.out

#- 377 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 377 'PublicListStores' test.out

#- 378 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'tDdlmVGK6iolEw6I,IpDc9X5ijmtDGvd9,ESdY0eTkBWA44Qqs' \
    --itemIds 'i5yOjvl5sRN2ENn1,RLi5iMPnbg7o1zYp,qUsliPyXZGYIW5ZD' \
    --skus 'tWbdkzPP47RcUIi2,CoNj4EG2emxKQk8c,Brt5E8k8rzDZ08j6' \
    > test.out 2>&1
eval_tap $? 378 'PublicExistsAnyMyActiveEntitlement' test.out

#- 379 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'ICP75cm8YDChFi3z' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 380 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --itemId 'tBcO3fWq9qfmBv0X' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 381 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --sku 'Fl3uU1aMD0mczWxc' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 382 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds '8f1s2QPMMZsf2dvK,ZyHChRPHvdkcKW21,B5EFtD2pYaKTz1gc' \
    --itemIds 'E2XCwTkRUIX6IFHN,mB9mYBvtOwxjqyrj,DApeN5eAfRqSgH5x' \
    --skus 'IuBTYOdsvNyk52MQ,FkVVEf36S7yPgG48,bk6PwH1tdEAJSqXA' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetEntitlementOwnershipToken' test.out

#- 383 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "0Wv0zWGvkc6byp3m", "language": "ZUH", "region": "GuaZVTxBlw1IWeXK"}' \
    > test.out 2>&1
eval_tap $? 383 'SyncTwitchDropsEntitlement' test.out

#- 384 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'FT4rfSbbSlDPGf9F' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 384 'PublicGetMyWallet' test.out

#- 385 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'n32SJNPZkEfkAcJT' \
    --body '{"epicGamesJwtToken": "MS4pVRcCHIGfmCMT"}' \
    > test.out 2>&1
eval_tap $? 385 'SyncEpicGameDLC' test.out

#- 386 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'r9ACnI2sMrEgl7ZR' \
    > test.out 2>&1
eval_tap $? 386 'SyncOculusDLC' test.out

#- 387 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '1HCkf2Sw78lLGKjD' \
    --body '{"serviceLabel": 69}' \
    > test.out 2>&1
eval_tap $? 387 'PublicSyncPsnDlcInventory' test.out

#- 388 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId '87XjA0ajvb7JcGUF' \
    --body '{"serviceLabels": [32, 9, 13]}' \
    > test.out 2>&1
eval_tap $? 388 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 389 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'kxq58fikq83hqJ7H' \
    --body '{"appId": "P63Se6kVW5fkl60I", "steamId": "mLBv6nUU0r1rfX9s"}' \
    > test.out 2>&1
eval_tap $? 389 'SyncSteamDLC' test.out

#- 390 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'tpvJUuyPdzx8BM2w' \
    --body '{"xstsToken": "EgTtLRT5stwQFUEb"}' \
    > test.out 2>&1
eval_tap $? 390 'SyncXboxDLC' test.out

#- 391 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'TPQ8p7VMlxEXnqHw' \
    --appType 'GAME' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName '6YKhVrYkMqXkQ7ql' \
    --features 'aJjSYEseBYCFGoKp,Xx60GmEX9x2BYpyK,EBQ7TW7lZvDbwFJJ' \
    --itemId 'hBRdq8BgAI81k4Gr,7jVVx5l3yrH9HR4r,eG0HwUXxQTf5YpDU' \
    --limit '67' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 391 'PublicQueryUserEntitlements' test.out

#- 392 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'YsJBEkYUrLv4qUiT' \
    --appId 'kFcLBrg2JB0WiCpV' \
    > test.out 2>&1
eval_tap $? 392 'PublicGetUserAppEntitlementByAppId' test.out

#- 393 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'BwvAffJ3btt0PpQY' \
    --limit '88' \
    --offset '85' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 393 'PublicQueryUserEntitlementsByAppType' test.out

#- 394 PublicGetUserEntitlementByItemId
eval_tap 0 394 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 395 PublicGetUserEntitlementBySku
eval_tap 0 395 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 396 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'SSeJ4qy4PIKleuV2' \
    --appIds '71bwZ4niLSzQnv0C,00dtNGGzbGYSYo9f,Y2EBZAHQXc4Xcae7' \
    --itemIds 'VKl0ARzGEArlfE1N,SmtcADoZvd0La7P4,JI4H7uDzkOHTdnUt' \
    --skus 'drRcs3GeOsKPNlG7,rEXi6LEqJERpbxEq,07txnvZZeAf7QBuZ' \
    > test.out 2>&1
eval_tap $? 396 'PublicExistsAnyUserActiveEntitlement' test.out

#- 397 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'K5GJlBncg8tQnJOK' \
    --appId 'HC16xjJZ4kiU3N85' \
    > test.out 2>&1
eval_tap $? 397 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 398 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '56ll2LQWpdESOBV7' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'fVopbpPhsana0uXG' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 399 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '7GUTV1BwgkLDj4pj' \
    --ids 'VktyoNSsEHlzyd0S,arkhltUxgbN5eElQ,NESFLD8hCc9onSNj' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 400 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'bQEqFGwnDG8kz4kv' \
    --entitlementClazz 'LOOTBOX' \
    --sku 'lqJ4MO3L8x1H5Ogz' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 401 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'HypgsSeKCvtPz7ja' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gBG9a1TZ87ltClc3' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetUserEntitlement' test.out

#- 402 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'RDXF5055tUlenimj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ibm0riCaNp8dUBDi' \
    --body '{"options": ["nAB6HqIWIi5Bvb1r", "cuEtWAF763kci7lT", "62BOHaso53W3U2Mu"], "requestId": "9ZGMWou1U0RVCf3g", "useCount": 80}' \
    > test.out 2>&1
eval_tap $? 402 'PublicConsumeUserEntitlement' test.out

#- 403 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'JFX1ZHV9yo9Ur1hf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hmGEKuVUZdCacRGa' \
    --body '{"requestId": "taPrcgTcA71dtqtS", "useCount": 96}' \
    > test.out 2>&1
eval_tap $? 403 'PublicSellUserEntitlement' test.out

#- 404 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'FDwpqy7XOU3Dwgly' \
    --body '{"code": "MGNll4O8ELahcNJq", "language": "JdEJ_KqMk", "region": "qxRyQ2pi7xuAufJa"}' \
    > test.out 2>&1
eval_tap $? 404 'PublicRedeemCode' test.out

#- 405 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'kIPXOQznHZTj8oYf' \
    --body '{"excludeOldTransactions": false, "language": "rCuZ_wugs-071", "productId": "okoGynp6xcqNKJnA", "receiptData": "hrSt96OaARAjHLGV", "region": "3sNxS8uLBZiVRYIy", "transactionId": "QLcslTEqgVNG8Aqk"}' \
    > test.out 2>&1
eval_tap $? 405 'PublicFulfillAppleIAPItem' test.out

#- 406 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'tgvjwNJAwIpEy2ZN' \
    --body '{"epicGamesJwtToken": "pojZ24I2n25smsrm"}' \
    > test.out 2>&1
eval_tap $? 406 'SyncEpicGamesInventory' test.out

#- 407 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'JFHGiYnyhbqxLuTZ' \
    --body '{"autoAck": false, "language": "FGK_616", "orderId": "LyflAqqAP4M78smY", "packageName": "dyge6DroOywOxI4G", "productId": "6jZzoYIFAvYfT8XQ", "purchaseTime": 46, "purchaseToken": "OTkWETSJ04c5MGIn", "region": "O4yznh2YpZvvmziS"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicFulfillGoogleIAPItem' test.out

#- 408 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'SiSpXeWOGayfRkQv' \
    > test.out 2>&1
eval_tap $? 408 'SyncOculusConsumableEntitlements' test.out

#- 409 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'oN06SpNOnuSksfm7' \
    --body '{"currencyCode": "hcIFdkdrwAcK2lUd", "price": 0.008846175723622784, "productId": "9h9FgvfhiLEAkA7n", "serviceLabel": 73}' \
    > test.out 2>&1
eval_tap $? 409 'PublicReconcilePlayStationStore' test.out

#- 410 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId '516ydoRT1qZBrdTn' \
    --body '{"currencyCode": "GrwHeWoQXPFWFaKb", "price": 0.4791797942261289, "productId": "grGkv8SVwLyS4VbH", "serviceLabels": [73, 67, 43]}' \
    > test.out 2>&1
eval_tap $? 410 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 411 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'BepK1Ix4SwjCYjCH' \
    --body '{"appId": "niVSn1gYGal5NrBt", "currencyCode": "T0om9OlGzpF25qu9", "language": "sYH_TFzX-250", "price": 0.2634086494711857, "productId": "HHGlnAnEu6EKYceT", "region": "EqYudHlA4AxeEIfU", "steamId": "xJ2xMSNNBxCeN3pG"}' \
    > test.out 2>&1
eval_tap $? 411 'SyncSteamInventory' test.out

#- 412 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'n46fGvodt413MRdG' \
    --body '{"gameId": "8qAPiANv2Ar8yXV6", "language": "VFV-Cx", "region": "JPZPUh2nHQwpWi8H"}' \
    > test.out 2>&1
eval_tap $? 412 'SyncTwitchDropsEntitlement1' test.out

#- 413 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z6C0VJ0fK2m6lQ5A' \
    --body '{"currencyCode": "o8TITYiHSR2SEJh1", "price": 0.816657933106815, "productId": "DedZdNqkXPWZfT8Z", "xstsToken": "fdKp9q4nXuK0tJAY"}' \
    > test.out 2>&1
eval_tap $? 413 'SyncXboxInventory' test.out

#- 414 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'ror2XdtSCG7ZExOo' \
    --itemId 'IpWzacOvwUsnIbQM' \
    --limit '10' \
    --offset '42' \
    --status 'FULFILL_FAILED' \
    > test.out 2>&1
eval_tap $? 414 'PublicQueryUserOrders' test.out

#- 415 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ai3zWFGorCbncoj5' \
    --body '{"currencyCode": "RvEtXiKyUGdNfMiw", "discountedPrice": 13, "ext": {"EijjjpvSzGkED0ow": {}, "eFYDBPyd1jJBxbrb": {}, "uFay9PXgEQS4871Q": {}}, "itemId": "Smsspn5sNfifK65t", "language": "xAi_864", "price": 42, "quantity": 40, "region": "o321Ll90IBFsSb3F", "returnUrl": "sV2PnCs9R0D5jZEw", "sectionId": "xcow6L7c3COEP4AZ"}' \
    > test.out 2>&1
eval_tap $? 415 'PublicCreateUserOrder' test.out

#- 416 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'x70uwV4XgvGTMHkX' \
    --userId 'eEwuFJf7tbq5KikD' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetUserOrder' test.out

#- 417 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'E7hWvT5bzcfzIpL2' \
    --userId 'pWB4XsdrxIF6kEAm' \
    > test.out 2>&1
eval_tap $? 417 'PublicCancelUserOrder' test.out

#- 418 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'KGNEmFPcUALNziO9' \
    --userId 'Bz2wx4kDAm8XIlei' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetUserOrderHistories' test.out

#- 419 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ujtv2NdQTYoHZogW' \
    --userId '8lBvniHdARadfSoc' \
    > test.out 2>&1
eval_tap $? 419 'PublicDownloadUserOrderReceipt' test.out

#- 420 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'tA3GYO94ZOo94gS5' \
    > test.out 2>&1
eval_tap $? 420 'PublicGetPaymentAccounts' test.out

#- 421 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'DHLB65fxQ06GwTmo' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'lRpcHDWcIoJ45L0Z' \
    > test.out 2>&1
eval_tap $? 421 'PublicDeletePaymentAccount' test.out

#- 422 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'e3YamxKDSZTl4UiJ' \
    --autoCalcEstimatedPrice  \
    --language 'SCbG4UmG3TkMTzOc' \
    --region 'BIciiKwRs1E7sH2G' \
    --storeId '9MJ6F7Rr7O15jqeK' \
    --viewId 'ssQpme6eyM48tE7e' \
    > test.out 2>&1
eval_tap $? 422 'PublicListActiveSections' test.out

#- 423 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'JRsXNeveQXqnFRYm' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'SvPLeQZIpKFXgnsx' \
    --limit '49' \
    --offset '13' \
    --sku 'c2bUsO7FP8RmOstZ' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 423 'PublicQueryUserSubscriptions' test.out

#- 424 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'GDgiVsV2OttwJaMx' \
    --body '{"currencyCode": "PDIJ5hFQHumFvPKq", "itemId": "upHj72TlLs964iAB", "language": "LGOv-OhAp_IT", "region": "iItrSrEJMBAIwTLk", "returnUrl": "rMDFQfpQ9o0GJMTf", "source": "qRRaZozM8xCBoaS2"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicSubscribeSubscription' test.out

#- 425 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'FMwfWNCbN5GelVOU' \
    --itemId '0hHnsCl5k6Jxh5mk' \
    > test.out 2>&1
eval_tap $? 425 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 426 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'mQzKg0jWCjpGwh7p' \
    --userId 'LAi5JmzvM6JFKB8i' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetUserSubscription' test.out

#- 427 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'kHpl3sNRaDEC2OkX' \
    --userId 'A3WqypoOw0H2s0si' \
    > test.out 2>&1
eval_tap $? 427 'PublicChangeSubscriptionBillingAccount' test.out

#- 428 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'bQNBz81zRPntxpgi' \
    --userId '7tXIcNEcGJjOCXpu' \
    --body '{"immediate": false, "reason": "O7Q2WQwSWqSs05rj"}' \
    > test.out 2>&1
eval_tap $? 428 'PublicCancelSubscription' test.out

#- 429 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ISy4B0X9AJdkT7UY' \
    --userId 'CV8agvwOI2LlOQNR' \
    --excludeFree  \
    --limit '80' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 429 'PublicGetUserSubscriptionBillingHistories' test.out

#- 430 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId '132RdgwMXv9olKpR' \
    --language 'yWQim3qlART9mPPm' \
    --storeId 'YUvlkBGPJFaFzkAB' \
    > test.out 2>&1
eval_tap $? 430 'PublicListViews' test.out

#- 431 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'C8zWMcYW5iRrw32F' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rg8y4rOuj7J6ijJb' \
    > test.out 2>&1
eval_tap $? 431 'PublicGetWallet' test.out

#- 432 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'cycXmBcrJLb7laby' \
    --namespace "$AB_NAMESPACE" \
    --userId 'otifVk9KyqceGv0C' \
    --limit '63' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 432 'PublicListUserWalletTransactions' test.out

#- 433 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --availableDate 'jbrum8UxcutmVg8A' \
    --baseAppId 'PWKxoj6MF68VuKDo' \
    --categoryPath 'klYmkytCAH8Jiqe7' \
    --features 'gfV1G6bYgIbVKp4K' \
    --includeSubCategoryItem  \
    --itemName 'gew2mHDksA6Mv9Nz' \
    --itemStatus 'INACTIVE' \
    --itemType 'OPTIONBOX' \
    --limit '79' \
    --offset '2' \
    --region 'eBq9a1L8S1yduOws' \
    --sectionExclusive  \
    --sortBy 'name,createdAt:asc,updatedAt:desc' \
    --storeId '9OqTsInGzHFpFXYJ' \
    --tags 'tHtqwoIwQBeIALI8' \
    --targetNamespace 'JNIII4jrzrPsuMzi' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 433 'QueryItems1' test.out

#- 434 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NM8AB7RRxiZH3ngn' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 434 'ImportStore1' test.out

#- 435 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'itURdMjZLYCaeklQ' \
    --body '{"itemIds": ["cFY1QIk1h5EKvMGd", "6hQ2mHjmLu4oFlRe", "Hy0JyZv7honqeiGT"]}' \
    > test.out 2>&1
eval_tap $? 435 'ExportStore1' test.out

#- 436 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TqpgVsY1kPNdJiJX' \
    --body '{"entitlementOrigin": "Steam", "metadata": {"UZqVR5FWGfH66eFC": {}, "MTsLA8vYVvrIAEeh": {}, "UV0jsjAyVgxS54NN": {}}, "origin": "Oculus", "rewards": [{"currency": {"currencyCode": "wSYEZjEb0Pv35fEk", "namespace": "9s11bFXkf7rQJ4Kj"}, "item": {"itemId": "7Qyo9tUptiyZzRX8", "itemSku": "Y4rxRWZPe4ZLAQWu", "itemType": "BJwxObZqMGxhffy9"}, "quantity": 4, "type": "ITEM"}, {"currency": {"currencyCode": "BI51etn17OcmSVHZ", "namespace": "6wtPVAwgvxYxXJTd"}, "item": {"itemId": "uZp1nNYHREmm1cBu", "itemSku": "aRaGeM8yxRfejqSb", "itemType": "VgLd1FoyNFGpu5r2"}, "quantity": 75, "type": "ITEM"}, {"currency": {"currencyCode": "ApA8GsGwyocvY9Ne", "namespace": "PjLJQJXwUApJWohX"}, "item": {"itemId": "n01RB7pu7BaONXyE", "itemSku": "5fIDbsMi48xOYVvE", "itemType": "cEm53BYMBacQBIuD"}, "quantity": 98, "type": "ITEM"}], "source": "DLC", "transactionId": "7U0AJtWPRteszMTd"}' \
    > test.out 2>&1
eval_tap $? 436 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE