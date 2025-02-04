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
echo "1..428"

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
    --field 'country' \
    --body '{"config": {"minimumAllowedInterval": 45}, "type": "8LSTs7Nf95lGlPrf"}' \
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
    --identity 'GAME_ADMIN' \
    --body '{"additions": [{"actions": [2, 74, 70], "resource": "qirJ4PkMFtsnFfz8"}, {"actions": [62, 46, 59], "resource": "0X8fBuBSKLSQ4GvL"}, {"actions": [39, 89, 51], "resource": "LiDi0mNHb6Lx8eq8"}], "exclusions": [{"actions": [92, 43, 67], "resource": "T30EYeRj17xGhaBK"}, {"actions": [29, 45, 95], "resource": "b6CjZUMRf2VJetWs"}, {"actions": [29, 18, 22], "resource": "c9gvagF2cSuztsJ5"}], "overrides": [{"actions": [40, 40, 19], "resource": "tz8MTBt1xk9IyssS"}, {"actions": [53, 52, 27], "resource": "vbNStqPtQmQN6eKA"}, {"actions": [66, 80, 17], "resource": "ZWosrsVBPZ64j0HU"}], "replacements": [{"replacement": {"actions": [82, 27, 80], "resource": "ulxcCKAru8pOaAVL"}, "target": "DB4k3JwkdaxR7GJp"}, {"replacement": {"actions": [36, 25, 68], "resource": "uYCPG181q9GA5Dyd"}, "target": "C2D8UT6KOc4VPDUR"}, {"replacement": {"actions": [45, 0, 34], "resource": "yazqXRqegIUicYXX"}, "target": "zxsBFrUs9BYp6TgC"}]}' \
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
    --roleId 'ARATn6KXOutlYBbL' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetRoleNamespacePermissionV3' test.out

#- 162 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'hL8KXx25FZfQIodV' \
    --after '57' \
    --before '45' \
    --limit '34' \
    > test.out 2>&1
eval_tap $? 162 'GetAdminUsersByRoleIdV3' test.out

#- 163 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'MfTkPy0fGvTGgfLK' \
    > test.out 2>&1
eval_tap $? 163 'AdminGetUserByEmailAddressV3' test.out

#- 164 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["RK6UKk5ozrXA4HZH", "Nyq9odanhR1Zrm3t", "hUvV87yfkycLSVdl"]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminBulkUpdateUsersV3' test.out

#- 165 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'eSaAylsmLYe2phYO' \
    --body '{"bulkUserId": ["gT5kDTyPl3dKF7NX", "EjrJMki8jvc3P8Gw", "jg3IOH0SDHgYKqxJ"]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetBulkUserBanV3' test.out

#- 166 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["iFJdrmj5vhzgsJwe", "x7wq8ZPlXNaUNgdY", "2vfJuje5cPnmGjTv"]}' \
    > test.out 2>&1
eval_tap $? 166 'AdminListUserIDByUserIDsV3' test.out

#- 167 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Ya5Pqx1K7qcAoijB", "PAp6EPb988NzxrDK", "VpULjjiw3NeVG4DJ"]}' \
    > test.out 2>&1
eval_tap $? 167 'AdminBulkGetUsersPlatform' test.out

#- 168 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["i9DaMrc0WFgKjE94", "5x2CPVYYG9WvoGmA", "mvaVV5YfxnUNcwjr"], "isAdmin": false, "languageTag": "DvhB4Eoes9a6XaJe", "namespace": "RbzTPwD3jxF7vxRU", "roles": ["Y0ilrNoFT98SgtJd", "4Z5f8nfaKqdZFLbZ", "EHxsDxeR6d7r1SQw"]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminInviteUserV3' test.out

#- 169 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '49' \
    --platformUserId 'JfMpPrSqYypRUnq5' \
    --platformId 'o4ETeCUYG9ccTt7W' \
    > test.out 2>&1
eval_tap $? 169 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 170 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 170 'AdminListUsersV3' test.out

#- 171 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'w8OQ13t3uTw6zQuo' \
    --endDate 'ZcXQpoTOxe8y1jor' \
    --includeTotal  \
    --limit '81' \
    --offset '12' \
    --platformBy 'sg9ZKYCKoISyXtHz' \
    --platformId 'oWGdYohxMp3uOQIy' \
    --query 'bqWfG9BJ6FVKlbYH' \
    --roleIds 'tbPtaxvagSlpGgVT' \
    --skipLoginQueue  \
    --startDate 'F6VeDAPOGBwweyFf' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 171 'AdminSearchUserV3' test.out

#- 172 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["XEOEAEtbag82KgBg", "yCd5vjkfz3eR4DtN", "p129hzBw3xLUcCEt"]}' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetBulkUserByEmailAddressV3' test.out

#- 173 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0DzmkJq1sml5bYt7' \
    > test.out 2>&1
eval_tap $? 173 'AdminGetUserByUserIdV3' test.out

#- 174 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6BNsi4giR9434WpK' \
    --body '{"avatarUrl": "KdzxoufCNlFoOcWQ", "country": "Qy4bjmQeEweoBHTd", "dateOfBirth": "wAk7ZQnbqY1cQwVE", "displayName": "tAr5kKKAo9MM2Cqm", "languageTag": "84jVi9kIpqgrzpUk", "skipLoginQueue": false, "uniqueDisplayName": "OBWydXV0Fi02aFr8", "userName": "CDapjwNOl4k8rVNr"}' \
    > test.out 2>&1
eval_tap $? 174 'AdminUpdateUserV3' test.out

#- 175 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'm8drv8QD2JOe2Ntz' \
    --activeOnly  \
    --after '7EFvowPgIGuetxFM' \
    --before 'qXCQMAqQ2ZRGzNtr' \
    --limit '94' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetUserBanV3' test.out

#- 176 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DNo4rhjxUdMM83We' \
    --body '{"ban": "kqfWv04vvn9bk5qr", "comment": "8qs2mqtnGAqXUjNy", "endDate": "pF6MMqWpdEJsPoaI", "reason": "bYz8cK5jlpJdre5u", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 176 'AdminBanUserV3' test.out

#- 177 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'C7SwgoViPeIB4Ehy' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetUserBanSummaryV3' test.out

#- 178 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId '0Y5aSJVDginxAM77' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eY9C14FbfiI2NPvl' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserBanV3' test.out

#- 179 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CY5bEokxXxkWZbjf' \
    --body '{"context": "7GZxaossQmjo69wo", "emailAddress": "hJFyTNk5FGUPhR4L", "languageTag": "EZvz3EjFR7996Ug5", "upgradeToken": "m4axDV5uTcYsoahU"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminSendVerificationCodeV3' test.out

#- 180 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rELQ1btjJOqQMgZW' \
    --body '{"Code": "AU6E92nHJzvw7tnY", "ContactType": "tGfv0EJyjBu4EzwR", "LanguageTag": "jD7jmQJeFPghqamS", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 180 'AdminVerifyAccountV3' test.out

#- 181 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'sKgzCsMulpB8HZUt' \
    > test.out 2>&1
eval_tap $? 181 'GetUserVerificationCode' test.out

#- 182 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VVaJCiLgKOwrSfWh' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserDeletionStatusV3' test.out

#- 183 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'T5B4WedopzwSluBt' \
    --body '{"deletionDate": 90, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateUserDeletionStatusV3' test.out

#- 184 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ThyGnbjmPDKFS6u9' \
    > test.out 2>&1
eval_tap $? 184 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 185 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FHuv1M3qfch4SqIV' \
    --body '{"code": "6LQPHlaeYl4csFq6", "country": "5cU66yJaj4ovoKWE", "dateOfBirth": "4EW0sw8v5peiuxoB", "displayName": "JATauyD3XCXVMiyE", "emailAddress": "vMf9yilUEujk6oqY", "password": "o1HQYTFzwdOMdupw", "uniqueDisplayName": "D4O3uNbcIDcIyvZb", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 185 'AdminUpgradeHeadlessAccountV3' test.out

#- 186 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7sVwcZ2PofaJoSqt' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteUserInformationV3' test.out

#- 187 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rEOqxH46fRTSZoDd' \
    --after '0.7400165063363671' \
    --before '0.8489160436599185' \
    --limit '10' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserLoginHistoriesV3' test.out

#- 188 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nt9P1Tkm08luh4dp' \
    --body '{"languageTag": "PRMDbUXBWTbpAogG", "mfaToken": "2wlZkLhuU5FI8Nij", "newPassword": "FI0GKwJ3vfXlsAMy", "oldPassword": "2Zp2UAGxHnmSxvkG"}' \
    > test.out 2>&1
eval_tap $? 188 'AdminResetPasswordV3' test.out

#- 189 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9UR5q9neoW6JBcGp' \
    --body '{"Permissions": [{"Action": 51, "Resource": "Rx2RfcRhXpmeeHdv", "SchedAction": 31, "SchedCron": "Kg9U8vrQJXQxoIbV", "SchedRange": ["i2CLEk277Ivjj1A6", "47XQ3koaAfZIim0s", "FPm1YN27bojDVaZL"]}, {"Action": 32, "Resource": "YsW9oGBN1pYMBwbP", "SchedAction": 36, "SchedCron": "TlMlUvFEiGprcNSQ", "SchedRange": ["9kEeXBZ6FVrBzyhy", "hoS6a9oe0JaXFpff", "28uYbe4Cf2HEHvVe"]}, {"Action": 43, "Resource": "9gj5vyUMAAmIHYbs", "SchedAction": 49, "SchedCron": "fPSX3PdOU2V9yw94", "SchedRange": ["oa8UJ34TIedV3Hyo", "X4VnO2LpBU08wfnl", "HBXFIqFUmgUSMM5a"]}]}' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpdateUserPermissionV3' test.out

#- 190 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'u8GJT0mkVPI6zUtf' \
    --body '{"Permissions": [{"Action": 38, "Resource": "QaJPGrTNcXXTUIgg", "SchedAction": 29, "SchedCron": "IaKiHfoeorY7A1ot", "SchedRange": ["GFyv2SMjbEr50qGd", "CZIc6EFqBKxbS7Q2", "OgRucL1jwRXzfjDZ"]}, {"Action": 89, "Resource": "BmOau6syme06c6SK", "SchedAction": 78, "SchedCron": "4tOcbnuCqf0lm6WB", "SchedRange": ["kIzjoSV31tvmMB6j", "zrpRGESmooHiCV4G", "UOnXpapXQGRakUbc"]}, {"Action": 67, "Resource": "yjqf6Q4oiwoJcaRM", "SchedAction": 62, "SchedCron": "rGNT2VHTKuIT5Fww", "SchedRange": ["Hj0Ur5F2PWGTTD81", "xhNP4t6kYBUjyXAn", "3bWQF6QcAiJpXIrg"]}]}' \
    > test.out 2>&1
eval_tap $? 190 'AdminAddUserPermissionsV3' test.out

#- 191 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'roixptZhckUTGkcB' \
    --body '[{"Action": 84, "Resource": "WVIJnhhwFDV1Vita"}, {"Action": 30, "Resource": "V8DY0XOkDstxZcY1"}, {"Action": 68, "Resource": "Kj7Yi2VvoQNW8Yc4"}]' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserPermissionBulkV3' test.out

#- 192 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '66' \
    --namespace "$AB_NAMESPACE" \
    --resource '1dYdvGxJAMDRA1LF' \
    --userId '7jdWlekFwO94VBCV' \
    > test.out 2>&1
eval_tap $? 192 'AdminDeleteUserPermissionV3' test.out

#- 193 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9qJhWva2FPBujX0g' \
    --after 'eYCpGJM4sqsPNJMi' \
    --before 'ZXXOFwmGWAvNF0Z0' \
    --limit '66' \
    --platformId 'rQD4hEk0OLjYsnig' \
    --targetNamespace 'nE7KcMF7fuDbzRRY' \
    > test.out 2>&1
eval_tap $? 193 'AdminGetUserPlatformAccountsV3' test.out

#- 194 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MNXWUsp1tOibJY9a' \
    --status 'L9ie6vvMbiNURrlm' \
    > test.out 2>&1
eval_tap $? 194 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 195 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '88QlKyuoya4JgakZ' \
    > test.out 2>&1
eval_tap $? 195 'AdminGetListJusticePlatformAccounts' test.out

#- 196 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'yUV7t73VnSFbuxd4' \
    --userId 'KYZ0jk0UZdhtnKu9' \
    > test.out 2>&1
eval_tap $? 196 'AdminGetUserMapping' test.out

#- 197 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'oTc8pVkiyGsj5JdX' \
    --userId 'zRxfNEjUMTs8WIOb' \
    > test.out 2>&1
eval_tap $? 197 'AdminCreateJusticeUser' test.out

#- 198 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'JBTsvsw76uISRX0b' \
    --skipConflict  \
    --body '{"platformId": "KVoWtoUW1P7ocuBA", "platformUserId": "ldDSUS7Haa6unq1y"}' \
    > test.out 2>&1
eval_tap $? 198 'AdminLinkPlatformAccount' test.out

#- 199 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QOSRvyiLBRVtIDi2' \
    --platformId 'piIQFVmzMidw70KS' \
    > test.out 2>&1
eval_tap $? 199 'AdminGetUserLinkHistoriesV3' test.out

#- 200 AdminPlatformUnlinkV3
eval_tap 0 200 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 201 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ahpYZdKZRyR9AX7J' \
    --userId 'jxvNZhM84DiZk6yS' \
    > test.out 2>&1
eval_tap $? 201 'AdminPlatformUnlinkAllV3' test.out

#- 202 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rB9SVFctW7YS0OkL' \
    --userId '78XeEAtALFI3v8yh' \
    --ticket 'a4pd5A7MYcpBD6lK' \
    > test.out 2>&1
eval_tap $? 202 'AdminPlatformLinkV3' test.out

#- 203 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 203 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 204 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Nb8RxvN2u5J7baOe' \
    --userId 'LH19fqBwNbNe1ffY' \
    > test.out 2>&1
eval_tap $? 204 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 205 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RtIvQaKyevWYtZjK' \
    --userId '6J29v8MpBSpo3AKR' \
    --platformToken 'mnJkzJHAckUyBksY' \
    > test.out 2>&1
eval_tap $? 205 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 206 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QfDm0RNFwiz70tRV' \
    --userId 'LMlHi8i9gOVqajUW' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 206 'AdminGetUserSinglePlatformAccount' test.out

#- 207 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rgEsWDtaKzn8dZwn' \
    --body '["nGeZsZVgbPzPFbrO", "MZMgWkFN7Tpkx6Gc", "fyOg6ZUrrp9ubg9m"]' \
    > test.out 2>&1
eval_tap $? 207 'AdminDeleteUserRolesV3' test.out

#- 208 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ndW2JKmQafUs2bxY' \
    --body '[{"namespace": "ztOEyVbKIf1ZbzgU", "roleId": "wd8DHoCQykmXHYmk"}, {"namespace": "Rlg7gYs6unPYQ9jN", "roleId": "QN1di1ldhOh6Hvjn"}, {"namespace": "YuV7NfC4A2ODiZhb", "roleId": "fb8QqCyK1XH9D6vl"}]' \
    > test.out 2>&1
eval_tap $? 208 'AdminSaveUserRoleV3' test.out

#- 209 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '5eFdFfgK46GjCWaP' \
    --userId '8huTmnq3FGQn3Ahu' \
    > test.out 2>&1
eval_tap $? 209 'AdminAddUserRoleV3' test.out

#- 210 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '5wxq6oJq4mChmQHQ' \
    --userId 'hO9IKBXDFQfXFD58' \
    > test.out 2>&1
eval_tap $? 210 'AdminDeleteUserRoleV3' test.out

#- 211 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sG6uDhFYlrzJBYSe' \
    > test.out 2>&1
eval_tap $? 211 'AdminGetUserStateByUserIdV3' test.out

#- 212 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MuJfQecutjS029Bi' \
    --body '{"enabled": false, "reason": "WOG1m7MKclr5igjN"}' \
    > test.out 2>&1
eval_tap $? 212 'AdminUpdateUserStatusV3' test.out

#- 213 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'TVItrH2X78hxJgaV' \
    --body '{"emailAddress": "fw5Vnyq8OzTE89WD", "password": "NoMcOmbfJrCJQIj1"}' \
    > test.out 2>&1
eval_tap $? 213 'AdminTrustlyUpdateUserIdentity' test.out

#- 214 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'haAosKglqaCXE9yt' \
    > test.out 2>&1
eval_tap $? 214 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 215 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'pIO8btO3OwNEGSW5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "TaW4to7QCY2NGGvi"}' \
    > test.out 2>&1
eval_tap $? 215 'AdminUpdateClientSecretV3' test.out

#- 216 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId '9kg3rMIzNmhJTNQj' \
    > test.out 2>&1
eval_tap $? 216 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 217 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'KlwjfJ3TJ2xVpge7' \
    --before '0WsLfgbZieRvJI5s' \
    --isWildcard  \
    --limit '94' \
    > test.out 2>&1
eval_tap $? 217 'AdminGetRolesV3' test.out

#- 218 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "managers": [{"displayName": "H3DfLCv8q4Thmq09", "namespace": "bBgPAYxrBE9jlnTg", "userId": "tgW33wDwD9RKvQX4"}, {"displayName": "yFQFdrRoM6FoqCYw", "namespace": "7AlxO6qdFpc71sSc", "userId": "k3ggZWJlSlCQMDji"}, {"displayName": "329PfVrvMEPtpsSN", "namespace": "cpK1QkB2Sy8Ww79L", "userId": "VeVskqeUB7RSayqG"}], "members": [{"displayName": "Fguhh3bvadRthdbV", "namespace": "ApebRA09rW8i8krF", "userId": "WJhe03coRFok5d3A"}, {"displayName": "yGrZO8GuoXNSoVEB", "namespace": "G7VbBPUWipz9C05Y", "userId": "abFX4FCK5ucTFsAF"}, {"displayName": "zaO3yJpA3KMxBlrR", "namespace": "ytER1qdTelFAadM9", "userId": "y66Drf4SSGGt3MiB"}], "permissions": [{"action": 75, "resource": "9SiGUjVAw4v3q6JR", "schedAction": 69, "schedCron": "H1mMIfOCDyVAHrHn", "schedRange": ["cR5dShqiBUI9esSs", "XegSEhrPpK2q8kxR", "4BuEksS2A9VOA8H9"]}, {"action": 97, "resource": "bEJaPnAFjsodyJQV", "schedAction": 98, "schedCron": "uGJVl8xs1WId9Wla", "schedRange": ["lqshF9Rh2o7GCQGP", "CxwEdkyuT3MgzReR", "q0112ISArROIodcm"]}, {"action": 79, "resource": "D1OXkxShFVQTRekL", "schedAction": 10, "schedCron": "6bpuJip8JyxJ39vr", "schedRange": ["tuWWrqTZbSqBSKp8", "AmgwhYzk33J34fiT", "xK63OHpnUCGBVfpc"]}], "roleName": "tNFUsUQ6ZXQcb2o1"}' \
    > test.out 2>&1
eval_tap $? 218 'AdminCreateRoleV3' test.out

#- 219 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'J5euLAbBgejqc0ap' \
    > test.out 2>&1
eval_tap $? 219 'AdminGetRoleV3' test.out

#- 220 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'xqZ209BySn8aUaGl' \
    > test.out 2>&1
eval_tap $? 220 'AdminDeleteRoleV3' test.out

#- 221 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'AyvIslt7N1qcxKs4' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "lf1MfqUZXkjHvcUO"}' \
    > test.out 2>&1
eval_tap $? 221 'AdminUpdateRoleV3' test.out

#- 222 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'TlxNf09pefgFIiJs' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRoleAdminStatusV3' test.out

#- 223 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'sShBKsQjXvfQgQDt' \
    > test.out 2>&1
eval_tap $? 223 'AdminUpdateAdminRoleStatusV3' test.out

#- 224 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '6ce8NDMErA82FrR1' \
    > test.out 2>&1
eval_tap $? 224 'AdminRemoveRoleAdminV3' test.out

#- 225 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'GSogkewIzTOqKkcj' \
    --after 'Rh3l2gAJOTCbx7J3' \
    --before 'gNLIlTk3Bpclrk4h' \
    --limit '70' \
    > test.out 2>&1
eval_tap $? 225 'AdminGetRoleManagersV3' test.out

#- 226 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'wBhoUg4LsGP6KLPX' \
    --body '{"managers": [{"displayName": "kvUv2XiXaBzsmaxj", "namespace": "TZPlLitytGka7Kv5", "userId": "TacQKF4OlRGdmXxE"}, {"displayName": "TLEQrr3KCAV9alq3", "namespace": "hK1G4kKooSNNUZui", "userId": "ynZ64IwncZPk82GF"}, {"displayName": "3eTC0vzZUDj9dzGg", "namespace": "GVxo9OHgfHumyfuB", "userId": "NisecYbcOpR45VDl"}]}' \
    > test.out 2>&1
eval_tap $? 226 'AdminAddRoleManagersV3' test.out

#- 227 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'vSc0Mr7ImwCwGqOf' \
    --body '{"managers": [{"displayName": "0bNs97KvKyj3MqS7", "namespace": "Dcmtfh50eObbrmgj", "userId": "hWK0x0ZidAJ1CU1e"}, {"displayName": "D1La16Bw3JbUnUDh", "namespace": "5yGjjv4Mwrv2vanc", "userId": "mR6Z7rb21A2E9pX0"}, {"displayName": "BWCMqPsRk5htdM5T", "namespace": "3fDSrSHrkoqv2mM6", "userId": "soMaTvQq2a9YdFNt"}]}' \
    > test.out 2>&1
eval_tap $? 227 'AdminRemoveRoleManagersV3' test.out

#- 228 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'RVSO0js0hG9xmSnz' \
    --after 'd7zgUxAogcnGkXk1' \
    --before '7QPkJHRhmLKQuQVF' \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 228 'AdminGetRoleMembersV3' test.out

#- 229 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'ubntPCFxfeoW2NdS' \
    --body '{"members": [{"displayName": "WzOXjO1NQUqWHBW7", "namespace": "8XREZCiTNAxq26gZ", "userId": "rPqCsSDspvgM16sZ"}, {"displayName": "6rjnkH4ExObppC6C", "namespace": "MYDm5ge659UDEOF6", "userId": "gp5UfmjtiVbqJnZc"}, {"displayName": "rqrPye7fCwi7Il2w", "namespace": "IFlHm9N6owMHMtJy", "userId": "1Oqn59tEGm9NYeUT"}]}' \
    > test.out 2>&1
eval_tap $? 229 'AdminAddRoleMembersV3' test.out

#- 230 AdminRemoveRoleMembersV3
eval_tap 0 230 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 231 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId '5P0nx8TqSZdZ5C8m' \
    --body '{"permissions": [{"action": 65, "resource": "fFMdvYiCBuzUUwyI", "schedAction": 85, "schedCron": "Vtd4v9k4fv3kMiuQ", "schedRange": ["3DhsKLxjt5srPFxB", "gpFtDBmTLH9kP9U5", "3z6joBAhAlJGI2YY"]}, {"action": 2, "resource": "dhkBzAzPkt1efGJe", "schedAction": 73, "schedCron": "Px62tHxDb06ZFy3u", "schedRange": ["glSp2UxvF2uLXWil", "RD7HD6LCgdFxRGj0", "0RT6LvcnGMJbJIYL"]}, {"action": 37, "resource": "wMXwKVXGPhEJsc7r", "schedAction": 54, "schedCron": "pxaPHc9r8eToFmkH", "schedRange": ["J6BPOKFLxIwKssw6", "47YwDudnGRufOUGf", "MjTU226l07jPlcYa"]}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminUpdateRolePermissionsV3' test.out

#- 232 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'qYM7YfBmhjI9Y28q' \
    --body '{"permissions": [{"action": 97, "resource": "h2x2ur2ccp7R7OqP", "schedAction": 34, "schedCron": "yYEymNXzNX6TGh4U", "schedRange": ["dEweeBsJEvBbAvCm", "lh6Z1oz9BaixUUvm", "zbajE2gjooiDnc1N"]}, {"action": 96, "resource": "RNB5dVCsB7xL4axS", "schedAction": 85, "schedCron": "H47CAT7cBP0918Ja", "schedRange": ["EBQBP766LUnBBR84", "iAO7sBQt6YJ2tWwF", "7RnP1oK3c4RVfjB0"]}, {"action": 53, "resource": "es36r1FgR70eNLHk", "schedAction": 98, "schedCron": "balgizL97ycJV5Yq", "schedRange": ["E2myQzl7X9fHr6Wv", "BxmBvNj3ktaDf9B2", "2HGgxakPt7IYzaZU"]}]}' \
    > test.out 2>&1
eval_tap $? 232 'AdminAddRolePermissionsV3' test.out

#- 233 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'TmvsEzLPnnGsnfmB' \
    --body '["erp84qjwzWpCF1vy", "amjsEzwtLPxK1os4", "qR8LaQzEb39sZTdF"]' \
    > test.out 2>&1
eval_tap $? 233 'AdminDeleteRolePermissionsV3' test.out

#- 234 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '11' \
    --resource 'CCbnfihnXKxGxaup' \
    --roleId 'nTTq9ihZkvFKfSHQ' \
    > test.out 2>&1
eval_tap $? 234 'AdminDeleteRolePermissionV3' test.out

#- 235 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 235 'AdminGetMyUserV3' test.out

#- 236 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'h8I9xk3sFl0cbuCR' \
    --extendExp  \
    --redirectUri 'M69XKkLwioRaKnWh' \
    --password 'lh80BhYe2fJDS6T7' \
    --requestId '5Q4ulonMFjmYqE1w' \
    --userName 'JhfogWg2Apm0sUy1' \
    > test.out 2>&1
eval_tap $? 236 'UserAuthenticationV3' test.out

#- 237 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '8aWn65Co0vdCk8so' \
    --linkingToken '6JSaZAIadKDEZywo' \
    --password 'nA2SrEdN2tmGuX6r' \
    --username '0gBVUUeKKlPKtE6g' \
    > test.out 2>&1
eval_tap $? 237 'AuthenticationWithPlatformLinkV3' test.out

#- 238 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'nYxmkmCWbs5qugkl' \
    --linkingToken 'BUS6uwWrCQt86Jrg' \
    --password '8tLAJWpcyNkUvqn6' \
    --username 'eXr6FNbKJ05Orya6' \
    > test.out 2>&1
eval_tap $? 238 'AuthenticateAndLinkForwardV3' test.out

#- 239 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'LSSUlugIAknXcSaV' \
    --extendExp  \
    --linkingToken 'YcAYp7qSiDvsfMUO' \
    > test.out 2>&1
eval_tap $? 239 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 240 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'pWv46sXvpOjrpRo4' \
    --state 'mYrCeQUnYoID2UqO' \
    --platformId '0iAXA9dB4ib8HDOJ' \
    > test.out 2>&1
eval_tap $? 240 'RequestOneTimeLinkingCodeV3' test.out

#- 241 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode '8TNiP8KgEAj3dbRT' \
    > test.out 2>&1
eval_tap $? 241 'ValidateOneTimeLinkingCodeV3' test.out

#- 242 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'I0i6dO3zkbDseh4t' \
    --isTransient  \
    --clientId 'JdoGcwMBmegqVUaW' \
    --oneTimeLinkCode 'MJBjrV0p9A7tcHrV' \
    > test.out 2>&1
eval_tap $? 242 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 243 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 243 'GetCountryLocationV3' test.out

#- 244 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 244 'Logout' test.out

#- 245 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge '0MbJGr4drgkDuWS0' \
    --codeChallengeMethod 'S256' \
    --clientId 'yrIw37pKOLrF5i3g' \
    > test.out 2>&1
eval_tap $? 245 'RequestTokenExchangeCodeV3' test.out

#- 246 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'r3Cc4M2O7NrTQO7K' \
    --userId 'LdZDGwqx7T3l1ut2' \
    --platformUserId 'oyolliYsTJUmpscw' \
    > test.out 2>&1
eval_tap $? 246 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 247 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LcUml3KuoMKh7tpr' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 247 'RevokeUserV3' test.out

#- 248 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'nacA34xmIOjFLgKR' \
    --codeChallenge '4LjEWhOScvtQ92iD' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --loginWebBased  \
    --nonce '2YMvEUNfoL7JCcMo' \
    --oneTimeLinkCode '7GxxXdbYCRexPekT' \
    --redirectUri 'sQxMTfaSot7aohFY' \
    --scope 'y4VxwHIJ9gzxqAw4' \
    --state 'vBGQAeh0VTiTP4PS' \
    --targetAuthPage 'rXUS6jYI9lsQFD43' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'Df5qUZOFzpFd6b5J' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 248 'AuthorizeV3' test.out

#- 249 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'lHTPLzynjFZgF3er' \
    > test.out 2>&1
eval_tap $? 249 'TokenIntrospectionV3' test.out

#- 250 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 250 'GetJWKSV3' test.out

#- 251 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'w7UsyHq4bBb0n1Jh' \
    --factor 'PUS8BRPGV9n769zL' \
    --mfaToken 'JdKMexeJc7NvgTSg' \
    > test.out 2>&1
eval_tap $? 251 'SendMFAAuthenticationCode' test.out

#- 252 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'KjCxZjKf8NA4cGUa' \
    --mfaToken 'Dfy9XnH2r0EKrk5V' \
    > test.out 2>&1
eval_tap $? 252 'Change2faMethod' test.out

#- 253 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'lnKsWCPccAFn5CEP' \
    --factor 'oH6opK5DSO8JyX4I' \
    --mfaToken 'E1z3rDwZ1HKsOpyq' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 253 'Verify2faCode' test.out

#- 254 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor '8agQuz86nc6jLF9D' \
    --factors 'IW2ncJJKpqmgvUTr' \
    --rememberDevice  \
    --clientId '8XAtpOqUQxzqJZiW' \
    --code 'i3KQffT5Tn61A1xW' \
    --factor '6okIqmd87ir9op4Y' \
    --mfaToken 'fGTno5oHzqY3Dgyk' \
    > test.out 2>&1
eval_tap $? 254 'Verify2faCodeForward' test.out

#- 255 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'A8zBJX0rkOHUkY5a' \
    --userId 'SlqhYoSXbn6l5xAz' \
    > test.out 2>&1
eval_tap $? 255 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 256 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'c1nc3eFm950dtVAo' \
    --clientId '7w4e3v5mh6Rum5pb' \
    --redirectUri 'gEt39uJQpgEtchTe' \
    --requestId '3nt7t9ztprSfW9Ou' \
    > test.out 2>&1
eval_tap $? 256 'AuthCodeRequestV3' test.out

#- 257 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'tADrNGBWSJ1zQKxV' \
    --additionalData 'mRTawjiZPMoZZcyG' \
    --clientId 'EHxAKDQher3usApP' \
    --createHeadless  \
    --deviceId 'dJPn9eIdhIBvTTup' \
    --macAddress 'ABJ4RwH3EdKmYtbq' \
    --platformToken 'QHNfIZwrMxf3EnzZ' \
    --serviceLabel '0.7689427116175169' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 257 'PlatformTokenGrantV3' test.out

#- 258 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 258 'GetRevocationListV3' test.out

#- 259 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'nkLT0Lb85nmpdN26' \
    > test.out 2>&1
eval_tap $? 259 'TokenRevocationV3' test.out

#- 260 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'BY5YI0jeO2zMDSy4' \
    --simultaneousTicket 'kyqyKgrtEPdXXlt8' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'ctuVaqPJGAHEZmuQ' \
    > test.out 2>&1
eval_tap $? 260 'SimultaneousLoginV3' test.out

#- 261 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'rZ8GaQ4OZ2nDodm4' \
    --clientId 'TNs8mAj6IKSYFdJw' \
    --clientSecret 'gZsRPOzwuDSdGl1A' \
    --code '2vaNeDiSqTfmAVg5' \
    --codeVerifier '0kOdJagEmTuaxlxg' \
    --extendNamespace 'ywkbdOsyxX1tfW48' \
    --extendExp  \
    --password '8oYUT4jyCVJ0V8ob' \
    --redirectUri 'TlGVThz4bm41oIcV' \
    --refreshToken '33yjPxibDjfF7Jkj' \
    --username 'CVpZKMxkFkBtXMU6' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 261 'TokenGrantV3' test.out

#- 262 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'mnOpPTVxEgBFzG8t' \
    > test.out 2>&1
eval_tap $? 262 'VerifyTokenV3' test.out

#- 263 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'lkxWKCU1XN4gl7yH' \
    --code 'vEqpJSrDXVwCkhOQ' \
    --error '161TFjROYJm75VIu' \
    --openidAssocHandle 'COCkt2W1DfI8QtgO' \
    --openidClaimedId 'Dk9K6DcMnyCPn1Fy' \
    --openidIdentity 'lWdaNV1VaZTkbbuW' \
    --openidMode 'iiA4UTDgS2SVEo5M' \
    --openidNs '80LLbku9GYH4ijqO' \
    --openidOpEndpoint 'VM50tCqkZfsSxAbD' \
    --openidResponseNonce 'J7sHCLup8pmEosOX' \
    --openidReturnTo 'glQwwdeLVpmXqRwV' \
    --openidSig 'jc3W2ANmE3VVsQ1f' \
    --openidSigned 'm9EUdiaRjuLsKZoq' \
    --state 'npKwhpZVdw5UMa8y' \
    > test.out 2>&1
eval_tap $? 263 'PlatformAuthenticationV3' test.out

#- 264 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'mxtEFLwELCY2vIdd' \
    --platformToken 'lxnA1VynioJcAPwV' \
    > test.out 2>&1
eval_tap $? 264 'PlatformTokenRefreshV3' test.out

#- 265 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'HUGcs1ACMvoY4jWH' \
    > test.out 2>&1
eval_tap $? 265 'PublicGetInputValidations' test.out

#- 266 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field '9dFmOHW0j9suukPE' \
    > test.out 2>&1
eval_tap $? 266 'PublicGetInputValidationByField' test.out

#- 267 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode '4JwQONQ2vCbMn0Oi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 267 'PublicGetCountryAgeRestrictionV3' test.out

#- 268 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'a336uiiMTAductvU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 268 'PublicGetConfigValueV3' test.out

#- 269 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 269 'PublicGetCountryListV3' test.out

#- 270 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 270 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 271 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'fVwLahtRedh1SiZl' \
    > test.out 2>&1
eval_tap $? 271 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 272 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 272 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 273 PublicGetUserByPlatformUserIDV3
eval_tap 0 273 'PublicGetUserByPlatformUserIDV3 # SKIP deprecated' test.out

#- 274 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'display_name' \
    > test.out 2>&1
eval_tap $? 274 'PublicGetProfileUpdateStrategyV3' test.out

#- 275 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId '8rUFum2ZcA8iKcF0' \
    > test.out 2>&1
eval_tap $? 275 'PublicGetAsyncStatus' test.out

#- 276 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'bkfjcTEFXcTwEtnH' \
    --limit '48' \
    --offset '26' \
    --platformBy 'P5pVtN4jNVIdruEA' \
    --platformId '39uCJzsE8WObt6t0' \
    --query 'w8LOBxE15JYj4IqW' \
    > test.out 2>&1
eval_tap $? 276 'PublicSearchUserV3' test.out

#- 277 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "K09l4wkrzahXR1sD", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "Qj2isN7bRwcr16lW", "policyId": "5YwgZpjlMMtPWg82", "policyVersionId": "17m7qNkQiKp2oac8"}, {"isAccepted": false, "localizedPolicyVersionId": "NEuBbeuQqm9wM7mg", "policyId": "TtUdPVcQijMBhs0k", "policyVersionId": "DP6d3nuUZ41mSeS9"}, {"isAccepted": true, "localizedPolicyVersionId": "nGqhJOvykBcDpzD9", "policyId": "zh6dtPK4fVHLMvrC", "policyVersionId": "sH3RYxH2Up9VthPj"}], "authType": "FrK7Hip0eONFDgUP", "code": "ShG8wwFKY9AMpcwJ", "country": "d4SrigIxAhbFMZfx", "dateOfBirth": "aznlDQbzTiFrQB1y", "displayName": "UonirH4URx3NkKQB", "emailAddress": "YrlUaMiFEWUT8cAF", "password": "O5zEw8GENEJYPKxx", "reachMinimumAge": true, "uniqueDisplayName": "viKbOgVuN3nhkn6Q"}' \
    > test.out 2>&1
eval_tap $? 277 'PublicCreateUserV3' test.out

#- 278 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'IesNoYqvVsakylHi' \
    --query 'kKkpOjqwgKvfXXs8' \
    > test.out 2>&1
eval_tap $? 278 'CheckUserAvailability' test.out

#- 279 PublicBulkGetUsers
eval_tap 0 279 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 280 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "pDqm31AZSRkuw6q8", "languageTag": "FgqG46RsFK7eYlSU"}' \
    > test.out 2>&1
eval_tap $? 280 'PublicSendRegistrationCode' test.out

#- 281 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "3vYcHZZjFegVnZOn", "emailAddress": "0tk4IATSIefcqNEn"}' \
    > test.out 2>&1
eval_tap $? 281 'PublicVerifyRegistrationCode' test.out

#- 282 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "4IZ0Dv6b8WtaMVvL", "languageTag": "bG04KKnh3jvW0Qp3"}' \
    > test.out 2>&1
eval_tap $? 282 'PublicForgotPasswordV3' test.out

#- 283 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "kTyL4CsLwiWUMcpx", "password": "n4B6XoTNMuqZTHwo", "uniqueDisplayName": "1IAJQpb6r8ZeaSHw", "username": "QuiH3Ozu4G6bXxp0"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicValidateUserInput' test.out

#- 284 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'gYZyF9fJBJkSOrF9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'GetAdminInvitationV3' test.out

#- 285 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'Dg4FcDwBGyBiHewZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "kwEeuzBBRSknxyWk", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "Obuvig8sMuss76ez", "policyId": "TrsDZNYUV48Oh6I4", "policyVersionId": "5X7HvUtPYONZdFk7"}, {"isAccepted": false, "localizedPolicyVersionId": "dwKNPUOHNZxML3yo", "policyId": "BM9qxd6PWz7sVnMx", "policyVersionId": "ge2inL8fBFP1ABaI"}, {"isAccepted": true, "localizedPolicyVersionId": "XKEQLkM6o3eGSP4H", "policyId": "tmr90TqGf0OyqJ9i", "policyVersionId": "bJMmRgoxNwp1lGkY"}], "authType": "oq8HP1TM0tefVQPW", "code": "X1NPO5Wn7rNG8rGp", "country": "7Fadvo5EzpX0Itts", "dateOfBirth": "RezyY9GB5sf94ALB", "displayName": "mvdncQkcZb8cWdVH", "emailAddress": "9bww15zZsaYrJAe5", "password": "Kd5QB96ndlO6iPGC", "reachMinimumAge": false, "uniqueDisplayName": "hqilty9NVlgxUmnf"}' \
    > test.out 2>&1
eval_tap $? 285 'CreateUserFromInvitationV3' test.out

#- 286 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "dOAmu1dX1NqD20RU", "country": "vvYeJZw6QZFN7wFC", "dateOfBirth": "nqpvNesGiVnt9p2t", "displayName": "o7Yja1soDE1K0SvG", "languageTag": "rMYwPmPXC2LfL2m5", "uniqueDisplayName": "rP2A20t6foPPH94S", "userName": "UinY5diUlqgvY7dP"}' \
    > test.out 2>&1
eval_tap $? 286 'UpdateUserV3' test.out

#- 287 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "PyahppgxJhk4EdTZ", "country": "000rS92594HLvWFs", "dateOfBirth": "XHtMP0k9L5dREQbC", "displayName": "qfh0gpABFBER6WNc", "languageTag": "DOsRzBkf9A6HjCnF", "uniqueDisplayName": "RdSihcvszzQLZBkt", "userName": "k0siMup01kyaFwwD"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicPartialUpdateUserV3' test.out

#- 288 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "7wecuQb4GNQHVZMK", "emailAddress": "GBnzh4suaGIzttTn", "languageTag": "cVBf5g3oeuHiNyLk", "upgradeToken": "fPQPmjUkvSs5YmIe"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicSendVerificationCodeV3' test.out

#- 289 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "jozmG5HlrIfMAvvp", "contactType": "kAHRJHZyfrXZmiJX", "languageTag": "4CjKCeIRIr997KKp", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 289 'PublicUserVerificationV3' test.out

#- 290 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "bYWpqeXjaf1f5fjN", "country": "MZjKJ05puX3197Wr", "dateOfBirth": "MnJtovSMFw8X4zxb", "displayName": "dfXgunt1oMNZ68eo", "emailAddress": "vHSH3xV3URIRVDYB", "password": "d6hMB0l7sg7IfMH5", "uniqueDisplayName": "Tu1ky1ZYvyeHmfoF", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 290 'PublicUpgradeHeadlessAccountV3' test.out

#- 291 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "mEVcW7mxbS5UOoIC", "password": "xQMit8555Niy4NNF"}' \
    > test.out 2>&1
eval_tap $? 291 'PublicVerifyHeadlessAccountV3' test.out

#- 292 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "pRE5pS85yTIRWvLR", "mfaToken": "y58UKWPv3F7S0wCV", "newPassword": "lYQi9cfMCeNnu6OI", "oldPassword": "G1PPLRDEXLXZWXvq"}' \
    > test.out 2>&1
eval_tap $? 292 'PublicUpdatePasswordV3' test.out

#- 293 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'NCHvNpeMjMzguq6H' \
    > test.out 2>&1
eval_tap $? 293 'PublicCreateJusticeUser' test.out

#- 294 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FIqaqwH9J6JLb5f3' \
    --redirectUri 'SBMyJUdwEBRrHAWU' \
    --ticket 'FqTooGGnPEgY0t7Q' \
    > test.out 2>&1
eval_tap $? 294 'PublicPlatformLinkV3' test.out

#- 295 PublicPlatformUnlinkV3
eval_tap 0 295 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 296 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QWl42byOwXgKyPhX' \
    > test.out 2>&1
eval_tap $? 296 'PublicPlatformUnlinkAllV3' test.out

#- 297 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mcysae8HpWH4xiz3' \
    --ticket 'fWthJSu2pUIIuPLF' \
    > test.out 2>&1
eval_tap $? 297 'PublicForcePlatformLinkV3' test.out

#- 298 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AtcWhjAP57QbWvSS' \
    --clientId 'p71zEPPfmAQiqRRC' \
    --redirectUri '2caquMRtQOILcaDq' \
    > test.out 2>&1
eval_tap $? 298 'PublicWebLinkPlatform' test.out

#- 299 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UITBHQR5ISNoFR3G' \
    --code 'UxdMuvmL0UBfwzaa' \
    --state 'eP3Wd0Wrb8s3GW0C' \
    > test.out 2>&1
eval_tap $? 299 'PublicWebLinkPlatformEstablish' test.out

#- 300 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Y0vAfbq8xoCurq4l' \
    --code 'pHXrbVBh60NUA2aK' \
    --state 'QwnXrmi6ya8u4sQP' \
    > test.out 2>&1
eval_tap $? 300 'PublicProcessWebLinkPlatformV3' test.out

#- 301 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "vaf1AcweR7tJW3ML", "userIds": ["Mob1hUnIzIpUM8KK", "1kGFN0NUNGKxdlAU", "DFQuGPzAuT7M6OBr"]}' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetUsersPlatformInfosV3' test.out

#- 302 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "NwioKnXPVZaDcXsV", "code": "1TnsZioDiBgprzah", "emailAddress": "PB0FKMa0YeyNBQWU", "languageTag": "HDBnBeePkqg6Zt1L", "newPassword": "r5BlO8K6LH4dSaa8"}' \
    > test.out 2>&1
eval_tap $? 302 'ResetPasswordV3' test.out

#- 303 PublicGetUserByUserIdV3
eval_tap 0 303 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 304 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XYHug51ZTogG0N7H' \
    --activeOnly  \
    --after 'vnuq1kJ1kpHcQtnI' \
    --before 'c9z70LFQMI0oZuEj' \
    --limit '36' \
    > test.out 2>&1
eval_tap $? 304 'PublicGetUserBanHistoryV3' test.out

#- 305 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YiGE2cyzTMBY7Xd0' \
    > test.out 2>&1
eval_tap $? 305 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 306 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OoENg2Lw7uepmahX' \
    > test.out 2>&1
eval_tap $? 306 'PublicGetUserInformationV3' test.out

#- 307 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ojVZYz2zMU9jLzNV' \
    --after '0.9028437872213333' \
    --before '0.518864309336545' \
    --limit '1' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetUserLoginHistoriesV3' test.out

#- 308 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'g922xiBgHSka0Pz7' \
    --after 'I1WkIa0oZ1nXpW1l' \
    --before '70pcZgIn4lPghHyM' \
    --limit '63' \
    --platformId 'IT9Agsjl5NmnSHhx' \
    > test.out 2>&1
eval_tap $? 308 'PublicGetUserPlatformAccountsV3' test.out

#- 309 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NmCe4txY0MsPc9EM' \
    > test.out 2>&1
eval_tap $? 309 'PublicListJusticePlatformAccountsV3' test.out

#- 310 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'gf9JCJiEvhL8ZfwC' \
    --body '{"platformId": "VJW9yspUOyHC9eKe", "platformUserId": "XzrvzBllwzyC1aTW"}' \
    > test.out 2>&1
eval_tap $? 310 'PublicLinkPlatformAccount' test.out

#- 311 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'EmPgoy4TkpEw4Zei' \
    --body '{"chosenNamespaces": ["d4mRoFNxv10ckMQV", "jKk3bWJ0ZuYSe3sI", "0x2hc8vaN1Off5gR"], "requestId": "ZZMW3huAIzBPWBYK"}' \
    > test.out 2>&1
eval_tap $? 311 'PublicForceLinkPlatformWithProgression' test.out

#- 312 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AEFTdlKNh6GTzKjs' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetPublisherUserV3' test.out

#- 313 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cqxx24QM35bSkFrv' \
    --password 'GciNHb7OY5YIpOLJ' \
    > test.out 2>&1
eval_tap $? 313 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 314 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'W52uz3c8pz63M0g4' \
    --before 'xXT5Ts4e0uR47OzU' \
    --isWildcard  \
    --limit '66' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetRolesV3' test.out

#- 315 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'ElXYSS4ezBRSiOyR' \
    > test.out 2>&1
eval_tap $? 315 'PublicGetRoleV3' test.out

#- 316 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 316 'PublicGetMyUserV3' test.out

#- 317 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "eviDaxlPdhwmcH03", "emailAddress": "yoMxzRR6xd9rTh3u", "languageTag": "reaIbxM3Wev9pZQj", "upgradeToken": "WAN0tny16ZHZtuSJ"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicSendCodeForwardV3' test.out

#- 318 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'GQCrM7JEMRPkdTcA' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 319 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["zkIlndN5xeayr3vU", "KMuIiz2MiAAKcvAX", "nxnH0QIhoJRY807V"], "oneTimeLinkCode": "mBT4wZXQZZrSsuYi"}' \
    > test.out 2>&1
eval_tap $? 319 'LinkHeadlessAccountToMyAccountV3' test.out

#- 320 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'IPei0pXglJYnKkoC' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 321 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 321 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 322 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "AZuolAWnxkImVbDP"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicSendVerificationLinkV3' test.out

#- 323 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 323 'PublicGetOpenidUserInfoV3' test.out

#- 324 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code '0QX31gI7VmnGIRMv' \
    > test.out 2>&1
eval_tap $? 324 'PublicVerifyUserByLinkV3' test.out

#- 325 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'Xe6BiphIFe2bzr6q' \
    --code 'Qw6fSESkM19OPMBb' \
    --error '12gpmShlmIt2nfhU' \
    --state 'aZGqjslu59GT2E6A' \
    > test.out 2>&1
eval_tap $? 325 'PlatformAuthenticateSAMLV3Handler' test.out

#- 326 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'acmZRXZm626POXWV' \
    --payload 'j3KP1mX0iYHXBU3U' \
    > test.out 2>&1
eval_tap $? 326 'LoginSSOClient' test.out

#- 327 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'k2tQm307IORTyHnL' \
    > test.out 2>&1
eval_tap $? 327 'LogoutSSOClient' test.out

#- 328 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'YDAAg1YA4kZURmoG' \
    --code 'gxVRMPf8g1rbhfIM' \
    > test.out 2>&1
eval_tap $? 328 'RequestTargetTokenResponseV3' test.out

#- 329 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'StMnSqrKWYOuITlY' \
    --upgradeSuccessToken 'S2RYaD9WNKGhbLhj' \
    > test.out 2>&1
eval_tap $? 329 'UpgradeAndAuthenticateForwardV3' test.out

#- 330 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '52' \
    --namespace "$AB_NAMESPACE" \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 330 'AdminListInvitationHistoriesV4' test.out

#- 331 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '1v0RBIO2rkJGmPaK' \
    > test.out 2>&1
eval_tap $? 331 'AdminGetDevicesByUserV4' test.out

#- 332 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType '6HEVIQJd3930TGew' \
    --endDate 'jRyfo4nWVZZbKFsK' \
    --limit '82' \
    --offset '26' \
    --startDate 'Wc3migf2n6iQyr5c' \
    > test.out 2>&1
eval_tap $? 332 'AdminGetBannedDevicesV4' test.out

#- 333 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'b5YL6fwBiaVPmmn0' \
    > test.out 2>&1
eval_tap $? 333 'AdminGetUserDeviceBansV4' test.out

#- 334 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "T5uzlmi2NY26xrkP", "deviceId": "Pdg3pXjmtpNfCrIj", "deviceType": "9ntYo3dupUHNu8ab", "enabled": true, "endDate": "HPMUvOAUXkw36cr2", "ext": {"WJQqS7Tq4YIyZAFQ": {}, "6lZfa2jdNvpWf32J": {}, "S1av9VNpVLT0Lvqc": {}}, "reason": "fSdO1nAjY5FvADb3"}' \
    > test.out 2>&1
eval_tap $? 334 'AdminBanDeviceV4' test.out

#- 335 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'GUQgci632w6LUrHu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 335 'AdminGetDeviceBanV4' test.out

#- 336 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'KBoNTpPQXDNHto74' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 336 'AdminUpdateDeviceBanV4' test.out

#- 337 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'cmVf0fbCU9QdPuWe' \
    --startDate 'MEeL0EJG67g4W1eA' \
    --deviceType 'mDxP23qstMuikKc6' \
    > test.out 2>&1
eval_tap $? 337 'AdminGenerateReportV4' test.out

#- 338 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 338 'AdminGetDeviceTypesV4' test.out

#- 339 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'VNU8570siWm3V9si' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 339 'AdminGetDeviceBansV4' test.out

#- 340 AdminDecryptDeviceV4
eval_tap 0 340 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 341 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'rE0JOQxWeHypqCWM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 341 'AdminUnbanDeviceV4' test.out

#- 342 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'DPRI2cCk8zHR8VyC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetUsersByDeviceV4' test.out

#- 343 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 343 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 344 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 344 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 345 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 42, "userInfo": {"country": "EQwE0cXokXbwKDtV"}}' \
    > test.out 2>&1
eval_tap $? 345 'AdminCreateTestUsersV4' test.out

#- 346 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "YHIknvPcJkjRevVY", "policyId": "fiExpAgoK9YDq1x3", "policyVersionId": "dkbJFDEBEOOvJ5BK"}, {"isAccepted": false, "localizedPolicyVersionId": "lpvqaB9P9GaukfCE", "policyId": "IeSBLhTfzigzHcRu", "policyVersionId": "JgYaj4I8Dzyh1N0J"}, {"isAccepted": true, "localizedPolicyVersionId": "cE7GuwKn63KIDTkU", "policyId": "CqbbHGJGOTvKKRTH", "policyVersionId": "DntaFiufH2YR6QU7"}], "authType": "EMAILPASSWD", "code": "dVB5a2XkS3XQfMuz", "country": "Zh4AhZRe2hgU56xt", "dateOfBirth": "yJtnbTDXu7FbleSP", "displayName": "5PcdOuq0m0rvakR8", "emailAddress": "rcwojLRjhcaJ56nG", "password": "lYZ2tod2BGBXjNyR", "passwordMD5Sum": "CtPOr1FU3QZy3gdD", "reachMinimumAge": false, "uniqueDisplayName": "NeTflyvUh3w5Ztfw", "username": "mOCKpFSMF0tfGIZC"}' \
    > test.out 2>&1
eval_tap $? 346 'AdminCreateUserV4' test.out

#- 347 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["NiIRc9fEjkZhEpAJ", "MCxMp2J0hDg2kMgk", "vhoQe9gD9tGN0nE7"]}' \
    > test.out 2>&1
eval_tap $? 347 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 348 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["M36mI9u3EeZtLQij", "2JXsqdXfhZTTaCeq", "Gv7meuQhJuq1C6JH"]}' \
    > test.out 2>&1
eval_tap $? 348 'AdminBulkCheckValidUserIDV4' test.out

#- 349 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kWMSUbqByWN2BCnR' \
    --body '{"avatarUrl": "z9w2nur0B9jKaunA", "country": "cylsau7wRQmL4i3e", "dateOfBirth": "RyIECEDa1I4lwXqw", "displayName": "Pfq3VzHQjtolx64w", "languageTag": "1gyvjacKtGqxMnoA", "skipLoginQueue": true, "uniqueDisplayName": "lcq0mYWKQYlqMmu2", "userName": "pvF6rP03bQaq1cT8"}' \
    > test.out 2>&1
eval_tap $? 349 'AdminUpdateUserV4' test.out

#- 350 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '8H6RCW8gJmGzDlqx' \
    --body '{"code": "tLsR2AGOiPhNt2Id", "emailAddress": "H8aYYUT6mma833TD"}' \
    > test.out 2>&1
eval_tap $? 350 'AdminUpdateUserEmailAddressV4' test.out

#- 351 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zk66ix88sAUrXr7M' \
    --body '{"factor": "XxCvyy7caxz4MQrO", "mfaToken": "DLNlxiEjQBCZx9DJ"}' \
    > test.out 2>&1
eval_tap $? 351 'AdminDisableUserMFAV4' test.out

#- 352 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '4V97SJLlrwXmIGam' \
    > test.out 2>&1
eval_tap $? 352 'AdminGetUserMFAStatusV4' test.out

#- 353 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RCARuFLx4rV4CXVM' \
    > test.out 2>&1
eval_tap $? 353 'AdminListUserRolesV4' test.out

#- 354 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rDYKe2eTf1axo16G' \
    --body '{"assignedNamespaces": ["qT2vSLLiMvcu39YZ", "JypWzpNXgnoKIz8O", "8NglJtZTh280vflF"], "roleId": "MxIhlIT8AgyZJ16M"}' \
    > test.out 2>&1
eval_tap $? 354 'AdminUpdateUserRoleV4' test.out

#- 355 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Md2bzOrTn2huwPgy' \
    --body '{"assignedNamespaces": ["UzBUWiKoNGtvyk5x", "EfrJDxKsw5Xl7ZZr", "DZdbuvCFBaVcohew"], "roleId": "KkVuGv9fQXkErF0d"}' \
    > test.out 2>&1
eval_tap $? 355 'AdminAddUserRoleV4' test.out

#- 356 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rbYrrFQP6rW62Cte' \
    --body '{"assignedNamespaces": ["tBW3pvAJJieHhveG", "g97PY0txzvYwv7at", "n9EQv2Oj8TFNeGtJ"], "roleId": "GjKbMgCeuAYuzrmb"}' \
    > test.out 2>&1
eval_tap $? 356 'AdminRemoveUserRoleV4' test.out

#- 357 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '29' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 357 'AdminGetRolesV4' test.out

#- 358 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "EaKStqdKu4ROnONp"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminCreateRoleV4' test.out

#- 359 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'J849chqeiUGQMwNw' \
    > test.out 2>&1
eval_tap $? 359 'AdminGetRoleV4' test.out

#- 360 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'DlYSli3p8YaAdel3' \
    > test.out 2>&1
eval_tap $? 360 'AdminDeleteRoleV4' test.out

#- 361 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'hHMSLAiscGRWzkCl' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "egrZddP8lLQo6tHj"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateRoleV4' test.out

#- 362 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId '4z4cAM4LMJfWNZIx' \
    --body '{"permissions": [{"action": 54, "resource": "hrqgvEtEs2LpE0qf", "schedAction": 2, "schedCron": "d3LrR1x6U1v6zSLj", "schedRange": ["m9zmzUW0vPj90jmL", "Tt5YQGawcomPoiYo", "Q1f1AYq306Pysv4V"]}, {"action": 84, "resource": "40Zrpn0vAD9YsPeD", "schedAction": 100, "schedCron": "f2iWi4yP3uqNcig6", "schedRange": ["YcDA8Z3g62oGYwkr", "jLI4EHJEEWgki9fb", "dvUMDZeO4U55wdCp"]}, {"action": 98, "resource": "h6r0e0J6vyqPw7Yl", "schedAction": 25, "schedCron": "BElD4K2Cy1tJcPAE", "schedRange": ["kCeV29QsQk100eu5", "UcxuXXpt0YSPX04u", "EIdAwgDobopbdJeV"]}]}' \
    > test.out 2>&1
eval_tap $? 362 'AdminUpdateRolePermissionsV4' test.out

#- 363 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'CiKs2vLyH9kcSBdk' \
    --body '{"permissions": [{"action": 95, "resource": "MwQzn28Le5neohqh", "schedAction": 58, "schedCron": "SuBQdvdhJoT0WK5n", "schedRange": ["gNUxDKfZYofPGUbS", "aA00nKxQjYU6Klav", "IiLxU2I1GyJS48Hx"]}, {"action": 42, "resource": "HW882riiPfRQ3rJ0", "schedAction": 10, "schedCron": "SZBvkehRn83B0nrW", "schedRange": ["1qx3NJTugVWXz8dv", "7BiEUqnzxs2deMF8", "UAJIHEZv5zyUUyNJ"]}, {"action": 20, "resource": "Yx2TqkhlqMnE9Wj9", "schedAction": 16, "schedCron": "EQzOidrWnLrXqImg", "schedRange": ["Df3GaJsdCZND0wgY", "OilX1e1825iasunE", "Sjcgr2drXG5NkKCy"]}]}' \
    > test.out 2>&1
eval_tap $? 363 'AdminAddRolePermissionsV4' test.out

#- 364 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'SLA8cKCs0dFYRSa2' \
    --body '["OULZ0iOZJiOAh1Sp", "LhMF2Pav11FuU8iX", "CRz8KgqgwijYxpGh"]' \
    > test.out 2>&1
eval_tap $? 364 'AdminDeleteRolePermissionsV4' test.out

#- 365 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'sFArq6lolbj7QKvt' \
    --after 'VRCPMjr5M3vw1GqU' \
    --before 'jjFp6R8mYZwKftVq' \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 365 'AdminListAssignedUsersV4' test.out

#- 366 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'ut2hiPuDdOPHcN9d' \
    --body '{"assignedNamespaces": ["rwqytieXpIZfr5XD", "q9dGLHjtgE2bTXJx", "CCFqPNDqWrpkWnno"], "namespace": "va15WVuE5cYVP9tQ", "userId": "Sa27BnPyq3I1BLtG"}' \
    > test.out 2>&1
eval_tap $? 366 'AdminAssignUserToRoleV4' test.out

#- 367 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'EZDRNkk4DJUofJXK' \
    --body '{"namespace": "8RGS0zCYRVmbfzwU", "userId": "msy0stUmKdXiiTOb"}' \
    > test.out 2>&1
eval_tap $? 367 'AdminRevokeUserFromRoleV4' test.out

#- 368 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["NdqkWa13g3pgHx6u", "Pf6jQZcYerH933X7", "iXEEM2KOusNEHcI9"], "emailAddresses": ["5GGdJvucDbs6Udcc", "uM2ykRj3WnyAaUaQ", "BKFedL2uduXvZUbQ"], "isAdmin": true, "isNewStudio": true, "languageTag": "hD3NExUFipJsUiDa", "namespace": "wAjgHFQk0VzWRNFN", "roleId": "iUn2yXMSCcHADYpS"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminInviteUserNewV4' test.out

#- 369 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "861c0CJ7LzpFvOSF", "country": "6xKA6yrnvXY5dDwn", "dateOfBirth": "eac75C6S2eHsH4Y8", "displayName": "4hL75QboMHCtzEF9", "languageTag": "FSeg6WYgtfuqJHrs", "skipLoginQueue": true, "uniqueDisplayName": "e3RnWR30MdBZezfw", "userName": "c3H0qSbMq4GLj8aG"}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateMyUserV4' test.out

#- 370 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "sH0qE5p601ak59yF", "mfaToken": "SfdZIv8oYWPUS4Zu"}' \
    > test.out 2>&1
eval_tap $? 370 'AdminDisableMyAuthenticatorV4' test.out

#- 371 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '0SbTt6M2XizikCh6' \
    > test.out 2>&1
eval_tap $? 371 'AdminEnableMyAuthenticatorV4' test.out

#- 372 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 372 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 373 AdminGetMyBackupCodesV4
eval_tap 0 373 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 374 AdminGenerateMyBackupCodesV4
eval_tap 0 374 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 375 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"factor": "q0yq2WAHtL7IWE3M", "mfaToken": "FqvfDG5jvMOaXrDl"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminDisableMyBackupCodesV4' test.out

#- 376 AdminDownloadMyBackupCodesV4
eval_tap 0 376 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 377 AdminEnableMyBackupCodesV4
eval_tap 0 377 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 378 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'EX42U0syrGNhBmgT' \
    > test.out 2>&1
eval_tap $? 378 'AdminGetBackupCodesV4' test.out

#- 379 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag '2q0kIbrJ2S5Pf1Lv' \
    > test.out 2>&1
eval_tap $? 379 'AdminGenerateBackupCodesV4' test.out

#- 380 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'g8kYEVylINJpxFY8' \
    > test.out 2>&1
eval_tap $? 380 'AdminEnableBackupCodesV4' test.out

#- 381 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'E6pU8eHjh0aTjIOa' \
    --factor 'Qt0snbE0yMvqF7TJ' \
    > test.out 2>&1
eval_tap $? 381 'AdminChallengeMyMFAV4' test.out

#- 382 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action '9uB0zypjJiu7BIim' \
    --languageTag 'NuwB3hBVhuSMHhf5' \
    > test.out 2>&1
eval_tap $? 382 'AdminSendMyMFAEmailCodeV4' test.out

#- 383 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "R2MkxQTAYGfE6hXZ", "mfaToken": "7XLoWCGf0dZEeXBd"}' \
    > test.out 2>&1
eval_tap $? 383 'AdminDisableMyEmailV4' test.out

#- 384 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code '6mGG6SHcZbX2wNnT' \
    > test.out 2>&1
eval_tap $? 384 'AdminEnableMyEmailV4' test.out

#- 385 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 385 'AdminGetMyEnabledFactorsV4' test.out

#- 386 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor '6A9zosmDnXoncy7N' \
    > test.out 2>&1
eval_tap $? 386 'AdminMakeFactorMyDefaultV4' test.out

#- 387 AdminGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyOwnMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 387 'AdminGetMyOwnMFAStatusV4' test.out

#- 388 AdminGetMyMFAStatusV4
eval_tap 0 388 'AdminGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 389 AdminInviteUserV4
eval_tap 0 389 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 390 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'ZQ4PkAPXBCfkE1Fb' \
    --linkingToken '0y94eP7yh0zsKhR6' \
    --password '0HZwUwk48XK7MXHb' \
    --username 'EwAvvpEeHhXiJcJq' \
    > test.out 2>&1
eval_tap $? 390 'AuthenticationWithPlatformLinkV4' test.out

#- 391 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'YSxVKUYMimVLzAP6' \
    --extendExp  \
    --linkingToken 'aOzsTqEFXUhGAwpY' \
    > test.out 2>&1
eval_tap $? 391 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 392 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'q1UqZydOB0MThZW6' \
    --factor 'LwcAg57BYBVCbi0i' \
    --mfaToken 'fdPyKf3SwHekWIz4' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 392 'Verify2faCodeV4' test.out

#- 393 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'rXlH5jw99HxCjXWc' \
    --codeChallenge 'aXBcfXXeV7BXefsS' \
    --codeChallengeMethod 'S256' \
    --additionalData '8PdQ5mQaGXEbnmWR' \
    --clientId '0H3EkrHqaLNdfKsz' \
    --createHeadless  \
    --deviceId 'YZzOg113h6fIaHSx' \
    --macAddress '5bClxUOBmMwv5pmi' \
    --platformToken 'IVnhlLoMemsp7o3F' \
    --serviceLabel '0.8753105199503503' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 393 'PlatformTokenGrantV4' test.out

#- 394 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'LQw7Y2VdSxgXez7V' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform '5cWeg6eSCypsceIT' \
    --simultaneousTicket 'TkJGGCVF6LrILDLv' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'wZgf5nlMDORYuXnP' \
    > test.out 2>&1
eval_tap $? 394 'SimultaneousLoginV4' test.out

#- 395 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'NJgayPFcyUnKXA3m' \
    --codeChallengeMethod 'S256' \
    --additionalData 'dUSiTOrhB8hVs29W' \
    --clientId 'OKmZRTtgycLzXz6l' \
    --clientSecret 'UMKi5mweMEZo2ZnL' \
    --code '1Zg2JfH4f73jAevO' \
    --codeVerifier 'nES6YJLlb2AfUEEB' \
    --extendNamespace 'bqMMKvkOsR1fHUyi' \
    --extendExp  \
    --loginQueueTicket 'rMVMOFES2J2OzNlJ' \
    --password 'E3uqZz574g31cA0P' \
    --redirectUri 'wZxTIZVSGQyTzhs9' \
    --refreshToken 'Asy4d629N4YnolVW' \
    --username 'A2dWxBs056jkPCUu' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 395 'TokenGrantV4' test.out

#- 396 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'CiZAZHCWMXxVh8HT' \
    --code 'rKqVwnpPn8N5xMRg' \
    > test.out 2>&1
eval_tap $? 396 'RequestTargetTokenResponseV4' test.out

#- 397 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'U7cPqNZrLCRRUysy' \
    --rawPUID  \
    --body '{"pidType": "a4J3rvTzMTMSwrNo", "platformUserIds": ["v2GW9i54JY23AUWF", "TLq0W1JqwKs1mO80", "L7IOHlf6j8PZOzUi"]}' \
    > test.out 2>&1
eval_tap $? 397 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 398 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QKZqz5NSp0B7LODN' \
    --platformUserId '3Boi2sSAO2n4MZQt' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetUserByPlatformUserIDV4' test.out

#- 399 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "53XQB93rOW0guPoQ", "policyId": "bYzc1RDVhs2lhdzx", "policyVersionId": "xgibuqUuyW3cMz9Y"}, {"isAccepted": true, "localizedPolicyVersionId": "NBQy41M1gzGCbaxw", "policyId": "33rNbE4bbDU4FMTb", "policyVersionId": "QaANJOODGerDCWcl"}, {"isAccepted": false, "localizedPolicyVersionId": "ENQopeHD6iKBGm5C", "policyId": "j7RqnJUmfDmofxvN", "policyVersionId": "8pRGoUtmbWZbEjPy"}], "authType": "EMAILPASSWD", "country": "iZeyIrA4QUKSJgEC", "dateOfBirth": "zvaWUCA7wKru7ry3", "displayName": "AQ2sEHvSxjWoM1rN", "emailAddress": "JLM0OOVG5cG6XxEN", "password": "bWqlX7idzjpKDfwl", "passwordMD5Sum": "6XlCF6YxFMD8tJQw", "uniqueDisplayName": "ZvUVInos5RK100yH", "username": "89i8ZDPXRL8cbTAn", "verified": true}' \
    > test.out 2>&1
eval_tap $? 399 'PublicCreateTestUserV4' test.out

#- 400 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "B1STaab1UeibXg7R", "policyId": "Ce5BtKcwj6PqqOgC", "policyVersionId": "imr3ZQNBBkrXu9cz"}, {"isAccepted": true, "localizedPolicyVersionId": "S4Cmgw1wRUnIVYxY", "policyId": "6OhdkrYiCinoVOzo", "policyVersionId": "4Plv1IlTpEhjTFYd"}, {"isAccepted": true, "localizedPolicyVersionId": "XEuOzzkoBmMR9C4q", "policyId": "PqJrAdh1HIk7vCEq", "policyVersionId": "7FQ2S5VeW9ddxzLP"}], "authType": "EMAILPASSWD", "code": "wDdSkNfHJtA3QiX9", "country": "ZvtydbaVb0scd97A", "dateOfBirth": "0GP6djn2Ps3IVT5h", "displayName": "UZ3cnDq0ddZG0Epf", "emailAddress": "GAqHKcSxUc2YgRpk", "password": "2IFGIgIpscUpVAci", "passwordMD5Sum": "u2XPPUxzXHUvxhvT", "reachMinimumAge": false, "uniqueDisplayName": "50nyihcUVGHQczI5", "username": "ZoTRUkjGoRkPs2SO"}' \
    > test.out 2>&1
eval_tap $? 400 'PublicCreateUserV4' test.out

#- 401 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId '9XrgXNIaU11cBXLw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "LpP7n7M3JXjEvsj5", "policyId": "WcQ99M1yuXeqV31L", "policyVersionId": "X2ehcMnM6QtjzQjD"}, {"isAccepted": false, "localizedPolicyVersionId": "4Cdd1QYvww4XDokl", "policyId": "tgq2vXtUnY6UhDJ4", "policyVersionId": "pe0s0Cuhl3dU9b4s"}, {"isAccepted": false, "localizedPolicyVersionId": "TN5Qf4tjPGpu27yx", "policyId": "b1of79zVTWIfgdNp", "policyVersionId": "hqe9fS1m77MAg4Ko"}], "authType": "EMAILPASSWD", "code": "QPLhDSJx9jzxaRKp", "country": "h4kiIFgS4fLqlrKG", "dateOfBirth": "iS3XxjkyNfj3XgTR", "displayName": "TjI9oNBzgQ4CRwg0", "emailAddress": "sKVeSpMny0GrvKI5", "password": "EVB9ZFzLNsjdCFtK", "passwordMD5Sum": "Y0KsxR0rCFkyiQZf", "reachMinimumAge": false, "uniqueDisplayName": "roN4UWbQaKFrTv4J", "username": "WElmOCxqPrq9I3XJ"}' \
    > test.out 2>&1
eval_tap $? 401 'CreateUserFromInvitationV4' test.out

#- 402 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "WBxTLcOef8MgIwkr", "country": "KFEtwESJCe2ksG3n", "dateOfBirth": "ZE13H2fILFzOlAZb", "displayName": "DQAEJLbVWH2XLIg3", "languageTag": "MgmdSvWp3h0xPsVY", "uniqueDisplayName": "8qNwB2TY4v9NNfQS", "userName": "YLFKSl3FNFFJnt3r"}' \
    > test.out 2>&1
eval_tap $? 402 'PublicUpdateUserV4' test.out

#- 403 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "IwZdW02Su6aCnL81", "emailAddress": "6aH6gOBUIMeL0GL3"}' \
    > test.out 2>&1
eval_tap $? 403 'PublicUpdateUserEmailAddressV4' test.out

#- 404 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "aefSDME8X2MxILI4", "country": "2BJMPkZmay4Csye3", "dateOfBirth": "iJLtjsu6ZJRCoDq3", "displayName": "geuHFFaZzPIjETqc", "emailAddress": "KN1gaQ4Bn0cPPtKa", "password": "Jlw31pdDrXQ47WSG", "reachMinimumAge": true, "uniqueDisplayName": "dWCp4wqlQJcZroNQ", "username": "iefBnPluOIjZyvlG", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 404 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 405 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "HnPumcazKAna0ji7", "displayName": "57aNDFeKnQP2j2Ws", "emailAddress": "QImTwYkiuxzLrbJ0", "password": "BkGzCNgesQlZZHIZ", "uniqueDisplayName": "H0iks6kx0adnimPy", "username": "yzezsHdFftHHR6xb"}' \
    > test.out 2>&1
eval_tap $? 405 'PublicUpgradeHeadlessAccountV4' test.out

#- 406 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "cVVonwz27DWfGRVh", "mfaToken": "bZTvCPrrZCTU5WUJ"}' \
    > test.out 2>&1
eval_tap $? 406 'PublicDisableMyAuthenticatorV4' test.out

#- 407 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'izF69PSsquWUafwb' \
    > test.out 2>&1
eval_tap $? 407 'PublicEnableMyAuthenticatorV4' test.out

#- 408 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 408 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 409 PublicGetMyBackupCodesV4
eval_tap 0 409 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 410 PublicGenerateMyBackupCodesV4
eval_tap 0 410 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 411 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "FPX15633pFgA7i9t", "mfaToken": "qvfHmFvUZiUW5Y0C"}' \
    > test.out 2>&1
eval_tap $? 411 'PublicDisableMyBackupCodesV4' test.out

#- 412 PublicDownloadMyBackupCodesV4
eval_tap 0 412 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 413 PublicEnableMyBackupCodesV4
eval_tap 0 413 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 414 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'Yw5OXSGwQkJuy9oL' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetBackupCodesV4' test.out

#- 415 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'FcHHcraLXR2n9JQv' \
    > test.out 2>&1
eval_tap $? 415 'PublicGenerateBackupCodesV4' test.out

#- 416 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'q7NKWIHYsii3fCh7' \
    > test.out 2>&1
eval_tap $? 416 'PublicEnableBackupCodesV4' test.out

#- 417 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'sieJjZPAkiWumllU' \
    --factor '31uXPwYxedGHCIkm' \
    > test.out 2>&1
eval_tap $? 417 'PublicChallengeMyMFAV4' test.out

#- 418 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 't4bfJOhNaIT0pv7X' \
    > test.out 2>&1
eval_tap $? 418 'PublicRemoveTrustedDeviceV4' test.out

#- 419 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'eqO8gY3c4SryWB4y' \
    --languageTag 'RaDxvxwaLM8HkVOW' \
    > test.out 2>&1
eval_tap $? 419 'PublicSendMyMFAEmailCodeV4' test.out

#- 420 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "8PnLkgqkqYZWPZTg", "mfaToken": "KagTzdcYcko7U3gH"}' \
    > test.out 2>&1
eval_tap $? 420 'PublicDisableMyEmailV4' test.out

#- 421 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code '239LhRx2Laa2RdtV' \
    > test.out 2>&1
eval_tap $? 421 'PublicEnableMyEmailV4' test.out

#- 422 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 422 'PublicGetMyEnabledFactorsV4' test.out

#- 423 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'b6VgA5yFIH3s9Uye' \
    > test.out 2>&1
eval_tap $? 423 'PublicMakeFactorMyDefaultV4' test.out

#- 424 PublicGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyOwnMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 424 'PublicGetMyOwnMFAStatusV4' test.out

#- 425 PublicGetMyMFAStatusV4
eval_tap 0 425 'PublicGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 426 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aFi8OE7BCK4FeVGr' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 427 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "l5NpUG9zblWEiHaU", "emailAddress": "jyTHb0sSlstb3slU", "languageTag": "e94NxhXsVcqTYi1T", "namespace": "MBMzaOrxuKvtUVtq", "namespaceDisplayName": "bDWnJ2i9TRmJOqIl"}' \
    > test.out 2>&1
eval_tap $? 427 'PublicInviteUserV4' test.out

#- 428 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "12hO5vpk9DOSgbsd", "policyId": "GVPLD9A5NmuZDUV3", "policyVersionId": "yHurgOfba1XeoHYT"}, {"isAccepted": false, "localizedPolicyVersionId": "oRol84UlkxtP5Vok", "policyId": "9sNK1ORg3tChsS3f", "policyVersionId": "FpaS1uq1mH3oYfPK"}, {"isAccepted": true, "localizedPolicyVersionId": "QiAUhIfi17YrkWHN", "policyId": "xiaNyqBfgw58Hx0X", "policyVersionId": "YL0fJOPYpnPqGlPn"}], "code": "hBDOWqDU8N3DjVUt", "country": "0n0jfyDbtIXICLkK", "dateOfBirth": "8ZvbnTg3znlg8nmz", "displayName": "Qx1RsYhcRlv16Wwe", "emailAddress": "8YK3lZFslECI9Qzu", "password": "QcsjFehD6uTDYnqy", "reachMinimumAge": false, "uniqueDisplayName": "TKCbYMVkXEHmsHwI", "username": "GGsusS0zZRODEKPd", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 428 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE