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
echo "1..401"

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
    --body '{"ACSURL": "5ar5qTLWUCy0Afgc", "AWSCognitoRegion": "050XIZRW491e94mQ", "AWSCognitoUserPool": "jVOOBnIWhunElqZU", "AllowedClients": ["odp3IhtCSHy1ei1f", "IrPvfHnRN06EjRwE", "QlNapJRfk4f9Zcw1"], "AppId": "pEHAyNFxcVTKuAQT", "AuthorizationEndpoint": "Gh5BxjWOozGoDtsU", "ClientId": "uYo5p8ED5QZAufwN", "EmptyStrFieldList": ["a8lzfjv9oYMXMjlV", "HY1AHwF3vGoav7MK", "0PcLnEkcokKwcQ0b"], "Environment": "aDT9OyJ2h23GUS2a", "FederationMetadataURL": "mU7syGlElXdEAOrV", "GenericOauthFlow": false, "IsActive": false, "Issuer": "WXade41s3rH34mB2", "JWKSEndpoint": "yPlRpWjmHZAAvKTH", "KeyID": "8MuqIg0CzkguwuJC", "LogoURL": "W7EEFB67AODbi9Bz", "NetflixCertificates": {"encryptedPrivateKey": "upBsFpYc77GtRUcC", "encryptedPrivateKeyName": "FeY5g4XgBsbfzqxB", "publicCertificate": "PNe8ae1Il4aAtEbu", "publicCertificateName": "4IjGdqthRxTjQ7gk", "rootCertificate": "ZEY8rG0q0Q2Qd2Jz", "rootCertificateName": "RbkF2I03dIjvBbA6"}, "OrganizationId": "bfbYaJCJjfk2TUvn", "PlatformName": "95FhO7VW3mbDVMDu", "RedirectUri": "87t0ldWf7iSGIiKF", "RegisteredDomains": [{"affectedClientIDs": ["tWtn4Yr2svKM6pqL", "GZ0TBujELAUK6mQ5", "iZgbwwm5iGzXtckn"], "domain": "rgidKupvXO6aj4hC", "namespaces": ["mTC34jxW4pIDwdqX", "pmRmut9H9XyWI8bp", "8fQxRuX91uYmtrHJ"], "roleId": "bEGTUj7YjERL1rEQ"}, {"affectedClientIDs": ["G02zccA8wvLsWUNd", "6lPKvqDejvqklTSv", "DwuOrP9lzpiX0VuF"], "domain": "pZum7izxe7NPzjOa", "namespaces": ["8E7wY76PxLv9HBEU", "e89AwEw1HO4FnKtx", "4XLKAmlDr19uJ3nq"], "roleId": "6VerzVCcI8y3Cz0Y"}, {"affectedClientIDs": ["qCKUh5RD9vNAp4ji", "nFpnQ5xF9wwbvMZy", "eDeRnVfPUa6xVVBc"], "domain": "q3wZpFIYeAg79HcL", "namespaces": ["JXJ7mpVI6eTYAjdP", "lCiQQC35cj4KyOVg", "vnWbfRJtsB7cUQZ2"], "roleId": "QUAxJrINPXppPNO3"}], "Secret": "AfmXcgwC3IN6tvKg", "TeamID": "LB9QmJIOq9dP5szG", "TokenAuthenticationType": "71utjsQ4CrRb9gUC", "TokenClaimsMapping": {"eVz7fWbZIdhevfZv": "yV7AcodcZwKjYDdm", "JOlzwm9Su4FnS98Q": "qftSjq7sn8yreciP", "LfkVyyJsbGpO6Jge": "hDJxEN7JlZc8LMq1"}, "TokenEndpoint": "o2jZWu4yA3r0u4q1", "UserInfoEndpoint": "bTHXIjfJKyFlM0u1", "UserInfoHTTPMethod": "uuoVdn9yVoSlKNch", "scopes": ["PHNL4X3LLaGPGdqL", "E8SohhhuiTnJarYY", "kHBDdSzBXdxapwhd"]}' \
    > test.out 2>&1
eval_tap $? 141 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 142 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5IQYBQuxLvPuWYvE' \
    > test.out 2>&1
eval_tap $? 142 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 143 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3fsNy9Z9OhxXvCp9' \
    --body '{"ACSURL": "y7fLD2qfCXnlUnqx", "AWSCognitoRegion": "T1WsRNMZcA92hzC7", "AWSCognitoUserPool": "MNa8vVe4MHX6AgMe", "AllowedClients": ["p90AyyUJyAK5PRMR", "Mwdvl0hv6g62GxBW", "2tQF5tkTjgJaMYvN"], "AppId": "QOsDa4bkcgepqtxj", "AuthorizationEndpoint": "brztee7QLTGAak7K", "ClientId": "aol01DK97D2xnik4", "EmptyStrFieldList": ["2miteR5eQAe1rzmm", "gqBPRmd6mO4oI8KD", "qebm83raNBJ5y7ax"], "Environment": "EkvI4oxZEDxGiBnN", "FederationMetadataURL": "bn0zaf7CaOSlHXrU", "GenericOauthFlow": true, "IsActive": true, "Issuer": "6sMJzA5mtqISQ83T", "JWKSEndpoint": "TbtefXWznDe4LQdX", "KeyID": "fFBii2RAMEX5RMjB", "LogoURL": "FVZGYzQqV8d9mDdU", "NetflixCertificates": {"encryptedPrivateKey": "IoiIJFNxuNOmUSWw", "encryptedPrivateKeyName": "18T1IxVWCxdvPL9e", "publicCertificate": "4P01vxP8xj1LyEir", "publicCertificateName": "URERnEMzpImW6sjA", "rootCertificate": "HyCK5tNanGBrkzUv", "rootCertificateName": "ck3xTtmOFMebS4Ad"}, "OrganizationId": "lNzwog2IhErkNhNc", "PlatformName": "ECWwchW6zL9SkbLl", "RedirectUri": "rNXnGanMazb8jvRW", "RegisteredDomains": [{"affectedClientIDs": ["enURH48aJuALEcSq", "cE15u6D31DjOsrs3", "CUYATdqnQGbqiqOk"], "domain": "NeATj7eGjodd7CcJ", "namespaces": ["UrI6MAugK5kypNrp", "2nFe9FmN86sK5LOq", "4ft5jGcMICPUYnfG"], "roleId": "6jl9U4jReteIMgzI"}, {"affectedClientIDs": ["SomCsodJrhQW41q2", "OspCZbt3Uta5I0uG", "cL1koyHjCH5olYLE"], "domain": "TRpABAmO2EGvJ4UM", "namespaces": ["S93yOxNInDByhnol", "uO6ti0QP2ssiJ66O", "zOj84O6tgohjtC7b"], "roleId": "zjPpucddXJ5zifF8"}, {"affectedClientIDs": ["y959anrNSleywHbH", "ig6IKWVZ77KeRWdE", "CaFGzfZ2hxcJ2Fne"], "domain": "mn7M23SzUo4hNBDh", "namespaces": ["9ZFP1OW0nXOErQPS", "4VsRoYIK69yg9ADC", "GiXaLs2xjHkinOD9"], "roleId": "75nARHCmhNHSXuqI"}], "Secret": "HsxvaUoXDmwWsukx", "TeamID": "ncuD3QxCXMd00YBW", "TokenAuthenticationType": "CaVVmM45mfIZsWhk", "TokenClaimsMapping": {"S476dGGJwJ00UH19": "7MJ6zU7JLMQyMWzY", "QCAaPJgoxGJoJaSz": "UtY4ZD0Xtb0U4pH1", "6NUsVY21NVIs7NRe": "n2Y3Ns0QJQeaWytP"}, "TokenEndpoint": "fds1BYx0EaURydf8", "UserInfoEndpoint": "ZyyZeHAWGgJUbUJR", "UserInfoHTTPMethod": "MbkcTglbU86FyOjA", "scopes": ["pNHBVfNOURcjY3YY", "T9oTynmfIuBWgJTN", "FfM8M0IW4oe8KDgy"]}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 144 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0xZfAcNg14Ws8TIP' \
    --body '{"affectedClientIDs": ["1LKiFQoLDvumfqrg", "Sfnx2h61X9dN1MGR", "XBJ6mVV7JS9qjNLw"], "assignedNamespaces": ["vI8JdiY3RRiLilmO", "GF6dLLIeIVIjMcdl", "bdRXTGIrdNL5gJPq"], "domain": "TAjgqaTHf1ANTJ9Y", "roleId": "k997XkGOdC6ItxDT"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 145 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8p4n4XCFkD1AJLCw' \
    --body '{"domain": "szbZxuHSgDOK8bjo"}' \
    > test.out 2>&1
eval_tap $? 145 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 146 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'F7bL2635KbtZTGJp' \
    > test.out 2>&1
eval_tap $? 146 'RetrieveSSOLoginPlatformCredential' test.out

#- 147 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qgl2IzNXGTuQPIDp' \
    --body '{"acsUrl": "or7t1aJLNNz6QIVC", "apiKey": "9Mfuc8VOsnmnlVlj", "appId": "dWYmELe74p38vumn", "federationMetadataUrl": "xAnYBTxaTIz0jcgD", "isActive": false, "redirectUri": "Pkz96vd80msqIm5b", "secret": "ufnBqrpLeqhwVhjn", "ssoUrl": "njKMEmtbiWsAQHbM"}' \
    > test.out 2>&1
eval_tap $? 147 'AddSSOLoginPlatformCredential' test.out

#- 148 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rKYi0Zxs5SWCqZXH' \
    > test.out 2>&1
eval_tap $? 148 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 149 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LLa31oQf7BULnZDh' \
    --body '{"acsUrl": "utDM6BqguqD5xxGx", "apiKey": "BWtnTKUe2znsqPzP", "appId": "kwCBo2SwCUsTag4M", "federationMetadataUrl": "LAo3m61P2xaNfmn8", "isActive": false, "redirectUri": "Md1onFjGRbxtABPX", "secret": "DmgNEJBhgGq5GIDh", "ssoUrl": "NC66szbCCf73IFbR"}' \
    > test.out 2>&1
eval_tap $? 149 'UpdateSSOPlatformCredential' test.out

#- 150 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kPSSITz4TjCrJHXG' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["Xku2YVuOzhxHmnrr", "V9ZGWrZ05sxe6A6R", "pmKDebNkylbynkgT"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 151 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9vayLLiizac7Ge6z' \
    --platformUserId 'KJdlt7rjF5RaJwvk' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserByPlatformUserIDV3' test.out

#- 152 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'WVco2LTo5ijlvDF8' \
    --after '33' \
    --before '56' \
    --limit '99' \
    > test.out 2>&1
eval_tap $? 152 'GetAdminUsersByRoleIdV3' test.out

#- 153 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'lYJ8BzP6EUmUXGM5' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserByEmailAddressV3' test.out

#- 154 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["XH8x6HdVfZVDAiU6", "iJOF7JKZFNk2NKy5", "9X8iOg2sVBiCoeC5"]}' \
    > test.out 2>&1
eval_tap $? 154 'AdminBulkUpdateUsersV3' test.out

#- 155 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'weXJl7PeiMH8z8dV' \
    --body '{"bulkUserId": ["ej8N2yv6VTnOK7xA", "vM7tuL81lsR7xxSV", "p3Gd2TK0HzYviTgY"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetBulkUserBanV3' test.out

#- 156 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["mx82JVBRLPZ6Iz8t", "ne5dbguBF6Gsvvdl", "8jHz9x7XZIjU4IK9"]}' \
    > test.out 2>&1
eval_tap $? 156 'AdminListUserIDByUserIDsV3' test.out

#- 157 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["lOLaZaMphKCqTq3E", "VheJjoEEXBLIxGnN", "uhoJM3WWPvvCiCf3"]}' \
    > test.out 2>&1
eval_tap $? 157 'AdminBulkGetUsersPlatform' test.out

#- 158 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["3ViEdqQpoGkUWNiz", "k5UcPAGv6c1ESC6h", "ZYTYZbzf5aANNNs5"], "isAdmin": false, "languageTag": "BAKx27MSBqabUXOG", "namespace": "kkoMUZn1YXj5zFZe", "roles": ["OCOR9NvBQZSJPOIK", "rRBrYVzi9ui3lvoz", "Tt9TsH7A0TuU2aL4"]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminInviteUserV3' test.out

#- 159 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '84' \
    --platformUserId 'AziBOHEAj1cT3u6Z' \
    --platformId 'c2FbrTFznTgDIwZI' \
    > test.out 2>&1
eval_tap $? 159 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 160 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 160 'AdminListUsersV3' test.out

#- 161 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'Wf6T3by2kYSCdnFK' \
    --endDate 'Lc0xcTjqjdcEfU61' \
    --includeTotal  \
    --limit '83' \
    --offset '73' \
    --platformBy 'UumPKVSZCg3XTc9v' \
    --platformId 'Qe0dHJfF6KIuvnRC' \
    --query 'a9JktyBdxkZKrEWF' \
    --roleIds 'w9GYxjiiOQAD77ci' \
    --skipLoginQueue  \
    --startDate '0vfWVZoRRMPi57Hy' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 161 'AdminSearchUserV3' test.out

#- 162 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["KKz5nyI6ulKNKoXa", "0dgx1JgjC56pda3Y", "htQxpCYME6x21pdX"]}' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetBulkUserByEmailAddressV3' test.out

#- 163 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2QSPAd9sxoLnWGP1' \
    > test.out 2>&1
eval_tap $? 163 'AdminGetUserByUserIdV3' test.out

#- 164 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PafIjLX8ce0KbNN7' \
    --body '{"avatarUrl": "Ycl2JfmQplvGjVQ4", "country": "aebjfgGu472oWJlf", "dateOfBirth": "glLM4xjfkNL4lU6j", "displayName": "aGfsD1cfswmeFpvt", "languageTag": "DtetoQVFL8LNW11v", "skipLoginQueue": true, "uniqueDisplayName": "SFZ0LpupEi5DbkVs", "userName": "3qFTi1t530Wj1Wfz"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserV3' test.out

#- 165 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ivc3VlSXrA3XUGud' \
    --activeOnly  \
    --after '4tVjmxEf4XvVhFJT' \
    --before 'xFHITBg9x4unq3eO' \
    --limit '78' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetUserBanV3' test.out

#- 166 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fNfUDe4g7q6PHEaq' \
    --body '{"ban": "bzHvDDl1jiLw3XMG", "comment": "BA6JXDpA1tIC45C0", "endDate": "oaGouFu4hXONgUwJ", "reason": "nUpryDeRcpUvlrw2", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 166 'AdminBanUserV3' test.out

#- 167 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wC1uuokpaIjL0Vxe' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserBanSummaryV3' test.out

#- 168 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId '5n9Lx3QcFo9gxOgv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dc7xMrRKvw8ISP2W' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 168 'AdminUpdateUserBanV3' test.out

#- 169 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zW1QqxnWR5sheLgs' \
    --body '{"context": "AF4ctv5guycGiq9j", "emailAddress": "2EyIknfLDpgHnMOn", "languageTag": "8nc3gUZ8ZFyyEr0K"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminSendVerificationCodeV3' test.out

#- 170 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BXuJBqK4QtEydPWL' \
    --body '{"Code": "PBYiR3UbJc1ZYapx", "ContactType": "7C477etqgfOJDUT0", "LanguageTag": "uKAPrARya2IMlNiX", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 170 'AdminVerifyAccountV3' test.out

#- 171 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'LWHAbCZixe2cQ6O3' \
    > test.out 2>&1
eval_tap $? 171 'GetUserVerificationCode' test.out

#- 172 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0lpzcBQMAEcNcJqr' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetUserDeletionStatusV3' test.out

#- 173 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KxnMzSYoc4ZjiMY4' \
    --body '{"deletionDate": 69, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 173 'AdminUpdateUserDeletionStatusV3' test.out

#- 174 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '34B6wVd8ipcKDwQe' \
    > test.out 2>&1
eval_tap $? 174 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 175 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UWtjCC2UH6jzMO3A' \
    --body '{"code": "fmOS5mQNyRPZFPNP", "country": "56l1AT6OLKmZhCZx", "dateOfBirth": "xPPdPwOtEuWBSO2j", "displayName": "JepUnEEgja2mIE2k", "emailAddress": "LTnJwc5XmkCuL5W4", "password": "tKt6G3j9LYdG7xVP", "uniqueDisplayName": "qBqe9RDQMBSYAFLq", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 175 'AdminUpgradeHeadlessAccountV3' test.out

#- 176 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BfDlrQQuAc10Djjw' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserInformationV3' test.out

#- 177 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mv4vrIPRtvhQIyLa' \
    --after '0.2842031215976155' \
    --before '0.15858670394435304' \
    --limit '0' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetUserLoginHistoriesV3' test.out

#- 178 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KegvFTD1sPykS8YL' \
    --body '{"languageTag": "mwtYgWGcA0h4G1LZ", "mfaToken": "1HaX5UBMbsF44VTs", "newPassword": "LDRzdq22cbnyK3gg", "oldPassword": "FDh2kaZP7pnnVfxP"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminResetPasswordV3' test.out

#- 179 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wc259HF9ejHaILQr' \
    --body '{"Permissions": [{"Action": 41, "Resource": "i4FEIu44u83ZLRxY", "SchedAction": 23, "SchedCron": "SgkpK70uJmUL0uzE", "SchedRange": ["lixc023dIvDiA0tQ", "WlHwBcTtztx3VAl6", "tXFbnATCzUOIzVcy"]}, {"Action": 22, "Resource": "CZ4AELr5lraa5v5P", "SchedAction": 23, "SchedCron": "Cj8hgFsqHC9h5JPi", "SchedRange": ["MEtgKuiGTYgwWv5X", "ldL6rOVGcRAn51rV", "AQSxp4qTB54mKA3V"]}, {"Action": 48, "Resource": "DKlCeZ7mLYsHooOI", "SchedAction": 1, "SchedCron": "6GPrhn2etVIQvRkQ", "SchedRange": ["JAtDUH9tx60AehGz", "1ermJYXsYgL7TfyI", "lAwjTZdRZJJzWZwv"]}]}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserPermissionV3' test.out

#- 180 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TX2bamSCvX1nwvSW' \
    --body '{"Permissions": [{"Action": 7, "Resource": "9gW596FwBNrFXt3T", "SchedAction": 53, "SchedCron": "y0mR3zMyTsftKqns", "SchedRange": ["IJctAdxyZVKHA9Dk", "aSOWgtg8yw8lHEbV", "DwBAqanOlscRIWw8"]}, {"Action": 77, "Resource": "k5K5VTkdubkOFldM", "SchedAction": 58, "SchedCron": "QlnNRZJHBSB4fZWE", "SchedRange": ["FIZs28Ff1kZp1Zkt", "x3N7WNMYIfcDKbLu", "8pnK34oA1keYXJvt"]}, {"Action": 14, "Resource": "AFTVYelIlGJg9wdc", "SchedAction": 79, "SchedCron": "bihhWjfZpfcFBUsn", "SchedRange": ["nDJlmD1iEokbUiYz", "CQh2iNTwtnohddMz", "MTQ9P7sYLDWAJOA7"]}]}' \
    > test.out 2>&1
eval_tap $? 180 'AdminAddUserPermissionsV3' test.out

#- 181 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5K4BYJ2fkqYJoF2F' \
    --body '[{"Action": 70, "Resource": "rZmtQUvro8TWwXWs"}, {"Action": 53, "Resource": "P1G9tyBTfERXdvgD"}, {"Action": 95, "Resource": "Qf7Ot2DkUt3yexZB"}]' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserPermissionBulkV3' test.out

#- 182 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '89' \
    --namespace "$AB_NAMESPACE" \
    --resource 'XejmeZtzT0qj0lts' \
    --userId 'qfiZrthVvyX0OCKD' \
    > test.out 2>&1
eval_tap $? 182 'AdminDeleteUserPermissionV3' test.out

#- 183 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JE3RMUddwSSgxCu8' \
    --after 'zru1DhGAYOHR5BWa' \
    --before '9VzIkaQEl1iUProN' \
    --limit '55' \
    --platformId 'sY3SsTnDQY7kKU2u' \
    --targetNamespace '06Q4veujxtyQENvJ' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetUserPlatformAccountsV3' test.out

#- 184 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'rBCqeg67d4RWOqO4' \
    > test.out 2>&1
eval_tap $? 184 'AdminGetListJusticePlatformAccounts' test.out

#- 185 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'U0bitNQLzwRoWnR0' \
    --userId 'AbkCPY70FmvviVIB' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetUserMapping' test.out

#- 186 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'bcujF8Vk5qb8NhWW' \
    --userId 'waxyMchkt8l5IPSr' \
    > test.out 2>&1
eval_tap $? 186 'AdminCreateJusticeUser' test.out

#- 187 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'wrJl7wYIVw13NCo9' \
    --skipConflict  \
    --body '{"platformId": "yXlbQ52FTHTCj6SE", "platformUserId": "AzT7TOpyiuvvQUm2"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminLinkPlatformAccount' test.out

#- 188 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9Iacq4XRLaA643nT' \
    --userId 'MtXSAyejnny0Ju13' \
    --body '{"platformNamespace": "b6o5uB2XM6IHy7EE"}' \
    > test.out 2>&1
eval_tap $? 188 'AdminPlatformUnlinkV3' test.out

#- 189 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vHyLmcvrZZOdwe1x' \
    --userId '8RjU6Bi8JXE52sUB' \
    > test.out 2>&1
eval_tap $? 189 'AdminPlatformUnlinkAllV3' test.out

#- 190 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Bq2SimQQoLbe5YOJ' \
    --userId 'vxGRxUzrTwagH7BM' \
    --ticket 'T1IZKTdNFVBQ1crB' \
    > test.out 2>&1
eval_tap $? 190 'AdminPlatformLinkV3' test.out

#- 191 AdminDeleteUserLinkingHistoryByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingHistoryByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XAupATO8uXsqVpdi' \
    --userId 'Wo8SjDAM0Riw8wLY' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserLinkingHistoryByPlatformIDV3' test.out

#- 192 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'W3n4F3LD1EDwBXw5' \
    --userId 'uBYeQZOzATNSV9E9' \
    --platformToken 'yyNb7yaLXzAVYymO' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 193 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uhCkZu4htrsf8eIF' \
    --userId 'SovTGXaMsq8ePN1o' \
    > test.out 2>&1
eval_tap $? 193 'AdminGetUserSinglePlatformAccount' test.out

#- 194 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'co2jx8Upe8SjMvpq' \
    --body '["M8puggOEdG47gD5i", "2Ni6AnWn3NdEPhNH", "SH7eKDfRcngEpTnR"]' \
    > test.out 2>&1
eval_tap $? 194 'AdminDeleteUserRolesV3' test.out

#- 195 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UQr3RLOM1vEx4gqD' \
    --body '[{"namespace": "Y6jwyKRxhkLe5zoh", "roleId": "g9s9utRQt28b6o3K"}, {"namespace": "0COF74tz6aeXZOYw", "roleId": "bwjMNdxKWlBfnRyF"}, {"namespace": "S0Ed7gTM5AVrtBQi", "roleId": "DTcNnZa6Zuxk6u6H"}]' \
    > test.out 2>&1
eval_tap $? 195 'AdminSaveUserRoleV3' test.out

#- 196 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'XXdiC9ZDj4E4mv12' \
    --userId 'FNXypoOLl13j84P0' \
    > test.out 2>&1
eval_tap $? 196 'AdminAddUserRoleV3' test.out

#- 197 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'KqirJ4PkMFtsnFfz' \
    --userId '8Ew0X8fBuBSKLSQ4' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserRoleV3' test.out

#- 198 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GvLtz50D3rpBfBov' \
    --body '{"enabled": true, "reason": "8eq8SGNwEQO8dYXv"}' \
    > test.out 2>&1
eval_tap $? 198 'AdminUpdateUserStatusV3' test.out

#- 199 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'BSYvJBwb6CjZUMRf' \
    --body '{"emailAddress": "2VJetWsokvx3BHuT", "password": "Eczr9KjQ3ttz8MTB"}' \
    > test.out 2>&1
eval_tap $? 199 'AdminTrustlyUpdateUserIdentity' test.out

#- 200 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 't1xk9IyssSA8nP5P' \
    > test.out 2>&1
eval_tap $? 200 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 201 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'Qjpzk2Tb7iYdmNZW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "osrsVBPZ64j0HUON"}' \
    > test.out 2>&1
eval_tap $? 201 'AdminUpdateClientSecretV3' test.out

#- 202 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'scofwYLQcDvkaEII' \
    > test.out 2>&1
eval_tap $? 202 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 203 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'PoJT83zEGXmVBZLy' \
    --before 'rH9J7BoysmaORLkP' \
    --isWildcard  \
    --limit '7' \
    > test.out 2>&1
eval_tap $? 203 'AdminGetRolesV3' test.out

#- 204 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "managers": [{"displayName": "2D8UT6KOc4VPDUR9", "namespace": "ayazqXRqegIUicYX", "userId": "XzxsBFrUs9BYp6Tg"}, {"displayName": "CejBd5o7iTST7R3K", "namespace": "bbQGERMNpqWb51y5", "userId": "RUzvMfTkPy0fGvTG"}, {"displayName": "gfLKsg0b1Bq78cE5", "namespace": "O5pmPnbiPJ9j4vxm", "userId": "bH3rVaauufxkPHEl"}], "members": [{"displayName": "ug48TgfNu0rqXUOy", "namespace": "ToLPIREGIKlJt3EP", "userId": "9kKwkENQ8VOHGwbA"}, {"displayName": "DMfuOmh0lciRhVZ2", "namespace": "DeoODXMzLSrzoiBn", "userId": "Yi5UWs3tYlYeMoCi"}, {"displayName": "mJySocRvUWDOrFZK", "namespace": "PNoN9AWtLK9TFgi9", "userId": "j2XMh9WpifqjNjLO"}], "permissions": [{"action": 40, "resource": "xrDKVpULjjiw3NeV", "schedAction": 66, "schedCron": "fZbpTJezzriCDWXT", "schedRange": ["59SRu0YqUxKDc84O", "MIzvTScdbKBsAyJM", "z4ILNDvhB4Eoes9a"]}, {"action": 87, "resource": "XaJeRbzTPwD3jxF7", "schedAction": 43, "schedCron": "df3juXW4JprIb3CJ", "schedRange": ["CAtvSG8Cfa9dzOJD", "GCTHIOFjeXbsSgR4", "3kIDzxBwqRJTzrHN"]}, {"action": 90, "resource": "WUsq5lQo2jy29EJi", "schedAction": 13, "schedCron": "Tt7Wxw8OQ13t3uTw", "schedRange": ["6zQuoZcXQpoTOxe8", "y1jorNsg9ZKYCKoI", "SyXtHzoWGdYohxMp"]}], "roleName": "3uOQIybqWfG9BJ6F"}' \
    > test.out 2>&1
eval_tap $? 204 'AdminCreateRoleV3' test.out

#- 205 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'VKlbYHtbPtaxvagS' \
    > test.out 2>&1
eval_tap $? 205 'AdminGetRoleV3' test.out

#- 206 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'lpGgVTF6VeDAPOGB' \
    > test.out 2>&1
eval_tap $? 206 'AdminDeleteRoleV3' test.out

#- 207 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'wweyFfXEOEAEtbag' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "9A3tXGve6DdK6uvg"}' \
    > test.out 2>&1
eval_tap $? 207 'AdminUpdateRoleV3' test.out

#- 208 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId '8f2cIoByk9fxtvsg' \
    > test.out 2>&1
eval_tap $? 208 'AdminGetRoleAdminStatusV3' test.out

#- 209 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'eAxo57nKAbZpsbJ4' \
    > test.out 2>&1
eval_tap $? 209 'AdminUpdateAdminRoleStatusV3' test.out

#- 210 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'Iu5KJ0ynxGBlacDC' \
    > test.out 2>&1
eval_tap $? 210 'AdminRemoveRoleAdminV3' test.out

#- 211 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'dFe8ATUqVxcSthrp' \
    --after 'nMUBsnUfuQIcSbUt' \
    --before '5UGkInFGpuUsdtq4' \
    --limit '6' \
    > test.out 2>&1
eval_tap $? 211 'AdminGetRoleManagersV3' test.out

#- 212 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'VEtAr5kKKAo9MM2C' \
    --body '{"managers": [{"displayName": "qm84jVi9kIpqgrzp", "namespace": "UkNOBWydXV0Fi02a", "userId": "Fr8CDapjwNOl4k8r"}, {"displayName": "VNrm8drv8QD2JOe2", "namespace": "Ntz7EFvowPgIGuet", "userId": "xFMqXCQMAqQ2ZRGz"}, {"displayName": "NtrThFa9XU8moslu", "namespace": "iHZJ7O8sAQ32wj9u", "userId": "aDzsr9xYiWRuuzQJ"}]}' \
    > test.out 2>&1
eval_tap $? 212 'AdminAddRoleManagersV3' test.out

#- 213 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'iLc1eI9w3JEhxPGb' \
    --body '{"managers": [{"displayName": "Ek7s7gw07FlounC3", "namespace": "vJKBC7SwgoViPeIB", "userId": "4Ehy0Y5aSJVDginx"}, {"displayName": "AM77eY9C14FbfiI2", "namespace": "NPvl1kCY5bEokxXx", "userId": "kWZbjf7GZxaossQm"}, {"displayName": "jo69wohJFyTNk5FG", "namespace": "UPhR4LEZvz3EjFR7", "userId": "996Ug5m4axDV5uTc"}]}' \
    > test.out 2>&1
eval_tap $? 213 'AdminRemoveRoleManagersV3' test.out

#- 214 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'YsoahUrELQ1btjJO' \
    --after 'qQMgZWAU6E92nHJz' \
    --before 'vw7tnYtGfv0EJyjB' \
    --limit '43' \
    > test.out 2>&1
eval_tap $? 214 'AdminGetRoleMembersV3' test.out

#- 215 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'IxzPqb6n73m0jiaD' \
    --body '{"members": [{"displayName": "H86d9rsKgzCsMulp", "namespace": "B8HZUtVVaJCiLgKO", "userId": "wrSfWhT5B4Wedopz"}, {"displayName": "wSluBtRFPKThyGnb", "namespace": "jmPDKFS6u9FHuv1M", "userId": "3qfch4SqIV6LQPHl"}, {"displayName": "aeYl4csFq65cU66y", "namespace": "Jaj4ovoKWE4EW0sw", "userId": "8v5peiuxoBJATauy"}]}' \
    > test.out 2>&1
eval_tap $? 215 'AdminAddRoleMembersV3' test.out

#- 216 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'D3XCXVMiyEvMf9yi' \
    --body '{"members": [{"displayName": "lUEujk6oqYo1HQYT", "namespace": "FzwdOMdupwD4O3uN", "userId": "bcIDcIyvZbOy1T4h"}, {"displayName": "fwkuVykH4RpfmjIX", "namespace": "FGZ5PKdbabJIkNnt", "userId": "9P1Tkm08luh4dpPR"}, {"displayName": "MDbUXBWTbpAogG2w", "namespace": "lZkLhuU5FI8NijFI", "userId": "0GKwJ3vfXlsAMy2Z"}]}' \
    > test.out 2>&1
eval_tap $? 216 'AdminRemoveRoleMembersV3' test.out

#- 217 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'p2UAGxHnmSxvkG9U' \
    --body '{"permissions": [{"action": 90, "resource": "ITuymTBjn3d2sFzM", "schedAction": 91, "schedCron": "2RfcRhXpmeeHdvph", "schedRange": ["as9S7ivHEoLbUMM4", "7f1UreUpxEkXIbE1", "ETzRJZKMavu4Ul2I"]}, {"action": 1, "resource": "m1YN27bojDVaZLpx", "schedAction": 100, "schedCron": "kEWYkO6KrKUMhJrA", "schedRange": ["SBh61hmWKSSrF35a", "nDGvur19V18oIrUK", "XttgAI2QdWJFLmoP"]}, {"action": 63, "resource": "uYbe4Cf2HEHvVevh", "schedAction": 71, "schedCron": "j5vyUMAAmIHYbsxG", "schedRange": ["5N066FXb88SbLOa2", "1DiSFsm0XXQJWszv", "TQEuALzDNp1SZ58a"]}]}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateRolePermissionsV3' test.out

#- 218 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'DllwzTRHak1MXxj7' \
    --body '{"permissions": [{"action": 62, "resource": "GJT0mkVPI6zUtf3Q", "schedAction": 0, "schedCron": "9dCEzhVnOv0PQbVI", "schedRange": ["aKiHfoeorY7A1otG", "Fyv2SMjbEr50qGdC", "ZIc6EFqBKxbS7Q2O"]}, {"action": 14, "resource": "rKEPGSAcong6eNER", "schedAction": 96, "schedCron": "mOau6syme06c6SKL", "schedRange": ["c2mEC3IXl5XCbkOf", "HaGr5kdazlypvt6l", "SLfU7HByGXPMqxj4"]}, {"action": 15, "resource": "OnXpapXQGRakUbcG", "schedAction": 18, "schedCron": "PcR4eiU3Idi55jNr", "schedRange": ["GNT2VHTKuIT5FwwH", "j0Ur5F2PWGTTD81x", "hNP4t6kYBUjyXAn3"]}]}' \
    > test.out 2>&1
eval_tap $? 218 'AdminAddRolePermissionsV3' test.out

#- 219 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'bWQF6QcAiJpXIrgr' \
    --body '["oixptZhckUTGkcBO", "E4qMcH1Kyi8ZFvGc", "V8DY0XOkDstxZcY1"]' \
    > test.out 2>&1
eval_tap $? 219 'AdminDeleteRolePermissionsV3' test.out

#- 220 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '68' \
    --resource 'Kj7Yi2VvoQNW8Yc4' \
    --roleId '81dYdvGxJAMDRA1L' \
    > test.out 2>&1
eval_tap $? 220 'AdminDeleteRolePermissionV3' test.out

#- 221 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 221 'AdminGetMyUserV3' test.out

#- 222 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'F7jdWlekFwO94VBC' \
    --extendExp  \
    --redirectUri 'V9qJhWva2FPBujX0' \
    --password 'geYCpGJM4sqsPNJM' \
    --requestId 'iZXXOFwmGWAvNF0Z' \
    --userName '0GkwxUNYyNwGiKrk' \
    > test.out 2>&1
eval_tap $? 222 'UserAuthenticationV3' test.out

#- 223 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'nH0Y5mrQgLC6D2qs' \
    --linkingToken 'FiQHglUQMZi5WjMZ' \
    --password 'fOadpgegCUjTdi1E' \
    --username 'hr8OtqpNJ9R8TuNy' \
    > test.out 2>&1
eval_tap $? 223 'AuthenticationWithPlatformLinkV3' test.out

#- 224 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData '4ejmVA3vMCsGyPd1' \
    --extendExp  \
    --linkingToken '2B8QNUz0hFFNbH6j' \
    > test.out 2>&1
eval_tap $? 224 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 225 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId '2W4roZM2UKAXEEsL' \
    > test.out 2>&1
eval_tap $? 225 'RequestOneTimeLinkingCodeV3' test.out

#- 226 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode '5D0oiFchQnVeq3g2' \
    > test.out 2>&1
eval_tap $? 226 'ValidateOneTimeLinkingCodeV3' test.out

#- 227 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'AB2WIRUQmauIY5HX' \
    --isTransient  \
    --clientId 'CZ0W4XmWP0HzSdiy' \
    --oneTimeLinkCode 'lLhVYszm8xY33OQb' \
    > test.out 2>&1
eval_tap $? 227 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 228 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 228 'GetCountryLocationV3' test.out

#- 229 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 229 'Logout' test.out

#- 230 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'umu2QHLyZNuysyM4' \
    --codeChallengeMethod 'S256' \
    --clientId 'piIQFVmzMidw70KS' \
    > test.out 2>&1
eval_tap $? 230 'RequestTokenExchangeCodeV3' test.out

#- 231 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ahpYZdKZRyR9AX7J' \
    --userId 'jxvNZhM84DiZk6yS' \
    --platformUserId 'rB9SVFctW7YS0OkL' \
    > test.out 2>&1
eval_tap $? 231 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 232 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '78XeEAtALFI3v8yh' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 232 'RevokeUserV3' test.out

#- 233 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'a4pd5A7MYcpBD6lK' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'b8RxvN2u5J7baOeL' \
    --redirectUri 'H19fqBwNbNe1ffYR' \
    --scope 'tIvQaKyevWYtZjK6' \
    --state 'J29v8MpBSpo3AKRm' \
    --targetAuthPage 'nJkzJHAckUyBksYQ' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'fDm0RNFwiz70tRVL' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 233 'AuthorizeV3' test.out

#- 234 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'lHi8i9gOVqajUWrg' \
    > test.out 2>&1
eval_tap $? 234 'TokenIntrospectionV3' test.out

#- 235 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 235 'GetJWKSV3' test.out

#- 236 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'EsWDtaKzn8dZwnnG' \
    --factor 'eZsZVgbPzPFbrOMZ' \
    --mfaToken 'MgWkFN7Tpkx6Gcfy' \
    > test.out 2>&1
eval_tap $? 236 'SendMFAAuthenticationCode' test.out

#- 237 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'Og6ZUrrp9ubg9mnd' \
    --mfaToken 'W2JKmQafUs2bxYzt' \
    > test.out 2>&1
eval_tap $? 237 'Change2faMethod' test.out

#- 238 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'OEyVbKIf1ZbzgUwd' \
    --factor '8DHoCQykmXHYmkRl' \
    --mfaToken 'g7gYs6unPYQ9jNQN' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 238 'Verify2faCode' test.out

#- 239 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1di1ldhOh6HvjnYu' \
    --userId 'V7NfC4A2ODiZhbfb' \
    > test.out 2>&1
eval_tap $? 239 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 240 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId '8QqCyK1XH9D6vl5e' \
    --clientId 'FdFfgK46GjCWaP8h' \
    --redirectUri 'uTmnq3FGQn3Ahu5w' \
    --requestId 'xq6oJq4mChmQHQhO' \
    > test.out 2>&1
eval_tap $? 240 'AuthCodeRequestV3' test.out

#- 241 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId '9IKBXDFQfXFD58sG' \
    --additionalData '6uDhFYlrzJBYSeMu' \
    --clientId 'JfQecutjS029BiJW' \
    --createHeadless  \
    --deviceId 'OG1m7MKclr5igjNT' \
    --macAddress 'VItrH2X78hxJgaVf' \
    --platformToken 'w5Vnyq8OzTE89WDN' \
    --serviceLabel '0.23944956454420108' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 241 'PlatformTokenGrantV3' test.out

#- 242 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 242 'GetRevocationListV3' test.out

#- 243 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'McOmbfJrCJQIj1ha' \
    > test.out 2>&1
eval_tap $? 243 'TokenRevocationV3' test.out

#- 244 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'AosKglqaCXE9ytpI' \
    --simultaneousTicket 'O8btO3OwNEGSW5Ta' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'f2PPKOldkbgX9CWJ' \
    > test.out 2>&1
eval_tap $? 244 'SimultaneousLoginV3' test.out

#- 245 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'KwXXSbv5eg9q86Ia' \
    --clientId 'DFjjx6uZerWbtwTX' \
    --clientSecret '9gNRByjbE8lOLAfT' \
    --code 'XKLzbrddqcKLa7Le' \
    --codeVerifier 'vxNHOSEhQRZIp693' \
    --extendNamespace 'lRwtc43atCuCFxbf' \
    --extendExp  \
    --password 'bz4aQERziPL4dHhO' \
    --redirectUri 'qG5KDdUvk0LEi26L' \
    --refreshToken 's7mjRxNmvvNtjJNQ' \
    --username 'epUTGhwlY4lPzlsC' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 245 'TokenGrantV3' test.out

#- 246 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token '5rVsyfcH7WjP7HuG' \
    > test.out 2>&1
eval_tap $? 246 'VerifyTokenV3' test.out

#- 247 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'z3b5WAEvdRF9bqMj' \
    --code '4ro5B19VE838c7Oy' \
    --error 'dVw0zCqoMZvpIOO9' \
    --openidAssocHandle '7DmQ5ZOzx6iCJTu6' \
    --openidClaimedId '0IifzMhkk5Pxsjqb' \
    --openidIdentity 'CKpMv2Yky9DYkD2s' \
    --openidMode 'IllFtBtXJKG3rqBm' \
    --openidNs 'ILhtWm8RQvRUbUDS' \
    --openidOpEndpoint 'iefGEdLucrtO2gCQ' \
    --openidResponseNonce 'D057DrDlgC2nzS9S' \
    --openidReturnTo 'iGUjVAw4v3q6JRHc' \
    --openidSig 'n7KaoCEkRdo6qHYI' \
    --openidSigned 'ZWnXqQ1oHFJ9Q0vq' \
    --state 'sL9SomqWsGA76yxi' \
    > test.out 2>&1
eval_tap $? 247 'PlatformAuthenticationV3' test.out

#- 248 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId '0QzZWfmP2sx0KO5b' \
    --platformToken 'EJaPnAFjsodyJQVV' \
    > test.out 2>&1
eval_tap $? 248 'PlatformTokenRefreshV3' test.out

#- 249 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'BrShGbIIuqK8C403' \
    > test.out 2>&1
eval_tap $? 249 'PublicGetInputValidations' test.out

#- 250 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'HgoXCR6XOMXwKdfq' \
    > test.out 2>&1
eval_tap $? 250 'PublicGetInputValidationByField' test.out

#- 251 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'k8T4QHK30EX0Fclp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 251 'PublicGetCountryAgeRestrictionV3' test.out

#- 252 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'Dl5HsuracO5Mnjnx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 252 'PublicGetConfigValueV3' test.out

#- 253 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 253 'PublicGetCountryListV3' test.out

#- 254 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 254 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 255 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'D1OXkxShFVQTRekL' \
    > test.out 2>&1
eval_tap $? 255 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 256 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 256 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 257 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fjmy8zosRCRgVwbr' \
    --platformUserId 'QKmb01yA7U7dGMju' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetUserByPlatformUserIDV3' test.out

#- 258 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'pZkZQY8CNyT4k3DI' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetAsyncStatus' test.out

#- 259 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'bfT22G5NpE130YWS' \
    --limit '12' \
    --offset '40' \
    --platformBy 'xpKWtdtdtVW9anEN' \
    --platformId 'mxb9e7vXZV3ig8Jg' \
    --query '5VByeI3ycMcYYBix' \
    > test.out 2>&1
eval_tap $? 259 'PublicSearchUserV3' test.out

#- 260 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "KJXCISQdwec1m8Bu", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "lf1MfqUZXkjHvcUO", "policyId": "TlxNf09pefgFIiJs", "policyVersionId": "sShBKsQjXvfQgQDt"}, {"isAccepted": false, "localizedPolicyVersionId": "ce8NDMErA82FrR1G", "policyId": "SogkewIzTOqKkcjR", "policyVersionId": "h3l2gAJOTCbx7J3g"}, {"isAccepted": true, "localizedPolicyVersionId": "IlTk3Bpclrk4hIRn", "policyId": "0znIKzAEAHQpBOgH", "policyVersionId": "EP5l94s7CbIJ7eHn"}], "authType": "VWOboMkyB7FTexsO", "code": "Z0b2p3b63KrcwIcX", "country": "MhGy83Xit6boOLGC", "dateOfBirth": "cg16DqwdQPQ9HkSS", "displayName": "V8e1MgTTLS2FgarY", "emailAddress": "903INGIyEfRBEj7q", "password": "ms9AGQExPhgr9gGf", "reachMinimumAge": true, "uniqueDisplayName": "ecYbcOpR45VDlvSc"}' \
    > test.out 2>&1
eval_tap $? 260 'PublicCreateUserV3' test.out

#- 261 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field '0Mr7ImwCwGqOf0bN' \
    --query 's97KvKyj3MqS7Dcm' \
    > test.out 2>&1
eval_tap $? 261 'CheckUserAvailability' test.out

#- 262 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["tfh50eObbrmgjhWK", "0x0ZidAJ1CU1eD1L", "a16Bw3JbUnUDh5yG"]}' \
    > test.out 2>&1
eval_tap $? 262 'PublicBulkGetUsers' test.out

#- 263 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "jjv4Mwrv2vancmR6", "languageTag": "Z7rb21A2E9pX0BWC"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicSendRegistrationCode' test.out

#- 264 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "MqPsRk5htdM5T3fD", "emailAddress": "SrSHrkoqv2mM6soM"}' \
    > test.out 2>&1
eval_tap $? 264 'PublicVerifyRegistrationCode' test.out

#- 265 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "aTvQq2a9YdFNtRVS", "languageTag": "O0js0hG9xmSnzd7z"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicForgotPasswordV3' test.out

#- 266 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "gUxAogcnGkXk17QP", "uniqueDisplayName": "kJHRhmLKQuQVFSKi", "username": "Xl8G2uf6E8EajXLS"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicValidateUserInput' test.out

#- 267 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'AS8MKMaxQ1QyJCpK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 267 'GetAdminInvitationV3' test.out

#- 268 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'edhuzI7G9NCKKXu1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "bqI2M5PmXfKnQ7BY", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "jCUDMOrbmoRvWnfm", "policyId": "GFy0eUoOBd90h9ED", "policyVersionId": "qSTOfoNewWjwMWDK"}, {"isAccepted": true, "localizedPolicyVersionId": "ye7fCwi7Il2wIFlH", "policyId": "m9N6owMHMtJy1Oqn", "policyVersionId": "59tEGm9NYeUT5P0n"}, {"isAccepted": true, "localizedPolicyVersionId": "VUGgGHkapTCafFMd", "policyId": "vYiCBuzUUwyI6Vtd", "policyVersionId": "4v9k4fv3kMiuQ3Dh"}], "authType": "sKLxjt5srPFxBgpF", "code": "tDBmTLH9kP9U53z6", "country": "joBAhAlJGI2YYb6a", "dateOfBirth": "jBjgq6eY4PBNHKPx", "displayName": "62tHxDb06ZFy3ugl", "emailAddress": "Sp2UxvF2uLXWilRD", "password": "7HD6LCgdFxRGj00R", "reachMinimumAge": false, "uniqueDisplayName": "6LvcnGMJbJIYLssM"}' \
    > test.out 2>&1
eval_tap $? 268 'CreateUserFromInvitationV3' test.out

#- 269 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "vy9gkfTMRrXVRcAV", "country": "RDX6gmDfNfPGYYST", "dateOfBirth": "unMgt3C8hEguCqlM", "displayName": "HiQN3HWJw9zIWsiP", "languageTag": "2JQ24meDrwEuTyM2", "uniqueDisplayName": "qohglzO8AEl6A9sh", "userName": "2x2ur2ccp7R7OqPq"}' \
    > test.out 2>&1
eval_tap $? 269 'UpdateUserV3' test.out

#- 270 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "IjS4i0N9ytb3c8pV", "country": "Z8GlU8962e6gtn5p", "dateOfBirth": "UARJM1T8QwMNOAzX", "displayName": "myHEV4g9P6a280S5", "languageTag": "RNB5dVCsB7xL4axS", "uniqueDisplayName": "PgPCiwLxCFLDixZw", "userName": "Vtt3RVTl0tR00oQg"}' \
    > test.out 2>&1
eval_tap $? 270 'PublicPartialUpdateUserV3' test.out

#- 271 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "cHdGGK3x76U1EIck", "emailAddress": "lttmrpgF5szl0sMY", "languageTag": "8es36r1FgR70eNLH"}' \
    > test.out 2>&1
eval_tap $? 271 'PublicSendVerificationCodeV3' test.out

#- 272 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "kVrEFd8xArWJuCAI", "contactType": "fNBSHgpFNw9K9pmA", "languageTag": "Ic6VSfE9nbE2PMv1", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 272 'PublicUserVerificationV3' test.out

#- 273 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "kujxbCu1HFaj6Vxs", "country": "3GuA4S1dS7H7yIS7", "dateOfBirth": "b5TSDRIoMg7Dc5AP", "displayName": "zfzXDELJFaIaEMW5", "emailAddress": "bhJyL72WDyhBsCCb", "password": "nfihnXKxGxaupnTT", "uniqueDisplayName": "q9ihZkvFKfSHQh8I", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 273 'PublicUpgradeHeadlessAccountV3' test.out

#- 274 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "xk3sFl0cbuCRM69X", "password": "KkLwioRaKnWhlh80"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicVerifyHeadlessAccountV3' test.out

#- 275 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "BhYe2fJDS6T75Q4u", "mfaToken": "lonMFjmYqE1wJhfo", "newPassword": "gWg2Apm0sUy18aWn", "oldPassword": "65Co0vdCk8so6JSa"}' \
    > test.out 2>&1
eval_tap $? 275 'PublicUpdatePasswordV3' test.out

#- 276 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'ZAIadKDEZywonA2S' \
    > test.out 2>&1
eval_tap $? 276 'PublicCreateJusticeUser' test.out

#- 277 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rEdN2tmGuX6r0gBV' \
    --redirectUri 'UUeKKlPKtE6gnYxm' \
    --ticket 'kmCWbs5qugklBUS6' \
    > test.out 2>&1
eval_tap $? 277 'PublicPlatformLinkV3' test.out

#- 278 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uwWrCQt86Jrg8tLA' \
    --body '{"platformNamespace": "JWpcyNkUvqn6eXr6"}' \
    > test.out 2>&1
eval_tap $? 278 'PublicPlatformUnlinkV3' test.out

#- 279 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FNbKJ05Orya6LSSU' \
    > test.out 2>&1
eval_tap $? 279 'PublicPlatformUnlinkAllV3' test.out

#- 280 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lugIAknXcSaVYcAY' \
    --ticket 'p7qSiDvsfMUOpWv4' \
    > test.out 2>&1
eval_tap $? 280 'PublicForcePlatformLinkV3' test.out

#- 281 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId '6sXvpOjrpRo4mYrC' \
    --clientId 'eQUnYoID2UqO0iAX' \
    --redirectUri 'A9dB4ib8HDOJ8TNi' \
    > test.out 2>&1
eval_tap $? 281 'PublicWebLinkPlatform' test.out

#- 282 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'P8KgEAj3dbRTI0i6' \
    --code 'dO3zkbDseh4tJdoG' \
    --state 'cwMBmegqVUaWMJBj' \
    > test.out 2>&1
eval_tap $? 282 'PublicWebLinkPlatformEstablish' test.out

#- 283 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rV0p9A7tcHrV0MbJ' \
    --code 'Gr4drgkDuWS05m0p' \
    --state 'GzazM2BUXnzUEWTi' \
    > test.out 2>&1
eval_tap $? 283 'PublicProcessWebLinkPlatformV3' test.out

#- 284 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "KMJAf6AgbiEDMfCc", "userIds": ["kWogE5gcfF8AMGZ2", "FBS93Mg6TKwdRMra", "DLrwh3d0ykRGkgqU"]}' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetUsersPlatformInfosV3' test.out

#- 285 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "NIbJMJ9ABbKVWO2Y", "emailAddress": "EDiqkwKbpdk7wlDn", "newPassword": "gNiPPjpSAlZwFGpe"}' \
    > test.out 2>&1
eval_tap $? 285 'ResetPasswordV3' test.out

#- 286 PublicGetUserByUserIdV3
eval_tap 0 286 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 287 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'a5ObBB49Km4ClIQm' \
    --activeOnly  \
    --after 'kIdLCvNhZ6P8aqZ2' \
    --before 'yfrC1V7ZpJZPHCMq' \
    --limit '44' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetUserBanHistoryV3' test.out

#- 288 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GQAeh0VTiTP4PSrX' \
    > test.out 2>&1
eval_tap $? 288 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 289 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'US6jYI9lsQFD43Df' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetUserInformationV3' test.out

#- 290 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5qUZOFzpFd6b5Jc5' \
    --after '0.738200476284595' \
    --before '0.49850329512665814' \
    --limit '94' \
    > test.out 2>&1
eval_tap $? 290 'PublicGetUserLoginHistoriesV3' test.out

#- 291 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LzynjFZgF3erw7Us' \
    --after 'yHq4bBb0n1JhPUS8' \
    --before 'BRPGV9n769zLJdKM' \
    --limit '9' \
    --platformId 'zDgDAtqE3kuybwTQ' \
    > test.out 2>&1
eval_tap $? 291 'PublicGetUserPlatformAccountsV3' test.out

#- 292 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FYEJjIYwqfSRy8Gg' \
    > test.out 2>&1
eval_tap $? 292 'PublicListJusticePlatformAccountsV3' test.out

#- 293 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vk77fd1GS5YkyhAi' \
    --body '{"platformId": "AItnWUmD225fp1eg", "platformUserId": "sx3ErheNwqd5pric"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicLinkPlatformAccount' test.out

#- 294 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'lNNqLyrlzrJ4QHbf' \
    --body '{"chosenNamespaces": ["nAdtkujxHff7n1ya", "NCcjgFhS0URBhl0L", "5FCbOn46W2B2uPQL"], "requestId": "rt2t6bVpCgKvPXSD"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicForceLinkPlatformWithProgression' test.out

#- 295 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ufmKh783cV54JsVB' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetPublisherUserV3' test.out

#- 296 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RB0rY0xfWddACyHS' \
    --password 'mo4KX9TPO3K1k5ZM' \
    > test.out 2>&1
eval_tap $? 296 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 297 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after '8btmGsgXNXbpqxh7' \
    --before '6Af5JSwjw2fE2g6j' \
    --isWildcard  \
    --limit '44' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetRolesV3' test.out

#- 298 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'V7oai2oDm9FaP0HJ' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetRoleV3' test.out

#- 299 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 299 'PublicGetMyUserV3' test.out

#- 300 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode '98tE4UyoQg0b0sGO' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 301 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["kzxVt15LKmkQ7YBh", "sOuJ0ypkkt2G4eFh", "2YNsdoxpLTBM9Q8t"], "oneTimeLinkCode": "829Ido1JyveSRiBq"}' \
    > test.out 2>&1
eval_tap $? 301 'LinkHeadlessAccountToMyAccountV3' test.out

#- 302 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "23kyH9jQbHWkcVk0"}' \
    > test.out 2>&1
eval_tap $? 302 'PublicSendVerificationLinkV3' test.out

#- 303 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'X28GS54vl7gIKBc7' \
    > test.out 2>&1
eval_tap $? 303 'PublicVerifyUserByLinkV3' test.out

#- 304 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'OYTylFRAJKySnC0c' \
    --code 'fPl3Z2zSBbs4PAV7' \
    --error '2u8AxE2IQeoxYV4U' \
    --state 'cYzswAGpXqQxctuV' \
    > test.out 2>&1
eval_tap $? 304 'PlatformAuthenticateSAMLV3Handler' test.out

#- 305 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'aqPJGAHEZmuQrZ8G' \
    --payload 'aQ4OZ2nDodm4TNs8' \
    > test.out 2>&1
eval_tap $? 305 'LoginSSOClient' test.out

#- 306 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'mAj6IKSYFdJwgZsR' \
    > test.out 2>&1
eval_tap $? 306 'LogoutSSOClient' test.out

#- 307 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'POzwuDSdGl1A2vaN' \
    --code 'eDiSqTfmAVg50kOd' \
    > test.out 2>&1
eval_tap $? 307 'RequestTargetTokenResponseV3' test.out

#- 308 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '73' \
    --namespace "$AB_NAMESPACE" \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 308 'AdminListInvitationHistoriesV4' test.out

#- 309 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'agEmTuaxlxgywkbd' \
    > test.out 2>&1
eval_tap $? 309 'AdminGetDevicesByUserV4' test.out

#- 310 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'OsyxX1tfW488oYUT' \
    --endDate '4jyCVJ0V8obTlGVT' \
    --limit '16' \
    --offset '26' \
    --startDate 'z4bm41oIcV33yjPx' \
    > test.out 2>&1
eval_tap $? 310 'AdminGetBannedDevicesV4' test.out

#- 311 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ibDjfF7JkjCVpZKM' \
    > test.out 2>&1
eval_tap $? 311 'AdminGetUserDeviceBansV4' test.out

#- 312 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "xkFkBtXMU6KRIm5x", "deviceId": "BoIi99ctgFXasxp5", "deviceType": "h780ktjQw2yXzaQW", "enabled": false, "endDate": "rDXVwCkhOQ161TFj", "ext": {"ROYJm75VIuCOCkt2": {}, "W1DfI8QtgODk9K6D": {}, "cMnyCPn1FylWdaNV": {}}, "reason": "1VaZTkbbuWiiA4UT"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminBanDeviceV4' test.out

#- 313 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'DgS2SVEo5M80LLbk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 313 'AdminGetDeviceBanV4' test.out

#- 314 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'u9GYH4ijqOVM50tC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 314 'AdminUpdateDeviceBanV4' test.out

#- 315 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'PbklTHcmgXsrVj3M' \
    --startDate 'jml6BpCODWGOLMmC' \
    --deviceType 'ZUeelXYyNrXweiCn' \
    > test.out 2>&1
eval_tap $? 315 'AdminGenerateReportV4' test.out

#- 316 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 316 'AdminGetDeviceTypesV4' test.out

#- 317 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'DldRPRfd6mLZ0GTJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 317 'AdminGetDeviceBansV4' test.out

#- 318 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'wEjoZrRtaeWKMC8w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 318 'AdminDecryptDeviceV4' test.out

#- 319 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'sOByQAMAgqFEzEt8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 319 'AdminUnbanDeviceV4' test.out

#- 320 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'umj5XhKnw7MHDwFV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 320 'AdminGetUsersByDeviceV4' test.out

#- 321 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 321 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 322 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 322 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 323 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 96}' \
    > test.out 2>&1
eval_tap $? 323 'AdminCreateTestUsersV4' test.out

#- 324 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "C2ecnpUDqvLQixPK", "policyId": "VSmWa8TGko16XTqH", "policyVersionId": "c0cM7ixq8Tjnxp5C"}, {"isAccepted": false, "localizedPolicyVersionId": "CbMn0Oia336uiiMT", "policyId": "AductvUfVwLahtRe", "policyVersionId": "dh1SiZlOpIQ8GL7j"}, {"isAccepted": true, "localizedPolicyVersionId": "cA8iKcF0bkfjcTEF", "policyId": "XcTwEtnHxP5pVtN4", "policyVersionId": "jNVIdruEA39uCJzs"}], "authType": "EMAILPASSWD", "code": "uHVskfCjUK8GeX4Q", "country": "0B2Cj0oOmBmXu1Ki", "dateOfBirth": "TTiz7yrIvQj2isN7", "displayName": "bRwcr16lW5YwgZpj", "emailAddress": "lMMtPWg8217m7qNk", "password": "QiKp2oac8QTNEuBb", "passwordMD5Sum": "euQqm9wM7mgTtUdP", "reachMinimumAge": false, "uniqueDisplayName": "cQijMBhs0kDP6d3n", "username": "uUZ41mSeS9SnGqhJ"}' \
    > test.out 2>&1
eval_tap $? 324 'AdminCreateUserV4' test.out

#- 325 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["vykBcDpzD9zh6dtP", "K4fVHLMvrCsH3RYx", "H2Up9VthPjFrK7Hi"]}' \
    > test.out 2>&1
eval_tap $? 325 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 326 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["p0eONFDgUPShG8ww", "FKY9AMpcwJd4Srig", "IxAhbFMZfxaznlDQ"]}' \
    > test.out 2>&1
eval_tap $? 326 'AdminBulkCheckValidUserIDV4' test.out

#- 327 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bzTiFrQB1yUonirH' \
    --body '{"avatarUrl": "4URx3NkKQBYrlUaM", "country": "iFEWUT8cAFO5zEw8", "dateOfBirth": "GENEJYPKxxOw7xNQ", "displayName": "98IEbc9YITN98j4P", "languageTag": "2AGeidXRRnIAJfKV", "skipLoginQueue": false, "uniqueDisplayName": "jqwgKvfXXs8pDqm3", "userName": "1AZSRkuw6q8FgqG4"}' \
    > test.out 2>&1
eval_tap $? 327 'AdminUpdateUserV4' test.out

#- 328 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '6RsFK7eYlSU3vYcH' \
    --body '{"code": "ZZjFegVnZOn0tk4I", "emailAddress": "ATSIefcqNEn4IZ0D"}' \
    > test.out 2>&1
eval_tap $? 328 'AdminUpdateUserEmailAddressV4' test.out

#- 329 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'v6b8WtaMVvLbG04K' \
    > test.out 2>&1
eval_tap $? 329 'AdminDisableUserMFAV4' test.out

#- 330 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Knh3jvW0Qp3kTyL4' \
    > test.out 2>&1
eval_tap $? 330 'AdminListUserRolesV4' test.out

#- 331 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CsLwiWUMcpxn4B6X' \
    --body '{"assignedNamespaces": ["oTNMuqZTHwo1IAJQ", "pb6r8ZeaSHwQuiH3", "Ozu4G6bXxp0gYZyF"], "roleId": "9fJBJkSOrF9Dg4Fc"}' \
    > test.out 2>&1
eval_tap $? 331 'AdminUpdateUserRoleV4' test.out

#- 332 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DwBGyBiHewZkwEeu' \
    --body '{"assignedNamespaces": ["zBBRSknxyWkZObuv", "ig8sMuss76ezTrsD", "ZNYUV48Oh6I45X7H"], "roleId": "vUtPYONZdFk75lkj"}' \
    > test.out 2>&1
eval_tap $? 332 'AdminAddUserRoleV4' test.out

#- 333 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QNHrjaboGomguUqe' \
    --body '{"assignedNamespaces": ["uZh5qtrRbNnGejdT", "GvZgN5hshSe5YmZX", "KEQLkM6o3eGSP4Ht"], "roleId": "mr90TqGf0OyqJ9ib"}' \
    > test.out 2>&1
eval_tap $? 333 'AdminRemoveUserRoleV4' test.out

#- 334 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '73' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 334 'AdminGetRolesV4' test.out

#- 335 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "RgoxNwp1lGkYoq8H"}' \
    > test.out 2>&1
eval_tap $? 335 'AdminCreateRoleV4' test.out

#- 336 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'P1TM0tefVQPWX1NP' \
    > test.out 2>&1
eval_tap $? 336 'AdminGetRoleV4' test.out

#- 337 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'O5Wn7rNG8rGp7Fad' \
    > test.out 2>&1
eval_tap $? 337 'AdminDeleteRoleV4' test.out

#- 338 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'vo5EzpX0IttsRezy' \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "roleName": "sf94ALBmvdncQkcZ"}' \
    > test.out 2>&1
eval_tap $? 338 'AdminUpdateRoleV4' test.out

#- 339 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'b8cWdVH9bww15zZs' \
    --body '{"permissions": [{"action": 0, "resource": "nt1iBV8DpbjGts4U", "schedAction": 82, "schedCron": "DTfhAyZKhqilty9N", "schedRange": ["VlgxUmnfdOAmu1dX", "1NqD20RUvvYeJZw6", "QZFN7wFCnqpvNesG"]}, {"action": 18, "resource": "6iwkJIYOLarmpWyv", "schedAction": 16, "schedCron": "E1K0SvGrMYwPmPXC", "schedRange": ["2LfL2m5rP2A20t6f", "oPPH94SUinY5diUl", "qgvY7dPPyahppgxJ"]}, {"action": 15, "resource": "NL2UCWUtaAD7ZZx1", "schedAction": 18, "schedCron": "HLvWFsXHtMP0k9L5", "schedRange": ["dREQbCqfh0gpABFB", "ER6WNcDOsRzBkf9A", "6HjCnFRdSihcvszz"]}]}' \
    > test.out 2>&1
eval_tap $? 339 'AdminUpdateRolePermissionsV4' test.out

#- 340 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'QLZBktk0siMup01k' \
    --body '{"permissions": [{"action": 49, "resource": "wGhdZJkkGhYvXYMI", "schedAction": 50, "schedCron": "HVZMKGBnzh4suaGI", "schedRange": ["zttTncVBf5g3oeuH", "iNyLkfPQPmjUkvSs", "5YmIejozmG5HlrIf"]}, {"action": 79, "resource": "uV5phhU315LUC6HS", "schedAction": 79, "schedCron": "miJX4CjKCeIRIr99", "schedRange": ["7KKpJXTLbYWpqeXj", "af1f5fjNMZjKJ05p", "uX3197WrMnJtovSM"]}, {"action": 65, "resource": "GX6mKBbgTD9xL07Z", "schedAction": 53, "schedCron": "MNZ68eovHSH3xV3U", "schedRange": ["RIRVDYBd6hMB0l7s", "g7IfMH5Tu1ky1ZYv", "yeHmfoFkUDP864sh"]}]}' \
    > test.out 2>&1
eval_tap $? 340 'AdminAddRolePermissionsV4' test.out

#- 341 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'bnQ3bVvuvpsDJXPC' \
    --body '["WkX4Kpi8CJ88aMPG", "FFAQZbfbmVTEbiRq", "5Juikmpat75rVbN9"]' \
    > test.out 2>&1
eval_tap $? 341 'AdminDeleteRolePermissionsV4' test.out

#- 342 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'ZBtzJ33tCwv8H1f4' \
    --after '51FVZ630HNBYZSrz' \
    --before '7pMjESLLMPKDXLki' \
    --limit '84' \
    > test.out 2>&1
eval_tap $? 342 'AdminListAssignedUsersV4' test.out

#- 343 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'JLb5f3SBMyJUdwEB' \
    --body '{"assignedNamespaces": ["RrHAWUFqTooGGnPE", "gY0t7QQWl42byOwX", "gKyPhXmcysae8HpW"], "namespace": "H4xiz3fWthJSu2pU", "userId": "IIuPLFAtcWhjAP57"}' \
    > test.out 2>&1
eval_tap $? 343 'AdminAssignUserToRoleV4' test.out

#- 344 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'QbWvSSp71zEPPfmA' \
    --body '{"namespace": "QiqRRC2caquMRtQO", "userId": "ILcaDqUITBHQR5IS"}' \
    > test.out 2>&1
eval_tap $? 344 'AdminRevokeUserFromRoleV4' test.out

#- 345 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["NoFR3GUxdMuvmL0U", "BfwzaaeP3Wd0Wrb8", "s3GW0CY0vAfbq8xo"], "emailAddresses": ["Curq4lpHXrbVBh60", "NUA2aKQwnXrmi6ya", "8u4sQPvaf1AcweR7"], "isAdmin": true, "isNewStudio": true, "languageTag": "JW3MLMob1hUnIzIp", "namespace": "UM8KK1kGFN0NUNGK", "roleId": "xdlAUDFQuGPzAuT7"}' \
    > test.out 2>&1
eval_tap $? 345 'AdminInviteUserNewV4' test.out

#- 346 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "M6OBrNwioKnXPVZa", "country": "DcXsV1TnsZioDiBg", "dateOfBirth": "przahPB0FKMa0Yey", "displayName": "NBQWUHDBnBeePkqg", "languageTag": "6Zt1Lr5BlO8K6LH4", "skipLoginQueue": false, "uniqueDisplayName": "KOlDOy5vhSkxERZ2", "userName": "AQ1jvXYBar5RMmmG"}' \
    > test.out 2>&1
eval_tap $? 346 'AdminUpdateMyUserV4' test.out

#- 347 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"mfaToken": "dWl0wpj5tVfKU3D8"}' \
    > test.out 2>&1
eval_tap $? 347 'AdminDisableMyAuthenticatorV4' test.out

#- 348 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'WVPh0Z7YiGE2cyzT' \
    > test.out 2>&1
eval_tap $? 348 'AdminEnableMyAuthenticatorV4' test.out

#- 349 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 349 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 350 AdminGetMyBackupCodesV4
eval_tap 0 350 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 351 AdminGenerateMyBackupCodesV4
eval_tap 0 351 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 352 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"mfaToken": "MBY7Xd0OoENg2Lw7"}' \
    > test.out 2>&1
eval_tap $? 352 'AdminDisableMyBackupCodesV4' test.out

#- 353 AdminDownloadMyBackupCodesV4
eval_tap 0 353 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 354 AdminEnableMyBackupCodesV4
eval_tap 0 354 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 355 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'uepmahXojVZYz2zM' \
    > test.out 2>&1
eval_tap $? 355 'AdminGetBackupCodesV4' test.out

#- 356 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'U9jLzNV3GaG43R6n' \
    > test.out 2>&1
eval_tap $? 356 'AdminGenerateBackupCodesV4' test.out

#- 357 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'lRPrEAYqRBeSc5uS' \
    > test.out 2>&1
eval_tap $? 357 'AdminEnableBackupCodesV4' test.out

#- 358 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code 'hoj3dGHMeoi5DBOs' \
    --factor 'Q0Gax0iX05IT9Ags' \
    > test.out 2>&1
eval_tap $? 358 'AdminChallengeMyMFAV4' test.out

#- 359 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'jl5NmnSHhxNmCe4t' \
    > test.out 2>&1
eval_tap $? 359 'AdminSendMyMFAEmailCodeV4' test.out

#- 360 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"mfaToken": "xY0MsPc9EMgf9JCJ"}' \
    > test.out 2>&1
eval_tap $? 360 'AdminDisableMyEmailV4' test.out

#- 361 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'iEvhL8ZfwCVJW9ys' \
    > test.out 2>&1
eval_tap $? 361 'AdminEnableMyEmailV4' test.out

#- 362 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 362 'AdminGetMyEnabledFactorsV4' test.out

#- 363 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'pUOyHC9eKeXzrvzB' \
    > test.out 2>&1
eval_tap $? 363 'AdminMakeFactorMyDefaultV4' test.out

#- 364 AdminGetMyMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 364 'AdminGetMyMFAStatusV4' test.out

#- 365 AdminInviteUserV4
eval_tap 0 365 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 366 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'llwzyC1aTWEmPgoy' \
    --linkingToken '4TkpEw4Zeid4mRoF' \
    --password 'Nxv10ckMQVjKk3bW' \
    --username 'J0ZuYSe3sI0x2hc8' \
    > test.out 2>&1
eval_tap $? 366 'AuthenticationWithPlatformLinkV4' test.out

#- 367 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'vaN1Off5gRZZMW3h' \
    --extendExp  \
    --linkingToken 'uAIzBPWBYKAEFTdl' \
    > test.out 2>&1
eval_tap $? 367 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 368 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'KNh6GTzKjsCqxx24' \
    --factor 'QM35bSkFrvGciNHb' \
    --mfaToken '7OY5YIpOLJW52uz3' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 368 'Verify2faCodeV4' test.out

#- 369 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'c8pz63M0g4xXT5Ts' \
    --codeChallenge '4e0uR47OzUGHeBKt' \
    --codeChallengeMethod 'plain' \
    --additionalData '4ezBRSiOyReviDax' \
    --clientId 'lPdhwmcH03yoMxzR' \
    --createHeadless  \
    --deviceId 'R6xd9rTh3ureaIbx' \
    --macAddress 'M3Wev9pZQjWAN0tn' \
    --platformToken 'y16ZHZtuSJGQCrM7' \
    --serviceLabel '0.5753151567209973' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 369 'PlatformTokenGrantV4' test.out

#- 370 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'EMRPkdTcAzkIlndN' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'JA27Qz5SjzQfOLYu' \
    --simultaneousTicket '9O46OOzz9p57qSpH' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'JRY807VmBT4wZXQZ' \
    > test.out 2>&1
eval_tap $? 370 'SimultaneousLoginV4' test.out

#- 371 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'ZrSsuYiIPei0pXgl' \
    --codeChallengeMethod 'S256' \
    --additionalData 'MkrnHs1Iyhwqk140' \
    --clientId 'MolIrnlkRVbcX435' \
    --clientSecret 'TDYpkk2Gza6DrSyc' \
    --code 'ophHw3EoEEClTO9S' \
    --codeVerifier 'DKnMlnKW9jiNMu9Q' \
    --extendNamespace 'VrMeD4bD8gISE34y' \
    --extendExp  \
    --loginQueueTicket 'IAZQeigiA3wBrmBY' \
    --password 'IlZeheP72AB8EO3Y' \
    --redirectUri 'rlyrWowUpUDVLlTt' \
    --refreshToken 'uJJsHZVsG6izJZru' \
    --username 'OJvSRFLDSdj8elbt' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 371 'TokenGrantV4' test.out

#- 372 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'hfIMStMnSqrKWYOu' \
    --code 'ITlYS2RYaD9WNKGh' \
    > test.out 2>&1
eval_tap $? 372 'RequestTargetTokenResponseV4' test.out

#- 373 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bLhjz1v0RBIO2rkJ' \
    --rawPUID  \
    --body '{"platformUserIds": ["GmPaK6HEVIQJd393", "0TGewjRyfo4nWVZZ", "bKFsKOmgEhjH2wFz"]}' \
    > test.out 2>&1
eval_tap $? 373 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 374 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "iQyr5cb5YL6fwBia", "policyId": "VPmmn0T5uzlmi2NY", "policyVersionId": "26xrkPPdg3pXjmtp"}, {"isAccepted": false, "localizedPolicyVersionId": "ZbYVD8RiaTsdD4d3", "policyId": "kSbTkHPMUvOAUXkw", "policyVersionId": "36cr2WJQqS7Tq4YI"}, {"isAccepted": true, "localizedPolicyVersionId": "yCSXBqJqjAbVwSao", "policyId": "j1ugjr8mPkr3tZ50", "policyVersionId": "6ERSVy5M3rrkxu0U"}], "authType": "EMAILPASSWD", "country": "h9gCNVZxHGxhZqNX", "dateOfBirth": "J6JXSh0Z3SWISs1d", "displayName": "YrJKmx1BT6iLFQej", "emailAddress": "NZJNF2hm0TqBQprH", "password": "n3whPKU5abnqw8fF", "passwordMD5Sum": "a30pVbhr1BHh1arZ", "uniqueDisplayName": "AyuLcZoEkPpqKhP2", "username": "jWnRTglw0gdWoE4e", "verified": true}' \
    > test.out 2>&1
eval_tap $? 374 'PublicCreateTestUserV4' test.out

#- 375 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "VyCC0EQwE0cXokXb", "policyId": "wKDtVmrYQu7hZvHf", "policyVersionId": "iT9s9pK8HuUY1QQH"}, {"isAccepted": true, "localizedPolicyVersionId": "0NCEddJtx6GV01vD", "policyId": "7lNLxlpvqaB9P9Ga", "policyVersionId": "ukfCEIeSBLhTfzig"}, {"isAccepted": true, "localizedPolicyVersionId": "fwucHRL3o2NstrL6", "policyId": "TsJeRcE7GuwKn63K", "policyVersionId": "IDTkUCqbbHGJGOTv"}], "authType": "EMAILPASSWD", "code": "KRTHDntaFiufH2YR", "country": "6QU7fj6w17arNs12", "dateOfBirth": "hOoLVM7UFnuJDzeE", "displayName": "kDxaVogxHrOon2OW", "emailAddress": "4Zw5QwVKWNy2tnF2", "password": "MifJR4hr4gdJDujY", "passwordMD5Sum": "nVnFK6gB6ZxC6yYU", "reachMinimumAge": false, "uniqueDisplayName": "UJYnQ3jOGmROIqxq", "username": "Q0gcNeTflyvUh3w5"}' \
    > test.out 2>&1
eval_tap $? 375 'PublicCreateUserV4' test.out

#- 376 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'ZtfwmOCKpFSMF0tf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "IZCTNiIRc9fEjkZh", "policyId": "EpAJMCxMp2J0hDg2", "policyVersionId": "kMgkvhoQe9gD9tGN"}, {"isAccepted": false, "localizedPolicyVersionId": "dweG0sFHxTHa2k60", "policyId": "SzCqUgq1gLbcIMev", "policyVersionId": "TmC631p7q794bu49"}, {"isAccepted": false, "localizedPolicyVersionId": "JHkWMSUbqByWN2BC", "policyId": "nRz9w2nur0B9jKau", "policyVersionId": "nAcylsau7wRQmL4i"}], "authType": "EMAILPASSWD", "code": "eRyIECEDa1I4lwXq", "country": "wPfq3VzHQjtolx64", "dateOfBirth": "w1gyvjacKtGqxMno", "displayName": "AXRlcq0mYWKQYlqM", "emailAddress": "mu2pvF6rP03bQaq1", "password": "cT88H6RCW8gJmGzD", "passwordMD5Sum": "lqxtLsR2AGOiPhNt", "reachMinimumAge": false, "uniqueDisplayName": "VU1HED9CGo9aUXj3", "username": "rh0UyqxVWlIMY5tT"}' \
    > test.out 2>&1
eval_tap $? 376 'CreateUserFromInvitationV4' test.out

#- 377 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "Jw4KV104MtMhKHmS", "country": "jqPuQZX5KjdNrEwf", "dateOfBirth": "Wo2MwulLg4bsO4YH", "displayName": "EYLjTSNDf3zazm6p", "languageTag": "5Y1tkG9WwU4Ty6Ch", "uniqueDisplayName": "5QYyFjuBquE7xssm", "userName": "4hxczskbSUbOZ9WN"}' \
    > test.out 2>&1
eval_tap $? 377 'PublicUpdateUserV4' test.out

#- 378 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "l3apJmNAbl1g5ZmT", "emailAddress": "TGYRbP4QVey9pEz1"}' \
    > test.out 2>&1
eval_tap $? 378 'PublicUpdateUserEmailAddressV4' test.out

#- 379 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "TV5cUtPBsw01i5Mf", "country": "7WvbNSeeDNfUESLl", "dateOfBirth": "wHv3JgteOLyKp8a1", "displayName": "VqxXnRhDd9TGkO6a", "emailAddress": "IYqftw1SrM2nhSEa", "password": "nfUYrMU6A43UKGpv", "reachMinimumAge": true, "uniqueDisplayName": "tBW3pvAJJieHhveG", "username": "g97PY0txzvYwv7at", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 379 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 380 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "YCbG0UyYUJmNL8p6", "password": "AbdtU0CDrlQpKB8q", "username": "oel2QK3aSOYdmMDi"}' \
    > test.out 2>&1
eval_tap $? 380 'PublicUpgradeHeadlessAccountV4' test.out

#- 381 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "kc3Fjm9HoQDemtiQ"}' \
    > test.out 2>&1
eval_tap $? 381 'PublicDisableMyAuthenticatorV4' test.out

#- 382 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'vURYZCeF30RT9rBg' \
    > test.out 2>&1
eval_tap $? 382 'PublicEnableMyAuthenticatorV4' test.out

#- 383 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 383 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 384 PublicGetMyBackupCodesV4
eval_tap 0 384 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 PublicGenerateMyBackupCodesV4
eval_tap 0 385 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 386 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "M8o7lxXq7TkdM7FV"}' \
    > test.out 2>&1
eval_tap $? 386 'PublicDisableMyBackupCodesV4' test.out

#- 387 PublicDownloadMyBackupCodesV4
eval_tap 0 387 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 388 PublicEnableMyBackupCodesV4
eval_tap 0 388 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 389 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'DCBcvVegrZddP8lL' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetBackupCodesV4' test.out

#- 390 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'Qo6tHj4z4cAM4LMJ' \
    > test.out 2>&1
eval_tap $? 390 'PublicGenerateBackupCodesV4' test.out

#- 391 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 391 'PublicEnableBackupCodesV4' test.out

#- 392 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'fWNZIxAgBpeubprK' \
    --factor 'X68jTyRd3LrR1x6U' \
    > test.out 2>&1
eval_tap $? 392 'PublicChallengeMyMFAV4' test.out

#- 393 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken '1v6zSLjm9zmzUW0v' \
    > test.out 2>&1
eval_tap $? 393 'PublicRemoveTrustedDeviceV4' test.out

#- 394 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'Pj90jmLTt5YQGawc' \
    > test.out 2>&1
eval_tap $? 394 'PublicSendMyMFAEmailCodeV4' test.out

#- 395 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"mfaToken": "omPoiYoQ1f1AYq30"}' \
    > test.out 2>&1
eval_tap $? 395 'PublicDisableMyEmailV4' test.out

#- 396 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code '6Pysv4VPaZWolXyp' \
    > test.out 2>&1
eval_tap $? 396 'PublicEnableMyEmailV4' test.out

#- 397 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 397 'PublicGetMyEnabledFactorsV4' test.out

#- 398 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'wucUqqqff2iWi4yP' \
    > test.out 2>&1
eval_tap $? 398 'PublicMakeFactorMyDefaultV4' test.out

#- 399 PublicGetMyMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 399 'PublicGetMyMFAStatusV4' test.out

#- 400 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '3uqNcig6YcDA8Z3g' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 401 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "62oGYwkrjLI4EHJE", "emailAddress": "EWgki9fbdvUMDZeO", "languageTag": "4U55wdCpVpnENiTc", "namespace": "9NESV22eRBElD4K2", "namespaceDisplayName": "Cy1tJcPAEkCeV29Q"}' \
    > test.out 2>&1
eval_tap $? 401 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE