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
echo "1..435"

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

#- 108 AdminListClientAvailablePermissions
./ng net.accelbyte.sdk.cli.Main iam adminListClientAvailablePermissions \
    --excludePermissions  \
    > test.out 2>&1
eval_tap $? 108 'AdminListClientAvailablePermissions' test.out

#- 109 AdminUpdateAvailablePermissionsByModule
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAvailablePermissionsByModule \
    --forceDelete  \
    --body '{"modules": [{"docLink": "EAxcVpFrttufHIRd", "groups": [{"group": "H9UzVRiXbqlAw7r6", "groupId": "W2ktQG0h5JAav5kR", "permissions": [{"allowedActions": [0, 27, 100], "resource": "mzZ0m8SAMTwE6I56"}, {"allowedActions": [70, 0, 77], "resource": "RDBXxyaNoMR6hksp"}, {"allowedActions": [71, 2, 27], "resource": "PngUNB1vRodwpzS6"}]}, {"group": "DaDpv8N7ZQVqGj6o", "groupId": "DLjWjkY1aXlFcDtg", "permissions": [{"allowedActions": [83, 81, 18], "resource": "Y4YkHs1cnz1JSDgY"}, {"allowedActions": [93, 29, 23], "resource": "p38zsCTCrbCbPOyN"}, {"allowedActions": [86, 23, 21], "resource": "y6XM4OI18mAQLnzj"}]}, {"group": "Mf8GZ2WBZqxYG3aR", "groupId": "EAu2D6QVKNCWP75T", "permissions": [{"allowedActions": [57, 30, 18], "resource": "Fgx4c8OumKtPDKJD"}, {"allowedActions": [67, 28, 25], "resource": "Z4U68su8XfqlqNiT"}, {"allowedActions": [43, 0, 56], "resource": "vj7AorKsxwkosAVe"}]}], "module": "rXpc1C8XfwHuKeb9", "moduleId": "l3rGN9A3sNm84hdd"}, {"docLink": "SpHt0P7MIIR7CkyF", "groups": [{"group": "6C7duuyZ0GhDogqr", "groupId": "hBRd8lDR6qVNPRZY", "permissions": [{"allowedActions": [6, 80, 65], "resource": "Rljv7IPrDQQRgat0"}, {"allowedActions": [91, 9, 76], "resource": "vkLGMS0lyuI9a2I9"}, {"allowedActions": [42, 52, 86], "resource": "Vpbsx5w8hqUI06Up"}]}, {"group": "OXGSLmCVuHOPlLlk", "groupId": "vR8sKgnuRkgghGoY", "permissions": [{"allowedActions": [42, 17, 31], "resource": "ljvjKoyD6SCwGrnc"}, {"allowedActions": [34, 21, 25], "resource": "QsfCaTmt1d67FXGk"}, {"allowedActions": [77, 37, 17], "resource": "9Q0mPVo3twu0MesT"}]}, {"group": "Cf9x4rt69lna7qxN", "groupId": "eIxPz6MbwL6IY69z", "permissions": [{"allowedActions": [100, 95, 11], "resource": "aLqYSYWytLPziZMd"}, {"allowedActions": [19, 89, 49], "resource": "Kd3IL5TAQ6iiPlSC"}, {"allowedActions": [42, 62, 63], "resource": "zfTD1ZBm3MqHcUmL"}]}], "module": "ZZbSqb8RwNmn9HrN", "moduleId": "Qy4uZAAiE0mit9RG"}, {"docLink": "CCHYzUOcEdscKHPE", "groups": [{"group": "qgA8yu7Vk6Jt4Ymo", "groupId": "s9Jcdos4fYcTVU6R", "permissions": [{"allowedActions": [56, 44, 39], "resource": "CkGZ5dAgqxpBFmaL"}, {"allowedActions": [29, 73, 49], "resource": "MdalwSyliWMNW5Ny"}, {"allowedActions": [77, 43, 41], "resource": "qtlB2jJCSQT279ZZ"}]}, {"group": "PYGu0rdlgdWyOtXi", "groupId": "3choQrpOsDBU5Sep", "permissions": [{"allowedActions": [19, 59, 79], "resource": "hB3V0v52Dlym6puQ"}, {"allowedActions": [57, 48, 66], "resource": "oJ8aeCnaLpUKp44Y"}, {"allowedActions": [96, 60, 11], "resource": "jasWIPUvmEejtGeo"}]}, {"group": "yIPa8ZRrvjj7il35", "groupId": "MXbN9oCMNqq98SjT", "permissions": [{"allowedActions": [45, 70, 15], "resource": "xjUkl535X3ateEKD"}, {"allowedActions": [31, 58, 53], "resource": "9b6i5lZC9xv32e8c"}, {"allowedActions": [88, 4, 88], "resource": "sSovoqsZNBdte9ND"}]}], "module": "UPVJf6c2Z0QZxfgP", "moduleId": "ubTDIHrvqAThuwjR"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "HpKKTlmVr9XuoJbR", "moduleId": "FQSKVPHbn4Xxtu7L"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminDeleteConfigPermissionsByGroup' test.out

#- 111 AdminListClientTemplates
./ng net.accelbyte.sdk.cli.Main iam adminListClientTemplates \
    > test.out 2>&1
eval_tap $? 111 'AdminListClientTemplates' test.out

#- 112 AdminGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminGetInputValidations \
    > test.out 2>&1
eval_tap $? 112 'AdminGetInputValidations' test.out

#- 113 AdminUpdateInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminUpdateInputValidations \
    --body '[{"field": "QRENjEEztx1WsYSi", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["nSBJroav91GXlvPG", "6bFYReVHQipcCx9Z", "w5D2L7vIYhGGSyEW"], "preferRegex": true, "regex": "ZJJ42d3PBddN8S48"}, "blockedWord": ["l9lyNApflxqMrj3o", "Zk03QXcKMDYDDxHS", "ZjtqXyJ58f7Gc26S"], "description": [{"language": "aiGVkydwYWQG26yU", "message": ["ZNmTBcvrbYCwZtxF", "HyPLtI8ilbyDPUIj", "88cekdqCt81P1ktf"]}, {"language": "Iovmv9gsR5cJcHm3", "message": ["SZLxoRDFuuuySj29", "a9LJE8HoRS1X2PFA", "AMwzHPxB1UskYs4Y"]}, {"language": "w20DOqOBSC2DKHRu", "message": ["PMMWH8Yb33T5UBJC", "jfcnLRfxeCSz9WEi", "8KlloeH0JT1yduat"]}], "isCustomRegex": true, "letterCase": "vQR3biBfsu4jmsRE", "maxLength": 47, "maxRepeatingAlphaNum": 53, "maxRepeatingSpecialCharacter": 82, "minCharType": 50, "minLength": 63, "profanityFilter": "QAk4mqrxzTtuLl4X", "regex": "lbGL8QOxtjzm8y2w", "specialCharacterLocation": "NhmwoYZyI4EFZKBc", "specialCharacters": ["YrCEAE7WIsfmx40N", "LRc6m8heKnWhzfe2", "NubeoKFeIaFQCYoD"]}}, {"field": "PICpnduEEQlULdJz", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["BkMNxvvKgAT8mJrY", "q6hRkloqxM3gpwxc", "fMy9XzjjI5YbsKoA"], "preferRegex": true, "regex": "L3sa13lk1dQBHO86"}, "blockedWord": ["IlBhnetU4RwTqUXl", "TDBzOuYsaZA2yyd4", "mbqoOfADMMAXFaY9"], "description": [{"language": "eKa699bRVhyaKwwr", "message": ["AP2aMlu7WtjCtoYe", "tOO847g8OudOfjnC", "uHZ3c46IjGa23YvY"]}, {"language": "mmDg7VYPXIuvUYTZ", "message": ["BRujIUE1Tq5jyAZv", "kRCMNFIurjh2imdb", "4rbkXj0ZwsVC0gL9"]}, {"language": "7ZVJSPqJiwv1qlYB", "message": ["1RSKs6gQxC3Gb7S0", "o4zGYY7KQI1AeFgP", "qaOkvo1aolB4lkKB"]}], "isCustomRegex": false, "letterCase": "EYOkQ1jMD3cym8xI", "maxLength": 10, "maxRepeatingAlphaNum": 83, "maxRepeatingSpecialCharacter": 22, "minCharType": 28, "minLength": 83, "profanityFilter": "0jJLHC9LxhvNXTwG", "regex": "BCtohLtl9Zuhytm5", "specialCharacterLocation": "UDrT6QXCs5SPBbRP", "specialCharacters": ["ZTF6oQAXVG7tnsZg", "5QgXjvyGJPN4eXbJ", "E5Vs2GcyomQoIXim"]}}, {"field": "BJehyxlNsjUgxBkF", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["SJtjX7ZshZyZl5x4", "bRXBHUTrDzZSKscf", "OcYu3dpCROYqUiGK"], "preferRegex": false, "regex": "VFCmpo6sPwVOEDSJ"}, "blockedWord": ["sEK5QpNhlI2iS5Ep", "GhhvXYck0upMzUYn", "b76tFkEORV3bu1bN"], "description": [{"language": "CtX7W40V6Do5sYad", "message": ["CCFrHHC3DpZxkrQD", "XuNFviMarv8mnfHK", "8CCmE2lPnsbD3SGE"]}, {"language": "dlwuUccE536ugBp3", "message": ["HBvepnDCjgyJlXe3", "6mgWjLfFmteue9nz", "J6fH24T805tVg8Jq"]}, {"language": "U0jZpjvsugAOS7u8", "message": ["RiWyerCSa8SRgwsA", "j1ik1jglaDXTvKCW", "wNTAhd2wrS0uPdjh"]}], "isCustomRegex": false, "letterCase": "wRVnwVBOqOHi8pWG", "maxLength": 6, "maxRepeatingAlphaNum": 55, "maxRepeatingSpecialCharacter": 69, "minCharType": 20, "minLength": 19, "profanityFilter": "uYhiqjRJOqB5F93z", "regex": "FQbJndUDpdONneAc", "specialCharacterLocation": "zbBdHb2slt71B1Sm", "specialCharacters": ["Zp2JZp50CnPb71OR", "YcmQbTU5JX8ccLjM", "XJRk0eaKQDOJvrTe"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'fglSs6g4iY9u02aC' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'NYIWekp18lOC3mNq' \
    --before 'F7Bl0LcghVHfPEsp' \
    --endDate 'xwhRON0bc1eMbEIj' \
    --limit '29' \
    --query 'FJ1KesKoELCpobBE' \
    --roleId 'G8X645xpdXpai0rY' \
    --startDate 'aT5hOPjaf3H0tYig' \
    > test.out 2>&1
eval_tap $? 115 'ListAdminsV3' test.out

#- 116 AdminGetAgeRestrictionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetAgeRestrictionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 116 'AdminGetAgeRestrictionStatusV3' test.out

#- 117 AdminUpdateAgeRestrictionConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAgeRestrictionConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 16, "enable": false}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'U0VUfcYHJbBfAKSi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 85}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'Twr0KHaAsmTej52W' \
    --limit '74' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "i6tArAURt9plCSVq", "comment": "8PdH6hJPUAc0RVwX", "endDate": "gAgntLMCuaXBWQi6", "reason": "BqPg4xr0lCancUZG", "skipNotif": true, "userIds": ["SZIPkhSgORcz5S5B", "vmgBLxh4ijFnE3Ta", "m69qSZ7PC6f6QkmZ"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "XElW9YfRSse6AAz3", "userId": "S4czz0QKFlAVmVLu"}, {"banId": "4AOec0z8eBeeoip6", "userId": "8J1nsv4W2OJhtafx"}, {"banId": "MSJlHeb34sZKHcl5", "userId": "LLLOexL4fZvWtND2"}]}' \
    > test.out 2>&1
eval_tap $? 122 'AdminUnbanUserBulkV3' test.out

#- 123 AdminGetBansTypeWithNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBansTypeWithNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetBansTypeWithNamespaceV3' test.out

#- 124 AdminGetClientsByNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsByNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'tcBFpX8lNtFEJ7tn' \
    --clientName 'kY6Mca5afj12K2Iz' \
    --clientType 'rBvvWm4udE0OXudX' \
    --limit '13' \
    --offset '22' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["Nne8kJATwlc6esUp", "6Sw1I98jeZQ7hfxn", "hLd3Knaknoed9DHh"], "clientUpdateRequest": {"audiences": ["LOqQGhCUr6iTrjyE", "garAdNJOIG36I6tR", "bRcrEveMdAdiPKDU"], "baseUri": "VSC00PYeDcagginx", "clientName": "nFIna3yddcbsPheT", "clientPermissions": [{"action": 69, "resource": "CohViHA5CzgFSy8X", "schedAction": 69, "schedCron": "A3PrIfapq5AAeMe4", "schedRange": ["L3mDWORBVXTIIJM9", "XsYIIZxiXNMR9Bga", "WcFX3SUBhyoTsMWP"]}, {"action": 54, "resource": "Vmb8GEXFTlEMEsFz", "schedAction": 10, "schedCron": "qwgK1Np5nodqpLm7", "schedRange": ["FhJBNXzAFdO0Khqf", "6kiTdSGv2LFjAKY7", "CbgsWqFWZX7kPBom"]}, {"action": 84, "resource": "F9GLLTG8phc3n4iL", "schedAction": 29, "schedCron": "AG9YI89hmguB8FOT", "schedRange": ["jMLo4b9rIzqYkEps", "tyVTBcrM8rG0rH0z", "cswwVeMK6MbGIVIu"]}], "clientPlatform": "8vvwLc7KY3uVoJXT", "deletable": false, "description": "tpgkieDyF97lGdMi", "modulePermissions": [{"moduleId": "HKxbWCYzo8yO2KTK", "selectedGroups": [{"groupId": "9tmmOnYnOpas6ghP", "selectedActions": [51, 78, 79]}, {"groupId": "Zi7s7QBlk44Z44B1", "selectedActions": [67, 1, 14]}, {"groupId": "KBwa3Ddb60ufPpzw", "selectedActions": [18, 36, 99]}]}, {"moduleId": "QGIFmlVf4jvapseE", "selectedGroups": [{"groupId": "9LN9bvhOrHflIOd6", "selectedActions": [82, 86, 43]}, {"groupId": "rmsApRA6HX3RwrKt", "selectedActions": [30, 9, 4]}, {"groupId": "SV38nEhoXmM2W7l6", "selectedActions": [19, 29, 70]}]}, {"moduleId": "LF6M4lNa4JUMSHNg", "selectedGroups": [{"groupId": "qRqCV7usamANkZlO", "selectedActions": [34, 17, 91]}, {"groupId": "OiC4j0iktm0ZPLkL", "selectedActions": [82, 79, 38]}, {"groupId": "9uSybRzWek2gZvRr", "selectedActions": [43, 53, 36]}]}], "namespace": "t6bSc6bWvgpVyW9d", "oauthAccessTokenExpiration": 61, "oauthAccessTokenExpirationTimeUnit": "cBE2ItBS3KtKZWe8", "oauthRefreshTokenExpiration": 0, "oauthRefreshTokenExpirationTimeUnit": "uaS7RBx3vim02jBO", "redirectUri": "xrZDyvpcLYOWA8Nj", "scopes": ["xOnaEok4nOOCzfsf", "lhjbngJOUn18G5Ml", "fDTk8aG40NlncceI"], "skipLoginQueue": true, "twoFactorEnabled": true}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["gAIkgzh4pTU0Am4D", "Zhl0bQxFJ3sWCqQp", "Q2FbKPFMycMSQ4qf"], "baseUri": "AacR0LgB5BUXvjcu", "clientId": "2s6w3VifnKqmTSoG", "clientName": "H1XEfY6QAYn6WQ5U", "clientPermissions": [{"action": 56, "resource": "6vSkVFWdsbYuVEGV", "schedAction": 49, "schedCron": "uDXSxSc3aZPV87pn", "schedRange": ["a08gxefTYKhuxaEc", "7M4P7UckSC6ePeN8", "i4GrFES9z7xueHpA"]}, {"action": 93, "resource": "c53q7akMpcmnnx6R", "schedAction": 98, "schedCron": "drkEnnqKzFsLfYal", "schedRange": ["UlfwEQKjU7eHGebS", "Vu0LQ40kepEaC4df", "iOMZfEhHr39pysFO"]}, {"action": 82, "resource": "Zvc1BZG99LyvfvHE", "schedAction": 38, "schedCron": "ENx9xZlAchob44lO", "schedRange": ["NDDwMvgI0HlyPR7w", "ZNiVsF6xG2mXEQdb", "zIVy8alncV7vWgSH"]}], "clientPlatform": "dfo07UctPErqxyMy", "deletable": false, "description": "K06MqQBErxgjVByc", "modulePermissions": [{"moduleId": "vU4PbmRDcrg0DjQj", "selectedGroups": [{"groupId": "BECXvea7H1m2lJFR", "selectedActions": [23, 32, 78]}, {"groupId": "prZ60zMjhTHeh94T", "selectedActions": [91, 23, 8]}, {"groupId": "TIKVowi0RY2VN4ZO", "selectedActions": [80, 78, 72]}]}, {"moduleId": "H57l2Zsrh90ETtYm", "selectedGroups": [{"groupId": "Gukz3MnlrjcHp6B8", "selectedActions": [97, 73, 19]}, {"groupId": "WBPrx9Ns8eLzYEvw", "selectedActions": [91, 100, 41]}, {"groupId": "TaLQjctvrK2jhsYp", "selectedActions": [74, 18, 85]}]}, {"moduleId": "SoTB2NMKtezapPr2", "selectedGroups": [{"groupId": "QEPx3zTxBGtEJIYp", "selectedActions": [31, 8, 42]}, {"groupId": "cWw7Rry0KK5rgAGO", "selectedActions": [6, 55, 100]}, {"groupId": "Ev3aevq6iohU1cg4", "selectedActions": [41, 70, 31]}]}], "namespace": "S3Uv1BpWoJBaqdg2", "oauthAccessTokenExpiration": 64, "oauthAccessTokenExpirationTimeUnit": "CHvuk6B6XTmSLyn5", "oauthClientType": "0sigBVZxiKdV57Gv", "oauthRefreshTokenExpiration": 90, "oauthRefreshTokenExpirationTimeUnit": "Do5R3hLiD5sf5y1J", "parentNamespace": "sxJNGmyt0SQDUDoW", "redirectUri": "BZVGLlkUetzCAWc9", "scopes": ["x1aMjgGim51T107X", "IZRZ7tZdIs0xf4cz", "dt7zqmSKxOEQlVcx"], "secret": "6GqsBq8vdhWVnuYL", "skipLoginQueue": false, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'VXtoWAXhMlW4tLqX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId '7OICf5oD1e6oI9Fm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'Yel0kOw72o8Zkgk0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["jS6rDWUwfhKvrf2A", "aH4yCWrHSppnIZkN", "nTn3rzH5NvAtcvNe"], "baseUri": "dgS1fUfKmihDbmu8", "clientName": "ePWlQMVDXEHeiGTn", "clientPermissions": [{"action": 47, "resource": "b64ELbzDMwyo4nIR", "schedAction": 50, "schedCron": "ISW510kHr4isTKWj", "schedRange": ["mv67nuHCXWfwnwGi", "oVwVzmmBVVFfpqx1", "AeLtzcPJ3jtDYBo4"]}, {"action": 65, "resource": "MZz95OYKiqaZD63x", "schedAction": 8, "schedCron": "iCqSMzpqIFGLkDs7", "schedRange": ["ACC1RgBfoNrHlFi2", "qJLgmBLE35YhyiDV", "90SeI5yppBHoytVz"]}, {"action": 27, "resource": "ECUo1NPpeFhUztXD", "schedAction": 13, "schedCron": "PbGikLjgjcj34uul", "schedRange": ["U6FYBZsWFbr3RSP0", "W9nBhvhf8Q0DtJMc", "YQdN66bswAgt65X4"]}], "clientPlatform": "N1LQZmB61JMdtwCV", "deletable": false, "description": "rYQue84dwmbwFEnA", "modulePermissions": [{"moduleId": "ZaWsQJtRYoagRJK5", "selectedGroups": [{"groupId": "PX9UcOvhPyE11TRT", "selectedActions": [100, 91, 55]}, {"groupId": "Kseoe8VLie0LBa36", "selectedActions": [74, 16, 81]}, {"groupId": "WZEtyd56LfxnbY97", "selectedActions": [19, 19, 19]}]}, {"moduleId": "TDfKFDXC7eGL5YhJ", "selectedGroups": [{"groupId": "DWh9YWqc0qgV6d9y", "selectedActions": [84, 19, 12]}, {"groupId": "CMDtDMrentgn3Dhq", "selectedActions": [5, 78, 17]}, {"groupId": "TmSvTkQQgB7exYvm", "selectedActions": [69, 24, 79]}]}, {"moduleId": "hXbWhbwPwToC6knj", "selectedGroups": [{"groupId": "VwVnzaqSfJiQFC2g", "selectedActions": [87, 29, 70]}, {"groupId": "da0kg16yUSpSOAjH", "selectedActions": [73, 4, 99]}, {"groupId": "lOdxIwqejxe18rNd", "selectedActions": [3, 39, 83]}]}], "namespace": "nEZhpByfHZinxNfg", "oauthAccessTokenExpiration": 86, "oauthAccessTokenExpirationTimeUnit": "QltnSojV4jT65ycl", "oauthRefreshTokenExpiration": 54, "oauthRefreshTokenExpirationTimeUnit": "2FtAz0vJjFIYWOaN", "redirectUri": "dsimmkW2miH3xRHA", "scopes": ["Ky4QxZkaXZ7vmiEd", "0JPxVyQpshaDwNqT", "bbFMXAMfVXe0GZeM"], "skipLoginQueue": false, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'sRsmH1EQrYmkPKTP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 83, "resource": "r9EOIFg0dnWIYN2N"}, {"action": 97, "resource": "THJe4BhSSQkQD6Wm"}, {"action": 84, "resource": "MuYmmeKTmBNvGYxE"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'Qdf3ewoGGoY7xmFN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 54, "resource": "oltDxsbzxrlaKEfk"}, {"action": 30, "resource": "6YApGJ9ufwLYkqIg"}, {"action": 77, "resource": "wC3WgumrIz4NhGzt"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '10' \
    --clientId 'pr4U4fwQIiLXgmRa' \
    --namespace "$AB_NAMESPACE" \
    --resource 'svjO4lj8m3XEwP2b' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey '4gd3xOeii8Jnmsse' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 133 'AdminGetConfigValueV3' test.out

#- 134 AdminGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    --filterBlacklist  \
    > test.out 2>&1
eval_tap $? 134 'AdminGetCountryListV3' test.out

#- 135 AdminGetCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'AdminGetCountryBlacklistV3' test.out

#- 136 AdminAddCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminAddCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"blacklist": ["p2xD2NY0kABeGs9y", "xahld1pO0Gyf5PO3", "COyMvczgEpzZ3Fbt"]}' \
    > test.out 2>&1
eval_tap $? 136 'AdminAddCountryBlacklistV3' test.out

#- 137 AdminGetLoginAllowlistV3
./ng net.accelbyte.sdk.cli.Main iam adminGetLoginAllowlistV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 137 'AdminGetLoginAllowlistV3' test.out

#- 138 AdminUpdateLoginAllowlistV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateLoginAllowlistV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "roleIds": ["r9TsvcMQ7dBsaIec", "RxIsZvD6rmzVr5XT", "1Nxw0v1dMQ9Rrbk6"]}' \
    > test.out 2>&1
eval_tap $? 138 'AdminUpdateLoginAllowlistV3' test.out

#- 139 RetrieveAllThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'RetrieveAllThirdPartyLoginPlatformCredentialV3' test.out

#- 140 RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'RetrieveAllActiveThirdPartyLoginPlatformCredentialV3' test.out

#- 141 RetrieveAllSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 141 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 142 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0XIZRW491e94mQjV' \
    > test.out 2>&1
eval_tap $? 142 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 143 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OOBnIWhunElqZUod' \
    --body '{"ACSURL": "p3IhtCSHy1ei1fIr", "AWSCognitoRegion": "PvfHnRN06EjRwEQl", "AWSCognitoUserPool": "NapJRfk4f9Zcw1pE", "AllowedClients": ["HAyNFxcVTKuAQTGh", "5BxjWOozGoDtsUuY", "o5p8ED5QZAufwNa8"], "AppId": "lzfjv9oYMXMjlVHY", "AuthorizationEndpoint": "1AHwF3vGoav7MK0P", "ClientId": "cLnEkcokKwcQ0baD", "EmptyStrFieldList": ["T9OyJ2h23GUS2amU", "7syGlElXdEAOrVSn", "LocLVVYamQc4wcG5"], "EnableServerLicenseValidation": false, "Environment": "PlRpWjmHZAAvKTH8", "FederationMetadataURL": "MuqIg0CzkguwuJCW", "GenericOauthFlow": true, "IncludePUID": true, "IsActive": true, "Issuer": "EFB67AODbi9BzupB", "JWKSEndpoint": "sFpYc77GtRUcCFeY", "KeyID": "5g4XgBsbfzqxBPNe", "LogoURL": "8ae1Il4aAtEbu4Ij", "NetflixCertificates": {"encryptedPrivateKey": "GdqthRxTjQ7gkZEY", "encryptedPrivateKeyName": "8rG0q0Q2Qd2JzRbk", "publicCertificate": "F2I03dIjvBbA6bfb", "publicCertificateName": "YaJCJjfk2TUvn95F", "rootCertificate": "hO7VW3mbDVMDu87t", "rootCertificateName": "0ldWf7iSGIiKFtWt"}, "OrganizationId": "n4Yr2svKM6pqLGZ0", "PlatformName": "TBujELAUK6mQ5iZg", "RedirectUri": "bwwm5iGzXtcknrgi", "RegisteredDomains": [{"affectedClientIDs": ["dKupvXO6aj4hCmTC", "34jxW4pIDwdqXpmR", "mut9H9XyWI8bp8fQ"], "domain": "xRuX91uYmtrHJbEG", "namespaces": ["TUj7YjERL1rEQG02", "zccA8wvLsWUNd6lP", "KvqDejvqklTSvDwu"], "roleId": "OrP9lzpiX0VuFpZu", "ssoCfg": {"googleKey": {"m7izxe7NPzjOa8E7": {}, "wY76PxLv9HBEUe89": {}, "AwEw1HO4FnKtx4XL": {}}, "groupConfigs": [{"assignNamespaces": ["KAmlDr19uJ3nq6Ve", "rzVCcI8y3Cz0YqCK", "Uh5RD9vNAp4jinFp"], "group": "nQ5xF9wwbvMZyeDe", "roleId": "RnVfPUa6xVVBcq3w"}, {"assignNamespaces": ["ZpFIYeAg79HcLJXJ", "7mpVI6eTYAjdPlCi", "QQC35cj4KyOVgvnW"], "group": "bfRJtsB7cUQZ2QUA", "roleId": "xJrINPXppPNO3Afm"}, {"assignNamespaces": ["XcgwC3IN6tvKgLB9", "QmJIOq9dP5szG71u", "tjsQ4CrRb9gUCeVz"], "group": "7fWbZIdhevfZvyV7", "roleId": "AcodcZwKjYDdmJOl"}]}}, {"affectedClientIDs": ["zwm9Su4FnS98Qqft", "Sjq7sn8yreciPLfk", "VyyJsbGpO6JgehDJ"], "domain": "xEN7JlZc8LMq1o2j", "namespaces": ["ZWu4yA3r0u4q1bTH", "XIjfJKyFlM0u1uuo", "Vdn9yVoSlKNchPHN"], "roleId": "L4X3LLaGPGdqLE8S", "ssoCfg": {"googleKey": {"ohhhuiTnJarYYkHB": {}, "DdSzBXdxapwhd5IQ": {}, "YBQuxLvPuWYvE3fs": {}}, "groupConfigs": [{"assignNamespaces": ["Ny9Z9OhxXvCp9y7f", "LD2qfCXnlUnqxT1W", "sRNMZcA92hzC7MNa"], "group": "8vVe4MHX6AgMep90", "roleId": "AyyUJyAK5PRMRMwd"}, {"assignNamespaces": ["vl0hv6g62GxBW2tQ", "F5tkTjgJaMYvNQOs", "Da4bkcgepqtxjbrz"], "group": "tee7QLTGAak7Kaol", "roleId": "01DK97D2xnik42mi"}, {"assignNamespaces": ["teR5eQAe1rzmmgqB", "PRmd6mO4oI8KDqeb", "m83raNBJ5y7axEkv"], "group": "I4oxZEDxGiBnNbn0", "roleId": "zaf7CaOSlHXrUSA6"}]}}, {"affectedClientIDs": ["sMJzA5mtqISQ83TT", "btefXWznDe4LQdXf", "FBii2RAMEX5RMjBF"], "domain": "VZGYzQqV8d9mDdUI", "namespaces": ["oiIJFNxuNOmUSWw1", "8T1IxVWCxdvPL9e4", "P01vxP8xj1LyEirU"], "roleId": "RERnEMzpImW6sjAH", "ssoCfg": {"googleKey": {"yCK5tNanGBrkzUvc": {}, "k3xTtmOFMebS4Adl": {}, "Nzwog2IhErkNhNcE": {}}, "groupConfigs": [{"assignNamespaces": ["CWwchW6zL9SkbLlr", "NXnGanMazb8jvRWe", "nURH48aJuALEcSqc"], "group": "E15u6D31DjOsrs3C", "roleId": "UYATdqnQGbqiqOkN"}, {"assignNamespaces": ["eATj7eGjodd7CcJU", "rI6MAugK5kypNrp2", "nFe9FmN86sK5LOq4"], "group": "ft5jGcMICPUYnfG6", "roleId": "jl9U4jReteIMgzIS"}, {"assignNamespaces": ["omCsodJrhQW41q2O", "spCZbt3Uta5I0uGc", "L1koyHjCH5olYLET"], "group": "RpABAmO2EGvJ4UMS", "roleId": "93yOxNInDByhnolu"}]}}], "Secret": "O6ti0QP2ssiJ66Oz", "TeamID": "Oj84O6tgohjtC7bz", "TokenAuthenticationType": "jPpucddXJ5zifF8y", "TokenClaimsMapping": {"959anrNSleywHbHi": "g6IKWVZ77KeRWdEC", "aFGzfZ2hxcJ2Fnem": "n7M23SzUo4hNBDh9", "ZFP1OW0nXOErQPS4": "VsRoYIK69yg9ADCG"}, "TokenEndpoint": "iXaLs2xjHkinOD97", "UserInfoEndpoint": "5nARHCmhNHSXuqIH", "UserInfoHTTPMethod": "sxvaUoXDmwWsukxn", "googleAdminConsoleKey": "cuD3QxCXMd00YBWC", "scopes": ["aVVmM45mfIZsWhkS", "476dGGJwJ00UH197", "MJ6zU7JLMQyMWzYQ"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CAaPJgoxGJoJaSzU' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tY4ZD0Xtb0U4pH16' \
    --body '{"ACSURL": "NUsVY21NVIs7NRen", "AWSCognitoRegion": "2Y3Ns0QJQeaWytPf", "AWSCognitoUserPool": "ds1BYx0EaURydf8Z", "AllowedClients": ["yyZeHAWGgJUbUJRM", "bkcTglbU86FyOjAp", "NHBVfNOURcjY3YYT"], "AppId": "9oTynmfIuBWgJTNF", "AuthorizationEndpoint": "fM8M0IW4oe8KDgy0", "ClientId": "xZfAcNg14Ws8TIP1", "EmptyStrFieldList": ["LKiFQoLDvumfqrgS", "fnx2h61X9dN1MGRX", "BJ6mVV7JS9qjNLwv"], "EnableServerLicenseValidation": true, "Environment": "8JdiY3RRiLilmOGF", "FederationMetadataURL": "6dLLIeIVIjMcdlbd", "GenericOauthFlow": true, "IncludePUID": true, "IsActive": false, "Issuer": "STpPq3xjrElvvDgw", "JWKSEndpoint": "0ag7kSWE0Hiqm5Iu", "KeyID": "LryiEXqvUWDjU1G0", "LogoURL": "EVjVZw1ToLuPakQN", "NetflixCertificates": {"encryptedPrivateKey": "1MpOs1RVFrcg2CXx", "encryptedPrivateKeyName": "epx78fvsyhE2BKty", "publicCertificate": "TDSIM7mkmvZ7Cmsh", "publicCertificateName": "4US8o4jfMANPpmZD", "rootCertificate": "dMiCxmuCCVuFjS1G", "rootCertificateName": "C1d2b92B4vEgj3HO"}, "OrganizationId": "mhcWm428XejRF94N", "PlatformName": "IY9nMrBZo0lNUBDS", "RedirectUri": "hHD32vvL28FPwTiX", "RegisteredDomains": [{"affectedClientIDs": ["fLcxDC9Ynd02mECI", "QhfIhHtADUQ9zimQ", "TQT95pFJUAJsyAfe"], "domain": "KOufV4f15NohXu6o", "namespaces": ["pxQGRt6PqlkL0diR", "hLC10ih2EQfY3XCv", "4hdOa6FdZhNMd1on"], "roleId": "FjGRbxtABPXDmgNE", "ssoCfg": {"googleKey": {"JBhgGq5GIDhNC66s": {}, "zbCCf73IFbRkPSSI": {}, "Tz4TjCrJHXGXku2Y": {}}, "groupConfigs": [{"assignNamespaces": ["VuOzhxHmnrrV9ZGW", "rZ05sxe6A6RpmKDe", "bNkylbynkgT9vayL"], "group": "Liizac7Ge6zKJdlt", "roleId": "7rjF5RaJwvkWVco2"}, {"assignNamespaces": ["LTo5ijlvDF8qBWCQ", "9dLWYyS8zdhMeBXH", "8x6HdVfZVDAiU6iJ"], "group": "OF7JKZFNk2NKy59X", "roleId": "8iOg2sVBiCoeC5we"}, {"assignNamespaces": ["XJl7PeiMH8z8dVej", "8N2yv6VTnOK7xAvM", "7tuL81lsR7xxSVp3"], "group": "Gd2TK0HzYviTgYmx", "roleId": "82JVBRLPZ6Iz8tne"}]}}, {"affectedClientIDs": ["5dbguBF6Gsvvdl8j", "Hz9x7XZIjU4IK9lO", "LaZaMphKCqTq3EVh"], "domain": "eJjoEEXBLIxGnNuh", "namespaces": ["oJM3WWPvvCiCf33V", "iEdqQpoGkUWNizk5", "UcPAGv6c1ESC6hZY"], "roleId": "TYZbzf5aANNNs5kg", "ssoCfg": {"googleKey": {"SZZNUHbIT9szApmW": {}, "JO5vzzXZj08a6K1X": {}, "RVfriSpPFnZBJZkD": {}}, "groupConfigs": [{"assignNamespaces": ["nEiyfa2LrnpZxNnL", "RH36bqS2oFY76PU1", "AziBOHEAj1cT3u6Z"], "group": "c2FbrTFznTgDIwZI", "roleId": "RWf6T3by2kYSCdnF"}, {"assignNamespaces": ["KLc0xcTjqjdcEfU6", "1OJYMnW49rWynp1c", "k1vT90C6o86cSRL9"], "group": "cgbUmulhe98oaFKl", "roleId": "QicdrxVhrtwSd9QW"}, {"assignNamespaces": ["VMYz7TU1TsxsChSc", "lSkb5aBi9K9zyv6g", "FZXI5nXJ7hLi6Hwe"], "group": "weRmyo91dIn7QqXB", "roleId": "DXJcrqKmXDwoEV6t"}]}}, {"affectedClientIDs": ["Cdrxw1KOPhuvHuYr", "GWDK41uMOC0mRvSo", "aGk4ktF5wnJDg9Q3"], "domain": "WXiydCOInVolsr6C", "namespaces": ["Hmj763vLwtYEJTSi", "XjcY5ZPkv90lyKST", "WLxSFZ0LpupEi5Db"], "roleId": "kVs3qFTi1t530Wj1", "ssoCfg": {"googleKey": {"WfzIvc3VlSXrA3XU": {}, "Gud4tVjmxEf4XvVh": {}, "FJTxFHITBg9x4unq": {}}, "groupConfigs": [{"assignNamespaces": ["3eOMHIKeTyBG5dCU", "oExnKfV3869IN4V1", "OdhH4GVU7Exlkmc4"], "group": "xYiLjLyZrXr9Bhtz", "roleId": "n8jAdTn6xBhrciry"}, {"assignNamespaces": ["Lm67rkadH5Y41SLj", "CPrFa05Xl5TPC5GO", "DS44bmm7jPdKLddf"], "group": "dsUqjXVzW1QqxnWR", "roleId": "5sheLgsAF4ctv5gu"}, {"assignNamespaces": ["ycGiq9j2EyIknfLD", "pgHnMOn8nc3gUZ8Z", "FyyEr0KBXuJBqK4Q"], "group": "tEydPWLPBYiR3UbJ", "roleId": "c1ZYapx7C477etqg"}]}}], "Secret": "fOJDUT0uKAPrARya", "TeamID": "2IMlNiXpF4qvsUUp", "TokenAuthenticationType": "Hqi33TcBGkc0HjUc", "TokenClaimsMapping": {"nkpU9oVzl2kBuLFX": "IeCEKZUTz3GvCAZ5", "j24acYHbrryHB6GO": "9zP3FaepA3b3YJ9n", "JM6vtT27xv85K5MU": "2qmbeqaVemINdClp"}, "TokenEndpoint": "F7OvlBIEgjse5kd6", "UserInfoEndpoint": "GEDo08yq5E5HleLo", "UserInfoHTTPMethod": "og4me2NBFp62xlXv", "googleAdminConsoleKey": "VcJerTPW02PWsHiK", "scopes": ["YArAxnKBfBfDlrQQ", "uAc10DjjwMv4vrIP", "RtvhQIyLarjaLOKn"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'X51yAB8Pa3uNGKha' \
    --body '{"affectedClientIDs": ["LlJzJMSnJIIgsAVm", "aGYxUX1B9oVuzG2C", "nYX2YBF2g7TVtzYE"], "assignedNamespaces": ["HUodh3iUfBthbepU", "CTWiZ1uqh7GAi4FE", "Iu44u83ZLRxYlYql"], "domain": "pq03BGdIk4oEogFV", "roleId": "GR71rJOBy6lsj1AK", "ssoCfg": {"googleKey": {"GBjnHmaAu4YK87DY": {}, "AWWcbcbGWmKgE8CZ": {}, "4AELr5lraa5v5P5C": {}}, "groupConfigs": [{"assignNamespaces": ["j8hgFsqHC9h5JPiM", "EtgKuiGTYgwWv5Xl", "dL6rOVGcRAn51rVA"], "group": "QSxp4qTB54mKA3V9", "roleId": "DKlCeZ7mLYsHooOI"}, {"assignNamespaces": ["axIpb1cIOJPS3lJ8", "0YJ41U4ooQ980ywm", "g1pWpWit1QC7FKe0"], "group": "fnHUlmU1unGKM0tg", "roleId": "feWy47bbwMI4gGmv"}, {"assignNamespaces": ["K9gW596FwBNrFXt3", "TAuKBwBcD12ae6r3", "hHwya4NpdOzg3hr6"], "group": "ucHf7dbh2iKNUl0q", "roleId": "JqzoKMRMG541PAiN"}]}}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jULsx4SnKNXLMUaD' \
    --body '{"domain": "SwwQlnNRZJHBSB4f", "ssoGroups": ["ZWEFIZs28Ff1kZp1", "Zktx3N7WNMYIfcDK", "bLu8pnK34oA1keYX"]}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JvtggDdXjbdjMBah' \
    --body '{"affectedClientIDs": ["FZZGMTcqnWrIprOv", "0BJ9Sgl7H1sdH2RI", "Jz1eI7Q5pu9PutLf"], "assignedNamespaces": ["6IrvZoBGQbO4S3rU", "RGWUzPAE6SdV4D5j", "ftRl9rZmtQUvro8T"], "domain": "WwXWsz9TVmdMKEoh", "roleId": "KzuMYDUTLBeCidXj", "ssoCfg": {"googleKey": {"uGgx8ncXejmeZtzT": {}, "0qj0ltsqfiZrthVv": {}, "yX0OCKDJE3RMUddw": {}}, "groupConfigs": [{"assignNamespaces": ["SSgxCu8zru1DhGAY", "OHR5BWa9VzIkaQEl", "1iUProNB6hI6IpGc"], "group": "ToWgFvdRhG9NwV3z", "roleId": "DuqVlVTypcYPK8Ix"}, {"assignNamespaces": ["rSZuxWl0Je4fJIyF", "Am3DQht4JwnPS2ur", "JqerobWMZGVL5KLT"], "group": "xahWlS6XdBaKSLCg", "roleId": "OOPXM6XTUh2dJ90y"}, {"assignNamespaces": ["qHDNacl4F9G6Dl5T", "FwBY6HKXAblkT8VG", "gSH8MGZGwiVj7eDT"], "group": "aka9ABfX1IByPEOu", "roleId": "PhGspRi3bhPQvBBJ"}]}}' \
    > test.out 2>&1
eval_tap $? 148 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 149 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'I5JxytpcubN4AUUP' \
    > test.out 2>&1
eval_tap $? 149 'RetrieveSSOLoginPlatformCredential' test.out

#- 150 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FPscZsXeJOD4DMtq' \
    --body '{"acsUrl": "fIGiGJovgWSRxZ8N", "apiKey": "4UQ2fg3V1o2x0hL5", "appId": "DuBDqMyIAzWze94M", "federationMetadataUrl": "EdJFAy2JTllJkRGB", "isActive": false, "redirectUri": "sqVpdiWo8SjDAM0R", "secret": "iw8wLYW3n4F3LD1E", "ssoUrl": "DwBXw5uBYeQZOzAT"}' \
    > test.out 2>&1
eval_tap $? 150 'AddSSOLoginPlatformCredential' test.out

#- 151 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'NSV9E9yyNb7yaLXz' \
    > test.out 2>&1
eval_tap $? 151 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 152 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AVYymOuhCkZu4htr' \
    --body '{"acsUrl": "sf8eIFSovTGXaMsq", "apiKey": "8ePN1oco2jx8Upe8", "appId": "SjMvpqM8puggOEdG", "federationMetadataUrl": "47gD5i2Ni6AnWn3N", "isActive": false, "redirectUri": "ysYPonb59gQffkNO", "secret": "mubxEJr2qEAuJbpZ", "ssoUrl": "Srcbc4LWfKaY5c1t"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSSOPlatformCredential' test.out

#- 153 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'P5TDuI5f6m4KC07C' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["nsZe32hqEcB1ExYM", "Bb3ckvoaJYdMqGeg", "cg3eRvBZXN3cjIXm"]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 154 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FWRJnj8xN7HDPTUE' \
    --platformUserId 'DPN1Kb4UTPWDXTSb' \
    --pidType '55g8LSTs7Nf95lGl' \
    > test.out 2>&1
eval_tap $? 154 'AdminGetUserByPlatformUserIDV3' test.out

#- 155 AdminGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'display_name' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetProfileUpdateStrategyV3' test.out

#- 156 AdminUpdateProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'dob' \
    --body '{"config": {"minimumAllowedInterval": 11}, "type": "4P0KqirJ4PkMFtsn"}' \
    > test.out 2>&1
eval_tap $? 156 'AdminUpdateProfileUpdateStrategyV3' test.out

#- 157 AdminGetRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    > test.out 2>&1
eval_tap $? 157 'AdminGetRoleOverrideConfigV3' test.out

#- 158 AdminUpdateRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    --body '{"additions": [{"actions": [11, 51, 86], "resource": "8Ew0X8fBuBSKLSQ4"}, {"actions": [66, 97, 45], "resource": "PvRLiDi0mNHb6Lx8"}, {"actions": [9, 45, 35], "resource": "XBuT30EYeRj17xGh"}], "exclusions": [{"actions": [1, 44, 57], "resource": "JBwb6CjZUMRf2VJe"}, {"actions": [39, 94, 100], "resource": "v1ic9gvagF2cSuzt"}, {"actions": [37, 20, 73], "resource": "Q3ttz8MTBt1xk9Iy"}], "overrides": [{"actions": [37, 20, 37], "resource": "Suz9vbNStqPtQmQN"}, {"actions": [16, 10, 75], "resource": "dmNZWosrsVBPZ64j"}, {"actions": [100, 70, 95], "resource": "rnulxcCKAru8pOaA"}], "replacements": [{"replacement": {"actions": [97, 71, 76], "resource": "IPoJT83zEGXmVBZL"}, "target": "yrH9J7BoysmaORLk"}, {"replacement": {"actions": [85, 49, 7], "resource": "hc2Fh04JTsqDTynC"}, "target": "ewqJligLlRxOelKy"}, {"replacement": {"actions": [22, 70, 58], "resource": "zxsBFrUs9BYp6TgC"}, "target": "ejBd5o7iTST7R3Kb"}]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminUpdateRoleOverrideConfigV3' test.out

#- 159 AdminGetRoleSourceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleSourceV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'GAME_ADMIN' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetRoleSourceV3' test.out

#- 160 AdminChangeRoleOverrideConfigStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminChangeRoleOverrideConfigStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    --body '{"active": false}' \
    > test.out 2>&1
eval_tap $? 160 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 161 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'GERMNpqWb51y5RUz' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetRoleNamespacePermissionV3' test.out

#- 162 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'vMfTkPy0fGvTGgfL' \
    --after '76' \
    --before '98' \
    --limit '38' \
    > test.out 2>&1
eval_tap $? 162 'GetAdminUsersByRoleIdV3' test.out

#- 163 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '13' \
    --tagName 'K6UKk5ozrXA4HZHN' \
    > test.out 2>&1
eval_tap $? 163 'AdminQueryTagV3' test.out

#- 164 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "yq9odanhR1Zrm3th"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminCreateTagV3' test.out

#- 165 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'UvV87yfkycLSVdle' \
    --body '{"tagName": "SaAylsmLYe2phYOg"}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateTagV3' test.out

#- 166 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'T5kDTyPl3dKF7NXE' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteTagV3' test.out

#- 167 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'jrJMki8jvc3P8Gwj' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserByEmailAddressV3' test.out

#- 168 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["h0lciRhVZ2DeoODX", "MzLSrzoiBnYi5UWs", "3tYlYeMoCimJySoc"]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminBulkUpdateUsersV3' test.out

#- 169 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'RvUWDOrFZKPNoN9A' \
    --body '{"bulkUserId": ["WtLK9TFgi9j2XMh9", "WpifqjNjLOtNQts2", "yxf6MLZJ2jZfZbpT"]}' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetBulkUserBanV3' test.out

#- 170 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"findByPublisherNamespace": true, "userIds": ["ezzriCDWXT59SRu0", "YqUxKDc84OMIzvTS", "cdbKBsAyJMz4ILND"]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminListUserIDByUserIDsV3' test.out

#- 171 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["vhB4Eoes9a6XaJeR", "bzTPwD3jxF7vxRUY", "0ilrNoFT98SgtJd4"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminBulkGetUsersPlatform' test.out

#- 172 AdminCursorGetUserV3
./ng net.accelbyte.sdk.cli.Main iam adminCursorGetUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cursor": {"cursorTime": "Z5f8nfaKqdZFLbZE", "userId": "HxsDxeR6d7r1SQw8"}, "fields": ["0JfMpPrSqYypRUnq", "5o4ETeCUYG9ccTt7", "Wxw8OQ13t3uTw6zQ"], "limit": 41}' \
    > test.out 2>&1
eval_tap $? 172 'AdminCursorGetUserV3' test.out

#- 173 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["0HATGylx2JG2KNGf", "hzfCTxxrsRRLee3T", "cJ7DQIi45aCDHN9m"], "isAdmin": true, "languageTag": "ybqWfG9BJ6FVKlbY", "namespace": "HtbPtaxvagSlpGgV", "roles": ["TF6VeDAPOGBwweyF", "fXEOEAEtbag82KgB", "gyCd5vjkfz3eR4Dt"]}' \
    > test.out 2>&1
eval_tap $? 173 'AdminInviteUserV3' test.out

#- 174 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '31' \
    --platformUserId 'cIoByk9fxtvsgeAx' \
    --platformId 'o57nKAbZpsbJ4Iu5' \
    > test.out 2>&1
eval_tap $? 174 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 175 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 175 'AdminListUsersV3' test.out

#- 176 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'J0ynxGBlacDCdFe8' \
    --endDate 'ATUqVxcSthrpnMUB' \
    --includeTotal  \
    --limit '38' \
    --offset '27' \
    --platformBy 'bjmQeEweoBHTdwAk' \
    --platformId '7ZQnbqY1cQwVEtAr' \
    --query '5kKKAo9MM2Cqm84j' \
    --roleIds 'Vi9kIpqgrzpUkNOB' \
    --selectedFields 'WydXV0Fi02aFr8CD' \
    --skipLoginQueue  \
    --startDate 'apjwNOl4k8rVNrm8' \
    --tagIds 'drv8QD2JOe2Ntz7E' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 176 'AdminSearchUserV3' test.out

#- 177 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["FvowPgIGuetxFMqX", "CQMAqQ2ZRGzNtrTh", "Fa9XU8mosluiHZJ7"]}' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetBulkUserByEmailAddressV3' test.out

#- 178 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'O8sAQ32wj9uaDzsr' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetUserByUserIdV3' test.out

#- 179 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9xYiWRuuzQJiLc1e' \
    --body '{"avatarUrl": "I9w3JEhxPGbEk7s7", "country": "gw07FlounC3vJKBC", "dateOfBirth": "7SwgoViPeIB4Ehy0", "displayName": "Y5aSJVDginxAM77e", "languageTag": "Y9C14FbfiI2NPvl1", "skipLoginQueue": false, "tags": ["sB0HsJ06DzfbzRYt", "4OVUyumBeIqdQGZC", "5kM03HHijsQRj7N8"], "uniqueDisplayName": "IAjmsonjj0ZR50BQ", "userName": "1U6aFD3O2kXQSc58"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserV3' test.out

#- 180 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zgZVl4gIF7v3qbZu' \
    --activeOnly  \
    --after '9M3OxqVAT4H1lRZ9' \
    --before 'Z1JBrHRzEOtIxzPq' \
    --limit '2' \
    > test.out 2>&1
eval_tap $? 180 'AdminGetUserBanV3' test.out

#- 181 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jD7jmQJeFPghqamS' \
    --body '{"ban": "c5y0X48eT7Mluexk", "comment": "87b9Z5BTsEA3EdmW", "endDate": "8saabP4xRowfNojz", "reason": "PXI2v0prR3OEey0M", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 181 'AdminBanUserV3' test.out

#- 182 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'S6u9FHuv1M3qfch4' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserBanSummaryV3' test.out

#- 183 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'SqIV6LQPHlaeYl4c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sFq65cU66yJaj4ov' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateUserBanV3' test.out

#- 184 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KWE4EW0sw8v5peiu' \
    --body '{"context": "xoBJATauyD3XCXVM", "emailAddress": "iyEvMf9yilUEujk6", "languageTag": "oqYo1HQYTFzwdOMd", "upgradeToken": "upwD4O3uNbcIDcIy"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminSendVerificationCodeV3' test.out

#- 185 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vZbOy1T4hfwkuVyk' \
    --body '{"Code": "H4RpfmjIXFGZ5PKd", "ContactType": "babJIkNnt9P1Tkm0", "LanguageTag": "8luh4dpPRMDbUXBW", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 185 'AdminVerifyAccountV3' test.out

#- 186 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'bpAogG2wlZkLhuU5' \
    > test.out 2>&1
eval_tap $? 186 'GetUserVerificationCode' test.out

#- 187 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FI8NijFI0GKwJ3vf' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserDeletionStatusV3' test.out

#- 188 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XlsAMy2Zp2UAGxHn' \
    --body '{"deletionDate": 26, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserDeletionStatusV3' test.out

#- 189 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SxvkG9UR5q9neoW6' \
    > test.out 2>&1
eval_tap $? 189 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 190 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JBcGp9Rx2RfcRhXp' \
    --body '{"code": "meeHdvphas9S7ivH", "country": "EoLbUMM47f1UreUp", "dateOfBirth": "xEkXIbE1ETzRJZKM", "displayName": "avu4Ul2IaieEbPSE", "emailAddress": "7TGkeHsYsW9oGBN1", "password": "pYMBwbPZTlMlUvFE", "uniqueDisplayName": "iGprcNSQ9kEeXBZ6", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpgradeHeadlessAccountV3' test.out

#- 191 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '18oIrUKXttgAI2Qd' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserInformationV3' test.out

#- 192 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WJFLmoPEgd8EMspO' \
    --after '0.297352503946824' \
    --before '0.971303183882849' \
    --limit '28' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserLoginHistoriesV3' test.out

#- 193 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vVevhISjbtBJUK5f' \
    --body '{"languageTag": "E3OufPSX3PdOU2V9", "mfaToken": "yw94oa8UJ34TIedV", "newPassword": "3HyoX4VnO2LpBU08", "oldPassword": "wfnlHBXFIqFUmgUS"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminResetPasswordV3' test.out

#- 194 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MM5au8GJT0mkVPI6' \
    --body '{"Permissions": [{"Action": 52, "Resource": "5BidsK9dCEzhVnOv", "SchedAction": 95, "SchedCron": "PQbVIaKiHfoeorY7", "SchedRange": ["A1otGFyv2SMjbEr5", "0qGdCZIc6EFqBKxb", "S7Q2OgRucL1jwRXz"]}, {"Action": 10, "Resource": "6eNERUf8kjci1Ctc", "SchedAction": 4, "SchedCron": "c6SKLc2mEC3IXl5X", "SchedRange": ["CbkOfHaGr5kdazly", "pvt6lSLfU7HByGXP", "Mqxj4hBgVY3YAxZL"]}, {"Action": 75, "Resource": "kUbcG7PcR4eiU3Id", "SchedAction": 17, "SchedCron": "caRMEb15LBlTVufc", "SchedRange": ["5ZyODR2NVyn4PRqf", "3eRbZqBAoKGcVCdM", "iSNV4qBrt1kcLmRv"]}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminUpdateUserPermissionV3' test.out

#- 195 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6EJtl5xWnsb8oWq9' \
    --body '{"Permissions": [{"Action": 66, "Resource": "RImNWVIJnhhwFDV1", "SchedAction": 98, "SchedCron": "FvGcV8DY0XOkDstx", "SchedRange": ["ZcY1HgAnZV4IOglV", "Lqb9lGAJUg21Lt7J", "wgwMUSuC3Bajy3Bc"]}, {"Action": 63, "Resource": "4VBCV9qJhWva2FPB", "SchedAction": 41, "SchedCron": "6Cp85HVDsZBQgOnX", "SchedRange": ["uXsGThYZrmm0wrFM", "nPpWgrQD4hEk0OLj", "YsnignE7KcMF7fuD"]}, {"Action": 2, "Resource": "2qsFiQHglUQMZi5W", "SchedAction": 20, "SchedCron": "JY9aL9ie6vvMbiNU", "SchedRange": ["Rrlm88QlKyuoya4J", "gakZyUV7t73VnSFb", "uxd4KYZ0jk0UZdht"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserPermissionsV3' test.out

#- 196 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nKu9oTc8pVkiyGsj' \
    --body '[{"Action": 37, "Resource": "JdXzRxfNEjUMTs8W"}, {"Action": 70, "Resource": "2AB2WIRUQmauIY5H"}, {"Action": 59, "Resource": "bKVoWtoUW1P7ocuB"}]' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserPermissionBulkV3' test.out

#- 197 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '55' \
    --namespace "$AB_NAMESPACE" \
    --resource 'LhVYszm8xY33OQbu' \
    --userId 'mu2QHLyZNuysyM4O' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserPermissionV3' test.out

#- 198 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fCzdQCXMAWnf87YP' \
    --after 'NOe9Eevf1fhMg1E2' \
    --before 'k7QLFrVgtX7y0fPO' \
    --limit '16' \
    --platformId 'rB9SVFctW7YS0OkL' \
    --targetNamespace '78XeEAtALFI3v8yh' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserPlatformAccountsV3' test.out

#- 199 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'a4pd5A7MYcpBD6lK' \
    --status 'Nb8RxvN2u5J7baOe' \
    > test.out 2>&1
eval_tap $? 199 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 200 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'LH19fqBwNbNe1ffY' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetListJusticePlatformAccounts' test.out

#- 201 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'RtIvQaKyevWYtZjK' \
    --userId '6J29v8MpBSpo3AKR' \
    > test.out 2>&1
eval_tap $? 201 'AdminGetUserMapping' test.out

#- 202 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'mnJkzJHAckUyBksY' \
    --userId 'QfDm0RNFwiz70tRV' \
    > test.out 2>&1
eval_tap $? 202 'AdminCreateJusticeUser' test.out

#- 203 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'LMlHi8i9gOVqajUW' \
    --skipConflict  \
    --body '{"platformId": "rgEsWDtaKzn8dZwn", "platformUserId": "nGeZsZVgbPzPFbrO"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminLinkPlatformAccount' test.out

#- 204 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MZMgWkFN7Tpkx6Gc' \
    --platformId 'fyOg6ZUrrp9ubg9m' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetUserLinkHistoriesV3' test.out

#- 205 AdminPlatformUnlinkV3
eval_tap 0 205 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 206 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ndW2JKmQafUs2bxY' \
    --userId 'ztOEyVbKIf1ZbzgU' \
    > test.out 2>&1
eval_tap $? 206 'AdminPlatformUnlinkAllV3' test.out

#- 207 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wd8DHoCQykmXHYmk' \
    --userId 'Rlg7gYs6unPYQ9jN' \
    --ticket 'QN1di1ldhOh6Hvjn' \
    > test.out 2>&1
eval_tap $? 207 'AdminPlatformLinkV3' test.out

#- 208 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 208 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 209 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YuV7NfC4A2ODiZhb' \
    --userId 'fb8QqCyK1XH9D6vl' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 210 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5eFdFfgK46GjCWaP' \
    --userId '8huTmnq3FGQn3Ahu' \
    --platformToken '5wxq6oJq4mChmQHQ' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 211 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hO9IKBXDFQfXFD58' \
    --userId 'sG6uDhFYlrzJBYSe' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 211 'AdminGetUserSinglePlatformAccount' test.out

#- 212 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MuJfQecutjS029Bi' \
    --body '["JWOG1m7MKclr5igj", "NTVItrH2X78hxJga", "Vfw5Vnyq8OzTE89W"]' \
    > test.out 2>&1
eval_tap $? 212 'AdminDeleteUserRolesV3' test.out

#- 213 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DNoMcOmbfJrCJQIj' \
    --body '[{"namespace": "1haAosKglqaCXE9y", "roleId": "tpIO8btO3OwNEGSW"}, {"namespace": "5TaW4to7QCY2NGGv", "roleId": "i9kg3rMIzNmhJTNQ"}, {"namespace": "jKlwjfJ3TJ2xVpge", "roleId": "70WsLfgbZieRvJI5"}]' \
    > test.out 2>&1
eval_tap $? 213 'AdminSaveUserRoleV3' test.out

#- 214 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'sT9DH3DfLCv8q4Th' \
    --userId 'mq09bBgPAYxrBE9j' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddUserRoleV3' test.out

#- 215 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'lnTgtgW33wDwD9RK' \
    --userId 'vQX4yFQFdrRoM6Fo' \
    > test.out 2>&1
eval_tap $? 215 'AdminDeleteUserRoleV3' test.out

#- 216 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qCYw7AlxO6qdFpc7' \
    > test.out 2>&1
eval_tap $? 216 'AdminGetUserStateByUserIdV3' test.out

#- 217 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1sSck3ggZWJlSlCQ' \
    --body '{"enabled": true, "reason": "Dji329PfVrvMEPtp"}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateUserStatusV3' test.out

#- 218 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'sSNcpK1QkB2Sy8Ww' \
    --body '{"emailAddress": "79LVeVskqeUB7RSa", "password": "yqGFguhh3bvadRth"}' \
    > test.out 2>&1
eval_tap $? 218 'AdminTrustlyUpdateUserIdentity' test.out

#- 219 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dbVApebRA09rW8i8' \
    > test.out 2>&1
eval_tap $? 219 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 220 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'krFWJhe03coRFok5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "d3AyGrZO8GuoXNSo"}' \
    > test.out 2>&1
eval_tap $? 220 'AdminUpdateClientSecretV3' test.out

#- 221 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'VEBG7VbBPUWipz9C' \
    > test.out 2>&1
eval_tap $? 221 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 222 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after '05YabFX4FCK5ucTF' \
    --before 'sAFzaO3yJpA3KMxB' \
    --isWildcard  \
    --limit '23' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRolesV3' test.out

#- 223 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "managers": [{"displayName": "DSiefGEdLucrtO2g", "namespace": "CQD057DrDlgC2nzS", "userId": "9SiGUjVAw4v3q6JR"}, {"displayName": "Hcn7KaoCEkRdo6qH", "namespace": "YIZWnXqQ1oHFJ9Q0", "userId": "vqsL9SomqWsGA76y"}, {"displayName": "xi0QzZWfmP2sx0KO", "namespace": "5bEJaPnAFjsodyJQ", "userId": "VVBrShGbIIuqK8C4"}], "members": [{"displayName": "03HgoXCR6XOMXwKd", "namespace": "fqk8T4QHK30EX0Fc", "userId": "lpDl5HsuracO5Mnj"}, {"displayName": "nxD1OXkxShFVQTRe", "namespace": "kLfjmy8zosRCRgVw", "userId": "brQKmb01yA7U7dGM"}, {"displayName": "jupZkZQY8CNyT4k3", "namespace": "DIbfT22G5NpE130Y", "userId": "WSgxpKWtdtdtVW9a"}], "permissions": [{"action": 28, "resource": "o1J5euLAbBgejqc0", "schedAction": 0, "schedCron": "Jg5VByeI3ycMcYYB", "schedRange": ["ixKJXCISQdwec1m8", "BusV9tUh74KVo6Xq", "jz2xUKLNWSmYyVvy"]}, {"action": 8, "resource": "JssShBKsQjXvfQgQ", "schedAction": 61, "schedCron": "a7cfZl4VuY6rsZyo", "schedRange": ["6CBRRnoOikIxXKKI", "R6kPmswm5TCAU1cK", "ApdJDnE73GLmSZns"]}, {"action": 15, "resource": "owBhoUg4LsGP6KLP", "schedAction": 83, "schedCron": "kvUv2XiXaBzsmaxj", "schedRange": ["TZPlLitytGka7Kv5", "TacQKF4OlRGdmXxE", "TLEQrr3KCAV9alq3"]}], "roleName": "hK1G4kKooSNNUZui"}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateRoleV3' test.out

#- 224 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'ynZ64IwncZPk82GF' \
    > test.out 2>&1
eval_tap $? 224 'AdminGetRoleV3' test.out

#- 225 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId '3eTC0vzZUDj9dzGg' \
    > test.out 2>&1
eval_tap $? 225 'AdminDeleteRoleV3' test.out

#- 226 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'GVxo9OHgfHumyfuB' \
    --body '{"deletable": false, "isWildcard": false, "roleName": "secYbcOpR45VDlvS"}' \
    > test.out 2>&1
eval_tap $? 226 'AdminUpdateRoleV3' test.out

#- 227 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'c0Mr7ImwCwGqOf0b' \
    > test.out 2>&1
eval_tap $? 227 'AdminGetRoleAdminStatusV3' test.out

#- 228 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'Ns97KvKyj3MqS7Dc' \
    > test.out 2>&1
eval_tap $? 228 'AdminUpdateAdminRoleStatusV3' test.out

#- 229 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'mtfh50eObbrmgjhW' \
    > test.out 2>&1
eval_tap $? 229 'AdminRemoveRoleAdminV3' test.out

#- 230 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'K0x0ZidAJ1CU1eD1' \
    --after 'La16Bw3JbUnUDh5y' \
    --before 'Gjjv4Mwrv2vancmR' \
    --limit '54' \
    > test.out 2>&1
eval_tap $? 230 'AdminGetRoleManagersV3' test.out

#- 231 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'Z7rb21A2E9pX0BWC' \
    --body '{"managers": [{"displayName": "MqPsRk5htdM5T3fD", "namespace": "SrSHrkoqv2mM6soM", "userId": "aTvQq2a9YdFNtRVS"}, {"displayName": "O0js0hG9xmSnzd7z", "namespace": "gUxAogcnGkXk17QP", "userId": "kJHRhmLKQuQVFSKi"}, {"displayName": "Xl8G2uf6E8EajXLS", "namespace": "AS8MKMaxQ1QyJCpK", "userId": "edhuzI7G9NCKKXu1"}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminAddRoleManagersV3' test.out

#- 232 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'bqI2M5PmXfKnQ7BY' \
    --body '{"managers": [{"displayName": "GjCUDMOrbmoRvWnf", "namespace": "mGFy0eUoOBd90h9E", "userId": "DqSTOfoNewWjwMWD"}, {"displayName": "KEt6JhbJ0fwTDaq6", "namespace": "b5RpMwhWPtndriXU", "userId": "9loOxpmEuwDVc12r"}, {"displayName": "0DVUGgGHkapTCafF", "namespace": "MdvYiCBuzUUwyI6V", "userId": "td4v9k4fv3kMiuQ3"}]}' \
    > test.out 2>&1
eval_tap $? 232 'AdminRemoveRoleManagersV3' test.out

#- 233 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'DhsKLxjt5srPFxBg' \
    --after 'pFtDBmTLH9kP9U53' \
    --before 'z6joBAhAlJGI2YYb' \
    --limit '14' \
    > test.out 2>&1
eval_tap $? 233 'AdminGetRoleMembersV3' test.out

#- 234 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'ajBjgq6eY4PBNHKP' \
    --body '{"members": [{"displayName": "x62tHxDb06ZFy3ug", "namespace": "lSp2UxvF2uLXWilR", "userId": "D7HD6LCgdFxRGj00"}, {"displayName": "RT6LvcnGMJbJIYLs", "namespace": "sMvy9gkfTMRrXVRc", "userId": "AVRDX6gmDfNfPGYY"}, {"displayName": "STunMgt3C8hEguCq", "namespace": "lMHiQN3HWJw9zIWs", "userId": "iP2JQ24meDrwEuTy"}]}' \
    > test.out 2>&1
eval_tap $? 234 'AdminAddRoleMembersV3' test.out

#- 235 AdminRemoveRoleMembersV3
eval_tap 0 235 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 236 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'M2qohglzO8AEl6A9' \
    --body '{"permissions": [{"action": 38, "resource": "VceS9UX48dKPCFUI", "schedAction": 10, "schedCron": "qIjS4i0N9ytb3c8p", "schedRange": ["VZ8GlU8962e6gtn5", "pUARJM1T8QwMNOAz", "XmyHEV4g9P6a280S"]}, {"action": 96, "resource": "RNB5dVCsB7xL4axS", "schedAction": 85, "schedCron": "H47CAT7cBP0918Ja", "schedRange": ["EBQBP766LUnBBR84", "iAO7sBQt6YJ2tWwF", "7RnP1oK3c4RVfjB0"]}, {"action": 53, "resource": "es36r1FgR70eNLHk", "schedAction": 98, "schedCron": "balgizL97ycJV5Yq", "schedRange": ["E2myQzl7X9fHr6Wv", "BxmBvNj3ktaDf9B2", "2HGgxakPt7IYzaZU"]}]}' \
    > test.out 2>&1
eval_tap $? 236 'AdminUpdateRolePermissionsV3' test.out

#- 237 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'TmvsEzLPnnGsnfmB' \
    --body '{"permissions": [{"action": 8, "resource": "IS7b5TSDRIoMg7Dc", "schedAction": 24, "schedCron": "APzfzXDELJFaIaEM", "schedRange": ["W5bhJyL72WDyhBsC", "CbnfihnXKxGxaupn", "TTq9ihZkvFKfSHQh"]}, {"action": 71, "resource": "vifGHawNx6yhniEH", "schedAction": 77, "schedCron": "XKkLwioRaKnWhlh8", "schedRange": ["0BhYe2fJDS6T75Q4", "ulonMFjmYqE1wJhf", "ogWg2Apm0sUy18aW"]}, {"action": 28, "resource": "MSdOOsn2Nd8Jpa19", "schedAction": 66, "schedCron": "ZAIadKDEZywonA2S", "schedRange": ["rEdN2tmGuX6r0gBV", "UUeKKlPKtE6gnYxm", "kmCWbs5qugklBUS6"]}]}' \
    > test.out 2>&1
eval_tap $? 237 'AdminAddRolePermissionsV3' test.out

#- 238 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'uwWrCQt86Jrg8tLA' \
    --body '["JWpcyNkUvqn6eXr6", "FNbKJ05Orya6LSSU", "lugIAknXcSaVYcAY"]' \
    > test.out 2>&1
eval_tap $? 238 'AdminDeleteRolePermissionsV3' test.out

#- 239 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '32' \
    --resource 'X1K9JrK6Or2xx7rL' \
    --roleId 'wrPoWiywnxuDLLuI' \
    > test.out 2>&1
eval_tap $? 239 'AdminDeleteRolePermissionV3' test.out

#- 240 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 240 'AdminGetMyUserV3' test.out

#- 241 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'aSxoloIH1gBCWVFr' \
    --extendExp  \
    --redirectUri 'vls0ZwosKhDlLfTK' \
    --password 'xpVOXvGSrdkqddI3' \
    --requestId 'ezqu6FB0sL2xt6fX' \
    --userName '9j7rhZCAlDlVKBsL' \
    > test.out 2>&1
eval_tap $? 241 'UserAuthenticationV3' test.out

#- 242 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'ZiBRXszE7CL1cQCS' \
    --linkingToken 'oqHvH7g63cOx6yrI' \
    --password 'w37pKOLrF5i3gr3C' \
    --username 'c4M2O7NrTQO7KLdZ' \
    > test.out 2>&1
eval_tap $? 242 'AuthenticationWithPlatformLinkV3' test.out

#- 243 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'DGwqx7T3l1ut2oyo' \
    --linkingToken 'lliYsTJUmpscwLcU' \
    --password 'ml3KuoMKh7tprnac' \
    --username 'A34xmIOjFLgKR4Lj' \
    > test.out 2>&1
eval_tap $? 243 'AuthenticateAndLinkForwardV3' test.out

#- 244 PublicGetSystemConfigV3
./ng net.accelbyte.sdk.cli.Main iam publicGetSystemConfigV3 \
    > test.out 2>&1
eval_tap $? 244 'PublicGetSystemConfigV3' test.out

#- 245 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'EWhOScvtQ92iD02Y' \
    --extendExp  \
    --linkingToken 'MvEUNfoL7JCcMo7G' \
    > test.out 2>&1
eval_tap $? 245 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 246 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'xxXdbYCRexPekTsQ' \
    --state 'xMTfaSot7aohFYy4' \
    --platformId 'VxwHIJ9gzxqAw4vB' \
    > test.out 2>&1
eval_tap $? 246 'RequestOneTimeLinkingCodeV3' test.out

#- 247 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'GQAeh0VTiTP4PSrX' \
    > test.out 2>&1
eval_tap $? 247 'ValidateOneTimeLinkingCodeV3' test.out

#- 248 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'US6jYI9lsQFD43Df' \
    --isTransient  \
    --clientId '5qUZOFzpFd6b5Jc5' \
    --oneTimeLinkCode 'TETHcup8GG0VCMTF' \
    > test.out 2>&1
eval_tap $? 248 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 249 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 249 'GetCountryLocationV3' test.out

#- 250 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 250 'Logout' test.out

#- 251 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'J6svTyo9RHget5hz' \
    --codeChallengeMethod 'plain' \
    --clientId 'S8BRPGV9n769zLJd' \
    > test.out 2>&1
eval_tap $? 251 'RequestTokenExchangeCodeV3' test.out

#- 252 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KMexeJc7NvgTSgKj' \
    --userId 'CxZjKf8NA4cGUaDf' \
    --platformUserId 'y9XnH2r0EKrk5Vln' \
    > test.out 2>&1
eval_tap $? 252 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 253 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KsWCPccAFn5CEPoH' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserV3' test.out

#- 254 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId '6opK5DSO8JyX4IE1' \
    --codeChallenge 'z3rDwZ1HKsOpyq8a' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'bfnAdtkujxHff7n1' \
    --oneTimeLinkCode 'yaNCcjgFhS0URBhl' \
    --redirectUri '0L5FCbOn46W2B2uP' \
    --scope 'QLrt2t6bVpCgKvPX' \
    --state 'SDufmKh783cV54Js' \
    --targetAuthPage 'VBRB0rY0xfWddACy' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'HSmo4KX9TPO3K1k5' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 254 'AuthorizeV3' test.out

#- 255 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'M8btmGsgXNXbpqxh' \
    > test.out 2>&1
eval_tap $? 255 'TokenIntrospectionV3' test.out

#- 256 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 256 'GetJWKSV3' test.out

#- 257 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId '76Af5JSwjw2fE2g6' \
    --factor 'jXV7oai2oDm9FaP0' \
    --mfaToken 'HJ98tE4UyoQg0b0s' \
    > test.out 2>&1
eval_tap $? 257 'SendMFAAuthenticationCode' test.out

#- 258 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'GOkzxVt15LKmkQ7Y' \
    --mfaToken 'BhsOuJ0ypkkt2G4e' \
    > test.out 2>&1
eval_tap $? 258 'Change2faMethod' test.out

#- 259 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'Fh2YNsdoxpLTBM9Q' \
    --factor '8t829Ido1JyveSRi' \
    --mfaToken 'Bq23kyH9jQbHWkcV' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 259 'Verify2faCode' test.out

#- 260 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'k0X28GS54vl7gIKB' \
    --factors 'c7OYTylFRAJKySnC' \
    --rememberDevice  \
    --clientId '0cfPl3Z2zSBbs4PA' \
    --code 'V72u8AxE2IQeoxYV' \
    --factor '4UcYzswAGpXqQxct' \
    --mfaToken 'uVaqPJGAHEZmuQrZ' \
    > test.out 2>&1
eval_tap $? 260 'Verify2faCodeForward' test.out

#- 261 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8GaQ4OZ2nDodm4TN' \
    --userId 's8mAj6IKSYFdJwgZ' \
    > test.out 2>&1
eval_tap $? 261 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 262 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'sRPOzwuDSdGl1A2v' \
    --clientId 'aNeDiSqTfmAVg50k' \
    --redirectUri 'OdJagEmTuaxlxgyw' \
    --requestId 'kbdOsyxX1tfW488o' \
    > test.out 2>&1
eval_tap $? 262 'AuthCodeRequestV3' test.out

#- 263 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'YUT4jyCVJ0V8obTl' \
    --additionalData 'GVThz4bm41oIcV33' \
    --clientId 'yjPxibDjfF7JkjCV' \
    --createHeadless  \
    --deviceId 'pZKMxkFkBtXMU6KR' \
    --macAddress 'Im5xBoIi99ctgFXa' \
    --platformToken 'sxp5h780ktjQw2yX' \
    --serviceLabel '0.4080928062274092' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 263 'PlatformTokenGrantV3' test.out

#- 264 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 264 'GetRevocationListV3' test.out

#- 265 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'aQWaF2PqUfbpMpRl' \
    > test.out 2>&1
eval_tap $? 265 'TokenRevocationV3' test.out

#- 266 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform '6xRyV19cborUHeCp' \
    --simultaneousTicket 'qnZ5NW623WWn2ZJY' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'DcMnyCPn1FylWdaN' \
    > test.out 2>&1
eval_tap $? 266 'SimultaneousLoginV3' test.out

#- 267 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'V1VaZTkbbuWiiA4U' \
    --clientId 'TDgS2SVEo5M80LLb' \
    --clientSecret 'ku9GYH4ijqOVM50t' \
    --code 'CqkZfsSxAbDJ7sHC' \
    --codeVerifier 'Lup8pmEosOXglQww' \
    --extendNamespace 'deLVpmXqRwVjc3W2' \
    --extendExp  \
    --password 'ANmE3VVsQ1fm9EUd' \
    --redirectUri 'iaRjuLsKZoqnpKwh' \
    --refreshToken 'pZVdw5UMa8ymxtEF' \
    --scope 'LwELCY2vIddlxnA1' \
    --username 'VynioJcAPwVHUGcs' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 267 'TokenGrantV3' test.out

#- 268 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'ACMvoY4jWH9dFmOH' \
    > test.out 2>&1
eval_tap $? 268 'VerifyTokenV3' test.out

#- 269 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'W0j9suukPE4JwQON' \
    --code 'Q2vCbMn0Oia336ui' \
    --error 'iMTAductvUfVwLah' \
    --openidAssocHandle 'tRedh1SiZlOpIQ8G' \
    --openidClaimedId 'L7jBF1R5OexAPzCG' \
    --openidIdentity '6ZKQClGc1636nbfM' \
    --openidMode '3J9G40Y62bCo941A' \
    --openidNs 'LznQuHVskfCjUK8G' \
    --openidOpEndpoint 'eX4Q0B2Cj0oOmBmX' \
    --openidResponseNonce 'u1KiTTiz7yrIvQj2' \
    --openidReturnTo 'isN7bRwcr16lW5Yw' \
    --openidSig 'gZpjlMMtPWg8217m' \
    --openidSigned '7qNkQiKp2oac8QTN' \
    --state 'EuBbeuQqm9wM7mgT' \
    > test.out 2>&1
eval_tap $? 269 'PlatformAuthenticationV3' test.out

#- 270 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'tUdPVcQijMBhs0kD' \
    --platformToken 'P6d3nuUZ41mSeS9S' \
    > test.out 2>&1
eval_tap $? 270 'PlatformTokenRefreshV3' test.out

#- 271 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'nGqhJOvykBcDpzD9' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetInputValidations' test.out

#- 272 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'zh6dtPK4fVHLMvrC' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetInputValidationByField' test.out

#- 273 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'sH3RYxH2Up9VthPj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCountryAgeRestrictionV3' test.out

#- 274 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'FrK7Hip0eONFDgUP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 274 'PublicGetConfigValueV3' test.out

#- 275 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 275 'PublicGetCountryListV3' test.out

#- 276 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 276 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 277 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'ShG8wwFKY9AMpcwJ' \
    > test.out 2>&1
eval_tap $? 277 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 278 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 278 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 279 PublicGetUserByPlatformUserIDV3
eval_tap 0 279 'PublicGetUserByPlatformUserIDV3 # SKIP deprecated' test.out

#- 280 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'country' \
    > test.out 2>&1
eval_tap $? 280 'PublicGetProfileUpdateStrategyV3' test.out

#- 281 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'COyphUUAV95708za' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetAsyncStatus' test.out

#- 282 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'P0wpZgQEvFzox9wH' \
    --limit '30' \
    --offset '30' \
    --platformBy 'cX3DRWobEoGr8W97' \
    --platformId 'KBedcr6PM51z7i0w' \
    --query 'Q9egK2t46EG8I2lT' \
    > test.out 2>&1
eval_tap $? 282 'PublicSearchUserV3' test.out

#- 283 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "viKbOgVuN3nhkn6Q", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "j4P2AGeidXRRnIAJ", "policyId": "fKVjOn6rtILNJVv2", "policyVersionId": "DLLUyBt5hDs45siG"}, {"isAccepted": true, "localizedPolicyVersionId": "0Lv9iGa5mkZjnRXV", "policyId": "cg6AByNpBo2JYkwL", "policyVersionId": "dmR97u9MVUii4KpY"}, {"isAccepted": false, "localizedPolicyVersionId": "0Dv6b8WtaMVvLbG0", "policyId": "4KKnh3jvW0Qp3kTy", "policyVersionId": "L4CsLwiWUMcpxn4B"}], "authType": "6XoTNMuqZTHwo1IA", "code": "JQpb6r8ZeaSHwQui", "country": "H3Ozu4G6bXxp0gYZ", "dateOfBirth": "yF9fJBJkSOrF9Dg4", "displayName": "FcDwBGyBiHewZkwE", "emailAddress": "euzBBRSknxyWkZOb", "password": "uvig8sMuss76ezTr", "reachMinimumAge": true, "uniqueDisplayName": "pQrVL3ZZTVxqa9XM"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicCreateUserV3' test.out

#- 284 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field '2gY14iWk12Jffk8d' \
    --query 'wKNPUOHNZxML3yoB' \
    > test.out 2>&1
eval_tap $? 284 'CheckUserAvailability' test.out

#- 285 PublicBulkGetUsers
eval_tap 0 285 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 286 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "M9qxd6PWz7sVnMxg", "languageTag": "e2inL8fBFP1ABaIK"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendRegistrationCode' test.out

#- 287 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "rEt8d3o7cTS9OIIM", "emailAddress": "ErnNTLXHrsOFsbhR"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyRegistrationCode' test.out

#- 288 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "ow4iaYKy0IjsDgbJ", "languageTag": "37DN2lDvdh7okHl1"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicForgotPasswordV3' test.out

#- 289 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "wMht2Izq7TCUJhDs", "password": "DefAS09VyQB1vR1m", "uniqueDisplayName": "x6K17GL1CrO4ZuoG", "username": "ZSxTzm8oMSPIHPtq"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateUserInput' test.out

#- 290 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'zIWIzg8pbjnt1iBV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'GetAdminInvitationV3' test.out

#- 291 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId '8DpbjGts4UZDTfhA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "yZKhqilty9NVlgxU", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "nSpCzyb8FkoxQbrP", "policyId": "ngi87K58pQswqKLu", "policyVersionId": "tINusOsa92F6iwkJ"}, {"isAccepted": true, "localizedPolicyVersionId": "OLarmpWyvib9CDW2", "policyId": "1ANrlpuXD9H1u1Cv", "policyVersionId": "zWPcZwkj1l6bf2F9"}, {"isAccepted": true, "localizedPolicyVersionId": "UinY5diUlqgvY7dP", "policyId": "PyahppgxJhk4EdTZ", "policyVersionId": "000rS92594HLvWFs"}], "authType": "XHtMP0k9L5dREQbC", "code": "qfh0gpABFBER6WNc", "country": "DOsRzBkf9A6HjCnF", "dateOfBirth": "RdSihcvszzQLZBkt", "displayName": "k0siMup01kyaFwwD", "emailAddress": "7wecuQb4GNQHVZMK", "password": "GBnzh4suaGIzttTn", "reachMinimumAge": false, "uniqueDisplayName": "hRfDgl29GWKpItMt"}' \
    > test.out 2>&1
eval_tap $? 291 'CreateUserFromInvitationV3' test.out

#- 292 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "4GszRufkDFLYyNBP", "country": "lMrkse9SGcMuV5ph", "dateOfBirth": "hU315LUC6HSMQ32U", "displayName": "znXNd6ve29lqqtcL", "languageTag": "JW9eTJvKNDFrx6La", "uniqueDisplayName": "byDnqXjXKPIcxh0x", "userName": "7T6RQGnnW4ugGX6m"}' \
    > test.out 2>&1
eval_tap $? 292 'UpdateUserV3' test.out

#- 293 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "KBbgTD9xL07ZzzIs", "country": "3Jke34ZAUuLP897o", "dateOfBirth": "oMLnemwKAvgDXNrF", "displayName": "EE4Jf4hQpsLOcLtZ", "languageTag": "w0efmEVcW7mxbS5U", "uniqueDisplayName": "OoICxQMit8555Niy", "userName": "4NNFpRE5pS85yTIR"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicPartialUpdateUserV3' test.out

#- 294 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "WvLRy58UKWPv3F7S", "emailAddress": "0wCVlYQi9cfMCeNn", "languageTag": "u6OIG1PPLRDEXLXZ", "upgradeToken": "WXvqNCHvNpeMjMzg"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicSendVerificationCodeV3' test.out

#- 295 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "uq6HFIqaqwH9J6JL", "contactType": "b5f3SBMyJUdwEBRr", "languageTag": "HAWUFqTooGGnPEgY", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUserVerificationV3' test.out

#- 296 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "s9X0hFMdzryvhc1Y", "country": "jHmmulSBIElc2CdR", "dateOfBirth": "vBb0aGnMt625bWHb", "displayName": "5sbX6asrjV7XJUOt", "emailAddress": "HlzXNHEPpzlMlx7b", "password": "2H2THLwZGikW7TFA", "uniqueDisplayName": "9gE6SrYKq6lcVOhP", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpgradeHeadlessAccountV3' test.out

#- 297 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "UxdMuvmL0UBfwzaa", "password": "eP3Wd0Wrb8s3GW0C"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicVerifyHeadlessAccountV3' test.out

#- 298 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "Y0vAfbq8xoCurq4l", "mfaToken": "pHXrbVBh60NUA2aK", "newPassword": "QwnXrmi6ya8u4sQP", "oldPassword": "vaf1AcweR7tJW3ML"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicUpdatePasswordV3' test.out

#- 299 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'Mob1hUnIzIpUM8KK' \
    > test.out 2>&1
eval_tap $? 299 'PublicCreateJusticeUser' test.out

#- 300 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1kGFN0NUNGKxdlAU' \
    --redirectUri 'DFQuGPzAuT7M6OBr' \
    --ticket 'NwioKnXPVZaDcXsV' \
    > test.out 2>&1
eval_tap $? 300 'PublicPlatformLinkV3' test.out

#- 301 PublicPlatformUnlinkV3
eval_tap 0 301 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 302 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1TnsZioDiBgprzah' \
    > test.out 2>&1
eval_tap $? 302 'PublicPlatformUnlinkAllV3' test.out

#- 303 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PB0FKMa0YeyNBQWU' \
    --ticket 'HDBnBeePkqg6Zt1L' \
    > test.out 2>&1
eval_tap $? 303 'PublicForcePlatformLinkV3' test.out

#- 304 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'r5BlO8K6LH4dSaa8' \
    --clientId 'XYHug51ZTogG0N7H' \
    --redirectUri 'vnuq1kJ1kpHcQtnI' \
    > test.out 2>&1
eval_tap $? 304 'PublicWebLinkPlatform' test.out

#- 305 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'c9z70LFQMI0oZuEj' \
    --code 'Y0rNBbbB9txAvtRQ' \
    --state 'vqJacXR2Rf4noXDF' \
    > test.out 2>&1
eval_tap $? 305 'PublicWebLinkPlatformEstablish' test.out

#- 306 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'aEUkPUBnB0ZEJH3e' \
    --code 'bM71Tg922xiBgHSk' \
    --state 'a0Pz7I1WkIa0oZ1n' \
    > test.out 2>&1
eval_tap $? 306 'PublicProcessWebLinkPlatformV3' test.out

#- 307 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "XpW1l70pcZgIn4lP", "userIds": ["ghHyMEHBzArbyW10", "NkJFQxuMHnfOlX6H", "YVEiaereFCPJU2wE"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUsersPlatformInfosV3' test.out

#- 308 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "zUYUTmZ8JSMeNmRo", "code": "cp400RZe8Bzx9aGE", "emailAddress": "I22BTCZs97TJI8GP", "languageTag": "rM24F3celFgM62HQ", "newPassword": "tgzQhO3nR8j8DlP6"}' \
    > test.out 2>&1
eval_tap $? 308 'ResetPasswordV3' test.out

#- 309 PublicGetUserByUserIdV3
eval_tap 0 309 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 310 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OGbn8vmfMYGLt1Aj' \
    --activeOnly  \
    --after 'Khh3JMX7xSrz1EH6' \
    --before 'X2SM3xzsNrJzWBcd' \
    --limit '64' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserBanHistoryV3' test.out

#- 311 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TzKjsCqxx24QM35b' \
    > test.out 2>&1
eval_tap $? 311 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 312 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SkFrvGciNHb7OY5Y' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserInformationV3' test.out

#- 313 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IpOLJW52uz3c8pz6' \
    --after '0.89665391937201' \
    --before '0.6138724874211017' \
    --limit '54' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserLoginHistoriesV3' test.out

#- 314 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'g4xXT5Ts4e0uR47O' \
    --after 'zUGHeBKtpvyRNgjZ' \
    --before 'kdDppvEJiUiDGXgh' \
    --limit '56' \
    --platformId '3yoMxzRR6xd9rTh3' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetUserPlatformAccountsV3' test.out

#- 315 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ureaIbxM3Wev9pZQ' \
    > test.out 2>&1
eval_tap $? 315 'PublicListJusticePlatformAccountsV3' test.out

#- 316 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'jWAN0tny16ZHZtuS' \
    --body '{"platformId": "JGQCrM7JEMRPkdTc", "platformUserId": "AzkIlndN5xeayr3v"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicLinkPlatformAccount' test.out

#- 317 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'UKMuIiz2MiAAKcvA' \
    --body '{"chosenNamespaces": ["XnxnH0QIhoJRY807", "VmBT4wZXQZZrSsuY", "iIPei0pXglJYnKko"], "requestId": "CAZuolAWnxkImVbD"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicForceLinkPlatformWithProgression' test.out

#- 318 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'P0QX31gI7VmnGIRM' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPublisherUserV3' test.out

#- 319 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vXe6BiphIFe2bzr6' \
    --password 'qQw6fSESkM19OPMB' \
    > test.out 2>&1
eval_tap $? 319 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 320 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'b12gpmShlmIt2nfh' \
    --before 'UaZGqjslu59GT2E6' \
    --isWildcard  \
    --limit '53' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetRolesV3' test.out

#- 321 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'eigiA3wBrmBYIlZe' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetRoleV3' test.out

#- 322 PublicForgotPasswordWithoutNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordWithoutNamespaceV3 \
    --body '{"clientId": "heP72AB8EO3Yrlyr", "emailAddress": "WowUpUDVLlTtuJJs", "languageTag": "HZVsG6izJZruOJvS"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicForgotPasswordWithoutNamespaceV3' test.out

#- 323 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 323 'PublicGetMyUserV3' test.out

#- 324 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "RFLDSdj8elbtHvDU", "emailAddress": "91DmHzwiqVPCJ5j1", "languageTag": "8Ou3aY8nceFU5GKm", "upgradeToken": "cEKp8AQwqgJs6O0Q"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicSendCodeForwardV3' test.out

#- 325 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'j0ccMkdz6zPz3BVH' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 326 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["Aqp4O9XSjap24esy", "jh6Wc3migf2n6iQy", "r5cb5YL6fwBiaVPm"], "oneTimeLinkCode": "mn0T5uzlmi2NY26x"}' \
    > test.out 2>&1
eval_tap $? 326 'LinkHeadlessAccountToMyAccountV3' test.out

#- 327 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'rkPPdg3pXjmtpNfC' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 328 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 329 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "rIj9ntYo3dupUHNu"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicSendVerificationLinkV3' test.out

#- 330 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 330 'PublicGetOpenidUserInfoV3' test.out

#- 331 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code '8abrVVOKxr9Pa315' \
    > test.out 2>&1
eval_tap $? 331 'PublicVerifyUserByLinkV3' test.out

#- 332 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'FKDjG2ApSV94Jy6y' \
    --code 'CSXBqJqjAbVwSaoj' \
    --error '1ugjr8mPkr3tZ506' \
    --state 'ERSVy5M3rrkxu0U9' \
    > test.out 2>&1
eval_tap $? 332 'PlatformAuthenticateSAMLV3Handler' test.out

#- 333 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'h9gCNVZxHGxhZqNX' \
    --payload 'J6JXSh0Z3SWISs1d' \
    > test.out 2>&1
eval_tap $? 333 'LoginSSOClient' test.out

#- 334 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'YrJKmx1BT6iLFQej' \
    > test.out 2>&1
eval_tap $? 334 'LogoutSSOClient' test.out

#- 335 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'NZJNF2hm0TqBQprH' \
    --code 'n3whPKU5abnqw8fF' \
    > test.out 2>&1
eval_tap $? 335 'RequestTargetTokenResponseV3' test.out

#- 336 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'a30pVbhr1BHh1arZ' \
    --upgradeSuccessToken 'AyuLcZoEkPpqKhP2' \
    > test.out 2>&1
eval_tap $? 336 'UpgradeAndAuthenticateForwardV3' test.out

#- 337 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '19' \
    --namespace "$AB_NAMESPACE" \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 337 'AdminListInvitationHistoriesV4' test.out

#- 338 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WnRTglw0gdWoE4es' \
    > test.out 2>&1
eval_tap $? 338 'AdminGetDevicesByUserV4' test.out

#- 339 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'uiDrquccz4J6fFQe' \
    --endDate 'zJ5E3iYHIknvPcJk' \
    --limit '19' \
    --offset '18' \
    --startDate 'RevVYfiExpAgoK9Y' \
    > test.out 2>&1
eval_tap $? 339 'AdminGetBannedDevicesV4' test.out

#- 340 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dq1x3dkbJFDEBEOO' \
    > test.out 2>&1
eval_tap $? 340 'AdminGetUserDeviceBansV4' test.out

#- 341 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "vJ5BKeipIldsgB4h", "deviceId": "Oxb88WgKSLIpneDQ", "deviceType": "CfwucHRL3o2NstrL", "enabled": false, "endDate": "TsJeRcE7GuwKn63K", "ext": {"IDTkUCqbbHGJGOTv": {}, "KKRTHDntaFiufH2Y": {}, "R6QU7fj6w17arNs1": {}}, "reason": "2hOoLVM7UFnuJDze"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminBanDeviceV4' test.out

#- 342 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'EkDxaVogxHrOon2O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetDeviceBanV4' test.out

#- 343 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'W4Zw5QwVKWNy2tnF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 343 'AdminUpdateDeviceBanV4' test.out

#- 344 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'MifJR4hr4gdJDujY' \
    --startDate 'nVnFK6gB6ZxC6yYU' \
    --deviceType 'VUJYnQ3jOGmROIqx' \
    > test.out 2>&1
eval_tap $? 344 'AdminGenerateReportV4' test.out

#- 345 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'AdminGetDeviceTypesV4' test.out

#- 346 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'qQ0gcNeTflyvUh3w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'AdminGetDeviceBansV4' test.out

#- 347 AdminDecryptDeviceV4
eval_tap 0 347 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 348 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId '5ZtfwmOCKpFSMF0t' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'AdminUnbanDeviceV4' test.out

#- 349 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'fGIZCTNiIRc9fEjk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 349 'AdminGetUsersByDeviceV4' test.out

#- 350 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 350 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 351 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 352 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 27, "userInfo": {"country": "EpAJMCxMp2J0hDg2"}}' \
    > test.out 2>&1
eval_tap $? 352 'AdminCreateTestUsersV4' test.out

#- 353 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "cBKtU956hOg8oukD", "policyId": "VdweG0sFHxTHa2k6", "policyVersionId": "0SzCqUgq1gLbcIMe"}, {"isAccepted": true, "localizedPolicyVersionId": "CeqGv7meuQhJuq1C", "policyId": "6JHkWMSUbqByWN2B", "policyVersionId": "CnRz9w2nur0B9jKa"}, {"isAccepted": true, "localizedPolicyVersionId": "A5WnzVZdj8tsyzC4", "policyId": "QaLXp3o4TDraEEaD", "policyVersionId": "NJbVd20FVHevCjth"}], "authType": "EMAILPASSWD", "code": "b7jKuMrFaoLulzp3", "country": "sZxImVK5yh2LcM8L", "dateOfBirth": "aMW0ByjsRUrAHNRk", "displayName": "IcC4wNFzsbrtYvLh", "emailAddress": "56AWXoMiowdWSs9D", "password": "Q0VU1HED9CGo9aUX", "passwordMD5Sum": "j3rh0UyqxVWlIMY5", "reachMinimumAge": true, "uniqueDisplayName": "7MXxCvyy7caxz4MQ", "username": "rODLNlxiEjQBCZx9"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminCreateUserV4' test.out

#- 354 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["fWo2MwulLg4bsO4Y", "HEYLjTSNDf3zazm6", "p5Y1tkG9WwU4Ty6C"]}' \
    > test.out 2>&1
eval_tap $? 354 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 355 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["h5QYyFjuBquE7xss", "m4hxczskbSUbOZ9W", "Nl3apJmNAbl1g5Zm"]}' \
    > test.out 2>&1
eval_tap $? 355 'AdminBulkCheckValidUserIDV4' test.out

#- 356 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TTGYRbP4QVey9pEz' \
    --body '{"avatarUrl": "1TV5cUtPBsw01i5M", "country": "f7WvbNSeeDNfUESL", "dateOfBirth": "lwHv3JgteOLyKp8a", "displayName": "1VqxXnRhDd9TGkO6", "languageTag": "aIYqftw1SrM2nhSE", "skipLoginQueue": false, "tags": ["drbYrrFQP6rW62Ct", "etBW3pvAJJieHhve", "Gg97PY0txzvYwv7a"], "uniqueDisplayName": "tn9EQv2Oj8TFNeGt", "userName": "JGjKbMgCeuAYuzrm"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminUpdateUserV4' test.out

#- 357 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bWofEaKStqdKu4RO' \
    --body '{"code": "nONpJ849chqeiUGQ", "emailAddress": "MwNwDlYSli3p8YaA"}' \
    > test.out 2>&1
eval_tap $? 357 'AdminUpdateUserEmailAddressV4' test.out

#- 358 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'del3hHMSLAiscGRW' \
    --body '{"factor": "zkCl1ZKuPxjDUGRG", "mfaToken": "cCEPjbUy7F82Adu9"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminDisableUserMFAV4' test.out

#- 359 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BYRHrVTehrqgvEtE' \
    > test.out 2>&1
eval_tap $? 359 'AdminGetUserMFAStatusV4' test.out

#- 360 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 's2LpE0qfbvdU8hlD' \
    > test.out 2>&1
eval_tap $? 360 'AdminListUserRolesV4' test.out

#- 361 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oC9FnxqBlPBYJ7X6' \
    --body '{"assignedNamespaces": ["uVy7FWTSfMi2CPVG", "xjcdpdCqVeePMSqb", "8y8qJTUQY40Zrpn0"], "roleId": "vAD9YsPeDWrAVQZS"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateUserRoleV4' test.out

#- 362 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vgWuCuLsUGrVQAbh' \
    --body '{"assignedNamespaces": ["S54ZuQHKersDmJLU", "HAKtfXCKOna8Ddjt", "Zhh6ofsUoRh6r0e0"], "roleId": "J6vyqPw7YlmV3kES"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminAddUserRoleV4' test.out

#- 363 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '0Hi88UYgSV40OvY7' \
    --body '{"assignedNamespaces": ["apPCrN5bEhmuHgKe", "WizEpw1zN0mOYgGh", "HMz9dddLWJWDuSYt"], "roleId": "CaIv4Lp91wYUJPbv"}' \
    > test.out 2>&1
eval_tap $? 363 'AdminRemoveUserRoleV4' test.out

#- 364 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '53' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 364 'AdminGetRolesV4' test.out

#- 365 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "MDAaUXSuBQdvdhJo"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminCreateRoleV4' test.out

#- 366 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'T0WK5ngNUxDKfZYo' \
    > test.out 2>&1
eval_tap $? 366 'AdminGetRoleV4' test.out

#- 367 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'fPGUbSaA00nKxQjY' \
    > test.out 2>&1
eval_tap $? 367 'AdminDeleteRoleV4' test.out

#- 368 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'U6KlavIiLxU2I1Gy' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "roleName": "8Hxu8Ju4XSAnlXRY"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminUpdateRoleV4' test.out

#- 369 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'B9BgSZBvkehRn83B' \
    --body '{"permissions": [{"action": 28, "resource": "KQn77hiP1lzkzjYD", "schedAction": 47, "schedCron": "dv7BiEUqnzxs2deM", "schedRange": ["F8UAJIHEZv5zyUUy", "NJkvA5xF3zHtZSd3", "QzXhkrN4pWryt4XT"]}, {"action": 80, "resource": "ImgDf3GaJsdCZND0", "schedAction": 46, "schedCron": "zElrLZOBLHCKmLBa", "schedRange": ["IwlokbAFW8RgBUwB", "L28BqM8UzvKqeoTi", "NKGRUMrimGAz6Ohm"]}, {"action": 70, "resource": "SpLhMF2Pav11FuU8", "schedAction": 17, "schedCron": "uaO9TiTPnIh2iaIB", "schedRange": ["pYC4txul6VKYlNYY", "lHPwKDpJmkeoAkp3", "Z4pgyJYwclb4gd4Q"]}]}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateRolePermissionsV4' test.out

#- 370 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'gQut2hiPuDdOPHcN' \
    --body '{"permissions": [{"action": 23, "resource": "drwqytieXpIZfr5X", "schedAction": 61, "schedCron": "ktmiKd9vLPP0w52J", "schedRange": ["RAZxMWdoleYNHXeO", "paRDwYLge851PbK2", "MFKvw5TWjAh4gy41"]}, {"action": 76, "resource": "EZDRNkk4DJUofJXK", "schedAction": 49, "schedCron": "RGS0zCYRVmbfzwUm", "schedRange": ["sy0stUmKdXiiTObN", "dqkWa13g3pgHx6uP", "f6jQZcYerH933X7i"]}, {"action": 31, "resource": "EEM2KOusNEHcI95G", "schedAction": 66, "schedCron": "pT3MLwJZquMQSPp5", "schedRange": ["XD4S1ilfgff7Et4u", "Y8nlBwGNHgfgwZwV", "MvshGmsg6ZJYnkHD"]}]}' \
    > test.out 2>&1
eval_tap $? 370 'AdminAddRolePermissionsV4' test.out

#- 371 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'nHTlRugM7a2UZgee' \
    --body '["sipbP027okM5E8tA", "ajVSvLRj306RDuaS", "ixXEdloYZBkatNLc"]' \
    > test.out 2>&1
eval_tap $? 371 'AdminDeleteRolePermissionsV4' test.out

#- 372 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId '42eq0O6VsXtOlQwj' \
    --after '5xPvm7c5nPR0Y1sf' \
    --before 'fUaZ64dFpiv8o9Gw' \
    --limit '37' \
    > test.out 2>&1
eval_tap $? 372 'AdminListAssignedUsersV4' test.out

#- 373 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'QtKgyIeySoUxoMrj' \
    --body '{"assignedNamespaces": ["2J4JGQZAtyjTxnlm", "SyjEaFH2DRN6HIEq", "IFEcS0ynIMOYWpUY"], "namespace": "UQMooiKT57rmbjEn", "userId": "imeR7EFBz43E9FkO"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminAssignUserToRoleV4' test.out

#- 374 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'PVu2fDtOjW1iSYQb' \
    --body '{"namespace": "cebBd5wb5H3qppoC", "userId": "iHMD4iBK2O7qYtOH"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminRevokeUserFromRoleV4' test.out

#- 375 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["V5hnpjc5CNLnnEvo", "25aEtdjls5oadseJ", "g7y4Q9CU3fjSRaXD"], "emailAddresses": ["4HDmdvhMXxiKR29L", "KIhNU43K8bihdw3p", "rp0UHlWUxkBefhxR"], "isAdmin": true, "isNewStudio": true, "languageTag": "7XLoWCGf0dZEeXBd", "namespace": "6mGG6SHcZbX2wNnT", "roleId": "6A9zosmDnXoncy7N"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminInviteUserNewV4' test.out

#- 376 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "ZQ4PkAPXBCfkE1Fb", "country": "0y94eP7yh0zsKhR6", "dateOfBirth": "0HZwUwk48XK7MXHb", "displayName": "EwAvvpEeHhXiJcJq", "languageTag": "YSxVKUYMimVLzAP6", "skipLoginQueue": false, "tags": ["6u8agb5HPsBU0Eo6", "QJ9vBRJ4UP09fabC", "01Thm9f4AWpyiKVT"], "uniqueDisplayName": "3OvEujx5yjtQSCJa", "userName": "OHzpb623EciYoYOP"}' \
    > test.out 2>&1
eval_tap $? 376 'AdminUpdateMyUserV4' test.out

#- 377 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "Vg6DLEZ6DxpwBm2N", "mfaToken": "8PdQ5mQaGXEbnmWR"}' \
    > test.out 2>&1
eval_tap $? 377 'AdminDisableMyAuthenticatorV4' test.out

#- 378 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '0H3EkrHqaLNdfKsz' \
    > test.out 2>&1
eval_tap $? 378 'AdminEnableMyAuthenticatorV4' test.out

#- 379 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 379 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 380 AdminGetMyBackupCodesV4
eval_tap 0 380 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 381 AdminGenerateMyBackupCodesV4
eval_tap 0 381 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 382 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"factor": "YZzOg113h6fIaHSx", "mfaToken": "5bClxUOBmMwv5pmi"}' \
    > test.out 2>&1
eval_tap $? 382 'AdminDisableMyBackupCodesV4' test.out

#- 383 AdminDownloadMyBackupCodesV4
eval_tap 0 383 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 AdminEnableMyBackupCodesV4
eval_tap 0 384 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'IVnhlLoMemsp7o3F' \
    > test.out 2>&1
eval_tap $? 385 'AdminGetBackupCodesV4' test.out

#- 386 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag '2LQw7Y2VdSxgXez7' \
    > test.out 2>&1
eval_tap $? 386 'AdminGenerateBackupCodesV4' test.out

#- 387 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'VvS0C9JLVQQPa7PP' \
    > test.out 2>&1
eval_tap $? 387 'AdminEnableBackupCodesV4' test.out

#- 388 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'x4Zi6WaC8wk7HMbJ' \
    --factor 'hNwZgf5nlMDORYuX' \
    > test.out 2>&1
eval_tap $? 388 'AdminChallengeMyMFAV4' test.out

#- 389 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'nPNJgayPFcyUnKXA' \
    --languageTag '3mcyMmX6WF8jtNAV' \
    > test.out 2>&1
eval_tap $? 389 'AdminSendMyMFAEmailCodeV4' test.out

#- 390 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "OYqSH533YlJ93CCG", "mfaToken": "BXv4fP4VPzhcH4UJ"}' \
    > test.out 2>&1
eval_tap $? 390 'AdminDisableMyEmailV4' test.out

#- 391 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'rrCKvrOAi7lMgkVW' \
    > test.out 2>&1
eval_tap $? 391 'AdminEnableMyEmailV4' test.out

#- 392 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 392 'AdminGetMyEnabledFactorsV4' test.out

#- 393 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'JYzSCIDxWUxgOzeR' \
    > test.out 2>&1
eval_tap $? 393 'AdminMakeFactorMyDefaultV4' test.out

#- 394 AdminGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyOwnMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 394 'AdminGetMyOwnMFAStatusV4' test.out

#- 395 AdminGetMyMFAStatusV4
eval_tap 0 395 'AdminGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 396 AdminInviteUserV4
eval_tap 0 396 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 397 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'NHIqK5PT404mFw4H' \
    --linkingToken 'Jv5T2kIQOecfLsYK' \
    --password 'TmUnKlrOsJmEwjGY' \
    --username 'N8VNPXNsmwTV8imJ' \
    > test.out 2>&1
eval_tap $? 397 'AuthenticationWithPlatformLinkV4' test.out

#- 398 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'HNI0l6jJVzF1Oi2s' \
    --extendExp  \
    --linkingToken 'QuWUBBHZonSmzF83' \
    > test.out 2>&1
eval_tap $? 398 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 399 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code '1vlCiZAZHCWMXxVh' \
    --factor '8HTrKqVwnpPn8N5x' \
    --mfaToken 'MRgU7cPqNZrLCRRU' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 399 'Verify2faCodeV4' test.out

#- 400 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'ysya4J3rvTzMTMSw' \
    --codeChallenge 'rNov2GW9i54JY23A' \
    --codeChallengeMethod 'S256' \
    --additionalData 'WFTLq0W1JqwKs1mO' \
    --clientId '80L7IOHlf6j8PZOz' \
    --createHeadless  \
    --deviceId 'UiQKZqz5NSp0B7LO' \
    --macAddress 'DN3Boi2sSAO2n4MZ' \
    --platformToken 'Qt753XQB93rOW0gu' \
    --serviceLabel '0.6727120182958097' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 400 'PlatformTokenGrantV4' test.out

#- 401 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'oQbYzc1RDVhs2lhd' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'mA3fgzcwdgJMjIyG' \
    --simultaneousTicket 'fiNBQy41M1gzGCba' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'v8ry8IyqNVv0KVpX' \
    > test.out 2>&1
eval_tap $? 401 'SimultaneousLoginV4' test.out

#- 402 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'JTMx3Y8Um1iqehOb' \
    --codeChallengeMethod 'S256' \
    --additionalData 'l3VSJENQopeHD6iK' \
    --clientId 'BGm5Cj7RqnJUmfDm' \
    --clientSecret 'ofxvN8pRGoUtmbWZ' \
    --code 'bEjPyq35BWDoc3qN' \
    --codeVerifier 'cQFFyHv141NPqjRU' \
    --extendNamespace 'MKSQjFdjqTaZFsWz' \
    --extendExp  \
    --loginQueueTicket 'bqwTZQIN5jC6a8mE' \
    --password 'VCXHmFnrSL0PJcZQ' \
    --redirectUri 'aCeNLYxMID9pqZ5r' \
    --refreshToken 'ryiMMt6fQtLhzyla' \
    --scope 'quioT3QBt29AiRAS' \
    --username 'suFM4ahGw7XcF1Qw' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 402 'TokenGrantV4' test.out

#- 403 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'ibXg7RCe5BtKcwj6' \
    --code 'PqqOgCimr3ZQNBBk' \
    > test.out 2>&1
eval_tap $? 403 'RequestTargetTokenResponseV4' test.out

#- 404 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rXu9czsYr3cFeVw7' \
    --rawPUID  \
    --body '{"pidType": "0xdNTuOdLKK0M2B2", "platformUserIds": ["hbqJin37P69t1Kqe", "Gz7qbPnXEuOzzkoB", "mMR9C4qPqJrAdh1H"]}' \
    > test.out 2>&1
eval_tap $? 404 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 405 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ik7vCEq7FQ2S5VeW' \
    --platformUserId '9ddxzLPV8wDjsnyP' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserByPlatformUserIDV4' test.out

#- 406 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "HJtA3QiX9Zvtydba", "policyId": "Vb0scd97A0GP6djn", "policyVersionId": "2Ps3IVT5hUZ3cnDq"}, {"isAccepted": true, "localizedPolicyVersionId": "ddZG0EpfGAqHKcSx", "policyId": "Uc2YgRpk2IFGIgIp", "policyVersionId": "scUpVAciu2XPPUxz"}, {"isAccepted": false, "localizedPolicyVersionId": "HUvxhvTZcvRKoaM4", "policyId": "ozSAg8FTLrByWOJh", "policyVersionId": "bocoGlPzdfxcC3rp"}], "authType": "EMAILPASSWD", "country": "11cBXLwTfopqeZtH", "dateOfBirth": "JnRgaGfLMFbvyI5P", "displayName": "ZGzVLcmZKKKYARap", "emailAddress": "e2tsNczam4Cdd1QY", "password": "vww4XDokltgq2vXt", "passwordMD5Sum": "UnY6UhDJ4pe0s0Cu", "uniqueDisplayName": "hl3dU9b4seYCyiB4", "username": "tDCWx3cEX8wTi1v2", "verified": false}' \
    > test.out 2>&1
eval_tap $? 406 'PublicCreateTestUserV4' test.out

#- 407 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "TWIfgdNphqe9fS1m", "policyId": "77MAg4KoZQPLhDSJ", "policyVersionId": "x9jzxaRKph4kiIFg"}, {"isAccepted": true, "localizedPolicyVersionId": "fLqlrKGiS3XxjkyN", "policyId": "fj3XgTRTjI9oNBzg", "policyVersionId": "Q4CRwg0sKVeSpMny"}, {"isAccepted": true, "localizedPolicyVersionId": "rvKI5EVB9ZFzLNsj", "policyId": "dCFtKY0KsxR0rCFk", "policyVersionId": "yiQZfMnTbKdwNhiI"}], "authType": "EMAILPASSWD", "code": "dpJ8B8VwFQnVco2o", "country": "Cn1KvJmbjapW9UlE", "dateOfBirth": "qtzDd7SgxdxB5kvt", "displayName": "M8ah9bPsksceGUEX", "emailAddress": "8ERZcKSYLo6y7yJM", "password": "owQ6LpHCvCYTgX9J", "passwordMD5Sum": "QwErzjtuP9pUUv7q", "reachMinimumAge": false, "uniqueDisplayName": "NfQSYLFKSl3FNFFJ", "username": "nt3rIwZdW02Su6aC"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicCreateUserV4' test.out

#- 408 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'nL816aH6gOBUIMeL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "GL3aefSDME8X2MxI", "policyId": "LI42BJMPkZmay4Cs", "policyVersionId": "ye3iJLtjsu6ZJRCo"}, {"isAccepted": true, "localizedPolicyVersionId": "J7zLXioAGkWgSDdD", "policyId": "QvpRfGe3z2rtjWpJ", "policyVersionId": "AlKHF0ebxhJ1176C"}, {"isAccepted": false, "localizedPolicyVersionId": "SGyDCKF0LLhO3lGZ", "policyId": "7eGOPj2XoFug8BUQ", "policyVersionId": "UmPHnPumcazKAna0"}], "authType": "EMAILPASSWD", "code": "ZM28w4mnYvvlt1es", "country": "7A4PFduN4gx0UC6e", "dateOfBirth": "WKCFGS97Si6XyLVP", "displayName": "rkUxyZ1OH5Nn4nMT", "emailAddress": "8QOyTuUSD9ImtaPA", "password": "ocOQcpBWSNrCjSNE", "passwordMD5Sum": "AdojkCMmYyTGO07f", "reachMinimumAge": false, "uniqueDisplayName": "UJizF69PSsquWUaf", "username": "wbFPX15633pFgA7i"}' \
    > test.out 2>&1
eval_tap $? 408 'CreateUserFromInvitationV4' test.out

#- 409 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "9tqvfHmFvUZiUW5Y", "country": "0CYw5OXSGwQkJuy9", "dateOfBirth": "oLFcHHcraLXR2n9J", "displayName": "Qvq7NKWIHYsii3fC", "languageTag": "h7sieJjZPAkiWuml", "uniqueDisplayName": "lU31uXPwYxedGHCI", "userName": "kmt4bfJOhNaIT0pv"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicUpdateUserV4' test.out

#- 410 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "7XeqO8gY3c4SryWB", "emailAddress": "4yRaDxvxwaLM8HkV"}' \
    > test.out 2>&1
eval_tap $? 410 'PublicUpdateUserEmailAddressV4' test.out

#- 411 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "OW8PnLkgqkqYZWPZ", "country": "TgKagTzdcYcko7U3", "dateOfBirth": "gH239LhRx2Laa2Rd", "displayName": "tVb6VgA5yFIH3s9U", "emailAddress": "yeaFi8OE7BCK4FeV", "password": "Grl5NpUG9zblWEiH", "reachMinimumAge": false, "uniqueDisplayName": "9vFd5z9r4nJWUvLp", "username": "1wxGF747468MXUq3", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 411 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 412 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "TMBMzaOrxuKvtUVt", "displayName": "qbDWnJ2i9TRmJOqI", "emailAddress": "l7U12hO5vpk9DOSg", "password": "bsdGVPLD9A5NmuZD", "uniqueDisplayName": "UV3yHurgOfba1Xeo", "username": "HYTNoRol84UlkxtP"}' \
    > test.out 2>&1
eval_tap $? 412 'PublicUpgradeHeadlessAccountV4' test.out

#- 413 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "5Vok9sNK1ORg3tCh", "mfaToken": "sS3fFpaS1uq1mH3o"}' \
    > test.out 2>&1
eval_tap $? 413 'PublicDisableMyAuthenticatorV4' test.out

#- 414 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'YfPK2QiAUhIfi17Y' \
    > test.out 2>&1
eval_tap $? 414 'PublicEnableMyAuthenticatorV4' test.out

#- 415 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 415 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 416 PublicGetMyBackupCodesV4
eval_tap 0 416 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 417 PublicGenerateMyBackupCodesV4
eval_tap 0 417 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 418 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "rkWHNxiaNyqBfgw5", "mfaToken": "8Hx0XYL0fJOPYpnP"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicDisableMyBackupCodesV4' test.out

#- 419 PublicDownloadMyBackupCodesV4
eval_tap 0 419 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 420 PublicEnableMyBackupCodesV4
eval_tap 0 420 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 421 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'qGlPnhBDOWqDU8N3' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetBackupCodesV4' test.out

#- 422 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'DjVUt0n0jfyDbtIX' \
    > test.out 2>&1
eval_tap $? 422 'PublicGenerateBackupCodesV4' test.out

#- 423 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'ICLkK8ZvbnTg3znl' \
    > test.out 2>&1
eval_tap $? 423 'PublicEnableBackupCodesV4' test.out

#- 424 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'g8nmzQx1RsYhcRlv' \
    --factor '16Wwe8YK3lZFslEC' \
    > test.out 2>&1
eval_tap $? 424 'PublicChallengeMyMFAV4' test.out

#- 425 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'I9QzuQcsjFehD6uT' \
    > test.out 2>&1
eval_tap $? 425 'PublicRemoveTrustedDeviceV4' test.out

#- 426 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'DYnqyNgN7GoeMsez' \
    --languageTag 'FZsTBHkgcJ0DcEt2' \
    > test.out 2>&1
eval_tap $? 426 'PublicSendMyMFAEmailCodeV4' test.out

#- 427 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "3pci6xEljer6aGJx", "mfaToken": "5OFp3jKEx4aSGdwT"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicDisableMyEmailV4' test.out

#- 428 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'PX4ig3NVFFkP7O3F' \
    > test.out 2>&1
eval_tap $? 428 'PublicEnableMyEmailV4' test.out

#- 429 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 429 'PublicGetMyEnabledFactorsV4' test.out

#- 430 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor '4vsohRWDyGYIVFDb' \
    > test.out 2>&1
eval_tap $? 430 'PublicMakeFactorMyDefaultV4' test.out

#- 431 PublicGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyOwnMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 431 'PublicGetMyOwnMFAStatusV4' test.out

#- 432 PublicGetMyMFAStatusV4
eval_tap 0 432 'PublicGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 433 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TvRYfpJ4wM9WZfOO' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 434 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "xAzmsbhi5QJuc2SN", "emailAddress": "BaOlXfgsgBd7MYLL", "languageTag": "oPZrkjRm5Ki0orhX", "namespace": "rISEaPZHLQkTHvnd", "namespaceDisplayName": "QsCKAO2JRz3CGwtu"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicInviteUserV4' test.out

#- 435 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "wwAR1xFrnyirw3iJ", "policyId": "t5iA3JS2xeaJ08Jr", "policyVersionId": "SHPqdhKHn6ZjZMdr"}, {"isAccepted": true, "localizedPolicyVersionId": "C2TIQzRJY7UfYSrd", "policyId": "N0JVz4U43EcV1FRy", "policyVersionId": "eeqehMNeRYKeMbL0"}, {"isAccepted": true, "localizedPolicyVersionId": "q9jJTVFoFjxZjh5q", "policyId": "UR1Pq4a4uaMfd0SQ", "policyVersionId": "AfYIyzHL8jxakuVu"}], "code": "5r5B08VZxI4TU3ap", "country": "nZXoJ4gI4EQKO8xC", "dateOfBirth": "4D0FsUo3IB2kX5RE", "displayName": "QZsHyXzoIXNf0KbL", "emailAddress": "9HyJttdgfLGO3umm", "password": "pllnV6B62P1Kazg7", "reachMinimumAge": false, "uniqueDisplayName": "hVjfWyK02w5QytAm", "username": "kanukAzAMaRvIUhU", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 435 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE