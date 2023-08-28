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
echo "1..96"

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
    --body '{"allowInviteNonConnectedUser": true, "allowJoinPartyDuringMatchmaking": true, "autoKickOnDisconnect": false, "autoKickOnDisconnectDelay": 79, "cancelTicketOnDisconnect": true, "chatRateLimitBurst": 12, "chatRateLimitDuration": 92, "concurrentUsersLimit": 33, "disableInvitationOnJoinParty": true, "enableChat": false, "entitlementCheck": true, "entitlementItemID": "qNiTvB6SdAdIhUDr", "generalRateLimitBurst": 46, "generalRateLimitDuration": 29, "keepPresenceActivityOnDisconnect": false, "maxDSWaitTime": 39, "maxFriendsLimit": 54, "maxPartyMember": 97, "profanityFilter": false, "readyConsentTimeout": 8, "unregisterDelay": 35}' \
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
    --userId 'cdKi5r6QEa1ysLEz' \
    --friendId 'th6mXhzkzWkFeZSo' \
    --limit '63' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 21 'GetListOfFriends' test.out

#- 22 GetIncomingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getIncomingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'AcBdW19m4eu6d5tA' \
    --friendId '5jUmiTqpyhPFdxLz' \
    --limit '65' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 22 'GetIncomingFriendRequests' test.out

#- 23 GetOutgoingFriendRequests
./ng net.accelbyte.sdk.cli.Main lobby getOutgoingFriendRequests \
    --namespace "$AB_NAMESPACE" \
    --userId 'QN05MYzYiKWe5dNR' \
    --limit '23' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 23 'GetOutgoingFriendRequests' test.out

#- 24 SendMultipleUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendMultipleUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "jv7IPrDQQRgat0Se", "topicName": "vkLGMS0lyuI9a2I9", "userIds": ["u6Vpbsx5w8hqUI06", "UpOXGSLmCVuHOPlL", "lkvR8sKgnuRkgghG"]}' \
    > test.out 2>&1
eval_tap $? 24 'SendMultipleUsersFreeformNotificationV1Admin' test.out

#- 25 SendUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "oYupD391C2qtPYok", "topicName": "ahFjkQsfCaTmt1d6"}' \
    > test.out 2>&1
eval_tap $? 25 'SendUsersFreeformNotificationV1Admin' test.out

#- 26 SendPartyFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId '7FXGk2s9Q0mPVo3t' \
    --body '{"message": "wu0MesTCf9x4rt69", "topicName": "lna7qxNeIxPz6Mbw"}' \
    > test.out 2>&1
eval_tap $? 26 'SendPartyFreeformNotificationV1Admin' test.out

#- 27 SendPartyTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'L6IY69z1UaLqYSYW' \
    --body '{"templateContext": {"ytLPziZMdjxcBZuf": "QxGiHPllG4cYEzfT", "D1ZBm3MqHcUmLZZb": "Sqb8RwNmn9HrNQy4", "uZAAiE0mit9RGCCH": "YzUOcEdscKHPEqgA"}, "templateLanguage": "8yu7Vk6Jt4Ymos9J", "templateSlug": "cdos4fYcTVU6RBt0", "topicName": "zYoMcHyCUEXlAvxJ"}' \
    > test.out 2>&1
eval_tap $? 27 'SendPartyTemplatedNotificationV1Admin' test.out

#- 28 GetAllNotificationTemplatesV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTemplatesV1Admin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllNotificationTemplatesV1Admin' test.out

#- 29 CreateNotificationTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "MdalwSyliWMNW5Ny", "templateLanguage": "Lu0M3VHh2EI8JlDb", "templateSlug": "PWbQ6Q9lNmqRBaAk"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateNotificationTemplateV1Admin' test.out

#- 30 SendUsersTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"LnvxkT1X68cmDc3f": "xU8MyKrQpM4hkkK6", "KKXNB3Gv0IqmF51T": "khjYnaq6foWvXa3b", "MrXsDr6kILsSSyDd": "mykmoPYgc2L4jk4L"}, "templateLanguage": "o0LSP0pf4IxjUkl5", "templateSlug": "35X3ateEKDpADz1x", "topicName": "3poD3Qgb3boLQQ1M"}' \
    > test.out 2>&1
eval_tap $? 30 'SendUsersTemplatedNotificationV1Admin' test.out

#- 31 GetTemplateSlugLocalizationsTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'zH7Qm8bwbmXgdAPh' \
    --after '1EThG96gAFKK2WDg' \
    --before 'CcxvONZm3EeERmDn' \
    --limit '49' \
    > test.out 2>&1
eval_tap $? 31 'GetTemplateSlugLocalizationsTemplateV1Admin' test.out

#- 32 DeleteNotificationTemplateSlugV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'KTlmVr9XuoJbRFQS' \
    > test.out 2>&1
eval_tap $? 32 'DeleteNotificationTemplateSlugV1Admin' test.out

#- 33 GetSingleTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getSingleTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'KVPHbn4Xxtu7LQRE' \
    --templateSlug 'NjEEztx1WsYSiZqa' \
    > test.out 2>&1
eval_tap $? 33 'GetSingleTemplateLocalizationV1Admin' test.out

#- 34 UpdateTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'n0nSBJroav91GXlv' \
    --templateSlug 'PG6bFYReVHQipcCx' \
    --body '{"templateContent": "9Zw5D2L7vIYhGGSy"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateTemplateLocalizationV1Admin' test.out

#- 35 DeleteTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'EW4ZJJ42d3PBddN8' \
    --templateSlug 'S48l9lyNApflxqMr' \
    > test.out 2>&1
eval_tap $? 35 'DeleteTemplateLocalizationV1Admin' test.out

#- 36 PublishTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby publishTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'j3oZk03QXcKMDYDD' \
    --templateSlug 'xHSZjtqXyJ58f7Gc' \
    > test.out 2>&1
eval_tap $? 36 'PublishTemplateLocalizationV1Admin' test.out

#- 37 GetAllNotificationTopicsV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTopicsV1Admin \
    --namespace "$AB_NAMESPACE" \
    --after '26SaiGVkydwYWQG2' \
    --before '6yUZNmTBcvrbYCwZ' \
    --limit '39' \
    > test.out 2>&1
eval_tap $? 37 'GetAllNotificationTopicsV1Admin' test.out

#- 38 CreateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "aMVGLiBNrDjqoxcw", "topicName": "gGLXpUL4pp2ncYAH"}' \
    > test.out 2>&1
eval_tap $? 38 'CreateNotificationTopicV1Admin' test.out

#- 39 GetNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'dNzDmeIP6rOvDz9K' \
    > test.out 2>&1
eval_tap $? 39 'GetNotificationTopicV1Admin' test.out

#- 40 UpdateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'Osb392k6YmJFfRBy' \
    --body '{"description": "jlBiuFM3FIoVk8T3"}' \
    > test.out 2>&1
eval_tap $? 40 'UpdateNotificationTopicV1Admin' test.out

#- 41 DeleteNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'GpAnkCmBUqg2SCnq' \
    > test.out 2>&1
eval_tap $? 41 'DeleteNotificationTopicV1Admin' test.out

#- 42 SendSpecificUserFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'ntX9y1aZSWMiVi10' \
    --body '{"message": "sG6vxkfUcmqRRbce", "topicName": "J5i0EeDxOgBnhhqE"}' \
    > test.out 2>&1
eval_tap $? 42 'SendSpecificUserFreeformNotificationV1Admin' test.out

#- 43 SendSpecificUserTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'lIaDml48wdNFLTm5' \
    --body '{"templateContext": {"T50x9WT0GfH2rtOa": "4EXsXzOXQAk4mqrx", "zTtuLl4XlbGL8QOx": "tjzm8y2wNhmwoYZy", "I4EFZKBcYrCEAE7W": "Isfmx40NLRc6m8he"}, "templateLanguage": "KnWhzfe2NubeoKFe", "templateSlug": "IaFQCYoDPICpnduE", "topicName": "EQlULdJz4mnRBkMN"}' \
    > test.out 2>&1
eval_tap $? 43 'SendSpecificUserTemplatedNotificationV1Admin' test.out

#- 44 AdminGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xvvKgAT8mJrYq6hR' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetPartyDataV1' test.out

#- 45 AdminUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'kloqxM3gpwxcfMy9' \
    --body '{"custom_attribute": {"XzjjI5YbsKoADkzJ": {}, "EN2VHzih3bit0VWn": {}, "3CO39PXDNxtXgeO3": {}}, "updatedAt": 64}' \
    > test.out 2>&1
eval_tap $? 45 'AdminUpdatePartyAttributesV1' test.out

#- 46 AdminJoinPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminJoinPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'OuYsaZA2yyd4mbqo' \
    --userId 'OfADMMAXFaY9eKa6' \
    > test.out 2>&1
eval_tap $? 46 'AdminJoinPartyV1' test.out

#- 47 AdminGetUserPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetUserPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '99bRVhyaKwwrAP2a' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetUserPartyV1' test.out

#- 48 AdminGetLobbyCCU
./ng net.accelbyte.sdk.cli.Main lobby adminGetLobbyCCU \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'AdminGetLobbyCCU' test.out

#- 49 AdminGetBulkPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetBulkPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listBlockedUserId": ["Mlu7WtjCtoYetOO8", "47g8OudOfjnCuHZ3", "c46IjGa23YvYmmDg"]}' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetBulkPlayerBlockedPlayersV1' test.out

#- 50 AdminGetAllPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetAllPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId '7VYPXIuvUYTZBRuj' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllPlayerSessionAttribute' test.out

#- 51 AdminSetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminSetPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'IUE1Tq5jyAZvkRCM' \
    --body '{"attributes": {"NFIurjh2imdb4rbk": "Xj0ZwsVC0gL97ZVJ", "SPqJiwv1qlYB1RSK": "s6gQxC3Gb7S0o4zG", "YY7KQI1AeFgPqaOk": "vo1aolB4lkKB4EYO"}}' \
    > test.out 2>&1
eval_tap $? 51 'AdminSetPlayerSessionAttribute' test.out

#- 52 AdminGetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerSessionAttribute \
    --attribute 'kQ1jMD3cym8xIfkO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VW2grREOLx0KOww3' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetPlayerSessionAttribute' test.out

#- 53 AdminGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HICQLfl7MUBG7qtP' \
    > test.out 2>&1
eval_tap $? 53 'AdminGetPlayerBlockedPlayersV1' test.out

#- 54 AdminGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'u64yAtURKLRkb738' \
    > test.out 2>&1
eval_tap $? 54 'AdminGetPlayerBlockedByPlayersV1' test.out

#- 55 AdminBulkBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HGS6rDgMdIIlhS1f' \
    --body '{"listBlockedUserId": ["SiM9331m7Ta1PsKc", "50Kv6ecnEevcAx2K", "2zkRenmPZnGBt4P7"]}' \
    > test.out 2>&1
eval_tap $? 55 'AdminBulkBlockPlayersV1' test.out

#- 56 AdminDebugProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminDebugProfanityFilters \
    --namespace "$AB_NAMESPACE" \
    --body '{"text": "WnbdSJtjX7ZshZyZ"}' \
    > test.out 2>&1
eval_tap $? 56 'AdminDebugProfanityFilters' test.out

#- 57 AdminGetProfanityListFiltersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityListFiltersV1 \
    --list 'l5x4bRXBHUTrDzZS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'AdminGetProfanityListFiltersV1' test.out

#- 58 AdminAddProfanityFilterIntoList
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilterIntoList \
    --list 'KscfOcYu3dpCROYq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "UiGKXVFCmpo6sPwV", "note": "OEDSJsEK5QpNhlI2"}' \
    > test.out 2>&1
eval_tap $? 58 'AdminAddProfanityFilterIntoList' test.out

#- 59 AdminAddProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilters \
    --list 'iS5EpGhhvXYck0up' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filters": [{"filter": "MzUYnb76tFkEORV3", "note": "bu1bNCtX7W40V6Do"}, {"filter": "5sYadCCFrHHC3DpZ", "note": "xkrQDXuNFviMarv8"}, {"filter": "mnfHK8CCmE2lPnsb", "note": "D3SGEdlwuUccE536"}]}' \
    > test.out 2>&1
eval_tap $? 59 'AdminAddProfanityFilters' test.out

#- 60 AdminImportProfanityFiltersFromFile
./ng net.accelbyte.sdk.cli.Main lobby adminImportProfanityFiltersFromFile \
    --list 'ugBp3HBvepnDCjgy' \
    --namespace "$AB_NAMESPACE" \
    --body '[74, 21, 24]' \
    > test.out 2>&1
eval_tap $? 60 'AdminImportProfanityFiltersFromFile' test.out

#- 61 AdminDeleteProfanityFilter
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityFilter \
    --list '0WvGYYnx4V709xbn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "GezKsDwG2omOR2nv"}' \
    > test.out 2>&1
eval_tap $? 61 'AdminDeleteProfanityFilter' test.out

#- 62 AdminGetProfanityLists
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityLists \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'AdminGetProfanityLists' test.out

#- 63 AdminCreateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminCreateProfanityList \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": true, "isMandatory": true, "name": "jZpjvsugAOS7u8Ri"}' \
    > test.out 2>&1
eval_tap $? 63 'AdminCreateProfanityList' test.out

#- 64 AdminUpdateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateProfanityList \
    --list 'WyerCSa8SRgwsAj1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": false, "isMandatory": true, "newName": "k1jglaDXTvKCWwNT"}' \
    > test.out 2>&1
eval_tap $? 64 'AdminUpdateProfanityList' test.out

#- 65 AdminDeleteProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityList \
    --list 'Ahd2wrS0uPdjhdin' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AdminDeleteProfanityList' test.out

#- 66 AdminGetProfanityRule
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityRule \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'AdminGetProfanityRule' test.out

#- 67 AdminSetProfanityRuleForNamespace
./ng net.accelbyte.sdk.cli.Main lobby adminSetProfanityRuleForNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"rule": "png5BLy8wbhMssAH"}' \
    > test.out 2>&1
eval_tap $? 67 'AdminSetProfanityRuleForNamespace' test.out

#- 68 AdminVerifyMessageProfanityResponse
./ng net.accelbyte.sdk.cli.Main lobby adminVerifyMessageProfanityResponse \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "japIkY9Rf4wP57dB", "profanityLevel": "ZNR88YbCtmKy8M9z"}' \
    > test.out 2>&1
eval_tap $? 68 'AdminVerifyMessageProfanityResponse' test.out

#- 69 AdminGetThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminGetThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'AdminGetThirdPartyConfig' test.out

#- 70 AdminUpdateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "VrjfGXZnqAQUoY1G"}' \
    > test.out 2>&1
eval_tap $? 70 'AdminUpdateThirdPartyConfig' test.out

#- 71 AdminCreateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminCreateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "jlIIk0iKoTTS1j02"}' \
    > test.out 2>&1
eval_tap $? 71 'AdminCreateThirdPartyConfig' test.out

#- 72 AdminDeleteThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'AdminDeleteThirdPartyConfig' test.out

#- 73 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main lobby publicGetMessages \
    > test.out 2>&1
eval_tap $? 73 'PublicGetMessages' test.out

#- 74 PublicGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'o7JjTXAQN0qdskdQ' \
    > test.out 2>&1
eval_tap $? 74 'PublicGetPartyDataV1' test.out

#- 75 PublicUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby publicUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'V0TqI8EFnmDbxIxi' \
    --body '{"custom_attribute": {"4YKlONk2Q5Y4Jvai": {}, "zwiilatuUjjt9lIM": {}, "Gql5ElEa9EIIlGcH": {}}, "updatedAt": 57}' \
    > test.out 2>&1
eval_tap $? 75 'PublicUpdatePartyAttributesV1' test.out

#- 76 PublicSetPartyLimitV1
./ng net.accelbyte.sdk.cli.Main lobby publicSetPartyLimitV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xwhRON0bc1eMbEIj' \
    --body '{"limit": 29}' \
    > test.out 2>&1
eval_tap $? 76 'PublicSetPartyLimitV1' test.out

#- 77 PublicGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'PublicGetPlayerBlockedPlayersV1' test.out

#- 78 PublicGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'PublicGetPlayerBlockedByPlayersV1' test.out

#- 79 UsersPresenceHandlerV1
./ng net.accelbyte.sdk.cli.Main lobby usersPresenceHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --countOnly  \
    --userIds 'FJ1KesKoELCpobBE' \
    > test.out 2>&1
eval_tap $? 79 'UsersPresenceHandlerV1' test.out

#- 80 FreeFormNotification
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotification \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "G8X645xpdXpai0rY", "topic": "aT5hOPjaf3H0tYig"}' \
    > test.out 2>&1
eval_tap $? 80 'FreeFormNotification' test.out

#- 81 NotificationWithTemplate
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"hU0VUfcYHJbBfAKS": "iPW3VgsZXiR1DJ7H", "VWqMkNSawQUWDFJv": "JBWic7UkBeIXuqDu", "AXI66bQ71w0deoV9": "Lx5RDA1l2XcrciYN"}, "templateLanguage": "EzvSZIPkhSgORcz5", "templateSlug": "S5BvmgBLxh4ijFnE", "topic": "3Tam69qSZ7PC6f6Q"}' \
    > test.out 2>&1
eval_tap $? 81 'NotificationWithTemplate' test.out

#- 82 GetGameTemplate
./ng net.accelbyte.sdk.cli.Main lobby getGameTemplate \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'GetGameTemplate' test.out

#- 83 CreateTemplate
./ng net.accelbyte.sdk.cli.Main lobby createTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContent": "kmZXElW9YfRSse6A", "templateLanguage": "Az3S4czz0QKFlAVm", "templateSlug": "VLu4AOec0z8eBeeo"}' \
    > test.out 2>&1
eval_tap $? 83 'CreateTemplate' test.out

#- 84 GetSlugTemplate
./ng net.accelbyte.sdk.cli.Main lobby getSlugTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'ip68J1nsv4W2OJht' \
    --after 'afxMSJlHeb34sZKH' \
    --before 'cl5LLLOexL4fZvWt' \
    --limit '80' \
    > test.out 2>&1
eval_tap $? 84 'GetSlugTemplate' test.out

#- 85 DeleteTemplateSlug
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateSlug \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'iiPDGQhNPEwiJCf2' \
    > test.out 2>&1
eval_tap $? 85 'DeleteTemplateSlug' test.out

#- 86 GetLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby getLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'XJVrlzqQls1ozhLV' \
    --templateSlug 'A3kE8jKvgatOEBM7' \
    > test.out 2>&1
eval_tap $? 86 'GetLocalizationTemplate' test.out

#- 87 UpdateLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby updateLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '0TdlNBJYOmpu1VCa' \
    --templateSlug 'rzBsV6xnZ5Jrzzjr' \
    --body '{"templateContent": "caug6CWVG8SWP3gl"}' \
    > test.out 2>&1
eval_tap $? 87 'UpdateLocalizationTemplate' test.out

#- 88 DeleteTemplateLocalization
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalization \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'U6muswVJnNnN7kAa' \
    --templateSlug '7j0riFc5HTHQIoVs' \
    > test.out 2>&1
eval_tap $? 88 'DeleteTemplateLocalization' test.out

#- 89 PublishTemplate
./ng net.accelbyte.sdk.cli.Main lobby publishTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'Go7dwV9DBqFKHQkE' \
    --templateSlug 'TJyTlUrwDTnoujQD' \
    > test.out 2>&1
eval_tap $? 89 'PublishTemplate' test.out

#- 90 GetTopicByNamespace
./ng net.accelbyte.sdk.cli.Main lobby getTopicByNamespace \
    --namespace "$AB_NAMESPACE" \
    --after '4IEiH9Z5qXn3aoRt' \
    --before 'lqOECohViHA5CzgF' \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 90 'GetTopicByNamespace' test.out

#- 91 CreateTopic
./ng net.accelbyte.sdk.cli.Main lobby createTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "vpZaHCuESOiIZsMf", "topic": "B4ZH3mtgWgU4pCAK"}' \
    > test.out 2>&1
eval_tap $? 91 'CreateTopic' test.out

#- 92 GetTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby getTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'xeE70CaunQNxot37' \
    > test.out 2>&1
eval_tap $? 92 'GetTopicByTopicName' test.out

#- 93 UpdateTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby updateTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic '1W9G4AvQkqsGnmyo' \
    --body '{"description": "5JJTUVmb8GEXFTlE"}' \
    > test.out 2>&1
eval_tap $? 93 'UpdateTopicByTopicName' test.out

#- 94 DeleteTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby deleteTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'MEsFzYqwgK1Np5no' \
    > test.out 2>&1
eval_tap $? 94 'DeleteTopicByTopicName' test.out

#- 95 FreeFormNotificationByUserID
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotificationByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'dqpLm7FhJBNXzAFd' \
    --body '{"message": "O0Khqf6kiTdSGv2L", "topic": "FjAKY7CbgsWqFWZX"}' \
    > test.out 2>&1
eval_tap $? 95 'FreeFormNotificationByUserID' test.out

#- 96 NotificationWithTemplateByUserID
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplateByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId '7kPBom8F9GLLTG8p' \
    --body '{"templateContext": {"hc3n4iLoIllKlpO2": "pqiXJF3WGRaoQomS", "JC4DdrKF7SUQPLG5": "9e0k5ZtX6wK7PpUl", "cIW32iK7MGt1ixY5": "rA1WoVeJIePF8ZrQ"}, "templateLanguage": "zP4zvtdxdbZUpd6F", "templateSlug": "JtHJ1pyVwyKQLY6F", "topic": "EO65Rb3z7CYLM8Il"}' \
    > test.out 2>&1
eval_tap $? 96 'NotificationWithTemplateByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE