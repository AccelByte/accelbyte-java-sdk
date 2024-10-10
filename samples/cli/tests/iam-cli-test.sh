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
echo "1..418"

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
    --body '{"context": "uNGKhaLlJzJMSnJI", "emailAddress": "IgsAVmaGYxUX1B9o", "languageTag": "VuzG2CnYX2YBF2g7"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminSendVerificationCodeV3' test.out

#- 179 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TVtzYEHUodh3iUfB' \
    --body '{"Code": "thbepUCTWiZ1uqh7", "ContactType": "GAi4FEIu44u83ZLR", "LanguageTag": "xYlYqlpq03BGdIk4", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 179 'AdminVerifyAccountV3' test.out

#- 180 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'zElixc023dIvDiA0' \
    > test.out 2>&1
eval_tap $? 180 'GetUserVerificationCode' test.out

#- 181 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tQWlHwBcTtztx3VA' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetUserDeletionStatusV3' test.out

#- 182 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'l6tXFbnATCzUOIzV' \
    --body '{"deletionDate": 5, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateUserDeletionStatusV3' test.out

#- 183 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'y9k3ie64Vnwa0ClG' \
    > test.out 2>&1
eval_tap $? 183 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 184 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QJultJe32AiwKadE' \
    --body '{"code": "oIVmprwPsa9YD92C", "country": "X0rITajpwHITGeHT", "dateOfBirth": "nqRbzBB9ZFgJbQ3F", "displayName": "j1umx4ItzkMJ7cud", "emailAddress": "f4r916GPrhn2etVI", "password": "QvRkQJAtDUH9tx60", "uniqueDisplayName": "AehGz1ermJYXsYgL", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 184 'AdminUpgradeHeadlessAccountV3' test.out

#- 185 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'e0fnHUlmU1unGKM0' \
    > test.out 2>&1
eval_tap $? 185 'AdminDeleteUserInformationV3' test.out

#- 186 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tgfeWy47bbwMI4gG' \
    --after '0.19833401380976756' \
    --before '0.3393701447972052' \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetUserLoginHistoriesV3' test.out

#- 187 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dDwD7WJHzgNZUKsI' \
    --body '{"languageTag": "5y0mR3zMyTsftKqn", "mfaToken": "sIJctAdxyZVKHA9D", "newPassword": "kaSOWgtg8yw8lHEb", "oldPassword": "VDwBAqanOlscRIWw"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminResetPasswordV3' test.out

#- 188 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '82k5K5VTkdubkOFl' \
    --body '{"Permissions": [{"Action": 8, "Resource": "wwQlnNRZJHBSB4fZ", "SchedAction": 100, "SchedCron": "v5kVu4S95mj8YRva", "SchedRange": ["e4f4lhBPbarbWEm8", "bVtZcfVCPdQhim9Q", "KUAFTVYelIlGJg9w"]}, {"Action": 7, "Resource": "ZGMTcqnWrIprOv0B", "SchedAction": 73, "SchedCron": "snnDJlmD1iEokbUi", "SchedRange": ["YzCQh2iNTwtnohdd", "MzMTQ9P7sYLDWAJO", "A75K4BYJ2fkqYJoF"]}, {"Action": 23, "Resource": "FI3vyyqRzc20O7Fd", "SchedAction": 38, "SchedCron": "sz9TVmdMKEohKzuM", "SchedRange": ["YDUTLBeCidXjuGgx", "8ncXejmeZtzT0qj0", "ltsqfiZrthVvyX0O"]}]}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserPermissionV3' test.out

#- 189 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CKDJE3RMUddwSSgx' \
    --body '{"Permissions": [{"Action": 58, "Resource": "R3hCGNgaJmuALlMQ", "SchedAction": 23, "SchedCron": "Wa9VzIkaQEl1iUPr", "SchedRange": ["oNB6hI6IpGcToWgF", "vdRhG9NwV3zDuqVl", "VTypcYPK8IxrSZux"]}, {"Action": 100, "Resource": "O4U0bitNQLzwRoWn", "SchedAction": 89, "SchedCron": "t4JwnPS2urJqerob", "SchedRange": ["WMZGVL5KLTxahWlS", "6XdBaKSLCgOOPXM6", "XTUh2dJ90yqHDNac"]}, {"Action": 23, "Resource": "9yXlbQ52FTHTCj6S", "SchedAction": 63, "SchedCron": "XAblkT8VGgSH8MGZ", "SchedRange": ["GwiVj7eDTaka9ABf", "X1IByPEOuPhGspRi", "3bhPQvBBJI5Jxytp"]}]}' \
    > test.out 2>&1
eval_tap $? 189 'AdminAddUserPermissionsV3' test.out

#- 190 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cubN4AUUPFPscZsX' \
    --body '[{"Action": 8, "Resource": "8RjU6Bi8JXE52sUB"}, {"Action": 56, "Resource": "gWSRxZ8N4UQ2fg3V"}, {"Action": 47, "Resource": "o2x0hL5DuBDqMyIA"}]' \
    > test.out 2>&1
eval_tap $? 190 'AdminDeleteUserPermissionBulkV3' test.out

#- 191 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '52' \
    --namespace "$AB_NAMESPACE" \
    --resource 'IZKTdNFVBQ1crBXA' \
    --userId 'upATO8uXsqVpdiWo' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserPermissionV3' test.out

#- 192 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8SjDAM0Riw8wLYW3' \
    --after 'n4F3LD1EDwBXw5uB' \
    --before 'YeQZOzATNSV9E9yy' \
    --limit '82' \
    --platformId 'vSxgTNIUzxDgBlIb' \
    --targetNamespace 'uzm7DzJ20NFRJIhF' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserPlatformAccountsV3' test.out

#- 193 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XR2dYprPmbpuptEC' \
    --status 'Gd5cdXC2Sesc6y68' \
    > test.out 2>&1
eval_tap $? 193 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 194 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'whNBYl9iCqfW6rqG' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetListJusticePlatformAccounts' test.out

#- 195 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'OQny4ij4ysYPonb5' \
    --userId '9gQffkNOmubxEJr2' \
    > test.out 2>&1
eval_tap $? 195 'AdminGetUserMapping' test.out

#- 196 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'qEAuJbpZSrcbc4LW' \
    --userId 'fKaY5c1tP5TDuI5f' \
    > test.out 2>&1
eval_tap $? 196 'AdminCreateJusticeUser' test.out

#- 197 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '6m4KC07CnsZe32hq' \
    --skipConflict  \
    --body '{"platformId": "EcB1ExYMBb3ckvoa", "platformUserId": "JYdMqGegcg3eRvBZ"}' \
    > test.out 2>&1
eval_tap $? 197 'AdminLinkPlatformAccount' test.out

#- 198 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XN3cjIXmFWRJnj8x' \
    --platformId 'N7HDPTUEDPN1Kb4U' \
    > test.out 2>&1
eval_tap $? 198 'AdminGetUserLinkHistoriesV3' test.out

#- 199 AdminPlatformUnlinkV3
eval_tap 0 199 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 200 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TPWDXTSb55g8LSTs' \
    --userId '7Nf95lGlPrf6obId' \
    > test.out 2>&1
eval_tap $? 200 'AdminPlatformUnlinkAllV3' test.out

#- 201 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nI6Ag7eUYcYJ4QzX' \
    --userId 'Cmqr6gmPGaHP5SVP' \
    --ticket 'vRLiDi0mNHb6Lx8e' \
    > test.out 2>&1
eval_tap $? 201 'AdminPlatformLinkV3' test.out

#- 202 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 202 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 203 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'q8SGNwEQO8dYXvBS' \
    --userId 'YvJBwb6CjZUMRf2V' \
    > test.out 2>&1
eval_tap $? 203 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 204 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JetWsokvx3BHuTEc' \
    --userId 'zr9KjQ3ttz8MTBt1' \
    --platformToken 'xk9IyssSA8nP5PQj' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 205 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pzk2Tb7iYdmNZWos' \
    --userId 'rsVBPZ64j0HUONsc' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 205 'AdminGetUserSinglePlatformAccount' test.out

#- 206 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ofwYLQcDvkaEIIPo' \
    --body '["JT83zEGXmVBZLyrH", "9J7BoysmaORLkP5h", "c2Fh04JTsqDTynCe"]' \
    > test.out 2>&1
eval_tap $? 206 'AdminDeleteUserRolesV3' test.out

#- 207 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wqJligLlRxOelKyk' \
    --body '[{"namespace": "ICRxF6HtlER2txs4", "roleId": "qrNARATn6KXOutlY"}, {"namespace": "BbLhL8KXx25FZfQI", "roleId": "odVBqQsBpCJBIXLG"}, {"namespace": "YcwWVRK6UKk5ozrX", "roleId": "A4HZHNyq9odanhR1"}]' \
    > test.out 2>&1
eval_tap $? 207 'AdminSaveUserRoleV3' test.out

#- 208 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'Zrm3thUvV87yfkyc' \
    --userId 'LSVdleSaAylsmLYe' \
    > test.out 2>&1
eval_tap $? 208 'AdminAddUserRoleV3' test.out

#- 209 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '2phYOgT5kDTyPl3d' \
    --userId 'KF7NXEjrJMki8jvc' \
    > test.out 2>&1
eval_tap $? 209 'AdminDeleteUserRoleV3' test.out

#- 210 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3P8Gwjg3IOH0SDHg' \
    --body '{"enabled": true, "reason": "KqxJiFJdrmj5vhzg"}' \
    > test.out 2>&1
eval_tap $? 210 'AdminUpdateUserStatusV3' test.out

#- 211 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'sJwex7wq8ZPlXNaU' \
    --body '{"emailAddress": "NgdY2vfJuje5cPnm", "password": "GjTvYa5Pqx1K7qcA"}' \
    > test.out 2>&1
eval_tap $? 211 'AdminTrustlyUpdateUserIdentity' test.out

#- 212 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oijBPAp6EPb988Nz' \
    > test.out 2>&1
eval_tap $? 212 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 213 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'xrDKVpULjjiw3NeV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "G4DJi9DaMrc0WFgK"}' \
    > test.out 2>&1
eval_tap $? 213 'AdminUpdateClientSecretV3' test.out

#- 214 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'jE945x2CPVYYG9Wv' \
    > test.out 2>&1
eval_tap $? 214 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 215 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'oGmAmvaVV5YfxnUN' \
    --before 'cwjr7gSGhnfuF4WZ' \
    --isWildcard  \
    --limit '17' \
    > test.out 2>&1
eval_tap $? 215 'AdminGetRolesV3' test.out

#- 216 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "managers": [{"displayName": "VpWd3UM08gMXhdf3", "namespace": "juXW4JprIb3CJCAt", "userId": "vSG8Cfa9dzOJDGCT"}, {"displayName": "HIOFjeXbsSgR43kI", "namespace": "DzxBwqRJTzrHNZWU", "userId": "sq5lQo2jy29EJigq"}, {"displayName": "YhyVhURx1yPeczRp", "namespace": "dk0HATGylx2JG2KN", "userId": "GfhzfCTxxrsRRLee"}], "members": [{"displayName": "3TcJ7DQIi45aCDHN", "namespace": "9mVug2zkVf6KgpKO", "userId": "cn3tMD9UT67bOwug"}, {"displayName": "FDa6wUQvehKqwCh8", "namespace": "6XmRkCEcfHDCdl59", "userId": "Wp9A3tXGve6DdK6u"}, {"displayName": "vg8f2cIoByk9fxtv", "namespace": "sgeAxo57nKAbZpsb", "userId": "J4Iu5KJ0ynxGBlac"}], "permissions": [{"action": 61, "resource": "4WpKKdzxoufCNlFo", "schedAction": 83, "schedCron": "pnMUBsnUfuQIcSbU", "schedRange": ["t5UGkInFGpuUsdtq", "4dOwNESzCEW9dUVh", "ZjLftC3sCS8CpLCq"]}, {"action": 85, "resource": "pUkNOBWydXV0Fi02", "schedAction": 1, "schedCron": "jj3b8QM8Rr45ULqX", "schedRange": ["QgvwD3PsKDJiWxQB", "waS7rDBf2S54phbd", "yGDt47f9GWRlE9hq"]}, {"action": 53, "resource": "NtrThFa9XU8moslu", "schedAction": 17, "schedCron": "3WekqfWv04vvn9bk", "schedRange": ["5qr8qs2mqtnGAqXU", "jNypF6MMqWpdEJsP", "oaIbYz8cK5jlpJdr"]}], "roleName": "e5ur6yvWJDdvM7T7"}' \
    > test.out 2>&1
eval_tap $? 216 'AdminCreateRoleV3' test.out

#- 217 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'PX2vamIRZHzsIYOC' \
    > test.out 2>&1
eval_tap $? 217 'AdminGetRoleV3' test.out

#- 218 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'UoiCXNjrdQL2jdx1' \
    > test.out 2>&1
eval_tap $? 218 'AdminDeleteRoleV3' test.out

#- 219 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'eIba1sB0HsJ06Dzf' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "Zbjf7GZxaossQmjo"}' \
    > test.out 2>&1
eval_tap $? 219 'AdminUpdateRoleV3' test.out

#- 220 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId '69wohJFyTNk5FGUP' \
    > test.out 2>&1
eval_tap $? 220 'AdminGetRoleAdminStatusV3' test.out

#- 221 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'hR4LEZvz3EjFR799' \
    > test.out 2>&1
eval_tap $? 221 'AdminUpdateAdminRoleStatusV3' test.out

#- 222 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '6Ug5m4axDV5uTcYs' \
    > test.out 2>&1
eval_tap $? 222 'AdminRemoveRoleAdminV3' test.out

#- 223 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'oahUrELQ1btjJOqQ' \
    --after 'MgZWAU6E92nHJzvw' \
    --before '7tnYtGfv0EJyjBu4' \
    --limit '62' \
    > test.out 2>&1
eval_tap $? 223 'AdminGetRoleManagersV3' test.out

#- 224 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'zPqb6n73m0jiaDH8' \
    --body '{"managers": [{"displayName": "6d9rsKgzCsMulpB8", "namespace": "HZUtVVaJCiLgKOwr", "userId": "SfWhT5B4WedopzwS"}, {"displayName": "luBtRFPKThyGnbjm", "namespace": "PDKFS6u9FHuv1M3q", "userId": "fch4SqIV6LQPHlae"}, {"displayName": "Yl4csFq65cU66yJa", "namespace": "j4ovoKWE4EW0sw8v", "userId": "5peiuxoBJATauyD3"}]}' \
    > test.out 2>&1
eval_tap $? 224 'AdminAddRoleManagersV3' test.out

#- 225 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'XCXVMiyEvMf9yilU' \
    --body '{"managers": [{"displayName": "Eujk6oqYo1HQYTFz", "namespace": "wdOMdupwD4O3uNbc", "userId": "IDcIyvZbOy1T4hfw"}, {"displayName": "kuVykH4RpfmjIXFG", "namespace": "Z5PKdbabJIkNnt9P", "userId": "1Tkm08luh4dpPRMD"}, {"displayName": "bUXBWTbpAogG2wlZ", "namespace": "kLhuU5FI8NijFI0G", "userId": "KwJ3vfXlsAMy2Zp2"}]}' \
    > test.out 2>&1
eval_tap $? 225 'AdminRemoveRoleManagersV3' test.out

#- 226 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'UAGxHnmSxvkG9UR5' \
    --after 'q9neoW6JBcGp9Rx2' \
    --before 'RfcRhXpmeeHdvpha' \
    --limit '37' \
    > test.out 2>&1
eval_tap $? 226 'AdminGetRoleMembersV3' test.out

#- 227 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'U8vrQJXQxoIbVi2C' \
    --body '{"members": [{"displayName": "LEk277Ivjj1A647X", "namespace": "Q3koaAfZIim0sFPm", "userId": "1YN27bojDVaZLpx4"}, {"displayName": "kEWYkO6KrKUMhJrA", "namespace": "SBh61hmWKSSrF35a", "userId": "nDGvur19V18oIrUK"}, {"displayName": "XttgAI2QdWJFLmoP", "namespace": "Egd8EMspOs8nkic9", "userId": "gj5vyUMAAmIHYbsx"}]}' \
    > test.out 2>&1
eval_tap $? 227 'AdminAddRoleMembersV3' test.out

#- 228 AdminRemoveRoleMembersV3
eval_tap 0 228 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 229 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'G5N066FXb88SbLOa' \
    --body '{"permissions": [{"action": 2, "resource": "1DiSFsm0XXQJWszv", "schedAction": 94, "schedCron": "VnO2LpBU08wfnlHB", "schedRange": ["XFIqFUmgUSMM5au8", "GJT0mkVPI6zUtf3Q", "aJPGrTNcXXTUIggo"]}, {"action": 68, "resource": "aKiHfoeorY7A1otG", "schedAction": 65, "schedCron": "7r1ta3m7jK5pxe82", "schedRange": ["pgFiAS6piIzmc8rK", "rKEPGSAcong6eNER", "Uf8kjci1Ctccv9Gv"]}, {"action": 4, "resource": "tOcbnuCqf0lm6WBk", "schedAction": 71, "schedCron": "aGr5kdazlypvt6lS", "schedRange": ["LfU7HByGXPMqxj4h", "BgVY3YAxZLKbcOdy", "jqf6Q4oiwoJcaRME"]}]}' \
    > test.out 2>&1
eval_tap $? 229 'AdminUpdateRolePermissionsV3' test.out

#- 230 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'b15LBlTVufc5ZyOD' \
    --body '{"permissions": [{"action": 88, "resource": "j0Ur5F2PWGTTD81x", "schedAction": 16, "schedCron": "BAoKGcVCdMiSNV4q", "schedRange": ["Brt1kcLmRv6EJtl5", "xWnsb8oWq94RImNW", "VIJnhhwFDV1Vitao"]}, {"action": 26, "resource": "8DY0XOkDstxZcY1H", "schedAction": 13, "schedCron": "j7Yi2VvoQNW8Yc48", "schedRange": ["1dYdvGxJAMDRA1LF", "7jdWlekFwO94VBCV", "9qJhWva2FPBujX0g"]}, {"action": 8, "resource": "HVDsZBQgOnXuXsGT", "schedAction": 15, "schedCron": "XXOFwmGWAvNF0Z0G", "schedRange": ["kwxUNYyNwGiKrknH", "0Y5mrQgLC6D2qsFi", "QHglUQMZi5WjMZfO"]}]}' \
    > test.out 2>&1
eval_tap $? 230 'AdminAddRolePermissionsV3' test.out

#- 231 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'adpgegCUjTdi1Ehr' \
    --body '["8OtqpNJ9R8TuNy4e", "jmVA3vMCsGyPd12B", "8QNUz0hFFNbH6j2W"]' \
    > test.out 2>&1
eval_tap $? 231 'AdminDeleteRolePermissionsV3' test.out

#- 232 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '94' \
    --resource 'roZM2UKAXEEsL5D0' \
    --roleId 'oiFchQnVeq3g2AB2' \
    > test.out 2>&1
eval_tap $? 232 'AdminDeleteRolePermissionV3' test.out

#- 233 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 233 'AdminGetMyUserV3' test.out

#- 234 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'WIRUQmauIY5HXCZ0' \
    --extendExp  \
    --redirectUri 'W4XmWP0HzSdiylLh' \
    --password 'VYszm8xY33OQbumu' \
    --requestId '2QHLyZNuysyM4OfC' \
    --userName 'zdQCXMAWnf87YPNO' \
    > test.out 2>&1
eval_tap $? 234 'UserAuthenticationV3' test.out

#- 235 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'e9Eevf1fhMg1E2k7' \
    --linkingToken 'QLFrVgtX7y0fPOie' \
    --password 'DCow2zXyFFVpM87y' \
    --username 'qEwEacQMTlqN4LKk' \
    > test.out 2>&1
eval_tap $? 235 'AuthenticationWithPlatformLinkV3' test.out

#- 236 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'xJ5v3SBafnKNiMPb' \
    --extendExp  \
    --linkingToken 'FkFGA85W3HJkqgS2' \
    > test.out 2>&1
eval_tap $? 236 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 237 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'B37wwoPYOHiIsxms' \
    > test.out 2>&1
eval_tap $? 237 'RequestOneTimeLinkingCodeV3' test.out

#- 238 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'LBPBJuNLnWRrtW87' \
    > test.out 2>&1
eval_tap $? 238 'ValidateOneTimeLinkingCodeV3' test.out

#- 239 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData '0qD88ZcduZSe7W20' \
    --isTransient  \
    --clientId 'UZcDaiq0nEZ7Pyhq' \
    --oneTimeLinkCode 'FJkDClOsKmfsgJdm' \
    > test.out 2>&1
eval_tap $? 239 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 240 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 240 'GetCountryLocationV3' test.out

#- 241 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 241 'Logout' test.out

#- 242 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'zsDPsWh1k0cQ08NG' \
    --codeChallengeMethod 'plain' \
    --clientId 'dX2TZkil67kRngoU' \
    > test.out 2>&1
eval_tap $? 242 'RequestTokenExchangeCodeV3' test.out

#- 243 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'a83ECh1gqPeS193T' \
    --userId 'NNzot3sVli3GN2XT' \
    --platformUserId 'rFibRAhzzEWzWlTY' \
    > test.out 2>&1
eval_tap $? 243 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 244 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '70qdgJRvpZrSpWX3' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 244 'RevokeUserV3' test.out

#- 245 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'KEe2BjV00ReCXFff' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'DHoCQykmXHYmkRlg' \
    --redirectUri '7gYs6unPYQ9jNQN1' \
    --scope 'di1ldhOh6HvjnYuV' \
    --state '7NfC4A2ODiZhbfb8' \
    --targetAuthPage 'QqCyK1XH9D6vl5eF' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'dFfgK46GjCWaP8hu' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 245 'AuthorizeV3' test.out

#- 246 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'mnq3FGQn3Ahu5wxq' \
    > test.out 2>&1
eval_tap $? 246 'TokenIntrospectionV3' test.out

#- 247 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 247 'GetJWKSV3' test.out

#- 248 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId '6oJq4mChmQHQhO9I' \
    --factor 'KBXDFQfXFD58sG6u' \
    --mfaToken 'DhFYlrzJBYSeMuJf' \
    > test.out 2>&1
eval_tap $? 248 'SendMFAAuthenticationCode' test.out

#- 249 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'QecutjS029BiJWOG' \
    --mfaToken '1m7MKclr5igjNTVI' \
    > test.out 2>&1
eval_tap $? 249 'Change2faMethod' test.out

#- 250 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'trH2X78hxJgaVfw5' \
    --factor 'Vnyq8OzTE89WDNoM' \
    --mfaToken 'cOmbfJrCJQIj1haA' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 250 'Verify2faCode' test.out

#- 251 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'osKglqaCXE9ytpIO' \
    --userId '8btO3OwNEGSW5TaW' \
    > test.out 2>&1
eval_tap $? 251 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 252 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId '4to7QCY2NGGvi9kg' \
    --clientId '3rMIzNmhJTNQjKlw' \
    --redirectUri 'jfJ3TJ2xVpge70Ws' \
    --requestId 'LfgbZieRvJI5sT9D' \
    > test.out 2>&1
eval_tap $? 252 'AuthCodeRequestV3' test.out

#- 253 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'H3DfLCv8q4Thmq09' \
    --additionalData 'bBgPAYxrBE9jlnTg' \
    --clientId 'tgW33wDwD9RKvQX4' \
    --createHeadless  \
    --deviceId 'yFQFdrRoM6FoqCYw' \
    --macAddress '7AlxO6qdFpc71sSc' \
    --platformToken 'k3ggZWJlSlCQMDji' \
    --serviceLabel '0.8922649896977317' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 253 'PlatformTokenGrantV3' test.out

#- 254 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 254 'GetRevocationListV3' test.out

#- 255 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token '29PfVrvMEPtpsSNc' \
    > test.out 2>&1
eval_tap $? 255 'TokenRevocationV3' test.out

#- 256 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'pK1QkB2Sy8Ww79LV' \
    --simultaneousTicket 'eVskqeUB7RSayqGF' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'j4ro5B19VE838c7O' \
    > test.out 2>&1
eval_tap $? 256 'SimultaneousLoginV3' test.out

#- 257 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'ydVw0zCqoMZvpIOO' \
    --clientId '97DmQ5ZOzx6iCJTu' \
    --clientSecret '60IifzMhkk5Pxsjq' \
    --code 'bCKpMv2Yky9DYkD2' \
    --codeVerifier 'sIllFtBtXJKG3rqB' \
    --extendNamespace 'mILhtWm8RQvRUbUD' \
    --extendExp  \
    --password 'SiefGEdLucrtO2gC' \
    --redirectUri 'QD057DrDlgC2nzS9' \
    --refreshToken 'SiGUjVAw4v3q6JRH' \
    --username 'cn7KaoCEkRdo6qHY' \
    --grantType 'urn:ietf:params:oauth:grant-type:extend_client_credentials' \
    > test.out 2>&1
eval_tap $? 257 'TokenGrantV3' test.out

#- 258 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'R5dShqiBUI9esSsX' \
    > test.out 2>&1
eval_tap $? 258 'VerifyTokenV3' test.out

#- 259 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'egSEhrPpK2q8kxR4' \
    --code 'BuEksS2A9VOA8H9V' \
    --error 'eHv0L2Acm960EYQE' \
    --openidAssocHandle 'uGJVl8xs1WId9Wla' \
    --openidClaimedId 'lqshF9Rh2o7GCQGP' \
    --openidIdentity 'CxwEdkyuT3MgzReR' \
    --openidMode 'q0112ISArROIodcm' \
    --openidNs 'M6v2AEozWWaYvBLE' \
    --openidOpEndpoint '46bpuJip8JyxJ39v' \
    --openidResponseNonce 'rtuWWrqTZbSqBSKp' \
    --openidReturnTo '8AmgwhYzk33J34fi' \
    --openidSig 'TxK63OHpnUCGBVfp' \
    --openidSigned 'ctNFUsUQ6ZXQcb2o' \
    --state '1J5euLAbBgejqc0a' \
    > test.out 2>&1
eval_tap $? 259 'PlatformAuthenticationV3' test.out

#- 260 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'pxqZ209BySn8aUaG' \
    --platformToken 'lAyvIslt7N1qcxKs' \
    > test.out 2>&1
eval_tap $? 260 'PlatformTokenRefreshV3' test.out

#- 261 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode '4nlf1MfqUZXkjHvc' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetInputValidations' test.out

#- 262 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'UOTlxNf09pefgFIi' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetInputValidationByField' test.out

#- 263 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'JssShBKsQjXvfQgQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 263 'PublicGetCountryAgeRestrictionV3' test.out

#- 264 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'Dt6ce8NDMErA82Fr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 264 'PublicGetConfigValueV3' test.out

#- 265 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 265 'PublicGetCountryListV3' test.out

#- 266 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 266 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 267 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'R1GSogkewIzTOqKk' \
    > test.out 2>&1
eval_tap $? 267 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 268 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 268 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 269 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'cjRh3l2gAJOTCbx7' \
    --platformUserId 'J3gNLIlTk3Bpclrk' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetUserByPlatformUserIDV3' test.out

#- 270 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'country' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetProfileUpdateStrategyV3' test.out

#- 271 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'owBhoUg4LsGP6KLP' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetAsyncStatus' test.out

#- 272 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'XkvUv2XiXaBzsmax' \
    --limit '20' \
    --offset '9' \
    --platformBy 'TZPlLitytGka7Kv5' \
    --platformId 'TacQKF4OlRGdmXxE' \
    --query 'TLEQrr3KCAV9alq3' \
    > test.out 2>&1
eval_tap $? 272 'PublicSearchUserV3' test.out

#- 273 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "hK1G4kKooSNNUZui", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "SSV8e1MgTTLS2Fga", "policyId": "rY903INGIyEfRBEj", "policyVersionId": "7qms9AGQExPhgr9g"}, {"isAccepted": false, "localizedPolicyVersionId": "fC0GjvpgJfuBs1Vp", "policyId": "qn47GVghTH2wToOn", "policyVersionId": "q9U5lyW89Xwt3wmR"}, {"isAccepted": false, "localizedPolicyVersionId": "rDCjhnKvsHezWTqg", "policyId": "YPixtHk6lWq6tEeU", "policyVersionId": "mU96FLEak0mJqjRY"}], "authType": "ldcTpdeCD9XPRi4b", "code": "AQL7VE2wL8Y4JFVU", "country": "dzA8bvXlDhG7Bror", "dateOfBirth": "bKIKuOXJPm5ztrr0", "displayName": "9CDA8Ij5bGKSuopW", "emailAddress": "QbaCvdPSq8Z27Gpv", "password": "HCDx55JZ5z6gujpF", "reachMinimumAge": true, "uniqueDisplayName": "kJHRhmLKQuQVFSKi"}' \
    > test.out 2>&1
eval_tap $? 273 'PublicCreateUserV3' test.out

#- 274 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'Xl8G2uf6E8EajXLS' \
    --query 'AS8MKMaxQ1QyJCpK' \
    > test.out 2>&1
eval_tap $? 274 'CheckUserAvailability' test.out

#- 275 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["edhuzI7G9NCKKXu1", "bqI2M5PmXfKnQ7BY", "GjCUDMOrbmoRvWnf"]}' \
    > test.out 2>&1
eval_tap $? 275 'PublicBulkGetUsers' test.out

#- 276 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "mGFy0eUoOBd90h9E", "languageTag": "DqSTOfoNewWjwMWD"}' \
    > test.out 2>&1
eval_tap $? 276 'PublicSendRegistrationCode' test.out

#- 277 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "KEt6JhbJ0fwTDaq6", "emailAddress": "b5RpMwhWPtndriXU"}' \
    > test.out 2>&1
eval_tap $? 277 'PublicVerifyRegistrationCode' test.out

#- 278 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "9loOxpmEuwDVc12r", "languageTag": "0DVUGgGHkapTCafF"}' \
    > test.out 2>&1
eval_tap $? 278 'PublicForgotPasswordV3' test.out

#- 279 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "MdvYiCBuzUUwyI6V", "password": "td4v9k4fv3kMiuQ3", "uniqueDisplayName": "DhsKLxjt5srPFxBg", "username": "pFtDBmTLH9kP9U53"}' \
    > test.out 2>&1
eval_tap $? 279 'PublicValidateUserInput' test.out

#- 280 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'z6joBAhAlJGI2YYb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 280 'GetAdminInvitationV3' test.out

#- 281 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId '6ajBjgq6eY4PBNHK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "Px62tHxDb06ZFy3u", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "A009FAb21jxeWXk8", "policyId": "0y9uxgVLGgK8aVSC", "policyVersionId": "N6oCETQ8gIDRdD2w"}, {"isAccepted": true, "localizedPolicyVersionId": "sMvy9gkfTMRrXVRc", "policyId": "AVRDX6gmDfNfPGYY", "policyVersionId": "STunMgt3C8hEguCq"}, {"isAccepted": false, "localizedPolicyVersionId": "47YwDudnGRufOUGf", "policyId": "MjTU226l07jPlcYa", "policyVersionId": "qYM7YfBmhjI9Y28q"}], "authType": "VceS9UX48dKPCFUI", "code": "eyYEymNXzNX6TGh4", "country": "UdEweeBsJEvBbAvC", "dateOfBirth": "mlh6Z1oz9BaixUUv", "displayName": "mzbajE2gjooiDnc1", "emailAddress": "NUb51lEgUwQ9tkWa", "password": "MOH47CAT7cBP0918", "reachMinimumAge": true, "uniqueDisplayName": "aEBQBP766LUnBBR8"}' \
    > test.out 2>&1
eval_tap $? 281 'CreateUserFromInvitationV3' test.out

#- 282 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "4iAO7sBQt6YJ2tWw", "country": "F7RnP1oK3c4RVfjB", "dateOfBirth": "0zi3XrYZUiN24ol1", "displayName": "qqbalgizL97ycJV5", "languageTag": "YqE2myQzl7X9fHr6", "uniqueDisplayName": "WvBxmBvNj3ktaDf9", "userName": "B22HGgxakPt7IYza"}' \
    > test.out 2>&1
eval_tap $? 282 'UpdateUserV3' test.out

#- 283 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "ZUTmvsEzLPnnGsnf", "country": "mBerp84qjwzWpCF1", "dateOfBirth": "vyamjsEzwtLPxK1o", "displayName": "s4qR8LaQzEb39sZT", "languageTag": "dFfC8x5aHLsXHlm1", "uniqueDisplayName": "RJTTy9JrNz1K5M1q", "userName": "gFddYvifGHawNx6y"}' \
    > test.out 2>&1
eval_tap $? 283 'PublicPartialUpdateUserV3' test.out

#- 284 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "hniEHLbEQKc0aUvr", "emailAddress": "KXDIjYC4df9qswSl", "languageTag": "pCI8DhjlxUyrs3OS"}' \
    > test.out 2>&1
eval_tap $? 284 'PublicSendVerificationCodeV3' test.out

#- 285 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "esE5p0DwUj2HKUvP", "contactType": "YUcQBxMSdOOsn2Nd", "languageTag": "8Jpa19GJDK46Eehx", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 285 'PublicUserVerificationV3' test.out

#- 286 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "xasqMY9aulsL6NOV", "country": "5agpS6A5mkufBpWV", "dateOfBirth": "xIK9D2bTcgaKocca", "displayName": "SwWcZmzCWGI1cIQc", "emailAddress": "PWAShIhieSKUf3zK", "password": "byQk2vQTYX1xsth2", "uniqueDisplayName": "8NZZgsXycuQNGIDe", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 286 'PublicUpgradeHeadlessAccountV3' test.out

#- 287 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "YcAYp7qSiDvsfMUO", "password": "pWv46sXvpOjrpRo4"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicVerifyHeadlessAccountV3' test.out

#- 288 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "mYrCeQUnYoID2UqO", "mfaToken": "0iAXA9dB4ib8HDOJ", "newPassword": "8TNiP8KgEAj3dbRT", "oldPassword": "I0i6dO3zkbDseh4t"}' \
    > test.out 2>&1
eval_tap $? 288 'PublicUpdatePasswordV3' test.out

#- 289 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'JdoGcwMBmegqVUaW' \
    > test.out 2>&1
eval_tap $? 289 'PublicCreateJusticeUser' test.out

#- 290 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MJBjrV0p9A7tcHrV' \
    --redirectUri '0MbJGr4drgkDuWS0' \
    --ticket '5m0pGzazM2BUXnzU' \
    > test.out 2>&1
eval_tap $? 290 'PublicPlatformLinkV3' test.out

#- 291 PublicPlatformUnlinkV3
eval_tap 0 291 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 292 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'EWTiKMJAf6AgbiED' \
    > test.out 2>&1
eval_tap $? 292 'PublicPlatformUnlinkAllV3' test.out

#- 293 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MfCckWogE5gcfF8A' \
    --ticket 'MGZ2FBS93Mg6TKwd' \
    > test.out 2>&1
eval_tap $? 293 'PublicForcePlatformLinkV3' test.out

#- 294 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RMraDLrwh3d0ykRG' \
    --clientId 'kgqUNIbJMJ9ABbKV' \
    --redirectUri 'WO2YEDiqkwKbpdk7' \
    > test.out 2>&1
eval_tap $? 294 'PublicWebLinkPlatform' test.out

#- 295 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wlDngNiPPjpSAlZw' \
    --code 'FGpea5ObBB49Km4C' \
    --state 'lIQmkIdLCvNhZ6P8' \
    > test.out 2>&1
eval_tap $? 295 'PublicWebLinkPlatformEstablish' test.out

#- 296 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'aqZ2yfrC1V7ZpJZP' \
    --code 'HCMqvcYmeDLYEzs2' \
    --state 'SQUdKr6vgqkjycqc' \
    > test.out 2>&1
eval_tap $? 296 'PublicProcessWebLinkPlatformV3' test.out

#- 297 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "lNlBORlC8ZkjsxYt", "userIds": ["gxplHTPLzynjFZgF", "3erw7UsyHq4bBb0n", "1JhPUS8BRPGV9n76"]}' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetUsersPlatformInfosV3' test.out

#- 298 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "9zLJdKMexeJc7Nvg", "code": "TSgKjCxZjKf8NA4c", "emailAddress": "GUaDfy9XnH2r0EKr", "languageTag": "k5VlnKsWCPccAFn5", "newPassword": "CEPoH6opK5DSO8Jy"}' \
    > test.out 2>&1
eval_tap $? 298 'ResetPasswordV3' test.out

#- 299 PublicGetUserByUserIdV3
eval_tap 0 299 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 300 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'X4IE1z3rDwZ1HKsO' \
    --activeOnly  \
    --after 'pyq8agQuz86nc6jL' \
    --before 'F9DIW2ncJJKpqmgv' \
    --limit '95' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetUserBanHistoryV3' test.out

#- 301 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'URBhl0L5FCbOn46W' \
    > test.out 2>&1
eval_tap $? 301 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 302 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2B2uPQLrt2t6bVpC' \
    > test.out 2>&1
eval_tap $? 302 'PublicGetUserInformationV3' test.out

#- 303 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gKvPXSDufmKh783c' \
    --after '0.7705812894100985' \
    --before '0.9224693687330963' \
    --limit '11' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetUserLoginHistoriesV3' test.out

#- 304 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JsVBRB0rY0xfWddA' \
    --after 'CyHSmo4KX9TPO3K1' \
    --before 'k5ZM8btmGsgXNXbp' \
    --limit '34' \
    --platformId '1nc3eFm950dtVAo7' \
    > test.out 2>&1
eval_tap $? 304 'PublicGetUserPlatformAccountsV3' test.out

#- 305 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'w4e3v5mh6Rum5pbg' \
    > test.out 2>&1
eval_tap $? 305 'PublicListJusticePlatformAccountsV3' test.out

#- 306 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'Et39uJQpgEtchTe3' \
    --body '{"platformId": "nt7t9ztprSfW9Out", "platformUserId": "ADrNGBWSJ1zQKxVm"}' \
    > test.out 2>&1
eval_tap $? 306 'PublicLinkPlatformAccount' test.out

#- 307 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'RTawjiZPMoZZcyGE' \
    --body '{"chosenNamespaces": ["HxAKDQher3usApPd", "JPn9eIdhIBvTTupA", "BJ4RwH3EdKmYtbqQ"], "requestId": "HNfIZwrMxf3EnzZV"}' \
    > test.out 2>&1
eval_tap $? 307 'PublicForceLinkPlatformWithProgression' test.out

#- 308 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nkLT0Lb85nmpdN26' \
    > test.out 2>&1
eval_tap $? 308 'PublicGetPublisherUserV3' test.out

#- 309 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BY5YI0jeO2zMDSy4' \
    --password 'kyqyKgrtEPdXXlt8' \
    > test.out 2>&1
eval_tap $? 309 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 310 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'geCdiXu3iNvn7vLZ' \
    --before '7h6alhJNGZF07lsP' \
    --isWildcard  \
    --limit '84' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetRolesV3' test.out

#- 311 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'TNs8mAj6IKSYFdJw' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetRoleV3' test.out

#- 312 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 312 'PublicGetMyUserV3' test.out

#- 313 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'gZsRPOzwuDSdGl1A' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 314 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["2vaNeDiSqTfmAVg5", "0kOdJagEmTuaxlxg", "ywkbdOsyxX1tfW48"], "oneTimeLinkCode": "8oYUT4jyCVJ0V8ob"}' \
    > test.out 2>&1
eval_tap $? 314 'LinkHeadlessAccountToMyAccountV3' test.out

#- 315 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 315 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 316 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "TlGVThz4bm41oIcV"}' \
    > test.out 2>&1
eval_tap $? 316 'PublicSendVerificationLinkV3' test.out

#- 317 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code '33yjPxibDjfF7Jkj' \
    > test.out 2>&1
eval_tap $? 317 'PublicVerifyUserByLinkV3' test.out

#- 318 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'CVpZKMxkFkBtXMU6' \
    --code 'KRIm5xBoIi99ctgF' \
    --error 'Xasxp5h780ktjQw2' \
    --state 'yXzaQWaF2PqUfbpM' \
    > test.out 2>&1
eval_tap $? 318 'PlatformAuthenticateSAMLV3Handler' test.out

#- 319 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'pRl6xRyV19cborUH' \
    --payload 'eCpqnZ5NW623WWn2' \
    > test.out 2>&1
eval_tap $? 319 'LoginSSOClient' test.out

#- 320 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'ZJY3QvRa7CDRTcsA' \
    > test.out 2>&1
eval_tap $? 320 'LogoutSSOClient' test.out

#- 321 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'HzD3dZyyWbUQpbcv' \
    --code '3IwmL7a1K3zIUYJm' \
    > test.out 2>&1
eval_tap $? 321 'RequestTargetTokenResponseV3' test.out

#- 322 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '7' \
    --namespace "$AB_NAMESPACE" \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 322 'AdminListInvitationHistoriesV4' test.out

#- 323 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '0LLbku9GYH4ijqOV' \
    > test.out 2>&1
eval_tap $? 323 'AdminGetDevicesByUserV4' test.out

#- 324 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'M50tCqkZfsSxAbDJ' \
    --endDate '7sHCLup8pmEosOXg' \
    --limit '24' \
    --offset '84' \
    --startDate 'QwwdeLVpmXqRwVjc' \
    > test.out 2>&1
eval_tap $? 324 'AdminGetBannedDevicesV4' test.out

#- 325 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '3W2ANmE3VVsQ1fm9' \
    > test.out 2>&1
eval_tap $? 325 'AdminGetUserDeviceBansV4' test.out

#- 326 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "EUdiaRjuLsKZoqnp", "deviceId": "KwhpZVdw5UMa8ymx", "deviceType": "tEFLwELCY2vIddlx", "enabled": false, "endDate": "DwFVKUC2ecnpUDqv", "ext": {"LQixPKVSmWa8TGko": {}, "16XTqHc0cM7ixq8T": {}, "jnxp5Cl8ggaEmCcu": {}}, "reason": "K2hHviBEWpbusO6E"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminBanDeviceV4' test.out

#- 327 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'yVqstpgZpbz77y88' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 327 'AdminGetDeviceBanV4' test.out

#- 328 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'rUFum2ZcA8iKcF0b' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 328 'AdminUpdateDeviceBanV4' test.out

#- 329 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'zCG6ZKQClGc1636n' \
    --startDate 'bfM3J9G40Y62bCo9' \
    --deviceType '41ALznQuHVskfCjU' \
    > test.out 2>&1
eval_tap $? 329 'AdminGenerateReportV4' test.out

#- 330 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 330 'AdminGetDeviceTypesV4' test.out

#- 331 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'K8GeX4Q0B2Cj0oOm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 331 'AdminGetDeviceBansV4' test.out

#- 332 AdminDecryptDeviceV4
eval_tap 0 332 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 333 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'BmXu1KiTTiz7yrIv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 333 'AdminUnbanDeviceV4' test.out

#- 334 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'Qj2isN7bRwcr16lW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 334 'AdminGetUsersByDeviceV4' test.out

#- 335 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 335 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 336 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 336 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 337 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 21, "userInfo": {"country": "gZpjlMMtPWg8217m"}}' \
    > test.out 2>&1
eval_tap $? 337 'AdminCreateTestUsersV4' test.out

#- 338 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "qNkQiKp2oac8QTNE", "policyId": "uBbeuQqm9wM7mgTt", "policyVersionId": "UdPVcQijMBhs0kDP"}, {"isAccepted": false, "localizedPolicyVersionId": "d3nuUZ41mSeS9SnG", "policyId": "qhJOvykBcDpzD9zh", "policyVersionId": "6dtPK4fVHLMvrCsH"}, {"isAccepted": false, "localizedPolicyVersionId": "RYxH2Up9VthPjFrK", "policyId": "7Hip0eONFDgUPShG", "policyVersionId": "8wwFKY9AMpcwJd4S"}], "authType": "EMAILPASSWD", "code": "phUUAV95708zaP0w", "country": "pZgQEvFzox9wHocX", "dateOfBirth": "3DRWobEoGr8W97KB", "displayName": "edcr6PM51z7i0wQ9", "emailAddress": "egK2t46EG8I2lTvi", "password": "KbOgVuN3nhkn6QIe", "passwordMD5Sum": "sNoYqvVsakylHikK", "reachMinimumAge": false, "uniqueDisplayName": "KVjOn6rtILNJVv2D", "username": "LLUyBt5hDs45siG3"}' \
    > test.out 2>&1
eval_tap $? 338 'AdminCreateUserV4' test.out

#- 339 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["6RsFK7eYlSU3vYcH", "ZZjFegVnZOn0tk4I", "ATSIefcqNEn4IZ0D"]}' \
    > test.out 2>&1
eval_tap $? 339 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 340 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["v6b8WtaMVvLbG04K", "Knh3jvW0Qp3kTyL4", "CsLwiWUMcpxn4B6X"]}' \
    > test.out 2>&1
eval_tap $? 340 'AdminBulkCheckValidUserIDV4' test.out

#- 341 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oTNMuqZTHwo1IAJQ' \
    --body '{"avatarUrl": "pb6r8ZeaSHwQuiH3", "country": "Ozu4G6bXxp0gYZyF", "dateOfBirth": "9fJBJkSOrF9Dg4Fc", "displayName": "DwBGyBiHewZkwEeu", "languageTag": "zBBRSknxyWkZObuv", "skipLoginQueue": false, "uniqueDisplayName": "IVuGv47XJpkMiopQ", "userName": "rVL3ZZTVxqa9XM2g"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminUpdateUserV4' test.out

#- 342 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y14iWk12Jffk8dwK' \
    --body '{"code": "NPUOHNZxML3yoBM9", "emailAddress": "qxd6PWz7sVnMxge2"}' \
    > test.out 2>&1
eval_tap $? 342 'AdminUpdateUserEmailAddressV4' test.out

#- 343 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'inL8fBFP1ABaIKrE' \
    --body '{"factor": "t8d3o7cTS9OIIMEr", "mfaToken": "nNTLXHrsOFsbhRow"}' \
    > test.out 2>&1
eval_tap $? 343 'AdminDisableUserMFAV4' test.out

#- 344 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '4iaYKy0IjsDgbJ37' \
    > test.out 2>&1
eval_tap $? 344 'AdminGetUserMFAStatusV4' test.out

#- 345 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DN2lDvdh7okHl1wM' \
    > test.out 2>&1
eval_tap $? 345 'AdminListUserRolesV4' test.out

#- 346 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ht2Izq7TCUJhDsDe' \
    --body '{"assignedNamespaces": ["fAS09VyQB1vR1mx6", "K17GL1CrO4ZuoGZS", "xTzm8oMSPIHPtqzI"], "roleId": "WIzg8pbjnt1iBV8D"}' \
    > test.out 2>&1
eval_tap $? 346 'AdminUpdateUserRoleV4' test.out

#- 347 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pbjGts4UZDTfhAyZ' \
    --body '{"assignedNamespaces": ["Khqilty9NVlgxUmn", "fdOAmu1dX1NqD20R", "UvvYeJZw6QZFN7wF"], "roleId": "CnqpvNesGiVnt9p2"}' \
    > test.out 2>&1
eval_tap $? 347 'AdminAddUserRoleV4' test.out

#- 348 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'to7Yja1soDE1K0Sv' \
    --body '{"assignedNamespaces": ["GrMYwPmPXC2LfL2m", "5rP2A20t6foPPH94", "SUinY5diUlqgvY7d"], "roleId": "PPyahppgxJhk4EdT"}' \
    > test.out 2>&1
eval_tap $? 348 'AdminRemoveUserRoleV4' test.out

#- 349 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '96' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 349 'AdminGetRolesV4' test.out

#- 350 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "D7ZZx1iefATWcDSq"}' \
    > test.out 2>&1
eval_tap $? 350 'AdminCreateRoleV4' test.out

#- 351 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'GYRMdz07xEJ40eps' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetRoleV4' test.out

#- 352 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'sgJJC3CX0hpB1ZGM' \
    > test.out 2>&1
eval_tap $? 352 'AdminDeleteRoleV4' test.out

#- 353 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'Mo5DSozCuFsrBMto' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "LfMCYxSeeJOlxa39"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminUpdateRoleV4' test.out

#- 354 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId '5rghZwGhdZJkkGhY' \
    --body '{"permissions": [{"action": 43, "resource": "b4GNQHVZMKGBnzh4", "schedAction": 38, "schedCron": "82b96rsH73hRfDgl", "schedRange": ["29GWKpItMt4GszRu", "fkDFLYyNBPlMrkse", "9SGcMuV5phhU315L"]}, {"action": 95, "resource": "yfrXZmiJX4CjKCeI", "schedAction": 89, "schedCron": "e29lqqtcLJW9eTJv", "schedRange": ["KNDFrx6LabyDnqXj", "XKPIcxh0x7T6RQGn", "nW4ugGX6mKBbgTD9"]}, {"action": 48, "resource": "unt1oMNZ68eovHSH", "schedAction": 95, "schedCron": "xV3URIRVDYBd6hMB", "schedRange": ["0l7sg7IfMH5Tu1ky", "1ZYvyeHmfoFkUDP8", "64shbnQ3bVvuvpsD"]}]}' \
    > test.out 2>&1
eval_tap $? 354 'AdminUpdateRolePermissionsV4' test.out

#- 355 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'JXPCWkX4Kpi8CJ88' \
    --body '{"permissions": [{"action": 1, "resource": "S85yTIRWvLRy58UK", "schedAction": 100, "schedCron": "iRq5Juikmpat75rV", "schedRange": ["bN9ZBtzJ33tCwv8H", "1f451FVZ630HNBYZ", "Srz7pMjESLLMPKDX"]}, {"action": 77, "resource": "H9J6JLb5f3SBMyJU", "schedAction": 7, "schedCron": "f1srB7hGwGbUmQmJ", "schedRange": ["HNffZENs9X0hFMdz", "ryvhc1YjHmmulSBI", "Elc2CdRvBb0aGnMt"]}, {"action": 31, "resource": "5bWHb5sbX6asrjV7", "schedAction": 73, "schedCron": "QbWvSSp71zEPPfmA", "schedRange": ["QiqRRC2caquMRtQO", "ILcaDqUITBHQR5IS", "NoFR3GUxdMuvmL0U"]}]}' \
    > test.out 2>&1
eval_tap $? 355 'AdminAddRolePermissionsV4' test.out

#- 356 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'BfwzaaeP3Wd0Wrb8' \
    --body '["s3GW0CY0vAfbq8xo", "Curq4lpHXrbVBh60", "NUA2aKQwnXrmi6ya"]' \
    > test.out 2>&1
eval_tap $? 356 'AdminDeleteRolePermissionsV4' test.out

#- 357 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId '8u4sQPvaf1AcweR7' \
    --after 'tJW3MLMob1hUnIzI' \
    --before 'pUM8KK1kGFN0NUNG' \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 357 'AdminListAssignedUsersV4' test.out

#- 358 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId '51kOTJZluTekDMCG' \
    --body '{"assignedNamespaces": ["UJvERxNg8djSb4Vt", "2vKQ5vlCdI519Pf2", "iogwxM5DZM0dgozm"], "namespace": "co41750xdYQg34WU", "userId": "V0WpmsQnp1n4YGum"}' \
    > test.out 2>&1
eval_tap $? 358 'AdminAssignUserToRoleV4' test.out

#- 359 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'TKOlDOy5vhSkxERZ' \
    --body '{"namespace": "2AQ1jvXYBar5RMmm", "userId": "GdWl0wpj5tVfKU3D"}' \
    > test.out 2>&1
eval_tap $? 359 'AdminRevokeUserFromRoleV4' test.out

#- 360 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["8WVPh0Z7YiGE2cyz", "TMBY7Xd0OoENg2Lw", "7uepmahXojVZYz2z"], "emailAddresses": ["MU9jLzNV3GaG43R6", "nlRPrEAYqRBeSc5u", "Shoj3dGHMeoi5DBO"], "isAdmin": true, "isNewStudio": false, "languageTag": "0Gax0iX05IT9Agsj", "namespace": "l5NmnSHhxNmCe4tx", "roleId": "Y0MsPc9EMgf9JCJi"}' \
    > test.out 2>&1
eval_tap $? 360 'AdminInviteUserNewV4' test.out

#- 361 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "EvhL8ZfwCVJW9ysp", "country": "UOyHC9eKeXzrvzBl", "dateOfBirth": "lwzyC1aTWEmPgoy4", "displayName": "TkpEw4Zeid4mRoFN", "languageTag": "xv10ckMQVjKk3bWJ", "skipLoginQueue": false, "uniqueDisplayName": "ZuYSe3sI0x2hc8va", "userName": "N1Off5gRZZMW3huA"}' \
    > test.out 2>&1
eval_tap $? 361 'AdminUpdateMyUserV4' test.out

#- 362 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "IzBPWBYKAEFTdlKN", "mfaToken": "h6GTzKjsCqxx24QM"}' \
    > test.out 2>&1
eval_tap $? 362 'AdminDisableMyAuthenticatorV4' test.out

#- 363 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '35bSkFrvGciNHb7O' \
    > test.out 2>&1
eval_tap $? 363 'AdminEnableMyAuthenticatorV4' test.out

#- 364 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 364 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 365 AdminGetMyBackupCodesV4
eval_tap 0 365 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 366 AdminGenerateMyBackupCodesV4
eval_tap 0 366 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 367 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"factor": "Y5YIpOLJW52uz3c8", "mfaToken": "pz63M0g4xXT5Ts4e"}' \
    > test.out 2>&1
eval_tap $? 367 'AdminDisableMyBackupCodesV4' test.out

#- 368 AdminDownloadMyBackupCodesV4
eval_tap 0 368 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 369 AdminEnableMyBackupCodesV4
eval_tap 0 369 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 370 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag '0uR47OzUGHeBKtpv' \
    > test.out 2>&1
eval_tap $? 370 'AdminGetBackupCodesV4' test.out

#- 371 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'yRNgjZkdDppvEJiU' \
    > test.out 2>&1
eval_tap $? 371 'AdminGenerateBackupCodesV4' test.out

#- 372 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'iDGXgh8BKcLqtRZ9' \
    > test.out 2>&1
eval_tap $? 372 'AdminEnableBackupCodesV4' test.out

#- 373 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code '3LuR8OEyICvwgwBF' \
    --factor 'ehwtdJLdn3R2wo8b' \
    > test.out 2>&1
eval_tap $? 373 'AdminChallengeMyMFAV4' test.out

#- 374 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'eVQvgeP9qOHaLwYn' \
    --languageTag 'Xxrz7sLmP70LxN0f' \
    > test.out 2>&1
eval_tap $? 374 'AdminSendMyMFAEmailCodeV4' test.out

#- 375 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "3JA27Qz5SjzQfOLY", "mfaToken": "u9O46OOzz9p57qSp"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminDisableMyEmailV4' test.out

#- 376 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'HerzO87cg7TqtMiQ' \
    > test.out 2>&1
eval_tap $? 376 'AdminEnableMyEmailV4' test.out

#- 377 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 377 'AdminGetMyEnabledFactorsV4' test.out

#- 378 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'gi7Aj28qCRbwwZc4' \
    > test.out 2>&1
eval_tap $? 378 'AdminMakeFactorMyDefaultV4' test.out

#- 379 AdminGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyOwnMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 379 'AdminGetMyOwnMFAStatusV4' test.out

#- 380 AdminGetMyMFAStatusV4
eval_tap 0 380 'AdminGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 381 AdminInviteUserV4
eval_tap 0 381 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 382 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'ZS1NMkrnHs1Iyhwq' \
    --linkingToken 'k140MolIrnlkRVbc' \
    --password 'X435TDYpkk2Gza6D' \
    --username 'rSycophHw3EoEECl' \
    > test.out 2>&1
eval_tap $? 382 'AuthenticationWithPlatformLinkV4' test.out

#- 383 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'TO9SDKnMlnKW9jiN' \
    --extendExp  \
    --linkingToken 'Mu9QVrMeD4bD8gIS' \
    > test.out 2>&1
eval_tap $? 383 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 384 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'E34yIAZQeigiA3wB' \
    --factor 'rmBYIlZeheP72AB8' \
    --mfaToken 'EO3YrlyrWowUpUDV' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 384 'Verify2faCodeV4' test.out

#- 385 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'LlTtuJJsHZVsG6iz' \
    --codeChallenge 'JZruOJvSRFLDSdj8' \
    --codeChallengeMethod 'S256' \
    --additionalData 'g1rbhfIMStMnSqrK' \
    --clientId 'WYOuITlYS2RYaD9W' \
    --createHeadless  \
    --deviceId 'NKGhbLhjz1v0RBIO' \
    --macAddress '2rkJGmPaK6HEVIQJ' \
    --platformToken 'd3930TGewjRyfo4n' \
    --serviceLabel '0.7797011509753363' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 385 'PlatformTokenGrantV4' test.out

#- 386 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'VZZbKFsKOmgEhjH2' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform '2n6iQyr5cb5YL6fw' \
    --simultaneousTicket 'BiaVPmmn0T5uzlmi' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'NY26xrkPPdg3pXjm' \
    > test.out 2>&1
eval_tap $? 386 'SimultaneousLoginV4' test.out

#- 387 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'tpNfCrIj9ntYo3du' \
    --codeChallengeMethod 'plain' \
    --additionalData '4d3kSbTkHPMUvOAU' \
    --clientId 'Xkw36cr2WJQqS7Tq' \
    --clientSecret '4YIyZAFQ6lZfa2jd' \
    --code 'NvpWf32JS1av9VNp' \
    --codeVerifier 'VLT0LvqcfSdO1nAj' \
    --extendNamespace 'Y5FvADb3GUQgci63' \
    --extendExp  \
    --loginQueueTicket '2w6LUrHuKBoNTpPQ' \
    --password 'XDNHto74GcmVf0fb' \
    --redirectUri 'CU9QdPuWeMEeL0EJ' \
    --refreshToken 'G67g4W1eAmDxP23q' \
    --username 'stMuikKc6VNU8570' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 387 'TokenGrantV4' test.out

#- 388 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData '1arZAyuLcZoEkPpq' \
    --code 'KhP2jWnRTglw0gdW' \
    > test.out 2>&1
eval_tap $? 388 'RequestTargetTokenResponseV4' test.out

#- 389 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oE4esuiDrquccz4J' \
    --rawPUID  \
    --body '{"platformUserIds": ["6fFQezJ5E3iYHIkn", "vPcJkjRevVYfiExp", "AgoK9YDq1x3dkbJF"]}' \
    > test.out 2>&1
eval_tap $? 389 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 390 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "GV01vD7lNLxlpvqa", "policyId": "B9P9GaukfCEIeSBL", "policyVersionId": "hTfzigzHcRuJgYaj"}, {"isAccepted": true, "localizedPolicyVersionId": "8Dzyh1N0JEKNoMtH", "policyId": "vjM7X1fjzknv2HZM", "policyVersionId": "IL2P2bh14LroFTnA"}, {"isAccepted": true, "localizedPolicyVersionId": "fH2YR6QU7fj6w17a", "policyId": "rNs12hOoLVM7UFnu", "policyVersionId": "JDzeEkDxaVogxHrO"}], "authType": "EMAILPASSWD", "country": "Xu7FbleSP5PcdOuq", "dateOfBirth": "0m0rvakR8rcwojLR", "displayName": "jhcaJ56nGlYZ2tod", "emailAddress": "2BGBXjNyRCtPOr1F", "password": "U3QZy3gdDms3kb1h", "passwordMD5Sum": "tW0UGJpwQZlXuzu3", "uniqueDisplayName": "m9u67JjCDwg186hG", "username": "WKfO9MnoT3t99Hmc", "verified": true}' \
    > test.out 2>&1
eval_tap $? 390 'PublicCreateTestUserV4' test.out

#- 391 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "0hDg2kMgkvhoQe9g", "policyId": "D9tGN0nE7M36mI9u", "policyVersionId": "3EeZtLQij2JXsqdX"}, {"isAccepted": false, "localizedPolicyVersionId": "bcIMevTmC631p7q7", "policyId": "94bu49lINFTtERAX", "policyVersionId": "T2h3hcQ2wV3ZbBTn"}, {"isAccepted": true, "localizedPolicyVersionId": "QnVUhA5WnzVZdj8t", "policyId": "syzC4QaLXp3o4TDr", "policyVersionId": "aEEaDNJbVd20FVHe"}], "authType": "EMAILPASSWD", "code": "tolx64w1gyvjacKt", "country": "GqxMnoAXRlcq0mYW", "dateOfBirth": "KQYlqMmu2pvF6rP0", "displayName": "3bQaq1cT88H6RCW8", "emailAddress": "gJmGzDlqxtLsR2AG", "password": "OiPhNt2IdH8aYYUT", "passwordMD5Sum": "6mma833TDzk66ix8", "reachMinimumAge": true, "uniqueDisplayName": "lIMY5tTJw4KV104M", "username": "tMhKHmSjqPuQZX5K"}' \
    > test.out 2>&1
eval_tap $? 391 'PublicCreateUserV4' test.out

#- 392 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'jdNrEwfWo2MwulLg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "bsO4YHEYLjTSNDf3", "policyId": "zazm6p5Y1tkG9WwU", "policyVersionId": "4Ty6Ch5QYyFjuBqu"}, {"isAccepted": true, "localizedPolicyVersionId": "cu39YZJypWzpNXgn", "policyId": "oKIz8O8NglJtZTh2", "policyVersionId": "80vflFMxIhlIT8Ag"}, {"isAccepted": true, "localizedPolicyVersionId": "9pEz1TV5cUtPBsw0", "policyId": "1i5Mf7WvbNSeeDNf", "policyVersionId": "UESLlwHv3JgteOLy"}], "authType": "EMAILPASSWD", "code": "p8a1VqxXnRhDd9TG", "country": "kO6aIYqftw1SrM2n", "dateOfBirth": "hSEanfUYrMU6A43U", "displayName": "KGpvC1cr5T1PSXhd", "emailAddress": "uTWchzXDv3TAtBjP", "password": "4HSuiYCbG0UyYUJm", "passwordMD5Sum": "NL8p6AbdtU0CDrlQ", "reachMinimumAge": true, "uniqueDisplayName": "zrmbWofEaKStqdKu", "username": "4ROnONpJ849chqei"}' \
    > test.out 2>&1
eval_tap $? 392 'CreateUserFromInvitationV4' test.out

#- 393 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "UGQMwNwDlYSli3p8", "country": "YaAdel3hHMSLAisc", "dateOfBirth": "GRWzkCl1ZKuPxjDU", "displayName": "GRGcCEPjbUy7F82A", "languageTag": "du9BYRHrVTehrqgv", "uniqueDisplayName": "EtEs2LpE0qfbvdU8", "userName": "hlDoC9FnxqBlPBYJ"}' \
    > test.out 2>&1
eval_tap $? 393 'PublicUpdateUserV4' test.out

#- 394 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "7X6uVy7FWTSfMi2C", "emailAddress": "PVGxjcdpdCqVeePM"}' \
    > test.out 2>&1
eval_tap $? 394 'PublicUpdateUserEmailAddressV4' test.out

#- 395 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Sqb8y8qJTUQY40Zr", "country": "pn0vAD9YsPeDWrAV", "dateOfBirth": "QZSvgWuCuLsUGrVQ", "displayName": "AbhS54ZuQHKersDm", "emailAddress": "JLUHAKtfXCKOna8D", "password": "djtZhh6ofsUoRh6r", "reachMinimumAge": false, "uniqueDisplayName": "iTc9NESV22eRBElD", "username": "4K2Cy1tJcPAEkCeV", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 395 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 396 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "QsQk100eu5UcxuXX", "password": "pt0YSPX04uEIdAwg", "username": "DobopbdJeVCiKs2v"}' \
    > test.out 2>&1
eval_tap $? 396 'PublicUpgradeHeadlessAccountV4' test.out

#- 397 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "LyH9kcSBdk7MwQzn", "mfaToken": "28Le5neohqhCzroA"}' \
    > test.out 2>&1
eval_tap $? 397 'PublicDisableMyAuthenticatorV4' test.out

#- 398 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'zWQDve0Z2G2N09VI' \
    > test.out 2>&1
eval_tap $? 398 'PublicEnableMyAuthenticatorV4' test.out

#- 399 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 399 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 400 PublicGetMyBackupCodesV4
eval_tap 0 400 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 401 PublicGenerateMyBackupCodesV4
eval_tap 0 401 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 402 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "bbsz24fQKDZX6plE", "mfaToken": "rw0Gb0ceCbphW4YM"}' \
    > test.out 2>&1
eval_tap $? 402 'PublicDisableMyBackupCodesV4' test.out

#- 403 PublicDownloadMyBackupCodesV4
eval_tap 0 403 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 404 PublicEnableMyBackupCodesV4
eval_tap 0 404 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 405 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'hJ0S50bez9ZLHW88' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetBackupCodesV4' test.out

#- 406 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag '2riiPfRQ3rJ0f5lw' \
    > test.out 2>&1
eval_tap $? 406 'PublicGenerateBackupCodesV4' test.out

#- 407 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'XvRNDBnmL1KQn77h' \
    > test.out 2>&1
eval_tap $? 407 'PublicEnableBackupCodesV4' test.out

#- 408 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'iP1lzkzjYDw6mLBo' \
    --factor 'rdrJkD6vy60uRMT1' \
    > test.out 2>&1
eval_tap $? 408 'PublicChallengeMyMFAV4' test.out

#- 409 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'Xw9K9Yb68a8ygYx2' \
    > test.out 2>&1
eval_tap $? 409 'PublicRemoveTrustedDeviceV4' test.out

#- 410 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'TqkhlqMnE9Wj90EQ' \
    --languageTag 'zOidrWnLrXqImgDf' \
    > test.out 2>&1
eval_tap $? 410 'PublicSendMyMFAEmailCodeV4' test.out

#- 411 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "3GaJsdCZND0wgYOi", "mfaToken": "lX1e1825iasunESj"}' \
    > test.out 2>&1
eval_tap $? 411 'PublicDisableMyEmailV4' test.out

#- 412 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'cgr2drXG5NkKCySL' \
    > test.out 2>&1
eval_tap $? 412 'PublicEnableMyEmailV4' test.out

#- 413 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 413 'PublicGetMyEnabledFactorsV4' test.out

#- 414 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'A8cKCs0dFYRSa2OU' \
    > test.out 2>&1
eval_tap $? 414 'PublicMakeFactorMyDefaultV4' test.out

#- 415 PublicGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyOwnMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 415 'PublicGetMyOwnMFAStatusV4' test.out

#- 416 PublicGetMyMFAStatusV4
eval_tap 0 416 'PublicGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 417 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LZ0iOZJiOAh1SpLh' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 418 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "MF2Pav11FuU8iXCR", "emailAddress": "z8KgqgwijYxpGhsF", "languageTag": "Arq6lolbj7QKvtVR", "namespace": "CPMjr5M3vw1GqUjj", "namespaceDisplayName": "Fp6R8mYZwKftVqSE"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE