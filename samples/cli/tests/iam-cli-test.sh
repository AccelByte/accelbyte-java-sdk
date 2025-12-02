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
    --body '{"ACSURL": "p3IhtCSHy1ei1fIr", "AWSCognitoRegion": "PvfHnRN06EjRwEQl", "AWSCognitoUserPool": "NapJRfk4f9Zcw1pE", "AllowedClients": ["HAyNFxcVTKuAQTGh", "5BxjWOozGoDtsUuY", "o5p8ED5QZAufwNa8"], "AppId": "lzfjv9oYMXMjlVHY", "AuthorizationEndpoint": "1AHwF3vGoav7MK0P", "ClientId": "cLnEkcokKwcQ0baD", "EmptyStrFieldList": ["T9OyJ2h23GUS2amU", "7syGlElXdEAOrVSn", "LocLVVYamQc4wcG5"], "EnableServerLicenseValidation": false, "Environment": "PlRpWjmHZAAvKTH8", "FederationMetadataURL": "MuqIg0CzkguwuJCW", "GenericOauthFlow": true, "IncludePUID": true, "IsActive": true, "Issuer": "EFB67AODbi9BzupB", "JWKSEndpoint": "sFpYc77GtRUcCFeY", "KeyID": "5g4XgBsbfzqxBPNe", "LogoURL": "8ae1Il4aAtEbu4Ij", "NetflixCertificates": {"encryptedPrivateKey": "GdqthRxTjQ7gkZEY", "encryptedPrivateKeyName": "8rG0q0Q2Qd2JzRbk", "publicCertificate": "F2I03dIjvBbA6bfb", "publicCertificateName": "YaJCJjfk2TUvn95F", "rootCertificate": "hO7VW3mbDVMDu87t", "rootCertificateName": "0ldWf7iSGIiKFtWt"}, "OrganizationId": "n4Yr2svKM6pqLGZ0", "PlatformName": "TBujELAUK6mQ5iZg", "PrivateKey": "bwwm5iGzXtcknrgi", "RedirectUri": "dKupvXO6aj4hCmTC", "RegisteredDomains": [{"affectedClientIDs": ["34jxW4pIDwdqXpmR", "mut9H9XyWI8bp8fQ", "xRuX91uYmtrHJbEG"], "domain": "TUj7YjERL1rEQG02", "namespaces": ["zccA8wvLsWUNd6lP", "KvqDejvqklTSvDwu", "OrP9lzpiX0VuFpZu"], "roleId": "m7izxe7NPzjOa8E7", "ssoCfg": {"googleKey": {"wY76PxLv9HBEUe89": {}, "AwEw1HO4FnKtx4XL": {}, "KAmlDr19uJ3nq6Ve": {}}, "groupConfigs": [{"assignNamespaces": ["rzVCcI8y3Cz0YqCK", "Uh5RD9vNAp4jinFp", "nQ5xF9wwbvMZyeDe"], "group": "RnVfPUa6xVVBcq3w", "roleId": "ZpFIYeAg79HcLJXJ"}, {"assignNamespaces": ["7mpVI6eTYAjdPlCi", "QQC35cj4KyOVgvnW", "bfRJtsB7cUQZ2QUA"], "group": "xJrINPXppPNO3Afm", "roleId": "XcgwC3IN6tvKgLB9"}, {"assignNamespaces": ["QmJIOq9dP5szG71u", "tjsQ4CrRb9gUCeVz", "7fWbZIdhevfZvyV7"], "group": "AcodcZwKjYDdmJOl", "roleId": "zwm9Su4FnS98Qqft"}]}}, {"affectedClientIDs": ["Sjq7sn8yreciPLfk", "VyyJsbGpO6JgehDJ", "xEN7JlZc8LMq1o2j"], "domain": "ZWu4yA3r0u4q1bTH", "namespaces": ["XIjfJKyFlM0u1uuo", "Vdn9yVoSlKNchPHN", "L4X3LLaGPGdqLE8S"], "roleId": "ohhhuiTnJarYYkHB", "ssoCfg": {"googleKey": {"DdSzBXdxapwhd5IQ": {}, "YBQuxLvPuWYvE3fs": {}, "Ny9Z9OhxXvCp9y7f": {}}, "groupConfigs": [{"assignNamespaces": ["LD2qfCXnlUnqxT1W", "sRNMZcA92hzC7MNa", "8vVe4MHX6AgMep90"], "group": "AyyUJyAK5PRMRMwd", "roleId": "vl0hv6g62GxBW2tQ"}, {"assignNamespaces": ["F5tkTjgJaMYvNQOs", "Da4bkcgepqtxjbrz", "tee7QLTGAak7Kaol"], "group": "01DK97D2xnik42mi", "roleId": "teR5eQAe1rzmmgqB"}, {"assignNamespaces": ["PRmd6mO4oI8KDqeb", "m83raNBJ5y7axEkv", "I4oxZEDxGiBnNbn0"], "group": "zaf7CaOSlHXrUSA6", "roleId": "sMJzA5mtqISQ83TT"}]}}, {"affectedClientIDs": ["btefXWznDe4LQdXf", "FBii2RAMEX5RMjBF", "VZGYzQqV8d9mDdUI"], "domain": "oiIJFNxuNOmUSWw1", "namespaces": ["8T1IxVWCxdvPL9e4", "P01vxP8xj1LyEirU", "RERnEMzpImW6sjAH"], "roleId": "yCK5tNanGBrkzUvc", "ssoCfg": {"googleKey": {"k3xTtmOFMebS4Adl": {}, "Nzwog2IhErkNhNcE": {}, "CWwchW6zL9SkbLlr": {}}, "groupConfigs": [{"assignNamespaces": ["NXnGanMazb8jvRWe", "nURH48aJuALEcSqc", "E15u6D31DjOsrs3C"], "group": "UYATdqnQGbqiqOkN", "roleId": "eATj7eGjodd7CcJU"}, {"assignNamespaces": ["rI6MAugK5kypNrp2", "nFe9FmN86sK5LOq4", "ft5jGcMICPUYnfG6"], "group": "jl9U4jReteIMgzIS", "roleId": "omCsodJrhQW41q2O"}, {"assignNamespaces": ["spCZbt3Uta5I0uGc", "L1koyHjCH5olYLET", "RpABAmO2EGvJ4UMS"], "group": "93yOxNInDByhnolu", "roleId": "O6ti0QP2ssiJ66Oz"}]}}], "RelyingParty": "Oj84O6tgohjtC7bz", "SandboxId": "jPpucddXJ5zifF8y", "Secret": "959anrNSleywHbHi", "TeamID": "g6IKWVZ77KeRWdEC", "TokenAuthenticationType": "aFGzfZ2hxcJ2Fnem", "TokenClaimsMapping": {"n7M23SzUo4hNBDh9": "ZFP1OW0nXOErQPS4", "VsRoYIK69yg9ADCG": "iXaLs2xjHkinOD97", "5nARHCmhNHSXuqIH": "sxvaUoXDmwWsukxn"}, "TokenEndpoint": "cuD3QxCXMd00YBWC", "UserInfoEndpoint": "aVVmM45mfIZsWhkS", "UserInfoHTTPMethod": "476dGGJwJ00UH197", "googleAdminConsoleKey": "MJ6zU7JLMQyMWzYQ", "scopes": ["CAaPJgoxGJoJaSzU", "tY4ZD0Xtb0U4pH16", "NUsVY21NVIs7NRen"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2Y3Ns0QJQeaWytPf' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ds1BYx0EaURydf8Z' \
    --body '{"ACSURL": "yyZeHAWGgJUbUJRM", "AWSCognitoRegion": "bkcTglbU86FyOjAp", "AWSCognitoUserPool": "NHBVfNOURcjY3YYT", "AllowedClients": ["9oTynmfIuBWgJTNF", "fM8M0IW4oe8KDgy0", "xZfAcNg14Ws8TIP1"], "AppId": "LKiFQoLDvumfqrgS", "AuthorizationEndpoint": "fnx2h61X9dN1MGRX", "ClientId": "BJ6mVV7JS9qjNLwv", "EmptyStrFieldList": ["I8JdiY3RRiLilmOG", "F6dLLIeIVIjMcdlb", "dRXTGIrdNL5gJPqT"], "EnableServerLicenseValidation": true, "Environment": "ElvvDgw0ag7kSWE0", "FederationMetadataURL": "Hiqm5IuLryiEXqvU", "GenericOauthFlow": true, "IncludePUID": false, "IsActive": false, "Issuer": "4XCFkD1AJLCwszbZ", "JWKSEndpoint": "xuHSgDOK8bjoF7bL", "KeyID": "2635KbtZTGJpqgl2", "LogoURL": "IzNXGTuQPIDpor7t", "NetflixCertificates": {"encryptedPrivateKey": "1aJLNNz6QIVC9Mfu", "encryptedPrivateKeyName": "c8VOsnmnlVljdWYm", "publicCertificate": "ELe74p38vumnxAnY", "publicCertificateName": "BTxaTIz0jcgDI8Pk", "rootCertificate": "z96vd80msqIm5buf", "rootCertificateName": "nBqrpLeqhwVhjnnj"}, "OrganizationId": "KMEmtbiWsAQHbMrK", "PlatformName": "Yi0Zxs5SWCqZXHLL", "PrivateKey": "a31oQf7BULnZDhut", "RedirectUri": "DM6BqguqD5xxGxBW", "RegisteredDomains": [{"affectedClientIDs": ["tnTKUe2znsqPzPkw", "CBo2SwCUsTag4MLA", "o3m61P2xaNfmn8On"], "domain": "b1a9gMz0F2UBRmMh", "namespaces": ["AbUWmFhdYLWzMuv3", "zkUY0n0BAZkwbYkB", "LyO6A0FqfhnaB3Yx"], "roleId": "KNdOTacCcJfIfXsh", "ssoCfg": {"googleKey": {"uLUk5WdpxjZx5noX": {}, "PhPUTKbonoucNmzw": {}, "OZOK56sDkci5rZ8i": {}}, "groupConfigs": [{"assignNamespaces": ["MlOuksQJCiRFiZWw", "J7NrTb1XTB9YQzUJ", "9XlYJ8BzP6EUmUXG"], "group": "M5anIloyj9lhbvuQ", "roleId": "dW2jwKUckc794ryY"}, {"assignNamespaces": ["91lX8DD4MYXlrJ81", "lHvv9rqvEoM8YmVj", "AkO3HKsEp6KlqwW4"], "group": "djrexcbHdEtoQvpV", "roleId": "344RctmTozCi8HeV"}, {"assignNamespaces": ["6jbalHmqBBfi7sSF", "5BoGiTCVsXsygWbj", "E2opXtdsJQeJ1too"], "group": "0qvxphTLEEBGTtZy", "roleId": "TjdKNKgYazujsmSm"}]}}, {"affectedClientIDs": ["ylT1YtxIq73aMb48", "jISd97KORRhxSWLW", "LNfHRD3V15QaGGL4"], "domain": "6LuxJF3sbeqWBdQu", "namespaces": ["WfgBAKx27MSBqabU", "XOGkkoMUZn1YXj5z", "FZeOCOR9NvBQZSJP"], "roleId": "OIKrRBrYVzi9ui3l", "ssoCfg": {"googleKey": {"vozTt9TsH7A0TuU2": {}, "aL4bPkk11sys6Gdk": {}, "Dcos5uVJ0BJfZ0jv": {}}, "groupConfigs": [{"assignNamespaces": ["A54CSqZFDsO1skRj", "OU1SMfQVQa6blj9R", "dd85bdYUumPKVSZC"], "group": "g3XTc9vQe0dHJfF6", "roleId": "KIuvnRCa9JktyBdx"}, {"assignNamespaces": ["kZKrEWFw9GYxjiiO", "QAD77ci0vfWVZoRR", "MPi57HyKKz5nyI6u"], "group": "lKNKoXa0dgx1JgjC", "roleId": "56pda3YhtQxpCYME"}, {"assignNamespaces": ["6x21pdX2QSPAd9sx", "oLnWGP1PafIjLX8c", "e0KbNN7Ycl2JfmQp"], "group": "lvGjVQ4aebjfgGu4", "roleId": "72oWJlfglLM4xjfk"}]}}, {"affectedClientIDs": ["NL4lU6jaGfsD1cfs", "wmeFpvtDtetoQVFL", "8LNW11vtpaTxi7k4"], "domain": "89jRCn48bvkCPfKo", "namespaces": ["fwXOIZZQAJza84lK", "KmVOaTS6xBbNrSUA", "W2ak7ISDrBVg6NuD"], "roleId": "ZvPb1kuUfNfUDe4g", "ssoCfg": {"googleKey": {"7q6PHEaqbzHvDDl1": {}, "jiLw3XMGBA6JXDpA": {}, "1tIC45C0oaGouFu4": {}}, "groupConfigs": [{"assignNamespaces": ["hXONgUwJnUpryDeR", "cpUvlrw2MwC1uuok", "paIjL0Vxe5n9Lx3Q"], "group": "cFo9gxOgvDc7xMrR", "roleId": "Kvw8ISP2WKmCRRXB"}, {"assignNamespaces": ["xlalCHtWlKxLpS8f", "LWoQ5nuJhatQPxR7", "dvBVC5zgOKLTDmHe"], "group": "8c1eJ9sde7Ryt4ud", "roleId": "Iv22M18uux9xBomQ"}, {"assignNamespaces": ["FPFWy5cwNPI6aFo0", "MVwDZCIXFNEL3uWV", "Rz3V7YbJM3bNLWHA"], "group": "bCZixe2cQ6O30lpz", "roleId": "cBQMAEcNcJqrKxnM"}]}}], "RelyingParty": "zSYoc4ZjiMY4H34B", "SandboxId": "6wVd8ipcKDwQeUWt", "Secret": "jCC2UH6jzMO3AfmO", "TeamID": "S5mQNyRPZFPNP56l", "TokenAuthenticationType": "1AT6OLKmZhCZxxPP", "TokenClaimsMapping": {"dPwOtEuWBSO2jJep": "UnEEgja2mIE2kLTn", "Jwc5XmkCuL5W4tKt": "6G3j9LYdG7xVPqBq", "e9RDQMBSYAFLqp8P": "F5hCcoukWpnbz4ys"}, "TokenEndpoint": "7j6lxuU3u2HEG0qf", "UserInfoEndpoint": "KegvFTD1sPykS8YL", "UserInfoHTTPMethod": "mwtYgWGcA0h4G1LZ", "googleAdminConsoleKey": "1HaX5UBMbsF44VTs", "scopes": ["LDRzdq22cbnyK3gg", "FDh2kaZP7pnnVfxP", "wc259HF9ejHaILQr"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uAuYyJLYGqMv824o' \
    --body '{"affectedClientIDs": ["uSgkpK70uJmUL0uz", "Elixc023dIvDiA0t", "QWlHwBcTtztx3VAl"], "assignedNamespaces": ["6tXFbnATCzUOIzVc", "y9k3ie64Vnwa0ClG", "QJultJe32AiwKadE"], "domain": "oIVmprwPsa9YD92C", "roleId": "X0rITajpwHITGeHT", "ssoCfg": {"googleKey": {"nqRbzBB9ZFgJbQ3F": {}, "j1umx4ItzkMJ7cud": {}, "f4r916GPrhn2etVI": {}}, "groupConfigs": [{"assignNamespaces": ["QvRkQJAtDUH9tx60", "AehGz1ermJYXsYgL", "7TfyIlAwjTZdRZJJ"], "group": "zWZwvTX2bamSCvX1", "roleId": "nwvSWdDwD7WJHzgN"}, {"assignNamespaces": ["ZUKsI5y0mR3zMyTs", "ftKqnsIJctAdxyZV", "KHA9DkaSOWgtg8yw"], "group": "8lHEbVDwBAqanOls", "roleId": "cRIWw82k5K5VTkdu"}, {"assignNamespaces": ["bkOFldMCQ98JH4n0", "JtgqzZv5kVu4S95m", "j8YRvae4f4lhBPba"], "group": "rbWEm8bVtZcfVCPd", "roleId": "Qhim9QKUAFTVYelI"}]}}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lGJg9wdc8bihhWjf' \
    --body '{"domain": "ZpfcFBUsnnDJlmD1", "ssoGroups": ["iEokbUiYzCQh2iNT", "wtnohddMzMTQ9P7s", "YLDWAJOA75K4BYJ2"]}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fkqYJoF2FI3vyyqR' \
    --body '{"affectedClientIDs": ["zc20O7FdsJP1G9ty", "BTfERXdvgD1Qf7Ot", "2DkUt3yexZBRvxYn"], "assignedNamespaces": ["EBhXtAVxCd3meTrT", "7cF9oVCh89wNOkKY", "ssVejcL3kR3hCGNg"], "domain": "aJmuALlMQl9RLrth", "roleId": "bfp0VgweLlT2sY3S", "ssoCfg": {"googleKey": {"sTnDQY7kKU2u06Q4": {}, "veujxtyQENvJrBCq": {}, "eg67d4RWOqO4U0bi": {}}, "groupConfigs": [{"assignNamespaces": ["tNQLzwRoWnR0AbkC", "PY70FmvviVIBbcuj", "F8Vk5qb8NhWWwaxy"], "group": "Mchkt8l5IPSrwrJl", "roleId": "7wYIVw13NCo9yXlb"}, {"assignNamespaces": ["Q52FTHTCj6SEAzT7", "TOpyiuvvQUm29Iac", "q4XRLaA643nTMtXS"], "group": "Ayejnny0Ju13b6o5", "roleId": "uB2XM6IHy7EEvHyL"}, {"assignNamespaces": ["mcvrZZOdwe1x8RjU", "6Bi8JXE52sUBBq2S", "imQQoLbe5YOJvxGR"], "group": "xUzrTwagH7BMT1IZ", "roleId": "KTdNFVBQ1crBXAup"}]}}' \
    > test.out 2>&1
eval_tap $? 148 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 149 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ATO8uXsqVpdiWo8S' \
    > test.out 2>&1
eval_tap $? 149 'RetrieveSSOLoginPlatformCredential' test.out

#- 150 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jDAM0Riw8wLYW3n4' \
    --body '{"acsUrl": "F3LD1EDwBXw5uBYe", "apiKey": "QZOzATNSV9E9yyNb", "appId": "7yaLXzAVYymOuhCk", "federationMetadataUrl": "Zu4htrsf8eIFSovT", "isActive": false, "redirectUri": "aMsq8ePN1oco2jx8", "secret": "Upe8SjMvpqM8pugg", "ssoUrl": "OEdG47gD5i2Ni6An"}' \
    > test.out 2>&1
eval_tap $? 150 'AddSSOLoginPlatformCredential' test.out

#- 151 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Wn3NdEPhNHSH7eKD' \
    > test.out 2>&1
eval_tap $? 151 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 152 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fRcngEpTnRUQr3RL' \
    --body '{"acsUrl": "OM1vEx4gqDY6jwyK", "apiKey": "RxhkLe5zohg9s9ut", "appId": "RQt28b6o3K0COF74", "federationMetadataUrl": "tz6aeXZOYwbwjMNd", "isActive": true, "redirectUri": "qGegcg3eRvBZXN3c", "secret": "jIXmFWRJnj8xN7HD", "ssoUrl": "PTUEDPN1Kb4UTPWD"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSSOPlatformCredential' test.out

#- 153 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XTSb55g8LSTs7Nf9' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["5lGlPrf6obIdnI6A", "g7eUYcYJ4QzXCmqr", "6gmPGaHP5SVPvRLi"]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 154 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Di0mNHb6Lx8eq8SG' \
    --platformUserId 'NwEQO8dYXvBSYvJB' \
    --pidType 'wb6CjZUMRf2VJetW' \
    > test.out 2>&1
eval_tap $? 154 'AdminGetUserByPlatformUserIDV3' test.out

#- 155 AdminGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'dob' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetProfileUpdateStrategyV3' test.out

#- 156 AdminUpdateProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'display_name' \
    --body '{"config": {"minimumAllowedInterval": 18}, "type": "kvx3BHuTEczr9KjQ"}' \
    > test.out 2>&1
eval_tap $? 156 'AdminUpdateProfileUpdateStrategyV3' test.out

#- 157 AdminGetRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    > test.out 2>&1
eval_tap $? 157 'AdminGetRoleOverrideConfigV3' test.out

#- 158 AdminUpdateRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    --body '{"additions": [{"actions": [19, 39, 52], "resource": "4gV7nmDk29mcjSuz"}, {"actions": [27, 45, 85], "resource": "bNStqPtQmQN6eKAG"}, {"actions": [17, 99, 64], "resource": "osrsVBPZ64j0HUON"}], "exclusions": [{"actions": [37, 23, 4], "resource": "xcCKAru8pOaAVLDB"}, {"actions": [73, 21, 94], "resource": "3JwkdaxR7GJpYmuY"}, {"actions": [57, 85, 56], "resource": "G181q9GA5DydC2D8"}], "overrides": [{"actions": [96, 94, 73], "resource": "KOc4VPDUR9ayazqX"}, {"actions": [89, 23, 34], "resource": "RxOelKykICRxF6Ht"}, {"actions": [23, 38, 63], "resource": "9BYp6TgCejBd5o7i"}], "replacements": [{"replacement": {"actions": [93, 92, 83], "resource": "T7R3KbbQGERMNpqW"}, "target": "b51y5RUzvMfTkPy0"}, {"replacement": {"actions": [10, 72, 66], "resource": "XLGYcwWVRK6UKk5o"}, "target": "zrXA4HZHNyq9odan"}, {"replacement": {"actions": [16, 45, 90], "resource": "xmbH3rVaauufxkPH"}, "target": "Elug48TgfNu0rqXU"}]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminUpdateRoleOverrideConfigV3' test.out

#- 159 AdminGetRoleSourceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleSourceV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetRoleSourceV3' test.out

#- 160 AdminChangeRoleOverrideConfigStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminChangeRoleOverrideConfigStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'GAME_ADMIN' \
    --body '{"active": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 161 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '2phYOgT5kDTyPl3d' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetRoleNamespacePermissionV3' test.out

#- 162 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'KF7NXEjrJMki8jvc' \
    --after '60' \
    --before '86' \
    --limit '79' \
    > test.out 2>&1
eval_tap $? 162 'GetAdminUsersByRoleIdV3' test.out

#- 163 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '68' \
    --tagName 'uOmh0lciRhVZ2Deo' \
    > test.out 2>&1
eval_tap $? 163 'AdminQueryTagV3' test.out

#- 164 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "ODXMzLSrzoiBnYi5"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminCreateTagV3' test.out

#- 165 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'UWs3tYlYeMoCimJy' \
    --body '{"tagName": "SocRvUWDOrFZKPNo"}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateTagV3' test.out

#- 166 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'N9AWtLK9TFgi9j2X' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteTagV3' test.out

#- 167 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'Mh9WpifqjNjLOtNQ' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserByEmailAddressV3' test.out

#- 168 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["KVpULjjiw3NeVG4D", "Ji9DaMrc0WFgKjE9", "45x2CPVYYG9WvoGm"]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminBulkUpdateUsersV3' test.out

#- 169 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'AmvaVV5YfxnUNcwj' \
    --body '{"bulkUserId": ["r7gSGhnfuF4WZiQV", "ICVpWd3UM08gMXhd", "f3juXW4JprIb3CJC"]}' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetBulkUserBanV3' test.out

#- 170 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"findByPublisherNamespace": true, "userIds": ["Jd4Z5f8nfaKqdZFL", "bZEHxsDxeR6d7r1S", "Qw80JfMpPrSqYypR"]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminListUserIDByUserIDsV3' test.out

#- 171 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Unq5o4ETeCUYG9cc", "Tt7Wxw8OQ13t3uTw", "6zQuoZcXQpoTOxe8"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminBulkGetUsersPlatform' test.out

#- 172 AdminCursorGetUserV3
./ng net.accelbyte.sdk.cli.Main iam adminCursorGetUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cursor": {"cursorTime": "y1jorNsg9ZKYCKoI", "userId": "SyXtHzoWGdYohxMp"}, "fields": ["3uOQIybqWfG9BJ6F", "VKlbYHtbPtaxvagS", "lpGgVTF6VeDAPOGB"], "limit": 45}' \
    > test.out 2>&1
eval_tap $? 172 'AdminCursorGetUserV3' test.out

#- 173 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["86XmRkCEcfHDCdl5", "9Wp9A3tXGve6DdK6", "uvg8f2cIoByk9fxt"], "isAdmin": true, "languageTag": "UcCEt0DzmkJq1sml", "namespace": "5bYt76BNsi4giR94", "roles": ["34WpKKdzxoufCNlF", "oOcWQQy4bjmQeEwe", "oBHTdwAk7ZQnbqY1"]}' \
    > test.out 2>&1
eval_tap $? 173 'AdminInviteUserV3' test.out

#- 174 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '33' \
    --platformUserId 'QwVEtAr5kKKAo9MM' \
    --platformId '2Cqm84jVi9kIpqgr' \
    > test.out 2>&1
eval_tap $? 174 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 175 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 175 'AdminListUsersV3' test.out

#- 176 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'pUkNOBWydXV0Fi02' \
    --endDate 'aFr8CDapjwNOl4k8' \
    --includeTotal  \
    --limit '36' \
    --offset '86' \
    --platformBy 'VNrm8drv8QD2JOe2' \
    --platformId 'Ntz7EFvowPgIGuet' \
    --query 'xFMqXCQMAqQ2ZRGz' \
    --roleIds 'NtrThFa9XU8moslu' \
    --selectedFields 'iHZJ7O8sAQ32wj9u' \
    --skipLoginQueue  \
    --startDate 'aDzsr9xYiWRuuzQJ' \
    --tagIds 'iLc1eI9w3JEhxPGb' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 176 'AdminSearchUserV3' test.out

#- 177 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["Ek7s7gw07FlounC3", "vJKBC7SwgoViPeIB", "4Ehy0Y5aSJVDginx"]}' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetBulkUserByEmailAddressV3' test.out

#- 178 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AM77eY9C14FbfiI2' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetUserByUserIdV3' test.out

#- 179 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NPvl1kCY5bEokxXx' \
    --body '{"avatarUrl": "kWZbjf7GZxaossQm", "country": "jo69wohJFyTNk5FG", "dateOfBirth": "UPhR4LEZvz3EjFR7", "displayName": "996Ug5m4axDV5uTc", "languageTag": "YsoahUrELQ1btjJO", "skipLoginQueue": true, "tags": ["3qbZu9M3OxqVAT4H", "1lRZ9Z1JBrHRzEOt", "IxzPqb6n73m0jiaD"], "uniqueDisplayName": "H86d9rsKgzCsMulp", "userName": "B8HZUtVVaJCiLgKO"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserV3' test.out

#- 180 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wrSfWhT5B4Wedopz' \
    --activeOnly  \
    --after 'wSluBtRFPKThyGnb' \
    --before 'jmPDKFS6u9FHuv1M' \
    --limit '96' \
    > test.out 2>&1
eval_tap $? 180 'AdminGetUserBanV3' test.out

#- 181 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qfch4SqIV6LQPHla' \
    --body '{"ban": "eYl4csFq65cU66yJ", "comment": "aj4ovoKWE4EW0sw8", "endDate": "v5peiuxoBJATauyD", "reason": "3XCXVMiyEvMf9yil", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 181 'AdminBanUserV3' test.out

#- 182 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Eujk6oqYo1HQYTFz' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserBanSummaryV3' test.out

#- 183 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'wdOMdupwD4O3uNbc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IDcIyvZbOy1T4hfw' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateUserBanV3' test.out

#- 184 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ofaJoSqtrEOqxH46' \
    --body '{"context": "fRTSZoDdT0fefo74", "emailAddress": "eg3Nt2c0r4GqF0NH", "languageTag": "glOVuNZ9LzNeJnBu", "upgradeToken": "rh54CWbYb0Pebyt8"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminSendVerificationCodeV3' test.out

#- 185 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'b4DGscjwrizsFUgY' \
    --body '{"Code": "wbaLvqvQ2NbmDITu", "ContactType": "ymTBjn3d2sFzMS3Q", "LanguageTag": "aVjZF7Ax6115Kg9U", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 185 'AdminVerifyAccountV3' test.out

#- 186 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId '7ivHEoLbUMM47f1U' \
    > test.out 2>&1
eval_tap $? 186 'GetUserVerificationCode' test.out

#- 187 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'reUpxEkXIbE1ETzR' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserDeletionStatusV3' test.out

#- 188 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JZKMavu4Ul2IaieE' \
    --body '{"deletionDate": 3, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserDeletionStatusV3' test.out

#- 189 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'E7TGkeHsYsW9oGBN' \
    > test.out 2>&1
eval_tap $? 189 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 190 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1pYMBwbPZTlMlUvF' \
    --body '{"code": "EiGprcNSQ9kEeXBZ", "country": "6FVrBzyhyhoS6a9o", "dateOfBirth": "e0JaXFpff28uYbe4", "displayName": "Cf2HEHvVevhISjbt", "emailAddress": "BJUK5fE3OufPSX3P", "password": "dOU2V9yw94oa8UJ3", "uniqueDisplayName": "4TIedV3HyoX4VnO2", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpgradeHeadlessAccountV3' test.out

#- 191 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zDNp1SZ58aDllwzT' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserInformationV3' test.out

#- 192 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RHak1MXxj7Esrg79' \
    --after '0.8535193858080639' \
    --before '0.8448998530952125' \
    --limit '28' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserLoginHistoriesV3' test.out

#- 193 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'I6zUtf3QaJPGrTNc' \
    --body '{"languageTag": "XXTUIggoH89QNmI1", "mfaToken": "7UDb19R6H7r1ta3m", "newPassword": "7jK5pxe82pgFiAS6", "oldPassword": "piIzmc8rKrKEPGSA"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminResetPasswordV3' test.out

#- 194 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cong6eNERUf8kjci' \
    --body '{"Permissions": [{"Action": 25, "Resource": "Ctccv9Gv4tOcbnuC", "SchedAction": 33, "SchedCron": "l5XCbkOfHaGr5kda", "SchedRange": ["zlypvt6lSLfU7HBy", "GXPMqxj4hBgVY3YA", "xZLKbcOdyjqf6Q4o"]}, {"Action": 17, "Resource": "3Idi55jNrGNT2VHT", "SchedAction": 74, "SchedCron": "ufc5ZyODR2NVyn4P", "SchedRange": ["Rqf3eRbZqBAoKGcV", "CdMiSNV4qBrt1kcL", "mRv6EJtl5xWnsb8o"]}, {"Action": 99, "Resource": "kUTGkcBOE4qMcH1K", "SchedAction": 50, "SchedCron": "DV1VitaomvWTzdsW", "SchedRange": ["4N70wYS4Kj7Yi2Vv", "oQNW8Yc481dYdvGx", "JAMDRA1LF7jdWlek"]}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminUpdateUserPermissionV3' test.out

#- 195 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FwO94VBCV9qJhWva' \
    --body '{"Permissions": [{"Action": 54, "Resource": "FPBujX0geYCpGJM4", "SchedAction": 38, "SchedCron": "OnXuXsGThYZrmm0w", "SchedRange": ["rFMnPpWgrQD4hEk0", "OLjYsnignE7KcMF7", "fuDbzRRYMNXWUsp1"]}, {"Action": 39, "Resource": "i5WjMZfOadpgegCU", "SchedAction": 20, "SchedCron": "iNURrlm88QlKyuoy", "SchedRange": ["a4JgakZyUV7t73Vn", "SFbuxd4KYZ0jk0UZ", "dhtnKu9oTc8pVkiy"]}, {"Action": 67, "Resource": "XEEsL5D0oiFchQnV", "SchedAction": 8, "SchedCron": "s8WIObJBTsvsw76u", "SchedRange": ["ISRX0bKVoWtoUW1P", "7ocuBAldDSUS7Haa", "6unq1yQOSRvyiLBR"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserPermissionsV3' test.out

#- 196 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VtIDi2piIQFVmzMi' \
    --body '[{"Action": 7, "Resource": "f87YPNOe9Eevf1fh"}, {"Action": 79, "Resource": "9AX7JjxvNZhM84Di"}, {"Action": 20, "Resource": "fPOieDCow2zXyFFV"}]' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserPermissionBulkV3' test.out

#- 197 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '31' \
    --namespace "$AB_NAMESPACE" \
    --resource 'OkL78XeEAtALFI3v' \
    --userId '8yha4pd5A7MYcpBD' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserPermissionV3' test.out

#- 198 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6lKNb8RxvN2u5J7b' \
    --after 'aOeLH19fqBwNbNe1' \
    --before 'ffYRtIvQaKyevWYt' \
    --limit '39' \
    --platformId 'jK6J29v8MpBSpo3A' \
    --targetNamespace 'KRmnJkzJHAckUyBk' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserPlatformAccountsV3' test.out

#- 199 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sYQfDm0RNFwiz70t' \
    --status 'RVLMlHi8i9gOVqaj' \
    > test.out 2>&1
eval_tap $? 199 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 200 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'UWrgEsWDtaKzn8dZ' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetListJusticePlatformAccounts' test.out

#- 201 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'wnnGeZsZVgbPzPFb' \
    --userId 'rOMZMgWkFN7Tpkx6' \
    --createIfNotFound  \
    > test.out 2>&1
eval_tap $? 201 'AdminGetUserMapping' test.out

#- 202 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'GcfyOg6ZUrrp9ubg' \
    --userId '9mndW2JKmQafUs2b' \
    > test.out 2>&1
eval_tap $? 202 'AdminCreateJusticeUser' test.out

#- 203 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'xYztOEyVbKIf1Zbz' \
    --skipConflict  \
    --body '{"platformId": "gUwd8DHoCQykmXHY", "platformUserId": "mkRlg7gYs6unPYQ9"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminLinkPlatformAccount' test.out

#- 204 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jNQN1di1ldhOh6Hv' \
    --platformId 'jnYuV7NfC4A2ODiZ' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetUserLinkHistoriesV3' test.out

#- 205 AdminPlatformUnlinkV3
eval_tap 0 205 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 206 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hbfb8QqCyK1XH9D6' \
    --userId 'vl5eFdFfgK46GjCW' \
    > test.out 2>&1
eval_tap $? 206 'AdminPlatformUnlinkAllV3' test.out

#- 207 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'aP8huTmnq3FGQn3A' \
    --userId 'hu5wxq6oJq4mChmQ' \
    --ticket 'HQhO9IKBXDFQfXFD' \
    > test.out 2>&1
eval_tap $? 207 'AdminPlatformLinkV3' test.out

#- 208 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 208 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 209 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '58sG6uDhFYlrzJBY' \
    --userId 'SeMuJfQecutjS029' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 210 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BiJWOG1m7MKclr5i' \
    --userId 'gjNTVItrH2X78hxJ' \
    --platformToken 'gaVfw5Vnyq8OzTE8' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 211 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId '9WDNoMcOmbfJrCJQ' \
    --userId 'Ij1haAosKglqaCXE' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 211 'AdminGetUserSinglePlatformAccount' test.out

#- 212 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9ytpIO8btO3OwNEG' \
    --body '["SW5TaW4to7QCY2NG", "Gvi9kg3rMIzNmhJT", "NQjKlwjfJ3TJ2xVp"]' \
    > test.out 2>&1
eval_tap $? 212 'AdminDeleteUserRolesV3' test.out

#- 213 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ge70WsLfgbZieRvJ' \
    --body '[{"namespace": "I5sT9DH3DfLCv8q4", "roleId": "Thmq09bBgPAYxrBE"}, {"namespace": "9jlnTgtgW33wDwD9", "roleId": "RKvQX4yFQFdrRoM6"}, {"namespace": "FoqCYw7AlxO6qdFp", "roleId": "c71sSck3ggZWJlSl"}]' \
    > test.out 2>&1
eval_tap $? 213 'AdminSaveUserRoleV3' test.out

#- 214 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'CQMDji329PfVrvME' \
    --userId 'PtpsSNcpK1QkB2Sy' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddUserRoleV3' test.out

#- 215 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '8Ww79LVeVskqeUB7' \
    --userId 'RSayqGFguhh3bvad' \
    > test.out 2>&1
eval_tap $? 215 'AdminDeleteUserRoleV3' test.out

#- 216 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RthdbVApebRA09rW' \
    > test.out 2>&1
eval_tap $? 216 'AdminGetUserStateByUserIdV3' test.out

#- 217 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8i8krFWJhe03coRF' \
    --body '{"enabled": false, "reason": "x6iCJTu60IifzMhk"}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateUserStatusV3' test.out

#- 218 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'k5PxsjqbCKpMv2Yk' \
    --body '{"emailAddress": "y9DYkD2sIllFtBtX", "password": "JKG3rqBmILhtWm8R"}' \
    > test.out 2>&1
eval_tap $? 218 'AdminTrustlyUpdateUserIdentity' test.out

#- 219 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QvRUbUDSiefGEdLu' \
    > test.out 2>&1
eval_tap $? 219 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 220 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'crtO2gCQD057DrDl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "gC2nzS9SiGUjVAw4"}' \
    > test.out 2>&1
eval_tap $? 220 'AdminUpdateClientSecretV3' test.out

#- 221 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'v3q6JRHcn7KaoCEk' \
    > test.out 2>&1
eval_tap $? 221 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 222 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'Rdo6qHYIZWnXqQ1o' \
    --before 'HFJ9Q0vqsL9SomqW' \
    --isWildcard  \
    --limit '38' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRolesV3' test.out

#- 223 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "managers": [{"displayName": "6yxi0QzZWfmP2sx0", "namespace": "KO5bEJaPnAFjsody", "userId": "JQVVBrShGbIIuqK8"}, {"displayName": "C403HgoXCR6XOMXw", "namespace": "Kdfqk8T4QHK30EX0", "userId": "FclpDl5HsuracO5M"}, {"displayName": "njnxD1OXkxShFVQT", "namespace": "RekLfjmy8zosRCRg", "userId": "VwbrQKmb01yA7U7d"}], "members": [{"displayName": "GMjupZkZQY8CNyT4", "namespace": "k3DIbfT22G5NpE13", "userId": "0YWSgxpKWtdtdtVW"}, {"displayName": "9anENmxb9e7vXZV3", "namespace": "ig8Jg5VByeI3ycMc", "userId": "YYBixKJXCISQdwec"}, {"displayName": "1m8BusV9tUh74KVo", "namespace": "6Xqjz2xUKLNWSmYy", "userId": "VvyelIJ8QgaLMqi8"}], "permissions": [{"action": 87, "resource": "6ULa7cfZl4VuY6rs", "schedAction": 64, "schedCron": "yo6CBRRnoOikIxXK", "schedRange": ["KIR6kPmswm5TCAU1", "cKApdJDnE73GLmSZ", "ns5owBhoUg4LsGP6"]}, {"action": 75, "resource": "QpBOgHEP5l94s7Cb", "schedAction": 71, "schedCron": "axjTZPlLitytGka7", "schedRange": ["Kv5TacQKF4OlRGdm", "XxETLEQrr3KCAV9a", "lq3hK1G4kKooSNNU"]}, {"action": 42, "resource": "HkSSV8e1MgTTLS2F", "schedAction": 12, "schedCron": "F3eTC0vzZUDj9dzG", "schedRange": ["gGVxo9OHgfHumyfu", "BNisecYbcOpR45VD", "lvSc0Mr7ImwCwGqO"]}], "roleName": "f0bNs97KvKyj3MqS"}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateRoleV3' test.out

#- 224 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId '7Dcmtfh50eObbrmg' \
    > test.out 2>&1
eval_tap $? 224 'AdminGetRoleV3' test.out

#- 225 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'jhWK0x0ZidAJ1CU1' \
    > test.out 2>&1
eval_tap $? 225 'AdminDeleteRoleV3' test.out

#- 226 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'eD1La16Bw3JbUnUD' \
    --body '{"deletable": false, "isWildcard": false, "roleName": "5yGjjv4Mwrv2vanc"}' \
    > test.out 2>&1
eval_tap $? 226 'AdminUpdateRoleV3' test.out

#- 227 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'mR6Z7rb21A2E9pX0' \
    > test.out 2>&1
eval_tap $? 227 'AdminGetRoleAdminStatusV3' test.out

#- 228 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'BWCMqPsRk5htdM5T' \
    > test.out 2>&1
eval_tap $? 228 'AdminUpdateAdminRoleStatusV3' test.out

#- 229 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '3fDSrSHrkoqv2mM6' \
    > test.out 2>&1
eval_tap $? 229 'AdminRemoveRoleAdminV3' test.out

#- 230 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'soMaTvQq2a9YdFNt' \
    --after 'RVSO0js0hG9xmSnz' \
    --before 'd7zgUxAogcnGkXk1' \
    --limit '32' \
    > test.out 2>&1
eval_tap $? 230 'AdminGetRoleManagersV3' test.out

#- 231 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'QPkJHRhmLKQuQVFS' \
    --body '{"managers": [{"displayName": "KiXl8G2uf6E8EajX", "namespace": "LSAS8MKMaxQ1QyJC", "userId": "pKedhuzI7G9NCKKX"}, {"displayName": "u1bqI2M5PmXfKnQ7", "namespace": "BYGjCUDMOrbmoRvW", "userId": "nfmGFy0eUoOBd90h"}, {"displayName": "9EDqSTOfoNewWjwM", "namespace": "WDKEt6JhbJ0fwTDa", "userId": "q6b5RpMwhWPtndri"}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminAddRoleManagersV3' test.out

#- 232 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'XU9loOxpmEuwDVc1' \
    --body '{"managers": [{"displayName": "2r0DVUGgGHkapTCa", "namespace": "fFMdvYiCBuzUUwyI", "userId": "6Vtd4v9k4fv3kMiu"}, {"displayName": "Q3DhsKLxjt5srPFx", "namespace": "BgpFtDBmTLH9kP9U", "userId": "53z6joBAhAlJGI2Y"}, {"displayName": "Yb6ajBjgq6eY4PBN", "namespace": "HKPx62tHxDb06ZFy", "userId": "3uglSp2UxvF2uLXW"}]}' \
    > test.out 2>&1
eval_tap $? 232 'AdminRemoveRoleManagersV3' test.out

#- 233 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'ilRD7HD6LCgdFxRG' \
    --after 'j00RT6LvcnGMJbJI' \
    --before 'YLssMvy9gkfTMRrX' \
    --limit '98' \
    > test.out 2>&1
eval_tap $? 233 'AdminGetRoleMembersV3' test.out

#- 234 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId '7rZpxaPHc9r8eToF' \
    --body '{"members": [{"displayName": "mkHJ6BPOKFLxIwKs", "namespace": "sw647YwDudnGRufO", "userId": "UGfMjTU226l07jPl"}, {"displayName": "cYaqYM7YfBmhjI9Y", "namespace": "28qVceS9UX48dKPC", "userId": "FUIeyYEymNXzNX6T"}, {"displayName": "Gh4UdEweeBsJEvBb", "namespace": "AvCmlh6Z1oz9Baix", "userId": "UUvmzbajE2gjooiD"}]}' \
    > test.out 2>&1
eval_tap $? 234 'AdminAddRoleMembersV3' test.out

#- 235 AdminRemoveRoleMembersV3
eval_tap 0 235 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 236 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'nc1NUb51lEgUwQ9t' \
    --body '{"permissions": [{"action": 21, "resource": "4axSPgPCiwLxCFLD", "schedAction": 17, "schedCron": "18JaEBQBP766LUnB", "schedRange": ["BR84iAO7sBQt6YJ2", "tWwF7RnP1oK3c4RV", "fjB0zi3XrYZUiN24"]}, {"action": 30, "resource": "NLHkVrEFd8xArWJu", "schedAction": 59, "schedCron": "V5YqE2myQzl7X9fH", "schedRange": ["r6WvBxmBvNj3ktaD", "f9B22HGgxakPt7IY", "zaZUTmvsEzLPnnGs"]}, {"action": 27, "resource": "7H7yIS7b5TSDRIoM", "schedAction": 13, "schedCron": "1vyamjsEzwtLPxK1", "schedRange": ["os4qR8LaQzEb39sZ", "TdFfC8x5aHLsXHlm", "1RJTTy9JrNz1K5M1"]}]}' \
    > test.out 2>&1
eval_tap $? 236 'AdminUpdateRolePermissionsV3' test.out

#- 237 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'qgFddYvifGHawNx6' \
    --body '{"permissions": [{"action": 50, "resource": "uCRM69XKkLwioRaK", "schedAction": 27, "schedCron": "KXDIjYC4df9qswSl", "schedRange": ["pCI8DhjlxUyrs3OS", "esE5p0DwUj2HKUvP", "YUcQBxMSdOOsn2Nd"]}, {"action": 38, "resource": "Jpa19GJDK46Eehx7", "schedAction": 47, "schedCron": "onA2SrEdN2tmGuX6", "schedRange": ["r0gBVUUeKKlPKtE6", "gnYxmkmCWbs5qugk", "lBUS6uwWrCQt86Jr"]}, {"action": 13, "resource": "WAShIhieSKUf3zKb", "schedAction": 50, "schedCron": "eXr6FNbKJ05Orya6", "schedRange": ["LSSUlugIAknXcSaV", "YcAYp7qSiDvsfMUO", "pWv46sXvpOjrpRo4"]}]}' \
    > test.out 2>&1
eval_tap $? 237 'AdminAddRolePermissionsV3' test.out

#- 238 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'mYrCeQUnYoID2UqO' \
    --body '["0iAXA9dB4ib8HDOJ", "8TNiP8KgEAj3dbRT", "I0i6dO3zkbDseh4t"]' \
    > test.out 2>&1
eval_tap $? 238 'AdminDeleteRolePermissionsV3' test.out

#- 239 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '73' \
    --resource 't6fX9j7rhZCAlDlV' \
    --roleId 'KBsLZiBRXszE7CL1' \
    > test.out 2>&1
eval_tap $? 239 'AdminDeleteRolePermissionV3' test.out

#- 240 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 240 'AdminGetMyUserV3' test.out

#- 241 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'cQCSoqHvH7g63cOx' \
    --extendExp  \
    --redirectUri '6yrIw37pKOLrF5i3' \
    --password 'gr3Cc4M2O7NrTQO7' \
    --requestId 'KLdZDGwqx7T3l1ut' \
    --userName '2oyolliYsTJUmpsc' \
    > test.out 2>&1
eval_tap $? 241 'UserAuthenticationV3' test.out

#- 242 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'wLcUml3KuoMKh7tp' \
    --linkingToken 'rnacA34xmIOjFLgK' \
    --password 'R4LjEWhOScvtQ92i' \
    --username 'D02YMvEUNfoL7JCc' \
    > test.out 2>&1
eval_tap $? 242 'AuthenticationWithPlatformLinkV3' test.out

#- 243 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'Mo7GxxXdbYCRexPe' \
    --linkingToken 'kTsQxMTfaSot7aoh' \
    --password 'FYy4VxwHIJ9gzxqA' \
    --username 'w4vBGQAeh0VTiTP4' \
    > test.out 2>&1
eval_tap $? 243 'AuthenticateAndLinkForwardV3' test.out

#- 244 PublicGetSystemConfigV3
./ng net.accelbyte.sdk.cli.Main iam publicGetSystemConfigV3 \
    > test.out 2>&1
eval_tap $? 244 'PublicGetSystemConfigV3' test.out

#- 245 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'PSrXUS6jYI9lsQFD' \
    --extendExp  \
    --linkingToken '43Df5qUZOFzpFd6b' \
    > test.out 2>&1
eval_tap $? 245 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 246 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri '5Jc5TETHcup8GG0V' \
    --state 'CMTFJ6svTyo9RHge' \
    --platformId 't5hzB52BDFopxUwk' \
    > test.out 2>&1
eval_tap $? 246 'RequestOneTimeLinkingCodeV3' test.out

#- 247 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'MuSqQnKzDgDAtqE3' \
    > test.out 2>&1
eval_tap $? 247 'ValidateOneTimeLinkingCodeV3' test.out

#- 248 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'kuybwTQFYEJjIYwq' \
    --isTransient  \
    --clientId 'fSRy8GgVk77fd1GS' \
    --oneTimeLinkCode '5YkyhAiAItnWUmD2' \
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
    --codeChallenge '25fp1egsx3ErheNw' \
    --codeChallengeMethod 'plain' \
    --clientId '4IE1z3rDwZ1HKsOp' \
    > test.out 2>&1
eval_tap $? 251 'RequestTokenExchangeCodeV3' test.out

#- 252 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yq8agQuz86nc6jLF' \
    --userId '9DIW2ncJJKpqmgvU' \
    --platformUserId 'Tr8XAtpOqUQxzqJZ' \
    > test.out 2>&1
eval_tap $? 252 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 253 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iWi3KQffT5Tn61A1' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserV3' test.out

#- 254 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'xW6okIqmd87ir9op' \
    --codeChallenge '4YfGTno5oHzqY3Dg' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'dACyHSmo4KX9TPO3' \
    --oneTimeLinkCode 'K1k5ZM8btmGsgXNX' \
    --redirectUri 'bpqxh76Af5JSwjw2' \
    --scope 'fE2g6jXV7oai2oDm' \
    --state '9FaP0HJ98tE4UyoQ' \
    --targetAuthPage 'g0b0sGOkzxVt15LK' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'mkQ7YBhsOuJ0ypkk' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 254 'AuthorizeV3' test.out

#- 255 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'VmRTawjiZPMoZZcy' \
    > test.out 2>&1
eval_tap $? 255 'TokenIntrospectionV3' test.out

#- 256 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 256 'GetJWKSV3' test.out

#- 257 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'GEHxAKDQher3usAp' \
    --factor 'PdJPn9eIdhIBvTTu' \
    --mfaToken 'pABJ4RwH3EdKmYtb' \
    > test.out 2>&1
eval_tap $? 257 'SendMFAAuthenticationCode' test.out

#- 258 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'qQHNfIZwrMxf3Enz' \
    --mfaToken 'ZVnkLT0Lb85nmpdN' \
    > test.out 2>&1
eval_tap $? 258 'Change2faMethod' test.out

#- 259 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code '26BY5YI0jeO2zMDS' \
    --factor 'y4kyqyKgrtEPdXXl' \
    --mfaToken 't8geCdiXu3iNvn7v' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 259 'Verify2faCode' test.out

#- 260 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'LZ7h6alhJNGZF07l' \
    --factors 'sPP5OfHbXzWnVO2U' \
    --rememberDevice  \
    --clientId '4uyzZo1rj0ZrLQjk' \
    --code '4VoYfIksth24cZBp' \
    --factor 'dDFfvzeU5iqhx6zv' \
    --mfaToken '7EURTNIoG1DBdoKH' \
    > test.out 2>&1
eval_tap $? 260 'Verify2faCodeForward' test.out

#- 261 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6sREmmfwUZLZZS7s' \
    --userId 'nx0Q2Gd8m7Y3wiNl' \
    > test.out 2>&1
eval_tap $? 261 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 262 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'oJfey3HXL6SjljNP' \
    --clientId 'TXA3qbg55SyienCO' \
    --redirectUri 'DZ0mnOpPTVxEgBFz' \
    --requestId 'G8tlkxWKCU1XN4gl' \
    > test.out 2>&1
eval_tap $? 262 'AuthCodeRequestV3' test.out

#- 263 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId '7yHvEqpJSrDXVwCk' \
    --additionalData 'hOQ161TFjROYJm75' \
    --clientId 'VIuCOCkt2W1DfI8Q' \
    --createHeadless  \
    --deviceId 'tgODk9K6DcMnyCPn' \
    --macAddress '1FylWdaNV1VaZTkb' \
    --platformToken 'buWiiA4UTDgS2SVE' \
    --serviceLabel '0.22923771715269836' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 263 'PlatformTokenGrantV3' test.out

#- 264 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 264 'GetRevocationListV3' test.out

#- 265 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token '5M80LLbku9GYH4ij' \
    > test.out 2>&1
eval_tap $? 265 'TokenRevocationV3' test.out

#- 266 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'qOVM50tCqkZfsSxA' \
    --simultaneousTicket 'bDJ7sHCLup8pmEos' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'XglQwwdeLVpmXqRw' \
    > test.out 2>&1
eval_tap $? 266 'SimultaneousLoginV3' test.out

#- 267 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'Vjc3W2ANmE3VVsQ1' \
    --clientId 'fm9EUdiaRjuLsKZo' \
    --clientSecret 'qnpKwhpZVdw5UMa8' \
    --code 'ymxtEFLwELCY2vId' \
    --codeVerifier 'dlxnA1VynioJcAPw' \
    --extendNamespace 'VHUGcs1ACMvoY4jW' \
    --extendExp  \
    --password 'H9dFmOHW0j9suukP' \
    --redirectUri 'E4JwQONQ2vCbMn0O' \
    --refreshToken 'ia336uiiMTAductv' \
    --scope 'UfVwLahtRedh1SiZ' \
    --username 'lOpIQ8GL7jBF1R5O' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 267 'TokenGrantV3' test.out

#- 268 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'F0bkfjcTEFXcTwEt' \
    > test.out 2>&1
eval_tap $? 268 'VerifyTokenV3' test.out

#- 269 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'nHxP5pVtN4jNVIdr' \
    --code 'uEA39uCJzsE8WObt' \
    --error '6t0w8LOBxE15JYj4' \
    --openidAssocHandle 'IqWK09l4wkrzahXR' \
    --openidClaimedId '1sDEDVKDINE3HjCi' \
    --openidIdentity 'VR1dQ8kuhb4pUwnG' \
    --openidMode 'ptHUplxzaDa9PDwh' \
    --openidNs 'u31d8eOdtrfq6ECD' \
    --openidOpEndpoint 'D6OGkuLs9gNpNon6' \
    --openidResponseNonce 'DKW9A6AmnQTNFidI' \
    --openidReturnTo 'mWONTvCPMGLdbYEk' \
    --openidSig 'nHPKrZ7TiNBE0HRs' \
    --openidSigned 'E0GHDOFjrfqJcyxT' \
    --state '2a7fCFAUzLELiM57' \
    > test.out 2>&1
eval_tap $? 269 'PlatformAuthenticationV3' test.out

#- 270 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId '3TdtWjfVciuLnLsB' \
    --platformToken 'KGsALPuCOyphUUAV' \
    > test.out 2>&1
eval_tap $? 270 'PlatformTokenRefreshV3' test.out

#- 271 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode '95708zaP0wpZgQEv' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetInputValidations' test.out

#- 272 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'Fzox9wHocX3DRWob' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetInputValidationByField' test.out

#- 273 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'EoGr8W97KBedcr6P' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCountryAgeRestrictionV3' test.out

#- 274 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'M51z7i0wQ9egK2t4' \
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
    --clientId '6EG8I2lTviKbOgVu' \
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
    --requestId '3nhkn6QIesNoYqvV' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetAsyncStatus' test.out

#- 282 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'sakylHikKkpOjqwg' \
    --limit '74' \
    --offset '41' \
    --platformBy 'vfXXs8pDqm31AZSR' \
    --platformId 'kuw6q8FgqG46RsFK' \
    --query '7eYlSU3vYcHZZjFe' \
    > test.out 2>&1
eval_tap $? 282 'PublicSearchUserV3' test.out

#- 283 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "gVnZOn0tk4IATSIe", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "VUii4KpYcb1AUsES", "policyId": "aBOTHnbX9tC9PQlF", "policyVersionId": "AGbMtEybfcAl0mns"}, {"isAccepted": true, "localizedPolicyVersionId": "UMcpxn4B6XoTNMuq", "policyId": "ZTHwo1IAJQpb6r8Z", "policyVersionId": "eaSHwQuiH3Ozu4G6"}, {"isAccepted": false, "localizedPolicyVersionId": "h7jpszuVk6iPdJ2b", "policyId": "oQqCCyJfThvCJieq", "policyVersionId": "RSGN8Mm74HlSZzp4"}], "authType": "aEW4GkHG5OIVuGv4", "code": "7XJpkMiopQrVL3ZZ", "country": "TVxqa9XM2gY14iWk", "dateOfBirth": "12Jffk8dwKNPUOHN", "displayName": "ZxML3yoBM9qxd6PW", "emailAddress": "z7sVnMxge2inL8fB", "password": "FP1ABaIKrEt8d3o7", "reachMinimumAge": false, "uniqueDisplayName": "o3eGSP4Htmr90TqG"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicCreateUserV3' test.out

#- 284 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'f0OyqJ9ibJMmRgox' \
    --query 'Nwp1lGkYoq8HP1TM' \
    > test.out 2>&1
eval_tap $? 284 'CheckUserAvailability' test.out

#- 285 PublicBulkGetUsers
eval_tap 0 285 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 286 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "0tefVQPWX1NPO5Wn", "languageTag": "7rNG8rGp7Fadvo5E"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendRegistrationCode' test.out

#- 287 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "zpX0IttsRezyY9GB", "emailAddress": "5sf94ALBmvdncQkc"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyRegistrationCode' test.out

#- 288 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "Zb8cWdVH9bww15zZ", "languageTag": "saYrJAe5Kd5QB96n"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicForgotPasswordV3' test.out

#- 289 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "dlO6iPGC9RhzMC7V", "password": "8BEphnRXnSpCzyb8", "uniqueDisplayName": "FkoxQbrPngi87K58", "username": "pQswqKLutINusOsa"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateUserInput' test.out

#- 290 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId '92F6iwkJIYOLarmp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'GetAdminInvitationV3' test.out

#- 291 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'Wyvib9CDW21ANrlp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "uXD9H1u1CvzWPcZw", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "t6foPPH94SUinY5d", "policyId": "iUlqgvY7dPPyahpp", "policyVersionId": "gxJhk4EdTZ000rS9"}, {"isAccepted": true, "localizedPolicyVersionId": "94HLvWFsXHtMP0k9", "policyId": "L5dREQbCqfh0gpAB", "policyVersionId": "FBER6WNcDOsRzBkf"}, {"isAccepted": false, "localizedPolicyVersionId": "A6HjCnFRdSihcvsz", "policyId": "zQLZBktk0siMup01", "policyVersionId": "kyaFwwD7wecuQb4G"}], "authType": "NQHVZMKGBnzh4sua", "code": "GIzttTncVBf5g3oe", "country": "uHiNyLkfPQPmjUkv", "dateOfBirth": "Ss5YmIejozmG5Hlr", "displayName": "IfMAvvpkAHRJHZyf", "emailAddress": "rXZmiJX4CjKCeIRI", "password": "r997KKpJXTLbYWpq", "reachMinimumAge": false, "uniqueDisplayName": "DFrx6LabyDnqXjXK"}' \
    > test.out 2>&1
eval_tap $? 291 'CreateUserFromInvitationV3' test.out

#- 292 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "PIcxh0x7T6RQGnnW", "country": "4ugGX6mKBbgTD9xL", "dateOfBirth": "07ZzzIs3Jke34ZAU", "displayName": "uLP897ooMLnemwKA", "languageTag": "vgDXNrFEE4Jf4hQp", "uniqueDisplayName": "sLOcLtZw0efmEVcW", "userName": "7mxbS5UOoICxQMit"}' \
    > test.out 2>&1
eval_tap $? 292 'UpdateUserV3' test.out

#- 293 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "8555Niy4NNFpRE5p", "country": "S85yTIRWvLRy58UK", "dateOfBirth": "WPv3F7S0wCVlYQi9", "displayName": "cfMCeNnu6OIG1PPL", "languageTag": "RDEXLXZWXvqNCHvN", "uniqueDisplayName": "peMjMzguq6HFIqaq", "userName": "wH9J6JLb5f3SBMyJ"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicPartialUpdateUserV3' test.out

#- 294 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "UdwEBRrHAWUFqToo", "emailAddress": "GGnPEgY0t7QQWl42", "languageTag": "byOwXgKyPhXmcysa", "upgradeToken": "e8HpWH4xiz3fWthJ"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicSendVerificationCodeV3' test.out

#- 295 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Su2pUIIuPLFAtcWh", "contactType": "jAP57QbWvSSp71zE", "languageTag": "PPfmAQiqRRC2caqu", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUserVerificationV3' test.out

#- 296 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "tQOILcaDqUITBHQR", "country": "5ISNoFR3GUxdMuvm", "dateOfBirth": "L0UBfwzaaeP3Wd0W", "displayName": "rb8s3GW0CY0vAfbq", "emailAddress": "8xoCurq4lpHXrbVB", "password": "h60NUA2aKQwnXrmi", "uniqueDisplayName": "6ya8u4sQPvaf1Acw", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpgradeHeadlessAccountV3' test.out

#- 297 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "CjlwrmsSRV86iic1", "password": "FIMyF7CcNu2DYn6E"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicVerifyHeadlessAccountV3' test.out

#- 298 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "9Gk51kOTJZluTekD", "mfaToken": "MCGUJvERxNg8djSb", "newPassword": "4Vt2vKQ5vlCdI519", "oldPassword": "Pf2iogwxM5DZM0dg"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicUpdatePasswordV3' test.out

#- 299 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'ozmco41750xdYQg3' \
    > test.out 2>&1
eval_tap $? 299 'PublicCreateJusticeUser' test.out

#- 300 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4WUV0WpmsQnp1n4Y' \
    --redirectUri 'GumTKOlDOy5vhSkx' \
    --ticket 'ERZ2AQ1jvXYBar5R' \
    > test.out 2>&1
eval_tap $? 300 'PublicPlatformLinkV3' test.out

#- 301 PublicPlatformUnlinkV3
eval_tap 0 301 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 302 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MmmGdWl0wpj5tVfK' \
    > test.out 2>&1
eval_tap $? 302 'PublicPlatformUnlinkAllV3' test.out

#- 303 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'U3D8WVPh0Z7YiGE2' \
    --ticket 'cyzTMBY7Xd0OoENg' \
    > test.out 2>&1
eval_tap $? 303 'PublicForcePlatformLinkV3' test.out

#- 304 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId '2Lw7uepmahXojVZY' \
    --clientId 'z2zMU9jLzNV3GaG4' \
    --redirectUri '3R6nlRPrEAYqRBeS' \
    > test.out 2>&1
eval_tap $? 304 'PublicWebLinkPlatform' test.out

#- 305 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'c5uShoj3dGHMeoi5' \
    --code 'DBOsQ0Gax0iX05IT' \
    --state '9Agsjl5NmnSHhxNm' \
    > test.out 2>&1
eval_tap $? 305 'PublicWebLinkPlatformEstablish' test.out

#- 306 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ce4txY0MsPc9EMgf' \
    --code '9JCJiEvhL8ZfwCVJ' \
    --state 'W9yspUOyHC9eKeXz' \
    > test.out 2>&1
eval_tap $? 306 'PublicProcessWebLinkPlatformV3' test.out

#- 307 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "rvzBllwzyC1aTWEm", "userIds": ["Pgoy4TkpEw4Zeid4", "mRoFNxv10ckMQVjK", "k3bWJ0ZuYSe3sI0x"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUsersPlatformInfosV3' test.out

#- 308 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "2hc8vaN1Off5gRZZ", "code": "MW3huAIzBPWBYKAE", "emailAddress": "FTdlKNh6GTzKjsCq", "languageTag": "xx24QM35bSkFrvGc", "newPassword": "iNHb7OY5YIpOLJW5"}' \
    > test.out 2>&1
eval_tap $? 308 'ResetPasswordV3' test.out

#- 309 PublicGetUserByUserIdV3
eval_tap 0 309 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 310 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2uz3c8pz63M0g4xX' \
    --activeOnly  \
    --limit '93' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserBanHistoryV3' test.out

#- 311 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ts4e0uR47OzUGHeB' \
    > test.out 2>&1
eval_tap $? 311 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 312 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KtpvyRNgjZkdDppv' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserInformationV3' test.out

#- 313 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EJiUiDGXgh8BKcLq' \
    --after '0.30895901775411294' \
    --before '0.7041926809124671' \
    --limit '89' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserLoginHistoriesV3' test.out

#- 314 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '93LuR8OEyICvwgwB' \
    --after 'FehwtdJLdn3R2wo8' \
    --before 'beVQvgeP9qOHaLwY' \
    --limit '28' \
    --platformId 'EMRPkdTcAzkIlndN' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetUserPlatformAccountsV3' test.out

#- 315 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5xeayr3vUKMuIiz2' \
    > test.out 2>&1
eval_tap $? 315 'PublicListJusticePlatformAccountsV3' test.out

#- 316 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'MiAAKcvAXnxnH0QI' \
    --body '{"platformId": "hoJRY807VmBT4wZX", "platformUserId": "QZZrSsuYiIPei0pX"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicLinkPlatformAccount' test.out

#- 317 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'glJYnKkoCAZuolAW' \
    --body '{"chosenNamespaces": ["nxkImVbDP0QX31gI", "7VmnGIRMvXe6Biph", "IFe2bzr6qQw6fSES"], "requestId": "kM19OPMBb12gpmSh"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicForceLinkPlatformWithProgression' test.out

#- 318 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lmIt2nfhUaZGqjsl' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPublisherUserV3' test.out

#- 319 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'u59GT2E6AacmZRXZ' \
    --password 'm626POXWVj3KP1mX' \
    > test.out 2>&1
eval_tap $? 319 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 320 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after '0iYHXBU3Uk2tQm30' \
    --before '7IORTyHnLYDAAg1Y' \
    --isWildcard  \
    --limit '55' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetRolesV3' test.out

#- 321 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'JZruOJvSRFLDSdj8' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetRoleV3' test.out

#- 322 PublicForgotPasswordWithoutNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordWithoutNamespaceV3 \
    --body '{"clientId": "elbtHvDU91DmHzwi", "emailAddress": "qVPCJ5j18Ou3aY8n", "languageTag": "ceFU5GKmcEKp8AQw"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicForgotPasswordWithoutNamespaceV3' test.out

#- 323 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 323 'PublicGetMyUserV3' test.out

#- 324 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "qgJs6O0Qj0ccMkdz", "emailAddress": "6zPz3BVHAqp4O9XS", "languageTag": "jap24esyjh6Wc3mi", "upgradeToken": "gf2n6iQyr5cb5YL6"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicSendCodeForwardV3' test.out

#- 325 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'fwBiaVPmmn0T5uzl' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 326 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["mi2NY26xrkPPdg3p", "XjmtpNfCrIj9ntYo", "3dupUHNu8abrVVOK"], "oneTimeLinkCode": "xr9Pa315FKDjG2Ap"}' \
    > test.out 2>&1
eval_tap $? 326 'LinkHeadlessAccountToMyAccountV3' test.out

#- 327 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'SV94Jy6yCSXBqJqj' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 328 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 329 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "AbVwSaoj1ugjr8mP"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicSendVerificationLinkV3' test.out

#- 330 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 330 'PublicGetOpenidUserInfoV3' test.out

#- 331 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'kr3tZ506ERSVy5M3' \
    > test.out 2>&1
eval_tap $? 331 'PublicVerifyUserByLinkV3' test.out

#- 332 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'rrkxu0U9h9gCNVZx' \
    --code 'HGxhZqNXJ6JXSh0Z' \
    --error '3SWISs1dYrJKmx1B' \
    --state 'T6iLFQejNZJNF2hm' \
    > test.out 2>&1
eval_tap $? 332 'PlatformAuthenticateSAMLV3Handler' test.out

#- 333 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId '0TqBQprHn3whPKU5' \
    --payload 'abnqw8fFa30pVbhr' \
    > test.out 2>&1
eval_tap $? 333 'LoginSSOClient' test.out

#- 334 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId '1BHh1arZAyuLcZoE' \
    > test.out 2>&1
eval_tap $? 334 'LogoutSSOClient' test.out

#- 335 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'kPpqKhP2jWnRTglw' \
    --code '0gdWoE4esuiDrquc' \
    > test.out 2>&1
eval_tap $? 335 'RequestTargetTokenResponseV3' test.out

#- 336 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'cz4J6fFQezJ5E3iY' \
    --upgradeSuccessToken 'HIknvPcJkjRevVYf' \
    > test.out 2>&1
eval_tap $? 336 'UpgradeAndAuthenticateForwardV3' test.out

#- 337 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '17' \
    --namespace "$AB_NAMESPACE" \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 337 'AdminListInvitationHistoriesV4' test.out

#- 338 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HuUY1QQHQ0NCEddJ' \
    > test.out 2>&1
eval_tap $? 338 'AdminGetDevicesByUserV4' test.out

#- 339 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'tx6GV01vD7lNLxlp' \
    --endDate 'vqaB9P9GaukfCEIe' \
    --limit '91' \
    --offset '91' \
    --startDate 'BLhTfzigzHcRuJgY' \
    > test.out 2>&1
eval_tap $? 339 'AdminGetBannedDevicesV4' test.out

#- 340 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aj4I8Dzyh1N0JEKN' \
    > test.out 2>&1
eval_tap $? 340 'AdminGetUserDeviceBansV4' test.out

#- 341 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "oMtHvjM7X1fjzknv", "deviceId": "2HZMIL2P2bh14Lro", "deviceType": "FTnAuujPeP9N0vdV", "enabled": true, "endDate": "w17arNs12hOoLVM7", "ext": {"UFnuJDzeEkDxaVog": {}, "xHrOon2OW4Zw5QwV": {}, "KWNy2tnF2MifJR4h": {}}, "reason": "r4gdJDujYnVnFK6g"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminBanDeviceV4' test.out

#- 342 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'B6ZxC6yYUVUJYnQ3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetDeviceBanV4' test.out

#- 343 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'jOGmROIqxqQ0gcNe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 343 'AdminUpdateDeviceBanV4' test.out

#- 344 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'flyvUh3w5ZtfwmOC' \
    --startDate 'KpFSMF0tfGIZCTNi' \
    --deviceType 'IRc9fEjkZhEpAJMC' \
    > test.out 2>&1
eval_tap $? 344 'AdminGenerateReportV4' test.out

#- 345 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'AdminGetDeviceTypesV4' test.out

#- 346 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'xMp2J0hDg2kMgkvh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'AdminGetDeviceBansV4' test.out

#- 347 AdminDecryptDeviceV4
eval_tap 0 347 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 348 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'oQe9gD9tGN0nE7M3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'AdminUnbanDeviceV4' test.out

#- 349 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId '6mI9u3EeZtLQij2J' \
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
    --limit '12' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 352 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "qdXfhZTTaCeqGv7m", "policyId": "euQhJuq1C6JHkWMS", "policyVersionId": "UbqByWN2BCnRz9w2"}, {"isAccepted": false, "localizedPolicyVersionId": "BTnNQnVUhA5WnzVZ", "policyId": "dj8tsyzC4QaLXp3o", "policyVersionId": "4TDraEEaDNJbVd20"}, {"isAccepted": true, "localizedPolicyVersionId": "VHevCjthJUb7jKuM", "policyId": "rFaoLulzp3sZxImV", "policyVersionId": "K5yh2LcM8LaMW0By"}], "count": 20, "userInfo": {"country": "rP03bQaq1cT88H6R"}}' \
    > test.out 2>&1
eval_tap $? 352 'AdminCreateTestUsersV4' test.out

#- 353 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "zsbrtYvLh56AWXoM", "policyId": "iowdWSs9DQ0VU1HE", "policyVersionId": "D9CGo9aUXj3rh0Uy"}, {"isAccepted": true, "localizedPolicyVersionId": "x88sAUrXr7MXxCvy", "policyId": "y7caxz4MQrODLNlx", "policyVersionId": "iEjQBCZx9DJ4V97S"}, {"isAccepted": false, "localizedPolicyVersionId": "LlrwXmIGamRCARuF", "policyId": "Lx4rV4CXVMrDYKe2", "policyVersionId": "eTf1axo16GqT2vSL"}], "authType": "EMAILPASSWD", "code": "iMvcu39YZJypWzpN", "country": "XgnoKIz8O8NglJtZ", "dateOfBirth": "Th280vflFMxIhlIT", "displayName": "8AgyZJ16MMd2bzOr", "emailAddress": "Tn2huwPgyUzBUWiK", "password": "oNGtvyk5xEfrJDxK", "passwordMD5Sum": "sw5Xl7ZZrDZdbuvC", "reachMinimumAge": false, "uniqueDisplayName": "BaVcohewKkVuGv9f", "username": "QXkErF0drbYrrFQP"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminCreateUserV4' test.out

#- 354 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["3UKGpvC1cr5T1PSX", "hduTWchzXDv3TAtB", "jP4HSuiYCbG0UyYU"]}' \
    > test.out 2>&1
eval_tap $? 354 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 355 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["JmNL8p6AbdtU0CDr", "lQpKB8qoel2QK3aS", "OYdmMDikc3Fjm9Ho"]}' \
    > test.out 2>&1
eval_tap $? 355 'AdminBulkCheckValidUserIDV4' test.out

#- 356 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QDemtiQvURYZCeF3' \
    --body '{"avatarUrl": "0RT9rBgM8o7lxXq7", "country": "TkdM7FVDCBcvVegr", "dateOfBirth": "ZddP8lLQo6tHj4z4", "displayName": "cAM4LMJfWNZIxAgB", "languageTag": "peubprKX68jTyRd3", "skipLoginQueue": true, "tags": ["8hlDoC9FnxqBlPBY", "J7X6uVy7FWTSfMi2", "CPVGxjcdpdCqVeeP"], "uniqueDisplayName": "MSqb8y8qJTUQY40Z", "userName": "rpn0vAD9YsPeDWrA"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminUpdateUserV4' test.out

#- 357 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VQZSvgWuCuLsUGrV' \
    --body '{"code": "QAbhS54ZuQHKersD", "emailAddress": "mJLUHAKtfXCKOna8"}' \
    > test.out 2>&1
eval_tap $? 357 'AdminUpdateUserEmailAddressV4' test.out

#- 358 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DdjtZhh6ofsUoRh6' \
    --body '{"factor": "r0e0J6vyqPw7YlmV", "mfaToken": "3kES0Hi88UYgSV40"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminDisableUserMFAV4' test.out

#- 359 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OvY7apPCrN5bEhmu' \
    > test.out 2>&1
eval_tap $? 359 'AdminGetUserMFAStatusV4' test.out

#- 360 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HgKeWizEpw1zN0mO' \
    > test.out 2>&1
eval_tap $? 360 'AdminListUserRolesV4' test.out

#- 361 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YgGhHMz9dddLWJWD' \
    --body '{"assignedNamespaces": ["uSYtCaIv4Lp91wYU", "JPbvzn8TYoMDAaUX", "SuBQdvdhJoT0WK5n"], "roleId": "gNUxDKfZYofPGUbS"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateUserRoleV4' test.out

#- 362 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aA00nKxQjYU6Klav' \
    --body '{"assignedNamespaces": ["IiLxU2I1GyJS48Hx", "u8Ju4XSAnlXRYB9B", "gSZBvkehRn83B0nr"], "roleId": "W1qx3NJTugVWXz8d"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminAddUserRoleV4' test.out

#- 363 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'v7BiEUqnzxs2deMF' \
    --body '{"assignedNamespaces": ["8UAJIHEZv5zyUUyN", "JkvA5xF3zHtZSd3Q", "zXhkrN4pWryt4XTN"], "roleId": "wpp0ni1YfIgLZ4YI"}' \
    > test.out 2>&1
eval_tap $? 363 'AdminRemoveUserRoleV4' test.out

#- 364 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '53' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 364 'AdminGetRolesV4' test.out

#- 365 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "ilX1e1825iasunES"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminCreateRoleV4' test.out

#- 366 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'jcgr2drXG5NkKCyS' \
    > test.out 2>&1
eval_tap $? 366 'AdminGetRoleV4' test.out

#- 367 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'LA8cKCs0dFYRSa2O' \
    > test.out 2>&1
eval_tap $? 367 'AdminDeleteRoleV4' test.out

#- 368 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'ULZ0iOZJiOAh1SpL' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "roleName": "F2Pav11FuU8iXCRz"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminUpdateRoleV4' test.out

#- 369 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId '8KgqgwijYxpGhsFA' \
    --body '{"permissions": [{"action": 36, "resource": "xul6VKYlNYYlHPwK", "schedAction": 61, "schedCron": "Mjr5M3vw1GqUjjFp", "schedRange": ["6R8mYZwKftVqSECs", "ypS42NmYQ8HlHbHn", "fs4tLVOYQCWMktmi"]}, {"action": 76, "resource": "LHjtgE2bTXJxCCFq", "schedAction": 85, "schedCron": "WdoleYNHXeOpaRDw", "schedRange": ["YLge851PbK2MFKvw", "5TWjAh4gy41LLzQ2", "IjY5PeNr4JmYxH2q"]}, {"action": 37, "resource": "zCYRVmbfzwUmsy0s", "schedAction": 39, "schedCron": "PNI9f2oLWDPSZexf", "schedRange": ["KVxqdxmh5QWxuQuI", "7gdDTDb3WdnOpzTr", "RzCCafADJfWBspT3"]}]}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateRolePermissionsV4' test.out

#- 370 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'MLwJZquMQSPp5XD4' \
    --body '{"permissions": [{"action": 92, "resource": "j3WnyAaUaQBKFedL", "schedAction": 56, "schedCron": "uduXvZUbQQ13FhD3", "schedRange": ["NExUFipJsUiDawAj", "gHFQk0VzWRNFNiUn", "2yXMSCcHADYpS861"]}, {"action": 5, "resource": "LRj306RDuaSixXEd", "schedAction": 24, "schedCron": "6yrnvXY5dDwneac7", "schedRange": ["5C6S2eHsH4Y84hL7", "5QboMHCtzEF9FSeg", "6WYgtfuqJHrs4e3R"]}, {"action": 28, "resource": "IeySoUxoMrj2J4JG", "schedAction": 88, "schedCron": "qSbMq4GLj8aGsH0q", "schedRange": ["E5p601ak59yFSfdZ", "Iv8oYWPUS4Zu0SbT", "t6M2XizikCh6q0yq"]}]}' \
    > test.out 2>&1
eval_tap $? 370 'AdminAddRolePermissionsV4' test.out

#- 371 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId '2WAHtL7IWE3MFqvf' \
    --body '["DG5jvMOaXrDlEX42", "U0syrGNhBmgT2q0k", "IbrJ2S5Pf1Lvg8kY"]' \
    > test.out 2>&1
eval_tap $? 371 'AdminDeleteRolePermissionsV4' test.out

#- 372 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'EVylINJpxFY8E6pU' \
    --after '8eHjh0aTjIOaQt0s' \
    --before 'nbE0yMvqF7TJ9uB0' \
    --limit '51' \
    > test.out 2>&1
eval_tap $? 372 'AdminListAssignedUsersV4' test.out

#- 373 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'hMXxiKR29LKIhNU4' \
    --body '{"assignedNamespaces": ["3K8bihdw3prp0UHl", "WUxkBefhxRtrqbv5", "6oqwnCLVc2qHZuue"], "namespace": "dbBOd19DqZJRYV1o", "userId": "qNLmPAUIMwa2wYq6"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminAssignUserToRoleV4' test.out

#- 374 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'DsUq38bYvaWLoKzH' \
    --body '{"namespace": "nngdfFnOfY9stXH6", "userId": "LYXXMndxBPKmHVB7"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminRevokeUserFromRoleV4' test.out

#- 375 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["cNzHhvxc4xAPZ86W", "NnQOhusPn4466u8a", "gb5HPsBU0Eo6QJ9v"], "emailAddresses": ["BRJ4UP09fabC01Th", "m9f4AWpyiKVT3OvE", "ujx5yjtQSCJaOHzp"], "isAdmin": false, "isNewStudio": false, "languageTag": "623EciYoYOPVg6DL", "namespace": "EZ6DxpwBm2N8PdQ5", "roleId": "mQaGXEbnmWR0H3Ek"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminInviteUserNewV4' test.out

#- 376 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "rHqaLNdfKszYZzOg", "country": "113h6fIaHSx5bClx", "dateOfBirth": "UOBmMwv5pmiIVnhl", "displayName": "LoMemsp7o3F2LQw7", "languageTag": "Y2VdSxgXez7VvS0C", "skipLoginQueue": false, "tags": ["JLVQQPa7PPx4Zi6W", "aC8wk7HMbJhNwZgf", "5nlMDORYuXnPNJga"], "uniqueDisplayName": "yPFcyUnKXA3mcyMm", "userName": "X6WF8jtNAVOYqSH5"}' \
    > test.out 2>&1
eval_tap $? 376 'AdminUpdateMyUserV4' test.out

#- 377 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "33YlJ93CCGBXv4fP", "mfaToken": "4VPzhcH4UJrrCKvr"}' \
    > test.out 2>&1
eval_tap $? 377 'AdminDisableMyAuthenticatorV4' test.out

#- 378 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'OAi7lMgkVWJYzSCI' \
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
    --body '{"factor": "DxWUxgOzeRNHIqK5", "mfaToken": "PT404mFw4HJv5T2k"}' \
    > test.out 2>&1
eval_tap $? 382 'AdminDisableMyBackupCodesV4' test.out

#- 383 AdminDownloadMyBackupCodesV4
eval_tap 0 383 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 AdminEnableMyBackupCodesV4
eval_tap 0 384 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'IQOecfLsYKTmUnKl' \
    > test.out 2>&1
eval_tap $? 385 'AdminGetBackupCodesV4' test.out

#- 386 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'rOsJmEwjGYN8VNPX' \
    > test.out 2>&1
eval_tap $? 386 'AdminGenerateBackupCodesV4' test.out

#- 387 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'NsmwTV8imJHNI0l6' \
    > test.out 2>&1
eval_tap $? 387 'AdminEnableBackupCodesV4' test.out

#- 388 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'jJVzF1Oi2sQuWUBB' \
    --factor 'HZonSmzF831vlCiZ' \
    > test.out 2>&1
eval_tap $? 388 'AdminChallengeMyMFAV4' test.out

#- 389 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'AZHCWMXxVh8HTrKq' \
    --languageTag 'VwnpPn8N5xMRgU7c' \
    > test.out 2>&1
eval_tap $? 389 'AdminSendMyMFAEmailCodeV4' test.out

#- 390 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "PqNZrLCRRUysya4J", "mfaToken": "3rvTzMTMSwrNov2G"}' \
    > test.out 2>&1
eval_tap $? 390 'AdminDisableMyEmailV4' test.out

#- 391 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'W9i54JY23AUWFTLq' \
    > test.out 2>&1
eval_tap $? 391 'AdminEnableMyEmailV4' test.out

#- 392 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 392 'AdminGetMyEnabledFactorsV4' test.out

#- 393 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor '0W1JqwKs1mO80L7I' \
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
    --clientId 'OHlf6j8PZOzUiQKZ' \
    --linkingToken 'qz5NSp0B7LODN3Bo' \
    --password 'i2sSAO2n4MZQt753' \
    --username 'XQB93rOW0guPoQbY' \
    > test.out 2>&1
eval_tap $? 397 'AuthenticationWithPlatformLinkV4' test.out

#- 398 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'zc1RDVhs2lhdzxxg' \
    --extendExp  \
    --linkingToken 'ibuqUuyW3cMz9Yyd' \
    > test.out 2>&1
eval_tap $? 398 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 399 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'uMomEHcU15St4v8r' \
    --factor 'y8IyqNVv0KVpXJTM' \
    --mfaToken 'x3Y8Um1iqehObg3O' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 399 'Verify2faCodeV4' test.out

#- 400 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'Z9j0HDtbqMFlgHKQ' \
    --codeChallenge 'IRtLfPngD83roOeq' \
    --codeChallengeMethod 'plain' \
    --additionalData 'vN8pRGoUtmbWZbEj' \
    --clientId 'Pyq35BWDoc3qNcQF' \
    --createHeadless  \
    --deviceId 'FyHv141NPqjRUMKS' \
    --macAddress 'QjFdjqTaZFsWzbqw' \
    --platformToken 'TZQIN5jC6a8mEVCX' \
    --serviceLabel '0.5385601258843681' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 400 'PlatformTokenGrantV4' test.out

#- 401 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'mFnrSL0PJcZQaCeN' \
    --codeChallengeMethod 'S256' \
    --simultaneousPlatform 'YxMID9pqZ5rryiMM' \
    --simultaneousTicket 't6fQtLhzylaquioT' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'i8ZDPXRL8cbTAntB' \
    > test.out 2>&1
eval_tap $? 401 'SimultaneousLoginV4' test.out

#- 402 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge '1STaab1UeibXg7RC' \
    --codeChallengeMethod 'S256' \
    --additionalData 'PhoNZlXMef7AvS3T' \
    --clientId 'fKx6ByTygbtOtcQS' \
    --clientSecret '4Cmgw1wRUnIVYxY6' \
    --code 'OhdkrYiCinoVOzo4' \
    --codeVerifier 'Plv1IlTpEhjTFYdz' \
    --extendNamespace 'sUNvQAn2LuMjLqwm' \
    --extendExp  \
    --loginQueueTicket 'Vz3zKsfjz1mFkyxo' \
    --password 'UzfMFoXCOguSq2A4' \
    --redirectUri 'R3wDdSkNfHJtA3Qi' \
    --refreshToken 'X9ZvtydbaVb0scd9' \
    --scope '7A0GP6djn2Ps3IVT' \
    --username '5hUZ3cnDq0ddZG0E' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 402 'TokenGrantV4' test.out

#- 403 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'T7uvqarTvrG1DXZA' \
    --code 'Wlvz3c3XALMresGF' \
    > test.out 2>&1
eval_tap $? 403 'RequestTargetTokenResponseV4' test.out

#- 404 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fsH4aXCDhshvEF8r' \
    --rawPUID  \
    --body '{"pidType": "Hd250nyihcUVGHQc", "platformUserIds": ["zI5ZoTRUkjGoRkPs", "2SO9XrgXNIaU11cB", "XLwTfopqeZtHJnRg"]}' \
    > test.out 2>&1
eval_tap $? 404 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 405 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'aGfLMFbvyI5PZGzV' \
    --platformUserId 'LcmZKKKYARape2ts' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserByPlatformUserIDV4' test.out

#- 406 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "czam4Cdd1QYvww4X", "policyId": "Dokltgq2vXtUnY6U", "policyVersionId": "hDJ4pe0s0Cuhl3dU"}, {"isAccepted": false, "localizedPolicyVersionId": "b4seYCyiB4tDCWx3", "policyId": "cEX8wTi1v2abpCWy", "policyVersionId": "tPEi9Ze0hL9rPkV5"}, {"isAccepted": false, "localizedPolicyVersionId": "KoZQPLhDSJx9jzxa", "policyId": "RKph4kiIFgS4fLql", "policyVersionId": "rKGiS3XxjkyNfj3X"}], "authType": "EMAILPASSWD", "country": "aXgQ94flh775AQfz", "dateOfBirth": "NjQ7IuMSY2epRDJj", "displayName": "DyMDKQhuTjtQZyIi", "emailAddress": "AmCL8bNTTfqLCv9D", "password": "YBOProN4UWbQaKFr", "passwordMD5Sum": "Tv4JWElmOCxqPrq9", "uniqueDisplayName": "I3XJWBxTLcOef8Mg", "username": "IwkrKFEtwESJCe2k", "verified": true}' \
    > test.out 2>&1
eval_tap $? 406 'PublicCreateTestUserV4' test.out

#- 407 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "3nZE13H2fILFzOlA", "policyId": "ZbDQAEJLbVWH2XLI", "policyVersionId": "g3MgmdSvWp3h0xPs"}, {"isAccepted": true, "localizedPolicyVersionId": "Y8qNwB2TY4v9NNfQ", "policyId": "SYLFKSl3FNFFJnt3", "policyVersionId": "rIwZdW02Su6aCnL8"}, {"isAccepted": false, "localizedPolicyVersionId": "6aH6gOBUIMeL0GL3", "policyId": "aefSDME8X2MxILI4", "policyVersionId": "2BJMPkZmay4Csye3"}], "authType": "EMAILPASSWD", "code": "tyhiSGhfqXhxBJ7z", "country": "LXioAGkWgSDdDQvp", "dateOfBirth": "RfGe3z2rtjWpJAlK", "displayName": "HF0ebxhJ1176CeD4", "emailAddress": "dWCp4wqlQJcZroNQ", "password": "iefBnPluOIjZyvlG", "passwordMD5Sum": "DQGv6pNNowEuVVZM", "reachMinimumAge": true, "uniqueDisplayName": "aNDFeKnQP2j2WsQI", "username": "mTwYkiuxzLrbJ0Bk"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicCreateUserV4' test.out

#- 408 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'GzCNgesQlZZHIZH0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "Z1OH5Nn4nMT8QOyT", "policyId": "uUSD9ImtaPAocOQc", "policyVersionId": "pBWSNrCjSNEAdojk"}, {"isAccepted": true, "localizedPolicyVersionId": "vCPrrZCTU5WUJizF", "policyId": "69PSsquWUafwbFPX", "policyVersionId": "15633pFgA7i9tqvf"}, {"isAccepted": false, "localizedPolicyVersionId": "mFvUZiUW5Y0CYw5O", "policyId": "XSGwQkJuy9oLFcHH", "policyVersionId": "craLXR2n9JQvq7NK"}], "authType": "EMAILPASSWD", "code": "IHYsii3fCh7sieJj", "country": "ZPAkiWumllU31uXP", "dateOfBirth": "wYxedGHCIkmt4bfJ", "displayName": "OhNaIT0pv7XeqO8g", "emailAddress": "Y3c4SryWB4yRaDxv", "password": "xwaLM8HkVOW8PnLk", "passwordMD5Sum": "gqkqYZWPZTgKagTz", "reachMinimumAge": false, "uniqueDisplayName": "ilcKA84d9pMsl7zr", "username": "NJvDiP2hNNEI8QrQ"}' \
    > test.out 2>&1
eval_tap $? 408 'CreateUserFromInvitationV4' test.out

#- 409 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "6H1ro5CtU8UjgyCU", "country": "pM1JBcTzf4dz1Boj", "dateOfBirth": "PoQg976409vFd5z9", "displayName": "r4nJWUvLp1wxGF74", "languageTag": "7468MXUq3uIffkIp", "uniqueDisplayName": "PmrWVxNZUvkiU2jX", "userName": "SwsBBRopVl38d4NZ"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicUpdateUserV4' test.out

#- 410 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Gtk6EmWxC75M88TK", "emailAddress": "hFYkA9aRNDe2IoPM"}' \
    > test.out 2>&1
eval_tap $? 410 'PublicUpdateUserEmailAddressV4' test.out

#- 411 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "SQKcg0OTT9JA0ll1", "country": "RimBCiQwuyrI87uS", "dateOfBirth": "yXP6C0jXS8au2wcW", "displayName": "Yyj3JvHqXp4JR7xI", "emailAddress": "59Z9tfGVsglnOxOX", "password": "BfgBLuglkd9LIosh", "reachMinimumAge": false, "uniqueDisplayName": "fJOPYpnPqGlPnhBD", "username": "OWqDU8N3DjVUt0n0", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 411 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 412 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "WzCgMMWZuD6tmIR2", "displayName": "8xVxbtpSKOfiIP3S", "emailAddress": "6pypZqISn3msrykQ", "password": "FtW8QGKFZLrIfqrZ", "uniqueDisplayName": "uu7IwKcT7sAsv2TK", "username": "CbYMVkXEHmsHwIGG"}' \
    > test.out 2>&1
eval_tap $? 412 'PublicUpgradeHeadlessAccountV4' test.out

#- 413 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "susS0zZRODEKPdud", "mfaToken": "ZsLaf8aZrXW84dt0"}' \
    > test.out 2>&1
eval_tap $? 413 'PublicDisableMyAuthenticatorV4' test.out

#- 414 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'TSTmy7XF26K2U7xt' \
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
    --body '{"factor": "tUz8nWKJjv06Puff", "mfaToken": "HghAQfAsYXVzBenL"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicDisableMyBackupCodesV4' test.out

#- 419 PublicDownloadMyBackupCodesV4
eval_tap 0 419 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 420 PublicEnableMyBackupCodesV4
eval_tap 0 420 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 421 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'taAoYyRfiCWrm3s1' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetBackupCodesV4' test.out

#- 422 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'Ah3TII70MIcBMJ04' \
    > test.out 2>&1
eval_tap $? 422 'PublicGenerateBackupCodesV4' test.out

#- 423 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag '508jKedx0CVRpd7S' \
    > test.out 2>&1
eval_tap $? 423 'PublicEnableBackupCodesV4' test.out

#- 424 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'wZw2UkjDzJ4NuMMg' \
    --factor 'I13nplXaUQV5QEvK' \
    > test.out 2>&1
eval_tap $? 424 'PublicChallengeMyMFAV4' test.out

#- 425 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'ElLfbB7gwwAR1xFr' \
    > test.out 2>&1
eval_tap $? 425 'PublicRemoveTrustedDeviceV4' test.out

#- 426 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'nyirw3iJt5iA3JS2' \
    --languageTag 'xeaJ08JrSHPqdhKH' \
    > test.out 2>&1
eval_tap $? 426 'PublicSendMyMFAEmailCodeV4' test.out

#- 427 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "n6ZjZMdr1C2TIQzR", "mfaToken": "JY7UfYSrdN0JVz4U"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicDisableMyEmailV4' test.out

#- 428 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code '43EcV1FRyeeqehMN' \
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
    --factor 'eRYKeMbL0G4v5D6y' \
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
    --userId 'lZguO918X7rLoexH' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 434 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "BMBMMAYokSWFwajR", "emailAddress": "GUyklfLVY6g3PO4h", "languageTag": "KAeF4GUV5m96qcCJ", "namespace": "sVOWtu5RPsqd66Im", "namespaceDisplayName": "BEuhnaxZVf6MD9r1"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicInviteUserV4' test.out

#- 435 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "XzoIXNf0KbL9HyJt", "policyId": "tdgfLGO3ummpllnV", "policyVersionId": "6B62P1Kazg73c6Up"}, {"isAccepted": false, "localizedPolicyVersionId": "WyK02w5QytAmkanu", "policyId": "kAzAMaRvIUhUwguG", "policyVersionId": "gbLLN3O7CEYjxqEl"}, {"isAccepted": false, "localizedPolicyVersionId": "lA2FJ0iGLRTXGsC5", "policyId": "mxxse4eeuMgEctVE", "policyVersionId": "ux2MSuwsEHlwdeJy"}], "code": "hsHS6YqPudWviQsU", "country": "LL1txfX9tqFSkGXo", "dateOfBirth": "IcFN5JL9M53Mg0Mz", "displayName": "WS9usxxnMhjv66Dy", "emailAddress": "ED4prRVibTATxd7M", "password": "zjv1gSj8kcNhoqcR", "reachMinimumAge": false, "uniqueDisplayName": "NATojM7daV0VwR3y", "username": "NKDtMqMrAGpdyF6W", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 435 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE