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

OPERATIONS_COUNT=67

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

#- 1 ListConfig
java -jar ${JAR_PATH} dsmc listConfig \
    >$TEMP_FILE 2>&1
update_status $? 'ListConfig'
delete_file $TEMP_FILE

#- 2 SaveConfig
update_status 0 'SaveConfig (skipped deprecated)'

#- 3 UpdateImage
java -jar ${JAR_PATH} dsmc updateImage \
    --body '{"artifactPath": "FtBxyZcD", "image": "XBpGlsQu", "namespace": "Ju8vMf0I", "persistent": true, "version": "JkTrd8ID"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateImage'
delete_file $TEMP_FILE

#- 4 CreateImage
java -jar ${JAR_PATH} dsmc createImage \
    --body '{"artifactPath": "cV2zXnTK", "dockerPath": "jXY1bPqa", "image": "miBxx9Cs", "namespace": "18EY84ek", "persistent": true, "version": "qRzHU1oh"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateImage'
delete_file $TEMP_FILE

#- 5 ImportImages
java -jar ${JAR_PATH} dsmc importImages \
    --file 'tmp.dat' \
    >$TEMP_FILE 2>&1
update_status $? 'ImportImages'
delete_file $TEMP_FILE

#- 6 CreateImagePatch
java -jar ${JAR_PATH} dsmc createImagePatch \
    --body '{"artifactPath": "570KQBVa", "dockerPath": "ewc72krS", "image": "ha68n3Yn", "namespace": "ozp1C2Km", "patchVersion": "IQTuBdNE", "persistent": true, "version": "xFb8CJ17"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateImagePatch'
delete_file $TEMP_FILE

#- 7 GetConfig
java -jar ${JAR_PATH} dsmc getConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetConfig'
delete_file $TEMP_FILE

#- 8 CreateConfig
java -jar ${JAR_PATH} dsmc createConfig \
    --body '{"claim_timeout": 76, "creation_timeout": 59, "default_version": "JZaMSxEC", "port": 2, "ports": {"Zbygyoar": 81}, "protocol": "RoeNHSb8", "providers": ["Rh3kgs9q"], "session_timeout": 33, "unreachable_timeout": 71}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateConfig'
delete_file $TEMP_FILE

#- 9 DeleteConfig
java -jar ${JAR_PATH} dsmc deleteConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteConfig'
delete_file $TEMP_FILE

#- 10 UpdateConfig
java -jar ${JAR_PATH} dsmc updateConfig \
    --body '{"claim_timeout": 2, "creation_timeout": 27, "default_version": "QsoBgiVp", "port": 82, "protocol": "8Cm3yvAS", "providers": ["UoxdxxFq"], "session_timeout": 24, "unreachable_timeout": 52}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateConfig'
delete_file $TEMP_FILE

#- 11 ClearCache
java -jar ${JAR_PATH} dsmc clearCache \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ClearCache'
delete_file $TEMP_FILE

#- 12 GetAllDeployment
java -jar ${JAR_PATH} dsmc getAllDeployment \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetAllDeployment'
delete_file $TEMP_FILE

#- 13 GetDeployment
java -jar ${JAR_PATH} dsmc getDeployment \
    --deployment 'GTJ8IEda' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetDeployment'
delete_file $TEMP_FILE

#- 14 CreateDeployment
java -jar ${JAR_PATH} dsmc createDeployment \
    --body '{"allow_version_override": false, "buffer_count": 60, "buffer_percent": 38, "configuration": "p4w29KOu", "enable_region_overrides": false, "game_version": "19R6XDqW", "max_count": 67, "min_count": 20, "overrides": {"kP8npLEK": {"buffer_count": 76, "buffer_percent": 11, "configuration": "jiX7jpkV", "enable_region_overrides": false, "game_version": "3IaQYEmq", "max_count": 64, "min_count": 29, "name": "dOEGt9gP", "region_overrides": {"Oj0c6i0J": {"buffer_count": 21, "buffer_percent": 42, "max_count": 69, "min_count": 0, "name": "s73ucYnF", "use_buffer_percent": true}}, "regions": ["J3DK5T4E"], "use_buffer_percent": false}}, "region_overrides": {"gg0Y39Uo": {"buffer_count": 23, "buffer_percent": 31, "max_count": 43, "min_count": 3, "name": "VAgtsDhU", "use_buffer_percent": true}}, "regions": ["UscbQDjb"], "use_buffer_percent": true}' \
    --deployment 'PMz2PTRl' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateDeployment'
delete_file $TEMP_FILE

#- 15 DeleteDeployment
java -jar ${JAR_PATH} dsmc deleteDeployment \
    --deployment 'kyU89ZPO' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteDeployment'
delete_file $TEMP_FILE

#- 16 UpdateDeployment
java -jar ${JAR_PATH} dsmc updateDeployment \
    --body '{"allow_version_override": true, "buffer_count": 50, "buffer_percent": 83, "configuration": "FJ42cwmz", "enable_region_overrides": true, "game_version": "BSMNcoAA", "max_count": 81, "min_count": 19, "regions": ["KNjfcYHm"], "use_buffer_percent": false}' \
    --deployment 'YgBU1sqj' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateDeployment'
delete_file $TEMP_FILE

#- 17 CreateRootRegionOverride
java -jar ${JAR_PATH} dsmc createRootRegionOverride \
    --body '{"buffer_count": 49, "buffer_percent": 72, "max_count": 99, "min_count": 66, "use_buffer_percent": false}' \
    --deployment 'RSOFQBtu' \
    --namespace "test" \
    --region '23REZ8hR' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateRootRegionOverride'
delete_file $TEMP_FILE

#- 18 DeleteRootRegionOverride
java -jar ${JAR_PATH} dsmc deleteRootRegionOverride \
    --deployment 'VX7LGOvD' \
    --namespace "test" \
    --region 'dYiQS9i7' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteRootRegionOverride'
delete_file $TEMP_FILE

#- 19 UpdateRootRegionOverride
java -jar ${JAR_PATH} dsmc updateRootRegionOverride \
    --body '{"buffer_count": 24, "buffer_percent": 94, "max_count": 57, "min_count": 30, "use_buffer_percent": false}' \
    --deployment 'G9gpxL6y' \
    --namespace "test" \
    --region 'cTQdvln2' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateRootRegionOverride'
delete_file $TEMP_FILE

#- 20 CreateDeploymentOverride
java -jar ${JAR_PATH} dsmc createDeploymentOverride \
    --body '{"buffer_count": 74, "buffer_percent": 52, "configuration": "uSQWEXL6", "enable_region_overrides": true, "game_version": "E1YHo9m1", "max_count": 96, "min_count": 4, "region_overrides": {"8hHtWvbN": {"buffer_count": 33, "buffer_percent": 12, "max_count": 92, "min_count": 33, "name": "slArFPiH", "use_buffer_percent": true}}, "regions": ["aCv8kU9d"], "use_buffer_percent": true}' \
    --deployment 'BpdsJLhs' \
    --namespace "test" \
    --version 'VyExrkxo' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateDeploymentOverride'
delete_file $TEMP_FILE

#- 21 DeleteDeploymentOverride
java -jar ${JAR_PATH} dsmc deleteDeploymentOverride \
    --deployment 'ot0B7WOf' \
    --namespace "test" \
    --version 'ercZdpMc' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteDeploymentOverride'
delete_file $TEMP_FILE

#- 22 UpdateDeploymentOverride
java -jar ${JAR_PATH} dsmc updateDeploymentOverride \
    --body '{"buffer_count": 17, "buffer_percent": 58, "configuration": "s7YSfExa", "enable_region_overrides": true, "game_version": "zLteMbFA", "max_count": 23, "min_count": 39, "regions": ["4hr7HmOY"], "use_buffer_percent": false}' \
    --deployment 'BA5ltAOX' \
    --namespace "test" \
    --version 'mlG6eh1d' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateDeploymentOverride'
delete_file $TEMP_FILE

#- 23 CreateOverrideRegionOverride
java -jar ${JAR_PATH} dsmc createOverrideRegionOverride \
    --body '{"buffer_count": 90, "buffer_percent": 6, "max_count": 29, "min_count": 91, "use_buffer_percent": true}' \
    --deployment 'pBIcuC1d' \
    --namespace "test" \
    --region 'QY93OJnJ' \
    --version '6Te9vD8l' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateOverrideRegionOverride'
delete_file $TEMP_FILE

#- 24 DeleteOverrideRegionOverride
java -jar ${JAR_PATH} dsmc deleteOverrideRegionOverride \
    --deployment 'dz7Hu8AD' \
    --namespace "test" \
    --region '79kdWunv' \
    --version 'izU0q1pH' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteOverrideRegionOverride'
delete_file $TEMP_FILE

#- 25 UpdateOverrideRegionOverride
java -jar ${JAR_PATH} dsmc updateOverrideRegionOverride \
    --body '{"buffer_count": 49, "buffer_percent": 15, "max_count": 15, "min_count": 61, "use_buffer_percent": false}' \
    --deployment 'GgdrysMi' \
    --namespace "test" \
    --region 'zBGSRdP2' \
    --version 'l7DNSZ8A' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateOverrideRegionOverride'
delete_file $TEMP_FILE

#- 26 GetAllPodConfig
java -jar ${JAR_PATH} dsmc getAllPodConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetAllPodConfig'
delete_file $TEMP_FILE

#- 27 GetPodConfig
java -jar ${JAR_PATH} dsmc getPodConfig \
    --name 'q0XiPLQX' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetPodConfig'
delete_file $TEMP_FILE

#- 28 CreatePodConfig
java -jar ${JAR_PATH} dsmc createPodConfig \
    --body '{"cpu_limit": 89, "mem_limit": 9, "params": "07ZddOGT"}' \
    --name 'MlJjBwj9' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreatePodConfig'
delete_file $TEMP_FILE

#- 29 DeletePodConfig
java -jar ${JAR_PATH} dsmc deletePodConfig \
    --name 'HJHQKseE' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeletePodConfig'
delete_file $TEMP_FILE

#- 30 UpdatePodConfig
java -jar ${JAR_PATH} dsmc updatePodConfig \
    --body '{"cpu_limit": 6, "mem_limit": 88, "name": "XRDSvgua", "params": "uw1xT7eM"}' \
    --name 'wSl9MLH0' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePodConfig'
delete_file $TEMP_FILE

#- 31 AddPort
java -jar ${JAR_PATH} dsmc addPort \
    --body '{"port": 79}' \
    --name 'nTJ2ulNz' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AddPort'
delete_file $TEMP_FILE

#- 32 DeletePort
java -jar ${JAR_PATH} dsmc deletePort \
    --name 'BvwJaQa5' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeletePort'
delete_file $TEMP_FILE

#- 33 UpdatePort
java -jar ${JAR_PATH} dsmc updatePort \
    --body '{"name": "47JllvA8", "port": 86}' \
    --name 'WSpabUt7' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePort'
delete_file $TEMP_FILE

#- 34 ListImages
java -jar ${JAR_PATH} dsmc listImages \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListImages'
delete_file $TEMP_FILE

#- 35 DeleteImage
java -jar ${JAR_PATH} dsmc deleteImage \
    --namespace "test" \
    --imageURI 'xk6QxyWh' \
    --version 'fqoWfJw2' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteImage'
delete_file $TEMP_FILE

#- 36 ExportImages
java -jar ${JAR_PATH} dsmc exportImages \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ExportImages'
delete_file $TEMP_FILE

#- 37 GetImageLimit
java -jar ${JAR_PATH} dsmc getImageLimit \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetImageLimit'
delete_file $TEMP_FILE

#- 38 DeleteImagePatch
java -jar ${JAR_PATH} dsmc deleteImagePatch \
    --namespace "test" \
    --imageURI 'o8oWUqvP' \
    --version 'CZ2HzT7N' \
    --versionPatch 'XmWDlXsu' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteImagePatch'
delete_file $TEMP_FILE

#- 39 GetImageDetail
java -jar ${JAR_PATH} dsmc getImageDetail \
    --namespace "test" \
    --version 'NIdQJR5l' \
    >$TEMP_FILE 2>&1
update_status $? 'GetImageDetail'
delete_file $TEMP_FILE

#- 40 GetImagePatches
java -jar ${JAR_PATH} dsmc getImagePatches \
    --namespace "test" \
    --version 'sNOlvkfw' \
    >$TEMP_FILE 2>&1
update_status $? 'GetImagePatches'
delete_file $TEMP_FILE

#- 41 GetImagePatchDetail
java -jar ${JAR_PATH} dsmc getImagePatchDetail \
    --namespace "test" \
    --version 'aSbnsuLC' \
    --versionPatch 'gToxuVTe' \
    >$TEMP_FILE 2>&1
update_status $? 'GetImagePatchDetail'
delete_file $TEMP_FILE

#- 42 ListServer
java -jar ${JAR_PATH} dsmc listServer \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListServer'
delete_file $TEMP_FILE

#- 43 CountServer
java -jar ${JAR_PATH} dsmc countServer \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CountServer'
delete_file $TEMP_FILE

#- 44 CountServerDetailed
java -jar ${JAR_PATH} dsmc countServerDetailed \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CountServerDetailed'
delete_file $TEMP_FILE

#- 45 ListLocalServer
java -jar ${JAR_PATH} dsmc listLocalServer \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListLocalServer'
delete_file $TEMP_FILE

#- 46 DeleteLocalServer
java -jar ${JAR_PATH} dsmc deleteLocalServer \
    --name 'kJgvg6h5' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteLocalServer'
delete_file $TEMP_FILE

#- 47 GetServer
java -jar ${JAR_PATH} dsmc getServer \
    --namespace "test" \
    --podName 'HIpH0Dvi' \
    >$TEMP_FILE 2>&1
update_status $? 'GetServer'
delete_file $TEMP_FILE

#- 48 DeleteServer
java -jar ${JAR_PATH} dsmc deleteServer \
    --namespace "test" \
    --podName 'plEk4vj3' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteServer'
delete_file $TEMP_FILE

#- 49 GetServerLogs
java -jar ${JAR_PATH} dsmc getServerLogs \
    --namespace "test" \
    --podName 'LDp4yqDt' \
    >$TEMP_FILE 2>&1
update_status $? 'GetServerLogs'
delete_file $TEMP_FILE

#- 50 ListSession
java -jar ${JAR_PATH} dsmc listSession \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListSession'
delete_file $TEMP_FILE

#- 51 CountSession
java -jar ${JAR_PATH} dsmc countSession \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CountSession'
delete_file $TEMP_FILE

#- 52 DeleteSession
java -jar ${JAR_PATH} dsmc deleteSession \
    --namespace "test" \
    --sessionID '8QUZDpxl' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteSession'
delete_file $TEMP_FILE

#- 53 ExportConfigV1
java -jar ${JAR_PATH} dsmc exportConfigV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ExportConfigV1'
delete_file $TEMP_FILE

#- 54 ImportConfigV1
java -jar ${JAR_PATH} dsmc importConfigV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ImportConfigV1'
delete_file $TEMP_FILE

#- 55 ImageDetailClient
java -jar ${JAR_PATH} dsmc imageDetailClient \
    --namespace "test" \
    --version 'HasinGcj' \
    >$TEMP_FILE 2>&1
update_status $? 'ImageDetailClient'
delete_file $TEMP_FILE

#- 56 DeregisterLocalServer
java -jar ${JAR_PATH} dsmc deregisterLocalServer \
    --body '{"name": "rkmRMttg"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeregisterLocalServer'
delete_file $TEMP_FILE

#- 57 RegisterLocalServer
java -jar ${JAR_PATH} dsmc registerLocalServer \
    --body '{"custom_attribute": "jDSaIVBm", "ip": "ft3Udg7p", "name": "9PGmY2H5", "port": 20}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RegisterLocalServer'
delete_file $TEMP_FILE

#- 58 RegisterServer
java -jar ${JAR_PATH} dsmc registerServer \
    --body '{"custom_attribute": "X4MsisSX", "pod_name": "28nARxWR"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RegisterServer'
delete_file $TEMP_FILE

#- 59 ShutdownServer
java -jar ${JAR_PATH} dsmc shutdownServer \
    --body '{"kill_me": false, "pod_name": "v5ou5xtv"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ShutdownServer'
delete_file $TEMP_FILE

#- 60 GetServerSession
java -jar ${JAR_PATH} dsmc getServerSession \
    --namespace "test" \
    --podName 'd28OUfCt' \
    >$TEMP_FILE 2>&1
update_status $? 'GetServerSession'
delete_file $TEMP_FILE

#- 61 CreateSession
java -jar ${JAR_PATH} dsmc createSession \
    --body '{"client_version": "8UJC5flN", "configuration": "yj6HsTtX", "deployment": "8P3llnaa", "game_mode": "S9lqyygP", "matching_allies": [{"matching_parties": [{"party_attributes": {"cfkJIxfQ": {}}, "party_id": "Zza8kNVb", "party_members": [{"user_id": "DxVMq7HJ"}]}]}], "namespace": "k0F89xAc", "notification_payload": {}, "pod_name": "3YVfaENt", "region": "rl0pTKZT", "session_id": "XqzHuBMY"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateSession'
delete_file $TEMP_FILE

#- 62 ClaimServer
java -jar ${JAR_PATH} dsmc claimServer \
    --body '{"session_id": "QSA2jz1Z"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ClaimServer'
delete_file $TEMP_FILE

#- 63 GetSession
java -jar ${JAR_PATH} dsmc getSession \
    --namespace "test" \
    --sessionID 'OpdOjSyM' \
    >$TEMP_FILE 2>&1
update_status $? 'GetSession'
delete_file $TEMP_FILE

#- 64 GetDefaultProvider
java -jar ${JAR_PATH} dsmc getDefaultProvider \
    >$TEMP_FILE 2>&1
update_status $? 'GetDefaultProvider'
delete_file $TEMP_FILE

#- 65 ListProviders
java -jar ${JAR_PATH} dsmc listProviders \
    >$TEMP_FILE 2>&1
update_status $? 'ListProviders'
delete_file $TEMP_FILE

#- 66 ListProvidersByRegion
java -jar ${JAR_PATH} dsmc listProvidersByRegion \
    --region 'ddB41JuM' \
    >$TEMP_FILE 2>&1
update_status $? 'ListProvidersByRegion'
delete_file $TEMP_FILE

#- 67 PublicGetMessages
java -jar ${JAR_PATH} dsmc publicGetMessages \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetMessages'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT