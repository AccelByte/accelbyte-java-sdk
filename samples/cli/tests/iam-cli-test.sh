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
    --body '[{"field": "l00fSeJq", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "blockedWord": ["xintHYuI", "GLWMS5W6", "mL6Vsyiw"], "description": [{"language": "v67AA5Jy", "message": ["jEwJMF4B", "UJuyOVQk", "ZWq5rhkJ"]}, {"language": "Hop4GvKm", "message": ["RxRb720D", "309pqjBv", "KKIwv7Dq"]}, {"language": "TGjGmndr", "message": ["mdURvUq9", "OXfT83Hu", "yobC87kG"]}], "isCustomRegex": false, "letterCase": "3HjFZCrW", "maxLength": 48, "maxRepeatingAlphaNum": 89, "maxRepeatingSpecialCharacter": 52, "minCharType": 85, "minLength": 51, "regex": "OWQYovZV", "specialCharacterLocation": "2wo7m7eO", "specialCharacters": ["yCZIKw2t", "ktbfZtlY", "HPXIbt89"]}}, {"field": "smFs6fmq", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "blockedWord": ["sMnczzy3", "hkg0P7Hk", "F95mSdf9"], "description": [{"language": "8tzbEKen", "message": ["SPrf4Rvc", "YLZ2Dc1n", "XanAensu"]}, {"language": "EF76kvgY", "message": ["pvxdIt2p", "lZcBNTbs", "vSPTXKlH"]}, {"language": "CWFLSMho", "message": ["Jqxl0ohy", "G9euqBbj", "zFWncsRG"]}], "isCustomRegex": true, "letterCase": "gQPH5Hui", "maxLength": 26, "maxRepeatingAlphaNum": 69, "maxRepeatingSpecialCharacter": 9, "minCharType": 20, "minLength": 42, "regex": "7H4dno15", "specialCharacterLocation": "xDLLG6I8", "specialCharacters": ["8N0jOZnm", "ktmByKOQ", "kZRqJgXY"]}}, {"field": "9PBPi1Fb", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "blockedWord": ["iVmstZhk", "7wDjrygf", "1cr7XBVr"], "description": [{"language": "37bqfEeQ", "message": ["SlLbPCPS", "S4ccXhZZ", "2SuRbRui"]}, {"language": "A1mi0nH8", "message": ["hIyrXEv1", "NKUHorBp", "UqxdMxhf"]}, {"language": "ubDh3wZY", "message": ["ynteQaPj", "bnUzRw68", "KRXsULxC"]}], "isCustomRegex": true, "letterCase": "OS8Dhv0K", "maxLength": 73, "maxRepeatingAlphaNum": 39, "maxRepeatingSpecialCharacter": 78, "minCharType": 45, "minLength": 26, "regex": "G5k2iD4T", "specialCharacterLocation": "9bMrYOFK", "specialCharacters": ["miELrMgq", "V96fctcn", "nVBJkYCj"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'HXcjkCR0' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'Wwvrlbdk' \
    --before 'qfdWCPUj' \
    --limit '58' \
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
    --body '{"ageRestriction": 14, "enable": true}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode '7k1Orop3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 74}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'gebXARjK' \
    --limit '55' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "Un9brGPm", "comment": "GT0n2gWY", "endDate": "k98COO2g", "reason": "Mqp7CZS3", "skipNotif": false, "userIds": ["ZN4b4eBf", "gxdEdjZR", "0lF5b1UO"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "NJgSaqaB", "userId": "UUGXaM5d"}, {"banId": "7P7DhvWd", "userId": "63Fdt6gO"}, {"banId": "OVfSy4Aq", "userId": "vIro1DK7"}]}' \
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
    --clientId '5JzMOuDd' \
    --clientName 'toVqIOdu' \
    --clientType 'iPDt0EPa' \
    --limit '40' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["bYkgrBcB", "cgJRvYq7", "trsFJFCj"], "baseUri": "zHEhHxeS", "clientId": "dxxiZ252", "clientName": "Jw9BbArJ", "clientPermissions": [{"action": 42, "resource": "mUxvjbFG", "schedAction": 7, "schedCron": "1lLvaWOy", "schedRange": ["z8UDnpzc", "z4pnwPNM", "F7tqHPCp"]}, {"action": 88, "resource": "8iaecSjY", "schedAction": 22, "schedCron": "gFqmZxXz", "schedRange": ["fqf9Rgxe", "vkiGfwRr", "WLq1rIpY"]}, {"action": 93, "resource": "L7INkzDO", "schedAction": 13, "schedCron": "ZW2jnisB", "schedRange": ["yPFKtccj", "7wZjxdmm", "wqzQw9fT"]}], "clientPlatform": "URk33Dvk", "deletable": true, "description": "ctxv7QSL", "namespace": "EbkL82TT", "oauthAccessTokenExpiration": 88, "oauthAccessTokenExpirationTimeUnit": "8MBQWOEi", "oauthClientType": "ta6o9TSH", "oauthRefreshTokenExpiration": 69, "oauthRefreshTokenExpirationTimeUnit": "QQRKkCrf", "parentNamespace": "nEoljdoM", "redirectUri": "s4lRtsLZ", "scopes": ["7VJotJsW", "qLnmMHYJ", "H5FVcRoM"], "secret": "Wnn0P9Fw", "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'sMS9RHjL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'Egxb7Ysk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'XLwFQ5c5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["FMlZS5em", "2TVSrDb2", "RnGrpeU8"], "baseUri": "xzjCB59a", "clientName": "71MiA7RK", "clientPermissions": [{"action": 97, "resource": "dY1lC84t", "schedAction": 13, "schedCron": "1KZWecKF", "schedRange": ["zHOlxlEF", "zyLycKTr", "qsEi5osj"]}, {"action": 10, "resource": "NujNngPB", "schedAction": 70, "schedCron": "iqw6dGQi", "schedRange": ["aQ0VKC2s", "uAbwn15l", "vlrqv95t"]}, {"action": 41, "resource": "2ekpMlZU", "schedAction": 3, "schedCron": "HkDXXDnA", "schedRange": ["UY8chi66", "SD0rcw6F", "r1XUtjsm"]}], "clientPlatform": "qAn9tLdO", "deletable": true, "description": "OGhMEMIF", "namespace": "qy4GGIqJ", "oauthAccessTokenExpiration": 48, "oauthAccessTokenExpirationTimeUnit": "uarnHaYn", "oauthRefreshTokenExpiration": 23, "oauthRefreshTokenExpirationTimeUnit": "FqrR7GDP", "redirectUri": "agr6A2tS", "scopes": ["nLhCUzkR", "Z04HR3uV", "KUjdWOHL"], "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'IcWuKCcs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 31, "resource": "NjdPwEgi"}, {"action": 96, "resource": "VFFr6pd5"}, {"action": 11, "resource": "TTb4ke65"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'YvcilFXL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 52, "resource": "PFvpUO2f"}, {"action": 54, "resource": "yqbjks3F"}, {"action": 95, "resource": "RxqUzRnp"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '2' \
    --clientId 'bYh9EWBq' \
    --namespace "$AB_NAMESPACE" \
    --resource 'nJq0XUtv' \
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
    --limit '47' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2YHglvcp' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3gzpMGpG' \
    --body '{"ACSURL": "Lsj4xMdb", "AWSCognitoRegion": "XzPvB5f8", "AWSCognitoUserPool": "ifHsxQ79", "AllowedClients": ["CVJUcMkc", "GkpvYF0e", "R0We5KSz"], "AppId": "BHqGOLU3", "AuthorizationEndpoint": "AvfpKMik", "ClientId": "WsqCyBgw", "Environment": "6qgXtuIH", "FederationMetadataURL": "aCJfFFg1", "GenericOauthFlow": true, "IsActive": true, "Issuer": "eJZRZUaJ", "JWKSEndpoint": "OotcQrME", "KeyID": "jI3AWRbA", "NetflixCertificates": {"encryptedPrivateKey": "Ixx2gXc0", "encryptedPrivateKeyName": "crSMZgDq", "publicCertificate": "PXgiCDm3", "publicCertificateName": "psIzGjp9", "rootCertificate": "a118WNWw", "rootCertificateName": "zumk8rPZ"}, "OrganizationId": "BJnxbLHB", "PlatformName": "RMHHsJWP", "RedirectUri": "ht4LyJxB", "RegisteredDomains": [{"affectedClientIDs": ["iJnU1jux", "3zfl2teG", "w2PkWy0w"], "domain": "8u8h5OQQ", "namespaces": ["70iwnvek", "BMOhu4OC", "X2CsBQgr"], "roleId": "Fs9kMZcu"}, {"affectedClientIDs": ["pAsgwVnb", "hQil4Xqo", "0Bo6QxDW"], "domain": "7liBYBMZ", "namespaces": ["QtyC3YOL", "p5WHsLf1", "ooiCw1H2"], "roleId": "yJF2Bt82"}, {"affectedClientIDs": ["heNrvRFz", "TCVYSwFP", "xwnbVsgK"], "domain": "PyrDxZ5Y", "namespaces": ["117MFEtE", "3N7yP3HD", "FPjVWrIT"], "roleId": "DmT6bSXi"}], "Secret": "BOsaKfyX", "TeamID": "ES0t8acd", "TokenAuthenticationType": "1OTo5GRO", "TokenClaimsMapping": {"5ZeBiAYY": "yYhxU9li", "YKshPaCs": "NeqR2qOk", "weoXOJL5": "5URgmUcN"}, "TokenEndpoint": "5AdtpJ51", "scopes": ["Vb1QI0Lh", "xLNo4Frr", "60oCuHC8"]}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '85Hq44pk' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rciTHB8k' \
    --body '{"ACSURL": "n3P4dq9s", "AWSCognitoRegion": "b0RfCdJR", "AWSCognitoUserPool": "UdAIK68l", "AllowedClients": ["Q3Ew5MgW", "JLXh7HOc", "IQaYKMrZ"], "AppId": "rGB83wWu", "AuthorizationEndpoint": "SON3COhe", "ClientId": "LTVuTGnF", "Environment": "cxbn5Ebz", "FederationMetadataURL": "FYyCEmbx", "GenericOauthFlow": false, "IsActive": true, "Issuer": "TpUtYff5", "JWKSEndpoint": "udI26nIb", "KeyID": "1ONeYTjy", "NetflixCertificates": {"encryptedPrivateKey": "CxVjrgtW", "encryptedPrivateKeyName": "YUlEtvCH", "publicCertificate": "MdeqJJUw", "publicCertificateName": "vFWIHQo9", "rootCertificate": "s4w8tNQW", "rootCertificateName": "Uun5WTIm"}, "OrganizationId": "P1HzrV7G", "PlatformName": "ZH8MO3Ny", "RedirectUri": "iSW2Hcss", "RegisteredDomains": [{"affectedClientIDs": ["KGH2ZFXa", "0L2bt6Et", "9qhJhyGb"], "domain": "K4uAH43w", "namespaces": ["MjMpEtXc", "wICSqThH", "koXSBqPu"], "roleId": "BirjbJD0"}, {"affectedClientIDs": ["vBu5Q8OB", "7fyGTybV", "BUD2HL2S"], "domain": "KablP6MF", "namespaces": ["JlAi46u7", "H24eiN5l", "jCleKhPX"], "roleId": "sKlGaq87"}, {"affectedClientIDs": ["ffK82v84", "AnP2sLV1", "CHUbvFRU"], "domain": "qiTM70f6", "namespaces": ["7mg4sb1O", "huSyH4vo", "c4uwsodX"], "roleId": "UtnsRYS1"}], "Secret": "ZpjbiN88", "TeamID": "X26JocZv", "TokenAuthenticationType": "0YpNre26", "TokenClaimsMapping": {"FOaA6Ugz": "ET1z91vv", "2UPtWtST": "4UkrYAhw", "NjDthX6u": "gwVLusvZ"}, "TokenEndpoint": "e9l7u5Gf", "scopes": ["qeYgUltO", "wZlJpAbA", "UIlEr16A"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WC0cfl6F' \
    --body '{"affectedClientIDs": ["c9Ht3W7e", "LKihXhfG", "lelCrU6E"], "assignedNamespaces": ["2Fw74MD2", "o9oKrarx", "sxB5u9S3"], "domain": "naO3U55u", "roleId": "By3ql3eQ"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yBsFJ2Up' \
    --body '{"domain": "V09dfvjU"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FFNV9tRp' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VJkhnkLK' \
    --body '{"acsUrl": "loy1HlOp", "apiKey": "5yhLK3A9", "appId": "Pcx6NYjX", "federationMetadataUrl": "y9atHlYP", "isActive": false, "redirectUri": "OT4SgxjO", "secret": "cFvHJvr6", "ssoUrl": "sDXf05pd"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yMXLEAgA' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FSgKSyyQ' \
    --body '{"acsUrl": "PB87QCDp", "apiKey": "FUa3ZMCl", "appId": "jSiQLi8W", "federationMetadataUrl": "TkRh6EgC", "isActive": false, "redirectUri": "KKsmM5mj", "secret": "UK2FVBxO", "ssoUrl": "AklURj17"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HOLY4oPK' \
    --platformUserId 'CQW5vbE1' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'VQGHVxh3' \
    --after '6' \
    --before '98' \
    --limit '24' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'SeXpDAhf' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["aA9GsWZ2", "AzGDxIr6", "rBdVR4cm"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["rH6S2NHZ", "HuStlKYW", "EfHUZKZ8"], "isAdmin": false, "namespace": "Sj1Sta4J", "roles": ["FxsyGyQ4", "NeHey5od", "KCQMCavT"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '95' \
    --platformUserId 'iBq751sG' \
    --platformId 'h8wrcPsN' \
    > test.out 2>&1
eval_tap $? 146 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 147 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 147 'AdminListUsersV3' test.out

#- 148 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'o978ouz7' \
    --endDate 'eUDysW2W' \
    --limit '94' \
    --offset '91' \
    --platformBy 'e9cp91PM' \
    --platformId 'oxCclH8l' \
    --query 'BUJdn4k4' \
    --startDate 'SOb3YIqD' \
    > test.out 2>&1
eval_tap $? 148 'AdminSearchUserV3' test.out

#- 149 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["YBEIwcCk", "VXDfg9mT", "1jAiXWFe"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetBulkUserByEmailAddressV3' test.out

#- 150 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SiWnzUJn' \
    > test.out 2>&1
eval_tap $? 150 'AdminGetUserByUserIdV3' test.out

#- 151 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HTKMwwvq' \
    --body '{"avatarUrl": "SipIgEAb", "country": "nZmEIltW", "dateOfBirth": "yoVAXcvQ", "displayName": "USMuGU6q", "languageTag": "zAUA0AUM", "userName": "ozjgXrlK"}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserV3' test.out

#- 152 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'q7AmVVga' \
    --activeOnly  \
    --after 'mq6GZu5P' \
    --before 'oqBPKyJn' \
    --limit '63' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetUserBanV3' test.out

#- 153 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SDGbym2O' \
    --body '{"ban": "8zl7d7eE", "comment": "JUEHRnwY", "endDate": "HGbz31H8", "reason": "ZwkRD3uO", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 153 'AdminBanUserV3' test.out

#- 154 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'clzbSPkd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'irtaJaY9' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 154 'AdminUpdateUserBanV3' test.out

#- 155 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iqVQ5ack' \
    --body '{"context": "7M8i24VI", "emailAddress": "ArROiGY0", "languageTag": "POvhCNWe"}' \
    > test.out 2>&1
eval_tap $? 155 'AdminSendVerificationCodeV3' test.out

#- 156 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gao8a0xb' \
    --body '{"Code": "jIECIein", "ContactType": "u5mwRLvN", "LanguageTag": "1a4QhGD5", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 156 'AdminVerifyAccountV3' test.out

#- 157 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'S3OKuiMq' \
    > test.out 2>&1
eval_tap $? 157 'GetUserVerificationCode' test.out

#- 158 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bExumOdU' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserDeletionStatusV3' test.out

#- 159 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XWfCnWfb' \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpdateUserDeletionStatusV3' test.out

#- 160 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hliYKxcv' \
    --body '{"code": "ME6zZnBs", "country": "QVd8Sdni", "dateOfBirth": "yG2EdYbD", "displayName": "azkSpfDA", "emailAddress": "FgQIT0m9", "password": "3r0OvebV", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpgradeHeadlessAccountV3' test.out

#- 161 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vpd31V0t' \
    > test.out 2>&1
eval_tap $? 161 'AdminDeleteUserInformationV3' test.out

#- 162 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wyUTKrfV' \
    --after '0.04033493877858496' \
    --before '0.8381394988082687' \
    --limit '46' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetUserLoginHistoriesV3' test.out

#- 163 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RqMmGppf' \
    --body '{"languageTag": "WZuj0pqn", "newPassword": "fUXy2dtR", "oldPassword": "El0RRWjf"}' \
    > test.out 2>&1
eval_tap $? 163 'AdminResetPasswordV3' test.out

#- 164 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FT4cbt0V' \
    --body '{"Permissions": [{"Action": 28, "Resource": "Mt34Aa08", "SchedAction": 82, "SchedCron": "4SyWkPVo", "SchedRange": ["TNJFjagA", "WKLLjQ39", "sSc91RY0"]}, {"Action": 66, "Resource": "FrcI62sQ", "SchedAction": 85, "SchedCron": "ja7RMUKh", "SchedRange": ["U3OQ7WWG", "dpjNCbWK", "8WuWZFJt"]}, {"Action": 93, "Resource": "KSvKyWjq", "SchedAction": 81, "SchedCron": "1Aikl2H3", "SchedRange": ["MqF9iBdT", "tGjf4Epl", "lMrnrwCl"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserPermissionV3' test.out

#- 165 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'U9AxELO7' \
    --body '{"Permissions": [{"Action": 13, "Resource": "zCk2q3ua", "SchedAction": 58, "SchedCron": "3M8K1p8s", "SchedRange": ["zLNvXkKQ", "Wr2wSkeo", "MJP1HYHj"]}, {"Action": 81, "Resource": "MLJ8Ik8g", "SchedAction": 56, "SchedCron": "M7UubVA5", "SchedRange": ["hxRJ8h7c", "NhYl8r07", "i5rnqO9w"]}, {"Action": 84, "Resource": "S7RHAEDh", "SchedAction": 82, "SchedCron": "HCsWk5r3", "SchedRange": ["TrZ9Uwrk", "22C8angn", "ys8vrzna"]}]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminAddUserPermissionsV3' test.out

#- 166 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eVUGLOp7' \
    --body '[{"Action": 62, "Resource": "kDw3nqRM"}, {"Action": 77, "Resource": "mpX7RcTY"}, {"Action": 47, "Resource": "JMR1MQKI"}]' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionBulkV3' test.out

#- 167 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '67' \
    --namespace "$AB_NAMESPACE" \
    --resource 'PSlrZvNO' \
    --userId 'N8Ut3s4I' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserPermissionV3' test.out

#- 168 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IcRDAc6t' \
    --after 'u5VBOWRK' \
    --before '9v55RBMX' \
    --limit '88' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserPlatformAccountsV3' test.out

#- 169 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'v2zKDOTf' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetListJusticePlatformAccounts' test.out

#- 170 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '0CsZNBy2' \
    --userId 'Y8OgFgIU' \
    > test.out 2>&1
eval_tap $? 170 'AdminGetUserMapping' test.out

#- 171 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'HJD2XxVA' \
    --userId 'GEUcxTPG' \
    > test.out 2>&1
eval_tap $? 171 'AdminCreateJusticeUser' test.out

#- 172 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'ch8b0Pex' \
    --body '{"platformId": "QolODcYw", "platformUserId": "U8yG0A2Y"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminLinkPlatformAccount' test.out

#- 173 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tcP7iH3k' \
    --userId 'ECX7kPgE' \
    --body '{"platformNamespace": "A6IdQpkA"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformUnlinkV3' test.out

#- 174 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lEFgBsPz' \
    --userId 'cI0vF4qt' \
    --ticket 'nN3yh5YL' \
    > test.out 2>&1
eval_tap $? 174 'AdminPlatformLinkV3' test.out

#- 175 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2xy9kQZw' \
    --userId 'CR44oXJQ' \
    --platformToken 'zEttE9rs' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 176 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nEaJPbno' \
    --body '["ROm9pWmG", "fk43HVLH", "hhttbWP1"]' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserRolesV3' test.out

#- 177 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'o5BtpTFd' \
    --body '[{"namespace": "D8wbl2uG", "roleId": "j8KGKFqf"}, {"namespace": "7q1IH462", "roleId": "6duqqw78"}, {"namespace": "jeAivG6l", "roleId": "7oxV78eS"}]' \
    > test.out 2>&1
eval_tap $? 177 'AdminSaveUserRoleV3' test.out

#- 178 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'ZNH6bWCe' \
    --userId 'B0JeMelc' \
    > test.out 2>&1
eval_tap $? 178 'AdminAddUserRoleV3' test.out

#- 179 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'xBevnkJf' \
    --userId '1P8aAdjN' \
    > test.out 2>&1
eval_tap $? 179 'AdminDeleteUserRoleV3' test.out

#- 180 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eUvXflAA' \
    --body '{"enabled": true, "reason": "qukeSPsJ"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateUserStatusV3' test.out

#- 181 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7bNpzgIc' \
    > test.out 2>&1
eval_tap $? 181 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 182 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'e7HF2on5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "lSuvEvqK"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateClientSecretV3' test.out

#- 183 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after '158O4Fse' \
    --before 'aP79QGXf' \
    --isWildcard  \
    --limit '18' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRolesV3' test.out

#- 184 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "managers": [{"displayName": "s3mN7ghh", "namespace": "KJc177XJ", "userId": "CpT1o0zD"}, {"displayName": "5np2hNZa", "namespace": "ctjdmmio", "userId": "Ms3AvY9x"}, {"displayName": "bLhwSOxl", "namespace": "GJqBnYbL", "userId": "dq5Y02ms"}], "members": [{"displayName": "XLdbgYtd", "namespace": "xq5W3jnz", "userId": "wTCcDMGT"}, {"displayName": "57Uz2nan", "namespace": "eJmsbZdn", "userId": "u9E6J2CT"}, {"displayName": "BReFUtXq", "namespace": "zTGrc5dn", "userId": "UFCn0Sod"}], "permissions": [{"action": 47, "resource": "sRxHH6Sr", "schedAction": 48, "schedCron": "BHXSLSJk", "schedRange": ["QYHNX2V9", "bMaSfUiy", "pf9ftYIQ"]}, {"action": 31, "resource": "IGcPXoUz", "schedAction": 50, "schedCron": "mCEgPs2b", "schedRange": ["gn9vKUCB", "nbHrd3tb", "QbblPhCX"]}, {"action": 25, "resource": "RnyuX2HY", "schedAction": 39, "schedCron": "wXh2KkVD", "schedRange": ["N57WZV6J", "lfYoq9uq", "rng3PWiS"]}], "roleName": "mURssnMR"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminCreateRoleV3' test.out

#- 185 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'Qvh9xlhZ' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleV3' test.out

#- 186 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'xmmloLHa' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteRoleV3' test.out

#- 187 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'nrblZvHx' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "k7C63B0x"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateRoleV3' test.out

#- 188 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'sIc8An0K' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleAdminStatusV3' test.out

#- 189 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'futjPaxJ' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpdateAdminRoleStatusV3' test.out

#- 190 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'LJOsI48e' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleAdminV3' test.out

#- 191 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'Rk2VErwO' \
    --after 'IR804Ms4' \
    --before '07FG7juG' \
    --limit '70' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetRoleManagersV3' test.out

#- 192 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'gA3Sn9VC' \
    --body '{"managers": [{"displayName": "kcKc06tF", "namespace": "6VDEXKUc", "userId": "4BXawdbQ"}, {"displayName": "wksIIglm", "namespace": "ocX5rMX3", "userId": "9wrBouya"}, {"displayName": "voLyjmMI", "namespace": "06Dr7Y6h", "userId": "3omjce2E"}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRoleManagersV3' test.out

#- 193 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'hdN0PMq9' \
    --body '{"managers": [{"displayName": "lLH1vafl", "namespace": "6TwyBF4k", "userId": "y8MTXXtm"}, {"displayName": "DpjB98Dd", "namespace": "PWviYnSz", "userId": "RDTnrWhd"}, {"displayName": "YevV88jZ", "namespace": "ygE8RDf2", "userId": "WXfH9Jog"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminRemoveRoleManagersV3' test.out

#- 194 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'u96LD9Ir' \
    --after 'eiipD8Un' \
    --before 'v5dUElvG' \
    --limit '13' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetRoleMembersV3' test.out

#- 195 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId '9NdDaz6j' \
    --body '{"members": [{"displayName": "fBWfUZrY", "namespace": "UGK6EGr8", "userId": "GlEDeHIp"}, {"displayName": "kguwDWLr", "namespace": "mtbauI0t", "userId": "bzNVaJ38"}, {"displayName": "Z71NVlwP", "namespace": "f8VKbzGU", "userId": "OzYUgawi"}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddRoleMembersV3' test.out

#- 196 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'rHzPUvpQ' \
    --body '{"members": [{"displayName": "ZWiSbOOq", "namespace": "qu4Igztn", "userId": "btAGOADq"}, {"displayName": "uDhTshsR", "namespace": "sseDmKsH", "userId": "4RdcGbz0"}, {"displayName": "QSPwtP2u", "namespace": "jqPTPTZx", "userId": "sKurv9Js"}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminRemoveRoleMembersV3' test.out

#- 197 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'bSZjoMeQ' \
    --body '{"permissions": [{"action": 70, "resource": "wXcLkLQK", "schedAction": 53, "schedCron": "4zayysLx", "schedRange": ["ADYk4rrl", "cMf7lx25", "Cd9HI5ej"]}, {"action": 97, "resource": "uHVCGAv4", "schedAction": 9, "schedCron": "zuVQr1ic", "schedRange": ["GBg8rD6Z", "HAjHQORA", "ntRVAPBu"]}, {"action": 72, "resource": "KrK1zipn", "schedAction": 24, "schedCron": "H3jysx2m", "schedRange": ["aImBJBB9", "eXa22y8c", "e5SC6Pru"]}]}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateRolePermissionsV3' test.out

#- 198 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'Vyf77bMV' \
    --body '{"permissions": [{"action": 35, "resource": "dIqFIkNI", "schedAction": 92, "schedCron": "dv6lRUWO", "schedRange": ["a5zlHkpW", "NkoobGX2", "z5IFmHcB"]}, {"action": 40, "resource": "VqJ3dPJI", "schedAction": 15, "schedCron": "gXcXwuBO", "schedRange": ["5nNovsdh", "nFxxSaSU", "E2CxloGo"]}, {"action": 9, "resource": "SkdIb6LZ", "schedAction": 89, "schedCron": "Oam3T5l6", "schedRange": ["0iGGdnjw", "VkfLIr4s", "XdVa2mW6"]}]}' \
    > test.out 2>&1
eval_tap $? 198 'AdminAddRolePermissionsV3' test.out

#- 199 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'TocBPGmL' \
    --body '["dR5QNLz6", "U9XyPRJz", "mYnWGkcu"]' \
    > test.out 2>&1
eval_tap $? 199 'AdminDeleteRolePermissionsV3' test.out

#- 200 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '82' \
    --resource 'iabQM8hj' \
    --roleId 'VOeI92vd' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteRolePermissionV3' test.out

#- 201 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 201 'AdminGetMyUserV3' test.out

#- 202 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId '6Xndfqcf' \
    --extendExp  \
    --redirectUri 'i7EGhkVg' \
    --password 'OELeIn1T' \
    --requestId 'jotqxJPY' \
    --userName '1QKeWkk1' \
    > test.out 2>&1
eval_tap $? 202 'UserAuthenticationV3' test.out

#- 203 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'ygKP1JkD' \
    --linkingToken 'MPQC6sjn' \
    --password '3FTAjH96' \
    --username 'lGV35Dcv' \
    > test.out 2>&1
eval_tap $? 203 'AuthenticationWithPlatformLinkV3' test.out

#- 204 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'rsP5scoQ' \
    > test.out 2>&1
eval_tap $? 204 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 205 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'XluNKx5a' \
    > test.out 2>&1
eval_tap $? 205 'RequestOneTimeLinkingCodeV3' test.out

#- 206 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'm3e0b7Wp' \
    > test.out 2>&1
eval_tap $? 206 'ValidateOneTimeLinkingCodeV3' test.out

#- 207 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --clientId 'vaeQvKKb' \
    --oneTimeLinkCode 'vgPwMGzz' \
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
    --clientId 'JOKVnGuY' \
    > test.out 2>&1
eval_tap $? 210 'RequestGameTokenCodeResponseV3' test.out

#- 211 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Wpbi6B4E' \
    --userId 'CZ53FyZo' \
    > test.out 2>&1
eval_tap $? 211 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 212 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'E4n5Wd69' \
    > test.out 2>&1
eval_tap $? 212 'RevokeUserV3' test.out

#- 213 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'E1jJ9cmF' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'QrmxF9HL' \
    --redirectUri 'ceMca5RY' \
    --scope 'SmeN2XYO' \
    --state 'cFSStejO' \
    --targetAuthPage 'sP4kfil9' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId '29zLX6PJ' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 213 'AuthorizeV3' test.out

#- 214 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'k8y0Tr9p' \
    > test.out 2>&1
eval_tap $? 214 'TokenIntrospectionV3' test.out

#- 215 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 215 'GetJWKSV3' test.out

#- 216 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'tDU7husM' \
    --factor 'e59abPEe' \
    --mfaToken 'COglErNP' \
    > test.out 2>&1
eval_tap $? 216 'SendMFAAuthenticationCode' test.out

#- 217 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor '4AGJW1wG' \
    --mfaToken 'PPgYVsJb' \
    > test.out 2>&1
eval_tap $? 217 'Change2faMethod' test.out

#- 218 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'GRv7SN1l' \
    --factor 'tUXJflZw' \
    --mfaToken 'UaA1eSJ0' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 218 'Verify2faCode' test.out

#- 219 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KeGbaiIr' \
    --userId 'pycW2OU2' \
    > test.out 2>&1
eval_tap $? 219 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 220 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'QkbR9gHu' \
    --clientId 'cXT4cTCZ' \
    --redirectUri 'JOgz8tAO' \
    --requestId 'KAUsAYxO' \
    > test.out 2>&1
eval_tap $? 220 'AuthCodeRequestV3' test.out

#- 221 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'hZxyO1di' \
    --clientId 'sX3npXeY' \
    --createHeadless  \
    --deviceId '7gDkj4PR' \
    --macAddress 'Q7Z8zbMi' \
    --platformToken 'aO5nhh91' \
    > test.out 2>&1
eval_tap $? 221 'PlatformTokenGrantV3' test.out

#- 222 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 222 'GetRevocationListV3' test.out

#- 223 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token '4scWUmrz' \
    > test.out 2>&1
eval_tap $? 223 'TokenRevocationV3' test.out

#- 224 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'P7RL9Zex' \
    --code 'RhSXPUSS' \
    --codeVerifier '8L75nadJ' \
    --extendExp  \
    --password 'ISh5UYgM' \
    --redirectUri 'jb1LnkYu' \
    --refreshToken 'WusOJfJM' \
    --username 'EA8OKdT0' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 224 'TokenGrantV3' test.out

#- 225 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'zYvXqJLE' \
    > test.out 2>&1
eval_tap $? 225 'VerifyTokenV3' test.out

#- 226 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'I46wAgey' \
    --code 'gHLYbrDy' \
    --error 'LRn0GVcI' \
    --openidAssocHandle 'O7r6VBVP' \
    --openidClaimedId 'qZVFe4mb' \
    --openidIdentity 'SlC8kLQ2' \
    --openidMode 'NycJHaAB' \
    --openidNs 'Lnw8QCBy' \
    --openidOpEndpoint 'C3bwaCGK' \
    --openidResponseNonce 'PYxFynBi' \
    --openidReturnTo 'WO0yXzsV' \
    --openidSig '21vM0fxE' \
    --openidSigned '6ym9ZDk2' \
    --state 'hVSEvvGv' \
    > test.out 2>&1
eval_tap $? 226 'PlatformAuthenticationV3' test.out

#- 227 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode '9e8hvDIt' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetInputValidations' test.out

#- 228 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode '48yTyGX5' \
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
    --clientId 'bCIEGSaB' \
    > test.out 2>&1
eval_tap $? 230 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 231 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XWLfw2w5' \
    --body '{"platformUserIds": ["OTBVsQZd", "N8MAaNDI", "nbQgWo2s"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 232 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kqy4iEKL' \
    --platformUserId 'ou2Xd6dK' \
    > test.out 2>&1
eval_tap $? 232 'PublicGetUserByPlatformUserIDV3' test.out

#- 233 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'RcKq9EdP' \
    > test.out 2>&1
eval_tap $? 233 'PublicGetAsyncStatus' test.out

#- 234 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'CXoGl6VN' \
    --limit '57' \
    --offset '80' \
    --query 'GqxNCIDS' \
    > test.out 2>&1
eval_tap $? 234 'PublicSearchUserV3' test.out

#- 235 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "AkVDY0zT", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "qYRu3rfm", "policyId": "Kd8ShkaB", "policyVersionId": "rTIcfj1s"}, {"isAccepted": false, "localizedPolicyVersionId": "KXFzxyJH", "policyId": "BFVdDucN", "policyVersionId": "0uoWbSU7"}, {"isAccepted": false, "localizedPolicyVersionId": "3j0639ta", "policyId": "3B19Y7V7", "policyVersionId": "lseknEC1"}], "authType": "FWKu9HmQ", "code": "dYufb2QX", "country": "tXLybyxH", "dateOfBirth": "FiGX8f66", "displayName": "USFzfGpb", "emailAddress": "srndjilH", "password": "1SIaW2n2", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 235 'PublicCreateUserV3' test.out

#- 236 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'ZIWeZMeG' \
    --query 'sFW6eNrj' \
    > test.out 2>&1
eval_tap $? 236 'CheckUserAvailability' test.out

#- 237 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["KRNCeOjC", "pngavfg2", "tyO3OmkH"]}' \
    > test.out 2>&1
eval_tap $? 237 'PublicBulkGetUsers' test.out

#- 238 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "8tOwMOtb", "languageTag": "4hTPVckc"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicSendRegistrationCode' test.out

#- 239 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "bkTxYQSd", "emailAddress": "KRPfUcJk"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicVerifyRegistrationCode' test.out

#- 240 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "BlOCF95c", "languageTag": "2HX8gkpe"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicForgotPasswordV3' test.out

#- 241 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'C3NcqAAW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'GetAdminInvitationV3' test.out

#- 242 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'iJSlRNfI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "5Dqz1HrH", "policyId": "v4JvVZoq", "policyVersionId": "gK3h4YQq"}, {"isAccepted": false, "localizedPolicyVersionId": "gwYcxTMJ", "policyId": "J6Lwey4L", "policyVersionId": "VBRt3Dew"}, {"isAccepted": true, "localizedPolicyVersionId": "JzV9spLY", "policyId": "4vnG9pCW", "policyVersionId": "SaesTpzq"}], "authType": "EMAILPASSWD", "country": "lPHq86ox", "dateOfBirth": "by8K8rrO", "displayName": "YHHsgslv", "password": "BBcTI7av", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 242 'CreateUserFromInvitationV3' test.out

#- 243 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "M2mruIMN", "country": "6geX4W8X", "dateOfBirth": "yG9X37Y8", "displayName": "Vx4miNNL", "languageTag": "NKNgLcaC", "userName": "RZVoZTjp"}' \
    > test.out 2>&1
eval_tap $? 243 'UpdateUserV3' test.out

#- 244 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "K6jvFEbn", "country": "kOjdv3Vn", "dateOfBirth": "IcTuqy21", "displayName": "Lu2TI6lj", "languageTag": "VKTnjBhx", "userName": "7JePIFD3"}' \
    > test.out 2>&1
eval_tap $? 244 'PublicPartialUpdateUserV3' test.out

#- 245 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "yrL7rfHC", "emailAddress": "0mWTUT6X", "languageTag": "SVjjzjQ5"}' \
    > test.out 2>&1
eval_tap $? 245 'PublicSendVerificationCodeV3' test.out

#- 246 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "x9oxsPeg", "contactType": "zlskxqWP", "languageTag": "J1SwHll2", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 246 'PublicUserVerificationV3' test.out

#- 247 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "UjPwMkKN", "country": "xXvqKKUj", "dateOfBirth": "D7JDiuis", "displayName": "v7O5QeKe", "emailAddress": "c4bsuKoD", "password": "cFc25314", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 247 'PublicUpgradeHeadlessAccountV3' test.out

#- 248 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "XYUFWEpg", "password": "47SYL8uu"}' \
    > test.out 2>&1
eval_tap $? 248 'PublicVerifyHeadlessAccountV3' test.out

#- 249 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "FXrfmeda", "newPassword": "SA16djrT", "oldPassword": "tDiSuUsr"}' \
    > test.out 2>&1
eval_tap $? 249 'PublicUpdatePasswordV3' test.out

#- 250 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'UkUv2MFT' \
    > test.out 2>&1
eval_tap $? 250 'PublicCreateJusticeUser' test.out

#- 251 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'NkO8aivo' \
    --redirectUri 'HMFn6I6i' \
    --ticket '6ReRClKO' \
    > test.out 2>&1
eval_tap $? 251 'PublicPlatformLinkV3' test.out

#- 252 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bPRTjf3b' \
    --body '{"platformNamespace": "j6EtY8zR"}' \
    > test.out 2>&1
eval_tap $? 252 'PublicPlatformUnlinkV3' test.out

#- 253 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'D2xtZJ0A' \
    > test.out 2>&1
eval_tap $? 253 'PublicPlatformUnlinkAllV3' test.out

#- 254 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WIrr5SFu' \
    --ticket 'SdbSauXd' \
    > test.out 2>&1
eval_tap $? 254 'PublicForcePlatformLinkV3' test.out

#- 255 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AwqXnykP' \
    --clientId 'xaN6EsOr' \
    --redirectUri 'sUTfkUKN' \
    > test.out 2>&1
eval_tap $? 255 'PublicWebLinkPlatform' test.out

#- 256 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'NmUGu0qi' \
    --state 'cpFlomBt' \
    > test.out 2>&1
eval_tap $? 256 'PublicWebLinkPlatformEstablish' test.out

#- 257 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "6iTTPqrz", "emailAddress": "TBjDGV6Y", "newPassword": "gKXkayDf"}' \
    > test.out 2>&1
eval_tap $? 257 'ResetPasswordV3' test.out

#- 258 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BJcn98GC' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetUserByUserIdV3' test.out

#- 259 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3EFIxCUl' \
    --activeOnly  \
    --after 'BqFdlbRD' \
    --before 'LRTiMB5p' \
    --limit '3' \
    > test.out 2>&1
eval_tap $? 259 'PublicGetUserBanHistoryV3' test.out

#- 260 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nNWqt5y6' \
    > test.out 2>&1
eval_tap $? 260 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 261 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'I8X0u0Oz' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetUserInformationV3' test.out

#- 262 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IMA7icNk' \
    --after '0.3280106025519717' \
    --before '0.05783841503288223' \
    --limit '82' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetUserLoginHistoriesV3' test.out

#- 263 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PA6c0Wuo' \
    --after 'Nl9M6eb2' \
    --before 'mBb2s6Zc' \
    --limit '71' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetUserPlatformAccountsV3' test.out

#- 264 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VKU3LaLS' \
    > test.out 2>&1
eval_tap $? 264 'PublicListJusticePlatformAccountsV3' test.out

#- 265 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'd9aEZm1V' \
    --body '{"platformId": "4fs1ecRb", "platformUserId": "euFYqZRb"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicLinkPlatformAccount' test.out

#- 266 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'LQn1c1Md' \
    --body '{"chosenNamespaces": ["yfAsUCFM", "WLH9F7eb", "KqLCZJsS"], "requestId": "PusO6L4x"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicForceLinkPlatformWithProgression' test.out

#- 267 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hmT10oTu' \
    > test.out 2>&1
eval_tap $? 267 'PublicGetPublisherUserV3' test.out

#- 268 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mz1svf5M' \
    --password 'SObNe5Uq' \
    > test.out 2>&1
eval_tap $? 268 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 269 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after '3AmbO7BH' \
    --before 'OAG8r4IQ' \
    --isWildcard  \
    --limit '13' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetRolesV3' test.out

#- 270 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'vZm3n8jQ' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetRoleV3' test.out

#- 271 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 271 'PublicGetMyUserV3' test.out

#- 272 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'wXCqvEXc' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 273 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["uOz1sz25", "1AgbR3wL", "Y1hHTMQi"], "oneTimeLinkCode": "PvCZKVlm"}' \
    > test.out 2>&1
eval_tap $? 273 'LinkHeadlessAccountToMyAccountV3' test.out

#- 274 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "u3fKlSsh"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicSendVerificationLinkV3' test.out

#- 275 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'Pv3ZdNm2' \
    > test.out 2>&1
eval_tap $? 275 'PublicVerifyUserByLinkV3' test.out

#- 276 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'sTq118Bp' \
    --code 'KUOjqDWl' \
    --error 'wJzbSt9O' \
    --state 'DqHnSSJx' \
    > test.out 2>&1
eval_tap $? 276 'PlatformAuthenticateSAMLV3Handler' test.out

#- 277 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'FSkfC2kC' \
    --payload 'TE4yuV8I' \
    > test.out 2>&1
eval_tap $? 277 'LoginSSOClient' test.out

#- 278 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'DcT4vWEx' \
    > test.out 2>&1
eval_tap $? 278 'LogoutSSOClient' test.out

#- 279 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'TwzjFtVl' \
    > test.out 2>&1
eval_tap $? 279 'RequestGameTokenResponseV3' test.out

#- 280 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MxOYgTpH' \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDevicesByUserV4' test.out

#- 281 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'ywvlSsH6' \
    --endDate 'Ah7UspeI' \
    --limit '41' \
    --offset '78' \
    --startDate 'jTHqJSvp' \
    > test.out 2>&1
eval_tap $? 281 'AdminGetBannedDevicesV4' test.out

#- 282 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tYmrZGx2' \
    > test.out 2>&1
eval_tap $? 282 'AdminGetUserDeviceBansV4' test.out

#- 283 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "5kuQ8YtU", "deviceId": "noAgFeTE", "deviceType": "SDdCCg84", "enabled": true, "endDate": "i3zDtz5F", "ext": {"Fgl3sbpC": {}, "qKNq8TDe": {}, "trgHrpzW": {}}, "reason": "8gzn7OXa"}' \
    > test.out 2>&1
eval_tap $? 283 'AdminBanDeviceV4' test.out

#- 284 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'H6UuKmsO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'AdminGetDeviceBanV4' test.out

#- 285 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'dKXMW5VX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 285 'AdminUpdateDeviceBanV4' test.out

#- 286 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'q3Y2V82I' \
    --startDate 'vvGLtiqr' \
    --deviceType 'QGJcxMw2' \
    > test.out 2>&1
eval_tap $? 286 'AdminGenerateReportV4' test.out

#- 287 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 287 'AdminGetDeviceTypesV4' test.out

#- 288 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '6Sn5WNr0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 288 'AdminGetDeviceBansV4' test.out

#- 289 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'pyWl0rhi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 289 'AdminDecryptDeviceV4' test.out

#- 290 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'A3AfADUy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'AdminUnbanDeviceV4' test.out

#- 291 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'NgoW8stc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'AdminGetUsersByDeviceV4' test.out

#- 292 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 83}' \
    > test.out 2>&1
eval_tap $? 292 'AdminCreateTestUsersV4' test.out

#- 293 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["d0CrZZHG", "2XAEInJs", "5rv4GUF4"]}' \
    > test.out 2>&1
eval_tap $? 293 'AdminBulkCheckValidUserIDV4' test.out

#- 294 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TTW3BxVF' \
    --body '{"avatarUrl": "l63FQwsR", "country": "we0B0ZW6", "dateOfBirth": "2r1dY4XO", "displayName": "mYOW7z2G", "languageTag": "vykQmWKo", "userName": "pegXlu1t"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminUpdateUserV4' test.out

#- 295 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lSt6jUiY' \
    --body '{"code": "DkTG8f9x", "emailAddress": "jT8x9U6j"}' \
    > test.out 2>&1
eval_tap $? 295 'AdminUpdateUserEmailAddressV4' test.out

#- 296 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'w5YaP4o4' \
    > test.out 2>&1
eval_tap $? 296 'AdminDisableUserMFAV4' test.out

#- 297 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '8f93Xhmp' \
    > test.out 2>&1
eval_tap $? 297 'AdminListUserRolesV4' test.out

#- 298 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fjZ8rXHd' \
    --body '{"assignedNamespaces": ["fv9ymxRu", "IyIzpPAw", "fFuvfieU"], "roleId": "P8CMCKse"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateUserRoleV4' test.out

#- 299 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cu1i5z5y' \
    --body '{"assignedNamespaces": ["2uq8REda", "Dipjrkog", "IudtXZDx"], "roleId": "9BxSf8Qu"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminAddUserRoleV4' test.out

#- 300 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VhTa4oi2' \
    --body '{"assignedNamespaces": ["AJA2LH12", "090pb3LA", "QtQdBr94"], "roleId": "OncxNHms"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminRemoveUserRoleV4' test.out

#- 301 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '11' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 301 'AdminGetRolesV4' test.out

#- 302 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "jdCagF7v"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminCreateRoleV4' test.out

#- 303 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'kbNMEX9v' \
    > test.out 2>&1
eval_tap $? 303 'AdminGetRoleV4' test.out

#- 304 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'YuJdMMBJ' \
    > test.out 2>&1
eval_tap $? 304 'AdminDeleteRoleV4' test.out

#- 305 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'Vug2DPr1' \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "qxRaRZeN"}' \
    > test.out 2>&1
eval_tap $? 305 'AdminUpdateRoleV4' test.out

#- 306 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'd1y7JMcv' \
    --body '{"permissions": [{"action": 43, "resource": "Ynr4YDv4", "schedAction": 83, "schedCron": "XsPKC2BQ", "schedRange": ["RUdbXxvG", "nJd7EnGR", "GatIdAqw"]}, {"action": 72, "resource": "42B9DB61", "schedAction": 3, "schedCron": "cBEfihWb", "schedRange": ["hvBXPzqj", "QhViVMpk", "93PD75fh"]}, {"action": 13, "resource": "Zeh6fODd", "schedAction": 40, "schedCron": "T51wotxN", "schedRange": ["L7eLK5LA", "LIUXLa0H", "7AWXWw1C"]}]}' \
    > test.out 2>&1
eval_tap $? 306 'AdminUpdateRolePermissionsV4' test.out

#- 307 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId '6UfnzmkF' \
    --body '{"permissions": [{"action": 64, "resource": "vBOKEtHS", "schedAction": 84, "schedCron": "thkr1QPB", "schedRange": ["pNgiW3Qy", "6ATbeHTy", "75Zogm2z"]}, {"action": 63, "resource": "GhP3z65m", "schedAction": 3, "schedCron": "iHRBaAkt", "schedRange": ["ynjhjdyK", "mZh5FBtx", "cFs7VBPT"]}, {"action": 18, "resource": "So45WUBm", "schedAction": 7, "schedCron": "fS4FDUz2", "schedRange": ["qNSOcYnj", "v8qdsGRu", "IYdnUSh2"]}]}' \
    > test.out 2>&1
eval_tap $? 307 'AdminAddRolePermissionsV4' test.out

#- 308 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId '1HM429BL' \
    --body '["eDFbH7aP", "0gcI1HGS", "sjF7TEKK"]' \
    > test.out 2>&1
eval_tap $? 308 'AdminDeleteRolePermissionsV4' test.out

#- 309 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'gezIIFYw' \
    --after 'YZw0hQci' \
    --before 'oyzswrT1' \
    --limit '33' \
    > test.out 2>&1
eval_tap $? 309 'AdminListAssignedUsersV4' test.out

#- 310 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId '2fctbuiN' \
    --body '{"assignedNamespaces": ["fBf8A0jX", "1ZepQKVa", "exTEO4rb"], "namespace": "GyJDlbqI", "userId": "fgdrHugU"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminAssignUserToRoleV4' test.out

#- 311 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'JCcIODf9' \
    --body '{"namespace": "HvDQCFC0", "userId": "bG8KIjl6"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminRevokeUserFromRoleV4' test.out

#- 312 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "5TCD7h9w", "country": "UQstL5KM", "dateOfBirth": "3uCbs5Nw", "displayName": "4lqM7HdS", "languageTag": "SF4Cz5pp", "userName": "EfAoOcIC"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateMyUserV4' test.out

#- 313 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 313 'AdminDisableMyAuthenticatorV4' test.out

#- 314 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'zzmjRqyU' \
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
    --code 'jqDlT7e7' \
    > test.out 2>&1
eval_tap $? 323 'AdminEnableMyEmailV4' test.out

#- 324 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 324 'AdminGetMyEnabledFactorsV4' test.out

#- 325 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'wnMOhNq6' \
    > test.out 2>&1
eval_tap $? 325 'AdminMakeFactorMyDefaultV4' test.out

#- 326 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["79db8TkF", "i3mp0HhP", "7S07epXG"], "emailAddresses": ["wglObWcl", "9PUsmdZR", "iDptxdW8"], "isAdmin": false, "namespace": "eQyFwWen", "roleId": "qfuOhAue"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminInviteUserV4' test.out

#- 327 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "JPZAcZKo", "policyId": "RyZ6MuCG", "policyVersionId": "vOyR7FsU"}, {"isAccepted": false, "localizedPolicyVersionId": "j1mrFZu8", "policyId": "NAnmNvuO", "policyVersionId": "xtImZUbc"}, {"isAccepted": true, "localizedPolicyVersionId": "xQ03A0ma", "policyId": "VYwybn1A", "policyVersionId": "IvRbaEQA"}], "authType": "EMAILPASSWD", "country": "eGQOn5k6", "dateOfBirth": "RjuMi4DQ", "displayName": "csdr8ftt", "emailAddress": "BSxcLz77", "password": "Cq9Bcs7L", "passwordMD5Sum": "gdt4nMwv", "username": "NK3C6Rgj", "verified": true}' \
    > test.out 2>&1
eval_tap $? 327 'PublicCreateTestUserV4' test.out

#- 328 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "ZLuEBkmf", "policyId": "As76Q2Ie", "policyVersionId": "1bfeX3Bu"}, {"isAccepted": true, "localizedPolicyVersionId": "GMIF7Hlg", "policyId": "RrtJWVXn", "policyVersionId": "X4N2Ubmw"}, {"isAccepted": true, "localizedPolicyVersionId": "9m5EuFpb", "policyId": "8MQWUhe4", "policyVersionId": "u1OVNnrG"}], "authType": "EMAILPASSWD", "code": "BKHjwaDM", "country": "AtrwcFfH", "dateOfBirth": "ddEhPvmI", "displayName": "6tHBhMg7", "emailAddress": "bfJidaL2", "password": "ZBKcCPrf", "passwordMD5Sum": "SrCvinjJ", "reachMinimumAge": true, "username": "TClQrRbL"}' \
    > test.out 2>&1
eval_tap $? 328 'PublicCreateUserV4' test.out

#- 329 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'RSkJ0reR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "JjqkNGe5", "policyId": "YJn1yJOb", "policyVersionId": "YcS2lDZ2"}, {"isAccepted": false, "localizedPolicyVersionId": "SaN6qjes", "policyId": "GpbCcWla", "policyVersionId": "VoTxqENQ"}, {"isAccepted": false, "localizedPolicyVersionId": "RclRx2BE", "policyId": "KD7NjHM7", "policyVersionId": "rG8lmXEW"}], "authType": "EMAILPASSWD", "country": "NDgaQ5ZX", "dateOfBirth": "0knTtGk5", "displayName": "ybsek9Xn", "password": "2q5kDp1g", "reachMinimumAge": true, "username": "LRxAAvEC"}' \
    > test.out 2>&1
eval_tap $? 329 'CreateUserFromInvitationV4' test.out

#- 330 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "qOQo09yx", "country": "PtvfeQuy", "dateOfBirth": "hDdb3qZb", "displayName": "hEJJHzjU", "languageTag": "RJlyzdal", "userName": "ZDrXOKO5"}' \
    > test.out 2>&1
eval_tap $? 330 'PublicUpdateUserV4' test.out

#- 331 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "G0WeoDMx", "emailAddress": "I591di3w"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicUpdateUserEmailAddressV4' test.out

#- 332 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "vcWcviKj", "country": "2vOTql6A", "dateOfBirth": "LWNR5I3k", "displayName": "aKDAPyMp", "emailAddress": "4SXWmwwE", "password": "JDf0T4OK", "reachMinimumAge": false, "username": "zmG3mDMe", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 332 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 333 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "OEA52HlR", "password": "I56rsZeS", "username": "Y2gujjsA"}' \
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
    --code '0cH6lA4q' \
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
    --deviceToken 'p1kFvLmU' \
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
    --code 'EPbt6LC3' \
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
    --factor '3Bs1QVz1' \
    > test.out 2>&1
eval_tap $? 347 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE