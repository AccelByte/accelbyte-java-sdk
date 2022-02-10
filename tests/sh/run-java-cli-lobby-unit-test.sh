#!/bin/bash

#Meta:
#- random seed: 256
#- template file: java-cli-unit-test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH='../../samples/cli'
JAR_PATH="${MODULE_PATH}/build/libs/cli.jar"
TEMP_FILE='file.tmp'

OPERATIONS_COUNT=89

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
    --body '{"autoKickOnDisconnect": false, "autoKickOnDisconnectDelay": 29, "cancelTicketOnDisconnect": true, "chatRateLimitBurst": 31, "chatRateLimitDuration": 56, "concurrentUsersLimit": 72, "enableChat": false, "entitlementCheck": true, "entitlementItemID": "BdNEUsxF", "generalRateLimitBurst": 2, "generalRateLimitDuration": 56, "maxPartyMember": 70, "profanityFilter": true, "readyConsentTimeout": 70}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateConfigV1'
delete_file $TEMP_FILE

#- 16 ExportConfig
java -jar ${JAR_PATH} lobby exportConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ExportConfig'
delete_file $TEMP_FILE

#- 17 ImportConfig
java -jar ${JAR_PATH} lobby importConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ImportConfig'
delete_file $TEMP_FILE

#- 18 GetListOfFriends
java -jar ${JAR_PATH} lobby getListOfFriends \
    --namespace "test" \
    --userId 'ZaMSxECb' \
    >$TEMP_FILE 2>&1
update_status $? 'GetListOfFriends'
delete_file $TEMP_FILE

#- 19 SendMultipleUsersFreeformNotificationV1Admin
java -jar ${JAR_PATH} lobby sendMultipleUsersFreeformNotificationV1Admin \
    --body '{"message": "Zbygyoar", "topicName": "ORoeNHSb", "userIds": ["8Rh3kgs9"]}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SendMultipleUsersFreeformNotificationV1Admin'
delete_file $TEMP_FILE

#- 20 SendUsersFreeformNotificationV1Admin
java -jar ${JAR_PATH} lobby sendUsersFreeformNotificationV1Admin \
    --body '{"message": "qqJbnQso", "topicName": "BgiVpP8C"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SendUsersFreeformNotificationV1Admin'
delete_file $TEMP_FILE

#- 21 SendPartyFreeformNotificationV1Admin
java -jar ${JAR_PATH} lobby sendPartyFreeformNotificationV1Admin \
    --body '{"message": "m3yvASUo", "topicName": "xdxxFqmA"}' \
    --namespace "test" \
    --partyId 'GTJ8IEda' \
    >$TEMP_FILE 2>&1
update_status $? 'SendPartyFreeformNotificationV1Admin'
delete_file $TEMP_FILE

#- 22 SendPartyTemplatedNotificationV1Admin
java -jar ${JAR_PATH} lobby sendPartyTemplatedNotificationV1Admin \
    --body '{"templateContext": {"gEtp4w29": "KOu9c19R"}, "templateLanguage": "6XDqWHkk", "templateSlug": "P8npLEKM", "topicName": "fjiX7jpk"}' \
    --namespace "test" \
    --partyId 'VZk3IaQY' \
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
    --body '{"templateContent": "EmqGodOE", "templateLanguage": "Gt9gPOj0", "templateSlug": "c6i0JkvI"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateNotificationTemplateV1Admin'
delete_file $TEMP_FILE

#- 25 SendUsersTemplatedNotificationV1Admin
java -jar ${JAR_PATH} lobby sendUsersTemplatedNotificationV1Admin \
    --body '{"templateContext": {"as73ucYn": "FAJ3DK5T"}, "templateLanguage": "4Eogg0Y3", "templateSlug": "9UoYlpv5", "topicName": "bVAgtsDh"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SendUsersTemplatedNotificationV1Admin'
delete_file $TEMP_FILE

#- 26 GetTemplateSlugLocalizationsTemplateV1Admin
java -jar ${JAR_PATH} lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "test" \
    --templateSlug 'UTDUscbQ' \
    >$TEMP_FILE 2>&1
update_status $? 'GetTemplateSlugLocalizationsTemplateV1Admin'
delete_file $TEMP_FILE

#- 27 DeleteNotificationTemplateSlugV1Admin
java -jar ${JAR_PATH} lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "test" \
    --templateSlug 'DjbTQuPM' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteNotificationTemplateSlugV1Admin'
delete_file $TEMP_FILE

#- 28 GetSingleTemplateLocalizationV1Admin
java -jar ${JAR_PATH} lobby getSingleTemplateLocalizationV1Admin \
    --namespace "test" \
    --templateLanguage 'z2PTRlky' \
    --templateSlug 'U89ZPOw6' \
    >$TEMP_FILE 2>&1
update_status $? 'GetSingleTemplateLocalizationV1Admin'
delete_file $TEMP_FILE

#- 29 UpdateTemplateLocalizationV1Admin
java -jar ${JAR_PATH} lobby updateTemplateLocalizationV1Admin \
    --body '{"templateContent": "zPFJ42cw"}' \
    --namespace "test" \
    --templateLanguage 'mzBBSMNc' \
    --templateSlug 'oAAOjKNj' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateTemplateLocalizationV1Admin'
delete_file $TEMP_FILE

#- 30 DeleteTemplateLocalizationV1Admin
java -jar ${JAR_PATH} lobby deleteTemplateLocalizationV1Admin \
    --namespace "test" \
    --templateLanguage 'fcYHm093' \
    --templateSlug 'aYgBU1sq' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteTemplateLocalizationV1Admin'
delete_file $TEMP_FILE

#- 31 PublishTemplateLocalizationV1Admin
java -jar ${JAR_PATH} lobby publishTemplateLocalizationV1Admin \
    --namespace "test" \
    --templateLanguage 'jyK0XH45' \
    --templateSlug 'PaRSOFQB' \
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
    --body '{"description": "tu23REZ8", "topicName": "hRVX7LGO"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateNotificationTopicV1Admin'
delete_file $TEMP_FILE

#- 34 GetNotificationTopicV1Admin
java -jar ${JAR_PATH} lobby getNotificationTopicV1Admin \
    --namespace "test" \
    --topicName 'vDdYiQS9' \
    >$TEMP_FILE 2>&1
update_status $? 'GetNotificationTopicV1Admin'
delete_file $TEMP_FILE

#- 35 UpdateNotificationTopicV1Admin
java -jar ${JAR_PATH} lobby updateNotificationTopicV1Admin \
    --body '{"description": "i7mV1C91"}' \
    --namespace "test" \
    --topicName 'pjG9gpxL' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateNotificationTopicV1Admin'
delete_file $TEMP_FILE

#- 36 DeleteNotificationTopicV1Admin
java -jar ${JAR_PATH} lobby deleteNotificationTopicV1Admin \
    --namespace "test" \
    --topicName '6ycTQdvl' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteNotificationTopicV1Admin'
delete_file $TEMP_FILE

#- 37 SendSpecificUserFreeformNotificationV1Admin
java -jar ${JAR_PATH} lobby sendSpecificUserFreeformNotificationV1Admin \
    --body '{"message": "n2LAuSQW", "topicName": "EXL6LFE1"}' \
    --namespace "test" \
    --userId 'YHo9m126' \
    >$TEMP_FILE 2>&1
update_status $? 'SendSpecificUserFreeformNotificationV1Admin'
delete_file $TEMP_FILE

#- 38 SendSpecificUserTemplatedNotificationV1Admin
java -jar ${JAR_PATH} lobby sendSpecificUserTemplatedNotificationV1Admin \
    --body '{"templateContext": {"ZWc8hHtW": "vbNYqgUq"}, "templateLanguage": "slArFPiH", "templateSlug": "UIvaCv8k", "topicName": "U9dBBpds"}' \
    --namespace "test" \
    --userId 'JLhsVyEx' \
    >$TEMP_FILE 2>&1
update_status $? 'SendSpecificUserTemplatedNotificationV1Admin'
delete_file $TEMP_FILE

#- 39 AdminGetPartyDataV1
java -jar ${JAR_PATH} lobby adminGetPartyDataV1 \
    --namespace "test" \
    --partyId 'rkxoot0B' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetPartyDataV1'
delete_file $TEMP_FILE

#- 40 AdminUpdatePartyAttributesV1
java -jar ${JAR_PATH} lobby adminUpdatePartyAttributesV1 \
    --body '{"custom_attribute": {"7WOfercZ": {}}, "updatedAt": 7}' \
    --namespace "test" \
    --partyId 'pMci37Ds' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdatePartyAttributesV1'
delete_file $TEMP_FILE

#- 41 AdminGetUserPartyV1
java -jar ${JAR_PATH} lobby adminGetUserPartyV1 \
    --namespace "test" \
    --userId '7YSfExaI' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserPartyV1'
delete_file $TEMP_FILE

#- 42 AdminGetLobbyCCU
java -jar ${JAR_PATH} lobby adminGetLobbyCCU \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetLobbyCCU'
delete_file $TEMP_FILE

#- 43 AdminGetAllPlayerSessionAttribute
java -jar ${JAR_PATH} lobby adminGetAllPlayerSessionAttribute \
    --namespace "test" \
    --userId '3uzLteMb' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetAllPlayerSessionAttribute'
delete_file $TEMP_FILE

#- 44 AdminSetPlayerSessionAttribute
java -jar ${JAR_PATH} lobby adminSetPlayerSessionAttribute \
    --body '{"attributes": {"FAlt4hr7": "HmOYiBA5"}}' \
    --namespace "test" \
    --userId 'ltAOXmlG' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminSetPlayerSessionAttribute'
delete_file $TEMP_FILE

#- 45 AdminGetPlayerSessionAttribute
java -jar ${JAR_PATH} lobby adminGetPlayerSessionAttribute \
    --attribute '6eh1dTdo' \
    --namespace "test" \
    --userId 'TFpBIcuC' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetPlayerSessionAttribute'
delete_file $TEMP_FILE

#- 46 AdminGetPlayerBlockedPlayersV1
java -jar ${JAR_PATH} lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "test" \
    --userId '1dQY93OJ' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetPlayerBlockedPlayersV1'
delete_file $TEMP_FILE

#- 47 AdminGetPlayerBlockedByPlayersV1
java -jar ${JAR_PATH} lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "test" \
    --userId 'nJ6Te9vD' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetPlayerBlockedByPlayersV1'
delete_file $TEMP_FILE

#- 48 AdminBulkBlockPlayersV1
java -jar ${JAR_PATH} lobby adminBulkBlockPlayersV1 \
    --body '{"listBlockedUserId": ["8ldz7Hu8"]}' \
    --namespace "test" \
    --userId 'AD79kdWu' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminBulkBlockPlayersV1'
delete_file $TEMP_FILE

#- 49 AdminDebugProfanityFilters
java -jar ${JAR_PATH} lobby adminDebugProfanityFilters \
    --body '{"text": "nvizU0q1"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDebugProfanityFilters'
delete_file $TEMP_FILE

#- 50 AdminGetProfanityListFiltersV1
java -jar ${JAR_PATH} lobby adminGetProfanityListFiltersV1 \
    --list 'pHyhhERo' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetProfanityListFiltersV1'
delete_file $TEMP_FILE

#- 51 AdminAddProfanityFilterIntoList
java -jar ${JAR_PATH} lobby adminAddProfanityFilterIntoList \
    --body '{"filter": "GgdrysMi", "note": "zBGSRdP2"}' \
    --list 'l7DNSZ8A' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddProfanityFilterIntoList'
delete_file $TEMP_FILE

#- 52 AdminAddProfanityFilters
java -jar ${JAR_PATH} lobby adminAddProfanityFilters \
    --body '{"filters": [{"filter": "q0XiPLQX", "note": "Se07ZddO"}]}' \
    --list 'GTMlJjBw' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddProfanityFilters'
delete_file $TEMP_FILE

#- 53 AdminImportProfanityFiltersFromFile
java -jar ${JAR_PATH} lobby adminImportProfanityFiltersFromFile \
    --body '[19]' \
    --list '9HJHQKse' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminImportProfanityFiltersFromFile'
delete_file $TEMP_FILE

#- 54 AdminDeleteProfanityFilter
java -jar ${JAR_PATH} lobby adminDeleteProfanityFilter \
    --body '{"filter": "EdSXRDSv"}' \
    --list 'guauw1xT' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteProfanityFilter'
delete_file $TEMP_FILE

#- 55 AdminGetProfanityLists
java -jar ${JAR_PATH} lobby adminGetProfanityLists \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetProfanityLists'
delete_file $TEMP_FILE

#- 56 AdminCreateProfanityList
java -jar ${JAR_PATH} lobby adminCreateProfanityList \
    --body '{"isEnabled": false, "isMandatory": true, "name": "Sl9MLH0N"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateProfanityList'
delete_file $TEMP_FILE

#- 57 AdminUpdateProfanityList
java -jar ${JAR_PATH} lobby adminUpdateProfanityList \
    --body '{"isEnabled": false, "isMandatory": true, "newName": "lNzBvwJa"}' \
    --list 'Qa547Jll' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateProfanityList'
delete_file $TEMP_FILE

#- 58 AdminDeleteProfanityList
java -jar ${JAR_PATH} lobby adminDeleteProfanityList \
    --list 'vA8RWSpa' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteProfanityList'
delete_file $TEMP_FILE

#- 59 AdminGetProfanityRule
java -jar ${JAR_PATH} lobby adminGetProfanityRule \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetProfanityRule'
delete_file $TEMP_FILE

#- 60 AdminSetProfanityRuleForNamespace
java -jar ${JAR_PATH} lobby adminSetProfanityRuleForNamespace \
    --body '{"rule": "bUt7xk6Q"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminSetProfanityRuleForNamespace'
delete_file $TEMP_FILE

#- 61 AdminVerifyMessageProfanityResponse
java -jar ${JAR_PATH} lobby adminVerifyMessageProfanityResponse \
    --body '{"message": "xyWhfqoW", "profanityLevel": "fJw2o8oW"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminVerifyMessageProfanityResponse'
delete_file $TEMP_FILE

#- 62 AdminGetThirdPartyConfig
java -jar ${JAR_PATH} lobby adminGetThirdPartyConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetThirdPartyConfig'
delete_file $TEMP_FILE

#- 63 AdminUpdateThirdPartyConfig
java -jar ${JAR_PATH} lobby adminUpdateThirdPartyConfig \
    --body '{"apiKey": "UqvPCZ2H"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateThirdPartyConfig'
delete_file $TEMP_FILE

#- 64 AdminCreateThirdPartyConfig
java -jar ${JAR_PATH} lobby adminCreateThirdPartyConfig \
    --body '{"apiKey": "zT7NXmWD"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateThirdPartyConfig'
delete_file $TEMP_FILE

#- 65 AdminDeleteThirdPartyConfig
java -jar ${JAR_PATH} lobby adminDeleteThirdPartyConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteThirdPartyConfig'
delete_file $TEMP_FILE

#- 66 PublicGetMessages
java -jar ${JAR_PATH} lobby publicGetMessages \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetMessages'
delete_file $TEMP_FILE

#- 67 GetPersonalChatHistoryV1Public
java -jar ${JAR_PATH} lobby getPersonalChatHistoryV1Public \
    --friendId 'lXsuNIdQ' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetPersonalChatHistoryV1Public'
delete_file $TEMP_FILE

#- 68 PublicGetPartyDataV1
java -jar ${JAR_PATH} lobby publicGetPartyDataV1 \
    --namespace "test" \
    --partyId 'JR5lsNOl' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetPartyDataV1'
delete_file $TEMP_FILE

#- 69 PublicUpdatePartyAttributesV1
java -jar ${JAR_PATH} lobby publicUpdatePartyAttributesV1 \
    --body '{"custom_attribute": {"vkfwaSbn": {}}, "updatedAt": 37}' \
    --namespace "test" \
    --partyId 'uLCgToxu' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdatePartyAttributesV1'
delete_file $TEMP_FILE

#- 70 PublicGetPlayerBlockedPlayersV1
java -jar ${JAR_PATH} lobby publicGetPlayerBlockedPlayersV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetPlayerBlockedPlayersV1'
delete_file $TEMP_FILE

#- 71 PublicGetPlayerBlockedByPlayersV1
java -jar ${JAR_PATH} lobby publicGetPlayerBlockedByPlayersV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetPlayerBlockedByPlayersV1'
delete_file $TEMP_FILE

#- 72 UsersPresenceHandlerV1
java -jar ${JAR_PATH} lobby usersPresenceHandlerV1 \
    --namespace "test" \
    --userIds 'VTekJgvg' \
    >$TEMP_FILE 2>&1
update_status $? 'UsersPresenceHandlerV1'
delete_file $TEMP_FILE

#- 73 FreeFormNotification
java -jar ${JAR_PATH} lobby freeFormNotification \
    --body '{"message": "6h5HIpH0", "topic": "DviplEk4"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'FreeFormNotification'
delete_file $TEMP_FILE

#- 74 NotificationWithTemplate
java -jar ${JAR_PATH} lobby notificationWithTemplate \
    --body '{"templateContext": {"vj3LDp4y": "qDt8QUZD"}, "templateLanguage": "pxlHasin", "templateSlug": "GcjrkmRM", "topic": "ttgjDSaI"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'NotificationWithTemplate'
delete_file $TEMP_FILE

#- 75 GetGameTemplate
java -jar ${JAR_PATH} lobby getGameTemplate \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetGameTemplate'
delete_file $TEMP_FILE

#- 76 CreateTemplate
java -jar ${JAR_PATH} lobby createTemplate \
    --body '{"templateContent": "VBmft3Ud", "templateLanguage": "g7p9PGmY", "templateSlug": "2H5kX4Ms"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateTemplate'
delete_file $TEMP_FILE

#- 77 GetSlugTemplate
java -jar ${JAR_PATH} lobby getSlugTemplate \
    --namespace "test" \
    --templateSlug 'isSX28nA' \
    >$TEMP_FILE 2>&1
update_status $? 'GetSlugTemplate'
delete_file $TEMP_FILE

#- 78 DeleteTemplateSlug
java -jar ${JAR_PATH} lobby deleteTemplateSlug \
    --namespace "test" \
    --templateSlug 'RxWRpv5o' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteTemplateSlug'
delete_file $TEMP_FILE

#- 79 GetLocalizationTemplate
java -jar ${JAR_PATH} lobby getLocalizationTemplate \
    --namespace "test" \
    --templateLanguage 'u5xtvd28' \
    --templateSlug 'OUfCt8UJ' \
    >$TEMP_FILE 2>&1
update_status $? 'GetLocalizationTemplate'
delete_file $TEMP_FILE

#- 80 UpdateLocalizationTemplate
java -jar ${JAR_PATH} lobby updateLocalizationTemplate \
    --body '{"templateContent": "C5flNyj6"}' \
    --namespace "test" \
    --templateLanguage 'HsTtX8P3' \
    --templateSlug 'llnaaS9l' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateLocalizationTemplate'
delete_file $TEMP_FILE

#- 81 DeleteTemplateLocalization
java -jar ${JAR_PATH} lobby deleteTemplateLocalization \
    --namespace "test" \
    --templateLanguage 'qyygPcfk' \
    --templateSlug 'JIxfQZza' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteTemplateLocalization'
delete_file $TEMP_FILE

#- 82 PublishTemplate
java -jar ${JAR_PATH} lobby publishTemplate \
    --namespace "test" \
    --templateLanguage '8kNVbDxV' \
    --templateSlug 'Mq7HJk0F' \
    >$TEMP_FILE 2>&1
update_status $? 'PublishTemplate'
delete_file $TEMP_FILE

#- 83 GetTopicByNamespace
java -jar ${JAR_PATH} lobby getTopicByNamespace \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetTopicByNamespace'
delete_file $TEMP_FILE

#- 84 CreateTopic
java -jar ${JAR_PATH} lobby createTopic \
    --body '{"description": "89xAc3YV", "topic": "faENtrl0"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateTopic'
delete_file $TEMP_FILE

#- 85 GetTopicByTopicName
java -jar ${JAR_PATH} lobby getTopicByTopicName \
    --namespace "test" \
    --topic 'pTKZTXqz' \
    >$TEMP_FILE 2>&1
update_status $? 'GetTopicByTopicName'
delete_file $TEMP_FILE

#- 86 UpdateTopicByTopicName
java -jar ${JAR_PATH} lobby updateTopicByTopicName \
    --body '{"description": "HuBMYQSA"}' \
    --namespace "test" \
    --topic '2jz1ZOpd' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateTopicByTopicName'
delete_file $TEMP_FILE

#- 87 DeleteTopicByTopicName
java -jar ${JAR_PATH} lobby deleteTopicByTopicName \
    --namespace "test" \
    --topic 'OjSyMddB' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteTopicByTopicName'
delete_file $TEMP_FILE

#- 88 FreeFormNotificationByUserID
java -jar ${JAR_PATH} lobby freeFormNotificationByUserID \
    --body '{"message": "41JuMf7R", "topic": "UyBHRj8I"}' \
    --namespace "test" \
    --userId 'iRimRllH' \
    >$TEMP_FILE 2>&1
update_status $? 'FreeFormNotificationByUserID'
delete_file $TEMP_FILE

#- 89 NotificationWithTemplateByUserID
java -jar ${JAR_PATH} lobby notificationWithTemplateByUserID \
    --body '{"templateContext": {"T6Dc40vF": "FA6gpU7E"}, "templateLanguage": "W3x1dCpm", "templateSlug": "55gOeqQI", "topic": "qcJVKmBM"}' \
    --namespace "test" \
    --userId '1J1IbuTr' \
    >$TEMP_FILE 2>&1
update_status $? 'NotificationWithTemplateByUserID'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT