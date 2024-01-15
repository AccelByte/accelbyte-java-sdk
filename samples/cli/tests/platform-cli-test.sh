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
    --sortBy 'displayOrder,updatedAt:asc' \
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
    --sortBy 'updatedAt:desc,updatedAt:asc,displayOrder:asc' \
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
    --body '{"appId": "4acYHbrryHB6GO9z", "appType": "DLC", "baseAppId": "3FaepA3b3YJ9nJM6", "boothName": "vtT27xv85K5MU2qm", "categoryPath": "beqaVemINdClpF7O", "clazz": "vlBIEgjse5kd6GED", "displayOrder": 29, "entitlementType": "CONSUMABLE", "ext": {"08yq5E5HleLoog4m": {}, "e2NBFp62xlXvVcJe": {}, "rTPW02PWsHiKYArA": {}}, "features": ["0DjjwMv4vrIPRtvh", "xnKBfBfDlrQQuAc1", "QIyLarjaLOKnX51y"], "flexible": true, "images": [{"as": "PykS8YLmwtYgWGcA", "caption": "0h4G1LZ1HaX5UBMb", "height": 37, "imageUrl": "X1B9oVuzG2CnYX2Y", "smallImageUrl": "BF2g7TVtzYEHUodh", "width": 28}, {"as": "iUfBthbepUCTWiZ1", "caption": "uqh7GAi4FEIu44u8", "height": 45, "imageUrl": "ZLRxYlYqlpq03BGd", "smallImageUrl": "Ik4oEogFVGR71rJO", "width": 57}, {"as": "iA0tQWlHwBcTtztx", "caption": "3VAl6tXFbnATCzUO", "height": 70, "imageUrl": "WmKgE8CZ4AELr5lr", "smallImageUrl": "aa5v5P5Cj8hgFsqH", "width": 59}], "itemIds": ["adEoIVmprwPsa9YD", "92CX0rITajpwHITG", "eHTnqRbzBB9ZFgJb"], "itemQty": {"Q3Fj1umx4ItzkMJ7": 5, "YsHooOIaxIpb1cIO": 72, "VIQvRkQJAtDUH9tx": 53}, "itemType": "BUNDLE", "listable": true, "localizations": {"hGz1ermJYXsYgL7T": {"description": "fyIlAwjTZdRZJJzW", "localExt": {"ZwvTX2bamSCvX1nw": {}, "vSWdDwD7WJHzgNZU": {}, "KsI5y0mR3zMyTsft": {}}, "longDescription": "KqnsIJctAdxyZVKH", "title": "A9DkaSOWgtg8yw8l"}, "HEbVDwBAqanOlscR": {"description": "IWw82k5K5VTkdubk", "localExt": {"OFldMCQ98JH4n0Jt": {}, "gqzZv5kVu4S95mj8": {}, "YRvae4f4lhBPbarb": {}}, "longDescription": "WEm8bVtZcfVCPdQh", "title": "im9QKUAFTVYelIlG"}, "Jg9wdc8bihhWjfZp": {"description": "fcFBUsnnDJlmD1iE", "localExt": {"okbUiYzCQh2iNTwt": {}, "nohddMzMTQ9P7sYL": {}, "DWAJOA75K4BYJ2fk": {}}, "longDescription": "qYJoF2FI3vyyqRzc", "title": "20O7FdsJP1G9tyBT"}}, "lootBoxConfig": {"rewardCount": 12, "rewards": [{"lootBoxItems": [{"count": 29, "duration": 62, "endDate": "1974-12-25T00:00:00Z", "itemId": "KzuMYDUTLBeCidXj", "itemSku": "uGgx8ncXejmeZtzT", "itemType": "0qj0ltsqfiZrthVv"}, {"count": 49, "duration": 98, "endDate": "1996-08-18T00:00:00Z", "itemId": "0OCKDJE3RMUddwSS", "itemSku": "gxCu8zru1DhGAYOH", "itemType": "R5BWa9VzIkaQEl1i"}, {"count": 95, "duration": 8, "endDate": "1992-10-30T00:00:00Z", "itemId": "roNB6hI6IpGcToWg", "itemSku": "FvdRhG9NwV3zDuqV", "itemType": "lVTypcYPK8IxrSZu"}], "name": "xWl0Je4fJIyFAm3D", "odds": 0.6841347009700219, "type": "PROBABILITY_GROUP", "weight": 89}, {"lootBoxItems": [{"count": 40, "duration": 54, "endDate": "1989-01-10T00:00:00Z", "itemId": "wnPS2urJqerobWMZ", "itemSku": "GVL5KLTxahWlS6Xd", "itemType": "BaKSLCgOOPXM6XTU"}, {"count": 15, "duration": 72, "endDate": "1999-03-31T00:00:00Z", "itemId": "dJ90yqHDNacl4F9G", "itemSku": "6Dl5TFwBY6HKXAbl", "itemType": "kT8VGgSH8MGZGwiV"}, {"count": 19, "duration": 33, "endDate": "1973-09-04T00:00:00Z", "itemId": "RLaA643nTMtXSAye", "itemSku": "jnny0Ju13b6o5uB2", "itemType": "XM6IHy7EEvHyLmcv"}], "name": "rZZOdwe1x8RjU6Bi", "odds": 0.9781327863012951, "type": "REWARD_GROUP", "weight": 10}, {"lootBoxItems": [{"count": 71, "duration": 63, "endDate": "1987-03-09T00:00:00Z", "itemId": "2sUBBq2SimQQoLbe", "itemSku": "5YOJvxGRxUzrTwag", "itemType": "H7BMT1IZKTdNFVBQ"}, {"count": 55, "duration": 4, "endDate": "1983-05-20T00:00:00Z", "itemId": "2JTllJkRGB8jqJEd", "itemSku": "6eqqsBVyONV0JRto", "itemType": "zI0jpliCFQ6WgJpG"}, {"count": 84, "duration": 18, "endDate": "1981-02-18T00:00:00Z", "itemId": "BYeQZOzATNSV9E9y", "itemSku": "yNb7yaLXzAVYymOu", "itemType": "hCkZu4htrsf8eIFS"}], "name": "ovTGXaMsq8ePN1oc", "odds": 0.23324146460862305, "type": "REWARD_GROUP", "weight": 20}], "rollFunction": "CUSTOM"}, "maxCount": 48, "maxCountPerUser": 5, "name": "Upe8SjMvpqM8pugg", "optionBoxConfig": {"boxItems": [{"count": 83, "duration": 63, "endDate": "1976-01-30T00:00:00Z", "itemId": "9iCqfW6rqGOQny4i", "itemSku": "j4ysYPonb59gQffk", "itemType": "NOmubxEJr2qEAuJb"}, {"count": 32, "duration": 44, "endDate": "1997-09-02T00:00:00Z", "itemId": "Srcbc4LWfKaY5c1t", "itemSku": "P5TDuI5f6m4KC07C", "itemType": "nsZe32hqEcB1ExYM"}, {"count": 56, "duration": 3, "endDate": "1997-11-26T00:00:00Z", "itemId": "ckvoaJYdMqGegcg3", "itemSku": "eRvBZXN3cjIXmFWR", "itemType": "Jnj8xN7HDPTUEDPN"}]}, "purchasable": false, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 94, "fixedTrialCycles": 16, "graceDays": 84}, "regionData": {"C9ZDj4E4mv12FNXy": [{"currencyCode": "poOLl13j84P0Kqir", "currencyNamespace": "J4PkMFtsnFfz8Ew0", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1973-08-17T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1981-04-12T00:00:00Z", "expireAt": "1985-12-10T00:00:00Z", "price": 91, "purchaseAt": "1987-10-29T00:00:00Z", "trialPrice": 0}, {"currencyCode": "LSQ4GvLtz50D3rpB", "currencyNamespace": "fBovqLwXBuT30EYe", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1997-06-17T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1985-09-20T00:00:00Z", "expireAt": "1993-02-25T00:00:00Z", "price": 1, "purchaseAt": "1982-08-16T00:00:00Z", "trialPrice": 72}, {"currencyCode": "KoUfiHjGmCyPsKCJ", "currencyNamespace": "Tv1ic9gvagF2cSuz", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1980-03-21T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1993-06-07T00:00:00Z", "expireAt": "1981-03-17T00:00:00Z", "price": 39, "purchaseAt": "1984-02-19T00:00:00Z", "trialPrice": 79}], "V7nmDk29mcjSuz9v": [{"currencyCode": "bNStqPtQmQN6eKAG", "currencyNamespace": "iZFCftT0RWECdjWY", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1977-11-19T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1980-04-02T00:00:00Z", "expireAt": "1972-07-11T00:00:00Z", "price": 30, "purchaseAt": "1972-02-16T00:00:00Z", "trialPrice": 57}, {"currencyCode": "wYLQcDvkaEIIPoJT", "currencyNamespace": "83zEGXmVBZLyrH9J", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1978-07-21T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1998-04-10T00:00:00Z", "expireAt": "1979-01-06T00:00:00Z", "price": 83, "purchaseAt": "1987-12-26T00:00:00Z", "trialPrice": 55}, {"currencyCode": "LkP5hc2Fh04JTsqD", "currencyNamespace": "TynCewqJligLlRxO", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1976-03-08T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1972-07-26T00:00:00Z", "expireAt": "1996-03-25T00:00:00Z", "price": 70, "purchaseAt": "1996-08-16T00:00:00Z", "trialPrice": 51}], "RxF6HtlER2txs4qr": [{"currencyCode": "NARATn6KXOutlYBb", "currencyNamespace": "LhL8KXx25FZfQIod", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1982-05-17T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1992-02-07T00:00:00Z", "expireAt": "1980-08-10T00:00:00Z", "price": 22, "purchaseAt": "1979-12-05T00:00:00Z", "trialPrice": 59}, {"currencyCode": "y0fGvTGgfLKsg0b1", "currencyNamespace": "Bq78cE5O5pmPnbiP", "currencyType": "REAL", "discountAmount": 1, "discountExpireAt": "1976-04-18T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1982-12-26T00:00:00Z", "expireAt": "1983-04-11T00:00:00Z", "price": 2, "purchaseAt": "1979-10-02T00:00:00Z", "trialPrice": 24}, {"currencyCode": "3rVaauufxkPHElug", "currencyNamespace": "48TgfNu0rqXUOyTo", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1994-09-02T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1976-10-12T00:00:00Z", "expireAt": "1986-10-27T00:00:00Z", "price": 94, "purchaseAt": "1977-07-19T00:00:00Z", "trialPrice": 72}]}, "saleConfig": {"currencyCode": "Pl3dKF7NXEjrJMki", "price": 67}, "seasonType": "PASS", "sectionExclusive": true, "sellable": true, "sku": "bADMfuOmh0lciRhV", "stackable": false, "status": "INACTIVE", "tags": ["NgdY2vfJuje5cPnm", "KqxJiFJdrmj5vhzg", "sJwex7wq8ZPlXNaU"], "targetCurrencyCode": "GjTvYa5Pqx1K7qcA", "targetNamespace": "oijBPAp6EPb988Nz", "thumbnailUrl": "xrDKVpULjjiw3NeV", "useCount": 66}' \
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
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 85, "comparison": "isGreaterThanOrEqual", "name": "yhqFJkDClOsKmfsg", "predicateType": "SeasonTierPredicate", "value": "VLMlHi8i9gOVqajU", "values": ["nnGeZsZVgbPzPFbr", "OMZMgWkFN7Tpkx6G", "WrgEsWDtaKzn8dZw"]}, {"anyOf": 5, "comparison": "includes", "name": "XTrFibRAhzzEWzWl", "predicateType": "SeasonTierPredicate", "value": "dW2JKmQafUs2bxYz", "values": ["lg7gYs6unPYQ9jNQ", "d8DHoCQykmXHYmkR", "tOEyVbKIf1ZbzgUw"]}, {"anyOf": 81, "comparison": "isLessThan", "name": "1di1ldhOh6HvjnYu", "predicateType": "EntitlementPredicate", "value": "NfC4A2ODiZhbfb8Q", "values": ["mnq3FGQn3Ahu5wxq", "qCyK1XH9D6vl5eFd", "FfgK46GjCWaP8huT"]}]}, {"operator": "and", "predicates": [{"anyOf": 30, "comparison": "isLessThan", "name": "Jq4mChmQHQhO9IKB", "predicateType": "EntitlementPredicate", "value": "DFQfXFD58sG6uDhF", "values": ["utjS029BiJWOG1m7", "YlrzJBYSeMuJfQec", "MKclr5igjNTVItrH"]}, {"anyOf": 66, "comparison": "isGreaterThan", "name": "hxJgaVfw5Vnyq8Oz", "predicateType": "SeasonTierPredicate", "value": "c6VbE0AGcekjMNHu", "values": ["uyDoN91uc28HoSpG", "t1g0GGbT4Hf2PPKO", "PXtz8tXxrmzafMUg"]}, {"anyOf": 23, "comparison": "excludes", "name": "GGvi9kg3rMIzNmhJ", "predicateType": "SeasonTierPredicate", "value": "eg9q86IaDFjjx6uZ", "values": ["qcKLa7LevxNHOSEh", "E8lOLAfTXKLzbrdd", "erWbtwTX9gNRByjb"]}]}, {"operator": "and", "predicates": [{"anyOf": 23, "comparison": "isGreaterThan", "name": "p693lRwtc43atCuC", "predicateType": "SeasonTierPredicate", "value": "X4yFQFdrRoM6FoqC", "values": ["ji329PfVrvMEPtps", "Yw7AlxO6qdFpc71s", "Sck3ggZWJlSlCQMD"]}, {"anyOf": 90, "comparison": "isGreaterThan", "name": "NcpK1QkB2Sy8Ww79", "predicateType": "SeasonTierPredicate", "value": "HuGz3b5WAEvdRF9b", "values": ["7OydVw0zCqoMZvpI", "OO97DmQ5ZOzx6iCJ", "qMj4ro5B19VE838c"]}, {"anyOf": 93, "comparison": "isLessThanOrEqual", "name": "u60IifzMhkk5Pxsj", "predicateType": "SeasonPassPredicate", "value": "7VbBPUWipz9C05Ya", "values": ["aO3yJpA3KMxBlrRy", "bFX4FCK5ucTFsAFz", "tER1qdTelFAadM9y"]}]}]}}' \
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
    --body '{"description": "Z8GlU8962e6gtn5p", "eventTopic": "UARJM1T8QwMNOAzX", "maxAwarded": 25, "maxAwardedPerUser": 3, "namespaceExpression": "yHEV4g9P6a280S5R", "rewardCode": "NB5dVCsB7xL4axSP", "rewardConditions": [{"condition": "gPCiwLxCFLDixZwV", "conditionName": "tt3RVTl0tR00oQgc", "eventName": "HdGGK3x76U1EIckl", "rewardItems": [{"duration": 39, "endDate": "1993-06-07T00:00:00Z", "identityType": "ITEM_ID", "itemId": "mrpgF5szl0sMY8es", "quantity": 36, "sku": "r1FgR70eNLHkVrEF"}, {"duration": 7, "endDate": "1975-07-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "L97ycJV5YqE2myQz", "quantity": 22, "sku": "Nw9K9pmAIc6VSfE9"}, {"duration": 28, "endDate": "1999-01-04T00:00:00Z", "identityType": "ITEM_ID", "itemId": "E2PMv12ZSRJkujxb", "quantity": 59, "sku": "7IYzaZUTmvsEzLPn"}]}, {"condition": "nGsnfmBerp84qjwz", "conditionName": "WpCF1vyamjsEzwtL", "eventName": "PxK1os4qR8LaQzEb", "rewardItems": [{"duration": 100, "endDate": "1980-08-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "TdFfC8x5aHLsXHlm", "quantity": 0, "sku": "RJTTy9JrNz1K5M1q"}, {"duration": 12, "endDate": "1988-09-14T00:00:00Z", "identityType": "ITEM_ID", "itemId": "h8I9xk3sFl0cbuCR", "quantity": 79, "sku": "EHLbEQKc0aUvrKXD"}, {"duration": 71, "endDate": "1974-03-17T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "BhYe2fJDS6T75Q4u", "quantity": 22, "sku": "lxUyrs3OSesE5p0D"}]}, {"condition": "wUj2HKUvPYUcQBxM", "conditionName": "SdOOsn2Nd8Jpa19G", "eventName": "JDK46Eehx7xasqMY", "rewardItems": [{"duration": 62, "endDate": "1971-02-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "N2tmGuX6r0gBVUUe", "quantity": 75, "sku": "kufBpWVxIK9D2bTc"}, {"duration": 14, "endDate": "1971-01-05T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "KoccaSwWcZmzCWGI", "quantity": 39, "sku": "cIQcPWAShIhieSKU"}, {"duration": 11, "endDate": "1995-06-18T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "qn6eXr6FNbKJ05Or", "quantity": 51, "sku": "28NZZgsXycuQNGID"}]}], "userIdExpression": "eHlf6IcX1K9JrK6O"}' \
    > test.out 2>&1
eval_tap $? 169 'CreateReward' test.out

#- 170 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'r2xx7rLwrPoWiywn' \
    --limit '48' \
    --offset '29' \
    --sortBy 'rewardCode,namespace:asc,namespace:desc' \
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
    --rewardId 'LLuIaSxoloIH1gBC' \
    > test.out 2>&1
eval_tap $? 173 'GetReward' test.out

#- 174 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'WVFrvls0ZwosKhDl' \
    --body '{"description": "LfTKxpVOXvGSrdkq", "eventTopic": "ddI3ezqu6FB0sL2x", "maxAwarded": 40, "maxAwardedPerUser": 6, "namespaceExpression": "6fX9j7rhZCAlDlVK", "rewardCode": "BsLZiBRXszE7CL1c", "rewardConditions": [{"condition": "QCSoqHvH7g63cOx6", "conditionName": "yrIw37pKOLrF5i3g", "eventName": "r3Cc4M2O7NrTQO7K", "rewardItems": [{"duration": 78, "endDate": "1985-01-29T00:00:00Z", "identityType": "ITEM_ID", "itemId": "ZDGwqx7T3l1ut2oy", "quantity": 30, "sku": "FBS93Mg6TKwdRMra"}, {"duration": 59, "endDate": "1977-11-08T00:00:00Z", "identityType": "ITEM_ID", "itemId": "rwh3d0ykRGkgqUNI", "quantity": 3, "sku": "4xmIOjFLgKR4LjEW"}, {"duration": 14, "endDate": "1979-12-03T00:00:00Z", "identityType": "ITEM_ID", "itemId": "ScvtQ92iD02YMvEU", "quantity": 80, "sku": "jpSAlZwFGpea5ObB"}]}, {"condition": "B49Km4ClIQmkIdLC", "conditionName": "vNhZ6P8aqZ2yfrC1", "eventName": "V7ZpJZPHCMqvcYme", "rewardItems": [{"duration": 60, "endDate": "1998-10-31T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "iTP4PSrXUS6jYI9l", "quantity": 37, "sku": "cqclNlBORlC8Zkjs"}, {"duration": 49, "endDate": "1972-06-12T00:00:00Z", "identityType": "ITEM_ID", "itemId": "gxplHTPLzynjFZgF", "quantity": 58, "sku": "erw7UsyHq4bBb0n1"}, {"duration": 72, "endDate": "1974-03-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "US8BRPGV9n769zLJ", "quantity": 7, "sku": "QnKzDgDAtqE3kuyb"}]}, {"condition": "wTQFYEJjIYwqfSRy", "conditionName": "8GgVk77fd1GS5Yky", "eventName": "hAiAItnWUmD225fp", "rewardItems": [{"duration": 10, "endDate": "1978-02-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "sx3ErheNwqd5pric", "quantity": 22, "sku": "DwZ1HKsOpyq8agQu"}, {"duration": 51, "endDate": "1984-01-31T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "nc6jLF9DIW2ncJJK", "quantity": 32, "sku": "gFhS0URBhl0L5FCb"}, {"duration": 83, "endDate": "1983-04-20T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "46W2B2uPQLrt2t6b", "quantity": 98, "sku": "1A1xW6okIqmd87ir"}]}], "userIdExpression": "9op4YfGTno5oHzqY"}' \
    > test.out 2>&1
eval_tap $? 174 'UpdateReward' test.out

#- 175 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '3DgykA8zBJX0rkOH' \
    > test.out 2>&1
eval_tap $? 175 'DeleteReward' test.out

#- 176 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'UkY5aSlqhYoSXbn6' \
    --body '{"payload": {"l5xAzc1nc3eFm950": {}, "dtVAo7w4e3v5mh6R": {}, "um5pbgEt39uJQpgE": {}}}' \
    > test.out 2>&1
eval_tap $? 176 'CheckEventCondition' test.out

#- 177 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'tchTe3nt7t9ztprS' \
    --body '{"conditionName": "fW9OutADrNGBWSJ1", "userId": "zQKxVmRTawjiZPMo"}' \
    > test.out 2>&1
eval_tap $? 177 'DeleteRewardConditionRecord' test.out

#- 178 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'ZZcyGEHxAKDQher3' \
    --limit '43' \
    --offset '38' \
    --start 'JyveSRiBq23kyH9j' \
    --storeId 'QbHWkcVk0X28GS54' \
    --viewId 'vl7gIKBc7OYTylFR' \
    > test.out 2>&1
eval_tap $? 178 'QuerySections' test.out

#- 179 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AJKySnC0cfPl3Z2z' \
    --body '{"active": false, "displayOrder": 57, "endDate": "1991-01-13T00:00:00Z", "ext": {"26BY5YI0jeO2zMDS": {}, "y4kyqyKgrtEPdXXl": {}, "t8geCdiXu3iNvn7v": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 88, "itemCount": 35, "rule": "SEQUENCE"}, "items": [{"id": "Z8GaQ4OZ2nDodm4T", "sku": "Ns8mAj6IKSYFdJwg"}, {"id": "ZsRPOzwuDSdGl1A2", "sku": "vaNeDiSqTfmAVg50"}, {"id": "kOdJagEmTuaxlxgy", "sku": "wkbdOsyxX1tfW488"}], "localizations": {"oYUT4jyCVJ0V8obT": {"description": "lGVThz4bm41oIcV3", "localExt": {"3yjPxibDjfF7JkjC": {}, "VpZKMxkFkBtXMU6K": {}, "RIm5xBoIi99ctgFX": {}}, "longDescription": "asxp5h780ktjQw2y", "title": "XzaQWaF2PqUfbpMp"}, "Rl6xRyV19cborUHe": {"description": "CpqnZ5NW623WWn2Z", "localExt": {"JY3QvRa7CDRTcsAH": {}, "zD3dZyyWbUQpbcv3": {}, "IwmL7a1K3zIUYJmd": {}}, "longDescription": "F1YtWNSQlcMzxfpp", "title": "NCrscDPbklTHcmgX"}, "srVj3Mjml6BpCODW": {"description": "GOLMmCZUeelXYyNr", "localExt": {"XweiCnDldRPRfd6m": {}, "LZ0GTJwEjoZrRtae": {}, "WKMC8wsOByQAMAgq": {}}, "longDescription": "FEzEt8umj5XhKnw7", "title": "MHDwFVKUC2ecnpUD"}}, "name": "qvLQixPKVSmWa8TG", "rotationType": "CUSTOM", "startDate": "1972-05-04T00:00:00Z", "viewId": "FmOHW0j9suukPE4J"}' \
    > test.out 2>&1
eval_tap $? 179 'CreateSection' test.out

#- 180 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wQONQ2vCbMn0Oia3' \
    > test.out 2>&1
eval_tap $? 180 'PurgeExpiredSection' test.out

#- 181 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '36uiiMTAductvUfV' \
    --storeId 'wLahtRedh1SiZlOp' \
    > test.out 2>&1
eval_tap $? 181 'GetSection' test.out

#- 182 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'IQ8GL7jBF1R5OexA' \
    --storeId 'PzCG6ZKQClGc1636' \
    --body '{"active": false, "displayOrder": 84, "endDate": "1971-02-12T00:00:00Z", "ext": {"pVtN4jNVIdruEA39": {}, "uCJzsE8WObt6t0w8": {}, "LOBxE15JYj4IqWK0": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 41, "itemCount": 46, "rule": "SEQUENCE"}, "items": [{"id": "iTTiz7yrIvQj2isN", "sku": "7bRwcr16lW5YwgZp"}, {"id": "jlMMtPWg8217m7qN", "sku": "kQiKp2oac8QTNEuB"}, {"id": "beuQqm9wM7mgTtUd", "sku": "PVcQijMBhs0kDP6d"}], "localizations": {"3nuUZ41mSeS9SnGq": {"description": "hJOvykBcDpzD9zh6", "localExt": {"dtPK4fVHLMvrCsH3": {}, "RYxH2Up9VthPjFrK": {}, "7Hip0eONFDgUPShG": {}}, "longDescription": "8wwFKY9AMpcwJd4S", "title": "rigIxAhbFMZfxazn"}, "lDQbzTiFrQB1yUon": {"description": "irH4URx3NkKQBYrl", "localExt": {"UaMiFEWUT8cAFO5z": {}, "Ew8GENEJYPKxxOw7": {}, "xNQ98IEbc9YITN98": {}}, "longDescription": "j4P2AGeidXRRnIAJ", "title": "fKVjOn6rtILNJVv2"}, "DLLUyBt5hDs45siG": {"description": "30Lv9iGa5mkZjnRX", "localExt": {"Vcg6AByNpBo2JYkw": {}, "LdmR97u9MVUii4Kp": {}, "Ycb1AUsESaBOTHnb": {}}, "longDescription": "X9tC9PQlFAGbMtEy", "title": "bfcAl0mnsAkRT2k0"}}, "name": "AzdgIunRkTxsGdrp", "rotationType": "NONE", "startDate": "1984-09-04T00:00:00Z", "viewId": "JQpb6r8ZeaSHwQui"}' \
    > test.out 2>&1
eval_tap $? 182 'UpdateSection' test.out

#- 183 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'H3Ozu4G6bXxp0gYZ' \
    --storeId 'yF9fJBJkSOrF9Dg4' \
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
    --body '{"defaultLanguage": "FcDwBGyBiHewZkwE", "defaultRegion": "euzBBRSknxyWkZOb", "description": "uvig8sMuss76ezTr", "supportedLanguages": ["sDZNYUV48Oh6I45X", "7HvUtPYONZdFk75l", "kjQNHrjaboGomguU"], "supportedRegions": ["qeuZh5qtrRbNnGej", "dTGvZgN5hshSe5Ym", "ZXKEQLkM6o3eGSP4"], "title": "Htmr90TqGf0OyqJ9"}' \
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
    --storeId 'ibJMmRgoxNwp1lGk' \
    > test.out 2>&1
eval_tap $? 191 'GetStore' test.out

#- 192 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Yoq8HP1TM0tefVQP' \
    --body '{"defaultLanguage": "WX1NPO5Wn7rNG8rG", "defaultRegion": "p7Fadvo5EzpX0Itt", "description": "sRezyY9GB5sf94AL", "supportedLanguages": ["BmvdncQkcZb8cWdV", "H9bww15zZsaYrJAe", "5Kd5QB96ndlO6iPG"], "supportedRegions": ["C9RhzMC7V8BEphnR", "XnSpCzyb8FkoxQbr", "Pngi87K58pQswqKL"], "title": "utINusOsa92F6iwk"}' \
    > test.out 2>&1
eval_tap $? 192 'UpdateStore' test.out

#- 193 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JIYOLarmpWyvib9C' \
    > test.out 2>&1
eval_tap $? 193 'DeleteStore' test.out

#- 194 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DW21ANrlpuXD9H1u' \
    --action 'DELETE' \
    --itemSku 'm5rP2A20t6foPPH9' \
    --itemType 'MEDIA' \
    --limit '95' \
    --offset '17' \
    --selected  \
    --sortBy 'updatedAt:desc,updatedAt,createdAt:asc' \
    --status 'PUBLISHED' \
    --type 'CATEGORY' \
    --updatedAtEnd 'v8LHYivmD0ekycMK' \
    --updatedAtStart 'lwJTNL2UCWUtaAD7' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 194 'QueryChanges' test.out

#- 195 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZZx1iefATWcDSqGY' \
    > test.out 2>&1
eval_tap $? 195 'PublishAll' test.out

#- 196 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RMdz07xEJ40epssg' \
    > test.out 2>&1
eval_tap $? 196 'PublishSelected' test.out

#- 197 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JJC3CX0hpB1ZGMMo' \
    > test.out 2>&1
eval_tap $? 197 'SelectAllRecords' test.out

#- 198 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId '5DSozCuFsrBMtoOe' \
    --action 'UPDATE' \
    --itemSku 'vszzQLZBktk0siMu' \
    --itemType 'EXTENSION' \
    --selected  \
    --type 'SECTION' \
    --updatedAtEnd '01kyaFwwD7wecuQb' \
    --updatedAtStart '4GNQHVZMKGBnzh4s' \
    > test.out 2>&1
eval_tap $? 198 'SelectAllRecordsByCriteria' test.out

#- 199 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uaGIzttTncVBf5g3' \
    --action 'CREATE' \
    --itemSku '9GWKpItMt4GszRuf' \
    --itemType 'CODE' \
    --type 'SECTION' \
    --updatedAtEnd 'DFLYyNBPlMrkse9S' \
    --updatedAtStart 'GcMuV5phhU315LUC' \
    > test.out 2>&1
eval_tap $? 199 'GetStatistic' test.out

#- 200 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '6HSMQ32UznXNd6ve' \
    > test.out 2>&1
eval_tap $? 200 'UnselectAllRecords' test.out

#- 201 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId '29lqqtcLJW9eTJvK' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NDFrx6LabyDnqXjX' \
    > test.out 2>&1
eval_tap $? 201 'SelectRecord' test.out

#- 202 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'KPIcxh0x7T6RQGnn' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'W4ugGX6mKBbgTD9x' \
    > test.out 2>&1
eval_tap $? 202 'UnselectRecord' test.out

#- 203 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'L07ZzzIs3Jke34ZA' \
    --targetStoreId 'UuLP897ooMLnemwK' \
    > test.out 2>&1
eval_tap $? 203 'CloneStore' test.out

#- 204 ExportStore
eval_tap 0 204 'ExportStore # SKIP deprecated' test.out

#- 205 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId '0l7sg7IfMH5Tu1ky' \
    --limit '37' \
    --offset '76' \
    --sku 'YvyeHmfoFkUDP864' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'hbnQ3bVvuvpsDJXP' \
    > test.out 2>&1
eval_tap $? 205 'QuerySubscriptions' test.out

#- 206 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'CWkX4Kpi8CJ88aMP' \
    > test.out 2>&1
eval_tap $? 206 'RecurringChargeSubscription' test.out

#- 207 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'GFFAQZbfbmVTEbiR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 207 'GetTicketDynamic' test.out

#- 208 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'q5Juikmpat75rVbN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "9ZBtzJ33tCwv8H1f"}' \
    > test.out 2>&1
eval_tap $? 208 'DecreaseTicketSale' test.out

#- 209 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName '451FVZ630HNBYZSr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 209 'GetTicketBoothID' test.out

#- 210 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'z7pMjESLLMPKDXLk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 18, "orderNo": "J6JLb5f3SBMyJUdw"}' \
    > test.out 2>&1
eval_tap $? 210 'IncreaseTicketSale' test.out

#- 211 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Steam", "count": 38, "currencyCode": "BRrHAWUFqTooGGnP", "expireAt": "1986-02-14T00:00:00Z"}, "debitPayload": {"count": 14, "currencyCode": "ZENs9X0hFMdzryvh", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 76, "entitlementOrigin": "Playstation", "itemIdentity": "YjHmmulSBIElc2Cd", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 45, "entitlementId": "z3fWthJSu2pUIIuP"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "System", "count": 3, "currencyCode": "AtcWhjAP57QbWvSS", "expireAt": "1978-11-19T00:00:00Z"}, "debitPayload": {"count": 69, "currencyCode": "zEPPfmAQiqRRC2ca", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 46, "entitlementOrigin": "Other", "itemIdentity": "ZGikW7TFA9gE6SrY", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 90, "entitlementId": "6lcVOhPJIcEHbiKH"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 57, "currencyCode": "VolAWEMmQSPDTRqj", "expireAt": "1977-06-27T00:00:00Z"}, "debitPayload": {"count": 67, "currencyCode": "wnnCA5tfK5ushaKT", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 98, "entitlementOrigin": "IOS", "itemIdentity": "lpHXrbVBh60NUA2a", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 46, "entitlementId": "qtrjCOsE8VjvzhJw"}, "type": "CREDIT_WALLET"}], "userId": "X4bhqCjlwrmsSRV8"}, {"operations": [{"creditPayload": {"balanceOrigin": "IOS", "count": 14, "currencyCode": "ic1FIMyF7CcNu2DY", "expireAt": "1978-11-24T00:00:00Z"}, "debitPayload": {"count": 63, "currencyCode": "UNGKxdlAUDFQuGPz", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 79, "entitlementOrigin": "Other", "itemIdentity": "CGUJvERxNg8djSb4", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 0, "entitlementId": "2vKQ5vlCdI519Pf2"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 30, "currencyCode": "rzahPB0FKMa0YeyN", "expireAt": "1985-12-13T00:00:00Z"}, "debitPayload": {"count": 100, "currencyCode": "750xdYQg34WUV0Wp", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 77, "entitlementOrigin": "Oculus", "itemIdentity": "r5BlO8K6LH4dSaa8", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 68, "entitlementId": "vhSkxERZ2AQ1jvXY"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 1, "currencyCode": "1kJ1kpHcQtnIc9z7", "expireAt": "1998-11-02T00:00:00Z"}, "debitPayload": {"count": 11, "currencyCode": "FQMI0oZuEjY0rNBb", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 55, "entitlementOrigin": "Epic", "itemIdentity": "9txAvtRQvqJacXR2", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 46, "entitlementId": "4noXDFaEUkPUBnB0"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "U9jLzNV3GaG43R6n"}, {"operations": [{"creditPayload": {"balanceOrigin": "Nintendo", "count": 14, "currencyCode": "RPrEAYqRBeSc5uSh", "expireAt": "1978-03-17T00:00:00Z"}, "debitPayload": {"count": 28, "currencyCode": "dGHMeoi5DBOsQ0Ga", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 12, "entitlementOrigin": "IOS", "itemIdentity": "iX05IT9Agsjl5Nmn", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 87, "entitlementId": "xNmCe4txY0MsPc9E"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 35, "currencyCode": "f9JCJiEvhL8ZfwCV", "expireAt": "1989-10-18T00:00:00Z"}, "debitPayload": {"count": 91, "currencyCode": "yspUOyHC9eKeXzrv", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 52, "entitlementOrigin": "Steam", "itemIdentity": "x9aGEI22BTCZs97T", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 66, "entitlementId": "pEw4Zeid4mRoFNxv"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Epic", "count": 13, "currencyCode": "kMQVjKk3bWJ0ZuYS", "expireAt": "1973-01-12T00:00:00Z"}, "debitPayload": {"count": 27, "currencyCode": "sI0x2hc8vaN1Off5", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 74, "entitlementOrigin": "Xbox", "itemIdentity": "ZZMW3huAIzBPWBYK", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 53, "entitlementId": "EFTdlKNh6GTzKjsC"}, "type": "FULFILL_ITEM"}], "userId": "OlfLB1J19b5rTfiL"}], "metadata": {"2P3r1a8KIJH33aKk": {}, "PuWD59MgTy1HA58J": {}, "t5NaROjSKFEuZo2E": {}}, "needPreCheck": false, "transactionId": "eBKtpvyRNgjZkdDp", "type": "pvEJiUiDGXgh8BKc"}' \
    > test.out 2>&1
eval_tap $? 211 'Commit' test.out

#- 212 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '79' \
    --status 'INIT' \
    --type 'xzRR6xd9rTh3urea' \
    --userId 'IbxM3Wev9pZQjWAN' \
    > test.out 2>&1
eval_tap $? 212 'GetTradeHistoryByCriteria' test.out

#- 213 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId '0tny16ZHZtuSJGQC' \
    > test.out 2>&1
eval_tap $? 213 'GetTradeHistoryByTransactionId' test.out

#- 214 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'rM7JEMRPkdTcAzkI' \
    --body '{"achievements": [{"id": "lndN5xeayr3vUKMu", "value": 72}, {"id": "fOLYu9O46OOzz9p5", "value": 33}, {"id": "QIhoJRY807VmBT4w", "value": 18}], "steamUserId": "XQZZrSsuYiIPei0p"}' \
    > test.out 2>&1
eval_tap $? 214 'UnlockSteamUserAchievement' test.out

#- 215 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'XglJYnKkoCAZuolA' \
    --xboxUserId 'WnxkImVbDP0QX31g' \
    > test.out 2>&1
eval_tap $? 215 'GetXblUserAchievements' test.out

#- 216 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'I7VmnGIRMvXe6Bip' \
    --body '{"achievements": [{"id": "hIFe2bzr6qQw6fSE", "percentComplete": 91}, {"id": "lTO9SDKnMlnKW9ji", "percentComplete": 80}, {"id": "lmIt2nfhUaZGqjsl", "percentComplete": 42}], "serviceConfigId": "E34yIAZQeigiA3wB", "titleId": "rmBYIlZeheP72AB8", "xboxUserId": "EO3YrlyrWowUpUDV"}' \
    > test.out 2>&1
eval_tap $? 216 'UpdateXblUserAchievement' test.out

#- 217 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'LlTtuJJsHZVsG6iz' \
    > test.out 2>&1
eval_tap $? 217 'AnonymizeCampaign' test.out

#- 218 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'JZruOJvSRFLDSdj8' \
    > test.out 2>&1
eval_tap $? 218 'AnonymizeEntitlement' test.out

#- 219 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'elbtHvDU91DmHzwi' \
    > test.out 2>&1
eval_tap $? 219 'AnonymizeFulfillment' test.out

#- 220 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'qVPCJ5j18Ou3aY8n' \
    > test.out 2>&1
eval_tap $? 220 'AnonymizeIntegration' test.out

#- 221 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ceFU5GKmcEKp8AQw' \
    > test.out 2>&1
eval_tap $? 221 'AnonymizeOrder' test.out

#- 222 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'qgJs6O0Qj0ccMkdz' \
    > test.out 2>&1
eval_tap $? 222 'AnonymizePayment' test.out

#- 223 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '6zPz3BVHAqp4O9XS' \
    > test.out 2>&1
eval_tap $? 223 'AnonymizeRevocation' test.out

#- 224 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'jap24esyjh6Wc3mi' \
    > test.out 2>&1
eval_tap $? 224 'AnonymizeSubscription' test.out

#- 225 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'gf2n6iQyr5cb5YL6' \
    > test.out 2>&1
eval_tap $? 225 'AnonymizeWallet' test.out

#- 226 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'fwBiaVPmmn0T5uzl' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 226 'GetUserDLCByPlatform' test.out

#- 227 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'AluHv7Hssd05pHBJ' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 227 'GetUserDLC' test.out

#- 228 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '5ln8PZbYVD8RiaTs' \
    --activeOnly  \
    --appType 'DEMO' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'D4d3kSbTkHPMUvOA' \
    --features 'UXkw36cr2WJQqS7T,q4YIyZAFQ6lZfa2j,dNvpWf32JS1av9VN' \
    --fuzzyMatchName  \
    --itemId 'pVLT0LvqcfSdO1nA,jY5FvADb3GUQgci6,32w6LUrHuKBoNTpP' \
    --limit '86' \
    --offset '70' \
    --origin 'Steam' \
    > test.out 2>&1
eval_tap $? 228 'QueryUserEntitlements' test.out

#- 229 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 's1dYrJKmx1BT6iLF' \
    --body '[{"endDate": "1992-02-04T00:00:00Z", "grantedCode": "QdPuWeMEeL0EJG67", "itemId": "g4W1eAmDxP23qstM", "itemNamespace": "uikKc6VNU8570siW", "language": "bw-mICR_464", "origin": "Twitch", "quantity": 8, "region": "hP2jWnRTglw0gdWo", "source": "REFERRAL_BONUS", "startDate": "1984-10-03T00:00:00Z", "storeId": "esuiDrquccz4J6fF"}, {"endDate": "1992-02-01T00:00:00Z", "grantedCode": "bwKDtVmrYQu7hZvH", "itemId": "fiT9s9pK8HuUY1QQ", "itemNamespace": "HQ0NCEddJtx6GV01", "language": "peW-IQ", "origin": "Nintendo", "quantity": 44, "region": "IldsgB4hOxb88WgK", "source": "REDEEM_CODE", "startDate": "1990-11-05T00:00:00Z", "storeId": "IpneDQCfwucHRL3o"}, {"endDate": "1998-11-17T00:00:00Z", "grantedCode": "I8Dzyh1N0JEKNoMt", "itemId": "HvjM7X1fjzknv2HZ", "itemNamespace": "MIL2P2bh14LroFTn", "language": "VVF_tqso_xb", "origin": "Other", "quantity": 0, "region": "7arNs12hOoLVM7UF", "source": "OTHER", "startDate": "1997-06-11T00:00:00Z", "storeId": "Re2hgU56xtyJtnbT"}]' \
    > test.out 2>&1
eval_tap $? 229 'GrantUserEntitlement' test.out

#- 230 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'DXu7FbleSP5PcdOu' \
    --activeOnly  \
    --appId 'q0m0rvakR8rcwojL' \
    > test.out 2>&1
eval_tap $? 230 'GetUserAppEntitlementByAppId' test.out

#- 231 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'RjhcaJ56nGlYZ2to' \
    --activeOnly  \
    --limit '7' \
    --offset '58' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 231 'QueryUserEntitlementsByAppType' test.out

#- 232 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'yYUVUJYnQ3jOGmRO' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --platform 'QZy3gdDms3kb1htW' \
    --itemId '0UGJpwQZlXuzu3m9' \
    > test.out 2>&1
eval_tap $? 232 'GetUserEntitlementByItemId' test.out

#- 233 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'u67JjCDwg186hGWK' \
    --ids 'fO9MnoT3t99Hmcxz,jDhTrcBKtU956hOg,8oukDVdweG0sFHxT' \
    --platform 'Ha2k60SzCqUgq1gL' \
    > test.out 2>&1
eval_tap $? 233 'GetUserActiveEntitlementsByItemIds' test.out

#- 234 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'bcIMevTmC631p7q7' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --platform '4bu49lINFTtERAXT' \
    --sku '2h3hcQ2wV3ZbBTnN' \
    > test.out 2>&1
eval_tap $? 234 'GetUserEntitlementBySku' test.out

#- 235 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'QnVUhA5WnzVZdj8t' \
    --appIds 'syzC4QaLXp3o4TDr,aEEaDNJbVd20FVHe,vCjthJUb7jKuMrFa' \
    --itemIds 'oLulzp3sZxImVK5y,h2LcM8LaMW0ByjsR,UrAHNRkIcC4wNFzs' \
    --platform 'brtYvLh56AWXoMio' \
    --skus 'wdWSs9DQ0VU1HED9,CGo9aUXj3rh0Uyqx,VWlIMY5tTJw4KV10' \
    > test.out 2>&1
eval_tap $? 235 'ExistsAnyUserActiveEntitlement' test.out

#- 236 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '4MtMhKHmSjqPuQZX' \
    --platform '5KjdNrEwfWo2Mwul' \
    --itemIds 'Lg4bsO4YHEYLjTSN,Df3zazm6p5Y1tkG9,WwU4Ty6Ch5QYyFju' \
    > test.out 2>&1
eval_tap $? 236 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 237 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'BquE7xssm4hxczsk' \
    --appId 'bSUbOZ9WNl3apJmN' \
    > test.out 2>&1
eval_tap $? 237 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 238 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Abl1g5ZmTTGYRbP4' \
    --entitlementClazz 'OPTIONBOX' \
    --platform '8AgyZJ16MMd2bzOr' \
    --itemId 'Tn2huwPgyUzBUWiK' \
    > test.out 2>&1
eval_tap $? 238 'GetUserEntitlementOwnershipByItemId' test.out

#- 239 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'oNGtvyk5xEfrJDxK' \
    --ids 'sw5Xl7ZZrDZdbuvC,FBaVcohewKkVuGv9,fQXkErF0drbYrrFQ' \
    --platform 'P6rW62CtetBW3pvA' \
    > test.out 2>&1
eval_tap $? 239 'GetUserEntitlementOwnershipByItemIds' test.out

#- 240 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'JJieHhveGg97PY0t' \
    --entitlementClazz 'LOOTBOX' \
    --platform 'tBjP4HSuiYCbG0Uy' \
    --sku 'YUJmNL8p6AbdtU0C' \
    > test.out 2>&1
eval_tap $? 240 'GetUserEntitlementOwnershipBySku' test.out

#- 241 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'DrlQpKB8qoel2QK3' \
    > test.out 2>&1
eval_tap $? 241 'RevokeAllEntitlements' test.out

#- 242 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'aSOYdmMDikc3Fjm9' \
    --entitlementIds 'HoQDemtiQvURYZCe' \
    > test.out 2>&1
eval_tap $? 242 'RevokeUserEntitlements' test.out

#- 243 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'F30RT9rBgM8o7lxX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'q7TkdM7FVDCBcvVe' \
    > test.out 2>&1
eval_tap $? 243 'GetUserEntitlement' test.out

#- 244 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'grZddP8lLQo6tHj4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'z4cAM4LMJfWNZIxA' \
    --body '{"endDate": "1974-05-22T00:00:00Z", "nullFieldList": ["BpeubprKX68jTyRd", "3LrR1x6U1v6zSLjm", "9zmzUW0vPj90jmLT"], "origin": "Other", "reason": "i2CPVGxjcdpdCqVe", "startDate": "1973-02-11T00:00:00Z", "status": "SOLD", "useCount": 55}' \
    > test.out 2>&1
eval_tap $? 244 'UpdateUserEntitlement' test.out

#- 245 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'Sqb8y8qJTUQY40Zr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pn0vAD9YsPeDWrAV' \
    --body '{"options": ["QZSvgWuCuLsUGrVQ", "AbhS54ZuQHKersDm", "JLUHAKtfXCKOna8D"], "platform": "djtZhh6ofsUoRh6r", "requestId": "0e0J6vyqPw7YlmV3", "useCount": 21}' \
    > test.out 2>&1
eval_tap $? 245 'ConsumeUserEntitlement' test.out

#- 246 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'D4K2Cy1tJcPAEkCe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V29QsQk100eu5Ucx' \
    > test.out 2>&1
eval_tap $? 246 'DisableUserEntitlement' test.out

#- 247 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'uXXpt0YSPX04uEId' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AwgDobopbdJeVCiK' \
    > test.out 2>&1
eval_tap $? 247 'EnableUserEntitlement' test.out

#- 248 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 's2vLyH9kcSBdk7Mw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qzn28Le5neohqhCz' \
    > test.out 2>&1
eval_tap $? 248 'GetUserEntitlementHistories' test.out

#- 249 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'roAzWQDve0Z2G2N0' \
    --namespace "$AB_NAMESPACE" \
    --userId '9VIbbsz24fQKDZX6' \
    > test.out 2>&1
eval_tap $? 249 'RevokeUserEntitlement' test.out

#- 250 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'plErw0Gb0ceCbphW' \
    --namespace "$AB_NAMESPACE" \
    --userId '4YMhJ0S50bez9ZLH' \
    --body '{"reason": "W882riiPfRQ3rJ0f", "useCount": 24}' \
    > test.out 2>&1
eval_tap $? 250 'RevokeUserEntitlementByUseCount' test.out

#- 251 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'BvkehRn83B0nrW1q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'x3NJTugVWXz8dv7B' \
    --quantity '17' \
    > test.out 2>&1
eval_tap $? 251 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 252 RevokeUseCount
eval_tap 0 252 'RevokeUseCount # SKIP deprecated' test.out

#- 253 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'ordrJkD6vy60uRMT' \
    --namespace "$AB_NAMESPACE" \
    --userId '1Xw9K9Yb68a8ygYx' \
    --body '{"platform": "2TqkhlqMnE9Wj90E", "requestId": "QzOidrWnLrXqImgD", "useCount": 12}' \
    > test.out 2>&1
eval_tap $? 253 'SellUserEntitlement' test.out

#- 254 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ni1YfIgLZ4YIzElr' \
    --body '{"duration": 78, "endDate": "1976-11-28T00:00:00Z", "entitlementOrigin": "Steam", "itemId": "e1825iasunESjcgr", "itemSku": "2drXG5NkKCySLA8c", "language": "KCs0dFYRSa2OULZ0", "metadata": {"iOZJiOAh1SpLhMF2": {}, "Pav11FuU8iXCRz8K": {}, "gqgwijYxpGhsFArq": {}}, "order": {"currency": {"currencyCode": "6lolbj7QKvtVRCPM", "currencySymbol": "jr5M3vw1GqUjjFp6", "currencyType": "VIRTUAL", "decimals": 4, "namespace": "mYZwKftVqSECsypS"}, "ext": {"42NmYQ8HlHbHnfs4": {}, "tLVOYQCWMktmiKd9": {}, "vLPP0w52JRAZxMWd": {}}, "free": false}, "orderNo": "qWrpkWnnova15WVu", "origin": "Steam", "overrideBundleItemQty": {"e851PbK2MFKvw5TW": 20, "q3I1BLtGEZDRNkk4": 60, "PeNr4JmYxH2qs28h": 9}, "quantity": 98, "region": "PJjMp0TKKUBfPNI9", "source": "EXPIRATION", "startDate": "1996-03-05T00:00:00Z", "storeId": "oLWDPSZexfKVxqdx"}' \
    > test.out 2>&1
eval_tap $? 254 'FulfillItem' test.out

#- 255 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'mh5QWxuQuI7gdDTD' \
    --body '{"code": "b3WdnOpzTrRzCCaf", "language": "ieD-vk", "region": "3MLwJZquMQSPp5XD"}' \
    > test.out 2>&1
eval_tap $? 255 'RedeemCode' test.out

#- 256 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '4S1ilfgff7Et4uY8' \
    --body '{"itemId": "nlBwGNHgfgwZwVMv", "itemSku": "shGmsg6ZJYnkHDnH", "quantity": 94}' \
    > test.out 2>&1
eval_tap $? 256 'PreCheckFulfillItem' test.out

#- 257 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'AjgHFQk0VzWRNFNi' \
    --body '{"entitlementOrigin": "Epic", "metadata": {"n2yXMSCcHADYpS86": {}, "1c0CJ7LzpFvOSF6x": {}, "KA6yrnvXY5dDwnea": {}}, "origin": "Epic", "rewards": [{"currency": {"currencyCode": "0O6VsXtOlQwj5xPv", "namespace": "m7c5nPR0Y1sffUaZ"}, "item": {"itemId": "64dFpiv8o9Gw4QtK", "itemSku": "gyIeySoUxoMrj2J4", "itemType": "JGQZAtyjTxnlmSyj"}, "quantity": 62, "type": "CURRENCY"}, {"currency": {"currencyCode": "qE5p601ak59yFSfd", "namespace": "ZIv8oYWPUS4Zu0Sb"}, "item": {"itemId": "Tt6M2XizikCh6q0y", "itemSku": "q2WAHtL7IWE3MFqv", "itemType": "fDG5jvMOaXrDlEX4"}, "quantity": 96, "type": "ITEM"}, {"currency": {"currencyCode": "0syrGNhBmgT2q0kI", "namespace": "brJ2S5Pf1Lvg8kYE"}, "item": {"itemId": "VylINJpxFY8E6pU8", "itemSku": "eHjh0aTjIOaQt0sn", "itemType": "bE0yMvqF7TJ9uB0z"}, "quantity": 49, "type": "CURRENCY"}], "source": "GIFT", "transactionId": "xiKR29LKIhNU43K8"}' \
    > test.out 2>&1
eval_tap $? 257 'FulfillRewards' test.out

#- 258 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'bihdw3prp0UHlWUx' \
    --endTime 'kBefhxRtrqbv56oq' \
    --limit '46' \
    --offset '28' \
    --productId 'dZEeXBd6mGG6SHcZ' \
    --startTime 'bX2wNnT6A9zosmDn' \
    --status 'FULFILLED' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 258 'QueryUserIAPOrders' test.out

#- 259 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'UIMwa2wYq6DsUq38' \
    > test.out 2>&1
eval_tap $? 259 'QueryAllUserIAPOrders' test.out

#- 260 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'bYvaWLoKzHnngdfF' \
    --endTime 'nOfY9stXH6LYXXMn' \
    --limit '6' \
    --offset '49' \
    --startTime 'MXHbEwAvvpEeHhXi' \
    --status 'SUCCESS' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 260 'QueryUserIAPConsumeHistory' test.out

#- 261 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'xAPZ86WNnQOhusPn' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "UaTA_178", "productId": "U0Eo6QJ9vBRJ4UP0", "region": "9fabC01Thm9f4AWp", "transactionId": "yiKVT3OvEujx5yjt", "type": "XBOX"}' \
    > test.out 2>&1
eval_tap $? 261 'MockFulfillIAPItem' test.out

#- 262 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'CJaOHzpb623EciYo' \
    --itemId 'YOPVg6DLEZ6DxpwB' \
    --limit '25' \
    --offset '37' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 262 'QueryUserOrders' test.out

#- 263 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'gZxSYnVwXqF6K0WA' \
    --body '{"currencyCode": "76Kl2mHHoz6qBQnE", "currencyNamespace": "DgX49n1xTDFcmOm1", "discountedPrice": 38, "ext": {"5bClxUOBmMwv5pmi": {}, "IVnhlLoMemsp7o3F": {}, "2LQw7Y2VdSxgXez7": {}}, "itemId": "VvS0C9JLVQQPa7PP", "language": "x4Zi6WaC8wk7HMbJ", "options": {"skipPriceValidation": false}, "platform": "Other", "price": 82, "quantity": 18, "region": "wZgf5nlMDORYuXnP", "returnUrl": "NJgayPFcyUnKXA3m", "sandbox": false, "sectionId": "dUSiTOrhB8hVs29W"}' \
    > test.out 2>&1
eval_tap $? 263 'AdminCreateUserOrder' test.out

#- 264 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'OKmZRTtgycLzXz6l' \
    --itemId 'UMKi5mweMEZo2ZnL' \
    > test.out 2>&1
eval_tap $? 264 'CountOfPurchasedItem' test.out

#- 265 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '1Zg2JfH4f73jAevO' \
    --userId 'nES6YJLlb2AfUEEB' \
    > test.out 2>&1
eval_tap $? 265 'GetUserOrder' test.out

#- 266 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bqMMKvkOsR1fHUyi' \
    --userId 'rMVMOFES2J2OzNlJ' \
    --body '{"status": "INIT", "statusReason": "nKlrOsJmEwjGYN8V"}' \
    > test.out 2>&1
eval_tap $? 266 'UpdateUserOrderStatus' test.out

#- 267 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'NPXNsmwTV8imJHNI' \
    --userId '0l6jJVzF1Oi2sQuW' \
    > test.out 2>&1
eval_tap $? 267 'FulfillUserOrder' test.out

#- 268 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UBBHZonSmzF831vl' \
    --userId 'CiZAZHCWMXxVh8HT' \
    > test.out 2>&1
eval_tap $? 268 'GetUserOrderGrant' test.out

#- 269 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rKqVwnpPn8N5xMRg' \
    --userId 'U7cPqNZrLCRRUysy' \
    > test.out 2>&1
eval_tap $? 269 'GetUserOrderHistories' test.out

#- 270 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'a4J3rvTzMTMSwrNo' \
    --userId 'v2GW9i54JY23AUWF' \
    --body '{"additionalData": {"cardSummary": "TLq0W1JqwKs1mO80"}, "authorisedTime": "1990-12-14T00:00:00Z", "chargebackReversedTime": "1998-10-03T00:00:00Z", "chargebackTime": "1978-11-27T00:00:00Z", "chargedTime": "1982-10-05T00:00:00Z", "createdTime": "1979-04-04T00:00:00Z", "currency": {"currencyCode": "nybvUIfuulmeegRw", "currencySymbol": "PPbn7lttd21cS6IV", "currencyType": "VIRTUAL", "decimals": 91, "namespace": "4fzwG3BHaRcZ8NK4"}, "customParameters": {"gkLmvEOaRcqTgF0x": {}, "tQAXoDoFkmA3fgzc": {}, "wdgJMjIyGfiNBQy4": {}}, "extOrderNo": "1M1gzGCbaxw33rNb", "extTxId": "E4bbDU4FMTbQaANJ", "extUserId": "OODGerDCWcl3VSJE", "issuedAt": "1991-10-04T00:00:00Z", "metadata": {"QopeHD6iKBGm5Cj7": "RqnJUmfDmofxvN8p", "RGoUtmbWZbEjPyq3": "5BWDoc3qNcQFFyHv", "141NPqjRUMKSQjFd": "jqTaZFsWzbqwTZQI"}, "namespace": "N5jC6a8mEVCXHmFn", "nonceStr": "rSL0PJcZQaCeNLYx", "paymentMethod": "MID9pqZ5rryiMMt6", "paymentMethodFee": 11, "paymentOrderNo": "UVInos5RK100yH89", "paymentProvider": "CHECKOUT", "paymentProviderFee": 40, "paymentStationUrl": "8ZDPXRL8cbTAntB1", "price": 91, "refundedTime": "1993-12-27T00:00:00Z", "salesTax": 4, "sandbox": false, "sku": "F1Qwzz606UGXPhoN", "status": "AUTHORISED", "statusReason": "lXMef7AvS3TfKx6B", "subscriptionId": "yTygbtOtcQS4Cmgw", "subtotalPrice": 97, "targetNamespace": "wRUnIVYxY6OhdkrY", "targetUserId": "iCinoVOzo4Plv1Il", "tax": 94, "totalPrice": 34, "totalTax": 32, "txEndTime": "1973-09-13T00:00:00Z", "type": "Gz7qbPnXEuOzzkoB", "userId": "mMR9C4qPqJrAdh1H", "vat": 70}' \
    > test.out 2>&1
eval_tap $? 270 'ProcessUserOrderNotification' test.out

#- 271 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '1mFkyxoUzfMFoXCO' \
    --userId 'guSq2A4R3wDdSkNf' \
    > test.out 2>&1
eval_tap $? 271 'DownloadUserOrderReceipt' test.out

#- 272 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'HJtA3QiX9Zvtydba' \
    --body '{"currencyCode": "Vb0scd97A0GP6djn", "currencyNamespace": "2Ps3IVT5hUZ3cnDq", "customParameters": {"0ddZG0EpfGAqHKcS": {}, "xUc2YgRpk2IFGIgI": {}, "pscUpVAciu2XPPUx": {}}, "description": "zXHUvxhvTZcvRKoa", "extOrderNo": "M4ozSAg8FTLrByWO", "extUserId": "JhbocoGlPzdfxcC3", "itemType": "EXTENSION", "language": "QAxw_893", "metadata": {"wTfopqeZtHJnRgaG": "fLMFbvyI5PZGzVLc", "mZKKKYARape2tsNc": "zam4Cdd1QYvww4XD", "okltgq2vXtUnY6Uh": "DJ4pe0s0Cuhl3dU9"}, "notifyUrl": "b4seYCyiB4tDCWx3", "omitNotification": false, "platform": "7yxb1of79zVTWIfg", "price": 7, "recurringPaymentOrderNo": "PEi9Ze0hL9rPkV5G", "region": "kSrcl2O47XVzU7ql", "returnUrl": "NVk7qnmBS3XKDhp1", "sandbox": true, "sku": "kMcErmeH0lX1hj0L", "subscriptionId": "aXgQ94flh775AQfz", "title": "NjQ7IuMSY2epRDJj"}' \
    > test.out 2>&1
eval_tap $? 272 'CreateUserPaymentOrder' test.out

#- 273 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'DyMDKQhuTjtQZyIi' \
    --userId 'AmCL8bNTTfqLCv9D' \
    --body '{"description": "YBOProN4UWbQaKFr"}' \
    > test.out 2>&1
eval_tap $? 273 'RefundUserPaymentOrder' test.out

#- 274 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tv4JWElmOCxqPrq9' \
    --body '{"code": "I3XJWBxTLcOef8Mg", "orderNo": "IwkrKFEtwESJCe2k"}' \
    > test.out 2>&1
eval_tap $? 274 'ApplyUserRedemption' test.out

#- 275 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'sG3nZE13H2fILFzO' \
    --body '{"meta": {"lAZbDQAEJLbVWH2X": {}, "LIg3MgmdSvWp3h0x": {}, "PsVY8qNwB2TY4v9N": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Xbox", "currencyCode": "fNMFsZAIqak1zi0J", "namespace": "Sa5cRn31D8ubfdXi"}, "entitlement": {"entitlementId": "7BycDPckeGJUgU8b"}, "item": {"entitlementOrigin": "Steam", "itemIdentity": "GL3aefSDME8X2MxI", "itemIdentityType": "ITEM_SKU", "origin": "Other"}, "quantity": 61, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Xbox", "currencyCode": "JMPkZmay4Csye3iJ", "namespace": "Ltjsu6ZJRCoDq3ge"}, "entitlement": {"entitlementId": "uHFFaZzPIjETqcKN"}, "item": {"entitlementOrigin": "System", "itemIdentity": "gaQ4Bn0cPPtKaJlw", "itemIdentityType": "ITEM_ID", "origin": "Epic"}, "quantity": 31, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Epic", "currencyCode": "hJ1176CeD4dWCp4w", "namespace": "qlQJcZroNQiefBnP"}, "entitlement": {"entitlementId": "luOIjZyvlGDQGv6p"}, "item": {"entitlementOrigin": "Xbox", "itemIdentity": "azKAna0ji757aNDF", "itemIdentityType": "ITEM_ID", "origin": "Other"}, "quantity": 74, "type": "ENTITLEMENT"}], "source": "IAP", "transactionId": "lt1es7A4PFduN4gx"}' \
    > test.out 2>&1
eval_tap $? 275 'DoRevocation' test.out

#- 276 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId '0UC6eWKCFGS97Si6' \
    --body '{"gameSessionId": "XyLVPrkUxyZ1OH5N", "payload": {"n4nMT8QOyTuUSD9I": {}, "mtaPAocOQcpBWSNr": {}, "CjSNEAdojkCMmYyT": {}}, "scid": "GO07foRZ6FujpIWo", "sessionTemplateName": "0qJtqp4Q6XgICLgM"}' \
    > test.out 2>&1
eval_tap $? 276 'RegisterXblSessions' test.out

#- 277 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'HcP1eE6sjWQllYsO' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'pp6QGW56CNiszHE6' \
    --limit '73' \
    --offset '61' \
    --sku 'uy9oLFcHHcraLXR2' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 277 'QueryUserSubscriptions' test.out

#- 278 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'JQvq7NKWIHYsii3f' \
    --excludeSystem  \
    --limit '59' \
    --offset '42' \
    --subscriptionId 'h7sieJjZPAkiWuml' \
    > test.out 2>&1
eval_tap $? 278 'GetUserSubscriptionActivities' test.out

#- 279 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'lU31uXPwYxedGHCI' \
    --body '{"grantDays": 22, "itemId": "Y5heA2ewWnFcqHxX", "language": "P3kRhtrBcBofWTGY", "reason": "x2ihgioL8VvEzHGT", "region": "t9emdCLmzJbdkykV", "source": "AnmnRfUilcKA84d9"}' \
    > test.out 2>&1
eval_tap $? 279 'PlatformSubscribeSubscription' test.out

#- 280 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'pMsl7zrNJvDiP2hN' \
    --itemId 'NEI8QrQ6H1ro5CtU' \
    > test.out 2>&1
eval_tap $? 280 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 281 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '8UjgyCUpM1JBcTzf' \
    --userId '4dz1BojPoQg97640' \
    > test.out 2>&1
eval_tap $? 281 'GetUserSubscription' test.out

#- 282 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '9vFd5z9r4nJWUvLp' \
    --userId '1wxGF747468MXUq3' \
    > test.out 2>&1
eval_tap $? 282 'DeleteUserSubscription' test.out

#- 283 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'uIffkIpPmrWVxNZU' \
    --userId 'vkiU2jXSwsBBRopV' \
    --force  \
    --body '{"immediate": false, "reason": "l7U12hO5vpk9DOSg"}' \
    > test.out 2>&1
eval_tap $? 283 'CancelSubscription' test.out

#- 284 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'bsdGVPLD9A5NmuZD' \
    --userId 'UV3yHurgOfba1Xeo' \
    --body '{"grantDays": 68, "reason": "JA0ll1RimBCiQwuy"}' \
    > test.out 2>&1
eval_tap $? 284 'GrantDaysToSubscription' test.out

#- 285 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'rI87uSyXP6C0jXS8' \
    --userId 'au2wcWYyj3JvHqXp' \
    --excludeFree  \
    --limit '11' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 285 'GetUserSubscriptionBillingHistories' test.out

#- 286 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'PK2QiAUhIfi17Yrk' \
    --userId 'WHNxiaNyqBfgw58H' \
    --body '{"additionalData": {"cardSummary": "x0XYL0fJOPYpnPqG"}, "authorisedTime": "1977-12-09T00:00:00Z", "chargebackReversedTime": "1992-12-25T00:00:00Z", "chargebackTime": "1978-05-05T00:00:00Z", "chargedTime": "1974-05-05T00:00:00Z", "createdTime": "1985-08-31T00:00:00Z", "currency": {"currencyCode": "Y1vlV0M2g6oreqyB", "currencySymbol": "zWzCgMMWZuD6tmIR", "currencyType": "REAL", "decimals": 27, "namespace": "xVxbtpSKOfiIP3S6"}, "customParameters": {"pypZqISn3msrykQF": {}, "tW8QGKFZLrIfqrZu": {}, "u7IwKcT7sAsv2TKC": {}}, "extOrderNo": "bYMVkXEHmsHwIGGs", "extTxId": "usS0zZRODEKPdudZ", "extUserId": "sLaf8aZrXW84dt0T", "issuedAt": "1994-01-04T00:00:00Z", "metadata": {"Tmy7XF26K2U7xttU": "z8nWKJjv06PuffHg", "hAQfAsYXVzBenLta": "AoYyRfiCWrm3s1Ah", "3TII70MIcBMJ0450": "8jKedx0CVRpd7SwZ"}, "namespace": "w2UkjDzJ4NuMMgI1", "nonceStr": "3nplXaUQV5QEvKEl", "paymentMethod": "LfbB7gwwAR1xFrny", "paymentMethodFee": 17, "paymentOrderNo": "GVRg6DVso5TJCSug", "paymentProvider": "ADYEN", "paymentProviderFee": 73, "paymentStationUrl": "o4XTm8t1YTWqItjN", "price": 100, "refundedTime": "1997-11-06T00:00:00Z", "salesTax": 26, "sandbox": false, "sku": "9sraeMA78YSRS2fP", "status": "DELETED", "statusReason": "rdN0JVz4U43EcV1F", "subscriptionId": "RyeeqehMNeRYKeMb", "subtotalPrice": 77, "targetNamespace": "mnFSq9jJTVFoFjxZ", "targetUserId": "jh5qUR1Pq4a4uaMf", "tax": 7, "totalPrice": 21, "totalTax": 92, "txEndTime": "1993-12-14T00:00:00Z", "type": "FwajRGUyklfLVY6g", "userId": "3PO4hKAeF4GUV5m9", "vat": 26}' \
    > test.out 2>&1
eval_tap $? 286 'ProcessUserSubscriptionNotification' test.out

#- 287 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'qcCJsVOWtu5RPsqd' \
    --namespace "$AB_NAMESPACE" \
    --userId '66ImBEuhnaxZVf6M' \
    --body '{"count": 60, "orderNo": "ZsHyXzoIXNf0KbL9"}' \
    > test.out 2>&1
eval_tap $? 287 'AcquireUserTicket' test.out

#- 288 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'HyJttdgfLGO3ummp' \
    > test.out 2>&1
eval_tap $? 288 'QueryUserCurrencyWallets' test.out

#- 289 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'llnV6B62P1Kazg73' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c6UpmA4ehxNIIlcr' \
    --body '{"allowOverdraft": false, "amount": 52, "balanceOrigin": "Epic", "balanceSource": "DLC_REVOCATION", "metadata": {"nukAzAMaRvIUhUwg": {}, "uGgbLLN3O7CEYjxq": {}, "ElP5lA2FJ0iGLRTX": {}}, "reason": "GsC5mxxse4eeuMgE"}' \
    > test.out 2>&1
eval_tap $? 289 'DebitUserWalletByCurrencyCode' test.out

#- 290 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'ctVEux2MSuwsEHlw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'deJyhsHS6YqPudWv' \
    --limit '17' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 290 'ListUserCurrencyTransactions' test.out

#- 291 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'EFEb8GnsthmQ2Y6Z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GOiqrg3lpqN5bOfn' \
    --request '{"amount": 34, "debitBalanceSource": "PAYMENT", "metadata": {"J5bzDRzbhMxfEDE4": {}, "TrtIHyyMq79EdB9M": {}, "xaF8QHGM2IuQYBO8": {}}, "reason": "m0HgTth479W8rXqw", "walletPlatform": "Xbox"}' \
    > test.out 2>&1
eval_tap $? 291 'CheckBalance' test.out

#- 292 CheckWallet
eval_tap 0 292 'CheckWallet # SKIP deprecated' test.out

#- 293 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'R3yNKDtMqMrAGpdy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F6WDHn3ePBxQNz2I' \
    --body '{"amount": 97, "expireAt": "1986-09-03T00:00:00Z", "metadata": {"V3BD1nnEzoUlUWqP": {}, "4ElzL44KEm3uHBMC": {}, "P5ckjphURs4ksgsK": {}}, "origin": "Twitch", "reason": "PUvCnfqsPGgJZyRw", "source": "DLC"}' \
    > test.out 2>&1
eval_tap $? 293 'CreditUserWallet' test.out

#- 294 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'MRPvwA9k6yJz03NE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TdywPqYerrpOm4M2' \
    --request '{"amount": 32, "debitBalanceSource": "IAP_REVOCATION", "metadata": {"M4fIfcHBWZM50aHb": {}, "PXRns3qwYL6LwGlZ": {}, "GF7XQPLAcIL7FvAM": {}}, "reason": "WqhyyNZH1CducB5y", "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 294 'DebitByWalletPlatform' test.out

#- 295 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 's05nZC4Os7hqIH2N' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gARSG3QQNGNH2K0U' \
    --body '{"amount": 42, "metadata": {"FdcfiNf0DOHKwxDF": {}, "5GJhCjVHiCn2hTef": {}, "T8gPFJ4WndMpQhcL": {}}, "walletPlatform": "GooglePlay"}' \
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
    --storeId '0WTZbtmQkwC8azx3' \
    > test.out 2>&1
eval_tap $? 301 'ListViews' test.out

#- 302 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IRWme3C6p2r4D3NQ' \
    --body '{"displayOrder": 6, "localizations": {"0LmseIRXeoerZAxb": {"description": "DPXU5xJBhIpJ9b0A", "localExt": {"p7CmSiKPjcwAw5Gd": {}, "xpvLfa4b4hTaZBGd": {}, "X66DqPTdurR3MYda": {}}, "longDescription": "0Y0BCO4qPnvxERWj", "title": "Kasq5zQ6uZNwKjnX"}, "7vDIqpcjmaq5KBCs": {"description": "HlwNrfKJrkzwR40t", "localExt": {"fd9GFXChtxB10d4Q": {}, "8nlBthUSu4WNfTvD": {}, "5UcES1eLMZs9lSQV": {}}, "longDescription": "Dp16qVIqXCK9dS5J", "title": "TbdJEe6mnkYAfw61"}, "kyKk0UXUF2523OTv": {"description": "OmfVNJNDaSO3FEkk", "localExt": {"4It6V8Bu7rIjGrxU": {}, "MKbv60ixUuUhopdq": {}, "GrqRZ124P7PauXTr": {}}, "longDescription": "pWAjwatSvtPbAFn8", "title": "oWQcmFkkRX6EqadA"}}, "name": "EIzxld80Ynss7hc3"}' \
    > test.out 2>&1
eval_tap $? 302 'CreateView' test.out

#- 303 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'VUxxZIgkTLqMeJPC' \
    --storeId 'bs8jWmTteJhwNbwH' \
    > test.out 2>&1
eval_tap $? 303 'GetView' test.out

#- 304 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'GG39YAZJ4HuLfeTf' \
    --storeId 'FBTOFFMJ9pq511jZ' \
    --body '{"displayOrder": 4, "localizations": {"ewbmnWk0E7YaPblc": {"description": "WEyNgvs5LEZrQXzS", "localExt": {"QRWRs9EGnRPgYlJE": {}, "lgJ8kx1WEeDbql13": {}, "FtQMu41rnOzbsFBq": {}}, "longDescription": "g6dziWvdNcwfUBMd", "title": "NuTaiLxFMXRpDP9x"}, "utntU8xHw4yYJOCV": {"description": "iHwunQwpC2eCFUAH", "localExt": {"ZaYSvsWiNJtqXltZ": {}, "F6aSRmHU5iR3hXIb": {}, "zWPKOkzftOgDQAWh": {}}, "longDescription": "ulbrDf7q4cAnpmLi", "title": "Eu4CNtX2lnqi7cHT"}, "SdGoLZbC3UJruU4u": {"description": "IXBZsEYogFWiH9z4", "localExt": {"E8zmaZ5cg0REtUWY": {}, "4fVIdqwCWF5wmbOu": {}, "bTxAAeDCowR3MeCN": {}}, "longDescription": "L1oNrF3SmgudQusJ", "title": "LsPlW7ZyORFkN9Eb"}}, "name": "KbTbrDzNgVEcw0lx"}' \
    > test.out 2>&1
eval_tap $? 304 'UpdateView' test.out

#- 305 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'Ram16O6v4VjJf40L' \
    --storeId 'jUdORELVXUFQyVlt' \
    > test.out 2>&1
eval_tap $? 305 'DeleteView' test.out

#- 306 QueryWallets
eval_tap 0 306 'QueryWallets # SKIP deprecated' test.out

#- 307 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 26, "expireAt": "1976-11-11T00:00:00Z", "metadata": {"mxmxpfp41k1uDg59": {}, "PhdUXShabwyYCxTH": {}, "rDel8oThvr8CUEzw": {}}, "origin": "Twitch", "reason": "zL1QeR3EYXBFpUX9", "source": "OTHER"}, "currencyCode": "soBwqh0TQXa2j7v3", "userIds": ["UpXazsFrmaGNoi3R", "zQJoQLTAlW75icIK", "PTgWotLNz0u8ySxA"]}, {"creditRequest": {"amount": 82, "expireAt": "1983-06-18T00:00:00Z", "metadata": {"rjz4q7e0EJnADXC2": {}, "y0DY1E1SMK9oA4vK": {}, "56dsYI5SKV5pDANy": {}}, "origin": "Twitch", "reason": "IeyFS97dYD7LkcTK", "source": "SELL_BACK"}, "currencyCode": "SyGuu5rbJVIwRMtw", "userIds": ["ApGbXnR3yC6f2MHG", "Gedk0KzXRclOXdPY", "ZQxBnttu4yW5etl4"]}, {"creditRequest": {"amount": 22, "expireAt": "1979-10-01T00:00:00Z", "metadata": {"ZTcnVVOKMApTcWsF": {}, "RUlWBp4gBs9Uufgs": {}, "VbG6TUe3jbuQ7HMP": {}}, "origin": "Xbox", "reason": "EyYAnHPp4XzVL5Mc", "source": "CONSUME_ENTITLEMENT"}, "currencyCode": "Pm4JLsXVtBOEetHs", "userIds": ["UnUEOyP0cPZf5Ovo", "5nkpEdBe8bYWdok4", "xAJ8Ny1LRkPU9hrl"]}]' \
    > test.out 2>&1
eval_tap $? 307 'BulkCredit' test.out

#- 308 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "lfI0mqZctohLheRa", "request": {"allowOverdraft": false, "amount": 12, "balanceOrigin": "GooglePlay", "balanceSource": "EXPIRATION", "metadata": {"MLFW9B7jHZro4hhw": {}, "nANAGp8zGqNGrcQy": {}, "oA1TWPcy83iXfYXN": {}}, "reason": "dMkdg9TMwxNcQ6Ck"}, "userIds": ["Vi8fqVPRqNbF5yLn", "YSa8xFLvcYexMMMi", "DFh5RbW021cHN3Qb"]}, {"currencyCode": "zVuJZH3k54cExxWK", "request": {"allowOverdraft": true, "amount": 8, "balanceOrigin": "System", "balanceSource": "EXPIRATION", "metadata": {"TW4FILotv5ycTa0i": {}, "6ifYP1zfgjsy3VRj": {}, "X4qA4g9OGoWw1qnC": {}}, "reason": "AvdnAcokJ0rzqX2K"}, "userIds": ["j73doCWxhubMXbxN", "vT6wAffv4uzKAwiI", "JcYHgiFDxclBXap6"]}, {"currencyCode": "4wTxNIefCmtrxWu2", "request": {"allowOverdraft": true, "amount": 30, "balanceOrigin": "Other", "balanceSource": "TRADE", "metadata": {"VKneoO10ytPdJ8SY": {}, "3qoogOxoPYvdIBJY": {}, "yGURjEjnslEYM8ng": {}}, "reason": "VT1ewVxvgAocOqsd"}, "userIds": ["Q0WwolQy037hJMOE", "IdW8fNAM5YdHivK2", "5v5n7eXCo9gZWdxf"]}]' \
    > test.out 2>&1
eval_tap $? 308 'BulkDebit' test.out

#- 309 GetWallet
eval_tap 0 309 'GetWallet # SKIP deprecated' test.out

#- 310 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'v5W0v25yAObZIbrA' \
    --end '8XAKKWMDebehSjpt' \
    --start '0wrfWPXaI1Jb75o2' \
    > test.out 2>&1
eval_tap $? 310 'SyncOrders' test.out

#- 311 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["MFOa6xgPt69QROGD", "eJCyHvUsnLvXCSgQ", "Hvs25eiQO3oWdgXd"], "apiKey": "m1IxL1OtleUBqBO0", "authoriseAsCapture": true, "blockedPaymentMethods": ["e049k9W6ZLVJzRpU", "sITfVruDukun42zP", "ZvOd4yZyMKyED3qD"], "clientKey": "O5HXp5oVkhESbHQ7", "dropInSettings": "hvTlzf7XwQtVIYU8", "liveEndpointUrlPrefix": "7NgjDMcJxfMfYFlt", "merchantAccount": "3JvDgMiyBGygWFTA", "notificationHmacKey": "Y3Th5mOwPCPKVPlO", "notificationPassword": "GfFBlu2ZP0IkiYXG", "notificationUsername": "k6BoBmSLi0R7zDFM", "returnUrl": "oNTQmlS8lMlY8Ujp", "settings": "rhCxhzW6ZM7LkTVr"}' \
    > test.out 2>&1
eval_tap $? 311 'TestAdyenConfig' test.out

#- 312 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "tVJZVhxCVdjPutJ8", "privateKey": "dkAVOJ5imghdfVhj", "publicKey": "njd66A1SQmWGSQLA", "returnUrl": "VPAJ7zX5lB80k2sm"}' \
    > test.out 2>&1
eval_tap $? 312 'TestAliPayConfig' test.out

#- 313 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "dkBS2MaIP7PjngEF", "secretKey": "ggq91cpgvoDBgYfL"}' \
    > test.out 2>&1
eval_tap $? 313 'TestCheckoutConfig' test.out

#- 314 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'BdGNAZEvbvxqa0K7' \
    > test.out 2>&1
eval_tap $? 314 'DebugMatchedPaymentMerchantConfig' test.out

#- 315 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "VUbjUnzirnEsxSE4", "clientSecret": "vBzG7VK8sWEshmZf", "returnUrl": "5fEdvjbyJPQ1qdRc", "webHookId": "Jjsme1OukIfIZVH8"}' \
    > test.out 2>&1
eval_tap $? 315 'TestPayPalConfig' test.out

#- 316 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["q8svV5hMOSfpyJkJ", "lmJmTkFvB7wkY6nu", "UEGJ3k0HGtpK43uO"], "publishableKey": "RGREOOwTuY8dhNCD", "secretKey": "WWpN3B6tedgFUzBm", "webhookSecret": "5vGA3itKaF9z3WWu"}' \
    > test.out 2>&1
eval_tap $? 316 'TestStripeConfig' test.out

#- 317 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "v3j8T9g1f6P3D3rV", "key": "cC2g6t42jE1Wad23", "mchid": "2YV7A2zHFGbN8AQa", "returnUrl": "Caw9UF7cdSDd99DQ"}' \
    > test.out 2>&1
eval_tap $? 317 'TestWxPayConfig' test.out

#- 318 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "Z7vnTx8HDXTJWiyw", "flowCompletionUrl": "17ogzmbj4SLYDrZJ", "merchantId": 43, "projectId": 15, "projectSecretKey": "DLGvn6qtroZcp16H"}' \
    > test.out 2>&1
eval_tap $? 318 'TestXsollaConfig' test.out

#- 319 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'KXX1ft5nBA9xNIJV' \
    > test.out 2>&1
eval_tap $? 319 'GetPaymentMerchantConfig' test.out

#- 320 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'uMz04evSdE2FMcKd' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["7c94rEmIYuAT5OAc", "UwYHGmG5rNDBF1oU", "37vjfyX5YLaM0wmi"], "apiKey": "0i1WABBbq8IzZsMF", "authoriseAsCapture": false, "blockedPaymentMethods": ["581HbF7fMX9lDXYx", "GRJM92eX42WW2WKf", "5urEOpASBicX3Zwz"], "clientKey": "Z7aVhrkmhSOEozGO", "dropInSettings": "v8D0iVxzrec5kNwJ", "liveEndpointUrlPrefix": "Axm0Rdm9l6nIhG5S", "merchantAccount": "ilDDIsmj4h625dIs", "notificationHmacKey": "MKWBxF9RAIrI81ZR", "notificationPassword": "2kNzh60RQNaTEhMX", "notificationUsername": "MepgzY9jLiAdMiQ7", "returnUrl": "eDMkeBRMur18nCxi", "settings": "V9bQMHpPbvflI3Lk"}' \
    > test.out 2>&1
eval_tap $? 320 'UpdateAdyenConfig' test.out

#- 321 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'Rc1NgZaoYAaCCeRg' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 321 'TestAdyenConfigById' test.out

#- 322 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'tstsU3Qecxo4bQZO' \
    --sandbox  \
    --validate  \
    --body '{"appId": "3P2f8TTOVf6jrr1O", "privateKey": "L606QpqCgxt0NgDS", "publicKey": "j1T6EdeYFmrLT0Hb", "returnUrl": "vS4kSSt3CyDgf6eF"}' \
    > test.out 2>&1
eval_tap $? 322 'UpdateAliPayConfig' test.out

#- 323 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'AiqSkHi0BR2ElF6z' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 323 'TestAliPayConfigById' test.out

#- 324 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id '6eJKuOW61akRFizq' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "xCmudSXivAL3n478", "secretKey": "mhb2I2yBJeCJghTr"}' \
    > test.out 2>&1
eval_tap $? 324 'UpdateCheckoutConfig' test.out

#- 325 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'k68FWFzuLBdlrKjU' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 325 'TestCheckoutConfigById' test.out

#- 326 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'bgZQfw6Zys3mN8fI' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "cC9CkharfqaoMsGy", "clientSecret": "v1RuSNdycDssUeHi", "returnUrl": "VDXzSJ8kbFAyidbn", "webHookId": "XdMSwmkBkKC1h6h4"}' \
    > test.out 2>&1
eval_tap $? 326 'UpdatePayPalConfig' test.out

#- 327 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '5u0wuh9pY0011jSm' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 327 'TestPayPalConfigById' test.out

#- 328 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'HFTtfM2mGUUpq3ix' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["7Am7W1fwJnV94BrM", "SP31wAkVH75UcmNX", "K5RqcIo9lpz9oM52"], "publishableKey": "vHPlwVV3jlPKDEYa", "secretKey": "hnlLJaLCvjRKKX1b", "webhookSecret": "rmkJDfdngbQD3pO8"}' \
    > test.out 2>&1
eval_tap $? 328 'UpdateStripeConfig' test.out

#- 329 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'U3W94Z8IW2MAL9gY' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 329 'TestStripeConfigById' test.out

#- 330 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'HEV3wnTZTvYYf4ZF' \
    --validate  \
    --body '{"appId": "uV6L2AldoWWRN5wN", "key": "YlFiliYmBrqrOc0N", "mchid": "IligBrOkBljwRENj", "returnUrl": "t04ZpyTTZG1LxLdy"}' \
    > test.out 2>&1
eval_tap $? 330 'UpdateWxPayConfig' test.out

#- 331 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'SvyVqY8nxBZbHcPH' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 331 'UpdateWxPayConfigCert' test.out

#- 332 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'EFuEVP9bF07gnWDU' \
    > test.out 2>&1
eval_tap $? 332 'TestWxPayConfigById' test.out

#- 333 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'LkJPQR0UJMr8oucc' \
    --validate  \
    --body '{"apiKey": "GH0B4LCe2h0iFCCZ", "flowCompletionUrl": "gFWs5s0nT89A88GD", "merchantId": 82, "projectId": 55, "projectSecretKey": "UClGyzYgnYTdim6P"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdateXsollaConfig' test.out

#- 334 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'kRoq5TO65KWh8ztR' \
    > test.out 2>&1
eval_tap $? 334 'TestXsollaConfigById' test.out

#- 335 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'JkXxUAj3jzZvEaY1' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "MEDIUM", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 335 'UpdateXsollaUIConfig' test.out

#- 336 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '43' \
    --namespace "$AB_NAMESPACE" \
    --offset '78' \
    --region 'eFMWAFT7l0l1jaOA' \
    > test.out 2>&1
eval_tap $? 336 'QueryPaymentProviderConfig' test.out

#- 337 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "JqQqhISTBT1Gofv4", "region": "SuaZ8yCB9TVZnuzg", "sandboxTaxJarApiToken": "vAZJRm71EC3ENuvD", "specials": ["ADYEN", "CHECKOUT", "STRIPE"], "taxJarApiToken": "JoHPj7jFWxSv1lYy", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 337 'CreatePaymentProviderConfig' test.out

#- 338 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 338 'GetAggregatePaymentProviders' test.out

#- 339 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'YAiZ8c7Zd7EUoezO' \
    > test.out 2>&1
eval_tap $? 339 'DebugMatchedPaymentProviderConfig' test.out

#- 340 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 340 'GetSpecialPaymentProviders' test.out

#- 341 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'Lw8C1c5bBB3XZ7Co' \
    --body '{"aggregate": "ADYEN", "namespace": "EmXn6U2VeV2emK3J", "region": "ecJA4skqCbPxRkIA", "sandboxTaxJarApiToken": "FQh9yDdoLE2s7mrV", "specials": ["STRIPE", "ADYEN", "PAYPAL"], "taxJarApiToken": "LJu4ljPWlCWTuGO8", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 341 'UpdatePaymentProviderConfig' test.out

#- 342 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'fOQu3wdT4Aodp95o' \
    > test.out 2>&1
eval_tap $? 342 'DeletePaymentProviderConfig' test.out

#- 343 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 343 'GetPaymentTaxConfig' test.out

#- 344 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "1RkX7iW7VpCngWAv", "taxJarApiToken": "5DAG8dPdkKgQqjyz", "taxJarEnabled": true, "taxJarProductCodesMapping": {"R2rFIAuALNhNCysc": "sMBRLsWadk2OQ421", "q7Nb1vrKthVvU5on": "065ApCkVN3QchuQ6", "pntxB648ss7rBnvQ": "HAM8gSdIybKUByHB"}}' \
    > test.out 2>&1
eval_tap $? 344 'UpdatePaymentTaxConfig' test.out

#- 345 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'zfvgtRTPPzwJmKaL' \
    --end 'Cx3gcidEALWe6RG5' \
    --start 'wWznu5AjwR1Z4fU7' \
    > test.out 2>&1
eval_tap $? 345 'SyncPaymentOrders' test.out

#- 346 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'ICcaQtuuKUw3dUwW' \
    --storeId 'HhQW3I1y9tjRLVOX' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetRootCategories' test.out

#- 347 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'BMa0JiIe1AY0tUA7' \
    --storeId 'EKASk3USNLhOBlxR' \
    > test.out 2>&1
eval_tap $? 347 'DownloadCategories' test.out

#- 348 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'BLgohp8ByTi2F6Ay' \
    --namespace "$AB_NAMESPACE" \
    --language 'UX8w77riPlPgJcLb' \
    --storeId 'eQf9MICxX7xKyCfg' \
    > test.out 2>&1
eval_tap $? 348 'PublicGetCategory' test.out

#- 349 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'wSPz14asyOdgn77g' \
    --namespace "$AB_NAMESPACE" \
    --language 'N8K1FlNkgbFE8U4m' \
    --storeId 'eK5grmPBsFH71Vrh' \
    > test.out 2>&1
eval_tap $? 349 'PublicGetChildCategories' test.out

#- 350 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'sISYtegQbNA2WQrH' \
    --namespace "$AB_NAMESPACE" \
    --language 'TkJT1VkChD3n0c1r' \
    --storeId 'yAkRvdPR8gx2rX5d' \
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
    --dlcType 'OCULUS' \
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
    --language '8NFKPgT6LMehg047' \
    --region 'axU5ktNywRIvO2Sg' \
    --storeId 'z30hejqdktHIO1Vd' \
    --appId 'tMSews1TrU4FhAfK' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetItemByAppId' test.out

#- 355 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'fWXGk7JObSHksRka' \
    --categoryPath 'bpmvRsc7ZYvXCT6m' \
    --features '6mRZAlLBczJVeil7' \
    --includeSubCategoryItem  \
    --itemType 'OPTIONBOX' \
    --language 'MGkXNwMYwFyljy5b' \
    --limit '19' \
    --offset '87' \
    --region 'mxhBS6YypRW7fNnt' \
    --sortBy 'updatedAt:desc,name,createdAt:asc' \
    --storeId 'lMpx3m7lEXTmnTbt' \
    --tags 'jK9RsyoqT3adB48J' \
    > test.out 2>&1
eval_tap $? 355 'PublicQueryItems' test.out

#- 356 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'xp2zaItg9jTNZvpF' \
    --region 'EUI21aSaIsMyLKPP' \
    --storeId 'IZx0zdNAagipZwia' \
    --sku 'BrFrXtGMjujfHZB1' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetItemBySku' test.out

#- 357 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'gMI1B8DXb37DffTZ' \
    --storeId '7yQz337LLNCjIySe' \
    --itemIds '36SA5dxATLv5PkLv' \
    > test.out 2>&1
eval_tap $? 357 'PublicGetEstimatedPrice' test.out

#- 358 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'raRzChdjDGdlk2A2' \
    --region 'jHbAPNGInvbnf4ew' \
    --storeId 'KFFLoGggX4gQWyZo' \
    --itemIds 'cvYfr0Rnl02R1IVN' \
    > test.out 2>&1
eval_tap $? 358 'PublicBulkGetItems' test.out

#- 359 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["naK6KS71Xs1BphA9", "BXpKYgF9OuigDP0V", "jmy7j2BrdCAm3slC"]}' \
    > test.out 2>&1
eval_tap $? 359 'PublicValidateItemPurchaseCondition' test.out

#- 360 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'INGAMEITEM' \
    --limit '66' \
    --offset '0' \
    --region 'QdwLi3GOQkLtpuRN' \
    --storeId 'eT1CULEMPaOU5nuk' \
    --keyword 'ycAUlkUSZKUrsxNR' \
    --language 'zF3NaUuCyQyze6zP' \
    > test.out 2>&1
eval_tap $? 360 'PublicSearchItems' test.out

#- 361 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'Ku5sE89JW8UU0RsB' \
    --namespace "$AB_NAMESPACE" \
    --language '6dvrpmInhHYzVVlH' \
    --region 'GFSwjby6rMYkVQnZ' \
    --storeId 'DUAbINRKQsxUO1YM' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetApp' test.out

#- 362 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'xAndOj5O6IBwXJjg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 362 'PublicGetItemDynamicData' test.out

#- 363 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'QjgLoJyqwFVBd1Zj' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'aRXEdWgS12bSbPgO' \
    --populateBundle  \
    --region 'CWUogizeWOPUMrqg' \
    --storeId 'EIsMwNbfti0LoTBc' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetItem' test.out

#- 364 GetPaymentCustomization
eval_tap 0 364 'GetPaymentCustomization # SKIP deprecated' test.out

#- 365 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "NzyoCSw1t653G3yd", "paymentProvider": "CHECKOUT", "returnUrl": "mGzvx9bSqqyAPha5", "ui": "b6PQTPTytHeeXo7g", "zipCode": "OFVLZCBWuVIROZuq"}' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetPaymentUrl' test.out

#- 366 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'dJBi8pkn98VtLNka' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetPaymentMethods' test.out

#- 367 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'IQJfkFDhSeSGXtZU' \
    > test.out 2>&1
eval_tap $? 367 'PublicGetUnpaidPaymentOrder' test.out

#- 368 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '5SuIhMSaDRp17dUW' \
    --paymentProvider 'ADYEN' \
    --zipCode 'FIV2feXnTRlzAJy9' \
    --body '{"token": "oFOHB2KEsIdtozVl"}' \
    > test.out 2>&1
eval_tap $? 368 'Pay' test.out

#- 369 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'tBhoXE4wgcYT5Cdj' \
    > test.out 2>&1
eval_tap $? 369 'PublicCheckPaymentOrderPaidStatus' test.out

#- 370 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ADYEN' \
    --region 'lj9Ii2jARwzowk9O' \
    > test.out 2>&1
eval_tap $? 370 'GetPaymentPublicConfig' test.out

#- 371 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'oiPdnq9KBqBwiNCs' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetQRCode' test.out

#- 372 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'nK8CcO1OHbpQZtwW' \
    --foreinginvoice '3EwLre1bL4dJnkRL' \
    --invoiceId 'JbMvOGSd7uMrmQ2S' \
    --payload 'aLd6M7TM3wnJyExu' \
    --redirectResult 'o5z9RAcYgYZb7cAa' \
    --resultCode 'kJpqN6eubdp49JFw' \
    --sessionId 'XG0EvoSHNC97eEyh' \
    --status 'nL1QH5AlYRAqCAC2' \
    --token 'gy1WF9QLNgDxAkwg' \
    --type 'fB8jIecOx5ugNCDd' \
    --userId '6jW6fjtBcO3fWq9q' \
    --orderNo 'fmBv0XgJB6a7uykA' \
    --paymentOrderNo 'DFpinFcH2ZMSYijq' \
    --paymentProvider 'XSOLLA' \
    --returnUrl 'sf2dvKZyHChRPHvd' \
    > test.out 2>&1
eval_tap $? 372 'PublicNormalizePaymentReturnUrl' test.out

#- 373 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'kcKW21B5EFtD2pYa' \
    --paymentOrderNo 'KTz1gcE2XCwTkRUI' \
    --paymentProvider 'WALLET' \
    > test.out 2>&1
eval_tap $? 373 'GetPaymentTaxValue' test.out

#- 374 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'FHNmB9mYBvtOwxjq' \
    > test.out 2>&1
eval_tap $? 374 'GetRewardByCode' test.out

#- 375 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'yrjDApeN5eAfRqSg' \
    --limit '68' \
    --offset '86' \
    --sortBy 'rewardCode,namespace' \
    > test.out 2>&1
eval_tap $? 375 'QueryRewards1' test.out

#- 376 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'IuBTYOdsvNyk52MQ' \
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
    --appIds 'FkVVEf36S7yPgG48,bk6PwH1tdEAJSqXA,0Wv0zWGvkc6byp3m' \
    --itemIds 'vyYT3GuaZVTxBlw1,IWeXKFT4rfSbbSlD,PGf9Fn32SJNPZkEf' \
    --skus 'kAcJTMS4pVRcCHIG,fmCMTr9ACnI2sMrE,gl7ZR1HCkf2Sw78l' \
    > test.out 2>&1
eval_tap $? 378 'PublicExistsAnyMyActiveEntitlement' test.out

#- 379 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'LGKjDHuXt358gzqR' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 380 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --itemId 'JcGUFgp6LkyXpxJe' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 381 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --sku '3hqJ7HP63Se6kVW5' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 382 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'fkl60ImLBv6nUU0r,1rfX9stpvJUuyPdz,x8BM2wEgTtLRT5st' \
    --itemIds 'wQFUEbTPQ8p7VMlx,EXnqHwMyKpwphjUX,vM1GqMkZ44UXgdBq' \
    --skus 'tJaRyDlP9qIZJ5Kr,x6KkHagEugKJxkU8,Y58COtTNjnNSikJD' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetEntitlementOwnershipToken' test.out

#- 383 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "g6ujKvq0CIa1YCK9", "language": "SMin", "region": "4reG0HwUXxQTf5Yp"}' \
    > test.out 2>&1
eval_tap $? 383 'SyncTwitchDropsEntitlement' test.out

#- 384 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'DUGYsJBEkYUrLv4q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 384 'PublicGetMyWallet' test.out

#- 385 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'UiTkFcLBrg2JB0Wi' \
    --body '{"epicGamesJwtToken": "CpVBwvAffJ3btt0P"}' \
    > test.out 2>&1
eval_tap $? 385 'SyncEpicGameDLC' test.out

#- 386 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'pQY3Pnnic80yEO8d' \
    > test.out 2>&1
eval_tap $? 386 'SyncOculusDLC' test.out

#- 387 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'L6Jh10XMUGeDavCK' \
    --body '{"serviceLabel": 35}' \
    > test.out 2>&1
eval_tap $? 387 'PublicSyncPsnDlcInventory' test.out

#- 388 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qnv0C00dtNGGzbGY' \
    --body '{"serviceLabels": [66, 11, 92]}' \
    > test.out 2>&1
eval_tap $? 388 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 389 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'o9fY2EBZAHQXc4Xc' \
    --body '{"appId": "ae7VKl0ARzGEArlf", "steamId": "E1NSmtcADoZvd0La"}' \
    > test.out 2>&1
eval_tap $? 389 'SyncSteamDLC' test.out

#- 390 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '7P4JI4H7uDzkOHTd' \
    --body '{"xstsToken": "nUtdrRcs3GeOsKPN"}' \
    > test.out 2>&1
eval_tap $? 390 'SyncXboxDLC' test.out

#- 391 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'lG7rEXi6LEqJERpb' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'Eq07txnvZZeAf7QB' \
    --features 'uZK5GJlBncg8tQnJ,OKHC16xjJZ4kiU3N,8556ll2LQWpdESOB' \
    --itemId 'V7wZJsg7wSv9lyRy,TdYBUljvBzvYNEtf,gBFikt18cQ677Sot' \
    --limit '61' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 391 'PublicQueryUserEntitlements' test.out

#- 392 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'SarkhltUxgbN5eEl' \
    --appId 'QNESFLD8hCc9onSN' \
    > test.out 2>&1
eval_tap $? 392 'PublicGetUserAppEntitlementByAppId' test.out

#- 393 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'jbQEqFGwnDG8kz4k' \
    --limit '45' \
    --offset '46' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 393 'PublicQueryUserEntitlementsByAppType' test.out

#- 394 PublicGetUserEntitlementByItemId
eval_tap 0 394 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 395 PublicGetUserEntitlementBySku
eval_tap 0 395 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 396 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'lqJ4MO3L8x1H5Ogz' \
    --appIds 'HypgsSeKCvtPz7ja,gBG9a1TZ87ltClc3,RDXF5055tUlenimj' \
    --itemIds 'Ibm0riCaNp8dUBDi,nAB6HqIWIi5Bvb1r,cuEtWAF763kci7lT' \
    --skus '62BOHaso53W3U2Mu,9ZGMWou1U0RVCf3g,MWDAodCKqfqzeexH' \
    > test.out 2>&1
eval_tap $? 396 'PublicExistsAnyUserActiveEntitlement' test.out

#- 397 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'A70NgJTxjtzgO7W3' \
    --appId 'taRvJ6lKWJwHO65a' \
    > test.out 2>&1
eval_tap $? 397 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 398 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'OFDwpqy7XOU3Dwgl' \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'MBZegHtB9uTCiiIo' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 399 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'MZCjGiOZJpUf9Rpc' \
    --ids 'fEQn0O6D8PGQuazA,ypgWhTED5YmPTBUk,m2FyvdguCYVqFyIK' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 400 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'h1YtTY4AejyQc5Da' \
    --entitlementClazz 'APP' \
    --sku 'AjHLGV3sNxS8uLBZ' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 401 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'iVRYIyQLcslTEqgV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NG8AqktgvjwNJAwI' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetUserEntitlement' test.out

#- 402 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'pEy2ZNpojZ24I2n2' \
    --namespace "$AB_NAMESPACE" \
    --userId '5smsrmJFHGiYnyhb' \
    --body '{"options": ["qxLuTZIxgiUaiyy0", "aWrshpmb1C9Al7eW", "rbNRE0xyYPUZHyLG"], "requestId": "Q52IjGpRJCUJpscO", "useCount": 93}' \
    > test.out 2>&1
eval_tap $? 402 'PublicConsumeUserEntitlement' test.out

#- 403 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'EOq6BFjmN4OqKGLR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pNWzKZtZnxgywmr4' \
    --body '{"requestId": "CYNGm7Tk1mMyeNRs", "useCount": 19}' \
    > test.out 2>&1
eval_tap $? 403 'PublicSellUserEntitlement' test.out

#- 404 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '06SpNOnuSksfm7hc' \
    --body '{"code": "IFdkdrwAcK2lUda9", "language": "YH_OFcH", "region": "o6pXU5MDJLCB6WbX"}' \
    > test.out 2>&1
eval_tap $? 404 'PublicRedeemCode' test.out

#- 405 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'WIRpgjooaBVemsbk' \
    --body '{"excludeOldTransactions": false, "language": "grxg", "productId": "Tj9rZpkSntuOeaPA", "receiptData": "yPeEGBepK1Ix4Swj", "region": "CYjCHniVSn1gYGal", "transactionId": "5NrBtT0om9OlGzpF"}' \
    > test.out 2>&1
eval_tap $? 405 'PublicFulfillAppleIAPItem' test.out

#- 406 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '25qu98RhktX6qwkX' \
    --body '{"epicGamesJwtToken": "bCLbh8t0zPkQWRUl"}' \
    > test.out 2>&1
eval_tap $? 406 'SyncEpicGamesInventory' test.out

#- 407 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'gE0kxzFMq9ttbEHA' \
    --body '{"autoAck": true, "language": "wYkd-oToc-193", "orderId": "Iay5VdUdYy9Y9OCS", "packageName": "mmT3WKijbqhT3uyQ", "productId": "RXvvcUYDeWPZ8yhw", "purchaseTime": 88, "purchaseToken": "nHQwpWi8HZ6C0VJ0", "region": "fK2m6lQ5Ao8TITYi"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicFulfillGoogleIAPItem' test.out

#- 408 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'HSR2SEJh1YDedZdN' \
    > test.out 2>&1
eval_tap $? 408 'SyncOculusConsumableEntitlements' test.out

#- 409 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'qkXPWZfT8ZfdKp9q' \
    --body '{"currencyCode": "4nXuK0tJAYror2Xd", "price": 0.3162209262891985, "productId": "SCG7ZExOoIpWzacO", "serviceLabel": 45}' \
    > test.out 2>&1
eval_tap $? 409 'PublicReconcilePlayStationStore' test.out

#- 410 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'cYPQ5bk5IeuAi3zW' \
    --body '{"currencyCode": "FGorCbncoj5RvEtX", "price": 0.1427923872777953, "productId": "KyUGdNfMiwgSvsTR", "serviceLabels": [72, 25, 44]}' \
    > test.out 2>&1
eval_tap $? 410 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 411 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'SzGkED0oweFYDBPy' \
    --body '{"appId": "d1jJBxbrbuFay9PX", "currencyCode": "gEQS4871QSmsspn5", "language": "voe", "price": 0.1430525024967857, "productId": "fK65tvaH9jwcO48p", "region": "thyYpBJDHIIxTIGI", "steamId": "5EssYllIqjJzuQ8G"}' \
    > test.out 2>&1
eval_tap $? 411 'SyncSteamInventory' test.out

#- 412 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'glVgxjOGQGlHm8VT' \
    --body '{"gameId": "N56tJKwD8O07L9GG", "language": "Vf_829", "region": "hceaLdgPZI0fKW8L"}' \
    > test.out 2>&1
eval_tap $? 412 'SyncTwitchDropsEntitlement1' test.out

#- 413 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'eQxItaK6s3Hha69M' \
    --body '{"currencyCode": "gxjGJx62mkfVlu4b", "price": 0.5256675979147635, "productId": "B1pyk0PpxXZDy5Pm", "xstsToken": "bu7RrD9a5mdlXTCL"}' \
    > test.out 2>&1
eval_tap $? 413 'SyncXboxInventory' test.out

#- 414 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '467xHbAiD3Pr3mXZ' \
    --itemId 'O1PnbSlfVRlAI8F2' \
    --limit '12' \
    --offset '24' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 414 'PublicQueryUserOrders' test.out

#- 415 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ev09kAA5hnQtd4bc' \
    --body '{"currencyCode": "ivHGIEplRpcHDWcI", "discountedPrice": 29, "ext": {"OFBWhUTPiKR3qcbH": {}, "LGplYsS3jsRZffCd": {}, "00VrgPuNtOv3jbhG": {}}, "itemId": "BuW8KcyPMfDWSEEp", "language": "OkJM_HloT-MF", "price": 88, "quantity": 8, "region": "jYbzemOTURzzAOIB", "returnUrl": "arB7kcer5SvPLeQZ", "sectionId": "IpKFXgnsxx3c2bUs"}' \
    > test.out 2>&1
eval_tap $? 415 'PublicCreateUserOrder' test.out

#- 416 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'O7FP8RmOstZAGDgi' \
    --userId 'VsV2OttwJaMxPDIJ' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetUserOrder' test.out

#- 417 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '5hFQHumFvPKqupHj' \
    --userId '72TlLs964iABOgTK' \
    > test.out 2>&1
eval_tap $? 417 'PublicCancelUserOrder' test.out

#- 418 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'tnaA7O35Iaytd9Cs' \
    --userId 'AMTZC37xPXxnfggn' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetUserOrderHistories' test.out

#- 419 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Z3EZp6wSAufwYirs' \
    --userId '9lwvPKd925u3fFLV' \
    > test.out 2>&1
eval_tap $? 419 'PublicDownloadUserOrderReceipt' test.out

#- 420 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '0YeMrVaYSTRYGFzg' \
    > test.out 2>&1
eval_tap $? 420 'PublicGetPaymentAccounts' test.out

#- 421 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'LZ7gEypQf2Pn9A4g' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId '0jWCjpGwh7pLAi5J' \
    > test.out 2>&1
eval_tap $? 421 'PublicDeletePaymentAccount' test.out

#- 422 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'mzvM6JFKB8ikHpl3' \
    --autoCalcEstimatedPrice  \
    --language 'sNRaDEC2OkXA3Wqy' \
    --region 'poOw0H2s0sibQNBz' \
    --storeId '81zRPntxpgi7tXIc' \
    --viewId 'NEcGJjOCXpuix5vn' \
    > test.out 2>&1
eval_tap $? 422 'PublicListActiveSections' test.out

#- 423 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'PeTu9evbRov7Bm40' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId '0X9AJdkT7UYCV8ag' \
    --limit '44' \
    --offset '46' \
    --sku 'U0d4FvVmPMtpRMWS' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 423 'PublicQueryUserSubscriptions' test.out

#- 424 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'v9olKpRyWQim3qlA' \
    --body '{"currencyCode": "RT9mPPmYUvlkBGPJ", "itemId": "FaFzkABC8zWMcYW5", "language": "Tt-vzpg_545", "region": "hbvGenRbm3QtsY5W", "returnUrl": "aKM5YY6pYrmeMIHL", "source": "S8egV8XhgDjbrum8"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicSubscribeSubscription' test.out

#- 425 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'UxcutmVg8APWKxoj' \
    --itemId '6MF68VuKDoklYmky' \
    > test.out 2>&1
eval_tap $? 425 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 426 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'tCAH8Jiqe7gfV1G6' \
    --userId 'bYgIbVKp4Kgew2mH' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetUserSubscription' test.out

#- 427 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'DksA6Mv9Nzs19eBq' \
    --userId '9a1L8S1yduOwscIC' \
    > test.out 2>&1
eval_tap $? 427 'PublicChangeSubscriptionBillingAccount' test.out

#- 428 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ro6P8FWIPeqaBeD2' \
    --userId 'uBAvIXEc2CCgYcFo' \
    --body '{"immediate": true, "reason": "II4jrzrPsuMziNM8"}' \
    > test.out 2>&1
eval_tap $? 428 'PublicCancelSubscription' test.out

#- 429 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'AB7RRxiZH3ngnitU' \
    --userId 'RdMjZLYCaeklQcFY' \
    --excludeFree  \
    --limit '88' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 429 'PublicGetUserSubscriptionBillingHistories' test.out

#- 430 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'er5mdraK47FdxXis' \
    --language 'Vlo3aVOGARFDJcGW' \
    --storeId 'y826ilCxAxQUM5Dy' \
    > test.out 2>&1
eval_tap $? 430 'PublicListViews' test.out

#- 431 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'rPfBmpZIzSFUZqVR' \
    --namespace "$AB_NAMESPACE" \
    --userId '5FWGfH66eFCMTsLA' \
    > test.out 2>&1
eval_tap $? 431 'PublicGetWallet' test.out

#- 432 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode '8vYVvrIAEehUV0js' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jAyVgxS54NNs3Xdh' \
    --limit '80' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 432 'PublicListUserWalletTransactions' test.out

#- 433 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'Eb0Pv35fEk9s11bF' \
    --baseAppId 'Xkf7rQJ4Kj7Qyo9t' \
    --categoryPath 'UptiyZzRX8Y4rxRW' \
    --features 'ZPe4ZLAQWuBJwxOb' \
    --includeSubCategoryItem  \
    --itemName 'ZqMGxhffy9cHrLYf' \
    --itemStatus 'ACTIVE' \
    --itemType 'BUNDLE' \
    --limit '39' \
    --offset '39' \
    --region 'ad99JDcnn7f2d8SO' \
    --sectionExclusive  \
    --sortBy 'createdAt:desc,name:asc,displayOrder:asc' \
    --storeId '2dw6Uy88WpQalG38' \
    --tags 'VOo82aLD9jUjuDIT' \
    --targetNamespace 'jifWRbmtK7MTxcCW' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 433 'QueryItems1' test.out

#- 434 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nMiCLsjroKHPApA8' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 434 'ImportStore1' test.out

#- 435 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GsGwyocvY9NePjLJ' \
    --body '{"itemIds": ["QJXwUApJWohXn01R", "B7pu7BaONXyE5fID", "bsMi48xOYVvEcEm5"]}' \
    > test.out 2>&1
eval_tap $? 435 'ExportStore1' test.out

#- 436 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '3BYMBacQBIuDVs7U' \
    --body '{"entitlementOrigin": "System", "metadata": {"AJtWPRteszMTd0R5": {}, "Fsrf9xbVfgvG617G": {}, "mxzClkR3M6Twpwq3": {}}, "origin": "Nintendo", "rewards": [{"currency": {"currencyCode": "HCCVDBRjPUQWYVxG", "namespace": "QVFJlDDJ7z4Pb5jy"}, "item": {"itemId": "GID39Ung1D57FjYK", "itemSku": "lJiRIvhej77OSPwd", "itemType": "zMSmrSvQdsAdTUGp"}, "quantity": 7, "type": "CURRENCY"}, {"currency": {"currencyCode": "8KFrXKFA2gdjQCYo", "namespace": "E8b0CZetLfpFNyp7"}, "item": {"itemId": "375rhOmR4zFjoJZV", "itemSku": "KZjOD2ePKAKYjJMV", "itemType": "nYj2yKqavWpydepM"}, "quantity": 0, "type": "CURRENCY"}, {"currency": {"currencyCode": "8govttlpFAq8oebn", "namespace": "S4Y2zkGYTr9yJIve"}, "item": {"itemId": "X52r6Inl9VTJB9Al", "itemSku": "3mn2DsHDHzSVJzhU", "itemType": "5Z44zgZ1fieLdl3Y"}, "quantity": 82, "type": "ITEM"}], "source": "CONSUME_ENTITLEMENT", "transactionId": "Oj5kPuNRZZaUccuB"}' \
    > test.out 2>&1
eval_tap $? 436 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE