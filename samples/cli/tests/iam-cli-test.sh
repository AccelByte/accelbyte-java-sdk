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
echo "1..347"

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
    --body '[{"field": "7T1e4yoW", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "blockedWord": ["juAoJysG", "ks2D8q4L", "WTWPp2lD"], "description": [{"language": "GoVuPxia", "message": ["NWd78F7Q", "CuYsH7z9", "YD61JIfi"]}, {"language": "EbkSyYxa", "message": ["OJ4f9DjL", "9AvLZkEC", "XVKjPw9P"]}, {"language": "xy8PwSQY", "message": ["y0iKCecs", "ABxK3z51", "fAfNab6O"]}], "isCustomRegex": true, "letterCase": "UN12gpk4", "maxLength": 1, "maxRepeatingAlphaNum": 30, "maxRepeatingSpecialCharacter": 36, "minCharType": 85, "minLength": 16, "regex": "h9DVH8xC", "specialCharacterLocation": "KlgDaChz", "specialCharacters": ["VfsuDol3", "PqmsVH0d", "MwXBQiQx"]}}, {"field": "5cggufNw", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "blockedWord": ["XNxecB0L", "2HnuUMrD", "EJ1h5B0w"], "description": [{"language": "fELUQ92L", "message": ["KhRj9xUR", "XR6nfPlz", "XTBVh6mj"]}, {"language": "Rzqsvczg", "message": ["M7YabH8g", "VNME42B7", "gMiMNAir"]}, {"language": "pflJvkRt", "message": ["ecGr9tRC", "4fpXuY4G", "VHPXL0MO"]}], "isCustomRegex": false, "letterCase": "6FPRLJTv", "maxLength": 56, "maxRepeatingAlphaNum": 48, "maxRepeatingSpecialCharacter": 95, "minCharType": 32, "minLength": 64, "regex": "XJmYNYbl", "specialCharacterLocation": "bcwwqI6x", "specialCharacters": ["KGJDe2TE", "wbE08Pk1", "7fPK5nnK"]}}, {"field": "da01jYcE", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "blockedWord": ["ljyuEpZb", "zl1A2w25", "UhoW83A1"], "description": [{"language": "fWkesYAP", "message": ["N8GNiprd", "UjnhAfuC", "Dt4z1gpa"]}, {"language": "iat67JS3", "message": ["ThTjuXEm", "5OWqYl5v", "K5XrEvTM"]}, {"language": "4LSMjVpo", "message": ["u6114yDo", "NoSkcRwO", "VnMHgJl9"]}], "isCustomRegex": true, "letterCase": "6TLwD6bZ", "maxLength": 83, "maxRepeatingAlphaNum": 14, "maxRepeatingSpecialCharacter": 64, "minCharType": 8, "minLength": 48, "regex": "F8ICkctf", "specialCharacterLocation": "6L7ZUiDn", "specialCharacters": ["MtjAgWV5", "cGg75NYg", "f1C58B05"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'xSfPtDbi' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'T1WAFv0u' \
    --before 'Zhs2Llcb' \
    --limit '37' \
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
    --body '{"ageRestriction": 44, "enable": true}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'vc7QEkvj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 9}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'suAPVCk3' \
    --limit '79' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "vgsuZKop", "comment": "Do2EmgqW", "endDate": "qJhZEoaG", "reason": "Xhpx9MVJ", "skipNotif": false, "userIds": ["xtT42sPW", "tTCbnUvq", "ezpKDC4j"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "vEThH3SK", "userId": "dVcOqVmN"}, {"banId": "9BmkpsuW", "userId": "bjbcNW1j"}, {"banId": "6cO1teWe", "userId": "63a4KkmD"}]}' \
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
    --clientId 'FKy3pu56' \
    --clientName 'PlgpYahX' \
    --clientType '173zjR76' \
    --limit '41' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["bx7PX9bc", "oiGVLzrP", "Y7PMVVxk"], "baseUri": "6CDkxyRY", "clientId": "xqpBgZwe", "clientName": "iIfKZ1wy", "clientPermissions": [{"action": 35, "resource": "WH7pF6PK", "schedAction": 68, "schedCron": "bpdvZ6bZ", "schedRange": ["xx3uMn4k", "9XEdQPGM", "iloN42Rk"]}, {"action": 38, "resource": "yjCXl2YH", "schedAction": 90, "schedCron": "ojcDhyTK", "schedRange": ["2GJVXD4D", "mYxOQ1Xz", "sHcsSIp6"]}, {"action": 89, "resource": "uHCcNBcA", "schedAction": 67, "schedCron": "QnVygtdy", "schedRange": ["HVYdmv2P", "lQakhTC0", "xZHMFkts"]}], "clientPlatform": "TQgRWztO", "deletable": false, "description": "E75wLofV", "namespace": "6DqOsOST", "oauthAccessTokenExpiration": 78, "oauthAccessTokenExpirationTimeUnit": "4DyvTMLw", "oauthClientType": "1qxsZGvd", "oauthRefreshTokenExpiration": 93, "oauthRefreshTokenExpirationTimeUnit": "gdU7AIRU", "parentNamespace": "a1eaN635", "redirectUri": "IvhY1A3c", "scopes": ["AaA4jZIa", "IiBVrQJC", "lj2lAKAs"], "secret": "DtbO40AQ", "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'BkYeG8ct' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'P5nrZGRp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'IVO9bvkT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["huMHhk0U", "eS5ka6r8", "tMbW9Aht"], "baseUri": "J8aeNYR7", "clientName": "878FGq1D", "clientPermissions": [{"action": 54, "resource": "hcIUzWZv", "schedAction": 36, "schedCron": "hiMaUD4Z", "schedRange": ["kM3tlbOG", "suknCUDH", "cNAlALl7"]}, {"action": 82, "resource": "A3mqxhnd", "schedAction": 28, "schedCron": "X7Dt1177", "schedRange": ["kl2HaO6w", "Vv0Kg0nS", "sFHYvALv"]}, {"action": 48, "resource": "8RxnhHFw", "schedAction": 68, "schedCron": "qPXukcnw", "schedRange": ["b3kEPTSy", "BvfAE0DZ", "N9D1p5GJ"]}], "clientPlatform": "dTJRTL6L", "deletable": false, "description": "QJncZJ7S", "namespace": "s66Ntl01", "oauthAccessTokenExpiration": 50, "oauthAccessTokenExpirationTimeUnit": "lnSSqxQQ", "oauthRefreshTokenExpiration": 1, "oauthRefreshTokenExpirationTimeUnit": "7tLLrdTC", "redirectUri": "x8I5ZXPq", "scopes": ["5OdEA4ux", "NghGVCXW", "FWP9PaZ4"], "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'QSa0f7pO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 34, "resource": "M5UHkWuy"}, {"action": 86, "resource": "9kY3IHo6"}, {"action": 57, "resource": "gHrLAZ56"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'TvhG6Rjw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 57, "resource": "ZaZyCI7a"}, {"action": 42, "resource": "TkekZgr2"}, {"action": 83, "resource": "msQ1Z1Pf"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '100' \
    --clientId 'DJzTtfGD' \
    --namespace "$AB_NAMESPACE" \
    --resource '0DxJuZFY' \
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
    --limit '14' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oQS6ZvR3' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'H8kCvcG0' \
    --body '{"ACSURL": "7UldZs8h", "AWSCognitoRegion": "VBiQcP8E", "AWSCognitoUserPool": "RBxSyXUU", "AllowedClients": ["2exmSlN3", "gjTSbjvi", "r2WNtjuF"], "AppId": "75liaY46", "AuthorizationEndpoint": "Ra7sPMV6", "ClientId": "HHqNxYry", "Environment": "ha7GYBZU", "FederationMetadataURL": "hultztn4", "GenericOauthFlow": false, "IsActive": true, "Issuer": "1dhV7tSn", "JWKSEndpoint": "wVWxjuz5", "KeyID": "oZ7HPPLp", "NetflixCertificates": {"encryptedPrivateKey": "wDh1VUrp", "encryptedPrivateKeyName": "tafqjNlI", "publicCertificate": "ZhbtdgAl", "publicCertificateName": "B8FmuzKz", "rootCertificate": "Y4uGOEJy", "rootCertificateName": "QPUJixRv"}, "OrganizationId": "sTPln5m0", "PlatformName": "balbEZO5", "RedirectUri": "Iqicx9xg", "RegisteredDomains": [{"affectedClientIDs": ["qnvsIaNk", "v5VfMWOh", "ncoEXu7J"], "domain": "xJRktxbO", "namespaces": ["hPH5RsSU", "ubqWRjRz", "Kh7nvtU7"], "roleId": "SKrwbq8B"}, {"affectedClientIDs": ["2QF8m1iv", "MwqzBEsj", "FdXowinZ"], "domain": "UujVvZSx", "namespaces": ["KUwfkwTQ", "PRjTawDH", "7JrVZurc"], "roleId": "aNI9qgmn"}, {"affectedClientIDs": ["3w4cNwgR", "XprDfy83", "Wx679kqc"], "domain": "D2Q2BGb7", "namespaces": ["46yTArvR", "H0GsNjca", "6O37KYkI"], "roleId": "NdqtF47n"}], "Secret": "Bcwwr9w3", "TeamID": "GiTzDfhS", "TokenAuthenticationType": "5OEJLRVF", "TokenClaimsMapping": {"TZUhFGFO": "2duFJbmS", "xR9GtbJk": "4AXzyEx4", "1qm9vvIk": "z0esIAmn"}, "TokenEndpoint": "w81nwOHT", "scopes": ["db4680Hc", "mof8Jo2j", "VqpP2nQI"]}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'cGu9p2MK' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'szca3Ytw' \
    --body '{"ACSURL": "T1LKbhfS", "AWSCognitoRegion": "qOgQUdYM", "AWSCognitoUserPool": "mrqeCt8S", "AllowedClients": ["XGkAj0ie", "DBVtaFKs", "UyIKHlZT"], "AppId": "AZhyLWoT", "AuthorizationEndpoint": "7xAFaylI", "ClientId": "11pgPLnY", "Environment": "I4YBXp3Y", "FederationMetadataURL": "96XqHXwy", "GenericOauthFlow": true, "IsActive": false, "Issuer": "JdeVTP8D", "JWKSEndpoint": "AYDHQck6", "KeyID": "mOvKje8z", "NetflixCertificates": {"encryptedPrivateKey": "BcQpW7tm", "encryptedPrivateKeyName": "uwAg6im3", "publicCertificate": "A2W9Z5zn", "publicCertificateName": "VO6yIUgD", "rootCertificate": "UyaVlFcJ", "rootCertificateName": "4qPS9kvY"}, "OrganizationId": "BLwOwLHf", "PlatformName": "3pHtDVb9", "RedirectUri": "V2D0nGTG", "RegisteredDomains": [{"affectedClientIDs": ["RlRNMTxc", "SAn7PwVv", "Vt1tGH2J"], "domain": "KMbOefQF", "namespaces": ["v1rGoIgf", "q2fN3Opu", "n2svQUIP"], "roleId": "mEMVP6CL"}, {"affectedClientIDs": ["6un0oWyZ", "4ofo5PFT", "McnlQO97"], "domain": "XoCi1MS5", "namespaces": ["uyARPwH4", "OGPxHoCv", "qedLQx4Y"], "roleId": "5xiykiK6"}, {"affectedClientIDs": ["1rOgi2Nz", "zHdj0frb", "Y5Z17JaN"], "domain": "Bz4K3Omw", "namespaces": ["znDn4mN6", "IN55Datn", "38nCMpTS"], "roleId": "F5brxofN"}], "Secret": "MgtJh9ay", "TeamID": "Wj8wK6s0", "TokenAuthenticationType": "S8Uw4Bz4", "TokenClaimsMapping": {"nKmZ6MZJ": "AqjPlazO", "ld5ovY5g": "6GNnPBfJ", "BC6V5oTg": "2cVfBmfm"}, "TokenEndpoint": "B2cVxUhk", "scopes": ["woLzh8oI", "xP0yH0e5", "O63jzQLF"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'h0dptv1b' \
    --body '{"affectedClientIDs": ["76VNghsZ", "Fqfimuhq", "rNdpFgFE"], "assignedNamespaces": ["bCjICmPY", "xqbnp156", "Ui3LfYSD"], "domain": "TQiUJMDn", "roleId": "NrD1pZYe"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1u66pwu9' \
    --body '{"domain": "YAmexU1X"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'G5IE8Z5D' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uAXRTk9U' \
    --body '{"acsUrl": "t12em3MT", "apiKey": "ooOh5Q90", "appId": "aqMU9ekT", "federationMetadataUrl": "9xzxPObz", "isActive": false, "redirectUri": "g4EngFgi", "secret": "zKxF7BPu", "ssoUrl": "wZ4giVUz"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xYB0WJLb' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Df4A3ZTt' \
    --body '{"acsUrl": "RJ5r1qrm", "apiKey": "4FQcX7tD", "appId": "mCCvfdzU", "federationMetadataUrl": "2nQmF8go", "isActive": true, "redirectUri": "ETxN2yuE", "secret": "VB71f5XC", "ssoUrl": "M5Y0MEgx"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'm3Vd1CKU' \
    --platformUserId 'G6CYB2Ry' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'Hvb9pISl' \
    --after '70' \
    --before '59' \
    --limit '18' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'MDvKh5Mi' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["oer1jS9a", "dzKE4qAS", "odJ7Wi1g"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["DMga0cga", "3EyBXa7Z", "RqOL8KW5"], "isAdmin": false, "namespace": "jQrn3Nei", "roles": ["WP3PUq0d", "geccbPSb", "61z1JKuM"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '55' \
    --platformUserId '7p2yGgqJ' \
    --platformId 'E8ImrJr2' \
    > test.out 2>&1
eval_tap $? 146 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 147 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 147 'AdminListUsersV3' test.out

#- 148 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'yBIdqzay' \
    --endDate 'zmDxU7AT' \
    --limit '19' \
    --offset '97' \
    --platformBy 'bN1TzjoX' \
    --platformId 'lzQ8qvCg' \
    --query 'VgEdscxB' \
    --startDate 'fUoKMlhz' \
    > test.out 2>&1
eval_tap $? 148 'AdminSearchUserV3' test.out

#- 149 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["CuWlpWJa", "159MX2A1", "txXrmxso"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetBulkUserByEmailAddressV3' test.out

#- 150 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jhel9ZEe' \
    > test.out 2>&1
eval_tap $? 150 'AdminGetUserByUserIdV3' test.out

#- 151 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nlCmGhCT' \
    --body '{"avatarUrl": "i8MaU1gD", "country": "xSzFGaTk", "dateOfBirth": "VqbScfw3", "displayName": "2iY4vIv6", "languageTag": "UX5tBAAU", "userName": "FPdiLdMA"}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserV3' test.out

#- 152 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IWsj35wH' \
    --activeOnly  \
    --after 'UmSpPm5S' \
    --before 'gk5WcuwY' \
    --limit '38' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetUserBanV3' test.out

#- 153 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xs1QjqPC' \
    --body '{"ban": "QafvFgIE", "comment": "RjY76IwR", "endDate": "wO0czgv7", "reason": "p8B7bDoM", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 153 'AdminBanUserV3' test.out

#- 154 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'q730FWvj' \
    --namespace "$AB_NAMESPACE" \
    --userId '679iVn44' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 154 'AdminUpdateUserBanV3' test.out

#- 155 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TWQ4Mctz' \
    --body '{"context": "9S52KXEB", "emailAddress": "jyl1Vb2F", "languageTag": "dVpjmfvH"}' \
    > test.out 2>&1
eval_tap $? 155 'AdminSendVerificationCodeV3' test.out

#- 156 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GdKqMg6S' \
    --body '{"Code": "KNEc6rnJ", "ContactType": "YeqyNMbd", "LanguageTag": "xPhExEHD", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 156 'AdminVerifyAccountV3' test.out

#- 157 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'OnmHJ5Cd' \
    > test.out 2>&1
eval_tap $? 157 'GetUserVerificationCode' test.out

#- 158 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'm7tsNdwi' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserDeletionStatusV3' test.out

#- 159 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8BsaTnly' \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpdateUserDeletionStatusV3' test.out

#- 160 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DeX6w2BE' \
    --body '{"code": "F2WRi7qs", "country": "oYC2v0Yf", "dateOfBirth": "2mQzUIei", "displayName": "sFD6YKTg", "emailAddress": "us8iKfkg", "password": "Cw0zGwb9", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpgradeHeadlessAccountV3' test.out

#- 161 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JYStgJDc' \
    > test.out 2>&1
eval_tap $? 161 'AdminDeleteUserInformationV3' test.out

#- 162 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bKe1gfUt' \
    --after '0.20671558797183953' \
    --before '0.48834100102601696' \
    --limit '54' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetUserLoginHistoriesV3' test.out

#- 163 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'n65cs2do' \
    --body '{"languageTag": "HBWxQlKw", "newPassword": "mfTkl6GG", "oldPassword": "ytjhg3eA"}' \
    > test.out 2>&1
eval_tap $? 163 'AdminResetPasswordV3' test.out

#- 164 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WqrwltsM' \
    --body '{"Permissions": [{"Action": 86, "Resource": "DbKlj0Ua", "SchedAction": 43, "SchedCron": "Nv6kgjLj", "SchedRange": ["J0orOsoY", "3cirjWfJ", "9IrLiTat"]}, {"Action": 24, "Resource": "JFDthTHu", "SchedAction": 46, "SchedCron": "EC5rNfhZ", "SchedRange": ["Q2CIvbU4", "Z7mh8QVr", "nl1eJLAv"]}, {"Action": 67, "Resource": "XA0Ewpdf", "SchedAction": 50, "SchedCron": "WKTTQeHB", "SchedRange": ["S2coXaNM", "0kItRKED", "jamOKvd3"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserPermissionV3' test.out

#- 165 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A1cwYspZ' \
    --body '{"Permissions": [{"Action": 31, "Resource": "PzVDg0VT", "SchedAction": 58, "SchedCron": "1H1185JG", "SchedRange": ["ngLMfC62", "BNXskWrA", "ndAQCbbr"]}, {"Action": 34, "Resource": "wsA3VCGC", "SchedAction": 77, "SchedCron": "Mh1JoMT6", "SchedRange": ["eS1oBYpc", "0ehiqBTY", "jtqxfYUR"]}, {"Action": 76, "Resource": "TzZAcuw5", "SchedAction": 89, "SchedCron": "Vj317NOk", "SchedRange": ["rF2t9CrP", "0Ydtqbyg", "bIBU4edA"]}]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminAddUserPermissionsV3' test.out

#- 166 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sviOsC2A' \
    --body '[{"Action": 43, "Resource": "XTlXxbhP"}, {"Action": 89, "Resource": "wjWOAhFY"}, {"Action": 0, "Resource": "SOxnqYzc"}]' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionBulkV3' test.out

#- 167 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '18' \
    --namespace "$AB_NAMESPACE" \
    --resource 'RqCyRW0j' \
    --userId '5oHYnUpe' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserPermissionV3' test.out

#- 168 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FF0TYLZ3' \
    --after 'NH6Nup89' \
    --before 'Jh9waI5j' \
    --limit '17' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserPlatformAccountsV3' test.out

#- 169 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'jkTZeBmy' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetListJusticePlatformAccounts' test.out

#- 170 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'WuzHcK45' \
    --userId 'i3DO1ZYt' \
    > test.out 2>&1
eval_tap $? 170 'AdminGetUserMapping' test.out

#- 171 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'iVn32CWZ' \
    --userId 'kY1jTn8h' \
    > test.out 2>&1
eval_tap $? 171 'AdminCreateJusticeUser' test.out

#- 172 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'LS8lnj2d' \
    --body '{"platformId": "hnFehZby", "platformUserId": "MzIuY3qq"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminLinkPlatformAccount' test.out

#- 173 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KpvVpO9g' \
    --userId 'cJETJ7VP' \
    --body '{"platformNamespace": "jE9PhCMa"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformUnlinkV3' test.out

#- 174 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Glov9Fij' \
    --userId 'afJ5QwB7' \
    --ticket 'jzjVcUuO' \
    > test.out 2>&1
eval_tap $? 174 'AdminPlatformLinkV3' test.out

#- 175 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ynsnrYo6' \
    --userId 'iPRBt6n8' \
    --platformToken 'swG5PqSL' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 176 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'unlyXaYu' \
    --body '["3jxX9oXg", "Ak1fBQDU", "GnylwIfx"]' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserRolesV3' test.out

#- 177 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9gGPQcVX' \
    --body '[{"namespace": "lxsykL1e", "roleId": "mAkFdFsy"}, {"namespace": "zTuPq7uF", "roleId": "FtrD6J8D"}, {"namespace": "StAxUkM0", "roleId": "r9eOHXF2"}]' \
    > test.out 2>&1
eval_tap $? 177 'AdminSaveUserRoleV3' test.out

#- 178 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'voZkrpfT' \
    --userId 'FwxkNzcS' \
    > test.out 2>&1
eval_tap $? 178 'AdminAddUserRoleV3' test.out

#- 179 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'aGGdjXkW' \
    --userId '7yrroYtO' \
    > test.out 2>&1
eval_tap $? 179 'AdminDeleteUserRoleV3' test.out

#- 180 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tCwusIKo' \
    --body '{"enabled": false, "reason": "V2E35YDY"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateUserStatusV3' test.out

#- 181 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PcM83aYK' \
    > test.out 2>&1
eval_tap $? 181 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 182 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'RtV5G2VI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "rNTRq3ej"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateClientSecretV3' test.out

#- 183 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'LUUCFizg' \
    --before 'aSTPe7yf' \
    --isWildcard  \
    --limit '59' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRolesV3' test.out

#- 184 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "managers": [{"displayName": "7Q2UjipE", "namespace": "3lbnfVGp", "userId": "17dikrAo"}, {"displayName": "750xUbUW", "namespace": "m8wqMrS4", "userId": "I57cnzUk"}, {"displayName": "QFFgCl74", "namespace": "ZdF54YYW", "userId": "W0Jxb3Ti"}], "members": [{"displayName": "SmtBzW9N", "namespace": "rdhG3ic2", "userId": "U4HDewBC"}, {"displayName": "QpWasMDE", "namespace": "Dgt1dwhM", "userId": "Ju9HP9P0"}, {"displayName": "sOTmJuzT", "namespace": "3TQtnC5F", "userId": "aYcRADME"}], "permissions": [{"action": 28, "resource": "HGb93AuK", "schedAction": 18, "schedCron": "nIMZ9aDG", "schedRange": ["XCXZZDaB", "iKCK1U22", "u0mhlUjq"]}, {"action": 11, "resource": "kfcxBNoY", "schedAction": 95, "schedCron": "MHJ11d9P", "schedRange": ["hKOkqzb1", "ZqqxXwxw", "PAP9KNcz"]}, {"action": 27, "resource": "gvWD7whQ", "schedAction": 31, "schedCron": "U7kDeBAG", "schedRange": ["wnhWosAG", "EKQvebNr", "26WiJ1FN"]}], "roleName": "ICwLtQnm"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminCreateRoleV3' test.out

#- 185 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'ALAkWqaX' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleV3' test.out

#- 186 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId '68Ss1KDS' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteRoleV3' test.out

#- 187 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'hZZKLqKP' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "l3axyoNg"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateRoleV3' test.out

#- 188 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'kgPaeSNI' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleAdminStatusV3' test.out

#- 189 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'Qj0F1hkQ' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpdateAdminRoleStatusV3' test.out

#- 190 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'gvQWOh9P' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleAdminV3' test.out

#- 191 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'V70KSA33' \
    --after 'rGEYb0ez' \
    --before '1RAJrMoS' \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetRoleManagersV3' test.out

#- 192 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'kzKjfCDo' \
    --body '{"managers": [{"displayName": "gdrtAV70", "namespace": "VPFdA5YP", "userId": "WJlYOAko"}, {"displayName": "RDeTKB51", "namespace": "qOZhj1GK", "userId": "XIKxu73e"}, {"displayName": "Q1DrYwGi", "namespace": "NnZzuTCu", "userId": "ZejFlC7O"}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRoleManagersV3' test.out

#- 193 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId '4buDtOTh' \
    --body '{"managers": [{"displayName": "kW3pJeLn", "namespace": "kni4ryl2", "userId": "UC1DO424"}, {"displayName": "1nYILexO", "namespace": "F57c1vow", "userId": "PXB0Xc7W"}, {"displayName": "PnOhxDmk", "namespace": "OpM5bhoa", "userId": "csgy33ro"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminRemoveRoleManagersV3' test.out

#- 194 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId '8KXb4E0H' \
    --after 'n7TJieen' \
    --before 'lrS7Ajhr' \
    --limit '91' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetRoleMembersV3' test.out

#- 195 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'Vr41Q0W2' \
    --body '{"members": [{"displayName": "O0GbbQcC", "namespace": "fnOaTpyz", "userId": "UDvxG6ur"}, {"displayName": "zj3yma2t", "namespace": "NWJt0Fwz", "userId": "GRIg1NUc"}, {"displayName": "3OxHucZG", "namespace": "Ahr1fS1s", "userId": "HjPxJbE7"}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddRoleMembersV3' test.out

#- 196 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'dq9JlUwN' \
    --body '{"members": [{"displayName": "UwahL3bu", "namespace": "SuKjZEhF", "userId": "WGopogCi"}, {"displayName": "YSZldQLY", "namespace": "p4LKWWMp", "userId": "8ir0E4i9"}, {"displayName": "cGYFA5md", "namespace": "3pp2ROjt", "userId": "s0RAgg3i"}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminRemoveRoleMembersV3' test.out

#- 197 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'u9HIscPO' \
    --body '{"permissions": [{"action": 40, "resource": "sHtA3BPD", "schedAction": 4, "schedCron": "T1aaNNtX", "schedRange": ["UAQF4MiS", "YHOcVyfC", "UGxSKVYm"]}, {"action": 13, "resource": "WYMbLsBE", "schedAction": 54, "schedCron": "JJ2eWe1F", "schedRange": ["ajzThOmX", "RGFhimn1", "8VFcObeQ"]}, {"action": 16, "resource": "GW8vsYAH", "schedAction": 91, "schedCron": "oFR7jsNc", "schedRange": ["4y4tICwO", "usEaBlVv", "67txByoJ"]}]}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateRolePermissionsV3' test.out

#- 198 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'xY5r9KIg' \
    --body '{"permissions": [{"action": 49, "resource": "ShfHqhKM", "schedAction": 3, "schedCron": "dbuHlg8D", "schedRange": ["e2CRYhCH", "9gCtUoiT", "wdgX1Hwr"]}, {"action": 40, "resource": "q61WAddT", "schedAction": 41, "schedCron": "3OvXtsdH", "schedRange": ["n5Yu8eXC", "SUzRk8zL", "NjDqI1Mh"]}, {"action": 27, "resource": "SpGotk7X", "schedAction": 22, "schedCron": "32VxfcJZ", "schedRange": ["92yqdPLE", "MA9TAOCl", "faB4oxyT"]}]}' \
    > test.out 2>&1
eval_tap $? 198 'AdminAddRolePermissionsV3' test.out

#- 199 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'OwovYSlp' \
    --body '["t38kEa8d", "0IHZ2wON", "qYXeDOKO"]' \
    > test.out 2>&1
eval_tap $? 199 'AdminDeleteRolePermissionsV3' test.out

#- 200 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '69' \
    --resource 'vG9A2UMz' \
    --roleId '8nfXEHzJ' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteRolePermissionV3' test.out

#- 201 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 201 'AdminGetMyUserV3' test.out

#- 202 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'YBvH6K3W' \
    --extendExp  \
    --redirectUri 'h4m0T7vU' \
    --password 'mGWNkmFq' \
    --requestId 'sz64ybr0' \
    --userName 'hHuDqtM8' \
    > test.out 2>&1
eval_tap $? 202 'UserAuthenticationV3' test.out

#- 203 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'S7Oce4pA' \
    --linkingToken '6CBElvWs' \
    --password 'fzw5V90c' \
    --username 'SLMWVYfM' \
    > test.out 2>&1
eval_tap $? 203 'AuthenticationWithPlatformLinkV3' test.out

#- 204 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'APvfxAjm' \
    > test.out 2>&1
eval_tap $? 204 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 205 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'utbzELXr' \
    > test.out 2>&1
eval_tap $? 205 'RequestOneTimeLinkingCodeV3' test.out

#- 206 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'DyD4FqEB' \
    > test.out 2>&1
eval_tap $? 206 'ValidateOneTimeLinkingCodeV3' test.out

#- 207 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --clientId 'BnEEcn6K' \
    --oneTimeLinkCode 'RgO9RQ7q' \
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
    --clientId 'IltHNNhm' \
    > test.out 2>&1
eval_tap $? 210 'RequestGameTokenCodeResponseV3' test.out

#- 211 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0UvMzczK' \
    --userId 'TiuLJBul' \
    > test.out 2>&1
eval_tap $? 211 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 212 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eDiKpkFt' \
    > test.out 2>&1
eval_tap $? 212 'RevokeUserV3' test.out

#- 213 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'YzCOILLM' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'NW9wk5pQ' \
    --redirectUri '0srAfJ4P' \
    --scope 'P0qGiUi0' \
    --state 'SZWfNsVT' \
    --targetAuthPage 'nUOS2aMd' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'ZyF2nTIc' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 213 'AuthorizeV3' test.out

#- 214 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'AaV6ead6' \
    > test.out 2>&1
eval_tap $? 214 'TokenIntrospectionV3' test.out

#- 215 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 215 'GetJWKSV3' test.out

#- 216 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'mZqJROAD' \
    --factor 'O015743t' \
    --mfaToken 'cKxamPNU' \
    > test.out 2>&1
eval_tap $? 216 'SendMFAAuthenticationCode' test.out

#- 217 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'K7Ax3v8N' \
    --mfaToken '7XtArPok' \
    > test.out 2>&1
eval_tap $? 217 'Change2faMethod' test.out

#- 218 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'OLmqaSte' \
    --factor 'ozdOuKGp' \
    --mfaToken 'SyEpwllK' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 218 'Verify2faCode' test.out

#- 219 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tVT2xBgh' \
    --userId 'EKctg2gd' \
    > test.out 2>&1
eval_tap $? 219 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 220 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'zoneMN2j' \
    --clientId 'V7lpjXQ6' \
    --redirectUri 'dn2ftyaH' \
    --requestId 'lpRHwVxb' \
    > test.out 2>&1
eval_tap $? 220 'AuthCodeRequestV3' test.out

#- 221 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'p7vaOjUR' \
    --clientId '8fWQL6mn' \
    --createHeadless  \
    --deviceId 'hrrHrvFf' \
    --macAddress 'mzzPvUQ6' \
    --platformToken 'mJqx6aJu' \
    > test.out 2>&1
eval_tap $? 221 'PlatformTokenGrantV3' test.out

#- 222 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 222 'GetRevocationListV3' test.out

#- 223 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'OdnXrARE' \
    > test.out 2>&1
eval_tap $? 223 'TokenRevocationV3' test.out

#- 224 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'YeATKXXe' \
    --code 'eMksitww' \
    --codeVerifier 'hYXSRlCd' \
    --extendExp  \
    --password 'W0kxl5VO' \
    --redirectUri 'Rg4fERYA' \
    --refreshToken 'yBrRotrA' \
    --username '3sV0cPHv' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 224 'TokenGrantV3' test.out

#- 225 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'lXaPPr1w' \
    > test.out 2>&1
eval_tap $? 225 'VerifyTokenV3' test.out

#- 226 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 't6E2NYbm' \
    --code 'bFZWnxaZ' \
    --error 'V11ZKrz2' \
    --openidAssocHandle 'RDKclK32' \
    --openidClaimedId 'FOmdWIVj' \
    --openidIdentity 'x3IhbczH' \
    --openidMode 'vmTuYhZs' \
    --openidNs 'ViehShWE' \
    --openidOpEndpoint 'pEvNgWPN' \
    --openidResponseNonce 'gYMP0DnP' \
    --openidReturnTo 'rI8rAz6j' \
    --openidSig '7xSeE9JP' \
    --openidSigned 'MpFvpup4' \
    --state 'lpR6YBV6' \
    > test.out 2>&1
eval_tap $? 226 'PlatformAuthenticationV3' test.out

#- 227 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'DGvY69ya' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetInputValidations' test.out

#- 228 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'vZE2pPne' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 228 'PublicGetCountryAgeRestrictionV3' test.out

#- 229 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 229 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 230 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'rHlICeqj' \
    > test.out 2>&1
eval_tap $? 230 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 231 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VEJCxAFK' \
    --body '{"platformUserIds": ["rGRu37fD", "Udpl0L6g", "vLBDovkO"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 232 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '195oa8TX' \
    --platformUserId 'DxHdazmN' \
    > test.out 2>&1
eval_tap $? 232 'PublicGetUserByPlatformUserIDV3' test.out

#- 233 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'gBTMaxMN' \
    > test.out 2>&1
eval_tap $? 233 'PublicGetAsyncStatus' test.out

#- 234 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'CRrzgpVw' \
    --limit '33' \
    --offset '12' \
    --query 'gm8VLG7H' \
    > test.out 2>&1
eval_tap $? 234 'PublicSearchUserV3' test.out

#- 235 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "kkwiIkPw", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "LNv5V02f", "policyId": "beUeiyF9", "policyVersionId": "oRixMLqD"}, {"isAccepted": false, "localizedPolicyVersionId": "ixNfgvSf", "policyId": "jKe6OEkz", "policyVersionId": "EOHns7v9"}, {"isAccepted": true, "localizedPolicyVersionId": "FIOaGWNU", "policyId": "UIDQeZw7", "policyVersionId": "nUiA1Vi9"}], "authType": "y0fhwiEb", "code": "f9OCOR8D", "country": "lVgpFkoJ", "dateOfBirth": "fzgUFWJI", "displayName": "VOWpOpwx", "emailAddress": "X3cGDD5w", "password": "vphbOtsb", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 235 'PublicCreateUserV3' test.out

#- 236 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'FqDU71uC' \
    --query 'AElhFA56' \
    > test.out 2>&1
eval_tap $? 236 'CheckUserAvailability' test.out

#- 237 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["r6PnE0W3", "JZ3uuEXX", "ysbpWTwD"]}' \
    > test.out 2>&1
eval_tap $? 237 'PublicBulkGetUsers' test.out

#- 238 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "n2DqPtvl", "languageTag": "dSS1rSnJ"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicSendRegistrationCode' test.out

#- 239 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "SY4NqhVO", "emailAddress": "BMJbC4K7"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicVerifyRegistrationCode' test.out

#- 240 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "DC3axAkS", "languageTag": "Hdvw6uq4"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicForgotPasswordV3' test.out

#- 241 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'PPYYevWb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'GetAdminInvitationV3' test.out

#- 242 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId '99ROBcbX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "oklR5OzX", "policyId": "G57fC1Tz", "policyVersionId": "Hr1xqIGP"}, {"isAccepted": false, "localizedPolicyVersionId": "HDRuRNYN", "policyId": "z5UX1D1O", "policyVersionId": "Rt8WM2Y9"}, {"isAccepted": false, "localizedPolicyVersionId": "WyKSvziv", "policyId": "ndJItTkA", "policyVersionId": "8Uk1gMf5"}], "authType": "EMAILPASSWD", "country": "0gdSqd0U", "dateOfBirth": "ZVjnM0QF", "displayName": "OBwzUzna", "password": "OX09BXqk", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 242 'CreateUserFromInvitationV3' test.out

#- 243 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "H8jiVhUr", "country": "emhokJNO", "dateOfBirth": "hwzvLgaJ", "displayName": "1KFdghui", "languageTag": "PoavOghe", "userName": "ZQ6fSJuB"}' \
    > test.out 2>&1
eval_tap $? 243 'UpdateUserV3' test.out

#- 244 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "Xq0FFBm1", "country": "z43A41hf", "dateOfBirth": "RSvP6k3J", "displayName": "cR60w4Ue", "languageTag": "cKa0aPw6", "userName": "0qtG99TP"}' \
    > test.out 2>&1
eval_tap $? 244 'PublicPartialUpdateUserV3' test.out

#- 245 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "tQYhbsUx", "emailAddress": "AJF3ilmx", "languageTag": "NJ3NP54G"}' \
    > test.out 2>&1
eval_tap $? 245 'PublicSendVerificationCodeV3' test.out

#- 246 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "4MDCv9tl", "contactType": "NK2G4hWw", "languageTag": "JR0meeuR", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 246 'PublicUserVerificationV3' test.out

#- 247 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "BYElJFUp", "country": "3u1a0S7Q", "dateOfBirth": "8jllvE3g", "displayName": "ECtGE8zc", "emailAddress": "kNVZoDih", "password": "62uDcAya", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 247 'PublicUpgradeHeadlessAccountV3' test.out

#- 248 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "61k3plZC", "password": "dpfI4ot0"}' \
    > test.out 2>&1
eval_tap $? 248 'PublicVerifyHeadlessAccountV3' test.out

#- 249 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "vdstETTN", "newPassword": "fd6xfy6u", "oldPassword": "Dgz77poz"}' \
    > test.out 2>&1
eval_tap $? 249 'PublicUpdatePasswordV3' test.out

#- 250 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'QBDwQgv6' \
    > test.out 2>&1
eval_tap $? 250 'PublicCreateJusticeUser' test.out

#- 251 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RpfcDKh9' \
    --redirectUri 'GS8EALXB' \
    --ticket 'ilugtf2J' \
    > test.out 2>&1
eval_tap $? 251 'PublicPlatformLinkV3' test.out

#- 252 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'T0W87wNu' \
    --body '{"platformNamespace": "99atQsjt"}' \
    > test.out 2>&1
eval_tap $? 252 'PublicPlatformUnlinkV3' test.out

#- 253 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'EWkxl3QA' \
    > test.out 2>&1
eval_tap $? 253 'PublicPlatformUnlinkAllV3' test.out

#- 254 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LDNoE1K3' \
    --ticket 'F1k2CKtP' \
    > test.out 2>&1
eval_tap $? 254 'PublicForcePlatformLinkV3' test.out

#- 255 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'volpnvSE' \
    --clientId 'zY3XimYX' \
    --redirectUri 'Wkwc0WL7' \
    > test.out 2>&1
eval_tap $? 255 'PublicWebLinkPlatform' test.out

#- 256 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sEVdfW7k' \
    --state 'll9PPRli' \
    > test.out 2>&1
eval_tap $? 256 'PublicWebLinkPlatformEstablish' test.out

#- 257 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "NoxYt6JM", "emailAddress": "lHL89QWc", "newPassword": "iTU5b2vj"}' \
    > test.out 2>&1
eval_tap $? 257 'ResetPasswordV3' test.out

#- 258 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uypoR9F4' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetUserByUserIdV3' test.out

#- 259 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EwyfKbBV' \
    --activeOnly  \
    --after 'Cnru1xa5' \
    --before 'bK6KXDKq' \
    --limit '14' \
    > test.out 2>&1
eval_tap $? 259 'PublicGetUserBanHistoryV3' test.out

#- 260 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bVg9Htez' \
    > test.out 2>&1
eval_tap $? 260 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 261 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TBSEky4H' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetUserInformationV3' test.out

#- 262 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Joj8tAom' \
    --after '0.7788482305922084' \
    --before '0.5594115674832476' \
    --limit '63' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetUserLoginHistoriesV3' test.out

#- 263 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EzSW6aBi' \
    --after 'EU4KVlHW' \
    --before '3S4ANxFw' \
    --limit '8' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetUserPlatformAccountsV3' test.out

#- 264 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'y56H2ax6' \
    > test.out 2>&1
eval_tap $? 264 'PublicListJusticePlatformAccountsV3' test.out

#- 265 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '5BtMX6UJ' \
    --body '{"platformId": "Ki5Ls28n", "platformUserId": "wtItOxhd"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicLinkPlatformAccount' test.out

#- 266 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'pWB0LBF5' \
    --body '{"chosenNamespaces": ["KBvgLTbQ", "3llfghxq", "zJt5MWTq"], "requestId": "YH5PFqb3"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicForceLinkPlatformWithProgression' test.out

#- 267 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RdgXL39J' \
    > test.out 2>&1
eval_tap $? 267 'PublicGetPublisherUserV3' test.out

#- 268 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ntmEuB0D' \
    --password 'c7rBfzzu' \
    > test.out 2>&1
eval_tap $? 268 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 269 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after '3CyC38Jj' \
    --before 'VC9mjRsj' \
    --isWildcard  \
    --limit '64' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetRolesV3' test.out

#- 270 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'W0RHdhu3' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetRoleV3' test.out

#- 271 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 271 'PublicGetMyUserV3' test.out

#- 272 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'Qmipg9mf' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 273 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["qvtDl59i", "oFZsHov2", "BC51F0Ro"], "oneTimeLinkCode": "qZ0LBeoO"}' \
    > test.out 2>&1
eval_tap $? 273 'LinkHeadlessAccountToMyAccountV3' test.out

#- 274 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "fEZNmUsq"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicSendVerificationLinkV3' test.out

#- 275 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'JUA2SwmG' \
    > test.out 2>&1
eval_tap $? 275 'PublicVerifyUserByLinkV3' test.out

#- 276 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId '6FaC9vwY' \
    --code 'y1zaddJC' \
    --error 'QuPbPB5B' \
    --state 'YxmsjAki' \
    > test.out 2>&1
eval_tap $? 276 'PlatformAuthenticateSAMLV3Handler' test.out

#- 277 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'zqV1s6xD' \
    --payload 'de6eFDBj' \
    > test.out 2>&1
eval_tap $? 277 'LoginSSOClient' test.out

#- 278 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'UuFTmCuQ' \
    > test.out 2>&1
eval_tap $? 278 'LogoutSSOClient' test.out

#- 279 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'KQg9r4E6' \
    > test.out 2>&1
eval_tap $? 279 'RequestGameTokenResponseV3' test.out

#- 280 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vk4zQ9R2' \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDevicesByUserV4' test.out

#- 281 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'u0jNGDVM' \
    --endDate 'nGvbo1pV' \
    --limit '23' \
    --offset '14' \
    --startDate 'HbuSdHDI' \
    > test.out 2>&1
eval_tap $? 281 'AdminGetBannedDevicesV4' test.out

#- 282 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IBmr3oSI' \
    > test.out 2>&1
eval_tap $? 282 'AdminGetUserDeviceBansV4' test.out

#- 283 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "T98xNTyg", "deviceId": "cmAaXwzD", "deviceType": "ICpmVrAE", "enabled": false, "endDate": "KAVCJEw6", "ext": {"9JsCalQe": {}, "G0BYQttt": {}, "OYmmLlAz": {}}, "reason": "8Vli68mB"}' \
    > test.out 2>&1
eval_tap $? 283 'AdminBanDeviceV4' test.out

#- 284 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'FX2jNeZY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'AdminGetDeviceBanV4' test.out

#- 285 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'gDXrD6XO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 285 'AdminUpdateDeviceBanV4' test.out

#- 286 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'ZEpnwAQy' \
    --startDate 'ymYAxQMb' \
    --deviceType 'Qr7EaqBQ' \
    > test.out 2>&1
eval_tap $? 286 'AdminGenerateReportV4' test.out

#- 287 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 287 'AdminGetDeviceTypesV4' test.out

#- 288 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'jJPEFNrP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 288 'AdminGetDeviceBansV4' test.out

#- 289 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'oXYpw8ci' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 289 'AdminDecryptDeviceV4' test.out

#- 290 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'Gp9UjSub' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'AdminUnbanDeviceV4' test.out

#- 291 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'RWT0a7It' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'AdminGetUsersByDeviceV4' test.out

#- 292 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 66}' \
    > test.out 2>&1
eval_tap $? 292 'AdminCreateTestUsersV4' test.out

#- 293 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["erZZC0T5", "53F89fmO", "aqzJrnLI"]}' \
    > test.out 2>&1
eval_tap $? 293 'AdminBulkCheckValidUserIDV4' test.out

#- 294 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '9jqiPWps' \
    --body '{"avatarUrl": "YphpdcCc", "country": "5UY339F3", "dateOfBirth": "4GqrdRWA", "displayName": "1TS7qV4p", "languageTag": "hYR3RMFT", "userName": "qpEioUm2"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminUpdateUserV4' test.out

#- 295 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dn1Seeot' \
    --body '{"code": "UJUG7JOP", "emailAddress": "vC4QPmPU"}' \
    > test.out 2>&1
eval_tap $? 295 'AdminUpdateUserEmailAddressV4' test.out

#- 296 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zONLMvvz' \
    > test.out 2>&1
eval_tap $? 296 'AdminDisableUserMFAV4' test.out

#- 297 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DOA7OTYE' \
    > test.out 2>&1
eval_tap $? 297 'AdminListUserRolesV4' test.out

#- 298 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'govRcXsw' \
    --body '{"assignedNamespaces": ["bHJXtRAH", "08eZ4SsD", "KCR6MUra"], "roleId": "AaebqyJ1"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateUserRoleV4' test.out

#- 299 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '7aCIgVot' \
    --body '{"assignedNamespaces": ["VnqVDRaN", "2ZdB2H6g", "Uu2UPEgq"], "roleId": "CJzgHZO3"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminAddUserRoleV4' test.out

#- 300 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gvf3QH8m' \
    --body '{"assignedNamespaces": ["gxB1iUKM", "zLkrzbka", "8nqqJJSl"], "roleId": "pP1TNTG0"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminRemoveUserRoleV4' test.out

#- 301 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '41' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 301 'AdminGetRolesV4' test.out

#- 302 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "rkjyE5tQ"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminCreateRoleV4' test.out

#- 303 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'RZ6lflyS' \
    > test.out 2>&1
eval_tap $? 303 'AdminGetRoleV4' test.out

#- 304 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'OfhPJoZq' \
    > test.out 2>&1
eval_tap $? 304 'AdminDeleteRoleV4' test.out

#- 305 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'nh9hkzwh' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "aQfimmjL"}' \
    > test.out 2>&1
eval_tap $? 305 'AdminUpdateRoleV4' test.out

#- 306 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'l1lv6ARi' \
    --body '{"permissions": [{"action": 59, "resource": "7RDJzMqK", "schedAction": 39, "schedCron": "yCBeSfvW", "schedRange": ["tZUIojTq", "N85dHa4g", "oxLzHwbL"]}, {"action": 62, "resource": "rauyI6xH", "schedAction": 4, "schedCron": "G21PcNWb", "schedRange": ["yMpPsT7f", "O49i8itD", "SIdkSPKR"]}, {"action": 26, "resource": "u3RGMLMa", "schedAction": 29, "schedCron": "FyoJaqwR", "schedRange": ["W4CNk0Pz", "PUSLzUBl", "D1B6R6yP"]}]}' \
    > test.out 2>&1
eval_tap $? 306 'AdminUpdateRolePermissionsV4' test.out

#- 307 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'AM96eT2G' \
    --body '{"permissions": [{"action": 0, "resource": "CpsiR8Xa", "schedAction": 28, "schedCron": "U6MLgWbP", "schedRange": ["7MavSU6X", "SfOxpF4g", "ZGAm3Go9"]}, {"action": 2, "resource": "EYkaMbti", "schedAction": 69, "schedCron": "irmmBlhU", "schedRange": ["KZy0khoW", "gXw7LPQs", "BZOQvy3H"]}, {"action": 58, "resource": "tPAa66bS", "schedAction": 26, "schedCron": "BWIkzrWA", "schedRange": ["PQ0jDTEW", "re7AwcUw", "kAHeQh1Q"]}]}' \
    > test.out 2>&1
eval_tap $? 307 'AdminAddRolePermissionsV4' test.out

#- 308 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'Kh4e6HiW' \
    --body '["RNfu4WrU", "3wbApms7", "FCcbRuVX"]' \
    > test.out 2>&1
eval_tap $? 308 'AdminDeleteRolePermissionsV4' test.out

#- 309 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'PBneZJJB' \
    --after 'IKKNYYc1' \
    --before 'OHxwkX8C' \
    --limit '48' \
    > test.out 2>&1
eval_tap $? 309 'AdminListAssignedUsersV4' test.out

#- 310 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'MT9nSuZF' \
    --body '{"assignedNamespaces": ["5Kx8L0Xy", "B8iQUfB1", "aRubZS9J"], "namespace": "JK7P8XXN", "userId": "wea5YtE6"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminAssignUserToRoleV4' test.out

#- 311 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'HZg4uG99' \
    --body '{"namespace": "YMeRXBGY", "userId": "cKisVeHC"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminRevokeUserFromRoleV4' test.out

#- 312 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "5oSyNgwH", "country": "er4SgOfL", "dateOfBirth": "FeMvDX3Q", "displayName": "tQYMTOSF", "languageTag": "7wRlcNaT", "userName": "MLqfwbi4"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateMyUserV4' test.out

#- 313 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 313 'AdminDisableMyAuthenticatorV4' test.out

#- 314 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'h7WMtr5U' \
    > test.out 2>&1
eval_tap $? 314 'AdminEnableMyAuthenticatorV4' test.out

#- 315 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 315 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 316 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 316 'AdminGetMyBackupCodesV4' test.out

#- 317 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 317 'AdminGenerateMyBackupCodesV4' test.out

#- 318 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 318 'AdminDisableMyBackupCodesV4' test.out

#- 319 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 319 'AdminDownloadMyBackupCodesV4' test.out

#- 320 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 320 'AdminEnableMyBackupCodesV4' test.out

#- 321 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 321 'AdminSendMyMFAEmailCodeV4' test.out

#- 322 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 322 'AdminDisableMyEmailV4' test.out

#- 323 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'jQj5TSuw' \
    > test.out 2>&1
eval_tap $? 323 'AdminEnableMyEmailV4' test.out

#- 324 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 324 'AdminGetMyEnabledFactorsV4' test.out

#- 325 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'AK9eGUnU' \
    > test.out 2>&1
eval_tap $? 325 'AdminMakeFactorMyDefaultV4' test.out

#- 326 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["YRrVjhcY", "hIrVAH34", "DjpS32DX"], "emailAddresses": ["1aSQRF7i", "UB70zH6D", "Wa0S4xOX"], "isAdmin": true, "namespace": "IjWDwPwL", "roleId": "VCFIgVLK"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminInviteUserV4' test.out

#- 327 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "Ktqb5Pre", "policyId": "W4RNGSqs", "policyVersionId": "pWnHaeVG"}, {"isAccepted": false, "localizedPolicyVersionId": "VxfU4S3g", "policyId": "evtX8Udw", "policyVersionId": "BkkKre6J"}, {"isAccepted": true, "localizedPolicyVersionId": "xdMk6EYx", "policyId": "sxtKEpmI", "policyVersionId": "KRla37hA"}], "authType": "EMAILPASSWD", "country": "hMLOPOxL", "dateOfBirth": "kU6cBPyY", "displayName": "fzPDqa3M", "emailAddress": "4d6oA1Id", "password": "Ajp6zU0d", "passwordMD5Sum": "rAVT8mCH", "username": "U93smbrd", "verified": true}' \
    > test.out 2>&1
eval_tap $? 327 'PublicCreateTestUserV4' test.out

#- 328 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "x4Sbv3GJ", "policyId": "ywFBLaWS", "policyVersionId": "rq0SiIyM"}, {"isAccepted": false, "localizedPolicyVersionId": "LXCPKDq6", "policyId": "E7FnjGEL", "policyVersionId": "TlRzl4kh"}, {"isAccepted": false, "localizedPolicyVersionId": "I3oqAb07", "policyId": "cDKrDoLP", "policyVersionId": "PIzdZX0b"}], "authType": "EMAILPASSWD", "code": "UGg8f6Bi", "country": "Zuon2alY", "dateOfBirth": "QoKpvRvp", "displayName": "5LyAlkuJ", "emailAddress": "QRTnCal8", "password": "1dR5vrJM", "passwordMD5Sum": "ujEvzrLG", "reachMinimumAge": true, "username": "jxGOQcgB"}' \
    > test.out 2>&1
eval_tap $? 328 'PublicCreateUserV4' test.out

#- 329 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'oXdo5c3A' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "V1fxv76i", "policyId": "9YltouhZ", "policyVersionId": "zinS2fZZ"}, {"isAccepted": false, "localizedPolicyVersionId": "jr8Knefk", "policyId": "4ckQyze1", "policyVersionId": "MauqQctM"}, {"isAccepted": false, "localizedPolicyVersionId": "2GwPqLw2", "policyId": "PxincdD0", "policyVersionId": "Uedawxhl"}], "authType": "EMAILPASSWD", "country": "2ZfCK3jY", "dateOfBirth": "lg6aLzhU", "displayName": "bwglcvfE", "password": "k4hyq51l", "reachMinimumAge": true, "username": "WgsN0ek5"}' \
    > test.out 2>&1
eval_tap $? 329 'CreateUserFromInvitationV4' test.out

#- 330 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "Ieyk1DlY", "country": "hA6saU0M", "dateOfBirth": "qh1lMWfF", "displayName": "8vOxqn9q", "languageTag": "G6M3mi4N", "userName": "EY9xx81C"}' \
    > test.out 2>&1
eval_tap $? 330 'PublicUpdateUserV4' test.out

#- 331 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "CWmcyRlW", "emailAddress": "IIjdtPqR"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicUpdateUserEmailAddressV4' test.out

#- 332 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Gtgk8xxp", "country": "UesDjvZf", "dateOfBirth": "O0kprHp2", "displayName": "hE5KzTsA", "emailAddress": "GySfMl5G", "password": "UnFRH7RR", "reachMinimumAge": false, "username": "52aUlzB2", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 332 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 333 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "B9V3Ko6O", "password": "2gKGXrsv", "username": "o8vnh0H4"}' \
    > test.out 2>&1
eval_tap $? 333 'PublicUpgradeHeadlessAccountV4' test.out

#- 334 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 334 'PublicDisableMyAuthenticatorV4' test.out

#- 335 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'IjAvMy79' \
    > test.out 2>&1
eval_tap $? 335 'PublicEnableMyAuthenticatorV4' test.out

#- 336 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 336 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 337 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 337 'PublicGetMyBackupCodesV4' test.out

#- 338 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 338 'PublicGenerateMyBackupCodesV4' test.out

#- 339 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 339 'PublicDisableMyBackupCodesV4' test.out

#- 340 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 340 'PublicDownloadMyBackupCodesV4' test.out

#- 341 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 341 'PublicEnableMyBackupCodesV4' test.out

#- 342 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'MzDa5pKt' \
    > test.out 2>&1
eval_tap $? 342 'PublicRemoveTrustedDeviceV4' test.out

#- 343 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 343 'PublicSendMyMFAEmailCodeV4' test.out

#- 344 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 344 'PublicDisableMyEmailV4' test.out

#- 345 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code '4qIpnS2l' \
    > test.out 2>&1
eval_tap $? 345 'PublicEnableMyEmailV4' test.out

#- 346 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'PublicGetMyEnabledFactorsV4' test.out

#- 347 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'IEBtV1S3' \
    > test.out 2>&1
eval_tap $? 347 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE