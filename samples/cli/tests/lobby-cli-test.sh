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
echo "1..100"

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

#- 25 AdminGetGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetGlobalConfig \
    > test.out 2>&1
eval_tap $? 25 'AdminGetGlobalConfig' test.out

#- 26 AdminUpdateGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateGlobalConfig \
    --body '{"regionRetryMapping": {"RlxfcjHfYakUCTqG": ["kE7wcWfDslpJSqGA", "XQ0yYoNRKd3IL5TA", "Q6iiPlSC2uE4o5Vw"], "do3fePqIJA8IHtrk": ["mu0hpDDWVAla2l5B", "YNtIuS5S5XUdjsoq", "wGyzzWi9gwQYv7t1"], "o7TTr1DmrhZv15T7": ["quIOvBMcaYmvCkGZ", "5dAgqxpBFmaLoxoz", "r6wfNPX2bOItRMvq"]}, "regionURLMapping": ["tlB2jJCSQT279ZZP", "YGu0rdlgdWyOtXi3", "choQrpOsDBU5Sepj"], "testGameMode": "ChB3V0v52Dlym6pu", "testRegionURLMapping": ["Q23xoJ8aeCnaLpUK", "p44YUDjasWIPUvmE", "ejtGeoyIPa8ZRrvj"], "testTargetUserIDs": ["j7il35MXbN9oCMNq", "q98SjTvhZNkSQ70D", "0H6BXksUC9b6i5lZ"]}' \
    > test.out 2>&1
eval_tap $? 26 'AdminUpdateGlobalConfig' test.out

#- 27 AdminDeleteGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteGlobalConfig \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteGlobalConfig' test.out

#- 28 SendMultipleUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendMultipleUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "C9xv32e8c5csSovo", "topicName": "qsZNBdte9NDUPVJf", "userIds": ["6c2Z0QZxfgPubTDI", "HrvqAThuwjRHpKKT", "lmVr9XuoJbRFQSKV"]}' \
    > test.out 2>&1
eval_tap $? 28 'SendMultipleUsersFreeformNotificationV1Admin' test.out

#- 29 SendUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "PHbn4Xxtu7LQRENj", "topicName": "EEztx1WsYSiZqan0"}' \
    > test.out 2>&1
eval_tap $? 29 'SendUsersFreeformNotificationV1Admin' test.out

#- 30 SendPartyFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'nSBJroav91GXlvPG' \
    --body '{"message": "6bFYReVHQipcCx9Z", "topicName": "w5D2L7vIYhGGSyEW"}' \
    > test.out 2>&1
eval_tap $? 30 'SendPartyFreeformNotificationV1Admin' test.out

#- 31 SendPartyTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId '4ZJJ42d3PBddN8S4' \
    --body '{"templateContext": {"8l9lyNApflxqMrj3": "oZk03QXcKMDYDDxH", "SZjtqXyJ58f7Gc26": "SaiGVkydwYWQG26y", "UZNmTBcvrbYCwZtx": "FHyPLtI8ilbyDPUI"}, "templateLanguage": "j88cekdqCt81P1kt", "templateSlug": "fIovmv9gsR5cJcHm", "topicName": "3SZLxoRDFuuuySj2"}' \
    > test.out 2>&1
eval_tap $? 31 'SendPartyTemplatedNotificationV1Admin' test.out

#- 32 GetAllNotificationTemplatesV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTemplatesV1Admin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetAllNotificationTemplatesV1Admin' test.out

#- 33 CreateNotificationTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "9a9LJE8HoRS1X2PF", "templateLanguage": "AAMwzHPxB1UskYs4", "templateSlug": "Yw20DOqOBSC2DKHR"}' \
    > test.out 2>&1
eval_tap $? 33 'CreateNotificationTemplateV1Admin' test.out

#- 34 SendUsersTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"uPMMWH8Yb33T5UBJ": "CjfcnLRfxeCSz9WE", "i8KlloeH0JT1ydua": "t2vQR3biBfsu4jms", "RE2w1yEkLgh3tIYt": "4SqYUTLDx9gIiDan"}, "templateLanguage": "dpGT2t24aOMh5eC3", "templateSlug": "IHeHSKLCa3xreNDU", "topicName": "WehwH3q31A806DJg"}' \
    > test.out 2>&1
eval_tap $? 34 'SendUsersTemplatedNotificationV1Admin' test.out

#- 35 GetTemplateSlugLocalizationsTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'as4b6z3LNUj7fdgL' \
    --after 'A84Z8YYk6QEgJjBb' \
    --before 'EDoNf3n0hEoRCAcf' \
    --limit '43' \
    > test.out 2>&1
eval_tap $? 35 'GetTemplateSlugLocalizationsTemplateV1Admin' test.out

#- 36 DeleteNotificationTemplateSlugV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug '0zfFyabWAgIUXiI0' \
    > test.out 2>&1
eval_tap $? 36 'DeleteNotificationTemplateSlugV1Admin' test.out

#- 37 GetSingleTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getSingleTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '7A68eaqC2J9jyEW6' \
    --templateSlug 'GLbc0NaKDUL3sa13' \
    > test.out 2>&1
eval_tap $? 37 'GetSingleTemplateLocalizationV1Admin' test.out

#- 38 UpdateTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'lk1dQBHO86IlBhne' \
    --templateSlug 'tU4RwTqUXlTDBzOu' \
    --body '{"templateContent": "YsaZA2yyd4mbqoOf"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateTemplateLocalizationV1Admin' test.out

#- 39 DeleteTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'ADMMAXFaY9eKa699' \
    --templateSlug 'bRVhyaKwwrAP2aMl' \
    > test.out 2>&1
eval_tap $? 39 'DeleteTemplateLocalizationV1Admin' test.out

#- 40 PublishTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby publishTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'u7WtjCtoYetOO847' \
    --templateSlug 'g8OudOfjnCuHZ3c4' \
    > test.out 2>&1
eval_tap $? 40 'PublishTemplateLocalizationV1Admin' test.out

#- 41 GetAllNotificationTopicsV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTopicsV1Admin \
    --namespace "$AB_NAMESPACE" \
    --after '6IjGa23YvYmmDg7V' \
    --before 'YPXIuvUYTZBRujIU' \
    --limit '63' \
    > test.out 2>&1
eval_tap $? 41 'GetAllNotificationTopicsV1Admin' test.out

#- 42 CreateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "9699mCEHThUJkETA", "topicName": "sSp7gh4TeUTkOkAY"}' \
    > test.out 2>&1
eval_tap $? 42 'CreateNotificationTopicV1Admin' test.out

#- 43 GetNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'fJB8AT9t4Tv207Y2' \
    > test.out 2>&1
eval_tap $? 43 'GetNotificationTopicV1Admin' test.out

#- 44 UpdateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'QD3oD5fLCr3OOlXV' \
    --body '{"description": "v8ZGF7uYnGzpipND"}' \
    > test.out 2>&1
eval_tap $? 44 'UpdateNotificationTopicV1Admin' test.out

#- 45 DeleteNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'igNJma1MbqqZtfNW' \
    > test.out 2>&1
eval_tap $? 45 'DeleteNotificationTopicV1Admin' test.out

#- 46 SendSpecificUserFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'ql4nmwAft4gqkNNl' \
    --body '{"message": "WkD9eOziYRFOn0jJ", "topicName": "LHC9LxhvNXTwGBCt"}' \
    > test.out 2>&1
eval_tap $? 46 'SendSpecificUserFreeformNotificationV1Admin' test.out

#- 47 SendSpecificUserTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'ohLtl9Zuhytm5UDr' \
    --body '{"templateContext": {"T6QXCs5SPBbRPZTF": "6oQAXVG7tnsZg5Qg", "XjvyGJPN4eXbJE5V": "s2GcyomQoIXimBJe", "hyxlNsjUgxBkF6wF": "PoJeQediogEhhM2r"}, "templateLanguage": "IizGdKvOPdq5xrgx", "templateSlug": "Smy1DN9LFkYW5DQy", "topicName": "j4bj5Ro2ogaKt2uj"}' \
    > test.out 2>&1
eval_tap $? 47 'SendSpecificUserTemplatedNotificationV1Admin' test.out

#- 48 AdminGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QSa3Zdb65UXmy0Zp' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetPartyDataV1' test.out

#- 49 AdminUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId '6iIaTIKUkmkk9QM0' \
    --body '{"custom_attribute": {"NBMA9ORxpzwLR2AK": {}, "6eXUGPJsw1fiP80G": {}, "9Pclxcft2ulIJzPy": {}}, "updatedAt": 35}' \
    > test.out 2>&1
eval_tap $? 49 'AdminUpdatePartyAttributesV1' test.out

#- 50 AdminJoinPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminJoinPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QDXuNFviMarv8mnf' \
    --userId 'HK8CCmE2lPnsbD3S' \
    > test.out 2>&1
eval_tap $? 50 'AdminJoinPartyV1' test.out

#- 51 AdminGetUserPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetUserPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GEdlwuUccE536ugB' \
    > test.out 2>&1
eval_tap $? 51 'AdminGetUserPartyV1' test.out

#- 52 AdminGetLobbyCCU
./ng net.accelbyte.sdk.cli.Main lobby adminGetLobbyCCU \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'AdminGetLobbyCCU' test.out

#- 53 AdminGetBulkPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetBulkPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listBlockedUserId": ["p3HBvepnDCjgyJlX", "e36mgWjLfFmteue9", "nzJ6fH24T805tVg8"]}' \
    > test.out 2>&1
eval_tap $? 53 'AdminGetBulkPlayerBlockedPlayersV1' test.out

#- 54 AdminGetAllPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'JqU0jZpjvsugAOS7' \
    > test.out 2>&1
eval_tap $? 54 'AdminGetAllPlayerSessionAttribute' test.out

#- 55 AdminSetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminSetPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'u8RiWyerCSa8SRgw' \
    --body '{"attributes": {"sAj1ik1jglaDXTvK": "CWwNTAhd2wrS0uPd", "jhdinpng5BLy8wbh": "MssAHjapIkY9Rf4w", "P57dBZNR88YbCtmK": "y8M9zVrjfGXZnqAQ"}}' \
    > test.out 2>&1
eval_tap $? 55 'AdminSetPlayerSessionAttribute' test.out

#- 56 AdminGetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerSessionAttribute \
    --attribute 'UoY1GjlIIk0iKoTT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'S1j02o7JjTXAQN0q' \
    > test.out 2>&1
eval_tap $? 56 'AdminGetPlayerSessionAttribute' test.out

#- 57 AdminGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dskdQV0TqI8EFnmD' \
    > test.out 2>&1
eval_tap $? 57 'AdminGetPlayerBlockedPlayersV1' test.out

#- 58 AdminGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bxIxi4YKlONk2Q5Y' \
    > test.out 2>&1
eval_tap $? 58 'AdminGetPlayerBlockedByPlayersV1' test.out

#- 59 AdminBulkBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '4JvaizwiilatuUjj' \
    --body '{"listBlockedUserId": ["t9lIMGql5ElEa9EI", "IlGcHB3CfR3ncDlw", "i3v3MFFJ1KesKoEL"]}' \
    > test.out 2>&1
eval_tap $? 59 'AdminBulkBlockPlayersV1' test.out

#- 60 AdminDebugProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminDebugProfanityFilters \
    --namespace "$AB_NAMESPACE" \
    --body '{"text": "CpobBEG8X645xpdX"}' \
    > test.out 2>&1
eval_tap $? 60 'AdminDebugProfanityFilters' test.out

#- 61 AdminGetProfanityListFiltersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityListFiltersV1 \
    --list 'pai0rYaT5hOPjaf3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'AdminGetProfanityListFiltersV1' test.out

#- 62 AdminAddProfanityFilterIntoList
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilterIntoList \
    --list 'H0tYighU0VUfcYHJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "bBfAKSiPW3VgsZXi", "note": "R1DJ7HVWqMkNSawQ"}' \
    > test.out 2>&1
eval_tap $? 62 'AdminAddProfanityFilterIntoList' test.out

#- 63 AdminAddProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilters \
    --list 'UWDFJvJBWic7UkBe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filters": [{"filter": "IXuqDuAXI66bQ71w", "note": "0deoV9Lx5RDA1l2X"}, {"filter": "crciYNEzvSZIPkhS", "note": "gORcz5S5BvmgBLxh"}, {"filter": "4ijFnE3Tam69qSZ7", "note": "PC6f6QkmZXElW9Yf"}]}' \
    > test.out 2>&1
eval_tap $? 63 'AdminAddProfanityFilters' test.out

#- 64 AdminImportProfanityFiltersFromFile
./ng net.accelbyte.sdk.cli.Main lobby adminImportProfanityFiltersFromFile \
    --list 'RSse6AAz3S4czz0Q' \
    --namespace "$AB_NAMESPACE" \
    --body '[75, 89, 64]' \
    > test.out 2>&1
eval_tap $? 64 'AdminImportProfanityFiltersFromFile' test.out

#- 65 AdminDeleteProfanityFilter
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityFilter \
    --list 'OPYuG6XqP6oo7G73' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "zdxTgOfnwIdlNa29"}' \
    > test.out 2>&1
eval_tap $? 65 'AdminDeleteProfanityFilter' test.out

#- 66 AdminGetProfanityLists
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityLists \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'AdminGetProfanityLists' test.out

#- 67 AdminCreateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminCreateProfanityList \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": false, "isMandatory": true, "name": "JhtafxMSJlHeb34s"}' \
    > test.out 2>&1
eval_tap $? 67 'AdminCreateProfanityList' test.out

#- 68 AdminUpdateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateProfanityList \
    --list 'ZKHcl5LLLOexL4fZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": true, "isMandatory": true, "newName": "CiiPDGQhNPEwiJCf"}' \
    > test.out 2>&1
eval_tap $? 68 'AdminUpdateProfanityList' test.out

#- 69 AdminDeleteProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityList \
    --list '2XJVrlzqQls1ozhL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'AdminDeleteProfanityList' test.out

#- 70 AdminGetProfanityRule
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityRule \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'AdminGetProfanityRule' test.out

#- 71 AdminSetProfanityRuleForNamespace
./ng net.accelbyte.sdk.cli.Main lobby adminSetProfanityRuleForNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"rule": "VA3kE8jKvgatOEBM"}' \
    > test.out 2>&1
eval_tap $? 71 'AdminSetProfanityRuleForNamespace' test.out

#- 72 AdminVerifyMessageProfanityResponse
./ng net.accelbyte.sdk.cli.Main lobby adminVerifyMessageProfanityResponse \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "70TdlNBJYOmpu1VC", "profanityLevel": "arzBsV6xnZ5Jrzzj"}' \
    > test.out 2>&1
eval_tap $? 72 'AdminVerifyMessageProfanityResponse' test.out

#- 73 AdminGetThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'AdminGetThirdPartyConfig' test.out

#- 74 AdminUpdateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "rcaug6CWVG8SWP3g"}' \
    > test.out 2>&1
eval_tap $? 74 'AdminUpdateThirdPartyConfig' test.out

#- 75 AdminCreateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminCreateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "lU6muswVJnNnN7kA"}' \
    > test.out 2>&1
eval_tap $? 75 'AdminCreateThirdPartyConfig' test.out

#- 76 AdminDeleteThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'AdminDeleteThirdPartyConfig' test.out

#- 77 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main lobby publicGetMessages \
    > test.out 2>&1
eval_tap $? 77 'PublicGetMessages' test.out

#- 78 PublicGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'a7j0riFc5HTHQIoV' \
    > test.out 2>&1
eval_tap $? 78 'PublicGetPartyDataV1' test.out

#- 79 PublicUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby publicUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'sGo7dwV9DBqFKHQk' \
    --body '{"custom_attribute": {"ETJyTlUrwDTnoujQ": {}, "D4IEiH9Z5qXn3aoR": {}, "tlqOECohViHA5Czg": {}}, "updatedAt": 64}' \
    > test.out 2>&1
eval_tap $? 79 'PublicUpdatePartyAttributesV1' test.out

#- 80 PublicSetPartyLimitV1
./ng net.accelbyte.sdk.cli.Main lobby publicSetPartyLimitV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'UvpZaHCuESOiIZsM' \
    --body '{"limit": 12}' \
    > test.out 2>&1
eval_tap $? 80 'PublicSetPartyLimitV1' test.out

#- 81 PublicGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'PublicGetPlayerBlockedPlayersV1' test.out

#- 82 PublicGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'PublicGetPlayerBlockedByPlayersV1' test.out

#- 83 UsersPresenceHandlerV1
./ng net.accelbyte.sdk.cli.Main lobby usersPresenceHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --countOnly  \
    --userIds 'AeMe4L3mDWORBVXT' \
    > test.out 2>&1
eval_tap $? 83 'UsersPresenceHandlerV1' test.out

#- 84 FreeFormNotification
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotification \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "IIJM9XsYIIZxiXNM", "topic": "R9BgaWcFX3SUBhyo"}' \
    > test.out 2>&1
eval_tap $? 84 'FreeFormNotification' test.out

#- 85 NotificationWithTemplate
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"TsMWPAxUMkawaGpA": "yrIwMif3BOdkocVT", "d4BxqGWV6mTJ0sQs": "6XNbjvqhnUVLWu8o", "lKdxL6ozRmDD0jJv": "lfV5OemPYdYT7DRO"}, "templateLanguage": "CjtuzFMbAG9YI89h", "templateSlug": "mguB8FOTjMLo4b9r", "topic": "IzqYkEpstyVTBcrM"}' \
    > test.out 2>&1
eval_tap $? 85 'NotificationWithTemplate' test.out

#- 86 GetGameTemplate
./ng net.accelbyte.sdk.cli.Main lobby getGameTemplate \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 86 'GetGameTemplate' test.out

#- 87 CreateTemplate
./ng net.accelbyte.sdk.cli.Main lobby createTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "8rG0rH0zcswwVeMK", "templateLanguage": "6MbGIVIu8vvwLc7K", "templateSlug": "Y3uVoJXTIMtpgkie"}' \
    > test.out 2>&1
eval_tap $? 87 'CreateTemplate' test.out

#- 88 GetSlugTemplate
./ng net.accelbyte.sdk.cli.Main lobby getSlugTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'DyF97lGdMiHKxbWC' \
    --after 'Yzo8yO2KTK9tmmOn' \
    --before 'YnOpas6ghP1y4Zi7' \
    --limit '38' \
    > test.out 2>&1
eval_tap $? 88 'GetSlugTemplate' test.out

#- 89 DeleteTemplateSlug
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateSlug \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'sHqffnrfsGlfPaZK' \
    > test.out 2>&1
eval_tap $? 89 'DeleteTemplateSlug' test.out

#- 90 GetLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby getLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'Bwa3Ddb60ufPpzwj' \
    --templateSlug '1QGIFmlVf4jvapse' \
    > test.out 2>&1
eval_tap $? 90 'GetLocalizationTemplate' test.out

#- 91 UpdateLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby updateLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'E9LN9bvhOrHflIOd' \
    --templateSlug '6X3viLvtEk4mTIpU' \
    --body '{"templateContent": "A9gxo8SV38nEhoXm"}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateLocalizationTemplate' test.out

#- 92 DeleteTemplateLocalization
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalization \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'M2W7l6jHMA2rG3na' \
    --templateSlug 'kopAywelu01nryEJ' \
    > test.out 2>&1
eval_tap $? 92 'DeleteTemplateLocalization' test.out

#- 93 PublishTemplate
./ng net.accelbyte.sdk.cli.Main lobby publishTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '0NqoTow0qiOiC4j0' \
    --templateSlug 'iktm0ZPLkLOsp0LZ' \
    > test.out 2>&1
eval_tap $? 93 'PublishTemplate' test.out

#- 94 GetTopicByNamespace
./ng net.accelbyte.sdk.cli.Main lobby getTopicByNamespace \
    --namespace "$AB_NAMESPACE" \
    --after '5njN86Hl8kUXzt6b' \
    --before 'Sc6bWvgpVyW9dD1k' \
    --limit '83' \
    > test.out 2>&1
eval_tap $? 94 'GetTopicByNamespace' test.out

#- 95 CreateTopic
./ng net.accelbyte.sdk.cli.Main lobby createTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "2ItBS3KtKZWe8aoF", "topic": "zAyBME74HUtipUWY"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateTopic' test.out

#- 96 GetTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby getTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'hWV1qx8CzPML52fa' \
    > test.out 2>&1
eval_tap $? 96 'GetTopicByTopicName' test.out

#- 97 UpdateTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby updateTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'XUr9Sk4lq2faBcAX' \
    --body '{"description": "XKlhvyH8paOJtxqM"}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateTopicByTopicName' test.out

#- 98 DeleteTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby deleteTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'PpcVfRwNj547fH0X' \
    > test.out 2>&1
eval_tap $? 98 'DeleteTopicByTopicName' test.out

#- 99 FreeFormNotificationByUserID
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotificationByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'rKEDpEY8VnocGAjc' \
    --body '{"message": "i0V3tBf2jnHGKXph", "topic": "n50c9tNLDljhZ2jx"}' \
    > test.out 2>&1
eval_tap $? 99 'FreeFormNotificationByUserID' test.out

#- 100 NotificationWithTemplateByUserID
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplateByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'LRX3z46OCaGBeMfP' \
    --body '{"templateContext": {"lNos4yBRjrERHEon": "AZR8GmEu0q1p6QCy", "Y6vSkVFWdsbYuVEG": "VxYheR3j5mNZ6vwv", "7K8Asvt1j1Rx59he": "sNWy2NvZ85DDKDAF"}, "templateLanguage": "8KDsBZOuYQJ03BAH", "templateSlug": "Z7c53q7akMpcmnnx", "topic": "6RVBrop9v7aZK3h6"}' \
    > test.out 2>&1
eval_tap $? 100 'NotificationWithTemplateByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE