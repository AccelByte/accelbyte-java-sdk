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
echo "1..92"

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
    --limit '35' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 2 'GetUserFriendsUpdated' test.out

#- 3 GetUserIncomingFriends
./ng net.accelbyte.sdk.cli.Main lobby getUserIncomingFriends \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 3 'GetUserIncomingFriends' test.out

#- 4 GetUserOutgoingFriends
./ng net.accelbyte.sdk.cli.Main lobby getUserOutgoingFriends \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'GetUserOutgoingFriends' test.out

#- 5 UserRequestFriend
./ng net.accelbyte.sdk.cli.Main lobby userRequestFriend \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "1nSLZDvV", "friendPublicId": "UT2wsP08"}' \
    > test.out 2>&1
eval_tap $? 5 'UserRequestFriend' test.out

#- 6 UserAcceptFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userAcceptFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "r7tJBxFQ"}' \
    > test.out 2>&1
eval_tap $? 6 'UserAcceptFriendRequest' test.out

#- 7 UserCancelFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userCancelFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "228GYwsj"}' \
    > test.out 2>&1
eval_tap $? 7 'UserCancelFriendRequest' test.out

#- 8 UserRejectFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userRejectFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "mrWGtz7l"}' \
    > test.out 2>&1
eval_tap $? 8 'UserRejectFriendRequest' test.out

#- 9 UserGetFriendshipStatus
./ng net.accelbyte.sdk.cli.Main lobby userGetFriendshipStatus \
    --friendId 'pAiyAtxb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'UserGetFriendshipStatus' test.out

#- 10 UserUnfriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userUnfriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "xnCPSmPz"}' \
    > test.out 2>&1
eval_tap $? 10 'UserUnfriendRequest' test.out

#- 11 AddFriendsWithoutConfirmation
./ng net.accelbyte.sdk.cli.Main lobby addFriendsWithoutConfirmation \
    --namespace "$AB_NAMESPACE" \
    --userId 'Biowaher' \
    --body '{"friendIds": ["mbAZOJTz", "ci4VwTuJ", "OrSQGaHL"]}' \
    > test.out 2>&1
eval_tap $? 11 'AddFriendsWithoutConfirmation' test.out

#- 12 PersonalChatHistory
./ng net.accelbyte.sdk.cli.Main lobby personalChatHistory \
    --friendId 'oY2tEyoD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'syjdO1OU' \
    > test.out 2>&1
eval_tap $? 12 'PersonalChatHistory' test.out

#- 13 AdminChatHistory
./ng net.accelbyte.sdk.cli.Main lobby adminChatHistory \
    --friendId 'AXJg21m9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tejsYEcM' \
    > test.out 2>&1
eval_tap $? 13 'AdminChatHistory' test.out

#- 14 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 14 'AdminGetAllConfigV1' test.out

#- 15 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetConfigV1' test.out

#- 16 AdminUpdateConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowInviteNonConnectedUser": true, "allowJoinPartyDuringMatchmaking": false, "autoKickOnDisconnect": false, "autoKickOnDisconnectDelay": 29, "cancelTicketOnDisconnect": false, "chatRateLimitBurst": 66, "chatRateLimitDuration": 48, "concurrentUsersLimit": 37, "disableInvitationOnJoinParty": false, "enableChat": false, "entitlementCheck": false, "entitlementItemID": "kqxKyg17", "generalRateLimitBurst": 44, "generalRateLimitDuration": 61, "keepPresenceActivityOnDisconnect": true, "maxDSWaitTime": 21, "maxPartyMember": 70, "profanityFilter": true, "readyConsentTimeout": 37}' \
    > test.out 2>&1
eval_tap $? 16 'AdminUpdateConfigV1' test.out

#- 17 AdminExportConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminExportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminExportConfigV1' test.out

#- 18 AdminImportConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminImportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 18 'AdminImportConfigV1' test.out

#- 19 GetListOfFriends
./ng net.accelbyte.sdk.cli.Main lobby getListOfFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'MpQkouOq' \
    --limit '50' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 19 'GetListOfFriends' test.out

#- 20 SendMultipleUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendMultipleUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "yyAMGFxP", "topicName": "rnhJhAyO", "userIds": ["Ly7a0rcV", "zX6Z1Fzi", "KsZpm5rl"]}' \
    > test.out 2>&1
eval_tap $? 20 'SendMultipleUsersFreeformNotificationV1Admin' test.out

#- 21 SendUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "fo2wtrE7", "topicName": "ApLwVF9O"}' \
    > test.out 2>&1
eval_tap $? 21 'SendUsersFreeformNotificationV1Admin' test.out

#- 22 SendPartyFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId '1iEYSOtH' \
    --body '{"message": "JS4HZfwh", "topicName": "JLOglu1v"}' \
    > test.out 2>&1
eval_tap $? 22 'SendPartyFreeformNotificationV1Admin' test.out

#- 23 SendPartyTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId '8lMb0AZN' \
    --body '{"templateContext": {"eh5WQY8J": "4gIEubPq", "L5nat5dA": "9N57Kb3n", "zkXJGI8F": "fkk96dHZ"}, "templateLanguage": "SLkj2OjG", "templateSlug": "jUH3INMo", "topicName": "Y82XmCl7"}' \
    > test.out 2>&1
eval_tap $? 23 'SendPartyTemplatedNotificationV1Admin' test.out

#- 24 GetAllNotificationTemplatesV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTemplatesV1Admin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'GetAllNotificationTemplatesV1Admin' test.out

#- 25 CreateNotificationTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "8yRb7l2a", "templateLanguage": "FJLXznyl", "templateSlug": "hX7ffaOV"}' \
    > test.out 2>&1
eval_tap $? 25 'CreateNotificationTemplateV1Admin' test.out

#- 26 SendUsersTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"pC8mmCrr": "1XRuGysw", "nCXUvLzN": "SF1KJzlB", "FTOImiZh": "BQEpEBcx"}, "templateLanguage": "R0cLqWHQ", "templateSlug": "CXLLDRIb", "topicName": "yFL23Tqx"}' \
    > test.out 2>&1
eval_tap $? 26 'SendUsersTemplatedNotificationV1Admin' test.out

#- 27 GetTemplateSlugLocalizationsTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'PnKoSyit' \
    --after 'SOiLOtPu' \
    --before 'EM5SKFbf' \
    --limit '40' \
    > test.out 2>&1
eval_tap $? 27 'GetTemplateSlugLocalizationsTemplateV1Admin' test.out

#- 28 DeleteNotificationTemplateSlugV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug '47G1lqX5' \
    > test.out 2>&1
eval_tap $? 28 'DeleteNotificationTemplateSlugV1Admin' test.out

#- 29 GetSingleTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getSingleTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'zRctrKbM' \
    --templateSlug 'amOCebAN' \
    > test.out 2>&1
eval_tap $? 29 'GetSingleTemplateLocalizationV1Admin' test.out

#- 30 UpdateTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'TrCGL1dW' \
    --templateSlug 'SqoTAnFf' \
    --body '{"templateContent": "36hxgjfq"}' \
    > test.out 2>&1
eval_tap $? 30 'UpdateTemplateLocalizationV1Admin' test.out

#- 31 DeleteTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '0z0IE47z' \
    --templateSlug 'x8Y2FDTt' \
    > test.out 2>&1
eval_tap $? 31 'DeleteTemplateLocalizationV1Admin' test.out

#- 32 PublishTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby publishTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'lYuX4NUy' \
    --templateSlug 'wBGXjTzn' \
    > test.out 2>&1
eval_tap $? 32 'PublishTemplateLocalizationV1Admin' test.out

#- 33 GetAllNotificationTopicsV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTopicsV1Admin \
    --namespace "$AB_NAMESPACE" \
    --after 'nChP37Et' \
    --before 'EtwKA0UR' \
    --limit '6' \
    > test.out 2>&1
eval_tap $? 33 'GetAllNotificationTopicsV1Admin' test.out

#- 34 CreateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "3qTWGnZM", "topicName": "XMZydYEX"}' \
    > test.out 2>&1
eval_tap $? 34 'CreateNotificationTopicV1Admin' test.out

#- 35 GetNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'aJTdjisJ' \
    > test.out 2>&1
eval_tap $? 35 'GetNotificationTopicV1Admin' test.out

#- 36 UpdateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName '0JQrDxn6' \
    --body '{"description": "SDTUfrSd"}' \
    > test.out 2>&1
eval_tap $? 36 'UpdateNotificationTopicV1Admin' test.out

#- 37 DeleteNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'CE3A6bjT' \
    > test.out 2>&1
eval_tap $? 37 'DeleteNotificationTopicV1Admin' test.out

#- 38 SendSpecificUserFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'suJ13M0n' \
    --body '{"message": "1q8HYCSr", "topicName": "Tt8dkMkb"}' \
    > test.out 2>&1
eval_tap $? 38 'SendSpecificUserFreeformNotificationV1Admin' test.out

#- 39 SendSpecificUserTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'rKDm3WIp' \
    --body '{"templateContext": {"BT9wf1ny": "77AeZxK8", "VXBu63an": "DWqdKtua", "0QRjlrHl": "O93WpEnY"}, "templateLanguage": "K1F40Nfw", "templateSlug": "izNsmmnM", "topicName": "UtAdWkY8"}' \
    > test.out 2>&1
eval_tap $? 39 'SendSpecificUserTemplatedNotificationV1Admin' test.out

#- 40 AdminGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'fh6ct8lH' \
    > test.out 2>&1
eval_tap $? 40 'AdminGetPartyDataV1' test.out

#- 41 AdminUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ESFYXgGv' \
    --body '{"custom_attribute": {"bg69s7f3": {}, "XTYEh5UV": {}, "js5Ik1bt": {}}, "updatedAt": 37}' \
    > test.out 2>&1
eval_tap $? 41 'AdminUpdatePartyAttributesV1' test.out

#- 42 AdminJoinPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminJoinPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId '8TzgUD41' \
    --userId '7l4NEpCR' \
    > test.out 2>&1
eval_tap $? 42 'AdminJoinPartyV1' test.out

#- 43 AdminGetUserPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetUserPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bRYiY9rV' \
    > test.out 2>&1
eval_tap $? 43 'AdminGetUserPartyV1' test.out

#- 44 AdminGetLobbyCCU
./ng net.accelbyte.sdk.cli.Main lobby adminGetLobbyCCU \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'AdminGetLobbyCCU' test.out

#- 45 AdminGetAllPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'AmUw1aJc' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetAllPlayerSessionAttribute' test.out

#- 46 AdminSetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminSetPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'I0qxyCs5' \
    --body '{"attributes": {"oCFrIcRc": "xpAoEbDH", "0CIL6YvO": "9YAAU9UA", "mtDb6xnp": "ZecyuQZN"}}' \
    > test.out 2>&1
eval_tap $? 46 'AdminSetPlayerSessionAttribute' test.out

#- 47 AdminGetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerSessionAttribute \
    --attribute 'zQuT1viA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rDUYG4Dt' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerSessionAttribute' test.out

#- 48 AdminGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '2HBYYCkC' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetPlayerBlockedPlayersV1' test.out

#- 49 AdminGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZPt1YwmY' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetPlayerBlockedByPlayersV1' test.out

#- 50 AdminBulkBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nMeMxOAx' \
    --body '{"listBlockedUserId": ["9NdRBhi0", "Po4Fdonu", "JpTECpz6"]}' \
    > test.out 2>&1
eval_tap $? 50 'AdminBulkBlockPlayersV1' test.out

#- 51 AdminDebugProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminDebugProfanityFilters \
    --namespace "$AB_NAMESPACE" \
    --body '{"text": "7cETRWS4"}' \
    > test.out 2>&1
eval_tap $? 51 'AdminDebugProfanityFilters' test.out

#- 52 AdminGetProfanityListFiltersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityListFiltersV1 \
    --list 'zSEIb4nX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'AdminGetProfanityListFiltersV1' test.out

#- 53 AdminAddProfanityFilterIntoList
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilterIntoList \
    --list '5OYwTDzO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "ccCz3SNu", "note": "2wNVL0IH"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminAddProfanityFilterIntoList' test.out

#- 54 AdminAddProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilters \
    --list 'TlwHpJ4p' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filters": [{"filter": "745xoWjU", "note": "sfk6bsFN"}, {"filter": "SqgtRcEL", "note": "M0x5h524"}, {"filter": "0pNnHfHs", "note": "xV0u88YD"}]}' \
    > test.out 2>&1
eval_tap $? 54 'AdminAddProfanityFilters' test.out

#- 55 AdminImportProfanityFiltersFromFile
./ng net.accelbyte.sdk.cli.Main lobby adminImportProfanityFiltersFromFile \
    --list 'tGSCiD4h' \
    --namespace "$AB_NAMESPACE" \
    --body '[18, 49, 79]' \
    > test.out 2>&1
eval_tap $? 55 'AdminImportProfanityFiltersFromFile' test.out

#- 56 AdminDeleteProfanityFilter
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityFilter \
    --list '2xf8SKyU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "0a27HCxI"}' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteProfanityFilter' test.out

#- 57 AdminGetProfanityLists
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityLists \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'AdminGetProfanityLists' test.out

#- 58 AdminCreateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminCreateProfanityList \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": true, "isMandatory": true, "name": "bvZ2oTRH"}' \
    > test.out 2>&1
eval_tap $? 58 'AdminCreateProfanityList' test.out

#- 59 AdminUpdateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateProfanityList \
    --list '7Ua09KG4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": true, "isMandatory": true, "newName": "FwyFZ5NB"}' \
    > test.out 2>&1
eval_tap $? 59 'AdminUpdateProfanityList' test.out

#- 60 AdminDeleteProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityList \
    --list 'dYlQa7QZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'AdminDeleteProfanityList' test.out

#- 61 AdminGetProfanityRule
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityRule \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'AdminGetProfanityRule' test.out

#- 62 AdminSetProfanityRuleForNamespace
./ng net.accelbyte.sdk.cli.Main lobby adminSetProfanityRuleForNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"rule": "wEmw24Ir"}' \
    > test.out 2>&1
eval_tap $? 62 'AdminSetProfanityRuleForNamespace' test.out

#- 63 AdminVerifyMessageProfanityResponse
./ng net.accelbyte.sdk.cli.Main lobby adminVerifyMessageProfanityResponse \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "rznsYjJB", "profanityLevel": "K3VP5KZx"}' \
    > test.out 2>&1
eval_tap $? 63 'AdminVerifyMessageProfanityResponse' test.out

#- 64 AdminGetThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'AdminGetThirdPartyConfig' test.out

#- 65 AdminUpdateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "IWkiQb3l"}' \
    > test.out 2>&1
eval_tap $? 65 'AdminUpdateThirdPartyConfig' test.out

#- 66 AdminCreateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminCreateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "7a196H3m"}' \
    > test.out 2>&1
eval_tap $? 66 'AdminCreateThirdPartyConfig' test.out

#- 67 AdminDeleteThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'AdminDeleteThirdPartyConfig' test.out

#- 68 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main lobby publicGetMessages \
    > test.out 2>&1
eval_tap $? 68 'PublicGetMessages' test.out

#- 69 GetPersonalChatHistoryV1Public
./ng net.accelbyte.sdk.cli.Main lobby getPersonalChatHistoryV1Public \
    --friendId 'wNaHPmFA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'GetPersonalChatHistoryV1Public' test.out

#- 70 PublicGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WQgks9bQ' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetPartyDataV1' test.out

#- 71 PublicUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby publicUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QWD9sBRH' \
    --body '{"custom_attribute": {"6RDBnRpQ": {}, "cAsj2rqA": {}, "7y7OMoAF": {}}, "updatedAt": 7}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdatePartyAttributesV1' test.out

#- 72 PublicSetPartyLimitV1
./ng net.accelbyte.sdk.cli.Main lobby publicSetPartyLimitV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Aygtcfr8' \
    --body '{"limit": 9}' \
    > test.out 2>&1
eval_tap $? 72 'PublicSetPartyLimitV1' test.out

#- 73 PublicGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'PublicGetPlayerBlockedPlayersV1' test.out

#- 74 PublicGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'PublicGetPlayerBlockedByPlayersV1' test.out

#- 75 UsersPresenceHandlerV1
./ng net.accelbyte.sdk.cli.Main lobby usersPresenceHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --countOnly  \
    --userIds 'FFOeK66V' \
    > test.out 2>&1
eval_tap $? 75 'UsersPresenceHandlerV1' test.out

#- 76 FreeFormNotification
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotification \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "OheNLsqM", "topic": "fyI1Xx36"}' \
    > test.out 2>&1
eval_tap $? 76 'FreeFormNotification' test.out

#- 77 NotificationWithTemplate
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"TBPEZuNw": "ufJnkAJm", "vMQyuTgn": "VJnEro3O", "e1yKag0w": "cKJklxk6"}, "templateLanguage": "jn3DKf2m", "templateSlug": "1gevQeHe", "topic": "tZRJCYPH"}' \
    > test.out 2>&1
eval_tap $? 77 'NotificationWithTemplate' test.out

#- 78 GetGameTemplate
./ng net.accelbyte.sdk.cli.Main lobby getGameTemplate \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'GetGameTemplate' test.out

#- 79 CreateTemplate
./ng net.accelbyte.sdk.cli.Main lobby createTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "t6u5S8PE", "templateLanguage": "9q5PQRzL", "templateSlug": "oMoJxJ7j"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateTemplate' test.out

#- 80 GetSlugTemplate
./ng net.accelbyte.sdk.cli.Main lobby getSlugTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'pZ5Zg76A' \
    --after 'XOx7KmUI' \
    --before 'v6ecGSMa' \
    --limit '67' \
    > test.out 2>&1
eval_tap $? 80 'GetSlugTemplate' test.out

#- 81 DeleteTemplateSlug
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateSlug \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'XV3q92Gf' \
    > test.out 2>&1
eval_tap $? 81 'DeleteTemplateSlug' test.out

#- 82 GetLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby getLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'gBtlRIkC' \
    --templateSlug 'mHEWeCbg' \
    > test.out 2>&1
eval_tap $? 82 'GetLocalizationTemplate' test.out

#- 83 UpdateLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby updateLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'CSQyG6Gf' \
    --templateSlug '2f34WxLN' \
    --body '{"templateContent": "St9PMo1t"}' \
    > test.out 2>&1
eval_tap $? 83 'UpdateLocalizationTemplate' test.out

#- 84 DeleteTemplateLocalization
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalization \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '0txqQidg' \
    --templateSlug 'WzExRhlS' \
    > test.out 2>&1
eval_tap $? 84 'DeleteTemplateLocalization' test.out

#- 85 PublishTemplate
./ng net.accelbyte.sdk.cli.Main lobby publishTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'kEOYk2uy' \
    --templateSlug 'DlTpQz5z' \
    > test.out 2>&1
eval_tap $? 85 'PublishTemplate' test.out

#- 86 GetTopicByNamespace
./ng net.accelbyte.sdk.cli.Main lobby getTopicByNamespace \
    --namespace "$AB_NAMESPACE" \
    --after 'FoWi9nT1' \
    --before 'QT2watPT' \
    --limit '57' \
    > test.out 2>&1
eval_tap $? 86 'GetTopicByNamespace' test.out

#- 87 CreateTopic
./ng net.accelbyte.sdk.cli.Main lobby createTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "iAWptXHh", "topic": "RiP8q4le"}' \
    > test.out 2>&1
eval_tap $? 87 'CreateTopic' test.out

#- 88 GetTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby getTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'F3dAh8We' \
    > test.out 2>&1
eval_tap $? 88 'GetTopicByTopicName' test.out

#- 89 UpdateTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby updateTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'veJUiCfS' \
    --body '{"description": "E97JWoId"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateTopicByTopicName' test.out

#- 90 DeleteTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby deleteTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'pKKKEQpS' \
    > test.out 2>&1
eval_tap $? 90 'DeleteTopicByTopicName' test.out

#- 91 FreeFormNotificationByUserID
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotificationByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'B13ZlSHg' \
    --body '{"message": "y3Icd1Zf", "topic": "YbvKOyqI"}' \
    > test.out 2>&1
eval_tap $? 91 'FreeFormNotificationByUserID' test.out

#- 92 NotificationWithTemplateByUserID
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplateByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dx89rgcN' \
    --body '{"templateContext": {"8LiNhsgG": "Y1UGyMSn", "SUw0NSlg": "H1GLmid8", "XNxCl950": "y6KKOdrU"}, "templateLanguage": "7zwfaQmf", "templateSlug": "ATYs0QBj", "topic": "xQRzVLRV"}' \
    > test.out 2>&1
eval_tap $? 92 'NotificationWithTemplateByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE