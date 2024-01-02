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
echo "1..367"

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

#- 128 AdminGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    --filterBlacklist  \
    > test.out 2>&1
eval_tap $? 128 'AdminGetCountryListV3' test.out

#- 129 AdminGetCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 129 'AdminGetCountryBlacklistV3' test.out

#- 130 AdminAddCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminAddCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"blacklist": ["3mtgWgU4pCAKxeE7", "0CaunQNxot371W9G", "4AvQkqsGnmyo5JJT"]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminAddCountryBlacklistV3' test.out

#- 131 RetrieveAllThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 131 'RetrieveAllThirdPartyLoginPlatformCredentialV3' test.out

#- 132 RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 132 'RetrieveAllActiveThirdPartyLoginPlatformCredentialV3' test.out

#- 133 RetrieveAllSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 133 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 134 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Vmb8GEXFTlEMEsFz' \
    > test.out 2>&1
eval_tap $? 134 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 135 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YqwgK1Np5nodqpLm' \
    --body '{"ACSURL": "7FhJBNXzAFdO0Khq", "AWSCognitoRegion": "f6kiTdSGv2LFjAKY", "AWSCognitoUserPool": "7CbgsWqFWZX7kPBo", "AllowedClients": ["m8F9GLLTG8phc3n4", "iLoIllKlpO2pqiXJ", "F3WGRaoQomSJC4Dd"], "AppId": "rKF7SUQPLG59e0k5", "AuthorizationEndpoint": "ZtX6wK7PpUlcIW32", "ClientId": "iK7MGt1ixY5rA1Wo", "Environment": "VeJIePF8ZrQzP4zv", "FederationMetadataURL": "tdxdbZUpd6FJtHJ1", "GenericOauthFlow": false, "IsActive": true, "Issuer": "KTK9tmmOnYnOpas6", "JWKSEndpoint": "ghP1y4Zi7s7QBlk4", "KeyID": "4Z44B1GZgKg4uKxa", "NetflixCertificates": {"encryptedPrivateKey": "CgcGLuC3brWdTYCf", "encryptedPrivateKeyName": "HkIySok5DiXZtLW8", "publicCertificate": "7rGysryod3dNQrms", "publicCertificateName": "ApRA6HX3RwrKt2ec", "rootCertificate": "ozL0TOg54vCE48L5", "rootCertificateName": "oLF6M4lNa4JUMSHN"}, "OrganizationId": "gqRqCV7usamANkZl", "PlatformName": "OX9Sfo95HgXqKhTP", "RedirectUri": "kwfLM9uSybRzWek2", "RegisteredDomains": [{"affectedClientIDs": ["gZvRrvr0n9d9lvcc", "KMLhrTrcBE2ItBS3", "KtKZWe8aoFzAyBME"], "domain": "74HUtipUWYhWV1qx", "namespaces": ["8CzPML52faXUr9Sk", "4lq2faBcAXXKlhvy", "H8paOJtxqMPpcVfR"], "roleId": "wNj547fH0XrKEDpE"}, {"affectedClientIDs": ["Y8VnocGAjci0V3tB", "f2jnHGKXphn50c9t", "NLDljhZ2jxLRX3z4"], "domain": "6OCaGBeMfPlNos4y", "namespaces": ["BRjrERHEonAZR8Gm", "Eu0q1p6QCyY6vSkV", "FWdsbYuVEGVxYheR"], "roleId": "3j5mNZ6vwv7K8Asv"}, {"affectedClientIDs": ["t1j1Rx59hesNWy2N", "vZ85DDKDAF8KDsBZ", "OuYQJ03BAHZ7c53q"], "domain": "7akMpcmnnx6RVBro", "namespaces": ["p9v7aZK3h65hbN15", "zfQSfQrtfF3TQN0O", "cNDLr36vzohZyjMQ"], "roleId": "Ag5mPYhrLTyU8Ohg"}], "Secret": "fY9JQYGF4bYXEcEN", "TeamID": "x9xZlAchob44lOND", "TokenAuthenticationType": "DwMvgI0HlyPR7wZN", "TokenClaimsMapping": {"iVsF6xG2mXEQdbzI": "Vy8alncV7vWgSHdf", "o07UctPErqxyMyOK": "06MqQBErxgjVBycv", "U4PbmRDcrg0DjQjB": "ECXvea7H1m2lJFRZ"}, "TokenEndpoint": "3ZprZ60zMjhTHeh9", "UserInfoEndpoint": "4TSenE5hCFkIf5we", "UserInfoHTTPMethod": "qZ18MH57l2Zsrh90", "scopes": ["ETtYmGukz3Mnlrjc", "Hp6B8Vj7rXFgDnDk", "dZ9bpjb1tdA3QhjC"]}' \
    > test.out 2>&1
eval_tap $? 135 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 136 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MW64f4XhIjSoTB2N' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 137 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MKtezapPr2QEPx3z' \
    --body '{"ACSURL": "TxBGtEJIYppuUSsK", "AWSCognitoRegion": "oHw2hyd12uSE7BEv", "AWSCognitoUserPool": "3aevq6iohU1cg4W1", "AllowedClients": ["IS3Uv1BpWoJBaqdg", "2FHcunsS1lnaO2m9", "vqjhbeK2qN8g6x2P"], "AppId": "yYDo5R3hLiD5sf5y", "AuthorizationEndpoint": "1JsxJNGmyt0SQDUD", "ClientId": "oWBZVGLlkUetzCAW", "Environment": "c9x1aMjgGim51T10", "FederationMetadataURL": "7XIZRZ7tZdIs0xf4", "GenericOauthFlow": false, "IsActive": true, "Issuer": "BFUjOn5mM7k8nbLz", "JWKSEndpoint": "vtCIW5ynMKquUicA", "KeyID": "eIVXtoWAXhMlW4tL", "NetflixCertificates": {"encryptedPrivateKey": "qX7OICf5oD1e6oI9", "encryptedPrivateKeyName": "FmYel0kOw72o8Zkg", "publicCertificate": "k0jS6rDWUwfhKvrf", "publicCertificateName": "2AaH4yCWrHSppnIZ", "rootCertificate": "kNnTn3rzH5NvAtcv", "rootCertificateName": "NedgS1fUfKmihDbm"}, "OrganizationId": "u8ePWlQMVDXEHeiG", "PlatformName": "TnwyEw6hIWDZrpP7", "RedirectUri": "rz3ISW510kHr4isT", "RegisteredDomains": [{"affectedClientIDs": ["KWjmv67nuHCXWfwn", "wGioVwVzmmBVVFfp", "qx1AeLtzcPJ3jtDY"], "domain": "Bo4FUTH7CGfKSyxg", "namespaces": ["RR1DiCqSMzpqIFGL", "kDs7ACC1RgBfoNrH", "lFi2qJLgmBLE35Yh"], "roleId": "yiDV90SeI5yppBHo"}, {"affectedClientIDs": ["ytVznCgNyx9fbT63", "ShEh8PbGikLjgjcj", "34uulU6FYBZsWFbr"], "domain": "3RSP0W9nBhvhf8Q0", "namespaces": ["DtJMcYQdN66bswAg", "t65X4N1LQZmB61JM", "dtwCVUrYQue84dwm"], "roleId": "bwFEnAZaWsQJtRYo"}, {"affectedClientIDs": ["agRJK5PX9UcOvhPy", "E11TRT2SKseoe8VL", "ie0LBa36KNzjf005"], "domain": "CXNGehQ2aTjTDfKF", "namespaces": ["DXC7eGL5YhJDWh9Y", "Wqc0qgV6d9yOfIML", "ds2DbPcaoMdtRLTm"], "roleId": "SvTkQQgB7exYvmHM"}], "Secret": "xr5hPCJJztJBg0tT", "TeamID": "Jg46IewOXE2AkCh3", "TokenAuthenticationType": "QIZsUf8lGFXcmwTE", "TokenClaimsMapping": {"RHclOdxIwqejxe18": "rNdb8Otq6j1mqUav", "7k05HAQltnSojV4j": "T65yclX2FtAz0vJj", "FIYWOaNdsimmkW2m": "iH3xRHAKy4QxZkaX"}, "TokenEndpoint": "Z7vmiEd0JPxVyQps", "UserInfoEndpoint": "haDwNqTbbFMXAMfV", "UserInfoHTTPMethod": "Xe0GZeMgsRsmH1EQ", "scopes": ["rYmkPKTPOlhTtSiZ", "NCxuogFteTHJe4Bh", "SSQkQD6WmOt6D7uf"]}' \
    > test.out 2>&1
eval_tap $? 137 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 138 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FVTOhvQpfbBke8aE' \
    --body '{"affectedClientIDs": ["dd36xj6wySoltDxs", "bzxrlaKEfkoYjY2o", "6ouRW9UtNquwC3Wg"], "assignedNamespaces": ["umrIz4NhGztZpr4U", "4fwQIiLXgmRasvjO", "4lj8m3XEwP2b4gd3"], "domain": "xOeii8Jnmssep2xD", "roleId": "2NY0kABeGs9yxahl"}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 139 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'd1pO0Gyf5PO3COyM' \
    --body '{"domain": "vczgEpzZ3Fbtxfhc"}' \
    > test.out 2>&1
eval_tap $? 139 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 140 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RC7IVYa6iZ5uFRYN' \
    > test.out 2>&1
eval_tap $? 140 'RetrieveSSOLoginPlatformCredential' test.out

#- 141 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'n3SHiWxF0YbuU5ar' \
    --body '{"acsUrl": "5qTLWUCy0Afgc050", "apiKey": "XIZRW491e94mQjVO", "appId": "OBnIWhunElqZUodp", "federationMetadataUrl": "3IhtCSHy1ei1fIrP", "isActive": true, "redirectUri": "B4t7WQnp8jXZedgt", "secret": "5cyNe27HLtwtVOax", "ssoUrl": "gP6Jbct8puMybYGx"}' \
    > test.out 2>&1
eval_tap $? 141 'AddSSOLoginPlatformCredential' test.out

#- 142 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'D9IPmmsLmu3kaPj0' \
    > test.out 2>&1
eval_tap $? 142 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 143 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'O4zd8Tb7cUNGPTBx' \
    --body '{"acsUrl": "iFFCrn7djjs69FTF", "apiKey": "VGUVhvKhJCmeisql", "appId": "14mUHVbMPimNhcZs", "federationMetadataUrl": "U3VAdMDcb4qlkiFA", "isActive": false, "redirectUri": "yGlElXdEAOrVSnLo", "secret": "cLVVYamQc4wcG5nD", "ssoUrl": "BLJoJHbiQ5duE5p4"}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateSSOPlatformCredential' test.out

#- 144 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'cfs2E41cK8QTwiIA' \
    --rawPID  \
    --body '{"platformUserIds": ["vxSvNDlmM5nQFMGz", "s7fzjgyc44mEh9tR", "k8knYSV30lnroQeh"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 145 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MDli6t9unQLYXxm0' \
    --platformUserId '9wpGAbpEmDY9vLh3' \
    > test.out 2>&1
eval_tap $? 145 'AdminGetUserByPlatformUserIDV3' test.out

#- 146 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'u6EDsUmrV6kH4Oot' \
    --after '75' \
    --before '64' \
    --limit '45' \
    > test.out 2>&1
eval_tap $? 146 'GetAdminUsersByRoleIdV3' test.out

#- 147 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress '2I03dIjvBbA6bfbY' \
    > test.out 2>&1
eval_tap $? 147 'AdminGetUserByEmailAddressV3' test.out

#- 148 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'aJCJjfk2TUvn95Fh' \
    --body '{"bulkUserId": ["O7VW3mbDVMDu87t0", "ldWf7iSGIiKFtWtn", "4Yr2svKM6pqLGZ0T"]}' \
    > test.out 2>&1
eval_tap $? 148 'AdminGetBulkUserBanV3' test.out

#- 149 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["BujELAUK6mQ5iZgb", "wwm5iGzXtcknrgid", "KupvXO6aj4hCmTC3"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminListUserIDByUserIDsV3' test.out

#- 150 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["4jxW4pIDwdqXpmRm", "ut9H9XyWI8bp8fQx", "RuX91uYmtrHJbEGT"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminBulkGetUsersPlatform' test.out

#- 151 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["Uj7YjERL1rEQG02z", "ccA8wvLsWUNd6lPK", "vqDejvqklTSvDwuO"], "isAdmin": true, "namespace": "J8daGTVX3Bb7jlz5", "roles": ["IfHgKjI9mwJSrN8j", "kIykR2zbaI6PD7fE", "scShnGUGUtV9GJ27"]}' \
    > test.out 2>&1
eval_tap $? 151 'AdminInviteUserV3' test.out

#- 152 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '66' \
    --platformUserId 'lDr19uJ3nq6VerzV' \
    --platformId 'CcI8y3Cz0YqCKUh5' \
    > test.out 2>&1
eval_tap $? 152 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 153 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUsersV3' test.out

#- 154 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'D9vNAp4jinFpnQ5x' \
    --endDate 'F9wwbvMZyeDeRnVf' \
    --includeTotal  \
    --limit '84' \
    --offset '45' \
    --platformBy 'Ua6xVVBcq3wZpFIY' \
    --platformId 'eAg79HcLJXJ7mpVI' \
    --query '6eTYAjdPlCiQQC35' \
    --startDate 'cj4KyOVgvnWbfRJt' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 154 'AdminSearchUserV3' test.out

#- 155 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["sB7cUQZ2QUAxJrIN", "PXppPNO3AfmXcgwC", "3IN6tvKgLB9QmJIO"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetBulkUserByEmailAddressV3' test.out

#- 156 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'q9dP5szG71utjsQ4' \
    > test.out 2>&1
eval_tap $? 156 'AdminGetUserByUserIdV3' test.out

#- 157 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CrRb9gUCeVz7fWbZ' \
    --body '{"avatarUrl": "IdhevfZvyV7Acodc", "country": "ZwKjYDdmJOlzwm9S", "dateOfBirth": "u4FnS98QqftSjq7s", "displayName": "n8yreciPLfkVyyJs", "languageTag": "bGpO6JgehDJxEN7J", "userName": "lZc8LMq1o2jZWu4y"}' \
    > test.out 2>&1
eval_tap $? 157 'AdminUpdateUserV3' test.out

#- 158 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A3r0u4q1bTHXIjfJ' \
    --activeOnly  \
    --after 'KyFlM0u1uuoVdn9y' \
    --before 'VoSlKNchPHNL4X3L' \
    --limit '76' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserBanV3' test.out

#- 159 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zv6CTRDl0zp9CzHF' \
    --body '{"ban": "winkBNi4gvqgl6TZ", "comment": "9TGVPmv34h6T7Esu", "endDate": "fmfxKYB4LM6H6QXm", "reason": "pZ9X3fUSR1l9xLPB", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminBanUserV3' test.out

#- 160 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'XnlUnqxT1WsRNMZc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'A92hzC7MNa8vVe4M' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpdateUserBanV3' test.out

#- 161 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KlvIomU3pIxM9n8D' \
    --body '{"context": "2eLMe3lt9qfx2UDc", "emailAddress": "gVE7L9FK6e0MrPc4", "languageTag": "vtxk9hVKlG56HlzG"}' \
    > test.out 2>&1
eval_tap $? 161 'AdminSendVerificationCodeV3' test.out

#- 162 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'r7XjdyRJunZPkp6c' \
    --body '{"Code": "cIBnWyPw8mj7gyQ7", "ContactType": "XdIszGRj46COPipH", "LanguageTag": "1MWVTHG0qHJCWEfO", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 162 'AdminVerifyAccountV3' test.out

#- 163 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'KDqebm83raNBJ5y7' \
    > test.out 2>&1
eval_tap $? 163 'GetUserVerificationCode' test.out

#- 164 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'axEkvI4oxZEDxGiB' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetUserDeletionStatusV3' test.out

#- 165 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nNbn0zaf7CaOSlHX' \
    --body '{"deletionDate": 36, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateUserDeletionStatusV3' test.out

#- 166 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qX9LM2IwEsdOGBXB' \
    --body '{"code": "wnzDX8v3xgC1Ge9P", "country": "dbTTAJ2Gp1r0sVZ6", "dateOfBirth": "LJAOddIL2l3hPjND", "displayName": "Kv2LWfXqjr8fS79E", "emailAddress": "n3wYowBdkaZ3y6i3", "password": "8XQjLDRqkpiFK5Bt", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 166 'AdminUpgradeHeadlessAccountV3' test.out

#- 167 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'URERnEMzpImW6sjA' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserInformationV3' test.out

#- 168 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HyCK5tNanGBrkzUv' \
    --after '0.03990421422667967' \
    --before '0.17144927049192626' \
    --limit '93' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserLoginHistoriesV3' test.out

#- 169 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xTtmOFMebS4AdlNz' \
    --body '{"languageTag": "wog2IhErkNhNcECW", "newPassword": "wchW6zL9SkbLlrNX", "oldPassword": "nGanMazb8jvRWenU"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminResetPasswordV3' test.out

#- 170 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RH48aJuALEcSqcE1' \
    --body '{"Permissions": [{"Action": 88, "Resource": "u6D31DjOsrs3CUYA", "SchedAction": 93, "SchedCron": "Er0KcgeqzGbruNB7", "SchedRange": ["2HHMkjzyBB4UFKia", "oV0VOem2yqPsMFxK", "ybPkbuS6x9cLJ1AP"]}, {"Action": 28, "Resource": "GcMICPUYnfG6jl9U", "SchedAction": 55, "SchedCron": "jReteIMgzISomCso", "SchedRange": ["dJrhQW41q2OspCZb", "t3Uta5I0uGcL1koy", "HjCH5olYLETRpABA"]}, {"Action": 26, "Resource": "9iqMcBL4BzhDUjhK", "SchedAction": 84, "SchedCron": "InDByhnoluO6ti0Q", "SchedRange": ["P2ssiJ66OzOj84O6", "tgohjtC7bzjPpucd", "dXJ5zifF8y959anr"]}]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminUpdateUserPermissionV3' test.out

#- 171 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NSleywHbHig6IKWV' \
    --body '{"Permissions": [{"Action": 90, "Resource": "77KeRWdECaFGzfZ2", "SchedAction": 15, "SchedCron": "6c2E2r3vk3IfAKEb", "SchedRange": ["qcNXSGCCvNowNmdp", "cJgF88ySNq4Mj7mu", "lP4tQ6R1OqKVOTni"]}, {"Action": 56, "Resource": "HkinOD975nARHCmh", "SchedAction": 81, "SchedCron": "zOTqcVNX3ahvxw9g", "SchedRange": ["wwhTnjN6wKZGW4y3", "f0R9s2kndhhZhwAi", "LsZs4pmLDIQch4Ij"]}, {"Action": 60, "Resource": "00UH197MJ6zU7JLM", "SchedAction": 88, "SchedCron": "AkXsVJbXi7eRZa7W", "SchedRange": ["wIc895ImqK6tVsaU", "q3stUh5J5Z9GiBiS", "AylX5cS0IeHpWCug"]}]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminAddUserPermissionsV3' test.out

#- 172 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mfOL0QQpxsuD8PGq' \
    --body '[{"Action": 21, "Resource": "Rydf8ZyyZeHAWGgJ"}, {"Action": 96, "Resource": "UOPG0iHDT8QbF7gH"}, {"Action": 85, "Resource": "yOjApNHBVfNOURcj"}]' \
    > test.out 2>&1
eval_tap $? 172 'AdminDeleteUserPermissionBulkV3' test.out

#- 173 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '77' \
    --namespace "$AB_NAMESPACE" \
    --resource '3YYT9oTynmfIuBWg' \
    --userId 'JTNFfM8M0IW4oe8K' \
    > test.out 2>&1
eval_tap $? 173 'AdminDeleteUserPermissionV3' test.out

#- 174 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dgy0xZfAcNg14Ws8' \
    --after 'TIP1LKiFQoLDvumf' \
    --before 'qrgSfnx2h61X9dN1' \
    --limit '78' \
    --platformId 'PuppUxDSK8aOTGMu' \
    > test.out 2>&1
eval_tap $? 174 'AdminGetUserPlatformAccountsV3' test.out

#- 175 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'dcxlCV4cNbJGQ57l' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetListJusticePlatformAccounts' test.out

#- 176 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'PdinpjS2DRfGt9Gl' \
    --userId 'yZVQ4X67tPZSTpPq' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetUserMapping' test.out

#- 177 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '3xjrElvvDgw0ag7k' \
    --userId 'SWE0Hiqm5IuLryiE' \
    > test.out 2>&1
eval_tap $? 177 'AdminCreateJusticeUser' test.out

#- 178 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'XqvUWDjU1G0EVjVZ' \
    --skipConflict  \
    --body '{"platformId": "w1ToLuPakQN1MpOs", "platformUserId": "1RVFrcg2CXxepx78"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminLinkPlatformAccount' test.out

#- 179 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fvsyhE2BKtyTDSIM' \
    --userId '7mkmvZ7Cmsh4US8o' \
    --body '{"platformNamespace": "4jfMANPpmZDdMiCx"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminPlatformUnlinkV3' test.out

#- 180 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'muCCVuFjS1GC1d2b' \
    --userId '92B4vEgj3HOmhcWm' \
    --ticket '428XejRF94NIY9nM' \
    > test.out 2>&1
eval_tap $? 180 'AdminPlatformLinkV3' test.out

#- 181 AdminDeleteUserLinkingHistoryByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingHistoryByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rBZo0lNUBDShHD32' \
    --userId 'vvL28FPwTiXfLcxD' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserLinkingHistoryByPlatformIDV3' test.out

#- 182 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'C9Ynd02mECIQhfIh' \
    --userId 'HtADUQ9zimQTQT95' \
    --platformToken 'pFJUAJsyAfeKOufV' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 183 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId '4f15NohXu6opxQGR' \
    --userId 't6PqlkL0diRhLC10' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetUserSinglePlatformAccount' test.out

#- 184 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ih2EQfY3XCv4hdOa' \
    --body '["6FdZhNMd1onFjGRb", "xtABPXDmgNEJBhgG", "q5GIDhNC66szbCCf"]' \
    > test.out 2>&1
eval_tap $? 184 'AdminDeleteUserRolesV3' test.out

#- 185 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '73IFbRkPSSITz4Tj' \
    --body '[{"namespace": "CrJHXGXku2YVuOzh", "roleId": "xHmnrrV9ZGWrZ05s"}, {"namespace": "xe6A6RpmKDebNkyl", "roleId": "bynkgT9vayLLiiza"}, {"namespace": "c7Ge6zKJdlt7rjF5", "roleId": "RaJwvkWVco2LTo5i"}]' \
    > test.out 2>&1
eval_tap $? 185 'AdminSaveUserRoleV3' test.out

#- 186 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'jlvDF8qBWCQ9dLWY' \
    --userId 'yS8zdhMeBXH8x6Hd' \
    > test.out 2>&1
eval_tap $? 186 'AdminAddUserRoleV3' test.out

#- 187 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'VfZVDAiU6iJOF7JK' \
    --userId 'ZFNk2NKy59X8iOg2' \
    > test.out 2>&1
eval_tap $? 187 'AdminDeleteUserRoleV3' test.out

#- 188 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sVBiCoeC5weXJl7P' \
    --body '{"enabled": false, "reason": "M8YmVjAkO3HKsEp6"}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserStatusV3' test.out

#- 189 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'KlqwW4djrexcbHdE' \
    --body '{"emailAddress": "toQvpV344RctmToz", "password": "Ci8HeV6jbalHmqBB"}' \
    > test.out 2>&1
eval_tap $? 189 'AdminTrustlyUpdateUserIdentity' test.out

#- 190 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fi7sSF5BoGiTCVsX' \
    > test.out 2>&1
eval_tap $? 190 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 191 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'sygWbjE2opXtdsJQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "eJ1too0qvxphTLEE"}' \
    > test.out 2>&1
eval_tap $? 191 'AdminUpdateClientSecretV3' test.out

#- 192 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'BGTtZyTjdKNKgYaz' \
    --before 'ujsmSmylT1YtxIq7' \
    --isWildcard  \
    --limit '85' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetRolesV3' test.out

#- 193 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "managers": [{"displayName": "b48jISd97KORRhxS", "namespace": "WLWLNfHRD3V15QaG", "userId": "GL46LuxJF3sbeqWB"}, {"displayName": "dQuWfgBAKx27MSBq", "namespace": "abUXOGkkoMUZn1YX", "userId": "j5zFZeOCOR9NvBQZ"}, {"displayName": "SJPOIKrRBrYVzi9u", "namespace": "i3lvozTt9TsH7A0T", "userId": "uU2aL4bPkk11sys6"}], "members": [{"displayName": "GdkDcos5uVJ0BJfZ", "namespace": "0jvA54CSqZFDsO1s", "userId": "kRjOU1SMfQVQa6bl"}, {"displayName": "j9Rdd85bdYUumPKV", "namespace": "SZCg3XTc9vQe0dHJ", "userId": "fF6KIuvnRCa9Jkty"}, {"displayName": "BdxkZKrEWFw9GYxj", "namespace": "iiOQAD77ci0vfWVZ", "userId": "oRRMPi57HyKKz5ny"}], "permissions": [{"action": 71, "resource": "K9zyv6gFZXI5nXJ7", "schedAction": 15, "schedCron": "jC56pda3YhtQxpCY", "schedRange": ["ME6x21pdX2QSPAd9", "sxoLnWGP1PafIjLX", "8ce0KbNN7Ycl2Jfm"]}, {"action": 87, "resource": "0mRvSoaGk4ktF5wn", "schedAction": 73, "schedCron": "472oWJlfglLM4xjf", "schedRange": ["kNL4lU6jaGfsD1cf", "swmeFpvtDtetoQVF", "L8LNW11vtpaTxi7k"]}, {"action": 62, "resource": "89jRCn48bvkCPfKo", "schedAction": 11, "schedCron": "0Wj1WfzIvc3VlSXr", "schedRange": ["A3XUGud4tVjmxEf4", "XvVhFJTxFHITBg9x", "4unq3eOMHIKeTyBG"]}], "roleName": "5dCUoExnKfV3869I"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminCreateRoleV3' test.out

#- 194 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'N4V1OdhH4GVU7Exl' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetRoleV3' test.out

#- 195 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'kmc4xYiLjLyZrXr9' \
    > test.out 2>&1
eval_tap $? 195 'AdminDeleteRoleV3' test.out

#- 196 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'Bhtzn8jAdTn6xBhr' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "iryLm67rkadH5Y41"}' \
    > test.out 2>&1
eval_tap $? 196 'AdminUpdateRoleV3' test.out

#- 197 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'SLjCPrFa05Xl5TPC' \
    > test.out 2>&1
eval_tap $? 197 'AdminGetRoleAdminStatusV3' test.out

#- 198 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId '5GODS44bmm7jPdKL' \
    > test.out 2>&1
eval_tap $? 198 'AdminUpdateAdminRoleStatusV3' test.out

#- 199 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'ddfdsUqjXVzW1Qqx' \
    > test.out 2>&1
eval_tap $? 199 'AdminRemoveRoleAdminV3' test.out

#- 200 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'nWR5sheLgsAF4ctv' \
    --after '5guycGiq9j2EyIkn' \
    --before 'fLDpgHnMOn8nc3gU' \
    --limit '9' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetRoleManagersV3' test.out

#- 201 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'ZFyyEr0KBXuJBqK4' \
    --body '{"managers": [{"displayName": "QtEydPWLPBYiR3Ub", "namespace": "Jc1ZYapx7C477etq", "userId": "gfOJDUT0uKAPrARy"}, {"displayName": "a2IMlNiXpF4qvsUU", "namespace": "pHqi33TcBGkc0HjU", "userId": "cnkpU9oVzl2kBuLF"}, {"displayName": "XIeCEKZUTz3GvCAZ", "namespace": "5j24acYHbrryHB6G", "userId": "O9zP3FaepA3b3YJ9"}]}' \
    > test.out 2>&1
eval_tap $? 201 'AdminAddRoleManagersV3' test.out

#- 202 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'nJM6vtT27xv85K5M' \
    --body '{"managers": [{"displayName": "U2qmbeqaVemINdCl", "namespace": "pF7OvlBIEgjse5kd", "userId": "6GEDo08yq5E5HleL"}, {"displayName": "oog4me2NBFp62xlX", "namespace": "vVcJerTPW02PWsHi", "userId": "KYArAxnKBfBfDlrQ"}, {"displayName": "QuAc10DjjwMv4vrI", "namespace": "PRtvhQIyLarjaLOK", "userId": "nX51yAB8Pa3uNGKh"}]}' \
    > test.out 2>&1
eval_tap $? 202 'AdminRemoveRoleManagersV3' test.out

#- 203 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'aLlJzJMSnJIIgsAV' \
    --after 'maGYxUX1B9oVuzG2' \
    --before 'CnYX2YBF2g7TVtzY' \
    --limit '62' \
    > test.out 2>&1
eval_tap $? 203 'AdminGetRoleMembersV3' test.out

#- 204 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'kaZP7pnnVfxPwc25' \
    --body '{"members": [{"displayName": "9HF9ejHaILQruAuY", "namespace": "yJLYGqMv824ouSgk", "userId": "pK70uJmUL0uzElix"}, {"displayName": "c023dIvDiA0tQWlH", "namespace": "wBcTtztx3VAl6tXF", "userId": "bnATCzUOIzVcy9k3"}, {"displayName": "ie64Vnwa0ClGQJul", "namespace": "tJe32AiwKadEoIVm", "userId": "prwPsa9YD92CX0rI"}]}' \
    > test.out 2>&1
eval_tap $? 204 'AdminAddRoleMembersV3' test.out

#- 205 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'TajpwHITGeHTnqRb' \
    --body '{"members": [{"displayName": "zBB9ZFgJbQ3Fj1um", "namespace": "x4ItzkMJ7cudf4r9", "userId": "16GPrhn2etVIQvRk"}, {"displayName": "QJAtDUH9tx60AehG", "namespace": "z1ermJYXsYgL7Tfy", "userId": "IlAwjTZdRZJJzWZw"}, {"displayName": "vTX2bamSCvX1nwvS", "namespace": "WdDwD7WJHzgNZUKs", "userId": "I5y0mR3zMyTsftKq"}]}' \
    > test.out 2>&1
eval_tap $? 205 'AdminRemoveRoleMembersV3' test.out

#- 206 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'nsIJctAdxyZVKHA9' \
    --body '{"permissions": [{"action": 60, "resource": "ucHf7dbh2iKNUl0q", "schedAction": 72, "schedCron": "VDwBAqanOlscRIWw", "schedRange": ["82k5K5VTkdubkOFl", "dMCQ98JH4n0Jtgqz", "Zv5kVu4S95mj8YRv"]}, {"action": 0, "resource": "ktx3N7WNMYIfcDKb", "schedAction": 77, "schedCron": "bVtZcfVCPdQhim9Q", "schedRange": ["KUAFTVYelIlGJg9w", "dc8bihhWjfZpfcFB", "UsnnDJlmD1iEokbU"]}, {"action": 18, "resource": "1eI7Q5pu9PutLf6I", "schedAction": 36, "schedCron": "MzMTQ9P7sYLDWAJO", "schedRange": ["A75K4BYJ2fkqYJoF", "2FI3vyyqRzc20O7F", "dsJP1G9tyBTfERXd"]}]}' \
    > test.out 2>&1
eval_tap $? 206 'AdminUpdateRolePermissionsV3' test.out

#- 207 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'vgD1Qf7Ot2DkUt3y' \
    --body '{"permissions": [{"action": 9, "resource": "x8ncXejmeZtzT0qj", "schedAction": 59, "schedCron": "ltsqfiZrthVvyX0O", "schedRange": ["CKDJE3RMUddwSSgx", "Cu8zru1DhGAYOHR5", "BWa9VzIkaQEl1iUP"]}, {"action": 37, "resource": "lT2sY3SsTnDQY7kK", "schedAction": 96, "schedCron": "vdRhG9NwV3zDuqVl", "schedRange": ["VTypcYPK8IxrSZux", "Wl0Je4fJIyFAm3DQ", "ht4JwnPS2urJqero"]}, {"action": 2, "resource": "IBbcujF8Vk5qb8Nh", "schedAction": 99, "schedCron": "6XdBaKSLCgOOPXM6", "schedRange": ["XTUh2dJ90yqHDNac", "l4F9G6Dl5TFwBY6H", "KXAblkT8VGgSH8MG"]}]}' \
    > test.out 2>&1
eval_tap $? 207 'AdminAddRolePermissionsV3' test.out

#- 208 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'ZGwiVj7eDTaka9AB' \
    --body '["fX1IByPEOuPhGspR", "i3bhPQvBBJI5Jxyt", "pcubN4AUUPFPscZs"]' \
    > test.out 2>&1
eval_tap $? 208 'AdminDeleteRolePermissionsV3' test.out

#- 209 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '47' \
    --resource 'eJOD4DMtqfIGiGJo' \
    --roleId 'vgWSRxZ8N4UQ2fg3' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteRolePermissionV3' test.out

#- 210 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 210 'AdminGetMyUserV3' test.out

#- 211 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'V1o2x0hL5DuBDqMy' \
    --extendExp  \
    --redirectUri 'IAzWze94MEdJFAy2' \
    --password 'JTllJkRGB8jqJEd6' \
    --requestId 'eqqsBVyONV0JRtoz' \
    --userName 'I0jpliCFQ6WgJpGP' \
    > test.out 2>&1
eval_tap $? 211 'UserAuthenticationV3' test.out

#- 212 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'igdc5VyC4qvWjVac' \
    --linkingToken '1cQvSxgTNIUzxDgB' \
    --password 'lIbuzm7DzJ20NFRJ' \
    --username 'IhFXR2dYprPmbpup' \
    > test.out 2>&1
eval_tap $? 212 'AuthenticationWithPlatformLinkV3' test.out

#- 213 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'tECGd5cdXC2Sesc6' \
    --extendExp  \
    --linkingToken 'y68whNBYl9iCqfW6' \
    > test.out 2>&1
eval_tap $? 213 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 214 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'rqGOQny4ij4ysYPo' \
    > test.out 2>&1
eval_tap $? 214 'RequestOneTimeLinkingCodeV3' test.out

#- 215 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'nb59gQffkNOmubxE' \
    > test.out 2>&1
eval_tap $? 215 'ValidateOneTimeLinkingCodeV3' test.out

#- 216 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'Jr2qEAuJbpZSrcbc' \
    --isTransient  \
    --clientId '4LWfKaY5c1tP5TDu' \
    --oneTimeLinkCode 'I5f6m4KC07CnsZe3' \
    > test.out 2>&1
eval_tap $? 216 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 217 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 217 'GetCountryLocationV3' test.out

#- 218 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 218 'Logout' test.out

#- 219 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId '2hqEcB1ExYMBb3ck' \
    > test.out 2>&1
eval_tap $? 219 'RequestTokenExchangeCodeV3' test.out

#- 220 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'voaJYdMqGegcg3eR' \
    --userId 'vBZXN3cjIXmFWRJn' \
    > test.out 2>&1
eval_tap $? 220 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 221 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'j8xN7HDPTUEDPN1K' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 221 'RevokeUserV3' test.out

#- 222 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'b4UTPWDXTSb55g8L' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'XypoOLl13j84P0Kq' \
    --redirectUri 'irJ4PkMFtsnFfz8E' \
    --scope 'w0X8fBuBSKLSQ4Gv' \
    --state 'Ltz50D3rpBfBovqL' \
    --targetAuthPage 'wXBuT30EYeRj17xG' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'haBKoUfiHjGmCyPs' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 222 'AuthorizeV3' test.out

#- 223 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'etWsokvx3BHuTEcz' \
    > test.out 2>&1
eval_tap $? 223 'TokenIntrospectionV3' test.out

#- 224 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 224 'GetJWKSV3' test.out

#- 225 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'r9KjQ3ttz8MTBt1x' \
    --factor 'k9IyssSA8nP5PQjp' \
    --mfaToken 'zk2Tb7iYdmNZWosr' \
    > test.out 2>&1
eval_tap $? 225 'SendMFAAuthenticationCode' test.out

#- 226 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'sVBPZ64j0HUONsco' \
    --mfaToken 'fwYLQcDvkaEIIPoJ' \
    > test.out 2>&1
eval_tap $? 226 'Change2faMethod' test.out

#- 227 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'T83zEGXmVBZLyrH9' \
    --factor 'J7BoysmaORLkP5hc' \
    --mfaToken '2Fh04JTsqDTynCew' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 227 'Verify2faCode' test.out

#- 228 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qJligLlRxOelKykI' \
    --userId 'CRxF6HtlER2txs4q' \
    > test.out 2>&1
eval_tap $? 228 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 229 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'rNARATn6KXOutlYB' \
    --clientId 'bLhL8KXx25FZfQIo' \
    --redirectUri 'dVBqQsBpCJBIXLGY' \
    --requestId 'cwWVRK6UKk5ozrXA' \
    > test.out 2>&1
eval_tap $? 229 'AuthCodeRequestV3' test.out

#- 230 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId '4HZHNyq9odanhR1Z' \
    --additionalData 'rm3thUvV87yfkycL' \
    --clientId 'SVdleSaAylsmLYe2' \
    --createHeadless  \
    --deviceId 'phYOgT5kDTyPl3dK' \
    --macAddress 'F7NXEjrJMki8jvc3' \
    --platformToken 'P8Gwjg3IOH0SDHgY' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 230 'PlatformTokenGrantV3' test.out

#- 231 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 231 'GetRevocationListV3' test.out

#- 232 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'KqxJiFJdrmj5vhzg' \
    > test.out 2>&1
eval_tap $? 232 'TokenRevocationV3' test.out

#- 233 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'pspc' \
    --simultaneousTicket 'i5UWs3tYlYeMoCim' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'ySocRvUWDOrFZKPN' \
    > test.out 2>&1
eval_tap $? 233 'SimultaneousLoginV3' test.out

#- 234 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'oN9AWtLK9TFgi9j2' \
    --clientId 'XMh9WpifqjNjLOtN' \
    --code 'Qts2yxf6MLZJ2jZf' \
    --codeVerifier 'ZbpTJezzriCDWXT5' \
    --extendNamespace '9SRu0YqUxKDc84OM' \
    --extendExp  \
    --password 'IzvTScdbKBsAyJMz' \
    --redirectUri '4ILNDvhB4Eoes9a6' \
    --refreshToken 'XaJeRbzTPwD3jxF7' \
    --username 'vxRUY0ilrNoFT98S' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 234 'TokenGrantV3' test.out

#- 235 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'CAtvSG8Cfa9dzOJD' \
    > test.out 2>&1
eval_tap $? 235 'VerifyTokenV3' test.out

#- 236 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'GCTHIOFjeXbsSgR4' \
    --code '3kIDzxBwqRJTzrHN' \
    --error 'ZWUsq5lQo2jy29EJ' \
    --openidAssocHandle 'igqYhyVhURx1yPec' \
    --openidClaimedId 'zRpdk0HATGylx2JG' \
    --openidIdentity '2KNGfhzfCTxxrsRR' \
    --openidMode 'Lee3TcJ7DQIi45aC' \
    --openidNs 'DHN9mVug2zkVf6Kg' \
    --openidOpEndpoint 'pKOcn3tMD9UT67bO' \
    --openidResponseNonce 'wugFDa6wUQvehKqw' \
    --openidReturnTo 'Ch86XmRkCEcfHDCd' \
    --openidSig 'l59Wp9A3tXGve6Dd' \
    --openidSigned 'K6uvg8f2cIoByk9f' \
    --state 'xtvsgeAxo57nKAbZ' \
    > test.out 2>&1
eval_tap $? 236 'PlatformAuthenticationV3' test.out

#- 237 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'psbJ4Iu5KJ0ynxGB' \
    --platformToken 'lacDCdFe8ATUqVxc' \
    > test.out 2>&1
eval_tap $? 237 'PlatformTokenRefreshV3' test.out

#- 238 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'SthrpnMUBsnUfuQI' \
    > test.out 2>&1
eval_tap $? 238 'PublicGetInputValidations' test.out

#- 239 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'cSbUt5UGkInFGpuU' \
    > test.out 2>&1
eval_tap $? 239 'PublicGetInputValidationByField' test.out

#- 240 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'sdtq4dOwNESzCEW9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 240 'PublicGetCountryAgeRestrictionV3' test.out

#- 241 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'PublicGetCountryListV3' test.out

#- 242 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 242 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 243 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'dUVhZjLftC3sCS8C' \
    > test.out 2>&1
eval_tap $? 243 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 244 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pLCqPD9CeDEdCnnL' \
    --rawPID  \
    --body '{"platformUserIds": ["6Kt1Bjj3b8QM8Rr4", "5ULqXQgvwD3PsKDJ", "iWxQBwaS7rDBf2S5"]}' \
    > test.out 2>&1
eval_tap $? 244 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 245 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4phbdyGDt47f9GWR' \
    --platformUserId 'lE9hqz6rjDNo4rhj' \
    > test.out 2>&1
eval_tap $? 245 'PublicGetUserByPlatformUserIDV3' test.out

#- 246 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'xUdMM83WekqfWv04' \
    > test.out 2>&1
eval_tap $? 246 'PublicGetAsyncStatus' test.out

#- 247 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'vvn9bk5qr8qs2mqt' \
    --limit '28' \
    --offset '42' \
    --platformBy 'GAqXUjNypF6MMqWp' \
    --platformId 'dEJsPoaIbYz8cK5j' \
    --query 'lpJdre5ur6yvWJDd' \
    > test.out 2>&1
eval_tap $? 247 'PublicSearchUserV3' test.out

#- 248 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "vM7T7PX2vamIRZHz", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "ginxAM77eY9C14Fb", "policyId": "fiI2NPvl1kCY5bEo", "policyVersionId": "kxXxkWZbjf7GZxao"}, {"isAccepted": true, "localizedPolicyVersionId": "BeIqdQGZC5kM03HH", "policyId": "ijsQRj7N8IAjmson", "policyVersionId": "jj0ZR50BQ1U6aFD3"}, {"isAccepted": true, "localizedPolicyVersionId": "2kXQSc58zgZVl4gI", "policyId": "F7v3qbZu9M3OxqVA", "policyVersionId": "T4H1lRZ9Z1JBrHRz"}], "authType": "EOtIxzPqb6n73m0j", "code": "iaDH86d9rsKgzCsM", "country": "ulpB8HZUtVVaJCiL", "dateOfBirth": "gKOwrSfWhT5B4Wed", "displayName": "opzwSluBtRFPKThy", "emailAddress": "GnbjmPDKFS6u9FHu", "password": "v1M3qfch4SqIV6LQ", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 248 'PublicCreateUserV3' test.out

#- 249 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'laeYl4csFq65cU66' \
    --query 'yJaj4ovoKWE4EW0s' \
    > test.out 2>&1
eval_tap $? 249 'CheckUserAvailability' test.out

#- 250 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["w8v5peiuxoBJATau", "yD3XCXVMiyEvMf9y", "ilUEujk6oqYo1HQY"]}' \
    > test.out 2>&1
eval_tap $? 250 'PublicBulkGetUsers' test.out

#- 251 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "TFzwdOMdupwD4O3u", "languageTag": "NbcIDcIyvZbOy1T4"}' \
    > test.out 2>&1
eval_tap $? 251 'PublicSendRegistrationCode' test.out

#- 252 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "hfwkuVykH4RpfmjI", "emailAddress": "XFGZ5PKdbabJIkNn"}' \
    > test.out 2>&1
eval_tap $? 252 'PublicVerifyRegistrationCode' test.out

#- 253 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "t9P1Tkm08luh4dpP", "languageTag": "RMDbUXBWTbpAogG2"}' \
    > test.out 2>&1
eval_tap $? 253 'PublicForgotPasswordV3' test.out

#- 254 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'wlZkLhuU5FI8NijF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 254 'GetAdminInvitationV3' test.out

#- 255 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'I0GKwJ3vfXlsAMy2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "UgYwbaLvqvQ2NbmD", "policyId": "ITuymTBjn3d2sFzM", "policyVersionId": "S3QaVjZF7Ax6115K"}, {"isAccepted": false, "localizedPolicyVersionId": "as9S7ivHEoLbUMM4", "policyId": "7f1UreUpxEkXIbE1", "policyVersionId": "ETzRJZKMavu4Ul2I"}, {"isAccepted": false, "localizedPolicyVersionId": "m1YN27bojDVaZLpx", "policyId": "4kEWYkO6KrKUMhJr", "policyVersionId": "ASBh61hmWKSSrF35"}], "authType": "EMAILPASSWD", "country": "kEeXBZ6FVrBzyhyh", "dateOfBirth": "oS6a9oe0JaXFpff2", "displayName": "8uYbe4Cf2HEHvVev", "password": "hISjbtBJUK5fE3Ou", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 255 'CreateUserFromInvitationV3' test.out

#- 256 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "G5N066FXb88SbLOa", "country": "21DiSFsm0XXQJWsz", "dateOfBirth": "vTQEuALzDNp1SZ58", "displayName": "aDllwzTRHak1MXxj", "languageTag": "7Esrg7900nml5Bid", "userName": "sK9dCEzhVnOv0PQb"}' \
    > test.out 2>&1
eval_tap $? 256 'UpdateUserV3' test.out

#- 257 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "VIaKiHfoeorY7A1o", "country": "tGFyv2SMjbEr50qG", "dateOfBirth": "dCZIc6EFqBKxbS7Q", "displayName": "2OgRucL1jwRXzfjD", "languageTag": "ZZBmOau6syme06c6", "userName": "SKLc2mEC3IXl5XCb"}' \
    > test.out 2>&1
eval_tap $? 257 'PublicPartialUpdateUserV3' test.out

#- 258 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "kOfHaGr5kdazlypv", "emailAddress": "t6lSLfU7HByGXPMq", "languageTag": "xj4hBgVY3YAxZLKb"}' \
    > test.out 2>&1
eval_tap $? 258 'PublicSendVerificationCodeV3' test.out

#- 259 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "cOdyjqf6Q4oiwoJc", "contactType": "aRMEb15LBlTVufc5", "languageTag": "ZyODR2NVyn4PRqf3", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 259 'PublicUserVerificationV3' test.out

#- 260 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "D81xhNP4t6kYBUjy", "country": "XAn3bWQF6QcAiJpX", "dateOfBirth": "IrgroixptZhckUTG", "displayName": "kcBOE4qMcH1Kyi8Z", "emailAddress": "FvGcV8DY0XOkDstx", "password": "ZcY1HgAnZV4IOglV", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 260 'PublicUpgradeHeadlessAccountV3' test.out

#- 261 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "Yc481dYdvGxJAMDR", "password": "A1LF7jdWlekFwO94"}' \
    > test.out 2>&1
eval_tap $? 261 'PublicVerifyHeadlessAccountV3' test.out

#- 262 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "VBCV9qJhWva2FPBu", "newPassword": "jX0geYCpGJM4sqsP", "oldPassword": "NJMiZXXOFwmGWAvN"}' \
    > test.out 2>&1
eval_tap $? 262 'PublicUpdatePasswordV3' test.out

#- 263 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'F0Z0GkwxUNYyNwGi' \
    > test.out 2>&1
eval_tap $? 263 'PublicCreateJusticeUser' test.out

#- 264 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KrknH0Y5mrQgLC6D' \
    --redirectUri '2qsFiQHglUQMZi5W' \
    --ticket 'jMZfOadpgegCUjTd' \
    > test.out 2>&1
eval_tap $? 264 'PublicPlatformLinkV3' test.out

#- 265 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'i1Ehr8OtqpNJ9R8T' \
    --body '{"platformNamespace": "uNy4ejmVA3vMCsGy"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicPlatformUnlinkV3' test.out

#- 266 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Pd12B8QNUz0hFFNb' \
    > test.out 2>&1
eval_tap $? 266 'PublicPlatformUnlinkAllV3' test.out

#- 267 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'H6j2W4roZM2UKAXE' \
    --ticket 'EsL5D0oiFchQnVeq' \
    > test.out 2>&1
eval_tap $? 267 'PublicForcePlatformLinkV3' test.out

#- 268 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId '3g2AB2WIRUQmauIY' \
    --clientId '5HXCZ0W4XmWP0HzS' \
    --redirectUri 'diylLhVYszm8xY33' \
    > test.out 2>&1
eval_tap $? 268 'PublicWebLinkPlatform' test.out

#- 269 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OQbumu2QHLyZNuys' \
    --code 'yM4OfCzdQCXMAWnf' \
    --state '87YPNOe9Eevf1fhM' \
    > test.out 2>&1
eval_tap $? 269 'PublicWebLinkPlatformEstablish' test.out

#- 270 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'g1E2k7QLFrVgtX7y' \
    --code '0fPOieDCow2zXyFF' \
    --state 'VpM87yqEwEacQMTl' \
    > test.out 2>&1
eval_tap $? 270 'PublicProcessWebLinkPlatformV3' test.out

#- 271 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "qN4LKkxJ5v3SBafn", "userIds": ["KNiMPbFkFGA85W3H", "JkqgS2B37wwoPYOH", "iIsxmsLBPBJuNLnW"]}' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetUsersPlatformInfosV3' test.out

#- 272 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "RrtW870qD88ZcduZ", "emailAddress": "Se7W20UZcDaiq0nE", "newPassword": "Z7PyhqFJkDClOsKm"}' \
    > test.out 2>&1
eval_tap $? 272 'ResetPasswordV3' test.out

#- 273 PublicGetUserByUserIdV3
eval_tap 0 273 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 274 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fsgJdmzsDPsWh1k0' \
    --activeOnly  \
    --after 'cQ08NG6dX2TZkil6' \
    --before '7kRngoUa83ECh1gq' \
    --limit '84' \
    > test.out 2>&1
eval_tap $? 274 'PublicGetUserBanHistoryV3' test.out

#- 275 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FbrOMZMgWkFN7Tpk' \
    > test.out 2>&1
eval_tap $? 275 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 276 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'x6GcfyOg6ZUrrp9u' \
    > test.out 2>&1
eval_tap $? 276 'PublicGetUserInformationV3' test.out

#- 277 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bg9mndW2JKmQafUs' \
    --after '0.8769303581159487' \
    --before '0.02959600627309944' \
    --limit '48' \
    > test.out 2>&1
eval_tap $? 277 'PublicGetUserLoginHistoriesV3' test.out

#- 278 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pWX3KEe2BjV00ReC' \
    --after 'XFffjJJxlgjzIhpg' \
    --before 'OoIOD74V21HWDAfv' \
    --limit '81' \
    --platformId 'wdxbyp4HAPbBbNPS' \
    > test.out 2>&1
eval_tap $? 278 'PublicGetUserPlatformAccountsV3' test.out

#- 279 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tVBUpKgOssFkz0F3' \
    > test.out 2>&1
eval_tap $? 279 'PublicListJusticePlatformAccountsV3' test.out

#- 280 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '6piDYXeHZ7FHls3n' \
    --body '{"platformId": "yvconqbHQqKLQKe3", "platformUserId": "xmj6s0GqsWncp5Lr"}' \
    > test.out 2>&1
eval_tap $? 280 'PublicLinkPlatformAccount' test.out

#- 281 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'qbiKudv9z75SzoCV' \
    --body '{"chosenNamespaces": ["8ZMi2o1nR482D6gN", "Clk9c87hosaPFC5z", "BW3ZgVZCj9ObVGT0"], "requestId": "Scwl4kNmCi15XTJT"}' \
    > test.out 2>&1
eval_tap $? 281 'PublicForceLinkPlatformWithProgression' test.out

#- 282 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gCNNH7RtG5Xmo9Q0' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetPublisherUserV3' test.out

#- 283 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wb07N17fkxZSc6Vb' \
    --password 'E0AGcekjMNHuPXtz' \
    > test.out 2>&1
eval_tap $? 283 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 284 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after '8tXxrmzafMUguyDo' \
    --before 'N91uc28HoSpGt1g0' \
    --isWildcard  \
    --limit '67' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetRolesV3' test.out

#- 285 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId '5TaW4to7QCY2NGGv' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetRoleV3' test.out

#- 286 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 286 'PublicGetMyUserV3' test.out

#- 287 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'i9kg3rMIzNmhJTNQ' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 288 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["jKlwjfJ3TJ2xVpge", "70WsLfgbZieRvJI5", "sT9DH3DfLCv8q4Th"], "oneTimeLinkCode": "mq09bBgPAYxrBE9j"}' \
    > test.out 2>&1
eval_tap $? 288 'LinkHeadlessAccountToMyAccountV3' test.out

#- 289 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "lnTgtgW33wDwD9RK"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicSendVerificationLinkV3' test.out

#- 290 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'vQX4yFQFdrRoM6Fo' \
    > test.out 2>&1
eval_tap $? 290 'PublicVerifyUserByLinkV3' test.out

#- 291 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'qCYw7AlxO6qdFpc7' \
    --code '1sSck3ggZWJlSlCQ' \
    --error 'MDji329PfVrvMEPt' \
    --state 'psSNcpK1QkB2Sy8W' \
    > test.out 2>&1
eval_tap $? 291 'PlatformAuthenticateSAMLV3Handler' test.out

#- 292 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'w79LVeVskqeUB7RS' \
    --payload 'ayqGFguhh3bvadRt' \
    > test.out 2>&1
eval_tap $? 292 'LoginSSOClient' test.out

#- 293 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'hdbVApebRA09rW8i' \
    > test.out 2>&1
eval_tap $? 293 'LogoutSSOClient' test.out

#- 294 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData '8krFWJhe03coRFok' \
    --code '5d3AyGrZO8GuoXNS' \
    > test.out 2>&1
eval_tap $? 294 'RequestTargetTokenResponseV3' test.out

#- 295 PlatformTokenRefreshV3Deprecate
eval_tap 0 295 'PlatformTokenRefreshV3Deprecate # SKIP deprecated' test.out

#- 296 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oVEBG7VbBPUWipz9' \
    > test.out 2>&1
eval_tap $? 296 'AdminGetDevicesByUserV4' test.out

#- 297 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'C05YabFX4FCK5ucT' \
    --endDate 'FsAFzaO3yJpA3KMx' \
    --limit '57' \
    --offset '90' \
    --startDate 'lrRytER1qdTelFAa' \
    > test.out 2>&1
eval_tap $? 297 'AdminGetBannedDevicesV4' test.out

#- 298 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dM9y66Drf4SSGGt3' \
    > test.out 2>&1
eval_tap $? 298 'AdminGetUserDeviceBansV4' test.out

#- 299 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "MiBKohow3kKoaP1K", "deviceId": "4CDuH1mMIfOCDyVA", "deviceType": "HrHncR5dShqiBUI9", "enabled": false, "endDate": "9Q0vqsL9SomqWsGA", "ext": {"76yxi0QzZWfmP2sx": {}, "0KO5bEJaPnAFjsod": {}, "yJQVVBrShGbIIuqK": {}}, "reason": "8C403HgoXCR6XOMX"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminBanDeviceV4' test.out

#- 300 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'wKdfqk8T4QHK30EX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 300 'AdminGetDeviceBanV4' test.out

#- 301 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId '0FclpDl5HsuracO5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 301 'AdminUpdateDeviceBanV4' test.out

#- 302 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'njnxD1OXkxShFVQT' \
    --startDate 'RekLfjmy8zosRCRg' \
    --deviceType 'VwbrQKmb01yA7U7d' \
    > test.out 2>&1
eval_tap $? 302 'AdminGenerateReportV4' test.out

#- 303 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 303 'AdminGetDeviceTypesV4' test.out

#- 304 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'GMjupZkZQY8CNyT4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 304 'AdminGetDeviceBansV4' test.out

#- 305 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'k3DIbfT22G5NpE13' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 305 'AdminDecryptDeviceV4' test.out

#- 306 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId '0YWSgxpKWtdtdtVW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 306 'AdminUnbanDeviceV4' test.out

#- 307 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId '9anENmxb9e7vXZV3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 307 'AdminGetUsersByDeviceV4' test.out

#- 308 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 17}' \
    > test.out 2>&1
eval_tap $? 308 'AdminCreateTestUsersV4' test.out

#- 309 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["g8Jg5VByeI3ycMcY", "YBixKJXCISQdwec1", "m8BusV9tUh74KVo6"]}' \
    > test.out 2>&1
eval_tap $? 309 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 310 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Xqjz2xUKLNWSmYyV", "vyelIJ8QgaLMqi83", "6ULa7cfZl4VuY6rs"]}' \
    > test.out 2>&1
eval_tap $? 310 'AdminBulkCheckValidUserIDV4' test.out

#- 311 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zyo6CBRRnoOikIxX' \
    --body '{"avatarUrl": "KKIR6kPmswm5TCAU", "country": "1cKApdJDnE73GLmS", "dateOfBirth": "Zns5owBhoUg4LsGP", "displayName": "6KLPXkvUv2XiXaBz", "languageTag": "smaxjTZPlLitytGk", "userName": "a7Kv5TacQKF4OlRG"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminUpdateUserV4' test.out

#- 312 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dmXxETLEQrr3KCAV' \
    --body '{"code": "9alq3hK1G4kKooSN", "emailAddress": "NUZuiynZ64IwncZP"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateUserEmailAddressV4' test.out

#- 313 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'k82GF3eTC0vzZUDj' \
    > test.out 2>&1
eval_tap $? 313 'AdminDisableUserMFAV4' test.out

#- 314 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '9dzGgGVxo9OHgfHu' \
    > test.out 2>&1
eval_tap $? 314 'AdminListUserRolesV4' test.out

#- 315 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'myfuBNisecYbcOpR' \
    --body '{"assignedNamespaces": ["45VDlvSc0Mr7ImwC", "wGqOf0bNs97KvKyj", "3MqS7Dcmtfh50eOb"], "roleId": "brmgjhWK0x0ZidAJ"}' \
    > test.out 2>&1
eval_tap $? 315 'AdminUpdateUserRoleV4' test.out

#- 316 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '1CU1eD1La16Bw3Jb' \
    --body '{"assignedNamespaces": ["UnUDh5yGjjv4Mwrv", "2vancmR6Z7rb21A2", "E9pX0BWCMqPsRk5h"], "roleId": "tdM5T3fDSrSHrkoq"}' \
    > test.out 2>&1
eval_tap $? 316 'AdminAddUserRoleV4' test.out

#- 317 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'v2mM6soMaTvQq2a9' \
    --body '{"assignedNamespaces": ["YdFNtRVSO0js0hG9", "xmSnzd7zgUxAogcn", "GkXk17QPkJHRhmLK"], "roleId": "QuQVFSKiXl8G2uf6"}' \
    > test.out 2>&1
eval_tap $? 317 'AdminRemoveUserRoleV4' test.out

#- 318 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '62' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 318 'AdminGetRolesV4' test.out

#- 319 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "jXLSAS8MKMaxQ1Qy"}' \
    > test.out 2>&1
eval_tap $? 319 'AdminCreateRoleV4' test.out

#- 320 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'JCpKedhuzI7G9NCK' \
    > test.out 2>&1
eval_tap $? 320 'AdminGetRoleV4' test.out

#- 321 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'KXu1bqI2M5PmXfKn' \
    > test.out 2>&1
eval_tap $? 321 'AdminDeleteRoleV4' test.out

#- 322 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'Q7BYGjCUDMOrbmoR' \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "YDm5ge659UDEOF6g"}' \
    > test.out 2>&1
eval_tap $? 322 'AdminUpdateRoleV4' test.out

#- 323 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'p5UfmjtiVbqJnZcr' \
    --body '{"permissions": [{"action": 34, "resource": "DKEt6JhbJ0fwTDaq", "schedAction": 24, "schedCron": "b5RpMwhWPtndriXU", "schedRange": ["9loOxpmEuwDVc12r", "0DVUGgGHkapTCafF", "MdvYiCBuzUUwyI6V"]}, {"action": 40, "resource": "T5zbreMc9fBoU3RH", "schedAction": 82, "schedCron": "hsKLxjt5srPFxBgp", "schedRange": ["FtDBmTLH9kP9U53z", "6joBAhAlJGI2YYb6", "ajBjgq6eY4PBNHKP"]}, {"action": 48, "resource": "xyHYutgXucx85vHA", "schedAction": 91, "schedCron": "09FAb21jxeWXk80y", "schedRange": ["9uxgVLGgK8aVSCN6", "oCETQ8gIDRdD2wwM", "XwKVXGPhEJsc7rZp"]}]}' \
    > test.out 2>&1
eval_tap $? 323 'AdminUpdateRolePermissionsV4' test.out

#- 324 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'xaPHc9r8eToFmkHJ' \
    --body '{"permissions": [{"action": 42, "resource": "BPOKFLxIwKssw647", "schedAction": 17, "schedCron": "wDudnGRufOUGfMjT", "schedRange": ["U226l07jPlcYaqYM", "7YfBmhjI9Y28qVce", "S9UX48dKPCFUIeyY"]}, {"action": 63, "resource": "S4i0N9ytb3c8pVZ8", "schedAction": 66, "schedCron": "eeBsJEvBbAvCmlh6", "schedRange": ["Z1oz9BaixUUvmzba", "jE2gjooiDnc1NUb5", "1lEgUwQ9tkWaMOH4"]}, {"action": 59, "resource": "CAT7cBP0918JaEBQ", "schedAction": 57, "schedCron": "RVTl0tR00oQgcHdG", "schedRange": ["GK3x76U1EIcklttm", "rpgF5szl0sMY8es3", "6r1FgR70eNLHkVrE"]}]}' \
    > test.out 2>&1
eval_tap $? 324 'AdminAddRolePermissionsV4' test.out

#- 325 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'Fd8xArWJuCAIfNBS' \
    --body '["HgpFNw9K9pmAIc6V", "SfE9nbE2PMv12ZSR", "JkujxbCu1HFaj6Vx"]' \
    > test.out 2>&1
eval_tap $? 325 'AdminDeleteRolePermissionsV4' test.out

#- 326 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 's3GuA4S1dS7H7yIS' \
    --after '7b5TSDRIoMg7Dc5A' \
    --before 'PzfzXDELJFaIaEMW' \
    --limit '76' \
    > test.out 2>&1
eval_tap $? 326 'AdminListAssignedUsersV4' test.out

#- 327 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'bhJyL72WDyhBsCCb' \
    --body '{"assignedNamespaces": ["nfihnXKxGxaupnTT", "q9ihZkvFKfSHQh8I", "9xk3sFl0cbuCRM69"], "namespace": "XKkLwioRaKnWhlh8", "userId": "0BhYe2fJDS6T75Q4"}' \
    > test.out 2>&1
eval_tap $? 327 'AdminAssignUserToRoleV4' test.out

#- 328 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'ulonMFjmYqE1wJhf' \
    --body '{"namespace": "ogWg2Apm0sUy18aW", "userId": "n65Co0vdCk8so6JS"}' \
    > test.out 2>&1
eval_tap $? 328 'AdminRevokeUserFromRoleV4' test.out

#- 329 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["aZAIadKDEZywonA2", "SrEdN2tmGuX6r0gB", "VUUeKKlPKtE6gnYx"], "emailAddresses": ["mkmCWbs5qugklBUS", "6uwWrCQt86Jrg8tL", "AJWpcyNkUvqn6eXr"], "isAdmin": true, "namespace": "FNbKJ05Orya6LSSU", "roleId": "lugIAknXcSaVYcAY"}' \
    > test.out 2>&1
eval_tap $? 329 'AdminInviteUserNewV4' test.out

#- 330 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "p7qSiDvsfMUOpWv4", "country": "6sXvpOjrpRo4mYrC", "dateOfBirth": "eQUnYoID2UqO0iAX", "displayName": "A9dB4ib8HDOJ8TNi", "languageTag": "P8KgEAj3dbRTI0i6", "userName": "dO3zkbDseh4tJdoG"}' \
    > test.out 2>&1
eval_tap $? 330 'AdminUpdateMyUserV4' test.out

#- 331 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 331 'AdminDisableMyAuthenticatorV4' test.out

#- 332 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'cwMBmegqVUaWMJBj' \
    > test.out 2>&1
eval_tap $? 332 'AdminEnableMyAuthenticatorV4' test.out

#- 333 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 333 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 334 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 334 'AdminGetMyBackupCodesV4' test.out

#- 335 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 335 'AdminGenerateMyBackupCodesV4' test.out

#- 336 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 336 'AdminDisableMyBackupCodesV4' test.out

#- 337 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 337 'AdminDownloadMyBackupCodesV4' test.out

#- 338 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 338 'AdminEnableMyBackupCodesV4' test.out

#- 339 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 339 'AdminSendMyMFAEmailCodeV4' test.out

#- 340 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 340 'AdminDisableMyEmailV4' test.out

#- 341 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'rV0p9A7tcHrV0MbJ' \
    > test.out 2>&1
eval_tap $? 341 'AdminEnableMyEmailV4' test.out

#- 342 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 342 'AdminGetMyEnabledFactorsV4' test.out

#- 343 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'Gr4drgkDuWS05m0p' \
    > test.out 2>&1
eval_tap $? 343 'AdminMakeFactorMyDefaultV4' test.out

#- 344 AdminInviteUserV4
eval_tap 0 344 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 345 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "zazM2BUXnzUEWTiK", "policyId": "MJAf6AgbiEDMfCck", "policyVersionId": "WogE5gcfF8AMGZ2F"}, {"isAccepted": true, "localizedPolicyVersionId": "liYsTJUmpscwLcUm", "policyId": "l3KuoMKh7tprnacA", "policyVersionId": "34xmIOjFLgKR4LjE"}, {"isAccepted": false, "localizedPolicyVersionId": "hOScvtQ92iD02YMv", "policyId": "EUNfoL7JCcMo7Gxx", "policyVersionId": "XdbYCRexPekTsQxM"}], "authType": "EMAILPASSWD", "country": "CvNhZ6P8aqZ2yfrC", "dateOfBirth": "1V7ZpJZPHCMqvcYm", "displayName": "eDLYEzs2SQUdKr6v", "emailAddress": "gqkjycqclNlBORlC", "password": "8ZkjsxYtgxplHTPL", "passwordMD5Sum": "zynjFZgF3erw7Usy", "username": "Hq4bBb0n1JhPUS8B", "verified": true}' \
    > test.out 2>&1
eval_tap $? 345 'PublicCreateTestUserV4' test.out

#- 346 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "V9n769zLJdKMexeJ", "policyId": "c7NvgTSgKjCxZjKf", "policyVersionId": "8NA4cGUaDfy9XnH2"}, {"isAccepted": true, "localizedPolicyVersionId": "fd1GS5YkyhAiAItn", "policyId": "WUmD225fp1egsx3E", "policyVersionId": "rheNwqd5priclNNq"}, {"isAccepted": true, "localizedPolicyVersionId": "KsOpyq8agQuz86nc", "policyId": "6jLF9DIW2ncJJKpq", "policyVersionId": "mgvUTr8XAtpOqUQx"}], "authType": "EMAILPASSWD", "code": "46W2B2uPQLrt2t6b", "country": "VpCgKvPXSDufmKh7", "dateOfBirth": "83cV54JsVBRB0rY0", "displayName": "xfWddACyHSmo4KX9", "emailAddress": "TPO3K1k5ZM8btmGs", "password": "gXNXbpqxh76Af5JS", "passwordMD5Sum": "wjw2fE2g6jXV7oai", "reachMinimumAge": true, "username": "oDm9FaP0HJ98tE4U"}' \
    > test.out 2>&1
eval_tap $? 346 'PublicCreateUserV4' test.out

#- 347 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'yoQg0b0sGOkzxVt1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "utADrNGBWSJ1zQKx", "policyId": "VmRTawjiZPMoZZcy", "policyVersionId": "GEHxAKDQher3usAp"}, {"isAccepted": false, "localizedPolicyVersionId": "dJPn9eIdhIBvTTup", "policyId": "ABJ4RwH3EdKmYtbq", "policyVersionId": "QHNfIZwrMxf3EnzZ"}, {"isAccepted": false, "localizedPolicyVersionId": "nC0cfPl3Z2zSBbs4", "policyId": "PAV72u8AxE2IQeox", "policyVersionId": "YV4UcYzswAGpXqQx"}], "authType": "EMAILPASSWD", "country": "eCdiXu3iNvn7vLZ7", "dateOfBirth": "h6alhJNGZF07lsPP", "displayName": "5OfHbXzWnVO2U4uy", "password": "zZo1rj0ZrLQjk4Vo", "reachMinimumAge": true, "username": "fIksth24cZBpdDFf"}' \
    > test.out 2>&1
eval_tap $? 347 'CreateUserFromInvitationV4' test.out

#- 348 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "vzeU5iqhx6zv7EUR", "country": "TNIoG1DBdoKH6sRE", "dateOfBirth": "mmfwUZLZZS7snx0Q", "displayName": "2Gd8m7Y3wiNloJfe", "languageTag": "y3HXL6SjljNPTXA3", "userName": "qbg55SyienCODZ0m"}' \
    > test.out 2>&1
eval_tap $? 348 'PublicUpdateUserV4' test.out

#- 349 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "nOpPTVxEgBFzG8tl", "emailAddress": "kxWKCU1XN4gl7yHv"}' \
    > test.out 2>&1
eval_tap $? 349 'PublicUpdateUserEmailAddressV4' test.out

#- 350 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "EqpJSrDXVwCkhOQ1", "country": "61TFjROYJm75VIuC", "dateOfBirth": "OCkt2W1DfI8QtgOD", "displayName": "k9K6DcMnyCPn1Fyl", "emailAddress": "WdaNV1VaZTkbbuWi", "password": "iA4UTDgS2SVEo5M8", "reachMinimumAge": true, "username": "bku9GYH4ijqOVM50", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 350 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 351 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "cDPbklTHcmgXsrVj", "password": "3Mjml6BpCODWGOLM", "username": "mCZUeelXYyNrXwei"}' \
    > test.out 2>&1
eval_tap $? 351 'PublicUpgradeHeadlessAccountV4' test.out

#- 352 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 352 'PublicDisableMyAuthenticatorV4' test.out

#- 353 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'CnDldRPRfd6mLZ0G' \
    > test.out 2>&1
eval_tap $? 353 'PublicEnableMyAuthenticatorV4' test.out

#- 354 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 354 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 355 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 355 'PublicGetMyBackupCodesV4' test.out

#- 356 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 356 'PublicGenerateMyBackupCodesV4' test.out

#- 357 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 357 'PublicDisableMyBackupCodesV4' test.out

#- 358 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 358 'PublicDownloadMyBackupCodesV4' test.out

#- 359 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 359 'PublicEnableMyBackupCodesV4' test.out

#- 360 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'TJwEjoZrRtaeWKMC' \
    > test.out 2>&1
eval_tap $? 360 'PublicRemoveTrustedDeviceV4' test.out

#- 361 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 361 'PublicSendMyMFAEmailCodeV4' test.out

#- 362 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 362 'PublicDisableMyEmailV4' test.out

#- 363 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code '8wsOByQAMAgqFEzE' \
    > test.out 2>&1
eval_tap $? 363 'PublicEnableMyEmailV4' test.out

#- 364 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 364 'PublicGetMyEnabledFactorsV4' test.out

#- 365 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 't8umj5XhKnw7MHDw' \
    > test.out 2>&1
eval_tap $? 365 'PublicMakeFactorMyDefaultV4' test.out

#- 366 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FVKUC2ecnpUDqvLQ' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 367 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "ixPKVSmWa8TGko16", "emailAddress": "XTqHc0cM7ixq8Tjn", "namespace": "xp5Cl8ggaEmCcuK2", "namespaceDisplayName": "hHviBEWpbusO6EyV"}' \
    > test.out 2>&1
eval_tap $? 367 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE