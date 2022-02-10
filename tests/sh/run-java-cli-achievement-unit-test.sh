#!/bin/bash

#Meta:
#- random seed: 256
#- template file: java-cli-unit-test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH='../../samples/cli'
JAR_PATH="${MODULE_PATH}/build/libs/cli.jar"
TEMP_FILE='file.tmp'

OPERATIONS_COUNT=14

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

#- 1 AdminListAchievements
java -jar ${JAR_PATH} achievement adminListAchievements \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminListAchievements'
delete_file $TEMP_FILE

#- 2 AdminCreateNewAchievement
java -jar ${JAR_PATH} achievement adminCreateNewAchievement \
    --body '{"achievementCode": "FtBxyZcD", "defaultLanguage": "XBpGlsQu", "description": {"Ju8vMf0I": "sJkTrd8I"}, "goalValue": 0.46848625686278056, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "XnTKjXY1", "url": "bPqamiBx"}], "name": {"x9Cs18EY": "84ekItqR"}, "statCode": "zHU1oh57", "tags": ["0KQBVaew"], "unlockedIcons": [{"slug": "c72krSha", "url": "68n3Ynoz"}]}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateNewAchievement'
delete_file $TEMP_FILE

#- 3 ExportAchievements
java -jar ${JAR_PATH} achievement exportAchievements \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ExportAchievements'
delete_file $TEMP_FILE

#- 4 ImportAchievements
java -jar ${JAR_PATH} achievement importAchievements \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ImportAchievements'
delete_file $TEMP_FILE

#- 5 AdminGetAchievement
java -jar ${JAR_PATH} achievement adminGetAchievement \
    --achievementCode 'p1C2KmIQ' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetAchievement'
delete_file $TEMP_FILE

#- 6 AdminUpdateAchievement
java -jar ${JAR_PATH} achievement adminUpdateAchievement \
    --body '{"defaultLanguage": "TuBdNEUs", "description": {"xFb8CJ17": "M7DJZaMS"}, "goalValue": 0.3723261689885863, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "Zbygyoar", "url": "ORoeNHSb"}], "name": {"8Rh3kgs9": "qqJbnQso"}, "statCode": "BgiVpP8C", "tags": ["m3yvASUo"], "unlockedIcons": [{"slug": "xdxxFqmA", "url": "GTJ8IEda"}]}' \
    --achievementCode 'gEtp4w29' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateAchievement'
delete_file $TEMP_FILE

#- 7 AdminDeleteAchievement
java -jar ${JAR_PATH} achievement adminDeleteAchievement \
    --achievementCode 'KOu9c19R' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteAchievement'
delete_file $TEMP_FILE

#- 8 AdminUpdateAchievementListOrder
java -jar ${JAR_PATH} achievement adminUpdateAchievementListOrder \
    --body '{"targetOrder": 98}' \
    --achievementCode 'DqWHkkP8' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateAchievementListOrder'
delete_file $TEMP_FILE

#- 9 AdminListUserAchievements
java -jar ${JAR_PATH} achievement adminListUserAchievements \
    --namespace "test" \
    --userId 'npLEKMfj' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminListUserAchievements'
delete_file $TEMP_FILE

#- 10 AdminUnlockAchievement
java -jar ${JAR_PATH} achievement adminUnlockAchievement \
    --achievementCode 'iX7jpkVZ' \
    --namespace "test" \
    --userId 'k3IaQYEm' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUnlockAchievement'
delete_file $TEMP_FILE

#- 11 PublicListAchievements
java -jar ${JAR_PATH} achievement publicListAchievements \
    --namespace "test" \
    --language 'qGodOEGt' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicListAchievements'
delete_file $TEMP_FILE

#- 12 PublicGetAchievement
java -jar ${JAR_PATH} achievement publicGetAchievement \
    --achievementCode '9gPOj0c6' \
    --namespace "test" \
    --language 'i0JkvIas' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetAchievement'
delete_file $TEMP_FILE

#- 13 PublicListUserAchievements
java -jar ${JAR_PATH} achievement publicListUserAchievements \
    --namespace "test" \
    --userId '73ucYnFA' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicListUserAchievements'
delete_file $TEMP_FILE

#- 14 PublicUnlockAchievement
java -jar ${JAR_PATH} achievement publicUnlockAchievement \
    --achievementCode 'J3DK5T4E' \
    --namespace "test" \
    --userId 'ogg0Y39U' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUnlockAchievement'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT