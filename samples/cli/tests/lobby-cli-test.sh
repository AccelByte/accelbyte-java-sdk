#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

# Code generated. DO NOT EDIT.

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

chmod +x ./ng
trap "./ng ng-stop" EXIT
java -jar build/install/cli/lib/nailgun-server-*.jar 1>&2 &
(for i in $(seq 1 100); do bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/2113" 2>/dev/null && exit 0 || sleep 1; done; exit 1) || exit 1
for JAR in build/install/cli/lib/*.jar; do ./ng ng-cp $JAR 1>&2; done
./ng ng-cp 1>&2

echo "TAP version 13"
echo "1..97"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetUserFriendsUpdated
./ng net.accelbyte.sdk.cli.Main lobby getUserFriendsUpdated \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 2 'GetUserFriendsUpdated' test.out

#- 3 GetUserIncomingFriends
./ng net.accelbyte.sdk.cli.Main lobby getUserIncomingFriends \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 3 'GetUserIncomingFriends' test.out

#- 4 GetUserIncomingFriendsWithTime
./ng net.accelbyte.sdk.cli.Main lobby getUserIncomingFriendsWithTime \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 4 'GetUserIncomingFriendsWithTime' test.out

#- 5 GetUserOutgoingFriends
./ng net.accelbyte.sdk.cli.Main lobby getUserOutgoingFriends \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 5 'GetUserOutgoingFriends' test.out

#- 6 GetUserOutgoingFriendsWithTime
./ng net.accelbyte.sdk.cli.Main lobby getUserOutgoingFriendsWithTime \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 6 'GetUserOutgoingFriendsWithTime' test.out

#- 7 GetUserFriendsWithPlatform
./ng net.accelbyte.sdk.cli.Main lobby getUserFriendsWithPlatform \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 7 'GetUserFriendsWithPlatform' test.out

#- 8 UserRequestFriend
./ng net.accelbyte.sdk.cli.Main lobby userRequestFriend \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "rttufHIRdH9UzVRi", "friendPublicId": "XbqlAw7r6W2ktQG0"}' \
    > test.out 2>&1
eval_tap $? 8 'UserRequestFriend' test.out

#- 9 UserAcceptFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userAcceptFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "h5JAav5kRa62WopB"}' \
    > test.out 2>&1
eval_tap $? 9 'UserAcceptFriendRequest' test.out

#- 10 UserCancelFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userCancelFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "JHPtcDs8bBZLCXLx"}' \
    > test.out 2>&1
eval_tap $? 10 'UserCancelFriendRequest' test.out

#- 11 UserRejectFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userRejectFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "8bbgorQeFbQ1g7qb"}' \
    > test.out 2>&1
eval_tap $? 11 'UserRejectFriendRequest' test.out

#- 12 UserGetFriendshipStatus
./ng net.accelbyte.sdk.cli.Main lobby userGetFriendshipStatus \
    --friendId 'PngUNB1vRodwpzS6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'UserGetFriendshipStatus' test.out

#- 13 UserUnfriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userUnfriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "DaDpv8N7ZQVqGj6o"}' \
    > test.out 2>&1
eval_tap $? 13 'UserUnfriendRequest' test.out

#- 14 AddFriendsWithoutConfirmation
./ng net.accelbyte.sdk.cli.Main lobby addFriendsWithoutConfirmation \
    --namespace "$AB_NAMESPACE" \
    --userId 'DLjWjkY1aXlFcDtg' \
    --body '{"friendIds": ["OjchIua5tWEIC32o", "gW7olvbTgrhRTcPi", "SuL0Sly6XM4OI18m"]}' \
    > test.out 2>&1
eval_tap $? 14 'AddFriendsWithoutConfirmation' test.out

#- 15 BulkDeleteFriends
./ng net.accelbyte.sdk.cli.Main lobby bulkDeleteFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'AQLnzjMf8GZ2WBZq' \
    --body '{"friendIds": ["xYG3aREAu2D6QVKN", "CWP75TB0i7pKxR8d", "l0zRVW4EZG9m0Xcg"]}' \
    > test.out 2>&1
eval_tap $? 15 'BulkDeleteFriends' test.out

#- 16 SyncNativeFriends
./ng net.accelbyte.sdk.cli.Main lobby syncNativeFriends \
    --namespace "$AB_NAMESPACE" \
    --body '[{"isLogin": true, "platformId": "VbMqSszE8GHavj7A", "platformToken": "orKsxwkosAVerXpc", "psnEnv": "1C8XfwHuKeb9l3rG"}, {"isLogin": false, "platformId": "A3sNm84hddSpHt0P", "platformToken": "7MIIR7CkyF6C7duu", "psnEnv": "yZ0GhDogqrhBRd8l"}, {"isLogin": true, "platformId": "MYzYiKWe5dNRljv7", "platformToken": "IPrDQQRgat0SevkL", "psnEnv": "GMS0lyuI9a2I9u6V"}]' \
    > test.out 2>&1
eval_tap $? 16 'SyncNativeFriends' test.out

#- 17 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigV1' test.out

#- 18 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigV1' test.out

#- 19 AdminUpdateConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowInviteNonConnectedUser": false, "allowJoinPartyDuringMatchmaking": false, "autoKickOnDisconnect": false, "autoKickOnDisconnectDelay": 93, "cancelTicketOnDisconnect": true, "chatRateLimitBurst": 47, "chatRateLimitDuration": 21, "concurrentUsersLimit": 85, "disableInvitationOnJoinParty": true, "enableChat": true, "entitlementCheck": false, "entitlementItemID": "fofvnnSuB0y5WUlr", "generalRateLimitBurst": 79, "generalRateLimitDuration": 69, "keepPresenceActivityOnDisconnect": false, "maxDSWaitTime": 84, "maxFriendsLimit": 71, "maxPartyMember": 86, "profanityFilter": false, "readyConsentTimeout": 37, "unregisterDelay": 78}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigV1' test.out

#- 20 AdminExportConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminExportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminExportConfigV1' test.out

#- 21 AdminImportConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminImportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'AdminImportConfigV1' test.out

#- 22 GetListOfFriends
./ng net.accelbyte.sdk.cli.Main lobby getListOfFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'NveabntBSxTeIv53' \
    --friendId 'HGCiljvjKoyD6SCw' \
    --limit '67' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 22 'GetListOfFriends' test.out

#- 23 GetIncomingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getIncomingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'rncqmLtjQHAf8Tgo' \
    --friendId 'Nm03VLisV6zwPuo3' \
    --limit '39' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 23 'GetIncomingFriendRequests' test.out

#- 24 GetOutgoingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getOutgoingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'd6TC6I3lMjGSWN2l' \
    --limit '0' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 24 'GetOutgoingFriendRequests' test.out

#- 25 SendMultipleUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendMultipleUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "RlxfcjHfYakUCTqG", "topicName": "kE7wcWfDslpJSqGA", "userIds": ["XQ0yYoNRKd3IL5TA", "Q6iiPlSC2uE4o5Vw", "do3fePqIJA8IHtrk"]}' \
    > test.out 2>&1
eval_tap $? 25 'SendMultipleUsersFreeformNotificationV1Admin' test.out

#- 26 SendUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "mu0hpDDWVAla2l5B", "topicName": "YNtIuS5S5XUdjsoq"}' \
    > test.out 2>&1
eval_tap $? 26 'SendUsersFreeformNotificationV1Admin' test.out

#- 27 SendPartyFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'wGyzzWi9gwQYv7t1' \
    --body '{"message": "o7TTr1DmrhZv15T7", "topicName": "quIOvBMcaYmvCkGZ"}' \
    > test.out 2>&1
eval_tap $? 27 'SendPartyFreeformNotificationV1Admin' test.out

#- 28 SendPartyTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId '5dAgqxpBFmaLoxoz' \
    --body '{"templateContext": {"r6wfNPX2bOItRMvq": "tlB2jJCSQT279ZZP", "YGu0rdlgdWyOtXi3": "choQrpOsDBU5Sepj", "ChB3V0v52Dlym6pu": "Q23xoJ8aeCnaLpUK"}, "templateLanguage": "p44YUDjasWIPUvmE", "templateSlug": "ejtGeoyIPa8ZRrvj", "topicName": "j7il35MXbN9oCMNq"}' \
    > test.out 2>&1
eval_tap $? 28 'SendPartyTemplatedNotificationV1Admin' test.out

#- 29 GetAllNotificationTemplatesV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTemplatesV1Admin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetAllNotificationTemplatesV1Admin' test.out

#- 30 CreateNotificationTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "q98SjTvhZNkSQ70D", "templateLanguage": "0H6BXksUC9b6i5lZ", "templateSlug": "C9xv32e8c5csSovo"}' \
    > test.out 2>&1
eval_tap $? 30 'CreateNotificationTemplateV1Admin' test.out

#- 31 SendUsersTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"qsZNBdte9NDUPVJf": "6c2Z0QZxfgPubTDI", "HrvqAThuwjRHpKKT": "lmVr9XuoJbRFQSKV", "PHbn4Xxtu7LQRENj": "EEztx1WsYSiZqan0"}, "templateLanguage": "nSBJroav91GXlvPG", "templateSlug": "6bFYReVHQipcCx9Z", "topicName": "w5D2L7vIYhGGSyEW"}' \
    > test.out 2>&1
eval_tap $? 31 'SendUsersTemplatedNotificationV1Admin' test.out

#- 32 GetTemplateSlugLocalizationsTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug '4ZJJ42d3PBddN8S4' \
    --after '8l9lyNApflxqMrj3' \
    --before 'oZk03QXcKMDYDDxH' \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 32 'GetTemplateSlugLocalizationsTemplateV1Admin' test.out

#- 33 DeleteNotificationTemplateSlugV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'OMlNFSrUEirnjX9f' \
    > test.out 2>&1
eval_tap $? 33 'DeleteNotificationTemplateSlugV1Admin' test.out

#- 34 GetSingleTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getSingleTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'DmIbeZxzfTcyiuAT' \
    --templateSlug 'us9hsfpFDcSDG8aM' \
    > test.out 2>&1
eval_tap $? 34 'GetSingleTemplateLocalizationV1Admin' test.out

#- 35 UpdateTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'VGLiBNrDjqoxcwgG' \
    --templateSlug 'LXpUL4pp2ncYAHdN' \
    --body '{"templateContent": "zDmeIP6rOvDz9KOs"}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateTemplateLocalizationV1Admin' test.out

#- 36 DeleteTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'b392k6YmJFfRByjl' \
    --templateSlug 'BiuFM3FIoVk8T3Gp' \
    > test.out 2>&1
eval_tap $? 36 'DeleteTemplateLocalizationV1Admin' test.out

#- 37 PublishTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby publishTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'AnkCmBUqg2SCnqnt' \
    --templateSlug 'X9y1aZSWMiVi10sG' \
    > test.out 2>&1
eval_tap $? 37 'PublishTemplateLocalizationV1Admin' test.out

#- 38 GetAllNotificationTopicsV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTopicsV1Admin \
    --namespace "$AB_NAMESPACE" \
    --after '6vxkfUcmqRRbceJ5' \
    --before 'i0EeDxOgBnhhqElI' \
    --limit '0' \
    > test.out 2>&1
eval_tap $? 38 'GetAllNotificationTopicsV1Admin' test.out

#- 39 CreateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "8KlloeH0JT1yduat", "topicName": "2vQR3biBfsu4jmsR"}' \
    > test.out 2>&1
eval_tap $? 39 'CreateNotificationTopicV1Admin' test.out

#- 40 GetNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'E2w1yEkLgh3tIYt4' \
    > test.out 2>&1
eval_tap $? 40 'GetNotificationTopicV1Admin' test.out

#- 41 UpdateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'SqYUTLDx9gIiDand' \
    --body '{"description": "pGT2t24aOMh5eC3I"}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateNotificationTopicV1Admin' test.out

#- 42 DeleteNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'HeHSKLCa3xreNDUW' \
    > test.out 2>&1
eval_tap $? 42 'DeleteNotificationTopicV1Admin' test.out

#- 43 SendSpecificUserFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'ehwH3q31A806DJga' \
    --body '{"message": "s4b6z3LNUj7fdgLA", "topicName": "84Z8YYk6QEgJjBbE"}' \
    > test.out 2>&1
eval_tap $? 43 'SendSpecificUserFreeformNotificationV1Admin' test.out

#- 44 SendSpecificUserTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'DoNf3n0hEoRCAcf8' \
    --body '{"templateContext": {"0zfFyabWAgIUXiI0": "7A68eaqC2J9jyEW6", "GLbc0NaKDUL3sa13": "lk1dQBHO86IlBhne", "tU4RwTqUXlTDBzOu": "YsaZA2yyd4mbqoOf"}, "templateLanguage": "ADMMAXFaY9eKa699", "templateSlug": "bRVhyaKwwrAP2aMl", "topicName": "u7WtjCtoYetOO847"}' \
    > test.out 2>&1
eval_tap $? 44 'SendSpecificUserTemplatedNotificationV1Admin' test.out

#- 45 AdminGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'g8OudOfjnCuHZ3c4' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetPartyDataV1' test.out

#- 46 AdminUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId '6IjGa23YvYmmDg7V' \
    --body '{"custom_attribute": {"YPXIuvUYTZBRujIU": {}, "E1Tq5jyAZvkRCMNF": {}, "Iurjh2imdb4rbkXj": {}}, "updatedAt": 10}' \
    > test.out 2>&1
eval_tap $? 46 'AdminUpdatePartyAttributesV1' test.out

#- 47 AdminJoinPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminJoinPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ZwsVC0gL97ZVJSPq' \
    --userId 'Jiwv1qlYB1RSKs6g' \
    > test.out 2>&1
eval_tap $? 47 'AdminJoinPartyV1' test.out

#- 48 AdminGetUserPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetUserPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QxC3Gb7S0o4zGYY7' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserPartyV1' test.out

#- 49 AdminGetLobbyCCU
./ng net.accelbyte.sdk.cli.Main lobby adminGetLobbyCCU \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'AdminGetLobbyCCU' test.out

#- 50 AdminGetBulkPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetBulkPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listBlockedUserId": ["KQI1AeFgPqaOkvo1", "aolB4lkKB4EYOkQ1", "jMD3cym8xIfkOVW2"]}' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetBulkPlayerBlockedPlayersV1' test.out

#- 51 AdminGetAllPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'grREOLx0KOww3HIC' \
    > test.out 2>&1
eval_tap $? 51 'AdminGetAllPlayerSessionAttribute' test.out

#- 52 AdminSetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminSetPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'QLfl7MUBG7qtPu64' \
    --body '{"attributes": {"yAtURKLRkb738HGS": "6rDgMdIIlhS1fSiM", "9331m7Ta1PsKc50K": "v6ecnEevcAx2K2zk", "RenmPZnGBt4P7Wnb": "dSJtjX7ZshZyZl5x"}}' \
    > test.out 2>&1
eval_tap $? 52 'AdminSetPlayerSessionAttribute' test.out

#- 53 AdminGetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerSessionAttribute \
    --attribute '4bRXBHUTrDzZSKsc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fOcYu3dpCROYqUiG' \
    > test.out 2>&1
eval_tap $? 53 'AdminGetPlayerSessionAttribute' test.out

#- 54 AdminGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KXVFCmpo6sPwVOED' \
    > test.out 2>&1
eval_tap $? 54 'AdminGetPlayerBlockedPlayersV1' test.out

#- 55 AdminGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SJsEK5QpNhlI2iS5' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetPlayerBlockedByPlayersV1' test.out

#- 56 AdminBulkBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EpGhhvXYck0upMzU' \
    --body '{"listBlockedUserId": ["Ynb76tFkEORV3bu1", "bNCtX7W40V6Do5sY", "adCCFrHHC3DpZxkr"]}' \
    > test.out 2>&1
eval_tap $? 56 'AdminBulkBlockPlayersV1' test.out

#- 57 AdminDebugProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminDebugProfanityFilters \
    --namespace "$AB_NAMESPACE" \
    --body '{"text": "QDXuNFviMarv8mnf"}' \
    > test.out 2>&1
eval_tap $? 57 'AdminDebugProfanityFilters' test.out

#- 58 AdminGetProfanityListFiltersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityListFiltersV1 \
    --list 'HK8CCmE2lPnsbD3S' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'AdminGetProfanityListFiltersV1' test.out

#- 59 AdminAddProfanityFilterIntoList
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilterIntoList \
    --list 'GEdlwuUccE536ugB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "p3HBvepnDCjgyJlX", "note": "e36mgWjLfFmteue9"}' \
    > test.out 2>&1
eval_tap $? 59 'AdminAddProfanityFilterIntoList' test.out

#- 60 AdminAddProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilters \
    --list 'nzJ6fH24T805tVg8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filters": [{"filter": "JqU0jZpjvsugAOS7", "note": "u8RiWyerCSa8SRgw"}, {"filter": "sAj1ik1jglaDXTvK", "note": "CWwNTAhd2wrS0uPd"}, {"filter": "jhdinpng5BLy8wbh", "note": "MssAHjapIkY9Rf4w"}]}' \
    > test.out 2>&1
eval_tap $? 60 'AdminAddProfanityFilters' test.out

#- 61 AdminImportProfanityFiltersFromFile
./ng net.accelbyte.sdk.cli.Main lobby adminImportProfanityFiltersFromFile \
    --list 'P57dBZNR88YbCtmK' \
    --namespace "$AB_NAMESPACE" \
    --body '[50, 82, 27]' \
    > test.out 2>&1
eval_tap $? 61 'AdminImportProfanityFiltersFromFile' test.out

#- 62 AdminDeleteProfanityFilter
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityFilter \
    --list 'M9zVrjfGXZnqAQUo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "Y1GjlIIk0iKoTTS1"}' \
    > test.out 2>&1
eval_tap $? 62 'AdminDeleteProfanityFilter' test.out

#- 63 AdminGetProfanityLists
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityLists \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'AdminGetProfanityLists' test.out

#- 64 AdminCreateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminCreateProfanityList \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": false, "isMandatory": false, "name": "YcmQbTU5JX8ccLjM"}' \
    > test.out 2>&1
eval_tap $? 64 'AdminCreateProfanityList' test.out

#- 65 AdminUpdateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateProfanityList \
    --list 'XJRk0eaKQDOJvrTe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": false, "isMandatory": false, "newName": "KlONk2Q5Y4Jvaizw"}' \
    > test.out 2>&1
eval_tap $? 65 'AdminUpdateProfanityList' test.out

#- 66 AdminDeleteProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityList \
    --list 'iilatuUjjt9lIMGq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'AdminDeleteProfanityList' test.out

#- 67 AdminGetProfanityRule
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityRule \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'AdminGetProfanityRule' test.out

#- 68 AdminSetProfanityRuleForNamespace
./ng net.accelbyte.sdk.cli.Main lobby adminSetProfanityRuleForNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"rule": "l5ElEa9EIIlGcHB3"}' \
    > test.out 2>&1
eval_tap $? 68 'AdminSetProfanityRuleForNamespace' test.out

#- 69 AdminVerifyMessageProfanityResponse
./ng net.accelbyte.sdk.cli.Main lobby adminVerifyMessageProfanityResponse \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "CfR3ncDlwi3v3MFF", "profanityLevel": "J1KesKoELCpobBEG"}' \
    > test.out 2>&1
eval_tap $? 69 'AdminVerifyMessageProfanityResponse' test.out

#- 70 AdminGetThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'AdminGetThirdPartyConfig' test.out

#- 71 AdminUpdateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "8X645xpdXpai0rYa"}' \
    > test.out 2>&1
eval_tap $? 71 'AdminUpdateThirdPartyConfig' test.out

#- 72 AdminCreateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminCreateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "T5hOPjaf3H0tYigh"}' \
    > test.out 2>&1
eval_tap $? 72 'AdminCreateThirdPartyConfig' test.out

#- 73 AdminDeleteThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'AdminDeleteThirdPartyConfig' test.out

#- 74 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main lobby publicGetMessages \
    > test.out 2>&1
eval_tap $? 74 'PublicGetMessages' test.out

#- 75 PublicGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'U0VUfcYHJbBfAKSi' \
    > test.out 2>&1
eval_tap $? 75 'PublicGetPartyDataV1' test.out

#- 76 PublicUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby publicUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'PW3VgsZXiR1DJ7HV' \
    --body '{"custom_attribute": {"WqMkNSawQUWDFJvJ": {}, "BWic7UkBeIXuqDuA": {}, "XI66bQ71w0deoV9L": {}}, "updatedAt": 48}' \
    > test.out 2>&1
eval_tap $? 76 'PublicUpdatePartyAttributesV1' test.out

#- 77 PublicSetPartyLimitV1
./ng net.accelbyte.sdk.cli.Main lobby publicSetPartyLimitV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId '6BqPg4xr0lCancUZ' \
    --body '{"limit": 66}' \
    > test.out 2>&1
eval_tap $? 77 'PublicSetPartyLimitV1' test.out

#- 78 PublicGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'PublicGetPlayerBlockedPlayersV1' test.out

#- 79 PublicGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'PublicGetPlayerBlockedByPlayersV1' test.out

#- 80 UsersPresenceHandlerV1
./ng net.accelbyte.sdk.cli.Main lobby usersPresenceHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --countOnly  \
    --userIds 'vSZIPkhSgORcz5S5' \
    > test.out 2>&1
eval_tap $? 80 'UsersPresenceHandlerV1' test.out

#- 81 FreeFormNotification
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotification \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "BvmgBLxh4ijFnE3T", "topic": "am69qSZ7PC6f6Qkm"}' \
    > test.out 2>&1
eval_tap $? 81 'FreeFormNotification' test.out

#- 82 NotificationWithTemplate
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"ZXElW9YfRSse6AAz": "3S4czz0QKFlAVmVL", "u4AOec0z8eBeeoip": "68J1nsv4W2OJhtaf", "xMSJlHeb34sZKHcl": "5LLLOexL4fZvWtND"}, "templateLanguage": "2tcBFpX8lNtFEJ7t", "templateSlug": "nkY6Mca5afj12K2I", "topic": "zrBvvWm4udE0OXud"}' \
    > test.out 2>&1
eval_tap $? 82 'NotificationWithTemplate' test.out

#- 83 GetGameTemplate
./ng net.accelbyte.sdk.cli.Main lobby getGameTemplate \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'GetGameTemplate' test.out

#- 84 CreateTemplate
./ng net.accelbyte.sdk.cli.Main lobby createTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "XgNne8kJATwlc6es", "templateLanguage": "Up6Sw1I98jeZQ7hf", "templateSlug": "xnhLd3Knaknoed9D"}' \
    > test.out 2>&1
eval_tap $? 84 'CreateTemplate' test.out

#- 85 GetSlugTemplate
./ng net.accelbyte.sdk.cli.Main lobby getSlugTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'HhLOqQGhCUr6iTrj' \
    --after 'yEgarAdNJOIG36I6' \
    --before 'tRbRcrEveMdAdiPK' \
    --limit '61' \
    > test.out 2>&1
eval_tap $? 85 'GetSlugTemplate' test.out

#- 86 DeleteTemplateSlug
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateSlug \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'yTlUrwDTnoujQD4I' \
    > test.out 2>&1
eval_tap $? 86 'DeleteTemplateSlug' test.out

#- 87 GetLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby getLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'EiH9Z5qXn3aoRtlq' \
    --templateSlug 'OECohViHA5CzgFSy' \
    > test.out 2>&1
eval_tap $? 87 'GetLocalizationTemplate' test.out

#- 88 UpdateLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby updateLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '8X1A3PrIfapq5AAe' \
    --templateSlug 'Me4L3mDWORBVXTII' \
    --body '{"templateContent": "JM9XsYIIZxiXNMR9"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateLocalizationTemplate' test.out

#- 89 DeleteTemplateLocalization
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalization \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'BgaWcFX3SUBhyoTs' \
    --templateSlug 'MWPAxUMkawaGpAyr' \
    > test.out 2>&1
eval_tap $? 89 'DeleteTemplateLocalization' test.out

#- 90 PublishTemplate
./ng net.accelbyte.sdk.cli.Main lobby publishTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'IwMif3BOdkocVTd4' \
    --templateSlug 'BxqGWV6mTJ0sQs6X' \
    > test.out 2>&1
eval_tap $? 90 'PublishTemplate' test.out

#- 91 GetTopicByNamespace
./ng net.accelbyte.sdk.cli.Main lobby getTopicByNamespace \
    --namespace "$AB_NAMESPACE" \
    --after 'NbjvqhnUVLWu8olK' \
    --before 'dxL6ozRmDD0jJvlf' \
    --limit '98' \
    > test.out 2>&1
eval_tap $? 91 'GetTopicByNamespace' test.out

#- 92 CreateTopic
./ng net.accelbyte.sdk.cli.Main lobby createTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "PBom8F9GLLTG8phc", "topic": "3n4iLoIllKlpO2pq"}' \
    > test.out 2>&1
eval_tap $? 92 'CreateTopic' test.out

#- 93 GetTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby getTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'iXJF3WGRaoQomSJC' \
    > test.out 2>&1
eval_tap $? 93 'GetTopicByTopicName' test.out

#- 94 UpdateTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby updateTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic '4DdrKF7SUQPLG59e' \
    --body '{"description": "0k5ZtX6wK7PpUlcI"}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateTopicByTopicName' test.out

#- 95 DeleteTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby deleteTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'W32iK7MGt1ixY5rA' \
    > test.out 2>&1
eval_tap $? 95 'DeleteTopicByTopicName' test.out

#- 96 FreeFormNotificationByUserID
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotificationByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId '1WoVeJIePF8ZrQzP' \
    --body '{"message": "4zvtdxdbZUpd6FJt", "topic": "HJ1pyVwyKQLY6FEO"}' \
    > test.out 2>&1
eval_tap $? 96 'FreeFormNotificationByUserID' test.out

#- 97 NotificationWithTemplateByUserID
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplateByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId '65Rb3z7CYLM8IlsH' \
    --body '{"templateContext": {"qffnrfsGlfPaZKBw": "a3Ddb60ufPpzwj1Q", "GIFmlVf4jvapseE9": "LN9bvhOrHflIOd6X", "3viLvtEk4mTIpUA9": "gxo8SV38nEhoXmM2"}, "templateLanguage": "W7l6jHMA2rG3nako", "templateSlug": "pAywelu01nryEJ0N", "topic": "qoTow0qiOiC4j0ik"}' \
    > test.out 2>&1
eval_tap $? 97 'NotificationWithTemplateByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE