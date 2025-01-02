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
echo "1..425"

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
    --body '{"ACSURL": "p3IhtCSHy1ei1fIr", "AWSCognitoRegion": "PvfHnRN06EjRwEQl", "AWSCognitoUserPool": "NapJRfk4f9Zcw1pE", "AllowedClients": ["HAyNFxcVTKuAQTGh", "5BxjWOozGoDtsUuY", "o5p8ED5QZAufwNa8"], "AppId": "lzfjv9oYMXMjlVHY", "AuthorizationEndpoint": "1AHwF3vGoav7MK0P", "ClientId": "cLnEkcokKwcQ0baD", "EmptyStrFieldList": ["T9OyJ2h23GUS2amU", "7syGlElXdEAOrVSn", "LocLVVYamQc4wcG5"], "EnableServerLicenseValidation": false, "Environment": "PlRpWjmHZAAvKTH8", "FederationMetadataURL": "MuqIg0CzkguwuJCW", "GenericOauthFlow": true, "IncludePUID": true, "IsActive": true, "Issuer": "EFB67AODbi9BzupB", "JWKSEndpoint": "sFpYc77GtRUcCFeY", "KeyID": "5g4XgBsbfzqxBPNe", "LogoURL": "8ae1Il4aAtEbu4Ij", "NetflixCertificates": {"encryptedPrivateKey": "GdqthRxTjQ7gkZEY", "encryptedPrivateKeyName": "8rG0q0Q2Qd2JzRbk", "publicCertificate": "F2I03dIjvBbA6bfb", "publicCertificateName": "YaJCJjfk2TUvn95F", "rootCertificate": "hO7VW3mbDVMDu87t", "rootCertificateName": "0ldWf7iSGIiKFtWt"}, "OrganizationId": "n4Yr2svKM6pqLGZ0", "PlatformName": "TBujELAUK6mQ5iZg", "RedirectUri": "bwwm5iGzXtcknrgi", "RegisteredDomains": [{"affectedClientIDs": ["dKupvXO6aj4hCmTC", "34jxW4pIDwdqXpmR", "mut9H9XyWI8bp8fQ"], "domain": "xRuX91uYmtrHJbEG", "namespaces": ["TUj7YjERL1rEQG02", "zccA8wvLsWUNd6lP", "KvqDejvqklTSvDwu"], "roleId": "OrP9lzpiX0VuFpZu"}, {"affectedClientIDs": ["m7izxe7NPzjOa8E7", "wY76PxLv9HBEUe89", "AwEw1HO4FnKtx4XL"], "domain": "KAmlDr19uJ3nq6Ve", "namespaces": ["rzVCcI8y3Cz0YqCK", "Uh5RD9vNAp4jinFp", "nQ5xF9wwbvMZyeDe"], "roleId": "RnVfPUa6xVVBcq3w"}, {"affectedClientIDs": ["ZpFIYeAg79HcLJXJ", "7mpVI6eTYAjdPlCi", "QQC35cj4KyOVgvnW"], "domain": "bfRJtsB7cUQZ2QUA", "namespaces": ["xJrINPXppPNO3Afm", "XcgwC3IN6tvKgLB9", "QmJIOq9dP5szG71u"], "roleId": "tjsQ4CrRb9gUCeVz"}], "Secret": "7fWbZIdhevfZvyV7", "TeamID": "AcodcZwKjYDdmJOl", "TokenAuthenticationType": "zwm9Su4FnS98Qqft", "TokenClaimsMapping": {"Sjq7sn8yreciPLfk": "VyyJsbGpO6JgehDJ", "xEN7JlZc8LMq1o2j": "ZWu4yA3r0u4q1bTH", "XIjfJKyFlM0u1uuo": "Vdn9yVoSlKNchPHN"}, "TokenEndpoint": "L4X3LLaGPGdqLE8S", "UserInfoEndpoint": "ohhhuiTnJarYYkHB", "UserInfoHTTPMethod": "DdSzBXdxapwhd5IQ", "scopes": ["YBQuxLvPuWYvE3fs", "Ny9Z9OhxXvCp9y7f", "LD2qfCXnlUnqxT1W"]}' \
    > test.out 2>&1
eval_tap $? 143 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 144 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sRNMZcA92hzC7MNa' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 145 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8vVe4MHX6AgMep90' \
    --body '{"ACSURL": "AyyUJyAK5PRMRMwd", "AWSCognitoRegion": "vl0hv6g62GxBW2tQ", "AWSCognitoUserPool": "F5tkTjgJaMYvNQOs", "AllowedClients": ["Da4bkcgepqtxjbrz", "tee7QLTGAak7Kaol", "01DK97D2xnik42mi"], "AppId": "teR5eQAe1rzmmgqB", "AuthorizationEndpoint": "PRmd6mO4oI8KDqeb", "ClientId": "m83raNBJ5y7axEkv", "EmptyStrFieldList": ["I4oxZEDxGiBnNbn0", "zaf7CaOSlHXrUSA6", "sMJzA5mtqISQ83TT"], "EnableServerLicenseValidation": false, "Environment": "zDX8v3xgC1Ge9Pdb", "FederationMetadataURL": "TTAJ2Gp1r0sVZ6LJ", "GenericOauthFlow": true, "IncludePUID": false, "IsActive": false, "Issuer": "zQqV8d9mDdUIoiIJ", "JWKSEndpoint": "FNxuNOmUSWw18T1I", "KeyID": "xVWCxdvPL9e4P01v", "LogoURL": "xP8xj1LyEirURERn", "NetflixCertificates": {"encryptedPrivateKey": "EMzpImW6sjAHyCK5", "encryptedPrivateKeyName": "tNanGBrkzUvck3xT", "publicCertificate": "tmOFMebS4AdlNzwo", "publicCertificateName": "g2IhErkNhNcECWwc", "rootCertificate": "hW6zL9SkbLlrNXnG", "rootCertificateName": "anMazb8jvRWenURH"}, "OrganizationId": "48aJuALEcSqcE15u", "PlatformName": "6D31DjOsrs3CUYAT", "RedirectUri": "dqnQGbqiqOkNeATj", "RegisteredDomains": [{"affectedClientIDs": ["7eGjodd7CcJUrI6M", "AugK5kypNrp2nFe9", "FmN86sK5LOq4ft5j"], "domain": "GcMICPUYnfG6jl9U", "namespaces": ["4jReteIMgzISomCs", "odJrhQW41q2OspCZ", "bt3Uta5I0uGcL1ko"], "roleId": "yHjCH5olYLETRpAB"}, {"affectedClientIDs": ["AmO2EGvJ4UMS93yO", "xNInDByhnoluO6ti", "0QP2ssiJ66OzOj84"], "domain": "O6tgohjtC7bzjPpu", "namespaces": ["cddXJ5zifF8y959a", "nrNSleywHbHig6IK", "WVZ77KeRWdECaFGz"], "roleId": "fZ2hxcJ2Fnemn7M2"}, {"affectedClientIDs": ["3SzUo4hNBDh9ZFP1", "OW0nXOErQPS4VsRo", "YIK69yg9ADCGiXaL"], "domain": "s2xjHkinOD975nAR", "namespaces": ["HCmhNHSXuqIHsxva", "UoXDmwWsukxncuD3", "QxCXMd00YBWCaVVm"], "roleId": "M45mfIZsWhkS476d"}], "Secret": "GGJwJ00UH197MJ6z", "TeamID": "U7JLMQyMWzYQCAaP", "TokenAuthenticationType": "JgoxGJoJaSzUtY4Z", "TokenClaimsMapping": {"D0Xtb0U4pH16NUsV": "Y21NVIs7NRen2Y3N", "s0QJQeaWytPfds1B": "Yx0EaURydf8ZyyZe", "HAWGgJUbUJRMbkcT": "glbU86FyOjApNHBV"}, "TokenEndpoint": "fNOURcjY3YYT9oTy", "UserInfoEndpoint": "nmfIuBWgJTNFfM8M", "UserInfoHTTPMethod": "0IW4oe8KDgy0xZfA", "scopes": ["cNg14Ws8TIP1LKiF", "QoLDvumfqrgSfnx2", "h61X9dN1MGRXBJ6m"]}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 146 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VV7JS9qjNLwvI8Jd' \
    --body '{"affectedClientIDs": ["iY3RRiLilmOGF6dL", "LIeIVIjMcdlbdRXT", "GIrdNL5gJPqTAjgq"], "assignedNamespaces": ["aTHf1ANTJ9Yk997X", "kGOdC6ItxDT8p4n4", "XCFkD1AJLCwszbZx"], "domain": "uHSgDOK8bjoF7bL2", "roleId": "635KbtZTGJpqgl2I"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 147 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zNXGTuQPIDpor7t1' \
    --body '{"domain": "aJLNNz6QIVC9Mfuc"}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 148 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '8VOsnmnlVljdWYmE' \
    > test.out 2>&1
eval_tap $? 148 'RetrieveSSOLoginPlatformCredential' test.out

#- 149 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Le74p38vumnxAnYB' \
    --body '{"acsUrl": "TxaTIz0jcgDI8Pkz", "apiKey": "96vd80msqIm5bufn", "appId": "BqrpLeqhwVhjnnjK", "federationMetadataUrl": "MEmtbiWsAQHbMrKY", "isActive": false, "redirectUri": "ECIQhfIhHtADUQ9z", "secret": "imQTQT95pFJUAJsy", "ssoUrl": "AfeKOufV4f15NohX"}' \
    > test.out 2>&1
eval_tap $? 149 'AddSSOLoginPlatformCredential' test.out

#- 150 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'u6opxQGRt6PqlkL0' \
    > test.out 2>&1
eval_tap $? 150 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 151 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'diRhLC10ih2EQfY3' \
    --body '{"acsUrl": "XCv4hdOa6FdZhNMd", "apiKey": "1onFjGRbxtABPXDm", "appId": "gNEJBhgGq5GIDhNC", "federationMetadataUrl": "66szbCCf73IFbRkP", "isActive": true, "redirectUri": "Tz4TjCrJHXGXku2Y", "secret": "VuOzhxHmnrrV9ZGW", "ssoUrl": "rZ05sxe6A6RpmKDe"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateSSOPlatformCredential' test.out

#- 152 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bNkylbynkgT9vayL' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["Liizac7Ge6zKJdlt", "7rjF5RaJwvkWVco2", "LTo5ijlvDF8qBWCQ"]}' \
    > test.out 2>&1
eval_tap $? 152 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 153 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9dLWYyS8zdhMeBXH' \
    --platformUserId '8x6HdVfZVDAiU6iJ' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserByPlatformUserIDV3' test.out

#- 154 AdminGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'country' \
    > test.out 2>&1
eval_tap $? 154 'AdminGetProfileUpdateStrategyV3' test.out

#- 155 AdminUpdateProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'display_name' \
    --body '{"config": {"minimumAllowedInterval": 75}, "type": "c794ryY91lX8DD4M"}' \
    > test.out 2>&1
eval_tap $? 155 'AdminUpdateProfileUpdateStrategyV3' test.out

#- 156 AdminGetRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    > test.out 2>&1
eval_tap $? 156 'AdminGetRoleOverrideConfigV3' test.out

#- 157 AdminUpdateRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'GAME_ADMIN' \
    --body '{"additions": [{"actions": [56, 35, 18], "resource": "J81lHvv9rqvEoM8Y"}, {"actions": [25, 97, 53], "resource": "jAkO3HKsEp6KlqwW"}, {"actions": [6, 47, 19], "resource": "AvM7tuL81lsR7xxS"}], "exclusions": [{"actions": [98, 31, 90], "resource": "3Gd2TK0HzYviTgYm"}, {"actions": [49, 24, 68], "resource": "2JVBRLPZ6Iz8tne5"}, {"actions": [7, 57, 3], "resource": "VsXsygWbjE2opXtd"}], "overrides": [{"actions": [37, 48, 73], "resource": "7XZIjU4IK9lOLaZa"}, {"actions": [79, 62, 31], "resource": "BGTtZyTjdKNKgYaz"}, {"actions": [43, 19, 56], "resource": "smSmylT1YtxIq73a"}], "replacements": [{"replacement": {"actions": [78, 44, 2], "resource": "CiCf33ViEdqQpoGk"}, "target": "UWNizk5UcPAGv6c1"}, {"replacement": {"actions": [62, 77, 91], "resource": "46LuxJF3sbeqWBdQ"}, "target": "uWfgBAKx27MSBqab"}, {"replacement": {"actions": [96, 53, 55], "resource": "OGkkoMUZn1YXj5zF"}, "target": "ZeOCOR9NvBQZSJPO"}]}' \
    > test.out 2>&1
eval_tap $? 157 'AdminUpdateRoleOverrideConfigV3' test.out

#- 158 AdminGetRoleSourceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleSourceV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetRoleSourceV3' test.out

#- 159 AdminChangeRoleOverrideConfigStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminChangeRoleOverrideConfigStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    --body '{"active": false}' \
    > test.out 2>&1
eval_tap $? 159 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 160 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'rRBrYVzi9ui3lvoz' \
    > test.out 2>&1
eval_tap $? 160 'AdminGetRoleNamespacePermissionV3' test.out

#- 161 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'Tt9TsH7A0TuU2aL4' \
    --after '2' \
    --before '84' \
    --limit '54' \
    > test.out 2>&1
eval_tap $? 161 'GetAdminUsersByRoleIdV3' test.out

#- 162 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'kk11sys6GdkDcos5' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetUserByEmailAddressV3' test.out

#- 163 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["2FbrTFznTgDIwZIR", "Wf6T3by2kYSCdnFK", "Lc0xcTjqjdcEfU61"]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminBulkUpdateUsersV3' test.out

#- 164 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'OJYMnW49rWynp1ck' \
    --body '{"bulkUserId": ["1vT90C6o86cSRL9c", "gbUmulhe98oaFKlQ", "icdrxVhrtwSd9QWV"]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetBulkUserBanV3' test.out

#- 165 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["MYz7TU1TsxsChScl", "Skb5aBi9K9zyv6gF", "ZXI5nXJ7hLi6Hwew"]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminListUserIDByUserIDsV3' test.out

#- 166 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["eRmyo91dIn7QqXBD", "XJcrqKmXDwoEV6tC", "drxw1KOPhuvHuYrG"]}' \
    > test.out 2>&1
eval_tap $? 166 'AdminBulkGetUsersPlatform' test.out

#- 167 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["WDK41uMOC0mRvSoa", "Gk4ktF5wnJDg9Q3W", "XiydCOInVolsr6CH"], "isAdmin": false, "languageTag": "jaGfsD1cfswmeFpv", "namespace": "tDtetoQVFL8LNW11", "roles": ["vtpaTxi7k489jRCn", "48bvkCPfKofwXOIZ", "ZQAJza84lKKmVOaT"]}' \
    > test.out 2>&1
eval_tap $? 167 'AdminInviteUserV3' test.out

#- 168 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '6' \
    --platformUserId '6xBbNrSUAW2ak7IS' \
    --platformId 'DrBVg6NuDZvPb1ku' \
    > test.out 2>&1
eval_tap $? 168 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 169 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 169 'AdminListUsersV3' test.out

#- 170 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'fNfUDe4g7q6PHEaq' \
    --endDate 'bzHvDDl1jiLw3XMG' \
    --includeTotal  \
    --limit '56' \
    --offset '53' \
    --platformBy 'GVU7Exlkmc4xYiLj' \
    --platformId 'LyZrXr9Bhtzn8jAd' \
    --query 'Tn6xBhrciryLm67r' \
    --roleIds 'kadH5Y41SLjCPrFa' \
    --skipLoginQueue  \
    --startDate '05Xl5TPC5GODS44b' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 170 'AdminSearchUserV3' test.out

#- 171 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["mm7jPdKLddfdsUqj", "XVzW1QqxnWR5sheL", "gsAF4ctv5guycGiq"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminGetBulkUserByEmailAddressV3' test.out

#- 172 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9j2EyIknfLDpgHnM' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetUserByUserIdV3' test.out

#- 173 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'On8nc3gUZ8ZFyyEr' \
    --body '{"avatarUrl": "0KBXuJBqK4QtEydP", "country": "WLPBYiR3UbJc1ZYa", "dateOfBirth": "px7C477etqgfOJDU", "displayName": "T0uKAPrARya2IMlN", "languageTag": "iXpF4qvsUUpHqi33", "skipLoginQueue": false, "uniqueDisplayName": "30lpzcBQMAEcNcJq", "userName": "rKxnMzSYoc4ZjiMY"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminUpdateUserV3' test.out

#- 174 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4H34B6wVd8ipcKDw' \
    --activeOnly  \
    --after 'QeUWtjCC2UH6jzMO' \
    --before '3AfmOS5mQNyRPZFP' \
    --limit '80' \
    > test.out 2>&1
eval_tap $? 174 'AdminGetUserBanV3' test.out

#- 175 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7xv85K5MU2qmbeqa' \
    --body '{"ban": "VemINdClpF7OvlBI", "comment": "Egjse5kd6GEDo08y", "endDate": "q5E5HleLoog4me2N", "reason": "BFp62xlXvVcJerTP", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 175 'AdminBanUserV3' test.out

#- 176 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2PWsHiKYArAxnKBf' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetUserBanSummaryV3' test.out

#- 177 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'BfDlrQQuAc10Djjw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mv4vrIPRtvhQIyLa' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 177 'AdminUpdateUserBanV3' test.out

#- 178 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jaLOKnX51yAB8Pa3' \
    --body '{"context": "uNGKhaLlJzJMSnJI", "emailAddress": "IgsAVmaGYxUX1B9o", "languageTag": "VuzG2CnYX2YBF2g7", "upgradeToken": "TVtzYEHUodh3iUfB"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminSendVerificationCodeV3' test.out

#- 179 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'thbepUCTWiZ1uqh7' \
    --body '{"Code": "GAi4FEIu44u83ZLR", "ContactType": "xYlYqlpq03BGdIk4", "LanguageTag": "oEogFVGR71rJOBy6", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 179 'AdminVerifyAccountV3' test.out

#- 180 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'tQWlHwBcTtztx3VA' \
    > test.out 2>&1
eval_tap $? 180 'GetUserVerificationCode' test.out

#- 181 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'l6tXFbnATCzUOIzV' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetUserDeletionStatusV3' test.out

#- 182 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cy9k3ie64Vnwa0Cl' \
    --body '{"deletionDate": 66, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateUserDeletionStatusV3' test.out

#- 183 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QJultJe32AiwKadE' \
    > test.out 2>&1
eval_tap $? 183 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 184 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oIVmprwPsa9YD92C' \
    --body '{"code": "X0rITajpwHITGeHT", "country": "nqRbzBB9ZFgJbQ3F", "dateOfBirth": "j1umx4ItzkMJ7cud", "displayName": "f4r916GPrhn2etVI", "emailAddress": "QvRkQJAtDUH9tx60", "password": "AehGz1ermJYXsYgL", "uniqueDisplayName": "7TfyIlAwjTZdRZJJ", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 184 'AdminUpgradeHeadlessAccountV3' test.out

#- 185 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M0tgfeWy47bbwMI4' \
    > test.out 2>&1
eval_tap $? 185 'AdminDeleteUserInformationV3' test.out

#- 186 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gGmvK9gW596FwBNr' \
    --after '0.5094005447461554' \
    --before '0.8026230378909404' \
    --limit '40' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetUserLoginHistoriesV3' test.out

#- 187 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sI5y0mR3zMyTsftK' \
    --body '{"languageTag": "qnsIJctAdxyZVKHA", "mfaToken": "9DkaSOWgtg8yw8lH", "newPassword": "EbVDwBAqanOlscRI", "oldPassword": "Ww82k5K5VTkdubkO"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminResetPasswordV3' test.out

#- 188 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FldMCQ98JH4n0Jtg' \
    --body '{"Permissions": [{"Action": 34, "Resource": "fZWEFIZs28Ff1kZp", "SchedAction": 44, "SchedCron": "Zktx3N7WNMYIfcDK", "SchedRange": ["bLu8pnK34oA1keYX", "JvtggDdXjbdjMBah", "FZZGMTcqnWrIprOv"]}, {"Action": 56, "Resource": "BJ9Sgl7H1sdH2RIJ", "SchedAction": 53, "SchedCron": "iYzCQh2iNTwtnohd", "SchedRange": ["dMzMTQ9P7sYLDWAJ", "OA75K4BYJ2fkqYJo", "F2FI3vyyqRzc20O7"]}, {"Action": 64, "Resource": "XWsz9TVmdMKEohKz", "SchedAction": 42, "SchedCron": "vgD1Qf7Ot2DkUt3y", "SchedRange": ["exZBRvxYnEBhXtAV", "xCd3meTrT7cF9oVC", "h89wNOkKYssVejcL"]}]}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserPermissionV3' test.out

#- 189 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3kR3hCGNgaJmuALl' \
    --body '{"Permissions": [{"Action": 79, "Resource": "5BWa9VzIkaQEl1iU", "SchedAction": 85, "SchedCron": "LlT2sY3SsTnDQY7k", "SchedRange": ["KU2u06Q4veujxtyQ", "ENvJrBCqeg67d4RW", "OqO4U0bitNQLzwRo"]}, {"Action": 99, "Resource": "Qht4JwnPS2urJqer", "SchedAction": 30, "SchedCron": "VIBbcujF8Vk5qb8N", "SchedRange": ["hWWwaxyMchkt8l5I", "PSrwrJl7wYIVw13N", "Co9yXlbQ52FTHTCj"]}, {"Action": 69, "Resource": "SEAzT7TOpyiuvvQU", "SchedAction": 25, "SchedCron": "ZGwiVj7eDTaka9AB", "SchedRange": ["fX1IByPEOuPhGspR", "i3bhPQvBBJI5Jxyt", "pcubN4AUUPFPscZs"]}]}' \
    > test.out 2>&1
eval_tap $? 189 'AdminAddUserPermissionsV3' test.out

#- 190 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XeJOD4DMtqfIGiGJ' \
    --body '[{"Action": 29, "Resource": "BBq2SimQQoLbe5YO"}, {"Action": 73, "Resource": "V1o2x0hL5DuBDqMy"}, {"Action": 70, "Resource": "T1IZKTdNFVBQ1crB"}]' \
    > test.out 2>&1
eval_tap $? 190 'AdminDeleteUserPermissionBulkV3' test.out

#- 191 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '94' \
    --namespace "$AB_NAMESPACE" \
    --resource 'AupATO8uXsqVpdiW' \
    --userId 'o8SjDAM0Riw8wLYW' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserPermissionV3' test.out

#- 192 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3n4F3LD1EDwBXw5u' \
    --after 'BYeQZOzATNSV9E9y' \
    --before 'yNb7yaLXzAVYymOu' \
    --limit '15' \
    --platformId 'buzm7DzJ20NFRJIh' \
    --targetNamespace 'FXR2dYprPmbpuptE' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserPlatformAccountsV3' test.out

#- 193 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CGd5cdXC2Sesc6y6' \
    --status '8whNBYl9iCqfW6rq' \
    > test.out 2>&1
eval_tap $? 193 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 194 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'GOQny4ij4ysYPonb' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetListJusticePlatformAccounts' test.out

#- 195 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '59gQffkNOmubxEJr' \
    --userId '2qEAuJbpZSrcbc4L' \
    > test.out 2>&1
eval_tap $? 195 'AdminGetUserMapping' test.out

#- 196 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'WfKaY5c1tP5TDuI5' \
    --userId 'f6m4KC07CnsZe32h' \
    > test.out 2>&1
eval_tap $? 196 'AdminCreateJusticeUser' test.out

#- 197 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'qEcB1ExYMBb3ckvo' \
    --skipConflict  \
    --body '{"platformId": "aJYdMqGegcg3eRvB", "platformUserId": "ZXN3cjIXmFWRJnj8"}' \
    > test.out 2>&1
eval_tap $? 197 'AdminLinkPlatformAccount' test.out

#- 198 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xN7HDPTUEDPN1Kb4' \
    --platformId 'UTPWDXTSb55g8LST' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserLinkHistoriesV3' test.out

#- 199 AdminPlatformUnlinkV3
eval_tap 0 199 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 200 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 's7Nf95lGlPrf6obI' \
    --userId 'dnI6Ag7eUYcYJ4Qz' \
    > test.out 2>&1
eval_tap $? 200 'AdminPlatformUnlinkAllV3' test.out

#- 201 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XCmqr6gmPGaHP5SV' \
    --userId 'PvRLiDi0mNHb6Lx8' \
    --ticket 'eq8SGNwEQO8dYXvB' \
    > test.out 2>&1
eval_tap $? 201 'AdminPlatformLinkV3' test.out

#- 202 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 202 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 203 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SYvJBwb6CjZUMRf2' \
    --userId 'VJetWsokvx3BHuTE' \
    > test.out 2>&1
eval_tap $? 203 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 204 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'czr9KjQ3ttz8MTBt' \
    --userId '1xk9IyssSA8nP5PQ' \
    --platformToken 'jpzk2Tb7iYdmNZWo' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 205 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'srsVBPZ64j0HUONs' \
    --userId 'cofwYLQcDvkaEIIP' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 205 'AdminGetUserSinglePlatformAccount' test.out

#- 206 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oJT83zEGXmVBZLyr' \
    --body '["H9J7BoysmaORLkP5", "hc2Fh04JTsqDTynC", "ewqJligLlRxOelKy"]' \
    > test.out 2>&1
eval_tap $? 206 'AdminDeleteUserRolesV3' test.out

#- 207 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kICRxF6HtlER2txs' \
    --body '[{"namespace": "4qrNARATn6KXOutl", "roleId": "YBbLhL8KXx25FZfQ"}, {"namespace": "IodVBqQsBpCJBIXL", "roleId": "GYcwWVRK6UKk5ozr"}, {"namespace": "XA4HZHNyq9odanhR", "roleId": "1Zrm3thUvV87yfky"}]' \
    > test.out 2>&1
eval_tap $? 207 'AdminSaveUserRoleV3' test.out

#- 208 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'cLSVdleSaAylsmLY' \
    --userId 'e2phYOgT5kDTyPl3' \
    > test.out 2>&1
eval_tap $? 208 'AdminAddUserRoleV3' test.out

#- 209 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'dKF7NXEjrJMki8jv' \
    --userId 'c3P8Gwjg3IOH0SDH' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserRoleV3' test.out

#- 210 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gYKqxJiFJdrmj5vh' \
    --body '{"enabled": true, "reason": "nYi5UWs3tYlYeMoC"}' \
    > test.out 2>&1
eval_tap $? 210 'AdminUpdateUserStatusV3' test.out

#- 211 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'imJySocRvUWDOrFZ' \
    --body '{"emailAddress": "KPNoN9AWtLK9TFgi", "password": "9j2XMh9WpifqjNjL"}' \
    > test.out 2>&1
eval_tap $? 211 'AdminTrustlyUpdateUserIdentity' test.out

#- 212 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OtNQts2yxf6MLZJ2' \
    > test.out 2>&1
eval_tap $? 212 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 213 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'jZfZbpTJezzriCDW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "XT59SRu0YqUxKDc8"}' \
    > test.out 2>&1
eval_tap $? 213 'AdminUpdateClientSecretV3' test.out

#- 214 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId '4OMIzvTScdbKBsAy' \
    > test.out 2>&1
eval_tap $? 214 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 215 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'JMz4ILNDvhB4Eoes' \
    --before '9a6XaJeRbzTPwD3j' \
    --isWildcard  \
    --limit '49' \
    > test.out 2>&1
eval_tap $? 215 'AdminGetRolesV3' test.out

#- 216 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "managers": [{"displayName": "xRUY0ilrNoFT98Sg", "namespace": "tJd4Z5f8nfaKqdZF", "userId": "LbZEHxsDxeR6d7r1"}, {"displayName": "SQw80JfMpPrSqYyp", "namespace": "RUnq5o4ETeCUYG9c", "userId": "cTt7Wxw8OQ13t3uT"}, {"displayName": "w6zQuoZcXQpoTOxe", "namespace": "8y1jorNsg9ZKYCKo", "userId": "ISyXtHzoWGdYohxM"}], "members": [{"displayName": "p3uOQIybqWfG9BJ6", "namespace": "FVKlbYHtbPtaxvag", "userId": "SlpGgVTF6VeDAPOG"}, {"displayName": "BwweyFfXEOEAEtba", "namespace": "g82KgBgyCd5vjkfz", "userId": "3eR4DtNp129hzBw3"}, {"displayName": "xLUcCEt0DzmkJq1s", "namespace": "ml5bYt76BNsi4giR", "userId": "9434WpKKdzxoufCN"}], "permissions": [{"action": 24, "resource": "thrpnMUBsnUfuQIc", "schedAction": 92, "schedCron": "eoBHTdwAk7ZQnbqY", "schedRange": ["1cQwVEtAr5kKKAo9", "MM2Cqm84jVi9kIpq", "grzpUkNOBWydXV0F"]}, {"action": 18, "resource": "t1Bjj3b8QM8Rr45U", "schedAction": 77, "schedCron": "k8rVNrm8drv8QD2J", "schedRange": ["Oe2Ntz7EFvowPgIG", "uetxFMqXCQMAqQ2Z", "RGzNtrThFa9XU8mo"]}, {"action": 38, "resource": "MM83WekqfWv04vvn", "schedAction": 3, "schedCron": "uaDzsr9xYiWRuuzQ", "schedRange": ["JiLc1eI9w3JEhxPG", "bEk7s7gw07FlounC", "3vJKBC7SwgoViPeI"]}], "roleName": "B4Ehy0Y5aSJVDgin"}' \
    > test.out 2>&1
eval_tap $? 216 'AdminCreateRoleV3' test.out

#- 217 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'xAM77eY9C14FbfiI' \
    > test.out 2>&1
eval_tap $? 217 'AdminGetRoleV3' test.out

#- 218 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId '2NPvl1kCY5bEokxX' \
    > test.out 2>&1
eval_tap $? 218 'AdminDeleteRoleV3' test.out

#- 219 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'xkWZbjf7GZxaossQ' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "jo69wohJFyTNk5FG"}' \
    > test.out 2>&1
eval_tap $? 219 'AdminUpdateRoleV3' test.out

#- 220 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'UPhR4LEZvz3EjFR7' \
    > test.out 2>&1
eval_tap $? 220 'AdminGetRoleAdminStatusV3' test.out

#- 221 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId '996Ug5m4axDV5uTc' \
    > test.out 2>&1
eval_tap $? 221 'AdminUpdateAdminRoleStatusV3' test.out

#- 222 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'YsoahUrELQ1btjJO' \
    > test.out 2>&1
eval_tap $? 222 'AdminRemoveRoleAdminV3' test.out

#- 223 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'qQMgZWAU6E92nHJz' \
    --after 'vw7tnYtGfv0EJyjB' \
    --before 'u4EzwRjD7jmQJeFP' \
    --limit '12' \
    > test.out 2>&1
eval_tap $? 223 'AdminGetRoleManagersV3' test.out

#- 224 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'H86d9rsKgzCsMulp' \
    --body '{"managers": [{"displayName": "B8HZUtVVaJCiLgKO", "namespace": "wrSfWhT5B4Wedopz", "userId": "wSluBtRFPKThyGnb"}, {"displayName": "jmPDKFS6u9FHuv1M", "namespace": "3qfch4SqIV6LQPHl", "userId": "aeYl4csFq65cU66y"}, {"displayName": "Jaj4ovoKWE4EW0sw", "namespace": "8v5peiuxoBJATauy", "userId": "D3XCXVMiyEvMf9yi"}]}' \
    > test.out 2>&1
eval_tap $? 224 'AdminAddRoleManagersV3' test.out

#- 225 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'lUEujk6oqYo1HQYT' \
    --body '{"managers": [{"displayName": "FzwdOMdupwD4O3uN", "namespace": "bcIDcIyvZbOy1T4h", "userId": "fwkuVykH4RpfmjIX"}, {"displayName": "FGZ5PKdbabJIkNnt", "namespace": "9P1Tkm08luh4dpPR", "userId": "MDbUXBWTbpAogG2w"}, {"displayName": "lZkLhuU5FI8NijFI", "namespace": "0GKwJ3vfXlsAMy2Z", "userId": "p2UAGxHnmSxvkG9U"}]}' \
    > test.out 2>&1
eval_tap $? 225 'AdminRemoveRoleManagersV3' test.out

#- 226 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'R5q9neoW6JBcGp9R' \
    --after 'x2RfcRhXpmeeHdvp' \
    --before 'has9S7ivHEoLbUMM' \
    --limit '58' \
    > test.out 2>&1
eval_tap $? 226 'AdminGetRoleMembersV3' test.out

#- 227 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'f1UreUpxEkXIbE1E' \
    --body '{"members": [{"displayName": "TzRJZKMavu4Ul2Ia", "namespace": "ieEbPSE7TGkeHsYs", "userId": "W9oGBN1pYMBwbPZT"}, {"displayName": "lMlUvFEiGprcNSQ9", "namespace": "kEeXBZ6FVrBzyhyh", "userId": "oS6a9oe0JaXFpff2"}, {"displayName": "8uYbe4Cf2HEHvVev", "namespace": "hISjbtBJUK5fE3Ou", "userId": "fPSX3PdOU2V9yw94"}]}' \
    > test.out 2>&1
eval_tap $? 227 'AdminAddRoleMembersV3' test.out

#- 228 AdminRemoveRoleMembersV3
eval_tap 0 228 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 229 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'oa8UJ34TIedV3Hyo' \
    --body '{"permissions": [{"action": 44, "resource": "4VnO2LpBU08wfnlH", "schedAction": 57, "schedCron": "DllwzTRHak1MXxj7", "schedRange": ["Esrg7900nml5Bids", "K9dCEzhVnOv0PQbV", "IaKiHfoeorY7A1ot"]}, {"action": 66, "resource": "H7r1ta3m7jK5pxe8", "schedAction": 32, "schedCron": "Ic6EFqBKxbS7Q2Og", "schedRange": ["RucL1jwRXzfjDZZB", "mOau6syme06c6SKL", "c2mEC3IXl5XCbkOf"]}, {"action": 70, "resource": "IzjoSV31tvmMB6jz", "schedAction": 35, "schedCron": "LfU7HByGXPMqxj4h", "schedRange": ["BgVY3YAxZLKbcOdy", "jqf6Q4oiwoJcaRME", "b15LBlTVufc5ZyOD"]}]}' \
    > test.out 2>&1
eval_tap $? 229 'AdminUpdateRolePermissionsV3' test.out

#- 230 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'R2NVyn4PRqf3eRbZ' \
    --body '{"permissions": [{"action": 34, "resource": "hNP4t6kYBUjyXAn3", "schedAction": 3, "schedCron": "Brt1kcLmRv6EJtl5", "schedRange": ["xWnsb8oWq94RImNW", "VIJnhhwFDV1Vitao", "mvWTzdsW4N70wYS4"]}, {"action": 74, "resource": "gAnZV4IOglVLqb9l", "schedAction": 66, "schedCron": "1dYdvGxJAMDRA1LF", "schedRange": ["7jdWlekFwO94VBCV", "9qJhWva2FPBujX0g", "eYCpGJM4sqsPNJMi"]}, {"action": 15, "resource": "XXOFwmGWAvNF0Z0G", "schedAction": 22, "schedCron": "QD4hEk0OLjYsnign", "schedRange": ["E7KcMF7fuDbzRRYM", "NXWUsp1tOibJY9aL", "9ie6vvMbiNURrlm8"]}]}' \
    > test.out 2>&1
eval_tap $? 230 'AdminAddRolePermissionsV3' test.out

#- 231 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId '8QlKyuoya4JgakZy' \
    --body '["UV7t73VnSFbuxd4K", "YZ0jk0UZdhtnKu9o", "Tc8pVkiyGsj5JdXz"]' \
    > test.out 2>&1
eval_tap $? 231 'AdminDeleteRolePermissionsV3' test.out

#- 232 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '88' \
    --resource 'oiFchQnVeq3g2AB2' \
    --roleId 'WIRUQmauIY5HXCZ0' \
    > test.out 2>&1
eval_tap $? 232 'AdminDeleteRolePermissionV3' test.out

#- 233 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 233 'AdminGetMyUserV3' test.out

#- 234 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'W4XmWP0HzSdiylLh' \
    --extendExp  \
    --redirectUri 'VYszm8xY33OQbumu' \
    --password '2QHLyZNuysyM4OfC' \
    --requestId 'zdQCXMAWnf87YPNO' \
    --userName 'e9Eevf1fhMg1E2k7' \
    > test.out 2>&1
eval_tap $? 234 'UserAuthenticationV3' test.out

#- 235 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'QLFrVgtX7y0fPOie' \
    --linkingToken 'DCow2zXyFFVpM87y' \
    --password 'qEwEacQMTlqN4LKk' \
    --username 'xJ5v3SBafnKNiMPb' \
    > test.out 2>&1
eval_tap $? 235 'AuthenticationWithPlatformLinkV3' test.out

#- 236 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'FkFGA85W3HJkqgS2' \
    --linkingToken 'B37wwoPYOHiIsxms' \
    --password 'LBPBJuNLnWRrtW87' \
    --username '0qD88ZcduZSe7W20' \
    > test.out 2>&1
eval_tap $? 236 'AuthenticateAndLinkForwardV3' test.out

#- 237 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'UZcDaiq0nEZ7Pyhq' \
    --extendExp  \
    --linkingToken 'FJkDClOsKmfsgJdm' \
    > test.out 2>&1
eval_tap $? 237 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 238 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'zsDPsWh1k0cQ08NG' \
    --state '6dX2TZkil67kRngo' \
    --platformId 'Ua83ECh1gqPeS193' \
    > test.out 2>&1
eval_tap $? 238 'RequestOneTimeLinkingCodeV3' test.out

#- 239 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'TNNzot3sVli3GN2X' \
    > test.out 2>&1
eval_tap $? 239 'ValidateOneTimeLinkingCodeV3' test.out

#- 240 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'TrFibRAhzzEWzWlT' \
    --isTransient  \
    --clientId 'Y70qdgJRvpZrSpWX' \
    --oneTimeLinkCode '3KEe2BjV00ReCXFf' \
    > test.out 2>&1
eval_tap $? 240 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 241 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 241 'GetCountryLocationV3' test.out

#- 242 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 242 'Logout' test.out

#- 243 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'fjJJxlgjzIhpgOoI' \
    --codeChallengeMethod 'S256' \
    --clientId 'D74V21HWDAfvXwdx' \
    > test.out 2>&1
eval_tap $? 243 'RequestTokenExchangeCodeV3' test.out

#- 244 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'byp4HAPbBbNPStVB' \
    --userId 'UpKgOssFkz0F36pi' \
    --platformUserId 'DYXeHZ7FHls3nyvc' \
    > test.out 2>&1
eval_tap $? 244 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 245 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'onqbHQqKLQKe3xmj' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 245 'RevokeUserV3' test.out

#- 246 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId '6s0GqsWncp5Lrqbi' \
    --codeChallenge 'Kudv9z75SzoCV8ZM' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'IKBXDFQfXFD58sG6' \
    --oneTimeLinkCode 'uDhFYlrzJBYSeMuJ' \
    --redirectUri 'fQecutjS029BiJWO' \
    --scope 'G1m7MKclr5igjNTV' \
    --state 'ItrH2X78hxJgaVfw' \
    --targetAuthPage '5Vnyq8OzTE89WDNo' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'McOmbfJrCJQIj1ha' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 246 'AuthorizeV3' test.out

#- 247 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'rmzafMUguyDoN91u' \
    > test.out 2>&1
eval_tap $? 247 'TokenIntrospectionV3' test.out

#- 248 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 248 'GetJWKSV3' test.out

#- 249 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'c28HoSpGt1g0GGbT' \
    --factor '4Hf2PPKOldkbgX9C' \
    --mfaToken 'WJKwXXSbv5eg9q86' \
    > test.out 2>&1
eval_tap $? 249 'SendMFAAuthenticationCode' test.out

#- 250 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'IaDFjjx6uZerWbtw' \
    --mfaToken 'TX9gNRByjbE8lOLA' \
    > test.out 2>&1
eval_tap $? 250 'Change2faMethod' test.out

#- 251 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'fTXKLzbrddqcKLa7' \
    --factor 'LevxNHOSEhQRZIp6' \
    --mfaToken '93lRwtc43atCuCFx' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 251 'Verify2faCode' test.out

#- 252 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'bfbz4aQERziPL4dH' \
    --factors 'hOqG5KDdUvk0LEi2' \
    --rememberDevice  \
    --clientId '6Ls7mjRxNmvvNtjJ' \
    --code 'NQepUTGhwlY4lPzl' \
    --factor 'sCR5rVsyfcH7WjP7' \
    --mfaToken 'HuGz3b5WAEvdRF9b' \
    > test.out 2>&1
eval_tap $? 252 'Verify2faCodeForward' test.out

#- 253 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qMj4ro5B19VE838c' \
    --userId '7OydVw0zCqoMZvpI' \
    > test.out 2>&1
eval_tap $? 253 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 254 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'OO97DmQ5ZOzx6iCJ' \
    --clientId 'Tu60IifzMhkk5Pxs' \
    --redirectUri 'jqbCKpMv2Yky9DYk' \
    --requestId 'D2sIllFtBtXJKG3r' \
    > test.out 2>&1
eval_tap $? 254 'AuthCodeRequestV3' test.out

#- 255 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'qBmILhtWm8RQvRUb' \
    --additionalData 'UDSiefGEdLucrtO2' \
    --clientId 'gCQD057DrDlgC2nz' \
    --createHeadless  \
    --deviceId 'S9SiGUjVAw4v3q6J' \
    --macAddress 'RHcn7KaoCEkRdo6q' \
    --platformToken 'HYIZWnXqQ1oHFJ9Q' \
    --serviceLabel '0.8515133805298677' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 255 'PlatformTokenGrantV3' test.out

#- 256 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 256 'GetRevocationListV3' test.out

#- 257 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'vqsL9SomqWsGA76y' \
    > test.out 2>&1
eval_tap $? 257 'TokenRevocationV3' test.out

#- 258 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'xi0QzZWfmP2sx0KO' \
    --simultaneousTicket '5bEJaPnAFjsodyJQ' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'VBrShGbIIuqK8C40' \
    > test.out 2>&1
eval_tap $? 258 'SimultaneousLoginV3' test.out

#- 259 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData '3HgoXCR6XOMXwKdf' \
    --clientId 'qk8T4QHK30EX0Fcl' \
    --clientSecret 'pDl5HsuracO5Mnjn' \
    --code 'xD1OXkxShFVQTRek' \
    --codeVerifier 'Lfjmy8zosRCRgVwb' \
    --extendNamespace 'rQKmb01yA7U7dGMj' \
    --extendExp  \
    --password 'upZkZQY8CNyT4k3D' \
    --redirectUri 'IbfT22G5NpE130YW' \
    --refreshToken 'SgxpKWtdtdtVW9an' \
    --username 'ENmxb9e7vXZV3ig8' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 259 'TokenGrantV3' test.out

#- 260 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'pxqZ209BySn8aUaG' \
    > test.out 2>&1
eval_tap $? 260 'VerifyTokenV3' test.out

#- 261 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'lAyvIslt7N1qcxKs' \
    --code '4nlf1MfqUZXkjHvc' \
    --error 'UOTlxNf09pefgFIi' \
    --openidAssocHandle 'JssShBKsQjXvfQgQ' \
    --openidClaimedId 'Dt6ce8NDMErA82Fr' \
    --openidIdentity 'R1GSogkewIzTOqKk' \
    --openidMode 'cjRh3l2gAJOTCbx7' \
    --openidNs 'J3gNLIlTk3Bpclrk' \
    --openidOpEndpoint '4hIRn0znIKzAEAHQ' \
    --openidResponseNonce 'pBOgHEP5l94s7CbI' \
    --openidReturnTo 'J7eHnVWOboMkyB7F' \
    --openidSig 'TexsOZ0b2p3b63Kr' \
    --openidSigned 'cwIcXMhGy83Xit6b' \
    --state 'oOLGCcg16DqwdQPQ' \
    > test.out 2>&1
eval_tap $? 261 'PlatformAuthenticationV3' test.out

#- 262 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId '9HkSSV8e1MgTTLS2' \
    --platformToken 'FgarY903INGIyEfR' \
    > test.out 2>&1
eval_tap $? 262 'PlatformTokenRefreshV3' test.out

#- 263 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'BEj7qms9AGQExPhg' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetInputValidations' test.out

#- 264 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'r9gGfC0GjvpgJfuB' \
    > test.out 2>&1
eval_tap $? 264 'PublicGetInputValidationByField' test.out

#- 265 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 's1Vpqn47GVghTH2w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 265 'PublicGetCountryAgeRestrictionV3' test.out

#- 266 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'ToOnq9U5lyW89Xwt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 266 'PublicGetConfigValueV3' test.out

#- 267 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 267 'PublicGetCountryListV3' test.out

#- 268 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 268 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 269 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId '3wmRTrDCjhnKvsHe' \
    > test.out 2>&1
eval_tap $? 269 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 270 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 270 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 271 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zWTqgYPixtHk6lWq' \
    --platformUserId '6tEeUmU96FLEak0m' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetUserByPlatformUserIDV3' test.out

#- 272 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'username' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetProfileUpdateStrategyV3' test.out

#- 273 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'qjRYldcTpdeCD9XP' \
    > test.out 2>&1
eval_tap $? 273 'PublicGetAsyncStatus' test.out

#- 274 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'Ri4bAQL7VE2wL8Y4' \
    --limit '74' \
    --offset '64' \
    --platformBy 'BWCMqPsRk5htdM5T' \
    --platformId '3fDSrSHrkoqv2mM6' \
    --query 'soMaTvQq2a9YdFNt' \
    > test.out 2>&1
eval_tap $? 274 'PublicSearchUserV3' test.out

#- 275 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "RVSO0js0hG9xmSnz", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "pvHCDx55JZ5z6guj", "policyId": "pFzlPspQD9IRIpDD", "policyVersionId": "ubntPCFxfeoW2NdS"}, {"isAccepted": true, "localizedPolicyVersionId": "SAS8MKMaxQ1QyJCp", "policyId": "KedhuzI7G9NCKKXu", "policyVersionId": "1bqI2M5PmXfKnQ7B"}, {"isAccepted": false, "localizedPolicyVersionId": "GjCUDMOrbmoRvWnf", "policyId": "mGFy0eUoOBd90h9E", "policyVersionId": "DqSTOfoNewWjwMWD"}], "authType": "KEt6JhbJ0fwTDaq6", "code": "b5RpMwhWPtndriXU", "country": "9loOxpmEuwDVc12r", "dateOfBirth": "0DVUGgGHkapTCafF", "displayName": "MdvYiCBuzUUwyI6V", "emailAddress": "td4v9k4fv3kMiuQ3", "password": "DhsKLxjt5srPFxBg", "reachMinimumAge": false, "uniqueDisplayName": "kmb15QeIQF51c4Mq"}' \
    > test.out 2>&1
eval_tap $? 275 'PublicCreateUserV3' test.out

#- 276 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'JzDSvELgBe6dboSd' \
    --query 'hkBzAzPkt1efGJeJ' \
    > test.out 2>&1
eval_tap $? 276 'CheckUserAvailability' test.out

#- 277 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["axyHYutgXucx85vH", "A009FAb21jxeWXk8", "0y9uxgVLGgK8aVSC"]}' \
    > test.out 2>&1
eval_tap $? 277 'PublicBulkGetUsers' test.out

#- 278 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "N6oCETQ8gIDRdD2w", "languageTag": "wMXwKVXGPhEJsc7r"}' \
    > test.out 2>&1
eval_tap $? 278 'PublicSendRegistrationCode' test.out

#- 279 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ZpxaPHc9r8eToFmk", "emailAddress": "HJ6BPOKFLxIwKssw"}' \
    > test.out 2>&1
eval_tap $? 279 'PublicVerifyRegistrationCode' test.out

#- 280 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "647YwDudnGRufOUG", "languageTag": "fMjTU226l07jPlcY"}' \
    > test.out 2>&1
eval_tap $? 280 'PublicForgotPasswordV3' test.out

#- 281 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "aqYM7YfBmhjI9Y28", "password": "qVceS9UX48dKPCFU", "uniqueDisplayName": "IeyYEymNXzNX6TGh", "username": "4UdEweeBsJEvBbAv"}' \
    > test.out 2>&1
eval_tap $? 281 'PublicValidateUserInput' test.out

#- 282 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'Cmlh6Z1oz9BaixUU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 282 'GetAdminInvitationV3' test.out

#- 283 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'vmzbajE2gjooiDnc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "1NUb51lEgUwQ9tkW", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "xSPgPCiwLxCFLDix", "policyId": "ZwVtt3RVTl0tR00o", "policyVersionId": "QgcHdGGK3x76U1EI"}, {"isAccepted": false, "localizedPolicyVersionId": "wF7RnP1oK3c4RVfj", "policyId": "B0zi3XrYZUiN24ol", "policyVersionId": "1qqbalgizL97ycJV"}, {"isAccepted": false, "localizedPolicyVersionId": "qE2myQzl7X9fHr6W", "policyId": "vBxmBvNj3ktaDf9B", "policyVersionId": "22HGgxakPt7IYzaZ"}], "authType": "UTmvsEzLPnnGsnfm", "code": "Berp84qjwzWpCF1v", "country": "yamjsEzwtLPxK1os", "dateOfBirth": "4qR8LaQzEb39sZTd", "displayName": "FfC8x5aHLsXHlm1R", "emailAddress": "JTTy9JrNz1K5M1qg", "password": "FddYvifGHawNx6yh", "reachMinimumAge": false, "uniqueDisplayName": "RM69XKkLwioRaKnW"}' \
    > test.out 2>&1
eval_tap $? 283 'CreateUserFromInvitationV3' test.out

#- 284 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "hlh80BhYe2fJDS6T", "country": "75Q4ulonMFjmYqE1", "dateOfBirth": "wJhfogWg2Apm0sUy", "displayName": "18aWn65Co0vdCk8s", "languageTag": "o6JSaZAIadKDEZyw", "uniqueDisplayName": "onA2SrEdN2tmGuX6", "userName": "r0gBVUUeKKlPKtE6"}' \
    > test.out 2>&1
eval_tap $? 284 'UpdateUserV3' test.out

#- 285 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "gnYxmkmCWbs5qugk", "country": "lBUS6uwWrCQt86Jr", "dateOfBirth": "g8tLAJWpcyNkUvqn", "displayName": "6eXr6FNbKJ05Orya", "languageTag": "6LSSUlugIAknXcSa", "uniqueDisplayName": "VYcAYp7qSiDvsfMU", "userName": "OpWv46sXvpOjrpRo"}' \
    > test.out 2>&1
eval_tap $? 285 'PublicPartialUpdateUserV3' test.out

#- 286 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "4mYrCeQUnYoID2Uq", "emailAddress": "O0iAXA9dB4ib8HDO", "languageTag": "J8TNiP8KgEAj3dbR", "upgradeToken": "TI0i6dO3zkbDseh4"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicSendVerificationCodeV3' test.out

#- 287 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "tJdoGcwMBmegqVUa", "contactType": "WMJBjrV0p9A7tcHr", "languageTag": "V0MbJGr4drgkDuWS", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 287 'PublicUserVerificationV3' test.out

#- 288 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "5m0pGzazM2BUXnzU", "country": "EWTiKMJAf6AgbiED", "dateOfBirth": "MfCckWogE5gcfF8A", "displayName": "MGZ2FBS93Mg6TKwd", "emailAddress": "RMraDLrwh3d0ykRG", "password": "kgqUNIbJMJ9ABbKV", "uniqueDisplayName": "WO2YEDiqkwKbpdk7", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 288 'PublicUpgradeHeadlessAccountV3' test.out

#- 289 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "D02YMvEUNfoL7JCc", "password": "Mo7GxxXdbYCRexPe"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicVerifyHeadlessAccountV3' test.out

#- 290 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "kTsQxMTfaSot7aoh", "mfaToken": "FYy4VxwHIJ9gzxqA", "newPassword": "w4vBGQAeh0VTiTP4", "oldPassword": "PSrXUS6jYI9lsQFD"}' \
    > test.out 2>&1
eval_tap $? 290 'PublicUpdatePasswordV3' test.out

#- 291 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '43Df5qUZOFzpFd6b' \
    > test.out 2>&1
eval_tap $? 291 'PublicCreateJusticeUser' test.out

#- 292 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5Jc5TETHcup8GG0V' \
    --redirectUri 'CMTFJ6svTyo9RHge' \
    --ticket 't5hzB52BDFopxUwk' \
    > test.out 2>&1
eval_tap $? 292 'PublicPlatformLinkV3' test.out

#- 293 PublicPlatformUnlinkV3
eval_tap 0 293 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 294 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MuSqQnKzDgDAtqE3' \
    > test.out 2>&1
eval_tap $? 294 'PublicPlatformUnlinkAllV3' test.out

#- 295 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kuybwTQFYEJjIYwq' \
    --ticket 'fSRy8GgVk77fd1GS' \
    > test.out 2>&1
eval_tap $? 295 'PublicForcePlatformLinkV3' test.out

#- 296 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId '5YkyhAiAItnWUmD2' \
    --clientId '25fp1egsx3ErheNw' \
    --redirectUri 'qd5priclNNqLyrlz' \
    > test.out 2>&1
eval_tap $? 296 'PublicWebLinkPlatform' test.out

#- 297 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rJ4QHbfnAdtkujxH' \
    --code 'ff7n1yaNCcjgFhS0' \
    --state 'URBhl0L5FCbOn46W' \
    > test.out 2>&1
eval_tap $? 297 'PublicWebLinkPlatformEstablish' test.out

#- 298 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2B2uPQLrt2t6bVpC' \
    --code 'gKvPXSDufmKh783c' \
    --state 'V54JsVBRB0rY0xfW' \
    > test.out 2>&1
eval_tap $? 298 'PublicProcessWebLinkPlatformV3' test.out

#- 299 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "ddACyHSmo4KX9TPO", "userIds": ["3K1k5ZM8btmGsgXN", "Xbpqxh76Af5JSwjw", "2fE2g6jXV7oai2oD"]}' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetUsersPlatformInfosV3' test.out

#- 300 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "m9FaP0HJ98tE4Uyo", "code": "Qg0b0sGOkzxVt15L", "emailAddress": "KmkQ7YBhsOuJ0ypk", "languageTag": "kt2G4eFh2YNsdoxp", "newPassword": "LTBM9Q8t829Ido1J"}' \
    > test.out 2>&1
eval_tap $? 300 'ResetPasswordV3' test.out

#- 301 PublicGetUserByUserIdV3
eval_tap 0 301 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 302 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yveSRiBq23kyH9jQ' \
    --activeOnly  \
    --after 'bHWkcVk0X28GS54v' \
    --before 'l7gIKBc7OYTylFRA' \
    --limit '72' \
    > test.out 2>&1
eval_tap $? 302 'PublicGetUserBanHistoryV3' test.out

#- 303 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zZVnkLT0Lb85nmpd' \
    > test.out 2>&1
eval_tap $? 303 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 304 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'N26BY5YI0jeO2zMD' \
    > test.out 2>&1
eval_tap $? 304 'PublicGetUserInformationV3' test.out

#- 305 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sy4kyqyKgrtEPdXX' \
    --after '0.18285362614875977' \
    --before '0.30904043977594076' \
    --limit '48' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetUserLoginHistoriesV3' test.out

#- 306 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'geCdiXu3iNvn7vLZ' \
    --after '7h6alhJNGZF07lsP' \
    --before 'P5OfHbXzWnVO2U4u' \
    --limit '50' \
    --platformId 'gZsRPOzwuDSdGl1A' \
    > test.out 2>&1
eval_tap $? 306 'PublicGetUserPlatformAccountsV3' test.out

#- 307 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2vaNeDiSqTfmAVg5' \
    > test.out 2>&1
eval_tap $? 307 'PublicListJusticePlatformAccountsV3' test.out

#- 308 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '0kOdJagEmTuaxlxg' \
    --body '{"platformId": "ywkbdOsyxX1tfW48", "platformUserId": "8oYUT4jyCVJ0V8ob"}' \
    > test.out 2>&1
eval_tap $? 308 'PublicLinkPlatformAccount' test.out

#- 309 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'TlGVThz4bm41oIcV' \
    --body '{"chosenNamespaces": ["33yjPxibDjfF7Jkj", "CVpZKMxkFkBtXMU6", "KRIm5xBoIi99ctgF"], "requestId": "Xasxp5h780ktjQw2"}' \
    > test.out 2>&1
eval_tap $? 309 'PublicForceLinkPlatformWithProgression' test.out

#- 310 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yXzaQWaF2PqUfbpM' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetPublisherUserV3' test.out

#- 311 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pRl6xRyV19cborUH' \
    --password 'eCpqnZ5NW623WWn2' \
    > test.out 2>&1
eval_tap $? 311 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 312 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'ZJY3QvRa7CDRTcsA' \
    --before 'HzD3dZyyWbUQpbcv' \
    --isWildcard  \
    --limit '18' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetRolesV3' test.out

#- 313 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'IwmL7a1K3zIUYJmd' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetRoleV3' test.out

#- 314 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 314 'PublicGetMyUserV3' test.out

#- 315 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "F1YtWNSQlcMzxfpp", "emailAddress": "NCrscDPbklTHcmgX", "languageTag": "srVj3Mjml6BpCODW", "upgradeToken": "GOLMmCZUeelXYyNr"}' \
    > test.out 2>&1
eval_tap $? 315 'PublicSendCodeForwardV3' test.out

#- 316 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'XweiCnDldRPRfd6m' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 317 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["LZ0GTJwEjoZrRtae", "WKMC8wsOByQAMAgq", "FEzEt8umj5XhKnw7"], "oneTimeLinkCode": "MHDwFVKUC2ecnpUD"}' \
    > test.out 2>&1
eval_tap $? 317 'LinkHeadlessAccountToMyAccountV3' test.out

#- 318 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'qvLQixPKVSmWa8TG' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 319 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 319 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 320 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "ko16XTqHc0cM7ixq"}' \
    > test.out 2>&1
eval_tap $? 320 'PublicSendVerificationLinkV3' test.out

#- 321 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 321 'PublicGetOpenidUserInfoV3' test.out

#- 322 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code '8Tjnxp5Cl8ggaEmC' \
    > test.out 2>&1
eval_tap $? 322 'PublicVerifyUserByLinkV3' test.out

#- 323 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'cuK2hHviBEWpbusO' \
    --code '6EyVqstpgZpbz77y' \
    --error '88rUFum2ZcA8iKcF' \
    --state '0bkfjcTEFXcTwEtn' \
    > test.out 2>&1
eval_tap $? 323 'PlatformAuthenticateSAMLV3Handler' test.out

#- 324 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'HxP5pVtN4jNVIdru' \
    --payload 'EA39uCJzsE8WObt6' \
    > test.out 2>&1
eval_tap $? 324 'LoginSSOClient' test.out

#- 325 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 't0w8LOBxE15JYj4I' \
    > test.out 2>&1
eval_tap $? 325 'LogoutSSOClient' test.out

#- 326 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'qWK09l4wkrzahXR1' \
    --code 'sDEDVKDINE3HjCiV' \
    > test.out 2>&1
eval_tap $? 326 'RequestTargetTokenResponseV3' test.out

#- 327 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'R1dQ8kuhb4pUwnGp' \
    --upgradeSuccessToken 'tHUplxzaDa9PDwhu' \
    > test.out 2>&1
eval_tap $? 327 'UpgradeAndAuthenticateForwardV3' test.out

#- 328 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '4' \
    --namespace "$AB_NAMESPACE" \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 328 'AdminListInvitationHistoriesV4' test.out

#- 329 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QTNEuBbeuQqm9wM7' \
    > test.out 2>&1
eval_tap $? 329 'AdminGetDevicesByUserV4' test.out

#- 330 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'mgTtUdPVcQijMBhs' \
    --endDate '0kDP6d3nuUZ41mSe' \
    --limit '91' \
    --offset '93' \
    --startDate '9SnGqhJOvykBcDpz' \
    > test.out 2>&1
eval_tap $? 330 'AdminGetBannedDevicesV4' test.out

#- 331 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'D9zh6dtPK4fVHLMv' \
    > test.out 2>&1
eval_tap $? 331 'AdminGetUserDeviceBansV4' test.out

#- 332 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "rCsH3RYxH2Up9Vth", "deviceId": "PjFrK7Hip0eONFDg", "deviceType": "UPShG8wwFKY9AMpc", "enabled": true, "endDate": "PuCOyphUUAV95708", "ext": {"zaP0wpZgQEvFzox9": {}, "wHocX3DRWobEoGr8": {}, "W97KBedcr6PM51z7": {}}, "reason": "i0wQ9egK2t46EG8I"}' \
    > test.out 2>&1
eval_tap $? 332 'AdminBanDeviceV4' test.out

#- 333 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId '2lTviKbOgVuN3nhk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 333 'AdminGetDeviceBanV4' test.out

#- 334 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'n6QIesNoYqvVsaky' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 334 'AdminUpdateDeviceBanV4' test.out

#- 335 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'nIAJfKVjOn6rtILN' \
    --startDate 'JVv2DLLUyBt5hDs4' \
    --deviceType '5siG30Lv9iGa5mkZ' \
    > test.out 2>&1
eval_tap $? 335 'AdminGenerateReportV4' test.out

#- 336 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 336 'AdminGetDeviceTypesV4' test.out

#- 337 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'jnRXVcg6AByNpBo2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 337 'AdminGetDeviceBansV4' test.out

#- 338 AdminDecryptDeviceV4
eval_tap 0 338 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 339 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'JYkwLdmR97u9MVUi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 339 'AdminUnbanDeviceV4' test.out

#- 340 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'i4KpYcb1AUsESaBO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 340 'AdminGetUsersByDeviceV4' test.out

#- 341 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 341 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 342 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 342 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 343 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 70, "userInfo": {"country": "LbG04KKnh3jvW0Qp"}}' \
    > test.out 2>&1
eval_tap $? 343 'AdminCreateTestUsersV4' test.out

#- 344 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "kTyL4CsLwiWUMcpx", "policyId": "n4B6XoTNMuqZTHwo", "policyVersionId": "1IAJQpb6r8ZeaSHw"}, {"isAccepted": true, "localizedPolicyVersionId": "wh59RGSbBMh7jpsz", "policyId": "uVk6iPdJ2boQqCCy", "policyVersionId": "JfThvCJieqRSGN8M"}, {"isAccepted": false, "localizedPolicyVersionId": "EeuzBBRSknxyWkZO", "policyId": "buvig8sMuss76ezT", "policyVersionId": "rsDZNYUV48Oh6I45"}], "authType": "EMAILPASSWD", "code": "vUtPYONZdFk75lkj", "country": "QNHrjaboGomguUqe", "dateOfBirth": "uZh5qtrRbNnGejdT", "displayName": "GvZgN5hshSe5YmZX", "emailAddress": "KEQLkM6o3eGSP4Ht", "password": "mr90TqGf0OyqJ9ib", "passwordMD5Sum": "JMmRgoxNwp1lGkYo", "reachMinimumAge": true, "uniqueDisplayName": "DN2lDvdh7okHl1wM", "username": "ht2Izq7TCUJhDsDe"}' \
    > test.out 2>&1
eval_tap $? 344 'AdminCreateUserV4' test.out

#- 345 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["advo5EzpX0IttsRe", "zyY9GB5sf94ALBmv", "dncQkcZb8cWdVH9b"]}' \
    > test.out 2>&1
eval_tap $? 345 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 346 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["ww15zZsaYrJAe5Kd", "5QB96ndlO6iPGC9R", "hzMC7V8BEphnRXnS"]}' \
    > test.out 2>&1
eval_tap $? 346 'AdminBulkCheckValidUserIDV4' test.out

#- 347 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pCzyb8FkoxQbrPng' \
    --body '{"avatarUrl": "i87K58pQswqKLutI", "country": "NusOsa92F6iwkJIY", "dateOfBirth": "OLarmpWyvib9CDW2", "displayName": "1ANrlpuXD9H1u1Cv", "languageTag": "zWPcZwkj1l6bf2F9", "skipLoginQueue": true, "uniqueDisplayName": "UinY5diUlqgvY7dP", "userName": "PyahppgxJhk4EdTZ"}' \
    > test.out 2>&1
eval_tap $? 347 'AdminUpdateUserV4' test.out

#- 348 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '000rS92594HLvWFs' \
    --body '{"code": "XHtMP0k9L5dREQbC", "emailAddress": "qfh0gpABFBER6WNc"}' \
    > test.out 2>&1
eval_tap $? 348 'AdminUpdateUserEmailAddressV4' test.out

#- 349 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DOsRzBkf9A6HjCnF' \
    --body '{"factor": "RdSihcvszzQLZBkt", "mfaToken": "k0siMup01kyaFwwD"}' \
    > test.out 2>&1
eval_tap $? 349 'AdminDisableUserMFAV4' test.out

#- 350 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '7wecuQb4GNQHVZMK' \
    > test.out 2>&1
eval_tap $? 350 'AdminGetUserMFAStatusV4' test.out

#- 351 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GBnzh4suaGIzttTn' \
    > test.out 2>&1
eval_tap $? 351 'AdminListUserRolesV4' test.out

#- 352 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cVBf5g3oeuHiNyLk' \
    --body '{"assignedNamespaces": ["fPQPmjUkvSs5YmIe", "jozmG5HlrIfMAvvp", "kAHRJHZyfrXZmiJX"], "roleId": "4CjKCeIRIr997KKp"}' \
    > test.out 2>&1
eval_tap $? 352 'AdminUpdateUserRoleV4' test.out

#- 353 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JXTLbYWpqeXjaf1f' \
    --body '{"assignedNamespaces": ["5fjNMZjKJ05puX31", "97WrMnJtovSMFw8X", "4zxbdfXgunt1oMNZ"], "roleId": "68eovHSH3xV3URIR"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminAddUserRoleV4' test.out

#- 354 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VDYBd6hMB0l7sg7I' \
    --body '{"assignedNamespaces": ["fMH5Tu1ky1ZYvyeH", "mfoFkUDP864shbnQ", "3bVvuvpsDJXPCWkX"], "roleId": "4Kpi8CJ88aMPGFFA"}' \
    > test.out 2>&1
eval_tap $? 354 'AdminRemoveUserRoleV4' test.out

#- 355 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '86' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 355 'AdminGetRolesV4' test.out

#- 356 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "Ry58UKWPv3F7S0wC"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminCreateRoleV4' test.out

#- 357 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'VlYQi9cfMCeNnu6O' \
    > test.out 2>&1
eval_tap $? 357 'AdminGetRoleV4' test.out

#- 358 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'IG1PPLRDEXLXZWXv' \
    > test.out 2>&1
eval_tap $? 358 'AdminDeleteRoleV4' test.out

#- 359 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'qNCHvNpeMjMzguq6' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "qwH9J6JLb5f3SBMy"}' \
    > test.out 2>&1
eval_tap $? 359 'AdminUpdateRoleV4' test.out

#- 360 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'JUdwEBRrHAWUFqTo' \
    --body '{"permissions": [{"action": 30, "resource": "mJHNffZENs9X0hFM", "schedAction": 7, "schedCron": "byOwXgKyPhXmcysa", "schedRange": ["e8HpWH4xiz3fWthJ", "Su2pUIIuPLFAtcWh", "jAP57QbWvSSp71zE"]}, {"action": 85, "resource": "pzlMlx7b2H2THLwZ", "schedAction": 66, "schedCron": "RtQOILcaDqUITBHQ", "schedRange": ["R5ISNoFR3GUxdMuv", "mL0UBfwzaaeP3Wd0", "Wrb8s3GW0CY0vAfb"]}, {"action": 33, "resource": "ushaKTPVjyOUpR3u", "schedAction": 96, "schedCron": "h60NUA2aKQwnXrmi", "schedRange": ["6ya8u4sQPvaf1Acw", "eR7tJW3MLMob1hUn", "IzIpUM8KK1kGFN0N"]}]}' \
    > test.out 2>&1
eval_tap $? 360 'AdminUpdateRolePermissionsV4' test.out

#- 361 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'UNGKxdlAUDFQuGPz' \
    --body '{"permissions": [{"action": 55, "resource": "MCGUJvERxNg8djSb", "schedAction": 98, "schedCron": "Vt2vKQ5vlCdI519P", "schedRange": ["f2iogwxM5DZM0dgo", "zmco41750xdYQg34", "WUV0WpmsQnp1n4YG"]}, {"action": 41, "resource": "H4dSaa8XYHug51ZT", "schedAction": 29, "schedCron": "Z2AQ1jvXYBar5RMm", "schedRange": ["mGdWl0wpj5tVfKU3", "D8WVPh0Z7YiGE2cy", "zTMBY7Xd0OoENg2L"]}, {"action": 46, "resource": "4noXDFaEUkPUBnB0", "schedAction": 78, "schedCron": "EJH3ebM71Tg922xi", "schedRange": ["BgHSka0Pz7I1WkIa", "0oZ1nXpW1l70pcZg", "In4lPghHyMEHBzAr"]}]}' \
    > test.out 2>&1
eval_tap $? 361 'AdminAddRolePermissionsV4' test.out

#- 362 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'byW10NkJFQxuMHnf' \
    --body '["OlX6HYVEiaereFCP", "JU2wEzUYUTmZ8JSM", "eNmRocp400RZe8Bz"]' \
    > test.out 2>&1
eval_tap $? 362 'AdminDeleteRolePermissionsV4' test.out

#- 363 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'x9aGEI22BTCZs97T' \
    --after 'JI8GPrM24F3celFg' \
    --before 'M62HQtgzQhO3nR8j' \
    --limit '73' \
    > test.out 2>&1
eval_tap $? 363 'AdminListAssignedUsersV4' test.out

#- 364 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'DlP6OGbn8vmfMYGL' \
    --body '{"assignedNamespaces": ["t1AjKhh3JMX7xSrz", "1EH6X2SM3xzsNrJz", "WBcdFlo7oAsOlfLB"], "namespace": "1J19b5rTfiL2P3r1", "userId": "a8KIJH33aKkPuWD5"}' \
    > test.out 2>&1
eval_tap $? 364 'AdminAssignUserToRoleV4' test.out

#- 365 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId '9MgTy1HA58Jt5NaR' \
    --body '{"namespace": "OjSKFEuZo2ElXYSS", "userId": "4ezBRSiOyReviDax"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminRevokeUserFromRoleV4' test.out

#- 366 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["lPdhwmcH03yoMxzR", "R6xd9rTh3ureaIbx", "M3Wev9pZQjWAN0tn"], "emailAddresses": ["y16ZHZtuSJGQCrM7", "JEMRPkdTcAzkIlnd", "N5xeayr3vUKMuIiz"], "isAdmin": true, "isNewStudio": false, "languageTag": "9O46OOzz9p57qSpH", "namespace": "erzO87cg7TqtMiQg", "roleId": "i7Aj28qCRbwwZc4Z"}' \
    > test.out 2>&1
eval_tap $? 366 'AdminInviteUserNewV4' test.out

#- 367 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "S1NMkrnHs1Iyhwqk", "country": "140MolIrnlkRVbcX", "dateOfBirth": "435TDYpkk2Gza6Dr", "displayName": "SycophHw3EoEEClT", "languageTag": "O9SDKnMlnKW9jiNM", "skipLoginQueue": true, "uniqueDisplayName": "It2nfhUaZGqjslu5", "userName": "9GT2E6AacmZRXZm6"}' \
    > test.out 2>&1
eval_tap $? 367 'AdminUpdateMyUserV4' test.out

#- 368 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "26POXWVj3KP1mX0i", "mfaToken": "YHXBU3Uk2tQm307I"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminDisableMyAuthenticatorV4' test.out

#- 369 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'ORTyHnLYDAAg1YA4' \
    > test.out 2>&1
eval_tap $? 369 'AdminEnableMyAuthenticatorV4' test.out

#- 370 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 370 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 371 AdminGetMyBackupCodesV4
eval_tap 0 371 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 372 AdminGenerateMyBackupCodesV4
eval_tap 0 372 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 373 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"factor": "kZURmoGgxVRMPf8g", "mfaToken": "1rbhfIMStMnSqrKW"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminDisableMyBackupCodesV4' test.out

#- 374 AdminDownloadMyBackupCodesV4
eval_tap 0 374 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 375 AdminEnableMyBackupCodesV4
eval_tap 0 375 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 376 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'YOuITlYS2RYaD9WN' \
    > test.out 2>&1
eval_tap $? 376 'AdminGetBackupCodesV4' test.out

#- 377 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'KGhbLhjz1v0RBIO2' \
    > test.out 2>&1
eval_tap $? 377 'AdminGenerateBackupCodesV4' test.out

#- 378 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'rkJGmPaK6HEVIQJd' \
    > test.out 2>&1
eval_tap $? 378 'AdminEnableBackupCodesV4' test.out

#- 379 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code '3930TGewjRyfo4nW' \
    --factor 'VZZbKFsKOmgEhjH2' \
    > test.out 2>&1
eval_tap $? 379 'AdminChallengeMyMFAV4' test.out

#- 380 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'wFzCpxxJLfAg5cFT' \
    --languageTag '0gHAkltcR3eHFbiA' \
    > test.out 2>&1
eval_tap $? 380 'AdminSendMyMFAEmailCodeV4' test.out

#- 381 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "luHv7Hssd05pHBJX", "mfaToken": "5ln8PZbYVD8RiaTs"}' \
    > test.out 2>&1
eval_tap $? 381 'AdminDisableMyEmailV4' test.out

#- 382 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'dD4d3kSbTkHPMUvO' \
    > test.out 2>&1
eval_tap $? 382 'AdminEnableMyEmailV4' test.out

#- 383 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 383 'AdminGetMyEnabledFactorsV4' test.out

#- 384 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'AUXkw36cr2WJQqS7' \
    > test.out 2>&1
eval_tap $? 384 'AdminMakeFactorMyDefaultV4' test.out

#- 385 AdminGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyOwnMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 385 'AdminGetMyOwnMFAStatusV4' test.out

#- 386 AdminGetMyMFAStatusV4
eval_tap 0 386 'AdminGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 387 AdminInviteUserV4
eval_tap 0 387 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 388 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'Tq4YIyZAFQ6lZfa2' \
    --linkingToken 'jdNvpWf32JS1av9V' \
    --password 'NpVLT0LvqcfSdO1n' \
    --username 'AjY5FvADb3GUQgci' \
    > test.out 2>&1
eval_tap $? 388 'AuthenticationWithPlatformLinkV4' test.out

#- 389 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData '632w6LUrHuKBoNTp' \
    --extendExp  \
    --linkingToken 'PQXDNHto74GcmVf0' \
    > test.out 2>&1
eval_tap $? 389 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 390 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'fbCU9QdPuWeMEeL0' \
    --factor 'EJG67g4W1eAmDxP2' \
    --mfaToken '3qstMuikKc6VNU85' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 390 'Verify2faCodeV4' test.out

#- 391 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId '70siWm3V9sirE0JO' \
    --codeChallenge 'QxWeHypqCWMDPRI2' \
    --codeChallengeMethod 'S256' \
    --additionalData 'dWoE4esuiDrquccz' \
    --clientId '4J6fFQezJ5E3iYHI' \
    --createHeadless  \
    --deviceId 'knvPcJkjRevVYfiE' \
    --macAddress 'xpAgoK9YDq1x3dkb' \
    --platformToken 'JFDEBEOOvJ5BKeip' \
    --serviceLabel '0.5521285479292967' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 391 'PlatformTokenGrantV4' test.out

#- 392 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'ldsgB4hOxb88WgKS' \
    --codeChallengeMethod 'S256' \
    --simultaneousPlatform 'pneDQCfwucHRL3o2' \
    --simultaneousTicket 'NstrL6TsJeRcE7Gu' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'HvjM7X1fjzknv2HZ' \
    > test.out 2>&1
eval_tap $? 392 'SimultaneousLoginV4' test.out

#- 393 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'MIL2P2bh14LroFTn' \
    --codeChallengeMethod 'plain' \
    --additionalData 'ufH2YR6QU7fj6w17' \
    --clientId 'arNs12hOoLVM7UFn' \
    --clientSecret 'uJDzeEkDxaVogxHr' \
    --code 'Oon2OW4Zw5QwVKWN' \
    --codeVerifier 'y2tnF2MifJR4hr4g' \
    --extendNamespace 'dJDujYnVnFK6gB6Z' \
    --extendExp  \
    --loginQueueTicket 'xC6yYUVUJYnQ3jOG' \
    --password 'mROIqxqQ0gcNeTfl' \
    --redirectUri 'yvUh3w5ZtfwmOCKp' \
    --refreshToken 'FSMF0tfGIZCTNiIR' \
    --username 'c9fEjkZhEpAJMCxM' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 393 'TokenGrantV4' test.out

#- 394 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'cxzjDhTrcBKtU956' \
    --code 'hOg8oukDVdweG0sF' \
    > test.out 2>&1
eval_tap $? 394 'RequestTargetTokenResponseV4' test.out

#- 395 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HxTHa2k60SzCqUgq' \
    --rawPUID  \
    --body '{"pidType": "1gLbcIMevTmC631p", "platformUserIds": ["7q794bu49lINFTtE", "RAXT2h3hcQ2wV3Zb", "BTnNQnVUhA5WnzVZ"]}' \
    > test.out 2>&1
eval_tap $? 395 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 396 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "u7wRQmL4i3eRyIEC", "policyId": "EDa1I4lwXqwPfq3V", "policyVersionId": "zHQjtolx64w1gyvj"}, {"isAccepted": false, "localizedPolicyVersionId": "rFaoLulzp3sZxImV", "policyId": "K5yh2LcM8LaMW0By", "policyVersionId": "jsRUrAHNRkIcC4wN"}, {"isAccepted": true, "localizedPolicyVersionId": "zsbrtYvLh56AWXoM", "policyId": "iowdWSs9DQ0VU1HE", "policyVersionId": "D9CGo9aUXj3rh0Uy"}], "authType": "EMAILPASSWD", "country": "x88sAUrXr7MXxCvy", "dateOfBirth": "y7caxz4MQrODLNlx", "displayName": "iEjQBCZx9DJ4V97S", "emailAddress": "JLlrwXmIGamRCARu", "password": "FLx4rV4CXVMrDYKe", "passwordMD5Sum": "2eTf1axo16GqT2vS", "uniqueDisplayName": "LLiMvcu39YZJypWz", "username": "pNXgnoKIz8O8NglJ", "verified": true}' \
    > test.out 2>&1
eval_tap $? 396 'PublicCreateTestUserV4' test.out

#- 397 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "Th280vflFMxIhlIT", "policyId": "8AgyZJ16MMd2bzOr", "policyVersionId": "Tn2huwPgyUzBUWiK"}, {"isAccepted": false, "localizedPolicyVersionId": "DNfUESLlwHv3Jgte", "policyId": "OLyKp8a1VqxXnRhD", "policyVersionId": "d9TGkO6aIYqftw1S"}, {"isAccepted": true, "localizedPolicyVersionId": "QXkErF0drbYrrFQP", "policyId": "6rW62CtetBW3pvAJ", "policyVersionId": "JieHhveGg97PY0tx"}], "authType": "EMAILPASSWD", "code": "BjP4HSuiYCbG0UyY", "country": "UJmNL8p6AbdtU0CD", "dateOfBirth": "rlQpKB8qoel2QK3a", "displayName": "SOYdmMDikc3Fjm9H", "emailAddress": "oQDemtiQvURYZCeF", "password": "30RT9rBgM8o7lxXq", "passwordMD5Sum": "7TkdM7FVDCBcvVeg", "reachMinimumAge": true, "uniqueDisplayName": "jDUGRGcCEPjbUy7F", "username": "82Adu9BYRHrVTehr"}' \
    > test.out 2>&1
eval_tap $? 397 'PublicCreateUserV4' test.out

#- 398 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'qgvEtEs2LpE0qfbv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "LrR1x6U1v6zSLjm9", "policyId": "zmzUW0vPj90jmLTt", "policyVersionId": "5YQGawcomPoiYoQ1"}, {"isAccepted": false, "localizedPolicyVersionId": "PMSqb8y8qJTUQY40", "policyId": "Zrpn0vAD9YsPeDWr", "policyVersionId": "AVQZSvgWuCuLsUGr"}, {"isAccepted": true, "localizedPolicyVersionId": "QAbhS54ZuQHKersD", "policyId": "mJLUHAKtfXCKOna8", "policyVersionId": "DdjtZhh6ofsUoRh6"}], "authType": "EMAILPASSWD", "code": "ENiTc9NESV22eRBE", "country": "lD4K2Cy1tJcPAEkC", "dateOfBirth": "eV29QsQk100eu5Uc", "displayName": "xuXXpt0YSPX04uEI", "emailAddress": "dAwgDobopbdJeVCi", "password": "Ks2vLyH9kcSBdk7M", "passwordMD5Sum": "wQzn28Le5neohqhC", "reachMinimumAge": true, "uniqueDisplayName": "uBQdvdhJoT0WK5ng", "username": "NUxDKfZYofPGUbSa"}' \
    > test.out 2>&1
eval_tap $? 398 'CreateUserFromInvitationV4' test.out

#- 399 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "A00nKxQjYU6KlavI", "country": "iLxU2I1GyJS48Hxu", "dateOfBirth": "8Ju4XSAnlXRYB9Bg", "displayName": "SZBvkehRn83B0nrW", "languageTag": "1qx3NJTugVWXz8dv", "uniqueDisplayName": "7BiEUqnzxs2deMF8", "userName": "UAJIHEZv5zyUUyNJ"}' \
    > test.out 2>&1
eval_tap $? 399 'PublicUpdateUserV4' test.out

#- 400 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "kvA5xF3zHtZSd3Qz", "emailAddress": "XhkrN4pWryt4XTNw"}' \
    > test.out 2>&1
eval_tap $? 400 'PublicUpdateUserEmailAddressV4' test.out

#- 401 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "pp0ni1YfIgLZ4YIz", "country": "ElrLZOBLHCKmLBaI", "dateOfBirth": "wlokbAFW8RgBUwBL", "displayName": "28BqM8UzvKqeoTiN", "emailAddress": "KGRUMrimGAz6OhmH", "password": "OpCdr3WzDm3hJdd6", "reachMinimumAge": true, "uniqueDisplayName": "XCRz8KgqgwijYxpG", "username": "hsFArq6lolbj7QKv", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 401 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 402 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "HPwKDpJmkeoAkp3Z", "displayName": "4pgyJYwclb4gd4Qg", "emailAddress": "Qut2hiPuDdOPHcN9", "password": "drwqytieXpIZfr5X", "uniqueDisplayName": "Dq9dGLHjtgE2bTXJ", "username": "xCCFqPNDqWrpkWnn"}' \
    > test.out 2>&1
eval_tap $? 402 'PublicUpgradeHeadlessAccountV4' test.out

#- 403 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "ova15WVuE5cYVP9t", "mfaToken": "QSa27BnPyq3I1BLt"}' \
    > test.out 2>&1
eval_tap $? 403 'PublicDisableMyAuthenticatorV4' test.out

#- 404 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'GEZDRNkk4DJUofJX' \
    > test.out 2>&1
eval_tap $? 404 'PublicEnableMyAuthenticatorV4' test.out

#- 405 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 405 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 406 PublicGetMyBackupCodesV4
eval_tap 0 406 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 407 PublicGenerateMyBackupCodesV4
eval_tap 0 407 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 408 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "K8RGS0zCYRVmbfzw", "mfaToken": "Umsy0stUmKdXiiTO"}' \
    > test.out 2>&1
eval_tap $? 408 'PublicDisableMyBackupCodesV4' test.out

#- 409 PublicDownloadMyBackupCodesV4
eval_tap 0 409 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 410 PublicEnableMyBackupCodesV4
eval_tap 0 410 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 411 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'bNdqkWa13g3pgHx6' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetBackupCodesV4' test.out

#- 412 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'uPf6jQZcYerH933X' \
    > test.out 2>&1
eval_tap $? 412 'PublicGenerateBackupCodesV4' test.out

#- 413 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag '7iXEEM2KOusNEHcI' \
    > test.out 2>&1
eval_tap $? 413 'PublicEnableBackupCodesV4' test.out

#- 414 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code '95GGdJvucDbs6Udc' \
    --factor 'cuM2ykRj3WnyAaUa' \
    > test.out 2>&1
eval_tap $? 414 'PublicChallengeMyMFAV4' test.out

#- 415 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'QBKFedL2uduXvZUb' \
    > test.out 2>&1
eval_tap $? 415 'PublicRemoveTrustedDeviceV4' test.out

#- 416 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'QQ13FhD3NExUFipJ' \
    --languageTag 'sUiDawAjgHFQk0Vz' \
    > test.out 2>&1
eval_tap $? 416 'PublicSendMyMFAEmailCodeV4' test.out

#- 417 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "WRNFNiUn2yXMSCcH", "mfaToken": "ADYpS861c0CJ7Lzp"}' \
    > test.out 2>&1
eval_tap $? 417 'PublicDisableMyEmailV4' test.out

#- 418 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'FvOSF6xKA6yrnvXY' \
    > test.out 2>&1
eval_tap $? 418 'PublicEnableMyEmailV4' test.out

#- 419 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 419 'PublicGetMyEnabledFactorsV4' test.out

#- 420 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor '5dDwneac75C6S2eH' \
    > test.out 2>&1
eval_tap $? 420 'PublicMakeFactorMyDefaultV4' test.out

#- 421 PublicGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyOwnMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 421 'PublicGetMyOwnMFAStatusV4' test.out

#- 422 PublicGetMyMFAStatusV4
eval_tap 0 422 'PublicGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 423 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sH4Y84hL75QboMHC' \
    > test.out 2>&1
eval_tap $? 423 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 424 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "tzEF9FSeg6WYgtfu", "emailAddress": "qJHrs4e3RnWR30Md", "languageTag": "BZezfwc3H0qSbMq4", "namespace": "GLj8aGsH0qE5p601", "namespaceDisplayName": "ak59yFSfdZIv8oYW"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicInviteUserV4' test.out

#- 425 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"code": "PUS4Zu0SbTt6M2Xi", "country": "zikCh6q0yq2WAHtL", "dateOfBirth": "7IWE3MFqvfDG5jvM", "displayName": "OaXrDlEX42U0syrG", "emailAddress": "NhBmgT2q0kIbrJ2S", "password": "5Pf1Lvg8kYEVylIN", "reachMinimumAge": false, "uniqueDisplayName": "pxFY8E6pU8eHjh0a", "username": "TjIOaQt0snbE0yMv", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 425 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE