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
echo "1..386"

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
    --body '{"modules": [{"docLink": "EAxcVpFrttufHIRd", "groups": [{"group": "H9UzVRiXbqlAw7r6", "groupId": "W2ktQG0h5JAav5kR", "permissions": [{"allowedActions": [0, 27, 100], "resource": "mzZ0m8SAMTwE6I56"}, {"allowedActions": [70, 0, 77], "resource": "RDBXxyaNoMR6hksp"}, {"allowedActions": [71, 2, 27], "resource": "PngUNB1vRodwpzS6"}]}, {"group": "DaDpv8N7ZQVqGj6o", "groupId": "DLjWjkY1aXlFcDtg", "permissions": [{"allowedActions": [83, 81, 18], "resource": "Y4YkHs1cnz1JSDgY"}, {"allowedActions": [93, 29, 23], "resource": "p38zsCTCrbCbPOyN"}, {"allowedActions": [86, 23, 21], "resource": "y6XM4OI18mAQLnzj"}]}, {"group": "Mf8GZ2WBZqxYG3aR", "groupId": "EAu2D6QVKNCWP75T", "permissions": [{"allowedActions": [57, 30, 18], "resource": "Fgx4c8OumKtPDKJD"}, {"allowedActions": [67, 28, 25], "resource": "Z4U68su8XfqlqNiT"}, {"allowedActions": [43, 0, 56], "resource": "vj7AorKsxwkosAVe"}]}], "module": "rXpc1C8XfwHuKeb9", "moduleId": "l3rGN9A3sNm84hdd"}, {"docLink": "SpHt0P7MIIR7CkyF", "groups": [{"group": "6C7duuyZ0GhDogqr", "groupId": "hBRd8lDR6qVNPRZY", "permissions": [{"allowedActions": [6, 80, 65], "resource": "Rljv7IPrDQQRgat0"}, {"allowedActions": [91, 9, 76], "resource": "vkLGMS0lyuI9a2I9"}, {"allowedActions": [42, 52, 86], "resource": "Vpbsx5w8hqUI06Up"}]}, {"group": "OXGSLmCVuHOPlLlk", "groupId": "vR8sKgnuRkgghGoY", "permissions": [{"allowedActions": [42, 17, 31], "resource": "ljvjKoyD6SCwGrnc"}, {"allowedActions": [34, 21, 25], "resource": "QsfCaTmt1d67FXGk"}, {"allowedActions": [77, 37, 17], "resource": "9Q0mPVo3twu0MesT"}]}, {"group": "Cf9x4rt69lna7qxN", "groupId": "eIxPz6MbwL6IY69z", "permissions": [{"allowedActions": [100, 95, 11], "resource": "aLqYSYWytLPziZMd"}, {"allowedActions": [19, 89, 49], "resource": "Kd3IL5TAQ6iiPlSC"}, {"allowedActions": [42, 62, 63], "resource": "zfTD1ZBm3MqHcUmL"}]}], "module": "ZZbSqb8RwNmn9HrN", "moduleId": "Qy4uZAAiE0mit9RG"}, {"docLink": "CCHYzUOcEdscKHPE", "groups": [{"group": "qgA8yu7Vk6Jt4Ymo", "groupId": "s9Jcdos4fYcTVU6R", "permissions": [{"allowedActions": [56, 44, 39], "resource": "CkGZ5dAgqxpBFmaL"}, {"allowedActions": [29, 73, 49], "resource": "MdalwSyliWMNW5Ny"}, {"allowedActions": [77, 43, 41], "resource": "qtlB2jJCSQT279ZZ"}]}, {"group": "PYGu0rdlgdWyOtXi", "groupId": "3choQrpOsDBU5Sep", "permissions": [{"allowedActions": [19, 59, 79], "resource": "hB3V0v52Dlym6puQ"}, {"allowedActions": [57, 48, 66], "resource": "oJ8aeCnaLpUKp44Y"}, {"allowedActions": [96, 60, 11], "resource": "jasWIPUvmEejtGeo"}]}, {"group": "yIPa8ZRrvjj7il35", "groupId": "MXbN9oCMNqq98SjT", "permissions": [{"allowedActions": [45, 70, 15], "resource": "xjUkl535X3ateEKD"}, {"allowedActions": [31, 58, 53], "resource": "9b6i5lZC9xv32e8c"}, {"allowedActions": [88, 4, 88], "resource": "sSovoqsZNBdte9ND"}]}], "module": "UPVJf6c2Z0QZxfgP", "moduleId": "ubTDIHrvqAThuwjR"}]}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateAvailablePermissionsByModule' test.out

#- 110 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
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
    --body '[{"field": "QRENjEEztx1WsYSi", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["nSBJroav91GXlvPG", "6bFYReVHQipcCx9Z", "w5D2L7vIYhGGSyEW"], "preferRegex": true, "regex": "ZJJ42d3PBddN8S48"}, "blockedWord": ["l9lyNApflxqMrj3o", "Zk03QXcKMDYDDxHS", "ZjtqXyJ58f7Gc26S"], "description": [{"language": "aiGVkydwYWQG26yU", "message": ["ZNmTBcvrbYCwZtxF", "HyPLtI8ilbyDPUIj", "88cekdqCt81P1ktf"]}, {"language": "Iovmv9gsR5cJcHm3", "message": ["SZLxoRDFuuuySj29", "a9LJE8HoRS1X2PFA", "AMwzHPxB1UskYs4Y"]}, {"language": "w20DOqOBSC2DKHRu", "message": ["PMMWH8Yb33T5UBJC", "jfcnLRfxeCSz9WEi", "8KlloeH0JT1yduat"]}], "isCustomRegex": true, "letterCase": "vQR3biBfsu4jmsRE", "maxLength": 47, "maxRepeatingAlphaNum": 53, "maxRepeatingSpecialCharacter": 82, "minCharType": 50, "minLength": 63, "regex": "QAk4mqrxzTtuLl4X", "specialCharacterLocation": "lbGL8QOxtjzm8y2w", "specialCharacters": ["NhmwoYZyI4EFZKBc", "YrCEAE7WIsfmx40N", "LRc6m8heKnWhzfe2"]}}, {"field": "NubeoKFeIaFQCYoD", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["gJjBbEDoNf3n0hEo", "RCAcf80zfFyabWAg", "IUXiI07A68eaqC2J"], "preferRegex": false, "regex": "y9XzjjI5YbsKoADk"}, "blockedWord": ["zJEN2VHzih3bit0V", "Wn3CO39PXDNxtXge", "O3FgkXhjDzaQY3sn"], "description": [{"language": "n2ZkP7cFdP43e5dC", "message": ["9XIBudfZgrbHDIDm", "4hMzF4TxodenSrUT", "vfqU0bfoMm5cTtFW"]}, {"language": "botQyXJRcQWsmqPN", "message": ["s92epxk0i8VxsZNe", "reSvf9699mCEHThU", "JkETAsSp7gh4TeUT"]}, {"language": "kOkAYfJB8AT9t4Tv", "message": ["207Y2QD3oD5fLCr3", "OOlXVv8ZGF7uYnGz", "pipNDigNJma1Mbqq"]}], "isCustomRegex": true, "letterCase": "kvo1aolB4lkKB4EY", "maxLength": 82, "maxRepeatingAlphaNum": 81, "maxRepeatingSpecialCharacter": 21, "minCharType": 80, "minLength": 87, "regex": "lWkD9eOziYRFOn0j", "specialCharacterLocation": "JLHC9LxhvNXTwGBC", "specialCharacters": ["tohLtl9Zuhytm5UD", "rT6QXCs5SPBbRPZT", "F6oQAXVG7tnsZg5Q"]}}, {"field": "gXjvyGJPN4eXbJE5", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["yomQoIXimBJehyxl", "NsjUgxBkF6wFPoJe", "QediogEhhM2rIizG"], "preferRegex": false, "regex": "BHUTrDzZSKscfOcY"}, "blockedWord": ["u3dpCROYqUiGKXVF", "Cmpo6sPwVOEDSJsE", "K5QpNhlI2iS5EpGh"], "description": [{"language": "hvXYck0upMzUYnb7", "message": ["6tFkEORV3bu1bNCt", "X7W40V6Do5sYadCC", "FrHHC3DpZxkrQDXu"]}, {"language": "NFviMarv8mnfHK8C", "message": ["CmE2lPnsbD3SGEdl", "wuUccE536ugBp3HB", "vepnDCjgyJlXe36m"]}, {"language": "gWjLfFmteue9nzJ6", "message": ["fH24T805tVg8JqU0", "jZpjvsugAOS7u8Ri", "WyerCSa8SRgwsAj1"]}], "isCustomRegex": false, "letterCase": "xsB0NRsB1fPqqRRu", "maxLength": 23, "maxRepeatingAlphaNum": 54, "maxRepeatingSpecialCharacter": 32, "minCharType": 16, "minLength": 34, "regex": "d2wrS0uPdjhdinpn", "specialCharacterLocation": "g5BLy8wbhMssAHja", "specialCharacters": ["pIkY9Rf4wP57dBZN", "R88YbCtmKy8M9zVr", "jfGXZnqAQUoY1Gjl"]}}]' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateInputValidations' test.out

#- 114 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'IIk0iKoTTS1j02o7' \
    > test.out 2>&1
eval_tap $? 114 'AdminResetInputValidations' test.out

#- 115 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'JjTXAQN0qdskdQV0' \
    --before 'TqI8EFnmDbxIxi4Y' \
    --limit '74' \
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
    --body '{"ageRestriction": 23, "enable": false}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'Ss6g4iY9u02aCNYI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 100}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'latuUjjt9lIMGql5' \
    --limit '62' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "LcghVHfPEspxwhRO", "comment": "N0bc1eMbEIjowLqc", "endDate": "3ecjXJbZDKKoxLE1", "reason": "Y3Dymtj3giPg4x4y", "skipNotif": false, "userIds": ["Pjaf3H0tYighU0VU", "fcYHJbBfAKSiPW3V", "gsZXiR1DJ7HVWqMk"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "NSawQUWDFJvJBWic", "userId": "7UkBeIXuqDuAXI66"}, {"banId": "bQ71w0deoV9Lx5RD", "userId": "A1l2XcrciYNEzvSZ"}, {"banId": "IPkhSgORcz5S5Bvm", "userId": "gBLxh4ijFnE3Tam6"}]}' \
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
    --clientId '9qSZ7PC6f6QkmZXE' \
    --clientName 'lW9YfRSse6AAz3S4' \
    --clientType 'czz0QKFlAVmVLu4A' \
    --limit '82' \
    --offset '30' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["ec0z8eBeeoip68J1", "nsv4W2OJhtafxMSJ", "lHeb34sZKHcl5LLL"], "baseUri": "OexL4fZvWtND2tcB", "clientId": "FpX8lNtFEJ7tnkY6", "clientName": "Mca5afj12K2IzrBv", "clientPermissions": [{"action": 43, "resource": "KvgatOEBM70TdlNB", "schedAction": 72, "schedCron": "8kJATwlc6esUp6Sw", "schedRange": ["1I98jeZQ7hfxnhLd", "3Knaknoed9DHhLOq", "QGhCUr6iTrjyEgar"]}, {"action": 54, "resource": "5HTHQIoVsGo7dwV9", "schedAction": 60, "schedCron": "EveMdAdiPKDUVSC0", "schedRange": ["0PYeDcagginxnFIn", "a3yddcbsPheTH26I", "UJNvYuGRUvpZaHCu"]}, {"action": 62, "resource": "rIfapq5AAeMe4L3m", "schedAction": 61, "schedCron": "WgU4pCAKxeE70Cau", "schedRange": ["nQNxot371W9G4AvQ", "kqsGnmyo5JJTUVmb", "8GEXFTlEMEsFzYqw"]}], "clientPlatform": "gK1Np5nodqpLm7Fh", "deletable": false, "description": "BNXzAFdO0Khqf6ki", "modulePermissions": [{"moduleId": "TdSGv2LFjAKY7Cbg", "selectedGroups": [{"groupId": "sWqFWZX7kPBom8F9", "selectedActions": [66, 78, 94]}, {"groupId": "LTG8phc3n4iLoIll", "selectedActions": [75, 71, 24]}, {"groupId": "89hmguB8FOTjMLo4", "selectedActions": [3, 29, 26]}]}, {"moduleId": "rIzqYkEpstyVTBcr", "selectedGroups": [{"groupId": "M8rG0rH0zcswwVeM", "selectedActions": [74, 24, 4]}, {"groupId": "MbGIVIu8vvwLc7KY", "selectedActions": [55, 41, 98]}, {"groupId": "WoVeJIePF8ZrQzP4", "selectedActions": [51, 45, 24]}]}, {"moduleId": "tdxdbZUpd6FJtHJ1", "selectedGroups": [{"groupId": "pyVwyKQLY6FEO65R", "selectedActions": [3, 13, 52]}, {"groupId": "hP1y4Zi7s7QBlk44", "selectedActions": [37, 66, 22]}, {"groupId": "B1GZgKg4uKxaCgcG", "selectedActions": [77, 86, 41]}]}], "namespace": "pzwj1QGIFmlVf4jv", "oauthAccessTokenExpiration": 1, "oauthAccessTokenExpirationTimeUnit": "k5DiXZtLW87rGysr", "oauthClientType": "yod3dNQrmsApRA6H", "oauthRefreshTokenExpiration": 70, "oauthRefreshTokenExpirationTimeUnit": "3RwrKt2ecozL0TOg", "parentNamespace": "54vCE48L5oLF6M4l", "redirectUri": "Na4JUMSHNgqRqCV7", "scopes": ["usamANkZlOX9Sfo9", "5HgXqKhTPkwfLM9u", "SybRzWek2gZvRrvr"], "secret": "0n9d9lvccKMLhrTr", "skipLoginQueue": false, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 125 'AdminCreateClientV3' test.out

#- 126 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'kOmvrAejcq2LgkQu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 126 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 127 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'aS7RBx3vim02jBOx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteClientV3' test.out

#- 128 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'rZDyvpcLYOWA8Njx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["OnaEok4nOOCzfsfl", "hjbngJOUn18G5Mlf", "DTk8aG40NlncceIZ"], "baseUri": "SwgAIkgzh4pTU0Am", "clientName": "4DZhl0bQxFJ3sWCq", "clientPermissions": [{"action": 87, "resource": "hn50c9tNLDljhZ2j", "schedAction": 48, "schedCron": "fAacR0LgB5BUXvjc", "schedRange": ["u2s6w3VifnKqmTSo", "GH1XEfY6QAYn6WQ5", "UBEU1QAOHfZiGhxO"]}, {"action": 6, "resource": "VxYheR3j5mNZ6vwv", "schedAction": 27, "schedCron": "K8Asvt1j1Rx59hes", "schedRange": ["NWy2NvZ85DDKDAF8", "KDsBZOuYQJ03BAHZ", "7c53q7akMpcmnnx6"]}, {"action": 89, "resource": "wdrkEnnqKzFsLfYa", "schedAction": 24, "schedCron": "bN15zfQSfQrtfF3T", "schedRange": ["QN0OcNDLr36vzohZ", "yjMQAg5mPYhrLTyU", "8OhgfY9JQYGF4bYX"]}], "clientPlatform": "EcENx9xZlAchob44", "deletable": false, "description": "RcYp7FUjfIGaffof", "modulePermissions": [{"moduleId": "lEIByYqeKN0meGel", "selectedGroups": [{"groupId": "YF5wWaDhukU4khGG", "selectedActions": [68, 43, 6]}, {"groupId": "ZFTYnPkmSu4PWam1", "selectedActions": [19, 76, 47]}, {"groupId": "06MqQBErxgjVBycv", "selectedActions": [96, 60, 61]}]}, {"moduleId": "PbmRDcrg0DjQjBEC", "selectedGroups": [{"groupId": "Xvea7H1m2lJFRZ3Z", "selectedActions": [31, 36, 91]}, {"groupId": "Z60zMjhTHeh94TSe", "selectedActions": [27, 71, 63]}, {"groupId": "KVowi0RY2VN4ZONJ", "selectedActions": [89, 63, 8]}]}, {"moduleId": "l2Zsrh90ETtYmGuk", "selectedGroups": [{"groupId": "z3MnlrjcHp6B8Vj7", "selectedActions": [36, 84, 36]}, {"groupId": "FgDnDkdZ9bpjb1td", "selectedActions": [55, 78, 87]}, {"groupId": "QhjCMW64f4XhIjSo", "selectedActions": [93, 27, 56]}]}], "namespace": "77AtYoFzLAATPY8P", "oauthAccessTokenExpiration": 84, "oauthAccessTokenExpirationTimeUnit": "zTxBGtEJIYppuUSs", "oauthRefreshTokenExpiration": 75, "oauthRefreshTokenExpirationTimeUnit": "Rry0KK5rgAGO0dW8", "redirectUri": "rX2MVUGKSZ4GcLkt", "scopes": ["4pK32sJxlZcCTpTd", "RtCHvuk6B6XTmSLy", "n50sigBVZxiKdV57"], "skipLoginQueue": true, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateClientV3' test.out

#- 129 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'YDo5R3hLiD5sf5y1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 72, "resource": "lsDd4M1F5qRIblS7"}, {"action": 81, "resource": "BZVGLlkUetzCAWc9"}, {"action": 48, "resource": "dFOyqA2clJ5gEOaC"}]}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientPermissionV3' test.out

#- 130 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'gM6Yn6RugbNEIpGB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 64, "resource": "t7zqmSKxOEQlVcx6"}, {"action": 66, "resource": "CIW5ynMKquUicAeI"}, {"action": 97, "resource": "ZehK0G2nmyuViB9k"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminAddClientPermissionsV3' test.out

#- 131 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '90' \
    --clientId 'OICf5oD1e6oI9FmY' \
    --namespace "$AB_NAMESPACE" \
    --resource 'el0kOw72o8Zkgk0j' \
    > test.out 2>&1
eval_tap $? 131 'AdminDeleteClientPermissionV3' test.out

#- 132 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'S6rDWUwfhKvrf2Aa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 132 'AdminGetConfigValueV3' test.out

#- 133 AdminGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    --filterBlacklist  \
    > test.out 2>&1
eval_tap $? 133 'AdminGetCountryListV3' test.out

#- 134 AdminGetCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 134 'AdminGetCountryBlacklistV3' test.out

#- 135 AdminAddCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminAddCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"blacklist": ["H4yCWrHSppnIZkNn", "Tn3rzH5NvAtcvNed", "gS1fUfKmihDbmu8e"]}' \
    > test.out 2>&1
eval_tap $? 135 'AdminAddCountryBlacklistV3' test.out

#- 136 RetrieveAllThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'RetrieveAllThirdPartyLoginPlatformCredentialV3' test.out

#- 137 RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 137 'RetrieveAllActiveThirdPartyLoginPlatformCredentialV3' test.out

#- 138 RetrieveAllSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 138 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 139 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xCOWMpyh9pMsQgb6' \
    > test.out 2>&1
eval_tap $? 139 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 140 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4ELbzDMwyo4nIRys' \
    --body '{"ACSURL": "QdbufXjYnSoIFeou", "AWSCognitoRegion": "C2m38kXrDZWlGVE9", "AWSCognitoUserPool": "sJ4NpUtKp6M9I6nE", "AllowedClients": ["wnZhsjwJeGwaPSDM", "Zz95OYKiqaZD63xe", "5rruJVfLGea0Ztlz"], "AppId": "UcuHAXz0UV31MfuG", "AuthorizationEndpoint": "aXsAuGsZaSHevO0T", "ClientId": "QNEI3kfabxJWWSI1", "Environment": "ECUo1NPpeFhUztXD", "FederationMetadataURL": "gB7n4C97uAPP8PAT", "GenericOauthFlow": false, "IsActive": false, "Issuer": "YBZsWFbr3RSP0W9n", "JWKSEndpoint": "Bhvhf8Q0DtJMcYQd", "KeyID": "N66bswAgt65X4N1L", "NetflixCertificates": {"encryptedPrivateKey": "QZmB61JMdtwCVUrY", "encryptedPrivateKeyName": "Que84dwmbwFEnAZa", "publicCertificate": "WsQJtRYoagRJK5PX", "publicCertificateName": "9UcOvhPyE11TRT2S", "rootCertificate": "Kseoe8VLie0LBa36", "rootCertificateName": "KNzjf005CXNGehQ2"}, "OrganizationId": "aTjTDfKFDXC7eGL5", "PlatformName": "YhJDWh9YWqc0qgV6", "RedirectUri": "d9yOfIMLds2DbPca", "RegisteredDomains": [{"affectedClientIDs": ["oMdtRLTmSvTkQQgB", "7exYvmHMxr5hPCJJ", "ztJBg0tTJg46IewO"], "domain": "XE2AkCh3QIZsUf8l", "namespaces": ["GFXcmwTERHclOdxI", "wqejxe18rNdb8Otq", "6j1mqUav7k05HAQl"], "roleId": "tnSojV4jT65yclX2"}, {"affectedClientIDs": ["FtAz0vJjFIYWOaNd", "simmkW2miH3xRHAK", "y4QxZkaXZ7vmiEd0"], "domain": "JPxVyQpshaDwNqTb", "namespaces": ["bFMXAMfVXe0GZeMg", "sRsmH1EQrYmkPKTP", "OlhTtSiZNCxuogFt"], "roleId": "eTHJe4BhSSQkQD6W"}, {"affectedClientIDs": ["mOt6D7ufFVTOhvQp", "fbBke8aEdd36xj6w", "ySoltDxsbzxrlaKE"], "domain": "fkoYjY2o6ouRW9Ut", "namespaces": ["NquwC3WgumrIz4Nh", "GztZpr4U4fwQIiLX", "gmRasvjO4lj8m3XE"], "roleId": "wP2b4gd3xOeii8Jn"}], "Secret": "mssep2xD2NY0kABe", "TeamID": "Gs9yxahld1pO0Gyf", "TokenAuthenticationType": "5PO3COyMvczgEpzZ", "TokenClaimsMapping": {"3FbtxfhcRC7IVYa6": "iZ5uFRYNn3SHiWxF", "0YbuU5ar5qTLWUCy": "0Afgc050XIZRW491", "e94mQjVOOBnIWhun": "ElqZUodp3IhtCSHy"}, "TokenEndpoint": "1ei1fIrPvfHnRN06", "UserInfoEndpoint": "EjRwEQlNapJRfk4f", "UserInfoHTTPMethod": "9Zcw1pEHAyNFxcVT", "scopes": ["KuAQTGh5BxjWOozG", "oDtsUuYo5p8ED5QZ", "AufwNa8lzfjv9oYM"]}' \
    > test.out 2>&1
eval_tap $? 140 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 141 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XMjlVHY1AHwF3vGo' \
    > test.out 2>&1
eval_tap $? 141 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 142 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'av7MK0PcLnEkcokK' \
    --body '{"ACSURL": "wcQ0baDT9OyJ2h23", "AWSCognitoRegion": "GUS2amU7syGlElXd", "AWSCognitoUserPool": "EAOrVSnLocLVVYam", "AllowedClients": ["Qc4wcG5nDBLJoJHb", "iQ5duE5p4cfs2E41", "cK8QTwiIAvxSvNDl"], "AppId": "mM5nQFMGzs7fzjgy", "AuthorizationEndpoint": "c44mEh9tRk8knYSV", "ClientId": "30lnroQehMDli6t9", "Environment": "unQLYXxm09wpGAbp", "FederationMetadataURL": "EmDY9vLh3u6EDsUm", "GenericOauthFlow": true, "IsActive": false, "Issuer": "kH4OotKwG3UC6XCn", "JWKSEndpoint": "nZxF8CmQr17W65br", "KeyID": "34rBBN9tU6TDm5Gl", "NetflixCertificates": {"encryptedPrivateKey": "oFSKWM1eym5ydC6p", "encryptedPrivateKeyName": "25xCWTqUOYZENJ1Q", "publicCertificate": "HZQxPRXH7uxBJEEC", "publicCertificateName": "QE1li3Bg7Jxc9pUn", "rootCertificate": "ZmvhidwCkZwqjYLf", "rootCertificateName": "TiCO1NDBvQvRPnAz"}, "OrganizationId": "4VzW0CpoBCbyJsF5", "PlatformName": "IjF1c0W338HS6CBg", "RedirectUri": "VRyihYNZ84CVhziX", "RegisteredDomains": [{"affectedClientIDs": ["V8HwSmvcvcDKF19y", "VRafCjOuSYht83Ad", "vBaagTiRJ8daGTVX"], "domain": "3Bb7jlz5IfHgKjI9", "namespaces": ["mwJSrN8jkIykR2zb", "aI6PD7fEscShnGUG", "UtV9GJ279GDbLNwj"], "roleId": "m3FK0nnX2poMfZ1h"}, {"affectedClientIDs": ["DHtbh4HtMlFgvh2D", "p2SoiIPp1yvfAHS0", "VgLu11A3HTovFi4t"], "domain": "PAGfleyCA6jEtcqs", "namespaces": ["nzoVILjkwW61duF8", "7aUyrdt4XSpWBAet", "sanzqP8oxfrtbECD"], "roleId": "1CYPwaiBAxfYL8Av"}, {"affectedClientIDs": ["t70ZUT2fSk3LL0ca", "lqxEewuGS469k2hG", "0WKt4sUmanYxM0UH"], "domain": "ZVNYzGMNIpWoSLkU", "namespaces": ["rfuf4U3WeYeA9t2E", "NKKWrFtHIi1CMgKA", "OG5iDcCR5PbCvDLi"], "roleId": "l8wj9cKM3Ar6MF35"}], "Secret": "hCER4nGmWGgTJfHl", "TeamID": "Jl4tHGa4XfZcd9CV", "TokenAuthenticationType": "nGqMX9FieeEssWEU", "TokenClaimsMapping": {"l07bhwntCVqiYOJf": "5KwMZQjzvjSozv6C", "TRDl0zp9CzHFwink": "BNi4gvqgl6TZ9TGV", "Pmv34h6T7Esufmfx": "KYB4LM6H6QXmpZ9X"}, "TokenEndpoint": "3fUSR1l9xLPBsmAU", "UserInfoEndpoint": "rD9L1IiD6MlcEPhM", "UserInfoHTTPMethod": "DFzjHZ3sIhzOx2CX", "scopes": ["KlvIomU3pIxM9n8D", "2eLMe3lt9qfx2UDc", "gVE7L9FK6e0MrPc4"]}' \
    > test.out 2>&1
eval_tap $? 142 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 143 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vtxk9hVKlG56HlzG' \
    --body '{"affectedClientIDs": ["r7XjdyRJunZPkp6c", "cIBnWyPw8mj7gyQ7", "XdIszGRj46COPipH"], "assignedNamespaces": ["1MWVTHG0qHJCWEfO", "JpZm9yEYWNGMy2pg", "SGSUOK68eqGJtWf1"], "domain": "Ybgg8rdwY9bmrvHm", "roleId": "O07KNqX9LM2IwEsd"}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 144 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OGBXBwnzDX8v3xgC' \
    --body '{"domain": "1Ge9PdbTTAJ2Gp1r"}' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 145 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '0sVZ6LJAOddIL2l3' \
    > test.out 2>&1
eval_tap $? 145 'RetrieveSSOLoginPlatformCredential' test.out

#- 146 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hPjNDKv2LWfXqjr8' \
    --body '{"acsUrl": "fS79En3wYowBdkaZ", "apiKey": "3y6i38XQjLDRqkpi", "appId": "FK5BtiQ272Uo9UBJ", "federationMetadataUrl": "WodpdwsX1jorcyR0", "isActive": true, "redirectUri": "rkzUvck3xTtmOFMe", "secret": "bS4AdlNzwog2IhEr", "ssoUrl": "kNhNcECWwchW6zL9"}' \
    > test.out 2>&1
eval_tap $? 146 'AddSSOLoginPlatformCredential' test.out

#- 147 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SkbLlrNXnGanMazb' \
    > test.out 2>&1
eval_tap $? 147 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 148 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '8jvRWenURH48aJuA' \
    --body '{"acsUrl": "LEcSqcE15u6D31Dj", "apiKey": "Osrs3CUYATdqnQGb", "appId": "qiqOkNeATj7eGjod", "federationMetadataUrl": "d7CcJUrI6MAugK5k", "isActive": true, "redirectUri": "2yqPsMFxKybPkbuS", "secret": "6x9cLJ1APnNlsa2b", "ssoUrl": "RBr27fVMWuAfDqLM"}' \
    > test.out 2>&1
eval_tap $? 148 'UpdateSSOPlatformCredential' test.out

#- 149 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'R919IZPKOKiAVQXX' \
    --rawPID  \
    --body '{"platformUserIds": ["OmqFHLbyXmgCNiXH", "8uenbC5CphgMweex", "sIAP5vHLjBJ9iqMc"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 150 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BL4BzhDUjhKPwbwc' \
    --platformUserId 'vQU5kG8bXGFmPAnO' \
    > test.out 2>&1
eval_tap $? 150 'AdminGetUserByPlatformUserIDV3' test.out

#- 151 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'kDiJq4xQye7HqnVK' \
    --after '39' \
    --before '58' \
    --limit '98' \
    > test.out 2>&1
eval_tap $? 151 'GetAdminUsersByRoleIdV3' test.out

#- 152 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress '7bzjPpucddXJ5zif' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetUserByEmailAddressV3' test.out

#- 153 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'F8y959anrNSleywH' \
    --body '{"bulkUserId": ["bHig6IKWVZ77KeRW", "dECaFGzfZ2hxcJ2F", "nemn7M23SzUo4hNB"]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetBulkUserBanV3' test.out

#- 154 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Dh9ZFP1OW0nXOErQ", "PS4VsRoYIK69yg9A", "DCGiXaLs2xjHkinO"]}' \
    > test.out 2>&1
eval_tap $? 154 'AdminListUserIDByUserIDsV3' test.out

#- 155 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["D975nARHCmhNHSXu", "qIHsxvaUoXDmwWsu", "kxncuD3QxCXMd00Y"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminBulkGetUsersPlatform' test.out

#- 156 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["BWCaVVmM45mfIZsW", "hkS476dGGJwJ00UH", "197MJ6zU7JLMQyMW"], "isAdmin": true, "namespace": "VJbXi7eRZa7WwIc8", "roles": ["95ImqK6tVsaUq3st", "Uh5J5Z9GiBiSAylX", "5cS0IeHpWCugmfOL"]}' \
    > test.out 2>&1
eval_tap $? 156 'AdminInviteUserV3' test.out

#- 157 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '87' \
    --platformUserId 'fds1BYx0EaURydf8' \
    --platformId 'ZyyZeHAWGgJUbUJR' \
    > test.out 2>&1
eval_tap $? 157 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 158 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 158 'AdminListUsersV3' test.out

#- 159 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'bkcTglbU86FyOjAp' \
    --endDate 'NHBVfNOURcjY3YYT' \
    --includeTotal  \
    --limit '29' \
    --offset '93' \
    --platformBy 'L13Ornyx34luLdvt' \
    --platformId 'sTKXMjiw6gYPvfn2' \
    --query 'Qt9iyq3Nyk8ncu2Z' \
    --skipLoginQueue  \
    --startDate '3eDHH9WaVO4iKhDc' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 159 'AdminSearchUserV3' test.out

#- 160 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["J7TCcNIsQ3PuppUx", "DSK8aOTGMudcxlCV", "4cNbJGQ57lPdinpj"]}' \
    > test.out 2>&1
eval_tap $? 160 'AdminGetBulkUserByEmailAddressV3' test.out

#- 161 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'S2DRfGt9GlyZVQ4X' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetUserByUserIdV3' test.out

#- 162 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '67tPZSTpPq3xjrEl' \
    --body '{"avatarUrl": "vvDgw0ag7kSWE0Hi", "country": "qm5IuLryiEXqvUWD", "dateOfBirth": "jU1G0EVjVZw1ToLu", "displayName": "PakQN1MpOs1RVFrc", "languageTag": "g2CXxepx78fvsyhE", "skipLoginQueue": true, "uniqueDisplayName": "zNXGTuQPIDpor7t1", "userName": "aJLNNz6QIVC9Mfuc"}' \
    > test.out 2>&1
eval_tap $? 162 'AdminUpdateUserV3' test.out

#- 163 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8VOsnmnlVljdWYmE' \
    --activeOnly  \
    --after 'Le74p38vumnxAnYB' \
    --before 'TxaTIz0jcgDI8Pkz' \
    --limit '44' \
    > test.out 2>&1
eval_tap $? 163 'AdminGetUserBanV3' test.out

#- 164 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NIY9nMrBZo0lNUBD' \
    --body '{"ban": "ShHD32vvL28FPwTi", "comment": "XfLcxDC9Ynd02mEC", "endDate": "IQhfIhHtADUQ9zim", "reason": "QTQT95pFJUAJsyAf", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 164 'AdminBanUserV3' test.out

#- 165 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'qguqD5xxGxBWtnTK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ue2znsqPzPkwCBo2' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateUserBanV3' test.out

#- 166 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LC10ih2EQfY3XCv4' \
    --body '{"context": "hdOa6FdZhNMd1onF", "emailAddress": "jGRbxtABPXDmgNEJ", "languageTag": "BhgGq5GIDhNC66sz"}' \
    > test.out 2>&1
eval_tap $? 166 'AdminSendVerificationCodeV3' test.out

#- 167 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bCCf73IFbRkPSSIT' \
    --body '{"Code": "z4TjCrJHXGXku2YV", "ContactType": "uOzhxHmnrrV9ZGWr", "LanguageTag": "Z05sxe6A6RpmKDeb", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 167 'AdminVerifyAccountV3' test.out

#- 168 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'kylbynkgT9vayLLi' \
    > test.out 2>&1
eval_tap $? 168 'GetUserVerificationCode' test.out

#- 169 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'izac7Ge6zKJdlt7r' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetUserDeletionStatusV3' test.out

#- 170 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jF5RaJwvkWVco2LT' \
    --body '{"deletionDate": 30, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 170 'AdminUpdateUserDeletionStatusV3' test.out

#- 171 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'B9YQzUJ9XlYJ8BzP' \
    --body '{"code": "6EUmUXGM5anIloyj", "country": "9lhbvuQdW2jwKUck", "dateOfBirth": "c794ryY91lX8DD4M", "displayName": "YXlrJ81lHvv9rqvE", "emailAddress": "oM8YmVjAkO3HKsEp", "password": "6KlqwW4djrexcbHd", "uniqueDisplayName": "EtoQvpV344RctmTo", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 171 'AdminUpgradeHeadlessAccountV3' test.out

#- 172 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0HzYviTgYmx82JVB' \
    > test.out 2>&1
eval_tap $? 172 'AdminDeleteUserInformationV3' test.out

#- 173 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RLPZ6Iz8tne5dbgu' \
    --after '0.43735072980097156' \
    --before '0.5080236598428187' \
    --limit '13' \
    > test.out 2>&1
eval_tap $? 173 'AdminGetUserLoginHistoriesV3' test.out

#- 174 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gsvvdl8jHz9x7XZI' \
    --body '{"languageTag": "jU4IK9lOLaZaMphK", "newPassword": "CqTq3EVheJjoEEXB", "oldPassword": "LIxGnNuhoJM3WWPv"}' \
    > test.out 2>&1
eval_tap $? 174 'AdminResetPasswordV3' test.out

#- 175 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vCiCf33ViEdqQpoG' \
    --body '{"Permissions": [{"Action": 21, "Resource": "WLWLNfHRD3V15QaG", "SchedAction": 67, "SchedCron": "ESC6hZYTYZbzf5aA", "SchedRange": ["NNNs5kgSZZNUHbIT", "9szApmWJO5vzzXZj", "08a6K1XRVfriSpPF"]}, {"Action": 28, "Resource": "JPOIKrRBrYVzi9ui", "SchedAction": 32, "SchedCron": "lvozTt9TsH7A0TuU", "SchedRange": ["2aL4bPkk11sys6Gd", "kDcos5uVJ0BJfZ0j", "vA54CSqZFDsO1skR"]}, {"Action": 19, "Resource": "SCdnFKLc0xcTjqjd", "SchedAction": 4, "SchedCron": "dd85bdYUumPKVSZC", "SchedRange": ["g3XTc9vQe0dHJfF6", "KIuvnRCa9JktyBdx", "kZKrEWFw9GYxjiiO"]}]}' \
    > test.out 2>&1
eval_tap $? 175 'AdminUpdateUserPermissionV3' test.out

#- 176 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QAD77ci0vfWVZoRR' \
    --body '{"Permissions": [{"Action": 79, "Resource": "ChSclSkb5aBi9K9z", "SchedAction": 50, "SchedCron": "KNKoXa0dgx1JgjC5", "SchedRange": ["6pda3YhtQxpCYME6", "x21pdX2QSPAd9sxo", "LnWGP1PafIjLX8ce"]}, {"Action": 41, "Resource": "KbNN7Ycl2JfmQplv", "SchedAction": 66, "SchedCron": "SoaGk4ktF5wnJDg9", "SchedRange": ["Q3WXiydCOInVolsr", "6CHmj763vLwtYEJT", "SiXjcY5ZPkv90lyK"]}, {"Action": 91, "Resource": "W11vtpaTxi7k489j", "SchedAction": 89, "SchedCron": "bkVs3qFTi1t530Wj", "SchedRange": ["1WfzIvc3VlSXrA3X", "UGud4tVjmxEf4XvV", "hFJTxFHITBg9x4un"]}]}' \
    > test.out 2>&1
eval_tap $? 176 'AdminAddUserPermissionsV3' test.out

#- 177 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'q3eOMHIKeTyBG5dC' \
    --body '[{"Action": 95, "Resource": "HEaqbzHvDDl1jiLw"}, {"Action": 82, "Resource": "XMGBA6JXDpA1tIC4"}, {"Action": 58, "Resource": "iLjLyZrXr9Bhtzn8"}]' \
    > test.out 2>&1
eval_tap $? 177 'AdminDeleteUserPermissionBulkV3' test.out

#- 178 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '20' \
    --namespace "$AB_NAMESPACE" \
    --resource 'JnUpryDeRcpUvlrw' \
    --userId '2MwC1uuokpaIjL0V' \
    > test.out 2>&1
eval_tap $? 178 'AdminDeleteUserPermissionV3' test.out

#- 179 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xe5n9Lx3QcFo9gxO' \
    --after 'gvDc7xMrRKvw8ISP' \
    --before '2WKmCRRXBxlalCHt' \
    --limit '99' \
    --platformId 'eLgsAF4ctv5guycG' \
    > test.out 2>&1
eval_tap $? 179 'AdminGetUserPlatformAccountsV3' test.out

#- 180 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'iq9j2EyIknfLDpgH' \
    > test.out 2>&1
eval_tap $? 180 'AdminGetListJusticePlatformAccounts' test.out

#- 181 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'nMOn8nc3gUZ8ZFyy' \
    --userId 'Er0KBXuJBqK4QtEy' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetUserMapping' test.out

#- 182 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'dPWLPBYiR3UbJc1Z' \
    --userId 'Yapx7C477etqgfOJ' \
    > test.out 2>&1
eval_tap $? 182 'AdminCreateJusticeUser' test.out

#- 183 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'DUT0uKAPrARya2IM' \
    --skipConflict  \
    --body '{"platformId": "lNiXpF4qvsUUpHqi", "platformUserId": "33TcBGkc0HjUcnkp"}' \
    > test.out 2>&1
eval_tap $? 183 'AdminLinkPlatformAccount' test.out

#- 184 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'U9oVzl2kBuLFXIeC' \
    --userId 'EKZUTz3GvCAZ5j24' \
    --body '{"platformNamespace": "acYHbrryHB6GO9zP"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminPlatformUnlinkV3' test.out

#- 185 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3FaepA3b3YJ9nJM6' \
    --userId 'vtT27xv85K5MU2qm' \
    --ticket 'beqaVemINdClpF7O' \
    > test.out 2>&1
eval_tap $? 185 'AdminPlatformLinkV3' test.out

#- 186 AdminDeleteUserLinkingHistoryByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingHistoryByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vlBIEgjse5kd6GED' \
    --userId 'o08yq5E5HleLoog4' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteUserLinkingHistoryByPlatformIDV3' test.out

#- 187 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'me2NBFp62xlXvVcJ' \
    --userId 'erTPW02PWsHiKYAr' \
    --platformToken 'AxnKBfBfDlrQQuAc' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 188 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId '10DjjwMv4vrIPRtv' \
    --userId 'hQIyLarjaLOKnX51' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetUserSinglePlatformAccount' test.out

#- 189 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yAB8Pa3uNGKhaLlJ' \
    --body '["zJMSnJIIgsAVmaGY", "xUX1B9oVuzG2CnYX", "2YBF2g7TVtzYEHUo"]' \
    > test.out 2>&1
eval_tap $? 189 'AdminDeleteUserRolesV3' test.out

#- 190 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dh3iUfBthbepUCTW' \
    --body '[{"namespace": "iZ1uqh7GAi4FEIu4", "roleId": "4u83ZLRxYlYqlpq0"}, {"namespace": "3BGdIk4oEogFVGR7", "roleId": "1rJOBy6lsj1AKGBj"}, {"namespace": "nHmaAu4YK87DYAWW", "roleId": "cbcbGWmKgE8CZ4AE"}]' \
    > test.out 2>&1
eval_tap $? 190 'AdminSaveUserRoleV3' test.out

#- 191 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'Lr5lraa5v5P5Cj8h' \
    --userId 'gFsqHC9h5JPiMEtg' \
    > test.out 2>&1
eval_tap $? 191 'AdminAddUserRoleV3' test.out

#- 192 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'KuiGTYgwWv5XldL6' \
    --userId 'rOVGcRAn51rVAQSx' \
    > test.out 2>&1
eval_tap $? 192 'AdminDeleteUserRoleV3' test.out

#- 193 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'p4qTB54mKA3V9DKl' \
    --body '{"enabled": true, "reason": "zkMJ7cudf4r916GP"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminUpdateUserStatusV3' test.out

#- 194 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'rhn2etVIQvRkQJAt' \
    --body '{"emailAddress": "DUH9tx60AehGz1er", "password": "mJYXsYgL7TfyIlAw"}' \
    > test.out 2>&1
eval_tap $? 194 'AdminTrustlyUpdateUserIdentity' test.out

#- 195 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jTZdRZJJzWZwvTX2' \
    > test.out 2>&1
eval_tap $? 195 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 196 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'bamSCvX1nwvSWdDw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "D7WJHzgNZUKsI5y0"}' \
    > test.out 2>&1
eval_tap $? 196 'AdminUpdateClientSecretV3' test.out

#- 197 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'mR3zMyTsftKqnsIJ' \
    --before 'ctAdxyZVKHA9DkaS' \
    --isWildcard  \
    --limit '82' \
    > test.out 2>&1
eval_tap $? 197 'AdminGetRolesV3' test.out

#- 198 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "managers": [{"displayName": "tg8yw8lHEbVDwBAq", "namespace": "anOlscRIWw82k5K5", "userId": "VTkdubkOFldMCQ98"}, {"displayName": "JH4n0JtgqzZv5kVu", "namespace": "4S95mj8YRvae4f4l", "userId": "hBPbarbWEm8bVtZc"}, {"displayName": "fVCPdQhim9QKUAFT", "namespace": "VYelIlGJg9wdc8bi", "userId": "hhWjfZpfcFBUsnnD"}], "members": [{"displayName": "JlmD1iEokbUiYzCQ", "namespace": "h2iNTwtnohddMzMT", "userId": "Q9P7sYLDWAJOA75K"}, {"displayName": "4BYJ2fkqYJoF2FI3", "namespace": "vyyqRzc20O7FdsJP", "userId": "1G9tyBTfERXdvgD1"}, {"displayName": "Qf7Ot2DkUt3yexZB", "namespace": "RvxYnEBhXtAVxCd3", "userId": "meTrT7cF9oVCh89w"}], "permissions": [{"action": 81, "resource": "JE3RMUddwSSgxCu8", "schedAction": 51, "schedCron": "CGNgaJmuALlMQl9R", "schedRange": ["Lrthbfp0VgweLlT2", "sY3SsTnDQY7kKU2u", "06Q4veujxtyQENvJ"]}, {"action": 35, "resource": "pcYPK8IxrSZuxWl0", "schedAction": 72, "schedCron": "0bitNQLzwRoWnR0A", "schedRange": ["bkCPY70FmvviVIBb", "cujF8Vk5qb8NhWWw", "axyMchkt8l5IPSrw"]}, {"action": 36, "resource": "h2dJ90yqHDNacl4F", "schedAction": 23, "schedCron": "G6Dl5TFwBY6HKXAb", "schedRange": ["lkT8VGgSH8MGZGwi", "Vj7eDTaka9ABfX1I", "ByPEOuPhGspRi3bh"]}], "roleName": "PQvBBJI5Jxytpcub"}' \
    > test.out 2>&1
eval_tap $? 198 'AdminCreateRoleV3' test.out

#- 199 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'N4AUUPFPscZsXeJO' \
    > test.out 2>&1
eval_tap $? 199 'AdminGetRoleV3' test.out

#- 200 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'D4DMtqfIGiGJovgW' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteRoleV3' test.out

#- 201 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'SRxZ8N4UQ2fg3V1o' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "0hL5DuBDqMyIAzWz"}' \
    > test.out 2>&1
eval_tap $? 201 'AdminUpdateRoleV3' test.out

#- 202 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'e94MEdJFAy2JTllJ' \
    > test.out 2>&1
eval_tap $? 202 'AdminGetRoleAdminStatusV3' test.out

#- 203 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'kRGB8jqJEd6eqqsB' \
    > test.out 2>&1
eval_tap $? 203 'AdminUpdateAdminRoleStatusV3' test.out

#- 204 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'VyONV0JRtozI0jpl' \
    > test.out 2>&1
eval_tap $? 204 'AdminRemoveRoleAdminV3' test.out

#- 205 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'iCFQ6WgJpGPigdc5' \
    --after 'VyC4qvWjVac1cQvS' \
    --before 'xgTNIUzxDgBlIbuz' \
    --limit '25' \
    > test.out 2>&1
eval_tap $? 205 'AdminGetRoleManagersV3' test.out

#- 206 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'u4htrsf8eIFSovTG' \
    --body '{"managers": [{"displayName": "XaMsq8ePN1oco2jx", "namespace": "8Upe8SjMvpqM8pug", "userId": "gOEdG47gD5i2Ni6A"}, {"displayName": "nWn3NdEPhNHSH7eK", "namespace": "DfRcngEpTnRUQr3R", "userId": "LOM1vEx4gqDY6jwy"}, {"displayName": "KRxhkLe5zohg9s9u", "namespace": "tRQt28b6o3K0COF7", "userId": "4tz6aeXZOYwbwjMN"}]}' \
    > test.out 2>&1
eval_tap $? 206 'AdminAddRoleManagersV3' test.out

#- 207 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'dxKWlBfnRyFS0Ed7' \
    --body '{"managers": [{"displayName": "gTM5AVrtBQiDTcNn", "namespace": "Za6Zuxk6u6HXXdiC", "userId": "9ZDj4E4mv12FNXyp"}, {"displayName": "oOLl13j84P0KqirJ", "namespace": "4PkMFtsnFfz8Ew0X", "userId": "8fBuBSKLSQ4GvLtz"}, {"displayName": "50D3rpBfBovqLwXB", "namespace": "uT30EYeRj17xGhaB", "userId": "KoUfiHjGmCyPsKCJ"}]}' \
    > test.out 2>&1
eval_tap $? 207 'AdminRemoveRoleManagersV3' test.out

#- 208 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'Tv1ic9gvagF2cSuz' \
    --after 'tsJ5tj64gV7nmDk2' \
    --before '9mcjSuz9vbNStqPt' \
    --limit '87' \
    > test.out 2>&1
eval_tap $? 208 'AdminGetRoleMembersV3' test.out

#- 209 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId '2Tb7iYdmNZWosrsV' \
    --body '{"members": [{"displayName": "BPZ64j0HUONscofw", "namespace": "YLQcDvkaEIIPoJT8", "userId": "3zEGXmVBZLyrH9J7"}, {"displayName": "BoysmaORLkP5hc2F", "namespace": "h04JTsqDTynCewqJ", "userId": "ligLlRxOelKykICR"}, {"displayName": "xF6HtlER2txs4qrN", "namespace": "ARATn6KXOutlYBbL", "userId": "hL8KXx25FZfQIodV"}]}' \
    > test.out 2>&1
eval_tap $? 209 'AdminAddRoleMembersV3' test.out

#- 210 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'BqQsBpCJBIXLGYcw' \
    --body '{"members": [{"displayName": "WVRK6UKk5ozrXA4H", "namespace": "ZHNyq9odanhR1Zrm", "userId": "3thUvV87yfkycLSV"}, {"displayName": "dleSaAylsmLYe2ph", "namespace": "YOgT5kDTyPl3dKF7", "userId": "NXEjrJMki8jvc3P8"}, {"displayName": "Gwjg3IOH0SDHgYKq", "namespace": "xJiFJdrmj5vhzgsJ", "userId": "wex7wq8ZPlXNaUNg"}]}' \
    > test.out 2>&1
eval_tap $? 210 'AdminRemoveRoleMembersV3' test.out

#- 211 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'dY2vfJuje5cPnmGj' \
    --body '{"permissions": [{"action": 94, "resource": "N9AWtLK9TFgi9j2X", "schedAction": 80, "schedCron": "BPAp6EPb988NzxrD", "schedRange": ["KVpULjjiw3NeVG4D", "Ji9DaMrc0WFgKjE9", "45x2CPVYYG9WvoGm"]}, {"action": 54, "resource": "vTScdbKBsAyJMz4I", "schedAction": 77, "schedCron": "7gSGhnfuF4WZiQVI", "schedRange": ["CVpWd3UM08gMXhdf", "3juXW4JprIb3CJCA", "tvSG8Cfa9dzOJDGC"]}, {"action": 94, "resource": "ZEHxsDxeR6d7r1SQ", "schedAction": 46, "schedCron": "DzxBwqRJTzrHNZWU", "schedRange": ["sq5lQo2jy29EJigq", "YhyVhURx1yPeczRp", "dk0HATGylx2JG2KN"]}]}' \
    > test.out 2>&1
eval_tap $? 211 'AdminUpdateRolePermissionsV3' test.out

#- 212 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'GfhzfCTxxrsRRLee' \
    --body '{"permissions": [{"action": 94, "resource": "tHzoWGdYohxMp3uO", "schedAction": 87, "schedCron": "Vug2zkVf6KgpKOcn", "schedRange": ["3tMD9UT67bOwugFD", "a6wUQvehKqwCh86X", "mRkCEcfHDCdl59Wp"]}, {"action": 56, "resource": "A3tXGve6DdK6uvg8", "schedAction": 11, "schedCron": "Np129hzBw3xLUcCE", "schedRange": ["t0DzmkJq1sml5bYt", "76BNsi4giR9434Wp", "KKdzxoufCNlFoOcW"]}, {"action": 88, "resource": "UBsnUfuQIcSbUt5U", "schedAction": 67, "schedCron": "wAk7ZQnbqY1cQwVE", "schedRange": ["tAr5kKKAo9MM2Cqm", "84jVi9kIpqgrzpUk", "NOBWydXV0Fi02aFr"]}]}' \
    > test.out 2>&1
eval_tap $? 212 'AdminAddRolePermissionsV3' test.out

#- 213 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId '8CDapjwNOl4k8rVN' \
    --body '["rm8drv8QD2JOe2Nt", "z7EFvowPgIGuetxF", "MqXCQMAqQ2ZRGzNt"]' \
    > test.out 2>&1
eval_tap $? 213 'AdminDeleteRolePermissionsV3' test.out

#- 214 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '35' \
    --resource 'jDNo4rhjxUdMM83W' \
    --roleId 'ekqfWv04vvn9bk5q' \
    > test.out 2>&1
eval_tap $? 214 'AdminDeleteRolePermissionV3' test.out

#- 215 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 215 'AdminGetMyUserV3' test.out

#- 216 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'r8qs2mqtnGAqXUjN' \
    --extendExp  \
    --redirectUri 'ypF6MMqWpdEJsPoa' \
    --password 'IbYz8cK5jlpJdre5' \
    --requestId 'ur6yvWJDdvM7T7PX' \
    --userName '2vamIRZHzsIYOCUo' \
    > test.out 2>&1
eval_tap $? 216 'UserAuthenticationV3' test.out

#- 217 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'iCXNjrdQL2jdx1eI' \
    --linkingToken 'ba1sB0HsJ06Dzfbz' \
    --password 'RYt4OVUyumBeIqdQ' \
    --username 'GZC5kM03HHijsQRj' \
    > test.out 2>&1
eval_tap $? 217 'AuthenticationWithPlatformLinkV3' test.out

#- 218 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData '7N8IAjmsonjj0ZR5' \
    --extendExp  \
    --linkingToken '0BQ1U6aFD3O2kXQS' \
    > test.out 2>&1
eval_tap $? 218 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 219 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'c58zgZVl4gIF7v3q' \
    > test.out 2>&1
eval_tap $? 219 'RequestOneTimeLinkingCodeV3' test.out

#- 220 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'bZu9M3OxqVAT4H1l' \
    > test.out 2>&1
eval_tap $? 220 'ValidateOneTimeLinkingCodeV3' test.out

#- 221 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'RZ9Z1JBrHRzEOtIx' \
    --isTransient  \
    --clientId 'zPqb6n73m0jiaDH8' \
    --oneTimeLinkCode '6d9rsKgzCsMulpB8' \
    > test.out 2>&1
eval_tap $? 221 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 222 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 222 'GetCountryLocationV3' test.out

#- 223 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 223 'Logout' test.out

#- 224 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'HZUtVVaJCiLgKOwr' \
    --codeChallengeMethod 'S256' \
    --clientId 'fWhT5B4WedopzwSl' \
    > test.out 2>&1
eval_tap $? 224 'RequestTokenExchangeCodeV3' test.out

#- 225 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uBtRFPKThyGnbjmP' \
    --userId 'DKFS6u9FHuv1M3qf' \
    > test.out 2>&1
eval_tap $? 225 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 226 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ch4SqIV6LQPHlaeY' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 226 'RevokeUserV3' test.out

#- 227 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'l4csFq65cU66yJaj' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'EPgG40QyXzsOzgck' \
    --redirectUri '078IghoQBp2mWAOY' \
    --scope 'ksczxBS0OBCa2vWa' \
    --state 'dLmQtYKmEMzicbuL' \
    --targetAuthPage '2S3RiW8dLTCBfGUd' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'VEdvdQL7sVwcZ2Po' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 227 'AuthorizeV3' test.out

#- 228 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'ykH4RpfmjIXFGZ5P' \
    > test.out 2>&1
eval_tap $? 228 'TokenIntrospectionV3' test.out

#- 229 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 229 'GetJWKSV3' test.out

#- 230 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'KdbabJIkNnt9P1Tk' \
    --factor 'm08luh4dpPRMDbUX' \
    --mfaToken 'BWTbpAogG2wlZkLh' \
    > test.out 2>&1
eval_tap $? 230 'SendMFAAuthenticationCode' test.out

#- 231 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'uU5FI8NijFI0GKwJ' \
    --mfaToken '3vfXlsAMy2Zp2UAG' \
    > test.out 2>&1
eval_tap $? 231 'Change2faMethod' test.out

#- 232 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'xHnmSxvkG9UR5q9n' \
    --factor 'eoW6JBcGp9Rx2Rfc' \
    --mfaToken 'RhXpmeeHdvphas9S' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 232 'Verify2faCode' test.out

#- 233 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '7ivHEoLbUMM47f1U' \
    --userId 'reUpxEkXIbE1ETzR' \
    > test.out 2>&1
eval_tap $? 233 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 234 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'JZKMavu4Ul2IaieE' \
    --clientId 'bPSE7TGkeHsYsW9o' \
    --redirectUri 'GBN1pYMBwbPZTlMl' \
    --requestId 'UvFEiGprcNSQ9kEe' \
    > test.out 2>&1
eval_tap $? 234 'AuthCodeRequestV3' test.out

#- 235 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'XBZ6FVrBzyhyhoS6' \
    --additionalData 'a9oe0JaXFpff28uY' \
    --clientId 'be4Cf2HEHvVevhIS' \
    --createHeadless  \
    --deviceId 'jbtBJUK5fE3OufPS' \
    --macAddress 'X3PdOU2V9yw94oa8' \
    --platformToken 'UJ34TIedV3HyoX4V' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 235 'PlatformTokenGrantV3' test.out

#- 236 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 236 'GetRevocationListV3' test.out

#- 237 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'nO2LpBU08wfnlHBX' \
    > test.out 2>&1
eval_tap $? 237 'TokenRevocationV3' test.out

#- 238 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'pspc' \
    --simultaneousTicket 'IqFUmgUSMM5au8GJ' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket '0mkVPI6zUtf3QaJP' \
    > test.out 2>&1
eval_tap $? 238 'SimultaneousLoginV3' test.out

#- 239 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'GrTNcXXTUIggoH89' \
    --clientId 'QNmI17UDb19R6H7r' \
    --code '1ta3m7jK5pxe82pg' \
    --codeVerifier 'FiAS6piIzmc8rKrK' \
    --extendNamespace 'EPGSAcong6eNERUf' \
    --extendExp  \
    --password '8kjci1Ctccv9Gv4t' \
    --redirectUri 'OcbnuCqf0lm6WBkI' \
    --refreshToken 'zjoSV31tvmMB6jzr' \
    --username 'pRGESmooHiCV4GUO' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 239 'TokenGrantV3' test.out

#- 240 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'gVY3YAxZLKbcOdyj' \
    > test.out 2>&1
eval_tap $? 240 'VerifyTokenV3' test.out

#- 241 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'qf6Q4oiwoJcaRMEb' \
    --code '15LBlTVufc5ZyODR' \
    --error '2NVyn4PRqf3eRbZq' \
    --openidAssocHandle 'BAoKGcVCdMiSNV4q' \
    --openidClaimedId 'Brt1kcLmRv6EJtl5' \
    --openidIdentity 'xWnsb8oWq94RImNW' \
    --openidMode 'VIJnhhwFDV1Vitao' \
    --openidNs 'mvWTzdsW4N70wYS4' \
    --openidOpEndpoint 'Kj7Yi2VvoQNW8Yc4' \
    --openidResponseNonce '81dYdvGxJAMDRA1L' \
    --openidReturnTo 'F7jdWlekFwO94VBC' \
    --openidSig 'V9qJhWva2FPBujX0' \
    --openidSigned 'geYCpGJM4sqsPNJM' \
    --state 'iZXXOFwmGWAvNF0Z' \
    > test.out 2>&1
eval_tap $? 241 'PlatformAuthenticationV3' test.out

#- 242 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId '0GkwxUNYyNwGiKrk' \
    --platformToken 'nH0Y5mrQgLC6D2qs' \
    > test.out 2>&1
eval_tap $? 242 'PlatformTokenRefreshV3' test.out

#- 243 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'FiQHglUQMZi5WjMZ' \
    > test.out 2>&1
eval_tap $? 243 'PublicGetInputValidations' test.out

#- 244 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'fOadpgegCUjTdi1E' \
    > test.out 2>&1
eval_tap $? 244 'PublicGetInputValidationByField' test.out

#- 245 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'hr8OtqpNJ9R8TuNy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 245 'PublicGetCountryAgeRestrictionV3' test.out

#- 246 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey '4ejmVA3vMCsGyPd1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 246 'PublicGetConfigValueV3' test.out

#- 247 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 247 'PublicGetCountryListV3' test.out

#- 248 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 248 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 249 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId '2B8QNUz0hFFNbH6j' \
    > test.out 2>&1
eval_tap $? 249 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 250 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2W4roZM2UKAXEEsL' \
    --rawPID  \
    --body '{"platformUserIds": ["5D0oiFchQnVeq3g2", "AB2WIRUQmauIY5HX", "CZ0W4XmWP0HzSdiy"]}' \
    > test.out 2>&1
eval_tap $? 250 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 251 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lLhVYszm8xY33OQb' \
    --platformUserId 'umu2QHLyZNuysyM4' \
    > test.out 2>&1
eval_tap $? 251 'PublicGetUserByPlatformUserIDV3' test.out

#- 252 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'OfCzdQCXMAWnf87Y' \
    > test.out 2>&1
eval_tap $? 252 'PublicGetAsyncStatus' test.out

#- 253 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'PNOe9Eevf1fhMg1E' \
    --limit '74' \
    --offset '21' \
    --platformBy 'jxvNZhM84DiZk6yS' \
    --platformId 'rB9SVFctW7YS0OkL' \
    --query '78XeEAtALFI3v8yh' \
    > test.out 2>&1
eval_tap $? 253 'PublicSearchUserV3' test.out

#- 254 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "a4pd5A7MYcpBD6lK", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "b8RxvN2u5J7baOeL", "policyId": "H19fqBwNbNe1ffYR", "policyVersionId": "tIvQaKyevWYtZjK6"}, {"isAccepted": true, "localizedPolicyVersionId": "9v8MpBSpo3AKRmnJ", "policyId": "kzJHAckUyBksYQfD", "policyVersionId": "m0RNFwiz70tRVLMl"}, {"isAccepted": true, "localizedPolicyVersionId": "i8i9gOVqajUWrgEs", "policyId": "WDtaKzn8dZwnnGeZ", "policyVersionId": "sZVgbPzPFbrOMZMg"}], "authType": "WkFN7Tpkx6GcfyOg", "code": "6ZUrrp9ubg9mndW2", "country": "JKmQafUs2bxYztOE", "dateOfBirth": "yVbKIf1ZbzgUwd8D", "displayName": "HoCQykmXHYmkRlg7", "emailAddress": "gYs6unPYQ9jNQN1d", "password": "i1ldhOh6HvjnYuV7", "reachMinimumAge": false, "uniqueDisplayName": "gOssFkz0F36piDYX"}' \
    > test.out 2>&1
eval_tap $? 254 'PublicCreateUserV3' test.out

#- 255 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'eHZ7FHls3nyvconq' \
    --query 'bHQqKLQKe3xmj6s0' \
    > test.out 2>&1
eval_tap $? 255 'CheckUserAvailability' test.out

#- 256 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["GqsWncp5LrqbiKud", "v9z75SzoCV8ZMi2o", "1nR482D6gNClk9c8"]}' \
    > test.out 2>&1
eval_tap $? 256 'PublicBulkGetUsers' test.out

#- 257 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "7hosaPFC5zBW3ZgV", "languageTag": "ZCj9ObVGT0Scwl4k"}' \
    > test.out 2>&1
eval_tap $? 257 'PublicSendRegistrationCode' test.out

#- 258 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "NmCi15XTJTgCNNH7", "emailAddress": "RtG5Xmo9Q0Wb07N1"}' \
    > test.out 2>&1
eval_tap $? 258 'PublicVerifyRegistrationCode' test.out

#- 259 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "7fkxZSc6VbE0AGce", "languageTag": "kjMNHuPXtz8tXxrm"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicForgotPasswordV3' test.out

#- 260 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'zafMUguyDoN91uc2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 260 'GetAdminInvitationV3' test.out

#- 261 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId '8HoSpGt1g0GGbT4H' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "f2PPKOldkbgX9CWJ", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "IzNmhJTNQjKlwjfJ", "policyId": "3TJ2xVpge70WsLfg", "policyVersionId": "bZieRvJI5sT9DH3D"}, {"isAccepted": false, "localizedPolicyVersionId": "LzbrddqcKLa7Levx", "policyId": "NHOSEhQRZIp693lR", "policyVersionId": "wtc43atCuCFxbfbz"}, {"isAccepted": false, "localizedPolicyVersionId": "aQERziPL4dHhOqG5", "policyId": "KDdUvk0LEi26Ls7m", "policyVersionId": "jRxNmvvNtjJNQepU"}], "authType": "TGhwlY4lPzlsCR5r", "code": "VsyfcH7WjP7HuGz3", "country": "b5WAEvdRF9bqMj4r", "dateOfBirth": "o5B19VE838c7OydV", "displayName": "w0zCqoMZvpIOO97D", "emailAddress": "mQ5ZOzx6iCJTu60I", "password": "ifzMhkk5PxsjqbCK", "reachMinimumAge": false, "uniqueDisplayName": "PUWipz9C05YabFX4"}' \
    > test.out 2>&1
eval_tap $? 261 'CreateUserFromInvitationV3' test.out

#- 262 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "FCK5ucTFsAFzaO3y", "country": "JpA3KMxBlrRytER1", "dateOfBirth": "qdTelFAadM9y66Dr", "displayName": "f4SSGGt3MiBKohow", "languageTag": "3kKoaP1K4CDuH1mM", "uniqueDisplayName": "IfOCDyVAHrHncR5d", "userName": "ShqiBUI9esSsXegS"}' \
    > test.out 2>&1
eval_tap $? 262 'UpdateUserV3' test.out

#- 263 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "EhrPpK2q8kxR4BuE", "country": "ksS2A9VOA8H9VeHv", "dateOfBirth": "0L2Acm960EYQEuGJ", "displayName": "Vl8xs1WId9Wlalqs", "languageTag": "hF9Rh2o7GCQGPCxw", "uniqueDisplayName": "EdkyuT3MgzReRq01", "userName": "12ISArROIodcmM6v"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicPartialUpdateUserV3' test.out

#- 264 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "2AEozWWaYvBLE46b", "emailAddress": "puJip8JyxJ39vrtu", "languageTag": "WWrqTZbSqBSKp8Am"}' \
    > test.out 2>&1
eval_tap $? 264 'PublicSendVerificationCodeV3' test.out

#- 265 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "gwhYzk33J34fiTxK", "contactType": "63OHpnUCGBVfpctN", "languageTag": "FUsUQ6ZXQcb2o1J5", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 265 'PublicUserVerificationV3' test.out

#- 266 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "b9e7vXZV3ig8Jg5V", "country": "ByeI3ycMcYYBixKJ", "dateOfBirth": "XCISQdwec1m8BusV", "displayName": "9tUh74KVo6Xqjz2x", "emailAddress": "UKLNWSmYyVvyelIJ", "password": "8QgaLMqi836ULa7c", "uniqueDisplayName": "fZl4VuY6rsZyo6CB", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 266 'PublicUpgradeHeadlessAccountV3' test.out

#- 267 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "RnoOikIxXKKIR6kP", "password": "mswm5TCAU1cKApdJ"}' \
    > test.out 2>&1
eval_tap $? 267 'PublicVerifyHeadlessAccountV3' test.out

#- 268 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "DnE73GLmSZns5owB", "newPassword": "hoUg4LsGP6KLPXkv", "oldPassword": "Uv2XiXaBzsmaxjTZ"}' \
    > test.out 2>&1
eval_tap $? 268 'PublicUpdatePasswordV3' test.out

#- 269 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'PlLitytGka7Kv5Ta' \
    > test.out 2>&1
eval_tap $? 269 'PublicCreateJusticeUser' test.out

#- 270 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'cQKF4OlRGdmXxETL' \
    --redirectUri 'EQrr3KCAV9alq3hK' \
    --ticket '1G4kKooSNNUZuiyn' \
    > test.out 2>&1
eval_tap $? 270 'PublicPlatformLinkV3' test.out

#- 271 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Z64IwncZPk82GF3e' \
    --body '{"platformNamespace": "TC0vzZUDj9dzGgGV"}' \
    > test.out 2>&1
eval_tap $? 271 'PublicPlatformUnlinkV3' test.out

#- 272 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xo9OHgfHumyfuBNi' \
    > test.out 2>&1
eval_tap $? 272 'PublicPlatformUnlinkAllV3' test.out

#- 273 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'secYbcOpR45VDlvS' \
    --ticket 'c0Mr7ImwCwGqOf0b' \
    > test.out 2>&1
eval_tap $? 273 'PublicForcePlatformLinkV3' test.out

#- 274 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ns97KvKyj3MqS7Dc' \
    --clientId 'mtfh50eObbrmgjhW' \
    --redirectUri 'K0x0ZidAJ1CU1eD1' \
    > test.out 2>&1
eval_tap $? 274 'PublicWebLinkPlatform' test.out

#- 275 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'La16Bw3JbUnUDh5y' \
    --code 'Gjjv4Mwrv2vancmR' \
    --state '6Z7rb21A2E9pX0BW' \
    > test.out 2>&1
eval_tap $? 275 'PublicWebLinkPlatformEstablish' test.out

#- 276 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CMqPsRk5htdM5T3f' \
    --code 'DSrSHrkoqv2mM6so' \
    --state 'MaTvQq2a9YdFNtRV' \
    > test.out 2>&1
eval_tap $? 276 'PublicProcessWebLinkPlatformV3' test.out

#- 277 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "SO0js0hG9xmSnzd7", "userIds": ["zgUxAogcnGkXk17Q", "PkJHRhmLKQuQVFSK", "iXl8G2uf6E8EajXL"]}' \
    > test.out 2>&1
eval_tap $? 277 'PublicGetUsersPlatformInfosV3' test.out

#- 278 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "SAS8MKMaxQ1QyJCp", "emailAddress": "KedhuzI7G9NCKKXu", "newPassword": "1bqI2M5PmXfKnQ7B"}' \
    > test.out 2>&1
eval_tap $? 278 'ResetPasswordV3' test.out

#- 279 PublicGetUserByUserIdV3
eval_tap 0 279 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 280 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YGjCUDMOrbmoRvWn' \
    --activeOnly  \
    --after 'fmGFy0eUoOBd90h9' \
    --before 'EDqSTOfoNewWjwMW' \
    --limit '61' \
    > test.out 2>&1
eval_tap $? 280 'PublicGetUserBanHistoryV3' test.out

#- 281 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rPye7fCwi7Il2wIF' \
    > test.out 2>&1
eval_tap $? 281 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 282 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lHm9N6owMHMtJy1O' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetUserInformationV3' test.out

#- 283 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qn59tEGm9NYeUT5P' \
    --after '0.8454266179275658' \
    --before '0.21825671545046466' \
    --limit '49' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetUserLoginHistoriesV3' test.out

#- 284 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VUGgGHkapTCafFMd' \
    --after 'vYiCBuzUUwyI6Vtd' \
    --before '4v9k4fv3kMiuQ3Dh' \
    --limit '38' \
    --platformId 'FjLKFrepy56eW1km' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetUserPlatformAccountsV3' test.out

#- 285 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'b15QeIQF51c4MqJz' \
    > test.out 2>&1
eval_tap $? 285 'PublicListJusticePlatformAccountsV3' test.out

#- 286 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'DSvELgBe6dboSdhk' \
    --body '{"platformId": "BzAzPkt1efGJeJax", "platformUserId": "yHYutgXucx85vHA0"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicLinkPlatformAccount' test.out

#- 287 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '09FAb21jxeWXk80y' \
    --body '{"chosenNamespaces": ["9uxgVLGgK8aVSCN6", "oCETQ8gIDRdD2wwM", "XwKVXGPhEJsc7rZp"], "requestId": "xaPHc9r8eToFmkHJ"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicForceLinkPlatformWithProgression' test.out

#- 288 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6BPOKFLxIwKssw64' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetPublisherUserV3' test.out

#- 289 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7YwDudnGRufOUGfM' \
    --password 'jTU226l07jPlcYaq' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 290 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'YM7YfBmhjI9Y28qV' \
    --before 'ceS9UX48dKPCFUIe' \
    --isWildcard  \
    --limit '51' \
    > test.out 2>&1
eval_tap $? 290 'PublicGetRolesV3' test.out

#- 291 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'IjS4i0N9ytb3c8pV' \
    > test.out 2>&1
eval_tap $? 291 'PublicGetRoleV3' test.out

#- 292 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 292 'PublicGetMyUserV3' test.out

#- 293 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'Z8GlU8962e6gtn5p' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 294 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["UARJM1T8QwMNOAzX", "myHEV4g9P6a280S5", "RNB5dVCsB7xL4axS"], "oneTimeLinkCode": "PgPCiwLxCFLDixZw"}' \
    > test.out 2>&1
eval_tap $? 294 'LinkHeadlessAccountToMyAccountV3' test.out

#- 295 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "Vtt3RVTl0tR00oQg"}' \
    > test.out 2>&1
eval_tap $? 295 'PublicSendVerificationLinkV3' test.out

#- 296 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'cHdGGK3x76U1EIck' \
    > test.out 2>&1
eval_tap $? 296 'PublicVerifyUserByLinkV3' test.out

#- 297 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'lttmrpgF5szl0sMY' \
    --code '8es36r1FgR70eNLH' \
    --error 'kVrEFd8xArWJuCAI' \
    --state 'fNBSHgpFNw9K9pmA' \
    > test.out 2>&1
eval_tap $? 297 'PlatformAuthenticateSAMLV3Handler' test.out

#- 298 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'Ic6VSfE9nbE2PMv1' \
    --payload '2ZSRJkujxbCu1HFa' \
    > test.out 2>&1
eval_tap $? 298 'LoginSSOClient' test.out

#- 299 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'j6Vxs3GuA4S1dS7H' \
    > test.out 2>&1
eval_tap $? 299 'LogoutSSOClient' test.out

#- 300 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData '7yIS7b5TSDRIoMg7' \
    --code 'Dc5APzfzXDELJFaI' \
    > test.out 2>&1
eval_tap $? 300 'RequestTargetTokenResponseV3' test.out

#- 301 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aEMW5bhJyL72WDyh' \
    > test.out 2>&1
eval_tap $? 301 'AdminGetDevicesByUserV4' test.out

#- 302 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'BsCCbnfihnXKxGxa' \
    --endDate 'upnTTq9ihZkvFKfS' \
    --limit '68' \
    --offset '65' \
    --startDate 'Qh8I9xk3sFl0cbuC' \
    > test.out 2>&1
eval_tap $? 302 'AdminGetBannedDevicesV4' test.out

#- 303 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RM69XKkLwioRaKnW' \
    > test.out 2>&1
eval_tap $? 303 'AdminGetUserDeviceBansV4' test.out

#- 304 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "hlh80BhYe2fJDS6T", "deviceId": "75Q4ulonMFjmYqE1", "deviceType": "wJhfogWg2Apm0sUy", "enabled": false, "endDate": "8aWn65Co0vdCk8so", "ext": {"6JSaZAIadKDEZywo": {}, "nA2SrEdN2tmGuX6r": {}, "0gBVUUeKKlPKtE6g": {}}, "reason": "nYxmkmCWbs5qugkl"}' \
    > test.out 2>&1
eval_tap $? 304 'AdminBanDeviceV4' test.out

#- 305 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'BUS6uwWrCQt86Jrg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 305 'AdminGetDeviceBanV4' test.out

#- 306 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId '8tLAJWpcyNkUvqn6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 306 'AdminUpdateDeviceBanV4' test.out

#- 307 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'Qk2vQTYX1xsth28N' \
    --startDate 'ZZgsXycuQNGIDeHl' \
    --deviceType 'f6IcX1K9JrK6Or2x' \
    > test.out 2>&1
eval_tap $? 307 'AdminGenerateReportV4' test.out

#- 308 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 308 'AdminGetDeviceTypesV4' test.out

#- 309 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'x7rLwrPoWiywnxuD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 309 'AdminGetDeviceBansV4' test.out

#- 310 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'LLuIaSxoloIH1gBC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 310 'AdminDecryptDeviceV4' test.out

#- 311 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'WVFrvls0ZwosKhDl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 311 'AdminUnbanDeviceV4' test.out

#- 312 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'LfTKxpVOXvGSrdkq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 312 'AdminGetUsersByDeviceV4' test.out

#- 313 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 6}' \
    > test.out 2>&1
eval_tap $? 313 'AdminCreateTestUsersV4' test.out

#- 314 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "i6dO3zkbDseh4tJd", "policyId": "oGcwMBmegqVUaWMJ", "policyVersionId": "BjrV0p9A7tcHrV0M"}, {"isAccepted": false, "localizedPolicyVersionId": "CSoqHvH7g63cOx6y", "policyId": "rIw37pKOLrF5i3gr", "policyVersionId": "3Cc4M2O7NrTQO7KL"}, {"isAccepted": false, "localizedPolicyVersionId": "ckWogE5gcfF8AMGZ", "policyId": "2FBS93Mg6TKwdRMr", "policyVersionId": "aDLrwh3d0ykRGkgq"}], "authType": "EMAILPASSWD", "code": "NIbJMJ9ABbKVWO2Y", "country": "EDiqkwKbpdk7wlDn", "dateOfBirth": "gNiPPjpSAlZwFGpe", "displayName": "a5ObBB49Km4ClIQm", "emailAddress": "kIdLCvNhZ6P8aqZ2", "password": "yfrC1V7ZpJZPHCMq", "passwordMD5Sum": "vcYmeDLYEzs2SQUd", "reachMinimumAge": true, "uniqueDisplayName": "S6jYI9lsQFD43Df5", "username": "qUZOFzpFd6b5Jc5T"}' \
    > test.out 2>&1
eval_tap $? 314 'AdminCreateUserV4' test.out

#- 315 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["PLzynjFZgF3erw7U", "syHq4bBb0n1JhPUS", "8BRPGV9n769zLJdK"]}' \
    > test.out 2>&1
eval_tap $? 315 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 316 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["MexeJc7NvgTSgKjC", "xZjKf8NA4cGUaDfy", "9XnH2r0EKrk5VlnK"]}' \
    > test.out 2>&1
eval_tap $? 316 'AdminBulkCheckValidUserIDV4' test.out

#- 317 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sWCPccAFn5CEPoH6' \
    --body '{"avatarUrl": "opK5DSO8JyX4IE1z", "country": "3rDwZ1HKsOpyq8ag", "dateOfBirth": "Quz86nc6jLF9DIW2", "displayName": "ncJJKpqmgvUTr8XA", "languageTag": "tpOqUQxzqJZiWi3K", "skipLoginQueue": false, "uniqueDisplayName": "rt2t6bVpCgKvPXSD", "userName": "ufmKh783cV54JsVB"}' \
    > test.out 2>&1
eval_tap $? 317 'AdminUpdateUserV4' test.out

#- 318 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RB0rY0xfWddACyHS' \
    --body '{"code": "mo4KX9TPO3K1k5ZM", "emailAddress": "8btmGsgXNXbpqxh7"}' \
    > test.out 2>&1
eval_tap $? 318 'AdminUpdateUserEmailAddressV4' test.out

#- 319 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '6Af5JSwjw2fE2g6j' \
    > test.out 2>&1
eval_tap $? 319 'AdminDisableUserMFAV4' test.out

#- 320 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XV7oai2oDm9FaP0H' \
    > test.out 2>&1
eval_tap $? 320 'AdminListUserRolesV4' test.out

#- 321 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'J98tE4UyoQg0b0sG' \
    --body '{"assignedNamespaces": ["OkzxVt15LKmkQ7YB", "hsOuJ0ypkkt2G4eF", "h2YNsdoxpLTBM9Q8"], "roleId": "t829Ido1JyveSRiB"}' \
    > test.out 2>&1
eval_tap $? 321 'AdminUpdateUserRoleV4' test.out

#- 322 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'q23kyH9jQbHWkcVk' \
    --body '{"assignedNamespaces": ["0X28GS54vl7gIKBc", "7OYTylFRAJKySnC0", "cfPl3Z2zSBbs4PAV"], "roleId": "72u8AxE2IQeoxYV4"}' \
    > test.out 2>&1
eval_tap $? 322 'AdminAddUserRoleV4' test.out

#- 323 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UcYzswAGpXqQxctu' \
    --body '{"assignedNamespaces": ["VaqPJGAHEZmuQrZ8", "GaQ4OZ2nDodm4TNs", "8mAj6IKSYFdJwgZs"], "roleId": "RPOzwuDSdGl1A2va"}' \
    > test.out 2>&1
eval_tap $? 323 'AdminRemoveUserRoleV4' test.out

#- 324 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '82' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 324 'AdminGetRolesV4' test.out

#- 325 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "th24cZBpdDFfvzeU"}' \
    > test.out 2>&1
eval_tap $? 325 'AdminCreateRoleV4' test.out

#- 326 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId '5iqhx6zv7EURTNIo' \
    > test.out 2>&1
eval_tap $? 326 'AdminGetRoleV4' test.out

#- 327 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'G1DBdoKH6sREmmfw' \
    > test.out 2>&1
eval_tap $? 327 'AdminDeleteRoleV4' test.out

#- 328 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'UZLZZS7snx0Q2Gd8' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "3wiNloJfey3HXL6S"}' \
    > test.out 2>&1
eval_tap $? 328 'AdminUpdateRoleV4' test.out

#- 329 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'jljNPTXA3qbg55Sy' \
    --body '{"permissions": [{"action": 17, "resource": "kBtXMU6KRIm5xBoI", "schedAction": 17, "schedCron": "gBFzG8tlkxWKCU1X", "schedRange": ["N4gl7yHvEqpJSrDX", "VwCkhOQ161TFjROY", "Jm75VIuCOCkt2W1D"]}, {"action": 11, "resource": "23WWn2ZJY3QvRa7C", "schedAction": 61, "schedCron": "CPn1FylWdaNV1VaZ", "schedRange": ["TkbbuWiiA4UTDgS2", "SVEo5M80LLbku9GY", "H4ijqOVM50tCqkZf"]}, {"action": 37, "resource": "THcmgXsrVj3Mjml6", "schedAction": 57, "schedCron": "EosOXglQwwdeLVpm", "schedRange": ["XqRwVjc3W2ANmE3V", "VsQ1fm9EUdiaRjuL", "sKZoqnpKwhpZVdw5"]}]}' \
    > test.out 2>&1
eval_tap $? 329 'AdminUpdateRolePermissionsV4' test.out

#- 330 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'UMa8ymxtEFLwELCY' \
    --body '{"permissions": [{"action": 15, "resource": "vIddlxnA1VynioJc", "schedAction": 55, "schedCron": "npUDqvLQixPKVSmW", "schedRange": ["a8TGko16XTqHc0cM", "7ixq8Tjnxp5Cl8gg", "aEmCcuK2hHviBEWp"]}, {"action": 3, "resource": "tvUfVwLahtRedh1S", "schedAction": 17, "schedCron": "77y88rUFum2ZcA8i", "schedRange": ["KcF0bkfjcTEFXcTw", "EtnHxP5pVtN4jNVI", "druEA39uCJzsE8WO"]}, {"action": 3, "resource": "kfCjUK8GeX4Q0B2C", "schedAction": 18, "schedCron": "4IqWK09l4wkrzahX", "schedRange": ["R1sDEDVKDINE3HjC", "iVR1dQ8kuhb4pUwn", "GptHUplxzaDa9PDw"]}]}' \
    > test.out 2>&1
eval_tap $? 330 'AdminAddRolePermissionsV4' test.out

#- 331 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'hu31d8eOdtrfq6EC' \
    --body '["DD6OGkuLs9gNpNon", "6DKW9A6AmnQTNFid", "ImWONTvCPMGLdbYE"]' \
    > test.out 2>&1
eval_tap $? 331 'AdminDeleteRolePermissionsV4' test.out

#- 332 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'knHPKrZ7TiNBE0HR' \
    --after 'sE0GHDOFjrfqJcyx' \
    --before 'T2a7fCFAUzLELiM5' \
    --limit '82' \
    > test.out 2>&1
eval_tap $? 332 'AdminListAssignedUsersV4' test.out

#- 333 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId '3TdtWjfVciuLnLsB' \
    --body '{"assignedNamespaces": ["KGsALPuCOyphUUAV", "95708zaP0wpZgQEv", "Fzox9wHocX3DRWob"], "namespace": "EoGr8W97KBedcr6P", "userId": "M51z7i0wQ9egK2t4"}' \
    > test.out 2>&1
eval_tap $? 333 'AdminAssignUserToRoleV4' test.out

#- 334 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId '6EG8I2lTviKbOgVu' \
    --body '{"namespace": "N3nhkn6QIesNoYqv", "userId": "VsakylHikKkpOjqw"}' \
    > test.out 2>&1
eval_tap $? 334 'AdminRevokeUserFromRoleV4' test.out

#- 335 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["gKvfXXs8pDqm31AZ", "SRkuw6q8FgqG46Rs", "FK7eYlSU3vYcHZZj"], "emailAddresses": ["FegVnZOn0tk4IATS", "IefcqNEn4IZ0Dv6b", "8WtaMVvLbG04KKnh"], "isAdmin": false, "isNewStudio": false, "namespace": "FAGbMtEybfcAl0mn", "roleId": "sAkRT2k0AzdgIunR"}' \
    > test.out 2>&1
eval_tap $? 335 'AdminInviteUserNewV4' test.out

#- 336 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "kTxsGdrpNELM8Lfk", "country": "ut0wnT24wh59RGSb", "dateOfBirth": "BMh7jpszuVk6iPdJ", "displayName": "2boQqCCyJfThvCJi", "languageTag": "eqRSGN8Mm74HlSZz", "skipLoginQueue": true, "uniqueDisplayName": "knxyWkZObuvig8sM", "userName": "uss76ezTrsDZNYUV"}' \
    > test.out 2>&1
eval_tap $? 336 'AdminUpdateMyUserV4' test.out

#- 337 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 337 'AdminDisableMyAuthenticatorV4' test.out

#- 338 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '48Oh6I45X7HvUtPY' \
    > test.out 2>&1
eval_tap $? 338 'AdminEnableMyAuthenticatorV4' test.out

#- 339 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 339 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 340 AdminGetMyBackupCodesV4
eval_tap 0 340 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 341 AdminGenerateMyBackupCodesV4
eval_tap 0 341 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 342 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 342 'AdminDisableMyBackupCodesV4' test.out

#- 343 AdminDownloadMyBackupCodesV4
eval_tap 0 343 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 344 AdminEnableMyBackupCodesV4
eval_tap 0 344 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 345 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 345 'AdminGetBackupCodesV4' test.out

#- 346 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 346 'AdminGenerateBackupCodesV4' test.out

#- 347 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 347 'AdminEnableBackupCodesV4' test.out

#- 348 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 348 'AdminSendMyMFAEmailCodeV4' test.out

#- 349 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 349 'AdminDisableMyEmailV4' test.out

#- 350 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'ONZdFk75lkjQNHrj' \
    > test.out 2>&1
eval_tap $? 350 'AdminEnableMyEmailV4' test.out

#- 351 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 351 'AdminGetMyEnabledFactorsV4' test.out

#- 352 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'aboGomguUqeuZh5q' \
    > test.out 2>&1
eval_tap $? 352 'AdminMakeFactorMyDefaultV4' test.out

#- 353 AdminInviteUserV4
eval_tap 0 353 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 354 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'trRbNnGejdTGvZgN' \
    --linkingToken '5hshSe5YmZXKEQLk' \
    --password 'M6o3eGSP4Htmr90T' \
    --username 'qGf0OyqJ9ibJMmRg' \
    > test.out 2>&1
eval_tap $? 354 'AuthenticationWithPlatformLinkV4' test.out

#- 355 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'oxNwp1lGkYoq8HP1' \
    --extendExp  \
    --linkingToken 'TM0tefVQPWX1NPO5' \
    > test.out 2>&1
eval_tap $? 355 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 356 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'Wn7rNG8rGp7Fadvo' \
    --factor '5EzpX0IttsRezyY9' \
    --mfaToken 'GB5sf94ALBmvdncQ' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 356 'Verify2faCodeV4' test.out

#- 357 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'kcZb8cWdVH9bww15' \
    --codeChallenge 'zZsaYrJAe5Kd5QB9' \
    --codeChallengeMethod 'plain' \
    --additionalData 'ndlO6iPGC9RhzMC7' \
    --clientId 'V8BEphnRXnSpCzyb' \
    --createHeadless  \
    --deviceId '8FkoxQbrPngi87K5' \
    --macAddress '8pQswqKLutINusOs' \
    --platformToken 'a92F6iwkJIYOLarm' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 357 'PlatformTokenGrantV4' test.out

#- 358 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'pWyvib9CDW21ANrl' \
    --codeChallengeMethod 'S256' \
    --simultaneousPlatform 'pspc' \
    --simultaneousTicket 'uXD9H1u1CvzWPcZw' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 't6foPPH94SUinY5d' \
    > test.out 2>&1
eval_tap $? 358 'SimultaneousLoginV4' test.out

#- 359 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'iUlqgvY7dPPyahpp' \
    --codeChallengeMethod 'S256' \
    --additionalData 'wJTNL2UCWUtaAD7Z' \
    --clientId 'Zx1iefATWcDSqGYR' \
    --code 'Mdz07xEJ40epssgJ' \
    --codeVerifier 'JC3CX0hpB1ZGMMo5' \
    --extendNamespace 'DSozCuFsrBMtoOeL' \
    --extendExp  \
    --loginQueueTicket 'fMCYxSeeJOlxa395' \
    --password 'rghZwGhdZJkkGhYv' \
    --redirectUri 'XYMIyaEMEqOpwetb' \
    --refreshToken '82b96rsH73hRfDgl' \
    --username '29GWKpItMt4GszRu' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 359 'TokenGrantV4' test.out

#- 360 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'kvSs5YmIejozmG5H' \
    --code 'lrIfMAvvpkAHRJHZ' \
    > test.out 2>&1
eval_tap $? 360 'RequestTargetTokenResponseV4' test.out

#- 361 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "C6HSMQ32UznXNd6v", "policyId": "e29lqqtcLJW9eTJv", "policyVersionId": "KNDFrx6LabyDnqXj"}, {"isAccepted": true, "localizedPolicyVersionId": "cxh0x7T6RQGnnW4u", "policyId": "gGX6mKBbgTD9xL07", "policyVersionId": "ZzzIs3Jke34ZAUuL"}, {"isAccepted": false, "localizedPolicyVersionId": "VDYBd6hMB0l7sg7I", "policyId": "fMH5Tu1ky1ZYvyeH", "policyVersionId": "mfoFkUDP864shbnQ"}], "authType": "EMAILPASSWD", "country": "oICxQMit8555Niy4", "dateOfBirth": "NNFpRE5pS85yTIRW", "displayName": "vLRy58UKWPv3F7S0", "emailAddress": "wCVlYQi9cfMCeNnu", "password": "6OIG1PPLRDEXLXZW", "passwordMD5Sum": "XvqNCHvNpeMjMzgu", "uniqueDisplayName": "q6HFIqaqwH9J6JLb", "username": "5f3SBMyJUdwEBRrH", "verified": true}' \
    > test.out 2>&1
eval_tap $? 361 'PublicCreateTestUserV4' test.out

#- 362 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "UFqTooGGnPEgY0t7", "policyId": "QQWl42byOwXgKyPh", "policyVersionId": "Xmcysae8HpWH4xiz"}, {"isAccepted": false, "localizedPolicyVersionId": "fWthJSu2pUIIuPLF", "policyId": "AtcWhjAP57QbWvSS", "policyVersionId": "p71zEPPfmAQiqRRC"}, {"isAccepted": false, "localizedPolicyVersionId": "HLwZGikW7TFA9gE6", "policyId": "SrYKq6lcVOhPJIcE", "policyVersionId": "HbiKHW7flVolAWEM"}], "authType": "EMAILPASSWD", "code": "3Wd0Wrb8s3GW0CY0", "country": "vAfbq8xoCurq4lpH", "dateOfBirth": "XrbVBh60NUA2aKQw", "displayName": "nXrmi6ya8u4sQPva", "emailAddress": "f1AcweR7tJW3MLMo", "password": "b1hUnIzIpUM8KK1k", "passwordMD5Sum": "GFN0NUNGKxdlAUDF", "reachMinimumAge": true, "uniqueDisplayName": "uGPzAuT7M6OBrNwi", "username": "oKnXPVZaDcXsV1Tn"}' \
    > test.out 2>&1
eval_tap $? 362 'PublicCreateUserV4' test.out

#- 363 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'sZioDiBgprzahPB0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "a0YeyNBQWUHDBnBe", "policyId": "ePkqg6Zt1Lr5BlO8", "policyVersionId": "K6LH4dSaa8XYHug5"}, {"isAccepted": true, "localizedPolicyVersionId": "ZTogG0N7Hvnuq1kJ", "policyId": "1kpHcQtnIc9z70LF", "policyVersionId": "QMI0oZuEjY0rNBbb"}, {"isAccepted": true, "localizedPolicyVersionId": "cyzTMBY7Xd0OoENg", "policyId": "2Lw7uepmahXojVZY", "policyVersionId": "z2zMU9jLzNV3GaG4"}], "authType": "EMAILPASSWD", "code": "6nlRPrEAYqRBeSc5", "country": "uShoj3dGHMeoi5DB", "dateOfBirth": "OsQ0Gax0iX05IT9A", "displayName": "gsjl5NmnSHhxNmCe", "emailAddress": "4txY0MsPc9EMgf9J", "password": "CJiEvhL8ZfwCVJW9", "passwordMD5Sum": "yspUOyHC9eKeXzrv", "reachMinimumAge": true, "uniqueDisplayName": "zx9aGEI22BTCZs97", "username": "TJI8GPrM24F3celF"}' \
    > test.out 2>&1
eval_tap $? 363 'CreateUserFromInvitationV4' test.out

#- 364 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "gM62HQtgzQhO3nR8", "country": "j8DlP6OGbn8vmfMY", "dateOfBirth": "GLt1AjKhh3JMX7xS", "displayName": "rz1EH6X2SM3xzsNr", "languageTag": "JzWBcdFlo7oAsOlf", "uniqueDisplayName": "LB1J19b5rTfiL2P3", "userName": "r1a8KIJH33aKkPuW"}' \
    > test.out 2>&1
eval_tap $? 364 'PublicUpdateUserV4' test.out

#- 365 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "D59MgTy1HA58Jt5N", "emailAddress": "aROjSKFEuZo2ElXY"}' \
    > test.out 2>&1
eval_tap $? 365 'PublicUpdateUserEmailAddressV4' test.out

#- 366 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "SS4ezBRSiOyReviD", "country": "axlPdhwmcH03yoMx", "dateOfBirth": "zRR6xd9rTh3ureaI", "displayName": "bxM3Wev9pZQjWAN0", "emailAddress": "tny16ZHZtuSJGQCr", "password": "M7JEMRPkdTcAzkIl", "reachMinimumAge": false, "uniqueDisplayName": "N0f3JA27Qz5SjzQf", "username": "OLYu9O46OOzz9p57", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 366 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 367 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "QIhoJRY807VmBT4w", "password": "ZXQZZrSsuYiIPei0", "username": "pXglJYnKkoCAZuol"}' \
    > test.out 2>&1
eval_tap $? 367 'PublicUpgradeHeadlessAccountV4' test.out

#- 368 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 368 'PublicDisableMyAuthenticatorV4' test.out

#- 369 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'AWnxkImVbDP0QX31' \
    > test.out 2>&1
eval_tap $? 369 'PublicEnableMyAuthenticatorV4' test.out

#- 370 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 370 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 371 PublicGetMyBackupCodesV4
eval_tap 0 371 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 372 PublicGenerateMyBackupCodesV4
eval_tap 0 372 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 373 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 373 'PublicDisableMyBackupCodesV4' test.out

#- 374 PublicDownloadMyBackupCodesV4
eval_tap 0 374 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 375 PublicEnableMyBackupCodesV4
eval_tap 0 375 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 376 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 376 'PublicGetBackupCodesV4' test.out

#- 377 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 377 'PublicGenerateBackupCodesV4' test.out

#- 378 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 378 'PublicEnableBackupCodesV4' test.out

#- 379 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'gI7VmnGIRMvXe6Bi' \
    > test.out 2>&1
eval_tap $? 379 'PublicRemoveTrustedDeviceV4' test.out

#- 380 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 380 'PublicSendMyMFAEmailCodeV4' test.out

#- 381 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 381 'PublicDisableMyEmailV4' test.out

#- 382 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'phIFe2bzr6qQw6fS' \
    > test.out 2>&1
eval_tap $? 382 'PublicEnableMyEmailV4' test.out

#- 383 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 383 'PublicGetMyEnabledFactorsV4' test.out

#- 384 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'ESkM19OPMBb12gpm' \
    > test.out 2>&1
eval_tap $? 384 'PublicMakeFactorMyDefaultV4' test.out

#- 385 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ShlmIt2nfhUaZGqj' \
    > test.out 2>&1
eval_tap $? 385 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 386 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "slu59GT2E6AacmZR", "emailAddress": "XZm626POXWVj3KP1", "namespace": "mX0iYHXBU3Uk2tQm", "namespaceDisplayName": "307IORTyHnLYDAAg"}' \
    > test.out 2>&1
eval_tap $? 386 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE