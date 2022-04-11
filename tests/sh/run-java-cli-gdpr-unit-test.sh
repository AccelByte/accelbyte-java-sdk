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

OPERATIONS_COUNT=20

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

#- 1 AdminGetListDeletionDataRequest
java -jar ${JAR_PATH} gdpr adminGetListDeletionDataRequest \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetListDeletionDataRequest'
delete_file $TEMP_FILE

#- 2 GetAdminEmailConfiguration
java -jar ${JAR_PATH} gdpr getAdminEmailConfiguration \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetAdminEmailConfiguration'
delete_file $TEMP_FILE

#- 3 UpdateAdminEmailConfiguration
java -jar ${JAR_PATH} gdpr updateAdminEmailConfiguration \
    --body '["FtBxyZcD"]' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateAdminEmailConfiguration'
delete_file $TEMP_FILE

#- 4 SaveAdminEmailConfiguration
java -jar ${JAR_PATH} gdpr saveAdminEmailConfiguration \
    --body '["XBpGlsQu"]' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SaveAdminEmailConfiguration'
delete_file $TEMP_FILE

#- 5 DeleteAdminEmailConfiguration
java -jar ${JAR_PATH} gdpr deleteAdminEmailConfiguration \
    --namespace "test" \
    --emails '["Ju8vMf0I"]' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteAdminEmailConfiguration'
delete_file $TEMP_FILE

#- 6 AdminGetListPersonalDataRequest
java -jar ${JAR_PATH} gdpr adminGetListPersonalDataRequest \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetListPersonalDataRequest'
delete_file $TEMP_FILE

#- 7 AdminGetUserAccountDeletionRequest
java -jar ${JAR_PATH} gdpr adminGetUserAccountDeletionRequest \
    --namespace "test" \
    --userId 'sJkTrd8I' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserAccountDeletionRequest'
delete_file $TEMP_FILE

#- 8 AdminSubmitUserAccountDeletionRequest
java -jar ${JAR_PATH} gdpr adminSubmitUserAccountDeletionRequest \
    --namespace "test" \
    --userId 'DcV2zXnT' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminSubmitUserAccountDeletionRequest'
delete_file $TEMP_FILE

#- 9 AdminCancelUserAccountDeletionRequest
java -jar ${JAR_PATH} gdpr adminCancelUserAccountDeletionRequest \
    --namespace "test" \
    --userId 'KjXY1bPq' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCancelUserAccountDeletionRequest'
delete_file $TEMP_FILE

#- 10 AdminGetUserPersonalDataRequests
java -jar ${JAR_PATH} gdpr adminGetUserPersonalDataRequests \
    --namespace "test" \
    --userId 'amiBxx9C' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserPersonalDataRequests'
delete_file $TEMP_FILE

#- 11 AdminRequestDataRetrieval
java -jar ${JAR_PATH} gdpr adminRequestDataRetrieval \
    --namespace "test" \
    --userId 's18EY84e' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRequestDataRetrieval'
delete_file $TEMP_FILE

#- 12 AdminCancelUserPersonalDataRequest
java -jar ${JAR_PATH} gdpr adminCancelUserPersonalDataRequest \
    --namespace "test" \
    --requestDate 'kItqRzHU' \
    --userId '1oh570KQ' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCancelUserPersonalDataRequest'
delete_file $TEMP_FILE

#- 13 AdminGeneratePersonalDataURL
java -jar ${JAR_PATH} gdpr adminGeneratePersonalDataURL \
    --password 'BVaewc72' \
    --namespace "test" \
    --requestDate 'krSha68n' \
    --userId '3Ynozp1C' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGeneratePersonalDataURL'
delete_file $TEMP_FILE

#- 14 PublicSubmitUserAccountDeletionRequest
java -jar ${JAR_PATH} gdpr publicSubmitUserAccountDeletionRequest \
    --password '2KmIQTuB' \
    --namespace "test" \
    --userId 'dNEUsxFb' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicSubmitUserAccountDeletionRequest'
delete_file $TEMP_FILE

#- 15 PublicCancelUserAccountDeletionRequest
java -jar ${JAR_PATH} gdpr publicCancelUserAccountDeletionRequest \
    --namespace "test" \
    --userId '8CJ17M7D' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCancelUserAccountDeletionRequest'
delete_file $TEMP_FILE

#- 16 PublicGetUserAccountDeletionStatus
java -jar ${JAR_PATH} gdpr publicGetUserAccountDeletionStatus \
    --namespace "test" \
    --userId 'JZaMSxEC' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserAccountDeletionStatus'
delete_file $TEMP_FILE

#- 17 PublicGetUserPersonalDataRequests
java -jar ${JAR_PATH} gdpr publicGetUserPersonalDataRequests \
    --namespace "test" \
    --userId 'bZbygyoa' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserPersonalDataRequests'
delete_file $TEMP_FILE

#- 18 PublicRequestDataRetrieval
java -jar ${JAR_PATH} gdpr publicRequestDataRetrieval \
    --password 'rORoeNHS' \
    --namespace "test" \
    --userId 'b8Rh3kgs' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicRequestDataRetrieval'
delete_file $TEMP_FILE

#- 19 PublicCancelUserPersonalDataRequest
java -jar ${JAR_PATH} gdpr publicCancelUserPersonalDataRequest \
    --namespace "test" \
    --requestDate '9qqJbnQs' \
    --userId 'oBgiVpP8' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCancelUserPersonalDataRequest'
delete_file $TEMP_FILE

#- 20 PublicGeneratePersonalDataURL
java -jar ${JAR_PATH} gdpr publicGeneratePersonalDataURL \
    --password 'Cm3yvASU' \
    --namespace "test" \
    --requestDate 'oxdxxFqm' \
    --userId 'AGTJ8IEd' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGeneratePersonalDataURL'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT