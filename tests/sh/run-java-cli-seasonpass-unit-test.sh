#!/bin/bash

#Meta:
#- random seed: 256
#- template file: java-cli-unit-test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH='../../samples/cli'
JAR_PATH="${MODULE_PATH}/build/libs/cli.jar"
TEMP_FILE='file.tmp'

OPERATIONS_COUNT=38

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

#- 1 GetPass
java -jar ${JAR_PATH} seasonpass getPass \
    --code 'FtBxyZcD' \
    --namespace "test" \
    --seasonId 'XBpGlsQu' \
    >$TEMP_FILE 2>&1
update_status $? 'GetPass'
delete_file $TEMP_FILE

#- 2 DeletePass
java -jar ${JAR_PATH} seasonpass deletePass \
    --code 'Ju8vMf0I' \
    --namespace "test" \
    --seasonId 'sJkTrd8I' \
    >$TEMP_FILE 2>&1
update_status $? 'DeletePass'
delete_file $TEMP_FILE

#- 3 UpdatePass
java -jar ${JAR_PATH} seasonpass updatePass \
    --code 'DcV2zXnT' \
    --namespace "test" \
    --seasonId 'KjXY1bPq' \
    --body '{"displayOrder": 1, "autoEnroll": false, "passItemId": "iBxx9Cs1", "localizations": {"8EY84ekI": {"title": "tqRzHU1o", "description": "h570KQBV"}}, "images": [{"as": "aewc72kr", "caption": "Sha68n3Y", "height": 26, "width": 29, "imageUrl": "zp1C2KmI", "smallImageUrl": "QTuBdNEU"}]}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePass'
delete_file $TEMP_FILE

#- 4 QueryPasses
java -jar ${JAR_PATH} seasonpass queryPasses \
    --namespace "test" \
    --seasonId 'sxFb8CJ1' \
    >$TEMP_FILE 2>&1
update_status $? 'QueryPasses'
delete_file $TEMP_FILE

#- 5 CreatePass
java -jar ${JAR_PATH} seasonpass createPass \
    --namespace "test" \
    --seasonId '7M7DJZaM' \
    --body '{"code": "SxECbZby", "displayOrder": 13, "autoEnroll": true, "passItemId": "oarORoeN", "localizations": {"HSb8Rh3k": {"title": "gs9qqJbn", "description": "QsoBgiVp"}}, "images": [{"as": "P8Cm3yvA", "caption": "SUoxdxxF", "height": 32, "width": 24, "imageUrl": "AGTJ8IEd", "smallImageUrl": "agEtp4w2"}]}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreatePass'
delete_file $TEMP_FILE

#- 6 GetReward
java -jar ${JAR_PATH} seasonpass getReward \
    --code '9KOu9c19' \
    --namespace "test" \
    --seasonId 'R6XDqWHk' \
    >$TEMP_FILE 2>&1
update_status $? 'GetReward'
delete_file $TEMP_FILE

#- 7 DeleteReward
java -jar ${JAR_PATH} seasonpass deleteReward \
    --code 'kP8npLEK' \
    --namespace "test" \
    --seasonId 'MfjiX7jp' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteReward'
delete_file $TEMP_FILE

#- 8 UpdateReward
java -jar ${JAR_PATH} seasonpass updateReward \
    --code 'kVZk3IaQ' \
    --namespace "test" \
    --seasonId 'YEmqGodO' \
    --body '{"type": "CURRENCY", "itemId": "Gt9gPOj0", "currency": {"namespace": "c6i0JkvI", "currencyCode": "as73ucYn"}, "quantity": 63, "image": {"as": "AJ3DK5T4", "caption": "Eogg0Y39", "height": 93, "width": 29, "imageUrl": "Ylpv5bVA", "smallImageUrl": "gtsDhUTD"}, "nullFields": ["UscbQDjb"]}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateReward'
delete_file $TEMP_FILE

#- 9 QueryRewards
java -jar ${JAR_PATH} seasonpass queryRewards \
    --namespace "test" \
    --seasonId 'TQuPMz2P' \
    >$TEMP_FILE 2>&1
update_status $? 'QueryRewards'
delete_file $TEMP_FILE

#- 10 CreateReward
java -jar ${JAR_PATH} seasonpass createReward \
    --namespace "test" \
    --seasonId 'TRlkyU89' \
    --body '{"code": "ZPOw6zPF", "type": "ITEM", "itemId": "wmzBBSMN", "currency": {"namespace": "coAAOjKN", "currencyCode": "jfcYHm09"}, "quantity": 0, "image": {"as": "YgBU1sqj", "caption": "yK0XH45P", "height": 0, "width": 87, "imageUrl": "SOFQBtu2", "smallImageUrl": "3REZ8hRV"}}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateReward'
delete_file $TEMP_FILE

#- 11 UnpublishSeason
java -jar ${JAR_PATH} seasonpass unpublishSeason \
    --namespace "test" \
    --seasonId 'X7LGOvDd' \
    >$TEMP_FILE 2>&1
update_status $? 'UnpublishSeason'
delete_file $TEMP_FILE

#- 12 GetSeason
java -jar ${JAR_PATH} seasonpass getSeason \
    --namespace "test" \
    --seasonId 'YiQS9i7m' \
    >$TEMP_FILE 2>&1
update_status $? 'GetSeason'
delete_file $TEMP_FILE

#- 13 DeleteSeason
java -jar ${JAR_PATH} seasonpass deleteSeason \
    --namespace "test" \
    --seasonId 'V1C91pjG' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteSeason'
delete_file $TEMP_FILE

#- 14 UpdateSeason
java -jar ${JAR_PATH} seasonpass updateSeason \
    --namespace "test" \
    --seasonId '9gpxL6yc' \
    --body '{"name": "TQdvln2L", "start": "1984-06-12T00:00:00Z", "end": "1993-12-03T00:00:00Z", "defaultLanguage": "WEXL6LFE", "defaultRequiredExp": 67, "draftStoreId": "o9m126ZW", "tierItemId": "c8hHtWvb", "autoClaim": true, "excessStrategy": {"method": "NONE", "currency": "UqslArFP", "percentPerExp": 17}, "localizations": {"HUIvaCv8": {"title": "kU9dBBpd", "description": "sJLhsVyE"}}, "images": [{"as": "xrkxoot0", "caption": "B7WOferc", "height": 7, "width": 31, "imageUrl": "Mci37Ds7", "smallImageUrl": "YSfExaI3"}]}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateSeason'
delete_file $TEMP_FILE

#- 15 CloneSeason
java -jar ${JAR_PATH} seasonpass cloneSeason \
    --namespace "test" \
    --seasonId 'uzLteMbF' \
    --body '{"name": "Alt4hr7H", "start": "1977-11-23T00:00:00Z", "end": "1996-02-29T00:00:00Z"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CloneSeason'
delete_file $TEMP_FILE

#- 16 QuerySeasons
java -jar ${JAR_PATH} seasonpass querySeasons \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QuerySeasons'
delete_file $TEMP_FILE

#- 17 CreateSeason
java -jar ${JAR_PATH} seasonpass createSeason \
    --namespace "test" \
    --body '{"name": "BA5ltAOX", "start": "1977-03-30T00:00:00Z", "end": "1987-02-03T00:00:00Z", "defaultLanguage": "h1dTdoTF", "defaultRequiredExp": 31, "draftStoreId": "BIcuC1dQ", "tierItemId": "Y93OJnJ6", "autoClaim": false, "excessStrategy": {"method": "CURRENCY", "currency": "D8ldz7Hu", "percentPerExp": 53}, "localizations": {"D79kdWun": {"title": "vizU0q1p", "description": "HyhhERoG"}}, "images": [{"as": "gdrysMiz", "caption": "BGSRdP2l", "height": 59, "width": 79, "imageUrl": "SZ8Aq0Xi", "smallImageUrl": "PLQXSe07"}]}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateSeason'
delete_file $TEMP_FILE

#- 18 RetireSeason
java -jar ${JAR_PATH} seasonpass retireSeason \
    --namespace "test" \
    --seasonId 'ZddOGTMl' \
    >$TEMP_FILE 2>&1
update_status $? 'RetireSeason'
delete_file $TEMP_FILE

#- 19 PublishSeason
java -jar ${JAR_PATH} seasonpass publishSeason \
    --namespace "test" \
    --seasonId 'JjBwj9HJ' \
    >$TEMP_FILE 2>&1
update_status $? 'PublishSeason'
delete_file $TEMP_FILE

#- 20 GetCurrentSeason
java -jar ${JAR_PATH} seasonpass getCurrentSeason \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetCurrentSeason'
delete_file $TEMP_FILE

#- 21 UpdateTier
java -jar ${JAR_PATH} seasonpass updateTier \
    --id 'HQKseEdS' \
    --namespace "test" \
    --seasonId 'XRDSvgua' \
    --body '{"requiredExp": 40, "rewards": {"w1xT7eMw": ["Sl9MLH0N"]}}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateTier'
delete_file $TEMP_FILE

#- 22 DeleteTier
java -jar ${JAR_PATH} seasonpass deleteTier \
    --id 'nTJ2ulNz' \
    --namespace "test" \
    --seasonId 'BvwJaQa5' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteTier'
delete_file $TEMP_FILE

#- 23 QueryTiers
java -jar ${JAR_PATH} seasonpass queryTiers \
    --namespace "test" \
    --seasonId '47JllvA8' \
    >$TEMP_FILE 2>&1
update_status $? 'QueryTiers'
delete_file $TEMP_FILE

#- 24 CreateTier
java -jar ${JAR_PATH} seasonpass createTier \
    --namespace "test" \
    --seasonId 'RWSpabUt' \
    --body '{"index": 47, "quantity": 21, "tier": {"requiredExp": 85, "rewards": {"xyWhfqoW": ["fJw2o8oW"]}}}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateTier'
delete_file $TEMP_FILE

#- 25 ExistsAnyPassByPassCodes
java -jar ${JAR_PATH} seasonpass existsAnyPassByPassCodes \
    --namespace "test" \
    --userId 'UqvPCZ2H' \
    >$TEMP_FILE 2>&1
update_status $? 'ExistsAnyPassByPassCodes'
delete_file $TEMP_FILE

#- 26 GrantUserTier
java -jar ${JAR_PATH} seasonpass grantUserTier \
    --namespace "test" \
    --userId 'zT7NXmWD' \
    --body '{"count": 23}' \
    >$TEMP_FILE 2>&1
update_status $? 'GrantUserTier'
delete_file $TEMP_FILE

#- 27 GetUserSeason
java -jar ${JAR_PATH} seasonpass getUserSeason \
    --namespace "test" \
    --seasonId 'XsuNIdQJ' \
    --userId 'R5lsNOlv' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserSeason'
delete_file $TEMP_FILE

#- 28 CheckSeasonPurchasable
java -jar ${JAR_PATH} seasonpass checkSeasonPurchasable \
    --namespace "test" \
    --userId 'kfwaSbns' \
    --body '{"passItemId": "uLCgToxu", "tierItemId": "VTekJgvg", "tierItemCount": 15}' \
    >$TEMP_FILE 2>&1
update_status $? 'CheckSeasonPurchasable'
delete_file $TEMP_FILE

#- 29 GetCurrentUserSeasonProgression
java -jar ${JAR_PATH} seasonpass getCurrentUserSeasonProgression \
    --namespace "test" \
    --userId '5HIpH0Dv' \
    >$TEMP_FILE 2>&1
update_status $? 'GetCurrentUserSeasonProgression'
delete_file $TEMP_FILE

#- 30 ResetUserSeason
java -jar ${JAR_PATH} seasonpass resetUserSeason \
    --namespace "test" \
    --userId 'iplEk4vj' \
    >$TEMP_FILE 2>&1
update_status $? 'ResetUserSeason'
delete_file $TEMP_FILE

#- 31 GrantUserPass
java -jar ${JAR_PATH} seasonpass grantUserPass \
    --namespace "test" \
    --userId '3LDp4yqD' \
    --body '{"passItemId": "t8QUZDpx", "passCode": "lHasinGc"}' \
    >$TEMP_FILE 2>&1
update_status $? 'GrantUserPass'
delete_file $TEMP_FILE

#- 32 GetUserParticipatedSeasons
java -jar ${JAR_PATH} seasonpass getUserParticipatedSeasons \
    --namespace "test" \
    --userId 'jrkmRMtt' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserParticipatedSeasons'
delete_file $TEMP_FILE

#- 33 GrantUserExp
java -jar ${JAR_PATH} seasonpass grantUserExp \
    --namespace "test" \
    --userId 'gjDSaIVB' \
    --body '{"exp": 25}' \
    >$TEMP_FILE 2>&1
update_status $? 'GrantUserExp'
delete_file $TEMP_FILE

#- 34 PublicGetCurrentSeason
java -jar ${JAR_PATH} seasonpass publicGetCurrentSeason \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetCurrentSeason'
delete_file $TEMP_FILE

#- 35 PublicClaimUserReward
java -jar ${JAR_PATH} seasonpass publicClaimUserReward \
    --namespace "test" \
    --userId 'ft3Udg7p' \
    --body '{"passCode": "9PGmY2H5", "tierIndex": 20, "rewardCode": "X4MsisSX"}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicClaimUserReward'
delete_file $TEMP_FILE

#- 36 PublicGetCurrentUserSeason
java -jar ${JAR_PATH} seasonpass publicGetCurrentUserSeason \
    --namespace "test" \
    --userId '28nARxWR' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetCurrentUserSeason'
delete_file $TEMP_FILE

#- 37 PublicBulkClaimUserRewards
java -jar ${JAR_PATH} seasonpass publicBulkClaimUserRewards \
    --namespace "test" \
    --userId 'pv5ou5xt' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicBulkClaimUserRewards'
delete_file $TEMP_FILE

#- 38 PublicGetUserSeason
java -jar ${JAR_PATH} seasonpass publicGetUserSeason \
    --namespace "test" \
    --seasonId 'vd28OUfC' \
    --userId 't8UJC5fl' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserSeason'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT