#!/bin/bash

#Meta:
#- random seed: 256
#- template file: java-cli-unit-test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH='../../samples/cli'
JAR_PATH="${MODULE_PATH}/build/libs/cli.jar"
TEMP_FILE='file.tmp'

OPERATIONS_COUNT=34

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

#- 1 GetLeaderboardConfigurationsAdminV1
java -jar ${JAR_PATH} leaderboard getLeaderboardConfigurationsAdminV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetLeaderboardConfigurationsAdminV1'
delete_file $TEMP_FILE

#- 2 CreateLeaderboardConfigurationAdminV1
java -jar ${JAR_PATH} leaderboard createLeaderboardConfigurationAdminV1 \
    --body '{"daily": {"resetTime": "FtBxyZcD"}, "descending": true, "iconURL": "pGlsQuJu", "leaderboardCode": "8vMf0IsJ", "monthly": {"resetDate": 20, "resetTime": "Trd8IDcV"}, "name": "2zXnTKjX", "seasonPeriod": 3, "startTime": "PqamiBxx", "statCode": "9Cs18EY8", "weekly": {"resetDay": 9, "resetTime": "kItqRzHU"}}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateLeaderboardConfigurationAdminV1'
delete_file $TEMP_FILE

#- 3 AdminGetArchivedLeaderboardRankingDataV1Handler
java -jar ${JAR_PATH} leaderboard adminGetArchivedLeaderboardRankingDataV1Handler \
    --namespace "test" \
    --leaderboardCodes '1oh570KQ' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetArchivedLeaderboardRankingDataV1Handler'
delete_file $TEMP_FILE

#- 4 CreateArchivedLeaderboardRankingDataV1Handler
java -jar ${JAR_PATH} leaderboard createArchivedLeaderboardRankingDataV1Handler \
    --body '{"leaderboardCodes": ["BVaewc72"], "limit": 21, "slug": "rSha68n3"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateArchivedLeaderboardRankingDataV1Handler'
delete_file $TEMP_FILE

#- 5 DeleteBulkLeaderboardConfigurationAdminV1
java -jar ${JAR_PATH} leaderboard deleteBulkLeaderboardConfigurationAdminV1 \
    --body '{"leaderboardCodes": ["Ynozp1C2"]}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteBulkLeaderboardConfigurationAdminV1'
delete_file $TEMP_FILE

#- 6 GetLeaderboardConfigurationAdminV1
java -jar ${JAR_PATH} leaderboard getLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'KmIQTuBd' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetLeaderboardConfigurationAdminV1'
delete_file $TEMP_FILE

#- 7 UpdateLeaderboardConfigurationAdminV1
java -jar ${JAR_PATH} leaderboard updateLeaderboardConfigurationAdminV1 \
    --body '{"daily": {"resetTime": "NEUsxFb8"}, "descending": true, "iconURL": "J17M7DJZ", "monthly": {"resetDate": 0, "resetTime": "MSxECbZb"}, "name": "ygyoarOR", "seasonPeriod": 29, "startTime": "eNHSb8Rh", "statCode": "3kgs9qqJ", "weekly": {"resetDay": 2, "resetTime": "nQsoBgiV"}}' \
    --leaderboardCode 'pP8Cm3yv' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateLeaderboardConfigurationAdminV1'
delete_file $TEMP_FILE

#- 8 DeleteLeaderboardConfigurationAdminV1
java -jar ${JAR_PATH} leaderboard deleteLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'ASUoxdxx' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteLeaderboardConfigurationAdminV1'
delete_file $TEMP_FILE

#- 9 GetAllTimeLeaderboardRankingAdminV1
java -jar ${JAR_PATH} leaderboard getAllTimeLeaderboardRankingAdminV1 \
    --leaderboardCode 'FqmAGTJ8' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetAllTimeLeaderboardRankingAdminV1'
delete_file $TEMP_FILE

#- 10 GetCurrentMonthLeaderboardRankingAdminV1
java -jar ${JAR_PATH} leaderboard getCurrentMonthLeaderboardRankingAdminV1 \
    --leaderboardCode 'IEdagEtp' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetCurrentMonthLeaderboardRankingAdminV1'
delete_file $TEMP_FILE

#- 11 GetCurrentSeasonLeaderboardRankingAdminV1
java -jar ${JAR_PATH} leaderboard getCurrentSeasonLeaderboardRankingAdminV1 \
    --leaderboardCode '4w29KOu9' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetCurrentSeasonLeaderboardRankingAdminV1'
delete_file $TEMP_FILE

#- 12 GetTodayLeaderboardRankingAdminV1
java -jar ${JAR_PATH} leaderboard getTodayLeaderboardRankingAdminV1 \
    --leaderboardCode 'c19R6XDq' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetTodayLeaderboardRankingAdminV1'
delete_file $TEMP_FILE

#- 13 GetUserRankingAdminV1
java -jar ${JAR_PATH} leaderboard getUserRankingAdminV1 \
    --leaderboardCode 'WHkkP8np' \
    --namespace "test" \
    --userId 'LEKMfjiX' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserRankingAdminV1'
delete_file $TEMP_FILE

#- 14 UpdateUserPointAdminV1
java -jar ${JAR_PATH} leaderboard updateUserPointAdminV1 \
    --body '{"inc": 0.9319948639373902, "latestValue": 0.2472405520592631}' \
    --leaderboardCode 'VZk3IaQY' \
    --namespace "test" \
    --userId 'EmqGodOE' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateUserPointAdminV1'
delete_file $TEMP_FILE

#- 15 DeleteUserRankingAdminV1
java -jar ${JAR_PATH} leaderboard deleteUserRankingAdminV1 \
    --leaderboardCode 'Gt9gPOj0' \
    --namespace "test" \
    --userId 'c6i0JkvI' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteUserRankingAdminV1'
delete_file $TEMP_FILE

#- 16 GetCurrentWeekLeaderboardRankingAdminV1
java -jar ${JAR_PATH} leaderboard getCurrentWeekLeaderboardRankingAdminV1 \
    --leaderboardCode 'as73ucYn' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetCurrentWeekLeaderboardRankingAdminV1'
delete_file $TEMP_FILE

#- 17 DeleteUserRankingsAdminV1
java -jar ${JAR_PATH} leaderboard deleteUserRankingsAdminV1 \
    --namespace "test" \
    --userId 'FAJ3DK5T' \
    --leaderboardCode '["4Eogg0Y3"]' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteUserRankingsAdminV1'
delete_file $TEMP_FILE

#- 18 GetUserLeaderboardRankingsAdminV1
java -jar ${JAR_PATH} leaderboard getUserLeaderboardRankingsAdminV1 \
    --namespace "test" \
    --userId '9UoYlpv5' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserLeaderboardRankingsAdminV1'
delete_file $TEMP_FILE

#- 19 GetLeaderboardConfigurationsPublicV1
java -jar ${JAR_PATH} leaderboard getLeaderboardConfigurationsPublicV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetLeaderboardConfigurationsPublicV1'
delete_file $TEMP_FILE

#- 20 CreateLeaderboardConfigurationPublicV1
java -jar ${JAR_PATH} leaderboard createLeaderboardConfigurationPublicV1 \
    --body '{"daily": {"resetTime": "bVAgtsDh"}, "descending": true, "iconURL": "UscbQDjb", "leaderboardCode": "TQuPMz2P", "monthly": {"resetDate": 91, "resetTime": "RlkyU89Z"}, "name": "POw6zPFJ", "seasonPeriod": 5, "startTime": "wmzBBSMN", "statCode": "coAAOjKN", "weekly": {"resetDay": 18, "resetTime": "fcYHm093"}}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateLeaderboardConfigurationPublicV1'
delete_file $TEMP_FILE

#- 21 GetAllTimeLeaderboardRankingPublicV1
java -jar ${JAR_PATH} leaderboard getAllTimeLeaderboardRankingPublicV1 \
    --leaderboardCode 'aYgBU1sq' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetAllTimeLeaderboardRankingPublicV1'
delete_file $TEMP_FILE

#- 22 GetArchivedLeaderboardRankingDataV1Handler
java -jar ${JAR_PATH} leaderboard getArchivedLeaderboardRankingDataV1Handler \
    --leaderboardCode 'jyK0XH45' \
    --namespace "test" \
    --leaderboardCodes 'PaRSOFQB' \
    >$TEMP_FILE 2>&1
update_status $? 'GetArchivedLeaderboardRankingDataV1Handler'
delete_file $TEMP_FILE

#- 23 GetCurrentMonthLeaderboardRankingPublicV1
java -jar ${JAR_PATH} leaderboard getCurrentMonthLeaderboardRankingPublicV1 \
    --leaderboardCode 'tu23REZ8' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetCurrentMonthLeaderboardRankingPublicV1'
delete_file $TEMP_FILE

#- 24 GetCurrentSeasonLeaderboardRankingPublicV1
java -jar ${JAR_PATH} leaderboard getCurrentSeasonLeaderboardRankingPublicV1 \
    --leaderboardCode 'hRVX7LGO' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetCurrentSeasonLeaderboardRankingPublicV1'
delete_file $TEMP_FILE

#- 25 GetTodayLeaderboardRankingPublicV1
java -jar ${JAR_PATH} leaderboard getTodayLeaderboardRankingPublicV1 \
    --leaderboardCode 'vDdYiQS9' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetTodayLeaderboardRankingPublicV1'
delete_file $TEMP_FILE

#- 26 GetUserRankingPublicV1
java -jar ${JAR_PATH} leaderboard getUserRankingPublicV1 \
    --leaderboardCode 'i7mV1C91' \
    --namespace "test" \
    --userId 'pjG9gpxL' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserRankingPublicV1'
delete_file $TEMP_FILE

#- 27 DeleteUserRankingPublicV1
java -jar ${JAR_PATH} leaderboard deleteUserRankingPublicV1 \
    --leaderboardCode '6ycTQdvl' \
    --namespace "test" \
    --userId 'n2LAuSQW' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteUserRankingPublicV1'
delete_file $TEMP_FILE

#- 28 GetCurrentWeekLeaderboardRankingPublicV1
java -jar ${JAR_PATH} leaderboard getCurrentWeekLeaderboardRankingPublicV1 \
    --leaderboardCode 'EXL6LFE1' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetCurrentWeekLeaderboardRankingPublicV1'
delete_file $TEMP_FILE

#- 29 GetHiddenUsersV2
java -jar ${JAR_PATH} leaderboard getHiddenUsersV2 \
    --leaderboardCode 'YHo9m126' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetHiddenUsersV2'
delete_file $TEMP_FILE

#- 30 GetUserVisibilityStatusV2
java -jar ${JAR_PATH} leaderboard getUserVisibilityStatusV2 \
    --leaderboardCode 'ZWc8hHtW' \
    --namespace "test" \
    --userId 'vbNYqgUq' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserVisibilityStatusV2'
delete_file $TEMP_FILE

#- 31 SetUserLeaderboardVisibilityStatusV2
java -jar ${JAR_PATH} leaderboard setUserLeaderboardVisibilityStatusV2 \
    --body '{"visibility": true}' \
    --leaderboardCode 'lArFPiHU' \
    --namespace "test" \
    --userId 'IvaCv8kU' \
    >$TEMP_FILE 2>&1
update_status $? 'SetUserLeaderboardVisibilityStatusV2'
delete_file $TEMP_FILE

#- 32 SetUserVisibilityStatusV2
java -jar ${JAR_PATH} leaderboard setUserVisibilityStatusV2 \
    --body '{"visibility": false}' \
    --namespace "test" \
    --userId 'BBpdsJLh' \
    >$TEMP_FILE 2>&1
update_status $? 'SetUserVisibilityStatusV2'
delete_file $TEMP_FILE

#- 33 GetLeaderboardConfigurationsPublicV2
java -jar ${JAR_PATH} leaderboard getLeaderboardConfigurationsPublicV2 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetLeaderboardConfigurationsPublicV2'
delete_file $TEMP_FILE

#- 34 GetAllTimeLeaderboardRankingPublicV2
java -jar ${JAR_PATH} leaderboard getAllTimeLeaderboardRankingPublicV2 \
    --leaderboardCode 'sVyExrkx' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetAllTimeLeaderboardRankingPublicV2'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT