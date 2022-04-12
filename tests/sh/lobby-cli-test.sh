#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

# Meta:
# - random seed: 256
# - template file: cli_test.j2

# Instructions:
# - Run the Justice SDK Mock Server first before running this script.

export AB_BASE_URL="http://127.0.0.1:8080"
export AB_CLIENT_ID="admin"
export AB_CLIENT_SECRET="admin"
export AB_NAMESPACE="test"

EXIT_CODE=0

eval_tap() {
  if [ $1 -eq 0 ]; then
    echo "ok $2 - $3"
  else
    EXIT_CODE=1
    echo "not ok $2 - $3"
    sed 's/^/# /g' $4
  fi
  rm -f $4
}

CLI_JAR="${CLI_JAR:-../../samples/cli/build/libs/cli.jar}"

echo "TAP version 13"
echo "1..91"

#- 1 Login
java -jar "${CLI_JAR}" loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetUserFriendsUpdated
java -jar "${CLI_JAR}" lobby getUserFriendsUpdated \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'GetUserFriendsUpdated' test.out

#- 3 GetUserIncomingFriends
java -jar "${CLI_JAR}" lobby getUserIncomingFriends \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 3 'GetUserIncomingFriends' test.out

#- 4 GetUserOutgoingFriends
java -jar "${CLI_JAR}" lobby getUserOutgoingFriends \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'GetUserOutgoingFriends' test.out

#- 5 UserRequestFriend
java -jar "${CLI_JAR}" lobby userRequestFriend \
    --body '{"friendId": "FtBxyZcD"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'UserRequestFriend' test.out

#- 6 UserAcceptFriendRequest
java -jar "${CLI_JAR}" lobby userAcceptFriendRequest \
    --body '{"friendId": "XBpGlsQu"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'UserAcceptFriendRequest' test.out

#- 7 UserCancelFriendRequest
java -jar "${CLI_JAR}" lobby userCancelFriendRequest \
    --body '{"friendId": "Ju8vMf0I"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'UserCancelFriendRequest' test.out

#- 8 UserRejectFriendRequest
java -jar "${CLI_JAR}" lobby userRejectFriendRequest \
    --body '{"friendId": "sJkTrd8I"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'UserRejectFriendRequest' test.out

#- 9 UserGetFriendshipStatus
java -jar "${CLI_JAR}" lobby userGetFriendshipStatus \
    --friendId 'DcV2zXnT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'UserGetFriendshipStatus' test.out

#- 10 UserUnfriendRequest
java -jar "${CLI_JAR}" lobby userUnfriendRequest \
    --body '{"friendId": "KjXY1bPq"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'UserUnfriendRequest' test.out

#- 11 AddFriendsWithoutConfirmation
java -jar "${CLI_JAR}" lobby addFriendsWithoutConfirmation \
    --body '{"friendIds": ["amiBxx9C"]}' \
    --namespace "$AB_NAMESPACE" \
    --userId 's18EY84e' \
    > test.out 2>&1
eval_tap $? 11 'AddFriendsWithoutConfirmation' test.out

#- 12 PersonalChatHistory
java -jar "${CLI_JAR}" lobby personalChatHistory \
    --friendId 'kItqRzHU' \
    --namespace "$AB_NAMESPACE" \
    --userId '1oh570KQ' \
    > test.out 2>&1
eval_tap $? 12 'PersonalChatHistory' test.out

#- 13 AdminChatHistory
java -jar "${CLI_JAR}" lobby adminChatHistory \
    --friendId 'BVaewc72' \
    --namespace "$AB_NAMESPACE" \
    --userId 'krSha68n' \
    > test.out 2>&1
eval_tap $? 13 'AdminChatHistory' test.out

#- 14 AdminGetAllConfigV1
java -jar "${CLI_JAR}" lobby adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 14 'AdminGetAllConfigV1' test.out

#- 15 AdminGetConfigV1
java -jar "${CLI_JAR}" lobby adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetConfigV1' test.out

#- 16 AdminUpdateConfigV1
java -jar "${CLI_JAR}" lobby adminUpdateConfigV1 \
    --body '{"allowInviteNonConnectedUser": false, "allowJoinPartyDuringMatchmaking": false, "autoKickOnDisconnect": true, "autoKickOnDisconnectDelay": 31, "cancelTicketOnDisconnect": true, "chatRateLimitBurst": 72, "chatRateLimitDuration": 24, "concurrentUsersLimit": 68, "disableInvitationOnJoinParty": true, "enableChat": true, "entitlementCheck": false, "entitlementItemID": "NEUsxFb8", "generalRateLimitBurst": 56, "generalRateLimitDuration": 70, "keepPresenceActivityOnDisconnect": true, "maxPartyMember": 70, "profanityFilter": false, "readyConsentTimeout": 77}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminUpdateConfigV1' test.out

#- 17 AdminExportConfigV1
java -jar "${CLI_JAR}" lobby adminExportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminExportConfigV1' test.out

#- 18 AdminImportConfigV1
java -jar "${CLI_JAR}" lobby adminImportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminImportConfigV1' test.out

#- 19 GetListOfFriends
java -jar "${CLI_JAR}" lobby getListOfFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'SxECbZby' \
    > test.out 2>&1
eval_tap $? 19 'GetListOfFriends' test.out

#- 20 SendMultipleUsersFreeformNotificationV1Admin
java -jar "${CLI_JAR}" lobby sendMultipleUsersFreeformNotificationV1Admin \
    --body '{"message": "gyoarORo", "topicName": "eNHSb8Rh", "userIds": ["3kgs9qqJ"]}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'SendMultipleUsersFreeformNotificationV1Admin' test.out

#- 21 SendUsersFreeformNotificationV1Admin
java -jar "${CLI_JAR}" lobby sendUsersFreeformNotificationV1Admin \
    --body '{"message": "bnQsoBgi", "topicName": "VpP8Cm3y"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'SendUsersFreeformNotificationV1Admin' test.out

#- 22 SendPartyFreeformNotificationV1Admin
java -jar "${CLI_JAR}" lobby sendPartyFreeformNotificationV1Admin \
    --body '{"message": "vASUoxdx", "topicName": "xFqmAGTJ"}' \
    --namespace "$AB_NAMESPACE" \
    --partyId '8IEdagEt' \
    > test.out 2>&1
eval_tap $? 22 'SendPartyFreeformNotificationV1Admin' test.out

#- 23 SendPartyTemplatedNotificationV1Admin
java -jar "${CLI_JAR}" lobby sendPartyTemplatedNotificationV1Admin \
    --body '{"templateContext": {"p4w29KOu": "9c19R6XD"}, "templateLanguage": "qWHkkP8n", "templateSlug": "pLEKMfji", "topicName": "X7jpkVZk"}' \
    --namespace "$AB_NAMESPACE" \
    --partyId '3IaQYEmq' \
    > test.out 2>&1
eval_tap $? 23 'SendPartyTemplatedNotificationV1Admin' test.out

#- 24 GetAllNotificationTemplatesV1Admin
java -jar "${CLI_JAR}" lobby getAllNotificationTemplatesV1Admin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'GetAllNotificationTemplatesV1Admin' test.out

#- 25 CreateNotificationTemplateV1Admin
java -jar "${CLI_JAR}" lobby createNotificationTemplateV1Admin \
    --body '{"templateContent": "GodOEGt9", "templateLanguage": "gPOj0c6i", "templateSlug": "0JkvIas7"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'CreateNotificationTemplateV1Admin' test.out

#- 26 SendUsersTemplatedNotificationV1Admin
java -jar "${CLI_JAR}" lobby sendUsersTemplatedNotificationV1Admin \
    --body '{"templateContext": {"3ucYnFAJ": "3DK5T4Eo"}, "templateLanguage": "gg0Y39Uo", "templateSlug": "Ylpv5bVA", "topicName": "gtsDhUTD"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SendUsersTemplatedNotificationV1Admin' test.out

#- 27 GetTemplateSlugLocalizationsTemplateV1Admin
java -jar "${CLI_JAR}" lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'UscbQDjb' \
    > test.out 2>&1
eval_tap $? 27 'GetTemplateSlugLocalizationsTemplateV1Admin' test.out

#- 28 DeleteNotificationTemplateSlugV1Admin
java -jar "${CLI_JAR}" lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'TQuPMz2P' \
    > test.out 2>&1
eval_tap $? 28 'DeleteNotificationTemplateSlugV1Admin' test.out

#- 29 GetSingleTemplateLocalizationV1Admin
java -jar "${CLI_JAR}" lobby getSingleTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'TRlkyU89' \
    --templateSlug 'ZPOw6zPF' \
    > test.out 2>&1
eval_tap $? 29 'GetSingleTemplateLocalizationV1Admin' test.out

#- 30 UpdateTemplateLocalizationV1Admin
java -jar "${CLI_JAR}" lobby updateTemplateLocalizationV1Admin \
    --body '{"templateContent": "J42cwmzB"}' \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'BSMNcoAA' \
    --templateSlug 'OjKNjfcY' \
    > test.out 2>&1
eval_tap $? 30 'UpdateTemplateLocalizationV1Admin' test.out

#- 31 DeleteTemplateLocalizationV1Admin
java -jar "${CLI_JAR}" lobby deleteTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'Hm093aYg' \
    --templateSlug 'BU1sqjyK' \
    > test.out 2>&1
eval_tap $? 31 'DeleteTemplateLocalizationV1Admin' test.out

#- 32 PublishTemplateLocalizationV1Admin
java -jar "${CLI_JAR}" lobby publishTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '0XH45PaR' \
    --templateSlug 'SOFQBtu2' \
    > test.out 2>&1
eval_tap $? 32 'PublishTemplateLocalizationV1Admin' test.out

#- 33 GetAllNotificationTopicsV1Admin
java -jar "${CLI_JAR}" lobby getAllNotificationTopicsV1Admin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetAllNotificationTopicsV1Admin' test.out

#- 34 CreateNotificationTopicV1Admin
java -jar "${CLI_JAR}" lobby createNotificationTopicV1Admin \
    --body '{"description": "3REZ8hRV", "topicName": "X7LGOvDd"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'CreateNotificationTopicV1Admin' test.out

#- 35 GetNotificationTopicV1Admin
java -jar "${CLI_JAR}" lobby getNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'YiQS9i7m' \
    > test.out 2>&1
eval_tap $? 35 'GetNotificationTopicV1Admin' test.out

#- 36 UpdateNotificationTopicV1Admin
java -jar "${CLI_JAR}" lobby updateNotificationTopicV1Admin \
    --body '{"description": "V1C91pjG"}' \
    --namespace "$AB_NAMESPACE" \
    --topicName '9gpxL6yc' \
    > test.out 2>&1
eval_tap $? 36 'UpdateNotificationTopicV1Admin' test.out

#- 37 DeleteNotificationTopicV1Admin
java -jar "${CLI_JAR}" lobby deleteNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'TQdvln2L' \
    > test.out 2>&1
eval_tap $? 37 'DeleteNotificationTopicV1Admin' test.out

#- 38 SendSpecificUserFreeformNotificationV1Admin
java -jar "${CLI_JAR}" lobby sendSpecificUserFreeformNotificationV1Admin \
    --body '{"message": "AuSQWEXL", "topicName": "6LFE1YHo"}' \
    --namespace "$AB_NAMESPACE" \
    --userId '9m126ZWc' \
    > test.out 2>&1
eval_tap $? 38 'SendSpecificUserFreeformNotificationV1Admin' test.out

#- 39 SendSpecificUserTemplatedNotificationV1Admin
java -jar "${CLI_JAR}" lobby sendSpecificUserTemplatedNotificationV1Admin \
    --body '{"templateContext": {"8hHtWvbN": "YqgUqslA"}, "templateLanguage": "rFPiHUIv", "templateSlug": "aCv8kU9d", "topicName": "BBpdsJLh"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sVyExrkx' \
    > test.out 2>&1
eval_tap $? 39 'SendSpecificUserTemplatedNotificationV1Admin' test.out

#- 40 AdminGetPartyDataV1
java -jar "${CLI_JAR}" lobby adminGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'oot0B7WO' \
    > test.out 2>&1
eval_tap $? 40 'AdminGetPartyDataV1' test.out

#- 41 AdminUpdatePartyAttributesV1
java -jar "${CLI_JAR}" lobby adminUpdatePartyAttributesV1 \
    --body '{"custom_attribute": {"fercZdpM": {}}, "updatedAt": 5}' \
    --namespace "$AB_NAMESPACE" \
    --partyId 'i37Ds7YS' \
    > test.out 2>&1
eval_tap $? 41 'AdminUpdatePartyAttributesV1' test.out

#- 42 AdminJoinPartyV1
java -jar "${CLI_JAR}" lobby adminJoinPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'fExaI3uz' \
    --userId 'LteMbFAl' \
    > test.out 2>&1
eval_tap $? 42 'AdminJoinPartyV1' test.out

#- 43 AdminGetUserPartyV1
java -jar "${CLI_JAR}" lobby adminGetUserPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 't4hr7HmO' \
    > test.out 2>&1
eval_tap $? 43 'AdminGetUserPartyV1' test.out

#- 44 AdminGetLobbyCCU
java -jar "${CLI_JAR}" lobby adminGetLobbyCCU \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'AdminGetLobbyCCU' test.out

#- 45 AdminGetAllPlayerSessionAttribute
java -jar "${CLI_JAR}" lobby adminGetAllPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'YiBA5ltA' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetAllPlayerSessionAttribute' test.out

#- 46 AdminSetPlayerSessionAttribute
java -jar "${CLI_JAR}" lobby adminSetPlayerSessionAttribute \
    --body '{"attributes": {"OXmlG6eh": "1dTdoTFp"}}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BIcuC1dQ' \
    > test.out 2>&1
eval_tap $? 46 'AdminSetPlayerSessionAttribute' test.out

#- 47 AdminGetPlayerSessionAttribute
java -jar "${CLI_JAR}" lobby adminGetPlayerSessionAttribute \
    --attribute 'Y93OJnJ6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Te9vD8ld' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerSessionAttribute' test.out

#- 48 AdminGetPlayerBlockedPlayersV1
java -jar "${CLI_JAR}" lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'z7Hu8AD7' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetPlayerBlockedPlayersV1' test.out

#- 49 AdminGetPlayerBlockedByPlayersV1
java -jar "${CLI_JAR}" lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '9kdWunvi' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetPlayerBlockedByPlayersV1' test.out

#- 50 AdminBulkBlockPlayersV1
java -jar "${CLI_JAR}" lobby adminBulkBlockPlayersV1 \
    --body '{"listBlockedUserId": ["zU0q1pHy"]}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hhERoGgd' \
    > test.out 2>&1
eval_tap $? 50 'AdminBulkBlockPlayersV1' test.out

#- 51 AdminDebugProfanityFilters
java -jar "${CLI_JAR}" lobby adminDebugProfanityFilters \
    --body '{"text": "rysMizBG"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'AdminDebugProfanityFilters' test.out

#- 52 AdminGetProfanityListFiltersV1
java -jar "${CLI_JAR}" lobby adminGetProfanityListFiltersV1 \
    --list 'SRdP2l7D' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'AdminGetProfanityListFiltersV1' test.out

#- 53 AdminAddProfanityFilterIntoList
java -jar "${CLI_JAR}" lobby adminAddProfanityFilterIntoList \
    --body '{"filter": "NSZ8Aq0X", "note": "iPLQXSe0"}' \
    --list '7ZddOGTM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'AdminAddProfanityFilterIntoList' test.out

#- 54 AdminAddProfanityFilters
java -jar "${CLI_JAR}" lobby adminAddProfanityFilters \
    --body '{"filters": [{"filter": "lJjBwj9H", "note": "JHQKseEd"}]}' \
    --list 'SXRDSvgu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'AdminAddProfanityFilters' test.out

#- 55 AdminImportProfanityFiltersFromFile
java -jar "${CLI_JAR}" lobby adminImportProfanityFiltersFromFile \
    --body '[0]' \
    --list 'uw1xT7eM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AdminImportProfanityFiltersFromFile' test.out

#- 56 AdminDeleteProfanityFilter
java -jar "${CLI_JAR}" lobby adminDeleteProfanityFilter \
    --body '{"filter": "wSl9MLH0"}' \
    --list 'NnTJ2ulN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteProfanityFilter' test.out

#- 57 AdminGetProfanityLists
java -jar "${CLI_JAR}" lobby adminGetProfanityLists \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'AdminGetProfanityLists' test.out

#- 58 AdminCreateProfanityList
java -jar "${CLI_JAR}" lobby adminCreateProfanityList \
    --body '{"isEnabled": true, "isMandatory": true, "name": "vwJaQa54"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AdminCreateProfanityList' test.out

#- 59 AdminUpdateProfanityList
java -jar "${CLI_JAR}" lobby adminUpdateProfanityList \
    --body '{"isEnabled": false, "isMandatory": false, "newName": "vA8RWSpa"}' \
    --list 'bUt7xk6Q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'AdminUpdateProfanityList' test.out

#- 60 AdminDeleteProfanityList
java -jar "${CLI_JAR}" lobby adminDeleteProfanityList \
    --list 'xyWhfqoW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'AdminDeleteProfanityList' test.out

#- 61 AdminGetProfanityRule
java -jar "${CLI_JAR}" lobby adminGetProfanityRule \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'AdminGetProfanityRule' test.out

#- 62 AdminSetProfanityRuleForNamespace
java -jar "${CLI_JAR}" lobby adminSetProfanityRuleForNamespace \
    --body '{"rule": "fJw2o8oW"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'AdminSetProfanityRuleForNamespace' test.out

#- 63 AdminVerifyMessageProfanityResponse
java -jar "${CLI_JAR}" lobby adminVerifyMessageProfanityResponse \
    --body '{"message": "UqvPCZ2H", "profanityLevel": "zT7NXmWD"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'AdminVerifyMessageProfanityResponse' test.out

#- 64 AdminGetThirdPartyConfig
java -jar "${CLI_JAR}" lobby adminGetThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'AdminGetThirdPartyConfig' test.out

#- 65 AdminUpdateThirdPartyConfig
java -jar "${CLI_JAR}" lobby adminUpdateThirdPartyConfig \
    --body '{"apiKey": "lXsuNIdQ"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AdminUpdateThirdPartyConfig' test.out

#- 66 AdminCreateThirdPartyConfig
java -jar "${CLI_JAR}" lobby adminCreateThirdPartyConfig \
    --body '{"apiKey": "JR5lsNOl"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'AdminCreateThirdPartyConfig' test.out

#- 67 AdminDeleteThirdPartyConfig
java -jar "${CLI_JAR}" lobby adminDeleteThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'AdminDeleteThirdPartyConfig' test.out

#- 68 PublicGetMessages
java -jar "${CLI_JAR}" lobby publicGetMessages \
    > test.out 2>&1
eval_tap $? 68 'PublicGetMessages' test.out

#- 69 GetPersonalChatHistoryV1Public
java -jar "${CLI_JAR}" lobby getPersonalChatHistoryV1Public \
    --friendId 'vkfwaSbn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'GetPersonalChatHistoryV1Public' test.out

#- 70 PublicGetPartyDataV1
java -jar "${CLI_JAR}" lobby publicGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'suLCgTox' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetPartyDataV1' test.out

#- 71 PublicUpdatePartyAttributesV1
java -jar "${CLI_JAR}" lobby publicUpdatePartyAttributesV1 \
    --body '{"custom_attribute": {"uVTekJgv": {}}, "updatedAt": 13}' \
    --namespace "$AB_NAMESPACE" \
    --partyId '6h5HIpH0' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdatePartyAttributesV1' test.out

#- 72 PublicGetPlayerBlockedPlayersV1
java -jar "${CLI_JAR}" lobby publicGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'PublicGetPlayerBlockedPlayersV1' test.out

#- 73 PublicGetPlayerBlockedByPlayersV1
java -jar "${CLI_JAR}" lobby publicGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'PublicGetPlayerBlockedByPlayersV1' test.out

#- 74 UsersPresenceHandlerV1
java -jar "${CLI_JAR}" lobby usersPresenceHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userIds 'DviplEk4' \
    > test.out 2>&1
eval_tap $? 74 'UsersPresenceHandlerV1' test.out

#- 75 FreeFormNotification
java -jar "${CLI_JAR}" lobby freeFormNotification \
    --body '{"message": "vj3LDp4y", "topic": "qDt8QUZD"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'FreeFormNotification' test.out

#- 76 NotificationWithTemplate
java -jar "${CLI_JAR}" lobby notificationWithTemplate \
    --body '{"templateContext": {"pxlHasin": "GcjrkmRM"}, "templateLanguage": "ttgjDSaI", "templateSlug": "VBmft3Ud", "topic": "g7p9PGmY"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'NotificationWithTemplate' test.out

#- 77 GetGameTemplate
java -jar "${CLI_JAR}" lobby getGameTemplate \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'GetGameTemplate' test.out

#- 78 CreateTemplate
java -jar "${CLI_JAR}" lobby createTemplate \
    --body '{"templateContent": "2H5kX4Ms", "templateLanguage": "isSX28nA", "templateSlug": "RxWRpv5o"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'CreateTemplate' test.out

#- 79 GetSlugTemplate
java -jar "${CLI_JAR}" lobby getSlugTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'u5xtvd28' \
    > test.out 2>&1
eval_tap $? 79 'GetSlugTemplate' test.out

#- 80 DeleteTemplateSlug
java -jar "${CLI_JAR}" lobby deleteTemplateSlug \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'OUfCt8UJ' \
    > test.out 2>&1
eval_tap $? 80 'DeleteTemplateSlug' test.out

#- 81 GetLocalizationTemplate
java -jar "${CLI_JAR}" lobby getLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'C5flNyj6' \
    --templateSlug 'HsTtX8P3' \
    > test.out 2>&1
eval_tap $? 81 'GetLocalizationTemplate' test.out

#- 82 UpdateLocalizationTemplate
java -jar "${CLI_JAR}" lobby updateLocalizationTemplate \
    --body '{"templateContent": "llnaaS9l"}' \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'qyygPcfk' \
    --templateSlug 'JIxfQZza' \
    > test.out 2>&1
eval_tap $? 82 'UpdateLocalizationTemplate' test.out

#- 83 DeleteTemplateLocalization
java -jar "${CLI_JAR}" lobby deleteTemplateLocalization \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '8kNVbDxV' \
    --templateSlug 'Mq7HJk0F' \
    > test.out 2>&1
eval_tap $? 83 'DeleteTemplateLocalization' test.out

#- 84 PublishTemplate
java -jar "${CLI_JAR}" lobby publishTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '89xAc3YV' \
    --templateSlug 'faENtrl0' \
    > test.out 2>&1
eval_tap $? 84 'PublishTemplate' test.out

#- 85 GetTopicByNamespace
java -jar "${CLI_JAR}" lobby getTopicByNamespace \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'GetTopicByNamespace' test.out

#- 86 CreateTopic
java -jar "${CLI_JAR}" lobby createTopic \
    --body '{"description": "pTKZTXqz", "topic": "HuBMYQSA"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 86 'CreateTopic' test.out

#- 87 GetTopicByTopicName
java -jar "${CLI_JAR}" lobby getTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic '2jz1ZOpd' \
    > test.out 2>&1
eval_tap $? 87 'GetTopicByTopicName' test.out

#- 88 UpdateTopicByTopicName
java -jar "${CLI_JAR}" lobby updateTopicByTopicName \
    --body '{"description": "OjSyMddB"}' \
    --namespace "$AB_NAMESPACE" \
    --topic '41JuMf7R' \
    > test.out 2>&1
eval_tap $? 88 'UpdateTopicByTopicName' test.out

#- 89 DeleteTopicByTopicName
java -jar "${CLI_JAR}" lobby deleteTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'UyBHRj8I' \
    > test.out 2>&1
eval_tap $? 89 'DeleteTopicByTopicName' test.out

#- 90 FreeFormNotificationByUserID
java -jar "${CLI_JAR}" lobby freeFormNotificationByUserID \
    --body '{"message": "iRimRllH", "topic": "T6Dc40vF"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FA6gpU7E' \
    > test.out 2>&1
eval_tap $? 90 'FreeFormNotificationByUserID' test.out

#- 91 NotificationWithTemplateByUserID
java -jar "${CLI_JAR}" lobby notificationWithTemplateByUserID \
    --body '{"templateContext": {"W3x1dCpm": "55gOeqQI"}, "templateLanguage": "qcJVKmBM", "templateSlug": "1J1IbuTr", "topic": "rkbmuT1w"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hOqmEnDX' \
    > test.out 2>&1
eval_tap $? 91 'NotificationWithTemplateByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE