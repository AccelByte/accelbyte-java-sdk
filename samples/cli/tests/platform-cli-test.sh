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
echo "1..445"

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
    --body '{"entitlementGrantList": [{"collectionId": "GpAyrIwMif3BOdko", "endDate": "1972-04-24T00:00:00Z", "grantedCode": "Td4BxqGWV6mTJ0sQ", "itemId": "s6XNbjvqhnUVLWu8", "itemNamespace": "olKdxL6ozRmDD0jJ", "language": "yMF_Nq", "origin": "System", "quantity": 6, "region": "GLLTG8phc3n4iLoI", "source": "OTHER", "startDate": "1976-10-27T00:00:00Z", "storeId": "I89hmguB8FOTjMLo"}, {"collectionId": "4b9rIzqYkEpstyVT", "endDate": "1985-12-04T00:00:00Z", "grantedCode": "crM8rG0rH0zcswwV", "itemId": "eMK6MbGIVIu8vvwL", "itemNamespace": "c7KY3uVoJXTIMtpg", "language": "IS-535", "origin": "System", "quantity": 7, "region": "dMiHKxbWCYzo8yO2", "source": "PURCHASE", "startDate": "1990-07-21T00:00:00Z", "storeId": "9tmmOnYnOpas6ghP"}, {"collectionId": "1y4Zi7s7QBlk44Z4", "endDate": "1976-08-12T00:00:00Z", "grantedCode": "fPaZKBwa3Ddb60uf", "itemId": "Ppzwj1QGIFmlVf4j", "itemNamespace": "vapseE9LN9bvhOrH", "language": "RL_DDzp-nT", "origin": "Other", "quantity": 55, "region": "tEk4mTIpUA9gxo8S", "source": "REDEEM_CODE", "startDate": "1999-11-01T00:00:00Z", "storeId": "8nEhoXmM2W7l6jHM"}], "userIds": ["01nryEJ0NqoTow0q", "A2rG3nakopAywelu", "iOiC4j0iktm0ZPLk"]}' \
    > test.out 2>&1
eval_tap $? 63 'GrantEntitlements' test.out

#- 64 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["LOsp0LZ5njN86Hl8", "kUXzt6bSc6bWvgpV", "yW9dD1kOmvrAejcq"]' \
    > test.out 2>&1
eval_tap $? 64 'RevokeEntitlements' test.out

#- 65 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId '2LgkQuaS7RBx3vim' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'GetEntitlement' test.out

#- 66 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '39' \
    --status 'FAIL' \
    --userId 'ipUWYhWV1qx8CzPM' \
    > test.out 2>&1
eval_tap $? 66 'QueryFulfillmentHistories' test.out

#- 67 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'L52faXUr9Sk4lq2f' \
    --eventType 'CHARGEBACK' \
    --externalOrderId 'sflhjbngJOUn18G5' \
    --limit '78' \
    --offset '40' \
    --startTime 'lfDTk8aG40Nlncce' \
    --status 'INIT' \
    --userId 'rKEDpEY8VnocGAjc' \
    > test.out 2>&1
eval_tap $? 67 'QueryIAPClawbackHistory' test.out

#- 68 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "i0V3tBf2jnHGKXph", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 27, "clientTransactionId": "Q2FbKPFMycMSQ4qf"}, {"amountConsumed": 54, "clientTransactionId": "RX3z46OCaGBeMfPl"}, {"amountConsumed": 80, "clientTransactionId": "s6w3VifnKqmTSoGH"}], "entitlementId": "1XEfY6QAYn6WQ5UB", "usageCount": 62}, {"clientTransaction": [{"amountConsumed": 43, "clientTransactionId": "U1QAOHfZiGhxOdcu"}, {"amountConsumed": 60, "clientTransactionId": "heR3j5mNZ6vwv7K8"}, {"amountConsumed": 54, "clientTransactionId": "8gxefTYKhuxaEc7M"}], "entitlementId": "4P7UckSC6ePeN8i4", "usageCount": 67}, {"clientTransaction": [{"amountConsumed": 57, "clientTransactionId": "rFES9z7xueHpATHc"}, {"amountConsumed": 5, "clientTransactionId": "q7akMpcmnnx6RVBr"}, {"amountConsumed": 29, "clientTransactionId": "EnnqKzFsLfYalUlf"}], "entitlementId": "wEQKjU7eHGebSVu0", "usageCount": 77}], "purpose": "cNDLr36vzohZyjMQ"}, "originalTitleName": "Ag5mPYhrLTyU8Ohg", "paymentProductSKU": "fY9JQYGF4bYXEcEN", "purchaseDate": "x9xZlAchob44lOND", "sourceOrderItemId": "DwMvgI0HlyPR7wZN", "titleName": "iVsF6xG2mXEQdbzI"}, "eventDomain": "Vy8alncV7vWgSHdf", "eventSource": "o07UctPErqxyMyOK", "eventType": "06MqQBErxgjVBycv", "eventVersion": 96, "id": "DDhoO05oKqymxLD1", "timestamp": "Lcvw6T6mZEiwxxEl"}' \
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
    --body '{"bundleId": "pMYSWIeVzm7z9noo", "password": "wmlTIKVowi0RY2VN"}' \
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
    --body '{"sandboxId": "4ZONJREdUQ3z9F1B"}' \
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
    --body '{"applicationName": "xNNgnke4akncw7wu", "serviceAccountId": "9TmXfJWBPrx9Ns8e"}' \
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
    --body '{"data": [{"itemIdentity": "LzYEvwSWTaLQjctv", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"W64f4XhIjSoTB2NM": "KtezapPr2QEPx3zT", "xBGtEJIYppuUSsKo": "Hw2hyd12uSE7BEv3", "aevq6iohU1cg4W1I": "S3Uv1BpWoJBaqdg2"}}, {"itemIdentity": "FHcunsS1lnaO2m9v", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"0sigBVZxiKdV57Gv": "Ryd9UuL02Le8HSCs", "lsDd4M1F5qRIblS7": "Nz81GRazPAANjfBo", "ldFOyqA2clJ5gEOa": "CgM6Yn6RugbNEIpG"}}, {"itemIdentity": "BFUjOn5mM7k8nbLz", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"6GqsBq8vdhWVnuYL": "gpZehK0G2nmyuViB", "9kRTcSQdTnNYGeAf": "YFG3wSkHKufBdS3Z", "OokZB4cXnAXyuGz6": "LlxHv8SwyagYvDJ3"}}]}' \
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
    --body '{"appId": "w3UNgIGj2jZtEYT8", "appSecret": "sIPSE1XXPzySa0sZ"}' \
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
    --body '{"backOfficeServerClientId": "oFS6xCOWMpyh9pMs", "backOfficeServerClientSecret": "Qgb64ELbzDMwyo4n", "enableStreamJob": true, "environment": "RysQdbufXjYnSoIF", "streamName": "eouC2m38kXrDZWlG", "streamPartnerName": "VE9sJ4NpUtKp6M9I"}' \
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
    --body '{"backOfficeServerClientId": "6nEwnZhsjwJeGwaP", "backOfficeServerClientSecret": "SDMZz95OYKiqaZD6", "enableStreamJob": true, "environment": "DiCqSMzpqIFGLkDs", "streamName": "7ACC1RgBfoNrHlFi", "streamPartnerName": "2qJLgmBLE35YhyiD"}' \
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
    --body '{"appId": "V90SeI5yppBHoytV", "publisherAuthenticationKey": "znCgNyx9fbT63ShE"}' \
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
    --body '{"clientId": "h8PbGikLjgjcj34u", "clientSecret": "ulU6FYBZsWFbr3RS", "organizationId": "P0W9nBhvhf8Q0DtJ"}' \
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
    --body '{"relyingPartyCert": "McYQdN66bswAgt65"}' \
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
    --password 'X4N1LQZmB61JMdtw' \
    > test.out 2>&1
eval_tap $? 99 'UpdateXblBPCertFile' test.out

#- 100 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'CVUrYQue84dwmbwF' \
    --itemId 'EnAZaWsQJtRYoagR' \
    --itemType 'SEASON' \
    --endTime 'tAoKiVm6URT95Xhn' \
    --startTime 'UcvWB28MpusuhhDJ' \
    > test.out 2>&1
eval_tap $? 100 'DownloadInvoiceDetails' test.out

#- 101 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature '5slzgiWZEtyd56Lf' \
    --itemId 'xnbY97jjYgXchCbk' \
    --itemType 'BUNDLE' \
    --endTime 'X26uEdCfQaMAQuTK' \
    --startTime 'fC0I2kNjCMDtDMre' \
    > test.out 2>&1
eval_tap $? 101 'GenerateInvoiceSummary' test.out

#- 102 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ntgn3DhqciwIeShF' \
    --body '{"categoryPath": "9RKb9vvxuJlhXbWh", "targetItemId": "bwPwToC6knjVwVnz", "targetNamespace": "aqSfJiQFC2gXoda0"}' \
    > test.out 2>&1
eval_tap $? 102 'SyncInGameItem' test.out

#- 103 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kg16yUSpSOAjHJWw' \
    --body '{"appId": "fCjYwWkLob9gKLqs", "appType": "DLC", "baseAppId": "tq6j1mqUav7k05HA", "boothName": "QltnSojV4jT65ycl", "categoryPath": "X2FtAz0vJjFIYWOa", "clazz": "NdsimmkW2miH3xRH", "displayOrder": 55, "entitlementType": "DURABLE", "ext": {"Ky4QxZkaXZ7vmiEd": {}, "0JPxVyQpshaDwNqT": {}, "bbFMXAMfVXe0GZeM": {}}, "features": ["gsRsmH1EQrYmkPKT", "teTHJe4BhSSQkQD6", "POlhTtSiZNCxuogF"], "flexible": false, "images": [{"as": "mOt6D7ufFVTOhvQp", "caption": "fbBke8aEdd36xj6w", "height": 51, "imageUrl": "NAmjDDCvs78mcMdi", "smallImageUrl": "S76YApGJ9ufwLYkq", "width": 72}, {"as": "quwC3WgumrIz4NhG", "caption": "ztZpr4U4fwQIiLXg", "height": 25, "imageUrl": "YBn2xaOBdPF0JmX8", "smallImageUrl": "qwU1cTuHHPB5S3Dv", "width": 85}, {"as": "sep2xD2NY0kABeGs", "caption": "9yxahld1pO0Gyf5P", "height": 83, "imageUrl": "Wuk6pQxDQpKqxLGe", "smallImageUrl": "Mvr9TsvcMQ7dBsaI", "width": 8}], "inventoryConfig": {"customAttributes": {"uFRYNn3SHiWxF0Yb": {}, "uU5ar5qTLWUCy0Af": {}, "gc050XIZRW491e94": {}}, "serverCustomAttributes": {"mQjVOOBnIWhunElq": {}, "ZUodp3IhtCSHy1ei": {}, "1fIrPvfHnRN06EjR": {}}, "slotUsed": 47}, "itemIds": ["Zedgt5cyNe27HLtw", "tVOaxgP6Jbct8puM", "ybYGxD9IPmmsLmu3"], "itemQty": {"kaPj0O4zd8Tb7cUN": 66, "Na8lzfjv9oYMXMjl": 98, "9FTFVGUVhvKhJCme": 17}, "itemType": "EXTENSION", "listable": true, "localizations": {"cLnEkcokKwcQ0baD": {"description": "T9OyJ2h23GUS2amU", "localExt": {"7syGlElXdEAOrVSn": {}, "LocLVVYamQc4wcG5": {}, "nDBLJoJHbiQ5duE5": {}}, "longDescription": "p4cfs2E41cK8QTwi", "title": "IAvxSvNDlmM5nQFM"}, "Gzs7fzjgyc44mEh9": {"description": "tRk8knYSV30lnroQ", "localExt": {"ehMDli6t9unQLYXx": {}, "m09wpGAbpEmDY9vL": {}, "h3u6EDsUmrV6kH4O": {}}, "longDescription": "otKwG3UC6XCnnZxF", "title": "8CmQr17W65br34rB"}, "BN9tU6TDm5GloFSK": {"description": "WM1eym5ydC6p25xC", "localExt": {"WTqUOYZENJ1QHZQx": {}, "PRXH7uxBJEECQE1l": {}, "i3Bg7Jxc9pUnZmvh": {}}, "longDescription": "idwCkZwqjYLfTiCO", "title": "1NDBvQvRPnAz4VzW"}}, "lootBoxConfig": {"rewardCount": 26, "rewards": [{"lootBoxItems": [{"count": 59, "duration": 89, "endDate": "1978-04-15T00:00:00Z", "itemId": "oBCbyJsF5IjF1c0W", "itemSku": "338HS6CBgVRyihYN", "itemType": "Z84CVhziXV8HwSmv"}, {"count": 4, "duration": 4, "endDate": "1982-01-21T00:00:00Z", "itemId": "cDKF19yVRafCjOuS", "itemSku": "Yht83AdvBaagTiRJ", "itemType": "8daGTVX3Bb7jlz5I"}, {"count": 11, "duration": 52, "endDate": "1988-07-09T00:00:00Z", "itemId": "gKjI9mwJSrN8jkIy", "itemSku": "kR2zbaI6PD7fEscS", "itemType": "hnGUGUtV9GJ279GD"}], "name": "bLNwjm3FK0nnX2po", "odds": 0.613881964684072, "type": "PROBABILITY_GROUP", "weight": 50}, {"lootBoxItems": [{"count": 15, "duration": 58, "endDate": "1986-07-31T00:00:00Z", "itemId": "Htbh4HtMlFgvh2Dp", "itemSku": "2SoiIPp1yvfAHS0V", "itemType": "gLu11A3HTovFi4tP"}, {"count": 55, "duration": 56, "endDate": "1987-01-22T00:00:00Z", "itemId": "fleyCA6jEtcqsnzo", "itemSku": "VILjkwW61duF87aU", "itemType": "yrdt4XSpWBAetsan"}, {"count": 53, "duration": 43, "endDate": "1979-04-22T00:00:00Z", "itemId": "P8oxfrtbECD1CYPw", "itemSku": "aiBAxfYL8Avt70ZU", "itemType": "T2fSk3LL0calqxEe"}], "name": "wuGS469k2hG0WKt4", "odds": 0.30412873868326784, "type": "REWARD_GROUP", "weight": 39}, {"lootBoxItems": [{"count": 24, "duration": 19, "endDate": "1971-06-03T00:00:00Z", "itemId": "nYxM0UHZVNYzGMNI", "itemSku": "pWoSLkUrfuf4U3We", "itemType": "YeA9t2ENKKWrFtHI"}, {"count": 18, "duration": 92, "endDate": "1985-06-16T00:00:00Z", "itemId": "MgKAOG5iDcCR5PbC", "itemSku": "vDLil8wj9cKM3Ar6", "itemType": "MF35hCER4nGmWGgT"}, {"count": 72, "duration": 11, "endDate": "1972-10-04T00:00:00Z", "itemId": "8LMq1o2jZWu4yA3r", "itemSku": "0u4q1bTHXIjfJKyF", "itemType": "lM0u1uuoVdn9yVoS"}], "name": "lKNchPHNL4X3LLaG", "odds": 0.6708190773909882, "type": "REWARD_GROUP", "weight": 94}], "rollFunction": "CUSTOM"}, "maxCount": 90, "maxCountPerUser": 33, "name": "Dl0zp9CzHFwinkBN", "optionBoxConfig": {"boxItems": [{"count": 17, "duration": 20, "endDate": "1974-10-01T00:00:00Z", "itemId": "vqgl6TZ9TGVPmv34", "itemSku": "h6T7EsufmfxKYB4L", "itemType": "M6H6QXmpZ9X3fUSR"}, {"count": 10, "duration": 23, "endDate": "1990-09-01T00:00:00Z", "itemId": "xLPBsmAUrD9L1IiD", "itemSku": "6MlcEPhMDFzjHZ3s", "itemType": "IhzOx2CXKlvIomU3"}, {"count": 31, "duration": 50, "endDate": "1989-07-13T00:00:00Z", "itemId": "JyAK5PRMRMwdvl0h", "itemSku": "v6g62GxBW2tQF5tk", "itemType": "TjgJaMYvNQOsDa4b"}]}, "purchasable": false, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 68, "fixedTrialCycles": 14, "graceDays": 23}, "regionData": {"epqtxjbrztee7QLT": [{"currencyCode": "GAak7Kaol01DK97D", "currencyNamespace": "2xnik42miteR5eQA", "currencyType": "REAL", "discountAmount": 31, "discountExpireAt": "1998-09-26T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1998-07-23T00:00:00Z", "expireAt": "1990-04-07T00:00:00Z", "price": 100, "purchaseAt": "1977-02-25T00:00:00Z", "trialPrice": 93}, {"currencyCode": "qBPRmd6mO4oI8KDq", "currencyNamespace": "ebm83raNBJ5y7axE", "currencyType": "REAL", "discountAmount": 75, "discountExpireAt": "1982-10-14T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1978-05-18T00:00:00Z", "expireAt": "1982-09-23T00:00:00Z", "price": 73, "purchaseAt": "1986-06-11T00:00:00Z", "trialPrice": 61}, {"currencyCode": "Wf1Ybgg8rdwY9bmr", "currencyNamespace": "vHmO07KNqX9LM2Iw", "currencyType": "VIRTUAL", "discountAmount": 39, "discountExpireAt": "1980-05-15T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1988-11-23T00:00:00Z", "expireAt": "1993-09-19T00:00:00Z", "price": 88, "purchaseAt": "1985-08-14T00:00:00Z", "trialPrice": 93}], "wnzDX8v3xgC1Ge9P": [{"currencyCode": "dbTTAJ2Gp1r0sVZ6", "currencyNamespace": "LJAOddIL2l3hPjND", "currencyType": "VIRTUAL", "discountAmount": 29, "discountExpireAt": "1999-03-08T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1988-10-14T00:00:00Z", "expireAt": "1974-09-17T00:00:00Z", "price": 82, "purchaseAt": "1979-07-14T00:00:00Z", "trialPrice": 18}, {"currencyCode": "uNOmUSWw18T1IxVW", "currencyNamespace": "CxdvPL9e4P01vxP8", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1975-03-15T00:00:00Z", "discountPercentage": 65, "discountPurchaseAt": "1990-10-29T00:00:00Z", "expireAt": "1983-09-11T00:00:00Z", "price": 57, "purchaseAt": "1975-06-12T00:00:00Z", "trialPrice": 37}, {"currencyCode": "iQ272Uo9UBJWodpd", "currencyNamespace": "wsX1jorcyR0x3YiH", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1988-07-08T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1994-12-01T00:00:00Z", "expireAt": "1981-12-21T00:00:00Z", "price": 25, "purchaseAt": "1992-11-30T00:00:00Z", "trialPrice": 55}], "FMebS4AdlNzwog2I": [{"currencyCode": "hErkNhNcECWwchW6", "currencyNamespace": "zL9SkbLlrNXnGanM", "currencyType": "REAL", "discountAmount": 53, "discountExpireAt": "1971-09-17T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1998-06-20T00:00:00Z", "expireAt": "1973-12-28T00:00:00Z", "price": 22, "purchaseAt": "1995-02-05T00:00:00Z", "trialPrice": 34}, {"currencyCode": "nURH48aJuALEcSqc", "currencyNamespace": "E15u6D31DjOsrs3C", "currencyType": "REAL", "discountAmount": 6, "discountExpireAt": "1984-08-23T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1986-01-23T00:00:00Z", "expireAt": "1980-05-12T00:00:00Z", "price": 28, "purchaseAt": "1989-12-11T00:00:00Z", "trialPrice": 5}, {"currencyCode": "GbqiqOkNeATj7eGj", "currencyNamespace": "odd7CcJUrI6MAugK", "currencyType": "REAL", "discountAmount": 22, "discountExpireAt": "1977-07-19T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1983-11-19T00:00:00Z", "expireAt": "1979-05-28T00:00:00Z", "price": 86, "purchaseAt": "1978-05-30T00:00:00Z", "trialPrice": 79}]}, "saleConfig": {"currencyCode": "nFe9FmN86sK5LOq4", "price": 10}, "seasonType": "TIER", "sectionExclusive": true, "sellable": false, "sku": "nNlsa2bRBr27fVMW", "stackable": true, "status": "INACTIVE", "tags": ["dJrhQW41q2OspCZb", "t3Uta5I0uGcL1koy", "jReteIMgzISomCso"], "targetCurrencyCode": "HjCH5olYLETRpABA", "targetNamespace": "mO2EGvJ4UMS93yOx", "thumbnailUrl": "NInDByhnoluO6ti0", "useCount": 87}' \
    > test.out 2>&1
eval_tap $? 103 'CreateItem' test.out

#- 104 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'mPAnOkDiJq4xQye7' \
    --appId 'HqnVK3YVeOWs9mfV' \
    > test.out 2>&1
eval_tap $? 104 'GetItemByAppId' test.out

#- 105 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'h3jLBtn9pxpE7BYt' \
    --baseAppId 'zB0B4CxyQrUpIFvO' \
    --categoryPath 'RxTi79DpSjb39ukc' \
    --features 'R6c2E2r3vk3IfAKE' \
    --includeSubCategoryItem  \
    --itemType 'APP' \
    --limit '95' \
    --offset '33' \
    --region 'o4hNBDh9ZFP1OW0n' \
    --sortBy 'name:asc,displayOrder,displayOrder:asc' \
    --storeId 'ErQPS4VsRoYIK69y' \
    --tags 'g9ADCGiXaLs2xjHk' \
    --targetNamespace 'inOD975nARHCmhNH' \
    > test.out 2>&1
eval_tap $? 105 'QueryItems' test.out

#- 106 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'SXuqIHsxvaUoXDmw,WsukxncuD3QxCXMd,00YBWCaVVmM45mfI' \
    > test.out 2>&1
eval_tap $? 106 'ListBasicItemsByFeatures' test.out

#- 107 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'ZsWhkS476dGGJwJ0' \
    --itemIds '0UH197MJ6zU7JLMQ' \
    > test.out 2>&1
eval_tap $? 107 'GetItems' test.out

#- 108 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'yMWzYQCAaPJgoxGJ' \
    --sku 'oJaSzUtY4ZD0Xtb0' \
    > test.out 2>&1
eval_tap $? 108 'GetItemBySku' test.out

#- 109 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'U4pH16NUsVY21NVI' \
    --populateBundle  \
    --region 's7NRen2Y3Ns0QJQe' \
    --storeId 'aWytPfds1BYx0EaU' \
    --sku 'Rydf8ZyyZeHAWGgJ' \
    > test.out 2>&1
eval_tap $? 109 'GetLocaleItemBySku' test.out

#- 110 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'UbUJRMbkcTglbU86' \
    --region 'FyOjApNHBVfNOURc' \
    --storeId 'jY3YYT9oTynmfIuB' \
    --itemIds 'WgJTNFfM8M0IW4oe' \
    --userId '8KDgy0xZfAcNg14W' \
    > test.out 2>&1
eval_tap $? 110 'GetEstimatedPrice' test.out

#- 111 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 's8TIP1LKiFQoLDvu' \
    --sku 'mfqrgSfnx2h61X9d' \
    > test.out 2>&1
eval_tap $? 111 'GetItemIdBySku' test.out

#- 112 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'N1MGRXBJ6mVV7JS9,qjNLwvI8JdiY3RRi,LilmOGF6dLLIeIVI' \
    --storeId 'jMcdlbdRXTGIrdNL' \
    > test.out 2>&1
eval_tap $? 112 'GetBulkItemIdBySkus' test.out

#- 113 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '5gJPqTAjgqaTHf1A' \
    --region 'NTJ9Yk997XkGOdC6' \
    --storeId 'ItxDT8p4n4XCFkD1' \
    --itemIds 'AJLCwszbZxuHSgDO' \
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
    --platform 'K8bjoF7bL2635Kbt' \
    --userId 'ZTGJpqgl2IzNXGTu' \
    --body '{"itemIds": ["QPIDpor7t1aJLNNz", "6QIVC9Mfuc8VOsnm", "nlVljdWYmELe74p3"]}' \
    > test.out 2>&1
eval_tap $? 115 'ValidateItemPurchaseCondition' test.out

#- 116 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId '8vumnxAnYBTxaTIz' \
    --body '{"changes": [{"itemIdentities": ["0jcgDI8Pkz96vd80", "msqIm5bufnBqrpLe", "qhwVhjnnjKMEmtbi"], "itemIdentityType": "ITEM_SKU", "regionData": {"sAQHbMrKYi0Zxs5S": [{"currencyCode": "WCqZXHLLa31oQf7B", "currencyNamespace": "ULnZDhutDM6Bqguq", "currencyType": "VIRTUAL", "discountAmount": 98, "discountExpireAt": "1983-02-15T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1998-09-17T00:00:00Z", "discountedPrice": 48, "expireAt": "1991-08-10T00:00:00Z", "price": 30, "purchaseAt": "1995-02-27T00:00:00Z", "trialPrice": 41}, {"currencyCode": "Xu6opxQGRt6PqlkL", "currencyNamespace": "0diRhLC10ih2EQfY", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1981-12-09T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1999-01-27T00:00:00Z", "discountedPrice": 48, "expireAt": "1991-12-31T00:00:00Z", "price": 0, "purchaseAt": "1991-02-08T00:00:00Z", "trialPrice": 64}, {"currencyCode": "mn8Onb1a9gMz0F2U", "currencyNamespace": "BRmMhAbUWmFhdYLW", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1991-10-11T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1986-06-20T00:00:00Z", "discountedPrice": 15, "expireAt": "1999-11-17T00:00:00Z", "price": 53, "purchaseAt": "1985-03-21T00:00:00Z", "trialPrice": 95}], "6szbCCf73IFbRkPS": [{"currencyCode": "SITz4TjCrJHXGXku", "currencyNamespace": "2YVuOzhxHmnrrV9Z", "currencyType": "REAL", "discountAmount": 100, "discountExpireAt": "1980-01-27T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1982-05-31T00:00:00Z", "discountedPrice": 20, "expireAt": "1982-02-04T00:00:00Z", "price": 47, "purchaseAt": "1984-04-18T00:00:00Z", "trialPrice": 30}, {"currencyCode": "RpmKDebNkylbynkg", "currencyNamespace": "T9vayLLiizac7Ge6", "currencyType": "VIRTUAL", "discountAmount": 16, "discountExpireAt": "1989-11-11T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1976-02-02T00:00:00Z", "discountedPrice": 83, "expireAt": "1976-06-16T00:00:00Z", "price": 40, "purchaseAt": "1976-06-05T00:00:00Z", "trialPrice": 35}, {"currencyCode": "QJCiRFiZWwJ7NrTb", "currencyNamespace": "1XTB9YQzUJ9XlYJ8", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1983-12-09T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1986-04-13T00:00:00Z", "discountedPrice": 53, "expireAt": "1994-01-24T00:00:00Z", "price": 14, "purchaseAt": "1987-11-14T00:00:00Z", "trialPrice": 78}], "eBXH8x6HdVfZVDAi": [{"currencyCode": "U6iJOF7JKZFNk2NK", "currencyNamespace": "y59X8iOg2sVBiCoe", "currencyType": "VIRTUAL", "discountAmount": 68, "discountExpireAt": "1981-07-01T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1973-05-23T00:00:00Z", "discountedPrice": 73, "expireAt": "1979-04-03T00:00:00Z", "price": 43, "purchaseAt": "1986-12-02T00:00:00Z", "trialPrice": 30}, {"currencyCode": "eiMH8z8dVej8N2yv", "currencyNamespace": "6VTnOK7xAvM7tuL8", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1978-06-03T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1993-06-23T00:00:00Z", "discountedPrice": 31, "expireAt": "1983-07-10T00:00:00Z", "price": 91, "purchaseAt": "1995-05-02T00:00:00Z", "trialPrice": 90}, {"currencyCode": "3Gd2TK0HzYviTgYm", "currencyNamespace": "x82JVBRLPZ6Iz8tn", "currencyType": "REAL", "discountAmount": 17, "discountExpireAt": "1994-01-25T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1971-02-22T00:00:00Z", "discountedPrice": 37, "expireAt": "1981-08-10T00:00:00Z", "price": 37, "purchaseAt": "1987-07-18T00:00:00Z", "trialPrice": 13}]}}, {"itemIdentities": ["Gsvvdl8jHz9x7XZI", "jU4IK9lOLaZaMphK", "CqTq3EVheJjoEEXB"], "itemIdentityType": "ITEM_ID", "regionData": {"IxGnNuhoJM3WWPvv": [{"currencyCode": "CiCf33ViEdqQpoGk", "currencyNamespace": "UWNizk5UcPAGv6c1", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1993-08-15T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1974-06-17T00:00:00Z", "discountedPrice": 49, "expireAt": "1997-10-14T00:00:00Z", "price": 94, "purchaseAt": "1987-05-29T00:00:00Z", "trialPrice": 2}, {"currencyCode": "beqWBdQuWfgBAKx2", "currencyNamespace": "7MSBqabUXOGkkoMU", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1983-03-17T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1998-07-23T00:00:00Z", "discountedPrice": 0, "expireAt": "1987-10-30T00:00:00Z", "price": 9, "purchaseAt": "1998-11-23T00:00:00Z", "trialPrice": 59}, {"currencyCode": "RVfriSpPFnZBJZkD", "currencyNamespace": "nEiyfa2LrnpZxNnL", "currencyType": "VIRTUAL", "discountAmount": 69, "discountExpireAt": "1971-05-19T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1993-04-22T00:00:00Z", "discountedPrice": 41, "expireAt": "1987-01-02T00:00:00Z", "price": 77, "purchaseAt": "1992-01-07T00:00:00Z", "trialPrice": 84}], "AziBOHEAj1cT3u6Z": [{"currencyCode": "c2FbrTFznTgDIwZI", "currencyNamespace": "RWf6T3by2kYSCdnF", "currencyType": "REAL", "discountAmount": 76, "discountExpireAt": "1992-01-16T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1998-12-14T00:00:00Z", "discountedPrice": 47, "expireAt": "1971-01-18T00:00:00Z", "price": 93, "purchaseAt": "1971-03-24T00:00:00Z", "trialPrice": 22}, {"currencyCode": "qjdcEfU61OJYMnW4", "currencyNamespace": "9rWynp1ck1vT90C6", "currencyType": "REAL", "discountAmount": 10, "discountExpireAt": "1987-01-18T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1993-10-04T00:00:00Z", "discountedPrice": 90, "expireAt": "1981-11-03T00:00:00Z", "price": 43, "purchaseAt": "1977-01-24T00:00:00Z", "trialPrice": 89}, {"currencyCode": "gbUmulhe98oaFKlQ", "currencyNamespace": "icdrxVhrtwSd9QWV", "currencyType": "REAL", "discountAmount": 52, "discountExpireAt": "1982-02-11T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1996-04-28T00:00:00Z", "discountedPrice": 37, "expireAt": "1993-07-09T00:00:00Z", "price": 89, "purchaseAt": "1980-11-11T00:00:00Z", "trialPrice": 59}], "Pi57HyKKz5nyI6ul": [{"currencyCode": "KNKoXa0dgx1JgjC5", "currencyNamespace": "6pda3YhtQxpCYME6", "currencyType": "VIRTUAL", "discountAmount": 35, "discountExpireAt": "1998-08-11T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1986-01-27T00:00:00Z", "discountedPrice": 72, "expireAt": "1999-01-13T00:00:00Z", "price": 87, "purchaseAt": "1979-12-30T00:00:00Z", "trialPrice": 34}, {"currencyCode": "PAd9sxoLnWGP1Paf", "currencyNamespace": "IjLX8ce0KbNN7Ycl", "currencyType": "VIRTUAL", "discountAmount": 74, "discountExpireAt": "1990-02-09T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1977-08-20T00:00:00Z", "discountedPrice": 87, "expireAt": "1998-04-30T00:00:00Z", "price": 26, "purchaseAt": "1976-12-22T00:00:00Z", "trialPrice": 45}, {"currencyCode": "vSoaGk4ktF5wnJDg", "currencyNamespace": "9Q3WXiydCOInVols", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1985-09-30T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1975-03-20T00:00:00Z", "discountedPrice": 1, "expireAt": "1988-02-10T00:00:00Z", "price": 37, "purchaseAt": "1981-08-27T00:00:00Z", "trialPrice": 78}]}}, {"itemIdentities": ["1cfswmeFpvtDteto", "QVFL8LNW11vtpaTx", "i7k489jRCn48bvkC"], "itemIdentityType": "ITEM_ID", "regionData": {"t530Wj1WfzIvc3Vl": [{"currencyCode": "SXrA3XUGud4tVjmx", "currencyNamespace": "Ef4XvVhFJTxFHITB", "currencyType": "REAL", "discountAmount": 42, "discountExpireAt": "1986-07-10T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1981-12-08T00:00:00Z", "discountedPrice": 26, "expireAt": "1971-05-17T00:00:00Z", "price": 21, "purchaseAt": "1973-06-22T00:00:00Z", "trialPrice": 83}, {"currencyCode": "UfNfUDe4g7q6PHEa", "currencyNamespace": "qbzHvDDl1jiLw3XM", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1987-10-21T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1996-08-29T00:00:00Z", "discountedPrice": 63, "expireAt": "1979-07-11T00:00:00Z", "price": 55, "purchaseAt": "1976-03-31T00:00:00Z", "trialPrice": 39}, {"currencyCode": "mc4xYiLjLyZrXr9B", "currencyNamespace": "htzn8jAdTn6xBhrc", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1980-06-28T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1977-11-02T00:00:00Z", "discountedPrice": 36, "expireAt": "1977-07-04T00:00:00Z", "price": 78, "purchaseAt": "1979-07-05T00:00:00Z", "trialPrice": 22}], "C1uuokpaIjL0Vxe5": [{"currencyCode": "n9Lx3QcFo9gxOgvD", "currencyNamespace": "c7xMrRKvw8ISP2WK", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1985-07-31T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1996-12-17T00:00:00Z", "discountedPrice": 87, "expireAt": "1985-05-15T00:00:00Z", "price": 49, "purchaseAt": "1983-04-04T00:00:00Z", "trialPrice": 27}, {"currencyCode": "alCHtWlKxLpS8fLW", "currencyNamespace": "oQ5nuJhatQPxR7dv", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1995-08-28T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1979-02-23T00:00:00Z", "discountedPrice": 52, "expireAt": "1988-02-22T00:00:00Z", "price": 27, "purchaseAt": "1991-11-10T00:00:00Z", "trialPrice": 74}, {"currencyCode": "On8nc3gUZ8ZFyyEr", "currencyNamespace": "0KBXuJBqK4QtEydP", "currencyType": "VIRTUAL", "discountAmount": 84, "discountExpireAt": "1985-08-11T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1997-04-08T00:00:00Z", "discountedPrice": 17, "expireAt": "1993-12-17T00:00:00Z", "price": 64, "purchaseAt": "1999-12-02T00:00:00Z", "trialPrice": 96}], "FWy5cwNPI6aFo0MV": [{"currencyCode": "wDZCIXFNEL3uWVRz", "currencyNamespace": "3V7YbJM3bNLWHAbC", "currencyType": "REAL", "discountAmount": 32, "discountExpireAt": "1982-10-02T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1979-03-14T00:00:00Z", "discountedPrice": 5, "expireAt": "1999-12-14T00:00:00Z", "price": 93, "purchaseAt": "1991-01-18T00:00:00Z", "trialPrice": 57}, {"currencyCode": "0lpzcBQMAEcNcJqr", "currencyNamespace": "KxnMzSYoc4ZjiMY4", "currencyType": "VIRTUAL", "discountAmount": 67, "discountExpireAt": "1985-06-21T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1982-08-02T00:00:00Z", "discountedPrice": 98, "expireAt": "1997-01-20T00:00:00Z", "price": 19, "purchaseAt": "1975-05-06T00:00:00Z", "trialPrice": 4}, {"currencyCode": "acYHbrryHB6GO9zP", "currencyNamespace": "3FaepA3b3YJ9nJM6", "currencyType": "VIRTUAL", "discountAmount": 41, "discountExpireAt": "1987-12-03T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1992-07-07T00:00:00Z", "discountedPrice": 45, "expireAt": "1977-10-30T00:00:00Z", "price": 53, "purchaseAt": "1994-11-12T00:00:00Z", "trialPrice": 96}]}}]}' \
    > test.out 2>&1
eval_tap $? 116 'BulkUpdateRegionData' test.out

#- 117 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'SUBSCRIPTION' \
    --limit '76' \
    --offset '34' \
    --sortBy 'KmZhCZxxPPdPwOtE' \
    --storeId 'uWBSO2jJepUnEEgj' \
    --keyword 'a2mIE2kLTnJwc5Xm' \
    --language 'kCuL5W4tKt6G3j9L' \
    > test.out 2>&1
eval_tap $? 117 'SearchItems' test.out

#- 118 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '73' \
    --offset '6' \
    --sortBy 'createdAt:asc,name:asc,updatedAt:desc' \
    --storeId '7xVPqBqe9RDQMBSY' \
    > test.out 2>&1
eval_tap $? 118 'QueryUncategorizedItems' test.out

#- 119 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'AFLqp8PF5hCcoukW' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'pnbz4ys7j6lxuU3u' \
    > test.out 2>&1
eval_tap $? 119 'GetItem' test.out

#- 120 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId '2HEG0qfKegvFTD1s' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PykS8YLmwtYgWGcA' \
    --body '{"appId": "0h4G1LZ1HaX5UBMb", "appType": "GAME", "baseAppId": "X1B9oVuzG2CnYX2Y", "boothName": "BF2g7TVtzYEHUodh", "categoryPath": "3iUfBthbepUCTWiZ", "clazz": "1uqh7GAi4FEIu44u", "displayOrder": 78, "entitlementType": "DURABLE", "ext": {"ZLRxYlYqlpq03BGd": {}, "Ik4oEogFVGR71rJO": {}, "By6lsj1AKGBjnHma": {}}, "features": ["Au4YK87DYAWWcbcb", "raa5v5P5Cj8hgFsq", "GWmKgE8CZ4AELr5l"], "flexible": true, "images": [{"as": "adEoIVmprwPsa9YD", "caption": "92CX0rITajpwHITG", "height": 9, "imageUrl": "An51rVAQSxp4qTB5", "smallImageUrl": "4mKA3V9DKlCeZ7mL", "width": 43}, {"as": "sHooOIaxIpb1cIOJ", "caption": "PS3lJ80YJ41U4ooQ", "height": 53, "imageUrl": "0ywmg1pWpWit1QC7", "smallImageUrl": "FKe0fnHUlmU1unGK", "width": 78}, {"as": "WZwvTX2bamSCvX1n", "caption": "wvSWdDwD7WJHzgNZ", "height": 96, "imageUrl": "Xt3TAuKBwBcD12ae", "smallImageUrl": "6r3hHwya4NpdOzg3", "width": 16}], "inventoryConfig": {"customAttributes": {"A9DkaSOWgtg8yw8l": {}, "HEbVDwBAqanOlscR": {}, "IWw82k5K5VTkdubk": {}}, "serverCustomAttributes": {"OFldMCQ98JH4n0Jt": {}, "gqzZv5kVu4S95mj8": {}, "YRvae4f4lhBPbarb": {}}, "slotUsed": 100}, "itemIds": ["DKbLu8pnK34oA1ke", "YXJvtggDdXjbdjMB", "ahFZZGMTcqnWrIpr"], "itemQty": {"Ov0BJ9Sgl7H1sdH2": 90, "kbUiYzCQh2iNTwtn": 29, "f6IrvZoBGQbO4S3r": 96}, "itemType": "LOOTBOX", "listable": true, "localizations": {"UzPAE6SdV4D5jftR": {"description": "l9rZmtQUvro8TWwX", "localExt": {"Wsz9TVmdMKEohKzu": {}, "MYDUTLBeCidXjuGg": {}, "x8ncXejmeZtzT0qj": {}}, "longDescription": "0ltsqfiZrthVvyX0", "title": "OCKDJE3RMUddwSSg"}, "xCu8zru1DhGAYOHR": {"description": "5BWa9VzIkaQEl1iU", "localExt": {"ProNB6hI6IpGcToW": {}, "gFvdRhG9NwV3zDuq": {}, "VlVTypcYPK8IxrSZ": {}}, "longDescription": "uxWl0Je4fJIyFAm3", "title": "DQht4JwnPS2urJqe"}, "robWMZGVL5KLTxah": {"description": "WlS6XdBaKSLCgOOP", "localExt": {"XM6XTUh2dJ90yqHD": {}, "Nacl4F9G6Dl5TFwB": {}, "Y6HKXAblkT8VGgSH": {}}, "longDescription": "8MGZGwiVj7eDTaka", "title": "9ABfX1IByPEOuPhG"}}, "lootBoxConfig": {"rewardCount": 38, "rewards": [{"lootBoxItems": [{"count": 73, "duration": 31, "endDate": "1981-12-21T00:00:00Z", "itemId": "13b6o5uB2XM6IHy7", "itemSku": "EEvHyLmcvrZZOdwe", "itemType": "1x8RjU6Bi8JXE52s"}, {"count": 95, "duration": 29, "endDate": "1984-06-26T00:00:00Z", "itemId": "Bq2SimQQoLbe5YOJ", "itemSku": "vxGRxUzrTwagH7BM", "itemType": "T1IZKTdNFVBQ1crB"}, {"count": 94, "duration": 54, "endDate": "1976-06-19T00:00:00Z", "itemId": "lJkRGB8jqJEd6eqq", "itemSku": "sBVyONV0JRtozI0j", "itemType": "pliCFQ6WgJpGPigd"}], "name": "c5VyC4qvWjVac1cQ", "odds": 0.34502363967937644, "type": "REWARD_GROUP", "weight": 49}, {"lootBoxItems": [{"count": 50, "duration": 14, "endDate": "1971-11-06T00:00:00Z", "itemId": "NIUzxDgBlIbuzm7D", "itemSku": "zJ20NFRJIhFXR2dY", "itemType": "prPmbpuptECGd5cd"}, {"count": 10, "duration": 58, "endDate": "1999-12-24T00:00:00Z", "itemId": "Sesc6y68whNBYl9i", "itemSku": "CqfW6rqGOQny4ij4", "itemType": "ysYPonb59gQffkNO"}, {"count": 26, "duration": 63, "endDate": "1981-05-07T00:00:00Z", "itemId": "bxEJr2qEAuJbpZSr", "itemSku": "cbc4LWfKaY5c1tP5", "itemType": "TDuI5f6m4KC07Cns"}], "name": "Ze32hqEcB1ExYMBb", "odds": 0.898516287321368, "type": "PROBABILITY_GROUP", "weight": 22}, {"lootBoxItems": [{"count": 45, "duration": 43, "endDate": "1971-05-02T00:00:00Z", "itemId": "wjMNdxKWlBfnRyFS", "itemSku": "0Ed7gTM5AVrtBQiD", "itemType": "TcNnZa6Zuxk6u6HX"}, {"count": 95, "duration": 7, "endDate": "1994-03-03T00:00:00Z", "itemId": "PWDXTSb55g8LSTs7", "itemSku": "Nf95lGlPrf6obIdn", "itemType": "I6Ag7eUYcYJ4QzXC"}, {"count": 25, "duration": 34, "endDate": "1980-02-14T00:00:00Z", "itemId": "6gmPGaHP5SVPvRLi", "itemSku": "Di0mNHb6Lx8eq8SG", "itemType": "NwEQO8dYXvBSYvJB"}], "name": "wb6CjZUMRf2VJetW", "odds": 0.3041420866343556, "type": "PROBABILITY_GROUP", "weight": 18}], "rollFunction": "CUSTOM"}, "maxCount": 4, "maxCountPerUser": 44, "name": "9gvagF2cSuztsJ5t", "optionBoxConfig": {"boxItems": [{"count": 19, "duration": 39, "endDate": "1984-02-19T00:00:00Z", "itemId": "MTBt1xk9IyssSA8n", "itemSku": "P5PQjpzk2Tb7iYdm", "itemType": "NZWosrsVBPZ64j0H"}, {"count": 95, "duration": 35, "endDate": "1991-04-15T00:00:00Z", "itemId": "NscofwYLQcDvkaEI", "itemSku": "IPoJT83zEGXmVBZL", "itemType": "yrH9J7BoysmaORLk"}, {"count": 85, "duration": 49, "endDate": "1972-03-01T00:00:00Z", "itemId": "C2D8UT6KOc4VPDUR", "itemSku": "9ayazqXRqegIUicY", "itemType": "XXzxsBFrUs9BYp6T"}]}, "purchasable": false, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 58, "fixedTrialCycles": 36, "graceDays": 8}, "regionData": {"NARATn6KXOutlYBb": [{"currencyCode": "LhL8KXx25FZfQIod", "currencyNamespace": "VBqQsBpCJBIXLGYc", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1996-10-27T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1980-12-27T00:00:00Z", "expireAt": "1974-10-29T00:00:00Z", "price": 3, "purchaseAt": "1994-10-22T00:00:00Z", "trialPrice": 56}, {"currencyCode": "k5ozrXA4HZHNyq9o", "currencyNamespace": "danhR1Zrm3thUvV8", "currencyType": "VIRTUAL", "discountAmount": 50, "discountExpireAt": "1976-02-13T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1976-09-29T00:00:00Z", "expireAt": "1983-09-06T00:00:00Z", "price": 5, "purchaseAt": "1976-11-08T00:00:00Z", "trialPrice": 41}, {"currencyCode": "SVdleSaAylsmLYe2", "currencyNamespace": "phYOgT5kDTyPl3dK", "currencyType": "REAL", "discountAmount": 75, "discountExpireAt": "1991-07-03T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1986-09-07T00:00:00Z", "expireAt": "1976-11-25T00:00:00Z", "price": 35, "purchaseAt": "1992-10-19T00:00:00Z", "trialPrice": 79}], "VOHGwbADMfuOmh0l": [{"currencyCode": "ciRhVZ2DeoODXMzL", "currencyNamespace": "SrzoiBnYi5UWs3tY", "currencyType": "REAL", "discountAmount": 86, "discountExpireAt": "1973-04-02T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1996-04-24T00:00:00Z", "expireAt": "1991-08-19T00:00:00Z", "price": 1, "purchaseAt": "1975-04-17T00:00:00Z", "trialPrice": 81}, {"currencyCode": "JySocRvUWDOrFZKP", "currencyNamespace": "NoN9AWtLK9TFgi9j", "currencyType": "REAL", "discountAmount": 18, "discountExpireAt": "1991-08-15T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1992-07-30T00:00:00Z", "expireAt": "1996-05-04T00:00:00Z", "price": 31, "purchaseAt": "1975-09-12T00:00:00Z", "trialPrice": 12}, {"currencyCode": "Pb988NzxrDKVpULj", "currencyNamespace": "jiw3NeVG4DJi9DaM", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1972-03-09T00:00:00Z", "discountPercentage": 59, "discountPurchaseAt": "1996-08-30T00:00:00Z", "expireAt": "1987-02-22T00:00:00Z", "price": 76, "purchaseAt": "1994-03-12T00:00:00Z", "trialPrice": 63}], "9SRu0YqUxKDc84OM": [{"currencyCode": "IzvTScdbKBsAyJMz", "currencyNamespace": "4ILNDvhB4Eoes9a6", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1989-08-21T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1995-12-19T00:00:00Z", "expireAt": "1978-01-09T00:00:00Z", "price": 100, "purchaseAt": "1984-01-30T00:00:00Z", "trialPrice": 93}, {"currencyCode": "3UM08gMXhdf3juXW", "currencyNamespace": "4JprIb3CJCAtvSG8", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1978-01-06T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1971-02-01T00:00:00Z", "expireAt": "1989-07-30T00:00:00Z", "price": 34, "purchaseAt": "1991-01-25T00:00:00Z", "trialPrice": 73}, {"currencyCode": "ZFLbZEHxsDxeR6d7", "currencyNamespace": "r1SQw80JfMpPrSqY", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1979-12-29T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1994-04-17T00:00:00Z", "expireAt": "1980-05-16T00:00:00Z", "price": 33, "purchaseAt": "1978-04-05T00:00:00Z", "trialPrice": 86}]}, "saleConfig": {"currencyCode": "ETeCUYG9ccTt7Wxw", "price": 96}, "seasonType": "TIER", "sectionExclusive": true, "sellable": true, "sku": "PeczRpdk0HATGylx", "stackable": true, "status": "ACTIVE", "tags": ["DHN9mVug2zkVf6Kg", "2KNGfhzfCTxxrsRR", "Lee3TcJ7DQIi45aC"], "targetCurrencyCode": "pKOcn3tMD9UT67bO", "targetNamespace": "wugFDa6wUQvehKqw", "thumbnailUrl": "Ch86XmRkCEcfHDCd", "useCount": 23}' \
    > test.out 2>&1
eval_tap $? 120 'UpdateItem' test.out

#- 121 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'g82KgBgyCd5vjkfz' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId '3eR4DtNp129hzBw3' \
    > test.out 2>&1
eval_tap $? 121 'DeleteItem' test.out

#- 122 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'xLUcCEt0DzmkJq1s' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 25, "orderNo": "sbJ4Iu5KJ0ynxGBl"}' \
    > test.out 2>&1
eval_tap $? 122 'AcquireItem' test.out

#- 123 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'acDCdFe8ATUqVxcS' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'thrpnMUBsnUfuQIc' \
    > test.out 2>&1
eval_tap $? 123 'GetApp' test.out

#- 124 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'SbUt5UGkInFGpuUs' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dtq4dOwNESzCEW9d' \
    --body '{"carousel": [{"alt": "UVhZjLftC3sCS8Cp", "previewUrl": "LCqPD9CeDEdCnnL6", "thumbnailUrl": "Kt1Bjj3b8QM8Rr45", "type": "image", "url": "qXQgvwD3PsKDJiWx", "videoSource": "youtube"}, {"alt": "e2Ntz7EFvowPgIGu", "previewUrl": "etxFMqXCQMAqQ2ZR", "thumbnailUrl": "GzNtrThFa9XU8mos", "type": "image", "url": "M83WekqfWv04vvn9", "videoSource": "generic"}, {"alt": "uaDzsr9xYiWRuuzQ", "previewUrl": "JiLc1eI9w3JEhxPG", "thumbnailUrl": "bEk7s7gw07FlounC", "type": "video", "url": "vJKBC7SwgoViPeIB", "videoSource": "youtube"}], "developer": "Ehy0Y5aSJVDginxA", "forumUrl": "M77eY9C14FbfiI2N", "genres": ["Strategy", "Simulation", "MassivelyMultiplayer"], "localizations": {"ba1sB0HsJ06Dzfbz": {"announcement": "RYt4OVUyumBeIqdQ", "slogan": "GZC5kM03HHijsQRj"}, "7N8IAjmsonjj0ZR5": {"announcement": "0BQ1U6aFD3O2kXQS", "slogan": "c58zgZVl4gIF7v3q"}, "bZu9M3OxqVAT4H1l": {"announcement": "RZ9Z1JBrHRzEOtIx", "slogan": "zPqb6n73m0jiaDH8"}}, "platformRequirements": {"6d9rsKgzCsMulpB8": [{"additionals": "HZUtVVaJCiLgKOwr", "directXVersion": "SfWhT5B4WedopzwS", "diskSpace": "luBtRFPKThyGnbjm", "graphics": "PDKFS6u9FHuv1M3q", "label": "fch4SqIV6LQPHlae", "osVersion": "Yl4csFq65cU66yJa", "processor": "j4ovoKWE4EW0sw8v", "ram": "5peiuxoBJATauyD3", "soundCard": "XCXVMiyEvMf9yilU"}, {"additionals": "Eujk6oqYo1HQYTFz", "directXVersion": "wdOMdupwD4O3uNbc", "diskSpace": "IDcIyvZbOy1T4hfw", "graphics": "kuVykH4RpfmjIXFG", "label": "Z5PKdbabJIkNnt9P", "osVersion": "1Tkm08luh4dpPRMD", "processor": "bUXBWTbpAogG2wlZ", "ram": "kLhuU5FI8NijFI0G", "soundCard": "KwJ3vfXlsAMy2Zp2"}, {"additionals": "UAGxHnmSxvkG9UR5", "directXVersion": "q9neoW6JBcGp9Rx2", "diskSpace": "RfcRhXpmeeHdvpha", "graphics": "s9S7ivHEoLbUMM47", "label": "f1UreUpxEkXIbE1E", "osVersion": "TzRJZKMavu4Ul2Ia", "processor": "ieEbPSE7TGkeHsYs", "ram": "W9oGBN1pYMBwbPZT", "soundCard": "lMlUvFEiGprcNSQ9"}], "kEeXBZ6FVrBzyhyh": [{"additionals": "oS6a9oe0JaXFpff2", "directXVersion": "8uYbe4Cf2HEHvVev", "diskSpace": "hISjbtBJUK5fE3Ou", "graphics": "fPSX3PdOU2V9yw94", "label": "oa8UJ34TIedV3Hyo", "osVersion": "X4VnO2LpBU08wfnl", "processor": "HBXFIqFUmgUSMM5a", "ram": "u8GJT0mkVPI6zUtf", "soundCard": "3QaJPGrTNcXXTUIg"}, {"additionals": "goH89QNmI17UDb19", "directXVersion": "R6H7r1ta3m7jK5px", "diskSpace": "e82pgFiAS6piIzmc", "graphics": "8rKrKEPGSAcong6e", "label": "NERUf8kjci1Ctccv", "osVersion": "9Gv4tOcbnuCqf0lm", "processor": "6WBkIzjoSV31tvmM", "ram": "B6jzrpRGESmooHiC", "soundCard": "V4GUOnXpapXQGRak"}, {"additionals": "UbcG7PcR4eiU3Idi", "directXVersion": "55jNrGNT2VHTKuIT", "diskSpace": "5FwwHj0Ur5F2PWGT", "graphics": "TD81xhNP4t6kYBUj", "label": "yXAn3bWQF6QcAiJp", "osVersion": "XIrgroixptZhckUT", "processor": "GkcBOE4qMcH1Kyi8", "ram": "ZFvGcV8DY0XOkDst", "soundCard": "xZcY1HgAnZV4IOgl"}], "VLqb9lGAJUg21Lt7": [{"additionals": "JwgwMUSuC3Bajy3B", "directXVersion": "cEMCtQs2FcEcvVAy", "diskSpace": "Id6Cp85HVDsZBQgO", "graphics": "nXuXsGThYZrmm0wr", "label": "FMnPpWgrQD4hEk0O", "osVersion": "LjYsnignE7KcMF7f", "processor": "uDbzRRYMNXWUsp1t", "ram": "OibJY9aL9ie6vvMb", "soundCard": "iNURrlm88QlKyuoy"}, {"additionals": "a4JgakZyUV7t73Vn", "directXVersion": "SFbuxd4KYZ0jk0UZ", "diskSpace": "dhtnKu9oTc8pVkiy", "graphics": "Gsj5JdXzRxfNEjUM", "label": "Ts8WIObJBTsvsw76", "osVersion": "uISRX0bKVoWtoUW1", "processor": "P7ocuBAldDSUS7Ha", "ram": "a6unq1yQOSRvyiLB", "soundCard": "RVtIDi2piIQFVmzM"}, {"additionals": "idw70KSahpYZdKZR", "directXVersion": "yR9AX7JjxvNZhM84", "diskSpace": "DiZk6ySrB9SVFctW", "graphics": "7YS0OkL78XeEAtAL", "label": "FI3v8yha4pd5A7MY", "osVersion": "cpBD6lKNb8RxvN2u", "processor": "5J7baOeLH19fqBwN", "ram": "bNe1ffYRtIvQaKye", "soundCard": "vWYtZjK6J29v8MpB"}]}, "platforms": ["Linux", "Linux", "IOS"], "players": ["Single", "Coop", "MMO"], "primaryGenre": "Sports", "publisher": "W20UZcDaiq0nEZ7P", "releaseDate": "1983-02-28T00:00:00Z", "websiteUrl": "QfDm0RNFwiz70tRV"}' \
    > test.out 2>&1
eval_tap $? 124 'UpdateApp' test.out

#- 125 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'LMlHi8i9gOVqajUW' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rgEsWDtaKzn8dZwn' \
    > test.out 2>&1
eval_tap $? 125 'DisableItem' test.out

#- 126 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'nGeZsZVgbPzPFbrO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 126 'GetItemDynamicData' test.out

#- 127 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'MZMgWkFN7Tpkx6Gc' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fyOg6ZUrrp9ubg9m' \
    > test.out 2>&1
eval_tap $? 127 'EnableItem' test.out

#- 128 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'ndW2JKmQafUs2bxY' \
    --itemId 'ztOEyVbKIf1ZbzgU' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wd8DHoCQykmXHYmk' \
    > test.out 2>&1
eval_tap $? 128 'FeatureItem' test.out

#- 129 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'Rlg7gYs6unPYQ9jN' \
    --itemId 'QN1di1ldhOh6Hvjn' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YuV7NfC4A2ODiZhb' \
    > test.out 2>&1
eval_tap $? 129 'DefeatureItem' test.out

#- 130 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'fb8QqCyK1XH9D6vl' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '5eFdFfgK46GjCWaP' \
    --populateBundle  \
    --region '8huTmnq3FGQn3Ahu' \
    --storeId '5wxq6oJq4mChmQHQ' \
    > test.out 2>&1
eval_tap $? 130 'GetLocaleItem' test.out

#- 131 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'hO9IKBXDFQfXFD58' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sG6uDhFYlrzJBYSe' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 72, "comparison": "includes", "name": "gVZCj9ObVGT0Scwl", "predicateType": "EntitlementPredicate", "value": "m7MKclr5igjNTVIt", "values": ["nyq8OzTE89WDNoMc", "OmbfJrCJQIj1haAo", "rH2X78hxJgaVfw5V"]}, {"anyOf": 38, "comparison": "isLessThanOrEqual", "name": "KglqaCXE9ytpIO8b", "predicateType": "SeasonPassPredicate", "value": "HoSpGt1g0GGbT4Hf", "values": ["2PPKOldkbgX9CWJK", "wXXSbv5eg9q86IaD", "Fjjx6uZerWbtwTX9"]}, {"anyOf": 13, "comparison": "excludes", "name": "NRByjbE8lOLAfTXK", "predicateType": "SeasonTierPredicate", "value": "LCv8q4Thmq09bBgP", "values": ["3wDwD9RKvQX4yFQF", "AYxrBE9jlnTgtgW3", "drRoM6FoqCYw7Alx"]}]}, {"operator": "or", "predicates": [{"anyOf": 34, "comparison": "excludes", "name": "dFpc71sSck3ggZWJ", "predicateType": "EntitlementPredicate", "value": "NmvvNtjJNQepUTGh", "values": ["AEvdRF9bqMj4ro5B", "fcH7WjP7HuGz3b5W", "wlY4lPzlsCR5rVsy"]}, {"anyOf": 1, "comparison": "excludes", "name": "VE838c7OydVw0zCq", "predicateType": "EntitlementPredicate", "value": "8i8krFWJhe03coRF", "values": ["z9C05YabFX4FCK5u", "ok5d3AyGrZO8GuoX", "NSoVEBG7VbBPUWip"]}, {"anyOf": 4, "comparison": "isGreaterThanOrEqual", "name": "3rqBmILhtWm8RQvR", "predicateType": "SeasonPassPredicate", "value": "bUDSiefGEdLucrtO", "values": ["zS9SiGUjVAw4v3q6", "JRHcn7KaoCEkRdo6", "2gCQD057DrDlgC2n"]}]}, {"operator": "or", "predicates": [{"anyOf": 68, "comparison": "isGreaterThan", "name": "YIZWnXqQ1oHFJ9Q0", "predicateType": "SeasonPassPredicate", "value": "XegSEhrPpK2q8kxR", "values": ["VeHv0L2Acm960EYQ", "4BuEksS2A9VOA8H9", "EuGJVl8xs1WId9Wl"]}, {"anyOf": 1, "comparison": "is", "name": "HgoXCR6XOMXwKdfq", "predicateType": "EntitlementPredicate", "value": "xwEdkyuT3MgzReRq", "values": ["6v2AEozWWaYvBLE4", "6bpuJip8JyxJ39vr", "0112ISArROIodcmM"]}, {"anyOf": 40, "comparison": "isLessThan", "name": "mb01yA7U7dGMjupZ", "predicateType": "EntitlementPredicate", "value": "gwhYzk33J34fiTxK", "values": ["FUsUQ6ZXQcb2o1J5", "euLAbBgejqc0apxq", "63OHpnUCGBVfpctN"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 131 'UpdateItemPurchaseCondition' test.out

#- 132 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'Z209BySn8aUaGlAy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "vIslt7N1qcxKs4nl"}' \
    > test.out 2>&1
eval_tap $? 132 'ReturnItem' test.out

#- 133 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --name '9tUh74KVo6Xqjz2x' \
    --offset '96' \
    --tag 'xNf09pefgFIiJssS' \
    > test.out 2>&1
eval_tap $? 133 'QueryKeyGroups' test.out

#- 134 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "hBKsQjXvfQgQDt6c", "name": "e8NDMErA82FrR1GS", "status": "ACTIVE", "tags": ["RnoOikIxXKKIR6kP", "mswm5TCAU1cKApdJ", "DnE73GLmSZns5owB"]}' \
    > test.out 2>&1
eval_tap $? 134 'CreateKeyGroup' test.out

#- 135 GetKeyGroupByBoothName
eval_tap 0 135 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 136 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'hoUg4LsGP6KLPXkv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'GetKeyGroup' test.out

#- 137 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'Uv2XiXaBzsmaxjTZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "PlLitytGka7Kv5Ta", "name": "cQKF4OlRGdmXxETL", "status": "INACTIVE", "tags": ["MhGy83Xit6boOLGC", "cg16DqwdQPQ9HkSS", "V8e1MgTTLS2FgarY"]}' \
    > test.out 2>&1
eval_tap $? 137 'UpdateKeyGroup' test.out

#- 138 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '903INGIyEfRBEj7q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetKeyGroupDynamic' test.out

#- 139 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'ms9AGQExPhgr9gGf' \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '8' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 139 'ListKeys' test.out

#- 140 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'GjvpgJfuBs1Vpqn4' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 140 'UploadKeys' test.out

#- 141 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime '7GVghTH2wToOnq9U' \
    --limit '23' \
    --offset '76' \
    --orderNos 'yW89Xwt3wmRTrDCj,hnKvsHezWTqgYPix,tHk6lWq6tEeUmU96' \
    --sortBy 'FLEak0mJqjRYldcT' \
    --startTime 'pdeCD9XPRi4bAQL7' \
    --status 'INIT' \
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
    --orderNo '1A2E9pX0BWCMqPsR' \
    > test.out 2>&1
eval_tap $? 143 'GetOrder' test.out

#- 144 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'k5htdM5T3fDSrSHr' \
    --body '{"description": "koqv2mM6soMaTvQq"}' \
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
    --body '{"dryRun": false, "notifyUrl": "a9YdFNtRVSO0js0h", "privateKey": "G9xmSnzd7zgUxAog"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdatePaymentCallbackConfig' test.out

#- 147 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'cnGkXk17QPkJHRhm' \
    --externalId 'LKQuQVFSKiXl8G2u' \
    --limit '11' \
    --notificationSource 'ALIPAY' \
    --notificationType '6E8EajXLSAS8MKMa' \
    --offset '48' \
    --paymentOrderNo 'qWHBW78XREZCiTNA' \
    --startDate 'xq26gZrPqCsSDspv' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 147 'QueryPaymentNotifications' test.out

#- 148 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId '16sZ6rjnkH4ExObp' \
    --limit '32' \
    --offset '29' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 148 'QueryPaymentOrders' test.out

#- 149 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "RvWnfmGFy0eUoOBd", "currencyNamespace": "90h9EDqSTOfoNewW", "customParameters": {"jwMWDKEt6JhbJ0fw": {}, "TDaq6b5RpMwhWPtn": {}, "driXU9loOxpmEuwD": {}}, "description": "Vc12r0DVUGgGHkap", "extOrderNo": "TCafFMdvYiCBuzUU", "extUserId": "wyI6Vtd4v9k4fv3k", "itemType": "SEASON", "language": "Iw-eTgm", "metadata": {"Lxjt5srPFxBgpFtD": "BmTLH9kP9U53z6jo", "BAhAlJGI2YYb6ajB": "jgq6eY4PBNHKPx62", "tHxDb06ZFy3uglSp": "2UxvF2uLXWilRD7H"}, "notifyUrl": "D6LCgdFxRGj00RT6", "omitNotification": true, "platform": "vcnGMJbJIYLssMvy", "price": 97, "recurringPaymentOrderNo": "gkfTMRrXVRcAVRDX", "region": "6gmDfNfPGYYSTunM", "returnUrl": "gt3C8hEguCqlMHiQ", "sandbox": true, "sku": "3HWJw9zIWsiP2JQ2", "subscriptionId": "4meDrwEuTyM2qohg", "targetNamespace": "lzO8AEl6A9sh2x2u", "targetUserId": "r2ccp7R7OqPqIjS4", "title": "i0N9ytb3c8pVZ8Gl"}' \
    > test.out 2>&1
eval_tap $? 149 'CreatePaymentOrderByDedicated' test.out

#- 150 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'U8962e6gtn5pUARJ' \
    > test.out 2>&1
eval_tap $? 150 'ListExtOrderNoByExtTxId' test.out

#- 151 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'M1T8QwMNOAzXmyHE' \
    > test.out 2>&1
eval_tap $? 151 'GetPaymentOrder' test.out

#- 152 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'V4g9P6a280S5RNB5' \
    --body '{"extTxId": "dVCsB7xL4axSPgPC", "paymentMethod": "iwLxCFLDixZwVtt3", "paymentProvider": "PAYPAL"}' \
    > test.out 2>&1
eval_tap $? 152 'ChargePaymentOrder' test.out

#- 153 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '6LUnBBR84iAO7sBQ' \
    --body '{"description": "t6YJ2tWwF7RnP1oK"}' \
    > test.out 2>&1
eval_tap $? 153 'RefundPaymentOrderByDedicated' test.out

#- 154 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '3c4RVfjB0zi3XrYZ' \
    --body '{"amount": 95, "currencyCode": "gR70eNLHkVrEFd8x", "notifyType": "REFUND", "paymentProvider": "STRIPE", "salesTax": 100, "vat": 49}' \
    > test.out 2>&1
eval_tap $? 154 'SimulatePaymentOrderNotification' test.out

#- 155 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'JuCAIfNBSHgpFNw9' \
    > test.out 2>&1
eval_tap $? 155 'GetPaymentOrderChargeStatus' test.out

#- 156 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 156 'GetPlatformEntitlementConfig' test.out

#- 157 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedPlatformOrigins": ["Oculus", "Oculus", "Nintendo"]}' \
    > test.out 2>&1
eval_tap $? 157 'UpdatePlatformEntitlementConfig' test.out

#- 158 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 158 'GetPlatformWalletConfig' test.out

#- 159 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedBalanceOrigins": ["Other", "Epic", "Steam"]}' \
    > test.out 2>&1
eval_tap $? 159 'UpdatePlatformWalletConfig' test.out

#- 160 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
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
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}' \
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
    --endTime '9nbE2PMv12ZSRJku' \
    --limit '19' \
    --offset '21' \
    --source 'OTHER' \
    --startTime 'Pt7IYzaZUTmvsEzL' \
    --status 'FAIL' \
    --transactionId 'S1dS7H7yIS7b5TSD' \
    --userId 'RIoMg7Dc5APzfzXD' \
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
    --body '{"appConfig": {"appName": "ELJFaIaEMW5bhJyL"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "DyhBsCCbnfihnXKx"}, "extendType": "APP"}' \
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
    --body '{"description": "xaupnTTq9ihZkvFK", "eventTopic": "fSHQh8I9xk3sFl0c", "maxAwarded": 3, "maxAwardedPerUser": 50, "namespaceExpression": "uCRM69XKkLwioRaK", "rewardCode": "nWhlh80BhYe2fJDS", "rewardConditions": [{"condition": "6T75Q4ulonMFjmYq", "conditionName": "E1wJhfogWg2Apm0s", "eventName": "Uy18aWn65Co0vdCk", "rewardItems": [{"duration": 38, "endDate": "1989-04-26T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "6JSaZAIadKDEZywo", "quantity": 26, "sku": "sqMY9aulsL6NOV5a"}, {"duration": 13, "endDate": "1974-05-08T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "S6A5mkufBpWVxIK9", "quantity": 61, "sku": "mkmCWbs5qugklBUS"}, {"duration": 25, "endDate": "1981-08-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "CWGI1cIQcPWAShIh", "quantity": 17, "sku": "pcyNkUvqn6eXr6FN"}]}, {"condition": "bKJ05Orya6LSSUlu", "conditionName": "gIAknXcSaVYcAYp7", "eventName": "qSiDvsfMUOpWv46s", "rewardItems": [{"duration": 86, "endDate": "1981-05-02T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "WiywnxuDLLuIaSxo", "quantity": 23, "sku": "oID2UqO0iAXA9dB4"}, {"duration": 18, "endDate": "1982-01-13T00:00:00Z", "identityType": "ITEM_ID", "itemId": "8HDOJ8TNiP8KgEAj", "quantity": 91, "sku": "dbRTI0i6dO3zkbDs"}, {"duration": 10, "endDate": "1980-03-05T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "xt6fX9j7rhZCAlDl", "quantity": 97, "sku": "MJBjrV0p9A7tcHrV"}]}, {"condition": "0MbJGr4drgkDuWS0", "conditionName": "5m0pGzazM2BUXnzU", "eventName": "EWTiKMJAf6AgbiED", "rewardItems": [{"duration": 80, "endDate": "1989-02-08T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "dZDGwqx7T3l1ut2o", "quantity": 50, "sku": "2FBS93Mg6TKwdRMr"}, {"duration": 1, "endDate": "1994-08-23T00:00:00Z", "identityType": "ITEM_ID", "itemId": "Lrwh3d0ykRGkgqUN", "quantity": 72, "sku": "34xmIOjFLgKR4LjE"}, {"duration": 99, "endDate": "1975-03-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "OScvtQ92iD02YMvE", "quantity": 95, "sku": "PjpSAlZwFGpea5Ob"}]}], "userIdExpression": "BB49Km4ClIQmkIdL"}' \
    > test.out 2>&1
eval_tap $? 169 'CreateReward' test.out

#- 170 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'CvNhZ6P8aqZ2yfrC' \
    --limit '71' \
    --offset '98' \
    --sortBy 'namespace:desc,rewardCode:asc,namespace' \
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
    --rewardId 'zxqAw4vBGQAeh0VT' \
    > test.out 2>&1
eval_tap $? 173 'GetReward' test.out

#- 174 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'iTP4PSrXUS6jYI9l' \
    --body '{"description": "sQFD43Df5qUZOFzp", "eventTopic": "Fd6b5Jc5TETHcup8", "maxAwarded": 67, "maxAwardedPerUser": 66, "namespaceExpression": "gF3erw7UsyHq4bBb", "rewardCode": "0n1JhPUS8BRPGV9n", "rewardConditions": [{"condition": "769zLJdKMexeJc7N", "conditionName": "vgTSgKjCxZjKf8NA", "eventName": "4cGUaDfy9XnH2r0E", "rewardItems": [{"duration": 75, "endDate": "1987-05-22T00:00:00Z", "identityType": "ITEM_ID", "itemId": "5YkyhAiAItnWUmD2", "quantity": 62, "sku": "5fp1egsx3ErheNwq"}, {"duration": 6, "endDate": "1988-09-02T00:00:00Z", "identityType": "ITEM_ID", "itemId": "1z3rDwZ1HKsOpyq8", "quantity": 0, "sku": "HbfnAdtkujxHff7n"}, {"duration": 51, "endDate": "1977-01-07T00:00:00Z", "identityType": "ITEM_ID", "itemId": "NCcjgFhS0URBhl0L", "quantity": 83, "sku": "FCbOn46W2B2uPQLr"}]}, {"condition": "t2t6bVpCgKvPXSDu", "conditionName": "fmKh783cV54JsVBR", "eventName": "B0rY0xfWddACyHSm", "rewardItems": [{"duration": 30, "endDate": "1998-05-20T00:00:00Z", "identityType": "ITEM_ID", "itemId": "X9TPO3K1k5ZM8btm", "quantity": 67, "sku": "n6l5xAzc1nc3eFm9"}, {"duration": 91, "endDate": "1997-07-03T00:00:00Z", "identityType": "ITEM_ID", "itemId": "jw2fE2g6jXV7oai2", "quantity": 29, "sku": "m5pbgEt39uJQpgEt"}, {"duration": 5, "endDate": "1978-03-04T00:00:00Z", "identityType": "ITEM_ID", "itemId": "e3nt7t9ztprSfW9O", "quantity": 42, "sku": "kQ7YBhsOuJ0ypkkt"}]}, {"condition": "2G4eFh2YNsdoxpLT", "conditionName": "BM9Q8t829Ido1Jyv", "eventName": "eSRiBq23kyH9jQbH", "rewardItems": [{"duration": 99, "endDate": "1984-03-23T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "cVk0X28GS54vl7gI", "quantity": 75, "sku": "NfIZwrMxf3EnzZVn"}, {"duration": 21, "endDate": "1985-11-07T00:00:00Z", "identityType": "ITEM_ID", "itemId": "0Lb85nmpdN26BY5Y", "quantity": 71, "sku": "2u8AxE2IQeoxYV4U"}, {"duration": 5, "endDate": "1974-05-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "tEPdXXlt8geCdiXu", "quantity": 74, "sku": "iNvn7vLZ7h6alhJN"}]}], "userIdExpression": "GZF07lsPP5OfHbXz"}' \
    > test.out 2>&1
eval_tap $? 174 'UpdateReward' test.out

#- 175 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'WnVO2U4uyzZo1rj0' \
    > test.out 2>&1
eval_tap $? 175 'DeleteReward' test.out

#- 176 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ZrLQjk4VoYfIksth' \
    --body '{"payload": {"24cZBpdDFfvzeU5i": {}, "qhx6zv7EURTNIoG1": {}, "DBdoKH6sREmmfwUZ": {}}}' \
    > test.out 2>&1
eval_tap $? 176 'CheckEventCondition' test.out

#- 177 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'LZZS7snx0Q2Gd8m7' \
    --body '{"conditionName": "Y3wiNloJfey3HXL6", "userId": "SjljNPTXA3qbg55S"}' \
    > test.out 2>&1
eval_tap $? 177 'DeleteRewardConditionRecord' test.out

#- 178 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'yienCODZ0mnOpPTV' \
    --limit '48' \
    --offset '71' \
    --start 'EgBFzG8tlkxWKCU1' \
    --storeId 'XN4gl7yHvEqpJSrD' \
    --viewId 'XVwCkhOQ161TFjRO' \
    > test.out 2>&1
eval_tap $? 178 'QuerySections' test.out

#- 179 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YJm75VIuCOCkt2W1' \
    --body '{"active": true, "displayOrder": 11, "endDate": "1999-10-10T00:00:00Z", "ext": {"3WWn2ZJY3QvRa7CD": {}, "RTcsAHzD3dZyyWbU": {}, "Qpbcv3IwmL7a1K3z": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 29, "itemCount": 72, "rule": "SEQUENCE"}, "items": [{"id": "M80LLbku9GYH4ijq", "sku": "OVM50tCqkZfsSxAb"}, {"id": "DJ7sHCLup8pmEosO", "sku": "XglQwwdeLVpmXqRw"}, {"id": "Vjc3W2ANmE3VVsQ1", "sku": "fm9EUdiaRjuLsKZo"}], "localizations": {"qnpKwhpZVdw5UMa8": {"description": "ymxtEFLwELCY2vId", "localExt": {"dlxnA1VynioJcAPw": {}, "VHUGcs1ACMvoY4jW": {}, "H9dFmOHW0j9suukP": {}}, "longDescription": "E4JwQONQ2vCbMn0O", "title": "ia336uiiMTAductv"}, "UfVwLahtRedh1SiZ": {"description": "lOpIQ8GL7jBF1R5O", "localExt": {"exAPzCG6ZKQClGc1": {}, "636nbfM3J9G40Y62": {}, "bCo941ALznQuHVsk": {}}, "longDescription": "fCjUK8GeX4Q0B2Cj", "title": "0oOmBmXu1KiTTiz7"}, "yrIvQj2isN7bRwcr": {"description": "16lW5YwgZpjlMMtP", "localExt": {"Wg8217m7qNkQiKp2": {}, "oac8QTNEuBbeuQqm": {}, "9wM7mgTtUdPVcQij": {}}, "longDescription": "MBhs0kDP6d3nuUZ4", "title": "1mSeS9SnGqhJOvyk"}}, "name": "BcDpzD9zh6dtPK4f", "rotationType": "FIXED_PERIOD", "startDate": "1988-10-31T00:00:00Z", "viewId": "GHDOFjrfqJcyxT2a"}' \
    > test.out 2>&1
eval_tap $? 179 'CreateSection' test.out

#- 180 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId '7fCFAUzLELiM573T' \
    > test.out 2>&1
eval_tap $? 180 'PurgeExpiredSection' test.out

#- 181 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'dtWjfVciuLnLsBKG' \
    --storeId 'sALPuCOyphUUAV95' \
    > test.out 2>&1
eval_tap $? 181 'GetSection' test.out

#- 182 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '708zaP0wpZgQEvFz' \
    --storeId 'ox9wHocX3DRWobEo' \
    --body '{"active": false, "displayOrder": 37, "endDate": "1989-12-14T00:00:00Z", "ext": {"W97KBedcr6PM51z7": {}, "i0wQ9egK2t46EG8I": {}, "2lTviKbOgVuN3nhk": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 94, "itemCount": 81, "rule": "SEQUENCE"}, "items": [{"id": "j4P2AGeidXRRnIAJ", "sku": "fKVjOn6rtILNJVv2"}, {"id": "DLLUyBt5hDs45siG", "sku": "30Lv9iGa5mkZjnRX"}, {"id": "Vcg6AByNpBo2JYkw", "sku": "LdmR97u9MVUii4Kp"}], "localizations": {"Ycb1AUsESaBOTHnb": {"description": "X9tC9PQlFAGbMtEy", "localExt": {"bfcAl0mnsAkRT2k0": {}, "AzdgIunRkTxsGdrp": {}, "NELM8Lfkut0wnT24": {}}, "longDescription": "wh59RGSbBMh7jpsz", "title": "uVk6iPdJ2boQqCCy"}, "JfThvCJieqRSGN8M": {"description": "m74HlSZzp4aEW4Gk", "localExt": {"HG5OIVuGv47XJpkM": {}, "iopQrVL3ZZTVxqa9": {}, "XM2gY14iWk12Jffk": {}}, "longDescription": "8dwKNPUOHNZxML3y", "title": "oBM9qxd6PWz7sVnM"}, "xge2inL8fBFP1ABa": {"description": "IKrEt8d3o7cTS9OI", "localExt": {"IMErnNTLXHrsOFsb": {}, "hRow4iaYKy0IjsDg": {}, "bJ37DN2lDvdh7okH": {}}, "longDescription": "l1wMht2Izq7TCUJh", "title": "DsDefAS09VyQB1vR"}}, "name": "1mx6K17GL1CrO4Zu", "rotationType": "CUSTOM", "startDate": "1990-09-22T00:00:00Z", "viewId": "BmvdncQkcZb8cWdV"}' \
    > test.out 2>&1
eval_tap $? 182 'UpdateSection' test.out

#- 183 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'H9bww15zZsaYrJAe' \
    --storeId '5Kd5QB96ndlO6iPG' \
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
    --body '{"defaultLanguage": "C9RhzMC7V8BEphnR", "defaultRegion": "XnSpCzyb8FkoxQbr", "description": "Pngi87K58pQswqKL", "supportedLanguages": ["utINusOsa92F6iwk", "JIYOLarmpWyvib9C", "DW21ANrlpuXD9H1u"], "supportedRegions": ["1CvzWPcZwkj1l6bf", "2F9EXOBj7v8LHYiv", "mD0ekycMKlwJTNL2"], "title": "UCWUtaAD7ZZx1ief"}' \
    > test.out 2>&1
eval_tap $? 185 'CreateStore' test.out

#- 186 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'SECTION' \
    > test.out 2>&1
eval_tap $? 186 'GetCatalogDefinition' test.out

#- 187 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 187 'DownloadCSVTemplates' test.out

#- 188 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "VIEW", "fieldsToBeIncluded": ["WcDSqGYRMdz07xEJ", "40epssgJJC3CX0hp", "B1ZGMMo5DSozCuFs"], "idsToBeExported": ["rBMtoOeLfMCYxSee", "JOlxa395rghZwGhd", "ZJkkGhYvXYMIyaEM"], "storeId": "EqOpwetb82b96rsH"}' \
    > test.out 2>&1
eval_tap $? 188 'ExportStoreByCSV' test.out

#- 189 ImportStore
eval_tap 0 189 'ImportStore # SKIP deprecated' test.out

#- 190 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 190 'GetPublishedStore' test.out

#- 191 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 191 'DeletePublishedStore' test.out

#- 192 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 192 'GetPublishedStoreBackup' test.out

#- 193 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 193 'RollbackPublishedStore' test.out

#- 194 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '73hRfDgl29GWKpIt' \
    > test.out 2>&1
eval_tap $? 194 'GetStore' test.out

#- 195 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Mt4GszRufkDFLYyN' \
    --body '{"defaultLanguage": "BPlMrkse9SGcMuV5", "defaultRegion": "phhU315LUC6HSMQ3", "description": "2UznXNd6ve29lqqt", "supportedLanguages": ["cLJW9eTJvKNDFrx6", "LabyDnqXjXKPIcxh", "0x7T6RQGnnW4ugGX"], "supportedRegions": ["6mKBbgTD9xL07Zzz", "Is3Jke34ZAUuLP89", "7ooMLnemwKAvgDXN"], "title": "rFEE4Jf4hQpsLOcL"}' \
    > test.out 2>&1
eval_tap $? 195 'UpdateStore' test.out

#- 196 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tZw0efmEVcW7mxbS' \
    > test.out 2>&1
eval_tap $? 196 'DeleteStore' test.out

#- 197 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId '5UOoICxQMit8555N' \
    --action 'CREATE' \
    --itemSku 'X4Kpi8CJ88aMPGFF' \
    --itemType 'LOOTBOX' \
    --limit '89' \
    --offset '86' \
    --selected  \
    --sortBy 'updatedAt:asc,createdAt:desc,createdAt' \
    --status 'PUBLISHED' \
    --type 'CATEGORY' \
    --updatedAtEnd 'y58UKWPv3F7S0wCV' \
    --updatedAtStart 'lYQi9cfMCeNnu6OI' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 197 'QueryChanges' test.out

#- 198 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'G1PPLRDEXLXZWXvq' \
    > test.out 2>&1
eval_tap $? 198 'PublishAll' test.out

#- 199 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NCHvNpeMjMzguq6H' \
    > test.out 2>&1
eval_tap $? 199 'PublishSelected' test.out

#- 200 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FIqaqwH9J6JLb5f3' \
    > test.out 2>&1
eval_tap $? 200 'SelectAllRecords' test.out

#- 201 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SBMyJUdwEBRrHAWU' \
    --action 'UPDATE' \
    --itemSku 'bUmQmJHNffZENs9X' \
    --itemType 'BUNDLE' \
    --selected  \
    --type 'ITEM' \
    --updatedAtEnd 'FMdzryvhc1YjHmmu' \
    --updatedAtStart 'lSBIElc2CdRvBb0a' \
    > test.out 2>&1
eval_tap $? 201 'SelectAllRecordsByCriteria' test.out

#- 202 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GnMt625bWHb5sbX6' \
    --action 'CREATE' \
    --itemSku 'WhjAP57QbWvSSp71' \
    --itemType 'LOOTBOX' \
    --type 'STORE' \
    --updatedAtEnd 'EPPfmAQiqRRC2caq' \
    --updatedAtStart 'uMRtQOILcaDqUITB' \
    > test.out 2>&1
eval_tap $? 202 'GetStatistic' test.out

#- 203 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HQR5ISNoFR3GUxdM' \
    > test.out 2>&1
eval_tap $? 203 'UnselectAllRecords' test.out

#- 204 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'uvmL0UBfwzaaeP3W' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'd0Wrb8s3GW0CY0vA' \
    > test.out 2>&1
eval_tap $? 204 'SelectRecord' test.out

#- 205 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'fbq8xoCurq4lpHXr' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bVBh60NUA2aKQwnX' \
    > test.out 2>&1
eval_tap $? 205 'UnselectRecord' test.out

#- 206 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rmi6ya8u4sQPvaf1' \
    --targetStoreId 'AcweR7tJW3MLMob1' \
    > test.out 2>&1
eval_tap $? 206 'CloneStore' test.out

#- 207 ExportStore
eval_tap 0 207 'ExportStore # SKIP deprecated' test.out

#- 208 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hUnIzIpUM8KK1kGF' \
    --end 'N0NUNGKxdlAUDFQu' \
    --limit '67' \
    --offset '9' \
    --sortBy 'PzAuT7M6OBrNwioK' \
    --start 'nXPVZaDcXsV1TnsZ' \
    --success  \
    > test.out 2>&1
eval_tap $? 208 'QueryImportHistory' test.out

#- 209 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ioDiBgprzahPB0FK' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'Ma0YeyNBQWUHDBnB' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 209 'ImportStoreByCSV' test.out

#- 210 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGED' \
    --itemId 'g34WUV0WpmsQnp1n' \
    --limit '76' \
    --offset '66' \
    --sku 'LH4dSaa8XYHug51Z' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    --userId '2AQ1jvXYBar5RMmm' \
    > test.out 2>&1
eval_tap $? 210 'QuerySubscriptions' test.out

#- 211 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'GdWl0wpj5tVfKU3D' \
    > test.out 2>&1
eval_tap $? 211 'RecurringChargeSubscription' test.out

#- 212 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName '8WVPh0Z7YiGE2cyz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 212 'GetTicketDynamic' test.out

#- 213 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'TMBY7Xd0OoENg2Lw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "7uepmahXojVZYz2z"}' \
    > test.out 2>&1
eval_tap $? 213 'DecreaseTicketSale' test.out

#- 214 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'MU9jLzNV3GaG43R6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 214 'GetTicketBoothID' test.out

#- 215 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'nlRPrEAYqRBeSc5u' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 92, "orderNo": "0oZ1nXpW1l70pcZg"}' \
    > test.out 2>&1
eval_tap $? 215 'IncreaseTicketSale' test.out

#- 216 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "System", "count": 87, "currencyCode": "n4lPghHyMEHBzArb", "expireAt": "1983-04-02T00:00:00Z"}, "debitPayload": {"count": 99, "currencyCode": "5NmnSHhxNmCe4txY", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 37, "entitlementCollectionId": "YVEiaereFCPJU2wE", "entitlementOrigin": "Playstation", "itemIdentity": "8ZfwCVJW9yspUOyH", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 31, "entitlementId": "9eKeXzrvzBllwzyC"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 93, "currencyCode": "TCZs97TJI8GPrM24", "expireAt": "1987-03-12T00:00:00Z"}, "debitPayload": {"count": 8, "currencyCode": "celFgM62HQtgzQhO", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 20, "entitlementCollectionId": "R8j8DlP6OGbn8vmf", "entitlementOrigin": "Twitch", "itemIdentity": "hc8vaN1Off5gRZZM", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 14, "entitlementId": "z1EH6X2SM3xzsNrJ"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 99, "currencyCode": "Nh6GTzKjsCqxx24Q", "expireAt": "1991-10-16T00:00:00Z"}, "debitPayload": {"count": 3, "currencyCode": "b5rTfiL2P3r1a8KI", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 69, "entitlementCollectionId": "pOLJW52uz3c8pz63", "entitlementOrigin": "Twitch", "itemIdentity": "HA58Jt5NaROjSKFE", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 83, "entitlementId": "Zo2ElXYSS4ezBRSi"}, "type": "DEBIT_WALLET"}], "userId": "yReviDaxlPdhwmcH"}, {"operations": [{"creditPayload": {"balanceOrigin": "Steam", "count": 75, "currencyCode": "yoMxzRR6xd9rTh3u", "expireAt": "1980-08-24T00:00:00Z"}, "debitPayload": {"count": 9, "currencyCode": "vwgwBFehwtdJLdn3", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 41, "entitlementCollectionId": "o8beVQvgeP9qOHaL", "entitlementOrigin": "Other", "itemIdentity": "7JEMRPkdTcAzkIln", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 82, "entitlementId": "f3JA27Qz5SjzQfOL"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 54, "currencyCode": "O46OOzz9p57qSpHe", "expireAt": "1980-12-25T00:00:00Z"}, "debitPayload": {"count": 52, "currencyCode": "Y807VmBT4wZXQZZr", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 38, "entitlementCollectionId": "28qCRbwwZc4ZS1NM", "entitlementOrigin": "IOS", "itemIdentity": "koCAZuolAWnxkImV", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 23, "entitlementId": "DP0QX31gI7VmnGIR"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Other", "count": 21, "currencyCode": "Xe6BiphIFe2bzr6q", "expireAt": "1993-06-28T00:00:00Z"}, "debitPayload": {"count": 63, "currencyCode": "6fSESkM19OPMBb12", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 99, "entitlementCollectionId": "pmShlmIt2nfhUaZG", "entitlementOrigin": "Oculus", "itemIdentity": "8gISE34yIAZQeigi", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 90, "entitlementId": "3wBrmBYIlZeheP72"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "mX0iYHXBU3Uk2tQm"}, {"operations": [{"creditPayload": {"balanceOrigin": "Steam", "count": 98, "currencyCode": "7IORTyHnLYDAAg1Y", "expireAt": "1984-10-18T00:00:00Z"}, "debitPayload": {"count": 21, "currencyCode": "ruOJvSRFLDSdj8el", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 36, "entitlementCollectionId": "tHvDU91DmHzwiqVP", "entitlementOrigin": "Steam", "itemIdentity": "uITlYS2RYaD9WNKG", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 3, "entitlementId": "GKmcEKp8AQwqgJs6"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 88, "currencyCode": "aK6HEVIQJd3930TG", "expireAt": "1973-08-08T00:00:00Z"}, "debitPayload": {"count": 45, "currencyCode": "qp4O9XSjap24esyj", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 82, "entitlementCollectionId": "6Wc3migf2n6iQyr5", "entitlementOrigin": "Epic", "itemIdentity": "fAg5cFT0gHAkltcR", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 68, "entitlementId": "uzlmi2NY26xrkPPd"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "System", "count": 56, "currencyCode": "pXjmtpNfCrIj9ntY", "expireAt": "1978-05-28T00:00:00Z"}, "debitPayload": {"count": 7, "currencyCode": "dD4d3kSbTkHPMUvO", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 96, "entitlementCollectionId": "Pa315FKDjG2ApSV9", "entitlementOrigin": "Twitch", "itemIdentity": "YIyZAFQ6lZfa2jdN", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 1, "entitlementId": "pWf32JS1av9VNpVL"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "vqcfSdO1nAjY5FvA"}], "metadata": {"Db3GUQgci632w6LU": {}, "rHuKBoNTpPQXDNHt": {}, "o74GcmVf0fbCU9Qd": {}}, "needPreCheck": true, "transactionId": "JNF2hm0TqBQprHn3", "type": "whPKU5abnqw8fFa3"}' \
    > test.out 2>&1
eval_tap $? 216 'Commit' test.out

#- 217 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '32' \
    --status 'FAILED' \
    --type 'NU8570siWm3V9sir' \
    --userId 'E0JOQxWeHypqCWMD' \
    > test.out 2>&1
eval_tap $? 217 'GetTradeHistoryByCriteria' test.out

#- 218 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'PRI2cCk8zHR8VyCC' \
    > test.out 2>&1
eval_tap $? 218 'GetTradeHistoryByTransactionId' test.out

#- 219 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '0EQwE0cXokXbwKDt' \
    --body '{"achievements": [{"id": "VmrYQu7hZvHfiT9s", "value": 32}, {"id": "fiExpAgoK9YDq1x3", "value": 7}, {"id": "dJtx6GV01vD7lNLx", "value": 23}], "steamUserId": "ipIldsgB4hOxb88W"}' \
    > test.out 2>&1
eval_tap $? 219 'UnlockSteamUserAchievement' test.out

#- 220 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'gKSLIpneDQCfwucH' \
    --xboxUserId 'RL3o2NstrL6TsJeR' \
    > test.out 2>&1
eval_tap $? 220 'GetXblUserAchievements' test.out

#- 221 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'cE7GuwKn63KIDTkU' \
    --body '{"achievements": [{"id": "CqbbHGJGOTvKKRTH", "percentComplete": 60}, {"id": "roFTnAuujPeP9N0v", "percentComplete": 6}, {"id": "j6w17arNs12hOoLV", "percentComplete": 79}], "serviceConfigId": "h4AhZRe2hgU56xty", "titleId": "JtnbTDXu7FbleSP5", "xboxUserId": "PcdOuq0m0rvakR8r"}' \
    > test.out 2>&1
eval_tap $? 221 'UpdateXblUserAchievement' test.out

#- 222 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'cwojLRjhcaJ56nGl' \
    > test.out 2>&1
eval_tap $? 222 'AnonymizeCampaign' test.out

#- 223 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'YZ2tod2BGBXjNyRC' \
    > test.out 2>&1
eval_tap $? 223 'AnonymizeEntitlement' test.out

#- 224 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'tPOr1FU3QZy3gdDm' \
    > test.out 2>&1
eval_tap $? 224 'AnonymizeFulfillment' test.out

#- 225 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 's3kb1htW0UGJpwQZ' \
    > test.out 2>&1
eval_tap $? 225 'AnonymizeIntegration' test.out

#- 226 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'lXuzu3m9u67JjCDw' \
    > test.out 2>&1
eval_tap $? 226 'AnonymizeOrder' test.out

#- 227 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'g186hGWKfO9MnoT3' \
    > test.out 2>&1
eval_tap $? 227 'AnonymizePayment' test.out

#- 228 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 't99HmcxzjDhTrcBK' \
    > test.out 2>&1
eval_tap $? 228 'AnonymizeRevocation' test.out

#- 229 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'tU956hOg8oukDVdw' \
    > test.out 2>&1
eval_tap $? 229 'AnonymizeSubscription' test.out

#- 230 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'eG0sFHxTHa2k60Sz' \
    > test.out 2>&1
eval_tap $? 230 'AnonymizeWallet' test.out

#- 231 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'CqUgq1gLbcIMevTm' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 231 'GetUserDLCByPlatform' test.out

#- 232 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gv7meuQhJuq1C6JH' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 232 'GetUserDLC' test.out

#- 233 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'FTtERAXT2h3hcQ2w' \
    --activeOnly  \
    --appType 'GAME' \
    --collectionId 'ZbBTnNQnVUhA5Wnz' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'sau7wRQmL4i3eRyI' \
    --features 'ECEDa1I4lwXqwPfq,3VzHQjtolx64w1gy,vjacKtGqxMnoAXRl' \
    --fuzzyMatchName  \
    --itemId 'cq0mYWKQYlqMmu2p,vF6rP03bQaq1cT88,H6RCW8gJmGzDlqxt' \
    --limit '76' \
    --offset '37' \
    --origin 'Nintendo' \
    > test.out 2>&1
eval_tap $? 233 'QueryUserEntitlements' test.out

#- 234 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'R2AGOiPhNt2IdH8a' \
    --body '[{"collectionId": "YYUT6mma833TDzk6", "endDate": "1983-03-12T00:00:00Z", "grantedCode": "qxVWlIMY5tTJw4KV", "itemId": "104MtMhKHmSjqPuQ", "itemNamespace": "ZX5KjdNrEwfWo2Mw", "language": "kMm", "origin": "Oculus", "quantity": 46, "region": "bsO4YHEYLjTSNDf3", "source": "REDEEM_CODE", "startDate": "1995-01-02T00:00:00Z", "storeId": "4CXVMrDYKe2eTf1a"}, {"collectionId": "xo16GqT2vSLLiMvc", "endDate": "1981-07-13T00:00:00Z", "grantedCode": "39YZJypWzpNXgnoK", "itemId": "Iz8O8NglJtZTh280", "itemNamespace": "vflFMxIhlIT8AgyZ", "language": "faou", "origin": "Epic", "quantity": 96, "region": "zOrTn2huwPgyUzBU", "source": "IAP", "startDate": "1973-10-26T00:00:00Z", "storeId": "eDNfUESLlwHv3Jgt"}, {"collectionId": "eOLyKp8a1VqxXnRh", "endDate": "1986-09-12T00:00:00Z", "grantedCode": "d9TGkO6aIYqftw1S", "itemId": "rM2nhSEanfUYrMU6", "itemNamespace": "A43UKGpvC1cr5T1P", "language": "lzII", "origin": "System", "quantity": 42, "region": "hveGg97PY0txzvYw", "source": "PURCHASE", "startDate": "1988-12-27T00:00:00Z", "storeId": "atn9EQv2Oj8TFNeG"}]' \
    > test.out 2>&1
eval_tap $? 234 'GrantUserEntitlement' test.out

#- 235 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'tJGjKbMgCeuAYuzr' \
    --activeOnly  \
    --appId 'mbWofEaKStqdKu4R' \
    > test.out 2>&1
eval_tap $? 235 'GetUserAppEntitlementByAppId' test.out

#- 236 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'OnONpJ849chqeiUG' \
    --activeOnly  \
    --limit '86' \
    --offset '17' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 236 'QueryUserEntitlementsByAppType' test.out

#- 237 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'vURYZCeF30RT9rBg' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --platform 'l3hHMSLAiscGRWzk' \
    --itemId 'Cl1ZKuPxjDUGRGcC' \
    > test.out 2>&1
eval_tap $? 237 'GetUserEntitlementByItemId' test.out

#- 238 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'EPjbUy7F82Adu9BY' \
    --ids 'RHrVTehrqgvEtEs2,LpE0qfbvdU8hlDoC,9FnxqBlPBYJ7X6uV' \
    --platform 'y7FWTSfMi2CPVGxj' \
    > test.out 2>&1
eval_tap $? 238 'GetUserActiveEntitlementsByItemIds' test.out

#- 239 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'cdpdCqVeePMSqb8y' \
    --activeOnly  \
    --entitlementClazz 'OPTIONBOX' \
    --platform 'qJTUQY40Zrpn0vAD' \
    --sku '9YsPeDWrAVQZSvgW' \
    > test.out 2>&1
eval_tap $? 239 'GetUserEntitlementBySku' test.out

#- 240 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'uCuLsUGrVQAbhS54' \
    --appIds 'ZuQHKersDmJLUHAK,tfXCKOna8DdjtZhh,6ofsUoRh6r0e0J6v' \
    --itemIds 'yqPw7YlmV3kES0Hi,88UYgSV40OvY7apP,CrN5bEhmuHgKeWiz' \
    --platform 'Epw1zN0mOYgGhHMz' \
    --skus '9dddLWJWDuSYtCaI,v4Lp91wYUJPbvzn8,TYoMDAaUXSuBQdvd' \
    > test.out 2>&1
eval_tap $? 240 'ExistsAnyUserActiveEntitlement' test.out

#- 241 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'hJoT0WK5ngNUxDKf' \
    --platform 'ZYofPGUbSaA00nKx' \
    --itemIds 'QjYU6KlavIiLxU2I,1GyJS48Hxu8Ju4XS,AnlXRYB9BgSZBvke' \
    > test.out 2>&1
eval_tap $? 241 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 242 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'hRn83B0nrW1qx3NJ' \
    --appId 'TugVWXz8dv7BiEUq' \
    > test.out 2>&1
eval_tap $? 242 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 243 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'nzxs2deMF8UAJIHE' \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'K9Yb68a8ygYx2Tqk' \
    --itemId 'hlqMnE9Wj90EQzOi' \
    > test.out 2>&1
eval_tap $? 243 'GetUserEntitlementOwnershipByItemId' test.out

#- 244 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'drWnLrXqImgDf3Ga' \
    --ids 'JsdCZND0wgYOilX1,e1825iasunESjcgr,2drXG5NkKCySLA8c' \
    --platform 'KCs0dFYRSa2OULZ0' \
    > test.out 2>&1
eval_tap $? 244 'GetUserEntitlementOwnershipByItemIds' test.out

#- 245 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'iOZJiOAh1SpLhMF2' \
    --entitlementClazz 'OPTIONBOX' \
    --platform 'zDm3hJdd6uaO9TiT' \
    --sku 'PnIh2iaIBpYC4txu' \
    > test.out 2>&1
eval_tap $? 245 'GetUserEntitlementOwnershipBySku' test.out

#- 246 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'l6VKYlNYYlHPwKDp' \
    > test.out 2>&1
eval_tap $? 246 'RevokeAllEntitlements' test.out

#- 247 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'JmkeoAkp3Z4pgyJY' \
    --entitlementIds 'wclb4gd4QgQut2hi' \
    > test.out 2>&1
eval_tap $? 247 'RevokeUserEntitlements' test.out

#- 248 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'PuDdOPHcN9drwqyt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ieXpIZfr5XDq9dGL' \
    > test.out 2>&1
eval_tap $? 248 'GetUserEntitlement' test.out

#- 249 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'HjtgE2bTXJxCCFqP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NDqWrpkWnnova15W' \
    --body '{"collectionId": "VuE5cYVP9tQSa27B", "endDate": "1977-12-12T00:00:00Z", "nullFieldList": ["WjAh4gy41LLzQ2Ij", "Y5PeNr4JmYxH2qs2", "8hePJjMp0TKKUBfP"], "origin": "Xbox", "reason": "mKdXiiTObNdqkWa1", "startDate": "1999-07-09T00:00:00Z", "status": "ACTIVE", "useCount": 34}' \
    > test.out 2>&1
eval_tap $? 249 'UpdateUserEntitlement' test.out

#- 250 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId '3pgHx6uPf6jQZcYe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rH933X7iXEEM2KOu' \
    --body '{"options": ["sNEHcI95GGdJvucD", "bs6UdccuM2ykRj3W", "nyAaUaQBKFedL2ud"], "platform": "uXvZUbQQ13FhD3NE", "requestId": "xUFipJsUiDawAjgH", "useCount": 64}' \
    > test.out 2>&1
eval_tap $? 250 'ConsumeUserEntitlement' test.out

#- 251 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'M7a2UZgeesipbP02' \
    --namespace "$AB_NAMESPACE" \
    --userId '7okM5E8tAajVSvLR' \
    > test.out 2>&1
eval_tap $? 251 'DisableUserEntitlement' test.out

#- 252 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'j306RDuaSixXEdlo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YZBkatNLc42eq0O6' \
    > test.out 2>&1
eval_tap $? 252 'EnableUserEntitlement' test.out

#- 253 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'VsXtOlQwj5xPvm7c' \
    --namespace "$AB_NAMESPACE" \
    --userId '5nPR0Y1sffUaZ64d' \
    > test.out 2>&1
eval_tap $? 253 'GetUserEntitlementHistories' test.out

#- 254 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'Fpiv8o9Gw4QtKgyI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eySoUxoMrj2J4JGQ' \
    > test.out 2>&1
eval_tap $? 254 'RevokeUserEntitlement' test.out

#- 255 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'ZAtyjTxnlmSyjEaF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'H2DRN6HIEqIFEcS0' \
    --body '{"reason": "ynIMOYWpUYUQMooi", "useCount": 74}' \
    > test.out 2>&1
eval_tap $? 255 'RevokeUserEntitlementByUseCount' test.out

#- 256 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId '6M2XizikCh6q0yq2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WAHtL7IWE3MFqvfD' \
    --quantity '66' \
    > test.out 2>&1
eval_tap $? 256 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 257 RevokeUseCount
eval_tap 0 257 'RevokeUseCount # SKIP deprecated' test.out

#- 258 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'OjW1iSYQbcebBd5w' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b5H3qppoCiHMD4iB' \
    --body '{"platform": "K2O7qYtOHV5hnpjc", "requestId": "5CNLnnEvo25aEtdj", "useCount": 23}' \
    > test.out 2>&1
eval_tap $? 258 'SellUserEntitlement' test.out

#- 259 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hjh0aTjIOaQt0snb' \
    --body '{"duration": 63, "endDate": "1999-02-12T00:00:00Z", "entitlementCollectionId": "yMvqF7TJ9uB0zypj", "entitlementOrigin": "Twitch", "itemId": "iKR29LKIhNU43K8b", "itemSku": "ihdw3prp0UHlWUxk", "language": "BefhxRtrqbv56oqw", "metadata": {"nCLVc2qHZuuedbBO": {}, "d19DqZJRYV1oqNLm": {}, "PAUIMwa2wYq6DsUq": {}}, "order": {"currency": {"currencyCode": "38bYvaWLoKzHnngd", "currencySymbol": "fFnOfY9stXH6LYXX", "currencyType": "REAL", "decimals": 74, "namespace": "dxBPKmHVB7cNzHhv"}, "ext": {"xc4xAPZ86WNnQOhu": {}, "sPn4466u8agb5HPs": {}, "BU0Eo6QJ9vBRJ4UP": {}}, "free": false}, "orderNo": "fabC01Thm9f4AWpy", "origin": "IOS", "overrideBundleItemQty": {"i0ifdPyKf3SwHekW": 71, "CJaOHzpb623EciYo": 100, "OPVg6DLEZ6DxpwBm": 91}, "quantity": 81, "region": "gZxSYnVwXqF6K0WA", "source": "IAP_CHARGEBACK_REVERSED", "startDate": "1986-03-24T00:00:00Z", "storeId": "mHHoz6qBQnEDgX49"}' \
    > test.out 2>&1
eval_tap $? 259 'FulfillItem' test.out

#- 260 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'n1xTDFcmOm1sqdIW' \
    --body '{"code": "U6ERylESgf5dXMrP", "language": "nz", "region": "emsp7o3F2LQw7Y2V"}' \
    > test.out 2>&1
eval_tap $? 260 'RedeemCode' test.out

#- 261 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'dSxgXez7VvS0C9JL' \
    --body '{"itemId": "VQQPa7PPx4Zi6WaC", "itemSku": "8wk7HMbJhNwZgf5n", "quantity": 24}' \
    > test.out 2>&1
eval_tap $? 261 'PreCheckFulfillItem' test.out

#- 262 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'aW5xz1c7ZuZXUCBY' \
    --body '{"entitlementCollectionId": "nkY0LEBSYBdUSiTO", "entitlementOrigin": "Oculus", "metadata": {"F8jtNAVOYqSH533Y": {}, "lJ93CCGBXv4fP4VP": {}, "zhcH4UJrrCKvrOAi": {}}, "origin": "IOS", "rewards": [{"currency": {"currencyCode": "f73jAevOnES6YJLl", "namespace": "b2AfUEEBbqMMKvkO"}, "item": {"itemId": "sR1fHUyirMVMOFES", "itemSku": "2J2OzNlJE3uqZz57", "itemType": "4g31cA0PwZxTIZVS"}, "quantity": 67, "type": "ITEM"}, {"currency": {"currencyCode": "imJHNI0l6jJVzF1O", "namespace": "i2sQuWUBBHZonSmz"}, "item": {"itemId": "F831vlCiZAZHCWMX", "itemSku": "xVh8HTrKqVwnpPn8", "itemType": "N5xMRgU7cPqNZrLC"}, "quantity": 88, "type": "ITEM"}, {"currency": {"currencyCode": "ysya4J3rvTzMTMSw", "namespace": "rNov2GW9i54JY23A"}, "item": {"itemId": "UWFTLq0W1JqwKs1m", "itemSku": "O80L7IOHlf6j8PZO", "itemType": "zUiQKZqz5NSp0B7L"}, "quantity": 83, "type": "CURRENCY"}], "source": "SELL_BACK", "transactionId": "21cS6IVE4fzwG3BH"}' \
    > test.out 2>&1
eval_tap $? 262 'FulfillRewards' test.out

#- 263 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'aRcZ8NK4gkLmvEOa' \
    --endTime 'RcqTgF0xtQAXoDoF' \
    --limit '21' \
    --offset '53' \
    --productId 'mA3fgzcwdgJMjIyG' \
    --startTime 'fiNBQy41M1gzGCba' \
    --status 'FULFILLED' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 263 'QueryUserIAPOrders' test.out

#- 264 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'w33rNbE4bbDU4FMT' \
    > test.out 2>&1
eval_tap $? 264 'QueryAllUserIAPOrders' test.out

#- 265 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'bQaANJOODGerDCWc' \
    --endTime 'l3VSJENQopeHD6iK' \
    --limit '56' \
    --offset '74' \
    --startTime 'Gm5Cj7RqnJUmfDmo' \
    --status 'FAIL' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 265 'QueryUserIAPConsumeHistory' test.out

#- 266 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'xvN8pRGoUtmbWZbE' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "rD-EcZy-Cr", "productId": "qNcQFFyHv141NPqj", "region": "RUMKSQjFdjqTaZFs", "transactionId": "WzbqwTZQIN5jC6a8", "type": "OCULUS"}' \
    > test.out 2>&1
eval_tap $? 266 'MockFulfillIAPItem' test.out

#- 267 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'cG6XxENbWqlX7idz' \
    --itemId 'jpKDfwl6XlCF6YxF' \
    --limit '79' \
    --offset '36' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 267 'QueryUserOrders' test.out

#- 268 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ryiMMt6fQtLhzyla' \
    --body '{"currencyCode": "quioT3QBt29AiRAS", "currencyNamespace": "suFM4ahGw7XcF1Qw", "discountedPrice": 52, "entitlementPlatform": "IOS", "ext": {"z606UGXPhoNZlXMe": {}, "f7AvS3TfKx6ByTyg": {}, "btOtcQS4Cmgw1wRU": {}}, "itemId": "nIVYxY6OhdkrYiCi", "language": "noVOzo4Plv1IlTpE", "options": {"skipPriceValidation": false}, "platform": "Playstation", "price": 18, "quantity": 94, "region": "qbPnXEuOzzkoBmMR", "returnUrl": "9C4qPqJrAdh1HIk7", "sandbox": true, "sectionId": "kyxoUzfMFoXCOguS"}' \
    > test.out 2>&1
eval_tap $? 268 'AdminCreateUserOrder' test.out

#- 269 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'q2A4R3wDdSkNfHJt' \
    --itemId 'A3QiX9ZvtydbaVb0' \
    > test.out 2>&1
eval_tap $? 269 'CountOfPurchasedItem' test.out

#- 270 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'scd97A0GP6djn2Ps' \
    --userId '3IVT5hUZ3cnDq0dd' \
    > test.out 2>&1
eval_tap $? 270 'GetUserOrder' test.out

#- 271 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZG0EpfGAqHKcSxUc' \
    --userId '2YgRpk2IFGIgIpsc' \
    --body '{"status": "CHARGEBACK_REVERSED", "statusReason": "pVAciu2XPPUxzXHU"}' \
    > test.out 2>&1
eval_tap $? 271 'UpdateUserOrderStatus' test.out

#- 272 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'vxhvTZcvRKoaM4oz' \
    --userId 'SAg8FTLrByWOJhbo' \
    > test.out 2>&1
eval_tap $? 272 'FulfillUserOrder' test.out

#- 273 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'coGlPzdfxcC3rpWh' \
    --userId 'Spq0InxMLpP7n7M3' \
    > test.out 2>&1
eval_tap $? 273 'GetUserOrderGrant' test.out

#- 274 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'JXjEvsj5WcQ99M1y' \
    --userId 'uXeqV31LX2ehcMnM' \
    > test.out 2>&1
eval_tap $? 274 'GetUserOrderHistories' test.out

#- 275 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo '6QtjzQjDlUMCGnxZ' \
    --userId 'wak7KHnzGASmVzeP' \
    --body '{"additionalData": {"cardSummary": "Iroz41oQCuXeTRyJ"}, "authorisedTime": "1992-03-28T00:00:00Z", "chargebackReversedTime": "1980-11-24T00:00:00Z", "chargebackTime": "1972-11-05T00:00:00Z", "chargedTime": "1995-01-19T00:00:00Z", "createdTime": "1971-05-14T00:00:00Z", "currency": {"currencyCode": "4seYCyiB4tDCWx3c", "currencySymbol": "EX8wTi1v2abpCWyt", "currencyType": "VIRTUAL", "decimals": 31, "namespace": "i9Ze0hL9rPkV5GkS"}, "customParameters": {"rcl2O47XVzU7qlNV": {}, "k7qnmBS3XKDhp1Ok": {}, "McErmeH0lX1hj0La": {}}, "extOrderNo": "XgQ94flh775AQfzN", "extTxId": "jQ7IuMSY2epRDJjD", "extUserId": "yMDKQhuTjtQZyIiA", "issuedAt": "1977-10-31T00:00:00Z", "metadata": {"CL8bNTTfqLCv9DYB": "OProN4UWbQaKFrTv", "4JWElmOCxqPrq9I3": "XJWBxTLcOef8MgIw", "krKFEtwESJCe2ksG": "3nZE13H2fILFzOlA"}, "namespace": "ZbDQAEJLbVWH2XLI", "nonceStr": "g3MgmdSvWp3h0xPs", "paymentMethod": "VY8qNwB2TY4v9NNf", "paymentMethodFee": 87, "paymentOrderNo": "MFsZAIqak1zi0JSa", "paymentProvider": "STRIPE", "paymentProviderFee": 6, "paymentStationUrl": "IwZdW02Su6aCnL81", "price": 61, "refundedTime": "1971-12-11T00:00:00Z", "salesTax": 69, "sandbox": false, "sku": "6gOBUIMeL0GL3aef", "status": "REFUND_FAILED", "statusReason": "KTTUxG0mpmFxxDNX", "subscriptionId": "GlGJvHf558h1ltyh", "subtotalPrice": 18, "targetNamespace": "jsu6ZJRCoDq3geuH", "targetUserId": "FFaZzPIjETqcKN1g", "tax": 0, "totalPrice": 86, "totalTax": 52, "txEndTime": "1998-08-11T00:00:00Z", "type": "rtjWpJAlKHF0ebxh", "userId": "J1176CeD4dWCp4wq", "vat": 23}' \
    > test.out 2>&1
eval_tap $? 275 'ProcessUserOrderNotification' test.out

#- 276 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hO3lGZ7eGOPj2XoF' \
    --userId 'ug8BUQUmPHnPumca' \
    > test.out 2>&1
eval_tap $? 276 'DownloadUserOrderReceipt' test.out

#- 277 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'zKAna0ji757aNDFe' \
    --body '{"currencyCode": "KnQP2j2WsQImTwYk", "currencyNamespace": "iuxzLrbJ0BkGzCNg", "customParameters": {"esQlZZHIZH0iks6k": {}, "x0adnimPyyzezsHd": {}, "FftHHR6xbcVVonwz": {}}, "description": "27DWfGRVhbZTvCPr", "extOrderNo": "rZCTU5WUJizF69PS", "extUserId": "squWUafwbFPX1563", "itemType": "SEASON", "language": "igC_TT", "metadata": {"qvfHmFvUZiUW5Y0C": "Yw5OXSGwQkJuy9oL", "FcHHcraLXR2n9JQv": "q7NKWIHYsii3fCh7", "sieJjZPAkiWumllU": "31uXPwYxedGHCIkm"}, "notifyUrl": "t4bfJOhNaIT0pv7X", "omitNotification": false, "platform": "kRhtrBcBofWTGYx2", "price": 17, "recurringPaymentOrderNo": "aDxvxwaLM8HkVOW8", "region": "PnLkgqkqYZWPZTgK", "returnUrl": "agTzdcYcko7U3gH2", "sandbox": false, "sku": "9LhRx2Laa2RdtVb6", "subscriptionId": "VgA5yFIH3s9UyeaF", "title": "i8OE7BCK4FeVGrl5"}' \
    > test.out 2>&1
eval_tap $? 277 'CreateUserPaymentOrder' test.out

#- 278 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'NpUG9zblWEiHaUjy' \
    --userId 'THb0sSlstb3slUe9' \
    --body '{"description": "4NxhXsVcqTYi1TMB"}' \
    > test.out 2>&1
eval_tap $? 278 'RefundUserPaymentOrder' test.out

#- 279 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'MzaOrxuKvtUVtqbD' \
    --body '{"code": "WnJ2i9TRmJOqIl7U", "orderNo": "12hO5vpk9DOSgbsd"}' \
    > test.out 2>&1
eval_tap $? 279 'ApplyUserRedemption' test.out

#- 280 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'GVPLD9A5NmuZDUV3' \
    --body '{"meta": {"yHurgOfba1XeoHYT": {}, "NoRol84UlkxtP5Vo": {}, "k9sNK1ORg3tChsS3": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "wcWYyj3JvHqXp4JR", "namespace": "7xI59Z9tfGVsglnO"}, "entitlement": {"entitlementId": "xOXBfgBLuglkd9LI"}, "item": {"entitlementOrigin": "Nintendo", "itemIdentity": "XYL0fJOPYpnPqGlP", "itemIdentityType": "ITEM_ID", "origin": "Nintendo"}, "quantity": 15, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Steam", "currencyCode": "YY1vlV0M2g6oreqy", "namespace": "BzWzCgMMWZuD6tmI"}, "entitlement": {"entitlementId": "R28xVxbtpSKOfiIP"}, "item": {"entitlementOrigin": "Oculus", "itemIdentity": "pypZqISn3msrykQF", "itemIdentityType": "ITEM_SKU", "origin": "System"}, "quantity": 38, "type": "ITEM"}, {"currency": {"balanceOrigin": "IOS", "currencyCode": "GKFZLrIfqrZuu7Iw", "namespace": "KcT7sAsv2TKCbYMV"}, "entitlement": {"entitlementId": "kXEHmsHwIGGsusS0"}, "item": {"entitlementOrigin": "Playstation", "itemIdentity": "t23pci6xEljer6aG", "itemIdentityType": "ITEM_ID", "origin": "Other"}, "quantity": 36, "type": "ITEM"}], "source": "ORDER", "transactionId": "84dt0TSTmy7XF26K"}' \
    > test.out 2>&1
eval_tap $? 280 'DoRevocation' test.out

#- 281 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId '2U7xttUz8nWKJjv0' \
    --body '{"gameSessionId": "6PuffHghAQfAsYXV", "payload": {"zBenLtaAoYyRfiCW": {}, "rm3s1Ah3TII70MIc": {}, "BMJ04508jKedx0CV": {}}, "scid": "Rpd7SwZw2UkjDzJ4", "sessionTemplateName": "NuMMgI13nplXaUQV"}' \
    > test.out 2>&1
eval_tap $? 281 'RegisterXblSessions' test.out

#- 282 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '5QEvKElLfbB7gwwA' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId '1xFrnyirw3iJt5iA' \
    --limit '94' \
    --offset '72' \
    --sku 'JCSugdo4XTm8t1YT' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 282 'QueryUserSubscriptions' test.out

#- 283 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'tjNWXm9sraeMA78Y' \
    --excludeSystem  \
    --limit '91' \
    --offset '89' \
    --subscriptionId '7UfYSrdN0JVz4U43' \
    > test.out 2>&1
eval_tap $? 283 'GetUserSubscriptionActivities' test.out

#- 284 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'EcV1FRyeeqehMNeR' \
    --body '{"grantDays": 75, "itemId": "LO03mnFSq9jJTVFo", "language": "FjxZjh5qUR1Pq4a4", "reason": "uaMfd0SQAfYIyzHL", "region": "8jxakuVu5r5B08VZ", "source": "xI4TU3apnZXoJ4gI"}' \
    > test.out 2>&1
eval_tap $? 284 'PlatformSubscribeSubscription' test.out

#- 285 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '4EQKO8xC4D0FsUo3' \
    --itemId 'IB2kX5REQZsHyXzo' \
    > test.out 2>&1
eval_tap $? 285 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 286 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'IXNf0KbL9HyJttdg' \
    --userId 'fLGO3ummpllnV6B6' \
    > test.out 2>&1
eval_tap $? 286 'GetUserSubscription' test.out

#- 287 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '2P1Kazg73c6UpmA4' \
    --userId 'ehxNIIlcrZzgameT' \
    > test.out 2>&1
eval_tap $? 287 'DeleteUserSubscription' test.out

#- 288 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '2mLkkAMjHyI0e2Ax' \
    --userId 'j0nZHjmoKHJngwMe' \
    --force  \
    --body '{"immediate": true, "reason": "AnQVj6QQjZtkNJCn"}' \
    > test.out 2>&1
eval_tap $? 288 'CancelSubscription' test.out

#- 289 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'DSrsSey2BqOxgwCy' \
    --userId 'mCDYsuff3b7G5FDX' \
    --body '{"grantDays": 69, "reason": "mu0qPHb9Ll2EFEb8"}' \
    > test.out 2>&1
eval_tap $? 289 'GrantDaysToSubscription' test.out

#- 290 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'GnsthmQ2Y6ZGOiqr' \
    --userId 'g3lpqN5bOfnqJ5bz' \
    --excludeFree  \
    --limit '60' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 290 'GetUserSubscriptionBillingHistories' test.out

#- 291 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'RzbhMxfEDE4TrtIH' \
    --userId 'yyMq79EdB9MxaF8Q' \
    --body '{"additionalData": {"cardSummary": "HGM2IuQYBO8m0HgT"}, "authorisedTime": "1981-03-02T00:00:00Z", "chargebackReversedTime": "1978-03-18T00:00:00Z", "chargebackTime": "1990-01-28T00:00:00Z", "chargedTime": "1971-05-22T00:00:00Z", "createdTime": "1995-05-14T00:00:00Z", "currency": {"currencyCode": "VwR3yNKDtMqMrAGp", "currencySymbol": "dyF6WDHn3ePBxQNz", "currencyType": "VIRTUAL", "decimals": 62, "namespace": "V3BD1nnEzoUlUWqP"}, "customParameters": {"4ElzL44KEm3uHBMC": {}, "P5ckjphURs4ksgsK": {}, "J2R6Jacwwu8W1zvr": {}}, "extOrderNo": "KMRPvwA9k6yJz03N", "extTxId": "ETdywPqYerrpOm4M", "extUserId": "2pM4fIfcHBWZM50a", "issuedAt": "1988-09-17T00:00:00Z", "metadata": {"bPXRns3qwYL6LwGl": "ZGF7XQPLAcIL7FvA", "MWqhyyNZH1CducB5": "y5iMdeBG7REG4meK", "EabfVXBJPIZqZC5d": "6JuFdcfiNf0DOHKw"}, "namespace": "xDF5GJhCjVHiCn2h", "nonceStr": "TefT8gPFJ4WndMpQ", "paymentMethod": "hcLK0WTZbtmQkwC8", "paymentMethodFee": 0, "paymentOrderNo": "ug3nCXhD7FUz1iOe", "paymentProvider": "STRIPE", "paymentProviderFee": 80, "paymentStationUrl": "Ha0LmseIRXeoerZA", "price": 49, "refundedTime": "1981-01-09T00:00:00Z", "salesTax": 12, "sandbox": true, "sku": "zssA284mG7uAojLY", "status": "DELETED", "statusReason": "7CmSiKPjcwAw5Gdx", "subscriptionId": "pvLfa4b4hTaZBGdX", "subtotalPrice": 32, "targetNamespace": "DqPTdurR3MYda0Y0", "targetUserId": "BCO4qPnvxERWjKas", "tax": 35, "totalPrice": 56, "totalTax": 62, "txEndTime": "1984-12-15T00:00:00Z", "type": "rDbQ1ZzhDuLHq9LT", "userId": "BstguOdN0O7l3GbK", "vat": 86}' \
    > test.out 2>&1
eval_tap $? 291 'ProcessUserSubscriptionNotification' test.out

#- 292 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'JrkzwR40tfd9GFXC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'htxB10d4Q8nlBthU' \
    --body '{"count": 92, "orderNo": "yOVYrTdDq7IqbTVv"}' \
    > test.out 2>&1
eval_tap $? 292 'AcquireUserTicket' test.out

#- 293 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId '8BLsqQW8HSrEm5Y7' \
    > test.out 2>&1
eval_tap $? 293 'QueryUserCurrencyWallets' test.out

#- 294 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'jI232SjktijiNzTU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e8KdizXmrmK0sCUs' \
    --body '{"allowOverdraft": true, "amount": 65, "balanceOrigin": "Playstation", "balanceSource": "OTHER", "metadata": {"523OTvOmfVNJNDaS": {}, "O3FEkk4It6V8Bu7r": {}, "IjGrxUMKbv60ixUu": {}}, "reason": "UhopdqGrqRZ124P7"}' \
    > test.out 2>&1
eval_tap $? 294 'DebitUserWalletByCurrencyCode' test.out

#- 295 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'PauXTrpWAjwatSvt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PbAFn8oWQcmFkkRX' \
    --limit '64' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 295 'ListUserCurrencyTransactions' test.out

#- 296 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'YMVfiAMa6Pco7Mfv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ikslpyL9BYLVVznF' \
    --request '{"amount": 10, "debitBalanceSource": "DLC_REVOCATION", "metadata": {"JPCbs8jWmTteJhwN": {}, "bwHGG39YAZJ4HuLf": {}, "eTfFBTOFFMJ9pq51": {}}, "reason": "1jZcTK8zmMfyshYk", "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 296 'CheckBalance' test.out

#- 297 CheckWallet
eval_tap 0 297 'CheckWallet # SKIP deprecated' test.out

#- 298 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'b5cAFVo85r1b8Yp2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QnuhQuIdvZdj6Asp' \
    --body '{"amount": 100, "expireAt": "1989-08-14T00:00:00Z", "metadata": {"ElgJ8kx1WEeDbql1": {}, "3FtQMu41rnOzbsFB": {}, "qg6dziWvdNcwfUBM": {}}, "origin": "Epic", "reason": "hHeb0CaPFDjrSotK", "source": "GIFT"}' \
    > test.out 2>&1
eval_tap $? 298 'CreditUserWallet' test.out

#- 299 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'utntU8xHw4yYJOCV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iHwunQwpC2eCFUAH' \
    --request '{"amount": 65, "debitBalanceSource": "DLC_REVOCATION", "metadata": {"8BQjzobhDa8VxKOr": {}, "fVfBRIfkStOqdXqh": {}, "DMQ6tBLljC7gcT3M": {}}, "reason": "1DArk4L80aXFY7SQ", "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 299 'DebitByWalletPlatform' test.out

#- 300 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode '4CNtX2lnqi7cHTSd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GoLZbC3UJruU4uIX' \
    --body '{"amount": 56, "metadata": {"ZpqXJmPJso6M11LL": {}, "ZWKgWxn9YL16HQdt": {}, "AneXGgxNg33ZIUrI": {}}, "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 300 'PayWithUserWallet' test.out

#- 301 GetUserWallet
eval_tap 0 301 'GetUserWallet # SKIP deprecated' test.out

#- 302 DebitUserWallet
eval_tap 0 302 'DebitUserWallet # SKIP deprecated' test.out

#- 303 DisableUserWallet
eval_tap 0 303 'DisableUserWallet # SKIP deprecated' test.out

#- 304 EnableUserWallet
eval_tap 0 304 'EnableUserWallet # SKIP deprecated' test.out

#- 305 ListUserWalletTransactions
eval_tap 0 305 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 306 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AAeDCowR3MeCNL1o' \
    > test.out 2>&1
eval_tap $? 306 'ListViews' test.out

#- 307 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NrF3SmgudQusJLsP' \
    --body '{"displayOrder": 22, "localizations": {"pKEIs3GC9VTK7tkJ": {"description": "WFpHt7MdKu9Xwn5G", "localExt": {"HJDGatrYOMO91CYE": {}, "jX867n9PT9fR7mMu": {}, "BXPDKCriRKzTZ7TX": {}}, "longDescription": "AVRnUVbxEJcKHE76", "title": "4EwhQfxFKIOGT1WK"}, "SmLoA0ILaESC1GJX": {"description": "soBwqh0TQXa2j7v3", "localExt": {"zQJoQLTAlW75icIK": {}, "UpXazsFrmaGNoi3R": {}, "PTgWotLNz0u8ySxA": {}}, "longDescription": "0yrjz4q7e0EJnADX", "title": "C2y0DY1E1SMK9oA4"}, "vK56dsYI5SKV5pDA": {"description": "NyJ184miBhdVJt81", "localExt": {"fmLSyGuu5rbJVIwR": {}, "MtwApGbXnR3yC6f2": {}, "MHGGedk0KzXRclOX": {}}, "longDescription": "dPYZQxBnttu4yW5e", "title": "tl4Xk8Hd1lRtoPMv"}}, "name": "su9oswEPTvzwwGnp"}' \
    > test.out 2>&1
eval_tap $? 307 'CreateView' test.out

#- 308 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'bx8MCIjKzylqW8au' \
    --storeId 'yseP9wEEyYAnHPp4' \
    > test.out 2>&1
eval_tap $? 308 'GetView' test.out

#- 309 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'XzVL5McglFCrjxqq' \
    --storeId 'xAYqXG2V3baMkZ9J' \
    --body '{"displayOrder": 58, "localizations": {"kPU9hrl5nkpEdBe8": {"description": "bYWdok4UnUEOyP0c", "localExt": {"PZf5OvolfI0mqZct": {}, "ohLheRaQkfMLFW9B": {}, "7jHZro4hhwnANAGp": {}}, "longDescription": "8zGqNGrcQyoA1TWP", "title": "cy83iXfYXNdMkdg9"}, "TMwxNcQ6CkVi8fqV": {"description": "PRqNbF5yLnYSa8xF", "localExt": {"LvcYexMMMiDFh5Rb": {}, "W021cHN3QbzVuJZH": {}, "3k54cExxWKtdGTW4": {}}, "longDescription": "FILotv5ycTa0i6if", "title": "YP1zfgjsy3VRjX4q"}, "A4g9OGoWw1qnCAvd": {"description": "nAcokJ0rzqX2KJcY", "localExt": {"HgiFDxclBXap6j73": {}, "doCWxhubMXbxNvT6": {}, "wAffv4uzKAwiI4wT": {}}, "longDescription": "xNIefCmtrxWu2935", "title": "51nQBNKcqCkUXRj8"}}, "name": "gQHEe4CO370OsbzR"}' \
    > test.out 2>&1
eval_tap $? 309 'UpdateView' test.out

#- 310 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'KKPd6mjzLxllUrFY' \
    --storeId 'n7cSuO7NxKHUHg0c' \
    > test.out 2>&1
eval_tap $? 310 'DeleteView' test.out

#- 311 QueryWallets
eval_tap 0 311 'QueryWallets # SKIP deprecated' test.out

#- 312 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 7, "expireAt": "1996-06-20T00:00:00Z", "metadata": {"fHdITmN9opaF0kh3": {}, "pCRB3infEVxArF7T": {}, "B6A6a71zAJpaPeud": {}}, "origin": "Other", "reason": "0v25yAObZIbrA8XA", "source": "REDEEM_CODE"}, "currencyCode": "YZw4MWzWFTuNPf5J", "userIds": ["DL4yx5I0euBsccHP", "CSDyYy4e5qoTZxSo", "ZbQUnUxS6m68WL3H"]}, {"creditRequest": {"amount": 54, "expireAt": "1999-02-03T00:00:00Z", "metadata": {"v9XP9enfEX7lloLg": {}, "IYqxFfSNJlHCjxLN": {}, "nYUlGQsFpy9ZVlLI": {}}, "origin": "System", "reason": "ruDukun42zPZvOd4", "source": "OTHER"}, "currencyCode": "9ilm3cauhrw9Yn2z", "userIds": ["5bcfPW4pPZB9YXlt", "3wfNGyWf3VujS7Bq", "5cnbm7z2Aa24yBTw"]}, {"creditRequest": {"amount": 60, "expireAt": "1975-07-17T00:00:00Z", "metadata": {"yBGygWFTAY3Th5mO": {}, "wPCPKVPlOGfFBlu2": {}, "ZP0IkiYXGk6BoBmS": {}}, "origin": "Twitch", "reason": "kulpM4SRtUE5P4kx", "source": "GIFT"}, "currencyCode": "lMlY8UjprhCxhzW6", "userIds": ["VdjPutJ8dkAVOJ5i", "mghdfVhjnjd66A1S", "ZM7LkTVrtVJZVhxC"]}]' \
    > test.out 2>&1
eval_tap $? 312 'BulkCredit' test.out

#- 313 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "QmWGSQLAVPAJ7zX5", "request": {"allowOverdraft": false, "amount": 91, "balanceOrigin": "Steam", "balanceSource": "PAYMENT", "metadata": {"80k2smdkBS2MaIP7": {}, "PjngEFggq91cpgvo": {}, "DBgYfLBdGNAZEvbv": {}}, "reason": "xqa0K7VUbjUnzirn"}, "userIds": ["EsxSE4vBzG7VK8sW", "Q1qdRcJjsme1OukI", "EshmZf5fEdvjbyJP"]}, {"currencyCode": "fIZVH8q8svV5hMOS", "request": {"allowOverdraft": false, "amount": 33, "balanceOrigin": "GooglePlay", "balanceSource": "ORDER_REVOCATION", "metadata": {"uTA6AvmW0567BFqb": {}, "rPIuxKmBXLi6Gpnq": {}, "AeMvg3w0FQ1520WM": {}}, "reason": "3TxWXSdTiKdva2UR"}, "userIds": ["EoBSFtCLy2CqgCG7", "JwJCDqkzOdFwLJpI", "PxzLE1V9U1NgpH7O"]}, {"currencyCode": "c44yjRdfqZgv34Gq", "request": {"allowOverdraft": true, "amount": 56, "balanceOrigin": "IOS", "balanceSource": "PAYMENT", "metadata": {"elcN0GJmPwUTWMx0": {}, "MiPAjnWIhFrqSn4e": {}, "rXEtU1CaD8AqsMCG": {}}, "reason": "BNhmUt6fzYRn85br"}, "userIds": ["Tu8F7cuCPh1TGZJm", "gWNHWnvOBRCt4onq", "Ro2PnMSRarKg4coy"]}]' \
    > test.out 2>&1
eval_tap $? 313 'BulkDebit' test.out

#- 314 GetWallet
eval_tap 0 314 'GetWallet # SKIP deprecated' test.out

#- 315 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey '3AFpULIn21Nf2FNg' \
    --end 'DWNC6yh7kgTHlrxK' \
    --start 'bsV4XtrI7SFBEgkw' \
    > test.out 2>&1
eval_tap $? 315 'SyncOrders' test.out

#- 316 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["HifMHYI581HbF7fM", "X9lDXYxGRJM92eX4", "2WW2WKf5urEOpASB"], "apiKey": "icX3ZwzZ7aVhrkmh", "authoriseAsCapture": true, "blockedPaymentMethods": ["y9jx7gBHTOHHArjl", "d0LnREsrrB2pJ7V8", "BSrucjO3zvSM5KeV"], "clientKey": "NHU9GcOivIfcCJt4", "dropInSettings": "U8VSgXoi9Fw25b9q", "liveEndpointUrlPrefix": "XzlIK2G6AUjBCdf0", "merchantAccount": "Rp5e5IvFuN1oUsCn", "notificationHmacKey": "BmGMx5F6EhM3dKvI", "notificationPassword": "G9MR0hTINvq1VR9S", "notificationUsername": "JUfQEX996Mh1sQ3D", "returnUrl": "w3uyjgQNAs9188Qm", "settings": "3W1De2McGd10wefF"}' \
    > test.out 2>&1
eval_tap $? 316 'TestAdyenConfig' test.out

#- 317 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "0CJlH55RLEgeAsSp", "privateKey": "QdcmGHZuRVQ8tzwq", "publicKey": "MayP8A3HGNI3Bfjk", "returnUrl": "Fd6MHo6gGQ5mChYo"}' \
    > test.out 2>&1
eval_tap $? 317 'TestAliPayConfig' test.out

#- 318 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "KD7yqCR03RovQZhw", "secretKey": "fjkq9iyTbyD3D01t"}' \
    > test.out 2>&1
eval_tap $? 318 'TestCheckoutConfig' test.out

#- 319 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'RpuuyIagSSzEL8H4' \
    > test.out 2>&1
eval_tap $? 319 'DebugMatchedPaymentMerchantConfig' test.out

#- 320 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "euLufhQj2KP3LLxl", "clientSecret": "9Hs2L2wlpKBVURxH", "returnUrl": "efz77a9fntCNiHBR", "webHookId": "UNCPSre5GmZzCQwi"}' \
    > test.out 2>&1
eval_tap $? 320 'TestPayPalConfig' test.out

#- 321 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["lS3IxSjlyvR9PxG9", "Lji2Vc88W8aLjIxV", "GpdOqguxvRwI9ZBT"], "publishableKey": "ipMRlhK9DMMaI4ry", "secretKey": "VDvNaruZxwTfh9gE", "webhookSecret": "s6GF247cbBLjUr5z"}' \
    > test.out 2>&1
eval_tap $? 321 'TestStripeConfig' test.out

#- 322 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "03wxB3E9hrE9f9CO", "key": "FrOr6wJDBwIDsJHN", "mchid": "g6TvNGjwI4TbTwBu", "returnUrl": "fUorJouduhCEJ5Xi"}' \
    > test.out 2>&1
eval_tap $? 322 'TestWxPayConfig' test.out

#- 323 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "KDIE9YugcupLxVBc", "flowCompletionUrl": "RkfhRuqkOTHSia7o", "merchantId": 65, "projectId": 80, "projectSecretKey": "d1fEmDuyAsQGzwJR"}' \
    > test.out 2>&1
eval_tap $? 323 'TestXsollaConfig' test.out

#- 324 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id '5poI718RQnj4imu6' \
    > test.out 2>&1
eval_tap $? 324 'GetPaymentMerchantConfig' test.out

#- 325 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'XFfRcWDXhq1YmGey' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["gr2S4Yw8NmPaBery", "zX2hOPVVFqVqxjq1", "iG3TySOh8SI75oXb"], "apiKey": "yq8FBbur80QwnlgA", "authoriseAsCapture": true, "blockedPaymentMethods": ["fqz6gQJh8sn0bVWR", "kvmAemh8lioBR7xT", "XcEIFod3lCzvjHzD"], "clientKey": "HOrSJ1vbB7LRHd96", "dropInSettings": "dGLgkfrZveFMWAFT", "liveEndpointUrlPrefix": "7l0l1jaOAMCzbsoI", "merchantAccount": "gmKwwMDQPjUIosq1", "notificationHmacKey": "l6xo0D4JRbNqO6Iu", "notificationPassword": "P2PY5hhX6uNah9Jo", "notificationUsername": "HPj7jFWxSv1lYylY", "returnUrl": "AiZ8c7Zd7EUoezOL", "settings": "w8C1c5bBB3XZ7Col"}' \
    > test.out 2>&1
eval_tap $? 325 'UpdateAdyenConfig' test.out

#- 326 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'KwlsNvtFuunQsvdX' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 326 'TestAdyenConfigById' test.out

#- 327 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'GlD40xxIyVwYjn6d' \
    --sandbox  \
    --validate  \
    --body '{"appId": "lC9Kfh9gHuloyce0", "privateKey": "cLJu4ljPWlCWTuGO", "publicKey": "8MnfOQu3wdT4Aodp", "returnUrl": "95o1RkX7iW7VpCng"}' \
    > test.out 2>&1
eval_tap $? 327 'UpdateAliPayConfig' test.out

#- 328 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'WAv5DAG8dPdkKgQq' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 328 'TestAliPayConfigById' test.out

#- 329 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'jyzUZR2rFIAuALNh' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "NCyscsMBRLsWadk2", "secretKey": "OQ421q7Nb1vrKthV"}' \
    > test.out 2>&1
eval_tap $? 329 'UpdateCheckoutConfig' test.out

#- 330 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'vU5on065ApCkVN3Q' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 330 'TestCheckoutConfigById' test.out

#- 331 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'chuQ6pntxB648ss7' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "rBnvQHAM8gSdIybK", "clientSecret": "UByHBzfvgtRTPPzw", "returnUrl": "JmKaLCx3gcidEALW", "webHookId": "e6RG5wWznu5AjwR1"}' \
    > test.out 2>&1
eval_tap $? 331 'UpdatePayPalConfig' test.out

#- 332 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'Z4fU7ICcaQtuuKUw' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 332 'TestPayPalConfigById' test.out

#- 333 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id '3dUwWHhQW3I1y9tj' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["RLVOXBMa0JiIe1AY", "0tUA7EKASk3USNLh", "OBlxRBLgohp8ByTi"], "publishableKey": "2F6AyUX8w77riPlP", "secretKey": "gJcLbeQf9MICxX7x", "webhookSecret": "KyCfgwSPz14asyOd"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdateStripeConfig' test.out

#- 334 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'gn77gN8K1FlNkgbF' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 334 'TestStripeConfigById' test.out

#- 335 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'E8U4meK5grmPBsFH' \
    --validate  \
    --body '{"appId": "71VrhsISYtegQbNA", "key": "2WQrHTkJT1VkChD3", "mchid": "n0c1ryAkRvdPR8gx", "returnUrl": "2rX5dck8NFKPgT6L"}' \
    > test.out 2>&1
eval_tap $? 335 'UpdateWxPayConfig' test.out

#- 336 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'Mehg047axU5ktNyw' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 336 'UpdateWxPayConfigCert' test.out

#- 337 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'RIvO2Sgz30hejqdk' \
    > test.out 2>&1
eval_tap $? 337 'TestWxPayConfigById' test.out

#- 338 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'tHIO1VdtMSews1Tr' \
    --validate  \
    --body '{"apiKey": "U4FhAfKDcDG5bMTb", "flowCompletionUrl": "a1tUlFGcP6eL7EpW", "merchantId": 39, "projectId": 86, "projectSecretKey": "vXCT6m6mRZAlLBcz"}' \
    > test.out 2>&1
eval_tap $? 338 'UpdateXsollaConfig' test.out

#- 339 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'JVeil7GbG1ISBCkc' \
    > test.out 2>&1
eval_tap $? 339 'TestXsollaConfigById' test.out

#- 340 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'npxKUxLjmxhBS6Yy' \
    --body '{"device": "MOBILE", "showCloseButton": false, "size": "MEDIUM", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 340 'UpdateXsollaUIConfig' test.out

#- 341 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '85' \
    --namespace "$AB_NAMESPACE" \
    --offset '27' \
    --region '8GslMpx3m7lEXTmn' \
    > test.out 2>&1
eval_tap $? 341 'QueryPaymentProviderConfig' test.out

#- 342 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "btjK9RsyoqT3adB4", "region": "8Jxp2zaItg9jTNZv", "sandboxTaxJarApiToken": "pFEUI21aSaIsMyLK", "specials": ["ADYEN", "CHECKOUT", "WALLET"], "taxJarApiToken": "3I3pvHKDaWhTN1qy", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 342 'CreatePaymentProviderConfig' test.out

#- 343 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 343 'GetAggregatePaymentProviders' test.out

#- 344 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'pUzWIZWJTDzWguhu' \
    > test.out 2>&1
eval_tap $? 344 'DebugMatchedPaymentProviderConfig' test.out

#- 345 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 345 'GetSpecialPaymentProviders' test.out

#- 346 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'jw1EoR58uCVldefo' \
    --body '{"aggregate": "ADYEN", "namespace": "337LLNCjIySe36SA", "region": "5dxATLv5PkLvraRz", "sandboxTaxJarApiToken": "ChdjDGdlk2A2jHbA", "specials": ["WXPAY", "ADYEN", "PAYPAL"], "taxJarApiToken": "4pWwIVXp9avUr6Iy", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 346 'UpdatePaymentProviderConfig' test.out

#- 347 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'gQWyZocvYfr0Rnl0' \
    > test.out 2>&1
eval_tap $? 347 'DeletePaymentProviderConfig' test.out

#- 348 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 348 'GetPaymentTaxConfig' test.out

#- 349 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "2R1IVNnaK6KS71Xs", "taxJarApiToken": "1BphA9BXpKYgF9Ou", "taxJarEnabled": false, "taxJarProductCodesMapping": {"oYoQn9iHEqWO1cVC": "UIOx90FQdwLi3GOQ", "kLtpuRNeT1CULEMP": "aOU5nukycAUlkUSZ", "KUrsxNRzF3NaUuCy": "Qyze6zPKu5sE89JW"}}' \
    > test.out 2>&1
eval_tap $? 349 'UpdatePaymentTaxConfig' test.out

#- 350 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey '8UU0RsB6dvrpmInh' \
    --end 'HYzVVlHGFSwjby6r' \
    --start 'MYkVQnZDUAbINRKQ' \
    > test.out 2>&1
eval_tap $? 350 'SyncPaymentOrders' test.out

#- 351 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'sxUO1YMxAndOj5O6' \
    --storeId 'IBwXJjgQjgLoJyqw' \
    > test.out 2>&1
eval_tap $? 351 'PublicGetRootCategories' test.out

#- 352 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'FVBd1ZjaRXEdWgS1' \
    --storeId '2bSbPgOCWUogizeW' \
    > test.out 2>&1
eval_tap $? 352 'DownloadCategories' test.out

#- 353 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'OPUMrqgEIsMwNbft' \
    --namespace "$AB_NAMESPACE" \
    --language 'i0LoTBcNzyoCSw1t' \
    --storeId '653G3ydYmGzvx9bS' \
    > test.out 2>&1
eval_tap $? 353 'PublicGetCategory' test.out

#- 354 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'qqyAPha5b6PQTPTy' \
    --namespace "$AB_NAMESPACE" \
    --language 'tHeeXo7gOFVLZCBW' \
    --storeId 'uVIROZuqdJBi8pkn' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetChildCategories' test.out

#- 355 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath '98VtLNkaIQJfkFDh' \
    --namespace "$AB_NAMESPACE" \
    --language 'SeSGXtZU5SuIhMSa' \
    --storeId 'DRp17dUWHcjrb6qN' \
    > test.out 2>&1
eval_tap $? 355 'PublicGetDescendantCategories' test.out

#- 356 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 356 'PublicListCurrencies' test.out

#- 357 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'OCULUS' \
    > test.out 2>&1
eval_tap $? 357 'GeDLCDurableRewardShortMap' test.out

#- 358 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 358 'GetIAPItemMapping' test.out

#- 359 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'RlzAJy9oFOHB2KEs' \
    --region 'IdtozVltBhoXE4wg' \
    --storeId 'cYT5CdjaJuUzFIeq' \
    --appId 'aVr1CE1gu6cYuzC7' \
    > test.out 2>&1
eval_tap $? 359 'PublicGetItemByAppId' test.out

#- 360 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'J4irvZ9tktWLtDdl' \
    --categoryPath 'mVGK6iolEw6IIpDc' \
    --features '9X5ijmtDGvd9ESdY' \
    --includeSubCategoryItem  \
    --itemType 'SUBSCRIPTION' \
    --language 'eTkBWA44Qqsi5yOj' \
    --limit '43' \
    --offset '73' \
    --region 'l5sRN2ENn1RLi5iM' \
    --sortBy 'name,displayOrder:asc,createdAt' \
    --storeId 'bg7o1zYpqUsliPyX' \
    --tags 'ZGYIW5ZDtWbdkzPP' \
    > test.out 2>&1
eval_tap $? 360 'PublicQueryItems' test.out

#- 361 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '47RcUIi2CoNj4EG2' \
    --region 'emxKQk8cBrt5E8k8' \
    --storeId 'rzDZ08j6ICP75cm8' \
    --sku 'YDChFi3zLvfQWC85' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetItemBySku' test.out

#- 362 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'MxWxvW0veFl3uU1a' \
    --storeId 'MD0mczWxc8f1s2QP' \
    --itemIds 'MMZsf2dvKZyHChRP' \
    > test.out 2>&1
eval_tap $? 362 'PublicGetEstimatedPrice' test.out

#- 363 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'HvdkcKW21B5EFtD2' \
    --region 'pYaKTz1gcE2XCwTk' \
    --storeId 'RUIX6IFHNmB9mYBv' \
    --itemIds 'tOwxjqyrjDApeN5e' \
    > test.out 2>&1
eval_tap $? 363 'PublicBulkGetItems' test.out

#- 364 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["AfRqSgH5xIuBTYOd", "svNyk52MQFkVVEf3", "6S7yPgG48bk6PwH1"]}' \
    > test.out 2>&1
eval_tap $? 364 'PublicValidateItemPurchaseCondition' test.out

#- 365 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'INGAMEITEM' \
    --limit '27' \
    --offset '7' \
    --region '0I6T0hvcAFTaSWR4' \
    --storeId 'VOGIY7hM6uhonkAe' \
    --keyword '0FdTSSEluBxM47BT' \
    --language 'ww3nBTVmBFZ6TIs9' \
    > test.out 2>&1
eval_tap $? 365 'PublicSearchItems' test.out

#- 366 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'bTi2m7eNsYEqKkeu' \
    --namespace "$AB_NAMESPACE" \
    --language 'LWDfeFeExlOFjRh8' \
    --region 'mLFTJLveQSDWnMQG' \
    --storeId 'aYRxFWia7yJ2d87X' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetApp' test.out

#- 367 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'jA0ajvb7JcGUFgp6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 367 'PublicGetItemDynamicData' test.out

#- 368 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'LkyXpxJeFxhgTwyO' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '51CUpcdxL0a9VDhr' \
    --populateBundle  \
    --region 'qWCTXOxQUpyFgZhN' \
    --storeId 'pOTE4toH57yr01N3' \
    > test.out 2>&1
eval_tap $? 368 'PublicGetItem' test.out

#- 369 GetPaymentCustomization
eval_tap 0 369 'GetPaymentCustomization # SKIP deprecated' test.out

#- 370 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "3p1Gha8HwpagvERZ", "paymentProvider": "XSOLLA", "returnUrl": "p7VMlxEXnqHwMyKp", "ui": "wphjUXvM1GqMkZ44", "zipCode": "UXgdBqtJaRyDlP9q"}' \
    > test.out 2>&1
eval_tap $? 370 'PublicGetPaymentUrl' test.out

#- 371 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'IZJ5Krx6KkHagEug' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetPaymentMethods' test.out

#- 372 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'KJxkU8Y58COtTNjn' \
    > test.out 2>&1
eval_tap $? 372 'PublicGetUnpaidPaymentOrder' test.out

#- 373 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'NSikJDg6ujKvq0CI' \
    --paymentProvider 'ADYEN' \
    --zipCode 'Vx5l3yrH9HR4reG0' \
    --body '{"token": "HwUXxQTf5YpDUGYs"}' \
    > test.out 2>&1
eval_tap $? 373 'Pay' test.out

#- 374 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'JBEkYUrLv4qUiTkF' \
    > test.out 2>&1
eval_tap $? 374 'PublicCheckPaymentOrderPaidStatus' test.out

#- 375 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ADYEN' \
    --region 'iX44azSHcwicUVq2' \
    > test.out 2>&1
eval_tap $? 375 'GetPaymentPublicConfig' test.out

#- 376 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'XPljTZj5R0yZSVQ8' \
    > test.out 2>&1
eval_tap $? 376 'PublicGetQRCode' test.out

#- 377 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'SSeJ4qy4PIKleuV2' \
    --foreinginvoice '71bwZ4niLSzQnv0C' \
    --invoiceId '00dtNGGzbGYSYo9f' \
    --payload 'Y2EBZAHQXc4Xcae7' \
    --redirectResult 'VKl0ARzGEArlfE1N' \
    --resultCode 'SmtcADoZvd0La7P4' \
    --sessionId 'JI4H7uDzkOHTdnUt' \
    --status 'drRcs3GeOsKPNlG7' \
    --token 'rEXi6LEqJERpbxEq' \
    --type '07txnvZZeAf7QBuZ' \
    --userId 'K5GJlBncg8tQnJOK' \
    --orderNo 'HC16xjJZ4kiU3N85' \
    --paymentOrderNo '56ll2LQWpdESOBV7' \
    --paymentProvider 'WALLET' \
    --returnUrl 'fVopbpPhsana0uXG' \
    > test.out 2>&1
eval_tap $? 377 'PublicNormalizePaymentReturnUrl' test.out

#- 378 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '7GUTV1BwgkLDj4pj' \
    --paymentOrderNo 'VktyoNSsEHlzyd0S' \
    --paymentProvider 'ADYEN' \
    > test.out 2>&1
eval_tap $? 378 'GetPaymentTaxValue' test.out

#- 379 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'U2xBSEQ8rBKc2K6o' \
    > test.out 2>&1
eval_tap $? 379 'GetRewardByCode' test.out

#- 380 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'JXxVEfnaqX8NuZtR' \
    --limit '96' \
    --offset '87' \
    --sortBy 'rewardCode:asc,rewardCode:desc,rewardCode' \
    > test.out 2>&1
eval_tap $? 380 'QueryRewards1' test.out

#- 381 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'qFGwnDG8kz4kvEv6' \
    > test.out 2>&1
eval_tap $? 381 'GetReward1' test.out

#- 382 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 382 'PublicListStores' test.out

#- 383 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'tNjGRhrmRAxRGeIK,GlCJmDXpjyvLSHB1,y3klHuAGnidOyGuS' \
    --itemIds '0OG7ohiL2943ClrN,hEdxd24ZKfvMf1T5,FzYMf1jaCgZosntP' \
    --skus 'zP1vXXB92q150WEI,etOXMt37MXy7Fp7l,UfQqXrqGadwvKlJF' \
    > test.out 2>&1
eval_tap $? 383 'PublicExistsAnyMyActiveEntitlement' test.out

#- 384 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'X1ZHV9yo9Ur1hfhm' \
    > test.out 2>&1
eval_tap $? 384 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 385 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --itemId 'NgJTxjtzgO7W3taR' \
    > test.out 2>&1
eval_tap $? 385 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 386 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'rcgTcA71dtqtSUN4' \
    > test.out 2>&1
eval_tap $? 386 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 387 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'zvBzGh3mhIDNuMBZ,egHtB9uTCiiIoMZC,jGiOZJpUf9RpcfEQ' \
    --itemIds 'n0O6D8PGQuazAypg,WhTED5YmPTBUkm2F,yvdguCYVqFyIKh1Y' \
    --skus 'tTY4AejyQc5Dac7h,SLldWx5DyniVESUg,rROrP1ip3jNG68DB' \
    > test.out 2>&1
eval_tap $? 387 'PublicGetEntitlementOwnershipToken' test.out

#- 388 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "yf2UMPtigq9zOQOc", "language": "Qcp_yI", "region": "24I2n25smsrmJFHG"}' \
    > test.out 2>&1
eval_tap $? 388 'SyncTwitchDropsEntitlement' test.out

#- 389 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'iYnyhbqxLuTZIxgi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 389 'PublicGetMyWallet' test.out

#- 390 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'Uaiyy0aWrshpmb1C' \
    --body '{"epicGamesJwtToken": "9Al7eWrbNRE0xyYP"}' \
    > test.out 2>&1
eval_tap $? 390 'SyncEpicGameDLC' test.out

#- 391 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'UZHyLGQ52IjGpRJC' \
    > test.out 2>&1
eval_tap $? 391 'SyncOculusDLC' test.out

#- 392 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'UJpscOTkWETSJ04c' \
    --body '{"serviceLabel": 82}' \
    > test.out 2>&1
eval_tap $? 392 'PublicSyncPsnDlcInventory' test.out

#- 393 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'MGInO4yznh2YpZvv' \
    --body '{"serviceLabels": [24, 50, 52]}' \
    > test.out 2>&1
eval_tap $? 393 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 394 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'wmr4CYNGm7Tk1mMy' \
    --body '{"appId": "eNRsjQuDEgO3MEQN", "steamId": "L6ijLRvQOgoaBooT"}' \
    > test.out 2>&1
eval_tap $? 394 'SyncSteamDLC' test.out

#- 395 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'awHLMxhx9nC3o6pX' \
    --body '{"xstsToken": "U5MDJLCB6WbXWIRp"}' \
    > test.out 2>&1
eval_tap $? 395 'SyncXboxDLC' test.out

#- 396 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'gjooaBVemsbkaXZQ' \
    --appType 'DLC' \
    --entitlementClazz 'APP' \
    --entitlementName 'Tj9rZpkSntuOeaPA' \
    --features 'yPeEGBepK1Ix4Swj,CYjCHniVSn1gYGal,5NrBtT0om9OlGzpF' \
    --itemId '25qu98RhktX6qwkX,bCLbh8t0zPkQWRUl,gE0kxzFMq9ttbEHA' \
    --limit '63' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 396 'PublicQueryUserEntitlements' test.out

#- 397 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'V7C65Ans9SquNSJI' \
    --appId 'ay5VdUdYy9Y9OCSm' \
    > test.out 2>&1
eval_tap $? 397 'PublicGetUserAppEntitlementByAppId' test.out

#- 398 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'mT3WKijbqhT3uyQR' \
    --limit '33' \
    --offset '43' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 398 'PublicQueryUserEntitlementsByAppType' test.out

#- 399 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'vcUYDeWPZ8yhwQ0g' \
    --availablePlatformOnly  \
    --ids 'Idj1lTJdNLmAvEdE,BVAU3rbkv8V98cup,W0L5WsiuITRMSPOU' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetUserEntitlementsByIds' test.out

#- 400 PublicGetUserEntitlementByItemId
eval_tap 0 400 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 401 PublicGetUserEntitlementBySku
eval_tap 0 401 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 402 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'fWQwr4PYf48r66Ma' \
    --endDate 'ToxBiliy2vtRkpqL' \
    --entitlementClazz 'MEDIA' \
    --limit '76' \
    --offset '36' \
    --startDate 'ZExOoIpWzacOvwUs' \
    > test.out 2>&1
eval_tap $? 402 'PublicUserEntitlementHistory' test.out

#- 403 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'nIbQM3ZAtyEWKWoZ' \
    --appIds 'RUL7wS3HaMTXAX6y,0STTN2sBEijjjpvS,zGkED0oweFYDBPyd' \
    --itemIds '1jJBxbrbuFay9PXg,EQS4871QSmsspn5s,NfifK65tvaH9jwcO' \
    --skus '48pthyYpBJDHIIxT,IGI5EssYllIqjJzu,Q8GglVgxjOGQGlHm' \
    > test.out 2>&1
eval_tap $? 403 'PublicExistsAnyUserActiveEntitlement' test.out

#- 404 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '8VTN56tJKwD8O07L' \
    --appId '9GG1uenDihceaLdg' \
    > test.out 2>&1
eval_tap $? 404 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 405 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'PZI0fKW8LeQxItaK' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 's3Hha69MgxjGJx62' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 406 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'mkfVlu4bGB1pyk0P' \
    --ids 'pxXZDy5Pmbu7RrD9,a5mdlXTCL467xHbA,iD3Pr3mXZO1PnbSl' \
    > test.out 2>&1
eval_tap $? 406 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 407 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'fVRlAI8F2f3mEv09' \
    --entitlementClazz 'CODE' \
    --sku 'S5DHLB65fxQ06GwT' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 408 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'mobiBnfrnq9kOFBW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hUTPiKR3qcbHLGpl' \
    > test.out 2>&1
eval_tap $? 408 'PublicGetUserEntitlement' test.out

#- 409 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'YsS3jsRZffCd00Vr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gPuNtOv3jbhGBuW8' \
    --body '{"options": ["KcyPMfDWSEEpKoJl", "mhMQUCx70QjYbzem", "OTURzzAOIBarB7kc"], "requestId": "er5SvPLeQZIpKFXg", "useCount": 26}' \
    > test.out 2>&1
eval_tap $? 409 'PublicConsumeUserEntitlement' test.out

#- 410 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'Dz00gxcoaH6u9TVf' \
    --namespace "$AB_NAMESPACE" \
    --userId '4DvEzpoPRiClZ6rl' \
    --body '{"requestId": "wX99AHMLHqguYykV", "useCount": 100}' \
    > test.out 2>&1
eval_tap $? 410 'PublicSellUserEntitlement' test.out

#- 411 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'FvPKqupHj72TlLs9' \
    --namespace "$AB_NAMESPACE" \
    --userId '64iABOgTKtnaA7O3' \
    --body '{"useCount": 91}' \
    > test.out 2>&1
eval_tap $? 411 'PublicSplitUserEntitlement' test.out

#- 412 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'Iaytd9CsAMTZC37x' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PXxnfggnZ3EZp6wS' \
    --body '{"entitlementId": "AufwYirs9lwvPKd9", "useCount": 0}' \
    > test.out 2>&1
eval_tap $? 412 'PublicTransferUserEntitlement' test.out

#- 413 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '5u3fFLV0YeMrVaYS' \
    --body '{"code": "TRYGFzgLZ7gEypQf", "language": "qK", "region": "9A4gcbDJ0LmdnOPk"}' \
    > test.out 2>&1
eval_tap $? 413 'PublicRedeemCode' test.out

#- 414 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'IT1C6KGTpA7JZ6xu' \
    --body '{"excludeOldTransactions": false, "language": "LQqL_Ayef-pN", "productId": "kXA3WqypoOw0H2s0", "receiptData": "sibQNBz81zRPntxp", "region": "gi7tXIcNEcGJjOCX", "transactionId": "puix5vnPeTu9evbR"}' \
    > test.out 2>&1
eval_tap $? 414 'PublicFulfillAppleIAPItem' test.out

#- 415 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ov7Bm40CtZiAxk43' \
    --body '{"epicGamesJwtToken": "DGV1SCkw8U0d4FvV"}' \
    > test.out 2>&1
eval_tap $? 415 'SyncEpicGamesInventory' test.out

#- 416 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'mPMtpRMWSQ8Szi1I' \
    --body '{"autoAck": true, "language": "hPIs_ch", "orderId": "qlART9mPPmYUvlkB", "packageName": "GPJFaFzkABC8zWMc", "productId": "YW5iRrw32FRg8y4r", "purchaseTime": 83, "purchaseToken": "1hbvGenRbm3QtsY5", "region": "WaKM5YY6pYrmeMIH"}' \
    > test.out 2>&1
eval_tap $? 416 'PublicFulfillGoogleIAPItem' test.out

#- 417 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'LS8egV8XhgDjbrum' \
    > test.out 2>&1
eval_tap $? 417 'SyncOculusConsumableEntitlements' test.out

#- 418 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '8UxcutmVg8APWKxo' \
    --body '{"currencyCode": "j6MF68VuKDoklYmk", "price": 0.39602831000292316, "productId": "tCAH8Jiqe7gfV1G6", "serviceLabel": 2}' \
    > test.out 2>&1
eval_tap $? 418 'PublicReconcilePlayStationStore' test.out

#- 419 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'v9kjuiAGiXx47etM' \
    --body '{"currencyCode": "ikLFggYDc2FMbzZo", "price": 0.07785388830258477, "productId": "KagnKf2Yifzvr9Oq", "serviceLabels": [37, 93, 86]}' \
    > test.out 2>&1
eval_tap $? 419 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 420 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'InGzHFpFXYJtHtqw' \
    --body '{"appId": "oIwQBeIALI8JNIII", "currencyCode": "4jrzrPsuMziNM8AB", "language": "tYDJ", "price": 0.8605360768693457, "productId": "MOpmm04BlZUAlYnC", "region": "T11qD03er5mdraK4", "steamId": "7FdxXisVlo3aVOGA"}' \
    > test.out 2>&1
eval_tap $? 420 'SyncSteamInventory' test.out

#- 421 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RFDJcGWy826ilCxA' \
    --body '{"gameId": "xQUM5DyrPfBmpZIz", "language": "ygcw-xpsw", "region": "GfH66eFCMTsLA8vY"}' \
    > test.out 2>&1
eval_tap $? 421 'SyncTwitchDropsEntitlement1' test.out

#- 422 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'VvrIAEehUV0jsjAy' \
    --body '{"currencyCode": "VgxS54NNs3XdhMbQ", "price": 0.8040090788237234, "productId": "9D1znEWw9p7g4UsQ", "xstsToken": "CTKDh5n9yc34xF8q"}' \
    > test.out 2>&1
eval_tap $? 422 'SyncXboxInventory' test.out

#- 423 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'FllM1LTrl4MP3Nl4' \
    --itemId 'T3ujvV7W6ADLtn7o' \
    --limit '71' \
    --offset '66' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 423 'PublicQueryUserOrders' test.out

#- 424 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'xhffy9cHrLYfftad' \
    --body '{"currencyCode": "99JDcnn7f2d8SOWP", "discountedPrice": 45, "ext": {"dw6Uy88WpQalG38V": {}, "Oo82aLD9jUjuDITj": {}, "ifWRbmtK7MTxcCWn": {}}, "itemId": "MiCLsjroKHPApA8G", "language": "whZ_iOCW", "price": 52, "quantity": 94, "region": "NePjLJQJXwUApJWo", "returnUrl": "hXn01RB7pu7BaONX", "sectionId": "yE5fIDbsMi48xOYV"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicCreateUserOrder' test.out

#- 425 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'vEcEm53BYMBacQBI' \
    --userId 'uDVs7U0AJtWPRtes' \
    > test.out 2>&1
eval_tap $? 425 'PublicGetUserOrder' test.out

#- 426 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'zMTd0R5Fsrf9xbVf' \
    --userId 'gvG617GmxzClkR3M' \
    > test.out 2>&1
eval_tap $? 426 'PublicCancelUserOrder' test.out

#- 427 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '6Twpwq3nLwxnJKjO' \
    --userId 'o9fvfXF1VsikD3Ip' \
    > test.out 2>&1
eval_tap $? 427 'PublicGetUserOrderHistories' test.out

#- 428 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hQQiRcOtsthUwgQz' \
    --userId 'NHUZ0l1FRfOjJUmC' \
    > test.out 2>&1
eval_tap $? 428 'PublicDownloadUserOrderReceipt' test.out

#- 429 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'bi2llksf6GA8vTt9' \
    > test.out 2>&1
eval_tap $? 429 'PublicGetPaymentAccounts' test.out

#- 430 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id '2kldCoyRdiOikUdq' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'gdjQCYoE8b0CZetL' \
    > test.out 2>&1
eval_tap $? 430 'PublicDeletePaymentAccount' test.out

#- 431 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'fpFNyp7375rhOmR4' \
    --autoCalcEstimatedPrice  \
    --language 'zFjoJZVKZjOD2ePK' \
    --region 'AKYjJMVnYj2yKqav' \
    --storeId 'WpydepM3ap069B9O' \
    --viewId 'kr0xJ5XRZVoxPGOL' \
    > test.out 2>&1
eval_tap $? 431 'PublicListActiveSections' test.out

#- 432 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'VBIlFgTAsXgqx3mf' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId '9VTJB9Al3mn2DsHD' \
    --limit '69' \
    --offset '52' \
    --sku 'EYZE3KaGSdhEGKcp' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 432 'PublicQueryUserSubscriptions' test.out

#- 433 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ldl3Y82DOj5kPuNR' \
    --body '{"currencyCode": "ZZaUccuBYep9n7b1", "itemId": "7fsblalJrwQiU3DD", "language": "YIKg_nFtF-717", "region": "bFDj2L2McvCrrR7h", "returnUrl": "9uKLXDaRf3pxKtJb", "source": "RY5luCwKrt6wn3yV"}' \
    > test.out 2>&1
eval_tap $? 433 'PublicSubscribeSubscription' test.out

#- 434 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'rRCh6j7rpv8K8fBA' \
    --itemId 'eRa1R6ksxLYGkOLg' \
    > test.out 2>&1
eval_tap $? 434 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 435 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Reff5IHxLJIemNHb' \
    --userId 'zgAFjtjC7suvgIUk' \
    > test.out 2>&1
eval_tap $? 435 'PublicGetUserSubscription' test.out

#- 436 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'B2PAGJqOrkdlZB24' \
    --userId '6OY0dPVMd2WDUVEQ' \
    > test.out 2>&1
eval_tap $? 436 'PublicChangeSubscriptionBillingAccount' test.out

#- 437 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'TpfyAIoF7qsANBbE' \
    --userId 'KQrgocpjGNenRlDO' \
    --body '{"immediate": true, "reason": "h3i7j095rDL6lEuB"}' \
    > test.out 2>&1
eval_tap $? 437 'PublicCancelSubscription' test.out

#- 438 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '1ZIMIs1dFvYokH9t' \
    --userId '2u8ZZnyHKkk6Gh25' \
    --excludeFree  \
    --limit '40' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserSubscriptionBillingHistories' test.out

#- 439 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'EcX9GegDnrYz0GFp' \
    --language 'SVdxFsXAp1roclyX' \
    --storeId 'llFitPamSKRzDIZg' \
    > test.out 2>&1
eval_tap $? 439 'PublicListViews' test.out

#- 440 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'Sk6suS90ZbDdmjU1' \
    --namespace "$AB_NAMESPACE" \
    --userId '1QIZtkSn8QRbA5V4' \
    > test.out 2>&1
eval_tap $? 440 'PublicGetWallet' test.out

#- 441 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'gjWv1W6cqnvSuKsw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q7vH8GScnP5QzRBY' \
    --limit '45' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 441 'PublicListUserWalletTransactions' test.out

#- 442 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --availableDate 'refgmVFBVz4KRCU0' \
    --baseAppId 'p4jIt01gzH17IcfJ' \
    --categoryPath 'yGulmByN5rcDA3Wc' \
    --features 'v9ouALjgLZZzLU9w' \
    --includeSubCategoryItem  \
    --itemName '8MJRIzIgJKg9y86B' \
    --itemStatus 'ACTIVE' \
    --itemType 'COINS' \
    --limit '56' \
    --offset '55' \
    --region 'Qtm5AilVhASFlYMV' \
    --sectionExclusive  \
    --sortBy 'displayOrder,createdAt:desc,displayOrder:asc' \
    --storeId 'E2dAeC7pF73y9eAL' \
    --tags 'KWinUJ7bAuUJ7Fxg' \
    --targetNamespace '5LijlQTVq8Bh1p0N' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 442 'QueryItems1' test.out

#- 443 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CKWNkLU5ty3uQa7F' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 443 'ImportStore1' test.out

#- 444 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'l3ZhSMLtrwnjTJVD' \
    --body '{"itemIds": ["lh112byTYCDBnAvf", "8JpFuJSZistM7554", "4PDlVK8taScpV0Nt"]}' \
    > test.out 2>&1
eval_tap $? 444 'ExportStore1' test.out

#- 445 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CxDDz5rxt6LflBJj' \
    --body '{"entitlementCollectionId": "okLAaL4oAF2lqx8y", "entitlementOrigin": "Nintendo", "metadata": {"DjSWiSXsV5rJ8eZX": {}, "Z1TLMZnNL3DQK45I": {}, "AtbyUDDSJSV8pzl1": {}}, "origin": "IOS", "rewards": [{"currency": {"currencyCode": "3MJXIuLWYb2iHHVN", "namespace": "0ZBgvrigXUT4fRba"}, "item": {"itemId": "wD5yOvjgOopQfbXm", "itemSku": "tF0WFH7F2Inhxtyn", "itemType": "UjuBCxkb2oF99xI1"}, "quantity": 98, "type": "ITEM"}, {"currency": {"currencyCode": "VuhoGP2IFXGU5huj", "namespace": "EfCMt95DEjxqhgYq"}, "item": {"itemId": "mMqIdlRrQmuILkeR", "itemSku": "UafUDP5b6BWfm7cY", "itemType": "CpDIJG42ILhUoCh8"}, "quantity": 23, "type": "ITEM"}, {"currency": {"currencyCode": "mKKocC5Ea29JhfFG", "namespace": "N964J8WOgsAj2Rmf"}, "item": {"itemId": "1DXvAIkzTRNRVyeE", "itemSku": "Gu1ICOCmLAmcaEFB", "itemType": "Kgy92LYqtQcDN7OM"}, "quantity": 59, "type": "CURRENCY"}], "source": "DLC", "transactionId": "baJ0DCuIeEStt3Pb"}' \
    > test.out 2>&1
eval_tap $? 445 'FulfillRewardsV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE