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
echo "1..395"

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
    --body '{"ACSURL": "GeMvr9TsvcMQ7dBs", "AWSCognitoRegion": "aIecRxIsZvD6rmzV", "AWSCognitoUserPool": "r5XT1Nxw0v1dMQ9R", "AllowedClients": ["rbk6C2cVWf6ttvbU", "1PO6ApCD2VXidT7w", "0Oc15N8WXBPp17PA"], "AppId": "ewqSm5x3B4t7WQnp", "AuthorizationEndpoint": "8jXZedgt5cyNe27H", "ClientId": "LtwtVOaxgP6Jbct8", "Environment": "puMybYGxD9IPmmsL", "FederationMetadataURL": "mu3kaPj0O4zd8Tb7", "GenericOauthFlow": false, "IsActive": true, "Issuer": "UNGPTBxiFFCrn7dj", "JWKSEndpoint": "js69FTFVGUVhvKhJ", "KeyID": "Cmeisql14mUHVbMP", "LogoURL": "imNhcZsU3VAdMDcb", "NetflixCertificates": {"encryptedPrivateKey": "4qlkiFAamqvZI2Kw", "encryptedPrivateKeyName": "jqPBiWXade41s3rH", "publicCertificate": "34mB2yPlRpWjmHZA", "publicCertificateName": "AvKTH8MuqIg0Czkg", "rootCertificate": "uwuJCW7EEFB67AOD", "rootCertificateName": "bi9BzupBsFpYc77G"}, "OrganizationId": "tRUcCFeY5g4XgBsb", "PlatformName": "fzqxBPNe8ae1Il4a", "RedirectUri": "AtEbu4IjGdqthRxT", "RegisteredDomains": [{"affectedClientIDs": ["jQ7gkZEY8rG0q0Q2", "Qd2JzRbkF2I03dIj", "vBbA6bfbYaJCJjfk"], "domain": "2TUvn95FhO7VW3mb", "namespaces": ["DVMDu87t0ldWf7iS", "GIiKFtWtn4Yr2svK", "M6pqLGZ0TBujELAU"], "roleId": "K6mQ5iZgbwwm5iGz"}, {"affectedClientIDs": ["XtcknrgidKupvXO6", "aj4hCmTC34jxW4pI", "DwdqXpmRmut9H9Xy"], "domain": "WI8bp8fQxRuX91uY", "namespaces": ["mtrHJbEGTUj7YjER", "L1rEQG02zccA8wvL", "sWUNd6lPKvqDejvq"], "roleId": "klTSvDwuOrP9lzpi"}, {"affectedClientIDs": ["X0VuFpZum7izxe7N", "PzjOa8E7wY76PxLv", "9HBEUe89AwEw1HO4"], "domain": "FnKtx4XLKAmlDr19", "namespaces": ["uJ3nq6VerzVCcI8y", "3Cz0YqCKUh5RD9vN", "Ap4jinFpnQ5xF9ww"], "roleId": "bvMZyeDeRnVfPUa6"}], "Secret": "xVVBcq3wZpFIYeAg", "TeamID": "79HcLJXJ7mpVI6eT", "TokenAuthenticationType": "YAjdPlCiQQC35cj4", "TokenClaimsMapping": {"KyOVgvnWbfRJtsB7": "cUQZ2QUAxJrINPXp", "pPNO3AfmXcgwC3IN": "6tvKgLB9QmJIOq9d", "P5szG71utjsQ4CrR": "b9gUCeVz7fWbZIdh"}, "TokenEndpoint": "evfZvyV7AcodcZwK", "UserInfoEndpoint": "jYDdmJOlzwm9Su4F", "UserInfoHTTPMethod": "nS98QqftSjq7sn8y", "scopes": ["reciPLfkVyyJsbGp", "O6JgehDJxEN7JlZc", "8LMq1o2jZWu4yA3r"]}' \
    > test.out 2>&1
eval_tap $? 141 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 142 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0u4q1bTHXIjfJKyF' \
    > test.out 2>&1
eval_tap $? 142 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 143 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lM0u1uuoVdn9yVoS' \
    --body '{"ACSURL": "lKNchPHNL4X3LLaG", "AWSCognitoRegion": "PGdqLE8SohhhuiTn", "AWSCognitoUserPool": "JarYYkHBDdSzBXdx", "AllowedClients": ["apwhd5IQYBQuxLvP", "uWYvE3fsNy9Z9Ohx", "XvCp9y7fLD2qfCXn"], "AppId": "lUnqxT1WsRNMZcA9", "AuthorizationEndpoint": "2hzC7MNa8vVe4MHX", "ClientId": "6AgMep90AyyUJyAK", "Environment": "5PRMRMwdvl0hv6g6", "FederationMetadataURL": "2GxBW2tQF5tkTjgJ", "GenericOauthFlow": false, "IsActive": true, "Issuer": "YvNQOsDa4bkcgepq", "JWKSEndpoint": "txjbrztee7QLTGAa", "KeyID": "k7Kaol01DK97D2xn", "LogoURL": "ik42miteR5eQAe1r", "NetflixCertificates": {"encryptedPrivateKey": "zmmgqBPRmd6mO4oI", "encryptedPrivateKeyName": "8KDqebm83raNBJ5y", "publicCertificate": "7axEkvI4oxZEDxGi", "publicCertificateName": "BnNbn0zaf7CaOSlH", "rootCertificate": "XrUSA6sMJzA5mtqI", "rootCertificateName": "SQ83TTbtefXWznDe"}, "OrganizationId": "4LQdXfFBii2RAMEX", "PlatformName": "5RMjBFVZGYzQqV8d", "RedirectUri": "9mDdUIoiIJFNxuNO", "RegisteredDomains": [{"affectedClientIDs": ["mUSWw18T1IxVWCxd", "vPL9e4P01vxP8xj1", "LyEirURERnEMzpIm"], "domain": "W6sjAHyCK5tNanGB", "namespaces": ["rkzUvck3xTtmOFMe", "bS4AdlNzwog2IhEr", "kNhNcECWwchW6zL9"], "roleId": "SkbLlrNXnGanMazb"}, {"affectedClientIDs": ["8jvRWenURH48aJuA", "LEcSqcE15u6D31Dj", "Osrs3CUYATdqnQGb"], "domain": "qiqOkNeATj7eGjod", "namespaces": ["d7CcJUrI6MAugK5k", "ypNrp2nFe9FmN86s", "K5LOq4ft5jGcMICP"], "roleId": "UYnfG6jl9U4jRete"}, {"affectedClientIDs": ["IMgzISomCsodJrhQ", "W41q2OspCZbt3Uta", "5I0uGcL1koyHjCH5"], "domain": "olYLETRpABAmO2EG", "namespaces": ["vJ4UMS93yOxNInDB", "yhnoluO6ti0QP2ss", "iJ66OzOj84O6tgoh"], "roleId": "jtC7bzjPpucddXJ5"}], "Secret": "zifF8y959anrNSle", "TeamID": "ywHbHig6IKWVZ77K", "TokenAuthenticationType": "eRWdECaFGzfZ2hxc", "TokenClaimsMapping": {"J2Fnemn7M23SzUo4": "hNBDh9ZFP1OW0nXO", "ErQPS4VsRoYIK69y": "g9ADCGiXaLs2xjHk", "inOD975nARHCmhNH": "SXuqIHsxvaUoXDmw"}, "TokenEndpoint": "WsukxncuD3QxCXMd", "UserInfoEndpoint": "00YBWCaVVmM45mfI", "UserInfoHTTPMethod": "ZsWhkS476dGGJwJ0", "scopes": ["0UH197MJ6zU7JLMQ", "yMWzYQCAaPJgoxGJ", "oJaSzUtY4ZD0Xtb0"]}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 144 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'U4pH16NUsVY21NVI' \
    --body '{"affectedClientIDs": ["s7NRen2Y3Ns0QJQe", "aWytPfds1BYx0EaU", "Rydf8ZyyZeHAWGgJ"], "assignedNamespaces": ["UbUJRMbkcTglbU86", "FyOjApNHBVfNOURc", "jY3YYT9oTynmfIuB"], "domain": "WgJTNFfM8M0IW4oe", "roleId": "8KDgy0xZfAcNg14W"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 145 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 's8TIP1LKiFQoLDvu' \
    --body '{"domain": "mfqrgSfnx2h61X9d"}' \
    > test.out 2>&1
eval_tap $? 145 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 146 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'N1MGRXBJ6mVV7JS9' \
    > test.out 2>&1
eval_tap $? 146 'RetrieveSSOLoginPlatformCredential' test.out

#- 147 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qjNLwvI8JdiY3RRi' \
    --body '{"acsUrl": "LilmOGF6dLLIeIVI", "apiKey": "jMcdlbdRXTGIrdNL", "appId": "5gJPqTAjgqaTHf1A", "federationMetadataUrl": "NTJ9Yk997XkGOdC6", "isActive": false, "redirectUri": "txDT8p4n4XCFkD1A", "secret": "JLCwszbZxuHSgDOK", "ssoUrl": "8bjoF7bL2635KbtZ"}' \
    > test.out 2>&1
eval_tap $? 147 'AddSSOLoginPlatformCredential' test.out

#- 148 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TGJpqgl2IzNXGTuQ' \
    > test.out 2>&1
eval_tap $? 148 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 149 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PIDpor7t1aJLNNz6' \
    --body '{"acsUrl": "QIVC9Mfuc8VOsnmn", "apiKey": "lVljdWYmELe74p38", "appId": "vumnxAnYBTxaTIz0", "federationMetadataUrl": "jcgDI8Pkz96vd80m", "isActive": true, "redirectUri": "MrBZo0lNUBDShHD3", "secret": "2vvL28FPwTiXfLcx", "ssoUrl": "DC9Ynd02mECIQhfI"}' \
    > test.out 2>&1
eval_tap $? 149 'UpdateSSOPlatformCredential' test.out

#- 150 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hHtADUQ9zimQTQT9' \
    --rawPID  \
    --body '{"platformUserIds": ["5pFJUAJsyAfeKOuf", "V4f15NohXu6opxQG", "Rt6PqlkL0diRhLC1"]}' \
    > test.out 2>&1
eval_tap $? 150 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 151 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0ih2EQfY3XCv4hdO' \
    --platformUserId 'a6FdZhNMd1onFjGR' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserByPlatformUserIDV3' test.out

#- 152 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'bxtABPXDmgNEJBhg' \
    --after '67' \
    --before '77' \
    --limit '34' \
    > test.out 2>&1
eval_tap $? 152 'GetAdminUsersByRoleIdV3' test.out

#- 153 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'WzMuv3zkUY0n0BAZ' \
    > test.out 2>&1
eval_tap $? 153 'AdminGetUserByEmailAddressV3' test.out

#- 154 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": false}, "userIds": ["3IFbRkPSSITz4TjC", "rJHXGXku2YVuOzhx", "HmnrrV9ZGWrZ05sx"]}' \
    > test.out 2>&1
eval_tap $? 154 'AdminBulkUpdateUsersV3' test.out

#- 155 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'e6A6RpmKDebNkylb' \
    --body '{"bulkUserId": ["ynkgT9vayLLiizac", "7Ge6zKJdlt7rjF5R", "aJwvkWVco2LTo5ij"]}' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetBulkUserBanV3' test.out

#- 156 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["lvDF8qBWCQ9dLWYy", "S8zdhMeBXH8x6HdV", "fZVDAiU6iJOF7JKZ"]}' \
    > test.out 2>&1
eval_tap $? 156 'AdminListUserIDByUserIDsV3' test.out

#- 157 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["FNk2NKy59X8iOg2s", "VBiCoeC5weXJl7Pe", "iMH8z8dVej8N2yv6"]}' \
    > test.out 2>&1
eval_tap $? 157 'AdminBulkGetUsersPlatform' test.out

#- 158 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["VTnOK7xAvM7tuL81", "lsR7xxSVp3Gd2TK0", "HzYviTgYmx82JVBR"], "isAdmin": false, "namespace": "PZ6Iz8tne5dbguBF", "roles": ["6Gsvvdl8jHz9x7XZ", "IjU4IK9lOLaZaMph", "KCqTq3EVheJjoEEX"]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminInviteUserV3' test.out

#- 159 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '38' \
    --platformUserId 'LIxGnNuhoJM3WWPv' \
    --platformId 'vCiCf33ViEdqQpoG' \
    > test.out 2>&1
eval_tap $? 159 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 160 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 160 'AdminListUsersV3' test.out

#- 161 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'UWNizk5UcPAGv6c1' \
    --endDate 'ESC6hZYTYZbzf5aA' \
    --includeTotal  \
    --limit '80' \
    --offset '86' \
    --platformBy 'NNs5kgSZZNUHbIT9' \
    --platformId 'szApmWJO5vzzXZj0' \
    --query '8a6K1XRVfriSpPFn' \
    --roleIds 'ZBJZkDnEiyfa2Lrn' \
    --skipLoginQueue  \
    --startDate 'pZxNnLRH36bqS2oF' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 161 'AdminSearchUserV3' test.out

#- 162 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["Y76PU1AziBOHEAj1", "cT3u6Zc2FbrTFznT", "gDIwZIRWf6T3by2k"]}' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetBulkUserByEmailAddressV3' test.out

#- 163 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YSCdnFKLc0xcTjqj' \
    > test.out 2>&1
eval_tap $? 163 'AdminGetUserByUserIdV3' test.out

#- 164 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dcEfU61OJYMnW49r' \
    --body '{"avatarUrl": "Wynp1ck1vT90C6o8", "country": "6cSRL9cgbUmulhe9", "dateOfBirth": "8oaFKlQicdrxVhrt", "displayName": "wSd9QWVMYz7TU1Ts", "languageTag": "xsChSclSkb5aBi9K", "skipLoginQueue": true, "uniqueDisplayName": "zyv6gFZXI5nXJ7hL", "userName": "i6HweweRmyo91dIn"}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserV3' test.out

#- 165 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7QqXBDXJcrqKmXDw' \
    --activeOnly  \
    --after 'oEV6tCdrxw1KOPhu' \
    --before 'vHuYrGWDK41uMOC0' \
    --limit '26' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetUserBanV3' test.out

#- 166 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lvGjVQ4aebjfgGu4' \
    --body '{"ban": "72oWJlfglLM4xjfk", "comment": "NL4lU6jaGfsD1cfs", "endDate": "wmeFpvtDtetoQVFL", "reason": "8LNW11vtpaTxi7k4", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 166 'AdminBanUserV3' test.out

#- 167 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9jRCn48bvkCPfKof' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserBanSummaryV3' test.out

#- 168 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'wXOIZZQAJza84lKK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mVOaTS6xBbNrSUAW' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 168 'AdminUpdateUserBanV3' test.out

#- 169 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VhFJTxFHITBg9x4u' \
    --body '{"context": "nq3eOMHIKeTyBG5d", "emailAddress": "CUoExnKfV3869IN4", "languageTag": "V1OdhH4GVU7Exlkm"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminSendVerificationCodeV3' test.out

#- 170 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'c4xYiLjLyZrXr9Bh' \
    --body '{"Code": "tzn8jAdTn6xBhrci", "ContactType": "ryLm67rkadH5Y41S", "LanguageTag": "LjCPrFa05Xl5TPC5", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 170 'AdminVerifyAccountV3' test.out

#- 171 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'DS44bmm7jPdKLddf' \
    > test.out 2>&1
eval_tap $? 171 'GetUserVerificationCode' test.out

#- 172 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dsUqjXVzW1QqxnWR' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetUserDeletionStatusV3' test.out

#- 173 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5sheLgsAF4ctv5gu' \
    --body '{"deletionDate": 50, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 173 'AdminUpdateUserDeletionStatusV3' test.out

#- 174 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cGiq9j2EyIknfLDp' \
    > test.out 2>&1
eval_tap $? 174 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 175 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gHnMOn8nc3gUZ8ZF' \
    --body '{"code": "yyEr0KBXuJBqK4Qt", "country": "EydPWLPBYiR3UbJc", "dateOfBirth": "1ZYapx7C477etqgf", "displayName": "OJDUT0uKAPrARya2", "emailAddress": "IMlNiXpF4qvsUUpH", "password": "qi33TcBGkc0HjUcn", "uniqueDisplayName": "kpU9oVzl2kBuLFXI", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 175 'AdminUpgradeHeadlessAccountV3' test.out

#- 176 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZjiMY4H34B6wVd8i' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserInformationV3' test.out

#- 177 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pcKDwQeUWtjCC2UH' \
    --after '0.9383410041664043' \
    --before '0.146372101448771' \
    --limit '52' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetUserLoginHistoriesV3' test.out

#- 178 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FaepA3b3YJ9nJM6v' \
    --body '{"languageTag": "tT27xv85K5MU2qmb", "newPassword": "eqaVemINdClpF7Ov", "oldPassword": "lBIEgjse5kd6GEDo"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminResetPasswordV3' test.out

#- 179 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '08yq5E5HleLoog4m' \
    --body '{"Permissions": [{"Action": 9, "Resource": "L5W4tKt6G3j9LYdG", "SchedAction": 94, "SchedCron": "xVPqBqe9RDQMBSYA", "SchedRange": ["FLqp8PF5hCcoukWp", "nbz4ys7j6lxuU3u2", "HEG0qfKegvFTD1sP"]}, {"Action": 50, "Resource": "8Pa3uNGKhaLlJzJM", "SchedAction": 91, "SchedCron": "4G1LZ1HaX5UBMbsF", "SchedRange": ["44VTsLDRzdq22cbn", "yK3ggFDh2kaZP7pn", "nVfxPwc259HF9ejH"]}, {"Action": 2, "Resource": "qh7GAi4FEIu44u83", "SchedAction": 77, "SchedCron": "24ouSgkpK70uJmUL", "SchedRange": ["0uzElixc023dIvDi", "A0tQWlHwBcTtztx3", "VAl6tXFbnATCzUOI"]}]}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserPermissionV3' test.out

#- 180 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zVcy9k3ie64Vnwa0' \
    --body '{"Permissions": [{"Action": 57, "Resource": "a5v5P5Cj8hgFsqHC", "SchedAction": 6, "SchedCron": "h5JPiMEtgKuiGTYg", "SchedRange": ["wWv5XldL6rOVGcRA", "n51rVAQSxp4qTB54", "mKA3V9DKlCeZ7mLY"]}, {"Action": 38, "Resource": "df4r916GPrhn2etV", "SchedAction": 70, "SchedCron": "S3lJ80YJ41U4ooQ9", "SchedRange": ["80ywmg1pWpWit1QC", "7FKe0fnHUlmU1unG", "KM0tgfeWy47bbwMI"]}, {"Action": 27, "Resource": "gGmvK9gW596FwBNr", "SchedAction": 65, "SchedCron": "UKsI5y0mR3zMyTsf", "SchedRange": ["tKqnsIJctAdxyZVK", "HA9DkaSOWgtg8yw8", "lHEbVDwBAqanOlsc"]}]}' \
    > test.out 2>&1
eval_tap $? 180 'AdminAddUserPermissionsV3' test.out

#- 181 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RIWw82k5K5VTkdub' \
    --body '[{"Action": 20, "Resource": "UaDSwwQlnNRZJHBS"}, {"Action": 57, "Resource": "gqzZv5kVu4S95mj8"}, {"Action": 32, "Resource": "Rvae4f4lhBPbarbW"}]' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteUserPermissionBulkV3' test.out

#- 182 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '62' \
    --namespace "$AB_NAMESPACE" \
    --resource 'KbLu8pnK34oA1keY' \
    --userId 'XJvtggDdXjbdjMBa' \
    > test.out 2>&1
eval_tap $? 182 'AdminDeleteUserPermissionV3' test.out

#- 183 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hFZZGMTcqnWrIprO' \
    --after 'v0BJ9Sgl7H1sdH2R' \
    --before 'IJz1eI7Q5pu9PutL' \
    --limit '10' \
    --platformId 'hddMzMTQ9P7sYLDW' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetUserPlatformAccountsV3' test.out

#- 184 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'AJOA75K4BYJ2fkqY' \
    > test.out 2>&1
eval_tap $? 184 'AdminGetListJusticePlatformAccounts' test.out

#- 185 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'JoF2FI3vyyqRzc20' \
    --userId 'O7FdsJP1G9tyBTfE' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetUserMapping' test.out

#- 186 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'RXdvgD1Qf7Ot2DkU' \
    --userId 't3yexZBRvxYnEBhX' \
    > test.out 2>&1
eval_tap $? 186 'AdminCreateJusticeUser' test.out

#- 187 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'tAVxCd3meTrT7cF9' \
    --skipConflict  \
    --body '{"platformId": "oVCh89wNOkKYssVe", "platformUserId": "jcL3kR3hCGNgaJmu"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminLinkPlatformAccount' test.out

#- 188 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ALlMQl9RLrthbfp0' \
    --userId 'VgweLlT2sY3SsTnD' \
    --body '{"platformNamespace": "QY7kKU2u06Q4veuj"}' \
    > test.out 2>&1
eval_tap $? 188 'AdminPlatformUnlinkV3' test.out

#- 189 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xtyQENvJrBCqeg67' \
    --userId 'd4RWOqO4U0bitNQL' \
    > test.out 2>&1
eval_tap $? 189 'AdminPlatformUnlinkAllV3' test.out

#- 190 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zwRoWnR0AbkCPY70' \
    --userId 'FmvviVIBbcujF8Vk' \
    --ticket '5qb8NhWWwaxyMchk' \
    > test.out 2>&1
eval_tap $? 190 'AdminPlatformLinkV3' test.out

#- 191 AdminDeleteUserLinkingHistoryByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingHistoryByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 't8l5IPSrwrJl7wYI' \
    --userId 'Vw13NCo9yXlbQ52F' \
    > test.out 2>&1
eval_tap $? 191 'AdminDeleteUserLinkingHistoryByPlatformIDV3' test.out

#- 192 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'THTCj6SEAzT7TOpy' \
    --userId 'iuvvQUm29Iacq4XR' \
    --platformToken 'LaA643nTMtXSAyej' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 193 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nny0Ju13b6o5uB2X' \
    --userId 'M6IHy7EEvHyLmcvr' \
    > test.out 2>&1
eval_tap $? 193 'AdminGetUserSinglePlatformAccount' test.out

#- 194 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZZOdwe1x8RjU6Bi8' \
    --body '["JXE52sUBBq2SimQQ", "oLbe5YOJvxGRxUzr", "TwagH7BMT1IZKTdN"]' \
    > test.out 2>&1
eval_tap $? 194 'AdminDeleteUserRolesV3' test.out

#- 195 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FVBQ1crBXAupATO8' \
    --body '[{"namespace": "uXsqVpdiWo8SjDAM", "roleId": "0Riw8wLYW3n4F3LD"}, {"namespace": "1EDwBXw5uBYeQZOz", "roleId": "ATNSV9E9yyNb7yaL"}, {"namespace": "XzAVYymOuhCkZu4h", "roleId": "trsf8eIFSovTGXaM"}]' \
    > test.out 2>&1
eval_tap $? 195 'AdminSaveUserRoleV3' test.out

#- 196 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'sq8ePN1oco2jx8Up' \
    --userId 'e8SjMvpqM8puggOE' \
    > test.out 2>&1
eval_tap $? 196 'AdminAddUserRoleV3' test.out

#- 197 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'dG47gD5i2Ni6AnWn' \
    --userId '3NdEPhNHSH7eKDfR' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteUserRoleV3' test.out

#- 198 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cngEpTnRUQr3RLOM' \
    --body '{"enabled": true, "reason": "vEx4gqDY6jwyKRxh"}' \
    > test.out 2>&1
eval_tap $? 198 'AdminUpdateUserStatusV3' test.out

#- 199 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'kLe5zohg9s9utRQt' \
    --body '{"emailAddress": "28b6o3K0COF74tz6", "password": "aeXZOYwbwjMNdxKW"}' \
    > test.out 2>&1
eval_tap $? 199 'AdminTrustlyUpdateUserIdentity' test.out

#- 200 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lBfnRyFS0Ed7gTM5' \
    > test.out 2>&1
eval_tap $? 200 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 201 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'AVrtBQiDTcNnZa6Z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "uxk6u6HXXdiC9ZDj"}' \
    > test.out 2>&1
eval_tap $? 201 'AdminUpdateClientSecretV3' test.out

#- 202 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId '4E4mv12FNXypoOLl' \
    > test.out 2>&1
eval_tap $? 202 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 203 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after '13j84P0KqirJ4PkM' \
    --before 'FtsnFfz8Ew0X8fBu' \
    --isWildcard  \
    --limit '57' \
    > test.out 2>&1
eval_tap $? 203 'AdminGetRolesV3' test.out

#- 204 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "managers": [{"displayName": "tz50D3rpBfBovqLw", "namespace": "XBuT30EYeRj17xGh", "userId": "aBKoUfiHjGmCyPsK"}, {"displayName": "CJTv1ic9gvagF2cS", "namespace": "uztsJ5tj64gV7nmD", "userId": "k29mcjSuz9vbNStq"}, {"displayName": "PtQmQN6eKAGiZFCf", "namespace": "tT0RWECdjWYrnulx", "userId": "cCKAru8pOaAVLDB4"}], "members": [{"displayName": "k3JwkdaxR7GJpYmu", "namespace": "YCPG181q9GA5DydC", "userId": "2D8UT6KOc4VPDUR9"}, {"displayName": "ayazqXRqegIUicYX", "namespace": "XzxsBFrUs9BYp6Tg", "userId": "CejBd5o7iTST7R3K"}, {"displayName": "bbQGERMNpqWb51y5", "namespace": "RUzvMfTkPy0fGvTG", "userId": "gfLKsg0b1Bq78cE5"}], "permissions": [{"action": 84, "resource": "4HZHNyq9odanhR1Z", "schedAction": 35, "schedCron": "H3rVaauufxkPHElu", "schedRange": ["g48TgfNu0rqXUOyT", "oLPIREGIKlJt3EP9", "kKwkENQ8VOHGwbAD"]}, {"action": 79, "resource": "8Gwjg3IOH0SDHgYK", "schedAction": 33, "schedCron": "oODXMzLSrzoiBnYi", "schedRange": ["5UWs3tYlYeMoCimJ", "ySocRvUWDOrFZKPN", "oN9AWtLK9TFgi9j2"]}, {"action": 18, "resource": "Mh9WpifqjNjLOtNQ", "schedAction": 40, "schedCron": "KVpULjjiw3NeVG4D", "schedRange": ["Ji9DaMrc0WFgKjE9", "45x2CPVYYG9WvoGm", "AmvaVV5YfxnUNcwj"]}], "roleName": "r7gSGhnfuF4WZiQV"}' \
    > test.out 2>&1
eval_tap $? 204 'AdminCreateRoleV3' test.out

#- 205 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'ICVpWd3UM08gMXhd' \
    > test.out 2>&1
eval_tap $? 205 'AdminGetRoleV3' test.out

#- 206 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'f3juXW4JprIb3CJC' \
    > test.out 2>&1
eval_tap $? 206 'AdminDeleteRoleV3' test.out

#- 207 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'AtvSG8Cfa9dzOJDG' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "THIOFjeXbsSgR43k"}' \
    > test.out 2>&1
eval_tap $? 207 'AdminUpdateRoleV3' test.out

#- 208 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'IDzxBwqRJTzrHNZW' \
    > test.out 2>&1
eval_tap $? 208 'AdminGetRoleAdminStatusV3' test.out

#- 209 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'Usq5lQo2jy29EJig' \
    > test.out 2>&1
eval_tap $? 209 'AdminUpdateAdminRoleStatusV3' test.out

#- 210 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'qYhyVhURx1yPeczR' \
    > test.out 2>&1
eval_tap $? 210 'AdminRemoveRoleAdminV3' test.out

#- 211 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'pdk0HATGylx2JG2K' \
    --after 'NGfhzfCTxxrsRRLe' \
    --before 'e3TcJ7DQIi45aCDH' \
    --limit '81' \
    > test.out 2>&1
eval_tap $? 211 'AdminGetRoleManagersV3' test.out

#- 212 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'uOQIybqWfG9BJ6FV' \
    --body '{"managers": [{"displayName": "KlbYHtbPtaxvagSl", "namespace": "pGgVTF6VeDAPOGBw", "userId": "weyFfXEOEAEtbag8"}, {"displayName": "2KgBgyCd5vjkfz3e", "namespace": "R4DtNp129hzBw3xL", "userId": "UcCEt0DzmkJq1sml"}, {"displayName": "5bYt76BNsi4giR94", "namespace": "34WpKKdzxoufCNlF", "userId": "oOcWQQy4bjmQeEwe"}]}' \
    > test.out 2>&1
eval_tap $? 212 'AdminAddRoleManagersV3' test.out

#- 213 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'oBHTdwAk7ZQnbqY1' \
    --body '{"managers": [{"displayName": "cQwVEtAr5kKKAo9M", "namespace": "M2Cqm84jVi9kIpqg", "userId": "rzpUkNOBWydXV0Fi"}, {"displayName": "02aFr8CDapjwNOl4", "namespace": "k8rVNrm8drv8QD2J", "userId": "Oe2Ntz7EFvowPgIG"}, {"displayName": "uetxFMqXCQMAqQ2Z", "namespace": "RGzNtrThFa9XU8mo", "userId": "sluiHZJ7O8sAQ32w"}]}' \
    > test.out 2>&1
eval_tap $? 213 'AdminRemoveRoleManagersV3' test.out

#- 214 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'j9uaDzsr9xYiWRuu' \
    --after 'zQJiLc1eI9w3JEhx' \
    --before 'PGbEk7s7gw07Flou' \
    --limit '27' \
    > test.out 2>&1
eval_tap $? 214 'AdminGetRoleMembersV3' test.out

#- 215 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'Jdre5ur6yvWJDdvM' \
    --body '{"members": [{"displayName": "7T7PX2vamIRZHzsI", "namespace": "YOCUoiCXNjrdQL2j", "userId": "dx1eIba1sB0HsJ06"}, {"displayName": "DzfbzRYt4OVUyumB", "namespace": "eIqdQGZC5kM03HHi", "userId": "jsQRj7N8IAjmsonj"}, {"displayName": "j0ZR50BQ1U6aFD3O", "namespace": "2kXQSc58zgZVl4gI", "userId": "F7v3qbZu9M3OxqVA"}]}' \
    > test.out 2>&1
eval_tap $? 215 'AdminAddRoleMembersV3' test.out

#- 216 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'T4H1lRZ9Z1JBrHRz' \
    --body '{"members": [{"displayName": "EOtIxzPqb6n73m0j", "namespace": "iaDH86d9rsKgzCsM", "userId": "ulpB8HZUtVVaJCiL"}, {"displayName": "gKOwrSfWhT5B4Wed", "namespace": "opzwSluBtRFPKThy", "userId": "GnbjmPDKFS6u9FHu"}, {"displayName": "v1M3qfch4SqIV6LQ", "namespace": "PHlaeYl4csFq65cU", "userId": "66yJaj4ovoKWE4EW"}]}' \
    > test.out 2>&1
eval_tap $? 216 'AdminRemoveRoleMembersV3' test.out

#- 217 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId '0sw8v5peiuxoBJAT' \
    --body '{"permissions": [{"action": 2, "resource": "p2mWAOYksczxBS0O", "schedAction": 56, "schedCron": "yilUEujk6oqYo1HQ", "schedRange": ["YTFzwdOMdupwD4O3", "uNbcIDcIyvZbOy1T", "4hfwkuVykH4Rpfmj"]}, {"action": 70, "resource": "qxH46fRTSZoDdT0f", "schedAction": 8, "schedCron": "t9P1Tkm08luh4dpP", "schedRange": ["RMDbUXBWTbpAogG2", "wlZkLhuU5FI8NijF", "I0GKwJ3vfXlsAMy2"]}, {"action": 64, "resource": "p2UAGxHnmSxvkG9U", "schedAction": 90, "schedCron": "ITuymTBjn3d2sFzM", "schedRange": ["S3QaVjZF7Ax6115K", "g9U8vrQJXQxoIbVi", "2CLEk277Ivjj1A64"]}]}' \
    > test.out 2>&1
eval_tap $? 217 'AdminUpdateRolePermissionsV3' test.out

#- 218 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId '7XQ3koaAfZIim0sF' \
    --body '{"permissions": [{"action": 86, "resource": "aieEbPSE7TGkeHsY", "schedAction": 37, "schedCron": "4kEWYkO6KrKUMhJr", "schedRange": ["ASBh61hmWKSSrF35", "anDGvur19V18oIrU", "KXttgAI2QdWJFLmo"]}, {"action": 86, "resource": "8uYbe4Cf2HEHvVev", "schedAction": 14, "schedCron": "gj5vyUMAAmIHYbsx", "schedRange": ["G5N066FXb88SbLOa", "21DiSFsm0XXQJWsz", "vTQEuALzDNp1SZ58"]}, {"action": 1, "resource": "BXFIqFUmgUSMM5au", "schedAction": 62, "schedCron": "GJT0mkVPI6zUtf3Q", "schedRange": ["aJPGrTNcXXTUIggo", "H89QNmI17UDb19R6", "H7r1ta3m7jK5pxe8"]}]}' \
    > test.out 2>&1
eval_tap $? 218 'AdminAddRolePermissionsV3' test.out

#- 219 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId '2pgFiAS6piIzmc8r' \
    --body '["KrKEPGSAcong6eNE", "RUf8kjci1Ctccv9G", "v4tOcbnuCqf0lm6W"]' \
    > test.out 2>&1
eval_tap $? 219 'AdminDeleteRolePermissionsV3' test.out

#- 220 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '57' \
    --resource 'fHaGr5kdazlypvt6' \
    --roleId 'lSLfU7HByGXPMqxj' \
    > test.out 2>&1
eval_tap $? 220 'AdminDeleteRolePermissionV3' test.out

#- 221 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 221 'AdminGetMyUserV3' test.out

#- 222 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId '4hBgVY3YAxZLKbcO' \
    --extendExp  \
    --redirectUri 'dyjqf6Q4oiwoJcaR' \
    --password 'MEb15LBlTVufc5Zy' \
    --requestId 'ODR2NVyn4PRqf3eR' \
    --userName 'bZqBAoKGcVCdMiSN' \
    > test.out 2>&1
eval_tap $? 222 'UserAuthenticationV3' test.out

#- 223 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'V4qBrt1kcLmRv6EJ' \
    --linkingToken 'tl5xWnsb8oWq94RI' \
    --password 'mNWVIJnhhwFDV1Vi' \
    --username 'taomvWTzdsW4N70w' \
    > test.out 2>&1
eval_tap $? 223 'AuthenticationWithPlatformLinkV3' test.out

#- 224 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'YS4Kj7Yi2VvoQNW8' \
    --extendExp  \
    --linkingToken 'Yc481dYdvGxJAMDR' \
    > test.out 2>&1
eval_tap $? 224 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 225 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'A1LF7jdWlekFwO94' \
    > test.out 2>&1
eval_tap $? 225 'RequestOneTimeLinkingCodeV3' test.out

#- 226 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'VBCV9qJhWva2FPBu' \
    > test.out 2>&1
eval_tap $? 226 'ValidateOneTimeLinkingCodeV3' test.out

#- 227 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'jX0geYCpGJM4sqsP' \
    --isTransient  \
    --clientId 'NJMiZXXOFwmGWAvN' \
    --oneTimeLinkCode 'F0Z0GkwxUNYyNwGi' \
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
    --codeChallenge 'KrknH0Y5mrQgLC6D' \
    --codeChallengeMethod 'plain' \
    --clientId 'qsFiQHglUQMZi5Wj' \
    > test.out 2>&1
eval_tap $? 230 'RequestTokenExchangeCodeV3' test.out

#- 231 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MZfOadpgegCUjTdi' \
    --userId '1Ehr8OtqpNJ9R8Tu' \
    --platformUserId 'Ny4ejmVA3vMCsGyP' \
    > test.out 2>&1
eval_tap $? 231 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 232 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'd12B8QNUz0hFFNbH' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 232 'RevokeUserV3' test.out

#- 233 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge '6j2W4roZM2UKAXEE' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'JdXzRxfNEjUMTs8W' \
    --redirectUri 'IObJBTsvsw76uISR' \
    --scope 'X0bKVoWtoUW1P7oc' \
    --state 'uBAldDSUS7Haa6un' \
    --targetAuthPage 'q1yQOSRvyiLBRVtI' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'Di2piIQFVmzMidw7' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 233 'AuthorizeV3' test.out

#- 234 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'Oe9Eevf1fhMg1E2k' \
    > test.out 2>&1
eval_tap $? 234 'TokenIntrospectionV3' test.out

#- 235 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 235 'GetJWKSV3' test.out

#- 236 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId '7QLFrVgtX7y0fPOi' \
    --factor 'eDCow2zXyFFVpM87' \
    --mfaToken 'yqEwEacQMTlqN4LK' \
    > test.out 2>&1
eval_tap $? 236 'SendMFAAuthenticationCode' test.out

#- 237 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'kxJ5v3SBafnKNiMP' \
    --mfaToken 'bFkFGA85W3HJkqgS' \
    > test.out 2>&1
eval_tap $? 237 'Change2faMethod' test.out

#- 238 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code '2B37wwoPYOHiIsxm' \
    --factor 'sLBPBJuNLnWRrtW8' \
    --mfaToken '70qD88ZcduZSe7W2' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 238 'Verify2faCode' test.out

#- 239 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0UZcDaiq0nEZ7Pyh' \
    --userId 'qFJkDClOsKmfsgJd' \
    > test.out 2>&1
eval_tap $? 239 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 240 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'mzsDPsWh1k0cQ08N' \
    --clientId 'G6dX2TZkil67kRng' \
    --redirectUri 'oUa83ECh1gqPeS19' \
    --requestId '3TNNzot3sVli3GN2' \
    > test.out 2>&1
eval_tap $? 240 'AuthCodeRequestV3' test.out

#- 241 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'XTrFibRAhzzEWzWl' \
    --additionalData 'TY70qdgJRvpZrSpW' \
    --clientId 'X3KEe2BjV00ReCXF' \
    --createHeadless  \
    --deviceId 'ffjJJxlgjzIhpgOo' \
    --macAddress 'IOD74V21HWDAfvXw' \
    --platformToken 'dxbyp4HAPbBbNPSt' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 241 'PlatformTokenGrantV3' test.out

#- 242 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 242 'GetRevocationListV3' test.out

#- 243 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'VBUpKgOssFkz0F36' \
    > test.out 2>&1
eval_tap $? 243 'TokenRevocationV3' test.out

#- 244 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'piDYXeHZ7FHls3ny' \
    --simultaneousTicket 'vconqbHQqKLQKe3x' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket 'huTmnq3FGQn3Ahu5' \
    > test.out 2>&1
eval_tap $? 244 'SimultaneousLoginV3' test.out

#- 245 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'wxq6oJq4mChmQHQh' \
    --clientId 'O9IKBXDFQfXFD58s' \
    --code 'G6uDhFYlrzJBYSeM' \
    --codeVerifier 'uJfQecutjS029BiJ' \
    --extendNamespace 'WOG1m7MKclr5igjN' \
    --extendExp  \
    --password 'TVItrH2X78hxJgaV' \
    --redirectUri 'fw5Vnyq8OzTE89WD' \
    --refreshToken 'NoMcOmbfJrCJQIj1' \
    --username 'haAosKglqaCXE9yt' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 245 'TokenGrantV3' test.out

#- 246 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token '1uc28HoSpGt1g0GG' \
    > test.out 2>&1
eval_tap $? 246 'VerifyTokenV3' test.out

#- 247 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'bT4Hf2PPKOldkbgX' \
    --code '9CWJKwXXSbv5eg9q' \
    --error '86IaDFjjx6uZerWb' \
    --openidAssocHandle 'twTX9gNRByjbE8lO' \
    --openidClaimedId 'LAfTXKLzbrddqcKL' \
    --openidIdentity 'a7LevxNHOSEhQRZI' \
    --openidMode 'p693lRwtc43atCuC' \
    --openidNs 'Fxbfbz4aQERziPL4' \
    --openidOpEndpoint 'dHhOqG5KDdUvk0LE' \
    --openidResponseNonce 'i26Ls7mjRxNmvvNt' \
    --openidReturnTo 'jJNQepUTGhwlY4lP' \
    --openidSig 'zlsCR5rVsyfcH7Wj' \
    --openidSigned 'P7HuGz3b5WAEvdRF' \
    --state '9bqMj4ro5B19VE83' \
    > test.out 2>&1
eval_tap $? 247 'PlatformAuthenticationV3' test.out

#- 248 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId '8c7OydVw0zCqoMZv' \
    --platformToken 'pIOO97DmQ5ZOzx6i' \
    > test.out 2>&1
eval_tap $? 248 'PlatformTokenRefreshV3' test.out

#- 249 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'CJTu60IifzMhkk5P' \
    > test.out 2>&1
eval_tap $? 249 'PublicGetInputValidations' test.out

#- 250 PublicGetInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidationByField \
    --field 'xsjqbCKpMv2Yky9D' \
    > test.out 2>&1
eval_tap $? 250 'PublicGetInputValidationByField' test.out

#- 251 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'YkD2sIllFtBtXJKG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 251 'PublicGetCountryAgeRestrictionV3' test.out

#- 252 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey '3rqBmILhtWm8RQvR' \
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
    --clientId 'UbUDSiefGEdLucrt' \
    > test.out 2>&1
eval_tap $? 255 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 256 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'O2gCQD057DrDlgC2' \
    --rawPID  \
    --body '{"platformUserIds": ["nzS9SiGUjVAw4v3q", "6JRHcn7KaoCEkRdo", "6qHYIZWnXqQ1oHFJ"]}' \
    > test.out 2>&1
eval_tap $? 256 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 257 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9Q0vqsL9SomqWsGA' \
    --platformUserId '76yxi0QzZWfmP2sx' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetUserByPlatformUserIDV3' test.out

#- 258 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId '0KO5bEJaPnAFjsod' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetAsyncStatus' test.out

#- 259 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'yJQVVBrShGbIIuqK' \
    --limit '59' \
    --offset '100' \
    --platformBy '403HgoXCR6XOMXwK' \
    --platformId 'dfqk8T4QHK30EX0F' \
    --query 'clpDl5HsuracO5Mn' \
    > test.out 2>&1
eval_tap $? 259 'PublicSearchUserV3' test.out

#- 260 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "jnxD1OXkxShFVQTR", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "LE46bpuJip8JyxJ3", "policyId": "9vrtuWWrqTZbSqBS", "policyVersionId": "Kp8AmgwhYzk33J34"}, {"isAccepted": false, "localizedPolicyVersionId": "DIbfT22G5NpE130Y", "policyId": "WSgxpKWtdtdtVW9a", "policyVersionId": "nENmxb9e7vXZV3ig"}, {"isAccepted": false, "localizedPolicyVersionId": "Jg5VByeI3ycMcYYB", "policyId": "ixKJXCISQdwec1m8", "policyVersionId": "BusV9tUh74KVo6Xq"}], "authType": "jz2xUKLNWSmYyVvy", "code": "elIJ8QgaLMqi836U", "country": "La7cfZl4VuY6rsZy", "dateOfBirth": "o6CBRRnoOikIxXKK", "displayName": "IR6kPmswm5TCAU1c", "emailAddress": "KApdJDnE73GLmSZn", "password": "s5owBhoUg4LsGP6K", "reachMinimumAge": false, "uniqueDisplayName": "PXkvUv2XiXaBzsma"}' \
    > test.out 2>&1
eval_tap $? 260 'PublicCreateUserV3' test.out

#- 261 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'xjTZPlLitytGka7K' \
    --query 'v5TacQKF4OlRGdmX' \
    > test.out 2>&1
eval_tap $? 261 'CheckUserAvailability' test.out

#- 262 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["xETLEQrr3KCAV9al", "q3hK1G4kKooSNNUZ", "uiynZ64IwncZPk82"]}' \
    > test.out 2>&1
eval_tap $? 262 'PublicBulkGetUsers' test.out

#- 263 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "GF3eTC0vzZUDj9dz", "languageTag": "GgGVxo9OHgfHumyf"}' \
    > test.out 2>&1
eval_tap $? 263 'PublicSendRegistrationCode' test.out

#- 264 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "uBNisecYbcOpR45V", "emailAddress": "DlvSc0Mr7ImwCwGq"}' \
    > test.out 2>&1
eval_tap $? 264 'PublicVerifyRegistrationCode' test.out

#- 265 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "Of0bNs97KvKyj3Mq", "languageTag": "S7Dcmtfh50eObbrm"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicForgotPasswordV3' test.out

#- 266 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'gjhWK0x0ZidAJ1CU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 266 'GetAdminInvitationV3' test.out

#- 267 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId '1eD1La16Bw3JbUnU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "Dh5yGjjv4Mwrv2va", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "Ri4bAQL7VE2wL8Y4", "policyId": "JFVUdzA8bvXlDhG7", "policyVersionId": "BrorbKIKuOXJPm5z"}, {"isAccepted": true, "localizedPolicyVersionId": "6soMaTvQq2a9YdFN", "policyId": "tRVSO0js0hG9xmSn", "policyVersionId": "zd7zgUxAogcnGkXk"}, {"isAccepted": false, "localizedPolicyVersionId": "7QPkJHRhmLKQuQVF", "policyId": "SKiXl8G2uf6E8Eaj", "policyVersionId": "XLSAS8MKMaxQ1QyJ"}], "authType": "CpKedhuzI7G9NCKK", "code": "Xu1bqI2M5PmXfKnQ", "country": "7BYGjCUDMOrbmoRv", "dateOfBirth": "WnfmGFy0eUoOBd90", "displayName": "h9EDqSTOfoNewWjw", "emailAddress": "MWDKEt6JhbJ0fwTD", "password": "aq6b5RpMwhWPtndr", "reachMinimumAge": false, "uniqueDisplayName": "1Oqn59tEGm9NYeUT"}' \
    > test.out 2>&1
eval_tap $? 267 'CreateUserFromInvitationV3' test.out

#- 268 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "5P0nx8TqSZdZ5C8m", "country": "FI9TnvzEqBNMF9CZ", "dateOfBirth": "vPxT5zbreMc9fBoU", "displayName": "3RHNDFjLKFrepy56", "languageTag": "eW1kmb15QeIQF51c", "uniqueDisplayName": "4MqJzDSvELgBe6db", "userName": "oSdhkBzAzPkt1efG"}' \
    > test.out 2>&1
eval_tap $? 268 'UpdateUserV3' test.out

#- 269 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "JeJaxyHYutgXucx8", "country": "5vHA009FAb21jxeW", "dateOfBirth": "Xk80y9uxgVLGgK8a", "displayName": "VSCN6oCETQ8gIDRd", "languageTag": "D2wwMXwKVXGPhEJs", "uniqueDisplayName": "c7rZpxaPHc9r8eTo", "userName": "FmkHJ6BPOKFLxIwK"}' \
    > test.out 2>&1
eval_tap $? 269 'PublicPartialUpdateUserV3' test.out

#- 270 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "ssw647YwDudnGRuf", "emailAddress": "OUGfMjTU226l07jP", "languageTag": "lcYaqYM7YfBmhjI9"}' \
    > test.out 2>&1
eval_tap $? 270 'PublicSendVerificationCodeV3' test.out

#- 271 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Y28qVceS9UX48dKP", "contactType": "CFUIeyYEymNXzNX6", "languageTag": "TGh4UdEweeBsJEvB", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 271 'PublicUserVerificationV3' test.out

#- 272 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "gtn5pUARJM1T8QwM", "country": "NOAzXmyHEV4g9P6a", "dateOfBirth": "280S5RNB5dVCsB7x", "displayName": "L4axSPgPCiwLxCFL", "emailAddress": "DixZwVtt3RVTl0tR", "password": "00oQgcHdGGK3x76U", "uniqueDisplayName": "1EIcklttmrpgF5sz", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 272 'PublicUpgradeHeadlessAccountV3' test.out

#- 273 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "VfjB0zi3XrYZUiN2", "password": "4ol1qqbalgizL97y"}' \
    > test.out 2>&1
eval_tap $? 273 'PublicVerifyHeadlessAccountV3' test.out

#- 274 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "cJV5YqE2myQzl7X9", "newPassword": "fHr6WvBxmBvNj3kt", "oldPassword": "aDf9B22HGgxakPt7"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicUpdatePasswordV3' test.out

#- 275 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'IYzaZUTmvsEzLPnn' \
    > test.out 2>&1
eval_tap $? 275 'PublicCreateJusticeUser' test.out

#- 276 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GsnfmBerp84qjwzW' \
    --redirectUri 'pCF1vyamjsEzwtLP' \
    --ticket 'xK1os4qR8LaQzEb3' \
    > test.out 2>&1
eval_tap $? 276 'PublicPlatformLinkV3' test.out

#- 277 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9sZTdFfC8x5aHLsX' \
    --body '{"platformNamespace": "Hlm1RJTTy9JrNz1K"}' \
    > test.out 2>&1
eval_tap $? 277 'PublicPlatformUnlinkV3' test.out

#- 278 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5M1qgFddYvifGHaw' \
    > test.out 2>&1
eval_tap $? 278 'PublicPlatformUnlinkAllV3' test.out

#- 279 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Nx6yhniEHLbEQKc0' \
    --ticket 'aUvrKXDIjYC4df9q' \
    > test.out 2>&1
eval_tap $? 279 'PublicForcePlatformLinkV3' test.out

#- 280 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'swSlpCI8DhjlxUyr' \
    --clientId 's3OSesE5p0DwUj2H' \
    --redirectUri 'KUvPYUcQBxMSdOOs' \
    > test.out 2>&1
eval_tap $? 280 'PublicWebLinkPlatform' test.out

#- 281 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'n2Nd8Jpa19GJDK46' \
    --code 'Eehx7xasqMY9auls' \
    --state 'L6NOV5agpS6A5mku' \
    > test.out 2>&1
eval_tap $? 281 'PublicWebLinkPlatformEstablish' test.out

#- 282 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fBpWVxIK9D2bTcga' \
    --code 'KoccaSwWcZmzCWGI' \
    --state '1cIQcPWAShIhieSK' \
    > test.out 2>&1
eval_tap $? 282 'PublicProcessWebLinkPlatformV3' test.out

#- 283 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "Uf3zKbyQk2vQTYX1", "userIds": ["xsth28NZZgsXycuQ", "NGIDeHlf6IcX1K9J", "rK6Or2xx7rLwrPoW"]}' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetUsersPlatformInfosV3' test.out

#- 284 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "iywnxuDLLuIaSxol", "emailAddress": "oIH1gBCWVFrvls0Z", "newPassword": "wosKhDlLfTKxpVOX"}' \
    > test.out 2>&1
eval_tap $? 284 'ResetPasswordV3' test.out

#- 285 PublicGetUserByUserIdV3
eval_tap 0 285 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 286 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vGSrdkqddI3ezqu6' \
    --activeOnly  \
    --after 'FB0sL2xt6fX9j7rh' \
    --before 'ZCAlDlVKBsLZiBRX' \
    --limit '37' \
    > test.out 2>&1
eval_tap $? 286 'PublicGetUserBanHistoryV3' test.out

#- 287 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7tcHrV0MbJGr4drg' \
    > test.out 2>&1
eval_tap $? 287 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 288 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kDuWS05m0pGzazM2' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetUserInformationV3' test.out

#- 289 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BUXnzUEWTiKMJAf6' \
    --after '0.43257001522940086' \
    --before '0.1111478677755342' \
    --limit '2' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetUserLoginHistoriesV3' test.out

#- 290 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TQO7KLdZDGwqx7T3' \
    --after 'l1ut2oyolliYsTJU' \
    --before 'mpscwLcUml3KuoMK' \
    --limit '15' \
    --platformId 'kRGkgqUNIbJMJ9AB' \
    > test.out 2>&1
eval_tap $? 290 'PublicGetUserPlatformAccountsV3' test.out

#- 291 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bKVWO2YEDiqkwKbp' \
    > test.out 2>&1
eval_tap $? 291 'PublicListJusticePlatformAccountsV3' test.out

#- 292 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'dk7wlDngNiPPjpSA' \
    --body '{"platformId": "lZwFGpea5ObBB49K", "platformUserId": "m4ClIQmkIdLCvNhZ"}' \
    > test.out 2>&1
eval_tap $? 292 'PublicLinkPlatformAccount' test.out

#- 293 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '6P8aqZ2yfrC1V7Zp' \
    --body '{"chosenNamespaces": ["JZPHCMqvcYmeDLYE", "zs2SQUdKr6vgqkjy", "cqclNlBORlC8Zkjs"], "requestId": "xYtgxplHTPLzynjF"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicForceLinkPlatformWithProgression' test.out

#- 294 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZgF3erw7UsyHq4bB' \
    > test.out 2>&1
eval_tap $? 294 'PublicGetPublisherUserV3' test.out

#- 295 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'b0n1JhPUS8BRPGV9' \
    --password 'n769zLJdKMexeJc7' \
    > test.out 2>&1
eval_tap $? 295 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 296 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'NvgTSgKjCxZjKf8N' \
    --before 'A4cGUaDfy9XnH2r0' \
    --isWildcard  \
    --limit '62' \
    > test.out 2>&1
eval_tap $? 296 'PublicGetRolesV3' test.out

#- 297 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId '1GS5YkyhAiAItnWU' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetRoleV3' test.out

#- 298 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 298 'PublicGetMyUserV3' test.out

#- 299 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'mD225fp1egsx3Erh' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 300 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["eNwqd5priclNNqLy", "rlzrJ4QHbfnAdtku", "jxHff7n1yaNCcjgF"], "oneTimeLinkCode": "hS0URBhl0L5FCbOn"}' \
    > test.out 2>&1
eval_tap $? 300 'LinkHeadlessAccountToMyAccountV3' test.out

#- 301 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "46W2B2uPQLrt2t6b"}' \
    > test.out 2>&1
eval_tap $? 301 'PublicSendVerificationLinkV3' test.out

#- 302 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'VpCgKvPXSDufmKh7' \
    > test.out 2>&1
eval_tap $? 302 'PublicVerifyUserByLinkV3' test.out

#- 303 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId '83cV54JsVBRB0rY0' \
    --code 'xfWddACyHSmo4KX9' \
    --error 'TPO3K1k5ZM8btmGs' \
    --state 'gXNXbpqxh76Af5JS' \
    > test.out 2>&1
eval_tap $? 303 'PlatformAuthenticateSAMLV3Handler' test.out

#- 304 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'wjw2fE2g6jXV7oai' \
    --payload '2oDm9FaP0HJ98tE4' \
    > test.out 2>&1
eval_tap $? 304 'LoginSSOClient' test.out

#- 305 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'UyoQg0b0sGOkzxVt' \
    > test.out 2>&1
eval_tap $? 305 'LogoutSSOClient' test.out

#- 306 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData '15LKmkQ7YBhsOuJ0' \
    --code 'ypkkt2G4eFh2YNsd' \
    > test.out 2>&1
eval_tap $? 306 'RequestTargetTokenResponseV3' test.out

#- 307 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '30' \
    --namespace "$AB_NAMESPACE" \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 307 'AdminListInvitationHistoriesV4' test.out

#- 308 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZcyGEHxAKDQher3u' \
    > test.out 2>&1
eval_tap $? 308 'AdminGetDevicesByUserV4' test.out

#- 309 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'sApPdJPn9eIdhIBv' \
    --endDate 'TTupABJ4RwH3EdKm' \
    --limit '43' \
    --offset '39' \
    --startDate 'l7gIKBc7OYTylFRA' \
    > test.out 2>&1
eval_tap $? 309 'AdminGetBannedDevicesV4' test.out

#- 310 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JKySnC0cfPl3Z2zS' \
    > test.out 2>&1
eval_tap $? 310 'AdminGetUserDeviceBansV4' test.out

#- 311 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "Bbs4PAV72u8AxE2I", "deviceId": "QeoxYV4UcYzswAGp", "deviceType": "XqQxctuVaqPJGAHE", "enabled": true, "endDate": "muQrZ8GaQ4OZ2nDo", "ext": {"dm4TNs8mAj6IKSYF": {}, "dJwgZsRPOzwuDSdG": {}, "l1A2vaNeDiSqTfmA": {}}, "reason": "Vg50kOdJagEmTuax"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminBanDeviceV4' test.out

#- 312 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'lxgywkbdOsyxX1tf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 312 'AdminGetDeviceBanV4' test.out

#- 313 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'W488oYUT4jyCVJ0V' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 313 'AdminUpdateDeviceBanV4' test.out

#- 314 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'obTlGVThz4bm41oI' \
    --startDate 'cV33yjPxibDjfF7J' \
    --deviceType 'kjCVpZKMxkFkBtXM' \
    > test.out 2>&1
eval_tap $? 314 'AdminGenerateReportV4' test.out

#- 315 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 315 'AdminGetDeviceTypesV4' test.out

#- 316 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'U6KRIm5xBoIi99ct' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 316 'AdminGetDeviceBansV4' test.out

#- 317 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'gFXasxp5h780ktjQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 317 'AdminDecryptDeviceV4' test.out

#- 318 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'w2yXzaQWaF2PqUfb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 318 'AdminUnbanDeviceV4' test.out

#- 319 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'pMpRl6xRyV19cbor' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 319 'AdminGetUsersByDeviceV4' test.out

#- 320 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 320 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 321 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 321 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 322 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 70}' \
    > test.out 2>&1
eval_tap $? 322 'AdminCreateTestUsersV4' test.out

#- 323 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "eCpqnZ5NW623WWn2", "policyId": "ZJY3QvRa7CDRTcsA", "policyVersionId": "HzD3dZyyWbUQpbcv"}, {"isAccepted": false, "localizedPolicyVersionId": "IwmL7a1K3zIUYJmd", "policyId": "F1YtWNSQlcMzxfpp", "policyVersionId": "NCrscDPbklTHcmgX"}, {"isAccepted": true, "localizedPolicyVersionId": "7sHCLup8pmEosOXg", "policyId": "lQwwdeLVpmXqRwVj", "policyVersionId": "c3W2ANmE3VVsQ1fm"}], "authType": "EMAILPASSWD", "code": "0GTJwEjoZrRtaeWK", "country": "MC8wsOByQAMAgqFE", "dateOfBirth": "zEt8umj5XhKnw7MH", "displayName": "DwFVKUC2ecnpUDqv", "emailAddress": "LQixPKVSmWa8TGko", "password": "16XTqHc0cM7ixq8T", "passwordMD5Sum": "jnxp5Cl8ggaEmCcu", "reachMinimumAge": true, "uniqueDisplayName": "hHviBEWpbusO6EyV", "username": "qstpgZpbz77y88rU"}' \
    > test.out 2>&1
eval_tap $? 323 'AdminCreateUserV4' test.out

#- 324 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": true, "userIds": ["L7jBF1R5OexAPzCG", "6ZKQClGc1636nbfM", "3J9G40Y62bCo941A"]}' \
    > test.out 2>&1
eval_tap $? 324 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 325 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["LznQuHVskfCjUK8G", "eX4Q0B2Cj0oOmBmX", "u1KiTTiz7yrIvQj2"]}' \
    > test.out 2>&1
eval_tap $? 325 'AdminBulkCheckValidUserIDV4' test.out

#- 326 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'isN7bRwcr16lW5Yw' \
    --body '{"avatarUrl": "gZpjlMMtPWg8217m", "country": "7qNkQiKp2oac8QTN", "dateOfBirth": "EuBbeuQqm9wM7mgT", "displayName": "tUdPVcQijMBhs0kD", "languageTag": "P6d3nuUZ41mSeS9S", "skipLoginQueue": false, "uniqueDisplayName": "PMGLdbYEknHPKrZ7", "userName": "TiNBE0HRsE0GHDOF"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminUpdateUserV4' test.out

#- 327 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jrfqJcyxT2a7fCFA' \
    --body '{"code": "UzLELiM573TdtWjf", "emailAddress": "VciuLnLsBKGsALPu"}' \
    > test.out 2>&1
eval_tap $? 327 'AdminUpdateUserEmailAddressV4' test.out

#- 328 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'COyphUUAV95708za' \
    > test.out 2>&1
eval_tap $? 328 'AdminDisableUserMFAV4' test.out

#- 329 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'P0wpZgQEvFzox9wH' \
    > test.out 2>&1
eval_tap $? 329 'AdminListUserRolesV4' test.out

#- 330 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ocX3DRWobEoGr8W9' \
    --body '{"assignedNamespaces": ["7KBedcr6PM51z7i0", "wQ9egK2t46EG8I2l", "TviKbOgVuN3nhkn6"], "roleId": "QIesNoYqvVsakylH"}' \
    > test.out 2>&1
eval_tap $? 330 'AdminUpdateUserRoleV4' test.out

#- 331 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ikKkpOjqwgKvfXXs' \
    --body '{"assignedNamespaces": ["8pDqm31AZSRkuw6q", "8FgqG46RsFK7eYlS", "U3vYcHZZjFegVnZO"], "roleId": "n0tk4IATSIefcqNE"}' \
    > test.out 2>&1
eval_tap $? 331 'AdminAddUserRoleV4' test.out

#- 332 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'n4IZ0Dv6b8WtaMVv' \
    --body '{"assignedNamespaces": ["LbG04KKnh3jvW0Qp", "3kTyL4CsLwiWUMcp", "xn4B6XoTNMuqZTHw"], "roleId": "o1IAJQpb6r8ZeaSH"}' \
    > test.out 2>&1
eval_tap $? 332 'AdminRemoveUserRoleV4' test.out

#- 333 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '45' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 333 'AdminGetRolesV4' test.out

#- 334 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "h59RGSbBMh7jpszu"}' \
    > test.out 2>&1
eval_tap $? 334 'AdminCreateRoleV4' test.out

#- 335 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'Vk6iPdJ2boQqCCyJ' \
    > test.out 2>&1
eval_tap $? 335 'AdminGetRoleV4' test.out

#- 336 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'fThvCJieqRSGN8Mm' \
    > test.out 2>&1
eval_tap $? 336 'AdminDeleteRoleV4' test.out

#- 337 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId '74HlSZzp4aEW4GkH' \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "IVuGv47XJpkMiopQ"}' \
    > test.out 2>&1
eval_tap $? 337 'AdminUpdateRoleV4' test.out

#- 338 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'rVL3ZZTVxqa9XM2g' \
    --body '{"permissions": [{"action": 95, "resource": "14iWk12Jffk8dwKN", "schedAction": 86, "schedCron": "HrjaboGomguUqeuZ", "schedRange": ["h5qtrRbNnGejdTGv", "ZgN5hshSe5YmZXKE", "QLkM6o3eGSP4Htmr"]}, {"action": 93, "resource": "0TqGf0OyqJ9ibJMm", "schedAction": 90, "schedCron": "YKy0IjsDgbJ37DN2", "schedRange": ["lDvdh7okHl1wMht2", "Izq7TCUJhDsDefAS", "09VyQB1vR1mx6K17"]}, {"action": 67, "resource": "9GB5sf94ALBmvdnc", "schedAction": 88, "schedCron": "8oMSPIHPtqzIWIzg", "schedRange": ["8pbjnt1iBV8DpbjG", "ts4UZDTfhAyZKhqi", "lty9NVlgxUmnfdOA"]}]}' \
    > test.out 2>&1
eval_tap $? 338 'AdminUpdateRolePermissionsV4' test.out

#- 339 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'mu1dX1NqD20RUvvY' \
    --body '{"permissions": [{"action": 9, "resource": "58pQswqKLutINusO", "schedAction": 38, "schedCron": "NesGiVnt9p2to7Yj", "schedRange": ["a1soDE1K0SvGrMYw", "PmPXC2LfL2m5rP2A", "20t6foPPH94SUinY"]}, {"action": 7, "resource": "v8LHYivmD0ekycMK", "schedAction": 24, "schedCron": "gxJhk4EdTZ000rS9", "schedRange": ["2594HLvWFsXHtMP0", "k9L5dREQbCqfh0gp", "ABFBER6WNcDOsRzB"]}, {"action": 21, "resource": "DSozCuFsrBMtoOeL", "schedAction": 11, "schedCron": "szzQLZBktk0siMup", "schedRange": ["01kyaFwwD7wecuQb", "4GNQHVZMKGBnzh4s", "uaGIzttTncVBf5g3"]}]}' \
    > test.out 2>&1
eval_tap $? 339 'AdminAddRolePermissionsV4' test.out

#- 340 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'oeuHiNyLkfPQPmjU' \
    --body '["kvSs5YmIejozmG5H", "lrIfMAvvpkAHRJHZ", "yfrXZmiJX4CjKCeI"]' \
    > test.out 2>&1
eval_tap $? 340 'AdminDeleteRolePermissionsV4' test.out

#- 341 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'RIr997KKpJXTLbYW' \
    --after 'pqeXjaf1f5fjNMZj' \
    --before 'KJ05puX3197WrMnJ' \
    --limit '40' \
    > test.out 2>&1
eval_tap $? 341 'AdminListAssignedUsersV4' test.out

#- 342 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'nW4ugGX6mKBbgTD9' \
    --body '{"assignedNamespaces": ["xL07ZzzIs3Jke34Z", "AUuLP897ooMLnemw", "KAvgDXNrFEE4Jf4h"], "namespace": "QpsLOcLtZw0efmEV", "userId": "cW7mxbS5UOoICxQM"}' \
    > test.out 2>&1
eval_tap $? 342 'AdminAssignUserToRoleV4' test.out

#- 343 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'it8555Niy4NNFpRE' \
    --body '{"namespace": "5pS85yTIRWvLRy58", "userId": "UKWPv3F7S0wCVlYQ"}' \
    > test.out 2>&1
eval_tap $? 343 'AdminRevokeUserFromRoleV4' test.out

#- 344 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["i9cfMCeNnu6OIG1P", "PLRDEXLXZWXvqNCH", "vNpeMjMzguq6HFIq"], "emailAddresses": ["aqwH9J6JLb5f3SBM", "yJUdwEBRrHAWUFqT", "ooGGnPEgY0t7QQWl"], "isAdmin": false, "isNewStudio": false, "namespace": "zryvhc1YjHmmulSB", "roleId": "IElc2CdRvBb0aGnM"}' \
    > test.out 2>&1
eval_tap $? 344 'AdminInviteUserNewV4' test.out

#- 345 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "t625bWHb5sbX6asr", "country": "jV7XJUOtHlzXNHEP", "dateOfBirth": "pzlMlx7b2H2THLwZ", "displayName": "GikW7TFA9gE6SrYK", "languageTag": "q6lcVOhPJIcEHbiK", "skipLoginQueue": false, "uniqueDisplayName": "W7flVolAWEMmQSPD", "userName": "TRqjlvwnnCA5tfK5"}' \
    > test.out 2>&1
eval_tap $? 345 'AdminUpdateMyUserV4' test.out

#- 346 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 346 'AdminDisableMyAuthenticatorV4' test.out

#- 347 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'ushaKTPVjyOUpR3u' \
    > test.out 2>&1
eval_tap $? 347 'AdminEnableMyAuthenticatorV4' test.out

#- 348 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 348 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 349 AdminGetMyBackupCodesV4
eval_tap 0 349 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 350 AdminGenerateMyBackupCodesV4
eval_tap 0 350 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 351 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 351 'AdminDisableMyBackupCodesV4' test.out

#- 352 AdminDownloadMyBackupCodesV4
eval_tap 0 352 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 353 AdminEnableMyBackupCodesV4
eval_tap 0 353 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 354 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 354 'AdminGetBackupCodesV4' test.out

#- 355 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 355 'AdminGenerateBackupCodesV4' test.out

#- 356 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 356 'AdminEnableBackupCodesV4' test.out

#- 357 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 357 'AdminSendMyMFAEmailCodeV4' test.out

#- 358 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 358 'AdminDisableMyEmailV4' test.out

#- 359 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'UdgNlyU4IJnqtrjC' \
    > test.out 2>&1
eval_tap $? 359 'AdminEnableMyEmailV4' test.out

#- 360 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 360 'AdminGetMyEnabledFactorsV4' test.out

#- 361 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'OsE8VjvzhJwNX4bh' \
    > test.out 2>&1
eval_tap $? 361 'AdminMakeFactorMyDefaultV4' test.out

#- 362 AdminInviteUserV4
eval_tap 0 362 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 363 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'qCjlwrmsSRV86iic' \
    --linkingToken '1FIMyF7CcNu2DYn6' \
    --password 'E9Gk51kOTJZluTek' \
    --username 'DMCGUJvERxNg8djS' \
    > test.out 2>&1
eval_tap $? 363 'AuthenticationWithPlatformLinkV4' test.out

#- 364 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'b4Vt2vKQ5vlCdI51' \
    --extendExp  \
    --linkingToken '9Pf2iogwxM5DZM0d' \
    > test.out 2>&1
eval_tap $? 364 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 365 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'gozmco41750xdYQg' \
    --factor '34WUV0WpmsQnp1n4' \
    --mfaToken 'YGumTKOlDOy5vhSk' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 365 'Verify2faCodeV4' test.out

#- 366 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'xERZ2AQ1jvXYBar5' \
    --codeChallenge 'RMmmGdWl0wpj5tVf' \
    --codeChallengeMethod 'plain' \
    --additionalData '0oZuEjY0rNBbbB9t' \
    --clientId 'xAvtRQvqJacXR2Rf' \
    --createHeadless  \
    --deviceId '4noXDFaEUkPUBnB0' \
    --macAddress 'ZEJH3ebM71Tg922x' \
    --platformToken 'iBgHSka0Pz7I1WkI' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 366 'PlatformTokenGrantV4' test.out

#- 367 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'a0oZ1nXpW1l70pcZ' \
    --codeChallengeMethod 'S256' \
    --simultaneousPlatform 'sQ0Gax0iX05IT9Ag' \
    --simultaneousTicket 'sjl5NmnSHhxNmCe4' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'OlX6HYVEiaereFCP' \
    > test.out 2>&1
eval_tap $? 367 'SimultaneousLoginV4' test.out

#- 368 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'JU2wEzUYUTmZ8JSM' \
    --codeChallengeMethod 'S256' \
    --additionalData 'pUOyHC9eKeXzrvzB' \
    --clientId 'llwzyC1aTWEmPgoy' \
    --code '4TkpEw4Zeid4mRoF' \
    --codeVerifier 'Nxv10ckMQVjKk3bW' \
    --extendNamespace 'J0ZuYSe3sI0x2hc8' \
    --extendExp  \
    --loginQueueTicket 'vaN1Off5gRZZMW3h' \
    --password 'uAIzBPWBYKAEFTdl' \
    --redirectUri 'KNh6GTzKjsCqxx24' \
    --refreshToken 'QM35bSkFrvGciNHb' \
    --username '7OY5YIpOLJW52uz3' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 368 'TokenGrantV4' test.out

#- 369 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData '9MgTy1HA58Jt5NaR' \
    --code 'OjSKFEuZo2ElXYSS' \
    > test.out 2>&1
eval_tap $? 369 'RequestTargetTokenResponseV4' test.out

#- 370 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "ezBRSiOyReviDaxl", "policyId": "PdhwmcH03yoMxzRR", "policyVersionId": "6xd9rTh3ureaIbxM"}, {"isAccepted": false, "localizedPolicyVersionId": "Wev9pZQjWAN0tny1", "policyId": "6ZHZtuSJGQCrM7JE", "policyVersionId": "MRPkdTcAzkIlndN5"}, {"isAccepted": true, "localizedPolicyVersionId": "JA27Qz5SjzQfOLYu", "policyId": "9O46OOzz9p57qSpH", "policyVersionId": "erzO87cg7TqtMiQg"}], "authType": "EMAILPASSWD", "country": "ZrSsuYiIPei0pXgl", "dateOfBirth": "JYnKkoCAZuolAWnx", "displayName": "kImVbDP0QX31gI7V", "emailAddress": "mnGIRMvXe6BiphIF", "password": "e2bzr6qQw6fSESkM", "passwordMD5Sum": "19OPMBb12gpmShlm", "uniqueDisplayName": "It2nfhUaZGqjslu5", "username": "9GT2E6AacmZRXZm6", "verified": true}' \
    > test.out 2>&1
eval_tap $? 370 'PublicCreateTestUserV4' test.out

#- 371 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "XWVj3KP1mX0iYHXB", "policyId": "U3Uk2tQm307IORTy", "policyVersionId": "HnLYDAAg1YA4kZUR"}, {"isAccepted": false, "localizedPolicyVersionId": "vSRFLDSdj8elbtHv", "policyId": "DU91DmHzwiqVPCJ5", "policyVersionId": "j18Ou3aY8nceFU5G"}, {"isAccepted": false, "localizedPolicyVersionId": "mcEKp8AQwqgJs6O0", "policyId": "Qj0ccMkdz6zPz3BV", "policyVersionId": "HAqp4O9XSjap24es"}], "authType": "EMAILPASSWD", "code": "sKOmgEhjH2wFzCpx", "country": "xJLfAg5cFT0gHAkl", "dateOfBirth": "tcR3eHFbiAluHv7H", "displayName": "ssd05pHBJX5ln8PZ", "emailAddress": "bYVD8RiaTsdD4d3k", "password": "SbTkHPMUvOAUXkw3", "passwordMD5Sum": "6cr2WJQqS7Tq4YIy", "reachMinimumAge": true, "uniqueDisplayName": "AFQ6lZfa2jdNvpWf", "username": "32JS1av9VNpVLT0L"}' \
    > test.out 2>&1
eval_tap $? 371 'PublicCreateUserV4' test.out

#- 372 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'vqcfSdO1nAjY5FvA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "9gCNVZxHGxhZqNXJ", "policyId": "6JXSh0Z3SWISs1dY", "policyVersionId": "rJKmx1BT6iLFQejN"}, {"isAccepted": true, "localizedPolicyVersionId": "JNF2hm0TqBQprHn3", "policyId": "whPKU5abnqw8fFa3", "policyVersionId": "0pVbhr1BHh1arZAy"}, {"isAccepted": true, "localizedPolicyVersionId": "sirE0JOQxWeHypqC", "policyId": "WMDPRI2cCk8zHR8V", "policyVersionId": "yCC0EQwE0cXokXbw"}], "authType": "EMAILPASSWD", "code": "E3iYHIknvPcJkjRe", "country": "vVYfiExpAgoK9YDq", "dateOfBirth": "1x3dkbJFDEBEOOvJ", "displayName": "5BKeipIldsgB4hOx", "emailAddress": "b88WgKSLIpneDQCf", "password": "wucHRL3o2NstrL6T", "passwordMD5Sum": "sJeRcE7GuwKn63KI", "reachMinimumAge": true, "uniqueDisplayName": "fjzknv2HZMIL2P2b", "username": "h14LroFTnAuujPeP"}' \
    > test.out 2>&1
eval_tap $? 372 'CreateUserFromInvitationV4' test.out

#- 373 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "9N0vdVB5a2XkS3XQ", "country": "fMuzZh4AhZRe2hgU", "dateOfBirth": "56xtyJtnbTDXu7Fb", "displayName": "leSP5PcdOuq0m0rv", "languageTag": "akR8rcwojLRjhcaJ", "uniqueDisplayName": "56nGlYZ2tod2BGBX", "userName": "jNyRCtPOr1FU3QZy"}' \
    > test.out 2>&1
eval_tap $? 373 'PublicUpdateUserV4' test.out

#- 374 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "3gdDms3kb1htW0UG", "emailAddress": "JpwQZlXuzu3m9u67"}' \
    > test.out 2>&1
eval_tap $? 374 'PublicUpdateUserEmailAddressV4' test.out

#- 375 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "JjCDwg186hGWKfO9", "country": "MnoT3t99HmcxzjDh", "dateOfBirth": "TrcBKtU956hOg8ou", "displayName": "kDVdweG0sFHxTHa2", "emailAddress": "k60SzCqUgq1gLbcI", "password": "MevTmC631p7q794b", "reachMinimumAge": true, "uniqueDisplayName": "1C6JHkWMSUbqByWN", "username": "2BCnRz9w2nur0B9j", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 375 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 376 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "hA5WnzVZdj8tsyzC", "password": "4QaLXp3o4TDraEEa", "username": "DNJbVd20FVHevCjt"}' \
    > test.out 2>&1
eval_tap $? 376 'PublicUpgradeHeadlessAccountV4' test.out

#- 377 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 377 'PublicDisableMyAuthenticatorV4' test.out

#- 378 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'hJUb7jKuMrFaoLul' \
    > test.out 2>&1
eval_tap $? 378 'PublicEnableMyAuthenticatorV4' test.out

#- 379 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 379 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 380 PublicGetMyBackupCodesV4
eval_tap 0 380 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 381 PublicGenerateMyBackupCodesV4
eval_tap 0 381 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 382 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 382 'PublicDisableMyBackupCodesV4' test.out

#- 383 PublicDownloadMyBackupCodesV4
eval_tap 0 383 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 384 PublicEnableMyBackupCodesV4
eval_tap 0 384 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 385 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 385 'PublicGetBackupCodesV4' test.out

#- 386 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 386 'PublicGenerateBackupCodesV4' test.out

#- 387 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 387 'PublicEnableBackupCodesV4' test.out

#- 388 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'zp3sZxImVK5yh2Lc' \
    > test.out 2>&1
eval_tap $? 388 'PublicRemoveTrustedDeviceV4' test.out

#- 389 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 389 'PublicSendMyMFAEmailCodeV4' test.out

#- 390 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 390 'PublicDisableMyEmailV4' test.out

#- 391 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'M8LaMW0ByjsRUrAH' \
    > test.out 2>&1
eval_tap $? 391 'PublicEnableMyEmailV4' test.out

#- 392 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 392 'PublicGetMyEnabledFactorsV4' test.out

#- 393 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'NRkIcC4wNFzsbrtY' \
    > test.out 2>&1
eval_tap $? 393 'PublicMakeFactorMyDefaultV4' test.out

#- 394 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vLh56AWXoMiowdWS' \
    > test.out 2>&1
eval_tap $? 394 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 395 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "s9DQ0VU1HED9CGo9", "emailAddress": "aUXj3rh0UyqxVWlI", "namespace": "MY5tTJw4KV104MtM", "namespaceDisplayName": "hKHmSjqPuQZX5Kjd"}' \
    > test.out 2>&1
eval_tap $? 395 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE