#!/bin/bash

#Meta:
#- random seed: 256
#- template file: java-cli-unit-test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH="${MODULE_PATH:-../../samples/cli}"
JAR_PATH="${MODULE_PATH}/build/libs/cli.jar"
TEMP_FILE='file.tmp'

OPERATIONS_COUNT=4

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

#- 1 DeleteServer
java -jar ${JAR_PATH} qosm deleteServer \
    --region 'FtBxyZcD' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteServer'
delete_file $TEMP_FILE

#- 2 SetServerAlias
java -jar ${JAR_PATH} qosm setServerAlias \
    --body '{"alias": "XBpGlsQu"}' \
    --region 'Ju8vMf0I' \
    >$TEMP_FILE 2>&1
update_status $? 'SetServerAlias'
delete_file $TEMP_FILE

#- 3 ListServer
java -jar ${JAR_PATH} qosm listServer \
    >$TEMP_FILE 2>&1
update_status $? 'ListServer'
delete_file $TEMP_FILE

#- 4 Heartbeat
java -jar ${JAR_PATH} qosm heartbeat \
    --body '{"ip": "sJkTrd8I", "port": 59, "region": "cV2zXnTK"}' \
    >$TEMP_FILE 2>&1
update_status $? 'Heartbeat'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT