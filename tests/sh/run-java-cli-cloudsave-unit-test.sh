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

OPERATIONS_COUNT=32

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

#- 1 AdminPutGameRecordConcurrentHandlerV1
java -jar ${JAR_PATH} cloudsave adminPutGameRecordConcurrentHandlerV1 \
    --body '{"set_by": "FtBxyZcD", "updatedAt": "XBpGlsQu", "value": {"Ju8vMf0I": {}}}' \
    --key 'sJkTrd8I' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPutGameRecordConcurrentHandlerV1'
delete_file $TEMP_FILE

#- 2 ListGameRecordsHandlerV1
java -jar ${JAR_PATH} cloudsave listGameRecordsHandlerV1 \
    --namespace "test" \
    --limit '59' \
    --offset '4' \
    >$TEMP_FILE 2>&1
update_status $? 'ListGameRecordsHandlerV1'
delete_file $TEMP_FILE

#- 3 AdminGetGameRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminGetGameRecordHandlerV1 \
    --key 'V2zXnTKj' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetGameRecordHandlerV1'
delete_file $TEMP_FILE

#- 4 AdminPutGameRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminPutGameRecordHandlerV1 \
    --body '{}' \
    --key 'XY1bPqam' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPutGameRecordHandlerV1'
delete_file $TEMP_FILE

#- 5 AdminPostGameRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminPostGameRecordHandlerV1 \
    --body '{}' \
    --key 'iBxx9Cs1' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPostGameRecordHandlerV1'
delete_file $TEMP_FILE

#- 6 AdminDeleteGameRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminDeleteGameRecordHandlerV1 \
    --key '8EY84ekI' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteGameRecordHandlerV1'
delete_file $TEMP_FILE

#- 7 ListPlayerRecordHandlerV1
update_status 0 'ListPlayerRecordHandlerV1 (skipped deprecated)'

#- 8 AdminPutPlayerPublicRecordConcurrentHandlerV1
java -jar ${JAR_PATH} cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --body '{"set_by": "tqRzHU1o", "updatedAt": "h570KQBV", "value": {"aewc72kr": {}}}' \
    --key 'Sha68n3Y' \
    --namespace "test" \
    --userId 'nozp1C2K' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPutPlayerPublicRecordConcurrentHandlerV1'
delete_file $TEMP_FILE

#- 9 AdminRetrievePlayerRecords
java -jar ${JAR_PATH} cloudsave adminRetrievePlayerRecords \
    --namespace "test" \
    --userId 'mIQTuBdN' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRetrievePlayerRecords'
delete_file $TEMP_FILE

#- 10 AdminGetPlayerRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'EUsxFb8C' \
    --namespace "test" \
    --userId 'J17M7DJZ' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetPlayerRecordHandlerV1'
delete_file $TEMP_FILE

#- 11 AdminPutPlayerRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminPutPlayerRecordHandlerV1 \
    --body '{}' \
    --key 'aMSxECbZ' \
    --namespace "test" \
    --userId 'bygyoarO' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPutPlayerRecordHandlerV1'
delete_file $TEMP_FILE

#- 12 AdminPostPlayerRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminPostPlayerRecordHandlerV1 \
    --body '{}' \
    --key 'RoeNHSb8' \
    --namespace "test" \
    --userId 'Rh3kgs9q' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPostPlayerRecordHandlerV1'
delete_file $TEMP_FILE

#- 13 AdminDeletePlayerRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'qJbnQsoB' \
    --namespace "test" \
    --userId 'giVpP8Cm' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeletePlayerRecordHandlerV1'
delete_file $TEMP_FILE

#- 14 AdminGetPlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key '3yvASUox' \
    --namespace "test" \
    --userId 'dxxFqmAG' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetPlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

#- 15 AdminPutPlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --body '{}' \
    --key 'TJ8IEdag' \
    --namespace "test" \
    --userId 'Etp4w29K' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPutPlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

#- 16 AdminPostPlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --body '{}' \
    --key 'Ou9c19R6' \
    --namespace "test" \
    --userId 'XDqWHkkP' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPostPlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

#- 17 AdminDeletePlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key '8npLEKMf' \
    --namespace "test" \
    --userId 'jiX7jpkV' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeletePlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

#- 18 PutGameRecordConcurrentHandlerV1
java -jar ${JAR_PATH} cloudsave putGameRecordConcurrentHandlerV1 \
    --body '{"updatedAt": "Zk3IaQYE", "value": {"mqGodOEG": {}}}' \
    --key 't9gPOj0c' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PutGameRecordConcurrentHandlerV1'
delete_file $TEMP_FILE

#- 19 GetGameRecordHandlerV1
java -jar ${JAR_PATH} cloudsave getGameRecordHandlerV1 \
    --key '6i0JkvIa' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetGameRecordHandlerV1'
delete_file $TEMP_FILE

#- 20 PutGameRecordHandlerV1
java -jar ${JAR_PATH} cloudsave putGameRecordHandlerV1 \
    --body '{}' \
    --key 's73ucYnF' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PutGameRecordHandlerV1'
delete_file $TEMP_FILE

#- 21 PostGameRecordHandlerV1
java -jar ${JAR_PATH} cloudsave postGameRecordHandlerV1 \
    --body '{}' \
    --key 'AJ3DK5T4' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PostGameRecordHandlerV1'
delete_file $TEMP_FILE

#- 22 DeleteGameRecordHandlerV1
java -jar ${JAR_PATH} cloudsave deleteGameRecordHandlerV1 \
    --key 'Eogg0Y39' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteGameRecordHandlerV1'
delete_file $TEMP_FILE

#- 23 BulkGetPlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --body '{"userIds": ["UoYlpv5b"]}' \
    --key 'VAgtsDhU' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'BulkGetPlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

#- 24 PublicDeletePlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'TDUscbQD' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicDeletePlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

#- 25 PutPlayerPublicRecordConcurrentHandlerV1
java -jar ${JAR_PATH} cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --body '{"updatedAt": "jbTQuPMz", "value": {"2PTRlkyU": {}}}' \
    --key '89ZPOw6z' \
    --namespace "test" \
    --userId 'PFJ42cwm' \
    >$TEMP_FILE 2>&1
update_status $? 'PutPlayerPublicRecordConcurrentHandlerV1'
delete_file $TEMP_FILE

#- 26 GetPlayerRecordHandlerV1
java -jar ${JAR_PATH} cloudsave getPlayerRecordHandlerV1 \
    --key 'zBBSMNco' \
    --namespace "test" \
    --userId 'AAOjKNjf' \
    >$TEMP_FILE 2>&1
update_status $? 'GetPlayerRecordHandlerV1'
delete_file $TEMP_FILE

#- 27 PutPlayerRecordHandlerV1
java -jar ${JAR_PATH} cloudsave putPlayerRecordHandlerV1 \
    --body '{}' \
    --key 'cYHm093a' \
    --namespace "test" \
    --userId 'YgBU1sqj' \
    >$TEMP_FILE 2>&1
update_status $? 'PutPlayerRecordHandlerV1'
delete_file $TEMP_FILE

#- 28 PostPlayerRecordHandlerV1
java -jar ${JAR_PATH} cloudsave postPlayerRecordHandlerV1 \
    --body '{}' \
    --key 'yK0XH45P' \
    --namespace "test" \
    --userId 'aRSOFQBt' \
    >$TEMP_FILE 2>&1
update_status $? 'PostPlayerRecordHandlerV1'
delete_file $TEMP_FILE

#- 29 DeletePlayerRecordHandlerV1
java -jar ${JAR_PATH} cloudsave deletePlayerRecordHandlerV1 \
    --key 'u23REZ8h' \
    --namespace "test" \
    --userId 'RVX7LGOv' \
    >$TEMP_FILE 2>&1
update_status $? 'DeletePlayerRecordHandlerV1'
delete_file $TEMP_FILE

#- 30 GetPlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'DdYiQS9i' \
    --namespace "test" \
    --userId '7mV1C91p' \
    >$TEMP_FILE 2>&1
update_status $? 'GetPlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

#- 31 PutPlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave putPlayerPublicRecordHandlerV1 \
    --body '{}' \
    --key 'jG9gpxL6' \
    --namespace "test" \
    --userId 'ycTQdvln' \
    >$TEMP_FILE 2>&1
update_status $? 'PutPlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

#- 32 PostPlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave postPlayerPublicRecordHandlerV1 \
    --body '{}' \
    --key '2LAuSQWE' \
    --namespace "test" \
    --userId 'XL6LFE1Y' \
    >$TEMP_FILE 2>&1
update_status $? 'PostPlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT