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
echo "1..110"

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
    --body '{"friendId": "rttufHIRdH9UzVRi", "friendPublicId": "XbqlAw7r6W2ktQG0", "metadata": {"h5JAav5kRa62WopB": "JHPtcDs8bBZLCXLx", "8bbgorQeFbQ1g7qb": "PngUNB1vRodwpzS6", "DaDpv8N7ZQVqGj6o": "DLjWjkY1aXlFcDtg"}}' \
    > test.out 2>&1
eval_tap $? 8 'UserRequestFriend' test.out

#- 9 UserAcceptFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userAcceptFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "OjchIua5tWEIC32o"}' \
    > test.out 2>&1
eval_tap $? 9 'UserAcceptFriendRequest' test.out

#- 10 UserCancelFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userCancelFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "gW7olvbTgrhRTcPi"}' \
    > test.out 2>&1
eval_tap $? 10 'UserCancelFriendRequest' test.out

#- 11 UserRejectFriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userRejectFriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "SuL0Sly6XM4OI18m"}' \
    > test.out 2>&1
eval_tap $? 11 'UserRejectFriendRequest' test.out

#- 12 UserGetFriendshipStatus
./ng net.accelbyte.sdk.cli.Main lobby userGetFriendshipStatus \
    --friendId 'AQLnzjMf8GZ2WBZq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'UserGetFriendshipStatus' test.out

#- 13 UserUnfriendRequest
./ng net.accelbyte.sdk.cli.Main lobby userUnfriendRequest \
    --namespace "$AB_NAMESPACE" \
    --body '{"friendId": "xYG3aREAu2D6QVKN"}' \
    > test.out 2>&1
eval_tap $? 13 'UserUnfriendRequest' test.out

#- 14 AddFriendsWithoutConfirmation
./ng net.accelbyte.sdk.cli.Main lobby addFriendsWithoutConfirmation \
    --namespace "$AB_NAMESPACE" \
    --userId 'CWP75TB0i7pKxR8d' \
    --body '{"friendIds": ["l0zRVW4EZG9m0Xcg", "GVbMqSszE8GHavj7", "AorKsxwkosAVerXp"]}' \
    > test.out 2>&1
eval_tap $? 14 'AddFriendsWithoutConfirmation' test.out

#- 15 BulkDeleteFriends
./ng net.accelbyte.sdk.cli.Main lobby bulkDeleteFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'c1C8XfwHuKeb9l3r' \
    --body '{"friendIds": ["GN9A3sNm84hddSpH", "t0P7MIIR7CkyF6C7", "duuyZ0GhDogqrhBR"]}' \
    > test.out 2>&1
eval_tap $? 15 'BulkDeleteFriends' test.out

#- 16 SyncNativeFriends
./ng net.accelbyte.sdk.cli.Main lobby syncNativeFriends \
    --namespace "$AB_NAMESPACE" \
    --body '[{"isLogin": false, "platformId": "N05MYzYiKWe5dNRl", "platformToken": "jv7IPrDQQRgat0Se", "psnEnv": "vkLGMS0lyuI9a2I9", "syncDeletedFriend": true}, {"isLogin": true, "platformId": "6Vpbsx5w8hqUI06U", "platformToken": "pOXGSLmCVuHOPlLl", "psnEnv": "kvR8sKgnuRkgghGo", "syncDeletedFriend": true}, {"isLogin": true, "platformId": "iljvjKoyD6SCwGrn", "platformToken": "cqmLtjQHAf8TgoNm", "psnEnv": "03VLisV6zwPuo3td", "syncDeletedFriend": false}]' \
    > test.out 2>&1
eval_tap $? 16 'SyncNativeFriends' test.out

#- 17 SyncNativeBlockedUser
./ng net.accelbyte.sdk.cli.Main lobby syncNativeBlockedUser \
    --namespace "$AB_NAMESPACE" \
    --body '[{"platformId": "C6I3lMjGSWN2laRl", "psnEnv": "xfcjHfYakUCTqGkE"}, {"platformId": "7wcWfDslpJSqGAXQ", "psnEnv": "0yYoNRKd3IL5TAQ6"}, {"platformId": "iiPlSC2uE4o5Vwdo", "psnEnv": "3fePqIJA8IHtrkmu"}]' \
    > test.out 2>&1
eval_tap $? 17 'SyncNativeBlockedUser' test.out

#- 18 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 18 'AdminGetAllConfigV1' test.out

#- 19 AdminGetLogConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetLogConfig \
    > test.out 2>&1
eval_tap $? 19 'AdminGetLogConfig' test.out

#- 20 AdminPatchUpdateLogConfig
./ng net.accelbyte.sdk.cli.Main lobby adminPatchUpdateLogConfig \
    --body '{"logLevel": "warning", "logLevelDB": "fatal", "slowQueryThreshold": 15, "socketLogEnabled": true}' \
    > test.out 2>&1
eval_tap $? 20 'AdminPatchUpdateLogConfig' test.out

#- 21 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminGetConfigV1' test.out

#- 22 AdminUpdateConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowInviteNonConnectedUser": false, "allowJoinPartyDuringMatchmaking": true, "autoKickOnDisconnect": false, "autoKickOnDisconnectDelay": 59, "cancelTicketOnDisconnect": true, "chatRateLimitBurst": 54, "chatRateLimitDuration": 82, "concurrentUsersLimit": 22, "disableInvitationOnJoinParty": false, "enableChat": true, "entitlementCheck": false, "entitlementItemID": "uZAAiE0mit9RGCCH", "generalRateLimitBurst": 29, "generalRateLimitDuration": 52, "keepPresenceActivityOnDisconnect": true, "maxDSWaitTime": 96, "maxFriendsLimit": 45, "maxPartyMember": 83, "profanityFilter": false, "readyConsentTimeout": 49, "requestMetadataMaxSize": 62, "unregisterDelay": 52}' \
    > test.out 2>&1
eval_tap $? 22 'AdminUpdateConfigV1' test.out

#- 23 AdminExportConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminExportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'AdminExportConfigV1' test.out

#- 24 AdminImportConfigV1
./ng net.accelbyte.sdk.cli.Main lobby adminImportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 24 'AdminImportConfigV1' test.out

#- 25 GetListOfFriends
./ng net.accelbyte.sdk.cli.Main lobby getListOfFriends \
    --namespace "$AB_NAMESPACE" \
    --userId 'dscKHPEqgA8yu7Vk' \
    --friendId '6Jt4Ymos9Jcdos4f' \
    --friendIds 'YcTVU6RBt0zYoMcH,yCUEXlAvxJMdalwS,yliWMNW5NyLu0M3V' \
    --limit '68' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 25 'GetListOfFriends' test.out

#- 26 GetIncomingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getIncomingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'h2EI8JlDbPWbQ6Q9' \
    --friendId 'lNmqRBaAkLnvxkT1' \
    --limit '31' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 26 'GetIncomingFriendRequests' test.out

#- 27 AdminListFriendsOfFriends
./ng net.accelbyte.sdk.cli.Main lobby adminListFriendsOfFriends \
    --namespace "$AB_NAMESPACE" \
    --userId '8cmDc3fxU8MyKrQp' \
    --friendId 'M4hkkK6KKXNB3Gv0' \
    --limit '70' \
    --nopaging  \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 27 'AdminListFriendsOfFriends' test.out

#- 28 GetOutgoingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getOutgoingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'qmF51TkhjYnaq6fo' \
    --limit '99' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 28 'GetOutgoingFriendRequests' test.out

#- 29 AdminGetGlobalConfig
eval_tap 0 29 'AdminGetGlobalConfig # SKIP deprecated' test.out

#- 30 AdminUpdateGlobalConfig
eval_tap 0 30 'AdminUpdateGlobalConfig # SKIP deprecated' test.out

#- 31 AdminDeleteGlobalConfig
eval_tap 0 31 'AdminDeleteGlobalConfig # SKIP deprecated' test.out

#- 32 SendMultipleUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendMultipleUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "vXa3bMrXsDr6kILs", "topicName": "SSyDdmykmoPYgc2L", "userIds": ["4jk4Lo0LSP0pf4Ix", "jUkl535X3ateEKDp", "ADz1x3poD3Qgb3bo"]}' \
    > test.out 2>&1
eval_tap $? 32 'SendMultipleUsersFreeformNotificationV1Admin' test.out

#- 33 SendUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "LQQ1MzH7Qm8bwbmX", "topicName": "gdAPh1EThG96gAFK"}' \
    > test.out 2>&1
eval_tap $? 33 'SendUsersFreeformNotificationV1Admin' test.out

#- 34 SendPartyFreeformNotificationV1Admin
eval_tap 0 34 'SendPartyFreeformNotificationV1Admin # SKIP deprecated' test.out

#- 35 SendPartyTemplatedNotificationV1Admin
eval_tap 0 35 'SendPartyTemplatedNotificationV1Admin # SKIP deprecated' test.out

#- 36 GetAllNotificationTemplatesV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTemplatesV1Admin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'GetAllNotificationTemplatesV1Admin' test.out

#- 37 CreateNotificationTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "K2WDgCcxvONZm3Ee", "templateLanguage": "ERmDnyeFoF7VSZ6p", "templateSlug": "f3vneSD2Tb3g7mSQ"}' \
    > test.out 2>&1
eval_tap $? 37 'CreateNotificationTemplateV1Admin' test.out

#- 38 SendUsersTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"UhAEtrmjqU6YE3p4": "lSck0ZHn5GI39YBH", "qaTHeKtW18iGeUlc": "9d9sogWa24CKNS0G", "qVvUfHQvsHXNUNe4": "mhgo5QB65lSAiYnN"}, "templateLanguage": "jkfZrQvGgbLdLsFz", "templateSlug": "HkBMr1yrOMlNFSrU", "topicName": "EirnjX9fDmIbeZxz"}' \
    > test.out 2>&1
eval_tap $? 38 'SendUsersTemplatedNotificationV1Admin' test.out

#- 39 GetTemplateSlugLocalizationsTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'fTcyiuATus9hsfpF' \
    --after 'DcSDG8aMVGLiBNrD' \
    --before 'jqoxcwgGLXpUL4pp' \
    --limit '39' \
    > test.out 2>&1
eval_tap $? 39 'GetTemplateSlugLocalizationsTemplateV1Admin' test.out

#- 40 DeleteNotificationTemplateSlugV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'ncYAHdNzDmeIP6rO' \
    > test.out 2>&1
eval_tap $? 40 'DeleteNotificationTemplateSlugV1Admin' test.out

#- 41 GetSingleTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getSingleTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'vDz9KOsb392k6YmJ' \
    --templateSlug 'FfRByjlBiuFM3FIo' \
    > test.out 2>&1
eval_tap $? 41 'GetSingleTemplateLocalizationV1Admin' test.out

#- 42 UpdateTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'Vk8T3GpAnkCmBUqg' \
    --templateSlug '2SCnqntX9y1aZSWM' \
    --body '{"templateContent": "iVi10sG6vxkfUcmq"}' \
    > test.out 2>&1
eval_tap $? 42 'UpdateTemplateLocalizationV1Admin' test.out

#- 43 DeleteTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'RRbceJ5i0EeDxOgB' \
    --templateSlug 'nhhqElIaDml48wdN' \
    > test.out 2>&1
eval_tap $? 43 'DeleteTemplateLocalizationV1Admin' test.out

#- 44 PublishTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby publishTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'FLTm5T50x9WT0GfH' \
    --templateSlug '2rtOa4EXsXzOXQAk' \
    > test.out 2>&1
eval_tap $? 44 'PublishTemplateLocalizationV1Admin' test.out

#- 45 GetAllNotificationTopicsV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTopicsV1Admin \
    --namespace "$AB_NAMESPACE" \
    --after '4mqrxzTtuLl4XlbG' \
    --before 'L8QOxtjzm8y2wNhm' \
    --limit '45' \
    > test.out 2>&1
eval_tap $? 45 'GetAllNotificationTopicsV1Admin' test.out

#- 46 CreateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Mh5eC3IHeHSKLCa3", "topicName": "xreNDUWehwH3q31A"}' \
    > test.out 2>&1
eval_tap $? 46 'CreateNotificationTopicV1Admin' test.out

#- 47 GetNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName '806DJgas4b6z3LNU' \
    > test.out 2>&1
eval_tap $? 47 'GetNotificationTopicV1Admin' test.out

#- 48 UpdateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'j7fdgLA84Z8YYk6Q' \
    --body '{"description": "EgJjBbEDoNf3n0hE"}' \
    > test.out 2>&1
eval_tap $? 48 'UpdateNotificationTopicV1Admin' test.out

#- 49 DeleteNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'oRCAcf80zfFyabWA' \
    > test.out 2>&1
eval_tap $? 49 'DeleteNotificationTopicV1Admin' test.out

#- 50 SendSpecificUserFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'gIUXiI07A68eaqC2' \
    --body '{"message": "J9jyEW6GLbc0NaKD", "topicName": "UL3sa13lk1dQBHO8"}' \
    > test.out 2>&1
eval_tap $? 50 'SendSpecificUserFreeformNotificationV1Admin' test.out

#- 51 SendSpecificUserTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId '6IlBhnetU4RwTqUX' \
    --body '{"templateContext": {"lTDBzOuYsaZA2yyd": "4mbqoOfADMMAXFaY", "9eKa699bRVhyaKww": "rAP2aMlu7WtjCtoY", "etOO847g8OudOfjn": "CuHZ3c46IjGa23Yv"}, "templateLanguage": "YmmDg7VYPXIuvUYT", "templateSlug": "ZBRujIUE1Tq5jyAZ", "topicName": "vkRCMNFIurjh2imd"}' \
    > test.out 2>&1
eval_tap $? 51 'SendSpecificUserTemplatedNotificationV1Admin' test.out

#- 52 AdminGetPartyDataV1
eval_tap 0 52 'AdminGetPartyDataV1 # SKIP deprecated' test.out

#- 53 AdminUpdatePartyAttributesV1
eval_tap 0 53 'AdminUpdatePartyAttributesV1 # SKIP deprecated' test.out

#- 54 AdminJoinPartyV1
eval_tap 0 54 'AdminJoinPartyV1 # SKIP deprecated' test.out

#- 55 AdminGetUserPartyV1
eval_tap 0 55 'AdminGetUserPartyV1 # SKIP deprecated' test.out

#- 56 AdminGetLobbyCCU
./ng net.accelbyte.sdk.cli.Main lobby adminGetLobbyCCU \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'AdminGetLobbyCCU' test.out

#- 57 AdminGetBulkPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetBulkPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listBlockedUserId": ["b4rbkXj0ZwsVC0gL", "97ZVJSPqJiwv1qlY", "B1RSKs6gQxC3Gb7S"]}' \
    > test.out 2>&1
eval_tap $? 57 'AdminGetBulkPlayerBlockedPlayersV1' test.out

#- 58 AdminGetAllPlayerSessionAttribute
eval_tap 0 58 'AdminGetAllPlayerSessionAttribute # SKIP deprecated' test.out

#- 59 AdminSetPlayerSessionAttribute
eval_tap 0 59 'AdminSetPlayerSessionAttribute # SKIP deprecated' test.out

#- 60 AdminGetPlayerSessionAttribute
eval_tap 0 60 'AdminGetPlayerSessionAttribute # SKIP deprecated' test.out

#- 61 AdminGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '0o4zGYY7KQI1AeFg' \
    > test.out 2>&1
eval_tap $? 61 'AdminGetPlayerBlockedPlayersV1' test.out

#- 62 AdminGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PqaOkvo1aolB4lkK' \
    > test.out 2>&1
eval_tap $? 62 'AdminGetPlayerBlockedByPlayersV1' test.out

#- 63 AdminBulkBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'B4EYOkQ1jMD3cym8' \
    --body '{"listBlockedUserId": ["xIfkOVW2grREOLx0", "KOww3HICQLfl7MUB", "G7qtPu64yAtURKLR"]}' \
    > test.out 2>&1
eval_tap $? 63 'AdminBulkBlockPlayersV1' test.out

#- 64 AdminBulkUnblockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkUnblockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kb738HGS6rDgMdII' \
    --body '{"listUnblockUserId": ["lhS1fSiM9331m7Ta", "1PsKc50Kv6ecnEev", "cAx2K2zkRenmPZnG"]}' \
    > test.out 2>&1
eval_tap $? 64 'AdminBulkUnblockPlayersV1' test.out

#- 65 AdminDebugProfanityFilters
eval_tap 0 65 'AdminDebugProfanityFilters # SKIP deprecated' test.out

#- 66 AdminGetProfanityListFiltersV1
eval_tap 0 66 'AdminGetProfanityListFiltersV1 # SKIP deprecated' test.out

#- 67 AdminAddProfanityFilterIntoList
eval_tap 0 67 'AdminAddProfanityFilterIntoList # SKIP deprecated' test.out

#- 68 AdminAddProfanityFilters
eval_tap 0 68 'AdminAddProfanityFilters # SKIP deprecated' test.out

#- 69 AdminImportProfanityFiltersFromFile
eval_tap 0 69 'AdminImportProfanityFiltersFromFile # SKIP deprecated' test.out

#- 70 AdminDeleteProfanityFilter
eval_tap 0 70 'AdminDeleteProfanityFilter # SKIP deprecated' test.out

#- 71 AdminGetProfanityLists
eval_tap 0 71 'AdminGetProfanityLists # SKIP deprecated' test.out

#- 72 AdminCreateProfanityList
eval_tap 0 72 'AdminCreateProfanityList # SKIP deprecated' test.out

#- 73 AdminUpdateProfanityList
eval_tap 0 73 'AdminUpdateProfanityList # SKIP deprecated' test.out

#- 74 AdminDeleteProfanityList
eval_tap 0 74 'AdminDeleteProfanityList # SKIP deprecated' test.out

#- 75 AdminGetProfanityRule
eval_tap 0 75 'AdminGetProfanityRule # SKIP deprecated' test.out

#- 76 AdminSetProfanityRuleForNamespace
eval_tap 0 76 'AdminSetProfanityRuleForNamespace # SKIP deprecated' test.out

#- 77 AdminVerifyMessageProfanityResponse
eval_tap 0 77 'AdminVerifyMessageProfanityResponse # SKIP deprecated' test.out

#- 78 AdminGetThirdPartyConfig
eval_tap 0 78 'AdminGetThirdPartyConfig # SKIP deprecated' test.out

#- 79 AdminUpdateThirdPartyConfig
eval_tap 0 79 'AdminUpdateThirdPartyConfig # SKIP deprecated' test.out

#- 80 AdminCreateThirdPartyConfig
eval_tap 0 80 'AdminCreateThirdPartyConfig # SKIP deprecated' test.out

#- 81 AdminDeleteThirdPartyConfig
eval_tap 0 81 'AdminDeleteThirdPartyConfig # SKIP deprecated' test.out

#- 82 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main lobby publicGetMessages \
    > test.out 2>&1
eval_tap $? 82 'PublicGetMessages' test.out

#- 83 PublicGetPartyDataV1
eval_tap 0 83 'PublicGetPartyDataV1 # SKIP deprecated' test.out

#- 84 PublicUpdatePartyAttributesV1
eval_tap 0 84 'PublicUpdatePartyAttributesV1 # SKIP deprecated' test.out

#- 85 PublicSetPartyLimitV1
eval_tap 0 85 'PublicSetPartyLimitV1 # SKIP deprecated' test.out

#- 86 PublicPlayerBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicPlayerBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"blockedUserId": "Bt4P7WnbdSJtjX7Z"}' \
    > test.out 2>&1
eval_tap $? 86 'PublicPlayerBlockPlayersV1' test.out

#- 87 PublicGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'PublicGetPlayerBlockedPlayersV1' test.out

#- 88 PublicGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'PublicGetPlayerBlockedByPlayersV1' test.out

#- 89 PublicUnblockPlayerV1
./ng net.accelbyte.sdk.cli.Main lobby publicUnblockPlayerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "shZyZl5x4bRXBHUT"}' \
    > test.out 2>&1
eval_tap $? 89 'PublicUnblockPlayerV1' test.out

#- 90 UsersPresenceHandlerV1
./ng net.accelbyte.sdk.cli.Main lobby usersPresenceHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --countOnly  \
    --userIds 'rDzZSKscfOcYu3dp' \
    > test.out 2>&1
eval_tap $? 90 'UsersPresenceHandlerV1' test.out

#- 91 UsersPresenceHandlerV2
./ng net.accelbyte.sdk.cli.Main lobby usersPresenceHandlerV2 \
    --namespace "$AB_NAMESPACE" \
    --countOnly  \
    --body '{"userIDs": ["CROYqUiGKXVFCmpo", "6sPwVOEDSJsEK5Qp", "NhlI2iS5EpGhhvXY"]}' \
    > test.out 2>&1
eval_tap $? 91 'UsersPresenceHandlerV2' test.out

#- 92 FreeFormNotification
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotification \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "ck0upMzUYnb76tFk", "topic": "EORV3bu1bNCtX7W4"}' \
    > test.out 2>&1
eval_tap $? 92 'FreeFormNotification' test.out

#- 93 GetMyNotifications
./ng net.accelbyte.sdk.cli.Main lobby getMyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endTime '97' \
    --limit '11' \
    --offset '16' \
    --startTime '60' \
    > test.out 2>&1
eval_tap $? 93 'GetMyNotifications' test.out

#- 94 GetMyOfflineNotifications
./ng net.accelbyte.sdk.cli.Main lobby getMyOfflineNotifications \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'GetMyOfflineNotifications' test.out

#- 95 NotificationWithTemplate
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"P80G9Pclxcft2ulI": "JzPyrVEiOG4Ucqsu", "GKHhMRWLVd3DlhLu": "IpomM8sm1MiaI1mX", "2tJoARtdbBe7udsM": "rok0WvGYYnx4V709"}, "templateLanguage": "xbnGezKsDwG2omOR", "templateSlug": "2nvYI9TVqJdvzcWb", "topic": "fUpaXp5JMl5LL4bT"}' \
    > test.out 2>&1
eval_tap $? 95 'NotificationWithTemplate' test.out

#- 96 GetGameTemplate
./ng net.accelbyte.sdk.cli.Main lobby getGameTemplate \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'GetGameTemplate' test.out

#- 97 CreateTemplate
./ng net.accelbyte.sdk.cli.Main lobby createTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "xBmZjdrrIxsB0NRs", "templateLanguage": "B1fPqqRRulpqpymD", "templateSlug": "kQhtrHWwRVnwVBOq"}' \
    > test.out 2>&1
eval_tap $? 97 'CreateTemplate' test.out

#- 98 GetSlugTemplate
./ng net.accelbyte.sdk.cli.Main lobby getSlugTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'OHi8pWGd1juYhiqj' \
    --after 'RJOqB5F93zFQbJnd' \
    --before 'UDpdONneAczbBdHb' \
    --limit '28' \
    > test.out 2>&1
eval_tap $? 98 'GetSlugTemplate' test.out

#- 99 DeleteTemplateSlug
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateSlug \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'slt71B1SmZp2JZp5' \
    > test.out 2>&1
eval_tap $? 99 'DeleteTemplateSlug' test.out

#- 100 GetLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby getLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '0CnPb71ORYcmQbTU' \
    --templateSlug '5JX8ccLjMXJRk0ea' \
    > test.out 2>&1
eval_tap $? 100 'GetLocalizationTemplate' test.out

#- 101 UpdateLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby updateLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'KQDOJvrTefglSs6g' \
    --templateSlug '4iY9u02aCNYIWekp' \
    --body '{"templateContent": "18lOC3mNqF7Bl0Lc"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateLocalizationTemplate' test.out

#- 102 DeleteTemplateLocalization
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalization \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'ghVHfPEspxwhRON0' \
    --templateSlug 'bc1eMbEIjowLqc3e' \
    > test.out 2>&1
eval_tap $? 102 'DeleteTemplateLocalization' test.out

#- 103 PublishTemplate
./ng net.accelbyte.sdk.cli.Main lobby publishTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'cjXJbZDKKoxLE1Y3' \
    --templateSlug 'Dymtj3giPg4x4yiP' \
    > test.out 2>&1
eval_tap $? 103 'PublishTemplate' test.out

#- 104 GetTopicByNamespace
./ng net.accelbyte.sdk.cli.Main lobby getTopicByNamespace \
    --namespace "$AB_NAMESPACE" \
    --after 'X6ues1Hhhkg1yLVb' \
    --before 'LFzHEP8cM4NTwr0K' \
    --limit '69' \
    > test.out 2>&1
eval_tap $? 104 'GetTopicByNamespace' test.out

#- 105 CreateTopic
./ng net.accelbyte.sdk.cli.Main lobby createTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ZXiR1DJ7HVWqMkNS", "topic": "awQUWDFJvJBWic7U"}' \
    > test.out 2>&1
eval_tap $? 105 'CreateTopic' test.out

#- 106 GetTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby getTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'kBeIXuqDuAXI66bQ' \
    > test.out 2>&1
eval_tap $? 106 'GetTopicByTopicName' test.out

#- 107 UpdateTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby updateTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic '71w0deoV9Lx5RDA1' \
    --body '{"description": "l2XcrciYNEzvSZIP"}' \
    > test.out 2>&1
eval_tap $? 107 'UpdateTopicByTopicName' test.out

#- 108 DeleteTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby deleteTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'khSgORcz5S5BvmgB' \
    > test.out 2>&1
eval_tap $? 108 'DeleteTopicByTopicName' test.out

#- 109 FreeFormNotificationByUserID
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotificationByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lxh4ijFnE3Tam69q' \
    --body '{"message": "SZ7PC6f6QkmZXElW", "topic": "9YfRSse6AAz3S4cz"}' \
    > test.out 2>&1
eval_tap $? 109 'FreeFormNotificationByUserID' test.out

#- 110 NotificationWithTemplateByUserID
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplateByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'z0QKFlAVmVLu4AOe' \
    --body '{"templateContext": {"c0z8eBeeoip68J1n": "sv4W2OJhtafxMSJl", "Heb34sZKHcl5LLLO": "exL4fZvWtND2tcBF", "pX8lNtFEJ7tnkY6M": "ca5afj12K2IzrBvv"}, "templateLanguage": "Wm4udE0OXudXgNne", "templateSlug": "8kJATwlc6esUp6Sw", "topic": "1I98jeZQ7hfxnhLd"}' \
    > test.out 2>&1
eval_tap $? 110 'NotificationWithTemplateByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE