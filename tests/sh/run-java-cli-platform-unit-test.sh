#!/bin/bash

#Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
#This is licensed software from AccelByte Inc, for limitations
#and restrictions contact your company contract manager.

#Meta:
#- random seed: 256
#- template file: java-cli-unit-test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH="${MODULE_PATH:-../../samples/cli}"
JAR_PATH="${MODULE_PATH}/build/libs/cli.jar"
TEMP_FILE='file.tmp'

OPERATIONS_COUNT=320

FINISHED_COUNT=0
SUCCESS_COUNT=0
FAILED_COUNT=0

export AB_BASE_URL="http://0.0.0.0:8080"
export AB_CLIENT_ID="admin"
export AB_CLIENT_SECRET="admin"
export AB_NAMESPACE="test"

get_current_year() { echo $(date +'%Y'); }
get_adult_birthday() { echo "$(( $(get_current_year) - 22))-01-01"; }

get_random_int() { echo $(( $1 + ( RANDOM % (($2 - $1)) ) )); }
get_random_bool() { ( (( (RANDOM % 2) == 1)) && echo "true" ) || ( echo "false" ) }
get_random_element() { declare -a a=("$@"); r=$((RANDOM % ${#a[@]})); echo ${a[$r]}; }

create_file() {
    touch $1
}

delete_file() {
    [ ! -e $1 ] || rm $1
}

update_status() {
    return_code=$1
    operation_name=$2

    FINISHED_COUNT=$(( $FINISHED_COUNT + 1 ))

    if [ $return_code == 0 ]
    then
        SUCCESS_COUNT=$(( $SUCCESS_COUNT + 1 ))
        echo "ok $FINISHED_COUNT $operation_name"
    else
        FAILED_COUNT=$(( $FAILED_COUNT + 1 ))
        echo "not ok $FINISHED_COUNT - $operation_name"
        echo '  ---'
        echo '  error: |-'
        while read line; do
          echo "    $line" | tr '\n' ' '
        echo $line
        done < $TEMP_FILE
    fi
}

create_file 'tmp.dat'

echo 'TAP version 13'
echo "1..$OPERATIONS_COUNT"

java -jar ${JAR_PATH} loginClient

#- 1 ListFulfillmentScripts
java -jar ${JAR_PATH} platform listFulfillmentScripts \
    >$TEMP_FILE 2>&1
update_status $? 'ListFulfillmentScripts'
delete_file $TEMP_FILE

#- 2 TestFulfillmentScriptEval
java -jar ${JAR_PATH} platform testFulfillmentScriptEval \
    --body '{"context": {"item": {"appId": "FtBxyZcD", "appType": "DEMO", "baseAppId": "pGlsQuJu", "boothName": "8vMf0IsJ", "boundItemIds": ["kTrd8IDc"], "categoryPath": "V2zXnTKj", "clazz": "XY1bPqam", "createdAt": "1975-08-05T00:00:00Z", "description": "xx9Cs18E", "displayOrder": 100, "entitlementType": "DURABLE", "ext": {"kItqRzHU": {}}, "features": ["1oh570KQ"], "images": [{"as": "BVaewc72", "caption": "krSha68n", "height": 100, "imageUrl": "nozp1C2K", "smallImageUrl": "mIQTuBdN", "width": 61}], "itemId": "UsxFb8CJ", "itemIds": ["17M7DJZa"], "itemQty": {"MSxECbZb": 49}, "itemType": "COINS", "language": "yoarORoe", "listable": false, "localExt": {"8Rh3kgs9": {}}, "longDescription": "qqJbnQso", "maxCount": 54, "maxCountPerUser": 12, "name": "iVpP8Cm3", "namespace": "yvASUoxd", "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 63, "fixedTrialCycles": 32, "graceDays": 24}, "region": "AGTJ8IEd", "regionData": [{"currencyCode": "agEtp4w2", "currencyNamespace": "9KOu9c19", "currencyType": "VIRTUAL", "discountAmount": 33, "discountExpireAt": "1995-09-24T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1976-11-25T00:00:00Z", "discountedPrice": 26, "expireAt": "1978-10-30T00:00:00Z", "price": 61, "purchaseAt": "1989-10-31T00:00:00Z", "trialPrice": 11}], "seasonType": "PASS", "sku": "iX7jpkVZ", "stackable": false, "status": "ACTIVE", "tags": ["QYEmqGod"], "targetCurrencyCode": "OEGt9gPO", "targetItemId": "j0c6i0Jk", "targetNamespace": "vIas73uc", "thumbnailUrl": "YnFAJ3DK", "title": "5T4Eogg0", "updatedAt": "1996-04-22T00:00:00Z", "useCount": 23}, "namespace": "pv5bVAgt", "order": {"currency": {"currencyCode": "sDhUTDUs", "currencySymbol": "cbQDjbTQ", "currencyType": "VIRTUAL", "decimals": 83, "namespace": "Mz2PTRlk"}, "ext": {"yU89ZPOw": {}}, "free": true}, "source": "GIFT"}, "script": "J42cwmzB", "type": "grantDays"}' \
    >$TEMP_FILE 2>&1
update_status $? 'TestFulfillmentScriptEval'
delete_file $TEMP_FILE

#- 3 GetFulfillmentScript
java -jar ${JAR_PATH} platform getFulfillmentScript \
    --id 'SMNcoAAO' \
    >$TEMP_FILE 2>&1
update_status $? 'GetFulfillmentScript'
delete_file $TEMP_FILE

#- 4 CreateFulfillmentScript
java -jar ${JAR_PATH} platform createFulfillmentScript \
    --id 'jKNjfcYH' \
    --body '{"grantDays": "m093aYgB"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateFulfillmentScript'
delete_file $TEMP_FILE

#- 5 DeleteFulfillmentScript
java -jar ${JAR_PATH} platform deleteFulfillmentScript \
    --id 'U1sqjyK0' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteFulfillmentScript'
delete_file $TEMP_FILE

#- 6 UpdateFulfillmentScript
java -jar ${JAR_PATH} platform updateFulfillmentScript \
    --id 'XH45PaRS' \
    --body '{"grantDays": "OFQBtu23"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateFulfillmentScript'
delete_file $TEMP_FILE

#- 7 QueryCampaigns
java -jar ${JAR_PATH} platform queryCampaigns \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QueryCampaigns'
delete_file $TEMP_FILE

#- 8 CreateCampaign
java -jar ${JAR_PATH} platform createCampaign \
    --namespace "test" \
    --body '{"description": "REZ8hRVX", "items": [{"extraSubscriptionDays": 74, "itemId": "GOvDdYiQ", "itemName": "S9i7mV1C", "quantity": 30}], "maxRedeemCountPerCampaignPerUser": 18, "maxRedeemCountPerCode": 64, "maxRedeemCountPerCodePerUser": 13, "maxSaleCount": 31, "name": "xL6ycTQd", "redeemEnd": "1981-03-31T00:00:00Z", "redeemStart": "1977-10-25T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["SQWEXL6L"], "type": "REDEMPTION"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateCampaign'
delete_file $TEMP_FILE

#- 9 GetCampaign
java -jar ${JAR_PATH} platform getCampaign \
    --campaignId 'E1YHo9m1' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetCampaign'
delete_file $TEMP_FILE

#- 10 UpdateCampaign
java -jar ${JAR_PATH} platform updateCampaign \
    --campaignId '26ZWc8hH' \
    --namespace "test" \
    --body '{"description": "tWvbNYqg", "items": [{"extraSubscriptionDays": 92, "itemId": "qslArFPi", "itemName": "HUIvaCv8", "quantity": 20}], "maxRedeemCountPerCampaignPerUser": 92, "maxRedeemCountPerCode": 6, "maxRedeemCountPerCodePerUser": 55, "maxSaleCount": 55, "name": "pdsJLhsV", "redeemEnd": "1983-09-03T00:00:00Z", "redeemStart": "1982-05-20T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["oot0B7WO"]}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateCampaign'
delete_file $TEMP_FILE

#- 11 GetCampaignDynamic
java -jar ${JAR_PATH} platform getCampaignDynamic \
    --campaignId 'fercZdpM' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetCampaignDynamic'
delete_file $TEMP_FILE

#- 12 GetRootCategories
java -jar ${JAR_PATH} platform getRootCategories \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetRootCategories'
delete_file $TEMP_FILE

#- 13 CreateCategory
java -jar ${JAR_PATH} platform createCategory \
    --namespace "test" \
    --storeId 'ci37Ds7Y' \
    --body '{"categoryPath": "SfExaI3u", "localizationDisplayNames": {"zLteMbFA": "lt4hr7Hm"}}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateCategory'
delete_file $TEMP_FILE

#- 14 ListCategoriesBasic
java -jar ${JAR_PATH} platform listCategoriesBasic \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListCategoriesBasic'
delete_file $TEMP_FILE

#- 15 GetCategory
java -jar ${JAR_PATH} platform getCategory \
    --categoryPath 'OYiBA5lt' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetCategory'
delete_file $TEMP_FILE

#- 16 UpdateCategory
java -jar ${JAR_PATH} platform updateCategory \
    --categoryPath 'AOXmlG6e' \
    --namespace "test" \
    --storeId 'h1dTdoTF' \
    --body '{"localizationDisplayNames": {"pBIcuC1d": "QY93OJnJ"}}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateCategory'
delete_file $TEMP_FILE

#- 17 DeleteCategory
java -jar ${JAR_PATH} platform deleteCategory \
    --categoryPath '6Te9vD8l' \
    --namespace "test" \
    --storeId 'dz7Hu8AD' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteCategory'
delete_file $TEMP_FILE

#- 18 GetChildCategories
java -jar ${JAR_PATH} platform getChildCategories \
    --categoryPath '79kdWunv' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetChildCategories'
delete_file $TEMP_FILE

#- 19 GetDescendantCategories
java -jar ${JAR_PATH} platform getDescendantCategories \
    --categoryPath 'izU0q1pH' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetDescendantCategories'
delete_file $TEMP_FILE

#- 20 QueryCodes
java -jar ${JAR_PATH} platform queryCodes \
    --campaignId 'yhhERoGg' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QueryCodes'
delete_file $TEMP_FILE

#- 21 CreateCodes
java -jar ${JAR_PATH} platform createCodes \
    --campaignId 'drysMizB' \
    --namespace "test" \
    --body '{"quantity": 65}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateCodes'
delete_file $TEMP_FILE

#- 22 Download
java -jar ${JAR_PATH} platform download \
    --campaignId 'SRdP2l7D' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'Download'
delete_file $TEMP_FILE

#- 23 BulkDisableCodes
java -jar ${JAR_PATH} platform bulkDisableCodes \
    --campaignId 'NSZ8Aq0X' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'BulkDisableCodes'
delete_file $TEMP_FILE

#- 24 BulkEnableCodes
java -jar ${JAR_PATH} platform bulkEnableCodes \
    --campaignId 'iPLQXSe0' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'BulkEnableCodes'
delete_file $TEMP_FILE

#- 25 QueryRedeemHistory
java -jar ${JAR_PATH} platform queryRedeemHistory \
    --campaignId '7ZddOGTM' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QueryRedeemHistory'
delete_file $TEMP_FILE

#- 26 GetCode
java -jar ${JAR_PATH} platform getCode \
    --code 'lJjBwj9H' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetCode'
delete_file $TEMP_FILE

#- 27 DisableCode
java -jar ${JAR_PATH} platform disableCode \
    --code 'JHQKseEd' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DisableCode'
delete_file $TEMP_FILE

#- 28 EnableCode
java -jar ${JAR_PATH} platform enableCode \
    --code 'SXRDSvgu' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'EnableCode'
delete_file $TEMP_FILE

#- 29 ListCurrencies
java -jar ${JAR_PATH} platform listCurrencies \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListCurrencies'
delete_file $TEMP_FILE

#- 30 CreateCurrency
java -jar ${JAR_PATH} platform createCurrency \
    --namespace "test" \
    --body '{"currencyCode": "auw1xT7e", "currencySymbol": "MwSl9MLH", "currencyType": "REAL", "decimals": 91, "localizationDescriptions": {"J2ulNzBv": "wJaQa547"}}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateCurrency'
delete_file $TEMP_FILE

#- 31 UpdateCurrency
java -jar ${JAR_PATH} platform updateCurrency \
    --currencyCode 'JllvA8RW' \
    --namespace "test" \
    --body '{"localizationDescriptions": {"SpabUt7x": "k6QxyWhf"}}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateCurrency'
delete_file $TEMP_FILE

#- 32 DeleteCurrency
java -jar ${JAR_PATH} platform deleteCurrency \
    --currencyCode 'qoWfJw2o' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteCurrency'
delete_file $TEMP_FILE

#- 33 GetCurrencyConfig
java -jar ${JAR_PATH} platform getCurrencyConfig \
    --currencyCode '8oWUqvPC' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetCurrencyConfig'
delete_file $TEMP_FILE

#- 34 GetCurrencySummary
java -jar ${JAR_PATH} platform getCurrencySummary \
    --currencyCode 'Z2HzT7NX' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetCurrencySummary'
delete_file $TEMP_FILE

#- 35 GetDLCItemConfig
java -jar ${JAR_PATH} platform getDLCItemConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetDLCItemConfig'
delete_file $TEMP_FILE

#- 36 UpdateDLCItemConfig
java -jar ${JAR_PATH} platform updateDLCItemConfig \
    --namespace "test" \
    --body '{"data": [{"id": "mWDlXsuN", "rewards": [{"currency": {"currencyCode": "IdQJR5ls", "namespace": "NOlvkfwa"}, "item": {"itemId": "SbnsuLCg", "itemSku": "ToxuVTek", "itemType": "Jgvg6h5H"}, "quantity": 68, "type": "ITEM"}]}]}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateDLCItemConfig'
delete_file $TEMP_FILE

#- 37 DeleteDLCItemConfig
java -jar ${JAR_PATH} platform deleteDLCItemConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteDLCItemConfig'
delete_file $TEMP_FILE

#- 38 GetPlatformDLCConfig
java -jar ${JAR_PATH} platform getPlatformDLCConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetPlatformDLCConfig'
delete_file $TEMP_FILE

#- 39 UpdatePlatformDLCConfig
java -jar ${JAR_PATH} platform updatePlatformDLCConfig \
    --namespace "test" \
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"0DviplEk": "4vj3LDp4"}}]}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePlatformDLCConfig'
delete_file $TEMP_FILE

#- 40 DeletePlatformDLCConfig
java -jar ${JAR_PATH} platform deletePlatformDLCConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeletePlatformDLCConfig'
delete_file $TEMP_FILE

#- 41 QueryEntitlements
java -jar ${JAR_PATH} platform queryEntitlements \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QueryEntitlements'
delete_file $TEMP_FILE

#- 42 GetEntitlement
java -jar ${JAR_PATH} platform getEntitlement \
    --entitlementId 'yqDt8QUZ' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetEntitlement'
delete_file $TEMP_FILE

#- 43 QueryFulfillmentHistories
java -jar ${JAR_PATH} platform queryFulfillmentHistories \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QueryFulfillmentHistories'
delete_file $TEMP_FILE

#- 44 GetAppleIAPConfig
java -jar ${JAR_PATH} platform getAppleIAPConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetAppleIAPConfig'
delete_file $TEMP_FILE

#- 45 UpdateAppleIAPConfig
java -jar ${JAR_PATH} platform updateAppleIAPConfig \
    --namespace "test" \
    --body '{"bundleId": "DpxlHasi", "password": "nGcjrkmR"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateAppleIAPConfig'
delete_file $TEMP_FILE

#- 46 DeleteAppleIAPConfig
java -jar ${JAR_PATH} platform deleteAppleIAPConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteAppleIAPConfig'
delete_file $TEMP_FILE

#- 47 GetEpicGamesIAPConfig
java -jar ${JAR_PATH} platform getEpicGamesIAPConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetEpicGamesIAPConfig'
delete_file $TEMP_FILE

#- 48 UpdateEpicGamesIAPConfig
java -jar ${JAR_PATH} platform updateEpicGamesIAPConfig \
    --namespace "test" \
    --body '{"sandboxId": "MttgjDSa"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateEpicGamesIAPConfig'
delete_file $TEMP_FILE

#- 49 DeleteEpicGamesIAPConfig
java -jar ${JAR_PATH} platform deleteEpicGamesIAPConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteEpicGamesIAPConfig'
delete_file $TEMP_FILE

#- 50 GetGoogleIAPConfig
java -jar ${JAR_PATH} platform getGoogleIAPConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetGoogleIAPConfig'
delete_file $TEMP_FILE

#- 51 UpdateGoogleIAPConfig
java -jar ${JAR_PATH} platform updateGoogleIAPConfig \
    --namespace "test" \
    --body '{"applicationName": "IVBmft3U", "serviceAccountId": "dg7p9PGm"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateGoogleIAPConfig'
delete_file $TEMP_FILE

#- 52 DeleteGoogleIAPConfig
java -jar ${JAR_PATH} platform deleteGoogleIAPConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteGoogleIAPConfig'
delete_file $TEMP_FILE

#- 53 UpdateGoogleP12File
java -jar ${JAR_PATH} platform updateGoogleP12File \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateGoogleP12File'
delete_file $TEMP_FILE

#- 54 GetIAPItemConfig
java -jar ${JAR_PATH} platform getIAPItemConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetIAPItemConfig'
delete_file $TEMP_FILE

#- 55 UpdateIAPItemConfig
java -jar ${JAR_PATH} platform updateIAPItemConfig \
    --namespace "test" \
    --body '{"data": [{"itemIdentity": "Y2H5kX4M", "platformProductIdMap": {"sisSX28n": "ARxWRpv5"}}]}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateIAPItemConfig'
delete_file $TEMP_FILE

#- 56 DeleteIAPItemConfig
java -jar ${JAR_PATH} platform deleteIAPItemConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteIAPItemConfig'
delete_file $TEMP_FILE

#- 57 GetPlayStationIAPConfig
java -jar ${JAR_PATH} platform getPlayStationIAPConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetPlayStationIAPConfig'
delete_file $TEMP_FILE

#- 58 UpdatePlaystationIAPConfig
java -jar ${JAR_PATH} platform updatePlaystationIAPConfig \
    --namespace "test" \
    --body '{"environment": "ou5xtvd2"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePlaystationIAPConfig'
delete_file $TEMP_FILE

#- 59 DeletePlaystationIAPConfig
java -jar ${JAR_PATH} platform deletePlaystationIAPConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeletePlaystationIAPConfig'
delete_file $TEMP_FILE

#- 60 GetStadiaIAPConfig
java -jar ${JAR_PATH} platform getStadiaIAPConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetStadiaIAPConfig'
delete_file $TEMP_FILE

#- 61 DeleteStadiaIAPConfig
java -jar ${JAR_PATH} platform deleteStadiaIAPConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteStadiaIAPConfig'
delete_file $TEMP_FILE

#- 62 UpdateStadiaJsonConfigFile
java -jar ${JAR_PATH} platform updateStadiaJsonConfigFile \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateStadiaJsonConfigFile'
delete_file $TEMP_FILE

#- 63 GetSteamIAPConfig
java -jar ${JAR_PATH} platform getSteamIAPConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetSteamIAPConfig'
delete_file $TEMP_FILE

#- 64 UpdateSteamIAPConfig
java -jar ${JAR_PATH} platform updateSteamIAPConfig \
    --namespace "test" \
    --body '{"publisherAuthenticationKey": "8OUfCt8U"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateSteamIAPConfig'
delete_file $TEMP_FILE

#- 65 DeleteSteamIAPConfig
java -jar ${JAR_PATH} platform deleteSteamIAPConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteSteamIAPConfig'
delete_file $TEMP_FILE

#- 66 GetTwitchIAPConfig
java -jar ${JAR_PATH} platform getTwitchIAPConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetTwitchIAPConfig'
delete_file $TEMP_FILE

#- 67 UpdateTwitchIAPConfig
java -jar ${JAR_PATH} platform updateTwitchIAPConfig \
    --namespace "test" \
    --body '{"clientId": "JC5flNyj", "clientSecret": "6HsTtX8P", "organizationId": "3llnaaS9"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateTwitchIAPConfig'
delete_file $TEMP_FILE

#- 68 DeleteTwitchIAPConfig
java -jar ${JAR_PATH} platform deleteTwitchIAPConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteTwitchIAPConfig'
delete_file $TEMP_FILE

#- 69 GetXblIAPConfig
java -jar ${JAR_PATH} platform getXblIAPConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetXblIAPConfig'
delete_file $TEMP_FILE

#- 70 UpdateXblIAPConfig
java -jar ${JAR_PATH} platform updateXblIAPConfig \
    --namespace "test" \
    --body '{"relyingPartyCert": "lqyygPcf"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateXblIAPConfig'
delete_file $TEMP_FILE

#- 71 DeleteXblAPConfig
java -jar ${JAR_PATH} platform deleteXblAPConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteXblAPConfig'
delete_file $TEMP_FILE

#- 72 UpdateXblBPCertFile
java -jar ${JAR_PATH} platform updateXblBPCertFile \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateXblBPCertFile'
delete_file $TEMP_FILE

#- 73 SyncInGameItem
java -jar ${JAR_PATH} platform syncInGameItem \
    --namespace "test" \
    --storeId 'kJIxfQZz' \
    --body '{"categoryPath": "a8kNVbDx", "targetItemId": "VMq7HJk0", "targetNamespace": "F89xAc3Y"}' \
    >$TEMP_FILE 2>&1
update_status $? 'SyncInGameItem'
delete_file $TEMP_FILE

#- 74 CreateItem
java -jar ${JAR_PATH} platform createItem \
    --namespace "test" \
    --storeId 'VfaENtrl' \
    --body '{"appId": "0pTKZTXq", "appType": "DEMO", "baseAppId": "HuBMYQSA", "boothName": "2jz1ZOpd", "categoryPath": "OjSyMddB", "clazz": "41JuMf7R", "displayOrder": 93, "entitlementType": "CONSUMABLE", "ext": {"BHRj8IiR": {}}, "features": ["imRllHT6"], "images": [{"as": "Dc40vFFA", "caption": "6gpU7EW3", "height": 46, "imageUrl": "1dCpm55g", "smallImageUrl": "OeqQIqcJ", "width": 95}], "itemIds": ["KmBM1J1I"], "itemQty": {"buTrrkbm": 41}, "itemType": "SUBSCRIPTION", "listable": false, "localizations": {"OqmEnDXI": {"description": "WrBPlSay", "localExt": {"46mv71BA": {}}, "longDescription": "ZAOjtFJ2", "title": "vmTj7tT7"}}, "maxCount": 90, "maxCountPerUser": 67, "name": "WDdCkIsZ", "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 34, "fixedTrialCycles": 96, "graceDays": 45}, "regionData": {"PHcyFAdA": [{"currencyCode": "tYciLIgR", "currencyNamespace": "wFRr0gwB", "currencyType": "VIRTUAL", "discountAmount": 50, "discountExpireAt": "1998-06-15T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1995-03-26T00:00:00Z", "discountedPrice": 94, "expireAt": "1979-10-18T00:00:00Z", "price": 39, "purchaseAt": "1986-04-13T00:00:00Z", "trialPrice": 36}]}, "seasonType": "PASS", "sku": "ip1tw3L7", "stackable": false, "status": "ACTIVE", "tags": ["9pqtv6Jf"], "targetCurrencyCode": "PZwcCVOX", "targetNamespace": "cVa80TmC", "thumbnailUrl": "wtD2lAH0", "useCount": 29}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateItem'
delete_file $TEMP_FILE

#- 75 GetItemByAppId
java -jar ${JAR_PATH} platform getItemByAppId \
    --namespace "test" \
    --appId '6NdcBIgz' \
    >$TEMP_FILE 2>&1
update_status $? 'GetItemByAppId'
delete_file $TEMP_FILE

#- 76 QueryItems
java -jar ${JAR_PATH} platform queryItems \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QueryItems'
delete_file $TEMP_FILE

#- 77 ListBasicItemsByFeatures
java -jar ${JAR_PATH} platform listBasicItemsByFeatures \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListBasicItemsByFeatures'
delete_file $TEMP_FILE

#- 78 GetItemBySku
java -jar ${JAR_PATH} platform getItemBySku \
    --namespace "test" \
    --sku 'rDyWpFBY' \
    >$TEMP_FILE 2>&1
update_status $? 'GetItemBySku'
delete_file $TEMP_FILE

#- 79 GetLocaleItemBySku
java -jar ${JAR_PATH} platform getLocaleItemBySku \
    --namespace "test" \
    --sku 'GmmBawMy' \
    >$TEMP_FILE 2>&1
update_status $? 'GetLocaleItemBySku'
delete_file $TEMP_FILE

#- 80 GetItemIdBySku
java -jar ${JAR_PATH} platform getItemIdBySku \
    --namespace "test" \
    --sku 'oKyNpdAa' \
    >$TEMP_FILE 2>&1
update_status $? 'GetItemIdBySku'
delete_file $TEMP_FILE

#- 81 BulkGetLocaleItems
java -jar ${JAR_PATH} platform bulkGetLocaleItems \
    --namespace "test" \
    --itemIds 'sm8xwUfz' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkGetLocaleItems'
delete_file $TEMP_FILE

#- 82 SearchItems
java -jar ${JAR_PATH} platform searchItems \
    --namespace "test" \
    --keyword 'OlQiZY4N' \
    --language 'bOQXJ7uO' \
    >$TEMP_FILE 2>&1
update_status $? 'SearchItems'
delete_file $TEMP_FILE

#- 83 QueryUncategorizedItems
java -jar ${JAR_PATH} platform queryUncategorizedItems \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QueryUncategorizedItems'
delete_file $TEMP_FILE

#- 84 GetItem
java -jar ${JAR_PATH} platform getItem \
    --itemId 'TzNMvuq2' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetItem'
delete_file $TEMP_FILE

#- 85 UpdateItem
java -jar ${JAR_PATH} platform updateItem \
    --itemId 'tNl4CX4I' \
    --namespace "test" \
    --storeId 'jiK4DEUJ' \
    --body '{"appId": "RVK3l9Eb", "appType": "GAME", "baseAppId": "0RH8vS1s", "boothName": "meOlngrd", "categoryPath": "TXCzaPBt", "clazz": "kZMio4wc", "displayOrder": 48, "entitlementType": "DURABLE", "ext": {"loVS3rYp": {}}, "features": ["8QtcEmCE"], "images": [{"as": "Vc75Ufey", "caption": "pWjDNhzC", "height": 75, "imageUrl": "5sWS2qwO", "smallImageUrl": "763iEklk", "width": 50}], "itemIds": ["Lm88LpLu"], "itemQty": {"YRO3C55y": 66}, "itemType": "BUNDLE", "listable": true, "localizations": {"K2JaqenD": {"description": "Gn7a2NUp", "localExt": {"lWiLjq06": {}}, "longDescription": "n6a0rW8E", "title": "fkpaXtwY"}}, "maxCount": 70, "maxCountPerUser": 0, "name": "Q4WbwNms", "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 38, "fixedTrialCycles": 18, "graceDays": 61}, "regionData": {"urH8eloJ": [{"currencyCode": "zNKtRUaT", "currencyNamespace": "z1ETdsmw", "currencyType": "VIRTUAL", "discountAmount": 19, "discountExpireAt": "1976-03-21T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1978-03-09T00:00:00Z", "discountedPrice": 84, "expireAt": "1976-02-25T00:00:00Z", "price": 4, "purchaseAt": "1991-10-29T00:00:00Z", "trialPrice": 2}]}, "seasonType": "PASS", "sku": "lo6DMNpP", "stackable": true, "status": "INACTIVE", "tags": ["TQ1UpjfU"], "targetCurrencyCode": "6wJhy1jO", "targetNamespace": "VkkUlS79", "thumbnailUrl": "527EZ25I", "useCount": 1}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateItem'
delete_file $TEMP_FILE

#- 86 DeleteItem
java -jar ${JAR_PATH} platform deleteItem \
    --itemId '8uCeZFlL' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteItem'
delete_file $TEMP_FILE

#- 87 AcquireItem
java -jar ${JAR_PATH} platform acquireItem \
    --itemId 'tEVpDAEb' \
    --namespace "test" \
    --body '{"count": 52, "orderNo": "82jy74lq"}' \
    >$TEMP_FILE 2>&1
update_status $? 'AcquireItem'
delete_file $TEMP_FILE

#- 88 GetApp
java -jar ${JAR_PATH} platform getApp \
    --itemId '0pDE5xRw' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetApp'
delete_file $TEMP_FILE

#- 89 UpdateApp
java -jar ${JAR_PATH} platform updateApp \
    --itemId 'h5b45ebp' \
    --namespace "test" \
    --storeId 'cM7ScSs3' \
    --body '{"carousel": [{"alt": "UOpAwIp9", "previewUrl": "rRtn1PcC", "thumbnailUrl": "xdbumeYg", "type": "image", "url": "EBWRQiW3", "videoSource": "vimeo"}], "developer": "FfU8icH4", "forumUrl": "081gRB1G", "genres": ["Racing"], "localizations": {"LfLg4RYu": {"announcement": "EbgUDEcJ", "slogan": "yIvsPwOr"}}, "platformRequirements": {"0BmV5iFv": [{"additionals": "fwFjTSmI", "directXVersion": "EqoLyLeU", "diskSpace": "GmomGX9s", "graphics": "XTZ0v8pq", "label": "Lfc5SwGn", "osVersion": "ReUULDX4", "processor": "QUIbb5nh", "ram": "68ZnyUtR", "soundCard": "vW9hNBSF"}]}, "platforms": ["Linux"], "players": ["MMO"], "primaryGenre": "Indie", "publisher": "OmjkFrFV", "releaseDate": "1984-06-06T00:00:00Z", "websiteUrl": "0xF34Xpt"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateApp'
delete_file $TEMP_FILE

#- 90 DisableItem
java -jar ${JAR_PATH} platform disableItem \
    --itemId '6ZlTTic0' \
    --namespace "test" \
    --storeId 'kr2a0nI2' \
    >$TEMP_FILE 2>&1
update_status $? 'DisableItem'
delete_file $TEMP_FILE

#- 91 GetItemDynamicData
java -jar ${JAR_PATH} platform getItemDynamicData \
    --itemId 'oo7UHCJK' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetItemDynamicData'
delete_file $TEMP_FILE

#- 92 EnableItem
java -jar ${JAR_PATH} platform enableItem \
    --itemId '5sp0aCvI' \
    --namespace "test" \
    --storeId 'q3aHVYIl' \
    >$TEMP_FILE 2>&1
update_status $? 'EnableItem'
delete_file $TEMP_FILE

#- 93 FeatureItem
java -jar ${JAR_PATH} platform featureItem \
    --feature 'ewLRuHY8' \
    --itemId '3bGj0HTe' \
    --namespace "test" \
    --storeId 'eWXlIcRi' \
    >$TEMP_FILE 2>&1
update_status $? 'FeatureItem'
delete_file $TEMP_FILE

#- 94 DefeatureItem
java -jar ${JAR_PATH} platform defeatureItem \
    --feature 'dqctDpyg' \
    --itemId 'Y0ax476E' \
    --namespace "test" \
    --storeId 'D4MMO9Tw' \
    >$TEMP_FILE 2>&1
update_status $? 'DefeatureItem'
delete_file $TEMP_FILE

#- 95 GetLocaleItem
java -jar ${JAR_PATH} platform getLocaleItem \
    --itemId '2JH0qhWI' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetLocaleItem'
delete_file $TEMP_FILE

#- 96 ReturnItem
java -jar ${JAR_PATH} platform returnItem \
    --itemId 'wHWTgzJF' \
    --namespace "test" \
    --body '{"orderNo": "RYw6t1IK"}' \
    >$TEMP_FILE 2>&1
update_status $? 'ReturnItem'
delete_file $TEMP_FILE

#- 97 QueryKeyGroups
java -jar ${JAR_PATH} platform queryKeyGroups \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QueryKeyGroups'
delete_file $TEMP_FILE

#- 98 CreateKeyGroup
java -jar ${JAR_PATH} platform createKeyGroup \
    --namespace "test" \
    --body '{"description": "ZLO6V4Od", "name": "e46QmCid", "status": "ACTIVE", "tags": ["dpP7RTC5"]}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateKeyGroup'
delete_file $TEMP_FILE

#- 99 GetKeyGroup
java -jar ${JAR_PATH} platform getKeyGroup \
    --keyGroupId '87lmUmBz' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetKeyGroup'
delete_file $TEMP_FILE

#- 100 UpdateKeyGroup
java -jar ${JAR_PATH} platform updateKeyGroup \
    --keyGroupId 'iPZBnpOf' \
    --namespace "test" \
    --body '{"description": "kllxfq0N", "name": "srSjw5Ho", "status": "ACTIVE", "tags": ["0blM1d5M"]}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateKeyGroup'
delete_file $TEMP_FILE

#- 101 GetKeyGroupDynamic
java -jar ${JAR_PATH} platform getKeyGroupDynamic \
    --keyGroupId 'StYGczLI' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetKeyGroupDynamic'
delete_file $TEMP_FILE

#- 102 ListKeys
java -jar ${JAR_PATH} platform listKeys \
    --keyGroupId 'NlEC0OEs' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListKeys'
delete_file $TEMP_FILE

#- 103 UploadKeys
java -jar ${JAR_PATH} platform uploadKeys \
    --keyGroupId 'E3yzIsUP' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UploadKeys'
delete_file $TEMP_FILE

#- 104 QueryOrders
java -jar ${JAR_PATH} platform queryOrders \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QueryOrders'
delete_file $TEMP_FILE

#- 105 GetOrderStatistics
java -jar ${JAR_PATH} platform getOrderStatistics \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetOrderStatistics'
delete_file $TEMP_FILE

#- 106 GetOrder
java -jar ${JAR_PATH} platform getOrder \
    --namespace "test" \
    --orderNo '0NjluOrG' \
    >$TEMP_FILE 2>&1
update_status $? 'GetOrder'
delete_file $TEMP_FILE

#- 107 RefundOrder
java -jar ${JAR_PATH} platform refundOrder \
    --namespace "test" \
    --orderNo 'ZTzsLW7F' \
    --body '{"description": "jfs9nIkc"}' \
    >$TEMP_FILE 2>&1
update_status $? 'RefundOrder'
delete_file $TEMP_FILE

#- 108 GetPaymentCallbackConfig
java -jar ${JAR_PATH} platform getPaymentCallbackConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetPaymentCallbackConfig'
delete_file $TEMP_FILE

#- 109 UpdatePaymentCallbackConfig
java -jar ${JAR_PATH} platform updatePaymentCallbackConfig \
    --namespace "test" \
    --body '{"dryRun": false, "notifyUrl": "UEanjKHb", "privateKey": "Xfk1zxdz"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePaymentCallbackConfig'
delete_file $TEMP_FILE

#- 110 QueryPaymentNotifications
java -jar ${JAR_PATH} platform queryPaymentNotifications \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QueryPaymentNotifications'
delete_file $TEMP_FILE

#- 111 QueryPaymentOrders
java -jar ${JAR_PATH} platform queryPaymentOrders \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QueryPaymentOrders'
delete_file $TEMP_FILE

#- 112 CreatePaymentOrderByDedicated
java -jar ${JAR_PATH} platform createPaymentOrderByDedicated \
    --namespace "test" \
    --body '{"currencyCode": "xg0UXcRy", "currencyNamespace": "Hi3u8BzV", "customParameters": {"Wu1tOmhU": {}}, "description": "tCgcpvGr", "extOrderNo": "EbcZUDEx", "extUserId": "H1tayOGX", "itemType": "SEASON", "language": "rJmc-IJLR", "metadata": {"pyyEcQxV": "gJIjMZqc"}, "notifyUrl": "WfMl6dqr", "omitNotification": false, "price": 59, "recurringPaymentOrderNo": "4tnc3ZRB", "region": "3IkdtPfA", "returnUrl": "JEomwenJ", "sandbox": true, "sku": "Q8grtQSv", "subscriptionId": "6EcALcMI", "targetNamespace": "Pms5bT51", "targetUserId": "M4yko8S0", "title": "EnGLvGvf"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreatePaymentOrderByDedicated'
delete_file $TEMP_FILE

#- 113 ListExtOrderNoByExtTxId
java -jar ${JAR_PATH} platform listExtOrderNoByExtTxId \
    --namespace "test" \
    --extTxId 'uSyCTyjj' \
    >$TEMP_FILE 2>&1
update_status $? 'ListExtOrderNoByExtTxId'
delete_file $TEMP_FILE

#- 114 GetPaymentOrder
java -jar ${JAR_PATH} platform getPaymentOrder \
    --namespace "test" \
    --paymentOrderNo '4mCaiuMG' \
    >$TEMP_FILE 2>&1
update_status $? 'GetPaymentOrder'
delete_file $TEMP_FILE

#- 115 ChargePaymentOrder
java -jar ${JAR_PATH} platform chargePaymentOrder \
    --namespace "test" \
    --paymentOrderNo 'KOF5GJJo' \
    --body '{"extTxId": "oSXUl3YU", "paymentMethod": "35QHGpBA", "paymentProvider": "WXPAY"}' \
    >$TEMP_FILE 2>&1
update_status $? 'ChargePaymentOrder'
delete_file $TEMP_FILE

#- 116 RefundPaymentOrderByDedicated
java -jar ${JAR_PATH} platform refundPaymentOrderByDedicated \
    --namespace "test" \
    --paymentOrderNo 'nOlxDznI' \
    --body '{"description": "CQVyqBg3"}' \
    >$TEMP_FILE 2>&1
update_status $? 'RefundPaymentOrderByDedicated'
delete_file $TEMP_FILE

#- 117 SimulatePaymentOrderNotification
java -jar ${JAR_PATH} platform simulatePaymentOrderNotification \
    --namespace "test" \
    --paymentOrderNo '4WTtDkn0' \
    --body '{"amount": 34, "currencyCode": "tn6t0Yx4", "notifyType": "REFUND", "paymentProvider": "PAYPAL", "salesTax": 1, "vat": 84}' \
    >$TEMP_FILE 2>&1
update_status $? 'SimulatePaymentOrderNotification'
delete_file $TEMP_FILE

#- 118 GetPaymentOrderChargeStatus
java -jar ${JAR_PATH} platform getPaymentOrderChargeStatus \
    --namespace "test" \
    --paymentOrderNo '1rUQYCNT' \
    >$TEMP_FILE 2>&1
update_status $? 'GetPaymentOrderChargeStatus'
delete_file $TEMP_FILE

#- 119 CreateReward
java -jar ${JAR_PATH} platform createReward \
    --namespace "test" \
    --body '{"description": "iDX4jE3M", "eventTopic": "2IsTHu8Q", "maxAwarded": 44, "maxAwardedPerUser": 79, "namespaceExpression": "yOlXfIWd", "rewardCode": "0mcq5T4S", "rewardConditions": [{"condition": "Uc7cWfCK", "conditionName": "K6Dij1gF", "eventName": "cenEMySP", "rewardItems": [{"duration": 11, "itemId": "hxBenDiT", "quantity": 16}]}], "userIdExpression": "AqFYmFKj"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateReward'
delete_file $TEMP_FILE

#- 120 QueryRewards
java -jar ${JAR_PATH} platform queryRewards \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QueryRewards'
delete_file $TEMP_FILE

#- 121 ExportRewards
java -jar ${JAR_PATH} platform exportRewards \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ExportRewards'
delete_file $TEMP_FILE

#- 122 ImportRewards
java -jar ${JAR_PATH} platform importRewards \
    --namespace "test" \
    --replaceExisting
    >$TEMP_FILE 2>&1
update_status $? 'ImportRewards'
delete_file $TEMP_FILE

#- 123 GetReward
java -jar ${JAR_PATH} platform getReward \
    --namespace "test" \
    --rewardId 'aELmmll6' \
    >$TEMP_FILE 2>&1
update_status $? 'GetReward'
delete_file $TEMP_FILE

#- 124 UpdateReward
java -jar ${JAR_PATH} platform updateReward \
    --namespace "test" \
    --rewardId 'oexId1OK' \
    --body '{"description": "GUN2Uznd", "eventTopic": "7uVa7t14", "maxAwarded": 48, "maxAwardedPerUser": 43, "namespaceExpression": "SYSV52bH", "rewardCode": "ifCIf4ts", "rewardConditions": [{"condition": "uu6Pkam6", "conditionName": "tFSYFt4Z", "eventName": "xA2PzZFR", "rewardItems": [{"duration": 20, "itemId": "BNlg6hn5", "quantity": 33}]}], "userIdExpression": "usKyZAuV"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateReward'
delete_file $TEMP_FILE

#- 125 DeleteReward
java -jar ${JAR_PATH} platform deleteReward \
    --namespace "test" \
    --rewardId '6uUvqM0l' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteReward'
delete_file $TEMP_FILE

#- 126 CheckEventCondition
java -jar ${JAR_PATH} platform checkEventCondition \
    --namespace "test" \
    --rewardId 'V6UZMlEb' \
    --body '{"payload": {"xHNgJRiQ": {}}}' \
    >$TEMP_FILE 2>&1
update_status $? 'CheckEventCondition'
delete_file $TEMP_FILE

#- 127 ListStores
java -jar ${JAR_PATH} platform listStores \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListStores'
delete_file $TEMP_FILE

#- 128 CreateStore
java -jar ${JAR_PATH} platform createStore \
    --namespace "test" \
    --body '{"defaultLanguage": "ExaunjdA", "defaultRegion": "qnHUz44t", "description": "x4O6hamP", "supportedLanguages": ["wNoi071e"], "supportedRegions": ["zDK56JFI"], "title": "Ge1IMUCL"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateStore'
delete_file $TEMP_FILE

#- 129 ImportStore
java -jar ${JAR_PATH} platform importStore \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ImportStore'
delete_file $TEMP_FILE

#- 130 GetPublishedStore
java -jar ${JAR_PATH} platform getPublishedStore \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetPublishedStore'
delete_file $TEMP_FILE

#- 131 DeletePublishedStore
java -jar ${JAR_PATH} platform deletePublishedStore \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeletePublishedStore'
delete_file $TEMP_FILE

#- 132 GetPublishedStoreBackup
java -jar ${JAR_PATH} platform getPublishedStoreBackup \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetPublishedStoreBackup'
delete_file $TEMP_FILE

#- 133 RollbackPublishedStore
java -jar ${JAR_PATH} platform rollbackPublishedStore \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RollbackPublishedStore'
delete_file $TEMP_FILE

#- 134 GetStore
java -jar ${JAR_PATH} platform getStore \
    --namespace "test" \
    --storeId 'cN0DsaD5' \
    >$TEMP_FILE 2>&1
update_status $? 'GetStore'
delete_file $TEMP_FILE

#- 135 UpdateStore
java -jar ${JAR_PATH} platform updateStore \
    --namespace "test" \
    --storeId 'FyBsFe9O' \
    --body '{"defaultLanguage": "YEJVsYff", "defaultRegion": "mhyx6J25", "description": "PrM4S3cB", "supportedLanguages": ["8m17hEeL"], "supportedRegions": ["LgoaYth6"], "title": "zcf8eA45"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateStore'
delete_file $TEMP_FILE

#- 136 DeleteStore
java -jar ${JAR_PATH} platform deleteStore \
    --namespace "test" \
    --storeId 'OMvObWej' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteStore'
delete_file $TEMP_FILE

#- 137 CloneStore
java -jar ${JAR_PATH} platform cloneStore \
    --namespace "test" \
    --storeId 'o9LfGeeg' \
    >$TEMP_FILE 2>&1
update_status $? 'CloneStore'
delete_file $TEMP_FILE

#- 138 ExportStore
java -jar ${JAR_PATH} platform exportStore \
    --namespace "test" \
    --storeId 'JMaBGR6D' \
    >$TEMP_FILE 2>&1
update_status $? 'ExportStore'
delete_file $TEMP_FILE

#- 139 QuerySubscriptions
java -jar ${JAR_PATH} platform querySubscriptions \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QuerySubscriptions'
delete_file $TEMP_FILE

#- 140 RecurringChargeSubscription
java -jar ${JAR_PATH} platform recurringChargeSubscription \
    --namespace "test" \
    --subscriptionId '1ZoZEZQk' \
    >$TEMP_FILE 2>&1
update_status $? 'RecurringChargeSubscription'
delete_file $TEMP_FILE

#- 141 GetTicketDynamic
java -jar ${JAR_PATH} platform getTicketDynamic \
    --boothName 'J8DSqFnh' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetTicketDynamic'
delete_file $TEMP_FILE

#- 142 DecreaseTicketSale
java -jar ${JAR_PATH} platform decreaseTicketSale \
    --boothName 'dKvjFCFb' \
    --namespace "test" \
    --body '{"orderNo": "SFlEWoMP"}' \
    >$TEMP_FILE 2>&1
update_status $? 'DecreaseTicketSale'
delete_file $TEMP_FILE

#- 143 GetTicketBoothID
java -jar ${JAR_PATH} platform getTicketBoothID \
    --boothName 'dgK5zn62' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetTicketBoothID'
delete_file $TEMP_FILE

#- 144 IncreaseTicketSale
java -jar ${JAR_PATH} platform increaseTicketSale \
    --boothName 'mhnFSpCT' \
    --namespace "test" \
    --body '{"count": 22, "orderNo": "DNBOcygv"}' \
    >$TEMP_FILE 2>&1
update_status $? 'IncreaseTicketSale'
delete_file $TEMP_FILE

#- 145 AnonymizeCampaign
java -jar ${JAR_PATH} platform anonymizeCampaign \
    --namespace "test" \
    --userId 'v2LAgfBG' \
    >$TEMP_FILE 2>&1
update_status $? 'AnonymizeCampaign'
delete_file $TEMP_FILE

#- 146 AnonymizeEntitlement
java -jar ${JAR_PATH} platform anonymizeEntitlement \
    --namespace "test" \
    --userId 'VzanbKYs' \
    >$TEMP_FILE 2>&1
update_status $? 'AnonymizeEntitlement'
delete_file $TEMP_FILE

#- 147 AnonymizeFulfillment
java -jar ${JAR_PATH} platform anonymizeFulfillment \
    --namespace "test" \
    --userId 'B0gqJ8Vh' \
    >$TEMP_FILE 2>&1
update_status $? 'AnonymizeFulfillment'
delete_file $TEMP_FILE

#- 148 AnonymizeIntegration
java -jar ${JAR_PATH} platform anonymizeIntegration \
    --namespace "test" \
    --userId 'YSikJl2p' \
    >$TEMP_FILE 2>&1
update_status $? 'AnonymizeIntegration'
delete_file $TEMP_FILE

#- 149 AnonymizeOrder
java -jar ${JAR_PATH} platform anonymizeOrder \
    --namespace "test" \
    --userId '9rBx8N5e' \
    >$TEMP_FILE 2>&1
update_status $? 'AnonymizeOrder'
delete_file $TEMP_FILE

#- 150 AnonymizePayment
java -jar ${JAR_PATH} platform anonymizePayment \
    --namespace "test" \
    --userId 'gapqxDy4' \
    >$TEMP_FILE 2>&1
update_status $? 'AnonymizePayment'
delete_file $TEMP_FILE

#- 151 AnonymizeSubscription
java -jar ${JAR_PATH} platform anonymizeSubscription \
    --namespace "test" \
    --userId 'cLfNjzzE' \
    >$TEMP_FILE 2>&1
update_status $? 'AnonymizeSubscription'
delete_file $TEMP_FILE

#- 152 AnonymizeWallet
java -jar ${JAR_PATH} platform anonymizeWallet \
    --namespace "test" \
    --userId 'ZYA8jIkM' \
    >$TEMP_FILE 2>&1
update_status $? 'AnonymizeWallet'
delete_file $TEMP_FILE

#- 153 QueryUserEntitlements
java -jar ${JAR_PATH} platform queryUserEntitlements \
    --namespace "test" \
    --userId 'Jb7cZ2bP' \
    >$TEMP_FILE 2>&1
update_status $? 'QueryUserEntitlements'
delete_file $TEMP_FILE

#- 154 GrantUserEntitlement
java -jar ${JAR_PATH} platform grantUserEntitlement \
    --namespace "test" \
    --userId 'saLLpEBV' \
    --body '[{"endDate": "1986-11-02T00:00:00Z", "grantedCode": "k5AsKaF2", "itemId": "P44lXkI3", "itemNamespace": "zdiRiC5I", "language": "pI_OINd", "quantity": 83, "region": "u5V6QSYx", "source": "GIFT", "startDate": "1994-11-19T00:00:00Z", "storeId": "ryVuZYmg"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'GrantUserEntitlement'
delete_file $TEMP_FILE

#- 155 GetUserAppEntitlementByAppId
java -jar ${JAR_PATH} platform getUserAppEntitlementByAppId \
    --namespace "test" \
    --userId 'UeEPB5AG' \
    --appId 'Pgvk0Zth' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserAppEntitlementByAppId'
delete_file $TEMP_FILE

#- 156 QueryUserEntitlementsByAppType
java -jar ${JAR_PATH} platform queryUserEntitlementsByAppType \
    --namespace "test" \
    --userId 'aj0EBA4a' \
    --appType 'SOFTWARE' \
    >$TEMP_FILE 2>&1
update_status $? 'QueryUserEntitlementsByAppType'
delete_file $TEMP_FILE

#- 157 GetUserEntitlementByItemId
java -jar ${JAR_PATH} platform getUserEntitlementByItemId \
    --namespace "test" \
    --userId 'Rz0d56sm' \
    --itemId 'obor4p1P' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserEntitlementByItemId'
delete_file $TEMP_FILE

#- 158 GetUserEntitlementBySku
java -jar ${JAR_PATH} platform getUserEntitlementBySku \
    --namespace "test" \
    --userId 'lgQB9EcN' \
    --sku 'GOeBRY6G' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserEntitlementBySku'
delete_file $TEMP_FILE

#- 159 ExistsAnyUserActiveEntitlement
java -jar ${JAR_PATH} platform existsAnyUserActiveEntitlement \
    --namespace "test" \
    --userId '5ae07deD' \
    >$TEMP_FILE 2>&1
update_status $? 'ExistsAnyUserActiveEntitlement'
delete_file $TEMP_FILE

#- 160 ExistsAnyUserActiveEntitlementByItemIds
java -jar ${JAR_PATH} platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "test" \
    --userId 'LaZ8JCvb' \
    --itemIds '["eTfW0hgz"]' \
    >$TEMP_FILE 2>&1
update_status $? 'ExistsAnyUserActiveEntitlementByItemIds'
delete_file $TEMP_FILE

#- 161 GetUserAppEntitlementOwnershipByAppId
java -jar ${JAR_PATH} platform getUserAppEntitlementOwnershipByAppId \
    --namespace "test" \
    --userId 'rabLJxEw' \
    --appId 'JrEBmQ64' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserAppEntitlementOwnershipByAppId'
delete_file $TEMP_FILE

#- 162 GetUserEntitlementOwnershipByItemId
java -jar ${JAR_PATH} platform getUserEntitlementOwnershipByItemId \
    --namespace "test" \
    --userId 'haNOzlGu' \
    --itemId '68UYyupj' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserEntitlementOwnershipByItemId'
delete_file $TEMP_FILE

#- 163 GetUserEntitlementOwnershipBySku
java -jar ${JAR_PATH} platform getUserEntitlementOwnershipBySku \
    --namespace "test" \
    --userId 'dDetnoT0' \
    --sku 'rfWtVPwQ' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserEntitlementOwnershipBySku'
delete_file $TEMP_FILE

#- 164 RevokeUserEntitlements
java -jar ${JAR_PATH} platform revokeUserEntitlements \
    --namespace "test" \
    --userId 'fq6V92gb' \
    --entitlementIds 'fPouNdmP' \
    >$TEMP_FILE 2>&1
update_status $? 'RevokeUserEntitlements'
delete_file $TEMP_FILE

#- 165 GetUserEntitlement
java -jar ${JAR_PATH} platform getUserEntitlement \
    --entitlementId '7fckVnuD' \
    --namespace "test" \
    --userId 'GvYIb1p5' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserEntitlement'
delete_file $TEMP_FILE

#- 166 UpdateUserEntitlement
java -jar ${JAR_PATH} platform updateUserEntitlement \
    --entitlementId 'tcR5z8ZJ' \
    --namespace "test" \
    --userId 'LjSHcaR3' \
    --body '{"endDate": "1995-06-01T00:00:00Z", "nullFieldList": ["Zmwr0QmO"], "startDate": "1977-05-30T00:00:00Z", "status": "REVOKED", "useCount": 13}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateUserEntitlement'
delete_file $TEMP_FILE

#- 167 ConsumeUserEntitlement
java -jar ${JAR_PATH} platform consumeUserEntitlement \
    --entitlementId '49eXp0xQ' \
    --namespace "test" \
    --userId 'kZ2JjuwW' \
    --body '{"useCount": 96}' \
    >$TEMP_FILE 2>&1
update_status $? 'ConsumeUserEntitlement'
delete_file $TEMP_FILE

#- 168 DisableUserEntitlement
java -jar ${JAR_PATH} platform disableUserEntitlement \
    --entitlementId 'y0tU11PC' \
    --namespace "test" \
    --userId 'eSrvejUK' \
    >$TEMP_FILE 2>&1
update_status $? 'DisableUserEntitlement'
delete_file $TEMP_FILE

#- 169 EnableUserEntitlement
java -jar ${JAR_PATH} platform enableUserEntitlement \
    --entitlementId 'wVfF37Vr' \
    --namespace "test" \
    --userId '7mkDzFBI' \
    >$TEMP_FILE 2>&1
update_status $? 'EnableUserEntitlement'
delete_file $TEMP_FILE

#- 170 GetUserEntitlementHistories
java -jar ${JAR_PATH} platform getUserEntitlementHistories \
    --entitlementId '1VwhkVSK' \
    --namespace "test" \
    --userId 'DlNFOUHB' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserEntitlementHistories'
delete_file $TEMP_FILE

#- 171 RevokeUserEntitlement
java -jar ${JAR_PATH} platform revokeUserEntitlement \
    --entitlementId 'JsvTsqk9' \
    --namespace "test" \
    --userId 'hg4hj6nU' \
    >$TEMP_FILE 2>&1
update_status $? 'RevokeUserEntitlement'
delete_file $TEMP_FILE

#- 172 FulfillItem
java -jar ${JAR_PATH} platform fulfillItem \
    --namespace "test" \
    --userId 'debW6Usk' \
    --body '{"duration": 3, "endDate": "1991-03-24T00:00:00Z", "itemId": "kZAk01f1", "itemSku": "KxCtWADU", "language": "2guN6U9w", "order": {"currency": {"currencyCode": "13W1K9TZ", "currencySymbol": "Q4qRLEi5", "currencyType": "VIRTUAL", "decimals": 29, "namespace": "wE36rfmM"}, "ext": {"0CCs35TP": {}}, "free": false}, "orderNo": "sY8WgwSx", "quantity": 58, "region": "I5GH9bv9", "source": "ACHIEVEMENT", "startDate": "1998-09-19T00:00:00Z", "storeId": "pA6pzjHp"}' \
    >$TEMP_FILE 2>&1
update_status $? 'FulfillItem'
delete_file $TEMP_FILE

#- 173 RedeemCode
java -jar ${JAR_PATH} platform redeemCode \
    --namespace "test" \
    --userId 'ZO0E9iLg' \
    --body '{"code": "RPJK3nBa", "language": "go", "region": "Qrqra0Pt"}' \
    >$TEMP_FILE 2>&1
update_status $? 'RedeemCode'
delete_file $TEMP_FILE

#- 174 FulfillRewards
java -jar ${JAR_PATH} platform fulfillRewards \
    --namespace "test" \
    --userId 'kfvOpY2r' \
    --body '{"rewards": [{"currency": {"currencyCode": "amp5lnBn", "namespace": "6xmBkfMt"}, "item": {"itemId": "C66hFq0k", "itemSku": "POkORm2X", "itemType": "jlNEE5ec"}, "quantity": 83, "type": "CURRENCY"}], "source": "REWARD"}' \
    >$TEMP_FILE 2>&1
update_status $? 'FulfillRewards'
delete_file $TEMP_FILE

#- 175 QueryUserIAPOrders
java -jar ${JAR_PATH} platform queryUserIAPOrders \
    --namespace "test" \
    --userId 'mi0ySJHf' \
    >$TEMP_FILE 2>&1
update_status $? 'QueryUserIAPOrders'
delete_file $TEMP_FILE

#- 176 QueryAllUserIAPOrders
java -jar ${JAR_PATH} platform queryAllUserIAPOrders \
    --namespace "test" \
    --userId 'PloP1XkY' \
    >$TEMP_FILE 2>&1
update_status $? 'QueryAllUserIAPOrders'
delete_file $TEMP_FILE

#- 177 MockFulfillIAPItem
java -jar ${JAR_PATH} platform mockFulfillIAPItem \
    --namespace "test" \
    --userId 'K4MgIsDS' \
    --body '{"language": "mpY-586", "productId": "IDJuDoSh", "region": "MMftll8N", "type": "STADIA"}' \
    >$TEMP_FILE 2>&1
update_status $? 'MockFulfillIAPItem'
delete_file $TEMP_FILE

#- 178 QueryUserOrders
java -jar ${JAR_PATH} platform queryUserOrders \
    --namespace "test" \
    --userId 'ChHz9urm' \
    >$TEMP_FILE 2>&1
update_status $? 'QueryUserOrders'
delete_file $TEMP_FILE

#- 179 CountOfPurchasedItem
java -jar ${JAR_PATH} platform countOfPurchasedItem \
    --namespace "test" \
    --userId 't7QWvE8s' \
    --itemId '6Uz8BRuY' \
    >$TEMP_FILE 2>&1
update_status $? 'CountOfPurchasedItem'
delete_file $TEMP_FILE

#- 180 GetUserOrder
java -jar ${JAR_PATH} platform getUserOrder \
    --namespace "test" \
    --orderNo 'WDTtL6MT' \
    --userId 'TRkCbb9S' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserOrder'
delete_file $TEMP_FILE

#- 181 UpdateUserOrderStatus
java -jar ${JAR_PATH} platform updateUserOrderStatus \
    --namespace "test" \
    --orderNo '5Q1IVHGT' \
    --userId '88prREBg' \
    --body '{"status": "DELETED", "statusReason": "WdHJ9Jum"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateUserOrderStatus'
delete_file $TEMP_FILE

#- 182 FulfillUserOrder
java -jar ${JAR_PATH} platform fulfillUserOrder \
    --namespace "test" \
    --orderNo 'ohtU13gf' \
    --userId '7TRigNZj' \
    >$TEMP_FILE 2>&1
update_status $? 'FulfillUserOrder'
delete_file $TEMP_FILE

#- 183 GetUserOrderGrant
java -jar ${JAR_PATH} platform getUserOrderGrant \
    --namespace "test" \
    --orderNo '5w5y3HmK' \
    --userId '8QVOa62e' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserOrderGrant'
delete_file $TEMP_FILE

#- 184 GetUserOrderHistories
java -jar ${JAR_PATH} platform getUserOrderHistories \
    --namespace "test" \
    --orderNo 'QZtbLLcF' \
    --userId '671WLtv3' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserOrderHistories'
delete_file $TEMP_FILE

#- 185 ProcessUserOrderNotification
java -jar ${JAR_PATH} platform processUserOrderNotification \
    --namespace "test" \
    --orderNo '8Hecczop' \
    --userId 'FmeRwpcJ' \
    --body '{"additionalData": {"cardSummary": "BZyi3mLC"}, "authorisedTime": "1999-10-11T00:00:00Z", "chargebackReversedTime": "1983-02-07T00:00:00Z", "chargebackTime": "1976-03-06T00:00:00Z", "chargedTime": "1993-07-16T00:00:00Z", "createdTime": "1973-07-12T00:00:00Z", "currency": {"currencyCode": "olnOQt0j", "currencySymbol": "oVHgCytC", "currencyType": "REAL", "decimals": 86, "namespace": "G98YxnHb"}, "customParameters": {"RdoTKKeu": {}}, "extOrderNo": "SjfZe9i1", "extTxId": "osghF1hz", "extUserId": "i1Nl47sy", "issuedAt": "1988-03-06T00:00:00Z", "metadata": {"bzSHZeCL": "IvWPVRsd"}, "namespace": "EqA61yTr", "nonceStr": "MgsycTgm", "paymentMethod": "Pzc20EuO", "paymentMethodFee": 7, "paymentOrderNo": "MqGDlSZP", "paymentProvider": "CHECKOUT", "paymentProviderFee": 61, "paymentStationUrl": "VSjzHjL6", "price": 2, "refundedTime": "1995-03-13T00:00:00Z", "salesTax": 64, "sandbox": true, "sku": "Smpp3op8", "status": "AUTHORISED", "statusReason": "taRLxtW4", "subscriptionId": "PvFkESTU", "subtotalPrice": 74, "targetNamespace": "at5F1Le7", "targetUserId": "cR7q6PWh", "tax": 24, "totalPrice": 25, "totalTax": 72, "txEndTime": "1983-03-08T00:00:00Z", "type": "1Tp78Fip", "userId": "JHahViJv", "vat": 75}' \
    >$TEMP_FILE 2>&1
update_status $? 'ProcessUserOrderNotification'
delete_file $TEMP_FILE

#- 186 DownloadUserOrderReceipt
java -jar ${JAR_PATH} platform downloadUserOrderReceipt \
    --namespace "test" \
    --orderNo 'YW0kdmlk' \
    --userId '2luqSOOA' \
    >$TEMP_FILE 2>&1
update_status $? 'DownloadUserOrderReceipt'
delete_file $TEMP_FILE

#- 187 CreateUserPaymentOrder
java -jar ${JAR_PATH} platform createUserPaymentOrder \
    --namespace "test" \
    --userId '2VOZBoNb' \
    --body '{"currencyCode": "B98PuSGy", "currencyNamespace": "kqFzPwSM", "customParameters": {"XT53bBuL": {}}, "description": "38beOYDV", "extOrderNo": "uHZQ9LYt", "extUserId": "6w23Wf8i", "itemType": "MEDIA", "language": "OShA", "metadata": {"DlDyGcsf": "IuI4Dv5l"}, "notifyUrl": "EJpK1AyR", "omitNotification": false, "price": 51, "recurringPaymentOrderNo": "srRXEFZi", "region": "vQOHG6wV", "returnUrl": "icNratsv", "sandbox": true, "sku": "HLmIohfN", "subscriptionId": "ISLXMDWD", "title": "dm5FE4ll"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateUserPaymentOrder'
delete_file $TEMP_FILE

#- 188 RefundUserPaymentOrder
java -jar ${JAR_PATH} platform refundUserPaymentOrder \
    --namespace "test" \
    --paymentOrderNo 'iQMnutJb' \
    --userId 'pEo4mUNH' \
    --body '{"description": "Ftdml2xN"}' \
    >$TEMP_FILE 2>&1
update_status $? 'RefundUserPaymentOrder'
delete_file $TEMP_FILE

#- 189 ApplyUserRedemption
java -jar ${JAR_PATH} platform applyUserRedemption \
    --namespace "test" \
    --userId 'viWacJc3' \
    --body '{"code": "Fm7Z548u", "orderNo": "uKgoCBqS"}' \
    >$TEMP_FILE 2>&1
update_status $? 'ApplyUserRedemption'
delete_file $TEMP_FILE

#- 190 QueryUserSubscriptions
java -jar ${JAR_PATH} platform queryUserSubscriptions \
    --namespace "test" \
    --userId '5uIdCbwC' \
    >$TEMP_FILE 2>&1
update_status $? 'QueryUserSubscriptions'
delete_file $TEMP_FILE

#- 191 GetUserSubscriptionActivities
java -jar ${JAR_PATH} platform getUserSubscriptionActivities \
    --namespace "test" \
    --userId 'eeq9ouEd' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserSubscriptionActivities'
delete_file $TEMP_FILE

#- 192 PlatformSubscribeSubscription
java -jar ${JAR_PATH} platform platformSubscribeSubscription \
    --namespace "test" \
    --userId 'DtjOgsyp' \
    --body '{"grantDays": 74, "itemId": "km2ZYew5", "language": "H7Zm0gnY", "reason": "yj6MXf9G", "region": "1ntyebvo", "source": "eHenAALK"}' \
    >$TEMP_FILE 2>&1
update_status $? 'PlatformSubscribeSubscription'
delete_file $TEMP_FILE

#- 193 CheckUserSubscriptionSubscribableByItemId
java -jar ${JAR_PATH} platform checkUserSubscriptionSubscribableByItemId \
    --namespace "test" \
    --userId 't7EfxIH4' \
    --itemId '46oUnP2S' \
    >$TEMP_FILE 2>&1
update_status $? 'CheckUserSubscriptionSubscribableByItemId'
delete_file $TEMP_FILE

#- 194 GetUserSubscription
java -jar ${JAR_PATH} platform getUserSubscription \
    --namespace "test" \
    --subscriptionId '74unXwg0' \
    --userId 'JKqVWW1r' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserSubscription'
delete_file $TEMP_FILE

#- 195 DeleteUserSubscription
java -jar ${JAR_PATH} platform deleteUserSubscription \
    --namespace "test" \
    --subscriptionId 'jK1epwkA' \
    --userId 'vcsYvbgf' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteUserSubscription'
delete_file $TEMP_FILE

#- 196 CancelSubscription
java -jar ${JAR_PATH} platform cancelSubscription \
    --namespace "test" \
    --subscriptionId 'BVPpTa8Y' \
    --userId 'uq7TKiNX' \
    --body '{"immediate": false, "reason": "z7eMrMD5"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CancelSubscription'
delete_file $TEMP_FILE

#- 197 GrantDaysToSubscription
java -jar ${JAR_PATH} platform grantDaysToSubscription \
    --namespace "test" \
    --subscriptionId 'TbaUxTCT' \
    --userId 'ng0xjtdB' \
    --body '{"grantDays": 35, "reason": "js3Kiykt"}' \
    >$TEMP_FILE 2>&1
update_status $? 'GrantDaysToSubscription'
delete_file $TEMP_FILE

#- 198 GetUserSubscriptionBillingHistories
java -jar ${JAR_PATH} platform getUserSubscriptionBillingHistories \
    --namespace "test" \
    --subscriptionId '2Ck2gOlS' \
    --userId 'atECZ2Ug' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserSubscriptionBillingHistories'
delete_file $TEMP_FILE

#- 199 ProcessUserSubscriptionNotification
java -jar ${JAR_PATH} platform processUserSubscriptionNotification \
    --namespace "test" \
    --subscriptionId 'wQLqDqYS' \
    --userId 'xTPuVlBq' \
    --body '{"additionalData": {"cardSummary": "irdp3yxn"}, "authorisedTime": "1980-08-27T00:00:00Z", "chargebackReversedTime": "1993-03-25T00:00:00Z", "chargebackTime": "1997-12-14T00:00:00Z", "chargedTime": "1981-02-26T00:00:00Z", "createdTime": "1992-06-05T00:00:00Z", "currency": {"currencyCode": "dsjIhXdx", "currencySymbol": "iSoWpnnx", "currencyType": "REAL", "decimals": 99, "namespace": "7BCPMqzQ"}, "customParameters": {"IxibhpNY": {}}, "extOrderNo": "sHtdB3Ik", "extTxId": "juaZqhJi", "extUserId": "lrZkSSKg", "issuedAt": "1991-05-16T00:00:00Z", "metadata": {"xCR77G9d": "5CA1GORS"}, "namespace": "bL9n0dbW", "nonceStr": "DEupmdLQ", "paymentMethod": "zPnNfBAc", "paymentMethodFee": 97, "paymentOrderNo": "ArbkCfdH", "paymentProvider": "WALLET", "paymentProviderFee": 28, "paymentStationUrl": "tqmBuS9V", "price": 30, "refundedTime": "1985-09-21T00:00:00Z", "salesTax": 24, "sandbox": false, "sku": "0lpJ4JLl", "status": "CHARGE_FAILED", "statusReason": "i7L2oDUo", "subscriptionId": "VRUb39j2", "subtotalPrice": 83, "targetNamespace": "4Sp09cKm", "targetUserId": "jRUbZVBV", "tax": 88, "totalPrice": 81, "totalTax": 73, "txEndTime": "1998-05-14T00:00:00Z", "type": "dcsckMek", "userId": "ROWZ2KUT", "vat": 33}' \
    >$TEMP_FILE 2>&1
update_status $? 'ProcessUserSubscriptionNotification'
delete_file $TEMP_FILE

#- 200 AcquireUserTicket
java -jar ${JAR_PATH} platform acquireUserTicket \
    --boothName 'kK2eFaGL' \
    --namespace "test" \
    --userId 'oSmEEPbL' \
    --body '{"count": 48, "orderNo": "wJsyUie6"}' \
    >$TEMP_FILE 2>&1
update_status $? 'AcquireUserTicket'
delete_file $TEMP_FILE

#- 201 CheckWallet
java -jar ${JAR_PATH} platform checkWallet \
    --currencyCode 'fZgLllUP' \
    --namespace "test" \
    --userId 'sO8lg46S' \
    >$TEMP_FILE 2>&1
update_status $? 'CheckWallet'
delete_file $TEMP_FILE

#- 202 CreditUserWallet
java -jar ${JAR_PATH} platform creditUserWallet \
    --currencyCode 'i7006vL2' \
    --namespace "test" \
    --userId 'w4aajDAO' \
    --body '{"amount": 47, "reason": "0iJjYlea", "source": "PROMOTION"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreditUserWallet'
delete_file $TEMP_FILE

#- 203 PayWithUserWallet
java -jar ${JAR_PATH} platform payWithUserWallet \
    --currencyCode 'tqv2Wklj' \
    --namespace "test" \
    --userId 'QuD5mnJO' \
    --body '{"amount": 78}' \
    >$TEMP_FILE 2>&1
update_status $? 'PayWithUserWallet'
delete_file $TEMP_FILE

#- 204 GetUserWallet
java -jar ${JAR_PATH} platform getUserWallet \
    --namespace "test" \
    --userId 'qHGq8mB7' \
    --walletId 'mF2lMFca' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserWallet'
delete_file $TEMP_FILE

#- 205 DebitUserWallet
java -jar ${JAR_PATH} platform debitUserWallet \
    --namespace "test" \
    --userId 'ghFXJIJf' \
    --walletId 'lRHFcsIq' \
    --body '{"amount": 57, "reason": "y4xDifSS"}' \
    >$TEMP_FILE 2>&1
update_status $? 'DebitUserWallet'
delete_file $TEMP_FILE

#- 206 DisableUserWallet
java -jar ${JAR_PATH} platform disableUserWallet \
    --namespace "test" \
    --userId 'Q5On2ccE' \
    --walletId 'cl3xeiO4' \
    >$TEMP_FILE 2>&1
update_status $? 'DisableUserWallet'
delete_file $TEMP_FILE

#- 207 EnableUserWallet
java -jar ${JAR_PATH} platform enableUserWallet \
    --namespace "test" \
    --userId 'bwF5JOjG' \
    --walletId 'oGxKM3qM' \
    >$TEMP_FILE 2>&1
update_status $? 'EnableUserWallet'
delete_file $TEMP_FILE

#- 208 ListUserWalletTransactions
java -jar ${JAR_PATH} platform listUserWalletTransactions \
    --namespace "test" \
    --userId 'ce5tfLcp' \
    --walletId 'jFZMKCbp' \
    >$TEMP_FILE 2>&1
update_status $? 'ListUserWalletTransactions'
delete_file $TEMP_FILE

#- 209 QueryWallets
java -jar ${JAR_PATH} platform queryWallets \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QueryWallets'
delete_file $TEMP_FILE

#- 210 GetWallet
java -jar ${JAR_PATH} platform getWallet \
    --namespace "test" \
    --walletId '0pEbLCLF' \
    >$TEMP_FILE 2>&1
update_status $? 'GetWallet'
delete_file $TEMP_FILE

#- 211 SyncOrders
java -jar ${JAR_PATH} platform syncOrders \
    --end 'pHxMYF83' \
    --start '6075xEpz' \
    >$TEMP_FILE 2>&1
update_status $? 'SyncOrders'
delete_file $TEMP_FILE

#- 212 TestAdyenConfig
java -jar ${JAR_PATH} platform testAdyenConfig \
    --body '{"allowedPaymentMethods": ["dnYtpja5"], "apiKey": "ig2isQZg", "authoriseAsCapture": false, "blockedPaymentMethods": ["6Vy76izP"], "clientKey": "iQRjYa8f", "dropInSettings": "v5fIt22t", "liveEndpointUrlPrefix": "IZhjhgki", "merchantAccount": "gW22zXMW", "notificationHmacKey": "XfbcM0GI", "notificationPassword": "ALIbFCQg", "notificationUsername": "BcLNT6iO", "returnUrl": "QVYx5rW2", "settings": "gMsI1aYB"}' \
    >$TEMP_FILE 2>&1
update_status $? 'TestAdyenConfig'
delete_file $TEMP_FILE

#- 213 TestAliPayConfig
java -jar ${JAR_PATH} platform testAliPayConfig \
    --body '{"appId": "itSn3UDe", "privateKey": "Kj97I4WY", "publicKey": "XLqjN7kt", "returnUrl": "OBTraBxW"}' \
    >$TEMP_FILE 2>&1
update_status $? 'TestAliPayConfig'
delete_file $TEMP_FILE

#- 214 TestCheckoutConfig
java -jar ${JAR_PATH} platform testCheckoutConfig \
    --body '{"publicKey": "RTVuYEqG", "secretKey": "lKDwTKXB"}' \
    >$TEMP_FILE 2>&1
update_status $? 'TestCheckoutConfig'
delete_file $TEMP_FILE

#- 215 DebugMatchedPaymentMerchantConfig
java -jar ${JAR_PATH} platform debugMatchedPaymentMerchantConfig \
    >$TEMP_FILE 2>&1
update_status $? 'DebugMatchedPaymentMerchantConfig'
delete_file $TEMP_FILE

#- 216 TestPayPalConfig
java -jar ${JAR_PATH} platform testPayPalConfig \
    --body '{"clientID": "rXiQcd9I", "clientSecret": "W8kiCKeQ", "returnUrl": "JWZBvcq1", "webHookId": "ETvWBxYZ"}' \
    >$TEMP_FILE 2>&1
update_status $? 'TestPayPalConfig'
delete_file $TEMP_FILE

#- 217 TestStripeConfig
java -jar ${JAR_PATH} platform testStripeConfig \
    --body '{"allowedPaymentMethodTypes": ["Jh7B8gbn"], "publishableKey": "Su9M2OxD", "secretKey": "2udaeYpC", "webhookSecret": "XYSMiy87"}' \
    >$TEMP_FILE 2>&1
update_status $? 'TestStripeConfig'
delete_file $TEMP_FILE

#- 218 TestWxPayConfig
java -jar ${JAR_PATH} platform testWxPayConfig \
    --body '{"appId": "CTqEQBg3", "key": "6my3sY2c", "mchid": "lrDcain0", "returnUrl": "cOVF1zHw"}' \
    >$TEMP_FILE 2>&1
update_status $? 'TestWxPayConfig'
delete_file $TEMP_FILE

#- 219 TestXsollaConfig
java -jar ${JAR_PATH} platform testXsollaConfig \
    --body '{"apiKey": "DTI0sJ1Q", "flowCompletionUrl": "0kphMTgg", "merchantId": 88, "projectId": 82, "projectSecretKey": "2SLcuAP7"}' \
    >$TEMP_FILE 2>&1
update_status $? 'TestXsollaConfig'
delete_file $TEMP_FILE

#- 220 GetPaymentMerchantConfig
java -jar ${JAR_PATH} platform getPaymentMerchantConfig \
    --id 'vU971Czw' \
    >$TEMP_FILE 2>&1
update_status $? 'GetPaymentMerchantConfig'
delete_file $TEMP_FILE

#- 221 UpdateAdyenConfig
java -jar ${JAR_PATH} platform updateAdyenConfig \
    --id '2nbg8C7M' \
    --body '{"allowedPaymentMethods": ["vywhu6Mj"], "apiKey": "OjuGzo1F", "authoriseAsCapture": true, "blockedPaymentMethods": ["4tU0aSn9"], "clientKey": "8N8qOUA0", "dropInSettings": "z92RaDe8", "liveEndpointUrlPrefix": "ngT8LRQk", "merchantAccount": "MnG1LZyF", "notificationHmacKey": "2mdYY6ZM", "notificationPassword": "fuTYTKsu", "notificationUsername": "e48qBEBN", "returnUrl": "AV5BTe6e", "settings": "c1zA92UR"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateAdyenConfig'
delete_file $TEMP_FILE

#- 222 TestAdyenConfigById
java -jar ${JAR_PATH} platform testAdyenConfigById \
    --id 'CLSGPmRB' \
    >$TEMP_FILE 2>&1
update_status $? 'TestAdyenConfigById'
delete_file $TEMP_FILE

#- 223 UpdateAliPayConfig
java -jar ${JAR_PATH} platform updateAliPayConfig \
    --id 'ZWunHW7M' \
    --body '{"appId": "Yvr6QA7P", "privateKey": "pepc92HA", "publicKey": "94eACdey", "returnUrl": "fUpgiPpf"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateAliPayConfig'
delete_file $TEMP_FILE

#- 224 TestAliPayConfigById
java -jar ${JAR_PATH} platform testAliPayConfigById \
    --id '8nxKJ3dn' \
    >$TEMP_FILE 2>&1
update_status $? 'TestAliPayConfigById'
delete_file $TEMP_FILE

#- 225 UpdateCheckoutConfig
java -jar ${JAR_PATH} platform updateCheckoutConfig \
    --id 'mtPwa64Y' \
    --body '{"publicKey": "4gPEKMhh", "secretKey": "u9a6f3xJ"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateCheckoutConfig'
delete_file $TEMP_FILE

#- 226 TestCheckoutConfigById
java -jar ${JAR_PATH} platform testCheckoutConfigById \
    --id 'NtUlKLlI' \
    >$TEMP_FILE 2>&1
update_status $? 'TestCheckoutConfigById'
delete_file $TEMP_FILE

#- 227 UpdatePayPalConfig
java -jar ${JAR_PATH} platform updatePayPalConfig \
    --id 'IAeHbm5M' \
    --body '{"clientID": "6LsY1VMu", "clientSecret": "IEcRls68", "returnUrl": "M3MPMRPB", "webHookId": "epyyMz6z"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePayPalConfig'
delete_file $TEMP_FILE

#- 228 TestPayPalConfigById
java -jar ${JAR_PATH} platform testPayPalConfigById \
    --id 'fR1pvTYY' \
    >$TEMP_FILE 2>&1
update_status $? 'TestPayPalConfigById'
delete_file $TEMP_FILE

#- 229 UpdateStripeConfig
java -jar ${JAR_PATH} platform updateStripeConfig \
    --id 'tDOiEi4R' \
    --body '{"allowedPaymentMethodTypes": ["uEcHCSGh"], "publishableKey": "pOZQFlwO", "secretKey": "iuKGDFgK", "webhookSecret": "49YuKnXk"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateStripeConfig'
delete_file $TEMP_FILE

#- 230 TestStripeConfigById
java -jar ${JAR_PATH} platform testStripeConfigById \
    --id 's0m8ANrc' \
    >$TEMP_FILE 2>&1
update_status $? 'TestStripeConfigById'
delete_file $TEMP_FILE

#- 231 UpdateWxPayConfig
java -jar ${JAR_PATH} platform updateWxPayConfig \
    --id 'Ral7ta3f' \
    --body '{"appId": "ojA3h4MM", "key": "W3AJ5zls", "mchid": "FBwjvLYv", "returnUrl": "mg6avudQ"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateWxPayConfig'
delete_file $TEMP_FILE

#- 232 UpdateWxPayConfigCert
java -jar ${JAR_PATH} platform updateWxPayConfigCert \
    --id 'FF1CPNY9' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateWxPayConfigCert'
delete_file $TEMP_FILE

#- 233 TestWxPayConfigById
java -jar ${JAR_PATH} platform testWxPayConfigById \
    --id 'u2dVYdgl' \
    >$TEMP_FILE 2>&1
update_status $? 'TestWxPayConfigById'
delete_file $TEMP_FILE

#- 234 UpdateXsollaConfig
java -jar ${JAR_PATH} platform updateXsollaConfig \
    --id 'OOoCeK0k' \
    --body '{"apiKey": "PKmBqVux", "flowCompletionUrl": "3lXcD8ae", "merchantId": 35, "projectId": 38, "projectSecretKey": "AVCqs8XT"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateXsollaConfig'
delete_file $TEMP_FILE

#- 235 TestXsollaConfigById
java -jar ${JAR_PATH} platform testXsollaConfigById \
    --id '8xy3nJ06' \
    >$TEMP_FILE 2>&1
update_status $? 'TestXsollaConfigById'
delete_file $TEMP_FILE

#- 236 UpdateXsollaUIConfig
java -jar ${JAR_PATH} platform updateXsollaUIConfig \
    --id 'KkseA0AR' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "SMALL", "theme": "DEFAULT"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateXsollaUIConfig'
delete_file $TEMP_FILE

#- 237 QueryPaymentProviderConfig
java -jar ${JAR_PATH} platform queryPaymentProviderConfig \
    >$TEMP_FILE 2>&1
update_status $? 'QueryPaymentProviderConfig'
delete_file $TEMP_FILE

#- 238 CreatePaymentProviderConfig
java -jar ${JAR_PATH} platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "ayvnhi8M", "region": "DdY4WLHo", "sandboxTaxJarApiToken": "aUkYnQp5", "specials": ["XSOLLA"], "taxJarApiToken": "gdmVE8Im", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreatePaymentProviderConfig'
delete_file $TEMP_FILE

#- 239 GetAggregatePaymentProviders
java -jar ${JAR_PATH} platform getAggregatePaymentProviders \
    >$TEMP_FILE 2>&1
update_status $? 'GetAggregatePaymentProviders'
delete_file $TEMP_FILE

#- 240 DebugMatchedPaymentProviderConfig
java -jar ${JAR_PATH} platform debugMatchedPaymentProviderConfig \
    >$TEMP_FILE 2>&1
update_status $? 'DebugMatchedPaymentProviderConfig'
delete_file $TEMP_FILE

#- 241 GetSpecialPaymentProviders
java -jar ${JAR_PATH} platform getSpecialPaymentProviders \
    >$TEMP_FILE 2>&1
update_status $? 'GetSpecialPaymentProviders'
delete_file $TEMP_FILE

#- 242 UpdatePaymentProviderConfig
java -jar ${JAR_PATH} platform updatePaymentProviderConfig \
    --id 'NtQxqWRK' \
    --body '{"aggregate": "XSOLLA", "namespace": "hODoWOr9", "region": "8kjBUas9", "sandboxTaxJarApiToken": "jjz2Frgi", "specials": ["WALLET"], "taxJarApiToken": "GrcB7dIO", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePaymentProviderConfig'
delete_file $TEMP_FILE

#- 243 DeletePaymentProviderConfig
java -jar ${JAR_PATH} platform deletePaymentProviderConfig \
    --id 'KH8ou9Sd' \
    >$TEMP_FILE 2>&1
update_status $? 'DeletePaymentProviderConfig'
delete_file $TEMP_FILE

#- 244 GetPaymentTaxConfig
java -jar ${JAR_PATH} platform getPaymentTaxConfig \
    >$TEMP_FILE 2>&1
update_status $? 'GetPaymentTaxConfig'
delete_file $TEMP_FILE

#- 245 UpdatePaymentTaxConfig
java -jar ${JAR_PATH} platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "bxSXcrEF", "taxJarApiToken": "CwqeGNLd", "taxJarEnabled": true, "taxJarProductCodesMapping": {"RdliFQVM": "KEzVUWlU"}}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePaymentTaxConfig'
delete_file $TEMP_FILE

#- 246 SyncPaymentOrders
java -jar ${JAR_PATH} platform syncPaymentOrders \
    --end 'WDs2x1EQ' \
    --start 'U0oepEvc' \
    >$TEMP_FILE 2>&1
update_status $? 'SyncPaymentOrders'
delete_file $TEMP_FILE

#- 247 PublicGetRootCategories
java -jar ${JAR_PATH} platform publicGetRootCategories \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetRootCategories'
delete_file $TEMP_FILE

#- 248 DownloadCategories
java -jar ${JAR_PATH} platform downloadCategories \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DownloadCategories'
delete_file $TEMP_FILE

#- 249 PublicGetCategory
java -jar ${JAR_PATH} platform publicGetCategory \
    --categoryPath 'jaSgEh6j' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetCategory'
delete_file $TEMP_FILE

#- 250 PublicGetChildCategories
java -jar ${JAR_PATH} platform publicGetChildCategories \
    --categoryPath 'JnFxinIH' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetChildCategories'
delete_file $TEMP_FILE

#- 251 PublicGetDescendantCategories
java -jar ${JAR_PATH} platform publicGetDescendantCategories \
    --categoryPath 'J1o7aq5Z' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetDescendantCategories'
delete_file $TEMP_FILE

#- 252 PublicListCurrencies
java -jar ${JAR_PATH} platform publicListCurrencies \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicListCurrencies'
delete_file $TEMP_FILE

#- 253 PublicGetItemByAppId
java -jar ${JAR_PATH} platform publicGetItemByAppId \
    --namespace "test" \
    --appId 'znd5eaco' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetItemByAppId'
delete_file $TEMP_FILE

#- 254 PublicQueryItems
java -jar ${JAR_PATH} platform publicQueryItems \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicQueryItems'
delete_file $TEMP_FILE

#- 255 PublicGetItemBySku
java -jar ${JAR_PATH} platform publicGetItemBySku \
    --namespace "test" \
    --sku 'bTsuRlhr' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetItemBySku'
delete_file $TEMP_FILE

#- 256 PublicBulkGetItems
java -jar ${JAR_PATH} platform publicBulkGetItems \
    --namespace "test" \
    --itemIds 'eQVFID3o' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicBulkGetItems'
delete_file $TEMP_FILE

#- 257 PublicSearchItems
java -jar ${JAR_PATH} platform publicSearchItems \
    --namespace "test" \
    --keyword '8hJWVjKI' \
    --language 'OAw70DvA' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicSearchItems'
delete_file $TEMP_FILE

#- 258 PublicGetApp
java -jar ${JAR_PATH} platform publicGetApp \
    --itemId 'HhSGWUvz' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetApp'
delete_file $TEMP_FILE

#- 259 PublicGetItemDynamicData
java -jar ${JAR_PATH} platform publicGetItemDynamicData \
    --itemId 'q1Za3IBC' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetItemDynamicData'
delete_file $TEMP_FILE

#- 260 PublicGetItem
java -jar ${JAR_PATH} platform publicGetItem \
    --itemId '4vQFsUJP' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetItem'
delete_file $TEMP_FILE

#- 261 GetPaymentCustomization
update_status 0 'GetPaymentCustomization (skipped deprecated)'

#- 262 PublicGetPaymentUrl
java -jar ${JAR_PATH} platform publicGetPaymentUrl \
    --namespace "test" \
    --body '{"paymentOrderNo": "fiaJp1rt", "paymentProvider": "WXPAY", "returnUrl": "gBCe6N0e", "ui": "I65Mn5tn", "zipCode": "gEYXgPVT"}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetPaymentUrl'
delete_file $TEMP_FILE

#- 263 PublicGetPaymentMethods
java -jar ${JAR_PATH} platform publicGetPaymentMethods \
    --namespace "test" \
    --paymentOrderNo '5CqXDZBV' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetPaymentMethods'
delete_file $TEMP_FILE

#- 264 PublicGetUnpaidPaymentOrder
java -jar ${JAR_PATH} platform publicGetUnpaidPaymentOrder \
    --namespace "test" \
    --paymentOrderNo 'MJyJeKFO' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUnpaidPaymentOrder'
delete_file $TEMP_FILE

#- 265 Pay
java -jar ${JAR_PATH} platform pay \
    --namespace "test" \
    --paymentOrderNo '92YDtaZv' \
    --body '{"token": "JoKS0Oxy"}' \
    >$TEMP_FILE 2>&1
update_status $? 'Pay'
delete_file $TEMP_FILE

#- 266 PublicCheckPaymentOrderPaidStatus
java -jar ${JAR_PATH} platform publicCheckPaymentOrderPaidStatus \
    --namespace "test" \
    --paymentOrderNo 'ipZuO4N9' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCheckPaymentOrderPaidStatus'
delete_file $TEMP_FILE

#- 267 GetPaymentPublicConfig
java -jar ${JAR_PATH} platform getPaymentPublicConfig \
    --namespace "test" \
    --paymentProvider 'XSOLLA' \
    --region 'gHa6XBcv' \
    >$TEMP_FILE 2>&1
update_status $? 'GetPaymentPublicConfig'
delete_file $TEMP_FILE

#- 268 PublicGetQRCode
java -jar ${JAR_PATH} platform publicGetQRCode \
    --namespace "test" \
    --code 'GRYk5rUt' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetQRCode'
delete_file $TEMP_FILE

#- 269 PublicNormalizePaymentReturnUrl
java -jar ${JAR_PATH} platform publicNormalizePaymentReturnUrl \
    --namespace "test" \
    --orderNo 'WHCnhmzz' \
    --paymentOrderNo 'ppV7tKNK' \
    --paymentProvider 'WXPAY' \
    --returnUrl 'XymWcNlH' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicNormalizePaymentReturnUrl'
delete_file $TEMP_FILE

#- 270 GetPaymentTaxValue
java -jar ${JAR_PATH} platform getPaymentTaxValue \
    --namespace "test" \
    --paymentOrderNo 'aFxYaGHU' \
    --paymentProvider 'PAYPAL' \
    >$TEMP_FILE 2>&1
update_status $? 'GetPaymentTaxValue'
delete_file $TEMP_FILE

#- 271 GetRewardByCode
java -jar ${JAR_PATH} platform getRewardByCode \
    --namespace "test" \
    --rewardCode 'mBFyOrFK' \
    >$TEMP_FILE 2>&1
update_status $? 'GetRewardByCode'
delete_file $TEMP_FILE

#- 272 QueryRewards1
java -jar ${JAR_PATH} platform queryRewards1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QueryRewards1'
delete_file $TEMP_FILE

#- 273 GetReward1
java -jar ${JAR_PATH} platform getReward1 \
    --namespace "test" \
    --rewardId 'txGNAi0f' \
    >$TEMP_FILE 2>&1
update_status $? 'GetReward1'
delete_file $TEMP_FILE

#- 274 PublicListStores
java -jar ${JAR_PATH} platform publicListStores \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicListStores'
delete_file $TEMP_FILE

#- 275 PublicExistsAnyMyActiveEntitlement
java -jar ${JAR_PATH} platform publicExistsAnyMyActiveEntitlement \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicExistsAnyMyActiveEntitlement'
delete_file $TEMP_FILE

#- 276 PublicGetMyAppEntitlementOwnershipByAppId
java -jar ${JAR_PATH} platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "test" \
    --appId 'q4xChPLd' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetMyAppEntitlementOwnershipByAppId'
delete_file $TEMP_FILE

#- 277 PublicGetMyEntitlementOwnershipByItemId
java -jar ${JAR_PATH} platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "test" \
    --itemId '2lOopc7X' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetMyEntitlementOwnershipByItemId'
delete_file $TEMP_FILE

#- 278 PublicGetMyEntitlementOwnershipBySku
java -jar ${JAR_PATH} platform publicGetMyEntitlementOwnershipBySku \
    --namespace "test" \
    --sku 'oVpdd6rC' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetMyEntitlementOwnershipBySku'
delete_file $TEMP_FILE

#- 279 PublicGetEntitlementOwnershipToken
java -jar ${JAR_PATH} platform publicGetEntitlementOwnershipToken \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetEntitlementOwnershipToken'
delete_file $TEMP_FILE

#- 280 PublicGetMyWallet
java -jar ${JAR_PATH} platform publicGetMyWallet \
    --currencyCode 'pyMrnH9Y' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetMyWallet'
delete_file $TEMP_FILE

#- 281 PublicSyncPsnDlcInventory
java -jar ${JAR_PATH} platform publicSyncPsnDlcInventory \
    --namespace "test" \
    --userId 'HXh7KnCV' \
    --body '{"serviceLabel": 80}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicSyncPsnDlcInventory'
delete_file $TEMP_FILE

#- 282 SyncSteamDLC
java -jar ${JAR_PATH} platform syncSteamDLC \
    --namespace "test" \
    --userId 'KY2zsBRG' \
    --body '{"appId": "td8QY2OL", "steamId": "bijrvfr8"}' \
    >$TEMP_FILE 2>&1
update_status $? 'SyncSteamDLC'
delete_file $TEMP_FILE

#- 283 SyncXboxDLC
java -jar ${JAR_PATH} platform syncXboxDLC \
    --namespace "test" \
    --userId 'hknjWUWd' \
    --body '{"xstsToken": "MUXHvw4p"}' \
    >$TEMP_FILE 2>&1
update_status $? 'SyncXboxDLC'
delete_file $TEMP_FILE

#- 284 PublicQueryUserEntitlements
java -jar ${JAR_PATH} platform publicQueryUserEntitlements \
    --namespace "test" \
    --userId 'NlGLjdBx' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicQueryUserEntitlements'
delete_file $TEMP_FILE

#- 285 PublicGetUserAppEntitlementByAppId
java -jar ${JAR_PATH} platform publicGetUserAppEntitlementByAppId \
    --namespace "test" \
    --userId 'LM079pDA' \
    --appId 'bTgmsEYE' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserAppEntitlementByAppId'
delete_file $TEMP_FILE

#- 286 PublicQueryUserEntitlementsByAppType
java -jar ${JAR_PATH} platform publicQueryUserEntitlementsByAppType \
    --namespace "test" \
    --userId 'q2GkYK1v' \
    --appType 'DLC' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicQueryUserEntitlementsByAppType'
delete_file $TEMP_FILE

#- 287 PublicGetUserEntitlementByItemId
java -jar ${JAR_PATH} platform publicGetUserEntitlementByItemId \
    --namespace "test" \
    --userId '9flXQ7CQ' \
    --itemId 'oemnQG0d' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserEntitlementByItemId'
delete_file $TEMP_FILE

#- 288 PublicGetUserEntitlementBySku
java -jar ${JAR_PATH} platform publicGetUserEntitlementBySku \
    --namespace "test" \
    --userId 'H0NVM9VE' \
    --sku 'HTPqDhkc' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserEntitlementBySku'
delete_file $TEMP_FILE

#- 289 PublicExistsAnyUserActiveEntitlement
java -jar ${JAR_PATH} platform publicExistsAnyUserActiveEntitlement \
    --namespace "test" \
    --userId 'u5vnz6Gi' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicExistsAnyUserActiveEntitlement'
delete_file $TEMP_FILE

#- 290 PublicGetUserAppEntitlementOwnershipByAppId
java -jar ${JAR_PATH} platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "test" \
    --userId 'NMboBJHm' \
    --appId 'l0LJmpPi' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserAppEntitlementOwnershipByAppId'
delete_file $TEMP_FILE

#- 291 PublicGetUserEntitlementOwnershipByItemId
java -jar ${JAR_PATH} platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "test" \
    --userId '4mqhruiC' \
    --itemId 'ZLGGP5UX' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserEntitlementOwnershipByItemId'
delete_file $TEMP_FILE

#- 292 PublicGetUserEntitlementOwnershipBySku
java -jar ${JAR_PATH} platform publicGetUserEntitlementOwnershipBySku \
    --namespace "test" \
    --userId 'kHNTMapp' \
    --sku '5SbonsUJ' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserEntitlementOwnershipBySku'
delete_file $TEMP_FILE

#- 293 PublicGetUserEntitlement
java -jar ${JAR_PATH} platform publicGetUserEntitlement \
    --entitlementId 'KADr60Ek' \
    --namespace "test" \
    --userId 'dFrpLsGt' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserEntitlement'
delete_file $TEMP_FILE

#- 294 PublicConsumeUserEntitlement
java -jar ${JAR_PATH} platform publicConsumeUserEntitlement \
    --entitlementId '9yTXWUSC' \
    --namespace "test" \
    --userId 'QcMsHN7r' \
    --body '{"useCount": 9}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicConsumeUserEntitlement'
delete_file $TEMP_FILE

#- 295 PublicRedeemCode
java -jar ${JAR_PATH} platform publicRedeemCode \
    --namespace "test" \
    --userId 'I22ks7I1' \
    --body '{"code": "2tAZc8sx", "language": "lXx_yh", "region": "5J4WiJLv"}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicRedeemCode'
delete_file $TEMP_FILE

#- 296 PublicFulfillAppleIAPItem
java -jar ${JAR_PATH} platform publicFulfillAppleIAPItem \
    --namespace "test" \
    --userId '9NvHwtw2' \
    --body '{"excludeOldTransactions": false, "language": "Yz-xyOP", "productId": "UKJJNftR", "receiptData": "pGgk1ise", "region": "REzzRG6z", "transactionId": "9wmuHddy"}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicFulfillAppleIAPItem'
delete_file $TEMP_FILE

#- 297 SyncEpicGamesInventory
java -jar ${JAR_PATH} platform syncEpicGamesInventory \
    --namespace "test" \
    --userId 'OdibI1LV' \
    --body '{"epicGamesJwtToken": "yqbdY8DG"}' \
    >$TEMP_FILE 2>&1
update_status $? 'SyncEpicGamesInventory'
delete_file $TEMP_FILE

#- 298 PublicFulfillGoogleIAPItem
java -jar ${JAR_PATH} platform publicFulfillGoogleIAPItem \
    --namespace "test" \
    --userId 'ZKAuoIKz' \
    --body '{"autoAck": false, "language": "lwu-sMmM", "orderId": "G0FoQP8q", "packageName": "7aSsb85g", "productId": "Ah9RD3Zz", "purchaseTime": 78, "purchaseToken": "6N1iJ8lt", "region": "t9IRqCfl"}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicFulfillGoogleIAPItem'
delete_file $TEMP_FILE

#- 299 PublicReconcilePlayStationStore
java -jar ${JAR_PATH} platform publicReconcilePlayStationStore \
    --namespace "test" \
    --userId 'gln6r5f0' \
    --body '{"currencyCode": "s5H6lCf3", "price": 0.6656623819884346, "productId": "a11hLLCg", "serviceLabel": 45}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicReconcilePlayStationStore'
delete_file $TEMP_FILE

#- 300 SyncStadiaEntitlement
java -jar ${JAR_PATH} platform syncStadiaEntitlement \
    --namespace "test" \
    --userId '5av4LExd' \
    --body '{"appId": "abD8g2cv", "language": "FmrU-240", "region": "HUJ0GCmf", "stadiaPlayerId": "lIXkgJ6z"}' \
    >$TEMP_FILE 2>&1
update_status $? 'SyncStadiaEntitlement'
delete_file $TEMP_FILE

#- 301 SyncSteamInventory
java -jar ${JAR_PATH} platform syncSteamInventory \
    --namespace "test" \
    --userId 'kTwoakq7' \
    --body '{"appId": "sEejFZ1N", "currencyCode": "tONXb9w9", "language": "Sq-FRLZ", "price": 0.6565137658214307, "productId": "d58dZP5R", "region": "vrinNtvB", "steamId": "tqFSkA68"}' \
    >$TEMP_FILE 2>&1
update_status $? 'SyncSteamInventory'
delete_file $TEMP_FILE

#- 302 SyncTwitchDropsEntitlement
java -jar ${JAR_PATH} platform syncTwitchDropsEntitlement \
    --namespace "test" \
    --userId 'mIVYJ5pS' \
    --body '{"gameId": "VxBsLhty", "language": "EC_133", "region": "wNC4FY69"}' \
    >$TEMP_FILE 2>&1
update_status $? 'SyncTwitchDropsEntitlement'
delete_file $TEMP_FILE

#- 303 SyncXboxInventory
java -jar ${JAR_PATH} platform syncXboxInventory \
    --namespace "test" \
    --userId 'mM87joJN' \
    --body '{"currencyCode": "OGB83Ns6", "price": 0.5299632339050114, "productId": "5Poab6lK", "xstsToken": "oVqNBUzI"}' \
    >$TEMP_FILE 2>&1
update_status $? 'SyncXboxInventory'
delete_file $TEMP_FILE

#- 304 PublicQueryUserOrders
java -jar ${JAR_PATH} platform publicQueryUserOrders \
    --namespace "test" \
    --userId 'xOfglquS' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicQueryUserOrders'
delete_file $TEMP_FILE

#- 305 PublicCreateUserOrder
java -jar ${JAR_PATH} platform publicCreateUserOrder \
    --namespace "test" \
    --userId '2q2DoWr9' \
    --body '{"currencyCode": "zvFtKa2m", "discountedPrice": 80, "ext": {"AqOokV1p": {}}, "itemId": "lxQ2YriT", "language": "FIPd", "price": 17, "quantity": 21, "region": "rtLnh2U1", "returnUrl": "RQlMxkfN"}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCreateUserOrder'
delete_file $TEMP_FILE

#- 306 PublicGetUserOrder
java -jar ${JAR_PATH} platform publicGetUserOrder \
    --namespace "test" \
    --orderNo 'MPNtqv2T' \
    --userId 'Mz1b7Snz' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserOrder'
delete_file $TEMP_FILE

#- 307 PublicCancelUserOrder
java -jar ${JAR_PATH} platform publicCancelUserOrder \
    --namespace "test" \
    --orderNo 'kXOek83I' \
    --userId 'gm1wkSWs' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCancelUserOrder'
delete_file $TEMP_FILE

#- 308 PublicGetUserOrderHistories
java -jar ${JAR_PATH} platform publicGetUserOrderHistories \
    --namespace "test" \
    --orderNo 'YvAsu18o' \
    --userId 'bUdc8mbv' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserOrderHistories'
delete_file $TEMP_FILE

#- 309 PublicDownloadUserOrderReceipt
java -jar ${JAR_PATH} platform publicDownloadUserOrderReceipt \
    --namespace "test" \
    --orderNo 'XcwcgMqO' \
    --userId 'XMziXrVd' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicDownloadUserOrderReceipt'
delete_file $TEMP_FILE

#- 310 PublicGetPaymentAccounts
java -jar ${JAR_PATH} platform publicGetPaymentAccounts \
    --namespace "test" \
    --userId 'sEc3ClFP' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetPaymentAccounts'
delete_file $TEMP_FILE

#- 311 PublicDeletePaymentAccount
java -jar ${JAR_PATH} platform publicDeletePaymentAccount \
    --id '3mJwusCB' \
    --namespace "test" \
    --type 'card' \
    --userId '4kLcuqL4' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicDeletePaymentAccount'
delete_file $TEMP_FILE

#- 312 PublicQueryUserSubscriptions
java -jar ${JAR_PATH} platform publicQueryUserSubscriptions \
    --namespace "test" \
    --userId '0NYgekRa' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicQueryUserSubscriptions'
delete_file $TEMP_FILE

#- 313 PublicSubscribeSubscription
java -jar ${JAR_PATH} platform publicSubscribeSubscription \
    --namespace "test" \
    --userId 'vpaGTA9B' \
    --body '{"currencyCode": "TyCCyN4F", "itemId": "w9i6mI2W", "language": "JJc-HeyZ-597", "region": "PAXQBNMP", "returnUrl": "7j3xfPao", "source": "ZaWFspkU"}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicSubscribeSubscription'
delete_file $TEMP_FILE

#- 314 PublicCheckUserSubscriptionSubscribableByItemId
java -jar ${JAR_PATH} platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "test" \
    --userId '5kn6PlPq' \
    --itemId 'D4AgfasB' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCheckUserSubscriptionSubscribableByItemId'
delete_file $TEMP_FILE

#- 315 PublicGetUserSubscription
java -jar ${JAR_PATH} platform publicGetUserSubscription \
    --namespace "test" \
    --subscriptionId 'fclBhZjZ' \
    --userId 'bLnmghKw' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserSubscription'
delete_file $TEMP_FILE

#- 316 PublicChangeSubscriptionBillingAccount
java -jar ${JAR_PATH} platform publicChangeSubscriptionBillingAccount \
    --namespace "test" \
    --subscriptionId 'PyVIn3qa' \
    --userId 'HP7KNuly' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicChangeSubscriptionBillingAccount'
delete_file $TEMP_FILE

#- 317 PublicCancelSubscription
java -jar ${JAR_PATH} platform publicCancelSubscription \
    --namespace "test" \
    --subscriptionId 'frENVQkp' \
    --userId 'caWHf6T2' \
    --body '{"immediate": true, "reason": "OOljn7c6"}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCancelSubscription'
delete_file $TEMP_FILE

#- 318 PublicGetUserSubscriptionBillingHistories
java -jar ${JAR_PATH} platform publicGetUserSubscriptionBillingHistories \
    --namespace "test" \
    --subscriptionId 'c9efJI02' \
    --userId 'TZxrgLBF' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserSubscriptionBillingHistories'
delete_file $TEMP_FILE

#- 319 PublicGetWallet
java -jar ${JAR_PATH} platform publicGetWallet \
    --currencyCode 'JEkphFz0' \
    --namespace "test" \
    --userId 'h6WpoVpV' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetWallet'
delete_file $TEMP_FILE

#- 320 PublicListUserWalletTransactions
java -jar ${JAR_PATH} platform publicListUserWalletTransactions \
    --currencyCode 'c2HBBmj6' \
    --namespace "test" \
    --userId 'cEi02hXl' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicListUserWalletTransactions'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT