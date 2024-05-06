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
echo "1..394"

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

#- 125 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["wiJCf2XJVrlzqQls", "1ozhLVA3kE8jKvga", "tOEBM70TdlNBJYOm"], "clientUpdateRequest": {"audiences": ["pu1VCarzBsV6xnZ5", "Jrzzjrcaug6CWVG8", "SWP3glU6muswVJnN"], "baseUri": "nN7kAa7j0riFc5HT", "clientName": "HQIoVsGo7dwV9DBq", "clientPermissions": [{"action": 64, "resource": "MdAdiPKDUVSC00PY", "schedAction": 9, "schedCron": "oujQD4IEiH9Z5qXn", "schedRange": ["3aoRtlqOECohViHA", "5CzgFSy8X1A3PrIf", "apq5AAeMe4L3mDWO"]}, {"action": 90, "resource": "4pCAKxeE70CaunQN", "schedAction": 48, "schedCron": "iXNMR9BgaWcFX3SU", "schedRange": ["BhyoTsMWPAxUMkaw", "aGpAyrIwMif3BOdk", "ocVTd4BxqGWV6mTJ"]}, {"action": 51, "resource": "sQs6XNbjvqhnUVLW", "schedAction": 42, "schedCron": "v2LFjAKY7CbgsWqF", "schedRange": ["WZX7kPBom8F9GLLT", "G8phc3n4iLoIllKl", "pO2pqiXJF3WGRaoQ"]}], "clientPlatform": "omSJC4DdrKF7SUQP", "deletable": true, "description": "G59e0k5ZtX6wK7Pp", "modulePermissions": [{"moduleId": "UlcIW32iK7MGt1ix", "selectedGroups": [{"groupId": "Y5rA1WoVeJIePF8Z", "selectedActions": [36, 9, 87]}, {"groupId": "DyF97lGdMiHKxbWC", "selectedActions": [73, 53, 40]}, {"groupId": "o8yO2KTK9tmmOnYn", "selectedActions": [83, 32, 0]}]}, {"moduleId": "Rb3z7CYLM8IlsHqf", "selectedGroups": [{"groupId": "fnrfsGlfPaZKBwa3", "selectedActions": [60, 47, 7]}, {"groupId": "aCgcGLuC3brWdTYC", "selectedActions": [11, 23, 69]}, {"groupId": "Vf4jvapseE9LN9bv", "selectedActions": [14, 36, 84]}]}, {"moduleId": "Gysryod3dNQrmsAp", "selectedGroups": [{"groupId": "RA6HX3RwrKt2ecoz", "selectedActions": [77, 28, 93]}, {"groupId": "EhoXmM2W7l6jHMA2", "selectedActions": [37, 67, 22]}, {"groupId": "3nakopAywelu01nr", "selectedActions": [50, 42, 62]}]}], "namespace": "samANkZlOX9Sfo95", "oauthAccessTokenExpiration": 69, "oauthAccessTokenExpirationTimeUnit": "0iktm0ZPLkLOsp0L", "oauthRefreshTokenExpiration": 3, "oauthRefreshTokenExpirationTimeUnit": "5njN86Hl8kUXzt6b", "redirectUri": "Sc6bWvgpVyW9dD1k", "scopes": ["OmvrAejcq2LgkQua", "S7RBx3vim02jBOxr", "ZDyvpcLYOWA8NjxO"], "skipLoginQueue": false, "twoFactorEnabled": false}}' \
    > test.out 2>&1
eval_tap $? 125 'AdminBulkUpdateClientsV3' test.out

#- 126 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["Ur9Sk4lq2faBcAXX", "KlhvyH8paOJtxqMP", "pcVfRwNj547fH0Xr"], "baseUri": "KEDpEY8VnocGAjci", "clientId": "0V3tBf2jnHGKXphn", "clientName": "50c9tNLDljhZ2jxL", "clientPermissions": [{"action": 89, "resource": "acR0LgB5BUXvjcu2", "schedAction": 37, "schedCron": "os4yBRjrERHEonAZ", "schedRange": ["R8GmEu0q1p6QCyY6", "vSkVFWdsbYuVEGVx", "YheR3j5mNZ6vwv7K"]}, {"action": 54, "resource": "8gxefTYKhuxaEc7M", "schedAction": 85, "schedCron": "NvZ85DDKDAF8KDsB", "schedRange": ["ZOuYQJ03BAHZ7c53", "q7akMpcmnnx6RVBr", "op9v7aZK3h65hbN1"]}, {"action": 46, "resource": "zfQSfQrtfF3TQN0O", "schedAction": 4, "schedCron": "Q40kepEaC4dfiOMZ", "schedRange": ["fEhHr39pysFO3Zvc", "1BZG99LyvfvHEsJK", "QQewVLMUoAnaRcYp"]}], "clientPlatform": "7FUjfIGaffoflEIB", "deletable": true, "description": "VsF6xG2mXEQdbzIV", "modulePermissions": [{"moduleId": "y8alncV7vWgSHdfo", "selectedGroups": [{"groupId": "07UctPErqxyMyOK0", "selectedActions": [79, 91, 34]}, {"groupId": "ETWjteoc8fgvZDDh", "selectedActions": [29, 25, 82]}, {"groupId": "RDcrg0DjQjBECXve", "selectedActions": [0, 93, 68]}]}, {"moduleId": "mZEiwxxElpMYSWIe", "selectedGroups": [{"groupId": "Vzm7z9noowmlTIKV", "selectedActions": [29, 59, 47]}, {"groupId": "FkIf5weqZ18MH57l", "selectedActions": [87, 39, 52]}, {"groupId": "rh90ETtYmGukz3Mn", "selectedActions": [23, 46, 36]}]}, {"moduleId": "7wu9TmXfJWBPrx9N", "selectedGroups": [{"groupId": "s8eLzYEvwSWTaLQj", "selectedActions": [5, 18, 40]}, {"groupId": "CMW64f4XhIjSoTB2", "selectedActions": [80, 55, 79]}, {"groupId": "tYoFzLAATPY8P8P3", "selectedActions": [5, 49, 10]}]}], "namespace": "BGtEJIYppuUSsKoH", "oauthAccessTokenExpiration": 46, "oauthAccessTokenExpirationTimeUnit": "0KK5rgAGO0dW8rX2", "oauthClientType": "MVUGKSZ4GcLkt4pK", "oauthRefreshTokenExpiration": 96, "oauthRefreshTokenExpirationTimeUnit": "2sJxlZcCTpTdRtCH", "parentNamespace": "vuk6B6XTmSLyn50s", "redirectUri": "igBVZxiKdV57GvRy", "scopes": ["d9UuL02Le8HSCsls", "Dd4M1F5qRIblS7Nz", "81GRazPAANjfBold"], "secret": "FOyqA2clJ5gEOaCg", "skipLoginQueue": false, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 126 'AdminCreateClientV3' test.out

#- 127 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId '6RugbNEIpGBFUjOn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 128 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId '5mM7k8nbLzvtCIW5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'AdminDeleteClientV3' test.out

#- 129 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'ynMKquUicAeIVXto' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["WAXhMlW4tLqX7OIC", "f5oD1e6oI9FmYel0", "kOw72o8Zkgk0jS6r"], "baseUri": "DWUwfhKvrf2AaH4y", "clientName": "CWrHSppnIZkNnTn3", "clientPermissions": [{"action": 37, "resource": "Gj2jZtEYT8sIPSE1", "schedAction": 96, "schedCron": "XPzySa0sZoFS6xCO", "schedRange": ["WMpyh9pMsQgb64EL", "bzDMwyo4nIRysQdb", "ufXjYnSoIFeouC2m"]}, {"action": 42, "resource": "8kXrDZWlGVE9sJ4N", "schedAction": 32, "schedCron": "mBVVFfpqx1AeLtzc", "schedRange": ["PJ3jtDYBo4FUTH7C", "GfKSyxgRR1DiCqSM", "zpqIFGLkDs7ACC1R"]}, {"action": 12, "resource": "Xz0UV31MfuGaXsAu", "schedAction": 66, "schedCron": "LE35YhyiDV90SeI5", "schedRange": ["yppBHoytVznCgNyx", "9fbT63ShEh8PbGik", "Ljgjcj34uulU6FYB"]}], "clientPlatform": "ZsWFbr3RSP0W9nBh", "deletable": true, "description": "2mK8lbSEEelxnb5Q", "modulePermissions": [{"moduleId": "xWG2HFnZlA6HKWW4", "selectedGroups": [{"groupId": "fI1IQcoBQELcNlZk", "selectedActions": [34, 93, 6]}, {"groupId": "rKgXNwvm4e5GX6H7", "selectedActions": [29, 83, 1]}, {"groupId": "ixhtAoKiVm6URT95", "selectedActions": [15, 28, 94]}]}, {"moduleId": "UcvWB28MpusuhhDJ", "selectedGroups": [{"groupId": "5slzgiWZEtyd56Lf", "selectedActions": [48, 8, 27]}, {"groupId": "hQ2aTjTDfKFDXC7e", "selectedActions": [66, 76, 42]}, {"groupId": "YhJDWh9YWqc0qgV6", "selectedActions": [8, 21, 49]}]}, {"moduleId": "NjCMDtDMrentgn3D", "selectedGroups": [{"groupId": "hqciwIeShF9RKb9v", "selectedActions": [45, 48, 44]}, {"groupId": "uJlhXbWhbwPwToC6", "selectedActions": [22, 28, 39]}, {"groupId": "jVwVnzaqSfJiQFC2", "selectedActions": [13, 87, 29]}]}], "namespace": "IZsUf8lGFXcmwTER", "oauthAccessTokenExpiration": 69, "oauthAccessTokenExpirationTimeUnit": "JWwfCjYwWkLob9gK", "oauthRefreshTokenExpiration": 77, "oauthRefreshTokenExpirationTimeUnit": "db8Otq6j1mqUav7k", "redirectUri": "05HAQltnSojV4jT6", "scopes": ["5yclX2FtAz0vJjFI", "YWOaNdsimmkW2miH", "3xRHAKy4QxZkaXZ7"], "skipLoginQueue": true, "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateClientV3' test.out

#- 130 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'NHDOQe91Ps3ztUIV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 81, "resource": "dS6hIH9c4Vfkyrwp"}, {"action": 41, "resource": "eMgsRsmH1EQrYmkP"}, {"action": 74, "resource": "t1mr9EOIFg0dnWIY"}]}' \
    > test.out 2>&1
eval_tap $? 130 'AdminUpdateClientPermissionV3' test.out

#- 131 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'N2NVL70Iw157g00j' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 35, "resource": "6WmOt6D7ufFVTOhv"}, {"action": 87, "resource": "YxEQdf3ewoGGoY7x"}, {"action": 26, "resource": "wySoltDxsbzxrlaK"}]}' \
    > test.out 2>&1
eval_tap $? 131 'AdminAddClientPermissionsV3' test.out

#- 132 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '63' \
    --clientId 'iS76YApGJ9ufwLYk' \
    --namespace "$AB_NAMESPACE" \
    --resource 'qIgLuZS6hsQryiEt' \
    > test.out 2>&1
eval_tap $? 132 'AdminDeleteClientPermissionV3' test.out

#- 133 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey 'OAbpeUNf26UqkCfg' \
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
    --body '{"blacklist": ["CUYBn2xaOBdPF0Jm", "X8qwU1cTuHHPB5S3", "DvPRCzBrVUxmDOj3"]}' \
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
    --limit '5' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 139 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 140 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vRFaTC11W0TGTCm4' \
    > test.out 2>&1
eval_tap $? 140 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 141 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fZWuk6pQxDQpKqxL' \
    --body '{"ACSURL": "GeMvr9TsvcMQ7dBs", "AWSCognitoRegion": "aIecRxIsZvD6rmzV", "AWSCognitoUserPool": "r5XT1Nxw0v1dMQ9R", "AllowedClients": ["rbk6C2cVWf6ttvbU", "1PO6ApCD2VXidT7w", "0Oc15N8WXBPp17PA"], "AppId": "ewqSm5x3B4t7WQnp", "AuthorizationEndpoint": "8jXZedgt5cyNe27H", "ClientId": "LtwtVOaxgP6Jbct8", "Environment": "puMybYGxD9IPmmsL", "FederationMetadataURL": "mu3kaPj0O4zd8Tb7", "GenericOauthFlow": false, "IsActive": true, "Issuer": "UNGPTBxiFFCrn7dj", "JWKSEndpoint": "js69FTFVGUVhvKhJ", "KeyID": "Cmeisql14mUHVbMP", "NetflixCertificates": {"encryptedPrivateKey": "imNhcZsU3VAdMDcb", "encryptedPrivateKeyName": "4qlkiFAamqvZI2Kw", "publicCertificate": "jqPBiWXade41s3rH", "publicCertificateName": "34mB2yPlRpWjmHZA", "rootCertificate": "AvKTH8MuqIg0Czkg", "rootCertificateName": "uwuJCW7EEFB67AOD"}, "OrganizationId": "bi9BzupBsFpYc77G", "PlatformName": "tRUcCFeY5g4XgBsb", "RedirectUri": "fzqxBPNe8ae1Il4a", "RegisteredDomains": [{"affectedClientIDs": ["AtEbu4IjGdqthRxT", "jQ7gkZEY8rG0q0Q2", "Qd2JzRbkF2I03dIj"], "domain": "vBbA6bfbYaJCJjfk", "namespaces": ["2TUvn95FhO7VW3mb", "DVMDu87t0ldWf7iS", "GIiKFtWtn4Yr2svK"], "roleId": "M6pqLGZ0TBujELAU"}, {"affectedClientIDs": ["K6mQ5iZgbwwm5iGz", "XtcknrgidKupvXO6", "aj4hCmTC34jxW4pI"], "domain": "DwdqXpmRmut9H9Xy", "namespaces": ["WI8bp8fQxRuX91uY", "mtrHJbEGTUj7YjER", "L1rEQG02zccA8wvL"], "roleId": "sWUNd6lPKvqDejvq"}, {"affectedClientIDs": ["klTSvDwuOrP9lzpi", "X0VuFpZum7izxe7N", "PzjOa8E7wY76PxLv"], "domain": "9HBEUe89AwEw1HO4", "namespaces": ["FnKtx4XLKAmlDr19", "uJ3nq6VerzVCcI8y", "3Cz0YqCKUh5RD9vN"], "roleId": "Ap4jinFpnQ5xF9ww"}], "Secret": "bvMZyeDeRnVfPUa6", "TeamID": "xVVBcq3wZpFIYeAg", "TokenAuthenticationType": "79HcLJXJ7mpVI6eT", "TokenClaimsMapping": {"YAjdPlCiQQC35cj4": "KyOVgvnWbfRJtsB7", "cUQZ2QUAxJrINPXp": "pPNO3AfmXcgwC3IN", "6tvKgLB9QmJIOq9d": "P5szG71utjsQ4CrR"}, "TokenEndpoint": "b9gUCeVz7fWbZIdh", "UserInfoEndpoint": "evfZvyV7AcodcZwK", "UserInfoHTTPMethod": "jYDdmJOlzwm9Su4F", "scopes": ["nS98QqftSjq7sn8y", "reciPLfkVyyJsbGp", "O6JgehDJxEN7JlZc"]}' \
    > test.out 2>&1
eval_tap $? 141 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 142 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8LMq1o2jZWu4yA3r' \
    > test.out 2>&1
eval_tap $? 142 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 143 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0u4q1bTHXIjfJKyF' \
    --body '{"ACSURL": "lM0u1uuoVdn9yVoS", "AWSCognitoRegion": "lKNchPHNL4X3LLaG", "AWSCognitoUserPool": "PGdqLE8SohhhuiTn", "AllowedClients": ["JarYYkHBDdSzBXdx", "apwhd5IQYBQuxLvP", "uWYvE3fsNy9Z9Ohx"], "AppId": "XvCp9y7fLD2qfCXn", "AuthorizationEndpoint": "lUnqxT1WsRNMZcA9", "ClientId": "2hzC7MNa8vVe4MHX", "Environment": "6AgMep90AyyUJyAK", "FederationMetadataURL": "5PRMRMwdvl0hv6g6", "GenericOauthFlow": false, "IsActive": false, "Issuer": "xBW2tQF5tkTjgJaM", "JWKSEndpoint": "YvNQOsDa4bkcgepq", "KeyID": "txjbrztee7QLTGAa", "NetflixCertificates": {"encryptedPrivateKey": "k7Kaol01DK97D2xn", "encryptedPrivateKeyName": "ik42miteR5eQAe1r", "publicCertificate": "zmmgqBPRmd6mO4oI", "publicCertificateName": "8KDqebm83raNBJ5y", "rootCertificate": "7axEkvI4oxZEDxGi", "rootCertificateName": "BnNbn0zaf7CaOSlH"}, "OrganizationId": "XrUSA6sMJzA5mtqI", "PlatformName": "SQ83TTbtefXWznDe", "RedirectUri": "4LQdXfFBii2RAMEX", "RegisteredDomains": [{"affectedClientIDs": ["5RMjBFVZGYzQqV8d", "9mDdUIoiIJFNxuNO", "mUSWw18T1IxVWCxd"], "domain": "vPL9e4P01vxP8xj1", "namespaces": ["LyEirURERnEMzpIm", "W6sjAHyCK5tNanGB", "rkzUvck3xTtmOFMe"], "roleId": "bS4AdlNzwog2IhEr"}, {"affectedClientIDs": ["kNhNcECWwchW6zL9", "SkbLlrNXnGanMazb", "8jvRWenURH48aJuA"], "domain": "LEcSqcE15u6D31Dj", "namespaces": ["Osrs3CUYATdqnQGb", "qiqOkNeATj7eGjod", "d7CcJUrI6MAugK5k"], "roleId": "ypNrp2nFe9FmN86s"}, {"affectedClientIDs": ["K5LOq4ft5jGcMICP", "UYnfG6jl9U4jRete", "IMgzISomCsodJrhQ"], "domain": "W41q2OspCZbt3Uta", "namespaces": ["5I0uGcL1koyHjCH5", "olYLETRpABAmO2EG", "vJ4UMS93yOxNInDB"], "roleId": "yhnoluO6ti0QP2ss"}], "Secret": "iJ66OzOj84O6tgoh", "TeamID": "jtC7bzjPpucddXJ5", "TokenAuthenticationType": "zifF8y959anrNSle", "TokenClaimsMapping": {"ywHbHig6IKWVZ77K": "eRWdECaFGzfZ2hxc", "J2Fnemn7M23SzUo4": "hNBDh9ZFP1OW0nXO", "ErQPS4VsRoYIK69y": "g9ADCGiXaLs2xjHk"}, "TokenEndpoint": "inOD975nARHCmhNH", "UserInfoEndpoint": "SXuqIHsxvaUoXDmw", "UserInfoHTTPMethod": "WsukxncuD3QxCXMd", "scopes": ["00YBWCaVVmM45mfI", "ZsWhkS476dGGJwJ0", "0UH197MJ6zU7JLMQ"]}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 144 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yMWzYQCAaPJgoxGJ' \
    --body '{"affectedClientIDs": ["oJaSzUtY4ZD0Xtb0", "U4pH16NUsVY21NVI", "s7NRen2Y3Ns0QJQe"], "assignedNamespaces": ["aWytPfds1BYx0EaU", "Rydf8ZyyZeHAWGgJ", "UbUJRMbkcTglbU86"], "domain": "FyOjApNHBVfNOURc", "roleId": "jY3YYT9oTynmfIuB"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 145 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WgJTNFfM8M0IW4oe' \
    --body '{"domain": "8KDgy0xZfAcNg14W"}' \
    > test.out 2>&1
eval_tap $? 145 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 146 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 's8TIP1LKiFQoLDvu' \
    > test.out 2>&1
eval_tap $? 146 'RetrieveSSOLoginPlatformCredential' test.out

#- 147 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mfqrgSfnx2h61X9d' \
    --body '{"acsUrl": "N1MGRXBJ6mVV7JS9", "apiKey": "qjNLwvI8JdiY3RRi", "appId": "LilmOGF6dLLIeIVI", "federationMetadataUrl": "jMcdlbdRXTGIrdNL", "isActive": false, "redirectUri": "q3xjrElvvDgw0ag7", "secret": "kSWE0Hiqm5IuLryi", "ssoUrl": "EXqvUWDjU1G0EVjV"}' \
    > test.out 2>&1
eval_tap $? 147 'AddSSOLoginPlatformCredential' test.out

#- 148 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Zw1ToLuPakQN1MpO' \
    > test.out 2>&1
eval_tap $? 148 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 149 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 's1RVFrcg2CXxepx7' \
    --body '{"acsUrl": "8fvsyhE2BKtyTDSI", "apiKey": "M7mkmvZ7Cmsh4US8", "appId": "o4jfMANPpmZDdMiC", "federationMetadataUrl": "xmuCCVuFjS1GC1d2", "isActive": false, "redirectUri": "umnxAnYBTxaTIz0j", "secret": "cgDI8Pkz96vd80ms", "ssoUrl": "qIm5bufnBqrpLeqh"}' \
    > test.out 2>&1
eval_tap $? 149 'UpdateSSOPlatformCredential' test.out

#- 150 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wVhjnnjKMEmtbiWs' \
    --rawPID  \
    --body '{"platformUserIds": ["AQHbMrKYi0Zxs5SW", "CqZXHLLa31oQf7BU", "LnZDhutDM6BqguqD"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 151 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5xxGxBWtnTKUe2zn' \
    --platformUserId 'sqPzPkwCBo2SwCUs' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserByPlatformUserIDV3' test.out

#- 152 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'Tag4MLAo3m61P2xa' \
    --after '81' \
    --before '10' \
    --limit '64' \
    > test.out 2>&1
eval_tap $? 152 'GetAdminUsersByRoleIdV3' test.out

#- 153 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'mn8Onb1a9gMz0F2U' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserByEmailAddressV3' test.out

#- 154 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["ABPXDmgNEJBhgGq5", "GIDhNC66szbCCf73", "IFbRkPSSITz4TjCr"]}' \
    > test.out 2>&1
eval_tap $? 154 'AdminBulkUpdateUsersV3' test.out

#- 155 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'JHXGXku2YVuOzhxH' \
    --body '{"bulkUserId": ["mnrrV9ZGWrZ05sxe", "6A6RpmKDebNkylby", "nkgT9vayLLiizac7"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetBulkUserBanV3' test.out

#- 156 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Ge6zKJdlt7rjF5Ra", "JwvkWVco2LTo5ijl", "vDF8qBWCQ9dLWYyS"]}' \
    > test.out 2>&1
eval_tap $? 156 'AdminListUserIDByUserIDsV3' test.out

#- 157 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["8zdhMeBXH8x6HdVf", "ZVDAiU6iJOF7JKZF", "Nk2NKy59X8iOg2sV"]}' \
    > test.out 2>&1
eval_tap $? 157 'AdminBulkGetUsersPlatform' test.out

#- 158 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["BiCoeC5weXJl7Pei", "MH8z8dVej8N2yv6V", "TnOK7xAvM7tuL81l"], "isAdmin": true, "namespace": "QvpV344RctmTozCi", "roles": ["8HeV6jbalHmqBBfi", "7sSF5BoGiTCVsXsy", "gWbjE2opXtdsJQeJ"]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminInviteUserV3' test.out

#- 159 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '40' \
    --platformUserId 'U4IK9lOLaZaMphKC' \
    --platformId 'qTq3EVheJjoEEXBL' \
    > test.out 2>&1
eval_tap $? 159 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 160 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 160 'AdminListUsersV3' test.out

#- 161 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'xGnNuhoJM3WWPvvC' \
    --endDate 'iCf33ViEdqQpoGkU' \
    --includeTotal  \
    --limit '100' \
    --offset '100' \
    --platformBy 'Nizk5UcPAGv6c1ES' \
    --platformId 'C6hZYTYZbzf5aANN' \
    --query 'Ns5kgSZZNUHbIT9s' \
    --roleIds 'zApmWJO5vzzXZj08' \
    --skipLoginQueue  \
    --startDate 'a6K1XRVfriSpPFnZ' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 161 'AdminSearchUserV3' test.out

#- 162 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["BJZkDnEiyfa2Lrnp", "ZxNnLRH36bqS2oFY", "76PU1AziBOHEAj1c"]}' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetBulkUserByEmailAddressV3' test.out

#- 163 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'T3u6Zc2FbrTFznTg' \
    > test.out 2>&1
eval_tap $? 163 'AdminGetUserByUserIdV3' test.out

#- 164 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DIwZIRWf6T3by2kY' \
    --body '{"avatarUrl": "SCdnFKLc0xcTjqjd", "country": "cEfU61OJYMnW49rW", "dateOfBirth": "ynp1ck1vT90C6o86", "displayName": "cSRL9cgbUmulhe98", "languageTag": "oaFKlQicdrxVhrtw", "skipLoginQueue": false, "uniqueDisplayName": "AD77ci0vfWVZoRRM", "userName": "Pi57HyKKz5nyI6ul"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserV3' test.out

#- 165 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KNKoXa0dgx1JgjC5' \
    --activeOnly  \
    --after '6pda3YhtQxpCYME6' \
    --before 'x21pdX2QSPAd9sxo' \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetUserBanV3' test.out

#- 166 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'V6tCdrxw1KOPhuvH' \
    --body '{"ban": "uYrGWDK41uMOC0mR", "comment": "vSoaGk4ktF5wnJDg", "endDate": "9Q3WXiydCOInVols", "reason": "r6CHmj763vLwtYEJ", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 166 'AdminBanUserV3' test.out

#- 167 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'SiXjcY5ZPkv90lyK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'STWLxSFZ0LpupEi5' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 167 'AdminUpdateUserBanV3' test.out

#- 168 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cn48bvkCPfKofwXO' \
    --body '{"context": "IZZQAJza84lKKmVO", "emailAddress": "aTS6xBbNrSUAW2ak", "languageTag": "7ISDrBVg6NuDZvPb"}' \
    > test.out 2>&1
eval_tap $? 168 'AdminSendVerificationCodeV3' test.out

#- 169 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1kuUfNfUDe4g7q6P' \
    --body '{"Code": "HEaqbzHvDDl1jiLw", "ContactType": "3XMGBA6JXDpA1tIC", "LanguageTag": "45C0oaGouFu4hXON", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 169 'AdminVerifyAccountV3' test.out

#- 170 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'n8jAdTn6xBhrciry' \
    > test.out 2>&1
eval_tap $? 170 'GetUserVerificationCode' test.out

#- 171 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lm67rkadH5Y41SLj' \
    > test.out 2>&1
eval_tap $? 171 'AdminGetUserDeletionStatusV3' test.out

#- 172 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CPrFa05Xl5TPC5GO' \
    --body '{"deletionDate": 61, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 172 'AdminUpdateUserDeletionStatusV3' test.out

#- 173 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'S44bmm7jPdKLddfd' \
    > test.out 2>&1
eval_tap $? 173 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 174 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sUqjXVzW1QqxnWR5' \
    --body '{"code": "sheLgsAF4ctv5guy", "country": "cGiq9j2EyIknfLDp", "dateOfBirth": "gHnMOn8nc3gUZ8ZF", "displayName": "yyEr0KBXuJBqK4Qt", "emailAddress": "EydPWLPBYiR3UbJc", "password": "1ZYapx7C477etqgf", "uniqueDisplayName": "OJDUT0uKAPrARya2", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 174 'AdminUpgradeHeadlessAccountV3' test.out

#- 175 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MlNiXpF4qvsUUpHq' \
    > test.out 2>&1
eval_tap $? 175 'AdminDeleteUserInformationV3' test.out

#- 176 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'i33TcBGkc0HjUcnk' \
    --after '0.24486638334575606' \
    --before '0.7479261312095513' \
    --limit '72' \
    > test.out 2>&1
eval_tap $? 176 'AdminGetUserLoginHistoriesV3' test.out

#- 177 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oVzl2kBuLFXIeCEK' \
    --body '{"languageTag": "ZUTz3GvCAZ5j24ac", "newPassword": "YHbrryHB6GO9zP3F", "oldPassword": "aepA3b3YJ9nJM6vt"}' \
    > test.out 2>&1
eval_tap $? 177 'AdminResetPasswordV3' test.out

#- 178 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'T27xv85K5MU2qmbe' \
    --body '{"Permissions": [{"Action": 33, "Resource": "CZxxPPdPwOtEuWBS", "SchedAction": 83, "SchedCron": "IEgjse5kd6GEDo08", "SchedRange": ["yq5E5HleLoog4me2", "NBFp62xlXvVcJerT", "PW02PWsHiKYArAxn"]}, {"Action": 75, "Resource": "Lqp8PF5hCcoukWpn", "SchedAction": 3, "SchedCron": "jwMv4vrIPRtvhQIy", "SchedRange": ["LarjaLOKnX51yAB8", "Pa3uNGKhaLlJzJMS", "nJIIgsAVmaGYxUX1"]}, {"Action": 57, "Resource": "4VTsLDRzdq22cbny", "SchedAction": 74, "SchedCron": "g7TVtzYEHUodh3iU", "SchedRange": ["fBthbepUCTWiZ1uq", "h7GAi4FEIu44u83Z", "LRxYlYqlpq03BGdI"]}]}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserPermissionV3' test.out

#- 179 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'k4oEogFVGR71rJOB' \
    --body '{"Permissions": [{"Action": 50, "Resource": "A0tQWlHwBcTtztx3", "SchedAction": 97, "SchedCron": "4YK87DYAWWcbcbGW", "SchedRange": ["mKgE8CZ4AELr5lra", "a5v5P5Cj8hgFsqHC", "9h5JPiMEtgKuiGTY"]}, {"Action": 13, "Resource": "2CX0rITajpwHITGe", "SchedAction": 68, "SchedCron": "n51rVAQSxp4qTB54", "SchedRange": ["mKA3V9DKlCeZ7mLY", "sHooOIaxIpb1cIOJ", "PS3lJ80YJ41U4ooQ"]}, {"Action": 53, "Resource": "0ywmg1pWpWit1QC7", "SchedAction": 65, "SchedCron": "TfyIlAwjTZdRZJJz", "SchedRange": ["WZwvTX2bamSCvX1n", "wvSWdDwD7WJHzgNZ", "UKsI5y0mR3zMyTsf"]}]}' \
    > test.out 2>&1
eval_tap $? 179 'AdminAddUserPermissionsV3' test.out

#- 180 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tKqnsIJctAdxyZVK' \
    --body '[{"Action": 68, "Resource": "hr6ucHf7dbh2iKNU"}, {"Action": 24, "Resource": "HEbVDwBAqanOlscR"}, {"Action": 71, "Resource": "iNjULsx4SnKNXLMU"}]' \
    > test.out 2>&1
eval_tap $? 180 'AdminDeleteUserPermissionBulkV3' test.out

#- 181 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '1' \
    --namespace "$AB_NAMESPACE" \
    --resource 'FldMCQ98JH4n0Jtg' \
    --userId 'qzZv5kVu4S95mj8Y' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserPermissionV3' test.out

#- 182 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rvae4f4lhBPbarbW' \
    --after 'Em8bVtZcfVCPdQhi' \
    --before 'm9QKUAFTVYelIlGJ' \
    --limit '13' \
    --platformId 'hFZZGMTcqnWrIprO' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetUserPlatformAccountsV3' test.out

#- 183 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'v0BJ9Sgl7H1sdH2R' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetListJusticePlatformAccounts' test.out

#- 184 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'IJz1eI7Q5pu9PutL' \
    --userId 'f6IrvZoBGQbO4S3r' \
    > test.out 2>&1
eval_tap $? 184 'AdminGetUserMapping' test.out

#- 185 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'URGWUzPAE6SdV4D5' \
    --userId 'jftRl9rZmtQUvro8' \
    > test.out 2>&1
eval_tap $? 185 'AdminCreateJusticeUser' test.out

#- 186 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'TWwXWsz9TVmdMKEo' \
    --skipConflict  \
    --body '{"platformId": "hKzuMYDUTLBeCidX", "platformUserId": "juGgx8ncXejmeZtz"}' \
    > test.out 2>&1
eval_tap $? 186 'AdminLinkPlatformAccount' test.out

#- 187 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'T0qj0ltsqfiZrthV' \
    --userId 'vyX0OCKDJE3RMUdd' \
    --body '{"platformNamespace": "wSSgxCu8zru1DhGA"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminPlatformUnlinkV3' test.out

#- 188 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YOHR5BWa9VzIkaQE' \
    --userId 'l1iUProNB6hI6IpG' \
    > test.out 2>&1
eval_tap $? 188 'AdminPlatformUnlinkAllV3' test.out

#- 189 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'cToWgFvdRhG9NwV3' \
    --userId 'zDuqVlVTypcYPK8I' \
    --ticket 'xrSZuxWl0Je4fJIy' \
    > test.out 2>&1
eval_tap $? 189 'AdminPlatformLinkV3' test.out

#- 190 AdminDeleteUserLinkingHistoryByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingHistoryByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FAm3DQht4JwnPS2u' \
    --userId 'rJqerobWMZGVL5KL' \
    > test.out 2>&1
eval_tap $? 190 'AdminDeleteUserLinkingHistoryByPlatformIDV3' test.out

#- 191 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TxahWlS6XdBaKSLC' \
    --userId 'gOOPXM6XTUh2dJ90' \
    --platformToken 'yqHDNacl4F9G6Dl5' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 192 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TFwBY6HKXAblkT8V' \
    --userId 'GgSH8MGZGwiVj7eD' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserSinglePlatformAccount' test.out

#- 193 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Taka9ABfX1IByPEO' \
    --body '["uPhGspRi3bhPQvBB", "JI5JxytpcubN4AUU", "PFPscZsXeJOD4DMt"]' \
    > test.out 2>&1
eval_tap $? 193 'AdminDeleteUserRolesV3' test.out

#- 194 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qfIGiGJovgWSRxZ8' \
    --body '[{"namespace": "N4UQ2fg3V1o2x0hL", "roleId": "5DuBDqMyIAzWze94"}, {"namespace": "MEdJFAy2JTllJkRG", "roleId": "B8jqJEd6eqqsBVyO"}, {"namespace": "NV0JRtozI0jpliCF", "roleId": "Q6WgJpGPigdc5VyC"}]' \
    > test.out 2>&1
eval_tap $? 194 'AdminSaveUserRoleV3' test.out

#- 195 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '4qvWjVac1cQvSxgT' \
    --userId 'NIUzxDgBlIbuzm7D' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddUserRoleV3' test.out

#- 196 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'zJ20NFRJIhFXR2dY' \
    --userId 'prPmbpuptECGd5cd' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserRoleV3' test.out

#- 197 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XC2Sesc6y68whNBY' \
    --body '{"enabled": false, "reason": "dG47gD5i2Ni6AnWn"}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateUserStatusV3' test.out

#- 198 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId '3NdEPhNHSH7eKDfR' \
    --body '{"emailAddress": "cngEpTnRUQr3RLOM", "password": "1vEx4gqDY6jwyKRx"}' \
    > test.out 2>&1
eval_tap $? 198 'AdminTrustlyUpdateUserIdentity' test.out

#- 199 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hkLe5zohg9s9utRQ' \
    > test.out 2>&1
eval_tap $? 199 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 200 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 't28b6o3K0COF74tz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "6aeXZOYwbwjMNdxK"}' \
    > test.out 2>&1
eval_tap $? 200 'AdminUpdateClientSecretV3' test.out

#- 201 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'WlBfnRyFS0Ed7gTM' \
    > test.out 2>&1
eval_tap $? 201 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 202 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after '5AVrtBQiDTcNnZa6' \
    --before 'Zuxk6u6HXXdiC9ZD' \
    --isWildcard  \
    --limit '18' \
    > test.out 2>&1
eval_tap $? 202 'AdminGetRolesV3' test.out

#- 203 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "managers": [{"displayName": "g8LSTs7Nf95lGlPr", "namespace": "f6obIdnI6Ag7eUYc", "userId": "YJ4QzXCmqr6gmPGa"}, {"displayName": "HP5SVPvRLiDi0mNH", "namespace": "b6Lx8eq8SGNwEQO8", "userId": "dYXvBSYvJBwb6CjZ"}, {"displayName": "UMRf2VJetWsokvx3", "namespace": "BHuTEczr9KjQ3ttz", "userId": "8MTBt1xk9IyssSA8"}], "members": [{"displayName": "nP5PQjpzk2Tb7iYd", "namespace": "mNZWosrsVBPZ64j0", "userId": "HUONscofwYLQcDvk"}, {"displayName": "aEIIPoJT83zEGXmV", "namespace": "BZLyrH9J7BoysmaO", "userId": "RLkP5hc2Fh04JTsq"}, {"displayName": "DTynCewqJligLlRx", "namespace": "OelKykICRxF6HtlE", "userId": "R2txs4qrNARATn6K"}], "permissions": [{"action": 92, "resource": "OutlYBbLhL8KXx25", "schedAction": 64, "schedCron": "b51y5RUzvMfTkPy0", "schedRange": ["fGvTGgfLKsg0b1Bq", "78cE5O5pmPnbiPJ9", "j4vxmbH3rVaauufx"]}, {"action": 20, "resource": "fkycLSVdleSaAyls", "schedAction": 26, "schedCron": "XUOyToLPIREGIKlJ", "schedRange": ["t3EP9kKwkENQ8VOH", "GwbADMfuOmh0lciR", "hVZ2DeoODXMzLSrz"]}, {"action": 29, "resource": "vhzgsJwex7wq8ZPl", "schedAction": 29, "schedCron": "NaUNgdY2vfJuje5c", "schedRange": ["PnmGjTvYa5Pqx1K7", "qcAoijBPAp6EPb98", "8NzxrDKVpULjjiw3"]}], "roleName": "NeVG4DJi9DaMrc0W"}' \
    > test.out 2>&1
eval_tap $? 203 'AdminCreateRoleV3' test.out

#- 204 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'FgKjE945x2CPVYYG' \
    > test.out 2>&1
eval_tap $? 204 'AdminGetRoleV3' test.out

#- 205 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId '9WvoGmAmvaVV5Yfx' \
    > test.out 2>&1
eval_tap $? 205 'AdminDeleteRoleV3' test.out

#- 206 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'nUNcwjr7gSGhnfuF' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "iQVICVpWd3UM08gM"}' \
    > test.out 2>&1
eval_tap $? 206 'AdminUpdateRoleV3' test.out

#- 207 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'Xhdf3juXW4JprIb3' \
    > test.out 2>&1
eval_tap $? 207 'AdminGetRoleAdminStatusV3' test.out

#- 208 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'CJCAtvSG8Cfa9dzO' \
    > test.out 2>&1
eval_tap $? 208 'AdminUpdateAdminRoleStatusV3' test.out

#- 209 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'JDGCTHIOFjeXbsSg' \
    > test.out 2>&1
eval_tap $? 209 'AdminRemoveRoleAdminV3' test.out

#- 210 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'R43kIDzxBwqRJTzr' \
    --after 'HNZWUsq5lQo2jy29' \
    --before 'EJigqYhyVhURx1yP' \
    --limit '8' \
    > test.out 2>&1
eval_tap $? 210 'AdminGetRoleManagersV3' test.out

#- 211 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'uTw6zQuoZcXQpoTO' \
    --body '{"managers": [{"displayName": "xe8y1jorNsg9ZKYC", "namespace": "KoISyXtHzoWGdYoh", "userId": "xMp3uOQIybqWfG9B"}, {"displayName": "J6FVKlbYHtbPtaxv", "namespace": "agSlpGgVTF6VeDAP", "userId": "OGBwweyFfXEOEAEt"}, {"displayName": "bag82KgBgyCd5vjk", "namespace": "fz3eR4DtNp129hzB", "userId": "w3xLUcCEt0DzmkJq"}]}' \
    > test.out 2>&1
eval_tap $? 211 'AdminAddRoleManagersV3' test.out

#- 212 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId '1sml5bYt76BNsi4g' \
    --body '{"managers": [{"displayName": "iR9434WpKKdzxouf", "namespace": "CNlFoOcWQQy4bjmQ", "userId": "eEweoBHTdwAk7ZQn"}, {"displayName": "bqY1cQwVEtAr5kKK", "namespace": "Ao9MM2Cqm84jVi9k", "userId": "IpqgrzpUkNOBWydX"}, {"displayName": "V0Fi02aFr8CDapjw", "namespace": "NOl4k8rVNrm8drv8", "userId": "QD2JOe2Ntz7EFvow"}]}' \
    > test.out 2>&1
eval_tap $? 212 'AdminRemoveRoleManagersV3' test.out

#- 213 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'PgIGuetxFMqXCQMA' \
    --after 'qQ2ZRGzNtrThFa9X' \
    --before 'U8mosluiHZJ7O8sA' \
    --limit '86' \
    > test.out 2>&1
eval_tap $? 213 'AdminGetRoleMembersV3' test.out

#- 214 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId '4vvn9bk5qr8qs2mq' \
    --body '{"members": [{"displayName": "tnGAqXUjNypF6MMq", "namespace": "WpdEJsPoaIbYz8cK", "userId": "5jlpJdre5ur6yvWJ"}, {"displayName": "DdvM7T7PX2vamIRZ", "namespace": "HzsIYOCUoiCXNjrd", "userId": "QL2jdx1eIba1sB0H"}, {"displayName": "sJ06DzfbzRYt4OVU", "namespace": "yumBeIqdQGZC5kM0", "userId": "3HHijsQRj7N8IAjm"}]}' \
    > test.out 2>&1
eval_tap $? 214 'AdminAddRoleMembersV3' test.out

#- 215 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'sonjj0ZR50BQ1U6a' \
    --body '{"members": [{"displayName": "FD3O2kXQSc58zgZV", "namespace": "l4gIF7v3qbZu9M3O", "userId": "xqVAT4H1lRZ9Z1JB"}, {"displayName": "rHRzEOtIxzPqb6n7", "namespace": "3m0jiaDH86d9rsKg", "userId": "zCsMulpB8HZUtVVa"}, {"displayName": "JCiLgKOwrSfWhT5B", "namespace": "4WedopzwSluBtRFP", "userId": "KThyGnbjmPDKFS6u"}]}' \
    > test.out 2>&1
eval_tap $? 215 'AdminRemoveRoleMembersV3' test.out

#- 216 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId '9FHuv1M3qfch4SqI' \
    --body '{"permissions": [{"action": 97, "resource": "Eg5fNzBVrjo3g8Cf", "schedAction": 88, "schedCron": "5cU66yJaj4ovoKWE", "schedRange": ["4EW0sw8v5peiuxoB", "JATauyD3XCXVMiyE", "vMf9yilUEujk6oqY"]}, {"action": 28, "resource": "KmEMzicbuL2S3RiW", "schedAction": 6, "schedCron": "O3uNbcIDcIyvZbOy", "schedRange": ["1T4hfwkuVykH4Rpf", "mjIXFGZ5PKdbabJI", "kNnt9P1Tkm08luh4"]}, {"action": 6, "resource": "4GqF0NHglOVuNZ9L", "schedAction": 53, "schedCron": "G2wlZkLhuU5FI8Ni", "schedRange": ["jFI0GKwJ3vfXlsAM", "y2Zp2UAGxHnmSxvk", "G9UR5q9neoW6JBcG"]}]}' \
    > test.out 2>&1
eval_tap $? 216 'AdminUpdateRolePermissionsV3' test.out

#- 217 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'p9Rx2RfcRhXpmeeH' \
    --body '{"permissions": [{"action": 7, "resource": "15Kg9U8vrQJXQxoI", "schedAction": 3, "schedCron": "MM47f1UreUpxEkXI", "schedRange": ["bE1ETzRJZKMavu4U", "l2IaieEbPSE7TGke", "HsYsW9oGBN1pYMBw"]}, {"action": 2, "resource": "hJrASBh61hmWKSSr", "schedAction": 65, "schedCron": "SQ9kEeXBZ6FVrBzy", "schedRange": ["hyhoS6a9oe0JaXFp", "ff28uYbe4Cf2HEHv", "VevhISjbtBJUK5fE"]}, {"action": 2, "resource": "OufPSX3PdOU2V9yw", "schedAction": 84, "schedCron": "4oa8UJ34TIedV3Hy", "schedRange": ["oX4VnO2LpBU08wfn", "lHBXFIqFUmgUSMM5", "au8GJT0mkVPI6zUt"]}]}' \
    > test.out 2>&1
eval_tap $? 217 'AdminAddRolePermissionsV3' test.out

#- 218 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'f3QaJPGrTNcXXTUI' \
    --body '["ggoH89QNmI17UDb1", "9R6H7r1ta3m7jK5p", "xe82pgFiAS6piIzm"]' \
    > test.out 2>&1
eval_tap $? 218 'AdminDeleteRolePermissionsV3' test.out

#- 219 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '5' \
    --resource 'Q2OgRucL1jwRXzfj' \
    --roleId 'DZZBmOau6syme06c' \
    > test.out 2>&1
eval_tap $? 219 'AdminDeleteRolePermissionV3' test.out

#- 220 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 220 'AdminGetMyUserV3' test.out

#- 221 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId '6SKLc2mEC3IXl5XC' \
    --extendExp  \
    --redirectUri 'bkOfHaGr5kdazlyp' \
    --password 'vt6lSLfU7HByGXPM' \
    --requestId 'qxj4hBgVY3YAxZLK' \
    --userName 'bcOdyjqf6Q4oiwoJ' \
    > test.out 2>&1
eval_tap $? 221 'UserAuthenticationV3' test.out

#- 222 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'caRMEb15LBlTVufc' \
    --linkingToken '5ZyODR2NVyn4PRqf' \
    --password '3eRbZqBAoKGcVCdM' \
    --username 'iSNV4qBrt1kcLmRv' \
    > test.out 2>&1
eval_tap $? 222 'AuthenticationWithPlatformLinkV3' test.out

#- 223 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData '6EJtl5xWnsb8oWq9' \
    --extendExp  \
    --linkingToken '4RImNWVIJnhhwFDV' \
    > test.out 2>&1
eval_tap $? 223 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 224 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId '1VitaomvWTzdsW4N' \
    > test.out 2>&1
eval_tap $? 224 'RequestOneTimeLinkingCodeV3' test.out

#- 225 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode '70wYS4Kj7Yi2VvoQ' \
    > test.out 2>&1
eval_tap $? 225 'ValidateOneTimeLinkingCodeV3' test.out

#- 226 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'NW8Yc481dYdvGxJA' \
    --isTransient  \
    --clientId 'MDRA1LF7jdWlekFw' \
    --oneTimeLinkCode 'O94VBCV9qJhWva2F' \
    > test.out 2>&1
eval_tap $? 226 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 227 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 227 'GetCountryLocationV3' test.out

#- 228 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 228 'Logout' test.out

#- 229 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'PBujX0geYCpGJM4s' \
    --codeChallengeMethod 'plain' \
    --clientId 'nXuXsGThYZrmm0wr' \
    > test.out 2>&1
eval_tap $? 229 'RequestTokenExchangeCodeV3' test.out

#- 230 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FMnPpWgrQD4hEk0O' \
    --userId 'LjYsnignE7KcMF7f' \
    --platformUserId 'uDbzRRYMNXWUsp1t' \
    > test.out 2>&1
eval_tap $? 230 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 231 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OibJY9aL9ie6vvMb' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 231 'RevokeUserV3' test.out

#- 232 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'iNURrlm88QlKyuoy' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode '8TuNy4ejmVA3vMCs' \
    --redirectUri 'GyPd12B8QNUz0hFF' \
    --scope 'NbH6j2W4roZM2UKA' \
    --state 'XEEsL5D0oiFchQnV' \
    --targetAuthPage 'eq3g2AB2WIRUQmau' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'IY5HXCZ0W4XmWP0H' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 232 'AuthorizeV3' test.out

#- 233 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token '7ocuBAldDSUS7Haa' \
    > test.out 2>&1
eval_tap $? 233 'TokenIntrospectionV3' test.out

#- 234 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 234 'GetJWKSV3' test.out

#- 235 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId '6unq1yQOSRvyiLBR' \
    --factor 'VtIDi2piIQFVmzMi' \
    --mfaToken 'dw70KSahpYZdKZRy' \
    > test.out 2>&1
eval_tap $? 235 'SendMFAAuthenticationCode' test.out

#- 236 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'R9AX7JjxvNZhM84D' \
    --mfaToken 'iZk6ySrB9SVFctW7' \
    > test.out 2>&1
eval_tap $? 236 'Change2faMethod' test.out

#- 237 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'YS0OkL78XeEAtALF' \
    --factor 'I3v8yha4pd5A7MYc' \
    --mfaToken 'pBD6lKNb8RxvN2u5' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 237 'Verify2faCode' test.out

#- 238 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'J7baOeLH19fqBwNb' \
    --userId 'Ne1ffYRtIvQaKyev' \
    > test.out 2>&1
eval_tap $? 238 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 239 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'WYtZjK6J29v8MpBS' \
    --clientId 'po3AKRmnJkzJHAck' \
    --redirectUri 'UyBksYQfDm0RNFwi' \
    --requestId 'z70tRVLMlHi8i9gO' \
    > test.out 2>&1
eval_tap $? 239 'AuthCodeRequestV3' test.out

#- 240 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'VqajUWrgEsWDtaKz' \
    --additionalData 'n8dZwnnGeZsZVgbP' \
    --clientId 'zPFbrOMZMgWkFN7T' \
    --createHeadless  \
    --deviceId 'pkx6GcfyOg6ZUrrp' \
    --macAddress '9ubg9mndW2JKmQaf' \
    --platformToken 'Us2bxYztOEyVbKIf' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 240 'PlatformTokenGrantV3' test.out

#- 241 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 241 'GetRevocationListV3' test.out

#- 242 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token '1ZbzgUwd8DHoCQyk' \
    > test.out 2>&1
eval_tap $? 242 'TokenRevocationV3' test.out

#- 243 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'mXHYmkRlg7gYs6un' \
    --simultaneousTicket 'PYQ9jNQN1di1ldhO' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'BbNPStVBUpKgOssF' \
    > test.out 2>&1
eval_tap $? 243 'SimultaneousLoginV3' test.out

#- 244 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'kz0F36piDYXeHZ7F' \
    --clientId 'Hls3nyvconqbHQqK' \
    --code 'LQKe3xmj6s0GqsWn' \
    --codeVerifier 'cp5LrqbiKudv9z75' \
    --extendNamespace 'SzoCV8ZMi2o1nR48' \
    --extendExp  \
    --password '2D6gNClk9c87hosa' \
    --redirectUri 'PFC5zBW3ZgVZCj9O' \
    --refreshToken 'bVGT0Scwl4kNmCi1' \
    --username '5XTJTgCNNH7RtG5X' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 244 'TokenGrantV3' test.out

#- 245 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'hxJgaVfw5Vnyq8Oz' \
    > test.out 2>&1
eval_tap $? 245 'VerifyTokenV3' test.out

#- 246 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'TE89WDNoMcOmbfJr' \
    --code 'CJQIj1haAosKglqa' \
    --error 'CXE9ytpIO8btO3Ow' \
    --openidAssocHandle 'NEGSW5TaW4to7QCY' \
    --openidClaimedId '2NGGvi9kg3rMIzNm' \
    --openidIdentity 'hJTNQjKlwjfJ3TJ2' \
    --openidMode 'xVpge70WsLfgbZie' \
    --openidNs 'RvJI5sT9DH3DfLCv' \
    --openidOpEndpoint '8q4Thmq09bBgPAYx' \
    --openidResponseNonce 'rBE9jlnTgtgW33wD' \
    --openidReturnTo 'wD9RKvQX4yFQFdrR' \
    --openidSig 'oM6FoqCYw7AlxO6q' \
    --openidSigned 'dFpc71sSck3ggZWJ' \
    --state 'lSlCQMDji329PfVr' \
    > test.out 2>&1
eval_tap $? 246 'PlatformAuthenticationV3' test.out

#- 247 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'vMEPtpsSNcpK1QkB' \
    --platformToken '2Sy8Ww79LVeVskqe' \
    > test.out 2>&1
eval_tap $? 247 'PlatformTokenRefreshV3' test.out

#- 248 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'UB7RSayqGFguhh3b' \
    > test.out 2>&1
eval_tap $? 248 'PublicGetInputValidations' test.out

#- 249 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'vadRthdbVApebRA0' \
    > test.out 2>&1
eval_tap $? 249 'PublicGetInputValidationByField' test.out

#- 250 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode '9rW8i8krFWJhe03c' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 250 'PublicGetCountryAgeRestrictionV3' test.out

#- 251 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'oRFok5d3AyGrZO8G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 251 'PublicGetConfigValueV3' test.out

#- 252 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 252 'PublicGetCountryListV3' test.out

#- 253 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 253 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 254 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'uoXNSoVEBG7VbBPU' \
    > test.out 2>&1
eval_tap $? 254 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 255 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Wipz9C05YabFX4FC' \
    --rawPID  \
    --body '{"platformUserIds": ["K5ucTFsAFzaO3yJp", "A3KMxBlrRytER1qd", "TelFAadM9y66Drf4"]}' \
    > test.out 2>&1
eval_tap $? 255 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 256 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SSGGt3MiBKohow3k' \
    --platformUserId 'KoaP1K4CDuH1mMIf' \
    > test.out 2>&1
eval_tap $? 256 'PublicGetUserByPlatformUserIDV3' test.out

#- 257 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'OCDyVAHrHncR5dSh' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetAsyncStatus' test.out

#- 258 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'qiBUI9esSsXegSEh' \
    --limit '36' \
    --offset '25' \
    --platformBy 'PpK2q8kxR4BuEksS' \
    --platformId '2A9VOA8H9VeHv0L2' \
    --query 'Acm960EYQEuGJVl8' \
    > test.out 2>&1
eval_tap $? 258 'PublicSearchUserV3' test.out

#- 259 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "xs1WId9WlalqshF9", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "XOMXwKdfqk8T4QHK", "policyId": "30EX0FclpDl5Hsur", "policyVersionId": "acO5MnjnxD1OXkxS"}, {"isAccepted": false, "localizedPolicyVersionId": "WWaYvBLE46bpuJip", "policyId": "8JyxJ39vrtuWWrqT", "policyVersionId": "ZbSqBSKp8AmgwhYz"}, {"isAccepted": false, "localizedPolicyVersionId": "NyT4k3DIbfT22G5N", "policyId": "pE130YWSgxpKWtdt", "policyVersionId": "dtVW9anENmxb9e7v"}], "authType": "XZV3ig8Jg5VByeI3", "code": "ycMcYYBixKJXCISQ", "country": "dwec1m8BusV9tUh7", "dateOfBirth": "4KVo6Xqjz2xUKLNW", "displayName": "SmYyVvyelIJ8QgaL", "emailAddress": "Mqi836ULa7cfZl4V", "password": "uY6rsZyo6CBRRnoO", "reachMinimumAge": false, "uniqueDisplayName": "IzTOqKkcjRh3l2gA"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicCreateUserV3' test.out

#- 260 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'JOTCbx7J3gNLIlTk' \
    --query '3Bpclrk4hIRn0znI' \
    > test.out 2>&1
eval_tap $? 260 'CheckUserAvailability' test.out

#- 261 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["KzAEAHQpBOgHEP5l", "94s7CbIJ7eHnVWOb", "oMkyB7FTexsOZ0b2"]}' \
    > test.out 2>&1
eval_tap $? 261 'PublicBulkGetUsers' test.out

#- 262 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "p3b63KrcwIcXMhGy", "languageTag": "83Xit6boOLGCcg16"}' \
    > test.out 2>&1
eval_tap $? 262 'PublicSendRegistrationCode' test.out

#- 263 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "DqwdQPQ9HkSSV8e1", "emailAddress": "MgTTLS2FgarY903I"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicVerifyRegistrationCode' test.out

#- 264 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "NGIyEfRBEj7qms9A", "languageTag": "GQExPhgr9gGfC0Gj"}' \
    > test.out 2>&1
eval_tap $? 264 'PublicForgotPasswordV3' test.out

#- 265 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'vpgJfuBs1Vpqn47G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 265 'GetAdminInvitationV3' test.out

#- 266 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'VghTH2wToOnq9U5l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "yW89Xwt3wmRTrDCj", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "0eObbrmgjhWK0x0Z", "policyId": "idAJ1CU1eD1La16B", "policyVersionId": "w3JbUnUDh5yGjjv4"}, {"isAccepted": false, "localizedPolicyVersionId": "wrv2vancmR6Z7rb2", "policyId": "1A2E9pX0BWCMqPsR", "policyVersionId": "k5htdM5T3fDSrSHr"}, {"isAccepted": false, "localizedPolicyVersionId": "XJPm5ztrr09CDA8I", "policyId": "j5bGKSuopWQbaCvd", "policyVersionId": "PSq8Z27GpvHCDx55"}], "authType": "JZ5z6gujpFzlPspQ", "code": "D9IRIpDDubntPCFx", "country": "feoW2NdSWzOXjO1N", "dateOfBirth": "QUqWHBW78XREZCiT", "displayName": "NAxq26gZrPqCsSDs", "emailAddress": "pvgM16sZ6rjnkH4E", "password": "xObppC6CMYDm5ge6", "reachMinimumAge": false, "uniqueDisplayName": "UDEOF6gp5UfmjtiV"}' \
    > test.out 2>&1
eval_tap $? 266 'CreateUserFromInvitationV3' test.out

#- 267 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "bqJnZcrqrPye7fCw", "country": "i7Il2wIFlHm9N6ow", "dateOfBirth": "MHMtJy1Oqn59tEGm", "displayName": "9NYeUT5P0nx8TqSZ", "languageTag": "dZ5C8mFI9TnvzEqB", "uniqueDisplayName": "NMF9CZvPxT5zbreM", "userName": "c9fBoU3RHNDFjLKF"}' \
    > test.out 2>&1
eval_tap $? 267 'UpdateUserV3' test.out

#- 268 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "repy56eW1kmb15Qe", "country": "IQF51c4MqJzDSvEL", "dateOfBirth": "gBe6dboSdhkBzAzP", "displayName": "kt1efGJeJaxyHYut", "languageTag": "gXucx85vHA009FAb", "uniqueDisplayName": "21jxeWXk80y9uxgV", "userName": "LGgK8aVSCN6oCETQ"}' \
    > test.out 2>&1
eval_tap $? 268 'PublicPartialUpdateUserV3' test.out

#- 269 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "8gIDRdD2wwMXwKVX", "emailAddress": "GPhEJsc7rZpxaPHc", "languageTag": "9r8eToFmkHJ6BPOK"}' \
    > test.out 2>&1
eval_tap $? 269 'PublicSendVerificationCodeV3' test.out

#- 270 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "FLxIwKssw647YwDu", "contactType": "dnGRufOUGfMjTU22", "languageTag": "6l07jPlcYaqYM7Yf", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 270 'PublicUserVerificationV3' test.out

#- 271 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "zO8AEl6A9sh2x2ur", "country": "2ccp7R7OqPqIjS4i", "dateOfBirth": "0N9ytb3c8pVZ8GlU", "displayName": "8962e6gtn5pUARJM", "emailAddress": "1T8QwMNOAzXmyHEV", "password": "4g9P6a280S5RNB5d", "uniqueDisplayName": "VCsB7xL4axSPgPCi", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 271 'PublicUpgradeHeadlessAccountV3' test.out

#- 272 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "T7cBP0918JaEBQBP", "password": "766LUnBBR84iAO7s"}' \
    > test.out 2>&1
eval_tap $? 272 'PublicVerifyHeadlessAccountV3' test.out

#- 273 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "BQt6YJ2tWwF7RnP1", "newPassword": "oK3c4RVfjB0zi3Xr", "oldPassword": "YZUiN24ol1qqbalg"}' \
    > test.out 2>&1
eval_tap $? 273 'PublicUpdatePasswordV3' test.out

#- 274 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'izL97ycJV5YqE2my' \
    > test.out 2>&1
eval_tap $? 274 'PublicCreateJusticeUser' test.out

#- 275 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Qzl7X9fHr6WvBxmB' \
    --redirectUri 'vNj3ktaDf9B22HGg' \
    --ticket 'xakPt7IYzaZUTmvs' \
    > test.out 2>&1
eval_tap $? 275 'PublicPlatformLinkV3' test.out

#- 276 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'EzLPnnGsnfmBerp8' \
    --body '{"platformNamespace": "4qjwzWpCF1vyamjs"}' \
    > test.out 2>&1
eval_tap $? 276 'PublicPlatformUnlinkV3' test.out

#- 277 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'EzwtLPxK1os4qR8L' \
    > test.out 2>&1
eval_tap $? 277 'PublicPlatformUnlinkAllV3' test.out

#- 278 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'aQzEb39sZTdFfC8x' \
    --ticket '5aHLsXHlm1RJTTy9' \
    > test.out 2>&1
eval_tap $? 278 'PublicForcePlatformLinkV3' test.out

#- 279 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JrNz1K5M1qgFddYv' \
    --clientId 'ifGHawNx6yhniEHL' \
    --redirectUri 'bEQKc0aUvrKXDIjY' \
    > test.out 2>&1
eval_tap $? 279 'PublicWebLinkPlatform' test.out

#- 280 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'C4df9qswSlpCI8Dh' \
    --code 'jlxUyrs3OSesE5p0' \
    --state 'DwUj2HKUvPYUcQBx' \
    > test.out 2>&1
eval_tap $? 280 'PublicWebLinkPlatformEstablish' test.out

#- 281 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MSdOOsn2Nd8Jpa19' \
    --code 'GJDK46Eehx7xasqM' \
    --state 'Y9aulsL6NOV5agpS' \
    > test.out 2>&1
eval_tap $? 281 'PublicProcessWebLinkPlatformV3' test.out

#- 282 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "6A5mkufBpWVxIK9D", "userIds": ["2bTcgaKoccaSwWcZ", "mzCWGI1cIQcPWASh", "IhieSKUf3zKbyQk2"]}' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetUsersPlatformInfosV3' test.out

#- 283 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "vQTYX1xsth28NZZg", "emailAddress": "sXycuQNGIDeHlf6I", "newPassword": "cX1K9JrK6Or2xx7r"}' \
    > test.out 2>&1
eval_tap $? 283 'ResetPasswordV3' test.out

#- 284 PublicGetUserByUserIdV3
eval_tap 0 284 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 285 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LwrPoWiywnxuDLLu' \
    --activeOnly  \
    --after 'IaSxoloIH1gBCWVF' \
    --before 'rvls0ZwosKhDlLfT' \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetUserBanHistoryV3' test.out

#- 286 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'P8KgEAj3dbRTI0i6' \
    > test.out 2>&1
eval_tap $? 286 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 287 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dO3zkbDseh4tJdoG' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetUserInformationV3' test.out

#- 288 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cwMBmegqVUaWMJBj' \
    --after '0.27816081661708647' \
    --before '0.7609296525465671' \
    --limit '56' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetUserLoginHistoriesV3' test.out

#- 289 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'p9A7tcHrV0MbJGr4' \
    --after 'drgkDuWS05m0pGza' \
    --before 'zM2BUXnzUEWTiKMJ' \
    --limit '55' \
    --platformId '2O7NrTQO7KLdZDGw' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetUserPlatformAccountsV3' test.out

#- 290 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qx7T3l1ut2oyolli' \
    > test.out 2>&1
eval_tap $? 290 'PublicListJusticePlatformAccountsV3' test.out

#- 291 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'YsTJUmpscwLcUml3' \
    --body '{"platformId": "KuoMKh7tprnacA34", "platformUserId": "xmIOjFLgKR4LjEWh"}' \
    > test.out 2>&1
eval_tap $? 291 'PublicLinkPlatformAccount' test.out

#- 292 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'OScvtQ92iD02YMvE' \
    --body '{"chosenNamespaces": ["UNfoL7JCcMo7GxxX", "dbYCRexPekTsQxMT", "faSot7aohFYy4Vxw"], "requestId": "HIJ9gzxqAw4vBGQA"}' \
    > test.out 2>&1
eval_tap $? 292 'PublicForceLinkPlatformWithProgression' test.out

#- 293 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eh0VTiTP4PSrXUS6' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetPublisherUserV3' test.out

#- 294 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jYI9lsQFD43Df5qU' \
    --password 'ZOFzpFd6b5Jc5TET' \
    > test.out 2>&1
eval_tap $? 294 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 295 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'Hcup8GG0VCMTFJ6s' \
    --before 'vTyo9RHget5hzB52' \
    --isWildcard  \
    --limit '56' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetRolesV3' test.out

#- 296 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'RPGV9n769zLJdKMe' \
    > test.out 2>&1
eval_tap $? 296 'PublicGetRoleV3' test.out

#- 297 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 297 'PublicGetMyUserV3' test.out

#- 298 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'xeJc7NvgTSgKjCxZ' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 299 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["jKf8NA4cGUaDfy9X", "nH2r0EKrk5VlnKsW", "CPccAFn5CEPoH6op"], "oneTimeLinkCode": "K5DSO8JyX4IE1z3r"}' \
    > test.out 2>&1
eval_tap $? 299 'LinkHeadlessAccountToMyAccountV3' test.out

#- 300 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "DwZ1HKsOpyq8agQu"}' \
    > test.out 2>&1
eval_tap $? 300 'PublicSendVerificationLinkV3' test.out

#- 301 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'z86nc6jLF9DIW2nc' \
    > test.out 2>&1
eval_tap $? 301 'PublicVerifyUserByLinkV3' test.out

#- 302 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'JJKpqmgvUTr8XAtp' \
    --code 'OqUQxzqJZiWi3KQf' \
    --error 'fT5Tn61A1xW6okIq' \
    --state 'md87ir9op4YfGTno' \
    > test.out 2>&1
eval_tap $? 302 'PlatformAuthenticateSAMLV3Handler' test.out

#- 303 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId '5oHzqY3DgykA8zBJ' \
    --payload 'X0rkOHUkY5aSlqhY' \
    > test.out 2>&1
eval_tap $? 303 'LoginSSOClient' test.out

#- 304 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'oSXbn6l5xAzc1nc3' \
    > test.out 2>&1
eval_tap $? 304 'LogoutSSOClient' test.out

#- 305 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'eFm950dtVAo7w4e3' \
    --code 'v5mh6Rum5pbgEt39' \
    > test.out 2>&1
eval_tap $? 305 'RequestTargetTokenResponseV3' test.out

#- 306 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '41' \
    --namespace "$AB_NAMESPACE" \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 306 'AdminListInvitationHistoriesV4' test.out

#- 307 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '8tE4UyoQg0b0sGOk' \
    > test.out 2>&1
eval_tap $? 307 'AdminGetDevicesByUserV4' test.out

#- 308 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'zxVt15LKmkQ7YBhs' \
    --endDate 'OuJ0ypkkt2G4eFh2' \
    --limit '80' \
    --offset '85' \
    --startDate 'sdoxpLTBM9Q8t829' \
    > test.out 2>&1
eval_tap $? 308 'AdminGetBannedDevicesV4' test.out

#- 309 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ido1JyveSRiBq23k' \
    > test.out 2>&1
eval_tap $? 309 'AdminGetUserDeviceBansV4' test.out

#- 310 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "yH9jQbHWkcVk0X28", "deviceId": "GS54vl7gIKBc7OYT", "deviceType": "ylFRAJKySnC0cfPl", "enabled": false, "endDate": "2zSBbs4PAV72u8Ax", "ext": {"E2IQeoxYV4UcYzsw": {}, "AGpXqQxctuVaqPJG": {}, "AHEZmuQrZ8GaQ4OZ": {}}, "reason": "2nDodm4TNs8mAj6I"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminBanDeviceV4' test.out

#- 311 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'KSYFdJwgZsRPOzwu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 311 'AdminGetDeviceBanV4' test.out

#- 312 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'DSdGl1A2vaNeDiSq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateDeviceBanV4' test.out

#- 313 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'fmAVg50kOdJagEmT' \
    --startDate 'uaxlxgywkbdOsyxX' \
    --deviceType '1tfW488oYUT4jyCV' \
    > test.out 2>&1
eval_tap $? 313 'AdminGenerateReportV4' test.out

#- 314 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 314 'AdminGetDeviceTypesV4' test.out

#- 315 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'J0V8obTlGVThz4bm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 315 'AdminGetDeviceBansV4' test.out

#- 316 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId '41oIcV33yjPxibDj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 316 'AdminDecryptDeviceV4' test.out

#- 317 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'fF7JkjCVpZKMxkFk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 317 'AdminUnbanDeviceV4' test.out

#- 318 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'BtXMU6KRIm5xBoIi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 318 'AdminGetUsersByDeviceV4' test.out

#- 319 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 319 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 320 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 320 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 321 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 6}' \
    > test.out 2>&1
eval_tap $? 321 'AdminCreateTestUsersV4' test.out

#- 322 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "tgFXasxp5h780ktj", "policyId": "Qw2yXzaQWaF2PqUf", "policyVersionId": "bpMpRl6xRyV19cbo"}, {"isAccepted": true, "localizedPolicyVersionId": "VIuCOCkt2W1DfI8Q", "policyId": "tgODk9K6DcMnyCPn", "policyVersionId": "1FylWdaNV1VaZTkb"}, {"isAccepted": false, "localizedPolicyVersionId": "cv3IwmL7a1K3zIUY", "policyId": "JmdF1YtWNSQlcMzx", "policyVersionId": "fppNCrscDPbklTHc"}], "authType": "EMAILPASSWD", "code": "bDJ7sHCLup8pmEos", "country": "OXglQwwdeLVpmXqR", "dateOfBirth": "wVjc3W2ANmE3VVsQ", "displayName": "1fm9EUdiaRjuLsKZ", "emailAddress": "oqnpKwhpZVdw5UMa", "password": "8ymxtEFLwELCY2vI", "passwordMD5Sum": "ddlxnA1VynioJcAP", "reachMinimumAge": true, "uniqueDisplayName": "UDqvLQixPKVSmWa8", "username": "TGko16XTqHc0cM7i"}' \
    > test.out 2>&1
eval_tap $? 322 'AdminCreateUserV4' test.out

#- 323 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["E4JwQONQ2vCbMn0O", "ia336uiiMTAductv", "UfVwLahtRedh1SiZ"]}' \
    > test.out 2>&1
eval_tap $? 323 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 324 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["lOpIQ8GL7jBF1R5O", "exAPzCG6ZKQClGc1", "636nbfM3J9G40Y62"]}' \
    > test.out 2>&1
eval_tap $? 324 'AdminBulkCheckValidUserIDV4' test.out

#- 325 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bCo941ALznQuHVsk' \
    --body '{"avatarUrl": "fCjUK8GeX4Q0B2Cj", "country": "0oOmBmXu1KiTTiz7", "dateOfBirth": "yrIvQj2isN7bRwcr", "displayName": "16lW5YwgZpjlMMtP", "languageTag": "Wg8217m7qNkQiKp2", "skipLoginQueue": false, "uniqueDisplayName": "u31d8eOdtrfq6ECD", "userName": "D6OGkuLs9gNpNon6"}' \
    > test.out 2>&1
eval_tap $? 325 'AdminUpdateUserV4' test.out

#- 326 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DKW9A6AmnQTNFidI' \
    --body '{"code": "mWONTvCPMGLdbYEk", "emailAddress": "nHPKrZ7TiNBE0HRs"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminUpdateUserEmailAddressV4' test.out

#- 327 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'E0GHDOFjrfqJcyxT' \
    > test.out 2>&1
eval_tap $? 327 'AdminDisableUserMFAV4' test.out

#- 328 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '2a7fCFAUzLELiM57' \
    > test.out 2>&1
eval_tap $? 328 'AdminListUserRolesV4' test.out

#- 329 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '3TdtWjfVciuLnLsB' \
    --body '{"assignedNamespaces": ["KGsALPuCOyphUUAV", "95708zaP0wpZgQEv", "Fzox9wHocX3DRWob"], "roleId": "EoGr8W97KBedcr6P"}' \
    > test.out 2>&1
eval_tap $? 329 'AdminUpdateUserRoleV4' test.out

#- 330 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M51z7i0wQ9egK2t4' \
    --body '{"assignedNamespaces": ["6EG8I2lTviKbOgVu", "N3nhkn6QIesNoYqv", "VsakylHikKkpOjqw"], "roleId": "gKvfXXs8pDqm31AZ"}' \
    > test.out 2>&1
eval_tap $? 330 'AdminAddUserRoleV4' test.out

#- 331 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SRkuw6q8FgqG46Rs' \
    --body '{"assignedNamespaces": ["FK7eYlSU3vYcHZZj", "FegVnZOn0tk4IATS", "IefcqNEn4IZ0Dv6b"], "roleId": "8WtaMVvLbG04KKnh"}' \
    > test.out 2>&1
eval_tap $? 331 'AdminRemoveUserRoleV4' test.out

#- 332 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '22' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 332 'AdminGetRolesV4' test.out

#- 333 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "Qp3kTyL4CsLwiWUM"}' \
    > test.out 2>&1
eval_tap $? 333 'AdminCreateRoleV4' test.out

#- 334 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'cpxn4B6XoTNMuqZT' \
    > test.out 2>&1
eval_tap $? 334 'AdminGetRoleV4' test.out

#- 335 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'Hwo1IAJQpb6r8Zea' \
    > test.out 2>&1
eval_tap $? 335 'AdminDeleteRoleV4' test.out

#- 336 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'SHwQuiH3Ozu4G6bX' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "pszuVk6iPdJ2boQq"}' \
    > test.out 2>&1
eval_tap $? 336 'AdminUpdateRoleV4' test.out

#- 337 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'CCyJfThvCJieqRSG' \
    --body '{"permissions": [{"action": 81, "resource": "ZkwEeuzBBRSknxyW", "schedAction": 20, "schedCron": "GkHG5OIVuGv47XJp", "schedRange": ["kMiopQrVL3ZZTVxq", "a9XM2gY14iWk12Jf", "fk8dwKNPUOHNZxML"]}, {"action": 13, "resource": "yoBM9qxd6PWz7sVn", "schedAction": 79, "schedCron": "ejdTGvZgN5hshSe5", "schedRange": ["YmZXKEQLkM6o3eGS", "P4Htmr90TqGf0Oyq", "J9ibJMmRgoxNwp1l"]}, {"action": 67, "resource": "bJ37DN2lDvdh7okH", "schedAction": 23, "schedCron": "PWX1NPO5Wn7rNG8r", "schedRange": ["Gp7Fadvo5EzpX0It", "tsRezyY9GB5sf94A", "LBmvdncQkcZb8cWd"]}]}' \
    > test.out 2>&1
eval_tap $? 337 'AdminUpdateRolePermissionsV4' test.out

#- 338 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'VH9bww15zZsaYrJA' \
    --body '{"permissions": [{"action": 9, "resource": "V8DpbjGts4UZDTfh", "schedAction": 55, "schedCron": "C9RhzMC7V8BEphnR", "schedRange": ["XnSpCzyb8FkoxQbr", "Pngi87K58pQswqKL", "utINusOsa92F6iwk"]}, {"action": 72, "resource": "p2to7Yja1soDE1K0", "schedAction": 92, "schedCron": "W21ANrlpuXD9H1u1", "schedRange": ["CvzWPcZwkj1l6bf2", "F9EXOBj7v8LHYivm", "D0ekycMKlwJTNL2U"]}, {"action": 57, "resource": "TZ000rS92594HLvW", "schedAction": 64, "schedCron": "WcDSqGYRMdz07xEJ", "schedRange": ["40epssgJJC3CX0hp", "B1ZGMMo5DSozCuFs", "rBMtoOeLfMCYxSee"]}]}' \
    > test.out 2>&1
eval_tap $? 338 'AdminAddRolePermissionsV4' test.out

#- 339 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'JOlxa395rghZwGhd' \
    --body '["ZJkkGhYvXYMIyaEM", "EqOpwetb82b96rsH", "73hRfDgl29GWKpIt"]' \
    > test.out 2>&1
eval_tap $? 339 'AdminDeleteRolePermissionsV4' test.out

#- 340 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'Mt4GszRufkDFLYyN' \
    --after 'BPlMrkse9SGcMuV5' \
    --before 'phhU315LUC6HSMQ3' \
    --limit '95' \
    > test.out 2>&1
eval_tap $? 340 'AdminListAssignedUsersV4' test.out

#- 341 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId '4CjKCeIRIr997KKp' \
    --body '{"assignedNamespaces": ["JXTLbYWpqeXjaf1f", "5fjNMZjKJ05puX31", "97WrMnJtovSMFw8X"], "namespace": "4zxbdfXgunt1oMNZ", "userId": "68eovHSH3xV3URIR"}' \
    > test.out 2>&1
eval_tap $? 341 'AdminAssignUserToRoleV4' test.out

#- 342 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'VDYBd6hMB0l7sg7I' \
    --body '{"namespace": "fMH5Tu1ky1ZYvyeH", "userId": "mfoFkUDP864shbnQ"}' \
    > test.out 2>&1
eval_tap $? 342 'AdminRevokeUserFromRoleV4' test.out

#- 343 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["3bVvuvpsDJXPCWkX", "4Kpi8CJ88aMPGFFA", "QZbfbmVTEbiRq5Ju"], "emailAddresses": ["ikmpat75rVbN9ZBt", "zJ33tCwv8H1f451F", "VZ630HNBYZSrz7pM"], "isAdmin": false, "isNewStudio": true, "namespace": "ESLLMPKDXLki6Oz5", "roleId": "Bygt8Q0RjSf1srB7"}' \
    > test.out 2>&1
eval_tap $? 343 'AdminInviteUserNewV4' test.out

#- 344 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "hGwGbUmQmJHNffZE", "country": "Ns9X0hFMdzryvhc1", "dateOfBirth": "YjHmmulSBIElc2Cd", "displayName": "RvBb0aGnMt625bWH", "languageTag": "b5sbX6asrjV7XJUO", "skipLoginQueue": true, "uniqueDisplayName": "vSSp71zEPPfmAQiq", "userName": "RRC2caquMRtQOILc"}' \
    > test.out 2>&1
eval_tap $? 344 'AdminUpdateMyUserV4' test.out

#- 345 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 345 'AdminDisableMyAuthenticatorV4' test.out

#- 346 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'aDqUITBHQR5ISNoF' \
    > test.out 2>&1
eval_tap $? 346 'AdminEnableMyAuthenticatorV4' test.out

#- 347 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 347 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 348 AdminGetMyBackupCodesV4
eval_tap 0 348 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 349 AdminGenerateMyBackupCodesV4
eval_tap 0 349 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 350 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 350 'AdminDisableMyBackupCodesV4' test.out

#- 351 AdminDownloadMyBackupCodesV4
eval_tap 0 351 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 352 AdminEnableMyBackupCodesV4
eval_tap 0 352 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 353 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 353 'AdminGetBackupCodesV4' test.out

#- 354 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 354 'AdminGenerateBackupCodesV4' test.out

#- 355 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 355 'AdminEnableBackupCodesV4' test.out

#- 356 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 356 'AdminSendMyMFAEmailCodeV4' test.out

#- 357 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 357 'AdminDisableMyEmailV4' test.out

#- 358 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'R3GUxdMuvmL0UBfw' \
    > test.out 2>&1
eval_tap $? 358 'AdminEnableMyEmailV4' test.out

#- 359 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 359 'AdminGetMyEnabledFactorsV4' test.out

#- 360 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'zaaeP3Wd0Wrb8s3G' \
    > test.out 2>&1
eval_tap $? 360 'AdminMakeFactorMyDefaultV4' test.out

#- 361 AdminInviteUserV4
eval_tap 0 361 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 362 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'W0CY0vAfbq8xoCur' \
    --linkingToken 'q4lpHXrbVBh60NUA' \
    --password '2aKQwnXrmi6ya8u4' \
    --username 'sQPvaf1AcweR7tJW' \
    > test.out 2>&1
eval_tap $? 362 'AuthenticationWithPlatformLinkV4' test.out

#- 363 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData '3MLMob1hUnIzIpUM' \
    --extendExp  \
    --linkingToken '8KK1kGFN0NUNGKxd' \
    > test.out 2>&1
eval_tap $? 363 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 364 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'lAUDFQuGPzAuT7M6' \
    --factor 'OBrNwioKnXPVZaDc' \
    --mfaToken 'XsV1TnsZioDiBgpr' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 364 'Verify2faCodeV4' test.out

#- 365 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'zahPB0FKMa0YeyNB' \
    --codeChallenge 'QWUHDBnBeePkqg6Z' \
    --codeChallengeMethod 'plain' \
    --additionalData 'pmsQnp1n4YGumTKO' \
    --clientId 'lDOy5vhSkxERZ2AQ' \
    --createHeadless  \
    --deviceId '1jvXYBar5RMmmGdW' \
    --macAddress 'l0wpj5tVfKU3D8WV' \
    --platformToken 'Ph0Z7YiGE2cyzTMB' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 365 'PlatformTokenGrantV4' test.out

#- 366 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'Y7Xd0OoENg2Lw7ue' \
    --codeChallengeMethod 'S256' \
    --simultaneousPlatform 'DFaEUkPUBnB0ZEJH' \
    --simultaneousTicket '3ebM71Tg922xiBgH' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'ka0Pz7I1WkIa0oZ1' \
    > test.out 2>&1
eval_tap $? 366 'SimultaneousLoginV4' test.out

#- 367 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'nXpW1l70pcZgIn4l' \
    --codeChallengeMethod 'plain' \
    --additionalData 'ghHyMEHBzArbyW10' \
    --clientId 'NkJFQxuMHnfOlX6H' \
    --code 'YVEiaereFCPJU2wE' \
    --codeVerifier 'zUYUTmZ8JSMeNmRo' \
    --extendNamespace 'cp400RZe8Bzx9aGE' \
    --extendExp  \
    --loginQueueTicket 'I22BTCZs97TJI8GP' \
    --password 'rM24F3celFgM62HQ' \
    --redirectUri 'tgzQhO3nR8j8DlP6' \
    --refreshToken 'OGbn8vmfMYGLt1Aj' \
    --username 'Khh3JMX7xSrz1EH6' \
    --grantType 'urn:ietf:params:oauth:grant-type:login_queue_ticket' \
    > test.out 2>&1
eval_tap $? 367 'TokenGrantV4' test.out

#- 368 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData '2SM3xzsNrJzWBcdF' \
    --code 'lo7oAsOlfLB1J19b' \
    > test.out 2>&1
eval_tap $? 368 'RequestTargetTokenResponseV4' test.out

#- 369 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "rTfiL2P3r1a8KIJH", "policyId": "33aKkPuWD59MgTy1", "policyVersionId": "HA58Jt5NaROjSKFE"}, {"isAccepted": true, "localizedPolicyVersionId": "OzUGHeBKtpvyRNgj", "policyId": "ZkdDppvEJiUiDGXg", "policyVersionId": "h8BKcLqtRZ93LuR8"}, {"isAccepted": false, "localizedPolicyVersionId": "EyICvwgwBFehwtdJ", "policyId": "Ldn3R2wo8beVQvge", "policyVersionId": "P9qOHaLwYnXxrz7s"}], "authType": "EMAILPASSWD", "country": "mP70LxN0f3JA27Qz", "dateOfBirth": "5SjzQfOLYu9O46OO", "displayName": "zz9p57qSpHerzO87", "emailAddress": "cg7TqtMiQgi7Aj28", "password": "qCRbwwZc4ZS1NMkr", "passwordMD5Sum": "nHs1Iyhwqk140Mol", "uniqueDisplayName": "IrnlkRVbcX435TDY", "username": "pkk2Gza6DrSycoph", "verified": true}' \
    > test.out 2>&1
eval_tap $? 369 'PublicCreateTestUserV4' test.out

#- 370 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "Qw6fSESkM19OPMBb", "policyId": "12gpmShlmIt2nfhU", "policyVersionId": "aZGqjslu59GT2E6A"}, {"isAccepted": false, "localizedPolicyVersionId": "igiA3wBrmBYIlZeh", "policyId": "eP72AB8EO3YrlyrW", "policyVersionId": "owUpUDVLlTtuJJsH"}, {"isAccepted": true, "localizedPolicyVersionId": "VsG6izJZruOJvSRF", "policyId": "LDSdj8elbtHvDU91", "policyVersionId": "DmHzwiqVPCJ5j18O"}], "authType": "EMAILPASSWD", "code": "RYaD9WNKGhbLhjz1", "country": "v0RBIO2rkJGmPaK6", "dateOfBirth": "HEVIQJd3930TGewj", "displayName": "Ryfo4nWVZZbKFsKO", "emailAddress": "mgEhjH2wFzCpxxJL", "password": "fAg5cFT0gHAkltcR", "passwordMD5Sum": "3eHFbiAluHv7Hssd", "reachMinimumAge": false, "uniqueDisplayName": "pHBJX5ln8PZbYVD8", "username": "RiaTsdD4d3kSbTkH"}' \
    > test.out 2>&1
eval_tap $? 370 'PublicCreateUserV4' test.out

#- 371 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'PMUvOAUXkw36cr2W' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "qS7Tq4YIyZAFQ6lZ", "policyId": "fa2jdNvpWf32JS1a", "policyVersionId": "v9VNpVLT0LvqcfSd"}, {"isAccepted": true, "localizedPolicyVersionId": "nAjY5FvADb3GUQgc", "policyId": "i632w6LUrHuKBoNT", "policyVersionId": "pPQXDNHto74GcmVf"}, {"isAccepted": false, "localizedPolicyVersionId": "iLFQejNZJNF2hm0T", "policyId": "qBQprHn3whPKU5ab", "policyVersionId": "nqw8fFa30pVbhr1B"}], "authType": "EMAILPASSWD", "code": "siWm3V9sirE0JOQx", "country": "WeHypqCWMDPRI2cC", "dateOfBirth": "k8zHR8VyCC0EQwE0", "displayName": "cXokXbwKDtVmrYQu", "emailAddress": "7hZvHfiT9s9pK8Hu", "password": "UY1QQHQ0NCEddJtx", "passwordMD5Sum": "6GV01vD7lNLxlpvq", "reachMinimumAge": false, "uniqueDisplayName": "dsgB4hOxb88WgKSL", "username": "IpneDQCfwucHRL3o"}' \
    > test.out 2>&1
eval_tap $? 371 'CreateUserFromInvitationV4' test.out

#- 372 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "2NstrL6TsJeRcE7G", "country": "uwKn63KIDTkUCqbb", "dateOfBirth": "HGJGOTvKKRTHDnta", "displayName": "FiufH2YR6QU7fj6w", "languageTag": "17arNs12hOoLVM7U", "uniqueDisplayName": "FnuJDzeEkDxaVogx", "userName": "HrOon2OW4Zw5QwVK"}' \
    > test.out 2>&1
eval_tap $? 372 'PublicUpdateUserV4' test.out

#- 373 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "WNy2tnF2MifJR4hr", "emailAddress": "4gdJDujYnVnFK6gB"}' \
    > test.out 2>&1
eval_tap $? 373 'PublicUpdateUserEmailAddressV4' test.out

#- 374 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "6ZxC6yYUVUJYnQ3j", "country": "OGmROIqxqQ0gcNeT", "dateOfBirth": "flyvUh3w5ZtfwmOC", "displayName": "KpFSMF0tfGIZCTNi", "emailAddress": "IRc9fEjkZhEpAJMC", "password": "xMp2J0hDg2kMgkvh", "reachMinimumAge": false, "uniqueDisplayName": "56hOg8oukDVdweG0", "username": "sFHxTHa2k60SzCqU", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 374 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 375 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "sqdXfhZTTaCeqGv7", "password": "meuQhJuq1C6JHkWM", "username": "SUbqByWN2BCnRz9w"}' \
    > test.out 2>&1
eval_tap $? 375 'PublicUpgradeHeadlessAccountV4' test.out

#- 376 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 376 'PublicDisableMyAuthenticatorV4' test.out

#- 377 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code '2nur0B9jKaunAcyl' \
    > test.out 2>&1
eval_tap $? 377 'PublicEnableMyAuthenticatorV4' test.out

#- 378 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 378 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 379 PublicGetMyBackupCodesV4
eval_tap 0 379 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 380 PublicGenerateMyBackupCodesV4
eval_tap 0 380 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 381 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 381 'PublicDisableMyBackupCodesV4' test.out

#- 382 PublicDownloadMyBackupCodesV4
eval_tap 0 382 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 383 PublicEnableMyBackupCodesV4
eval_tap 0 383 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 384 'PublicGetBackupCodesV4' test.out

#- 385 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 385 'PublicGenerateBackupCodesV4' test.out

#- 386 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 386 'PublicEnableBackupCodesV4' test.out

#- 387 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'sau7wRQmL4i3eRyI' \
    > test.out 2>&1
eval_tap $? 387 'PublicRemoveTrustedDeviceV4' test.out

#- 388 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 388 'PublicSendMyMFAEmailCodeV4' test.out

#- 389 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 389 'PublicDisableMyEmailV4' test.out

#- 390 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'ECEDa1I4lwXqwPfq' \
    > test.out 2>&1
eval_tap $? 390 'PublicEnableMyEmailV4' test.out

#- 391 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 391 'PublicGetMyEnabledFactorsV4' test.out

#- 392 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor '3VzHQjtolx64w1gy' \
    > test.out 2>&1
eval_tap $? 392 'PublicMakeFactorMyDefaultV4' test.out

#- 393 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vjacKtGqxMnoAXRl' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 394 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "cq0mYWKQYlqMmu2p", "emailAddress": "vF6rP03bQaq1cT88", "namespace": "H6RCW8gJmGzDlqxt", "namespaceDisplayName": "LsR2AGOiPhNt2IdH"}' \
    > test.out 2>&1
eval_tap $? 394 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE