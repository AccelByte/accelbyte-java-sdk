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
    --body '{"allowInviteNonConnectedUser": false, "allowJoinPartyDuringMatchmaking": false, "autoKickOnDisconnect": false, "autoKickOnDisconnectDelay": 31, "cancelTicketOnDisconnect": false, "chatRateLimitBurst": 95, "chatRateLimitDuration": 21, "concurrentUsersLimit": 69, "disableInvitationOnJoinParty": false, "enableChat": true, "entitlementCheck": false, "entitlementItemID": "poMF78NY", "generalRateLimitBurst": 16, "generalRateLimitDuration": 70, "keepPresenceActivityOnDisconnect": false, "maxDSWaitTime": 42, "maxPartyMember": 69, "profanityFilter": false, "readyConsentTimeout": 37, "unregisterDelay": 40}' \
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
    --userId 'cnz1JSDg' \
    --limit '100' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 21 'GetListOfFriends' test.out

#- 22 SendMultipleUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendMultipleUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "olvbTgrh", "topicName": "RTcPiSuL", "userIds": ["0Sly6XM4", "OI18mAQL", "nzjMf8GZ"]}' \
    > test.out 2>&1
eval_tap $? 22 'SendMultipleUsersFreeformNotificationV1Admin' test.out

#- 23 SendUsersFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "2WBZqxYG", "topicName": "3aREAu2D"}' \
    > test.out 2>&1
eval_tap $? 23 'SendUsersFreeformNotificationV1Admin' test.out

#- 24 SendPartyFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId '6QVKNCWP' \
    --body '{"message": "75TB0i7p", "topicName": "KxR8dl0z"}' \
    > test.out 2>&1
eval_tap $? 24 'SendPartyFreeformNotificationV1Admin' test.out

#- 25 SendPartyTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendPartyTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'RVW4EZG9' \
    --body '{"templateContext": {"m0XcgGVb": "MqSszE8G", "Havj7Aor": "KsxwkosA", "VerXpc1C": "8XfwHuKe"}, "templateLanguage": "b9l3rGN9", "templateSlug": "A3sNm84h", "topicName": "ddSpHt0P"}' \
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
    --body '{"templateContent": "7MIIR7Ck", "templateLanguage": "yF6C7duu", "templateSlug": "yZ0GhDog"}' \
    > test.out 2>&1
eval_tap $? 27 'CreateNotificationTemplateV1Admin' test.out

#- 28 SendUsersTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendUsersTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"qrhBRd8l": "DR6qVNPR", "ZYdFLIAj": "GGJddVCv", "u9vx5KQ7": "KYnIuMBv"}, "templateLanguage": "aO35llzQ", "templateSlug": "RaT5kPxU", "topicName": "fofvnnSu"}' \
    > test.out 2>&1
eval_tap $? 28 'SendUsersTemplatedNotificationV1Admin' test.out

#- 29 GetTemplateSlugLocalizationsTemplateV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getTemplateSlugLocalizationsTemplateV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'B0y5WUlr' \
    --after 'MdI4sNve' \
    --before 'abntBSxT' \
    --limit '9' \
    > test.out 2>&1
eval_tap $? 29 'GetTemplateSlugLocalizationsTemplateV1Admin' test.out

#- 30 DeleteNotificationTemplateSlugV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTemplateSlugV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'kgghGoYu' \
    > test.out 2>&1
eval_tap $? 30 'DeleteNotificationTemplateSlugV1Admin' test.out

#- 31 GetSingleTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getSingleTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'pD391C2q' \
    --templateSlug 'tPYokahF' \
    > test.out 2>&1
eval_tap $? 31 'GetSingleTemplateLocalizationV1Admin' test.out

#- 32 UpdateTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'jkQsfCaT' \
    --templateSlug 'mt1d67FX' \
    --body '{"templateContent": "Gk2s9Q0m"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdateTemplateLocalizationV1Admin' test.out

#- 33 DeleteTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'PVo3twu0' \
    --templateSlug 'MesTCf9x' \
    > test.out 2>&1
eval_tap $? 33 'DeleteTemplateLocalizationV1Admin' test.out

#- 34 PublishTemplateLocalizationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby publishTemplateLocalizationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '4rt69lna' \
    --templateSlug '7qxNeIxP' \
    > test.out 2>&1
eval_tap $? 34 'PublishTemplateLocalizationV1Admin' test.out

#- 35 GetAllNotificationTopicsV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getAllNotificationTopicsV1Admin \
    --namespace "$AB_NAMESPACE" \
    --after 'z6MbwL6I' \
    --before 'Y69z1UaL' \
    --limit '34' \
    > test.out 2>&1
eval_tap $? 35 'GetAllNotificationTopicsV1Admin' test.out

#- 36 CreateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby createNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "lpJSqGAX", "topicName": "Q0yYoNRK"}' \
    > test.out 2>&1
eval_tap $? 36 'CreateNotificationTopicV1Admin' test.out

#- 37 GetNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby getNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'd3IL5TAQ' \
    > test.out 2>&1
eval_tap $? 37 'GetNotificationTopicV1Admin' test.out

#- 38 UpdateNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby updateNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName '6iiPlSC2' \
    --body '{"description": "uE4o5Vwd"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateNotificationTopicV1Admin' test.out

#- 39 DeleteNotificationTopicV1Admin
./ng net.accelbyte.sdk.cli.Main lobby deleteNotificationTopicV1Admin \
    --namespace "$AB_NAMESPACE" \
    --topicName 'o3fePqIJ' \
    > test.out 2>&1
eval_tap $? 39 'DeleteNotificationTopicV1Admin' test.out

#- 40 SendSpecificUserFreeformNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserFreeformNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'A8IHtrkm' \
    --body '{"message": "u0hpDDWV", "topicName": "Ala2l5BY"}' \
    > test.out 2>&1
eval_tap $? 40 'SendSpecificUserFreeformNotificationV1Admin' test.out

#- 41 SendSpecificUserTemplatedNotificationV1Admin
./ng net.accelbyte.sdk.cli.Main lobby sendSpecificUserTemplatedNotificationV1Admin \
    --namespace "$AB_NAMESPACE" \
    --userId 'NtIuS5S5' \
    --body '{"templateContext": {"XUdjsoqw": "GyzzWi9g", "wQYv7t1o": "7TTr1Dmr", "hZv15T7q": "uIOvBMca"}, "templateLanguage": "YmvCkGZ5", "templateSlug": "dAgqxpBF", "topicName": "maLoxozr"}' \
    > test.out 2>&1
eval_tap $? 41 'SendSpecificUserTemplatedNotificationV1Admin' test.out

#- 42 AdminGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId '6wfNPX2b' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetPartyDataV1' test.out

#- 43 AdminUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby adminUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'OItRMvqt' \
    --body '{"custom_attribute": {"lB2jJCSQ": {}, "T279ZZPY": {}, "Gu0rdlgd": {}}, "updatedAt": 99}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdatePartyAttributesV1' test.out

#- 44 AdminJoinPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminJoinPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'BaAkLnvx' \
    --userId 'kT1X68cm' \
    > test.out 2>&1
eval_tap $? 44 'AdminJoinPartyV1' test.out

#- 45 AdminGetUserPartyV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetUserPartyV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dc3fxU8M' \
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
    --userId 'yKrQpM4h' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetAllPlayerSessionAttribute' test.out

#- 48 AdminSetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminSetPlayerSessionAttribute \
    --namespace "$AB_NAMESPACE" \
    --userId 'kkK6KKXN' \
    --body '{"attributes": {"B3Gv0Iqm": "F51TkhjY", "naq6foWv": "Xa3bMrXs", "Dr6kILsS": "SyDdmykm"}}' \
    > test.out 2>&1
eval_tap $? 48 'AdminSetPlayerSessionAttribute' test.out

#- 49 AdminGetPlayerSessionAttribute
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerSessionAttribute \
    --attribute 'oPYgc2L4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jk4Lo0LS' \
    > test.out 2>&1
eval_tap $? 49 'AdminGetPlayerSessionAttribute' test.out

#- 50 AdminGetPlayerBlockedPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'P0pf4Ixj' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetPlayerBlockedPlayersV1' test.out

#- 51 AdminGetPlayerBlockedByPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetPlayerBlockedByPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ukl535X3' \
    > test.out 2>&1
eval_tap $? 51 'AdminGetPlayerBlockedByPlayersV1' test.out

#- 52 AdminBulkBlockPlayersV1
./ng net.accelbyte.sdk.cli.Main lobby adminBulkBlockPlayersV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ateEKDpA' \
    --body '{"listBlockedUserId": ["Dz1x3poD", "3Qgb3boL", "QQ1MzH7Q"]}' \
    > test.out 2>&1
eval_tap $? 52 'AdminBulkBlockPlayersV1' test.out

#- 53 AdminDebugProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminDebugProfanityFilters \
    --namespace "$AB_NAMESPACE" \
    --body '{"text": "m8bwbmXg"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminDebugProfanityFilters' test.out

#- 54 AdminGetProfanityListFiltersV1
./ng net.accelbyte.sdk.cli.Main lobby adminGetProfanityListFiltersV1 \
    --list 'dAPh1ETh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'AdminGetProfanityListFiltersV1' test.out

#- 55 AdminAddProfanityFilterIntoList
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilterIntoList \
    --list 'G96gAFKK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "2WDgCcxv", "note": "ONZm3EeE"}' \
    > test.out 2>&1
eval_tap $? 55 'AdminAddProfanityFilterIntoList' test.out

#- 56 AdminAddProfanityFilters
./ng net.accelbyte.sdk.cli.Main lobby adminAddProfanityFilters \
    --list 'RmDnyeFo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filters": [{"filter": "F7VSZ6pf", "note": "3vneSD2T"}, {"filter": "b3g7mSQU", "note": "hAEtrmjq"}, {"filter": "U6YE3p4l", "note": "Sck0ZHn5"}]}' \
    > test.out 2>&1
eval_tap $? 56 'AdminAddProfanityFilters' test.out

#- 57 AdminImportProfanityFiltersFromFile
./ng net.accelbyte.sdk.cli.Main lobby adminImportProfanityFiltersFromFile \
    --list 'GI39YBHq' \
    --namespace "$AB_NAMESPACE" \
    --body '[1, 66, 94]' \
    > test.out 2>&1
eval_tap $? 57 'AdminImportProfanityFiltersFromFile' test.out

#- 58 AdminDeleteProfanityFilter
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityFilter \
    --list 'XlvPG6bF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"filter": "YReVHQip"}' \
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
    --body '{"isEnabled": false, "isMandatory": true, "name": "Cx9Zw5D2"}' \
    > test.out 2>&1
eval_tap $? 60 'AdminCreateProfanityList' test.out

#- 61 AdminUpdateProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminUpdateProfanityList \
    --list 'L7vIYhGG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"isEnabled": false, "isMandatory": true, "newName": "HQvsHXNU"}' \
    > test.out 2>&1
eval_tap $? 61 'AdminUpdateProfanityList' test.out

#- 62 AdminDeleteProfanityList
./ng net.accelbyte.sdk.cli.Main lobby adminDeleteProfanityList \
    --list 'Ne4mhgo5' \
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
    --body '{"rule": "QB65lSAi"}' \
    > test.out 2>&1
eval_tap $? 64 'AdminSetProfanityRuleForNamespace' test.out

#- 65 AdminVerifyMessageProfanityResponse
./ng net.accelbyte.sdk.cli.Main lobby adminVerifyMessageProfanityResponse \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "YnNjkfZr", "profanityLevel": "QvGgbLdL"}' \
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
    --body '{"apiKey": "sFzHkBMr"}' \
    > test.out 2>&1
eval_tap $? 67 'AdminUpdateThirdPartyConfig' test.out

#- 68 AdminCreateThirdPartyConfig
./ng net.accelbyte.sdk.cli.Main lobby adminCreateThirdPartyConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "1yrOMlNF"}' \
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
    --friendId 'SrUEirnj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetPersonalChatHistoryV1Public' test.out

#- 72 PublicGetPartyDataV1
./ng net.accelbyte.sdk.cli.Main lobby publicGetPartyDataV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'X9fDmIbe' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetPartyDataV1' test.out

#- 73 PublicUpdatePartyAttributesV1
./ng net.accelbyte.sdk.cli.Main lobby publicUpdatePartyAttributesV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ZxzfTcyi' \
    --body '{"custom_attribute": {"uATus9hs": {}, "fpFDcSDG": {}, "8aMVGLiB": {}}, "updatedAt": 81}' \
    > test.out 2>&1
eval_tap $? 73 'PublicUpdatePartyAttributesV1' test.out

#- 74 PublicSetPartyLimitV1
./ng net.accelbyte.sdk.cli.Main lobby publicSetPartyLimitV1 \
    --namespace "$AB_NAMESPACE" \
    --partyId 'I8ilbyDP' \
    --body '{"limit": 95}' \
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
    --userIds 'gGLXpUL4' \
    > test.out 2>&1
eval_tap $? 77 'UsersPresenceHandlerV1' test.out

#- 78 FreeFormNotification
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotification \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "pp2ncYAH", "topic": "dNzDmeIP"}' \
    > test.out 2>&1
eval_tap $? 78 'FreeFormNotification' test.out

#- 79 NotificationWithTemplate
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplate \
    --namespace "$AB_NAMESPACE" \
    --body '{"templateContext": {"6rOvDz9K": "Osb392k6", "YmJFfRBy": "jlBiuFM3", "FIoVk8T3": "GpAnkCmB"}, "templateLanguage": "Uqg2SCnq", "templateSlug": "ntX9y1aZ", "topic": "SWMiVi10"}' \
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
    --body '{"templateContent": "sG6vxkfU", "templateLanguage": "cmqRRbce", "templateSlug": "J5i0EeDx"}' \
    > test.out 2>&1
eval_tap $? 81 'CreateTemplate' test.out

#- 82 GetSlugTemplate
./ng net.accelbyte.sdk.cli.Main lobby getSlugTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'OgBnhhqE' \
    --after 'lIaDml48' \
    --before 'wdNFLTm5' \
    --limit '94' \
    > test.out 2>&1
eval_tap $? 82 'GetSlugTemplate' test.out

#- 83 DeleteTemplateSlug
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateSlug \
    --namespace "$AB_NAMESPACE" \
    --templateSlug 'at2vQR3b' \
    > test.out 2>&1
eval_tap $? 83 'DeleteTemplateSlug' test.out

#- 84 GetLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby getLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'iBfsu4jm' \
    --templateSlug 'sRE2w1yE' \
    > test.out 2>&1
eval_tap $? 84 'GetLocalizationTemplate' test.out

#- 85 UpdateLocalizationTemplate
./ng net.accelbyte.sdk.cli.Main lobby updateLocalizationTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'kLgh3tIY' \
    --templateSlug 't4SqYUTL' \
    --body '{"templateContent": "Dx9gIiDa"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateLocalizationTemplate' test.out

#- 86 DeleteTemplateLocalization
./ng net.accelbyte.sdk.cli.Main lobby deleteTemplateLocalization \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage 'ndpGT2t2' \
    --templateSlug '4aOMh5eC' \
    > test.out 2>&1
eval_tap $? 86 'DeleteTemplateLocalization' test.out

#- 87 PublishTemplate
./ng net.accelbyte.sdk.cli.Main lobby publishTemplate \
    --namespace "$AB_NAMESPACE" \
    --templateLanguage '3IHeHSKL' \
    --templateSlug 'Ca3xreND' \
    > test.out 2>&1
eval_tap $? 87 'PublishTemplate' test.out

#- 88 GetTopicByNamespace
./ng net.accelbyte.sdk.cli.Main lobby getTopicByNamespace \
    --namespace "$AB_NAMESPACE" \
    --after 'UWehwH3q' \
    --before '31A806DJ' \
    --limit '12' \
    > test.out 2>&1
eval_tap $? 88 'GetTopicByNamespace' test.out

#- 89 CreateTopic
./ng net.accelbyte.sdk.cli.Main lobby createTopic \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "nWhzfe2N", "topic": "ubeoKFeI"}' \
    > test.out 2>&1
eval_tap $? 89 'CreateTopic' test.out

#- 90 GetTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby getTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'aFQCYoDP' \
    > test.out 2>&1
eval_tap $? 90 'GetTopicByTopicName' test.out

#- 91 UpdateTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby updateTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'ICpnduEE' \
    --body '{"description": "QlULdJz4"}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateTopicByTopicName' test.out

#- 92 DeleteTopicByTopicName
./ng net.accelbyte.sdk.cli.Main lobby deleteTopicByTopicName \
    --namespace "$AB_NAMESPACE" \
    --topic 'mnRBkMNx' \
    > test.out 2>&1
eval_tap $? 92 'DeleteTopicByTopicName' test.out

#- 93 FreeFormNotificationByUserID
./ng net.accelbyte.sdk.cli.Main lobby freeFormNotificationByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'vvKgAT8m' \
    --body '{"message": "JrYq6hRk", "topic": "loqxM3gp"}' \
    > test.out 2>&1
eval_tap $? 93 'FreeFormNotificationByUserID' test.out

#- 94 NotificationWithTemplateByUserID
./ng net.accelbyte.sdk.cli.Main lobby notificationWithTemplateByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'wxcfMy9X' \
    --body '{"templateContext": {"zjjI5Ybs": "KoADkzJE", "N2VHzih3": "bit0VWn3", "CO39PXDN": "xtXgeO3F"}, "templateLanguage": "gkXhjDza", "templateSlug": "QY3snn2Z", "topic": "kP7cFdP4"}' \
    > test.out 2>&1
eval_tap $? 94 'NotificationWithTemplateByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE