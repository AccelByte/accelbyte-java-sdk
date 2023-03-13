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
echo "1..94"

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
    > test.out 2>&1
eval_tap $? 3 'GetUserIncomingFriends' test.out

#- 4 GetUserIncomingFriendsWithTime
./ng net.accelbyte.sdk.cli.Main lobby getUserIncomingFriendsWithTime \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'GetUserIncomingFriendsWithTime' test.out

#- 5 GetUserOutgoingFriends
./ng net.accelbyte.sdk.cli.Main lobby getUserOutgoingFriends \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetUserOutgoingFriends' test.out

#- 6 GetUserOutgoingFriendsWithTime
./ng net.accelbyte.sdk.cli.Main lobby getUserOutgoingFriendsWithTime \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetUserOutgoingFriendsWithTime' test.out

#- 7 UserRequestFriend
./ng net.accelbyte.sdk.cli.Main lobby userRequestFriend \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "AxcVpFrt", "friendPublicId": "tufHIRdH"}' \
    > test.out 2>&1
eval_tap $? 7 'UserRequestFriend' test.out

#- 8 UserAcceptFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userAcceptFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "9UzVRiXb"}' \
    > test.out 2>&1
eval_tap $? 8 'UserAcceptFriendRequest' test.out

#- 9 UserCancelFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userCancelFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "qlAw7r6W"}' \
    > test.out 2>&1
eval_tap $? 9 'UserCancelFriendRequest' test.out

#- 10 UserRejectFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userRejectFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "2ktQG0h5"}' \
    > test.out 2>&1
eval_tap $? 10 'UserRejectFriendRequest' test.out

#- 11 UserGetFriendshipStatus
./ng net.accelbyte.sdk.cli.Main lobby userGetFriendshipStatus \
    --friendId 'JAav5kRa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'UserGetFriendshipStatus' test.out

#- 12 UserUnfriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userUnfriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "62WopBJH"}' \
    > test.out 2>&1
eval_tap $? 12 'UserUnfriendRequest' test.out

#- 13 AddFriendsWithoutConfirmation
./ng net.accelbyte.sdk.cli.Main lobby addFriendsWithoutConfirmation \
    --namespace "$AB_NAMESPACE" \
    --userId 'PtcDs8bB' \
    --body '{"friendIds": ["ZLCXLx8b", "bgorQeFb", "Q1g7qbPn"]}' \
    > test.out 2>&1
eval_tap $? 13 'AddFriendsWithoutConfirmation' test.out

#- 14 PersonalChatHistory
./ng net.accelbyte.sdk.cli.Main lobby personalChatHistory \
    --friendId 'gUNB1vRo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dwpzS6Da' \
    > test.out 2>&1
eval_tap $? 14 'PersonalChatHistory' test.out

#- 15 AdminChatHistory
./ng net.accelbyte.sdk.cli.Main lobby adminChatHistory \
    --friendId 'Dpv8N7ZQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VqGj6oDL' \
    > test.out 2>&1
eval_tap $? 15 'AdminChatHistory' test.out

#- 16 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 16 'AdminGetAllConfigV1' test.out

#- 17 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetConfigV1' test.out

#- 18 AdminUpdateConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowInviteNonConnectedUser": false, "allowJoinPartyDuringMatchmaking": false, "autoKickOnDisconnect": false, "autoKickOnDisconnectDelay": 31, "cancelTicketOnDisconnect": false, "chatRateLimitBurst": 95, "chatRateLimitDuration": 21, "concurrentUsersLimit": 69, "disableInvitationOnJoinParty": false, "enableChat": true, "entitlementCheck": false, "entitlementItemID": "poMF78NY", "generalRateLimitBurst": 16, "generalRateLimitDuration": 70, "keepPresenceActivityOnDisconnect": false, "maxDSWaitTime": 42, "maxPartyMember": 69, "profanityFilter": false, "readyConsentTimeout": 37}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateConfigV1' test.out

#- 19 AdminExportConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminExportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'AdminExportConfigV1' test.out

#- 20 AdminImportConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminImportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 20 'AdminImportConfigV1' test.out

#- 21 GetListOfFriends
./ng net.accelbyte.sdk.cli.Main lobby getListOfFriends \
    --namespace "$AB_NAMESPACE" \
    --userId '5tWEIC32' \
    --limit '28' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 21 'GetListOfFriends' test.out

#- 22 SendMultipleUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendMultipleUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "gW7olvbT", "topicName": "grhRTcPi", "userIds": ["SuL0Sly6", "XM4OI18m", "AQLnzjMf"]}' \
    > test.out 2>&1
eval_tap $? 22 'SendMultipleUsersFreeformNotificationV1Admin' test.out

#- 23 SendUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "8GZ2WBZq", "topicName": "xYG3aREA"}' \
    > test.out 2>&1
eval_tap $? 23 'SendUsersFreeformNotificationV1Admin' test.out

#- 24 SendPartyFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'u2D6QVKN' \
    --body '{"message": "CWP75TB0", "topicName": "i7pKxR8d"}' \
    > test.out 2>&1
eval_tap $? 24 'SendPartyFreeformNotificationV1Admin' test.out

#- 25 SendPartyTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'l0zRVW4E' \
    --body '{"templateContext": {"ZG9m0Xcg": "GVbMqSsz", "E8GHavj7": "AorKsxwk", "osAVerXp": "c1C8XfwH"}, "templateLanguage": "uKeb9l3r", "templateSlug": "GN9A3sNm", "topicName": "84hddSpH"}' \
    > test.out 2>&1
eval_tap $? 25 'SendPartyTemplatedNotificationV1Admin' test.out

#- 26 GetAllNotificationTemplatesV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTemplatesV1Admin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'GetAllNotificationTemplatesV1Admin' test.out

#- 27 CreateNotificationTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "t0P7MIIR", "templateLanguage": "7CkyF6C7", "templateSlug": "duuyZ0Gh"}' \
    > test.out 2>&1
eval_tap $? 27 'CreateNotificationTemplateV1Admin' test.out

#- 28 SendUsersTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"DogqrhBR": "d8lDR6qV", "NPRZYdFL": "IAjGGJdd", "VCvu9vx5": "KQ7KYnIu"}, "templateLanguage": "MBvaO35l", "templateSlug": "lzQRaT5k", "topicName": "PxUfofvn"}' \
    > test.out 2>&1
eval_tap $? 28 'SendUsersTemplatedNotificationV1Admin' test.out

#- 29 GetTemplateSlugLocalizationsTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'nSuB0y5W' \
    --after 'UlrMdI4s' \
    --before 'NveabntB' \
    --limit '91' \
    > test.out 2>&1
eval_tap $? 29 'GetTemplateSlugLocalizationsTemplateV1Admin' test.out

#- 30 DeleteNotificationTemplateSlugV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'nuRkgghG' \
    > test.out 2>&1
eval_tap $? 30 'DeleteNotificationTemplateSlugV1Admin' test.out

#- 31 GetSingleTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getSingleTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'oYupD391' \
    --templateSlug 'C2qtPYok' \
    > test.out 2>&1
eval_tap $? 31 'GetSingleTemplateLocalizationV1Admin' test.out

#- 32 UpdateTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'ahFjkQsf' \
    --templateSlug 'CaTmt1d6' \
    --body '{"templateContent": "7FXGk2s9"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdateTemplateLocalizationV1Admin' test.out

#- 33 DeleteTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'Q0mPVo3t' \
    --templateSlug 'wu0MesTC' \
    > test.out 2>&1
eval_tap $? 33 'DeleteTemplateLocalizationV1Admin' test.out

#- 34 PublishTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby publishTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'f9x4rt69' \
    --templateSlug 'lna7qxNe' \
    > test.out 2>&1
eval_tap $? 34 'PublishTemplateLocalizationV1Admin' test.out

#- 35 GetAllNotificationTopicsV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTopicsV1Admin \
    --namespace "$AB_NAMESPACE" \
    --after 'IxPz6Mbw' \
    --before 'L6IY69z1' \
    --limit '95' \
    > test.out 2>&1
eval_tap $? 35 'GetAllNotificationTopicsV1Admin' test.out

#- 36 CreateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "fDslpJSq", "topicName": "GAXQ0yYo"}' \
    > test.out 2>&1
eval_tap $? 36 'CreateNotificationTopicV1Admin' test.out

#- 37 GetNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'NRKd3IL5' \
    > test.out 2>&1
eval_tap $? 37 'GetNotificationTopicV1Admin' test.out

#- 38 UpdateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'TAQ6iiPl' \
    --body '{"description": "SC2uE4o5"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateNotificationTopicV1Admin' test.out

#- 39 DeleteNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'Vwdo3feP' \
    > test.out 2>&1
eval_tap $? 39 'DeleteNotificationTopicV1Admin' test.out

#- 40 SendSpecificUserFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'qIJA8IHt' \
    --body '{"message": "rkmu0hpD", "topicName": "DWVAla2l"}' \
    > test.out 2>&1
eval_tap $? 40 'SendSpecificUserFreeformNotificationV1Admin' test.out

#- 41 SendSpecificUserTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId '5BYNtIuS' \
    --body '{"templateContext": {"5S5XUdjs": "oqwGyzzW", "i9gwQYv7": "t1o7TTr1", "DmrhZv15": "T7quIOvB"}, "templateLanguage": "McaYmvCk", "templateSlug": "GZ5dAgqx", "topicName": "pBFmaLox"}' \
    > test.out 2>&1
eval_tap $? 41 'SendSpecificUserTemplatedNotificationV1Admin' test.out

#- 42 AdminGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ozr6wfNP' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetPartyDataV1' test.out

#- 43 AdminUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'X2bOItRM' \
    --body '{"custom_attribute": {"vqtlB2jJ": {}, "CSQT279Z": {}, "ZPYGu0rd": {}}, "updatedAt": 22}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdatePartyAttributesV1' test.out

#- 44 AdminJoinPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminJoinPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'mqRBaAkL' \
    --userId 'nvxkT1X6' \
    > test.out 2>&1
eval_tap $? 44 'AdminJoinPartyV1' test.out

#- 45 AdminGetUserPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetUserPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '8cmDc3fx' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetUserPartyV1' test.out

#- 46 AdminGetLobbyCCU
./ng net.accelbyte.sdk.cli.Main lobby adminGetLobbyCCU \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'AdminGetLobbyCCU' test.out

#- 47 AdminGetAllPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'U8MyKrQp' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetAllPlayerSessionAttribute' test.out

#- 48 AdminSetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminSetPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'M4hkkK6K' \
    --body '{"attributes": {"KXNB3Gv0": "IqmF51Tk", "hjYnaq6f": "oWvXa3bM", "rXsDr6kI": "LsSSyDdm"}}' \
    > test.out 2>&1
eval_tap $? 48 'AdminSetPlayerSessionAttribute' test.out

#- 49 AdminGetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerSessionAttribute \
    --attribute 'ykmoPYgc' \
    --namespace "$AB_NAMESPACE" \
    --userId '2L4jk4Lo' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetPlayerSessionAttribute' test.out

#- 50 AdminGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '0LSP0pf4' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetPlayerBlockedPlayersV1' test.out

#- 51 AdminGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IxjUkl53' \
    > test.out 2>&1
eval_tap $? 51 'AdminGetPlayerBlockedByPlayersV1' test.out

#- 52 AdminBulkBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5X3ateEK' \
    --body '{"listBlockedUserId": ["DpADz1x3", "poD3Qgb3", "boLQQ1Mz"]}' \
    > test.out 2>&1
eval_tap $? 52 'AdminBulkBlockPlayersV1' test.out

#- 53 AdminDebugProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminDebugProfanityFilters \
    --namespace "$AB_NAMESPACE" \
    --body '{"text": "H7Qm8bwb"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminDebugProfanityFilters' test.out

#- 54 AdminGetProfanityListFiltersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityListFiltersV1 \
    --list 'mXgdAPh1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'AdminGetProfanityListFiltersV1' test.out

#- 55 AdminAddProfanityFilterIntoList
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilterIntoList \
    --list 'EThG96gA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "FKK2WDgC", "note": "cxvONZm3"}' \
    > test.out 2>&1
eval_tap $? 55 'AdminAddProfanityFilterIntoList' test.out

#- 56 AdminAddProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilters \
    --list 'EeERmDny' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filters": [{"filter": "eFoF7VSZ", "note": "6pf3vneS"}, {"filter": "D2Tb3g7m", "note": "SQUhAEtr"}, {"filter": "mjqU6YE3", "note": "p4lSck0Z"}]}' \
    > test.out 2>&1
eval_tap $? 56 'AdminAddProfanityFilters' test.out

#- 57 AdminImportProfanityFiltersFromFile
./ng net.accelbyte.sdk.cli.Main lobby adminImportProfanityFiltersFromFile \
    --list 'Hn5GI39Y' \
    --namespace "$AB_NAMESPACE" \
    --body '[57, 43, 69]' \
    > test.out 2>&1
eval_tap $? 57 'AdminImportProfanityFiltersFromFile' test.out

#- 58 AdminDeleteProfanityFilter
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityFilter \
    --list '91GXlvPG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "6bFYReVH"}' \
    > test.out 2>&1
eval_tap $? 58 'AdminDeleteProfanityFilter' test.out

#- 59 AdminGetProfanityLists
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityLists \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'AdminGetProfanityLists' test.out

#- 60 AdminCreateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminCreateProfanityList \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": false, "isMandatory": false, "name": "pcCx9Zw5"}' \
    > test.out 2>&1
eval_tap $? 60 'AdminCreateProfanityList' test.out

#- 61 AdminUpdateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateProfanityList \
    --list 'D2L7vIYh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": true, "isMandatory": false, "newName": "yEW4ZJJ4"}' \
    > test.out 2>&1
eval_tap $? 61 'AdminUpdateProfanityList' test.out

#- 62 AdminDeleteProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityList \
    --list '2d3PBddN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'AdminDeleteProfanityList' test.out

#- 63 AdminGetProfanityRule
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityRule \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'AdminGetProfanityRule' test.out

#- 64 AdminSetProfanityRuleForNamespace
./ng net.accelbyte.sdk.cli.Main lobby adminSetProfanityRuleForNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"rule": "8S48l9ly"}' \
    > test.out 2>&1
eval_tap $? 64 'AdminSetProfanityRuleForNamespace' test.out

#- 65 AdminVerifyMessageProfanityResponse
./ng net.accelbyte.sdk.cli.Main lobby adminVerifyMessageProfanityResponse \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "NApflxqM", "profanityLevel": "rj3oZk03"}' \
    > test.out 2>&1
eval_tap $? 65 'AdminVerifyMessageProfanityResponse' test.out

#- 66 AdminGetThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'AdminGetThirdPartyConfig' test.out

#- 67 AdminUpdateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "QXcKMDYD"}' \
    > test.out 2>&1
eval_tap $? 67 'AdminUpdateThirdPartyConfig' test.out

#- 68 AdminCreateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminCreateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "DxHSZjtq"}' \
    > test.out 2>&1
eval_tap $? 68 'AdminCreateThirdPartyConfig' test.out

#- 69 AdminDeleteThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'AdminDeleteThirdPartyConfig' test.out

#- 70 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main lobby publicGetMessages \
    > test.out 2>&1
eval_tap $? 70 'PublicGetMessages' test.out

#- 71 GetPersonalChatHistoryV1Public
./ng net.accelbyte.sdk.cli.Main lobby getPersonalChatHistoryV1Public \
    --friendId 'XyJ58f7G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetPersonalChatHistoryV1Public' test.out

#- 72 PublicGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'c26SaiGV' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetPartyDataV1' test.out

#- 73 PublicUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby publicUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'kydwYWQG' \
    --body '{"custom_attribute": {"26yUZNmT": {}, "BcvrbYCw": {}, "ZtxFHyPL": {}}, "updatedAt": 39}' \
    > test.out 2>&1
eval_tap $? 73 'PublicUpdatePartyAttributesV1' test.out

#- 74 PublicSetPartyLimitV1
./ng net.accelbyte.sdk.cli.Main lobby publicSetPartyLimitV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'NrDjqoxc' \
    --body '{"limit": 47}' \
    > test.out 2>&1
eval_tap $? 74 'PublicSetPartyLimitV1' test.out

#- 75 PublicGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'PublicGetPlayerBlockedPlayersV1' test.out

#- 76 PublicGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'PublicGetPlayerBlockedByPlayersV1' test.out

#- 77 UsersPresenceHandlerV1
./ng net.accelbyte.sdk.cli.Main lobby usersPresenceHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --countOnly  \
    --userIds 'UIj88cek' \
    > test.out 2>&1
eval_tap $? 77 'UsersPresenceHandlerV1' test.out

#- 78 FreeFormNotification
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotification \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "dqCt81P1", "topic": "ktfIovmv"}' \
    > test.out 2>&1
eval_tap $? 78 'FreeFormNotification' test.out

#- 79 NotificationWithTemplate
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"9gsR5cJc": "Hm3SZLxo", "RDFuuuyS": "j29a9LJE", "8HoRS1X2": "PFAAMwzH"}, "templateLanguage": "PxB1UskY", "templateSlug": "s4Yw20DO", "topic": "qOBSC2DK"}' \
    > test.out 2>&1
eval_tap $? 79 'NotificationWithTemplate' test.out

#- 80 GetGameTemplate
./ng net.accelbyte.sdk.cli.Main lobby getGameTemplate \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 80 'GetGameTemplate' test.out

#- 81 CreateTemplate
./ng net.accelbyte.sdk.cli.Main lobby createTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "HRuPMMWH", "templateLanguage": "8Yb33T5U", "templateSlug": "BJCjfcnL"}' \
    > test.out 2>&1
eval_tap $? 81 'CreateTemplate' test.out

#- 82 GetSlugTemplate
./ng net.accelbyte.sdk.cli.Main lobby getSlugTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'RfxeCSz9' \
    --after 'WEi8Kllo' \
    --before 'eH0JT1yd' \
    --limit '41' \
    > test.out 2>&1
eval_tap $? 82 'GetSlugTemplate' test.out

#- 83 DeleteTemplateSlug
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateSlug \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'T50x9WT0' \
    > test.out 2>&1
eval_tap $? 83 'DeleteTemplateSlug' test.out

#- 84 GetLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby getLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'GfH2rtOa' \
    --templateSlug '4EXsXzOX' \
    > test.out 2>&1
eval_tap $? 84 'GetLocalizationTemplate' test.out

#- 85 UpdateLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby updateLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'QAk4mqrx' \
    --templateSlug 'zTtuLl4X' \
    --body '{"templateContent": "lbGL8QOx"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateLocalizationTemplate' test.out

#- 86 DeleteTemplateLocalization
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalization \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'tjzm8y2w' \
    --templateSlug 'NhmwoYZy' \
    > test.out 2>&1
eval_tap $? 86 'DeleteTemplateLocalization' test.out

#- 87 PublishTemplate
./ng net.accelbyte.sdk.cli.Main lobby publishTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'I4EFZKBc' \
    --templateSlug 'YrCEAE7W' \
    > test.out 2>&1
eval_tap $? 87 'PublishTemplate' test.out

#- 88 GetTopicByNamespace
./ng net.accelbyte.sdk.cli.Main lobby getTopicByNamespace \
    --namespace "$AB_NAMESPACE" \
    --after 'Isfmx40N' \
    --before 'LRc6m8he' \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 88 'GetTopicByNamespace' test.out

#- 89 CreateTopic
./ng net.accelbyte.sdk.cli.Main lobby createTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "gas4b6z3", "topic": "LNUj7fdg"}' \
    > test.out 2>&1
eval_tap $? 89 'CreateTopic' test.out

#- 90 GetTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby getTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'LA84Z8YY' \
    > test.out 2>&1
eval_tap $? 90 'GetTopicByTopicName' test.out

#- 91 UpdateTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby updateTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'k6QEgJjB' \
    --body '{"description": "bEDoNf3n"}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateTopicByTopicName' test.out

#- 92 DeleteTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby deleteTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic '0hEoRCAc' \
    > test.out 2>&1
eval_tap $? 92 'DeleteTopicByTopicName' test.out

#- 93 FreeFormNotificationByUserID
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotificationByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'f80zfFya' \
    --body '{"message": "bWAgIUXi", "topic": "I07A68ea"}' \
    > test.out 2>&1
eval_tap $? 93 'FreeFormNotificationByUserID' test.out

#- 94 NotificationWithTemplateByUserID
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplateByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'qC2J9jyE' \
    --body '{"templateContext": {"W6GLbc0N": "aKDUL3sa", "13lk1dQB": "HO86IlBh", "netU4RwT": "qUXlTDBz"}, "templateLanguage": "OuYsaZA2", "templateSlug": "yyd4mbqo", "topic": "OfADMMAX"}' \
    > test.out 2>&1
eval_tap $? 94 'NotificationWithTemplateByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE