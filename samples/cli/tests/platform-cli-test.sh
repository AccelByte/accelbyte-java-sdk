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
echo "1..432"

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
    --body '{"appId": "vxuJlhXbWhbwPwTo", "appType": "SOFTWARE", "baseAppId": "Bg0tTJg46IewOXE2", "boothName": "AkCh3QIZsUf8lGFX", "categoryPath": "cmwTERHclOdxIwqe", "clazz": "jxe18rNdb8Otq6j1", "displayOrder": 25, "entitlementType": "DURABLE", "ext": {"qUav7k05HAQltnSo": {}, "jV4jT65yclX2FtAz": {}, "0vJjFIYWOaNdsimm": {}}, "features": ["ZkaXZ7vmiEd0JPxV", "kW2miH3xRHAKy4Qx", "yQpshaDwNqTbbFMX"], "flexible": true, "images": [{"as": "4VfkyrwpuXxbaERb", "caption": "fgPmi0eHkt1mr9EO", "height": 70, "imageUrl": "SiZNCxuogFteTHJe", "smallImageUrl": "4BhSSQkQD6WmOt6D", "width": 26}, {"as": "ufFVTOhvQpfbBke8", "caption": "aEdd36xj6wySoltD", "height": 48, "imageUrl": "Cvs78mcMdiS76YAp", "smallImageUrl": "GJ9ufwLYkqIgLuZS", "width": 12}, {"as": "hsQryiEtOAbpeUNf", "caption": "26UqkCfgCUYBn2xa", "height": 83, "imageUrl": "4lj8m3XEwP2b4gd3", "smallImageUrl": "xOeii8Jnmssep2xD", "width": 95}], "itemIds": ["NY0kABeGs9yxahld", "1pO0Gyf5PO3COyMv", "czgEpzZ3FbtxfhcR"], "itemQty": {"C7IVYa6iZ5uFRYNn": 44, "SHiWxF0YbuU5ar5q": 94, "1dMQ9Rrbk6C2cVWf": 89}, "itemType": "EXTENSION", "listable": true, "localizations": {"491e94mQjVOOBnIW": {"description": "hunElqZUodp3IhtC", "localExt": {"SHy1ei1fIrPvfHnR": {}, "N06EjRwEQlNapJRf": {}, "k4f9Zcw1pEHAyNFx": {}}, "longDescription": "cVTKuAQTGh5BxjWO", "title": "ozGoDtsUuYo5p8ED"}, "5QZAufwNa8lzfjv9": {"description": "oYMXMjlVHY1AHwF3", "localExt": {"vGoav7MK0PcLnEkc": {}, "okKwcQ0baDT9OyJ2": {}, "h23GUS2amU7syGlE": {}}, "longDescription": "lXdEAOrVSnLocLVV", "title": "YamQc4wcG5nDBLJo"}, "JHbiQ5duE5p4cfs2": {"description": "E41cK8QTwiIAvxSv", "localExt": {"NDlmM5nQFMGzs7fz": {}, "jgyc44mEh9tRk8kn": {}, "YSV30lnroQehMDli": {}}, "longDescription": "6t9unQLYXxm09wpG", "title": "AbpEmDY9vLh3u6ED"}}, "lootBoxConfig": {"rewardCount": 38, "rewards": [{"lootBoxItems": [{"count": 35, "duration": 96, "endDate": "1998-04-04T00:00:00Z", "itemId": "Q2Qd2JzRbkF2I03d", "itemSku": "IjvBbA6bfbYaJCJj", "itemType": "fk2TUvn95FhO7VW3"}, {"count": 25, "duration": 3, "endDate": "1987-09-02T00:00:00Z", "itemId": "loFSKWM1eym5ydC6", "itemSku": "p25xCWTqUOYZENJ1", "itemType": "QHZQxPRXH7uxBJEE"}, {"count": 59, "duration": 87, "endDate": "1977-09-05T00:00:00Z", "itemId": "Q5iZgbwwm5iGzXtc", "itemSku": "knrgidKupvXO6aj4", "itemType": "hCmTC34jxW4pIDwd"}], "name": "qXpmRmut9H9XyWI8", "odds": 0.029202859955488547, "type": "REWARD", "weight": 4}, {"lootBoxItems": [{"count": 11, "duration": 86, "endDate": "1996-07-04T00:00:00Z", "itemId": "338HS6CBgVRyihYN", "itemSku": "Z84CVhziXV8HwSmv", "itemType": "cvcDKF19yVRafCjO"}, {"count": 42, "duration": 44, "endDate": "1994-05-15T00:00:00Z", "itemId": "Yht83AdvBaagTiRJ", "itemSku": "8daGTVX3Bb7jlz5I", "itemType": "fHgKjI9mwJSrN8jk"}, {"count": 70, "duration": 50, "endDate": "1992-03-26T00:00:00Z", "itemId": "xLv9HBEUe89AwEw1", "itemSku": "HO4FnKtx4XLKAmlD", "itemType": "r19uJ3nq6VerzVCc"}], "name": "I8y3Cz0YqCKUh5RD", "odds": 0.9916935737880038, "type": "REWARD", "weight": 15}, {"lootBoxItems": [{"count": 81, "duration": 55, "endDate": "1986-05-09T00:00:00Z", "itemId": "p2SoiIPp1yvfAHS0", "itemSku": "VgLu11A3HTovFi4t", "itemType": "PAGfleyCA6jEtcqs"}, {"count": 27, "duration": 68, "endDate": "1984-01-16T00:00:00Z", "itemId": "oVILjkwW61duF87a", "itemSku": "Uyrdt4XSpWBAetsa", "itemType": "nzqP8oxfrtbECD1C"}, {"count": 86, "duration": 87, "endDate": "1982-01-03T00:00:00Z", "itemId": "AxJrINPXppPNO3Af", "itemSku": "mXcgwC3IN6tvKgLB", "itemType": "9QmJIOq9dP5szG71"}], "name": "utjsQ4CrRb9gUCeV", "odds": 0.4162945793236844, "type": "REWARD_GROUP", "weight": 11}], "rollFunction": "DEFAULT"}, "maxCount": 3, "maxCountPerUser": 100, "name": "ZIdhevfZvyV7Acod", "optionBoxConfig": {"boxItems": [{"count": 5, "duration": 54, "endDate": "1997-06-28T00:00:00Z", "itemId": "t2ENKKWrFtHIi1CM", "itemSku": "gKAOG5iDcCR5PbCv", "itemType": "DLil8wj9cKM3Ar6M"}, {"count": 65, "duration": 31, "endDate": "1999-11-21T00:00:00Z", "itemId": "5hCER4nGmWGgTJfH", "itemSku": "lJl4tHGa4XfZcd9C", "itemType": "VnGqMX9FieeEssWE"}, {"count": 96, "duration": 79, "endDate": "1977-06-20T00:00:00Z", "itemId": "7bhwntCVqiYOJf5K", "itemSku": "wMZQjzvjSozv6CTR", "itemType": "Dl0zp9CzHFwinkBN"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 13, "fixedTrialCycles": 68, "graceDays": 44}, "regionData": {"BDdSzBXdxapwhd5I": [{"currencyCode": "QYBQuxLvPuWYvE3f", "currencyNamespace": "sNy9Z9OhxXvCp9y7", "currencyType": "REAL", "discountAmount": 23, "discountExpireAt": "1990-09-01T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1998-11-02T00:00:00Z", "expireAt": "1979-12-11T00:00:00Z", "price": 11, "purchaseAt": "1985-08-21T00:00:00Z", "trialPrice": 38}, {"currencyCode": "XnlUnqxT1WsRNMZc", "currencyNamespace": "A92hzC7MNa8vVe4M", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1989-02-19T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1990-06-23T00:00:00Z", "expireAt": "1973-10-10T00:00:00Z", "price": 31, "purchaseAt": "1978-04-12T00:00:00Z", "trialPrice": 96}, {"currencyCode": "AyyUJyAK5PRMRMwd", "currencyNamespace": "vl0hv6g62GxBW2tQ", "currencyType": "VIRTUAL", "discountAmount": 9, "discountExpireAt": "1976-11-11T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1980-02-24T00:00:00Z", "expireAt": "1992-10-17T00:00:00Z", "price": 5, "purchaseAt": "1971-11-19T00:00:00Z", "trialPrice": 44}], "YvNQOsDa4bkcgepq": [{"currencyCode": "txjbrztee7QLTGAa", "currencyNamespace": "k7Kaol01DK97D2xn", "currencyType": "REAL", "discountAmount": 6, "discountExpireAt": "1976-10-11T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1999-07-23T00:00:00Z", "expireAt": "1977-09-25T00:00:00Z", "price": 17, "purchaseAt": "1993-06-09T00:00:00Z", "trialPrice": 19}, {"currencyCode": "eR5eQAe1rzmmgqBP", "currencyNamespace": "Rmd6mO4oI8KDqebm", "currencyType": "VIRTUAL", "discountAmount": 67, "discountExpireAt": "1971-11-18T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1983-08-10T00:00:00Z", "expireAt": "1999-10-12T00:00:00Z", "price": 31, "purchaseAt": "1974-07-25T00:00:00Z", "trialPrice": 92}, {"currencyCode": "7axEkvI4oxZEDxGi", "currencyNamespace": "BnNbn0zaf7CaOSlH", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1989-11-18T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1979-05-29T00:00:00Z", "expireAt": "1991-11-04T00:00:00Z", "price": 74, "purchaseAt": "1990-07-29T00:00:00Z", "trialPrice": 55}], "IwEsdOGBXBwnzDX8": [{"currencyCode": "v3xgC1Ge9PdbTTAJ", "currencyNamespace": "2Gp1r0sVZ6LJAOdd", "currencyType": "VIRTUAL", "discountAmount": 98, "discountExpireAt": "1976-01-27T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1992-04-12T00:00:00Z", "expireAt": "1975-09-02T00:00:00Z", "price": 81, "purchaseAt": "1972-08-30T00:00:00Z", "trialPrice": 96}, {"currencyCode": "Kv2LWfXqjr8fS79E", "currencyNamespace": "n3wYowBdkaZ3y6i3", "currencyType": "REAL", "discountAmount": 78, "discountExpireAt": "1982-08-27T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1993-12-04T00:00:00Z", "expireAt": "1979-03-28T00:00:00Z", "price": 48, "purchaseAt": "1978-03-17T00:00:00Z", "trialPrice": 18}, {"currencyCode": "1LyEirURERnEMzpI", "currencyNamespace": "mW6sjAHyCK5tNanG", "currencyType": "VIRTUAL", "discountAmount": 47, "discountExpireAt": "1980-03-25T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1975-10-04T00:00:00Z", "expireAt": "1981-09-17T00:00:00Z", "price": 5, "purchaseAt": "1976-10-09T00:00:00Z", "trialPrice": 93}]}, "saleConfig": {"currencyCode": "xTtmOFMebS4AdlNz", "price": 46}, "seasonType": "PASS", "sectionExclusive": true, "sellable": false, "sku": "F5m77TTh4gUoj8u2", "stackable": false, "status": "INACTIVE", "tags": ["fnBAk0CwiAsR65yQ", "Y48F1dl1q92m3iRl", "LiEtzVlnkflfn7pH"], "targetCurrencyCode": "9ssuHdGmxncCEr0K", "targetNamespace": "cgeqzGbruNB72HHM", "thumbnailUrl": "kjzyBB4UFKiaoV0V", "useCount": 82}' \
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
    --body '{"appId": "4acYHbrryHB6GO9z", "appType": "DLC", "baseAppId": "3FaepA3b3YJ9nJM6", "boothName": "vtT27xv85K5MU2qm", "categoryPath": "beqaVemINdClpF7O", "clazz": "vlBIEgjse5kd6GED", "displayOrder": 29, "entitlementType": "CONSUMABLE", "ext": {"08yq5E5HleLoog4m": {}, "e2NBFp62xlXvVcJe": {}, "rTPW02PWsHiKYArA": {}}, "features": ["QIyLarjaLOKnX51y", "0DjjwMv4vrIPRtvh", "xnKBfBfDlrQQuAc1"], "flexible": true, "images": [{"as": "PykS8YLmwtYgWGcA", "caption": "0h4G1LZ1HaX5UBMb", "height": 37, "imageUrl": "X1B9oVuzG2CnYX2Y", "smallImageUrl": "BF2g7TVtzYEHUodh", "width": 28}, {"as": "iUfBthbepUCTWiZ1", "caption": "uqh7GAi4FEIu44u8", "height": 45, "imageUrl": "ZLRxYlYqlpq03BGd", "smallImageUrl": "Ik4oEogFVGR71rJO", "width": 57}, {"as": "iA0tQWlHwBcTtztx", "caption": "3VAl6tXFbnATCzUO", "height": 70, "imageUrl": "WmKgE8CZ4AELr5lr", "smallImageUrl": "aa5v5P5Cj8hgFsqH", "width": 59}], "itemIds": ["adEoIVmprwPsa9YD", "92CX0rITajpwHITG", "eHTnqRbzBB9ZFgJb"], "itemQty": {"Q3Fj1umx4ItzkMJ7": 5, "YsHooOIaxIpb1cIO": 72, "VIQvRkQJAtDUH9tx": 53}, "itemType": "BUNDLE", "listable": true, "localizations": {"hGz1ermJYXsYgL7T": {"description": "fyIlAwjTZdRZJJzW", "localExt": {"ZwvTX2bamSCvX1nw": {}, "vSWdDwD7WJHzgNZU": {}, "KsI5y0mR3zMyTsft": {}}, "longDescription": "KqnsIJctAdxyZVKH", "title": "A9DkaSOWgtg8yw8l"}, "HEbVDwBAqanOlscR": {"description": "IWw82k5K5VTkdubk", "localExt": {"OFldMCQ98JH4n0Jt": {}, "gqzZv5kVu4S95mj8": {}, "YRvae4f4lhBPbarb": {}}, "longDescription": "WEm8bVtZcfVCPdQh", "title": "im9QKUAFTVYelIlG"}, "Jg9wdc8bihhWjfZp": {"description": "fcFBUsnnDJlmD1iE", "localExt": {"okbUiYzCQh2iNTwt": {}, "nohddMzMTQ9P7sYL": {}, "DWAJOA75K4BYJ2fk": {}}, "longDescription": "qYJoF2FI3vyyqRzc", "title": "20O7FdsJP1G9tyBT"}}, "lootBoxConfig": {"rewardCount": 12, "rewards": [{"lootBoxItems": [{"count": 29, "duration": 62, "endDate": "1974-12-25T00:00:00Z", "itemId": "KzuMYDUTLBeCidXj", "itemSku": "uGgx8ncXejmeZtzT", "itemType": "0qj0ltsqfiZrthVv"}, {"count": 49, "duration": 98, "endDate": "1996-08-18T00:00:00Z", "itemId": "0OCKDJE3RMUddwSS", "itemSku": "gxCu8zru1DhGAYOH", "itemType": "R5BWa9VzIkaQEl1i"}, {"count": 95, "duration": 8, "endDate": "1992-10-30T00:00:00Z", "itemId": "roNB6hI6IpGcToWg", "itemSku": "FvdRhG9NwV3zDuqV", "itemType": "lVTypcYPK8IxrSZu"}], "name": "xWl0Je4fJIyFAm3D", "odds": 0.6841347009700219, "type": "PROBABILITY_GROUP", "weight": 89}, {"lootBoxItems": [{"count": 40, "duration": 54, "endDate": "1989-01-10T00:00:00Z", "itemId": "wnPS2urJqerobWMZ", "itemSku": "GVL5KLTxahWlS6Xd", "itemType": "BaKSLCgOOPXM6XTU"}, {"count": 15, "duration": 72, "endDate": "1999-03-31T00:00:00Z", "itemId": "dJ90yqHDNacl4F9G", "itemSku": "6Dl5TFwBY6HKXAbl", "itemType": "kT8VGgSH8MGZGwiV"}, {"count": 19, "duration": 33, "endDate": "1973-09-04T00:00:00Z", "itemId": "RLaA643nTMtXSAye", "itemSku": "jnny0Ju13b6o5uB2", "itemType": "XM6IHy7EEvHyLmcv"}], "name": "rZZOdwe1x8RjU6Bi", "odds": 0.9781327863012951, "type": "REWARD_GROUP", "weight": 10}, {"lootBoxItems": [{"count": 71, "duration": 63, "endDate": "1987-03-09T00:00:00Z", "itemId": "2sUBBq2SimQQoLbe", "itemSku": "5YOJvxGRxUzrTwag", "itemType": "H7BMT1IZKTdNFVBQ"}, {"count": 55, "duration": 4, "endDate": "1983-05-20T00:00:00Z", "itemId": "2JTllJkRGB8jqJEd", "itemSku": "6eqqsBVyONV0JRto", "itemType": "zI0jpliCFQ6WgJpG"}, {"count": 84, "duration": 18, "endDate": "1981-02-18T00:00:00Z", "itemId": "BYeQZOzATNSV9E9y", "itemSku": "yNb7yaLXzAVYymOu", "itemType": "hCkZu4htrsf8eIFS"}], "name": "ovTGXaMsq8ePN1oc", "odds": 0.23324146460862305, "type": "REWARD_GROUP", "weight": 20}], "rollFunction": "CUSTOM"}, "maxCount": 48, "maxCountPerUser": 5, "name": "Upe8SjMvpqM8pugg", "optionBoxConfig": {"boxItems": [{"count": 83, "duration": 63, "endDate": "1976-01-30T00:00:00Z", "itemId": "9iCqfW6rqGOQny4i", "itemSku": "j4ysYPonb59gQffk", "itemType": "NOmubxEJr2qEAuJb"}, {"count": 32, "duration": 44, "endDate": "1997-09-02T00:00:00Z", "itemId": "Srcbc4LWfKaY5c1t", "itemSku": "P5TDuI5f6m4KC07C", "itemType": "nsZe32hqEcB1ExYM"}, {"count": 56, "duration": 3, "endDate": "1997-11-26T00:00:00Z", "itemId": "ckvoaJYdMqGegcg3", "itemSku": "eRvBZXN3cjIXmFWR", "itemType": "Jnj8xN7HDPTUEDPN"}]}, "purchasable": false, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 94, "fixedTrialCycles": 16, "graceDays": 84}, "regionData": {"C9ZDj4E4mv12FNXy": [{"currencyCode": "poOLl13j84P0Kqir", "currencyNamespace": "J4PkMFtsnFfz8Ew0", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1973-08-17T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1981-04-12T00:00:00Z", "expireAt": "1985-12-10T00:00:00Z", "price": 91, "purchaseAt": "1987-10-29T00:00:00Z", "trialPrice": 0}, {"currencyCode": "LSQ4GvLtz50D3rpB", "currencyNamespace": "fBovqLwXBuT30EYe", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1997-06-17T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1985-09-20T00:00:00Z", "expireAt": "1993-02-25T00:00:00Z", "price": 1, "purchaseAt": "1982-08-16T00:00:00Z", "trialPrice": 72}, {"currencyCode": "KoUfiHjGmCyPsKCJ", "currencyNamespace": "Tv1ic9gvagF2cSuz", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1980-03-21T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1993-06-07T00:00:00Z", "expireAt": "1981-03-17T00:00:00Z", "price": 39, "purchaseAt": "1984-02-19T00:00:00Z", "trialPrice": 79}], "V7nmDk29mcjSuz9v": [{"currencyCode": "bNStqPtQmQN6eKAG", "currencyNamespace": "iZFCftT0RWECdjWY", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1977-11-19T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1980-04-02T00:00:00Z", "expireAt": "1972-07-11T00:00:00Z", "price": 30, "purchaseAt": "1972-02-16T00:00:00Z", "trialPrice": 57}, {"currencyCode": "wYLQcDvkaEIIPoJT", "currencyNamespace": "83zEGXmVBZLyrH9J", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1978-07-21T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1998-04-10T00:00:00Z", "expireAt": "1979-01-06T00:00:00Z", "price": 83, "purchaseAt": "1987-12-26T00:00:00Z", "trialPrice": 55}, {"currencyCode": "LkP5hc2Fh04JTsqD", "currencyNamespace": "TynCewqJligLlRxO", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1976-03-08T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1972-07-26T00:00:00Z", "expireAt": "1996-03-25T00:00:00Z", "price": 70, "purchaseAt": "1996-08-16T00:00:00Z", "trialPrice": 51}], "RxF6HtlER2txs4qr": [{"currencyCode": "NARATn6KXOutlYBb", "currencyNamespace": "LhL8KXx25FZfQIod", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1982-05-17T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1992-02-07T00:00:00Z", "expireAt": "1980-08-10T00:00:00Z", "price": 22, "purchaseAt": "1979-12-05T00:00:00Z", "trialPrice": 59}, {"currencyCode": "y0fGvTGgfLKsg0b1", "currencyNamespace": "Bq78cE5O5pmPnbiP", "currencyType": "REAL", "discountAmount": 1, "discountExpireAt": "1976-04-18T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1982-12-26T00:00:00Z", "expireAt": "1983-04-11T00:00:00Z", "price": 2, "purchaseAt": "1979-10-02T00:00:00Z", "trialPrice": 24}, {"currencyCode": "3rVaauufxkPHElug", "currencyNamespace": "48TgfNu0rqXUOyTo", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1994-09-02T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1976-10-12T00:00:00Z", "expireAt": "1986-10-27T00:00:00Z", "price": 94, "purchaseAt": "1977-07-19T00:00:00Z", "trialPrice": 72}]}, "saleConfig": {"currencyCode": "Pl3dKF7NXEjrJMki", "price": 67}, "seasonType": "PASS", "sectionExclusive": true, "sellable": true, "sku": "bADMfuOmh0lciRhV", "stackable": false, "status": "INACTIVE", "tags": ["KqxJiFJdrmj5vhzg", "sJwex7wq8ZPlXNaU", "NgdY2vfJuje5cPnm"], "targetCurrencyCode": "GjTvYa5Pqx1K7qcA", "targetNamespace": "oijBPAp6EPb988Nz", "thumbnailUrl": "xrDKVpULjjiw3NeV", "useCount": 66}' \
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
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 85, "comparison": "isGreaterThanOrEqual", "name": "yhqFJkDClOsKmfsg", "predicateType": "SeasonTierPredicate", "value": "VLMlHi8i9gOVqajU", "values": ["WrgEsWDtaKzn8dZw", "nnGeZsZVgbPzPFbr", "OMZMgWkFN7Tpkx6G"]}, {"anyOf": 5, "comparison": "includes", "name": "XTrFibRAhzzEWzWl", "predicateType": "SeasonTierPredicate", "value": "dW2JKmQafUs2bxYz", "values": ["lg7gYs6unPYQ9jNQ", "tOEyVbKIf1ZbzgUw", "d8DHoCQykmXHYmkR"]}, {"anyOf": 81, "comparison": "isLessThan", "name": "1di1ldhOh6HvjnYu", "predicateType": "EntitlementPredicate", "value": "NfC4A2ODiZhbfb8Q", "values": ["mnq3FGQn3Ahu5wxq", "qCyK1XH9D6vl5eFd", "FfgK46GjCWaP8huT"]}]}, {"operator": "and", "predicates": [{"anyOf": 30, "comparison": "isLessThan", "name": "Jq4mChmQHQhO9IKB", "predicateType": "EntitlementPredicate", "value": "DFQfXFD58sG6uDhF", "values": ["YlrzJBYSeMuJfQec", "utjS029BiJWOG1m7", "MKclr5igjNTVItrH"]}, {"anyOf": 66, "comparison": "isGreaterThan", "name": "hxJgaVfw5Vnyq8Oz", "predicateType": "SeasonTierPredicate", "value": "c6VbE0AGcekjMNHu", "values": ["t1g0GGbT4Hf2PPKO", "uyDoN91uc28HoSpG", "PXtz8tXxrmzafMUg"]}, {"anyOf": 23, "comparison": "excludes", "name": "GGvi9kg3rMIzNmhJ", "predicateType": "SeasonTierPredicate", "value": "eg9q86IaDFjjx6uZ", "values": ["E8lOLAfTXKLzbrdd", "erWbtwTX9gNRByjb", "qcKLa7LevxNHOSEh"]}]}, {"operator": "and", "predicates": [{"anyOf": 23, "comparison": "isGreaterThan", "name": "p693lRwtc43atCuC", "predicateType": "SeasonTierPredicate", "value": "X4yFQFdrRoM6FoqC", "values": ["Sck3ggZWJlSlCQMD", "Yw7AlxO6qdFpc71s", "ji329PfVrvMEPtps"]}, {"anyOf": 90, "comparison": "isGreaterThan", "name": "NcpK1QkB2Sy8Ww79", "predicateType": "SeasonTierPredicate", "value": "HuGz3b5WAEvdRF9b", "values": ["7OydVw0zCqoMZvpI", "OO97DmQ5ZOzx6iCJ", "qMj4ro5B19VE838c"]}, {"anyOf": 93, "comparison": "isLessThanOrEqual", "name": "u60IifzMhkk5Pxsj", "predicateType": "SeasonPassPredicate", "value": "7VbBPUWipz9C05Ya", "values": ["tER1qdTelFAadM9y", "aO3yJpA3KMxBlrRy", "bFX4FCK5ucTFsAFz"]}]}]}}' \
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
    --sortBy 'rewardCode,rewardCode:asc' \
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
    --sortBy 'createdAt:asc,updatedAt,updatedAt:desc' \
    --status 'UNPUBLISHED' \
    --type 'VIEW' \
    --updatedAtEnd 'euZh5qtrRbNnGejd' \
    --updatedAtStart 'TGvZgN5hshSe5YmZ' \
    --withTotal  \
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

#- 194 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oq8HP1TM0tefVQPW' \
    --action 'UPDATE' \
    --itemSku '1NPO5Wn7rNG8rGp7' \
    --itemType 'OPTIONBOX' \
    --selected  \
    --type 'CATEGORY' \
    --updatedAtEnd 'advo5EzpX0IttsRe' \
    --updatedAtStart 'zyY9GB5sf94ALBmv' \
    > test.out 2>&1
eval_tap $? 194 'SelectAllRecordsByCriteria' test.out

#- 195 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dncQkcZb8cWdVH9b' \
    --action 'DELETE' \
    --itemSku 'Izg8pbjnt1iBV8Dp' \
    --itemType 'APP' \
    --type 'ITEM' \
    --updatedAtEnd 'B96ndlO6iPGC9Rhz' \
    --updatedAtStart 'MC7V8BEphnRXnSpC' \
    > test.out 2>&1
eval_tap $? 195 'GetStatistic' test.out

#- 196 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zyb8FkoxQbrPngi8' \
    > test.out 2>&1
eval_tap $? 196 'UnselectAllRecords' test.out

#- 197 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId '7K58pQswqKLutINu' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sOsa92F6iwkJIYOL' \
    > test.out 2>&1
eval_tap $? 197 'SelectRecord' test.out

#- 198 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'armpWyvib9CDW21A' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NrlpuXD9H1u1CvzW' \
    > test.out 2>&1
eval_tap $? 198 'UnselectRecord' test.out

#- 199 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PcZwkj1l6bf2F9EX' \
    --targetStoreId 'OBj7v8LHYivmD0ek' \
    > test.out 2>&1
eval_tap $? 199 'CloneStore' test.out

#- 200 ExportStore
eval_tap 0 200 'ExportStore # SKIP deprecated' test.out

#- 201 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'ahppgxJhk4EdTZ00' \
    --limit '53' \
    --offset '36' \
    --sku 'D7ZZx1iefATWcDSq' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    --userId 'L5dREQbCqfh0gpAB' \
    > test.out 2>&1
eval_tap $? 201 'QuerySubscriptions' test.out

#- 202 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'FBER6WNcDOsRzBkf' \
    > test.out 2>&1
eval_tap $? 202 'RecurringChargeSubscription' test.out

#- 203 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName '9A6HjCnFRdSihcvs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 203 'GetTicketDynamic' test.out

#- 204 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'zzQLZBktk0siMup0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "1kyaFwwD7wecuQb4"}' \
    > test.out 2>&1
eval_tap $? 204 'DecreaseTicketSale' test.out

#- 205 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'GNQHVZMKGBnzh4su' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 205 'GetTicketBoothID' test.out

#- 206 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'aGIzttTncVBf5g3o' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 9, "orderNo": "GWKpItMt4GszRufk"}' \
    > test.out 2>&1
eval_tap $? 206 'IncreaseTicketSale' test.out

#- 207 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Steam", "count": 92, "currencyCode": "FLYyNBPlMrkse9SG", "expireAt": "1972-02-16T00:00:00Z"}, "debitPayload": {"count": 78, "currencyCode": "MAvvpkAHRJHZyfrX", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 87, "itemIdentity": "iJX4CjKCeIRIr997", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 76, "entitlementId": "cLJW9eTJvKNDFrx6"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Epic", "count": 3, "currencyCode": "fjNMZjKJ05puX319", "expireAt": "1994-05-21T00:00:00Z"}, "debitPayload": {"count": 89, "currencyCode": "MnJtovSMFw8X4zxb", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 93, "itemIdentity": "fXgunt1oMNZ68eov", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 95, "entitlementId": "xV3URIRVDYBd6hMB"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 13, "currencyCode": "7sg7IfMH5Tu1ky1Z", "expireAt": "1997-11-23T00:00:00Z"}, "debitPayload": {"count": 43, "currencyCode": "cLtZw0efmEVcW7mx", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 3, "itemIdentity": "S5UOoICxQMit8555", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 18, "entitlementId": "X4Kpi8CJ88aMPGFF"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "RWvLRy58UKWPv3F7"}, {"operations": [{"creditPayload": {"balanceOrigin": "IOS", "count": 20, "currencyCode": "wCVlYQi9cfMCeNnu", "expireAt": "1999-11-27T00:00:00Z"}, "debitPayload": {"count": 70, "currencyCode": "tCwv8H1f451FVZ63", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 58, "itemIdentity": "NBYZSrz7pMjESLLM", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 75, "entitlementId": "aqwH9J6JLb5f3SBM"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 20, "currencyCode": "UdwEBRrHAWUFqToo", "expireAt": "1987-10-20T00:00:00Z"}, "debitPayload": {"count": 66, "currencyCode": "HNffZENs9X0hFMdz", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 82, "itemIdentity": "yvhc1YjHmmulSBIE", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 32, "entitlementId": "c2CdRvBb0aGnMt62"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "System", "count": 99, "currencyCode": "IuPLFAtcWhjAP57Q", "expireAt": "1971-12-05T00:00:00Z"}, "debitPayload": {"count": 99, "currencyCode": "tHlzXNHEPpzlMlx7", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 89, "itemIdentity": "2H2THLwZGikW7TFA", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 12, "entitlementId": "qUITBHQR5ISNoFR3"}, "type": "CREDIT_WALLET"}], "userId": "UxdMuvmL0UBfwzaa"}, {"operations": [{"creditPayload": {"balanceOrigin": "GooglePlay", "count": 79, "currencyCode": "P3Wd0Wrb8s3GW0CY", "expireAt": "1998-06-23T00:00:00Z"}, "debitPayload": {"count": 40, "currencyCode": "Afbq8xoCurq4lpHX", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 90, "itemIdentity": "bVBh60NUA2aKQwnX", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 20, "entitlementId": "mi6ya8u4sQPvaf1A"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 46, "currencyCode": "qCjlwrmsSRV86iic", "expireAt": "1998-10-06T00:00:00Z"}, "debitPayload": {"count": 65, "currencyCode": "zIpUM8KK1kGFN0NU", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 66, "itemIdentity": "k51kOTJZluTekDMC", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 83, "entitlementId": "ERxNg8djSb4Vt2vK"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Other", "count": 24, "currencyCode": "TnsZioDiBgprzahP", "expireAt": "1985-08-25T00:00:00Z"}, "debitPayload": {"count": 65, "currencyCode": "M0dgozmco41750xd", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 88, "itemIdentity": "eePkqg6Zt1Lr5BlO", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 69, "entitlementId": "mTKOlDOy5vhSkxER"}, "type": "CREDIT_WALLET"}], "userId": "2AQ1jvXYBar5RMmm"}], "metadata": {"GdWl0wpj5tVfKU3D": {}, "8WVPh0Z7YiGE2cyz": {}, "TMBY7Xd0OoENg2Lw": {}}, "needPreCheck": false, "transactionId": "uepmahXojVZYz2zM", "type": "U9jLzNV3GaG43R6n"}' \
    > test.out 2>&1
eval_tap $? 207 'Commit' test.out

#- 208 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '14' \
    --status 'SUCCESS' \
    --type 'HSka0Pz7I1WkIa0o' \
    --userId 'Z1nXpW1l70pcZgIn' \
    > test.out 2>&1
eval_tap $? 208 'GetTradeHistoryByCriteria' test.out

#- 209 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId '4lPghHyMEHBzArby' \
    > test.out 2>&1
eval_tap $? 209 'GetTradeHistoryByTransactionId' test.out

#- 210 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'W10NkJFQxuMHnfOl' \
    --body '{"achievements": [{"id": "X6HYVEiaereFCPJU", "value": 43}, {"id": "wEzUYUTmZ8JSMeNm", "value": 88}, {"id": "yHC9eKeXzrvzBllw", "value": 53}], "steamUserId": "EI22BTCZs97TJI8G"}' \
    > test.out 2>&1
eval_tap $? 210 'UnlockSteamUserAchievement' test.out

#- 211 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'PrM24F3celFgM62H' \
    --xboxUserId 'QtgzQhO3nR8j8DlP' \
    > test.out 2>&1
eval_tap $? 211 'GetXblUserAchievements' test.out

#- 212 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '6OGbn8vmfMYGLt1A' \
    --body '{"achievements": [{"id": "jKhh3JMX7xSrz1EH", "percentComplete": 56}, {"id": "X2SM3xzsNrJzWBcd", "percentComplete": 64}, {"id": "TzKjsCqxx24QM35b", "percentComplete": 92}], "serviceConfigId": "5rTfiL2P3r1a8KIJ", "titleId": "H33aKkPuWD59MgTy", "xboxUserId": "1HA58Jt5NaROjSKF"}' \
    > test.out 2>&1
eval_tap $? 212 'UpdateXblUserAchievement' test.out

#- 213 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'EuZo2ElXYSS4ezBR' \
    > test.out 2>&1
eval_tap $? 213 'AnonymizeCampaign' test.out

#- 214 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'SiOyReviDaxlPdhw' \
    > test.out 2>&1
eval_tap $? 214 'AnonymizeEntitlement' test.out

#- 215 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'mcH03yoMxzRR6xd9' \
    > test.out 2>&1
eval_tap $? 215 'AnonymizeFulfillment' test.out

#- 216 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'rTh3ureaIbxM3Wev' \
    > test.out 2>&1
eval_tap $? 216 'AnonymizeIntegration' test.out

#- 217 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '9pZQjWAN0tny16ZH' \
    > test.out 2>&1
eval_tap $? 217 'AnonymizeOrder' test.out

#- 218 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZtuSJGQCrM7JEMRP' \
    > test.out 2>&1
eval_tap $? 218 'AnonymizePayment' test.out

#- 219 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'kdTcAzkIlndN5xea' \
    > test.out 2>&1
eval_tap $? 219 'AnonymizeRevocation' test.out

#- 220 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'yr3vUKMuIiz2MiAA' \
    > test.out 2>&1
eval_tap $? 220 'AnonymizeSubscription' test.out

#- 221 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'KcvAXnxnH0QIhoJR' \
    > test.out 2>&1
eval_tap $? 221 'AnonymizeWallet' test.out

#- 222 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y807VmBT4wZXQZZr' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 222 'GetUserDLCByPlatform' test.out

#- 223 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'suYiIPei0pXglJYn' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 223 'GetUserDLC' test.out

#- 224 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'krnHs1Iyhwqk140M' \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'APP' \
    --entitlementName 'lIrnlkRVbcX435TD' \
    --features 'Ypkk2Gza6DrSycop,hHw3EoEEClTO9SDK,nMlnKW9jiNMu9QVr' \
    --itemId 'MeD4bD8gISE34yIA,ZQeigiA3wBrmBYIl,ZeheP72AB8EO3Yrl' \
    --limit '50' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 224 'QueryUserEntitlements' test.out

#- 225 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Uk2tQm307IORTyHn' \
    --body '[{"endDate": "1990-10-01T00:00:00Z", "grantedCode": "YDAAg1YA4kZURmoG", "itemId": "gxVRMPf8g1rbhfIM", "itemNamespace": "StMnSqrKWYOuITlY", "language": "pVsA_lg", "quantity": 66, "region": "U5GKmcEKp8AQwqgJ", "source": "PROMOTION", "startDate": "1989-09-26T00:00:00Z", "storeId": "O0Qj0ccMkdz6zPz3"}, {"endDate": "1985-09-23T00:00:00Z", "grantedCode": "HAqp4O9XSjap24es", "itemId": "yjh6Wc3migf2n6iQ", "itemNamespace": "yr5cb5YL6fwBiaVP", "language": "UN", "quantity": 90, "region": "0T5uzlmi2NY26xrk", "source": "ACHIEVEMENT", "startDate": "1978-02-25T00:00:00Z", "storeId": "HBJX5ln8PZbYVD8R"}, {"endDate": "1975-01-02T00:00:00Z", "grantedCode": "o3dupUHNu8abrVVO", "itemId": "Kxr9Pa315FKDjG2A", "itemNamespace": "pSV94Jy6yCSXBqJq", "language": "Ab", "quantity": 98, "region": "dNvpWf32JS1av9VN", "source": "OTHER", "startDate": "1981-11-07T00:00:00Z", "storeId": "506ERSVy5M3rrkxu"}]' \
    > test.out 2>&1
eval_tap $? 225 'GrantUserEntitlement' test.out

#- 226 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '0U9h9gCNVZxHGxhZ' \
    --activeOnly  \
    --appId 'qNXJ6JXSh0Z3SWIS' \
    > test.out 2>&1
eval_tap $? 226 'GetUserAppEntitlementByAppId' test.out

#- 227 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 's1dYrJKmx1BT6iLF' \
    --activeOnly  \
    --limit '87' \
    --offset '9' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 227 'QueryUserEntitlementsByAppType' test.out

#- 228 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'dPuWeMEeL0EJG67g' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --itemId 'W1eAmDxP23qstMui' \
    > test.out 2>&1
eval_tap $? 228 'GetUserEntitlementByItemId' test.out

#- 229 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'kKc6VNU8570siWm3' \
    --ids 'V9sirE0JOQxWeHyp,qCWMDPRI2cCk8zHR,8VyCC0EQwE0cXokX' \
    > test.out 2>&1
eval_tap $? 229 'GetUserActiveEntitlementsByItemIds' test.out

#- 230 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'bwKDtVmrYQu7hZvH' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --sku 'jRevVYfiExpAgoK9' \
    > test.out 2>&1
eval_tap $? 230 'GetUserEntitlementBySku' test.out

#- 231 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'YDq1x3dkbJFDEBEO' \
    --appIds 'OvJ5BKeipIldsgB4,hOxb88WgKSLIpneD,QCfwucHRL3o2Nstr' \
    --itemIds 'L6TsJeRcE7GuwKn6,3KIDTkUCqbbHGJGO,TvKKRTHDntaFiufH' \
    --skus '2YR6QU7fj6w17arN,s12hOoLVM7UFnuJD,zeEkDxaVogxHrOon' \
    > test.out 2>&1
eval_tap $? 231 'ExistsAnyUserActiveEntitlement' test.out

#- 232 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '2OW4Zw5QwVKWNy2t' \
    --itemIds 'nF2MifJR4hr4gdJD,ujYnVnFK6gB6ZxC6,yYUVUJYnQ3jOGmRO' \
    > test.out 2>&1
eval_tap $? 232 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 233 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'IqxqQ0gcNeTflyvU' \
    --appId 'h3w5ZtfwmOCKpFSM' \
    > test.out 2>&1
eval_tap $? 233 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 234 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'F0tfGIZCTNiIRc9f' \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'fO9MnoT3t99Hmcxz' \
    > test.out 2>&1
eval_tap $? 234 'GetUserEntitlementOwnershipByItemId' test.out

#- 235 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'jDhTrcBKtU956hOg' \
    --ids '8oukDVdweG0sFHxT,Ha2k60SzCqUgq1gL,bcIMevTmC631p7q7' \
    > test.out 2>&1
eval_tap $? 235 'GetUserEntitlementOwnershipByItemIds' test.out

#- 236 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '94bu49lINFTtERAX' \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'yWN2BCnRz9w2nur0' \
    > test.out 2>&1
eval_tap $? 236 'GetUserEntitlementOwnershipBySku' test.out

#- 237 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'B9jKaunAcylsau7w' \
    > test.out 2>&1
eval_tap $? 237 'RevokeAllEntitlements' test.out

#- 238 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'RQmL4i3eRyIECEDa' \
    --entitlementIds '1I4lwXqwPfq3VzHQ' \
    > test.out 2>&1
eval_tap $? 238 'RevokeUserEntitlements' test.out

#- 239 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'jtolx64w1gyvjacK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tGqxMnoAXRlcq0mY' \
    > test.out 2>&1
eval_tap $? 239 'GetUserEntitlement' test.out

#- 240 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'WKQYlqMmu2pvF6rP' \
    --namespace "$AB_NAMESPACE" \
    --userId '03bQaq1cT88H6RCW' \
    --body '{"endDate": "1971-02-28T00:00:00Z", "nullFieldList": ["rtYvLh56AWXoMiow", "dWSs9DQ0VU1HED9C", "Go9aUXj3rh0UyqxV"], "startDate": "1995-05-25T00:00:00Z", "status": "CONSUMED", "useCount": 55}' \
    > test.out 2>&1
eval_tap $? 240 'UpdateUserEntitlement' test.out

#- 241 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'IMY5tTJw4KV104Mt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MhKHmSjqPuQZX5Kj' \
    --body '{"options": ["dNrEwfWo2MwulLg4", "bsO4YHEYLjTSNDf3", "zazm6p5Y1tkG9WwU"], "requestId": "4Ty6Ch5QYyFjuBqu", "useCount": 63}' \
    > test.out 2>&1
eval_tap $? 241 'ConsumeUserEntitlement' test.out

#- 242 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'cu39YZJypWzpNXgn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oKIz8O8NglJtZTh2' \
    > test.out 2>&1
eval_tap $? 242 'DisableUserEntitlement' test.out

#- 243 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId '80vflFMxIhlIT8Ag' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yZJ16MMd2bzOrTn2' \
    > test.out 2>&1
eval_tap $? 243 'EnableUserEntitlement' test.out

#- 244 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'huwPgyUzBUWiKoNG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tvyk5xEfrJDxKsw5' \
    > test.out 2>&1
eval_tap $? 244 'GetUserEntitlementHistories' test.out

#- 245 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'Xl7ZZrDZdbuvCFBa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VcohewKkVuGv9fQX' \
    > test.out 2>&1
eval_tap $? 245 'RevokeUserEntitlement' test.out

#- 246 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'kErF0drbYrrFQP6r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W62CtetBW3pvAJJi' \
    --body '{"reason": "eHhveGg97PY0txzv", "useCount": 84}' \
    > test.out 2>&1
eval_tap $? 246 'RevokeUserEntitlementByUseCount' test.out

#- 247 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'wv7atn9EQv2Oj8TF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NeGtJGjKbMgCeuAY' \
    --quantity '42' \
    > test.out 2>&1
eval_tap $? 247 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 248 RevokeUseCount
eval_tap 0 248 'RevokeUseCount # SKIP deprecated' test.out

#- 249 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'pKB8qoel2QK3aSOY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dmMDikc3Fjm9HoQD' \
    --body '{"requestId": "emtiQvURYZCeF30R", "useCount": 94}' \
    > test.out 2>&1
eval_tap $? 249 'SellUserEntitlement' test.out

#- 250 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'YaAdel3hHMSLAisc' \
    --body '{"duration": 67, "endDate": "1990-12-18T00:00:00Z", "itemId": "7FVDCBcvVegrZddP", "itemSku": "8lLQo6tHj4z4cAM4", "language": "LMJfWNZIxAgBpeub", "metadata": {"prKX68jTyRd3LrR1": {}, "x6U1v6zSLjm9zmzU": {}, "W0vPj90jmLTt5YQG": {}}, "order": {"currency": {"currencyCode": "awcomPoiYoQ1f1AY", "currencySymbol": "q306Pysv4VPaZWol", "currencyType": "VIRTUAL", "decimals": 43, "namespace": "pwucUqqqff2iWi4y"}, "ext": {"P3uqNcig6YcDA8Z3": {}, "g62oGYwkrjLI4EHJ": {}, "EEWgki9fbdvUMDZe": {}}, "free": false}, "orderNo": "4U55wdCpVpnENiTc", "origin": "Other", "overrideBundleItemQty": {"NESV22eRBElD4K2C": 50, "88UYgSV40OvY7apP": 59, "k100eu5UcxuXXpt0": 32}, "quantity": 91, "region": "w1zN0mOYgGhHMz9d", "source": "CONSUME_ENTITLEMENT", "startDate": "1971-02-01T00:00:00Z", "storeId": "dJeVCiKs2vLyH9kc"}' \
    > test.out 2>&1
eval_tap $? 250 'FulfillItem' test.out

#- 251 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'SBdk7MwQzn28Le5n' \
    --body '{"code": "eohqhCzroAzWQDve", "language": "hNpH-mBFT_qr", "region": "GUbSaA00nKxQjYU6"}' \
    > test.out 2>&1
eval_tap $? 251 'RedeemCode' test.out

#- 252 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'KlavIiLxU2I1GyJS' \
    --body '{"itemId": "48Hxu8Ju4XSAnlXR", "itemSku": "YB9BgSZBvkehRn83", "quantity": 56}' \
    > test.out 2>&1
eval_tap $? 252 'PreCheckFulfillItem' test.out

#- 253 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'L1KQn77hiP1lzkzj' \
    --body '{"metadata": {"YDw6mLBordrJkD6v": {}, "y60uRMT1Xw9K9Yb6": {}, "8a8ygYx2TqkhlqMn": {}}, "origin": "Steam", "rewards": [{"currency": {"currencyCode": "d3QzXhkrN4pWryt4", "namespace": "XTNwpp0ni1YfIgLZ"}, "item": {"itemId": "4YIzElrLZOBLHCKm", "itemSku": "LBaIwlokbAFW8RgB", "itemType": "UwBL28BqM8UzvKqe"}, "quantity": 30, "type": "CURRENCY"}, {"currency": {"currencyCode": "Sa2OULZ0iOZJiOAh", "namespace": "1SpLhMF2Pav11FuU"}, "item": {"itemId": "8iXCRz8KgqgwijYx", "itemSku": "pGhsFArq6lolbj7Q", "itemType": "KvtVRCPMjr5M3vw1"}, "quantity": 66, "type": "ITEM"}, {"currency": {"currencyCode": "Z4pgyJYwclb4gd4Q", "namespace": "gQut2hiPuDdOPHcN"}, "item": {"itemId": "9drwqytieXpIZfr5", "itemSku": "XDq9dGLHjtgE2bTX", "itemType": "JxCCFqPNDqWrpkWn"}, "quantity": 28, "type": "CURRENCY"}], "source": "ORDER_REVOCATION", "transactionId": "va15WVuE5cYVP9tQ"}' \
    > test.out 2>&1
eval_tap $? 253 'FulfillRewards' test.out

#- 254 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sa27BnPyq3I1BLtG' \
    --endTime 'EZDRNkk4DJUofJXK' \
    --limit '49' \
    --offset '89' \
    --productId 'H2qs28hePJjMp0TK' \
    --startTime 'KUBfPNI9f2oLWDPS' \
    --status 'FULFILLED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 254 'QueryUserIAPOrders' test.out

#- 255 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'kWa13g3pgHx6uPf6' \
    > test.out 2>&1
eval_tap $? 255 'QueryAllUserIAPOrders' test.out

#- 256 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'jQZcYerH933X7iXE' \
    --endTime 'EM2KOusNEHcI95GG' \
    --limit '8' \
    --offset '94' \
    --startTime 'JvucDbs6UdccuM2y' \
    --status 'FAIL' \
    --type 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 256 'QueryUserIAPConsumeHistory' test.out

#- 257 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '1ilfgff7Et4uY8nl' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "WDh-FwGB-471", "productId": "3NExUFipJsUiDawA", "region": "jgHFQk0VzWRNFNiU", "transactionId": "n2yXMSCcHADYpS86", "type": "STADIA"}' \
    > test.out 2>&1
eval_tap $? 257 'MockFulfillIAPItem' test.out

#- 258 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'c0CJ7LzpFvOSF6xK' \
    --itemId 'A6yrnvXY5dDwneac' \
    --limit '82' \
    --offset '58' \
    --status 'DELETED' \
    > test.out 2>&1
eval_tap $? 258 'QueryUserOrders' test.out

#- 259 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'S2eHsH4Y84hL75Qb' \
    --body '{"currencyCode": "oMHCtzEF9FSeg6WY", "currencyNamespace": "gtfuqJHrs4e3RnWR", "discountedPrice": 91, "ext": {"0MdBZezfwc3H0qSb": {}, "Mq4GLj8aGsH0qE5p": {}, "601ak59yFSfdZIv8": {}}, "itemId": "oYWPUS4Zu0SbTt6M", "language": "2XizikCh6q0yq2WA", "options": {"skipPriceValidation": true}, "platform": "Steam", "price": 70, "quantity": 65, "region": "WE3MFqvfDG5jvMOa", "returnUrl": "XrDlEX42U0syrGNh", "sandbox": true, "sectionId": "oCiHMD4iBK2O7qYt"}' \
    > test.out 2>&1
eval_tap $? 259 'AdminCreateUserOrder' test.out

#- 260 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'OHV5hnpjc5CNLnnE' \
    --itemId 'vo25aEtdjls5oads' \
    > test.out 2>&1
eval_tap $? 260 'CountOfPurchasedItem' test.out

#- 261 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'eJg7y4Q9CU3fjSRa' \
    --userId 'XD4HDmdvhMXxiKR2' \
    > test.out 2>&1
eval_tap $? 261 'GetUserOrder' test.out

#- 262 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo '9LKIhNU43K8bihdw' \
    --userId '3prp0UHlWUxkBefh' \
    --body '{"status": "FULFILL_FAILED", "statusReason": "hXZ7XLoWCGf0dZEe"}' \
    > test.out 2>&1
eval_tap $? 262 'UpdateUserOrderStatus' test.out

#- 263 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'XBd6mGG6SHcZbX2w' \
    --userId 'NnT6A9zosmDnXonc' \
    > test.out 2>&1
eval_tap $? 263 'FulfillUserOrder' test.out

#- 264 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'y7NZQ4PkAPXBCfkE' \
    --userId '1Fb0y94eP7yh0zsK' \
    > test.out 2>&1
eval_tap $? 264 'GetUserOrderGrant' test.out

#- 265 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hR60HZwUwk48XK7M' \
    --userId 'XHbEwAvvpEeHhXiJ' \
    > test.out 2>&1
eval_tap $? 265 'GetUserOrderHistories' test.out

#- 266 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'cJqYSxVKUYMimVLz' \
    --userId 'AP6aOzsTqEFXUhGA' \
    --body '{"additionalData": {"cardSummary": "wpYq1UqZydOB0MTh"}, "authorisedTime": "1996-12-29T00:00:00Z", "chargebackReversedTime": "1995-01-11T00:00:00Z", "chargebackTime": "1985-11-02T00:00:00Z", "chargedTime": "1997-07-01T00:00:00Z", "createdTime": "1998-01-18T00:00:00Z", "currency": {"currencyCode": "Thm9f4AWpyiKVT3O", "currencySymbol": "vEujx5yjtQSCJaOH", "currencyType": "VIRTUAL", "decimals": 68, "namespace": "pb623EciYoYOPVg6"}, "customParameters": {"DLEZ6DxpwBm2N8Pd": {}, "Q5mQaGXEbnmWR0H3": {}, "EkrHqaLNdfKszYZz": {}}, "extOrderNo": "Og113h6fIaHSx5bC", "extTxId": "lxUOBmMwv5pmiIVn", "extUserId": "hlLoMemsp7o3F2LQ", "issuedAt": "1982-07-14T00:00:00Z", "metadata": {"Y2VdSxgXez7VvS0C": "9JLVQQPa7PPx4Zi6", "WaC8wk7HMbJhNwZg": "f5nlMDORYuXnPNJg", "ayPFcyUnKXA3mcyM": "mX6WF8jtNAVOYqSH"}, "namespace": "533YlJ93CCGBXv4f", "nonceStr": "P4VPzhcH4UJrrCKv", "paymentMethod": "rOAi7lMgkVWJYzSC", "paymentMethodFee": 71, "paymentOrderNo": "6YJLlb2AfUEEBbqM", "paymentProvider": "WALLET", "paymentProviderFee": 20, "paymentStationUrl": "04mFw4HJv5T2kIQO", "price": 8, "refundedTime": "1994-01-17T00:00:00Z", "salesTax": 11, "sandbox": true, "sku": "OzNlJE3uqZz574g3", "status": "NOTIFICATION_OF_CHARGEBACK", "statusReason": "cA0PwZxTIZVSGQyT", "subscriptionId": "zhs9Asy4d629N4Yn", "subtotalPrice": 30, "targetNamespace": "sQuWUBBHZonSmzF8", "targetUserId": "31vlCiZAZHCWMXxV", "tax": 15, "totalPrice": 92, "totalTax": 60, "txEndTime": "1988-12-12T00:00:00Z", "type": "TrKqVwnpPn8N5xMR", "userId": "gU7cPqNZrLCRRUys", "vat": 50}' \
    > test.out 2>&1
eval_tap $? 266 'ProcessUserOrderNotification' test.out

#- 267 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ltQUku3n32atB0QP' \
    --userId 'QPEp5UtwUWGt6too' \
    > test.out 2>&1
eval_tap $? 267 'DownloadUserOrderReceipt' test.out

#- 268 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'HP5kAww01zalTddh' \
    --body '{"currencyCode": "AQ1pwqnybvUIfuul", "currencyNamespace": "meegRwPPbn7lttd2", "customParameters": {"1cS6IVE4fzwG3BHa": {}, "RcZ8NK4gkLmvEOaR": {}, "cqTgF0xtQAXoDoFk": {}}, "description": "mA3fgzcwdgJMjIyG", "extOrderNo": "fiNBQy41M1gzGCba", "extUserId": "xw33rNbE4bbDU4FM", "itemType": "SEASON", "language": "vs-hJ", "metadata": {"erDCWcl3VSJENQop": "eHD6iKBGm5Cj7Rqn", "JUmfDmofxvN8pRGo": "UtmbWZbEjPyq35BW", "Doc3qNcQFFyHv141": "NPqjRUMKSQjFdjqT"}, "notifyUrl": "aZFsWzbqwTZQIN5j", "omitNotification": true, "platform": "OVG5cG6XxENbWqlX", "price": 84, "recurringPaymentOrderNo": "idzjpKDfwl6XlCF6", "region": "YxFMD8tJQwZvUVIn", "returnUrl": "os5RK100yH89i8ZD", "sandbox": false, "sku": "XRL8cbTAntB1STaa", "subscriptionId": "b1UeibXg7RCe5BtK", "title": "cwj6PqqOgCimr3ZQ"}' \
    > test.out 2>&1
eval_tap $? 268 'CreateUserPaymentOrder' test.out

#- 269 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'NBBkrXu9czsYr3cF' \
    --userId 'eVw70xdNTuOdLKK0' \
    --body '{"description": "M2B2hbqJin37P69t"}' \
    > test.out 2>&1
eval_tap $? 269 'RefundUserPaymentOrder' test.out

#- 270 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId '1KqeGz7qbPnXEuOz' \
    --body '{"code": "zkoBmMR9C4qPqJrA", "orderNo": "dh1HIk7vCEq7FQ2S"}' \
    > test.out 2>&1
eval_tap $? 270 'ApplyUserRedemption' test.out

#- 271 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '5VeW9ddxzLPV8wDj' \
    --body '{"meta": {"snyPh5yNbYXmlAOi": {}, "1SC3I1SjkH42LtyZ": {}, "KrTJo0L5sHil4Q0m": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Oculus", "currencyCode": "cnDq0ddZG0EpfGAq", "namespace": "HKcSxUc2YgRpk2IF"}, "entitlement": {"entitlementId": "GIgIpscUpVAciu2X"}, "item": {"itemIdentity": "PPUxzXHUvxhvTZcv", "itemIdentityType": "ITEM_ID", "origin": "Twitch"}, "quantity": 49, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "IOS", "currencyCode": "aM4ozSAg8FTLrByW", "namespace": "OJhbocoGlPzdfxcC"}, "entitlement": {"entitlementId": "3rpWhSpq0InxMLpP"}, "item": {"itemIdentity": "7n7M3JXjEvsj5WcQ", "itemIdentityType": "ITEM_SKU", "origin": "Twitch"}, "quantity": 78, "type": "ITEM"}, {"currency": {"balanceOrigin": "Playstation", "currencyCode": "ZGzVLcmZKKKYARap", "namespace": "e2tsNczam4Cdd1QY"}, "entitlement": {"entitlementId": "vww4XDokltgq2vXt"}, "item": {"itemIdentity": "UnY6UhDJ4pe0s0Cu", "itemIdentityType": "ITEM_ID", "origin": "Xbox"}, "quantity": 22, "type": "ENTITLEMENT"}], "source": "DLC", "transactionId": "LTcqLVTN5Qf4tjPG"}' \
    > test.out 2>&1
eval_tap $? 271 'DoRevocation' test.out

#- 272 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'pu27yxb1of79zVTW' \
    --body '{"gameSessionId": "IfgdNphqe9fS1m77", "payload": {"MAg4KoZQPLhDSJx9": {}, "jzxaRKph4kiIFgS4": {}, "fLqlrKGiS3XxjkyN": {}}, "scid": "fj3XgTRTjI9oNBzg", "sessionTemplateName": "Q4CRwg0sKVeSpMny"}' \
    > test.out 2>&1
eval_tap $? 272 'RegisterXblSessions' test.out

#- 273 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '0GrvKI5EVB9ZFzLN' \
    --chargeStatus 'NEVER' \
    --itemId 'ZyIiAmCL8bNTTfqL' \
    --limit '58' \
    --offset '21' \
    --sku 'v9DYBOProN4UWbQa' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 273 'QueryUserSubscriptions' test.out

#- 274 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tv4JWElmOCxqPrq9' \
    --excludeSystem  \
    --limit '70' \
    --offset '27' \
    --subscriptionId '3XJWBxTLcOef8MgI' \
    > test.out 2>&1
eval_tap $? 274 'GetUserSubscriptionActivities' test.out

#- 275 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'wkrKFEtwESJCe2ks' \
    --body '{"grantDays": 66, "itemId": "ah9bPsksceGUEX8E", "language": "RZcKSYLo6y7yJMow", "reason": "Q6LpHCvCYTgX9JQw", "region": "ErzjtuP9pUUv7qef", "source": "NMFsZAIqak1zi0JS"}' \
    > test.out 2>&1
eval_tap $? 275 'PlatformSubscribeSubscription' test.out

#- 276 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'a5cRn31D8ubfdXi7' \
    --itemId 'BycDPckeGJUgU8bD' \
    > test.out 2>&1
eval_tap $? 276 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 277 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '5mGFFmKTTUxG0mpm' \
    --userId 'FxxDNXGlGJvHf558' \
    > test.out 2>&1
eval_tap $? 277 'GetUserSubscription' test.out

#- 278 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'h1ltyhiSGhfqXhxB' \
    --userId 'J7zLXioAGkWgSDdD' \
    > test.out 2>&1
eval_tap $? 278 'DeleteUserSubscription' test.out

#- 279 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'QvpRfGe3z2rtjWpJ' \
    --userId 'AlKHF0ebxhJ1176C' \
    --force  \
    --body '{"immediate": false, "reason": "SGyDCKF0LLhO3lGZ"}' \
    > test.out 2>&1
eval_tap $? 279 'CancelSubscription' test.out

#- 280 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '7eGOPj2XoFug8BUQ' \
    --userId 'UmPHnPumcazKAna0' \
    --body '{"grantDays": 19, "reason": "ZM28w4mnYvvlt1es"}' \
    > test.out 2>&1
eval_tap $? 280 'GrantDaysToSubscription' test.out

#- 281 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '7A4PFduN4gx0UC6e' \
    --userId 'WKCFGS97Si6XyLVP' \
    --excludeFree  \
    --limit '35' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 281 'GetUserSubscriptionBillingHistories' test.out

#- 282 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'kUxyZ1OH5Nn4nMT8' \
    --userId 'QOyTuUSD9ImtaPAo' \
    --body '{"additionalData": {"cardSummary": "cOQcpBWSNrCjSNEA"}, "authorisedTime": "1972-03-03T00:00:00Z", "chargebackReversedTime": "1978-01-12T00:00:00Z", "chargebackTime": "1975-03-26T00:00:00Z", "chargedTime": "1994-08-20T00:00:00Z", "createdTime": "1981-11-10T00:00:00Z", "currency": {"currencyCode": "CPrrZCTU5WUJizF6", "currencySymbol": "9PSsquWUafwbFPX1", "currencyType": "VIRTUAL", "decimals": 78, "namespace": "33pFgA7i9tqvfHmF"}, "customParameters": {"vUZiUW5Y0CYw5OXS": {}, "GwQkJuy9oLFcHHcr": {}, "aLXR2n9JQvq7NKWI": {}}, "extOrderNo": "HYsii3fCh7sieJjZ", "extTxId": "PAkiWumllU31uXPw", "extUserId": "YxedGHCIkmt4bfJO", "issuedAt": "1974-11-23T00:00:00Z", "metadata": {"nFcqHxXP3kRhtrBc": "BofWTGYx2ihgioL8", "VvEzHGTt9emdCLmz": "JbdkykVAnmnRfUil", "cKA84d9pMsl7zrNJ": "vDiP2hNNEI8QrQ6H"}, "namespace": "1ro5CtU8UjgyCUpM", "nonceStr": "1JBcTzf4dz1BojPo", "paymentMethod": "Qg976409vFd5z9r4", "paymentMethodFee": 27, "paymentOrderNo": "lstb3slUe94NxhXs", "paymentProvider": "ADYEN", "paymentProviderFee": 78, "paymentStationUrl": "qTYi1TMBMzaOrxuK", "price": 45, "refundedTime": "1983-06-08T00:00:00Z", "salesTax": 82, "sandbox": true, "sku": "vkiU2jXSwsBBRopV", "status": "CHARGEBACK_REVERSED", "statusReason": "l7U12hO5vpk9DOSg", "subscriptionId": "bsdGVPLD9A5NmuZD", "subtotalPrice": 96, "targetNamespace": "e2IoPMSQKcg0OTT9", "targetUserId": "JA0ll1RimBCiQwuy", "tax": 35, "totalPrice": 98, "totalTax": 72, "txEndTime": "1978-03-28T00:00:00Z", "type": "7uSyXP6C0jXS8au2", "userId": "wcWYyj3JvHqXp4JR", "vat": 48}' \
    > test.out 2>&1
eval_tap $? 282 'ProcessUserSubscriptionNotification' test.out

#- 283 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'QiAUhIfi17YrkWHN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xiaNyqBfgw58Hx0X' \
    --body '{"count": 15, "orderNo": "L0fJOPYpnPqGlPnh"}' \
    > test.out 2>&1
eval_tap $? 283 'AcquireUserTicket' test.out

#- 284 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'BDOWqDU8N3DjVUt0' \
    > test.out 2>&1
eval_tap $? 284 'QueryUserCurrencyWallets' test.out

#- 285 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'n0jfyDbtIXICLkK8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZvbnTg3znlg8nmzQ' \
    --body '{"allowOverdraft": true, "amount": 93, "balanceOrigin": "Oculus", "balanceSource": "EXPIRATION", "metadata": {"YhcRlv16Wwe8YK3l": {}, "ZFslECI9QzuQcsjF": {}, "ehD6uTDYnqyNgN7G": {}}, "reason": "oeMsezFZsTBHkgcJ"}' \
    > test.out 2>&1
eval_tap $? 285 'DebitUserWalletByCurrencyCode' test.out

#- 286 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode '0DcEt23pci6xElje' \
    --namespace "$AB_NAMESPACE" \
    --userId 'r6aGJx5OFp3jKEx4' \
    --limit '2' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 286 'ListUserCurrencyTransactions' test.out

#- 287 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'SGdwTPX4ig3NVFFk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'P7O3F4vsohRWDyGY' \
    --request '{"amount": 71, "debitBalanceSource": "ORDER_REVOCATION", "metadata": {"VFDbTvRYfpJ4wM9W": {}, "ZfOOxAzmsbhi5QJu": {}, "c2SNBaOlXfgsgBd7": {}}, "reason": "MYLLoPZrkjRm5Ki0", "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 287 'CheckBalance' test.out

#- 288 CheckWallet
eval_tap 0 288 'CheckWallet # SKIP deprecated' test.out

#- 289 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'UkjDzJ4NuMMgI13n' \
    --namespace "$AB_NAMESPACE" \
    --userId 'plXaUQV5QEvKElLf' \
    --body '{"amount": 3, "expireAt": "1982-08-12T00:00:00Z", "metadata": {"tujkzxidLcAQWGVR": {}, "g6DVso5TJCSugdo4": {}, "XTm8t1YTWqItjNWX": {}}, "origin": "Nintendo", "reason": "dr1C2TIQzRJY7UfY", "source": "REFUND"}' \
    > test.out 2>&1
eval_tap $? 289 'CreditUserWallet' test.out

#- 290 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'y5fpbbbMIu9lu18j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IMBUM77XmemN8LO0' \
    --request '{"amount": 78, "debitBalanceSource": "EXPIRATION", "metadata": {"0G4v5D6ylZguO918": {}, "X7rLoexHBMBMMAYo": {}, "kSWFwajRGUyklfLV": {}}, "reason": "Y6g3PO4hKAeF4GUV", "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 290 'DebitByWalletPlatform' test.out

#- 291 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'apnZXoJ4gI4EQKO8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xC4D0FsUo3IB2kX5' \
    --body '{"amount": 90, "metadata": {"6MD9r1y5Ihr531Ka": {}, "jxq7lzuVRVEvhKIb": {}, "rq1xsGpdobYun8hc": {}}, "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 291 'PayWithUserWallet' test.out

#- 292 GetUserWallet
eval_tap 0 292 'GetUserWallet # SKIP deprecated' test.out

#- 293 DebitUserWallet
eval_tap 0 293 'DebitUserWallet # SKIP deprecated' test.out

#- 294 DisableUserWallet
eval_tap 0 294 'DisableUserWallet # SKIP deprecated' test.out

#- 295 EnableUserWallet
eval_tap 0 295 'EnableUserWallet # SKIP deprecated' test.out

#- 296 ListUserWalletTransactions
eval_tap 0 296 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 297 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hVjfWyK02w5QytAm' \
    > test.out 2>&1
eval_tap $? 297 'ListViews' test.out

#- 298 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kanukAzAMaRvIUhU' \
    --body '{"displayOrder": 47, "localizations": {"I0e2Axj0nZHjmoKH": {"description": "JngwMe1AnQVj6QQj", "localExt": {"ZtkNJCnDSrsSey2B": {}, "qOxgwCymCDYsuff3": {}, "b7G5FDX4mu0qPHb9": {}}, "longDescription": "Ll2EFEb8GnsthmQ2", "title": "Y6ZGOiqrg3lpqN5b"}, "OfnqJ5bzDRzbhMxf": {"description": "EDE4TrtIHyyMq79E", "localExt": {"dB9MxaF8QHGM2IuQ": {}, "YBO8m0HgTth479W8": {}, "rXqwGVIRWgTNHCka": {}}, "longDescription": "3Wb5kH1BrLWUetP7", "title": "nmESQDV3BD1nnEzo"}, "UlUWqP4ElzL44KEm": {"description": "3uHBMCP5ckjphURs", "localExt": {"4ksgsKJ2R6Jacwwu": {}, "8W1zvrKMRPvwA9k6": {}, "yJz03NETdywPqYer": {}}, "longDescription": "rpOm4M2pM4fIfcHB", "title": "WZM50aHbPXRns3qw"}}, "name": "YL6LwGlZGF7XQPLA"}' \
    > test.out 2>&1
eval_tap $? 298 'CreateView' test.out

#- 299 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'cIL7FvAMWqhyyNZH' \
    --storeId '1CducB5y5iMdeBG7' \
    > test.out 2>&1
eval_tap $? 299 'GetView' test.out

#- 300 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'REG4meKEabfVXBJP' \
    --storeId 'IZqZC5d6JuFdcfiN' \
    --body '{"displayOrder": 12, "localizations": {"uQnaXpDQ5rU2taDW": {"description": "h9JV5oc5IFQsrwHq", "localExt": {"FqwVA5mozeeOjIFQ": {}, "fXV3YW3ug3nCXhD7": {}, "FUz1iOe0pHa0Lmse": {}}, "longDescription": "IRXeoerZAxbDPXU5", "title": "xJBhIpJ9b0Ap7CmS"}, "iKPjcwAw5GdxpvLf": {"description": "a4b4hTaZBGdX66Dq", "localExt": {"PTdurR3MYda0Y0BC": {}, "O4qPnvxERWjKasq5": {}, "zQ6uZNwKjnX7vDIq": {}}, "longDescription": "pcjmaq5KBCsHlwNr", "title": "fKJrkzwR40tfd9GF"}, "XChtxB10d4Q8nlBt": {"description": "hUSu4WNfTvD5UcES", "localExt": {"1eLMZs9lSQVDp16q": {}, "VIqXCK9dS5JTbdJE": {}, "e6mnkYAfw61kyKk0": {}}, "longDescription": "UXUF2523OTvOmfVN", "title": "JNDaSO3FEkk4It6V"}}, "name": "8Bu7rIjGrxUMKbv6"}' \
    > test.out 2>&1
eval_tap $? 300 'UpdateView' test.out

#- 301 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId '0ixUuUhopdqGrqRZ' \
    --storeId '124P7PauXTrpWAjw' \
    > test.out 2>&1
eval_tap $? 301 'DeleteView' test.out

#- 302 QueryWallets
eval_tap 0 302 'QueryWallets # SKIP deprecated' test.out

#- 303 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 2, "expireAt": "1995-06-09T00:00:00Z", "metadata": {"q9fQqzulLGfQMqSL": {}, "QDlRFYMVfiAMa6Pc": {}, "o7MfvikslpyL9BYL": {}}, "origin": "IOS", "reason": "VznF6hMYfksp8VQh", "source": "SELL_BACK"}, "currencyCode": "eJhwNbwHGG39YAZJ", "userIds": ["4HuLfeTfFBTOFFMJ", "9pq511jZcTK8zmMf", "yshYk3b5cAFVo85r"]}, {"creditRequest": {"amount": 78, "expireAt": "1971-09-13T00:00:00Z", "metadata": {"8Yp2QnuhQuIdvZdj": {}, "6AspWBfRnLcLbp7O": {}, "mcrDJ7u1rrRPcnG8": {}}, "origin": "Playstation", "reason": "rnNW1Yjfn8lY4DnY", "source": "REFUND"}, "currencyCode": "fUBMdNuTaiLxFMXR", "userIds": ["pDP9xutntU8xHw4y", "YJOCViHwunQwpC2e", "CFUAHZaYSvsWiNJt"]}, {"creditRequest": {"amount": 34, "expireAt": "1996-03-27T00:00:00Z", "metadata": {"xKOrfVfBRIfkStOq": {}, "dXqhDMQ6tBLljC7g": {}, "cT3M1DArk4L80aXF": {}}, "origin": "Twitch", "reason": "7SQkym9KvKMHK5fb", "source": "IAP"}, "currencyCode": "TSdGoLZbC3UJruU4", "userIds": ["Y4fVIdqwCWF5wmbO", "4E8zmaZ5cg0REtUW", "uIXBZsEYogFWiH9z"]}]' \
    > test.out 2>&1
eval_tap $? 303 'BulkCredit' test.out

#- 304 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "ubTxAAeDCowR3MeC", "request": {"allowOverdraft": false, "amount": 77, "balanceOrigin": "System", "balanceSource": "TRADE", "metadata": {"g7N7piT8VcrXLZnu": {}, "MNpKEIs3GC9VTK7t": {}, "kJWFpHt7MdKu9Xwn": {}}, "reason": "5GHJDGatrYOMO91C"}, "userIds": ["MuBXPDKCriRKzTZ7", "TXAVRnUVbxEJcKHE", "YEjX867n9PT9fR7m"]}, {"currencyCode": "764EwhQfxFKIOGT1", "request": {"allowOverdraft": true, "amount": 93, "balanceOrigin": "Twitch", "balanceSource": "EXPIRATION", "metadata": {"1QeR3EYXBFpUX9y4": {}, "tY7o5FFi1n10vDgy": {}, "oHXIlrMl2RAukCL2": {}}, "reason": "6ihdMy9YCLNJEkvq"}, "userIds": ["XBxw01iBBQukgQ94", "6SUSt8xd8EgE15XN", "uw6Y7sToQNkuZzJ1"]}, {"currencyCode": "ZvPCWcMX0ov3U2sK", "request": {"allowOverdraft": false, "amount": 73, "balanceOrigin": "System", "balanceSource": "TRADE", "metadata": {"eyFS97dYD7LkcTKY": {}, "pCfl6HPy5cJfAV5i": {}, "Ofzwt3bpxRNt6lKo": {}}, "reason": "MjCPtEKeBWTm78Fn"}, "userIds": ["WsFRUlWBp4gBs9Uu", "6r5ZTcnVVOKMApTc", "8TvZVTe4L2lXrVPX"]}]' \
    > test.out 2>&1
eval_tap $? 304 'BulkDebit' test.out

#- 305 GetWallet
eval_tap 0 305 'GetWallet # SKIP deprecated' test.out

#- 306 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'fgsVbG6TUe3jbuQ7' \
    --end 'HMPO4ozK705ykRqS' \
    --start 'PYZgPm4JLsXVtBOE' \
    > test.out 2>&1
eval_tap $? 306 'SyncOrders' test.out

#- 307 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["etHsxAJ8Ny1LRkPU", "9hrl5nkpEdBe8bYW", "dok4UnUEOyP0cPZf"], "apiKey": "5OvolfI0mqZctohL", "authoriseAsCapture": false, "blockedPaymentMethods": ["9Qu8Ofl2oB8VTjF0", "pD3NHU8iYUOtG5gb", "QSKW2MdgCH4bWxRF"], "clientKey": "6fBPa6GOuV5z0p8j", "dropInSettings": "aJs2duQqawPrxi6F", "liveEndpointUrlPrefix": "4elhy9CZ94CAUVW8", "merchantAccount": "FoEf8tjCjWc22qqD", "notificationHmacKey": "fNz59jHwSDQHadmA", "notificationPassword": "o0lzhPm7RmaOr6TL", "notificationUsername": "wVyE42ApAb7CKt79", "returnUrl": "wAopZL9Cw6K9h55m", "settings": "wUvhdBOgumV4wAsd"}' \
    > test.out 2>&1
eval_tap $? 307 'TestAdyenConfig' test.out

#- 308 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "4ifGd0bkWrlhtfTy", "privateKey": "wRW4fmg6btk3mAO4", "publicKey": "EtB0hn2x1oTOX5gB", "returnUrl": "QlVDx9neFHWhDRJt"}' \
    > test.out 2>&1
eval_tap $? 308 'TestAliPayConfig' test.out

#- 309 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "yYEt7ygZleAoUuVK", "secretKey": "neoO10ytPdJ8SY3q"}' \
    > test.out 2>&1
eval_tap $? 309 'TestCheckoutConfig' test.out

#- 310 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'oogOxoPYvdIBJYyG' \
    > test.out 2>&1
eval_tap $? 310 'DebugMatchedPaymentMerchantConfig' test.out

#- 311 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "URjEjnslEYM8ngVT", "clientSecret": "1ewVxvgAocOqsd5v", "returnUrl": "5n7eXCo9gZWdxfId", "webHookId": "W8fNAM5YdHivK2Q0"}' \
    > test.out 2>&1
eval_tap $? 311 'TestPayPalConfig' test.out

#- 312 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["WwolQy037hJMOEv5", "W0v25yAObZIbrA8X", "AKKWMDebehSjpt0w"], "publishableKey": "rfWPXaI1Jb75o2MF", "secretKey": "Oa6xgPt69QROGDeJ", "webhookSecret": "CyHvUsnLvXCSgQHv"}' \
    > test.out 2>&1
eval_tap $? 312 'TestStripeConfig' test.out

#- 313 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "s25eiQO3oWdgXdm1", "key": "IxL1OtleUBqBO0Ze", "mchid": "049k9W6ZLVJzRpUs", "returnUrl": "ITfVruDukun42zPZ"}' \
    > test.out 2>&1
eval_tap $? 313 'TestWxPayConfig' test.out

#- 314 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "vOd4yZyMKyED3qDO", "flowCompletionUrl": "5HXp5oVkhESbHQ7h", "merchantId": 44, "projectId": 49, "projectSecretKey": "Tlzf7XwQtVIYU87N"}' \
    > test.out 2>&1
eval_tap $? 314 'TestXsollaConfig' test.out

#- 315 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'gjDMcJxfMfYFlt3J' \
    > test.out 2>&1
eval_tap $? 315 'GetPaymentMerchantConfig' test.out

#- 316 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'vDgMiyBGygWFTAY3' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["Th5mOwPCPKVPlOGf", "FBlu2ZP0IkiYXGk6", "BoBmSLi0R7zDFMoN"], "apiKey": "TQmlS8lMlY8Ujprh", "authoriseAsCapture": true, "blockedPaymentMethods": ["x0QYycDH5we2Mx0s", "YCnYPT4i4mxc14iR", "fzJwKuc7EpiQEzz5"], "clientKey": "N5osRYO7wbYh7q02", "dropInSettings": "W8tkTURUFmqNc8xh", "liveEndpointUrlPrefix": "QqptccNorRls7EC3", "merchantAccount": "nDnhFvDlFd7iyZpv", "notificationHmacKey": "WVJFK6ZuvlzGCII1", "notificationPassword": "56hIg0g8HIxpzm9A", "notificationUsername": "cFhH4ZlYY3rEuHMW", "returnUrl": "wQNmCQmGCF963Cbs", "settings": "OawlRBQJH6fNekhk"}' \
    > test.out 2>&1
eval_tap $? 316 'UpdateAdyenConfig' test.out

#- 317 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id '077gxaj55huTA6Av' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 317 'TestAdyenConfigById' test.out

#- 318 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'mW0567BFqbrPIuxK' \
    --sandbox  \
    --validate  \
    --body '{"appId": "mBXLi6GpnqAeMvg3", "privateKey": "w0FQ1520WM3TxWXS", "publicKey": "dTiKdva2UREoBSFt", "returnUrl": "CLy2CqgCG7JwJCDq"}' \
    > test.out 2>&1
eval_tap $? 318 'UpdateAliPayConfig' test.out

#- 319 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'kzOdFwLJpIPxzLE1' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 319 'TestAliPayConfigById' test.out

#- 320 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'V9U1NgpH7Oc44yjR' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "dfqZgv34GqqjelcN", "secretKey": "0GJmPwUTWMx0MiPA"}' \
    > test.out 2>&1
eval_tap $? 320 'UpdateCheckoutConfig' test.out

#- 321 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'jnWIhFrqSn4erXEt' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 321 'TestCheckoutConfigById' test.out

#- 322 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'U1CaD8AqsMCGBNhm' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "Ut6fzYRn85brTu8F", "clientSecret": "7cuCPh1TGZJmgWNH", "returnUrl": "WnvOBRCt4onqRo2P", "webHookId": "nMSRarKg4coy3AFp"}' \
    > test.out 2>&1
eval_tap $? 322 'UpdatePayPalConfig' test.out

#- 323 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'ULIn21Nf2FNgDWNC' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 323 'TestPayPalConfigById' test.out

#- 324 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id '6yh7kgTHlrxKbsV4' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["XtrI7SFBEgkwHifM", "HYI581HbF7fMX9lD", "XYxGRJM92eX42WW2"], "publishableKey": "WKf5urEOpASBicX3", "secretKey": "ZwzZ7aVhrkmhSOEo", "webhookSecret": "zGOv8D0iVxzrec5k"}' \
    > test.out 2>&1
eval_tap $? 324 'UpdateStripeConfig' test.out

#- 325 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'NwJAxm0Rdm9l6nIh' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 325 'TestStripeConfigById' test.out

#- 326 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'G5SilDDIsmj4h625' \
    --validate  \
    --body '{"appId": "dIsMKWBxF9RAIrI8", "key": "1ZR2kNzh60RQNaTE", "mchid": "hMXMepgzY9jLiAdM", "returnUrl": "iQ7eDMkeBRMur18n"}' \
    > test.out 2>&1
eval_tap $? 326 'UpdateWxPayConfig' test.out

#- 327 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'CxiV9bQMHpPbvflI' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 327 'UpdateWxPayConfigCert' test.out

#- 328 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id '3LkRc1NgZaoYAaCC' \
    > test.out 2>&1
eval_tap $? 328 'TestWxPayConfigById' test.out

#- 329 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'eRgtstsU3Qecxo4b' \
    --validate  \
    --body '{"apiKey": "QZO3P2f8TTOVf6jr", "flowCompletionUrl": "r1OL606QpqCgxt0N", "merchantId": 12, "projectId": 73, "projectSecretKey": "DSj1T6EdeYFmrLT0"}' \
    > test.out 2>&1
eval_tap $? 329 'UpdateXsollaConfig' test.out

#- 330 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'HbvS4kSSt3CyDgf6' \
    > test.out 2>&1
eval_tap $? 330 'TestXsollaConfigById' test.out

#- 331 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'eFAiqSkHi0BR2ElF' \
    --body '{"device": "MOBILE", "showCloseButton": false, "size": "LARGE", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 331 'UpdateXsollaUIConfig' test.out

#- 332 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '12' \
    --namespace "$AB_NAMESPACE" \
    --offset '74' \
    --region 'GQ5mChYoKD7yqCR0' \
    > test.out 2>&1
eval_tap $? 332 'QueryPaymentProviderConfig' test.out

#- 333 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "RovQZhwfjkq9iyTb", "region": "yD3D01tRpuuyIagS", "sandboxTaxJarApiToken": "SzEL8H4euLufhQj2", "specials": ["WALLET", "WXPAY", "STRIPE"], "taxJarApiToken": "xl9Hs2L2wlpKBVUR", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 333 'CreatePaymentProviderConfig' test.out

#- 334 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 334 'GetAggregatePaymentProviders' test.out

#- 335 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'Hefz77a9fntCNiHB' \
    > test.out 2>&1
eval_tap $? 335 'DebugMatchedPaymentProviderConfig' test.out

#- 336 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 336 'GetSpecialPaymentProviders' test.out

#- 337 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'RUNCPSre5GmZzCQw' \
    --body '{"aggregate": "ADYEN", "namespace": "yidbnXdMSwmkBkKC", "region": "1h6h45u0wuh9pY00", "sandboxTaxJarApiToken": "11jSmHFTtfM2mGUU", "specials": ["STRIPE", "CHECKOUT", "STRIPE"], "taxJarApiToken": "pMRlhK9DMMaI4ryV", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 337 'UpdatePaymentProviderConfig' test.out

#- 338 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'vNaruZxwTfh9gEs6' \
    > test.out 2>&1
eval_tap $? 338 'DeletePaymentProviderConfig' test.out

#- 339 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 339 'GetPaymentTaxConfig' test.out

#- 340 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "GF247cbBLjUr5z03", "taxJarApiToken": "wxB3E9hrE9f9COFr", "taxJarEnabled": true, "taxJarProductCodesMapping": {"ahnlLJaLCvjRKKX1": "brmkJDfdngbQD3pO", "8U3W94Z8IW2MAL9g": "YHEV3wnTZTvYYf4Z", "FuV6L2AldoWWRN5w": "NYlFiliYmBrqrOc0"}}' \
    > test.out 2>&1
eval_tap $? 340 'UpdatePaymentTaxConfig' test.out

#- 341 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'NIligBrOkBljwREN' \
    --end 'jt04ZpyTTZG1LxLd' \
    --start 'ySvyVqY8nxBZbHcP' \
    > test.out 2>&1
eval_tap $? 341 'SyncPaymentOrders' test.out

#- 342 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'HEFuEVP9bF07gnWD' \
    --storeId 'ULkJPQR0UJMr8ouc' \
    > test.out 2>&1
eval_tap $? 342 'PublicGetRootCategories' test.out

#- 343 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'cGH0B4LCe2h0iFCC' \
    --storeId 'ZgFWs5s0nT89A88G' \
    > test.out 2>&1
eval_tap $? 343 'DownloadCategories' test.out

#- 344 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'DOUClGyzYgnYTdim' \
    --namespace "$AB_NAMESPACE" \
    --language '6PkRoq5TO65KWh8z' \
    --storeId 'tRJkXxUAj3jzZvEa' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetCategory' test.out

#- 345 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'Y103YUIMuSjDHz0z' \
    --namespace "$AB_NAMESPACE" \
    --language 'PWMZQNNP2JqQqhIS' \
    --storeId 'TBT1Gofv4SuaZ8yC' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetChildCategories' test.out

#- 346 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'B9TVZnuzgvAZJRm7' \
    --namespace "$AB_NAMESPACE" \
    --language '1EC3ENuvD8OPsp5Z' \
    --storeId '3ez84KVB7HeWPnVe' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetDescendantCategories' test.out

#- 347 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 347 'PublicListCurrencies' test.out

#- 348 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'STEAM' \
    > test.out 2>&1
eval_tap $? 348 'GeDLCDurableRewardShortMap' test.out

#- 349 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    > test.out 2>&1
eval_tap $? 349 'GetIAPItemMapping' test.out

#- 350 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '5ezlCU6SGzkMpTL2' \
    --region 'wxobjxAbagqEmXn6' \
    --storeId 'U2VeV2emK3JecJA4' \
    --appId 'skqCbPxRkIAFQh9y' \
    > test.out 2>&1
eval_tap $? 350 'PublicGetItemByAppId' test.out

#- 351 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'h9gHuloyce0cLJu4' \
    --categoryPath 'ljPWlCWTuGO8MnfO' \
    --features 'Qu3wdT4Aodp95o1R' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --language 'Slo54zSnRN0zGMwo' \
    --limit '36' \
    --offset '66' \
    --region 'zym1z3ZdetOic9AQ' \
    --sortBy 'createdAt:asc,updatedAt:desc,displayOrder:asc' \
    --storeId 'FIAuALNhNCyscsMB' \
    --tags 'RLsWadk2OQ421q7N' \
    > test.out 2>&1
eval_tap $? 351 'PublicQueryItems' test.out

#- 352 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'b1vrKthVvU5on065' \
    --region 'ApCkVN3QchuQ6pnt' \
    --storeId 'xB648ss7rBnvQHAM' \
    --sku '8gSdIybKUByHBzfv' \
    > test.out 2>&1
eval_tap $? 352 'PublicGetItemBySku' test.out

#- 353 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'gtRTPPzwJmKaLCx3' \
    --storeId 'gcidEALWe6RG5wWz' \
    --itemIds 'nu5AjwR1Z4fU7ICc' \
    > test.out 2>&1
eval_tap $? 353 'PublicGetEstimatedPrice' test.out

#- 354 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'aQtuuKUw3dUwWHhQ' \
    --region 'W3I1y9tjRLVOXBMa' \
    --storeId '0JiIe1AY0tUA7EKA' \
    --itemIds 'Sk3USNLhOBlxRBLg' \
    > test.out 2>&1
eval_tap $? 354 'PublicBulkGetItems' test.out

#- 355 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["ohp8ByTi2F6AyUX8", "w77riPlPgJcLbeQf", "9MICxX7xKyCfgwSP"]}' \
    > test.out 2>&1
eval_tap $? 355 'PublicValidateItemPurchaseCondition' test.out

#- 356 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'LOOTBOX' \
    --limit '75' \
    --offset '1' \
    --region 'c1zOlZg30pagfP0F' \
    --storeId 'fOMBOpeQT4zYIbU4' \
    --keyword 'i9mLyX46Alt08rrn' \
    --language 'G8y2ScXkwjpAp82p' \
    > test.out 2>&1
eval_tap $? 356 'PublicSearchItems' test.out

#- 357 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'GcxvXaG9LzHpMS53' \
    --namespace "$AB_NAMESPACE" \
    --language 'jllopwirRo3A8Wxn' \
    --region 'R0YaMsF3f5KLtpTS' \
    --storeId 'sPMGDZTOwEP5Bhh0' \
    > test.out 2>&1
eval_tap $? 357 'PublicGetApp' test.out

#- 358 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'NStWIggmhfAzVdNY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 358 'PublicGetItemDynamicData' test.out

#- 359 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'P7Ao1z7FeJM2fWXG' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'k7JObSHksRkabpmv' \
    --populateBundle  \
    --region 'Rsc7ZYvXCT6m6mRZ' \
    --storeId 'AlLBczJVeil7GbG1' \
    > test.out 2>&1
eval_tap $? 359 'PublicGetItem' test.out

#- 360 GetPaymentCustomization
eval_tap 0 360 'GetPaymentCustomization # SKIP deprecated' test.out

#- 361 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "ISBCkcnpxKUxLjmx", "paymentProvider": "ALIPAY", "returnUrl": "87hUHA0FJZwP8Gsl", "ui": "Mpx3m7lEXTmnTbtj", "zipCode": "K9RsyoqT3adB48Jx"}' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetPaymentUrl' test.out

#- 362 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'p2zaItg9jTNZvpFE' \
    > test.out 2>&1
eval_tap $? 362 'PublicGetPaymentMethods' test.out

#- 363 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'UI21aSaIsMyLKPPI' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetUnpaidPaymentOrder' test.out

#- 364 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Zx0zdNAagipZwiaB' \
    --paymentProvider 'STRIPE' \
    --zipCode 'yxpUzWIZWJTDzWgu' \
    --body '{"token": "hujw1EoR58uCVlde"}' \
    > test.out 2>&1
eval_tap $? 364 'Pay' test.out

#- 365 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'fonHJZAiX4abmqqi' \
    > test.out 2>&1
eval_tap $? 365 'PublicCheckPaymentOrderPaidStatus' test.out

#- 366 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'WXPAY' \
    --region 'KTWwZk0HGeJNaBjV' \
    > test.out 2>&1
eval_tap $? 366 'GetPaymentPublicConfig' test.out

#- 367 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'dMB5kMzKycYrhr4F' \
    > test.out 2>&1
eval_tap $? 367 'PublicGetQRCode' test.out

#- 368 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'nNzdT4pWwIVXp9av' \
    --foreinginvoice 'Ur6IydpXW0MO0eT9' \
    --invoiceId 'okl6MlWOl9feWO2b' \
    --payload 'mOikTBJHTEm5PSey' \
    --redirectResult 'od5L6OooYoQn9iHE' \
    --resultCode 'qWO1cVCUIOx90FQd' \
    --sessionId 'wLi3GOQkLtpuRNeT' \
    --status '1CULEMPaOU5nukyc' \
    --token 'AUlkUSZKUrsxNRzF' \
    --type '3NaUuCyQyze6zPKu' \
    --userId '5sE89JW8UU0RsB6d' \
    --orderNo 'vrpmInhHYzVVlHGF' \
    --paymentOrderNo 'Swjby6rMYkVQnZDU' \
    --paymentProvider 'WXPAY' \
    --returnUrl 'LiIbAP2qyUnHnfrE' \
    > test.out 2>&1
eval_tap $? 368 'PublicNormalizePaymentReturnUrl' test.out

#- 369 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'dDfY4TTxu8goZgsX' \
    --paymentOrderNo '4RwfM4qnUdcQqZ9F' \
    --paymentProvider 'XSOLLA' \
    > test.out 2>&1
eval_tap $? 369 'GetPaymentTaxValue' test.out

#- 370 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'uivPob0YZEuXQACD' \
    > test.out 2>&1
eval_tap $? 370 'GetRewardByCode' test.out

#- 371 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'DQryNf9VGxbOeJe4' \
    --limit '27' \
    --offset '46' \
    --sortBy 'rewardCode:desc,namespace' \
    > test.out 2>&1
eval_tap $? 371 'QueryRewards1' test.out

#- 372 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'UlBQZ2UGePWXbAyG' \
    > test.out 2>&1
eval_tap $? 372 'GetReward1' test.out

#- 373 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 373 'PublicListStores' test.out

#- 374 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'iXa9nUsHCVicuJ7o,nrUXVlB6xNel4Bxb,9KwFYqdhEVq3hbsA' \
    --itemIds 'peASfR0ljKxqZcLu,hwNDvValv3bkoMXN,zl1ywEPiunixlEAH' \
    --skus 'ZzHs8x5oPSkZFIV2,feXnTRlzAJy9oFOH,B2KEsIdtozVltBho' \
    > test.out 2>&1
eval_tap $? 374 'PublicExistsAnyMyActiveEntitlement' test.out

#- 375 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'XE4wgcYT5CdjaJuU' \
    > test.out 2>&1
eval_tap $? 375 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 376 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'i2jARwzowk9OoiPd' \
    > test.out 2>&1
eval_tap $? 376 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 377 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --sku 'uzC77J4irvZ9tktW' \
    > test.out 2>&1
eval_tap $? 377 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 378 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'LtDdlmVGK6iolEw6,IIpDc9X5ijmtDGvd,9ESdY0eTkBWA44Qq' \
    --itemIds 'si5yOjvl5sRN2ENn,1RLi5iMPnbg7o1zY,pqUsliPyXZGYIW5Z' \
    --skus 'DtWbdkzPP47RcUIi,2CoNj4EG2emxKQk8,cBrt5E8k8rzDZ08j' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetEntitlementOwnershipToken' test.out

#- 379 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "6ICP75cm8YDChFi3", "language": "JmT-Cspy_416", "region": "mBv0XgJB6a7uykAD"}' \
    > test.out 2>&1
eval_tap $? 379 'SyncTwitchDropsEntitlement' test.out

#- 380 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'FpinFcH2ZMSYijqE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 380 'PublicGetMyWallet' test.out

#- 381 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'uMfuYFUS079tOpZY' \
    --body '{"epicGamesJwtToken": "M1XV0Op0damycnTU"}' \
    > test.out 2>&1
eval_tap $? 381 'SyncEpicGameDLC' test.out

#- 382 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'OoMkOppZNOkqxc42' \
    > test.out 2>&1
eval_tap $? 382 'SyncOculusDLC' test.out

#- 383 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'HKv5wvtPJVsuzaBc' \
    --body '{"serviceLabel": 18}' \
    > test.out 2>&1
eval_tap $? 383 'PublicSyncPsnDlcInventory' test.out

#- 384 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'jqyrjDApeN5eAfRq' \
    --body '{"serviceLabels": [49, 91, 13]}' \
    > test.out 2>&1
eval_tap $? 384 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 385 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'gQCbpZx5yMGIQ1Zx' \
    --body '{"appId": "VIefYlKBJyQMqUEf", "steamId": "DikX6yOlgZrn0I6T"}' \
    > test.out 2>&1
eval_tap $? 385 'SyncSteamDLC' test.out

#- 386 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '0hvcAFTaSWR4VOGI' \
    --body '{"xstsToken": "Y7hM6uhonkAe0FdT"}' \
    > test.out 2>&1
eval_tap $? 386 'SyncXboxDLC' test.out

#- 387 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'SSEluBxM47BTww3n' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'TVmBFZ6TIs9bTi2m' \
    --features '7eNsYEqKkeuLWDfe,FeExlOFjRh8mLFTJ,LveQSDWnMQGaYRxF' \
    --itemId 'Wia7yJ2d87XjA0aj,vb7JcGUFgp6LkyXp,xJeFxhgTwyO51CUp' \
    --limit '5' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 387 'PublicQueryUserEntitlements' test.out

#- 388 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'dxL0a9VDhrqWCTXO' \
    --appId 'xQUpyFgZhNpOTE4t' \
    > test.out 2>&1
eval_tap $? 388 'PublicGetUserAppEntitlementByAppId' test.out

#- 389 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'oH57yr01N33p1Gha' \
    --limit '38' \
    --offset '68' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 389 'PublicQueryUserEntitlementsByAppType' test.out

#- 390 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'wpagvERZI6Cqhckn' \
    --entitlementClazz 'APP' \
    --itemId 'EXnqHwMyKpwphjUX' \
    > test.out 2>&1
eval_tap $? 390 'PublicGetUserEntitlementByItemId' test.out

#- 391 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'vM1GqMkZ44UXgdBq' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'YCFGoKpXx60GmEX9' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetUserEntitlementBySku' test.out

#- 392 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'x2BYpyKEBQ7TW7lZ' \
    --appIds 'vDbwFJJhBRdq8BgA,I81k4Gr7jVVx5l3y,rH9HR4reG0HwUXxQ' \
    --itemIds 'Tf5YpDUGYsJBEkYU,rLv4qUiTkFcLBrg2,JB0WiCpVBwvAffJ3' \
    --skus 'btt0PpQY3Pnnic80,yEO8dL6Jh10XMUGe,DavCKradJmJFUsU4' \
    > test.out 2>&1
eval_tap $? 392 'PublicExistsAnyUserActiveEntitlement' test.out

#- 393 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '18vAlmfGg9NO1Z2D' \
    --appId 'vnAxH3pS3jyCkGKl' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 394 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'tBNE2UbhNtH3yYg4' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'oZvd0La7P4JI4H7u' \
    > test.out 2>&1
eval_tap $? 394 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 395 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'DzkOHTdnUtdrRcs3' \
    --ids 'GeOsKPNlG7rEXi6L,EqJERpbxEq07txnv,ZZeAf7QBuZK5GJlB' \
    > test.out 2>&1
eval_tap $? 395 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 396 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'ncg8tQnJOKHC16xj' \
    --entitlementClazz 'MEDIA' \
    --sku 'OvJhUjzcMtwINUlr' \
    > test.out 2>&1
eval_tap $? 396 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 397 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'hIpnlam2EefVopbp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Phsana0uXG7GUTV1' \
    > test.out 2>&1
eval_tap $? 397 'PublicGetUserEntitlement' test.out

#- 398 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'BwgkLDj4pjVktyoN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SsEHlzyd0Sarkhlt' \
    --body '{"options": ["UxgbN5eElQNESFLD", "8hCc9onSNjbQEqFG", "wnDG8kz4kvEv6tNj"], "requestId": "GRhrmRAxRGeIKGlC", "useCount": 73}' \
    > test.out 2>&1
eval_tap $? 398 'PublicConsumeUserEntitlement' test.out

#- 399 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'eKCvtPz7jagBG9a1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TZ87ltClc3RDXF50' \
    --body '{"requestId": "55tUlenimjIbm0ri", "useCount": 58}' \
    > test.out 2>&1
eval_tap $? 399 'PublicSellUserEntitlement' test.out

#- 400 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'd24ZKfvMf1T5FzYM' \
    --body '{"code": "f1jaCgZosntPzP1v", "language": "KCQ", "region": "0WEIetOXMt37MXy7"}' \
    > test.out 2>&1
eval_tap $? 400 'PublicRedeemCode' test.out

#- 401 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fp7lUfQqXrqGadwv' \
    --body '{"excludeOldTransactions": false, "language": "ok-Didw-Ra", "productId": "Ur1hfhmGEKuVUZdC", "receiptData": "acRGataPrcgTcA71", "region": "dtqtSUN4zvBzGh3m", "transactionId": "hIDNuMBZegHtB9uT"}' \
    > test.out 2>&1
eval_tap $? 401 'PublicFulfillAppleIAPItem' test.out

#- 402 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'CiiIoMZCjGiOZJpU' \
    --body '{"epicGamesJwtToken": "f9RpcfEQn0O6D8PG"}' \
    > test.out 2>&1
eval_tap $? 402 'SyncEpicGamesInventory' test.out

#- 403 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'QuazAypgWhTED5Ym' \
    --body '{"autoAck": false, "language": "Zcpv", "orderId": "VSQsaCokoGynp6xc", "packageName": "qNKJnAhrSt96OaAR", "productId": "AjHLGV3sNxS8uLBZ", "purchaseTime": 17, "purchaseToken": "UgrROrP1ip3jNG68", "region": "DByf2UMPtigq9zOQ"}' \
    > test.out 2>&1
eval_tap $? 403 'PublicFulfillGoogleIAPItem' test.out

#- 404 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'OcAqBj0bXhOr9OHt' \
    > test.out 2>&1
eval_tap $? 404 'SyncOculusConsumableEntitlements' test.out

#- 405 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '6zx1i2W3GY7tdh8h' \
    --body '{"currencyCode": "HlQyMlgfkTsAThLy", "price": 0.09629249413102459, "productId": "lAqqAP4M78smYdyg", "serviceLabel": 10}' \
    > test.out 2>&1
eval_tap $? 405 'PublicReconcilePlayStationStore' test.out

#- 406 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'NRE0xyYPUZHyLGQ5' \
    --body '{"currencyCode": "2IjGpRJCUJpscOTk", "price": 0.7895973716851378, "productId": "ETSJ04c5MGInO4yz", "serviceLabels": [16, 28, 53]}' \
    > test.out 2>&1
eval_tap $? 406 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 407 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'KZtZnxgywmr4CYNG' \
    --body '{"appId": "m7Tk1mMyeNRsjQuD", "currencyCode": "EgO3MEQNL6ijLRvQ", "language": "DGSO_cCOl", "price": 0.8736542890669207, "productId": "lUda9h9FgvfhiLEA", "region": "kA7n6516ydoRT1qZ", "steamId": "BrdTnGrwHeWoQXPF"}' \
    > test.out 2>&1
eval_tap $? 407 'SyncSteamInventory' test.out

#- 408 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WFaKbDgrGkv8SVwL' \
    --body '{"gameId": "yS4VbHJvD0lL7aZU", "language": "KDd", "region": "CHniVSn1gYGal5Nr"}' \
    > test.out 2>&1
eval_tap $? 408 'SyncTwitchDropsEntitlement1' test.out

#- 409 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'BtT0om9OlGzpF25q' \
    --body '{"currencyCode": "u98RhktX6qwkXbCL", "price": 0.03136051833619802, "productId": "h8t0zPkQWRUlgE0k", "xstsToken": "xzFMq9ttbEHAEV7C"}' \
    > test.out 2>&1
eval_tap $? 409 'SyncXboxInventory' test.out

#- 410 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '65Ans9SquNSJIay5' \
    --itemId 'VdUdYy9Y9OCSmmT3' \
    --limit '99' \
    --offset '85' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 410 'PublicQueryUserOrders' test.out

#- 411 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'iANv2Ar8yXV6qf6v' \
    --body '{"currencyCode": "5SgcJPZPUh2nHQwp", "discountedPrice": 100, "ext": {"1lTJdNLmAvEdEBVA": {}, "U3rbkv8V98cupW0L": {}, "5WsiuITRMSPOUfWQ": {}}, "itemId": "wr4PYf48r66MaTox", "language": "UJk_354", "price": 39, "quantity": 89, "region": "XdtSCG7ZExOoIpWz", "returnUrl": "acOvwUsnIbQM3ZAt", "sectionId": "yEWKWoZRUL7wS3Ha"}' \
    > test.out 2>&1
eval_tap $? 411 'PublicCreateUserOrder' test.out

#- 412 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'MTXAX6y0STTN2sBE' \
    --userId 'ijjjpvSzGkED0owe' \
    > test.out 2>&1
eval_tap $? 412 'PublicGetUserOrder' test.out

#- 413 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'FYDBPyd1jJBxbrbu' \
    --userId 'Fay9PXgEQS4871QS' \
    > test.out 2>&1
eval_tap $? 413 'PublicCancelUserOrder' test.out

#- 414 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'msspn5sNfifK65tv' \
    --userId 'aH9jwcO48pthyYpB' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetUserOrderHistories' test.out

#- 415 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'JDHIIxTIGI5EssYl' \
    --userId 'lIqjJzuQ8GglVgxj' \
    > test.out 2>&1
eval_tap $? 415 'PublicDownloadUserOrderReceipt' test.out

#- 416 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'OGQGlHm8VTN56tJK' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetPaymentAccounts' test.out

#- 417 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'wD8O07L9GG1uenDi' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'f7tbq5KikDE7hWvT' \
    > test.out 2>&1
eval_tap $? 417 'PublicDeletePaymentAccount' test.out

#- 418 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId '5bzcfzIpL2pWB4Xs' \
    --autoCalcEstimatedPrice  \
    --language 'drxIF6kEAmKGNEmF' \
    --region 'PcUALNziO9Bz2wx4' \
    --storeId 'kDAm8XIleiujtv2N' \
    --viewId 'dQTYoHZogW8lBvni' \
    > test.out 2>&1
eval_tap $? 418 'PublicListActiveSections' test.out

#- 419 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'HdARadfSoctA3GYO' \
    --chargeStatus 'CHARGED' \
    --itemId '4ZOo94gS5DHLB65f' \
    --limit '47' \
    --offset '3' \
    --sku 'Q06GwTmobiBnfrnq' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 419 'PublicQueryUserSubscriptions' test.out

#- 420 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'OFBWhUTPiKR3qcbH' \
    --body '{"currencyCode": "LGplYsS3jsRZffCd", "itemId": "00VrgPuNtOv3jbhG", "language": "eUy_ronk", "region": "6F7Rr7O15jqeKssQ", "returnUrl": "pme6eyM48tE7eJRs", "source": "XNeveQXqnFRYmEIX"}' \
    > test.out 2>&1
eval_tap $? 420 'PublicSubscribeSubscription' test.out

#- 421 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '40XOUoLOa7oDz00g' \
    --itemId 'xcoaH6u9TVf4DvEz' \
    > test.out 2>&1
eval_tap $? 421 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 422 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'poPRiClZ6rlwX99A' \
    --userId 'HMLHqguYykVWzNwP' \
    > test.out 2>&1
eval_tap $? 422 'PublicGetUserSubscription' test.out

#- 423 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'cvGyieBsRUduW5lx' \
    --userId 'SlorWEGN5bPGSOSi' \
    > test.out 2>&1
eval_tap $? 423 'PublicChangeSubscriptionBillingAccount' test.out

#- 424 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iItrSrEJMBAIwTLk' \
    --userId 'rMDFQfpQ9o0GJMTf' \
    --body '{"immediate": true, "reason": "Yirs9lwvPKd925u3"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicCancelSubscription' test.out

#- 425 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'fFLV0YeMrVaYSTRY' \
    --userId 'GFzgLZ7gEypQf2Pn' \
    --excludeFree  \
    --limit '88' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 425 'PublicGetUserSubscriptionBillingHistories' test.out

#- 426 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'zKg0jWCjpGwh7pLA' \
    --language 'i5JmzvM6JFKB8ikH' \
    --storeId 'pl3sNRaDEC2OkXA3' \
    > test.out 2>&1
eval_tap $? 426 'PublicListViews' test.out

#- 427 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'WqypoOw0H2s0sibQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NBz81zRPntxpgi7t' \
    > test.out 2>&1
eval_tap $? 427 'PublicGetWallet' test.out

#- 428 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'XIcNEcGJjOCXpuix' \
    --namespace "$AB_NAMESPACE" \
    --userId '5vnPeTu9evbRov7B' \
    --limit '25' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 428 'PublicListUserWalletTransactions' test.out

#- 429 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --availableDate 'CtZiAxk43DGV1SCk' \
    --baseAppId 'w8U0d4FvVmPMtpRM' \
    --categoryPath 'WSQ8Szi1IrGidRmR' \
    --features '5BGRJhFwxmkGfPI3' \
    --includeSubCategoryItem  \
    --itemName 'j4luXQuuLtYa86kv' \
    --itemStatus 'ACTIVE' \
    --itemType 'APP' \
    --limit '55' \
    --offset '99' \
    --region 'ZQssUUXOsXMNdvW1' \
    --sectionExclusive  \
    --sortBy 'name,name:desc,name:asc' \
    --storeId '7J6ijJbcycXmBcrJ' \
    --tags 'Lb7labyotifVk9Ky' \
    --targetNamespace 'qceGv0CEDTVSjINY' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 429 'QueryItems1' test.out

#- 430 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eKLowG7UQB9pXzuC' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 430 'ImportStore1' test.out

#- 431 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'K5qd2m8A5axixm9X' \
    --body '{"itemIds": ["9TXNhN8y1PVriIyv", "9kjuiAGiXx47etMi", "kLFggYDc2FMbzZoe"]}' \
    > test.out 2>&1
eval_tap $? 431 'ExportStore1' test.out

#- 432 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KagnKf2Yifzvr9Oq' \
    --body '{"metadata": {"TsInGzHFpFXYJtHt": {}, "qwoIwQBeIALI8JNI": {}, "II4jrzrPsuMziNM8": {}}, "origin": "Playstation", "rewards": [{"currency": {"currencyCode": "2b031dm4N41MOpmm", "namespace": "04BlZUAlYnCT11qD"}, "item": {"itemId": "03er5mdraK47FdxX", "itemSku": "isVlo3aVOGARFDJc", "itemType": "GWy826ilCxAxQUM5"}, "quantity": 61, "type": "ITEM"}, {"currency": {"currencyCode": "sY1kPNdJiJXB3yjN", "namespace": "UPIfvoXRO0CkW1Zc"}, "item": {"itemId": "gUSbbnffBWRaJN1S", "itemSku": "jCFLDNJfAhJGwSYE", "itemType": "ZjEb0Pv35fEk9s11"}, "quantity": 2, "type": "ITEM"}, {"currency": {"currencyCode": "kf7rQJ4Kj7Qyo9tU", "namespace": "ptiyZzRX8Y4rxRWZ"}, "item": {"itemId": "Pe4ZLAQWuBJwxObZ", "itemSku": "qMGxhffy9cHrLYff", "itemType": "tad99JDcnn7f2d8S"}, "quantity": 84, "type": "ITEM"}], "source": "PURCHASE", "transactionId": "P2dw6Uy88WpQalG3"}' \
    > test.out 2>&1
eval_tap $? 432 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE