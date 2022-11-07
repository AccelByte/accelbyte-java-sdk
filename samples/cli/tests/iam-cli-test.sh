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
echo "1..333"

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
    --body '[{"field": "LMoyCw78", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": true, "blockedWord": ["cF48Mru6", "wZ9AxaG2", "FSlPvZpq"], "description": [{"language": "l999OlpJ", "message": ["uwXV6nbK", "deWb6Y8f", "nDBnf7Wv"]}, {"language": "YPnxxECQ", "message": ["BSOr5NcL", "W0LTKtvN", "jd7loCQm"]}, {"language": "OpeDloFI", "message": ["GFY3BBm8", "oyNUXE6x", "rbrK1ZUC"]}], "isCustomRegex": true, "letterCase": "VZArKrCJ", "maxLength": 58, "maxRepeatingAlphaNum": 66, "maxRepeatingSpecialCharacter": 63, "minCharType": 73, "minLength": 95, "regex": "6rv2Me57", "specialCharacterLocation": "L2ePfGRI", "specialCharacters": ["fAJqDaem", "rVMXV4fV", "m0FA8pJV"]}}, {"field": "vXNtfSgY", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "blockedWord": ["Khc5DCoJ", "uKOcwJlS", "wg0znJBo"], "description": [{"language": "OJgkAlo8", "message": ["Vs6He47e", "WyiT3ixC", "ot2Qitz4"]}, {"language": "sG17H38u", "message": ["NDkJegi0", "8z4D9WDv", "0CoGuT9A"]}, {"language": "qkM1spcU", "message": ["YZ5XDEqD", "EOCFOIF3", "pd2BsKUw"]}], "isCustomRegex": false, "letterCase": "Dqaa4Iki", "maxLength": 75, "maxRepeatingAlphaNum": 8, "maxRepeatingSpecialCharacter": 22, "minCharType": 36, "minLength": 53, "regex": "fVkjPGaE", "specialCharacterLocation": "O4bT3dU5", "specialCharacters": ["KkPCHFWR", "0TcFlSev", "W78zP0Kf"]}}, {"field": "zVfDWu9z", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "blockedWord": ["TfkqPVpl", "ciLTEaWx", "8Uvraxdo"], "description": [{"language": "OkwInLuY", "message": ["nADRX8jZ", "xJwFHoJw", "fvEV3Xsp"]}, {"language": "HQlEXgm5", "message": ["luGBtl1L", "ygiyYJtg", "ao3tuvQW"]}, {"language": "EpAV2fxv", "message": ["N6uKnnqO", "Pk9WNDKz", "gR8qmTFz"]}], "isCustomRegex": false, "letterCase": "2nhofxFl", "maxLength": 62, "maxRepeatingAlphaNum": 85, "maxRepeatingSpecialCharacter": 34, "minCharType": 47, "minLength": 46, "regex": "3Ry5CD0o", "specialCharacterLocation": "CsBc8kw6", "specialCharacters": ["kaEHb818", "Sc56CeCc", "cCS6349f"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field '8KIvqGSX' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'uWmH7IZw' \
    --before 'zdq2k6Y0' \
    --limit '54' \
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
    --body '{"ageRestriction": 69, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'W6zGswHD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 30}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'buVfRxhZ' \
    --limit '64' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "FiYMWO3p", "comment": "TjrDOGyd", "endDate": "SMC5yMoT", "reason": "b0oLpE7R", "skipNotif": false, "userIds": ["Rwe15AHp", "bSTgpiuM", "ZLXmdBZH"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "YgDruZBZ", "userId": "shxZbIWx"}, {"banId": "7qvbbHwH", "userId": "xXCMiDwJ"}, {"banId": "7tKScCgB", "userId": "68N8j7sg"}]}' \
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
    --limit '10' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["zZfXmtew", "t7tCqyuQ", "hw3XSyJI"], "baseUri": "YNNzOrq0", "clientId": "iwVx1ST7", "clientName": "K2sS5Bkt", "clientPermissions": [{"action": 31, "resource": "gagTXM9Y", "schedAction": 38, "schedCron": "fyigcKPg", "schedRange": ["XBwLT99w", "S1Tks0YS", "kBhysA90"]}, {"action": 4, "resource": "UvIYwrOS", "schedAction": 30, "schedCron": "fh1Y6iPs", "schedRange": ["kXzGOjWQ", "QdLabAE9", "mg9LsbCJ"]}, {"action": 91, "resource": "g1gRYnnJ", "schedAction": 71, "schedCron": "lb3BX8MJ", "schedRange": ["gIAoMvnS", "NZVOEOEa", "bDSBIWrj"]}], "clientPlatform": "peQLvNgg", "deletable": true, "namespace": "e4zCsSuC", "oauthAccessTokenExpiration": 37, "oauthClientType": "b1xway27", "oauthRefreshTokenExpiration": 29, "redirectUri": "axTeegdl", "secret": "V0AYzvDe", "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'gGnjSqMW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'B6J6EREm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'i7T81Ada' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["09stG4me", "rww5HW6k", "wf4MUi6c"], "baseUri": "kzYdv1zF", "clientName": "GFtiS9UU", "clientPermissions": [{"action": 5, "resource": "SgHKOjiQ", "schedAction": 27, "schedCron": "upZ73UUR", "schedRange": ["jDPo48n7", "BWqbFRcP", "YqivL2s7"]}, {"action": 34, "resource": "kYsahx1E", "schedAction": 100, "schedCron": "TnGPuWLL", "schedRange": ["e4sPcBFL", "8K5KAOYl", "jIq6PDYR"]}, {"action": 5, "resource": "5wjoLcDe", "schedAction": 84, "schedCron": "MBOgSooj", "schedRange": ["r3TCDVA4", "Zp8EJhVT", "wfOFq5Cn"]}], "clientPlatform": "7oOx8mT8", "deletable": true, "namespace": "vCEq4Arp", "oauthAccessTokenExpiration": 56, "oauthRefreshTokenExpiration": 98, "redirectUri": "wTGnPk8J", "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'fKHDjXCR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 71, "resource": "SZFhMcHX"}, {"action": 29, "resource": "eaA4ltgQ"}, {"action": 14, "resource": "HaX35iDN"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'Nw4QHUox' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 97, "resource": "EugDfRAL"}, {"action": 26, "resource": "pVRgeoja"}, {"action": 98, "resource": "6zrsmt06"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '74' \
    --clientId 'jrPI9Sel' \
    --namespace "$AB_NAMESPACE" \
    --resource 'HyfybaTT' \
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
    --limit '65' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8ycuAmXF' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'H050tQzy' \
    --body '{"ACSURL": "dWLjPWvc", "AWSCognitoRegion": "uNw6RU7A", "AWSCognitoUserPool": "ekXAShsJ", "AllowedClients": ["yro67uel", "a4K2SxlT", "Z4hnd54j"], "AppId": "DRtt0beY", "AuthorizationEndpoint": "ZLEkBtB0", "ClientId": "5zpZfQdP", "Environment": "DIju4wZg", "FederationMetadataURL": "UcJ7EjLn", "GenericOauthFlow": true, "IsActive": false, "Issuer": "29z7TB5d", "JWKSEndpoint": "m8dIYOgK", "KeyID": "bPHazxeE", "NetflixCertificates": {"encryptedPrivateKey": "AwuDkTf5", "encryptedPrivateKeyName": "jqrTSGzM", "publicCertificate": "lwiaZWnk", "publicCertificateName": "72AURfXE", "rootCertificate": "hm4dKYRp", "rootCertificateName": "ln5Pkj68"}, "OrganizationId": "KyGgWWzs", "PlatformName": "3avMgNdn", "RedirectUri": "2a5OEvkF", "RegisteredDomains": [{"affectedClientIDs": ["RP9RjmxM", "px7LVyrI", "a7C7DhRn"], "domain": "4sU9rSYY", "namespaces": ["25MFxjxs", "laGqASJW", "RUpJ5fhD"], "roleId": "nxtkqVyO"}, {"affectedClientIDs": ["0av7zBT0", "iw7BT542", "UWZpBKkA"], "domain": "ZCvVtjXl", "namespaces": ["fWDQl0s9", "uEAmpzSH", "5Zcj9Or5"], "roleId": "mFLw3YAU"}, {"affectedClientIDs": ["qxuzPgD3", "39riSSbu", "4xBCGwk9"], "domain": "BFCAuHPz", "namespaces": ["axxnBCHL", "RYzCPFTE", "SkSI6P23"], "roleId": "EpUzUQ4K"}], "Secret": "RISXJ8b5", "TeamID": "48zIV1zC", "TokenAuthenticationType": "I5Xp0uah", "TokenClaimsMapping": {"ydTbpok9": "NJr3VuQN", "UuwDDcha": "QYlxAM9I", "BnA6QD2j": "kAnUDvFY"}, "TokenEndpoint": "kQu6Yn73", "scopes": ["QD0SERC3", "bfF0vGxJ", "tN5YV7w2"]}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ft4vy0UZ' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KOwXgQUu' \
    --body '{"ACSURL": "BIeDMkYk", "AWSCognitoRegion": "dKtr5qbb", "AWSCognitoUserPool": "FDXkeZYt", "AllowedClients": ["XwOpkQgB", "ScVm5I7j", "qXcLq5Cd"], "AppId": "mM6lI1PE", "AuthorizationEndpoint": "HvQr6kog", "ClientId": "Yf8QMv8N", "Environment": "KS9wd3rQ", "FederationMetadataURL": "RtvOmBNt", "GenericOauthFlow": false, "IsActive": false, "Issuer": "kouTjDaT", "JWKSEndpoint": "he1vyFR2", "KeyID": "3KPvDlhF", "NetflixCertificates": {"encryptedPrivateKey": "cA5ZDxxX", "encryptedPrivateKeyName": "59hddOUo", "publicCertificate": "OwCkP9Ut", "publicCertificateName": "JP5tisPQ", "rootCertificate": "RJ1JdeIl", "rootCertificateName": "KRRDSUTc"}, "OrganizationId": "D0ERxWSw", "PlatformName": "gmhztrkW", "RedirectUri": "Za2XtAT6", "RegisteredDomains": [{"affectedClientIDs": ["lEUf3WZ6", "byOlRC7F", "ZbrOWyXh"], "domain": "7WBWeUCC", "namespaces": ["vGYcw93A", "aGC3rs6B", "f3ePoHAJ"], "roleId": "cBQ3lrvJ"}, {"affectedClientIDs": ["TFqtLV7x", "HIHjYF70", "GrUFIDkb"], "domain": "tglL3hXc", "namespaces": ["tbTa3Nd8", "jvElADE5", "7K9fWRvQ"], "roleId": "xYHiuEND"}, {"affectedClientIDs": ["aDAVyLJE", "7gihwgKl", "mCiRUOu8"], "domain": "jrKWeZxN", "namespaces": ["EcYxhFON", "kB6iDLyw", "WI3sjkT0"], "roleId": "SlEbGxui"}], "Secret": "jdwH6XcB", "TeamID": "Jci4WuRA", "TokenAuthenticationType": "wPDFTYVr", "TokenClaimsMapping": {"E8tRpdXv": "vfZhGzIf", "KdlOCsBI": "pYCM7vNQ", "kB9GWp1t": "MRZBXep5"}, "TokenEndpoint": "xUjxhivP", "scopes": ["MWHeeWAG", "NtRb5xxi", "5U8VscUv"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'f3F1Yv6Y' \
    --body '{"affectedClientIDs": ["bSWL1gR4", "k32BnHCU", "Iz6LTIwB"], "assignedNamespaces": ["f3ubMw9w", "3OYnvfd0", "XMn83ekQ"], "domain": "mjqILkU2", "roleId": "ipoxC079"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qgKty1Fy' \
    --body '{"domain": "EczRagPa"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '56DN6kkE' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'G6W0OESm' \
    --body '{"acsUrl": "42IN7sQU", "apiKey": "oVGmYZcl", "appId": "BzhUS6fn", "federationMetadataUrl": "zqfuhsb5", "isActive": false, "redirectUri": "iUhrIa6e", "secret": "bCywOu27", "ssoUrl": "Mpz3CbwK"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'L1inzrRW' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AobAAz4h' \
    --body '{"acsUrl": "vZffopmR", "apiKey": "6FEuextZ", "appId": "LFQ58GpK", "federationMetadataUrl": "Zu1JAFS1", "isActive": true, "redirectUri": "6cr5FXU4", "secret": "r0Fg3uJb", "ssoUrl": "KaF9K6kB"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kkbkEy4J' \
    --platformUserId 'ZT1Y7T0h' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'JdtUOJ1e' \
    --after '78' \
    --before '46' \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'IySeiKLy' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["vbzz27cs", "9rq7cVnM", "VtcOZKaW"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["YfqChq5c", "l8t1FBOG", "FtY7RvdN"], "isAdmin": false, "roles": ["78JhjqEY", "910A4CEW", "XHYNKMqd"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 146 'AdminListUsersV3' test.out

#- 147 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'Rqyebdf5' \
    --endDate 'ps0A5TU5' \
    --limit '46' \
    --offset '27' \
    --platformBy 'NRvJP7OU' \
    --platformId 'whzHb87X' \
    --query 'WQIBSNj5' \
    --startDate 'vblg6IrC' \
    > test.out 2>&1
eval_tap $? 147 'AdminSearchUserV3' test.out

#- 148 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["W71IGU8A", "CsgUw9f5", "33uoNwUj"]}' \
    > test.out 2>&1
eval_tap $? 148 'AdminGetBulkUserByEmailAddressV3' test.out

#- 149 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3N7XQrwt' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserByUserIdV3' test.out

#- 150 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GUfcOwiN' \
    --body '{"avatarUrl": "H7MuhrwS", "country": "VsMf9uLx", "dateOfBirth": "Q8WA3IgY", "displayName": "X4TyRXI4", "languageTag": "KEc1aqes", "userName": "Cjrsmq54"}' \
    > test.out 2>&1
eval_tap $? 150 'AdminUpdateUserV3' test.out

#- 151 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AdUwX0XX' \
    --activeOnly  \
    --after 'gkDgZYZc' \
    --before 'vZxHIvPh' \
    --limit '16' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserBanV3' test.out

#- 152 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BzVtrJfh' \
    --body '{"ban": "BNtVrwQ1", "comment": "XlvyhoE2", "endDate": "ZSlO6YUL", "reason": "Qk83CtNk", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 152 'AdminBanUserV3' test.out

#- 153 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'drAX1bj0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'frn596pj' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 153 'AdminUpdateUserBanV3' test.out

#- 154 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MFf2Plxg' \
    --body '{"context": "1xMQ5Puj", "emailAddress": "sOo7dIJS", "languageTag": "rdmnQrtG"}' \
    > test.out 2>&1
eval_tap $? 154 'AdminSendVerificationCodeV3' test.out

#- 155 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ARe1Is4E' \
    --body '{"Code": "hvRJC3ax", "ContactType": "xHit5b1a", "LanguageTag": "jAJ0QwlO", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 155 'AdminVerifyAccountV3' test.out

#- 156 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'bH1LAN8A' \
    > test.out 2>&1
eval_tap $? 156 'GetUserVerificationCode' test.out

#- 157 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OjwSseVp' \
    > test.out 2>&1
eval_tap $? 157 'AdminGetUserDeletionStatusV3' test.out

#- 158 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rEdaKiKp' \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 158 'AdminUpdateUserDeletionStatusV3' test.out

#- 159 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QQVFAhYC' \
    --body '{"code": "SyBU6DNB", "country": "lBebtMVd", "dateOfBirth": "19kTo8v9", "displayName": "tQBW6ie1", "emailAddress": "kYmyUIpL", "password": "2rPCOQe6", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpgradeHeadlessAccountV3' test.out

#- 160 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'I7oDQ4YK' \
    > test.out 2>&1
eval_tap $? 160 'AdminDeleteUserInformationV3' test.out

#- 161 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uabWVESF' \
    --after '0.46365412916194393' \
    --before '0.9252526522733494' \
    --limit '65' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetUserLoginHistoriesV3' test.out

#- 162 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BVZpPq4Z' \
    --body '{"languageTag": "MthESjVo", "newPassword": "082I2YN1", "oldPassword": "3peTzDTB"}' \
    > test.out 2>&1
eval_tap $? 162 'AdminResetPasswordV3' test.out

#- 163 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NOX9lJ4m' \
    --body '{"Permissions": [{"Action": 32, "Resource": "t8ZlceaM", "SchedAction": 23, "SchedCron": "IH5GVhw3", "SchedRange": ["y844HLIj", "LCd9IXSn", "a91ZKPGd"]}, {"Action": 22, "Resource": "Orq4HQtU", "SchedAction": 64, "SchedCron": "AD99NDce", "SchedRange": ["MdiBv7OZ", "Li2UxMhr", "uwXKRARJ"]}, {"Action": 27, "Resource": "0C0BbHR7", "SchedAction": 90, "SchedCron": "Dop3Bft3", "SchedRange": ["kRYHQKHZ", "2aQjA1MH", "kg53Zrh2"]}]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminUpdateUserPermissionV3' test.out

#- 164 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fIHpWLdw' \
    --body '{"Permissions": [{"Action": 6, "Resource": "isgpzgNQ", "SchedAction": 47, "SchedCron": "wfqSeqE0", "SchedRange": ["5YWWZVVK", "Lv4zYPPL", "deIRTmWM"]}, {"Action": 23, "Resource": "GWlFrKdv", "SchedAction": 2, "SchedCron": "e7O7u7NM", "SchedRange": ["4pf6X2E5", "6EZoLV1j", "NVNEQUIK"]}, {"Action": 39, "Resource": "lzHcnE8D", "SchedAction": 48, "SchedCron": "edaavLu4", "SchedRange": ["Hlf9tN3C", "G375IgUb", "95uHIfAQ"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminAddUserPermissionsV3' test.out

#- 165 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lJJ6jqix' \
    --body '[{"Action": 72, "Resource": "ScHlZs17"}, {"Action": 84, "Resource": "tfXjOWE6"}, {"Action": 30, "Resource": "VPoZvhVm"}]' \
    > test.out 2>&1
eval_tap $? 165 'AdminDeleteUserPermissionBulkV3' test.out

#- 166 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '14' \
    --namespace "$AB_NAMESPACE" \
    --resource 'vqXlX4VW' \
    --userId 'm2xeegA3' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionV3' test.out

#- 167 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VJobanxt' \
    --after '9CZDlpu4' \
    --before 'rGzehR2w' \
    --limit '34' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserPlatformAccountsV3' test.out

#- 168 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'wNwLHW1S' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetListJusticePlatformAccounts' test.out

#- 169 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '2ERXbRgr' \
    --userId '9JXE41xi' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetUserMapping' test.out

#- 170 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'yemJRYuJ' \
    --userId 'yomzhu9T' \
    > test.out 2>&1
eval_tap $? 170 'AdminCreateJusticeUser' test.out

#- 171 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'f8BkZ2PZ' \
    --body '{"platformId": "BvPui5Te", "platformUserId": "DUefxP3T"}' \
    > test.out 2>&1
eval_tap $? 171 'AdminLinkPlatformAccount' test.out

#- 172 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wkc2A3Rm' \
    --userId 'KZmMrYuF' \
    --body '{"platformNamespace": "5Q6wHAQD"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminPlatformUnlinkV3' test.out

#- 173 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'f6u3BayW' \
    --userId 'J1GNc8q1' \
    --ticket 'AIvCxVC6' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformLinkV3' test.out

#- 174 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jmybOhev' \
    --body '["ITr0VArD", "Egnpo1ag", "Ea6BM82y"]' \
    > test.out 2>&1
eval_tap $? 174 'AdminDeleteUserRolesV3' test.out

#- 175 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OsVjA9or' \
    --body '[{"namespace": "A1bI8kBA", "roleId": "jWH5wIIT"}, {"namespace": "aXGzsUgj", "roleId": "4J7znKKe"}, {"namespace": "LLen6bg3", "roleId": "8wmaIEX2"}]' \
    > test.out 2>&1
eval_tap $? 175 'AdminSaveUserRoleV3' test.out

#- 176 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'opPiRTo2' \
    --userId 'SNZnB9FR' \
    > test.out 2>&1
eval_tap $? 176 'AdminAddUserRoleV3' test.out

#- 177 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'UMeGE2YC' \
    --userId '4VJIhBn5' \
    > test.out 2>&1
eval_tap $? 177 'AdminDeleteUserRoleV3' test.out

#- 178 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dnuak1xU' \
    --body '{"enabled": false, "reason": "hdl5RF1p"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserStatusV3' test.out

#- 179 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6ypRVRBH' \
    > test.out 2>&1
eval_tap $? 179 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 180 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'Q6SKEPd7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "j62Kqd7x"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateClientSecretV3' test.out

#- 181 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'EusHsWSQ' \
    --before 'BKVtlftA' \
    --isWildcard  \
    --limit '87' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetRolesV3' test.out

#- 182 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "managers": [{"displayName": "YedoIvvV", "namespace": "Mh8v7m2y", "userId": "2RstefRN"}, {"displayName": "isIHM9ly", "namespace": "BDwzNgRa", "userId": "gF658RHw"}, {"displayName": "ti4JBvff", "namespace": "xMthIBzj", "userId": "sRUNg0ry"}], "members": [{"displayName": "ydaIHYiQ", "namespace": "QlSKLjNB", "userId": "vth87AM3"}, {"displayName": "lKhLevLQ", "namespace": "vKYdh6yg", "userId": "dv4swiyj"}, {"displayName": "mLTzL9m6", "namespace": "StV5LUQV", "userId": "hLxMdmvS"}], "permissions": [{"action": 23, "resource": "YFqwWet7", "schedAction": 81, "schedCron": "GK56gRoG", "schedRange": ["v3LAAvZK", "vEmEW5nv", "UJbQBT0r"]}, {"action": 36, "resource": "CVHXDgNJ", "schedAction": 98, "schedCron": "Vo5hcIqH", "schedRange": ["effNb2Qc", "PtRrnfCP", "cRQlu3Ce"]}, {"action": 80, "resource": "yFgaRO4R", "schedAction": 6, "schedCron": "x7kUSkwW", "schedRange": ["Y35bVG6p", "PnDSyHSD", "a943q4p7"]}], "roleName": "QDrZvdcT"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminCreateRoleV3' test.out

#- 183 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'Wh0GjVHE' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRoleV3' test.out

#- 184 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'dRjw0KDj' \
    > test.out 2>&1
eval_tap $? 184 'AdminDeleteRoleV3' test.out

#- 185 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'aksVYbFl' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "Wft7ahSY"}' \
    > test.out 2>&1
eval_tap $? 185 'AdminUpdateRoleV3' test.out

#- 186 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId '8bKYTNAM' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetRoleAdminStatusV3' test.out

#- 187 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'AX2xHXiI' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateAdminRoleStatusV3' test.out

#- 188 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'alVyKDIk' \
    > test.out 2>&1
eval_tap $? 188 'AdminRemoveRoleAdminV3' test.out

#- 189 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId '2pbiub6f' \
    --after 'whIwOw7J' \
    --before 'OMbh5Sho' \
    --limit '45' \
    > test.out 2>&1
eval_tap $? 189 'AdminGetRoleManagersV3' test.out

#- 190 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'eqJCoSQv' \
    --body '{"managers": [{"displayName": "xuI521Ms", "namespace": "fLsWO2Fb", "userId": "xQBUD1an"}, {"displayName": "yr71GP2N", "namespace": "RvipSwko", "userId": "EqNewAhI"}, {"displayName": "xGxaZOZ5", "namespace": "TDKimJvY", "userId": "gwWMo1bu"}]}' \
    > test.out 2>&1
eval_tap $? 190 'AdminAddRoleManagersV3' test.out

#- 191 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'FEclIWOd' \
    --body '{"managers": [{"displayName": "g1bTsMsR", "namespace": "2jPbbdz4", "userId": "lTTq89Ax"}, {"displayName": "emjcd603", "namespace": "84nV2tvl", "userId": "4RMj7XSq"}, {"displayName": "nMB9LlCp", "namespace": "njqWxxpd", "userId": "KvIcZbrz"}]}' \
    > test.out 2>&1
eval_tap $? 191 'AdminRemoveRoleManagersV3' test.out

#- 192 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'NZD9nYMy' \
    --after 'Caf2z9kk' \
    --before 'fh9XtKiD' \
    --limit '1' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetRoleMembersV3' test.out

#- 193 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'sfDy4KxF' \
    --body '{"members": [{"displayName": "uBDJrK3x", "namespace": "WIiOFjEs", "userId": "OTVpvw29"}, {"displayName": "oeAeNSZR", "namespace": "MHqqCZOq", "userId": "z8JvdHFW"}, {"displayName": "lcVICfb7", "namespace": "cjVgubgi", "userId": "AQ3kXOTk"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminAddRoleMembersV3' test.out

#- 194 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'vgpbnGMD' \
    --body '{"members": [{"displayName": "cryeATkk", "namespace": "J7DqYY5t", "userId": "F28Fukt8"}, {"displayName": "Vlsjttxw", "namespace": "4JbaPqWs", "userId": "JltNGL0w"}, {"displayName": "wHJUWrQL", "namespace": "lNLdeSw3", "userId": "TIpCiCiW"}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminRemoveRoleMembersV3' test.out

#- 195 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId '5ZABZSRV' \
    --body '{"permissions": [{"action": 30, "resource": "9HiLEkAr", "schedAction": 58, "schedCron": "O85gyv5i", "schedRange": ["dxNbML6a", "TTtjY8tU", "EhbU7Yn7"]}, {"action": 4, "resource": "PM37V7sS", "schedAction": 56, "schedCron": "0aoOtrUF", "schedRange": ["VyerXrjf", "TU1xHFe0", "AMenQI1z"]}, {"action": 98, "resource": "hOqF81Lt", "schedAction": 23, "schedCron": "ajBKisx1", "schedRange": ["VddwERfy", "O135Lc48", "PxmlJtDY"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminUpdateRolePermissionsV3' test.out

#- 196 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'T3bhxJzK' \
    --body '{"permissions": [{"action": 100, "resource": "uWEISsJR", "schedAction": 88, "schedCron": "lGIaAfjU", "schedRange": ["uyztDI12", "UmJvzyOB", "nkBVUDyZ"]}, {"action": 96, "resource": "Ew05Q13S", "schedAction": 93, "schedCron": "hKAXQJdR", "schedRange": ["XSCoZ7iv", "QOfmUSwU", "W53awOzn"]}, {"action": 86, "resource": "P7rVtpT3", "schedAction": 21, "schedCron": "hTrDduSU", "schedRange": ["GH46QZmG", "owblShtq", "ht7tv9kw"]}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminAddRolePermissionsV3' test.out

#- 197 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'bltRBbYy' \
    --body '["EhZnuvzJ", "Hb9NFMMc", "FprS75tV"]' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteRolePermissionsV3' test.out

#- 198 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '69' \
    --resource 'aP997FWE' \
    --roleId 'ohmLqrsY' \
    > test.out 2>&1
eval_tap $? 198 'AdminDeleteRolePermissionV3' test.out

#- 199 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 199 'AdminGetMyUserV3' test.out

#- 200 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'j4jX3oK7' \
    --extendExp  \
    --redirectUri 'xZs5CMNB' \
    --password 'ZSGFN0PA' \
    --requestId 'W47sVxr2' \
    --userName 'M5ou62u9' \
    > test.out 2>&1
eval_tap $? 200 'UserAuthenticationV3' test.out

#- 201 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'DF5NjqYa' \
    --linkingToken 'yAYqzx4M' \
    --password 'ROlnq6ZF' \
    --username 'NNvL3GAT' \
    > test.out 2>&1
eval_tap $? 201 'AuthenticationWithPlatformLinkV3' test.out

#- 202 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'BLQ6MJk9' \
    > test.out 2>&1
eval_tap $? 202 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 203 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 203 'GetCountryLocationV3' test.out

#- 204 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 204 'Logout' test.out

#- 205 RequestGameTokenCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenCodeResponseV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'WPUQ5Uil' \
    > test.out 2>&1
eval_tap $? 205 'RequestGameTokenCodeResponseV3' test.out

#- 206 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TfiN0OGt' \
    --userId 'wymymjIa' \
    > test.out 2>&1
eval_tap $? 206 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 207 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'alFryiVe' \
    > test.out 2>&1
eval_tap $? 207 'RevokeUserV3' test.out

#- 208 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'MRe30tAd' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --redirectUri 'FEYlZa1s' \
    --scope '3XieTffy' \
    --state 'V5H5SFzp' \
    --targetAuthPage 'uQu1rtjP' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'chbTGuG7' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 208 'AuthorizeV3' test.out

#- 209 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'xQVteLyF' \
    > test.out 2>&1
eval_tap $? 209 'TokenIntrospectionV3' test.out

#- 210 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 210 'GetJWKSV3' test.out

#- 211 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor '9jW7u3mX' \
    --mfaToken 'DEtVXRZw' \
    > test.out 2>&1
eval_tap $? 211 'Change2faMethod' test.out

#- 212 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'QA9gkpOZ' \
    --factor 'EJRb4uX4' \
    --mfaToken '8GzqOjc5' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 212 'Verify2faCode' test.out

#- 213 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZrSsaJae' \
    --userId 'kmZBNaVZ' \
    > test.out 2>&1
eval_tap $? 213 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 214 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'l21ikLWV' \
    --clientId '7YDLGDwR' \
    --redirectUri 'nVpvKfh7' \
    --requestId '4O1w8IMk' \
    > test.out 2>&1
eval_tap $? 214 'AuthCodeRequestV3' test.out

#- 215 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'HCU14VZi' \
    --clientId 'sO1U2CO0' \
    --createHeadless  \
    --deviceId 'hpEZv7iQ' \
    --macAddress 'YSuscrFv' \
    --platformToken 'lEcB8si5' \
    > test.out 2>&1
eval_tap $? 215 'PlatformTokenGrantV3' test.out

#- 216 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 216 'GetRevocationListV3' test.out

#- 217 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'sLoC3q9n' \
    > test.out 2>&1
eval_tap $? 217 'TokenRevocationV3' test.out

#- 218 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'uk6d9XsM' \
    --code 'WDj7fvy7' \
    --codeVerifier 'tn7IixjF' \
    --extendExp  \
    --password 'a42Wq5A1' \
    --redirectUri 'dnJpKTQe' \
    --refreshToken '3cKWphKd' \
    --username 'pymy1CAp' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 218 'TokenGrantV3' test.out

#- 219 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'u4qemtkF' \
    > test.out 2>&1
eval_tap $? 219 'VerifyTokenV3' test.out

#- 220 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'kr9JAkgq' \
    --code 'sbJUpqra' \
    --error 'Gx2JTSCk' \
    --openidAssocHandle 'CmifFfs8' \
    --openidClaimedId '10GtfWlD' \
    --openidIdentity 'A58PocGD' \
    --openidMode 'pMocHqm4' \
    --openidNs 'xHH4kAqd' \
    --openidOpEndpoint 'MOt5sPy6' \
    --openidResponseNonce 'P4nMhl7h' \
    --openidReturnTo 'AjrFTRdQ' \
    --openidSig 'wU667Rd7' \
    --openidSigned 'xYW3VQJA' \
    --state 'tUhPpyDg' \
    > test.out 2>&1
eval_tap $? 220 'PlatformAuthenticationV3' test.out

#- 221 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode '7VWgSOth' \
    > test.out 2>&1
eval_tap $? 221 'PublicGetInputValidations' test.out

#- 222 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode '0DlQV26C' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 222 'PublicGetCountryAgeRestrictionV3' test.out

#- 223 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 223 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 224 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'sJ1pITlh' \
    > test.out 2>&1
eval_tap $? 224 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 225 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Wi0OmJav' \
    --body '{"platformUserIds": ["di6wGruw", "u4MXCyJT", "n1BeOURq"]}' \
    > test.out 2>&1
eval_tap $? 225 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 226 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lLykUxIS' \
    --platformUserId 'J4uzP1CG' \
    > test.out 2>&1
eval_tap $? 226 'PublicGetUserByPlatformUserIDV3' test.out

#- 227 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'IvaoXPV4' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetAsyncStatus' test.out

#- 228 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'PyYxErUh' \
    --limit '63' \
    --offset '37' \
    --query 'ispxDmOY' \
    > test.out 2>&1
eval_tap $? 228 'PublicSearchUserV3' test.out

#- 229 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "QXUpxrSH", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "5zDLQhfI", "policyId": "d3O0BhPF", "policyVersionId": "vENuYavD"}, {"isAccepted": true, "localizedPolicyVersionId": "1MjJnmds", "policyId": "S3ljbRh5", "policyVersionId": "UMt7wsy6"}, {"isAccepted": false, "localizedPolicyVersionId": "dnvprUJx", "policyId": "Wg6xqbkt", "policyVersionId": "5uhV7hzV"}], "authType": "AmqYqGzH", "code": "Qjt7Fj1D", "country": "W9CCvaAY", "dateOfBirth": "VEu9vchE", "displayName": "MWFniQs8", "emailAddress": "YcKtZy0T", "password": "rLduxRi2", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 229 'PublicCreateUserV3' test.out

#- 230 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'JtMihlMi' \
    --query 'XVFh62ZJ' \
    > test.out 2>&1
eval_tap $? 230 'CheckUserAvailability' test.out

#- 231 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["hLKelR70", "DJJWDg8D", "LlvbZWNp"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicBulkGetUsers' test.out

#- 232 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "8rszfVLJ", "languageTag": "OhGmLadI"}' \
    > test.out 2>&1
eval_tap $? 232 'PublicSendRegistrationCode' test.out

#- 233 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "5YmPajP6", "emailAddress": "TD4u6Ac5"}' \
    > test.out 2>&1
eval_tap $? 233 'PublicVerifyRegistrationCode' test.out

#- 234 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "x0xtXZrk", "languageTag": "F2b3Ojdc"}' \
    > test.out 2>&1
eval_tap $? 234 'PublicForgotPasswordV3' test.out

#- 235 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'tRYMpdkI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 235 'GetAdminInvitationV3' test.out

#- 236 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'zfsUiTBW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "xTI0N001", "policyId": "uf8ozq1d", "policyVersionId": "CEav31gO"}, {"isAccepted": false, "localizedPolicyVersionId": "VMAtEhwe", "policyId": "GFasIOCG", "policyVersionId": "TaW1kMmy"}, {"isAccepted": true, "localizedPolicyVersionId": "sHgFTcjm", "policyId": "gVCdS5KA", "policyVersionId": "okiQX44O"}], "authType": "EMAILPASSWD", "country": "UCKpQPFT", "dateOfBirth": "wpQMGXb6", "displayName": "lYOMQr0o", "password": "683H6Cce", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 236 'CreateUserFromInvitationV3' test.out

#- 237 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "x8ECXTYK", "country": "8K8AneaP", "dateOfBirth": "pe5J9FS9", "displayName": "yKq6miHT", "languageTag": "HRYsw99Y", "userName": "8RyrNFsX"}' \
    > test.out 2>&1
eval_tap $? 237 'UpdateUserV3' test.out

#- 238 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "LNJ69uB6", "country": "Vlianplk", "dateOfBirth": "rhyYERM5", "displayName": "c5by88CZ", "languageTag": "dhyyvzl8", "userName": "TN2muwll"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicPartialUpdateUserV3' test.out

#- 239 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "VC9UvWMO", "emailAddress": "SyB5RTu9", "languageTag": "9dATLvI4"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicSendVerificationCodeV3' test.out

#- 240 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "dX2ffKgr", "contactType": "pWOMxUnE", "languageTag": "1B1IjnZE", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 240 'PublicUserVerificationV3' test.out

#- 241 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "doBuX15F", "country": "h7OsljKX", "dateOfBirth": "3saX8WPO", "displayName": "iDOz1pt3", "emailAddress": "WhQ0sC0T", "password": "VublwjLh", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 241 'PublicUpgradeHeadlessAccountV3' test.out

#- 242 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "enEk0TfB", "password": "1hhwmjRO"}' \
    > test.out 2>&1
eval_tap $? 242 'PublicVerifyHeadlessAccountV3' test.out

#- 243 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "UrJxKzmS", "newPassword": "k0YnjvEn", "oldPassword": "8e18hVtj"}' \
    > test.out 2>&1
eval_tap $? 243 'PublicUpdatePasswordV3' test.out

#- 244 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'xD4PauzV' \
    > test.out 2>&1
eval_tap $? 244 'PublicCreateJusticeUser' test.out

#- 245 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VCksV8vq' \
    --redirectUri 'oUWNCEDH' \
    --ticket 't9rbe76m' \
    > test.out 2>&1
eval_tap $? 245 'PublicPlatformLinkV3' test.out

#- 246 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'NfaGNMgg' \
    --body '{"platformNamespace": "ddNxsrf3"}' \
    > test.out 2>&1
eval_tap $? 246 'PublicPlatformUnlinkV3' test.out

#- 247 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nz0cD2Q9' \
    > test.out 2>&1
eval_tap $? 247 'PublicPlatformUnlinkAllV3' test.out

#- 248 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tBakaZ3M' \
    --ticket '3HXD9OJl' \
    > test.out 2>&1
eval_tap $? 248 'PublicForcePlatformLinkV3' test.out

#- 249 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uojSHuLO' \
    --clientId 'RUJnHDhF' \
    --redirectUri 'WxRSe1fd' \
    > test.out 2>&1
eval_tap $? 249 'PublicWebLinkPlatform' test.out

#- 250 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'r0W4XodF' \
    --state 'U8DqzZpr' \
    > test.out 2>&1
eval_tap $? 250 'PublicWebLinkPlatformEstablish' test.out

#- 251 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "2OFMJkM7", "emailAddress": "J0kDdfiV", "newPassword": "DLMwCVA4"}' \
    > test.out 2>&1
eval_tap $? 251 'ResetPasswordV3' test.out

#- 252 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4xHfjcss' \
    > test.out 2>&1
eval_tap $? 252 'PublicGetUserByUserIdV3' test.out

#- 253 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4Vf57iwW' \
    --activeOnly  \
    --after 'tUyjjzAT' \
    --before 'lWw4KiKa' \
    --limit '78' \
    > test.out 2>&1
eval_tap $? 253 'PublicGetUserBanHistoryV3' test.out

#- 254 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hfmtXlmS' \
    > test.out 2>&1
eval_tap $? 254 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 255 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BDG4Cb3B' \
    > test.out 2>&1
eval_tap $? 255 'PublicGetUserInformationV3' test.out

#- 256 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hc1lZsY6' \
    --after '0.7738648346436515' \
    --before '0.6151165889854187' \
    --limit '80' \
    > test.out 2>&1
eval_tap $? 256 'PublicGetUserLoginHistoriesV3' test.out

#- 257 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VmyChVoe' \
    --after 'O71qerWV' \
    --before 'N2xvZVdd' \
    --limit '28' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetUserPlatformAccountsV3' test.out

#- 258 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eoAruK4h' \
    > test.out 2>&1
eval_tap $? 258 'PublicListJusticePlatformAccountsV3' test.out

#- 259 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'EmXre5T7' \
    --body '{"platformId": "RgkfbqHV", "platformUserId": "AGQ3MKo2"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicLinkPlatformAccount' test.out

#- 260 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'v5ahrWze' \
    --body '{"chosenNamespaces": ["3NqdLUKF", "oNaOvUEL", "SfjYg52R"], "requestId": "vPCWd8ro"}' \
    > test.out 2>&1
eval_tap $? 260 'PublicForceLinkPlatformWithProgression' test.out

#- 261 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DybycZ90' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetPublisherUserV3' test.out

#- 262 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TJyRAHFO' \
    --password 'onZfxH0k' \
    > test.out 2>&1
eval_tap $? 262 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 263 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'h0IfUPPi' \
    --before 'bb9uwwMZ' \
    --isWildcard  \
    --limit '72' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetRolesV3' test.out

#- 264 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'phOuh6ad' \
    > test.out 2>&1
eval_tap $? 264 'PublicGetRoleV3' test.out

#- 265 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 265 'PublicGetMyUserV3' test.out

#- 266 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "hOhZSfXm"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicSendVerificationLinkV3' test.out

#- 267 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'k2PQGRK1' \
    > test.out 2>&1
eval_tap $? 267 'PublicVerifyUserByLinkV3' test.out

#- 268 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'zXADxFor' \
    --code '8Dj7Tf7P' \
    --error 'KMVfNiyI' \
    --state 'DQApQIJP' \
    > test.out 2>&1
eval_tap $? 268 'PlatformAuthenticateSAMLV3Handler' test.out

#- 269 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'jfKLS29U' \
    --payload 'hVf0IsPk' \
    > test.out 2>&1
eval_tap $? 269 'LoginSSOClient' test.out

#- 270 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'cM16jHlB' \
    > test.out 2>&1
eval_tap $? 270 'LogoutSSOClient' test.out

#- 271 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'tMa2Pl25' \
    > test.out 2>&1
eval_tap $? 271 'RequestGameTokenResponseV3' test.out

#- 272 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '2W9tJZdA' \
    > test.out 2>&1
eval_tap $? 272 'AdminGetDevicesByUserV4' test.out

#- 273 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'MhzUpxOC' \
    --endDate 'IwTS71jY' \
    --limit '93' \
    --offset '90' \
    --startDate 'zQCjFSTR' \
    > test.out 2>&1
eval_tap $? 273 'AdminGetBannedDevicesV4' test.out

#- 274 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CkaJ12WB' \
    > test.out 2>&1
eval_tap $? 274 'AdminGetUserDeviceBansV4' test.out

#- 275 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "Yh3s1cF1", "deviceId": "KfUsC2h1", "deviceType": "Tw8OxMJf", "enabled": false, "endDate": "h41JJgzC", "ext": {"1Tv8XvWB": {}, "73d5OlF0": {}, "VYmT2xEJ": {}}, "reason": "Ctx1JjFF"}' \
    > test.out 2>&1
eval_tap $? 275 'AdminBanDeviceV4' test.out

#- 276 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'NeYYi94E' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 276 'AdminGetDeviceBanV4' test.out

#- 277 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'sr8pWA5X' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 277 'AdminUpdateDeviceBanV4' test.out

#- 278 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'qK0A3MdY' \
    --startDate 'YpKYQtk0' \
    --deviceType 'S9p323Jd' \
    > test.out 2>&1
eval_tap $? 278 'AdminGenerateReportV4' test.out

#- 279 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 279 'AdminGetDeviceTypesV4' test.out

#- 280 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'jeyERcTJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDeviceBansV4' test.out

#- 281 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'sGGdlT2A' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 281 'AdminDecryptDeviceV4' test.out

#- 282 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'GB7om8z3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 282 'AdminUnbanDeviceV4' test.out

#- 283 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'ZP0L6pRa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 283 'AdminGetUsersByDeviceV4' test.out

#- 284 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 33}' \
    > test.out 2>&1
eval_tap $? 284 'AdminCreateTestUsersV4' test.out

#- 285 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["GcF0Sfrd", "QiidKLVo", "QffP1aPq"]}' \
    > test.out 2>&1
eval_tap $? 285 'AdminBulkCheckValidUserIDV4' test.out

#- 286 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aCuYvN50' \
    --body '{"avatarUrl": "lADwgqMc", "country": "XoZvkCDc", "dateOfBirth": "BWYlllie", "displayName": "oDDrOA05", "languageTag": "ugmeTeiK", "userName": "tZhTz3f4"}' \
    > test.out 2>&1
eval_tap $? 286 'AdminUpdateUserV4' test.out

#- 287 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XRlp3B0C' \
    --body '{"code": "coS9YxGI", "emailAddress": "YrpiZ59A"}' \
    > test.out 2>&1
eval_tap $? 287 'AdminUpdateUserEmailAddressV4' test.out

#- 288 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FYxtoILK' \
    > test.out 2>&1
eval_tap $? 288 'AdminDisableUserMFAV4' test.out

#- 289 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '18CGHO7V' \
    > test.out 2>&1
eval_tap $? 289 'AdminListUserRolesV4' test.out

#- 290 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ry6nToX0' \
    --body '{"assignedNamespaces": ["KRrYLj7b", "yklCc8xC", "akgXaSYP"], "roleId": "OFtFsmsz"}' \
    > test.out 2>&1
eval_tap $? 290 'AdminUpdateUserRoleV4' test.out

#- 291 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xXtieZV4' \
    --body '{"assignedNamespaces": ["tOFHFFgb", "zacwo9EC", "Gwi5zGct"], "roleId": "4A53X5ZN"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminAddUserRoleV4' test.out

#- 292 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uaaj4PSH' \
    --body '{"assignedNamespaces": ["A174TvsX", "ocdUO3Q4", "PhTOzSOj"], "roleId": "3pfJJpOu"}' \
    > test.out 2>&1
eval_tap $? 292 'AdminRemoveUserRoleV4' test.out

#- 293 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '85' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 293 'AdminGetRolesV4' test.out

#- 294 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "roleName": "EpGf6iEo"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminCreateRoleV4' test.out

#- 295 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId '0bQU7AgV' \
    > test.out 2>&1
eval_tap $? 295 'AdminGetRoleV4' test.out

#- 296 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'nvaoLyc9' \
    > test.out 2>&1
eval_tap $? 296 'AdminDeleteRoleV4' test.out

#- 297 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'lunoZS2P' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "Y3UVqZdt"}' \
    > test.out 2>&1
eval_tap $? 297 'AdminUpdateRoleV4' test.out

#- 298 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'iEAEUfVM' \
    --body '{"permissions": [{"action": 18, "resource": "esPs3mlN", "schedAction": 27, "schedCron": "uea0mG9J", "schedRange": ["ChS1MtM3", "mldy9xsR", "ZcNtM8aE"]}, {"action": 80, "resource": "zRkaifER", "schedAction": 29, "schedCron": "kB5BRben", "schedRange": ["i0013nCN", "wRHCQzzJ", "mjDWrwrk"]}, {"action": 47, "resource": "8ZlxMgZP", "schedAction": 13, "schedCron": "MmENt94g", "schedRange": ["SOQdzBVJ", "f4tdugXv", "5PAMVZ9b"]}]}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateRolePermissionsV4' test.out

#- 299 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'zjaXbmRz' \
    --body '{"permissions": [{"action": 80, "resource": "DwusJTrc", "schedAction": 51, "schedCron": "NuTwD8au", "schedRange": ["zfSJ5AOL", "FzCiGC8R", "BZok1o6y"]}, {"action": 2, "resource": "PdITzw0O", "schedAction": 87, "schedCron": "YgV0uiLY", "schedRange": ["Jv41jmaH", "KqEqg5aZ", "PyRfjsNa"]}, {"action": 13, "resource": "EEtSbDvC", "schedAction": 24, "schedCron": "q083sFlQ", "schedRange": ["xwzArP7Q", "8f3WHw3F", "kf6EX1Fd"]}]}' \
    > test.out 2>&1
eval_tap $? 299 'AdminAddRolePermissionsV4' test.out

#- 300 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'Y8Qhr2Ho' \
    --body '["75ZL7wsX", "UV46JPcM", "NDWQdbqy"]' \
    > test.out 2>&1
eval_tap $? 300 'AdminDeleteRolePermissionsV4' test.out

#- 301 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'AgznV84J' \
    --after 'aNMeEDBs' \
    --before '9kR2SoOS' \
    --limit '45' \
    > test.out 2>&1
eval_tap $? 301 'AdminListAssignedUsersV4' test.out

#- 302 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'KrRQPfuB' \
    --body '{"assignedNamespaces": ["UV5oKcNN", "3FlRSD1W", "OgcevVcZ"], "namespace": "meReChMp", "userId": "xglK0En2"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminAssignUserToRoleV4' test.out

#- 303 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'c0593FEc' \
    --body '{"namespace": "cOfMoXoG", "userId": "Ph4AVJe5"}' \
    > test.out 2>&1
eval_tap $? 303 'AdminRevokeUserFromRoleV4' test.out

#- 304 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "tu6k8apU", "country": "rYk9rSOM", "dateOfBirth": "itLgP5rv", "displayName": "7xBqMAST", "languageTag": "ipSxQdzg", "userName": "VBHRQRE8"}' \
    > test.out 2>&1
eval_tap $? 304 'AdminUpdateMyUserV4' test.out

#- 305 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 305 'AdminDisableMyAuthenticatorV4' test.out

#- 306 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'iAhzVXtn' \
    > test.out 2>&1
eval_tap $? 306 'AdminEnableMyAuthenticatorV4' test.out

#- 307 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 307 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 308 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 308 'AdminGetMyBackupCodesV4' test.out

#- 309 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 309 'AdminGenerateMyBackupCodesV4' test.out

#- 310 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 310 'AdminDisableMyBackupCodesV4' test.out

#- 311 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 311 'AdminDownloadMyBackupCodesV4' test.out

#- 312 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 312 'AdminEnableMyBackupCodesV4' test.out

#- 313 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 313 'AdminGetMyEnabledFactorsV4' test.out

#- 314 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'M27qizkW' \
    > test.out 2>&1
eval_tap $? 314 'AdminMakeFactorMyDefaultV4' test.out

#- 315 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["AXHcWuN0", "1hUafyZi", "iRPa8GoI"], "emailAddresses": ["Dv4IVClG", "EakHSmgY", "9zMm3TYm"], "isAdmin": true, "roleId": "HbxbPSlz"}' \
    > test.out 2>&1
eval_tap $? 315 'AdminInviteUserV4' test.out

#- 316 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "7BTftCWF", "policyId": "keYwBElK", "policyVersionId": "SiBiB7Be"}, {"isAccepted": true, "localizedPolicyVersionId": "td682ZAO", "policyId": "aXw0sp7u", "policyVersionId": "JEgR5l4L"}, {"isAccepted": true, "localizedPolicyVersionId": "H2NZVma5", "policyId": "rBfFALd7", "policyVersionId": "aH6YohJu"}], "authType": "EMAILPASSWD", "country": "J77NLg6Y", "dateOfBirth": "3ohWVFs0", "displayName": "dcQWTd90", "emailAddress": "lEFe0tEy", "password": "McEcaF1K", "passwordMD5Sum": "Ua6uCT29", "username": "4xoDXdYA", "verified": true}' \
    > test.out 2>&1
eval_tap $? 316 'PublicCreateTestUserV4' test.out

#- 317 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "PBM61FAA", "policyId": "RwUob3ts", "policyVersionId": "6wyDtacA"}, {"isAccepted": false, "localizedPolicyVersionId": "6M2ct6Pa", "policyId": "mbHJoLdr", "policyVersionId": "RVDD5BXv"}, {"isAccepted": true, "localizedPolicyVersionId": "E2TTkmRg", "policyId": "tgKHuwUE", "policyVersionId": "7YTa2MPY"}], "authType": "EMAILPASSWD", "code": "N3ootHX4", "country": "BoyhLq6B", "dateOfBirth": "NSTWg0J3", "displayName": "JlZn433p", "emailAddress": "GYdpeEAJ", "password": "PB3ZeCqx", "passwordMD5Sum": "rgZAg0eM", "reachMinimumAge": false, "username": "Kn43X7S3"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicCreateUserV4' test.out

#- 318 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'xOrb8YhZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "121rCEeD", "policyId": "p3rdEoy9", "policyVersionId": "bQJbyMVK"}, {"isAccepted": false, "localizedPolicyVersionId": "51QNxCm1", "policyId": "Scq9OYBa", "policyVersionId": "WkmA9x6W"}, {"isAccepted": true, "localizedPolicyVersionId": "veaFZAyx", "policyId": "YrvTdUtZ", "policyVersionId": "svG9YjWI"}], "authType": "EMAILPASSWD", "country": "dygvqfYr", "dateOfBirth": "0INhBqAP", "displayName": "s5lW40Af", "password": "a81ezmQy", "reachMinimumAge": true, "username": "WtuLL9vF"}' \
    > test.out 2>&1
eval_tap $? 318 'CreateUserFromInvitationV4' test.out

#- 319 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "5IC7Oq5f", "country": "oqF5svDk", "dateOfBirth": "ESho4kM9", "displayName": "9vdkQMVa", "languageTag": "18NkMFlZ", "userName": "3kIesWAm"}' \
    > test.out 2>&1
eval_tap $? 319 'PublicUpdateUserV4' test.out

#- 320 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "oagrUxcY", "emailAddress": "Ke9NpCOG"}' \
    > test.out 2>&1
eval_tap $? 320 'PublicUpdateUserEmailAddressV4' test.out

#- 321 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "AFW28Cd1", "country": "d33NCGiA", "dateOfBirth": "X8KbaYKw", "displayName": "feiQIBC7", "emailAddress": "x6t36c3R", "password": "9jm7Wgrv", "reachMinimumAge": false, "username": "QiIyJN8g", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 321 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 322 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "Dc1CIEto", "password": "Ipr1Mp9M", "username": "0VS7bCFe"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicUpgradeHeadlessAccountV4' test.out

#- 323 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 323 'PublicDisableMyAuthenticatorV4' test.out

#- 324 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'znE91JDu' \
    > test.out 2>&1
eval_tap $? 324 'PublicEnableMyAuthenticatorV4' test.out

#- 325 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 325 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 326 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 326 'PublicGetMyBackupCodesV4' test.out

#- 327 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 327 'PublicGenerateMyBackupCodesV4' test.out

#- 328 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 328 'PublicDisableMyBackupCodesV4' test.out

#- 329 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 329 'PublicDownloadMyBackupCodesV4' test.out

#- 330 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 330 'PublicEnableMyBackupCodesV4' test.out

#- 331 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken '5hYtuY5D' \
    > test.out 2>&1
eval_tap $? 331 'PublicRemoveTrustedDeviceV4' test.out

#- 332 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 332 'PublicGetMyEnabledFactorsV4' test.out

#- 333 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'MfTnEn05' \
    > test.out 2>&1
eval_tap $? 333 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE