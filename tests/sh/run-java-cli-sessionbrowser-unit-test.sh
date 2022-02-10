#!/bin/bash

#Meta:
#- random seed: 256
#- template file: java-cli-unit-test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH='../../samples/cli'
JAR_PATH="${MODULE_PATH}/build/libs/cli.jar"
TEMP_FILE='file.tmp'

OPERATIONS_COUNT=15

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

#- 1 GetTotalActiveSession
java -jar ${JAR_PATH} sessionbrowser getTotalActiveSession \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetTotalActiveSession'
delete_file $TEMP_FILE

#- 2 GetActiveCustomGameSessions
java -jar ${JAR_PATH} sessionbrowser getActiveCustomGameSessions \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetActiveCustomGameSessions'
delete_file $TEMP_FILE

#- 3 GetActiveMatchmakingGameSessions
java -jar ${JAR_PATH} sessionbrowser getActiveMatchmakingGameSessions \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetActiveMatchmakingGameSessions'
delete_file $TEMP_FILE

#- 4 AdminGetSession
java -jar ${JAR_PATH} sessionbrowser adminGetSession \
    --namespace "test" \
    --sessionID 'FtBxyZcD' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetSession'
delete_file $TEMP_FILE

#- 5 QuerySession
java -jar ${JAR_PATH} sessionbrowser querySession \
    --namespace "test" \
    --sessionType 'XBpGlsQu' \
    >$TEMP_FILE 2>&1
update_status $? 'QuerySession'
delete_file $TEMP_FILE

#- 6 CreateSession
java -jar ${JAR_PATH} sessionbrowser createSession \
    --body '{"game_session_setting": {"allow_join_in_progress": true, "current_internal_player": 42, "current_player": 77, "map_name": "f0IsJkTr", "max_internal_player": 6, "max_player": 68, "mode": "DcV2zXnT", "num_bot": 72, "password": "jXY1bPqa", "settings": {"miBxx9Cs": {}}}, "game_version": "18EY84ek", "namespace": "ItqRzHU1", "session_type": "oh570KQB", "username": "Vaewc72k"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateSession'
delete_file $TEMP_FILE

#- 7 GetSessionByUserIDs
java -jar ${JAR_PATH} sessionbrowser getSessionByUserIDs \
    --namespace "test" \
    --userIds 'rSha68n3' \
    >$TEMP_FILE 2>&1
update_status $? 'GetSessionByUserIDs'
delete_file $TEMP_FILE

#- 8 GetSession
java -jar ${JAR_PATH} sessionbrowser getSession \
    --namespace "test" \
    --sessionID 'Ynozp1C2' \
    >$TEMP_FILE 2>&1
update_status $? 'GetSession'
delete_file $TEMP_FILE

#- 9 UpdateSession
java -jar ${JAR_PATH} sessionbrowser updateSession \
    --body '{"game_current_player": 72, "game_max_player": 24}' \
    --namespace "test" \
    --sessionID 'IQTuBdNE' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateSession'
delete_file $TEMP_FILE

#- 10 DeleteSession
java -jar ${JAR_PATH} sessionbrowser deleteSession \
    --namespace "test" \
    --sessionID 'UsxFb8CJ' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteSession'
delete_file $TEMP_FILE

#- 11 JoinSession
java -jar ${JAR_PATH} sessionbrowser joinSession \
    --body '{"password": "17M7DJZa"}' \
    --namespace "test" \
    --sessionID 'MSxECbZb' \
    >$TEMP_FILE 2>&1
update_status $? 'JoinSession'
delete_file $TEMP_FILE

#- 12 DeleteSessionLocalDS
java -jar ${JAR_PATH} sessionbrowser deleteSessionLocalDS \
    --namespace "test" \
    --sessionID 'ygyoarOR' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteSessionLocalDS'
delete_file $TEMP_FILE

#- 13 AddPlayerToSession
java -jar ${JAR_PATH} sessionbrowser addPlayerToSession \
    --body '{"as_spectator": false, "user_id": "eNHSb8Rh"}' \
    --namespace "test" \
    --sessionID '3kgs9qqJ' \
    >$TEMP_FILE 2>&1
update_status $? 'AddPlayerToSession'
delete_file $TEMP_FILE

#- 14 RemovePlayerFromSession
java -jar ${JAR_PATH} sessionbrowser removePlayerFromSession \
    --namespace "test" \
    --sessionID 'bnQsoBgi' \
    --userID 'VpP8Cm3y' \
    >$TEMP_FILE 2>&1
update_status $? 'RemovePlayerFromSession'
delete_file $TEMP_FILE

#- 15 GetRecentPlayer
java -jar ${JAR_PATH} sessionbrowser getRecentPlayer \
    --namespace "test" \
    --userID 'vASUoxdx' \
    >$TEMP_FILE 2>&1
update_status $? 'GetRecentPlayer'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT