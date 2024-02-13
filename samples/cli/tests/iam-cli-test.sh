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
echo "1..376"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetBansType
eval_tap 0 2 'GetBansType # SKIP deprecated' test.out

#- 3 GetListBanReason
eval_tap 0 3 'GetListBanReason # SKIP deprecated' test.out

#- 4 GetClients
eval_tap 0 4 'GetClients # SKIP deprecated' test.out

#- 5 CreateClient
eval_tap 0 5 'CreateClient # SKIP deprecated' test.out

#- 6 GetClient
eval_tap 0 6 'GetClient # SKIP deprecated' test.out

#- 7 UpdateClient
eval_tap 0 7 'UpdateClient # SKIP deprecated' test.out

#- 8 DeleteClient
eval_tap 0 8 'DeleteClient # SKIP deprecated' test.out

#- 9 UpdateClientPermission
eval_tap 0 9 'UpdateClientPermission # SKIP deprecated' test.out

#- 10 AddClientPermission
eval_tap 0 10 'AddClientPermission # SKIP deprecated' test.out

#- 11 DeleteClientPermission
eval_tap 0 11 'DeleteClientPermission # SKIP deprecated' test.out

#- 12 UpdateClientSecret
eval_tap 0 12 'UpdateClientSecret # SKIP deprecated' test.out

#- 13 GetClientsbyNamespace
eval_tap 0 13 'GetClientsbyNamespace # SKIP deprecated' test.out

#- 14 CreateClientByNamespace
eval_tap 0 14 'CreateClientByNamespace # SKIP deprecated' test.out

#- 15 DeleteClientByNamespace
eval_tap 0 15 'DeleteClientByNamespace # SKIP deprecated' test.out

#- 16 CreateUser
eval_tap 0 16 'CreateUser # SKIP deprecated' test.out

#- 17 GetAdminUsersByRoleID
eval_tap 0 17 'GetAdminUsersByRoleID # SKIP deprecated' test.out

#- 18 GetUserByLoginID
eval_tap 0 18 'GetUserByLoginID # SKIP deprecated' test.out

#- 19 GetUserByPlatformUserID
eval_tap 0 19 'GetUserByPlatformUserID # SKIP deprecated' test.out

#- 20 ForgotPassword
eval_tap 0 20 'ForgotPassword # SKIP deprecated' test.out

#- 21 GetUsersByLoginIds
eval_tap 0 21 'GetUsersByLoginIds # SKIP deprecated' test.out

#- 22 ResetPassword
eval_tap 0 22 'ResetPassword # SKIP deprecated' test.out

#- 23 SearchUser
eval_tap 0 23 'SearchUser # SKIP deprecated' test.out

#- 24 GetUserByUserID
eval_tap 0 24 'GetUserByUserID # SKIP deprecated' test.out

#- 25 UpdateUser
eval_tap 0 25 'UpdateUser # SKIP deprecated' test.out

#- 26 DeleteUser
eval_tap 0 26 'DeleteUser # SKIP deprecated' test.out

#- 27 BanUser
eval_tap 0 27 'BanUser # SKIP deprecated' test.out

#- 28 GetUserBanHistory
eval_tap 0 28 'GetUserBanHistory # SKIP deprecated' test.out

#- 29 DisableUserBan
eval_tap 0 29 'DisableUserBan # SKIP deprecated' test.out

#- 30 EnableUserBan
eval_tap 0 30 'EnableUserBan # SKIP deprecated' test.out

#- 31 ListCrossNamespaceAccountLink
eval_tap 0 31 'ListCrossNamespaceAccountLink # SKIP deprecated' test.out

#- 32 DisableUser
eval_tap 0 32 'DisableUser # SKIP deprecated' test.out

#- 33 EnableUser
eval_tap 0 33 'EnableUser # SKIP deprecated' test.out

#- 34 GetUserInformation
eval_tap 0 34 'GetUserInformation # SKIP deprecated' test.out

#- 35 DeleteUserInformation
eval_tap 0 35 'DeleteUserInformation # SKIP deprecated' test.out

#- 36 GetUserLoginHistories
eval_tap 0 36 'GetUserLoginHistories # SKIP deprecated' test.out

#- 37 UpdatePassword
eval_tap 0 37 'UpdatePassword # SKIP deprecated' test.out

#- 38 SaveUserPermission
eval_tap 0 38 'SaveUserPermission # SKIP deprecated' test.out

#- 39 AddUserPermission
eval_tap 0 39 'AddUserPermission # SKIP deprecated' test.out

#- 40 DeleteUserPermission
eval_tap 0 40 'DeleteUserPermission # SKIP deprecated' test.out

#- 41 GetUserPlatformAccounts
eval_tap 0 41 'GetUserPlatformAccounts # SKIP deprecated' test.out

#- 42 GetUserMapping
eval_tap 0 42 'GetUserMapping # SKIP deprecated' test.out

#- 43 GetUserJusticePlatformAccount
eval_tap 0 43 'GetUserJusticePlatformAccount # SKIP deprecated' test.out

#- 44 PlatformLink
eval_tap 0 44 'PlatformLink # SKIP deprecated' test.out

#- 45 PlatformUnlink
eval_tap 0 45 'PlatformUnlink # SKIP deprecated' test.out

#- 46 GetPublisherUser
eval_tap 0 46 'GetPublisherUser # SKIP deprecated' test.out

#- 47 SaveUserRoles
eval_tap 0 47 'SaveUserRoles # SKIP deprecated' test.out

#- 48 AddUserRole
eval_tap 0 48 'AddUserRole # SKIP deprecated' test.out

#- 49 DeleteUserRole
eval_tap 0 49 'DeleteUserRole # SKIP deprecated' test.out

#- 50 UpgradeHeadlessAccount
eval_tap 0 50 'UpgradeHeadlessAccount # SKIP deprecated' test.out

#- 51 UpgradeHeadlessAccountWithVerificationCode
eval_tap 0 51 'UpgradeHeadlessAccountWithVerificationCode # SKIP deprecated' test.out

#- 52 UserVerification
eval_tap 0 52 'UserVerification # SKIP deprecated' test.out

#- 53 SendVerificationCode
eval_tap 0 53 'SendVerificationCode # SKIP deprecated' test.out

#- 54 Authorization
eval_tap 0 54 'Authorization # SKIP deprecated' test.out

#- 55 GetJWKS
eval_tap 0 55 'GetJWKS # SKIP deprecated' test.out

#- 56 PlatformTokenRequestHandler
eval_tap 0 56 'PlatformTokenRequestHandler # SKIP deprecated' test.out

#- 57 RevokeUser
eval_tap 0 57 'RevokeUser # SKIP deprecated' test.out

#- 58 GetRevocationList
eval_tap 0 58 'GetRevocationList # SKIP deprecated' test.out

#- 59 RevokeToken
eval_tap 0 59 'RevokeToken # SKIP deprecated' test.out

#- 60 RevokeAUser
eval_tap 0 60 'RevokeAUser # SKIP deprecated' test.out

#- 61 TokenGrant
eval_tap 0 61 'TokenGrant # SKIP deprecated' test.out

#- 62 VerifyToken
eval_tap 0 62 'VerifyToken # SKIP deprecated' test.out

#- 63 GetRoles
eval_tap 0 63 'GetRoles # SKIP deprecated' test.out

#- 64 CreateRole
eval_tap 0 64 'CreateRole # SKIP deprecated' test.out

#- 65 GetRole
eval_tap 0 65 'GetRole # SKIP deprecated' test.out

#- 66 UpdateRole
eval_tap 0 66 'UpdateRole # SKIP deprecated' test.out

#- 67 DeleteRole
eval_tap 0 67 'DeleteRole # SKIP deprecated' test.out

#- 68 GetRoleAdminStatus
eval_tap 0 68 'GetRoleAdminStatus # SKIP deprecated' test.out

#- 69 SetRoleAsAdmin
eval_tap 0 69 'SetRoleAsAdmin # SKIP deprecated' test.out

#- 70 RemoveRoleAdmin
eval_tap 0 70 'RemoveRoleAdmin # SKIP deprecated' test.out

#- 71 GetRoleManagers
eval_tap 0 71 'GetRoleManagers # SKIP deprecated' test.out

#- 72 AddRoleManagers
eval_tap 0 72 'AddRoleManagers # SKIP deprecated' test.out

#- 73 RemoveRoleManagers
eval_tap 0 73 'RemoveRoleManagers # SKIP deprecated' test.out

#- 74 GetRoleMembers
eval_tap 0 74 'GetRoleMembers # SKIP deprecated' test.out

#- 75 AddRoleMembers
eval_tap 0 75 'AddRoleMembers # SKIP deprecated' test.out

#- 76 RemoveRoleMembers
eval_tap 0 76 'RemoveRoleMembers # SKIP deprecated' test.out

#- 77 UpdateRolePermissions
eval_tap 0 77 'UpdateRolePermissions # SKIP deprecated' test.out

#- 78 AddRolePermission
eval_tap 0 78 'AddRolePermission # SKIP deprecated' test.out

#- 79 DeleteRolePermission
eval_tap 0 79 'DeleteRolePermission # SKIP deprecated' test.out

#- 80 AdminGetAgeRestrictionStatusV2
eval_tap 0 80 'AdminGetAgeRestrictionStatusV2 # SKIP deprecated' test.out

#- 81 AdminUpdateAgeRestrictionConfigV2
eval_tap 0 81 'AdminUpdateAgeRestrictionConfigV2 # SKIP deprecated' test.out

#- 82 GetListCountryAgeRestriction
eval_tap 0 82 'GetListCountryAgeRestriction # SKIP deprecated' test.out

#- 83 UpdateCountryAgeRestriction
eval_tap 0 83 'UpdateCountryAgeRestriction # SKIP deprecated' test.out

#- 84 AdminSearchUsersV2
eval_tap 0 84 'AdminSearchUsersV2 # SKIP deprecated' test.out

#- 85 AdminGetUserByUserIdV2
eval_tap 0 85 'AdminGetUserByUserIdV2 # SKIP deprecated' test.out

#- 86 AdminUpdateUserV2
eval_tap 0 86 'AdminUpdateUserV2 # SKIP deprecated' test.out

#- 87 AdminBanUserV2
eval_tap 0 87 'AdminBanUserV2 # SKIP deprecated' test.out

#- 88 AdminGetUserBanV2
eval_tap 0 88 'AdminGetUserBanV2 # SKIP deprecated' test.out

#- 89 AdminDisableUserV2
eval_tap 0 89 'AdminDisableUserV2 # SKIP deprecated' test.out

#- 90 AdminEnableUserV2
eval_tap 0 90 'AdminEnableUserV2 # SKIP deprecated' test.out

#- 91 AdminResetPasswordV2
eval_tap 0 91 'AdminResetPasswordV2 # SKIP deprecated' test.out

#- 92 AdminDeletePlatformLinkV2
eval_tap 0 92 'AdminDeletePlatformLinkV2 # SKIP deprecated' test.out

#- 93 AdminPutUserRolesV2
eval_tap 0 93 'AdminPutUserRolesV2 # SKIP deprecated' test.out

#- 94 AdminCreateUserRolesV2
eval_tap 0 94 'AdminCreateUserRolesV2 # SKIP deprecated' test.out

#- 95 PublicGetCountryAgeRestriction
eval_tap 0 95 'PublicGetCountryAgeRestriction # SKIP deprecated' test.out

#- 96 PublicCreateUserV2
eval_tap 0 96 'PublicCreateUserV2 # SKIP deprecated' test.out

#- 97 PublicForgotPasswordV2
eval_tap 0 97 'PublicForgotPasswordV2 # SKIP deprecated' test.out

#- 98 PublicResetPasswordV2
eval_tap 0 98 'PublicResetPasswordV2 # SKIP deprecated' test.out

#- 99 PublicGetUserByUserIDV2
eval_tap 0 99 'PublicGetUserByUserIDV2 # SKIP deprecated' test.out

#- 100 PublicUpdateUserV2
eval_tap 0 100 'PublicUpdateUserV2 # SKIP deprecated' test.out

#- 101 PublicGetUserBan
eval_tap 0 101 'PublicGetUserBan # SKIP deprecated' test.out

#- 102 PublicUpdatePasswordV2
eval_tap 0 102 'PublicUpdatePasswordV2 # SKIP deprecated' test.out

#- 103 GetListJusticePlatformAccounts
eval_tap 0 103 'GetListJusticePlatformAccounts # SKIP deprecated' test.out

#- 104 PublicPlatformLinkV2
eval_tap 0 104 'PublicPlatformLinkV2 # SKIP deprecated' test.out

#- 105 PublicDeletePlatformLinkV2
eval_tap 0 105 'PublicDeletePlatformLinkV2 # SKIP deprecated' test.out

#- 106 AdminGetBansTypeV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBansTypeV3 \
    > test.out 2>&1
eval_tap $? 106 'AdminGetBansTypeV3' test.out

#- 107 AdminGetListBanReasonV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListBanReasonV3 \
    > test.out 2>&1
eval_tap $? 107 'AdminGetListBanReasonV3' test.out

#- 108 AdminGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminGetInputValidations \
    > test.out 2>&1
eval_tap $? 108 'AdminGetInputValidations' test.out

#- 109 AdminUpdateInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminUpdateInputValidations \
    --body '[{"field": "EAxcVpFrttufHIRd", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["W0Oaiw9B0D7eHpzS", "n3ZPUdc0qh4n8mzZ", "0m8SAMTwE6I56IaR"], "preferRegex": true, "regex": "8bbgorQeFbQ1g7qb"}, "blockedWord": ["PngUNB1vRodwpzS6", "DaDpv8N7ZQVqGj6o", "DLjWjkY1aXlFcDtg"], "description": [{"language": "OjchIua5tWEIC32o", "message": ["gW7olvbTgrhRTcPi", "SuL0Sly6XM4OI18m", "AQLnzjMf8GZ2WBZq"]}, {"language": "xYG3aREAu2D6QVKN", "message": ["CWP75TB0i7pKxR8d", "l0zRVW4EZG9m0Xcg", "GVbMqSszE8GHavj7"]}, {"language": "AorKsxwkosAVerXp", "message": ["c1C8XfwHuKeb9l3r", "GN9A3sNm84hddSpH", "t0P7MIIR7CkyF6C7"]}], "isCustomRegex": false, "letterCase": "UmiTqpyhPFdxLzFQ", "maxLength": 82, "maxRepeatingAlphaNum": 23, "maxRepeatingSpecialCharacter": 59, "minCharType": 79, "minLength": 89, "regex": "YzYiKWe5dNRljv7I", "specialCharacterLocation": "PrDQQRgat0SevkLG", "specialCharacters": ["MS0lyuI9a2I9u6Vp", "bsx5w8hqUI06UpOX", "GSLmCVuHOPlLlkvR"]}}, {"field": "8sKgnuRkgghGoYup", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["oyD6SCwGrncqmLtj", "QHAf8TgoNm03VLis", "V6zwPuo3td6TC6I3"], "preferRegex": false, "regex": "9x4rt69lna7qxNeI"}, "blockedWord": ["xPz6MbwL6IY69z1U", "aLqYSYWytLPziZMd", "jxcBZufQxGiHPllG"], "description": [{"language": "4cYEzfTD1ZBm3MqH", "message": ["cUmLZZbSqb8RwNmn", "9HrNQy4uZAAiE0mi", "t9RGCCHYzUOcEdsc"]}, {"language": "KHPEqgA8yu7Vk6Jt", "message": ["4Ymos9Jcdos4fYcT", "VU6RBt0zYoMcHyCU", "EXlAvxJMdalwSyli"]}, {"language": "WMNW5NyLu0M3VHh2", "message": ["EI8JlDbPWbQ6Q9lN", "mqRBaAkLnvxkT1X6", "8cmDc3fxU8MyKrQp"]}], "isCustomRegex": false, "letterCase": "Dlym6puQ23xoJ8ae", "maxLength": 58, "maxRepeatingAlphaNum": 64, "maxRepeatingSpecialCharacter": 27, "minCharType": 1, "minLength": 78, "regex": "TkhjYnaq6foWvXa3", "specialCharacterLocation": "bMrXsDr6kILsSSyD", "specialCharacters": ["dmykmoPYgc2L4jk4", "Lo0LSP0pf4IxjUkl", "535X3ateEKDpADz1"]}}, {"field": "x3poD3Qgb3boLQQ1", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["Qm8bwbmXgdAPh1ET", "hG96gAFKK2WDgCcx", "vONZm3EeERmDnyeF"], "preferRegex": false, "regex": "mVr9XuoJbRFQSKVP"}, "blockedWord": ["Hbn4Xxtu7LQRENjE", "Eztx1WsYSiZqan0n", "SBJroav91GXlvPG6"], "description": [{"language": "bFYReVHQipcCx9Zw", "message": ["5D2L7vIYhGGSyEW4", "ZJJ42d3PBddN8S48", "l9lyNApflxqMrj3o"]}, {"language": "Zk03QXcKMDYDDxHS", "message": ["ZjtqXyJ58f7Gc26S", "aiGVkydwYWQG26yU", "ZNmTBcvrbYCwZtxF"]}, {"language": "HyPLtI8ilbyDPUIj", "message": ["88cekdqCt81P1ktf", "Iovmv9gsR5cJcHm3", "SZLxoRDFuuuySj29"]}], "isCustomRegex": false, "letterCase": "iuFM3FIoVk8T3GpA", "maxLength": 27, "maxRepeatingAlphaNum": 80, "maxRepeatingSpecialCharacter": 22, "minCharType": 47, "minLength": 59, "regex": "zHPxB1UskYs4Yw20", "specialCharacterLocation": "DOqOBSC2DKHRuPMM", "specialCharacters": ["WH8Yb33T5UBJCjfc", "nLRfxeCSz9WEi8Kl", "loeH0JT1yduat2vQ"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'R3biBfsu4jmsRE2w' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after '1yEkLgh3tIYt4SqY' \
    --before 'UTLDx9gIiDandpGT' \
    --limit '39' \
    > test.out 2>&1
eval_tap $? 111 'ListAdminsV3' test.out

#- 112 AdminGetAgeRestrictionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetAgeRestrictionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'AdminGetAgeRestrictionStatusV3' test.out

#- 113 AdminUpdateAgeRestrictionConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAgeRestrictionConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 47, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'aOMh5eC3IHeHSKLC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 1}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'CEAE7WIsfmx40NLR' \
    --limit '5' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "6m8heKnWhzfe2Nub", "comment": "eoKFeIaFQCYoDPIC", "endDate": "pnduEEQlULdJz4mn", "reason": "RBkMNxvvKgAT8mJr", "skipNotif": false, "userIds": ["q6hRkloqxM3gpwxc", "fMy9XzjjI5YbsKoA", "DkzJEN2VHzih3bit"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "0VWn3CO39PXDNxtX", "userId": "geO3FgkXhjDzaQY3"}, {"banId": "snn2ZkP7cFdP43e5", "userId": "dC9XIBudfZgrbHDI"}, {"banId": "Dm4hMzF4TxodenSr", "userId": "UTvfqU0bfoMm5cTt"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUnbanUserBulkV3' test.out

#- 119 AdminGetBansTypeWithNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBansTypeWithNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'AdminGetBansTypeWithNamespaceV3' test.out

#- 120 AdminGetClientsByNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsByNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'FWbotQyXJRcQWsmq' \
    --clientName 'PNs92epxk0i8VxsZ' \
    --clientType 'NereSvf9699mCEHT' \
    --limit '14' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["UJkETAsSp7gh4TeU", "TkOkAYfJB8AT9t4T", "v207Y2QD3oD5fLCr"], "baseUri": "3OOlXVv8ZGF7uYnG", "clientId": "zpipNDigNJma1Mbq", "clientName": "qZtfNWql4nmwAft4", "clientPermissions": [{"action": 14, "resource": "EYOkQ1jMD3cym8xI", "schedAction": 10, "schedCron": "On0jJLHC9LxhvNXT", "schedRange": ["wGBCtohLtl9Zuhyt", "m5UDrT6QXCs5SPBb", "RPZTF6oQAXVG7tns"]}, {"action": 12, "resource": "fSiM9331m7Ta1PsK", "schedAction": 4, "schedCron": "E5Vs2GcyomQoIXim", "schedRange": ["BJehyxlNsjUgxBkF", "6wFPoJeQediogEhh", "M2rIizGdKvOPdq5x"]}, {"action": 35, "resource": "KscfOcYu3dpCROYq", "schedAction": 95, "schedCron": "Qyj4bj5Ro2ogaKt2", "schedRange": ["ujQSa3Zdb65UXmy0", "Zp6iIaTIKUkmkk9Q", "M0NBMA9ORxpzwLR2"]}], "clientPlatform": "AK6eXUGPJsw1fiP8", "deletable": true, "description": "G9Pclxcft2ulIJzP", "namespace": "yrVEiOG4UcqsuGKH", "oauthAccessTokenExpiration": 15, "oauthAccessTokenExpirationTimeUnit": "fHK8CCmE2lPnsbD3", "oauthClientType": "SGEdlwuUccE536ug", "oauthRefreshTokenExpiration": 57, "oauthRefreshTokenExpirationTimeUnit": "ARtdbBe7udsMrok0", "parentNamespace": "WvGYYnx4V709xbnG", "redirectUri": "ezKsDwG2omOR2nvY", "scopes": ["I9TVqJdvzcWbfUpa", "Xp5JMl5LL4bTxBmZ", "jdrrIxsB0NRsB1fP"], "secret": "qqRRulpqpymDkQht", "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'jhdinpng5BLy8wbh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'MssAHjapIkY9Rf4w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'P57dBZNR88YbCtmK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["y8M9zVrjfGXZnqAQ", "UoY1GjlIIk0iKoTT", "S1j02o7JjTXAQN0q"], "baseUri": "dskdQV0TqI8EFnmD", "clientName": "bxIxi4YKlONk2Q5Y", "clientPermissions": [{"action": 42, "resource": "JvaizwiilatuUjjt", "schedAction": 24, "schedCron": "mNqF7Bl0LcghVHfP", "schedRange": ["EspxwhRON0bc1eMb", "EIjowLqc3ecjXJbZ", "DKKoxLE1Y3Dymtj3"]}, {"action": 13, "resource": "0rYaT5hOPjaf3H0t", "schedAction": 15, "schedCron": "ighU0VUfcYHJbBfA", "schedRange": ["KSiPW3VgsZXiR1DJ", "7HVWqMkNSawQUWDF", "JvJBWic7UkBeIXuq"]}, {"action": 61, "resource": "RVwXgAgntLMCuaXB", "schedAction": 100, "schedCron": "9Lx5RDA1l2XcrciY", "schedRange": ["NEzvSZIPkhSgORcz", "5S5BvmgBLxh4ijFn", "E3Tam69qSZ7PC6f6"]}], "clientPlatform": "QkmZXElW9YfRSse6", "deletable": true, "description": "DMUAeeZ97SBROPYu", "namespace": "G6XqP6oo7G73zdxT", "oauthAccessTokenExpiration": 13, "oauthAccessTokenExpirationTimeUnit": "ip68J1nsv4W2OJht", "oauthRefreshTokenExpiration": 0, "oauthRefreshTokenExpirationTimeUnit": "41IslKHzGlLKWUtD", "redirectUri": "Qs61OQAoxyyQpRWC", "scopes": ["iiPDGQhNPEwiJCf2", "XJVrlzqQls1ozhLV", "A3kE8jKvgatOEBM7"], "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'TdlNBJYOmpu1VCar' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 52, "resource": "Up6Sw1I98jeZQ7hf"}, {"action": 49, "resource": "ug6CWVG8SWP3glU6"}, {"action": 24, "resource": "hLOqQGhCUr6iTrjy"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'EgarAdNJOIG36I6t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 89, "resource": "dwV9DBqFKHQkETJy"}, {"action": 92, "resource": "VSC00PYeDcagginx"}, {"action": 27, "resource": "H9Z5qXn3aoRtlqOE"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '59' \
    --clientId '26IUJNvYuGRUvpZa' \
    --namespace "$AB_NAMESPACE" \
    --resource 'HCuESOiIZsMfB4ZH' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteClientPermissionV3' test.out

#- 128 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey '3mtgWgU4pCAKxeE7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminGetConfigValueV3' test.out

#- 129 AdminGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    --filterBlacklist  \
    > test.out 2>&1
eval_tap $? 129 'AdminGetCountryListV3' test.out

#- 130 AdminGetCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 130 'AdminGetCountryBlacklistV3' test.out

#- 131 AdminAddCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminAddCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"blacklist": ["0CaunQNxot371W9G", "4AvQkqsGnmyo5JJT", "UVmb8GEXFTlEMEsF"]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddCountryBlacklistV3' test.out

#- 132 RetrieveAllThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 132 'RetrieveAllThirdPartyLoginPlatformCredentialV3' test.out

#- 133 RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 133 'RetrieveAllActiveThirdPartyLoginPlatformCredentialV3' test.out

#- 134 RetrieveAllSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 134 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 135 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YqwgK1Np5nodqpLm' \
    > test.out 2>&1
eval_tap $? 135 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 136 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '7FhJBNXzAFdO0Khq' \
    --body '{"ACSURL": "f6kiTdSGv2LFjAKY", "AWSCognitoRegion": "7CbgsWqFWZX7kPBo", "AWSCognitoUserPool": "m8F9GLLTG8phc3n4", "AllowedClients": ["iLoIllKlpO2pqiXJ", "F3WGRaoQomSJC4Dd", "rKF7SUQPLG59e0k5"], "AppId": "ZtX6wK7PpUlcIW32", "AuthorizationEndpoint": "iK7MGt1ixY5rA1Wo", "ClientId": "VeJIePF8ZrQzP4zv", "Environment": "tdxdbZUpd6FJtHJ1", "FederationMetadataURL": "pyVwyKQLY6FEO65R", "GenericOauthFlow": false, "IsActive": false, "Issuer": "z7CYLM8IlsHqffnr", "JWKSEndpoint": "fsGlfPaZKBwa3Ddb", "KeyID": "60ufPpzwj1QGIFml", "NetflixCertificates": {"encryptedPrivateKey": "Vf4jvapseE9LN9bv", "encryptedPrivateKeyName": "hOrHflIOd6X3viLv", "publicCertificate": "tEk4mTIpUA9gxo8S", "publicCertificateName": "V38nEhoXmM2W7l6j", "rootCertificate": "HMA2rG3nakopAywe", "rootCertificateName": "lu01nryEJ0NqoTow"}, "OrganizationId": "0qiOiC4j0iktm0ZP", "PlatformName": "LkLOsp0LZ5njN86H", "RedirectUri": "l8kUXzt6bSc6bWvg", "RegisteredDomains": [{"affectedClientIDs": ["pVyW9dD1kOmvrAej", "cq2LgkQuaS7RBx3v", "im02jBOxrZDyvpcL"], "domain": "YOWA8NjxOnaEok4n", "namespaces": ["OOCzfsflhjbngJOU", "n18G5MlfDTk8aG40", "NlncceIZSwgAIkgz"], "roleId": "h4pTU0Am4DZhl0bQ"}, {"affectedClientIDs": ["xFJ3sWCqQpQ2FbKP", "FMycMSQ4qfAacR0L", "gB5BUXvjcu2s6w3V"], "domain": "ifnKqmTSoGH1XEfY", "namespaces": ["6QAYn6WQ5UBEU1QA", "OHfZiGhxOdcuDXSx", "Sc3aZPV87pna08gx"], "roleId": "efTYKhuxaEc7M4P7"}, {"affectedClientIDs": ["UckSC6ePeN8i4GrF", "ES9z7xueHpATHcce", "e9GXhKcjmSEwdrkE"], "domain": "nnqKzFsLfYalUlfw", "namespaces": ["EQKjU7eHGebSVu0L", "Q40kepEaC4dfiOMZ", "fEhHr39pysFO3Zvc"], "roleId": "1BZG99LyvfvHEsJK"}], "Secret": "QQewVLMUoAnaRcYp", "TeamID": "7FUjfIGaffoflEIB", "TokenAuthenticationType": "yYqeKN0meGelYF5w", "TokenClaimsMapping": {"WaDhukU4khGG4vZF": "TYnPkmSu4PWam1jx", "R7SETWjteoc8fgvZ": "DDhoO05oKqymxLD1", "Lcvw6T6mZEiwxxEl": "pMYSWIeVzm7z9noo"}, "TokenEndpoint": "wmlTIKVowi0RY2VN", "UserInfoEndpoint": "4ZONJREdUQ3z9F1B", "UserInfoHTTPMethod": "xNNgnke4akncw7wu", "scopes": ["9TmXfJWBPrx9Ns8e", "LzYEvwSWTaLQjctv", "rK2jhsYpKPlXn77A"]}' \
    > test.out 2>&1
eval_tap $? 136 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 137 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tYoFzLAATPY8P8P3' \
    > test.out 2>&1
eval_tap $? 137 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 138 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'cfoivvQxevecWw7R' \
    --body '{"ACSURL": "ry0KK5rgAGO0dW8r", "AWSCognitoRegion": "X2MVUGKSZ4GcLkt4", "AWSCognitoUserPool": "pK32sJxlZcCTpTdR", "AllowedClients": ["tCHvuk6B6XTmSLyn", "50sigBVZxiKdV57G", "vRyd9UuL02Le8HSC"], "AppId": "slsDd4M1F5qRIblS", "AuthorizationEndpoint": "7Nz81GRazPAANjfB", "ClientId": "oldFOyqA2clJ5gEO", "Environment": "aCgM6Yn6RugbNEIp", "FederationMetadataURL": "GBFUjOn5mM7k8nbL", "GenericOauthFlow": true, "IsActive": true, "Issuer": "vtCIW5ynMKquUicA", "JWKSEndpoint": "eIVXtoWAXhMlW4tL", "KeyID": "qX7OICf5oD1e6oI9", "NetflixCertificates": {"encryptedPrivateKey": "FmYel0kOw72o8Zkg", "encryptedPrivateKeyName": "k0jS6rDWUwfhKvrf", "publicCertificate": "2AaH4yCWrHSppnIZ", "publicCertificateName": "kNnTn3rzH5NvAtcv", "rootCertificate": "NedgS1fUfKmihDbm", "rootCertificateName": "u8ePWlQMVDXEHeiG"}, "OrganizationId": "TnwyEw6hIWDZrpP7", "PlatformName": "rz3ISW510kHr4isT", "RedirectUri": "KWjmv67nuHCXWfwn", "RegisteredDomains": [{"affectedClientIDs": ["wGioVwVzmmBVVFfp", "qx1AeLtzcPJ3jtDY", "Bo4FUTH7CGfKSyxg"], "domain": "RR1DiCqSMzpqIFGL", "namespaces": ["kDs7ACC1RgBfoNrH", "lFi2qJLgmBLE35Yh", "yiDV90SeI5yppBHo"], "roleId": "ytVznCgNyx9fbT63"}, {"affectedClientIDs": ["ShEh8PbGikLjgjcj", "34uulU6FYBZsWFbr", "3RSP0W9nBhvhf8Q0"], "domain": "DtJMcYQdN66bswAg", "namespaces": ["t65X4N1LQZmB61JM", "dtwCVUrYQue84dwm", "bwFEnAZaWsQJtRYo"], "roleId": "agRJK5PX9UcOvhPy"}, {"affectedClientIDs": ["E11TRT2SKseoe8VL", "ie0LBa36KNzjf005", "CXNGehQ2aTjTDfKF"], "domain": "DXC7eGL5YhJDWh9Y", "namespaces": ["Wqc0qgV6d9yOfIML", "ds2DbPcaoMdtRLTm", "SvTkQQgB7exYvmHM"], "roleId": "xr5hPCJJztJBg0tT"}], "Secret": "Jg46IewOXE2AkCh3", "TeamID": "QIZsUf8lGFXcmwTE", "TokenAuthenticationType": "RHclOdxIwqejxe18", "TokenClaimsMapping": {"rNdb8Otq6j1mqUav": "7k05HAQltnSojV4j", "T65yclX2FtAz0vJj": "FIYWOaNdsimmkW2m", "iH3xRHAKy4QxZkaX": "Z7vmiEd0JPxVyQps"}, "TokenEndpoint": "haDwNqTbbFMXAMfV", "UserInfoEndpoint": "Xe0GZeMgsRsmH1EQ", "UserInfoHTTPMethod": "rYmkPKTPOlhTtSiZ", "scopes": ["NCxuogFteTHJe4Bh", "SSQkQD6WmOt6D7uf", "FVTOhvQpfbBke8aE"]}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 139 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dd36xj6wySoltDxs' \
    --body '{"affectedClientIDs": ["bzxrlaKEfkoYjY2o", "6ouRW9UtNquwC3Wg", "umrIz4NhGztZpr4U"], "assignedNamespaces": ["4fwQIiLXgmRasvjO", "4lj8m3XEwP2b4gd3", "xOeii8Jnmssep2xD"], "domain": "2NY0kABeGs9yxahl", "roleId": "d1pO0Gyf5PO3COyM"}' \
    > test.out 2>&1
eval_tap $? 139 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 140 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vczgEpzZ3Fbtxfhc' \
    --body '{"domain": "RC7IVYa6iZ5uFRYN"}' \
    > test.out 2>&1
eval_tap $? 140 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 141 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'n3SHiWxF0YbuU5ar' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveSSOLoginPlatformCredential' test.out

#- 142 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '5qTLWUCy0Afgc050' \
    --body '{"acsUrl": "XIZRW491e94mQjVO", "apiKey": "OBnIWhunElqZUodp", "appId": "3IhtCSHy1ei1fIrP", "federationMetadataUrl": "vfHnRN06EjRwEQlN", "isActive": false, "redirectUri": "5cyNe27HLtwtVOax", "secret": "gP6Jbct8puMybYGx", "ssoUrl": "D9IPmmsLmu3kaPj0"}' \
    > test.out 2>&1
eval_tap $? 142 'AddSSOLoginPlatformCredential' test.out

#- 143 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'O4zd8Tb7cUNGPTBx' \
    > test.out 2>&1
eval_tap $? 143 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 144 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'iFFCrn7djjs69FTF' \
    --body '{"acsUrl": "VGUVhvKhJCmeisql", "apiKey": "14mUHVbMPimNhcZs", "appId": "U3VAdMDcb4qlkiFA", "federationMetadataUrl": "amqvZI2KwjqPBiWX", "isActive": false, "redirectUri": "cLVVYamQc4wcG5nD", "secret": "BLJoJHbiQ5duE5p4", "ssoUrl": "cfs2E41cK8QTwiIA"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateSSOPlatformCredential' test.out

#- 145 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vxSvNDlmM5nQFMGz' \
    --rawPID  \
    --body '{"platformUserIds": ["s7fzjgyc44mEh9tR", "k8knYSV30lnroQeh", "MDli6t9unQLYXxm0"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 146 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9wpGAbpEmDY9vLh3' \
    --platformUserId 'u6EDsUmrV6kH4Oot' \
    > test.out 2>&1
eval_tap $? 146 'AdminGetUserByPlatformUserIDV3' test.out

#- 147 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'KwG3UC6XCnnZxF8C' \
    --after '26' \
    --before '87' \
    --limit '1' \
    > test.out 2>&1
eval_tap $? 147 'GetAdminUsersByRoleIdV3' test.out

#- 148 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'r17W65br34rBBN9t' \
    > test.out 2>&1
eval_tap $? 148 'AdminGetUserByEmailAddressV3' test.out

#- 149 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'U6TDm5GloFSKWM1e' \
    --body '{"bulkUserId": ["ym5ydC6p25xCWTqU", "OYZENJ1QHZQxPRXH", "7uxBJEECQE1li3Bg"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetBulkUserBanV3' test.out

#- 150 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["7Jxc9pUnZmvhidwC", "kZwqjYLfTiCO1NDB", "vQvRPnAz4VzW0Cpo"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminListUserIDByUserIDsV3' test.out

#- 151 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["BCbyJsF5IjF1c0W3", "38HS6CBgVRyihYNZ", "84CVhziXV8HwSmvc"]}' \
    > test.out 2>&1
eval_tap $? 151 'AdminBulkGetUsersPlatform' test.out

#- 152 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["vcDKF19yVRafCjOu", "SYht83AdvBaagTiR", "J8daGTVX3Bb7jlz5"], "isAdmin": false, "namespace": "fHgKjI9mwJSrN8jk", "roles": ["IykR2zbaI6PD7fEs", "cShnGUGUtV9GJ279", "GDbLNwjm3FK0nnX2"]}' \
    > test.out 2>&1
eval_tap $? 152 'AdminInviteUserV3' test.out

#- 153 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '58' \
    --platformUserId 'oMfZ1hDHtbh4HtMl' \
    --platformId 'Fgvh2Dp2SoiIPp1y' \
    > test.out 2>&1
eval_tap $? 153 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 154 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 154 'AdminListUsersV3' test.out

#- 155 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'fAHS0VgLu11A3HTo' \
    --endDate 'vFi4tPAGfleyCA6j' \
    --includeTotal  \
    --limit '63' \
    --offset '9' \
    --platformBy 'tcqsnzoVILjkwW61' \
    --platformId 'duF87aUyrdt4XSpW' \
    --query 'BAetsanzqP8oxfrt' \
    --startDate 'bECD1CYPwaiBAxfY' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 155 'AdminSearchUserV3' test.out

#- 156 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["L8Avt70ZUT2fSk3L", "L0calqxEewuGS469", "k2hG0WKt4sUmanYx"]}' \
    > test.out 2>&1
eval_tap $? 156 'AdminGetBulkUserByEmailAddressV3' test.out

#- 157 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M0UHZVNYzGMNIpWo' \
    > test.out 2>&1
eval_tap $? 157 'AdminGetUserByUserIdV3' test.out

#- 158 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SLkUrfuf4U3WeYeA' \
    --body '{"avatarUrl": "9t2ENKKWrFtHIi1C", "country": "MgKAOG5iDcCR5PbC", "dateOfBirth": "vDLil8wj9cKM3Ar6", "displayName": "MF35hCER4nGmWGgT", "languageTag": "JfHlJl4tHGa4XfZc", "uniqueDisplayName": "d9CVnGqMX9FieeEs", "userName": "sWEUl07bhwntCVqi"}' \
    > test.out 2>&1
eval_tap $? 158 'AdminUpdateUserV3' test.out

#- 159 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YOJf5KwMZQjzvjSo' \
    --activeOnly  \
    --after 'zv6CTRDl0zp9CzHF' \
    --before 'winkBNi4gvqgl6TZ' \
    --limit '8' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetUserBanV3' test.out

#- 160 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TGVPmv34h6T7Esuf' \
    --body '{"ban": "mfxKYB4LM6H6QXmp", "comment": "Z9X3fUSR1l9xLPBs", "endDate": "mAUrD9L1IiD6MlcE", "reason": "PhMDFzjHZ3sIhzOx", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminBanUserV3' test.out

#- 161 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId '6AgMep90AyyUJyAK' \
    --namespace "$AB_NAMESPACE" \
    --userId '5PRMRMwdvl0hv6g6' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 161 'AdminUpdateUserBanV3' test.out

#- 162 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xBW2tQF5tkTjgJaM' \
    --body '{"context": "YvNQOsDa4bkcgepq", "emailAddress": "txjbrztee7QLTGAa", "languageTag": "k7Kaol01DK97D2xn"}' \
    > test.out 2>&1
eval_tap $? 162 'AdminSendVerificationCodeV3' test.out

#- 163 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ik42miteR5eQAe1r' \
    --body '{"Code": "zmmgqBPRmd6mO4oI", "ContactType": "8KDqebm83raNBJ5y", "LanguageTag": "7axEkvI4oxZEDxGi", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 163 'AdminVerifyAccountV3' test.out

#- 164 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'bgg8rdwY9bmrvHmO' \
    > test.out 2>&1
eval_tap $? 164 'GetUserVerificationCode' test.out

#- 165 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '07KNqX9LM2IwEsdO' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetUserDeletionStatusV3' test.out

#- 166 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GBXBwnzDX8v3xgC1' \
    --body '{"deletionDate": 66, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 166 'AdminUpdateUserDeletionStatusV3' test.out

#- 167 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QdXfFBii2RAMEX5R' \
    --body '{"code": "MjBFVZGYzQqV8d9m", "country": "DdUIoiIJFNxuNOmU", "dateOfBirth": "SWw18T1IxVWCxdvP", "displayName": "L9e4P01vxP8xj1Ly", "emailAddress": "EirURERnEMzpImW6", "password": "sjAHyCK5tNanGBrk", "uniqueDisplayName": "zUvck3xTtmOFMebS", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 167 'AdminUpgradeHeadlessAccountV3' test.out

#- 168 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2lzxl0yF5m77TTh4' \
    > test.out 2>&1
eval_tap $? 168 'AdminDeleteUserInformationV3' test.out

#- 169 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gUoj8u2WRcLiEtzV' \
    --after '0.17862803629520052' \
    --before '0.22288087225739472' \
    --limit '21' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetUserLoginHistoriesV3' test.out

#- 170 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NXnGanMazb8jvRWe' \
    --body '{"languageTag": "nURH48aJuALEcSqc", "newPassword": "E15u6D31DjOsrs3C", "oldPassword": "UYATdqnQGbqiqOkN"}' \
    > test.out 2>&1
eval_tap $? 170 'AdminResetPasswordV3' test.out

#- 171 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eATj7eGjodd7CcJU' \
    --body '{"Permissions": [{"Action": 35, "Resource": "KiaoV0VOem2yqPsM", "SchedAction": 64, "SchedCron": "Fe9FmN86sK5LOq4f", "SchedRange": ["t5jGcMICPUYnfG6j", "l9U4jReteIMgzISo", "mCsodJrhQW41q2Os"]}, {"Action": 31, "Resource": "yXmgCNiXH8uenbC5", "SchedAction": 59, "SchedCron": "koyHjCH5olYLETRp", "SchedRange": ["ABAmO2EGvJ4UMS93", "yOxNInDByhnoluO6", "ti0QP2ssiJ66OzOj"]}, {"Action": 51, "Resource": "4O6tgohjtC7bzjPp", "SchedAction": 42, "SchedCron": "fVQh3jLBtn9pxpE7", "SchedRange": ["BYtzB0B4CxyQrUpI", "FvORxTi79DpSjb39", "ukcR6c2E2r3vk3If"]}]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminUpdateUserPermissionV3' test.out

#- 172 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AKEbqcNXSGCCvNow' \
    --body '{"Permissions": [{"Action": 82, "Resource": "OW0nXOErQPS4VsRo", "SchedAction": 71, "SchedCron": "mulP4tQ6R1OqKVOT", "SchedRange": ["niBgLsNhdgQ0JWZj", "NRSzOTqcVNX3ahvx", "w9gwwhTnjN6wKZGW"]}, {"Action": 57, "Resource": "y3f0R9s2kndhhZhw", "SchedAction": 55, "SchedCron": "mfIZsWhkS476dGGJ", "SchedRange": ["wJ00UH197MJ6zU7J", "LMQyMWzYQCAaPJgo", "xGJoJaSzUtY4ZD0X"]}, {"Action": 39, "Resource": "aUq3stUh5J5Z9GiB", "SchedAction": 17, "SchedCron": "VIs7NRen2Y3Ns0QJ", "SchedRange": ["QeaWytPfds1BYx0E", "aURydf8ZyyZeHAWG", "gJUbUJRMbkcTglbU"]}]}' \
    > test.out 2>&1
eval_tap $? 172 'AdminAddUserPermissionsV3' test.out

#- 173 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '86FyOjApNHBVfNOU' \
    --body '[{"Action": 90, "Resource": "IKzLyH1y72L13Orn"}, {"Action": 51, "Resource": "BWgJTNFfM8M0IW4o"}, {"Action": 9, "Resource": "w6gYPvfn2Qt9iyq3"}]' \
    > test.out 2>&1
eval_tap $? 173 'AdminDeleteUserPermissionBulkV3' test.out

#- 174 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '82' \
    --namespace "$AB_NAMESPACE" \
    --resource 's8TIP1LKiFQoLDvu' \
    --userId 'mfqrgSfnx2h61X9d' \
    > test.out 2>&1
eval_tap $? 174 'AdminDeleteUserPermissionV3' test.out

#- 175 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'N1MGRXBJ6mVV7JS9' \
    --after 'qjNLwvI8JdiY3RRi' \
    --before 'LilmOGF6dLLIeIVI' \
    --limit '18' \
    --platformId 'GlyZVQ4X67tPZSTp' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetUserPlatformAccountsV3' test.out

#- 176 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pq3xjrElvvDgw0ag' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetListJusticePlatformAccounts' test.out

#- 177 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '7kSWE0Hiqm5IuLry' \
    --userId 'iEXqvUWDjU1G0EVj' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetUserMapping' test.out

#- 178 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'VZw1ToLuPakQN1Mp' \
    --userId 'Os1RVFrcg2CXxepx' \
    > test.out 2>&1
eval_tap $? 178 'AdminCreateJusticeUser' test.out

#- 179 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '78fvsyhE2BKtyTDS' \
    --skipConflict  \
    --body '{"platformId": "IM7mkmvZ7Cmsh4US", "platformUserId": "8o4jfMANPpmZDdMi"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminLinkPlatformAccount' test.out

#- 180 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CxmuCCVuFjS1GC1d' \
    --userId '2b92B4vEgj3HOmhc' \
    --body '{"platformNamespace": "Wm428XejRF94NIY9"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminPlatformUnlinkV3' test.out

#- 181 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nMrBZo0lNUBDShHD' \
    --userId '32vvL28FPwTiXfLc' \
    --ticket 'xDC9Ynd02mECIQhf' \
    > test.out 2>&1
eval_tap $? 181 'AdminPlatformLinkV3' test.out

#- 182 AdminDeleteUserLinkingHistoryByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingHistoryByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'IhHtADUQ9zimQTQT' \
    --userId '95pFJUAJsyAfeKOu' \
    > test.out 2>&1
eval_tap $? 182 'AdminDeleteUserLinkingHistoryByPlatformIDV3' test.out

#- 183 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fV4f15NohXu6opxQ' \
    --userId 'GRt6PqlkL0diRhLC' \
    --platformToken '10ih2EQfY3XCv4hd' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 184 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Oa6FdZhNMd1onFjG' \
    --userId 'RbxtABPXDmgNEJBh' \
    > test.out 2>&1
eval_tap $? 184 'AdminGetUserSinglePlatformAccount' test.out

#- 185 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gGq5GIDhNC66szbC' \
    --body '["Cf73IFbRkPSSITz4", "TjCrJHXGXku2YVuO", "zhxHmnrrV9ZGWrZ0"]' \
    > test.out 2>&1
eval_tap $? 185 'AdminDeleteUserRolesV3' test.out

#- 186 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5sxe6A6RpmKDebNk' \
    --body '[{"namespace": "ylbynkgT9vayLLii", "roleId": "zac7Ge6zKJdlt7rj"}, {"namespace": "F5RaJwvkWVco2LTo", "roleId": "5ijlvDF8qBWCQ9dL"}, {"namespace": "WYyS8zdhMeBXH8x6", "roleId": "HdVfZVDAiU6iJOF7"}]' \
    > test.out 2>&1
eval_tap $? 186 'AdminSaveUserRoleV3' test.out

#- 187 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'JKZFNk2NKy59X8iO' \
    --userId 'g2sVBiCoeC5weXJl' \
    > test.out 2>&1
eval_tap $? 187 'AdminAddUserRoleV3' test.out

#- 188 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '7PeiMH8z8dVej8N2' \
    --userId 'yv6VTnOK7xAvM7tu' \
    > test.out 2>&1
eval_tap $? 188 'AdminDeleteUserRoleV3' test.out

#- 189 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'L81lsR7xxSVp3Gd2' \
    --body '{"enabled": false, "reason": "K0HzYviTgYmx82JV"}' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpdateUserStatusV3' test.out

#- 190 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'BRLPZ6Iz8tne5dbg' \
    --body '{"emailAddress": "uBF6Gsvvdl8jHz9x", "password": "7XZIjU4IK9lOLaZa"}' \
    > test.out 2>&1
eval_tap $? 190 'AdminTrustlyUpdateUserIdentity' test.out

#- 191 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MphKCqTq3EVheJjo' \
    > test.out 2>&1
eval_tap $? 191 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 192 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'EEXBLIxGnNuhoJM3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "WWPvvCiCf33ViEdq"}' \
    > test.out 2>&1
eval_tap $? 192 'AdminUpdateClientSecretV3' test.out

#- 193 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'QpoGkUWNizk5UcPA' \
    --before 'Gv6c1ESC6hZYTYZb' \
    --isWildcard  \
    --limit '53' \
    > test.out 2>&1
eval_tap $? 193 'AdminGetRolesV3' test.out

#- 194 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "managers": [{"displayName": "5aANNNs5kgSZZNUH", "namespace": "bIT9szApmWJO5vzz", "userId": "XZj08a6K1XRVfriS"}, {"displayName": "pPFnZBJZkDnEiyfa", "namespace": "2LrnpZxNnLRH36bq", "userId": "S2oFY76PU1AziBOH"}, {"displayName": "EAj1cT3u6Zc2FbrT", "namespace": "FznTgDIwZIRWf6T3", "userId": "by2kYSCdnFKLc0xc"}], "members": [{"displayName": "TjqjdcEfU61OJYMn", "namespace": "W49rWynp1ck1vT90", "userId": "C6o86cSRL9cgbUmu"}, {"displayName": "lhe98oaFKlQicdrx", "namespace": "VhrtwSd9QWVMYz7T", "userId": "U1TsxsChSclSkb5a"}, {"displayName": "Bi9K9zyv6gFZXI5n", "namespace": "XJ7hLi6HweweRmyo", "userId": "91dIn7QqXBDXJcrq"}], "permissions": [{"action": 75, "resource": "Ad9sxoLnWGP1PafI", "schedAction": 20, "schedCron": "OPhuvHuYrGWDK41u", "schedRange": ["MOC0mRvSoaGk4ktF", "5wnJDg9Q3WXiydCO", "InVolsr6CHmj763v"]}, {"action": 78, "resource": "1cfswmeFpvtDteto", "schedAction": 87, "schedCron": "v90lyKSTWLxSFZ0L", "schedRange": ["pupEi5DbkVs3qFTi", "1t530Wj1WfzIvc3V", "lSXrA3XUGud4tVjm"]}, {"action": 47, "resource": "SUAW2ak7ISDrBVg6", "schedAction": 82, "schedCron": "g9x4unq3eOMHIKeT", "schedRange": ["yBG5dCUoExnKfV38", "69IN4V1OdhH4GVU7", "Exlkmc4xYiLjLyZr"]}], "roleName": "Xr9Bhtzn8jAdTn6x"}' \
    > test.out 2>&1
eval_tap $? 194 'AdminCreateRoleV3' test.out

#- 195 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'BhrciryLm67rkadH' \
    > test.out 2>&1
eval_tap $? 195 'AdminGetRoleV3' test.out

#- 196 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId '5Y41SLjCPrFa05Xl' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteRoleV3' test.out

#- 197 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId '5TPC5GODS44bmm7j' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "RKvw8ISP2WKmCRRX"}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateRoleV3' test.out

#- 198 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'BxlalCHtWlKxLpS8' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetRoleAdminStatusV3' test.out

#- 199 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'fLWoQ5nuJhatQPxR' \
    > test.out 2>&1
eval_tap $? 199 'AdminUpdateAdminRoleStatusV3' test.out

#- 200 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '7dvBVC5zgOKLTDmH' \
    > test.out 2>&1
eval_tap $? 200 'AdminRemoveRoleAdminV3' test.out

#- 201 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'e8c1eJ9sde7Ryt4u' \
    --after 'dIv22M18uux9xBom' \
    --before 'QFPFWy5cwNPI6aFo' \
    --limit '78' \
    > test.out 2>&1
eval_tap $? 201 'AdminGetRoleManagersV3' test.out

#- 202 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'etqgfOJDUT0uKAPr' \
    --body '{"managers": [{"displayName": "ARya2IMlNiXpF4qv", "namespace": "sUUpHqi33TcBGkc0", "userId": "HjUcnkpU9oVzl2kB"}, {"displayName": "uLFXIeCEKZUTz3Gv", "namespace": "CAZ5j24acYHbrryH", "userId": "B6GO9zP3FaepA3b3"}, {"displayName": "YJ9nJM6vtT27xv85", "namespace": "K5MU2qmbeqaVemIN", "userId": "dClpF7OvlBIEgjse"}]}' \
    > test.out 2>&1
eval_tap $? 202 'AdminAddRoleManagersV3' test.out

#- 203 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId '5kd6GEDo08yq5E5H' \
    --body '{"managers": [{"displayName": "leLoog4me2NBFp62", "namespace": "xlXvVcJerTPW02PW", "userId": "sHiKYArAxnKBfBfD"}, {"displayName": "lrQQuAc10DjjwMv4", "namespace": "vrIPRtvhQIyLarja", "userId": "LOKnX51yAB8Pa3uN"}, {"displayName": "GKhaLlJzJMSnJIIg", "namespace": "sAVmaGYxUX1B9oVu", "userId": "zG2CnYX2YBF2g7TV"}]}' \
    > test.out 2>&1
eval_tap $? 203 'AdminRemoveRoleManagersV3' test.out

#- 204 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'tzYEHUodh3iUfBth' \
    --after 'bepUCTWiZ1uqh7GA' \
    --before 'i4FEIu44u83ZLRxY' \
    --limit '23' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetRoleMembersV3' test.out

#- 205 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'SgkpK70uJmUL0uzE' \
    --body '{"members": [{"displayName": "lixc023dIvDiA0tQ", "namespace": "WlHwBcTtztx3VAl6", "userId": "tXFbnATCzUOIzVcy"}, {"displayName": "9k3ie64Vnwa0ClGQ", "namespace": "JultJe32AiwKadEo", "userId": "IVmprwPsa9YD92CX"}, {"displayName": "0rITajpwHITGeHTn", "namespace": "qRbzBB9ZFgJbQ3Fj", "userId": "1umx4ItzkMJ7cudf"}]}' \
    > test.out 2>&1
eval_tap $? 205 'AdminAddRoleMembersV3' test.out

#- 206 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId '4r916GPrhn2etVIQ' \
    --body '{"members": [{"displayName": "vRkQJAtDUH9tx60A", "namespace": "ehGz1ermJYXsYgL7", "userId": "TfyIlAwjTZdRZJJz"}, {"displayName": "WZwvTX2bamSCvX1n", "namespace": "wvSWdDwD7WJHzgNZ", "userId": "UKsI5y0mR3zMyTsf"}, {"displayName": "tKqnsIJctAdxyZVK", "namespace": "HA9DkaSOWgtg8yw8", "userId": "lHEbVDwBAqanOlsc"}]}' \
    > test.out 2>&1
eval_tap $? 206 'AdminRemoveRoleMembersV3' test.out

#- 207 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'RIWw82k5K5VTkdub' \
    --body '{"permissions": [{"action": 20, "resource": "UaDSwwQlnNRZJHBS", "schedAction": 57, "schedCron": "gqzZv5kVu4S95mj8", "schedRange": ["YRvae4f4lhBPbarb", "WEm8bVtZcfVCPdQh", "im9QKUAFTVYelIlG"]}, {"action": 73, "resource": "ahFZZGMTcqnWrIpr", "schedAction": 84, "schedCron": "cFBUsnnDJlmD1iEo", "schedRange": ["kbUiYzCQh2iNTwtn", "ohddMzMTQ9P7sYLD", "WAJOA75K4BYJ2fkq"]}, {"action": 19, "resource": "JoF2FI3vyyqRzc20", "schedAction": 84, "schedCron": "WwXWsz9TVmdMKEoh", "schedRange": ["KzuMYDUTLBeCidXj", "uGgx8ncXejmeZtzT", "0qj0ltsqfiZrthVv"]}]}' \
    > test.out 2>&1
eval_tap $? 207 'AdminUpdateRolePermissionsV3' test.out

#- 208 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'yX0OCKDJE3RMUddw' \
    --body '{"permissions": [{"action": 92, "resource": "cL3kR3hCGNgaJmuA", "schedAction": 76, "schedCron": "HR5BWa9VzIkaQEl1", "schedRange": ["iUProNB6hI6IpGcT", "oWgFvdRhG9NwV3zD", "uqVlVTypcYPK8Ixr"]}, {"action": 92, "resource": "RWOqO4U0bitNQLzw", "schedAction": 89, "schedCron": "3DQht4JwnPS2urJq", "schedRange": ["erobWMZGVL5KLTxa", "hWlS6XdBaKSLCgOO", "PXM6XTUh2dJ90yqH"]}, {"action": 60, "resource": "3NCo9yXlbQ52FTHT", "schedAction": 58, "schedCron": "Y6HKXAblkT8VGgSH", "schedRange": ["8MGZGwiVj7eDTaka", "9ABfX1IByPEOuPhG", "spRi3bhPQvBBJI5J"]}]}' \
    > test.out 2>&1
eval_tap $? 208 'AdminAddRolePermissionsV3' test.out

#- 209 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'xytpcubN4AUUPFPs' \
    --body '["cZsXeJOD4DMtqfIG", "iGJovgWSRxZ8N4UQ", "2fg3V1o2x0hL5DuB"]' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteRolePermissionsV3' test.out

#- 210 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '61' \
    --resource 'H7BMT1IZKTdNFVBQ' \
    --roleId '1crBXAupATO8uXsq' \
    > test.out 2>&1
eval_tap $? 210 'AdminDeleteRolePermissionV3' test.out

#- 211 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 211 'AdminGetMyUserV3' test.out

#- 212 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'VpdiWo8SjDAM0Riw' \
    --extendExp  \
    --redirectUri '8wLYW3n4F3LD1EDw' \
    --password 'BXw5uBYeQZOzATNS' \
    --requestId 'V9E9yyNb7yaLXzAV' \
    --userName 'YymOuhCkZu4htrsf' \
    > test.out 2>&1
eval_tap $? 212 'UserAuthenticationV3' test.out

#- 213 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '8eIFSovTGXaMsq8e' \
    --linkingToken 'PN1oco2jx8Upe8Sj' \
    --password 'MvpqM8puggOEdG47' \
    --username 'gD5i2Ni6AnWn3NdE' \
    > test.out 2>&1
eval_tap $? 213 'AuthenticationWithPlatformLinkV3' test.out

#- 214 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'PhNHSH7eKDfRcngE' \
    --extendExp  \
    --linkingToken 'pTnRUQr3RLOM1vEx' \
    > test.out 2>&1
eval_tap $? 214 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 215 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId '4gqDY6jwyKRxhkLe' \
    > test.out 2>&1
eval_tap $? 215 'RequestOneTimeLinkingCodeV3' test.out

#- 216 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode '5zohg9s9utRQt28b' \
    > test.out 2>&1
eval_tap $? 216 'ValidateOneTimeLinkingCodeV3' test.out

#- 217 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData '6o3K0COF74tz6aeX' \
    --isTransient  \
    --clientId 'ZOYwbwjMNdxKWlBf' \
    --oneTimeLinkCode 'nRyFS0Ed7gTM5AVr' \
    > test.out 2>&1
eval_tap $? 217 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 218 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 218 'GetCountryLocationV3' test.out

#- 219 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 219 'Logout' test.out

#- 220 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'tBQiDTcNnZa6Zuxk' \
    > test.out 2>&1
eval_tap $? 220 'RequestTokenExchangeCodeV3' test.out

#- 221 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6u6HXXdiC9ZDj4E4' \
    --userId 'mv12FNXypoOLl13j' \
    > test.out 2>&1
eval_tap $? 221 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 222 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '84P0KqirJ4PkMFts' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 222 'RevokeUserV3' test.out

#- 223 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'nFfz8Ew0X8fBuBSK' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'PvRLiDi0mNHb6Lx8' \
    --redirectUri 'eq8SGNwEQO8dYXvB' \
    --scope 'SYvJBwb6CjZUMRf2' \
    --state 'VJetWsokvx3BHuTE' \
    --targetAuthPage 'czr9KjQ3ttz8MTBt' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId '1xk9IyssSA8nP5PQ' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 223 'AuthorizeV3' test.out

#- 224 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'qPtQmQN6eKAGiZFC' \
    > test.out 2>&1
eval_tap $? 224 'TokenIntrospectionV3' test.out

#- 225 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 225 'GetJWKSV3' test.out

#- 226 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'ftT0RWECdjWYrnul' \
    --factor 'xcCKAru8pOaAVLDB' \
    --mfaToken '4k3JwkdaxR7GJpYm' \
    > test.out 2>&1
eval_tap $? 226 'SendMFAAuthenticationCode' test.out

#- 227 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'uYCPG181q9GA5Dyd' \
    --mfaToken 'C2D8UT6KOc4VPDUR' \
    > test.out 2>&1
eval_tap $? 227 'Change2faMethod' test.out

#- 228 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code '9ayazqXRqegIUicY' \
    --factor 'XXzxsBFrUs9BYp6T' \
    --mfaToken 'gCejBd5o7iTST7R3' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 228 'Verify2faCode' test.out

#- 229 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KbbQGERMNpqWb51y' \
    --userId '5RUzvMfTkPy0fGvT' \
    > test.out 2>&1
eval_tap $? 229 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 230 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'GgfLKsg0b1Bq78cE' \
    --clientId '5O5pmPnbiPJ9j4vx' \
    --redirectUri 'mbH3rVaauufxkPHE' \
    --requestId 'lug48TgfNu0rqXUO' \
    > test.out 2>&1
eval_tap $? 230 'AuthCodeRequestV3' test.out

#- 231 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'yToLPIREGIKlJt3E' \
    --additionalData 'P9kKwkENQ8VOHGwb' \
    --clientId 'ADMfuOmh0lciRhVZ' \
    --createHeadless  \
    --deviceId '2DeoODXMzLSrzoiB' \
    --macAddress 'nYi5UWs3tYlYeMoC' \
    --platformToken 'imJySocRvUWDOrFZ' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 231 'PlatformTokenGrantV3' test.out

#- 232 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 232 'GetRevocationListV3' test.out

#- 233 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'KPNoN9AWtLK9TFgi' \
    > test.out 2>&1
eval_tap $? 233 'TokenRevocationV3' test.out

#- 234 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'pspc' \
    --simultaneousTicket 'j2XMh9WpifqjNjLO' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'xrDKVpULjjiw3NeV' \
    > test.out 2>&1
eval_tap $? 234 'SimultaneousLoginV3' test.out

#- 235 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'G4DJi9DaMrc0WFgK' \
    --clientId 'jE945x2CPVYYG9Wv' \
    --code 'oGmAmvaVV5YfxnUN' \
    --codeVerifier 'cwjr7gSGhnfuF4WZ' \
    --extendNamespace 'iQVICVpWd3UM08gM' \
    --extendExp  \
    --password 'Xhdf3juXW4JprIb3' \
    --redirectUri 'CJCAtvSG8Cfa9dzO' \
    --refreshToken 'JDGCTHIOFjeXbsSg' \
    --username 'R43kIDzxBwqRJTzr' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 235 'TokenGrantV3' test.out

#- 236 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'ypRUnq5o4ETeCUYG' \
    > test.out 2>&1
eval_tap $? 236 'VerifyTokenV3' test.out

#- 237 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId '9ccTt7Wxw8OQ13t3' \
    --code 'uTw6zQuoZcXQpoTO' \
    --error 'xe8y1jorNsg9ZKYC' \
    --openidAssocHandle 'KoISyXtHzoWGdYoh' \
    --openidClaimedId 'xMp3uOQIybqWfG9B' \
    --openidIdentity 'J6FVKlbYHtbPtaxv' \
    --openidMode 'agSlpGgVTF6VeDAP' \
    --openidNs 'OGBwweyFfXEOEAEt' \
    --openidOpEndpoint 'bag82KgBgyCd5vjk' \
    --openidResponseNonce 'fz3eR4DtNp129hzB' \
    --openidReturnTo 'w3xLUcCEt0DzmkJq' \
    --openidSig '1sml5bYt76BNsi4g' \
    --openidSigned 'iR9434WpKKdzxouf' \
    --state 'CNlFoOcWQQy4bjmQ' \
    > test.out 2>&1
eval_tap $? 237 'PlatformAuthenticationV3' test.out

#- 238 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'eEweoBHTdwAk7ZQn' \
    --platformToken 'bqY1cQwVEtAr5kKK' \
    > test.out 2>&1
eval_tap $? 238 'PlatformTokenRefreshV3' test.out

#- 239 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'Ao9MM2Cqm84jVi9k' \
    > test.out 2>&1
eval_tap $? 239 'PublicGetInputValidations' test.out

#- 240 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'IpqgrzpUkNOBWydX' \
    > test.out 2>&1
eval_tap $? 240 'PublicGetInputValidationByField' test.out

#- 241 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'V0Fi02aFr8CDapjw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'PublicGetCountryAgeRestrictionV3' test.out

#- 242 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'NOl4k8rVNrm8drv8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 242 'PublicGetConfigValueV3' test.out

#- 243 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 243 'PublicGetCountryListV3' test.out

#- 244 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 244 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 245 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'QD2JOe2Ntz7EFvow' \
    > test.out 2>&1
eval_tap $? 245 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 246 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PgIGuetxFMqXCQMA' \
    --rawPID  \
    --body '{"platformUserIds": ["qQ2ZRGzNtrThFa9X", "U8mosluiHZJ7O8sA", "Q32wj9uaDzsr9xYi"]}' \
    > test.out 2>&1
eval_tap $? 246 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 247 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WRuuzQJiLc1eI9w3' \
    --platformUserId 'JEhxPGbEk7s7gw07' \
    > test.out 2>&1
eval_tap $? 247 'PublicGetUserByPlatformUserIDV3' test.out

#- 248 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'FlounC3vJKBC7Swg' \
    > test.out 2>&1
eval_tap $? 248 'PublicGetAsyncStatus' test.out

#- 249 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'oViPeIB4Ehy0Y5aS' \
    --limit '72' \
    --offset '68' \
    --platformBy 'VDginxAM77eY9C14' \
    --platformId 'FbfiI2NPvl1kCY5b' \
    --query 'EokxXxkWZbjf7GZx' \
    > test.out 2>&1
eval_tap $? 249 'PublicSearchUserV3' test.out

#- 250 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "aossQmjo69wohJFy", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "ijsQRj7N8IAjmson", "policyId": "jj0ZR50BQ1U6aFD3", "policyVersionId": "O2kXQSc58zgZVl4g"}, {"isAccepted": false, "localizedPolicyVersionId": "F7v3qbZu9M3OxqVA", "policyId": "T4H1lRZ9Z1JBrHRz", "policyVersionId": "EOtIxzPqb6n73m0j"}, {"isAccepted": false, "localizedPolicyVersionId": "FPghqamSc5y0X48e", "policyId": "T7Mluexk87b9Z5BT", "policyVersionId": "sEA3EdmW8saabP4x"}], "authType": "RowfNojzPXI2v0pr", "code": "R3OEey0MkZwS6TYw", "country": "NN3UYhic03qGEg5f", "dateOfBirth": "NzBVrjo3g8CfRwty", "displayName": "l1HeT7VEPgG40QyX", "emailAddress": "zsOzgck078IghoQB", "password": "p2mWAOYksczxBS0O", "reachMinimumAge": true, "uniqueDisplayName": "yilUEujk6oqYo1HQ"}' \
    > test.out 2>&1
eval_tap $? 250 'PublicCreateUserV3' test.out

#- 251 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'YTFzwdOMdupwD4O3' \
    --query 'uNbcIDcIyvZbOy1T' \
    > test.out 2>&1
eval_tap $? 251 'CheckUserAvailability' test.out

#- 252 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["4hfwkuVykH4Rpfmj", "IXFGZ5PKdbabJIkN", "nt9P1Tkm08luh4dp"]}' \
    > test.out 2>&1
eval_tap $? 252 'PublicBulkGetUsers' test.out

#- 253 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "PRMDbUXBWTbpAogG", "languageTag": "2wlZkLhuU5FI8Nij"}' \
    > test.out 2>&1
eval_tap $? 253 'PublicSendRegistrationCode' test.out

#- 254 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "FI0GKwJ3vfXlsAMy", "emailAddress": "2Zp2UAGxHnmSxvkG"}' \
    > test.out 2>&1
eval_tap $? 254 'PublicVerifyRegistrationCode' test.out

#- 255 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "9UR5q9neoW6JBcGp", "languageTag": "9Rx2RfcRhXpmeeHd"}' \
    > test.out 2>&1
eval_tap $? 255 'PublicForgotPasswordV3' test.out

#- 256 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'vphas9S7ivHEoLbU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 256 'GetAdminInvitationV3' test.out

#- 257 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'MM47f1UreUpxEkXI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "bE1ETzRJZKMavu4U", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "sFPm1YN27bojDVaZ", "policyId": "Lpx4kEWYkO6KrKUM", "policyVersionId": "hJrASBh61hmWKSSr"}, {"isAccepted": false, "localizedPolicyVersionId": "kEeXBZ6FVrBzyhyh", "policyId": "oS6a9oe0JaXFpff2", "policyVersionId": "8uYbe4Cf2HEHvVev"}, {"isAccepted": false, "localizedPolicyVersionId": "gj5vyUMAAmIHYbsx", "policyId": "G5N066FXb88SbLOa", "policyVersionId": "21DiSFsm0XXQJWsz"}], "authType": "vTQEuALzDNp1SZ58", "code": "aDllwzTRHak1MXxj", "country": "7Esrg7900nml5Bid", "dateOfBirth": "sK9dCEzhVnOv0PQb", "displayName": "VIaKiHfoeorY7A1o", "emailAddress": "tGFyv2SMjbEr50qG", "password": "dCZIc6EFqBKxbS7Q", "reachMinimumAge": true, "uniqueDisplayName": "OgRucL1jwRXzfjDZ"}' \
    > test.out 2>&1
eval_tap $? 257 'CreateUserFromInvitationV3' test.out

#- 258 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "ZBmOau6syme06c6S", "country": "KLc2mEC3IXl5XCbk", "dateOfBirth": "OfHaGr5kdazlypvt", "displayName": "6lSLfU7HByGXPMqx", "languageTag": "j4hBgVY3YAxZLKbc", "uniqueDisplayName": "Odyjqf6Q4oiwoJca", "userName": "RMEb15LBlTVufc5Z"}' \
    > test.out 2>&1
eval_tap $? 258 'UpdateUserV3' test.out

#- 259 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "yODR2NVyn4PRqf3e", "country": "RbZqBAoKGcVCdMiS", "dateOfBirth": "NV4qBrt1kcLmRv6E", "displayName": "Jtl5xWnsb8oWq94R", "languageTag": "ImNWVIJnhhwFDV1V", "uniqueDisplayName": "itaomvWTzdsW4N70", "userName": "wYS4Kj7Yi2VvoQNW"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicPartialUpdateUserV3' test.out

#- 260 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "8Yc481dYdvGxJAMD", "emailAddress": "RA1LF7jdWlekFwO9", "languageTag": "4VBCV9qJhWva2FPB"}' \
    > test.out 2>&1
eval_tap $? 260 'PublicSendVerificationCodeV3' test.out

#- 261 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ujX0geYCpGJM4sqs", "contactType": "PNJMiZXXOFwmGWAv", "languageTag": "NF0Z0GkwxUNYyNwG", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 261 'PublicUserVerificationV3' test.out

#- 262 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "YsnignE7KcMF7fuD", "country": "bzRRYMNXWUsp1tOi", "dateOfBirth": "bJY9aL9ie6vvMbiN", "displayName": "URrlm88QlKyuoya4", "emailAddress": "JgakZyUV7t73VnSF", "password": "buxd4KYZ0jk0UZdh", "uniqueDisplayName": "tnKu9oTc8pVkiyGs", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 262 'PublicUpgradeHeadlessAccountV3' test.out

#- 263 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "EsL5D0oiFchQnVeq", "password": "3g2AB2WIRUQmauIY"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicVerifyHeadlessAccountV3' test.out

#- 264 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "5HXCZ0W4XmWP0HzS", "newPassword": "diylLhVYszm8xY33", "oldPassword": "OQbumu2QHLyZNuys"}' \
    > test.out 2>&1
eval_tap $? 264 'PublicUpdatePasswordV3' test.out

#- 265 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'yM4OfCzdQCXMAWnf' \
    > test.out 2>&1
eval_tap $? 265 'PublicCreateJusticeUser' test.out

#- 266 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '87YPNOe9Eevf1fhM' \
    --redirectUri 'g1E2k7QLFrVgtX7y' \
    --ticket '0fPOieDCow2zXyFF' \
    > test.out 2>&1
eval_tap $? 266 'PublicPlatformLinkV3' test.out

#- 267 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VpM87yqEwEacQMTl' \
    --body '{"platformNamespace": "qN4LKkxJ5v3SBafn"}' \
    > test.out 2>&1
eval_tap $? 267 'PublicPlatformUnlinkV3' test.out

#- 268 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KNiMPbFkFGA85W3H' \
    > test.out 2>&1
eval_tap $? 268 'PublicPlatformUnlinkAllV3' test.out

#- 269 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JkqgS2B37wwoPYOH' \
    --ticket 'iIsxmsLBPBJuNLnW' \
    > test.out 2>&1
eval_tap $? 269 'PublicForcePlatformLinkV3' test.out

#- 270 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RrtW870qD88ZcduZ' \
    --clientId 'Se7W20UZcDaiq0nE' \
    --redirectUri 'Z7PyhqFJkDClOsKm' \
    > test.out 2>&1
eval_tap $? 270 'PublicWebLinkPlatform' test.out

#- 271 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fsgJdmzsDPsWh1k0' \
    --code 'cQ08NG6dX2TZkil6' \
    --state '7kRngoUa83ECh1gq' \
    > test.out 2>&1
eval_tap $? 271 'PublicWebLinkPlatformEstablish' test.out

#- 272 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PeS193TNNzot3sVl' \
    --code 'i3GN2XTrFibRAhzz' \
    --state 'EWzWlTY70qdgJRvp' \
    > test.out 2>&1
eval_tap $? 272 'PublicProcessWebLinkPlatformV3' test.out

#- 273 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "ZrSpWX3KEe2BjV00", "userIds": ["ReCXFffjJJxlgjzI", "hpgOoIOD74V21HWD", "AfvXwdxbyp4HAPbB"]}' \
    > test.out 2>&1
eval_tap $? 273 'PublicGetUsersPlatformInfosV3' test.out

#- 274 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "bNPStVBUpKgOssFk", "emailAddress": "z0F36piDYXeHZ7FH", "newPassword": "ls3nyvconqbHQqKL"}' \
    > test.out 2>&1
eval_tap $? 274 'ResetPasswordV3' test.out

#- 275 PublicGetUserByUserIdV3
eval_tap 0 275 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 276 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QKe3xmj6s0GqsWnc' \
    --activeOnly  \
    --after 'p5LrqbiKudv9z75S' \
    --before 'zoCV8ZMi2o1nR482' \
    --limit '61' \
    > test.out 2>&1
eval_tap $? 276 'PublicGetUserBanHistoryV3' test.out

#- 277 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FD58sG6uDhFYlrzJ' \
    > test.out 2>&1
eval_tap $? 277 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 278 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BYSeMuJfQecutjS0' \
    > test.out 2>&1
eval_tap $? 278 'PublicGetUserInformationV3' test.out

#- 279 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '29BiJWOG1m7MKclr' \
    --after '0.9269789959427817' \
    --before '0.1400934947197353' \
    --limit '13' \
    > test.out 2>&1
eval_tap $? 279 'PublicGetUserLoginHistoriesV3' test.out

#- 280 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TgCNNH7RtG5Xmo9Q' \
    --after '0Wb07N17fkxZSc6V' \
    --before 'bE0AGcekjMNHuPXt' \
    --limit '53' \
    --platformId 'j1haAosKglqaCXE9' \
    > test.out 2>&1
eval_tap $? 280 'PublicGetUserPlatformAccountsV3' test.out

#- 281 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ytpIO8btO3OwNEGS' \
    > test.out 2>&1
eval_tap $? 281 'PublicListJusticePlatformAccountsV3' test.out

#- 282 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'W5TaW4to7QCY2NGG' \
    --body '{"platformId": "vi9kg3rMIzNmhJTN", "platformUserId": "QjKlwjfJ3TJ2xVpg"}' \
    > test.out 2>&1
eval_tap $? 282 'PublicLinkPlatformAccount' test.out

#- 283 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'e70WsLfgbZieRvJI' \
    --body '{"chosenNamespaces": ["5sT9DH3DfLCv8q4T", "hmq09bBgPAYxrBE9", "jlnTgtgW33wDwD9R"], "requestId": "KvQX4yFQFdrRoM6F"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicForceLinkPlatformWithProgression' test.out

#- 284 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oqCYw7AlxO6qdFpc' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetPublisherUserV3' test.out

#- 285 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '71sSck3ggZWJlSlC' \
    --password 'QMDji329PfVrvMEP' \
    > test.out 2>&1
eval_tap $? 285 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 286 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'tpsSNcpK1QkB2Sy8' \
    --before 'Ww79LVeVskqeUB7R' \
    --isWildcard  \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 286 'PublicGetRolesV3' test.out

#- 287 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'RF9bqMj4ro5B19VE' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetRoleV3' test.out

#- 288 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 288 'PublicGetMyUserV3' test.out

#- 289 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode '838c7OydVw0zCqoM' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 290 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["ZvpIOO97DmQ5ZOzx", "6iCJTu60IifzMhkk", "5PxsjqbCKpMv2Yky"], "oneTimeLinkCode": "9DYkD2sIllFtBtXJ"}' \
    > test.out 2>&1
eval_tap $? 290 'LinkHeadlessAccountToMyAccountV3' test.out

#- 291 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "KG3rqBmILhtWm8RQ"}' \
    > test.out 2>&1
eval_tap $? 291 'PublicSendVerificationLinkV3' test.out

#- 292 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'vRUbUDSiefGEdLuc' \
    > test.out 2>&1
eval_tap $? 292 'PublicVerifyUserByLinkV3' test.out

#- 293 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'rtO2gCQD057DrDlg' \
    --code 'C2nzS9SiGUjVAw4v' \
    --error '3q6JRHcn7KaoCEkR' \
    --state 'do6qHYIZWnXqQ1oH' \
    > test.out 2>&1
eval_tap $? 293 'PlatformAuthenticateSAMLV3Handler' test.out

#- 294 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'FJ9Q0vqsL9SomqWs' \
    --payload 'GA76yxi0QzZWfmP2' \
    > test.out 2>&1
eval_tap $? 294 'LoginSSOClient' test.out

#- 295 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'sx0KO5bEJaPnAFjs' \
    > test.out 2>&1
eval_tap $? 295 'LogoutSSOClient' test.out

#- 296 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'odyJQVVBrShGbIIu' \
    --code 'qK8C403HgoXCR6XO' \
    > test.out 2>&1
eval_tap $? 296 'RequestTargetTokenResponseV3' test.out

#- 297 PlatformTokenRefreshV3Deprecate
eval_tap 0 297 'PlatformTokenRefreshV3Deprecate # SKIP deprecated' test.out

#- 298 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MXwKdfqk8T4QHK30' \
    > test.out 2>&1
eval_tap $? 298 'AdminGetDevicesByUserV4' test.out

#- 299 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'EX0FclpDl5Hsurac' \
    --endDate 'O5MnjnxD1OXkxShF' \
    --limit '97' \
    --offset '1' \
    --startDate 'QTRekLfjmy8zosRC' \
    > test.out 2>&1
eval_tap $? 299 'AdminGetBannedDevicesV4' test.out

#- 300 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RgVwbrQKmb01yA7U' \
    > test.out 2>&1
eval_tap $? 300 'AdminGetUserDeviceBansV4' test.out

#- 301 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "7dGMjupZkZQY8CNy", "deviceId": "T4k3DIbfT22G5NpE", "deviceType": "130YWSgxpKWtdtdt", "enabled": false, "endDate": "9anENmxb9e7vXZV3", "ext": {"ig8Jg5VByeI3ycMc": {}, "YYBixKJXCISQdwec": {}, "1m8BusV9tUh74KVo": {}}, "reason": "6Xqjz2xUKLNWSmYy"}' \
    > test.out 2>&1
eval_tap $? 301 'AdminBanDeviceV4' test.out

#- 302 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'VvyelIJ8QgaLMqi8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 302 'AdminGetDeviceBanV4' test.out

#- 303 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId '36ULa7cfZl4VuY6r' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 303 'AdminUpdateDeviceBanV4' test.out

#- 304 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate '2FrR1GSogkewIzTO' \
    --startDate 'qKkcjRh3l2gAJOTC' \
    --deviceType 'bx7J3gNLIlTk3Bpc' \
    > test.out 2>&1
eval_tap $? 304 'AdminGenerateReportV4' test.out

#- 305 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 305 'AdminGetDeviceTypesV4' test.out

#- 306 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'lrk4hIRn0znIKzAE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 306 'AdminGetDeviceBansV4' test.out

#- 307 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'AHQpBOgHEP5l94s7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 307 'AdminDecryptDeviceV4' test.out

#- 308 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'CbIJ7eHnVWOboMky' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 308 'AdminUnbanDeviceV4' test.out

#- 309 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'B7FTexsOZ0b2p3b6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 309 'AdminGetUsersByDeviceV4' test.out

#- 310 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 7}' \
    > test.out 2>&1
eval_tap $? 310 'AdminCreateTestUsersV4' test.out

#- 311 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "rcwIcXMhGy83Xit6", "policyId": "boOLGCcg16DqwdQP", "policyVersionId": "Q9HkSSV8e1MgTTLS"}, {"isAccepted": false, "localizedPolicyVersionId": "F3eTC0vzZUDj9dzG", "policyId": "gGVxo9OHgfHumyfu", "policyVersionId": "BNisecYbcOpR45VD"}, {"isAccepted": false, "localizedPolicyVersionId": "Vpqn47GVghTH2wTo", "policyId": "Onq9U5lyW89Xwt3w", "policyVersionId": "mRTrDCjhnKvsHezW"}], "authType": "EMAILPASSWD", "code": "qgYPixtHk6lWq6tE", "country": "eUmU96FLEak0mJqj", "dateOfBirth": "RYldcTpdeCD9XPRi", "displayName": "4bAQL7VE2wL8Y4JF", "emailAddress": "VUdzA8bvXlDhG7Br", "password": "orbKIKuOXJPm5ztr", "passwordMD5Sum": "r09CDA8Ij5bGKSuo", "reachMinimumAge": true, "uniqueDisplayName": "VSO0js0hG9xmSnzd", "username": "7zgUxAogcnGkXk17"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminCreateUserV4' test.out

#- 312 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["kJHRhmLKQuQVFSKi", "Xl8G2uf6E8EajXLS", "AS8MKMaxQ1QyJCpK"]}' \
    > test.out 2>&1
eval_tap $? 312 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 313 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["edhuzI7G9NCKKXu1", "bqI2M5PmXfKnQ7BY", "GjCUDMOrbmoRvWnf"]}' \
    > test.out 2>&1
eval_tap $? 313 'AdminBulkCheckValidUserIDV4' test.out

#- 314 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mGFy0eUoOBd90h9E' \
    --body '{"avatarUrl": "DqSTOfoNewWjwMWD", "country": "KEt6JhbJ0fwTDaq6", "dateOfBirth": "b5RpMwhWPtndriXU", "displayName": "9loOxpmEuwDVc12r", "languageTag": "0DVUGgGHkapTCafF", "uniqueDisplayName": "MdvYiCBuzUUwyI6V", "userName": "td4v9k4fv3kMiuQ3"}' \
    > test.out 2>&1
eval_tap $? 314 'AdminUpdateUserV4' test.out

#- 315 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DhsKLxjt5srPFxBg' \
    --body '{"code": "pFtDBmTLH9kP9U53", "emailAddress": "z6joBAhAlJGI2YYb"}' \
    > test.out 2>&1
eval_tap $? 315 'AdminUpdateUserEmailAddressV4' test.out

#- 316 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '6ajBjgq6eY4PBNHK' \
    > test.out 2>&1
eval_tap $? 316 'AdminDisableUserMFAV4' test.out

#- 317 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Px62tHxDb06ZFy3u' \
    > test.out 2>&1
eval_tap $? 317 'AdminListUserRolesV4' test.out

#- 318 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'glSp2UxvF2uLXWil' \
    --body '{"assignedNamespaces": ["RD7HD6LCgdFxRGj0", "0RT6LvcnGMJbJIYL", "ssMvy9gkfTMRrXVR"], "roleId": "cAVRDX6gmDfNfPGY"}' \
    > test.out 2>&1
eval_tap $? 318 'AdminUpdateUserRoleV4' test.out

#- 319 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YSTunMgt3C8hEguC' \
    --body '{"assignedNamespaces": ["qlMHiQN3HWJw9zIW", "siP2JQ24meDrwEuT", "yM2qohglzO8AEl6A"], "roleId": "9sh2x2ur2ccp7R7O"}' \
    > test.out 2>&1
eval_tap $? 319 'AdminAddUserRoleV4' test.out

#- 320 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qPqIjS4i0N9ytb3c' \
    --body '{"assignedNamespaces": ["8pVZ8GlU8962e6gt", "n5pUARJM1T8QwMNO", "AzXmyHEV4g9P6a28"], "roleId": "0S5RNB5dVCsB7xL4"}' \
    > test.out 2>&1
eval_tap $? 320 'AdminRemoveUserRoleV4' test.out

#- 321 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '0' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 321 'AdminGetRolesV4' test.out

#- 322 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "CAT7cBP0918JaEBQ"}' \
    > test.out 2>&1
eval_tap $? 322 'AdminCreateRoleV4' test.out

#- 323 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'BP766LUnBBR84iAO' \
    > test.out 2>&1
eval_tap $? 323 'AdminGetRoleV4' test.out

#- 324 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId '7sBQt6YJ2tWwF7Rn' \
    > test.out 2>&1
eval_tap $? 324 'AdminDeleteRoleV4' test.out

#- 325 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'P1oK3c4RVfjB0zi3' \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "iN24ol1qqbalgizL"}' \
    > test.out 2>&1
eval_tap $? 325 'AdminUpdateRoleV4' test.out

#- 326 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId '97ycJV5YqE2myQzl' \
    --body '{"permissions": [{"action": 46, "resource": "X9fHr6WvBxmBvNj3", "schedAction": 21, "schedCron": "E2PMv12ZSRJkujxb", "schedRange": ["Cu1HFaj6Vxs3GuA4", "S1dS7H7yIS7b5TSD", "RIoMg7Dc5APzfzXD"]}, {"action": 63, "resource": "PxK1os4qR8LaQzEb", "schedAction": 100, "schedCron": "sZTdFfC8x5aHLsXH", "schedRange": ["lm1RJTTy9JrNz1K5", "M1qgFddYvifGHawN", "x6yhniEHLbEQKc0a"]}, {"action": 95, "resource": "aKnWhlh80BhYe2fJ", "schedAction": 61, "schedCron": "SlpCI8DhjlxUyrs3", "schedRange": ["OSesE5p0DwUj2HKU", "vPYUcQBxMSdOOsn2", "Nd8Jpa19GJDK46Ee"]}]}' \
    > test.out 2>&1
eval_tap $? 326 'AdminUpdateRolePermissionsV4' test.out

#- 327 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'hx7xasqMY9aulsL6' \
    --body '{"permissions": [{"action": 80, "resource": "uX6r0gBVUUeKKlPK", "schedAction": 40, "schedCron": "WVxIK9D2bTcgaKoc", "schedRange": ["caSwWcZmzCWGI1cI", "QcPWAShIhieSKUf3", "zKbyQk2vQTYX1xst"]}, {"action": 14, "resource": "ya6LSSUlugIAknXc", "schedAction": 92, "schedCron": "eHlf6IcX1K9JrK6O", "schedRange": ["r2xx7rLwrPoWiywn", "xuDLLuIaSxoloIH1", "gBCWVFrvls0ZwosK"]}, {"action": 16, "resource": "OJ8TNiP8KgEAj3db", "schedAction": 90, "schedCron": "kqddI3ezqu6FB0sL", "schedRange": ["2xt6fX9j7rhZCAlD", "lVKBsLZiBRXszE7C", "L1cQCSoqHvH7g63c"]}]}' \
    > test.out 2>&1
eval_tap $? 327 'AdminAddRolePermissionsV4' test.out

#- 328 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'Ox6yrIw37pKOLrF5' \
    --body '["i3gr3Cc4M2O7NrTQ", "O7KLdZDGwqx7T3l1", "ut2oyolliYsTJUmp"]' \
    > test.out 2>&1
eval_tap $? 328 'AdminDeleteRolePermissionsV4' test.out

#- 329 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'scwLcUml3KuoMKh7' \
    --after 'tprnacA34xmIOjFL' \
    --before 'gKR4LjEWhOScvtQ9' \
    --limit '18' \
    > test.out 2>&1
eval_tap $? 329 'AdminListAssignedUsersV4' test.out

#- 330 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'wlDngNiPPjpSAlZw' \
    --body '{"assignedNamespaces": ["FGpea5ObBB49Km4C", "lIQmkIdLCvNhZ6P8", "aqZ2yfrC1V7ZpJZP"], "namespace": "HCMqvcYmeDLYEzs2", "userId": "SQUdKr6vgqkjycqc"}' \
    > test.out 2>&1
eval_tap $? 330 'AdminAssignUserToRoleV4' test.out

#- 331 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'lNlBORlC8ZkjsxYt' \
    --body '{"namespace": "gxplHTPLzynjFZgF", "userId": "3erw7UsyHq4bBb0n"}' \
    > test.out 2>&1
eval_tap $? 331 'AdminRevokeUserFromRoleV4' test.out

#- 332 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["1JhPUS8BRPGV9n76", "9zLJdKMexeJc7Nvg", "TSgKjCxZjKf8NA4c"], "emailAddresses": ["GUaDfy9XnH2r0EKr", "k5VlnKsWCPccAFn5", "CEPoH6opK5DSO8Jy"], "isAdmin": true, "isNewStudio": false, "namespace": "IE1z3rDwZ1HKsOpy", "roleId": "q8agQuz86nc6jLF9"}' \
    > test.out 2>&1
eval_tap $? 332 'AdminInviteUserNewV4' test.out

#- 333 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "DIW2ncJJKpqmgvUT", "country": "r8XAtpOqUQxzqJZi", "dateOfBirth": "Wi3KQffT5Tn61A1x", "displayName": "W6okIqmd87ir9op4", "languageTag": "YfGTno5oHzqY3Dgy", "uniqueDisplayName": "kA8zBJX0rkOHUkY5", "userName": "aSlqhYoSXbn6l5xA"}' \
    > test.out 2>&1
eval_tap $? 333 'AdminUpdateMyUserV4' test.out

#- 334 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 334 'AdminDisableMyAuthenticatorV4' test.out

#- 335 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'zc1nc3eFm950dtVA' \
    > test.out 2>&1
eval_tap $? 335 'AdminEnableMyAuthenticatorV4' test.out

#- 336 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 336 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 337 AdminGetMyBackupCodesV4
eval_tap 0 337 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 338 AdminGenerateMyBackupCodesV4
eval_tap 0 338 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 339 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 339 'AdminDisableMyBackupCodesV4' test.out

#- 340 AdminDownloadMyBackupCodesV4
eval_tap 0 340 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 341 AdminEnableMyBackupCodesV4
eval_tap 0 341 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 342 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 342 'AdminGetBackupCodesV4' test.out

#- 343 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 343 'AdminGenerateBackupCodesV4' test.out

#- 344 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 344 'AdminEnableBackupCodesV4' test.out

#- 345 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 345 'AdminSendMyMFAEmailCodeV4' test.out

#- 346 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 346 'AdminDisableMyEmailV4' test.out

#- 347 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'o7w4e3v5mh6Rum5p' \
    > test.out 2>&1
eval_tap $? 347 'AdminEnableMyEmailV4' test.out

#- 348 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 348 'AdminGetMyEnabledFactorsV4' test.out

#- 349 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'bgEt39uJQpgEtchT' \
    > test.out 2>&1
eval_tap $? 349 'AdminMakeFactorMyDefaultV4' test.out

#- 350 AdminInviteUserV4
eval_tap 0 350 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 351 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "0b0sGOkzxVt15LKm", "policyId": "kQ7YBhsOuJ0ypkkt", "policyVersionId": "2G4eFh2YNsdoxpLT"}, {"isAccepted": true, "localizedPolicyVersionId": "EHxAKDQher3usApP", "policyId": "dJPn9eIdhIBvTTup", "policyVersionId": "ABJ4RwH3EdKmYtbq"}, {"isAccepted": true, "localizedPolicyVersionId": "fIZwrMxf3EnzZVnk", "policyId": "LT0Lb85nmpdN26BY", "policyVersionId": "5YI0jeO2zMDSy4ky"}], "authType": "EMAILPASSWD", "country": "4UcYzswAGpXqQxct", "dateOfBirth": "uVaqPJGAHEZmuQrZ", "displayName": "8GaQ4OZ2nDodm4TN", "emailAddress": "s8mAj6IKSYFdJwgZ", "password": "sRPOzwuDSdGl1A2v", "passwordMD5Sum": "aNeDiSqTfmAVg50k", "uniqueDisplayName": "OdJagEmTuaxlxgyw", "username": "kbdOsyxX1tfW488o", "verified": false}' \
    > test.out 2>&1
eval_tap $? 351 'PublicCreateTestUserV4' test.out

#- 352 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "T4jyCVJ0V8obTlGV", "policyId": "Thz4bm41oIcV33yj", "policyVersionId": "PxibDjfF7JkjCVpZ"}, {"isAccepted": true, "localizedPolicyVersionId": "SyienCODZ0mnOpPT", "policyId": "VxEgBFzG8tlkxWKC", "policyVersionId": "U1XN4gl7yHvEqpJS"}, {"isAccepted": true, "localizedPolicyVersionId": "F2PqUfbpMpRl6xRy", "policyId": "V19cborUHeCpqnZ5", "policyVersionId": "NW623WWn2ZJY3QvR"}], "authType": "EMAILPASSWD", "code": "MnyCPn1FylWdaNV1", "country": "VaZTkbbuWiiA4UTD", "dateOfBirth": "gS2SVEo5M80LLbku", "displayName": "9GYH4ijqOVM50tCq", "emailAddress": "kZfsSxAbDJ7sHCLu", "password": "p8pmEosOXglQwwde", "passwordMD5Sum": "LVpmXqRwVjc3W2AN", "reachMinimumAge": false, "uniqueDisplayName": "ldRPRfd6mLZ0GTJw", "username": "EjoZrRtaeWKMC8ws"}' \
    > test.out 2>&1
eval_tap $? 352 'PublicCreateUserV4' test.out

#- 353 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'OByQAMAgqFEzEt8u' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "LCY2vIddlxnA1Vyn", "policyId": "ioJcAPwVHUGcs1AC", "policyVersionId": "MvoY4jWH9dFmOHW0"}, {"isAccepted": false, "localizedPolicyVersionId": "c0cM7ixq8Tjnxp5C", "policyId": "l8ggaEmCcuK2hHvi", "policyVersionId": "BEWpbusO6EyVqstp"}, {"isAccepted": false, "localizedPolicyVersionId": "dh1SiZlOpIQ8GL7j", "policyId": "BF1R5OexAPzCG6ZK", "policyVersionId": "QClGc1636nbfM3J9"}], "authType": "EMAILPASSWD", "code": "40Y62bCo941ALznQ", "country": "uHVskfCjUK8GeX4Q", "dateOfBirth": "0B2Cj0oOmBmXu1Ki", "displayName": "TTiz7yrIvQj2isN7", "emailAddress": "bRwcr16lW5YwgZpj", "password": "lMMtPWg8217m7qNk", "passwordMD5Sum": "QiKp2oac8QTNEuBb", "reachMinimumAge": false, "uniqueDisplayName": "q6ECDD6OGkuLs9gN", "username": "pNon6DKW9A6AmnQT"}' \
    > test.out 2>&1
eval_tap $? 353 'CreateUserFromInvitationV4' test.out

#- 354 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "NFidImWONTvCPMGL", "country": "dbYEknHPKrZ7TiNB", "dateOfBirth": "E0HRsE0GHDOFjrfq", "displayName": "JcyxT2a7fCFAUzLE", "languageTag": "LiM573TdtWjfVciu", "uniqueDisplayName": "LnLsBKGsALPuCOyp", "userName": "hUUAV95708zaP0wp"}' \
    > test.out 2>&1
eval_tap $? 354 'PublicUpdateUserV4' test.out

#- 355 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ZgQEvFzox9wHocX3", "emailAddress": "DRWobEoGr8W97KBe"}' \
    > test.out 2>&1
eval_tap $? 355 'PublicUpdateUserEmailAddressV4' test.out

#- 356 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "dcr6PM51z7i0wQ9e", "country": "gK2t46EG8I2lTviK", "dateOfBirth": "bOgVuN3nhkn6QIes", "displayName": "NoYqvVsakylHikKk", "emailAddress": "pOjqwgKvfXXs8pDq", "password": "m31AZSRkuw6q8Fgq", "reachMinimumAge": true, "uniqueDisplayName": "6RsFK7eYlSU3vYcH", "username": "ZZjFegVnZOn0tk4I", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 356 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 357 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "97u9MVUii4KpYcb1", "password": "AUsESaBOTHnbX9tC", "username": "9PQlFAGbMtEybfcA"}' \
    > test.out 2>&1
eval_tap $? 357 'PublicUpgradeHeadlessAccountV4' test.out

#- 358 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 358 'PublicDisableMyAuthenticatorV4' test.out

#- 359 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'l0mnsAkRT2k0Azdg' \
    > test.out 2>&1
eval_tap $? 359 'PublicEnableMyAuthenticatorV4' test.out

#- 360 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 360 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 361 PublicGetMyBackupCodesV4
eval_tap 0 361 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 362 PublicGenerateMyBackupCodesV4
eval_tap 0 362 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 363 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 363 'PublicDisableMyBackupCodesV4' test.out

#- 364 PublicDownloadMyBackupCodesV4
eval_tap 0 364 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 365 PublicEnableMyBackupCodesV4
eval_tap 0 365 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 366 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 366 'PublicGetBackupCodesV4' test.out

#- 367 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 367 'PublicGenerateBackupCodesV4' test.out

#- 368 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 368 'PublicEnableBackupCodesV4' test.out

#- 369 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'IunRkTxsGdrpNELM' \
    > test.out 2>&1
eval_tap $? 369 'PublicRemoveTrustedDeviceV4' test.out

#- 370 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 370 'PublicSendMyMFAEmailCodeV4' test.out

#- 371 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 371 'PublicDisableMyEmailV4' test.out

#- 372 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code '8Lfkut0wnT24wh59' \
    > test.out 2>&1
eval_tap $? 372 'PublicEnableMyEmailV4' test.out

#- 373 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 373 'PublicGetMyEnabledFactorsV4' test.out

#- 374 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'RGSbBMh7jpszuVk6' \
    > test.out 2>&1
eval_tap $? 374 'PublicMakeFactorMyDefaultV4' test.out

#- 375 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iPdJ2boQqCCyJfTh' \
    > test.out 2>&1
eval_tap $? 375 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 376 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "vCJieqRSGN8Mm74H", "emailAddress": "lSZzp4aEW4GkHG5O", "namespace": "IVuGv47XJpkMiopQ", "namespaceDisplayName": "rVL3ZZTVxqa9XM2g"}' \
    > test.out 2>&1
eval_tap $? 376 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE