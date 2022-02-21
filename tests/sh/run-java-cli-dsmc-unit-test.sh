#!/bin/bash

#Copyright (c) 2022 AccelByte Inc. All Rights Reserved
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

OPERATIONS_COUNT=63

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

#- 6 GetConfig
java -jar ${JAR_PATH} dsmc getConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetConfig'
delete_file $TEMP_FILE

#- 7 CreateConfig
java -jar ${JAR_PATH} dsmc createConfig \
    --body '{"claim_timeout": 72, "creation_timeout": 84, "default_version": "BVaewc72", "port": 21, "ports": {"rSha68n3": 100}, "protocol": "nozp1C2K", "providers": ["mIQTuBdN"], "session_timeout": 61, "unreachable_timeout": 93}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateConfig'
delete_file $TEMP_FILE

#- 8 DeleteConfig
java -jar ${JAR_PATH} dsmc deleteConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteConfig'
delete_file $TEMP_FILE

#- 9 UpdateConfig
java -jar ${JAR_PATH} dsmc updateConfig \
    --body '{"claim_timeout": 37, "creation_timeout": 46, "default_version": "Fb8CJ17M", "port": 59, "protocol": "JZaMSxEC", "providers": ["bZbygyoa"], "session_timeout": 35, "unreachable_timeout": 81}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateConfig'
delete_file $TEMP_FILE

#- 10 ClearCache
java -jar ${JAR_PATH} dsmc clearCache \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ClearCache'
delete_file $TEMP_FILE

#- 11 GetAllDeployment
java -jar ${JAR_PATH} dsmc getAllDeployment \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetAllDeployment'
delete_file $TEMP_FILE

#- 12 GetDeployment
java -jar ${JAR_PATH} dsmc getDeployment \
    --deployment 'RoeNHSb8' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetDeployment'
delete_file $TEMP_FILE

#- 13 CreateDeployment
java -jar ${JAR_PATH} dsmc createDeployment \
    --body '{"allow_version_override": false, "buffer_count": 21, "buffer_percent": 13, "configuration": "s9qqJbnQ", "enable_region_overrides": true, "game_version": "oBgiVpP8", "max_count": 56, "min_count": 24, "overrides": {"3yvASUox": {"buffer_count": 7, "buffer_percent": 46, "configuration": "xFqmAGTJ", "enable_region_overrides": true, "game_version": "dagEtp4w", "max_count": 73, "min_count": 81, "name": "u9c19R6X", "region_overrides": {"DqWHkkP8": {"buffer_count": 26, "buffer_percent": 30, "max_count": 75, "min_count": 61, "name": "KMfjiX7j", "use_buffer_percent": false}}, "regions": ["kVZk3IaQ"], "use_buffer_percent": true}}, "region_overrides": {"mqGodOEG": {"buffer_count": 39, "buffer_percent": 13, "max_count": 83, "min_count": 81, "name": "j0c6i0Jk", "use_buffer_percent": true}}, "regions": ["Ias73ucY"], "use_buffer_percent": false}' \
    --deployment 'FAJ3DK5T' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateDeployment'
delete_file $TEMP_FILE

#- 14 DeleteDeployment
java -jar ${JAR_PATH} dsmc deleteDeployment \
    --deployment '4Eogg0Y3' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteDeployment'
delete_file $TEMP_FILE

#- 15 UpdateDeployment
java -jar ${JAR_PATH} dsmc updateDeployment \
    --body '{"allow_version_override": false, "buffer_count": 23, "buffer_percent": 31, "configuration": "v5bVAgts", "enable_region_overrides": true, "game_version": "hUTDUscb", "max_count": 85, "min_count": 59, "regions": ["jbTQuPMz"], "use_buffer_percent": false}' \
    --deployment 'kyU89ZPO' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateDeployment'
delete_file $TEMP_FILE

#- 16 CreateRootRegionOverride
java -jar ${JAR_PATH} dsmc createRootRegionOverride \
    --body '{"buffer_count": 44, "buffer_percent": 50, "max_count": 83, "min_count": 63, "use_buffer_percent": false}' \
    --deployment 'wmzBBSMN' \
    --namespace "test" \
    --region 'coAAOjKN' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateRootRegionOverride'
delete_file $TEMP_FILE

#- 17 DeleteRootRegionOverride
java -jar ${JAR_PATH} dsmc deleteRootRegionOverride \
    --deployment 'jfcYHm09' \
    --namespace "test" \
    --region '3aYgBU1s' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteRootRegionOverride'
delete_file $TEMP_FILE

#- 18 UpdateRootRegionOverride
java -jar ${JAR_PATH} dsmc updateRootRegionOverride \
    --body '{"buffer_count": 33, "buffer_percent": 19, "max_count": 49, "min_count": 72, "use_buffer_percent": false}' \
    --deployment 'RSOFQBtu' \
    --namespace "test" \
    --region '23REZ8hR' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateRootRegionOverride'
delete_file $TEMP_FILE

#- 19 CreateDeploymentOverride
java -jar ${JAR_PATH} dsmc createDeploymentOverride \
    --body '{"buffer_count": 94, "buffer_percent": 98, "configuration": "7LGOvDdY", "enable_region_overrides": false, "game_version": "QS9i7mV1", "max_count": 57, "min_count": 30, "region_overrides": {"jG9gpxL6": {"buffer_count": 48, "buffer_percent": 4, "max_count": 90, "min_count": 84, "name": "dvln2LAu", "use_buffer_percent": true}}, "regions": ["XL6LFE1Y"], "use_buffer_percent": false}' \
    --deployment '9m126ZWc' \
    --namespace "test" \
    --version '8hHtWvbN' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateDeploymentOverride'
delete_file $TEMP_FILE

#- 20 DeleteDeploymentOverride
java -jar ${JAR_PATH} dsmc deleteDeploymentOverride \
    --deployment 'YqgUqslA' \
    --namespace "test" \
    --version 'rFPiHUIv' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteDeploymentOverride'
delete_file $TEMP_FILE

#- 21 UpdateDeploymentOverride
java -jar ${JAR_PATH} dsmc updateDeploymentOverride \
    --body '{"buffer_count": 0, "buffer_percent": 56, "configuration": "v8kU9dBB", "enable_region_overrides": false, "game_version": "dsJLhsVy", "max_count": 61, "min_count": 46, "regions": ["rkxoot0B"], "use_buffer_percent": false}' \
    --deployment 'ercZdpMc' \
    --namespace "test" \
    --version 'i37Ds7YS' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateDeploymentOverride'
delete_file $TEMP_FILE

#- 22 CreateOverrideRegionOverride
java -jar ${JAR_PATH} dsmc createOverrideRegionOverride \
    --body '{"buffer_count": 10, "buffer_percent": 61, "max_count": 46, "min_count": 1, "use_buffer_percent": true}' \
    --deployment 'zLteMbFA' \
    --namespace "test" \
    --region 'lt4hr7Hm' \
    --version 'OYiBA5lt' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateOverrideRegionOverride'
delete_file $TEMP_FILE

#- 23 DeleteOverrideRegionOverride
java -jar ${JAR_PATH} dsmc deleteOverrideRegionOverride \
    --deployment 'AOXmlG6e' \
    --namespace "test" \
    --region 'h1dTdoTF' \
    --version 'pBIcuC1d' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteOverrideRegionOverride'
delete_file $TEMP_FILE

#- 24 UpdateOverrideRegionOverride
java -jar ${JAR_PATH} dsmc updateOverrideRegionOverride \
    --body '{"buffer_count": 85, "buffer_percent": 100, "max_count": 80, "min_count": 70, "use_buffer_percent": false}' \
    --deployment 'J6Te9vD8' \
    --namespace "test" \
    --region 'ldz7Hu8A' \
    --version 'D79kdWun' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateOverrideRegionOverride'
delete_file $TEMP_FILE

#- 25 GetAllPodConfig
java -jar ${JAR_PATH} dsmc getAllPodConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetAllPodConfig'
delete_file $TEMP_FILE

#- 26 GetPodConfig
java -jar ${JAR_PATH} dsmc getPodConfig \
    --name 'vizU0q1p' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetPodConfig'
delete_file $TEMP_FILE

#- 27 CreatePodConfig
java -jar ${JAR_PATH} dsmc createPodConfig \
    --body '{"cpu_limit": 66, "mem_limit": 49, "params": "hhERoGgd"}' \
    --name 'rysMizBG' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreatePodConfig'
delete_file $TEMP_FILE

#- 28 DeletePodConfig
java -jar ${JAR_PATH} dsmc deletePodConfig \
    --name 'SRdP2l7D' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeletePodConfig'
delete_file $TEMP_FILE

#- 29 UpdatePodConfig
java -jar ${JAR_PATH} dsmc updatePodConfig \
    --body '{"cpu_limit": 79, "mem_limit": 89, "name": "Z8Aq0XiP", "params": "LQXSe07Z"}' \
    --name 'ddOGTMlJ' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePodConfig'
delete_file $TEMP_FILE

#- 30 AddPort
java -jar ${JAR_PATH} dsmc addPort \
    --body '{"port": 19}' \
    --name 'Bwj9HJHQ' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AddPort'
delete_file $TEMP_FILE

#- 31 DeletePort
java -jar ${JAR_PATH} dsmc deletePort \
    --name 'KseEdSXR' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeletePort'
delete_file $TEMP_FILE

#- 32 UpdatePort
java -jar ${JAR_PATH} dsmc updatePort \
    --body '{"name": "DSvguauw", "port": 47}' \
    --name 'T7eMwSl9' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePort'
delete_file $TEMP_FILE

#- 33 ListImages
java -jar ${JAR_PATH} dsmc listImages \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListImages'
delete_file $TEMP_FILE

#- 34 DeleteImage
java -jar ${JAR_PATH} dsmc deleteImage \
    --namespace "test" \
    --imageURI 'MLH0NnTJ' \
    --version '2ulNzBvw' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteImage'
delete_file $TEMP_FILE

#- 35 ExportImages
java -jar ${JAR_PATH} dsmc exportImages \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ExportImages'
delete_file $TEMP_FILE

#- 36 GetImageLimit
java -jar ${JAR_PATH} dsmc getImageLimit \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetImageLimit'
delete_file $TEMP_FILE

#- 37 GetImageDetail
java -jar ${JAR_PATH} dsmc getImageDetail \
    --namespace "test" \
    --version 'JaQa547J' \
    >$TEMP_FILE 2>&1
update_status $? 'GetImageDetail'
delete_file $TEMP_FILE

#- 38 ListServer
java -jar ${JAR_PATH} dsmc listServer \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListServer'
delete_file $TEMP_FILE

#- 39 CountServer
java -jar ${JAR_PATH} dsmc countServer \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CountServer'
delete_file $TEMP_FILE

#- 40 CountServerDetailed
java -jar ${JAR_PATH} dsmc countServerDetailed \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CountServerDetailed'
delete_file $TEMP_FILE

#- 41 ListLocalServer
java -jar ${JAR_PATH} dsmc listLocalServer \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListLocalServer'
delete_file $TEMP_FILE

#- 42 DeleteLocalServer
java -jar ${JAR_PATH} dsmc deleteLocalServer \
    --name 'llvA8RWS' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteLocalServer'
delete_file $TEMP_FILE

#- 43 GetServer
java -jar ${JAR_PATH} dsmc getServer \
    --namespace "test" \
    --podName 'pabUt7xk' \
    >$TEMP_FILE 2>&1
update_status $? 'GetServer'
delete_file $TEMP_FILE

#- 44 DeleteServer
java -jar ${JAR_PATH} dsmc deleteServer \
    --namespace "test" \
    --podName '6QxyWhfq' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteServer'
delete_file $TEMP_FILE

#- 45 GetServerLogs
java -jar ${JAR_PATH} dsmc getServerLogs \
    --namespace "test" \
    --podName 'oWfJw2o8' \
    >$TEMP_FILE 2>&1
update_status $? 'GetServerLogs'
delete_file $TEMP_FILE

#- 46 ListSession
java -jar ${JAR_PATH} dsmc listSession \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListSession'
delete_file $TEMP_FILE

#- 47 CountSession
java -jar ${JAR_PATH} dsmc countSession \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CountSession'
delete_file $TEMP_FILE

#- 48 DeleteSession
java -jar ${JAR_PATH} dsmc deleteSession \
    --namespace "test" \
    --sessionID 'oWUqvPCZ' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteSession'
delete_file $TEMP_FILE

#- 49 ExportConfigV1
java -jar ${JAR_PATH} dsmc exportConfigV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ExportConfigV1'
delete_file $TEMP_FILE

#- 50 ImportConfigV1
java -jar ${JAR_PATH} dsmc importConfigV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ImportConfigV1'
delete_file $TEMP_FILE

#- 51 ImageDetailClient
java -jar ${JAR_PATH} dsmc imageDetailClient \
    --namespace "test" \
    --version '2HzT7NXm' \
    >$TEMP_FILE 2>&1
update_status $? 'ImageDetailClient'
delete_file $TEMP_FILE

#- 52 DeregisterLocalServer
java -jar ${JAR_PATH} dsmc deregisterLocalServer \
    --body '{"name": "WDlXsuNI"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeregisterLocalServer'
delete_file $TEMP_FILE

#- 53 RegisterLocalServer
java -jar ${JAR_PATH} dsmc registerLocalServer \
    --body '{"custom_attribute": "dQJR5lsN", "ip": "OlvkfwaS", "name": "bnsuLCgT", "port": 28}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RegisterLocalServer'
delete_file $TEMP_FILE

#- 54 RegisterServer
java -jar ${JAR_PATH} dsmc registerServer \
    --body '{"custom_attribute": "xuVTekJg", "pod_name": "vg6h5HIp"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RegisterServer'
delete_file $TEMP_FILE

#- 55 ShutdownServer
java -jar ${JAR_PATH} dsmc shutdownServer \
    --body '{"kill_me": true, "pod_name": "viplEk4v"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ShutdownServer'
delete_file $TEMP_FILE

#- 56 GetServerSession
java -jar ${JAR_PATH} dsmc getServerSession \
    --namespace "test" \
    --podName 'j3LDp4yq' \
    >$TEMP_FILE 2>&1
update_status $? 'GetServerSession'
delete_file $TEMP_FILE

#- 57 CreateSession
java -jar ${JAR_PATH} dsmc createSession \
    --body '{"client_version": "Dt8QUZDp", "configuration": "xlHasinG", "deployment": "cjrkmRMt", "game_mode": "tgjDSaIV", "matching_allies": [{"matching_parties": [{"party_attributes": {"Bmft3Udg": {}}, "party_id": "7p9PGmY2", "party_members": [{"user_id": "H5kX4Msi"}]}]}], "namespace": "sSX28nAR", "pod_name": "xWRpv5ou", "region": "5xtvd28O", "session_id": "UfCt8UJC"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateSession'
delete_file $TEMP_FILE

#- 58 ClaimServer
java -jar ${JAR_PATH} dsmc claimServer \
    --body '{"session_id": "5flNyj6H"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ClaimServer'
delete_file $TEMP_FILE

#- 59 GetSession
java -jar ${JAR_PATH} dsmc getSession \
    --namespace "test" \
    --sessionID 'sTtX8P3l' \
    >$TEMP_FILE 2>&1
update_status $? 'GetSession'
delete_file $TEMP_FILE

#- 60 GetDefaultProvider
java -jar ${JAR_PATH} dsmc getDefaultProvider \
    >$TEMP_FILE 2>&1
update_status $? 'GetDefaultProvider'
delete_file $TEMP_FILE

#- 61 ListProviders
java -jar ${JAR_PATH} dsmc listProviders \
    >$TEMP_FILE 2>&1
update_status $? 'ListProviders'
delete_file $TEMP_FILE

#- 62 ListProvidersByRegion
java -jar ${JAR_PATH} dsmc listProvidersByRegion \
    --region 'lnaaS9lq' \
    >$TEMP_FILE 2>&1
update_status $? 'ListProvidersByRegion'
delete_file $TEMP_FILE

#- 63 PublicGetMessages
java -jar ${JAR_PATH} dsmc publicGetMessages \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetMessages'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT