#!/bin/bash

#Meta:
#- random seed: 256
#- template file: java-cli-unit-test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH='../../samples/cli'
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

${MODULE_PATH}/gradlew -p ${MODULE_PATH} fatJar

java -jar ${JAR_PATH} loginClient

#- 1 AgentTypeDescriptionHandler
update_status 0 'AgentTypeDescriptionHandler (skipped deprecated)'

#- 2 SpecificAgentTypeDescriptionHandler
update_status 0 'SpecificAgentTypeDescriptionHandler (skipped deprecated)'

#- 3 EventIDDescriptionHandler
update_status 0 'EventIDDescriptionHandler (skipped deprecated)'

#- 4 SpecificEventIDDescriptionHandler
update_status 0 'SpecificEventIDDescriptionHandler (skipped deprecated)'

#- 5 EventLevelDescriptionHandler
update_status 0 'EventLevelDescriptionHandler (skipped deprecated)'

#- 6 SpecificEventLevelDescriptionHandler
update_status 0 'SpecificEventLevelDescriptionHandler (skipped deprecated)'

#- 7 EventTypeDescriptionHandler
update_status 0 'EventTypeDescriptionHandler (skipped deprecated)'

#- 8 SpecificEventTypeDescriptionHandler
update_status 0 'SpecificEventTypeDescriptionHandler (skipped deprecated)'

#- 9 UXNameDescriptionHandler
update_status 0 'UXNameDescriptionHandler (skipped deprecated)'

#- 10 SpecificUXDescriptionHandler
update_status 0 'SpecificUXDescriptionHandler (skipped deprecated)'

#- 11 GetEventByNamespaceHandler
update_status 0 'GetEventByNamespaceHandler (skipped deprecated)'

#- 12 PostEventHandler
update_status 0 'PostEventHandler (skipped deprecated)'

#- 13 GetEventByEventIDHandler
update_status 0 'GetEventByEventIDHandler (skipped deprecated)'

#- 14 GetEventByEventTypeHandler
update_status 0 'GetEventByEventTypeHandler (skipped deprecated)'

#- 15 GetEventByEventTypeAndEventIDHandler
update_status 0 'GetEventByEventTypeAndEventIDHandler (skipped deprecated)'

#- 16 GetEventByUserIDHandler
update_status 0 'GetEventByUserIDHandler (skipped deprecated)'

#- 17 GetUserActivitiesHandler
update_status 0 'GetUserActivitiesHandler (skipped deprecated)'

#- 18 DeleteUserActivitiesHandler
update_status 0 'DeleteUserActivitiesHandler (skipped deprecated)'

#- 19 GetEventByUserIDAndEventIDHandler
update_status 0 'GetEventByUserIDAndEventIDHandler (skipped deprecated)'

#- 20 GetEventByUserIDAndEventTypeHandler
update_status 0 'GetEventByUserIDAndEventTypeHandler (skipped deprecated)'

#- 21 GetEventByUserEventIDAndEventTypeHandler
update_status 0 'GetEventByUserEventIDAndEventTypeHandler (skipped deprecated)'

#- 22 LastUserActivityTimeHandler
update_status 0 'LastUserActivityTimeHandler (skipped deprecated)'

#- 23 GetRegisteredEventsHandler
update_status 0 'GetRegisteredEventsHandler (skipped deprecated)'

#- 24 RegisterEventHandler
update_status 0 'RegisterEventHandler (skipped deprecated)'

#- 25 GetRegisteredEventIDHandler
update_status 0 'GetRegisteredEventIDHandler (skipped deprecated)'

#- 26 UpdateEventRegistryHandler
update_status 0 'UpdateEventRegistryHandler (skipped deprecated)'

#- 27 UnregisterEventIDHandler
update_status 0 'UnregisterEventIDHandler (skipped deprecated)'

#- 28 GetRegisteredEventsByEventTypeHandler
update_status 0 'GetRegisteredEventsByEventTypeHandler (skipped deprecated)'

#- 29 QueryEventStreamHandler
java -jar ${JAR_PATH} eventlog queryEventStreamHandler \
    --body '{"clientId": "FtBxyZcD", "eventName": "XBpGlsQu", "payloadQuery": {"Ju8vMf0I": {}}, "sessionId": "sJkTrd8I", "traceId": "DcV2zXnT", "userId": "KjXY1bPq", "version": 1}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QueryEventStreamHandler'
delete_file $TEMP_FILE

#- 30 GetEventSpecificUserV2Handler
java -jar ${JAR_PATH} eventlog getEventSpecificUserV2Handler \
    --namespace "test" \
    --userId 'miBxx9Cs' \
    >$TEMP_FILE 2>&1
update_status $? 'GetEventSpecificUserV2Handler'
delete_file $TEMP_FILE

#- 31 GetPublicEditHistory
java -jar ${JAR_PATH} eventlog getPublicEditHistory \
    --namespace "test" \
    --userId '18EY84ek' \
    >$TEMP_FILE 2>&1
update_status $? 'GetPublicEditHistory'
delete_file $TEMP_FILE

#- 32 GetUserEventsV2Public
java -jar ${JAR_PATH} eventlog getUserEventsV2Public \
    --namespace "test" \
    --userId 'ItqRzHU1' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserEventsV2Public'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT