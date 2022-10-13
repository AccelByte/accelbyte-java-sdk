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
    --body '[{"field": "EbJuk9ir", "validation": {"allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "blockedWord": ["Z4SnaSpv", "bpIl4b4Q", "R8HDZhI3"], "description": [{"language": "Jej2jmBS", "message": ["dQoIC44L", "JkWw1qQu", "unSxTd0T"]}, {"language": "RFtoMCGT", "message": ["q73BWK1F", "Rj7LHTQs", "ESc2RzVu"]}, {"language": "rI1o2Sgv", "message": ["RMXY3CHR", "FqP65hEC", "pKEGdPQd"]}], "isCustomRegex": true, "letterCase": "EdS4eDbe", "maxLength": 45, "maxRepeatingAlphaNum": 19, "maxRepeatingSpecialCharacter": 7, "minCharType": 97, "minLength": 19, "regex": "iXRQqywa", "specialCharacterLocation": "sm6sbZcQ", "specialCharacters": ["URDHOwOn", "WMAjbQDr", "fCmQmRc7"]}}, {"field": "b5glfkbT", "validation": {"allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "blockedWord": ["1kXHdvc1", "C90HjqZ8", "EEZ8ICnW"], "description": [{"language": "3HcQDij7", "message": ["CbrTiAkW", "SzgPi4kk", "e4RD5IHH"]}, {"language": "GnkEfpyf", "message": ["K0wEabgY", "XrElGaco", "idTsPbbv"]}, {"language": "xP8rUvPu", "message": ["OZil0GM5", "rpzVpcRI", "NHKmiETG"]}], "isCustomRegex": false, "letterCase": "FpCEPYsj", "maxLength": 32, "maxRepeatingAlphaNum": 30, "maxRepeatingSpecialCharacter": 45, "minCharType": 67, "minLength": 77, "regex": "dO7kJeRu", "specialCharacterLocation": "O2WPPvOf", "specialCharacters": ["6yTefhSj", "dwcMmQOh", "9lDXeiHx"]}}, {"field": "WCHXUrYh", "validation": {"allowDigit": false, "allowLetter": false, "allowSpace": false, "allowUnicode": true, "blockedWord": ["g19O3WRJ", "p3TI8Yq9", "HsP2Ahai"], "description": [{"language": "eHnO3cNY", "message": ["JoxycETf", "rhg2OUc2", "aFF5CeTp"]}, {"language": "qE49IpJA", "message": ["vv07ldqv", "aTnadx6l", "XN8LJonL"]}, {"language": "CsubYflU", "message": ["MRjxwRYJ", "dnf4cq6A", "z9J0k5GO"]}], "isCustomRegex": true, "letterCase": "odclIkfh", "maxLength": 4, "maxRepeatingAlphaNum": 64, "maxRepeatingSpecialCharacter": 26, "minCharType": 2, "minLength": 49, "regex": "lDEgzgWj", "specialCharacterLocation": "CzDRer2G", "specialCharacters": ["pUqjwl3H", "3kRbkGhG", "dVHkxM6u"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'S3s3zmVI' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'wWw7a1XI' \
    --before 'Lsw0Waap' \
    --limit '84' \
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
    --body '{"ageRestriction": 1, "enable": true}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode '3k9dewSQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 39}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'EOR6UnYP' \
    --limit '77' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "LczN4pnX", "comment": "eMd7L5dG", "endDate": "v48vlH1q", "reason": "pph0xm47", "skipNotif": true, "userIds": ["VslHQ5DM", "ZmPazAcc", "iAeOAsJ0"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "4Qdq3a95", "userId": "0ahUUIbI"}, {"banId": "MxH9v5c6", "userId": "5t3XXfF4"}, {"banId": "6PbjJbR7", "userId": "KwPZFhLK"}]}' \
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
    --limit '14' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["eLTo98xb", "wabyEAio", "c7s3Dufo"], "baseUri": "FF03BSoJ", "clientId": "ndKxFmzM", "clientName": "0lvSUftx", "clientPermissions": [{"action": 54, "resource": "7ACLNNez", "schedAction": 29, "schedCron": "dWZf0elQ", "schedRange": ["1Ls9vGYD", "vB6tmUJ1", "aNFPxdZR"]}, {"action": 78, "resource": "mUTU2ndG", "schedAction": 16, "schedCron": "LWb2b8PF", "schedRange": ["sl1jv5mD", "i5UZCiFJ", "iEOAuM3m"]}, {"action": 88, "resource": "Xq9J3uM3", "schedAction": 17, "schedCron": "otD5AhcC", "schedRange": ["80AZbaLS", "wRPXVBuX", "XDRhA2gU"]}], "clientPlatform": "KCEehpky", "deletable": false, "namespace": "79E4nkKo", "oauthClientType": "L6e983uG", "redirectUri": "Q5sgg0YW", "secret": "YCsGdGNl", "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'Du7EDhFp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'HpEvtQqY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'RWR2i9Kz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["ofBcUOOv", "ohbyXVYj", "BsbrYUqk"], "baseUri": "yYNjWUlI", "clientName": "U3GB95SJ", "clientPermissions": [{"action": 9, "resource": "gTwGNEol", "schedAction": 59, "schedCron": "Y5UCEQhk", "schedRange": ["05C9z38A", "hJiyoX2R", "UwhBKEq2"]}, {"action": 19, "resource": "NCb4J9SC", "schedAction": 17, "schedCron": "hNT81hva", "schedRange": ["g7WjXyd2", "JtihofoK", "zspEXxHI"]}, {"action": 34, "resource": "Jf3ooUHH", "schedAction": 25, "schedCron": "B4nRkeVv", "schedRange": ["7yb0P2jH", "T6Wx232s", "AyPVdvWy"]}], "clientPlatform": "ugmsdCQh", "deletable": true, "namespace": "CRbJ6Ubo", "redirectUri": "tfa06MPQ", "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'kMx9CkYF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 99, "resource": "CwF0Nbsl"}, {"action": 18, "resource": "aLswW7Lt"}, {"action": 46, "resource": "oPtjkA2E"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'juaVwJw4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 12, "resource": "91fhFyfJ"}, {"action": 100, "resource": "iXfYGkic"}, {"action": 54, "resource": "4H8uP7Sv"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '54' \
    --clientId 'GqSVVBsv' \
    --namespace "$AB_NAMESPACE" \
    --resource 'kMrJ7qAy' \
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
    --limit '36' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'r9TCiUEL' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vPjiFcN3' \
    --body '{"ACSURL": "wFmLO4Wc", "AWSCognitoRegion": "0ESJDhnj", "AWSCognitoUserPool": "OW6i7vaY", "AllowedClients": ["zBHe7D4w", "BrSLYAAK", "UPtNDYM2"], "AppId": "XNBAL9tp", "AuthorizationEndpoint": "8hN6VFxQ", "ClientId": "T34khsik", "Environment": "JIeTImGp", "FederationMetadataURL": "GVgwfGEe", "GenericOauthFlow": true, "IsActive": false, "Issuer": "0rlqQAUO", "JWKSEndpoint": "i0wk18Ze", "KeyID": "bW3wUCoG", "NetflixCertificates": {"encryptedPrivateKey": "sgbe6hYf", "encryptedPrivateKeyName": "z1iasusy", "publicCertificate": "QsalXJVc", "publicCertificateName": "m0eATRxD", "rootCertificate": "rraXDbiN", "rootCertificateName": "NH8ecaAY"}, "OrganizationId": "zQlESNph", "PlatformName": "esDhsw6r", "RedirectUri": "4ZioYVXU", "RegisteredDomains": [{"affectedClientIDs": ["IvUK9CgB", "L1MGNXGH", "nwd1Kour"], "domain": "WCL3CNxi", "namespaces": ["gm9NB86h", "t3xLjXIb", "Nfphnn5w"], "roleId": "jJlPeboe"}, {"affectedClientIDs": ["ogH49d0j", "fYLy8taJ", "0XeIKMbi"], "domain": "NzdxZB3e", "namespaces": ["gEsERMuU", "f67UsFs8", "DYfRjvJs"], "roleId": "mxWQKyVp"}, {"affectedClientIDs": ["3FSSEQd1", "HK5CSkn9", "K9sNJIFJ"], "domain": "BCIFPYD7", "namespaces": ["e6dSARcT", "KFiSb6Kp", "iMRI4Amh"], "roleId": "ic06PhH8"}], "Secret": "scrLyeWT", "TeamID": "Ztp4PMSO", "TokenAuthenticationType": "t43Aqb3f", "TokenClaimsMapping": {"gtRTTqzK": "WSt3DIbQ", "YByeW1AW": "yziYvLPZ", "89p9pcj4": "JDw17Mej"}, "TokenEndpoint": "P6oLWoq7"}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'i5KNi15w' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tKvAQGPd' \
    --body '{"ACSURL": "1OMcpFHe", "AWSCognitoRegion": "Yw8izNa6", "AWSCognitoUserPool": "YITQut6s", "AllowedClients": ["moagPMLI", "uGLALjTC", "bPiUfEYi"], "AppId": "1yeCvDkv", "AuthorizationEndpoint": "YHCCurAp", "ClientId": "Q4c6goJi", "Environment": "EHWF24Lo", "FederationMetadataURL": "oVj1Lf1A", "GenericOauthFlow": true, "IsActive": true, "Issuer": "ScZmcU0D", "JWKSEndpoint": "I54FUFLF", "KeyID": "RreagJW4", "NetflixCertificates": {"encryptedPrivateKey": "39d4vqpJ", "encryptedPrivateKeyName": "6ds29dwX", "publicCertificate": "ofcrbBQD", "publicCertificateName": "WQviMIfw", "rootCertificate": "s21Ar7Ow", "rootCertificateName": "cBqFdyw2"}, "OrganizationId": "Yc0ZMHLa", "PlatformName": "aKIeTD1U", "RedirectUri": "jbjJcWoW", "RegisteredDomains": [{"affectedClientIDs": ["qwAfwWoV", "r3Yfo6so", "7JPlS0yk"], "domain": "go9Ry714", "namespaces": ["WowlW4kp", "kfI2rBYU", "xJNGVOXW"], "roleId": "iJVvAXdZ"}, {"affectedClientIDs": ["Xyh7yF7F", "i768yKUO", "XsBrdNyZ"], "domain": "q1YOSPWi", "namespaces": ["ZjTNwOvz", "fOtT8ST2", "5Avtqwcd"], "roleId": "eEQchyzq"}, {"affectedClientIDs": ["iQ8cZSze", "vXUTQ7cS", "dxhiQCKL"], "domain": "ctpJS9fs", "namespaces": ["EOWMAQ60", "9kcgl05i", "3zDJTGt9"], "roleId": "TuV1VTPa"}], "Secret": "0AX7tMVX", "TeamID": "E4ERl7kR", "TokenAuthenticationType": "BEkXDMn1", "TokenClaimsMapping": {"GzqhyS2a": "eAPubR72", "W5VMOkIB": "2EzaPyLr", "tkb3K4P4": "56d7JFHk"}, "TokenEndpoint": "9vPOkpoK"}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6NSbOUfG' \
    --body '{"affectedClientIDs": ["qn3wSVvY", "AaWZmlKE", "6LcR6MpS"], "assignedNamespaces": ["PYGmfJve", "SHigFuZj", "jg8LAhKn"], "domain": "dtIgmY53", "roleId": "HysGXqam"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6rFyWyJM' \
    --body '{"domain": "e9zAT90Z"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'R61BtrHG' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'y7z2fjQ3' \
    --body '{"acsUrl": "AVvzEeDe", "apiKey": "rgL1WfLH", "appId": "d1LazloC", "federationMetadataUrl": "X6OMd0Iw", "isActive": true, "redirectUri": "xVqwafeU", "secret": "Q0RT9fvS", "ssoUrl": "UNLVSEPC"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5LErPEGN' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ExNYNlhS' \
    --body '{"acsUrl": "HYLyWqOQ", "apiKey": "30yUAzCR", "appId": "0w87qnZg", "federationMetadataUrl": "mfB93Szg", "isActive": false, "redirectUri": "q6eS1aaB", "secret": "ExnTvphj", "ssoUrl": "LJSzXl3j"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3mL1Uroc' \
    --platformUserId 'FNZ2Yy6R' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 're0fYpHv' \
    --after '32' \
    --before '51' \
    --limit '46' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'hqWlGtGz' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["lDCc3Ius", "p50QottY", "jsrM2SZJ"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["uD5dTOq7", "26Q0gEAx", "FMjmE6O9"], "isAdmin": true, "roles": ["Dfvh6rVc", "OCOxHsjt", "FnmOKSCq"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 146 'AdminListUsersV3' test.out

#- 147 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'uJx2tBl5' \
    --endDate 'IN7tm4hs' \
    --limit '10' \
    --offset '21' \
    --platformBy 'NtZ2Focj' \
    --platformId 'QfwlgkyH' \
    --query 'DyqvXvp1' \
    --startDate 'Dva3CHg3' \
    > test.out 2>&1
eval_tap $? 147 'AdminSearchUserV3' test.out

#- 148 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["d6Kyr0ua", "bBMIJbDv", "K98ktg9c"]}' \
    > test.out 2>&1
eval_tap $? 148 'AdminGetBulkUserByEmailAddressV3' test.out

#- 149 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HUVebBpl' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserByUserIdV3' test.out

#- 150 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZIkycyoZ' \
    --body '{"avatarUrl": "8LhVyB9b", "country": "58G5Omlw", "dateOfBirth": "dyGvId4C", "displayName": "t6S3EzDA", "languageTag": "WtRKqMNi", "userName": "GnapWtbQ"}' \
    > test.out 2>&1
eval_tap $? 150 'AdminUpdateUserV3' test.out

#- 151 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CdgD11Gt' \
    --activeOnly  \
    --after 'wD1iXzQJ' \
    --before 'BY1LWQxP' \
    --limit '29' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserBanV3' test.out

#- 152 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eec5Fo14' \
    --body '{"ban": "xUDUOxGM", "comment": "3rwGGaE5", "endDate": "jaOc0us9", "reason": "2qWOWsMk", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 152 'AdminBanUserV3' test.out

#- 153 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId '2h2uwtbO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fcuq0IGz' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 153 'AdminUpdateUserBanV3' test.out

#- 154 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cktiU4mV' \
    --body '{"context": "pTopVaEE", "emailAddress": "SeU7hH47", "languageTag": "RwPOKbLO"}' \
    > test.out 2>&1
eval_tap $? 154 'AdminSendVerificationCodeV3' test.out

#- 155 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wKuEGyh2' \
    --body '{"Code": "rhy6jiLj", "ContactType": "61Bpp0q3", "LanguageTag": "ZnIYeNdY", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 155 'AdminVerifyAccountV3' test.out

#- 156 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'fg1QfSiM' \
    > test.out 2>&1
eval_tap $? 156 'GetUserVerificationCode' test.out

#- 157 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KSeT1cK1' \
    > test.out 2>&1
eval_tap $? 157 'AdminGetUserDeletionStatusV3' test.out

#- 158 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'imMAiLxu' \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 158 'AdminUpdateUserDeletionStatusV3' test.out

#- 159 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xR7GgE6U' \
    --body '{"code": "Jhma57iC", "country": "WBa1rQx6", "dateOfBirth": "225urytb", "displayName": "LzhayfM4", "emailAddress": "KsYALEtb", "password": "2Jqi8wjU", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpgradeHeadlessAccountV3' test.out

#- 160 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YUVYUoGn' \
    > test.out 2>&1
eval_tap $? 160 'AdminDeleteUserInformationV3' test.out

#- 161 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'o7L2BGsT' \
    --after '0.8064552235664115' \
    --before '0.028539096118960883' \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetUserLoginHistoriesV3' test.out

#- 162 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'untoa9On' \
    --body '{"languageTag": "zd0jzJpE", "newPassword": "V1NqCAfl", "oldPassword": "GIz7Vgdx"}' \
    > test.out 2>&1
eval_tap $? 162 'AdminResetPasswordV3' test.out

#- 163 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4zomZHLg' \
    --body '{"Permissions": [{"Action": 2, "Resource": "DtUeWzeu", "SchedAction": 5, "SchedCron": "62caXPMF", "SchedRange": ["Kj8MUBqC", "aSGTPTri", "5pr0Wq0I"]}, {"Action": 44, "Resource": "loT6cpDx", "SchedAction": 74, "SchedCron": "owk1zrrs", "SchedRange": ["WSKDw9z4", "NGSXutIW", "6I2EKZ12"]}, {"Action": 85, "Resource": "OIvlGkuc", "SchedAction": 61, "SchedCron": "QdqVKKst", "SchedRange": ["SbwlcTU7", "VVgr9ODV", "r1Bpp31N"]}]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminUpdateUserPermissionV3' test.out

#- 164 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SZtSkAKF' \
    --body '{"Permissions": [{"Action": 66, "Resource": "54o0X4Yv", "SchedAction": 83, "SchedCron": "3EHVrmkK", "SchedRange": ["8qCKf5d1", "abKcq2Zc", "Nb2WFVof"]}, {"Action": 2, "Resource": "5CGiWvf4", "SchedAction": 52, "SchedCron": "YKnmhZnG", "SchedRange": ["gd2WSAoB", "E7xoY98d", "eSDCVtda"]}, {"Action": 35, "Resource": "Hxhzt3xq", "SchedAction": 23, "SchedCron": "k0cP13P2", "SchedRange": ["urgZHJt4", "x9kki2co", "ius6KPrK"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminAddUserPermissionsV3' test.out

#- 165 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PoVHQtNN' \
    --body '[{"Action": 51, "Resource": "pvOoanwE"}, {"Action": 78, "Resource": "zG3Fhbzg"}, {"Action": 89, "Resource": "C0GswTx2"}]' \
    > test.out 2>&1
eval_tap $? 165 'AdminDeleteUserPermissionBulkV3' test.out

#- 166 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '94' \
    --namespace "$AB_NAMESPACE" \
    --resource 'BLhpqABL' \
    --userId 'jsMMTYQk' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionV3' test.out

#- 167 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LC3ueV9n' \
    --after 'ezmv5E2J' \
    --before 'R4Gsu3Yi' \
    --limit '13' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserPlatformAccountsV3' test.out

#- 168 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'nM0YQY8h' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetListJusticePlatformAccounts' test.out

#- 169 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'rQ4zCDoM' \
    --userId 'hXXF4FxD' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetUserMapping' test.out

#- 170 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'xFSAFh74' \
    --userId 'V19ZjG6S' \
    > test.out 2>&1
eval_tap $? 170 'AdminCreateJusticeUser' test.out

#- 171 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ofoaqvy0' \
    --body '{"platformId": "dJk98lDY", "platformUserId": "Chr0AnZg"}' \
    > test.out 2>&1
eval_tap $? 171 'AdminLinkPlatformAccount' test.out

#- 172 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pSjAIbHB' \
    --userId 'mq6i95Xk' \
    --body '{"platformNamespace": "Pnjrhm95"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminPlatformUnlinkV3' test.out

#- 173 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GfjbaJfH' \
    --userId '0cEp7PCw' \
    --ticket 'lG9sKm3t' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformLinkV3' test.out

#- 174 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UTgb1lEg' \
    --body '["6O9cP3nv", "FSgdR8O3", "U9s5QDUa"]' \
    > test.out 2>&1
eval_tap $? 174 'AdminDeleteUserRolesV3' test.out

#- 175 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A04yPLXM' \
    --body '[{"namespace": "MaWGBW8Q", "roleId": "YlsM59ej"}, {"namespace": "vDDGYgrp", "roleId": "QizvXR9t"}, {"namespace": "lkjhS1sn", "roleId": "feEwEn5k"}]' \
    > test.out 2>&1
eval_tap $? 175 'AdminSaveUserRoleV3' test.out

#- 176 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'Kuku4xzi' \
    --userId 'DXhKThq4' \
    > test.out 2>&1
eval_tap $? 176 'AdminAddUserRoleV3' test.out

#- 177 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'iDhngbhH' \
    --userId 'PQ55Re30' \
    > test.out 2>&1
eval_tap $? 177 'AdminDeleteUserRoleV3' test.out

#- 178 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NeDKYbeV' \
    --body '{"enabled": false, "reason": "MXs4wdzM"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserStatusV3' test.out

#- 179 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WSTes2Wt' \
    > test.out 2>&1
eval_tap $? 179 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 180 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'bglxGsqU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "FHMgwn8I"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateClientSecretV3' test.out

#- 181 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'x40TAfAx' \
    --before 'EAv4DJVM' \
    --isWildcard  \
    --limit '17' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetRolesV3' test.out

#- 182 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "managers": [{"displayName": "abVV71og", "namespace": "Fqna958M", "userId": "3xqHwJfL"}, {"displayName": "yn04BkNt", "namespace": "sL3tlzNx", "userId": "4HN4XyZL"}, {"displayName": "5Vrllx06", "namespace": "QLoE5Ue5", "userId": "HGwBJkuN"}], "members": [{"displayName": "QD9A5BSd", "namespace": "T2AeQ3jW", "userId": "1O1rRft8"}, {"displayName": "dqM60kXt", "namespace": "IWxDzAu5", "userId": "ZX4nbTDo"}, {"displayName": "dgzP8EjH", "namespace": "LmOaZufQ", "userId": "mC53ug59"}], "permissions": [{"action": 87, "resource": "rBRxgzha", "schedAction": 5, "schedCron": "RbYKVFF1", "schedRange": ["hjTYklUJ", "j36N8dxG", "IfKu1FCk"]}, {"action": 51, "resource": "dm4fvgqJ", "schedAction": 12, "schedCron": "Sek2gugX", "schedRange": ["YMkg0yTm", "AAEnIXEC", "qKQ0fDXH"]}, {"action": 61, "resource": "twqBspOd", "schedAction": 34, "schedCron": "06lxCCpP", "schedRange": ["80sL0f7W", "5hXnIEoZ", "cDxYsf1a"]}], "roleName": "vVed53YG"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminCreateRoleV3' test.out

#- 183 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'W8NgQOb7' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRoleV3' test.out

#- 184 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'z6Q1Up3d' \
    > test.out 2>&1
eval_tap $? 184 'AdminDeleteRoleV3' test.out

#- 185 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId '3WWKTRYD' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "Tav78ApK"}' \
    > test.out 2>&1
eval_tap $? 185 'AdminUpdateRoleV3' test.out

#- 186 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'ASpct9XZ' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetRoleAdminStatusV3' test.out

#- 187 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'eXmoIS01' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateAdminRoleStatusV3' test.out

#- 188 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '8wFpfHyN' \
    > test.out 2>&1
eval_tap $? 188 'AdminRemoveRoleAdminV3' test.out

#- 189 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId '0B5tcZqK' \
    --after 'LpiaCzpP' \
    --before 'cHh8tj8W' \
    --limit '99' \
    > test.out 2>&1
eval_tap $? 189 'AdminGetRoleManagersV3' test.out

#- 190 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId '8imHHb3F' \
    --body '{"managers": [{"displayName": "GdX8QYgQ", "namespace": "oksGOXpS", "userId": "63IesjzY"}, {"displayName": "OyiiCQyg", "namespace": "rpXTI094", "userId": "lveloXzM"}, {"displayName": "ixD9Twkv", "namespace": "DZZ9MhsN", "userId": "z8SjXkZp"}]}' \
    > test.out 2>&1
eval_tap $? 190 'AdminAddRoleManagersV3' test.out

#- 191 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'KkCeA6XI' \
    --body '{"managers": [{"displayName": "TyDIsch3", "namespace": "6tfLEzro", "userId": "D13zsuRW"}, {"displayName": "ODh4lIyG", "namespace": "Dn3AZfaO", "userId": "z8bTRD4M"}, {"displayName": "CG78rtd7", "namespace": "p1aDLjt3", "userId": "3fhUOOYz"}]}' \
    > test.out 2>&1
eval_tap $? 191 'AdminRemoveRoleManagersV3' test.out

#- 192 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'NEwWE4aI' \
    --after 'sIxQQN1a' \
    --before '9nOnRKad' \
    --limit '19' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetRoleMembersV3' test.out

#- 193 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'l6M8mxJI' \
    --body '{"members": [{"displayName": "vrwyadY1", "namespace": "XDPkDYUJ", "userId": "J8QO96Fq"}, {"displayName": "mqopm5qT", "namespace": "NWFDBtiu", "userId": "akEmkLHG"}, {"displayName": "d5l9yuJX", "namespace": "D7qPnryW", "userId": "LN0gDUcc"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminAddRoleMembersV3' test.out

#- 194 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'OBvQVRpu' \
    --body '{"members": [{"displayName": "a3mOxost", "namespace": "BVLqJaR3", "userId": "B51xWZGo"}, {"displayName": "xNQJhKxw", "namespace": "OaQQjT1p", "userId": "hERf6RxW"}, {"displayName": "kLtVtAaG", "namespace": "yfBKFVjX", "userId": "iROnFzqL"}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminRemoveRoleMembersV3' test.out

#- 195 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId '0tqypyCi' \
    --body '{"permissions": [{"action": 93, "resource": "jMrscZZ7", "schedAction": 80, "schedCron": "65n1j3yJ", "schedRange": ["uApS4mT8", "pT2OCosS", "wHl4ely2"]}, {"action": 37, "resource": "dKxIFVe5", "schedAction": 46, "schedCron": "Eo9AkdEN", "schedRange": ["t6Lchs2e", "r9fKwiJM", "hysVnsiX"]}, {"action": 37, "resource": "6trxxFjO", "schedAction": 11, "schedCron": "iJdbAtcq", "schedRange": ["2utZ0KQp", "3bprBwvY", "9GfGXQ8a"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminUpdateRolePermissionsV3' test.out

#- 196 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'WkmwV6MO' \
    --body '{"permissions": [{"action": 43, "resource": "GW9gBNCs", "schedAction": 2, "schedCron": "SI2Om3Dv", "schedRange": ["3OQQCXkF", "wQ3FEp7A", "hh7buVhM"]}, {"action": 29, "resource": "PKqaOJJZ", "schedAction": 35, "schedCron": "djRKNWcR", "schedRange": ["twKlnajo", "DUCFJHBV", "ZlnU9PHw"]}, {"action": 55, "resource": "0e27Kh1z", "schedAction": 43, "schedCron": "HQscvFjw", "schedRange": ["W1zySysZ", "uDuWNQXx", "Jyno70bF"]}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminAddRolePermissionsV3' test.out

#- 197 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 's34vnWZr' \
    --body '["4n3locww", "1oGKsZQD", "WQctrNwB"]' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteRolePermissionsV3' test.out

#- 198 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '75' \
    --resource 'hwuGE47u' \
    --roleId 'BZ6vgqCN' \
    > test.out 2>&1
eval_tap $? 198 'AdminDeleteRolePermissionV3' test.out

#- 199 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 199 'AdminGetMyUserV3' test.out

#- 200 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'Q1RRbsW4' \
    --extendExp  \
    --redirectUri 'ymWbudrX' \
    --password 'XIvjVkT0' \
    --requestId 'OkGazQ24' \
    --userName 'hUmQQyHM' \
    > test.out 2>&1
eval_tap $? 200 'UserAuthenticationV3' test.out

#- 201 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'cVkHZtSy' \
    --linkingToken 'vMpTkdh9' \
    --password 'Dq5XeGe7' \
    --username 'leRG22a8' \
    > test.out 2>&1
eval_tap $? 201 'AuthenticationWithPlatformLinkV3' test.out

#- 202 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'nBLfr7LA' \
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
    --clientId 'p5UfcnYt' \
    > test.out 2>&1
eval_tap $? 205 'RequestGameTokenCodeResponseV3' test.out

#- 206 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4cSk8atB' \
    --userId 'Zpzn2V5R' \
    > test.out 2>&1
eval_tap $? 206 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 207 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JPVENqCb' \
    > test.out 2>&1
eval_tap $? 207 'RevokeUserV3' test.out

#- 208 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'pfGKa8sg' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --redirectUri 'dJNgIBV1' \
    --scope 'O4b2B0ls' \
    --state 'nW5ibr7v' \
    --targetAuthPage 'kfAj8Lg4' \
    --clientId 'cq22avHa' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 208 'AuthorizeV3' test.out

#- 209 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token '0WAuITmC' \
    > test.out 2>&1
eval_tap $? 209 'TokenIntrospectionV3' test.out

#- 210 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 210 'GetJWKSV3' test.out

#- 211 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'MJYLkGnc' \
    --mfaToken 'CUqK2ByY' \
    > test.out 2>&1
eval_tap $? 211 'Change2faMethod' test.out

#- 212 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'OzGZUXew' \
    --factor 'WENUOXhy' \
    --mfaToken 'OShE7skn' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 212 'Verify2faCode' test.out

#- 213 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mJe3EyJm' \
    --userId '8X19p0Jt' \
    > test.out 2>&1
eval_tap $? 213 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 214 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'Ui1KNwW5' \
    --clientId 'oMcrXOI7' \
    --redirectUri 'NyWLJmTD' \
    --requestId 'KwPWH3UI' \
    > test.out 2>&1
eval_tap $? 214 'AuthCodeRequestV3' test.out

#- 215 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'CWqgjG0t' \
    --clientId 'EhN9Xdso' \
    --createHeadless  \
    --deviceId 'ZXhjuJ5E' \
    --macAddress 'daGSeBke' \
    --platformToken 'w38T5rKB' \
    > test.out 2>&1
eval_tap $? 215 'PlatformTokenGrantV3' test.out

#- 216 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 216 'GetRevocationListV3' test.out

#- 217 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'c1nJYilT' \
    > test.out 2>&1
eval_tap $? 217 'TokenRevocationV3' test.out

#- 218 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'BNsCEuvM' \
    --code 'DT46bPQl' \
    --codeVerifier 'cDwR7euW' \
    --extendExp  \
    --password 'ahWSPrFv' \
    --redirectUri '1Xic9Cvm' \
    --refreshToken 'yiRCVF8w' \
    --username 'AWqwswim' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 218 'TokenGrantV3' test.out

#- 219 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'Xi5fYSQY' \
    > test.out 2>&1
eval_tap $? 219 'VerifyTokenV3' test.out

#- 220 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'AM4ri7ZB' \
    --code '3zP4pX7M' \
    --error 'cxacwlFS' \
    --openidAssocHandle 'jjS0dKlp' \
    --openidClaimedId 'WUmOu8S7' \
    --openidIdentity 'CfGr2FMd' \
    --openidMode 'zhr2KDT1' \
    --openidNs 'nFhMBfTw' \
    --openidOpEndpoint 'vpKhgVqD' \
    --openidResponseNonce 'xnDFrCpu' \
    --openidReturnTo 'MYnbx1ex' \
    --openidSig '7BWqHr2p' \
    --openidSigned 'gBYO9Pcq' \
    --state 'vUMkU673' \
    > test.out 2>&1
eval_tap $? 220 'PlatformAuthenticationV3' test.out

#- 221 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'UB8DrtLG' \
    > test.out 2>&1
eval_tap $? 221 'PublicGetInputValidations' test.out

#- 222 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'Mbwc8kqQ' \
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
    --clientId '4NaPAkfW' \
    > test.out 2>&1
eval_tap $? 224 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 225 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VewVcokn' \
    --body '{"platformUserIds": ["M0YxFnp7", "gJToIB0Y", "ntybI3QG"]}' \
    > test.out 2>&1
eval_tap $? 225 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 226 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xgHqhypJ' \
    --platformUserId 'Z8xYO3Pu' \
    > test.out 2>&1
eval_tap $? 226 'PublicGetUserByPlatformUserIDV3' test.out

#- 227 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'YznSULXn' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetAsyncStatus' test.out

#- 228 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '0ZYJAtz2' \
    --limit '51' \
    --offset '82' \
    --query 'xiG0vqhn' \
    > test.out 2>&1
eval_tap $? 228 'PublicSearchUserV3' test.out

#- 229 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "dKLVY6V1", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "VLMSjSDX", "policyId": "ZtxQfXmc", "policyVersionId": "2LfPDQI4"}, {"isAccepted": true, "localizedPolicyVersionId": "VrQGFoTn", "policyId": "U1sjPGIM", "policyVersionId": "YMny9hoJ"}, {"isAccepted": true, "localizedPolicyVersionId": "qmqjW1c5", "policyId": "QryUKuQ8", "policyVersionId": "llfqzWlg"}], "authType": "8wc5dn83", "code": "sQQ9W0Jd", "country": "kkTJHnjh", "dateOfBirth": "XB1HaLQ2", "displayName": "dLreSdcM", "emailAddress": "phykpXVJ", "password": "AyE7AOwI", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 229 'PublicCreateUserV3' test.out

#- 230 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'p0vi5BTN' \
    --query 'UcAtDJu0' \
    > test.out 2>&1
eval_tap $? 230 'CheckUserAvailability' test.out

#- 231 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["NG9OjY9g", "msBaJJwQ", "ApLX3YP7"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicBulkGetUsers' test.out

#- 232 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "GdOm74TU", "languageTag": "S14Kajmp"}' \
    > test.out 2>&1
eval_tap $? 232 'PublicSendRegistrationCode' test.out

#- 233 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "O0KTrA4q", "emailAddress": "B2sHAIRa"}' \
    > test.out 2>&1
eval_tap $? 233 'PublicVerifyRegistrationCode' test.out

#- 234 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "BJcUILkW", "languageTag": "zKAqNgxB"}' \
    > test.out 2>&1
eval_tap $? 234 'PublicForgotPasswordV3' test.out

#- 235 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId '7dBEUfq4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 235 'GetAdminInvitationV3' test.out

#- 236 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'OAgIh5Nr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "8jaHAlrV", "policyId": "b7tI7nKO", "policyVersionId": "psPuIHV4"}, {"isAccepted": true, "localizedPolicyVersionId": "CtlMI6CR", "policyId": "zWTzITtk", "policyVersionId": "Odvz7Dru"}, {"isAccepted": false, "localizedPolicyVersionId": "BDiiZjNj", "policyId": "8I2KbLHC", "policyVersionId": "VpxNNkfr"}], "authType": "EMAILPASSWD", "country": "yMg6i9yp", "dateOfBirth": "VsKSK664", "displayName": "6TMRgL2e", "password": "cbmp1Aom", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 236 'CreateUserFromInvitationV3' test.out

#- 237 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "lMmlNmDK", "country": "ScAQ1bMx", "dateOfBirth": "U15HPWJQ", "displayName": "LrGQmWNX", "languageTag": "ttUDulrB", "userName": "kRY7JAtv"}' \
    > test.out 2>&1
eval_tap $? 237 'UpdateUserV3' test.out

#- 238 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "4qDusKuz", "country": "RAio5fFq", "dateOfBirth": "fTGRgzwa", "displayName": "16vngddD", "languageTag": "Dg7KhJGJ", "userName": "e2WtN5tR"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicPartialUpdateUserV3' test.out

#- 239 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "kobksemi", "emailAddress": "IDRN6FdX", "languageTag": "RgnqVxSm"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicSendVerificationCodeV3' test.out

#- 240 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "aoe4U3gW", "contactType": "eBssKjgP", "languageTag": "7vWQihrc", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 240 'PublicUserVerificationV3' test.out

#- 241 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "PjEtWKbt", "country": "X1fZDyRY", "dateOfBirth": "8rOISben", "displayName": "Jesq61uH", "emailAddress": "CaWZVoVV", "password": "Bha4Tk7P", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 241 'PublicUpgradeHeadlessAccountV3' test.out

#- 242 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "XGJyQRGh", "password": "9k5ZzinS"}' \
    > test.out 2>&1
eval_tap $? 242 'PublicVerifyHeadlessAccountV3' test.out

#- 243 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "VApmwRpr", "newPassword": "L3A04YIZ", "oldPassword": "fOyd9s4U"}' \
    > test.out 2>&1
eval_tap $? 243 'PublicUpdatePasswordV3' test.out

#- 244 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'hVWDDx6m' \
    > test.out 2>&1
eval_tap $? 244 'PublicCreateJusticeUser' test.out

#- 245 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oJtEv1YJ' \
    --redirectUri '0AVZtpKa' \
    --ticket 'v8uHhhjQ' \
    > test.out 2>&1
eval_tap $? 245 'PublicPlatformLinkV3' test.out

#- 246 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'M9pHWpng' \
    --body '{"platformNamespace": "qrEMCrV1"}' \
    > test.out 2>&1
eval_tap $? 246 'PublicPlatformUnlinkV3' test.out

#- 247 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JCVqJkF4' \
    > test.out 2>&1
eval_tap $? 247 'PublicPlatformUnlinkAllV3' test.out

#- 248 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1c1f9NuB' \
    --ticket 'ujk73TAa' \
    > test.out 2>&1
eval_tap $? 248 'PublicForcePlatformLinkV3' test.out

#- 249 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VXCWFhbd' \
    --clientId 'evSOxw1l' \
    --redirectUri 'D87X9kzR' \
    > test.out 2>&1
eval_tap $? 249 'PublicWebLinkPlatform' test.out

#- 250 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'h94CqkBs' \
    --state 'tAKxHsEC' \
    > test.out 2>&1
eval_tap $? 250 'PublicWebLinkPlatformEstablish' test.out

#- 251 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "w7YaY8ax", "emailAddress": "w6EG1KS6", "newPassword": "cpzxUTLp"}' \
    > test.out 2>&1
eval_tap $? 251 'ResetPasswordV3' test.out

#- 252 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'F4zB3rKx' \
    > test.out 2>&1
eval_tap $? 252 'PublicGetUserByUserIdV3' test.out

#- 253 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GpNpIzaf' \
    --activeOnly  \
    --after 'Bg8xaxPT' \
    --before '3cRN5IjH' \
    --limit '76' \
    > test.out 2>&1
eval_tap $? 253 'PublicGetUserBanHistoryV3' test.out

#- 254 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fXoJdvhy' \
    > test.out 2>&1
eval_tap $? 254 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 255 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FeMZPFKg' \
    > test.out 2>&1
eval_tap $? 255 'PublicGetUserInformationV3' test.out

#- 256 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WFtTBNXd' \
    --after '0.3209773912730396' \
    --before '0.07153376420293411' \
    --limit '65' \
    > test.out 2>&1
eval_tap $? 256 'PublicGetUserLoginHistoriesV3' test.out

#- 257 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oZwxwUr6' \
    --after 'g5ZcfRnG' \
    --before 'jLPFrKef' \
    --limit '17' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetUserPlatformAccountsV3' test.out

#- 258 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WLtkav37' \
    > test.out 2>&1
eval_tap $? 258 'PublicListJusticePlatformAccountsV3' test.out

#- 259 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '1br2fo70' \
    --body '{"platformId": "wdCLS0qu", "platformUserId": "JqltayY8"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicLinkPlatformAccount' test.out

#- 260 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'o26uR5Cy' \
    --body '{"chosenNamespaces": ["CIh95kcT", "8DVo3mhX", "7ZTqsDax"], "requestId": "Bt0rDktf"}' \
    > test.out 2>&1
eval_tap $? 260 'PublicForceLinkPlatformWithProgression' test.out

#- 261 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ofkmm5K4' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetPublisherUserV3' test.out

#- 262 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EQsGQByw' \
    --password 'VHZARJjP' \
    > test.out 2>&1
eval_tap $? 262 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 263 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'Wr56HazX' \
    --before 'RArKwFGQ' \
    --isWildcard  \
    --limit '67' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetRolesV3' test.out

#- 264 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'VcdPmij3' \
    > test.out 2>&1
eval_tap $? 264 'PublicGetRoleV3' test.out

#- 265 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 265 'PublicGetMyUserV3' test.out

#- 266 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "Lo4LEqMn"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicSendVerificationLinkV3' test.out

#- 267 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'rGdu0k4g' \
    > test.out 2>&1
eval_tap $? 267 'PublicVerifyUserByLinkV3' test.out

#- 268 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'V4s1JArm' \
    --code 'lynlITbw' \
    --error 'emYz4vlX' \
    --state 'CftJgDti' \
    > test.out 2>&1
eval_tap $? 268 'PlatformAuthenticateSAMLV3Handler' test.out

#- 269 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'YYq2iCjO' \
    --payload 'X9ctBuZa' \
    > test.out 2>&1
eval_tap $? 269 'LoginSSOClient' test.out

#- 270 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'PYsCrcAk' \
    > test.out 2>&1
eval_tap $? 270 'LogoutSSOClient' test.out

#- 271 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'psdgUElc' \
    > test.out 2>&1
eval_tap $? 271 'RequestGameTokenResponseV3' test.out

#- 272 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '7ogxSIBL' \
    > test.out 2>&1
eval_tap $? 272 'AdminGetDevicesByUserV4' test.out

#- 273 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'GRBQHgo4' \
    --endDate 'rVA1sasj' \
    --limit '76' \
    --offset '52' \
    --startDate '7KIArV8b' \
    > test.out 2>&1
eval_tap $? 273 'AdminGetBannedDevicesV4' test.out

#- 274 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qg5DByDo' \
    > test.out 2>&1
eval_tap $? 274 'AdminGetUserDeviceBansV4' test.out

#- 275 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "nFVZUC2R", "deviceId": "fGGBI8g4", "deviceType": "TpRXAx2t", "enabled": false, "endDate": "CfOHTm6d", "ext": {"quuuzBs7": {}, "WuAN7w6e": {}, "mwpYOvTv": {}}, "reason": "em5UXKkf"}' \
    > test.out 2>&1
eval_tap $? 275 'AdminBanDeviceV4' test.out

#- 276 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'p2SdfXzb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 276 'AdminGetDeviceBanV4' test.out

#- 277 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'BTJtVmen' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 277 'AdminUpdateDeviceBanV4' test.out

#- 278 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'PAooCqjW' \
    --startDate 'TZW1LI9N' \
    --deviceType 'jLhmeGEo' \
    > test.out 2>&1
eval_tap $? 278 'AdminGenerateReportV4' test.out

#- 279 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 279 'AdminGetDeviceTypesV4' test.out

#- 280 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'LiIOREB8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDeviceBansV4' test.out

#- 281 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'NyfNEaHN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 281 'AdminDecryptDeviceV4' test.out

#- 282 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'PxHdP2BJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 282 'AdminUnbanDeviceV4' test.out

#- 283 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'kCSD9kZB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 283 'AdminGetUsersByDeviceV4' test.out

#- 284 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 44}' \
    > test.out 2>&1
eval_tap $? 284 'AdminCreateTestUsersV4' test.out

#- 285 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["QMEMjisA", "D20E1zlN", "GAhLZGBO"]}' \
    > test.out 2>&1
eval_tap $? 285 'AdminBulkCheckValidUserIDV4' test.out

#- 286 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'B01Y1gCB' \
    --body '{"avatarUrl": "hoFRWA9e", "country": "MPfR1Vs9", "dateOfBirth": "jZNevlW1", "displayName": "p1ufcilV", "languageTag": "QQKXiAZp", "userName": "lPqpreLF"}' \
    > test.out 2>&1
eval_tap $? 286 'AdminUpdateUserV4' test.out

#- 287 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'g92AuqqF' \
    --body '{"code": "IZg9zNG3", "emailAddress": "uzjFbGJg"}' \
    > test.out 2>&1
eval_tap $? 287 'AdminUpdateUserEmailAddressV4' test.out

#- 288 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CWUd6oDO' \
    > test.out 2>&1
eval_tap $? 288 'AdminDisableUserMFAV4' test.out

#- 289 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'K2DTkgfY' \
    > test.out 2>&1
eval_tap $? 289 'AdminListUserRolesV4' test.out

#- 290 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xKbVLjeD' \
    --body '{"assignedNamespaces": ["b6dzmPOu", "cLm2LZSc", "QOLRaNHQ"], "roleId": "sqstVLRa"}' \
    > test.out 2>&1
eval_tap $? 290 'AdminUpdateUserRoleV4' test.out

#- 291 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fvpDhrtB' \
    --body '{"assignedNamespaces": ["a57B50Vt", "h95Zgs5y", "5JTsIxTs"], "roleId": "QFahFiUI"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminAddUserRoleV4' test.out

#- 292 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jGJPrf6D' \
    --body '{"assignedNamespaces": ["HA4e71NR", "ZekPGxBv", "Vn5VWhNH"], "roleId": "TG0Ro32t"}' \
    > test.out 2>&1
eval_tap $? 292 'AdminRemoveUserRoleV4' test.out

#- 293 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '24' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 293 'AdminGetRolesV4' test.out

#- 294 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "aFM5fKIF"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminCreateRoleV4' test.out

#- 295 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'Iy1ru6BG' \
    > test.out 2>&1
eval_tap $? 295 'AdminGetRoleV4' test.out

#- 296 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'Fhg0UGWf' \
    > test.out 2>&1
eval_tap $? 296 'AdminDeleteRoleV4' test.out

#- 297 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'BVUuLr5T' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "zVLBrz2h"}' \
    > test.out 2>&1
eval_tap $? 297 'AdminUpdateRoleV4' test.out

#- 298 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'jDlwgW8A' \
    --body '{"permissions": [{"action": 29, "resource": "GAViaCUW", "schedAction": 86, "schedCron": "sLrnpOMM", "schedRange": ["cVj1aOXx", "tcIHT2Y6", "0gCyxoea"]}, {"action": 7, "resource": "4PdLJyXF", "schedAction": 49, "schedCron": "X6UzDdGy", "schedRange": ["vZh9w25M", "w9u3mV8X", "2uQZ2PYp"]}, {"action": 71, "resource": "EqyRF2AR", "schedAction": 61, "schedCron": "Z5HqNjqk", "schedRange": ["HhBiBqSX", "pbscKocs", "dZVCGsl1"]}]}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateRolePermissionsV4' test.out

#- 299 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'fFsjjY4R' \
    --body '{"permissions": [{"action": 87, "resource": "0hQsn1CT", "schedAction": 62, "schedCron": "ku0yqzcK", "schedRange": ["CR3EBKt4", "MtI8Tft0", "5ruQW5iA"]}, {"action": 32, "resource": "5xilgkDz", "schedAction": 47, "schedCron": "IElJp8OI", "schedRange": ["885WKYU6", "JdK1K82A", "lHZz0jcT"]}, {"action": 21, "resource": "EjeP5ypM", "schedAction": 69, "schedCron": "a0bqHY43", "schedRange": ["dWE5ytxu", "AbJZGup1", "OzeGTp1O"]}]}' \
    > test.out 2>&1
eval_tap $? 299 'AdminAddRolePermissionsV4' test.out

#- 300 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'jBed89bp' \
    --body '["w4ZLNfbS", "pAOVokGG", "YweTu6mx"]' \
    > test.out 2>&1
eval_tap $? 300 'AdminDeleteRolePermissionsV4' test.out

#- 301 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'q4UnLG6A' \
    --after 'HaNJFABX' \
    --before 'VAi4VRWm' \
    --limit '19' \
    > test.out 2>&1
eval_tap $? 301 'AdminListAssignedUsersV4' test.out

#- 302 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'YPgsnyQU' \
    --body '{"assignedNamespaces": ["6fAV9q2r", "r4QfOn65", "mh14MZLb"], "namespace": "kXPhGp4r", "userId": "ehKfH4Lu"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminAssignUserToRoleV4' test.out

#- 303 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'AHLoDLxn' \
    --body '{"namespace": "nVO5M5g6", "userId": "Kk7vwhCO"}' \
    > test.out 2>&1
eval_tap $? 303 'AdminRevokeUserFromRoleV4' test.out

#- 304 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "iHeh5hZi", "country": "y3T9OX77", "dateOfBirth": "FidKajjm", "displayName": "RX6jZEVu", "languageTag": "PUxlX32Y", "userName": "8YJWwWW1"}' \
    > test.out 2>&1
eval_tap $? 304 'AdminUpdateMyUserV4' test.out

#- 305 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 305 'AdminDisableMyAuthenticatorV4' test.out

#- 306 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '3a9Jv3jE' \
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
    --factor 'fsZLXSbS' \
    > test.out 2>&1
eval_tap $? 314 'AdminMakeFactorMyDefaultV4' test.out

#- 315 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["I6BtUXr3", "8RDVnVLu", "Tu3Yucqm"], "emailAddresses": ["wLG3O67S", "cRGElro7", "CocuK1BW"], "isAdmin": true, "roleId": "j03gQE6F"}' \
    > test.out 2>&1
eval_tap $? 315 'AdminInviteUserV4' test.out

#- 316 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "PYrF6PJk", "policyId": "Ybs0oyfw", "policyVersionId": "sM49WpQj"}, {"isAccepted": true, "localizedPolicyVersionId": "35mMW8D7", "policyId": "A4zRGzK7", "policyVersionId": "Sp1RBBlH"}, {"isAccepted": false, "localizedPolicyVersionId": "jcfDO3WV", "policyId": "5EgCwPfS", "policyVersionId": "lk0NczD1"}], "authType": "EMAILPASSWD", "country": "bMJtnDio", "dateOfBirth": "obL7PZpA", "displayName": "QGE2IpW0", "emailAddress": "1Vr1QslO", "password": "oeLoZgcT", "passwordMD5Sum": "m6nJnYmc", "username": "G4oiSL5B", "verified": false}' \
    > test.out 2>&1
eval_tap $? 316 'PublicCreateTestUserV4' test.out

#- 317 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "i6ozXNjx", "policyId": "ftLReFgZ", "policyVersionId": "heC2CMGf"}, {"isAccepted": false, "localizedPolicyVersionId": "o0tjDie6", "policyId": "q9atqfzZ", "policyVersionId": "gquUzjKf"}, {"isAccepted": true, "localizedPolicyVersionId": "KYTLxPHz", "policyId": "tbpuPjTv", "policyVersionId": "xcCmNLA8"}], "authType": "EMAILPASSWD", "code": "i7DmhbLm", "country": "XJFWF7An", "dateOfBirth": "2P0qkYce", "displayName": "rbrFxT0u", "emailAddress": "6BjEOXJq", "password": "o5iB50yF", "passwordMD5Sum": "1X5HV2xy", "reachMinimumAge": false, "username": "SUtOBXbJ"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicCreateUserV4' test.out

#- 318 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'ajUQioXF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "c7WSgocd", "policyId": "QQhp554k", "policyVersionId": "Xdyte7DU"}, {"isAccepted": false, "localizedPolicyVersionId": "NEjwyEtJ", "policyId": "YoxRqRds", "policyVersionId": "0IvlPvrN"}, {"isAccepted": false, "localizedPolicyVersionId": "r9utwfO2", "policyId": "0pb6h0H8", "policyVersionId": "2Mmgaq1v"}], "authType": "EMAILPASSWD", "country": "FJkDGmHO", "dateOfBirth": "VggnD59l", "displayName": "QkPtZbNg", "password": "Jx9WDqWU", "reachMinimumAge": false, "username": "BZaYP4es"}' \
    > test.out 2>&1
eval_tap $? 318 'CreateUserFromInvitationV4' test.out

#- 319 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "QZyEzGd3", "country": "O2ttSlwl", "dateOfBirth": "rx6yAeIx", "displayName": "f8TrqTJl", "languageTag": "BZ8Ml45a", "userName": "RgOJ6JZj"}' \
    > test.out 2>&1
eval_tap $? 319 'PublicUpdateUserV4' test.out

#- 320 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Huthl6vi", "emailAddress": "7bUXSzjR"}' \
    > test.out 2>&1
eval_tap $? 320 'PublicUpdateUserEmailAddressV4' test.out

#- 321 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "m13DAlDm", "country": "6DoUzytW", "dateOfBirth": "8t7TnjyF", "displayName": "Z8TqwVpX", "emailAddress": "n00I61cU", "password": "BJxelyOq", "reachMinimumAge": true, "username": "AxAbVNXN", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 321 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 322 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "KZ7PLyaO", "password": "kB1NFYIz", "username": "vz4ea3mr"}' \
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
    --code 'hgUupJrs' \
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
    --deviceToken '6gEUZDc3' \
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
    --factor 'ozVf5BwV' \
    > test.out 2>&1
eval_tap $? 333 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE