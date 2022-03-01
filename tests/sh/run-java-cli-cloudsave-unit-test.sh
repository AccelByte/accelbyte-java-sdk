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

OPERATIONS_COUNT=30

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

#- 1 ListGameRecordsHandlerV1
java -jar ${JAR_PATH} cloudsave listGameRecordsHandlerV1 \
    --namespace "test" \
    --limit '62' \
    --offset '39' \
    >$TEMP_FILE 2>&1
update_status $? 'ListGameRecordsHandlerV1'
delete_file $TEMP_FILE

#- 2 AdminGetGameRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminGetGameRecordHandlerV1 \
    --key 'BxyZcDXB' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetGameRecordHandlerV1'
delete_file $TEMP_FILE

#- 3 AdminPutGameRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminPutGameRecordHandlerV1 \
    --body '{}' \
    --key 'pGlsQuJu' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPutGameRecordHandlerV1'
delete_file $TEMP_FILE

#- 4 AdminPostGameRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminPostGameRecordHandlerV1 \
    --body '{}' \
    --key '8vMf0IsJ' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPostGameRecordHandlerV1'
delete_file $TEMP_FILE

#- 5 AdminDeleteGameRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'kTrd8IDc' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteGameRecordHandlerV1'
delete_file $TEMP_FILE

#- 6 ListPlayerRecordHandlerV1
update_status 0 'ListPlayerRecordHandlerV1 (skipped deprecated)'

#- 7 AdminRetrievePlayerRecords
java -jar ${JAR_PATH} cloudsave adminRetrievePlayerRecords \
    --namespace "test" \
    --userId 'V2zXnTKj' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRetrievePlayerRecords'
delete_file $TEMP_FILE

#- 8 AdminGetPlayerRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'XY1bPqam' \
    --namespace "test" \
    --userId 'iBxx9Cs1' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetPlayerRecordHandlerV1'
delete_file $TEMP_FILE

#- 9 AdminPutPlayerRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminPutPlayerRecordHandlerV1 \
    --body '{}' \
    --key '8EY84ekI' \
    --namespace "test" \
    --userId 'tqRzHU1o' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPutPlayerRecordHandlerV1'
delete_file $TEMP_FILE

#- 10 AdminPostPlayerRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminPostPlayerRecordHandlerV1 \
    --body '{}' \
    --key 'h570KQBV' \
    --namespace "test" \
    --userId 'aewc72kr' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPostPlayerRecordHandlerV1'
delete_file $TEMP_FILE

#- 11 AdminDeletePlayerRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'Sha68n3Y' \
    --namespace "test" \
    --userId 'nozp1C2K' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeletePlayerRecordHandlerV1'
delete_file $TEMP_FILE

#- 12 AdminGetPlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key 'mIQTuBdN' \
    --namespace "test" \
    --userId 'EUsxFb8C' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetPlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

#- 13 AdminPutPlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --body '{}' \
    --key 'J17M7DJZ' \
    --namespace "test" \
    --userId 'aMSxECbZ' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPutPlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

#- 14 AdminPostPlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --body '{}' \
    --key 'bygyoarO' \
    --namespace "test" \
    --userId 'RoeNHSb8' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPostPlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

#- 15 AdminDeletePlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'Rh3kgs9q' \
    --namespace "test" \
    --userId 'qJbnQsoB' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeletePlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

#- 16 PutGameRecordConcurrentHandlerV1
java -jar ${JAR_PATH} cloudsave putGameRecordConcurrentHandlerV1 \
    --body '{"updatedAt": "giVpP8Cm", "value": {"3yvASUox": {}}}' \
    --key 'dxxFqmAG' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PutGameRecordConcurrentHandlerV1'
delete_file $TEMP_FILE

#- 17 GetGameRecordHandlerV1
java -jar ${JAR_PATH} cloudsave getGameRecordHandlerV1 \
    --key 'TJ8IEdag' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetGameRecordHandlerV1'
delete_file $TEMP_FILE

#- 18 PutGameRecordHandlerV1
java -jar ${JAR_PATH} cloudsave putGameRecordHandlerV1 \
    --body '{}' \
    --key 'Etp4w29K' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PutGameRecordHandlerV1'
delete_file $TEMP_FILE

#- 19 PostGameRecordHandlerV1
java -jar ${JAR_PATH} cloudsave postGameRecordHandlerV1 \
    --body '{}' \
    --key 'Ou9c19R6' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PostGameRecordHandlerV1'
delete_file $TEMP_FILE

#- 20 DeleteGameRecordHandlerV1
java -jar ${JAR_PATH} cloudsave deleteGameRecordHandlerV1 \
    --key 'XDqWHkkP' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteGameRecordHandlerV1'
delete_file $TEMP_FILE

#- 21 BulkGetPlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --body '{"userIds": ["8npLEKMf"]}' \
    --key 'jiX7jpkV' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'BulkGetPlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

#- 22 PublicDeletePlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'Zk3IaQYE' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicDeletePlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

#- 23 PutPlayerPublicRecordConcurrentHandlerV1
java -jar ${JAR_PATH} cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --body '{"updatedAt": "mqGodOEG", "value": {"t9gPOj0c": {}}}' \
    --key '6i0JkvIa' \
    --namespace "test" \
    --userId 's73ucYnF' \
    >$TEMP_FILE 2>&1
update_status $? 'PutPlayerPublicRecordConcurrentHandlerV1'
delete_file $TEMP_FILE

#- 24 GetPlayerRecordHandlerV1
java -jar ${JAR_PATH} cloudsave getPlayerRecordHandlerV1 \
    --key 'AJ3DK5T4' \
    --namespace "test" \
    --userId 'Eogg0Y39' \
    >$TEMP_FILE 2>&1
update_status $? 'GetPlayerRecordHandlerV1'
delete_file $TEMP_FILE

#- 25 PutPlayerRecordHandlerV1
java -jar ${JAR_PATH} cloudsave putPlayerRecordHandlerV1 \
    --body '{}' \
    --key 'UoYlpv5b' \
    --namespace "test" \
    --userId 'VAgtsDhU' \
    >$TEMP_FILE 2>&1
update_status $? 'PutPlayerRecordHandlerV1'
delete_file $TEMP_FILE

#- 26 PostPlayerRecordHandlerV1
java -jar ${JAR_PATH} cloudsave postPlayerRecordHandlerV1 \
    --body '{}' \
    --key 'TDUscbQD' \
    --namespace "test" \
    --userId 'jbTQuPMz' \
    >$TEMP_FILE 2>&1
update_status $? 'PostPlayerRecordHandlerV1'
delete_file $TEMP_FILE

#- 27 DeletePlayerRecordHandlerV1
java -jar ${JAR_PATH} cloudsave deletePlayerRecordHandlerV1 \
    --key '2PTRlkyU' \
    --namespace "test" \
    --userId '89ZPOw6z' \
    >$TEMP_FILE 2>&1
update_status $? 'DeletePlayerRecordHandlerV1'
delete_file $TEMP_FILE

#- 28 GetPlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'PFJ42cwm' \
    --namespace "test" \
    --userId 'zBBSMNco' \
    >$TEMP_FILE 2>&1
update_status $? 'GetPlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

#- 29 PutPlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave putPlayerPublicRecordHandlerV1 \
    --body '{}' \
    --key 'AAOjKNjf' \
    --namespace "test" \
    --userId 'cYHm093a' \
    >$TEMP_FILE 2>&1
update_status $? 'PutPlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

#- 30 PostPlayerPublicRecordHandlerV1
java -jar ${JAR_PATH} cloudsave postPlayerPublicRecordHandlerV1 \
    --body '{}' \
    --key 'YgBU1sqj' \
    --namespace "test" \
    --userId 'yK0XH45P' \
    >$TEMP_FILE 2>&1
update_status $? 'PostPlayerPublicRecordHandlerV1'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT