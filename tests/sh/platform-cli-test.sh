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
echo "1..321"

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

#- 3 TestFulfillmentScriptEval
./ng net.accelbyte.sdk.cli.Main platform testFulfillmentScriptEval \
    --body '{"context": {"item": {"appId": "FtBxyZcD", "appType": "DEMO", "baseAppId": "pGlsQuJu", "boothName": "8vMf0IsJ", "boundItemIds": ["kTrd8IDc"], "categoryPath": "V2zXnTKj", "clazz": "XY1bPqam", "createdAt": "1975-08-05T00:00:00Z", "description": "xx9Cs18E", "displayOrder": 100, "entitlementType": "DURABLE", "ext": {"kItqRzHU": {}}, "features": ["1oh570KQ"], "images": [{"as": "BVaewc72", "caption": "krSha68n", "height": 100, "imageUrl": "nozp1C2K", "smallImageUrl": "mIQTuBdN", "width": 61}], "itemId": "UsxFb8CJ", "itemIds": ["17M7DJZa"], "itemQty": {"MSxECbZb": 49}, "itemType": "COINS", "language": "yoarORoe", "listable": false, "localExt": {"8Rh3kgs9": {}}, "longDescription": "qqJbnQso", "maxCount": 54, "maxCountPerUser": 12, "name": "iVpP8Cm3", "namespace": "yvASUoxd", "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 63, "fixedTrialCycles": 32, "graceDays": 24}, "region": "AGTJ8IEd", "regionData": [{"currencyCode": "agEtp4w2", "currencyNamespace": "9KOu9c19", "currencyType": "VIRTUAL", "discountAmount": 33, "discountExpireAt": "1995-09-24T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1976-11-25T00:00:00Z", "discountedPrice": 26, "expireAt": "1978-10-30T00:00:00Z", "price": 61, "purchaseAt": "1989-10-31T00:00:00Z", "trialPrice": 11}], "seasonType": "PASS", "sku": "iX7jpkVZ", "stackable": false, "status": "ACTIVE", "tags": ["QYEmqGod"], "targetCurrencyCode": "OEGt9gPO", "targetItemId": "j0c6i0Jk", "targetNamespace": "vIas73uc", "thumbnailUrl": "YnFAJ3DK", "title": "5T4Eogg0", "updatedAt": "1996-04-22T00:00:00Z", "useCount": 23}, "namespace": "pv5bVAgt", "order": {"currency": {"currencyCode": "sDhUTDUs", "currencySymbol": "cbQDjbTQ", "currencyType": "VIRTUAL", "decimals": 83, "namespace": "Mz2PTRlk"}, "ext": {"yU89ZPOw": {}}, "free": true}, "source": "GIFT"}, "script": "J42cwmzB", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'SMNcoAAO' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'jKNjfcYH' \
    --body '{"grantDays": "m093aYgB"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'U1sqjyK0' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'XH45PaRS' \
    --body '{"grantDays": "OFQBtu23"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'QueryCampaigns' test.out

#- 9 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "REZ8hRVX", "items": [{"extraSubscriptionDays": 74, "itemId": "GOvDdYiQ", "itemName": "S9i7mV1C", "quantity": 30}], "maxRedeemCountPerCampaignPerUser": 18, "maxRedeemCountPerCode": 64, "maxRedeemCountPerCodePerUser": 13, "maxSaleCount": 31, "name": "xL6ycTQd", "redeemEnd": "1981-03-31T00:00:00Z", "redeemStart": "1977-10-25T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["SQWEXL6L"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateCampaign' test.out

#- 10 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'E1YHo9m1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetCampaign' test.out

#- 11 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId '26ZWc8hH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "tWvbNYqg", "items": [{"extraSubscriptionDays": 92, "itemId": "qslArFPi", "itemName": "HUIvaCv8", "quantity": 20}], "maxRedeemCountPerCampaignPerUser": 92, "maxRedeemCountPerCode": 6, "maxRedeemCountPerCodePerUser": 55, "maxSaleCount": 55, "name": "pdsJLhsV", "redeemEnd": "1983-09-03T00:00:00Z", "redeemStart": "1982-05-20T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["oot0B7WO"]}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateCampaign' test.out

#- 12 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'fercZdpM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'GetCampaignDynamic' test.out

#- 13 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'GetRootCategories' test.out

#- 14 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ci37Ds7Y' \
    --body '{"categoryPath": "SfExaI3u", "localizationDisplayNames": {"zLteMbFA": "lt4hr7Hm"}}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCategory' test.out

#- 15 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'ListCategoriesBasic' test.out

#- 16 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'OYiBA5lt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCategory' test.out

#- 17 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'AOXmlG6e' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'h1dTdoTF' \
    --body '{"localizationDisplayNames": {"pBIcuC1d": "QY93OJnJ"}}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCategory' test.out

#- 18 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath '6Te9vD8l' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dz7Hu8AD' \
    > test.out 2>&1
eval_tap $? 18 'DeleteCategory' test.out

#- 19 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath '79kdWunv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetChildCategories' test.out

#- 20 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'izU0q1pH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetDescendantCategories' test.out

#- 21 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'yhhERoGg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'QueryCodes' test.out

#- 22 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'drysMizB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 65}' \
    > test.out 2>&1
eval_tap $? 22 'CreateCodes' test.out

#- 23 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'SRdP2l7D' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'Download' test.out

#- 24 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'NSZ8Aq0X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'BulkDisableCodes' test.out

#- 25 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'iPLQXSe0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'BulkEnableCodes' test.out

#- 26 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId '7ZddOGTM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'QueryRedeemHistory' test.out

#- 27 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'lJjBwj9H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetCode' test.out

#- 28 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'JHQKseEd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'DisableCode' test.out

#- 29 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'SXRDSvgu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'EnableCode' test.out

#- 30 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ListCurrencies' test.out

#- 31 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "auw1xT7e", "currencySymbol": "MwSl9MLH", "currencyType": "REAL", "decimals": 91, "localizationDescriptions": {"J2ulNzBv": "wJaQa547"}}' \
    > test.out 2>&1
eval_tap $? 31 'CreateCurrency' test.out

#- 32 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'JllvA8RW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"SpabUt7x": "k6QxyWhf"}}' \
    > test.out 2>&1
eval_tap $? 32 'UpdateCurrency' test.out

#- 33 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'qoWfJw2o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeleteCurrency' test.out

#- 34 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode '8oWUqvPC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'GetCurrencyConfig' test.out

#- 35 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'Z2HzT7NX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'GetCurrencySummary' test.out

#- 36 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'GetDLCItemConfig' test.out

#- 37 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "mWDlXsuN", "rewards": [{"currency": {"currencyCode": "IdQJR5ls", "namespace": "NOlvkfwa"}, "item": {"itemId": "SbnsuLCg", "itemSku": "ToxuVTek", "itemType": "Jgvg6h5H"}, "quantity": 68, "type": "ITEM"}]}]}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateDLCItemConfig' test.out

#- 38 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'DeleteDLCItemConfig' test.out

#- 39 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'GetPlatformDLCConfig' test.out

#- 40 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"0DviplEk": "4vj3LDp4"}}]}' \
    > test.out 2>&1
eval_tap $? 40 'UpdatePlatformDLCConfig' test.out

#- 41 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'DeletePlatformDLCConfig' test.out

#- 42 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'QueryEntitlements' test.out

#- 43 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'yqDt8QUZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetEntitlement' test.out

#- 44 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'QueryFulfillmentHistories' test.out

#- 45 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'GetAppleIAPConfig' test.out

#- 46 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "DpxlHasi", "password": "nGcjrkmR"}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateAppleIAPConfig' test.out

#- 47 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteAppleIAPConfig' test.out

#- 48 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'GetEpicGamesIAPConfig' test.out

#- 49 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "MttgjDSa"}' \
    > test.out 2>&1
eval_tap $? 49 'UpdateEpicGamesIAPConfig' test.out

#- 50 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteEpicGamesIAPConfig' test.out

#- 51 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'GetGoogleIAPConfig' test.out

#- 52 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "IVBmft3U", "serviceAccountId": "dg7p9PGm"}' \
    > test.out 2>&1
eval_tap $? 52 'UpdateGoogleIAPConfig' test.out

#- 53 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'DeleteGoogleIAPConfig' test.out

#- 54 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'UpdateGoogleP12File' test.out

#- 55 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetIAPItemConfig' test.out

#- 56 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "Y2H5kX4M", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"isSX28nA": "RxWRpv5o"}}]}' \
    > test.out 2>&1
eval_tap $? 56 'UpdateIAPItemConfig' test.out

#- 57 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'DeleteIAPItemConfig' test.out

#- 58 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'GetPlayStationIAPConfig' test.out

#- 59 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"environment": "u5xtvd28"}' \
    > test.out 2>&1
eval_tap $? 59 'UpdatePlaystationIAPConfig' test.out

#- 60 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeletePlaystationIAPConfig' test.out

#- 61 GetStadiaIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getStadiaIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'GetStadiaIAPConfig' test.out

#- 62 DeleteStadiaIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteStadiaIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'DeleteStadiaIAPConfig' test.out

#- 63 UpdateStadiaJsonConfigFile
./ng net.accelbyte.sdk.cli.Main platform updateStadiaJsonConfigFile \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'UpdateStadiaJsonConfigFile' test.out

#- 64 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetSteamIAPConfig' test.out

#- 65 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"publisherAuthenticationKey": "OUfCt8UJ"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateSteamIAPConfig' test.out

#- 66 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeleteSteamIAPConfig' test.out

#- 67 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetTwitchIAPConfig' test.out

#- 68 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "C5flNyj6", "clientSecret": "HsTtX8P3", "organizationId": "llnaaS9l"}' \
    > test.out 2>&1
eval_tap $? 68 'UpdateTwitchIAPConfig' test.out

#- 69 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeleteTwitchIAPConfig' test.out

#- 70 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'GetXblIAPConfig' test.out

#- 71 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "qyygPcfk"}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateXblIAPConfig' test.out

#- 72 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'DeleteXblAPConfig' test.out

#- 73 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'UpdateXblBPCertFile' test.out

#- 74 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JIxfQZza' \
    --body '{"categoryPath": "8kNVbDxV", "targetItemId": "Mq7HJk0F", "targetNamespace": "89xAc3YV"}' \
    > test.out 2>&1
eval_tap $? 74 'SyncInGameItem' test.out

#- 75 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'faENtrl0' \
    --body '{"appId": "pTKZTXqz", "appType": "DLC", "baseAppId": "BMYQSA2j", "boothName": "z1ZOpdOj", "categoryPath": "SyMddB41", "clazz": "JuMf7RUy", "displayOrder": 54, "entitlementType": "DURABLE", "ext": {"8IiRimRl": {}}, "features": ["lHT6Dc40"], "images": [{"as": "vFFA6gpU", "caption": "7EW3x1dC", "height": 30, "imageUrl": "m55gOeqQ", "smallImageUrl": "IqcJVKmB", "width": 76}], "itemIds": ["1J1IbuTr"], "itemQty": {"rkbmuT1w": 15}, "itemType": "CODE", "listable": false, "localizations": {"EnDXIWrB": {"description": "PlSay46m", "localExt": {"v71BAZAO": {}}, "longDescription": "jtFJ2vmT", "title": "j7tT7TZH"}}, "maxCount": 96, "maxCountPerUser": 59, "name": "dCkIsZoA", "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 83, "fixedTrialCycles": 66, "graceDays": 4}, "regionData": {"yFAdAtYc": [{"currencyCode": "iLIgRwFR", "currencyNamespace": "r0gwB9tz", "currencyType": "VIRTUAL", "discountAmount": 30, "discountExpireAt": "1995-03-26T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1979-10-18T00:00:00Z", "discountedPrice": 39, "expireAt": "1986-04-13T00:00:00Z", "price": 36, "purchaseAt": "1977-03-05T00:00:00Z", "trialPrice": 30}]}, "seasonType": "TIER", "sku": "w3L7cUd9", "stackable": false, "status": "INACTIVE", "tags": ["tv6JfPZw"], "targetCurrencyCode": "cCVOXcVa", "targetNamespace": "80TmCwtD", "thumbnailUrl": "2lAH01o6", "useCount": 79}' \
    > test.out 2>&1
eval_tap $? 75 'CreateItem' test.out

#- 76 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'dcBIgzrD' \
    > test.out 2>&1
eval_tap $? 76 'GetItemByAppId' test.out

#- 77 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'QueryItems' test.out

#- 78 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'ListBasicItemsByFeatures' test.out

#- 79 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --sku 'yWpFBYGm' \
    > test.out 2>&1
eval_tap $? 79 'GetItemBySku' test.out

#- 80 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --sku 'mBawMyoK' \
    > test.out 2>&1
eval_tap $? 80 'GetLocaleItemBySku' test.out

#- 81 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --sku 'yNpdAasm' \
    > test.out 2>&1
eval_tap $? 81 'GetItemIdBySku' test.out

#- 82 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --itemIds '8xwUfzOl' \
    > test.out 2>&1
eval_tap $? 82 'BulkGetLocaleItems' test.out

#- 83 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --keyword 'QiZY4NbO' \
    --language 'QXJ7uOTz' \
    > test.out 2>&1
eval_tap $? 83 'SearchItems' test.out

#- 84 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'QueryUncategorizedItems' test.out

#- 85 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'NMvuq2tN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'GetItem' test.out

#- 86 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'l4CX4Iji' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'K4DEUJRV' \
    --body '{"appId": "K3l9Eb0R", "appType": "GAME", "baseAppId": "0RH8vS1s", "boothName": "meOlngrd", "categoryPath": "TXCzaPBt", "clazz": "kZMio4wc", "displayOrder": 48, "entitlementType": "DURABLE", "ext": {"loVS3rYp": {}}, "features": ["8QtcEmCE"], "images": [{"as": "Vc75Ufey", "caption": "pWjDNhzC", "height": 75, "imageUrl": "5sWS2qwO", "smallImageUrl": "763iEklk", "width": 50}], "itemIds": ["Lm88LpLu"], "itemQty": {"YRO3C55y": 66}, "itemType": "BUNDLE", "listable": true, "localizations": {"K2JaqenD": {"description": "Gn7a2NUp", "localExt": {"lWiLjq06": {}}, "longDescription": "n6a0rW8E", "title": "fkpaXtwY"}}, "maxCount": 70, "maxCountPerUser": 0, "name": "Q4WbwNms", "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 38, "fixedTrialCycles": 18, "graceDays": 61}, "regionData": {"urH8eloJ": [{"currencyCode": "zNKtRUaT", "currencyNamespace": "z1ETdsmw", "currencyType": "VIRTUAL", "discountAmount": 19, "discountExpireAt": "1976-03-21T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1978-03-09T00:00:00Z", "discountedPrice": 84, "expireAt": "1976-02-25T00:00:00Z", "price": 4, "purchaseAt": "1991-10-29T00:00:00Z", "trialPrice": 2}]}, "seasonType": "PASS", "sku": "lo6DMNpP", "stackable": true, "status": "INACTIVE", "tags": ["TQ1UpjfU"], "targetCurrencyCode": "6wJhy1jO", "targetNamespace": "VkkUlS79", "thumbnailUrl": "527EZ25I", "useCount": 1}' \
    > test.out 2>&1
eval_tap $? 86 'UpdateItem' test.out

#- 87 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId '8uCeZFlL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'DeleteItem' test.out

#- 88 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'tEVpDAEb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 52, "orderNo": "82jy74lq"}' \
    > test.out 2>&1
eval_tap $? 88 'AcquireItem' test.out

#- 89 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId '0pDE5xRw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 89 'GetApp' test.out

#- 90 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'h5b45ebp' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cM7ScSs3' \
    --body '{"carousel": [{"alt": "UOpAwIp9", "previewUrl": "rRtn1PcC", "thumbnailUrl": "xdbumeYg", "type": "image", "url": "EBWRQiW3", "videoSource": "vimeo"}], "developer": "FfU8icH4", "forumUrl": "081gRB1G", "genres": ["Racing"], "localizations": {"LfLg4RYu": {"announcement": "EbgUDEcJ", "slogan": "yIvsPwOr"}}, "platformRequirements": {"0BmV5iFv": [{"additionals": "fwFjTSmI", "directXVersion": "EqoLyLeU", "diskSpace": "GmomGX9s", "graphics": "XTZ0v8pq", "label": "Lfc5SwGn", "osVersion": "ReUULDX4", "processor": "QUIbb5nh", "ram": "68ZnyUtR", "soundCard": "vW9hNBSF"}]}, "platforms": ["Linux"], "players": ["MMO"], "primaryGenre": "Indie", "publisher": "OmjkFrFV", "releaseDate": "1984-06-06T00:00:00Z", "websiteUrl": "0xF34Xpt"}' \
    > test.out 2>&1
eval_tap $? 90 'UpdateApp' test.out

#- 91 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId '6ZlTTic0' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kr2a0nI2' \
    > test.out 2>&1
eval_tap $? 91 'DisableItem' test.out

#- 92 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'oo7UHCJK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'GetItemDynamicData' test.out

#- 93 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId '5sp0aCvI' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'q3aHVYIl' \
    > test.out 2>&1
eval_tap $? 93 'EnableItem' test.out

#- 94 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'ewLRuHY8' \
    --itemId '3bGj0HTe' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eWXlIcRi' \
    > test.out 2>&1
eval_tap $? 94 'FeatureItem' test.out

#- 95 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'dqctDpyg' \
    --itemId 'Y0ax476E' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'D4MMO9Tw' \
    > test.out 2>&1
eval_tap $? 95 'DefeatureItem' test.out

#- 96 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId '2JH0qhWI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'GetLocaleItem' test.out

#- 97 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'wHWTgzJF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "RYw6t1IK"}' \
    > test.out 2>&1
eval_tap $? 97 'ReturnItem' test.out

#- 98 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'QueryKeyGroups' test.out

#- 99 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ZLO6V4Od", "name": "e46QmCid", "status": "ACTIVE", "tags": ["dpP7RTC5"]}' \
    > test.out 2>&1
eval_tap $? 99 'CreateKeyGroup' test.out

#- 100 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId '87lmUmBz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 100 'GetKeyGroup' test.out

#- 101 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'iPZBnpOf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "kllxfq0N", "name": "srSjw5Ho", "status": "ACTIVE", "tags": ["0blM1d5M"]}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateKeyGroup' test.out

#- 102 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'StYGczLI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 102 'GetKeyGroupDynamic' test.out

#- 103 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'NlEC0OEs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'ListKeys' test.out

#- 104 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'E3yzIsUP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'UploadKeys' test.out

#- 105 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 105 'QueryOrders' test.out

#- 106 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 106 'GetOrderStatistics' test.out

#- 107 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0NjluOrG' \
    > test.out 2>&1
eval_tap $? 107 'GetOrder' test.out

#- 108 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZTzsLW7F' \
    --body '{"description": "jfs9nIkc"}' \
    > test.out 2>&1
eval_tap $? 108 'RefundOrder' test.out

#- 109 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 109 'GetPaymentCallbackConfig' test.out

#- 110 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": false, "notifyUrl": "UEanjKHb", "privateKey": "Xfk1zxdz"}' \
    > test.out 2>&1
eval_tap $? 110 'UpdatePaymentCallbackConfig' test.out

#- 111 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 111 'QueryPaymentNotifications' test.out

#- 112 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'QueryPaymentOrders' test.out

#- 113 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "xg0UXcRy", "currencyNamespace": "Hi3u8BzV", "customParameters": {"Wu1tOmhU": {}}, "description": "tCgcpvGr", "extOrderNo": "EbcZUDEx", "extUserId": "H1tayOGX", "itemType": "SEASON", "language": "rJmc-IJLR", "metadata": {"pyyEcQxV": "gJIjMZqc"}, "notifyUrl": "WfMl6dqr", "omitNotification": false, "price": 59, "recurringPaymentOrderNo": "4tnc3ZRB", "region": "3IkdtPfA", "returnUrl": "JEomwenJ", "sandbox": true, "sku": "Q8grtQSv", "subscriptionId": "6EcALcMI", "targetNamespace": "Pms5bT51", "targetUserId": "M4yko8S0", "title": "EnGLvGvf"}' \
    > test.out 2>&1
eval_tap $? 113 'CreatePaymentOrderByDedicated' test.out

#- 114 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'uSyCTyjj' \
    > test.out 2>&1
eval_tap $? 114 'ListExtOrderNoByExtTxId' test.out

#- 115 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '4mCaiuMG' \
    > test.out 2>&1
eval_tap $? 115 'GetPaymentOrder' test.out

#- 116 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'KOF5GJJo' \
    --body '{"extTxId": "oSXUl3YU", "paymentMethod": "35QHGpBA", "paymentProvider": "WXPAY"}' \
    > test.out 2>&1
eval_tap $? 116 'ChargePaymentOrder' test.out

#- 117 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'nOlxDznI' \
    --body '{"description": "CQVyqBg3"}' \
    > test.out 2>&1
eval_tap $? 117 'RefundPaymentOrderByDedicated' test.out

#- 118 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '4WTtDkn0' \
    --body '{"amount": 34, "currencyCode": "tn6t0Yx4", "notifyType": "REFUND", "paymentProvider": "PAYPAL", "salesTax": 1, "vat": 84}' \
    > test.out 2>&1
eval_tap $? 118 'SimulatePaymentOrderNotification' test.out

#- 119 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '1rUQYCNT' \
    > test.out 2>&1
eval_tap $? 119 'GetPaymentOrderChargeStatus' test.out

#- 120 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "iDX4jE3M", "eventTopic": "2IsTHu8Q", "maxAwarded": 44, "maxAwardedPerUser": 79, "namespaceExpression": "yOlXfIWd", "rewardCode": "0mcq5T4S", "rewardConditions": [{"condition": "Uc7cWfCK", "conditionName": "K6Dij1gF", "eventName": "cenEMySP", "rewardItems": [{"duration": 11, "itemId": "hxBenDiT", "quantity": 16}]}], "userIdExpression": "AqFYmFKj"}' \
    > test.out 2>&1
eval_tap $? 120 'CreateReward' test.out

#- 121 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'QueryRewards' test.out

#- 122 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'ExportRewards' test.out

#- 123 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting
    > test.out 2>&1
eval_tap $? 123 'ImportRewards' test.out

#- 124 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'aELmmll6' \
    > test.out 2>&1
eval_tap $? 124 'GetReward' test.out

#- 125 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'oexId1OK' \
    --body '{"description": "GUN2Uznd", "eventTopic": "7uVa7t14", "maxAwarded": 48, "maxAwardedPerUser": 43, "namespaceExpression": "SYSV52bH", "rewardCode": "ifCIf4ts", "rewardConditions": [{"condition": "uu6Pkam6", "conditionName": "tFSYFt4Z", "eventName": "xA2PzZFR", "rewardItems": [{"duration": 20, "itemId": "BNlg6hn5", "quantity": 33}]}], "userIdExpression": "usKyZAuV"}' \
    > test.out 2>&1
eval_tap $? 125 'UpdateReward' test.out

#- 126 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '6uUvqM0l' \
    > test.out 2>&1
eval_tap $? 126 'DeleteReward' test.out

#- 127 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'V6UZMlEb' \
    --body '{"payload": {"xHNgJRiQ": {}}}' \
    > test.out 2>&1
eval_tap $? 127 'CheckEventCondition' test.out

#- 128 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'ListStores' test.out

#- 129 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "ExaunjdA", "defaultRegion": "qnHUz44t", "description": "x4O6hamP", "supportedLanguages": ["wNoi071e"], "supportedRegions": ["zDK56JFI"], "title": "Ge1IMUCL"}' \
    > test.out 2>&1
eval_tap $? 129 'CreateStore' test.out

#- 130 ImportStore
./ng net.accelbyte.sdk.cli.Main platform importStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 130 'ImportStore' test.out

#- 131 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 131 'GetPublishedStore' test.out

#- 132 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 132 'DeletePublishedStore' test.out

#- 133 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 133 'GetPublishedStoreBackup' test.out

#- 134 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 134 'RollbackPublishedStore' test.out

#- 135 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cN0DsaD5' \
    > test.out 2>&1
eval_tap $? 135 'GetStore' test.out

#- 136 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FyBsFe9O' \
    --body '{"defaultLanguage": "YEJVsYff", "defaultRegion": "mhyx6J25", "description": "PrM4S3cB", "supportedLanguages": ["8m17hEeL"], "supportedRegions": ["LgoaYth6"], "title": "zcf8eA45"}' \
    > test.out 2>&1
eval_tap $? 136 'UpdateStore' test.out

#- 137 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OMvObWej' \
    > test.out 2>&1
eval_tap $? 137 'DeleteStore' test.out

#- 138 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'o9LfGeeg' \
    > test.out 2>&1
eval_tap $? 138 'CloneStore' test.out

#- 139 ExportStore
./ng net.accelbyte.sdk.cli.Main platform exportStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JMaBGR6D' \
    > test.out 2>&1
eval_tap $? 139 'ExportStore' test.out

#- 140 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'QuerySubscriptions' test.out

#- 141 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '1ZoZEZQk' \
    > test.out 2>&1
eval_tap $? 141 'RecurringChargeSubscription' test.out

#- 142 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'J8DSqFnh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'GetTicketDynamic' test.out

#- 143 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'dKvjFCFb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "SFlEWoMP"}' \
    > test.out 2>&1
eval_tap $? 143 'DecreaseTicketSale' test.out

#- 144 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'dgK5zn62' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 144 'GetTicketBoothID' test.out

#- 145 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'mhnFSpCT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 22, "orderNo": "DNBOcygv"}' \
    > test.out 2>&1
eval_tap $? 145 'IncreaseTicketSale' test.out

#- 146 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'v2LAgfBG' \
    > test.out 2>&1
eval_tap $? 146 'AnonymizeCampaign' test.out

#- 147 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'VzanbKYs' \
    > test.out 2>&1
eval_tap $? 147 'AnonymizeEntitlement' test.out

#- 148 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'B0gqJ8Vh' \
    > test.out 2>&1
eval_tap $? 148 'AnonymizeFulfillment' test.out

#- 149 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'YSikJl2p' \
    > test.out 2>&1
eval_tap $? 149 'AnonymizeIntegration' test.out

#- 150 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '9rBx8N5e' \
    > test.out 2>&1
eval_tap $? 150 'AnonymizeOrder' test.out

#- 151 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'gapqxDy4' \
    > test.out 2>&1
eval_tap $? 151 'AnonymizePayment' test.out

#- 152 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'cLfNjzzE' \
    > test.out 2>&1
eval_tap $? 152 'AnonymizeSubscription' test.out

#- 153 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZYA8jIkM' \
    > test.out 2>&1
eval_tap $? 153 'AnonymizeWallet' test.out

#- 154 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jb7cZ2bP' \
    > test.out 2>&1
eval_tap $? 154 'QueryUserEntitlements' test.out

#- 155 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'saLLpEBV' \
    --body '[{"endDate": "1986-11-02T00:00:00Z", "grantedCode": "k5AsKaF2", "itemId": "P44lXkI3", "itemNamespace": "zdiRiC5I", "language": "pI_OINd", "quantity": 83, "region": "u5V6QSYx", "source": "GIFT", "startDate": "1994-11-19T00:00:00Z", "storeId": "ryVuZYmg"}]' \
    > test.out 2>&1
eval_tap $? 155 'GrantUserEntitlement' test.out

#- 156 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'UeEPB5AG' \
    --appId 'Pgvk0Zth' \
    > test.out 2>&1
eval_tap $? 156 'GetUserAppEntitlementByAppId' test.out

#- 157 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'aj0EBA4a' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 157 'QueryUserEntitlementsByAppType' test.out

#- 158 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rz0d56sm' \
    --itemId 'obor4p1P' \
    > test.out 2>&1
eval_tap $? 158 'GetUserEntitlementByItemId' test.out

#- 159 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'lgQB9EcN' \
    --sku 'GOeBRY6G' \
    > test.out 2>&1
eval_tap $? 159 'GetUserEntitlementBySku' test.out

#- 160 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '5ae07deD' \
    > test.out 2>&1
eval_tap $? 160 'ExistsAnyUserActiveEntitlement' test.out

#- 161 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'LaZ8JCvb' \
    --itemIds '["eTfW0hgz"]' \
    > test.out 2>&1
eval_tap $? 161 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 162 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'rabLJxEw' \
    --appId 'JrEBmQ64' \
    > test.out 2>&1
eval_tap $? 162 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 163 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'haNOzlGu' \
    --itemId '68UYyupj' \
    > test.out 2>&1
eval_tap $? 163 'GetUserEntitlementOwnershipByItemId' test.out

#- 164 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'dDetnoT0' \
    --sku 'rfWtVPwQ' \
    > test.out 2>&1
eval_tap $? 164 'GetUserEntitlementOwnershipBySku' test.out

#- 165 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'fq6V92gb' \
    --entitlementIds 'fPouNdmP' \
    > test.out 2>&1
eval_tap $? 165 'RevokeUserEntitlements' test.out

#- 166 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId '7fckVnuD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GvYIb1p5' \
    > test.out 2>&1
eval_tap $? 166 'GetUserEntitlement' test.out

#- 167 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'tcR5z8ZJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LjSHcaR3' \
    --body '{"endDate": "1995-06-01T00:00:00Z", "nullFieldList": ["Zmwr0QmO"], "startDate": "1977-05-30T00:00:00Z", "status": "REVOKED", "useCount": 13}' \
    > test.out 2>&1
eval_tap $? 167 'UpdateUserEntitlement' test.out

#- 168 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId '49eXp0xQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kZ2JjuwW' \
    --body '{"useCount": 96}' \
    > test.out 2>&1
eval_tap $? 168 'ConsumeUserEntitlement' test.out

#- 169 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'y0tU11PC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eSrvejUK' \
    > test.out 2>&1
eval_tap $? 169 'DisableUserEntitlement' test.out

#- 170 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'wVfF37Vr' \
    --namespace "$AB_NAMESPACE" \
    --userId '7mkDzFBI' \
    > test.out 2>&1
eval_tap $? 170 'EnableUserEntitlement' test.out

#- 171 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId '1VwhkVSK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DlNFOUHB' \
    > test.out 2>&1
eval_tap $? 171 'GetUserEntitlementHistories' test.out

#- 172 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'JsvTsqk9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hg4hj6nU' \
    > test.out 2>&1
eval_tap $? 172 'RevokeUserEntitlement' test.out

#- 173 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'debW6Usk' \
    --body '{"duration": 3, "endDate": "1991-03-24T00:00:00Z", "itemId": "kZAk01f1", "itemSku": "KxCtWADU", "language": "2guN6U9w", "order": {"currency": {"currencyCode": "13W1K9TZ", "currencySymbol": "Q4qRLEi5", "currencyType": "VIRTUAL", "decimals": 29, "namespace": "wE36rfmM"}, "ext": {"0CCs35TP": {}}, "free": false}, "orderNo": "sY8WgwSx", "quantity": 58, "region": "I5GH9bv9", "source": "ACHIEVEMENT", "startDate": "1998-09-19T00:00:00Z", "storeId": "pA6pzjHp"}' \
    > test.out 2>&1
eval_tap $? 173 'FulfillItem' test.out

#- 174 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZO0E9iLg' \
    --body '{"code": "RPJK3nBa", "language": "go", "region": "Qrqra0Pt"}' \
    > test.out 2>&1
eval_tap $? 174 'RedeemCode' test.out

#- 175 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'kfvOpY2r' \
    --body '{"rewards": [{"currency": {"currencyCode": "amp5lnBn", "namespace": "6xmBkfMt"}, "item": {"itemId": "C66hFq0k", "itemSku": "POkORm2X", "itemType": "jlNEE5ec"}, "quantity": 83, "type": "CURRENCY"}], "source": "REWARD"}' \
    > test.out 2>&1
eval_tap $? 175 'FulfillRewards' test.out

#- 176 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'mi0ySJHf' \
    > test.out 2>&1
eval_tap $? 176 'QueryUserIAPOrders' test.out

#- 177 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'PloP1XkY' \
    > test.out 2>&1
eval_tap $? 177 'QueryAllUserIAPOrders' test.out

#- 178 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'K4MgIsDS' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "pYmH-WXhb-199", "productId": "ftll8N0V", "region": "vChHz9ur", "type": "STEAM"}' \
    > test.out 2>&1
eval_tap $? 178 'MockFulfillIAPItem' test.out

#- 179 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 't7QWvE8s' \
    > test.out 2>&1
eval_tap $? 179 'QueryUserOrders' test.out

#- 180 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId '6Uz8BRuY' \
    --itemId 'WDTtL6MT' \
    > test.out 2>&1
eval_tap $? 180 'CountOfPurchasedItem' test.out

#- 181 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'TRkCbb9S' \
    --userId '5Q1IVHGT' \
    > test.out 2>&1
eval_tap $? 181 'GetUserOrder' test.out

#- 182 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo '88prREBg' \
    --userId 'YOWdHJ9J' \
    --body '{"status": "FULFILL_FAILED", "statusReason": "mohtU13g"}' \
    > test.out 2>&1
eval_tap $? 182 'UpdateUserOrderStatus' test.out

#- 183 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'f7TRigNZ' \
    --userId 'j5w5y3Hm' \
    > test.out 2>&1
eval_tap $? 183 'FulfillUserOrder' test.out

#- 184 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'K8QVOa62' \
    --userId 'eQZtbLLc' \
    > test.out 2>&1
eval_tap $? 184 'GetUserOrderGrant' test.out

#- 185 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'F671WLtv' \
    --userId '38Hecczo' \
    > test.out 2>&1
eval_tap $? 185 'GetUserOrderHistories' test.out

#- 186 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'pFmeRwpc' \
    --userId 'JBZyi3mL' \
    --body '{"additionalData": {"cardSummary": "C4KzekiS"}, "authorisedTime": "1983-02-02T00:00:00Z", "chargebackReversedTime": "1983-04-23T00:00:00Z", "chargebackTime": "1976-04-14T00:00:00Z", "chargedTime": "1991-12-05T00:00:00Z", "createdTime": "1980-03-18T00:00:00Z", "currency": {"currencyCode": "oVHgCytC", "currencySymbol": "6lRG98Yx", "currencyType": "REAL", "decimals": 66, "namespace": "bRdoTKKe"}, "customParameters": {"uSjfZe9i": {}}, "extOrderNo": "1osghF1h", "extTxId": "zi1Nl47s", "extUserId": "yJ5ibzSH", "issuedAt": "1996-01-28T00:00:00Z", "metadata": {"CLIvWPVR": "sdEqA61y"}, "namespace": "TrMgsycT", "nonceStr": "gmPzc20E", "paymentMethod": "uO5dMqGD", "paymentMethodFee": 22, "paymentOrderNo": "SZPY07rE", "paymentProvider": "ADYEN", "paymentProviderFee": 51, "paymentStationUrl": "HjL6ZbXj", "price": 64, "refundedTime": "1985-12-22T00:00:00Z", "salesTax": 25, "sandbox": false, "sku": "p3op8hta", "status": "REFUNDED", "statusReason": "LxtW4PvF", "subscriptionId": "kESTULat", "subtotalPrice": 62, "targetNamespace": "1Le7cR7q", "targetUserId": "6PWhZmmK", "tax": 50, "totalPrice": 17, "totalTax": 91, "txEndTime": "1978-09-11T00:00:00Z", "type": "ipJHahVi", "userId": "JvLYW0kd", "vat": 25}' \
    > test.out 2>&1
eval_tap $? 186 'ProcessUserOrderNotification' test.out

#- 187 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'lk2luqSO' \
    --userId 'OA2VOZBo' \
    > test.out 2>&1
eval_tap $? 187 'DownloadUserOrderReceipt' test.out

#- 188 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'NbB98PuS' \
    --body '{"currencyCode": "GykqFzPw", "currencyNamespace": "SMXT53bB", "customParameters": {"uL38beOY": {}}, "description": "DVuHZQ9L", "extOrderNo": "Yt6w23Wf", "extUserId": "8iEQo72s", "itemType": "APP", "language": "DCdL-SFiU-jP", "metadata": {"K1AyRlzs": "rRXEFZiv"}, "notifyUrl": "QOHG6wVi", "omitNotification": false, "price": 78, "recurringPaymentOrderNo": "ratsvvHL", "region": "mIohfNIS", "returnUrl": "LXMDWDdm", "sandbox": true, "sku": "E4lliQMn", "subscriptionId": "utJbpEo4", "title": "mUNHFtdm"}' \
    > test.out 2>&1
eval_tap $? 188 'CreateUserPaymentOrder' test.out

#- 189 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'l2xNviWa' \
    --userId 'cJc3Fm7Z' \
    --body '{"description": "548uuKgo"}' \
    > test.out 2>&1
eval_tap $? 189 'RefundUserPaymentOrder' test.out

#- 190 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'CBqS5uId' \
    --body '{"code": "CbwCeeq9", "orderNo": "ouEdDtjO"}' \
    > test.out 2>&1
eval_tap $? 190 'ApplyUserRedemption' test.out

#- 191 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'gsypLkm2' \
    > test.out 2>&1
eval_tap $? 191 'QueryUserSubscriptions' test.out

#- 192 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZYew5H7Z' \
    > test.out 2>&1
eval_tap $? 192 'GetUserSubscriptionActivities' test.out

#- 193 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'm0gnYyj6' \
    --body '{"grantDays": 76, "itemId": "Xf9G1nty", "language": "ebvoeHen", "reason": "AALKt7Ef", "region": "xIH446oU", "source": "nP2S74un"}' \
    > test.out 2>&1
eval_tap $? 193 'PlatformSubscribeSubscription' test.out

#- 194 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xwg0JKqV' \
    --itemId 'WW1rjK1e' \
    > test.out 2>&1
eval_tap $? 194 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 195 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'pwkAvcsY' \
    --userId 'vbgfBVPp' \
    > test.out 2>&1
eval_tap $? 195 'GetUserSubscription' test.out

#- 196 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Ta8Yuq7T' \
    --userId 'KiNXmz7e' \
    > test.out 2>&1
eval_tap $? 196 'DeleteUserSubscription' test.out

#- 197 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'MrMD5Tba' \
    --userId 'UxTCTng0' \
    --body '{"immediate": true, "reason": "jtdBrjs3"}' \
    > test.out 2>&1
eval_tap $? 197 'CancelSubscription' test.out

#- 198 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Kiykt2Ck' \
    --userId '2gOlSatE' \
    --body '{"grantDays": 56, "reason": "Z2UgwQLq"}' \
    > test.out 2>&1
eval_tap $? 198 'GrantDaysToSubscription' test.out

#- 199 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'DqYSxTPu' \
    --userId 'VlBqirdp' \
    > test.out 2>&1
eval_tap $? 199 'GetUserSubscriptionBillingHistories' test.out

#- 200 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '3yxnsETl' \
    --userId '1SvhQuds' \
    --body '{"additionalData": {"cardSummary": "jIhXdxiS"}, "authorisedTime": "1978-05-06T00:00:00Z", "chargebackReversedTime": "1977-04-20T00:00:00Z", "chargebackTime": "1982-02-20T00:00:00Z", "chargedTime": "1995-08-07T00:00:00Z", "createdTime": "1985-11-28T00:00:00Z", "currency": {"currencyCode": "MqzQIxib", "currencySymbol": "hpNYsHtd", "currencyType": "VIRTUAL", "decimals": 69, "namespace": "kjuaZqhJ"}, "customParameters": {"ilrZkSSK": {}}, "extOrderNo": "gP5rxCR7", "extTxId": "7G9d5CA1", "extUserId": "GORSbL9n", "issuedAt": "1997-01-20T00:00:00Z", "metadata": {"bWDEupmd": "LQzPnNfB"}, "namespace": "AcWArbkC", "nonceStr": "fdHIZb03", "paymentMethod": "otqmBuS9", "paymentMethodFee": 95, "paymentOrderNo": "2pCZ23UH", "paymentProvider": "STRIPE", "paymentProviderFee": 20, "paymentStationUrl": "0lpJ4JLl", "price": 32, "refundedTime": "1975-10-25T00:00:00Z", "salesTax": 29, "sandbox": true, "sku": "UoVRUb39", "status": "AUTHORISE_FAILED", "statusReason": "22P4Sp09", "subscriptionId": "cKmjRUbZ", "subtotalPrice": 94, "targetNamespace": "BVS7OK2Z", "targetUserId": "rdcsckMe", "tax": 20, "totalPrice": 87, "totalTax": 80, "txEndTime": "1995-10-17T00:00:00Z", "type": "UTqkK2eF", "userId": "aGLoSmEE", "vat": 82}' \
    > test.out 2>&1
eval_tap $? 200 'ProcessUserSubscriptionNotification' test.out

#- 201 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'bLywJsyU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ie6fZgLl' \
    --body '{"count": 23, "orderNo": "UPsO8lg4"}' \
    > test.out 2>&1
eval_tap $? 201 'AcquireUserTicket' test.out

#- 202 CheckWallet
./ng net.accelbyte.sdk.cli.Main platform checkWallet \
    --currencyCode '6Si7006v' \
    --namespace "$AB_NAMESPACE" \
    --userId 'L2w4aajD' \
    > test.out 2>&1
eval_tap $? 202 'CheckWallet' test.out

#- 203 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'AOx0iJjY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'leaktqv2' \
    --body '{"amount": 96, "reason": "kljQuD5m", "source": "ACHIEVEMENT"}' \
    > test.out 2>&1
eval_tap $? 203 'CreditUserWallet' test.out

#- 204 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'JONqHGq8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mB7mF2lM' \
    --body '{"amount": 62}' \
    > test.out 2>&1
eval_tap $? 204 'PayWithUserWallet' test.out

#- 205 GetUserWallet
./ng net.accelbyte.sdk.cli.Main platform getUserWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'caghFXJI' \
    --walletId 'JflRHFcs' \
    > test.out 2>&1
eval_tap $? 205 'GetUserWallet' test.out

#- 206 DebitUserWallet
./ng net.accelbyte.sdk.cli.Main platform debitUserWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'IqCy4xDi' \
    --walletId 'fSSQ5On2' \
    --body '{"amount": 4, "reason": "cEcl3xei"}' \
    > test.out 2>&1
eval_tap $? 206 'DebitUserWallet' test.out

#- 207 DisableUserWallet
./ng net.accelbyte.sdk.cli.Main platform disableUserWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'O4bwF5JO' \
    --walletId 'jGoGxKM3' \
    > test.out 2>&1
eval_tap $? 207 'DisableUserWallet' test.out

#- 208 EnableUserWallet
./ng net.accelbyte.sdk.cli.Main platform enableUserWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'qMce5tfL' \
    --walletId 'cpjFZMKC' \
    > test.out 2>&1
eval_tap $? 208 'EnableUserWallet' test.out

#- 209 ListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserWalletTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'bp0pEbLC' \
    --walletId 'LFpHxMYF' \
    > test.out 2>&1
eval_tap $? 209 'ListUserWalletTransactions' test.out

#- 210 QueryWallets
./ng net.accelbyte.sdk.cli.Main platform queryWallets \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 210 'QueryWallets' test.out

#- 211 GetWallet
./ng net.accelbyte.sdk.cli.Main platform getWallet \
    --namespace "$AB_NAMESPACE" \
    --walletId '836075xE' \
    > test.out 2>&1
eval_tap $? 211 'GetWallet' test.out

#- 212 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --end 'pzdnYtpj' \
    --start 'a5ig2isQ' \
    > test.out 2>&1
eval_tap $? 212 'SyncOrders' test.out

#- 213 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --body '{"allowedPaymentMethods": ["Zga6Vy76"], "apiKey": "izPiQRjY", "authoriseAsCapture": false, "blockedPaymentMethods": ["8fv5fIt2"], "clientKey": "2tIZhjhg", "dropInSettings": "kigW22zX", "liveEndpointUrlPrefix": "MWXfbcM0", "merchantAccount": "GIALIbFC", "notificationHmacKey": "QgBcLNT6", "notificationPassword": "iOQVYx5r", "notificationUsername": "W2gMsI1a", "returnUrl": "YBitSn3U", "settings": "DeKj97I4"}' \
    > test.out 2>&1
eval_tap $? 213 'TestAdyenConfig' test.out

#- 214 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --body '{"appId": "WYXLqjN7", "privateKey": "ktOBTraB", "publicKey": "xWRTVuYE", "returnUrl": "qGlKDwTK"}' \
    > test.out 2>&1
eval_tap $? 214 'TestAliPayConfig' test.out

#- 215 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --body '{"publicKey": "XBrXiQcd", "secretKey": "9IW8kiCK"}' \
    > test.out 2>&1
eval_tap $? 215 'TestCheckoutConfig' test.out

#- 216 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    > test.out 2>&1
eval_tap $? 216 'DebugMatchedPaymentMerchantConfig' test.out

#- 217 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --body '{"clientID": "eQJWZBvc", "clientSecret": "q1ETvWBx", "returnUrl": "YZJh7B8g", "webHookId": "bnSu9M2O"}' \
    > test.out 2>&1
eval_tap $? 217 'TestPayPalConfig' test.out

#- 218 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --body '{"allowedPaymentMethodTypes": ["xD2udaeY"], "publishableKey": "pCXYSMiy", "secretKey": "87CTqEQB", "webhookSecret": "g36my3sY"}' \
    > test.out 2>&1
eval_tap $? 218 'TestStripeConfig' test.out

#- 219 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "2clrDcai", "key": "n0cOVF1z", "mchid": "HwDTI0sJ", "returnUrl": "1Q0kphMT"}' \
    > test.out 2>&1
eval_tap $? 219 'TestWxPayConfig' test.out

#- 220 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "ggSP2SLc", "flowCompletionUrl": "uAP7vU97", "merchantId": 56, "projectId": 50, "projectSecretKey": "w2nbg8C7"}' \
    > test.out 2>&1
eval_tap $? 220 'TestXsollaConfig' test.out

#- 221 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'Mvywhu6M' \
    > test.out 2>&1
eval_tap $? 221 'GetPaymentMerchantConfig' test.out

#- 222 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'jOjuGzo1' \
    --body '{"allowedPaymentMethods": ["Fz4tU0aS"], "apiKey": "n98N8qOU", "authoriseAsCapture": true, "blockedPaymentMethods": ["0z92RaDe"], "clientKey": "8ngT8LRQ", "dropInSettings": "kMnG1LZy", "liveEndpointUrlPrefix": "F2mdYY6Z", "merchantAccount": "MfuTYTKs", "notificationHmacKey": "ue48qBEB", "notificationPassword": "NAV5BTe6", "notificationUsername": "ec1zA92U", "returnUrl": "RCLSGPmR", "settings": "BZWunHW7"}' \
    > test.out 2>&1
eval_tap $? 222 'UpdateAdyenConfig' test.out

#- 223 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'MYvr6QA7' \
    > test.out 2>&1
eval_tap $? 223 'TestAdyenConfigById' test.out

#- 224 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'Ppepc92H' \
    --body '{"appId": "A94eACde", "privateKey": "yfUpgiPp", "publicKey": "f8nxKJ3d", "returnUrl": "nmtPwa64"}' \
    > test.out 2>&1
eval_tap $? 224 'UpdateAliPayConfig' test.out

#- 225 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'Y4gPEKMh' \
    > test.out 2>&1
eval_tap $? 225 'TestAliPayConfigById' test.out

#- 226 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'hu9a6f3x' \
    --body '{"publicKey": "JNtUlKLl", "secretKey": "IIAeHbm5"}' \
    > test.out 2>&1
eval_tap $? 226 'UpdateCheckoutConfig' test.out

#- 227 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'M6LsY1VM' \
    > test.out 2>&1
eval_tap $? 227 'TestCheckoutConfigById' test.out

#- 228 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'uIEcRls6' \
    --body '{"clientID": "8M3MPMRP", "clientSecret": "BepyyMz6", "returnUrl": "zfR1pvTY", "webHookId": "YtDOiEi4"}' \
    > test.out 2>&1
eval_tap $? 228 'UpdatePayPalConfig' test.out

#- 229 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'RuEcHCSG' \
    > test.out 2>&1
eval_tap $? 229 'TestPayPalConfigById' test.out

#- 230 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'hpOZQFlw' \
    --body '{"allowedPaymentMethodTypes": ["OiuKGDFg"], "publishableKey": "K49YuKnX", "secretKey": "ks0m8ANr", "webhookSecret": "cRal7ta3"}' \
    > test.out 2>&1
eval_tap $? 230 'UpdateStripeConfig' test.out

#- 231 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'fojA3h4M' \
    > test.out 2>&1
eval_tap $? 231 'TestStripeConfigById' test.out

#- 232 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'MW3AJ5zl' \
    --body '{"appId": "sFBwjvLY", "key": "vmg6avud", "mchid": "QFF1CPNY", "returnUrl": "9u2dVYdg"}' \
    > test.out 2>&1
eval_tap $? 232 'UpdateWxPayConfig' test.out

#- 233 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'lOOoCeK0' \
    > test.out 2>&1
eval_tap $? 233 'UpdateWxPayConfigCert' test.out

#- 234 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'kPKmBqVu' \
    > test.out 2>&1
eval_tap $? 234 'TestWxPayConfigById' test.out

#- 235 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'x3lXcD8a' \
    --body '{"apiKey": "ertAVCqs", "flowCompletionUrl": "8XT8xy3n", "merchantId": 71, "projectId": 73, "projectSecretKey": "kseA0ARj"}' \
    > test.out 2>&1
eval_tap $? 235 'UpdateXsollaConfig' test.out

#- 236 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id '9ricfayv' \
    > test.out 2>&1
eval_tap $? 236 'TestXsollaConfigById' test.out

#- 237 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'nhi8MDdY' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "LARGE", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 237 'UpdateXsollaUIConfig' test.out

#- 238 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    > test.out 2>&1
eval_tap $? 238 'QueryPaymentProviderConfig' test.out

#- 239 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "Qp5egdmV", "region": "E8ImivNt", "sandboxTaxJarApiToken": "QxqWRKHo", "specials": ["XSOLLA"], "taxJarApiToken": "ODoWOr98", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 239 'CreatePaymentProviderConfig' test.out

#- 240 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 240 'GetAggregatePaymentProviders' test.out

#- 241 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    > test.out 2>&1
eval_tap $? 241 'DebugMatchedPaymentProviderConfig' test.out

#- 242 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 242 'GetSpecialPaymentProviders' test.out

#- 243 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'BUas9jjz' \
    --body '{"aggregate": "ADYEN", "namespace": "rgiaGrcB", "region": "7dIOVKIP", "sandboxTaxJarApiToken": "SJJHo5W8", "specials": ["CHECKOUT"], "taxJarApiToken": "KH8ou9Sd", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 243 'UpdatePaymentProviderConfig' test.out

#- 244 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'SXcrEFCw' \
    > test.out 2>&1
eval_tap $? 244 'DeletePaymentProviderConfig' test.out

#- 245 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 245 'GetPaymentTaxConfig' test.out

#- 246 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "qeGNLdIB", "taxJarApiToken": "RdliFQVM", "taxJarEnabled": true, "taxJarProductCodesMapping": {"zVUWlUWD": "s2x1EQU0"}}' \
    > test.out 2>&1
eval_tap $? 246 'UpdatePaymentTaxConfig' test.out

#- 247 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --end 'oepEvcja' \
    --start 'SgEh6jJn' \
    > test.out 2>&1
eval_tap $? 247 'SyncPaymentOrders' test.out

#- 248 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 248 'PublicGetRootCategories' test.out

#- 249 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 249 'DownloadCategories' test.out

#- 250 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'FxinIHJ1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 250 'PublicGetCategory' test.out

#- 251 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'o7aq5Zzn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 251 'PublicGetChildCategories' test.out

#- 252 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'd5eacobT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 252 'PublicGetDescendantCategories' test.out

#- 253 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 253 'PublicListCurrencies' test.out

#- 254 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'suRlhreQ' \
    > test.out 2>&1
eval_tap $? 254 'PublicGetItemByAppId' test.out

#- 255 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 255 'PublicQueryItems' test.out

#- 256 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --sku 'VFID3o8h' \
    > test.out 2>&1
eval_tap $? 256 'PublicGetItemBySku' test.out

#- 257 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --itemIds 'JWVjKIOA' \
    > test.out 2>&1
eval_tap $? 257 'PublicBulkGetItems' test.out

#- 258 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --keyword 'w70DvAHh' \
    --language 'SGWUvzq1' \
    > test.out 2>&1
eval_tap $? 258 'PublicSearchItems' test.out

#- 259 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'Za3IBC4v' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 259 'PublicGetApp' test.out

#- 260 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'QFsUJPfi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 260 'PublicGetItemDynamicData' test.out

#- 261 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'aJp1rt7O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 261 'PublicGetItem' test.out

#- 262 GetPaymentCustomization
eval_tap 0 262 'GetPaymentCustomization # SKIP deprecated' test.out

#- 263 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "BgBCe6N0", "paymentProvider": "XSOLLA", "returnUrl": "I65Mn5tn", "ui": "gEYXgPVT", "zipCode": "5CqXDZBV"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetPaymentUrl' test.out

#- 264 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'MJyJeKFO' \
    > test.out 2>&1
eval_tap $? 264 'PublicGetPaymentMethods' test.out

#- 265 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '92YDtaZv' \
    > test.out 2>&1
eval_tap $? 265 'PublicGetUnpaidPaymentOrder' test.out

#- 266 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'JoKS0Oxy' \
    --body '{"token": "ipZuO4N9"}' \
    > test.out 2>&1
eval_tap $? 266 'Pay' test.out

#- 267 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'S2YCgHa6' \
    > test.out 2>&1
eval_tap $? 267 'PublicCheckPaymentOrderPaidStatus' test.out

#- 268 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --paymentProvider 'WXPAY' \
    --region 'cvGRYk5r' \
    > test.out 2>&1
eval_tap $? 268 'GetPaymentPublicConfig' test.out

#- 269 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'UtWHCnhm' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetQRCode' test.out

#- 270 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'zzppV7tK' \
    --paymentOrderNo 'NKYUQVBX' \
    --paymentProvider 'WXPAY' \
    --returnUrl 'mWcNlHaF' \
    > test.out 2>&1
eval_tap $? 270 'PublicNormalizePaymentReturnUrl' test.out

#- 271 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'xYaGHUpm' \
    --paymentProvider 'WXPAY' \
    > test.out 2>&1
eval_tap $? 271 'GetPaymentTaxValue' test.out

#- 272 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'FyOrFKtx' \
    > test.out 2>&1
eval_tap $? 272 'GetRewardByCode' test.out

#- 273 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 273 'QueryRewards1' test.out

#- 274 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'GNAi0fq4' \
    > test.out 2>&1
eval_tap $? 274 'GetReward1' test.out

#- 275 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 275 'PublicListStores' test.out

#- 276 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 276 'PublicExistsAnyMyActiveEntitlement' test.out

#- 277 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'xChPLd2l' \
    > test.out 2>&1
eval_tap $? 277 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 278 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --itemId 'Oopc7XoV' \
    > test.out 2>&1
eval_tap $? 278 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 279 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --sku 'pdd6rCpy' \
    > test.out 2>&1
eval_tap $? 279 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 280 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 280 'PublicGetEntitlementOwnershipToken' test.out

#- 281 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'MrnH9YHX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 281 'PublicGetMyWallet' test.out

#- 282 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'h7KnCVOK' \
    --body '{"serviceLabel": 51}' \
    > test.out 2>&1
eval_tap $? 282 'PublicSyncPsnDlcInventory' test.out

#- 283 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'sBRGtd8Q' \
    --body '{"appId": "Y2OLbijr", "steamId": "vfr8hknj"}' \
    > test.out 2>&1
eval_tap $? 283 'SyncSteamDLC' test.out

#- 284 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'WUWdMUXH' \
    --body '{"xstsToken": "vw4pNlGL"}' \
    > test.out 2>&1
eval_tap $? 284 'SyncXboxDLC' test.out

#- 285 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'jdBxLM07' \
    > test.out 2>&1
eval_tap $? 285 'PublicQueryUserEntitlements' test.out

#- 286 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '9pDAbTgm' \
    --appId 'sEYEq2Gk' \
    > test.out 2>&1
eval_tap $? 286 'PublicGetUserAppEntitlementByAppId' test.out

#- 287 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'YK1vYm9f' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 287 'PublicQueryUserEntitlementsByAppType' test.out

#- 288 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'XQ7CQoem' \
    --itemId 'nQG0dH0N' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetUserEntitlementByItemId' test.out

#- 289 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'VM9VEHTP' \
    --sku 'qDhkcu5v' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetUserEntitlementBySku' test.out

#- 290 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'nz6GiNMb' \
    > test.out 2>&1
eval_tap $? 290 'PublicExistsAnyUserActiveEntitlement' test.out

#- 291 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'oBJHml0L' \
    --appId 'JmpPi4mq' \
    > test.out 2>&1
eval_tap $? 291 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 292 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'hruiCZLG' \
    --itemId 'GP5UXkHN' \
    > test.out 2>&1
eval_tap $? 292 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 293 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'TMapp5Sb' \
    --sku 'onsUJKAD' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 294 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'r60EkdFr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pLsGt9yT' \
    > test.out 2>&1
eval_tap $? 294 'PublicGetUserEntitlement' test.out

#- 295 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'XWUSCQcM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sHN7reI2' \
    --body '{"useCount": 21}' \
    > test.out 2>&1
eval_tap $? 295 'PublicConsumeUserEntitlement' test.out

#- 296 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 's7I12tAZ' \
    --body '{"code": "c8sxxLx9", "language": "EQnw", "region": "NJbYH5J4"}' \
    > test.out 2>&1
eval_tap $? 296 'PublicRedeemCode' test.out

#- 297 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'WiJLv9Nv' \
    --body '{"excludeOldTransactions": true, "language": "WmJ-339", "productId": "WZeUKJJN", "receiptData": "ftRpGgk1", "region": "iseREzzR", "transactionId": "G6z9wmuH"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicFulfillAppleIAPItem' test.out

#- 298 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ddyOdibI' \
    --body '{"epicGamesJwtToken": "1LVyqbdY"}' \
    > test.out 2>&1
eval_tap $? 298 'SyncEpicGamesInventory' test.out

#- 299 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '8DGZKAuo' \
    --body '{"autoAck": true, "language": "PZlw-sMmM", "orderId": "G0FoQP8q", "packageName": "7aSsb85g", "productId": "Ah9RD3Zz", "purchaseTime": 78, "purchaseToken": "6N1iJ8lt", "region": "t9IRqCfl"}' \
    > test.out 2>&1
eval_tap $? 299 'PublicFulfillGoogleIAPItem' test.out

#- 300 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'gln6r5f0' \
    --body '{"currencyCode": "s5H6lCf3", "price": 0.6656623819884346, "productId": "a11hLLCg", "serviceLabel": 45}' \
    > test.out 2>&1
eval_tap $? 300 'PublicReconcilePlayStationStore' test.out

#- 301 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '5av4LExd' \
    --body '{"appId": "abD8g2cv", "language": "FmrU-240", "region": "HUJ0GCmf", "stadiaPlayerId": "lIXkgJ6z"}' \
    > test.out 2>&1
eval_tap $? 301 'SyncStadiaEntitlement' test.out

#- 302 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'kTwoakq7' \
    --body '{"appId": "sEejFZ1N", "currencyCode": "tONXb9w9", "language": "Sq-FRLZ", "price": 0.6565137658214307, "productId": "d58dZP5R", "region": "vrinNtvB", "steamId": "tqFSkA68"}' \
    > test.out 2>&1
eval_tap $? 302 'SyncSteamInventory' test.out

#- 303 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'mIVYJ5pS' \
    --body '{"gameId": "VxBsLhty", "language": "EC_133", "region": "wNC4FY69"}' \
    > test.out 2>&1
eval_tap $? 303 'SyncTwitchDropsEntitlement' test.out

#- 304 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'mM87joJN' \
    --body '{"currencyCode": "OGB83Ns6", "price": 0.5299632339050114, "productId": "5Poab6lK", "xstsToken": "oVqNBUzI"}' \
    > test.out 2>&1
eval_tap $? 304 'SyncXboxInventory' test.out

#- 305 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'xOfglquS' \
    > test.out 2>&1
eval_tap $? 305 'PublicQueryUserOrders' test.out

#- 306 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '2q2DoWr9' \
    --body '{"currencyCode": "zvFtKa2m", "discountedPrice": 80, "ext": {"AqOokV1p": {}}, "itemId": "lxQ2YriT", "language": "FIPd", "price": 17, "quantity": 21, "region": "rtLnh2U1", "returnUrl": "RQlMxkfN"}' \
    > test.out 2>&1
eval_tap $? 306 'PublicCreateUserOrder' test.out

#- 307 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'MPNtqv2T' \
    --userId 'Mz1b7Snz' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUserOrder' test.out

#- 308 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'kXOek83I' \
    --userId 'gm1wkSWs' \
    > test.out 2>&1
eval_tap $? 308 'PublicCancelUserOrder' test.out

#- 309 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'YvAsu18o' \
    --userId 'bUdc8mbv' \
    > test.out 2>&1
eval_tap $? 309 'PublicGetUserOrderHistories' test.out

#- 310 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'XcwcgMqO' \
    --userId 'XMziXrVd' \
    > test.out 2>&1
eval_tap $? 310 'PublicDownloadUserOrderReceipt' test.out

#- 311 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'sEc3ClFP' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetPaymentAccounts' test.out

#- 312 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id '3mJwusCB' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId '4kLcuqL4' \
    > test.out 2>&1
eval_tap $? 312 'PublicDeletePaymentAccount' test.out

#- 313 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '0NYgekRa' \
    > test.out 2>&1
eval_tap $? 313 'PublicQueryUserSubscriptions' test.out

#- 314 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'vpaGTA9B' \
    --body '{"currencyCode": "TyCCyN4F", "itemId": "w9i6mI2W", "language": "JJc-HeyZ-597", "region": "PAXQBNMP", "returnUrl": "7j3xfPao", "source": "ZaWFspkU"}' \
    > test.out 2>&1
eval_tap $? 314 'PublicSubscribeSubscription' test.out

#- 315 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '5kn6PlPq' \
    --itemId 'D4AgfasB' \
    > test.out 2>&1
eval_tap $? 315 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 316 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'fclBhZjZ' \
    --userId 'bLnmghKw' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetUserSubscription' test.out

#- 317 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'PyVIn3qa' \
    --userId 'HP7KNuly' \
    > test.out 2>&1
eval_tap $? 317 'PublicChangeSubscriptionBillingAccount' test.out

#- 318 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'frENVQkp' \
    --userId 'caWHf6T2' \
    --body '{"immediate": true, "reason": "OOljn7c6"}' \
    > test.out 2>&1
eval_tap $? 318 'PublicCancelSubscription' test.out

#- 319 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'c9efJI02' \
    --userId 'TZxrgLBF' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetUserSubscriptionBillingHistories' test.out

#- 320 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'JEkphFz0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'h6WpoVpV' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetWallet' test.out

#- 321 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'c2HBBmj6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cEi02hXl' \
    > test.out 2>&1
eval_tap $? 321 'PublicListUserWalletTransactions' test.out


rm -f "tmp.dat"

exit $EXIT_CODE