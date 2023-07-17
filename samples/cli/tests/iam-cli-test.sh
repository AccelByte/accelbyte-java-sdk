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
echo "1..351"

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

#- 128 RetrieveAllThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'RetrieveAllThirdPartyLoginPlatformCredentialV3' test.out

#- 129 RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 129 'RetrieveAllActiveThirdPartyLoginPlatformCredentialV3' test.out

#- 130 RetrieveAllSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3mDWORBVXTIIJM9X' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sYIIZxiXNMR9BgaW' \
    --body '{"ACSURL": "cFX3SUBhyoTsMWPA", "AWSCognitoRegion": "xUMkawaGpAyrIwMi", "AWSCognitoUserPool": "f3BOdkocVTd4BxqG", "AllowedClients": ["WV6mTJ0sQs6XNbjv", "qhnUVLWu8olKdxL6", "ozRmDD0jJvlfV5Oe"], "AppId": "mPYdYT7DROCjtuzF", "AuthorizationEndpoint": "MbAG9YI89hmguB8F", "ClientId": "OTjMLo4b9rIzqYkE", "Environment": "pstyVTBcrM8rG0rH", "FederationMetadataURL": "0zcswwVeMK6MbGIV", "GenericOauthFlow": true, "IsActive": true, "Issuer": "Gt1ixY5rA1WoVeJI", "JWKSEndpoint": "ePF8ZrQzP4zvtdxd", "KeyID": "bZUpd6FJtHJ1pyVw", "NetflixCertificates": {"encryptedPrivateKey": "yKQLY6FEO65Rb3z7", "encryptedPrivateKeyName": "CYLM8IlsHqffnrfs", "publicCertificate": "GlfPaZKBwa3Ddb60", "publicCertificateName": "ufPpzwj1QGIFmlVf", "rootCertificate": "4jvapseE9LN9bvhO", "rootCertificateName": "rHflIOd6X3viLvtE"}, "OrganizationId": "k4mTIpUA9gxo8SV3", "PlatformName": "8nEhoXmM2W7l6jHM", "RedirectUri": "A2rG3nakopAywelu", "RegisteredDomains": [{"affectedClientIDs": ["01nryEJ0NqoTow0q", "iOiC4j0iktm0ZPLk", "LOsp0LZ5njN86Hl8"], "domain": "kUXzt6bSc6bWvgpV", "namespaces": ["yW9dD1kOmvrAejcq", "2LgkQuaS7RBx3vim", "02jBOxrZDyvpcLYO"], "roleId": "WA8NjxOnaEok4nOO"}, {"affectedClientIDs": ["CzfsflhjbngJOUn1", "8G5MlfDTk8aG40Nl", "ncceIZSwgAIkgzh4"], "domain": "pTU0Am4DZhl0bQxF", "namespaces": ["J3sWCqQpQ2FbKPFM", "ycMSQ4qfAacR0LgB", "5BUXvjcu2s6w3Vif"], "roleId": "nKqmTSoGH1XEfY6Q"}, {"affectedClientIDs": ["AYn6WQ5UBEU1QAOH", "fZiGhxOdcuDXSxSc", "3aZPV87pna08gxef"], "domain": "TYKhuxaEc7M4P7Uc", "namespaces": ["kSC6ePeN8i4GrFES", "9z7xueHpATHccee9", "GXhKcjmSEwdrkEnn"], "roleId": "qKzFsLfYalUlfwEQ"}], "Secret": "KjU7eHGebSVu0LQ4", "TeamID": "0kepEaC4dfiOMZfE", "TokenAuthenticationType": "hHr39pysFO3Zvc1B", "TokenClaimsMapping": {"ZG99LyvfvHEsJKQQ": "ewVLMUoAnaRcYp7F", "UjfIGaffoflEIByY": "qeKN0meGelYF5wWa", "DhukU4khGG4vZFTY": "nPkmSu4PWam1jxR7"}, "TokenEndpoint": "SETWjteoc8fgvZDD", "UserInfoEndpoint": "hoO05oKqymxLD1Lc", "UserInfoHTTPMethod": "vw6T6mZEiwxxElpM", "scopes": ["YSWIeVzm7z9noowm", "lTIKVowi0RY2VN4Z", "ONJREdUQ3z9F1BxN"]}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ngnke4akncw7wu9T' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mXfJWBPrx9Ns8eLz' \
    --body '{"ACSURL": "YEvwSWTaLQjctvrK", "AWSCognitoRegion": "2jhsYpKPlXn77AtY", "AWSCognitoUserPool": "oFzLAATPY8P8P3cf", "AllowedClients": ["oivvQxevecWw7Rry", "0KK5rgAGO0dW8rX2", "MVUGKSZ4GcLkt4pK"], "AppId": "32sJxlZcCTpTdRtC", "AuthorizationEndpoint": "Hvuk6B6XTmSLyn50", "ClientId": "sigBVZxiKdV57GvR", "Environment": "yd9UuL02Le8HSCsl", "FederationMetadataURL": "sDd4M1F5qRIblS7N", "GenericOauthFlow": true, "IsActive": false, "Issuer": "azPAANjfBoldFOyq", "JWKSEndpoint": "A2clJ5gEOaCgM6Yn", "KeyID": "6RugbNEIpGBFUjOn", "NetflixCertificates": {"encryptedPrivateKey": "5mM7k8nbLzvtCIW5", "encryptedPrivateKeyName": "ynMKquUicAeIVXto", "publicCertificate": "WAXhMlW4tLqX7OIC", "publicCertificateName": "f5oD1e6oI9FmYel0", "rootCertificate": "kOw72o8Zkgk0jS6r", "rootCertificateName": "DWUwfhKvrf2AaH4y"}, "OrganizationId": "CWrHSppnIZkNnTn3", "PlatformName": "rzH5NvAtcvNedgS1", "RedirectUri": "fUfKmihDbmu8ePWl", "RegisteredDomains": [{"affectedClientIDs": ["QMVDXEHeiGTnwyEw", "6hIWDZrpP7rz3ISW", "510kHr4isTKWjmv6"], "domain": "7nuHCXWfwnwGioVw", "namespaces": ["VzmmBVVFfpqx1AeL", "tzcPJ3jtDYBo4FUT", "H7CGfKSyxgRR1DiC"], "roleId": "qSMzpqIFGLkDs7AC"}, {"affectedClientIDs": ["C1RgBfoNrHlFi2qJ", "LgmBLE35YhyiDV90", "SeI5yppBHoytVznC"], "domain": "gNyx9fbT63ShEh8P", "namespaces": ["bGikLjgjcj34uulU", "6FYBZsWFbr3RSP0W", "9nBhvhf8Q0DtJMcY"], "roleId": "QdN66bswAgt65X4N"}, {"affectedClientIDs": ["1LQZmB61JMdtwCVU", "rYQue84dwmbwFEnA", "ZaWsQJtRYoagRJK5"], "domain": "PX9UcOvhPyE11TRT", "namespaces": ["2SKseoe8VLie0LBa", "36KNzjf005CXNGeh", "Q2aTjTDfKFDXC7eG"], "roleId": "L5YhJDWh9YWqc0qg"}], "Secret": "V6d9yOfIMLds2DbP", "TeamID": "caoMdtRLTmSvTkQQ", "TokenAuthenticationType": "gB7exYvmHMxr5hPC", "TokenClaimsMapping": {"JJztJBg0tTJg46Ie": "wOXE2AkCh3QIZsUf", "8lGFXcmwTERHclOd": "xIwqejxe18rNdb8O", "tq6j1mqUav7k05HA": "QltnSojV4jT65ycl"}, "TokenEndpoint": "X2FtAz0vJjFIYWOa", "UserInfoEndpoint": "NdsimmkW2miH3xRH", "UserInfoHTTPMethod": "AKy4QxZkaXZ7vmiE", "scopes": ["d0JPxVyQpshaDwNq", "TbbFMXAMfVXe0GZe", "MgsRsmH1EQrYmkPK"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TPOlhTtSiZNCxuog' \
    --body '{"affectedClientIDs": ["FteTHJe4BhSSQkQD", "6WmOt6D7ufFVTOhv", "QpfbBke8aEdd36xj"], "assignedNamespaces": ["6wySoltDxsbzxrla", "KEfkoYjY2o6ouRW9", "UtNquwC3WgumrIz4"], "domain": "NhGztZpr4U4fwQIi", "roleId": "LXgmRasvjO4lj8m3"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XEwP2b4gd3xOeii8' \
    --body '{"domain": "Jnmssep2xD2NY0kA"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BeGs9yxahld1pO0G' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yf5PO3COyMvczgEp' \
    --body '{"acsUrl": "zZ3FbtxfhcRC7IVY", "apiKey": "a6iZ5uFRYNn3SHiW", "appId": "xF0YbuU5ar5qTLWU", "federationMetadataUrl": "Cy0Afgc050XIZRW4", "isActive": false, "redirectUri": "1e94mQjVOOBnIWhu", "secret": "nElqZUodp3IhtCSH", "ssoUrl": "y1ei1fIrPvfHnRN0"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6EjRwEQlNapJRfk4' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'f9Zcw1pEHAyNFxcV' \
    --body '{"acsUrl": "TKuAQTGh5BxjWOoz", "apiKey": "GoDtsUuYo5p8ED5Q", "appId": "ZAufwNa8lzfjv9oY", "federationMetadataUrl": "MXMjlVHY1AHwF3vG", "isActive": false, "redirectUri": "hJCmeisql14mUHVb", "secret": "MPimNhcZsU3VAdMD", "ssoUrl": "cb4qlkiFAamqvZI2"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KwjqPBiWXade41s3' \
    --platformUserId 'rH34mB2yPlRpWjmH' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'ZAAvKTH8MuqIg0Cz' \
    --after '21' \
    --before '4' \
    --limit '14' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'K8QTwiIAvxSvNDlm' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["M5nQFMGzs7fzjgyc", "44mEh9tRk8knYSV3", "0lnroQehMDli6t9u"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["nQLYXxm09wpGAbpE", "mDY9vLh3u6EDsUmr", "V6kH4OotKwG3UC6X"], "isAdmin": true, "namespace": "vBbA6bfbYaJCJjfk", "roles": ["2TUvn95FhO7VW3mb", "DVMDu87t0ldWf7iS", "GIiKFtWtn4Yr2svK"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '88' \
    --platformUserId '6pqLGZ0TBujELAUK' \
    --platformId '6mQ5iZgbwwm5iGzX' \
    > test.out 2>&1
eval_tap $? 146 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 147 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 147 'AdminListUsersV3' test.out

#- 148 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'mvhidwCkZwqjYLfT' \
    --endDate 'iCO1NDBvQvRPnAz4' \
    --limit '97' \
    --offset '33' \
    --platformBy 'zW0CpoBCbyJsF5Ij' \
    --platformId 'F1c0W338HS6CBgVR' \
    --query 'yihYNZ84CVhziXV8' \
    --startDate 'HwSmvcvcDKF19yVR' \
    > test.out 2>&1
eval_tap $? 148 'AdminSearchUserV3' test.out

#- 149 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["afCjOuSYht83AdvB", "aagTiRJ8daGTVX3B", "b7jlz5IfHgKjI9mw"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetBulkUserByEmailAddressV3' test.out

#- 150 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JSrN8jkIykR2zbaI' \
    > test.out 2>&1
eval_tap $? 150 'AdminGetUserByUserIdV3' test.out

#- 151 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6PD7fEscShnGUGUt' \
    --body '{"avatarUrl": "V9GJ279GDbLNwjm3", "country": "FK0nnX2poMfZ1hDH", "dateOfBirth": "tbh4HtMlFgvh2Dp2", "displayName": "SoiIPp1yvfAHS0Vg", "languageTag": "Lu11A3HTovFi4tPA", "userName": "GfleyCA6jEtcqsnz"}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserV3' test.out

#- 152 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oVILjkwW61duF87a' \
    --activeOnly  \
    --after 'Uyrdt4XSpWBAetsa' \
    --before 'nzqP8oxfrtbECD1C' \
    --limit '86' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetUserBanV3' test.out

#- 153 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QUAxJrINPXppPNO3' \
    --body '{"ban": "AfmXcgwC3IN6tvKg", "comment": "LB9QmJIOq9dP5szG", "endDate": "71utjsQ4CrRb9gUC", "reason": "eVz7fWbZIdhevfZv", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 153 'AdminBanUserV3' test.out

#- 154 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId '4U3WeYeA9t2ENKKW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rFtHIi1CMgKAOG5i' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 154 'AdminUpdateUserBanV3' test.out

#- 155 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cCR5PbCvDLil8wj9' \
    --body '{"context": "cKM3Ar6MF35hCER4", "emailAddress": "nGmWGgTJfHlJl4tH", "languageTag": "Ga4XfZcd9CVnGqMX"}' \
    > test.out 2>&1
eval_tap $? 155 'AdminSendVerificationCodeV3' test.out

#- 156 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9FieeEssWEUl07bh' \
    --body '{"Code": "wntCVqiYOJf5KwMZ", "ContactType": "QjzvjSozv6CTRDl0", "LanguageTag": "zp9CzHFwinkBNi4g", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 156 'AdminVerifyAccountV3' test.out

#- 157 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'BDdSzBXdxapwhd5I' \
    > test.out 2>&1
eval_tap $? 157 'GetUserVerificationCode' test.out

#- 158 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QYBQuxLvPuWYvE3f' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserDeletionStatusV3' test.out

#- 159 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sNy9Z9OhxXvCp9y7' \
    --body '{"deletionDate": 10, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpdateUserDeletionStatusV3' test.out

#- 160 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LD2qfCXnlUnqxT1W' \
    --body '{"code": "sRNMZcA92hzC7MNa", "country": "8vVe4MHX6AgMep90", "dateOfBirth": "AyyUJyAK5PRMRMwd", "displayName": "vl0hv6g62GxBW2tQ", "emailAddress": "F5tkTjgJaMYvNQOs", "password": "Da4bkcgepqtxjbrz", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpgradeHeadlessAccountV3' test.out

#- 161 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JunZPkp6ccIBnWyP' \
    > test.out 2>&1
eval_tap $? 161 'AdminDeleteUserInformationV3' test.out

#- 162 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'w8mj7gyQ7XdIszGR' \
    --after '0.15452430448048216' \
    --before '0.9077203996459539' \
    --limit '58' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetUserLoginHistoriesV3' test.out

#- 163 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eQAe1rzmmgqBPRmd' \
    --body '{"languageTag": "6mO4oI8KDqebm83r", "newPassword": "aNBJ5y7axEkvI4ox", "oldPassword": "ZEDxGiBnNbn0zaf7"}' \
    > test.out 2>&1
eval_tap $? 163 'AdminResetPasswordV3' test.out

#- 164 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CaOSlHXrUSA6sMJz' \
    --body '{"Permissions": [{"Action": 55, "Resource": "IwEsdOGBXBwnzDX8", "SchedAction": 44, "SchedCron": "WznDe4LQdXfFBii2", "SchedRange": ["RAMEX5RMjBFVZGYz", "QqV8d9mDdUIoiIJF", "NxuNOmUSWw18T1Ix"]}, {"Action": 98, "Resource": "dkaZ3y6i38XQjLDR", "SchedAction": 33, "SchedCron": "8xj1LyEirURERnEM", "SchedRange": ["zpImW6sjAHyCK5tN", "anGBrkzUvck3xTtm", "OFMebS4AdlNzwog2"]}, {"Action": 70, "Resource": "m77TTh4gUoj8u2WR", "SchedAction": 5, "SchedCron": "zL9SkbLlrNXnGanM", "SchedRange": ["azb8jvRWenURH48a", "JuALEcSqcE15u6D3", "1DjOsrs3CUYATdqn"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserPermissionV3' test.out

#- 165 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QGbqiqOkNeATj7eG' \
    --body '{"Permissions": [{"Action": 19, "Resource": "kjzyBB4UFKiaoV0V", "SchedAction": 82, "SchedCron": "5kypNrp2nFe9FmN8", "SchedRange": ["6sK5LOq4ft5jGcMI", "CPUYnfG6jl9U4jRe", "teIMgzISomCsodJr"]}, {"Action": 15, "Resource": "XXOmqFHLbyXmgCNi", "SchedAction": 1, "SchedCron": "H8uenbC5CphgMwee", "SchedRange": ["xsIAP5vHLjBJ9iqM", "cBL4BzhDUjhKPwbw", "cvQU5kG8bXGFmPAn"]}, {"Action": 83, "Resource": "iJ66OzOj84O6tgoh", "SchedAction": 19, "SchedCron": "3YVeOWs9mfVQh3jL", "SchedRange": ["Btn9pxpE7BYtzB0B", "4CxyQrUpIFvORxTi", "79DpSjb39ukcR6c2"]}]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminAddUserPermissionsV3' test.out

#- 166 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'E2r3vk3IfAKEbqcN' \
    --body '[{"Action": 80, "Resource": "SGCCvNowNmdpcJgF"}, {"Action": 88, "Resource": "8ySNq4Mj7mulP4tQ"}, {"Action": 61, "Resource": "R1OqKVOTniBgLsNh"}]' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionBulkV3' test.out

#- 167 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '8' \
    --namespace "$AB_NAMESPACE" \
    --resource '975nARHCmhNHSXuq' \
    --userId 'IHsxvaUoXDmwWsuk' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserPermissionV3' test.out

#- 168 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xncuD3QxCXMd00YB' \
    --after 'WCaVVmM45mfIZsWh' \
    --before 'kS476dGGJwJ00UH1' \
    --limit '34' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserPlatformAccountsV3' test.out

#- 169 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '7MJ6zU7JLMQyMWzY' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetListJusticePlatformAccounts' test.out

#- 170 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'QCAaPJgoxGJoJaSz' \
    --userId 'UtY4ZD0Xtb0U4pH1' \
    > test.out 2>&1
eval_tap $? 170 'AdminGetUserMapping' test.out

#- 171 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '6NUsVY21NVIs7NRe' \
    --userId 'n2Y3Ns0QJQeaWytP' \
    > test.out 2>&1
eval_tap $? 171 'AdminCreateJusticeUser' test.out

#- 172 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'fds1BYx0EaURydf8' \
    --body '{"platformId": "ZyyZeHAWGgJUbUJR", "platformUserId": "MbkcTglbU86FyOjA"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminLinkPlatformAccount' test.out

#- 173 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pNHBVfNOURcjY3YY' \
    --userId 'T9oTynmfIuBWgJTN' \
    --body '{"platformNamespace": "FfM8M0IW4oe8KDgy"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformUnlinkV3' test.out

#- 174 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0xZfAcNg14Ws8TIP' \
    --userId '1LKiFQoLDvumfqrg' \
    --ticket 'Sfnx2h61X9dN1MGR' \
    > test.out 2>&1
eval_tap $? 174 'AdminPlatformLinkV3' test.out

#- 175 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XBJ6mVV7JS9qjNLw' \
    --userId 'vI8JdiY3RRiLilmO' \
    --platformToken 'GF6dLLIeIVIjMcdl' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 176 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bdRXTGIrdNL5gJPq' \
    --userId 'TAjgqaTHf1ANTJ9Y' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetUserSinglePlatformAccount' test.out

#- 177 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'k997XkGOdC6ItxDT' \
    --body '["8p4n4XCFkD1AJLCw", "szbZxuHSgDOK8bjo", "F7bL2635KbtZTGJp"]' \
    > test.out 2>&1
eval_tap $? 177 'AdminDeleteUserRolesV3' test.out

#- 178 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qgl2IzNXGTuQPIDp' \
    --body '[{"namespace": "or7t1aJLNNz6QIVC", "roleId": "9Mfuc8VOsnmnlVlj"}, {"namespace": "dWYmELe74p38vumn", "roleId": "xAnYBTxaTIz0jcgD"}, {"namespace": "I8Pkz96vd80msqIm", "roleId": "5bufnBqrpLeqhwVh"}]' \
    > test.out 2>&1
eval_tap $? 178 'AdminSaveUserRoleV3' test.out

#- 179 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'jnnjKMEmtbiWsAQH' \
    --userId 'bMrKYi0Zxs5SWCqZ' \
    > test.out 2>&1
eval_tap $? 179 'AdminAddUserRoleV3' test.out

#- 180 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'XHLLa31oQf7BULnZ' \
    --userId 'DhutDM6BqguqD5xx' \
    > test.out 2>&1
eval_tap $? 180 'AdminDeleteUserRoleV3' test.out

#- 181 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GxBWtnTKUe2znsqP' \
    --body '{"enabled": true, "reason": "qlkL0diRhLC10ih2"}' \
    > test.out 2>&1
eval_tap $? 181 'AdminUpdateUserStatusV3' test.out

#- 182 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EQfY3XCv4hdOa6Fd' \
    > test.out 2>&1
eval_tap $? 182 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 183 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'ZhNMd1onFjGRbxtA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "BPXDmgNEJBhgGq5G"}' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateClientSecretV3' test.out

#- 184 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'IDhNC66szbCCf73I' \
    --before 'FbRkPSSITz4TjCrJ' \
    --isWildcard  \
    --limit '69' \
    > test.out 2>&1
eval_tap $? 184 'AdminGetRolesV3' test.out

#- 185 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "managers": [{"displayName": "dOTacCcJfIfXshuL", "namespace": "Uk5WdpxjZx5noXPh", "userId": "PUTKbonoucNmzwOZ"}, {"displayName": "OK56sDkci5rZ8iMl", "namespace": "OuksQJCiRFiZWwJ7", "userId": "NrTb1XTB9YQzUJ9X"}, {"displayName": "lYJ8BzP6EUmUXGM5", "namespace": "anIloyj9lhbvuQdW", "userId": "2jwKUckc794ryY91"}], "members": [{"displayName": "lX8DD4MYXlrJ81lH", "namespace": "vv9rqvEoM8YmVjAk", "userId": "O3HKsEp6KlqwW4dj"}, {"displayName": "rexcbHdEtoQvpV34", "namespace": "4RctmTozCi8HeV6j", "userId": "balHmqBBfi7sSF5B"}, {"displayName": "oGiTCVsXsygWbjE2", "namespace": "opXtdsJQeJ1too0q", "userId": "vxphTLEEBGTtZyTj"}], "permissions": [{"action": 7, "resource": "VheJjoEEXBLIxGnN", "schedAction": 41, "schedCron": "1YtxIq73aMb48jIS", "schedRange": ["d97KORRhxSWLWLNf", "HRD3V15QaGGL46Lu", "xJF3sbeqWBdQuWfg"]}, {"action": 57, "resource": "gSZZNUHbIT9szApm", "schedAction": 100, "schedCron": "koMUZn1YXj5zFZeO", "schedRange": ["COR9NvBQZSJPOIKr", "RBrYVzi9ui3lvozT", "t9TsH7A0TuU2aL4b"]}, {"action": 84, "resource": "AziBOHEAj1cT3u6Z", "schedAction": 5, "schedCron": "uVJ0BJfZ0jvA54CS", "schedRange": ["qZFDsO1skRjOU1SM", "fQVQa6blj9Rdd85b", "dYUumPKVSZCg3XTc"]}], "roleName": "9vQe0dHJfF6KIuvn"}' \
    > test.out 2>&1
eval_tap $? 185 'AdminCreateRoleV3' test.out

#- 186 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'RCa9JktyBdxkZKrE' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetRoleV3' test.out

#- 187 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'WFw9GYxjiiOQAD77' \
    > test.out 2>&1
eval_tap $? 187 'AdminDeleteRoleV3' test.out

#- 188 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'ci0vfWVZoRRMPi57' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "KKz5nyI6ulKNKoXa"}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateRoleV3' test.out

#- 189 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId '0dgx1JgjC56pda3Y' \
    > test.out 2>&1
eval_tap $? 189 'AdminGetRoleAdminStatusV3' test.out

#- 190 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'htQxpCYME6x21pdX' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpdateAdminRoleStatusV3' test.out

#- 191 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '2QSPAd9sxoLnWGP1' \
    > test.out 2>&1
eval_tap $? 191 'AdminRemoveRoleAdminV3' test.out

#- 192 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'PafIjLX8ce0KbNN7' \
    --after 'Ycl2JfmQplvGjVQ4' \
    --before 'aebjfgGu472oWJlf' \
    --limit '12' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetRoleManagersV3' test.out

#- 193 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'ydCOInVolsr6CHmj' \
    --body '{"managers": [{"displayName": "763vLwtYEJTSiXjc", "namespace": "Y5ZPkv90lyKSTWLx", "userId": "SFZ0LpupEi5DbkVs"}, {"displayName": "3qFTi1t530Wj1Wfz", "namespace": "Ivc3VlSXrA3XUGud", "userId": "4tVjmxEf4XvVhFJT"}, {"displayName": "xFHITBg9x4unq3eO", "namespace": "MHIKeTyBG5dCUoEx", "userId": "nKfV3869IN4V1Odh"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminAddRoleManagersV3' test.out

#- 194 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'H4GVU7Exlkmc4xYi' \
    --body '{"managers": [{"displayName": "LjLyZrXr9Bhtzn8j", "namespace": "AdTn6xBhrciryLm6", "userId": "7rkadH5Y41SLjCPr"}, {"displayName": "Fa05Xl5TPC5GODS4", "namespace": "4bmm7jPdKLddfdsU", "userId": "qjXVzW1QqxnWR5sh"}, {"displayName": "eLgsAF4ctv5guycG", "namespace": "iq9j2EyIknfLDpgH", "userId": "nMOn8nc3gUZ8ZFyy"}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminRemoveRoleManagersV3' test.out

#- 195 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'Er0KBXuJBqK4QtEy' \
    --after 'dPWLPBYiR3UbJc1Z' \
    --before 'Yapx7C477etqgfOJ' \
    --limit '60' \
    > test.out 2>&1
eval_tap $? 195 'AdminGetRoleMembersV3' test.out

#- 196 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'FNEL3uWVRz3V7YbJ' \
    --body '{"members": [{"displayName": "M3bNLWHAbCZixe2c", "namespace": "Q6O30lpzcBQMAEcN", "userId": "cJqrKxnMzSYoc4Zj"}, {"displayName": "iMY4H34B6wVd8ipc", "namespace": "KDwQeUWtjCC2UH6j", "userId": "zMO3AfmOS5mQNyRP"}, {"displayName": "ZFPNP56l1AT6OLKm", "namespace": "ZhCZxxPPdPwOtEuW", "userId": "BSO2jJepUnEEgja2"}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminAddRoleMembersV3' test.out

#- 197 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'mIE2kLTnJwc5XmkC' \
    --body '{"members": [{"displayName": "uL5W4tKt6G3j9LYd", "namespace": "G7xVPqBqe9RDQMBS", "userId": "YAFLqp8PF5hCcouk"}, {"displayName": "Wpnbz4ys7j6lxuU3", "namespace": "u2HEG0qfKegvFTD1", "userId": "sPykS8YLmwtYgWGc"}, {"displayName": "A0h4G1LZ1HaX5UBM", "namespace": "bsF44VTsLDRzdq22", "userId": "cbnyK3ggFDh2kaZP"}]}' \
    > test.out 2>&1
eval_tap $? 197 'AdminRemoveRoleMembersV3' test.out

#- 198 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId '7pnnVfxPwc259HF9' \
    --body '{"permissions": [{"action": 9, "resource": "Z1uqh7GAi4FEIu44", "schedAction": 42, "schedCron": "qMv824ouSgkpK70u", "schedRange": ["JmUL0uzElixc023d", "IvDiA0tQWlHwBcTt", "ztx3VAl6tXFbnATC"]}, {"action": 52, "resource": "cbGWmKgE8CZ4AELr", "schedAction": 45, "schedCron": "lraa5v5P5Cj8hgFs", "schedRange": ["qHC9h5JPiMEtgKui", "GTYgwWv5XldL6rOV", "GcRAn51rVAQSxp4q"]}, {"action": 93, "resource": "JbQ3Fj1umx4ItzkM", "schedAction": 73, "schedCron": "mLYsHooOIaxIpb1c", "schedRange": ["IOJPS3lJ80YJ41U4", "ooQ980ywmg1pWpWi", "t1QC7FKe0fnHUlmU"]}]}' \
    > test.out 2>&1
eval_tap $? 198 'AdminUpdateRolePermissionsV3' test.out

#- 199 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId '1unGKM0tgfeWy47b' \
    --body '{"permissions": [{"action": 2, "resource": "CvX1nwvSWdDwD7WJ", "schedAction": 68, "schedCron": "wBNrFXt3TAuKBwBc", "schedRange": ["D12ae6r3hHwya4Np", "dOzg3hr6ucHf7dbh", "2iKNUl0qJqzoKMRM"]}, {"action": 68, "resource": "OlscRIWw82k5K5VT", "schedAction": 22, "schedCron": "NXLMUaDSwwQlnNRZ", "schedRange": ["JHBSB4fZWEFIZs28", "Ff1kZp1Zktx3N7WN", "MYIfcDKbLu8pnK34"]}, {"action": 29, "resource": "PdQhim9QKUAFTVYe", "schedAction": 23, "schedCron": "djMBahFZZGMTcqnW", "schedRange": ["rIprOv0BJ9Sgl7H1", "sdH2RIJz1eI7Q5pu", "9PutLf6IrvZoBGQb"]}]}' \
    > test.out 2>&1
eval_tap $? 199 'AdminAddRolePermissionsV3' test.out

#- 200 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'O4S3rURGWUzPAE6S' \
    --body '["dV4D5jftRl9rZmtQ", "Uvro8TWwXWsz9TVm", "dMKEohKzuMYDUTLB"]' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteRolePermissionsV3' test.out

#- 201 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '10' \
    --resource 't2DkUt3yexZBRvxY' \
    --roleId 'nEBhXtAVxCd3meTr' \
    > test.out 2>&1
eval_tap $? 201 'AdminDeleteRolePermissionV3' test.out

#- 202 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 202 'AdminGetMyUserV3' test.out

#- 203 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'T7cF9oVCh89wNOkK' \
    --extendExp  \
    --redirectUri 'YssVejcL3kR3hCGN' \
    --password 'gaJmuALlMQl9RLrt' \
    --requestId 'hbfp0VgweLlT2sY3' \
    --userName 'SsTnDQY7kKU2u06Q' \
    > test.out 2>&1
eval_tap $? 203 'UserAuthenticationV3' test.out

#- 204 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '4veujxtyQENvJrBC' \
    --linkingToken 'qeg67d4RWOqO4U0b' \
    --password 'itNQLzwRoWnR0Abk' \
    --username 'CPY70FmvviVIBbcu' \
    > test.out 2>&1
eval_tap $? 204 'AuthenticationWithPlatformLinkV3' test.out

#- 205 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'jF8Vk5qb8NhWWwax' \
    --extendExp  \
    --linkingToken 'yMchkt8l5IPSrwrJ' \
    > test.out 2>&1
eval_tap $? 205 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 206 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'l7wYIVw13NCo9yXl' \
    > test.out 2>&1
eval_tap $? 206 'RequestOneTimeLinkingCodeV3' test.out

#- 207 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'bQ52FTHTCj6SEAzT' \
    > test.out 2>&1
eval_tap $? 207 'ValidateOneTimeLinkingCodeV3' test.out

#- 208 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData '7TOpyiuvvQUm29Ia' \
    --isTransient  \
    --clientId 'cq4XRLaA643nTMtX' \
    --oneTimeLinkCode 'SAyejnny0Ju13b6o' \
    > test.out 2>&1
eval_tap $? 208 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 209 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 209 'GetCountryLocationV3' test.out

#- 210 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 210 'Logout' test.out

#- 211 RequestGameTokenCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenCodeResponseV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId '5uB2XM6IHy7EEvHy' \
    > test.out 2>&1
eval_tap $? 211 'RequestGameTokenCodeResponseV3' test.out

#- 212 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LmcvrZZOdwe1x8Rj' \
    --userId 'U6Bi8JXE52sUBBq2' \
    > test.out 2>&1
eval_tap $? 212 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 213 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SimQQoLbe5YOJvxG' \
    > test.out 2>&1
eval_tap $? 213 'RevokeUserV3' test.out

#- 214 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'RxUzrTwagH7BMT1I' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'KTdNFVBQ1crBXAup' \
    --redirectUri 'ATO8uXsqVpdiWo8S' \
    --scope 'jDAM0Riw8wLYW3n4' \
    --state 'F3LD1EDwBXw5uBYe' \
    --targetAuthPage 'QZOzATNSV9E9yyNb' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId '7yaLXzAVYymOuhCk' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 214 'AuthorizeV3' test.out

#- 215 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'u4htrsf8eIFSovTG' \
    > test.out 2>&1
eval_tap $? 215 'TokenIntrospectionV3' test.out

#- 216 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 216 'GetJWKSV3' test.out

#- 217 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'XaMsq8ePN1oco2jx' \
    --factor '8Upe8SjMvpqM8pug' \
    --mfaToken 'gOEdG47gD5i2Ni6A' \
    > test.out 2>&1
eval_tap $? 217 'SendMFAAuthenticationCode' test.out

#- 218 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'nWn3NdEPhNHSH7eK' \
    --mfaToken 'DfRcngEpTnRUQr3R' \
    > test.out 2>&1
eval_tap $? 218 'Change2faMethod' test.out

#- 219 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'LOM1vEx4gqDY6jwy' \
    --factor 'KRxhkLe5zohg9s9u' \
    --mfaToken 'tRQt28b6o3K0COF7' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 219 'Verify2faCode' test.out

#- 220 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4tz6aeXZOYwbwjMN' \
    --userId 'dxKWlBfnRyFS0Ed7' \
    > test.out 2>&1
eval_tap $? 220 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 221 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'gTM5AVrtBQiDTcNn' \
    --clientId 'Za6Zuxk6u6HXXdiC' \
    --redirectUri '9ZDj4E4mv12FNXyp' \
    --requestId 'oOLl13j84P0KqirJ' \
    > test.out 2>&1
eval_tap $? 221 'AuthCodeRequestV3' test.out

#- 222 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId '4PkMFtsnFfz8Ew0X' \
    --additionalData '8fBuBSKLSQ4GvLtz' \
    --clientId '50D3rpBfBovqLwXB' \
    --createHeadless  \
    --deviceId 'uT30EYeRj17xGhaB' \
    --macAddress 'KoUfiHjGmCyPsKCJ' \
    --platformToken 'Tv1ic9gvagF2cSuz' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 222 'PlatformTokenGrantV3' test.out

#- 223 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 223 'GetRevocationListV3' test.out

#- 224 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'tsJ5tj64gV7nmDk2' \
    > test.out 2>&1
eval_tap $? 224 'TokenRevocationV3' test.out

#- 225 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData '9mcjSuz9vbNStqPt' \
    --clientId 'QmQN6eKAGiZFCftT' \
    --code '0RWECdjWYrnulxcC' \
    --codeVerifier 'KAru8pOaAVLDB4k3' \
    --extendExp  \
    --password 'JwkdaxR7GJpYmuYC' \
    --redirectUri 'PG181q9GA5DydC2D' \
    --refreshToken '8UT6KOc4VPDUR9ay' \
    --username 'azqXRqegIUicYXXz' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 225 'TokenGrantV3' test.out

#- 226 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'xF6HtlER2txs4qrN' \
    > test.out 2>&1
eval_tap $? 226 'VerifyTokenV3' test.out

#- 227 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'ARATn6KXOutlYBbL' \
    --code 'hL8KXx25FZfQIodV' \
    --error 'BqQsBpCJBIXLGYcw' \
    --openidAssocHandle 'WVRK6UKk5ozrXA4H' \
    --openidClaimedId 'ZHNyq9odanhR1Zrm' \
    --openidIdentity '3thUvV87yfkycLSV' \
    --openidMode 'dleSaAylsmLYe2ph' \
    --openidNs 'YOgT5kDTyPl3dKF7' \
    --openidOpEndpoint 'NXEjrJMki8jvc3P8' \
    --openidResponseNonce 'Gwjg3IOH0SDHgYKq' \
    --openidReturnTo 'xJiFJdrmj5vhzgsJ' \
    --openidSig 'wex7wq8ZPlXNaUNg' \
    --openidSigned 'dY2vfJuje5cPnmGj' \
    --state 'TvYa5Pqx1K7qcAoi' \
    > test.out 2>&1
eval_tap $? 227 'PlatformAuthenticationV3' test.out

#- 228 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'jBPAp6EPb988Nzxr' \
    > test.out 2>&1
eval_tap $? 228 'PublicGetInputValidations' test.out

#- 229 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'DKVpULjjiw3NeVG4' \
    > test.out 2>&1
eval_tap $? 229 'PublicGetInputValidationByField' test.out

#- 230 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'DJi9DaMrc0WFgKjE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 230 'PublicGetCountryAgeRestrictionV3' test.out

#- 231 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 231 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 232 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId '945x2CPVYYG9WvoG' \
    > test.out 2>&1
eval_tap $? 232 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 233 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mAmvaVV5YfxnUNcw' \
    --rawPUID  \
    --body '{"platformUserIds": ["jr7gSGhnfuF4WZiQ", "VICVpWd3UM08gMXh", "df3juXW4JprIb3CJ"]}' \
    > test.out 2>&1
eval_tap $? 233 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 234 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CAtvSG8Cfa9dzOJD' \
    --platformUserId 'GCTHIOFjeXbsSgR4' \
    > test.out 2>&1
eval_tap $? 234 'PublicGetUserByPlatformUserIDV3' test.out

#- 235 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId '3kIDzxBwqRJTzrHN' \
    > test.out 2>&1
eval_tap $? 235 'PublicGetAsyncStatus' test.out

#- 236 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'ZWUsq5lQo2jy29EJ' \
    --limit '16' \
    --offset '4' \
    --query 'gqYhyVhURx1yPecz' \
    > test.out 2>&1
eval_tap $? 236 'PublicSearchUserV3' test.out

#- 237 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "Rpdk0HATGylx2JG2", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "NGfhzfCTxxrsRRLe", "policyId": "e3TcJ7DQIi45aCDH", "policyVersionId": "N9mVug2zkVf6KgpK"}, {"isAccepted": false, "localizedPolicyVersionId": "lbYHtbPtaxvagSlp", "policyId": "GgVTF6VeDAPOGBww", "policyVersionId": "eyFfXEOEAEtbag82"}, {"isAccepted": true, "localizedPolicyVersionId": "gBgyCd5vjkfz3eR4", "policyId": "DtNp129hzBw3xLUc", "policyVersionId": "CEt0DzmkJq1sml5b"}], "authType": "Yt76BNsi4giR9434", "code": "WpKKdzxoufCNlFoO", "country": "cWQQy4bjmQeEweoB", "dateOfBirth": "HTdwAk7ZQnbqY1cQ", "displayName": "wVEtAr5kKKAo9MM2", "emailAddress": "Cqm84jVi9kIpqgrz", "password": "pUkNOBWydXV0Fi02", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 237 'PublicCreateUserV3' test.out

#- 238 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'jj3b8QM8Rr45ULqX' \
    --query 'QgvwD3PsKDJiWxQB' \
    > test.out 2>&1
eval_tap $? 238 'CheckUserAvailability' test.out

#- 239 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["waS7rDBf2S54phbd", "yGDt47f9GWRlE9hq", "z6rjDNo4rhjxUdMM"]}' \
    > test.out 2>&1
eval_tap $? 239 'PublicBulkGetUsers' test.out

#- 240 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "83WekqfWv04vvn9b", "languageTag": "k5qr8qs2mqtnGAqX"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicSendRegistrationCode' test.out

#- 241 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "UjNypF6MMqWpdEJs", "emailAddress": "PoaIbYz8cK5jlpJd"}' \
    > test.out 2>&1
eval_tap $? 241 'PublicVerifyRegistrationCode' test.out

#- 242 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "re5ur6yvWJDdvM7T", "languageTag": "7PX2vamIRZHzsIYO"}' \
    > test.out 2>&1
eval_tap $? 242 'PublicForgotPasswordV3' test.out

#- 243 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'CUoiCXNjrdQL2jdx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 243 'GetAdminInvitationV3' test.out

#- 244 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId '1eIba1sB0HsJ06Dz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "kWZbjf7GZxaossQm", "policyId": "jo69wohJFyTNk5FG", "policyVersionId": "UPhR4LEZvz3EjFR7"}, {"isAccepted": true, "localizedPolicyVersionId": "g5m4axDV5uTcYsoa", "policyId": "hUrELQ1btjJOqQMg", "policyVersionId": "ZWAU6E92nHJzvw7t"}, {"isAccepted": false, "localizedPolicyVersionId": "9Z1JBrHRzEOtIxzP", "policyId": "qb6n73m0jiaDH86d", "policyVersionId": "9rsKgzCsMulpB8HZ"}], "authType": "EMAILPASSWD", "country": "tVVaJCiLgKOwrSfW", "dateOfBirth": "hT5B4WedopzwSluB", "displayName": "tRFPKThyGnbjmPDK", "password": "FS6u9FHuv1M3qfch", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 244 'CreateUserFromInvitationV3' test.out

#- 245 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "qGEg5fNzBVrjo3g8", "country": "CfRwtyl1HeT7VEPg", "dateOfBirth": "G40QyXzsOzgck078", "displayName": "IghoQBp2mWAOYksc", "languageTag": "zxBS0OBCa2vWadLm", "userName": "QtYKmEMzicbuL2S3"}' \
    > test.out 2>&1
eval_tap $? 245 'UpdateUserV3' test.out

#- 246 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "RiW8dLTCBfGUdVEd", "country": "vdQL7sVwcZ2PofaJ", "dateOfBirth": "oSqtrEOqxH46fRTS", "displayName": "ZoDdT0fefo74eg3N", "languageTag": "t2c0r4GqF0NHglOV", "userName": "uNZ9LzNeJnBurh54"}' \
    > test.out 2>&1
eval_tap $? 246 'PublicPartialUpdateUserV3' test.out

#- 247 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "CWbYb0Pebyt8b4DG", "emailAddress": "scjwrizsFUgYwbaL", "languageTag": "vqvQ2NbmDITuymTB"}' \
    > test.out 2>&1
eval_tap $? 247 'PublicSendVerificationCodeV3' test.out

#- 248 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "jn3d2sFzMS3QaVjZ", "contactType": "F7Ax6115Kg9U8vrQ", "languageTag": "JXQxoIbVi2CLEk27", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 248 'PublicUserVerificationV3' test.out

#- 249 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Ivjj1A647XQ3koaA", "country": "fZIim0sFPm1YN27b", "dateOfBirth": "ojDVaZLpx4kEWYkO", "displayName": "6KrKUMhJrASBh61h", "emailAddress": "mWKSSrF35anDGvur", "password": "19V18oIrUKXttgAI", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 249 'PublicUpgradeHeadlessAccountV3' test.out

#- 250 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "aXFpff28uYbe4Cf2", "password": "HEHvVevhISjbtBJU"}' \
    > test.out 2>&1
eval_tap $? 250 'PublicVerifyHeadlessAccountV3' test.out

#- 251 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "K5fE3OufPSX3PdOU", "newPassword": "2V9yw94oa8UJ34TI", "oldPassword": "edV3HyoX4VnO2LpB"}' \
    > test.out 2>&1
eval_tap $? 251 'PublicUpdatePasswordV3' test.out

#- 252 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'U08wfnlHBXFIqFUm' \
    > test.out 2>&1
eval_tap $? 252 'PublicCreateJusticeUser' test.out

#- 253 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gUSMM5au8GJT0mkV' \
    --redirectUri 'PI6zUtf3QaJPGrTN' \
    --ticket 'cXXTUIggoH89QNmI' \
    > test.out 2>&1
eval_tap $? 253 'PublicPlatformLinkV3' test.out

#- 254 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '17UDb19R6H7r1ta3' \
    --body '{"platformNamespace": "m7jK5pxe82pgFiAS"}' \
    > test.out 2>&1
eval_tap $? 254 'PublicPlatformUnlinkV3' test.out

#- 255 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6piIzmc8rKrKEPGS' \
    > test.out 2>&1
eval_tap $? 255 'PublicPlatformUnlinkAllV3' test.out

#- 256 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Acong6eNERUf8kjc' \
    --ticket 'i1Ctccv9Gv4tOcbn' \
    > test.out 2>&1
eval_tap $? 256 'PublicForcePlatformLinkV3' test.out

#- 257 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uCqf0lm6WBkIzjoS' \
    --clientId 'V31tvmMB6jzrpRGE' \
    --redirectUri 'SmooHiCV4GUOnXpa' \
    > test.out 2>&1
eval_tap $? 257 'PublicWebLinkPlatform' test.out

#- 258 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pXQGRakUbcG7PcR4' \
    --code 'eiU3Idi55jNrGNT2' \
    --state 'VHTKuIT5FwwHj0Ur' \
    > test.out 2>&1
eval_tap $? 258 'PublicWebLinkPlatformEstablish' test.out

#- 259 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "5F2PWGTTD81xhNP4", "emailAddress": "t6kYBUjyXAn3bWQF", "newPassword": "6QcAiJpXIrgroixp"}' \
    > test.out 2>&1
eval_tap $? 259 'ResetPasswordV3' test.out

#- 260 PublicGetUserByUserIdV3
eval_tap 0 260 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 261 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tZhckUTGkcBOE4qM' \
    --activeOnly  \
    --after 'cH1Kyi8ZFvGcV8DY' \
    --before '0XOkDstxZcY1HgAn' \
    --limit '17' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetUserBanHistoryV3' test.out

#- 262 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'V4IOglVLqb9lGAJU' \
    > test.out 2>&1
eval_tap $? 262 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 263 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'g21Lt7JwgwMUSuC3' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetUserInformationV3' test.out

#- 264 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bajy3BcEMCtQs2Fc' \
    --after '0.49717868697652035' \
    --before '0.03801456353761823' \
    --limit '44' \
    > test.out 2>&1
eval_tap $? 264 'PublicGetUserLoginHistoriesV3' test.out

#- 265 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'a2FPBujX0geYCpGJ' \
    --after 'M4sqsPNJMiZXXOFw' \
    --before 'mGWAvNF0Z0GkwxUN' \
    --limit '21' \
    > test.out 2>&1
eval_tap $? 265 'PublicGetUserPlatformAccountsV3' test.out

#- 266 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yNwGiKrknH0Y5mrQ' \
    > test.out 2>&1
eval_tap $? 266 'PublicListJusticePlatformAccountsV3' test.out

#- 267 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'gLC6D2qsFiQHglUQ' \
    --body '{"platformId": "MZi5WjMZfOadpgeg", "platformUserId": "CUjTdi1Ehr8OtqpN"}' \
    > test.out 2>&1
eval_tap $? 267 'PublicLinkPlatformAccount' test.out

#- 268 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'J9R8TuNy4ejmVA3v' \
    --body '{"chosenNamespaces": ["MCsGyPd12B8QNUz0", "hFFNbH6j2W4roZM2", "UKAXEEsL5D0oiFch"], "requestId": "QnVeq3g2AB2WIRUQ"}' \
    > test.out 2>&1
eval_tap $? 268 'PublicForceLinkPlatformWithProgression' test.out

#- 269 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mauIY5HXCZ0W4XmW' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetPublisherUserV3' test.out

#- 270 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'P0HzSdiylLhVYszm' \
    --password '8xY33OQbumu2QHLy' \
    > test.out 2>&1
eval_tap $? 270 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 271 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'ZNuysyM4OfCzdQCX' \
    --before 'MAWnf87YPNOe9Eev' \
    --isWildcard  \
    --limit '10' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetRolesV3' test.out

#- 272 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'ZRyR9AX7JjxvNZhM' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetRoleV3' test.out

#- 273 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 273 'PublicGetMyUserV3' test.out

#- 274 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode '84DiZk6ySrB9SVFc' \
    > test.out 2>&1
eval_tap $? 274 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 275 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["tW7YS0OkL78XeEAt", "ALFI3v8yha4pd5A7", "MYcpBD6lKNb8RxvN"], "oneTimeLinkCode": "2u5J7baOeLH19fqB"}' \
    > test.out 2>&1
eval_tap $? 275 'LinkHeadlessAccountToMyAccountV3' test.out

#- 276 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "wNbNe1ffYRtIvQaK"}' \
    > test.out 2>&1
eval_tap $? 276 'PublicSendVerificationLinkV3' test.out

#- 277 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'yevWYtZjK6J29v8M' \
    > test.out 2>&1
eval_tap $? 277 'PublicVerifyUserByLinkV3' test.out

#- 278 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'pBSpo3AKRmnJkzJH' \
    --code 'AckUyBksYQfDm0RN' \
    --error 'Fwiz70tRVLMlHi8i' \
    --state '9gOVqajUWrgEsWDt' \
    > test.out 2>&1
eval_tap $? 278 'PlatformAuthenticateSAMLV3Handler' test.out

#- 279 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'aKzn8dZwnnGeZsZV' \
    --payload 'gbPzPFbrOMZMgWkF' \
    > test.out 2>&1
eval_tap $? 279 'LoginSSOClient' test.out

#- 280 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'N7Tpkx6GcfyOg6ZU' \
    > test.out 2>&1
eval_tap $? 280 'LogoutSSOClient' test.out

#- 281 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --additionalData 'rrp9ubg9mndW2JKm' \
    --code 'QafUs2bxYztOEyVb' \
    > test.out 2>&1
eval_tap $? 281 'RequestGameTokenResponseV3' test.out

#- 282 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KIf1ZbzgUwd8DHoC' \
    > test.out 2>&1
eval_tap $? 282 'AdminGetDevicesByUserV4' test.out

#- 283 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'QykmXHYmkRlg7gYs' \
    --endDate '6unPYQ9jNQN1di1l' \
    --limit '6' \
    --offset '55' \
    --startDate 'hOh6HvjnYuV7NfC4' \
    > test.out 2>&1
eval_tap $? 283 'AdminGetBannedDevicesV4' test.out

#- 284 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A2ODiZhbfb8QqCyK' \
    > test.out 2>&1
eval_tap $? 284 'AdminGetUserDeviceBansV4' test.out

#- 285 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "1XH9D6vl5eFdFfgK", "deviceId": "46GjCWaP8huTmnq3", "deviceType": "FGQn3Ahu5wxq6oJq", "enabled": false, "endDate": "5SzoCV8ZMi2o1nR4", "ext": {"82D6gNClk9c87hos": {}, "aPFC5zBW3ZgVZCj9": {}, "ObVGT0Scwl4kNmCi": {}}, "reason": "15XTJTgCNNH7RtG5"}' \
    > test.out 2>&1
eval_tap $? 285 'AdminBanDeviceV4' test.out

#- 286 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'Xmo9Q0Wb07N17fkx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 286 'AdminGetDeviceBanV4' test.out

#- 287 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'ZSc6VbE0AGcekjMN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 287 'AdminUpdateDeviceBanV4' test.out

#- 288 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'uPXtz8tXxrmzafMU' \
    --startDate 'guyDoN91uc28HoSp' \
    --deviceType 'Gt1g0GGbT4Hf2PPK' \
    > test.out 2>&1
eval_tap $? 288 'AdminGenerateReportV4' test.out

#- 289 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 289 'AdminGetDeviceTypesV4' test.out

#- 290 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'OldkbgX9CWJKwXXS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'AdminGetDeviceBansV4' test.out

#- 291 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'bv5eg9q86IaDFjjx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'AdminDecryptDeviceV4' test.out

#- 292 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId '6uZerWbtwTX9gNRB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 292 'AdminUnbanDeviceV4' test.out

#- 293 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'yjbE8lOLAfTXKLzb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 293 'AdminGetUsersByDeviceV4' test.out

#- 294 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 35}' \
    > test.out 2>&1
eval_tap $? 294 'AdminCreateTestUsersV4' test.out

#- 295 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["8q4Thmq09bBgPAYx", "rBE9jlnTgtgW33wD", "wD9RKvQX4yFQFdrR"]}' \
    > test.out 2>&1
eval_tap $? 295 'AdminBulkCheckValidUserIDV4' test.out

#- 296 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oM6FoqCYw7AlxO6q' \
    --body '{"avatarUrl": "dFpc71sSck3ggZWJ", "country": "lSlCQMDji329PfVr", "dateOfBirth": "vMEPtpsSNcpK1QkB", "displayName": "2Sy8Ww79LVeVskqe", "languageTag": "UB7RSayqGFguhh3b", "userName": "vadRthdbVApebRA0"}' \
    > test.out 2>&1
eval_tap $? 296 'AdminUpdateUserV4' test.out

#- 297 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '9rW8i8krFWJhe03c' \
    --body '{"code": "oRFok5d3AyGrZO8G", "emailAddress": "uoXNSoVEBG7VbBPU"}' \
    > test.out 2>&1
eval_tap $? 297 'AdminUpdateUserEmailAddressV4' test.out

#- 298 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wipz9C05YabFX4FC' \
    > test.out 2>&1
eval_tap $? 298 'AdminDisableUserMFAV4' test.out

#- 299 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'K5ucTFsAFzaO3yJp' \
    > test.out 2>&1
eval_tap $? 299 'AdminListUserRolesV4' test.out

#- 300 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A3KMxBlrRytER1qd' \
    --body '{"assignedNamespaces": ["TelFAadM9y66Drf4", "SSGGt3MiBKohow3k", "KoaP1K4CDuH1mMIf"], "roleId": "OCDyVAHrHncR5dSh"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminUpdateUserRoleV4' test.out

#- 301 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qiBUI9esSsXegSEh' \
    --body '{"assignedNamespaces": ["rPpK2q8kxR4BuEks", "S2A9VOA8H9VeHv0L", "2Acm960EYQEuGJVl"], "roleId": "8xs1WId9WlalqshF"}' \
    > test.out 2>&1
eval_tap $? 301 'AdminAddUserRoleV4' test.out

#- 302 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '9Rh2o7GCQGPCxwEd' \
    --body '{"assignedNamespaces": ["kyuT3MgzReRq0112", "ISArROIodcmM6v2A", "EozWWaYvBLE46bpu"], "roleId": "Jip8JyxJ39vrtuWW"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminRemoveUserRoleV4' test.out

#- 303 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '36' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 303 'AdminGetRolesV4' test.out

#- 304 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "U7dGMjupZkZQY8CN"}' \
    > test.out 2>&1
eval_tap $? 304 'AdminCreateRoleV4' test.out

#- 305 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'yT4k3DIbfT22G5Np' \
    > test.out 2>&1
eval_tap $? 305 'AdminGetRoleV4' test.out

#- 306 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'E130YWSgxpKWtdtd' \
    > test.out 2>&1
eval_tap $? 306 'AdminDeleteRoleV4' test.out

#- 307 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'tVW9anENmxb9e7vX' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "roleName": "ig8Jg5VByeI3ycMc"}' \
    > test.out 2>&1
eval_tap $? 307 'AdminUpdateRoleV4' test.out

#- 308 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'YYBixKJXCISQdwec' \
    --body '{"permissions": [{"action": 48, "resource": "m8BusV9tUh74KVo6", "schedAction": 45, "schedCron": "qjz2xUKLNWSmYyVv", "schedRange": ["yelIJ8QgaLMqi836", "ULa7cfZl4VuY6rsZ", "yo6CBRRnoOikIxXK"]}, {"action": 74, "resource": "kcjRh3l2gAJOTCbx", "schedAction": 74, "schedCron": "J3gNLIlTk3Bpclrk", "schedRange": ["4hIRn0znIKzAEAHQ", "pBOgHEP5l94s7CbI", "J7eHnVWOboMkyB7F"]}, {"action": 94, "resource": "v5TacQKF4OlRGdmX", "schedAction": 47, "schedCron": "wIcXMhGy83Xit6bo", "schedRange": ["OLGCcg16DqwdQPQ9", "HkSSV8e1MgTTLS2F", "garY903INGIyEfRB"]}]}' \
    > test.out 2>&1
eval_tap $? 308 'AdminUpdateRolePermissionsV4' test.out

#- 309 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'Ej7qms9AGQExPhgr' \
    --body '{"permissions": [{"action": 56, "resource": "gGfC0GjvpgJfuBs1", "schedAction": 97, "schedCron": "vSc0Mr7ImwCwGqOf", "schedRange": ["0bNs97KvKyj3MqS7", "Dcmtfh50eObbrmgj", "hWK0x0ZidAJ1CU1e"]}, {"action": 60, "resource": "eUmU96FLEak0mJqj", "schedAction": 89, "schedCron": "yGjjv4Mwrv2vancm", "schedRange": ["R6Z7rb21A2E9pX0B", "WCMqPsRk5htdM5T3", "fDSrSHrkoqv2mM6s"]}, {"action": 30, "resource": "09CDA8Ij5bGKSuop", "schedAction": 91, "schedCron": "QbaCvdPSq8Z27Gpv", "schedRange": ["HCDx55JZ5z6gujpF", "zlPspQD9IRIpDDub", "ntPCFxfeoW2NdSWz"]}]}' \
    > test.out 2>&1
eval_tap $? 309 'AdminAddRolePermissionsV4' test.out

#- 310 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'OXjO1NQUqWHBW78X' \
    --body '["REZCiTNAxq26gZrP", "qCsSDspvgM16sZ6r", "jnkH4ExObppC6CMY"]' \
    > test.out 2>&1
eval_tap $? 310 'AdminDeleteRolePermissionsV4' test.out

#- 311 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'Dm5ge659UDEOF6gp' \
    --after '5UfmjtiVbqJnZcrq' \
    --before 'rPye7fCwi7Il2wIF' \
    --limit '24' \
    > test.out 2>&1
eval_tap $? 311 'AdminListAssignedUsersV4' test.out

#- 312 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'b5RpMwhWPtndriXU' \
    --body '{"assignedNamespaces": ["9loOxpmEuwDVc12r", "0DVUGgGHkapTCafF", "MdvYiCBuzUUwyI6V"], "namespace": "td4v9k4fv3kMiuQ3", "userId": "DhsKLxjt5srPFxBg"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminAssignUserToRoleV4' test.out

#- 313 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'pFtDBmTLH9kP9U53' \
    --body '{"namespace": "z6joBAhAlJGI2YYb", "userId": "6ajBjgq6eY4PBNHK"}' \
    > test.out 2>&1
eval_tap $? 313 'AdminRevokeUserFromRoleV4' test.out

#- 314 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["Px62tHxDb06ZFy3u", "glSp2UxvF2uLXWil", "RD7HD6LCgdFxRGj0"], "emailAddresses": ["0RT6LvcnGMJbJIYL", "ssMvy9gkfTMRrXVR", "cAVRDX6gmDfNfPGY"], "isAdmin": true, "namespace": "BPOKFLxIwKssw647", "roleId": "YwDudnGRufOUGfMj"}' \
    > test.out 2>&1
eval_tap $? 314 'AdminInviteUserNewV4' test.out

#- 315 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "TU226l07jPlcYaqY", "country": "M7YfBmhjI9Y28qVc", "dateOfBirth": "eS9UX48dKPCFUIey", "displayName": "YEymNXzNX6TGh4Ud", "languageTag": "EweeBsJEvBbAvCml", "userName": "h6Z1oz9BaixUUvmz"}' \
    > test.out 2>&1
eval_tap $? 315 'AdminUpdateMyUserV4' test.out

#- 316 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 316 'AdminDisableMyAuthenticatorV4' test.out

#- 317 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'bajE2gjooiDnc1NU' \
    > test.out 2>&1
eval_tap $? 317 'AdminEnableMyAuthenticatorV4' test.out

#- 318 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 318 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 319 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 319 'AdminGetMyBackupCodesV4' test.out

#- 320 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 320 'AdminGenerateMyBackupCodesV4' test.out

#- 321 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 321 'AdminDisableMyBackupCodesV4' test.out

#- 322 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 322 'AdminDownloadMyBackupCodesV4' test.out

#- 323 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 323 'AdminEnableMyBackupCodesV4' test.out

#- 324 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 324 'AdminSendMyMFAEmailCodeV4' test.out

#- 325 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 325 'AdminDisableMyEmailV4' test.out

#- 326 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'b51lEgUwQ9tkWaMO' \
    > test.out 2>&1
eval_tap $? 326 'AdminEnableMyEmailV4' test.out

#- 327 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 327 'AdminGetMyEnabledFactorsV4' test.out

#- 328 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'H47CAT7cBP0918Ja' \
    > test.out 2>&1
eval_tap $? 328 'AdminMakeFactorMyDefaultV4' test.out

#- 329 AdminInviteUserV4
eval_tap 0 329 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 330 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "tt3RVTl0tR00oQgc", "policyId": "HdGGK3x76U1EIckl", "policyVersionId": "ttmrpgF5szl0sMY8"}, {"isAccepted": false, "localizedPolicyVersionId": "i3XrYZUiN24ol1qq", "policyId": "balgizL97ycJV5Yq", "policyVersionId": "E2myQzl7X9fHr6Wv"}, {"isAccepted": true, "localizedPolicyVersionId": "6VSfE9nbE2PMv12Z", "policyId": "SRJkujxbCu1HFaj6", "policyVersionId": "Vxs3GuA4S1dS7H7y"}], "authType": "EMAILPASSWD", "country": "S7b5TSDRIoMg7Dc5", "dateOfBirth": "APzfzXDELJFaIaEM", "displayName": "W5bhJyL72WDyhBsC", "emailAddress": "CbnfihnXKxGxaupn", "password": "TTq9ihZkvFKfSHQh", "passwordMD5Sum": "8I9xk3sFl0cbuCRM", "username": "69XKkLwioRaKnWhl", "verified": false}' \
    > test.out 2>&1
eval_tap $? 330 'PublicCreateTestUserV4' test.out

#- 331 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "80BhYe2fJDS6T75Q", "policyId": "4ulonMFjmYqE1wJh", "policyVersionId": "fogWg2Apm0sUy18a"}, {"isAccepted": true, "localizedPolicyVersionId": "n65Co0vdCk8so6JS", "policyId": "aZAIadKDEZywonA2", "policyVersionId": "SrEdN2tmGuX6r0gB"}, {"isAccepted": true, "localizedPolicyVersionId": "UeKKlPKtE6gnYxmk", "policyId": "mCWbs5qugklBUS6u", "policyVersionId": "wWrCQt86Jrg8tLAJ"}], "authType": "EMAILPASSWD", "code": "pcyNkUvqn6eXr6FN", "country": "bKJ05Orya6LSSUlu", "dateOfBirth": "gIAknXcSaVYcAYp7", "displayName": "qSiDvsfMUOpWv46s", "emailAddress": "XvpOjrpRo4mYrCeQ", "password": "UnYoID2UqO0iAXA9", "passwordMD5Sum": "dB4ib8HDOJ8TNiP8", "reachMinimumAge": false, "username": "OXvGSrdkqddI3ezq"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicCreateUserV4' test.out

#- 332 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'u6FB0sL2xt6fX9j7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "megqVUaWMJBjrV0p", "policyId": "9A7tcHrV0MbJGr4d", "policyVersionId": "rgkDuWS05m0pGzaz"}, {"isAccepted": true, "localizedPolicyVersionId": "LrF5i3gr3Cc4M2O7", "policyId": "NrTQO7KLdZDGwqx7", "policyVersionId": "T3l1ut2oyolliYsT"}, {"isAccepted": false, "localizedPolicyVersionId": "KwdRMraDLrwh3d0y", "policyId": "kRGkgqUNIbJMJ9AB", "policyVersionId": "bKVWO2YEDiqkwKbp"}], "authType": "EMAILPASSWD", "country": "92iD02YMvEUNfoL7", "dateOfBirth": "JCcMo7GxxXdbYCRe", "displayName": "xPekTsQxMTfaSot7", "password": "aohFYy4VxwHIJ9gz", "reachMinimumAge": true, "username": "ZPHCMqvcYmeDLYEz"}' \
    > test.out 2>&1
eval_tap $? 332 'CreateUserFromInvitationV4' test.out

#- 333 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "s2SQUdKr6vgqkjyc", "country": "qclNlBORlC8Zkjsx", "dateOfBirth": "YtgxplHTPLzynjFZ", "displayName": "gF3erw7UsyHq4bBb", "languageTag": "0n1JhPUS8BRPGV9n", "userName": "769zLJdKMexeJc7N"}' \
    > test.out 2>&1
eval_tap $? 333 'PublicUpdateUserV4' test.out

#- 334 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "vgTSgKjCxZjKf8NA", "emailAddress": "4cGUaDfy9XnH2r0E"}' \
    > test.out 2>&1
eval_tap $? 334 'PublicUpdateUserEmailAddressV4' test.out

#- 335 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Krk5VlnKsWCPccAF", "country": "n5CEPoH6opK5DSO8", "dateOfBirth": "JyX4IE1z3rDwZ1HK", "displayName": "sOpyq8agQuz86nc6", "emailAddress": "jLF9DIW2ncJJKpqm", "password": "gvUTr8XAtpOqUQxz", "reachMinimumAge": true, "username": "6W2B2uPQLrt2t6bV", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 335 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 336 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "A1xW6okIqmd87ir9", "password": "op4YfGTno5oHzqY3", "username": "DgykA8zBJX0rkOHU"}' \
    > test.out 2>&1
eval_tap $? 336 'PublicUpgradeHeadlessAccountV4' test.out

#- 337 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 337 'PublicDisableMyAuthenticatorV4' test.out

#- 338 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'kY5aSlqhYoSXbn6l' \
    > test.out 2>&1
eval_tap $? 338 'PublicEnableMyAuthenticatorV4' test.out

#- 339 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 339 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 340 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 340 'PublicGetMyBackupCodesV4' test.out

#- 341 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 341 'PublicGenerateMyBackupCodesV4' test.out

#- 342 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'PublicDisableMyBackupCodesV4' test.out

#- 343 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 343 'PublicDownloadMyBackupCodesV4' test.out

#- 344 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 344 'PublicEnableMyBackupCodesV4' test.out

#- 345 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken '5xAzc1nc3eFm950d' \
    > test.out 2>&1
eval_tap $? 345 'PublicRemoveTrustedDeviceV4' test.out

#- 346 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'PublicSendMyMFAEmailCodeV4' test.out

#- 347 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 347 'PublicDisableMyEmailV4' test.out

#- 348 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'tVAo7w4e3v5mh6Ru' \
    > test.out 2>&1
eval_tap $? 348 'PublicEnableMyEmailV4' test.out

#- 349 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 349 'PublicGetMyEnabledFactorsV4' test.out

#- 350 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'm5pbgEt39uJQpgEt' \
    > test.out 2>&1
eval_tap $? 350 'PublicMakeFactorMyDefaultV4' test.out

#- 351 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"emailAddress": "chTe3nt7t9ztprSf", "namespace": "W9OutADrNGBWSJ1z", "namespaceDisplayName": "QKxVmRTawjiZPMoZ"}' \
    > test.out 2>&1
eval_tap $? 351 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE