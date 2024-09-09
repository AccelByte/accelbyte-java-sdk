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
echo "1..411"

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

#- 152 AdminGetRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetRoleOverrideConfigV3' test.out

#- 153 AdminUpdateRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    --body '{"additions": [{"actions": [2, 94, 30], "resource": "XTB9YQzUJ9XlYJ8B"}, {"actions": [51, 86, 50], "resource": "EUmUXGM5anIloyj9"}, {"actions": [22, 11, 14], "resource": "ZVDAiU6iJOF7JKZF"}], "exclusions": [{"actions": [81, 22, 35], "resource": "2NKy59X8iOg2sVBi"}, {"actions": [58, 28, 9], "resource": "lHvv9rqvEoM8YmVj"}, {"actions": [54, 8, 21], "resource": "Vej8N2yv6VTnOK7x"}], "overrides": [{"actions": [55, 35, 44], "resource": "excbHdEtoQvpV344"}, {"actions": [90, 5, 66], "resource": "tmTozCi8HeV6jbal"}, {"actions": [68, 25, 72], "resource": "qBBfi7sSF5BoGiTC"}], "replacements": [{"replacement": {"actions": [97, 12, 37], "resource": "uBF6Gsvvdl8jHz9x"}, "target": "7XZIjU4IK9lOLaZa"}, {"replacement": {"actions": [79, 62, 31], "resource": "BGTtZyTjdKNKgYaz"}, "target": "ujsmSmylT1YtxIq7"}, {"replacement": {"actions": [85, 1, 44], "resource": "Mb48jISd97KORRhx"}, "target": "SWLWLNfHRD3V15Qa"}]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminUpdateRoleOverrideConfigV3' test.out

#- 154 AdminGetRoleSourceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleSourceV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    > test.out 2>&1
eval_tap $? 154 'AdminGetRoleSourceV3' test.out

#- 155 AdminChangeRoleOverrideConfigStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminChangeRoleOverrideConfigStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    --body '{"active": true}' \
    > test.out 2>&1
eval_tap $? 155 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 156 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'L46LuxJF3sbeqWBd' \
    > test.out 2>&1
eval_tap $? 156 'AdminGetRoleNamespacePermissionV3' test.out

#- 157 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'QuWfgBAKx27MSBqa' \
    --after '4' \
    --before '38' \
    --limit '96' \
    > test.out 2>&1
eval_tap $? 157 'GetAdminUsersByRoleIdV3' test.out

#- 158 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'zApmWJO5vzzXZj08' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserByEmailAddressV3' test.out

#- 159 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["FZeOCOR9NvBQZSJP", "OIKrRBrYVzi9ui3l", "vozTt9TsH7A0TuU2"]}' \
    > test.out 2>&1
eval_tap $? 159 'AdminBulkUpdateUsersV3' test.out

#- 160 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'aL4bPkk11sys6Gdk' \
    --body '{"bulkUserId": ["Dcos5uVJ0BJfZ0jv", "A54CSqZFDsO1skRj", "OU1SMfQVQa6blj9R"]}' \
    > test.out 2>&1
eval_tap $? 160 'AdminGetBulkUserBanV3' test.out

#- 161 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["dd85bdYUumPKVSZC", "g3XTc9vQe0dHJfF6", "KIuvnRCa9JktyBdx"]}' \
    > test.out 2>&1
eval_tap $? 161 'AdminListUserIDByUserIDsV3' test.out

#- 162 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["kZKrEWFw9GYxjiiO", "QAD77ci0vfWVZoRR", "MPi57HyKKz5nyI6u"]}' \
    > test.out 2>&1
eval_tap $? 162 'AdminBulkGetUsersPlatform' test.out

#- 163 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["lKNKoXa0dgx1JgjC", "56pda3YhtQxpCYME", "6x21pdX2QSPAd9sx"], "isAdmin": false, "languageTag": "EV6tCdrxw1KOPhuv", "namespace": "HuYrGWDK41uMOC0m", "roles": ["RvSoaGk4ktF5wnJD", "g9Q3WXiydCOInVol", "sr6CHmj763vLwtYE"]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminInviteUserV3' test.out

#- 164 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '26' \
    --platformUserId 'TSiXjcY5ZPkv90ly' \
    --platformId 'KSTWLxSFZ0LpupEi' \
    > test.out 2>&1
eval_tap $? 164 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 165 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 165 'AdminListUsersV3' test.out

#- 166 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'RCn48bvkCPfKofwX' \
    --endDate 'OIZZQAJza84lKKmV' \
    --includeTotal  \
    --limit '83' \
    --offset '96' \
    --platformBy 'aTS6xBbNrSUAW2ak' \
    --platformId '7ISDrBVg6NuDZvPb' \
    --query '1kuUfNfUDe4g7q6P' \
    --roleIds 'HEaqbzHvDDl1jiLw' \
    --skipLoginQueue  \
    --startDate '3XMGBA6JXDpA1tIC' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 166 'AdminSearchUserV3' test.out

#- 167 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["45C0oaGouFu4hXON", "gUwJnUpryDeRcpUv", "lrw2MwC1uuokpaIj"]}' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetBulkUserByEmailAddressV3' test.out

#- 168 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'L0Vxe5n9Lx3QcFo9' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserByUserIdV3' test.out

#- 169 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gxOgvDc7xMrRKvw8' \
    --body '{"avatarUrl": "ISP2WKmCRRXBxlal", "country": "CHtWlKxLpS8fLWoQ", "dateOfBirth": "5nuJhatQPxR7dvBV", "displayName": "C5zgOKLTDmHe8c1e", "languageTag": "J9sde7Ryt4udIv22", "skipLoginQueue": true, "uniqueDisplayName": "18uux9xBomQFPFWy", "userName": "5cwNPI6aFo0MVwDZ"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminUpdateUserV3' test.out

#- 170 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CIXFNEL3uWVRz3V7' \
    --activeOnly  \
    --after 'YbJM3bNLWHAbCZix' \
    --before 'e2cQ6O30lpzcBQMA' \
    --limit '62' \
    > test.out 2>&1
eval_tap $? 170 'AdminGetUserBanV3' test.out

#- 171 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kpU9oVzl2kBuLFXI' \
    --body '{"ban": "eCEKZUTz3GvCAZ5j", "comment": "24acYHbrryHB6GO9", "endDate": "zP3FaepA3b3YJ9nJ", "reason": "M6vtT27xv85K5MU2", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 171 'AdminBanUserV3' test.out

#- 172 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KmZhCZxxPPdPwOtE' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetUserBanSummaryV3' test.out

#- 173 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'uWBSO2jJepUnEEgj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'a2mIE2kLTnJwc5Xm' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 173 'AdminUpdateUserBanV3' test.out

#- 174 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'me2NBFp62xlXvVcJ' \
    --body '{"context": "erTPW02PWsHiKYAr", "emailAddress": "AxnKBfBfDlrQQuAc", "languageTag": "10DjjwMv4vrIPRtv"}' \
    > test.out 2>&1
eval_tap $? 174 'AdminSendVerificationCodeV3' test.out

#- 175 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hQIyLarjaLOKnX51' \
    --body '{"Code": "yAB8Pa3uNGKhaLlJ", "ContactType": "zJMSnJIIgsAVmaGY", "LanguageTag": "xUX1B9oVuzG2CnYX", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 175 'AdminVerifyAccountV3' test.out

#- 176 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'YBF2g7TVtzYEHUod' \
    > test.out 2>&1
eval_tap $? 176 'GetUserVerificationCode' test.out

#- 177 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'h3iUfBthbepUCTWi' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetUserDeletionStatusV3' test.out

#- 178 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z1uqh7GAi4FEIu44' \
    --body '{"deletionDate": 42, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserDeletionStatusV3' test.out

#- 179 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '83ZLRxYlYqlpq03B' \
    > test.out 2>&1
eval_tap $? 179 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 180 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GdIk4oEogFVGR71r' \
    --body '{"code": "JOBy6lsj1AKGBjnH", "country": "maAu4YK87DYAWWcb", "dateOfBirth": "cbGWmKgE8CZ4AELr", "displayName": "5lraa5v5P5Cj8hgF", "emailAddress": "sqHC9h5JPiMEtgKu", "password": "iGTYgwWv5XldL6rO", "uniqueDisplayName": "VGcRAn51rVAQSxp4", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpgradeHeadlessAccountV3' test.out

#- 181 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gJbQ3Fj1umx4Itzk' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserInformationV3' test.out

#- 182 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MJ7cudf4r916GPrh' \
    --after '0.21686445209496508' \
    --before '0.8732911985725299' \
    --limit '8' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserLoginHistoriesV3' test.out

#- 183 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OJPS3lJ80YJ41U4o' \
    --body '{"languageTag": "oQ980ywmg1pWpWit", "mfaToken": "1QC7FKe0fnHUlmU1", "newPassword": "unGKM0tgfeWy47bb", "oldPassword": "wMI4gGmvK9gW596F"}' \
    > test.out 2>&1
eval_tap $? 183 'AdminResetPasswordV3' test.out

#- 184 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wBNrFXt3TAuKBwBc' \
    --body '{"Permissions": [{"Action": 60, "Resource": "yTsftKqnsIJctAdx", "SchedAction": 49, "SchedCron": "Ozg3hr6ucHf7dbh2", "SchedRange": ["iKNUl0qJqzoKMRMG", "541PAiNjULsx4SnK", "NXLMUaDSwwQlnNRZ"]}, {"Action": 73, "Resource": "n0JtgqzZv5kVu4S9", "SchedAction": 10, "SchedCron": "mj8YRvae4f4lhBPb", "SchedRange": ["arbWEm8bVtZcfVCP", "dQhim9QKUAFTVYel", "IlGJg9wdc8bihhWj"]}, {"Action": 11, "Resource": "IprOv0BJ9Sgl7H1s", "SchedAction": 6, "SchedCron": "iEokbUiYzCQh2iNT", "SchedRange": ["wtnohddMzMTQ9P7s", "YLDWAJOA75K4BYJ2", "fkqYJoF2FI3vyyqR"]}]}' \
    > test.out 2>&1
eval_tap $? 184 'AdminUpdateUserPermissionV3' test.out

#- 185 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zc20O7FdsJP1G9ty' \
    --body '{"Permissions": [{"Action": 56, "Resource": "KEohKzuMYDUTLBeC", "SchedAction": 17, "SchedCron": "DkUt3yexZBRvxYnE", "SchedRange": ["BhXtAVxCd3meTrT7", "cF9oVCh89wNOkKYs", "sVejcL3kR3hCGNga"]}, {"Action": 73, "Resource": "GAYOHR5BWa9VzIka", "SchedAction": 87, "SchedCron": "p0VgweLlT2sY3SsT", "SchedRange": ["nDQY7kKU2u06Q4ve", "ujxtyQENvJrBCqeg", "67d4RWOqO4U0bitN"]}, {"Action": 88, "Resource": "yFAm3DQht4JwnPS2", "SchedAction": 41, "SchedCron": "0FmvviVIBbcujF8V", "SchedRange": ["k5qb8NhWWwaxyMch", "kt8l5IPSrwrJl7wY", "IVw13NCo9yXlbQ52"]}]}' \
    > test.out 2>&1
eval_tap $? 185 'AdminAddUserPermissionsV3' test.out

#- 186 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FTHTCj6SEAzT7TOp' \
    --body '[{"Action": 50, "Resource": "GgSH8MGZGwiVj7eD"}, {"Action": 93, "Resource": "LaA643nTMtXSAyej"}, {"Action": 27, "Resource": "PhGspRi3bhPQvBBJ"}]' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteUserPermissionBulkV3' test.out

#- 187 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '71' \
    --namespace "$AB_NAMESPACE" \
    --resource '6IHy7EEvHyLmcvrZ' \
    --userId 'ZOdwe1x8RjU6Bi8J' \
    > test.out 2>&1
eval_tap $? 187 'AdminDeleteUserPermissionV3' test.out

#- 188 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XE52sUBBq2SimQQo' \
    --after 'Lbe5YOJvxGRxUzrT' \
    --before 'wagH7BMT1IZKTdNF' \
    --limit '97' \
    --platformId 'dJFAy2JTllJkRGB8' \
    --targetNamespace 'jqJEd6eqqsBVyONV' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetUserPlatformAccountsV3' test.out

#- 189 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0JRtozI0jpliCFQ6' \
    --status 'WgJpGPigdc5VyC4q' \
    > test.out 2>&1
eval_tap $? 189 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 190 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'vWjVac1cQvSxgTNI' \
    > test.out 2>&1
eval_tap $? 190 'AdminGetListJusticePlatformAccounts' test.out

#- 191 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'UzxDgBlIbuzm7DzJ' \
    --userId '20NFRJIhFXR2dYpr' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetUserMapping' test.out

#- 192 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'PmbpuptECGd5cdXC' \
    --userId '2Sesc6y68whNBYl9' \
    > test.out 2>&1
eval_tap $? 192 'AdminCreateJusticeUser' test.out

#- 193 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'iCqfW6rqGOQny4ij' \
    --skipConflict  \
    --body '{"platformId": "4ysYPonb59gQffkN", "platformUserId": "OmubxEJr2qEAuJbp"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminLinkPlatformAccount' test.out

#- 194 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZSrcbc4LWfKaY5c1' \
    --platformId 'tP5TDuI5f6m4KC07' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetUserLinkHistoriesV3' test.out

#- 195 AdminPlatformUnlinkV3
eval_tap 0 195 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 196 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CnsZe32hqEcB1ExY' \
    --userId 'MBb3ckvoaJYdMqGe' \
    > test.out 2>&1
eval_tap $? 196 'AdminPlatformUnlinkAllV3' test.out

#- 197 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gcg3eRvBZXN3cjIX' \
    --userId 'mFWRJnj8xN7HDPTU' \
    --ticket 'EDPN1Kb4UTPWDXTS' \
    > test.out 2>&1
eval_tap $? 197 'AdminPlatformLinkV3' test.out

#- 198 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 198 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 199 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'b55g8LSTs7Nf95lG' \
    --userId 'lPrf6obIdnI6Ag7e' \
    > test.out 2>&1
eval_tap $? 199 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 200 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UYcYJ4QzXCmqr6gm' \
    --userId 'PGaHP5SVPvRLiDi0' \
    --platformToken 'mNHb6Lx8eq8SGNwE' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 201 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QO8dYXvBSYvJBwb6' \
    --userId 'CjZUMRf2VJetWsok' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 201 'AdminGetUserSinglePlatformAccount' test.out

#- 202 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vx3BHuTEczr9KjQ3' \
    --body '["ttz8MTBt1xk9Iyss", "SA8nP5PQjpzk2Tb7", "iYdmNZWosrsVBPZ6"]' \
    > test.out 2>&1
eval_tap $? 202 'AdminDeleteUserRolesV3' test.out

#- 203 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4j0HUONscofwYLQc' \
    --body '[{"namespace": "DvkaEIIPoJT83zEG", "roleId": "XmVBZLyrH9J7Boys"}, {"namespace": "maORLkP5hc2Fh04J", "roleId": "TsqDTynCewqJligL"}, {"namespace": "lRxOelKykICRxF6H", "roleId": "tlER2txs4qrNARAT"}]' \
    > test.out 2>&1
eval_tap $? 203 'AdminSaveUserRoleV3' test.out

#- 204 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'n6KXOutlYBbLhL8K' \
    --userId 'Xx25FZfQIodVBqQs' \
    > test.out 2>&1
eval_tap $? 204 'AdminAddUserRoleV3' test.out

#- 205 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'BpCJBIXLGYcwWVRK' \
    --userId '6UKk5ozrXA4HZHNy' \
    > test.out 2>&1
eval_tap $? 205 'AdminDeleteUserRoleV3' test.out

#- 206 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'q9odanhR1Zrm3thU' \
    --body '{"enabled": true, "reason": "uufxkPHElug48Tgf"}' \
    > test.out 2>&1
eval_tap $? 206 'AdminUpdateUserStatusV3' test.out

#- 207 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nu0rqXUOyToLPIRE' \
    --body '{"emailAddress": "GIKlJt3EP9kKwkEN", "password": "Q8VOHGwbADMfuOmh"}' \
    > test.out 2>&1
eval_tap $? 207 'AdminTrustlyUpdateUserIdentity' test.out

#- 208 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0lciRhVZ2DeoODXM' \
    > test.out 2>&1
eval_tap $? 208 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 209 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'zLSrzoiBnYi5UWs3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "tYlYeMoCimJySocR"}' \
    > test.out 2>&1
eval_tap $? 209 'AdminUpdateClientSecretV3' test.out

#- 210 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'vUWDOrFZKPNoN9AW' \
    > test.out 2>&1
eval_tap $? 210 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 211 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'tLK9TFgi9j2XMh9W' \
    --before 'pifqjNjLOtNQts2y' \
    --isWildcard  \
    --limit '49' \
    > test.out 2>&1
eval_tap $? 211 'AdminGetRolesV3' test.out

#- 212 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "managers": [{"displayName": "MLZJ2jZfZbpTJezz", "namespace": "riCDWXT59SRu0YqU", "userId": "xKDc84OMIzvTScdb"}, {"displayName": "KBsAyJMz4ILNDvhB", "namespace": "4Eoes9a6XaJeRbzT", "userId": "PwD3jxF7vxRUY0il"}, {"displayName": "rNoFT98SgtJd4Z5f", "namespace": "8nfaKqdZFLbZEHxs", "userId": "DxeR6d7r1SQw80Jf"}], "members": [{"displayName": "MpPrSqYypRUnq5o4", "namespace": "ETeCUYG9ccTt7Wxw", "userId": "8OQ13t3uTw6zQuoZ"}, {"displayName": "cXQpoTOxe8y1jorN", "namespace": "sg9ZKYCKoISyXtHz", "userId": "oWGdYohxMp3uOQIy"}, {"displayName": "bqWfG9BJ6FVKlbYH", "namespace": "tbPtaxvagSlpGgVT", "userId": "F6VeDAPOGBwweyFf"}], "permissions": [{"action": 59, "resource": "EOEAEtbag82KgBgy", "schedAction": 57, "schedCron": "XGve6DdK6uvg8f2c", "schedRange": ["IoByk9fxtvsgeAxo", "57nKAbZpsbJ4Iu5K", "J0ynxGBlacDCdFe8"]}, {"action": 53, "resource": "zxoufCNlFoOcWQQy", "schedAction": 27, "schedCron": "bjmQeEweoBHTdwAk", "schedRange": ["7ZQnbqY1cQwVEtAr", "5kKKAo9MM2Cqm84j", "Vi9kIpqgrzpUkNOB"]}, {"action": 100, "resource": "dCnnL6Kt1Bjj3b8Q", "schedAction": 78, "schedCron": "pjwNOl4k8rVNrm8d", "schedRange": ["rv8QD2JOe2Ntz7EF", "vowPgIGuetxFMqXC", "QMAqQ2ZRGzNtrThF"]}], "roleName": "a9XU8mosluiHZJ7O"}' \
    > test.out 2>&1
eval_tap $? 212 'AdminCreateRoleV3' test.out

#- 213 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId '8sAQ32wj9uaDzsr9' \
    > test.out 2>&1
eval_tap $? 213 'AdminGetRoleV3' test.out

#- 214 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'xYiWRuuzQJiLc1eI' \
    > test.out 2>&1
eval_tap $? 214 'AdminDeleteRoleV3' test.out

#- 215 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId '9w3JEhxPGbEk7s7g' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "7FlounC3vJKBC7Sw"}' \
    > test.out 2>&1
eval_tap $? 215 'AdminUpdateRoleV3' test.out

#- 216 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'goViPeIB4Ehy0Y5a' \
    > test.out 2>&1
eval_tap $? 216 'AdminGetRoleAdminStatusV3' test.out

#- 217 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'SJVDginxAM77eY9C' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateAdminRoleStatusV3' test.out

#- 218 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '14FbfiI2NPvl1kCY' \
    > test.out 2>&1
eval_tap $? 218 'AdminRemoveRoleAdminV3' test.out

#- 219 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId '5bEokxXxkWZbjf7G' \
    --after 'ZxaossQmjo69wohJ' \
    --before 'FyTNk5FGUPhR4LEZ' \
    --limit '43' \
    > test.out 2>&1
eval_tap $? 219 'AdminGetRoleManagersV3' test.out

#- 220 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'msonjj0ZR50BQ1U6' \
    --body '{"managers": [{"displayName": "aFD3O2kXQSc58zgZ", "namespace": "Vl4gIF7v3qbZu9M3", "userId": "OxqVAT4H1lRZ9Z1J"}, {"displayName": "BrHRzEOtIxzPqb6n", "namespace": "73m0jiaDH86d9rsK", "userId": "gzCsMulpB8HZUtVV"}, {"displayName": "aJCiLgKOwrSfWhT5", "namespace": "B4WedopzwSluBtRF", "userId": "PKThyGnbjmPDKFS6"}]}' \
    > test.out 2>&1
eval_tap $? 220 'AdminAddRoleManagersV3' test.out

#- 221 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'u9FHuv1M3qfch4Sq' \
    --body '{"managers": [{"displayName": "IV6LQPHlaeYl4csF", "namespace": "q65cU66yJaj4ovoK", "userId": "WE4EW0sw8v5peiux"}, {"displayName": "oBJATauyD3XCXVMi", "namespace": "yEvMf9yilUEujk6o", "userId": "qYo1HQYTFzwdOMdu"}, {"displayName": "pwD4O3uNbcIDcIyv", "namespace": "ZbOy1T4hfwkuVykH", "userId": "4RpfmjIXFGZ5PKdb"}]}' \
    > test.out 2>&1
eval_tap $? 221 'AdminRemoveRoleManagersV3' test.out

#- 222 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'abJIkNnt9P1Tkm08' \
    --after 'luh4dpPRMDbUXBWT' \
    --before 'bpAogG2wlZkLhuU5' \
    --limit '65' \
    > test.out 2>&1
eval_tap $? 222 'AdminGetRoleMembersV3' test.out

#- 223 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'WbYb0Pebyt8b4DGs' \
    --body '{"members": [{"displayName": "cjwrizsFUgYwbaLv", "namespace": "qvQ2NbmDITuymTBj", "userId": "n3d2sFzMS3QaVjZF"}, {"displayName": "7Ax6115Kg9U8vrQJ", "namespace": "XQxoIbVi2CLEk277", "userId": "Ivjj1A647XQ3koaA"}, {"displayName": "fZIim0sFPm1YN27b", "namespace": "ojDVaZLpx4kEWYkO", "userId": "6KrKUMhJrASBh61h"}]}' \
    > test.out 2>&1
eval_tap $? 223 'AdminAddRoleMembersV3' test.out

#- 224 AdminRemoveRoleMembersV3
eval_tap 0 224 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 225 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'mWKSSrF35anDGvur' \
    --body '{"permissions": [{"action": 64, "resource": "9V18oIrUKXttgAI2", "schedAction": 87, "schedCron": "JaXFpff28uYbe4Cf", "schedRange": ["2HEHvVevhISjbtBJ", "UK5fE3OufPSX3PdO", "U2V9yw94oa8UJ34T"]}, {"action": 71, "resource": "0XXQJWszvTQEuALz", "schedAction": 61, "schedCron": "U08wfnlHBXFIqFUm", "schedRange": ["gUSMM5au8GJT0mkV", "PI6zUtf3QaJPGrTN", "cXXTUIggoH89QNmI"]}, {"action": 29, "resource": "7UDb19R6H7r1ta3m", "schedAction": 63, "schedCron": "jK5pxe82pgFiAS6p", "schedRange": ["iIzmc8rKrKEPGSAc", "ong6eNERUf8kjci1", "Ctccv9Gv4tOcbnuC"]}]}' \
    > test.out 2>&1
eval_tap $? 225 'AdminUpdateRolePermissionsV3' test.out

#- 226 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'qf0lm6WBkIzjoSV3' \
    --body '{"permissions": [{"action": 52, "resource": "tvmMB6jzrpRGESmo", "schedAction": 30, "schedCron": "XPMqxj4hBgVY3YAx", "schedRange": ["ZLKbcOdyjqf6Q4oi", "woJcaRMEb15LBlTV", "ufc5ZyODR2NVyn4P"]}, {"action": 89, "resource": "WGTTD81xhNP4t6kY", "schedAction": 56, "schedCron": "dMiSNV4qBrt1kcLm", "schedRange": ["Rv6EJtl5xWnsb8oW", "q94RImNWVIJnhhwF", "DV1VitaomvWTzdsW"]}, {"action": 37, "resource": "N70wYS4Kj7Yi2Vvo", "schedAction": 86, "schedCron": "lVLqb9lGAJUg21Lt", "schedRange": ["7JwgwMUSuC3Bajy3", "BcEMCtQs2FcEcvVA", "yId6Cp85HVDsZBQg"]}]}' \
    > test.out 2>&1
eval_tap $? 226 'AdminAddRolePermissionsV3' test.out

#- 227 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'OnXuXsGThYZrmm0w' \
    --body '["rFMnPpWgrQD4hEk0", "OLjYsnignE7KcMF7", "fuDbzRRYMNXWUsp1"]' \
    > test.out 2>&1
eval_tap $? 227 'AdminDeleteRolePermissionsV3' test.out

#- 228 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '39' \
    --resource 'i5WjMZfOadpgegCU' \
    --roleId 'jTdi1Ehr8OtqpNJ9' \
    > test.out 2>&1
eval_tap $? 228 'AdminDeleteRolePermissionV3' test.out

#- 229 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 229 'AdminGetMyUserV3' test.out

#- 230 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'R8TuNy4ejmVA3vMC' \
    --extendExp  \
    --redirectUri 'sGyPd12B8QNUz0hF' \
    --password 'FNbH6j2W4roZM2UK' \
    --requestId 'AXEEsL5D0oiFchQn' \
    --userName 'Veq3g2AB2WIRUQma' \
    > test.out 2>&1
eval_tap $? 230 'UserAuthenticationV3' test.out

#- 231 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'uIY5HXCZ0W4XmWP0' \
    --linkingToken 'HzSdiylLhVYszm8x' \
    --password 'Y33OQbumu2QHLyZN' \
    --username 'uysyM4OfCzdQCXMA' \
    > test.out 2>&1
eval_tap $? 231 'AuthenticationWithPlatformLinkV3' test.out

#- 232 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'Wnf87YPNOe9Eevf1' \
    --extendExp  \
    --linkingToken 'fhMg1E2k7QLFrVgt' \
    > test.out 2>&1
eval_tap $? 232 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 233 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'X7y0fPOieDCow2zX' \
    > test.out 2>&1
eval_tap $? 233 'RequestOneTimeLinkingCodeV3' test.out

#- 234 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'yFFVpM87yqEwEacQ' \
    > test.out 2>&1
eval_tap $? 234 'ValidateOneTimeLinkingCodeV3' test.out

#- 235 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'MTlqN4LKkxJ5v3SB' \
    --isTransient  \
    --clientId 'afnKNiMPbFkFGA85' \
    --oneTimeLinkCode 'W3HJkqgS2B37wwoP' \
    > test.out 2>&1
eval_tap $? 235 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 236 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 236 'GetCountryLocationV3' test.out

#- 237 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 237 'Logout' test.out

#- 238 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'YOHiIsxmsLBPBJuN' \
    --codeChallengeMethod 'plain' \
    --clientId 'nWRrtW870qD88Zcd' \
    > test.out 2>&1
eval_tap $? 238 'RequestTokenExchangeCodeV3' test.out

#- 239 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uZSe7W20UZcDaiq0' \
    --userId 'nEZ7PyhqFJkDClOs' \
    --platformUserId 'KmfsgJdmzsDPsWh1' \
    > test.out 2>&1
eval_tap $? 239 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 240 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'k0cQ08NG6dX2TZki' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 240 'RevokeUserV3' test.out

#- 241 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'l67kRngoUa83ECh1' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'zPFbrOMZMgWkFN7T' \
    --redirectUri 'pkx6GcfyOg6ZUrrp' \
    --scope '9ubg9mndW2JKmQaf' \
    --state 'Us2bxYztOEyVbKIf' \
    --targetAuthPage '1ZbzgUwd8DHoCQyk' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'mXHYmkRlg7gYs6un' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 241 'AuthorizeV3' test.out

#- 242 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'YQ9jNQN1di1ldhOh' \
    > test.out 2>&1
eval_tap $? 242 'TokenIntrospectionV3' test.out

#- 243 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 243 'GetJWKSV3' test.out

#- 244 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId '6HvjnYuV7NfC4A2O' \
    --factor 'DiZhbfb8QqCyK1XH' \
    --mfaToken '9D6vl5eFdFfgK46G' \
    > test.out 2>&1
eval_tap $? 244 'SendMFAAuthenticationCode' test.out

#- 245 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'jCWaP8huTmnq3FGQ' \
    --mfaToken 'n3Ahu5wxq6oJq4mC' \
    > test.out 2>&1
eval_tap $? 245 'Change2faMethod' test.out

#- 246 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'hmQHQhO9IKBXDFQf' \
    --factor 'XFD58sG6uDhFYlrz' \
    --mfaToken 'JBYSeMuJfQecutjS' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 246 'Verify2faCode' test.out

#- 247 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '029BiJWOG1m7MKcl' \
    --userId 'r5igjNTVItrH2X78' \
    > test.out 2>&1
eval_tap $? 247 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 248 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'hxJgaVfw5Vnyq8Oz' \
    --clientId 'TE89WDNoMcOmbfJr' \
    --redirectUri 'CJQIj1haAosKglqa' \
    --requestId 'CXE9ytpIO8btO3Ow' \
    > test.out 2>&1
eval_tap $? 248 'AuthCodeRequestV3' test.out

#- 249 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'NEGSW5TaW4to7QCY' \
    --additionalData '2NGGvi9kg3rMIzNm' \
    --clientId 'hJTNQjKlwjfJ3TJ2' \
    --createHeadless  \
    --deviceId 'xVpge70WsLfgbZie' \
    --macAddress 'RvJI5sT9DH3DfLCv' \
    --platformToken '8q4Thmq09bBgPAYx' \
    --serviceLabel '0.27530237649340594' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 249 'PlatformTokenGrantV3' test.out

#- 250 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 250 'GetRevocationListV3' test.out

#- 251 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'BE9jlnTgtgW33wDw' \
    > test.out 2>&1
eval_tap $? 251 'TokenRevocationV3' test.out

#- 252 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'D9RKvQX4yFQFdrRo' \
    --simultaneousTicket 'M6FoqCYw7AlxO6qd' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'pc71sSck3ggZWJlS' \
    > test.out 2>&1
eval_tap $? 252 'SimultaneousLoginV3' test.out

#- 253 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'lCQMDji329PfVrvM' \
    --clientId 'EPtpsSNcpK1QkB2S' \
    --clientSecret 'y8Ww79LVeVskqeUB' \
    --code '7RSayqGFguhh3bva' \
    --codeVerifier 'dRthdbVApebRA09r' \
    --extendNamespace 'W8i8krFWJhe03coR' \
    --extendExp  \
    --password 'Fok5d3AyGrZO8Guo' \
    --redirectUri 'XNSoVEBG7VbBPUWi' \
    --refreshToken 'pz9C05YabFX4FCK5' \
    --username 'ucTFsAFzaO3yJpA3' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 253 'TokenGrantV3' test.out

#- 254 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'RQvRUbUDSiefGEdL' \
    > test.out 2>&1
eval_tap $? 254 'VerifyTokenV3' test.out

#- 255 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'ucrtO2gCQD057DrD' \
    --code 'lgC2nzS9SiGUjVAw' \
    --error '4v3q6JRHcn7KaoCE' \
    --openidAssocHandle 'kRdo6qHYIZWnXqQ1' \
    --openidClaimedId 'oHFJ9Q0vqsL9Somq' \
    --openidIdentity 'WsGA76yxi0QzZWfm' \
    --openidMode 'P2sx0KO5bEJaPnAF' \
    --openidNs 'jsodyJQVVBrShGbI' \
    --openidOpEndpoint 'IuqK8C403HgoXCR6' \
    --openidResponseNonce 'XOMXwKdfqk8T4QHK' \
    --openidReturnTo '30EX0FclpDl5Hsur' \
    --openidSig 'acO5MnjnxD1OXkxS' \
    --openidSigned 'hFVQTRekLfjmy8zo' \
    --state 'sRCRgVwbrQKmb01y' \
    > test.out 2>&1
eval_tap $? 255 'PlatformAuthenticationV3' test.out

#- 256 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'A7U7dGMjupZkZQY8' \
    --platformToken 'CNyT4k3DIbfT22G5' \
    > test.out 2>&1
eval_tap $? 256 'PlatformTokenRefreshV3' test.out

#- 257 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'NpE130YWSgxpKWtd' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetInputValidations' test.out

#- 258 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'tdtVW9anENmxb9e7' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetInputValidationByField' test.out

#- 259 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'vXZV3ig8Jg5VByeI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 259 'PublicGetCountryAgeRestrictionV3' test.out

#- 260 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey '3ycMcYYBixKJXCIS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 260 'PublicGetConfigValueV3' test.out

#- 261 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 261 'PublicGetCountryListV3' test.out

#- 262 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 262 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 263 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'Qdwec1m8BusV9tUh' \
    > test.out 2>&1
eval_tap $? 263 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 264 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 264 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 265 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '74KVo6Xqjz2xUKLN' \
    --platformUserId 'WSmYyVvyelIJ8Qga' \
    > test.out 2>&1
eval_tap $? 265 'PublicGetUserByPlatformUserIDV3' test.out

#- 266 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'LMqi836ULa7cfZl4' \
    > test.out 2>&1
eval_tap $? 266 'PublicGetAsyncStatus' test.out

#- 267 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'VuY6rsZyo6CBRRno' \
    --limit '83' \
    --offset '46' \
    --platformBy 'ikIxXKKIR6kPmswm' \
    --platformId '5TCAU1cKApdJDnE7' \
    --query '3GLmSZns5owBhoUg' \
    > test.out 2>&1
eval_tap $? 267 'PublicSearchUserV3' test.out

#- 268 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "4LsGP6KLPXkvUv2X", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "94s7CbIJ7eHnVWOb", "policyId": "oMkyB7FTexsOZ0b2", "policyVersionId": "p3b63KrcwIcXMhGy"}, {"isAccepted": true, "localizedPolicyVersionId": "Xit6boOLGCcg16Dq", "policyId": "wdQPQ9HkSSV8e1Mg", "policyVersionId": "TTLS2FgarY903ING"}, {"isAccepted": true, "localizedPolicyVersionId": "yEfRBEj7qms9AGQE", "policyId": "xPhgr9gGfC0Gjvpg", "policyVersionId": "JfuBs1Vpqn47GVgh"}], "authType": "TH2wToOnq9U5lyW8", "code": "9Xwt3wmRTrDCjhnK", "country": "vsHezWTqgYPixtHk", "dateOfBirth": "6lWq6tEeUmU96FLE", "displayName": "ak0mJqjRYldcTpde", "emailAddress": "CD9XPRi4bAQL7VE2", "password": "wL8Y4JFVUdzA8bvX", "reachMinimumAge": false, "uniqueDisplayName": "htdM5T3fDSrSHrko"}' \
    > test.out 2>&1
eval_tap $? 268 'PublicCreateUserV3' test.out

#- 269 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'qv2mM6soMaTvQq2a' \
    --query '9YdFNtRVSO0js0hG' \
    > test.out 2>&1
eval_tap $? 269 'CheckUserAvailability' test.out

#- 270 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["9xmSnzd7zgUxAogc", "nGkXk17QPkJHRhmL", "KQuQVFSKiXl8G2uf"]}' \
    > test.out 2>&1
eval_tap $? 270 'PublicBulkGetUsers' test.out

#- 271 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "6E8EajXLSAS8MKMa", "languageTag": "xQ1QyJCpKedhuzI7"}' \
    > test.out 2>&1
eval_tap $? 271 'PublicSendRegistrationCode' test.out

#- 272 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "G9NCKKXu1bqI2M5P", "emailAddress": "mXfKnQ7BYGjCUDMO"}' \
    > test.out 2>&1
eval_tap $? 272 'PublicVerifyRegistrationCode' test.out

#- 273 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "rbmoRvWnfmGFy0eU", "languageTag": "oOBd90h9EDqSTOfo"}' \
    > test.out 2>&1
eval_tap $? 273 'PublicForgotPasswordV3' test.out

#- 274 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "NewWjwMWDKEt6Jhb", "password": "J0fwTDaq6b5RpMwh", "uniqueDisplayName": "WPtndriXU9loOxpm", "username": "EuwDVc12r0DVUGgG"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicValidateUserInput' test.out

#- 275 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'HkapTCafFMdvYiCB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 275 'GetAdminInvitationV3' test.out

#- 276 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'uzUUwyI6Vtd4v9k4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "fv3kMiuQ3DhsKLxj", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "repy56eW1kmb15Qe", "policyId": "IQF51c4MqJzDSvEL", "policyVersionId": "gBe6dboSdhkBzAzP"}, {"isAccepted": false, "localizedPolicyVersionId": "eY4PBNHKPx62tHxD", "policyId": "b06ZFy3uglSp2Uxv", "policyVersionId": "F2uLXWilRD7HD6LC"}, {"isAccepted": false, "localizedPolicyVersionId": "GgK8aVSCN6oCETQ8", "policyId": "gIDRdD2wwMXwKVXG", "policyVersionId": "PhEJsc7rZpxaPHc9"}], "authType": "r8eToFmkHJ6BPOKF", "code": "LxIwKssw647YwDud", "country": "nGRufOUGfMjTU226", "dateOfBirth": "l07jPlcYaqYM7YfB", "displayName": "mhjI9Y28qVceS9UX", "emailAddress": "48dKPCFUIeyYEymN", "password": "XzNX6TGh4UdEweeB", "reachMinimumAge": true, "uniqueDisplayName": "962e6gtn5pUARJM1"}' \
    > test.out 2>&1
eval_tap $? 276 'CreateUserFromInvitationV3' test.out

#- 277 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "T8QwMNOAzXmyHEV4", "country": "g9P6a280S5RNB5dV", "dateOfBirth": "CsB7xL4axSPgPCiw", "displayName": "LxCFLDixZwVtt3RV", "languageTag": "Tl0tR00oQgcHdGGK", "uniqueDisplayName": "3x76U1EIcklttmrp", "userName": "gF5szl0sMY8es36r"}' \
    > test.out 2>&1
eval_tap $? 277 'UpdateUserV3' test.out

#- 278 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "1FgR70eNLHkVrEFd", "country": "8xArWJuCAIfNBSHg", "dateOfBirth": "pFNw9K9pmAIc6VSf", "displayName": "E9nbE2PMv12ZSRJk", "languageTag": "ujxbCu1HFaj6Vxs3", "uniqueDisplayName": "GuA4S1dS7H7yIS7b", "userName": "5TSDRIoMg7Dc5APz"}' \
    > test.out 2>&1
eval_tap $? 278 'PublicPartialUpdateUserV3' test.out

#- 279 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "fzXDELJFaIaEMW5b", "emailAddress": "hJyL72WDyhBsCCbn", "languageTag": "fihnXKxGxaupnTTq"}' \
    > test.out 2>&1
eval_tap $? 279 'PublicSendVerificationCodeV3' test.out

#- 280 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "9ihZkvFKfSHQh8I9", "contactType": "xk3sFl0cbuCRM69X", "languageTag": "KkLwioRaKnWhlh80", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 280 'PublicUserVerificationV3' test.out

#- 281 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "4df9qswSlpCI8Dhj", "country": "lxUyrs3OSesE5p0D", "dateOfBirth": "wUj2HKUvPYUcQBxM", "displayName": "SdOOsn2Nd8Jpa19G", "emailAddress": "JDK46Eehx7xasqMY", "password": "9aulsL6NOV5agpS6", "uniqueDisplayName": "A5mkufBpWVxIK9D2", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 281 'PublicUpgradeHeadlessAccountV3' test.out

#- 282 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "mCWbs5qugklBUS6u", "password": "wWrCQt86Jrg8tLAJ"}' \
    > test.out 2>&1
eval_tap $? 282 'PublicVerifyHeadlessAccountV3' test.out

#- 283 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "WpcyNkUvqn6eXr6F", "mfaToken": "NbKJ05Orya6LSSUl", "newPassword": "ugIAknXcSaVYcAYp", "oldPassword": "7qSiDvsfMUOpWv46"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicUpdatePasswordV3' test.out

#- 284 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'sXvpOjrpRo4mYrCe' \
    > test.out 2>&1
eval_tap $? 284 'PublicCreateJusticeUser' test.out

#- 285 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QUnYoID2UqO0iAXA' \
    --redirectUri '9dB4ib8HDOJ8TNiP' \
    --ticket '8KgEAj3dbRTI0i6d' \
    > test.out 2>&1
eval_tap $? 285 'PublicPlatformLinkV3' test.out

#- 286 PublicPlatformUnlinkV3
eval_tap 0 286 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 287 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'O3zkbDseh4tJdoGc' \
    > test.out 2>&1
eval_tap $? 287 'PublicPlatformUnlinkAllV3' test.out

#- 288 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wMBmegqVUaWMJBjr' \
    --ticket 'V0p9A7tcHrV0MbJG' \
    > test.out 2>&1
eval_tap $? 288 'PublicForcePlatformLinkV3' test.out

#- 289 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'r4drgkDuWS05m0pG' \
    --clientId 'zazM2BUXnzUEWTiK' \
    --redirectUri 'MJAf6AgbiEDMfCck' \
    > test.out 2>&1
eval_tap $? 289 'PublicWebLinkPlatform' test.out

#- 290 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WogE5gcfF8AMGZ2F' \
    --code 'BS93Mg6TKwdRMraD' \
    --state 'Lrwh3d0ykRGkgqUN' \
    > test.out 2>&1
eval_tap $? 290 'PublicWebLinkPlatformEstablish' test.out

#- 291 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'IbJMJ9ABbKVWO2YE' \
    --code 'DiqkwKbpdk7wlDng' \
    --state 'NiPPjpSAlZwFGpea' \
    > test.out 2>&1
eval_tap $? 291 'PublicProcessWebLinkPlatformV3' test.out

#- 292 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "5ObBB49Km4ClIQmk", "userIds": ["IdLCvNhZ6P8aqZ2y", "frC1V7ZpJZPHCMqv", "cYmeDLYEzs2SQUdK"]}' \
    > test.out 2>&1
eval_tap $? 292 'PublicGetUsersPlatformInfosV3' test.out

#- 293 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "r6vgqkjycqclNlBO", "code": "RlC8ZkjsxYtgxplH", "emailAddress": "TPLzynjFZgF3erw7", "languageTag": "UsyHq4bBb0n1JhPU", "newPassword": "S8BRPGV9n769zLJd"}' \
    > test.out 2>&1
eval_tap $? 293 'ResetPasswordV3' test.out

#- 294 PublicGetUserByUserIdV3
eval_tap 0 294 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 295 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KMexeJc7NvgTSgKj' \
    --activeOnly  \
    --after 'CxZjKf8NA4cGUaDf' \
    --before 'y9XnH2r0EKrk5Vln' \
    --limit '75' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetUserBanHistoryV3' test.out

#- 296 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AiAItnWUmD225fp1' \
    > test.out 2>&1
eval_tap $? 296 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 297 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'egsx3ErheNwqd5pr' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetUserInformationV3' test.out

#- 298 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iclNNqLyrlzrJ4QH' \
    --after '0.02445325023477196' \
    --before '0.08882429699863847' \
    --limit '28' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetUserLoginHistoriesV3' test.out

#- 299 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'z86nc6jLF9DIW2nc' \
    --after 'JJKpqmgvUTr8XAtp' \
    --before 'OqUQxzqJZiWi3KQf' \
    --limit '11' \
    --platformId 't2t6bVpCgKvPXSDu' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetUserPlatformAccountsV3' test.out

#- 300 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fmKh783cV54JsVBR' \
    > test.out 2>&1
eval_tap $? 300 'PublicListJusticePlatformAccountsV3' test.out

#- 301 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'B0rY0xfWddACyHSm' \
    --body '{"platformId": "o4KX9TPO3K1k5ZM8", "platformUserId": "btmGsgXNXbpqxh76"}' \
    > test.out 2>&1
eval_tap $? 301 'PublicLinkPlatformAccount' test.out

#- 302 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'Af5JSwjw2fE2g6jX' \
    --body '{"chosenNamespaces": ["V7oai2oDm9FaP0HJ", "98tE4UyoQg0b0sGO", "kzxVt15LKmkQ7YBh"], "requestId": "sOuJ0ypkkt2G4eFh"}' \
    > test.out 2>&1
eval_tap $? 302 'PublicForceLinkPlatformWithProgression' test.out

#- 303 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2YNsdoxpLTBM9Q8t' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetPublisherUserV3' test.out

#- 304 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '829Ido1JyveSRiBq' \
    --password '23kyH9jQbHWkcVk0' \
    > test.out 2>&1
eval_tap $? 304 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 305 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'X28GS54vl7gIKBc7' \
    --before 'OYTylFRAJKySnC0c' \
    --isWildcard  \
    --limit '10' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetRolesV3' test.out

#- 306 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'Lb85nmpdN26BY5YI' \
    > test.out 2>&1
eval_tap $? 306 'PublicGetRoleV3' test.out

#- 307 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 307 'PublicGetMyUserV3' test.out

#- 308 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode '0jeO2zMDSy4kyqyK' \
    > test.out 2>&1
eval_tap $? 308 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 309 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["grtEPdXXlt8geCdi", "Xu3iNvn7vLZ7h6al", "hJNGZF07lsPP5OfH"], "oneTimeLinkCode": "bXzWnVO2U4uyzZo1"}' \
    > test.out 2>&1
eval_tap $? 309 'LinkHeadlessAccountToMyAccountV3' test.out

#- 310 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "rj0ZrLQjk4VoYfIk"}' \
    > test.out 2>&1
eval_tap $? 310 'PublicSendVerificationLinkV3' test.out

#- 311 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'sth24cZBpdDFfvze' \
    > test.out 2>&1
eval_tap $? 311 'PublicVerifyUserByLinkV3' test.out

#- 312 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'U5iqhx6zv7EURTNI' \
    --code 'oG1DBdoKH6sREmmf' \
    --error 'wUZLZZS7snx0Q2Gd' \
    --state '8m7Y3wiNloJfey3H' \
    > test.out 2>&1
eval_tap $? 312 'PlatformAuthenticateSAMLV3Handler' test.out

#- 313 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'XL6SjljNPTXA3qbg' \
    --payload '55SyienCODZ0mnOp' \
    > test.out 2>&1
eval_tap $? 313 'LoginSSOClient' test.out

#- 314 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'PTVxEgBFzG8tlkxW' \
    > test.out 2>&1
eval_tap $? 314 'LogoutSSOClient' test.out

#- 315 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'KCU1XN4gl7yHvEqp' \
    --code 'JSrDXVwCkhOQ161T' \
    > test.out 2>&1
eval_tap $? 315 'RequestTargetTokenResponseV3' test.out

#- 316 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '65' \
    --namespace "$AB_NAMESPACE" \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 316 'AdminListInvitationHistoriesV4' test.out

#- 317 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jROYJm75VIuCOCkt' \
    > test.out 2>&1
eval_tap $? 317 'AdminGetDevicesByUserV4' test.out

#- 318 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType '2W1DfI8QtgODk9K6' \
    --endDate 'DcMnyCPn1FylWdaN' \
    --limit '98' \
    --offset '51' \
    --startDate '1VaZTkbbuWiiA4UT' \
    > test.out 2>&1
eval_tap $? 318 'AdminGetBannedDevicesV4' test.out

#- 319 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DgS2SVEo5M80LLbk' \
    > test.out 2>&1
eval_tap $? 319 'AdminGetUserDeviceBansV4' test.out

#- 320 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "u9GYH4ijqOVM50tC", "deviceId": "qkZfsSxAbDJ7sHCL", "deviceType": "up8pmEosOXglQwwd", "enabled": false, "endDate": "ZUeelXYyNrXweiCn", "ext": {"DldRPRfd6mLZ0GTJ": {}, "wEjoZrRtaeWKMC8w": {}, "sOByQAMAgqFEzEt8": {}}, "reason": "umj5XhKnw7MHDwFV"}' \
    > test.out 2>&1
eval_tap $? 320 'AdminBanDeviceV4' test.out

#- 321 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'KUC2ecnpUDqvLQix' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 321 'AdminGetDeviceBanV4' test.out

#- 322 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'PKVSmWa8TGko16XT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 322 'AdminUpdateDeviceBanV4' test.out

#- 323 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate '0j9suukPE4JwQONQ' \
    --startDate '2vCbMn0Oia336uii' \
    --deviceType 'MTAductvUfVwLaht' \
    > test.out 2>&1
eval_tap $? 323 'AdminGenerateReportV4' test.out

#- 324 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 324 'AdminGetDeviceTypesV4' test.out

#- 325 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'Redh1SiZlOpIQ8GL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 325 'AdminGetDeviceBansV4' test.out

#- 326 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId '7jBF1R5OexAPzCG6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 326 'AdminDecryptDeviceV4' test.out

#- 327 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'ZKQClGc1636nbfM3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 327 'AdminUnbanDeviceV4' test.out

#- 328 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'J9G40Y62bCo941AL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 328 'AdminGetUsersByDeviceV4' test.out

#- 329 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 329 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 330 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 330 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 331 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 28}' \
    > test.out 2>&1
eval_tap $? 331 'AdminCreateTestUsersV4' test.out

#- 332 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "QuHVskfCjUK8GeX4", "policyId": "Q0B2Cj0oOmBmXu1K", "policyVersionId": "iTTiz7yrIvQj2isN"}, {"isAccepted": true, "localizedPolicyVersionId": "bRwcr16lW5YwgZpj", "policyId": "lMMtPWg8217m7qNk", "policyVersionId": "QiKp2oac8QTNEuBb"}, {"isAccepted": false, "localizedPolicyVersionId": "q6ECDD6OGkuLs9gN", "policyId": "pNon6DKW9A6AmnQT", "policyVersionId": "NFidImWONTvCPMGL"}], "authType": "EMAILPASSWD", "code": "OvykBcDpzD9zh6dt", "country": "PK4fVHLMvrCsH3RY", "dateOfBirth": "xH2Up9VthPjFrK7H", "displayName": "ip0eONFDgUPShG8w", "emailAddress": "wFKY9AMpcwJd4Sri", "password": "gIxAhbFMZfxaznlD", "passwordMD5Sum": "QbzTiFrQB1yUonir", "reachMinimumAge": false, "uniqueDisplayName": "Rx3NkKQBYrlUaMiF", "username": "EWUT8cAFO5zEw8GE"}' \
    > test.out 2>&1
eval_tap $? 332 'AdminCreateUserV4' test.out

#- 333 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["6EG8I2lTviKbOgVu", "N3nhkn6QIesNoYqv", "VsakylHikKkpOjqw"]}' \
    > test.out 2>&1
eval_tap $? 333 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 334 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["gKvfXXs8pDqm31AZ", "SRkuw6q8FgqG46Rs", "FK7eYlSU3vYcHZZj"]}' \
    > test.out 2>&1
eval_tap $? 334 'AdminBulkCheckValidUserIDV4' test.out

#- 335 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FegVnZOn0tk4IATS' \
    --body '{"avatarUrl": "IefcqNEn4IZ0Dv6b", "country": "8WtaMVvLbG04KKnh", "dateOfBirth": "3jvW0Qp3kTyL4CsL", "displayName": "wiWUMcpxn4B6XoTN", "languageTag": "MuqZTHwo1IAJQpb6", "skipLoginQueue": true, "uniqueDisplayName": "kut0wnT24wh59RGS", "userName": "bBMh7jpszuVk6iPd"}' \
    > test.out 2>&1
eval_tap $? 335 'AdminUpdateUserV4' test.out

#- 336 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'J2boQqCCyJfThvCJ' \
    --body '{"code": "ieqRSGN8Mm74HlSZ", "emailAddress": "zp4aEW4GkHG5OIVu"}' \
    > test.out 2>&1
eval_tap $? 336 'AdminUpdateUserEmailAddressV4' test.out

#- 337 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gv47XJpkMiopQrVL' \
    > test.out 2>&1
eval_tap $? 337 'AdminDisableUserMFAV4' test.out

#- 338 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '3ZZTVxqa9XM2gY14' \
    > test.out 2>&1
eval_tap $? 338 'AdminListUserRolesV4' test.out

#- 339 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iWk12Jffk8dwKNPU' \
    --body '{"assignedNamespaces": ["OHNZxML3yoBM9qxd", "6PWz7sVnMxge2inL", "8fBFP1ABaIKrEt8d"], "roleId": "3o7cTS9OIIMErnNT"}' \
    > test.out 2>&1
eval_tap $? 339 'AdminUpdateUserRoleV4' test.out

#- 340 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LXHrsOFsbhRow4ia' \
    --body '{"assignedNamespaces": ["YKy0IjsDgbJ37DN2", "lDvdh7okHl1wMht2", "Izq7TCUJhDsDefAS"], "roleId": "09VyQB1vR1mx6K17"}' \
    > test.out 2>&1
eval_tap $? 340 'AdminAddUserRoleV4' test.out

#- 341 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GL1CrO4ZuoGZSxTz' \
    --body '{"assignedNamespaces": ["m8oMSPIHPtqzIWIz", "g8pbjnt1iBV8Dpbj", "Gts4UZDTfhAyZKhq"], "roleId": "ilty9NVlgxUmnfdO"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminRemoveUserRoleV4' test.out

#- 342 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '55' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 342 'AdminGetRolesV4' test.out

#- 343 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "roleName": "8FkoxQbrPngi87K5"}' \
    > test.out 2>&1
eval_tap $? 343 'AdminCreateRoleV4' test.out

#- 344 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId '8pQswqKLutINusOs' \
    > test.out 2>&1
eval_tap $? 344 'AdminGetRoleV4' test.out

#- 345 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'a92F6iwkJIYOLarm' \
    > test.out 2>&1
eval_tap $? 345 'AdminDeleteRoleV4' test.out

#- 346 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'pWyvib9CDW21ANrl' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "roleName": "PXC2LfL2m5rP2A20"}' \
    > test.out 2>&1
eval_tap $? 346 'AdminUpdateRoleV4' test.out

#- 347 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 't6foPPH94SUinY5d' \
    --body '{"permissions": [{"action": 17, "resource": "8LHYivmD0ekycMKl", "schedAction": 46, "schedCron": "xJhk4EdTZ000rS92", "schedRange": ["594HLvWFsXHtMP0k", "9L5dREQbCqfh0gpA", "BFBER6WNcDOsRzBk"]}, {"action": 12, "resource": "SozCuFsrBMtoOeLf", "schedAction": 78, "schedCron": "zzQLZBktk0siMup0", "schedRange": ["1kyaFwwD7wecuQb4", "GNQHVZMKGBnzh4su", "aGIzttTncVBf5g3o"]}, {"action": 9, "resource": "GWKpItMt4GszRufk", "schedAction": 60, "schedCron": "Ss5YmIejozmG5Hlr", "schedRange": ["IfMAvvpkAHRJHZyf", "rXZmiJX4CjKCeIRI", "r997KKpJXTLbYWpq"]}]}' \
    > test.out 2>&1
eval_tap $? 347 'AdminUpdateRolePermissionsV4' test.out

#- 348 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'eXjaf1f5fjNMZjKJ' \
    --body '{"permissions": [{"action": 85, "resource": "5puX3197WrMnJtov", "schedAction": 91, "schedCron": "ugGX6mKBbgTD9xL0", "schedRange": ["7ZzzIs3Jke34ZAUu", "LP897ooMLnemwKAv", "gDXNrFEE4Jf4hQps"]}, {"action": 76, "resource": "YvyeHmfoFkUDP864", "schedAction": 37, "schedCron": "xbS5UOoICxQMit85", "schedRange": ["55Niy4NNFpRE5pS8", "5yTIRWvLRy58UKWP", "v3F7S0wCVlYQi9cf"]}, {"action": 79, "resource": "9ZBtzJ33tCwv8H1f", "schedAction": 77, "schedCron": "1FVZ630HNBYZSrz7", "schedRange": ["pMjESLLMPKDXLki6", "Oz5Bygt8Q0RjSf1s", "rB7hGwGbUmQmJHNf"]}]}' \
    > test.out 2>&1
eval_tap $? 348 'AdminAddRolePermissionsV4' test.out

#- 349 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'fZENs9X0hFMdzryv' \
    --body '["hc1YjHmmulSBIElc", "2CdRvBb0aGnMt625", "bWHb5sbX6asrjV7X"]' \
    > test.out 2>&1
eval_tap $? 349 'AdminDeleteRolePermissionsV4' test.out

#- 350 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'JUOtHlzXNHEPpzlM' \
    --after 'lx7b2H2THLwZGikW' \
    --before '7TFA9gE6SrYKq6lc' \
    --limit '98' \
    > test.out 2>&1
eval_tap $? 350 'AdminListAssignedUsersV4' test.out

#- 351 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'NoFR3GUxdMuvmL0U' \
    --body '{"assignedNamespaces": ["BfwzaaeP3Wd0Wrb8", "s3GW0CY0vAfbq8xo", "Curq4lpHXrbVBh60"], "namespace": "NUA2aKQwnXrmi6ya", "userId": "8u4sQPvaf1AcweR7"}' \
    > test.out 2>&1
eval_tap $? 351 'AdminAssignUserToRoleV4' test.out

#- 352 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'tJW3MLMob1hUnIzI' \
    --body '{"namespace": "pUM8KK1kGFN0NUNG", "userId": "KxdlAUDFQuGPzAuT"}' \
    > test.out 2>&1
eval_tap $? 352 'AdminRevokeUserFromRoleV4' test.out

#- 353 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["7M6OBrNwioKnXPVZ", "aDcXsV1TnsZioDiB", "gprzahPB0FKMa0Ye"], "emailAddresses": ["yNBQWUHDBnBeePkq", "g6Zt1Lr5BlO8K6LH", "4dSaa8XYHug51ZTo"], "isAdmin": false, "isNewStudio": true, "languageTag": "0N7Hvnuq1kJ1kpHc", "namespace": "QtnIc9z70LFQMI0o", "roleId": "ZuEjY0rNBbbB9txA"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminInviteUserNewV4' test.out

#- 354 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "vtRQvqJacXR2Rf4n", "country": "oXDFaEUkPUBnB0ZE", "dateOfBirth": "JH3ebM71Tg922xiB", "displayName": "gHSka0Pz7I1WkIa0", "languageTag": "oZ1nXpW1l70pcZgI", "skipLoginQueue": false, "uniqueDisplayName": "0Gax0iX05IT9Agsj", "userName": "l5NmnSHhxNmCe4tx"}' \
    > test.out 2>&1
eval_tap $? 354 'AdminUpdateMyUserV4' test.out

#- 355 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"mfaToken": "Y0MsPc9EMgf9JCJi"}' \
    > test.out 2>&1
eval_tap $? 355 'AdminDisableMyAuthenticatorV4' test.out

#- 356 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'EvhL8ZfwCVJW9ysp' \
    > test.out 2>&1
eval_tap $? 356 'AdminEnableMyAuthenticatorV4' test.out

#- 357 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 357 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 358 AdminGetMyBackupCodesV4
eval_tap 0 358 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 359 AdminGenerateMyBackupCodesV4
eval_tap 0 359 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 360 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"mfaToken": "UOyHC9eKeXzrvzBl"}' \
    > test.out 2>&1
eval_tap $? 360 'AdminDisableMyBackupCodesV4' test.out

#- 361 AdminDownloadMyBackupCodesV4
eval_tap 0 361 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 362 AdminEnableMyBackupCodesV4
eval_tap 0 362 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 363 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'lwzyC1aTWEmPgoy4' \
    > test.out 2>&1
eval_tap $? 363 'AdminGetBackupCodesV4' test.out

#- 364 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'TkpEw4Zeid4mRoFN' \
    > test.out 2>&1
eval_tap $? 364 'AdminGenerateBackupCodesV4' test.out

#- 365 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'xv10ckMQVjKk3bWJ' \
    > test.out 2>&1
eval_tap $? 365 'AdminEnableBackupCodesV4' test.out

#- 366 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code '0ZuYSe3sI0x2hc8v' \
    --factor 'aN1Off5gRZZMW3hu' \
    > test.out 2>&1
eval_tap $? 366 'AdminChallengeMyMFAV4' test.out

#- 367 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'AIzBPWBYKAEFTdlK' \
    --languageTag 'Nh6GTzKjsCqxx24Q' \
    > test.out 2>&1
eval_tap $? 367 'AdminSendMyMFAEmailCodeV4' test.out

#- 368 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"mfaToken": "M35bSkFrvGciNHb7"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminDisableMyEmailV4' test.out

#- 369 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'OY5YIpOLJW52uz3c' \
    > test.out 2>&1
eval_tap $? 369 'AdminEnableMyEmailV4' test.out

#- 370 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 370 'AdminGetMyEnabledFactorsV4' test.out

#- 371 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor '8pz63M0g4xXT5Ts4' \
    > test.out 2>&1
eval_tap $? 371 'AdminMakeFactorMyDefaultV4' test.out

#- 372 AdminGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyOwnMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 372 'AdminGetMyOwnMFAStatusV4' test.out

#- 373 AdminGetMyMFAStatusV4
eval_tap 0 373 'AdminGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 374 AdminInviteUserV4
eval_tap 0 374 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 375 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'e0uR47OzUGHeBKtp' \
    --linkingToken 'vyRNgjZkdDppvEJi' \
    --password 'UiDGXgh8BKcLqtRZ' \
    --username '93LuR8OEyICvwgwB' \
    > test.out 2>&1
eval_tap $? 375 'AuthenticationWithPlatformLinkV4' test.out

#- 376 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'FehwtdJLdn3R2wo8' \
    --extendExp  \
    --linkingToken 'beVQvgeP9qOHaLwY' \
    > test.out 2>&1
eval_tap $? 376 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 377 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'nXxrz7sLmP70LxN0' \
    --factor 'f3JA27Qz5SjzQfOL' \
    --mfaToken 'Yu9O46OOzz9p57qS' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 377 'Verify2faCodeV4' test.out

#- 378 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'pHerzO87cg7TqtMi' \
    --codeChallenge 'Qgi7Aj28qCRbwwZc' \
    --codeChallengeMethod 'S256' \
    --additionalData 'ZS1NMkrnHs1Iyhwq' \
    --clientId 'k140MolIrnlkRVbc' \
    --createHeadless  \
    --deviceId 'X435TDYpkk2Gza6D' \
    --macAddress 'rSycophHw3EoEECl' \
    --platformToken 'TO9SDKnMlnKW9jiN' \
    --serviceLabel '0.6228862717423218' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 378 'PlatformTokenGrantV4' test.out

#- 379 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'u9QVrMeD4bD8gISE' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'T2E6AacmZRXZm626' \
    --simultaneousTicket 'POXWVj3KP1mX0iYH' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'BU3Uk2tQm307IORT' \
    > test.out 2>&1
eval_tap $? 379 'SimultaneousLoginV4' test.out

#- 380 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'yHnLYDAAg1YA4kZU' \
    --codeChallengeMethod 'S256' \
    --additionalData 'vSRFLDSdj8elbtHv' \
    --clientId 'DU91DmHzwiqVPCJ5' \
    --clientSecret 'j18Ou3aY8nceFU5G' \
    --code 'KmcEKp8AQwqgJs6O' \
    --codeVerifier '0Qj0ccMkdz6zPz3B' \
    --extendNamespace 'VHAqp4O9XSjap24e' \
    --extendExp  \
    --loginQueueTicket 'syjh6Wc3migf2n6i' \
    --password 'Qyr5cb5YL6fwBiaV' \
    --redirectUri 'Pmmn0T5uzlmi2NY2' \
    --refreshToken '6xrkPPdg3pXjmtpN' \
    --username 'fCrIj9ntYo3dupUH' \
    --grantType 'urn:ietf:params:oauth:grant-type:login_queue_ticket' \
    > test.out 2>&1
eval_tap $? 380 'TokenGrantV4' test.out

#- 381 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'kSbTkHPMUvOAUXkw' \
    --code '36cr2WJQqS7Tq4YI' \
    > test.out 2>&1
eval_tap $? 381 'RequestTargetTokenResponseV4' test.out

#- 382 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yZAFQ6lZfa2jdNvp' \
    --rawPUID  \
    --body '{"platformUserIds": ["Wf32JS1av9VNpVLT", "0LvqcfSdO1nAjY5F", "vADb3GUQgci632w6"]}' \
    > test.out 2>&1
eval_tap $? 382 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 383 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "6JXSh0Z3SWISs1dY", "policyId": "rJKmx1BT6iLFQejN", "policyVersionId": "ZJNF2hm0TqBQprHn"}, {"isAccepted": true, "localizedPolicyVersionId": "eAmDxP23qstMuikK", "policyId": "c6VNU8570siWm3V9", "policyVersionId": "sirE0JOQxWeHypqC"}, {"isAccepted": true, "localizedPolicyVersionId": "glw0gdWoE4esuiDr", "policyId": "quccz4J6fFQezJ5E", "policyVersionId": "3iYHIknvPcJkjRev"}], "authType": "EMAILPASSWD", "country": "fiExpAgoK9YDq1x3", "dateOfBirth": "dkbJFDEBEOOvJ5BK", "displayName": "eipIldsgB4hOxb88", "emailAddress": "WgKSLIpneDQCfwuc", "password": "HRL3o2NstrL6TsJe", "passwordMD5Sum": "RcE7GuwKn63KIDTk", "uniqueDisplayName": "UCqbbHGJGOTvKKRT", "username": "HDntaFiufH2YR6QU", "verified": true}' \
    > test.out 2>&1
eval_tap $? 383 'PublicCreateTestUserV4' test.out

#- 384 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "dVB5a2XkS3XQfMuz", "policyId": "Zh4AhZRe2hgU56xt", "policyVersionId": "yJtnbTDXu7FbleSP"}, {"isAccepted": true, "localizedPolicyVersionId": "PcdOuq0m0rvakR8r", "policyId": "cwojLRjhcaJ56nGl", "policyVersionId": "YZ2tod2BGBXjNyRC"}, {"isAccepted": true, "localizedPolicyVersionId": "3jOGmROIqxqQ0gcN", "policyId": "eTflyvUh3w5Ztfwm", "policyVersionId": "OCKpFSMF0tfGIZCT"}], "authType": "EMAILPASSWD", "code": "86hGWKfO9MnoT3t9", "country": "9HmcxzjDhTrcBKtU", "dateOfBirth": "956hOg8oukDVdweG", "displayName": "0sFHxTHa2k60SzCq", "emailAddress": "Ugq1gLbcIMevTmC6", "password": "31p7q794bu49lINF", "passwordMD5Sum": "TtERAXT2h3hcQ2wV", "reachMinimumAge": true, "uniqueDisplayName": "ZbBTnNQnVUhA5Wnz", "username": "VZdj8tsyzC4QaLXp"}' \
    > test.out 2>&1
eval_tap $? 384 'PublicCreateUserV4' test.out

#- 385 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId '3o4TDraEEaDNJbVd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "VHevCjthJUb7jKuM", "policyId": "rFaoLulzp3sZxImV", "policyVersionId": "K5yh2LcM8LaMW0By"}, {"isAccepted": false, "localizedPolicyVersionId": "rP03bQaq1cT88H6R", "policyId": "CW8gJmGzDlqxtLsR", "policyVersionId": "2AGOiPhNt2IdH8aY"}, {"isAccepted": true, "localizedPolicyVersionId": "UT6mma833TDzk66i", "policyId": "x88sAUrXr7MXxCvy", "policyVersionId": "y7caxz4MQrODLNlx"}], "authType": "EMAILPASSWD", "code": "X5KjdNrEwfWo2Mwu", "country": "lLg4bsO4YHEYLjTS", "dateOfBirth": "NDf3zazm6p5Y1tkG", "displayName": "9WwU4Ty6Ch5QYyFj", "emailAddress": "uBquE7xssm4hxczs", "password": "kbSUbOZ9WNl3apJm", "passwordMD5Sum": "NAbl1g5ZmTTGYRbP", "reachMinimumAge": true, "uniqueDisplayName": "ey9pEz1TV5cUtPBs", "username": "w01i5Mf7WvbNSeeD"}' \
    > test.out 2>&1
eval_tap $? 385 'CreateUserFromInvitationV4' test.out

#- 386 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "NfUESLlwHv3JgteO", "country": "LyKp8a1VqxXnRhDd", "dateOfBirth": "9TGkO6aIYqftw1Sr", "displayName": "M2nhSEanfUYrMU6A", "languageTag": "43UKGpvC1cr5T1PS", "uniqueDisplayName": "XhduTWchzXDv3TAt", "userName": "BjP4HSuiYCbG0UyY"}' \
    > test.out 2>&1
eval_tap $? 386 'PublicUpdateUserV4' test.out

#- 387 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "UJmNL8p6AbdtU0CD", "emailAddress": "rlQpKB8qoel2QK3a"}' \
    > test.out 2>&1
eval_tap $? 387 'PublicUpdateUserEmailAddressV4' test.out

#- 388 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "SOYdmMDikc3Fjm9H", "country": "oQDemtiQvURYZCeF", "dateOfBirth": "30RT9rBgM8o7lxXq", "displayName": "7TkdM7FVDCBcvVeg", "emailAddress": "rZddP8lLQo6tHj4z", "password": "4cAM4LMJfWNZIxAg", "reachMinimumAge": true, "uniqueDisplayName": "qgvEtEs2LpE0qfbv", "username": "dU8hlDoC9FnxqBlP", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 388 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 389 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "zmzUW0vPj90jmLTt", "password": "5YQGawcomPoiYoQ1", "username": "f1AYq306Pysv4VPa"}' \
    > test.out 2>&1
eval_tap $? 389 'PublicUpgradeHeadlessAccountV4' test.out

#- 390 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "ZWolXypwucUqqqff"}' \
    > test.out 2>&1
eval_tap $? 390 'PublicDisableMyAuthenticatorV4' test.out

#- 391 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code '2iWi4yP3uqNcig6Y' \
    > test.out 2>&1
eval_tap $? 391 'PublicEnableMyAuthenticatorV4' test.out

#- 392 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 392 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 393 PublicGetMyBackupCodesV4
eval_tap 0 393 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 394 PublicGenerateMyBackupCodesV4
eval_tap 0 394 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 395 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "cDA8Z3g62oGYwkrj"}' \
    > test.out 2>&1
eval_tap $? 395 'PublicDisableMyBackupCodesV4' test.out

#- 396 PublicDownloadMyBackupCodesV4
eval_tap 0 396 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 397 PublicEnableMyBackupCodesV4
eval_tap 0 397 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 398 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'LI4EHJEEWgki9fbd' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetBackupCodesV4' test.out

#- 399 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'vUMDZeO4U55wdCpV' \
    > test.out 2>&1
eval_tap $? 399 'PublicGenerateBackupCodesV4' test.out

#- 400 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'pnENiTc9NESV22eR' \
    > test.out 2>&1
eval_tap $? 400 'PublicEnableBackupCodesV4' test.out

#- 401 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'BElD4K2Cy1tJcPAE' \
    --factor 'kCeV29QsQk100eu5' \
    > test.out 2>&1
eval_tap $? 401 'PublicChallengeMyMFAV4' test.out

#- 402 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'UcxuXXpt0YSPX04u' \
    > test.out 2>&1
eval_tap $? 402 'PublicRemoveTrustedDeviceV4' test.out

#- 403 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'EIdAwgDobopbdJeV' \
    --languageTag 'CiKs2vLyH9kcSBdk' \
    > test.out 2>&1
eval_tap $? 403 'PublicSendMyMFAEmailCodeV4' test.out

#- 404 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "7MwQzn28Le5neohq"}' \
    > test.out 2>&1
eval_tap $? 404 'PublicDisableMyEmailV4' test.out

#- 405 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'hCzroAzWQDve0Z2G' \
    > test.out 2>&1
eval_tap $? 405 'PublicEnableMyEmailV4' test.out

#- 406 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 406 'PublicGetMyEnabledFactorsV4' test.out

#- 407 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor '2N09VIbbsz24fQKD' \
    > test.out 2>&1
eval_tap $? 407 'PublicMakeFactorMyDefaultV4' test.out

#- 408 PublicGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyOwnMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 408 'PublicGetMyOwnMFAStatusV4' test.out

#- 409 PublicGetMyMFAStatusV4
eval_tap 0 409 'PublicGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 410 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZX6plErw0Gb0ceCb' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 411 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "phW4YMhJ0S50bez9", "emailAddress": "ZLHW882riiPfRQ3r", "languageTag": "J0f5lwXvRNDBnmL1", "namespace": "KQn77hiP1lzkzjYD", "namespaceDisplayName": "w6mLBordrJkD6vy6"}' \
    > test.out 2>&1
eval_tap $? 411 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE