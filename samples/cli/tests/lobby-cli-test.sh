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
echo "1..95"

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

#- 7 GetUserFriendsWithPlatform
./ng net.accelbyte.sdk.cli.Main lobby getUserFriendsWithPlatform \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'GetUserFriendsWithPlatform' test.out

#- 8 UserRequestFriend
./ng net.accelbyte.sdk.cli.Main lobby userRequestFriend \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "AxcVpFrttufHIRdH", "friendPublicId": "9UzVRiXbqlAw7r6W"}' \
    > test.out 2>&1
eval_tap $? 8 'UserRequestFriend' test.out

#- 9 UserAcceptFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userAcceptFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "2ktQG0h5JAav5kRa"}' \
    > test.out 2>&1
eval_tap $? 9 'UserAcceptFriendRequest' test.out

#- 10 UserCancelFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userCancelFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "62WopBJHPtcDs8bB"}' \
    > test.out 2>&1
eval_tap $? 10 'UserCancelFriendRequest' test.out

#- 11 UserRejectFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userRejectFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "ZLCXLx8bbgorQeFb"}' \
    > test.out 2>&1
eval_tap $? 11 'UserRejectFriendRequest' test.out

#- 12 UserGetFriendshipStatus
./ng net.accelbyte.sdk.cli.Main lobby userGetFriendshipStatus \
    --friendId 'Q1g7qbPngUNB1vRo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'UserGetFriendshipStatus' test.out

#- 13 UserUnfriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userUnfriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "dwpzS6DaDpv8N7ZQ"}' \
    > test.out 2>&1
eval_tap $? 13 'UserUnfriendRequest' test.out

#- 14 AddFriendsWithoutConfirmation
./ng net.accelbyte.sdk.cli.Main lobby addFriendsWithoutConfirmation \
    --namespace "$AB_NAMESPACE" \
    --userId 'VqGj6oDLjWjkY1aX' \
    --body '{"friendIds": ["lFcDtgOjchIua5tW", "EIC32ogW7olvbTgr", "hRTcPiSuL0Sly6XM"]}' \
    > test.out 2>&1
eval_tap $? 14 'AddFriendsWithoutConfirmation' test.out

#- 15 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 15 'AdminGetAllConfigV1' test.out

#- 16 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetConfigV1' test.out

#- 17 AdminUpdateConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowInviteNonConnectedUser": true, "allowJoinPartyDuringMatchmaking": true, "autoKickOnDisconnect": false, "autoKickOnDisconnectDelay": 45, "cancelTicketOnDisconnect": false, "chatRateLimitBurst": 50, "chatRateLimitDuration": 55, "concurrentUsersLimit": 54, "disableInvitationOnJoinParty": false, "enableChat": false, "entitlementCheck": true, "entitlementItemID": "zjMf8GZ2WBZqxYG3", "generalRateLimitBurst": 0, "generalRateLimitDuration": 87, "keepPresenceActivityOnDisconnect": true, "maxDSWaitTime": 84, "maxPartyMember": 55, "profanityFilter": true, "readyConsentTimeout": 41, "unregisterDelay": 86}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateConfigV1' test.out

#- 18 AdminExportConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminExportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminExportConfigV1' test.out

#- 19 AdminImportConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminImportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 19 'AdminImportConfigV1' test.out

#- 20 GetListOfFriends
./ng net.accelbyte.sdk.cli.Main lobby getListOfFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'D6QVKNCWP75TB0i7' \
    --limit '31' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 20 'GetListOfFriends' test.out

#- 21 GetIncomingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getIncomingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'KxR8dl0zRVW4EZG9' \
    --limit '25' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 21 'GetIncomingFriendRequests' test.out

#- 22 GetOutgoingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getOutgoingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'cgGVbMqSszE8GHav' \
    --limit '20' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 22 'GetOutgoingFriendRequests' test.out

#- 23 SendMultipleUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendMultipleUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "7AorKsxwkosAVerX", "topicName": "pc1C8XfwHuKeb9l3", "userIds": ["rGN9A3sNm84hddSp", "Ht0P7MIIR7CkyF6C", "7duuyZ0GhDogqrhB"]}' \
    > test.out 2>&1
eval_tap $? 23 'SendMultipleUsersFreeformNotificationV1Admin' test.out

#- 24 SendUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "Rd8lDR6qVNPRZYdF", "topicName": "LIAjGGJddVCvu9vx"}' \
    > test.out 2>&1
eval_tap $? 24 'SendUsersFreeformNotificationV1Admin' test.out

#- 25 SendPartyFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId '5KQ7KYnIuMBvaO35' \
    --body '{"message": "llzQRaT5kPxUfofv", "topicName": "nnSuB0y5WUlrMdI4"}' \
    > test.out 2>&1
eval_tap $? 25 'SendPartyFreeformNotificationV1Admin' test.out

#- 26 SendPartyTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'sNveabntBSxTeIv5' \
    --body '{"templateContext": {"3HGCiljvjKoyD6SC": "wGrncqmLtjQHAf8T", "goNm03VLisV6zwPu": "o3td6TC6I3lMjGSW", "N2laRlxfcjHfYakU": "CTqGkE7wcWfDslpJ"}, "templateLanguage": "SqGAXQ0yYoNRKd3I", "templateSlug": "L5TAQ6iiPlSC2uE4", "topicName": "o5Vwdo3fePqIJA8I"}' \
    > test.out 2>&1
eval_tap $? 26 'SendPartyTemplatedNotificationV1Admin' test.out

#- 27 GetAllNotificationTemplatesV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTemplatesV1Admin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllNotificationTemplatesV1Admin' test.out

#- 28 CreateNotificationTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "Htrkmu0hpDDWVAla", "templateLanguage": "2l5BYNtIuS5S5XUd", "templateSlug": "jsoqwGyzzWi9gwQY"}' \
    > test.out 2>&1
eval_tap $? 28 'CreateNotificationTemplateV1Admin' test.out

#- 29 SendUsersTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"v7t1o7TTr1DmrhZv": "15T7quIOvBMcaYmv", "CkGZ5dAgqxpBFmaL": "oxozr6wfNPX2bOIt", "RMvqtlB2jJCSQT27": "9ZZPYGu0rdlgdWyO"}, "templateLanguage": "tXi3choQrpOsDBU5", "templateSlug": "SepjChB3V0v52Dly", "topicName": "m6puQ23xoJ8aeCna"}' \
    > test.out 2>&1
eval_tap $? 29 'SendUsersTemplatedNotificationV1Admin' test.out

#- 30 GetTemplateSlugLocalizationsTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'LpUKp44YUDjasWIP' \
    --after 'UvmEejtGeoyIPa8Z' \
    --before 'Rrvjj7il35MXbN9o' \
    --limit '59' \
    > test.out 2>&1
eval_tap $? 30 'GetTemplateSlugLocalizationsTemplateV1Admin' test.out

#- 31 DeleteNotificationTemplateSlugV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'Lo0LSP0pf4IxjUkl' \
    > test.out 2>&1
eval_tap $? 31 'DeleteNotificationTemplateSlugV1Admin' test.out

#- 32 GetSingleTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getSingleTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '535X3ateEKDpADz1' \
    --templateSlug 'x3poD3Qgb3boLQQ1' \
    > test.out 2>&1
eval_tap $? 32 'GetSingleTemplateLocalizationV1Admin' test.out

#- 33 UpdateTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'MzH7Qm8bwbmXgdAP' \
    --templateSlug 'h1EThG96gAFKK2WD' \
    --body '{"templateContent": "gCcxvONZm3EeERmD"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateTemplateLocalizationV1Admin' test.out

#- 34 DeleteTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'nyeFoF7VSZ6pf3vn' \
    --templateSlug 'eSD2Tb3g7mSQUhAE' \
    > test.out 2>&1
eval_tap $? 34 'DeleteTemplateLocalizationV1Admin' test.out

#- 35 PublishTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby publishTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'trmjqU6YE3p4lSck' \
    --templateSlug '0ZHn5GI39YBHqaTH' \
    > test.out 2>&1
eval_tap $? 35 'PublishTemplateLocalizationV1Admin' test.out

#- 36 GetAllNotificationTopicsV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTopicsV1Admin \
    --namespace "$AB_NAMESPACE" \
    --after 'eKtW18iGeUlc9d9s' \
    --before 'ogWa24CKNS0GqVvU' \
    --limit '12' \
    > test.out 2>&1
eval_tap $? 36 'GetAllNotificationTopicsV1Admin' test.out

#- 37 CreateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "yEW4ZJJ42d3PBddN", "topicName": "8S48l9lyNApflxqM"}' \
    > test.out 2>&1
eval_tap $? 37 'CreateNotificationTopicV1Admin' test.out

#- 38 GetNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'rj3oZk03QXcKMDYD' \
    > test.out 2>&1
eval_tap $? 38 'GetNotificationTopicV1Admin' test.out

#- 39 UpdateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'DxHSZjtqXyJ58f7G' \
    --body '{"description": "c26SaiGVkydwYWQG"}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateNotificationTopicV1Admin' test.out

#- 40 DeleteNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName '26yUZNmTBcvrbYCw' \
    > test.out 2>&1
eval_tap $? 40 'DeleteNotificationTopicV1Admin' test.out

#- 41 SendSpecificUserFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZtxFHyPLtI8ilbyD' \
    --body '{"message": "PUIj88cekdqCt81P", "topicName": "1ktfIovmv9gsR5cJ"}' \
    > test.out 2>&1
eval_tap $? 41 'SendSpecificUserFreeformNotificationV1Admin' test.out

#- 42 SendSpecificUserTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'cHm3SZLxoRDFuuuy' \
    --body '{"templateContext": {"Sj29a9LJE8HoRS1X": "2PFAAMwzHPxB1Usk", "Ys4Yw20DOqOBSC2D": "KHRuPMMWH8Yb33T5", "UBJCjfcnLRfxeCSz": "9WEi8KlloeH0JT1y"}, "templateLanguage": "duat2vQR3biBfsu4", "templateSlug": "jmsRE2w1yEkLgh3t", "topicName": "IYt4SqYUTLDx9gIi"}' \
    > test.out 2>&1
eval_tap $? 42 'SendSpecificUserTemplatedNotificationV1Admin' test.out

#- 43 AdminGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'DandpGT2t24aOMh5' \
    > test.out 2>&1
eval_tap $? 43 'AdminGetPartyDataV1' test.out

#- 44 AdminUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'eC3IHeHSKLCa3xre' \
    --body '{"custom_attribute": {"NDUWehwH3q31A806": {}, "DJgas4b6z3LNUj7f": {}, "dgLA84Z8YYk6QEgJ": {}}, "updatedAt": 19}' \
    > test.out 2>&1
eval_tap $? 44 'AdminUpdatePartyAttributesV1' test.out

#- 45 AdminJoinPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminJoinPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'EEQlULdJz4mnRBkM' \
    --userId 'NxvvKgAT8mJrYq6h' \
    > test.out 2>&1
eval_tap $? 45 'AdminJoinPartyV1' test.out

#- 46 AdminGetUserPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetUserPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RkloqxM3gpwxcfMy' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetUserPartyV1' test.out

#- 47 AdminGetLobbyCCU
./ng net.accelbyte.sdk.cli.Main lobby adminGetLobbyCCU \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'AdminGetLobbyCCU' test.out

#- 48 AdminGetBulkPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetBulkPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listBlockedUserId": ["9XzjjI5YbsKoADkz", "JEN2VHzih3bit0VW", "n3CO39PXDNxtXgeO"]}' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetBulkPlayerBlockedPlayersV1' test.out

#- 49 AdminGetAllPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId '3FgkXhjDzaQY3snn' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetAllPlayerSessionAttribute' test.out

#- 50 AdminSetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminSetPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId '2ZkP7cFdP43e5dC9' \
    --body '{"attributes": {"XIBudfZgrbHDIDm4": "hMzF4TxodenSrUTv", "fqU0bfoMm5cTtFWb": "otQyXJRcQWsmqPNs", "92epxk0i8VxsZNer": "eSvf9699mCEHThUJ"}}' \
    > test.out 2>&1
eval_tap $? 50 'AdminSetPlayerSessionAttribute' test.out

#- 51 AdminGetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerSessionAttribute \
    --attribute 'kETAsSp7gh4TeUTk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OkAYfJB8AT9t4Tv2' \
    > test.out 2>&1
eval_tap $? 51 'AdminGetPlayerSessionAttribute' test.out

#- 52 AdminGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '07Y2QD3oD5fLCr3O' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetPlayerBlockedPlayersV1' test.out

#- 53 AdminGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OlXVv8ZGF7uYnGzp' \
    > test.out 2>&1
eval_tap $? 53 'AdminGetPlayerBlockedByPlayersV1' test.out

#- 54 AdminBulkBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ipNDigNJma1MbqqZ' \
    --body '{"listBlockedUserId": ["tfNWql4nmwAft4gq", "kNNlWkD9eOziYRFO", "n0jJLHC9LxhvNXTw"]}' \
    > test.out 2>&1
eval_tap $? 54 'AdminBulkBlockPlayersV1' test.out

#- 55 AdminDebugProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminDebugProfanityFilters \
    --namespace "$AB_NAMESPACE" \
    --body '{"text": "GBCtohLtl9Zuhytm"}' \
    > test.out 2>&1
eval_tap $? 55 'AdminDebugProfanityFilters' test.out

#- 56 AdminGetProfanityListFiltersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityListFiltersV1 \
    --list '5UDrT6QXCs5SPBbR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'AdminGetProfanityListFiltersV1' test.out

#- 57 AdminAddProfanityFilterIntoList
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilterIntoList \
    --list 'PZTF6oQAXVG7tnsZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "g5QgXjvyGJPN4eXb", "note": "JE5Vs2GcyomQoIXi"}' \
    > test.out 2>&1
eval_tap $? 57 'AdminAddProfanityFilterIntoList' test.out

#- 58 AdminAddProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilters \
    --list 'mBJehyxlNsjUgxBk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filters": [{"filter": "F6wFPoJeQediogEh", "note": "hM2rIizGdKvOPdq5"}, {"filter": "xrgxSmy1DN9LFkYW", "note": "5DQyj4bj5Ro2ogaK"}, {"filter": "t2ujQSa3Zdb65UXm", "note": "y0Zp6iIaTIKUkmkk"}]}' \
    > test.out 2>&1
eval_tap $? 58 'AdminAddProfanityFilters' test.out

#- 59 AdminImportProfanityFiltersFromFile
./ng net.accelbyte.sdk.cli.Main lobby adminImportProfanityFiltersFromFile \
    --list '9QM0NBMA9ORxpzwL' \
    --namespace "$AB_NAMESPACE" \
    --body '[90, 2, 54]' \
    > test.out 2>&1
eval_tap $? 59 'AdminImportProfanityFiltersFromFile' test.out

#- 60 AdminDeleteProfanityFilter
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityFilter \
    --list 'u1bNCtX7W40V6Do5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "sYadCCFrHHC3DpZx"}' \
    > test.out 2>&1
eval_tap $? 60 'AdminDeleteProfanityFilter' test.out

#- 61 AdminGetProfanityLists
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityLists \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'AdminGetProfanityLists' test.out

#- 62 AdminCreateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminCreateProfanityList \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": false, "isMandatory": true, "name": "rQDXuNFviMarv8mn"}' \
    > test.out 2>&1
eval_tap $? 62 'AdminCreateProfanityList' test.out

#- 63 AdminUpdateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateProfanityList \
    --list 'fHK8CCmE2lPnsbD3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": true, "isMandatory": true, "newName": "dlwuUccE536ugBp3"}' \
    > test.out 2>&1
eval_tap $? 63 'AdminUpdateProfanityList' test.out

#- 64 AdminDeleteProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityList \
    --list 'HBvepnDCjgyJlXe3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'AdminDeleteProfanityList' test.out

#- 65 AdminGetProfanityRule
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityRule \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AdminGetProfanityRule' test.out

#- 66 AdminSetProfanityRuleForNamespace
./ng net.accelbyte.sdk.cli.Main lobby adminSetProfanityRuleForNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"rule": "6mgWjLfFmteue9nz"}' \
    > test.out 2>&1
eval_tap $? 66 'AdminSetProfanityRuleForNamespace' test.out

#- 67 AdminVerifyMessageProfanityResponse
./ng net.accelbyte.sdk.cli.Main lobby adminVerifyMessageProfanityResponse \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "J6fH24T805tVg8Jq", "profanityLevel": "U0jZpjvsugAOS7u8"}' \
    > test.out 2>&1
eval_tap $? 67 'AdminVerifyMessageProfanityResponse' test.out

#- 68 AdminGetThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'AdminGetThirdPartyConfig' test.out

#- 69 AdminUpdateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "RiWyerCSa8SRgwsA"}' \
    > test.out 2>&1
eval_tap $? 69 'AdminUpdateThirdPartyConfig' test.out

#- 70 AdminCreateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminCreateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "j1ik1jglaDXTvKCW"}' \
    > test.out 2>&1
eval_tap $? 70 'AdminCreateThirdPartyConfig' test.out

#- 71 AdminDeleteThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'AdminDeleteThirdPartyConfig' test.out

#- 72 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main lobby publicGetMessages \
    > test.out 2>&1
eval_tap $? 72 'PublicGetMessages' test.out

#- 73 PublicGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'wNTAhd2wrS0uPdjh' \
    > test.out 2>&1
eval_tap $? 73 'PublicGetPartyDataV1' test.out

#- 74 PublicUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby publicUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dinpng5BLy8wbhMs' \
    --body '{"custom_attribute": {"sAHjapIkY9Rf4wP5": {}, "7dBZNR88YbCtmKy8": {}, "M9zVrjfGXZnqAQUo": {}}, "updatedAt": 92}' \
    > test.out 2>&1
eval_tap $? 74 'PublicUpdatePartyAttributesV1' test.out

#- 75 PublicSetPartyLimitV1
./ng net.accelbyte.sdk.cli.Main lobby publicSetPartyLimitV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'GjlIIk0iKoTTS1j0' \
    --body '{"limit": 89}' \
    > test.out 2>&1
eval_tap $? 75 'PublicSetPartyLimitV1' test.out

#- 76 PublicGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'PublicGetPlayerBlockedPlayersV1' test.out

#- 77 PublicGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'PublicGetPlayerBlockedByPlayersV1' test.out

#- 78 UsersPresenceHandlerV1
./ng net.accelbyte.sdk.cli.Main lobby usersPresenceHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --countOnly  \
    --userIds 'o7JjTXAQN0qdskdQ' \
    > test.out 2>&1
eval_tap $? 78 'UsersPresenceHandlerV1' test.out

#- 79 FreeFormNotification
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotification \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "V0TqI8EFnmDbxIxi", "topic": "4YKlONk2Q5Y4Jvai"}' \
    > test.out 2>&1
eval_tap $? 79 'FreeFormNotification' test.out

#- 80 NotificationWithTemplate
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"zwiilatuUjjt9lIM": "Gql5ElEa9EIIlGcH", "B3CfR3ncDlwi3v3M": "FFJ1KesKoELCpobB", "EG8X645xpdXpai0r": "YaT5hOPjaf3H0tYi"}, "templateLanguage": "ghU0VUfcYHJbBfAK", "templateSlug": "SiPW3VgsZXiR1DJ7", "topic": "HVWqMkNSawQUWDFJ"}' \
    > test.out 2>&1
eval_tap $? 80 'NotificationWithTemplate' test.out

#- 81 GetGameTemplate
./ng net.accelbyte.sdk.cli.Main lobby getGameTemplate \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'GetGameTemplate' test.out

#- 82 CreateTemplate
./ng net.accelbyte.sdk.cli.Main lobby createTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "vJBWic7UkBeIXuqD", "templateLanguage": "uAXI66bQ71w0deoV", "templateSlug": "9Lx5RDA1l2XcrciY"}' \
    > test.out 2>&1
eval_tap $? 82 'CreateTemplate' test.out

#- 83 GetSlugTemplate
./ng net.accelbyte.sdk.cli.Main lobby getSlugTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'NEzvSZIPkhSgORcz' \
    --after '5S5BvmgBLxh4ijFn' \
    --before 'E3Tam69qSZ7PC6f6' \
    --limit '87' \
    > test.out 2>&1
eval_tap $? 83 'GetSlugTemplate' test.out

#- 84 DeleteTemplateSlug
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateSlug \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'OLFKx1dX4LuWJu3p' \
    > test.out 2>&1
eval_tap $? 84 'DeleteTemplateSlug' test.out

#- 85 GetLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby getLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'DMUAeeZ97SBROPYu' \
    --templateSlug 'G6XqP6oo7G73zdxT' \
    > test.out 2>&1
eval_tap $? 85 'GetLocalizationTemplate' test.out

#- 86 UpdateLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby updateLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'gOfnwIdlNa29fDLh' \
    --templateSlug '741IslKHzGlLKWUt' \
    --body '{"templateContent": "DQs61OQAoxyyQpRW"}' \
    > test.out 2>&1
eval_tap $? 86 'UpdateLocalizationTemplate' test.out

#- 87 DeleteTemplateLocalization
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalization \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'CiiPDGQhNPEwiJCf' \
    --templateSlug '2XJVrlzqQls1ozhL' \
    > test.out 2>&1
eval_tap $? 87 'DeleteTemplateLocalization' test.out

#- 88 PublishTemplate
./ng net.accelbyte.sdk.cli.Main lobby publishTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'VA3kE8jKvgatOEBM' \
    --templateSlug '70TdlNBJYOmpu1VC' \
    > test.out 2>&1
eval_tap $? 88 'PublishTemplate' test.out

#- 89 GetTopicByNamespace
./ng net.accelbyte.sdk.cli.Main lobby getTopicByNamespace \
    --namespace "$AB_NAMESPACE" \
    --after 'arzBsV6xnZ5Jrzzj' \
    --before 'rcaug6CWVG8SWP3g' \
    --limit '24' \
    > test.out 2>&1
eval_tap $? 89 'GetTopicByNamespace' test.out

#- 90 CreateTopic
./ng net.accelbyte.sdk.cli.Main lobby createTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "9DHhLOqQGhCUr6iT", "topic": "rjyEgarAdNJOIG36"}' \
    > test.out 2>&1
eval_tap $? 90 'CreateTopic' test.out

#- 91 GetTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby getTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'I6tRbRcrEveMdAdi' \
    > test.out 2>&1
eval_tap $? 91 'GetTopicByTopicName' test.out

#- 92 UpdateTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby updateTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'PKDUVSC00PYeDcag' \
    --body '{"description": "ginxnFIna3yddcbs"}' \
    > test.out 2>&1
eval_tap $? 92 'UpdateTopicByTopicName' test.out

#- 93 DeleteTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby deleteTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'PheTH26IUJNvYuGR' \
    > test.out 2>&1
eval_tap $? 93 'DeleteTopicByTopicName' test.out

#- 94 FreeFormNotificationByUserID
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotificationByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'UvpZaHCuESOiIZsM' \
    --body '{"message": "fB4ZH3mtgWgU4pCA", "topic": "KxeE70CaunQNxot3"}' \
    > test.out 2>&1
eval_tap $? 94 'FreeFormNotificationByUserID' test.out

#- 95 NotificationWithTemplateByUserID
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplateByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId '71W9G4AvQkqsGnmy' \
    --body '{"templateContext": {"o5JJTUVmb8GEXFTl": "EMEsFzYqwgK1Np5n", "odqpLm7FhJBNXzAF": "dO0Khqf6kiTdSGv2", "LFjAKY7CbgsWqFWZ": "X7kPBom8F9GLLTG8"}, "templateLanguage": "phc3n4iLoIllKlpO", "templateSlug": "2pqiXJF3WGRaoQom", "topic": "SJC4DdrKF7SUQPLG"}' \
    > test.out 2>&1
eval_tap $? 95 'NotificationWithTemplateByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE