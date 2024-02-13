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
echo "1..103"

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
    --friendIds 'GrncqmLtjQHAf8Tg,oNm03VLisV6zwPuo,3td6TC6I3lMjGSWN' \
    --limit '23' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 22 'GetListOfFriends' test.out

#- 23 GetIncomingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getIncomingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'na7qxNeIxPz6MbwL' \
    --friendId '6IY69z1UaLqYSYWy' \
    --limit '40' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 23 'GetIncomingFriendRequests' test.out

#- 24 AdminListFriendsOfFriends
./ng net.accelbyte.sdk.cli.Main lobby adminListFriendsOfFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'LPziZMdjxcBZufQx' \
    --friendId 'GiHPllG4cYEzfTD1' \
    --limit '6' \
    --nopaging  \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 24 'AdminListFriendsOfFriends' test.out

#- 25 GetOutgoingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getOutgoingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'o3fePqIJA8IHtrkm' \
    --limit '41' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 25 'GetOutgoingFriendRequests' test.out

#- 26 AdminGetGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetGlobalConfig \
    > test.out 2>&1
eval_tap $? 26 'AdminGetGlobalConfig' test.out

#- 27 AdminUpdateGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateGlobalConfig \
    --body '{"regionRetryMapping": {"0hpDDWVAla2l5BYN": ["tIuS5S5XUdjsoqwG", "yzzWi9gwQYv7t1o7", "TTr1DmrhZv15T7qu"], "IOvBMcaYmvCkGZ5d": ["AgqxpBFmaLoxozr6", "wfNPX2bOItRMvqtl", "B2jJCSQT279ZZPYG"], "u0rdlgdWyOtXi3ch": ["oQrpOsDBU5SepjCh", "B3V0v52Dlym6puQ2", "3xoJ8aeCnaLpUKp4"]}, "regionURLMapping": ["4YUDjasWIPUvmEej", "tGeoyIPa8ZRrvjj7", "il35MXbN9oCMNqq9"], "testGameMode": "8SjTvhZNkSQ70D0H", "testRegionURLMapping": ["6BXksUC9b6i5lZC9", "xv32e8c5csSovoqs", "ZNBdte9NDUPVJf6c"], "testTargetUserIDs": ["2Z0QZxfgPubTDIHr", "vqAThuwjRHpKKTlm", "Vr9XuoJbRFQSKVPH"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminUpdateGlobalConfig' test.out

#- 28 AdminDeleteGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteGlobalConfig \
    > test.out 2>&1
eval_tap $? 28 'AdminDeleteGlobalConfig' test.out

#- 29 SendMultipleUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendMultipleUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "bn4Xxtu7LQRENjEE", "topicName": "ztx1WsYSiZqan0nS", "userIds": ["BJroav91GXlvPG6b", "FYReVHQipcCx9Zw5", "D2L7vIYhGGSyEW4Z"]}' \
    > test.out 2>&1
eval_tap $? 29 'SendMultipleUsersFreeformNotificationV1Admin' test.out

#- 30 SendUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "JJ42d3PBddN8S48l", "topicName": "9lyNApflxqMrj3oZ"}' \
    > test.out 2>&1
eval_tap $? 30 'SendUsersFreeformNotificationV1Admin' test.out

#- 31 SendPartyFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'k03QXcKMDYDDxHSZ' \
    --body '{"message": "jtqXyJ58f7Gc26Sa", "topicName": "iGVkydwYWQG26yUZ"}' \
    > test.out 2>&1
eval_tap $? 31 'SendPartyFreeformNotificationV1Admin' test.out

#- 32 SendPartyTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'NmTBcvrbYCwZtxFH' \
    --body '{"templateContext": {"yPLtI8ilbyDPUIj8": "8cekdqCt81P1ktfI", "ovmv9gsR5cJcHm3S": "ZLxoRDFuuuySj29a", "9LJE8HoRS1X2PFAA": "MwzHPxB1UskYs4Yw"}, "templateLanguage": "20DOqOBSC2DKHRuP", "templateSlug": "MMWH8Yb33T5UBJCj", "topicName": "fcnLRfxeCSz9WEi8"}' \
    > test.out 2>&1
eval_tap $? 32 'SendPartyTemplatedNotificationV1Admin' test.out

#- 33 GetAllNotificationTemplatesV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTemplatesV1Admin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetAllNotificationTemplatesV1Admin' test.out

#- 34 CreateNotificationTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "KlloeH0JT1yduat2", "templateLanguage": "vQR3biBfsu4jmsRE", "templateSlug": "2w1yEkLgh3tIYt4S"}' \
    > test.out 2>&1
eval_tap $? 34 'CreateNotificationTemplateV1Admin' test.out

#- 35 SendUsersTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"qYUTLDx9gIiDandp": "GT2t24aOMh5eC3IH", "eHSKLCa3xreNDUWe": "hwH3q31A806DJgas", "4b6z3LNUj7fdgLA8": "4Z8YYk6QEgJjBbED"}, "templateLanguage": "oNf3n0hEoRCAcf80", "templateSlug": "zfFyabWAgIUXiI07", "topicName": "A68eaqC2J9jyEW6G"}' \
    > test.out 2>&1
eval_tap $? 35 'SendUsersTemplatedNotificationV1Admin' test.out

#- 36 GetTemplateSlugLocalizationsTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'Lbc0NaKDUL3sa13l' \
    --after 'k1dQBHO86IlBhnet' \
    --before 'U4RwTqUXlTDBzOuY' \
    --limit '38' \
    > test.out 2>&1
eval_tap $? 36 'GetTemplateSlugLocalizationsTemplateV1Admin' test.out

#- 37 DeleteNotificationTemplateSlugV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'hjDzaQY3snn2ZkP7' \
    > test.out 2>&1
eval_tap $? 37 'DeleteNotificationTemplateSlugV1Admin' test.out

#- 38 GetSingleTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getSingleTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'cFdP43e5dC9XIBud' \
    --templateSlug 'fZgrbHDIDm4hMzF4' \
    > test.out 2>&1
eval_tap $? 38 'GetSingleTemplateLocalizationV1Admin' test.out

#- 39 UpdateTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'TxodenSrUTvfqU0b' \
    --templateSlug 'foMm5cTtFWbotQyX' \
    --body '{"templateContent": "JRcQWsmqPNs92epx"}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateTemplateLocalizationV1Admin' test.out

#- 40 DeleteTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'k0i8VxsZNereSvf9' \
    --templateSlug '699mCEHThUJkETAs' \
    > test.out 2>&1
eval_tap $? 40 'DeleteTemplateLocalizationV1Admin' test.out

#- 41 PublishTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby publishTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'Sp7gh4TeUTkOkAYf' \
    --templateSlug 'JB8AT9t4Tv207Y2Q' \
    > test.out 2>&1
eval_tap $? 41 'PublishTemplateLocalizationV1Admin' test.out

#- 42 GetAllNotificationTopicsV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTopicsV1Admin \
    --namespace "$AB_NAMESPACE" \
    --after 'D3oD5fLCr3OOlXVv' \
    --before '8ZGF7uYnGzpipNDi' \
    --limit '12' \
    > test.out 2>&1
eval_tap $? 42 'GetAllNotificationTopicsV1Admin' test.out

#- 43 CreateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "QI1AeFgPqaOkvo1a", "topicName": "olB4lkKB4EYOkQ1j"}' \
    > test.out 2>&1
eval_tap $? 43 'CreateNotificationTopicV1Admin' test.out

#- 44 GetNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'MD3cym8xIfkOVW2g' \
    > test.out 2>&1
eval_tap $? 44 'GetNotificationTopicV1Admin' test.out

#- 45 UpdateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'rREOLx0KOww3HICQ' \
    --body '{"description": "Lfl7MUBG7qtPu64y"}' \
    > test.out 2>&1
eval_tap $? 45 'UpdateNotificationTopicV1Admin' test.out

#- 46 DeleteNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'AtURKLRkb738HGS6' \
    > test.out 2>&1
eval_tap $? 46 'DeleteNotificationTopicV1Admin' test.out

#- 47 SendSpecificUserFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'rDgMdIIlhS1fSiM9' \
    --body '{"message": "331m7Ta1PsKc50Kv", "topicName": "6ecnEevcAx2K2zkR"}' \
    > test.out 2>&1
eval_tap $? 47 'SendSpecificUserFreeformNotificationV1Admin' test.out

#- 48 SendSpecificUserTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'enmPZnGBt4P7Wnbd' \
    --body '{"templateContext": {"SJtjX7ZshZyZl5x4": "bRXBHUTrDzZSKscf", "OcYu3dpCROYqUiGK": "XVFCmpo6sPwVOEDS", "JsEK5QpNhlI2iS5E": "pGhhvXYck0upMzUY"}, "templateLanguage": "nb76tFkEORV3bu1b", "templateSlug": "NCtX7W40V6Do5sYa", "topicName": "dCCFrHHC3DpZxkrQ"}' \
    > test.out 2>&1
eval_tap $? 48 'SendSpecificUserTemplatedNotificationV1Admin' test.out

#- 49 AdminGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'DXuNFviMarv8mnfH' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetPartyDataV1' test.out

#- 50 AdminUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'K8CCmE2lPnsbD3SG' \
    --body '{"custom_attribute": {"EdlwuUccE536ugBp": {}, "3HBvepnDCjgyJlXe": {}, "36mgWjLfFmteue9n": {}}, "updatedAt": 52}' \
    > test.out 2>&1
eval_tap $? 50 'AdminUpdatePartyAttributesV1' test.out

#- 51 AdminJoinPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminJoinPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'KsDwG2omOR2nvYI9' \
    --userId 'TVqJdvzcWbfUpaXp' \
    > test.out 2>&1
eval_tap $? 51 'AdminJoinPartyV1' test.out

#- 52 AdminGetUserPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetUserPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5JMl5LL4bTxBmZjd' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetUserPartyV1' test.out

#- 53 AdminGetLobbyCCU
./ng net.accelbyte.sdk.cli.Main lobby adminGetLobbyCCU \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'AdminGetLobbyCCU' test.out

#- 54 AdminGetBulkPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetBulkPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listBlockedUserId": ["rrIxsB0NRsB1fPqq", "RRulpqpymDkQhtrH", "WwRVnwVBOqOHi8pW"]}' \
    > test.out 2>&1
eval_tap $? 54 'AdminGetBulkPlayerBlockedPlayersV1' test.out

#- 55 AdminGetAllPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gd1juYhiqjRJOqB5' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetAllPlayerSessionAttribute' test.out

#- 56 AdminSetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminSetPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'F93zFQbJndUDpdON' \
    --body '{"attributes": {"neAczbBdHb2slt71": "B1SmZp2JZp50CnPb", "71ORYcmQbTU5JX8c": "cLjMXJRk0eaKQDOJ", "vrTefglSs6g4iY9u": "02aCNYIWekp18lOC"}}' \
    > test.out 2>&1
eval_tap $? 56 'AdminSetPlayerSessionAttribute' test.out

#- 57 AdminGetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerSessionAttribute \
    --attribute '3mNqF7Bl0LcghVHf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PEspxwhRON0bc1eM' \
    > test.out 2>&1
eval_tap $? 57 'AdminGetPlayerSessionAttribute' test.out

#- 58 AdminGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bEIjowLqc3ecjXJb' \
    > test.out 2>&1
eval_tap $? 58 'AdminGetPlayerBlockedPlayersV1' test.out

#- 59 AdminGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZDKKoxLE1Y3Dymtj' \
    > test.out 2>&1
eval_tap $? 59 'AdminGetPlayerBlockedByPlayersV1' test.out

#- 60 AdminBulkBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '3giPg4x4yiPX6ues' \
    --body '{"listBlockedUserId": ["1Hhhkg1yLVbLFzHE", "P8cM4NTwr0KHaAsm", "Tej52WKi6tArAURt"]}' \
    > test.out 2>&1
eval_tap $? 60 'AdminBulkBlockPlayersV1' test.out

#- 61 AdminDebugProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminDebugProfanityFilters \
    --namespace "$AB_NAMESPACE" \
    --body '{"text": "9plCSVq8PdH6hJPU"}' \
    > test.out 2>&1
eval_tap $? 61 'AdminDebugProfanityFilters' test.out

#- 62 AdminGetProfanityListFiltersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityListFiltersV1 \
    --list 'Ac0RVwXgAgntLMCu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'AdminGetProfanityListFiltersV1' test.out

#- 63 AdminAddProfanityFilterIntoList
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilterIntoList \
    --list 'aXBWQi6BqPg4xr0l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "CancUZGCHsZYoLfR", "note": "1KtOv7Zy0b65uvuK"}' \
    > test.out 2>&1
eval_tap $? 63 'AdminAddProfanityFilterIntoList' test.out

#- 64 AdminAddProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilters \
    --list 'Nuy0ytZQ7M6Nzy1a' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filters": [{"filter": "dnSKOLFKx1dX4LuW", "note": "Ju3pDMUAeeZ97SBR"}, {"filter": "OPYuG6XqP6oo7G73", "note": "zdxTgOfnwIdlNa29"}, {"filter": "fDLh741IslKHzGlL", "note": "KWUtDQs61OQAoxyy"}]}' \
    > test.out 2>&1
eval_tap $? 64 'AdminAddProfanityFilters' test.out

#- 65 AdminImportProfanityFiltersFromFile
./ng net.accelbyte.sdk.cli.Main lobby adminImportProfanityFiltersFromFile \
    --list 'QpRWCiiPDGQhNPEw' \
    --namespace "$AB_NAMESPACE" \
    --body '[16, 40, 72]' \
    > test.out 2>&1
eval_tap $? 65 'AdminImportProfanityFiltersFromFile' test.out

#- 66 AdminDeleteProfanityFilter
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityFilter \
    --list 'FEJ7tnkY6Mca5afj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "12K2IzrBvvWm4udE"}' \
    > test.out 2>&1
eval_tap $? 66 'AdminDeleteProfanityFilter' test.out

#- 67 AdminGetProfanityLists
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityLists \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'AdminGetProfanityLists' test.out

#- 68 AdminCreateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminCreateProfanityList \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": true, "isMandatory": true, "name": "0TdlNBJYOmpu1VCa"}' \
    > test.out 2>&1
eval_tap $? 68 'AdminCreateProfanityList' test.out

#- 69 AdminUpdateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateProfanityList \
    --list 'rzBsV6xnZ5Jrzzjr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": false, "isMandatory": false, "newName": "aug6CWVG8SWP3glU"}' \
    > test.out 2>&1
eval_tap $? 69 'AdminUpdateProfanityList' test.out

#- 70 AdminDeleteProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityList \
    --list '6muswVJnNnN7kAa7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'AdminDeleteProfanityList' test.out

#- 71 AdminGetProfanityRule
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityRule \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'AdminGetProfanityRule' test.out

#- 72 AdminSetProfanityRuleForNamespace
./ng net.accelbyte.sdk.cli.Main lobby adminSetProfanityRuleForNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"rule": "j0riFc5HTHQIoVsG"}' \
    > test.out 2>&1
eval_tap $? 72 'AdminSetProfanityRuleForNamespace' test.out

#- 73 AdminVerifyMessageProfanityResponse
./ng net.accelbyte.sdk.cli.Main lobby adminVerifyMessageProfanityResponse \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "o7dwV9DBqFKHQkET", "profanityLevel": "JyTlUrwDTnoujQD4"}' \
    > test.out 2>&1
eval_tap $? 73 'AdminVerifyMessageProfanityResponse' test.out

#- 74 AdminGetThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'AdminGetThirdPartyConfig' test.out

#- 75 AdminUpdateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "IEiH9Z5qXn3aoRtl"}' \
    > test.out 2>&1
eval_tap $? 75 'AdminUpdateThirdPartyConfig' test.out

#- 76 AdminCreateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminCreateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "qOECohViHA5CzgFS"}' \
    > test.out 2>&1
eval_tap $? 76 'AdminCreateThirdPartyConfig' test.out

#- 77 AdminDeleteThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'AdminDeleteThirdPartyConfig' test.out

#- 78 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main lobby publicGetMessages \
    > test.out 2>&1
eval_tap $? 78 'PublicGetMessages' test.out

#- 79 PublicGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'y8X1A3PrIfapq5AA' \
    > test.out 2>&1
eval_tap $? 79 'PublicGetPartyDataV1' test.out

#- 80 PublicUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby publicUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'eMe4L3mDWORBVXTI' \
    --body '{"custom_attribute": {"IJM9XsYIIZxiXNMR": {}, "9BgaWcFX3SUBhyoT": {}, "sMWPAxUMkawaGpAy": {}}, "updatedAt": 35}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdatePartyAttributesV1' test.out

#- 81 PublicSetPartyLimitV1
./ng net.accelbyte.sdk.cli.Main lobby publicSetPartyLimitV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'EsFzYqwgK1Np5nod' \
    --body '{"limit": 34}' \
    > test.out 2>&1
eval_tap $? 81 'PublicSetPartyLimitV1' test.out

#- 82 PublicPlayerBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicPlayerBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"blockedUserId": "BxqGWV6mTJ0sQs6X"}' \
    > test.out 2>&1
eval_tap $? 82 'PublicPlayerBlockPlayersV1' test.out

#- 83 PublicGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'PublicGetPlayerBlockedPlayersV1' test.out

#- 84 PublicGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'PublicGetPlayerBlockedByPlayersV1' test.out

#- 85 PublicUnblockPlayerV1
./ng net.accelbyte.sdk.cli.Main lobby publicUnblockPlayerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "NbjvqhnUVLWu8olK"}' \
    > test.out 2>&1
eval_tap $? 85 'PublicUnblockPlayerV1' test.out

#- 86 UsersPresenceHandlerV1
./ng net.accelbyte.sdk.cli.Main lobby usersPresenceHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --countOnly  \
    --userIds 'dxL6ozRmDD0jJvlf' \
    > test.out 2>&1
eval_tap $? 86 'UsersPresenceHandlerV1' test.out

#- 87 FreeFormNotification
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotification \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "V5OemPYdYT7DROCj", "topic": "tuzFMbAG9YI89hmg"}' \
    > test.out 2>&1
eval_tap $? 87 'FreeFormNotification' test.out

#- 88 NotificationWithTemplate
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"uB8FOTjMLo4b9rIz": "qYkEpstyVTBcrM8r", "G0rH0zcswwVeMK6M": "bGIVIu8vvwLc7KY3", "uVoJXTIMtpgkieDy": "F97lGdMiHKxbWCYz"}, "templateLanguage": "o8yO2KTK9tmmOnYn", "templateSlug": "Opas6ghP1y4Zi7s7", "topic": "QBlk44Z44B1GZgKg"}' \
    > test.out 2>&1
eval_tap $? 88 'NotificationWithTemplate' test.out

#- 89 GetGameTemplate
./ng net.accelbyte.sdk.cli.Main lobby getGameTemplate \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 89 'GetGameTemplate' test.out

#- 90 CreateTemplate
./ng net.accelbyte.sdk.cli.Main lobby createTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "4uKxaCgcGLuC3brW", "templateLanguage": "dTYCfHkIySok5DiX", "templateSlug": "ZtLW87rGysryod3d"}' \
    > test.out 2>&1
eval_tap $? 90 'CreateTemplate' test.out

#- 91 GetSlugTemplate
./ng net.accelbyte.sdk.cli.Main lobby getSlugTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'NQrmsApRA6HX3Rwr' \
    --after 'Kt2ecozL0TOg54vC' \
    --before 'E48L5oLF6M4lNa4J' \
    --limit '95' \
    > test.out 2>&1
eval_tap $? 91 'GetSlugTemplate' test.out

#- 92 DeleteTemplateSlug
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateSlug \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'pAywelu01nryEJ0N' \
    > test.out 2>&1
eval_tap $? 92 'DeleteTemplateSlug' test.out

#- 93 GetLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby getLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'qoTow0qiOiC4j0ik' \
    --templateSlug 'tm0ZPLkLOsp0LZ5n' \
    > test.out 2>&1
eval_tap $? 93 'GetLocalizationTemplate' test.out

#- 94 UpdateLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby updateLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'jN86Hl8kUXzt6bSc' \
    --templateSlug '6bWvgpVyW9dD1kOm' \
    --body '{"templateContent": "vrAejcq2LgkQuaS7"}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateLocalizationTemplate' test.out

#- 95 DeleteTemplateLocalization
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalization \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'RBx3vim02jBOxrZD' \
    --templateSlug 'yvpcLYOWA8NjxOna' \
    > test.out 2>&1
eval_tap $? 95 'DeleteTemplateLocalization' test.out

#- 96 PublishTemplate
./ng net.accelbyte.sdk.cli.Main lobby publishTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'Eok4nOOCzfsflhjb' \
    --templateSlug 'ngJOUn18G5MlfDTk' \
    > test.out 2>&1
eval_tap $? 96 'PublishTemplate' test.out

#- 97 GetTopicByNamespace
./ng net.accelbyte.sdk.cli.Main lobby getTopicByNamespace \
    --namespace "$AB_NAMESPACE" \
    --after '8aG40NlncceIZSwg' \
    --before 'AIkgzh4pTU0Am4DZ' \
    --limit '14' \
    > test.out 2>&1
eval_tap $? 97 'GetTopicByNamespace' test.out

#- 98 CreateTopic
./ng net.accelbyte.sdk.cli.Main lobby createTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "V3tBf2jnHGKXphn5", "topic": "0c9tNLDljhZ2jxLR"}' \
    > test.out 2>&1
eval_tap $? 98 'CreateTopic' test.out

#- 99 GetTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby getTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'X3z46OCaGBeMfPlN' \
    > test.out 2>&1
eval_tap $? 99 'GetTopicByTopicName' test.out

#- 100 UpdateTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby updateTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'os4yBRjrERHEonAZ' \
    --body '{"description": "R8GmEu0q1p6QCyY6"}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateTopicByTopicName' test.out

#- 101 DeleteTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby deleteTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'vSkVFWdsbYuVEGVx' \
    > test.out 2>&1
eval_tap $? 101 'DeleteTopicByTopicName' test.out

#- 102 FreeFormNotificationByUserID
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotificationByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'YheR3j5mNZ6vwv7K' \
    --body '{"message": "8Asvt1j1Rx59hesN", "topic": "Wy2NvZ85DDKDAF8K"}' \
    > test.out 2>&1
eval_tap $? 102 'FreeFormNotificationByUserID' test.out

#- 103 NotificationWithTemplateByUserID
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplateByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'DsBZOuYQJ03BAHZ7' \
    --body '{"templateContext": {"c53q7akMpcmnnx6R": "VBrop9v7aZK3h65h", "bN15zfQSfQrtfF3T": "QN0OcNDLr36vzohZ", "yjMQAg5mPYhrLTyU": "8OhgfY9JQYGF4bYX"}, "templateLanguage": "EcENx9xZlAchob44", "templateSlug": "lONDDwMvgI0HlyPR", "topic": "7wZNiVsF6xG2mXEQ"}' \
    > test.out 2>&1
eval_tap $? 103 'NotificationWithTemplateByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE