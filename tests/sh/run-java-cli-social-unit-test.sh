#!/bin/bash

#Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
#This is licensed software from AccelByte Inc, for limitations
#and restrictions contact your company contract manager.

#Meta:
#- random seed: 256
#- template file: cli_test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH="${MODULE_PATH:-../../samples/cli}"
JAR_PATH="${MODULE_PATH}/build/libs/cli.jar"
TEMP_FILE='file.tmp'

OPERATIONS_COUNT=69

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

#- 1 GetNamespaceSlotConfig
java -jar ${JAR_PATH} social getNamespaceSlotConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetNamespaceSlotConfig'
delete_file $TEMP_FILE

#- 2 UpdateNamespaceSlotConfig
java -jar ${JAR_PATH} social updateNamespaceSlotConfig \
    --namespace "test" \
    --body '{"maxSlotSize": 62, "maxSlots": 39}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateNamespaceSlotConfig'
delete_file $TEMP_FILE

#- 3 DeleteNamespaceSlotConfig
java -jar ${JAR_PATH} social deleteNamespaceSlotConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteNamespaceSlotConfig'
delete_file $TEMP_FILE

#- 4 GetUserSlotConfig
java -jar ${JAR_PATH} social getUserSlotConfig \
    --namespace "test" \
    --userId 'BxyZcDXB' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserSlotConfig'
delete_file $TEMP_FILE

#- 5 UpdateUserSlotConfig
java -jar ${JAR_PATH} social updateUserSlotConfig \
    --namespace "test" \
    --userId 'pGlsQuJu' \
    --body '{"maxSlotSize": 42, "maxSlots": 77}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateUserSlotConfig'
delete_file $TEMP_FILE

#- 6 DeleteUserSlotConfig
java -jar ${JAR_PATH} social deleteUserSlotConfig \
    --namespace "test" \
    --userId 'f0IsJkTr' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteUserSlotConfig'
delete_file $TEMP_FILE

#- 7 GetUserProfiles
java -jar ${JAR_PATH} social getUserProfiles \
    --namespace "test" \
    --userId 'd8IDcV2z' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserProfiles'
delete_file $TEMP_FILE

#- 8 GetProfile
java -jar ${JAR_PATH} social getProfile \
    --namespace "test" \
    --profileId 'XnTKjXY1' \
    --userId 'bPqamiBx' \
    >$TEMP_FILE 2>&1
update_status $? 'GetProfile'
delete_file $TEMP_FILE

#- 9 GetUserNamespaceSlots
java -jar ${JAR_PATH} social getUserNamespaceSlots \
    --namespace "test" \
    --userId 'x9Cs18EY' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserNamespaceSlots'
delete_file $TEMP_FILE

#- 10 GetSlotData
java -jar ${JAR_PATH} social getSlotData \
    --namespace "test" \
    --slotId '84ekItqR' \
    --userId 'zHU1oh57' \
    >$TEMP_FILE 2>&1
update_status $? 'GetSlotData'
delete_file $TEMP_FILE

#- 11 PublicGetUserGameProfiles
java -jar ${JAR_PATH} social publicGetUserGameProfiles \
    --namespace "test" \
    --userIds '["0KQBVaew"]' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserGameProfiles'
delete_file $TEMP_FILE

#- 12 PublicGetUserProfiles
java -jar ${JAR_PATH} social publicGetUserProfiles \
    --namespace "test" \
    --userId 'c72krSha' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserProfiles'
delete_file $TEMP_FILE

#- 13 PublicCreateProfile
java -jar ${JAR_PATH} social publicCreateProfile \
    --namespace "test" \
    --userId '68n3Ynoz' \
    --body '{"achievements": ["p1C2KmIQ"], "attributes": {"TuBdNEUs": "xFb8CJ17"}, "avatarUrl": "M7DJZaMS", "inventories": ["xECbZbyg"], "label": "yoarORoe", "profileName": "NHSb8Rh3", "statistics": ["kgs9qqJb"], "tags": ["nQsoBgiV"]}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCreateProfile'
delete_file $TEMP_FILE

#- 14 PublicGetProfile
java -jar ${JAR_PATH} social publicGetProfile \
    --namespace "test" \
    --profileId 'pP8Cm3yv' \
    --userId 'ASUoxdxx' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetProfile'
delete_file $TEMP_FILE

#- 15 PublicUpdateProfile
java -jar ${JAR_PATH} social publicUpdateProfile \
    --namespace "test" \
    --profileId 'FqmAGTJ8' \
    --userId 'IEdagEtp' \
    --body '{"achievements": ["4w29KOu9"], "attributes": {"c19R6XDq": "WHkkP8np"}, "avatarUrl": "LEKMfjiX", "inventories": ["7jpkVZk3"], "label": "IaQYEmqG", "profileName": "odOEGt9g", "statistics": ["POj0c6i0"], "tags": ["JkvIas73"]}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdateProfile'
delete_file $TEMP_FILE

#- 16 PublicDeleteProfile
java -jar ${JAR_PATH} social publicDeleteProfile \
    --namespace "test" \
    --profileId 'ucYnFAJ3' \
    --userId 'DK5T4Eog' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicDeleteProfile'
delete_file $TEMP_FILE

#- 17 PublicGetProfileAttribute
java -jar ${JAR_PATH} social publicGetProfileAttribute \
    --attributeName 'g0Y39UoY' \
    --namespace "test" \
    --profileId 'lpv5bVAg' \
    --userId 'tsDhUTDU' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetProfileAttribute'
delete_file $TEMP_FILE

#- 18 PublicUpdateAttribute
java -jar ${JAR_PATH} social publicUpdateAttribute \
    --attributeName 'scbQDjbT' \
    --namespace "test" \
    --profileId 'QuPMz2PT' \
    --userId 'RlkyU89Z' \
    --body '{"name": "POw6zPFJ", "value": "42cwmzBB"}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdateAttribute'
delete_file $TEMP_FILE

#- 19 PublicGetUserNamespaceSlots
java -jar ${JAR_PATH} social publicGetUserNamespaceSlots \
    --namespace "test" \
    --userId 'SMNcoAAO' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserNamespaceSlots'
delete_file $TEMP_FILE

#- 20 PublicCreateUserNamespaceSlot
java -jar ${JAR_PATH} social publicCreateUserNamespaceSlot \
    --namespace "test" \
    --userId 'jKNjfcYH' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCreateUserNamespaceSlot'
delete_file $TEMP_FILE

#- 21 PublicGetSlotData
java -jar ${JAR_PATH} social publicGetSlotData \
    --namespace "test" \
    --slotId 'm093aYgB' \
    --userId 'U1sqjyK0' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetSlotData'
delete_file $TEMP_FILE

#- 22 PublicUpdateUserNamespaceSlot
java -jar ${JAR_PATH} social publicUpdateUserNamespaceSlot \
    --namespace "test" \
    --slotId 'XH45PaRS' \
    --userId 'OFQBtu23' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdateUserNamespaceSlot'
delete_file $TEMP_FILE

#- 23 PublicDeleteUserNamespaceSlot
java -jar ${JAR_PATH} social publicDeleteUserNamespaceSlot \
    --namespace "test" \
    --slotId 'REZ8hRVX' \
    --userId '7LGOvDdY' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicDeleteUserNamespaceSlot'
delete_file $TEMP_FILE

#- 24 PublicUpdateUserNamespaceSlotMetadata
java -jar ${JAR_PATH} social publicUpdateUserNamespaceSlotMetadata \
    --namespace "test" \
    --slotId 'iQS9i7mV' \
    --userId '1C91pjG9' \
    --body '{"customAttribute": "gpxL6ycT", "label": "Qdvln2LA", "tags": ["uSQWEXL6"]}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdateUserNamespaceSlotMetadata'
delete_file $TEMP_FILE

#- 25 GetGlobalStatItems
java -jar ${JAR_PATH} social getGlobalStatItems \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetGlobalStatItems'
delete_file $TEMP_FILE

#- 26 BulkFetchStatItems
java -jar ${JAR_PATH} social bulkFetchStatItems \
    --namespace "test" \
    --statCode 'LFE1YHo9' \
    --userIds 'm126ZWc8' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkFetchStatItems'
delete_file $TEMP_FILE

#- 27 BulkIncUserStatItem
java -jar ${JAR_PATH} social bulkIncUserStatItem \
    --namespace "test" \
    --body '[{"inc": 0.11136021441968946, "statCode": "HtWvbNYq", "userId": "gUqslArF"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkIncUserStatItem'
delete_file $TEMP_FILE

#- 28 BulkIncUserStatItemValue
java -jar ${JAR_PATH} social bulkIncUserStatItemValue \
    --namespace "test" \
    --body '[{"inc": 0.6410856766936045, "statCode": "iHUIvaCv", "userId": "8kU9dBBp"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkIncUserStatItemValue'
delete_file $TEMP_FILE

#- 29 BulkResetUserStatItem
java -jar ${JAR_PATH} social bulkResetUserStatItem \
    --namespace "test" \
    --body '[{"statCode": "dsJLhsVy", "userId": "Exrkxoot"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkResetUserStatItem'
delete_file $TEMP_FILE

#- 30 GetStats
java -jar ${JAR_PATH} social getStats \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetStats'
delete_file $TEMP_FILE

#- 31 CreateStat
java -jar ${JAR_PATH} social createStat \
    --namespace "test" \
    --body '{"defaultValue": 0.8267966763880049, "description": "7WOfercZ", "incrementOnly": false, "maximum": 0.24471400376684005, "minimum": 0.044827790074906226, "name": "37Ds7YSf", "setAsGlobal": true, "setBy": "SERVER", "statCode": "aI3uzLte", "tags": ["MbFAlt4h"]}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateStat'
delete_file $TEMP_FILE

#- 32 ExportStats
java -jar ${JAR_PATH} social exportStats \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ExportStats'
delete_file $TEMP_FILE

#- 33 ImportStats
java -jar ${JAR_PATH} social importStats \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ImportStats'
delete_file $TEMP_FILE

#- 34 QueryStats
java -jar ${JAR_PATH} social queryStats \
    --namespace "test" \
    --keyword 'r7HmOYiB' \
    >$TEMP_FILE 2>&1
update_status $? 'QueryStats'
delete_file $TEMP_FILE

#- 35 GetStat
java -jar ${JAR_PATH} social getStat \
    --namespace "test" \
    --statCode 'A5ltAOXm' \
    >$TEMP_FILE 2>&1
update_status $? 'GetStat'
delete_file $TEMP_FILE

#- 36 DeleteStat
java -jar ${JAR_PATH} social deleteStat \
    --namespace "test" \
    --statCode 'lG6eh1dT' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteStat'
delete_file $TEMP_FILE

#- 37 UpdateStat
java -jar ${JAR_PATH} social updateStat \
    --namespace "test" \
    --statCode 'doTFpBIc' \
    --body '{"description": "uC1dQY93", "name": "OJnJ6Te9", "tags": ["vD8ldz7H"]}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateStat'
delete_file $TEMP_FILE

#- 38 GetUserStatItems
java -jar ${JAR_PATH} social getUserStatItems \
    --namespace "test" \
    --userId 'u8AD79kd' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserStatItems'
delete_file $TEMP_FILE

#- 39 BulkCreateUserStatItems
java -jar ${JAR_PATH} social bulkCreateUserStatItems \
    --namespace "test" \
    --userId 'WunvizU0' \
    --body '[{"statCode": "q1pHyhhE"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkCreateUserStatItems'
delete_file $TEMP_FILE

#- 40 BulkIncUserStatItem1
java -jar ${JAR_PATH} social bulkIncUserStatItem1 \
    --namespace "test" \
    --userId 'RoGgdrys' \
    --body '[{"inc": 0.6054030517210108, "statCode": "zBGSRdP2"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkIncUserStatItem1'
delete_file $TEMP_FILE

#- 41 BulkIncUserStatItemValue1
java -jar ${JAR_PATH} social bulkIncUserStatItemValue1 \
    --namespace "test" \
    --userId 'l7DNSZ8A' \
    --body '[{"inc": 0.2614624114028117, "statCode": "XiPLQXSe"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkIncUserStatItemValue1'
delete_file $TEMP_FILE

#- 42 BulkResetUserStatItem1
java -jar ${JAR_PATH} social bulkResetUserStatItem1 \
    --namespace "test" \
    --userId '07ZddOGT' \
    --body '[{"statCode": "MlJjBwj9"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkResetUserStatItem1'
delete_file $TEMP_FILE

#- 43 CreateUserStatItem
java -jar ${JAR_PATH} social createUserStatItem \
    --namespace "test" \
    --statCode 'HJHQKseE' \
    --userId 'dSXRDSvg' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateUserStatItem'
delete_file $TEMP_FILE

#- 44 DeleteUserStatItems
java -jar ${JAR_PATH} social deleteUserStatItems \
    --namespace "test" \
    --statCode 'uauw1xT7' \
    --userId 'eMwSl9ML' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteUserStatItems'
delete_file $TEMP_FILE

#- 45 IncUserStatItemValue
java -jar ${JAR_PATH} social incUserStatItemValue \
    --namespace "test" \
    --statCode 'H0NnTJ2u' \
    --userId 'lNzBvwJa' \
    --body '{"inc": 0.9842507217807595}' \
    >$TEMP_FILE 2>&1
update_status $? 'IncUserStatItemValue'
delete_file $TEMP_FILE

#- 46 ResetUserStatItemValue
java -jar ${JAR_PATH} social resetUserStatItemValue \
    --namespace "test" \
    --statCode 'a547Jllv' \
    --userId 'A8RWSpab' \
    --body '{"additionalData": {"Ut7xk6Qx": {}}}' \
    >$TEMP_FILE 2>&1
update_status $? 'ResetUserStatItemValue'
delete_file $TEMP_FILE

#- 47 BulkFetchStatItems1
java -jar ${JAR_PATH} social bulkFetchStatItems1 \
    --namespace "test" \
    --statCode 'yWhfqoWf' \
    --userIds 'Jw2o8oWU' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkFetchStatItems1'
delete_file $TEMP_FILE

#- 48 PublicBulkIncUserStatItem
java -jar ${JAR_PATH} social publicBulkIncUserStatItem \
    --namespace "test" \
    --body '[{"inc": 0.2532721485049817, "statCode": "PCZ2HzT7", "userId": "NXmWDlXs"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicBulkIncUserStatItem'
delete_file $TEMP_FILE

#- 49 PublicBulkIncUserStatItemValue
java -jar ${JAR_PATH} social publicBulkIncUserStatItemValue \
    --namespace "test" \
    --body '[{"inc": 0.32561673686821235, "statCode": "IdQJR5ls", "userId": "NOlvkfwa"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicBulkIncUserStatItemValue'
delete_file $TEMP_FILE

#- 50 BulkResetUserStatItem2
java -jar ${JAR_PATH} social bulkResetUserStatItem2 \
    --namespace "test" \
    --body '[{"statCode": "SbnsuLCg", "userId": "ToxuVTek"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkResetUserStatItem2'
delete_file $TEMP_FILE

#- 51 CreateStat1
java -jar ${JAR_PATH} social createStat1 \
    --namespace "test" \
    --body '{"defaultValue": 0.5498335965640428, "description": "vg6h5HIp", "incrementOnly": true, "maximum": 0.33338601242906774, "minimum": 0.2426266907543806, "name": "Ek4vj3LD", "setAsGlobal": false, "setBy": "SERVER", "statCode": "qDt8QUZD", "tags": ["pxlHasin"]}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateStat1'
delete_file $TEMP_FILE

#- 52 PublicQueryUserStatItems
java -jar ${JAR_PATH} social publicQueryUserStatItems \
    --namespace "test" \
    --userId 'GcjrkmRM' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicQueryUserStatItems'
delete_file $TEMP_FILE

#- 53 PublicBulkCreateUserStatItems
java -jar ${JAR_PATH} social publicBulkCreateUserStatItems \
    --namespace "test" \
    --userId 'ttgjDSaI' \
    --body '[{"statCode": "VBmft3Ud"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicBulkCreateUserStatItems'
delete_file $TEMP_FILE

#- 54 PublicBulkIncUserStatItem1
java -jar ${JAR_PATH} social publicBulkIncUserStatItem1 \
    --namespace "test" \
    --userId 'g7p9PGmY' \
    --body '[{"inc": 0.8506426627280407, "statCode": "5kX4Msis"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicBulkIncUserStatItem1'
delete_file $TEMP_FILE

#- 55 BulkIncUserStatItemValue2
java -jar ${JAR_PATH} social bulkIncUserStatItemValue2 \
    --namespace "test" \
    --userId 'SX28nARx' \
    --body '[{"inc": 0.762489301535472, "statCode": "pv5ou5xt"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkIncUserStatItemValue2'
delete_file $TEMP_FILE

#- 56 BulkResetUserStatItem3
java -jar ${JAR_PATH} social bulkResetUserStatItem3 \
    --namespace "test" \
    --userId 'vd28OUfC' \
    --body '[{"statCode": "t8UJC5fl"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkResetUserStatItem3'
delete_file $TEMP_FILE

#- 57 PublicCreateUserStatItem
java -jar ${JAR_PATH} social publicCreateUserStatItem \
    --namespace "test" \
    --statCode 'Nyj6HsTt' \
    --userId 'X8P3llna' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCreateUserStatItem'
delete_file $TEMP_FILE

#- 58 DeleteUserStatItems1
java -jar ${JAR_PATH} social deleteUserStatItems1 \
    --namespace "test" \
    --statCode 'aS9lqyyg' \
    --userId 'PcfkJIxf' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteUserStatItems1'
delete_file $TEMP_FILE

#- 59 PublicIncUserStatItem
java -jar ${JAR_PATH} social publicIncUserStatItem \
    --namespace "test" \
    --statCode 'QZza8kNV' \
    --userId 'bDxVMq7H' \
    --body '{"inc": 0.5498505917979803}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicIncUserStatItem'
delete_file $TEMP_FILE

#- 60 PublicIncUserStatItemValue
java -jar ${JAR_PATH} social publicIncUserStatItemValue \
    --namespace "test" \
    --statCode '0F89xAc3' \
    --userId 'YVfaENtr' \
    --body '{"inc": 0.18555281921920364}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicIncUserStatItemValue'
delete_file $TEMP_FILE

#- 61 ResetUserStatItemValue1
java -jar ${JAR_PATH} social resetUserStatItemValue1 \
    --namespace "test" \
    --statCode 'pTKZTXqz' \
    --userId 'HuBMYQSA' \
    >$TEMP_FILE 2>&1
update_status $? 'ResetUserStatItemValue1'
delete_file $TEMP_FILE

#- 62 BulkUpdateUserStatItemV2
java -jar ${JAR_PATH} social bulkUpdateUserStatItemV2 \
    --namespace "test" \
    --body '[{"additionalData": {"2jz1ZOpd": {}}, "additionalKey": "OjSyMddB", "statCode": "41JuMf7R", "updateStrategy": "MIN", "userId": "BHRj8IiR", "value": 0.13380605867217576}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkUpdateUserStatItemV2'
delete_file $TEMP_FILE

#- 63 BulkUpdateUserStatItem
java -jar ${JAR_PATH} social bulkUpdateUserStatItem \
    --namespace "test" \
    --userId 'RllHT6Dc' \
    --body '[{"additionalData": {"40vFFA6g": {}}, "statCode": "pU7EW3x1", "updateStrategy": "OVERRIDE", "value": 0.44428418755937293}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkUpdateUserStatItem'
delete_file $TEMP_FILE

#- 64 BulkResetUserStatItemValues
java -jar ${JAR_PATH} social bulkResetUserStatItemValues \
    --namespace "test" \
    --userId 'm55gOeqQ' \
    --body '[{"additionalData": {"IqcJVKmB": {}}, "statCode": "M1J1IbuT"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkResetUserStatItemValues'
delete_file $TEMP_FILE

#- 65 DeleteUserStatItems2
java -jar ${JAR_PATH} social deleteUserStatItems2 \
    --namespace "test" \
    --statCode 'rrkbmuT1' \
    --userId 'whOqmEnD' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteUserStatItems2'
delete_file $TEMP_FILE

#- 66 UpdateUserStatItemValue
java -jar ${JAR_PATH} social updateUserStatItemValue \
    --namespace "test" \
    --statCode 'XIWrBPlS' \
    --userId 'ay46mv71' \
    --body '{"additionalData": {"BAZAOjtF": {}}, "updateStrategy": "MAX", "value": 0.19538688444595897}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateUserStatItemValue'
delete_file $TEMP_FILE

#- 67 BulkUpdateUserStatItem1
java -jar ${JAR_PATH} social bulkUpdateUserStatItem1 \
    --namespace "test" \
    --body '[{"additionalData": {"j7tT7TZH": {}}, "additionalKey": "WDdCkIsZ", "statCode": "oArWwPHc", "updateStrategy": "MIN", "userId": "FAdAtYci", "value": 0.591101780521284}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkUpdateUserStatItem1'
delete_file $TEMP_FILE

#- 68 BulkUpdateUserStatItem2
java -jar ${JAR_PATH} social bulkUpdateUserStatItem2 \
    --namespace "test" \
    --userId 'IgRwFRr0' \
    --body '[{"additionalData": {"gwB9tz3v": {}}, "statCode": "p99XVlV8", "updateStrategy": "MAX", "value": 0.5689362203332181}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkUpdateUserStatItem2'
delete_file $TEMP_FILE

#- 69 UpdateUserStatItemValue1
java -jar ${JAR_PATH} social updateUserStatItemValue1 \
    --namespace "test" \
    --statCode 'tE6n0smi' \
    --userId 'p1tw3L7c' \
    --body '{"additionalData": {"Ud9pqtv6": {}}, "updateStrategy": "OVERRIDE", "value": 0.6502290130313825}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateUserStatItemValue1'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT