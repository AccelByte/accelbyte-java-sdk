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
    --skipLoginQueue  \
    --startDate 'WydXV0Fi02aFr8CD' \
    --tagIds 'apjwNOl4k8rVNrm8' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 176 'AdminSearchUserV3' test.out

#- 177 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["drv8QD2JOe2Ntz7E", "FvowPgIGuetxFMqX", "CQMAqQ2ZRGzNtrTh"]}' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetBulkUserByEmailAddressV3' test.out

#- 178 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fa9XU8mosluiHZJ7' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetUserByUserIdV3' test.out

#- 179 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'O8sAQ32wj9uaDzsr' \
    --body '{"avatarUrl": "9xYiWRuuzQJiLc1e", "country": "I9w3JEhxPGbEk7s7", "dateOfBirth": "gw07FlounC3vJKBC", "displayName": "7SwgoViPeIB4Ehy0", "languageTag": "Y5aSJVDginxAM77e", "skipLoginQueue": false, "tags": ["C14FbfiI2NPvl1kC", "Y5bEokxXxkWZbjf7", "GZxaossQmjo69woh"], "uniqueDisplayName": "JFyTNk5FGUPhR4LE", "userName": "Zvz3EjFR7996Ug5m"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserV3' test.out

#- 180 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4axDV5uTcYsoahUr' \
    --activeOnly  \
    --after 'ELQ1btjJOqQMgZWA' \
    --before 'U6E92nHJzvw7tnYt' \
    --limit '66' \
    > test.out 2>&1
eval_tap $? 180 'AdminGetUserBanV3' test.out

#- 181 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JBrHRzEOtIxzPqb6' \
    --body '{"ban": "n73m0jiaDH86d9rs", "comment": "KgzCsMulpB8HZUtV", "endDate": "VaJCiLgKOwrSfWhT", "reason": "5B4WedopzwSluBtR", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 181 'AdminBanUserV3' test.out

#- 182 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ThyGnbjmPDKFS6u9' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserBanSummaryV3' test.out

#- 183 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'FHuv1M3qfch4SqIV' \
    --namespace "$AB_NAMESPACE" \
    --userId '6LQPHlaeYl4csFq6' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateUserBanV3' test.out

#- 184 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tyl1HeT7VEPgG40Q' \
    --body '{"context": "yXzsOzgck078Igho", "emailAddress": "QBp2mWAOYksczxBS", "languageTag": "0OBCa2vWadLmQtYK", "upgradeToken": "mEMzicbuL2S3RiW8"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminSendVerificationCodeV3' test.out

#- 185 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dLTCBfGUdVEdvdQL' \
    --body '{"Code": "7sVwcZ2PofaJoSqt", "ContactType": "rEOqxH46fRTSZoDd", "LanguageTag": "T0fefo74eg3Nt2c0", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 185 'AdminVerifyAccountV3' test.out

#- 186 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'dpPRMDbUXBWTbpAo' \
    > test.out 2>&1
eval_tap $? 186 'GetUserVerificationCode' test.out

#- 187 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gG2wlZkLhuU5FI8N' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserDeletionStatusV3' test.out

#- 188 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ijFI0GKwJ3vfXlsA' \
    --body '{"deletionDate": 79, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserDeletionStatusV3' test.out

#- 189 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'y2Zp2UAGxHnmSxvk' \
    > test.out 2>&1
eval_tap $? 189 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 190 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'G9UR5q9neoW6JBcG' \
    --body '{"code": "p9Rx2RfcRhXpmeeH", "country": "dvphas9S7ivHEoLb", "dateOfBirth": "UMM47f1UreUpxEkX", "displayName": "IbE1ETzRJZKMavu4", "emailAddress": "Ul2IaieEbPSE7TGk", "password": "eHsYsW9oGBN1pYMB", "uniqueDisplayName": "wbPZTlMlUvFEiGpr", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpgradeHeadlessAccountV3' test.out

#- 191 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rF35anDGvur19V18' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserInformationV3' test.out

#- 192 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oIrUKXttgAI2QdWJ' \
    --after '0.5102327708152686' \
    --before '0.6000937304705664' \
    --limit '24' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserLoginHistoriesV3' test.out

#- 193 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'f28uYbe4Cf2HEHvV' \
    --body '{"languageTag": "evhISjbtBJUK5fE3", "mfaToken": "OufPSX3PdOU2V9yw", "newPassword": "94oa8UJ34TIedV3H", "oldPassword": "yoX4VnO2LpBU08wf"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminResetPasswordV3' test.out

#- 194 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nlHBXFIqFUmgUSMM' \
    --body '{"Permissions": [{"Action": 49, "Resource": "au8GJT0mkVPI6zUt", "SchedAction": 11, "SchedCron": "dsK9dCEzhVnOv0PQ", "SchedRange": ["bVIaKiHfoeorY7A1", "otGFyv2SMjbEr50q", "GdCZIc6EFqBKxbS7"]}, {"Action": 86, "Resource": "8rKrKEPGSAcong6e", "SchedAction": 81, "SchedCron": "ZZBmOau6syme06c6", "SchedRange": ["SKLc2mEC3IXl5XCb", "kOfHaGr5kdazlypv", "t6lSLfU7HByGXPMq"]}, {"Action": 49, "Resource": "4GUOnXpapXQGRakU", "SchedAction": 2, "SchedCron": "Odyjqf6Q4oiwoJca", "SchedRange": ["RMEb15LBlTVufc5Z", "yODR2NVyn4PRqf3e", "RbZqBAoKGcVCdMiS"]}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminUpdateUserPermissionV3' test.out

#- 195 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NV4qBrt1kcLmRv6E' \
    --body '{"Permissions": [{"Action": 74, "Resource": "rgroixptZhckUTGk", "SchedAction": 4, "SchedCron": "mNWVIJnhhwFDV1Vi", "SchedRange": ["taomvWTzdsW4N70w", "YS4Kj7Yi2VvoQNW8", "Yc481dYdvGxJAMDR"]}, {"Action": 55, "Resource": "wMUSuC3Bajy3BcEM", "SchedAction": 58, "SchedCron": "BCV9qJhWva2FPBuj", "SchedRange": ["X0geYCpGJM4sqsPN", "JMiZXXOFwmGWAvNF", "0Z0GkwxUNYyNwGiK"]}, {"Action": 35, "Resource": "nignE7KcMF7fuDbz", "SchedAction": 89, "SchedCron": "sFiQHglUQMZi5WjM", "SchedRange": ["ZfOadpgegCUjTdi1", "Ehr8OtqpNJ9R8TuN", "y4ejmVA3vMCsGyPd"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserPermissionsV3' test.out

#- 196 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '12B8QNUz0hFFNbH6' \
    --body '[{"Action": 19, "Resource": "u9oTc8pVkiyGsj5J"}, {"Action": 7, "Resource": "5D0oiFchQnVeq3g2"}, {"Action": 53, "Resource": "bJBTsvsw76uISRX0"}]' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserPermissionBulkV3' test.out

#- 197 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '2' \
    --namespace "$AB_NAMESPACE" \
    --resource 'Z0W4XmWP0HzSdiyl' \
    --userId 'LhVYszm8xY33OQbu' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserPermissionV3' test.out

#- 198 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mu2QHLyZNuysyM4O' \
    --after 'fCzdQCXMAWnf87YP' \
    --before 'NOe9Eevf1fhMg1E2' \
    --limit '21' \
    --platformId 'jxvNZhM84DiZk6yS' \
    --targetNamespace 'rB9SVFctW7YS0OkL' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserPlatformAccountsV3' test.out

#- 199 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '78XeEAtALFI3v8yh' \
    --status 'a4pd5A7MYcpBD6lK' \
    > test.out 2>&1
eval_tap $? 199 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 200 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nb8RxvN2u5J7baOe' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetListJusticePlatformAccounts' test.out

#- 201 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'LH19fqBwNbNe1ffY' \
    --userId 'RtIvQaKyevWYtZjK' \
    > test.out 2>&1
eval_tap $? 201 'AdminGetUserMapping' test.out

#- 202 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '6J29v8MpBSpo3AKR' \
    --userId 'mnJkzJHAckUyBksY' \
    > test.out 2>&1
eval_tap $? 202 'AdminCreateJusticeUser' test.out

#- 203 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'QfDm0RNFwiz70tRV' \
    --skipConflict  \
    --body '{"platformId": "LMlHi8i9gOVqajUW", "platformUserId": "rgEsWDtaKzn8dZwn"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminLinkPlatformAccount' test.out

#- 204 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nGeZsZVgbPzPFbrO' \
    --platformId 'MZMgWkFN7Tpkx6Gc' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetUserLinkHistoriesV3' test.out

#- 205 AdminPlatformUnlinkV3
eval_tap 0 205 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 206 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fyOg6ZUrrp9ubg9m' \
    --userId 'ndW2JKmQafUs2bxY' \
    > test.out 2>&1
eval_tap $? 206 'AdminPlatformUnlinkAllV3' test.out

#- 207 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ztOEyVbKIf1ZbzgU' \
    --userId 'wd8DHoCQykmXHYmk' \
    --ticket 'Rlg7gYs6unPYQ9jN' \
    > test.out 2>&1
eval_tap $? 207 'AdminPlatformLinkV3' test.out

#- 208 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 208 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 209 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QN1di1ldhOh6Hvjn' \
    --userId 'YuV7NfC4A2ODiZhb' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 210 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fb8QqCyK1XH9D6vl' \
    --userId '5eFdFfgK46GjCWaP' \
    --platformToken '8huTmnq3FGQn3Ahu' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 211 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId '5wxq6oJq4mChmQHQ' \
    --userId 'hO9IKBXDFQfXFD58' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 211 'AdminGetUserSinglePlatformAccount' test.out

#- 212 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sG6uDhFYlrzJBYSe' \
    --body '["MuJfQecutjS029Bi", "JWOG1m7MKclr5igj", "NTVItrH2X78hxJga"]' \
    > test.out 2>&1
eval_tap $? 212 'AdminDeleteUserRolesV3' test.out

#- 213 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vfw5Vnyq8OzTE89W' \
    --body '[{"namespace": "DNoMcOmbfJrCJQIj", "roleId": "1haAosKglqaCXE9y"}, {"namespace": "tpIO8btO3OwNEGSW", "roleId": "5TaW4to7QCY2NGGv"}, {"namespace": "i9kg3rMIzNmhJTNQ", "roleId": "jKlwjfJ3TJ2xVpge"}]' \
    > test.out 2>&1
eval_tap $? 213 'AdminSaveUserRoleV3' test.out

#- 214 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '70WsLfgbZieRvJI5' \
    --userId 'sT9DH3DfLCv8q4Th' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddUserRoleV3' test.out

#- 215 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'mq09bBgPAYxrBE9j' \
    --userId 'lnTgtgW33wDwD9RK' \
    > test.out 2>&1
eval_tap $? 215 'AdminDeleteUserRoleV3' test.out

#- 216 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vQX4yFQFdrRoM6Fo' \
    > test.out 2>&1
eval_tap $? 216 'AdminGetUserStateByUserIdV3' test.out

#- 217 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qCYw7AlxO6qdFpc7' \
    --body '{"enabled": true, "reason": "sSck3ggZWJlSlCQM"}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateUserStatusV3' test.out

#- 218 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dji329PfVrvMEPtp' \
    --body '{"emailAddress": "sSNcpK1QkB2Sy8Ww", "password": "79LVeVskqeUB7RSa"}' \
    > test.out 2>&1
eval_tap $? 218 'AdminTrustlyUpdateUserIdentity' test.out

#- 219 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yqGFguhh3bvadRth' \
    > test.out 2>&1
eval_tap $? 219 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 220 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'dbVApebRA09rW8i8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "krFWJhe03coRFok5"}' \
    > test.out 2>&1
eval_tap $? 220 'AdminUpdateClientSecretV3' test.out

#- 221 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'd3AyGrZO8GuoXNSo' \
    > test.out 2>&1
eval_tap $? 221 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 222 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'VEBG7VbBPUWipz9C' \
    --before '05YabFX4FCK5ucTF' \
    --isWildcard  \
    --limit '37' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRolesV3' test.out

#- 223 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "managers": [{"displayName": "zaO3yJpA3KMxBlrR", "namespace": "ytER1qdTelFAadM9", "userId": "y66Drf4SSGGt3MiB"}, {"displayName": "Kohow3kKoaP1K4CD", "namespace": "uH1mMIfOCDyVAHrH", "userId": "ncR5dShqiBUI9esS"}, {"displayName": "sXegSEhrPpK2q8kx", "namespace": "R4BuEksS2A9VOA8H", "userId": "9VeHv0L2Acm960EY"}], "members": [{"displayName": "QEuGJVl8xs1WId9W", "namespace": "lalqshF9Rh2o7GCQ", "userId": "GPCxwEdkyuT3MgzR"}, {"displayName": "eRq0112ISArROIod", "namespace": "cmM6v2AEozWWaYvB", "userId": "LE46bpuJip8JyxJ3"}, {"displayName": "9vrtuWWrqTZbSqBS", "namespace": "Kp8AmgwhYzk33J34", "userId": "fiTxK63OHpnUCGBV"}], "permissions": [{"action": 11, "resource": "WSgxpKWtdtdtVW9a", "schedAction": 28, "schedCron": "o1J5euLAbBgejqc0", "schedRange": ["apxqZ209BySn8aUa", "GlAyvIslt7N1qcxK", "s4nlf1MfqUZXkjHv"]}, {"action": 5, "resource": "jz2xUKLNWSmYyVvy", "schedAction": 8, "schedCron": "JssShBKsQjXvfQgQ", "schedRange": ["Dt6ce8NDMErA82Fr", "R1GSogkewIzTOqKk", "cjRh3l2gAJOTCbx7"]}, {"action": 72, "resource": "ApdJDnE73GLmSZns", "schedAction": 15, "schedCron": "owBhoUg4LsGP6KLP", "schedRange": ["XkvUv2XiXaBzsmax", "jTZPlLitytGka7Kv", "5TacQKF4OlRGdmXx"]}], "roleName": "ETLEQrr3KCAV9alq"}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateRoleV3' test.out

#- 224 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId '3hK1G4kKooSNNUZu' \
    > test.out 2>&1
eval_tap $? 224 'AdminGetRoleV3' test.out

#- 225 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'iynZ64IwncZPk82G' \
    > test.out 2>&1
eval_tap $? 225 'AdminDeleteRoleV3' test.out

#- 226 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'F3eTC0vzZUDj9dzG' \
    --body '{"deletable": false, "isWildcard": false, "roleName": "GVxo9OHgfHumyfuB"}' \
    > test.out 2>&1
eval_tap $? 226 'AdminUpdateRoleV3' test.out

#- 227 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'NisecYbcOpR45VDl' \
    > test.out 2>&1
eval_tap $? 227 'AdminGetRoleAdminStatusV3' test.out

#- 228 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'vSc0Mr7ImwCwGqOf' \
    > test.out 2>&1
eval_tap $? 228 'AdminUpdateAdminRoleStatusV3' test.out

#- 229 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '0bNs97KvKyj3MqS7' \
    > test.out 2>&1
eval_tap $? 229 'AdminRemoveRoleAdminV3' test.out

#- 230 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'Dcmtfh50eObbrmgj' \
    --after 'hWK0x0ZidAJ1CU1e' \
    --before 'D1La16Bw3JbUnUDh' \
    --limit '89' \
    > test.out 2>&1
eval_tap $? 230 'AdminGetRoleManagersV3' test.out

#- 231 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'yGjjv4Mwrv2vancm' \
    --body '{"managers": [{"displayName": "R6Z7rb21A2E9pX0B", "namespace": "WCMqPsRk5htdM5T3", "userId": "fDSrSHrkoqv2mM6s"}, {"displayName": "oMaTvQq2a9YdFNtR", "namespace": "VSO0js0hG9xmSnzd", "userId": "7zgUxAogcnGkXk17"}, {"displayName": "QPkJHRhmLKQuQVFS", "namespace": "KiXl8G2uf6E8EajX", "userId": "LSAS8MKMaxQ1QyJC"}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminAddRoleManagersV3' test.out

#- 232 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'pKedhuzI7G9NCKKX' \
    --body '{"managers": [{"displayName": "u1bqI2M5PmXfKnQ7", "namespace": "BYGjCUDMOrbmoRvW", "userId": "nfmGFy0eUoOBd90h"}, {"displayName": "9EDqSTOfoNewWjwM", "namespace": "WDKEt6JhbJ0fwTDa", "userId": "q6b5RpMwhWPtndri"}, {"displayName": "XU9loOxpmEuwDVc1", "namespace": "2r0DVUGgGHkapTCa", "userId": "fFMdvYiCBuzUUwyI"}]}' \
    > test.out 2>&1
eval_tap $? 232 'AdminRemoveRoleManagersV3' test.out

#- 233 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId '6Vtd4v9k4fv3kMiu' \
    --after 'Q3DhsKLxjt5srPFx' \
    --before 'BgpFtDBmTLH9kP9U' \
    --limit '78' \
    > test.out 2>&1
eval_tap $? 233 'AdminGetRoleMembersV3' test.out

#- 234 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId '3z6joBAhAlJGI2YY' \
    --body '{"members": [{"displayName": "b6ajBjgq6eY4PBNH", "namespace": "KPx62tHxDb06ZFy3", "userId": "uglSp2UxvF2uLXWi"}, {"displayName": "lRD7HD6LCgdFxRGj", "namespace": "00RT6LvcnGMJbJIY", "userId": "LssMvy9gkfTMRrXV"}, {"displayName": "RcAVRDX6gmDfNfPG", "namespace": "YYSTunMgt3C8hEgu", "userId": "CqlMHiQN3HWJw9zI"}]}' \
    > test.out 2>&1
eval_tap $? 234 'AdminAddRoleMembersV3' test.out

#- 235 AdminRemoveRoleMembersV3
eval_tap 0 235 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 236 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'WsiP2JQ24meDrwEu' \
    --body '{"permissions": [{"action": 93, "resource": "YaqYM7YfBmhjI9Y2", "schedAction": 34, "schedCron": "sh2x2ur2ccp7R7Oq", "schedRange": ["PqIjS4i0N9ytb3c8", "pVZ8GlU8962e6gtn", "5pUARJM1T8QwMNOA"]}, {"action": 52, "resource": "mzbajE2gjooiDnc1", "schedAction": 80, "schedCron": "5RNB5dVCsB7xL4ax", "schedRange": ["SPgPCiwLxCFLDixZ", "wVtt3RVTl0tR00oQ", "gcHdGGK3x76U1EIc"]}, {"action": 21, "resource": "F7RnP1oK3c4RVfjB", "schedAction": 53, "schedCron": "es36r1FgR70eNLHk", "schedRange": ["VrEFd8xArWJuCAIf", "NBSHgpFNw9K9pmAI", "c6VSfE9nbE2PMv12"]}]}' \
    > test.out 2>&1
eval_tap $? 236 'AdminUpdateRolePermissionsV3' test.out

#- 237 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'ZSRJkujxbCu1HFaj' \
    --body '{"permissions": [{"action": 93, "resource": "Vxs3GuA4S1dS7H7y", "schedAction": 70, "schedCron": "rp84qjwzWpCF1vya", "schedRange": ["mjsEzwtLPxK1os4q", "R8LaQzEb39sZTdFf", "C8x5aHLsXHlm1RJT"]}, {"action": 93, "resource": "TTq9ihZkvFKfSHQh", "schedAction": 71, "schedCron": "vifGHawNx6yhniEH", "schedRange": ["LbEQKc0aUvrKXDIj", "YC4df9qswSlpCI8D", "hjlxUyrs3OSesE5p"]}, {"action": 29, "resource": "DwUj2HKUvPYUcQBx", "schedAction": 78, "schedCron": "65Co0vdCk8so6JSa", "schedRange": ["ZAIadKDEZywonA2S", "rEdN2tmGuX6r0gBV", "UUeKKlPKtE6gnYxm"]}]}' \
    > test.out 2>&1
eval_tap $? 237 'AdminAddRolePermissionsV3' test.out

#- 238 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'kmCWbs5qugklBUS6' \
    --body '["uwWrCQt86Jrg8tLA", "JWpcyNkUvqn6eXr6", "FNbKJ05Orya6LSSU"]' \
    > test.out 2>&1
eval_tap $? 238 'AdminDeleteRolePermissionsV3' test.out

#- 239 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '24' \
    --resource 'XycuQNGIDeHlf6Ic' \
    --roleId 'X1K9JrK6Or2xx7rL' \
    > test.out 2>&1
eval_tap $? 239 'AdminDeleteRolePermissionV3' test.out

#- 240 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 240 'AdminGetMyUserV3' test.out

#- 241 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'wrPoWiywnxuDLLuI' \
    --extendExp  \
    --redirectUri 'aSxoloIH1gBCWVFr' \
    --password 'vls0ZwosKhDlLfTK' \
    --requestId 'xpVOXvGSrdkqddI3' \
    --userName 'ezqu6FB0sL2xt6fX' \
    > test.out 2>&1
eval_tap $? 241 'UserAuthenticationV3' test.out

#- 242 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '9j7rhZCAlDlVKBsL' \
    --linkingToken 'ZiBRXszE7CL1cQCS' \
    --password 'oqHvH7g63cOx6yrI' \
    --username 'w37pKOLrF5i3gr3C' \
    > test.out 2>&1
eval_tap $? 242 'AuthenticationWithPlatformLinkV3' test.out

#- 243 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'c4M2O7NrTQO7KLdZ' \
    --linkingToken 'DGwqx7T3l1ut2oyo' \
    --password 'lliYsTJUmpscwLcU' \
    --username 'ml3KuoMKh7tprnac' \
    > test.out 2>&1
eval_tap $? 243 'AuthenticateAndLinkForwardV3' test.out

#- 244 PublicGetSystemConfigV3
./ng net.accelbyte.sdk.cli.Main iam publicGetSystemConfigV3 \
    > test.out 2>&1
eval_tap $? 244 'PublicGetSystemConfigV3' test.out

#- 245 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'A34xmIOjFLgKR4Lj' \
    --extendExp  \
    --linkingToken 'EWhOScvtQ92iD02Y' \
    > test.out 2>&1
eval_tap $? 245 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 246 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'MvEUNfoL7JCcMo7G' \
    --state 'xxXdbYCRexPekTsQ' \
    --platformId 'xMTfaSot7aohFYy4' \
    > test.out 2>&1
eval_tap $? 246 'RequestOneTimeLinkingCodeV3' test.out

#- 247 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'VxwHIJ9gzxqAw4vB' \
    > test.out 2>&1
eval_tap $? 247 'ValidateOneTimeLinkingCodeV3' test.out

#- 248 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'GQAeh0VTiTP4PSrX' \
    --isTransient  \
    --clientId 'US6jYI9lsQFD43Df' \
    --oneTimeLinkCode '5qUZOFzpFd6b5Jc5' \
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
    --codeChallenge 'TETHcup8GG0VCMTF' \
    --codeChallengeMethod 'plain' \
    --clientId 'svTyo9RHget5hzB5' \
    > test.out 2>&1
eval_tap $? 251 'RequestTokenExchangeCodeV3' test.out

#- 252 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2BDFopxUwkMuSqQn' \
    --userId 'KzDgDAtqE3kuybwT' \
    --platformUserId 'QFYEJjIYwqfSRy8G' \
    > test.out 2>&1
eval_tap $? 252 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 253 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gVk77fd1GS5YkyhA' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 253 'RevokeUserV3' test.out

#- 254 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'iAItnWUmD225fp1e' \
    --codeChallenge 'gsx3ErheNwqd5pri' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'rDwZ1HKsOpyq8agQ' \
    --oneTimeLinkCode 'uz86nc6jLF9DIW2n' \
    --redirectUri 'cJJKpqmgvUTr8XAt' \
    --scope 'pOqUQxzqJZiWi3KQ' \
    --state 'ffT5Tn61A1xW6okI' \
    --targetAuthPage 'qmd87ir9op4YfGTn' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'o5oHzqY3DgykA8zB' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 254 'AuthorizeV3' test.out

#- 255 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'X0rkOHUkY5aSlqhY' \
    > test.out 2>&1
eval_tap $? 255 'TokenIntrospectionV3' test.out

#- 256 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 256 'GetJWKSV3' test.out

#- 257 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'oSXbn6l5xAzc1nc3' \
    --factor 'eFm950dtVAo7w4e3' \
    --mfaToken 'v5mh6Rum5pbgEt39' \
    > test.out 2>&1
eval_tap $? 257 'SendMFAAuthenticationCode' test.out

#- 258 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'uJQpgEtchTe3nt7t' \
    --mfaToken '9ztprSfW9OutADrN' \
    > test.out 2>&1
eval_tap $? 258 'Change2faMethod' test.out

#- 259 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'GBWSJ1zQKxVmRTaw' \
    --factor 'jiZPMoZZcyGEHxAK' \
    --mfaToken 'DQher3usApPdJPn9' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 259 'Verify2faCode' test.out

#- 260 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'eIdhIBvTTupABJ4R' \
    --factors 'wH3EdKmYtbqQHNfI' \
    --rememberDevice  \
    --clientId 'ZwrMxf3EnzZVnkLT' \
    --code '0Lb85nmpdN26BY5Y' \
    --factor 'I0jeO2zMDSy4kyqy' \
    --mfaToken 'KgrtEPdXXlt8geCd' \
    > test.out 2>&1
eval_tap $? 260 'Verify2faCodeForward' test.out

#- 261 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'iXu3iNvn7vLZ7h6a' \
    --userId 'lhJNGZF07lsPP5Of' \
    > test.out 2>&1
eval_tap $? 261 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 262 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'HbXzWnVO2U4uyzZo' \
    --clientId '1rj0ZrLQjk4VoYfI' \
    --redirectUri 'ksth24cZBpdDFfvz' \
    --requestId 'eU5iqhx6zv7EURTN' \
    > test.out 2>&1
eval_tap $? 262 'AuthCodeRequestV3' test.out

#- 263 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'IoG1DBdoKH6sREmm' \
    --additionalData 'fwUZLZZS7snx0Q2G' \
    --clientId 'd8m7Y3wiNloJfey3' \
    --createHeadless  \
    --deviceId 'HXL6SjljNPTXA3qb' \
    --macAddress 'g55SyienCODZ0mnO' \
    --platformToken 'pPTVxEgBFzG8tlkx' \
    --serviceLabel '0.7813090775384587' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 263 'PlatformTokenGrantV3' test.out

#- 264 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 264 'GetRevocationListV3' test.out

#- 265 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'KCU1XN4gl7yHvEqp' \
    > test.out 2>&1
eval_tap $? 265 'TokenRevocationV3' test.out

#- 266 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'JSrDXVwCkhOQ161T' \
    --simultaneousTicket 'FjROYJm75VIuCOCk' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'Z5NW623WWn2ZJY3Q' \
    > test.out 2>&1
eval_tap $? 266 'SimultaneousLoginV3' test.out

#- 267 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'vRa7CDRTcsAHzD3d' \
    --clientId 'ZyyWbUQpbcv3IwmL' \
    --clientSecret '7a1K3zIUYJmdF1Yt' \
    --code 'WNSQlcMzxfppNCrs' \
    --codeVerifier 'cDPbklTHcmgXsrVj' \
    --extendNamespace '3Mjml6BpCODWGOLM' \
    --extendExp  \
    --password 'mCZUeelXYyNrXwei' \
    --redirectUri 'CnDldRPRfd6mLZ0G' \
    --refreshToken 'TJwEjoZrRtaeWKMC' \
    --scope '8wsOByQAMAgqFEzE' \
    --username 't8umj5XhKnw7MHDw' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 267 'TokenGrantV3' test.out

#- 268 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'VynioJcAPwVHUGcs' \
    > test.out 2>&1
eval_tap $? 268 'VerifyTokenV3' test.out

#- 269 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId '1ACMvoY4jWH9dFmO' \
    --code 'HW0j9suukPE4JwQO' \
    --error 'NQ2vCbMn0Oia336u' \
    --openidAssocHandle 'iiMTAductvUfVwLa' \
    --openidClaimedId 'htRedh1SiZlOpIQ8' \
    --openidIdentity 'GL7jBF1R5OexAPzC' \
    --openidMode 'G6ZKQClGc1636nbf' \
    --openidNs 'M3J9G40Y62bCo941' \
    --openidOpEndpoint 'ALznQuHVskfCjUK8' \
    --openidResponseNonce 'GeX4Q0B2Cj0oOmBm' \
    --openidReturnTo 'Xu1KiTTiz7yrIvQj' \
    --openidSig '2isN7bRwcr16lW5Y' \
    --openidSigned 'wgZpjlMMtPWg8217' \
    --state 'm7qNkQiKp2oac8QT' \
    > test.out 2>&1
eval_tap $? 269 'PlatformAuthenticationV3' test.out

#- 270 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'NEuBbeuQqm9wM7mg' \
    --platformToken 'TtUdPVcQijMBhs0k' \
    > test.out 2>&1
eval_tap $? 270 'PlatformTokenRefreshV3' test.out

#- 271 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'DP6d3nuUZ41mSeS9' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetInputValidations' test.out

#- 272 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'SnGqhJOvykBcDpzD' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetInputValidationByField' test.out

#- 273 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode '9zh6dtPK4fVHLMvr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCountryAgeRestrictionV3' test.out

#- 274 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'CsH3RYxH2Up9VthP' \
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
    --clientId 'jFrK7Hip0eONFDgU' \
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
    --requestId 'ShG8wwFKY9AMpcwJ' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetAsyncStatus' test.out

#- 282 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'd4SrigIxAhbFMZfx' \
    --limit '0' \
    --offset '85' \
    --platformBy 'znlDQbzTiFrQB1yU' \
    --platformId 'onirH4URx3NkKQBY' \
    --query 'rlUaMiFEWUT8cAFO' \
    > test.out 2>&1
eval_tap $? 282 'PublicSearchUserV3' test.out

#- 283 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "5zEw8GENEJYPKxxO", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "viKbOgVuN3nhkn6Q", "policyId": "IesNoYqvVsakylHi", "policyVersionId": "kKkpOjqwgKvfXXs8"}, {"isAccepted": true, "localizedPolicyVersionId": "2DLLUyBt5hDs45si", "policyId": "G30Lv9iGa5mkZjnR", "policyVersionId": "XVcg6AByNpBo2JYk"}, {"isAccepted": true, "localizedPolicyVersionId": "tk4IATSIefcqNEn4", "policyId": "IZ0Dv6b8WtaMVvLb", "policyVersionId": "G04KKnh3jvW0Qp3k"}], "authType": "TyL4CsLwiWUMcpxn", "code": "4B6XoTNMuqZTHwo1", "country": "IAJQpb6r8ZeaSHwQ", "dateOfBirth": "uiH3Ozu4G6bXxp0g", "displayName": "YZyF9fJBJkSOrF9D", "emailAddress": "g4FcDwBGyBiHewZk", "password": "wEeuzBBRSknxyWkZ", "reachMinimumAge": false, "uniqueDisplayName": "G5OIVuGv47XJpkMi"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicCreateUserV3' test.out

#- 284 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'opQrVL3ZZTVxqa9X' \
    --query 'M2gY14iWk12Jffk8' \
    > test.out 2>&1
eval_tap $? 284 'CheckUserAvailability' test.out

#- 285 PublicBulkGetUsers
eval_tap 0 285 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 286 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "dwKNPUOHNZxML3yo", "languageTag": "BM9qxd6PWz7sVnMx"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendRegistrationCode' test.out

#- 287 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ge2inL8fBFP1ABaI", "emailAddress": "KrEt8d3o7cTS9OII"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyRegistrationCode' test.out

#- 288 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "MErnNTLXHrsOFsbh", "languageTag": "Row4iaYKy0IjsDgb"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicForgotPasswordV3' test.out

#- 289 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "J37DN2lDvdh7okHl", "password": "1wMht2Izq7TCUJhD", "uniqueDisplayName": "sDefAS09VyQB1vR1", "username": "mx6K17GL1CrO4Zuo"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateUserInput' test.out

#- 290 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'GZSxTzm8oMSPIHPt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'GetAdminInvitationV3' test.out

#- 291 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'qzIWIzg8pbjnt1iB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "V8DpbjGts4UZDTfh", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "C9RhzMC7V8BEphnR", "policyId": "XnSpCzyb8FkoxQbr", "policyVersionId": "Pngi87K58pQswqKL"}, {"isAccepted": true, "localizedPolicyVersionId": "wFCnqpvNesGiVnt9", "policyId": "p2to7Yja1soDE1K0", "policyVersionId": "SvGrMYwPmPXC2LfL"}, {"isAccepted": true, "localizedPolicyVersionId": "m5rP2A20t6foPPH9", "policyId": "4SUinY5diUlqgvY7", "policyVersionId": "dPPyahppgxJhk4Ed"}], "authType": "TZ000rS92594HLvW", "code": "FsXHtMP0k9L5dREQ", "country": "bCqfh0gpABFBER6W", "dateOfBirth": "NcDOsRzBkf9A6HjC", "displayName": "nFRdSihcvszzQLZB", "emailAddress": "ktk0siMup01kyaFw", "password": "wD7wecuQb4GNQHVZ", "reachMinimumAge": true, "uniqueDisplayName": "KGBnzh4suaGIzttT"}' \
    > test.out 2>&1
eval_tap $? 291 'CreateUserFromInvitationV3' test.out

#- 292 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "ncVBf5g3oeuHiNyL", "country": "kfPQPmjUkvSs5YmI", "dateOfBirth": "ejozmG5HlrIfMAvv", "displayName": "pkAHRJHZyfrXZmiJ", "languageTag": "X4CjKCeIRIr997KK", "uniqueDisplayName": "pJXTLbYWpqeXjaf1", "userName": "f5fjNMZjKJ05puX3"}' \
    > test.out 2>&1
eval_tap $? 292 'UpdateUserV3' test.out

#- 293 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "197WrMnJtovSMFw8", "country": "X4zxbdfXgunt1oMN", "dateOfBirth": "Z68eovHSH3xV3URI", "displayName": "RVDYBd6hMB0l7sg7", "languageTag": "IfMH5Tu1ky1ZYvye", "uniqueDisplayName": "HmfoFkUDP864shbn", "userName": "Q3bVvuvpsDJXPCWk"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicPartialUpdateUserV3' test.out

#- 294 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "X4Kpi8CJ88aMPGFF", "emailAddress": "AQZbfbmVTEbiRq5J", "languageTag": "uikmpat75rVbN9ZB", "upgradeToken": "tzJ33tCwv8H1f451"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicSendVerificationCodeV3' test.out

#- 295 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "FVZ630HNBYZSrz7p", "contactType": "MjESLLMPKDXLki6O", "languageTag": "z5Bygt8Q0RjSf1sr", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUserVerificationV3' test.out

#- 296 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "rHAWUFqTooGGnPEg", "country": "Y0t7QQWl42byOwXg", "dateOfBirth": "KyPhXmcysae8HpWH", "displayName": "4xiz3fWthJSu2pUI", "emailAddress": "IuPLFAtcWhjAP57Q", "password": "bWvSSp71zEPPfmAQ", "uniqueDisplayName": "iqRRC2caquMRtQOI", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpgradeHeadlessAccountV3' test.out

#- 297 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "A9gE6SrYKq6lcVOh", "password": "PJIcEHbiKHW7flVo"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicVerifyHeadlessAccountV3' test.out

#- 298 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "lAWEMmQSPDTRqjlv", "mfaToken": "wnnCA5tfK5ushaKT", "newPassword": "PVjyOUpR3uUdgNly", "oldPassword": "U4IJnqtrjCOsE8Vj"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicUpdatePasswordV3' test.out

#- 299 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'vzhJwNX4bhqCjlwr' \
    > test.out 2>&1
eval_tap $? 299 'PublicCreateJusticeUser' test.out

#- 300 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'msSRV86iic1FIMyF' \
    --redirectUri '7CcNu2DYn6E9Gk51' \
    --ticket 'kOTJZluTekDMCGUJ' \
    > test.out 2>&1
eval_tap $? 300 'PublicPlatformLinkV3' test.out

#- 301 PublicPlatformUnlinkV3
eval_tap 0 301 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 302 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vERxNg8djSb4Vt2v' \
    > test.out 2>&1
eval_tap $? 302 'PublicPlatformUnlinkAllV3' test.out

#- 303 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KQ5vlCdI519Pf2io' \
    --ticket 'gwxM5DZM0dgozmco' \
    > test.out 2>&1
eval_tap $? 303 'PublicForcePlatformLinkV3' test.out

#- 304 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId '41750xdYQg34WUV0' \
    --clientId 'WpmsQnp1n4YGumTK' \
    --redirectUri 'OlDOy5vhSkxERZ2A' \
    > test.out 2>&1
eval_tap $? 304 'PublicWebLinkPlatform' test.out

#- 305 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Q1jvXYBar5RMmmGd' \
    --code 'Wl0wpj5tVfKU3D8W' \
    --state 'VPh0Z7YiGE2cyzTM' \
    > test.out 2>&1
eval_tap $? 305 'PublicWebLinkPlatformEstablish' test.out

#- 306 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BY7Xd0OoENg2Lw7u' \
    --code 'epmahXojVZYz2zMU' \
    --state '9jLzNV3GaG43R6nl' \
    > test.out 2>&1
eval_tap $? 306 'PublicProcessWebLinkPlatformV3' test.out

#- 307 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "RPrEAYqRBeSc5uSh", "userIds": ["oj3dGHMeoi5DBOsQ", "0Gax0iX05IT9Agsj", "l5NmnSHhxNmCe4tx"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUsersPlatformInfosV3' test.out

#- 308 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "Y0MsPc9EMgf9JCJi", "code": "EvhL8ZfwCVJW9ysp", "emailAddress": "UOyHC9eKeXzrvzBl", "languageTag": "lwzyC1aTWEmPgoy4", "newPassword": "TkpEw4Zeid4mRoFN"}' \
    > test.out 2>&1
eval_tap $? 308 'ResetPasswordV3' test.out

#- 309 PublicGetUserByUserIdV3
eval_tap 0 309 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 310 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xv10ckMQVjKk3bWJ' \
    --activeOnly  \
    --after '0ZuYSe3sI0x2hc8v' \
    --before 'aN1Off5gRZZMW3hu' \
    --limit '53' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserBanHistoryV3' test.out

#- 311 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EH6X2SM3xzsNrJzW' \
    > test.out 2>&1
eval_tap $? 311 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 312 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BcdFlo7oAsOlfLB1' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserInformationV3' test.out

#- 313 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'J19b5rTfiL2P3r1a' \
    --after '0.9766987548917804' \
    --before '0.5937217989516144' \
    --limit '72' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserLoginHistoriesV3' test.out

#- 314 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YIpOLJW52uz3c8pz' \
    --after '63M0g4xXT5Ts4e0u' \
    --before 'R47OzUGHeBKtpvyR' \
    --limit '81' \
    --platformId 'RSiOyReviDaxlPdh' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetUserPlatformAccountsV3' test.out

#- 315 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wmcH03yoMxzRR6xd' \
    > test.out 2>&1
eval_tap $? 315 'PublicListJusticePlatformAccountsV3' test.out

#- 316 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '9rTh3ureaIbxM3We' \
    --body '{"platformId": "v9pZQjWAN0tny16Z", "platformUserId": "HZtuSJGQCrM7JEMR"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicLinkPlatformAccount' test.out

#- 317 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'PkdTcAzkIlndN5xe' \
    --body '{"chosenNamespaces": ["ayr3vUKMuIiz2MiA", "AKcvAXnxnH0QIhoJ", "RY807VmBT4wZXQZZ"], "requestId": "rSsuYiIPei0pXglJ"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicForceLinkPlatformWithProgression' test.out

#- 318 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YnKkoCAZuolAWnxk' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPublisherUserV3' test.out

#- 319 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ImVbDP0QX31gI7Vm' \
    --password 'nGIRMvXe6BiphIFe' \
    > test.out 2>&1
eval_tap $? 319 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 320 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after '2bzr6qQw6fSESkM1' \
    --before '9OPMBb12gpmShlmI' \
    --isWildcard  \
    --limit '39' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetRolesV3' test.out

#- 321 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'QVrMeD4bD8gISE34' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetRoleV3' test.out

#- 322 PublicForgotPasswordWithoutNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordWithoutNamespaceV3 \
    --body '{"clientId": "yIAZQeigiA3wBrmB", "emailAddress": "YIlZeheP72AB8EO3", "languageTag": "YrlyrWowUpUDVLlT"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicForgotPasswordWithoutNamespaceV3' test.out

#- 323 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 323 'PublicGetMyUserV3' test.out

#- 324 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "tuJJsHZVsG6izJZr", "emailAddress": "uOJvSRFLDSdj8elb", "languageTag": "tHvDU91DmHzwiqVP", "upgradeToken": "CJ5j18Ou3aY8nceF"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicSendCodeForwardV3' test.out

#- 325 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'U5GKmcEKp8AQwqgJ' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 326 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["s6O0Qj0ccMkdz6zP", "z3BVHAqp4O9XSjap", "24esyjh6Wc3migf2"], "oneTimeLinkCode": "n6iQyr5cb5YL6fwB"}' \
    > test.out 2>&1
eval_tap $? 326 'LinkHeadlessAccountToMyAccountV3' test.out

#- 327 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'iaVPmmn0T5uzlmi2' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 328 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 329 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "NY26xrkPPdg3pXjm"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicSendVerificationLinkV3' test.out

#- 330 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 330 'PublicGetOpenidUserInfoV3' test.out

#- 331 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'tpNfCrIj9ntYo3du' \
    > test.out 2>&1
eval_tap $? 331 'PublicVerifyUserByLinkV3' test.out

#- 332 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'pUHNu8abrVVOKxr9' \
    --code 'Pa315FKDjG2ApSV9' \
    --error '4Jy6yCSXBqJqjAbV' \
    --state 'wSaoj1ugjr8mPkr3' \
    > test.out 2>&1
eval_tap $? 332 'PlatformAuthenticateSAMLV3Handler' test.out

#- 333 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'tZ506ERSVy5M3rrk' \
    --payload 'xu0U9h9gCNVZxHGx' \
    > test.out 2>&1
eval_tap $? 333 'LoginSSOClient' test.out

#- 334 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'hZqNXJ6JXSh0Z3SW' \
    > test.out 2>&1
eval_tap $? 334 'LogoutSSOClient' test.out

#- 335 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'ISs1dYrJKmx1BT6i' \
    --code 'LFQejNZJNF2hm0Tq' \
    > test.out 2>&1
eval_tap $? 335 'RequestTargetTokenResponseV3' test.out

#- 336 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'BQprHn3whPKU5abn' \
    --upgradeSuccessToken 'qw8fFa30pVbhr1BH' \
    > test.out 2>&1
eval_tap $? 336 'UpgradeAndAuthenticateForwardV3' test.out

#- 337 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '14' \
    --namespace "$AB_NAMESPACE" \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 337 'AdminListInvitationHistoriesV4' test.out

#- 338 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '1arZAyuLcZoEkPpq' \
    > test.out 2>&1
eval_tap $? 338 'AdminGetDevicesByUserV4' test.out

#- 339 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'KhP2jWnRTglw0gdW' \
    --endDate 'oE4esuiDrquccz4J' \
    --limit '12' \
    --offset '29' \
    --startDate 'FQezJ5E3iYHIknvP' \
    > test.out 2>&1
eval_tap $? 339 'AdminGetBannedDevicesV4' test.out

#- 340 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cJkjRevVYfiExpAg' \
    > test.out 2>&1
eval_tap $? 340 'AdminGetUserDeviceBansV4' test.out

#- 341 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "oK9YDq1x3dkbJFDE", "deviceId": "BEOOvJ5BKeipIlds", "deviceType": "gB4hOxb88WgKSLIp", "enabled": false, "endDate": "fzigzHcRuJgYaj4I", "ext": {"8Dzyh1N0JEKNoMtH": {}, "vjM7X1fjzknv2HZM": {}, "IL2P2bh14LroFTnA": {}}, "reason": "uujPeP9N0vdVB5a2"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminBanDeviceV4' test.out

#- 342 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'XkS3XQfMuzZh4AhZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetDeviceBanV4' test.out

#- 343 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'Re2hgU56xtyJtnbT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 343 'AdminUpdateDeviceBanV4' test.out

#- 344 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'on2OW4Zw5QwVKWNy' \
    --startDate '2tnF2MifJR4hr4gd' \
    --deviceType 'JDujYnVnFK6gB6Zx' \
    > test.out 2>&1
eval_tap $? 344 'AdminGenerateReportV4' test.out

#- 345 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'AdminGetDeviceTypesV4' test.out

#- 346 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'C6yYUVUJYnQ3jOGm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'AdminGetDeviceBansV4' test.out

#- 347 AdminDecryptDeviceV4
eval_tap 0 347 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 348 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'ROIqxqQ0gcNeTfly' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 348 'AdminUnbanDeviceV4' test.out

#- 349 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'vUh3w5ZtfwmOCKpF' \
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
    --limit '91' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 352 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 79, "userInfo": {"country": "9u67JjCDwg186hGW"}}' \
    > test.out 2>&1
eval_tap $? 352 'AdminCreateTestUsersV4' test.out

#- 353 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "fO9MnoT3t99Hmcxz", "policyId": "jDhTrcBKtU956hOg", "policyVersionId": "8oukDVdweG0sFHxT"}, {"isAccepted": true, "localizedPolicyVersionId": "a2k60SzCqUgq1gLb", "policyId": "cIMevTmC631p7q79", "policyVersionId": "4bu49lINFTtERAXT"}, {"isAccepted": false, "localizedPolicyVersionId": "N2BCnRz9w2nur0B9", "policyId": "jKaunAcylsau7wRQ", "policyVersionId": "mL4i3eRyIECEDa1I"}], "authType": "EMAILPASSWD", "code": "lwXqwPfq3VzHQjto", "country": "lx64w1gyvjacKtGq", "dateOfBirth": "xMnoAXRlcq0mYWKQ", "displayName": "YlqMmu2pvF6rP03b", "emailAddress": "Qaq1cT88H6RCW8gJ", "password": "mGzDlqxtLsR2AGOi", "passwordMD5Sum": "PhNt2IdH8aYYUT6m", "reachMinimumAge": false, "uniqueDisplayName": "9aUXj3rh0UyqxVWl", "username": "IMY5tTJw4KV104Mt"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminCreateUserV4' test.out

#- 354 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["hKHmSjqPuQZX5Kjd", "NrEwfWo2MwulLg4b", "sO4YHEYLjTSNDf3z"]}' \
    > test.out 2>&1
eval_tap $? 354 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 355 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["azm6p5Y1tkG9WwU4", "Ty6Ch5QYyFjuBquE", "7xssm4hxczskbSUb"]}' \
    > test.out 2>&1
eval_tap $? 355 'AdminBulkCheckValidUserIDV4' test.out

#- 356 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OZ9WNl3apJmNAbl1' \
    --body '{"avatarUrl": "g5ZmTTGYRbP4QVey", "country": "9pEz1TV5cUtPBsw0", "dateOfBirth": "1i5Mf7WvbNSeeDNf", "displayName": "UESLlwHv3JgteOLy", "languageTag": "Kp8a1VqxXnRhDd9T", "skipLoginQueue": false, "tags": ["kO6aIYqftw1SrM2n", "hSEanfUYrMU6A43U", "KGpvC1cr5T1PSXhd"], "uniqueDisplayName": "uTWchzXDv3TAtBjP", "userName": "4HSuiYCbG0UyYUJm"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminUpdateUserV4' test.out

#- 357 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NL8p6AbdtU0CDrlQ' \
    --body '{"code": "pKB8qoel2QK3aSOY", "emailAddress": "dmMDikc3Fjm9HoQD"}' \
    > test.out 2>&1
eval_tap $? 357 'AdminUpdateUserEmailAddressV4' test.out

#- 358 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'emtiQvURYZCeF30R' \
    --body '{"factor": "T9rBgM8o7lxXq7Tk", "mfaToken": "dM7FVDCBcvVegrZd"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminDisableUserMFAV4' test.out

#- 359 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dP8lLQo6tHj4z4cA' \
    > test.out 2>&1
eval_tap $? 359 'AdminGetUserMFAStatusV4' test.out

#- 360 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M4LMJfWNZIxAgBpe' \
    > test.out 2>&1
eval_tap $? 360 'AdminListUserRolesV4' test.out

#- 361 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ubprKX68jTyRd3Lr' \
    --body '{"assignedNamespaces": ["R1x6U1v6zSLjm9zm", "zUW0vPj90jmLTt5Y", "QGawcomPoiYoQ1f1"], "roleId": "AYq306Pysv4VPaZW"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateUserRoleV4' test.out

#- 362 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'olXypwucUqqqff2i' \
    --body '{"assignedNamespaces": ["Wi4yP3uqNcig6YcD", "A8Z3g62oGYwkrjLI", "4EHJEEWgki9fbdvU"], "roleId": "MDZeO4U55wdCpVpn"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminAddUserRoleV4' test.out

#- 363 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ENiTc9NESV22eRBE' \
    --body '{"assignedNamespaces": ["lD4K2Cy1tJcPAEkC", "eV29QsQk100eu5Uc", "xuXXpt0YSPX04uEI"], "roleId": "dAwgDobopbdJeVCi"}' \
    > test.out 2>&1
eval_tap $? 363 'AdminRemoveUserRoleV4' test.out

#- 364 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '74' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 364 'AdminGetRolesV4' test.out

#- 365 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "roleName": "CaIv4Lp91wYUJPbv"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminCreateRoleV4' test.out

#- 366 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'zn8TYoMDAaUXSuBQ' \
    > test.out 2>&1
eval_tap $? 366 'AdminGetRoleV4' test.out

#- 367 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'dvdhJoT0WK5ngNUx' \
    > test.out 2>&1
eval_tap $? 367 'AdminDeleteRoleV4' test.out

#- 368 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'DKfZYofPGUbSaA00' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "xQjYU6KlavIiLxU2"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminUpdateRoleV4' test.out

#- 369 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'I1GyJS48Hxu8Ju4X' \
    --body '{"permissions": [{"action": 91, "resource": "iiPfRQ3rJ0f5lwXv", "schedAction": 89, "schedCron": "hRn83B0nrW1qx3NJ", "schedRange": ["TugVWXz8dv7BiEUq", "nzxs2deMF8UAJIHE", "Zv5zyUUyNJkvA5xF"]}, {"action": 15, "resource": "zHtZSd3QzXhkrN4p", "schedAction": 99, "schedCron": "rWnLrXqImgDf3GaJ", "schedRange": ["sdCZND0wgYOilX1e", "1825iasunESjcgr2", "drXG5NkKCySLA8cK"]}, {"action": 58, "resource": "vKqeoTiNKGRUMrim", "schedAction": 67, "schedCron": "ZJiOAh1SpLhMF2Pa", "schedRange": ["v11FuU8iXCRz8Kgq", "gwijYxpGhsFArq6l", "olbj7QKvtVRCPMjr"]}]}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateRolePermissionsV4' test.out

#- 370 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId '5M3vw1GqUjjFp6R8' \
    --body '{"permissions": [{"action": 26, "resource": "lb4gd4QgQut2hiPu", "schedAction": 61, "schedCron": "2NmYQ8HlHbHnfs4t", "schedRange": ["LVOYQCWMktmiKd9v", "LPP0w52JRAZxMWdo", "leYNHXeOpaRDwYLg"]}, {"action": 8, "resource": "5cYVP9tQSa27BnPy", "schedAction": 34, "schedCron": "Ah4gy41LLzQ2IjY5", "schedRange": ["PeNr4JmYxH2qs28h", "ePJjMp0TKKUBfPNI", "9f2oLWDPSZexfKVx"]}, {"action": 34, "resource": "3pgHx6uPf6jQZcYe", "schedAction": 36, "schedCron": "TDb3WdnOpzTrRzCC", "schedRange": ["afADJfWBspT3MLwJ", "ZquMQSPp5XD4S1il", "fgff7Et4uY8nlBwG"]}]}' \
    > test.out 2>&1
eval_tap $? 370 'AdminAddRolePermissionsV4' test.out

#- 371 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'NHgfgwZwVMvshGms' \
    --body '["g6ZJYnkHDnHTlRug", "M7a2UZgeesipbP02", "7okM5E8tAajVSvLR"]' \
    > test.out 2>&1
eval_tap $? 371 'AdminDeleteRolePermissionsV4' test.out

#- 372 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'j306RDuaSixXEdlo' \
    --after 'YZBkatNLc42eq0O6' \
    --before 'VsXtOlQwj5xPvm7c' \
    --limit '2' \
    > test.out 2>&1
eval_tap $? 372 'AdminListAssignedUsersV4' test.out

#- 373 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'nPR0Y1sffUaZ64dF' \
    --body '{"assignedNamespaces": ["piv8o9Gw4QtKgyIe", "ySoUxoMrj2J4JGQZ", "AtyjTxnlmSyjEaFH"], "namespace": "2DRN6HIEqIFEcS0y", "userId": "nIMOYWpUYUQMooiK"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminAssignUserToRoleV4' test.out

#- 374 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'T57rmbjEnimeR7EF' \
    --body '{"namespace": "Bz43E9FkOPVu2fDt", "userId": "OjW1iSYQbcebBd5w"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminRevokeUserFromRoleV4' test.out

#- 375 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["b5H3qppoCiHMD4iB", "K2O7qYtOHV5hnpjc", "5CNLnnEvo25aEtdj"], "emailAddresses": ["ls5oadseJg7y4Q9C", "U3fjSRaXD4HDmdvh", "MXxiKR29LKIhNU43"], "isAdmin": true, "isNewStudio": false, "languageTag": "huSMHhf5R2MkxQTA", "namespace": "YGfE6hXZ7XLoWCGf", "roleId": "0dZEeXBd6mGG6SHc"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminInviteUserNewV4' test.out

#- 376 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "ZbX2wNnT6A9zosmD", "country": "nXoncy7NZQ4PkAPX", "dateOfBirth": "BCfkE1Fb0y94eP7y", "displayName": "h0zsKhR60HZwUwk4", "languageTag": "8XK7MXHbEwAvvpEe", "skipLoginQueue": false, "tags": ["hXiJcJqYSxVKUYMi", "mVLzAP6aOzsTqEFX", "UhGAwpYq1UqZydOB"], "uniqueDisplayName": "0MThZW6LwcAg57BY", "userName": "BVCbi0ifdPyKf3Sw"}' \
    > test.out 2>&1
eval_tap $? 376 'AdminUpdateMyUserV4' test.out

#- 377 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "HekWIz4rXlH5jw99", "mfaToken": "HxCjXWcaXBcfXXeV"}' \
    > test.out 2>&1
eval_tap $? 377 'AdminDisableMyAuthenticatorV4' test.out

#- 378 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '7BXefsSgZxSYnVwX' \
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
    --body '{"factor": "qF6K0WA76Kl2mHHo", "mfaToken": "z6qBQnEDgX49n1xT"}' \
    > test.out 2>&1
eval_tap $? 382 'AdminDisableMyBackupCodesV4' test.out

#- 383 AdminDownloadMyBackupCodesV4
eval_tap 0 383 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 AdminEnableMyBackupCodesV4
eval_tap 0 384 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'DFcmOm1sqdIWU6ER' \
    > test.out 2>&1
eval_tap $? 385 'AdminGetBackupCodesV4' test.out

#- 386 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'ylESgf5dXMrPoYSo' \
    > test.out 2>&1
eval_tap $? 386 'AdminGenerateBackupCodesV4' test.out

#- 387 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'hfrLyXMSrC62xYtD' \
    > test.out 2>&1
eval_tap $? 387 'AdminEnableBackupCodesV4' test.out

#- 388 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'wflNGfufW5cWeg6e' \
    --factor 'SCypsceITTkJGGCV' \
    > test.out 2>&1
eval_tap $? 388 'AdminChallengeMyMFAV4' test.out

#- 389 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'F6LrILDLviUCzmDA' \
    --languageTag 'aW5xz1c7ZuZXUCBY' \
    > test.out 2>&1
eval_tap $? 389 'AdminSendMyMFAEmailCodeV4' test.out

#- 390 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "nkY0LEBSYBdUSiTO", "mfaToken": "rhB8hVs29WOKmZRT"}' \
    > test.out 2>&1
eval_tap $? 390 'AdminDisableMyEmailV4' test.out

#- 391 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'tgycLzXz6lUMKi5m' \
    > test.out 2>&1
eval_tap $? 391 'AdminEnableMyEmailV4' test.out

#- 392 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 392 'AdminGetMyEnabledFactorsV4' test.out

#- 393 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'weMEZo2ZnL1Zg2Jf' \
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
    --clientId 'H4f73jAevOnES6YJ' \
    --linkingToken 'Llb2AfUEEBbqMMKv' \
    --password 'kOsR1fHUyirMVMOF' \
    --username 'ES2J2OzNlJE3uqZz' \
    > test.out 2>&1
eval_tap $? 397 'AuthenticationWithPlatformLinkV4' test.out

#- 398 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData '574g31cA0PwZxTIZ' \
    --extendExp  \
    --linkingToken 'VSGQyTzhs9Asy4d6' \
    > test.out 2>&1
eval_tap $? 398 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 399 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code '29N4YnolVWA2dWxB' \
    --factor 's056jkPCUuE1pgdH' \
    --mfaToken 'vlQKiR7SDQUDavOl' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 399 'Verify2faCodeV4' test.out

#- 400 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'KT5EIHNhJQq94Re5' \
    --codeChallenge 'IM1akNKz9IltQUku' \
    --codeChallengeMethod 'S256' \
    --additionalData 'zMTMSwrNov2GW9i5' \
    --clientId '4JY23AUWFTLq0W1J' \
    --createHeadless  \
    --deviceId 'qwKs1mO80L7IOHlf' \
    --macAddress '6j8PZOzUiQKZqz5N' \
    --platformToken 'Sp0B7LODN3Boi2sS' \
    --serviceLabel '0.4226888648160906' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 400 'PlatformTokenGrantV4' test.out

#- 401 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'O2n4MZQt753XQB93' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'LmvEOaRcqTgF0xtQ' \
    --simultaneousTicket 'AXoDoFkmA3fgzcwd' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'yW3cMz9YyduMomEH' \
    > test.out 2>&1
eval_tap $? 401 'SimultaneousLoginV4' test.out

#- 402 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'cU15St4v8ry8IyqN' \
    --codeChallengeMethod 'S256' \
    --additionalData 'v0KVpXJTMx3Y8Um1' \
    --clientId 'iqehObg3OZ9j0HDt' \
    --clientSecret 'bqMFlgHKQIRtLfPn' \
    --code 'gD83roOeqE7fcCAe' \
    --codeVerifier 'ExeQX43LpmdMiZey' \
    --extendNamespace 'IrA4QUKSJgECzvaW' \
    --extendExp  \
    --loginQueueTicket 'UCA7wKru7ry3AQ2s' \
    --password 'EHvSxjWoM1rNJLM0' \
    --redirectUri 'OOVG5cG6XxENbWql' \
    --refreshToken 'X7idzjpKDfwl6XlC' \
    --scope 'F6YxFMD8tJQwZvUV' \
    --username 'Inos5RK100yH89i8' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 402 'TokenGrantV4' test.out

#- 403 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'AiRASsuFM4ahGw7X' \
    --code 'cF1Qwzz606UGXPho' \
    > test.out 2>&1
eval_tap $? 403 'RequestTargetTokenResponseV4' test.out

#- 404 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'NZlXMef7AvS3TfKx' \
    --rawPUID  \
    --body '{"pidType": "6ByTygbtOtcQS4Cm", "platformUserIds": ["gw1wRUnIVYxY6Ohd", "krYiCinoVOzo4Plv", "1IlTpEhjTFYdzsUN"]}' \
    > test.out 2>&1
eval_tap $? 404 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 405 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vQAn2LuMjLqwmVz3' \
    --platformUserId 'zKsfjz1mFkyxoUzf' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetUserByPlatformUserIDV4' test.out

#- 406 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "VeW9ddxzLPV8wDjs", "policyId": "nyPh5yNbYXmlAOi1", "policyVersionId": "SC3I1SjkH42LtyZK"}, {"isAccepted": true, "localizedPolicyVersionId": "djn2Ps3IVT5hUZ3c", "policyId": "nDq0ddZG0EpfGAqH", "policyVersionId": "KcSxUc2YgRpk2IFG"}, {"isAccepted": false, "localizedPolicyVersionId": "XALMresGFfsH4aXC", "policyId": "DhshvEF8rHd250ny", "policyVersionId": "ihcUVGHQczI5ZoTR"}], "authType": "EMAILPASSWD", "country": "JhbocoGlPzdfxcC3", "dateOfBirth": "rpWhSpq0InxMLpP7", "displayName": "n7M3JXjEvsj5WcQ9", "emailAddress": "9M1yuXeqV31LX2eh", "password": "cMnM6QtjzQjDlUMC", "passwordMD5Sum": "GnxZwak7KHnzGASm", "uniqueDisplayName": "VzePIroz41oQCuXe", "username": "TRyJQrNLTcqLVTN5", "verified": false}' \
    > test.out 2>&1
eval_tap $? 406 'PublicCreateTestUserV4' test.out

#- 407 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "B4tDCWx3cEX8wTi1", "policyId": "v2abpCWytPEi9Ze0", "policyVersionId": "hL9rPkV5GkSrcl2O"}, {"isAccepted": true, "localizedPolicyVersionId": "7XVzU7qlNVk7qnmB", "policyId": "S3XKDhp1OkMcErme", "policyVersionId": "H0lX1hj0LaXgQ94f"}, {"isAccepted": false, "localizedPolicyVersionId": "NBzgQ4CRwg0sKVeS", "policyId": "pMny0GrvKI5EVB9Z", "policyVersionId": "FzLNsjdCFtKY0Ksx"}], "authType": "EMAILPASSWD", "code": "rCFkyiQZfMnTbKdw", "country": "NhiIP7dpJ8B8VwFQ", "dateOfBirth": "nVco2oCn1KvJmbja", "displayName": "pW9UlEqtzDd7Sgxd", "emailAddress": "xB5kvtM8ah9bPsks", "password": "ceGUEX8ERZcKSYLo", "passwordMD5Sum": "6y7yJMowQ6LpHCvC", "reachMinimumAge": true, "uniqueDisplayName": "gX9JQwErzjtuP9pU", "username": "Uv7qefNMFsZAIqak"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicCreateUserV4' test.out

#- 408 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId '1zi0JSa5cRn31D8u' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "u6aCnL816aH6gOBU", "policyId": "IMeL0GL3aefSDME8", "policyVersionId": "X2MxILI42BJMPkZm"}, {"isAccepted": false, "localizedPolicyVersionId": "Hf558h1ltyhiSGhf", "policyId": "qXhxBJ7zLXioAGkW", "policyVersionId": "gSDdDQvpRfGe3z2r"}, {"isAccepted": true, "localizedPolicyVersionId": "0cPPtKaJlw31pdDr", "policyId": "XQ47WSGyDCKF0LLh", "policyVersionId": "O3lGZ7eGOPj2XoFu"}], "authType": "EMAILPASSWD", "code": "IjZyvlGDQGv6pNNo", "country": "wEuVVZM28w4mnYvv", "dateOfBirth": "lt1es7A4PFduN4gx", "displayName": "0UC6eWKCFGS97Si6", "emailAddress": "XyLVPrkUxyZ1OH5N", "password": "n4nMT8QOyTuUSD9I", "passwordMD5Sum": "mtaPAocOQcpBWSNr", "reachMinimumAge": true, "uniqueDisplayName": "DWfGRVhbZTvCPrrZ", "username": "CTU5WUJizF69PSsq"}' \
    > test.out 2>&1
eval_tap $? 408 'CreateUserFromInvitationV4' test.out

#- 409 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "uWUafwbFPX15633p", "country": "FgA7i9tqvfHmFvUZ", "dateOfBirth": "iUW5Y0CYw5OXSGwQ", "displayName": "kJuy9oLFcHHcraLX", "languageTag": "R2n9JQvq7NKWIHYs", "uniqueDisplayName": "ii3fCh7sieJjZPAk", "userName": "iWumllU31uXPwYxe"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicUpdateUserV4' test.out

#- 410 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "dGHCIkmt4bfJOhNa", "emailAddress": "IT0pv7XeqO8gY3c4"}' \
    > test.out 2>&1
eval_tap $? 410 'PublicUpdateUserEmailAddressV4' test.out

#- 411 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "SryWB4yRaDxvxwaL", "country": "M8HkVOW8PnLkgqkq", "dateOfBirth": "YZWPZTgKagTzdcYc", "displayName": "ko7U3gH239LhRx2L", "emailAddress": "aa2RdtVb6VgA5yFI", "password": "H3s9UyeaFi8OE7BC", "reachMinimumAge": true, "uniqueDisplayName": "4FeVGrl5NpUG9zbl", "username": "WEiHaUjyTHb0sSls", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 411 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 412 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "UvLp1wxGF747468M", "displayName": "XUq3uIffkIpPmrWV", "emailAddress": "xNZUvkiU2jXSwsBB", "password": "RopVl38d4NZGtk6E", "uniqueDisplayName": "mWxC75M88TKhFYkA", "username": "9aRNDe2IoPMSQKcg"}' \
    > test.out 2>&1
eval_tap $? 412 'PublicUpgradeHeadlessAccountV4' test.out

#- 413 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "0OTT9JA0ll1RimBC", "mfaToken": "iQwuyrI87uSyXP6C"}' \
    > test.out 2>&1
eval_tap $? 413 'PublicDisableMyAuthenticatorV4' test.out

#- 414 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code '0jXS8au2wcWYyj3J' \
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
    --body '{"factor": "vHqXp4JR7xI59Z9t", "mfaToken": "fGVsglnOxOXBfgBL"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicDisableMyBackupCodesV4' test.out

#- 419 PublicDownloadMyBackupCodesV4
eval_tap 0 419 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 420 PublicEnableMyBackupCodesV4
eval_tap 0 420 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 421 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'uglkd9LIoshGnFSu' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetBackupCodesV4' test.out

#- 422 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'Hmrqej8PRppYY1vl' \
    > test.out 2>&1
eval_tap $? 422 'PublicGenerateBackupCodesV4' test.out

#- 423 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'V0M2g6oreqyBzWzC' \
    > test.out 2>&1
eval_tap $? 423 'PublicEnableBackupCodesV4' test.out

#- 424 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'gMMWZuD6tmIR28xV' \
    --factor 'xbtpSKOfiIP3S6py' \
    > test.out 2>&1
eval_tap $? 424 'PublicChallengeMyMFAV4' test.out

#- 425 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'pZqISn3msrykQFtW' \
    > test.out 2>&1
eval_tap $? 425 'PublicRemoveTrustedDeviceV4' test.out

#- 426 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action '8QGKFZLrIfqrZuu7' \
    --languageTag 'IwKcT7sAsv2TKCbY' \
    > test.out 2>&1
eval_tap $? 426 'PublicSendMyMFAEmailCodeV4' test.out

#- 427 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "MVkXEHmsHwIGGsus", "mfaToken": "S0zZRODEKPdudZsL"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicDisableMyEmailV4' test.out

#- 428 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'af8aZrXW84dt0TST' \
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
    --factor 'my7XF26K2U7xttUz' \
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
    --userId '8nWKJjv06PuffHgh' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 434 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "AQfAsYXVzBenLtaA", "emailAddress": "oYyRfiCWrm3s1Ah3", "languageTag": "TII70MIcBMJ04508", "namespace": "jKedx0CVRpd7SwZw", "namespaceDisplayName": "2UkjDzJ4NuMMgI13"}' \
    > test.out 2>&1
eval_tap $? 434 'PublicInviteUserV4' test.out

#- 435 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "HvndQsCKAO2JRz3C", "policyId": "GwtujkzxidLcAQWG", "policyVersionId": "VRg6DVso5TJCSugd"}, {"isAccepted": false, "localizedPolicyVersionId": "08JrSHPqdhKHn6Zj", "policyId": "ZMdr1C2TIQzRJY7U", "policyVersionId": "fYSrdN0JVz4U43Ec"}, {"isAccepted": false, "localizedPolicyVersionId": "FRyeeqehMNeRYKeM", "policyId": "bL0G4v5D6ylZguO9", "policyVersionId": "18X7rLoexHBMBMMA"}], "code": "YokSWFwajRGUyklf", "country": "LVY6g3PO4hKAeF4G", "dateOfBirth": "UV5m96qcCJsVOWtu", "displayName": "5RPsqd66ImBEuhna", "emailAddress": "xZVf6MD9r1y5Ihr5", "password": "31Kajxq7lzuVRVEv", "reachMinimumAge": false, "uniqueDisplayName": "O3ummpllnV6B62P1", "username": "Kazg73c6UpmA4ehx", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 435 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE