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
echo "1..363"

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
    --limit '84' \
    --offset '45' \
    --platformBy 'Ua6xVVBcq3wZpFIY' \
    --platformId 'eAg79HcLJXJ7mpVI' \
    --query '6eTYAjdPlCiQQC35' \
    --startDate 'cj4KyOVgvnWbfRJt' \
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

#- 181 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rBZo0lNUBDShHD32' \
    --userId 'vvL28FPwTiXfLcxD' \
    --platformToken 'C9Ynd02mECIQhfIh' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 182 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HtADUQ9zimQTQT95' \
    --userId 'pFJUAJsyAfeKOufV' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserSinglePlatformAccount' test.out

#- 183 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4f15NohXu6opxQGR' \
    --body '["t6PqlkL0diRhLC10", "ih2EQfY3XCv4hdOa", "6FdZhNMd1onFjGRb"]' \
    > test.out 2>&1
eval_tap $? 183 'AdminDeleteUserRolesV3' test.out

#- 184 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xtABPXDmgNEJBhgG' \
    --body '[{"namespace": "q5GIDhNC66szbCCf", "roleId": "73IFbRkPSSITz4Tj"}, {"namespace": "CrJHXGXku2YVuOzh", "roleId": "xHmnrrV9ZGWrZ05s"}, {"namespace": "xe6A6RpmKDebNkyl", "roleId": "bynkgT9vayLLiiza"}]' \
    > test.out 2>&1
eval_tap $? 184 'AdminSaveUserRoleV3' test.out

#- 185 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'c7Ge6zKJdlt7rjF5' \
    --userId 'RaJwvkWVco2LTo5i' \
    > test.out 2>&1
eval_tap $? 185 'AdminAddUserRoleV3' test.out

#- 186 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'jlvDF8qBWCQ9dLWY' \
    --userId 'yS8zdhMeBXH8x6Hd' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteUserRoleV3' test.out

#- 187 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VfZVDAiU6iJOF7JK' \
    --body '{"enabled": false, "reason": "ryY91lX8DD4MYXlr"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateUserStatusV3' test.out

#- 188 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'J81lHvv9rqvEoM8Y' \
    --body '{"emailAddress": "mVjAkO3HKsEp6Klq", "password": "wW4djrexcbHdEtoQ"}' \
    > test.out 2>&1
eval_tap $? 188 'AdminTrustlyUpdateUserIdentity' test.out

#- 189 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vpV344RctmTozCi8' \
    > test.out 2>&1
eval_tap $? 189 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 190 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'HeV6jbalHmqBBfi7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "sSF5BoGiTCVsXsyg"}' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpdateClientSecretV3' test.out

#- 191 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'WbjE2opXtdsJQeJ1' \
    --before 'too0qvxphTLEEBGT' \
    --isWildcard  \
    --limit '40' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetRolesV3' test.out

#- 192 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "managers": [{"displayName": "TjdKNKgYazujsmSm", "namespace": "ylT1YtxIq73aMb48", "userId": "jISd97KORRhxSWLW"}, {"displayName": "LNfHRD3V15QaGGL4", "namespace": "6LuxJF3sbeqWBdQu", "userId": "WfgBAKx27MSBqabU"}, {"displayName": "XOGkkoMUZn1YXj5z", "namespace": "FZeOCOR9NvBQZSJP", "userId": "OIKrRBrYVzi9ui3l"}], "members": [{"displayName": "vozTt9TsH7A0TuU2", "namespace": "aL4bPkk11sys6Gdk", "userId": "Dcos5uVJ0BJfZ0jv"}, {"displayName": "A54CSqZFDsO1skRj", "namespace": "OU1SMfQVQa6blj9R", "userId": "dd85bdYUumPKVSZC"}, {"displayName": "g3XTc9vQe0dHJfF6", "namespace": "KIuvnRCa9JktyBdx", "userId": "kZKrEWFw9GYxjiiO"}], "permissions": [{"action": 88, "resource": "d9QWVMYz7TU1Tsxs", "schedAction": 59, "schedCron": "Pi57HyKKz5nyI6ul", "schedRange": ["KNKoXa0dgx1JgjC5", "6pda3YhtQxpCYME6", "x21pdX2QSPAd9sxo"]}, {"action": 77, "resource": "V6tCdrxw1KOPhuvH", "schedAction": 41, "schedCron": "KbNN7Ycl2JfmQplv", "schedRange": ["GjVQ4aebjfgGu472", "oWJlfglLM4xjfkNL", "4lU6jaGfsD1cfswm"]}, {"action": 9, "resource": "SiXjcY5ZPkv90lyK", "schedAction": 91, "schedCron": "W11vtpaTxi7k489j", "schedRange": ["RCn48bvkCPfKofwX", "OIZZQAJza84lKKmV", "OaTS6xBbNrSUAW2a"]}], "roleName": "k7ISDrBVg6NuDZvP"}' \
    > test.out 2>&1
eval_tap $? 192 'AdminCreateRoleV3' test.out

#- 193 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'b1kuUfNfUDe4g7q6' \
    > test.out 2>&1
eval_tap $? 193 'AdminGetRoleV3' test.out

#- 194 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'PHEaqbzHvDDl1jiL' \
    > test.out 2>&1
eval_tap $? 194 'AdminDeleteRoleV3' test.out

#- 195 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'w3XMGBA6JXDpA1tI' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "5C0oaGouFu4hXONg"}' \
    > test.out 2>&1
eval_tap $? 195 'AdminUpdateRoleV3' test.out

#- 196 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'UwJnUpryDeRcpUvl' \
    > test.out 2>&1
eval_tap $? 196 'AdminGetRoleAdminStatusV3' test.out

#- 197 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'rw2MwC1uuokpaIjL' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateAdminRoleStatusV3' test.out

#- 198 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '0Vxe5n9Lx3QcFo9g' \
    > test.out 2>&1
eval_tap $? 198 'AdminRemoveRoleAdminV3' test.out

#- 199 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'xOgvDc7xMrRKvw8I' \
    --after 'SP2WKmCRRXBxlalC' \
    --before 'HtWlKxLpS8fLWoQ5' \
    --limit '28' \
    > test.out 2>&1
eval_tap $? 199 'AdminGetRoleManagersV3' test.out

#- 200 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'cGiq9j2EyIknfLDp' \
    --body '{"managers": [{"displayName": "gHnMOn8nc3gUZ8ZF", "namespace": "yyEr0KBXuJBqK4Qt", "userId": "EydPWLPBYiR3UbJc"}, {"displayName": "1ZYapx7C477etqgf", "namespace": "OJDUT0uKAPrARya2", "userId": "IMlNiXpF4qvsUUpH"}, {"displayName": "qi33TcBGkc0HjUcn", "namespace": "kpU9oVzl2kBuLFXI", "userId": "eCEKZUTz3GvCAZ5j"}]}' \
    > test.out 2>&1
eval_tap $? 200 'AdminAddRoleManagersV3' test.out

#- 201 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId '24acYHbrryHB6GO9' \
    --body '{"managers": [{"displayName": "zP3FaepA3b3YJ9nJ", "namespace": "M6vtT27xv85K5MU2", "userId": "qmbeqaVemINdClpF"}, {"displayName": "7OvlBIEgjse5kd6G", "namespace": "EDo08yq5E5HleLoo", "userId": "g4me2NBFp62xlXvV"}, {"displayName": "cJerTPW02PWsHiKY", "namespace": "ArAxnKBfBfDlrQQu", "userId": "Ac10DjjwMv4vrIPR"}]}' \
    > test.out 2>&1
eval_tap $? 201 'AdminRemoveRoleManagersV3' test.out

#- 202 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'tvhQIyLarjaLOKnX' \
    --after '51yAB8Pa3uNGKhaL' \
    --before 'lJzJMSnJIIgsAVma' \
    --limit '67' \
    > test.out 2>&1
eval_tap $? 202 'AdminGetRoleMembersV3' test.out

#- 203 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'BMbsF44VTsLDRzdq' \
    --body '{"members": [{"displayName": "22cbnyK3ggFDh2ka", "namespace": "ZP7pnnVfxPwc259H", "userId": "F9ejHaILQruAuYyJ"}, {"displayName": "LYGqMv824ouSgkpK", "namespace": "70uJmUL0uzElixc0", "userId": "23dIvDiA0tQWlHwB"}, {"displayName": "cTtztx3VAl6tXFbn", "namespace": "ATCzUOIzVcy9k3ie", "userId": "64Vnwa0ClGQJultJ"}]}' \
    > test.out 2>&1
eval_tap $? 203 'AdminAddRoleMembersV3' test.out

#- 204 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'e32AiwKadEoIVmpr' \
    --body '{"members": [{"displayName": "wPsa9YD92CX0rITa", "namespace": "jpwHITGeHTnqRbzB", "userId": "B9ZFgJbQ3Fj1umx4"}, {"displayName": "ItzkMJ7cudf4r916", "namespace": "GPrhn2etVIQvRkQJ", "userId": "AtDUH9tx60AehGz1"}, {"displayName": "ermJYXsYgL7TfyIl", "namespace": "AwjTZdRZJJzWZwvT", "userId": "X2bamSCvX1nwvSWd"}]}' \
    > test.out 2>&1
eval_tap $? 204 'AdminRemoveRoleMembersV3' test.out

#- 205 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'DwD7WJHzgNZUKsI5' \
    --body '{"permissions": [{"action": 50, "resource": "uKBwBcD12ae6r3hH", "schedAction": 46, "schedCron": "JctAdxyZVKHA9Dka", "schedRange": ["SOWgtg8yw8lHEbVD", "wBAqanOlscRIWw82", "k5K5VTkdubkOFldM"]}, {"action": 58, "resource": "QlnNRZJHBSB4fZWE", "schedAction": 64, "schedCron": "kVu4S95mj8YRvae4", "schedRange": ["f4lhBPbarbWEm8bV", "tZcfVCPdQhim9QKU", "AFTVYelIlGJg9wdc"]}, {"action": 79, "resource": "bihhWjfZpfcFBUsn", "schedAction": 27, "schedCron": "gl7H1sdH2RIJz1eI", "schedRange": ["7Q5pu9PutLf6IrvZ", "oBGQbO4S3rURGWUz", "PAE6SdV4D5jftRl9"]}]}' \
    > test.out 2>&1
eval_tap $? 205 'AdminUpdateRolePermissionsV3' test.out

#- 206 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'rZmtQUvro8TWwXWs' \
    --body '{"permissions": [{"action": 53, "resource": "P1G9tyBTfERXdvgD", "schedAction": 95, "schedCron": "Qf7Ot2DkUt3yexZB", "schedRange": ["RvxYnEBhXtAVxCd3", "meTrT7cF9oVCh89w", "NOkKYssVejcL3kR3"]}, {"action": 16, "resource": "zru1DhGAYOHR5BWa", "schedAction": 76, "schedCron": "VzIkaQEl1iUProNB", "schedRange": ["6hI6IpGcToWgFvdR", "hG9NwV3zDuqVlVTy", "pcYPK8IxrSZuxWl0"]}, {"action": 72, "resource": "0bitNQLzwRoWnR0A", "schedAction": 3, "schedCron": "wnPS2urJqerobWMZ", "schedRange": ["GVL5KLTxahWlS6Xd", "BaKSLCgOOPXM6XTU", "h2dJ90yqHDNacl4F"]}]}' \
    > test.out 2>&1
eval_tap $? 206 'AdminAddRolePermissionsV3' test.out

#- 207 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId '9G6Dl5TFwBY6HKXA' \
    --body '["blkT8VGgSH8MGZGw", "iVj7eDTaka9ABfX1", "IByPEOuPhGspRi3b"]' \
    > test.out 2>&1
eval_tap $? 207 'AdminDeleteRolePermissionsV3' test.out

#- 208 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '14' \
    --resource 'o5uB2XM6IHy7EEvH' \
    --roleId 'yLmcvrZZOdwe1x8R' \
    > test.out 2>&1
eval_tap $? 208 'AdminDeleteRolePermissionV3' test.out

#- 209 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 209 'AdminGetMyUserV3' test.out

#- 210 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'jU6Bi8JXE52sUBBq' \
    --extendExp  \
    --redirectUri '2SimQQoLbe5YOJvx' \
    --password 'GRxUzrTwagH7BMT1' \
    --requestId 'IZKTdNFVBQ1crBXA' \
    --userName 'upATO8uXsqVpdiWo' \
    > test.out 2>&1
eval_tap $? 210 'UserAuthenticationV3' test.out

#- 211 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '8SjDAM0Riw8wLYW3' \
    --linkingToken 'n4F3LD1EDwBXw5uB' \
    --password 'YeQZOzATNSV9E9yy' \
    --username 'Nb7yaLXzAVYymOuh' \
    > test.out 2>&1
eval_tap $? 211 'AuthenticationWithPlatformLinkV3' test.out

#- 212 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'CkZu4htrsf8eIFSo' \
    --extendExp  \
    --linkingToken 'vTGXaMsq8ePN1oco' \
    > test.out 2>&1
eval_tap $? 212 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 213 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId '2jx8Upe8SjMvpqM8' \
    > test.out 2>&1
eval_tap $? 213 'RequestOneTimeLinkingCodeV3' test.out

#- 214 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'puggOEdG47gD5i2N' \
    > test.out 2>&1
eval_tap $? 214 'ValidateOneTimeLinkingCodeV3' test.out

#- 215 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'i6AnWn3NdEPhNHSH' \
    --isTransient  \
    --clientId '7eKDfRcngEpTnRUQ' \
    --oneTimeLinkCode 'r3RLOM1vEx4gqDY6' \
    > test.out 2>&1
eval_tap $? 215 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 216 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 216 'GetCountryLocationV3' test.out

#- 217 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 217 'Logout' test.out

#- 218 RequestGameTokenCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenCodeResponseV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'jwyKRxhkLe5zohg9' \
    > test.out 2>&1
eval_tap $? 218 'RequestGameTokenCodeResponseV3' test.out

#- 219 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 's9utRQt28b6o3K0C' \
    --userId 'OF74tz6aeXZOYwbw' \
    > test.out 2>&1
eval_tap $? 219 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 220 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jMNdxKWlBfnRyFS0' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 220 'RevokeUserV3' test.out

#- 221 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'Ed7gTM5AVrtBQiDT' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'N7HDPTUEDPN1Kb4U' \
    --redirectUri 'TPWDXTSb55g8LSTs' \
    --scope '7Nf95lGlPrf6obId' \
    --state 'nI6Ag7eUYcYJ4QzX' \
    --targetAuthPage 'Cmqr6gmPGaHP5SVP' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'vRLiDi0mNHb6Lx8e' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 221 'AuthorizeV3' test.out

#- 222 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'XBuT30EYeRj17xGh' \
    > test.out 2>&1
eval_tap $? 222 'TokenIntrospectionV3' test.out

#- 223 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 223 'GetJWKSV3' test.out

#- 224 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'aBKoUfiHjGmCyPsK' \
    --factor 'CJTv1ic9gvagF2cS' \
    --mfaToken 'uztsJ5tj64gV7nmD' \
    > test.out 2>&1
eval_tap $? 224 'SendMFAAuthenticationCode' test.out

#- 225 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'k29mcjSuz9vbNStq' \
    --mfaToken 'PtQmQN6eKAGiZFCf' \
    > test.out 2>&1
eval_tap $? 225 'Change2faMethod' test.out

#- 226 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'tT0RWECdjWYrnulx' \
    --factor 'cCKAru8pOaAVLDB4' \
    --mfaToken 'k3JwkdaxR7GJpYmu' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 226 'Verify2faCode' test.out

#- 227 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YCPG181q9GA5DydC' \
    --userId '2D8UT6KOc4VPDUR9' \
    > test.out 2>&1
eval_tap $? 227 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 228 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'ayazqXRqegIUicYX' \
    --clientId 'XzxsBFrUs9BYp6Tg' \
    --redirectUri 'CejBd5o7iTST7R3K' \
    --requestId 'bbQGERMNpqWb51y5' \
    > test.out 2>&1
eval_tap $? 228 'AuthCodeRequestV3' test.out

#- 229 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'RUzvMfTkPy0fGvTG' \
    --additionalData 'gfLKsg0b1Bq78cE5' \
    --clientId 'O5pmPnbiPJ9j4vxm' \
    --createHeadless  \
    --deviceId 'bH3rVaauufxkPHEl' \
    --macAddress 'ug48TgfNu0rqXUOy' \
    --platformToken 'ToLPIREGIKlJt3EP' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 229 'PlatformTokenGrantV3' test.out

#- 230 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 230 'GetRevocationListV3' test.out

#- 231 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token '9kKwkENQ8VOHGwbA' \
    > test.out 2>&1
eval_tap $? 231 'TokenRevocationV3' test.out

#- 232 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'DMfuOmh0lciRhVZ2' \
    --clientId 'DeoODXMzLSrzoiBn' \
    --code 'Yi5UWs3tYlYeMoCi' \
    --codeVerifier 'mJySocRvUWDOrFZK' \
    --extendExp  \
    --password 'PNoN9AWtLK9TFgi9' \
    --redirectUri 'j2XMh9WpifqjNjLO' \
    --refreshToken 'tNQts2yxf6MLZJ2j' \
    --username 'ZfZbpTJezzriCDWX' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 232 'TokenGrantV3' test.out

#- 233 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token '59SRu0YqUxKDc84O' \
    > test.out 2>&1
eval_tap $? 233 'VerifyTokenV3' test.out

#- 234 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'MIzvTScdbKBsAyJM' \
    --code 'z4ILNDvhB4Eoes9a' \
    --error '6XaJeRbzTPwD3jxF' \
    --openidAssocHandle '7vxRUY0ilrNoFT98' \
    --openidClaimedId 'SgtJd4Z5f8nfaKqd' \
    --openidIdentity 'ZFLbZEHxsDxeR6d7' \
    --openidMode 'r1SQw80JfMpPrSqY' \
    --openidNs 'ypRUnq5o4ETeCUYG' \
    --openidOpEndpoint '9ccTt7Wxw8OQ13t3' \
    --openidResponseNonce 'uTw6zQuoZcXQpoTO' \
    --openidReturnTo 'xe8y1jorNsg9ZKYC' \
    --openidSig 'KoISyXtHzoWGdYoh' \
    --openidSigned 'xMp3uOQIybqWfG9B' \
    --state 'J6FVKlbYHtbPtaxv' \
    > test.out 2>&1
eval_tap $? 234 'PlatformAuthenticationV3' test.out

#- 235 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'agSlpGgVTF6VeDAP' \
    --platformToken 'OGBwweyFfXEOEAEt' \
    > test.out 2>&1
eval_tap $? 235 'PlatformTokenRefreshV3' test.out

#- 236 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'bag82KgBgyCd5vjk' \
    > test.out 2>&1
eval_tap $? 236 'PublicGetInputValidations' test.out

#- 237 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'fz3eR4DtNp129hzB' \
    > test.out 2>&1
eval_tap $? 237 'PublicGetInputValidationByField' test.out

#- 238 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'w3xLUcCEt0DzmkJq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 238 'PublicGetCountryAgeRestrictionV3' test.out

#- 239 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 239 'PublicGetCountryListV3' test.out

#- 240 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 240 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 241 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId '1sml5bYt76BNsi4g' \
    > test.out 2>&1
eval_tap $? 241 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 242 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'iR9434WpKKdzxouf' \
    --rawPID  \
    --body '{"platformUserIds": ["CNlFoOcWQQy4bjmQ", "eEweoBHTdwAk7ZQn", "bqY1cQwVEtAr5kKK"]}' \
    > test.out 2>&1
eval_tap $? 242 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 243 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ao9MM2Cqm84jVi9k' \
    --platformUserId 'IpqgrzpUkNOBWydX' \
    > test.out 2>&1
eval_tap $? 243 'PublicGetUserByPlatformUserIDV3' test.out

#- 244 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'V0Fi02aFr8CDapjw' \
    > test.out 2>&1
eval_tap $? 244 'PublicGetAsyncStatus' test.out

#- 245 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'NOl4k8rVNrm8drv8' \
    --limit '87' \
    --offset '74' \
    --query 'D2JOe2Ntz7EFvowP' \
    > test.out 2>&1
eval_tap $? 245 'PublicSearchUserV3' test.out

#- 246 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "gIGuetxFMqXCQMAq", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "2ZRGzNtrThFa9XU8", "policyId": "mosluiHZJ7O8sAQ3", "policyVersionId": "2wj9uaDzsr9xYiWR"}, {"isAccepted": true, "localizedPolicyVersionId": "GAqXUjNypF6MMqWp", "policyId": "dEJsPoaIbYz8cK5j", "policyVersionId": "lpJdre5ur6yvWJDd"}, {"isAccepted": true, "localizedPolicyVersionId": "PeIB4Ehy0Y5aSJVD", "policyId": "ginxAM77eY9C14Fb", "policyVersionId": "fiI2NPvl1kCY5bEo"}], "authType": "kxXxkWZbjf7GZxao", "code": "ssQmjo69wohJFyTN", "country": "k5FGUPhR4LEZvz3E", "dateOfBirth": "jFR7996Ug5m4axDV", "displayName": "5uTcYsoahUrELQ1b", "emailAddress": "tjJOqQMgZWAU6E92", "password": "nHJzvw7tnYtGfv0E", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 246 'PublicCreateUserV3' test.out

#- 247 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'yjBu4EzwRjD7jmQJ' \
    --query 'eFPghqamSc5y0X48' \
    > test.out 2>&1
eval_tap $? 247 'CheckUserAvailability' test.out

#- 248 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["eT7Mluexk87b9Z5B", "TsEA3EdmW8saabP4", "xRowfNojzPXI2v0p"]}' \
    > test.out 2>&1
eval_tap $? 248 'PublicBulkGetUsers' test.out

#- 249 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "rR3OEey0MkZwS6TY", "languageTag": "wNN3UYhic03qGEg5"}' \
    > test.out 2>&1
eval_tap $? 249 'PublicSendRegistrationCode' test.out

#- 250 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "fNzBVrjo3g8CfRwt", "emailAddress": "yl1HeT7VEPgG40Qy"}' \
    > test.out 2>&1
eval_tap $? 250 'PublicVerifyRegistrationCode' test.out

#- 251 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "XzsOzgck078IghoQ", "languageTag": "Bp2mWAOYksczxBS0"}' \
    > test.out 2>&1
eval_tap $? 251 'PublicForgotPasswordV3' test.out

#- 252 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'OBCa2vWadLmQtYKm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 252 'GetAdminInvitationV3' test.out

#- 253 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'EMzicbuL2S3RiW8d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "CBfGUdVEdvdQL7sV", "policyId": "wcZ2PofaJoSqtrEO", "policyVersionId": "qxH46fRTSZoDdT0f"}, {"isAccepted": false, "localizedPolicyVersionId": "t9P1Tkm08luh4dpP", "policyId": "RMDbUXBWTbpAogG2", "policyVersionId": "wlZkLhuU5FI8NijF"}, {"isAccepted": false, "localizedPolicyVersionId": "0GKwJ3vfXlsAMy2Z", "policyId": "p2UAGxHnmSxvkG9U", "policyVersionId": "R5q9neoW6JBcGp9R"}], "authType": "EMAILPASSWD", "country": "S3QaVjZF7Ax6115K", "dateOfBirth": "g9U8vrQJXQxoIbVi", "displayName": "2CLEk277Ivjj1A64", "password": "7XQ3koaAfZIim0sF", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 253 'CreateUserFromInvitationV3' test.out

#- 254 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "m1YN27bojDVaZLpx", "country": "4kEWYkO6KrKUMhJr", "dateOfBirth": "ASBh61hmWKSSrF35", "displayName": "anDGvur19V18oIrU", "languageTag": "KXttgAI2QdWJFLmo", "userName": "PEgd8EMspOs8nkic"}' \
    > test.out 2>&1
eval_tap $? 254 'UpdateUserV3' test.out

#- 255 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "9gj5vyUMAAmIHYbs", "country": "xG5N066FXb88SbLO", "dateOfBirth": "a21DiSFsm0XXQJWs", "displayName": "zvTQEuALzDNp1SZ5", "languageTag": "8aDllwzTRHak1MXx", "userName": "j7Esrg7900nml5Bi"}' \
    > test.out 2>&1
eval_tap $? 255 'PublicPartialUpdateUserV3' test.out

#- 256 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "dsK9dCEzhVnOv0PQ", "emailAddress": "bVIaKiHfoeorY7A1", "languageTag": "otGFyv2SMjbEr50q"}' \
    > test.out 2>&1
eval_tap $? 256 'PublicSendVerificationCodeV3' test.out

#- 257 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "GdCZIc6EFqBKxbS7", "contactType": "Q2OgRucL1jwRXzfj", "languageTag": "DZZBmOau6syme06c", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 257 'PublicUserVerificationV3' test.out

#- 258 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Lc2mEC3IXl5XCbkO", "country": "fHaGr5kdazlypvt6", "dateOfBirth": "lSLfU7HByGXPMqxj", "displayName": "4hBgVY3YAxZLKbcO", "emailAddress": "dyjqf6Q4oiwoJcaR", "password": "MEb15LBlTVufc5Zy", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 258 'PublicUpgradeHeadlessAccountV3' test.out

#- 259 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "DR2NVyn4PRqf3eRb", "password": "ZqBAoKGcVCdMiSNV"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicVerifyHeadlessAccountV3' test.out

#- 260 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "4qBrt1kcLmRv6EJt", "newPassword": "l5xWnsb8oWq94RIm", "oldPassword": "NWVIJnhhwFDV1Vit"}' \
    > test.out 2>&1
eval_tap $? 260 'PublicUpdatePasswordV3' test.out

#- 261 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'aomvWTzdsW4N70wY' \
    > test.out 2>&1
eval_tap $? 261 'PublicCreateJusticeUser' test.out

#- 262 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'S4Kj7Yi2VvoQNW8Y' \
    --redirectUri 'c481dYdvGxJAMDRA' \
    --ticket '1LF7jdWlekFwO94V' \
    > test.out 2>&1
eval_tap $? 262 'PublicPlatformLinkV3' test.out

#- 263 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BCV9qJhWva2FPBuj' \
    --body '{"platformNamespace": "X0geYCpGJM4sqsPN"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicPlatformUnlinkV3' test.out

#- 264 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JMiZXXOFwmGWAvNF' \
    > test.out 2>&1
eval_tap $? 264 'PublicPlatformUnlinkAllV3' test.out

#- 265 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0Z0GkwxUNYyNwGiK' \
    --ticket 'rknH0Y5mrQgLC6D2' \
    > test.out 2>&1
eval_tap $? 265 'PublicForcePlatformLinkV3' test.out

#- 266 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qsFiQHglUQMZi5Wj' \
    --clientId 'MZfOadpgegCUjTdi' \
    --redirectUri '1Ehr8OtqpNJ9R8Tu' \
    > test.out 2>&1
eval_tap $? 266 'PublicWebLinkPlatform' test.out

#- 267 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ny4ejmVA3vMCsGyP' \
    --code 'd12B8QNUz0hFFNbH' \
    --state '6j2W4roZM2UKAXEE' \
    > test.out 2>&1
eval_tap $? 267 'PublicWebLinkPlatformEstablish' test.out

#- 268 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sL5D0oiFchQnVeq3' \
    --code 'g2AB2WIRUQmauIY5' \
    --state 'HXCZ0W4XmWP0HzSd' \
    > test.out 2>&1
eval_tap $? 268 'PublicProcessWebLinkPlatformV3' test.out

#- 269 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "iylLhVYszm8xY33O", "emailAddress": "Qbumu2QHLyZNuysy", "newPassword": "M4OfCzdQCXMAWnf8"}' \
    > test.out 2>&1
eval_tap $? 269 'ResetPasswordV3' test.out

#- 270 PublicGetUserByUserIdV3
eval_tap 0 270 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 271 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7YPNOe9Eevf1fhMg' \
    --activeOnly  \
    --after '1E2k7QLFrVgtX7y0' \
    --before 'fPOieDCow2zXyFFV' \
    --limit '31' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetUserBanHistoryV3' test.out

#- 272 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OkL78XeEAtALFI3v' \
    > test.out 2>&1
eval_tap $? 272 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 273 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8yha4pd5A7MYcpBD' \
    > test.out 2>&1
eval_tap $? 273 'PublicGetUserInformationV3' test.out

#- 274 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6lKNb8RxvN2u5J7b' \
    --after '0.0012193788955057183' \
    --before '0.6589459039348373' \
    --limit '9' \
    > test.out 2>&1
eval_tap $? 274 'PublicGetUserLoginHistoriesV3' test.out

#- 275 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'S2B37wwoPYOHiIsx' \
    --after 'msLBPBJuNLnWRrtW' \
    --before '870qD88ZcduZSe7W' \
    --limit '26' \
    --platformId '0UZcDaiq0nEZ7Pyh' \
    > test.out 2>&1
eval_tap $? 275 'PublicGetUserPlatformAccountsV3' test.out

#- 276 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qFJkDClOsKmfsgJd' \
    > test.out 2>&1
eval_tap $? 276 'PublicListJusticePlatformAccountsV3' test.out

#- 277 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'mzsDPsWh1k0cQ08N' \
    --body '{"platformId": "G6dX2TZkil67kRng", "platformUserId": "oUa83ECh1gqPeS19"}' \
    > test.out 2>&1
eval_tap $? 277 'PublicLinkPlatformAccount' test.out

#- 278 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '3TNNzot3sVli3GN2' \
    --body '{"chosenNamespaces": ["XTrFibRAhzzEWzWl", "TY70qdgJRvpZrSpW", "X3KEe2BjV00ReCXF"], "requestId": "ffjJJxlgjzIhpgOo"}' \
    > test.out 2>&1
eval_tap $? 278 'PublicForceLinkPlatformWithProgression' test.out

#- 279 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IOD74V21HWDAfvXw' \
    > test.out 2>&1
eval_tap $? 279 'PublicGetPublisherUserV3' test.out

#- 280 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dxbyp4HAPbBbNPSt' \
    --password 'VBUpKgOssFkz0F36' \
    > test.out 2>&1
eval_tap $? 280 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 281 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'piDYXeHZ7FHls3ny' \
    --before 'vconqbHQqKLQKe3x' \
    --isWildcard  \
    --limit '25' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetRolesV3' test.out

#- 282 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'huTmnq3FGQn3Ahu5' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetRoleV3' test.out

#- 283 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 283 'PublicGetMyUserV3' test.out

#- 284 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'wxq6oJq4mChmQHQh' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 285 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["O9IKBXDFQfXFD58s", "G6uDhFYlrzJBYSeM", "uJfQecutjS029BiJ"], "oneTimeLinkCode": "WOG1m7MKclr5igjN"}' \
    > test.out 2>&1
eval_tap $? 285 'LinkHeadlessAccountToMyAccountV3' test.out

#- 286 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "TVItrH2X78hxJgaV"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendVerificationLinkV3' test.out

#- 287 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'fw5Vnyq8OzTE89WD' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyUserByLinkV3' test.out

#- 288 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'NoMcOmbfJrCJQIj1' \
    --code 'haAosKglqaCXE9yt' \
    --error 'pIO8btO3OwNEGSW5' \
    --state 'TaW4to7QCY2NGGvi' \
    > test.out 2>&1
eval_tap $? 288 'PlatformAuthenticateSAMLV3Handler' test.out

#- 289 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId '9kg3rMIzNmhJTNQj' \
    --payload 'KlwjfJ3TJ2xVpge7' \
    > test.out 2>&1
eval_tap $? 289 'LoginSSOClient' test.out

#- 290 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId '0WsLfgbZieRvJI5s' \
    > test.out 2>&1
eval_tap $? 290 'LogoutSSOClient' test.out

#- 291 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --additionalData 'T9DH3DfLCv8q4Thm' \
    --code 'q09bBgPAYxrBE9jl' \
    > test.out 2>&1
eval_tap $? 291 'RequestGameTokenResponseV3' test.out

#- 292 PlatformTokenRefreshV3Deprecate
eval_tap 0 292 'PlatformTokenRefreshV3Deprecate # SKIP deprecated' test.out

#- 293 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nTgtgW33wDwD9RKv' \
    > test.out 2>&1
eval_tap $? 293 'AdminGetDevicesByUserV4' test.out

#- 294 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'QX4yFQFdrRoM6Foq' \
    --endDate 'CYw7AlxO6qdFpc71' \
    --limit '37' \
    --offset '17' \
    --startDate 'Sck3ggZWJlSlCQMD' \
    > test.out 2>&1
eval_tap $? 294 'AdminGetBannedDevicesV4' test.out

#- 295 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ji329PfVrvMEPtps' \
    > test.out 2>&1
eval_tap $? 295 'AdminGetUserDeviceBansV4' test.out

#- 296 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "SNcpK1QkB2Sy8Ww7", "deviceId": "9LVeVskqeUB7RSay", "deviceType": "qGFguhh3bvadRthd", "enabled": false, "endDate": "c7OydVw0zCqoMZvp", "ext": {"IOO97DmQ5ZOzx6iC": {}, "JTu60IifzMhkk5Px": {}, "sjqbCKpMv2Yky9DY": {}}, "reason": "kD2sIllFtBtXJKG3"}' \
    > test.out 2>&1
eval_tap $? 296 'AdminBanDeviceV4' test.out

#- 297 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'rqBmILhtWm8RQvRU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 297 'AdminGetDeviceBanV4' test.out

#- 298 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'bUDSiefGEdLucrtO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateDeviceBanV4' test.out

#- 299 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'y66Drf4SSGGt3MiB' \
    --startDate 'Kohow3kKoaP1K4CD' \
    --deviceType 'uH1mMIfOCDyVAHrH' \
    > test.out 2>&1
eval_tap $? 299 'AdminGenerateReportV4' test.out

#- 300 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 300 'AdminGetDeviceTypesV4' test.out

#- 301 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'ncR5dShqiBUI9esS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 301 'AdminGetDeviceBansV4' test.out

#- 302 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'sXegSEhrPpK2q8kx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 302 'AdminDecryptDeviceV4' test.out

#- 303 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'R4BuEksS2A9VOA8H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 303 'AdminUnbanDeviceV4' test.out

#- 304 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId '9VeHv0L2Acm960EY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 304 'AdminGetUsersByDeviceV4' test.out

#- 305 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 87}' \
    > test.out 2>&1
eval_tap $? 305 'AdminCreateTestUsersV4' test.out

#- 306 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["VVBrShGbIIuqK8C4", "03HgoXCR6XOMXwKd", "fqk8T4QHK30EX0Fc"]}' \
    > test.out 2>&1
eval_tap $? 306 'AdminBulkCheckValidUserIDV4' test.out

#- 307 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lpDl5HsuracO5Mnj' \
    --body '{"avatarUrl": "nxD1OXkxShFVQTRe", "country": "kLfjmy8zosRCRgVw", "dateOfBirth": "brQKmb01yA7U7dGM", "displayName": "jupZkZQY8CNyT4k3", "languageTag": "DIbfT22G5NpE130Y", "userName": "WSgxpKWtdtdtVW9a"}' \
    > test.out 2>&1
eval_tap $? 307 'AdminUpdateUserV4' test.out

#- 308 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nENmxb9e7vXZV3ig' \
    --body '{"code": "8Jg5VByeI3ycMcYY", "emailAddress": "BixKJXCISQdwec1m"}' \
    > test.out 2>&1
eval_tap $? 308 'AdminUpdateUserEmailAddressV4' test.out

#- 309 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '8BusV9tUh74KVo6X' \
    > test.out 2>&1
eval_tap $? 309 'AdminDisableUserMFAV4' test.out

#- 310 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qjz2xUKLNWSmYyVv' \
    > test.out 2>&1
eval_tap $? 310 'AdminListUserRolesV4' test.out

#- 311 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yelIJ8QgaLMqi836' \
    --body '{"assignedNamespaces": ["ULa7cfZl4VuY6rsZ", "yo6CBRRnoOikIxXK", "KIR6kPmswm5TCAU1"], "roleId": "cKApdJDnE73GLmSZ"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminUpdateUserRoleV4' test.out

#- 312 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ns5owBhoUg4LsGP6' \
    --body '{"assignedNamespaces": ["KLPXkvUv2XiXaBzs", "maxjTZPlLitytGka", "7Kv5TacQKF4OlRGd"], "roleId": "mXxETLEQrr3KCAV9"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminAddUserRoleV4' test.out

#- 313 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'alq3hK1G4kKooSNN' \
    --body '{"assignedNamespaces": ["UZuiynZ64IwncZPk", "82GF3eTC0vzZUDj9", "dzGgGVxo9OHgfHum"], "roleId": "yfuBNisecYbcOpR4"}' \
    > test.out 2>&1
eval_tap $? 313 'AdminRemoveUserRoleV4' test.out

#- 314 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '57' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 314 'AdminGetRolesV4' test.out

#- 315 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "Vpqn47GVghTH2wTo"}' \
    > test.out 2>&1
eval_tap $? 315 'AdminCreateRoleV4' test.out

#- 316 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'Onq9U5lyW89Xwt3w' \
    > test.out 2>&1
eval_tap $? 316 'AdminGetRoleV4' test.out

#- 317 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'mRTrDCjhnKvsHezW' \
    > test.out 2>&1
eval_tap $? 317 'AdminDeleteRoleV4' test.out

#- 318 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'TqgYPixtHk6lWq6t' \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "1La16Bw3JbUnUDh5"}' \
    > test.out 2>&1
eval_tap $? 318 'AdminUpdateRoleV4' test.out

#- 319 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'yGjjv4Mwrv2vancm' \
    --body '{"permissions": [{"action": 89, "resource": "bAQL7VE2wL8Y4JFV", "schedAction": 96, "schedCron": "CMqPsRk5htdM5T3f", "schedRange": ["DSrSHrkoqv2mM6so", "MaTvQq2a9YdFNtRV", "SO0js0hG9xmSnzd7"]}, {"action": 51, "resource": "HCDx55JZ5z6gujpF", "schedAction": 52, "schedCron": "kJHRhmLKQuQVFSKi", "schedRange": ["Xl8G2uf6E8EajXLS", "AS8MKMaxQ1QyJCpK", "edhuzI7G9NCKKXu1"]}, {"action": 2, "resource": "CsSDspvgM16sZ6rj", "schedAction": 28, "schedCron": "jCUDMOrbmoRvWnfm", "schedRange": ["GFy0eUoOBd90h9ED", "qSTOfoNewWjwMWDK", "Et6JhbJ0fwTDaq6b"]}]}' \
    > test.out 2>&1
eval_tap $? 319 'AdminUpdateRolePermissionsV4' test.out

#- 320 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId '5RpMwhWPtndriXU9' \
    --body '{"permissions": [{"action": 24, "resource": "59tEGm9NYeUT5P0n", "schedAction": 49, "schedCron": "VUGgGHkapTCafFMd", "schedRange": ["vYiCBuzUUwyI6Vtd", "4v9k4fv3kMiuQ3Dh", "sKLxjt5srPFxBgpF"]}, {"action": 39, "resource": "b15QeIQF51c4MqJz", "schedAction": 61, "schedCron": "oBAhAlJGI2YYb6aj", "schedRange": ["Bjgq6eY4PBNHKPx6", "2tHxDb06ZFy3uglS", "p2UxvF2uLXWilRD7"]}, {"action": 68, "resource": "uxgVLGgK8aVSCN6o", "schedAction": 58, "schedCron": "LvcnGMJbJIYLssMv", "schedRange": ["y9gkfTMRrXVRcAVR", "DX6gmDfNfPGYYSTu", "nMgt3C8hEguCqlMH"]}]}' \
    > test.out 2>&1
eval_tap $? 320 'AdminAddRolePermissionsV4' test.out

#- 321 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'iQN3HWJw9zIWsiP2' \
    --body '["JQ24meDrwEuTyM2q", "ohglzO8AEl6A9sh2", "x2ur2ccp7R7OqPqI"]' \
    > test.out 2>&1
eval_tap $? 321 'AdminDeleteRolePermissionsV4' test.out

#- 322 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'jS4i0N9ytb3c8pVZ' \
    --after '8GlU8962e6gtn5pU' \
    --before 'ARJM1T8QwMNOAzXm' \
    --limit '50' \
    > test.out 2>&1
eval_tap $? 322 'AdminListAssignedUsersV4' test.out

#- 323 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'ajE2gjooiDnc1NUb' \
    --body '{"assignedNamespaces": ["51lEgUwQ9tkWaMOH", "47CAT7cBP0918JaE", "BQBP766LUnBBR84i"], "namespace": "AO7sBQt6YJ2tWwF7", "userId": "RnP1oK3c4RVfjB0z"}' \
    > test.out 2>&1
eval_tap $? 323 'AdminAssignUserToRoleV4' test.out

#- 324 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'i3XrYZUiN24ol1qq' \
    --body '{"namespace": "balgizL97ycJV5Yq", "userId": "E2myQzl7X9fHr6Wv"}' \
    > test.out 2>&1
eval_tap $? 324 'AdminRevokeUserFromRoleV4' test.out

#- 325 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["BxmBvNj3ktaDf9B2", "2HGgxakPt7IYzaZU", "TmvsEzLPnnGsnfmB"], "emailAddresses": ["erp84qjwzWpCF1vy", "amjsEzwtLPxK1os4", "qR8LaQzEb39sZTdF"], "isAdmin": false, "namespace": "CCbnfihnXKxGxaup", "roleId": "nTTq9ihZkvFKfSHQ"}' \
    > test.out 2>&1
eval_tap $? 325 'AdminInviteUserNewV4' test.out

#- 326 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "h8I9xk3sFl0cbuCR", "country": "M69XKkLwioRaKnWh", "dateOfBirth": "lh80BhYe2fJDS6T7", "displayName": "5Q4ulonMFjmYqE1w", "languageTag": "JhfogWg2Apm0sUy1", "userName": "8aWn65Co0vdCk8so"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminUpdateMyUserV4' test.out

#- 327 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 327 'AdminDisableMyAuthenticatorV4' test.out

#- 328 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '6JSaZAIadKDEZywo' \
    > test.out 2>&1
eval_tap $? 328 'AdminEnableMyAuthenticatorV4' test.out

#- 329 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 329 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 330 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 330 'AdminGetMyBackupCodesV4' test.out

#- 331 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 331 'AdminGenerateMyBackupCodesV4' test.out

#- 332 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 332 'AdminDisableMyBackupCodesV4' test.out

#- 333 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 333 'AdminDownloadMyBackupCodesV4' test.out

#- 334 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 334 'AdminEnableMyBackupCodesV4' test.out

#- 335 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 335 'AdminSendMyMFAEmailCodeV4' test.out

#- 336 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 336 'AdminDisableMyEmailV4' test.out

#- 337 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'nA2SrEdN2tmGuX6r' \
    > test.out 2>&1
eval_tap $? 337 'AdminEnableMyEmailV4' test.out

#- 338 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 338 'AdminGetMyEnabledFactorsV4' test.out

#- 339 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor '0gBVUUeKKlPKtE6g' \
    > test.out 2>&1
eval_tap $? 339 'AdminMakeFactorMyDefaultV4' test.out

#- 340 AdminInviteUserV4
eval_tap 0 340 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 341 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "K9D2bTcgaKoccaSw", "policyId": "WcZmzCWGI1cIQcPW", "policyVersionId": "AShIhieSKUf3zKby"}, {"isAccepted": false, "localizedPolicyVersionId": "r6FNbKJ05Orya6LS", "policyId": "SUlugIAknXcSaVYc", "policyVersionId": "AYp7qSiDvsfMUOpW"}, {"isAccepted": true, "localizedPolicyVersionId": "rLwrPoWiywnxuDLL", "policyId": "uIaSxoloIH1gBCWV", "policyVersionId": "Frvls0ZwosKhDlLf"}], "authType": "EMAILPASSWD", "country": "KxpVOXvGSrdkqddI", "dateOfBirth": "3ezqu6FB0sL2xt6f", "displayName": "X9j7rhZCAlDlVKBs", "emailAddress": "LZiBRXszE7CL1cQC", "password": "SoqHvH7g63cOx6yr", "passwordMD5Sum": "Iw37pKOLrF5i3gr3", "username": "Cc4M2O7NrTQO7KLd", "verified": false}' \
    > test.out 2>&1
eval_tap $? 341 'PublicCreateTestUserV4' test.out

#- 342 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "WogE5gcfF8AMGZ2F", "policyId": "BS93Mg6TKwdRMraD", "policyVersionId": "Lrwh3d0ykRGkgqUN"}, {"isAccepted": false, "localizedPolicyVersionId": "4xmIOjFLgKR4LjEW", "policyId": "hOScvtQ92iD02YMv", "policyVersionId": "EUNfoL7JCcMo7Gxx"}, {"isAccepted": false, "localizedPolicyVersionId": "dbYCRexPekTsQxMT", "policyId": "faSot7aohFYy4Vxw", "policyVersionId": "HIJ9gzxqAw4vBGQA"}], "authType": "EMAILPASSWD", "code": "eDLYEzs2SQUdKr6v", "country": "gqkjycqclNlBORlC", "dateOfBirth": "8ZkjsxYtgxplHTPL", "displayName": "zynjFZgF3erw7Usy", "emailAddress": "Hq4bBb0n1JhPUS8B", "password": "RPGV9n769zLJdKMe", "passwordMD5Sum": "xeJc7NvgTSgKjCxZ", "reachMinimumAge": false, "username": "YEJjIYwqfSRy8GgV"}' \
    > test.out 2>&1
eval_tap $? 342 'PublicCreateUserV4' test.out

#- 343 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'k77fd1GS5YkyhAiA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "ccAFn5CEPoH6opK5", "policyId": "DSO8JyX4IE1z3rDw", "policyVersionId": "Z1HKsOpyq8agQuz8"}, {"isAccepted": true, "localizedPolicyVersionId": "nc6jLF9DIW2ncJJK", "policyId": "pqmgvUTr8XAtpOqU", "policyVersionId": "QxzqJZiWi3KQffT5"}, {"isAccepted": false, "localizedPolicyVersionId": "bVpCgKvPXSDufmKh", "policyId": "783cV54JsVBRB0rY", "policyVersionId": "0xfWddACyHSmo4KX"}], "authType": "EMAILPASSWD", "country": "O3K1k5ZM8btmGsgX", "dateOfBirth": "NXbpqxh76Af5JSwj", "displayName": "w2fE2g6jXV7oai2o", "password": "Dm9FaP0HJ98tE4Uy", "reachMinimumAge": false, "username": "hTe3nt7t9ztprSfW"}' \
    > test.out 2>&1
eval_tap $? 343 'CreateUserFromInvitationV4' test.out

#- 344 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "9OutADrNGBWSJ1zQ", "country": "KxVmRTawjiZPMoZZ", "dateOfBirth": "cyGEHxAKDQher3us", "displayName": "ApPdJPn9eIdhIBvT", "languageTag": "TupABJ4RwH3EdKmY", "userName": "tbqQHNfIZwrMxf3E"}' \
    > test.out 2>&1
eval_tap $? 344 'PublicUpdateUserV4' test.out

#- 345 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "nzZVnkLT0Lb85nmp", "emailAddress": "dN26BY5YI0jeO2zM"}' \
    > test.out 2>&1
eval_tap $? 345 'PublicUpdateUserEmailAddressV4' test.out

#- 346 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "DSy4kyqyKgrtEPdX", "country": "Xlt8geCdiXu3iNvn", "dateOfBirth": "7vLZ7h6alhJNGZF0", "displayName": "7lsPP5OfHbXzWnVO", "emailAddress": "2U4uyzZo1rj0ZrLQ", "password": "jk4VoYfIksth24cZ", "reachMinimumAge": true, "username": "AVg50kOdJagEmTua", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 346 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 347 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "v7EURTNIoG1DBdoK", "password": "H6sREmmfwUZLZZS7", "username": "snx0Q2Gd8m7Y3wiN"}' \
    > test.out 2>&1
eval_tap $? 347 'PublicUpgradeHeadlessAccountV4' test.out

#- 348 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'PublicDisableMyAuthenticatorV4' test.out

#- 349 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'loJfey3HXL6SjljN' \
    > test.out 2>&1
eval_tap $? 349 'PublicEnableMyAuthenticatorV4' test.out

#- 350 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 350 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 351 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 351 'PublicGetMyBackupCodesV4' test.out

#- 352 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 352 'PublicGenerateMyBackupCodesV4' test.out

#- 353 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 353 'PublicDisableMyBackupCodesV4' test.out

#- 354 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 354 'PublicDownloadMyBackupCodesV4' test.out

#- 355 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 355 'PublicEnableMyBackupCodesV4' test.out

#- 356 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'PTXA3qbg55SyienC' \
    > test.out 2>&1
eval_tap $? 356 'PublicRemoveTrustedDeviceV4' test.out

#- 357 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 357 'PublicSendMyMFAEmailCodeV4' test.out

#- 358 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 358 'PublicDisableMyEmailV4' test.out

#- 359 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'ODZ0mnOpPTVxEgBF' \
    > test.out 2>&1
eval_tap $? 359 'PublicEnableMyEmailV4' test.out

#- 360 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 360 'PublicGetMyEnabledFactorsV4' test.out

#- 361 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'zG8tlkxWKCU1XN4g' \
    > test.out 2>&1
eval_tap $? 361 'PublicMakeFactorMyDefaultV4' test.out

#- 362 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'l7yHvEqpJSrDXVwC' \
    > test.out 2>&1
eval_tap $? 362 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 363 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"emailAddress": "khOQ161TFjROYJm7", "namespace": "5VIuCOCkt2W1DfI8", "namespaceDisplayName": "QtgODk9K6DcMnyCP"}' \
    > test.out 2>&1
eval_tap $? 363 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE