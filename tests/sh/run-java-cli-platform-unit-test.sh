#!/bin/bash

#Meta:
#- random seed: 256
#- template file: java-cli-unit-test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH="${MODULE_PATH:-../../samples/cli}"
JAR_PATH="${MODULE_PATH}/build/libs/cli.jar"
TEMP_FILE='file.tmp'

OPERATIONS_COUNT=316

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
#
##- 2 TestFulfillmentScriptEval
#java -jar ${JAR_PATH} platform testFulfillmentScriptEval \
#    --body '{"context": {"item": {"appId": "FtBxyZcD", "appType": "DEMO", "baseAppId": "pGlsQuJu", "boothName": "8vMf0IsJ", "boundItemIds": ["kTrd8IDc"], "categoryPath": "V2zXnTKj", "clazz": "XY1bPqam", "createdAt": "1975-08-05T00:00:00Z", "description": "xx9Cs18E", "displayOrder": 100, "entitlementType": "DURABLE", "ext": {"kItqRzHU": {}}, "features": ["1oh570KQ"], "images": [{"as": "BVaewc72", "caption": "krSha68n", "height": 100, "imageUrl": "nozp1C2K", "smallImageUrl": "mIQTuBdN", "width": 61}], "itemId": "UsxFb8CJ", "itemIds": ["17M7DJZa"], "itemQty": {"MSxECbZb": 49}, "itemType": "COINS", "language": "yoarORoe", "listable": false, "localExt": {"8Rh3kgs9": {}}, "longDescription": "qqJbnQso", "maxCount": 54, "maxCountPerUser": 12, "name": "iVpP8Cm3", "namespace": "yvASUoxd", "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 63, "fixedTrialCycles": 32, "graceDays": 24}, "region": "AGTJ8IEd", "regionData": [{"currencyCode": "agEtp4w2", "currencyNamespace": "9KOu9c19", "currencyType": "VIRTUAL", "discountAmount": 33, "discountExpireAt": "1995-09-24T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1976-11-25T00:00:00Z", "discountedPrice": 26, "expireAt": "1978-10-30T00:00:00Z", "price": 61, "purchaseAt": "1989-10-31T00:00:00Z", "trialPrice": 11}], "seasonType": "PASS", "sku": "iX7jpkVZ", "stackable": false, "status": "ACTIVE", "tags": ["QYEmqGod"], "targetCurrencyCode": "OEGt9gPO", "targetItemId": "j0c6i0Jk", "targetNamespace": "vIas73uc", "thumbnailUrl": "YnFAJ3DK", "title": "5T4Eogg0", "updatedAt": "1996-04-22T00:00:00Z", "useCount": 23}, "namespace": "pv5bVAgt", "order": {"currency": {"currencyCode": "sDhUTDUs", "currencySymbol": "cbQDjbTQ", "currencyType": "VIRTUAL", "decimals": 83, "namespace": "Mz2PTRlk"}, "ext": {"yU89ZPOw": {}}, "free": true}, "source": "GIFT"}, "script": "J42cwmzB", "type": "grantDays"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'TestFulfillmentScriptEval'
#delete_file $TEMP_FILE
#
##- 3 GetFulfillmentScript
#java -jar ${JAR_PATH} platform getFulfillmentScript \
#    --id 'SMNcoAAO' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetFulfillmentScript'
#delete_file $TEMP_FILE
#
##- 4 CreateFulfillmentScript
#java -jar ${JAR_PATH} platform createFulfillmentScript \
#    --id 'jKNjfcYH' \
#    --body '{"grantDays": "m093aYgB"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CreateFulfillmentScript'
#delete_file $TEMP_FILE
#
##- 5 DeleteFulfillmentScript
#java -jar ${JAR_PATH} platform deleteFulfillmentScript \
#    --id 'U1sqjyK0' \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeleteFulfillmentScript'
#delete_file $TEMP_FILE
#
##- 6 UpdateFulfillmentScript
#java -jar ${JAR_PATH} platform updateFulfillmentScript \
#    --id 'XH45PaRS' \
#    --body '{"grantDays": "OFQBtu23"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateFulfillmentScript'
#delete_file $TEMP_FILE
#
##- 7 QueryCampaigns
#java -jar ${JAR_PATH} platform queryCampaigns \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryCampaigns'
#delete_file $TEMP_FILE
#
##- 8 CreateCampaign
#java -jar ${JAR_PATH} platform createCampaign \
#    --namespace "test" \
#    --body '{"description": "REZ8hRVX", "items": [{"extraSubscriptionDays": 74, "itemId": "GOvDdYiQ", "itemName": "S9i7mV1C", "quantity": 30}], "maxRedeemCountPerCampaignPerUser": 18, "maxRedeemCountPerCode": 64, "maxRedeemCountPerCodePerUser": 13, "maxSaleCount": 31, "name": "xL6ycTQd", "redeemEnd": "1981-03-31T00:00:00Z", "redeemStart": "1977-10-25T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["SQWEXL6L"], "type": "REDEMPTION"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CreateCampaign'
#delete_file $TEMP_FILE
#
##- 9 GetCampaign
#java -jar ${JAR_PATH} platform getCampaign \
#    --campaignId 'E1YHo9m1' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetCampaign'
#delete_file $TEMP_FILE
#
##- 10 UpdateCampaign
#java -jar ${JAR_PATH} platform updateCampaign \
#    --campaignId '26ZWc8hH' \
#    --namespace "test" \
#    --body '{"description": "tWvbNYqg", "items": [{"extraSubscriptionDays": 92, "itemId": "qslArFPi", "itemName": "HUIvaCv8", "quantity": 20}], "maxRedeemCountPerCampaignPerUser": 92, "maxRedeemCountPerCode": 6, "maxRedeemCountPerCodePerUser": 55, "maxSaleCount": 55, "name": "pdsJLhsV", "redeemEnd": "1983-09-03T00:00:00Z", "redeemStart": "1982-05-20T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["oot0B7WO"]}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateCampaign'
#delete_file $TEMP_FILE
#
##- 11 GetCampaignDynamic
#java -jar ${JAR_PATH} platform getCampaignDynamic \
#    --campaignId 'fercZdpM' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetCampaignDynamic'
#delete_file $TEMP_FILE
#
##- 12 GetRootCategories
#java -jar ${JAR_PATH} platform getRootCategories \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetRootCategories'
#delete_file $TEMP_FILE
#
##- 13 CreateCategory
#java -jar ${JAR_PATH} platform createCategory \
#    --namespace "test" \
#    --storeId 'ci37Ds7Y' \
#    --body '{"categoryPath": "SfExaI3u", "localizationDisplayNames": {"zLteMbFA": "lt4hr7Hm"}}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CreateCategory'
#delete_file $TEMP_FILE
#
##- 14 ListCategoriesBasic
#java -jar ${JAR_PATH} platform listCategoriesBasic \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'ListCategoriesBasic'
#delete_file $TEMP_FILE
#
##- 15 GetCategory
#java -jar ${JAR_PATH} platform getCategory \
#    --categoryPath 'OYiBA5lt' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetCategory'
#delete_file $TEMP_FILE
#
##- 16 UpdateCategory
#java -jar ${JAR_PATH} platform updateCategory \
#    --categoryPath 'AOXmlG6e' \
#    --namespace "test" \
#    --storeId 'h1dTdoTF' \
#    --body '{"localizationDisplayNames": {"pBIcuC1d": "QY93OJnJ"}}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateCategory'
#delete_file $TEMP_FILE
#
##- 17 DeleteCategory
#java -jar ${JAR_PATH} platform deleteCategory \
#    --categoryPath '6Te9vD8l' \
#    --namespace "test" \
#    --storeId 'dz7Hu8AD' \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeleteCategory'
#delete_file $TEMP_FILE
#
##- 18 GetChildCategories
#java -jar ${JAR_PATH} platform getChildCategories \
#    --categoryPath '79kdWunv' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetChildCategories'
#delete_file $TEMP_FILE
#
##- 19 GetDescendantCategories
#java -jar ${JAR_PATH} platform getDescendantCategories \
#    --categoryPath 'izU0q1pH' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetDescendantCategories'
#delete_file $TEMP_FILE
#
##- 20 QueryCodes
#java -jar ${JAR_PATH} platform queryCodes \
#    --campaignId 'yhhERoGg' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryCodes'
#delete_file $TEMP_FILE
#
##- 21 CreateCodes
#java -jar ${JAR_PATH} platform createCodes \
#    --campaignId 'drysMizB' \
#    --namespace "test" \
#    --body '{"quantity": 65}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CreateCodes'
#delete_file $TEMP_FILE
#
##- 22 Download
#java -jar ${JAR_PATH} platform download \
#    --campaignId 'SRdP2l7D' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'Download'
#delete_file $TEMP_FILE
#
##- 23 BulkDisableCodes
#java -jar ${JAR_PATH} platform bulkDisableCodes \
#    --campaignId 'NSZ8Aq0X' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'BulkDisableCodes'
#delete_file $TEMP_FILE
#
##- 24 BulkEnableCodes
#java -jar ${JAR_PATH} platform bulkEnableCodes \
#    --campaignId 'iPLQXSe0' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'BulkEnableCodes'
#delete_file $TEMP_FILE
#
##- 25 QueryRedeemHistory
#java -jar ${JAR_PATH} platform queryRedeemHistory \
#    --campaignId '7ZddOGTM' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryRedeemHistory'
#delete_file $TEMP_FILE
#
##- 26 GetCode
#java -jar ${JAR_PATH} platform getCode \
#    --code 'lJjBwj9H' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetCode'
#delete_file $TEMP_FILE
#
##- 27 DisableCode
#java -jar ${JAR_PATH} platform disableCode \
#    --code 'JHQKseEd' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'DisableCode'
#delete_file $TEMP_FILE
#
##- 28 EnableCode
#java -jar ${JAR_PATH} platform enableCode \
#    --code 'SXRDSvgu' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'EnableCode'
#delete_file $TEMP_FILE
#
##- 29 ListCurrencies
#java -jar ${JAR_PATH} platform listCurrencies \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'ListCurrencies'
#delete_file $TEMP_FILE
#
##- 30 CreateCurrency
#java -jar ${JAR_PATH} platform createCurrency \
#    --namespace "test" \
#    --body '{"currencyCode": "auw1xT7e", "currencySymbol": "MwSl9MLH", "currencyType": "REAL", "decimals": 91, "localizationDescriptions": {"J2ulNzBv": "wJaQa547"}}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CreateCurrency'
#delete_file $TEMP_FILE
#
##- 31 UpdateCurrency
#java -jar ${JAR_PATH} platform updateCurrency \
#    --currencyCode 'JllvA8RW' \
#    --namespace "test" \
#    --body '{"localizationDescriptions": {"SpabUt7x": "k6QxyWhf"}}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateCurrency'
#delete_file $TEMP_FILE
#
##- 32 DeleteCurrency
#java -jar ${JAR_PATH} platform deleteCurrency \
#    --currencyCode 'qoWfJw2o' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeleteCurrency'
#delete_file $TEMP_FILE
#
##- 33 GetCurrencyConfig
#java -jar ${JAR_PATH} platform getCurrencyConfig \
#    --currencyCode '8oWUqvPC' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetCurrencyConfig'
#delete_file $TEMP_FILE
#
##- 34 GetCurrencySummary
#java -jar ${JAR_PATH} platform getCurrencySummary \
#    --currencyCode 'Z2HzT7NX' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetCurrencySummary'
#delete_file $TEMP_FILE
#
##- 35 GetDLCItemConfig
#java -jar ${JAR_PATH} platform getDLCItemConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetDLCItemConfig'
#delete_file $TEMP_FILE
#
##- 36 UpdateDLCItemConfig
#java -jar ${JAR_PATH} platform updateDLCItemConfig \
#    --namespace "test" \
#    --body '{"data": [{"id": "mWDlXsuN", "rewards": [{"currency": {"currencyCode": "IdQJR5ls", "namespace": "NOlvkfwa"}, "item": {"itemId": "SbnsuLCg", "itemSku": "ToxuVTek", "itemType": "Jgvg6h5H"}, "quantity": 68, "type": "ITEM"}]}]}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateDLCItemConfig'
#delete_file $TEMP_FILE
#
##- 37 DeleteDLCItemConfig
#java -jar ${JAR_PATH} platform deleteDLCItemConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeleteDLCItemConfig'
#delete_file $TEMP_FILE
#
##- 38 GetPlatformDLCConfig
#java -jar ${JAR_PATH} platform getPlatformDLCConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetPlatformDLCConfig'
#delete_file $TEMP_FILE
#
##- 39 UpdatePlatformDLCConfig
#java -jar ${JAR_PATH} platform updatePlatformDLCConfig \
#    --namespace "test" \
#    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"0DviplEk": "4vj3LDp4"}}]}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdatePlatformDLCConfig'
#delete_file $TEMP_FILE
#
##- 40 DeletePlatformDLCConfig
#java -jar ${JAR_PATH} platform deletePlatformDLCConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeletePlatformDLCConfig'
#delete_file $TEMP_FILE
#
##- 41 QueryEntitlements
#java -jar ${JAR_PATH} platform queryEntitlements \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryEntitlements'
#delete_file $TEMP_FILE
#
##- 42 GetEntitlement
#java -jar ${JAR_PATH} platform getEntitlement \
#    --entitlementId 'yqDt8QUZ' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetEntitlement'
#delete_file $TEMP_FILE
#
##- 43 QueryFulfillmentHistories
#java -jar ${JAR_PATH} platform queryFulfillmentHistories \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryFulfillmentHistories'
#delete_file $TEMP_FILE
#
##- 44 GetAppleIAPConfig
#java -jar ${JAR_PATH} platform getAppleIAPConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetAppleIAPConfig'
#delete_file $TEMP_FILE
#
##- 45 UpdateAppleIAPConfig
#java -jar ${JAR_PATH} platform updateAppleIAPConfig \
#    --namespace "test" \
#    --body '{"bundleId": "DpxlHasi", "password": "nGcjrkmR"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateAppleIAPConfig'
#delete_file $TEMP_FILE
#
##- 46 DeleteAppleIAPConfig
#java -jar ${JAR_PATH} platform deleteAppleIAPConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeleteAppleIAPConfig'
#delete_file $TEMP_FILE
#
##- 47 GetEpicGamesIAPConfig
#java -jar ${JAR_PATH} platform getEpicGamesIAPConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetEpicGamesIAPConfig'
#delete_file $TEMP_FILE
#
##- 48 UpdateEpicGamesIAPConfig
#java -jar ${JAR_PATH} platform updateEpicGamesIAPConfig \
#    --namespace "test" \
#    --body '{"sandboxId": "MttgjDSa"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateEpicGamesIAPConfig'
#delete_file $TEMP_FILE
#
##- 49 DeleteEpicGamesIAPConfig
#java -jar ${JAR_PATH} platform deleteEpicGamesIAPConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeleteEpicGamesIAPConfig'
#delete_file $TEMP_FILE
#
##- 50 GetGoogleIAPConfig
#java -jar ${JAR_PATH} platform getGoogleIAPConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetGoogleIAPConfig'
#delete_file $TEMP_FILE
#
##- 51 UpdateGoogleIAPConfig
#java -jar ${JAR_PATH} platform updateGoogleIAPConfig \
#    --namespace "test" \
#    --body '{"applicationName": "IVBmft3U", "serviceAccountId": "dg7p9PGm"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateGoogleIAPConfig'
#delete_file $TEMP_FILE
#
##- 52 DeleteGoogleIAPConfig
#java -jar ${JAR_PATH} platform deleteGoogleIAPConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeleteGoogleIAPConfig'
#delete_file $TEMP_FILE
#
##- 53 UpdateGoogleP12File
#java -jar ${JAR_PATH} platform updateGoogleP12File \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateGoogleP12File'
#delete_file $TEMP_FILE
#
##- 54 GetIAPItemConfig
#java -jar ${JAR_PATH} platform getIAPItemConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetIAPItemConfig'
#delete_file $TEMP_FILE
#
##- 55 UpdateIAPItemConfig
#java -jar ${JAR_PATH} platform updateIAPItemConfig \
#    --namespace "test" \
#    --body '{"data": [{"itemIdentity": "Y2H5kX4M", "platformProductIdMap": {"sisSX28n": "ARxWRpv5"}}]}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateIAPItemConfig'
#delete_file $TEMP_FILE
#
##- 56 DeleteIAPItemConfig
#java -jar ${JAR_PATH} platform deleteIAPItemConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeleteIAPItemConfig'
#delete_file $TEMP_FILE
#
##- 57 GetPlayStationIAPConfig
#java -jar ${JAR_PATH} platform getPlayStationIAPConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetPlayStationIAPConfig'
#delete_file $TEMP_FILE
#
##- 58 UpdatePlaystationIAPConfig
#java -jar ${JAR_PATH} platform updatePlaystationIAPConfig \
#    --namespace "test" \
#    --body '{"environment": "ou5xtvd2"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdatePlaystationIAPConfig'
#delete_file $TEMP_FILE
#
##- 59 DeletePlaystationIAPConfig
#java -jar ${JAR_PATH} platform deletePlaystationIAPConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeletePlaystationIAPConfig'
#delete_file $TEMP_FILE
#
##- 60 GetStadiaIAPConfig
#java -jar ${JAR_PATH} platform getStadiaIAPConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetStadiaIAPConfig'
#delete_file $TEMP_FILE
#
##- 61 DeleteStadiaIAPConfig
#java -jar ${JAR_PATH} platform deleteStadiaIAPConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeleteStadiaIAPConfig'
#delete_file $TEMP_FILE
#
##- 62 UpdateStadiaJsonConfigFile
#java -jar ${JAR_PATH} platform updateStadiaJsonConfigFile \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateStadiaJsonConfigFile'
#delete_file $TEMP_FILE
#
##- 63 GetSteamIAPConfig
#java -jar ${JAR_PATH} platform getSteamIAPConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetSteamIAPConfig'
#delete_file $TEMP_FILE
#
##- 64 UpdateSteamIAPConfig
#java -jar ${JAR_PATH} platform updateSteamIAPConfig \
#    --namespace "test" \
#    --body '{"publisherAuthenticationKey": "8OUfCt8U"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateSteamIAPConfig'
#delete_file $TEMP_FILE
#
##- 65 DeleteSteamIAPConfig
#java -jar ${JAR_PATH} platform deleteSteamIAPConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeleteSteamIAPConfig'
#delete_file $TEMP_FILE
#
##- 66 GetXblIAPConfig
#java -jar ${JAR_PATH} platform getXblIAPConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetXblIAPConfig'
#delete_file $TEMP_FILE
#
##- 67 UpdateXblIAPConfig
#java -jar ${JAR_PATH} platform updateXblIAPConfig \
#    --namespace "test" \
#    --body '{"relyingPartyCert": "JC5flNyj"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateXblIAPConfig'
#delete_file $TEMP_FILE
#
##- 68 DeleteXblAPConfig
#java -jar ${JAR_PATH} platform deleteXblAPConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeleteXblAPConfig'
#delete_file $TEMP_FILE
#
##- 69 UpdateXblBPCertFile
#java -jar ${JAR_PATH} platform updateXblBPCertFile \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateXblBPCertFile'
#delete_file $TEMP_FILE
#
##- 70 SyncInGameItem
#java -jar ${JAR_PATH} platform syncInGameItem \
#    --namespace "test" \
#    --storeId '6HsTtX8P' \
#    --body '{"categoryPath": "3llnaaS9", "targetItemId": "lqyygPcf", "targetNamespace": "kJIxfQZz"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'SyncInGameItem'
#delete_file $TEMP_FILE
#
##- 71 CreateItem
#java -jar ${JAR_PATH} platform createItem \
#    --namespace "test" \
#    --storeId 'a8kNVbDx' \
#    --body '{"appId": "VMq7HJk0", "appType": "DEMO", "baseAppId": "89xAc3YV", "boothName": "faENtrl0", "categoryPath": "pTKZTXqz", "clazz": "HuBMYQSA", "displayOrder": 18, "entitlementType": "CONSUMABLE", "ext": {"1ZOpdOjS": {}}, "features": ["yMddB41J"], "images": [{"as": "uMf7RUyB", "caption": "HRj8IiRi", "height": 24, "imageUrl": "RllHT6Dc", "smallImageUrl": "40vFFA6g", "width": 30}], "itemIds": ["U7EW3x1d"], "itemQty": {"Cpm55gOe": 33}, "itemType": "CODE", "listable": false, "localizations": {"JVKmBM1J": {"description": "1IbuTrrk", "localExt": {"bmuT1whO": {}}, "longDescription": "qmEnDXIW", "title": "rBPlSay4"}}, "maxCount": 24, "maxCountPerUser": 43, "name": "71BAZAOj", "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 70, "fixedTrialCycles": 42, "graceDays": 25}, "regionData": {"Tj7tT7TZ": [{"currencyCode": "HWDdCkIs", "currencyNamespace": "ZoArWwPH", "currencyType": "REAL", "discountAmount": 49, "discountExpireAt": "1986-07-28T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1984-05-30T00:00:00Z", "discountedPrice": 100, "expireAt": "1972-03-13T00:00:00Z", "price": 75, "purchaseAt": "1988-02-20T00:00:00Z", "trialPrice": 86}]}, "seasonType": "TIER", "sku": "FRr0gwB9", "stackable": true, "status": "INACTIVE", "tags": ["3vp99XVl"], "targetCurrencyCode": "V8rK3tE6", "targetNamespace": "n0smip1t", "thumbnailUrl": "w3L7cUd9", "useCount": 30}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CreateItem'
#delete_file $TEMP_FILE
#
##- 72 GetItemByAppId
#java -jar ${JAR_PATH} platform getItemByAppId \
#    --namespace "test" \
#    --appId 'qtv6JfPZ' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetItemByAppId'
#delete_file $TEMP_FILE
#
##- 73 QueryItems
#java -jar ${JAR_PATH} platform queryItems \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryItems'
#delete_file $TEMP_FILE
#
##- 74 ListBasicItemsByFeatures
#java -jar ${JAR_PATH} platform listBasicItemsByFeatures \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'ListBasicItemsByFeatures'
#delete_file $TEMP_FILE
#
##- 75 GetItemBySku
#java -jar ${JAR_PATH} platform getItemBySku \
#    --namespace "test" \
#    --sku 'wcCVOXcV' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetItemBySku'
#delete_file $TEMP_FILE
#
##- 76 GetLocaleItemBySku
#java -jar ${JAR_PATH} platform getLocaleItemBySku \
#    --namespace "test" \
#    --sku 'a80TmCwt' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetLocaleItemBySku'
#delete_file $TEMP_FILE
#
##- 77 GetItemIdBySku
#java -jar ${JAR_PATH} platform getItemIdBySku \
#    --namespace "test" \
#    --sku 'D2lAH01o' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetItemIdBySku'
#delete_file $TEMP_FILE
#
##- 78 BulkGetLocaleItems
#java -jar ${JAR_PATH} platform bulkGetLocaleItems \
#    --namespace "test" \
#    --itemIds '6NdcBIgz' \
#    >$TEMP_FILE 2>&1
#update_status $? 'BulkGetLocaleItems'
#delete_file $TEMP_FILE
#
##- 79 SearchItems
#java -jar ${JAR_PATH} platform searchItems \
#    --namespace "test" \
#    --keyword 'rDyWpFBY' \
#    --language 'GmmBawMy' \
#    >$TEMP_FILE 2>&1
#update_status $? 'SearchItems'
#delete_file $TEMP_FILE
#
##- 80 QueryUncategorizedItems
#java -jar ${JAR_PATH} platform queryUncategorizedItems \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryUncategorizedItems'
#delete_file $TEMP_FILE
#
##- 81 GetItem
#java -jar ${JAR_PATH} platform getItem \
#    --itemId 'oKyNpdAa' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetItem'
#delete_file $TEMP_FILE
#
##- 82 UpdateItem
#java -jar ${JAR_PATH} platform updateItem \
#    --itemId 'sm8xwUfz' \
#    --namespace "test" \
#    --storeId 'OlQiZY4N' \
#    --body '{"appId": "bOQXJ7uO", "appType": "DEMO", "baseAppId": "NMvuq2tN", "boothName": "l4CX4Iji", "categoryPath": "K4DEUJRV", "clazz": "K3l9Eb0R", "displayOrder": 99, "entitlementType": "DURABLE", "ext": {"0RH8vS1s": {}}, "features": ["meOlngrd"], "images": [{"as": "TXCzaPBt", "caption": "kZMio4wc", "height": 48, "imageUrl": "hloVS3rY", "smallImageUrl": "p8QtcEmC", "width": 60}], "itemIds": ["Vc75Ufey"], "itemQty": {"pWjDNhzC": 75}, "itemType": "CODE", "listable": true, "localizations": {"wO763iEk": {"description": "lkzLm88L", "localExt": {"pLuYRO3C": {}}, "longDescription": "55yHpwK2", "title": "JaqenDGn"}}, "maxCount": 1, "maxCountPerUser": 78, "name": "UplWiLjq", "purchasable": false, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 34, "fixedTrialCycles": 96, "graceDays": 60}, "regionData": {"fkpaXtwY": [{"currencyCode": "ZJaQ4Wbw", "currencyNamespace": "NmsFYetj", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1979-09-21T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1976-04-26T00:00:00Z", "discountedPrice": 71, "expireAt": "1983-11-08T00:00:00Z", "price": 72, "purchaseAt": "1980-12-11T00:00:00Z", "trialPrice": 92}]}, "seasonType": "PASS", "sku": "Tz1ETdsm", "stackable": true, "status": "INACTIVE", "tags": ["jkkn9oiQ"], "targetCurrencyCode": "l05g7cO3", "targetNamespace": "ZMb6Ojlo", "thumbnailUrl": "6DMNpP2q", "useCount": 76}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateItem'
#delete_file $TEMP_FILE
#
##- 83 DeleteItem
#java -jar ${JAR_PATH} platform deleteItem \
#    --itemId 'rTQ1Upjf' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeleteItem'
#delete_file $TEMP_FILE
#
##- 84 AcquireItem
#java -jar ${JAR_PATH} platform acquireItem \
#    --itemId 'U6wJhy1j' \
#    --namespace "test" \
#    --body '{"count": 81, "orderNo": "VkkUlS79"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'AcquireItem'
#delete_file $TEMP_FILE
#
##- 85 GetApp
#java -jar ${JAR_PATH} platform getApp \
#    --itemId '527EZ25I' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetApp'
#delete_file $TEMP_FILE
#
##- 86 UpdateApp
#java -jar ${JAR_PATH} platform updateApp \
#    --itemId 'a8uCeZFl' \
#    --namespace "test" \
#    --storeId 'LtEVpDAE' \
#    --body '{"carousel": [{"alt": "bA82jy74", "previewUrl": "lq0pDE5x", "thumbnailUrl": "Rwh5b45e", "type": "image", "url": "pcM7ScSs", "videoSource": "vimeo"}], "developer": "OpAwIp9r", "forumUrl": "Rtn1PcCx", "genres": ["Action"], "localizations": {"bumeYgOd": {"announcement": "EBWRQiW3", "slogan": "KFfU8icH"}}, "platformRequirements": {"4081gRB1": [{"additionals": "GyLfLg4R", "directXVersion": "YuEbgUDE", "diskSpace": "cJyIvsPw", "graphics": "Or0BmV5i", "label": "FvfwFjTS", "osVersion": "mIEqoLyL", "processor": "eUGmomGX", "ram": "9sXTZ0v8", "soundCard": "pqLfc5Sw"}]}, "platforms": ["Android"], "players": ["Multi"], "primaryGenre": "Strategy", "publisher": "eUULDX4Q", "releaseDate": "1994-09-25T00:00:00Z", "websiteUrl": "bb5nh68Z"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateApp'
#delete_file $TEMP_FILE
#
##- 87 DisableItem
#java -jar ${JAR_PATH} platform disableItem \
#    --itemId 'nyUtRvW9' \
#    --namespace "test" \
#    --storeId 'hNBSFTtF' \
#    >$TEMP_FILE 2>&1
#update_status $? 'DisableItem'
#delete_file $TEMP_FILE
#
##- 88 GetItemDynamicData
#java -jar ${JAR_PATH} platform getItemDynamicData \
#    --itemId 'rOmjkFrF' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetItemDynamicData'
#delete_file $TEMP_FILE
#
##- 89 EnableItem
#java -jar ${JAR_PATH} platform enableItem \
#    --itemId 'VA8t0xF3' \
#    --namespace "test" \
#    --storeId '4Xpt6ZlT' \
#    >$TEMP_FILE 2>&1
#update_status $? 'EnableItem'
#delete_file $TEMP_FILE
#
##- 90 FeatureItem
#java -jar ${JAR_PATH} platform featureItem \
#    --feature 'Tic0kr2a' \
#    --itemId '0nI2oo7U' \
#    --namespace "test" \
#    --storeId 'HCJK5sp0' \
#    >$TEMP_FILE 2>&1
#update_status $? 'FeatureItem'
#delete_file $TEMP_FILE
#
##- 91 DefeatureItem
#java -jar ${JAR_PATH} platform defeatureItem \
#    --feature 'aCvIq3aH' \
#    --itemId 'VYIlewLR' \
#    --namespace "test" \
#    --storeId 'uHY83bGj' \
#    >$TEMP_FILE 2>&1
#update_status $? 'DefeatureItem'
#delete_file $TEMP_FILE
#
##- 92 GetLocaleItem
#java -jar ${JAR_PATH} platform getLocaleItem \
#    --itemId '0HTeeWXl' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetLocaleItem'
#delete_file $TEMP_FILE
#
##- 93 ReturnItem
#java -jar ${JAR_PATH} platform returnItem \
#    --itemId 'IcRidqct' \
#    --namespace "test" \
#    --body '{"orderNo": "DpygY0ax"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'ReturnItem'
#delete_file $TEMP_FILE
#
##- 94 QueryKeyGroups
#java -jar ${JAR_PATH} platform queryKeyGroups \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryKeyGroups'
#delete_file $TEMP_FILE
#
##- 95 CreateKeyGroup
#java -jar ${JAR_PATH} platform createKeyGroup \
#    --namespace "test" \
#    --body '{"description": "476ED4MM", "name": "O9Tw2JH0", "status": "INACTIVE", "tags": ["hWIwHWTg"]}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CreateKeyGroup'
#delete_file $TEMP_FILE
#
##- 96 GetKeyGroup
#java -jar ${JAR_PATH} platform getKeyGroup \
#    --keyGroupId 'zJFRYw6t' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetKeyGroup'
#delete_file $TEMP_FILE
#
##- 97 UpdateKeyGroup
#java -jar ${JAR_PATH} platform updateKeyGroup \
#    --keyGroupId '1IKZLO6V' \
#    --namespace "test" \
#    --body '{"description": "4Ode46Qm", "name": "CidgdpP7", "status": "INACTIVE", "tags": ["587lmUmB"]}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateKeyGroup'
#delete_file $TEMP_FILE
#
##- 98 GetKeyGroupDynamic
#java -jar ${JAR_PATH} platform getKeyGroupDynamic \
#    --keyGroupId 'ziPZBnpO' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetKeyGroupDynamic'
#delete_file $TEMP_FILE
#
##- 99 ListKeys
#java -jar ${JAR_PATH} platform listKeys \
#    --keyGroupId 'fkllxfq0' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'ListKeys'
#delete_file $TEMP_FILE
#
##- 100 UploadKeys
#java -jar ${JAR_PATH} platform uploadKeys \
#    --keyGroupId 'NsrSjw5H' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'UploadKeys'
#delete_file $TEMP_FILE
#
##- 101 QueryOrders
#java -jar ${JAR_PATH} platform queryOrders \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryOrders'
#delete_file $TEMP_FILE
#
##- 102 GetOrderStatistics
#java -jar ${JAR_PATH} platform getOrderStatistics \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetOrderStatistics'
#delete_file $TEMP_FILE
#
##- 103 GetOrder
#java -jar ${JAR_PATH} platform getOrder \
#    --namespace "test" \
#    --orderNo 'og0blM1d' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetOrder'
#delete_file $TEMP_FILE
#
##- 104 RefundOrder
#java -jar ${JAR_PATH} platform refundOrder \
#    --namespace "test" \
#    --orderNo '5MStYGcz' \
#    --body '{"description": "LINlEC0O"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'RefundOrder'
#delete_file $TEMP_FILE
#
##- 105 GetPaymentCallbackConfig
#java -jar ${JAR_PATH} platform getPaymentCallbackConfig \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetPaymentCallbackConfig'
#delete_file $TEMP_FILE
#
##- 106 UpdatePaymentCallbackConfig
#java -jar ${JAR_PATH} platform updatePaymentCallbackConfig \
#    --namespace "test" \
#    --body '{"dryRun": true, "notifyUrl": "sE3yzIsU", "privateKey": "P0NjluOr"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdatePaymentCallbackConfig'
#delete_file $TEMP_FILE
#
##- 107 QueryPaymentNotifications
#java -jar ${JAR_PATH} platform queryPaymentNotifications \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryPaymentNotifications'
#delete_file $TEMP_FILE
#
##- 108 QueryPaymentOrders
#java -jar ${JAR_PATH} platform queryPaymentOrders \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryPaymentOrders'
#delete_file $TEMP_FILE
#
##- 109 CreatePaymentOrderByDedicated
#java -jar ${JAR_PATH} platform createPaymentOrderByDedicated \
#    --namespace "test" \
#    --body '{"currencyCode": "GZTzsLW7", "currencyNamespace": "Fjfs9nIk", "customParameters": {"cZ38fUEa": {}}, "description": "njKHbXfk", "extOrderNo": "1zxdzxg0", "extUserId": "UXcRyHi3", "itemType": "SUBSCRIPTION", "language": "8BzVWu1t", "metadata": {"OmhUtCgc": "pvGrEbcZ"}, "notifyUrl": "UDExH1ta", "omitNotification": true, "price": 80, "recurringPaymentOrderNo": "GXIHzMRj", "region": "MCtOJsEi", "returnUrl": "jlrbpyyE", "sandbox": false, "sku": "QxVgJIjM", "subscriptionId": "ZqcWfMl6", "targetNamespace": "dqrpD4tn", "targetUserId": "c3ZRB3Ik", "title": "dtPfAJEo"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CreatePaymentOrderByDedicated'
#delete_file $TEMP_FILE
#
##- 110 ListExtOrderNoByExtTxId
#java -jar ${JAR_PATH} platform listExtOrderNoByExtTxId \
#    --namespace "test" \
#    --extTxId 'mwenJvQ8' \
#    >$TEMP_FILE 2>&1
#update_status $? 'ListExtOrderNoByExtTxId'
#delete_file $TEMP_FILE
#
##- 111 GetPaymentOrder
#java -jar ${JAR_PATH} platform getPaymentOrder \
#    --namespace "test" \
#    --paymentOrderNo 'grtQSv6E' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetPaymentOrder'
#delete_file $TEMP_FILE
#
##- 112 ChargePaymentOrder
#java -jar ${JAR_PATH} platform chargePaymentOrder \
#    --namespace "test" \
#    --paymentOrderNo 'cALcMIPm' \
#    --body '{"extTxId": "s5bT51M4", "paymentMethod": "yko8S0En", "paymentProvider": "ALIPAY"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'ChargePaymentOrder'
#delete_file $TEMP_FILE
#
##- 113 RefundPaymentOrderByDedicated
#java -jar ${JAR_PATH} platform refundPaymentOrderByDedicated \
#    --namespace "test" \
#    --paymentOrderNo 'GvfuSyCT' \
#    --body '{"description": "yjj4mCai"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'RefundPaymentOrderByDedicated'
#delete_file $TEMP_FILE
#
##- 114 SimulatePaymentOrderNotification
#java -jar ${JAR_PATH} platform simulatePaymentOrderNotification \
#    --namespace "test" \
#    --paymentOrderNo 'uMGKOF5G' \
#    --body '{"amount": 70, "currencyCode": "JooSXUl3", "notifyType": "CHARGE", "paymentProvider": "WXPAY", "salesTax": 53, "vat": 54}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'SimulatePaymentOrderNotification'
#delete_file $TEMP_FILE
#
##- 115 GetPaymentOrderChargeStatus
#java -jar ${JAR_PATH} platform getPaymentOrderChargeStatus \
#    --namespace "test" \
#    --paymentOrderNo 'nOlxDznI' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetPaymentOrderChargeStatus'
#delete_file $TEMP_FILE
#
##- 116 CreateReward
#java -jar ${JAR_PATH} platform createReward \
#    --namespace "test" \
#    --body '{"description": "CQVyqBg3", "eventTopic": "4WTtDkn0", "maxAwarded": 34, "maxAwardedPerUser": 38, "rewardCode": "n6t0Yx4z", "rewardConditions": [{"condition": "12EaQ1rU", "conditionName": "QYCNTiDX", "eventName": "4jE3M2Is", "rewardItems": [{"duration": 90, "itemId": "Hu8QwNyO", "quantity": 22}]}]}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CreateReward'
#delete_file $TEMP_FILE
#
##- 117 QueryRewards
#java -jar ${JAR_PATH} platform queryRewards \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryRewards'
#delete_file $TEMP_FILE
#
##- 118 ExportRewards
#java -jar ${JAR_PATH} platform exportRewards \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'ExportRewards'
#delete_file $TEMP_FILE

#- 119 ImportRewards
java -jar ${JAR_PATH} platform importRewards \
    --namespace "test" \
    --replaceExisting
    >$TEMP_FILE 2>&1
update_status $? 'ImportRewards'
delete_file $TEMP_FILE
#
##- 120 GetReward
#java -jar ${JAR_PATH} platform getReward \
#    --namespace "test" \
#    --rewardId 'XfIWd0mc' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetReward'
#delete_file $TEMP_FILE
#
##- 121 UpdateReward
#java -jar ${JAR_PATH} platform updateReward \
#    --namespace "test" \
#    --rewardId 'q5T4SUc7' \
#    --body '{"description": "cWfCKK6D", "eventTopic": "ij1gFcen", "maxAwarded": 60, "maxAwardedPerUser": 77, "rewardCode": "ySPfhxBe", "rewardConditions": [{"condition": "nDiTiAqF", "conditionName": "YmFKjaEL", "eventName": "mmll6oex", "rewardItems": [{"duration": 68, "itemId": "d1OKGUN2", "quantity": 93}]}]}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateReward'
#delete_file $TEMP_FILE
#
##- 122 DeleteReward
#java -jar ${JAR_PATH} platform deleteReward \
#    --namespace "test" \
#    --rewardId 'znd7uVa7' \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeleteReward'
#delete_file $TEMP_FILE
#
##- 123 CheckEventCondition
#java -jar ${JAR_PATH} platform checkEventCondition \
#    --namespace "test" \
#    --rewardId 't14yvSYS' \
#    --body '{"payload": {"V52bHifC": {}}}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CheckEventCondition'
#delete_file $TEMP_FILE
#
##- 124 ListStores
#java -jar ${JAR_PATH} platform listStores \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'ListStores'
#delete_file $TEMP_FILE
#
##- 125 CreateStore
#java -jar ${JAR_PATH} platform createStore \
#    --namespace "test" \
#    --body '{"defaultLanguage": "If4tsuu6", "defaultRegion": "Pkam6tFS", "description": "YFt4ZxA2", "supportedLanguages": ["PzZFRkBN"], "supportedRegions": ["lg6hn5qu"], "title": "sKyZAuV6"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CreateStore'
#delete_file $TEMP_FILE
#
##- 126 ImportStore
#java -jar ${JAR_PATH} platform importStore \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'ImportStore'
#delete_file $TEMP_FILE
#
##- 127 GetPublishedStore
#java -jar ${JAR_PATH} platform getPublishedStore \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetPublishedStore'
#delete_file $TEMP_FILE
#
##- 128 DeletePublishedStore
#java -jar ${JAR_PATH} platform deletePublishedStore \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeletePublishedStore'
#delete_file $TEMP_FILE
#
##- 129 GetPublishedStoreBackup
#java -jar ${JAR_PATH} platform getPublishedStoreBackup \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetPublishedStoreBackup'
#delete_file $TEMP_FILE
#
##- 130 RollbackPublishedStore
#java -jar ${JAR_PATH} platform rollbackPublishedStore \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'RollbackPublishedStore'
#delete_file $TEMP_FILE
#
##- 131 GetStore
#java -jar ${JAR_PATH} platform getStore \
#    --namespace "test" \
#    --storeId 'uUvqM0lV' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetStore'
#delete_file $TEMP_FILE
#
##- 132 UpdateStore
#java -jar ${JAR_PATH} platform updateStore \
#    --namespace "test" \
#    --storeId '6UZMlEbx' \
#    --body '{"defaultLanguage": "HNgJRiQE", "defaultRegion": "xaunjdAq", "description": "nHUz44tx", "supportedLanguages": ["4O6hamPw"], "supportedRegions": ["Noi071ez"], "title": "DK56JFIG"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateStore'
#delete_file $TEMP_FILE
#
##- 133 DeleteStore
#java -jar ${JAR_PATH} platform deleteStore \
#    --namespace "test" \
#    --storeId 'e1IMUCLc' \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeleteStore'
#delete_file $TEMP_FILE
#
##- 134 CloneStore
#java -jar ${JAR_PATH} platform cloneStore \
#    --namespace "test" \
#    --storeId 'N0DsaD5F' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CloneStore'
#delete_file $TEMP_FILE
#
##- 135 ExportStore
#java -jar ${JAR_PATH} platform exportStore \
#    --namespace "test" \
#    --storeId 'yBsFe9OY' \
#    >$TEMP_FILE 2>&1
#update_status $? 'ExportStore'
#delete_file $TEMP_FILE
#
##- 136 QuerySubscriptions
#java -jar ${JAR_PATH} platform querySubscriptions \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'QuerySubscriptions'
#delete_file $TEMP_FILE
#
##- 137 RecurringChargeSubscription
#java -jar ${JAR_PATH} platform recurringChargeSubscription \
#    --namespace "test" \
#    --subscriptionId 'EJVsYffm' \
#    >$TEMP_FILE 2>&1
#update_status $? 'RecurringChargeSubscription'
#delete_file $TEMP_FILE
#
##- 138 GetTicketDynamic
#java -jar ${JAR_PATH} platform getTicketDynamic \
#    --boothName 'hyx6J25P' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetTicketDynamic'
#delete_file $TEMP_FILE
#
##- 139 DecreaseTicketSale
#java -jar ${JAR_PATH} platform decreaseTicketSale \
#    --boothName 'rM4S3cB8' \
#    --namespace "test" \
#    --body '{"orderNo": "m17hEeLL"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'DecreaseTicketSale'
#delete_file $TEMP_FILE
#
##- 140 GetTicketBoothID
#java -jar ${JAR_PATH} platform getTicketBoothID \
#    --boothName 'goaYth6z' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetTicketBoothID'
#delete_file $TEMP_FILE
#
##- 141 IncreaseTicketSale
#java -jar ${JAR_PATH} platform increaseTicketSale \
#    --boothName 'cf8eA45O' \
#    --namespace "test" \
#    --body '{"count": 77, "orderNo": "vObWejo9"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'IncreaseTicketSale'
#delete_file $TEMP_FILE
#
##- 142 AnonymizeCampaign
#java -jar ${JAR_PATH} platform anonymizeCampaign \
#    --namespace "test" \
#    --userId 'LfGeegJM' \
#    >$TEMP_FILE 2>&1
#update_status $? 'AnonymizeCampaign'
#delete_file $TEMP_FILE
#
##- 143 AnonymizeEntitlement
#java -jar ${JAR_PATH} platform anonymizeEntitlement \
#    --namespace "test" \
#    --userId 'aBGR6D1Z' \
#    >$TEMP_FILE 2>&1
#update_status $? 'AnonymizeEntitlement'
#delete_file $TEMP_FILE
#
##- 144 AnonymizeFulfillment
#java -jar ${JAR_PATH} platform anonymizeFulfillment \
#    --namespace "test" \
#    --userId 'oZEZQkJ8' \
#    >$TEMP_FILE 2>&1
#update_status $? 'AnonymizeFulfillment'
#delete_file $TEMP_FILE
#
##- 145 AnonymizeIntegration
#java -jar ${JAR_PATH} platform anonymizeIntegration \
#    --namespace "test" \
#    --userId 'DSqFnhdK' \
#    >$TEMP_FILE 2>&1
#update_status $? 'AnonymizeIntegration'
#delete_file $TEMP_FILE
#
##- 146 AnonymizeOrder
#java -jar ${JAR_PATH} platform anonymizeOrder \
#    --namespace "test" \
#    --userId 'vjFCFbSF' \
#    >$TEMP_FILE 2>&1
#update_status $? 'AnonymizeOrder'
#delete_file $TEMP_FILE
#
##- 147 AnonymizePayment
#java -jar ${JAR_PATH} platform anonymizePayment \
#    --namespace "test" \
#    --userId 'lEWoMPdg' \
#    >$TEMP_FILE 2>&1
#update_status $? 'AnonymizePayment'
#delete_file $TEMP_FILE
#
##- 148 AnonymizeSubscription
#java -jar ${JAR_PATH} platform anonymizeSubscription \
#    --namespace "test" \
#    --userId 'K5zn62mh' \
#    >$TEMP_FILE 2>&1
#update_status $? 'AnonymizeSubscription'
#delete_file $TEMP_FILE
#
##- 149 AnonymizeWallet
#java -jar ${JAR_PATH} platform anonymizeWallet \
#    --namespace "test" \
#    --userId 'nFSpCTlD' \
#    >$TEMP_FILE 2>&1
#update_status $? 'AnonymizeWallet'
#delete_file $TEMP_FILE
#
##- 150 QueryUserEntitlements
#java -jar ${JAR_PATH} platform queryUserEntitlements \
#    --namespace "test" \
#    --userId 'NBOcygvv' \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryUserEntitlements'
#delete_file $TEMP_FILE
#
##- 151 GrantUserEntitlement
#java -jar ${JAR_PATH} platform grantUserEntitlement \
#    --namespace "test" \
#    --userId '2LAgfBGV' \
#    --body '[{"endDate": "1982-12-31T00:00:00Z", "grantedCode": "nbKYsB0g", "itemId": "qJ8VhYSi", "itemNamespace": "kJl2p9rB", "language": "x8N5egap", "quantity": 33, "region": "xDy4cLfN", "source": "PROMOTION", "startDate": "1983-07-23T00:00:00Z", "storeId": "EZYA8jIk"}]' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GrantUserEntitlement'
#delete_file $TEMP_FILE
#
##- 152 GetUserAppEntitlementByAppId
#java -jar ${JAR_PATH} platform getUserAppEntitlementByAppId \
#    --namespace "test" \
#    --userId 'MJb7cZ2b' \
#    --appId 'PsaLLpEB' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetUserAppEntitlementByAppId'
#delete_file $TEMP_FILE
#
##- 153 QueryUserEntitlementsByAppType
#java -jar ${JAR_PATH} platform queryUserEntitlementsByAppType \
#    --namespace "test" \
#    --userId 'VEMk5AsK' \
#    --appType 'DEMO' \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryUserEntitlementsByAppType'
#delete_file $TEMP_FILE
#
##- 154 GetUserEntitlementByItemId
#java -jar ${JAR_PATH} platform getUserEntitlementByItemId \
#    --namespace "test" \
#    --userId 'F2P44lXk' \
#    --itemId 'I3zdiRiC' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetUserEntitlementByItemId'
#delete_file $TEMP_FILE
#
##- 155 GetUserEntitlementBySku
#java -jar ${JAR_PATH} platform getUserEntitlementBySku \
#    --namespace "test" \
#    --userId '5IbPit71' \
#    --sku 'JWlYCoi4' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetUserEntitlementBySku'
#delete_file $TEMP_FILE
#
##- 156 ExistsAnyUserActiveEntitlement
#java -jar ${JAR_PATH} platform existsAnyUserActiveEntitlement \
#    --namespace "test" \
#    --userId 'nDfPu5V6' \
#    >$TEMP_FILE 2>&1
#update_status $? 'ExistsAnyUserActiveEntitlement'
#delete_file $TEMP_FILE
#
##- 157 ExistsAnyUserActiveEntitlementByItemIds
#java -jar ${JAR_PATH} platform existsAnyUserActiveEntitlementByItemIds \
#    --namespace "test" \
#    --userId 'QSYxEVOr' \
#    --itemIds '["yVuZYmgU"]' \
#    >$TEMP_FILE 2>&1
#update_status $? 'ExistsAnyUserActiveEntitlementByItemIds'
#delete_file $TEMP_FILE
#
##- 158 GetUserAppEntitlementOwnershipByAppId
#java -jar ${JAR_PATH} platform getUserAppEntitlementOwnershipByAppId \
#    --namespace "test" \
#    --userId 'eEPB5AGP' \
#    --appId 'gvk0Ztha' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetUserAppEntitlementOwnershipByAppId'
#delete_file $TEMP_FILE
#
##- 159 GetUserEntitlementOwnershipByItemId
#java -jar ${JAR_PATH} platform getUserEntitlementOwnershipByItemId \
#    --namespace "test" \
#    --userId 'j0EBA4az' \
#    --itemId 'Rz0d56sm' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetUserEntitlementOwnershipByItemId'
#delete_file $TEMP_FILE
#
##- 160 GetUserEntitlementOwnershipBySku
#java -jar ${JAR_PATH} platform getUserEntitlementOwnershipBySku \
#    --namespace "test" \
#    --userId 'obor4p1P' \
#    --sku 'lgQB9EcN' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetUserEntitlementOwnershipBySku'
#delete_file $TEMP_FILE
#
##- 161 RevokeUserEntitlements
#java -jar ${JAR_PATH} platform revokeUserEntitlements \
#    --namespace "test" \
#    --userId 'GOeBRY6G' \
#    --entitlementIds '5ae07deD' \
#    >$TEMP_FILE 2>&1
#update_status $? 'RevokeUserEntitlements'
#delete_file $TEMP_FILE
#
##- 162 GetUserEntitlement
#java -jar ${JAR_PATH} platform getUserEntitlement \
#    --entitlementId 'LaZ8JCvb' \
#    --namespace "test" \
#    --userId 'eTfW0hgz' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetUserEntitlement'
#delete_file $TEMP_FILE
#
##- 163 UpdateUserEntitlement
#java -jar ${JAR_PATH} platform updateUserEntitlement \
#    --entitlementId 'rabLJxEw' \
#    --namespace "test" \
#    --userId 'JrEBmQ64' \
#    --body '{"endDate": "1974-01-04T00:00:00Z", "nullFieldList": ["NOzlGu68"], "startDate": "1994-07-09T00:00:00Z", "status": "CONSUMED", "useCount": 30}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateUserEntitlement'
#delete_file $TEMP_FILE
#
##- 164 ConsumeUserEntitlement
#java -jar ${JAR_PATH} platform consumeUserEntitlement \
#    --entitlementId 'jdDetnoT' \
#    --namespace "test" \
#    --userId '0rfWtVPw' \
#    --body '{"useCount": 84}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'ConsumeUserEntitlement'
#delete_file $TEMP_FILE
#
##- 165 DisableUserEntitlement
#java -jar ${JAR_PATH} platform disableUserEntitlement \
#    --entitlementId 'fq6V92gb' \
#    --namespace "test" \
#    --userId 'fPouNdmP' \
#    >$TEMP_FILE 2>&1
#update_status $? 'DisableUserEntitlement'
#delete_file $TEMP_FILE
#
##- 166 EnableUserEntitlement
#java -jar ${JAR_PATH} platform enableUserEntitlement \
#    --entitlementId '7fckVnuD' \
#    --namespace "test" \
#    --userId 'GvYIb1p5' \
#    >$TEMP_FILE 2>&1
#update_status $? 'EnableUserEntitlement'
#delete_file $TEMP_FILE
#
##- 167 GetUserEntitlementHistories
#java -jar ${JAR_PATH} platform getUserEntitlementHistories \
#    --entitlementId 'tcR5z8ZJ' \
#    --namespace "test" \
#    --userId 'LjSHcaR3' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetUserEntitlementHistories'
#delete_file $TEMP_FILE
#
##- 168 RevokeUserEntitlement
#java -jar ${JAR_PATH} platform revokeUserEntitlement \
#    --entitlementId 'X4tZmwr0' \
#    --namespace "test" \
#    --userId 'QmOnsEg4' \
#    >$TEMP_FILE 2>&1
#update_status $? 'RevokeUserEntitlement'
#delete_file $TEMP_FILE
#
##- 169 FulfillItem
#java -jar ${JAR_PATH} platform fulfillItem \
#    --namespace "test" \
#    --userId '9eXp0xQk' \
#    --body '{"duration": 70, "endDate": "1975-06-16T00:00:00Z", "itemId": "wWWy0tU1", "itemSku": "1PCeSrve", "language": "jUKwVfF3", "order": {"currency": {"currencyCode": "7Vr7mkDz", "currencySymbol": "FBI1Vwhk", "currencyType": "VIRTUAL", "decimals": 22, "namespace": "NFOUHBJs"}, "ext": {"vTsqk9hg": {}}, "free": false}, "orderNo": "j6nUdebW", "quantity": 93, "region": "skbPkkZA", "source": "PROMOTION", "startDate": "1997-02-07T00:00:00Z", "storeId": "1KxCtWAD"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'FulfillItem'
#delete_file $TEMP_FILE
#
##- 170 RedeemCode
#java -jar ${JAR_PATH} platform redeemCode \
#    --namespace "test" \
#    --userId 'U2guN6U9' \
#    --body '{"code": "w13W1K9T", "language": "ZQ4qRLEi", "region": "5wowE36r"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'RedeemCode'
#delete_file $TEMP_FILE
#
##- 171 FulfillRewards
#java -jar ${JAR_PATH} platform fulfillRewards \
#    --namespace "test" \
#    --userId 'fmM0CCs3' \
#    --body '{"rewards": [{"currency": {"currencyCode": "5TPUPLms", "namespace": "Y8WgwSx1"}, "item": {"itemId": "DI5GH9bv", "itemSku": "9ZTo2HpA", "itemType": "6pzjHpZO"}, "quantity": 61, "type": "ITEM"}], "source": "OTHER"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'FulfillRewards'
#delete_file $TEMP_FILE
#
##- 172 QueryUserIAPOrders
#java -jar ${JAR_PATH} platform queryUserIAPOrders \
#    --namespace "test" \
#    --userId 'gRPJK3nB' \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryUserIAPOrders'
#delete_file $TEMP_FILE
#
##- 173 QueryAllUserIAPOrders
#java -jar ${JAR_PATH} platform queryAllUserIAPOrders \
#    --namespace "test" \
#    --userId 'ae3GOgbQ' \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryAllUserIAPOrders'
#delete_file $TEMP_FILE
#
##- 174 MockFulfillIAPItem
#java -jar ${JAR_PATH} platform mockFulfillIAPItem \
#    --namespace "test" \
#    --userId 'rqra0Ptk' \
#    --body '{"language": "fvOpY2ra", "productId": "mp5lnBn6", "region": "xmBkfMtC", "type": "APPLE"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'MockFulfillIAPItem'
#delete_file $TEMP_FILE
#
##- 175 QueryUserOrders
#java -jar ${JAR_PATH} platform queryUserOrders \
#    --namespace "test" \
#    --userId 'Fq0kPOkO' \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryUserOrders'
#delete_file $TEMP_FILE
#
##- 176 CountOfPurchasedItem
#java -jar ${JAR_PATH} platform countOfPurchasedItem \
#    --namespace "test" \
#    --userId 'Rm2XjlNE' \
#    --itemId 'E5ecPzAm' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CountOfPurchasedItem'
#delete_file $TEMP_FILE
#
##- 177 GetUserOrder
#java -jar ${JAR_PATH} platform getUserOrder \
#    --namespace "test" \
#    --orderNo 'i0ySJHfP' \
#    --userId 'loP1XkYK' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetUserOrder'
#delete_file $TEMP_FILE
#
##- 178 UpdateUserOrderStatus
#java -jar ${JAR_PATH} platform updateUserOrderStatus \
#    --namespace "test" \
#    --orderNo '4MgIsDSF' \
#    --userId 'MPyMhyw1' \
#    --body '{"status": "DELETED", "statusReason": "LZPVwwxH"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateUserOrderStatus'
#delete_file $TEMP_FILE
#
##- 179 FulfillUserOrder
#java -jar ${JAR_PATH} platform fulfillUserOrder \
#    --namespace "test" \
#    --orderNo '4BIDJuDo' \
#    --userId 'ShMMftll' \
#    >$TEMP_FILE 2>&1
#update_status $? 'FulfillUserOrder'
#delete_file $TEMP_FILE
#
##- 180 GetUserOrderGrant
#java -jar ${JAR_PATH} platform getUserOrderGrant \
#    --namespace "test" \
#    --orderNo '8N0VvChH' \
#    --userId 'z9urmt7Q' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetUserOrderGrant'
#delete_file $TEMP_FILE
#
##- 181 GetUserOrderHistories
#java -jar ${JAR_PATH} platform getUserOrderHistories \
#    --namespace "test" \
#    --orderNo 'WvE8s6Uz' \
#    --userId '8BRuYWDT' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetUserOrderHistories'
#delete_file $TEMP_FILE
#
##- 182 ProcessUserOrderNotification
#java -jar ${JAR_PATH} platform processUserOrderNotification \
#    --namespace "test" \
#    --orderNo 'tL6MTTRk' \
#    --userId 'Cbb9S5Q1' \
#    --body '{"additionalData": {"cardSummary": "IVHGT88p"}, "authorisedTime": "1979-12-13T00:00:00Z", "chargebackReversedTime": "1986-08-03T00:00:00Z", "chargebackTime": "1974-11-18T00:00:00Z", "chargedTime": "1995-01-24T00:00:00Z", "createdTime": "1987-10-06T00:00:00Z", "currency": {"currencyCode": "9JumohtU", "currencySymbol": "13gf7TRi", "currencyType": "REAL", "decimals": 79, "namespace": "Zj5w5y3H"}, "customParameters": {"mK8QVOa6": {}}, "extOrderNo": "2eQZtbLL", "extTxId": "cF671WLt", "extUserId": "v38Heccz", "issuedAt": "1978-05-03T00:00:00Z", "metadata": {"FmeRwpcJ": "BZyi3mLC"}, "namespace": "4KzekiSz", "nonceStr": "eyolnOQt", "paymentMethod": "0joVHgCy", "paymentMethodFee": 39, "paymentOrderNo": "C6lRG98Y", "paymentProvider": "ALIPAY", "paymentProviderFee": 27, "paymentStationUrl": "HbRdoTKK", "price": 9, "refundedTime": "1981-12-19T00:00:00Z", "salesTax": 19, "sandbox": false, "sku": "Ze9i1osg", "status": "AUTHORISED", "statusReason": "F1hzi1Nl", "subscriptionId": "47syJ5ib", "subtotalPrice": 51, "targetNamespace": "SHZeCLIv", "targetUserId": "WPVRsdEq", "tax": 53, "totalPrice": 48, "totalTax": 91, "txEndTime": "1979-10-31T00:00:00Z", "type": "gsycTgmP", "userId": "zc20EuO5", "vat": 7}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'ProcessUserOrderNotification'
#delete_file $TEMP_FILE
#
##- 183 DownloadUserOrderReceipt
#java -jar ${JAR_PATH} platform downloadUserOrderReceipt \
#    --namespace "test" \
#    --orderNo 'MqGDlSZP' \
#    --userId 'Y07rEVSj' \
#    >$TEMP_FILE 2>&1
#update_status $? 'DownloadUserOrderReceipt'
#delete_file $TEMP_FILE
#
##- 184 CreateUserPaymentOrder
#java -jar ${JAR_PATH} platform createUserPaymentOrder \
#    --namespace "test" \
#    --userId 'zHjL6ZbX' \
#    --body '{"currencyCode": "jG6DSmpp", "currencyNamespace": "3op8htaR", "customParameters": {"LxtW4PvF": {}}, "description": "kESTULat", "extOrderNo": "5F1Le7cR", "extUserId": "7q6PWhZm", "itemType": "BUNDLE", "language": "Kz41i1Tp", "metadata": {"78FipJHa": "hViJvLYW"}, "notifyUrl": "0kdmlk2l", "omitNotification": true, "price": 32, "recurringPaymentOrderNo": "SOOA2VOZ", "region": "BoNbB98P", "returnUrl": "uSGykqFz", "sandbox": true, "sku": "SMXT53bB", "subscriptionId": "uL38beOY", "title": "DVuHZQ9L"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CreateUserPaymentOrder'
#delete_file $TEMP_FILE
#
##- 185 RefundUserPaymentOrder
#java -jar ${JAR_PATH} platform refundUserPaymentOrder \
#    --namespace "test" \
#    --paymentOrderNo 'Yt6w23Wf' \
#    --userId '8iEQo72s' \
#    --body '{"description": "H0aRdcDl"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'RefundUserPaymentOrder'
#delete_file $TEMP_FILE
#
##- 186 ApplyUserRedemption
#java -jar ${JAR_PATH} platform applyUserRedemption \
#    --namespace "test" \
#    --userId 'DyGcsfIu' \
#    --body '{"code": "I4Dv5lEJ", "orderNo": "pK1AyRlz"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'ApplyUserRedemption'
#delete_file $TEMP_FILE
#
##- 187 QueryUserSubscriptions
#java -jar ${JAR_PATH} platform queryUserSubscriptions \
#    --namespace "test" \
#    --userId 'srRXEFZi' \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryUserSubscriptions'
#delete_file $TEMP_FILE
#
##- 188 GetUserSubscriptionActivities
#java -jar ${JAR_PATH} platform getUserSubscriptionActivities \
#    --namespace "test" \
#    --userId 'vQOHG6wV' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetUserSubscriptionActivities'
#delete_file $TEMP_FILE
#
##- 189 PlatformSubscribeSubscription
#java -jar ${JAR_PATH} platform platformSubscribeSubscription \
#    --namespace "test" \
#    --userId 'icNratsv' \
#    --body '{"grantDays": 43, "itemId": "HLmIohfN", "language": "ISLXMDWD", "reason": "dm5FE4ll", "region": "iQMnutJb", "source": "pEo4mUNH"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PlatformSubscribeSubscription'
#delete_file $TEMP_FILE
#
##- 190 CheckUserSubscriptionSubscribableByItemId
#java -jar ${JAR_PATH} platform checkUserSubscriptionSubscribableByItemId \
#    --namespace "test" \
#    --userId 'Ftdml2xN' \
#    --itemId 'viWacJc3' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CheckUserSubscriptionSubscribableByItemId'
#delete_file $TEMP_FILE
#
##- 191 GetUserSubscription
#java -jar ${JAR_PATH} platform getUserSubscription \
#    --namespace "test" \
#    --subscriptionId 'Fm7Z548u' \
#    --userId 'uKgoCBqS' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetUserSubscription'
#delete_file $TEMP_FILE
#
##- 192 DeleteUserSubscription
#java -jar ${JAR_PATH} platform deleteUserSubscription \
#    --namespace "test" \
#    --subscriptionId '5uIdCbwC' \
#    --userId 'eeq9ouEd' \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeleteUserSubscription'
#delete_file $TEMP_FILE
#
##- 193 CancelSubscription
#java -jar ${JAR_PATH} platform cancelSubscription \
#    --namespace "test" \
#    --subscriptionId 'DtjOgsyp' \
#    --userId 'Lkm2ZYew' \
#    --body '{"immediate": false, "reason": "0gnYyj6M"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CancelSubscription'
#delete_file $TEMP_FILE
#
##- 194 GrantDaysToSubscription
#java -jar ${JAR_PATH} platform grantDaysToSubscription \
#    --namespace "test" \
#    --subscriptionId 'Xf9G1nty' \
#    --userId 'ebvoeHen' \
#    --body '{"grantDays": 52, "reason": "ALKt7Efx"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GrantDaysToSubscription'
#delete_file $TEMP_FILE
#
##- 195 GetUserSubscriptionBillingHistories
#java -jar ${JAR_PATH} platform getUserSubscriptionBillingHistories \
#    --namespace "test" \
#    --subscriptionId 'IH446oUn' \
#    --userId 'P2S74unX' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetUserSubscriptionBillingHistories'
#delete_file $TEMP_FILE
#
##- 196 ProcessUserSubscriptionNotification
#java -jar ${JAR_PATH} platform processUserSubscriptionNotification \
#    --namespace "test" \
#    --subscriptionId 'wg0JKqVW' \
#    --userId 'W1rjK1ep' \
#    --body '{"additionalData": {"cardSummary": "wkAvcsYv"}, "authorisedTime": "1971-02-26T00:00:00Z", "chargebackReversedTime": "1973-08-09T00:00:00Z", "chargebackTime": "1994-11-24T00:00:00Z", "chargedTime": "1978-01-04T00:00:00Z", "createdTime": "1996-06-09T00:00:00Z", "currency": {"currencyCode": "q7TKiNXm", "currencySymbol": "z7eMrMD5", "currencyType": "REAL", "decimals": 0, "namespace": "UxTCTng0"}, "customParameters": {"xjtdBrjs": {}}, "extOrderNo": "3Kiykt2C", "extTxId": "k2gOlSat", "extUserId": "ECZ2UgwQ", "issuedAt": "1989-05-09T00:00:00Z", "metadata": {"DqYSxTPu": "VlBqirdp"}, "namespace": "3yxnsETl", "nonceStr": "1SvhQuds", "paymentMethod": "jIhXdxiS", "paymentMethodFee": 28, "paymentOrderNo": "WpnnxgX7", "paymentProvider": "WXPAY", "paymentProviderFee": 56, "paymentStationUrl": "PMqzQIxi", "price": 2, "refundedTime": "1974-05-05T00:00:00Z", "salesTax": 79, "sandbox": true, "sku": "HtdB3Ikj", "status": "NOTIFICATION_OF_CHARGEBACK", "statusReason": "aZqhJilr", "subscriptionId": "ZkSSKgP5", "subtotalPrice": 34, "targetNamespace": "xCR77G9d", "targetUserId": "5CA1GORS", "tax": 2, "totalPrice": 74, "totalTax": 27, "txEndTime": "1997-01-20T00:00:00Z", "type": "bWDEupmd", "userId": "LQzPnNfB", "vat": 52}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'ProcessUserSubscriptionNotification'
#delete_file $TEMP_FILE
#
##- 197 AcquireUserTicket
#java -jar ${JAR_PATH} platform acquireUserTicket \
#    --boothName 'cWArbkCf' \
#    --namespace "test" \
#    --userId 'dHIZb03o' \
#    --body '{"count": 38, "orderNo": "qmBuS9V2"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'AcquireUserTicket'
#delete_file $TEMP_FILE
#
##- 198 CheckWallet
#java -jar ${JAR_PATH} platform checkWallet \
#    --currencyCode 'pCZ23UHm' \
#    --namespace "test" \
#    --userId 'k0lpJ4JL' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CheckWallet'
#delete_file $TEMP_FILE
#
##- 199 CreditUserWallet
#java -jar ${JAR_PATH} platform creditUserWallet \
#    --currencyCode 'l01qi7L2' \
#    --namespace "test" \
#    --userId 'oDUoVRUb' \
#    --body '{"amount": 19, "reason": "22P4Sp09", "source": "PURCHASE"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CreditUserWallet'
#delete_file $TEMP_FILE
#
##- 200 PayWithUserWallet
#java -jar ${JAR_PATH} platform payWithUserWallet \
#    --currencyCode 'KmjRUbZV' \
#    --namespace "test" \
#    --userId 'BVS7OK2Z' \
#    --body '{"amount": 34}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PayWithUserWallet'
#delete_file $TEMP_FILE
#
##- 201 GetUserWallet
#java -jar ${JAR_PATH} platform getUserWallet \
#    --namespace "test" \
#    --userId 'dcsckMek' \
#    --walletId 'ROWZ2KUT' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetUserWallet'
#delete_file $TEMP_FILE
#
##- 202 DebitUserWallet
#java -jar ${JAR_PATH} platform debitUserWallet \
#    --namespace "test" \
#    --userId 'qkK2eFaG' \
#    --walletId 'LoSmEEPb' \
#    --body '{"amount": 74, "reason": "ywJsyUie"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'DebitUserWallet'
#delete_file $TEMP_FILE
#
##- 203 DisableUserWallet
#java -jar ${JAR_PATH} platform disableUserWallet \
#    --namespace "test" \
#    --userId '6fZgLllU' \
#    --walletId 'PsO8lg46' \
#    >$TEMP_FILE 2>&1
#update_status $? 'DisableUserWallet'
#delete_file $TEMP_FILE
#
##- 204 EnableUserWallet
#java -jar ${JAR_PATH} platform enableUserWallet \
#    --namespace "test" \
#    --userId 'Si7006vL' \
#    --walletId '2w4aajDA' \
#    >$TEMP_FILE 2>&1
#update_status $? 'EnableUserWallet'
#delete_file $TEMP_FILE
#
##- 205 ListUserWalletTransactions
#java -jar ${JAR_PATH} platform listUserWalletTransactions \
#    --namespace "test" \
#    --userId 'Ox0iJjYl' \
#    --walletId 'eaktqv2W' \
#    >$TEMP_FILE 2>&1
#update_status $? 'ListUserWalletTransactions'
#delete_file $TEMP_FILE
#
##- 206 QueryWallets
#java -jar ${JAR_PATH} platform queryWallets \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryWallets'
#delete_file $TEMP_FILE
#
##- 207 GetWallet
#java -jar ${JAR_PATH} platform getWallet \
#    --namespace "test" \
#    --walletId 'kljQuD5m' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetWallet'
#delete_file $TEMP_FILE
#
##- 208 SyncOrders
#java -jar ${JAR_PATH} platform syncOrders \
#    --end 'nJONqHGq' \
#    --start '8mB7mF2l' \
#    >$TEMP_FILE 2>&1
#update_status $? 'SyncOrders'
#delete_file $TEMP_FILE
#
##- 209 TestAdyenConfig
#java -jar ${JAR_PATH} platform testAdyenConfig \
#    --body '{"allowedPaymentMethods": ["MFcaghFX"], "apiKey": "JIJflRHF", "authoriseAsCapture": false, "blockedPaymentMethods": ["sIqCy4xD"], "liveEndpointUrlPrefix": "ifSSQ5On", "merchantAccount": "2ccEcl3x", "notificationHmacKey": "eiO4bwF5", "notificationPassword": "JOjGoGxK", "notificationUsername": "M3qMce5t", "returnUrl": "fLcpjFZM", "settings": "KCbp0pEb"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'TestAdyenConfig'
#delete_file $TEMP_FILE
#
##- 210 TestAliPayConfig
#java -jar ${JAR_PATH} platform testAliPayConfig \
#    --body '{"appId": "LCLFpHxM", "privateKey": "YF836075", "publicKey": "xEpzdnYt", "returnUrl": "pja5ig2i"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'TestAliPayConfig'
#delete_file $TEMP_FILE
#
##- 211 TestCheckoutConfig
#java -jar ${JAR_PATH} platform testCheckoutConfig \
#    --body '{"publicKey": "sQZga6Vy", "secretKey": "76izPiQR"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'TestCheckoutConfig'
#delete_file $TEMP_FILE
#
##- 212 DebugMatchedPaymentMerchantConfig
#java -jar ${JAR_PATH} platform debugMatchedPaymentMerchantConfig \
#    >$TEMP_FILE 2>&1
#update_status $? 'DebugMatchedPaymentMerchantConfig'
#delete_file $TEMP_FILE
#
##- 213 TestPayPalConfig
#java -jar ${JAR_PATH} platform testPayPalConfig \
#    --body '{"clientID": "jYa8fv5f", "clientSecret": "It22tIZh", "returnUrl": "jhgkigW2", "webHookId": "2zXMWXfb"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'TestPayPalConfig'
#delete_file $TEMP_FILE
#
##- 214 TestStripeConfig
#java -jar ${JAR_PATH} platform testStripeConfig \
#    --body '{"allowedPaymentMethodTypes": ["cM0GIALI"], "publishableKey": "bFCQgBcL", "secretKey": "NT6iOQVY", "webhookSecret": "x5rW2gMs"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'TestStripeConfig'
#delete_file $TEMP_FILE
#
##- 215 TestWxPayConfig
#java -jar ${JAR_PATH} platform testWxPayConfig \
#    --body '{"appId": "I1aYBitS", "key": "n3UDeKj9", "mchid": "7I4WYXLq", "returnUrl": "jN7ktOBT"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'TestWxPayConfig'
#delete_file $TEMP_FILE
#
##- 216 TestXsollaConfig
#java -jar ${JAR_PATH} platform testXsollaConfig \
#    --body '{"apiKey": "raBxWRTV", "flowCompletionUrl": "uYEqGlKD", "merchantId": 44, "projectId": 91, "projectSecretKey": "KXBrXiQc"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'TestXsollaConfig'
#delete_file $TEMP_FILE
#
##- 217 GetPaymentMerchantConfig
#java -jar ${JAR_PATH} platform getPaymentMerchantConfig \
#    --id 'd9IW8kiC' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetPaymentMerchantConfig'
#delete_file $TEMP_FILE
#
##- 218 UpdateAdyenConfig
#java -jar ${JAR_PATH} platform updateAdyenConfig \
#    --id 'KeQJWZBv' \
#    --body '{"allowedPaymentMethods": ["cq1ETvWB"], "apiKey": "xYZJh7B8", "authoriseAsCapture": false, "blockedPaymentMethods": ["bnSu9M2O"], "liveEndpointUrlPrefix": "xD2udaeY", "merchantAccount": "pCXYSMiy", "notificationHmacKey": "87CTqEQB", "notificationPassword": "g36my3sY", "notificationUsername": "2clrDcai", "returnUrl": "n0cOVF1z", "settings": "HwDTI0sJ"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateAdyenConfig'
#delete_file $TEMP_FILE
#
##- 219 TestAdyenConfigById
#java -jar ${JAR_PATH} platform testAdyenConfigById \
#    --id '1Q0kphMT' \
#    >$TEMP_FILE 2>&1
#update_status $? 'TestAdyenConfigById'
#delete_file $TEMP_FILE
#
##- 220 UpdateAliPayConfig
#java -jar ${JAR_PATH} platform updateAliPayConfig \
#    --id 'ggSP2SLc' \
#    --body '{"appId": "uAP7vU97", "privateKey": "1Czw2nbg", "publicKey": "8C7Mvywh", "returnUrl": "u6MjOjuG"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateAliPayConfig'
#delete_file $TEMP_FILE
#
##- 221 TestAliPayConfigById
#java -jar ${JAR_PATH} platform testAliPayConfigById \
#    --id 'zo1Fz4tU' \
#    >$TEMP_FILE 2>&1
#update_status $? 'TestAliPayConfigById'
#delete_file $TEMP_FILE
#
##- 222 UpdateCheckoutConfig
#java -jar ${JAR_PATH} platform updateCheckoutConfig \
#    --id '0aSn98N8' \
#    --body '{"publicKey": "qOUA0z92", "secretKey": "RaDe8ngT"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateCheckoutConfig'
#delete_file $TEMP_FILE
#
##- 223 TestCheckoutConfigById
#java -jar ${JAR_PATH} platform testCheckoutConfigById \
#    --id '8LRQkMnG' \
#    >$TEMP_FILE 2>&1
#update_status $? 'TestCheckoutConfigById'
#delete_file $TEMP_FILE
#
##- 224 UpdatePayPalConfig
#java -jar ${JAR_PATH} platform updatePayPalConfig \
#    --id '1LZyF2md' \
#    --body '{"clientID": "YY6ZMfuT", "clientSecret": "YTKsue48", "returnUrl": "qBEBNAV5", "webHookId": "BTe6ec1z"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdatePayPalConfig'
#delete_file $TEMP_FILE
#
##- 225 TestPayPalConfigById
#java -jar ${JAR_PATH} platform testPayPalConfigById \
#    --id 'A92URCLS' \
#    >$TEMP_FILE 2>&1
#update_status $? 'TestPayPalConfigById'
#delete_file $TEMP_FILE
#
##- 226 UpdateStripeConfig
#java -jar ${JAR_PATH} platform updateStripeConfig \
#    --id 'GPmRBZWu' \
#    --body '{"allowedPaymentMethodTypes": ["nHW7MYvr"], "publishableKey": "6QA7Ppep", "secretKey": "c92HA94e", "webhookSecret": "ACdeyfUp"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateStripeConfig'
#delete_file $TEMP_FILE
#
##- 227 TestStripeConfigById
#java -jar ${JAR_PATH} platform testStripeConfigById \
#    --id 'giPpf8nx' \
#    >$TEMP_FILE 2>&1
#update_status $? 'TestStripeConfigById'
#delete_file $TEMP_FILE
#
##- 228 UpdateWxPayConfig
#java -jar ${JAR_PATH} platform updateWxPayConfig \
#    --id 'KJ3dnmtP' \
#    --body '{"appId": "wa64Y4gP", "key": "EKMhhu9a", "mchid": "6f3xJNtU", "returnUrl": "lKLlIIAe"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateWxPayConfig'
#delete_file $TEMP_FILE
#
##- 229 UpdateWxPayConfigCert
#java -jar ${JAR_PATH} platform updateWxPayConfigCert \
#    --id 'Hbm5M6Ls' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateWxPayConfigCert'
#delete_file $TEMP_FILE
#
##- 230 TestWxPayConfigById
#java -jar ${JAR_PATH} platform testWxPayConfigById \
#    --id 'Y1VMuIEc' \
#    >$TEMP_FILE 2>&1
#update_status $? 'TestWxPayConfigById'
#delete_file $TEMP_FILE
#
##- 231 UpdateXsollaConfig
#java -jar ${JAR_PATH} platform updateXsollaConfig \
#    --id 'Rls68M3M' \
#    --body '{"apiKey": "PMRPBepy", "flowCompletionUrl": "yMz6zfR1", "merchantId": 31, "projectId": 43, "projectSecretKey": "TYYtDOiE"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateXsollaConfig'
#delete_file $TEMP_FILE
#
##- 232 TestXsollaConfigById
#java -jar ${JAR_PATH} platform testXsollaConfigById \
#    --id 'i4RuEcHC' \
#    >$TEMP_FILE 2>&1
#update_status $? 'TestXsollaConfigById'
#delete_file $TEMP_FILE
#
##- 233 UpdateXsollaUIConfig
#java -jar ${JAR_PATH} platform updateXsollaUIConfig \
#    --id 'SGhpOZQF' \
#    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "LARGE", "theme": "DEFAULT"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdateXsollaUIConfig'
#delete_file $TEMP_FILE
#
##- 234 QueryPaymentProviderConfig
#java -jar ${JAR_PATH} platform queryPaymentProviderConfig \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryPaymentProviderConfig'
#delete_file $TEMP_FILE
#
##- 235 CreatePaymentProviderConfig
#java -jar ${JAR_PATH} platform createPaymentProviderConfig \
#    --body '{"aggregate": "ADYEN", "namespace": "KGDFgK49", "region": "YuKnXks0", "sandboxTaxJarApiToken": "m8ANrcRa", "specials": ["ADYEN"], "taxJarApiToken": "7ta3fojA", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'CreatePaymentProviderConfig'
#delete_file $TEMP_FILE
#
##- 236 GetAggregatePaymentProviders
#java -jar ${JAR_PATH} platform getAggregatePaymentProviders \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetAggregatePaymentProviders'
#delete_file $TEMP_FILE
#
##- 237 DebugMatchedPaymentProviderConfig
#java -jar ${JAR_PATH} platform debugMatchedPaymentProviderConfig \
#    >$TEMP_FILE 2>&1
#update_status $? 'DebugMatchedPaymentProviderConfig'
#delete_file $TEMP_FILE
#
##- 238 GetSpecialPaymentProviders
#java -jar ${JAR_PATH} platform getSpecialPaymentProviders \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetSpecialPaymentProviders'
#delete_file $TEMP_FILE
#
##- 239 UpdatePaymentProviderConfig
#java -jar ${JAR_PATH} platform updatePaymentProviderConfig \
#    --id 'J5zlsFBw' \
#    --body '{"aggregate": "XSOLLA", "namespace": "vLYvmg6a", "region": "vudQFF1C", "sandboxTaxJarApiToken": "PNY9u2dV", "specials": ["WALLET"], "taxJarApiToken": "glOOoCeK", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdatePaymentProviderConfig'
#delete_file $TEMP_FILE
#
##- 240 DeletePaymentProviderConfig
#java -jar ${JAR_PATH} platform deletePaymentProviderConfig \
#    --id 'BqVux3lX' \
#    >$TEMP_FILE 2>&1
#update_status $? 'DeletePaymentProviderConfig'
#delete_file $TEMP_FILE
#
##- 241 GetPaymentTaxConfig
#java -jar ${JAR_PATH} platform getPaymentTaxConfig \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetPaymentTaxConfig'
#delete_file $TEMP_FILE
#
##- 242 UpdatePaymentTaxConfig
#java -jar ${JAR_PATH} platform updatePaymentTaxConfig \
#    --body '{"sandboxTaxJarApiToken": "cD8aertA", "taxJarApiToken": "VCqs8XT8", "taxJarEnabled": true, "taxJarProductCodesMapping": {"y3nJ06Kk": "seA0ARj9"}}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'UpdatePaymentTaxConfig'
#delete_file $TEMP_FILE
#
##- 243 SyncPaymentOrders
#java -jar ${JAR_PATH} platform syncPaymentOrders \
#    --end 'ricfayvn' \
#    --start 'hi8MDdY4' \
#    >$TEMP_FILE 2>&1
#update_status $? 'SyncPaymentOrders'
#delete_file $TEMP_FILE
#
##- 244 PublicGetRootCategories
#java -jar ${JAR_PATH} platform publicGetRootCategories \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetRootCategories'
#delete_file $TEMP_FILE
#
##- 245 DownloadCategories
#java -jar ${JAR_PATH} platform downloadCategories \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'DownloadCategories'
#delete_file $TEMP_FILE
#
##- 246 PublicGetCategory
#java -jar ${JAR_PATH} platform publicGetCategory \
#    --categoryPath 'WLHoaUkY' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetCategory'
#delete_file $TEMP_FILE
#
##- 247 PublicGetChildCategories
#java -jar ${JAR_PATH} platform publicGetChildCategories \
#    --categoryPath 'nQp5egdm' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetChildCategories'
#delete_file $TEMP_FILE
#
##- 248 PublicGetDescendantCategories
#java -jar ${JAR_PATH} platform publicGetDescendantCategories \
#    --categoryPath 'VE8ImivN' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetDescendantCategories'
#delete_file $TEMP_FILE
#
##- 249 PublicListCurrencies
#java -jar ${JAR_PATH} platform publicListCurrencies \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicListCurrencies'
#delete_file $TEMP_FILE
#
##- 250 PublicGetItemByAppId
#java -jar ${JAR_PATH} platform publicGetItemByAppId \
#    --namespace "test" \
#    --appId 'tQxqWRKH' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetItemByAppId'
#delete_file $TEMP_FILE
#
##- 251 PublicQueryItems
#java -jar ${JAR_PATH} platform publicQueryItems \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicQueryItems'
#delete_file $TEMP_FILE
#
##- 252 PublicGetItemBySku
#java -jar ${JAR_PATH} platform publicGetItemBySku \
#    --namespace "test" \
#    --sku 'ohODoWOr' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetItemBySku'
#delete_file $TEMP_FILE
#
##- 253 PublicBulkGetItems
#java -jar ${JAR_PATH} platform publicBulkGetItems \
#    --namespace "test" \
#    --itemIds '98kjBUas' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicBulkGetItems'
#delete_file $TEMP_FILE
#
##- 254 PublicSearchItems
#java -jar ${JAR_PATH} platform publicSearchItems \
#    --namespace "test" \
#    --keyword '9jjz2Frg' \
#    --language 'iaGrcB7d' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicSearchItems'
#delete_file $TEMP_FILE
#
##- 255 PublicGetApp
#java -jar ${JAR_PATH} platform publicGetApp \
#    --itemId 'IOVKIPSJ' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetApp'
#delete_file $TEMP_FILE
#
##- 256 PublicGetItemDynamicData
#java -jar ${JAR_PATH} platform publicGetItemDynamicData \
#    --itemId 'JHo5W8tK' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetItemDynamicData'
#delete_file $TEMP_FILE
#
##- 257 PublicGetItem
#java -jar ${JAR_PATH} platform publicGetItem \
#    --itemId 'H8ou9Sdb' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetItem'
#delete_file $TEMP_FILE
#
##- 258 GetPaymentCustomization
#java -jar ${JAR_PATH} platform getPaymentCustomization \
#    --namespace "test" \
#    --paymentProvider 'WALLET' \
#    --region 'SXcrEFCw' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetPaymentCustomization'
#delete_file $TEMP_FILE
#
##- 259 PublicGetPaymentUrl
#java -jar ${JAR_PATH} platform publicGetPaymentUrl \
#    --namespace "test" \
#    --body '{"paymentOrderNo": "qeGNLdIB", "paymentProvider": "WALLET", "returnUrl": "liFQVMKE", "ui": "zVUWlUWD", "zipCode": "s2x1EQU0"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetPaymentUrl'
#delete_file $TEMP_FILE
#
##- 260 PublicGetPaymentMethods
#java -jar ${JAR_PATH} platform publicGetPaymentMethods \
#    --namespace "test" \
#    --paymentOrderNo 'oepEvcja' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetPaymentMethods'
#delete_file $TEMP_FILE
#
##- 261 PublicGetUnpaidPaymentOrder
#java -jar ${JAR_PATH} platform publicGetUnpaidPaymentOrder \
#    --namespace "test" \
#    --paymentOrderNo 'SgEh6jJn' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetUnpaidPaymentOrder'
#delete_file $TEMP_FILE
#
##- 262 Pay
#java -jar ${JAR_PATH} platform pay \
#    --namespace "test" \
#    --paymentOrderNo 'FxinIHJ1' \
#    --body '{"token": "o7aq5Zzn"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'Pay'
#delete_file $TEMP_FILE
#
##- 263 PublicCheckPaymentOrderPaidStatus
#java -jar ${JAR_PATH} platform publicCheckPaymentOrderPaidStatus \
#    --namespace "test" \
#    --paymentOrderNo 'd5eacobT' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicCheckPaymentOrderPaidStatus'
#delete_file $TEMP_FILE
#
##- 264 GetPaymentPublicConfig
#java -jar ${JAR_PATH} platform getPaymentPublicConfig \
#    --namespace "test" \
#    --paymentProvider 'STRIPE' \
#    --region 'uRlhreQV' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetPaymentPublicConfig'
#delete_file $TEMP_FILE
#
##- 265 PublicGetQRCode
#java -jar ${JAR_PATH} platform publicGetQRCode \
#    --namespace "test" \
#    --code 'FID3o8hJ' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetQRCode'
#delete_file $TEMP_FILE
#
##- 266 PublicNormalizePaymentReturnUrl
#java -jar ${JAR_PATH} platform publicNormalizePaymentReturnUrl \
#    --namespace "test" \
#    --orderNo 'WVjKIOAw' \
#    --paymentOrderNo '70DvAHhS' \
#    --paymentProvider 'WALLET' \
#    --returnUrl 'zq1Za3IB' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicNormalizePaymentReturnUrl'
#delete_file $TEMP_FILE
#
##- 267 GetPaymentTaxValue
#java -jar ${JAR_PATH} platform getPaymentTaxValue \
#    --namespace "test" \
#    --paymentOrderNo 'C4vQFsUJ' \
#    --paymentProvider 'ALIPAY' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetPaymentTaxValue'
#delete_file $TEMP_FILE
#
##- 268 GetRewardByCode
#java -jar ${JAR_PATH} platform getRewardByCode \
#    --namespace "test" \
#    --rewardCode 'iaJp1rt7' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetRewardByCode'
#delete_file $TEMP_FILE
#
##- 269 QueryRewards1
#java -jar ${JAR_PATH} platform queryRewards1 \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'QueryRewards1'
#delete_file $TEMP_FILE
#
##- 270 GetReward1
#java -jar ${JAR_PATH} platform getReward1 \
#    --namespace "test" \
#    --rewardId 'OBgBCe6N' \
#    >$TEMP_FILE 2>&1
#update_status $? 'GetReward1'
#delete_file $TEMP_FILE
#
##- 271 PublicListStores
#java -jar ${JAR_PATH} platform publicListStores \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicListStores'
#delete_file $TEMP_FILE
#
##- 272 PublicExistsAnyMyActiveEntitlement
#java -jar ${JAR_PATH} platform publicExistsAnyMyActiveEntitlement \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicExistsAnyMyActiveEntitlement'
#delete_file $TEMP_FILE
#
##- 273 PublicGetMyAppEntitlementOwnershipByAppId
#java -jar ${JAR_PATH} platform publicGetMyAppEntitlementOwnershipByAppId \
#    --namespace "test" \
#    --appId '0eI65Mn5' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetMyAppEntitlementOwnershipByAppId'
#delete_file $TEMP_FILE
#
##- 274 PublicGetMyEntitlementOwnershipByItemId
#java -jar ${JAR_PATH} platform publicGetMyEntitlementOwnershipByItemId \
#    --namespace "test" \
#    --itemId 'tngEYXgP' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetMyEntitlementOwnershipByItemId'
#delete_file $TEMP_FILE
#
##- 275 PublicGetMyEntitlementOwnershipBySku
#java -jar ${JAR_PATH} platform publicGetMyEntitlementOwnershipBySku \
#    --namespace "test" \
#    --sku 'VT5CqXDZ' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetMyEntitlementOwnershipBySku'
#delete_file $TEMP_FILE
#
##- 276 PublicGetEntitlementOwnershipToken
#java -jar ${JAR_PATH} platform publicGetEntitlementOwnershipToken \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetEntitlementOwnershipToken'
#delete_file $TEMP_FILE
#
##- 277 PublicGetMyWallet
#java -jar ${JAR_PATH} platform publicGetMyWallet \
#    --currencyCode 'BVMJyJeK' \
#    --namespace "test" \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetMyWallet'
#delete_file $TEMP_FILE
#
##- 278 PublicSyncPsnDlcInventory
#java -jar ${JAR_PATH} platform publicSyncPsnDlcInventory \
#    --namespace "test" \
#    --userId 'FO92YDta' \
#    --body '{"serviceLabel": 42}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicSyncPsnDlcInventory'
#delete_file $TEMP_FILE
#
##- 279 SyncSteamDLC
#java -jar ${JAR_PATH} platform syncSteamDLC \
#    --namespace "test" \
#    --userId 'JoKS0Oxy' \
#    --body '{"appId": "ipZuO4N9", "steamId": "S2YCgHa6"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'SyncSteamDLC'
#delete_file $TEMP_FILE
#
##- 280 SyncXboxDLC
#java -jar ${JAR_PATH} platform syncXboxDLC \
#    --namespace "test" \
#    --userId 'XBcvGRYk' \
#    --body '{"xstsToken": "5rUtWHCn"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'SyncXboxDLC'
#delete_file $TEMP_FILE
#
##- 281 PublicQueryUserEntitlements
#java -jar ${JAR_PATH} platform publicQueryUserEntitlements \
#    --namespace "test" \
#    --userId 'hmzzppV7' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicQueryUserEntitlements'
#delete_file $TEMP_FILE
#
##- 282 PublicGetUserAppEntitlementByAppId
#java -jar ${JAR_PATH} platform publicGetUserAppEntitlementByAppId \
#    --namespace "test" \
#    --userId 'tKNKYUQV' \
#    --appId 'BXymWcNl' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetUserAppEntitlementByAppId'
#delete_file $TEMP_FILE
#
##- 283 PublicQueryUserEntitlementsByAppType
#java -jar ${JAR_PATH} platform publicQueryUserEntitlementsByAppType \
#    --namespace "test" \
#    --userId 'HaFxYaGH' \
#    --appType 'DLC' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicQueryUserEntitlementsByAppType'
#delete_file $TEMP_FILE
#
##- 284 PublicGetUserEntitlementByItemId
#java -jar ${JAR_PATH} platform publicGetUserEntitlementByItemId \
#    --namespace "test" \
#    --userId 'mBFyOrFK' \
#    --itemId 'txGNAi0f' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetUserEntitlementByItemId'
#delete_file $TEMP_FILE
#
##- 285 PublicGetUserEntitlementBySku
#java -jar ${JAR_PATH} platform publicGetUserEntitlementBySku \
#    --namespace "test" \
#    --userId 'q4xChPLd' \
#    --sku '2lOopc7X' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetUserEntitlementBySku'
#delete_file $TEMP_FILE
#
##- 286 PublicExistsAnyUserActiveEntitlement
#java -jar ${JAR_PATH} platform publicExistsAnyUserActiveEntitlement \
#    --namespace "test" \
#    --userId 'oVpdd6rC' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicExistsAnyUserActiveEntitlement'
#delete_file $TEMP_FILE
#
##- 287 PublicGetUserAppEntitlementOwnershipByAppId
#java -jar ${JAR_PATH} platform publicGetUserAppEntitlementOwnershipByAppId \
#    --namespace "test" \
#    --userId 'pyMrnH9Y' \
#    --appId 'HXh7KnCV' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetUserAppEntitlementOwnershipByAppId'
#delete_file $TEMP_FILE
#
##- 288 PublicGetUserEntitlementOwnershipByItemId
#java -jar ${JAR_PATH} platform publicGetUserEntitlementOwnershipByItemId \
#    --namespace "test" \
#    --userId 'OKY2zsBR' \
#    --itemId 'Gtd8QY2O' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetUserEntitlementOwnershipByItemId'
#delete_file $TEMP_FILE
#
##- 289 PublicGetUserEntitlementOwnershipBySku
#java -jar ${JAR_PATH} platform publicGetUserEntitlementOwnershipBySku \
#    --namespace "test" \
#    --userId 'Lbijrvfr' \
#    --sku '8hknjWUW' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetUserEntitlementOwnershipBySku'
#delete_file $TEMP_FILE
#
##- 290 PublicGetUserEntitlement
#java -jar ${JAR_PATH} platform publicGetUserEntitlement \
#    --entitlementId 'dMUXHvw4' \
#    --namespace "test" \
#    --userId 'pNlGLjdB' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetUserEntitlement'
#delete_file $TEMP_FILE
#
##- 291 PublicConsumeUserEntitlement
#java -jar ${JAR_PATH} platform publicConsumeUserEntitlement \
#    --entitlementId 'xLM079pD' \
#    --namespace "test" \
#    --userId 'AbTgmsEY' \
#    --body '{"useCount": 61}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicConsumeUserEntitlement'
#delete_file $TEMP_FILE
#
##- 292 PublicRedeemCode
#java -jar ${JAR_PATH} platform publicRedeemCode \
#    --namespace "test" \
#    --userId 'q2GkYK1v' \
#    --body '{"code": "Ym9flXQ7", "language": "CQoemnQG", "region": "0dH0NVM9"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicRedeemCode'
#delete_file $TEMP_FILE
#
##- 293 PublicFulfillAppleIAPItem
#java -jar ${JAR_PATH} platform publicFulfillAppleIAPItem \
#    --namespace "test" \
#    --userId 'VEHTPqDh' \
#    --body '{"excludeOldTransactions": false, "language": "cu5vnz6G", "productId": "iNMboBJH", "receiptData": "ml0LJmpP", "region": "i4mqhrui", "transactionId": "CZLGGP5U"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicFulfillAppleIAPItem'
#delete_file $TEMP_FILE
#
##- 294 SyncEpicGamesInventory
#java -jar ${JAR_PATH} platform syncEpicGamesInventory \
#    --namespace "test" \
#    --userId 'XkHNTMap' \
#    --body '{"epicGamesJwtToken": "p5SbonsU"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'SyncEpicGamesInventory'
#delete_file $TEMP_FILE
#
##- 295 PublicFulfillGoogleIAPItem
#java -jar ${JAR_PATH} platform publicFulfillGoogleIAPItem \
#    --namespace "test" \
#    --userId 'JKADr60E' \
#    --body '{"language": "kdFrpLsG", "orderId": "t9yTXWUS", "packageName": "CQcMsHN7", "productId": "reI22ks7", "purchaseTime": 69, "purchaseToken": "12tAZc8s", "region": "xxLx9XQe"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicFulfillGoogleIAPItem'
#delete_file $TEMP_FILE
#
##- 296 PublicReconcilePlayStationStore
#java -jar ${JAR_PATH} platform publicReconcilePlayStationStore \
#    --namespace "test" \
#    --userId 'qNWLm8cN' \
#    --body '{"currencyCode": "JbYH5J4W", "price": 0.13072944847677825, "productId": "Lv9NvHwt", "serviceLabel": 45}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicReconcilePlayStationStore'
#delete_file $TEMP_FILE
#
##- 297 SyncStadiaEntitlement
#java -jar ${JAR_PATH} platform syncStadiaEntitlement \
#    --namespace "test" \
#    --userId '2Mjcy9ZL' \
#    --body '{"appId": "6Zs5Bu2X", "language": "YopLWZeU", "region": "KJJNftRp", "stadiaPlayerId": "Ggk1iseR"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'SyncStadiaEntitlement'
#delete_file $TEMP_FILE
#
##- 298 SyncSteamInventory
#java -jar ${JAR_PATH} platform syncSteamInventory \
#    --namespace "test" \
#    --userId 'EzzRG6z9' \
#    --body '{"appId": "wmuHddyO", "currencyCode": "dibI1LVy", "language": "qbdY8DGZ", "price": 0.5756153495347066, "productId": "uoIKz3Pp", "region": "3zLWUxMz", "steamId": "MtSmMmZP"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'SyncSteamInventory'
#delete_file $TEMP_FILE
#
##- 299 SyncXboxInventory
#java -jar ${JAR_PATH} platform syncXboxInventory \
#    --namespace "test" \
#    --userId '8nG0FoQP' \
#    --body '{"currencyCode": "8q7aSsb8", "price": 0.8967075057500808, "productId": "Ah9RD3Zz", "xstsToken": "N6N1iJ8l"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'SyncXboxInventory'
#delete_file $TEMP_FILE
#
##- 300 PublicQueryUserOrders
#java -jar ${JAR_PATH} platform publicQueryUserOrders \
#    --namespace "test" \
#    --userId 'tt9IRqCf' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicQueryUserOrders'
#delete_file $TEMP_FILE
#
##- 301 PublicCreateUserOrder
#java -jar ${JAR_PATH} platform publicCreateUserOrder \
#    --namespace "test" \
#    --userId 'lgln6r5f' \
#    --body '{"currencyCode": "0s5H6lCf", "discountedPrice": 85, "ext": {"Ha11hLLC": {}}, "itemId": "gw5av4LE", "language": "xdabD8g2", "price": 5, "quantity": 43, "region": "HfMRupDA", "returnUrl": "5xbjs3XR"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicCreateUserOrder'
#delete_file $TEMP_FILE
#
##- 302 PublicGetUserOrder
#java -jar ${JAR_PATH} platform publicGetUserOrder \
#    --namespace "test" \
#    --orderNo 'dHUJ0GCm' \
#    --userId 'flIXkgJ6' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetUserOrder'
#delete_file $TEMP_FILE
#
##- 303 PublicCancelUserOrder
#java -jar ${JAR_PATH} platform publicCancelUserOrder \
#    --namespace "test" \
#    --orderNo 'zkTwoakq' \
#    --userId '7sEejFZ1' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicCancelUserOrder'
#delete_file $TEMP_FILE
#
##- 304 PublicGetUserOrderHistories
#java -jar ${JAR_PATH} platform publicGetUserOrderHistories \
#    --namespace "test" \
#    --orderNo 'NtONXb9w' \
#    --userId '9hsQHszI' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetUserOrderHistories'
#delete_file $TEMP_FILE
#
##- 305 PublicDownloadUserOrderReceipt
#java -jar ${JAR_PATH} platform publicDownloadUserOrderReceipt \
#    --namespace "test" \
#    --orderNo 'sfrlzKpQ' \
#    --userId 'dd58dZP5' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicDownloadUserOrderReceipt'
#delete_file $TEMP_FILE
#
##- 306 PublicGetPaymentAccounts
#java -jar ${JAR_PATH} platform publicGetPaymentAccounts \
#    --namespace "test" \
#    --userId 'RvrinNtv' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetPaymentAccounts'
#delete_file $TEMP_FILE
#
##- 307 PublicDeletePaymentAccount
#java -jar ${JAR_PATH} platform publicDeletePaymentAccount \
#    --id 'BtqFSkA6' \
#    --namespace "test" \
#    --type 'card' \
#    --userId 'IVYJ5pSV' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicDeletePaymentAccount'
#delete_file $TEMP_FILE
#
##- 308 PublicQueryUserSubscriptions
#java -jar ${JAR_PATH} platform publicQueryUserSubscriptions \
#    --namespace "test" \
#    --userId 'xBsLhty3' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicQueryUserSubscriptions'
#delete_file $TEMP_FILE
#
##- 309 PublicSubscribeSubscription
#java -jar ${JAR_PATH} platform publicSubscribeSubscription \
#    --namespace "test" \
#    --userId 'pecToXA4' \
#    --body '{"currencyCode": "M1oUFPhg", "itemId": "o7Z6mwNC", "language": "4FY69mM8", "region": "7joJNOGB", "returnUrl": "83Ns6Hl5", "source": "Poab6lKo"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicSubscribeSubscription'
#delete_file $TEMP_FILE
#
##- 310 PublicCheckUserSubscriptionSubscribableByItemId
#java -jar ${JAR_PATH} platform publicCheckUserSubscriptionSubscribableByItemId \
#    --namespace "test" \
#    --userId 'VqNBUzIx' \
#    --itemId 'OfglquS2' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicCheckUserSubscriptionSubscribableByItemId'
#delete_file $TEMP_FILE
#
##- 311 PublicGetUserSubscription
#java -jar ${JAR_PATH} platform publicGetUserSubscription \
#    --namespace "test" \
#    --subscriptionId 'q2DoWr9z' \
#    --userId 'vFtKa2mO' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetUserSubscription'
#delete_file $TEMP_FILE
#
##- 312 PublicChangeSubscriptionBillingAccount
#java -jar ${JAR_PATH} platform publicChangeSubscriptionBillingAccount \
#    --namespace "test" \
#    --subscriptionId 'AqOokV1p' \
#    --userId 'lxQ2YriT' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicChangeSubscriptionBillingAccount'
#delete_file $TEMP_FILE
#
##- 313 PublicCancelSubscription
#java -jar ${JAR_PATH} platform publicCancelSubscription \
#    --namespace "test" \
#    --subscriptionId 'PfipD67j' \
#    --userId 'I2hiZkrt' \
#    --body '{"immediate": false, "reason": "h2U1RQlM"}' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicCancelSubscription'
#delete_file $TEMP_FILE
#
##- 314 PublicGetUserSubscriptionBillingHistories
#java -jar ${JAR_PATH} platform publicGetUserSubscriptionBillingHistories \
#    --namespace "test" \
#    --subscriptionId 'xkfNMPNt' \
#    --userId 'qv2TMz1b' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetUserSubscriptionBillingHistories'
#delete_file $TEMP_FILE
#
##- 315 PublicGetWallet
#java -jar ${JAR_PATH} platform publicGetWallet \
#    --currencyCode '7SnzkXOe' \
#    --namespace "test" \
#    --userId 'k83Igm1w' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicGetWallet'
#delete_file $TEMP_FILE
#
##- 316 PublicListUserWalletTransactions
#java -jar ${JAR_PATH} platform publicListUserWalletTransactions \
#    --currencyCode 'kSWsYvAs' \
#    --namespace "test" \
#    --userId 'u18obUdc' \
#    >$TEMP_FILE 2>&1
#update_status $? 'PublicListUserWalletTransactions'
#delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT