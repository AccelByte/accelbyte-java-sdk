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
echo "1..91"

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
    --body '{"friendId": "AxcVpFrttufHIRdH", "friendPublicId": "9UzVRiXbqlAw7r6W"}' \
    > test.out 2>&1
eval_tap $? 7 'UserRequestFriend' test.out

#- 8 UserAcceptFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userAcceptFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "2ktQG0h5JAav5kRa"}' \
    > test.out 2>&1
eval_tap $? 8 'UserAcceptFriendRequest' test.out

#- 9 UserCancelFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userCancelFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "62WopBJHPtcDs8bB"}' \
    > test.out 2>&1
eval_tap $? 9 'UserCancelFriendRequest' test.out

#- 10 UserRejectFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userRejectFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "ZLCXLx8bbgorQeFb"}' \
    > test.out 2>&1
eval_tap $? 10 'UserRejectFriendRequest' test.out

#- 11 UserGetFriendshipStatus
./ng net.accelbyte.sdk.cli.Main lobby userGetFriendshipStatus \
    --friendId 'Q1g7qbPngUNB1vRo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'UserGetFriendshipStatus' test.out

#- 12 UserUnfriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userUnfriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "dwpzS6DaDpv8N7ZQ"}' \
    > test.out 2>&1
eval_tap $? 12 'UserUnfriendRequest' test.out

#- 13 AddFriendsWithoutConfirmation
./ng net.accelbyte.sdk.cli.Main lobby addFriendsWithoutConfirmation \
    --namespace "$AB_NAMESPACE" \
    --userId 'VqGj6oDLjWjkY1aX' \
    --body '{"friendIds": ["lFcDtgOjchIua5tW", "EIC32ogW7olvbTgr", "hRTcPiSuL0Sly6XM"]}' \
    > test.out 2>&1
eval_tap $? 13 'AddFriendsWithoutConfirmation' test.out

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
    --body '{"allowInviteNonConnectedUser": true, "allowJoinPartyDuringMatchmaking": true, "autoKickOnDisconnect": false, "autoKickOnDisconnectDelay": 45, "cancelTicketOnDisconnect": false, "chatRateLimitBurst": 50, "chatRateLimitDuration": 55, "concurrentUsersLimit": 54, "disableInvitationOnJoinParty": false, "enableChat": false, "entitlementCheck": true, "entitlementItemID": "zjMf8GZ2WBZqxYG3", "generalRateLimitBurst": 0, "generalRateLimitDuration": 87, "keepPresenceActivityOnDisconnect": true, "maxDSWaitTime": 84, "maxPartyMember": 55, "profanityFilter": true, "readyConsentTimeout": 41, "unregisterDelay": 86}' \
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
    --userId 'D6QVKNCWP75TB0i7' \
    --limit '31' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 19 'GetListOfFriends' test.out

#- 20 SendMultipleUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendMultipleUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "KxR8dl0zRVW4EZG9", "topicName": "m0XcgGVbMqSszE8G", "userIds": ["Havj7AorKsxwkosA", "VerXpc1C8XfwHuKe", "b9l3rGN9A3sNm84h"]}' \
    > test.out 2>&1
eval_tap $? 20 'SendMultipleUsersFreeformNotificationV1Admin' test.out

#- 21 SendUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "ddSpHt0P7MIIR7Ck", "topicName": "yF6C7duuyZ0GhDog"}' \
    > test.out 2>&1
eval_tap $? 21 'SendUsersFreeformNotificationV1Admin' test.out

#- 22 SendPartyFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qrhBRd8lDR6qVNPR' \
    --body '{"message": "ZYdFLIAjGGJddVCv", "topicName": "u9vx5KQ7KYnIuMBv"}' \
    > test.out 2>&1
eval_tap $? 22 'SendPartyFreeformNotificationV1Admin' test.out

#- 23 SendPartyTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'aO35llzQRaT5kPxU' \
    --body '{"templateContext": {"fofvnnSuB0y5WUlr": "MdI4sNveabntBSxT", "eIv53HGCiljvjKoy": "D6SCwGrncqmLtjQH", "Af8TgoNm03VLisV6": "zwPuo3td6TC6I3lM"}, "templateLanguage": "jGSWN2laRlxfcjHf", "templateSlug": "YakUCTqGkE7wcWfD", "topicName": "slpJSqGAXQ0yYoNR"}' \
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
    --body '{"templateContent": "Kd3IL5TAQ6iiPlSC", "templateLanguage": "2uE4o5Vwdo3fePqI", "templateSlug": "JA8IHtrkmu0hpDDW"}' \
    > test.out 2>&1
eval_tap $? 25 'CreateNotificationTemplateV1Admin' test.out

#- 26 SendUsersTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"VAla2l5BYNtIuS5S": "5XUdjsoqwGyzzWi9", "gwQYv7t1o7TTr1Dm": "rhZv15T7quIOvBMc", "aYmvCkGZ5dAgqxpB": "FmaLoxozr6wfNPX2"}, "templateLanguage": "bOItRMvqtlB2jJCS", "templateSlug": "QT279ZZPYGu0rdlg", "topicName": "dWyOtXi3choQrpOs"}' \
    > test.out 2>&1
eval_tap $? 26 'SendUsersTemplatedNotificationV1Admin' test.out

#- 27 GetTemplateSlugLocalizationsTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'DBU5SepjChB3V0v5' \
    --after '2Dlym6puQ23xoJ8a' \
    --before 'eCnaLpUKp44YUDja' \
    --limit '38' \
    > test.out 2>&1
eval_tap $? 27 'GetTemplateSlugLocalizationsTemplateV1Admin' test.out

#- 28 DeleteNotificationTemplateSlugV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'vXa3bMrXsDr6kILs' \
    > test.out 2>&1
eval_tap $? 28 'DeleteNotificationTemplateSlugV1Admin' test.out

#- 29 GetSingleTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getSingleTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'SSyDdmykmoPYgc2L' \
    --templateSlug '4jk4Lo0LSP0pf4Ix' \
    > test.out 2>&1
eval_tap $? 29 'GetSingleTemplateLocalizationV1Admin' test.out

#- 30 UpdateTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'jUkl535X3ateEKDp' \
    --templateSlug 'ADz1x3poD3Qgb3bo' \
    --body '{"templateContent": "LQQ1MzH7Qm8bwbmX"}' \
    > test.out 2>&1
eval_tap $? 30 'UpdateTemplateLocalizationV1Admin' test.out

#- 31 DeleteTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'gdAPh1EThG96gAFK' \
    --templateSlug 'K2WDgCcxvONZm3Ee' \
    > test.out 2>&1
eval_tap $? 31 'DeleteTemplateLocalizationV1Admin' test.out

#- 32 PublishTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby publishTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'ERmDnyeFoF7VSZ6p' \
    --templateSlug 'f3vneSD2Tb3g7mSQ' \
    > test.out 2>&1
eval_tap $? 32 'PublishTemplateLocalizationV1Admin' test.out

#- 33 GetAllNotificationTopicsV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTopicsV1Admin \
    --namespace "$AB_NAMESPACE" \
    --after 'UhAEtrmjqU6YE3p4' \
    --before 'lSck0ZHn5GI39YBH' \
    --limit '33' \
    > test.out 2>&1
eval_tap $? 33 'GetAllNotificationTopicsV1Admin' test.out

#- 34 CreateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "1GXlvPG6bFYReVHQ", "topicName": "ipcCx9Zw5D2L7vIY"}' \
    > test.out 2>&1
eval_tap $? 34 'CreateNotificationTopicV1Admin' test.out

#- 35 GetNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'hGGSyEW4ZJJ42d3P' \
    > test.out 2>&1
eval_tap $? 35 'GetNotificationTopicV1Admin' test.out

#- 36 UpdateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'BddN8S48l9lyNApf' \
    --body '{"description": "lxqMrj3oZk03QXcK"}' \
    > test.out 2>&1
eval_tap $? 36 'UpdateNotificationTopicV1Admin' test.out

#- 37 DeleteNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'MDYDDxHSZjtqXyJ5' \
    > test.out 2>&1
eval_tap $? 37 'DeleteNotificationTopicV1Admin' test.out

#- 38 SendSpecificUserFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId '8f7Gc26SaiGVkydw' \
    --body '{"message": "YWQG26yUZNmTBcvr", "topicName": "bYCwZtxFHyPLtI8i"}' \
    > test.out 2>&1
eval_tap $? 38 'SendSpecificUserFreeformNotificationV1Admin' test.out

#- 39 SendSpecificUserTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'lbyDPUIj88cekdqC' \
    --body '{"templateContext": {"t81P1ktfIovmv9gs": "R5cJcHm3SZLxoRDF", "uuuySj29a9LJE8Ho": "RS1X2PFAAMwzHPxB", "1UskYs4Yw20DOqOB": "SC2DKHRuPMMWH8Yb"}, "templateLanguage": "33T5UBJCjfcnLRfx", "templateSlug": "eCSz9WEi8KlloeH0", "topicName": "JT1yduat2vQR3biB"}' \
    > test.out 2>&1
eval_tap $? 39 'SendSpecificUserTemplatedNotificationV1Admin' test.out

#- 40 AdminGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'fsu4jmsRE2w1yEkL' \
    > test.out 2>&1
eval_tap $? 40 'AdminGetPartyDataV1' test.out

#- 41 AdminUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'gh3tIYt4SqYUTLDx' \
    --body '{"custom_attribute": {"9gIiDandpGT2t24a": {}, "OMh5eC3IHeHSKLCa": {}, "3xreNDUWehwH3q31": {}}, "updatedAt": 54}' \
    > test.out 2>&1
eval_tap $? 41 'AdminUpdatePartyAttributesV1' test.out

#- 42 AdminJoinPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminJoinPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId '6m8heKnWhzfe2Nub' \
    --userId 'eoKFeIaFQCYoDPIC' \
    > test.out 2>&1
eval_tap $? 42 'AdminJoinPartyV1' test.out

#- 43 AdminGetUserPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetUserPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pnduEEQlULdJz4mn' \
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
    --userId 'RBkMNxvvKgAT8mJr' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetAllPlayerSessionAttribute' test.out

#- 46 AdminSetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminSetPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yq6hRkloqxM3gpwx' \
    --body '{"attributes": {"cfMy9XzjjI5YbsKo": "ADkzJEN2VHzih3bi", "t0VWn3CO39PXDNxt": "XgeO3FgkXhjDzaQY", "3snn2ZkP7cFdP43e": "5dC9XIBudfZgrbHD"}}' \
    > test.out 2>&1
eval_tap $? 46 'AdminSetPlayerSessionAttribute' test.out

#- 47 AdminGetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerSessionAttribute \
    --attribute 'IDm4hMzF4TxodenS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rUTvfqU0bfoMm5cT' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerSessionAttribute' test.out

#- 48 AdminGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tFWbotQyXJRcQWsm' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetPlayerBlockedPlayersV1' test.out

#- 49 AdminGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qPNs92epxk0i8Vxs' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetPlayerBlockedByPlayersV1' test.out

#- 50 AdminBulkBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZNereSvf9699mCEH' \
    --body '{"listBlockedUserId": ["ThUJkETAsSp7gh4T", "eUTkOkAYfJB8AT9t", "4Tv207Y2QD3oD5fL"]}' \
    > test.out 2>&1
eval_tap $? 50 'AdminBulkBlockPlayersV1' test.out

#- 51 AdminDebugProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminDebugProfanityFilters \
    --namespace "$AB_NAMESPACE" \
    --body '{"text": "Cr3OOlXVv8ZGF7uY"}' \
    > test.out 2>&1
eval_tap $? 51 'AdminDebugProfanityFilters' test.out

#- 52 AdminGetProfanityListFiltersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityListFiltersV1 \
    --list 'nGzpipNDigNJma1M' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'AdminGetProfanityListFiltersV1' test.out

#- 53 AdminAddProfanityFilterIntoList
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilterIntoList \
    --list 'bqqZtfNWql4nmwAf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "t4gqkNNlWkD9eOzi", "note": "YRFOn0jJLHC9Lxhv"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminAddProfanityFilterIntoList' test.out

#- 54 AdminAddProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilters \
    --list 'NXTwGBCtohLtl9Zu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filters": [{"filter": "hytm5UDrT6QXCs5S", "note": "PBbRPZTF6oQAXVG7"}, {"filter": "tnsZg5QgXjvyGJPN", "note": "4eXbJE5Vs2GcyomQ"}, {"filter": "oIXimBJehyxlNsjU", "note": "gxBkF6wFPoJeQedi"}]}' \
    > test.out 2>&1
eval_tap $? 54 'AdminAddProfanityFilters' test.out

#- 55 AdminImportProfanityFiltersFromFile
./ng net.accelbyte.sdk.cli.Main lobby adminImportProfanityFiltersFromFile \
    --list 'ogEhhM2rIizGdKvO' \
    --namespace "$AB_NAMESPACE" \
    --body '[86, 36, 7]' \
    > test.out 2>&1
eval_tap $? 55 'AdminImportProfanityFiltersFromFile' test.out

#- 56 AdminDeleteProfanityFilter
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityFilter \
    --list 'DzZSKscfOcYu3dpC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "ROYqUiGKXVFCmpo6"}' \
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
    --body '{"isEnabled": true, "isMandatory": false, "name": "PwVOEDSJsEK5QpNh"}' \
    > test.out 2>&1
eval_tap $? 58 'AdminCreateProfanityList' test.out

#- 59 AdminUpdateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateProfanityList \
    --list 'lI2iS5EpGhhvXYck' \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": false, "isMandatory": true, "newName": "9QM0NBMA9ORxpzwL"}' \
    > test.out 2>&1
eval_tap $? 59 'AdminUpdateProfanityList' test.out

#- 60 AdminDeleteProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityList \
    --list 'R2AK6eXUGPJsw1fi' \
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
    --body '{"rule": "P80G9Pclxcft2ulI"}' \
    > test.out 2>&1
eval_tap $? 62 'AdminSetProfanityRuleForNamespace' test.out

#- 63 AdminVerifyMessageProfanityResponse
./ng net.accelbyte.sdk.cli.Main lobby adminVerifyMessageProfanityResponse \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "JzPyrVEiOG4Ucqsu", "profanityLevel": "GKHhMRWLVd3DlhLu"}' \
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
    --body '{"apiKey": "IpomM8sm1MiaI1mX"}' \
    > test.out 2>&1
eval_tap $? 65 'AdminUpdateThirdPartyConfig' test.out

#- 66 AdminCreateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminCreateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "2tJoARtdbBe7udsM"}' \
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

#- 69 PublicGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'rok0WvGYYnx4V709' \
    > test.out 2>&1
eval_tap $? 69 'PublicGetPartyDataV1' test.out

#- 70 PublicUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby publicUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xbnGezKsDwG2omOR' \
    --body '{"custom_attribute": {"2nvYI9TVqJdvzcWb": {}, "fUpaXp5JMl5LL4bT": {}, "xBmZjdrrIxsB0NRs": {}}, "updatedAt": 56}' \
    > test.out 2>&1
eval_tap $? 70 'PublicUpdatePartyAttributesV1' test.out

#- 71 PublicSetPartyLimitV1
./ng net.accelbyte.sdk.cli.Main lobby publicSetPartyLimitV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'XTvKCWwNTAhd2wrS' \
    --body '{"limit": 88}' \
    > test.out 2>&1
eval_tap $? 71 'PublicSetPartyLimitV1' test.out

#- 72 PublicGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'PublicGetPlayerBlockedPlayersV1' test.out

#- 73 PublicGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'PublicGetPlayerBlockedByPlayersV1' test.out

#- 74 UsersPresenceHandlerV1
./ng net.accelbyte.sdk.cli.Main lobby usersPresenceHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --countOnly  \
    --userIds 'uPdjhdinpng5BLy8' \
    > test.out 2>&1
eval_tap $? 74 'UsersPresenceHandlerV1' test.out

#- 75 FreeFormNotification
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotification \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "wbhMssAHjapIkY9R", "topic": "f4wP57dBZNR88YbC"}' \
    > test.out 2>&1
eval_tap $? 75 'FreeFormNotification' test.out

#- 76 NotificationWithTemplate
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"tmKy8M9zVrjfGXZn": "qAQUoY1GjlIIk0iK", "oTTS1j02o7JjTXAQ": "N0qdskdQV0TqI8EF", "nmDbxIxi4YKlONk2": "Q5Y4Jvaizwiilatu"}, "templateLanguage": "Ujjt9lIMGql5ElEa", "templateSlug": "9EIIlGcHB3CfR3nc", "topic": "Dlwi3v3MFFJ1KesK"}' \
    > test.out 2>&1
eval_tap $? 76 'NotificationWithTemplate' test.out

#- 77 GetGameTemplate
./ng net.accelbyte.sdk.cli.Main lobby getGameTemplate \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'GetGameTemplate' test.out

#- 78 CreateTemplate
./ng net.accelbyte.sdk.cli.Main lobby createTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "oELCpobBEG8X645x", "templateLanguage": "pdXpai0rYaT5hOPj", "templateSlug": "af3H0tYighU0VUfc"}' \
    > test.out 2>&1
eval_tap $? 78 'CreateTemplate' test.out

#- 79 GetSlugTemplate
./ng net.accelbyte.sdk.cli.Main lobby getSlugTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'YHJbBfAKSiPW3Vgs' \
    --after 'ZXiR1DJ7HVWqMkNS' \
    --before 'awQUWDFJvJBWic7U' \
    --limit '21' \
    > test.out 2>&1
eval_tap $? 79 'GetSlugTemplate' test.out

#- 80 DeleteTemplateSlug
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateSlug \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'hJPUAc0RVwXgAgnt' \
    > test.out 2>&1
eval_tap $? 80 'DeleteTemplateSlug' test.out

#- 81 GetLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby getLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'LMCuaXBWQi6BqPg4' \
    --templateSlug 'xr0lCancUZGCHsZY' \
    > test.out 2>&1
eval_tap $? 81 'GetLocalizationTemplate' test.out

#- 82 UpdateLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby updateLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'oLfR1KtOv7Zy0b65' \
    --templateSlug 'uvuKNuy0ytZQ7M6N' \
    --body '{"templateContent": "zy1adnSKOLFKx1dX"}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateLocalizationTemplate' test.out

#- 83 DeleteTemplateLocalization
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalization \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '4LuWJu3pDMUAeeZ9' \
    --templateSlug '7SBROPYuG6XqP6oo' \
    > test.out 2>&1
eval_tap $? 83 'DeleteTemplateLocalization' test.out

#- 84 PublishTemplate
./ng net.accelbyte.sdk.cli.Main lobby publishTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '7G73zdxTgOfnwIdl' \
    --templateSlug 'Na29fDLh741IslKH' \
    > test.out 2>&1
eval_tap $? 84 'PublishTemplate' test.out

#- 85 GetTopicByNamespace
./ng net.accelbyte.sdk.cli.Main lobby getTopicByNamespace \
    --namespace "$AB_NAMESPACE" \
    --after 'zGlLKWUtDQs61OQA' \
    --before 'oxyyQpRWCiiPDGQh' \
    --limit '81' \
    > test.out 2>&1
eval_tap $? 85 'GetTopicByNamespace' test.out

#- 86 CreateTopic
./ng net.accelbyte.sdk.cli.Main lobby createTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "X8lNtFEJ7tnkY6Mc", "topic": "a5afj12K2IzrBvvW"}' \
    > test.out 2>&1
eval_tap $? 86 'CreateTopic' test.out

#- 87 GetTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby getTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'm4udE0OXudXgNne8' \
    > test.out 2>&1
eval_tap $? 87 'GetTopicByTopicName' test.out

#- 88 UpdateTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby updateTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'kJATwlc6esUp6Sw1' \
    --body '{"description": "I98jeZQ7hfxnhLd3"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateTopicByTopicName' test.out

#- 89 DeleteTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby deleteTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'Knaknoed9DHhLOqQ' \
    > test.out 2>&1
eval_tap $? 89 'DeleteTopicByTopicName' test.out

#- 90 FreeFormNotificationByUserID
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotificationByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'GhCUr6iTrjyEgarA' \
    --body '{"message": "dNJOIG36I6tRbRcr", "topic": "EveMdAdiPKDUVSC0"}' \
    > test.out 2>&1
eval_tap $? 90 'FreeFormNotificationByUserID' test.out

#- 91 NotificationWithTemplateByUserID
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplateByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId '0PYeDcagginxnFIn' \
    --body '{"templateContext": {"a3yddcbsPheTH26I": "UJNvYuGRUvpZaHCu", "ESOiIZsMfB4ZH3mt": "gWgU4pCAKxeE70Ca", "unQNxot371W9G4Av": "QkqsGnmyo5JJTUVm"}, "templateLanguage": "b8GEXFTlEMEsFzYq", "templateSlug": "wgK1Np5nodqpLm7F", "topic": "hJBNXzAFdO0Khqf6"}' \
    > test.out 2>&1
eval_tap $? 91 'NotificationWithTemplateByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE