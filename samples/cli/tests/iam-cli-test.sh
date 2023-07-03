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
echo "1..350"

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

#- 176 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bdRXTGIrdNL5gJPq' \
    --body '["TAjgqaTHf1ANTJ9Y", "k997XkGOdC6ItxDT", "8p4n4XCFkD1AJLCw"]' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserRolesV3' test.out

#- 177 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'szbZxuHSgDOK8bjo' \
    --body '[{"namespace": "F7bL2635KbtZTGJp", "roleId": "qgl2IzNXGTuQPIDp"}, {"namespace": "or7t1aJLNNz6QIVC", "roleId": "9Mfuc8VOsnmnlVlj"}, {"namespace": "dWYmELe74p38vumn", "roleId": "xAnYBTxaTIz0jcgD"}]' \
    > test.out 2>&1
eval_tap $? 177 'AdminSaveUserRoleV3' test.out

#- 178 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'I8Pkz96vd80msqIm' \
    --userId '5bufnBqrpLeqhwVh' \
    > test.out 2>&1
eval_tap $? 178 'AdminAddUserRoleV3' test.out

#- 179 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'jnnjKMEmtbiWsAQH' \
    --userId 'bMrKYi0Zxs5SWCqZ' \
    > test.out 2>&1
eval_tap $? 179 'AdminDeleteUserRoleV3' test.out

#- 180 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XHLLa31oQf7BULnZ' \
    --body '{"enabled": true, "reason": "UAJsyAfeKOufV4f1"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateUserStatusV3' test.out

#- 181 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5NohXu6opxQGRt6P' \
    > test.out 2>&1
eval_tap $? 181 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 182 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'qlkL0diRhLC10ih2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "EQfY3XCv4hdOa6Fd"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateClientSecretV3' test.out

#- 183 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'ZhNMd1onFjGRbxtA' \
    --before 'BPXDmgNEJBhgGq5G' \
    --isWildcard  \
    --limit '71' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRolesV3' test.out

#- 184 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "managers": [{"displayName": "hNC66szbCCf73IFb", "namespace": "RkPSSITz4TjCrJHX", "userId": "GXku2YVuOzhxHmnr"}, {"displayName": "rV9ZGWrZ05sxe6A6", "namespace": "RpmKDebNkylbynkg", "userId": "T9vayLLiizac7Ge6"}, {"displayName": "zKJdlt7rjF5RaJwv", "namespace": "kWVco2LTo5ijlvDF", "userId": "8qBWCQ9dLWYyS8zd"}], "members": [{"displayName": "hMeBXH8x6HdVfZVD", "namespace": "AiU6iJOF7JKZFNk2", "userId": "NKy59X8iOg2sVBiC"}, {"displayName": "oeC5weXJl7PeiMH8", "namespace": "z8dVej8N2yv6VTnO", "userId": "K7xAvM7tuL81lsR7"}, {"displayName": "xxSVp3Gd2TK0HzYv", "namespace": "iTgYmx82JVBRLPZ6", "userId": "Iz8tne5dbguBF6Gs"}], "permissions": [{"action": 44, "resource": "jE2opXtdsJQeJ1to", "schedAction": 30, "schedCron": "IK9lOLaZaMphKCqT", "schedRange": ["q3EVheJjoEEXBLIx", "GnNuhoJM3WWPvvCi", "Cf33ViEdqQpoGkUW"]}, {"action": 82, "resource": "LNfHRD3V15QaGGL4", "schedAction": 76, "schedCron": "hZYTYZbzf5aANNNs", "schedRange": ["5kgSZZNUHbIT9szA", "pmWJO5vzzXZj08a6", "K1XRVfriSpPFnZBJ"]}, {"action": 74, "resource": "kDnEiyfa2LrnpZxN", "schedAction": 28, "schedCron": "Tt9TsH7A0TuU2aL4", "schedRange": ["bPkk11sys6GdkDco", "s5uVJ0BJfZ0jvA54", "CSqZFDsO1skRjOU1"]}], "roleName": "SMfQVQa6blj9Rdd8"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminCreateRoleV3' test.out

#- 185 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId '5bdYUumPKVSZCg3X' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleV3' test.out

#- 186 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'Tc9vQe0dHJfF6KIu' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteRoleV3' test.out

#- 187 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'vnRCa9JktyBdxkZK' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "EWFw9GYxjiiOQAD7"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateRoleV3' test.out

#- 188 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId '7ci0vfWVZoRRMPi5' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleAdminStatusV3' test.out

#- 189 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId '7HyKKz5nyI6ulKNK' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpdateAdminRoleStatusV3' test.out

#- 190 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'oXa0dgx1JgjC56pd' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleAdminV3' test.out

#- 191 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'a3YhtQxpCYME6x21' \
    --after 'pdX2QSPAd9sxoLnW' \
    --before 'GP1PafIjLX8ce0Kb' \
    --limit '81' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetRoleManagersV3' test.out

#- 192 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'GWDK41uMOC0mRvSo' \
    --body '{"managers": [{"displayName": "aGk4ktF5wnJDg9Q3", "namespace": "WXiydCOInVolsr6C", "userId": "Hmj763vLwtYEJTSi"}, {"displayName": "XjcY5ZPkv90lyKST", "namespace": "WLxSFZ0LpupEi5Db", "userId": "kVs3qFTi1t530Wj1"}, {"displayName": "WfzIvc3VlSXrA3XU", "namespace": "Gud4tVjmxEf4XvVh", "userId": "FJTxFHITBg9x4unq"}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRoleManagersV3' test.out

#- 193 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId '3eOMHIKeTyBG5dCU' \
    --body '{"managers": [{"displayName": "oExnKfV3869IN4V1", "namespace": "OdhH4GVU7Exlkmc4", "userId": "xYiLjLyZrXr9Bhtz"}, {"displayName": "n8jAdTn6xBhrciry", "namespace": "Lm67rkadH5Y41SLj", "userId": "CPrFa05Xl5TPC5GO"}, {"displayName": "DS44bmm7jPdKLddf", "namespace": "dsUqjXVzW1QqxnWR", "userId": "5sheLgsAF4ctv5gu"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminRemoveRoleManagersV3' test.out

#- 194 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'ycGiq9j2EyIknfLD' \
    --after 'pgHnMOn8nc3gUZ8Z' \
    --before 'FyyEr0KBXuJBqK4Q' \
    --limit '40' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetRoleMembersV3' test.out

#- 195 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId '18uux9xBomQFPFWy' \
    --body '{"members": [{"displayName": "5cwNPI6aFo0MVwDZ", "namespace": "CIXFNEL3uWVRz3V7", "userId": "YbJM3bNLWHAbCZix"}, {"displayName": "e2cQ6O30lpzcBQMA", "namespace": "EcNcJqrKxnMzSYoc", "userId": "4ZjiMY4H34B6wVd8"}, {"displayName": "ipcKDwQeUWtjCC2U", "namespace": "H6jzMO3AfmOS5mQN", "userId": "yRPZFPNP56l1AT6O"}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddRoleMembersV3' test.out

#- 196 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'LKmZhCZxxPPdPwOt' \
    --body '{"members": [{"displayName": "EuWBSO2jJepUnEEg", "namespace": "ja2mIE2kLTnJwc5X", "userId": "mkCuL5W4tKt6G3j9"}, {"displayName": "LYdG7xVPqBqe9RDQ", "namespace": "MBSYAFLqp8PF5hCc", "userId": "oukWpnbz4ys7j6lx"}, {"displayName": "uU3u2HEG0qfKegvF", "namespace": "TD1sPykS8YLmwtYg", "userId": "WGcA0h4G1LZ1HaX5"}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminRemoveRoleMembersV3' test.out

#- 197 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'UBMbsF44VTsLDRzd' \
    --body '{"permissions": [{"action": 34, "resource": "YX2YBF2g7TVtzYEH", "schedAction": 96, "schedCron": "ZP7pnnVfxPwc259H", "schedRange": ["F9ejHaILQruAuYyJ", "LYGqMv824ouSgkpK", "70uJmUL0uzElixc0"]}, {"action": 8, "resource": "rJOBy6lsj1AKGBjn", "schedAction": 68, "schedCron": "ztx3VAl6tXFbnATC", "schedRange": ["zUOIzVcy9k3ie64V", "nwa0ClGQJultJe32", "AiwKadEoIVmprwPs"]}, {"action": 1, "resource": "iGTYgwWv5XldL6rO", "schedAction": 97, "schedCron": "ITGeHTnqRbzBB9ZF", "schedRange": ["gJbQ3Fj1umx4Itzk", "MJ7cudf4r916GPrh", "n2etVIQvRkQJAtDU"]}]}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateRolePermissionsV3' test.out

#- 198 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'H9tx60AehGz1ermJ' \
    --body '{"permissions": [{"action": 16, "resource": "XsYgL7TfyIlAwjTZ", "schedAction": 6, "schedCron": "1unGKM0tgfeWy47b", "schedRange": ["bwMI4gGmvK9gW596", "FwBNrFXt3TAuKBwB", "cD12ae6r3hHwya4N"]}, {"action": 32, "resource": "xyZVKHA9DkaSOWgt", "schedAction": 13, "schedCron": "2iKNUl0qJqzoKMRM", "schedRange": ["G541PAiNjULsx4Sn", "KNXLMUaDSwwQlnNR", "ZJHBSB4fZWEFIZs2"]}, {"action": 64, "resource": "5mj8YRvae4f4lhBP", "schedAction": 3, "schedCron": "YIfcDKbLu8pnK34o", "schedRange": ["A1keYXJvtggDdXjb", "djMBahFZZGMTcqnW", "rIprOv0BJ9Sgl7H1"]}]}' \
    > test.out 2>&1
eval_tap $? 198 'AdminAddRolePermissionsV3' test.out

#- 199 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'sdH2RIJz1eI7Q5pu' \
    --body '["9PutLf6IrvZoBGQb", "O4S3rURGWUzPAE6S", "dV4D5jftRl9rZmtQ"]' \
    > test.out 2>&1
eval_tap $? 199 'AdminDeleteRolePermissionsV3' test.out

#- 200 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '95' \
    --resource 'Rzc20O7FdsJP1G9t' \
    --roleId 'yBTfERXdvgD1Qf7O' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteRolePermissionV3' test.out

#- 201 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 201 'AdminGetMyUserV3' test.out

#- 202 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 't2DkUt3yexZBRvxY' \
    --extendExp  \
    --redirectUri 'nEBhXtAVxCd3meTr' \
    --password 'T7cF9oVCh89wNOkK' \
    --requestId 'YssVejcL3kR3hCGN' \
    --userName 'gaJmuALlMQl9RLrt' \
    > test.out 2>&1
eval_tap $? 202 'UserAuthenticationV3' test.out

#- 203 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'hbfp0VgweLlT2sY3' \
    --linkingToken 'SsTnDQY7kKU2u06Q' \
    --password '4veujxtyQENvJrBC' \
    --username 'qeg67d4RWOqO4U0b' \
    > test.out 2>&1
eval_tap $? 203 'AuthenticationWithPlatformLinkV3' test.out

#- 204 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'itNQLzwRoWnR0Abk' \
    --extendExp  \
    --linkingToken 'CPY70FmvviVIBbcu' \
    > test.out 2>&1
eval_tap $? 204 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 205 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'jF8Vk5qb8NhWWwax' \
    > test.out 2>&1
eval_tap $? 205 'RequestOneTimeLinkingCodeV3' test.out

#- 206 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'yMchkt8l5IPSrwrJ' \
    > test.out 2>&1
eval_tap $? 206 'ValidateOneTimeLinkingCodeV3' test.out

#- 207 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'l7wYIVw13NCo9yXl' \
    --isTransient  \
    --clientId 'bQ52FTHTCj6SEAzT' \
    --oneTimeLinkCode '7TOpyiuvvQUm29Ia' \
    > test.out 2>&1
eval_tap $? 207 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 208 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 208 'GetCountryLocationV3' test.out

#- 209 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 209 'Logout' test.out

#- 210 RequestGameTokenCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenCodeResponseV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'cq4XRLaA643nTMtX' \
    > test.out 2>&1
eval_tap $? 210 'RequestGameTokenCodeResponseV3' test.out

#- 211 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SAyejnny0Ju13b6o' \
    --userId '5uB2XM6IHy7EEvHy' \
    > test.out 2>&1
eval_tap $? 211 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 212 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LmcvrZZOdwe1x8Rj' \
    > test.out 2>&1
eval_tap $? 212 'RevokeUserV3' test.out

#- 213 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'U6Bi8JXE52sUBBq2' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'xZ8N4UQ2fg3V1o2x' \
    --redirectUri '0hL5DuBDqMyIAzWz' \
    --scope 'e94MEdJFAy2JTllJ' \
    --state 'kRGB8jqJEd6eqqsB' \
    --targetAuthPage 'VyONV0JRtozI0jpl' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'iCFQ6WgJpGPigdc5' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 213 'AuthorizeV3' test.out

#- 214 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'OzATNSV9E9yyNb7y' \
    > test.out 2>&1
eval_tap $? 214 'TokenIntrospectionV3' test.out

#- 215 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 215 'GetJWKSV3' test.out

#- 216 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'aLXzAVYymOuhCkZu' \
    --factor '4htrsf8eIFSovTGX' \
    --mfaToken 'aMsq8ePN1oco2jx8' \
    > test.out 2>&1
eval_tap $? 216 'SendMFAAuthenticationCode' test.out

#- 217 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'Upe8SjMvpqM8pugg' \
    --mfaToken 'OEdG47gD5i2Ni6An' \
    > test.out 2>&1
eval_tap $? 217 'Change2faMethod' test.out

#- 218 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'Wn3NdEPhNHSH7eKD' \
    --factor 'fRcngEpTnRUQr3RL' \
    --mfaToken 'OM1vEx4gqDY6jwyK' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 218 'Verify2faCode' test.out

#- 219 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RxhkLe5zohg9s9ut' \
    --userId 'RQt28b6o3K0COF74' \
    > test.out 2>&1
eval_tap $? 219 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 220 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'tz6aeXZOYwbwjMNd' \
    --clientId 'xKWlBfnRyFS0Ed7g' \
    --redirectUri 'TM5AVrtBQiDTcNnZ' \
    --requestId 'a6Zuxk6u6HXXdiC9' \
    > test.out 2>&1
eval_tap $? 220 'AuthCodeRequestV3' test.out

#- 221 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'ZDj4E4mv12FNXypo' \
    --additionalData 'OLl13j84P0KqirJ4' \
    --clientId 'PkMFtsnFfz8Ew0X8' \
    --createHeadless  \
    --deviceId 'fBuBSKLSQ4GvLtz5' \
    --macAddress '0D3rpBfBovqLwXBu' \
    --platformToken 'T30EYeRj17xGhaBK' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 221 'PlatformTokenGrantV3' test.out

#- 222 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 222 'GetRevocationListV3' test.out

#- 223 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'oUfiHjGmCyPsKCJT' \
    > test.out 2>&1
eval_tap $? 223 'TokenRevocationV3' test.out

#- 224 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'v1ic9gvagF2cSuzt' \
    --clientId 'sJ5tj64gV7nmDk29' \
    --code 'mcjSuz9vbNStqPtQ' \
    --codeVerifier 'mQN6eKAGiZFCftT0' \
    --extendExp  \
    --password 'RWECdjWYrnulxcCK' \
    --redirectUri 'Aru8pOaAVLDB4k3J' \
    --refreshToken 'wkdaxR7GJpYmuYCP' \
    --username 'G181q9GA5DydC2D8' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 224 'TokenGrantV3' test.out

#- 225 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'c4VPDUR9ayazqXRq' \
    > test.out 2>&1
eval_tap $? 225 'VerifyTokenV3' test.out

#- 226 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'egIUicYXXzxsBFrU' \
    --code 's9BYp6TgCejBd5o7' \
    --error 'iTST7R3KbbQGERMN' \
    --openidAssocHandle 'pqWb51y5RUzvMfTk' \
    --openidClaimedId 'Py0fGvTGgfLKsg0b' \
    --openidIdentity '1Bq78cE5O5pmPnbi' \
    --openidMode 'PJ9j4vxmbH3rVaau' \
    --openidNs 'ufxkPHElug48TgfN' \
    --openidOpEndpoint 'u0rqXUOyToLPIREG' \
    --openidResponseNonce 'IKlJt3EP9kKwkENQ' \
    --openidReturnTo '8VOHGwbADMfuOmh0' \
    --openidSig 'lciRhVZ2DeoODXMz' \
    --openidSigned 'LSrzoiBnYi5UWs3t' \
    --state 'YlYeMoCimJySocRv' \
    > test.out 2>&1
eval_tap $? 226 'PlatformAuthenticationV3' test.out

#- 227 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'UWDOrFZKPNoN9AWt' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetInputValidations' test.out

#- 228 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'LK9TFgi9j2XMh9Wp' \
    > test.out 2>&1
eval_tap $? 228 'PublicGetInputValidationByField' test.out

#- 229 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'ifqjNjLOtNQts2yx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 229 'PublicGetCountryAgeRestrictionV3' test.out

#- 230 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 230 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 231 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'f6MLZJ2jZfZbpTJe' \
    > test.out 2>&1
eval_tap $? 231 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 232 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zzriCDWXT59SRu0Y' \
    --rawPUID  \
    --body '{"platformUserIds": ["qUxKDc84OMIzvTSc", "dbKBsAyJMz4ILNDv", "hB4Eoes9a6XaJeRb"]}' \
    > test.out 2>&1
eval_tap $? 232 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 233 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zTPwD3jxF7vxRUY0' \
    --platformUserId 'ilrNoFT98SgtJd4Z' \
    > test.out 2>&1
eval_tap $? 233 'PublicGetUserByPlatformUserIDV3' test.out

#- 234 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId '5f8nfaKqdZFLbZEH' \
    > test.out 2>&1
eval_tap $? 234 'PublicGetAsyncStatus' test.out

#- 235 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'xsDxeR6d7r1SQw80' \
    --limit '73' \
    --offset '56' \
    --query 'fMpPrSqYypRUnq5o' \
    > test.out 2>&1
eval_tap $? 235 'PublicSearchUserV3' test.out

#- 236 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "4ETeCUYG9ccTt7Wx", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "hURx1yPeczRpdk0H", "policyId": "ATGylx2JG2KNGfhz", "policyVersionId": "fCTxxrsRRLee3TcJ"}, {"isAccepted": false, "localizedPolicyVersionId": "DQIi45aCDHN9mVug", "policyId": "2zkVf6KgpKOcn3tM", "policyVersionId": "D9UT67bOwugFDa6w"}, {"isAccepted": true, "localizedPolicyVersionId": "eDAPOGBwweyFfXEO", "policyId": "EAEtbag82KgBgyCd", "policyVersionId": "5vjkfz3eR4DtNp12"}], "authType": "9hzBw3xLUcCEt0Dz", "code": "mkJq1sml5bYt76BN", "country": "si4giR9434WpKKdz", "dateOfBirth": "xoufCNlFoOcWQQy4", "displayName": "bjmQeEweoBHTdwAk", "emailAddress": "7ZQnbqY1cQwVEtAr", "password": "5kKKAo9MM2Cqm84j", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 236 'PublicCreateUserV3' test.out

#- 237 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'i9kIpqgrzpUkNOBW' \
    --query 'ydXV0Fi02aFr8CDa' \
    > test.out 2>&1
eval_tap $? 237 'CheckUserAvailability' test.out

#- 238 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["pjwNOl4k8rVNrm8d", "rv8QD2JOe2Ntz7EF", "vowPgIGuetxFMqXC"]}' \
    > test.out 2>&1
eval_tap $? 238 'PublicBulkGetUsers' test.out

#- 239 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "QMAqQ2ZRGzNtrThF", "languageTag": "a9XU8mosluiHZJ7O"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicSendRegistrationCode' test.out

#- 240 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "8sAQ32wj9uaDzsr9", "emailAddress": "xYiWRuuzQJiLc1eI"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicVerifyRegistrationCode' test.out

#- 241 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "9w3JEhxPGbEk7s7g", "languageTag": "w07FlounC3vJKBC7"}' \
    > test.out 2>&1
eval_tap $? 241 'PublicForgotPasswordV3' test.out

#- 242 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'SwgoViPeIB4Ehy0Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 242 'GetAdminInvitationV3' test.out

#- 243 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId '5aSJVDginxAM77eY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "C14FbfiI2NPvl1kC", "policyId": "Y5bEokxXxkWZbjf7", "policyVersionId": "GZxaossQmjo69woh"}, {"isAccepted": true, "localizedPolicyVersionId": "3HHijsQRj7N8IAjm", "policyId": "sonjj0ZR50BQ1U6a", "policyVersionId": "FD3O2kXQSc58zgZV"}, {"isAccepted": false, "localizedPolicyVersionId": "1btjJOqQMgZWAU6E", "policyId": "92nHJzvw7tnYtGfv", "policyVersionId": "0EJyjBu4EzwRjD7j"}], "authType": "EMAILPASSWD", "country": "m0jiaDH86d9rsKgz", "dateOfBirth": "CsMulpB8HZUtVVaJ", "displayName": "CiLgKOwrSfWhT5B4", "password": "WedopzwSluBtRFPK", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 243 'CreateUserFromInvitationV3' test.out

#- 244 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "prR3OEey0MkZwS6T", "country": "YwNN3UYhic03qGEg", "dateOfBirth": "5fNzBVrjo3g8CfRw", "displayName": "tyl1HeT7VEPgG40Q", "languageTag": "yXzsOzgck078Igho", "userName": "QBp2mWAOYksczxBS"}' \
    > test.out 2>&1
eval_tap $? 244 'UpdateUserV3' test.out

#- 245 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "0OBCa2vWadLmQtYK", "country": "mEMzicbuL2S3RiW8", "dateOfBirth": "dLTCBfGUdVEdvdQL", "displayName": "7sVwcZ2PofaJoSqt", "languageTag": "rEOqxH46fRTSZoDd", "userName": "T0fefo74eg3Nt2c0"}' \
    > test.out 2>&1
eval_tap $? 245 'PublicPartialUpdateUserV3' test.out

#- 246 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "r4GqF0NHglOVuNZ9", "emailAddress": "LzNeJnBurh54CWbY", "languageTag": "b0Pebyt8b4DGscjw"}' \
    > test.out 2>&1
eval_tap $? 246 'PublicSendVerificationCodeV3' test.out

#- 247 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "rizsFUgYwbaLvqvQ", "contactType": "2NbmDITuymTBjn3d", "languageTag": "2sFzMS3QaVjZF7Ax", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 247 'PublicUserVerificationV3' test.out

#- 248 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "15Kg9U8vrQJXQxoI", "country": "bVi2CLEk277Ivjj1", "dateOfBirth": "A647XQ3koaAfZIim", "displayName": "0sFPm1YN27bojDVa", "emailAddress": "ZLpx4kEWYkO6KrKU", "password": "MhJrASBh61hmWKSS", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 248 'PublicUpgradeHeadlessAccountV3' test.out

#- 249 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "NSQ9kEeXBZ6FVrBz", "password": "yhyhoS6a9oe0JaXF"}' \
    > test.out 2>&1
eval_tap $? 249 'PublicVerifyHeadlessAccountV3' test.out

#- 250 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "pff28uYbe4Cf2HEH", "newPassword": "vVevhISjbtBJUK5f", "oldPassword": "E3OufPSX3PdOU2V9"}' \
    > test.out 2>&1
eval_tap $? 250 'PublicUpdatePasswordV3' test.out

#- 251 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'yw94oa8UJ34TIedV' \
    > test.out 2>&1
eval_tap $? 251 'PublicCreateJusticeUser' test.out

#- 252 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3HyoX4VnO2LpBU08' \
    --redirectUri 'wfnlHBXFIqFUmgUS' \
    --ticket 'MM5au8GJT0mkVPI6' \
    > test.out 2>&1
eval_tap $? 252 'PublicPlatformLinkV3' test.out

#- 253 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zUtf3QaJPGrTNcXX' \
    --body '{"platformNamespace": "TUIggoH89QNmI17U"}' \
    > test.out 2>&1
eval_tap $? 253 'PublicPlatformUnlinkV3' test.out

#- 254 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Db19R6H7r1ta3m7j' \
    > test.out 2>&1
eval_tap $? 254 'PublicPlatformUnlinkAllV3' test.out

#- 255 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'K5pxe82pgFiAS6pi' \
    --ticket 'Izmc8rKrKEPGSAco' \
    > test.out 2>&1
eval_tap $? 255 'PublicForcePlatformLinkV3' test.out

#- 256 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ng6eNERUf8kjci1C' \
    --clientId 'tccv9Gv4tOcbnuCq' \
    --redirectUri 'f0lm6WBkIzjoSV31' \
    > test.out 2>&1
eval_tap $? 256 'PublicWebLinkPlatform' test.out

#- 257 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tvmMB6jzrpRGESmo' \
    --code 'oHiCV4GUOnXpapXQ' \
    --state 'GRakUbcG7PcR4eiU' \
    > test.out 2>&1
eval_tap $? 257 'PublicWebLinkPlatformEstablish' test.out

#- 258 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "3Idi55jNrGNT2VHT", "emailAddress": "KuIT5FwwHj0Ur5F2", "newPassword": "PWGTTD81xhNP4t6k"}' \
    > test.out 2>&1
eval_tap $? 258 'ResetPasswordV3' test.out

#- 259 PublicGetUserByUserIdV3
eval_tap 0 259 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 260 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YBUjyXAn3bWQF6Qc' \
    --activeOnly  \
    --after 'AiJpXIrgroixptZh' \
    --before 'ckUTGkcBOE4qMcH1' \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 260 'PublicGetUserBanHistoryV3' test.out

#- 261 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FDV1VitaomvWTzds' \
    > test.out 2>&1
eval_tap $? 261 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 262 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'W4N70wYS4Kj7Yi2V' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetUserInformationV3' test.out

#- 263 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'voQNW8Yc481dYdvG' \
    --after '0.37247091987041125' \
    --before '0.5804163538803054' \
    --limit '55' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetUserLoginHistoriesV3' test.out

#- 264 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7JwgwMUSuC3Bajy3' \
    --after 'BcEMCtQs2FcEcvVA' \
    --before 'yId6Cp85HVDsZBQg' \
    --limit '83' \
    > test.out 2>&1
eval_tap $? 264 'PublicGetUserPlatformAccountsV3' test.out

#- 265 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qsPNJMiZXXOFwmGW' \
    > test.out 2>&1
eval_tap $? 265 'PublicListJusticePlatformAccountsV3' test.out

#- 266 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'AvNF0Z0GkwxUNYyN' \
    --body '{"platformId": "wGiKrknH0Y5mrQgL", "platformUserId": "C6D2qsFiQHglUQMZ"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicLinkPlatformAccount' test.out

#- 267 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'i5WjMZfOadpgegCU' \
    --body '{"chosenNamespaces": ["jTdi1Ehr8OtqpNJ9", "R8TuNy4ejmVA3vMC", "sGyPd12B8QNUz0hF"], "requestId": "FNbH6j2W4roZM2UK"}' \
    > test.out 2>&1
eval_tap $? 267 'PublicForceLinkPlatformWithProgression' test.out

#- 268 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AXEEsL5D0oiFchQn' \
    > test.out 2>&1
eval_tap $? 268 'PublicGetPublisherUserV3' test.out

#- 269 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Veq3g2AB2WIRUQma' \
    --password 'uIY5HXCZ0W4XmWP0' \
    > test.out 2>&1
eval_tap $? 269 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 270 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'HzSdiylLhVYszm8x' \
    --before 'Y33OQbumu2QHLyZN' \
    --isWildcard  \
    --limit '42' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetRolesV3' test.out

#- 271 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'RVtIDi2piIQFVmzM' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetRoleV3' test.out

#- 272 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 272 'PublicGetMyUserV3' test.out

#- 273 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'idw70KSahpYZdKZR' \
    > test.out 2>&1
eval_tap $? 273 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 274 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["yR9AX7JjxvNZhM84", "DiZk6ySrB9SVFctW", "7YS0OkL78XeEAtAL"], "oneTimeLinkCode": "FI3v8yha4pd5A7MY"}' \
    > test.out 2>&1
eval_tap $? 274 'LinkHeadlessAccountToMyAccountV3' test.out

#- 275 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "cpBD6lKNb8RxvN2u"}' \
    > test.out 2>&1
eval_tap $? 275 'PublicSendVerificationLinkV3' test.out

#- 276 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code '5J7baOeLH19fqBwN' \
    > test.out 2>&1
eval_tap $? 276 'PublicVerifyUserByLinkV3' test.out

#- 277 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'bNe1ffYRtIvQaKye' \
    --code 'vWYtZjK6J29v8MpB' \
    --error 'Spo3AKRmnJkzJHAc' \
    --state 'kUyBksYQfDm0RNFw' \
    > test.out 2>&1
eval_tap $? 277 'PlatformAuthenticateSAMLV3Handler' test.out

#- 278 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'iz70tRVLMlHi8i9g' \
    --payload 'OVqajUWrgEsWDtaK' \
    > test.out 2>&1
eval_tap $? 278 'LoginSSOClient' test.out

#- 279 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'zn8dZwnnGeZsZVgb' \
    > test.out 2>&1
eval_tap $? 279 'LogoutSSOClient' test.out

#- 280 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --additionalData 'PzPFbrOMZMgWkFN7' \
    --code 'Tpkx6GcfyOg6ZUrr' \
    > test.out 2>&1
eval_tap $? 280 'RequestGameTokenResponseV3' test.out

#- 281 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'p9ubg9mndW2JKmQa' \
    > test.out 2>&1
eval_tap $? 281 'AdminGetDevicesByUserV4' test.out

#- 282 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'fUs2bxYztOEyVbKI' \
    --endDate 'f1ZbzgUwd8DHoCQy' \
    --limit '21' \
    --offset '53' \
    --startDate 'mXHYmkRlg7gYs6un' \
    > test.out 2>&1
eval_tap $? 282 'AdminGetBannedDevicesV4' test.out

#- 283 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PYQ9jNQN1di1ldhO' \
    > test.out 2>&1
eval_tap $? 283 'AdminGetUserDeviceBansV4' test.out

#- 284 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "h6HvjnYuV7NfC4A2", "deviceId": "ODiZhbfb8QqCyK1X", "deviceType": "H9D6vl5eFdFfgK46", "enabled": false, "endDate": "QKe3xmj6s0GqsWnc", "ext": {"p5LrqbiKudv9z75S": {}, "zoCV8ZMi2o1nR482": {}, "D6gNClk9c87hosaP": {}}, "reason": "FC5zBW3ZgVZCj9Ob"}' \
    > test.out 2>&1
eval_tap $? 284 'AdminBanDeviceV4' test.out

#- 285 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'VGT0Scwl4kNmCi15' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 285 'AdminGetDeviceBanV4' test.out

#- 286 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'XTJTgCNNH7RtG5Xm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 286 'AdminUpdateDeviceBanV4' test.out

#- 287 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'xJgaVfw5Vnyq8OzT' \
    --startDate 'E89WDNoMcOmbfJrC' \
    --deviceType 'JQIj1haAosKglqaC' \
    > test.out 2>&1
eval_tap $? 287 'AdminGenerateReportV4' test.out

#- 288 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 288 'AdminGetDeviceTypesV4' test.out

#- 289 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'XE9ytpIO8btO3OwN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 289 'AdminGetDeviceBansV4' test.out

#- 290 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'EGSW5TaW4to7QCY2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'AdminDecryptDeviceV4' test.out

#- 291 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'NGGvi9kg3rMIzNmh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'AdminUnbanDeviceV4' test.out

#- 292 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'JTNQjKlwjfJ3TJ2x' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 292 'AdminGetUsersByDeviceV4' test.out

#- 293 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 97}' \
    > test.out 2>&1
eval_tap $? 293 'AdminCreateTestUsersV4' test.out

#- 294 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["ZerWbtwTX9gNRByj", "bE8lOLAfTXKLzbrd", "dqcKLa7LevxNHOSE"]}' \
    > test.out 2>&1
eval_tap $? 294 'AdminBulkCheckValidUserIDV4' test.out

#- 295 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hQRZIp693lRwtc43' \
    --body '{"avatarUrl": "atCuCFxbfbz4aQER", "country": "ziPL4dHhOqG5KDdU", "dateOfBirth": "vk0LEi26Ls7mjRxN", "displayName": "mvvNtjJNQepUTGhw", "languageTag": "lY4lPzlsCR5rVsyf", "userName": "cH7WjP7HuGz3b5WA"}' \
    > test.out 2>&1
eval_tap $? 295 'AdminUpdateUserV4' test.out

#- 296 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EvdRF9bqMj4ro5B1' \
    --body '{"code": "9VE838c7OydVw0zC", "emailAddress": "qoMZvpIOO97DmQ5Z"}' \
    > test.out 2>&1
eval_tap $? 296 'AdminUpdateUserEmailAddressV4' test.out

#- 297 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ozx6iCJTu60IifzM' \
    > test.out 2>&1
eval_tap $? 297 'AdminDisableUserMFAV4' test.out

#- 298 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hkk5PxsjqbCKpMv2' \
    > test.out 2>&1
eval_tap $? 298 'AdminListUserRolesV4' test.out

#- 299 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yky9DYkD2sIllFtB' \
    --body '{"assignedNamespaces": ["tXJKG3rqBmILhtWm", "8RQvRUbUDSiefGEd", "LucrtO2gCQD057Dr"], "roleId": "DlgC2nzS9SiGUjVA"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminUpdateUserRoleV4' test.out

#- 300 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'w4v3q6JRHcn7KaoC' \
    --body '{"assignedNamespaces": ["EkRdo6qHYIZWnXqQ", "1oHFJ9Q0vqsL9Som", "qWsGA76yxi0QzZWf"], "roleId": "mP2sx0KO5bEJaPnA"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminAddUserRoleV4' test.out

#- 301 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FjsodyJQVVBrShGb' \
    --body '{"assignedNamespaces": ["IIuqK8C403HgoXCR", "6XOMXwKdfqk8T4QH", "K30EX0FclpDl5Hsu"], "roleId": "racO5MnjnxD1OXkx"}' \
    > test.out 2>&1
eval_tap $? 301 'AdminRemoveUserRoleV4' test.out

#- 302 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '91' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 302 'AdminGetRolesV4' test.out

#- 303 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "roleName": "RekLfjmy8zosRCRg"}' \
    > test.out 2>&1
eval_tap $? 303 'AdminCreateRoleV4' test.out

#- 304 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'VwbrQKmb01yA7U7d' \
    > test.out 2>&1
eval_tap $? 304 'AdminGetRoleV4' test.out

#- 305 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'GMjupZkZQY8CNyT4' \
    > test.out 2>&1
eval_tap $? 305 'AdminDeleteRoleV4' test.out

#- 306 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'k3DIbfT22G5NpE13' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "gxpKWtdtdtVW9anE"}' \
    > test.out 2>&1
eval_tap $? 306 'AdminUpdateRoleV4' test.out

#- 307 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'Nmxb9e7vXZV3ig8J' \
    --body '{"permissions": [{"action": 12, "resource": "xqZ209BySn8aUaGl", "schedAction": 53, "schedCron": "KJXCISQdwec1m8Bu", "schedRange": ["sV9tUh74KVo6Xqjz", "2xUKLNWSmYyVvyel", "IJ8QgaLMqi836ULa"]}, {"action": 6, "resource": "ce8NDMErA82FrR1G", "schedAction": 91, "schedCron": "RRnoOikIxXKKIR6k", "schedRange": ["Pmswm5TCAU1cKApd", "JDnE73GLmSZns5ow", "BhoUg4LsGP6KLPXk"]}, {"action": 43, "resource": "HEP5l94s7CbIJ7eH", "schedAction": 28, "schedCron": "PlLitytGka7Kv5Ta", "schedRange": ["cQKF4OlRGdmXxETL", "EQrr3KCAV9alq3hK", "1G4kKooSNNUZuiyn"]}]}' \
    > test.out 2>&1
eval_tap $? 307 'AdminUpdateRolePermissionsV4' test.out

#- 308 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'Z64IwncZPk82GF3e' \
    --body '{"permissions": [{"action": 93, "resource": "903INGIyEfRBEj7q", "schedAction": 25, "schedCron": "o9OHgfHumyfuBNis", "schedRange": ["ecYbcOpR45VDlvSc", "0Mr7ImwCwGqOf0bN", "s97KvKyj3MqS7Dcm"]}, {"action": 40, "resource": "DCjhnKvsHezWTqgY", "schedAction": 84, "schedCron": "x0ZidAJ1CU1eD1La", "schedRange": ["16Bw3JbUnUDh5yGj", "jv4Mwrv2vancmR6Z", "7rb21A2E9pX0BWCM"]}, {"action": 35, "resource": "A8bvXlDhG7BrorbK", "schedAction": 70, "schedCron": "SHrkoqv2mM6soMaT", "schedRange": ["vQq2a9YdFNtRVSO0", "js0hG9xmSnzd7zgU", "xAogcnGkXk17QPkJ"]}]}' \
    > test.out 2>&1
eval_tap $? 308 'AdminAddRolePermissionsV4' test.out

#- 309 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'HRhmLKQuQVFSKiXl' \
    --body '["8G2uf6E8EajXLSAS", "8MKMaxQ1QyJCpKed", "huzI7G9NCKKXu1bq"]' \
    > test.out 2>&1
eval_tap $? 309 'AdminDeleteRolePermissionsV4' test.out

#- 310 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'I2M5PmXfKnQ7BYGj' \
    --after 'CUDMOrbmoRvWnfmG' \
    --before 'Fy0eUoOBd90h9EDq' \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 310 'AdminListAssignedUsersV4' test.out

#- 311 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'mjtiVbqJnZcrqrPy' \
    --body '{"assignedNamespaces": ["e7fCwi7Il2wIFlHm", "9N6owMHMtJy1Oqn5", "9tEGm9NYeUT5P0nx"], "namespace": "8TqSZdZ5C8mFI9Tn", "userId": "vzEqBNMF9CZvPxT5"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminAssignUserToRoleV4' test.out

#- 312 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'zbreMc9fBoU3RHND' \
    --body '{"namespace": "FjLKFrepy56eW1km", "userId": "b15QeIQF51c4MqJz"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminRevokeUserFromRoleV4' test.out

#- 313 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["DSvELgBe6dboSdhk", "BzAzPkt1efGJeJax", "yHYutgXucx85vHA0"], "emailAddresses": ["09FAb21jxeWXk80y", "9uxgVLGgK8aVSCN6", "oCETQ8gIDRdD2wwM"], "isAdmin": true, "namespace": "wKVXGPhEJsc7rZpx", "roleId": "aPHc9r8eToFmkHJ6"}' \
    > test.out 2>&1
eval_tap $? 313 'AdminInviteUserNewV4' test.out

#- 314 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "BPOKFLxIwKssw647", "country": "YwDudnGRufOUGfMj", "dateOfBirth": "TU226l07jPlcYaqY", "displayName": "M7YfBmhjI9Y28qVc", "languageTag": "eS9UX48dKPCFUIey", "userName": "YEymNXzNX6TGh4Ud"}' \
    > test.out 2>&1
eval_tap $? 314 'AdminUpdateMyUserV4' test.out

#- 315 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 315 'AdminDisableMyAuthenticatorV4' test.out

#- 316 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'EweeBsJEvBbAvCml' \
    > test.out 2>&1
eval_tap $? 316 'AdminEnableMyAuthenticatorV4' test.out

#- 317 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 317 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 318 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 318 'AdminGetMyBackupCodesV4' test.out

#- 319 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 319 'AdminGenerateMyBackupCodesV4' test.out

#- 320 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 320 'AdminDisableMyBackupCodesV4' test.out

#- 321 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 321 'AdminDownloadMyBackupCodesV4' test.out

#- 322 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 322 'AdminEnableMyBackupCodesV4' test.out

#- 323 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 323 'AdminSendMyMFAEmailCodeV4' test.out

#- 324 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 324 'AdminDisableMyEmailV4' test.out

#- 325 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'h6Z1oz9BaixUUvmz' \
    > test.out 2>&1
eval_tap $? 325 'AdminEnableMyEmailV4' test.out

#- 326 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 326 'AdminGetMyEnabledFactorsV4' test.out

#- 327 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'bajE2gjooiDnc1NU' \
    > test.out 2>&1
eval_tap $? 327 'AdminMakeFactorMyDefaultV4' test.out

#- 328 AdminInviteUserV4
eval_tap 0 328 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 329 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "NB5dVCsB7xL4axSP", "policyId": "gPCiwLxCFLDixZwV", "policyVersionId": "tt3RVTl0tR00oQgc"}, {"isAccepted": true, "localizedPolicyVersionId": "dGGK3x76U1EIcklt", "policyId": "tmrpgF5szl0sMY8e", "policyVersionId": "s36r1FgR70eNLHkV"}, {"isAccepted": true, "localizedPolicyVersionId": "algizL97ycJV5YqE", "policyId": "2myQzl7X9fHr6WvB", "policyVersionId": "xmBvNj3ktaDf9B22"}], "authType": "EMAILPASSWD", "country": "kujxbCu1HFaj6Vxs", "dateOfBirth": "3GuA4S1dS7H7yIS7", "displayName": "b5TSDRIoMg7Dc5AP", "emailAddress": "zfzXDELJFaIaEMW5", "password": "bhJyL72WDyhBsCCb", "passwordMD5Sum": "nfihnXKxGxaupnTT", "username": "q9ihZkvFKfSHQh8I", "verified": false}' \
    > test.out 2>&1
eval_tap $? 329 'PublicCreateTestUserV4' test.out

#- 330 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "fGHawNx6yhniEHLb", "policyId": "EQKc0aUvrKXDIjYC", "policyVersionId": "4df9qswSlpCI8Dhj"}, {"isAccepted": false, "localizedPolicyVersionId": "onMFjmYqE1wJhfog", "policyId": "Wg2Apm0sUy18aWn6", "policyVersionId": "5Co0vdCk8so6JSaZ"}, {"isAccepted": true, "localizedPolicyVersionId": "DK46Eehx7xasqMY9", "policyId": "aulsL6NOV5agpS6A", "policyVersionId": "5mkufBpWVxIK9D2b"}], "authType": "EMAILPASSWD", "code": "cgaKoccaSwWcZmzC", "country": "WGI1cIQcPWAShIhi", "dateOfBirth": "eSKUf3zKbyQk2vQT", "displayName": "YX1xsth28NZZgsXy", "emailAddress": "cuQNGIDeHlf6IcX1", "password": "K9JrK6Or2xx7rLwr", "passwordMD5Sum": "PoWiywnxuDLLuIaS", "reachMinimumAge": true, "username": "nYoID2UqO0iAXA9d"}' \
    > test.out 2>&1
eval_tap $? 330 'PublicCreateUserV4' test.out

#- 331 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'B4ib8HDOJ8TNiP8K' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "OXvGSrdkqddI3ezq", "policyId": "u6FB0sL2xt6fX9j7", "policyVersionId": "rhZCAlDlVKBsLZiB"}, {"isAccepted": true, "localizedPolicyVersionId": "szE7CL1cQCSoqHvH", "policyId": "7g63cOx6yrIw37pK", "policyVersionId": "OLrF5i3gr3Cc4M2O"}, {"isAccepted": true, "localizedPolicyVersionId": "NrTQO7KLdZDGwqx7", "policyId": "T3l1ut2oyolliYsT", "policyVersionId": "JUmpscwLcUml3Kuo"}], "authType": "EMAILPASSWD", "country": "h7tprnacA34xmIOj", "dateOfBirth": "FLgKR4LjEWhOScvt", "displayName": "Q92iD02YMvEUNfoL", "password": "7JCcMo7GxxXdbYCR", "reachMinimumAge": false, "username": "m4ClIQmkIdLCvNhZ"}' \
    > test.out 2>&1
eval_tap $? 331 'CreateUserFromInvitationV4' test.out

#- 332 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "6P8aqZ2yfrC1V7Zp", "country": "JZPHCMqvcYmeDLYE", "dateOfBirth": "zs2SQUdKr6vgqkjy", "displayName": "cqclNlBORlC8Zkjs", "languageTag": "xYtgxplHTPLzynjF", "userName": "ZgF3erw7UsyHq4bB"}' \
    > test.out 2>&1
eval_tap $? 332 'PublicUpdateUserV4' test.out

#- 333 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "b0n1JhPUS8BRPGV9", "emailAddress": "n769zLJdKMexeJc7"}' \
    > test.out 2>&1
eval_tap $? 333 'PublicUpdateUserEmailAddressV4' test.out

#- 334 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "NvgTSgKjCxZjKf8N", "country": "A4cGUaDfy9XnH2r0", "dateOfBirth": "EKrk5VlnKsWCPccA", "displayName": "Fn5CEPoH6opK5DSO", "emailAddress": "8JyX4IE1z3rDwZ1H", "password": "KsOpyq8agQuz86nc", "reachMinimumAge": false, "username": "jLF9DIW2ncJJKpqm", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 334 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 335 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "S0URBhl0L5FCbOn4", "password": "6W2B2uPQLrt2t6bV", "username": "pCgKvPXSDufmKh78"}' \
    > test.out 2>&1
eval_tap $? 335 'PublicUpgradeHeadlessAccountV4' test.out

#- 336 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 336 'PublicDisableMyAuthenticatorV4' test.out

#- 337 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code '3cV54JsVBRB0rY0x' \
    > test.out 2>&1
eval_tap $? 337 'PublicEnableMyAuthenticatorV4' test.out

#- 338 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 338 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 339 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 339 'PublicGetMyBackupCodesV4' test.out

#- 340 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 340 'PublicGenerateMyBackupCodesV4' test.out

#- 341 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 341 'PublicDisableMyBackupCodesV4' test.out

#- 342 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'PublicDownloadMyBackupCodesV4' test.out

#- 343 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 343 'PublicEnableMyBackupCodesV4' test.out

#- 344 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'fWddACyHSmo4KX9T' \
    > test.out 2>&1
eval_tap $? 344 'PublicRemoveTrustedDeviceV4' test.out

#- 345 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'PublicSendMyMFAEmailCodeV4' test.out

#- 346 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'PublicDisableMyEmailV4' test.out

#- 347 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'PO3K1k5ZM8btmGsg' \
    > test.out 2>&1
eval_tap $? 347 'PublicEnableMyEmailV4' test.out

#- 348 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'PublicGetMyEnabledFactorsV4' test.out

#- 349 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'XNXbpqxh76Af5JSw' \
    > test.out 2>&1
eval_tap $? 349 'PublicMakeFactorMyDefaultV4' test.out

#- 350 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"emailAddress": "jw2fE2g6jXV7oai2", "namespace": "oDm9FaP0HJ98tE4U", "namespaceDisplayName": "yoQg0b0sGOkzxVt1"}' \
    > test.out 2>&1
eval_tap $? 350 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE