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
echo "1..404"

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

#- 137 RetrieveAllThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 137 'RetrieveAllThirdPartyLoginPlatformCredentialV3' test.out

#- 138 RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'RetrieveAllActiveThirdPartyLoginPlatformCredentialV3' test.out

#- 139 RetrieveAllSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 139 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 140 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fhcRC7IVYa6iZ5uF' \
    > test.out 2>&1
eval_tap $? 140 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 141 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RYNn3SHiWxF0YbuU' \
    --body '{"ACSURL": "5ar5qTLWUCy0Afgc", "AWSCognitoRegion": "050XIZRW491e94mQ", "AWSCognitoUserPool": "jVOOBnIWhunElqZU", "AllowedClients": ["odp3IhtCSHy1ei1f", "IrPvfHnRN06EjRwE", "QlNapJRfk4f9Zcw1"], "AppId": "pEHAyNFxcVTKuAQT", "AuthorizationEndpoint": "Gh5BxjWOozGoDtsU", "ClientId": "uYo5p8ED5QZAufwN", "EmptyStrFieldList": ["a8lzfjv9oYMXMjlV", "HY1AHwF3vGoav7MK", "0PcLnEkcokKwcQ0b"], "EnableServerLicenseValidation": false, "Environment": "cZsU3VAdMDcb4qlk", "FederationMetadataURL": "iFAamqvZI2KwjqPB", "GenericOauthFlow": false, "IncludePUID": false, "IsActive": false, "Issuer": "ade41s3rH34mB2yP", "JWKSEndpoint": "lRpWjmHZAAvKTH8M", "KeyID": "uqIg0CzkguwuJCW7", "LogoURL": "EEFB67AODbi9Bzup", "NetflixCertificates": {"encryptedPrivateKey": "BsFpYc77GtRUcCFe", "encryptedPrivateKeyName": "Y5g4XgBsbfzqxBPN", "publicCertificate": "e8ae1Il4aAtEbu4I", "publicCertificateName": "jGdqthRxTjQ7gkZE", "rootCertificate": "Y8rG0q0Q2Qd2JzRb", "rootCertificateName": "kF2I03dIjvBbA6bf"}, "OrganizationId": "bYaJCJjfk2TUvn95", "PlatformName": "FhO7VW3mbDVMDu87", "RedirectUri": "t0ldWf7iSGIiKFtW", "RegisteredDomains": [{"affectedClientIDs": ["tn4Yr2svKM6pqLGZ", "0TBujELAUK6mQ5iZ", "gbwwm5iGzXtcknrg"], "domain": "idKupvXO6aj4hCmT", "namespaces": ["C34jxW4pIDwdqXpm", "Rmut9H9XyWI8bp8f", "QxRuX91uYmtrHJbE"], "roleId": "GTUj7YjERL1rEQG0"}, {"affectedClientIDs": ["2zccA8wvLsWUNd6l", "PKvqDejvqklTSvDw", "uOrP9lzpiX0VuFpZ"], "domain": "um7izxe7NPzjOa8E", "namespaces": ["7wY76PxLv9HBEUe8", "9AwEw1HO4FnKtx4X", "LKAmlDr19uJ3nq6V"], "roleId": "erzVCcI8y3Cz0YqC"}, {"affectedClientIDs": ["KUh5RD9vNAp4jinF", "pnQ5xF9wwbvMZyeD", "eRnVfPUa6xVVBcq3"], "domain": "wZpFIYeAg79HcLJX", "namespaces": ["J7mpVI6eTYAjdPlC", "iQQC35cj4KyOVgvn", "WbfRJtsB7cUQZ2QU"], "roleId": "AxJrINPXppPNO3Af"}], "Secret": "mXcgwC3IN6tvKgLB", "TeamID": "9QmJIOq9dP5szG71", "TokenAuthenticationType": "utjsQ4CrRb9gUCeV", "TokenClaimsMapping": {"z7fWbZIdhevfZvyV": "7AcodcZwKjYDdmJO", "lzwm9Su4FnS98Qqf": "tSjq7sn8yreciPLf", "kVyyJsbGpO6JgehD": "JxEN7JlZc8LMq1o2"}, "TokenEndpoint": "jZWu4yA3r0u4q1bT", "UserInfoEndpoint": "HXIjfJKyFlM0u1uu", "UserInfoHTTPMethod": "oVdn9yVoSlKNchPH", "scopes": ["NL4X3LLaGPGdqLE8", "SohhhuiTnJarYYkH", "BDdSzBXdxapwhd5I"]}' \
    > test.out 2>&1
eval_tap $? 141 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 142 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QYBQuxLvPuWYvE3f' \
    > test.out 2>&1
eval_tap $? 142 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 143 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sNy9Z9OhxXvCp9y7' \
    --body '{"ACSURL": "fLD2qfCXnlUnqxT1", "AWSCognitoRegion": "WsRNMZcA92hzC7MN", "AWSCognitoUserPool": "a8vVe4MHX6AgMep9", "AllowedClients": ["0AyyUJyAK5PRMRMw", "dvl0hv6g62GxBW2t", "QF5tkTjgJaMYvNQO"], "AppId": "sDa4bkcgepqtxjbr", "AuthorizationEndpoint": "ztee7QLTGAak7Kao", "ClientId": "l01DK97D2xnik42m", "EmptyStrFieldList": ["iteR5eQAe1rzmmgq", "BPRmd6mO4oI8KDqe", "bm83raNBJ5y7axEk"], "EnableServerLicenseValidation": true, "Environment": "68eqGJtWf1Ybgg8r", "FederationMetadataURL": "dwY9bmrvHmO07KNq", "GenericOauthFlow": true, "IncludePUID": true, "IsActive": true, "Issuer": "IwEsdOGBXBwnzDX8", "JWKSEndpoint": "v3xgC1Ge9PdbTTAJ", "KeyID": "2Gp1r0sVZ6LJAOdd", "LogoURL": "IL2l3hPjNDKv2LWf", "NetflixCertificates": {"encryptedPrivateKey": "Xqjr8fS79En3wYow", "encryptedPrivateKeyName": "BdkaZ3y6i38XQjLD", "publicCertificate": "RqkpiFK5BtiQ272U", "publicCertificateName": "o9UBJWodpdwsX1jo", "rootCertificate": "rcyR0x3YiHF8ITGP", "rootCertificateName": "RQBCgIs1Q2lzxl0y"}, "OrganizationId": "F5m77TTh4gUoj8u2", "PlatformName": "WRcLiEtzVlnkflfn", "RedirectUri": "7pHY48F1dl1q92m3", "RegisteredDomains": [{"affectedClientIDs": ["iRlfnBAk0CwiAsR6", "5yQ9ssuHdGmxncCE", "r0KcgeqzGbruNB72"], "domain": "HHMkjzyBB4UFKiao", "namespaces": ["V0VOem2yqPsMFxKy", "bPkbuS6x9cLJ1APn", "Nlsa2bRBr27fVMWu"], "roleId": "AfDqLMR919IZPKOK"}, {"affectedClientIDs": ["iAVQXXOmqFHLbyXm", "gCNiXH8uenbC5Cph", "gMweexsIAP5vHLjB"], "domain": "J9iqMcBL4BzhDUjh", "namespaces": ["KPwbwcvQU5kG8bXG", "FmPAnOkDiJq4xQye", "7HqnVK3YVeOWs9mf"], "roleId": "VQh3jLBtn9pxpE7B"}, {"affectedClientIDs": ["YtzB0B4CxyQrUpIF", "vORxTi79DpSjb39u", "kcR6c2E2r3vk3IfA"], "domain": "KEbqcNXSGCCvNowN", "namespaces": ["mdpcJgF88ySNq4Mj", "7mulP4tQ6R1OqKVO", "TniBgLsNhdgQ0JWZ"], "roleId": "jNRSzOTqcVNX3ahv"}], "Secret": "xw9gwwhTnjN6wKZG", "TeamID": "W4y3f0R9s2kndhhZ", "TokenAuthenticationType": "hwAiLsZs4pmLDIQc", "TokenClaimsMapping": {"h4IjDq9aT3qZyI0r": "YsWucAkXsVJbXi7e", "RZa7WwIc895ImqK6": "tVsaUq3stUh5J5Z9", "GiBiSAylX5cS0IeH": "pWCugmfOL0QQpxsu"}, "TokenEndpoint": "D8PGqku59eFJrOXy", "UserInfoEndpoint": "DYz9vMUOPG0iHDT8", "UserInfoHTTPMethod": "QbF7gHPTPQbvLt2N", "scopes": ["RqJGIKzLyH1y72L1", "3Ornyx34luLdvtsT", "KXMjiw6gYPvfn2Qt"]}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 144 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9iyq3Nyk8ncu2Z3e' \
    --body '{"affectedClientIDs": ["DHH9WaVO4iKhDcJ7", "TCcNIsQ3PuppUxDS", "K8aOTGMudcxlCV4c"], "assignedNamespaces": ["NbJGQ57lPdinpjS2", "DRfGt9GlyZVQ4X67", "tPZSTpPq3xjrElvv"], "domain": "Dgw0ag7kSWE0Hiqm", "roleId": "5IuLryiEXqvUWDjU"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 145 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1G0EVjVZw1ToLuPa' \
    --body '{"domain": "kQN1MpOs1RVFrcg2"}' \
    > test.out 2>&1
eval_tap $? 145 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 146 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CXxepx78fvsyhE2B' \
    > test.out 2>&1
eval_tap $? 146 'RetrieveSSOLoginPlatformCredential' test.out

#- 147 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KtyTDSIM7mkmvZ7C' \
    --body '{"acsUrl": "msh4US8o4jfMANPp", "apiKey": "mZDdMiCxmuCCVuFj", "appId": "S1GC1d2b92B4vEgj", "federationMetadataUrl": "3HOmhcWm428XejRF", "isActive": true, "redirectUri": "NIY9nMrBZo0lNUBD", "secret": "ShHD32vvL28FPwTi", "ssoUrl": "XfLcxDC9Ynd02mEC"}' \
    > test.out 2>&1
eval_tap $? 147 'AddSSOLoginPlatformCredential' test.out

#- 148 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'IQhfIhHtADUQ9zim' \
    > test.out 2>&1
eval_tap $? 148 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 149 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QTQT95pFJUAJsyAf' \
    --body '{"acsUrl": "eKOufV4f15NohXu6", "apiKey": "opxQGRt6PqlkL0di", "appId": "RhLC10ih2EQfY3XC", "federationMetadataUrl": "v4hdOa6FdZhNMd1o", "isActive": false, "redirectUri": "gMz0F2UBRmMhAbUW", "secret": "mFhdYLWzMuv3zkUY", "ssoUrl": "0n0BAZkwbYkBLyO6"}' \
    > test.out 2>&1
eval_tap $? 149 'UpdateSSOPlatformCredential' test.out

#- 150 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'A0FqfhnaB3YxKNdO' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["TacCcJfIfXshuLUk", "5WdpxjZx5noXPhPU", "TKbonoucNmzwOZOK"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 151 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '56sDkci5rZ8iMlOu' \
    --platformUserId 'ksQJCiRFiZWwJ7Nr' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserByPlatformUserIDV3' test.out

#- 152 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'Tb1XTB9YQzUJ9XlY' \
    --after '74' \
    --before '7' \
    --limit '55' \
    > test.out 2>&1
eval_tap $? 152 'GetAdminUsersByRoleIdV3' test.out

#- 153 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'LWYyS8zdhMeBXH8x' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserByEmailAddressV3' test.out

#- 154 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["HdVfZVDAiU6iJOF7", "JKZFNk2NKy59X8iO", "g2sVBiCoeC5weXJl"]}' \
    > test.out 2>&1
eval_tap $? 154 'AdminBulkUpdateUsersV3' test.out

#- 155 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType '7PeiMH8z8dVej8N2' \
    --body '{"bulkUserId": ["yv6VTnOK7xAvM7tu", "L81lsR7xxSVp3Gd2", "TK0HzYviTgYmx82J"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetBulkUserBanV3' test.out

#- 156 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["VBRLPZ6Iz8tne5db", "guBF6Gsvvdl8jHz9", "x7XZIjU4IK9lOLaZ"]}' \
    > test.out 2>&1
eval_tap $? 156 'AdminListUserIDByUserIDsV3' test.out

#- 157 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["aMphKCqTq3EVheJj", "oEEXBLIxGnNuhoJM", "3WWPvvCiCf33ViEd"]}' \
    > test.out 2>&1
eval_tap $? 157 'AdminBulkGetUsersPlatform' test.out

#- 158 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["qQpoGkUWNizk5UcP", "AGv6c1ESC6hZYTYZ", "bzf5aANNNs5kgSZZ"], "isAdmin": false, "languageTag": "BqabUXOGkkoMUZn1", "namespace": "YXj5zFZeOCOR9NvB", "roles": ["QZSJPOIKrRBrYVzi", "9ui3lvozTt9TsH7A", "0TuU2aL4bPkk11sy"]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminInviteUserV3' test.out

#- 159 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '54' \
    --platformUserId '6GdkDcos5uVJ0BJf' \
    --platformId 'Z0jvA54CSqZFDsO1' \
    > test.out 2>&1
eval_tap $? 159 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 160 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 160 'AdminListUsersV3' test.out

#- 161 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'kYSCdnFKLc0xcTjq' \
    --endDate 'jdcEfU61OJYMnW49' \
    --includeTotal  \
    --limit '35' \
    --offset '99' \
    --platformBy 'Cg3XTc9vQe0dHJfF' \
    --platformId '6KIuvnRCa9JktyBd' \
    --query 'xkZKrEWFw9GYxjii' \
    --roleIds 'OQAD77ci0vfWVZoR' \
    --skipLoginQueue  \
    --startDate 'RMPi57HyKKz5nyI6' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 161 'AdminSearchUserV3' test.out

#- 162 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["ulKNKoXa0dgx1Jgj", "C56pda3YhtQxpCYM", "E6x21pdX2QSPAd9s"]}' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetBulkUserByEmailAddressV3' test.out

#- 163 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xoLnWGP1PafIjLX8' \
    > test.out 2>&1
eval_tap $? 163 'AdminGetUserByUserIdV3' test.out

#- 164 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ce0KbNN7Ycl2JfmQ' \
    --body '{"avatarUrl": "plvGjVQ4aebjfgGu", "country": "472oWJlfglLM4xjf", "dateOfBirth": "kNL4lU6jaGfsD1cf", "displayName": "swmeFpvtDtetoQVF", "languageTag": "L8LNW11vtpaTxi7k", "skipLoginQueue": true, "uniqueDisplayName": "89jRCn48bvkCPfKo", "userName": "fwXOIZZQAJza84lK"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserV3' test.out

#- 165 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KmVOaTS6xBbNrSUA' \
    --activeOnly  \
    --after 'W2ak7ISDrBVg6NuD' \
    --before 'ZvPb1kuUfNfUDe4g' \
    --limit '34' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetUserBanV3' test.out

#- 166 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dCUoExnKfV3869IN' \
    --body '{"ban": "4V1OdhH4GVU7Exlk", "comment": "mc4xYiLjLyZrXr9B", "endDate": "htzn8jAdTn6xBhrc", "reason": "iryLm67rkadH5Y41", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 166 'AdminBanUserV3' test.out

#- 167 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jCPrFa05Xl5TPC5G' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserBanSummaryV3' test.out

#- 168 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'ODS44bmm7jPdKLdd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fdsUqjXVzW1QqxnW' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 168 'AdminUpdateUserBanV3' test.out

#- 169 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tWlKxLpS8fLWoQ5n' \
    --body '{"context": "uJhatQPxR7dvBVC5", "emailAddress": "zgOKLTDmHe8c1eJ9", "languageTag": "sde7Ryt4udIv22M1"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminSendVerificationCodeV3' test.out

#- 170 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8uux9xBomQFPFWy5' \
    --body '{"Code": "cwNPI6aFo0MVwDZC", "ContactType": "IXFNEL3uWVRz3V7Y", "LanguageTag": "bJM3bNLWHAbCZixe", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 170 'AdminVerifyAccountV3' test.out

#- 171 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'cQ6O30lpzcBQMAEc' \
    > test.out 2>&1
eval_tap $? 171 'GetUserVerificationCode' test.out

#- 172 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NcJqrKxnMzSYoc4Z' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetUserDeletionStatusV3' test.out

#- 173 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jiMY4H34B6wVd8ip' \
    --body '{"deletionDate": 4, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 173 'AdminUpdateUserDeletionStatusV3' test.out

#- 174 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KDwQeUWtjCC2UH6j' \
    > test.out 2>&1
eval_tap $? 174 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 175 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zMO3AfmOS5mQNyRP' \
    --body '{"code": "ZFPNP56l1AT6OLKm", "country": "ZhCZxxPPdPwOtEuW", "dateOfBirth": "BSO2jJepUnEEgja2", "displayName": "mIE2kLTnJwc5XmkC", "emailAddress": "uL5W4tKt6G3j9LYd", "password": "G7xVPqBqe9RDQMBS", "uniqueDisplayName": "YAFLqp8PF5hCcouk", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 175 'AdminUpgradeHeadlessAccountV3' test.out

#- 176 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DjjwMv4vrIPRtvhQ' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserInformationV3' test.out

#- 177 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IyLarjaLOKnX51yA' \
    --after '0.4376264765173672' \
    --before '0.9832858158290662' \
    --limit '86' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetUserLoginHistoriesV3' test.out

#- 178 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'S8YLmwtYgWGcA0h4' \
    --body '{"languageTag": "G1LZ1HaX5UBMbsF4", "mfaToken": "4VTsLDRzdq22cbny", "newPassword": "K3ggFDh2kaZP7pnn", "oldPassword": "VfxPwc259HF9ejHa"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminResetPasswordV3' test.out

#- 179 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ILQruAuYyJLYGqMv' \
    --body '{"Permissions": [{"Action": 77, "Resource": "24ouSgkpK70uJmUL", "SchedAction": 42, "SchedCron": "oEogFVGR71rJOBy6", "SchedRange": ["lsj1AKGBjnHmaAu4", "YK87DYAWWcbcbGWm", "KgE8CZ4AELr5lraa"]}, {"Action": 66, "Resource": "v5P5Cj8hgFsqHC9h", "SchedAction": 30, "SchedCron": "JPiMEtgKuiGTYgwW", "SchedRange": ["v5XldL6rOVGcRAn5", "1rVAQSxp4qTB54mK", "A3V9DKlCeZ7mLYsH"]}, {"Action": 29, "Resource": "4r916GPrhn2etVIQ", "SchedAction": 45, "SchedCron": "lJ80YJ41U4ooQ980", "SchedRange": ["ywmg1pWpWit1QC7F", "Ke0fnHUlmU1unGKM", "0tgfeWy47bbwMI4g"]}]}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserPermissionV3' test.out

#- 180 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GmvK9gW596FwBNrF' \
    --body '{"Permissions": [{"Action": 75, "Resource": "t3TAuKBwBcD12ae6", "SchedAction": 36, "SchedCron": "qnsIJctAdxyZVKHA", "SchedRange": ["9DkaSOWgtg8yw8lH", "EbVDwBAqanOlscRI", "Ww82k5K5VTkdubkO"]}, {"Action": 64, "Resource": "DSwwQlnNRZJHBSB4", "SchedAction": 11, "SchedCron": "zZv5kVu4S95mj8YR", "SchedRange": ["vae4f4lhBPbarbWE", "m8bVtZcfVCPdQhim", "9QKUAFTVYelIlGJg"]}, {"Action": 65, "Resource": "wdc8bihhWjfZpfcF", "SchedAction": 56, "SchedCron": "BJ9Sgl7H1sdH2RIJ", "SchedRange": ["z1eI7Q5pu9PutLf6", "IrvZoBGQbO4S3rUR", "GWUzPAE6SdV4D5jf"]}]}' \
    > test.out 2>&1
eval_tap $? 180 'AdminAddUserPermissionsV3' test.out

#- 181 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tRl9rZmtQUvro8TW' \
    --body '[{"Action": 45, "Resource": "FdsJP1G9tyBTfERX"}, {"Action": 6, "Resource": "uMYDUTLBeCidXjuG"}, {"Action": 13, "Resource": "exZBRvxYnEBhXtAV"}]' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserPermissionBulkV3' test.out

#- 182 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '48' \
    --namespace "$AB_NAMESPACE" \
    --resource '0ltsqfiZrthVvyX0' \
    --userId 'OCKDJE3RMUddwSSg' \
    > test.out 2>&1
eval_tap $? 182 'AdminDeleteUserPermissionV3' test.out

#- 183 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xCu8zru1DhGAYOHR' \
    --after '5BWa9VzIkaQEl1iU' \
    --before 'ProNB6hI6IpGcToW' \
    --limit '14' \
    --platformId 'KU2u06Q4veujxtyQ' \
    --targetNamespace 'ENvJrBCqeg67d4RW' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetUserPlatformAccountsV3' test.out

#- 184 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OqO4U0bitNQLzwRo' \
    --status 'WnR0AbkCPY70Fmvv' \
    > test.out 2>&1
eval_tap $? 184 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 185 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'iVIBbcujF8Vk5qb8' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetListJusticePlatformAccounts' test.out

#- 186 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'NhWWwaxyMchkt8l5' \
    --userId 'IPSrwrJl7wYIVw13' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetUserMapping' test.out

#- 187 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'NCo9yXlbQ52FTHTC' \
    --userId 'j6SEAzT7TOpyiuvv' \
    > test.out 2>&1
eval_tap $? 187 'AdminCreateJusticeUser' test.out

#- 188 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'QUm29Iacq4XRLaA6' \
    --skipConflict  \
    --body '{"platformId": "43nTMtXSAyejnny0", "platformUserId": "Ju13b6o5uB2XM6IH"}' \
    > test.out 2>&1
eval_tap $? 188 'AdminLinkPlatformAccount' test.out

#- 189 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'y7EEvHyLmcvrZZOd' \
    --platformId 'we1x8RjU6Bi8JXE5' \
    > test.out 2>&1
eval_tap $? 189 'AdminGetUserLinkHistoriesV3' test.out

#- 190 AdminPlatformUnlinkV3
eval_tap 0 190 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 191 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2sUBBq2SimQQoLbe' \
    --userId '5YOJvxGRxUzrTwag' \
    > test.out 2>&1
eval_tap $? 191 'AdminPlatformUnlinkAllV3' test.out

#- 192 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'H7BMT1IZKTdNFVBQ' \
    --userId '1crBXAupATO8uXsq' \
    --ticket 'VpdiWo8SjDAM0Riw' \
    > test.out 2>&1
eval_tap $? 192 'AdminPlatformLinkV3' test.out

#- 193 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 193 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 194 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8wLYW3n4F3LD1EDw' \
    --userId 'BXw5uBYeQZOzATNS' \
    > test.out 2>&1
eval_tap $? 194 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 195 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'V9E9yyNb7yaLXzAV' \
    --userId 'YymOuhCkZu4htrsf' \
    --platformToken '8eIFSovTGXaMsq8e' \
    > test.out 2>&1
eval_tap $? 195 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 196 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PN1oco2jx8Upe8Sj' \
    --userId 'MvpqM8puggOEdG47' \
    > test.out 2>&1
eval_tap $? 196 'AdminGetUserSinglePlatformAccount' test.out

#- 197 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gD5i2Ni6AnWn3NdE' \
    --body '["PhNHSH7eKDfRcngE", "pTnRUQr3RLOM1vEx", "4gqDY6jwyKRxhkLe"]' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserRolesV3' test.out

#- 198 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5zohg9s9utRQt28b' \
    --body '[{"namespace": "6o3K0COF74tz6aeX", "roleId": "ZOYwbwjMNdxKWlBf"}, {"namespace": "nRyFS0Ed7gTM5AVr", "roleId": "tBQiDTcNnZa6Zuxk"}, {"namespace": "6u6HXXdiC9ZDj4E4", "roleId": "mv12FNXypoOLl13j"}]' \
    > test.out 2>&1
eval_tap $? 198 'AdminSaveUserRoleV3' test.out

#- 199 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '84P0KqirJ4PkMFts' \
    --userId 'nFfz8Ew0X8fBuBSK' \
    > test.out 2>&1
eval_tap $? 199 'AdminAddUserRoleV3' test.out

#- 200 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'LSQ4GvLtz50D3rpB' \
    --userId 'fBovqLwXBuT30EYe' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteUserRoleV3' test.out

#- 201 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rj17xGhaBKoUfiHj' \
    --body '{"enabled": false, "reason": "MRf2VJetWsokvx3B"}' \
    > test.out 2>&1
eval_tap $? 201 'AdminUpdateUserStatusV3' test.out

#- 202 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'HuTEczr9KjQ3ttz8' \
    --body '{"emailAddress": "MTBt1xk9IyssSA8n", "password": "P5PQjpzk2Tb7iYdm"}' \
    > test.out 2>&1
eval_tap $? 202 'AdminTrustlyUpdateUserIdentity' test.out

#- 203 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NZWosrsVBPZ64j0H' \
    > test.out 2>&1
eval_tap $? 203 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 204 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'UONscofwYLQcDvka' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "EIIPoJT83zEGXmVB"}' \
    > test.out 2>&1
eval_tap $? 204 'AdminUpdateClientSecretV3' test.out

#- 205 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'ZLyrH9J7BoysmaOR' \
    > test.out 2>&1
eval_tap $? 205 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 206 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'LkP5hc2Fh04JTsqD' \
    --before 'TynCewqJligLlRxO' \
    --isWildcard  \
    --limit '9' \
    > test.out 2>&1
eval_tap $? 206 'AdminGetRolesV3' test.out

#- 207 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "managers": [{"displayName": "ykICRxF6HtlER2tx", "namespace": "s4qrNARATn6KXOut", "userId": "lYBbLhL8KXx25FZf"}, {"displayName": "QIodVBqQsBpCJBIX", "namespace": "LGYcwWVRK6UKk5oz", "userId": "rXA4HZHNyq9odanh"}, {"displayName": "R1Zrm3thUvV87yfk", "namespace": "ycLSVdleSaAylsmL", "userId": "Ye2phYOgT5kDTyPl"}], "members": [{"displayName": "3dKF7NXEjrJMki8j", "namespace": "vc3P8Gwjg3IOH0SD", "userId": "HgYKqxJiFJdrmj5v"}, {"displayName": "hzgsJwex7wq8ZPlX", "namespace": "NaUNgdY2vfJuje5c", "userId": "PnmGjTvYa5Pqx1K7"}, {"displayName": "qcAoijBPAp6EPb98", "namespace": "8NzxrDKVpULjjiw3", "userId": "NeVG4DJi9DaMrc0W"}], "permissions": [{"action": 64, "resource": "WXT59SRu0YqUxKDc", "schedAction": 100, "schedCron": "4OMIzvTScdbKBsAy", "schedRange": ["JMz4ILNDvhB4Eoes", "9a6XaJeRbzTPwD3j", "xF7vxRUY0ilrNoFT"]}, {"action": 58, "resource": "SgtJd4Z5f8nfaKqd", "schedAction": 61, "schedCron": "FLbZEHxsDxeR6d7r", "schedRange": ["1SQw80JfMpPrSqYy", "pRUnq5o4ETeCUYG9", "ccTt7Wxw8OQ13t3u"]}, {"action": 94, "resource": "zRpdk0HATGylx2JG", "schedAction": 75, "schedCron": "y1jorNsg9ZKYCKoI", "schedRange": ["SyXtHzoWGdYohxMp", "3uOQIybqWfG9BJ6F", "VKlbYHtbPtaxvagS"]}], "roleName": "lpGgVTF6VeDAPOGB"}' \
    > test.out 2>&1
eval_tap $? 207 'AdminCreateRoleV3' test.out

#- 208 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'wweyFfXEOEAEtbag' \
    > test.out 2>&1
eval_tap $? 208 'AdminGetRoleV3' test.out

#- 209 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId '82KgBgyCd5vjkfz3' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteRoleV3' test.out

#- 210 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'eR4DtNp129hzBw3x' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "cCEt0DzmkJq1sml5"}' \
    > test.out 2>&1
eval_tap $? 210 'AdminUpdateRoleV3' test.out

#- 211 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'bYt76BNsi4giR943' \
    > test.out 2>&1
eval_tap $? 211 'AdminGetRoleAdminStatusV3' test.out

#- 212 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId '4WpKKdzxoufCNlFo' \
    > test.out 2>&1
eval_tap $? 212 'AdminUpdateAdminRoleStatusV3' test.out

#- 213 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'OcWQQy4bjmQeEweo' \
    > test.out 2>&1
eval_tap $? 213 'AdminRemoveRoleAdminV3' test.out

#- 214 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'BHTdwAk7ZQnbqY1c' \
    --after 'QwVEtAr5kKKAo9MM' \
    --before '2Cqm84jVi9kIpqgr' \
    --limit '53' \
    > test.out 2>&1
eval_tap $? 214 'AdminGetRoleManagersV3' test.out

#- 215 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'PD9CeDEdCnnL6Kt1' \
    --body '{"managers": [{"displayName": "Bjj3b8QM8Rr45ULq", "namespace": "XQgvwD3PsKDJiWxQ", "userId": "BwaS7rDBf2S54phb"}, {"displayName": "dyGDt47f9GWRlE9h", "namespace": "qz6rjDNo4rhjxUdM", "userId": "M83WekqfWv04vvn9"}, {"displayName": "bk5qr8qs2mqtnGAq", "namespace": "XUjNypF6MMqWpdEJ", "userId": "sPoaIbYz8cK5jlpJ"}]}' \
    > test.out 2>&1
eval_tap $? 215 'AdminAddRoleManagersV3' test.out

#- 216 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'dre5ur6yvWJDdvM7' \
    --body '{"managers": [{"displayName": "T7PX2vamIRZHzsIY", "namespace": "OCUoiCXNjrdQL2jd", "userId": "x1eIba1sB0HsJ06D"}, {"displayName": "zfbzRYt4OVUyumBe", "namespace": "IqdQGZC5kM03HHij", "userId": "sQRj7N8IAjmsonjj"}, {"displayName": "0ZR50BQ1U6aFD3O2", "namespace": "kXQSc58zgZVl4gIF", "userId": "7v3qbZu9M3OxqVAT"}]}' \
    > test.out 2>&1
eval_tap $? 216 'AdminRemoveRoleManagersV3' test.out

#- 217 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId '4H1lRZ9Z1JBrHRzE' \
    --after 'OtIxzPqb6n73m0ji' \
    --before 'aDH86d9rsKgzCsMu' \
    --limit '22' \
    > test.out 2>&1
eval_tap $? 217 'AdminGetRoleMembersV3' test.out

#- 218 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId '7Mluexk87b9Z5BTs' \
    --body '{"members": [{"displayName": "EA3EdmW8saabP4xR", "namespace": "owfNojzPXI2v0prR", "userId": "3OEey0MkZwS6TYwN"}, {"displayName": "N3UYhic03qGEg5fN", "namespace": "zBVrjo3g8CfRwtyl", "userId": "1HeT7VEPgG40QyXz"}, {"displayName": "sOzgck078IghoQBp", "namespace": "2mWAOYksczxBS0OB", "userId": "Ca2vWadLmQtYKmEM"}]}' \
    > test.out 2>&1
eval_tap $? 218 'AdminAddRoleMembersV3' test.out

#- 219 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'zicbuL2S3RiW8dLT' \
    --body '{"members": [{"displayName": "CBfGUdVEdvdQL7sV", "namespace": "wcZ2PofaJoSqtrEO", "userId": "qxH46fRTSZoDdT0f"}, {"displayName": "efo74eg3Nt2c0r4G", "namespace": "qF0NHglOVuNZ9LzN", "userId": "eJnBurh54CWbYb0P"}, {"displayName": "ebyt8b4DGscjwriz", "namespace": "sFUgYwbaLvqvQ2Nb", "userId": "mDITuymTBjn3d2sF"}]}' \
    > test.out 2>&1
eval_tap $? 219 'AdminRemoveRoleMembersV3' test.out

#- 220 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'zMS3QaVjZF7Ax611' \
    --body '{"permissions": [{"action": 31, "resource": "Kg9U8vrQJXQxoIbV", "schedAction": 16, "schedCron": "47f1UreUpxEkXIbE", "schedRange": ["1ETzRJZKMavu4Ul2", "IaieEbPSE7TGkeHs", "YsW9oGBN1pYMBwbP"]}, {"action": 36, "resource": "TlMlUvFEiGprcNSQ", "schedAction": 1, "schedCron": "kEeXBZ6FVrBzyhyh", "schedRange": ["oS6a9oe0JaXFpff2", "8uYbe4Cf2HEHvVev", "hISjbtBJUK5fE3Ou"]}, {"action": 10, "resource": "G5N066FXb88SbLOa", "schedAction": 2, "schedCron": "1DiSFsm0XXQJWszv", "schedRange": ["TQEuALzDNp1SZ58a", "DllwzTRHak1MXxj7", "Esrg7900nml5Bids"]}]}' \
    > test.out 2>&1
eval_tap $? 220 'AdminUpdateRolePermissionsV3' test.out

#- 221 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'K9dCEzhVnOv0PQbV' \
    --body '{"permissions": [{"action": 71, "resource": "H89QNmI17UDb19R6", "schedAction": 69, "schedCron": "Fyv2SMjbEr50qGdC", "schedRange": ["ZIc6EFqBKxbS7Q2O", "gRucL1jwRXzfjDZZ", "BmOau6syme06c6SK"]}, {"action": 78, "resource": "4tOcbnuCqf0lm6WB", "schedAction": 21, "schedCron": "HaGr5kdazlypvt6l", "schedRange": ["SLfU7HByGXPMqxj4", "hBgVY3YAxZLKbcOd", "yjqf6Q4oiwoJcaRM"]}, {"action": 62, "resource": "rGNT2VHTKuIT5Fww", "schedAction": 69, "schedCron": "R2NVyn4PRqf3eRbZ", "schedRange": ["qBAoKGcVCdMiSNV4", "qBrt1kcLmRv6EJtl", "5xWnsb8oWq94RImN"]}]}' \
    > test.out 2>&1
eval_tap $? 221 'AdminAddRolePermissionsV3' test.out

#- 222 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'WVIJnhhwFDV1Vita' \
    --body '["omvWTzdsW4N70wYS", "4Kj7Yi2VvoQNW8Yc", "481dYdvGxJAMDRA1"]' \
    > test.out 2>&1
eval_tap $? 222 'AdminDeleteRolePermissionsV3' test.out

#- 223 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '76' \
    --resource 'USuC3Bajy3BcEMCt' \
    --roleId 'Qs2FcEcvVAyId6Cp' \
    > test.out 2>&1
eval_tap $? 223 'AdminDeleteRolePermissionV3' test.out

#- 224 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 224 'AdminGetMyUserV3' test.out

#- 225 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId '85HVDsZBQgOnXuXs' \
    --extendExp  \
    --redirectUri 'GThYZrmm0wrFMnPp' \
    --password 'WgrQD4hEk0OLjYsn' \
    --requestId 'ignE7KcMF7fuDbzR' \
    --userName 'RYMNXWUsp1tOibJY' \
    > test.out 2>&1
eval_tap $? 225 'UserAuthenticationV3' test.out

#- 226 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '9aL9ie6vvMbiNURr' \
    --linkingToken 'lm88QlKyuoya4Jga' \
    --password 'kZyUV7t73VnSFbux' \
    --username 'd4KYZ0jk0UZdhtnK' \
    > test.out 2>&1
eval_tap $? 226 'AuthenticationWithPlatformLinkV3' test.out

#- 227 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'u9oTc8pVkiyGsj5J' \
    --extendExp  \
    --linkingToken 'dXzRxfNEjUMTs8WI' \
    > test.out 2>&1
eval_tap $? 227 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 228 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'ObJBTsvsw76uISRX' \
    > test.out 2>&1
eval_tap $? 228 'RequestOneTimeLinkingCodeV3' test.out

#- 229 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode '0bKVoWtoUW1P7ocu' \
    > test.out 2>&1
eval_tap $? 229 'ValidateOneTimeLinkingCodeV3' test.out

#- 230 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'BAldDSUS7Haa6unq' \
    --isTransient  \
    --clientId '1yQOSRvyiLBRVtID' \
    --oneTimeLinkCode 'i2piIQFVmzMidw70' \
    > test.out 2>&1
eval_tap $? 230 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 231 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 231 'GetCountryLocationV3' test.out

#- 232 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 232 'Logout' test.out

#- 233 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'KSahpYZdKZRyR9AX' \
    --codeChallengeMethod 'S256' \
    --clientId 'jxvNZhM84DiZk6yS' \
    > test.out 2>&1
eval_tap $? 233 'RequestTokenExchangeCodeV3' test.out

#- 234 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rB9SVFctW7YS0OkL' \
    --userId '78XeEAtALFI3v8yh' \
    --platformUserId 'a4pd5A7MYcpBD6lK' \
    > test.out 2>&1
eval_tap $? 234 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 235 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nb8RxvN2u5J7baOe' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 235 'RevokeUserV3' test.out

#- 236 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'LH19fqBwNbNe1ffY' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'tIvQaKyevWYtZjK6' \
    --redirectUri 'J29v8MpBSpo3AKRm' \
    --scope 'nJkzJHAckUyBksYQ' \
    --state 'fDm0RNFwiz70tRVL' \
    --targetAuthPage 'MlHi8i9gOVqajUWr' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'gEsWDtaKzn8dZwnn' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 236 'AuthorizeV3' test.out

#- 237 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'a83ECh1gqPeS193T' \
    > test.out 2>&1
eval_tap $? 237 'TokenIntrospectionV3' test.out

#- 238 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 238 'GetJWKSV3' test.out

#- 239 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'NNzot3sVli3GN2XT' \
    --factor 'rFibRAhzzEWzWlTY' \
    --mfaToken '70qdgJRvpZrSpWX3' \
    > test.out 2>&1
eval_tap $? 239 'SendMFAAuthenticationCode' test.out

#- 240 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'KEe2BjV00ReCXFff' \
    --mfaToken 'jJJxlgjzIhpgOoIO' \
    > test.out 2>&1
eval_tap $? 240 'Change2faMethod' test.out

#- 241 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'D74V21HWDAfvXwdx' \
    --factor 'byp4HAPbBbNPStVB' \
    --mfaToken 'UpKgOssFkz0F36pi' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 241 'Verify2faCode' test.out

#- 242 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DYXeHZ7FHls3nyvc' \
    --userId 'onqbHQqKLQKe3xmj' \
    > test.out 2>&1
eval_tap $? 242 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 243 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId '6s0GqsWncp5Lrqbi' \
    --clientId 'Kudv9z75SzoCV8ZM' \
    --redirectUri 'i2o1nR482D6gNClk' \
    --requestId '9c87hosaPFC5zBW3' \
    > test.out 2>&1
eval_tap $? 243 'AuthCodeRequestV3' test.out

#- 244 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'ZgVZCj9ObVGT0Scw' \
    --additionalData 'l4kNmCi15XTJTgCN' \
    --clientId 'NH7RtG5Xmo9Q0Wb0' \
    --createHeadless  \
    --deviceId '7N17fkxZSc6VbE0A' \
    --macAddress 'GcekjMNHuPXtz8tX' \
    --platformToken 'xrmzafMUguyDoN91' \
    --serviceLabel '0.3246677641638931' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 244 'PlatformTokenGrantV3' test.out

#- 245 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 245 'GetRevocationListV3' test.out

#- 246 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'c28HoSpGt1g0GGbT' \
    > test.out 2>&1
eval_tap $? 246 'TokenRevocationV3' test.out

#- 247 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform '4Hf2PPKOldkbgX9C' \
    --simultaneousTicket 'WJKwXXSbv5eg9q86' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'aDFjjx6uZerWbtwT' \
    > test.out 2>&1
eval_tap $? 247 'SimultaneousLoginV3' test.out

#- 248 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'X9gNRByjbE8lOLAf' \
    --clientId 'TXKLzbrddqcKLa7L' \
    --clientSecret 'evxNHOSEhQRZIp69' \
    --code '3lRwtc43atCuCFxb' \
    --codeVerifier 'fbz4aQERziPL4dHh' \
    --extendNamespace 'OqG5KDdUvk0LEi26' \
    --extendExp  \
    --password 'Ls7mjRxNmvvNtjJN' \
    --redirectUri 'QepUTGhwlY4lPzls' \
    --refreshToken 'CR5rVsyfcH7WjP7H' \
    --username 'uGz3b5WAEvdRF9bq' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 248 'TokenGrantV3' test.out

#- 249 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'guhh3bvadRthdbVA' \
    > test.out 2>&1
eval_tap $? 249 'VerifyTokenV3' test.out

#- 250 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'pebRA09rW8i8krFW' \
    --code 'Jhe03coRFok5d3Ay' \
    --error 'GrZO8GuoXNSoVEBG' \
    --openidAssocHandle '7VbBPUWipz9C05Ya' \
    --openidClaimedId 'bFX4FCK5ucTFsAFz' \
    --openidIdentity 'aO3yJpA3KMxBlrRy' \
    --openidMode 'tER1qdTelFAadM9y' \
    --openidNs '66Drf4SSGGt3MiBK' \
    --openidOpEndpoint 'ohow3kKoaP1K4CDu' \
    --openidResponseNonce 'H1mMIfOCDyVAHrHn' \
    --openidReturnTo 'cR5dShqiBUI9esSs' \
    --openidSig 'XegSEhrPpK2q8kxR' \
    --openidSigned '4BuEksS2A9VOA8H9' \
    --state 'VeHv0L2Acm960EYQ' \
    > test.out 2>&1
eval_tap $? 250 'PlatformAuthenticationV3' test.out

#- 251 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'EuGJVl8xs1WId9Wl' \
    --platformToken 'alqshF9Rh2o7GCQG' \
    > test.out 2>&1
eval_tap $? 251 'PlatformTokenRefreshV3' test.out

#- 252 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'PCxwEdkyuT3MgzRe' \
    > test.out 2>&1
eval_tap $? 252 'PublicGetInputValidations' test.out

#- 253 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'Rq0112ISArROIodc' \
    > test.out 2>&1
eval_tap $? 253 'PublicGetInputValidationByField' test.out

#- 254 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'mM6v2AEozWWaYvBL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 254 'PublicGetCountryAgeRestrictionV3' test.out

#- 255 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'E46bpuJip8JyxJ39' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 255 'PublicGetConfigValueV3' test.out

#- 256 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 256 'PublicGetCountryListV3' test.out

#- 257 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 257 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 258 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'vrtuWWrqTZbSqBSK' \
    > test.out 2>&1
eval_tap $? 258 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 259 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 259 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 260 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'p8AmgwhYzk33J34f' \
    --platformUserId 'iTxK63OHpnUCGBVf' \
    > test.out 2>&1
eval_tap $? 260 'PublicGetUserByPlatformUserIDV3' test.out

#- 261 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'pctNFUsUQ6ZXQcb2' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetAsyncStatus' test.out

#- 262 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'o1J5euLAbBgejqc0' \
    --limit '0' \
    --offset '73' \
    --platformBy 'pxqZ209BySn8aUaG' \
    --platformId 'lAyvIslt7N1qcxKs' \
    --query '4nlf1MfqUZXkjHvc' \
    > test.out 2>&1
eval_tap $? 262 'PublicSearchUserV3' test.out

#- 263 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "UOTlxNf09pefgFIi", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "ssShBKsQjXvfQgQD", "policyId": "t6ce8NDMErA82FrR", "policyVersionId": "1GSogkewIzTOqKkc"}, {"isAccepted": false, "localizedPolicyVersionId": "6kPmswm5TCAU1cKA", "policyId": "pdJDnE73GLmSZns5", "policyVersionId": "owBhoUg4LsGP6KLP"}, {"isAccepted": false, "localizedPolicyVersionId": "gHEP5l94s7CbIJ7e", "policyId": "HnVWOboMkyB7FTex", "policyVersionId": "sOZ0b2p3b63KrcwI"}], "authType": "cXMhGy83Xit6boOL", "code": "GCcg16DqwdQPQ9Hk", "country": "SSV8e1MgTTLS2Fga", "dateOfBirth": "rY903INGIyEfRBEj", "displayName": "7qms9AGQExPhgr9g", "emailAddress": "GfC0GjvpgJfuBs1V", "password": "pqn47GVghTH2wToO", "reachMinimumAge": false, "uniqueDisplayName": "bNs97KvKyj3MqS7D"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicCreateUserV3' test.out

#- 264 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'cmtfh50eObbrmgjh' \
    --query 'WK0x0ZidAJ1CU1eD' \
    > test.out 2>&1
eval_tap $? 264 'CheckUserAvailability' test.out

#- 265 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["1La16Bw3JbUnUDh5", "yGjjv4Mwrv2vancm", "R6Z7rb21A2E9pX0B"]}' \
    > test.out 2>&1
eval_tap $? 265 'PublicBulkGetUsers' test.out

#- 266 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "WCMqPsRk5htdM5T3", "languageTag": "fDSrSHrkoqv2mM6s"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicSendRegistrationCode' test.out

#- 267 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "oMaTvQq2a9YdFNtR", "emailAddress": "VSO0js0hG9xmSnzd"}' \
    > test.out 2>&1
eval_tap $? 267 'PublicVerifyRegistrationCode' test.out

#- 268 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "7zgUxAogcnGkXk17", "languageTag": "QPkJHRhmLKQuQVFS"}' \
    > test.out 2>&1
eval_tap $? 268 'PublicForgotPasswordV3' test.out

#- 269 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "KiXl8G2uf6E8EajX", "uniqueDisplayName": "LSAS8MKMaxQ1QyJC", "username": "pKedhuzI7G9NCKKX"}' \
    > test.out 2>&1
eval_tap $? 269 'PublicValidateUserInput' test.out

#- 270 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'u1bqI2M5PmXfKnQ7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 270 'GetAdminInvitationV3' test.out

#- 271 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'BYGjCUDMOrbmoRvW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "nfmGFy0eUoOBd90h", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "EDqSTOfoNewWjwMW", "policyId": "DKEt6JhbJ0fwTDaq", "policyVersionId": "6b5RpMwhWPtndriX"}, {"isAccepted": true, "localizedPolicyVersionId": "9loOxpmEuwDVc12r", "policyId": "0DVUGgGHkapTCafF", "policyVersionId": "MdvYiCBuzUUwyI6V"}, {"isAccepted": true, "localizedPolicyVersionId": "T5zbreMc9fBoU3RH", "policyId": "NDFjLKFrepy56eW1", "policyVersionId": "kmb15QeIQF51c4Mq"}], "authType": "JzDSvELgBe6dboSd", "code": "hkBzAzPkt1efGJeJ", "country": "axyHYutgXucx85vH", "dateOfBirth": "A009FAb21jxeWXk8", "displayName": "0y9uxgVLGgK8aVSC", "emailAddress": "N6oCETQ8gIDRdD2w", "password": "wMXwKVXGPhEJsc7r", "reachMinimumAge": true, "uniqueDisplayName": "pxaPHc9r8eToFmkH"}' \
    > test.out 2>&1
eval_tap $? 271 'CreateUserFromInvitationV3' test.out

#- 272 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "J6BPOKFLxIwKssw6", "country": "47YwDudnGRufOUGf", "dateOfBirth": "MjTU226l07jPlcYa", "displayName": "qYM7YfBmhjI9Y28q", "languageTag": "VceS9UX48dKPCFUI", "uniqueDisplayName": "eyYEymNXzNX6TGh4", "userName": "UdEweeBsJEvBbAvC"}' \
    > test.out 2>&1
eval_tap $? 272 'UpdateUserV3' test.out

#- 273 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "mlh6Z1oz9BaixUUv", "country": "mzbajE2gjooiDnc1", "dateOfBirth": "NUb51lEgUwQ9tkWa", "displayName": "MOH47CAT7cBP0918", "languageTag": "JaEBQBP766LUnBBR", "uniqueDisplayName": "84iAO7sBQt6YJ2tW", "userName": "wF7RnP1oK3c4RVfj"}' \
    > test.out 2>&1
eval_tap $? 273 'PublicPartialUpdateUserV3' test.out

#- 274 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "B0zi3XrYZUiN24ol", "emailAddress": "1qqbalgizL97ycJV", "languageTag": "5YqE2myQzl7X9fHr"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicSendVerificationCodeV3' test.out

#- 275 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "6WvBxmBvNj3ktaDf", "contactType": "9B22HGgxakPt7IYz", "languageTag": "aZUTmvsEzLPnnGsn", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 275 'PublicUserVerificationV3' test.out

#- 276 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "H7yIS7b5TSDRIoMg", "country": "7Dc5APzfzXDELJFa", "dateOfBirth": "IaEMW5bhJyL72WDy", "displayName": "hBsCCbnfihnXKxGx", "emailAddress": "aupnTTq9ihZkvFKf", "password": "SHQh8I9xk3sFl0cb", "uniqueDisplayName": "uCRM69XKkLwioRaK", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 276 'PublicUpgradeHeadlessAccountV3' test.out

#- 277 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "KXDIjYC4df9qswSl", "password": "pCI8DhjlxUyrs3OS"}' \
    > test.out 2>&1
eval_tap $? 277 'PublicVerifyHeadlessAccountV3' test.out

#- 278 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "esE5p0DwUj2HKUvP", "mfaToken": "YUcQBxMSdOOsn2Nd", "newPassword": "8Jpa19GJDK46Eehx", "oldPassword": "7xasqMY9aulsL6NO"}' \
    > test.out 2>&1
eval_tap $? 278 'PublicUpdatePasswordV3' test.out

#- 279 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'V5agpS6A5mkufBpW' \
    > test.out 2>&1
eval_tap $? 279 'PublicCreateJusticeUser' test.out

#- 280 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VxIK9D2bTcgaKocc' \
    --redirectUri 'aSwWcZmzCWGI1cIQ' \
    --ticket 'cPWAShIhieSKUf3z' \
    > test.out 2>&1
eval_tap $? 280 'PublicPlatformLinkV3' test.out

#- 281 PublicPlatformUnlinkV3
eval_tap 0 281 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 282 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KbyQk2vQTYX1xsth' \
    > test.out 2>&1
eval_tap $? 282 'PublicPlatformUnlinkAllV3' test.out

#- 283 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '28NZZgsXycuQNGID' \
    --ticket 'eHlf6IcX1K9JrK6O' \
    > test.out 2>&1
eval_tap $? 283 'PublicForcePlatformLinkV3' test.out

#- 284 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'r2xx7rLwrPoWiywn' \
    --clientId 'xuDLLuIaSxoloIH1' \
    --redirectUri 'gBCWVFrvls0ZwosK' \
    > test.out 2>&1
eval_tap $? 284 'PublicWebLinkPlatform' test.out

#- 285 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hDlLfTKxpVOXvGSr' \
    --code 'dkqddI3ezqu6FB0s' \
    --state 'L2xt6fX9j7rhZCAl' \
    > test.out 2>&1
eval_tap $? 285 'PublicWebLinkPlatformEstablish' test.out

#- 286 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DlVKBsLZiBRXszE7' \
    --code 'CL1cQCSoqHvH7g63' \
    --state 'cOx6yrIw37pKOLrF' \
    > test.out 2>&1
eval_tap $? 286 'PublicProcessWebLinkPlatformV3' test.out

#- 287 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "5i3gr3Cc4M2O7NrT", "userIds": ["QO7KLdZDGwqx7T3l", "1ut2oyolliYsTJUm", "pscwLcUml3KuoMKh"]}' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetUsersPlatformInfosV3' test.out

#- 288 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "7tprnacA34xmIOjF", "emailAddress": "LgKR4LjEWhOScvtQ", "languageTag": "92iD02YMvEUNfoL7", "newPassword": "JCcMo7GxxXdbYCRe"}' \
    > test.out 2>&1
eval_tap $? 288 'ResetPasswordV3' test.out

#- 289 PublicGetUserByUserIdV3
eval_tap 0 289 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 290 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xPekTsQxMTfaSot7' \
    --activeOnly  \
    --after 'aohFYy4VxwHIJ9gz' \
    --before 'xqAw4vBGQAeh0VTi' \
    --limit '94' \
    > test.out 2>&1
eval_tap $? 290 'PublicGetUserBanHistoryV3' test.out

#- 291 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 's2SQUdKr6vgqkjyc' \
    > test.out 2>&1
eval_tap $? 291 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 292 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qclNlBORlC8Zkjsx' \
    > test.out 2>&1
eval_tap $? 292 'PublicGetUserInformationV3' test.out

#- 293 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YtgxplHTPLzynjFZ' \
    --after '0.10407254730623905' \
    --before '0.5140324589558819' \
    --limit '58' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetUserLoginHistoriesV3' test.out

#- 294 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'erw7UsyHq4bBb0n1' \
    --after 'JhPUS8BRPGV9n769' \
    --before 'zLJdKMexeJc7NvgT' \
    --limit '91' \
    --platformId 'uybwTQFYEJjIYwqf' \
    > test.out 2>&1
eval_tap $? 294 'PublicGetUserPlatformAccountsV3' test.out

#- 295 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SRy8GgVk77fd1GS5' \
    > test.out 2>&1
eval_tap $? 295 'PublicListJusticePlatformAccountsV3' test.out

#- 296 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'YkyhAiAItnWUmD22' \
    --body '{"platformId": "5fp1egsx3ErheNwq", "platformUserId": "d5priclNNqLyrlzr"}' \
    > test.out 2>&1
eval_tap $? 296 'PublicLinkPlatformAccount' test.out

#- 297 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'J4QHbfnAdtkujxHf' \
    --body '{"chosenNamespaces": ["f7n1yaNCcjgFhS0U", "RBhl0L5FCbOn46W2", "B2uPQLrt2t6bVpCg"], "requestId": "KvPXSDufmKh783cV"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicForceLinkPlatformWithProgression' test.out

#- 298 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '54JsVBRB0rY0xfWd' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetPublisherUserV3' test.out

#- 299 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dACyHSmo4KX9TPO3' \
    --password 'K1k5ZM8btmGsgXNX' \
    > test.out 2>&1
eval_tap $? 299 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 300 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'bpqxh76Af5JSwjw2' \
    --before 'fE2g6jXV7oai2oDm' \
    --isWildcard  \
    --limit '2' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetRolesV3' test.out

#- 301 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'FaP0HJ98tE4UyoQg' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetRoleV3' test.out

#- 302 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 302 'PublicGetMyUserV3' test.out

#- 303 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode '0b0sGOkzxVt15LKm' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 304 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["kQ7YBhsOuJ0ypkkt", "2G4eFh2YNsdoxpLT", "BM9Q8t829Ido1Jyv"], "oneTimeLinkCode": "eSRiBq23kyH9jQbH"}' \
    > test.out 2>&1
eval_tap $? 304 'LinkHeadlessAccountToMyAccountV3' test.out

#- 305 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "WkcVk0X28GS54vl7"}' \
    > test.out 2>&1
eval_tap $? 305 'PublicSendVerificationLinkV3' test.out

#- 306 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'gIKBc7OYTylFRAJK' \
    > test.out 2>&1
eval_tap $? 306 'PublicVerifyUserByLinkV3' test.out

#- 307 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'ySnC0cfPl3Z2zSBb' \
    --code 's4PAV72u8AxE2IQe' \
    --error 'oxYV4UcYzswAGpXq' \
    --state 'QxctuVaqPJGAHEZm' \
    > test.out 2>&1
eval_tap $? 307 'PlatformAuthenticateSAMLV3Handler' test.out

#- 308 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'uQrZ8GaQ4OZ2nDod' \
    --payload 'm4TNs8mAj6IKSYFd' \
    > test.out 2>&1
eval_tap $? 308 'LoginSSOClient' test.out

#- 309 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'JwgZsRPOzwuDSdGl' \
    > test.out 2>&1
eval_tap $? 309 'LogoutSSOClient' test.out

#- 310 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData '1A2vaNeDiSqTfmAV' \
    --code 'g50kOdJagEmTuaxl' \
    > test.out 2>&1
eval_tap $? 310 'RequestTargetTokenResponseV3' test.out

#- 311 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '48' \
    --namespace "$AB_NAMESPACE" \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 311 'AdminListInvitationHistoriesV4' test.out

#- 312 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gywkbdOsyxX1tfW4' \
    > test.out 2>&1
eval_tap $? 312 'AdminGetDevicesByUserV4' test.out

#- 313 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType '88oYUT4jyCVJ0V8o' \
    --endDate 'bTlGVThz4bm41oIc' \
    --limit '98' \
    --offset '10' \
    --startDate '33yjPxibDjfF7Jkj' \
    > test.out 2>&1
eval_tap $? 313 'AdminGetBannedDevicesV4' test.out

#- 314 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CVpZKMxkFkBtXMU6' \
    > test.out 2>&1
eval_tap $? 314 'AdminGetUserDeviceBansV4' test.out

#- 315 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "KRIm5xBoIi99ctgF", "deviceId": "Xasxp5h780ktjQw2", "deviceType": "yXzaQWaF2PqUfbpM", "enabled": false, "endDate": "161TFjROYJm75VIu", "ext": {"COCkt2W1DfI8QtgO": {}, "Dk9K6DcMnyCPn1Fy": {}, "lWdaNV1VaZTkbbuW": {}}, "reason": "iiA4UTDgS2SVEo5M"}' \
    > test.out 2>&1
eval_tap $? 315 'AdminBanDeviceV4' test.out

#- 316 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId '80LLbku9GYH4ijqO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 316 'AdminGetDeviceBanV4' test.out

#- 317 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'VM50tCqkZfsSxAbD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 317 'AdminUpdateDeviceBanV4' test.out

#- 318 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate '7sHCLup8pmEosOXg' \
    --startDate 'lQwwdeLVpmXqRwVj' \
    --deviceType 'c3W2ANmE3VVsQ1fm' \
    > test.out 2>&1
eval_tap $? 318 'AdminGenerateReportV4' test.out

#- 319 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 319 'AdminGetDeviceTypesV4' test.out

#- 320 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '9EUdiaRjuLsKZoqn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 320 'AdminGetDeviceBansV4' test.out

#- 321 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'pKwhpZVdw5UMa8ym' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 321 'AdminDecryptDeviceV4' test.out

#- 322 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'xtEFLwELCY2vIddl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 322 'AdminUnbanDeviceV4' test.out

#- 323 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'xnA1VynioJcAPwVH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 323 'AdminGetUsersByDeviceV4' test.out

#- 324 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 324 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 325 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 325 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 326 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 66}' \
    > test.out 2>&1
eval_tap $? 326 'AdminCreateTestUsersV4' test.out

#- 327 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "QixPKVSmWa8TGko1", "policyId": "6XTqHc0cM7ixq8Tj", "policyVersionId": "nxp5Cl8ggaEmCcuK"}, {"isAccepted": true, "localizedPolicyVersionId": "hHviBEWpbusO6EyV", "policyId": "qstpgZpbz77y88rU", "policyVersionId": "Fum2ZcA8iKcF0bkf"}, {"isAccepted": false, "localizedPolicyVersionId": "G6ZKQClGc1636nbf", "policyId": "M3J9G40Y62bCo941", "policyVersionId": "ALznQuHVskfCjUK8"}], "authType": "EMAILPASSWD", "code": "BxE15JYj4IqWK09l", "country": "4wkrzahXR1sDEDVK", "dateOfBirth": "DINE3HjCiVR1dQ8k", "displayName": "uhb4pUwnGptHUplx", "emailAddress": "zaDa9PDwhu31d8eO", "password": "dtrfq6ECDD6OGkuL", "passwordMD5Sum": "s9gNpNon6DKW9A6A", "reachMinimumAge": false, "uniqueDisplayName": "6d3nuUZ41mSeS9Sn", "username": "GqhJOvykBcDpzD9z"}' \
    > test.out 2>&1
eval_tap $? 327 'AdminCreateUserV4' test.out

#- 328 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["iNBE0HRsE0GHDOFj", "rfqJcyxT2a7fCFAU", "zLELiM573TdtWjfV"]}' \
    > test.out 2>&1
eval_tap $? 328 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 329 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["ciuLnLsBKGsALPuC", "OyphUUAV95708zaP", "0wpZgQEvFzox9wHo"]}' \
    > test.out 2>&1
eval_tap $? 329 'AdminBulkCheckValidUserIDV4' test.out

#- 330 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cX3DRWobEoGr8W97' \
    --body '{"avatarUrl": "KBedcr6PM51z7i0w", "country": "Q9egK2t46EG8I2lT", "dateOfBirth": "viKbOgVuN3nhkn6Q", "displayName": "IesNoYqvVsakylHi", "languageTag": "kKkpOjqwgKvfXXs8", "skipLoginQueue": true, "uniqueDisplayName": "2DLLUyBt5hDs45si", "userName": "G30Lv9iGa5mkZjnR"}' \
    > test.out 2>&1
eval_tap $? 330 'AdminUpdateUserV4' test.out

#- 331 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XVcg6AByNpBo2JYk' \
    --body '{"code": "wLdmR97u9MVUii4K", "emailAddress": "pYcb1AUsESaBOTHn"}' \
    > test.out 2>&1
eval_tap $? 331 'AdminUpdateUserEmailAddressV4' test.out

#- 332 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bX9tC9PQlFAGbMtE' \
    > test.out 2>&1
eval_tap $? 332 'AdminDisableUserMFAV4' test.out

#- 333 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ybfcAl0mnsAkRT2k' \
    > test.out 2>&1
eval_tap $? 333 'AdminListUserRolesV4' test.out

#- 334 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '0AzdgIunRkTxsGdr' \
    --body '{"assignedNamespaces": ["pNELM8Lfkut0wnT2", "4wh59RGSbBMh7jps", "zuVk6iPdJ2boQqCC"], "roleId": "yJfThvCJieqRSGN8"}' \
    > test.out 2>&1
eval_tap $? 334 'AdminUpdateUserRoleV4' test.out

#- 335 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mm74HlSZzp4aEW4G' \
    --body '{"assignedNamespaces": ["kHG5OIVuGv47XJpk", "MiopQrVL3ZZTVxqa", "9XM2gY14iWk12Jff"], "roleId": "k8dwKNPUOHNZxML3"}' \
    > test.out 2>&1
eval_tap $? 335 'AdminAddUserRoleV4' test.out

#- 336 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yoBM9qxd6PWz7sVn' \
    --body '{"assignedNamespaces": ["Mxge2inL8fBFP1AB", "aIKrEt8d3o7cTS9O", "IIMErnNTLXHrsOFs"], "roleId": "bhRow4iaYKy0IjsD"}' \
    > test.out 2>&1
eval_tap $? 336 'AdminRemoveUserRoleV4' test.out

#- 337 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '14' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 337 'AdminGetRolesV4' test.out

#- 338 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "7DN2lDvdh7okHl1w"}' \
    > test.out 2>&1
eval_tap $? 338 'AdminCreateRoleV4' test.out

#- 339 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'Mht2Izq7TCUJhDsD' \
    > test.out 2>&1
eval_tap $? 339 'AdminGetRoleV4' test.out

#- 340 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'efAS09VyQB1vR1mx' \
    > test.out 2>&1
eval_tap $? 340 'AdminDeleteRoleV4' test.out

#- 341 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId '6K17GL1CrO4ZuoGZ' \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "Tzm8oMSPIHPtqzIW"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminUpdateRoleV4' test.out

#- 342 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'Izg8pbjnt1iBV8Dp' \
    --body '{"permissions": [{"action": 2, "resource": "QB96ndlO6iPGC9Rh", "schedAction": 52, "schedCron": "qilty9NVlgxUmnfd", "schedRange": ["OAmu1dX1NqD20RUv", "vYeJZw6QZFN7wFCn", "qpvNesGiVnt9p2to"]}, {"action": 2, "resource": "Yja1soDE1K0SvGrM", "schedAction": 35, "schedCron": "wPmPXC2LfL2m5rP2", "schedRange": ["A20t6foPPH94SUin", "Y5diUlqgvY7dPPya", "hppgxJhk4EdTZ000"]}, {"action": 36, "resource": "D7ZZx1iefATWcDSq", "schedAction": 67, "schedCron": "P0k9L5dREQbCqfh0", "schedRange": ["gpABFBER6WNcDOsR", "zBkf9A6HjCnFRdSi", "hcvszzQLZBktk0si"]}]}' \
    > test.out 2>&1
eval_tap $? 342 'AdminUpdateRolePermissionsV4' test.out

#- 343 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'Mup01kyaFwwD7wec' \
    --body '{"permissions": [{"action": 42, "resource": "YvXYMIyaEMEqOpwe", "schedAction": 39, "schedCron": "4suaGIzttTncVBf5", "schedRange": ["g3oeuHiNyLkfPQPm", "jUkvSs5YmIejozmG", "5HlrIfMAvvpkAHRJ"]}, {"action": 68, "resource": "LUC6HSMQ32UznXNd", "schedAction": 71, "schedCron": "ve29lqqtcLJW9eTJ", "schedRange": ["vKNDFrx6LabyDnqX", "jXKPIcxh0x7T6RQG", "nnW4ugGX6mKBbgTD"]}, {"action": 12, "resource": "xL07ZzzIs3Jke34Z", "schedAction": 55, "schedCron": "3xV3URIRVDYBd6hM", "schedRange": ["B0l7sg7IfMH5Tu1k", "y1ZYvyeHmfoFkUDP", "864shbnQ3bVvuvps"]}]}' \
    > test.out 2>&1
eval_tap $? 343 'AdminAddRolePermissionsV4' test.out

#- 344 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'DJXPCWkX4Kpi8CJ8' \
    --body '["8aMPGFFAQZbfbmVT", "EbiRq5Juikmpat75", "rVbN9ZBtzJ33tCwv"]' \
    > test.out 2>&1
eval_tap $? 344 'AdminDeleteRolePermissionsV4' test.out

#- 345 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId '8H1f451FVZ630HNB' \
    --after 'YZSrz7pMjESLLMPK' \
    --before 'DXLki6Oz5Bygt8Q0' \
    --limit '89' \
    > test.out 2>&1
eval_tap $? 345 'AdminListAssignedUsersV4' test.out

#- 346 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'JUdwEBRrHAWUFqTo' \
    --body '{"assignedNamespaces": ["oGGnPEgY0t7QQWl4", "2byOwXgKyPhXmcys", "ae8HpWH4xiz3fWth"], "namespace": "JSu2pUIIuPLFAtcW", "userId": "hjAP57QbWvSSp71z"}' \
    > test.out 2>&1
eval_tap $? 346 'AdminAssignUserToRoleV4' test.out

#- 347 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'EPPfmAQiqRRC2caq' \
    --body '{"namespace": "uMRtQOILcaDqUITB", "userId": "HQR5ISNoFR3GUxdM"}' \
    > test.out 2>&1
eval_tap $? 347 'AdminRevokeUserFromRoleV4' test.out

#- 348 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["uvmL0UBfwzaaeP3W", "d0Wrb8s3GW0CY0vA", "fbq8xoCurq4lpHXr"], "emailAddresses": ["bVBh60NUA2aKQwnX", "rmi6ya8u4sQPvaf1", "AcweR7tJW3MLMob1"], "isAdmin": false, "isNewStudio": false, "languageTag": "UnIzIpUM8KK1kGFN", "namespace": "0NUNGKxdlAUDFQuG", "roleId": "PzAuT7M6OBrNwioK"}' \
    > test.out 2>&1
eval_tap $? 348 'AdminInviteUserNewV4' test.out

#- 349 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "nXPVZaDcXsV1TnsZ", "country": "ioDiBgprzahPB0FK", "dateOfBirth": "Ma0YeyNBQWUHDBnB", "displayName": "eePkqg6Zt1Lr5BlO", "languageTag": "8K6LH4dSaa8XYHug", "skipLoginQueue": false, "uniqueDisplayName": "1ZTogG0N7Hvnuq1k", "userName": "J1kpHcQtnIc9z70L"}' \
    > test.out 2>&1
eval_tap $? 349 'AdminUpdateMyUserV4' test.out

#- 350 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"mfaToken": "FQMI0oZuEjY0rNBb"}' \
    > test.out 2>&1
eval_tap $? 350 'AdminDisableMyAuthenticatorV4' test.out

#- 351 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'bB9txAvtRQvqJacX' \
    > test.out 2>&1
eval_tap $? 351 'AdminEnableMyAuthenticatorV4' test.out

#- 352 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 352 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 353 AdminGetMyBackupCodesV4
eval_tap 0 353 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 354 AdminGenerateMyBackupCodesV4
eval_tap 0 354 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 355 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"mfaToken": "R2Rf4noXDFaEUkPU"}' \
    > test.out 2>&1
eval_tap $? 355 'AdminDisableMyBackupCodesV4' test.out

#- 356 AdminDownloadMyBackupCodesV4
eval_tap 0 356 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 357 AdminEnableMyBackupCodesV4
eval_tap 0 357 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 358 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'BnB0ZEJH3ebM71Tg' \
    > test.out 2>&1
eval_tap $? 358 'AdminGetBackupCodesV4' test.out

#- 359 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag '922xiBgHSka0Pz7I' \
    > test.out 2>&1
eval_tap $? 359 'AdminGenerateBackupCodesV4' test.out

#- 360 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag '1WkIa0oZ1nXpW1l7' \
    > test.out 2>&1
eval_tap $? 360 'AdminEnableBackupCodesV4' test.out

#- 361 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code '0pcZgIn4lPghHyME' \
    --factor 'HBzArbyW10NkJFQx' \
    > test.out 2>&1
eval_tap $? 361 'AdminChallengeMyMFAV4' test.out

#- 362 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'uMHnfOlX6HYVEiae' \
    > test.out 2>&1
eval_tap $? 362 'AdminSendMyMFAEmailCodeV4' test.out

#- 363 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"mfaToken": "reFCPJU2wEzUYUTm"}' \
    > test.out 2>&1
eval_tap $? 363 'AdminDisableMyEmailV4' test.out

#- 364 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'Z8JSMeNmRocp400R' \
    > test.out 2>&1
eval_tap $? 364 'AdminEnableMyEmailV4' test.out

#- 365 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 365 'AdminGetMyEnabledFactorsV4' test.out

#- 366 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'Ze8Bzx9aGEI22BTC' \
    > test.out 2>&1
eval_tap $? 366 'AdminMakeFactorMyDefaultV4' test.out

#- 367 AdminGetMyMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 367 'AdminGetMyMFAStatusV4' test.out

#- 368 AdminInviteUserV4
eval_tap 0 368 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 369 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'Zs97TJI8GPrM24F3' \
    --linkingToken 'celFgM62HQtgzQhO' \
    --password '3nR8j8DlP6OGbn8v' \
    --username 'mfMYGLt1AjKhh3JM' \
    > test.out 2>&1
eval_tap $? 369 'AuthenticationWithPlatformLinkV4' test.out

#- 370 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'X7xSrz1EH6X2SM3x' \
    --extendExp  \
    --linkingToken 'zsNrJzWBcdFlo7oA' \
    > test.out 2>&1
eval_tap $? 370 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 371 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'sOlfLB1J19b5rTfi' \
    --factor 'L2P3r1a8KIJH33aK' \
    --mfaToken 'kPuWD59MgTy1HA58' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 371 'Verify2faCodeV4' test.out

#- 372 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'Jt5NaROjSKFEuZo2' \
    --codeChallenge 'ElXYSS4ezBRSiOyR' \
    --codeChallengeMethod 'S256' \
    --additionalData 'ppvEJiUiDGXgh8BK' \
    --clientId 'cLqtRZ93LuR8OEyI' \
    --createHeadless  \
    --deviceId 'CvwgwBFehwtdJLdn' \
    --macAddress '3R2wo8beVQvgeP9q' \
    --platformToken 'OHaLwYnXxrz7sLmP' \
    --serviceLabel '0.9609347966411593' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 372 'PlatformTokenGrantV4' test.out

#- 373 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge '0LxN0f3JA27Qz5Sj' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'uIiz2MiAAKcvAXnx' \
    --simultaneousTicket 'nH0QIhoJRY807VmB' \
    --nativePlatform 'steam' \
    --nativePlatformTicket '4wZXQZZrSsuYiIPe' \
    > test.out 2>&1
eval_tap $? 373 'SimultaneousLoginV4' test.out

#- 374 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'i0pXglJYnKkoCAZu' \
    --codeChallengeMethod 'S256' \
    --additionalData 'yhwqk140MolIrnlk' \
    --clientId 'RVbcX435TDYpkk2G' \
    --clientSecret 'za6DrSycophHw3Eo' \
    --code 'EEClTO9SDKnMlnKW' \
    --codeVerifier '9jiNMu9QVrMeD4bD' \
    --extendNamespace '8gISE34yIAZQeigi' \
    --extendExp  \
    --loginQueueTicket 'A3wBrmBYIlZeheP7' \
    --password '2AB8EO3YrlyrWowU' \
    --redirectUri 'pUDVLlTtuJJsHZVs' \
    --refreshToken 'G6izJZruOJvSRFLD' \
    --username 'Sdj8elbtHvDU91Dm' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 374 'TokenGrantV4' test.out

#- 375 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'SqrKWYOuITlYS2RY' \
    --code 'aD9WNKGhbLhjz1v0' \
    > test.out 2>&1
eval_tap $? 375 'RequestTargetTokenResponseV4' test.out

#- 376 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RBIO2rkJGmPaK6HE' \
    --rawPUID  \
    --body '{"platformUserIds": ["VIQJd3930TGewjRy", "fo4nWVZZbKFsKOmg", "EhjH2wFzCpxxJLfA"]}' \
    > test.out 2>&1
eval_tap $? 376 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 377 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "YL6fwBiaVPmmn0T5", "policyId": "uzlmi2NY26xrkPPd", "policyVersionId": "g3pXjmtpNfCrIj9n"}, {"isAccepted": true, "localizedPolicyVersionId": "iaTsdD4d3kSbTkHP", "policyId": "MUvOAUXkw36cr2WJ", "policyVersionId": "QqS7Tq4YIyZAFQ6l"}, {"isAccepted": true, "localizedPolicyVersionId": "fa2jdNvpWf32JS1a", "policyId": "v9VNpVLT0LvqcfSd", "policyVersionId": "O1nAjY5FvADb3GUQ"}], "authType": "EMAILPASSWD", "country": "xHGxhZqNXJ6JXSh0", "dateOfBirth": "Z3SWISs1dYrJKmx1", "displayName": "BT6iLFQejNZJNF2h", "emailAddress": "m0TqBQprHn3whPKU", "password": "5abnqw8fFa30pVbh", "passwordMD5Sum": "r1BHh1arZAyuLcZo", "uniqueDisplayName": "EkPpqKhP2jWnRTgl", "username": "w0gdWoE4esuiDrqu", "verified": false}' \
    > test.out 2>&1
eval_tap $? 377 'PublicCreateTestUserV4' test.out

#- 378 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "wE0cXokXbwKDtVmr", "policyId": "YQu7hZvHfiT9s9pK", "policyVersionId": "8HuUY1QQHQ0NCEdd"}, {"isAccepted": false, "localizedPolicyVersionId": "tx6GV01vD7lNLxlp", "policyId": "vqaB9P9GaukfCEIe", "policyVersionId": "SBLhTfzigzHcRuJg"}, {"isAccepted": false, "localizedPolicyVersionId": "o2NstrL6TsJeRcE7", "policyId": "GuwKn63KIDTkUCqb", "policyVersionId": "bHGJGOTvKKRTHDnt"}], "authType": "EMAILPASSWD", "code": "TnAuujPeP9N0vdVB", "country": "5a2XkS3XQfMuzZh4", "dateOfBirth": "AhZRe2hgU56xtyJt", "displayName": "nbTDXu7FbleSP5Pc", "emailAddress": "dOuq0m0rvakR8rcw", "password": "ojLRjhcaJ56nGlYZ", "passwordMD5Sum": "2tod2BGBXjNyRCtP", "reachMinimumAge": true, "uniqueDisplayName": "GmROIqxqQ0gcNeTf", "username": "lyvUh3w5ZtfwmOCK"}' \
    > test.out 2>&1
eval_tap $? 378 'PublicCreateUserV4' test.out

#- 379 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'pFSMF0tfGIZCTNiI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "c9fEjkZhEpAJMCxM", "policyId": "p2J0hDg2kMgkvhoQ", "policyVersionId": "e9gD9tGN0nE7M36m"}, {"isAccepted": true, "localizedPolicyVersionId": "u3EeZtLQij2JXsqd", "policyId": "XfhZTTaCeqGv7meu", "policyVersionId": "QhJuq1C6JHkWMSUb"}, {"isAccepted": true, "localizedPolicyVersionId": "XT2h3hcQ2wV3ZbBT", "policyId": "nNQnVUhA5WnzVZdj", "policyVersionId": "8tsyzC4QaLXp3o4T"}], "authType": "EMAILPASSWD", "code": "a1I4lwXqwPfq3VzH", "country": "Qjtolx64w1gyvjac", "dateOfBirth": "KtGqxMnoAXRlcq0m", "displayName": "YWKQYlqMmu2pvF6r", "emailAddress": "P03bQaq1cT88H6RC", "password": "W8gJmGzDlqxtLsR2", "passwordMD5Sum": "AGOiPhNt2IdH8aYY", "reachMinimumAge": true, "uniqueDisplayName": "6mma833TDzk66ix8", "username": "8sAUrXr7MXxCvyy7"}' \
    > test.out 2>&1
eval_tap $? 379 'CreateUserFromInvitationV4' test.out

#- 380 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "caxz4MQrODLNlxiE", "country": "jQBCZx9DJ4V97SJL", "dateOfBirth": "lrwXmIGamRCARuFL", "displayName": "x4rV4CXVMrDYKe2e", "languageTag": "Tf1axo16GqT2vSLL", "uniqueDisplayName": "iMvcu39YZJypWzpN", "userName": "XgnoKIz8O8NglJtZ"}' \
    > test.out 2>&1
eval_tap $? 380 'PublicUpdateUserV4' test.out

#- 381 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Th280vflFMxIhlIT", "emailAddress": "8AgyZJ16MMd2bzOr"}' \
    > test.out 2>&1
eval_tap $? 381 'PublicUpdateUserEmailAddressV4' test.out

#- 382 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Tn2huwPgyUzBUWiK", "country": "oNGtvyk5xEfrJDxK", "dateOfBirth": "sw5Xl7ZZrDZdbuvC", "displayName": "FBaVcohewKkVuGv9", "emailAddress": "fQXkErF0drbYrrFQ", "password": "P6rW62CtetBW3pvA", "reachMinimumAge": false, "uniqueDisplayName": "hduTWchzXDv3TAtB", "username": "jP4HSuiYCbG0UyYU", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 382 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 383 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "NeGtJGjKbMgCeuAY", "password": "uzrmbWofEaKStqdK", "username": "u4ROnONpJ849chqe"}' \
    > test.out 2>&1
eval_tap $? 383 'PublicUpgradeHeadlessAccountV4' test.out

#- 384 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "iUGQMwNwDlYSli3p"}' \
    > test.out 2>&1
eval_tap $? 384 'PublicDisableMyAuthenticatorV4' test.out

#- 385 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code '8YaAdel3hHMSLAis' \
    > test.out 2>&1
eval_tap $? 385 'PublicEnableMyAuthenticatorV4' test.out

#- 386 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 386 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 387 PublicGetMyBackupCodesV4
eval_tap 0 387 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 388 PublicGenerateMyBackupCodesV4
eval_tap 0 388 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 389 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "cGRWzkCl1ZKuPxjD"}' \
    > test.out 2>&1
eval_tap $? 389 'PublicDisableMyBackupCodesV4' test.out

#- 390 PublicDownloadMyBackupCodesV4
eval_tap 0 390 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 391 PublicEnableMyBackupCodesV4
eval_tap 0 391 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 392 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'UGRGcCEPjbUy7F82' \
    > test.out 2>&1
eval_tap $? 392 'PublicGetBackupCodesV4' test.out

#- 393 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'Adu9BYRHrVTehrqg' \
    > test.out 2>&1
eval_tap $? 393 'PublicGenerateBackupCodesV4' test.out

#- 394 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'vEtEs2LpE0qfbvdU' \
    > test.out 2>&1
eval_tap $? 394 'PublicEnableBackupCodesV4' test.out

#- 395 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code '8hlDoC9FnxqBlPBY' \
    --factor 'J7X6uVy7FWTSfMi2' \
    > test.out 2>&1
eval_tap $? 395 'PublicChallengeMyMFAV4' test.out

#- 396 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'CPVGxjcdpdCqVeeP' \
    > test.out 2>&1
eval_tap $? 396 'PublicRemoveTrustedDeviceV4' test.out

#- 397 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'MSqb8y8qJTUQY40Z' \
    > test.out 2>&1
eval_tap $? 397 'PublicSendMyMFAEmailCodeV4' test.out

#- 398 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "rpn0vAD9YsPeDWrA"}' \
    > test.out 2>&1
eval_tap $? 398 'PublicDisableMyEmailV4' test.out

#- 399 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'VQZSvgWuCuLsUGrV' \
    > test.out 2>&1
eval_tap $? 399 'PublicEnableMyEmailV4' test.out

#- 400 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 400 'PublicGetMyEnabledFactorsV4' test.out

#- 401 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'QAbhS54ZuQHKersD' \
    > test.out 2>&1
eval_tap $? 401 'PublicMakeFactorMyDefaultV4' test.out

#- 402 PublicGetMyMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 402 'PublicGetMyMFAStatusV4' test.out

#- 403 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mJLUHAKtfXCKOna8' \
    > test.out 2>&1
eval_tap $? 403 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 404 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "DdjtZhh6ofsUoRh6", "emailAddress": "r0e0J6vyqPw7YlmV", "languageTag": "3kES0Hi88UYgSV40", "namespace": "OvY7apPCrN5bEhmu", "namespaceDisplayName": "HgKeWizEpw1zN0mO"}' \
    > test.out 2>&1
eval_tap $? 404 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE