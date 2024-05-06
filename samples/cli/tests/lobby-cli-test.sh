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
echo "1..105"

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

#- 17 SyncNativeBlockedUser
./ng net.accelbyte.sdk.cli.Main lobby syncNativeBlockedUser \
    --namespace "$AB_NAMESPACE" \
    --body '[{"platformId": "pbsx5w8hqUI06UpO", "psnEnv": "XGSLmCVuHOPlLlkv"}, {"platformId": "R8sKgnuRkgghGoYu", "psnEnv": "pD391C2qtPYokahF"}, {"platformId": "jkQsfCaTmt1d67FX", "psnEnv": "Gk2s9Q0mPVo3twu0"}]' \
    > test.out 2>&1
eval_tap $? 17 'SyncNativeBlockedUser' test.out

#- 18 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 18 'AdminGetAllConfigV1' test.out

#- 19 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'AdminGetConfigV1' test.out

#- 20 AdminUpdateConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowInviteNonConnectedUser": false, "allowJoinPartyDuringMatchmaking": true, "autoKickOnDisconnect": true, "autoKickOnDisconnectDelay": 93, "cancelTicketOnDisconnect": true, "chatRateLimitBurst": 10, "chatRateLimitDuration": 23, "concurrentUsersLimit": 79, "disableInvitationOnJoinParty": true, "enableChat": false, "entitlementCheck": true, "entitlementItemID": "SWN2laRlxfcjHfYa", "generalRateLimitBurst": 21, "generalRateLimitDuration": 78, "keepPresenceActivityOnDisconnect": false, "maxDSWaitTime": 59, "maxFriendsLimit": 46, "maxPartyMember": 94, "profanityFilter": true, "readyConsentTimeout": 67, "unregisterDelay": 70}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateConfigV1' test.out

#- 21 AdminExportConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminExportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminExportConfigV1' test.out

#- 22 AdminImportConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminImportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 22 'AdminImportConfigV1' test.out

#- 23 GetListOfFriends
./ng net.accelbyte.sdk.cli.Main lobby getListOfFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'kE7wcWfDslpJSqGA' \
    --friendId 'XQ0yYoNRKd3IL5TA' \
    --friendIds 'Q6iiPlSC2uE4o5Vw,do3fePqIJA8IHtrk,mu0hpDDWVAla2l5B' \
    --limit '53' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 23 'GetListOfFriends' test.out

#- 24 GetIncomingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getIncomingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'iE0mit9RGCCHYzUO' \
    --friendId 'cEdscKHPEqgA8yu7' \
    --limit '98' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 24 'GetIncomingFriendRequests' test.out

#- 25 AdminListFriendsOfFriends
./ng net.accelbyte.sdk.cli.Main lobby adminListFriendsOfFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'k6Jt4Ymos9Jcdos4' \
    --friendId 'fYcTVU6RBt0zYoMc' \
    --limit '68' \
    --nopaging  \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 25 'AdminListFriendsOfFriends' test.out

#- 26 GetOutgoingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getOutgoingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'yCUEXlAvxJMdalwS' \
    --limit '50' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 26 'GetOutgoingFriendRequests' test.out

#- 27 AdminGetGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetGlobalConfig \
    > test.out 2>&1
eval_tap $? 27 'AdminGetGlobalConfig' test.out

#- 28 AdminUpdateGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateGlobalConfig \
    --body '{"regionRetryMapping": {"liWMNW5NyLu0M3VH": ["h2EI8JlDbPWbQ6Q9", "lNmqRBaAkLnvxkT1", "X68cmDc3fxU8MyKr"], "QpM4hkkK6KKXNB3G": ["v0IqmF51TkhjYnaq", "6foWvXa3bMrXsDr6", "kILsSSyDdmykmoPY"], "gc2L4jk4Lo0LSP0p": ["f4IxjUkl535X3ate", "EKDpADz1x3poD3Qg", "b3boLQQ1MzH7Qm8b"]}, "regionURLMapping": ["wbmXgdAPh1EThG96", "gAFKK2WDgCcxvONZ", "m3EeERmDnyeFoF7V"], "testGameMode": "SZ6pf3vneSD2Tb3g", "testRegionURLMapping": ["7mSQUhAEtrmjqU6Y", "E3p4lSck0ZHn5GI3", "9YBHqaTHeKtW18iG"], "testTargetUserIDs": ["eUlc9d9sogWa24CK", "NS0GqVvUfHQvsHXN", "UNe4mhgo5QB65lSA"]}' \
    > test.out 2>&1
eval_tap $? 28 'AdminUpdateGlobalConfig' test.out

#- 29 AdminDeleteGlobalConfig
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteGlobalConfig \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteGlobalConfig' test.out

#- 30 SendMultipleUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendMultipleUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "iYnNjkfZrQvGgbLd", "topicName": "LsFzHkBMr1yrOMlN", "userIds": ["FSrUEirnjX9fDmIb", "eZxzfTcyiuATus9h", "sfpFDcSDG8aMVGLi"]}' \
    > test.out 2>&1
eval_tap $? 30 'SendMultipleUsersFreeformNotificationV1Admin' test.out

#- 31 SendUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "BNrDjqoxcwgGLXpU", "topicName": "L4pp2ncYAHdNzDme"}' \
    > test.out 2>&1
eval_tap $? 31 'SendUsersFreeformNotificationV1Admin' test.out

#- 32 SendPartyFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'IP6rOvDz9KOsb392' \
    --body '{"message": "k6YmJFfRByjlBiuF", "topicName": "M3FIoVk8T3GpAnkC"}' \
    > test.out 2>&1
eval_tap $? 32 'SendPartyFreeformNotificationV1Admin' test.out

#- 33 SendPartyTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'mBUqg2SCnqntX9y1' \
    --body '{"templateContext": {"aZSWMiVi10sG6vxk": "fUcmqRRbceJ5i0Ee", "DxOgBnhhqElIaDml": "48wdNFLTm5T50x9W", "T0GfH2rtOa4EXsXz": "OXQAk4mqrxzTtuLl"}, "templateLanguage": "4XlbGL8QOxtjzm8y", "templateSlug": "2wNhmwoYZyI4EFZK", "topicName": "BcYrCEAE7WIsfmx4"}' \
    > test.out 2>&1
eval_tap $? 33 'SendPartyTemplatedNotificationV1Admin' test.out

#- 34 GetAllNotificationTemplatesV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTemplatesV1Admin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'GetAllNotificationTemplatesV1Admin' test.out

#- 35 CreateNotificationTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "0NLRc6m8heKnWhzf", "templateLanguage": "e2NubeoKFeIaFQCY", "templateSlug": "oDPICpnduEEQlULd"}' \
    > test.out 2>&1
eval_tap $? 35 'CreateNotificationTemplateV1Admin' test.out

#- 36 SendUsersTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"Jz4mnRBkMNxvvKgA": "T8mJrYq6hRkloqxM", "3gpwxcfMy9XzjjI5": "YbsKoADkzJEN2VHz", "ih3bit0VWn3CO39P": "XDNxtXgeO3FgkXhj"}, "templateLanguage": "DzaQY3snn2ZkP7cF", "templateSlug": "dP43e5dC9XIBudfZ", "topicName": "grbHDIDm4hMzF4Tx"}' \
    > test.out 2>&1
eval_tap $? 36 'SendUsersTemplatedNotificationV1Admin' test.out

#- 37 GetTemplateSlugLocalizationsTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'odenSrUTvfqU0bfo' \
    --after 'Mm5cTtFWbotQyXJR' \
    --before 'cQWsmqPNs92epxk0' \
    --limit '18' \
    > test.out 2>&1
eval_tap $? 37 'GetTemplateSlugLocalizationsTemplateV1Admin' test.out

#- 38 DeleteNotificationTemplateSlugV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'uvUYTZBRujIUE1Tq' \
    > test.out 2>&1
eval_tap $? 38 'DeleteNotificationTemplateSlugV1Admin' test.out

#- 39 GetSingleTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getSingleTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '5jyAZvkRCMNFIurj' \
    --templateSlug 'h2imdb4rbkXj0Zws' \
    > test.out 2>&1
eval_tap $? 39 'GetSingleTemplateLocalizationV1Admin' test.out

#- 40 UpdateTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'VC0gL97ZVJSPqJiw' \
    --templateSlug 'v1qlYB1RSKs6gQxC' \
    --body '{"templateContent": "3Gb7S0o4zGYY7KQI"}' \
    > test.out 2>&1
eval_tap $? 40 'UpdateTemplateLocalizationV1Admin' test.out

#- 41 DeleteTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '1AeFgPqaOkvo1aol' \
    --templateSlug 'B4lkKB4EYOkQ1jMD' \
    > test.out 2>&1
eval_tap $? 41 'DeleteTemplateLocalizationV1Admin' test.out

#- 42 PublishTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby publishTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '3cym8xIfkOVW2grR' \
    --templateSlug 'EOLx0KOww3HICQLf' \
    > test.out 2>&1
eval_tap $? 42 'PublishTemplateLocalizationV1Admin' test.out

#- 43 GetAllNotificationTopicsV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTopicsV1Admin \
    --namespace "$AB_NAMESPACE" \
    --after 'l7MUBG7qtPu64yAt' \
    --before 'URKLRkb738HGS6rD' \
    --limit '12' \
    > test.out 2>&1
eval_tap $? 43 'GetAllNotificationTopicsV1Admin' test.out

#- 44 CreateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "XVG7tnsZg5QgXjvy", "topicName": "GJPN4eXbJE5Vs2Gc"}' \
    > test.out 2>&1
eval_tap $? 44 'CreateNotificationTopicV1Admin' test.out

#- 45 GetNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'yomQoIXimBJehyxl' \
    > test.out 2>&1
eval_tap $? 45 'GetNotificationTopicV1Admin' test.out

#- 46 UpdateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'NsjUgxBkF6wFPoJe' \
    --body '{"description": "QediogEhhM2rIizG"}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateNotificationTopicV1Admin' test.out

#- 47 DeleteNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'dKvOPdq5xrgxSmy1' \
    > test.out 2>&1
eval_tap $? 47 'DeleteNotificationTopicV1Admin' test.out

#- 48 SendSpecificUserFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'DN9LFkYW5DQyj4bj' \
    --body '{"message": "5Ro2ogaKt2ujQSa3", "topicName": "Zdb65UXmy0Zp6iIa"}' \
    > test.out 2>&1
eval_tap $? 48 'SendSpecificUserFreeformNotificationV1Admin' test.out

#- 49 SendSpecificUserTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'TIKUkmkk9QM0NBMA' \
    --body '{"templateContext": {"9ORxpzwLR2AK6eXU": "GPJsw1fiP80G9Pcl", "xcft2ulIJzPyrVEi": "OG4UcqsuGKHhMRWL", "Vd3DlhLuIpomM8sm": "1MiaI1mX2tJoARtd"}, "templateLanguage": "bBe7udsMrok0WvGY", "templateSlug": "Ynx4V709xbnGezKs", "topicName": "DwG2omOR2nvYI9TV"}' \
    > test.out 2>&1
eval_tap $? 49 'SendSpecificUserTemplatedNotificationV1Admin' test.out

#- 50 AdminGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qJdvzcWbfUpaXp5J' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetPartyDataV1' test.out

#- 51 AdminUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Ml5LL4bTxBmZjdrr' \
    --body '{"custom_attribute": {"IxsB0NRsB1fPqqRR": {}, "ulpqpymDkQhtrHWw": {}, "RVnwVBOqOHi8pWGd": {}}, "updatedAt": 69}' \
    > test.out 2>&1
eval_tap $? 51 'AdminUpdatePartyAttributesV1' test.out

#- 52 AdminJoinPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminJoinPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'juYhiqjRJOqB5F93' \
    --userId 'zFQbJndUDpdONneA' \
    > test.out 2>&1
eval_tap $? 52 'AdminJoinPartyV1' test.out

#- 53 AdminGetUserPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetUserPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'czbBdHb2slt71B1S' \
    > test.out 2>&1
eval_tap $? 53 'AdminGetUserPartyV1' test.out

#- 54 AdminGetLobbyCCU
./ng net.accelbyte.sdk.cli.Main lobby adminGetLobbyCCU \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'AdminGetLobbyCCU' test.out

#- 55 AdminGetBulkPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetBulkPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listBlockedUserId": ["mZp2JZp50CnPb71O", "RYcmQbTU5JX8ccLj", "MXJRk0eaKQDOJvrT"]}' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetBulkPlayerBlockedPlayersV1' test.out

#- 56 AdminGetAllPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'efglSs6g4iY9u02a' \
    > test.out 2>&1
eval_tap $? 56 'AdminGetAllPlayerSessionAttribute' test.out

#- 57 AdminSetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminSetPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'CNYIWekp18lOC3mN' \
    --body '{"attributes": {"qF7Bl0LcghVHfPEs": "pxwhRON0bc1eMbEI", "jowLqc3ecjXJbZDK": "KoxLE1Y3Dymtj3gi", "Pg4x4yiPX6ues1Hh": "hkg1yLVbLFzHEP8c"}}' \
    > test.out 2>&1
eval_tap $? 57 'AdminSetPlayerSessionAttribute' test.out

#- 58 AdminGetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerSessionAttribute \
    --attribute 'M4NTwr0KHaAsmTej' \
    --namespace "$AB_NAMESPACE" \
    --userId '52WKi6tArAURt9pl' \
    > test.out 2>&1
eval_tap $? 58 'AdminGetPlayerSessionAttribute' test.out

#- 59 AdminGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CSVq8PdH6hJPUAc0' \
    > test.out 2>&1
eval_tap $? 59 'AdminGetPlayerBlockedPlayersV1' test.out

#- 60 AdminGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RVwXgAgntLMCuaXB' \
    > test.out 2>&1
eval_tap $? 60 'AdminGetPlayerBlockedByPlayersV1' test.out

#- 61 AdminBulkBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WQi6BqPg4xr0lCan' \
    --body '{"listBlockedUserId": ["cUZGCHsZYoLfR1Kt", "Ov7Zy0b65uvuKNuy", "0ytZQ7M6Nzy1adnS"]}' \
    > test.out 2>&1
eval_tap $? 61 'AdminBulkBlockPlayersV1' test.out

#- 62 AdminDebugProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminDebugProfanityFilters \
    --namespace "$AB_NAMESPACE" \
    --body '{"text": "KOLFKx1dX4LuWJu3"}' \
    > test.out 2>&1
eval_tap $? 62 'AdminDebugProfanityFilters' test.out

#- 63 AdminGetProfanityListFiltersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityListFiltersV1 \
    --list 'pDMUAeeZ97SBROPY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'AdminGetProfanityListFiltersV1' test.out

#- 64 AdminAddProfanityFilterIntoList
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilterIntoList \
    --list 'uG6XqP6oo7G73zdx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "TgOfnwIdlNa29fDL", "note": "h741IslKHzGlLKWU"}' \
    > test.out 2>&1
eval_tap $? 64 'AdminAddProfanityFilterIntoList' test.out

#- 65 AdminAddProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilters \
    --list 'tDQs61OQAoxyyQpR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filters": [{"filter": "WCiiPDGQhNPEwiJC", "note": "f2XJVrlzqQls1ozh"}, {"filter": "LVA3kE8jKvgatOEB", "note": "M70TdlNBJYOmpu1V"}, {"filter": "CarzBsV6xnZ5Jrzz", "note": "jrcaug6CWVG8SWP3"}]}' \
    > test.out 2>&1
eval_tap $? 65 'AdminAddProfanityFilters' test.out

#- 66 AdminImportProfanityFiltersFromFile
./ng net.accelbyte.sdk.cli.Main lobby adminImportProfanityFiltersFromFile \
    --list 'glU6muswVJnNnN7k' \
    --namespace "$AB_NAMESPACE" \
    --body '[55, 93, 0]' \
    > test.out 2>&1
eval_tap $? 66 'AdminImportProfanityFiltersFromFile' test.out

#- 67 AdminDeleteProfanityFilter
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityFilter \
    --list 'rjyEgarAdNJOIG36' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "I6tRbRcrEveMdAdi"}' \
    > test.out 2>&1
eval_tap $? 67 'AdminDeleteProfanityFilter' test.out

#- 68 AdminGetProfanityLists
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityLists \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'AdminGetProfanityLists' test.out

#- 69 AdminCreateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminCreateProfanityList \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": true, "isMandatory": true, "name": "UVSC00PYeDcaggin"}' \
    > test.out 2>&1
eval_tap $? 69 'AdminCreateProfanityList' test.out

#- 70 AdminUpdateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateProfanityList \
    --list 'xnFIna3yddcbsPhe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": true, "isMandatory": true, "newName": "26IUJNvYuGRUvpZa"}' \
    > test.out 2>&1
eval_tap $? 70 'AdminUpdateProfanityList' test.out

#- 71 AdminDeleteProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityList \
    --list 'HCuESOiIZsMfB4ZH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'AdminDeleteProfanityList' test.out

#- 72 AdminGetProfanityRule
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityRule \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'AdminGetProfanityRule' test.out

#- 73 AdminSetProfanityRuleForNamespace
./ng net.accelbyte.sdk.cli.Main lobby adminSetProfanityRuleForNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"rule": "3mtgWgU4pCAKxeE7"}' \
    > test.out 2>&1
eval_tap $? 73 'AdminSetProfanityRuleForNamespace' test.out

#- 74 AdminVerifyMessageProfanityResponse
./ng net.accelbyte.sdk.cli.Main lobby adminVerifyMessageProfanityResponse \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "0CaunQNxot371W9G", "profanityLevel": "4AvQkqsGnmyo5JJT"}' \
    > test.out 2>&1
eval_tap $? 74 'AdminVerifyMessageProfanityResponse' test.out

#- 75 AdminGetThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'AdminGetThirdPartyConfig' test.out

#- 76 AdminUpdateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "UVmb8GEXFTlEMEsF"}' \
    > test.out 2>&1
eval_tap $? 76 'AdminUpdateThirdPartyConfig' test.out

#- 77 AdminCreateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminCreateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "zYqwgK1Np5nodqpL"}' \
    > test.out 2>&1
eval_tap $? 77 'AdminCreateThirdPartyConfig' test.out

#- 78 AdminDeleteThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'AdminDeleteThirdPartyConfig' test.out

#- 79 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main lobby publicGetMessages \
    > test.out 2>&1
eval_tap $? 79 'PublicGetMessages' test.out

#- 80 PublicGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'm7FhJBNXzAFdO0Kh' \
    > test.out 2>&1
eval_tap $? 80 'PublicGetPartyDataV1' test.out

#- 81 PublicUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby publicUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qf6kiTdSGv2LFjAK' \
    --body '{"custom_attribute": {"Y7CbgsWqFWZX7kPB": {}, "om8F9GLLTG8phc3n": {}, "4iLoIllKlpO2pqiX": {}}, "updatedAt": 74}' \
    > test.out 2>&1
eval_tap $? 81 'PublicUpdatePartyAttributesV1' test.out

#- 82 PublicSetPartyLimitV1
./ng net.accelbyte.sdk.cli.Main lobby publicSetPartyLimitV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'FOTjMLo4b9rIzqYk' \
    --body '{"limit": 63}' \
    > test.out 2>&1
eval_tap $? 82 'PublicSetPartyLimitV1' test.out

#- 83 PublicPlayerBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicPlayerBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"blockedUserId": "rKF7SUQPLG59e0k5"}' \
    > test.out 2>&1
eval_tap $? 83 'PublicPlayerBlockPlayersV1' test.out

#- 84 PublicGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'PublicGetPlayerBlockedPlayersV1' test.out

#- 85 PublicGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'PublicGetPlayerBlockedByPlayersV1' test.out

#- 86 PublicUnblockPlayerV1
./ng net.accelbyte.sdk.cli.Main lobby publicUnblockPlayerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "ZtX6wK7PpUlcIW32"}' \
    > test.out 2>&1
eval_tap $? 86 'PublicUnblockPlayerV1' test.out

#- 87 UsersPresenceHandlerV1
./ng net.accelbyte.sdk.cli.Main lobby usersPresenceHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --countOnly  \
    --userIds 'iK7MGt1ixY5rA1Wo' \
    > test.out 2>&1
eval_tap $? 87 'UsersPresenceHandlerV1' test.out

#- 88 FreeFormNotification
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotification \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "VeJIePF8ZrQzP4zv", "topic": "tdxdbZUpd6FJtHJ1"}' \
    > test.out 2>&1
eval_tap $? 88 'FreeFormNotification' test.out

#- 89 GetMyNotifications
./ng net.accelbyte.sdk.cli.Main lobby getMyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endTime '31' \
    --limit '50' \
    --offset '75' \
    --startTime '97' \
    > test.out 2>&1
eval_tap $? 89 'GetMyNotifications' test.out

#- 90 NotificationWithTemplate
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"TK9tmmOnYnOpas6g": "hP1y4Zi7s7QBlk44", "Z44B1GZgKg4uKxaC": "gcGLuC3brWdTYCfH", "kIySok5DiXZtLW87": "rGysryod3dNQrmsA"}, "templateLanguage": "pRA6HX3RwrKt2eco", "templateSlug": "zL0TOg54vCE48L5o", "topic": "LF6M4lNa4JUMSHNg"}' \
    > test.out 2>&1
eval_tap $? 90 'NotificationWithTemplate' test.out

#- 91 GetGameTemplate
./ng net.accelbyte.sdk.cli.Main lobby getGameTemplate \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 91 'GetGameTemplate' test.out

#- 92 CreateTemplate
./ng net.accelbyte.sdk.cli.Main lobby createTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "qRqCV7usamANkZlO", "templateLanguage": "X9Sfo95HgXqKhTPk", "templateSlug": "wfLM9uSybRzWek2g"}' \
    > test.out 2>&1
eval_tap $? 92 'CreateTemplate' test.out

#- 93 GetSlugTemplate
./ng net.accelbyte.sdk.cli.Main lobby getSlugTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'ZvRrvr0n9d9lvccK' \
    --after 'MLhrTrcBE2ItBS3K' \
    --before 'tKZWe8aoFzAyBME7' \
    --limit '24' \
    > test.out 2>&1
eval_tap $? 93 'GetSlugTemplate' test.out

#- 94 DeleteTemplateSlug
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateSlug \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'HUtipUWYhWV1qx8C' \
    > test.out 2>&1
eval_tap $? 94 'DeleteTemplateSlug' test.out

#- 95 GetLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby getLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'zPML52faXUr9Sk4l' \
    --templateSlug 'q2faBcAXXKlhvyH8' \
    > test.out 2>&1
eval_tap $? 95 'GetLocalizationTemplate' test.out

#- 96 UpdateLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby updateLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'paOJtxqMPpcVfRwN' \
    --templateSlug 'j547fH0XrKEDpEY8' \
    --body '{"templateContent": "VnocGAjci0V3tBf2"}' \
    > test.out 2>&1
eval_tap $? 96 'UpdateLocalizationTemplate' test.out

#- 97 DeleteTemplateLocalization
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalization \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'jnHGKXphn50c9tNL' \
    --templateSlug 'DljhZ2jxLRX3z46O' \
    > test.out 2>&1
eval_tap $? 97 'DeleteTemplateLocalization' test.out

#- 98 PublishTemplate
./ng net.accelbyte.sdk.cli.Main lobby publishTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'CaGBeMfPlNos4yBR' \
    --templateSlug 'jrERHEonAZR8GmEu' \
    > test.out 2>&1
eval_tap $? 98 'PublishTemplate' test.out

#- 99 GetTopicByNamespace
./ng net.accelbyte.sdk.cli.Main lobby getTopicByNamespace \
    --namespace "$AB_NAMESPACE" \
    --after '0q1p6QCyY6vSkVFW' \
    --before 'dsbYuVEGVxYheR3j' \
    --limit '26' \
    > test.out 2>&1
eval_tap $? 99 'GetTopicByNamespace' test.out

#- 100 CreateTopic
./ng net.accelbyte.sdk.cli.Main lobby createTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "aZPV87pna08gxefT", "topic": "YKhuxaEc7M4P7Uck"}' \
    > test.out 2>&1
eval_tap $? 100 'CreateTopic' test.out

#- 101 GetTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby getTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'SC6ePeN8i4GrFES9' \
    > test.out 2>&1
eval_tap $? 101 'GetTopicByTopicName' test.out

#- 102 UpdateTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby updateTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'z7xueHpATHccee9G' \
    --body '{"description": "XhKcjmSEwdrkEnnq"}' \
    > test.out 2>&1
eval_tap $? 102 'UpdateTopicByTopicName' test.out

#- 103 DeleteTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby deleteTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'KzFsLfYalUlfwEQK' \
    > test.out 2>&1
eval_tap $? 103 'DeleteTopicByTopicName' test.out

#- 104 FreeFormNotificationByUserID
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotificationByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'jU7eHGebSVu0LQ40' \
    --body '{"message": "kepEaC4dfiOMZfEh", "topic": "Hr39pysFO3Zvc1BZ"}' \
    > test.out 2>&1
eval_tap $? 104 'FreeFormNotificationByUserID' test.out

#- 105 NotificationWithTemplateByUserID
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplateByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'G99LyvfvHEsJKQQe' \
    --body '{"templateContext": {"wVLMUoAnaRcYp7FU": "jfIGaffoflEIByYq", "eKN0meGelYF5wWaD": "hukU4khGG4vZFTYn", "PkmSu4PWam1jxR7S": "ETWjteoc8fgvZDDh"}, "templateLanguage": "oO05oKqymxLD1Lcv", "templateSlug": "w6T6mZEiwxxElpMY", "topic": "SWIeVzm7z9noowml"}' \
    > test.out 2>&1
eval_tap $? 105 'NotificationWithTemplateByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE