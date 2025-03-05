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
echo "1..432"

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

#- 163 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '87' \
    --tagName 'fTkPy0fGvTGgfLKs' \
    > test.out 2>&1
eval_tap $? 163 'AdminQueryTagV3' test.out

#- 164 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "g0b1Bq78cE5O5pmP"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminCreateTagV3' test.out

#- 165 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'nbiPJ9j4vxmbH3rV' \
    --body '{"tagName": "aauufxkPHElug48T"}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateTagV3' test.out

#- 166 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'gfNu0rqXUOyToLPI' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteTagV3' test.out

#- 167 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'REGIKlJt3EP9kKwk' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserByEmailAddressV3' test.out

#- 168 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["jrJMki8jvc3P8Gwj", "g3IOH0SDHgYKqxJi", "FJdrmj5vhzgsJwex"]}' \
    > test.out 2>&1
eval_tap $? 168 'AdminBulkUpdateUsersV3' test.out

#- 169 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType '7wq8ZPlXNaUNgdY2' \
    --body '{"bulkUserId": ["vfJuje5cPnmGjTvY", "a5Pqx1K7qcAoijBP", "Ap6EPb988NzxrDKV"]}' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetBulkUserBanV3' test.out

#- 170 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["pULjjiw3NeVG4DJi", "9DaMrc0WFgKjE945", "x2CPVYYG9WvoGmAm"]}' \
    > test.out 2>&1
eval_tap $? 170 'AdminListUserIDByUserIDsV3' test.out

#- 171 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["vaVV5YfxnUNcwjr7", "gSGhnfuF4WZiQVIC", "VpWd3UM08gMXhdf3"]}' \
    > test.out 2>&1
eval_tap $? 171 'AdminBulkGetUsersPlatform' test.out

#- 172 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["juXW4JprIb3CJCAt", "vSG8Cfa9dzOJDGCT", "HIOFjeXbsSgR43kI"], "isAdmin": true, "languageTag": "80JfMpPrSqYypRUn", "namespace": "q5o4ETeCUYG9ccTt", "roles": ["7Wxw8OQ13t3uTw6z", "QuoZcXQpoTOxe8y1", "jorNsg9ZKYCKoISy"]}' \
    > test.out 2>&1
eval_tap $? 172 'AdminInviteUserV3' test.out

#- 173 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '39' \
    --platformUserId 'cJ7DQIi45aCDHN9m' \
    --platformId 'Vug2zkVf6KgpKOcn' \
    > test.out 2>&1
eval_tap $? 173 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 174 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 174 'AdminListUsersV3' test.out

#- 175 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'MD9UT67bOwugFDa6' \
    --endDate 'wUQvehKqwCh86XmR' \
    --includeTotal  \
    --limit '21' \
    --offset '59' \
    --platformBy 'EOEAEtbag82KgBgy' \
    --platformId 'Cd5vjkfz3eR4DtNp' \
    --query '129hzBw3xLUcCEt0' \
    --roleIds 'DzmkJq1sml5bYt76' \
    --skipLoginQueue  \
    --startDate 'BNsi4giR9434WpKK' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 175 'AdminSearchUserV3' test.out

#- 176 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["dzxoufCNlFoOcWQQ", "y4bjmQeEweoBHTdw", "Ak7ZQnbqY1cQwVEt"]}' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetBulkUserByEmailAddressV3' test.out

#- 177 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ar5kKKAo9MM2Cqm8' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetUserByUserIdV3' test.out

#- 178 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4jVi9kIpqgrzpUkN' \
    --body '{"avatarUrl": "OBWydXV0Fi02aFr8", "country": "CDapjwNOl4k8rVNr", "dateOfBirth": "m8drv8QD2JOe2Ntz", "displayName": "7EFvowPgIGuetxFM", "languageTag": "qXCQMAqQ2ZRGzNtr", "skipLoginQueue": true, "tags": ["hFa9XU8mosluiHZJ", "7O8sAQ32wj9uaDzs", "r9xYiWRuuzQJiLc1"], "uniqueDisplayName": "eI9w3JEhxPGbEk7s", "userName": "7gw07FlounC3vJKB"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserV3' test.out

#- 179 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'C7SwgoViPeIB4Ehy' \
    --activeOnly  \
    --after '0Y5aSJVDginxAM77' \
    --before 'eY9C14FbfiI2NPvl' \
    --limit '22' \
    > test.out 2>&1
eval_tap $? 179 'AdminGetUserBanV3' test.out

#- 180 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sB0HsJ06DzfbzRYt' \
    --body '{"ban": "4OVUyumBeIqdQGZC", "comment": "5kM03HHijsQRj7N8", "endDate": "IAjmsonjj0ZR50BQ", "reason": "1U6aFD3O2kXQSc58", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 180 'AdminBanUserV3' test.out

#- 181 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rELQ1btjJOqQMgZW' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetUserBanSummaryV3' test.out

#- 182 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'AU6E92nHJzvw7tnY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tGfv0EJyjBu4EzwR' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateUserBanV3' test.out

#- 183 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'n73m0jiaDH86d9rs' \
    --body '{"context": "KgzCsMulpB8HZUtV", "emailAddress": "VaJCiLgKOwrSfWhT", "languageTag": "5B4WedopzwSluBtR", "upgradeToken": "FPKThyGnbjmPDKFS"}' \
    > test.out 2>&1
eval_tap $? 183 'AdminSendVerificationCodeV3' test.out

#- 184 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6u9FHuv1M3qfch4S' \
    --body '{"Code": "qIV6LQPHlaeYl4cs", "ContactType": "Fq65cU66yJaj4ovo", "LanguageTag": "KWE4EW0sw8v5peiu", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 184 'AdminVerifyAccountV3' test.out

#- 185 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'IghoQBp2mWAOYksc' \
    > test.out 2>&1
eval_tap $? 185 'GetUserVerificationCode' test.out

#- 186 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zxBS0OBCa2vWadLm' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetUserDeletionStatusV3' test.out

#- 187 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QtYKmEMzicbuL2S3' \
    --body '{"deletionDate": 89, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateUserDeletionStatusV3' test.out

#- 188 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iW8dLTCBfGUdVEdv' \
    > test.out 2>&1
eval_tap $? 188 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 189 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dQL7sVwcZ2PofaJo' \
    --body '{"code": "SqtrEOqxH46fRTSZ", "country": "oDdT0fefo74eg3Nt", "dateOfBirth": "2c0r4GqF0NHglOVu", "displayName": "NZ9LzNeJnBurh54C", "emailAddress": "WbYb0Pebyt8b4DGs", "password": "cjwrizsFUgYwbaLv", "uniqueDisplayName": "qvQ2NbmDITuymTBj", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpgradeHeadlessAccountV3' test.out

#- 190 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JBcGp9Rx2RfcRhXp' \
    > test.out 2>&1
eval_tap $? 190 'AdminDeleteUserInformationV3' test.out

#- 191 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'meeHdvphas9S7ivH' \
    --after '0.49865116690803823' \
    --before '0.2329929276149565' \
    --limit '76' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetUserLoginHistoriesV3' test.out

#- 192 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oIbVi2CLEk277Ivj' \
    --body '{"languageTag": "j1A647XQ3koaAfZI", "mfaToken": "im0sFPm1YN27bojD", "newPassword": "VaZLpx4kEWYkO6Kr", "oldPassword": "KUMhJrASBh61hmWK"}' \
    > test.out 2>&1
eval_tap $? 192 'AdminResetPasswordV3' test.out

#- 193 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SSrF35anDGvur19V' \
    --body '{"Permissions": [{"Action": 56, "Resource": "8oIrUKXttgAI2QdW", "SchedAction": 72, "SchedCron": "Fpff28uYbe4Cf2HE", "SchedRange": ["HvVevhISjbtBJUK5", "fE3OufPSX3PdOU2V", "9yw94oa8UJ34TIed"]}, {"Action": 98, "Resource": "QJWszvTQEuALzDNp", "SchedAction": 47, "SchedCron": "SZ58aDllwzTRHak1", "SchedRange": ["MXxj7Esrg7900nml", "5BidsK9dCEzhVnOv", "0PQbVIaKiHfoeorY"]}, {"Action": 3, "Resource": "A1otGFyv2SMjbEr5", "SchedAction": 31, "SchedCron": "qGdCZIc6EFqBKxbS", "SchedRange": ["7Q2OgRucL1jwRXzf", "jDZZBmOau6syme06", "c6SKLc2mEC3IXl5X"]}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminUpdateUserPermissionV3' test.out

#- 194 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CbkOfHaGr5kdazly' \
    --body '{"Permissions": [{"Action": 32, "Resource": "MB6jzrpRGESmooHi", "SchedAction": 58, "SchedCron": "qxj4hBgVY3YAxZLK", "SchedRange": ["bcOdyjqf6Q4oiwoJ", "caRMEb15LBlTVufc", "5ZyODR2NVyn4PRqf"]}, {"Action": 94, "Resource": "eRbZqBAoKGcVCdMi", "SchedAction": 91, "SchedCron": "XAn3bWQF6QcAiJpX", "SchedRange": ["IrgroixptZhckUTG", "kcBOE4qMcH1Kyi8Z", "FvGcV8DY0XOkDstx"]}, {"Action": 46, "Resource": "cY1HgAnZV4IOglVL", "SchedAction": 34, "SchedCron": "Yc481dYdvGxJAMDR", "SchedRange": ["A1LF7jdWlekFwO94", "VBCV9qJhWva2FPBu", "jX0geYCpGJM4sqsP"]}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminAddUserPermissionsV3' test.out

#- 195 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NJMiZXXOFwmGWAvN' \
    --body '[{"Action": 65, "Resource": "PpWgrQD4hEk0OLjY"}, {"Action": 38, "Resource": "rknH0Y5mrQgLC6D2"}, {"Action": 33, "Resource": "RRYMNXWUsp1tOibJ"}]' \
    > test.out 2>&1
eval_tap $? 195 'AdminDeleteUserPermissionBulkV3' test.out

#- 196 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '10' \
    --namespace "$AB_NAMESPACE" \
    --resource 'aL9ie6vvMbiNURrl' \
    --userId 'm88QlKyuoya4Jgak' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserPermissionV3' test.out

#- 197 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZyUV7t73VnSFbuxd' \
    --after '4KYZ0jk0UZdhtnKu' \
    --before '9oTc8pVkiyGsj5Jd' \
    --limit '61' \
    --platformId 'zRxfNEjUMTs8WIOb' \
    --targetNamespace 'JBTsvsw76uISRX0b' \
    > test.out 2>&1
eval_tap $? 197 'AdminGetUserPlatformAccountsV3' test.out

#- 198 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KVoWtoUW1P7ocuBA' \
    --status 'ldDSUS7Haa6unq1y' \
    > test.out 2>&1
eval_tap $? 198 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 199 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'QOSRvyiLBRVtIDi2' \
    > test.out 2>&1
eval_tap $? 199 'AdminGetListJusticePlatformAccounts' test.out

#- 200 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'piIQFVmzMidw70KS' \
    --userId 'ahpYZdKZRyR9AX7J' \
    > test.out 2>&1
eval_tap $? 200 'AdminGetUserMapping' test.out

#- 201 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'jxvNZhM84DiZk6yS' \
    --userId 'rB9SVFctW7YS0OkL' \
    > test.out 2>&1
eval_tap $? 201 'AdminCreateJusticeUser' test.out

#- 202 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '78XeEAtALFI3v8yh' \
    --skipConflict  \
    --body '{"platformId": "a4pd5A7MYcpBD6lK", "platformUserId": "Nb8RxvN2u5J7baOe"}' \
    > test.out 2>&1
eval_tap $? 202 'AdminLinkPlatformAccount' test.out

#- 203 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LH19fqBwNbNe1ffY' \
    --platformId 'RtIvQaKyevWYtZjK' \
    > test.out 2>&1
eval_tap $? 203 'AdminGetUserLinkHistoriesV3' test.out

#- 204 AdminPlatformUnlinkV3
eval_tap 0 204 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 205 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6J29v8MpBSpo3AKR' \
    --userId 'mnJkzJHAckUyBksY' \
    > test.out 2>&1
eval_tap $? 205 'AdminPlatformUnlinkAllV3' test.out

#- 206 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QfDm0RNFwiz70tRV' \
    --userId 'LMlHi8i9gOVqajUW' \
    --ticket 'rgEsWDtaKzn8dZwn' \
    > test.out 2>&1
eval_tap $? 206 'AdminPlatformLinkV3' test.out

#- 207 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 207 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 208 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nGeZsZVgbPzPFbrO' \
    --userId 'MZMgWkFN7Tpkx6Gc' \
    > test.out 2>&1
eval_tap $? 208 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 209 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fyOg6ZUrrp9ubg9m' \
    --userId 'ndW2JKmQafUs2bxY' \
    --platformToken 'ztOEyVbKIf1ZbzgU' \
    > test.out 2>&1
eval_tap $? 209 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 210 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wd8DHoCQykmXHYmk' \
    --userId 'Rlg7gYs6unPYQ9jN' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 210 'AdminGetUserSinglePlatformAccount' test.out

#- 211 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QN1di1ldhOh6Hvjn' \
    --body '["YuV7NfC4A2ODiZhb", "fb8QqCyK1XH9D6vl", "5eFdFfgK46GjCWaP"]' \
    > test.out 2>&1
eval_tap $? 211 'AdminDeleteUserRolesV3' test.out

#- 212 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8huTmnq3FGQn3Ahu' \
    --body '[{"namespace": "5wxq6oJq4mChmQHQ", "roleId": "hO9IKBXDFQfXFD58"}, {"namespace": "sG6uDhFYlrzJBYSe", "roleId": "MuJfQecutjS029Bi"}, {"namespace": "JWOG1m7MKclr5igj", "roleId": "NTVItrH2X78hxJga"}]' \
    > test.out 2>&1
eval_tap $? 212 'AdminSaveUserRoleV3' test.out

#- 213 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'Vfw5Vnyq8OzTE89W' \
    --userId 'DNoMcOmbfJrCJQIj' \
    > test.out 2>&1
eval_tap $? 213 'AdminAddUserRoleV3' test.out

#- 214 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '1haAosKglqaCXE9y' \
    --userId 'tpIO8btO3OwNEGSW' \
    > test.out 2>&1
eval_tap $? 214 'AdminDeleteUserRoleV3' test.out

#- 215 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5TaW4to7QCY2NGGv' \
    > test.out 2>&1
eval_tap $? 215 'AdminGetUserStateByUserIdV3' test.out

#- 216 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'i9kg3rMIzNmhJTNQ' \
    --body '{"enabled": false, "reason": "q86IaDFjjx6uZerW"}' \
    > test.out 2>&1
eval_tap $? 216 'AdminUpdateUserStatusV3' test.out

#- 217 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'btwTX9gNRByjbE8l' \
    --body '{"emailAddress": "OLAfTXKLzbrddqcK", "password": "La7LevxNHOSEhQRZ"}' \
    > test.out 2>&1
eval_tap $? 217 'AdminTrustlyUpdateUserIdentity' test.out

#- 218 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ip693lRwtc43atCu' \
    > test.out 2>&1
eval_tap $? 218 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 219 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'CFxbfbz4aQERziPL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "4dHhOqG5KDdUvk0L"}' \
    > test.out 2>&1
eval_tap $? 219 'AdminUpdateClientSecretV3' test.out

#- 220 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'Ei26Ls7mjRxNmvvN' \
    > test.out 2>&1
eval_tap $? 220 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 221 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'tjJNQepUTGhwlY4l' \
    --before 'PzlsCR5rVsyfcH7W' \
    --isWildcard  \
    --limit '19' \
    > test.out 2>&1
eval_tap $? 221 'AdminGetRolesV3' test.out

#- 222 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "managers": [{"displayName": "skqeUB7RSayqGFgu", "namespace": "hh3bvadRthdbVApe", "userId": "bRA09rW8i8krFWJh"}, {"displayName": "e03coRFok5d3AyGr", "namespace": "ZO8GuoXNSoVEBG7V", "userId": "bBPUWipz9C05YabF"}, {"displayName": "X4FCK5ucTFsAFzaO", "namespace": "3yJpA3KMxBlrRytE", "userId": "R1qdTelFAadM9y66"}], "members": [{"displayName": "Drf4SSGGt3MiBKoh", "namespace": "ow3kKoaP1K4CDuH1", "userId": "mMIfOCDyVAHrHncR"}, {"displayName": "5dShqiBUI9esSsXe", "namespace": "gSEhrPpK2q8kxR4B", "userId": "uEksS2A9VOA8H9Ve"}, {"displayName": "Hv0L2Acm960EYQEu", "namespace": "GJVl8xs1WId9Wlal", "userId": "qshF9Rh2o7GCQGPC"}], "permissions": [{"action": 48, "resource": "8T4QHK30EX0FclpD", "schedAction": 23, "schedCron": "112ISArROIodcmM6", "schedRange": ["v2AEozWWaYvBLE46", "bpuJip8JyxJ39vrt", "uWWrqTZbSqBSKp8A"]}, {"action": 25, "resource": "kZQY8CNyT4k3DIbf", "schedAction": 94, "schedCron": "63OHpnUCGBVfpctN", "schedRange": ["FUsUQ6ZXQcb2o1J5", "euLAbBgejqc0apxq", "Z209BySn8aUaGlAy"]}, {"action": 45, "resource": "XCISQdwec1m8BusV", "schedAction": 40, "schedCron": "MfqUZXkjHvcUOTlx", "schedRange": ["Nf09pefgFIiJssSh", "BKsQjXvfQgQDt6ce", "8NDMErA82FrR1GSo"]}], "roleName": "gkewIzTOqKkcjRh3"}' \
    > test.out 2>&1
eval_tap $? 222 'AdminCreateRoleV3' test.out

#- 223 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'l2gAJOTCbx7J3gNL' \
    > test.out 2>&1
eval_tap $? 223 'AdminGetRoleV3' test.out

#- 224 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'IlTk3Bpclrk4hIRn' \
    > test.out 2>&1
eval_tap $? 224 'AdminDeleteRoleV3' test.out

#- 225 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId '0znIKzAEAHQpBOgH' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "P5l94s7CbIJ7eHnV"}' \
    > test.out 2>&1
eval_tap $? 225 'AdminUpdateRoleV3' test.out

#- 226 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'WOboMkyB7FTexsOZ' \
    > test.out 2>&1
eval_tap $? 226 'AdminGetRoleAdminStatusV3' test.out

#- 227 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId '0b2p3b63KrcwIcXM' \
    > test.out 2>&1
eval_tap $? 227 'AdminUpdateAdminRoleStatusV3' test.out

#- 228 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'hGy83Xit6boOLGCc' \
    > test.out 2>&1
eval_tap $? 228 'AdminRemoveRoleAdminV3' test.out

#- 229 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'g16DqwdQPQ9HkSSV' \
    --after '8e1MgTTLS2FgarY9' \
    --before '03INGIyEfRBEj7qm' \
    --limit '38' \
    > test.out 2>&1
eval_tap $? 229 'AdminGetRoleManagersV3' test.out

#- 230 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId '9OHgfHumyfuBNise' \
    --body '{"managers": [{"displayName": "cYbcOpR45VDlvSc0", "namespace": "Mr7ImwCwGqOf0bNs", "userId": "97KvKyj3MqS7Dcmt"}, {"displayName": "fh50eObbrmgjhWK0", "namespace": "x0ZidAJ1CU1eD1La", "userId": "16Bw3JbUnUDh5yGj"}, {"displayName": "jv4Mwrv2vancmR6Z", "namespace": "7rb21A2E9pX0BWCM", "userId": "qPsRk5htdM5T3fDS"}]}' \
    > test.out 2>&1
eval_tap $? 230 'AdminAddRoleManagersV3' test.out

#- 231 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'rSHrkoqv2mM6soMa' \
    --body '{"managers": [{"displayName": "TvQq2a9YdFNtRVSO", "namespace": "0js0hG9xmSnzd7zg", "userId": "UxAogcnGkXk17QPk"}, {"displayName": "JHRhmLKQuQVFSKiX", "namespace": "l8G2uf6E8EajXLSA", "userId": "S8MKMaxQ1QyJCpKe"}, {"displayName": "dhuzI7G9NCKKXu1b", "namespace": "qI2M5PmXfKnQ7BYG", "userId": "jCUDMOrbmoRvWnfm"}]}' \
    > test.out 2>&1
eval_tap $? 231 'AdminRemoveRoleManagersV3' test.out

#- 232 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'GFy0eUoOBd90h9ED' \
    --after 'qSTOfoNewWjwMWDK' \
    --before 'Et6JhbJ0fwTDaq6b' \
    --limit '26' \
    > test.out 2>&1
eval_tap $? 232 'AdminGetRoleMembersV3' test.out

#- 233 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'RpMwhWPtndriXU9l' \
    --body '{"members": [{"displayName": "oOxpmEuwDVc12r0D", "namespace": "VUGgGHkapTCafFMd", "userId": "vYiCBuzUUwyI6Vtd"}, {"displayName": "4v9k4fv3kMiuQ3Dh", "namespace": "sKLxjt5srPFxBgpF", "userId": "tDBmTLH9kP9U53z6"}, {"displayName": "joBAhAlJGI2YYb6a", "namespace": "jBjgq6eY4PBNHKPx", "userId": "62tHxDb06ZFy3ugl"}]}' \
    > test.out 2>&1
eval_tap $? 233 'AdminAddRoleMembersV3' test.out

#- 234 AdminRemoveRoleMembersV3
eval_tap 0 234 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 235 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'Sp2UxvF2uLXWilRD' \
    --body '{"permissions": [{"action": 68, "resource": "uxgVLGgK8aVSCN6o", "schedAction": 58, "schedCron": "LvcnGMJbJIYLssMv", "schedRange": ["y9gkfTMRrXVRcAVR", "DX6gmDfNfPGYYSTu", "nMgt3C8hEguCqlMH"]}, {"action": 17, "resource": "wDudnGRufOUGfMjT", "schedAction": 95, "schedCron": "Q24meDrwEuTyM2qo", "schedRange": ["hglzO8AEl6A9sh2x", "2ur2ccp7R7OqPqIj", "S4i0N9ytb3c8pVZ8"]}, {"action": 66, "resource": "eeBsJEvBbAvCmlh6", "schedAction": 72, "schedCron": "1oz9BaixUUvmzbaj", "schedRange": ["E2gjooiDnc1NUb51", "lEgUwQ9tkWaMOH47", "CAT7cBP0918JaEBQ"]}]}' \
    > test.out 2>&1
eval_tap $? 235 'AdminUpdateRolePermissionsV3' test.out

#- 236 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'BP766LUnBBR84iAO' \
    --body '{"permissions": [{"action": 67, "resource": "sBQt6YJ2tWwF7RnP", "schedAction": 32, "schedCron": "oK3c4RVfjB0zi3Xr", "schedRange": ["YZUiN24ol1qqbalg", "izL97ycJV5YqE2my", "Qzl7X9fHr6WvBxmB"]}, {"action": 44, "resource": "E9nbE2PMv12ZSRJk", "schedAction": 43, "schedCron": "akPt7IYzaZUTmvsE", "schedRange": ["zLPnnGsnfmBerp84", "qjwzWpCF1vyamjsE", "zwtLPxK1os4qR8La"]}, {"action": 88, "resource": "JyL72WDyhBsCCbnf", "schedAction": 17, "schedCron": "HLsXHlm1RJTTy9Jr", "schedRange": ["Nz1K5M1qgFddYvif", "GHawNx6yhniEHLbE", "QKc0aUvrKXDIjYC4"]}]}' \
    > test.out 2>&1
eval_tap $? 236 'AdminAddRolePermissionsV3' test.out

#- 237 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'df9qswSlpCI8Dhjl' \
    --body '["xUyrs3OSesE5p0Dw", "Uj2HKUvPYUcQBxMS", "dOOsn2Nd8Jpa19GJ"]' \
    > test.out 2>&1
eval_tap $? 237 'AdminDeleteRolePermissionsV3' test.out

#- 238 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '61' \
    --resource 'IadKDEZywonA2SrE' \
    --roleId 'dN2tmGuX6r0gBVUU' \
    > test.out 2>&1
eval_tap $? 238 'AdminDeleteRolePermissionV3' test.out

#- 239 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 239 'AdminGetMyUserV3' test.out

#- 240 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'eKKlPKtE6gnYxmkm' \
    --extendExp  \
    --redirectUri 'CWbs5qugklBUS6uw' \
    --password 'WrCQt86Jrg8tLAJW' \
    --requestId 'pcyNkUvqn6eXr6FN' \
    --userName 'bKJ05Orya6LSSUlu' \
    > test.out 2>&1
eval_tap $? 240 'UserAuthenticationV3' test.out

#- 241 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'gIAknXcSaVYcAYp7' \
    --linkingToken 'qSiDvsfMUOpWv46s' \
    --password 'XvpOjrpRo4mYrCeQ' \
    --username 'UnYoID2UqO0iAXA9' \
    > test.out 2>&1
eval_tap $? 241 'AuthenticationWithPlatformLinkV3' test.out

#- 242 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'dB4ib8HDOJ8TNiP8' \
    --linkingToken 'KgEAj3dbRTI0i6dO' \
    --password '3zkbDseh4tJdoGcw' \
    --username 'MBmegqVUaWMJBjrV' \
    > test.out 2>&1
eval_tap $? 242 'AuthenticateAndLinkForwardV3' test.out

#- 243 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData '0p9A7tcHrV0MbJGr' \
    --extendExp  \
    --linkingToken '4drgkDuWS05m0pGz' \
    > test.out 2>&1
eval_tap $? 243 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 244 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri 'azM2BUXnzUEWTiKM' \
    --state 'JAf6AgbiEDMfCckW' \
    --platformId 'ogE5gcfF8AMGZ2FB' \
    > test.out 2>&1
eval_tap $? 244 'RequestOneTimeLinkingCodeV3' test.out

#- 245 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'S93Mg6TKwdRMraDL' \
    > test.out 2>&1
eval_tap $? 245 'ValidateOneTimeLinkingCodeV3' test.out

#- 246 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'rwh3d0ykRGkgqUNI' \
    --isTransient  \
    --clientId 'bJMJ9ABbKVWO2YED' \
    --oneTimeLinkCode 'iqkwKbpdk7wlDngN' \
    > test.out 2>&1
eval_tap $? 246 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 247 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 247 'GetCountryLocationV3' test.out

#- 248 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 248 'Logout' test.out

#- 249 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'iPPjpSAlZwFGpea5' \
    --codeChallengeMethod 'S256' \
    --clientId 'dbYCRexPekTsQxMT' \
    > test.out 2>&1
eval_tap $? 249 'RequestTokenExchangeCodeV3' test.out

#- 250 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'faSot7aohFYy4Vxw' \
    --userId 'HIJ9gzxqAw4vBGQA' \
    --platformUserId 'eh0VTiTP4PSrXUS6' \
    > test.out 2>&1
eval_tap $? 250 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 251 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jYI9lsQFD43Df5qU' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 251 'RevokeUserV3' test.out

#- 252 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'ZOFzpFd6b5Jc5TET' \
    --codeChallenge 'Hcup8GG0VCMTFJ6s' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'Hq4bBb0n1JhPUS8B' \
    --oneTimeLinkCode 'RPGV9n769zLJdKMe' \
    --redirectUri 'xeJc7NvgTSgKjCxZ' \
    --scope 'jKf8NA4cGUaDfy9X' \
    --state 'nH2r0EKrk5VlnKsW' \
    --targetAuthPage 'CPccAFn5CEPoH6op' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'K5DSO8JyX4IE1z3r' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 252 'AuthorizeV3' test.out

#- 253 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'NNqLyrlzrJ4QHbfn' \
    > test.out 2>&1
eval_tap $? 253 'TokenIntrospectionV3' test.out

#- 254 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 254 'GetJWKSV3' test.out

#- 255 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'AdtkujxHff7n1yaN' \
    --factor 'CcjgFhS0URBhl0L5' \
    --mfaToken 'FCbOn46W2B2uPQLr' \
    > test.out 2>&1
eval_tap $? 255 'SendMFAAuthenticationCode' test.out

#- 256 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 't2t6bVpCgKvPXSDu' \
    --mfaToken 'fmKh783cV54JsVBR' \
    > test.out 2>&1
eval_tap $? 256 'Change2faMethod' test.out

#- 257 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'B0rY0xfWddACyHSm' \
    --factor 'o4KX9TPO3K1k5ZM8' \
    --mfaToken 'btmGsgXNXbpqxh76' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 257 'Verify2faCode' test.out

#- 258 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'Af5JSwjw2fE2g6jX' \
    --factors 'V7oai2oDm9FaP0HJ' \
    --rememberDevice  \
    --clientId '98tE4UyoQg0b0sGO' \
    --code 'kzxVt15LKmkQ7YBh' \
    --factor 'sOuJ0ypkkt2G4eFh' \
    --mfaToken '2YNsdoxpLTBM9Q8t' \
    > test.out 2>&1
eval_tap $? 258 'Verify2faCodeForward' test.out

#- 259 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '829Ido1JyveSRiBq' \
    --userId '23kyH9jQbHWkcVk0' \
    > test.out 2>&1
eval_tap $? 259 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 260 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'X28GS54vl7gIKBc7' \
    --clientId 'OYTylFRAJKySnC0c' \
    --redirectUri 'fPl3Z2zSBbs4PAV7' \
    --requestId '2u8AxE2IQeoxYV4U' \
    > test.out 2>&1
eval_tap $? 260 'AuthCodeRequestV3' test.out

#- 261 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'cYzswAGpXqQxctuV' \
    --additionalData 'aqPJGAHEZmuQrZ8G' \
    --clientId 'aQ4OZ2nDodm4TNs8' \
    --createHeadless  \
    --deviceId 'mAj6IKSYFdJwgZsR' \
    --macAddress 'POzwuDSdGl1A2vaN' \
    --platformToken 'eDiSqTfmAVg50kOd' \
    --serviceLabel '0.5728517752536361' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 261 'PlatformTokenGrantV3' test.out

#- 262 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 262 'GetRevocationListV3' test.out

#- 263 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'agEmTuaxlxgywkbd' \
    > test.out 2>&1
eval_tap $? 263 'TokenRevocationV3' test.out

#- 264 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'OsyxX1tfW488oYUT' \
    --simultaneousTicket '4jyCVJ0V8obTlGVT' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'm7Y3wiNloJfey3HX' \
    > test.out 2>&1
eval_tap $? 264 'SimultaneousLoginV3' test.out

#- 265 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'L6SjljNPTXA3qbg5' \
    --clientId '5SyienCODZ0mnOpP' \
    --clientSecret 'TVxEgBFzG8tlkxWK' \
    --code 'CU1XN4gl7yHvEqpJ' \
    --codeVerifier 'SrDXVwCkhOQ161TF' \
    --extendNamespace 'jROYJm75VIuCOCkt' \
    --extendExp  \
    --password '2W1DfI8QtgODk9K6' \
    --redirectUri 'DcMnyCPn1FylWdaN' \
    --refreshToken 'V1VaZTkbbuWiiA4U' \
    --scope 'TDgS2SVEo5M80LLb' \
    --username 'ku9GYH4ijqOVM50t' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 265 'TokenGrantV3' test.out

#- 266 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'DPbklTHcmgXsrVj3' \
    > test.out 2>&1
eval_tap $? 266 'VerifyTokenV3' test.out

#- 267 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'Mjml6BpCODWGOLMm' \
    --code 'CZUeelXYyNrXweiC' \
    --error 'nDldRPRfd6mLZ0GT' \
    --openidAssocHandle 'JwEjoZrRtaeWKMC8' \
    --openidClaimedId 'wsOByQAMAgqFEzEt' \
    --openidIdentity '8umj5XhKnw7MHDwF' \
    --openidMode 'VKUC2ecnpUDqvLQi' \
    --openidNs 'xPKVSmWa8TGko16X' \
    --openidOpEndpoint 'TqHc0cM7ixq8Tjnx' \
    --openidResponseNonce 'p5Cl8ggaEmCcuK2h' \
    --openidReturnTo 'HviBEWpbusO6EyVq' \
    --openidSig 'stpgZpbz77y88rUF' \
    --openidSigned 'um2ZcA8iKcF0bkfj' \
    --state 'cTEFXcTwEtnHxP5p' \
    > test.out 2>&1
eval_tap $? 267 'PlatformAuthenticationV3' test.out

#- 268 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'VtN4jNVIdruEA39u' \
    --platformToken 'CJzsE8WObt6t0w8L' \
    > test.out 2>&1
eval_tap $? 268 'PlatformTokenRefreshV3' test.out

#- 269 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'OBxE15JYj4IqWK09' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetInputValidations' test.out

#- 270 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'l4wkrzahXR1sDEDV' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetInputValidationByField' test.out

#- 271 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'KDINE3HjCiVR1dQ8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 271 'PublicGetCountryAgeRestrictionV3' test.out

#- 272 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'kuhb4pUwnGptHUpl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 272 'PublicGetConfigValueV3' test.out

#- 273 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCountryListV3' test.out

#- 274 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 274 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 275 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'xzaDa9PDwhu31d8e' \
    > test.out 2>&1
eval_tap $? 275 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 276 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 276 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 277 PublicGetUserByPlatformUserIDV3
eval_tap 0 277 'PublicGetUserByPlatformUserIDV3 # SKIP deprecated' test.out

#- 278 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'username' \
    > test.out 2>&1
eval_tap $? 278 'PublicGetProfileUpdateStrategyV3' test.out

#- 279 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'dtrfq6ECDD6OGkuL' \
    > test.out 2>&1
eval_tap $? 279 'PublicGetAsyncStatus' test.out

#- 280 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 's9gNpNon6DKW9A6A' \
    --limit '25' \
    --offset '27' \
    --platformBy 'd3nuUZ41mSeS9SnG' \
    --platformId 'qhJOvykBcDpzD9zh' \
    --query '6dtPK4fVHLMvrCsH' \
    > test.out 2>&1
eval_tap $? 280 'PublicSearchUserV3' test.out

#- 281 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "3RYxH2Up9VthPjFr", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "Hip0eONFDgUPShG8", "policyId": "wwFKY9AMpcwJd4Sr", "policyVersionId": "igIxAhbFMZfxaznl"}, {"isAccepted": true, "localizedPolicyVersionId": "ZgQEvFzox9wHocX3", "policyId": "DRWobEoGr8W97KBe", "policyVersionId": "dcr6PM51z7i0wQ9e"}, {"isAccepted": false, "localizedPolicyVersionId": "8GENEJYPKxxOw7xN", "policyId": "Q98IEbc9YITN98j4", "policyVersionId": "P2AGeidXRRnIAJfK"}], "authType": "VjOn6rtILNJVv2DL", "code": "LUyBt5hDs45siG30", "country": "Lv9iGa5mkZjnRXVc", "dateOfBirth": "g6AByNpBo2JYkwLd", "displayName": "mR97u9MVUii4KpYc", "emailAddress": "b1AUsESaBOTHnbX9", "password": "tC9PQlFAGbMtEybf", "reachMinimumAge": false, "uniqueDisplayName": "4CsLwiWUMcpxn4B6"}' \
    > test.out 2>&1
eval_tap $? 281 'PublicCreateUserV3' test.out

#- 282 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'XoTNMuqZTHwo1IAJ' \
    --query 'Qpb6r8ZeaSHwQuiH' \
    > test.out 2>&1
eval_tap $? 282 'CheckUserAvailability' test.out

#- 283 PublicBulkGetUsers
eval_tap 0 283 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 284 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "3Ozu4G6bXxp0gYZy", "languageTag": "F9fJBJkSOrF9Dg4F"}' \
    > test.out 2>&1
eval_tap $? 284 'PublicSendRegistrationCode' test.out

#- 285 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "cDwBGyBiHewZkwEe", "emailAddress": "uzBBRSknxyWkZObu"}' \
    > test.out 2>&1
eval_tap $? 285 'PublicVerifyRegistrationCode' test.out

#- 286 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "vig8sMuss76ezTrs", "languageTag": "DZNYUV48Oh6I45X7"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicForgotPasswordV3' test.out

#- 287 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "HvUtPYONZdFk75lk", "password": "jQNHrjaboGomguUq", "uniqueDisplayName": "euZh5qtrRbNnGejd", "username": "TGvZgN5hshSe5YmZ"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicValidateUserInput' test.out

#- 288 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'XKEQLkM6o3eGSP4H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 288 'GetAdminInvitationV3' test.out

#- 289 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'tmr90TqGf0OyqJ9i' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "bJMmRgoxNwp1lGkY", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "7DN2lDvdh7okHl1w", "policyId": "Mht2Izq7TCUJhDsD", "policyVersionId": "efAS09VyQB1vR1mx"}, {"isAccepted": false, "localizedPolicyVersionId": "K17GL1CrO4ZuoGZS", "policyId": "xTzm8oMSPIHPtqzI", "policyVersionId": "WIzg8pbjnt1iBV8D"}, {"isAccepted": true, "localizedPolicyVersionId": "5QB96ndlO6iPGC9R", "policyId": "hzMC7V8BEphnRXnS", "policyVersionId": "pCzyb8FkoxQbrPng"}], "authType": "i87K58pQswqKLutI", "code": "NusOsa92F6iwkJIY", "country": "OLarmpWyvib9CDW2", "dateOfBirth": "1ANrlpuXD9H1u1Cv", "displayName": "zWPcZwkj1l6bf2F9", "emailAddress": "EXOBj7v8LHYivmD0", "password": "ekycMKlwJTNL2UCW", "reachMinimumAge": true, "uniqueDisplayName": "00rS92594HLvWFsX"}' \
    > test.out 2>&1
eval_tap $? 289 'CreateUserFromInvitationV3' test.out

#- 290 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "HtMP0k9L5dREQbCq", "country": "fh0gpABFBER6WNcD", "dateOfBirth": "OsRzBkf9A6HjCnFR", "displayName": "dSihcvszzQLZBktk", "languageTag": "0siMup01kyaFwwD7", "uniqueDisplayName": "wecuQb4GNQHVZMKG", "userName": "Bnzh4suaGIzttTnc"}' \
    > test.out 2>&1
eval_tap $? 290 'UpdateUserV3' test.out

#- 291 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "VBf5g3oeuHiNyLkf", "country": "PQPmjUkvSs5YmIej", "dateOfBirth": "ozmG5HlrIfMAvvpk", "displayName": "AHRJHZyfrXZmiJX4", "languageTag": "CjKCeIRIr997KKpJ", "uniqueDisplayName": "XTLbYWpqeXjaf1f5", "userName": "fjNMZjKJ05puX319"}' \
    > test.out 2>&1
eval_tap $? 291 'PublicPartialUpdateUserV3' test.out

#- 292 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "7WrMnJtovSMFw8X4", "emailAddress": "zxbdfXgunt1oMNZ6", "languageTag": "8eovHSH3xV3URIRV", "upgradeToken": "DYBd6hMB0l7sg7If"}' \
    > test.out 2>&1
eval_tap $? 292 'PublicSendVerificationCodeV3' test.out

#- 293 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "MH5Tu1ky1ZYvyeHm", "contactType": "foFkUDP864shbnQ3", "languageTag": "bVvuvpsDJXPCWkX4", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 293 'PublicUserVerificationV3' test.out

#- 294 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "NFpRE5pS85yTIRWv", "country": "LRy58UKWPv3F7S0w", "dateOfBirth": "CVlYQi9cfMCeNnu6", "displayName": "OIG1PPLRDEXLXZWX", "emailAddress": "vqNCHvNpeMjMzguq", "password": "6HFIqaqwH9J6JLb5", "uniqueDisplayName": "f3SBMyJUdwEBRrHA", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 294 'PublicUpgradeHeadlessAccountV3' test.out

#- 295 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "UFqTooGGnPEgY0t7", "password": "QQWl42byOwXgKyPh"}' \
    > test.out 2>&1
eval_tap $? 295 'PublicVerifyHeadlessAccountV3' test.out

#- 296 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "Xmcysae8HpWH4xiz", "mfaToken": "3fWthJSu2pUIIuPL", "newPassword": "FAtcWhjAP57QbWvS", "oldPassword": "Sp71zEPPfmAQiqRR"}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpdatePasswordV3' test.out

#- 297 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'C2caquMRtQOILcaD' \
    > test.out 2>&1
eval_tap $? 297 'PublicCreateJusticeUser' test.out

#- 298 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qUITBHQR5ISNoFR3' \
    --redirectUri 'GUxdMuvmL0UBfwza' \
    --ticket 'aeP3Wd0Wrb8s3GW0' \
    > test.out 2>&1
eval_tap $? 298 'PublicPlatformLinkV3' test.out

#- 299 PublicPlatformUnlinkV3
eval_tap 0 299 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 300 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CY0vAfbq8xoCurq4' \
    > test.out 2>&1
eval_tap $? 300 'PublicPlatformUnlinkAllV3' test.out

#- 301 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lpHXrbVBh60NUA2a' \
    --ticket 'KQwnXrmi6ya8u4sQ' \
    > test.out 2>&1
eval_tap $? 301 'PublicForcePlatformLinkV3' test.out

#- 302 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Pvaf1AcweR7tJW3M' \
    --clientId 'LMob1hUnIzIpUM8K' \
    --redirectUri 'K1kGFN0NUNGKxdlA' \
    > test.out 2>&1
eval_tap $? 302 'PublicWebLinkPlatform' test.out

#- 303 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UDFQuGPzAuT7M6OB' \
    --code 'rNwioKnXPVZaDcXs' \
    --state 'V1TnsZioDiBgprza' \
    > test.out 2>&1
eval_tap $? 303 'PublicWebLinkPlatformEstablish' test.out

#- 304 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hPB0FKMa0YeyNBQW' \
    --code 'UHDBnBeePkqg6Zt1' \
    --state 'Lr5BlO8K6LH4dSaa' \
    > test.out 2>&1
eval_tap $? 304 'PublicProcessWebLinkPlatformV3' test.out

#- 305 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "8XYHug51ZTogG0N7", "userIds": ["Hvnuq1kJ1kpHcQtn", "Ic9z70LFQMI0oZuE", "jY0rNBbbB9txAvtR"]}' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetUsersPlatformInfosV3' test.out

#- 306 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "QvqJacXR2Rf4noXD", "code": "FaEUkPUBnB0ZEJH3", "emailAddress": "ebM71Tg922xiBgHS", "languageTag": "ka0Pz7I1WkIa0oZ1", "newPassword": "nXpW1l70pcZgIn4l"}' \
    > test.out 2>&1
eval_tap $? 306 'ResetPasswordV3' test.out

#- 307 PublicGetUserByUserIdV3
eval_tap 0 307 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 308 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PghHyMEHBzArbyW1' \
    --activeOnly  \
    --after '0NkJFQxuMHnfOlX6' \
    --before 'HYVEiaereFCPJU2w' \
    --limit '62' \
    > test.out 2>&1
eval_tap $? 308 'PublicGetUserBanHistoryV3' test.out

#- 309 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'L8ZfwCVJW9yspUOy' \
    > test.out 2>&1
eval_tap $? 309 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 310 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HC9eKeXzrvzBllwz' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserInformationV3' test.out

#- 311 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yC1aTWEmPgoy4Tkp' \
    --after '0.4903707897565819' \
    --before '0.36206087183360924' \
    --limit '9' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetUserLoginHistoriesV3' test.out

#- 312 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'F3celFgM62HQtgzQ' \
    --after 'hO3nR8j8DlP6OGbn' \
    --before '8vmfMYGLt1AjKhh3' \
    --limit '74' \
    --platformId 'RZZMW3huAIzBPWBY' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserPlatformAccountsV3' test.out

#- 313 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KAEFTdlKNh6GTzKj' \
    > test.out 2>&1
eval_tap $? 313 'PublicListJusticePlatformAccountsV3' test.out

#- 314 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'sCqxx24QM35bSkFr' \
    --body '{"platformId": "vGciNHb7OY5YIpOL", "platformUserId": "JW52uz3c8pz63M0g"}' \
    > test.out 2>&1
eval_tap $? 314 'PublicLinkPlatformAccount' test.out

#- 315 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '4xXT5Ts4e0uR47Oz' \
    --body '{"chosenNamespaces": ["UGHeBKtpvyRNgjZk", "dDppvEJiUiDGXgh8", "BKcLqtRZ93LuR8OE"], "requestId": "yICvwgwBFehwtdJL"}' \
    > test.out 2>&1
eval_tap $? 315 'PublicForceLinkPlatformWithProgression' test.out

#- 316 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dn3R2wo8beVQvgeP' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetPublisherUserV3' test.out

#- 317 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9qOHaLwYnXxrz7sL' \
    --password 'mP70LxN0f3JA27Qz' \
    > test.out 2>&1
eval_tap $? 317 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 318 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after '5SjzQfOLYu9O46OO' \
    --before 'zz9p57qSpHerzO87' \
    --isWildcard  \
    --limit '5' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetRolesV3' test.out

#- 319 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'VmBT4wZXQZZrSsuY' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetRoleV3' test.out

#- 320 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 320 'PublicGetMyUserV3' test.out

#- 321 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "iIPei0pXglJYnKko", "emailAddress": "CAZuolAWnxkImVbD", "languageTag": "P0QX31gI7VmnGIRM", "upgradeToken": "vXe6BiphIFe2bzr6"}' \
    > test.out 2>&1
eval_tap $? 321 'PublicSendCodeForwardV3' test.out

#- 322 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'qQw6fSESkM19OPMB' \
    > test.out 2>&1
eval_tap $? 322 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 323 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["b12gpmShlmIt2nfh", "UaZGqjslu59GT2E6", "AacmZRXZm626POXW"], "oneTimeLinkCode": "Vj3KP1mX0iYHXBU3"}' \
    > test.out 2>&1
eval_tap $? 323 'LinkHeadlessAccountToMyAccountV3' test.out

#- 324 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'Uk2tQm307IORTyHn' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 325 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 325 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 326 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "LYDAAg1YA4kZURmo"}' \
    > test.out 2>&1
eval_tap $? 326 'PublicSendVerificationLinkV3' test.out

#- 327 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 327 'PublicGetOpenidUserInfoV3' test.out

#- 328 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'GgxVRMPf8g1rbhfI' \
    > test.out 2>&1
eval_tap $? 328 'PublicVerifyUserByLinkV3' test.out

#- 329 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'MStMnSqrKWYOuITl' \
    --code 'YS2RYaD9WNKGhbLh' \
    --error 'jz1v0RBIO2rkJGmP' \
    --state 'aK6HEVIQJd3930TG' \
    > test.out 2>&1
eval_tap $? 329 'PlatformAuthenticateSAMLV3Handler' test.out

#- 330 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'ewjRyfo4nWVZZbKF' \
    --payload 'sKOmgEhjH2wFzCpx' \
    > test.out 2>&1
eval_tap $? 330 'LoginSSOClient' test.out

#- 331 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'xJLfAg5cFT0gHAkl' \
    > test.out 2>&1
eval_tap $? 331 'LogoutSSOClient' test.out

#- 332 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'tcR3eHFbiAluHv7H' \
    --code 'ssd05pHBJX5ln8PZ' \
    > test.out 2>&1
eval_tap $? 332 'RequestTargetTokenResponseV3' test.out

#- 333 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'bYVD8RiaTsdD4d3k' \
    --upgradeSuccessToken 'SbTkHPMUvOAUXkw3' \
    > test.out 2>&1
eval_tap $? 333 'UpgradeAndAuthenticateForwardV3' test.out

#- 334 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '65' \
    --namespace "$AB_NAMESPACE" \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 334 'AdminListInvitationHistoriesV4' test.out

#- 335 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KDjG2ApSV94Jy6yC' \
    > test.out 2>&1
eval_tap $? 335 'AdminGetDevicesByUserV4' test.out

#- 336 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'SXBqJqjAbVwSaoj1' \
    --endDate 'ugjr8mPkr3tZ506E' \
    --limit '89' \
    --offset '34' \
    --startDate 'SVy5M3rrkxu0U9h9' \
    > test.out 2>&1
eval_tap $? 336 'AdminGetBannedDevicesV4' test.out

#- 337 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gCNVZxHGxhZqNXJ6' \
    > test.out 2>&1
eval_tap $? 337 'AdminGetUserDeviceBansV4' test.out

#- 338 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "JXSh0Z3SWISs1dYr", "deviceId": "JKmx1BT6iLFQejNZ", "deviceType": "JNF2hm0TqBQprHn3", "enabled": true, "endDate": "eAmDxP23qstMuikK", "ext": {"c6VNU8570siWm3V9": {}, "sirE0JOQxWeHypqC": {}, "WMDPRI2cCk8zHR8V": {}}, "reason": "yCC0EQwE0cXokXbw"}' \
    > test.out 2>&1
eval_tap $? 338 'AdminBanDeviceV4' test.out

#- 339 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'KDtVmrYQu7hZvHfi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 339 'AdminGetDeviceBanV4' test.out

#- 340 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'T9s9pK8HuUY1QQHQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 340 'AdminUpdateDeviceBanV4' test.out

#- 341 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'NCEddJtx6GV01vD7' \
    --startDate 'lNLxlpvqaB9P9Gau' \
    --deviceType 'kfCEIeSBLhTfzigz' \
    > test.out 2>&1
eval_tap $? 341 'AdminGenerateReportV4' test.out

#- 342 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'AdminGetDeviceTypesV4' test.out

#- 343 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'HcRuJgYaj4I8Dzyh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 343 'AdminGetDeviceBansV4' test.out

#- 344 AdminDecryptDeviceV4
eval_tap 0 344 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 345 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId '1N0JEKNoMtHvjM7X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'AdminUnbanDeviceV4' test.out

#- 346 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId '1fjzknv2HZMIL2P2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'AdminGetUsersByDeviceV4' test.out

#- 347 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 347 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 348 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 348 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 349 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 14, "userInfo": {"country": "RTHDntaFiufH2YR6"}}' \
    > test.out 2>&1
eval_tap $? 349 'AdminCreateTestUsersV4' test.out

#- 350 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "fj6w17arNs12hOoL", "policyId": "VM7UFnuJDzeEkDxa", "policyVersionId": "VogxHrOon2OW4Zw5"}, {"isAccepted": true, "localizedPolicyVersionId": "PcdOuq0m0rvakR8r", "policyId": "cwojLRjhcaJ56nGl", "policyVersionId": "YZ2tod2BGBXjNyRC"}, {"isAccepted": true, "localizedPolicyVersionId": "3jOGmROIqxqQ0gcN", "policyId": "eTflyvUh3w5Ztfwm", "policyVersionId": "OCKpFSMF0tfGIZCT"}], "authType": "EMAILPASSWD", "code": "86hGWKfO9MnoT3t9", "country": "9HmcxzjDhTrcBKtU", "dateOfBirth": "956hOg8oukDVdweG", "displayName": "0sFHxTHa2k60SzCq", "emailAddress": "Ugq1gLbcIMevTmC6", "password": "31p7q794bu49lINF", "passwordMD5Sum": "TtERAXT2h3hcQ2wV", "reachMinimumAge": true, "uniqueDisplayName": "ZbBTnNQnVUhA5Wnz", "username": "VZdj8tsyzC4QaLXp"}' \
    > test.out 2>&1
eval_tap $? 350 'AdminCreateUserV4' test.out

#- 351 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["o4TDraEEaDNJbVd2", "0FVHevCjthJUb7jK", "uMrFaoLulzp3sZxI"]}' \
    > test.out 2>&1
eval_tap $? 351 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 352 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["mVK5yh2LcM8LaMW0", "ByjsRUrAHNRkIcC4", "wNFzsbrtYvLh56AW"]}' \
    > test.out 2>&1
eval_tap $? 352 'AdminBulkCheckValidUserIDV4' test.out

#- 353 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XoMiowdWSs9DQ0VU' \
    --body '{"avatarUrl": "1HED9CGo9aUXj3rh", "country": "0UyqxVWlIMY5tTJw", "dateOfBirth": "4KV104MtMhKHmSjq", "displayName": "PuQZX5KjdNrEwfWo", "languageTag": "2MwulLg4bsO4YHEY", "skipLoginQueue": true, "tags": ["jTSNDf3zazm6p5Y1", "tkG9WwU4Ty6Ch5QY", "yFjuBquE7xssm4hx"], "uniqueDisplayName": "czskbSUbOZ9WNl3a", "userName": "pJmNAbl1g5ZmTTGY"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminUpdateUserV4' test.out

#- 354 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RbP4QVey9pEz1TV5' \
    --body '{"code": "cUtPBsw01i5Mf7Wv", "emailAddress": "bNSeeDNfUESLlwHv"}' \
    > test.out 2>&1
eval_tap $? 354 'AdminUpdateUserEmailAddressV4' test.out

#- 355 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '3JgteOLyKp8a1Vqx' \
    --body '{"factor": "XnRhDd9TGkO6aIYq", "mfaToken": "ftw1SrM2nhSEanfU"}' \
    > test.out 2>&1
eval_tap $? 355 'AdminDisableUserMFAV4' test.out

#- 356 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YrMU6A43UKGpvC1c' \
    > test.out 2>&1
eval_tap $? 356 'AdminGetUserMFAStatusV4' test.out

#- 357 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'r5T1PSXhduTWchzX' \
    > test.out 2>&1
eval_tap $? 357 'AdminListUserRolesV4' test.out

#- 358 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dv3TAtBjP4HSuiYC' \
    --body '{"assignedNamespaces": ["bG0UyYUJmNL8p6Ab", "dtU0CDrlQpKB8qoe", "l2QK3aSOYdmMDikc"], "roleId": "3Fjm9HoQDemtiQvU"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminUpdateUserRoleV4' test.out

#- 359 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RYZCeF30RT9rBgM8' \
    --body '{"assignedNamespaces": ["o7lxXq7TkdM7FVDC", "BcvVegrZddP8lLQo", "6tHj4z4cAM4LMJfW"], "roleId": "NZIxAgBpeubprKX6"}' \
    > test.out 2>&1
eval_tap $? 359 'AdminAddUserRoleV4' test.out

#- 360 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '8jTyRd3LrR1x6U1v' \
    --body '{"assignedNamespaces": ["6zSLjm9zmzUW0vPj", "90jmLTt5YQGawcom", "PoiYoQ1f1AYq306P"], "roleId": "ysv4VPaZWolXypwu"}' \
    > test.out 2>&1
eval_tap $? 360 'AdminRemoveUserRoleV4' test.out

#- 361 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '4' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 361 'AdminGetRolesV4' test.out

#- 362 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "roleName": "eDWrAVQZSvgWuCuL"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminCreateRoleV4' test.out

#- 363 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'sUGrVQAbhS54ZuQH' \
    > test.out 2>&1
eval_tap $? 363 'AdminGetRoleV4' test.out

#- 364 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'KersDmJLUHAKtfXC' \
    > test.out 2>&1
eval_tap $? 364 'AdminDeleteRoleV4' test.out

#- 365 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'KOna8DdjtZhh6ofs' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "Rh6r0e0J6vyqPw7Y"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminUpdateRoleV4' test.out

#- 366 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'lmV3kES0Hi88UYgS' \
    --body '{"permissions": [{"action": 98, "resource": "EkCeV29QsQk100eu", "schedAction": 25, "schedCron": "UcxuXXpt0YSPX04u", "schedRange": ["EIdAwgDobopbdJeV", "CiKs2vLyH9kcSBdk", "7MwQzn28Le5neohq"]}, {"action": 14, "resource": "XSuBQdvdhJoT0WK5", "schedAction": 27, "schedCron": "N09VIbbsz24fQKDZ", "schedRange": ["X6plErw0Gb0ceCbp", "hW4YMhJ0S50bez9Z", "LHW882riiPfRQ3rJ"]}, {"action": 13, "resource": "f5lwXvRNDBnmL1KQ", "schedAction": 27, "schedCron": "1qx3NJTugVWXz8dv", "schedRange": ["7BiEUqnzxs2deMF8", "UAJIHEZv5zyUUyNJ", "kvA5xF3zHtZSd3Qz"]}]}' \
    > test.out 2>&1
eval_tap $? 366 'AdminUpdateRolePermissionsV4' test.out

#- 367 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'XhkrN4pWryt4XTNw' \
    --body '{"permissions": [{"action": 31, "resource": "gDf3GaJsdCZND0wg", "schedAction": 23, "schedCron": "OilX1e1825iasunE", "schedRange": ["Sjcgr2drXG5NkKCy", "SLA8cKCs0dFYRSa2", "OULZ0iOZJiOAh1Sp"]}, {"action": 76, "resource": "Cdr3WzDm3hJdd6ua", "schedAction": 83, "schedCron": "Rz8KgqgwijYxpGhs", "schedRange": ["FArq6lolbj7QKvtV", "RCPMjr5M3vw1GqUj", "jFp6R8mYZwKftVqS"]}, {"action": 62, "resource": "t2hiPuDdOPHcN9dr", "schedAction": 46, "schedCron": "Hnfs4tLVOYQCWMkt", "schedRange": ["miKd9vLPP0w52JRA", "ZxMWdoleYNHXeOpa", "RDwYLge851PbK2MF"]}]}' \
    > test.out 2>&1
eval_tap $? 367 'AdminAddRolePermissionsV4' test.out

#- 368 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'Kvw5TWjAh4gy41LL' \
    --body '["zQ2IjY5PeNr4JmYx", "H2qs28hePJjMp0TK", "KUBfPNI9f2oLWDPS"]' \
    > test.out 2>&1
eval_tap $? 368 'AdminDeleteRolePermissionsV4' test.out

#- 369 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'ZexfKVxqdxmh5QWx' \
    --after 'uQuI7gdDTDb3WdnO' \
    --before 'pzTrRzCCafADJfWB' \
    --limit '38' \
    > test.out 2>&1
eval_tap $? 369 'AdminListAssignedUsersV4' test.out

#- 370 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'GdJvucDbs6UdccuM' \
    --body '{"assignedNamespaces": ["2ykRj3WnyAaUaQBK", "FedL2uduXvZUbQQ1", "3FhD3NExUFipJsUi"], "namespace": "DawAjgHFQk0VzWRN", "userId": "FNiUn2yXMSCcHADY"}' \
    > test.out 2>&1
eval_tap $? 370 'AdminAssignUserToRoleV4' test.out

#- 371 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'pS861c0CJ7LzpFvO' \
    --body '{"namespace": "SF6xKA6yrnvXY5dD", "userId": "wneac75C6S2eHsH4"}' \
    > test.out 2>&1
eval_tap $? 371 'AdminRevokeUserFromRoleV4' test.out

#- 372 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["Y84hL75QboMHCtzE", "F9FSeg6WYgtfuqJH", "rs4e3RnWR30MdBZe"], "emailAddresses": ["zfwc3H0qSbMq4GLj", "8aGsH0qE5p601ak5", "9yFSfdZIv8oYWPUS"], "isAdmin": true, "isNewStudio": false, "languageTag": "bTt6M2XizikCh6q0", "namespace": "yq2WAHtL7IWE3MFq", "roleId": "vfDG5jvMOaXrDlEX"}' \
    > test.out 2>&1
eval_tap $? 372 'AdminInviteUserNewV4' test.out

#- 373 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "42U0syrGNhBmgT2q", "country": "0kIbrJ2S5Pf1Lvg8", "dateOfBirth": "kYEVylINJpxFY8E6", "displayName": "pU8eHjh0aTjIOaQt", "languageTag": "0snbE0yMvqF7TJ9u", "skipLoginQueue": true, "tags": ["dvhMXxiKR29LKIhN", "U43K8bihdw3prp0U", "HlWUxkBefhxRtrqb"], "uniqueDisplayName": "v56oqwnCLVc2qHZu", "userName": "uedbBOd19DqZJRYV"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminUpdateMyUserV4' test.out

#- 374 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "1oqNLmPAUIMwa2wY", "mfaToken": "q6DsUq38bYvaWLoK"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminDisableMyAuthenticatorV4' test.out

#- 375 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'zHnngdfFnOfY9stX' \
    > test.out 2>&1
eval_tap $? 375 'AdminEnableMyAuthenticatorV4' test.out

#- 376 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 376 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 377 AdminGetMyBackupCodesV4
eval_tap 0 377 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 378 AdminGenerateMyBackupCodesV4
eval_tap 0 378 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 379 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"factor": "H6LYXXMndxBPKmHV", "mfaToken": "B7cNzHhvxc4xAPZ8"}' \
    > test.out 2>&1
eval_tap $? 379 'AdminDisableMyBackupCodesV4' test.out

#- 380 AdminDownloadMyBackupCodesV4
eval_tap 0 380 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 381 AdminEnableMyBackupCodesV4
eval_tap 0 381 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 382 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag '6WNnQOhusPn4466u' \
    > test.out 2>&1
eval_tap $? 382 'AdminGetBackupCodesV4' test.out

#- 383 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag '8agb5HPsBU0Eo6QJ' \
    > test.out 2>&1
eval_tap $? 383 'AdminGenerateBackupCodesV4' test.out

#- 384 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag '9vBRJ4UP09fabC01' \
    > test.out 2>&1
eval_tap $? 384 'AdminEnableBackupCodesV4' test.out

#- 385 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'Thm9f4AWpyiKVT3O' \
    --factor 'vEujx5yjtQSCJaOH' \
    > test.out 2>&1
eval_tap $? 385 'AdminChallengeMyMFAV4' test.out

#- 386 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'zpb623EciYoYOPVg' \
    --languageTag '6DLEZ6DxpwBm2N8P' \
    > test.out 2>&1
eval_tap $? 386 'AdminSendMyMFAEmailCodeV4' test.out

#- 387 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "dQ5mQaGXEbnmWR0H", "mfaToken": "3EkrHqaLNdfKszYZ"}' \
    > test.out 2>&1
eval_tap $? 387 'AdminDisableMyEmailV4' test.out

#- 388 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'zOg113h6fIaHSx5b' \
    > test.out 2>&1
eval_tap $? 388 'AdminEnableMyEmailV4' test.out

#- 389 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 389 'AdminGetMyEnabledFactorsV4' test.out

#- 390 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'ClxUOBmMwv5pmiIV' \
    > test.out 2>&1
eval_tap $? 390 'AdminMakeFactorMyDefaultV4' test.out

#- 391 AdminGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyOwnMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 391 'AdminGetMyOwnMFAStatusV4' test.out

#- 392 AdminGetMyMFAStatusV4
eval_tap 0 392 'AdminGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 393 AdminInviteUserV4
eval_tap 0 393 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 394 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'nhlLoMemsp7o3F2L' \
    --linkingToken 'Qw7Y2VdSxgXez7Vv' \
    --password 'S0C9JLVQQPa7PPx4' \
    --username 'Zi6WaC8wk7HMbJhN' \
    > test.out 2>&1
eval_tap $? 394 'AuthenticationWithPlatformLinkV4' test.out

#- 395 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'wZgf5nlMDORYuXnP' \
    --extendExp  \
    --linkingToken 'NJgayPFcyUnKXA3m' \
    > test.out 2>&1
eval_tap $? 395 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 396 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'cyMmX6WF8jtNAVOY' \
    --factor 'qSH533YlJ93CCGBX' \
    --mfaToken 'v4fP4VPzhcH4UJrr' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 396 'Verify2faCodeV4' test.out

#- 397 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'CKvrOAi7lMgkVWJY' \
    --codeChallenge 'zSCIDxWUxgOzeRNH' \
    --codeChallengeMethod 'S256' \
    --additionalData 'qK5PT404mFw4HJv5' \
    --clientId 'T2kIQOecfLsYKTmU' \
    --createHeadless  \
    --deviceId 'nKlrOsJmEwjGYN8V' \
    --macAddress 'NPXNsmwTV8imJHNI' \
    --platformToken '0l6jJVzF1Oi2sQuW' \
    --serviceLabel '0.7445621332661938' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 397 'PlatformTokenGrantV4' test.out

#- 398 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'BBHZonSmzF831vlC' \
    --codeChallengeMethod 'S256' \
    --simultaneousPlatform 'pgdHvlQKiR7SDQUD' \
    --simultaneousTicket 'avOlKT5EIHNhJQq9' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'Re5IM1akNKz9IltQ' \
    > test.out 2>&1
eval_tap $? 398 'SimultaneousLoginV4' test.out

#- 399 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'Uku3n32atB0QPQPE' \
    --codeChallengeMethod 'S256' \
    --additionalData 'W9i54JY23AUWFTLq' \
    --clientId '0W1JqwKs1mO80L7I' \
    --clientSecret 'OHlf6j8PZOzUiQKZ' \
    --code 'qz5NSp0B7LODN3Bo' \
    --codeVerifier 'i2sSAO2n4MZQt753' \
    --extendNamespace 'XQB93rOW0guPoQbY' \
    --extendExp  \
    --loginQueueTicket 'zc1RDVhs2lhdzxxg' \
    --password 'ibuqUuyW3cMz9Yyd' \
    --redirectUri 'uMomEHcU15St4v8r' \
    --refreshToken 'y8IyqNVv0KVpXJTM' \
    --scope 'x3Y8Um1iqehObg3O' \
    --username 'Z9j0HDtbqMFlgHKQ' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 399 'TokenGrantV4' test.out

#- 400 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData '5Cj7RqnJUmfDmofx' \
    --code 'vN8pRGoUtmbWZbEj' \
    > test.out 2>&1
eval_tap $? 400 'RequestTargetTokenResponseV4' test.out

#- 401 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Pyq35BWDoc3qNcQF' \
    --rawPUID  \
    --body '{"pidType": "FyHv141NPqjRUMKS", "platformUserIds": ["QjFdjqTaZFsWzbqw", "TZQIN5jC6a8mEVCX", "HmFnrSL0PJcZQaCe"]}' \
    > test.out 2>&1
eval_tap $? 401 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 402 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'NLYxMID9pqZ5rryi' \
    --platformUserId 'MMt6fQtLhzylaqui' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetUserByPlatformUserIDV4' test.out

#- 403 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "yH89i8ZDPXRL8cbT", "policyId": "AntB1STaab1UeibX", "policyVersionId": "g7RCe5BtKcwj6Pqq"}, {"isAccepted": true, "localizedPolicyVersionId": "gCimr3ZQNBBkrXu9", "policyId": "czsYr3cFeVw70xdN", "policyVersionId": "TuOdLKK0M2B2hbqJ"}, {"isAccepted": false, "localizedPolicyVersionId": "zo4Plv1IlTpEhjTF", "policyId": "YdzsUNvQAn2LuMjL", "policyVersionId": "qwmVz3zKsfjz1mFk"}], "authType": "EMAILPASSWD", "country": "Eq7FQ2S5VeW9ddxz", "dateOfBirth": "LPV8wDjsnyPh5yNb", "displayName": "YXmlAOi1SC3I1Sjk", "emailAddress": "H42LtyZKrTJo0L5s", "password": "Hil4Q0mqa8Gatrjb", "passwordMD5Sum": "J5YT7uvqarTvrG1D", "uniqueDisplayName": "XZAWlvz3c3XALMre", "username": "sGFfsH4aXCDhshvE", "verified": true}' \
    > test.out 2>&1
eval_tap $? 403 'PublicCreateTestUserV4' test.out

#- 404 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "rHd250nyihcUVGHQ", "policyId": "czI5ZoTRUkjGoRkP", "policyVersionId": "s2SO9XrgXNIaU11c"}, {"isAccepted": true, "localizedPolicyVersionId": "0InxMLpP7n7M3JXj", "policyId": "Evsj5WcQ99M1yuXe", "policyVersionId": "qV31LX2ehcMnM6Qt"}, {"isAccepted": false, "localizedPolicyVersionId": "Nczam4Cdd1QYvww4", "policyId": "XDokltgq2vXtUnY6", "policyVersionId": "UhDJ4pe0s0Cuhl3d"}], "authType": "EMAILPASSWD", "code": "b4seYCyiB4tDCWx3", "country": "cEX8wTi1v2abpCWy", "dateOfBirth": "tPEi9Ze0hL9rPkV5", "displayName": "GkSrcl2O47XVzU7q", "emailAddress": "lNVk7qnmBS3XKDhp", "password": "1OkMcErmeH0lX1hj", "passwordMD5Sum": "0LaXgQ94flh775AQ", "reachMinimumAge": false, "uniqueDisplayName": "Rwg0sKVeSpMny0Gr", "username": "vKI5EVB9ZFzLNsjd"}' \
    > test.out 2>&1
eval_tap $? 404 'PublicCreateUserV4' test.out

#- 405 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'CFtKY0KsxR0rCFky' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "DYBOProN4UWbQaKF", "policyId": "rTv4JWElmOCxqPrq", "policyVersionId": "9I3XJWBxTLcOef8M"}, {"isAccepted": false, "localizedPolicyVersionId": "qtzDd7SgxdxB5kvt", "policyId": "M8ah9bPsksceGUEX", "policyVersionId": "8ERZcKSYLo6y7yJM"}, {"isAccepted": false, "localizedPolicyVersionId": "LIg3MgmdSvWp3h0x", "policyId": "PsVY8qNwB2TY4v9N", "policyVersionId": "NfQSYLFKSl3FNFFJ"}], "authType": "EMAILPASSWD", "code": "Sa5cRn31D8ubfdXi", "country": "7BycDPckeGJUgU8b", "dateOfBirth": "D5mGFFmKTTUxG0mp", "displayName": "mFxxDNXGlGJvHf55", "emailAddress": "8h1ltyhiSGhfqXhx", "password": "BJ7zLXioAGkWgSDd", "passwordMD5Sum": "DQvpRfGe3z2rtjWp", "reachMinimumAge": true, "uniqueDisplayName": "AlKHF0ebxhJ1176C", "username": "eD4dWCp4wqlQJcZr"}' \
    > test.out 2>&1
eval_tap $? 405 'CreateUserFromInvitationV4' test.out

#- 406 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "oNQiefBnPluOIjZy", "country": "vlGDQGv6pNNowEuV", "dateOfBirth": "VZM28w4mnYvvlt1e", "displayName": "s7A4PFduN4gx0UC6", "languageTag": "eWKCFGS97Si6XyLV", "uniqueDisplayName": "PrkUxyZ1OH5Nn4nM", "userName": "T8QOyTuUSD9ImtaP"}' \
    > test.out 2>&1
eval_tap $? 406 'PublicUpdateUserV4' test.out

#- 407 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "AocOQcpBWSNrCjSN", "emailAddress": "EAdojkCMmYyTGO07"}' \
    > test.out 2>&1
eval_tap $? 407 'PublicUpdateUserEmailAddressV4' test.out

#- 408 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "foRZ6FujpIWo0qJt", "country": "qp4Q6XgICLgMHcP1", "dateOfBirth": "eE6sjWQllYsONpp6", "displayName": "QGW56CNiszHE69D1", "emailAddress": "MMoaf6KlgRtwaM2I", "password": "oyY1wpIdjcAtTj1I", "reachMinimumAge": true, "uniqueDisplayName": "uuhxxlulfmya73hX", "username": "0a8Ri85PA9wNpmrK", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 408 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 409 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "Y5heA2ewWnFcqHxX", "displayName": "P3kRhtrBcBofWTGY", "emailAddress": "x2ihgioL8VvEzHGT", "password": "t9emdCLmzJbdkykV", "uniqueDisplayName": "AnmnRfUilcKA84d9", "username": "pMsl7zrNJvDiP2hN"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicUpgradeHeadlessAccountV4' test.out

#- 410 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "NEI8QrQ6H1ro5CtU", "mfaToken": "8UjgyCUpM1JBcTzf"}' \
    > test.out 2>&1
eval_tap $? 410 'PublicDisableMyAuthenticatorV4' test.out

#- 411 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code '4dz1BojPoQg97640' \
    > test.out 2>&1
eval_tap $? 411 'PublicEnableMyAuthenticatorV4' test.out

#- 412 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 412 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 413 PublicGetMyBackupCodesV4
eval_tap 0 413 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 414 PublicGenerateMyBackupCodesV4
eval_tap 0 414 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 415 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "9vFd5z9r4nJWUvLp", "mfaToken": "1wxGF747468MXUq3"}' \
    > test.out 2>&1
eval_tap $? 415 'PublicDisableMyBackupCodesV4' test.out

#- 416 PublicDownloadMyBackupCodesV4
eval_tap 0 416 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 417 PublicEnableMyBackupCodesV4
eval_tap 0 417 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 418 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'uIffkIpPmrWVxNZU' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetBackupCodesV4' test.out

#- 419 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'vkiU2jXSwsBBRopV' \
    > test.out 2>&1
eval_tap $? 419 'PublicGenerateBackupCodesV4' test.out

#- 420 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'l38d4NZGtk6EmWxC' \
    > test.out 2>&1
eval_tap $? 420 'PublicEnableBackupCodesV4' test.out

#- 421 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code '75M88TKhFYkA9aRN' \
    --factor 'De2IoPMSQKcg0OTT' \
    > test.out 2>&1
eval_tap $? 421 'PublicChallengeMyMFAV4' test.out

#- 422 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken '9JA0ll1RimBCiQwu' \
    > test.out 2>&1
eval_tap $? 422 'PublicRemoveTrustedDeviceV4' test.out

#- 423 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'yrI87uSyXP6C0jXS' \
    --languageTag '8au2wcWYyj3JvHqX' \
    > test.out 2>&1
eval_tap $? 423 'PublicSendMyMFAEmailCodeV4' test.out

#- 424 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "p4JR7xI59Z9tfGVs", "mfaToken": "glnOxOXBfgBLuglk"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicDisableMyEmailV4' test.out

#- 425 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'd9LIoshGnFSuHmrq' \
    > test.out 2>&1
eval_tap $? 425 'PublicEnableMyEmailV4' test.out

#- 426 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 426 'PublicGetMyEnabledFactorsV4' test.out

#- 427 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'ej8PRppYY1vlV0M2' \
    > test.out 2>&1
eval_tap $? 427 'PublicMakeFactorMyDefaultV4' test.out

#- 428 PublicGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyOwnMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 428 'PublicGetMyOwnMFAStatusV4' test.out

#- 429 PublicGetMyMFAStatusV4
eval_tap 0 429 'PublicGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 430 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'g6oreqyBzWzCgMMW' \
    > test.out 2>&1
eval_tap $? 430 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 431 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "ZuD6tmIR28xVxbtp", "emailAddress": "SKOfiIP3S6pypZqI", "languageTag": "Sn3msrykQFtW8QGK", "namespace": "FZLrIfqrZuu7IwKc", "namespaceDisplayName": "T7sAsv2TKCbYMVkX"}' \
    > test.out 2>&1
eval_tap $? 431 'PublicInviteUserV4' test.out

#- 432 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "FZsTBHkgcJ0DcEt2", "policyId": "3pci6xEljer6aGJx", "policyVersionId": "5OFp3jKEx4aSGdwT"}, {"isAccepted": false, "localizedPolicyVersionId": "2U7xttUz8nWKJjv0", "policyId": "6PuffHghAQfAsYXV", "policyVersionId": "zBenLtaAoYyRfiCW"}, {"isAccepted": true, "localizedPolicyVersionId": "sbhi5QJuc2SNBaOl", "policyId": "XfgsgBd7MYLLoPZr", "policyVersionId": "kjRm5Ki0orhXrISE"}], "code": "aPZHLQkTHvndQsCK", "country": "AO2JRz3CGwtujkzx", "dateOfBirth": "idLcAQWGVRg6DVso", "displayName": "5TJCSugdo4XTm8t1", "emailAddress": "YTWqItjNWXm9srae", "password": "MA78YSRS2fPy5fpb", "reachMinimumAge": false, "uniqueDisplayName": "Vz4U43EcV1FRyeeq", "username": "ehMNeRYKeMbL0G4v", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 432 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE