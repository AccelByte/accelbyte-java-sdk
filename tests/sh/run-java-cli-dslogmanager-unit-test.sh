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

OPERATIONS_COUNT=6

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

#- 1 ListTerminatedServers
java -jar ${JAR_PATH} dslogmanager listTerminatedServers \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListTerminatedServers'
delete_file $TEMP_FILE

#- 2 DownloadServerLogs
java -jar ${JAR_PATH} dslogmanager downloadServerLogs \
    --namespace "test" \
    --podName 'FtBxyZcD' \
    >$TEMP_FILE 2>&1
update_status $? 'DownloadServerLogs'
delete_file $TEMP_FILE

#- 3 CheckServerLogs
java -jar ${JAR_PATH} dslogmanager checkServerLogs \
    --namespace "test" \
    --podName 'XBpGlsQu' \
    >$TEMP_FILE 2>&1
update_status $? 'CheckServerLogs'
delete_file $TEMP_FILE

#- 4 BatchDownloadServerLogs
java -jar ${JAR_PATH} dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "Ju8vMf0I", "namespace": "sJkTrd8I", "pod_name": "DcV2zXnT"}]}' \
    >$TEMP_FILE 2>&1
update_status $? 'BatchDownloadServerLogs'
delete_file $TEMP_FILE

#- 5 ListAllTerminatedServers
java -jar ${JAR_PATH} dslogmanager listAllTerminatedServers \
    >$TEMP_FILE 2>&1
update_status $? 'ListAllTerminatedServers'
delete_file $TEMP_FILE

#- 6 PublicGetMessages
java -jar ${JAR_PATH} dslogmanager publicGetMessages \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetMessages'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT