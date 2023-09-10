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
echo "1..357"

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

#- 141 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KwjqPBiWXade41s3' \
    --rawPID  \
    --body '{"platformUserIds": ["rH34mB2yPlRpWjmH", "ZAAvKTH8MuqIg0Cz", "kguwuJCW7EEFB67A"]}' \
    > test.out 2>&1
eval_tap $? 141 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 142 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ODbi9BzupBsFpYc7' \
    --platformUserId '7GtRUcCFeY5g4XgB' \
    > test.out 2>&1
eval_tap $? 142 'AdminGetUserByPlatformUserIDV3' test.out

#- 143 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'sbfzqxBPNe8ae1Il' \
    --after '42' \
    --before '1' \
    --limit '28' \
    > test.out 2>&1
eval_tap $? 143 'GetAdminUsersByRoleIdV3' test.out

#- 144 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'AtEbu4IjGdqthRxT' \
    > test.out 2>&1
eval_tap $? 144 'AdminGetUserByEmailAddressV3' test.out

#- 145 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'jQ7gkZEY8rG0q0Q2' \
    --body '{"bulkUserId": ["Qd2JzRbkF2I03dIj", "vBbA6bfbYaJCJjfk", "2TUvn95FhO7VW3mb"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminGetBulkUserBanV3' test.out

#- 146 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["DVMDu87t0ldWf7iS", "GIiKFtWtn4Yr2svK", "M6pqLGZ0TBujELAU"]}' \
    > test.out 2>&1
eval_tap $? 146 'AdminListUserIDByUserIDsV3' test.out

#- 147 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["K6mQ5iZgbwwm5iGz", "XtcknrgidKupvXO6", "aj4hCmTC34jxW4pI"]}' \
    > test.out 2>&1
eval_tap $? 147 'AdminBulkGetUsersPlatform' test.out

#- 148 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["DwdqXpmRmut9H9Xy", "WI8bp8fQxRuX91uY", "mtrHJbEGTUj7YjER"], "isAdmin": true, "namespace": "8HwSmvcvcDKF19yV", "roles": ["RafCjOuSYht83Adv", "BaagTiRJ8daGTVX3", "Bb7jlz5IfHgKjI9m"]}' \
    > test.out 2>&1
eval_tap $? 148 'AdminInviteUserV3' test.out

#- 149 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '83' \
    --platformUserId 'JSrN8jkIykR2zbaI' \
    --platformId '6PD7fEscShnGUGUt' \
    > test.out 2>&1
eval_tap $? 149 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 150 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 150 'AdminListUsersV3' test.out

#- 151 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '9GJ279GDbLNwjm3F' \
    --endDate 'K0nnX2poMfZ1hDHt' \
    --limit '2' \
    --offset '34' \
    --platformBy 'h4HtMlFgvh2Dp2So' \
    --platformId 'iIPp1yvfAHS0VgLu' \
    --query '11A3HTovFi4tPAGf' \
    --startDate 'leyCA6jEtcqsnzoV' \
    > test.out 2>&1
eval_tap $? 151 'AdminSearchUserV3' test.out

#- 152 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["ILjkwW61duF87aUy", "rdt4XSpWBAetsanz", "qP8oxfrtbECD1CYP"]}' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetBulkUserByEmailAddressV3' test.out

#- 153 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'waiBAxfYL8Avt70Z' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserByUserIdV3' test.out

#- 154 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UT2fSk3LL0calqxE' \
    --body '{"avatarUrl": "ewuGS469k2hG0WKt", "country": "4sUmanYxM0UHZVNY", "dateOfBirth": "zGMNIpWoSLkUrfuf", "displayName": "4U3WeYeA9t2ENKKW", "languageTag": "rFtHIi1CMgKAOG5i", "userName": "DcCR5PbCvDLil8wj"}' \
    > test.out 2>&1
eval_tap $? 154 'AdminUpdateUserV3' test.out

#- 155 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9cKM3Ar6MF35hCER' \
    --activeOnly  \
    --after '4nGmWGgTJfHlJl4t' \
    --before 'HGa4XfZcd9CVnGqM' \
    --limit '93' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetUserBanV3' test.out

#- 156 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9FieeEssWEUl07bh' \
    --body '{"ban": "wntCVqiYOJf5KwMZ", "comment": "QjzvjSozv6CTRDl0", "endDate": "zp9CzHFwinkBNi4g", "reason": "vqgl6TZ9TGVPmv34", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 156 'AdminBanUserV3' test.out

#- 157 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'QYBQuxLvPuWYvE3f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sNy9Z9OhxXvCp9y7' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 157 'AdminUpdateUserBanV3' test.out

#- 158 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LD2qfCXnlUnqxT1W' \
    --body '{"context": "sRNMZcA92hzC7MNa", "emailAddress": "8vVe4MHX6AgMep90", "languageTag": "AyyUJyAK5PRMRMwd"}' \
    > test.out 2>&1
eval_tap $? 158 'AdminSendVerificationCodeV3' test.out

#- 159 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vl0hv6g62GxBW2tQ' \
    --body '{"Code": "F5tkTjgJaMYvNQOs", "ContactType": "Da4bkcgepqtxjbrz", "LanguageTag": "tee7QLTGAak7Kaol", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminVerifyAccountV3' test.out

#- 160 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId '1DK97D2xnik42mit' \
    > test.out 2>&1
eval_tap $? 160 'GetUserVerificationCode' test.out

#- 161 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eR5eQAe1rzmmgqBP' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetUserDeletionStatusV3' test.out

#- 162 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rmd6mO4oI8KDqebm' \
    --body '{"deletionDate": 81, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 162 'AdminUpdateUserDeletionStatusV3' test.out

#- 163 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GMy2pgSGSUOK68eq' \
    --body '{"code": "GJtWf1Ybgg8rdwY9", "country": "bmrvHmO07KNqX9LM", "dateOfBirth": "2IwEsdOGBXBwnzDX", "displayName": "8v3xgC1Ge9PdbTTA", "emailAddress": "J2Gp1r0sVZ6LJAOd", "password": "dIL2l3hPjNDKv2LW", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 163 'AdminUpgradeHeadlessAccountV3' test.out

#- 164 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FNxuNOmUSWw18T1I' \
    > test.out 2>&1
eval_tap $? 164 'AdminDeleteUserInformationV3' test.out

#- 165 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xVWCxdvPL9e4P01v' \
    --after '0.3779640474124243' \
    --before '0.6691865120707688' \
    --limit '21' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetUserLoginHistoriesV3' test.out

#- 166 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xj1LyEirURERnEMz' \
    --body '{"languageTag": "pImW6sjAHyCK5tNa", "newPassword": "nGBrkzUvck3xTtmO", "oldPassword": "FMebS4AdlNzwog2I"}' \
    > test.out 2>&1
eval_tap $? 166 'AdminResetPasswordV3' test.out

#- 167 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hErkNhNcECWwchW6' \
    --body '{"Permissions": [{"Action": 52, "Resource": "LiEtzVlnkflfn7pH", "SchedAction": 53, "SchedCron": "48F1dl1q92m3iRlf", "SchedRange": ["nBAk0CwiAsR65yQ9", "ssuHdGmxncCEr0Kc", "geqzGbruNB72HHMk"]}, {"Action": 19, "Resource": "dd7CcJUrI6MAugK5", "SchedAction": 22, "SchedCron": "m2yqPsMFxKybPkbu", "SchedRange": ["S6x9cLJ1APnNlsa2", "bRBr27fVMWuAfDqL", "MR919IZPKOKiAVQX"]}, {"Action": 100, "Resource": "OmqFHLbyXmgCNiXH", "SchedAction": 71, "SchedCron": "uenbC5CphgMweexs", "SchedRange": ["IAP5vHLjBJ9iqMcB", "L4BzhDUjhKPwbwcv", "QU5kG8bXGFmPAnOk"]}]}' \
    > test.out 2>&1
eval_tap $? 167 'AdminUpdateUserPermissionV3' test.out

#- 168 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DiJq4xQye7HqnVK3' \
    --body '{"Permissions": [{"Action": 58, "Resource": "VeOWs9mfVQh3jLBt", "SchedAction": 26, "SchedCron": "F8y959anrNSleywH", "SchedRange": ["bHig6IKWVZ77KeRW", "dECaFGzfZ2hxcJ2F", "nemn7M23SzUo4hNB"]}, {"Action": 61, "Resource": "CCvNowNmdpcJgF88", "SchedAction": 50, "SchedCron": "S4VsRoYIK69yg9AD", "SchedRange": ["CGiXaLs2xjHkinOD", "975nARHCmhNHSXuq", "IHsxvaUoXDmwWsuk"]}, {"Action": 47, "Resource": "N6wKZGW4y3f0R9s2", "SchedAction": 20, "SchedCron": "CaVVmM45mfIZsWhk", "SchedRange": ["S476dGGJwJ00UH19", "7MJ6zU7JLMQyMWzY", "QCAaPJgoxGJoJaSz"]}]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminAddUserPermissionsV3' test.out

#- 169 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UtY4ZD0Xtb0U4pH1' \
    --body '[{"Action": 82, "Resource": "J5Z9GiBiSAylX5cS"}, {"Action": 72, "Resource": "3Ns0QJQeaWytPfds"}, {"Action": 38, "Resource": "BYx0EaURydf8ZyyZ"}]' \
    > test.out 2>&1
eval_tap $? 169 'AdminDeleteUserPermissionBulkV3' test.out

#- 170 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '9' \
    --namespace "$AB_NAMESPACE" \
    --resource 'yDYz9vMUOPG0iHDT' \
    --userId '8QbF7gHPTPQbvLt2' \
    > test.out 2>&1
eval_tap $? 170 'AdminDeleteUserPermissionV3' test.out

#- 171 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NRqJGIKzLyH1y72L' \
    --after '13Ornyx34luLdvts' \
    --before 'TKXMjiw6gYPvfn2Q' \
    --limit '40' \
    --platformId 'cNg14Ws8TIP1LKiF' \
    > test.out 2>&1
eval_tap $? 171 'AdminGetUserPlatformAccountsV3' test.out

#- 172 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'QoLDvumfqrgSfnx2' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetListJusticePlatformAccounts' test.out

#- 173 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'h61X9dN1MGRXBJ6m' \
    --userId 'VV7JS9qjNLwvI8Jd' \
    > test.out 2>&1
eval_tap $? 173 'AdminGetUserMapping' test.out

#- 174 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'iY3RRiLilmOGF6dL' \
    --userId 'LIeIVIjMcdlbdRXT' \
    > test.out 2>&1
eval_tap $? 174 'AdminCreateJusticeUser' test.out

#- 175 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'GIrdNL5gJPqTAjgq' \
    --skipConflict  \
    --body '{"platformId": "aTHf1ANTJ9Yk997X", "platformUserId": "kGOdC6ItxDT8p4n4"}' \
    > test.out 2>&1
eval_tap $? 175 'AdminLinkPlatformAccount' test.out

#- 176 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XCFkD1AJLCwszbZx' \
    --userId 'uHSgDOK8bjoF7bL2' \
    --body '{"platformNamespace": "635KbtZTGJpqgl2I"}' \
    > test.out 2>&1
eval_tap $? 176 'AdminPlatformUnlinkV3' test.out

#- 177 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zNXGTuQPIDpor7t1' \
    --userId 'aJLNNz6QIVC9Mfuc' \
    --ticket '8VOsnmnlVljdWYmE' \
    > test.out 2>&1
eval_tap $? 177 'AdminPlatformLinkV3' test.out

#- 178 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Le74p38vumnxAnYB' \
    --userId 'TxaTIz0jcgDI8Pkz' \
    --platformToken '96vd80msqIm5bufn' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 179 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BqrpLeqhwVhjnnjK' \
    --userId 'MEmtbiWsAQHbMrKY' \
    > test.out 2>&1
eval_tap $? 179 'AdminGetUserSinglePlatformAccount' test.out

#- 180 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'i0Zxs5SWCqZXHLLa' \
    --body '["31oQf7BULnZDhutD", "M6BqguqD5xxGxBWt", "nTKUe2znsqPzPkwC"]' \
    > test.out 2>&1
eval_tap $? 180 'AdminDeleteUserRolesV3' test.out

#- 181 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bo2SwCUsTag4MLAo' \
    --body '[{"namespace": "3m61P2xaNfmn8Onb", "roleId": "1a9gMz0F2UBRmMhA"}, {"namespace": "bUWmFhdYLWzMuv3z", "roleId": "kUY0n0BAZkwbYkBL"}, {"namespace": "yO6A0FqfhnaB3YxK", "roleId": "NdOTacCcJfIfXshu"}]' \
    > test.out 2>&1
eval_tap $? 181 'AdminSaveUserRoleV3' test.out

#- 182 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'LUk5WdpxjZx5noXP' \
    --userId 'hPUTKbonoucNmzwO' \
    > test.out 2>&1
eval_tap $? 182 'AdminAddUserRoleV3' test.out

#- 183 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'ZOK56sDkci5rZ8iM' \
    --userId 'lOuksQJCiRFiZWwJ' \
    > test.out 2>&1
eval_tap $? 183 'AdminDeleteUserRoleV3' test.out

#- 184 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7NrTb1XTB9YQzUJ9' \
    --body '{"enabled": false, "reason": "CQ9dLWYyS8zdhMeB"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminUpdateUserStatusV3' test.out

#- 185 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XH8x6HdVfZVDAiU6' \
    > test.out 2>&1
eval_tap $? 185 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 186 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'iJOF7JKZFNk2NKy5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "9X8iOg2sVBiCoeC5"}' \
    > test.out 2>&1
eval_tap $? 186 'AdminUpdateClientSecretV3' test.out

#- 187 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'weXJl7PeiMH8z8dV' \
    --before 'ej8N2yv6VTnOK7xA' \
    --isWildcard  \
    --limit '44' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetRolesV3' test.out

#- 188 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "managers": [{"displayName": "tuL81lsR7xxSVp3G", "namespace": "d2TK0HzYviTgYmx8", "userId": "2JVBRLPZ6Iz8tne5"}, {"displayName": "dbguBF6Gsvvdl8jH", "namespace": "z9x7XZIjU4IK9lOL", "userId": "aZaMphKCqTq3EVhe"}, {"displayName": "JjoEEXBLIxGnNuho", "namespace": "JM3WWPvvCiCf33Vi", "userId": "EdqQpoGkUWNizk5U"}], "members": [{"displayName": "cPAGv6c1ESC6hZYT", "namespace": "YZbzf5aANNNs5kgS", "userId": "ZZNUHbIT9szApmWJ"}, {"displayName": "O5vzzXZj08a6K1XR", "namespace": "VfriSpPFnZBJZkDn", "userId": "Eiyfa2LrnpZxNnLR"}, {"displayName": "H36bqS2oFY76PU1A", "namespace": "ziBOHEAj1cT3u6Zc", "userId": "2FbrTFznTgDIwZIR"}], "permissions": [{"action": 100, "resource": "ZFDsO1skRjOU1SMf", "schedAction": 86, "schedCron": "c0xcTjqjdcEfU61O", "schedRange": ["JYMnW49rWynp1ck1", "vT90C6o86cSRL9cg", "bUmulhe98oaFKlQi"]}, {"action": 6, "resource": "w9GYxjiiOQAD77ci", "schedAction": 52, "schedCron": "vfWVZoRRMPi57HyK", "schedRange": ["Kz5nyI6ulKNKoXa0", "dgx1JgjC56pda3Yh", "tQxpCYME6x21pdX2"]}, {"action": 87, "resource": "rqKmXDwoEV6tCdrx", "schedAction": 45, "schedCron": "fIjLX8ce0KbNN7Yc", "schedRange": ["l2JfmQplvGjVQ4ae", "bjfgGu472oWJlfgl", "LM4xjfkNL4lU6jaG"]}], "roleName": "fsD1cfswmeFpvtDt"}' \
    > test.out 2>&1
eval_tap $? 188 'AdminCreateRoleV3' test.out

#- 189 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'etoQVFL8LNW11vtp' \
    > test.out 2>&1
eval_tap $? 189 'AdminGetRoleV3' test.out

#- 190 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'aTxi7k489jRCn48b' \
    > test.out 2>&1
eval_tap $? 190 'AdminDeleteRoleV3' test.out

#- 191 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'vkCPfKofwXOIZZQA' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "3VlSXrA3XUGud4tV"}' \
    > test.out 2>&1
eval_tap $? 191 'AdminUpdateRoleV3' test.out

#- 192 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'jmxEf4XvVhFJTxFH' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetRoleAdminStatusV3' test.out

#- 193 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'ITBg9x4unq3eOMHI' \
    > test.out 2>&1
eval_tap $? 193 'AdminUpdateAdminRoleStatusV3' test.out

#- 194 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'KeTyBG5dCUoExnKf' \
    > test.out 2>&1
eval_tap $? 194 'AdminRemoveRoleAdminV3' test.out

#- 195 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'V3869IN4V1OdhH4G' \
    --after 'VU7Exlkmc4xYiLjL' \
    --before 'yZrXr9Bhtzn8jAdT' \
    --limit '28' \
    > test.out 2>&1
eval_tap $? 195 'AdminGetRoleManagersV3' test.out

#- 196 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'ryDeRcpUvlrw2MwC' \
    --body '{"managers": [{"displayName": "1uuokpaIjL0Vxe5n", "namespace": "9Lx3QcFo9gxOgvDc", "userId": "7xMrRKvw8ISP2WKm"}, {"displayName": "CRRXBxlalCHtWlKx", "namespace": "LpS8fLWoQ5nuJhat", "userId": "QPxR7dvBVC5zgOKL"}, {"displayName": "TDmHe8c1eJ9sde7R", "namespace": "yt4udIv22M18uux9", "userId": "xBomQFPFWy5cwNPI"}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminAddRoleManagersV3' test.out

#- 197 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId '6aFo0MVwDZCIXFNE' \
    --body '{"managers": [{"displayName": "L3uWVRz3V7YbJM3b", "namespace": "NLWHAbCZixe2cQ6O", "userId": "30lpzcBQMAEcNcJq"}, {"displayName": "rKxnMzSYoc4ZjiMY", "namespace": "4H34B6wVd8ipcKDw", "userId": "QeUWtjCC2UH6jzMO"}, {"displayName": "3AfmOS5mQNyRPZFP", "namespace": "NP56l1AT6OLKmZhC", "userId": "ZxxPPdPwOtEuWBSO"}]}' \
    > test.out 2>&1
eval_tap $? 197 'AdminRemoveRoleManagersV3' test.out

#- 198 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId '2jJepUnEEgja2mIE' \
    --after '2kLTnJwc5XmkCuL5' \
    --before 'W4tKt6G3j9LYdG7x' \
    --limit '98' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetRoleMembersV3' test.out

#- 199 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'W02PWsHiKYArAxnK' \
    --body '{"members": [{"displayName": "BfBfDlrQQuAc10Dj", "namespace": "jwMv4vrIPRtvhQIy", "userId": "LarjaLOKnX51yAB8"}, {"displayName": "Pa3uNGKhaLlJzJMS", "namespace": "nJIIgsAVmaGYxUX1", "userId": "B9oVuzG2CnYX2YBF"}, {"displayName": "2g7TVtzYEHUodh3i", "namespace": "UfBthbepUCTWiZ1u", "userId": "qh7GAi4FEIu44u83"}]}' \
    > test.out 2>&1
eval_tap $? 199 'AdminAddRoleMembersV3' test.out

#- 200 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'ZLRxYlYqlpq03BGd' \
    --body '{"members": [{"displayName": "Ik4oEogFVGR71rJO", "namespace": "By6lsj1AKGBjnHma", "userId": "Au4YK87DYAWWcbcb"}, {"displayName": "GWmKgE8CZ4AELr5l", "namespace": "raa5v5P5Cj8hgFsq", "userId": "HC9h5JPiMEtgKuiG"}, {"displayName": "TYgwWv5XldL6rOVG", "namespace": "cRAn51rVAQSxp4qT", "userId": "B54mKA3V9DKlCeZ7"}]}' \
    > test.out 2>&1
eval_tap $? 200 'AdminRemoveRoleMembersV3' test.out

#- 201 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'mLYsHooOIaxIpb1c' \
    --body '{"permissions": [{"action": 71, "resource": "etVIQvRkQJAtDUH9", "schedAction": 40, "schedCron": "oQ980ywmg1pWpWit", "schedRange": ["1QC7FKe0fnHUlmU1", "unGKM0tgfeWy47bb", "wMI4gGmvK9gW596F"]}, {"action": 46, "resource": "zgNZUKsI5y0mR3zM", "schedAction": 50, "schedCron": "12ae6r3hHwya4Npd", "schedRange": ["Ozg3hr6ucHf7dbh2", "iKNUl0qJqzoKMRMG", "541PAiNjULsx4SnK"]}, {"action": 82, "resource": "dubkOFldMCQ98JH4", "schedAction": 27, "schedCron": "HBSB4fZWEFIZs28F", "schedRange": ["f1kZp1Zktx3N7WNM", "YIfcDKbLu8pnK34o", "A1keYXJvtggDdXjb"]}]}' \
    > test.out 2>&1
eval_tap $? 201 'AdminUpdateRolePermissionsV3' test.out

#- 202 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'djMBahFZZGMTcqnW' \
    --body '{"permissions": [{"action": 36, "resource": "fZpfcFBUsnnDJlmD", "schedAction": 6, "schedCron": "iEokbUiYzCQh2iNT", "schedRange": ["wtnohddMzMTQ9P7s", "YLDWAJOA75K4BYJ2", "fkqYJoF2FI3vyyqR"]}, {"action": 52, "resource": "ro8TWwXWsz9TVmdM", "schedAction": 75, "schedCron": "TfERXdvgD1Qf7Ot2", "schedRange": ["DkUt3yexZBRvxYnE", "BhXtAVxCd3meTrT7", "cF9oVCh89wNOkKYs"]}, {"action": 37, "resource": "ddwSSgxCu8zru1Dh", "schedAction": 66, "schedCron": "muALlMQl9RLrthbf", "schedRange": ["p0VgweLlT2sY3SsT", "nDQY7kKU2u06Q4ve", "ujxtyQENvJrBCqeg"]}]}' \
    > test.out 2>&1
eval_tap $? 202 'AdminAddRolePermissionsV3' test.out

#- 203 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId '67d4RWOqO4U0bitN' \
    --body '["QLzwRoWnR0AbkCPY", "70FmvviVIBbcujF8", "Vk5qb8NhWWwaxyMc"]' \
    > test.out 2>&1
eval_tap $? 203 'AdminDeleteRolePermissionsV3' test.out

#- 204 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '15' \
    --resource 'CgOOPXM6XTUh2dJ9' \
    --roleId '0yqHDNacl4F9G6Dl' \
    > test.out 2>&1
eval_tap $? 204 'AdminDeleteRolePermissionV3' test.out

#- 205 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 205 'AdminGetMyUserV3' test.out

#- 206 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId '5TFwBY6HKXAblkT8' \
    --extendExp  \
    --redirectUri 'VGgSH8MGZGwiVj7e' \
    --password 'DTaka9ABfX1IByPE' \
    --requestId 'OuPhGspRi3bhPQvB' \
    --userName 'BJI5JxytpcubN4AU' \
    > test.out 2>&1
eval_tap $? 206 'UserAuthenticationV3' test.out

#- 207 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'UPFPscZsXeJOD4DM' \
    --linkingToken 'tqfIGiGJovgWSRxZ' \
    --password '8N4UQ2fg3V1o2x0h' \
    --username 'L5DuBDqMyIAzWze9' \
    > test.out 2>&1
eval_tap $? 207 'AuthenticationWithPlatformLinkV3' test.out

#- 208 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData '4MEdJFAy2JTllJkR' \
    --extendExp  \
    --linkingToken 'GB8jqJEd6eqqsBVy' \
    > test.out 2>&1
eval_tap $? 208 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 209 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'ONV0JRtozI0jpliC' \
    > test.out 2>&1
eval_tap $? 209 'RequestOneTimeLinkingCodeV3' test.out

#- 210 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'FQ6WgJpGPigdc5Vy' \
    > test.out 2>&1
eval_tap $? 210 'ValidateOneTimeLinkingCodeV3' test.out

#- 211 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'C4qvWjVac1cQvSxg' \
    --isTransient  \
    --clientId 'TNIUzxDgBlIbuzm7' \
    --oneTimeLinkCode 'DzJ20NFRJIhFXR2d' \
    > test.out 2>&1
eval_tap $? 211 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 212 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 212 'GetCountryLocationV3' test.out

#- 213 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 213 'Logout' test.out

#- 214 RequestGameTokenCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenCodeResponseV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'YprPmbpuptECGd5c' \
    > test.out 2>&1
eval_tap $? 214 'RequestGameTokenCodeResponseV3' test.out

#- 215 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dXC2Sesc6y68whNB' \
    --userId 'Yl9iCqfW6rqGOQny' \
    > test.out 2>&1
eval_tap $? 215 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 216 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4ij4ysYPonb59gQf' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 216 'RevokeUserV3' test.out

#- 217 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'fkNOmubxEJr2qEAu' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode '1vEx4gqDY6jwyKRx' \
    --redirectUri 'hkLe5zohg9s9utRQ' \
    --scope 't28b6o3K0COF74tz' \
    --state '6aeXZOYwbwjMNdxK' \
    --targetAuthPage 'WlBfnRyFS0Ed7gTM' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId '5AVrtBQiDTcNnZa6' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 217 'AuthorizeV3' test.out

#- 218 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'EDPN1Kb4UTPWDXTS' \
    > test.out 2>&1
eval_tap $? 218 'TokenIntrospectionV3' test.out

#- 219 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 219 'GetJWKSV3' test.out

#- 220 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'b55g8LSTs7Nf95lG' \
    --factor 'lPrf6obIdnI6Ag7e' \
    --mfaToken 'UYcYJ4QzXCmqr6gm' \
    > test.out 2>&1
eval_tap $? 220 'SendMFAAuthenticationCode' test.out

#- 221 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'PGaHP5SVPvRLiDi0' \
    --mfaToken 'mNHb6Lx8eq8SGNwE' \
    > test.out 2>&1
eval_tap $? 221 'Change2faMethod' test.out

#- 222 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'QO8dYXvBSYvJBwb6' \
    --factor 'CjZUMRf2VJetWsok' \
    --mfaToken 'vx3BHuTEczr9KjQ3' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 222 'Verify2faCode' test.out

#- 223 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ttz8MTBt1xk9Iyss' \
    --userId 'SA8nP5PQjpzk2Tb7' \
    > test.out 2>&1
eval_tap $? 223 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 224 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'iYdmNZWosrsVBPZ6' \
    --clientId '4j0HUONscofwYLQc' \
    --redirectUri 'DvkaEIIPoJT83zEG' \
    --requestId 'XmVBZLyrH9J7Boys' \
    > test.out 2>&1
eval_tap $? 224 'AuthCodeRequestV3' test.out

#- 225 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'maORLkP5hc2Fh04J' \
    --additionalData 'TsqDTynCewqJligL' \
    --clientId 'lRxOelKykICRxF6H' \
    --createHeadless  \
    --deviceId 'tlER2txs4qrNARAT' \
    --macAddress 'n6KXOutlYBbLhL8K' \
    --platformToken 'Xx25FZfQIodVBqQs' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 225 'PlatformTokenGrantV3' test.out

#- 226 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 226 'GetRevocationListV3' test.out

#- 227 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'BpCJBIXLGYcwWVRK' \
    > test.out 2>&1
eval_tap $? 227 'TokenRevocationV3' test.out

#- 228 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData '6UKk5ozrXA4HZHNy' \
    --clientId 'q9odanhR1Zrm3thU' \
    --code 'vV87yfkycLSVdleS' \
    --codeVerifier 'aAylsmLYe2phYOgT' \
    --extendExp  \
    --password '5kDTyPl3dKF7NXEj' \
    --redirectUri 'rJMki8jvc3P8Gwjg' \
    --refreshToken '3IOH0SDHgYKqxJiF' \
    --username 'Jdrmj5vhzgsJwex7' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 228 'TokenGrantV3' test.out

#- 229 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'tYlYeMoCimJySocR' \
    > test.out 2>&1
eval_tap $? 229 'VerifyTokenV3' test.out

#- 230 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'vUWDOrFZKPNoN9AW' \
    --code 'tLK9TFgi9j2XMh9W' \
    --error 'pifqjNjLOtNQts2y' \
    --openidAssocHandle 'xf6MLZJ2jZfZbpTJ' \
    --openidClaimedId 'ezzriCDWXT59SRu0' \
    --openidIdentity 'YqUxKDc84OMIzvTS' \
    --openidMode 'cdbKBsAyJMz4ILND' \
    --openidNs 'vhB4Eoes9a6XaJeR' \
    --openidOpEndpoint 'bzTPwD3jxF7vxRUY' \
    --openidResponseNonce '0ilrNoFT98SgtJd4' \
    --openidReturnTo 'Z5f8nfaKqdZFLbZE' \
    --openidSig 'HxsDxeR6d7r1SQw8' \
    --openidSigned '0JfMpPrSqYypRUnq' \
    --state '5o4ETeCUYG9ccTt7' \
    > test.out 2>&1
eval_tap $? 230 'PlatformAuthenticationV3' test.out

#- 231 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'Wxw8OQ13t3uTw6zQ' \
    > test.out 2>&1
eval_tap $? 231 'PublicGetInputValidations' test.out

#- 232 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'uoZcXQpoTOxe8y1j' \
    > test.out 2>&1
eval_tap $? 232 'PublicGetInputValidationByField' test.out

#- 233 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'orNsg9ZKYCKoISyX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 233 'PublicGetCountryAgeRestrictionV3' test.out

#- 234 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 234 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 235 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'tHzoWGdYohxMp3uO' \
    > test.out 2>&1
eval_tap $? 235 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 236 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QIybqWfG9BJ6FVKl' \
    --rawPID  \
    --body '{"platformUserIds": ["bYHtbPtaxvagSlpG", "gVTF6VeDAPOGBwwe", "yFfXEOEAEtbag82K"]}' \
    > test.out 2>&1
eval_tap $? 236 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 237 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gBgyCd5vjkfz3eR4' \
    --platformUserId 'DtNp129hzBw3xLUc' \
    > test.out 2>&1
eval_tap $? 237 'PublicGetUserByPlatformUserIDV3' test.out

#- 238 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'CEt0DzmkJq1sml5b' \
    > test.out 2>&1
eval_tap $? 238 'PublicGetAsyncStatus' test.out

#- 239 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'Yt76BNsi4giR9434' \
    --limit '8' \
    --offset '32' \
    --query 'Fe8ATUqVxcSthrpn' \
    > test.out 2>&1
eval_tap $? 239 'PublicSearchUserV3' test.out

#- 240 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "MUBsnUfuQIcSbUt5", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "GkInFGpuUsdtq4dO", "policyId": "wNESzCEW9dUVhZjL", "policyVersionId": "ftC3sCS8CpLCqPD9"}, {"isAccepted": true, "localizedPolicyVersionId": "NOBWydXV0Fi02aFr", "policyId": "8CDapjwNOl4k8rVN", "policyVersionId": "rm8drv8QD2JOe2Nt"}, {"isAccepted": true, "localizedPolicyVersionId": "7rDBf2S54phbdyGD", "policyId": "t47f9GWRlE9hqz6r", "policyVersionId": "jDNo4rhjxUdMM83W"}], "authType": "ekqfWv04vvn9bk5q", "code": "r8qs2mqtnGAqXUjN", "country": "ypF6MMqWpdEJsPoa", "dateOfBirth": "IbYz8cK5jlpJdre5", "displayName": "ur6yvWJDdvM7T7PX", "emailAddress": "2vamIRZHzsIYOCUo", "password": "iCXNjrdQL2jdx1eI", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 240 'PublicCreateUserV3' test.out

#- 241 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'l1kCY5bEokxXxkWZ' \
    --query 'bjf7GZxaossQmjo6' \
    > test.out 2>&1
eval_tap $? 241 'CheckUserAvailability' test.out

#- 242 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["9wohJFyTNk5FGUPh", "R4LEZvz3EjFR7996", "Ug5m4axDV5uTcYso"]}' \
    > test.out 2>&1
eval_tap $? 242 'PublicBulkGetUsers' test.out

#- 243 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "ahUrELQ1btjJOqQM", "languageTag": "gZWAU6E92nHJzvw7"}' \
    > test.out 2>&1
eval_tap $? 243 'PublicSendRegistrationCode' test.out

#- 244 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "tnYtGfv0EJyjBu4E", "emailAddress": "zwRjD7jmQJeFPghq"}' \
    > test.out 2>&1
eval_tap $? 244 'PublicVerifyRegistrationCode' test.out

#- 245 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "amSc5y0X48eT7Mlu", "languageTag": "exk87b9Z5BTsEA3E"}' \
    > test.out 2>&1
eval_tap $? 245 'PublicForgotPasswordV3' test.out

#- 246 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'dmW8saabP4xRowfN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 246 'GetAdminInvitationV3' test.out

#- 247 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'ojzPXI2v0prR3OEe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "DKFS6u9FHuv1M3qf", "policyId": "ch4SqIV6LQPHlaeY", "policyVersionId": "l4csFq65cU66yJaj"}, {"isAccepted": false, "localizedPolicyVersionId": "EPgG40QyXzsOzgck", "policyId": "078IghoQBp2mWAOY", "policyVersionId": "ksczxBS0OBCa2vWa"}, {"isAccepted": false, "localizedPolicyVersionId": "k6oqYo1HQYTFzwdO", "policyId": "MdupwD4O3uNbcIDc", "policyVersionId": "IyvZbOy1T4hfwkuV"}], "authType": "EMAILPASSWD", "country": "aJoSqtrEOqxH46fR", "dateOfBirth": "TSZoDdT0fefo74eg", "displayName": "3Nt2c0r4GqF0NHgl", "password": "OVuNZ9LzNeJnBurh", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 247 'CreateUserFromInvitationV3' test.out

#- 248 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "FI8NijFI0GKwJ3vf", "country": "XlsAMy2Zp2UAGxHn", "dateOfBirth": "mSxvkG9UR5q9neoW", "displayName": "6JBcGp9Rx2RfcRhX", "languageTag": "pmeeHdvphas9S7iv", "userName": "HEoLbUMM47f1UreU"}' \
    > test.out 2>&1
eval_tap $? 248 'UpdateUserV3' test.out

#- 249 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "pxEkXIbE1ETzRJZK", "country": "Mavu4Ul2IaieEbPS", "dateOfBirth": "E7TGkeHsYsW9oGBN", "displayName": "1pYMBwbPZTlMlUvF", "languageTag": "EiGprcNSQ9kEeXBZ", "userName": "6FVrBzyhyhoS6a9o"}' \
    > test.out 2>&1
eval_tap $? 249 'PublicPartialUpdateUserV3' test.out

#- 250 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "e0JaXFpff28uYbe4", "emailAddress": "Cf2HEHvVevhISjbt", "languageTag": "BJUK5fE3OufPSX3P"}' \
    > test.out 2>&1
eval_tap $? 250 'PublicSendVerificationCodeV3' test.out

#- 251 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "dOU2V9yw94oa8UJ3", "contactType": "4TIedV3HyoX4VnO2", "languageTag": "LpBU08wfnlHBXFIq", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 251 'PublicUserVerificationV3' test.out

#- 252 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Hak1MXxj7Esrg790", "country": "0nml5BidsK9dCEzh", "dateOfBirth": "VnOv0PQbVIaKiHfo", "displayName": "eorY7A1otGFyv2SM", "emailAddress": "jbEr50qGdCZIc6EF", "password": "qBKxbS7Q2OgRucL1", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 252 'PublicUpgradeHeadlessAccountV3' test.out

#- 253 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "Acong6eNERUf8kjc", "password": "i1Ctccv9Gv4tOcbn"}' \
    > test.out 2>&1
eval_tap $? 253 'PublicVerifyHeadlessAccountV3' test.out

#- 254 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "uCqf0lm6WBkIzjoS", "newPassword": "V31tvmMB6jzrpRGE", "oldPassword": "SmooHiCV4GUOnXpa"}' \
    > test.out 2>&1
eval_tap $? 254 'PublicUpdatePasswordV3' test.out

#- 255 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'pXQGRakUbcG7PcR4' \
    > test.out 2>&1
eval_tap $? 255 'PublicCreateJusticeUser' test.out

#- 256 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'eiU3Idi55jNrGNT2' \
    --redirectUri 'VHTKuIT5FwwHj0Ur' \
    --ticket '5F2PWGTTD81xhNP4' \
    > test.out 2>&1
eval_tap $? 256 'PublicPlatformLinkV3' test.out

#- 257 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 't6kYBUjyXAn3bWQF' \
    --body '{"platformNamespace": "6QcAiJpXIrgroixp"}' \
    > test.out 2>&1
eval_tap $? 257 'PublicPlatformUnlinkV3' test.out

#- 258 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tZhckUTGkcBOE4qM' \
    > test.out 2>&1
eval_tap $? 258 'PublicPlatformUnlinkAllV3' test.out

#- 259 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'cH1Kyi8ZFvGcV8DY' \
    --ticket '0XOkDstxZcY1HgAn' \
    > test.out 2>&1
eval_tap $? 259 'PublicForcePlatformLinkV3' test.out

#- 260 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZV4IOglVLqb9lGAJ' \
    --clientId 'Ug21Lt7JwgwMUSuC' \
    --redirectUri '3Bajy3BcEMCtQs2F' \
    > test.out 2>&1
eval_tap $? 260 'PublicWebLinkPlatform' test.out

#- 261 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'cEcvVAyId6Cp85HV' \
    --code 'DsZBQgOnXuXsGThY' \
    --state 'Zrmm0wrFMnPpWgrQ' \
    > test.out 2>&1
eval_tap $? 261 'PublicWebLinkPlatformEstablish' test.out

#- 262 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'D4hEk0OLjYsnignE' \
    --code '7KcMF7fuDbzRRYMN' \
    --state 'XWUsp1tOibJY9aL9' \
    > test.out 2>&1
eval_tap $? 262 'PublicProcessWebLinkPlatformV3' test.out

#- 263 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ie6vvMbiNURrlm88", "emailAddress": "QlKyuoya4JgakZyU", "newPassword": "V7t73VnSFbuxd4KY"}' \
    > test.out 2>&1
eval_tap $? 263 'ResetPasswordV3' test.out

#- 264 PublicGetUserByUserIdV3
eval_tap 0 264 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 265 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z0jk0UZdhtnKu9oT' \
    --activeOnly  \
    --after 'c8pVkiyGsj5JdXzR' \
    --before 'xfNEjUMTs8WIObJB' \
    --limit '93' \
    > test.out 2>&1
eval_tap $? 265 'PublicGetUserBanHistoryV3' test.out

#- 266 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IRUQmauIY5HXCZ0W' \
    > test.out 2>&1
eval_tap $? 266 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 267 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4XmWP0HzSdiylLhV' \
    > test.out 2>&1
eval_tap $? 267 'PublicGetUserInformationV3' test.out

#- 268 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yszm8xY33OQbumu2' \
    --after '0.6829962783059862' \
    --before '0.5394669051741366' \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 268 'PublicGetUserLoginHistoriesV3' test.out

#- 269 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yiLBRVtIDi2piIQF' \
    --after 'VmzMidw70KSahpYZ' \
    --before 'dKZRyR9AX7JjxvNZ' \
    --limit '14' \
    --platformId 'VgtX7y0fPOieDCow' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetUserPlatformAccountsV3' test.out

#- 270 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2zXyFFVpM87yqEwE' \
    > test.out 2>&1
eval_tap $? 270 'PublicListJusticePlatformAccountsV3' test.out

#- 271 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'acQMTlqN4LKkxJ5v' \
    --body '{"platformId": "3SBafnKNiMPbFkFG", "platformUserId": "A85W3HJkqgS2B37w"}' \
    > test.out 2>&1
eval_tap $? 271 'PublicLinkPlatformAccount' test.out

#- 272 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'woPYOHiIsxmsLBPB' \
    --body '{"chosenNamespaces": ["JuNLnWRrtW870qD8", "8ZcduZSe7W20UZcD", "aiq0nEZ7PyhqFJkD"], "requestId": "ClOsKmfsgJdmzsDP"}' \
    > test.out 2>&1
eval_tap $? 272 'PublicForceLinkPlatformWithProgression' test.out

#- 273 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sWh1k0cQ08NG6dX2' \
    > test.out 2>&1
eval_tap $? 273 'PublicGetPublisherUserV3' test.out

#- 274 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TZkil67kRngoUa83' \
    --password 'ECh1gqPeS193TNNz' \
    > test.out 2>&1
eval_tap $? 274 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 275 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'ot3sVli3GN2XTrFi' \
    --before 'bRAhzzEWzWlTY70q' \
    --isWildcard  \
    --limit '6' \
    > test.out 2>&1
eval_tap $? 275 'PublicGetRolesV3' test.out

#- 276 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'mQafUs2bxYztOEyV' \
    > test.out 2>&1
eval_tap $? 276 'PublicGetRoleV3' test.out

#- 277 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 277 'PublicGetMyUserV3' test.out

#- 278 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'bKIf1ZbzgUwd8DHo' \
    > test.out 2>&1
eval_tap $? 278 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 279 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["CQykmXHYmkRlg7gY", "s6unPYQ9jNQN1di1", "ldhOh6HvjnYuV7Nf"], "oneTimeLinkCode": "C4A2ODiZhbfb8QqC"}' \
    > test.out 2>&1
eval_tap $? 279 'LinkHeadlessAccountToMyAccountV3' test.out

#- 280 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "yK1XH9D6vl5eFdFf"}' \
    > test.out 2>&1
eval_tap $? 280 'PublicSendVerificationLinkV3' test.out

#- 281 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'gK46GjCWaP8huTmn' \
    > test.out 2>&1
eval_tap $? 281 'PublicVerifyUserByLinkV3' test.out

#- 282 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'q3FGQn3Ahu5wxq6o' \
    --code 'Jq4mChmQHQhO9IKB' \
    --error 'XDFQfXFD58sG6uDh' \
    --state 'FYlrzJBYSeMuJfQe' \
    > test.out 2>&1
eval_tap $? 282 'PlatformAuthenticateSAMLV3Handler' test.out

#- 283 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'cutjS029BiJWOG1m' \
    --payload '7MKclr5igjNTVItr' \
    > test.out 2>&1
eval_tap $? 283 'LoginSSOClient' test.out

#- 284 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'H2X78hxJgaVfw5Vn' \
    > test.out 2>&1
eval_tap $? 284 'LogoutSSOClient' test.out

#- 285 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --additionalData 'yq8OzTE89WDNoMcO' \
    --code 'mbfJrCJQIj1haAos' \
    > test.out 2>&1
eval_tap $? 285 'RequestGameTokenResponseV3' test.out

#- 286 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'KglqaCXE9ytpIO8b' \
    --platformToken 'tO3OwNEGSW5TaW4t' \
    > test.out 2>&1
eval_tap $? 286 'PlatformTokenRefreshV3' test.out

#- 287 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'o7QCY2NGGvi9kg3r' \
    > test.out 2>&1
eval_tap $? 287 'AdminGetDevicesByUserV4' test.out

#- 288 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'MIzNmhJTNQjKlwjf' \
    --endDate 'J3TJ2xVpge70WsLf' \
    --limit '13' \
    --offset '13' \
    --startDate 'bZieRvJI5sT9DH3D' \
    > test.out 2>&1
eval_tap $? 288 'AdminGetBannedDevicesV4' test.out

#- 289 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fLCv8q4Thmq09bBg' \
    > test.out 2>&1
eval_tap $? 289 'AdminGetUserDeviceBansV4' test.out

#- 290 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "PAYxrBE9jlnTgtgW", "deviceId": "33wDwD9RKvQX4yFQ", "deviceType": "FdrRoM6FoqCYw7Al", "enabled": true, "endDate": "5KDdUvk0LEi26Ls7", "ext": {"mjRxNmvvNtjJNQep": {}, "UTGhwlY4lPzlsCR5": {}, "rVsyfcH7WjP7HuGz": {}}, "reason": "3b5WAEvdRF9bqMj4"}' \
    > test.out 2>&1
eval_tap $? 290 'AdminBanDeviceV4' test.out

#- 291 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'ro5B19VE838c7Oyd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'AdminGetDeviceBanV4' test.out

#- 292 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'Vw0zCqoMZvpIOO97' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 292 'AdminUpdateDeviceBanV4' test.out

#- 293 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate '03coRFok5d3AyGrZ' \
    --startDate 'O8GuoXNSoVEBG7Vb' \
    --deviceType 'BPUWipz9C05YabFX' \
    > test.out 2>&1
eval_tap $? 293 'AdminGenerateReportV4' test.out

#- 294 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 294 'AdminGetDeviceTypesV4' test.out

#- 295 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '4FCK5ucTFsAFzaO3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 295 'AdminGetDeviceBansV4' test.out

#- 296 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'yJpA3KMxBlrRytER' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 296 'AdminDecryptDeviceV4' test.out

#- 297 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId '1qdTelFAadM9y66D' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 297 'AdminUnbanDeviceV4' test.out

#- 298 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'rf4SSGGt3MiBKoho' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 298 'AdminGetUsersByDeviceV4' test.out

#- 299 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 45}' \
    > test.out 2>&1
eval_tap $? 299 'AdminCreateTestUsersV4' test.out

#- 300 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["UjVAw4v3q6JRHcn7", "KaoCEkRdo6qHYIZW", "nXqQ1oHFJ9Q0vqsL"]}' \
    > test.out 2>&1
eval_tap $? 300 'AdminBulkCheckValidUserIDV4' test.out

#- 301 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '9SomqWsGA76yxi0Q' \
    --body '{"avatarUrl": "zZWfmP2sx0KO5bEJ", "country": "aPnAFjsodyJQVVBr", "dateOfBirth": "ShGbIIuqK8C403Hg", "displayName": "oXCR6XOMXwKdfqk8", "languageTag": "T4QHK30EX0FclpDl", "userName": "5HsuracO5MnjnxD1"}' \
    > test.out 2>&1
eval_tap $? 301 'AdminUpdateUserV4' test.out

#- 302 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OXkxShFVQTRekLfj' \
    --body '{"code": "my8zosRCRgVwbrQK", "emailAddress": "mb01yA7U7dGMjupZ"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminUpdateUserEmailAddressV4' test.out

#- 303 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kZQY8CNyT4k3DIbf' \
    > test.out 2>&1
eval_tap $? 303 'AdminDisableUserMFAV4' test.out

#- 304 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'T22G5NpE130YWSgx' \
    > test.out 2>&1
eval_tap $? 304 'AdminListUserRolesV4' test.out

#- 305 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pKWtdtdtVW9anENm' \
    --body '{"assignedNamespaces": ["xb9e7vXZV3ig8Jg5", "VByeI3ycMcYYBixK", "JXCISQdwec1m8Bus"], "roleId": "V9tUh74KVo6Xqjz2"}' \
    > test.out 2>&1
eval_tap $? 305 'AdminUpdateUserRoleV4' test.out

#- 306 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xUKLNWSmYyVvyelI' \
    --body '{"assignedNamespaces": ["J8QgaLMqi836ULa7", "cfZl4VuY6rsZyo6C", "BRRnoOikIxXKKIR6"], "roleId": "kPmswm5TCAU1cKAp"}' \
    > test.out 2>&1
eval_tap $? 306 'AdminAddUserRoleV4' test.out

#- 307 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dJDnE73GLmSZns5o' \
    --body '{"assignedNamespaces": ["wBhoUg4LsGP6KLPX", "kvUv2XiXaBzsmaxj", "TZPlLitytGka7Kv5"], "roleId": "TacQKF4OlRGdmXxE"}' \
    > test.out 2>&1
eval_tap $? 307 'AdminRemoveUserRoleV4' test.out

#- 308 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '93' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 308 'AdminGetRolesV4' test.out

#- 309 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "Gy83Xit6boOLGCcg"}' \
    > test.out 2>&1
eval_tap $? 309 'AdminCreateRoleV4' test.out

#- 310 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId '16DqwdQPQ9HkSSV8' \
    > test.out 2>&1
eval_tap $? 310 'AdminGetRoleV4' test.out

#- 311 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'e1MgTTLS2FgarY90' \
    > test.out 2>&1
eval_tap $? 311 'AdminDeleteRoleV4' test.out

#- 312 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId '3INGIyEfRBEj7qms' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "ExPhgr9gGfC0Gjvp"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateRoleV4' test.out

#- 313 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'gJfuBs1Vpqn47GVg' \
    --body '{"permissions": [{"action": 16, "resource": "wCwGqOf0bNs97KvK", "schedAction": 51, "schedCron": "9Xwt3wmRTrDCjhnK", "schedRange": ["vsHezWTqgYPixtHk", "6lWq6tEeUmU96FLE", "ak0mJqjRYldcTpde"]}, {"action": 59, "resource": "v2vancmR6Z7rb21A", "schedAction": 76, "schedCron": "E9pX0BWCMqPsRk5h", "schedRange": ["tdM5T3fDSrSHrkoq", "v2mM6soMaTvQq2a9", "YdFNtRVSO0js0hG9"]}, {"action": 47, "resource": "8Z27GpvHCDx55JZ5", "schedAction": 53, "schedCron": "kXk17QPkJHRhmLKQ", "schedRange": ["uQVFSKiXl8G2uf6E", "8EajXLSAS8MKMaxQ", "1QyJCpKedhuzI7G9"]}]}' \
    > test.out 2>&1
eval_tap $? 313 'AdminUpdateRolePermissionsV4' test.out

#- 314 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'NCKKXu1bqI2M5PmX' \
    --body '{"permissions": [{"action": 12, "resource": "16sZ6rjnkH4ExObp", "schedAction": 32, "schedCron": "oRvWnfmGFy0eUoOB", "schedRange": ["d90h9EDqSTOfoNew", "WjwMWDKEt6JhbJ0f", "wTDaq6b5RpMwhWPt"]}, {"action": 28, "resource": "tJy1Oqn59tEGm9NY", "schedAction": 10, "schedCron": "Vc12r0DVUGgGHkap", "schedRange": ["TCafFMdvYiCBuzUU", "wyI6Vtd4v9k4fv3k", "MiuQ3DhsKLxjt5sr"]}, {"action": 85, "resource": "56eW1kmb15QeIQF5", "schedAction": 5, "schedCron": "U53z6joBAhAlJGI2", "schedRange": ["YYb6ajBjgq6eY4PB", "NHKPx62tHxDb06ZF", "y3uglSp2UxvF2uLX"]}]}' \
    > test.out 2>&1
eval_tap $? 314 'AdminAddRolePermissionsV4' test.out

#- 315 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'WilRD7HD6LCgdFxR' \
    --body '["Gj00RT6LvcnGMJbJ", "IYLssMvy9gkfTMRr", "XVRcAVRDX6gmDfNf"]' \
    > test.out 2>&1
eval_tap $? 315 'AdminDeleteRolePermissionsV4' test.out

#- 316 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'PGYYSTunMgt3C8hE' \
    --after 'guCqlMHiQN3HWJw9' \
    --before 'zIWsiP2JQ24meDrw' \
    --limit '62' \
    > test.out 2>&1
eval_tap $? 316 'AdminListAssignedUsersV4' test.out

#- 317 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'lcYaqYM7YfBmhjI9' \
    --body '{"assignedNamespaces": ["Y28qVceS9UX48dKP", "CFUIeyYEymNXzNX6", "TGh4UdEweeBsJEvB"], "namespace": "bAvCmlh6Z1oz9Bai", "userId": "xUUvmzbajE2gjooi"}' \
    > test.out 2>&1
eval_tap $? 317 'AdminAssignUserToRoleV4' test.out

#- 318 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'Dnc1NUb51lEgUwQ9' \
    --body '{"namespace": "tkWaMOH47CAT7cBP", "userId": "0918JaEBQBP766LU"}' \
    > test.out 2>&1
eval_tap $? 318 'AdminRevokeUserFromRoleV4' test.out

#- 319 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["nBBR84iAO7sBQt6Y", "J2tWwF7RnP1oK3c4", "RVfjB0zi3XrYZUiN"], "emailAddresses": ["24ol1qqbalgizL97", "ycJV5YqE2myQzl7X", "9fHr6WvBxmBvNj3k"], "isAdmin": true, "namespace": "2PMv12ZSRJkujxbC", "roleId": "u1HFaj6Vxs3GuA4S"}' \
    > test.out 2>&1
eval_tap $? 319 'AdminInviteUserNewV4' test.out

#- 320 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "1dS7H7yIS7b5TSDR", "country": "IoMg7Dc5APzfzXDE", "dateOfBirth": "LJFaIaEMW5bhJyL7", "displayName": "2WDyhBsCCbnfihnX", "languageTag": "KxGxaupnTTq9ihZk", "userName": "vFKfSHQh8I9xk3sF"}' \
    > test.out 2>&1
eval_tap $? 320 'AdminUpdateMyUserV4' test.out

#- 321 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 321 'AdminDisableMyAuthenticatorV4' test.out

#- 322 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'l0cbuCRM69XKkLwi' \
    > test.out 2>&1
eval_tap $? 322 'AdminEnableMyAuthenticatorV4' test.out

#- 323 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 323 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 324 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 324 'AdminGetMyBackupCodesV4' test.out

#- 325 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 325 'AdminGenerateMyBackupCodesV4' test.out

#- 326 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 326 'AdminDisableMyBackupCodesV4' test.out

#- 327 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 327 'AdminDownloadMyBackupCodesV4' test.out

#- 328 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 328 'AdminEnableMyBackupCodesV4' test.out

#- 329 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 329 'AdminSendMyMFAEmailCodeV4' test.out

#- 330 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 330 'AdminDisableMyEmailV4' test.out

#- 331 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'oRaKnWhlh80BhYe2' \
    > test.out 2>&1
eval_tap $? 331 'AdminEnableMyEmailV4' test.out

#- 332 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 332 'AdminGetMyEnabledFactorsV4' test.out

#- 333 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'fJDS6T75Q4ulonMF' \
    > test.out 2>&1
eval_tap $? 333 'AdminMakeFactorMyDefaultV4' test.out

#- 334 AdminInviteUserV4
eval_tap 0 334 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 335 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "s3OSesE5p0DwUj2H", "policyId": "KUvPYUcQBxMSdOOs", "policyVersionId": "n2Nd8Jpa19GJDK46"}, {"isAccepted": true, "localizedPolicyVersionId": "DEZywonA2SrEdN2t", "policyId": "mGuX6r0gBVUUeKKl", "policyVersionId": "PKtE6gnYxmkmCWbs"}, {"isAccepted": false, "localizedPolicyVersionId": "qugklBUS6uwWrCQt", "policyId": "86Jrg8tLAJWpcyNk", "policyVersionId": "Uvqn6eXr6FNbKJ05"}], "authType": "EMAILPASSWD", "country": "rya6LSSUlugIAknX", "dateOfBirth": "cSaVYcAYp7qSiDvs", "displayName": "fMUOpWv46sXvpOjr", "emailAddress": "pRo4mYrCeQUnYoID", "password": "2UqO0iAXA9dB4ib8", "passwordMD5Sum": "HDOJ8TNiP8KgEAj3", "username": "dbRTI0i6dO3zkbDs", "verified": false}' \
    > test.out 2>&1
eval_tap $? 335 'PublicCreateTestUserV4' test.out

#- 336 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "h4tJdoGcwMBmegqV", "policyId": "UaWMJBjrV0p9A7tc", "policyVersionId": "HrV0MbJGr4drgkDu"}, {"isAccepted": false, "localizedPolicyVersionId": "S05m0pGzazM2BUXn", "policyId": "zUEWTiKMJAf6Agbi", "policyVersionId": "EDMfCckWogE5gcfF"}, {"isAccepted": true, "localizedPolicyVersionId": "AMGZ2FBS93Mg6TKw", "policyId": "dRMraDLrwh3d0ykR", "policyVersionId": "GkgqUNIbJMJ9ABbK"}], "authType": "EMAILPASSWD", "code": "EDiqkwKbpdk7wlDn", "country": "gNiPPjpSAlZwFGpe", "dateOfBirth": "a5ObBB49Km4ClIQm", "displayName": "kIdLCvNhZ6P8aqZ2", "emailAddress": "yfrC1V7ZpJZPHCMq", "password": "vcYmeDLYEzs2SQUd", "passwordMD5Sum": "Kr6vgqkjycqclNlB", "reachMinimumAge": true, "username": "lC8ZkjsxYtgxplHT"}' \
    > test.out 2>&1
eval_tap $? 336 'PublicCreateUserV4' test.out

#- 337 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'PLzynjFZgF3erw7U' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "svTyo9RHget5hzB5", "policyId": "2BDFopxUwkMuSqQn", "policyVersionId": "KzDgDAtqE3kuybwT"}, {"isAccepted": false, "localizedPolicyVersionId": "YEJjIYwqfSRy8GgV", "policyId": "k77fd1GS5YkyhAiA", "policyVersionId": "ItnWUmD225fp1egs"}, {"isAccepted": true, "localizedPolicyVersionId": "5DSO8JyX4IE1z3rD", "policyId": "wZ1HKsOpyq8agQuz", "policyVersionId": "86nc6jLF9DIW2ncJ"}], "authType": "EMAILPASSWD", "country": "KpqmgvUTr8XAtpOq", "dateOfBirth": "UQxzqJZiWi3KQffT", "displayName": "5Tn61A1xW6okIqmd", "password": "87ir9op4YfGTno5o", "reachMinimumAge": true, "username": "zqY3DgykA8zBJX0r"}' \
    > test.out 2>&1
eval_tap $? 337 'CreateUserFromInvitationV4' test.out

#- 338 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "kOHUkY5aSlqhYoSX", "country": "bn6l5xAzc1nc3eFm", "dateOfBirth": "950dtVAo7w4e3v5m", "displayName": "h6Rum5pbgEt39uJQ", "languageTag": "pgEtchTe3nt7t9zt", "userName": "prSfW9OutADrNGBW"}' \
    > test.out 2>&1
eval_tap $? 338 'PublicUpdateUserV4' test.out

#- 339 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "SJ1zQKxVmRTawjiZ", "emailAddress": "PMoZZcyGEHxAKDQh"}' \
    > test.out 2>&1
eval_tap $? 339 'PublicUpdateUserEmailAddressV4' test.out

#- 340 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "er3usApPdJPn9eId", "country": "hIBvTTupABJ4RwH3", "dateOfBirth": "EdKmYtbqQHNfIZwr", "displayName": "Mxf3EnzZVnkLT0Lb", "emailAddress": "85nmpdN26BY5YI0j", "password": "eO2zMDSy4kyqyKgr", "reachMinimumAge": true, "username": "swAGpXqQxctuVaqP", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 340 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 341 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "GAHEZmuQrZ8GaQ4O", "password": "Z2nDodm4TNs8mAj6", "username": "IKSYFdJwgZsRPOzw"}' \
    > test.out 2>&1
eval_tap $? 341 'PublicUpgradeHeadlessAccountV4' test.out

#- 342 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'PublicDisableMyAuthenticatorV4' test.out

#- 343 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'uDSdGl1A2vaNeDiS' \
    > test.out 2>&1
eval_tap $? 343 'PublicEnableMyAuthenticatorV4' test.out

#- 344 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 344 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 345 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'PublicGetMyBackupCodesV4' test.out

#- 346 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'PublicGenerateMyBackupCodesV4' test.out

#- 347 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 347 'PublicDisableMyBackupCodesV4' test.out

#- 348 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'PublicDownloadMyBackupCodesV4' test.out

#- 349 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 349 'PublicEnableMyBackupCodesV4' test.out

#- 350 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'qTfmAVg50kOdJagE' \
    > test.out 2>&1
eval_tap $? 350 'PublicRemoveTrustedDeviceV4' test.out

#- 351 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 351 'PublicSendMyMFAEmailCodeV4' test.out

#- 352 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 352 'PublicDisableMyEmailV4' test.out

#- 353 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'mTuaxlxgywkbdOsy' \
    > test.out 2>&1
eval_tap $? 353 'PublicEnableMyEmailV4' test.out

#- 354 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 354 'PublicGetMyEnabledFactorsV4' test.out

#- 355 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'xX1tfW488oYUT4jy' \
    > test.out 2>&1
eval_tap $? 355 'PublicMakeFactorMyDefaultV4' test.out

#- 356 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CVJ0V8obTlGVThz4' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 357 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"emailAddress": "bm41oIcV33yjPxib", "namespace": "DjfF7JkjCVpZKMxk", "namespaceDisplayName": "FkBtXMU6KRIm5xBo"}' \
    > test.out 2>&1
eval_tap $? 357 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE