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
echo "1..330"

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
    --body '{"appId": "OUfCt8UJ", "publisherAuthenticationKey": "C5flNyj6"}' \
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
    --body '{"clientId": "HsTtX8P3", "clientSecret": "llnaaS9l", "organizationId": "qyygPcfk"}' \
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
    --body '{"relyingPartyCert": "JIxfQZza"}' \
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
    --storeId '8kNVbDxV' \
    --body '{"categoryPath": "Mq7HJk0F", "targetItemId": "89xAc3YV", "targetNamespace": "faENtrl0"}' \
    > test.out 2>&1
eval_tap $? 74 'SyncInGameItem' test.out

#- 75 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pTKZTXqz' \
    --body '{"appId": "HuBMYQSA", "appType": "SOFTWARE", "baseAppId": "z1ZOpdOj", "boothName": "SyMddB41", "categoryPath": "JuMf7RUy", "clazz": "BHRj8IiR", "displayOrder": 17, "entitlementType": "DURABLE", "ext": {"RllHT6Dc": {}}, "features": ["40vFFA6g"], "images": [{"as": "pU7EW3x1", "caption": "dCpm55gO", "height": 8, "imageUrl": "qQIqcJVK", "smallImageUrl": "mBM1J1Ib", "width": 40}], "itemIds": ["TrrkbmuT"], "itemQty": {"1whOqmEn": 59}, "itemType": "CODE", "listable": true, "localizations": {"PlSay46m": {"description": "v71BAZAO", "localExt": {"jtFJ2vmT": {}}, "longDescription": "j7tT7TZH", "title": "WDdCkIsZ"}}, "maxCount": 29, "maxCountPerUser": 52, "name": "rWwPHcyF", "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 52, "fixedTrialCycles": 38, "graceDays": 100}, "regionData": {"ciLIgRwF": [{"currencyCode": "Rr0gwB9t", "currencyNamespace": "z3vp99XV", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1979-10-18T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1986-04-13T00:00:00Z", "discountedPrice": 36, "expireAt": "1977-03-05T00:00:00Z", "price": 30, "purchaseAt": "1997-05-29T00:00:00Z", "trialPrice": 44}]}, "seasonType": "PASS", "sku": "Ud9pqtv6", "stackable": false, "status": "INACTIVE", "tags": ["cCVOXcVa"], "targetCurrencyCode": "80TmCwtD", "targetNamespace": "2lAH01o6", "thumbnailUrl": "NdcBIgzr", "useCount": 58}' \
    > test.out 2>&1
eval_tap $? 75 'CreateItem' test.out

#- 76 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'yWpFBYGm' \
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
    --sku 'mBawMyoK' \
    > test.out 2>&1
eval_tap $? 79 'GetItemBySku' test.out

#- 80 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --sku 'yNpdAasm' \
    > test.out 2>&1
eval_tap $? 80 'GetLocaleItemBySku' test.out

#- 81 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --sku '8xwUfzOl' \
    > test.out 2>&1
eval_tap $? 81 'GetItemIdBySku' test.out

#- 82 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'GetBulkItemIdBySkus' test.out

#- 83 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --itemIds 'QiZY4NbO' \
    > test.out 2>&1
eval_tap $? 83 'BulkGetLocaleItems' test.out

#- 84 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --keyword 'QXJ7uOTz' \
    --language 'NMvuq2tN' \
    > test.out 2>&1
eval_tap $? 84 'SearchItems' test.out

#- 85 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'QueryUncategorizedItems' test.out

#- 86 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'l4CX4Iji' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 86 'GetItem' test.out

#- 87 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'K4DEUJRV' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'K3l9Eb0R' \
    --body '{"appId": "1XRb0RH8", "appType": "DLC", "baseAppId": "S1smeOln", "boothName": "grdTXCza", "categoryPath": "PBtkZMio", "clazz": "4wcyhloV", "displayOrder": 88, "entitlementType": "CONSUMABLE", "ext": {"Yp8QtcEm": {}}, "features": ["CEVc75Uf"], "images": [{"as": "eypWjDNh", "caption": "zCL5sWS2", "height": 32, "imageUrl": "wO763iEk", "smallImageUrl": "lkzLm88L", "width": 31}], "itemIds": ["LuYRO3C5"], "itemQty": {"5yHpwK2J": 1}, "itemType": "CODE", "listable": false, "localizations": {"nDGn7a2N": {"description": "UplWiLjq", "localExt": {"06n6a0rW": {}}, "longDescription": "8EfkpaXt", "title": "wYZJaQ4W"}}, "maxCount": 3, "maxCountPerUser": 44, "name": "NmsFYetj", "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 35, "fixedTrialCycles": 66, "graceDays": 8}, "regionData": {"loJzNKtR": [{"currencyCode": "UaTz1ETd", "currencyNamespace": "smwzjkkn", "currencyType": "REAL", "discountAmount": 17, "discountExpireAt": "1992-03-28T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1972-11-19T00:00:00Z", "discountedPrice": 76, "expireAt": "1971-11-20T00:00:00Z", "price": 18, "purchaseAt": "1976-04-27T00:00:00Z", "trialPrice": 59}]}, "seasonType": "PASS", "sku": "P2qMrTQ1", "stackable": false, "status": "ACTIVE", "tags": ["fU6wJhy1"], "targetCurrencyCode": "jOVkkUlS", "targetNamespace": "79527EZ2", "thumbnailUrl": "5Ia8uCeZ", "useCount": 62}' \
    > test.out 2>&1
eval_tap $? 87 'UpdateItem' test.out

#- 88 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'lLtEVpDA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'DeleteItem' test.out

#- 89 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'EbA82jy7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 23, "orderNo": "q0pDE5xR"}' \
    > test.out 2>&1
eval_tap $? 89 'AcquireItem' test.out

#- 90 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'wh5b45eb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'GetApp' test.out

#- 91 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'pcM7ScSs' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3UOpAwIp' \
    --body '{"carousel": [{"alt": "9rRtn1Pc", "previewUrl": "CxdbumeY", "thumbnailUrl": "gOdEBWRQ", "type": "image", "url": "W3KFfU8i", "videoSource": "generic"}], "developer": "H4081gRB", "forumUrl": "1GyLfLg4", "genres": ["Strategy"], "localizations": {"YuEbgUDE": {"announcement": "cJyIvsPw", "slogan": "Or0BmV5i"}}, "platformRequirements": {"FvfwFjTS": [{"additionals": "mIEqoLyL", "directXVersion": "eUGmomGX", "diskSpace": "9sXTZ0v8", "graphics": "pqLfc5Sw", "label": "GnReUULD", "osVersion": "X4QUIbb5", "processor": "nh68ZnyU", "ram": "tRvW9hNB", "soundCard": "SFTtFrOm"}]}, "platforms": ["MacOS"], "players": ["Multi"], "primaryGenre": "RPG", "publisher": "rFVA8t0x", "releaseDate": "1986-05-03T00:00:00Z", "websiteUrl": "t6ZlTTic"}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateApp' test.out

#- 92 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId '0kr2a0nI' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2oo7UHCJ' \
    > test.out 2>&1
eval_tap $? 92 'DisableItem' test.out

#- 93 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'K5sp0aCv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'GetItemDynamicData' test.out

#- 94 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'Iq3aHVYI' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lewLRuHY' \
    > test.out 2>&1
eval_tap $? 94 'EnableItem' test.out

#- 95 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature '83bGj0HT' \
    --itemId 'eeWXlIcR' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'idqctDpy' \
    > test.out 2>&1
eval_tap $? 95 'FeatureItem' test.out

#- 96 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'gY0ax476' \
    --itemId 'ED4MMO9T' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'w2JH0qhW' \
    > test.out 2>&1
eval_tap $? 96 'DefeatureItem' test.out

#- 97 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'IwHWTgzJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 97 'GetLocaleItem' test.out

#- 98 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'FRYw6t1I' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "KZLO6V4O"}' \
    > test.out 2>&1
eval_tap $? 98 'ReturnItem' test.out

#- 99 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 99 'QueryKeyGroups' test.out

#- 100 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "de46QmCi", "name": "dgdpP7RT", "status": "INACTIVE", "tags": ["587lmUmB"]}' \
    > test.out 2>&1
eval_tap $? 100 'CreateKeyGroup' test.out

#- 101 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'ziPZBnpO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 101 'GetKeyGroup' test.out

#- 102 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'fkllxfq0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "NsrSjw5H", "name": "og0blM1d", "status": "INACTIVE", "tags": ["YGczLINl"]}' \
    > test.out 2>&1
eval_tap $? 102 'UpdateKeyGroup' test.out

#- 103 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'EC0OEsE3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetKeyGroupDynamic' test.out

#- 104 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'yzIsUP0N' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'ListKeys' test.out

#- 105 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'jluOrGZT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 105 'UploadKeys' test.out

#- 106 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 106 'QueryOrders' test.out

#- 107 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 107 'GetOrderStatistics' test.out

#- 108 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'zsLW7Fjf' \
    > test.out 2>&1
eval_tap $? 108 'GetOrder' test.out

#- 109 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 's9nIkcZ3' \
    --body '{"description": "8fUEanjK"}' \
    > test.out 2>&1
eval_tap $? 109 'RefundOrder' test.out

#- 110 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 110 'GetPaymentCallbackConfig' test.out

#- 111 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": false, "notifyUrl": "Xfk1zxdz", "privateKey": "xg0UXcRy"}' \
    > test.out 2>&1
eval_tap $? 111 'UpdatePaymentCallbackConfig' test.out

#- 112 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'QueryPaymentNotifications' test.out

#- 113 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'QueryPaymentOrders' test.out

#- 114 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "Hi3u8BzV", "currencyNamespace": "Wu1tOmhU", "customParameters": {"tCgcpvGr": {}}, "description": "EbcZUDEx", "extOrderNo": "H1tayOGX", "extUserId": "IHzMRjMC", "itemType": "CODE", "language": "jSeI", "metadata": {"rbpyyEcQ": "xVgJIjMZ"}, "notifyUrl": "qcWfMl6d", "omitNotification": true, "platform": "rpD4tnc3", "price": 86, "recurringPaymentOrderNo": "B3IkdtPf", "region": "AJEomwen", "returnUrl": "JvQ8grtQ", "sandbox": true, "sku": "6EcALcMI", "subscriptionId": "Pms5bT51", "targetNamespace": "M4yko8S0", "targetUserId": "EnGLvGvf", "title": "uSyCTyjj"}' \
    > test.out 2>&1
eval_tap $? 114 'CreatePaymentOrderByDedicated' test.out

#- 115 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId '4mCaiuMG' \
    > test.out 2>&1
eval_tap $? 115 'ListExtOrderNoByExtTxId' test.out

#- 116 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'KOF5GJJo' \
    > test.out 2>&1
eval_tap $? 116 'GetPaymentOrder' test.out

#- 117 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'oSXUl3YU' \
    --body '{"extTxId": "35QHGpBA", "paymentMethod": "BnOlxDzn", "paymentProvider": "PAYPAL"}' \
    > test.out 2>&1
eval_tap $? 117 'ChargePaymentOrder' test.out

#- 118 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'QVyqBg34' \
    --body '{"description": "WTtDkn0r"}' \
    > test.out 2>&1
eval_tap $? 118 'RefundPaymentOrderByDedicated' test.out

#- 119 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'tn6t0Yx4' \
    --body '{"amount": 50, "currencyCode": "12EaQ1rU", "notifyType": "REFUND", "paymentProvider": "ADYEN", "salesTax": 59, "vat": 98}' \
    > test.out 2>&1
eval_tap $? 119 'SimulatePaymentOrderNotification' test.out

#- 120 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '4jE3M2Is' \
    > test.out 2>&1
eval_tap $? 120 'GetPaymentOrderChargeStatus' test.out

#- 121 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 121 'GetPlatformWalletConfig' test.out

#- 122 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    --body '{"allowedBalanceOrigins": ["System"]}' \
    > test.out 2>&1
eval_tap $? 122 'UpdatePlatformWalletConfig' test.out

#- 123 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 123 'ResetPlatformWalletConfig' test.out

#- 124 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "OlXfIWd0", "eventTopic": "mcq5T4SU", "maxAwarded": 4, "maxAwardedPerUser": 5, "namespaceExpression": "WfCKK6Di", "rewardCode": "j1gFcenE", "rewardConditions": [{"condition": "MySPfhxB", "conditionName": "enDiTiAq", "eventName": "FYmFKjaE", "rewardItems": [{"duration": 75, "itemId": "mmll6oex", "quantity": 68}]}], "userIdExpression": "d1OKGUN2"}' \
    > test.out 2>&1
eval_tap $? 124 'CreateReward' test.out

#- 125 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 125 'QueryRewards' test.out

#- 126 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 126 'ExportRewards' test.out

#- 127 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting
    > test.out 2>&1
eval_tap $? 127 'ImportRewards' test.out

#- 128 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Uznd7uVa' \
    > test.out 2>&1
eval_tap $? 128 'GetReward' test.out

#- 129 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '7t14yvSY' \
    --body '{"description": "SV52bHif", "eventTopic": "CIf4tsuu", "maxAwarded": 82, "maxAwardedPerUser": 20, "namespaceExpression": "am6tFSYF", "rewardCode": "t4ZxA2Pz", "rewardConditions": [{"condition": "ZFRkBNlg", "conditionName": "6hn5qusK", "eventName": "yZAuV6uU", "rewardItems": [{"duration": 42, "itemId": "qM0lV6UZ", "quantity": 77}]}], "userIdExpression": "lEbxHNgJ"}' \
    > test.out 2>&1
eval_tap $? 129 'UpdateReward' test.out

#- 130 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'RiQExaun' \
    > test.out 2>&1
eval_tap $? 130 'DeleteReward' test.out

#- 131 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'jdAqnHUz' \
    --body '{"payload": {"44tx4O6h": {}}}' \
    > test.out 2>&1
eval_tap $? 131 'CheckEventCondition' test.out

#- 132 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 132 'ListStores' test.out

#- 133 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "amPwNoi0", "defaultRegion": "71ezDK56", "description": "JFIGe1IM", "supportedLanguages": ["UCLcN0Ds"], "supportedRegions": ["aD5FyBsF"], "title": "e9OYEJVs"}' \
    > test.out 2>&1
eval_tap $? 133 'CreateStore' test.out

#- 134 ImportStore
./ng net.accelbyte.sdk.cli.Main platform importStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 134 'ImportStore' test.out

#- 135 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'GetPublishedStore' test.out

#- 136 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'DeletePublishedStore' test.out

#- 137 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 137 'GetPublishedStoreBackup' test.out

#- 138 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'RollbackPublishedStore' test.out

#- 139 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Yffmhyx6' \
    > test.out 2>&1
eval_tap $? 139 'GetStore' test.out

#- 140 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J25PrM4S' \
    --body '{"defaultLanguage": "3cB8m17h", "defaultRegion": "EeLLgoaY", "description": "th6zcf8e", "supportedLanguages": ["A45OMvOb"], "supportedRegions": ["Wejo9LfG"], "title": "eegJMaBG"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateStore' test.out

#- 141 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'R6D1ZoZE' \
    > test.out 2>&1
eval_tap $? 141 'DeleteStore' test.out

#- 142 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZQkJ8DSq' \
    > test.out 2>&1
eval_tap $? 142 'QueryChanges' test.out

#- 143 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FnhdKvjF' \
    > test.out 2>&1
eval_tap $? 143 'PublishAll' test.out

#- 144 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CFbSFlEW' \
    > test.out 2>&1
eval_tap $? 144 'CloneStore' test.out

#- 145 ExportStore
./ng net.accelbyte.sdk.cli.Main platform exportStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oMPdgK5z' \
    > test.out 2>&1
eval_tap $? 145 'ExportStore' test.out

#- 146 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 146 'QuerySubscriptions' test.out

#- 147 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'n62mhnFS' \
    > test.out 2>&1
eval_tap $? 147 'RecurringChargeSubscription' test.out

#- 148 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'pCTlDNBO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 148 'GetTicketDynamic' test.out

#- 149 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'cygvv2LA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "gfBGVzan"}' \
    > test.out 2>&1
eval_tap $? 149 'DecreaseTicketSale' test.out

#- 150 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'bKYsB0gq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 150 'GetTicketBoothID' test.out

#- 151 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'J8VhYSik' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 71, "orderNo": "l2p9rBx8"}' \
    > test.out 2>&1
eval_tap $? 151 'IncreaseTicketSale' test.out

#- 152 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'N5egapqx' \
    > test.out 2>&1
eval_tap $? 152 'AnonymizeCampaign' test.out

#- 153 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dy4cLfNj' \
    > test.out 2>&1
eval_tap $? 153 'AnonymizeEntitlement' test.out

#- 154 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'zzEZYA8j' \
    > test.out 2>&1
eval_tap $? 154 'AnonymizeFulfillment' test.out

#- 155 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'IkMJb7cZ' \
    > test.out 2>&1
eval_tap $? 155 'AnonymizeIntegration' test.out

#- 156 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '2bPsaLLp' \
    > test.out 2>&1
eval_tap $? 156 'AnonymizeOrder' test.out

#- 157 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'EBVEMk5A' \
    > test.out 2>&1
eval_tap $? 157 'AnonymizePayment' test.out

#- 158 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'sKaF2P44' \
    > test.out 2>&1
eval_tap $? 158 'AnonymizeSubscription' test.out

#- 159 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'lXkI3zdi' \
    > test.out 2>&1
eval_tap $? 159 'AnonymizeWallet' test.out

#- 160 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'RiC5IbPi' \
    > test.out 2>&1
eval_tap $? 160 'QueryUserEntitlements' test.out

#- 161 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 't71JWlYC' \
    --body '[{"endDate": "1978-03-05T00:00:00Z", "grantedCode": "4nDfPu5V", "itemId": "6QSYxEVO", "itemNamespace": "ryVuZYmg", "language": "Eepb_KzTH", "quantity": 18, "region": "0EBA4azR", "source": "REWARD", "startDate": "1997-01-25T00:00:00Z", "storeId": "56smobor"}]' \
    > test.out 2>&1
eval_tap $? 161 'GrantUserEntitlement' test.out

#- 162 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '4p1PlgQB' \
    --appId '9EcNGOeB' \
    > test.out 2>&1
eval_tap $? 162 'GetUserAppEntitlementByAppId' test.out

#- 163 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'RY6G5ae0' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 163 'QueryUserEntitlementsByAppType' test.out

#- 164 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'eDLaZ8JC' \
    --itemId 'vbeTfW0h' \
    > test.out 2>&1
eval_tap $? 164 'GetUserEntitlementByItemId' test.out

#- 165 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'gzrabLJx' \
    --sku 'EwJrEBmQ' \
    > test.out 2>&1
eval_tap $? 165 'GetUserEntitlementBySku' test.out

#- 166 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '64haNOzl' \
    > test.out 2>&1
eval_tap $? 166 'ExistsAnyUserActiveEntitlement' test.out

#- 167 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gu68UYyu' \
    --itemIds '["pjdDetno"]' \
    > test.out 2>&1
eval_tap $? 167 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 168 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'T0rfWtVP' \
    --appId 'wQfq6V92' \
    > test.out 2>&1
eval_tap $? 168 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 169 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'gbfPouNd' \
    --itemId 'mP7fckVn' \
    > test.out 2>&1
eval_tap $? 169 'GetUserEntitlementOwnershipByItemId' test.out

#- 170 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'uDGvYIb1' \
    --sku 'p5tcR5z8' \
    > test.out 2>&1
eval_tap $? 170 'GetUserEntitlementOwnershipBySku' test.out

#- 171 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZJLjSHca' \
    --entitlementIds 'R3X4tZmw' \
    > test.out 2>&1
eval_tap $? 171 'RevokeUserEntitlements' test.out

#- 172 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'r0QmOnsE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'g49eXp0x' \
    > test.out 2>&1
eval_tap $? 172 'GetUserEntitlement' test.out

#- 173 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'QkZ2Jjuw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WWy0tU11' \
    --body '{"endDate": "1991-08-15T00:00:00Z", "nullFieldList": ["eSrvejUK"], "startDate": "1982-02-11T00:00:00Z", "status": "REVOKED", "useCount": 94}' \
    > test.out 2>&1
eval_tap $? 173 'UpdateUserEntitlement' test.out

#- 174 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'r7mkDzFB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'I1VwhkVS' \
    --body '{"useCount": 73}' \
    > test.out 2>&1
eval_tap $? 174 'ConsumeUserEntitlement' test.out

#- 175 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'DlNFOUHB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JsvTsqk9' \
    > test.out 2>&1
eval_tap $? 175 'DisableUserEntitlement' test.out

#- 176 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'hg4hj6nU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'debW6Usk' \
    > test.out 2>&1
eval_tap $? 176 'EnableUserEntitlement' test.out

#- 177 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'bPkkZAk0' \
    --namespace "$AB_NAMESPACE" \
    --userId '1f1KxCtW' \
    > test.out 2>&1
eval_tap $? 177 'GetUserEntitlementHistories' test.out

#- 178 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'ADU2guN6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'U9w13W1K' \
    > test.out 2>&1
eval_tap $? 178 'RevokeUserEntitlement' test.out

#- 179 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '9TZQ4qRL' \
    --body '{"duration": 60, "endDate": "1975-07-03T00:00:00Z", "itemId": "owE36rfm", "itemSku": "M0CCs35T", "language": "PUPLmsY8", "order": {"currency": {"currencyCode": "WgwSx1DI", "currencySymbol": "5GH9bv9Z", "currencyType": "REAL", "decimals": 66, "namespace": "pA6pzjHp"}, "ext": {"ZO0E9iLg": {}}, "free": false}, "orderNo": "Bae3GOgb", "origin": "Other", "quantity": 34, "region": "qra0Ptkf", "source": "REDEEM_CODE", "startDate": "1991-04-30T00:00:00Z", "storeId": "Y2ramp5l"}' \
    > test.out 2>&1
eval_tap $? 179 'FulfillItem' test.out

#- 180 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'nBn6xmBk' \
    --body '{"code": "fMtC66hF", "language": "Kpo", "region": "2XjlNEE5"}' \
    > test.out 2>&1
eval_tap $? 180 'RedeemCode' test.out

#- 181 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'ecPzAmi0' \
    --body '{"origin": "GooglePlay", "rewards": [{"currency": {"currencyCode": "SJHfPloP", "namespace": "1XkYK4Mg"}, "item": {"itemId": "IsDSFMPy", "itemSku": "Mhyw1OLZ", "itemType": "PVwwxH4B"}, "quantity": 69, "type": "CURRENCY"}], "source": "DLC"}' \
    > test.out 2>&1
eval_tap $? 181 'FulfillRewards' test.out

#- 182 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'uDoShMMf' \
    > test.out 2>&1
eval_tap $? 182 'QueryUserIAPOrders' test.out

#- 183 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'tll8N0Vv' \
    > test.out 2>&1
eval_tap $? 183 'QueryAllUserIAPOrders' test.out

#- 184 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ChHz9urm' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "wVeS-ywdt_088", "productId": "GT88prRE", "region": "BgYOWdHJ", "type": "STADIA"}' \
    > test.out 2>&1
eval_tap $? 184 'MockFulfillIAPItem' test.out

#- 185 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'mohtU13g' \
    > test.out 2>&1
eval_tap $? 185 'QueryUserOrders' test.out

#- 186 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'f7TRigNZ' \
    --body '{"currencyCode": "j5w5y3Hm", "discountedPrice": 73, "ext": {"8QVOa62e": {}}, "itemId": "QZtbLLcF", "language": "671WLtv3", "platform": "Xbox", "price": 4, "quantity": 4, "region": "zopFmeRw", "returnUrl": "pcJBZyi3", "sandbox": false}' \
    > test.out 2>&1
eval_tap $? 186 'AdminCreateUserOrder' test.out

#- 187 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'LC4Kzeki' \
    --itemId 'SzeyolnO' \
    > test.out 2>&1
eval_tap $? 187 'CountOfPurchasedItem' test.out

#- 188 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Qt0joVHg' \
    --userId 'CytC6lRG' \
    > test.out 2>&1
eval_tap $? 188 'GetUserOrder' test.out

#- 189 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo '98YxnHbR' \
    --userId 'doTKKeuS' \
    --body '{"status": "CHARGEBACK", "statusReason": "fZe9i1os"}' \
    > test.out 2>&1
eval_tap $? 189 'UpdateUserOrderStatus' test.out

#- 190 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ghF1hzi1' \
    --userId 'Nl47syJ5' \
    > test.out 2>&1
eval_tap $? 190 'FulfillUserOrder' test.out

#- 191 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ibzSHZeC' \
    --userId 'LIvWPVRs' \
    > test.out 2>&1
eval_tap $? 191 'GetUserOrderGrant' test.out

#- 192 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'dEqA61yT' \
    --userId 'rMgsycTg' \
    > test.out 2>&1
eval_tap $? 192 'GetUserOrderHistories' test.out

#- 193 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'mPzc20Eu' \
    --userId 'O5dMqGDl' \
    --body '{"additionalData": {"cardSummary": "SZPY07rE"}, "authorisedTime": "1994-12-14T00:00:00Z", "chargebackReversedTime": "1975-07-24T00:00:00Z", "chargebackTime": "1987-03-17T00:00:00Z", "chargedTime": "1989-01-05T00:00:00Z", "createdTime": "1995-03-13T00:00:00Z", "currency": {"currencyCode": "G6DSmpp3", "currencySymbol": "op8htaRL", "currencyType": "VIRTUAL", "decimals": 39, "namespace": "W4PvFkES"}, "customParameters": {"TULat5F1": {}}, "extOrderNo": "Le7cR7q6", "extTxId": "PWhZmmKz", "extUserId": "41i1Tp78", "issuedAt": "1986-03-07T00:00:00Z", "metadata": {"pJHahViJ": "vLYW0kdm"}, "namespace": "lk2luqSO", "nonceStr": "OA2VOZBo", "paymentMethod": "NbB98PuS", "paymentMethodFee": 65, "paymentOrderNo": "ykqFzPwS", "paymentProvider": "WALLET", "paymentProviderFee": 54, "paymentStationUrl": "uL38beOY", "price": 59, "refundedTime": "1994-06-07T00:00:00Z", "salesTax": 66, "sandbox": true, "sku": "6w23Wf8i", "status": "CHARGEBACK", "statusReason": "Qo72sH0a", "subscriptionId": "RdcDlDyG", "subtotalPrice": 4, "targetNamespace": "sfIuI4Dv", "targetUserId": "5lEJpK1A", "tax": 49, "totalPrice": 86, "totalTax": 22, "txEndTime": "1983-05-27T00:00:00Z", "type": "rRXEFZiv", "userId": "QOHG6wVi", "vat": 4}' \
    > test.out 2>&1
eval_tap $? 193 'ProcessUserOrderNotification' test.out

#- 194 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'NratsvvH' \
    --userId 'LmIohfNI' \
    > test.out 2>&1
eval_tap $? 194 'DownloadUserOrderReceipt' test.out

#- 195 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'SLXMDWDd' \
    --body '{"currencyCode": "m5FE4lli", "currencyNamespace": "QMnutJbp", "customParameters": {"Eo4mUNHF": {}}, "description": "tdml2xNv", "extOrderNo": "iWacJc3F", "extUserId": "m7Z548uu", "itemType": "COINS", "language": "cb-cBWc", "metadata": {"eq9ouEdD": "tjOgsypL"}, "notifyUrl": "km2ZYew5", "omitNotification": false, "platform": "0gnYyj6M", "price": 99, "recurringPaymentOrderNo": "f9G1ntye", "region": "bvoeHenA", "returnUrl": "ALKt7Efx", "sandbox": false, "sku": "UnP2S74u", "subscriptionId": "nXwg0JKq", "title": "VWW1rjK1"}' \
    > test.out 2>&1
eval_tap $? 195 'CreateUserPaymentOrder' test.out

#- 196 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'epwkAvcs' \
    --userId 'YvbgfBVP' \
    --body '{"description": "pTa8Yuq7"}' \
    > test.out 2>&1
eval_tap $? 196 'RefundUserPaymentOrder' test.out

#- 197 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'TKiNXmz7' \
    --body '{"code": "eMrMD5Tb", "orderNo": "aUxTCTng"}' \
    > test.out 2>&1
eval_tap $? 197 'ApplyUserRedemption' test.out

#- 198 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '0xjtdBrj' \
    > test.out 2>&1
eval_tap $? 198 'QueryUserSubscriptions' test.out

#- 199 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 's3Kiykt2' \
    > test.out 2>&1
eval_tap $? 199 'GetUserSubscriptionActivities' test.out

#- 200 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ck2gOlSa' \
    --body '{"grantDays": 38, "itemId": "ECZ2UgwQ", "language": "LqDqYSxT", "reason": "PuVlBqir", "region": "dp3yxnsE", "source": "Tl1SvhQu"}' \
    > test.out 2>&1
eval_tap $? 200 'PlatformSubscribeSubscription' test.out

#- 201 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'dsjIhXdx' \
    --itemId 'iSoWpnnx' \
    > test.out 2>&1
eval_tap $? 201 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 202 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'gX7BCPMq' \
    --userId 'zQIxibhp' \
    > test.out 2>&1
eval_tap $? 202 'GetUserSubscription' test.out

#- 203 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'NYsHtdB3' \
    --userId 'IkjuaZqh' \
    > test.out 2>&1
eval_tap $? 203 'DeleteUserSubscription' test.out

#- 204 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'JilrZkSS' \
    --userId 'KgP5rxCR' \
    --body '{"immediate": false, "reason": "5CA1GORS"}' \
    > test.out 2>&1
eval_tap $? 204 'CancelSubscription' test.out

#- 205 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'bL9n0dbW' \
    --userId 'DEupmdLQ' \
    --body '{"grantDays": 50, "reason": "PnNfBAcW"}' \
    > test.out 2>&1
eval_tap $? 205 'GrantDaysToSubscription' test.out

#- 206 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ArbkCfdH' \
    --userId 'IZb03otq' \
    > test.out 2>&1
eval_tap $? 206 'GetUserSubscriptionBillingHistories' test.out

#- 207 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'mBuS9V2p' \
    --userId 'CZ23UHmk' \
    --body '{"additionalData": {"cardSummary": "0lpJ4JLl"}, "authorisedTime": "1997-05-04T00:00:00Z", "chargebackReversedTime": "1975-10-25T00:00:00Z", "chargebackTime": "1998-04-23T00:00:00Z", "chargedTime": "1985-04-21T00:00:00Z", "createdTime": "1994-12-07T00:00:00Z", "currency": {"currencyCode": "Ub39j22P", "currencySymbol": "4Sp09cKm", "currencyType": "REAL", "decimals": 87, "namespace": "UbZVBVS7"}, "customParameters": {"OK2Zrdcs": {}}, "extOrderNo": "ckMekROW", "extTxId": "Z2KUTqkK", "extUserId": "2eFaGLoS", "issuedAt": "1977-09-04T00:00:00Z", "metadata": {"EPbLywJs": "yUie6fZg"}, "namespace": "LllUPsO8", "nonceStr": "lg46Si70", "paymentMethod": "06vL2w4a", "paymentMethodFee": 0, "paymentOrderNo": "jDAOx0iJ", "paymentProvider": "ADYEN", "paymentProviderFee": 100, "paymentStationUrl": "leaktqv2", "price": 96, "refundedTime": "1976-04-01T00:00:00Z", "salesTax": 18, "sandbox": true, "sku": "D5mnJONq", "status": "CHARGEBACK_REVERSED", "statusReason": "Gq8mB7mF", "subscriptionId": "2lMFcagh", "subtotalPrice": 63, "targetNamespace": "XJIJflRH", "targetUserId": "FcsIqCy4", "tax": 47, "totalPrice": 58, "totalTax": 16, "txEndTime": "1973-12-24T00:00:00Z", "type": "SQ5On2cc", "userId": "Ecl3xeiO", "vat": 2}' \
    > test.out 2>&1
eval_tap $? 207 'ProcessUserSubscriptionNotification' test.out

#- 208 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'wF5JOjGo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GxKM3qMc' \
    --body '{"count": 9, "orderNo": "5tfLcpjF"}' \
    > test.out 2>&1
eval_tap $? 208 'AcquireUserTicket' test.out

#- 209 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZMKCbp0p' \
    > test.out 2>&1
eval_tap $? 209 'QueryUserCurrencyWallets' test.out

#- 210 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'EbLCLFpH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xMYF8360' \
    > test.out 2>&1
eval_tap $? 210 'ListUserCurrencyTransactions' test.out

#- 211 CheckWallet
eval_tap 0 211 'CheckWallet # SKIP deprecated' test.out

#- 212 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode '75xEpzdn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ytpja5ig' \
    --body '{"amount": 16, "expireAt": "1980-12-06T00:00:00Z", "origin": "Xbox", "reason": "a6Vy76iz", "source": "OTHER"}' \
    > test.out 2>&1
eval_tap $? 212 'CreditUserWallet' test.out

#- 213 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'iQRjYa8f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v5fIt22t' \
    --body '{"amount": 69, "walletPlatform": "Xbox"}' \
    > test.out 2>&1
eval_tap $? 213 'PayWithUserWallet' test.out

#- 214 GetUserWallet
eval_tap 0 214 'GetUserWallet # SKIP deprecated' test.out

#- 215 DebitUserWallet
eval_tap 0 215 'DebitUserWallet # SKIP deprecated' test.out

#- 216 DisableUserWallet
eval_tap 0 216 'DisableUserWallet # SKIP deprecated' test.out

#- 217 EnableUserWallet
eval_tap 0 217 'EnableUserWallet # SKIP deprecated' test.out

#- 218 ListUserWalletTransactions
eval_tap 0 218 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 219 QueryWallets
eval_tap 0 219 'QueryWallets # SKIP deprecated' test.out

#- 220 GetWallet
eval_tap 0 220 'GetWallet # SKIP deprecated' test.out

#- 221 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --end 'jhgkigW2' \
    --start '2zXMWXfb' \
    > test.out 2>&1
eval_tap $? 221 'SyncOrders' test.out

#- 222 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --body '{"allowedPaymentMethods": ["cM0GIALI"], "apiKey": "bFCQgBcL", "authoriseAsCapture": false, "blockedPaymentMethods": ["OQVYx5rW"], "clientKey": "2gMsI1aY", "dropInSettings": "BitSn3UD", "liveEndpointUrlPrefix": "eKj97I4W", "merchantAccount": "YXLqjN7k", "notificationHmacKey": "tOBTraBx", "notificationPassword": "WRTVuYEq", "notificationUsername": "GlKDwTKX", "returnUrl": "BrXiQcd9", "settings": "IW8kiCKe"}' \
    > test.out 2>&1
eval_tap $? 222 'TestAdyenConfig' test.out

#- 223 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --body '{"appId": "QJWZBvcq", "privateKey": "1ETvWBxY", "publicKey": "ZJh7B8gb", "returnUrl": "nSu9M2Ox"}' \
    > test.out 2>&1
eval_tap $? 223 'TestAliPayConfig' test.out

#- 224 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --body '{"publicKey": "D2udaeYp", "secretKey": "CXYSMiy8"}' \
    > test.out 2>&1
eval_tap $? 224 'TestCheckoutConfig' test.out

#- 225 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    > test.out 2>&1
eval_tap $? 225 'DebugMatchedPaymentMerchantConfig' test.out

#- 226 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --body '{"clientID": "7CTqEQBg", "clientSecret": "36my3sY2", "returnUrl": "clrDcain", "webHookId": "0cOVF1zH"}' \
    > test.out 2>&1
eval_tap $? 226 'TestPayPalConfig' test.out

#- 227 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --body '{"allowedPaymentMethodTypes": ["wDTI0sJ1"], "publishableKey": "Q0kphMTg", "secretKey": "gSP2SLcu", "webhookSecret": "AP7vU971"}' \
    > test.out 2>&1
eval_tap $? 227 'TestStripeConfig' test.out

#- 228 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "Czw2nbg8", "key": "C7Mvywhu", "mchid": "6MjOjuGz", "returnUrl": "o1Fz4tU0"}' \
    > test.out 2>&1
eval_tap $? 228 'TestWxPayConfig' test.out

#- 229 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "aSn98N8q", "flowCompletionUrl": "OUA0z92R", "merchantId": 0, "projectId": 58, "projectSecretKey": "e8ngT8LR"}' \
    > test.out 2>&1
eval_tap $? 229 'TestXsollaConfig' test.out

#- 230 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'QkMnG1LZ' \
    > test.out 2>&1
eval_tap $? 230 'GetPaymentMerchantConfig' test.out

#- 231 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'yF2mdYY6' \
    --body '{"allowedPaymentMethods": ["ZMfuTYTK"], "apiKey": "sue48qBE", "authoriseAsCapture": true, "blockedPaymentMethods": ["NAV5BTe6"], "clientKey": "ec1zA92U", "dropInSettings": "RCLSGPmR", "liveEndpointUrlPrefix": "BZWunHW7", "merchantAccount": "MYvr6QA7", "notificationHmacKey": "Ppepc92H", "notificationPassword": "A94eACde", "notificationUsername": "yfUpgiPp", "returnUrl": "f8nxKJ3d", "settings": "nmtPwa64"}' \
    > test.out 2>&1
eval_tap $? 231 'UpdateAdyenConfig' test.out

#- 232 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'Y4gPEKMh' \
    > test.out 2>&1
eval_tap $? 232 'TestAdyenConfigById' test.out

#- 233 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'hu9a6f3x' \
    --body '{"appId": "JNtUlKLl", "privateKey": "IIAeHbm5", "publicKey": "M6LsY1VM", "returnUrl": "uIEcRls6"}' \
    > test.out 2>&1
eval_tap $? 233 'UpdateAliPayConfig' test.out

#- 234 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id '8M3MPMRP' \
    > test.out 2>&1
eval_tap $? 234 'TestAliPayConfigById' test.out

#- 235 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'BepyyMz6' \
    --body '{"publicKey": "zfR1pvTY", "secretKey": "YtDOiEi4"}' \
    > test.out 2>&1
eval_tap $? 235 'UpdateCheckoutConfig' test.out

#- 236 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'RuEcHCSG' \
    > test.out 2>&1
eval_tap $? 236 'TestCheckoutConfigById' test.out

#- 237 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'hpOZQFlw' \
    --body '{"clientID": "OiuKGDFg", "clientSecret": "K49YuKnX", "returnUrl": "ks0m8ANr", "webHookId": "cRal7ta3"}' \
    > test.out 2>&1
eval_tap $? 237 'UpdatePayPalConfig' test.out

#- 238 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'fojA3h4M' \
    > test.out 2>&1
eval_tap $? 238 'TestPayPalConfigById' test.out

#- 239 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'MW3AJ5zl' \
    --body '{"allowedPaymentMethodTypes": ["sFBwjvLY"], "publishableKey": "vmg6avud", "secretKey": "QFF1CPNY", "webhookSecret": "9u2dVYdg"}' \
    > test.out 2>&1
eval_tap $? 239 'UpdateStripeConfig' test.out

#- 240 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'lOOoCeK0' \
    > test.out 2>&1
eval_tap $? 240 'TestStripeConfigById' test.out

#- 241 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'kPKmBqVu' \
    --body '{"appId": "x3lXcD8a", "key": "ertAVCqs", "mchid": "8XT8xy3n", "returnUrl": "J06KkseA"}' \
    > test.out 2>&1
eval_tap $? 241 'UpdateWxPayConfig' test.out

#- 242 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id '0ARj9ric' \
    > test.out 2>&1
eval_tap $? 242 'UpdateWxPayConfigCert' test.out

#- 243 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'fayvnhi8' \
    > test.out 2>&1
eval_tap $? 243 'TestWxPayConfigById' test.out

#- 244 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'MDdY4WLH' \
    --body '{"apiKey": "oaUkYnQp", "flowCompletionUrl": "5egdmVE8", "merchantId": 68, "projectId": 24, "projectSecretKey": "ivNtQxqW"}' \
    > test.out 2>&1
eval_tap $? 244 'UpdateXsollaConfig' test.out

#- 245 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'RKHohODo' \
    > test.out 2>&1
eval_tap $? 245 'TestXsollaConfigById' test.out

#- 246 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'WOr98kjB' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "SMALL", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 246 'UpdateXsollaUIConfig' test.out

#- 247 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    > test.out 2>&1
eval_tap $? 247 'QueryPaymentProviderConfig' test.out

#- 248 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "2FrgiaGr", "region": "cB7dIOVK", "sandboxTaxJarApiToken": "IPSJJHo5", "specials": ["CHECKOUT"], "taxJarApiToken": "KH8ou9Sd", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 248 'CreatePaymentProviderConfig' test.out

#- 249 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 249 'GetAggregatePaymentProviders' test.out

#- 250 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    > test.out 2>&1
eval_tap $? 250 'DebugMatchedPaymentProviderConfig' test.out

#- 251 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 251 'GetSpecialPaymentProviders' test.out

#- 252 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'SXcrEFCw' \
    --body '{"aggregate": "ADYEN", "namespace": "eGNLdIBR", "region": "dliFQVMK", "sandboxTaxJarApiToken": "EzVUWlUW", "specials": ["PAYPAL"], "taxJarApiToken": "s2x1EQU0", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 252 'UpdatePaymentProviderConfig' test.out

#- 253 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'pEvcjaSg' \
    > test.out 2>&1
eval_tap $? 253 'DeletePaymentProviderConfig' test.out

#- 254 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 254 'GetPaymentTaxConfig' test.out

#- 255 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "Eh6jJnFx", "taxJarApiToken": "inIHJ1o7", "taxJarEnabled": false, "taxJarProductCodesMapping": {"q5Zznd5e": "acobTsuR"}}' \
    > test.out 2>&1
eval_tap $? 255 'UpdatePaymentTaxConfig' test.out

#- 256 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --end 'lhreQVFI' \
    --start 'D3o8hJWV' \
    > test.out 2>&1
eval_tap $? 256 'SyncPaymentOrders' test.out

#- 257 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 257 'PublicGetRootCategories' test.out

#- 258 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 258 'DownloadCategories' test.out

#- 259 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'jKIOAw70' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 259 'PublicGetCategory' test.out

#- 260 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'DvAHhSGW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 260 'PublicGetChildCategories' test.out

#- 261 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'Uvzq1Za3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 261 'PublicGetDescendantCategories' test.out

#- 262 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 262 'PublicListCurrencies' test.out

#- 263 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'IBC4vQFs' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetItemByAppId' test.out

#- 264 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 264 'PublicQueryItems' test.out

#- 265 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --sku 'UJPfiaJp' \
    > test.out 2>&1
eval_tap $? 265 'PublicGetItemBySku' test.out

#- 266 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --itemIds '1rt7OBgB' \
    > test.out 2>&1
eval_tap $? 266 'PublicBulkGetItems' test.out

#- 267 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --keyword 'Ce6N0eI6' \
    --language '5Mn5tngE' \
    > test.out 2>&1
eval_tap $? 267 'PublicSearchItems' test.out

#- 268 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'YXgPVT5C' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 268 'PublicGetApp' test.out

#- 269 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'qXDZBVMJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 269 'PublicGetItemDynamicData' test.out

#- 270 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'yJeKFO92' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 270 'PublicGetItem' test.out

#- 271 GetPaymentCustomization
eval_tap 0 271 'GetPaymentCustomization # SKIP deprecated' test.out

#- 272 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "YDtaZvJo", "paymentProvider": "ALIPAY", "returnUrl": "yipZuO4N", "ui": "9S2YCgHa", "zipCode": "6XBcvGRY"}' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetPaymentUrl' test.out

#- 273 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'k5rUtWHC' \
    > test.out 2>&1
eval_tap $? 273 'PublicGetPaymentMethods' test.out

#- 274 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'nhmzzppV' \
    > test.out 2>&1
eval_tap $? 274 'PublicGetUnpaidPaymentOrder' test.out

#- 275 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '7tKNKYUQ' \
    --body '{"token": "VBXymWcN"}' \
    > test.out 2>&1
eval_tap $? 275 'Pay' test.out

#- 276 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'lHaFxYaG' \
    > test.out 2>&1
eval_tap $? 276 'PublicCheckPaymentOrderPaidStatus' test.out

#- 277 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --paymentProvider 'PAYPAL' \
    --region 'mBFyOrFK' \
    > test.out 2>&1
eval_tap $? 277 'GetPaymentPublicConfig' test.out

#- 278 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'txGNAi0f' \
    > test.out 2>&1
eval_tap $? 278 'PublicGetQRCode' test.out

#- 279 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'q4xChPLd' \
    --paymentOrderNo '2lOopc7X' \
    --paymentProvider 'PAYPAL' \
    --returnUrl 'Vpdd6rCp' \
    > test.out 2>&1
eval_tap $? 279 'PublicNormalizePaymentReturnUrl' test.out

#- 280 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'yMrnH9YH' \
    --paymentProvider 'ALIPAY' \
    > test.out 2>&1
eval_tap $? 280 'GetPaymentTaxValue' test.out

#- 281 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '7KnCVOKY' \
    > test.out 2>&1
eval_tap $? 281 'GetRewardByCode' test.out

#- 282 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 282 'QueryRewards1' test.out

#- 283 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId '2zsBRGtd' \
    > test.out 2>&1
eval_tap $? 283 'GetReward1' test.out

#- 284 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'PublicListStores' test.out

#- 285 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 285 'PublicExistsAnyMyActiveEntitlement' test.out

#- 286 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId '8QY2OLbi' \
    > test.out 2>&1
eval_tap $? 286 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 287 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --itemId 'jrvfr8hk' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 288 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --sku 'njWUWdMU' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 289 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 289 'PublicGetEntitlementOwnershipToken' test.out

#- 290 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'XHvw4pNl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'PublicGetMyWallet' test.out

#- 291 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'GLjdBxLM' \
    --body '{"serviceLabel": 30}' \
    > test.out 2>&1
eval_tap $? 291 'PublicSyncPsnDlcInventory' test.out

#- 292 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'DAbTgmsE' \
    --body '{"appId": "YEq2GkYK", "steamId": "1vYm9flX"}' \
    > test.out 2>&1
eval_tap $? 292 'SyncSteamDLC' test.out

#- 293 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q7CQoemn' \
    --body '{"xstsToken": "QG0dH0NV"}' \
    > test.out 2>&1
eval_tap $? 293 'SyncXboxDLC' test.out

#- 294 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'M9VEHTPq' \
    > test.out 2>&1
eval_tap $? 294 'PublicQueryUserEntitlements' test.out

#- 295 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dhkcu5vn' \
    --appId 'z6GiNMbo' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetUserAppEntitlementByAppId' test.out

#- 296 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'BJHml0LJ' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 296 'PublicQueryUserEntitlementsByAppType' test.out

#- 297 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'pPi4mqhr' \
    --itemId 'uiCZLGGP' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetUserEntitlementByItemId' test.out

#- 298 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '5UXkHNTM' \
    --sku 'app5Sbon' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetUserEntitlementBySku' test.out

#- 299 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'sUJKADr6' \
    > test.out 2>&1
eval_tap $? 299 'PublicExistsAnyUserActiveEntitlement' test.out

#- 300 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '0EkdFrpL' \
    --appId 'sGt9yTXW' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 301 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'USCQcMsH' \
    --itemId 'N7reI22k' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 302 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 's7I12tAZ' \
    --sku 'c8sxxLx9' \
    > test.out 2>&1
eval_tap $? 302 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 303 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'XQeqNWLm' \
    --namespace "$AB_NAMESPACE" \
    --userId '8cNJbYH5' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetUserEntitlement' test.out

#- 304 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'J4WiJLv9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NvHwtw2M' \
    --body '{"useCount": 18}' \
    > test.out 2>&1
eval_tap $? 304 'PublicConsumeUserEntitlement' test.out

#- 305 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'cy9ZL6Zs' \
    --body '{"code": "5Bu2XYop", "language": "wzEu_IS", "region": "eREzzRG6"}' \
    > test.out 2>&1
eval_tap $? 305 'PublicRedeemCode' test.out

#- 306 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'z9wmuHdd' \
    --body '{"excludeOldTransactions": true, "language": "DIBi-Dydg-pP", "productId": "3zLWUxMz", "receiptData": "MtSmMmZP", "region": "8nG0FoQP", "transactionId": "8q7aSsb8"}' \
    > test.out 2>&1
eval_tap $? 306 'PublicFulfillAppleIAPItem' test.out

#- 307 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '5gAh9RD3' \
    --body '{"epicGamesJwtToken": "ZzN6N1iJ"}' \
    > test.out 2>&1
eval_tap $? 307 'SyncEpicGamesInventory' test.out

#- 308 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '8ltt9IRq' \
    --body '{"autoAck": true, "language": "LG", "orderId": "6r5f0s5H", "packageName": "6lCf3QHa", "productId": "11hLLCgw", "purchaseTime": 1, "purchaseToken": "v4LExdab", "region": "D8g2cvHf"}' \
    > test.out 2>&1
eval_tap $? 308 'PublicFulfillGoogleIAPItem' test.out

#- 309 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'MRupDA5x' \
    --body '{"currencyCode": "bjs3XRdH", "price": 0.7314008738815447, "productId": "0GCmflIX", "serviceLabel": 20}' \
    > test.out 2>&1
eval_tap $? 309 'PublicReconcilePlayStationStore' test.out

#- 310 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'gJ6zkTwo' \
    --body '{"appId": "akq7sEej", "language": "znT_684", "region": "frlzKpQd", "stadiaPlayerId": "d58dZP5R"}' \
    > test.out 2>&1
eval_tap $? 310 'SyncStadiaEntitlement' test.out

#- 311 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'vrinNtvB' \
    --body '{"appId": "tqFSkA68", "currencyCode": "mIVYJ5pS", "language": "XbSl-Ct", "price": 0.22991011122714922, "productId": "A4M1oUFP", "region": "hgo7Z6mw", "steamId": "NC4FY69m"}' \
    > test.out 2>&1
eval_tap $? 311 'SyncSteamInventory' test.out

#- 312 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'M87joJNO' \
    --body '{"gameId": "GB83Ns6H", "language": "pO", "region": "6lKoVqNB"}' \
    > test.out 2>&1
eval_tap $? 312 'SyncTwitchDropsEntitlement' test.out

#- 313 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'UzIxOfgl' \
    --body '{"currencyCode": "quS2q2Do", "price": 0.7592360770790583, "productId": "9zvFtKa2", "xstsToken": "mOAqOokV"}' \
    > test.out 2>&1
eval_tap $? 313 'SyncXboxInventory' test.out

#- 314 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '1plxQ2Yr' \
    > test.out 2>&1
eval_tap $? 314 'PublicQueryUserOrders' test.out

#- 315 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'iTPfipD6' \
    --body '{"currencyCode": "7jI2hiZk", "discountedPrice": 34, "ext": {"tLnh2U1R": {}}, "itemId": "QlMxkfNM", "language": "nTQV_ZKxo", "price": 21, "quantity": 68, "region": "gm1wkSWs", "returnUrl": "YvAsu18o"}' \
    > test.out 2>&1
eval_tap $? 315 'PublicCreateUserOrder' test.out

#- 316 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bUdc8mbv' \
    --userId 'XcwcgMqO' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetUserOrder' test.out

#- 317 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'XMziXrVd' \
    --userId 'sEc3ClFP' \
    > test.out 2>&1
eval_tap $? 317 'PublicCancelUserOrder' test.out

#- 318 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '3mJwusCB' \
    --userId 'Te4kLcuq' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetUserOrderHistories' test.out

#- 319 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'L40NYgek' \
    --userId 'RavpaGTA' \
    > test.out 2>&1
eval_tap $? 319 'PublicDownloadUserOrderReceipt' test.out

#- 320 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '9BTyCCyN' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetPaymentAccounts' test.out

#- 321 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id '4Fw9i6mI' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'jjCqPVyY' \
    > test.out 2>&1
eval_tap $? 321 'PublicDeletePaymentAccount' test.out

#- 322 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 's01hEYzW' \
    > test.out 2>&1
eval_tap $? 322 'PublicQueryUserSubscriptions' test.out

#- 323 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'w3qrcxM0' \
    --body '{"currencyCode": "DPAXQBNM", "itemId": "P7j3xfPa", "language": "zA-KuKN", "region": "PqD4Agfa", "returnUrl": "sBfclBhZ", "source": "jZbLnmgh"}' \
    > test.out 2>&1
eval_tap $? 323 'PublicSubscribeSubscription' test.out

#- 324 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'KwPyVIn3' \
    --itemId 'qaHP7KNu' \
    > test.out 2>&1
eval_tap $? 324 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 325 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'lyfrENVQ' \
    --userId 'kpcaWHf6' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetUserSubscription' test.out

#- 326 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'T2xOOljn' \
    --userId '7c6c9efJ' \
    > test.out 2>&1
eval_tap $? 326 'PublicChangeSubscriptionBillingAccount' test.out

#- 327 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'I02TZxrg' \
    --userId 'LBFJEkph' \
    --body '{"immediate": true, "reason": "z0h6WpoV"}' \
    > test.out 2>&1
eval_tap $? 327 'PublicCancelSubscription' test.out

#- 328 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'pVc2HBBm' \
    --userId 'j6cEi02h' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetUserSubscriptionBillingHistories' test.out

#- 329 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'Xl42ubCR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fy4GjKn5' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetWallet' test.out

#- 330 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'ItHXLDZq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pRhqnR74' \
    > test.out 2>&1
eval_tap $? 330 'PublicListUserWalletTransactions' test.out


rm -f "tmp.dat"

exit $EXIT_CODE