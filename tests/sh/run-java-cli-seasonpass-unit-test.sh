#!/bin/bash

#Meta:
#- random seed: 256
#- template file: java-cli-unit-test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH="${MODULE_PATH:-../../samples/cli}"
JAR_PATH="${MODULE_PATH}/build/libs/cli.jar"
TEMP_FILE='file.tmp'

OPERATIONS_COUNT=39

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

#- 1 QuerySeasons
java -jar ${JAR_PATH} seasonpass querySeasons \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'QuerySeasons'
delete_file $TEMP_FILE

#- 2 CreateSeason
java -jar ${JAR_PATH} seasonpass createSeason \
    --namespace "test" \
    --body '{"autoClaim": true, "defaultLanguage": "tBxyZcDX", "defaultRequiredExp": 55, "draftStoreId": "pGlsQuJu", "end": "1981-11-03T00:00:00Z", "excessStrategy": {"currency": "f0IsJkTr", "method": "NONE", "percentPerExp": 68}, "images": [{"as": "DcV2zXnT", "caption": "KjXY1bPq", "height": 1, "imageUrl": "miBxx9Cs", "smallImageUrl": "18EY84ek", "width": 69}], "localizations": {"tqRzHU1o": {"description": "h570KQBV", "title": "aewc72kr"}}, "name": "Sha68n3Y", "start": "1977-04-27T00:00:00Z", "tierItemId": "zp1C2KmI"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateSeason'
delete_file $TEMP_FILE

#- 3 GetCurrentSeason
java -jar ${JAR_PATH} seasonpass getCurrentSeason \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetCurrentSeason'
delete_file $TEMP_FILE

#- 4 GetSeason
java -jar ${JAR_PATH} seasonpass getSeason \
    --namespace "test" \
    --seasonId 'QTuBdNEU' \
    >$TEMP_FILE 2>&1
update_status $? 'GetSeason'
delete_file $TEMP_FILE

#- 5 DeleteSeason
java -jar ${JAR_PATH} seasonpass deleteSeason \
    --namespace "test" \
    --seasonId 'sxFb8CJ1' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteSeason'
delete_file $TEMP_FILE

#- 6 UpdateSeason
java -jar ${JAR_PATH} seasonpass updateSeason \
    --namespace "test" \
    --seasonId '7M7DJZaM' \
    --body '{"autoClaim": true, "defaultLanguage": "ECbZbygy", "defaultRequiredExp": 29, "draftStoreId": "arORoeNH", "end": "1993-01-05T00:00:00Z", "excessStrategy": {"currency": "8Rh3kgs9", "method": "CURRENCY", "percentPerExp": 33}, "images": [{"as": "JbnQsoBg", "caption": "iVpP8Cm3", "height": 49, "imageUrl": "vASUoxdx", "smallImageUrl": "xFqmAGTJ", "width": 68}], "localizations": {"EdagEtp4": {"description": "w29KOu9c", "title": "19R6XDqW"}}, "name": "HkkP8npL", "start": "1986-10-17T00:00:00Z", "tierItemId": "MfjiX7jp"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateSeason'
delete_file $TEMP_FILE

#- 7 CloneSeason
java -jar ${JAR_PATH} seasonpass cloneSeason \
    --namespace "test" \
    --seasonId 'kVZk3IaQ' \
    --body '{"end": "1996-08-25T00:00:00Z", "name": "mqGodOEG", "start": "1980-02-22T00:00:00Z"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CloneSeason'
delete_file $TEMP_FILE

#- 8 QueryPasses
java -jar ${JAR_PATH} seasonpass queryPasses \
    --namespace "test" \
    --seasonId 'POj0c6i0' \
    >$TEMP_FILE 2>&1
update_status $? 'QueryPasses'
delete_file $TEMP_FILE

#- 9 CreatePass
java -jar ${JAR_PATH} seasonpass createPass \
    --namespace "test" \
    --seasonId 'JkvIas73' \
    --body '{"autoEnroll": true, "code": "cYnFAJ3D", "displayOrder": 72, "images": [{"as": "5T4Eogg0", "caption": "Y39UoYlp", "height": 43, "imageUrl": "5bVAgtsD", "smallImageUrl": "hUTDUscb", "width": 85}], "localizations": {"DjbTQuPM": {"description": "z2PTRlky", "title": "U89ZPOw6"}}, "passItemId": "zPFJ42cw"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreatePass'
delete_file $TEMP_FILE

#- 10 GetPass
java -jar ${JAR_PATH} seasonpass getPass \
    --code 'mzBBSMNc' \
    --namespace "test" \
    --seasonId 'oAAOjKNj' \
    >$TEMP_FILE 2>&1
update_status $? 'GetPass'
delete_file $TEMP_FILE

#- 11 DeletePass
java -jar ${JAR_PATH} seasonpass deletePass \
    --code 'fcYHm093' \
    --namespace "test" \
    --seasonId 'aYgBU1sq' \
    >$TEMP_FILE 2>&1
update_status $? 'DeletePass'
delete_file $TEMP_FILE

#- 12 UpdatePass
java -jar ${JAR_PATH} seasonpass updatePass \
    --code 'jyK0XH45' \
    --namespace "test" \
    --seasonId 'PaRSOFQB' \
    --body '{"autoEnroll": true, "displayOrder": 41, "images": [{"as": "23REZ8hR", "caption": "VX7LGOvD", "height": 6, "imageUrl": "YiQS9i7m", "smallImageUrl": "V1C91pjG", "width": 13}], "localizations": {"pxL6ycTQ": {"description": "dvln2LAu", "title": "SQWEXL6L"}}, "passItemId": "FE1YHo9m"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePass'
delete_file $TEMP_FILE

#- 13 PublishSeason
java -jar ${JAR_PATH} seasonpass publishSeason \
    --namespace "test" \
    --seasonId '126ZWc8h' \
    >$TEMP_FILE 2>&1
update_status $? 'PublishSeason'
delete_file $TEMP_FILE

#- 14 RetireSeason
java -jar ${JAR_PATH} seasonpass retireSeason \
    --namespace "test" \
    --seasonId 'HtWvbNYq' \
    >$TEMP_FILE 2>&1
update_status $? 'RetireSeason'
delete_file $TEMP_FILE

#- 15 QueryRewards
java -jar ${JAR_PATH} seasonpass queryRewards \
    --namespace "test" \
    --seasonId 'gUqslArF' \
    >$TEMP_FILE 2>&1
update_status $? 'QueryRewards'
delete_file $TEMP_FILE

#- 16 CreateReward
java -jar ${JAR_PATH} seasonpass createReward \
    --namespace "test" \
    --seasonId 'PiHUIvaC' \
    --body '{"code": "v8kU9dBB", "currency": {"currencyCode": "pdsJLhsV", "namespace": "yExrkxoo"}, "image": {"as": "t0B7WOfe", "caption": "rcZdpMci", "height": 58, "imageUrl": "s7YSfExa", "smallImageUrl": "I3uzLteM", "width": 3}, "itemId": "FAlt4hr7", "quantity": 67, "type": "ITEM"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateReward'
delete_file $TEMP_FILE

#- 17 GetReward
java -jar ${JAR_PATH} seasonpass getReward \
    --code 'OYiBA5lt' \
    --namespace "test" \
    --seasonId 'AOXmlG6e' \
    >$TEMP_FILE 2>&1
update_status $? 'GetReward'
delete_file $TEMP_FILE

#- 18 DeleteReward
java -jar ${JAR_PATH} seasonpass deleteReward \
    --code 'h1dTdoTF' \
    --namespace "test" \
    --seasonId 'pBIcuC1d' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteReward'
delete_file $TEMP_FILE

#- 19 UpdateReward
java -jar ${JAR_PATH} seasonpass updateReward \
    --code 'QY93OJnJ' \
    --namespace "test" \
    --seasonId '6Te9vD8l' \
    --body '{"currency": {"currencyCode": "dz7Hu8AD", "namespace": "79kdWunv"}, "image": {"as": "izU0q1pH", "caption": "yhhERoGg", "height": 7, "imageUrl": "rysMizBG", "smallImageUrl": "SRdP2l7D", "width": 79}, "itemId": "SZ8Aq0Xi", "nullFields": ["PLQXSe07"], "quantity": 7, "type": "ITEM"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateReward'
delete_file $TEMP_FILE

#- 20 QueryTiers
java -jar ${JAR_PATH} seasonpass queryTiers \
    --namespace "test" \
    --seasonId 'OGTMlJjB' \
    >$TEMP_FILE 2>&1
update_status $? 'QueryTiers'
delete_file $TEMP_FILE

#- 21 CreateTier
java -jar ${JAR_PATH} seasonpass createTier \
    --namespace "test" \
    --seasonId 'wj9HJHQK' \
    --body '{"index": 36, "quantity": 8, "tier": {"requiredExp": 60, "rewards": {"dSXRDSvg": ["uauw1xT7"]}}}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateTier'
delete_file $TEMP_FILE

#- 22 UpdateTier
java -jar ${JAR_PATH} seasonpass updateTier \
    --id 'eMwSl9ML' \
    --namespace "test" \
    --seasonId 'H0NnTJ2u' \
    --body '{"requiredExp": 22, "rewards": {"NzBvwJaQ": ["a547Jllv"]}}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateTier'
delete_file $TEMP_FILE

#- 23 DeleteTier
java -jar ${JAR_PATH} seasonpass deleteTier \
    --id 'A8RWSpab' \
    --namespace "test" \
    --seasonId 'Ut7xk6Qx' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteTier'
delete_file $TEMP_FILE

#- 24 ReorderTier
java -jar ${JAR_PATH} seasonpass reorderTier \
    --id 'yWhfqoWf' \
    --namespace "test" \
    --seasonId 'Jw2o8oWU' \
    --body '{"newIndex": 32}' \
    >$TEMP_FILE 2>&1
update_status $? 'ReorderTier'
delete_file $TEMP_FILE

#- 25 UnpublishSeason
java -jar ${JAR_PATH} seasonpass unpublishSeason \
    --namespace "test" \
    --seasonId 'vPCZ2HzT' \
    >$TEMP_FILE 2>&1
update_status $? 'UnpublishSeason'
delete_file $TEMP_FILE

#- 26 GetUserParticipatedSeasons
java -jar ${JAR_PATH} seasonpass getUserParticipatedSeasons \
    --namespace "test" \
    --userId '7NXmWDlX' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserParticipatedSeasons'
delete_file $TEMP_FILE

#- 27 GrantUserExp
java -jar ${JAR_PATH} seasonpass grantUserExp \
    --namespace "test" \
    --userId 'suNIdQJR' \
    --body '{"exp": 23}' \
    >$TEMP_FILE 2>&1
update_status $? 'GrantUserExp'
delete_file $TEMP_FILE

#- 28 GrantUserPass
java -jar ${JAR_PATH} seasonpass grantUserPass \
    --namespace "test" \
    --userId 'sNOlvkfw' \
    --body '{"passCode": "aSbnsuLC", "passItemId": "gToxuVTe"}' \
    >$TEMP_FILE 2>&1
update_status $? 'GrantUserPass'
delete_file $TEMP_FILE

#- 29 ExistsAnyPassByPassCodes
java -jar ${JAR_PATH} seasonpass existsAnyPassByPassCodes \
    --namespace "test" \
    --userId 'kJgvg6h5' \
    >$TEMP_FILE 2>&1
update_status $? 'ExistsAnyPassByPassCodes'
delete_file $TEMP_FILE

#- 30 GetCurrentUserSeasonProgression
java -jar ${JAR_PATH} seasonpass getCurrentUserSeasonProgression \
    --namespace "test" \
    --userId 'HIpH0Dvi' \
    >$TEMP_FILE 2>&1
update_status $? 'GetCurrentUserSeasonProgression'
delete_file $TEMP_FILE

#- 31 CheckSeasonPurchasable
java -jar ${JAR_PATH} seasonpass checkSeasonPurchasable \
    --namespace "test" \
    --userId 'plEk4vj3' \
    --body '{"passItemId": "LDp4yqDt", "tierItemCount": 85, "tierItemId": "UZDpxlHa"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CheckSeasonPurchasable'
delete_file $TEMP_FILE

#- 32 ResetUserSeason
java -jar ${JAR_PATH} seasonpass resetUserSeason \
    --namespace "test" \
    --userId 'sinGcjrk' \
    >$TEMP_FILE 2>&1
update_status $? 'ResetUserSeason'
delete_file $TEMP_FILE

#- 33 GrantUserTier
java -jar ${JAR_PATH} seasonpass grantUserTier \
    --namespace "test" \
    --userId 'mRMttgjD' \
    --body '{"count": 88}' \
    >$TEMP_FILE 2>&1
update_status $? 'GrantUserTier'
delete_file $TEMP_FILE

#- 34 GetUserSeason
java -jar ${JAR_PATH} seasonpass getUserSeason \
    --namespace "test" \
    --seasonId 'aIVBmft3' \
    --userId 'Udg7p9PG' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserSeason'
delete_file $TEMP_FILE

#- 35 PublicGetCurrentSeason
java -jar ${JAR_PATH} seasonpass publicGetCurrentSeason \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetCurrentSeason'
delete_file $TEMP_FILE

#- 36 PublicGetCurrentUserSeason
java -jar ${JAR_PATH} seasonpass publicGetCurrentUserSeason \
    --namespace "test" \
    --userId 'mY2H5kX4' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetCurrentUserSeason'
delete_file $TEMP_FILE

#- 37 PublicClaimUserReward
java -jar ${JAR_PATH} seasonpass publicClaimUserReward \
    --namespace "test" \
    --userId 'MsisSX28' \
    --body '{"passCode": "nARxWRpv", "rewardCode": "5ou5xtvd", "tierIndex": 80}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicClaimUserReward'
delete_file $TEMP_FILE

#- 38 PublicBulkClaimUserRewards
java -jar ${JAR_PATH} seasonpass publicBulkClaimUserRewards \
    --namespace "test" \
    --userId 'UfCt8UJC' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicBulkClaimUserRewards'
delete_file $TEMP_FILE

#- 39 PublicGetUserSeason
java -jar ${JAR_PATH} seasonpass publicGetUserSeason \
    --namespace "test" \
    --seasonId '5flNyj6H' \
    --userId 'sTtX8P3l' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserSeason'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT