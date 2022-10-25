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
    --body '[{"field": "FilWuyLJ", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": false, "allowUnicode": true, "blockedWord": ["RYWvldyR", "APCdsx1D", "LapEaTlz"], "description": [{"language": "8WdLDqYp", "message": ["ibXtgVch", "QvgHKP0o", "oKvbCpua"]}, {"language": "Vg43xMNI", "message": ["yzPdQKBU", "a5oZimdd", "ROLru3f4"]}, {"language": "njxgVl2S", "message": ["iUYNstrI", "VOHuqUko", "D0mKEOlM"]}], "isCustomRegex": true, "letterCase": "EHyAEQhZ", "maxLength": 65, "maxRepeatingAlphaNum": 48, "maxRepeatingSpecialCharacter": 29, "minCharType": 12, "minLength": 83, "regex": "lUw0bpwv", "specialCharacterLocation": "6mShURKb", "specialCharacters": ["2KKZkjZr", "QhPeunP4", "3L4LQLpm"]}}, {"field": "ZEzoQaxr", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "blockedWord": ["DAvJQnp1", "awDRlpND", "vccKLM6x"], "description": [{"language": "5Aobt8Ee", "message": ["cM5wC6Uh", "UCI6Ctjx", "yCyA7Yn0"]}, {"language": "arTV0txM", "message": ["lGxgpGWi", "I5LAojGs", "RbCbxtZH"]}, {"language": "KgizsRpR", "message": ["5vWrmtPh", "pGfyCzSh", "2fef7iN2"]}], "isCustomRegex": false, "letterCase": "WK7TzMfo", "maxLength": 75, "maxRepeatingAlphaNum": 21, "maxRepeatingSpecialCharacter": 100, "minCharType": 29, "minLength": 95, "regex": "JHIeKx0y", "specialCharacterLocation": "v3ZYukoL", "specialCharacters": ["GkxFvXJr", "K2SwkKYT", "8IWUzzA2"]}}, {"field": "MkgC26p3", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "blockedWord": ["Kk3imEja", "KW1DPocP", "G3D3dcOn"], "description": [{"language": "Hcp3sr9P", "message": ["46bfQBNx", "agY7mGrB", "MYGp5LBf"]}, {"language": "67t1QQjl", "message": ["yuxM649g", "xHVca67p", "mHKMFNr2"]}, {"language": "ZOqRD0bC", "message": ["e0TCtUzr", "5T1l33CI", "5NBeEAWm"]}], "isCustomRegex": false, "letterCase": "ddOgopmF", "maxLength": 63, "maxRepeatingAlphaNum": 51, "maxRepeatingSpecialCharacter": 4, "minCharType": 74, "minLength": 12, "regex": "fU9w9Vks", "specialCharacterLocation": "PZUdyp9A", "specialCharacters": ["sGR7SnUN", "hYmwOMW9", "CezDlU6m"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field '5hePeudl' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'rcpxqXhz' \
    --before 'ih3bdCHH' \
    --limit '7' \
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
    --body '{"ageRestriction": 21, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'uIRdWWVY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 74}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'QLfperXM' \
    --limit '36' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "tplA50UR", "comment": "h1qkVnWK", "endDate": "dEkb6zmS", "reason": "dJF94Hu9", "skipNotif": true, "userIds": ["riCnw1Cq", "sUbJ90e9", "7pJM9AVY"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "0mncrQsE", "userId": "96RlO6tF"}, {"banId": "uuO4iqvu", "userId": "4yaA6PAN"}, {"banId": "RVuGuG5X", "userId": "S1mOHECF"}]}' \
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
    --limit '55' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["vg7mGATC", "9KD3nm1h", "vEFLi9Y8"], "baseUri": "TPanmKVn", "clientId": "ihOgMbdW", "clientName": "e5mqWH2S", "clientPermissions": [{"action": 63, "resource": "9GULbGR9", "schedAction": 82, "schedCron": "udE9V7bH", "schedRange": ["mGByGROX", "bdj5RzFh", "mo1p4Fn8"]}, {"action": 4, "resource": "kFCcGkio", "schedAction": 14, "schedCron": "TwuN8fVs", "schedRange": ["AS8HB2tn", "upxm1ber", "CV4pNAhv"]}, {"action": 100, "resource": "9I0OB3Cv", "schedAction": 48, "schedCron": "OAF8zS24", "schedRange": ["HwM1zPc0", "jSo1E9m6", "hAIWH4yX"]}], "clientPlatform": "IkurS8Gj", "deletable": false, "namespace": "5UWDnyME", "oauthAccessTokenExpiration": 69, "oauthClientType": "JIJMmuIZ", "oauthRefreshTokenExpiration": 88, "redirectUri": "cMftujst", "secret": "v5wcu5LQ", "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'uHTvzFYA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'PsE9GpQB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'QcVGHfLI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["24gq52uM", "XGV7rdP6", "zD0FUrMX"], "baseUri": "jYADfasM", "clientName": "wIROw43Q", "clientPermissions": [{"action": 89, "resource": "neIDl6Qw", "schedAction": 57, "schedCron": "RJr8gvpb", "schedRange": ["GnOVPEu8", "t8xDfSnq", "ejtQ6PoS"]}, {"action": 76, "resource": "bd12jQlL", "schedAction": 0, "schedCron": "f9DvJfVm", "schedRange": ["SRfKud5o", "RJXl4QM5", "RN84Z5bA"]}, {"action": 14, "resource": "XRNEmnlC", "schedAction": 42, "schedCron": "N6YpfhM2", "schedRange": ["uOZSudCx", "o87Oy7bp", "TKzbKjRo"]}], "clientPlatform": "9X5pT9Q1", "deletable": true, "namespace": "U3y3LFx9", "oauthAccessTokenExpiration": 60, "oauthRefreshTokenExpiration": 52, "redirectUri": "GfFXVMuy", "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'YUyyn2LU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 12, "resource": "0w10GvqR"}, {"action": 92, "resource": "dcFAEcsT"}, {"action": 52, "resource": "Tm7LDHnp"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'ZwwYe3kW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 86, "resource": "P75lPHaO"}, {"action": 87, "resource": "fdFl1qcZ"}, {"action": 71, "resource": "rityilbQ"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '68' \
    --clientId 'CNUunwL9' \
    --namespace "$AB_NAMESPACE" \
    --resource 'CMKShHo8' \
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
    --limit '41' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ASIBmQ8L' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1te7Z2i9' \
    --body '{"ACSURL": "t2Nadnhb", "AWSCognitoRegion": "iVBilych", "AWSCognitoUserPool": "yIYjly6o", "AllowedClients": ["ORHdh9FP", "Nies0jy8", "k1uyYsi9"], "AppId": "z49e6tIq", "AuthorizationEndpoint": "6t74knT2", "ClientId": "x8ZIPzMw", "Environment": "Zqok8mGz", "FederationMetadataURL": "wFyt03EG", "GenericOauthFlow": false, "IsActive": true, "Issuer": "EkptEAoW", "JWKSEndpoint": "oIszIjxL", "KeyID": "zVkFVLM4", "NetflixCertificates": {"encryptedPrivateKey": "oCf611dv", "encryptedPrivateKeyName": "pxTkaY8G", "publicCertificate": "7iwPG5gb", "publicCertificateName": "qe0ANCBa", "rootCertificate": "mqvcaq15", "rootCertificateName": "EtUWNO5t"}, "OrganizationId": "V1DstI90", "PlatformName": "F50x7d3u", "RedirectUri": "Y17ynpAH", "RegisteredDomains": [{"affectedClientIDs": ["epbHVkmp", "FDNcIq6X", "zvqQcrLp"], "domain": "nb0AGRjU", "namespaces": ["B5fXYJbq", "xBr0AlPe", "M7AOGDxG"], "roleId": "WQoKRvPK"}, {"affectedClientIDs": ["6OEd2uQr", "CMCsBwnM", "EmCPnG7L"], "domain": "nLxdbSBD", "namespaces": ["OtO650Ks", "vjTPDtKm", "DAoVbhdI"], "roleId": "gWcV8hg5"}, {"affectedClientIDs": ["p0u5a5MA", "jwTATSuy", "C0Mi0U1l"], "domain": "0jt7wPrG", "namespaces": ["TTJgKUK0", "7GD8gNi9", "TH21XrzN"], "roleId": "6X3gLXCG"}], "Secret": "rZeUkuYb", "TeamID": "pWShjkaM", "TokenAuthenticationType": "z7t0vCMN", "TokenClaimsMapping": {"Mj8uqRjD": "6Xnva0xD", "Bm5zwAPk": "SLdlHIuA", "Zvloe8Eo": "8r6edSjz"}, "TokenEndpoint": "SedtfvdX"}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3W9ru6V0' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rjcH7vCx' \
    --body '{"ACSURL": "dwpOEwUp", "AWSCognitoRegion": "lCKC3WHb", "AWSCognitoUserPool": "0FIefW0O", "AllowedClients": ["4ZoAtUqj", "eUerxjww", "U8Nw3UuF"], "AppId": "XI91Eazh", "AuthorizationEndpoint": "keOOYjY7", "ClientId": "KNevnfWm", "Environment": "qtRP02Ht", "FederationMetadataURL": "VGwB83oP", "GenericOauthFlow": false, "IsActive": true, "Issuer": "DTDgcFI2", "JWKSEndpoint": "aDrRzj6M", "KeyID": "WOR2DECJ", "NetflixCertificates": {"encryptedPrivateKey": "O9fZ6U3n", "encryptedPrivateKeyName": "fZk7tzxg", "publicCertificate": "AcroEUTg", "publicCertificateName": "mmlzZNAI", "rootCertificate": "Tycdks7g", "rootCertificateName": "oET4OA5u"}, "OrganizationId": "PFLbAnJP", "PlatformName": "dPZS4VBq", "RedirectUri": "9z3ecLiE", "RegisteredDomains": [{"affectedClientIDs": ["oJPnxMKT", "mqOYkJit", "r4AvfQod"], "domain": "0g37Tldq", "namespaces": ["FVo40YJd", "zSfyDaAx", "nTVB7CRm"], "roleId": "I8pze6cm"}, {"affectedClientIDs": ["X6d3vVGl", "jt4mrXYj", "vXcQ7TQV"], "domain": "nFPvWPo3", "namespaces": ["NQoYpRv5", "unUlpAt6", "tgHEZblB"], "roleId": "puHclS8W"}, {"affectedClientIDs": ["mIC6tYJy", "azo2pGrl", "T7lpaMGX"], "domain": "OaBY3l2U", "namespaces": ["kq1qTZ72", "01D6JQY2", "RmX1alY9"], "roleId": "C7UlG23x"}], "Secret": "YxSMQzod", "TeamID": "yMxq6XwL", "TokenAuthenticationType": "bQakJGFW", "TokenClaimsMapping": {"1LTNA4AV": "FAqU6sit", "RRKhAe8N": "9NsDz4l1", "aXkTen6p": "HFSlXNqz"}, "TokenEndpoint": "gmZyb6Yo"}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Fyn8tcB6' \
    --body '{"affectedClientIDs": ["9RMv5yKX", "XWw6O3n2", "Dxm6WHLZ"], "assignedNamespaces": ["Ct8YlBC5", "8OGPccWy", "jAr43i4W"], "domain": "n4XGnfxv", "roleId": "UUaZWWUY"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'i6ecIW0p' \
    --body '{"domain": "LYPXenyU"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KLckLY63' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OVeHCPb9' \
    --body '{"acsUrl": "wywTMHSK", "apiKey": "0ReSZIY5", "appId": "iLxRCYwg", "federationMetadataUrl": "DQCYLEGx", "isActive": true, "redirectUri": "Bm7ShGNI", "secret": "5cdErgyU", "ssoUrl": "ThxpWZNg"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0y5aYIm5' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hxGMUn0Z' \
    --body '{"acsUrl": "gxpAek6I", "apiKey": "9emEGiQz", "appId": "EHEyDdNY", "federationMetadataUrl": "JK7O8Thw", "isActive": true, "redirectUri": "Fd5tebvy", "secret": "J2pdriyD", "ssoUrl": "NQS2FWzo"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'w2XLg4ZT' \
    --platformUserId 'CFlPUdDy' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'aqrl4dox' \
    --after '12' \
    --before '18' \
    --limit '3' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress '4XrnfXoC' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["JQK62vF0", "sQoj6uTn", "VKsD1YYx"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["gEo3OQkO", "vLVGjlFi", "gWVJci2E"], "isAdmin": true, "roles": ["jFaLrAUv", "vrUnIuAR", "KTzEyUE8"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 146 'AdminListUsersV3' test.out

#- 147 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'D80WmRlZ' \
    --endDate '4fGOD6D2' \
    --limit '89' \
    --offset '6' \
    --platformBy 'mZmaaYYm' \
    --platformId 'fa1Z7uWe' \
    --query 'JwkRCutg' \
    --startDate 'c3El72L8' \
    > test.out 2>&1
eval_tap $? 147 'AdminSearchUserV3' test.out

#- 148 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["RQM9CmH2", "F74SdABb", "6hNCj363"]}' \
    > test.out 2>&1
eval_tap $? 148 'AdminGetBulkUserByEmailAddressV3' test.out

#- 149 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PzydwJa1' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserByUserIdV3' test.out

#- 150 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uRwRMd8O' \
    --body '{"avatarUrl": "NLnqrBB4", "country": "kS3jYG0E", "dateOfBirth": "v8zwnMIY", "displayName": "6XNqYflX", "languageTag": "b71YcwUn", "userName": "LyQvAjLI"}' \
    > test.out 2>&1
eval_tap $? 150 'AdminUpdateUserV3' test.out

#- 151 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'y8vpKVpd' \
    --activeOnly  \
    --after 'JGHCgKeM' \
    --before 'hYbklbm2' \
    --limit '65' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserBanV3' test.out

#- 152 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gIe5w02X' \
    --body '{"ban": "w19hAKiB", "comment": "btzi0dcR", "endDate": "7LKb01E9", "reason": "dwugBWb6", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 152 'AdminBanUserV3' test.out

#- 153 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'kafaat7B' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YEFYFr4b' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 153 'AdminUpdateUserBanV3' test.out

#- 154 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KEnbJoHy' \
    --body '{"context": "fpAlBKRS", "emailAddress": "zyQz2fwO", "languageTag": "3Xv2iWh1"}' \
    > test.out 2>&1
eval_tap $? 154 'AdminSendVerificationCodeV3' test.out

#- 155 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HDO4CCtF' \
    --body '{"Code": "KdNvphtD", "ContactType": "1aU6ldmx", "LanguageTag": "zNdJ91mj", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 155 'AdminVerifyAccountV3' test.out

#- 156 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'VSqD7ryL' \
    > test.out 2>&1
eval_tap $? 156 'GetUserVerificationCode' test.out

#- 157 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8fuLzIdY' \
    > test.out 2>&1
eval_tap $? 157 'AdminGetUserDeletionStatusV3' test.out

#- 158 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0u1WDOod' \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 158 'AdminUpdateUserDeletionStatusV3' test.out

#- 159 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'F12xrqit' \
    --body '{"code": "y3c4bcqr", "country": "CthwKk0h", "dateOfBirth": "MBEYC3t9", "displayName": "vSuCdjuZ", "emailAddress": "zZsTfZHk", "password": "eEn0XcO3", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpgradeHeadlessAccountV3' test.out

#- 160 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NkCuFzUM' \
    > test.out 2>&1
eval_tap $? 160 'AdminDeleteUserInformationV3' test.out

#- 161 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'j8PpF91V' \
    --after '0.6730996802479822' \
    --before '0.33614495125042754' \
    --limit '71' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetUserLoginHistoriesV3' test.out

#- 162 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'C8LVqBDQ' \
    --body '{"languageTag": "xmvwYBpI", "newPassword": "H6rWr23Y", "oldPassword": "eEN6SEH8"}' \
    > test.out 2>&1
eval_tap $? 162 'AdminResetPasswordV3' test.out

#- 163 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ANZ8sPMu' \
    --body '{"Permissions": [{"Action": 89, "Resource": "cVus54E3", "SchedAction": 13, "SchedCron": "bOMiQlGJ", "SchedRange": ["2lm6ZlJO", "AIqgFZQe", "xEZC5E9i"]}, {"Action": 81, "Resource": "BCzgJl2i", "SchedAction": 64, "SchedCron": "zMZQ5okX", "SchedRange": ["nJUTwhhq", "WG3hovNQ", "uX6zlx5d"]}, {"Action": 97, "Resource": "SxaKzsxO", "SchedAction": 87, "SchedCron": "0U2MNqx5", "SchedRange": ["QIIKgyoT", "jf9jcCto", "cgWTbx9o"]}]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminUpdateUserPermissionV3' test.out

#- 164 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jgUsByb2' \
    --body '{"Permissions": [{"Action": 28, "Resource": "bpRufPyK", "SchedAction": 90, "SchedCron": "kFD6KAge", "SchedRange": ["7aMbfmYs", "eGdoFZVG", "66j44QBR"]}, {"Action": 29, "Resource": "iJtMELGo", "SchedAction": 62, "SchedCron": "GE5CTUW5", "SchedRange": ["waDctQiz", "7SLMqcjZ", "Ou2OcbU4"]}, {"Action": 80, "Resource": "NaNHBGB4", "SchedAction": 47, "SchedCron": "FDFCsBpY", "SchedRange": ["ityhvVKF", "DgeOXvW7", "yD2FqCCH"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminAddUserPermissionsV3' test.out

#- 165 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3hp7r4IP' \
    --body '[{"Action": 72, "Resource": "IpSO0UaI"}, {"Action": 37, "Resource": "d1Q2Xj8O"}, {"Action": 80, "Resource": "XlfABxn9"}]' \
    > test.out 2>&1
eval_tap $? 165 'AdminDeleteUserPermissionBulkV3' test.out

#- 166 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '53' \
    --namespace "$AB_NAMESPACE" \
    --resource 'M7xqX59T' \
    --userId 'lsQQpfgW' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionV3' test.out

#- 167 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q10m1PML' \
    --after 'TZQkERIu' \
    --before 'vBprKMTG' \
    --limit '27' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserPlatformAccountsV3' test.out

#- 168 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'mHcuwssj' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetListJusticePlatformAccounts' test.out

#- 169 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'FnVrqwuz' \
    --userId 'aHk74Jvw' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetUserMapping' test.out

#- 170 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'jHfmk4mt' \
    --userId 'Omu50x8o' \
    > test.out 2>&1
eval_tap $? 170 'AdminCreateJusticeUser' test.out

#- 171 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'YhNr9f7U' \
    --body '{"platformId": "yuOZ4Odu", "platformUserId": "V3cpDtm2"}' \
    > test.out 2>&1
eval_tap $? 171 'AdminLinkPlatformAccount' test.out

#- 172 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GKMp2G8S' \
    --userId 'gTTIJl3E' \
    --body '{"platformNamespace": "J6I5q1dA"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminPlatformUnlinkV3' test.out

#- 173 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MAV42dgl' \
    --userId '7ptCdz7q' \
    --ticket 'ir5IC0hz' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformLinkV3' test.out

#- 174 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ltMrKOem' \
    --body '["RySJUfJ6", "cNnGx7Si", "OzRWSCTs"]' \
    > test.out 2>&1
eval_tap $? 174 'AdminDeleteUserRolesV3' test.out

#- 175 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kKkvjDr6' \
    --body '[{"namespace": "e0DzAwQQ", "roleId": "rtk7ovba"}, {"namespace": "wGl2kAYK", "roleId": "XuNh5gA7"}, {"namespace": "302Bdoc7", "roleId": "KnDI6WeL"}]' \
    > test.out 2>&1
eval_tap $? 175 'AdminSaveUserRoleV3' test.out

#- 176 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'IsyJGcOa' \
    --userId 'QCYfISZn' \
    > test.out 2>&1
eval_tap $? 176 'AdminAddUserRoleV3' test.out

#- 177 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'XQqMxEm1' \
    --userId 'No3ZhQb5' \
    > test.out 2>&1
eval_tap $? 177 'AdminDeleteUserRoleV3' test.out

#- 178 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MLPSHONk' \
    --body '{"enabled": false, "reason": "NyjF5iXS"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserStatusV3' test.out

#- 179 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qnaZk2GC' \
    > test.out 2>&1
eval_tap $? 179 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 180 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'gJrAkZRW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "ZEAfVSbd"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateClientSecretV3' test.out

#- 181 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'I5DvZVUM' \
    --before 'l43B2gGq' \
    --isWildcard  \
    --limit '31' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetRolesV3' test.out

#- 182 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "managers": [{"displayName": "WQqV31sf", "namespace": "fYoERjI5", "userId": "HpL9AAj5"}, {"displayName": "rsj8KXhv", "namespace": "6mN8139x", "userId": "DvFFgObO"}, {"displayName": "0GDgUzo2", "namespace": "53vPMPCf", "userId": "OQV1s6O5"}], "members": [{"displayName": "Dj6q3ZnH", "namespace": "zbXgRFFW", "userId": "6t3URiqt"}, {"displayName": "kRoqFCbF", "namespace": "Focug2h8", "userId": "SCW5aoyz"}, {"displayName": "iJ2BK5nY", "namespace": "n8My0mM7", "userId": "eoTOA57b"}], "permissions": [{"action": 91, "resource": "lxoFhH5a", "schedAction": 32, "schedCron": "yrwHtPcc", "schedRange": ["CZ5quUsz", "z5JlZO2q", "C19Cmndo"]}, {"action": 99, "resource": "QOCjdfNs", "schedAction": 79, "schedCron": "6TNPDxQJ", "schedRange": ["1KngZl7r", "PXRxaH2f", "3gjIxOTO"]}, {"action": 99, "resource": "coJyY8bi", "schedAction": 9, "schedCron": "1guWpLKL", "schedRange": ["QFs6pf8G", "H9oMTml2", "YlWK7dsI"]}], "roleName": "gHIEJ1Qw"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminCreateRoleV3' test.out

#- 183 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'mNQGEp2l' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRoleV3' test.out

#- 184 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'najpN4KH' \
    > test.out 2>&1
eval_tap $? 184 'AdminDeleteRoleV3' test.out

#- 185 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'Q4J7uoZ8' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "V4PmaeyK"}' \
    > test.out 2>&1
eval_tap $? 185 'AdminUpdateRoleV3' test.out

#- 186 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'b1Ty3CxP' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetRoleAdminStatusV3' test.out

#- 187 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'OuhcTEaO' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateAdminRoleStatusV3' test.out

#- 188 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'LKOEaVwA' \
    > test.out 2>&1
eval_tap $? 188 'AdminRemoveRoleAdminV3' test.out

#- 189 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'r9n60hMN' \
    --after 'OF4De0YQ' \
    --before 'mIrYtKcQ' \
    --limit '10' \
    > test.out 2>&1
eval_tap $? 189 'AdminGetRoleManagersV3' test.out

#- 190 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId '4eg3V13b' \
    --body '{"managers": [{"displayName": "T7aGUAPx", "namespace": "swJGhxbE", "userId": "heyBA1Ck"}, {"displayName": "mcoDFEsQ", "namespace": "NbN5qizZ", "userId": "euqWVYaT"}, {"displayName": "p7MDreht", "namespace": "6wPr8Bjt", "userId": "iy8CAJtG"}]}' \
    > test.out 2>&1
eval_tap $? 190 'AdminAddRoleManagersV3' test.out

#- 191 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'xWlLliSh' \
    --body '{"managers": [{"displayName": "Gt89Vd0s", "namespace": "SXleRIHn", "userId": "zwxudAXQ"}, {"displayName": "sIC7JbLj", "namespace": "hhdINDyJ", "userId": "vAnpZdQ4"}, {"displayName": "LPtTzGju", "namespace": "QmwbgugU", "userId": "LEPHIovW"}]}' \
    > test.out 2>&1
eval_tap $? 191 'AdminRemoveRoleManagersV3' test.out

#- 192 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'Fl549sor' \
    --after 'y1u4HVS1' \
    --before 'wxekV07x' \
    --limit '57' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetRoleMembersV3' test.out

#- 193 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId '3WGLyPPW' \
    --body '{"members": [{"displayName": "qgl11yLK", "namespace": "0Fg9lJN6", "userId": "DOW0l4as"}, {"displayName": "Wm2tJonT", "namespace": "SuN5Es9U", "userId": "j3ptZW0a"}, {"displayName": "7rR868p5", "namespace": "PYLl8MJa", "userId": "X9SoY9m2"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminAddRoleMembersV3' test.out

#- 194 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'WEl7hhPJ' \
    --body '{"members": [{"displayName": "yIKZerGA", "namespace": "kzn3auSm", "userId": "UVYWYBqB"}, {"displayName": "9CfyIXXY", "namespace": "xBpkIw6g", "userId": "yP7OkIKx"}, {"displayName": "7pFhFrdK", "namespace": "wMOaK3IR", "userId": "dflh4Kem"}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminRemoveRoleMembersV3' test.out

#- 195 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'h4fSjZCG' \
    --body '{"permissions": [{"action": 91, "resource": "T8mfXb4p", "schedAction": 38, "schedCron": "L12eZF6h", "schedRange": ["Q113XqZX", "RlhC2hrZ", "mY8WBrXE"]}, {"action": 42, "resource": "lk3rFuXY", "schedAction": 15, "schedCron": "eZqmY1hJ", "schedRange": ["aCKA1kOv", "tdj5SktI", "wA1bFEt0"]}, {"action": 9, "resource": "dWt7Vqzy", "schedAction": 50, "schedCron": "a4uvBNBm", "schedRange": ["18bbiaX2", "KM0qx432", "1yGHcKwd"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminUpdateRolePermissionsV3' test.out

#- 196 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'fFr8w9hw' \
    --body '{"permissions": [{"action": 93, "resource": "Ic6gAEri", "schedAction": 93, "schedCron": "4LkExX2t", "schedRange": ["gRfaz3CE", "GNZg73mj", "pPAqB7QX"]}, {"action": 80, "resource": "eOSJWUlk", "schedAction": 84, "schedCron": "u0EX6ktl", "schedRange": ["Cs2FBIIJ", "C8Ky4sEF", "4EdJ5ybZ"]}, {"action": 97, "resource": "6msbz4iU", "schedAction": 43, "schedCron": "ZV28jvcF", "schedRange": ["hpp6mVfx", "ILxcQsZq", "yEiB3Xhw"]}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminAddRolePermissionsV3' test.out

#- 197 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'Qh5zKxw1' \
    --body '["GRJlFkwT", "cAHJULJO", "C2gw8KRc"]' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteRolePermissionsV3' test.out

#- 198 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '78' \
    --resource 'COsgvRVt' \
    --roleId '82V8sp6P' \
    > test.out 2>&1
eval_tap $? 198 'AdminDeleteRolePermissionV3' test.out

#- 199 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 199 'AdminGetMyUserV3' test.out

#- 200 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'TfXbHa9R' \
    --extendExp  \
    --redirectUri 'ViKB7fBY' \
    --password 'zf8IFOSD' \
    --requestId 'wFOFHC8l' \
    --userName 'y09hh7O5' \
    > test.out 2>&1
eval_tap $? 200 'UserAuthenticationV3' test.out

#- 201 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'dCeD85a6' \
    --linkingToken '3Nqm8DAR' \
    --password 'cIqSSuq7' \
    --username '0AdsIN6L' \
    > test.out 2>&1
eval_tap $? 201 'AuthenticationWithPlatformLinkV3' test.out

#- 202 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken '1GyVEwGI' \
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
    --clientId 'CKy6EonK' \
    > test.out 2>&1
eval_tap $? 205 'RequestGameTokenCodeResponseV3' test.out

#- 206 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dIA502xr' \
    --userId 'lnienaOi' \
    > test.out 2>&1
eval_tap $? 206 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 207 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ag0XirKu' \
    > test.out 2>&1
eval_tap $? 207 'RevokeUserV3' test.out

#- 208 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge '0SUVJaKW' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --redirectUri 'B1Q3pyi7' \
    --scope '4aEiT8Yc' \
    --state '6kuwxWfR' \
    --targetAuthPage 'dZaRPnZu' \
    --clientId 'iFlfYD0t' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 208 'AuthorizeV3' test.out

#- 209 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'yYPv3yyU' \
    > test.out 2>&1
eval_tap $? 209 'TokenIntrospectionV3' test.out

#- 210 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 210 'GetJWKSV3' test.out

#- 211 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'zjoK7w3C' \
    --mfaToken 'p7NUcCbJ' \
    > test.out 2>&1
eval_tap $? 211 'Change2faMethod' test.out

#- 212 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'vAUZygCY' \
    --factor 'sTi6NOco' \
    --mfaToken 'GO27GMgh' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 212 'Verify2faCode' test.out

#- 213 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'IG2U5xWn' \
    --userId 'sMizwZ65' \
    > test.out 2>&1
eval_tap $? 213 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 214 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'oEQIoVyA' \
    --clientId 'JcwZgO4y' \
    --redirectUri 'Gc2Tr4MR' \
    --requestId '2lryL9I0' \
    > test.out 2>&1
eval_tap $? 214 'AuthCodeRequestV3' test.out

#- 215 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId '3v06S5iR' \
    --clientId 'eN8aP4qA' \
    --createHeadless  \
    --deviceId 'ksxNQieb' \
    --macAddress '4TnUYnEs' \
    --platformToken 'ocrFribG' \
    > test.out 2>&1
eval_tap $? 215 'PlatformTokenGrantV3' test.out

#- 216 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 216 'GetRevocationListV3' test.out

#- 217 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token '7zM42nBv' \
    > test.out 2>&1
eval_tap $? 217 'TokenRevocationV3' test.out

#- 218 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'LAOJmbEl' \
    --code 'XZXjGHxp' \
    --codeVerifier 'Pi7vYSBX' \
    --extendExp  \
    --password 'P9UYwnBN' \
    --redirectUri '6XojdIVX' \
    --refreshToken '3zTnXtOa' \
    --username 'ff8RHWdB' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 218 'TokenGrantV3' test.out

#- 219 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'BgbviWdm' \
    > test.out 2>&1
eval_tap $? 219 'VerifyTokenV3' test.out

#- 220 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'RdgtxUBP' \
    --code 'yTxg1MuG' \
    --error 'pyzyKn0Q' \
    --openidAssocHandle 'mUKG9siH' \
    --openidClaimedId 'zgMJmcqR' \
    --openidIdentity 'waoqoObj' \
    --openidMode '8G3RHqcg' \
    --openidNs 'w6Ji8X5k' \
    --openidOpEndpoint 'Hfi8L2jq' \
    --openidResponseNonce 'c6X2dzIL' \
    --openidReturnTo 'UeDWQVgl' \
    --openidSig 'MnESdcTt' \
    --openidSigned 'SbGptheL' \
    --state '6L9mLG0O' \
    > test.out 2>&1
eval_tap $? 220 'PlatformAuthenticationV3' test.out

#- 221 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'zW17SEUn' \
    > test.out 2>&1
eval_tap $? 221 'PublicGetInputValidations' test.out

#- 222 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'pXFkBFyD' \
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
    --clientId '0AP0xfus' \
    > test.out 2>&1
eval_tap $? 224 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 225 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'g0DZGGvo' \
    --body '{"platformUserIds": ["KFUiknX5", "Ehi0CK2P", "pWP6Bc5p"]}' \
    > test.out 2>&1
eval_tap $? 225 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 226 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Is1j6LZn' \
    --platformUserId 'sXHK17Vo' \
    > test.out 2>&1
eval_tap $? 226 'PublicGetUserByPlatformUserIDV3' test.out

#- 227 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId '63uWhO6Q' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetAsyncStatus' test.out

#- 228 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'sDoUqVDp' \
    --limit '75' \
    --offset '45' \
    --query 'bdYavBWo' \
    > test.out 2>&1
eval_tap $? 228 'PublicSearchUserV3' test.out

#- 229 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "K3aQNqmt", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "3BuEitfG", "policyId": "tZh5uvLr", "policyVersionId": "c5c9NoGS"}, {"isAccepted": true, "localizedPolicyVersionId": "VCxkfiCv", "policyId": "6Pu2nR1H", "policyVersionId": "Y9g2lnhA"}, {"isAccepted": true, "localizedPolicyVersionId": "EIWoB93H", "policyId": "fumJoUih", "policyVersionId": "0NJBHMYh"}], "authType": "H68Om0uA", "code": "gMkmqPoX", "country": "YQjHj9x4", "dateOfBirth": "vRRqaSwh", "displayName": "FWR2qRsV", "emailAddress": "86kHYO4W", "password": "4OW97lSI", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 229 'PublicCreateUserV3' test.out

#- 230 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field '5mSa69EI' \
    --query 'MFACdHW9' \
    > test.out 2>&1
eval_tap $? 230 'CheckUserAvailability' test.out

#- 231 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["LOJeaqWd", "uXMdCf54", "BvUhHojm"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicBulkGetUsers' test.out

#- 232 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "Duyqt11z", "languageTag": "zR2u65ug"}' \
    > test.out 2>&1
eval_tap $? 232 'PublicSendRegistrationCode' test.out

#- 233 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "p3f5yDcg", "emailAddress": "4hxEGlc5"}' \
    > test.out 2>&1
eval_tap $? 233 'PublicVerifyRegistrationCode' test.out

#- 234 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "NIfn0ffX", "languageTag": "PVlQDgau"}' \
    > test.out 2>&1
eval_tap $? 234 'PublicForgotPasswordV3' test.out

#- 235 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'i3AwuFQP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 235 'GetAdminInvitationV3' test.out

#- 236 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'ZOUH0wUg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "02hCip8l", "policyId": "W8T8fx2J", "policyVersionId": "CtB6ejY7"}, {"isAccepted": true, "localizedPolicyVersionId": "Jy8KVlyq", "policyId": "kCJnKEPS", "policyVersionId": "mncuWikB"}, {"isAccepted": false, "localizedPolicyVersionId": "iqBBaP7t", "policyId": "akbHaPba", "policyVersionId": "DdO1bkQy"}], "authType": "EMAILPASSWD", "country": "YxlOhpvu", "dateOfBirth": "RLOMZoh7", "displayName": "qfYFdATo", "password": "ltAkbey7", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 236 'CreateUserFromInvitationV3' test.out

#- 237 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "hs8wMKW4", "country": "N34zR8DC", "dateOfBirth": "NtH2RZj5", "displayName": "9b3CPF1F", "languageTag": "YRPgzaw7", "userName": "HhdQtUNF"}' \
    > test.out 2>&1
eval_tap $? 237 'UpdateUserV3' test.out

#- 238 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "7grYPOAS", "country": "2ckeDhpu", "dateOfBirth": "Fs8Nf4Np", "displayName": "8i5hTkoA", "languageTag": "6PGEshHC", "userName": "6HURwl1b"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicPartialUpdateUserV3' test.out

#- 239 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "EQFw1dhV", "emailAddress": "tvK5HVtb", "languageTag": "GGUFd6ti"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicSendVerificationCodeV3' test.out

#- 240 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ZcI0cxIo", "contactType": "xb1XBBP6", "languageTag": "XwKEklfx", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 240 'PublicUserVerificationV3' test.out

#- 241 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "r5ZpF5ei", "country": "oghjD8AG", "dateOfBirth": "GVcqoZ7V", "displayName": "Pwsc747U", "emailAddress": "RUKz7ACc", "password": "mj8XaEra", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 241 'PublicUpgradeHeadlessAccountV3' test.out

#- 242 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "a9k0evB8", "password": "acbBo9pq"}' \
    > test.out 2>&1
eval_tap $? 242 'PublicVerifyHeadlessAccountV3' test.out

#- 243 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "We93awoc", "newPassword": "EPtmLq8i", "oldPassword": "OF7xxaZl"}' \
    > test.out 2>&1
eval_tap $? 243 'PublicUpdatePasswordV3' test.out

#- 244 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'xhn6SC2R' \
    > test.out 2>&1
eval_tap $? 244 'PublicCreateJusticeUser' test.out

#- 245 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xLs7mDAo' \
    --redirectUri 'u4QQb7Ix' \
    --ticket 'CbcKqLvm' \
    > test.out 2>&1
eval_tap $? 245 'PublicPlatformLinkV3' test.out

#- 246 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kr6dgdVQ' \
    --body '{"platformNamespace": "qSPB64hq"}' \
    > test.out 2>&1
eval_tap $? 246 'PublicPlatformUnlinkV3' test.out

#- 247 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'NG89NCSs' \
    > test.out 2>&1
eval_tap $? 247 'PublicPlatformUnlinkAllV3' test.out

#- 248 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4wLG2246' \
    --ticket 'PP0n0Kb1' \
    > test.out 2>&1
eval_tap $? 248 'PublicForcePlatformLinkV3' test.out

#- 249 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Y1OnI5B9' \
    --clientId 'TVjpxBjn' \
    --redirectUri 'i97y4zNZ' \
    > test.out 2>&1
eval_tap $? 249 'PublicWebLinkPlatform' test.out

#- 250 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uIAIgYV9' \
    --state 'qKVr97zO' \
    > test.out 2>&1
eval_tap $? 250 'PublicWebLinkPlatformEstablish' test.out

#- 251 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "npwA7YcK", "emailAddress": "dc50KRPV", "newPassword": "u01wNeMJ"}' \
    > test.out 2>&1
eval_tap $? 251 'ResetPasswordV3' test.out

#- 252 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1iBaaOsX' \
    > test.out 2>&1
eval_tap $? 252 'PublicGetUserByUserIdV3' test.out

#- 253 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XN6HI2u5' \
    --activeOnly  \
    --after 'VwGeB3ua' \
    --before '41ZLiE6o' \
    --limit '4' \
    > test.out 2>&1
eval_tap $? 253 'PublicGetUserBanHistoryV3' test.out

#- 254 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FdH3tXTe' \
    > test.out 2>&1
eval_tap $? 254 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 255 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TQZBCygH' \
    > test.out 2>&1
eval_tap $? 255 'PublicGetUserInformationV3' test.out

#- 256 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DUKsoomZ' \
    --after '0.545281373457501' \
    --before '0.18413078358259727' \
    --limit '80' \
    > test.out 2>&1
eval_tap $? 256 'PublicGetUserLoginHistoriesV3' test.out

#- 257 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QSHLseh7' \
    --after 'Oz1iyOoK' \
    --before 'ewFUmJdo' \
    --limit '36' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetUserPlatformAccountsV3' test.out

#- 258 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qbtoRspG' \
    > test.out 2>&1
eval_tap $? 258 'PublicListJusticePlatformAccountsV3' test.out

#- 259 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'DRzfWwiu' \
    --body '{"platformId": "oSRwRshQ", "platformUserId": "bD6N2AVc"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicLinkPlatformAccount' test.out

#- 260 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '6bCILnRG' \
    --body '{"chosenNamespaces": ["DtKThzTW", "Viy4CjoM", "xgMoMYhN"], "requestId": "nXJAYcU6"}' \
    > test.out 2>&1
eval_tap $? 260 'PublicForceLinkPlatformWithProgression' test.out

#- 261 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'm4yi3vvB' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetPublisherUserV3' test.out

#- 262 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YDhzWL5d' \
    --password 'pmfJHtRw' \
    > test.out 2>&1
eval_tap $? 262 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 263 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'TD8frHxH' \
    --before 'uDhfkXq2' \
    --isWildcard  \
    --limit '51' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetRolesV3' test.out

#- 264 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'wFNHxfhP' \
    > test.out 2>&1
eval_tap $? 264 'PublicGetRoleV3' test.out

#- 265 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 265 'PublicGetMyUserV3' test.out

#- 266 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "1W3gWlFV"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicSendVerificationLinkV3' test.out

#- 267 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'SxlwRYDZ' \
    > test.out 2>&1
eval_tap $? 267 'PublicVerifyUserByLinkV3' test.out

#- 268 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'sJKTP0Oa' \
    --code '0OnPVErw' \
    --error 't0p0zKV0' \
    --state '5HRiJd13' \
    > test.out 2>&1
eval_tap $? 268 'PlatformAuthenticateSAMLV3Handler' test.out

#- 269 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'iJlTpPLI' \
    --payload 'Vsk942r0' \
    > test.out 2>&1
eval_tap $? 269 'LoginSSOClient' test.out

#- 270 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'JnvdTa2Y' \
    > test.out 2>&1
eval_tap $? 270 'LogoutSSOClient' test.out

#- 271 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'BjB5oCz0' \
    > test.out 2>&1
eval_tap $? 271 'RequestGameTokenResponseV3' test.out

#- 272 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'U25Rb8KF' \
    > test.out 2>&1
eval_tap $? 272 'AdminGetDevicesByUserV4' test.out

#- 273 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'NXNONgWy' \
    --endDate 'NiNIzqxq' \
    --limit '42' \
    --offset '89' \
    --startDate 'p6rsKmMd' \
    > test.out 2>&1
eval_tap $? 273 'AdminGetBannedDevicesV4' test.out

#- 274 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xVz3Oy7S' \
    > test.out 2>&1
eval_tap $? 274 'AdminGetUserDeviceBansV4' test.out

#- 275 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "FC2ceVn0", "deviceId": "fqTNBS6u", "deviceType": "9UGf0hE7", "enabled": true, "endDate": "9YpNLJzl", "ext": {"3n2TSBWK": {}, "Lu2QQA4C": {}, "onZiEMwC": {}}, "reason": "pB9lroxz"}' \
    > test.out 2>&1
eval_tap $? 275 'AdminBanDeviceV4' test.out

#- 276 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'lz58GoR1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 276 'AdminGetDeviceBanV4' test.out

#- 277 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'nSMIQR8J' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 277 'AdminUpdateDeviceBanV4' test.out

#- 278 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'FyPUFjw9' \
    --startDate 'g6JciiI2' \
    --deviceType 'hMYr8KOm' \
    > test.out 2>&1
eval_tap $? 278 'AdminGenerateReportV4' test.out

#- 279 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 279 'AdminGetDeviceTypesV4' test.out

#- 280 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'ZjATEt7O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDeviceBansV4' test.out

#- 281 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'OwlaUqM9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 281 'AdminDecryptDeviceV4' test.out

#- 282 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'eFaOBB2e' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 282 'AdminUnbanDeviceV4' test.out

#- 283 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'WJsEAc8H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 283 'AdminGetUsersByDeviceV4' test.out

#- 284 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 87}' \
    > test.out 2>&1
eval_tap $? 284 'AdminCreateTestUsersV4' test.out

#- 285 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["1CfBLVMC", "RHqIMY4f", "LlPl33Xh"]}' \
    > test.out 2>&1
eval_tap $? 285 'AdminBulkCheckValidUserIDV4' test.out

#- 286 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZZNFNVx9' \
    --body '{"avatarUrl": "9gCBM5tW", "country": "ccV1I0xJ", "dateOfBirth": "niBDmgde", "displayName": "6t1W7ITN", "languageTag": "WwRlm10t", "userName": "bEuMglOu"}' \
    > test.out 2>&1
eval_tap $? 286 'AdminUpdateUserV4' test.out

#- 287 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LHMEuK9C' \
    --body '{"code": "TxNR93Hh", "emailAddress": "BEoF9R30"}' \
    > test.out 2>&1
eval_tap $? 287 'AdminUpdateUserEmailAddressV4' test.out

#- 288 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VPjyviAA' \
    > test.out 2>&1
eval_tap $? 288 'AdminDisableUserMFAV4' test.out

#- 289 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pZEZc7JE' \
    > test.out 2>&1
eval_tap $? 289 'AdminListUserRolesV4' test.out

#- 290 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'clyQv0Qs' \
    --body '{"assignedNamespaces": ["ruFQTSqe", "SkuF8aFo", "Qm06Ik5G"], "roleId": "WnKhhFpz"}' \
    > test.out 2>&1
eval_tap $? 290 'AdminUpdateUserRoleV4' test.out

#- 291 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Khjoj5YA' \
    --body '{"assignedNamespaces": ["FuYJbTtf", "GEfKv0UV", "rseIQcjS"], "roleId": "f90rZOnu"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminAddUserRoleV4' test.out

#- 292 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '50WEll5U' \
    --body '{"assignedNamespaces": ["BnnDC0Xk", "wSeJzqV0", "f38DFrFP"], "roleId": "QOfi3FrX"}' \
    > test.out 2>&1
eval_tap $? 292 'AdminRemoveUserRoleV4' test.out

#- 293 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '63' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 293 'AdminGetRolesV4' test.out

#- 294 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "sBZzd5fB"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminCreateRoleV4' test.out

#- 295 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'KTHt6X5e' \
    > test.out 2>&1
eval_tap $? 295 'AdminGetRoleV4' test.out

#- 296 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'X0X9ntha' \
    > test.out 2>&1
eval_tap $? 296 'AdminDeleteRoleV4' test.out

#- 297 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'HWdPTA3Q' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "IqmTzEjH"}' \
    > test.out 2>&1
eval_tap $? 297 'AdminUpdateRoleV4' test.out

#- 298 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'cI2xyKrS' \
    --body '{"permissions": [{"action": 14, "resource": "sTsi4fV8", "schedAction": 18, "schedCron": "7of1Lbhh", "schedRange": ["RrhXy7gv", "pXtceBtK", "u4OWDnNZ"]}, {"action": 78, "resource": "8Xsz0cFI", "schedAction": 49, "schedCron": "8nhh58AJ", "schedRange": ["m2nSHsfh", "XjIOu2kP", "bgLx7nqD"]}, {"action": 79, "resource": "GeMgj1RI", "schedAction": 34, "schedCron": "KmYADF5A", "schedRange": ["FpqHGd7z", "FECotIae", "zwVDou9v"]}]}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateRolePermissionsV4' test.out

#- 299 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'RDNknCU8' \
    --body '{"permissions": [{"action": 11, "resource": "kAUkig4U", "schedAction": 20, "schedCron": "WpRbuefu", "schedRange": ["g9bvL8dC", "3bV5eUc9", "UdKDdesx"]}, {"action": 15, "resource": "A1XbU665", "schedAction": 95, "schedCron": "MdfaDjMB", "schedRange": ["hX3Zz2vt", "RTYsMXj2", "3Tmeowmt"]}, {"action": 25, "resource": "awU6WsgY", "schedAction": 77, "schedCron": "aeczP3oX", "schedRange": ["YZFiMpSf", "qb9sPjrV", "QZYJXZU0"]}]}' \
    > test.out 2>&1
eval_tap $? 299 'AdminAddRolePermissionsV4' test.out

#- 300 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'vd9hgRl4' \
    --body '["GrUAuI19", "rnqD8ICA", "Fv7b9Kr0"]' \
    > test.out 2>&1
eval_tap $? 300 'AdminDeleteRolePermissionsV4' test.out

#- 301 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'DqqJSqEs' \
    --after 'lX1LHR2C' \
    --before 'xFNHI8sh' \
    --limit '73' \
    > test.out 2>&1
eval_tap $? 301 'AdminListAssignedUsersV4' test.out

#- 302 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'O3OOXChY' \
    --body '{"assignedNamespaces": ["Ur656L4d", "SX5AeYue", "4JBKWA1N"], "namespace": "De0EnBVo", "userId": "DAKqar5Y"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminAssignUserToRoleV4' test.out

#- 303 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'HvRf8smH' \
    --body '{"namespace": "C1vTIGBn", "userId": "MXxwlObj"}' \
    > test.out 2>&1
eval_tap $? 303 'AdminRevokeUserFromRoleV4' test.out

#- 304 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "2DxKQzBi", "country": "6owdP1ye", "dateOfBirth": "gjo1wyBp", "displayName": "oi6jRdTq", "languageTag": "2CCzNHHP", "userName": "TDUWbJy6"}' \
    > test.out 2>&1
eval_tap $? 304 'AdminUpdateMyUserV4' test.out

#- 305 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 305 'AdminDisableMyAuthenticatorV4' test.out

#- 306 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'GqGI5Eh5' \
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
    --factor 'rVhUXUi1' \
    > test.out 2>&1
eval_tap $? 314 'AdminMakeFactorMyDefaultV4' test.out

#- 315 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["bI6b6L7n", "YoMy5UM3", "pAKZEQMr"], "emailAddresses": ["3L2OP1Vy", "bXXCU4f5", "wPKXSQDd"], "isAdmin": false, "roleId": "tdogoaYl"}' \
    > test.out 2>&1
eval_tap $? 315 'AdminInviteUserV4' test.out

#- 316 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "Og3nDEQq", "policyId": "pKlQUwdb", "policyVersionId": "RGJJvoyR"}, {"isAccepted": false, "localizedPolicyVersionId": "C7SK1K3X", "policyId": "DkuVA9qC", "policyVersionId": "obTixJZV"}, {"isAccepted": false, "localizedPolicyVersionId": "63h3Bed2", "policyId": "oYqdcgux", "policyVersionId": "2KOiPM9T"}], "authType": "EMAILPASSWD", "country": "rBK3OGOr", "dateOfBirth": "uuyfZ9PS", "displayName": "nR8GH40r", "emailAddress": "W6JGG3cT", "password": "lj1MyXQz", "passwordMD5Sum": "tsTOPXQk", "username": "wcWCSPNa", "verified": false}' \
    > test.out 2>&1
eval_tap $? 316 'PublicCreateTestUserV4' test.out

#- 317 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "cc2W2Mws", "policyId": "bcdK9nV4", "policyVersionId": "esewJ7kt"}, {"isAccepted": true, "localizedPolicyVersionId": "i2nWkHV2", "policyId": "I6EoMReP", "policyVersionId": "5mqDzR6v"}, {"isAccepted": true, "localizedPolicyVersionId": "J8NnQ2rU", "policyId": "BZVWGELE", "policyVersionId": "dUqg4Fqt"}], "authType": "EMAILPASSWD", "code": "Upr5y69g", "country": "NqmVEmIA", "dateOfBirth": "HJXPD4Im", "displayName": "ocz2r8a3", "emailAddress": "84yKSAXW", "password": "AaVeZtd0", "passwordMD5Sum": "Wcf23W2D", "reachMinimumAge": true, "username": "dg2smrYB"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicCreateUserV4' test.out

#- 318 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'mA8ADJlR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "KZbCMA2b", "policyId": "P5SG9mum", "policyVersionId": "k0ZeUMyZ"}, {"isAccepted": true, "localizedPolicyVersionId": "KdmCwm14", "policyId": "bVt56LWq", "policyVersionId": "FWqgi0Ul"}, {"isAccepted": false, "localizedPolicyVersionId": "HVnFjnOm", "policyId": "QZySMmlO", "policyVersionId": "aewFH6T5"}], "authType": "EMAILPASSWD", "country": "pcdw0Lxn", "dateOfBirth": "Q4jsNlw7", "displayName": "EAorJ81L", "password": "gf3S2k8u", "reachMinimumAge": false, "username": "CrzRkw0M"}' \
    > test.out 2>&1
eval_tap $? 318 'CreateUserFromInvitationV4' test.out

#- 319 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "nmWaUnPC", "country": "XOgJzwkK", "dateOfBirth": "fQlnic1L", "displayName": "j6AXkGKf", "languageTag": "igxIo7Xu", "userName": "BtoQe1eI"}' \
    > test.out 2>&1
eval_tap $? 319 'PublicUpdateUserV4' test.out

#- 320 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "DspZtE68", "emailAddress": "M9OrJG9Q"}' \
    > test.out 2>&1
eval_tap $? 320 'PublicUpdateUserEmailAddressV4' test.out

#- 321 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "QqimXDTR", "country": "TnJ1jP7B", "dateOfBirth": "iOXEplDX", "displayName": "6t4Leq6E", "emailAddress": "dzIVDQWI", "password": "XkyUZgBI", "reachMinimumAge": true, "username": "Bq0I4Hha", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 321 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 322 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "gyIqpNwI", "password": "A2lmlA4N", "username": "p0v3Rrgq"}' \
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
    --code 'vhEtXyYV' \
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
    --deviceToken '7ZTHVvnN' \
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
    --factor 'mFAdMm5D' \
    > test.out 2>&1
eval_tap $? 333 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE