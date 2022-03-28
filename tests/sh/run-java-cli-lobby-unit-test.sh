#!/bin/bash

#Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
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

OPERATIONS_COUNT=90

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

#- 1 GetUserFriendsUpdated
java -jar ${JAR_PATH} lobby getUserFriendsUpdated \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserFriendsUpdated'
delete_file $TEMP_FILE

#- 2 GetUserIncomingFriends
java -jar ${JAR_PATH} lobby getUserIncomingFriends \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserIncomingFriends'
delete_file $TEMP_FILE

#- 3 GetUserOutgoingFriends
java -jar ${JAR_PATH} lobby getUserOutgoingFriends \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserOutgoingFriends'
delete_file $TEMP_FILE

#- 4 UserRequestFriend
java -jar ${JAR_PATH} lobby userRequestFriend \
    --body '{"friendId": "FtBxyZcD"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UserRequestFriend'
delete_file $TEMP_FILE

#- 5 UserAcceptFriendRequest
java -jar ${JAR_PATH} lobby userAcceptFriendRequest \
    --body '{"friendId": "XBpGlsQu"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UserAcceptFriendRequest'
delete_file $TEMP_FILE

#- 6 UserCancelFriendRequest
java -jar ${JAR_PATH} lobby userCancelFriendRequest \
    --body '{"friendId": "Ju8vMf0I"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UserCancelFriendRequest'
delete_file $TEMP_FILE

#- 7 UserRejectFriendRequest
java -jar ${JAR_PATH} lobby userRejectFriendRequest \
    --body '{"friendId": "sJkTrd8I"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UserRejectFriendRequest'
delete_file $TEMP_FILE

#- 8 UserGetFriendshipStatus
java -jar ${JAR_PATH} lobby userGetFriendshipStatus \
    --friendId 'DcV2zXnT' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UserGetFriendshipStatus'
delete_file $TEMP_FILE

#- 9 UserUnfriendRequest
java -jar ${JAR_PATH} lobby userUnfriendRequest \
    --body '{"friendId": "KjXY1bPq"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UserUnfriendRequest'
delete_file $TEMP_FILE

#- 10 AddFriendsWithoutConfirmation
java -jar ${JAR_PATH} lobby addFriendsWithoutConfirmation \
    --body '{"friendIds": ["amiBxx9C"]}' \
    --namespace "test" \
    --userId 's18EY84e' \
    >$TEMP_FILE 2>&1
update_status $? 'AddFriendsWithoutConfirmation'
delete_file $TEMP_FILE

#- 11 PersonalChatHistory
java -jar ${JAR_PATH} lobby personalChatHistory \
    --friendId 'kItqRzHU' \
    --namespace "test" \
    --userId '1oh570KQ' \
    >$TEMP_FILE 2>&1
update_status $? 'PersonalChatHistory'
delete_file $TEMP_FILE

#- 12 AdminChatHistory
java -jar ${JAR_PATH} lobby adminChatHistory \
    --friendId 'BVaewc72' \
    --namespace "test" \
    --userId 'krSha68n' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminChatHistory'
delete_file $TEMP_FILE

#- 13 AdminGetAllConfigV1
java -jar ${JAR_PATH} lobby adminGetAllConfigV1 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetAllConfigV1'
delete_file $TEMP_FILE

#- 14 AdminGetConfigV1
java -jar ${JAR_PATH} lobby adminGetConfigV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetConfigV1'
delete_file $TEMP_FILE

#- 15 AdminUpdateConfigV1
java -jar ${JAR_PATH} lobby adminUpdateConfigV1 \
    --body '{"allowInviteNonConnectedUser": false, "autoKickOnDisconnect": false, "autoKickOnDisconnectDelay": 51, "cancelTicketOnDisconnect": false, "chatRateLimitBurst": 56, "chatRateLimitDuration": 72, "concurrentUsersLimit": 24, "disablePartyInvitationToken": true, "enableChat": true, "entitlementCheck": false, "entitlementItemID": "NEUsxFb8", "generalRateLimitBurst": 56, "generalRateLimitDuration": 70, "keepPresenceActivityOnDisconnect": true, "maxPartyMember": 70, "profanityFilter": false, "readyConsentTimeout": 77}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateConfigV1'
delete_file $TEMP_FILE

#- 16 AdminExportConfigV1
java -jar ${JAR_PATH} lobby adminExportConfigV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminExportConfigV1'
delete_file $TEMP_FILE

#- 17 AdminImportConfigV1
java -jar ${JAR_PATH} lobby adminImportConfigV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminImportConfigV1'
delete_file $TEMP_FILE

#- 18 GetListOfFriends
java -jar ${JAR_PATH} lobby getListOfFriends \
    --namespace "test" \
    --userId 'SxECbZby' \
    >$TEMP_FILE 2>&1
update_status $? 'GetListOfFriends'
delete_file $TEMP_FILE

#- 19 SendMultipleUsersFreeformNotificationV1Admin
java -jar ${JAR_PATH} lobby sendMultipleUsersFreeformNotificationV1Admin \
    --body '{"message": "gyoarORo", "topicName": "eNHSb8Rh", "userIds": ["3kgs9qqJ"]}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SendMultipleUsersFreeformNotificationV1Admin'
delete_file $TEMP_FILE

#- 20 SendUsersFreeformNotificationV1Admin
java -jar ${JAR_PATH} lobby sendUsersFreeformNotificationV1Admin \
    --body '{"message": "bnQsoBgi", "topicName": "VpP8Cm3y"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SendUsersFreeformNotificationV1Admin'
delete_file $TEMP_FILE

#- 21 SendPartyFreeformNotificationV1Admin
java -jar ${JAR_PATH} lobby sendPartyFreeformNotificationV1Admin \
    --body '{"message": "vASUoxdx", "topicName": "xFqmAGTJ"}' \
    --namespace "test" \
    --partyId '8IEdagEt' \
    >$TEMP_FILE 2>&1
update_status $? 'SendPartyFreeformNotificationV1Admin'
delete_file $TEMP_FILE

#- 22 SendPartyTemplatedNotificationV1Admin
java -jar ${JAR_PATH} lobby sendPartyTemplatedNotificationV1Admin \
    --body '{"templateContext": {"p4w29KOu": "9c19R6XD"}, "templateLanguage": "qWHkkP8n", "templateSlug": "pLEKMfji", "topicName": "X7jpkVZk"}' \
    --namespace "test" \
    --partyId '3IaQYEmq' \
    >$TEMP_FILE 2>&1
update_status $? 'SendPartyTemplatedNotificationV1Admin'
delete_file $TEMP_FILE

#- 23 GetAllNotificationTemplatesV1Admin
java -jar ${JAR_PATH} lobby getAllNotificationTemplatesV1Admin \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetAllNotificationTemplatesV1Admin'
delete_file $TEMP_FILE

#- 24 CreateNotificationTemplateV1Admin
java -jar ${JAR_PATH} lobby createNotificationTemplateV1Admin \
    --body '{"templateContent": "GodOEGt9", "templateLanguage": "gPOj0c6i", "templateSlug": "0JkvIas7"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateNotificationTemplateV1Admin'
delete_file $TEMP_FILE

#- 25 SendUsersTemplatedNotificationV1Admin
java -jar ${JAR_PATH} lobby sendUsersTemplatedNotificationV1Admin \
    --body '{"templateContext": {"3ucYnFAJ": "3DK5T4Eo"}, "templateLanguage": "gg0Y39Uo", "templateSlug": "Ylpv5bVA", "topicName": "gtsDhUTD"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SendUsersTemplatedNotificationV1Admin'
delete_file $TEMP_FILE

#- 26 GetTemplateSlugLocalizationsTemplateV1Admin
java -jar ${JAR_PATH} lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "test" \
    --templateSlug 'UscbQDjb' \
    >$TEMP_FILE 2>&1
update_status $? 'GetTemplateSlugLocalizationsTemplateV1Admin'
delete_file $TEMP_FILE

#- 27 DeleteNotificationTemplateSlugV1Admin
java -jar ${JAR_PATH} lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "test" \
    --templateSlug 'TQuPMz2P' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteNotificationTemplateSlugV1Admin'
delete_file $TEMP_FILE

#- 28 GetSingleTemplateLocalizationV1Admin
java -jar ${JAR_PATH} lobby getSingleTemplateLocalizationV1Admin \
    --namespace "test" \
    --templateLanguage 'TRlkyU89' \
    --templateSlug 'ZPOw6zPF' \
    >$TEMP_FILE 2>&1
update_status $? 'GetSingleTemplateLocalizationV1Admin'
delete_file $TEMP_FILE

#- 29 UpdateTemplateLocalizationV1Admin
java -jar ${JAR_PATH} lobby updateTemplateLocalizationV1Admin \
    --body '{"templateContent": "J42cwmzB"}' \
    --namespace "test" \
    --templateLanguage 'BSMNcoAA' \
    --templateSlug 'OjKNjfcY' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateTemplateLocalizationV1Admin'
delete_file $TEMP_FILE

#- 30 DeleteTemplateLocalizationV1Admin
java -jar ${JAR_PATH} lobby deleteTemplateLocalizationV1Admin \
    --namespace "test" \
    --templateLanguage 'Hm093aYg' \
    --templateSlug 'BU1sqjyK' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteTemplateLocalizationV1Admin'
delete_file $TEMP_FILE

#- 31 PublishTemplateLocalizationV1Admin
java -jar ${JAR_PATH} lobby publishTemplateLocalizationV1Admin \
    --namespace "test" \
    --templateLanguage '0XH45PaR' \
    --templateSlug 'SOFQBtu2' \
    >$TEMP_FILE 2>&1
update_status $? 'PublishTemplateLocalizationV1Admin'
delete_file $TEMP_FILE

#- 32 GetAllNotificationTopicsV1Admin
java -jar ${JAR_PATH} lobby getAllNotificationTopicsV1Admin \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetAllNotificationTopicsV1Admin'
delete_file $TEMP_FILE

#- 33 CreateNotificationTopicV1Admin
java -jar ${JAR_PATH} lobby createNotificationTopicV1Admin \
    --body '{"description": "3REZ8hRV", "topicName": "X7LGOvDd"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateNotificationTopicV1Admin'
delete_file $TEMP_FILE

#- 34 GetNotificationTopicV1Admin
java -jar ${JAR_PATH} lobby getNotificationTopicV1Admin \
    --namespace "test" \
    --topicName 'YiQS9i7m' \
    >$TEMP_FILE 2>&1
update_status $? 'GetNotificationTopicV1Admin'
delete_file $TEMP_FILE

#- 35 UpdateNotificationTopicV1Admin
java -jar ${JAR_PATH} lobby updateNotificationTopicV1Admin \
    --body '{"description": "V1C91pjG"}' \
    --namespace "test" \
    --topicName '9gpxL6yc' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateNotificationTopicV1Admin'
delete_file $TEMP_FILE

#- 36 DeleteNotificationTopicV1Admin
java -jar ${JAR_PATH} lobby deleteNotificationTopicV1Admin \
    --namespace "test" \
    --topicName 'TQdvln2L' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteNotificationTopicV1Admin'
delete_file $TEMP_FILE

#- 37 SendSpecificUserFreeformNotificationV1Admin
java -jar ${JAR_PATH} lobby sendSpecificUserFreeformNotificationV1Admin \
    --body '{"message": "AuSQWEXL", "topicName": "6LFE1YHo"}' \
    --namespace "test" \
    --userId '9m126ZWc' \
    >$TEMP_FILE 2>&1
update_status $? 'SendSpecificUserFreeformNotificationV1Admin'
delete_file $TEMP_FILE

#- 38 SendSpecificUserTemplatedNotificationV1Admin
java -jar ${JAR_PATH} lobby sendSpecificUserTemplatedNotificationV1Admin \
    --body '{"templateContext": {"8hHtWvbN": "YqgUqslA"}, "templateLanguage": "rFPiHUIv", "templateSlug": "aCv8kU9d", "topicName": "BBpdsJLh"}' \
    --namespace "test" \
    --userId 'sVyExrkx' \
    >$TEMP_FILE 2>&1
update_status $? 'SendSpecificUserTemplatedNotificationV1Admin'
delete_file $TEMP_FILE

#- 39 AdminGetPartyDataV1
java -jar ${JAR_PATH} lobby adminGetPartyDataV1 \
    --namespace "test" \
    --partyId 'oot0B7WO' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetPartyDataV1'
delete_file $TEMP_FILE

#- 40 AdminUpdatePartyAttributesV1
java -jar ${JAR_PATH} lobby adminUpdatePartyAttributesV1 \
    --body '{"custom_attribute": {"fercZdpM": {}}, "updatedAt": 5}' \
    --namespace "test" \
    --partyId 'i37Ds7YS' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdatePartyAttributesV1'
delete_file $TEMP_FILE

#- 41 AdminJoinPartyV1
java -jar ${JAR_PATH} lobby adminJoinPartyV1 \
    --namespace "test" \
    --partyId 'fExaI3uz' \
    --userId 'LteMbFAl' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminJoinPartyV1'
delete_file $TEMP_FILE

#- 42 AdminGetUserPartyV1
java -jar ${JAR_PATH} lobby adminGetUserPartyV1 \
    --namespace "test" \
    --userId 't4hr7HmO' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserPartyV1'
delete_file $TEMP_FILE

#- 43 AdminGetLobbyCCU
java -jar ${JAR_PATH} lobby adminGetLobbyCCU \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetLobbyCCU'
delete_file $TEMP_FILE

#- 44 AdminGetAllPlayerSessionAttribute
java -jar ${JAR_PATH} lobby adminGetAllPlayerSessionAttribute \
    --namespace "test" \
    --userId 'YiBA5ltA' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetAllPlayerSessionAttribute'
delete_file $TEMP_FILE

#- 45 AdminSetPlayerSessionAttribute
java -jar ${JAR_PATH} lobby adminSetPlayerSessionAttribute \
    --body '{"attributes": {"OXmlG6eh": "1dTdoTFp"}}' \
    --namespace "test" \
    --userId 'BIcuC1dQ' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminSetPlayerSessionAttribute'
delete_file $TEMP_FILE

#- 46 AdminGetPlayerSessionAttribute
java -jar ${JAR_PATH} lobby adminGetPlayerSessionAttribute \
    --attribute 'Y93OJnJ6' \
    --namespace "test" \
    --userId 'Te9vD8ld' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetPlayerSessionAttribute'
delete_file $TEMP_FILE

#- 47 AdminGetPlayerBlockedPlayersV1
java -jar ${JAR_PATH} lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "test" \
    --userId 'z7Hu8AD7' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetPlayerBlockedPlayersV1'
delete_file $TEMP_FILE

#- 48 AdminGetPlayerBlockedByPlayersV1
java -jar ${JAR_PATH} lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "test" \
    --userId '9kdWunvi' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetPlayerBlockedByPlayersV1'
delete_file $TEMP_FILE

#- 49 AdminBulkBlockPlayersV1
java -jar ${JAR_PATH} lobby adminBulkBlockPlayersV1 \
    --body '{"listBlockedUserId": ["zU0q1pHy"]}' \
    --namespace "test" \
    --userId 'hhERoGgd' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminBulkBlockPlayersV1'
delete_file $TEMP_FILE

#- 50 AdminDebugProfanityFilters
java -jar ${JAR_PATH} lobby adminDebugProfanityFilters \
    --body '{"text": "rysMizBG"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDebugProfanityFilters'
delete_file $TEMP_FILE

#- 51 AdminGetProfanityListFiltersV1
java -jar ${JAR_PATH} lobby adminGetProfanityListFiltersV1 \
    --list 'SRdP2l7D' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetProfanityListFiltersV1'
delete_file $TEMP_FILE

#- 52 AdminAddProfanityFilterIntoList
java -jar ${JAR_PATH} lobby adminAddProfanityFilterIntoList \
    --body '{"filter": "NSZ8Aq0X", "note": "iPLQXSe0"}' \
    --list '7ZddOGTM' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddProfanityFilterIntoList'
delete_file $TEMP_FILE

#- 53 AdminAddProfanityFilters
java -jar ${JAR_PATH} lobby adminAddProfanityFilters \
    --body '{"filters": [{"filter": "lJjBwj9H", "note": "JHQKseEd"}]}' \
    --list 'SXRDSvgu' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddProfanityFilters'
delete_file $TEMP_FILE

#- 54 AdminImportProfanityFiltersFromFile
java -jar ${JAR_PATH} lobby adminImportProfanityFiltersFromFile \
    --body '[0]' \
    --list 'uw1xT7eM' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminImportProfanityFiltersFromFile'
delete_file $TEMP_FILE

#- 55 AdminDeleteProfanityFilter
java -jar ${JAR_PATH} lobby adminDeleteProfanityFilter \
    --body '{"filter": "wSl9MLH0"}' \
    --list 'NnTJ2ulN' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteProfanityFilter'
delete_file $TEMP_FILE

#- 56 AdminGetProfanityLists
java -jar ${JAR_PATH} lobby adminGetProfanityLists \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetProfanityLists'
delete_file $TEMP_FILE

#- 57 AdminCreateProfanityList
java -jar ${JAR_PATH} lobby adminCreateProfanityList \
    --body '{"isEnabled": true, "isMandatory": true, "name": "vwJaQa54"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateProfanityList'
delete_file $TEMP_FILE

#- 58 AdminUpdateProfanityList
java -jar ${JAR_PATH} lobby adminUpdateProfanityList \
    --body '{"isEnabled": false, "isMandatory": false, "newName": "vA8RWSpa"}' \
    --list 'bUt7xk6Q' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateProfanityList'
delete_file $TEMP_FILE

#- 59 AdminDeleteProfanityList
java -jar ${JAR_PATH} lobby adminDeleteProfanityList \
    --list 'xyWhfqoW' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteProfanityList'
delete_file $TEMP_FILE

#- 60 AdminGetProfanityRule
java -jar ${JAR_PATH} lobby adminGetProfanityRule \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetProfanityRule'
delete_file $TEMP_FILE

#- 61 AdminSetProfanityRuleForNamespace
java -jar ${JAR_PATH} lobby adminSetProfanityRuleForNamespace \
    --body '{"rule": "fJw2o8oW"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminSetProfanityRuleForNamespace'
delete_file $TEMP_FILE

#- 62 AdminVerifyMessageProfanityResponse
java -jar ${JAR_PATH} lobby adminVerifyMessageProfanityResponse \
    --body '{"message": "UqvPCZ2H", "profanityLevel": "zT7NXmWD"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminVerifyMessageProfanityResponse'
delete_file $TEMP_FILE

#- 63 AdminGetThirdPartyConfig
java -jar ${JAR_PATH} lobby adminGetThirdPartyConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetThirdPartyConfig'
delete_file $TEMP_FILE

#- 64 AdminUpdateThirdPartyConfig
java -jar ${JAR_PATH} lobby adminUpdateThirdPartyConfig \
    --body '{"apiKey": "lXsuNIdQ"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateThirdPartyConfig'
delete_file $TEMP_FILE

#- 65 AdminCreateThirdPartyConfig
java -jar ${JAR_PATH} lobby adminCreateThirdPartyConfig \
    --body '{"apiKey": "JR5lsNOl"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateThirdPartyConfig'
delete_file $TEMP_FILE

#- 66 AdminDeleteThirdPartyConfig
java -jar ${JAR_PATH} lobby adminDeleteThirdPartyConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteThirdPartyConfig'
delete_file $TEMP_FILE

#- 67 PublicGetMessages
java -jar ${JAR_PATH} lobby publicGetMessages \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetMessages'
delete_file $TEMP_FILE

#- 68 GetPersonalChatHistoryV1Public
java -jar ${JAR_PATH} lobby getPersonalChatHistoryV1Public \
    --friendId 'vkfwaSbn' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetPersonalChatHistoryV1Public'
delete_file $TEMP_FILE

#- 69 PublicGetPartyDataV1
java -jar ${JAR_PATH} lobby publicGetPartyDataV1 \
    --namespace "test" \
    --partyId 'suLCgTox' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetPartyDataV1'
delete_file $TEMP_FILE

#- 70 PublicUpdatePartyAttributesV1
java -jar ${JAR_PATH} lobby publicUpdatePartyAttributesV1 \
    --body '{"custom_attribute": {"uVTekJgv": {}}, "updatedAt": 13}' \
    --namespace "test" \
    --partyId '6h5HIpH0' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdatePartyAttributesV1'
delete_file $TEMP_FILE

#- 71 PublicGetPlayerBlockedPlayersV1
java -jar ${JAR_PATH} lobby publicGetPlayerBlockedPlayersV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetPlayerBlockedPlayersV1'
delete_file $TEMP_FILE

#- 72 PublicGetPlayerBlockedByPlayersV1
java -jar ${JAR_PATH} lobby publicGetPlayerBlockedByPlayersV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetPlayerBlockedByPlayersV1'
delete_file $TEMP_FILE

#- 73 UsersPresenceHandlerV1
java -jar ${JAR_PATH} lobby usersPresenceHandlerV1 \
    --namespace "test" \
    --userIds 'DviplEk4' \
    >$TEMP_FILE 2>&1
update_status $? 'UsersPresenceHandlerV1'
delete_file $TEMP_FILE

#- 74 FreeFormNotification
java -jar ${JAR_PATH} lobby freeFormNotification \
    --body '{"message": "vj3LDp4y", "topic": "qDt8QUZD"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'FreeFormNotification'
delete_file $TEMP_FILE

#- 75 NotificationWithTemplate
java -jar ${JAR_PATH} lobby notificationWithTemplate \
    --body '{"templateContext": {"pxlHasin": "GcjrkmRM"}, "templateLanguage": "ttgjDSaI", "templateSlug": "VBmft3Ud", "topic": "g7p9PGmY"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'NotificationWithTemplate'
delete_file $TEMP_FILE

#- 76 GetGameTemplate
java -jar ${JAR_PATH} lobby getGameTemplate \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetGameTemplate'
delete_file $TEMP_FILE

#- 77 CreateTemplate
java -jar ${JAR_PATH} lobby createTemplate \
    --body '{"templateContent": "2H5kX4Ms", "templateLanguage": "isSX28nA", "templateSlug": "RxWRpv5o"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateTemplate'
delete_file $TEMP_FILE

#- 78 GetSlugTemplate
java -jar ${JAR_PATH} lobby getSlugTemplate \
    --namespace "test" \
    --templateSlug 'u5xtvd28' \
    >$TEMP_FILE 2>&1
update_status $? 'GetSlugTemplate'
delete_file $TEMP_FILE

#- 79 DeleteTemplateSlug
java -jar ${JAR_PATH} lobby deleteTemplateSlug \
    --namespace "test" \
    --templateSlug 'OUfCt8UJ' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteTemplateSlug'
delete_file $TEMP_FILE

#- 80 GetLocalizationTemplate
java -jar ${JAR_PATH} lobby getLocalizationTemplate \
    --namespace "test" \
    --templateLanguage 'C5flNyj6' \
    --templateSlug 'HsTtX8P3' \
    >$TEMP_FILE 2>&1
update_status $? 'GetLocalizationTemplate'
delete_file $TEMP_FILE

#- 81 UpdateLocalizationTemplate
java -jar ${JAR_PATH} lobby updateLocalizationTemplate \
    --body '{"templateContent": "llnaaS9l"}' \
    --namespace "test" \
    --templateLanguage 'qyygPcfk' \
    --templateSlug 'JIxfQZza' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateLocalizationTemplate'
delete_file $TEMP_FILE

#- 82 DeleteTemplateLocalization
java -jar ${JAR_PATH} lobby deleteTemplateLocalization \
    --namespace "test" \
    --templateLanguage '8kNVbDxV' \
    --templateSlug 'Mq7HJk0F' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteTemplateLocalization'
delete_file $TEMP_FILE

#- 83 PublishTemplate
java -jar ${JAR_PATH} lobby publishTemplate \
    --namespace "test" \
    --templateLanguage '89xAc3YV' \
    --templateSlug 'faENtrl0' \
    >$TEMP_FILE 2>&1
update_status $? 'PublishTemplate'
delete_file $TEMP_FILE

#- 84 GetTopicByNamespace
java -jar ${JAR_PATH} lobby getTopicByNamespace \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetTopicByNamespace'
delete_file $TEMP_FILE

#- 85 CreateTopic
java -jar ${JAR_PATH} lobby createTopic \
    --body '{"description": "pTKZTXqz", "topic": "HuBMYQSA"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateTopic'
delete_file $TEMP_FILE

#- 86 GetTopicByTopicName
java -jar ${JAR_PATH} lobby getTopicByTopicName \
    --namespace "test" \
    --topic '2jz1ZOpd' \
    >$TEMP_FILE 2>&1
update_status $? 'GetTopicByTopicName'
delete_file $TEMP_FILE

#- 87 UpdateTopicByTopicName
java -jar ${JAR_PATH} lobby updateTopicByTopicName \
    --body '{"description": "OjSyMddB"}' \
    --namespace "test" \
    --topic '41JuMf7R' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateTopicByTopicName'
delete_file $TEMP_FILE

#- 88 DeleteTopicByTopicName
java -jar ${JAR_PATH} lobby deleteTopicByTopicName \
    --namespace "test" \
    --topic 'UyBHRj8I' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteTopicByTopicName'
delete_file $TEMP_FILE

#- 89 FreeFormNotificationByUserID
java -jar ${JAR_PATH} lobby freeFormNotificationByUserID \
    --body '{"message": "iRimRllH", "topic": "T6Dc40vF"}' \
    --namespace "test" \
    --userId 'FA6gpU7E' \
    >$TEMP_FILE 2>&1
update_status $? 'FreeFormNotificationByUserID'
delete_file $TEMP_FILE

#- 90 NotificationWithTemplateByUserID
java -jar ${JAR_PATH} lobby notificationWithTemplateByUserID \
    --body '{"templateContext": {"W3x1dCpm": "55gOeqQI"}, "templateLanguage": "qcJVKmBM", "templateSlug": "1J1IbuTr", "topic": "rkbmuT1w"}' \
    --namespace "test" \
    --userId 'hOqmEnDX' \
    >$TEMP_FILE 2>&1
update_status $? 'NotificationWithTemplateByUserID'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT