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
echo "1..352"

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

#- 144 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'M5nQFMGzs7fzjgyc' \
    --body '{"bulkUserId": ["44mEh9tRk8knYSV3", "0lnroQehMDli6t9u", "nQLYXxm09wpGAbpE"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminGetBulkUserBanV3' test.out

#- 145 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["mDY9vLh3u6EDsUmr", "V6kH4OotKwG3UC6X", "CnnZxF8CmQr17W65"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminListUserIDByUserIDsV3' test.out

#- 146 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["br34rBBN9tU6TDm5", "GloFSKWM1eym5ydC", "6p25xCWTqUOYZENJ"], "isAdmin": true, "namespace": "ZQxPRXH7uxBJEECQ", "roles": ["E1li3Bg7Jxc9pUnZ", "mvhidwCkZwqjYLfT", "iCO1NDBvQvRPnAz4"]}' \
    > test.out 2>&1
eval_tap $? 146 'AdminInviteUserV3' test.out

#- 147 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '33' \
    --platformUserId 'zW0CpoBCbyJsF5Ij' \
    --platformId 'F1c0W338HS6CBgVR' \
    > test.out 2>&1
eval_tap $? 147 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 148 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 148 'AdminListUsersV3' test.out

#- 149 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'ihYNZ84CVhziXV8H' \
    --endDate 'wSmvcvcDKF19yVRa' \
    --limit '11' \
    --offset '59' \
    --platformBy 'lPKvqDejvqklTSvD' \
    --platformId 'wuOrP9lzpiX0VuFp' \
    --query 'Zum7izxe7NPzjOa8' \
    --startDate 'E7wY76PxLv9HBEUe' \
    > test.out 2>&1
eval_tap $? 149 'AdminSearchUserV3' test.out

#- 150 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["89AwEw1HO4FnKtx4", "XLKAmlDr19uJ3nq6", "VerzVCcI8y3Cz0Yq"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminGetBulkUserByEmailAddressV3' test.out

#- 151 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CKUh5RD9vNAp4jin' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserByUserIdV3' test.out

#- 152 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FpnQ5xF9wwbvMZye' \
    --body '{"avatarUrl": "DeRnVfPUa6xVVBcq", "country": "3wZpFIYeAg79HcLJ", "dateOfBirth": "XJ7mpVI6eTYAjdPl", "displayName": "CiQQC35cj4KyOVgv", "languageTag": "nWbfRJtsB7cUQZ2Q", "userName": "UAxJrINPXppPNO3A"}' \
    > test.out 2>&1
eval_tap $? 152 'AdminUpdateUserV3' test.out

#- 153 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fmXcgwC3IN6tvKgL' \
    --activeOnly  \
    --after 'B9QmJIOq9dP5szG7' \
    --before '1utjsQ4CrRb9gUCe' \
    --limit '97' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserBanV3' test.out

#- 154 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GMNIpWoSLkUrfuf4' \
    --body '{"ban": "U3WeYeA9t2ENKKWr", "comment": "FtHIi1CMgKAOG5iD", "endDate": "cCR5PbCvDLil8wj9", "reason": "cKM3Ar6MF35hCER4", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 154 'AdminBanUserV3' test.out

#- 155 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'JxEN7JlZc8LMq1o2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jZWu4yA3r0u4q1bT' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 155 'AdminUpdateUserBanV3' test.out

#- 156 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jfJKyFlM0u1uuoVd' \
    --body '{"context": "n9yVoSlKNchPHNL4", "emailAddress": "X3LLaGPGdqLE8Soh", "languageTag": "hhuiTnJarYYkHBDd"}' \
    > test.out 2>&1
eval_tap $? 156 'AdminSendVerificationCodeV3' test.out

#- 157 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SzBXdxapwhd5IQYB' \
    --body '{"Code": "QuxLvPuWYvE3fsNy", "ContactType": "9Z9OhxXvCp9y7fLD", "LanguageTag": "2qfCXnlUnqxT1WsR", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 157 'AdminVerifyAccountV3' test.out

#- 158 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZcA92hzC7MNa8vVe' \
    > test.out 2>&1
eval_tap $? 158 'GetUserVerificationCode' test.out

#- 159 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4MHX6AgMep90AyyU' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetUserDeletionStatusV3' test.out

#- 160 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JyAK5PRMRMwdvl0h' \
    --body '{"deletionDate": 44, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpdateUserDeletionStatusV3' test.out

#- 161 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6g62GxBW2tQF5tkT' \
    --body '{"code": "jgJaMYvNQOsDa4bk", "country": "cgepqtxjbrztee7Q", "dateOfBirth": "LTGAak7Kaol01DK9", "displayName": "7D2xnik42miteR5e", "emailAddress": "QAe1rzmmgqBPRmd6", "password": "mO4oI8KDqebm83ra", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 161 'AdminUpgradeHeadlessAccountV3' test.out

#- 162 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BJ5y7axEkvI4oxZE' \
    > test.out 2>&1
eval_tap $? 162 'AdminDeleteUserInformationV3' test.out

#- 163 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DxGiBnNbn0zaf7Ca' \
    --after '0.6564112555276437' \
    --before '0.7207017506563886' \
    --limit '24' \
    > test.out 2>&1
eval_tap $? 163 'AdminGetUserLoginHistoriesV3' test.out

#- 164 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mO07KNqX9LM2IwEs' \
    --body '{"languageTag": "dOGBXBwnzDX8v3xg", "newPassword": "C1Ge9PdbTTAJ2Gp1", "oldPassword": "r0sVZ6LJAOddIL2l"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminResetPasswordV3' test.out

#- 165 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3hPjNDKv2LWfXqjr' \
    --body '{"Permissions": [{"Action": 83, "Resource": "fS79En3wYowBdkaZ", "SchedAction": 45, "SchedCron": "y6i38XQjLDRqkpiF", "SchedRange": ["K5BtiQ272Uo9UBJW", "odpdwsX1jorcyR0x", "3YiHF8ITGPRQBCgI"]}, {"Action": 38, "Resource": "S4AdlNzwog2IhErk", "SchedAction": 81, "SchedCron": "h4gUoj8u2WRcLiEt", "SchedRange": ["zVlnkflfn7pHY48F", "1dl1q92m3iRlfnBA", "k0CwiAsR65yQ9ssu"]}, {"Action": 69, "Resource": "rs3CUYATdqnQGbqi", "SchedAction": 34, "SchedCron": "GbruNB72HHMkjzyB", "SchedRange": ["B4UFKiaoV0VOem2y", "qPsMFxKybPkbuS6x", "9cLJ1APnNlsa2bRB"]}]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateUserPermissionV3' test.out

#- 166 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'r27fVMWuAfDqLMR9' \
    --body '{"Permissions": [{"Action": 52, "Resource": "9IZPKOKiAVQXXOmq", "SchedAction": 65, "SchedCron": "2OspCZbt3Uta5I0u", "SchedRange": ["GcL1koyHjCH5olYL", "ETRpABAmO2EGvJ4U", "MS93yOxNInDByhno"]}, {"Action": 23, "Resource": "kG8bXGFmPAnOkDiJ", "SchedAction": 34, "SchedCron": "zOj84O6tgohjtC7b", "SchedRange": ["zjPpucddXJ5zifF8", "y959anrNSleywHbH", "ig6IKWVZ77KeRWdE"]}, {"Action": 59, "Resource": "jb39ukcR6c2E2r3v", "SchedAction": 22, "SchedCron": "n7M23SzUo4hNBDh9", "SchedRange": ["ZFP1OW0nXOErQPS4", "VsRoYIK69yg9ADCG", "iXaLs2xjHkinOD97"]}]}' \
    > test.out 2>&1
eval_tap $? 166 'AdminAddUserPermissionsV3' test.out

#- 167 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5nARHCmhNHSXuqIH' \
    --body '[{"Action": 38, "Resource": "3ahvxw9gwwhTnjN6"}, {"Action": 45, "Resource": "uD3QxCXMd00YBWCa"}, {"Action": 99, "Resource": "hhZhwAiLsZs4pmLD"}]' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserPermissionBulkV3' test.out

#- 168 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '70' \
    --namespace "$AB_NAMESPACE" \
    --resource '6dGGJwJ00UH197MJ' \
    --userId '6zU7JLMQyMWzYQCA' \
    > test.out 2>&1
eval_tap $? 168 'AdminDeleteUserPermissionV3' test.out

#- 169 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aPJgoxGJoJaSzUtY' \
    --after '4ZD0Xtb0U4pH16NU' \
    --before 'sVY21NVIs7NRen2Y' \
    --limit '9' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetUserPlatformAccountsV3' test.out

#- 170 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ns0QJQeaWytPfds1' \
    > test.out 2>&1
eval_tap $? 170 'AdminGetListJusticePlatformAccounts' test.out

#- 171 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'BYx0EaURydf8ZyyZ' \
    --userId 'eHAWGgJUbUJRMbkc' \
    > test.out 2>&1
eval_tap $? 171 'AdminGetUserMapping' test.out

#- 172 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'TglbU86FyOjApNHB' \
    --userId 'VfNOURcjY3YYT9oT' \
    > test.out 2>&1
eval_tap $? 172 'AdminCreateJusticeUser' test.out

#- 173 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'ynmfIuBWgJTNFfM8' \
    --body '{"platformId": "M0IW4oe8KDgy0xZf", "platformUserId": "AcNg14Ws8TIP1LKi"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminLinkPlatformAccount' test.out

#- 174 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FQoLDvumfqrgSfnx' \
    --userId '2h61X9dN1MGRXBJ6' \
    --body '{"platformNamespace": "mVV7JS9qjNLwvI8J"}' \
    > test.out 2>&1
eval_tap $? 174 'AdminPlatformUnlinkV3' test.out

#- 175 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'diY3RRiLilmOGF6d' \
    --userId 'LLIeIVIjMcdlbdRX' \
    --ticket 'TGIrdNL5gJPqTAjg' \
    > test.out 2>&1
eval_tap $? 175 'AdminPlatformLinkV3' test.out

#- 176 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qaTHf1ANTJ9Yk997' \
    --userId 'XkGOdC6ItxDT8p4n' \
    --platformToken '4XCFkD1AJLCwszbZ' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 177 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xuHSgDOK8bjoF7bL' \
    --userId '2635KbtZTGJpqgl2' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetUserSinglePlatformAccount' test.out

#- 178 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IzNXGTuQPIDpor7t' \
    --body '["1aJLNNz6QIVC9Mfu", "c8VOsnmnlVljdWYm", "ELe74p38vumnxAnY"]' \
    > test.out 2>&1
eval_tap $? 178 'AdminDeleteUserRolesV3' test.out

#- 179 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BTxaTIz0jcgDI8Pk' \
    --body '[{"namespace": "z96vd80msqIm5buf", "roleId": "nBqrpLeqhwVhjnnj"}, {"namespace": "KMEmtbiWsAQHbMrK", "roleId": "Yi0Zxs5SWCqZXHLL"}, {"namespace": "a31oQf7BULnZDhut", "roleId": "DM6BqguqD5xxGxBW"}]' \
    > test.out 2>&1
eval_tap $? 179 'AdminSaveUserRoleV3' test.out

#- 180 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'tnTKUe2znsqPzPkw' \
    --userId 'CBo2SwCUsTag4MLA' \
    > test.out 2>&1
eval_tap $? 180 'AdminAddUserRoleV3' test.out

#- 181 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'o3m61P2xaNfmn8On' \
    --userId 'b1a9gMz0F2UBRmMh' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserRoleV3' test.out

#- 182 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AbUWmFhdYLWzMuv3' \
    --body '{"enabled": true, "reason": "C66szbCCf73IFbRk"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateUserStatusV3' test.out

#- 183 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PSSITz4TjCrJHXGX' \
    > test.out 2>&1
eval_tap $? 183 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 184 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'ku2YVuOzhxHmnrrV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "9ZGWrZ05sxe6A6Rp"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminUpdateClientSecretV3' test.out

#- 185 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'mKDebNkylbynkgT9' \
    --before 'vayLLiizac7Ge6zK' \
    --isWildcard  \
    --limit '72' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRolesV3' test.out

#- 186 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "managers": [{"displayName": "uksQJCiRFiZWwJ7N", "namespace": "rTb1XTB9YQzUJ9Xl", "userId": "YJ8BzP6EUmUXGM5a"}, {"displayName": "nIloyj9lhbvuQdW2", "namespace": "jwKUckc794ryY91l", "userId": "X8DD4MYXlrJ81lHv"}, {"displayName": "v9rqvEoM8YmVjAkO", "namespace": "3HKsEp6KlqwW4djr", "userId": "excbHdEtoQvpV344"}], "members": [{"displayName": "RctmTozCi8HeV6jb", "namespace": "alHmqBBfi7sSF5Bo", "userId": "GiTCVsXsygWbjE2o"}, {"displayName": "pXtdsJQeJ1too0qv", "namespace": "xphTLEEBGTtZyTjd", "userId": "KNKgYazujsmSmylT"}, {"displayName": "1YtxIq73aMb48jIS", "namespace": "d97KORRhxSWLWLNf", "userId": "HRD3V15QaGGL46Lu"}], "permissions": [{"action": 49, "resource": "YTYZbzf5aANNNs5k", "schedAction": 14, "schedCron": "AKx27MSBqabUXOGk", "schedRange": ["koMUZn1YXj5zFZeO", "COR9NvBQZSJPOIKr", "RBrYVzi9ui3lvozT"]}, {"action": 39, "resource": "RH36bqS2oFY76PU1", "schedAction": 54, "schedCron": "kk11sys6GdkDcos5", "schedRange": ["uVJ0BJfZ0jvA54CS", "qZFDsO1skRjOU1SM", "fQVQa6blj9Rdd85b"]}, {"action": 6, "resource": "OJYMnW49rWynp1ck", "schedAction": 44, "schedCron": "vT90C6o86cSRL9cg", "schedRange": ["bUmulhe98oaFKlQi", "cdrxVhrtwSd9QWVM", "Yz7TU1TsxsChSclS"]}], "roleName": "kb5aBi9K9zyv6gFZ"}' \
    > test.out 2>&1
eval_tap $? 186 'AdminCreateRoleV3' test.out

#- 187 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'XI5nXJ7hLi6Hwewe' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetRoleV3' test.out

#- 188 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'Rmyo91dIn7QqXBDX' \
    > test.out 2>&1
eval_tap $? 188 'AdminDeleteRoleV3' test.out

#- 189 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'JcrqKmXDwoEV6tCd' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "afIjLX8ce0KbNN7Y"}' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpdateRoleV3' test.out

#- 190 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'cl2JfmQplvGjVQ4a' \
    > test.out 2>&1
eval_tap $? 190 'AdminGetRoleAdminStatusV3' test.out

#- 191 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'ebjfgGu472oWJlfg' \
    > test.out 2>&1
eval_tap $? 191 'AdminUpdateAdminRoleStatusV3' test.out

#- 192 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'lLM4xjfkNL4lU6ja' \
    > test.out 2>&1
eval_tap $? 192 'AdminRemoveRoleAdminV3' test.out

#- 193 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'GfsD1cfswmeFpvtD' \
    --after 'tetoQVFL8LNW11vt' \
    --before 'paTxi7k489jRCn48' \
    --limit '2' \
    > test.out 2>&1
eval_tap $? 193 'AdminGetRoleManagersV3' test.out

#- 194 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'qFTi1t530Wj1WfzI' \
    --body '{"managers": [{"displayName": "vc3VlSXrA3XUGud4", "namespace": "tVjmxEf4XvVhFJTx", "userId": "FHITBg9x4unq3eOM"}, {"displayName": "HIKeTyBG5dCUoExn", "namespace": "KfV3869IN4V1OdhH", "userId": "4GVU7Exlkmc4xYiL"}, {"displayName": "jLyZrXr9Bhtzn8jA", "namespace": "dTn6xBhrciryLm67", "userId": "rkadH5Y41SLjCPrF"}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminAddRoleManagersV3' test.out

#- 195 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'a05Xl5TPC5GODS44' \
    --body '{"managers": [{"displayName": "bmm7jPdKLddfdsUq", "namespace": "jXVzW1QqxnWR5she", "userId": "LgsAF4ctv5guycGi"}, {"displayName": "q9j2EyIknfLDpgHn", "namespace": "MOn8nc3gUZ8ZFyyE", "userId": "r0KBXuJBqK4QtEyd"}, {"displayName": "PWLPBYiR3UbJc1ZY", "namespace": "apx7C477etqgfOJD", "userId": "UT0uKAPrARya2IMl"}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminRemoveRoleManagersV3' test.out

#- 196 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'NiXpF4qvsUUpHqi3' \
    --after '3TcBGkc0HjUcnkpU' \
    --before '9oVzl2kBuLFXIeCE' \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 196 'AdminGetRoleMembersV3' test.out

#- 197 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'MY4H34B6wVd8ipcK' \
    --body '{"members": [{"displayName": "DwQeUWtjCC2UH6jz", "namespace": "MO3AfmOS5mQNyRPZ", "userId": "FPNP56l1AT6OLKmZ"}, {"displayName": "hCZxxPPdPwOtEuWB", "namespace": "SO2jJepUnEEgja2m", "userId": "IE2kLTnJwc5XmkCu"}, {"displayName": "L5W4tKt6G3j9LYdG", "namespace": "7xVPqBqe9RDQMBSY", "userId": "AFLqp8PF5hCcoukW"}]}' \
    > test.out 2>&1
eval_tap $? 197 'AdminAddRoleMembersV3' test.out

#- 198 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'pnbz4ys7j6lxuU3u' \
    --body '{"members": [{"displayName": "2HEG0qfKegvFTD1s", "namespace": "PykS8YLmwtYgWGcA", "userId": "0h4G1LZ1HaX5UBMb"}, {"displayName": "sF44VTsLDRzdq22c", "namespace": "bnyK3ggFDh2kaZP7", "userId": "pnnVfxPwc259HF9e"}, {"displayName": "jHaILQruAuYyJLYG", "namespace": "qMv824ouSgkpK70u", "userId": "JmUL0uzElixc023d"}]}' \
    > test.out 2>&1
eval_tap $? 198 'AdminRemoveRoleMembersV3' test.out

#- 199 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'IvDiA0tQWlHwBcTt' \
    --body '{"permissions": [{"action": 52, "resource": "maAu4YK87DYAWWcb", "schedAction": 5, "schedCron": "UOIzVcy9k3ie64Vn", "schedRange": ["wa0ClGQJultJe32A", "iwKadEoIVmprwPsa", "9YD92CX0rITajpwH"]}, {"action": 71, "resource": "GcRAn51rVAQSxp4q", "schedAction": 93, "schedCron": "JbQ3Fj1umx4ItzkM", "schedRange": ["J7cudf4r916GPrhn", "2etVIQvRkQJAtDUH", "9tx60AehGz1ermJY"]}, {"action": 40, "resource": "sYgL7TfyIlAwjTZd", "schedAction": 90, "schedCron": "unGKM0tgfeWy47bb", "schedRange": ["wMI4gGmvK9gW596F", "wBNrFXt3TAuKBwBc", "D12ae6r3hHwya4Np"]}]}' \
    > test.out 2>&1
eval_tap $? 199 'AdminUpdateRolePermissionsV3' test.out

#- 200 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'dOzg3hr6ucHf7dbh' \
    --body '{"permissions": [{"action": 17, "resource": "yw8lHEbVDwBAqanO", "schedAction": 24, "schedCron": "41PAiNjULsx4SnKN", "schedRange": ["XLMUaDSwwQlnNRZJ", "HBSB4fZWEFIZs28F", "f1kZp1Zktx3N7WNM"]}, {"action": 0, "resource": "IfcDKbLu8pnK34oA", "schedAction": 87, "schedCron": "keYXJvtggDdXjbdj", "schedRange": ["MBahFZZGMTcqnWrI", "prOv0BJ9Sgl7H1sd", "H2RIJz1eI7Q5pu9P"]}, {"action": 42, "resource": "tnohddMzMTQ9P7sY", "schedAction": 77, "schedCron": "3rURGWUzPAE6SdV4", "schedRange": ["D5jftRl9rZmtQUvr", "o8TWwXWsz9TVmdMK", "EohKzuMYDUTLBeCi"]}]}' \
    > test.out 2>&1
eval_tap $? 200 'AdminAddRolePermissionsV3' test.out

#- 201 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'dXjuGgx8ncXejmeZ' \
    --body '["tzT0qj0ltsqfiZrt", "hVvyX0OCKDJE3RMU", "ddwSSgxCu8zru1Dh"]' \
    > test.out 2>&1
eval_tap $? 201 'AdminDeleteRolePermissionsV3' test.out

#- 202 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '66' \
    --resource 'muALlMQl9RLrthbf' \
    --roleId 'p0VgweLlT2sY3SsT' \
    > test.out 2>&1
eval_tap $? 202 'AdminDeleteRolePermissionV3' test.out

#- 203 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 203 'AdminGetMyUserV3' test.out

#- 204 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'nDQY7kKU2u06Q4ve' \
    --extendExp  \
    --redirectUri 'ujxtyQENvJrBCqeg' \
    --password '67d4RWOqO4U0bitN' \
    --requestId 'QLzwRoWnR0AbkCPY' \
    --userName '70FmvviVIBbcujF8' \
    > test.out 2>&1
eval_tap $? 204 'UserAuthenticationV3' test.out

#- 205 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'Vk5qb8NhWWwaxyMc' \
    --linkingToken 'hkt8l5IPSrwrJl7w' \
    --password 'YIVw13NCo9yXlbQ5' \
    --username '2FTHTCj6SEAzT7TO' \
    > test.out 2>&1
eval_tap $? 205 'AuthenticationWithPlatformLinkV3' test.out

#- 206 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'pyiuvvQUm29Iacq4' \
    --extendExp  \
    --linkingToken 'XRLaA643nTMtXSAy' \
    > test.out 2>&1
eval_tap $? 206 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 207 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'ejnny0Ju13b6o5uB' \
    > test.out 2>&1
eval_tap $? 207 'RequestOneTimeLinkingCodeV3' test.out

#- 208 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode '2XM6IHy7EEvHyLmc' \
    > test.out 2>&1
eval_tap $? 208 'ValidateOneTimeLinkingCodeV3' test.out

#- 209 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'vrZZOdwe1x8RjU6B' \
    --isTransient  \
    --clientId 'i8JXE52sUBBq2Sim' \
    --oneTimeLinkCode 'QQoLbe5YOJvxGRxU' \
    > test.out 2>&1
eval_tap $? 209 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 210 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 210 'GetCountryLocationV3' test.out

#- 211 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 211 'Logout' test.out

#- 212 RequestGameTokenCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenCodeResponseV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'zrTwagH7BMT1IZKT' \
    > test.out 2>&1
eval_tap $? 212 'RequestGameTokenCodeResponseV3' test.out

#- 213 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dNFVBQ1crBXAupAT' \
    --userId 'O8uXsqVpdiWo8SjD' \
    > test.out 2>&1
eval_tap $? 213 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 214 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AM0Riw8wLYW3n4F3' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 214 'RevokeUserV3' test.out

#- 215 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'LD1EDwBXw5uBYeQZ' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'zATNSV9E9yyNb7ya' \
    --redirectUri 'LXzAVYymOuhCkZu4' \
    --scope 'htrsf8eIFSovTGXa' \
    --state 'Msq8ePN1oco2jx8U' \
    --targetAuthPage 'pe8SjMvpqM8puggO' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'EdG47gD5i2Ni6AnW' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 215 'AuthorizeV3' test.out

#- 216 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'ij4ysYPonb59gQff' \
    > test.out 2>&1
eval_tap $? 216 'TokenIntrospectionV3' test.out

#- 217 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 217 'GetJWKSV3' test.out

#- 218 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'kNOmubxEJr2qEAuJ' \
    --factor 'bpZSrcbc4LWfKaY5' \
    --mfaToken 'c1tP5TDuI5f6m4KC' \
    > test.out 2>&1
eval_tap $? 218 'SendMFAAuthenticationCode' test.out

#- 219 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor '07CnsZe32hqEcB1E' \
    --mfaToken 'xYMBb3ckvoaJYdMq' \
    > test.out 2>&1
eval_tap $? 219 'Change2faMethod' test.out

#- 220 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'Gegcg3eRvBZXN3cj' \
    --factor 'IXmFWRJnj8xN7HDP' \
    --mfaToken 'TUEDPN1Kb4UTPWDX' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 220 'Verify2faCode' test.out

#- 221 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TSb55g8LSTs7Nf95' \
    --userId 'lGlPrf6obIdnI6Ag' \
    > test.out 2>&1
eval_tap $? 221 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 222 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId '7eUYcYJ4QzXCmqr6' \
    --clientId 'gmPGaHP5SVPvRLiD' \
    --redirectUri 'i0mNHb6Lx8eq8SGN' \
    --requestId 'wEQO8dYXvBSYvJBw' \
    > test.out 2>&1
eval_tap $? 222 'AuthCodeRequestV3' test.out

#- 223 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'b6CjZUMRf2VJetWs' \
    --additionalData 'okvx3BHuTEczr9Kj' \
    --clientId 'Q3ttz8MTBt1xk9Iy' \
    --createHeadless  \
    --deviceId 'ssSA8nP5PQjpzk2T' \
    --macAddress 'b7iYdmNZWosrsVBP' \
    --platformToken 'Z64j0HUONscofwYL' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 223 'PlatformTokenGrantV3' test.out

#- 224 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 224 'GetRevocationListV3' test.out

#- 225 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'QcDvkaEIIPoJT83z' \
    > test.out 2>&1
eval_tap $? 225 'TokenRevocationV3' test.out

#- 226 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'EGXmVBZLyrH9J7Bo' \
    --clientId 'ysmaORLkP5hc2Fh0' \
    --code '4JTsqDTynCewqJli' \
    --codeVerifier 'gLlRxOelKykICRxF' \
    --extendExp  \
    --password '6HtlER2txs4qrNAR' \
    --redirectUri 'ATn6KXOutlYBbLhL' \
    --refreshToken '8KXx25FZfQIodVBq' \
    --username 'QsBpCJBIXLGYcwWV' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 226 'TokenGrantV3' test.out

#- 227 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'K6UKk5ozrXA4HZHN' \
    > test.out 2>&1
eval_tap $? 227 'VerifyTokenV3' test.out

#- 228 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'yq9odanhR1Zrm3th' \
    --code 'UvV87yfkycLSVdle' \
    --error 'SaAylsmLYe2phYOg' \
    --openidAssocHandle 'T5kDTyPl3dKF7NXE' \
    --openidClaimedId 'jrJMki8jvc3P8Gwj' \
    --openidIdentity 'g3IOH0SDHgYKqxJi' \
    --openidMode 'FJdrmj5vhzgsJwex' \
    --openidNs '7wq8ZPlXNaUNgdY2' \
    --openidOpEndpoint 'vfJuje5cPnmGjTvY' \
    --openidResponseNonce 'a5Pqx1K7qcAoijBP' \
    --openidReturnTo 'Ap6EPb988NzxrDKV' \
    --openidSig 'pULjjiw3NeVG4DJi' \
    --openidSigned '9DaMrc0WFgKjE945' \
    --state 'x2CPVYYG9WvoGmAm' \
    > test.out 2>&1
eval_tap $? 228 'PlatformAuthenticationV3' test.out

#- 229 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'vaVV5YfxnUNcwjr7' \
    > test.out 2>&1
eval_tap $? 229 'PublicGetInputValidations' test.out

#- 230 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'gSGhnfuF4WZiQVIC' \
    > test.out 2>&1
eval_tap $? 230 'PublicGetInputValidationByField' test.out

#- 231 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'VpWd3UM08gMXhdf3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 231 'PublicGetCountryAgeRestrictionV3' test.out

#- 232 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 232 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 233 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'juXW4JprIb3CJCAt' \
    > test.out 2>&1
eval_tap $? 233 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 234 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vSG8Cfa9dzOJDGCT' \
    --rawPUID  \
    --body '{"platformUserIds": ["HIOFjeXbsSgR43kI", "DzxBwqRJTzrHNZWU", "sq5lQo2jy29EJigq"]}' \
    > test.out 2>&1
eval_tap $? 234 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 235 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YhyVhURx1yPeczRp' \
    --platformUserId 'dk0HATGylx2JG2KN' \
    > test.out 2>&1
eval_tap $? 235 'PublicGetUserByPlatformUserIDV3' test.out

#- 236 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'GfhzfCTxxrsRRLee' \
    > test.out 2>&1
eval_tap $? 236 'PublicGetAsyncStatus' test.out

#- 237 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '3TcJ7DQIi45aCDHN' \
    --limit '83' \
    --offset '25' \
    --query 'QIybqWfG9BJ6FVKl' \
    > test.out 2>&1
eval_tap $? 237 'PublicSearchUserV3' test.out

#- 238 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "bYHtbPtaxvagSlpG", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "a6wUQvehKqwCh86X", "policyId": "mRkCEcfHDCdl59Wp", "policyVersionId": "9A3tXGve6DdK6uvg"}, {"isAccepted": true, "localizedPolicyVersionId": "f2cIoByk9fxtvsge", "policyId": "Axo57nKAbZpsbJ4I", "policyVersionId": "u5KJ0ynxGBlacDCd"}, {"isAccepted": false, "localizedPolicyVersionId": "KdzxoufCNlFoOcWQ", "policyId": "Qy4bjmQeEweoBHTd", "policyVersionId": "wAk7ZQnbqY1cQwVE"}], "authType": "tAr5kKKAo9MM2Cqm", "code": "84jVi9kIpqgrzpUk", "country": "NOBWydXV0Fi02aFr", "dateOfBirth": "8CDapjwNOl4k8rVN", "displayName": "rm8drv8QD2JOe2Nt", "emailAddress": "z7EFvowPgIGuetxF", "password": "MqXCQMAqQ2ZRGzNt", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 238 'PublicCreateUserV3' test.out

#- 239 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'jDNo4rhjxUdMM83W' \
    --query 'ekqfWv04vvn9bk5q' \
    > test.out 2>&1
eval_tap $? 239 'CheckUserAvailability' test.out

#- 240 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["r8qs2mqtnGAqXUjN", "ypF6MMqWpdEJsPoa", "IbYz8cK5jlpJdre5"]}' \
    > test.out 2>&1
eval_tap $? 240 'PublicBulkGetUsers' test.out

#- 241 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "ur6yvWJDdvM7T7PX", "languageTag": "2vamIRZHzsIYOCUo"}' \
    > test.out 2>&1
eval_tap $? 241 'PublicSendRegistrationCode' test.out

#- 242 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "iCXNjrdQL2jdx1eI", "emailAddress": "ba1sB0HsJ06Dzfbz"}' \
    > test.out 2>&1
eval_tap $? 242 'PublicVerifyRegistrationCode' test.out

#- 243 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "RYt4OVUyumBeIqdQ", "languageTag": "GZC5kM03HHijsQRj"}' \
    > test.out 2>&1
eval_tap $? 243 'PublicForgotPasswordV3' test.out

#- 244 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId '7N8IAjmsonjj0ZR5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 244 'GetAdminInvitationV3' test.out

#- 245 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId '0BQ1U6aFD3O2kXQS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "ahUrELQ1btjJOqQM", "policyId": "gZWAU6E92nHJzvw7", "policyVersionId": "tnYtGfv0EJyjBu4E"}, {"isAccepted": true, "localizedPolicyVersionId": "Pqb6n73m0jiaDH86", "policyId": "d9rsKgzCsMulpB8H", "policyVersionId": "ZUtVVaJCiLgKOwrS"}, {"isAccepted": false, "localizedPolicyVersionId": "mW8saabP4xRowfNo", "policyId": "jzPXI2v0prR3OEey", "policyVersionId": "0MkZwS6TYwNN3UYh"}], "authType": "EMAILPASSWD", "country": "h4SqIV6LQPHlaeYl", "dateOfBirth": "4csFq65cU66yJaj4", "displayName": "ovoKWE4EW0sw8v5p", "password": "eiuxoBJATauyD3XC", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 245 'CreateUserFromInvitationV3' test.out

#- 246 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "VMiyEvMf9yilUEuj", "country": "k6oqYo1HQYTFzwdO", "dateOfBirth": "MdupwD4O3uNbcIDc", "displayName": "IyvZbOy1T4hfwkuV", "languageTag": "ykH4RpfmjIXFGZ5P", "userName": "KdbabJIkNnt9P1Tk"}' \
    > test.out 2>&1
eval_tap $? 246 'UpdateUserV3' test.out

#- 247 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "m08luh4dpPRMDbUX", "country": "BWTbpAogG2wlZkLh", "dateOfBirth": "uU5FI8NijFI0GKwJ", "displayName": "3vfXlsAMy2Zp2UAG", "languageTag": "xHnmSxvkG9UR5q9n", "userName": "eoW6JBcGp9Rx2Rfc"}' \
    > test.out 2>&1
eval_tap $? 247 'PublicPartialUpdateUserV3' test.out

#- 248 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "RhXpmeeHdvphas9S", "emailAddress": "7ivHEoLbUMM47f1U", "languageTag": "reUpxEkXIbE1ETzR"}' \
    > test.out 2>&1
eval_tap $? 248 'PublicSendVerificationCodeV3' test.out

#- 249 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "JZKMavu4Ul2IaieE", "contactType": "bPSE7TGkeHsYsW9o", "languageTag": "GBN1pYMBwbPZTlMl", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 249 'PublicUserVerificationV3' test.out

#- 250 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "1hmWKSSrF35anDGv", "country": "ur19V18oIrUKXttg", "dateOfBirth": "AI2QdWJFLmoPEgd8", "displayName": "EMspOs8nkic9gj5v", "emailAddress": "yUMAAmIHYbsxG5N0", "password": "66FXb88SbLOa21Di", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 250 'PublicUpgradeHeadlessAccountV3' test.out

#- 251 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "TIedV3HyoX4VnO2L", "password": "pBU08wfnlHBXFIqF"}' \
    > test.out 2>&1
eval_tap $? 251 'PublicVerifyHeadlessAccountV3' test.out

#- 252 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "UmgUSMM5au8GJT0m", "newPassword": "kVPI6zUtf3QaJPGr", "oldPassword": "TNcXXTUIggoH89QN"}' \
    > test.out 2>&1
eval_tap $? 252 'PublicUpdatePasswordV3' test.out

#- 253 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'mI17UDb19R6H7r1t' \
    > test.out 2>&1
eval_tap $? 253 'PublicCreateJusticeUser' test.out

#- 254 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'a3m7jK5pxe82pgFi' \
    --redirectUri 'AS6piIzmc8rKrKEP' \
    --ticket 'GSAcong6eNERUf8k' \
    > test.out 2>&1
eval_tap $? 254 'PublicPlatformLinkV3' test.out

#- 255 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jci1Ctccv9Gv4tOc' \
    --body '{"platformNamespace": "bnuCqf0lm6WBkIzj"}' \
    > test.out 2>&1
eval_tap $? 255 'PublicPlatformUnlinkV3' test.out

#- 256 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oSV31tvmMB6jzrpR' \
    > test.out 2>&1
eval_tap $? 256 'PublicPlatformUnlinkAllV3' test.out

#- 257 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GESmooHiCV4GUOnX' \
    --ticket 'papXQGRakUbcG7Pc' \
    > test.out 2>&1
eval_tap $? 257 'PublicForcePlatformLinkV3' test.out

#- 258 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'R4eiU3Idi55jNrGN' \
    --clientId 'T2VHTKuIT5FwwHj0' \
    --redirectUri 'Ur5F2PWGTTD81xhN' \
    > test.out 2>&1
eval_tap $? 258 'PublicWebLinkPlatform' test.out

#- 259 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'P4t6kYBUjyXAn3bW' \
    --code 'QF6QcAiJpXIrgroi' \
    --state 'xptZhckUTGkcBOE4' \
    > test.out 2>&1
eval_tap $? 259 'PublicWebLinkPlatformEstablish' test.out

#- 260 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "qMcH1Kyi8ZFvGcV8", "emailAddress": "DY0XOkDstxZcY1Hg", "newPassword": "AnZV4IOglVLqb9lG"}' \
    > test.out 2>&1
eval_tap $? 260 'ResetPasswordV3' test.out

#- 261 PublicGetUserByUserIdV3
eval_tap 0 261 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 262 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AJUg21Lt7JwgwMUS' \
    --activeOnly  \
    --after 'uC3Bajy3BcEMCtQs' \
    --before '2FcEcvVAyId6Cp85' \
    --limit '70' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetUserBanHistoryV3' test.out

#- 263 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YCpGJM4sqsPNJMiZ' \
    > test.out 2>&1
eval_tap $? 263 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 264 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XXOFwmGWAvNF0Z0G' \
    > test.out 2>&1
eval_tap $? 264 'PublicGetUserInformationV3' test.out

#- 265 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kwxUNYyNwGiKrknH' \
    --after '0.8438776470260139' \
    --before '0.8216259774860117' \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 265 'PublicGetUserLoginHistoriesV3' test.out

#- 266 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mrQgLC6D2qsFiQHg' \
    --after 'lUQMZi5WjMZfOadp' \
    --before 'gegCUjTdi1Ehr8Ot' \
    --limit '35' \
    > test.out 2>&1
eval_tap $? 266 'PublicGetUserPlatformAccountsV3' test.out

#- 267 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kyuoya4JgakZyUV7' \
    > test.out 2>&1
eval_tap $? 267 'PublicListJusticePlatformAccountsV3' test.out

#- 268 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 't73VnSFbuxd4KYZ0' \
    --body '{"platformId": "jk0UZdhtnKu9oTc8", "platformUserId": "pVkiyGsj5JdXzRxf"}' \
    > test.out 2>&1
eval_tap $? 268 'PublicLinkPlatformAccount' test.out

#- 269 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'NEjUMTs8WIObJBTs' \
    --body '{"chosenNamespaces": ["vsw76uISRX0bKVoW", "toUW1P7ocuBAldDS", "US7Haa6unq1yQOSR"], "requestId": "vyiLBRVtIDi2piIQ"}' \
    > test.out 2>&1
eval_tap $? 269 'PublicForceLinkPlatformWithProgression' test.out

#- 270 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FVmzMidw70KSahpY' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetPublisherUserV3' test.out

#- 271 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZdKZRyR9AX7JjxvN' \
    --password 'ZhM84DiZk6ySrB9S' \
    > test.out 2>&1
eval_tap $? 271 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 272 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'VFctW7YS0OkL78Xe' \
    --before 'EAtALFI3v8yha4pd' \
    --isWildcard  \
    --limit '44' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetRolesV3' test.out

#- 273 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'A7MYcpBD6lKNb8Rx' \
    > test.out 2>&1
eval_tap $? 273 'PublicGetRoleV3' test.out

#- 274 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 274 'PublicGetMyUserV3' test.out

#- 275 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'vN2u5J7baOeLH19f' \
    > test.out 2>&1
eval_tap $? 275 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 276 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["qBwNbNe1ffYRtIvQ", "aKyevWYtZjK6J29v", "8MpBSpo3AKRmnJkz"], "oneTimeLinkCode": "JHAckUyBksYQfDm0"}' \
    > test.out 2>&1
eval_tap $? 276 'LinkHeadlessAccountToMyAccountV3' test.out

#- 277 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "RNFwiz70tRVLMlHi"}' \
    > test.out 2>&1
eval_tap $? 277 'PublicSendVerificationLinkV3' test.out

#- 278 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code '8i9gOVqajUWrgEsW' \
    > test.out 2>&1
eval_tap $? 278 'PublicVerifyUserByLinkV3' test.out

#- 279 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'DtaKzn8dZwnnGeZs' \
    --code 'ZVgbPzPFbrOMZMgW' \
    --error 'kFN7Tpkx6GcfyOg6' \
    --state 'ZUrrp9ubg9mndW2J' \
    > test.out 2>&1
eval_tap $? 279 'PlatformAuthenticateSAMLV3Handler' test.out

#- 280 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'KmQafUs2bxYztOEy' \
    --payload 'VbKIf1ZbzgUwd8DH' \
    > test.out 2>&1
eval_tap $? 280 'LoginSSOClient' test.out

#- 281 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'oCQykmXHYmkRlg7g' \
    > test.out 2>&1
eval_tap $? 281 'LogoutSSOClient' test.out

#- 282 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --additionalData 'Ys6unPYQ9jNQN1di' \
    --code '1ldhOh6HvjnYuV7N' \
    > test.out 2>&1
eval_tap $? 282 'RequestGameTokenResponseV3' test.out

#- 283 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fC4A2ODiZhbfb8Qq' \
    > test.out 2>&1
eval_tap $? 283 'AdminGetDevicesByUserV4' test.out

#- 284 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'CyK1XH9D6vl5eFdF' \
    --endDate 'fgK46GjCWaP8huTm' \
    --limit '28' \
    --offset '66' \
    --startDate 'q3FGQn3Ahu5wxq6o' \
    > test.out 2>&1
eval_tap $? 284 'AdminGetBannedDevicesV4' test.out

#- 285 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jq4mChmQHQhO9IKB' \
    > test.out 2>&1
eval_tap $? 285 'AdminGetUserDeviceBansV4' test.out

#- 286 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "XDFQfXFD58sG6uDh", "deviceId": "FYlrzJBYSeMuJfQe", "deviceType": "cutjS029BiJWOG1m", "enabled": false, "endDate": "MKclr5igjNTVItrH", "ext": {"2X78hxJgaVfw5Vny": {}, "q8OzTE89WDNoMcOm": {}, "bfJrCJQIj1haAosK": {}}, "reason": "glqaCXE9ytpIO8bt"}' \
    > test.out 2>&1
eval_tap $? 286 'AdminBanDeviceV4' test.out

#- 287 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'O3OwNEGSW5TaW4to' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 287 'AdminGetDeviceBanV4' test.out

#- 288 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId '7QCY2NGGvi9kg3rM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 288 'AdminUpdateDeviceBanV4' test.out

#- 289 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'XSbv5eg9q86IaDFj' \
    --startDate 'jx6uZerWbtwTX9gN' \
    --deviceType 'RByjbE8lOLAfTXKL' \
    > test.out 2>&1
eval_tap $? 289 'AdminGenerateReportV4' test.out

#- 290 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'AdminGetDeviceTypesV4' test.out

#- 291 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'zbrddqcKLa7LevxN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'AdminGetDeviceBansV4' test.out

#- 292 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'HOSEhQRZIp693lRw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 292 'AdminDecryptDeviceV4' test.out

#- 293 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'tc43atCuCFxbfbz4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 293 'AdminUnbanDeviceV4' test.out

#- 294 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'aQERziPL4dHhOqG5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 294 'AdminGetUsersByDeviceV4' test.out

#- 295 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 75}' \
    > test.out 2>&1
eval_tap $? 295 'AdminCreateTestUsersV4' test.out

#- 296 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["6qdFpc71sSck3ggZ", "WJlSlCQMDji329Pf", "VrvMEPtpsSNcpK1Q"]}' \
    > test.out 2>&1
eval_tap $? 296 'AdminBulkCheckValidUserIDV4' test.out

#- 297 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kB2Sy8Ww79LVeVsk' \
    --body '{"avatarUrl": "qeUB7RSayqGFguhh", "country": "3bvadRthdbVApebR", "dateOfBirth": "A09rW8i8krFWJhe0", "displayName": "3coRFok5d3AyGrZO", "languageTag": "8GuoXNSoVEBG7VbB", "userName": "PUWipz9C05YabFX4"}' \
    > test.out 2>&1
eval_tap $? 297 'AdminUpdateUserV4' test.out

#- 298 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FCK5ucTFsAFzaO3y' \
    --body '{"code": "JpA3KMxBlrRytER1", "emailAddress": "qdTelFAadM9y66Dr"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateUserEmailAddressV4' test.out

#- 299 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'f4SSGGt3MiBKohow' \
    > test.out 2>&1
eval_tap $? 299 'AdminDisableUserMFAV4' test.out

#- 300 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '3kKoaP1K4CDuH1mM' \
    > test.out 2>&1
eval_tap $? 300 'AdminListUserRolesV4' test.out

#- 301 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IfOCDyVAHrHncR5d' \
    --body '{"assignedNamespaces": ["ShqiBUI9esSsXegS", "EhrPpK2q8kxR4BuE", "ksS2A9VOA8H9VeHv"], "roleId": "0L2Acm960EYQEuGJ"}' \
    > test.out 2>&1
eval_tap $? 301 'AdminUpdateUserRoleV4' test.out

#- 302 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vl8xs1WId9Wlalqs' \
    --body '{"assignedNamespaces": ["hF9Rh2o7GCQGPCxw", "EdkyuT3MgzReRq01", "12ISArROIodcmM6v"], "roleId": "2AEozWWaYvBLE46b"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminAddUserRoleV4' test.out

#- 303 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'puJip8JyxJ39vrtu' \
    --body '{"assignedNamespaces": ["WWrqTZbSqBSKp8Am", "gwhYzk33J34fiTxK", "63OHpnUCGBVfpctN"], "roleId": "FUsUQ6ZXQcb2o1J5"}' \
    > test.out 2>&1
eval_tap $? 303 'AdminRemoveUserRoleV4' test.out

#- 304 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '10' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 304 'AdminGetRolesV4' test.out

#- 305 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "7vXZV3ig8Jg5VBye"}' \
    > test.out 2>&1
eval_tap $? 305 'AdminCreateRoleV4' test.out

#- 306 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'I3ycMcYYBixKJXCI' \
    > test.out 2>&1
eval_tap $? 306 'AdminGetRoleV4' test.out

#- 307 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'SQdwec1m8BusV9tU' \
    > test.out 2>&1
eval_tap $? 307 'AdminDeleteRoleV4' test.out

#- 308 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'h74KVo6Xqjz2xUKL' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "YyVvyelIJ8QgaLMq"}' \
    > test.out 2>&1
eval_tap $? 308 'AdminUpdateRoleV4' test.out

#- 309 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'i836ULa7cfZl4VuY' \
    --body '{"permissions": [{"action": 54, "resource": "rsZyo6CBRRnoOikI", "schedAction": 49, "schedCron": "OqKkcjRh3l2gAJOT", "schedRange": ["Cbx7J3gNLIlTk3Bp", "clrk4hIRn0znIKzA", "EAHQpBOgHEP5l94s"]}, {"action": 53, "resource": "CbIJ7eHnVWOboMky", "schedAction": 57, "schedCron": "a7Kv5TacQKF4OlRG", "schedRange": ["dmXxETLEQrr3KCAV", "9alq3hK1G4kKooSN", "NUZuiynZ64IwncZP"]}, {"action": 22, "resource": "S2FgarY903INGIyE", "schedAction": 12, "schedCron": "dzGgGVxo9OHgfHum", "schedRange": ["yfuBNisecYbcOpR4", "5VDlvSc0Mr7ImwCw", "GqOf0bNs97KvKyj3"]}]}' \
    > test.out 2>&1
eval_tap $? 309 'AdminUpdateRolePermissionsV4' test.out

#- 310 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'MqS7Dcmtfh50eObb' \
    --body '{"permissions": [{"action": 35, "resource": "ezWTqgYPixtHk6lW", "schedAction": 34, "schedCron": "U1eD1La16Bw3JbUn", "schedRange": ["UDh5yGjjv4Mwrv2v", "ancmR6Z7rb21A2E9", "pX0BWCMqPsRk5htd"]}, {"action": 79, "resource": "7BrorbKIKuOXJPm5", "schedAction": 52, "schedCron": "M6soMaTvQq2a9YdF", "schedRange": ["NtRVSO0js0hG9xmS", "nzd7zgUxAogcnGkX", "k17QPkJHRhmLKQuQ"]}, {"action": 98, "resource": "DDubntPCFxfeoW2N", "schedAction": 6, "schedCron": "jXLSAS8MKMaxQ1Qy", "schedRange": ["JCpKedhuzI7G9NCK", "KXu1bqI2M5PmXfKn", "Q7BYGjCUDMOrbmoR"]}]}' \
    > test.out 2>&1
eval_tap $? 310 'AdminAddRolePermissionsV4' test.out

#- 311 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'vWnfmGFy0eUoOBd9' \
    --body '["0h9EDqSTOfoNewWj", "wMWDKEt6JhbJ0fwT", "Daq6b5RpMwhWPtnd"]' \
    > test.out 2>&1
eval_tap $? 311 'AdminDeleteRolePermissionsV4' test.out

#- 312 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'riXU9loOxpmEuwDV' \
    --after 'c12r0DVUGgGHkapT' \
    --before 'CafFMdvYiCBuzUUw' \
    --limit '51' \
    > test.out 2>&1
eval_tap $? 312 'AdminListAssignedUsersV4' test.out

#- 313 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'ZvPxT5zbreMc9fBo' \
    --body '{"assignedNamespaces": ["U3RHNDFjLKFrepy5", "6eW1kmb15QeIQF51", "c4MqJzDSvELgBe6d"], "namespace": "boSdhkBzAzPkt1ef", "userId": "GJeJaxyHYutgXucx"}' \
    > test.out 2>&1
eval_tap $? 313 'AdminAssignUserToRoleV4' test.out

#- 314 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId '85vHA009FAb21jxe' \
    --body '{"namespace": "WXk80y9uxgVLGgK8", "userId": "aVSCN6oCETQ8gIDR"}' \
    > test.out 2>&1
eval_tap $? 314 'AdminRevokeUserFromRoleV4' test.out

#- 315 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["dD2wwMXwKVXGPhEJ", "sc7rZpxaPHc9r8eT", "oFmkHJ6BPOKFLxIw"], "emailAddresses": ["Kssw647YwDudnGRu", "fOUGfMjTU226l07j", "PlcYaqYM7YfBmhjI"], "isAdmin": false, "namespace": "Y28qVceS9UX48dKP", "roleId": "CFUIeyYEymNXzNX6"}' \
    > test.out 2>&1
eval_tap $? 315 'AdminInviteUserNewV4' test.out

#- 316 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "TGh4UdEweeBsJEvB", "country": "bAvCmlh6Z1oz9Bai", "dateOfBirth": "xUUvmzbajE2gjooi", "displayName": "Dnc1NUb51lEgUwQ9", "languageTag": "tkWaMOH47CAT7cBP", "userName": "0918JaEBQBP766LU"}' \
    > test.out 2>&1
eval_tap $? 316 'AdminUpdateMyUserV4' test.out

#- 317 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 317 'AdminDisableMyAuthenticatorV4' test.out

#- 318 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'nBBR84iAO7sBQt6Y' \
    > test.out 2>&1
eval_tap $? 318 'AdminEnableMyAuthenticatorV4' test.out

#- 319 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 319 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 320 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 320 'AdminGetMyBackupCodesV4' test.out

#- 321 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 321 'AdminGenerateMyBackupCodesV4' test.out

#- 322 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 322 'AdminDisableMyBackupCodesV4' test.out

#- 323 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 323 'AdminDownloadMyBackupCodesV4' test.out

#- 324 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 324 'AdminEnableMyBackupCodesV4' test.out

#- 325 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 325 'AdminSendMyMFAEmailCodeV4' test.out

#- 326 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 326 'AdminDisableMyEmailV4' test.out

#- 327 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'J2tWwF7RnP1oK3c4' \
    > test.out 2>&1
eval_tap $? 327 'AdminEnableMyEmailV4' test.out

#- 328 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 328 'AdminGetMyEnabledFactorsV4' test.out

#- 329 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'RVfjB0zi3XrYZUiN' \
    > test.out 2>&1
eval_tap $? 329 'AdminMakeFactorMyDefaultV4' test.out

#- 330 AdminInviteUserV4
eval_tap 0 330 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 331 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "ol1qqbalgizL97yc", "policyId": "JV5YqE2myQzl7X9f", "policyVersionId": "Hr6WvBxmBvNj3kta"}, {"isAccepted": true, "localizedPolicyVersionId": "Mv12ZSRJkujxbCu1", "policyId": "HFaj6Vxs3GuA4S1d", "policyVersionId": "S7H7yIS7b5TSDRIo"}, {"isAccepted": false, "localizedPolicyVersionId": "1vyamjsEzwtLPxK1", "policyId": "os4qR8LaQzEb39sZ", "policyVersionId": "TdFfC8x5aHLsXHlm"}], "authType": "EMAILPASSWD", "country": "RJTTy9JrNz1K5M1q", "dateOfBirth": "gFddYvifGHawNx6y", "displayName": "hniEHLbEQKc0aUvr", "emailAddress": "KXDIjYC4df9qswSl", "password": "pCI8DhjlxUyrs3OS", "passwordMD5Sum": "esE5p0DwUj2HKUvP", "username": "YUcQBxMSdOOsn2Nd", "verified": true}' \
    > test.out 2>&1
eval_tap $? 331 'PublicCreateTestUserV4' test.out

#- 332 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "pa19GJDK46Eehx7x", "policyId": "asqMY9aulsL6NOV5", "policyVersionId": "agpS6A5mkufBpWVx"}, {"isAccepted": false, "localizedPolicyVersionId": "K9D2bTcgaKoccaSw", "policyId": "WcZmzCWGI1cIQcPW", "policyVersionId": "AShIhieSKUf3zKby"}, {"isAccepted": false, "localizedPolicyVersionId": "r6FNbKJ05Orya6LS", "policyId": "SUlugIAknXcSaVYc", "policyVersionId": "AYp7qSiDvsfMUOpW"}], "authType": "EMAILPASSWD", "code": "rLwrPoWiywnxuDLL", "country": "uIaSxoloIH1gBCWV", "dateOfBirth": "Frvls0ZwosKhDlLf", "displayName": "TKxpVOXvGSrdkqdd", "emailAddress": "I3ezqu6FB0sL2xt6", "password": "fX9j7rhZCAlDlVKB", "passwordMD5Sum": "sLZiBRXszE7CL1cQ", "reachMinimumAge": true, "username": "JGr4drgkDuWS05m0"}' \
    > test.out 2>&1
eval_tap $? 332 'PublicCreateUserV4' test.out

#- 333 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'pGzazM2BUXnzUEWT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "Cc4M2O7NrTQO7KLd", "policyId": "ZDGwqx7T3l1ut2oy", "policyVersionId": "olliYsTJUmpscwLc"}, {"isAccepted": true, "localizedPolicyVersionId": "ml3KuoMKh7tprnac", "policyId": "A34xmIOjFLgKR4Lj", "policyVersionId": "EWhOScvtQ92iD02Y"}, {"isAccepted": true, "localizedPolicyVersionId": "iPPjpSAlZwFGpea5", "policyId": "ObBB49Km4ClIQmkI", "policyVersionId": "dLCvNhZ6P8aqZ2yf"}], "authType": "EMAILPASSWD", "country": "wHIJ9gzxqAw4vBGQ", "dateOfBirth": "Aeh0VTiTP4PSrXUS", "displayName": "6jYI9lsQFD43Df5q", "password": "UZOFzpFd6b5Jc5TE", "reachMinimumAge": true, "username": "cup8GG0VCMTFJ6sv"}' \
    > test.out 2>&1
eval_tap $? 333 'CreateUserFromInvitationV4' test.out

#- 334 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "Tyo9RHget5hzB52B", "country": "DFopxUwkMuSqQnKz", "dateOfBirth": "DgDAtqE3kuybwTQF", "displayName": "YEJjIYwqfSRy8GgV", "languageTag": "k77fd1GS5YkyhAiA", "userName": "ItnWUmD225fp1egs"}' \
    > test.out 2>&1
eval_tap $? 334 'PublicUpdateUserV4' test.out

#- 335 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "x3ErheNwqd5pricl", "emailAddress": "NNqLyrlzrJ4QHbfn"}' \
    > test.out 2>&1
eval_tap $? 335 'PublicUpdateUserEmailAddressV4' test.out

#- 336 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "AdtkujxHff7n1yaN", "country": "CcjgFhS0URBhl0L5", "dateOfBirth": "FCbOn46W2B2uPQLr", "displayName": "t2t6bVpCgKvPXSDu", "emailAddress": "fmKh783cV54JsVBR", "password": "B0rY0xfWddACyHSm", "reachMinimumAge": false, "username": "0rkOHUkY5aSlqhYo", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 336 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 337 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "Xbn6l5xAzc1nc3eF", "password": "m950dtVAo7w4e3v5", "username": "mh6Rum5pbgEt39uJ"}' \
    > test.out 2>&1
eval_tap $? 337 'PublicUpgradeHeadlessAccountV4' test.out

#- 338 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 338 'PublicDisableMyAuthenticatorV4' test.out

#- 339 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'QpgEtchTe3nt7t9z' \
    > test.out 2>&1
eval_tap $? 339 'PublicEnableMyAuthenticatorV4' test.out

#- 340 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 340 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 341 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 341 'PublicGetMyBackupCodesV4' test.out

#- 342 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'PublicGenerateMyBackupCodesV4' test.out

#- 343 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 343 'PublicDisableMyBackupCodesV4' test.out

#- 344 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 344 'PublicDownloadMyBackupCodesV4' test.out

#- 345 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'PublicEnableMyBackupCodesV4' test.out

#- 346 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'tprSfW9OutADrNGB' \
    > test.out 2>&1
eval_tap $? 346 'PublicRemoveTrustedDeviceV4' test.out

#- 347 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 347 'PublicSendMyMFAEmailCodeV4' test.out

#- 348 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'PublicDisableMyEmailV4' test.out

#- 349 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'WSJ1zQKxVmRTawji' \
    > test.out 2>&1
eval_tap $? 349 'PublicEnableMyEmailV4' test.out

#- 350 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 350 'PublicGetMyEnabledFactorsV4' test.out

#- 351 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'ZPMoZZcyGEHxAKDQ' \
    > test.out 2>&1
eval_tap $? 351 'PublicMakeFactorMyDefaultV4' test.out

#- 352 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"emailAddress": "her3usApPdJPn9eI", "namespace": "dhIBvTTupABJ4RwH", "namespaceDisplayName": "3EdKmYtbqQHNfIZw"}' \
    > test.out 2>&1
eval_tap $? 352 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE