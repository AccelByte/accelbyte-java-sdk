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
echo "1..321"

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
    --body '[{"field": "FpnVB3Wx", "validation": {"allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "blockedWord": ["0yhHTPcq", "ruiRqzId", "1SiM3NbP"], "description": [{"language": "Ts5NMe6J", "message": ["6ciswpGh", "UiJ2rVEN", "0pzu3ebF"]}, {"language": "SNXLXXGt", "message": ["JoCAXv29", "Ak9vBl7s", "rkZfvS1v"]}, {"language": "tyiLXxBJ", "message": ["B6r1I3bR", "4I1AYVl2", "f5zk9leg"]}], "isCustomRegex": false, "letterCase": "5H5I3dro", "maxLength": 89, "maxRepeatingAlphaNum": 64, "maxRepeatingSpecialCharacter": 70, "minCharType": 23, "minLength": 100, "regex": "tLwwJBh4", "specialCharacterLocation": "Ltrn5lq3", "specialCharacters": ["hkNhMbPZ", "V28ZVv1P", "DQ7ufHiq"]}}, {"field": "j3KMB6Qe", "validation": {"allowDigit": false, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "blockedWord": ["xCmMkQQc", "codYlWGE", "Afs1fohP"], "description": [{"language": "muFgHsab", "message": ["mcYAXdD1", "W3DHDru5", "KtHOWH8A"]}, {"language": "phu1NVj2", "message": ["T9UsiubP", "wNr5d5QS", "aT4cZvp3"]}, {"language": "rw3mE9E0", "message": ["z1HT4wuQ", "zNwV76oq", "IFxME2hf"]}], "isCustomRegex": true, "letterCase": "UYdqYR61", "maxLength": 28, "maxRepeatingAlphaNum": 96, "maxRepeatingSpecialCharacter": 34, "minCharType": 13, "minLength": 70, "regex": "lAPV7gAA", "specialCharacterLocation": "hlIHgFtO", "specialCharacters": ["qlGF6C03", "qJUjXbbl", "ObQiOBbV"]}}, {"field": "tnNI42jP", "validation": {"allowDigit": false, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "blockedWord": ["ir1rzZYw", "sxhM008U", "zb6cdMFQ"], "description": [{"language": "yNJPKCnq", "message": ["XWPOUl8X", "xqClrmvR", "WXu3DjbO"]}, {"language": "gobuLzpV", "message": ["ehsNx3LA", "T8PVZ6Kb", "Eeq8OzB7"]}, {"language": "onUIBCxO", "message": ["A9oaJ4FD", "lpQIudbb", "xYRd1CgO"]}], "isCustomRegex": true, "letterCase": "eklCDP5J", "maxLength": 49, "maxRepeatingAlphaNum": 80, "maxRepeatingSpecialCharacter": 46, "minCharType": 39, "minLength": 59, "regex": "6GnmNYL2", "specialCharacterLocation": "3NkDsFke", "specialCharacters": ["UhcMWXua", "3iNlrmD0", "lMWESnqu"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'mtP4fEdk' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'MPe899Nt' \
    --before '51QVF2wg' \
    --limit '13' \
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
    --body '{"ageRestriction": 52, "enable": true}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'fXKpoYic' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 89}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'j4ghjUYm' \
    --limit '90' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "fa0fRMMw", "comment": "Kt3L9waI", "endDate": "n1b2rPOs", "reason": "JIzDAHaD", "skipNotif": false, "userIds": ["qCDoB0Rp", "DqlWHvtI", "IFo00wrf"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "KE08UgYW", "userId": "NnxzPxhb"}, {"banId": "nk6MMFhZ", "userId": "EI3Xm90f"}, {"banId": "lZUyODGr", "userId": "5rGhDn9S"}]}' \
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
    --limit '63' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["FJLmXcEP", "Qirgg6pE", "8OkemqI5"], "baseUri": "McJYOp7E", "clientId": "ZV59RI7W", "clientName": "DXVy0h0O", "clientPermissions": [{"action": 25, "resource": "b9dN6DuC", "schedAction": 46, "schedCron": "HL13uvfY", "schedRange": ["vvo589AQ", "aylQVpio", "Bz45H4Ey"]}, {"action": 27, "resource": "qqnXjwuZ", "schedAction": 19, "schedCron": "BOWBssPn", "schedRange": ["KmZvqdtV", "N95f0dy9", "WsZNksUo"]}, {"action": 96, "resource": "jipa48Rm", "schedAction": 95, "schedCron": "0uokjLHl", "schedRange": ["UnCpf6l5", "b4B41gvw", "kL5X0HHz"]}], "clientPlatform": "uQG3L6Jk", "deletable": false, "namespace": "SSrruaF5", "oauthClientType": "gUajynIL", "redirectUri": "Bbbot2xM", "secret": "ZaJZwO1N"}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'Nh1pDahX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'iePwrbNW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'ENT2k6t6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["kwPJ7uSX", "Gf5Fqgka", "muey8plV"], "baseUri": "eWpFsaN4", "clientName": "h1E0CMgc", "clientPermissions": [{"action": 95, "resource": "aA2dm5sh", "schedAction": 77, "schedCron": "LJul2QfP", "schedRange": ["vccY437G", "XhxqI1sO", "0HWa0syO"]}, {"action": 45, "resource": "SWms1ZVn", "schedAction": 84, "schedCron": "tbf08rAr", "schedRange": ["iOeAARAm", "4WQjv70b", "8BLmUbgi"]}, {"action": 53, "resource": "g45OJayN", "schedAction": 72, "schedCron": "uu9g8roD", "schedRange": ["gqjJ0hiq", "qKeSzhVC", "45o8EYwf"]}], "clientPlatform": "GVNehQGF", "deletable": false, "namespace": "Zgf1NmFb", "redirectUri": "nXVeOIZB"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'HQiXjZyK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 76, "resource": "0aURQMnv"}, {"action": 14, "resource": "7aGHxw0l"}, {"action": 3, "resource": "j5Yhilfq"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'hncIuvgA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 96, "resource": "6BwXMSkJ"}, {"action": 57, "resource": "cJKlx7TJ"}, {"action": 26, "resource": "xLNXiKmn"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '44' \
    --clientId 'ZRDb4Byu' \
    --namespace "$AB_NAMESPACE" \
    --resource '4yu8APnt' \
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
    --limit '6' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RJxYFAr5' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bdjk07YD' \
    --body '{"ACSURL": "Gflx7goz", "AWSCognitoRegion": "kFi2KGJQ", "AWSCognitoUserPool": "2xrKX9L4", "AllowedClients": ["wAGVdplL", "nO3GfIAw", "zDnlENoB"], "AppId": "8jXLKMLR", "AuthorizationEndpoint": "HLbx8yL4", "ClientId": "fL1Zwmkn", "Environment": "k7kxsBFh", "FederationMetadataURL": "4slzdtmy", "GenericOauthFlow": true, "IsActive": false, "Issuer": "YZ64DJYJ", "JWKSEndpoint": "rO8RKReg", "KeyID": "t0kSPk2L", "NetflixCertificates": {"encryptedPrivateKey": "7J9erpHJ", "encryptedPrivateKeyName": "R6qPCPMO", "publicCertificate": "ugwWFeTh", "publicCertificateName": "LzueMEnH", "rootCertificate": "Xsd56EZb", "rootCertificateName": "0vDpaUYe"}, "OrganizationId": "Rh10jIXt", "PlatformName": "2lgQgY0N", "RedirectUri": "wMYnst2L", "RegisteredDomains": [{"affectedClientIDs": ["4MNFDx3T", "CaJ5hPdL", "se7Gj3ws"], "domain": "dJJj7naE", "namespaces": ["hiYliQ9X", "1zKz61sk", "sAoIEtLT"], "roleId": "k90gNr6R"}, {"affectedClientIDs": ["hez5knsW", "lNEtDghU", "7Nhv8u3X"], "domain": "JvLUXS8F", "namespaces": ["nx27bxJQ", "UA6S9w1y", "96BGaKHj"], "roleId": "AExdBqw9"}, {"affectedClientIDs": ["jqJXgCKq", "0yXpW0Lg", "3vOWJeTG"], "domain": "vbpJi1D0", "namespaces": ["dNsGg2ht", "TC7rkNZD", "ed40ctZN"], "roleId": "K3tlo6Da"}], "Secret": "33bKCR8v", "TeamID": "IZg1JqI4", "TokenAuthenticationType": "F9rlb7eo", "TokenClaimsMapping": {"RsxZjJPj": "Epc0PgEH", "yBCar53V": "Tvs16ffV", "wPAPRO6m": "C3drlP9p"}, "TokenEndpoint": "rVQPSIZE"}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'U7lZx04b' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CVUBlFvJ' \
    --body '{"ACSURL": "C6DY53E8", "AWSCognitoRegion": "AeVxGk8b", "AWSCognitoUserPool": "qDsoIvjn", "AllowedClients": ["jhb94pi4", "c7k2sdX6", "FOu4N9tB"], "AppId": "cW2AAyAx", "AuthorizationEndpoint": "eV7fjNCR", "ClientId": "VOSBs47a", "Environment": "fx3Nmuks", "FederationMetadataURL": "0h16suXC", "GenericOauthFlow": true, "IsActive": true, "Issuer": "8dS7LfMQ", "JWKSEndpoint": "c62uMFpr", "KeyID": "42uiluBz", "NetflixCertificates": {"encryptedPrivateKey": "7A6ciVaP", "encryptedPrivateKeyName": "6RkG4IaK", "publicCertificate": "6ub1qXJO", "publicCertificateName": "PMy2zoAt", "rootCertificate": "g7JkI4Yc", "rootCertificateName": "hydHdfbV"}, "OrganizationId": "ee9GPevH", "PlatformName": "HwHOISK9", "RedirectUri": "avzokkbL", "RegisteredDomains": [{"affectedClientIDs": ["1u3ul0de", "KmdxKFQL", "88CC8EAi"], "domain": "I1LNSaZK", "namespaces": ["uF4pVVxy", "SZAvhKLd", "lf7vOstZ"], "roleId": "UCWEqtvc"}, {"affectedClientIDs": ["NdfwDIWN", "simw7NJm", "CFtvN6Q9"], "domain": "YWpgT5GI", "namespaces": ["lKq1ohtz", "Wqm4qqgN", "fzOxQbvr"], "roleId": "mk9Ytn9p"}, {"affectedClientIDs": ["19HDL5in", "9Zvjwfqv", "QDLJlBF4"], "domain": "n2onFdIG", "namespaces": ["ZWwkNgXH", "TP3txB80", "JK4aAEkG"], "roleId": "WTVfAaCQ"}], "Secret": "TjOCJ9ZI", "TeamID": "kQSEXFOz", "TokenAuthenticationType": "PYR4ZvZ1", "TokenClaimsMapping": {"TJEVlF6r": "WBt7wTw2", "gU9MhXBC": "7QIn9lGi", "s9qSgQM7": "ZXSC8V32"}, "TokenEndpoint": "lYRFMN1N"}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Si44o4Q0' \
    --body '{"affectedClientIDs": ["gkQX2ev9", "lF8X8eMr", "uwY41Eri"], "assignedNamespaces": ["3B3i6HYC", "rsblibSQ", "Evgo4BxP"], "domain": "y799RMBL", "roleId": "EjwlzRFj"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TRtFy6pS' \
    --body '{"domain": "nNu6JdY1"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OoqPBGGI' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'A4e2i2Ft' \
    --body '{"acsUrl": "ULsSNok0", "apiKey": "HUNvgNT7", "appId": "AAV5tapp", "federationMetadataUrl": "4GsAjmxu", "isActive": true, "redirectUri": "95gPyXlb", "secret": "1lHyktvo", "ssoUrl": "yUX0Dy6V"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'l2Hqg9BI' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '53VByIy3' \
    --body '{"acsUrl": "uLE7nxjk", "apiKey": "b5S4zcgC", "appId": "kPibXcOF", "federationMetadataUrl": "T06YmFAb", "isActive": false, "redirectUri": "Ejy1v2V2", "secret": "HagU0QQ9", "ssoUrl": "rbHCEpbd"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'iksdPul8' \
    --platformUserId 'W3OT7Ccb' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '9QPx48UR' \
    --after '69' \
    --before '50' \
    --limit '10' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress '28OGsWEd' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["jNGIXsKn", "sH4LV29p", "Z5TCA38y"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["4Bwq24Du", "22OewLFn", "xQkoHtQG"], "isAdmin": false, "roles": ["Dj7cW2LV", "Gqpe4l59", "8qLsYOpE"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 146 'AdminListUsersV3' test.out

#- 147 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'gPpVywkZ' \
    --endDate 'bRR2zcvR' \
    --limit '43' \
    --offset '78' \
    --platformBy 'baullmv6' \
    --platformId '4azwPANI' \
    --query 'n6CTLPUu' \
    --startDate 'Jhz7wbd5' \
    > test.out 2>&1
eval_tap $? 147 'AdminSearchUserV3' test.out

#- 148 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["tCmQMoGy", "XmijBW5x", "KqSpNcl3"]}' \
    > test.out 2>&1
eval_tap $? 148 'AdminGetBulkUserByEmailAddressV3' test.out

#- 149 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'F5ZIRNTl' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserByUserIdV3' test.out

#- 150 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yGbsxTb5' \
    --body '{"avatarUrl": "4LhNMNuR", "country": "ADMpz9Aw", "dateOfBirth": "nEMJL2e2", "displayName": "jkwuEDSQ", "languageTag": "3fKO8I3x", "userName": "wX0isCPj"}' \
    > test.out 2>&1
eval_tap $? 150 'AdminUpdateUserV3' test.out

#- 151 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xuQP3V60' \
    --activeOnly  \
    --after 'nFzGpoFz' \
    --before '6aMJtncP' \
    --limit '84' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserBanV3' test.out

#- 152 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jAz2V0iR' \
    --body '{"ban": "PFbkxQIt", "comment": "aQZfVZh3", "endDate": "dp5oFWQs", "reason": "vokzyUIq", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 152 'AdminBanUserV3' test.out

#- 153 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'XqUzgd0l' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gbLOjnM6' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 153 'AdminUpdateUserBanV3' test.out

#- 154 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YkEXebeV' \
    --body '{"context": "l1E9jxwR", "emailAddress": "s2EOME1I", "languageTag": "KIUpnTwe"}' \
    > test.out 2>&1
eval_tap $? 154 'AdminSendVerificationCodeV3' test.out

#- 155 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6qNCAoFr' \
    --body '{"Code": "UG4HZCkL", "ContactType": "gi4gIe7K", "LanguageTag": "i0mEWWHa", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 155 'AdminVerifyAccountV3' test.out

#- 156 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'wV45QonD' \
    > test.out 2>&1
eval_tap $? 156 'GetUserVerificationCode' test.out

#- 157 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'k4FTmIlc' \
    > test.out 2>&1
eval_tap $? 157 'AdminGetUserDeletionStatusV3' test.out

#- 158 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'd9HmDwXc' \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 158 'AdminUpdateUserDeletionStatusV3' test.out

#- 159 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Efpfi1hy' \
    --body '{"code": "Fyn1hbhv", "country": "JUwiZFbz", "dateOfBirth": "3QIqzuVW", "displayName": "xTIaUqjG", "emailAddress": "wixMHvsZ", "password": "DlNdNlPk", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpgradeHeadlessAccountV3' test.out

#- 160 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8WEgbffO' \
    > test.out 2>&1
eval_tap $? 160 'AdminDeleteUserInformationV3' test.out

#- 161 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7BVK43kp' \
    --after '0.6151022828798105' \
    --before '0.48175618549781607' \
    --limit '31' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetUserLoginHistoriesV3' test.out

#- 162 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SPqWxkCW' \
    --body '{"languageTag": "x1LqOta6", "newPassword": "WuGL6MpF", "oldPassword": "xuaJ3PWJ"}' \
    > test.out 2>&1
eval_tap $? 162 'AdminResetPasswordV3' test.out

#- 163 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vpaLGVL2' \
    --body '{"Permissions": [{"Action": 27, "Resource": "tRlHjW7k", "SchedAction": 36, "SchedCron": "kfuaEVwQ", "SchedRange": ["HXeyFVo8", "ICCVuTWI", "eMRu6386"]}, {"Action": 93, "Resource": "u3HbjDRs", "SchedAction": 30, "SchedCron": "cdaMzB79", "SchedRange": ["KLpWj2U1", "mbbEO9hl", "iU9uCJDS"]}, {"Action": 17, "Resource": "0miF51x6", "SchedAction": 74, "SchedCron": "NFAQPuVp", "SchedRange": ["RtvzUsSK", "PaApq71H", "INi5EruG"]}]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminUpdateUserPermissionV3' test.out

#- 164 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'foE3lY7I' \
    --body '{"Permissions": [{"Action": 59, "Resource": "wld4GxH5", "SchedAction": 40, "SchedCron": "J45hEpwK", "SchedRange": ["MwvL1lPu", "J2KNJbVp", "PPaFg42v"]}, {"Action": 86, "Resource": "5DEUMiqw", "SchedAction": 47, "SchedCron": "7wWgX8jd", "SchedRange": ["XevyJD4Y", "Xnu3WBU4", "95COlFL7"]}, {"Action": 16, "Resource": "NmCLZEar", "SchedAction": 75, "SchedCron": "PSWXvpQK", "SchedRange": ["IGOU9AVW", "uC5hEvE4", "VaJSeYii"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminAddUserPermissionsV3' test.out

#- 165 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2aeQU0rA' \
    --body '[{"Action": 44, "Resource": "C9MjVoPv"}, {"Action": 96, "Resource": "xa7kczZU"}, {"Action": 95, "Resource": "TBkCTUTD"}]' \
    > test.out 2>&1
eval_tap $? 165 'AdminDeleteUserPermissionBulkV3' test.out

#- 166 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '42' \
    --namespace "$AB_NAMESPACE" \
    --resource 'jQQ78KCf' \
    --userId 'AmwlONZn' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionV3' test.out

#- 167 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CQyrgOrW' \
    --after 'twCaWgnC' \
    --before 'eucrwz0U' \
    --limit '7' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserPlatformAccountsV3' test.out

#- 168 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'n6HIsXis' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetListJusticePlatformAccounts' test.out

#- 169 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '9lWbEehY' \
    --userId '3KR2HyOJ' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetUserMapping' test.out

#- 170 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'UGkmW9aT' \
    --userId '2aS1csCb' \
    > test.out 2>&1
eval_tap $? 170 'AdminCreateJusticeUser' test.out

#- 171 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lr35R6TP' \
    --body '{"platformId": "D5vUpXW3", "platformUserId": "cB5lItEP"}' \
    > test.out 2>&1
eval_tap $? 171 'AdminLinkPlatformAccount' test.out

#- 172 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TCJzovdJ' \
    --userId 'SiprRwLF' \
    --body '{"platformNamespace": "7YL9hueg"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminPlatformUnlinkV3' test.out

#- 173 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XbYsTTKr' \
    --userId 'FzZ5HvRN' \
    --ticket 'SgCJVi9E' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformLinkV3' test.out

#- 174 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BLQAIV9J' \
    --body '["GAJWY57V", "iJ4saGfm", "g9T0CCcW"]' \
    > test.out 2>&1
eval_tap $? 174 'AdminDeleteUserRolesV3' test.out

#- 175 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hLerlxxA' \
    --body '[{"namespace": "Ian69tUL", "roleId": "wBgn1wu9"}, {"namespace": "yNSp1Fgu", "roleId": "5CM2MXdC"}, {"namespace": "kNljTlW1", "roleId": "ePGtxD9t"}]' \
    > test.out 2>&1
eval_tap $? 175 'AdminSaveUserRoleV3' test.out

#- 176 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'yk5IGMmX' \
    --userId 'aIk8DLEp' \
    > test.out 2>&1
eval_tap $? 176 'AdminAddUserRoleV3' test.out

#- 177 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'hzFcs1Z3' \
    --userId 'P0XXX8Wl' \
    > test.out 2>&1
eval_tap $? 177 'AdminDeleteUserRoleV3' test.out

#- 178 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WqHE6Xp1' \
    --body '{"enabled": false, "reason": "dORImIcp"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserStatusV3' test.out

#- 179 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2K5wYThf' \
    > test.out 2>&1
eval_tap $? 179 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 180 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'ygE88fum' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "ierFkqHE"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateClientSecretV3' test.out

#- 181 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after '1tNY96ec' \
    --before 'zO9mqDrP' \
    --isWildcard  \
    --limit '31' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetRolesV3' test.out

#- 182 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "managers": [{"displayName": "owsX25RC", "namespace": "41FKgo5C", "userId": "Y6wniS7C"}, {"displayName": "qEMd3szp", "namespace": "hc71nC2M", "userId": "QZIjazy8"}, {"displayName": "MjYmhvnd", "namespace": "9pmHeRi9", "userId": "xWs4EKcN"}], "members": [{"displayName": "rJDIZsK8", "namespace": "XQWGvMJR", "userId": "hV1jxLl7"}, {"displayName": "NkyTidBj", "namespace": "dHauY6FH", "userId": "hvOfhSBd"}, {"displayName": "woVzvkt4", "namespace": "RjKYpm6D", "userId": "Kk7VntBK"}], "permissions": [{"action": 89, "resource": "C8tOZzKD", "schedAction": 39, "schedCron": "jVibD1iu", "schedRange": ["tffnuHUy", "vLYpqTa2", "LFlS6lj0"]}, {"action": 31, "resource": "GAE2VJMy", "schedAction": 50, "schedCron": "z0TSlJVu", "schedRange": ["ZfQd6OIq", "k1UXczen", "CvPI5nsD"]}, {"action": 76, "resource": "UYmceVQw", "schedAction": 75, "schedCron": "88lTJwRr", "schedRange": ["eqqS4gWv", "KS9dGAO2", "oCpW9ukt"]}], "roleName": "ba5aLNy4"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminCreateRoleV3' test.out

#- 183 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'Z9iOjTfm' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRoleV3' test.out

#- 184 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'hYgHXLOd' \
    > test.out 2>&1
eval_tap $? 184 'AdminDeleteRoleV3' test.out

#- 185 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'uwyLn00G' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "UfXANNP1"}' \
    > test.out 2>&1
eval_tap $? 185 'AdminUpdateRoleV3' test.out

#- 186 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'r23IP7EH' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetRoleAdminStatusV3' test.out

#- 187 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId '8uZRKnrL' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateAdminRoleStatusV3' test.out

#- 188 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'HS1WzQxG' \
    > test.out 2>&1
eval_tap $? 188 'AdminRemoveRoleAdminV3' test.out

#- 189 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'EiHf3CKL' \
    --after 'i2EQ42tw' \
    --before '3kF9qjmh' \
    --limit '62' \
    > test.out 2>&1
eval_tap $? 189 'AdminGetRoleManagersV3' test.out

#- 190 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'jKh4HgAb' \
    --body '{"managers": [{"displayName": "EQ6xKa3m", "namespace": "WyHHZyx2", "userId": "b2hK1aWr"}, {"displayName": "uBjCKIge", "namespace": "WYGm0A66", "userId": "9gji95aC"}, {"displayName": "4LmD3M1T", "namespace": "fL1CMuox", "userId": "FRwIPcpo"}]}' \
    > test.out 2>&1
eval_tap $? 190 'AdminAddRoleManagersV3' test.out

#- 191 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'MpnI4hU0' \
    --body '{"managers": [{"displayName": "HtjS9haI", "namespace": "zWP7vvuA", "userId": "dPJTc2JU"}, {"displayName": "iA49lrjR", "namespace": "xUyMHxaX", "userId": "dp2rPPjN"}, {"displayName": "oteQPOHq", "namespace": "k1E6TUAH", "userId": "joNFHlHC"}]}' \
    > test.out 2>&1
eval_tap $? 191 'AdminRemoveRoleManagersV3' test.out

#- 192 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'ZEtJVdME' \
    --after 'ZQBaFpxE' \
    --before 'AQi100uO' \
    --limit '28' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetRoleMembersV3' test.out

#- 193 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'PBPr6e4v' \
    --body '{"members": [{"displayName": "zA8isniQ", "namespace": "KtEgTM6J", "userId": "eprfEx6h"}, {"displayName": "8l6iF2fc", "namespace": "nJfZQW8e", "userId": "KfYWURXB"}, {"displayName": "UibPi7V4", "namespace": "kc3rhYJI", "userId": "ZQWgALJc"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminAddRoleMembersV3' test.out

#- 194 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'hhFyY5at' \
    --body '{"members": [{"displayName": "JwVqJTYG", "namespace": "VoL7PAVT", "userId": "0aTSzPlM"}, {"displayName": "zZ5x7ojO", "namespace": "voJXBXlT", "userId": "ddQ87q6n"}, {"displayName": "qA4IpfkN", "namespace": "FLZVUhsb", "userId": "FKBtUvRh"}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminRemoveRoleMembersV3' test.out

#- 195 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId '1zxyz764' \
    --body '{"permissions": [{"action": 28, "resource": "saX6uFbh", "schedAction": 42, "schedCron": "iZT0SEM7", "schedRange": ["KMGFx6Pz", "srKmS0pH", "5jX0Rhmi"]}, {"action": 40, "resource": "xVZHxWsU", "schedAction": 37, "schedCron": "yATny350", "schedRange": ["wDhLgsfM", "lZwxVkhq", "fOS6hfLX"]}, {"action": 39, "resource": "r1ZxNfkg", "schedAction": 32, "schedCron": "xvFD3sNi", "schedRange": ["Apo8XnVU", "4gGaqWJN", "Sxlh64ng"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminUpdateRolePermissionsV3' test.out

#- 196 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'yu87FfTD' \
    --body '{"permissions": [{"action": 95, "resource": "787m0hbh", "schedAction": 35, "schedCron": "ox0cbyoc", "schedRange": ["V1lM9xeu", "CioRg1Xg", "f1bO5QXW"]}, {"action": 15, "resource": "Qtv2d9qK", "schedAction": 98, "schedCron": "OCjVTKZ7", "schedRange": ["T6dzQJGX", "0RuIWhC3", "C17QjrFb"]}, {"action": 57, "resource": "GpNioiFs", "schedAction": 89, "schedCron": "R7g0oEXG", "schedRange": ["VgTh3X9J", "twzJs50e", "Q75Uou9c"]}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminAddRolePermissionsV3' test.out

#- 197 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'ZI6r1JX4' \
    --body '["mr1uHlzU", "kQaRo6ce", "QwUWmePg"]' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteRolePermissionsV3' test.out

#- 198 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '87' \
    --resource '5QYwtPCN' \
    --roleId 'rVzosrB8' \
    > test.out 2>&1
eval_tap $? 198 'AdminDeleteRolePermissionV3' test.out

#- 199 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 199 'AdminGetMyUserV3' test.out

#- 200 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'hybj3POr' \
    --extendExp  \
    --redirectUri '0NG1WENC' \
    --password 'sSv0hwff' \
    --requestId '6WqNXnKs' \
    --userName 'w4h6zhQp' \
    > test.out 2>&1
eval_tap $? 200 'UserAuthenticationV3' test.out

#- 201 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '7vI0ISO1' \
    --linkingToken 'guaKLqfW' \
    --password 'GLvBTwet' \
    --username 'cKm1RnbX' \
    > test.out 2>&1
eval_tap $? 201 'AuthenticationWithPlatformLinkV3' test.out

#- 202 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'McGg9JRK' \
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
    --clientId 'Iennl7h4' \
    > test.out 2>&1
eval_tap $? 205 'RequestGameTokenCodeResponseV3' test.out

#- 206 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'o3JXs2md' \
    --userId 'bXV5bU4a' \
    > test.out 2>&1
eval_tap $? 206 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 207 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'G8jxVCal' \
    > test.out 2>&1
eval_tap $? 207 'RevokeUserV3' test.out

#- 208 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'zeFHjN5v' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --redirectUri 'cSJuV6Nw' \
    --scope 'QkpXLPMQ' \
    --state 'gNriD8jD' \
    --targetAuthPage 'Pj7DC2TB' \
    --clientId 'xOzZtc8j' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 208 'AuthorizeV3' test.out

#- 209 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'GK5WfgF6' \
    > test.out 2>&1
eval_tap $? 209 'TokenIntrospectionV3' test.out

#- 210 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 210 'GetJWKSV3' test.out

#- 211 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'xiMntRmr' \
    --mfaToken '0WkXMSSW' \
    > test.out 2>&1
eval_tap $? 211 'Change2faMethod' test.out

#- 212 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'zw2g17Tt' \
    --factor 'cTXN1TWb' \
    --mfaToken 'SWuzQbvx' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 212 'Verify2faCode' test.out

#- 213 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gSh1OlQJ' \
    --userId 'XIETe52X' \
    > test.out 2>&1
eval_tap $? 213 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 214 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'XpWgmdYC' \
    --clientId '1aJlwqdW' \
    --redirectUri 'YG2gLy8a' \
    --requestId 'vtrDE3km' \
    > test.out 2>&1
eval_tap $? 214 'AuthCodeRequestV3' test.out

#- 215 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'nAQawxUr' \
    --clientId 'ymfPX8eU' \
    --createHeadless  \
    --deviceId 'nsv58tg3' \
    --platformToken 'KvUN0IBT' \
    > test.out 2>&1
eval_tap $? 215 'PlatformTokenGrantV3' test.out

#- 216 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 216 'GetRevocationListV3' test.out

#- 217 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token '2KNSAFCG' \
    > test.out 2>&1
eval_tap $? 217 'TokenRevocationV3' test.out

#- 218 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'Me1jWwMn' \
    --code 'JOLJFoqO' \
    --codeVerifier 'aaex4tnm' \
    --extendExp  \
    --password 'snCWKEUE' \
    --redirectUri 'nQxKK27A' \
    --refreshToken 'DDogZlBK' \
    --username 'AXzKKs4d' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 218 'TokenGrantV3' test.out

#- 219 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'yy2UAASG' \
    > test.out 2>&1
eval_tap $? 219 'VerifyTokenV3' test.out

#- 220 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'LV16eJG4' \
    --code 'vi2cpo2w' \
    --error 'c42RQBik' \
    --openidAssocHandle 'UjNPqZFu' \
    --openidClaimedId 'QglLU4nk' \
    --openidIdentity '9t8JQzfi' \
    --openidMode '97vrZZVq' \
    --openidNs 'fJjkQk35' \
    --openidOpEndpoint 'ga6kTYL5' \
    --openidResponseNonce 'viz2C9hL' \
    --openidReturnTo '4nb28P1V' \
    --openidSig 'baOCAWKO' \
    --openidSigned '042cKVu0' \
    --state 'gmyHim4g' \
    > test.out 2>&1
eval_tap $? 220 'PlatformAuthenticationV3' test.out

#- 221 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'MERU7X72' \
    > test.out 2>&1
eval_tap $? 221 'PublicGetInputValidations' test.out

#- 222 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'r2BmuLBb' \
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
    --clientId 'pIcjSUBq' \
    > test.out 2>&1
eval_tap $? 224 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 225 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dYzqRZwG' \
    --body '{"platformUserIds": ["ro6iAJMF", "a4iO2m7a", "08tIzQM6"]}' \
    > test.out 2>&1
eval_tap $? 225 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 226 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Oc3DOMvD' \
    --platformUserId 'njGH2orh' \
    > test.out 2>&1
eval_tap $? 226 'PublicGetUserByPlatformUserIDV3' test.out

#- 227 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'uQo4aNC2' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetAsyncStatus' test.out

#- 228 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'YtucqPFR' \
    --limit '78' \
    --offset '88' \
    --query 'KAhi6376' \
    > test.out 2>&1
eval_tap $? 228 'PublicSearchUserV3' test.out

#- 229 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "zmuF4E4K", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "MbDGYLHY", "policyId": "GM0r7qMS", "policyVersionId": "tHrHDmSh"}, {"isAccepted": true, "localizedPolicyVersionId": "ux3PXz1M", "policyId": "MmCmRlu0", "policyVersionId": "T7hJr3iG"}, {"isAccepted": true, "localizedPolicyVersionId": "gNmmui4b", "policyId": "lDjRjEIo", "policyVersionId": "c2lPtCpK"}], "authType": "CAyRTn8I", "code": "r3clWSmi", "country": "pKBpdryn", "dateOfBirth": "xDrr5wDH", "displayName": "m6fKP6Q3", "emailAddress": "qXLivS2u", "password": "qmoPI4Wq", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 229 'PublicCreateUserV3' test.out

#- 230 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'ilswYCsC' \
    --query 'wJxpHaTG' \
    > test.out 2>&1
eval_tap $? 230 'CheckUserAvailability' test.out

#- 231 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["6cyvdrqB", "0ZToXojc", "xQsUuomg"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicBulkGetUsers' test.out

#- 232 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "Fwh1Y5UZ", "languageTag": "6FElywiv"}' \
    > test.out 2>&1
eval_tap $? 232 'PublicSendRegistrationCode' test.out

#- 233 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "MJkDYuUe", "emailAddress": "k57Cq4ty"}' \
    > test.out 2>&1
eval_tap $? 233 'PublicVerifyRegistrationCode' test.out

#- 234 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "0ZAdiWZx", "languageTag": "Sme02qpf"}' \
    > test.out 2>&1
eval_tap $? 234 'PublicForgotPasswordV3' test.out

#- 235 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'EahAAviQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 235 'GetAdminInvitationV3' test.out

#- 236 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'FR3UJtnR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "qrIJNUIF", "policyId": "jhw9L6JL", "policyVersionId": "7tUgYncK"}, {"isAccepted": true, "localizedPolicyVersionId": "ijrdFQ0D", "policyId": "bLkd2MZN", "policyVersionId": "iX2t07GE"}, {"isAccepted": true, "localizedPolicyVersionId": "BsNusLDd", "policyId": "dW7EmGwx", "policyVersionId": "5m7UXEi5"}], "authType": "EMAILPASSWD", "country": "oCzKUOe6", "dateOfBirth": "wWLQMMD7", "displayName": "9hNnHAio", "password": "SBYwtFST", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 236 'CreateUserFromInvitationV3' test.out

#- 237 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "NP3F252j", "country": "fG8mFnM2", "dateOfBirth": "rPklCIBw", "displayName": "gcxuhp7C", "languageTag": "gIzmBo7m", "userName": "S52o755T"}' \
    > test.out 2>&1
eval_tap $? 237 'UpdateUserV3' test.out

#- 238 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "ONZYkzWp", "country": "QJ2uxCh1", "dateOfBirth": "KKaKbzsm", "displayName": "3gMFIsT9", "languageTag": "FQwOWOWi", "userName": "YCdYh2mB"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicPartialUpdateUserV3' test.out

#- 239 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "70cl6AEN", "emailAddress": "c7owNjxv", "languageTag": "F9cQDrq4"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicSendVerificationCodeV3' test.out

#- 240 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "pmMjRm93", "contactType": "AEfJucGZ", "languageTag": "DBcrvnMv", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 240 'PublicUserVerificationV3' test.out

#- 241 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "9G7Xax77", "country": "yyQIVMX6", "dateOfBirth": "8edVTuvG", "displayName": "Due3ettI", "emailAddress": "bpHf2bGy", "password": "RlUsY8SJ", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 241 'PublicUpgradeHeadlessAccountV3' test.out

#- 242 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "pSR7cxzw", "password": "dZ4OmbCn"}' \
    > test.out 2>&1
eval_tap $? 242 'PublicVerifyHeadlessAccountV3' test.out

#- 243 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "GcPjpV0d", "newPassword": "QNHyopzo", "oldPassword": "1fof54EK"}' \
    > test.out 2>&1
eval_tap $? 243 'PublicUpdatePasswordV3' test.out

#- 244 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'tR0U85Gg' \
    > test.out 2>&1
eval_tap $? 244 'PublicCreateJusticeUser' test.out

#- 245 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CPVrk9V5' \
    --redirectUri 'xegsbdY6' \
    --ticket 'orbf0P8F' \
    > test.out 2>&1
eval_tap $? 245 'PublicPlatformLinkV3' test.out

#- 246 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oPNX1Bgj' \
    --body '{"platformNamespace": "jTEZs5sP"}' \
    > test.out 2>&1
eval_tap $? 246 'PublicPlatformUnlinkV3' test.out

#- 247 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Uub4TJPe' \
    > test.out 2>&1
eval_tap $? 247 'PublicPlatformUnlinkAllV3' test.out

#- 248 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TfruSilZ' \
    --ticket 'aMdfUoZN' \
    > test.out 2>&1
eval_tap $? 248 'PublicForcePlatformLinkV3' test.out

#- 249 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rG4Uhdiq' \
    --clientId '9IlK3zSs' \
    --redirectUri 'Socd0AHK' \
    > test.out 2>&1
eval_tap $? 249 'PublicWebLinkPlatform' test.out

#- 250 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pITK63o7' \
    --state 'Gd4WaO7x' \
    > test.out 2>&1
eval_tap $? 250 'PublicWebLinkPlatformEstablish' test.out

#- 251 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "oWXnw7tl", "emailAddress": "dy8AY81M", "newPassword": "5I3F80RG"}' \
    > test.out 2>&1
eval_tap $? 251 'ResetPasswordV3' test.out

#- 252 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EEeom28c' \
    > test.out 2>&1
eval_tap $? 252 'PublicGetUserByUserIdV3' test.out

#- 253 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fFd17VNz' \
    --activeOnly  \
    --after 'P2JSBtGo' \
    --before 'Xxku2u0Z' \
    --limit '28' \
    > test.out 2>&1
eval_tap $? 253 'PublicGetUserBanHistoryV3' test.out

#- 254 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'm4SKiiJy' \
    > test.out 2>&1
eval_tap $? 254 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 255 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8fr7pZ28' \
    > test.out 2>&1
eval_tap $? 255 'PublicGetUserInformationV3' test.out

#- 256 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CZ1IliVk' \
    --after '0.7081929603574278' \
    --before '0.2322786880893395' \
    --limit '54' \
    > test.out 2>&1
eval_tap $? 256 'PublicGetUserLoginHistoriesV3' test.out

#- 257 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mSDRmZRZ' \
    --after 'l6wecHds' \
    --before '4zDcI2jx' \
    --limit '6' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetUserPlatformAccountsV3' test.out

#- 258 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gqj6RYwa' \
    > test.out 2>&1
eval_tap $? 258 'PublicListJusticePlatformAccountsV3' test.out

#- 259 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'fWNZ6Qs6' \
    --body '{"platformId": "6jVwJxs2", "platformUserId": "Vo1iGMAQ"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicLinkPlatformAccount' test.out

#- 260 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'rC5WVHPE' \
    --body '{"chosenNamespaces": ["mqbodZ1h", "DrAuDXKt", "KIq63FpY"], "requestId": "qiOpuWcf"}' \
    > test.out 2>&1
eval_tap $? 260 'PublicForceLinkPlatformWithProgression' test.out

#- 261 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'x1j85ISx' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetPublisherUserV3' test.out

#- 262 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yar4w07K' \
    --password 'gHHaLx8N' \
    > test.out 2>&1
eval_tap $? 262 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 263 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after '3LUoKGsV' \
    --before 'VCyo1kqj' \
    --isWildcard  \
    --limit '66' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetRolesV3' test.out

#- 264 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'B38zq8ip' \
    > test.out 2>&1
eval_tap $? 264 'PublicGetRoleV3' test.out

#- 265 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 265 'PublicGetMyUserV3' test.out

#- 266 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "vH2lI6Ud"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicSendVerificationLinkV3' test.out

#- 267 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'VhPL1Tcq' \
    > test.out 2>&1
eval_tap $? 267 'PublicVerifyUserByLinkV3' test.out

#- 268 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'i7AuJGhr' \
    --code 'eLq18N7P' \
    --error 't1myLPaE' \
    --state 'cz1Tx7hB' \
    > test.out 2>&1
eval_tap $? 268 'PlatformAuthenticateSAMLV3Handler' test.out

#- 269 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'zlNDor4q' \
    --payload 'tTVS4LUZ' \
    > test.out 2>&1
eval_tap $? 269 'LoginSSOClient' test.out

#- 270 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'qKyO7jfw' \
    > test.out 2>&1
eval_tap $? 270 'LogoutSSOClient' test.out

#- 271 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code '1ARikttn' \
    > test.out 2>&1
eval_tap $? 271 'RequestGameTokenResponseV3' test.out

#- 272 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 90}' \
    > test.out 2>&1
eval_tap $? 272 'AdminCreateTestUsersV4' test.out

#- 273 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["elZ3Hx3a", "upd9B40D", "7dYd6etI"]}' \
    > test.out 2>&1
eval_tap $? 273 'AdminBulkCheckValidUserIDV4' test.out

#- 274 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '1TUl5R35' \
    --body '{"avatarUrl": "fEqmdh86", "country": "f2MnklpX", "dateOfBirth": "Y5kYF2P8", "displayName": "ic3rlJEE", "languageTag": "HvsaqfcI", "userName": "BT1NTvTu"}' \
    > test.out 2>&1
eval_tap $? 274 'AdminUpdateUserV4' test.out

#- 275 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'z6k7x4y6' \
    --body '{"code": "id2ShmfU", "emailAddress": "52vTWwzF"}' \
    > test.out 2>&1
eval_tap $? 275 'AdminUpdateUserEmailAddressV4' test.out

#- 276 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ow1YYEo5' \
    > test.out 2>&1
eval_tap $? 276 'AdminDisableUserMFAV4' test.out

#- 277 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'v7MrMZ0i' \
    > test.out 2>&1
eval_tap $? 277 'AdminListUserRolesV4' test.out

#- 278 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LQlLtTTC' \
    --body '{"assignedNamespaces": ["WmvFZYOL", "1uW40kHC", "oXECTGFH"], "roleId": "NQdduiy1"}' \
    > test.out 2>&1
eval_tap $? 278 'AdminUpdateUserRoleV4' test.out

#- 279 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zNm2peUN' \
    --body '{"assignedNamespaces": ["RRLZSA0a", "Lru93gm6", "xa2ZO5kG"], "roleId": "nbvinwDj"}' \
    > test.out 2>&1
eval_tap $? 279 'AdminAddUserRoleV4' test.out

#- 280 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tYaz0n5n' \
    --body '{"assignedNamespaces": ["0zMieR9n", "tzQrSKHT", "ScIQ2eh5"], "roleId": "BcnsPOEX"}' \
    > test.out 2>&1
eval_tap $? 280 'AdminRemoveUserRoleV4' test.out

#- 281 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '71' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 281 'AdminGetRolesV4' test.out

#- 282 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "ALhIYBM4"}' \
    > test.out 2>&1
eval_tap $? 282 'AdminCreateRoleV4' test.out

#- 283 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'S0uwijTW' \
    > test.out 2>&1
eval_tap $? 283 'AdminGetRoleV4' test.out

#- 284 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'PNt9zZaj' \
    > test.out 2>&1
eval_tap $? 284 'AdminDeleteRoleV4' test.out

#- 285 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'dFPCAZpL' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "akFxxsmN"}' \
    > test.out 2>&1
eval_tap $? 285 'AdminUpdateRoleV4' test.out

#- 286 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'RiqHCiVD' \
    --body '{"permissions": [{"action": 13, "resource": "fjupw7IR", "schedAction": 8, "schedCron": "qUbTGKGM", "schedRange": ["tlrYJyiu", "qXmzBKx1", "oEMkf9VW"]}, {"action": 19, "resource": "coLawqTR", "schedAction": 30, "schedCron": "Y76pzWJ5", "schedRange": ["c071bnnF", "Cdkg100Q", "D7UMbJxE"]}, {"action": 52, "resource": "qfHpYCDm", "schedAction": 42, "schedCron": "GB88KhDb", "schedRange": ["KSFSiLkI", "8wKV67sO", "juJmBbfv"]}]}' \
    > test.out 2>&1
eval_tap $? 286 'AdminUpdateRolePermissionsV4' test.out

#- 287 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'ywMWhU2f' \
    --body '{"permissions": [{"action": 13, "resource": "qz82Zp9s", "schedAction": 25, "schedCron": "xDoh69Sv", "schedRange": ["cknMy87z", "XiRMN5oH", "Hxw7y9FD"]}, {"action": 50, "resource": "aw5wgB1d", "schedAction": 44, "schedCron": "WgBrMQyd", "schedRange": ["FB8yUhpc", "0sGMpFxh", "kloEVJaw"]}, {"action": 74, "resource": "B7IQA9ec", "schedAction": 32, "schedCron": "HV4VVcFi", "schedRange": ["AH1cTF7P", "MegLE8uG", "aXH6HQG9"]}]}' \
    > test.out 2>&1
eval_tap $? 287 'AdminAddRolePermissionsV4' test.out

#- 288 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'wQYYBDdI' \
    --body '["WgPlCQ4v", "l93j7Qlg", "cky3wlZ1"]' \
    > test.out 2>&1
eval_tap $? 288 'AdminDeleteRolePermissionsV4' test.out

#- 289 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'rhE5HgyP' \
    --after '2Mts8xN1' \
    --before 'I3XpkFfE' \
    --limit '32' \
    > test.out 2>&1
eval_tap $? 289 'AdminListAssignedUsersV4' test.out

#- 290 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'F7YAYWRr' \
    --body '{"assignedNamespaces": ["LyXOAlnP", "Iyd8oNec", "Yd0tm1fz"], "namespace": "cXzwCmx9", "userId": "wMlWcl2q"}' \
    > test.out 2>&1
eval_tap $? 290 'AdminAssignUserToRoleV4' test.out

#- 291 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'iHE5jSxw' \
    --body '{"namespace": "1hDhlDXl", "userId": "FVBGDzDb"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminRevokeUserFromRoleV4' test.out

#- 292 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "Tnr63suY", "country": "xRNMsiKP", "dateOfBirth": "sDp59bRM", "displayName": "un7wceKV", "languageTag": "n0lTeQFM", "userName": "ZS27T9tl"}' \
    > test.out 2>&1
eval_tap $? 292 'AdminUpdateMyUserV4' test.out

#- 293 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 293 'AdminDisableMyAuthenticatorV4' test.out

#- 294 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '8Brfxt6D' \
    > test.out 2>&1
eval_tap $? 294 'AdminEnableMyAuthenticatorV4' test.out

#- 295 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 295 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 296 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 296 'AdminGetMyBackupCodesV4' test.out

#- 297 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 297 'AdminGenerateMyBackupCodesV4' test.out

#- 298 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 298 'AdminDisableMyBackupCodesV4' test.out

#- 299 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 299 'AdminDownloadMyBackupCodesV4' test.out

#- 300 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 300 'AdminEnableMyBackupCodesV4' test.out

#- 301 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 301 'AdminGetMyEnabledFactorsV4' test.out

#- 302 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'ZMaRmqLe' \
    > test.out 2>&1
eval_tap $? 302 'AdminMakeFactorMyDefaultV4' test.out

#- 303 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["RUFhcTCv", "4AG4CXR6", "cWoRKzX8"], "emailAddresses": ["w3tOLgKf", "qg7vQd1N", "BTWQfflV"], "isAdmin": true, "roleId": "FRC3Uv59"}' \
    > test.out 2>&1
eval_tap $? 303 'AdminInviteUserV4' test.out

#- 304 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "0hHR9v7a", "policyId": "r5XIGdcK", "policyVersionId": "PrEExmDL"}, {"isAccepted": false, "localizedPolicyVersionId": "rpvQSrj5", "policyId": "5teheXf8", "policyVersionId": "iLbPIQON"}, {"isAccepted": true, "localizedPolicyVersionId": "frkmJtpv", "policyId": "1Dcrm5Aj", "policyVersionId": "29I75XEp"}], "authType": "EMAILPASSWD", "country": "HlFvVvCu", "dateOfBirth": "0FC3K7uR", "displayName": "tjoUxeo9", "emailAddress": "6cG4vMji", "password": "SbPRTNaI", "passwordMD5Sum": "uoO2XhzX", "username": "Rbbian5J", "verified": false}' \
    > test.out 2>&1
eval_tap $? 304 'PublicCreateTestUserV4' test.out

#- 305 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "7Gmt13E3", "policyId": "LlG8RTsZ", "policyVersionId": "ewirDgnO"}, {"isAccepted": true, "localizedPolicyVersionId": "8iBihbPN", "policyId": "qTwUOLzB", "policyVersionId": "VHpLklJ4"}, {"isAccepted": false, "localizedPolicyVersionId": "z4MhR21R", "policyId": "mprQEZLX", "policyVersionId": "iyMeGL1V"}], "authType": "EMAILPASSWD", "code": "R4nxgE4H", "country": "xPn5PjLV", "dateOfBirth": "D05oWtwu", "displayName": "Q3BbQTXs", "emailAddress": "EbzL14BB", "password": "JwVWLtGJ", "passwordMD5Sum": "9TfG43IN", "reachMinimumAge": true, "username": "rSnmM7Mb"}' \
    > test.out 2>&1
eval_tap $? 305 'PublicCreateUserV4' test.out

#- 306 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId '4BMK9Oft' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "DCigJpKP", "policyId": "KCggidtT", "policyVersionId": "lMVjXbqO"}, {"isAccepted": false, "localizedPolicyVersionId": "KK3EkKsF", "policyId": "YWVNiOLi", "policyVersionId": "HMwgd7Kz"}, {"isAccepted": false, "localizedPolicyVersionId": "XPSJb9Qg", "policyId": "3AylAOWA", "policyVersionId": "P4qBdqn4"}], "authType": "EMAILPASSWD", "country": "L6N4INpI", "dateOfBirth": "1W4YwfHp", "displayName": "wYsFpMyk", "password": "sm6rvPI2", "reachMinimumAge": true, "username": "JnexlMf8"}' \
    > test.out 2>&1
eval_tap $? 306 'CreateUserFromInvitationV4' test.out

#- 307 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "VopahH4N", "country": "q9IK3AZJ", "dateOfBirth": "r5QEC51k", "displayName": "10LzgjP0", "languageTag": "cQJph19P", "userName": "iBVjtDSM"}' \
    > test.out 2>&1
eval_tap $? 307 'PublicUpdateUserV4' test.out

#- 308 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "bM1Oliso", "emailAddress": "n8oQH3x9"}' \
    > test.out 2>&1
eval_tap $? 308 'PublicUpdateUserEmailAddressV4' test.out

#- 309 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "8khEeih7", "country": "kjJjHk6B", "dateOfBirth": "Pl0RVcx6", "displayName": "ivAwvykT", "emailAddress": "r9jM6PcH", "password": "AqLEEmGI", "reachMinimumAge": false, "username": "DhDraCCy", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 309 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 310 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "oIh5pITj", "password": "eiYG574h", "username": "PO6NJ6V8"}' \
    > test.out 2>&1
eval_tap $? 310 'PublicUpgradeHeadlessAccountV4' test.out

#- 311 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 311 'PublicDisableMyAuthenticatorV4' test.out

#- 312 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'kkS6NqI3' \
    > test.out 2>&1
eval_tap $? 312 'PublicEnableMyAuthenticatorV4' test.out

#- 313 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 313 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 314 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 314 'PublicGetMyBackupCodesV4' test.out

#- 315 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 315 'PublicGenerateMyBackupCodesV4' test.out

#- 316 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 316 'PublicDisableMyBackupCodesV4' test.out

#- 317 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 317 'PublicDownloadMyBackupCodesV4' test.out

#- 318 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 318 'PublicEnableMyBackupCodesV4' test.out

#- 319 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken '0Vl2ydOu' \
    > test.out 2>&1
eval_tap $? 319 'PublicRemoveTrustedDeviceV4' test.out

#- 320 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 320 'PublicGetMyEnabledFactorsV4' test.out

#- 321 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'UWiRbcAd' \
    > test.out 2>&1
eval_tap $? 321 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE