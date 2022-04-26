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
echo "1..323"

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

#- 138 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'o9LfGeeg' \
    > test.out 2>&1
eval_tap $? 138 'QueryChanges' test.out

#- 139 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JMaBGR6D' \
    > test.out 2>&1
eval_tap $? 139 'PublishAll' test.out

#- 140 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '1ZoZEZQk' \
    > test.out 2>&1
eval_tap $? 140 'CloneStore' test.out

#- 141 ExportStore
./ng net.accelbyte.sdk.cli.Main platform exportStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J8DSqFnh' \
    > test.out 2>&1
eval_tap $? 141 'ExportStore' test.out

#- 142 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'QuerySubscriptions' test.out

#- 143 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'dKvjFCFb' \
    > test.out 2>&1
eval_tap $? 143 'RecurringChargeSubscription' test.out

#- 144 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'SFlEWoMP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 144 'GetTicketDynamic' test.out

#- 145 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'dgK5zn62' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "mhnFSpCT"}' \
    > test.out 2>&1
eval_tap $? 145 'DecreaseTicketSale' test.out

#- 146 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'lDNBOcyg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 146 'GetTicketBoothID' test.out

#- 147 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'vv2LAgfB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 65, "orderNo": "VzanbKYs"}' \
    > test.out 2>&1
eval_tap $? 147 'IncreaseTicketSale' test.out

#- 148 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'B0gqJ8Vh' \
    > test.out 2>&1
eval_tap $? 148 'AnonymizeCampaign' test.out

#- 149 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'YSikJl2p' \
    > test.out 2>&1
eval_tap $? 149 'AnonymizeEntitlement' test.out

#- 150 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId '9rBx8N5e' \
    > test.out 2>&1
eval_tap $? 150 'AnonymizeFulfillment' test.out

#- 151 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'gapqxDy4' \
    > test.out 2>&1
eval_tap $? 151 'AnonymizeIntegration' test.out

#- 152 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'cLfNjzzE' \
    > test.out 2>&1
eval_tap $? 152 'AnonymizeOrder' test.out

#- 153 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZYA8jIkM' \
    > test.out 2>&1
eval_tap $? 153 'AnonymizePayment' test.out

#- 154 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jb7cZ2bP' \
    > test.out 2>&1
eval_tap $? 154 'AnonymizeSubscription' test.out

#- 155 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'saLLpEBV' \
    > test.out 2>&1
eval_tap $? 155 'AnonymizeWallet' test.out

#- 156 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'EMk5AsKa' \
    > test.out 2>&1
eval_tap $? 156 'QueryUserEntitlements' test.out

#- 157 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'F2P44lXk' \
    --body '[{"endDate": "1988-07-23T00:00:00Z", "grantedCode": "diRiC5Ib", "itemId": "Pit71JWl", "itemNamespace": "YCoi4nDf", "language": "Uvqs-YvUz", "quantity": 13, "region": "UeEPB5AG", "source": "IAP", "startDate": "1981-03-25T00:00:00Z", "storeId": "0Zthaj0E"}]' \
    > test.out 2>&1
eval_tap $? 157 'GrantUserEntitlement' test.out

#- 158 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'BA4azRz0' \
    --appId 'd56smobo' \
    > test.out 2>&1
eval_tap $? 158 'GetUserAppEntitlementByAppId' test.out

#- 159 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'r4p1PlgQ' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 159 'QueryUserEntitlementsByAppType' test.out

#- 160 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '9EcNGOeB' \
    --itemId 'RY6G5ae0' \
    > test.out 2>&1
eval_tap $? 160 'GetUserEntitlementByItemId' test.out

#- 161 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '7deDLaZ8' \
    --sku 'JCvbeTfW' \
    > test.out 2>&1
eval_tap $? 161 'GetUserEntitlementBySku' test.out

#- 162 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '0hgzrabL' \
    > test.out 2>&1
eval_tap $? 162 'ExistsAnyUserActiveEntitlement' test.out

#- 163 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'JxEwJrEB' \
    --itemIds '["mQ64haNO"]' \
    > test.out 2>&1
eval_tap $? 163 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 164 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'zlGu68UY' \
    --appId 'yupjdDet' \
    > test.out 2>&1
eval_tap $? 164 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 165 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'noT0rfWt' \
    --itemId 'VPwQfq6V' \
    > test.out 2>&1
eval_tap $? 165 'GetUserEntitlementOwnershipByItemId' test.out

#- 166 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '92gbfPou' \
    --sku 'NdmP7fck' \
    > test.out 2>&1
eval_tap $? 166 'GetUserEntitlementOwnershipBySku' test.out

#- 167 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'VnuDGvYI' \
    --entitlementIds 'b1p5tcR5' \
    > test.out 2>&1
eval_tap $? 167 'RevokeUserEntitlements' test.out

#- 168 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'z8ZJLjSH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'caR3X4tZ' \
    > test.out 2>&1
eval_tap $? 168 'GetUserEntitlement' test.out

#- 169 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'mwr0QmOn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sEg49eXp' \
    --body '{"endDate": "1997-07-05T00:00:00Z", "nullFieldList": ["QkZ2Jjuw"], "startDate": "1995-07-10T00:00:00Z", "status": "CONSUMED", "useCount": 93}' \
    > test.out 2>&1
eval_tap $? 169 'UpdateUserEntitlement' test.out

#- 170 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId '11PCeSrv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ejUKwVfF' \
    --body '{"useCount": 94}' \
    > test.out 2>&1
eval_tap $? 170 'ConsumeUserEntitlement' test.out

#- 171 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'r7mkDzFB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'I1VwhkVS' \
    > test.out 2>&1
eval_tap $? 171 'DisableUserEntitlement' test.out

#- 172 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'KDlNFOUH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BJsvTsqk' \
    > test.out 2>&1
eval_tap $? 172 'EnableUserEntitlement' test.out

#- 173 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId '9hg4hj6n' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UdebW6Us' \
    > test.out 2>&1
eval_tap $? 173 'GetUserEntitlementHistories' test.out

#- 174 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'kbPkkZAk' \
    --namespace "$AB_NAMESPACE" \
    --userId '01f1KxCt' \
    > test.out 2>&1
eval_tap $? 174 'RevokeUserEntitlement' test.out

#- 175 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'WADU2guN' \
    --body '{"duration": 93, "endDate": "1982-10-18T00:00:00Z", "itemId": "9TZQ4qRL", "itemSku": "Ei5wowE3", "language": "6rfmM0CC", "order": {"currency": {"currencyCode": "s35TPUPL", "currencySymbol": "msY8WgwS", "currencyType": "VIRTUAL", "decimals": 58, "namespace": "I5GH9bv9"}, "ext": {"ZTo2HpA6": {}}, "free": false}, "orderNo": "zjHpZO0E", "quantity": 17, "region": "LgRPJK3n", "source": "REWARD", "startDate": "1971-02-10T00:00:00Z", "storeId": "3GOgbQrq"}' \
    > test.out 2>&1
eval_tap $? 175 'FulfillItem' test.out

#- 176 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'ra0Ptkfv' \
    --body '{"code": "OpY2ramp", "language": "Nb_194", "region": "C66hFq0k"}' \
    > test.out 2>&1
eval_tap $? 176 'RedeemCode' test.out

#- 177 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'POkORm2X' \
    --body '{"rewards": [{"currency": {"currencyCode": "jlNEE5ec", "namespace": "PzAmi0yS"}, "item": {"itemId": "JHfPloP1", "itemSku": "XkYK4MgI", "itemType": "sDSFMPyM"}, "quantity": 15, "type": "CURRENCY"}], "source": "REDEEM_CODE"}' \
    > test.out 2>&1
eval_tap $? 177 'FulfillRewards' test.out

#- 178 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '1OLZPVww' \
    > test.out 2>&1
eval_tap $? 178 'QueryUserIAPOrders' test.out

#- 179 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'xH4BIDJu' \
    > test.out 2>&1
eval_tap $? 179 'QueryAllUserIAPOrders' test.out

#- 180 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'DoShMMft' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "nv-hZUR", "productId": "t7QWvE8s", "region": "6Uz8BRuY", "type": "TWITCH"}' \
    > test.out 2>&1
eval_tap $? 180 'MockFulfillIAPItem' test.out

#- 181 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'TtL6MTTR' \
    > test.out 2>&1
eval_tap $? 181 'QueryUserOrders' test.out

#- 182 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'kCbb9S5Q' \
    --itemId '1IVHGT88' \
    > test.out 2>&1
eval_tap $? 182 'CountOfPurchasedItem' test.out

#- 183 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'prREBgYO' \
    --userId 'WdHJ9Jum' \
    > test.out 2>&1
eval_tap $? 183 'GetUserOrder' test.out

#- 184 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ohtU13gf' \
    --userId '7TRigNZj' \
    --body '{"status": "FULFILL_FAILED", "statusReason": "5y3HmK8Q"}' \
    > test.out 2>&1
eval_tap $? 184 'UpdateUserOrderStatus' test.out

#- 185 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'VOa62eQZ' \
    --userId 'tbLLcF67' \
    > test.out 2>&1
eval_tap $? 185 'FulfillUserOrder' test.out

#- 186 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo '1WLtv38H' \
    --userId 'ecczopFm' \
    > test.out 2>&1
eval_tap $? 186 'GetUserOrderGrant' test.out

#- 187 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'eRwpcJBZ' \
    --userId 'yi3mLC4K' \
    > test.out 2>&1
eval_tap $? 187 'GetUserOrderHistories' test.out

#- 188 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'zekiSzey' \
    --userId 'olnOQt0j' \
    --body '{"additionalData": {"cardSummary": "oVHgCytC"}, "authorisedTime": "1976-12-12T00:00:00Z", "chargebackReversedTime": "1987-07-06T00:00:00Z", "chargebackTime": "1977-09-21T00:00:00Z", "chargedTime": "1971-12-14T00:00:00Z", "createdTime": "1972-04-30T00:00:00Z", "currency": {"currencyCode": "TKKeuSjf", "currencySymbol": "Ze9i1osg", "currencyType": "REAL", "decimals": 62, "namespace": "1hzi1Nl4"}, "customParameters": {"7syJ5ibz": {}}, "extOrderNo": "SHZeCLIv", "extTxId": "WPVRsdEq", "extUserId": "A61yTrMg", "issuedAt": "1980-07-10T00:00:00Z", "metadata": {"cTgmPzc2": "0EuO5dMq"}, "namespace": "GDlSZPY0", "nonceStr": "7rEVSjzH", "paymentMethod": "jL6ZbXjG", "paymentMethodFee": 58, "paymentOrderNo": "Smpp3op8", "paymentProvider": "XSOLLA", "paymentProviderFee": 38, "paymentStationUrl": "aRLxtW4P", "price": 42, "refundedTime": "1986-03-20T00:00:00Z", "salesTax": 61, "sandbox": false, "sku": "t5F1Le7c", "status": "REFUNDED", "statusReason": "7q6PWhZm", "subscriptionId": "mKz41i1T", "subtotalPrice": 31, "targetNamespace": "78FipJHa", "targetUserId": "hViJvLYW", "tax": 20, "totalPrice": 6, "totalTax": 25, "txEndTime": "1976-03-26T00:00:00Z", "type": "2luqSOOA", "userId": "2VOZBoNb", "vat": 54}' \
    > test.out 2>&1
eval_tap $? 188 'ProcessUserOrderNotification' test.out

#- 189 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '98PuSGyk' \
    --userId 'qFzPwSMX' \
    > test.out 2>&1
eval_tap $? 189 'DownloadUserOrderReceipt' test.out

#- 190 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'T53bBuL3' \
    --body '{"currencyCode": "8beOYDVu", "currencyNamespace": "HZQ9LYt6", "customParameters": {"w23Wf8iE": {}}, "description": "Qo72sH0a", "extOrderNo": "RdcDlDyG", "extUserId": "csfIuI4D", "itemType": "SUBSCRIPTION", "language": "ej-SR", "metadata": {"RXEFZivQ": "OHG6wVic"}, "notifyUrl": "NratsvvH", "omitNotification": false, "price": 69, "recurringPaymentOrderNo": "ohfNISLX", "region": "MDWDdm5F", "returnUrl": "E4lliQMn", "sandbox": true, "sku": "tJbpEo4m", "subscriptionId": "UNHFtdml", "title": "2xNviWac"}' \
    > test.out 2>&1
eval_tap $? 190 'CreateUserPaymentOrder' test.out

#- 191 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Jc3Fm7Z5' \
    --userId '48uuKgoC' \
    --body '{"description": "BqS5uIdC"}' \
    > test.out 2>&1
eval_tap $? 191 'RefundUserPaymentOrder' test.out

#- 192 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'bwCeeq9o' \
    --body '{"code": "uEdDtjOg", "orderNo": "sypLkm2Z"}' \
    > test.out 2>&1
eval_tap $? 192 'ApplyUserRedemption' test.out

#- 193 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yew5H7Zm' \
    > test.out 2>&1
eval_tap $? 193 'QueryUserSubscriptions' test.out

#- 194 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '0gnYyj6M' \
    > test.out 2>&1
eval_tap $? 194 'GetUserSubscriptionActivities' test.out

#- 195 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xf9G1nty' \
    --body '{"grantDays": 9, "itemId": "bvoeHenA", "language": "ALKt7Efx", "reason": "IH446oUn", "region": "P2S74unX", "source": "wg0JKqVW"}' \
    > test.out 2>&1
eval_tap $? 195 'PlatformSubscribeSubscription' test.out

#- 196 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'W1rjK1ep' \
    --itemId 'wkAvcsYv' \
    > test.out 2>&1
eval_tap $? 196 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 197 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'bgfBVPpT' \
    --userId 'a8Yuq7TK' \
    > test.out 2>&1
eval_tap $? 197 'GetUserSubscription' test.out

#- 198 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iNXmz7eM' \
    --userId 'rMD5TbaU' \
    > test.out 2>&1
eval_tap $? 198 'DeleteUserSubscription' test.out

#- 199 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'xTCTng0x' \
    --userId 'jtdBrjs3' \
    --body '{"immediate": false, "reason": "ykt2Ck2g"}' \
    > test.out 2>&1
eval_tap $? 199 'CancelSubscription' test.out

#- 200 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OlSatECZ' \
    --userId '2UgwQLqD' \
    --body '{"grantDays": 33, "reason": "YSxTPuVl"}' \
    > test.out 2>&1
eval_tap $? 200 'GrantDaysToSubscription' test.out

#- 201 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Bqirdp3y' \
    --userId 'xnsETl1S' \
    > test.out 2>&1
eval_tap $? 201 'GetUserSubscriptionBillingHistories' test.out

#- 202 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'vhQudsjI' \
    --userId 'hXdxiSoW' \
    --body '{"additionalData": {"cardSummary": "pnnxgX7B"}, "authorisedTime": "1985-11-28T00:00:00Z", "chargebackReversedTime": "1990-05-12T00:00:00Z", "chargebackTime": "1983-12-03T00:00:00Z", "chargedTime": "1988-07-03T00:00:00Z", "createdTime": "1975-01-12T00:00:00Z", "currency": {"currencyCode": "hpNYsHtd", "currencySymbol": "B3IkjuaZ", "currencyType": "VIRTUAL", "decimals": 14, "namespace": "JilrZkSS"}, "customParameters": {"KgP5rxCR": {}}, "extOrderNo": "77G9d5CA", "extTxId": "1GORSbL9", "extUserId": "n0dbWDEu", "issuedAt": "1978-04-12T00:00:00Z", "metadata": {"dLQzPnNf": "BAcWArbk"}, "namespace": "CfdHIZb0", "nonceStr": "3otqmBuS", "paymentMethod": "9V2pCZ23", "paymentMethodFee": 92, "paymentOrderNo": "Hmk0lpJ4", "paymentProvider": "ADYEN", "paymentProviderFee": 32, "paymentStationUrl": "i7L2oDUo", "price": 94, "refundedTime": "1992-01-12T00:00:00Z", "salesTax": 19, "sandbox": false, "sku": "09cKmjRU", "status": "INIT", "statusReason": "ZVBVS7OK", "subscriptionId": "2Zrdcsck", "subtotalPrice": 77, "targetNamespace": "ekROWZ2K", "targetUserId": "UTqkK2eF", "tax": 0, "totalPrice": 64, "totalTax": 74, "txEndTime": "1978-12-19T00:00:00Z", "type": "mEEPbLyw", "userId": "JsyUie6f", "vat": 12}' \
    > test.out 2>&1
eval_tap $? 202 'ProcessUserSubscriptionNotification' test.out

#- 203 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'LllUPsO8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lg46Si70' \
    --body '{"count": 42, "orderNo": "L2w4aajD"}' \
    > test.out 2>&1
eval_tap $? 203 'AcquireUserTicket' test.out

#- 204 CheckWallet
./ng net.accelbyte.sdk.cli.Main platform checkWallet \
    --currencyCode 'AOx0iJjY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'leaktqv2' \
    > test.out 2>&1
eval_tap $? 204 'CheckWallet' test.out

#- 205 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'WkljQuD5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mnJONqHG' \
    --body '{"amount": 33, "reason": "8mB7mF2l", "source": "OTHER"}' \
    > test.out 2>&1
eval_tap $? 205 'CreditUserWallet' test.out

#- 206 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'FcaghFXJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IJflRHFc' \
    --body '{"amount": 37}' \
    > test.out 2>&1
eval_tap $? 206 'PayWithUserWallet' test.out

#- 207 GetUserWallet
./ng net.accelbyte.sdk.cli.Main platform getUserWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'IqCy4xDi' \
    --walletId 'fSSQ5On2' \
    > test.out 2>&1
eval_tap $? 207 'GetUserWallet' test.out

#- 208 DebitUserWallet
./ng net.accelbyte.sdk.cli.Main platform debitUserWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'ccEcl3xe' \
    --walletId 'iO4bwF5J' \
    --body '{"amount": 80, "reason": "jGoGxKM3"}' \
    > test.out 2>&1
eval_tap $? 208 'DebitUserWallet' test.out

#- 209 DisableUserWallet
./ng net.accelbyte.sdk.cli.Main platform disableUserWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'qMce5tfL' \
    --walletId 'cpjFZMKC' \
    > test.out 2>&1
eval_tap $? 209 'DisableUserWallet' test.out

#- 210 EnableUserWallet
./ng net.accelbyte.sdk.cli.Main platform enableUserWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'bp0pEbLC' \
    --walletId 'LFpHxMYF' \
    > test.out 2>&1
eval_tap $? 210 'EnableUserWallet' test.out

#- 211 ListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserWalletTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId '836075xE' \
    --walletId 'pzdnYtpj' \
    > test.out 2>&1
eval_tap $? 211 'ListUserWalletTransactions' test.out

#- 212 QueryWallets
./ng net.accelbyte.sdk.cli.Main platform queryWallets \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 212 'QueryWallets' test.out

#- 213 GetWallet
./ng net.accelbyte.sdk.cli.Main platform getWallet \
    --namespace "$AB_NAMESPACE" \
    --walletId 'a5ig2isQ' \
    > test.out 2>&1
eval_tap $? 213 'GetWallet' test.out

#- 214 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --end 'Zga6Vy76' \
    --start 'izPiQRjY' \
    > test.out 2>&1
eval_tap $? 214 'SyncOrders' test.out

#- 215 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --body '{"allowedPaymentMethods": ["a8fv5fIt"], "apiKey": "22tIZhjh", "authoriseAsCapture": false, "blockedPaymentMethods": ["kigW22zX"], "clientKey": "MWXfbcM0", "dropInSettings": "GIALIbFC", "liveEndpointUrlPrefix": "QgBcLNT6", "merchantAccount": "iOQVYx5r", "notificationHmacKey": "W2gMsI1a", "notificationPassword": "YBitSn3U", "notificationUsername": "DeKj97I4", "returnUrl": "WYXLqjN7", "settings": "ktOBTraB"}' \
    > test.out 2>&1
eval_tap $? 215 'TestAdyenConfig' test.out

#- 216 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --body '{"appId": "xWRTVuYE", "privateKey": "qGlKDwTK", "publicKey": "XBrXiQcd", "returnUrl": "9IW8kiCK"}' \
    > test.out 2>&1
eval_tap $? 216 'TestAliPayConfig' test.out

#- 217 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --body '{"publicKey": "eQJWZBvc", "secretKey": "q1ETvWBx"}' \
    > test.out 2>&1
eval_tap $? 217 'TestCheckoutConfig' test.out

#- 218 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    > test.out 2>&1
eval_tap $? 218 'DebugMatchedPaymentMerchantConfig' test.out

#- 219 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --body '{"clientID": "YZJh7B8g", "clientSecret": "bnSu9M2O", "returnUrl": "xD2udaeY", "webHookId": "pCXYSMiy"}' \
    > test.out 2>&1
eval_tap $? 219 'TestPayPalConfig' test.out

#- 220 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --body '{"allowedPaymentMethodTypes": ["87CTqEQB"], "publishableKey": "g36my3sY", "secretKey": "2clrDcai", "webhookSecret": "n0cOVF1z"}' \
    > test.out 2>&1
eval_tap $? 220 'TestStripeConfig' test.out

#- 221 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "HwDTI0sJ", "key": "1Q0kphMT", "mchid": "ggSP2SLc", "returnUrl": "uAP7vU97"}' \
    > test.out 2>&1
eval_tap $? 221 'TestWxPayConfig' test.out

#- 222 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "1Czw2nbg", "flowCompletionUrl": "8C7Mvywh", "merchantId": 41, "projectId": 76, "projectSecretKey": "jOjuGzo1"}' \
    > test.out 2>&1
eval_tap $? 222 'TestXsollaConfig' test.out

#- 223 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'Fz4tU0aS' \
    > test.out 2>&1
eval_tap $? 223 'GetPaymentMerchantConfig' test.out

#- 224 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'n98N8qOU' \
    --body '{"allowedPaymentMethods": ["A0z92RaD"], "apiKey": "e8ngT8LR", "authoriseAsCapture": false, "blockedPaymentMethods": ["MnG1LZyF"], "clientKey": "2mdYY6ZM", "dropInSettings": "fuTYTKsu", "liveEndpointUrlPrefix": "e48qBEBN", "merchantAccount": "AV5BTe6e", "notificationHmacKey": "c1zA92UR", "notificationPassword": "CLSGPmRB", "notificationUsername": "ZWunHW7M", "returnUrl": "Yvr6QA7P", "settings": "pepc92HA"}' \
    > test.out 2>&1
eval_tap $? 224 'UpdateAdyenConfig' test.out

#- 225 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id '94eACdey' \
    > test.out 2>&1
eval_tap $? 225 'TestAdyenConfigById' test.out

#- 226 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'fUpgiPpf' \
    --body '{"appId": "8nxKJ3dn", "privateKey": "mtPwa64Y", "publicKey": "4gPEKMhh", "returnUrl": "u9a6f3xJ"}' \
    > test.out 2>&1
eval_tap $? 226 'UpdateAliPayConfig' test.out

#- 227 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'NtUlKLlI' \
    > test.out 2>&1
eval_tap $? 227 'TestAliPayConfigById' test.out

#- 228 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'IAeHbm5M' \
    --body '{"publicKey": "6LsY1VMu", "secretKey": "IEcRls68"}' \
    > test.out 2>&1
eval_tap $? 228 'UpdateCheckoutConfig' test.out

#- 229 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'M3MPMRPB' \
    > test.out 2>&1
eval_tap $? 229 'TestCheckoutConfigById' test.out

#- 230 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'epyyMz6z' \
    --body '{"clientID": "fR1pvTYY", "clientSecret": "tDOiEi4R", "returnUrl": "uEcHCSGh", "webHookId": "pOZQFlwO"}' \
    > test.out 2>&1
eval_tap $? 230 'UpdatePayPalConfig' test.out

#- 231 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'iuKGDFgK' \
    > test.out 2>&1
eval_tap $? 231 'TestPayPalConfigById' test.out

#- 232 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id '49YuKnXk' \
    --body '{"allowedPaymentMethodTypes": ["s0m8ANrc"], "publishableKey": "Ral7ta3f", "secretKey": "ojA3h4MM", "webhookSecret": "W3AJ5zls"}' \
    > test.out 2>&1
eval_tap $? 232 'UpdateStripeConfig' test.out

#- 233 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'FBwjvLYv' \
    > test.out 2>&1
eval_tap $? 233 'TestStripeConfigById' test.out

#- 234 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'mg6avudQ' \
    --body '{"appId": "FF1CPNY9", "key": "u2dVYdgl", "mchid": "OOoCeK0k", "returnUrl": "PKmBqVux"}' \
    > test.out 2>&1
eval_tap $? 234 'UpdateWxPayConfig' test.out

#- 235 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id '3lXcD8ae' \
    > test.out 2>&1
eval_tap $? 235 'UpdateWxPayConfigCert' test.out

#- 236 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'rtAVCqs8' \
    > test.out 2>&1
eval_tap $? 236 'TestWxPayConfigById' test.out

#- 237 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'XT8xy3nJ' \
    --body '{"apiKey": "06KkseA0", "flowCompletionUrl": "ARj9ricf", "merchantId": 0, "projectId": 49, "projectSecretKey": "vnhi8MDd"}' \
    > test.out 2>&1
eval_tap $? 237 'UpdateXsollaConfig' test.out

#- 238 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'Y4WLHoaU' \
    > test.out 2>&1
eval_tap $? 238 'TestXsollaConfigById' test.out

#- 239 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'kYnQp5eg' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "LARGE", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 239 'UpdateXsollaUIConfig' test.out

#- 240 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    > test.out 2>&1
eval_tap $? 240 'QueryPaymentProviderConfig' test.out

#- 241 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "ivNtQxqW", "region": "RKHohODo", "sandboxTaxJarApiToken": "WOr98kjB", "specials": ["WALLET"], "taxJarApiToken": "s9jjz2Fr", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 241 'CreatePaymentProviderConfig' test.out

#- 242 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 242 'GetAggregatePaymentProviders' test.out

#- 243 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    > test.out 2>&1
eval_tap $? 243 'DebugMatchedPaymentProviderConfig' test.out

#- 244 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 244 'GetSpecialPaymentProviders' test.out

#- 245 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'aGrcB7dI' \
    --body '{"aggregate": "XSOLLA", "namespace": "5W8tKH8o", "region": "u9SdbxSX", "sandboxTaxJarApiToken": "crEFCwqe", "specials": ["WALLET"], "taxJarApiToken": "IBRdliFQ", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 245 'UpdatePaymentProviderConfig' test.out

#- 246 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'VUWlUWDs' \
    > test.out 2>&1
eval_tap $? 246 'DeletePaymentProviderConfig' test.out

#- 247 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 247 'GetPaymentTaxConfig' test.out

#- 248 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "2x1EQU0o", "taxJarApiToken": "epEvcjaS", "taxJarEnabled": false, "taxJarProductCodesMapping": {"Eh6jJnFx": "inIHJ1o7"}}' \
    > test.out 2>&1
eval_tap $? 248 'UpdatePaymentTaxConfig' test.out

#- 249 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --end 'aq5Zznd5' \
    --start 'eacobTsu' \
    > test.out 2>&1
eval_tap $? 249 'SyncPaymentOrders' test.out

#- 250 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 250 'PublicGetRootCategories' test.out

#- 251 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 251 'DownloadCategories' test.out

#- 252 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'RlhreQVF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 252 'PublicGetCategory' test.out

#- 253 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'ID3o8hJW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 253 'PublicGetChildCategories' test.out

#- 254 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'VjKIOAw7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 254 'PublicGetDescendantCategories' test.out

#- 255 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 255 'PublicListCurrencies' test.out

#- 256 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId '0DvAHhSG' \
    > test.out 2>&1
eval_tap $? 256 'PublicGetItemByAppId' test.out

#- 257 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 257 'PublicQueryItems' test.out

#- 258 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --sku 'WUvzq1Za' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetItemBySku' test.out

#- 259 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --itemIds '3IBC4vQF' \
    > test.out 2>&1
eval_tap $? 259 'PublicBulkGetItems' test.out

#- 260 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --keyword 'sUJPfiaJ' \
    --language 'p1rt7OBg' \
    > test.out 2>&1
eval_tap $? 260 'PublicSearchItems' test.out

#- 261 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'BCe6N0eI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 261 'PublicGetApp' test.out

#- 262 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '65Mn5tng' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 262 'PublicGetItemDynamicData' test.out

#- 263 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'EYXgPVT5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 263 'PublicGetItem' test.out

#- 264 GetPaymentCustomization
eval_tap 0 264 'GetPaymentCustomization # SKIP deprecated' test.out

#- 265 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "CqXDZBVM", "paymentProvider": "WXPAY", "returnUrl": "JeKFO92Y", "ui": "DtaZvJoK", "zipCode": "S0OxyipZ"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicGetPaymentUrl' test.out

#- 266 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'uO4N9S2Y' \
    > test.out 2>&1
eval_tap $? 266 'PublicGetPaymentMethods' test.out

#- 267 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'CgHa6XBc' \
    > test.out 2>&1
eval_tap $? 267 'PublicGetUnpaidPaymentOrder' test.out

#- 268 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'vGRYk5rU' \
    --body '{"token": "tWHCnhmz"}' \
    > test.out 2>&1
eval_tap $? 268 'Pay' test.out

#- 269 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'zppV7tKN' \
    > test.out 2>&1
eval_tap $? 269 'PublicCheckPaymentOrderPaidStatus' test.out

#- 270 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --paymentProvider 'WXPAY' \
    --region 'XymWcNlH' \
    > test.out 2>&1
eval_tap $? 270 'GetPaymentPublicConfig' test.out

#- 271 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'aFxYaGHU' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetQRCode' test.out

#- 272 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'pmBFyOrF' \
    --paymentOrderNo 'KtxGNAi0' \
    --paymentProvider 'ALIPAY' \
    --returnUrl 'q4xChPLd' \
    > test.out 2>&1
eval_tap $? 272 'PublicNormalizePaymentReturnUrl' test.out

#- 273 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '2lOopc7X' \
    --paymentProvider 'PAYPAL' \
    > test.out 2>&1
eval_tap $? 273 'GetPaymentTaxValue' test.out

#- 274 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'Vpdd6rCp' \
    > test.out 2>&1
eval_tap $? 274 'GetRewardByCode' test.out

#- 275 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 275 'QueryRewards1' test.out

#- 276 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'yMrnH9YH' \
    > test.out 2>&1
eval_tap $? 276 'GetReward1' test.out

#- 277 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 277 'PublicListStores' test.out

#- 278 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 278 'PublicExistsAnyMyActiveEntitlement' test.out

#- 279 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'Xh7KnCVO' \
    > test.out 2>&1
eval_tap $? 279 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 280 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --itemId 'KY2zsBRG' \
    > test.out 2>&1
eval_tap $? 280 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 281 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --sku 'td8QY2OL' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 282 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 282 'PublicGetEntitlementOwnershipToken' test.out

#- 283 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'bijrvfr8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 283 'PublicGetMyWallet' test.out

#- 284 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'hknjWUWd' \
    --body '{"serviceLabel": 76}' \
    > test.out 2>&1
eval_tap $? 284 'PublicSyncPsnDlcInventory' test.out

#- 285 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'UXHvw4pN' \
    --body '{"appId": "lGLjdBxL", "steamId": "M079pDAb"}' \
    > test.out 2>&1
eval_tap $? 285 'SyncSteamDLC' test.out

#- 286 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'TgmsEYEq' \
    --body '{"xstsToken": "2GkYK1vY"}' \
    > test.out 2>&1
eval_tap $? 286 'SyncXboxDLC' test.out

#- 287 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'm9flXQ7C' \
    > test.out 2>&1
eval_tap $? 287 'PublicQueryUserEntitlements' test.out

#- 288 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'QoemnQG0' \
    --appId 'dH0NVM9V' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetUserAppEntitlementByAppId' test.out

#- 289 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'EHTPqDhk' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 289 'PublicQueryUserEntitlementsByAppType' test.out

#- 290 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'u5vnz6Gi' \
    --itemId 'NMboBJHm' \
    > test.out 2>&1
eval_tap $? 290 'PublicGetUserEntitlementByItemId' test.out

#- 291 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'l0LJmpPi' \
    --sku '4mqhruiC' \
    > test.out 2>&1
eval_tap $? 291 'PublicGetUserEntitlementBySku' test.out

#- 292 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZLGGP5UX' \
    > test.out 2>&1
eval_tap $? 292 'PublicExistsAnyUserActiveEntitlement' test.out

#- 293 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'kHNTMapp' \
    --appId '5SbonsUJ' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 294 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'KADr60Ek' \
    --itemId 'dFrpLsGt' \
    > test.out 2>&1
eval_tap $? 294 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 295 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '9yTXWUSC' \
    --sku 'QcMsHN7r' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 296 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'eI22ks7I' \
    --namespace "$AB_NAMESPACE" \
    --userId '12tAZc8s' \
    > test.out 2>&1
eval_tap $? 296 'PublicGetUserEntitlement' test.out

#- 297 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'xxLx9XQe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qNWLm8cN' \
    --body '{"useCount": 70}' \
    > test.out 2>&1
eval_tap $? 297 'PublicConsumeUserEntitlement' test.out

#- 298 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'bYH5J4Wi' \
    --body '{"code": "JLv9NvHw", "language": "WmJ-339", "region": "WZeUKJJN"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicRedeemCode' test.out

#- 299 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ftRpGgk1' \
    --body '{"excludeOldTransactions": false, "language": "Ere-WMUh", "productId": "dyOdibI1", "receiptData": "LVyqbdY8", "region": "DGZKAuoI", "transactionId": "Kz3Pp3zL"}' \
    > test.out 2>&1
eval_tap $? 299 'PublicFulfillAppleIAPItem' test.out

#- 300 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'WUxMzMtS' \
    --body '{"epicGamesJwtToken": "mMmZP8nG"}' \
    > test.out 2>&1
eval_tap $? 300 'SyncEpicGamesInventory' test.out

#- 301 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '0FoQP8q7' \
    --body '{"autoAck": false, "language": "SBGa-TT", "orderId": "9IRqCflg", "packageName": "ln6r5f0s", "productId": "5H6lCf3Q", "purchaseTime": 67, "purchaseToken": "a11hLLCg", "region": "w5av4LEx"}' \
    > test.out 2>&1
eval_tap $? 301 'PublicFulfillGoogleIAPItem' test.out

#- 302 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'dabD8g2c' \
    --body '{"currencyCode": "vHfMRupD", "price": 0.4144751720364458, "productId": "xbjs3XRd", "serviceLabel": 66}' \
    > test.out 2>&1
eval_tap $? 302 'PublicReconcilePlayStationStore' test.out

#- 303 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'UJ0GCmfl' \
    --body '{"appId": "IXkgJ6zk", "language": "WOAK-EJfz_484", "region": "zIsfrlzK", "stadiaPlayerId": "pQdd58dZ"}' \
    > test.out 2>&1
eval_tap $? 303 'SyncStadiaEntitlement' test.out

#- 304 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'P5RvrinN' \
    --body '{"appId": "tvBtqFSk", "currencyCode": "A68mIVYJ", "language": "sv-lHTY", "price": 0.07190610455309188, "productId": "cToXA4M1", "region": "oUFPhgo7", "steamId": "Z6mwNC4F"}' \
    > test.out 2>&1
eval_tap $? 304 'SyncSteamInventory' test.out

#- 305 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y69mM87j' \
    --body '{"gameId": "oJNOGB83", "language": "ShLp", "region": "b6lKoVqN"}' \
    > test.out 2>&1
eval_tap $? 305 'SyncTwitchDropsEntitlement' test.out

#- 306 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'BUzIxOfg' \
    --body '{"currencyCode": "lquS2q2D", "price": 0.21949705302146127, "productId": "r9zvFtKa", "xstsToken": "2mOAqOok"}' \
    > test.out 2>&1
eval_tap $? 306 'SyncXboxInventory' test.out

#- 307 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'V1plxQ2Y' \
    > test.out 2>&1
eval_tap $? 307 'PublicQueryUserOrders' test.out

#- 308 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'riTPfipD' \
    --body '{"currencyCode": "67jI2hiZ", "discountedPrice": 21, "ext": {"rtLnh2U1": {}}, "itemId": "RQlMxkfN", "language": "pnTQ-sNZK", "price": 21, "quantity": 68, "region": "gm1wkSWs", "returnUrl": "YvAsu18o"}' \
    > test.out 2>&1
eval_tap $? 308 'PublicCreateUserOrder' test.out

#- 309 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bUdc8mbv' \
    --userId 'XcwcgMqO' \
    > test.out 2>&1
eval_tap $? 309 'PublicGetUserOrder' test.out

#- 310 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'XMziXrVd' \
    --userId 'sEc3ClFP' \
    > test.out 2>&1
eval_tap $? 310 'PublicCancelUserOrder' test.out

#- 311 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '3mJwusCB' \
    --userId 'Te4kLcuq' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetUserOrderHistories' test.out

#- 312 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'L40NYgek' \
    --userId 'RavpaGTA' \
    > test.out 2>&1
eval_tap $? 312 'PublicDownloadUserOrderReceipt' test.out

#- 313 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '9BTyCCyN' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetPaymentAccounts' test.out

#- 314 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id '4Fw9i6mI' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'jjCqPVyY' \
    > test.out 2>&1
eval_tap $? 314 'PublicDeletePaymentAccount' test.out

#- 315 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 's01hEYzW' \
    > test.out 2>&1
eval_tap $? 315 'PublicQueryUserSubscriptions' test.out

#- 316 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'w3qrcxM0' \
    --body '{"currencyCode": "DPAXQBNM", "itemId": "P7j3xfPa", "language": "zA-KuKN", "region": "PqD4Agfa", "returnUrl": "sBfclBhZ", "source": "jZbLnmgh"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicSubscribeSubscription' test.out

#- 317 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'KwPyVIn3' \
    --itemId 'qaHP7KNu' \
    > test.out 2>&1
eval_tap $? 317 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 318 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'lyfrENVQ' \
    --userId 'kpcaWHf6' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetUserSubscription' test.out

#- 319 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'T2xOOljn' \
    --userId '7c6c9efJ' \
    > test.out 2>&1
eval_tap $? 319 'PublicChangeSubscriptionBillingAccount' test.out

#- 320 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'I02TZxrg' \
    --userId 'LBFJEkph' \
    --body '{"immediate": true, "reason": "z0h6WpoV"}' \
    > test.out 2>&1
eval_tap $? 320 'PublicCancelSubscription' test.out

#- 321 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'pVc2HBBm' \
    --userId 'j6cEi02h' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetUserSubscriptionBillingHistories' test.out

#- 322 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'Xl42ubCR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fy4GjKn5' \
    > test.out 2>&1
eval_tap $? 322 'PublicGetWallet' test.out

#- 323 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'ItHXLDZq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pRhqnR74' \
    > test.out 2>&1
eval_tap $? 323 'PublicListUserWalletTransactions' test.out


rm -f "tmp.dat"

exit $EXIT_CODE