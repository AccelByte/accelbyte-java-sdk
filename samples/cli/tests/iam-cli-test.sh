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
echo "1..389"

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
    --endDate 'KlONk2Q5Y4Jvaizw' \
    --limit '16' \
    --query 'IWekp18lOC3mNqF7' \
    --roleId 'Bl0LcghVHfPEspxw' \
    --startDate 'hRON0bc1eMbEIjow' \
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
    --body '{"ageRestriction": 76, "enable": true}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 118 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetListCountryAgeRestrictionV3' test.out

#- 119 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'KesKoELCpobBEG8X' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 47}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 120 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'Dymtj3giPg4x4yiP' \
    --limit '1' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetBannedUsersV3' test.out

#- 121 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "ues1Hhhkg1yLVbLF", "comment": "zHEP8cM4NTwr0KHa", "endDate": "AsmTej52WKi6tArA", "reason": "URt9plCSVq8PdH6h", "skipNotif": false, "userIds": ["PUAc0RVwXgAgntLM", "CuaXBWQi6BqPg4xr", "0lCancUZGCHsZYoL"]}' \
    > test.out 2>&1
eval_tap $? 121 'AdminBanUserBulkV3' test.out

#- 122 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "fR1KtOv7Zy0b65uv", "userId": "uKNuy0ytZQ7M6Nzy"}, {"banId": "1adnSKOLFKx1dX4L", "userId": "uWJu3pDMUAeeZ97S"}, {"banId": "BROPYuG6XqP6oo7G", "userId": "73zdxTgOfnwIdlNa"}]}' \
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
    --clientId '29fDLh741IslKHzG' \
    --clientName 'lLKWUtDQs61OQAox' \
    --clientType 'yyQpRWCiiPDGQhNP' \
    --limit '63' \
    --offset '22' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 124 'AdminGetClientsByNamespaceV3' test.out

#- 125 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["wiJCf2XJVrlzqQls", "1ozhLVA3kE8jKvga", "tOEBM70TdlNBJYOm"], "baseUri": "pu1VCarzBsV6xnZ5", "clientId": "Jrzzjrcaug6CWVG8", "clientName": "SWP3glU6muswVJnN", "clientPermissions": [{"action": 28, "resource": "Ur6iTrjyEgarAdNJ", "schedAction": 83, "schedCron": "QIoVsGo7dwV9DBqF", "schedRange": ["KHQkETJyTlUrwDTn", "oujQD4IEiH9Z5qXn", "3aoRtlqOECohViHA"]}, {"action": 59, "resource": "uGRUvpZaHCuESOiI", "schedAction": 34, "schedCron": "sMfB4ZH3mtgWgU4p", "schedRange": ["CAKxeE70CaunQNxo", "t371W9G4AvQkqsGn", "myo5JJTUVmb8GEXF"]}, {"action": 93, "resource": "pAyrIwMif3BOdkoc", "schedAction": 99, "schedCron": "nodqpLm7FhJBNXzA", "schedRange": ["FdO0Khqf6kiTdSGv", "2LFjAKY7CbgsWqFW", "ZX7kPBom8F9GLLTG"]}], "clientPlatform": "8phc3n4iLoIllKlp", "deletable": false, "description": "2pqiXJF3WGRaoQom", "modulePermissions": [{"moduleId": "SJC4DdrKF7SUQPLG", "selectedGroups": [{"groupId": "59e0k5ZtX6wK7PpU", "selectedActions": [24, 4, 78]}, {"groupId": "IW32iK7MGt1ixY5r", "selectedActions": [55, 41, 98]}, {"groupId": "WoVeJIePF8ZrQzP4", "selectedActions": [51, 45, 24]}]}, {"moduleId": "tdxdbZUpd6FJtHJ1", "selectedGroups": [{"groupId": "pyVwyKQLY6FEO65R", "selectedActions": [3, 13, 52]}, {"groupId": "hP1y4Zi7s7QBlk44", "selectedActions": [37, 66, 22]}, {"groupId": "B1GZgKg4uKxaCgcG", "selectedActions": [77, 86, 41]}]}, {"moduleId": "pzwj1QGIFmlVf4jv", "selectedGroups": [{"groupId": "apseE9LN9bvhOrHf", "selectedActions": [23, 50, 72]}, {"groupId": "od3dNQrmsApRA6HX", "selectedActions": [31, 89, 95]}, {"groupId": "wrKt2ecozL0TOg54", "selectedActions": [44, 78, 57]}]}], "namespace": "2W7l6jHMA2rG3nak", "oauthAccessTokenExpiration": 29, "oauthAccessTokenExpirationTimeUnit": "UMSHNgqRqCV7usam", "oauthClientType": "ANkZlOX9Sfo95HgX", "oauthRefreshTokenExpiration": 34, "oauthRefreshTokenExpirationTimeUnit": "tm0ZPLkLOsp0LZ5n", "parentNamespace": "jN86Hl8kUXzt6bSc", "redirectUri": "6bWvgpVyW9dD1kOm", "scopes": ["vrAejcq2LgkQuaS7", "RBx3vim02jBOxrZD", "yvpcLYOWA8NjxOna"], "secret": "Eok4nOOCzfsflhjb", "skipLoginQueue": false, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 125 'AdminCreateClientV3' test.out

#- 126 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'gJOUn18G5MlfDTk8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 126 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 127 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'aG40NlncceIZSwgA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteClientV3' test.out

#- 128 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'Ikgzh4pTU0Am4DZh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["l0bQxFJ3sWCqQpQ2", "FbKPFMycMSQ4qfAa", "cR0LgB5BUXvjcu2s"], "baseUri": "6w3VifnKqmTSoGH1", "clientName": "XEfY6QAYn6WQ5UBE", "clientPermissions": [{"action": 95, "resource": "SkVFWdsbYuVEGVxY", "schedAction": 15, "schedCron": "XSxSc3aZPV87pna0", "schedRange": ["8gxefTYKhuxaEc7M", "4P7UckSC6ePeN8i4", "GrFES9z7xueHpATH"]}, {"action": 4, "resource": "3q7akMpcmnnx6RVB", "schedAction": 36, "schedCron": "kEnnqKzFsLfYalUl", "schedRange": ["fwEQKjU7eHGebSVu", "0LQ40kepEaC4dfiO", "MZfEhHr39pysFO3Z"]}, {"action": 44, "resource": "gfY9JQYGF4bYXEcE", "schedAction": 81, "schedCron": "KQQewVLMUoAnaRcY", "schedRange": ["p7FUjfIGaffoflEI", "ByYqeKN0meGelYF5", "wWaDhukU4khGG4vZ"]}], "clientPlatform": "FTYnPkmSu4PWam1j", "deletable": true, "description": "06MqQBErxgjVBycv", "modulePermissions": [{"moduleId": "U4PbmRDcrg0DjQjB", "selectedGroups": [{"groupId": "ECXvea7H1m2lJFRZ", "selectedActions": [32, 78, 31]}, {"groupId": "YSWIeVzm7z9noowm", "selectedActions": [23, 8, 93]}, {"groupId": "nE5hCFkIf5weqZ18", "selectedActions": [78, 72, 69]}]}, {"moduleId": "REdUQ3z9F1BxNNgn", "selectedGroups": [{"groupId": "ke4akncw7wu9TmXf", "selectedActions": [73, 19, 100]}, {"groupId": "7rXFgDnDkdZ9bpjb", "selectedActions": [100, 41, 94]}, {"groupId": "dA3QhjCMW64f4XhI", "selectedActions": [18, 85, 92]}]}, {"moduleId": "lXn77AtYoFzLAATP", "selectedGroups": [{"groupId": "Y8P8P3cfoivvQxev", "selectedActions": [8, 42, 5]}, {"groupId": "USsKoHw2hyd12uSE", "selectedActions": [6, 55, 100]}, {"groupId": "Ev3aevq6iohU1cg4", "selectedActions": [41, 70, 31]}]}], "namespace": "S3Uv1BpWoJBaqdg2", "oauthAccessTokenExpiration": 64, "oauthAccessTokenExpirationTimeUnit": "CHvuk6B6XTmSLyn5", "oauthRefreshTokenExpiration": 19, "oauthRefreshTokenExpirationTimeUnit": "sigBVZxiKdV57GvR", "redirectUri": "yd9UuL02Le8HSCsl", "scopes": ["sDd4M1F5qRIblS7N", "z81GRazPAANjfBol", "dFOyqA2clJ5gEOaC"], "skipLoginQueue": false, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateClientV3' test.out

#- 129 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'tZdIs0xf4czdt7zq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 26, "resource": "5mM7k8nbLzvtCIW5"}, {"action": 50, "resource": "8vdhWVnuYLgpZehK"}, {"action": 54, "resource": "G2nmyuViB9kRTcSQ"}]}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientPermissionV3' test.out

#- 130 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'dTnNYGeAfYFG3wSk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 69, "resource": "w72o8Zkgk0jS6rDW"}, {"action": 96, "resource": "nAXyuGz6LlxHv8Sw"}, {"action": 49, "resource": "HSppnIZkNnTn3rzH"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminAddClientPermissionsV3' test.out

#- 131 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '19' \
    --clientId 'NvAtcvNedgS1fUfK' \
    --namespace "$AB_NAMESPACE" \
    --resource 'mihDbmu8ePWlQMVD' \
    > test.out 2>&1
eval_tap $? 131 'AdminDeleteClientPermissionV3' test.out

#- 132 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'XEHeiGTnwyEw6hIW' \
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
    --body '{"blacklist": ["DZrpP7rz3ISW510k", "Hr4isTKWjmv67nuH", "CXWfwnwGioVwVzmm"]}' \
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
    --limit '56' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 138 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 139 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VVFfpqx1AeLtzcPJ' \
    > test.out 2>&1
eval_tap $? 139 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 140 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3jtDYBo4FUTH7CGf' \
    --body '{"ACSURL": "KSyxgRR1DiCqSMzp", "AWSCognitoRegion": "qIFGLkDs7ACC1RgB", "AWSCognitoUserPool": "foNrHlFi2qJLgmBL", "AllowedClients": ["E35YhyiDV90SeI5y", "ppBHoytVznCgNyx9", "fbT63ShEh8PbGikL"], "AppId": "jgjcj34uulU6FYBZ", "AuthorizationEndpoint": "sWFbr3RSP0W9nBhv", "ClientId": "hf8Q0DtJMcYQdN66", "Environment": "bswAgt65X4N1LQZm", "FederationMetadataURL": "B61JMdtwCVUrYQue", "GenericOauthFlow": false, "IsActive": true, "Issuer": "wmbwFEnAZaWsQJtR", "JWKSEndpoint": "YoagRJK5PX9UcOvh", "KeyID": "PyE11TRT2SKseoe8", "NetflixCertificates": {"encryptedPrivateKey": "VLie0LBa36KNzjf0", "encryptedPrivateKeyName": "05CXNGehQ2aTjTDf", "publicCertificate": "KFDXC7eGL5YhJDWh", "publicCertificateName": "9YWqc0qgV6d9yOfI", "rootCertificate": "MLds2DbPcaoMdtRL", "rootCertificateName": "TmSvTkQQgB7exYvm"}, "OrganizationId": "HMxr5hPCJJztJBg0", "PlatformName": "tTJg46IewOXE2AkC", "RedirectUri": "h3QIZsUf8lGFXcmw", "RegisteredDomains": [{"affectedClientIDs": ["TERHclOdxIwqejxe", "18rNdb8Otq6j1mqU", "av7k05HAQltnSojV"], "domain": "4jT65yclX2FtAz0v", "namespaces": ["JjFIYWOaNdsimmkW", "2miH3xRHAKy4QxZk", "aXZ7vmiEd0JPxVyQ"], "roleId": "pshaDwNqTbbFMXAM"}, {"affectedClientIDs": ["fVXe0GZeMgsRsmH1", "EQrYmkPKTPOlhTtS", "iZNCxuogFteTHJe4"], "domain": "BhSSQkQD6WmOt6D7", "namespaces": ["ufFVTOhvQpfbBke8", "aEdd36xj6wySoltD", "xsbzxrlaKEfkoYjY"], "roleId": "2o6ouRW9UtNquwC3"}, {"affectedClientIDs": ["WgumrIz4NhGztZpr", "4U4fwQIiLXgmRasv", "jO4lj8m3XEwP2b4g"], "domain": "d3xOeii8Jnmssep2", "namespaces": ["xD2NY0kABeGs9yxa", "hld1pO0Gyf5PO3CO", "yMvczgEpzZ3Fbtxf"], "roleId": "hcRC7IVYa6iZ5uFR"}], "Secret": "YNn3SHiWxF0YbuU5", "TeamID": "ar5qTLWUCy0Afgc0", "TokenAuthenticationType": "50XIZRW491e94mQj", "TokenClaimsMapping": {"VOOBnIWhunElqZUo": "dp3IhtCSHy1ei1fI", "rPvfHnRN06EjRwEQ": "lNapJRfk4f9Zcw1p", "EHAyNFxcVTKuAQTG": "h5BxjWOozGoDtsUu"}, "TokenEndpoint": "Yo5p8ED5QZAufwNa", "UserInfoEndpoint": "8lzfjv9oYMXMjlVH", "UserInfoHTTPMethod": "Y1AHwF3vGoav7MK0", "scopes": ["PcLnEkcokKwcQ0ba", "DT9OyJ2h23GUS2am", "U7syGlElXdEAOrVS"]}' \
    > test.out 2>&1
eval_tap $? 140 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 141 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nLocLVVYamQc4wcG' \
    > test.out 2>&1
eval_tap $? 141 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 142 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5nDBLJoJHbiQ5duE' \
    --body '{"ACSURL": "5p4cfs2E41cK8QTw", "AWSCognitoRegion": "iIAvxSvNDlmM5nQF", "AWSCognitoUserPool": "MGzs7fzjgyc44mEh", "AllowedClients": ["9tRk8knYSV30lnro", "QehMDli6t9unQLYX", "xm09wpGAbpEmDY9v"], "AppId": "Lh3u6EDsUmrV6kH4", "AuthorizationEndpoint": "OotKwG3UC6XCnnZx", "ClientId": "F8CmQr17W65br34r", "Environment": "BBN9tU6TDm5GloFS", "FederationMetadataURL": "KWM1eym5ydC6p25x", "GenericOauthFlow": true, "IsActive": true, "Issuer": "WTqUOYZENJ1QHZQx", "JWKSEndpoint": "PRXH7uxBJEECQE1l", "KeyID": "i3Bg7Jxc9pUnZmvh", "NetflixCertificates": {"encryptedPrivateKey": "idwCkZwqjYLfTiCO", "encryptedPrivateKeyName": "1NDBvQvRPnAz4VzW", "publicCertificate": "0CpoBCbyJsF5IjF1", "publicCertificateName": "c0W338HS6CBgVRyi", "rootCertificate": "hYNZ84CVhziXV8Hw", "rootCertificateName": "SmvcvcDKF19yVRaf"}, "OrganizationId": "CjOuSYht83AdvBaa", "PlatformName": "gTiRJ8daGTVX3Bb7", "RedirectUri": "jlz5IfHgKjI9mwJS", "RegisteredDomains": [{"affectedClientIDs": ["rN8jkIykR2zbaI6P", "D7fEscShnGUGUtV9", "GJ279GDbLNwjm3FK"], "domain": "0nnX2poMfZ1hDHtb", "namespaces": ["h4HtMlFgvh2Dp2So", "iIPp1yvfAHS0VgLu", "11A3HTovFi4tPAGf"], "roleId": "leyCA6jEtcqsnzoV"}, {"affectedClientIDs": ["ILjkwW61duF87aUy", "rdt4XSpWBAetsanz", "qP8oxfrtbECD1CYP"], "domain": "waiBAxfYL8Avt70Z", "namespaces": ["UT2fSk3LL0calqxE", "ewuGS469k2hG0WKt", "4sUmanYxM0UHZVNY"], "roleId": "zGMNIpWoSLkUrfuf"}, {"affectedClientIDs": ["4U3WeYeA9t2ENKKW", "rFtHIi1CMgKAOG5i", "DcCR5PbCvDLil8wj"], "domain": "9cKM3Ar6MF35hCER", "namespaces": ["4nGmWGgTJfHlJl4t", "HGa4XfZcd9CVnGqM", "X9FieeEssWEUl07b"], "roleId": "hwntCVqiYOJf5KwM"}], "Secret": "ZQjzvjSozv6CTRDl", "TeamID": "0zp9CzHFwinkBNi4", "TokenAuthenticationType": "gvqgl6TZ9TGVPmv3", "TokenClaimsMapping": {"4h6T7EsufmfxKYB4": "LM6H6QXmpZ9X3fUS", "R1l9xLPBsmAUrD9L": "1IiD6MlcEPhMDFzj", "HZ3sIhzOx2CXKlvI": "omU3pIxM9n8D2eLM"}, "TokenEndpoint": "e3lt9qfx2UDcgVE7", "UserInfoEndpoint": "L9FK6e0MrPc4vtxk", "UserInfoHTTPMethod": "9hVKlG56HlzGr7Xj", "scopes": ["dyRJunZPkp6ccIBn", "WyPw8mj7gyQ7XdIs", "zGRj46COPipH1MWV"]}' \
    > test.out 2>&1
eval_tap $? 142 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 143 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'THG0qHJCWEfOJpZm' \
    --body '{"affectedClientIDs": ["9yEYWNGMy2pgSGSU", "OK68eqGJtWf1Ybgg", "8rdwY9bmrvHmO07K"], "assignedNamespaces": ["NqX9LM2IwEsdOGBX", "BwnzDX8v3xgC1Ge9", "PdbTTAJ2Gp1r0sVZ"], "domain": "6LJAOddIL2l3hPjN", "roleId": "DKv2LWfXqjr8fS79"}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 144 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'En3wYowBdkaZ3y6i' \
    --body '{"domain": "38XQjLDRqkpiFK5B"}' \
    > test.out 2>&1
eval_tap $? 144 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 145 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tiQ272Uo9UBJWodp' \
    > test.out 2>&1
eval_tap $? 145 'RetrieveSSOLoginPlatformCredential' test.out

#- 146 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dwsX1jorcyR0x3Yi' \
    --body '{"acsUrl": "HF8ITGPRQBCgIs1Q", "apiKey": "2lzxl0yF5m77TTh4", "appId": "gUoj8u2WRcLiEtzV", "federationMetadataUrl": "lnkflfn7pHY48F1d", "isActive": false, "redirectUri": "WenURH48aJuALEcS", "secret": "qcE15u6D31DjOsrs", "ssoUrl": "3CUYATdqnQGbqiqO"}' \
    > test.out 2>&1
eval_tap $? 146 'AddSSOLoginPlatformCredential' test.out

#- 147 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kNeATj7eGjodd7Cc' \
    > test.out 2>&1
eval_tap $? 147 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 148 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JUrI6MAugK5kypNr' \
    --body '{"acsUrl": "p2nFe9FmN86sK5LO", "apiKey": "q4ft5jGcMICPUYnf", "appId": "G6jl9U4jReteIMgz", "federationMetadataUrl": "ISomCsodJrhQW41q", "isActive": true, "redirectUri": "byXmgCNiXH8uenbC", "secret": "5CphgMweexsIAP5v", "ssoUrl": "HLjBJ9iqMcBL4Bzh"}' \
    > test.out 2>&1
eval_tap $? 148 'UpdateSSOPlatformCredential' test.out

#- 149 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DUjhKPwbwcvQU5kG' \
    --rawPID  \
    --body '{"platformUserIds": ["8bXGFmPAnOkDiJq4", "xQye7HqnVK3YVeOW", "s9mfVQh3jLBtn9px"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 150 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pE7BYtzB0B4CxyQr' \
    --platformUserId 'UpIFvORxTi79DpSj' \
    > test.out 2>&1
eval_tap $? 150 'AdminGetUserByPlatformUserIDV3' test.out

#- 151 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'b39ukcR6c2E2r3vk' \
    --after '70' \
    --before '78' \
    --limit '10' \
    > test.out 2>&1
eval_tap $? 151 'GetAdminUsersByRoleIdV3' test.out

#- 152 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress '23SzUo4hNBDh9ZFP' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetUserByEmailAddressV3' test.out

#- 153 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType '1OW0nXOErQPS4VsR' \
    --body '{"bulkUserId": ["oYIK69yg9ADCGiXa", "Ls2xjHkinOD975nA", "RHCmhNHSXuqIHsxv"]}' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetBulkUserBanV3' test.out

#- 154 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["aUoXDmwWsukxncuD", "3QxCXMd00YBWCaVV", "mM45mfIZsWhkS476"]}' \
    > test.out 2>&1
eval_tap $? 154 'AdminListUserIDByUserIDsV3' test.out

#- 155 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["dGGJwJ00UH197MJ6", "zU7JLMQyMWzYQCAa", "PJgoxGJoJaSzUtY4"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminBulkGetUsersPlatform' test.out

#- 156 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["ZD0Xtb0U4pH16NUs", "VY21NVIs7NRen2Y3", "Ns0QJQeaWytPfds1"], "isAdmin": true, "namespace": "uD8PGqku59eFJrOX", "roles": ["yDYz9vMUOPG0iHDT", "8QbF7gHPTPQbvLt2", "NRqJGIKzLyH1y72L"]}' \
    > test.out 2>&1
eval_tap $? 156 'AdminInviteUserV3' test.out

#- 157 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '24' \
    --platformUserId 'Ornyx34luLdvtsTK' \
    --platformId 'XMjiw6gYPvfn2Qt9' \
    > test.out 2>&1
eval_tap $? 157 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 158 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 158 'AdminListUsersV3' test.out

#- 159 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'yq3Nyk8ncu2Z3eDH' \
    --endDate 'H9WaVO4iKhDcJ7TC' \
    --includeTotal  \
    --limit '4' \
    --offset '82' \
    --platformBy '9dN1MGRXBJ6mVV7J' \
    --platformId 'S9qjNLwvI8JdiY3R' \
    --query 'RiLilmOGF6dLLIeI' \
    --skipLoginQueue  \
    --startDate 'VIjMcdlbdRXTGIrd' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 159 'AdminSearchUserV3' test.out

#- 160 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["NL5gJPqTAjgqaTHf", "1ANTJ9Yk997XkGOd", "C6ItxDT8p4n4XCFk"]}' \
    > test.out 2>&1
eval_tap $? 160 'AdminGetBulkUserByEmailAddressV3' test.out

#- 161 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'D1AJLCwszbZxuHSg' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetUserByUserIdV3' test.out

#- 162 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DOK8bjoF7bL2635K' \
    --body '{"avatarUrl": "btZTGJpqgl2IzNXG", "country": "TuQPIDpor7t1aJLN", "dateOfBirth": "Nz6QIVC9Mfuc8VOs", "displayName": "nmnlVljdWYmELe74", "languageTag": "p38vumnxAnYBTxaT", "skipLoginQueue": false, "uniqueDisplayName": "z0jcgDI8Pkz96vd8", "userName": "0msqIm5bufnBqrpL"}' \
    > test.out 2>&1
eval_tap $? 162 'AdminUpdateUserV3' test.out

#- 163 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eqhwVhjnnjKMEmtb' \
    --activeOnly  \
    --after 'iWsAQHbMrKYi0Zxs' \
    --before '5SWCqZXHLLa31oQf' \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 163 'AdminGetUserBanV3' test.out

#- 164 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BULnZDhutDM6Bqgu' \
    --body '{"ban": "qD5xxGxBWtnTKUe2", "comment": "znsqPzPkwCBo2SwC", "endDate": "UsTag4MLAo3m61P2", "reason": "xaNfmn8Onb1a9gMz", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 164 'AdminBanUserV3' test.out

#- 165 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId '2UBRmMhAbUWmFhdY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LWzMuv3zkUY0n0BA' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 165 'AdminUpdateUserBanV3' test.out

#- 166 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IFbRkPSSITz4TjCr' \
    --body '{"context": "JHXGXku2YVuOzhxH", "emailAddress": "mnrrV9ZGWrZ05sxe", "languageTag": "6A6RpmKDebNkylby"}' \
    > test.out 2>&1
eval_tap $? 166 'AdminSendVerificationCodeV3' test.out

#- 167 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nkgT9vayLLiizac7' \
    --body '{"Code": "Ge6zKJdlt7rjF5Ra", "ContactType": "JwvkWVco2LTo5ijl", "LanguageTag": "vDF8qBWCQ9dLWYyS", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 167 'AdminVerifyAccountV3' test.out

#- 168 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'zdhMeBXH8x6HdVfZ' \
    > test.out 2>&1
eval_tap $? 168 'GetUserVerificationCode' test.out

#- 169 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VDAiU6iJOF7JKZFN' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetUserDeletionStatusV3' test.out

#- 170 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'k2NKy59X8iOg2sVB' \
    --body '{"deletionDate": 18, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 170 'AdminUpdateUserDeletionStatusV3' test.out

#- 171 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '81lHvv9rqvEoM8Ym' \
    --body '{"code": "VjAkO3HKsEp6Klqw", "country": "W4djrexcbHdEtoQv", "dateOfBirth": "pV344RctmTozCi8H", "displayName": "eV6jbalHmqBBfi7s", "emailAddress": "SF5BoGiTCVsXsygW", "password": "bjE2opXtdsJQeJ1t", "uniqueDisplayName": "oo0qvxphTLEEBGTt", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 171 'AdminUpgradeHeadlessAccountV3' test.out

#- 172 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'q3EVheJjoEEXBLIx' \
    > test.out 2>&1
eval_tap $? 172 'AdminDeleteUserInformationV3' test.out

#- 173 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GnNuhoJM3WWPvvCi' \
    --after '0.46193820349322123' \
    --before '0.08709306685087825' \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 173 'AdminGetUserLoginHistoriesV3' test.out

#- 174 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3ViEdqQpoGkUWNiz' \
    --body '{"languageTag": "k5UcPAGv6c1ESC6h", "newPassword": "ZYTYZbzf5aANNNs5", "oldPassword": "kgSZZNUHbIT9szAp"}' \
    > test.out 2>&1
eval_tap $? 174 'AdminResetPasswordV3' test.out

#- 175 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mWJO5vzzXZj08a6K' \
    --body '{"Permissions": [{"Action": 83, "Resource": "XRVfriSpPFnZBJZk", "SchedAction": 60, "SchedCron": "RBrYVzi9ui3lvozT", "SchedRange": ["t9TsH7A0TuU2aL4b", "Pkk11sys6GdkDcos", "5uVJ0BJfZ0jvA54C"]}, {"Action": 92, "Resource": "RWf6T3by2kYSCdnF", "SchedAction": 76, "SchedCron": "fQVQa6blj9Rdd85b", "SchedRange": ["dYUumPKVSZCg3XTc", "9vQe0dHJfF6KIuvn", "RCa9JktyBdxkZKrE"]}, {"Action": 100, "Resource": "icdrxVhrtwSd9QWV", "SchedAction": 79, "SchedCron": "i0vfWVZoRRMPi57H", "SchedRange": ["yKKz5nyI6ulKNKoX", "a0dgx1JgjC56pda3", "YhtQxpCYME6x21pd"]}]}' \
    > test.out 2>&1
eval_tap $? 175 'AdminUpdateUserPermissionV3' test.out

#- 176 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'X2QSPAd9sxoLnWGP' \
    --body '{"Permissions": [{"Action": 35, "Resource": "PafIjLX8ce0KbNN7", "SchedAction": 75, "SchedCron": "cl2JfmQplvGjVQ4a", "SchedRange": ["ebjfgGu472oWJlfg", "lLM4xjfkNL4lU6ja", "GfsD1cfswmeFpvtD"]}, {"Action": 40, "Resource": "5ZPkv90lyKSTWLxS", "SchedAction": 64, "SchedCron": "aTxi7k489jRCn48b", "SchedRange": ["vkCPfKofwXOIZZQA", "Jza84lKKmVOaTS6x", "BbNrSUAW2ak7ISDr"]}, {"Action": 56, "Resource": "HITBg9x4unq3eOMH", "SchedAction": 70, "SchedCron": "fUDe4g7q6PHEaqbz", "SchedRange": ["HvDDl1jiLw3XMGBA", "6JXDpA1tIC45C0oa", "GouFu4hXONgUwJnU"]}]}' \
    > test.out 2>&1
eval_tap $? 176 'AdminAddUserPermissionsV3' test.out

#- 177 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pryDeRcpUvlrw2Mw' \
    --body '[{"Action": 58, "Resource": "adH5Y41SLjCPrFa0"}, {"Action": 77, "Resource": "l5TPC5GODS44bmm7"}, {"Action": 19, "Resource": "MrRKvw8ISP2WKmCR"}]' \
    > test.out 2>&1
eval_tap $? 177 'AdminDeleteUserPermissionBulkV3' test.out

#- 178 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '89' \
    --namespace "$AB_NAMESPACE" \
    --resource '1QqxnWR5sheLgsAF' \
    --userId '4ctv5guycGiq9j2E' \
    > test.out 2>&1
eval_tap $? 178 'AdminDeleteUserPermissionV3' test.out

#- 179 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yIknfLDpgHnMOn8n' \
    --after 'c3gUZ8ZFyyEr0KBX' \
    --before 'uJBqK4QtEydPWLPB' \
    --limit '25' \
    --platformId 'iR3UbJc1ZYapx7C4' \
    > test.out 2>&1
eval_tap $? 179 'AdminGetUserPlatformAccountsV3' test.out

#- 180 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '77etqgfOJDUT0uKA' \
    > test.out 2>&1
eval_tap $? 180 'AdminGetListJusticePlatformAccounts' test.out

#- 181 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'PrARya2IMlNiXpF4' \
    --userId 'qvsUUpHqi33TcBGk' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetUserMapping' test.out

#- 182 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'c0HjUcnkpU9oVzl2' \
    --userId 'kBuLFXIeCEKZUTz3' \
    > test.out 2>&1
eval_tap $? 182 'AdminCreateJusticeUser' test.out

#- 183 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'GvCAZ5j24acYHbrr' \
    --skipConflict  \
    --body '{"platformId": "yHB6GO9zP3FaepA3", "platformUserId": "b3YJ9nJM6vtT27xv"}' \
    > test.out 2>&1
eval_tap $? 183 'AdminLinkPlatformAccount' test.out

#- 184 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '85K5MU2qmbeqaVem' \
    --userId 'INdClpF7OvlBIEgj' \
    --body '{"platformNamespace": "se5kd6GEDo08yq5E"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminPlatformUnlinkV3' test.out

#- 185 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5HleLoog4me2NBFp' \
    --userId '62xlXvVcJerTPW02' \
    --ticket 'PWsHiKYArAxnKBfB' \
    > test.out 2>&1
eval_tap $? 185 'AdminPlatformLinkV3' test.out

#- 186 AdminDeleteUserLinkingHistoryByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingHistoryByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fDlrQQuAc10DjjwM' \
    --userId 'v4vrIPRtvhQIyLar' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteUserLinkingHistoryByPlatformIDV3' test.out

#- 187 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jaLOKnX51yAB8Pa3' \
    --userId 'uNGKhaLlJzJMSnJI' \
    --platformToken 'IgsAVmaGYxUX1B9o' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 188 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VuzG2CnYX2YBF2g7' \
    --userId 'TVtzYEHUodh3iUfB' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetUserSinglePlatformAccount' test.out

#- 189 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'thbepUCTWiZ1uqh7' \
    --body '["GAi4FEIu44u83ZLR", "xYlYqlpq03BGdIk4", "oEogFVGR71rJOBy6"]' \
    > test.out 2>&1
eval_tap $? 189 'AdminDeleteUserRolesV3' test.out

#- 190 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lsj1AKGBjnHmaAu4' \
    --body '[{"namespace": "YK87DYAWWcbcbGWm", "roleId": "KgE8CZ4AELr5lraa"}, {"namespace": "5v5P5Cj8hgFsqHC9", "roleId": "h5JPiMEtgKuiGTYg"}, {"namespace": "wWv5XldL6rOVGcRA", "roleId": "n51rVAQSxp4qTB54"}]' \
    > test.out 2>&1
eval_tap $? 190 'AdminSaveUserRoleV3' test.out

#- 191 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'mKA3V9DKlCeZ7mLY' \
    --userId 'sHooOIaxIpb1cIOJ' \
    > test.out 2>&1
eval_tap $? 191 'AdminAddUserRoleV3' test.out

#- 192 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'PS3lJ80YJ41U4ooQ' \
    --userId '980ywmg1pWpWit1Q' \
    > test.out 2>&1
eval_tap $? 192 'AdminDeleteUserRoleV3' test.out

#- 193 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'C7FKe0fnHUlmU1un' \
    --body '{"enabled": true, "reason": "M0tgfeWy47bbwMI4"}' \
    > test.out 2>&1
eval_tap $? 193 'AdminUpdateUserStatusV3' test.out

#- 194 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'gGmvK9gW596FwBNr' \
    --body '{"emailAddress": "FXt3TAuKBwBcD12a", "password": "e6r3hHwya4NpdOzg"}' \
    > test.out 2>&1
eval_tap $? 194 'AdminTrustlyUpdateUserIdentity' test.out

#- 195 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3hr6ucHf7dbh2iKN' \
    > test.out 2>&1
eval_tap $? 195 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 196 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'Ul0qJqzoKMRMG541' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "PAiNjULsx4SnKNXL"}' \
    > test.out 2>&1
eval_tap $? 196 'AdminUpdateClientSecretV3' test.out

#- 197 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'MUaDSwwQlnNRZJHB' \
    --before 'SB4fZWEFIZs28Ff1' \
    --isWildcard  \
    --limit '21' \
    > test.out 2>&1
eval_tap $? 197 'AdminGetRolesV3' test.out

#- 198 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "managers": [{"displayName": "ktx3N7WNMYIfcDKb", "namespace": "Lu8pnK34oA1keYXJ", "userId": "vtggDdXjbdjMBahF"}, {"displayName": "ZZGMTcqnWrIprOv0", "namespace": "BJ9Sgl7H1sdH2RIJ", "userId": "z1eI7Q5pu9PutLf6"}, {"displayName": "IrvZoBGQbO4S3rUR", "namespace": "GWUzPAE6SdV4D5jf", "userId": "tRl9rZmtQUvro8TW"}], "members": [{"displayName": "wXWsz9TVmdMKEohK", "namespace": "zuMYDUTLBeCidXju", "userId": "Ggx8ncXejmeZtzT0"}, {"displayName": "qj0ltsqfiZrthVvy", "namespace": "X0OCKDJE3RMUddwS", "userId": "SgxCu8zru1DhGAYO"}, {"displayName": "HR5BWa9VzIkaQEl1", "namespace": "iUProNB6hI6IpGcT", "userId": "oWgFvdRhG9NwV3zD"}], "permissions": [{"action": 42, "resource": "yQENvJrBCqeg67d4", "schedAction": 89, "schedCron": "ZuxWl0Je4fJIyFAm", "schedRange": ["3DQht4JwnPS2urJq", "erobWMZGVL5KLTxa", "hWlS6XdBaKSLCgOO"]}, {"action": 86, "resource": "5IPSrwrJl7wYIVw1", "schedAction": 82, "schedCron": "NCo9yXlbQ52FTHTC", "schedRange": ["j6SEAzT7TOpyiuvv", "QUm29Iacq4XRLaA6", "43nTMtXSAyejnny0"]}, {"action": 73, "resource": "pRi3bhPQvBBJI5Jx", "schedAction": 51, "schedCron": "7EEvHyLmcvrZZOdw", "schedRange": ["e1x8RjU6Bi8JXE52", "sUBBq2SimQQoLbe5", "YOJvxGRxUzrTwagH"]}], "roleName": "7BMT1IZKTdNFVBQ1"}' \
    > test.out 2>&1
eval_tap $? 198 'AdminCreateRoleV3' test.out

#- 199 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'crBXAupATO8uXsqV' \
    > test.out 2>&1
eval_tap $? 199 'AdminGetRoleV3' test.out

#- 200 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'pdiWo8SjDAM0Riw8' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteRoleV3' test.out

#- 201 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'wLYW3n4F3LD1EDwB' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "uBYeQZOzATNSV9E9"}' \
    > test.out 2>&1
eval_tap $? 201 'AdminUpdateRoleV3' test.out

#- 202 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'yyNb7yaLXzAVYymO' \
    > test.out 2>&1
eval_tap $? 202 'AdminGetRoleAdminStatusV3' test.out

#- 203 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'uhCkZu4htrsf8eIF' \
    > test.out 2>&1
eval_tap $? 203 'AdminUpdateAdminRoleStatusV3' test.out

#- 204 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'SovTGXaMsq8ePN1o' \
    > test.out 2>&1
eval_tap $? 204 'AdminRemoveRoleAdminV3' test.out

#- 205 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'co2jx8Upe8SjMvpq' \
    --after 'M8puggOEdG47gD5i' \
    --before '2Ni6AnWn3NdEPhNH' \
    --limit '91' \
    > test.out 2>&1
eval_tap $? 205 'AdminGetRoleManagersV3' test.out

#- 206 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'b59gQffkNOmubxEJ' \
    --body '{"managers": [{"displayName": "r2qEAuJbpZSrcbc4", "namespace": "LWfKaY5c1tP5TDuI", "userId": "5f6m4KC07CnsZe32"}, {"displayName": "hqEcB1ExYMBb3ckv", "namespace": "oaJYdMqGegcg3eRv", "userId": "BZXN3cjIXmFWRJnj"}, {"displayName": "8xN7HDPTUEDPN1Kb", "namespace": "4UTPWDXTSb55g8LS", "userId": "Ts7Nf95lGlPrf6ob"}]}' \
    > test.out 2>&1
eval_tap $? 206 'AdminAddRoleManagersV3' test.out

#- 207 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'IdnI6Ag7eUYcYJ4Q' \
    --body '{"managers": [{"displayName": "zXCmqr6gmPGaHP5S", "namespace": "VPvRLiDi0mNHb6Lx", "userId": "8eq8SGNwEQO8dYXv"}, {"displayName": "BSYvJBwb6CjZUMRf", "namespace": "2VJetWsokvx3BHuT", "userId": "Eczr9KjQ3ttz8MTB"}, {"displayName": "t1xk9IyssSA8nP5P", "namespace": "Qjpzk2Tb7iYdmNZW", "userId": "osrsVBPZ64j0HUON"}]}' \
    > test.out 2>&1
eval_tap $? 207 'AdminRemoveRoleManagersV3' test.out

#- 208 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'scofwYLQcDvkaEII' \
    --after 'PoJT83zEGXmVBZLy' \
    --before 'rH9J7BoysmaORLkP' \
    --limit '7' \
    > test.out 2>&1
eval_tap $? 208 'AdminGetRoleMembersV3' test.out

#- 209 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'hc2Fh04JTsqDTynC' \
    --body '{"members": [{"displayName": "ewqJligLlRxOelKy", "namespace": "kICRxF6HtlER2txs", "userId": "4qrNARATn6KXOutl"}, {"displayName": "YBbLhL8KXx25FZfQ", "namespace": "IodVBqQsBpCJBIXL", "userId": "GYcwWVRK6UKk5ozr"}, {"displayName": "XA4HZHNyq9odanhR", "namespace": "1Zrm3thUvV87yfky", "userId": "cLSVdleSaAylsmLY"}]}' \
    > test.out 2>&1
eval_tap $? 209 'AdminAddRoleMembersV3' test.out

#- 210 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'e2phYOgT5kDTyPl3' \
    --body '{"members": [{"displayName": "dKF7NXEjrJMki8jv", "namespace": "c3P8Gwjg3IOH0SDH", "userId": "gYKqxJiFJdrmj5vh"}, {"displayName": "zgsJwex7wq8ZPlXN", "namespace": "aUNgdY2vfJuje5cP", "userId": "nmGjTvYa5Pqx1K7q"}, {"displayName": "cAoijBPAp6EPb988", "namespace": "NzxrDKVpULjjiw3N", "userId": "eVG4DJi9DaMrc0WF"}]}' \
    > test.out 2>&1
eval_tap $? 210 'AdminRemoveRoleMembersV3' test.out

#- 211 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'gKjE945x2CPVYYG9' \
    --body '{"permissions": [{"action": 100, "resource": "4OMIzvTScdbKBsAy", "schedAction": 73, "schedCron": "Ncwjr7gSGhnfuF4W", "schedRange": ["ZiQVICVpWd3UM08g", "MXhdf3juXW4JprIb", "3CJCAtvSG8Cfa9dz"]}, {"action": 82, "resource": "dZFLbZEHxsDxeR6d", "schedAction": 89, "schedCron": "r1SQw80JfMpPrSqY", "schedRange": ["ypRUnq5o4ETeCUYG", "9ccTt7Wxw8OQ13t3", "uTw6zQuoZcXQpoTO"]}, {"action": 47, "resource": "G2KNGfhzfCTxxrsR", "schedAction": 89, "schedCron": "oISyXtHzoWGdYohx", "schedRange": ["Mp3uOQIybqWfG9BJ", "6FVKlbYHtbPtaxva", "gSlpGgVTF6VeDAPO"]}]}' \
    > test.out 2>&1
eval_tap $? 211 'AdminUpdateRolePermissionsV3' test.out

#- 212 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'GBwweyFfXEOEAEtb' \
    --body '{"permissions": [{"action": 1, "resource": "l59Wp9A3tXGve6Dd", "schedAction": 75, "schedCron": "3eR4DtNp129hzBw3", "schedRange": ["xLUcCEt0DzmkJq1s", "ml5bYt76BNsi4giR", "9434WpKKdzxoufCN"]}, {"action": 24, "resource": "thrpnMUBsnUfuQIc", "schedAction": 92, "schedCron": "eoBHTdwAk7ZQnbqY", "schedRange": ["1cQwVEtAr5kKKAo9", "MM2Cqm84jVi9kIpq", "grzpUkNOBWydXV0F"]}, {"action": 18, "resource": "t1Bjj3b8QM8Rr45U", "schedAction": 77, "schedCron": "k8rVNrm8drv8QD2J", "schedRange": ["Oe2Ntz7EFvowPgIG", "uetxFMqXCQMAqQ2Z", "RGzNtrThFa9XU8mo"]}]}' \
    > test.out 2>&1
eval_tap $? 212 'AdminAddRolePermissionsV3' test.out

#- 213 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'sluiHZJ7O8sAQ32w' \
    --body '["j9uaDzsr9xYiWRuu", "zQJiLc1eI9w3JEhx", "PGbEk7s7gw07Flou"]' \
    > test.out 2>&1
eval_tap $? 213 'AdminDeleteRolePermissionsV3' test.out

#- 214 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '27' \
    --resource 'Jdre5ur6yvWJDdvM' \
    --roleId '7T7PX2vamIRZHzsI' \
    > test.out 2>&1
eval_tap $? 214 'AdminDeleteRolePermissionV3' test.out

#- 215 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 215 'AdminGetMyUserV3' test.out

#- 216 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'YOCUoiCXNjrdQL2j' \
    --extendExp  \
    --redirectUri 'dx1eIba1sB0HsJ06' \
    --password 'DzfbzRYt4OVUyumB' \
    --requestId 'eIqdQGZC5kM03HHi' \
    --userName 'jsQRj7N8IAjmsonj' \
    > test.out 2>&1
eval_tap $? 216 'UserAuthenticationV3' test.out

#- 217 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'j0ZR50BQ1U6aFD3O' \
    --linkingToken '2kXQSc58zgZVl4gI' \
    --password 'F7v3qbZu9M3OxqVA' \
    --username 'T4H1lRZ9Z1JBrHRz' \
    > test.out 2>&1
eval_tap $? 217 'AuthenticationWithPlatformLinkV3' test.out

#- 218 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'EOtIxzPqb6n73m0j' \
    --extendExp  \
    --linkingToken 'iaDH86d9rsKgzCsM' \
    > test.out 2>&1
eval_tap $? 218 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 219 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'ulpB8HZUtVVaJCiL' \
    > test.out 2>&1
eval_tap $? 219 'RequestOneTimeLinkingCodeV3' test.out

#- 220 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'gKOwrSfWhT5B4Wed' \
    > test.out 2>&1
eval_tap $? 220 'ValidateOneTimeLinkingCodeV3' test.out

#- 221 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'opzwSluBtRFPKThy' \
    --isTransient  \
    --clientId 'GnbjmPDKFS6u9FHu' \
    --oneTimeLinkCode 'v1M3qfch4SqIV6LQ' \
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
    --codeChallenge 'PHlaeYl4csFq65cU' \
    --codeChallengeMethod 'S256' \
    --clientId '6yJaj4ovoKWE4EW0' \
    > test.out 2>&1
eval_tap $? 224 'RequestTokenExchangeCodeV3' test.out

#- 225 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sw8v5peiuxoBJATa' \
    --userId 'uyD3XCXVMiyEvMf9' \
    > test.out 2>&1
eval_tap $? 225 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 226 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yilUEujk6oqYo1HQ' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 226 'RevokeUserV3' test.out

#- 227 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'YTFzwdOMdupwD4O3' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'CBfGUdVEdvdQL7sV' \
    --redirectUri 'wcZ2PofaJoSqtrEO' \
    --scope 'qxH46fRTSZoDdT0f' \
    --state 'efo74eg3Nt2c0r4G' \
    --targetAuthPage 'qF0NHglOVuNZ9LzN' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'eJnBurh54CWbYb0P' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 227 'AuthorizeV3' test.out

#- 228 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'I0GKwJ3vfXlsAMy2' \
    > test.out 2>&1
eval_tap $? 228 'TokenIntrospectionV3' test.out

#- 229 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 229 'GetJWKSV3' test.out

#- 230 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'Zp2UAGxHnmSxvkG9' \
    --factor 'UR5q9neoW6JBcGp9' \
    --mfaToken 'Rx2RfcRhXpmeeHdv' \
    > test.out 2>&1
eval_tap $? 230 'SendMFAAuthenticationCode' test.out

#- 231 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'phas9S7ivHEoLbUM' \
    --mfaToken 'M47f1UreUpxEkXIb' \
    > test.out 2>&1
eval_tap $? 231 'Change2faMethod' test.out

#- 232 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'E1ETzRJZKMavu4Ul' \
    --factor '2IaieEbPSE7TGkeH' \
    --mfaToken 'sYsW9oGBN1pYMBwb' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 232 'Verify2faCode' test.out

#- 233 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PZTlMlUvFEiGprcN' \
    --userId 'SQ9kEeXBZ6FVrBzy' \
    > test.out 2>&1
eval_tap $? 233 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 234 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'hyhoS6a9oe0JaXFp' \
    --clientId 'ff28uYbe4Cf2HEHv' \
    --redirectUri 'VevhISjbtBJUK5fE' \
    --requestId '3OufPSX3PdOU2V9y' \
    > test.out 2>&1
eval_tap $? 234 'AuthCodeRequestV3' test.out

#- 235 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'w94oa8UJ34TIedV3' \
    --additionalData 'HyoX4VnO2LpBU08w' \
    --clientId 'fnlHBXFIqFUmgUSM' \
    --createHeadless  \
    --deviceId 'M5au8GJT0mkVPI6z' \
    --macAddress 'Utf3QaJPGrTNcXXT' \
    --platformToken 'UIggoH89QNmI17UD' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 235 'PlatformTokenGrantV3' test.out

#- 236 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 236 'GetRevocationListV3' test.out

#- 237 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'b19R6H7r1ta3m7jK' \
    > test.out 2>&1
eval_tap $? 237 'TokenRevocationV3' test.out

#- 238 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'pspc' \
    --simultaneousTicket 'qGdCZIc6EFqBKxbS' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'Q2OgRucL1jwRXzfj' \
    > test.out 2>&1
eval_tap $? 238 'SimultaneousLoginV3' test.out

#- 239 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'DZZBmOau6syme06c' \
    --clientId '6SKLc2mEC3IXl5XC' \
    --code 'bkOfHaGr5kdazlyp' \
    --codeVerifier 'vt6lSLfU7HByGXPM' \
    --extendNamespace 'qxj4hBgVY3YAxZLK' \
    --extendExp  \
    --password 'bcOdyjqf6Q4oiwoJ' \
    --redirectUri 'caRMEb15LBlTVufc' \
    --refreshToken '5ZyODR2NVyn4PRqf' \
    --username '3eRbZqBAoKGcVCdM' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 239 'TokenGrantV3' test.out

#- 240 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'yXAn3bWQF6QcAiJp' \
    > test.out 2>&1
eval_tap $? 240 'VerifyTokenV3' test.out

#- 241 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'XIrgroixptZhckUT' \
    --code 'GkcBOE4qMcH1Kyi8' \
    --error 'ZFvGcV8DY0XOkDst' \
    --openidAssocHandle 'xZcY1HgAnZV4IOgl' \
    --openidClaimedId 'VLqb9lGAJUg21Lt7' \
    --openidIdentity 'JwgwMUSuC3Bajy3B' \
    --openidMode 'cEMCtQs2FcEcvVAy' \
    --openidNs 'Id6Cp85HVDsZBQgO' \
    --openidOpEndpoint 'nXuXsGThYZrmm0wr' \
    --openidResponseNonce 'FMnPpWgrQD4hEk0O' \
    --openidReturnTo 'LjYsnignE7KcMF7f' \
    --openidSig 'uDbzRRYMNXWUsp1t' \
    --openidSigned 'OibJY9aL9ie6vvMb' \
    --state 'iNURrlm88QlKyuoy' \
    > test.out 2>&1
eval_tap $? 241 'PlatformAuthenticationV3' test.out

#- 242 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'a4JgakZyUV7t73Vn' \
    --platformToken 'SFbuxd4KYZ0jk0UZ' \
    > test.out 2>&1
eval_tap $? 242 'PlatformTokenRefreshV3' test.out

#- 243 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'dhtnKu9oTc8pVkiy' \
    > test.out 2>&1
eval_tap $? 243 'PublicGetInputValidations' test.out

#- 244 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'Gsj5JdXzRxfNEjUM' \
    > test.out 2>&1
eval_tap $? 244 'PublicGetInputValidationByField' test.out

#- 245 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'Ts8WIObJBTsvsw76' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 245 'PublicGetCountryAgeRestrictionV3' test.out

#- 246 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'uISRX0bKVoWtoUW1' \
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
    --clientId 'P7ocuBAldDSUS7Ha' \
    > test.out 2>&1
eval_tap $? 249 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 250 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'a6unq1yQOSRvyiLB' \
    --rawPID  \
    --body '{"platformUserIds": ["RVtIDi2piIQFVmzM", "idw70KSahpYZdKZR", "yR9AX7JjxvNZhM84"]}' \
    > test.out 2>&1
eval_tap $? 250 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 251 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DiZk6ySrB9SVFctW' \
    --platformUserId '7YS0OkL78XeEAtAL' \
    > test.out 2>&1
eval_tap $? 251 'PublicGetUserByPlatformUserIDV3' test.out

#- 252 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'FI3v8yha4pd5A7MY' \
    > test.out 2>&1
eval_tap $? 252 'PublicGetAsyncStatus' test.out

#- 253 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'cpBD6lKNb8RxvN2u' \
    --limit '73' \
    --offset '69' \
    --platformBy '7baOeLH19fqBwNbN' \
    --platformId 'e1ffYRtIvQaKyevW' \
    --query 'YtZjK6J29v8MpBSp' \
    > test.out 2>&1
eval_tap $? 253 'PublicSearchUserV3' test.out

#- 254 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "o3AKRmnJkzJHAckU", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "Z7PyhqFJkDClOsKm", "policyId": "fsgJdmzsDPsWh1k0", "policyVersionId": "cQ08NG6dX2TZkil6"}, {"isAccepted": false, "localizedPolicyVersionId": "kRngoUa83ECh1gqP", "policyId": "eS193TNNzot3sVli", "policyVersionId": "3GN2XTrFibRAhzzE"}, {"isAccepted": false, "localizedPolicyVersionId": "zWlTY70qdgJRvpZr", "policyId": "SpWX3KEe2BjV00Re", "policyVersionId": "CXFffjJJxlgjzIhp"}], "authType": "gOoIOD74V21HWDAf", "code": "vXwdxbyp4HAPbBbN", "country": "PStVBUpKgOssFkz0", "dateOfBirth": "F36piDYXeHZ7FHls", "displayName": "3nyvconqbHQqKLQK", "emailAddress": "e3xmj6s0GqsWncp5", "password": "LrqbiKudv9z75Szo", "reachMinimumAge": true, "uniqueDisplayName": "HQhO9IKBXDFQfXFD"}' \
    > test.out 2>&1
eval_tap $? 254 'PublicCreateUserV3' test.out

#- 255 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field '58sG6uDhFYlrzJBY' \
    --query 'SeMuJfQecutjS029' \
    > test.out 2>&1
eval_tap $? 255 'CheckUserAvailability' test.out

#- 256 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["BiJWOG1m7MKclr5i", "gjNTVItrH2X78hxJ", "gaVfw5Vnyq8OzTE8"]}' \
    > test.out 2>&1
eval_tap $? 256 'PublicBulkGetUsers' test.out

#- 257 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "9WDNoMcOmbfJrCJQ", "languageTag": "Ij1haAosKglqaCXE"}' \
    > test.out 2>&1
eval_tap $? 257 'PublicSendRegistrationCode' test.out

#- 258 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "9ytpIO8btO3OwNEG", "emailAddress": "SW5TaW4to7QCY2NG"}' \
    > test.out 2>&1
eval_tap $? 258 'PublicVerifyRegistrationCode' test.out

#- 259 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "Gvi9kg3rMIzNmhJT", "languageTag": "NQjKlwjfJ3TJ2xVp"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicForgotPasswordV3' test.out

#- 260 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'ge70WsLfgbZieRvJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 260 'GetAdminInvitationV3' test.out

#- 261 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'I5sT9DH3DfLCv8q4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "Thmq09bBgPAYxrBE", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "ZIp693lRwtc43atC", "policyId": "uCFxbfbz4aQERziP", "policyVersionId": "L4dHhOqG5KDdUvk0"}, {"isAccepted": true, "localizedPolicyVersionId": "sSck3ggZWJlSlCQM", "policyId": "Dji329PfVrvMEPtp", "policyVersionId": "sSNcpK1QkB2Sy8Ww"}, {"isAccepted": true, "localizedPolicyVersionId": "eVskqeUB7RSayqGF", "policyId": "guhh3bvadRthdbVA", "policyVersionId": "pebRA09rW8i8krFW"}], "authType": "Jhe03coRFok5d3Ay", "code": "GrZO8GuoXNSoVEBG", "country": "7VbBPUWipz9C05Ya", "dateOfBirth": "bFX4FCK5ucTFsAFz", "displayName": "aO3yJpA3KMxBlrRy", "emailAddress": "tER1qdTelFAadM9y", "password": "66Drf4SSGGt3MiBK", "reachMinimumAge": false, "uniqueDisplayName": "SiGUjVAw4v3q6JRH"}' \
    > test.out 2>&1
eval_tap $? 261 'CreateUserFromInvitationV3' test.out

#- 262 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "cn7KaoCEkRdo6qHY", "country": "IZWnXqQ1oHFJ9Q0v", "dateOfBirth": "qsL9SomqWsGA76yx", "displayName": "i0QzZWfmP2sx0KO5", "languageTag": "bEJaPnAFjsodyJQV", "uniqueDisplayName": "VBrShGbIIuqK8C40", "userName": "3HgoXCR6XOMXwKdf"}' \
    > test.out 2>&1
eval_tap $? 262 'UpdateUserV3' test.out

#- 263 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "qk8T4QHK30EX0Fcl", "country": "pDl5HsuracO5Mnjn", "dateOfBirth": "xD1OXkxShFVQTRek", "displayName": "Lfjmy8zosRCRgVwb", "languageTag": "rQKmb01yA7U7dGMj", "uniqueDisplayName": "upZkZQY8CNyT4k3D", "userName": "IbfT22G5NpE130YW"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicPartialUpdateUserV3' test.out

#- 264 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "SgxpKWtdtdtVW9an", "emailAddress": "ENmxb9e7vXZV3ig8", "languageTag": "Jg5VByeI3ycMcYYB"}' \
    > test.out 2>&1
eval_tap $? 264 'PublicSendVerificationCodeV3' test.out

#- 265 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ixKJXCISQdwec1m8", "contactType": "BusV9tUh74KVo6Xq", "languageTag": "jz2xUKLNWSmYyVvy", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 265 'PublicUserVerificationV3' test.out

#- 266 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "JssShBKsQjXvfQgQ", "country": "Dt6ce8NDMErA82Fr", "dateOfBirth": "R1GSogkewIzTOqKk", "displayName": "cjRh3l2gAJOTCbx7", "emailAddress": "J3gNLIlTk3Bpclrk", "password": "4hIRn0znIKzAEAHQ", "uniqueDisplayName": "pBOgHEP5l94s7CbI", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 266 'PublicUpgradeHeadlessAccountV3' test.out

#- 267 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "7eHnVWOboMkyB7FT", "password": "exsOZ0b2p3b63Krc"}' \
    > test.out 2>&1
eval_tap $? 267 'PublicVerifyHeadlessAccountV3' test.out

#- 268 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "wIcXMhGy83Xit6bo", "newPassword": "OLGCcg16DqwdQPQ9", "oldPassword": "HkSSV8e1MgTTLS2F"}' \
    > test.out 2>&1
eval_tap $? 268 'PublicUpdatePasswordV3' test.out

#- 269 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'garY903INGIyEfRB' \
    > test.out 2>&1
eval_tap $? 269 'PublicCreateJusticeUser' test.out

#- 270 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ej7qms9AGQExPhgr' \
    --redirectUri '9gGfC0GjvpgJfuBs' \
    --ticket '1Vpqn47GVghTH2wT' \
    > test.out 2>&1
eval_tap $? 270 'PublicPlatformLinkV3' test.out

#- 271 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oOnq9U5lyW89Xwt3' \
    --body '{"platformNamespace": "wmRTrDCjhnKvsHez"}' \
    > test.out 2>&1
eval_tap $? 271 'PublicPlatformUnlinkV3' test.out

#- 272 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WTqgYPixtHk6lWq6' \
    > test.out 2>&1
eval_tap $? 272 'PublicPlatformUnlinkAllV3' test.out

#- 273 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tEeUmU96FLEak0mJ' \
    --ticket 'qjRYldcTpdeCD9XP' \
    > test.out 2>&1
eval_tap $? 273 'PublicForcePlatformLinkV3' test.out

#- 274 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ri4bAQL7VE2wL8Y4' \
    --clientId 'JFVUdzA8bvXlDhG7' \
    --redirectUri 'BrorbKIKuOXJPm5z' \
    > test.out 2>&1
eval_tap $? 274 'PublicWebLinkPlatform' test.out

#- 275 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'trr09CDA8Ij5bGKS' \
    --code 'uopWQbaCvdPSq8Z2' \
    --state '7GpvHCDx55JZ5z6g' \
    > test.out 2>&1
eval_tap $? 275 'PublicWebLinkPlatformEstablish' test.out

#- 276 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ujpFzlPspQD9IRIp' \
    --code 'DDubntPCFxfeoW2N' \
    --state 'dSWzOXjO1NQUqWHB' \
    > test.out 2>&1
eval_tap $? 276 'PublicProcessWebLinkPlatformV3' test.out

#- 277 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "W78XREZCiTNAxq26", "userIds": ["gZrPqCsSDspvgM16", "sZ6rjnkH4ExObppC", "6CMYDm5ge659UDEO"]}' \
    > test.out 2>&1
eval_tap $? 277 'PublicGetUsersPlatformInfosV3' test.out

#- 278 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "F6gp5UfmjtiVbqJn", "emailAddress": "ZcrqrPye7fCwi7Il", "newPassword": "2wIFlHm9N6owMHMt"}' \
    > test.out 2>&1
eval_tap $? 278 'ResetPasswordV3' test.out

#- 279 PublicGetUserByUserIdV3
eval_tap 0 279 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 280 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jy1Oqn59tEGm9NYe' \
    --activeOnly  \
    --after 'UT5P0nx8TqSZdZ5C' \
    --before '8mFI9TnvzEqBNMF9' \
    --limit '59' \
    > test.out 2>&1
eval_tap $? 280 'PublicGetUserBanHistoryV3' test.out

#- 281 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yI6Vtd4v9k4fv3kM' \
    > test.out 2>&1
eval_tap $? 281 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 282 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iuQ3DhsKLxjt5srP' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetUserInformationV3' test.out

#- 283 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FxBgpFtDBmTLH9kP' \
    --after '0.9875889572984355' \
    --before '0.7523170405118275' \
    --limit '78' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetUserLoginHistoriesV3' test.out

#- 284 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3z6joBAhAlJGI2YY' \
    --after 'b6ajBjgq6eY4PBNH' \
    --before 'KPx62tHxDb06ZFy3' \
    --limit '42' \
    --platformId 'HA009FAb21jxeWXk' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetUserPlatformAccountsV3' test.out

#- 285 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '80y9uxgVLGgK8aVS' \
    > test.out 2>&1
eval_tap $? 285 'PublicListJusticePlatformAccountsV3' test.out

#- 286 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'CN6oCETQ8gIDRdD2' \
    --body '{"platformId": "wwMXwKVXGPhEJsc7", "platformUserId": "rZpxaPHc9r8eToFm"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicLinkPlatformAccount' test.out

#- 287 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'kHJ6BPOKFLxIwKss' \
    --body '{"chosenNamespaces": ["w647YwDudnGRufOU", "GfMjTU226l07jPlc", "YaqYM7YfBmhjI9Y2"], "requestId": "8qVceS9UX48dKPCF"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicForceLinkPlatformWithProgression' test.out

#- 288 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UIeyYEymNXzNX6TG' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetPublisherUserV3' test.out

#- 289 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'h4UdEweeBsJEvBbA' \
    --password 'vCmlh6Z1oz9BaixU' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 290 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'UvmzbajE2gjooiDn' \
    --before 'c1NUb51lEgUwQ9tk' \
    --isWildcard  \
    --limit '99' \
    > test.out 2>&1
eval_tap $? 290 'PublicGetRolesV3' test.out

#- 291 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'axSPgPCiwLxCFLDi' \
    > test.out 2>&1
eval_tap $? 291 'PublicGetRoleV3' test.out

#- 292 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 292 'PublicGetMyUserV3' test.out

#- 293 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'xZwVtt3RVTl0tR00' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 294 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["oQgcHdGGK3x76U1E", "IcklttmrpgF5szl0", "sMY8es36r1FgR70e"], "oneTimeLinkCode": "NLHkVrEFd8xArWJu"}' \
    > test.out 2>&1
eval_tap $? 294 'LinkHeadlessAccountToMyAccountV3' test.out

#- 295 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "CAIfNBSHgpFNw9K9"}' \
    > test.out 2>&1
eval_tap $? 295 'PublicSendVerificationLinkV3' test.out

#- 296 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'pmAIc6VSfE9nbE2P' \
    > test.out 2>&1
eval_tap $? 296 'PublicVerifyUserByLinkV3' test.out

#- 297 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'Mv12ZSRJkujxbCu1' \
    --code 'HFaj6Vxs3GuA4S1d' \
    --error 'S7H7yIS7b5TSDRIo' \
    --state 'Mg7Dc5APzfzXDELJ' \
    > test.out 2>&1
eval_tap $? 297 'PlatformAuthenticateSAMLV3Handler' test.out

#- 298 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'FaIaEMW5bhJyL72W' \
    --payload 'DyhBsCCbnfihnXKx' \
    > test.out 2>&1
eval_tap $? 298 'LoginSSOClient' test.out

#- 299 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'GxaupnTTq9ihZkvF' \
    > test.out 2>&1
eval_tap $? 299 'LogoutSSOClient' test.out

#- 300 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'KfSHQh8I9xk3sFl0' \
    --code 'cbuCRM69XKkLwioR' \
    > test.out 2>&1
eval_tap $? 300 'RequestTargetTokenResponseV3' test.out

#- 301 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '0' \
    --namespace "$AB_NAMESPACE" \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 301 'AdminListInvitationHistoriesV4' test.out

#- 302 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KnWhlh80BhYe2fJD' \
    > test.out 2>&1
eval_tap $? 302 'AdminGetDevicesByUserV4' test.out

#- 303 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'S6T75Q4ulonMFjmY' \
    --endDate 'qE1wJhfogWg2Apm0' \
    --limit '37' \
    --offset '85' \
    --startDate 'Uy18aWn65Co0vdCk' \
    > test.out 2>&1
eval_tap $? 303 'AdminGetBannedDevicesV4' test.out

#- 304 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '8so6JSaZAIadKDEZ' \
    > test.out 2>&1
eval_tap $? 304 'AdminGetUserDeviceBansV4' test.out

#- 305 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "ywonA2SrEdN2tmGu", "deviceId": "X6r0gBVUUeKKlPKt", "deviceType": "E6gnYxmkmCWbs5qu", "enabled": false, "endDate": "aSwWcZmzCWGI1cIQ", "ext": {"cPWAShIhieSKUf3z": {}, "KbyQk2vQTYX1xsth": {}, "28NZZgsXycuQNGID": {}}, "reason": "eHlf6IcX1K9JrK6O"}' \
    > test.out 2>&1
eval_tap $? 305 'AdminBanDeviceV4' test.out

#- 306 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'r2xx7rLwrPoWiywn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 306 'AdminGetDeviceBanV4' test.out

#- 307 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'xuDLLuIaSxoloIH1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 307 'AdminUpdateDeviceBanV4' test.out

#- 308 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'qO0iAXA9dB4ib8HD' \
    --startDate 'OJ8TNiP8KgEAj3db' \
    --deviceType 'RTI0i6dO3zkbDseh' \
    > test.out 2>&1
eval_tap $? 308 'AdminGenerateReportV4' test.out

#- 309 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 309 'AdminGetDeviceTypesV4' test.out

#- 310 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '4tJdoGcwMBmegqVU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 310 'AdminGetDeviceBansV4' test.out

#- 311 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'aWMJBjrV0p9A7tcH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 311 'AdminDecryptDeviceV4' test.out

#- 312 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'rV0MbJGr4drgkDuW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 312 'AdminUnbanDeviceV4' test.out

#- 313 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'S05m0pGzazM2BUXn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 313 'AdminGetUsersByDeviceV4' test.out

#- 314 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 314 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 315 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 315 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 316 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 96}' \
    > test.out 2>&1
eval_tap $? 316 'AdminCreateTestUsersV4' test.out

#- 317 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "gr3Cc4M2O7NrTQO7", "policyId": "KLdZDGwqx7T3l1ut", "policyVersionId": "2oyolliYsTJUmpsc"}, {"isAccepted": true, "localizedPolicyVersionId": "MraDLrwh3d0ykRGk", "policyId": "gqUNIbJMJ9ABbKVW", "policyVersionId": "O2YEDiqkwKbpdk7w"}, {"isAccepted": false, "localizedPolicyVersionId": "02YMvEUNfoL7JCcM", "policyId": "o7GxxXdbYCRexPek", "policyVersionId": "TsQxMTfaSot7aohF"}], "authType": "EMAILPASSWD", "code": "2yfrC1V7ZpJZPHCM", "country": "qvcYmeDLYEzs2SQU", "dateOfBirth": "dKr6vgqkjycqclNl", "displayName": "BORlC8ZkjsxYtgxp", "emailAddress": "lHTPLzynjFZgF3er", "password": "w7UsyHq4bBb0n1Jh", "passwordMD5Sum": "PUS8BRPGV9n769zL", "reachMinimumAge": true, "uniqueDisplayName": "dKMexeJc7NvgTSgK", "username": "jCxZjKf8NA4cGUaD"}' \
    > test.out 2>&1
eval_tap $? 317 'AdminCreateUserV4' test.out

#- 318 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["8GgVk77fd1GS5Yky", "hAiAItnWUmD225fp", "1egsx3ErheNwqd5p"]}' \
    > test.out 2>&1
eval_tap $? 318 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 319 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["riclNNqLyrlzrJ4Q", "HbfnAdtkujxHff7n", "1yaNCcjgFhS0URBh"]}' \
    > test.out 2>&1
eval_tap $? 319 'AdminBulkCheckValidUserIDV4' test.out

#- 320 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'l0L5FCbOn46W2B2u' \
    --body '{"avatarUrl": "PQLrt2t6bVpCgKvP", "country": "XSDufmKh783cV54J", "dateOfBirth": "sVBRB0rY0xfWddAC", "displayName": "yHSmo4KX9TPO3K1k", "languageTag": "5ZM8btmGsgXNXbpq", "skipLoginQueue": true, "uniqueDisplayName": "nc3eFm950dtVAo7w", "userName": "4e3v5mh6Rum5pbgE"}' \
    > test.out 2>&1
eval_tap $? 320 'AdminUpdateUserV4' test.out

#- 321 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 't39uJQpgEtchTe3n' \
    --body '{"code": "t7t9ztprSfW9OutA", "emailAddress": "DrNGBWSJ1zQKxVmR"}' \
    > test.out 2>&1
eval_tap $? 321 'AdminUpdateUserEmailAddressV4' test.out

#- 322 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TawjiZPMoZZcyGEH' \
    > test.out 2>&1
eval_tap $? 322 'AdminDisableUserMFAV4' test.out

#- 323 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xAKDQher3usApPdJ' \
    > test.out 2>&1
eval_tap $? 323 'AdminListUserRolesV4' test.out

#- 324 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pn9eIdhIBvTTupAB' \
    --body '{"assignedNamespaces": ["J4RwH3EdKmYtbqQH", "NfIZwrMxf3EnzZVn", "kLT0Lb85nmpdN26B"], "roleId": "Y5YI0jeO2zMDSy4k"}' \
    > test.out 2>&1
eval_tap $? 324 'AdminUpdateUserRoleV4' test.out

#- 325 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yqyKgrtEPdXXlt8g' \
    --body '{"assignedNamespaces": ["eCdiXu3iNvn7vLZ7", "h6alhJNGZF07lsPP", "5OfHbXzWnVO2U4uy"], "roleId": "zZo1rj0ZrLQjk4Vo"}' \
    > test.out 2>&1
eval_tap $? 325 'AdminAddUserRoleV4' test.out

#- 326 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YfIksth24cZBpdDF' \
    --body '{"assignedNamespaces": ["fvzeU5iqhx6zv7EU", "RTNIoG1DBdoKH6sR", "EmmfwUZLZZS7snx0"], "roleId": "Q2Gd8m7Y3wiNloJf"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminRemoveUserRoleV4' test.out

#- 327 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '10' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 327 'AdminGetRolesV4' test.out

#- 328 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "L6SjljNPTXA3qbg5"}' \
    > test.out 2>&1
eval_tap $? 328 'AdminCreateRoleV4' test.out

#- 329 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId '5SyienCODZ0mnOpP' \
    > test.out 2>&1
eval_tap $? 329 'AdminGetRoleV4' test.out

#- 330 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'TVxEgBFzG8tlkxWK' \
    > test.out 2>&1
eval_tap $? 330 'AdminDeleteRoleV4' test.out

#- 331 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'CU1XN4gl7yHvEqpJ' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "2PqUfbpMpRl6xRyV"}' \
    > test.out 2>&1
eval_tap $? 331 'AdminUpdateRoleV4' test.out

#- 332 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId '19cborUHeCpqnZ5N' \
    --body '{"permissions": [{"action": 100, "resource": "DfI8QtgODk9K6DcM", "schedAction": 27, "schedCron": "CDRTcsAHzD3dZyyW", "schedRange": ["bUQpbcv3IwmL7a1K", "3zIUYJmdF1YtWNSQ", "lcMzxfppNCrscDPb"]}, {"action": 22, "resource": "fsSxAbDJ7sHCLup8", "schedAction": 32, "schedCron": "6BpCODWGOLMmCZUe", "schedRange": ["elXYyNrXweiCnDld", "RPRfd6mLZ0GTJwEj", "oZrRtaeWKMC8wsOB"]}, {"action": 50, "resource": "5UMa8ymxtEFLwELC", "schedAction": 15, "schedCron": "vIddlxnA1VynioJc", "schedRange": ["APwVHUGcs1ACMvoY", "4jWH9dFmOHW0j9su", "ukPE4JwQONQ2vCbM"]}]}' \
    > test.out 2>&1
eval_tap $? 332 'AdminUpdateRolePermissionsV4' test.out

#- 333 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'n0Oia336uiiMTAdu' \
    --body '{"permissions": [{"action": 4, "resource": "busO6EyVqstpgZpb", "schedAction": 52, "schedCron": "iZlOpIQ8GL7jBF1R", "schedRange": ["5OexAPzCG6ZKQClG", "c1636nbfM3J9G40Y", "62bCo941ALznQuHV"]}, {"action": 38, "resource": "bt6t0w8LOBxE15JY", "schedAction": 19, "schedCron": "j0oOmBmXu1KiTTiz", "schedRange": ["7yrIvQj2isN7bRwc", "r16lW5YwgZpjlMMt", "PWg8217m7qNkQiKp"]}, {"action": 16, "resource": "oac8QTNEuBbeuQqm", "schedAction": 61, "schedCron": "wM7mgTtUdPVcQijM", "schedRange": ["Bhs0kDP6d3nuUZ41", "mSeS9SnGqhJOvykB", "cDpzD9zh6dtPK4fV"]}]}' \
    > test.out 2>&1
eval_tap $? 333 'AdminAddRolePermissionsV4' test.out

#- 334 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'HLMvrCsH3RYxH2Up' \
    --body '["9VthPjFrK7Hip0eO", "NFDgUPShG8wwFKY9", "AMpcwJd4SrigIxAh"]' \
    > test.out 2>&1
eval_tap $? 334 'AdminDeleteRolePermissionsV4' test.out

#- 335 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'bFMZfxaznlDQbzTi' \
    --after 'FrQB1yUonirH4URx' \
    --before '3NkKQBYrlUaMiFEW' \
    --limit '95' \
    > test.out 2>&1
eval_tap $? 335 'AdminListAssignedUsersV4' test.out

#- 336 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId '51z7i0wQ9egK2t46' \
    --body '{"assignedNamespaces": ["EG8I2lTviKbOgVuN", "3nhkn6QIesNoYqvV", "sakylHikKkpOjqwg"], "namespace": "KvfXXs8pDqm31AZS", "userId": "Rkuw6q8FgqG46RsF"}' \
    > test.out 2>&1
eval_tap $? 336 'AdminAssignUserToRoleV4' test.out

#- 337 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'K7eYlSU3vYcHZZjF' \
    --body '{"namespace": "egVnZOn0tk4IATSI", "userId": "efcqNEn4IZ0Dv6b8"}' \
    > test.out 2>&1
eval_tap $? 337 'AdminRevokeUserFromRoleV4' test.out

#- 338 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["WtaMVvLbG04KKnh3", "jvW0Qp3kTyL4CsLw", "iWUMcpxn4B6XoTNM"], "emailAddresses": ["uqZTHwo1IAJQpb6r", "8ZeaSHwQuiH3Ozu4", "G6bXxp0gYZyF9fJB"], "isAdmin": false, "isNewStudio": false, "namespace": "SOrF9Dg4FcDwBGyB", "roleId": "iHewZkwEeuzBBRSk"}' \
    > test.out 2>&1
eval_tap $? 338 'AdminInviteUserNewV4' test.out

#- 339 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "nxyWkZObuvig8sMu", "country": "ss76ezTrsDZNYUV4", "dateOfBirth": "8Oh6I45X7HvUtPYO", "displayName": "NZdFk75lkjQNHrja", "languageTag": "boGomguUqeuZh5qt", "skipLoginQueue": true, "uniqueDisplayName": "z7sVnMxge2inL8fB", "userName": "FP1ABaIKrEt8d3o7"}' \
    > test.out 2>&1
eval_tap $? 339 'AdminUpdateMyUserV4' test.out

#- 340 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 340 'AdminDisableMyAuthenticatorV4' test.out

#- 341 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'cTS9OIIMErnNTLXH' \
    > test.out 2>&1
eval_tap $? 341 'AdminEnableMyAuthenticatorV4' test.out

#- 342 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 342 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 343 AdminGetMyBackupCodesV4
eval_tap 0 343 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 344 AdminGenerateMyBackupCodesV4
eval_tap 0 344 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 345 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 345 'AdminDisableMyBackupCodesV4' test.out

#- 346 AdminDownloadMyBackupCodesV4
eval_tap 0 346 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 347 AdminEnableMyBackupCodesV4
eval_tap 0 347 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 348 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 348 'AdminGetBackupCodesV4' test.out

#- 349 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 349 'AdminGenerateBackupCodesV4' test.out

#- 350 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 350 'AdminEnableBackupCodesV4' test.out

#- 351 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 351 'AdminSendMyMFAEmailCodeV4' test.out

#- 352 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 352 'AdminDisableMyEmailV4' test.out

#- 353 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'rsOFsbhRow4iaYKy' \
    > test.out 2>&1
eval_tap $? 353 'AdminEnableMyEmailV4' test.out

#- 354 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 354 'AdminGetMyEnabledFactorsV4' test.out

#- 355 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor '0IjsDgbJ37DN2lDv' \
    > test.out 2>&1
eval_tap $? 355 'AdminMakeFactorMyDefaultV4' test.out

#- 356 AdminInviteUserV4
eval_tap 0 356 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 357 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'dh7okHl1wMht2Izq' \
    --linkingToken '7TCUJhDsDefAS09V' \
    --password 'yQB1vR1mx6K17GL1' \
    --username 'CrO4ZuoGZSxTzm8o' \
    > test.out 2>&1
eval_tap $? 357 'AuthenticationWithPlatformLinkV4' test.out

#- 358 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'MSPIHPtqzIWIzg8p' \
    --extendExp  \
    --linkingToken 'bjnt1iBV8DpbjGts' \
    > test.out 2>&1
eval_tap $? 358 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 359 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code '4UZDTfhAyZKhqilt' \
    --factor 'y9NVlgxUmnfdOAmu' \
    --mfaToken '1dX1NqD20RUvvYeJ' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 359 'Verify2faCodeV4' test.out

#- 360 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'Zw6QZFN7wFCnqpvN' \
    --codeChallenge 'esGiVnt9p2to7Yja' \
    --codeChallengeMethod 'plain' \
    --additionalData 'yvib9CDW21ANrlpu' \
    --clientId 'XD9H1u1CvzWPcZwk' \
    --createHeadless  \
    --deviceId 'j1l6bf2F9EXOBj7v' \
    --macAddress '8LHYivmD0ekycMKl' \
    --platformToken 'wJTNL2UCWUtaAD7Z' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 360 'PlatformTokenGrantV4' test.out

#- 361 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'Zx1iefATWcDSqGYR' \
    --codeChallengeMethod 'S256' \
    --simultaneousPlatform 'pspc' \
    --simultaneousTicket '5dREQbCqfh0gpABF' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'CX0hpB1ZGMMo5DSo' \
    > test.out 2>&1
eval_tap $? 361 'SimultaneousLoginV4' test.out

#- 362 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'zCuFsrBMtoOeLfMC' \
    --codeChallengeMethod 'plain' \
    --additionalData 'LZBktk0siMup01ky' \
    --clientId 'aFwwD7wecuQb4GNQ' \
    --code 'HVZMKGBnzh4suaGI' \
    --codeVerifier 'zttTncVBf5g3oeuH' \
    --extendNamespace 'iNyLkfPQPmjUkvSs' \
    --extendExp  \
    --loginQueueTicket '5YmIejozmG5HlrIf' \
    --password 'MAvvpkAHRJHZyfrX' \
    --redirectUri 'ZmiJX4CjKCeIRIr9' \
    --refreshToken '97KKpJXTLbYWpqeX' \
    --username 'jaf1f5fjNMZjKJ05' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 362 'TokenGrantV4' test.out

#- 363 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'cxh0x7T6RQGnnW4u' \
    --code 'gGX6mKBbgTD9xL07' \
    > test.out 2>&1
eval_tap $? 363 'RequestTargetTokenResponseV4' test.out

#- 364 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "zzIs3Jke34ZAUuLP", "policyId": "897ooMLnemwKAvgD", "policyVersionId": "XNrFEE4Jf4hQpsLO"}, {"isAccepted": false, "localizedPolicyVersionId": "yeHmfoFkUDP864sh", "policyId": "bnQ3bVvuvpsDJXPC", "policyVersionId": "WkX4Kpi8CJ88aMPG"}, {"isAccepted": true, "localizedPolicyVersionId": "RWvLRy58UKWPv3F7", "policyId": "S0wCVlYQi9cfMCeN", "policyVersionId": "nu6OIG1PPLRDEXLX"}], "authType": "EMAILPASSWD", "country": "30HNBYZSrz7pMjES", "dateOfBirth": "LLMPKDXLki6Oz5By", "displayName": "gt8Q0RjSf1srB7hG", "emailAddress": "wGbUmQmJHNffZENs", "password": "9X0hFMdzryvhc1Yj", "passwordMD5Sum": "HmmulSBIElc2CdRv", "uniqueDisplayName": "Bb0aGnMt625bWHb5", "username": "sbX6asrjV7XJUOtH", "verified": false}' \
    > test.out 2>&1
eval_tap $? 364 'PublicCreateTestUserV4' test.out

#- 365 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "p71zEPPfmAQiqRRC", "policyId": "2caquMRtQOILcaDq", "policyVersionId": "UITBHQR5ISNoFR3G"}, {"isAccepted": true, "localizedPolicyVersionId": "xdMuvmL0UBfwzaae", "policyId": "P3Wd0Wrb8s3GW0CY", "policyVersionId": "0vAfbq8xoCurq4lp"}, {"isAccepted": true, "localizedPolicyVersionId": "rbVBh60NUA2aKQwn", "policyId": "Xrmi6ya8u4sQPvaf", "policyVersionId": "1AcweR7tJW3MLMob"}], "authType": "EMAILPASSWD", "code": "hUnIzIpUM8KK1kGF", "country": "N0NUNGKxdlAUDFQu", "dateOfBirth": "GPzAuT7M6OBrNwio", "displayName": "KnXPVZaDcXsV1Tns", "emailAddress": "ZioDiBgprzahPB0F", "password": "KMa0YeyNBQWUHDBn", "passwordMD5Sum": "BeePkqg6Zt1Lr5Bl", "reachMinimumAge": false, "uniqueDisplayName": "8K6LH4dSaa8XYHug", "username": "51ZTogG0N7Hvnuq1"}' \
    > test.out 2>&1
eval_tap $? 365 'PublicCreateUserV4' test.out

#- 366 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'kJ1kpHcQtnIc9z70' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "FQMI0oZuEjY0rNBb", "policyId": "bB9txAvtRQvqJacX", "policyVersionId": "R2Rf4noXDFaEUkPU"}, {"isAccepted": true, "localizedPolicyVersionId": "Yz2zMU9jLzNV3GaG", "policyId": "43R6nlRPrEAYqRBe", "policyVersionId": "Sc5uShoj3dGHMeoi"}, {"isAccepted": true, "localizedPolicyVersionId": "DBOsQ0Gax0iX05IT", "policyId": "9Agsjl5NmnSHhxNm", "policyVersionId": "Ce4txY0MsPc9EMgf"}], "authType": "EMAILPASSWD", "code": "CJiEvhL8ZfwCVJW9", "country": "yspUOyHC9eKeXzrv", "dateOfBirth": "zBllwzyC1aTWEmPg", "displayName": "oy4TkpEw4Zeid4mR", "emailAddress": "oFNxv10ckMQVjKk3", "password": "bWJ0ZuYSe3sI0x2h", "passwordMD5Sum": "c8vaN1Off5gRZZMW", "reachMinimumAge": true, "uniqueDisplayName": "huAIzBPWBYKAEFTd", "username": "lKNh6GTzKjsCqxx2"}' \
    > test.out 2>&1
eval_tap $? 366 'CreateUserFromInvitationV4' test.out

#- 367 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "4QM35bSkFrvGciNH", "country": "b7OY5YIpOLJW52uz", "dateOfBirth": "3c8pz63M0g4xXT5T", "displayName": "s4e0uR47OzUGHeBK", "languageTag": "tpvyRNgjZkdDppvE", "uniqueDisplayName": "JiUiDGXgh8BKcLqt", "userName": "RZ93LuR8OEyICvwg"}' \
    > test.out 2>&1
eval_tap $? 367 'PublicUpdateUserV4' test.out

#- 368 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "wBFehwtdJLdn3R2w", "emailAddress": "o8beVQvgeP9qOHaL"}' \
    > test.out 2>&1
eval_tap $? 368 'PublicUpdateUserEmailAddressV4' test.out

#- 369 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "wYnXxrz7sLmP70Lx", "country": "N0f3JA27Qz5SjzQf", "dateOfBirth": "OLYu9O46OOzz9p57", "displayName": "qSpHerzO87cg7Tqt", "emailAddress": "MiQgi7Aj28qCRbww", "password": "Zc4ZS1NMkrnHs1Iy", "reachMinimumAge": false, "uniqueDisplayName": "AWnxkImVbDP0QX31", "username": "gI7VmnGIRMvXe6Bi", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 369 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 370 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "6DrSycophHw3EoEE", "password": "ClTO9SDKnMlnKW9j", "username": "iNMu9QVrMeD4bD8g"}' \
    > test.out 2>&1
eval_tap $? 370 'PublicUpgradeHeadlessAccountV4' test.out

#- 371 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 371 'PublicDisableMyAuthenticatorV4' test.out

#- 372 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'ISE34yIAZQeigiA3' \
    > test.out 2>&1
eval_tap $? 372 'PublicEnableMyAuthenticatorV4' test.out

#- 373 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 373 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 374 PublicGetMyBackupCodesV4
eval_tap 0 374 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 375 PublicGenerateMyBackupCodesV4
eval_tap 0 375 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 376 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 376 'PublicDisableMyBackupCodesV4' test.out

#- 377 PublicDownloadMyBackupCodesV4
eval_tap 0 377 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 378 PublicEnableMyBackupCodesV4
eval_tap 0 378 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 379 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 379 'PublicGetBackupCodesV4' test.out

#- 380 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 380 'PublicGenerateBackupCodesV4' test.out

#- 381 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 381 'PublicEnableBackupCodesV4' test.out

#- 382 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'wBrmBYIlZeheP72A' \
    > test.out 2>&1
eval_tap $? 382 'PublicRemoveTrustedDeviceV4' test.out

#- 383 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 383 'PublicSendMyMFAEmailCodeV4' test.out

#- 384 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 384 'PublicDisableMyEmailV4' test.out

#- 385 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'B8EO3YrlyrWowUpU' \
    > test.out 2>&1
eval_tap $? 385 'PublicEnableMyEmailV4' test.out

#- 386 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 386 'PublicGetMyEnabledFactorsV4' test.out

#- 387 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'DVLlTtuJJsHZVsG6' \
    > test.out 2>&1
eval_tap $? 387 'PublicMakeFactorMyDefaultV4' test.out

#- 388 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'izJZruOJvSRFLDSd' \
    > test.out 2>&1
eval_tap $? 388 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 389 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "j8elbtHvDU91DmHz", "emailAddress": "wiqVPCJ5j18Ou3aY", "namespace": "8nceFU5GKmcEKp8A", "namespaceDisplayName": "QwqgJs6O0Qj0ccMk"}' \
    > test.out 2>&1
eval_tap $? 389 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE