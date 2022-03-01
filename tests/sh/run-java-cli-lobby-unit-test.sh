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
    --body '{"autoKickOnDisconnect": false, "autoKickOnDisconnectDelay": 29, "cancelTicketOnDisconnect": true, "chatRateLimitBurst": 31, "chatRateLimitDuration": 56, "concurrentUsersLimit": 72, "disablePartyInvitationToken": false, "enableChat": true, "entitlementCheck": true, "entitlementItemID": "dNEUsxFb", "generalRateLimitBurst": 56, "generalRateLimitDuration": 70, "maxPartyMember": 76, "profanityFilter": true, "readyConsentTimeout": 70}' \
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

#- 41 AdminJoinPartyV1
java -jar ${JAR_PATH} lobby adminJoinPartyV1 \
    --namespace "test" \
    --partyId '7YSfExaI' \
    --userId '3uzLteMb' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminJoinPartyV1'
delete_file $TEMP_FILE

#- 42 AdminGetUserPartyV1
java -jar ${JAR_PATH} lobby adminGetUserPartyV1 \
    --namespace "test" \
    --userId 'FAlt4hr7' \
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
    --userId 'HmOYiBA5' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetAllPlayerSessionAttribute'
delete_file $TEMP_FILE

#- 45 AdminSetPlayerSessionAttribute
java -jar ${JAR_PATH} lobby adminSetPlayerSessionAttribute \
    --body '{"attributes": {"ltAOXmlG": "6eh1dTdo"}}' \
    --namespace "test" \
    --userId 'TFpBIcuC' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminSetPlayerSessionAttribute'
delete_file $TEMP_FILE

#- 46 AdminGetPlayerSessionAttribute
java -jar ${JAR_PATH} lobby adminGetPlayerSessionAttribute \
    --attribute '1dQY93OJ' \
    --namespace "test" \
    --userId 'nJ6Te9vD' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetPlayerSessionAttribute'
delete_file $TEMP_FILE

#- 47 AdminGetPlayerBlockedPlayersV1
java -jar ${JAR_PATH} lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "test" \
    --userId '8ldz7Hu8' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetPlayerBlockedPlayersV1'
delete_file $TEMP_FILE

#- 48 AdminGetPlayerBlockedByPlayersV1
java -jar ${JAR_PATH} lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "test" \
    --userId 'AD79kdWu' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetPlayerBlockedByPlayersV1'
delete_file $TEMP_FILE

#- 49 AdminBulkBlockPlayersV1
java -jar ${JAR_PATH} lobby adminBulkBlockPlayersV1 \
    --body '{"listBlockedUserId": ["nvizU0q1"]}' \
    --namespace "test" \
    --userId 'pHyhhERo' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminBulkBlockPlayersV1'
delete_file $TEMP_FILE

#- 50 AdminDebugProfanityFilters
java -jar ${JAR_PATH} lobby adminDebugProfanityFilters \
    --body '{"text": "GgdrysMi"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDebugProfanityFilters'
delete_file $TEMP_FILE

#- 51 AdminGetProfanityListFiltersV1
java -jar ${JAR_PATH} lobby adminGetProfanityListFiltersV1 \
    --list 'zBGSRdP2' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetProfanityListFiltersV1'
delete_file $TEMP_FILE

#- 52 AdminAddProfanityFilterIntoList
java -jar ${JAR_PATH} lobby adminAddProfanityFilterIntoList \
    --body '{"filter": "l7DNSZ8A", "note": "q0XiPLQX"}' \
    --list 'Se07ZddO' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddProfanityFilterIntoList'
delete_file $TEMP_FILE

#- 53 AdminAddProfanityFilters
java -jar ${JAR_PATH} lobby adminAddProfanityFilters \
    --body '{"filters": [{"filter": "GTMlJjBw", "note": "j9HJHQKs"}]}' \
    --list 'eEdSXRDS' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddProfanityFilters'
delete_file $TEMP_FILE

#- 54 AdminImportProfanityFiltersFromFile
java -jar ${JAR_PATH} lobby adminImportProfanityFiltersFromFile \
    --body '[43]' \
    --list 'guauw1xT' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminImportProfanityFiltersFromFile'
delete_file $TEMP_FILE

#- 55 AdminDeleteProfanityFilter
java -jar ${JAR_PATH} lobby adminDeleteProfanityFilter \
    --body '{"filter": "7eMwSl9M"}' \
    --list 'LH0NnTJ2' \
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
    --body '{"isEnabled": true, "isMandatory": false, "name": "NzBvwJaQ"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateProfanityList'
delete_file $TEMP_FILE

#- 58 AdminUpdateProfanityList
java -jar ${JAR_PATH} lobby adminUpdateProfanityList \
    --body '{"isEnabled": false, "isMandatory": false, "newName": "lvA8RWSp"}' \
    --list 'abUt7xk6' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateProfanityList'
delete_file $TEMP_FILE

#- 59 AdminDeleteProfanityList
java -jar ${JAR_PATH} lobby adminDeleteProfanityList \
    --list 'QxyWhfqo' \
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
    --body '{"rule": "WfJw2o8o"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminSetProfanityRuleForNamespace'
delete_file $TEMP_FILE

#- 62 AdminVerifyMessageProfanityResponse
java -jar ${JAR_PATH} lobby adminVerifyMessageProfanityResponse \
    --body '{"message": "WUqvPCZ2", "profanityLevel": "HzT7NXmW"}' \
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
    --body '{"apiKey": "DlXsuNId"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateThirdPartyConfig'
delete_file $TEMP_FILE

#- 65 AdminCreateThirdPartyConfig
java -jar ${JAR_PATH} lobby adminCreateThirdPartyConfig \
    --body '{"apiKey": "QJR5lsNO"}' \
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
    --friendId 'lvkfwaSb' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetPersonalChatHistoryV1Public'
delete_file $TEMP_FILE

#- 69 PublicGetPartyDataV1
java -jar ${JAR_PATH} lobby publicGetPartyDataV1 \
    --namespace "test" \
    --partyId 'nsuLCgTo' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetPartyDataV1'
delete_file $TEMP_FILE

#- 70 PublicUpdatePartyAttributesV1
java -jar ${JAR_PATH} lobby publicUpdatePartyAttributesV1 \
    --body '{"custom_attribute": {"xuVTekJg": {}}, "updatedAt": 43}' \
    --namespace "test" \
    --partyId 'g6h5HIpH' \
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
    --userIds '0DviplEk' \
    >$TEMP_FILE 2>&1
update_status $? 'UsersPresenceHandlerV1'
delete_file $TEMP_FILE

#- 74 FreeFormNotification
java -jar ${JAR_PATH} lobby freeFormNotification \
    --body '{"message": "4vj3LDp4", "topic": "yqDt8QUZ"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'FreeFormNotification'
delete_file $TEMP_FILE

#- 75 NotificationWithTemplate
java -jar ${JAR_PATH} lobby notificationWithTemplate \
    --body '{"templateContext": {"DpxlHasi": "nGcjrkmR"}, "templateLanguage": "MttgjDSa", "templateSlug": "IVBmft3U", "topic": "dg7p9PGm"}' \
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
    --body '{"templateContent": "Y2H5kX4M", "templateLanguage": "sisSX28n", "templateSlug": "ARxWRpv5"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateTemplate'
delete_file $TEMP_FILE

#- 78 GetSlugTemplate
java -jar ${JAR_PATH} lobby getSlugTemplate \
    --namespace "test" \
    --templateSlug 'ou5xtvd2' \
    >$TEMP_FILE 2>&1
update_status $? 'GetSlugTemplate'
delete_file $TEMP_FILE

#- 79 DeleteTemplateSlug
java -jar ${JAR_PATH} lobby deleteTemplateSlug \
    --namespace "test" \
    --templateSlug '8OUfCt8U' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteTemplateSlug'
delete_file $TEMP_FILE

#- 80 GetLocalizationTemplate
java -jar ${JAR_PATH} lobby getLocalizationTemplate \
    --namespace "test" \
    --templateLanguage 'JC5flNyj' \
    --templateSlug '6HsTtX8P' \
    >$TEMP_FILE 2>&1
update_status $? 'GetLocalizationTemplate'
delete_file $TEMP_FILE

#- 81 UpdateLocalizationTemplate
java -jar ${JAR_PATH} lobby updateLocalizationTemplate \
    --body '{"templateContent": "3llnaaS9"}' \
    --namespace "test" \
    --templateLanguage 'lqyygPcf' \
    --templateSlug 'kJIxfQZz' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateLocalizationTemplate'
delete_file $TEMP_FILE

#- 82 DeleteTemplateLocalization
java -jar ${JAR_PATH} lobby deleteTemplateLocalization \
    --namespace "test" \
    --templateLanguage 'a8kNVbDx' \
    --templateSlug 'VMq7HJk0' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteTemplateLocalization'
delete_file $TEMP_FILE

#- 83 PublishTemplate
java -jar ${JAR_PATH} lobby publishTemplate \
    --namespace "test" \
    --templateLanguage 'F89xAc3Y' \
    --templateSlug 'VfaENtrl' \
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
    --body '{"description": "0pTKZTXq", "topic": "zHuBMYQS"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateTopic'
delete_file $TEMP_FILE

#- 86 GetTopicByTopicName
java -jar ${JAR_PATH} lobby getTopicByTopicName \
    --namespace "test" \
    --topic 'A2jz1ZOp' \
    >$TEMP_FILE 2>&1
update_status $? 'GetTopicByTopicName'
delete_file $TEMP_FILE

#- 87 UpdateTopicByTopicName
java -jar ${JAR_PATH} lobby updateTopicByTopicName \
    --body '{"description": "dOjSyMdd"}' \
    --namespace "test" \
    --topic 'B41JuMf7' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateTopicByTopicName'
delete_file $TEMP_FILE

#- 88 DeleteTopicByTopicName
java -jar ${JAR_PATH} lobby deleteTopicByTopicName \
    --namespace "test" \
    --topic 'RUyBHRj8' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteTopicByTopicName'
delete_file $TEMP_FILE

#- 89 FreeFormNotificationByUserID
java -jar ${JAR_PATH} lobby freeFormNotificationByUserID \
    --body '{"message": "IiRimRll", "topic": "HT6Dc40v"}' \
    --namespace "test" \
    --userId 'FFA6gpU7' \
    >$TEMP_FILE 2>&1
update_status $? 'FreeFormNotificationByUserID'
delete_file $TEMP_FILE

#- 90 NotificationWithTemplateByUserID
java -jar ${JAR_PATH} lobby notificationWithTemplateByUserID \
    --body '{"templateContext": {"EW3x1dCp": "m55gOeqQ"}, "templateLanguage": "IqcJVKmB", "templateSlug": "M1J1IbuT", "topic": "rrkbmuT1"}' \
    --namespace "test" \
    --userId 'whOqmEnD' \
    >$TEMP_FILE 2>&1
update_status $? 'NotificationWithTemplateByUserID'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT