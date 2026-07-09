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
echo "1..447"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetAuthorizationServerMetadataWithNamespace
./ng net.accelbyte.sdk.cli.Main iam getAuthorizationServerMetadataWithNamespace \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'GetAuthorizationServerMetadataWithNamespace' test.out

#- 3 GetBansType
eval_tap 0 3 'GetBansType # SKIP deprecated' test.out

#- 4 GetListBanReason
eval_tap 0 4 'GetListBanReason # SKIP deprecated' test.out

#- 5 GetClients
eval_tap 0 5 'GetClients # SKIP deprecated' test.out

#- 6 CreateClient
eval_tap 0 6 'CreateClient # SKIP deprecated' test.out

#- 7 GetClient
eval_tap 0 7 'GetClient # SKIP deprecated' test.out

#- 8 UpdateClient
eval_tap 0 8 'UpdateClient # SKIP deprecated' test.out

#- 9 DeleteClient
eval_tap 0 9 'DeleteClient # SKIP deprecated' test.out

#- 10 UpdateClientPermission
eval_tap 0 10 'UpdateClientPermission # SKIP deprecated' test.out

#- 11 AddClientPermission
eval_tap 0 11 'AddClientPermission # SKIP deprecated' test.out

#- 12 DeleteClientPermission
eval_tap 0 12 'DeleteClientPermission # SKIP deprecated' test.out

#- 13 UpdateClientSecret
eval_tap 0 13 'UpdateClientSecret # SKIP deprecated' test.out

#- 14 GetClientsbyNamespace
eval_tap 0 14 'GetClientsbyNamespace # SKIP deprecated' test.out

#- 15 CreateClientByNamespace
eval_tap 0 15 'CreateClientByNamespace # SKIP deprecated' test.out

#- 16 DeleteClientByNamespace
eval_tap 0 16 'DeleteClientByNamespace # SKIP deprecated' test.out

#- 17 CreateUser
eval_tap 0 17 'CreateUser # SKIP deprecated' test.out

#- 18 GetAdminUsersByRoleID
eval_tap 0 18 'GetAdminUsersByRoleID # SKIP deprecated' test.out

#- 19 GetUserByLoginID
eval_tap 0 19 'GetUserByLoginID # SKIP deprecated' test.out

#- 20 GetUserByPlatformUserID
eval_tap 0 20 'GetUserByPlatformUserID # SKIP deprecated' test.out

#- 21 ForgotPassword
eval_tap 0 21 'ForgotPassword # SKIP deprecated' test.out

#- 22 GetUsersByLoginIds
eval_tap 0 22 'GetUsersByLoginIds # SKIP deprecated' test.out

#- 23 ResetPassword
eval_tap 0 23 'ResetPassword # SKIP deprecated' test.out

#- 24 SearchUser
eval_tap 0 24 'SearchUser # SKIP deprecated' test.out

#- 25 GetUserByUserID
eval_tap 0 25 'GetUserByUserID # SKIP deprecated' test.out

#- 26 UpdateUser
eval_tap 0 26 'UpdateUser # SKIP deprecated' test.out

#- 27 DeleteUser
eval_tap 0 27 'DeleteUser # SKIP deprecated' test.out

#- 28 BanUser
eval_tap 0 28 'BanUser # SKIP deprecated' test.out

#- 29 GetUserBanHistory
eval_tap 0 29 'GetUserBanHistory # SKIP deprecated' test.out

#- 30 DisableUserBan
eval_tap 0 30 'DisableUserBan # SKIP deprecated' test.out

#- 31 EnableUserBan
eval_tap 0 31 'EnableUserBan # SKIP deprecated' test.out

#- 32 ListCrossNamespaceAccountLink
eval_tap 0 32 'ListCrossNamespaceAccountLink # SKIP deprecated' test.out

#- 33 DisableUser
eval_tap 0 33 'DisableUser # SKIP deprecated' test.out

#- 34 EnableUser
eval_tap 0 34 'EnableUser # SKIP deprecated' test.out

#- 35 GetUserInformation
eval_tap 0 35 'GetUserInformation # SKIP deprecated' test.out

#- 36 DeleteUserInformation
eval_tap 0 36 'DeleteUserInformation # SKIP deprecated' test.out

#- 37 GetUserLoginHistories
eval_tap 0 37 'GetUserLoginHistories # SKIP deprecated' test.out

#- 38 UpdatePassword
eval_tap 0 38 'UpdatePassword # SKIP deprecated' test.out

#- 39 SaveUserPermission
eval_tap 0 39 'SaveUserPermission # SKIP deprecated' test.out

#- 40 AddUserPermission
eval_tap 0 40 'AddUserPermission # SKIP deprecated' test.out

#- 41 DeleteUserPermission
eval_tap 0 41 'DeleteUserPermission # SKIP deprecated' test.out

#- 42 GetUserPlatformAccounts
eval_tap 0 42 'GetUserPlatformAccounts # SKIP deprecated' test.out

#- 43 GetUserMapping
eval_tap 0 43 'GetUserMapping # SKIP deprecated' test.out

#- 44 GetUserJusticePlatformAccount
eval_tap 0 44 'GetUserJusticePlatformAccount # SKIP deprecated' test.out

#- 45 PlatformLink
eval_tap 0 45 'PlatformLink # SKIP deprecated' test.out

#- 46 PlatformUnlink
eval_tap 0 46 'PlatformUnlink # SKIP deprecated' test.out

#- 47 GetPublisherUser
eval_tap 0 47 'GetPublisherUser # SKIP deprecated' test.out

#- 48 SaveUserRoles
eval_tap 0 48 'SaveUserRoles # SKIP deprecated' test.out

#- 49 AddUserRole
eval_tap 0 49 'AddUserRole # SKIP deprecated' test.out

#- 50 DeleteUserRole
eval_tap 0 50 'DeleteUserRole # SKIP deprecated' test.out

#- 51 UpgradeHeadlessAccount
eval_tap 0 51 'UpgradeHeadlessAccount # SKIP deprecated' test.out

#- 52 UpgradeHeadlessAccountWithVerificationCode
eval_tap 0 52 'UpgradeHeadlessAccountWithVerificationCode # SKIP deprecated' test.out

#- 53 UserVerification
eval_tap 0 53 'UserVerification # SKIP deprecated' test.out

#- 54 SendVerificationCode
eval_tap 0 54 'SendVerificationCode # SKIP deprecated' test.out

#- 55 Authorization
eval_tap 0 55 'Authorization # SKIP deprecated' test.out

#- 56 GetJWKS
eval_tap 0 56 'GetJWKS # SKIP deprecated' test.out

#- 57 NamespaceScopedPlatformTokenGrant
eval_tap 0 57 'NamespaceScopedPlatformTokenGrant # SKIP deprecated' test.out

#- 58 RevokeUser
eval_tap 0 58 'RevokeUser # SKIP deprecated' test.out

#- 59 GetRevocationList
eval_tap 0 59 'GetRevocationList # SKIP deprecated' test.out

#- 60 RevokeToken
eval_tap 0 60 'RevokeToken # SKIP deprecated' test.out

#- 61 RevokeAUser
eval_tap 0 61 'RevokeAUser # SKIP deprecated' test.out

#- 62 TokenGrant
eval_tap 0 62 'TokenGrant # SKIP deprecated' test.out

#- 63 VerifyToken
eval_tap 0 63 'VerifyToken # SKIP deprecated' test.out

#- 64 GetRoles
eval_tap 0 64 'GetRoles # SKIP deprecated' test.out

#- 65 CreateRole
eval_tap 0 65 'CreateRole # SKIP deprecated' test.out

#- 66 GetRole
eval_tap 0 66 'GetRole # SKIP deprecated' test.out

#- 67 UpdateRole
eval_tap 0 67 'UpdateRole # SKIP deprecated' test.out

#- 68 DeleteRole
eval_tap 0 68 'DeleteRole # SKIP deprecated' test.out

#- 69 GetRoleAdminStatus
eval_tap 0 69 'GetRoleAdminStatus # SKIP deprecated' test.out

#- 70 SetRoleAsAdmin
eval_tap 0 70 'SetRoleAsAdmin # SKIP deprecated' test.out

#- 71 RemoveRoleAdmin
eval_tap 0 71 'RemoveRoleAdmin # SKIP deprecated' test.out

#- 72 GetRoleManagers
eval_tap 0 72 'GetRoleManagers # SKIP deprecated' test.out

#- 73 AddRoleManagers
eval_tap 0 73 'AddRoleManagers # SKIP deprecated' test.out

#- 74 RemoveRoleManagers
eval_tap 0 74 'RemoveRoleManagers # SKIP deprecated' test.out

#- 75 GetRoleMembers
eval_tap 0 75 'GetRoleMembers # SKIP deprecated' test.out

#- 76 AddRoleMembers
eval_tap 0 76 'AddRoleMembers # SKIP deprecated' test.out

#- 77 RemoveRoleMembers
eval_tap 0 77 'RemoveRoleMembers # SKIP deprecated' test.out

#- 78 UpdateRolePermissions
eval_tap 0 78 'UpdateRolePermissions # SKIP deprecated' test.out

#- 79 AddRolePermission
eval_tap 0 79 'AddRolePermission # SKIP deprecated' test.out

#- 80 DeleteRolePermission
eval_tap 0 80 'DeleteRolePermission # SKIP deprecated' test.out

#- 81 AdminGetAgeRestrictionStatusV2
eval_tap 0 81 'AdminGetAgeRestrictionStatusV2 # SKIP deprecated' test.out

#- 82 AdminUpdateAgeRestrictionConfigV2
eval_tap 0 82 'AdminUpdateAgeRestrictionConfigV2 # SKIP deprecated' test.out

#- 83 GetListCountryAgeRestriction
eval_tap 0 83 'GetListCountryAgeRestriction # SKIP deprecated' test.out

#- 84 UpdateCountryAgeRestriction
eval_tap 0 84 'UpdateCountryAgeRestriction # SKIP deprecated' test.out

#- 85 AdminSearchUsersV2
eval_tap 0 85 'AdminSearchUsersV2 # SKIP deprecated' test.out

#- 86 AdminGetUserByUserIdV2
eval_tap 0 86 'AdminGetUserByUserIdV2 # SKIP deprecated' test.out

#- 87 AdminUpdateUserV2
eval_tap 0 87 'AdminUpdateUserV2 # SKIP deprecated' test.out

#- 88 AdminBanUserV2
eval_tap 0 88 'AdminBanUserV2 # SKIP deprecated' test.out

#- 89 AdminGetUserBanV2
eval_tap 0 89 'AdminGetUserBanV2 # SKIP deprecated' test.out

#- 90 AdminDisableUserV2
eval_tap 0 90 'AdminDisableUserV2 # SKIP deprecated' test.out

#- 91 AdminEnableUserV2
eval_tap 0 91 'AdminEnableUserV2 # SKIP deprecated' test.out

#- 92 AdminResetPasswordV2
eval_tap 0 92 'AdminResetPasswordV2 # SKIP deprecated' test.out

#- 93 AdminDeletePlatformLinkV2
eval_tap 0 93 'AdminDeletePlatformLinkV2 # SKIP deprecated' test.out

#- 94 AdminPutUserRolesV2
eval_tap 0 94 'AdminPutUserRolesV2 # SKIP deprecated' test.out

#- 95 AdminCreateUserRolesV2
eval_tap 0 95 'AdminCreateUserRolesV2 # SKIP deprecated' test.out

#- 96 PublicGetCountryAgeRestriction
eval_tap 0 96 'PublicGetCountryAgeRestriction # SKIP deprecated' test.out

#- 97 PublicCreateUserV2
eval_tap 0 97 'PublicCreateUserV2 # SKIP deprecated' test.out

#- 98 PublicForgotPasswordV2
eval_tap 0 98 'PublicForgotPasswordV2 # SKIP deprecated' test.out

#- 99 PublicResetPasswordV2
eval_tap 0 99 'PublicResetPasswordV2 # SKIP deprecated' test.out

#- 100 PublicGetUserByUserIDV2
eval_tap 0 100 'PublicGetUserByUserIDV2 # SKIP deprecated' test.out

#- 101 PublicUpdateUserV2
eval_tap 0 101 'PublicUpdateUserV2 # SKIP deprecated' test.out

#- 102 PublicGetUserBan
eval_tap 0 102 'PublicGetUserBan # SKIP deprecated' test.out

#- 103 PublicUpdatePasswordV2
eval_tap 0 103 'PublicUpdatePasswordV2 # SKIP deprecated' test.out

#- 104 GetListJusticePlatformAccounts
eval_tap 0 104 'GetListJusticePlatformAccounts # SKIP deprecated' test.out

#- 105 PublicPlatformLinkV2
eval_tap 0 105 'PublicPlatformLinkV2 # SKIP deprecated' test.out

#- 106 PublicDeletePlatformLinkV2
eval_tap 0 106 'PublicDeletePlatformLinkV2 # SKIP deprecated' test.out

#- 107 AdminGetBansTypeV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBansTypeV3 \
    > test.out 2>&1
eval_tap $? 107 'AdminGetBansTypeV3' test.out

#- 108 AdminGetListBanReasonV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListBanReasonV3 \
    > test.out 2>&1
eval_tap $? 108 'AdminGetListBanReasonV3' test.out

#- 109 AdminListClientAvailablePermissions
./ng net.accelbyte.sdk.cli.Main iam adminListClientAvailablePermissions \
    --excludePermissions  \
    > test.out 2>&1
eval_tap $? 109 'AdminListClientAvailablePermissions' test.out

#- 110 AdminUpdateAvailablePermissionsByModule
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAvailablePermissionsByModule \
    --forceDelete  \
    --body '{"modules": [{"docLink": "EAxcVpFrttufHIRd", "groups": [{"group": "H9UzVRiXbqlAw7r6", "groupId": "W2ktQG0h5JAav5kR", "package": "a62WopBJHPtcDs8b", "permissions": [{"allowedActions": [56, 70, 76], "resource": "6IaRDBXxyaNoMR6h"}, {"allowedActions": [21, 13, 37], "resource": "7qbPngUNB1vRodwp"}, {"allowedActions": [52, 65, 91], "resource": "HHdgs21Jub74CUkN"}]}, {"group": "mKJfh5pUkHODpoMF", "groupId": "78NY4YkHs1cnz1JS", "package": "DgY1TXp38zsCTCrb", "permissions": [{"allowedActions": [59, 18, 3], "resource": "SuL0Sly6XM4OI18m"}, {"allowedActions": [55, 54, 88], "resource": "LczNIicXm7agSrjJ"}, {"allowedActions": [99, 66, 83], "resource": "aREAu2D6QVKNCWP7"}]}, {"group": "5TB0i7pKxR8dl0zR", "groupId": "VW4EZG9m0XcgGVbM", "package": "qSszE8GHavj7AorK", "permissions": [{"allowedActions": [37, 95, 49], "resource": "DrwoZ5MecdKi5r6Q"}, {"allowedActions": [61, 46, 1], "resource": "HuKeb9l3rGN9A3sN"}, {"allowedActions": [25, 22, 65], "resource": "4hddSpHt0P7MIIR7"}]}], "module": "CkyF6C7duuyZ0GhD", "moduleId": "ogqrhBRd8lDR6qVN", "package": "PRZYdFLIAjGGJddV"}, {"docLink": "Cvu9vx5KQ7KYnIuM", "groups": [{"group": "BvaO35llzQRaT5kP", "groupId": "xUfofvnnSuB0y5WU", "package": "lrMdI4sNveabntBS", "permissions": [{"allowedActions": [47, 41, 94], "resource": "RkgghGoYupD391C2"}, {"allowedActions": [33, 59, 39], "resource": "6SCwGrncqmLtjQHA"}, {"allowedActions": [11, 39, 93], "resource": "d67FXGk2s9Q0mPVo"}]}, {"group": "3twu0MesTCf9x4rt", "groupId": "69lna7qxNeIxPz6M", "package": "bwL6IY69z1UaLqYS", "permissions": [{"allowedActions": [91, 99, 33], "resource": "ytLPziZMdjxcBZuf"}, {"allowedActions": [86, 93, 48], "resource": "AQ6iiPlSC2uE4o5V"}, {"allowedActions": [46, 6, 56], "resource": "o3fePqIJA8IHtrkm"}]}, {"group": "u0hpDDWVAla2l5BY", "groupId": "NtIuS5S5XUdjsoqw", "package": "GyzzWi9gwQYv7t1o", "permissions": [{"allowedActions": [98, 94, 22], "resource": "Tr1DmrhZv15T7quI"}, {"allowedActions": [83, 44, 5], "resource": "BMcaYmvCkGZ5dAgq"}, {"allowedActions": [48, 96, 31], "resource": "EXlAvxJMdalwSyli"}]}], "module": "WMNW5NyLu0M3VHh2", "moduleId": "EI8JlDbPWbQ6Q9lN", "package": "mqRBaAkLnvxkT1X6"}, {"docLink": "8cmDc3fxU8MyKrQp", "groups": [{"group": "M4hkkK6KKXNB3Gv0", "groupId": "IqmF51TkhjYnaq6f", "package": "oWvXa3bMrXsDr6kI", "permissions": [{"allowedActions": [78, 72, 38], "resource": "Pa8ZRrvjj7il35MX"}, {"allowedActions": [2, 80, 18], "resource": "9oCMNqq98SjTvhZN"}, {"allowedActions": [21, 20, 92], "resource": "l535X3ateEKDpADz"}]}, {"group": "1x3poD3Qgb3boLQQ", "groupId": "1MzH7Qm8bwbmXgdA", "package": "Ph1EThG96gAFKK2W", "permissions": [{"allowedActions": [60, 2, 12], "resource": "TDIHrvqAThuwjRHp"}, {"allowedActions": [74, 49, 74], "resource": "eFoF7VSZ6pf3vneS"}, {"allowedActions": [59, 98, 85], "resource": "Tb3g7mSQUhAEtrmj"}]}, {"group": "qU6YE3p4lSck0ZHn", "groupId": "5GI39YBHqaTHeKtW", "package": "18iGeUlc9d9sogWa", "permissions": [{"allowedActions": [61, 59, 76], "resource": "L7vIYhGGSyEW4ZJJ"}, {"allowedActions": [95, 81, 7], "resource": "e4mhgo5QB65lSAiY"}, {"allowedActions": [27, 31, 81], "resource": "flxqMrj3oZk03QXc"}]}], "module": "KMDYDDxHSZjtqXyJ", "moduleId": "58f7Gc26SaiGVkyd", "package": "wYWQG26yUZNmTBcv"}]}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateAvailablePermissionsByModule' test.out

#- 111 AdminDeleteConfigPermissionsByGroup
./ng net.accelbyte.sdk.cli.Main iam adminDeleteConfigPermissionsByGroup \
    --forceDelete  \
    --body '{"groupId": "rbYCwZtxFHyPLtI8", "moduleId": "ilbyDPUIj88cekdq"}' \
    > test.out 2>&1
eval_tap $? 111 'AdminDeleteConfigPermissionsByGroup' test.out

#- 112 AdminUpdateModulePackage
./ng net.accelbyte.sdk.cli.Main iam adminUpdateModulePackage \
    --body '{"data": [{"moduleId": "Ct81P1ktfIovmv9g", "package": "sR5cJcHm3SZLxoRD"}, {"moduleId": "FuuuySj29a9LJE8H", "package": "oRS1X2PFAAMwzHPx"}, {"moduleId": "B1UskYs4Yw20DOqO", "package": "BSC2DKHRuPMMWH8Y"}]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminUpdateModulePackage' test.out

#- 113 AdminListClientTemplates
./ng net.accelbyte.sdk.cli.Main iam adminListClientTemplates \
    > test.out 2>&1
eval_tap $? 113 'AdminListClientTemplates' test.out

#- 114 AdminGetInputValidations
eval_tap 0 114 'AdminGetInputValidations # SKIP deprecated' test.out

#- 115 AdminUpdateInputValidations
eval_tap 0 115 'AdminUpdateInputValidations # SKIP deprecated' test.out

#- 116 AdminResetInputValidations
eval_tap 0 116 'AdminResetInputValidations # SKIP deprecated' test.out

#- 117 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'b33T5UBJCjfcnLRf' \
    --before 'xeCSz9WEi8KlloeH' \
    --endDate '0JT1yduat2vQR3bi' \
    --limit '56' \
    --query 'H2rtOa4EXsXzOXQA' \
    --roleId 'k4mqrxzTtuLl4Xlb' \
    --startDate 'GL8QOxtjzm8y2wNh' \
    > test.out 2>&1
eval_tap $? 117 'ListAdminsV3' test.out

#- 118 AdminGetAgeRestrictionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetAgeRestrictionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminGetAgeRestrictionStatusV3' test.out

#- 119 AdminUpdateAgeRestrictionConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAgeRestrictionConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 25, "enable": true}' \
    > test.out 2>&1
eval_tap $? 119 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 120 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'AdminGetListCountryAgeRestrictionV3' test.out

#- 121 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'Mh5eC3IHeHSKLCa3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 48}' \
    > test.out 2>&1
eval_tap $? 121 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 122 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'AE7WIsfmx40NLRc6' \
    --limit '24' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 122 'AdminGetBannedUsersV3' test.out

#- 123 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "DJgas4b6z3LNUj7f", "comment": "dgLA84Z8YYk6QEgJ", "endDate": "jBbEDoNf3n0hEoRC", "reason": "Acf80zfFyabWAgIU", "skipNotif": false, "userIds": ["kloqxM3gpwxcfMy9", "XzjjI5YbsKoADkzJ", "EN2VHzih3bit0VWn"]}' \
    > test.out 2>&1
eval_tap $? 123 'AdminBanUserBulkV3' test.out

#- 124 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "3CO39PXDNxtXgeO3", "userId": "FgkXhjDzaQY3snn2"}, {"banId": "ZkP7cFdP43e5dC9X", "userId": "IBudfZgrbHDIDm4h"}, {"banId": "MzF4TxodenSrUTvf", "userId": "qU0bfoMm5cTtFWbo"}]}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUnbanUserBulkV3' test.out

#- 125 AdminGetBansTypeWithNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBansTypeWithNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 125 'AdminGetBansTypeWithNamespaceV3' test.out

#- 126 AdminGetClientsByNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsByNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'tQyXJRcQWsmqPNs9' \
    --clientName '2epxk0i8VxsZNere' \
    --clientType 'Svf9699mCEHThUJk' \
    --limit '62' \
    --offset '80' \
    --skipLoginQueue  \
    > test.out 2>&1
eval_tap $? 126 'AdminGetClientsByNamespaceV3' test.out

#- 127 AdminBulkUpdateClientsV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateClientsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientIds": ["TAsSp7gh4TeUTkOk", "AYfJB8AT9t4Tv207", "Y2QD3oD5fLCr3OOl"], "clientUpdateRequest": {"audiences": ["XVv8ZGF7uYnGzpip", "NDigNJma1MbqqZtf", "NWql4nmwAft4gqkN"], "baseUri": "NlWkD9eOziYRFOn0", "clientName": "jJLHC9LxhvNXTwGB", "clientPermissions": [{"action": 59, "resource": "ICQLfl7MUBG7qtPu", "schedAction": 36, "schedCron": "4yAtURKLRkb738HG", "schedRange": ["S6rDgMdIIlhS1fSi", "M9331m7Ta1PsKc50", "Kv6ecnEevcAx2K2z"]}, {"action": 20, "resource": "hyxlNsjUgxBkF6wF", "schedAction": 86, "schedCron": "dSJtjX7ZshZyZl5x", "schedRange": ["4bRXBHUTrDzZSKsc", "fOcYu3dpCROYqUiG", "KXVFCmpo6sPwVOED"]}, {"action": 91, "resource": "Sa3Zdb65UXmy0Zp6", "schedAction": 17, "schedCron": "pGhhvXYck0upMzUY", "schedRange": ["nb76tFkEORV3bu1b", "NCtX7W40V6Do5sYa", "dCCFrHHC3DpZxkrQ"]}], "clientPlatform": "DXuNFviMarv8mnfH", "deletable": true, "description": "Vd3DlhLuIpomM8sm", "modulePermissions": [{"moduleId": "1MiaI1mX2tJoARtd", "selectedGroups": [{"groupId": "bBe7udsMrok0WvGY", "selectedActions": [13, 27, 100]}, {"groupId": "x4V709xbnGezKsDw", "selectedActions": [66, 29, 93]}, {"groupId": "mOR2nvYI9TVqJdvz", "selectedActions": [5, 37, 100]}]}, {"moduleId": "ugAOS7u8RiWyerCS", "selectedGroups": [{"groupId": "a8SRgwsAj1ik1jgl", "selectedActions": [1, 38, 60]}, {"groupId": "B1fPqqRRulpqpymD", "selectedActions": [22, 88, 42]}, {"groupId": "htrHWwRVnwVBOqOH", "selectedActions": [17, 2, 15]}]}, {"moduleId": "pWGd1juYhiqjRJOq", "selectedGroups": [{"groupId": "B5F93zFQbJndUDpd", "selectedActions": [84, 50, 82]}, {"groupId": "8M9zVrjfGXZnqAQU", "selectedActions": [30, 56, 92]}, {"groupId": "GjlIIk0iKoTTS1j0", "selectedActions": [89, 30, 5]}]}], "namespace": "JjTXAQN0qdskdQV0", "oauthAccessTokenExpiration": 93, "oauthAccessTokenExpirationTimeUnit": "Rk0eaKQDOJvrTefg", "oauthRefreshTokenExpiration": 23, "oauthRefreshTokenExpirationTimeUnit": "lONk2Q5Y4Jvaizwi", "redirectUri": "ilatuUjjt9lIMGql", "scopes": ["5ElEa9EIIlGcHB3C", "fR3ncDlwi3v3MFFJ", "1KesKoELCpobBEG8"], "skipLoginQueue": true, "twoFactorEnabled": true}}' \
    > test.out 2>&1
eval_tap $? 127 'AdminBulkUpdateClientsV3' test.out

#- 128 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["Dymtj3giPg4x4yiP", "X6ues1Hhhkg1yLVb", "LFzHEP8cM4NTwr0K"], "baseUri": "HaAsmTej52WKi6tA", "clientId": "rAURt9plCSVq8PdH", "clientName": "6hJPUAc0RVwXgAgn", "clientPermissions": [{"action": 40, "resource": "71w0deoV9Lx5RDA1", "schedAction": 24, "schedCron": "xr0lCancUZGCHsZY", "schedRange": ["oLfR1KtOv7Zy0b65", "uvuKNuy0ytZQ7M6N", "zy1adnSKOLFKx1dX"]}, {"action": 77, "resource": "fRSse6AAz3S4czz0", "schedAction": 87, "schedCron": "BROPYuG6XqP6oo7G", "schedRange": ["73zdxTgOfnwIdlNa", "29fDLh741IslKHzG", "lLKWUtDQs61OQAox"]}, {"action": 51, "resource": "4fZvWtND2tcBFpX8", "schedAction": 22, "schedCron": "wiJCf2XJVrlzqQls", "schedRange": ["1ozhLVA3kE8jKvga", "tOEBM70TdlNBJYOm", "pu1VCarzBsV6xnZ5"]}], "clientPlatform": "Jrzzjrcaug6CWVG8", "deletable": false, "description": "WP3glU6muswVJnNn", "modulePermissions": [{"moduleId": "N7kAa7j0riFc5HTH", "selectedGroups": [{"groupId": "QIoVsGo7dwV9DBqF", "selectedActions": [74, 6, 68]}, {"groupId": "AdiPKDUVSC00PYeD", "selectedActions": [4, 19, 0]}, {"groupId": "QD4IEiH9Z5qXn3ao", "selectedActions": [90, 37, 40]}]}, {"moduleId": "PheTH26IUJNvYuGR", "selectedGroups": [{"groupId": "UvpZaHCuESOiIZsM", "selectedActions": [12, 54, 57]}, {"groupId": "eMe4L3mDWORBVXTI", "selectedActions": [71, 9, 73]}, {"groupId": "E70CaunQNxot371W", "selectedActions": [13, 67, 1]}]}, {"moduleId": "4AvQkqsGnmyo5JJT", "selectedGroups": [{"groupId": "UVmb8GEXFTlEMEsF", "selectedActions": [52, 16, 10]}, {"groupId": "qwgK1Np5nodqpLm7", "selectedActions": [66, 98, 14]}, {"groupId": "6mTJ0sQs6XNbjvqh", "selectedActions": [26, 18, 96]}]}], "namespace": "TdSGv2LFjAKY7Cbg", "oauthAccessTokenExpiration": 37, "oauthAccessTokenExpirationTimeUnit": "DD0jJvlfV5OemPYd", "oauthClientType": "YT7DROCjtuzFMbAG", "oauthRefreshTokenExpiration": 23, "oauthRefreshTokenExpirationTimeUnit": "YI89hmguB8FOTjML", "redirectUri": "o4b9rIzqYkEpstyV", "scopes": ["TBcrM8rG0rH0zcsw", "wVeMK6MbGIVIu8vv", "wLc7KY3uVoJXTIMt"], "secret": "pgkieDyF97lGdMiH", "skipLoginQueue": true, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 128 'AdminCreateClientV3' test.out

#- 129 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'bWCYzo8yO2KTK9tm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 129 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 130 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'mOnYnOpas6ghP1y4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 130 'AdminDeleteClientV3' test.out

#- 131 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'Zi7s7QBlk44Z44B1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["GZgKg4uKxaCgcGLu", "C3brWdTYCfHkIySo", "k5DiXZtLW87rGysr"], "baseUri": "yod3dNQrmsApRA6H", "clientName": "X3RwrKt2ecozL0TO", "clientPermissions": [{"action": 13, "resource": "oXmM2W7l6jHMA2rG", "schedAction": 82, "schedCron": "nakopAywelu01nry", "schedRange": ["EJ0NqoTow0qiOiC4", "j0iktm0ZPLkLOsp0", "LZ5njN86Hl8kUXzt"]}, {"action": 28, "resource": "bSc6bWvgpVyW9dD1", "schedAction": 22, "schedCron": "E2ItBS3KtKZWe8ao", "schedRange": ["FzAyBME74HUtipUW", "YhWV1qx8CzPML52f", "aXUr9Sk4lq2faBcA"]}, {"action": 18, "resource": "XKlhvyH8paOJtxqM", "schedAction": 85, "schedCron": "k8aG40NlncceIZSw", "schedRange": ["gAIkgzh4pTU0Am4D", "Zhl0bQxFJ3sWCqQp", "Q2FbKPFMycMSQ4qf"]}], "clientPlatform": "AacR0LgB5BUXvjcu", "deletable": true, "description": "os4yBRjrERHEonAZ", "modulePermissions": [{"moduleId": "R8GmEu0q1p6QCyY6", "selectedGroups": [{"groupId": "vSkVFWdsbYuVEGVx", "selectedActions": [60, 15, 9]}, {"groupId": "SxSc3aZPV87pna08", "selectedActions": [13, 45, 48]}, {"groupId": "t1j1Rx59hesNWy2N", "selectedActions": [43, 96, 5]}]}, {"moduleId": "85DDKDAF8KDsBZOu", "selectedGroups": [{"groupId": "YQJ03BAHZ7c53q7a", "selectedActions": [22, 67, 80]}, {"groupId": "XhKcjmSEwdrkEnnq", "selectedActions": [74, 0, 51]}, {"groupId": "ZK3h65hbN15zfQSf", "selectedActions": [88, 36, 10]}]}, {"moduleId": "tfF3TQN0OcNDLr36", "selectedGroups": [{"groupId": "vzohZyjMQAg5mPYh", "selectedActions": [35, 32, 78]}, {"groupId": "ysFO3Zvc1BZG99Ly", "selectedActions": [43, 3, 11]}, {"groupId": "YXEcENx9xZlAchob", "selectedActions": [28, 0, 23]}]}], "namespace": "RcYp7FUjfIGaffof", "oauthAccessTokenExpiration": 23, "oauthAccessTokenExpirationTimeUnit": "wZNiVsF6xG2mXEQd", "oauthRefreshTokenExpiration": 3, "oauthRefreshTokenExpirationTimeUnit": "F5wWaDhukU4khGG4", "redirectUri": "vZFTYnPkmSu4PWam", "scopes": ["1jxR7SETWjteoc8f", "gvZDDhoO05oKqymx", "LD1Lcvw6T6mZEiwx"], "skipLoginQueue": true, "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 131 'AdminUpdateClientV3' test.out

#- 132 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'Z3ZprZ60zMjhTHeh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 29, "resource": "4TSenE5hCFkIf5we"}, {"action": 33, "resource": "4ZONJREdUQ3z9F1B"}, {"action": 48, "resource": "TtYmGukz3MnlrjcH"}]}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateClientPermissionV3' test.out

#- 133 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'p6B8Vj7rXFgDnDkd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 52, "resource": "9bpjb1tdA3QhjCMW"}, {"action": 18, "resource": "f4XhIjSoTB2NMKte"}, {"action": 53, "resource": "zLAATPY8P8P3cfoi"}]}' \
    > test.out 2>&1
eval_tap $? 133 'AdminAddClientPermissionsV3' test.out

#- 134 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '43' \
    --clientId 'EJIYppuUSsKoHw2h' \
    --namespace "$AB_NAMESPACE" \
    --resource 'yd12uSE7BEv3aevq' \
    > test.out 2>&1
eval_tap $? 134 'AdminDeleteClientPermissionV3' test.out

#- 135 AdminGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam adminGetConfigValueV3 \
    --configKey '6iohU1cg4W1IS3Uv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'AdminGetConfigValueV3' test.out

#- 136 AdminGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    --filterBlacklist  \
    > test.out 2>&1
eval_tap $? 136 'AdminGetCountryListV3' test.out

#- 137 AdminGetCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminGetCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 137 'AdminGetCountryBlacklistV3' test.out

#- 138 AdminAddCountryBlacklistV3
./ng net.accelbyte.sdk.cli.Main iam adminAddCountryBlacklistV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"blacklist": ["1BpWoJBaqdg2FHcu", "nsS1lnaO2m9vqjhb", "eK2qN8g6x2PyYDo5"]}' \
    > test.out 2>&1
eval_tap $? 138 'AdminAddCountryBlacklistV3' test.out

#- 139 AdminGetNamespaceScopedInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceScopedInputValidations \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'AdminGetNamespaceScopedInputValidations' test.out

#- 140 AdminUpdateNamespaceScopedInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminUpdateNamespaceScopedInputValidations \
    --namespace "$AB_NAMESPACE" \
    --body '[{"field": "R3hLiD5sf5y1JsxJ", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["blS7Nz81GRazPAAN", "jfBoldFOyqA2clJ5", "gEOaCgM6Yn6RugbN"], "preferRegex": true, "regex": "f4czdt7zqmSKxOEQ"}, "blockedWord": ["lVcx6GqsBq8vdhWV", "nuYLgpZehK0G2nmy", "uViB9kRTcSQdTnNY"], "description": [{"language": "GeAfYFG3wSkHKufB", "message": ["dS3ZOokZB4cXnAXy", "uGz6LlxHv8SwyagY", "vDJ3w3UNgIGj2jZt"]}, {"language": "EYT8sIPSE1XXPzyS", "message": ["a0sZoFS6xCOWMpyh", "9pMsQgb64ELbzDMw", "yo4nIRysQdbufXjY"]}, {"language": "nSoIFeouC2m38kXr", "message": ["DZWlGVE9sJ4NpUtK", "p6M9I6nEwnZhsjwJ", "eGwaPSDMZz95OYKi"]}], "isCustomRegex": true, "letterCase": "yxgRR1DiCqSMzpqI", "maxLength": 65, "maxRepeatingAlphaNum": 9, "maxRepeatingSpecialCharacter": 67, "minCharType": 0, "minLength": 78, "profanityFilter": "0ZtlzUcuHAXz0UV3", "regex": "1MfuGaXsAuGsZaSH", "specialCharacterLocation": "evO0TQNEI3kfabxJ", "specialCharacters": ["WWSI1ECUo1NPpeFh", "UztXDgB7n4C97uAP", "P8PATLpUpxeJlsBJ"]}}, {"field": "T6Hh3OMjAjq2mK8l", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "avatarConfig": {"allowedPrefixes": ["McYQdN66bswAgt65", "X4N1LQZmB61JMdtw", "CVUrYQue84dwmbwF"], "preferRegex": true, "regex": "vm4e5GX6H742Oixh"}, "blockedWord": ["tAoKiVm6URT95Xhn", "UcvWB28MpusuhhDJ", "5slzgiWZEtyd56Lf"], "description": [{"language": "xnbY97jjYgXchCbk", "message": ["XX26uEdCfQaMAQuT", "KfC0I2kNjCMDtDMr", "entgn3DhqciwIeSh"]}, {"language": "F9RKb9vvxuJlhXbW", "message": ["hbwPwToC6knjVwVn", "zaqSfJiQFC2gXoda", "0kg16yUSpSOAjHJW"]}, {"language": "wfCjYwWkLob9gKLq", "message": ["s2nEZhpByfHZinxN", "fgPAwkMBsznlBUqn", "LT4AbGptKaWNvPbp"]}], "isCustomRegex": false, "letterCase": "OaNdsimmkW2miH3x", "maxLength": 90, "maxRepeatingAlphaNum": 68, "maxRepeatingSpecialCharacter": 69, "minCharType": 15, "minLength": 55, "profanityFilter": "t1SwqTsKKKo37NHD", "regex": "OQe91Ps3ztUIV0dS", "specialCharacterLocation": "6hIH9c4VfkyrwpuX", "specialCharacters": ["xbaERbfgPmi0eHkt", "1mr9EOIFg0dnWIYN", "2NVL70Iw157g00jr"]}}, {"field": "9b8MuYmmeKTmBNvG", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "avatarConfig": {"allowedPrefixes": ["Qdf3ewoGGoY7xmFN", "AmjDDCvs78mcMdiS", "76YApGJ9ufwLYkqI"], "preferRegex": false, "regex": "uwC3WgumrIz4NhGz"}, "blockedWord": ["tZpr4U4fwQIiLXgm", "RasvjO4lj8m3XEwP", "2b4gd3xOeii8Jnms"], "description": [{"language": "sep2xD2NY0kABeGs", "message": ["9yxahld1pO0Gyf5P", "O3COyMvczgEpzZ3F", "btxfhcRC7IVYa6iZ"]}, {"language": "5uFRYNn3SHiWxF0Y", "message": ["buU5ar5qTLWUCy0A", "fgc050XIZRW491e9", "4mQjVOOBnIWhunEl"]}, {"language": "qZUodp3IhtCSHy1e", "message": ["i1fIrPvfHnRN06Ej", "RwEQlNapJRfk4f9Z", "cw1pEHAyNFxcVTKu"]}], "isCustomRegex": true, "letterCase": "MybYGxD9IPmmsLmu", "maxLength": 39, "maxRepeatingAlphaNum": 21, "maxRepeatingSpecialCharacter": 96, "minCharType": 0, "minLength": 42, "profanityFilter": "Pj0O4zd8Tb7cUNGP", "regex": "TBxiFFCrn7djjs69", "specialCharacterLocation": "FTFVGUVhvKhJCmei", "specialCharacters": ["sql14mUHVbMPimNh", "cZsU3VAdMDcb4qlk", "iFAamqvZI2KwjqPB"]}}]' \
    > test.out 2>&1
eval_tap $? 140 'AdminUpdateNamespaceScopedInputValidations' test.out

#- 141 AdminResetNamespaceScopedInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetNamespaceScopedInputValidations \
    --field 'iWXade41s3rH34mB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'AdminResetNamespaceScopedInputValidations' test.out

#- 142 AdminGetLoginAllowlistV3
./ng net.accelbyte.sdk.cli.Main iam adminGetLoginAllowlistV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'AdminGetLoginAllowlistV3' test.out

#- 143 AdminUpdateLoginAllowlistV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateLoginAllowlistV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "roleIds": ["nDBLJoJHbiQ5duE5", "p4cfs2E41cK8QTwi", "IAvxSvNDlmM5nQFM"]}' \
    > test.out 2>&1
eval_tap $? 143 'AdminUpdateLoginAllowlistV3' test.out

#- 144 RetrieveAllThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 144 'RetrieveAllThirdPartyLoginPlatformCredentialV3' test.out

#- 145 RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 145 'RetrieveAllActiveThirdPartyLoginPlatformCredentialV3' test.out

#- 146 RetrieveAllSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 146 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 147 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zs7fzjgyc44mEh9t' \
    > test.out 2>&1
eval_tap $? 147 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 148 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Rk8knYSV30lnroQe' \
    --body '{"ACSURL": "hMDli6t9unQLYXxm", "AWSCognitoRegion": "09wpGAbpEmDY9vLh", "AWSCognitoUserPool": "3u6EDsUmrV6kH4Oo", "AllowedClients": ["tKwG3UC6XCnnZxF8", "CmQr17W65br34rBB", "N9tU6TDm5GloFSKW"], "AppId": "M1eym5ydC6p25xCW", "AuthorizationEndpoint": "TqUOYZENJ1QHZQxP", "ClientId": "RXH7uxBJEECQE1li", "EmptyStrFieldList": ["3Bg7Jxc9pUnZmvhi", "dwCkZwqjYLfTiCO1", "NDBvQvRPnAz4VzW0"], "EnableServerLicenseValidation": true, "Environment": "Rmut9H9XyWI8bp8f", "FederationMetadataURL": "QxRuX91uYmtrHJbE", "GenericOauthFlow": false, "IncludePUID": true, "IsActive": false, "Issuer": "hziXV8HwSmvcvcDK", "JWKSEndpoint": "F19yVRafCjOuSYht", "KeyID": "83AdvBaagTiRJ8da", "LogoURL": "GTVX3Bb7jlz5IfHg", "NetflixCertificates": {"encryptedPrivateKey": "KjI9mwJSrN8jkIyk", "encryptedPrivateKeyName": "R2zbaI6PD7fEscSh", "publicCertificate": "nGUGUtV9GJ279GDb", "publicCertificateName": "LNwjm3FK0nnX2poM", "rootCertificate": "fZ1hDHtbh4HtMlFg", "rootCertificateName": "vh2Dp2SoiIPp1yvf"}, "OrganizationId": "AHS0VgLu11A3HTov", "PlatformName": "Fi4tPAGfleyCA6jE", "PrivateKey": "tcqsnzoVILjkwW61", "RedirectUri": "duF87aUyrdt4XSpW", "RegisteredDomains": [{"affectedClientIDs": ["BAetsanzqP8oxfrt", "bECD1CYPwaiBAxfY", "L8Avt70ZUT2fSk3L"], "domain": "L0calqxEewuGS469", "namespaces": ["k2hG0WKt4sUmanYx", "M0UHZVNYzGMNIpWo", "SLkUrfuf4U3WeYeA"], "roleId": "9t2ENKKWrFtHIi1C", "ssoCfg": {"googleKey": {"MgKAOG5iDcCR5PbC": {}, "vDLil8wj9cKM3Ar6": {}, "MF35hCER4nGmWGgT": {}}, "groupConfigs": [{"assignNamespaces": ["JfHlJl4tHGa4XfZc", "d9CVnGqMX9FieeEs", "sWEUl07bhwntCVqi"], "group": "YOJf5KwMZQjzvjSo", "roleId": "zv6CTRDl0zp9CzHF"}, {"assignNamespaces": ["winkBNi4gvqgl6TZ", "9TGVPmv34h6T7Esu", "fmfxKYB4LM6H6QXm"], "group": "pZ9X3fUSR1l9xLPB", "roleId": "smAUrD9L1IiD6Mlc"}, {"assignNamespaces": ["EPhMDFzjHZ3sIhzO", "x2CXKlvIomU3pIxM", "9n8D2eLMe3lt9qfx"], "group": "2UDcgVE7L9FK6e0M", "roleId": "rPc4vtxk9hVKlG56"}]}}, {"affectedClientIDs": ["HlzGr7XjdyRJunZP", "kp6ccIBnWyPw8mj7", "gyQ7XdIszGRj46CO"], "domain": "PipH1MWVTHG0qHJC", "namespaces": ["WEfOJpZm9yEYWNGM", "y2pgSGSUOK68eqGJ", "tWf1Ybgg8rdwY9bm"], "roleId": "rvHmO07KNqX9LM2I", "ssoCfg": {"googleKey": {"wEsdOGBXBwnzDX8v": {}, "3xgC1Ge9PdbTTAJ2": {}, "Gp1r0sVZ6LJAOddI": {}}, "groupConfigs": [{"assignNamespaces": ["L2l3hPjNDKv2LWfX", "qjr8fS79En3wYowB", "dkaZ3y6i38XQjLDR"], "group": "qkpiFK5BtiQ272Uo", "roleId": "9UBJWodpdwsX1jor"}, {"assignNamespaces": ["cyR0x3YiHF8ITGPR", "QBCgIs1Q2lzxl0yF", "5m77TTh4gUoj8u2W"], "group": "RcLiEtzVlnkflfn7", "roleId": "pHY48F1dl1q92m3i"}, {"assignNamespaces": ["RlfnBAk0CwiAsR65", "yQ9ssuHdGmxncCEr", "0KcgeqzGbruNB72H"], "group": "HMkjzyBB4UFKiaoV", "roleId": "0VOem2yqPsMFxKyb"}]}}, {"affectedClientIDs": ["PkbuS6x9cLJ1APnN", "lsa2bRBr27fVMWuA", "fDqLMR919IZPKOKi"], "domain": "AVQXXOmqFHLbyXmg", "namespaces": ["CNiXH8uenbC5Cphg", "MweexsIAP5vHLjBJ", "9iqMcBL4BzhDUjhK"], "roleId": "PwbwcvQU5kG8bXGF", "ssoCfg": {"googleKey": {"mPAnOkDiJq4xQye7": {}, "HqnVK3YVeOWs9mfV": {}, "Qh3jLBtn9pxpE7BY": {}}, "groupConfigs": [{"assignNamespaces": ["tzB0B4CxyQrUpIFv", "ORxTi79DpSjb39uk", "cR6c2E2r3vk3IfAK"], "group": "EbqcNXSGCCvNowNm", "roleId": "dpcJgF88ySNq4Mj7"}, {"assignNamespaces": ["mulP4tQ6R1OqKVOT", "niBgLsNhdgQ0JWZj", "NRSzOTqcVNX3ahvx"], "group": "w9gwwhTnjN6wKZGW", "roleId": "4y3f0R9s2kndhhZh"}, {"assignNamespaces": ["wAiLsZs4pmLDIQch", "4IjDq9aT3qZyI0rY", "sWucAkXsVJbXi7eR"], "group": "Za7WwIc895ImqK6t", "roleId": "VsaUq3stUh5J5Z9G"}]}}], "RelyingParty": "iBiSAylX5cS0IeHp", "SandboxId": "WCugmfOL0QQpxsuD", "Secret": "8PGqku59eFJrOXyD", "TeamID": "Yz9vMUOPG0iHDT8Q", "TokenAuthenticationType": "bF7gHPTPQbvLt2NR", "TokenClaimsMapping": {"qJGIKzLyH1y72L13": "Ornyx34luLdvtsTK", "XMjiw6gYPvfn2Qt9": "iyq3Nyk8ncu2Z3eD", "HH9WaVO4iKhDcJ7T": "CcNIsQ3PuppUxDSK"}, "TokenEndpoint": "8aOTGMudcxlCV4cN", "UserInfoEndpoint": "bJGQ57lPdinpjS2D", "UserInfoHTTPMethod": "RfGt9GlyZVQ4X67t", "googleAdminConsoleKey": "PZSTpPq3xjrElvvD", "scopes": ["gw0ag7kSWE0Hiqm5", "IuLryiEXqvUWDjU1", "G0EVjVZw1ToLuPak"]}' \
    > test.out 2>&1
eval_tap $? 148 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 149 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QN1MpOs1RVFrcg2C' \
    > test.out 2>&1
eval_tap $? 149 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 150 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Xxepx78fvsyhE2BK' \
    --body '{"ACSURL": "tyTDSIM7mkmvZ7Cm", "AWSCognitoRegion": "sh4US8o4jfMANPpm", "AWSCognitoUserPool": "ZDdMiCxmuCCVuFjS", "AllowedClients": ["1GC1d2b92B4vEgj3", "HOmhcWm428XejRF9", "4NIY9nMrBZo0lNUB"], "AppId": "DShHD32vvL28FPwT", "AuthorizationEndpoint": "iXfLcxDC9Ynd02mE", "ClientId": "CIQhfIhHtADUQ9zi", "EmptyStrFieldList": ["mQTQT95pFJUAJsyA", "feKOufV4f15NohXu", "6opxQGRt6PqlkL0d"], "EnableServerLicenseValidation": false, "Environment": "2SwCUsTag4MLAo3m", "FederationMetadataURL": "61P2xaNfmn8Onb1a", "GenericOauthFlow": false, "IncludePUID": false, "IsActive": false, "Issuer": "z0F2UBRmMhAbUWmF", "JWKSEndpoint": "hdYLWzMuv3zkUY0n", "KeyID": "0BAZkwbYkBLyO6A0", "LogoURL": "FqfhnaB3YxKNdOTa", "NetflixCertificates": {"encryptedPrivateKey": "cCcJfIfXshuLUk5W", "encryptedPrivateKeyName": "dpxjZx5noXPhPUTK", "publicCertificate": "bonoucNmzwOZOK56", "publicCertificateName": "sDkci5rZ8iMlOuks", "rootCertificate": "QJCiRFiZWwJ7NrTb", "rootCertificateName": "1XTB9YQzUJ9XlYJ8"}, "OrganizationId": "BzP6EUmUXGM5anIl", "PlatformName": "oyj9lhbvuQdW2jwK", "PrivateKey": "Uckc794ryY91lX8D", "RedirectUri": "D4MYXlrJ81lHvv9r", "RegisteredDomains": [{"affectedClientIDs": ["qvEoM8YmVjAkO3HK", "sEp6KlqwW4djrexc", "bHdEtoQvpV344Rct"], "domain": "mTozCi8HeV6jbalH", "namespaces": ["mqBBfi7sSF5BoGiT", "CVsXsygWbjE2opXt", "dsJQeJ1too0qvxph"], "roleId": "TLEEBGTtZyTjdKNK", "ssoCfg": {"googleKey": {"gYazujsmSmylT1Yt": {}, "xIq73aMb48jISd97": {}, "KORRhxSWLWLNfHRD": {}}, "groupConfigs": [{"assignNamespaces": ["3V15QaGGL46LuxJF", "3sbeqWBdQuWfgBAK", "x27MSBqabUXOGkko"], "group": "MUZn1YXj5zFZeOCO", "roleId": "R9NvBQZSJPOIKrRB"}, {"assignNamespaces": ["rYVzi9ui3lvozTt9", "TsH7A0TuU2aL4bPk", "k11sys6GdkDcos5u"], "group": "VJ0BJfZ0jvA54CSq", "roleId": "ZFDsO1skRjOU1SMf"}, {"assignNamespaces": ["QVQa6blj9Rdd85bd", "YUumPKVSZCg3XTc9", "vQe0dHJfF6KIuvnR"], "group": "Ca9JktyBdxkZKrEW", "roleId": "Fw9GYxjiiOQAD77c"}]}}, {"affectedClientIDs": ["i0vfWVZoRRMPi57H", "yKKz5nyI6ulKNKoX", "a0dgx1JgjC56pda3"], "domain": "YhtQxpCYME6x21pd", "namespaces": ["X2QSPAd9sxoLnWGP", "1PafIjLX8ce0KbNN", "7Ycl2JfmQplvGjVQ"], "roleId": "4aebjfgGu472oWJl", "ssoCfg": {"googleKey": {"fglLM4xjfkNL4lU6": {}, "jaGfsD1cfswmeFpv": {}, "tDtetoQVFL8LNW11": {}}, "groupConfigs": [{"assignNamespaces": ["vtpaTxi7k489jRCn", "48bvkCPfKofwXOIZ", "ZQAJza84lKKmVOaT"], "group": "S6xBbNrSUAW2ak7I", "roleId": "SDrBVg6NuDZvPb1k"}, {"assignNamespaces": ["uUfNfUDe4g7q6PHE", "aqbzHvDDl1jiLw3X", "MGBA6JXDpA1tIC45"], "group": "C0oaGouFu4hXONgU", "roleId": "wJnUpryDeRcpUvlr"}, {"assignNamespaces": ["w2MwC1uuokpaIjL0", "Vxe5n9Lx3QcFo9gx", "OgvDc7xMrRKvw8IS"], "group": "P2WKmCRRXBxlalCH", "roleId": "tWlKxLpS8fLWoQ5n"}]}}, {"affectedClientIDs": ["uJhatQPxR7dvBVC5", "zgOKLTDmHe8c1eJ9", "sde7Ryt4udIv22M1"], "domain": "8uux9xBomQFPFWy5", "namespaces": ["cwNPI6aFo0MVwDZC", "IXFNEL3uWVRz3V7Y", "bJM3bNLWHAbCZixe"], "roleId": "2cQ6O30lpzcBQMAE", "ssoCfg": {"googleKey": {"cNcJqrKxnMzSYoc4": {}, "ZjiMY4H34B6wVd8i": {}, "pcKDwQeUWtjCC2UH": {}}, "groupConfigs": [{"assignNamespaces": ["6jzMO3AfmOS5mQNy", "RPZFPNP56l1AT6OL", "KmZhCZxxPPdPwOtE"], "group": "uWBSO2jJepUnEEgj", "roleId": "a2mIE2kLTnJwc5Xm"}, {"assignNamespaces": ["kCuL5W4tKt6G3j9L", "YdG7xVPqBqe9RDQM", "BSYAFLqp8PF5hCco"], "group": "ukWpnbz4ys7j6lxu", "roleId": "U3u2HEG0qfKegvFT"}, {"assignNamespaces": ["D1sPykS8YLmwtYgW", "GcA0h4G1LZ1HaX5U", "BMbsF44VTsLDRzdq"], "group": "22cbnyK3ggFDh2ka", "roleId": "ZP7pnnVfxPwc259H"}]}}], "RelyingParty": "F9ejHaILQruAuYyJ", "SandboxId": "LYGqMv824ouSgkpK", "Secret": "70uJmUL0uzElixc0", "TeamID": "23dIvDiA0tQWlHwB", "TokenAuthenticationType": "cTtztx3VAl6tXFbn", "TokenClaimsMapping": {"ATCzUOIzVcy9k3ie": "64Vnwa0ClGQJultJ", "e32AiwKadEoIVmpr": "wPsa9YD92CX0rITa", "jpwHITGeHTnqRbzB": "B9ZFgJbQ3Fj1umx4"}, "TokenEndpoint": "ItzkMJ7cudf4r916", "UserInfoEndpoint": "GPrhn2etVIQvRkQJ", "UserInfoHTTPMethod": "AtDUH9tx60AehGz1", "googleAdminConsoleKey": "ermJYXsYgL7TfyIl", "scopes": ["AwjTZdRZJJzWZwvT", "X2bamSCvX1nwvSWd", "DwD7WJHzgNZUKsI5"]}' \
    > test.out 2>&1
eval_tap $? 150 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 151 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'y0mR3zMyTsftKqns' \
    --body '{"affectedClientIDs": ["IJctAdxyZVKHA9Dk", "aSOWgtg8yw8lHEbV", "DwBAqanOlscRIWw8"], "assignedNamespaces": ["2k5K5VTkdubkOFld", "MCQ98JH4n0JtgqzZ", "v5kVu4S95mj8YRva"], "domain": "e4f4lhBPbarbWEm8", "roleId": "bVtZcfVCPdQhim9Q", "ssoCfg": {"googleKey": {"KUAFTVYelIlGJg9w": {}, "dc8bihhWjfZpfcFB": {}, "UsnnDJlmD1iEokbU": {}}, "groupConfigs": [{"assignNamespaces": ["iYzCQh2iNTwtnohd", "dMzMTQ9P7sYLDWAJ", "OA75K4BYJ2fkqYJo"], "group": "F2FI3vyyqRzc20O7", "roleId": "FdsJP1G9tyBTfERX"}, {"assignNamespaces": ["dvgD1Qf7Ot2DkUt3", "yexZBRvxYnEBhXtA", "VxCd3meTrT7cF9oV"], "group": "Ch89wNOkKYssVejc", "roleId": "L3kR3hCGNgaJmuAL"}, {"assignNamespaces": ["lMQl9RLrthbfp0Vg", "weLlT2sY3SsTnDQY", "7kKU2u06Q4veujxt"], "group": "yQENvJrBCqeg67d4", "roleId": "RWOqO4U0bitNQLzw"}]}}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 152 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RoWnR0AbkCPY70Fm' \
    --body '{"domain": "vviVIBbcujF8Vk5q", "ssoGroups": ["b8NhWWwaxyMchkt8", "l5IPSrwrJl7wYIVw", "13NCo9yXlbQ52FTH"]}' \
    > test.out 2>&1
eval_tap $? 152 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 153 PartialUpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TCj6SEAzT7TOpyiu' \
    --body '{"affectedClientIDs": ["vvQUm29Iacq4XRLa", "A643nTMtXSAyejnn", "y0Ju13b6o5uB2XM6"], "assignedNamespaces": ["IHy7EEvHyLmcvrZZ", "Odwe1x8RjU6Bi8JX", "E52sUBBq2SimQQoL"], "domain": "be5YOJvxGRxUzrTw", "roleId": "agH7BMT1IZKTdNFV", "ssoCfg": {"googleKey": {"BQ1crBXAupATO8uX": {}, "sqVpdiWo8SjDAM0R": {}, "iw8wLYW3n4F3LD1E": {}}, "groupConfigs": [{"assignNamespaces": ["DwBXw5uBYeQZOzAT", "NSV9E9yyNb7yaLXz", "AVYymOuhCkZu4htr"], "group": "sf8eIFSovTGXaMsq", "roleId": "8ePN1oco2jx8Upe8"}, {"assignNamespaces": ["SjMvpqM8puggOEdG", "47gD5i2Ni6AnWn3N", "dEPhNHSH7eKDfRcn"], "group": "gEpTnRUQr3RLOM1v", "roleId": "Ex4gqDY6jwyKRxhk"}, {"assignNamespaces": ["Le5zohg9s9utRQt2", "8b6o3K0COF74tz6a", "eXZOYwbwjMNdxKWl"], "group": "BfnRyFS0Ed7gTM5A", "roleId": "VrtBQiDTcNnZa6Zu"}]}}' \
    > test.out 2>&1
eval_tap $? 153 'PartialUpdateThirdPartyLoginPlatformDomainV3' test.out

#- 154 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xk6u6HXXdiC9ZDj4' \
    > test.out 2>&1
eval_tap $? 154 'RetrieveSSOLoginPlatformCredential' test.out

#- 155 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'E4mv12FNXypoOLl1' \
    --body '{"acsUrl": "3j84P0KqirJ4PkMF", "apiKey": "tsnFfz8Ew0X8fBuB", "appId": "SKLSQ4GvLtz50D3r", "federationMetadataUrl": "pBfBovqLwXBuT30E", "isActive": false, "redirectUri": "8dYXvBSYvJBwb6Cj", "secret": "ZUMRf2VJetWsokvx", "ssoUrl": "3BHuTEczr9KjQ3tt"}' \
    > test.out 2>&1
eval_tap $? 155 'AddSSOLoginPlatformCredential' test.out

#- 156 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'z8MTBt1xk9IyssSA' \
    > test.out 2>&1
eval_tap $? 156 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 157 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '8nP5PQjpzk2Tb7iY' \
    --body '{"acsUrl": "dmNZWosrsVBPZ64j", "apiKey": "0HUONscofwYLQcDv", "appId": "kaEIIPoJT83zEGXm", "federationMetadataUrl": "VBZLyrH9J7Boysma", "isActive": true, "redirectUri": "LkP5hc2Fh04JTsqD", "secret": "TynCewqJligLlRxO", "ssoUrl": "elKykICRxF6HtlER"}' \
    > test.out 2>&1
eval_tap $? 157 'UpdateSSOPlatformCredential' test.out

#- 158 AdminListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2txs4qrNARATn6KX' \
    --rawPID  \
    --rawPUID  \
    --body '{"platformUserIds": ["OutlYBbLhL8KXx25", "FZfQIodVBqQsBpCJ", "BIXLGYcwWVRK6UKk"]}' \
    > test.out 2>&1
eval_tap $? 158 'AdminListUserIDByPlatformUserIDsV3' test.out

#- 159 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5ozrXA4HZHNyq9od' \
    --platformUserId 'anhR1Zrm3thUvV87' \
    --pidType 'yfkycLSVdleSaAyl' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetUserByPlatformUserIDV3' test.out

#- 160 AdminGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'dob' \
    > test.out 2>&1
eval_tap $? 160 'AdminGetProfileUpdateStrategyV3' test.out

#- 161 AdminUpdateProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'dob' \
    --body '{"config": {"minimumAllowedInterval": 26}, "type": "XUOyToLPIREGIKlJ"}' \
    > test.out 2>&1
eval_tap $? 161 'AdminUpdateProfileUpdateStrategyV3' test.out

#- 162 AdminGetRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetRoleOverrideConfigV3' test.out

#- 163 AdminUpdateRoleOverrideConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleOverrideConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'GAME_ADMIN' \
    --body '{"additions": [{"actions": [62, 7, 86], "resource": "KF7NXEjrJMki8jvc"}, {"actions": [60, 86, 79], "resource": "8Gwjg3IOH0SDHgYK"}, {"actions": [33, 29, 47], "resource": "ODXMzLSrzoiBnYi5"}], "exclusions": [{"actions": [95, 8, 99], "resource": "x7wq8ZPlXNaUNgdY"}, {"actions": [6, 45, 90], "resource": "fJuje5cPnmGjTvYa"}, {"actions": [40, 86, 77], "resource": "qx1K7qcAoijBPAp6"}], "overrides": [{"actions": [63, 12, 84], "resource": "qjNjLOtNQts2yxf6"}, {"actions": [80, 17, 77], "resource": "w3NeVG4DJi9DaMrc"}, {"actions": [59, 100, 61], "resource": "FgKjE945x2CPVYYG"}], "replacements": [{"replacement": {"actions": [100, 44, 82], "resource": "oGmAmvaVV5YfxnUN"}, "target": "cwjr7gSGhnfuF4WZ"}, {"replacement": {"actions": [17, 87, 98], "resource": "aJeRbzTPwD3jxF7v"}, "target": "xRUY0ilrNoFT98Sg"}, {"replacement": {"actions": [40, 54, 73], "resource": "tvSG8Cfa9dzOJDGC"}, "target": "THIOFjeXbsSgR43k"}]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminUpdateRoleOverrideConfigV3' test.out

#- 164 AdminGetRoleSourceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleSourceV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'VIEW_ONLY' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetRoleSourceV3' test.out

#- 165 AdminChangeRoleOverrideConfigStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminChangeRoleOverrideConfigStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --identity 'USER' \
    --body '{"active": true}' \
    > test.out 2>&1
eval_tap $? 165 'AdminChangeRoleOverrideConfigStatusV3' test.out

#- 166 AdminGetRoleNamespacePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleNamespacePermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '80JfMpPrSqYypRUn' \
    > test.out 2>&1
eval_tap $? 166 'AdminGetRoleNamespacePermissionV3' test.out

#- 167 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'q5o4ETeCUYG9ccTt' \
    --after '15' \
    --before '99' \
    --limit '50' \
    > test.out 2>&1
eval_tap $? 167 'GetAdminUsersByRoleIdV3' test.out

#- 168 AdminQueryTagV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryTagV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '98' \
    --tagName 'w8OQ13t3uTw6zQuo' \
    > test.out 2>&1
eval_tap $? 168 'AdminQueryTagV3' test.out

#- 169 AdminCreateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tagName": "ZcXQpoTOxe8y1jor"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminCreateTagV3' test.out

#- 170 AdminUpdateTagV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'Nsg9ZKYCKoISyXtH' \
    --body '{"tagName": "zoWGdYohxMp3uOQI"}' \
    > test.out 2>&1
eval_tap $? 170 'AdminUpdateTagV3' test.out

#- 171 AdminDeleteTagV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteTagV3 \
    --namespace "$AB_NAMESPACE" \
    --tagId 'ybqWfG9BJ6FVKlbY' \
    > test.out 2>&1
eval_tap $? 171 'AdminDeleteTagV3' test.out

#- 172 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'HtbPtaxvagSlpGgV' \
    > test.out 2>&1
eval_tap $? 172 'AdminGetUserByEmailAddressV3' test.out

#- 173 AdminBulkUpdateUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"updateRequest": {"skipLoginQueue": true}, "userIds": ["F6VeDAPOGBwweyFf", "XEOEAEtbag82KgBg", "yCd5vjkfz3eR4DtN"]}' \
    > test.out 2>&1
eval_tap $? 173 'AdminBulkUpdateUsersV3' test.out

#- 174 AdminGetBulkUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'p129hzBw3xLUcCEt' \
    --body '{"bulkUserId": ["0DzmkJq1sml5bYt7", "6BNsi4giR9434WpK", "KdzxoufCNlFoOcWQ"]}' \
    > test.out 2>&1
eval_tap $? 174 'AdminGetBulkUserBanV3' test.out

#- 175 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"findByPublisherNamespace": true, "userIds": ["y4bjmQeEweoBHTdw", "Ak7ZQnbqY1cQwVEt", "Ar5kKKAo9MM2Cqm8"]}' \
    > test.out 2>&1
eval_tap $? 175 'AdminListUserIDByUserIDsV3' test.out

#- 176 AdminBulkGetUsersPlatform
./ng net.accelbyte.sdk.cli.Main iam adminBulkGetUsersPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["4jVi9kIpqgrzpUkN", "OBWydXV0Fi02aFr8", "CDapjwNOl4k8rVNr"]}' \
    > test.out 2>&1
eval_tap $? 176 'AdminBulkGetUsersPlatform' test.out

#- 177 AdminCursorGetUserV3
./ng net.accelbyte.sdk.cli.Main iam adminCursorGetUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cursor": {"cursorTime": "m8drv8QD2JOe2Ntz", "userId": "7EFvowPgIGuetxFM"}, "fields": ["qXCQMAqQ2ZRGzNtr", "ThFa9XU8mosluiHZ", "J7O8sAQ32wj9uaDz"], "limit": 39}' \
    > test.out 2>&1
eval_tap $? 177 'AdminCursorGetUserV3' test.out

#- 178 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["8qs2mqtnGAqXUjNy", "pF6MMqWpdEJsPoaI", "bYz8cK5jlpJdre5u"], "isAdmin": true, "languageTag": "C7SwgoViPeIB4Ehy", "namespace": "0Y5aSJVDginxAM77", "roles": ["eY9C14FbfiI2NPvl", "1kCY5bEokxXxkWZb", "jf7GZxaossQmjo69"]}' \
    > test.out 2>&1
eval_tap $? 178 'AdminInviteUserV3' test.out

#- 179 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '58' \
    --platformUserId 'ohJFyTNk5FGUPhR4' \
    --platformId 'LEZvz3EjFR7996Ug' \
    > test.out 2>&1
eval_tap $? 179 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 180 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 180 'AdminListUsersV3' test.out

#- 181 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '4axDV5uTcYsoahUr' \
    --endDate 'ELQ1btjJOqQMgZWA' \
    --includeTotal  \
    --limit '95' \
    --offset '83' \
    --platformBy 'E92nHJzvw7tnYtGf' \
    --platformId 'v0EJyjBu4EzwRjD7' \
    --query 'jmQJeFPghqamSc5y' \
    --roleIds '0X48eT7Mluexk87b' \
    --selectedFields '9Z5BTsEA3EdmW8sa' \
    --skipLoginQueue  \
    --startDate 'abP4xRowfNojzPXI' \
    --tagIds '2v0prR3OEey0MkZw' \
    --testAccount  \
    > test.out 2>&1
eval_tap $? 181 'AdminSearchUserV3' test.out

#- 182 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["S6TYwNN3UYhic03q", "GEg5fNzBVrjo3g8C", "fRwtyl1HeT7VEPgG"]}' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetBulkUserByEmailAddressV3' test.out

#- 183 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '40QyXzsOzgck078I' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetUserByUserIdV3' test.out

#- 184 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ghoQBp2mWAOYkscz' \
    --body '{"avatarUrl": "xBS0OBCa2vWadLmQ", "country": "tYKmEMzicbuL2S3R", "dateOfBirth": "iW8dLTCBfGUdVEdv", "displayName": "dQL7sVwcZ2PofaJo", "languageTag": "SqtrEOqxH46fRTSZ", "skipLoginQueue": false, "tags": ["bJIkNnt9P1Tkm08l", "uh4dpPRMDbUXBWTb", "pAogG2wlZkLhuU5F"], "uniqueDisplayName": "I8NijFI0GKwJ3vfX", "userName": "lsAMy2Zp2UAGxHnm"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminUpdateUserV3' test.out

#- 185 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SxvkG9UR5q9neoW6' \
    --activeOnly  \
    --after 'JBcGp9Rx2RfcRhXp' \
    --before 'meeHdvphas9S7ivH' \
    --limit '63' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetUserBanV3' test.out

#- 186 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QxoIbVi2CLEk277I' \
    --body '{"ban": "vjj1A647XQ3koaAf", "comment": "ZIim0sFPm1YN27bo", "endDate": "jDVaZLpx4kEWYkO6", "reason": "KrKUMhJrASBh61hm", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 186 'AdminBanUserV3' test.out

#- 187 AdminGetUserBanSummaryV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanSummaryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SSrF35anDGvur19V' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetUserBanSummaryV3' test.out

#- 188 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId '18oIrUKXttgAI2Qd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WJFLmoPEgd8EMspO' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateUserBanV3' test.out

#- 189 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8nkic9gj5vyUMAAm' \
    --body '{"context": "IHYbsxG5N066FXb8", "emailAddress": "8SbLOa21DiSFsm0X", "languageTag": "XQJWszvTQEuALzDN", "upgradeToken": "p1SZ58aDllwzTRHa"}' \
    > test.out 2>&1
eval_tap $? 189 'AdminSendVerificationCodeV3' test.out

#- 190 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'k1MXxj7Esrg7900n' \
    --body '{"Code": "ml5BidsK9dCEzhVn", "ContactType": "Ov0PQbVIaKiHfoeo", "LanguageTag": "rY7A1otGFyv2SMjb", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 190 'AdminVerifyAccountV3' test.out

#- 191 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'jK5pxe82pgFiAS6p' \
    > test.out 2>&1
eval_tap $? 191 'GetUserVerificationCode' test.out

#- 192 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iIzmc8rKrKEPGSAc' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetUserDeletionStatusV3' test.out

#- 193 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ong6eNERUf8kjci1' \
    --body '{"deletionDate": 58, "enabled": false}' \
    > test.out 2>&1
eval_tap $? 193 'AdminUpdateUserDeletionStatusV3' test.out

#- 194 AdminListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tccv9Gv4tOcbnuCq' \
    > test.out 2>&1
eval_tap $? 194 'AdminListUserAllPlatformAccountsDistinctV3' test.out

#- 195 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'f0lm6WBkIzjoSV31' \
    --body '{"code": "tvmMB6jzrpRGESmo", "country": "oHiCV4GUOnXpapXQ", "dateOfBirth": "GRakUbcG7PcR4eiU", "displayName": "3Idi55jNrGNT2VHT", "emailAddress": "KuIT5FwwHj0Ur5F2", "password": "PWGTTD81xhNP4t6k", "uniqueDisplayName": "YBUjyXAn3bWQF6Qc", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 195 'AdminUpgradeHeadlessAccountV3' test.out

#- 196 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mRv6EJtl5xWnsb8o' \
    > test.out 2>&1
eval_tap $? 196 'AdminDeleteUserInformationV3' test.out

#- 197 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wq94RImNWVIJnhhw' \
    --after '0.5062049060734525' \
    --before '0.4706396918334824' \
    --limit '98' \
    > test.out 2>&1
eval_tap $? 197 'AdminGetUserLoginHistoriesV3' test.out

#- 198 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8ZFvGcV8DY0XOkDs' \
    --body '{"languageTag": "txZcY1HgAnZV4IOg", "mfaToken": "lVLqb9lGAJUg21Lt", "newPassword": "7JwgwMUSuC3Bajy3", "oldPassword": "BcEMCtQs2FcEcvVA"}' \
    > test.out 2>&1
eval_tap $? 198 'AdminResetPasswordV3' test.out

#- 199 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yId6Cp85HVDsZBQg' \
    --body '{"Permissions": [{"Action": 83, "Resource": "qsPNJMiZXXOFwmGW", "SchedAction": 55, "SchedCron": "FMnPpWgrQD4hEk0O", "SchedRange": ["LjYsnignE7KcMF7f", "uDbzRRYMNXWUsp1t", "OibJY9aL9ie6vvMb"]}, {"Action": 17, "Resource": "Tdi1Ehr8OtqpNJ9R", "SchedAction": 94, "SchedCron": "JgakZyUV7t73VnSF", "SchedRange": ["buxd4KYZ0jk0UZdh", "tnKu9oTc8pVkiyGs", "j5JdXzRxfNEjUMTs"]}, {"Action": 100, "Resource": "g2AB2WIRUQmauIY5", "SchedAction": 69, "SchedCron": "X0bKVoWtoUW1P7oc", "SchedRange": ["uBAldDSUS7Haa6un", "q1yQOSRvyiLBRVtI", "Di2piIQFVmzMidw7"]}]}' \
    > test.out 2>&1
eval_tap $? 199 'AdminUpdateUserPermissionV3' test.out

#- 200 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0KSahpYZdKZRyR9A' \
    --body '{"Permissions": [{"Action": 63, "Resource": "7JjxvNZhM84DiZk6", "SchedAction": 50, "SchedCron": "OieDCow2zXyFFVpM", "SchedRange": ["87yqEwEacQMTlqN4", "LKkxJ5v3SBafnKNi", "MPbFkFGA85W3HJkq"]}, {"Action": 12, "Resource": "eLH19fqBwNbNe1ff", "SchedAction": 25, "SchedCron": "RtIvQaKyevWYtZjK", "SchedRange": ["6J29v8MpBSpo3AKR", "mnJkzJHAckUyBksY", "QfDm0RNFwiz70tRV"]}, {"Action": 76, "Resource": "mzsDPsWh1k0cQ08N", "SchedAction": 67, "SchedCron": "gEsWDtaKzn8dZwnn", "SchedRange": ["GeZsZVgbPzPFbrOM", "ZMgWkFN7Tpkx6Gcf", "yOg6ZUrrp9ubg9mn"]}]}' \
    > test.out 2>&1
eval_tap $? 200 'AdminAddUserPermissionsV3' test.out

#- 201 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dW2JKmQafUs2bxYz' \
    --body '[{"Action": 40, "Resource": "3KEe2BjV00ReCXFf"}, {"Action": 10, "Resource": "8DHoCQykmXHYmkRl"}, {"Action": 13, "Resource": "D74V21HWDAfvXwdx"}]' \
    > test.out 2>&1
eval_tap $? 201 'AdminDeleteUserPermissionBulkV3' test.out

#- 202 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '2' \
    --namespace "$AB_NAMESPACE" \
    --resource 'di1ldhOh6HvjnYuV' \
    --userId '7NfC4A2ODiZhbfb8' \
    > test.out 2>&1
eval_tap $? 202 'AdminDeleteUserPermissionV3' test.out

#- 203 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QqCyK1XH9D6vl5eF' \
    --after 'dFfgK46GjCWaP8hu' \
    --before 'Tmnq3FGQn3Ahu5wx' \
    --limit '33' \
    --platformId 'udv9z75SzoCV8ZMi' \
    --targetNamespace '2o1nR482D6gNClk9' \
    > test.out 2>&1
eval_tap $? 203 'AdminGetUserPlatformAccountsV3' test.out

#- 204 AdminListAllDistinctPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminListAllDistinctPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'c87hosaPFC5zBW3Z' \
    --status 'gVZCj9ObVGT0Scwl' \
    > test.out 2>&1
eval_tap $? 204 'AdminListAllDistinctPlatformAccountsV3' test.out

#- 205 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '4kNmCi15XTJTgCNN' \
    > test.out 2>&1
eval_tap $? 205 'AdminGetListJusticePlatformAccounts' test.out

#- 206 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'H7RtG5Xmo9Q0Wb07' \
    --userId 'N17fkxZSc6VbE0AG' \
    --createIfNotFound  \
    > test.out 2>&1
eval_tap $? 206 'AdminGetUserMapping' test.out

#- 207 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'cekjMNHuPXtz8tXx' \
    --userId 'rmzafMUguyDoN91u' \
    > test.out 2>&1
eval_tap $? 207 'AdminCreateJusticeUser' test.out

#- 208 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'c28HoSpGt1g0GGbT' \
    --skipConflict  \
    --body '{"platformId": "4Hf2PPKOldkbgX9C", "platformUserId": "WJKwXXSbv5eg9q86"}' \
    > test.out 2>&1
eval_tap $? 208 'AdminLinkPlatformAccount' test.out

#- 209 AdminGetUserLinkHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLinkHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IaDFjjx6uZerWbtw' \
    --platformId 'TX9gNRByjbE8lOLA' \
    > test.out 2>&1
eval_tap $? 209 'AdminGetUserLinkHistoriesV3' test.out

#- 210 AdminPlatformUnlinkV3
eval_tap 0 210 'AdminPlatformUnlinkV3 # SKIP deprecated' test.out

#- 211 AdminPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fTXKLzbrddqcKLa7' \
    --userId 'LevxNHOSEhQRZIp6' \
    > test.out 2>&1
eval_tap $? 211 'AdminPlatformUnlinkAllV3' test.out

#- 212 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '93lRwtc43atCuCFx' \
    --userId 'bfbz4aQERziPL4dH' \
    --ticket 'hOqG5KDdUvk0LEi2' \
    > test.out 2>&1
eval_tap $? 212 'AdminPlatformLinkV3' test.out

#- 213 AdminDeleteUserLinkingHistoryByPlatformIDV3
eval_tap 0 213 'AdminDeleteUserLinkingHistoryByPlatformIDV3 # SKIP deprecated' test.out

#- 214 AdminDeleteUserLinkingRestrictionByPlatformIDV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6Ls7mjRxNmvvNtjJ' \
    --userId 'NQepUTGhwlY4lPzl' \
    > test.out 2>&1
eval_tap $? 214 'AdminDeleteUserLinkingRestrictionByPlatformIDV3' test.out

#- 215 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sCR5rVsyfcH7WjP7' \
    --userId 'HuGz3b5WAEvdRF9b' \
    --platformToken 'qMj4ro5B19VE838c' \
    > test.out 2>&1
eval_tap $? 215 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 216 AdminGetUserSinglePlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminGetUserSinglePlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --platformId '7OydVw0zCqoMZvpI' \
    --userId 'OO97DmQ5ZOzx6iCJ' \
    --crossNamespace  \
    > test.out 2>&1
eval_tap $? 216 'AdminGetUserSinglePlatformAccount' test.out

#- 217 AdminDeleteUserRolesV3
eval_tap 0 217 'AdminDeleteUserRolesV3 # SKIP deprecated' test.out

#- 218 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tu60IifzMhkk5Pxs' \
    --body '[{"namespace": "jqbCKpMv2Yky9DYk", "roleId": "D2sIllFtBtXJKG3r"}, {"namespace": "qBmILhtWm8RQvRUb", "roleId": "UDSiefGEdLucrtO2"}, {"namespace": "gCQD057DrDlgC2nz", "roleId": "S9SiGUjVAw4v3q6J"}]' \
    > test.out 2>&1
eval_tap $? 218 'AdminSaveUserRoleV3' test.out

#- 219 AdminAddUserRoleV3
eval_tap 0 219 'AdminAddUserRoleV3 # SKIP deprecated' test.out

#- 220 AdminDeleteUserRoleV3
eval_tap 0 220 'AdminDeleteUserRoleV3 # SKIP deprecated' test.out

#- 221 AdminGetUserStateByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserStateByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RHcn7KaoCEkRdo6q' \
    > test.out 2>&1
eval_tap $? 221 'AdminGetUserStateByUserIdV3' test.out

#- 222 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HYIZWnXqQ1oHFJ9Q' \
    --body '{"enabled": true, "reason": "vqsL9SomqWsGA76y"}' \
    > test.out 2>&1
eval_tap $? 222 'AdminUpdateUserStatusV3' test.out

#- 223 AdminTrustlyUpdateUserIdentity
./ng net.accelbyte.sdk.cli.Main iam adminTrustlyUpdateUserIdentity \
    --namespace "$AB_NAMESPACE" \
    --userId 'xi0QzZWfmP2sx0KO' \
    --body '{"emailAddress": "5bEJaPnAFjsodyJQ", "password": "VVBrShGbIIuqK8C4"}' \
    > test.out 2>&1
eval_tap $? 223 'AdminTrustlyUpdateUserIdentity' test.out

#- 224 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '03HgoXCR6XOMXwKd' \
    > test.out 2>&1
eval_tap $? 224 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 225 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'fqk8T4QHK30EX0Fc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "lpDl5HsuracO5Mnj"}' \
    > test.out 2>&1
eval_tap $? 225 'AdminUpdateClientSecretV3' test.out

#- 226 AdminCheckThirdPartyLoginPlatformAvailabilityV3
./ng net.accelbyte.sdk.cli.Main iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId 'nxD1OXkxShFVQTRe' \
    > test.out 2>&1
eval_tap $? 226 'AdminCheckThirdPartyLoginPlatformAvailabilityV3' test.out

#- 227 GetThirdPartyLoginPlatformDefaultsV3
./ng net.accelbyte.sdk.cli.Main iam getThirdPartyLoginPlatformDefaultsV3 \
    --platformId 'kLfjmy8zosRCRgVw' \
    > test.out 2>&1
eval_tap $? 227 'GetThirdPartyLoginPlatformDefaultsV3' test.out

#- 228 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'brQKmb01yA7U7dGM' \
    --before 'jupZkZQY8CNyT4k3' \
    --isWildcard  \
    --limit '61' \
    > test.out 2>&1
eval_tap $? 228 'AdminGetRolesV3' test.out

#- 229 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "managers": [{"displayName": "fT22G5NpE130YWSg", "namespace": "xpKWtdtdtVW9anEN", "userId": "mxb9e7vXZV3ig8Jg"}, {"displayName": "5VByeI3ycMcYYBix", "namespace": "KJXCISQdwec1m8Bu", "userId": "sV9tUh74KVo6Xqjz"}, {"displayName": "2xUKLNWSmYyVvyel", "namespace": "IJ8QgaLMqi836ULa", "userId": "7cfZl4VuY6rsZyo6"}], "members": [{"displayName": "CBRRnoOikIxXKKIR", "namespace": "6kPmswm5TCAU1cKA", "userId": "pdJDnE73GLmSZns5"}, {"displayName": "owBhoUg4LsGP6KLP", "namespace": "XkvUv2XiXaBzsmax", "userId": "jTZPlLitytGka7Kv"}, {"displayName": "5TacQKF4OlRGdmXx", "namespace": "ETLEQrr3KCAV9alq", "userId": "3hK1G4kKooSNNUZu"}], "permissions": [{"action": 16, "resource": "kSSV8e1MgTTLS2Fg", "schedAction": 0, "schedCron": "3eTC0vzZUDj9dzGg", "schedRange": ["GVxo9OHgfHumyfuB", "NisecYbcOpR45VDl", "vSc0Mr7ImwCwGqOf"]}, {"action": 27, "resource": "bNs97KvKyj3MqS7D", "schedAction": 5, "schedCron": "TrDCjhnKvsHezWTq", "schedRange": ["gYPixtHk6lWq6tEe", "UmU96FLEak0mJqjR", "YldcTpdeCD9XPRi4"]}, {"action": 3, "resource": "6Z7rb21A2E9pX0BW", "schedAction": 59, "schedCron": "dzA8bvXlDhG7Bror", "schedRange": ["bKIKuOXJPm5ztrr0", "9CDA8Ij5bGKSuopW", "QbaCvdPSq8Z27Gpv"]}], "roleName": "HCDx55JZ5z6gujpF"}' \
    > test.out 2>&1
eval_tap $? 229 'AdminCreateRoleV3' test.out

#- 230 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'zlPspQD9IRIpDDub' \
    > test.out 2>&1
eval_tap $? 230 'AdminGetRoleV3' test.out

#- 231 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'ntPCFxfeoW2NdSWz' \
    > test.out 2>&1
eval_tap $? 231 'AdminDeleteRoleV3' test.out

#- 232 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'OXjO1NQUqWHBW78X' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "dhuzI7G9NCKKXu1b"}' \
    > test.out 2>&1
eval_tap $? 232 'AdminUpdateRoleV3' test.out

#- 233 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'qI2M5PmXfKnQ7BYG' \
    > test.out 2>&1
eval_tap $? 233 'AdminGetRoleAdminStatusV3' test.out

#- 234 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'jCUDMOrbmoRvWnfm' \
    > test.out 2>&1
eval_tap $? 234 'AdminUpdateAdminRoleStatusV3' test.out

#- 235 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'GFy0eUoOBd90h9ED' \
    > test.out 2>&1
eval_tap $? 235 'AdminRemoveRoleAdminV3' test.out

#- 236 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'qSTOfoNewWjwMWDK' \
    --after 'Et6JhbJ0fwTDaq6b' \
    --before '5RpMwhWPtndriXU9' \
    --limit '24' \
    > test.out 2>&1
eval_tap $? 236 'AdminGetRoleManagersV3' test.out

#- 237 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId '59tEGm9NYeUT5P0n' \
    --body '{"managers": [{"displayName": "x8TqSZdZ5C8mFI9T", "namespace": "nvzEqBNMF9CZvPxT", "userId": "5zbreMc9fBoU3RHN"}, {"displayName": "DFjLKFrepy56eW1k", "namespace": "mb15QeIQF51c4MqJ", "userId": "zDSvELgBe6dboSdh"}, {"displayName": "kBzAzPkt1efGJeJa", "namespace": "xyHYutgXucx85vHA", "userId": "009FAb21jxeWXk80"}]}' \
    > test.out 2>&1
eval_tap $? 237 'AdminAddRoleManagersV3' test.out

#- 238 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'y9uxgVLGgK8aVSCN' \
    --body '{"managers": [{"displayName": "6oCETQ8gIDRdD2ww", "namespace": "MXwKVXGPhEJsc7rZ", "userId": "pxaPHc9r8eToFmkH"}, {"displayName": "J6BPOKFLxIwKssw6", "namespace": "47YwDudnGRufOUGf", "userId": "MjTU226l07jPlcYa"}, {"displayName": "qYM7YfBmhjI9Y28q", "namespace": "VceS9UX48dKPCFUI", "userId": "eyYEymNXzNX6TGh4"}]}' \
    > test.out 2>&1
eval_tap $? 238 'AdminRemoveRoleManagersV3' test.out

#- 239 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'UdEweeBsJEvBbAvC' \
    --after 'mlh6Z1oz9BaixUUv' \
    --before 'mzbajE2gjooiDnc1' \
    --limit '80' \
    > test.out 2>&1
eval_tap $? 239 'AdminGetRoleMembersV3' test.out

#- 240 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId '5RNB5dVCsB7xL4ax' \
    --body '{"members": [{"displayName": "SPgPCiwLxCFLDixZ", "namespace": "wVtt3RVTl0tR00oQ", "userId": "gcHdGGK3x76U1EIc"}, {"displayName": "klttmrpgF5szl0sM", "namespace": "Y8es36r1FgR70eNL", "userId": "HkVrEFd8xArWJuCA"}, {"displayName": "IfNBSHgpFNw9K9pm", "namespace": "AIc6VSfE9nbE2PMv", "userId": "12ZSRJkujxbCu1HF"}]}' \
    > test.out 2>&1
eval_tap $? 240 'AdminAddRoleMembersV3' test.out

#- 241 AdminRemoveRoleMembersV3
eval_tap 0 241 'AdminRemoveRoleMembersV3 # SKIP deprecated' test.out

#- 242 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'aj6Vxs3GuA4S1dS7' \
    --body '{"permissions": [{"action": 70, "resource": "mBerp84qjwzWpCF1", "schedAction": 44, "schedCron": "Dc5APzfzXDELJFaI", "schedRange": ["aEMW5bhJyL72WDyh", "BsCCbnfihnXKxGxa", "upnTTq9ihZkvFKfS"]}, {"action": 68, "resource": "FddYvifGHawNx6yh", "schedAction": 27, "schedCron": "RM69XKkLwioRaKnW", "schedRange": ["hlh80BhYe2fJDS6T", "75Q4ulonMFjmYqE1", "wJhfogWg2Apm0sUy"]}, {"action": 4, "resource": "8aWn65Co0vdCk8so", "schedAction": 0, "schedCron": "JSaZAIadKDEZywon", "schedRange": ["A2SrEdN2tmGuX6r0", "gBVUUeKKlPKtE6gn", "YxmkmCWbs5qugklB"]}]}' \
    > test.out 2>&1
eval_tap $? 242 'AdminUpdateRolePermissionsV3' test.out

#- 243 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'US6uwWrCQt86Jrg8' \
    --body '{"permissions": [{"action": 39, "resource": "ShIhieSKUf3zKbyQ", "schedAction": 22, "schedCron": "r6FNbKJ05Orya6LS", "schedRange": ["SUlugIAknXcSaVYc", "AYp7qSiDvsfMUOpW", "v46sXvpOjrpRo4mY"]}, {"action": 35, "resource": "uIaSxoloIH1gBCWV", "schedAction": 64, "schedCron": "XA9dB4ib8HDOJ8TN", "schedRange": ["iP8KgEAj3dbRTI0i", "6dO3zkbDseh4tJdo", "GcwMBmegqVUaWMJB"]}, {"action": 19, "resource": "LZiBRXszE7CL1cQC", "schedAction": 91, "schedCron": "Gr4drgkDuWS05m0p", "schedRange": ["GzazM2BUXnzUEWTi", "KMJAf6AgbiEDMfCc", "kWogE5gcfF8AMGZ2"]}]}' \
    > test.out 2>&1
eval_tap $? 243 'AdminAddRolePermissionsV3' test.out

#- 244 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'FBS93Mg6TKwdRMra' \
    --body '["DLrwh3d0ykRGkgqU", "NIbJMJ9ABbKVWO2Y", "EDiqkwKbpdk7wlDn"]' \
    > test.out 2>&1
eval_tap $? 244 'AdminDeleteRolePermissionsV3' test.out

#- 245 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '13' \
    --resource 'MvEUNfoL7JCcMo7G' \
    --roleId 'xxXdbYCRexPekTsQ' \
    > test.out 2>&1
eval_tap $? 245 'AdminDeleteRolePermissionV3' test.out

#- 246 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 246 'AdminGetMyUserV3' test.out

#- 247 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'xMTfaSot7aohFYy4' \
    --extendExp  \
    --redirectUri 'VxwHIJ9gzxqAw4vB' \
    --password 'GQAeh0VTiTP4PSrX' \
    --requestId 'US6jYI9lsQFD43Df' \
    --userName '5qUZOFzpFd6b5Jc5' \
    > test.out 2>&1
eval_tap $? 247 'UserAuthenticationV3' test.out

#- 248 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'TETHcup8GG0VCMTF' \
    --linkingToken 'J6svTyo9RHget5hz' \
    --password 'B52BDFopxUwkMuSq' \
    --username 'QnKzDgDAtqE3kuyb' \
    > test.out 2>&1
eval_tap $? 248 'AuthenticationWithPlatformLinkV3' test.out

#- 249 AuthenticateAndLinkForwardV3
./ng net.accelbyte.sdk.cli.Main iam authenticateAndLinkForwardV3 \
    --extendExp  \
    --clientId 'wTQFYEJjIYwqfSRy' \
    --linkingToken '8GgVk77fd1GS5Yky' \
    --password 'hAiAItnWUmD225fp' \
    --username '1egsx3ErheNwqd5p' \
    > test.out 2>&1
eval_tap $? 249 'AuthenticateAndLinkForwardV3' test.out

#- 250 PublicGetSystemConfigV3
./ng net.accelbyte.sdk.cli.Main iam publicGetSystemConfigV3 \
    > test.out 2>&1
eval_tap $? 250 'PublicGetSystemConfigV3' test.out

#- 251 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --additionalData 'riclNNqLyrlzrJ4Q' \
    --extendExp  \
    --linkingToken 'HbfnAdtkujxHff7n' \
    > test.out 2>&1
eval_tap $? 251 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 252 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --redirectUri '1yaNCcjgFhS0URBh' \
    --state 'l0L5FCbOn46W2B2u' \
    --platformId 'PQLrt2t6bVpCgKvP' \
    > test.out 2>&1
eval_tap $? 252 'RequestOneTimeLinkingCodeV3' test.out

#- 253 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'XSDufmKh783cV54J' \
    > test.out 2>&1
eval_tap $? 253 'ValidateOneTimeLinkingCodeV3' test.out

#- 254 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData 'sVBRB0rY0xfWddAC' \
    --isTransient  \
    --clientId 'yHSmo4KX9TPO3K1k' \
    --oneTimeLinkCode '5ZM8btmGsgXNXbpq' \
    > test.out 2>&1
eval_tap $? 254 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 255 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 255 'GetCountryLocationV3' test.out

#- 256 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 256 'Logout' test.out

#- 257 RequestTokenExchangeCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenExchangeCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --codeChallenge 'xh76Af5JSwjw2fE2' \
    --codeChallengeMethod 'S256' \
    --clientId '4e3v5mh6Rum5pbgE' \
    > test.out 2>&1
eval_tap $? 257 'RequestTokenExchangeCodeV3' test.out

#- 258 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 't39uJQpgEtchTe3n' \
    --userId 't7t9ztprSfW9OutA' \
    --platformUserId 'DrNGBWSJ1zQKxVmR' \
    > test.out 2>&1
eval_tap $? 258 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 259 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TawjiZPMoZZcyGEH' \
    --includeGameNamespace  \
    > test.out 2>&1
eval_tap $? 259 'RevokeUserV3' test.out

#- 260 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --blockedPlatformId 'xAKDQher3usApPdJ' \
    --codeChallenge 'Pn9eIdhIBvTTupAB' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --loginWebBased  \
    --nonce 'RwH3EdKmYtbqQHNf' \
    --oneTimeLinkCode 'IZwrMxf3EnzZVnkL' \
    --redirectUri 'T0Lb85nmpdN26BY5' \
    --scope 'YI0jeO2zMDSy4kyq' \
    --state 'yKgrtEPdXXlt8geC' \
    --targetAuthPage 'diXu3iNvn7vLZ7h6' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'alhJNGZF07lsPP5O' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 260 'AuthorizeV3' test.out

#- 261 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token '8mAj6IKSYFdJwgZs' \
    > test.out 2>&1
eval_tap $? 261 'TokenIntrospectionV3' test.out

#- 262 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 262 'GetJWKSV3' test.out

#- 263 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'RPOzwuDSdGl1A2va' \
    --factor 'NeDiSqTfmAVg50kO' \
    --mfaToken 'dJagEmTuaxlxgywk' \
    > test.out 2>&1
eval_tap $? 263 'SendMFAAuthenticationCode' test.out

#- 264 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'bdOsyxX1tfW488oY' \
    --mfaToken 'UT4jyCVJ0V8obTlG' \
    > test.out 2>&1
eval_tap $? 264 'Change2faMethod' test.out

#- 265 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'VThz4bm41oIcV33y' \
    --factor 'jPxibDjfF7JkjCVp' \
    --mfaToken 'ZKMxkFkBtXMU6KRI' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 265 'Verify2faCode' test.out

#- 266 Verify2faCodeForward
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeForward \
    --defaultFactor 'm5xBoIi99ctgFXas' \
    --factors 'xp5h780ktjQw2yXz' \
    --rememberDevice  \
    --clientId 'aQWaF2PqUfbpMpRl' \
    --code '6xRyV19cborUHeCp' \
    --factor 'qnZ5NW623WWn2ZJY' \
    --mfaToken '3QvRa7CDRTcsAHzD' \
    > test.out 2>&1
eval_tap $? 266 'Verify2faCodeForward' test.out

#- 267 OAuthDynamicClientRegisterWithNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam oAuthDynamicClientRegisterWithNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_name": "3dZyyWbUQpbcv3Iw", "client_uri": "mL7a1K3zIUYJmdF1", "grant_types": ["YtWNSQlcMzxfppNC", "rscDPbklTHcmgXsr", "Vj3Mjml6BpCODWGO"], "redirect_uris": ["LMmCZUeelXYyNrXw", "eiCnDldRPRfd6mLZ", "0GTJwEjoZrRtaeWK"], "response_types": ["MC8wsOByQAMAgqFE", "zEt8umj5XhKnw7MH", "DwFVKUC2ecnpUDqv"], "scopes": ["LQixPKVSmWa8TGko", "16XTqHc0cM7ixq8T", "jnxp5Cl8ggaEmCcu"], "token_endpoint_auth_method": "K2hHviBEWpbusO6E"}' \
    > test.out 2>&1
eval_tap $? 267 'OAuthDynamicClientRegisterWithNamespaceV3' test.out

#- 268 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yVqstpgZpbz77y88' \
    --userId 'rUFum2ZcA8iKcF0b' \
    > test.out 2>&1
eval_tap $? 268 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 269 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'kfjcTEFXcTwEtnHx' \
    --clientId 'P5pVtN4jNVIdruEA' \
    --redirectUri '39uCJzsE8WObt6t0' \
    --requestId 'w8LOBxE15JYj4IqW' \
    > test.out 2>&1
eval_tap $? 269 'AuthCodeRequestV3' test.out

#- 270 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'K09l4wkrzahXR1sD' \
    --additionalData 'EDVKDINE3HjCiVR1' \
    --clientId 'dQ8kuhb4pUwnGptH' \
    --createHeadless  \
    --deviceId 'UplxzaDa9PDwhu31' \
    --macAddress 'd8eOdtrfq6ECDD6O' \
    --platformToken 'GkuLs9gNpNon6DKW' \
    --serviceLabel '0.9956324535885159' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 270 'PlatformTokenGrantV3' test.out

#- 271 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 271 'GetRevocationListV3' test.out

#- 272 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'A6AmnQTNFidImWON' \
    > test.out 2>&1
eval_tap $? 272 'TokenRevocationV3' test.out

#- 273 SimultaneousLoginV3
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV3 \
    --simultaneousPlatform 'TvCPMGLdbYEknHPK' \
    --simultaneousTicket 'rZ7TiNBE0HRsE0GH' \
    --nativePlatform 'steam' \
    --nativePlatformTicket 'rCsH3RYxH2Up9Vth' \
    > test.out 2>&1
eval_tap $? 273 'SimultaneousLoginV3' test.out

#- 274 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --additionalData 'PjFrK7Hip0eONFDg' \
    --clientId 'UPShG8wwFKY9AMpc' \
    --clientSecret 'wJd4SrigIxAhbFMZ' \
    --code 'fxaznlDQbzTiFrQB' \
    --codeVerifier '1yUonirH4URx3NkK' \
    --extendNamespace 'QBYrlUaMiFEWUT8c' \
    --extendExp  \
    --password 'AFO5zEw8GENEJYPK' \
    --redirectUri 'xxOw7xNQ98IEbc9Y' \
    --refreshToken 'ITN98j4P2AGeidXR' \
    --scope 'RnIAJfKVjOn6rtIL' \
    --username 'NJVv2DLLUyBt5hDs' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 274 'TokenGrantV3' test.out

#- 275 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'siG30Lv9iGa5mkZj' \
    > test.out 2>&1
eval_tap $? 275 'VerifyTokenV3' test.out

#- 276 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'nRXVcg6AByNpBo2J' \
    --code 'YkwLdmR97u9MVUii' \
    --error '4KpYcb1AUsESaBOT' \
    --openidAssocHandle 'HnbX9tC9PQlFAGbM' \
    --openidClaimedId 'tEybfcAl0mnsAkRT' \
    --openidIdentity '2k0AzdgIunRkTxsG' \
    --openidMode 'drpNELM8Lfkut0wn' \
    --openidNs 'T24wh59RGSbBMh7j' \
    --openidOpEndpoint 'pszuVk6iPdJ2boQq' \
    --openidResponseNonce 'CCyJfThvCJieqRSG' \
    --openidReturnTo 'N8Mm74HlSZzp4aEW' \
    --openidSig '4GkHG5OIVuGv47XJ' \
    --openidSigned 'pkMiopQrVL3ZZTVx' \
    --state 'qa9XM2gY14iWk12J' \
    > test.out 2>&1
eval_tap $? 276 'PlatformAuthenticationV3' test.out

#- 277 PlatformTokenRefreshV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenRefreshV3 \
    --platformId 'ffk8dwKNPUOHNZxM' \
    --platformToken 'L3yoBM9qxd6PWz7s' \
    > test.out 2>&1
eval_tap $? 277 'PlatformTokenRefreshV3' test.out

#- 278 PublicGetInputValidations
eval_tap 0 278 'PublicGetInputValidations # SKIP deprecated' test.out

#- 279 PublicGetInputValidationByField
eval_tap 0 279 'PublicGetInputValidationByField # SKIP deprecated' test.out

#- 280 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'VnMxge2inL8fBFP1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 280 'PublicGetCountryAgeRestrictionV3' test.out

#- 281 PublicGetConfigValueV3
./ng net.accelbyte.sdk.cli.Main iam publicGetConfigValueV3 \
    --configKey 'ABaIKrEt8d3o7cTS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 281 'PublicGetConfigValueV3' test.out

#- 282 PublicGetCountryListV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryListV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 282 'PublicGetCountryListV3' test.out

#- 283 PublicGetNamespaceScopedInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetNamespaceScopedInputValidations \
    --namespace "$AB_NAMESPACE" \
    --defaultOnEmpty  \
    --languageCode '9OIIMErnNTLXHrsO' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetNamespaceScopedInputValidations' test.out

#- 284 PublicGetNamespaceScopedInputValidationByField
./ng net.accelbyte.sdk.cli.Main iam publicGetNamespaceScopedInputValidationByField \
    --field 'FsbhRow4iaYKy0Ij' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'PublicGetNamespaceScopedInputValidationByField' test.out

#- 285 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 285 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 286 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'sDgbJ37DN2lDvdh7' \
    > test.out 2>&1
eval_tap $? 286 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 287 PublicListUserIDByPlatformUserIDsV3
eval_tap 0 287 'PublicListUserIDByPlatformUserIDsV3 # SKIP deprecated' test.out

#- 288 PublicGetUserByPlatformUserIDV3
eval_tap 0 288 'PublicGetUserByPlatformUserIDV3 # SKIP deprecated' test.out

#- 289 PublicGetProfileUpdateStrategyV3
./ng net.accelbyte.sdk.cli.Main iam publicGetProfileUpdateStrategyV3 \
    --namespace "$AB_NAMESPACE" \
    --field 'display_name' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetProfileUpdateStrategyV3' test.out

#- 290 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'fVQPWX1NPO5Wn7rN' \
    > test.out 2>&1
eval_tap $? 290 'PublicGetAsyncStatus' test.out

#- 291 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'G8rGp7Fadvo5EzpX' \
    --limit '43' \
    --offset '71' \
    --platformBy 'R1mx6K17GL1CrO4Z' \
    --platformId 'uoGZSxTzm8oMSPIH' \
    --query 'PtqzIWIzg8pbjnt1' \
    > test.out 2>&1
eval_tap $? 291 'PublicSearchUserV3' test.out

#- 292 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "iBV8DpbjGts4UZDT", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "PGC9RhzMC7V8BEph", "policyId": "nRXnSpCzyb8FkoxQ", "policyVersionId": "brPngi87K58pQswq"}, {"isAccepted": true, "localizedPolicyVersionId": "wFCnqpvNesGiVnt9", "policyId": "p2to7Yja1soDE1K0", "policyVersionId": "SvGrMYwPmPXC2LfL"}, {"isAccepted": true, "localizedPolicyVersionId": "m5rP2A20t6foPPH9", "policyId": "4SUinY5diUlqgvY7", "policyVersionId": "dPPyahppgxJhk4Ed"}], "authType": "TZ000rS92594HLvW", "code": "FsXHtMP0k9L5dREQ", "country": "bCqfh0gpABFBER6W", "dateOfBirth": "NcDOsRzBkf9A6HjC", "displayName": "nFRdSihcvszzQLZB", "emailAddress": "ktk0siMup01kyaFw", "password": "wD7wecuQb4GNQHVZ", "reachMinimumAge": true, "uniqueDisplayName": "KGBnzh4suaGIzttT"}' \
    > test.out 2>&1
eval_tap $? 292 'PublicCreateUserV3' test.out

#- 293 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'ncVBf5g3oeuHiNyL' \
    --query 'kfPQPmjUkvSs5YmI' \
    > test.out 2>&1
eval_tap $? 293 'CheckUserAvailability' test.out

#- 294 PublicBulkGetUsers
eval_tap 0 294 'PublicBulkGetUsers # SKIP deprecated' test.out

#- 295 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "ejozmG5HlrIfMAvv", "languageTag": "pkAHRJHZyfrXZmiJ"}' \
    > test.out 2>&1
eval_tap $? 295 'PublicSendRegistrationCode' test.out

#- 296 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "X4CjKCeIRIr997KK", "emailAddress": "pJXTLbYWpqeXjaf1"}' \
    > test.out 2>&1
eval_tap $? 296 'PublicVerifyRegistrationCode' test.out

#- 297 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "f5fjNMZjKJ05puX3", "languageTag": "197WrMnJtovSMFw8"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicForgotPasswordV3' test.out

#- 298 PublicValidateUserInput
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserInput \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "X4zxbdfXgunt1oMN", "password": "Z68eovHSH3xV3URI", "uniqueDisplayName": "RVDYBd6hMB0l7sg7", "username": "IfMH5Tu1ky1ZYvye"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicValidateUserInput' test.out

#- 299 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'HmfoFkUDP864shbn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 299 'GetAdminInvitationV3' test.out

#- 300 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'Q3bVvuvpsDJXPCWk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "X4Kpi8CJ88aMPGFF", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "RWvLRy58UKWPv3F7", "policyId": "S0wCVlYQi9cfMCeN", "policyVersionId": "nu6OIG1PPLRDEXLX"}, {"isAccepted": true, "localizedPolicyVersionId": "30HNBYZSrz7pMjES", "policyId": "LLMPKDXLki6Oz5By", "policyVersionId": "gt8Q0RjSf1srB7hG"}, {"isAccepted": true, "localizedPolicyVersionId": "UFqTooGGnPEgY0t7", "policyId": "QQWl42byOwXgKyPh", "policyVersionId": "Xmcysae8HpWH4xiz"}], "authType": "3fWthJSu2pUIIuPL", "code": "FAtcWhjAP57QbWvS", "country": "Sp71zEPPfmAQiqRR", "dateOfBirth": "C2caquMRtQOILcaD", "displayName": "qUITBHQR5ISNoFR3", "emailAddress": "GUxdMuvmL0UBfwza", "password": "aeP3Wd0Wrb8s3GW0", "reachMinimumAge": true, "uniqueDisplayName": "CA5tfK5ushaKTPVj"}' \
    > test.out 2>&1
eval_tap $? 300 'CreateUserFromInvitationV3' test.out

#- 301 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "yOUpR3uUdgNlyU4I", "country": "JnqtrjCOsE8Vjvzh", "dateOfBirth": "JwNX4bhqCjlwrmsS", "displayName": "RV86iic1FIMyF7Cc", "languageTag": "Nu2DYn6E9Gk51kOT", "uniqueDisplayName": "JZluTekDMCGUJvER", "userName": "xNg8djSb4Vt2vKQ5"}' \
    > test.out 2>&1
eval_tap $? 301 'UpdateUserV3' test.out

#- 302 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "vlCdI519Pf2iogwx", "country": "M5DZM0dgozmco417", "dateOfBirth": "50xdYQg34WUV0Wpm", "displayName": "sQnp1n4YGumTKOlD", "languageTag": "Oy5vhSkxERZ2AQ1j", "uniqueDisplayName": "vXYBar5RMmmGdWl0", "userName": "wpj5tVfKU3D8WVPh"}' \
    > test.out 2>&1
eval_tap $? 302 'PublicPartialUpdateUserV3' test.out

#- 303 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "0Z7YiGE2cyzTMBY7", "emailAddress": "Xd0OoENg2Lw7uepm", "languageTag": "ahXojVZYz2zMU9jL", "upgradeToken": "zNV3GaG43R6nlRPr"}' \
    > test.out 2>&1
eval_tap $? 303 'PublicSendVerificationCodeV3' test.out

#- 304 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "EAYqRBeSc5uShoj3", "contactType": "dGHMeoi5DBOsQ0Ga", "languageTag": "x0iX05IT9Agsjl5N", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 304 'PublicUserVerificationV3' test.out

#- 305 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "NkJFQxuMHnfOlX6H", "country": "YVEiaereFCPJU2wE", "dateOfBirth": "zUYUTmZ8JSMeNmRo", "displayName": "cp400RZe8Bzx9aGE", "emailAddress": "I22BTCZs97TJI8GP", "password": "rM24F3celFgM62HQ", "uniqueDisplayName": "tgzQhO3nR8j8DlP6", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 305 'PublicUpgradeHeadlessAccountV3' test.out

#- 306 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "bn8vmfMYGLt1AjKh", "password": "h3JMX7xSrz1EH6X2"}' \
    > test.out 2>&1
eval_tap $? 306 'PublicVerifyHeadlessAccountV3' test.out

#- 307 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "SM3xzsNrJzWBcdFl", "mfaToken": "o7oAsOlfLB1J19b5", "newPassword": "rTfiL2P3r1a8KIJH", "oldPassword": "33aKkPuWD59MgTy1"}' \
    > test.out 2>&1
eval_tap $? 307 'PublicUpdatePasswordV3' test.out

#- 308 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'HA58Jt5NaROjSKFE' \
    > test.out 2>&1
eval_tap $? 308 'PublicCreateJusticeUser' test.out

#- 309 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'uZo2ElXYSS4ezBRS' \
    --redirectUri 'iOyReviDaxlPdhwm' \
    --ticket 'cH03yoMxzRR6xd9r' \
    > test.out 2>&1
eval_tap $? 309 'PublicPlatformLinkV3' test.out

#- 310 PublicPlatformUnlinkV3
eval_tap 0 310 'PublicPlatformUnlinkV3 # SKIP deprecated' test.out

#- 311 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Th3ureaIbxM3Wev9' \
    > test.out 2>&1
eval_tap $? 311 'PublicPlatformUnlinkAllV3' test.out

#- 312 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pZQjWAN0tny16ZHZ' \
    --ticket 'tuSJGQCrM7JEMRPk' \
    > test.out 2>&1
eval_tap $? 312 'PublicForcePlatformLinkV3' test.out

#- 313 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dTcAzkIlndN5xeay' \
    --clientId 'r3vUKMuIiz2MiAAK' \
    --redirectUri 'cvAXnxnH0QIhoJRY' \
    > test.out 2>&1
eval_tap $? 313 'PublicWebLinkPlatform' test.out

#- 314 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId '807VmBT4wZXQZZrS' \
    --code 'suYiIPei0pXglJYn' \
    --state 'KkoCAZuolAWnxkIm' \
    > test.out 2>&1
eval_tap $? 314 'PublicWebLinkPlatformEstablish' test.out

#- 315 PublicProcessWebLinkPlatformV3
./ng net.accelbyte.sdk.cli.Main iam publicProcessWebLinkPlatformV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VbDP0QX31gI7VmnG' \
    --code 'IRMvXe6BiphIFe2b' \
    --state 'zr6qQw6fSESkM19O' \
    > test.out 2>&1
eval_tap $? 315 'PublicProcessWebLinkPlatformV3' test.out

#- 316 PublicWebReauthPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebReauthPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PMBb12gpmShlmIt2' \
    --clientId 'nfhUaZGqjslu59GT' \
    --redirectUri '2E6AacmZRXZm626P' \
    --operation 'GDPR' \
    > test.out 2>&1
eval_tap $? 316 'PublicWebReauthPlatform' test.out

#- 317 PublicWebReauthPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebReauthPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XWVj3KP1mX0iYHXB' \
    --code 'U3Uk2tQm307IORTy' \
    --state 'HnLYDAAg1YA4kZUR' \
    > test.out 2>&1
eval_tap $? 317 'PublicWebReauthPlatformEstablish' test.out

#- 318 PublicWebReauthPlatformProcess
./ng net.accelbyte.sdk.cli.Main iam publicWebReauthPlatformProcess \
    --namespace "$AB_NAMESPACE" \
    --platformId 'moGgxVRMPf8g1rbh' \
    --code 'fIMStMnSqrKWYOuI' \
    --state 'TlYS2RYaD9WNKGhb' \
    > test.out 2>&1
eval_tap $? 318 'PublicWebReauthPlatformProcess' test.out

#- 319 PublicGetUsersPlatformInfosV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUsersPlatformInfosV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformId": "Lhjz1v0RBIO2rkJG", "userIds": ["mPaK6HEVIQJd3930", "TGewjRyfo4nWVZZb", "KFsKOmgEhjH2wFzC"]}' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetUsersPlatformInfosV3' test.out

#- 320 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "pxxJLfAg5cFT0gHA", "code": "kltcR3eHFbiAluHv", "emailAddress": "7Hssd05pHBJX5ln8", "languageTag": "PZbYVD8RiaTsdD4d", "newPassword": "3kSbTkHPMUvOAUXk"}' \
    > test.out 2>&1
eval_tap $? 320 'ResetPasswordV3' test.out

#- 321 PublicGetUserByUserIdV3
eval_tap 0 321 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 322 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'w36cr2WJQqS7Tq4Y' \
    --activeOnly  \
    --limit '72' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 322 'PublicGetUserBanHistoryV3' test.out

#- 323 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yCSXBqJqjAbVwSao' \
    > test.out 2>&1
eval_tap $? 323 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 324 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'j1ugjr8mPkr3tZ50' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetUserInformationV3' test.out

#- 325 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6ERSVy5M3rrkxu0U' \
    --after '0.9849415378792176' \
    --before '0.12746709943237644' \
    --limit '3' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetUserLoginHistoriesV3' test.out

#- 326 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gCNVZxHGxhZqNXJ6' \
    --after 'JXSh0Z3SWISs1dYr' \
    --before 'JKmx1BT6iLFQejNZ' \
    --limit '72' \
    --platformId 'WeMEeL0EJG67g4W1' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetUserPlatformAccountsV3' test.out

#- 327 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eAmDxP23qstMuikK' \
    > test.out 2>&1
eval_tap $? 327 'PublicListJusticePlatformAccountsV3' test.out

#- 328 PublicLinkPlatformAccount
eval_tap 0 328 'PublicLinkPlatformAccount # SKIP deprecated' test.out

#- 329 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'c6VNU8570siWm3V9' \
    --body '{"chosenNamespaces": ["sirE0JOQxWeHypqC", "WMDPRI2cCk8zHR8V", "yCC0EQwE0cXokXbw"], "requestId": "KDtVmrYQu7hZvHfi"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicForceLinkPlatformWithProgression' test.out

#- 330 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'T9s9pK8HuUY1QQHQ' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetPublisherUserV3' test.out

#- 331 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0NCEddJtx6GV01vD' \
    --password '7lNLxlpvqaB9P9Ga' \
    > test.out 2>&1
eval_tap $? 331 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 332 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'ukfCEIeSBLhTfzig' \
    --before 'zHcRuJgYaj4I8Dzy' \
    --isWildcard  \
    --limit '14' \
    > test.out 2>&1
eval_tap $? 332 'PublicGetRolesV3' test.out

#- 333 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'TsJeRcE7GuwKn63K' \
    > test.out 2>&1
eval_tap $? 333 'PublicGetRoleV3' test.out

#- 334 PublicForgotPasswordWithoutNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordWithoutNamespaceV3 \
    --body '{"clientId": "IDTkUCqbbHGJGOTv", "emailAddress": "KKRTHDntaFiufH2Y", "languageTag": "R6QU7fj6w17arNs1"}' \
    > test.out 2>&1
eval_tap $? 334 'PublicForgotPasswordWithoutNamespaceV3' test.out

#- 335 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    --includeAllPlatforms  \
    > test.out 2>&1
eval_tap $? 335 'PublicGetMyUserV3' test.out

#- 336 PublicSendCodeForwardV3
./ng net.accelbyte.sdk.cli.Main iam publicSendCodeForwardV3 \
    --body '{"context": "2hOoLVM7UFnuJDze", "emailAddress": "EkDxaVogxHrOon2O", "languageTag": "W4Zw5QwVKWNy2tnF", "upgradeToken": "2MifJR4hr4gdJDuj"}' \
    > test.out 2>&1
eval_tap $? 336 'PublicSendCodeForwardV3' test.out

#- 337 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'YnVnFK6gB6ZxC6yY' \
    > test.out 2>&1
eval_tap $? 337 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 338 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["UVUJYnQ3jOGmROIq", "xqQ0gcNeTflyvUh3", "w5ZtfwmOCKpFSMF0"], "oneTimeLinkCode": "tfGIZCTNiIRc9fEj"}' \
    > test.out 2>&1
eval_tap $? 338 'LinkHeadlessAccountToMyAccountV3' test.out

#- 339 PublicGetMyRedirectionAfterLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode 'kZhEpAJMCxMp2J0h' \
    > test.out 2>&1
eval_tap $? 339 'PublicGetMyRedirectionAfterLinkV3' test.out

#- 340 PublicGetMyProfileAllowUpdateStatusV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyProfileAllowUpdateStatusV3 \
    > test.out 2>&1
eval_tap $? 340 'PublicGetMyProfileAllowUpdateStatusV3' test.out

#- 341 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "Dg2kMgkvhoQe9gD9"}' \
    > test.out 2>&1
eval_tap $? 341 'PublicSendVerificationLinkV3' test.out

#- 342 PublicGetOpenidUserInfoV3
./ng net.accelbyte.sdk.cli.Main iam publicGetOpenidUserInfoV3 \
    > test.out 2>&1
eval_tap $? 342 'PublicGetOpenidUserInfoV3' test.out

#- 343 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'tGN0nE7M36mI9u3E' \
    > test.out 2>&1
eval_tap $? 343 'PublicVerifyUserByLinkV3' test.out

#- 344 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'eZtLQij2JXsqdXfh' \
    --code 'ZTTaCeqGv7meuQhJ' \
    --error 'uq1C6JHkWMSUbqBy' \
    --state 'WN2BCnRz9w2nur0B' \
    > test.out 2>&1
eval_tap $? 344 'PlatformAuthenticateSAMLV3Handler' test.out

#- 345 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId '9jKaunAcylsau7wR' \
    --payload 'QmL4i3eRyIECEDa1' \
    > test.out 2>&1
eval_tap $? 345 'LoginSSOClient' test.out

#- 346 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'I4lwXqwPfq3VzHQj' \
    > test.out 2>&1
eval_tap $? 346 'LogoutSSOClient' test.out

#- 347 RequestTargetTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV3 \
    --additionalData 'tolx64w1gyvjacKt' \
    --code 'GqxMnoAXRlcq0mYW' \
    > test.out 2>&1
eval_tap $? 347 'RequestTargetTokenResponseV3' test.out

#- 348 UpgradeAndAuthenticateForwardV3
./ng net.accelbyte.sdk.cli.Main iam upgradeAndAuthenticateForwardV3 \
    --clientId 'KQYlqMmu2pvF6rP0' \
    --upgradeSuccessToken '3bQaq1cT88H6RCW8' \
    > test.out 2>&1
eval_tap $? 348 'UpgradeAndAuthenticateForwardV3' test.out

#- 349 AdminListInvitationHistoriesV4
./ng net.accelbyte.sdk.cli.Main iam adminListInvitationHistoriesV4 \
    --limit '14' \
    --namespace "$AB_NAMESPACE" \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 349 'AdminListInvitationHistoriesV4' test.out

#- 350 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JmGzDlqxtLsR2AGO' \
    > test.out 2>&1
eval_tap $? 350 'AdminGetDevicesByUserV4' test.out

#- 351 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'iPhNt2IdH8aYYUT6' \
    --endDate 'mma833TDzk66ix88' \
    --limit '37' \
    --offset '24' \
    --startDate 'AUrXr7MXxCvyy7ca' \
    > test.out 2>&1
eval_tap $? 351 'AdminGetBannedDevicesV4' test.out

#- 352 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xz4MQrODLNlxiEjQ' \
    > test.out 2>&1
eval_tap $? 352 'AdminGetUserDeviceBansV4' test.out

#- 353 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "BCZx9DJ4V97SJLlr", "deviceId": "wXmIGamRCARuFLx4", "deviceType": "rV4CXVMrDYKe2eTf", "enabled": false, "endDate": "Ty6Ch5QYyFjuBquE", "ext": {"7xssm4hxczskbSUb": {}, "OZ9WNl3apJmNAbl1": {}, "g5ZmTTGYRbP4QVey": {}}, "reason": "9pEz1TV5cUtPBsw0"}' \
    > test.out 2>&1
eval_tap $? 353 'AdminBanDeviceV4' test.out

#- 354 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId '1i5Mf7WvbNSeeDNf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 354 'AdminGetDeviceBanV4' test.out

#- 355 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'UESLlwHv3JgteOLy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 355 'AdminUpdateDeviceBanV4' test.out

#- 356 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'p8a1VqxXnRhDd9TG' \
    --startDate 'kO6aIYqftw1SrM2n' \
    --deviceType 'hSEanfUYrMU6A43U' \
    > test.out 2>&1
eval_tap $? 356 'AdminGenerateReportV4' test.out

#- 357 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 357 'AdminGetDeviceTypesV4' test.out

#- 358 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'KGpvC1cr5T1PSXhd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 358 'AdminGetDeviceBansV4' test.out

#- 359 AdminDecryptDeviceV4
eval_tap 0 359 'AdminDecryptDeviceV4 # SKIP deprecated' test.out

#- 360 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'uTWchzXDv3TAtBjP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 360 'AdminUnbanDeviceV4' test.out

#- 361 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId '4HSuiYCbG0UyYUJm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 361 'AdminGetUsersByDeviceV4' test.out

#- 362 AdminGetNamespaceInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 362 'AdminGetNamespaceInvitationHistoryV4' test.out

#- 363 AdminGetNamespaceUserInvitationHistoryV4
./ng net.accelbyte.sdk.cli.Main iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 363 'AdminGetNamespaceUserInvitationHistoryV4' test.out

#- 364 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "p6AbdtU0CDrlQpKB", "policyId": "8qoel2QK3aSOYdmM", "policyVersionId": "Dikc3Fjm9HoQDemt"}, {"isAccepted": false, "localizedPolicyVersionId": "MwNwDlYSli3p8YaA", "policyId": "del3hHMSLAiscGRW", "policyVersionId": "zkCl1ZKuPxjDUGRG"}, {"isAccepted": false, "localizedPolicyVersionId": "LQo6tHj4z4cAM4LM", "policyId": "JfWNZIxAgBpeubpr", "policyVersionId": "KX68jTyRd3LrR1x6"}], "count": 95, "userInfo": {"country": "C9FnxqBlPBYJ7X6u"}}' \
    > test.out 2>&1
eval_tap $? 364 'AdminCreateTestUsersV4' test.out

#- 365 AdminCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "j90jmLTt5YQGawco", "policyId": "mPoiYoQ1f1AYq306", "policyVersionId": "Pysv4VPaZWolXypw"}, {"isAccepted": true, "localizedPolicyVersionId": "9YsPeDWrAVQZSvgW", "policyId": "uCuLsUGrVQAbhS54", "policyVersionId": "ZuQHKersDmJLUHAK"}, {"isAccepted": true, "localizedPolicyVersionId": "gki9fbdvUMDZeO4U", "policyId": "55wdCpVpnENiTc9N", "policyVersionId": "ESV22eRBElD4K2Cy"}], "authType": "EMAILPASSWD", "code": "UYgSV40OvY7apPCr", "country": "N5bEhmuHgKeWizEp", "dateOfBirth": "w1zN0mOYgGhHMz9d", "displayName": "ddLWJWDuSYtCaIv4", "emailAddress": "Lp91wYUJPbvzn8TY", "password": "oMDAaUXSuBQdvdhJ", "passwordMD5Sum": "oT0WK5ngNUxDKfZY", "reachMinimumAge": false, "uniqueDisplayName": "4fQKDZX6plErw0Gb", "username": "0ceCbphW4YMhJ0S5"}' \
    > test.out 2>&1
eval_tap $? 365 'AdminCreateUserV4' test.out

#- 366 AdminBulkUpdateUserAccountTypeV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkUpdateUserAccountTypeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"testAccount": false, "userIds": ["S48Hxu8Ju4XSAnlX", "RYB9BgSZBvkehRn8", "3B0nrW1qx3NJTugV"]}' \
    > test.out 2>&1
eval_tap $? 366 'AdminBulkUpdateUserAccountTypeV4' test.out

#- 367 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["WXz8dv7BiEUqnzxs", "2deMF8UAJIHEZv5z", "yUUyNJkvA5xF3zHt"]}' \
    > test.out 2>&1
eval_tap $? 367 'AdminBulkCheckValidUserIDV4' test.out

#- 368 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZSd3QzXhkrN4pWry' \
    --body '{"avatarUrl": "t4XTNwpp0ni1YfIg", "country": "LZ4YIzElrLZOBLHC", "dateOfBirth": "KmLBaIwlokbAFW8R", "displayName": "gBUwBL28BqM8UzvK", "languageTag": "qeoTiNKGRUMrimGA", "skipLoginQueue": true, "tags": ["iOAh1SpLhMF2Pav1", "1FuU8iXCRz8Kgqgw", "ijYxpGhsFArq6lol"], "uniqueDisplayName": "bj7QKvtVRCPMjr5M", "userName": "3vw1GqUjjFp6R8mY"}' \
    > test.out 2>&1
eval_tap $? 368 'AdminUpdateUserV4' test.out

#- 369 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZwKftVqSECsypS42' \
    --body '{"code": "NmYQ8HlHbHnfs4tL", "emailAddress": "VOYQCWMktmiKd9vL"}' \
    > test.out 2>&1
eval_tap $? 369 'AdminUpdateUserEmailAddressV4' test.out

#- 370 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PP0w52JRAZxMWdol' \
    --body '{"factor": "eYNHXeOpaRDwYLge", "mfaToken": "851PbK2MFKvw5TWj"}' \
    > test.out 2>&1
eval_tap $? 370 'AdminDisableUserMFAV4' test.out

#- 371 AdminGetUserMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ah4gy41LLzQ2IjY5' \
    > test.out 2>&1
eval_tap $? 371 'AdminGetUserMFAStatusV4' test.out

#- 372 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PeNr4JmYxH2qs28h' \
    > test.out 2>&1
eval_tap $? 372 'AdminListUserRolesV4' test.out

#- 373 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ePJjMp0TKKUBfPNI' \
    --body '{"assignedNamespaces": ["9f2oLWDPSZexfKVx", "qdxmh5QWxuQuI7gd", "DTDb3WdnOpzTrRzC"], "roleId": "CafADJfWBspT3MLw"}' \
    > test.out 2>&1
eval_tap $? 373 'AdminUpdateUserRoleV4' test.out

#- 374 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JZquMQSPp5XD4S1i' \
    --body '{"assignedNamespaces": ["lfgff7Et4uY8nlBw", "GNHgfgwZwVMvshGm", "sg6ZJYnkHDnHTlRu"], "roleId": "gM7a2UZgeesipbP0"}' \
    > test.out 2>&1
eval_tap $? 374 'AdminAddUserRoleV4' test.out

#- 375 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '27okM5E8tAajVSvL' \
    --body '{"assignedNamespaces": ["Rj306RDuaSixXEdl", "oYZBkatNLc42eq0O", "6VsXtOlQwj5xPvm7"], "roleId": "c5nPR0Y1sffUaZ64"}' \
    > test.out 2>&1
eval_tap $? 375 'AdminRemoveUserRoleV4' test.out

#- 376 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '8' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 376 'AdminGetRolesV4' test.out

#- 377 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "tfuqJHrs4e3RnWR3"}' \
    > test.out 2>&1
eval_tap $? 377 'AdminCreateRoleV4' test.out

#- 378 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId '0MdBZezfwc3H0qSb' \
    > test.out 2>&1
eval_tap $? 378 'AdminGetRoleV4' test.out

#- 379 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'Mq4GLj8aGsH0qE5p' \
    > test.out 2>&1
eval_tap $? 379 'AdminDeleteRoleV4' test.out

#- 380 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId '601ak59yFSfdZIv8' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "QMooiKT57rmbjEni"}' \
    > test.out 2>&1
eval_tap $? 380 'AdminUpdateRoleV4' test.out

#- 381 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'meR7EFBz43E9FkOP' \
    --body '{"permissions": [{"action": 98, "resource": "FqvfDG5jvMOaXrDl", "schedAction": 63, "schedCron": "bBd5wb5H3qppoCiH", "schedRange": ["MD4iBK2O7qYtOHV5", "hnpjc5CNLnnEvo25", "aEtdjls5oadseJg7"]}, {"action": 50, "resource": "t0snbE0yMvqF7TJ9", "schedAction": 42, "schedCron": "mdvhMXxiKR29LKIh", "schedRange": ["NU43K8bihdw3prp0", "UHlWUxkBefhxRtrq", "bv56oqwnCLVc2qHZ"]}, {"action": 41, "resource": "GG6SHcZbX2wNnT6A", "schedAction": 53, "schedCron": "oqNLmPAUIMwa2wYq", "schedRange": ["6DsUq38bYvaWLoKz", "HnngdfFnOfY9stXH", "6LYXXMndxBPKmHVB"]}]}' \
    > test.out 2>&1
eval_tap $? 381 'AdminUpdateRolePermissionsV4' test.out

#- 382 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId '7cNzHhvxc4xAPZ86' \
    --body '{"permissions": [{"action": 99, "resource": "KUYMimVLzAP6aOzs", "schedAction": 93, "schedCron": "gb5HPsBU0Eo6QJ9v", "schedRange": ["BRJ4UP09fabC01Th", "m9f4AWpyiKVT3OvE", "ujx5yjtQSCJaOHzp"]}, {"action": 3, "resource": "jw99HxCjXWcaXBcf", "schedAction": 63, "schedCron": "XeV7BXefsSgZxSYn", "schedRange": ["VwXqF6K0WA76Kl2m", "HHoz6qBQnEDgX49n", "1xTDFcmOm1sqdIWU"]}, {"action": 83, "resource": "ERylESgf5dXMrPoY", "schedAction": 90, "schedCron": "Memsp7o3F2LQw7Y2", "schedRange": ["VdSxgXez7VvS0C9J", "LVQQPa7PPx4Zi6Wa", "C8wk7HMbJhNwZgf5"]}]}' \
    > test.out 2>&1
eval_tap $? 382 'AdminAddRolePermissionsV4' test.out

#- 383 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'nlMDORYuXnPNJgay' \
    --body '["PFcyUnKXA3mcyMmX", "6WF8jtNAVOYqSH53", "3YlJ93CCGBXv4fP4"]' \
    > test.out 2>&1
eval_tap $? 383 'AdminDeleteRolePermissionsV4' test.out

#- 384 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'VPzhcH4UJrrCKvrO' \
    --after 'Ai7lMgkVWJYzSCID' \
    --before 'xWUxgOzeRNHIqK5P' \
    --limit '94' \
    > test.out 2>&1
eval_tap $? 384 'AdminListAssignedUsersV4' test.out

#- 385 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'vkOsR1fHUyirMVMO' \
    --body '{"assignedNamespaces": ["FES2J2OzNlJE3uqZ", "z574g31cA0PwZxTI", "ZVSGQyTzhs9Asy4d"], "namespace": "629N4YnolVWA2dWx", "userId": "Bs056jkPCUuE1pgd"}' \
    > test.out 2>&1
eval_tap $? 385 'AdminAssignUserToRoleV4' test.out

#- 386 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'HvlQKiR7SDQUDavO' \
    --body '{"namespace": "lKT5EIHNhJQq94Re", "userId": "5IM1akNKz9IltQUk"}' \
    > test.out 2>&1
eval_tap $? 386 'AdminRevokeUserFromRoleV4' test.out

#- 387 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["u3n32atB0QPQPEp5", "UtwUWGt6tooHP5kA", "ww01zalTddhAQ1pw"], "emailAddresses": ["qnybvUIfuulmeegR", "wPPbn7lttd21cS6I", "VE4fzwG3BHaRcZ8N"], "isAdmin": true, "isNewStudio": false, "languageTag": "3rOW0guPoQbYzc1R", "namespace": "DVhs2lhdzxxgibuq", "roleId": "UuyW3cMz9YyduMom"}' \
    > test.out 2>&1
eval_tap $? 387 'AdminInviteUserNewV4' test.out

#- 388 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "EHcU15St4v8ry8Iy", "country": "qNVv0KVpXJTMx3Y8", "dateOfBirth": "Um1iqehObg3OZ9j0", "displayName": "HDtbqMFlgHKQIRtL", "languageTag": "fPngD83roOeqE7fc", "skipLoginQueue": true, "tags": ["RGoUtmbWZbEjPyq3", "5BWDoc3qNcQFFyHv", "141NPqjRUMKSQjFd"], "uniqueDisplayName": "jqTaZFsWzbqwTZQI", "userName": "N5jC6a8mEVCXHmFn"}' \
    > test.out 2>&1
eval_tap $? 388 'AdminUpdateMyUserV4' test.out

#- 389 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    --body '{"factor": "rSL0PJcZQaCeNLYx", "mfaToken": "MID9pqZ5rryiMMt6"}' \
    > test.out 2>&1
eval_tap $? 389 'AdminDisableMyAuthenticatorV4' test.out

#- 390 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'fQtLhzylaquioT3Q' \
    > test.out 2>&1
eval_tap $? 390 'AdminEnableMyAuthenticatorV4' test.out

#- 391 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 391 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 392 AdminGetMyBackupCodesV4
eval_tap 0 392 'AdminGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 393 AdminGenerateMyBackupCodesV4
eval_tap 0 393 'AdminGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 394 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    --body '{"factor": "Bt29AiRASsuFM4ah", "mfaToken": "Gw7XcF1Qwzz606UG"}' \
    > test.out 2>&1
eval_tap $? 394 'AdminDisableMyBackupCodesV4' test.out

#- 395 AdminDownloadMyBackupCodesV4
eval_tap 0 395 'AdminDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 396 AdminEnableMyBackupCodesV4
eval_tap 0 396 'AdminEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 397 AdminGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBackupCodesV4 \
    --languageTag 'XPhoNZlXMef7AvS3' \
    > test.out 2>&1
eval_tap $? 397 'AdminGetBackupCodesV4' test.out

#- 398 AdminGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateBackupCodesV4 \
    --languageTag 'TfKx6ByTygbtOtcQ' \
    > test.out 2>&1
eval_tap $? 398 'AdminGenerateBackupCodesV4' test.out

#- 399 AdminEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableBackupCodesV4 \
    --languageTag 'S4Cmgw1wRUnIVYxY' \
    > test.out 2>&1
eval_tap $? 399 'AdminEnableBackupCodesV4' test.out

#- 400 AdminChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminChallengeMyMFAV4 \
    --code '6OhdkrYiCinoVOzo' \
    --factor '4Plv1IlTpEhjTFYd' \
    > test.out 2>&1
eval_tap $? 400 'AdminChallengeMyMFAV4' test.out

#- 401 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    --action 'zsUNvQAn2LuMjLqw' \
    --languageTag 'mVz3zKsfjz1mFkyx' \
    > test.out 2>&1
eval_tap $? 401 'AdminSendMyMFAEmailCodeV4' test.out

#- 402 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    --body '{"factor": "oUzfMFoXCOguSq2A", "mfaToken": "4R3wDdSkNfHJtA3Q"}' \
    > test.out 2>&1
eval_tap $? 402 'AdminDisableMyEmailV4' test.out

#- 403 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'iX9ZvtydbaVb0scd' \
    > test.out 2>&1
eval_tap $? 403 'AdminEnableMyEmailV4' test.out

#- 404 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 404 'AdminGetMyEnabledFactorsV4' test.out

#- 405 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor '97A0GP6djn2Ps3IV' \
    > test.out 2>&1
eval_tap $? 405 'AdminMakeFactorMyDefaultV4' test.out

#- 406 AdminGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyOwnMFAStatusV4 \
    > test.out 2>&1
eval_tap $? 406 'AdminGetMyOwnMFAStatusV4' test.out

#- 407 AdminGetMyMFAStatusV4
eval_tap 0 407 'AdminGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 408 AdminInviteUserV4
eval_tap 0 408 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 409 AuthenticationWithPlatformLinkV4
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV4 \
    --extendExp  \
    --clientId 'T5hUZ3cnDq0ddZG0' \
    --linkingToken 'EpfGAqHKcSxUc2Yg' \
    --password 'Rpk2IFGIgIpscUpV' \
    --username 'Aciu2XPPUxzXHUvx' \
    > test.out 2>&1
eval_tap $? 409 'AuthenticationWithPlatformLinkV4' test.out

#- 410 GenerateTokenByNewHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV4 \
    --additionalData 'hvTZcvRKoaM4ozSA' \
    --extendExp  \
    --linkingToken 'g8FTLrByWOJhboco' \
    > test.out 2>&1
eval_tap $? 410 'GenerateTokenByNewHeadlessAccountV4' test.out

#- 411 Verify2faCodeV4
./ng net.accelbyte.sdk.cli.Main iam verify2faCodeV4 \
    --code 'GlPzdfxcC3rpWhSp' \
    --factor 'q0InxMLpP7n7M3JX' \
    --mfaToken 'jEvsj5WcQ99M1yuX' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 411 'Verify2faCodeV4' test.out

#- 412 PlatformTokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV4 \
    --platformId 'eqV31LX2ehcMnM6Q' \
    --codeChallenge 'tjzQjDlUMCGnxZwa' \
    --codeChallengeMethod 'S256' \
    --additionalData '4XDokltgq2vXtUnY' \
    --clientId '6UhDJ4pe0s0Cuhl3' \
    --createHeadless  \
    --deviceId 'dU9b4seYCyiB4tDC' \
    --macAddress 'Wx3cEX8wTi1v2abp' \
    --platformToken 'CWytPEi9Ze0hL9rP' \
    --serviceLabel '0.17233394543475455' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 412 'PlatformTokenGrantV4' test.out

#- 413 SimultaneousLoginV4
./ng net.accelbyte.sdk.cli.Main iam simultaneousLoginV4 \
    --codeChallenge 'V5GkSrcl2O47XVzU' \
    --codeChallengeMethod 'plain' \
    --simultaneousPlatform 'qlNVk7qnmBS3XKDh' \
    --simultaneousTicket 'p1OkMcErmeH0lX1h' \
    --nativePlatform 'epicgames' \
    --nativePlatformTicket '3XgTRTjI9oNBzgQ4' \
    > test.out 2>&1
eval_tap $? 413 'SimultaneousLoginV4' test.out

#- 414 TokenGrantV4
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV4 \
    --codeChallenge 'CRwg0sKVeSpMny0G' \
    --codeChallengeMethod 'plain' \
    --additionalData 'JjDyMDKQhuTjtQZy' \
    --clientId 'IiAmCL8bNTTfqLCv' \
    --clientSecret '9DYBOProN4UWbQaK' \
    --code 'FrTv4JWElmOCxqPr' \
    --codeVerifier 'q9I3XJWBxTLcOef8' \
    --extendNamespace 'MgIwkrKFEtwESJCe' \
    --extendExp  \
    --loginQueueTicket '2ksG3nZE13H2fILF' \
    --password 'zOlAZbDQAEJLbVWH' \
    --redirectUri '2XLIg3MgmdSvWp3h' \
    --refreshToken '0xPsVY8qNwB2TY4v' \
    --scope '9NNfQSYLFKSl3FNF' \
    --username 'FJnt3rIwZdW02Su6' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 414 'TokenGrantV4' test.out

#- 415 RequestTargetTokenResponseV4
./ng net.accelbyte.sdk.cli.Main iam requestTargetTokenResponseV4 \
    --additionalData 'Xi7BycDPckeGJUgU' \
    --code '8bD5mGFFmKTTUxG0' \
    > test.out 2>&1
eval_tap $? 415 'RequestTargetTokenResponseV4' test.out

#- 416 PublicListUserIDByPlatformUserIDsV4
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mpmFxxDNXGlGJvHf' \
    --rawPUID  \
    --body '{"pidType": "558h1ltyhiSGhfqX", "platformUserIds": ["hxBJ7zLXioAGkWgS", "DdDQvpRfGe3z2rtj", "WpJAlKHF0ebxhJ11"]}' \
    > test.out 2>&1
eval_tap $? 416 'PublicListUserIDByPlatformUserIDsV4' test.out

#- 417 PublicGetUserByPlatformUserIDV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --platformId '76CeD4dWCp4wqlQJ' \
    --platformUserId 'cZroNQiefBnPluOI' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetUserByPlatformUserIDV4' test.out

#- 418 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "BUQUmPHnPumcazKA", "policyId": "na0ji757aNDFeKnQ", "policyVersionId": "P2j2WsQImTwYkiux"}, {"isAccepted": true, "localizedPolicyVersionId": "C6eWKCFGS97Si6Xy", "policyId": "LVPrkUxyZ1OH5Nn4", "policyVersionId": "nMT8QOyTuUSD9Imt"}, {"isAccepted": false, "localizedPolicyVersionId": "HR6xbcVVonwz27DW", "policyId": "fGRVhbZTvCPrrZCT", "policyVersionId": "U5WUJizF69PSsquW"}], "authType": "EMAILPASSWD", "country": "afwbFPX15633pFgA", "dateOfBirth": "7i9tqvfHmFvUZiUW", "displayName": "5Y0CYw5OXSGwQkJu", "emailAddress": "y9oLFcHHcraLXR2n", "password": "9JQvq7NKWIHYsii3", "passwordMD5Sum": "fCh7sieJjZPAkiWu", "uniqueDisplayName": "mllU31uXPwYxedGH", "username": "CIkmt4bfJOhNaIT0", "verified": false}' \
    > test.out 2>&1
eval_tap $? 418 'PublicCreateTestUserV4' test.out

#- 419 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "v7XeqO8gY3c4SryW", "policyId": "B4yRaDxvxwaLM8Hk", "policyVersionId": "VOW8PnLkgqkqYZWP"}, {"isAccepted": true, "localizedPolicyVersionId": "gKagTzdcYcko7U3g", "policyId": "H239LhRx2Laa2Rdt", "policyVersionId": "Vb6VgA5yFIH3s9Uy"}, {"isAccepted": false, "localizedPolicyVersionId": "UjgyCUpM1JBcTzf4", "policyId": "dz1BojPoQg976409", "policyVersionId": "vFd5z9r4nJWUvLp1"}], "authType": "EMAILPASSWD", "code": "e94NxhXsVcqTYi1T", "country": "MBMzaOrxuKvtUVtq", "dateOfBirth": "bDWnJ2i9TRmJOqIl", "displayName": "7U12hO5vpk9DOSgb", "emailAddress": "sdGVPLD9A5NmuZDU", "password": "V3yHurgOfba1XeoH", "passwordMD5Sum": "YTNoRol84UlkxtP5", "reachMinimumAge": false, "uniqueDisplayName": "87uSyXP6C0jXS8au", "username": "2wcWYyj3JvHqXp4J"}' \
    > test.out 2>&1
eval_tap $? 419 'PublicCreateUserV4' test.out

#- 420 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'R7xI59Z9tfGVsgln' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "NxiaNyqBfgw58Hx0", "policyId": "XYL0fJOPYpnPqGlP", "policyVersionId": "nhBDOWqDU8N3DjVU"}, {"isAccepted": true, "localizedPolicyVersionId": "qyBzWzCgMMWZuD6t", "policyId": "mIR28xVxbtpSKOfi", "policyVersionId": "IP3S6pypZqISn3ms"}, {"isAccepted": true, "localizedPolicyVersionId": "8YK3lZFslECI9Qzu", "policyId": "QcsjFehD6uTDYnqy", "policyVersionId": "NgN7GoeMsezFZsTB"}], "authType": "EMAILPASSWD", "code": "GGsusS0zZRODEKPd", "country": "udZsLaf8aZrXW84d", "dateOfBirth": "t0TSTmy7XF26K2U7", "displayName": "xttUz8nWKJjv06Pu", "emailAddress": "ffHghAQfAsYXVzBe", "password": "nLtaAoYyRfiCWrm3", "passwordMD5Sum": "s1Ah3TII70MIcBMJ", "reachMinimumAge": true, "uniqueDisplayName": "4508jKedx0CVRpd7", "username": "SwZw2UkjDzJ4NuMM"}' \
    > test.out 2>&1
eval_tap $? 420 'CreateUserFromInvitationV4' test.out

#- 421 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "gI13nplXaUQV5QEv", "country": "KElLfbB7gwwAR1xF", "dateOfBirth": "rnyirw3iJt5iA3JS", "displayName": "2xeaJ08JrSHPqdhK", "languageTag": "Hn6ZjZMdr1C2TIQz", "uniqueDisplayName": "RJY7UfYSrdN0JVz4", "userName": "U43EcV1FRyeeqehM"}' \
    > test.out 2>&1
eval_tap $? 421 'PublicUpdateUserV4' test.out

#- 422 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "NeRYKeMbL0G4v5D6", "emailAddress": "ylZguO918X7rLoex"}' \
    > test.out 2>&1
eval_tap $? 422 'PublicUpdateUserEmailAddressV4' test.out

#- 423 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "HBMBMMAYokSWFwaj", "country": "RGUyklfLVY6g3PO4", "dateOfBirth": "hKAeF4GUV5m96qcC", "displayName": "JsVOWtu5RPsqd66I", "emailAddress": "mBEuhnaxZVf6MD9r", "password": "1y5Ihr531Kajxq7l", "reachMinimumAge": true, "uniqueDisplayName": "ttdgfLGO3ummplln", "username": "V6B62P1Kazg73c6U", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 423 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 424 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"dateOfBirth": "fWyK02w5QytAmkan", "displayName": "ukAzAMaRvIUhUwgu", "emailAddress": "GgbLLN3O7CEYjxqE", "password": "lP5lA2FJ0iGLRTXG", "uniqueDisplayName": "sC5mxxse4eeuMgEc", "username": "tVEux2MSuwsEHlwd"}' \
    > test.out 2>&1
eval_tap $? 424 'PublicUpgradeHeadlessAccountV4' test.out

#- 425 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "eJyhsHS6YqPudWvi", "mfaToken": "QsULL1txfX9tqFSk"}' \
    > test.out 2>&1
eval_tap $? 425 'PublicDisableMyAuthenticatorV4' test.out

#- 426 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'GXoIcFN5JL9M53Mg' \
    > test.out 2>&1
eval_tap $? 426 'PublicEnableMyAuthenticatorV4' test.out

#- 427 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 427 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 428 PublicGetMyBackupCodesV4
eval_tap 0 428 'PublicGetMyBackupCodesV4 # SKIP deprecated' test.out

#- 429 PublicGenerateMyBackupCodesV4
eval_tap 0 429 'PublicGenerateMyBackupCodesV4 # SKIP deprecated' test.out

#- 430 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "0MzWS9usxxnMhjv6", "mfaToken": "6DyED4prRVibTATx"}' \
    > test.out 2>&1
eval_tap $? 430 'PublicDisableMyBackupCodesV4' test.out

#- 431 PublicDownloadMyBackupCodesV4
eval_tap 0 431 'PublicDownloadMyBackupCodesV4 # SKIP deprecated' test.out

#- 432 PublicEnableMyBackupCodesV4
eval_tap 0 432 'PublicEnableMyBackupCodesV4 # SKIP deprecated' test.out

#- 433 PublicGetBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'd7Mzjv1gSj8kcNho' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetBackupCodesV4' test.out

#- 434 PublicGenerateBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'qcRZRNATojM7daV0' \
    > test.out 2>&1
eval_tap $? 434 'PublicGenerateBackupCodesV4' test.out

#- 435 PublicEnableBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    --languageTag 'VwR3yNKDtMqMrAGp' \
    > test.out 2>&1
eval_tap $? 435 'PublicEnableBackupCodesV4' test.out

#- 436 PublicChallengeMyMFAV4
./ng net.accelbyte.sdk.cli.Main iam publicChallengeMyMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'dyF6WDHn3ePBxQNz' \
    --factor '2IUEHMzl5jhwVDsu' \
    > test.out 2>&1
eval_tap $? 436 'PublicChallengeMyMFAV4' test.out

#- 437 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'zwJ4v50eoaIBrTh0' \
    > test.out 2>&1
eval_tap $? 437 'PublicRemoveTrustedDeviceV4' test.out

#- 438 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --action 'EKkJioUpvGnkcHgC' \
    --languageTag 'faWzPUvCnfqsPGgJ' \
    > test.out 2>&1
eval_tap $? 438 'PublicSendMyMFAEmailCodeV4' test.out

#- 439 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"factor": "ZyRwigaMu07Zek8W", "mfaToken": "Obpf0FHYfViEj70K"}' \
    > test.out 2>&1
eval_tap $? 439 'PublicDisableMyEmailV4' test.out

#- 440 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'YKIfFt4GYjUt4F1Z' \
    > test.out 2>&1
eval_tap $? 440 'PublicEnableMyEmailV4' test.out

#- 441 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 441 'PublicGetMyEnabledFactorsV4' test.out

#- 442 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'Vy2qFfSr3psWjOyH' \
    > test.out 2>&1
eval_tap $? 442 'PublicMakeFactorMyDefaultV4' test.out

#- 443 PublicGetMyOwnMFAStatusV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyOwnMFAStatusV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 443 'PublicGetMyOwnMFAStatusV4' test.out

#- 444 PublicGetMyMFAStatusV4
eval_tap 0 444 'PublicGetMyMFAStatusV4 # SKIP deprecated' test.out

#- 445 PublicGetUserPublicInfoByUserIdV4
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPublicInfoByUserIdV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LyKe2foqsVIfgBTr' \
    > test.out 2>&1
eval_tap $? 445 'PublicGetUserPublicInfoByUserIdV4' test.out

#- 446 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"additionalData": "8RcxRQR0NYdJzf3T", "emailAddress": "MhSaynVs05nZC4Os", "languageTag": "7hqIH2NgARSG3QQN", "namespace": "GNH2K0UuJdeGNquQ", "namespaceDisplayName": "naXpDQ5rU2taDWh9"}' \
    > test.out 2>&1
eval_tap $? 446 'PublicInviteUserV4' test.out

#- 447 PublicUpgradeHeadlessWithCodeV4Forward
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessWithCodeV4Forward \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "V5oc5IFQsrwHqFqw", "policyId": "VA5mozeeOjIFQfXV", "policyVersionId": "3YW3ug3nCXhD7FUz"}, {"isAccepted": false, "localizedPolicyVersionId": "r4D3NQdjrjkX3AMg", "policyId": "K3JgZufzssA284mG", "policyVersionId": "7uAojLYBsx8oqMzb"}, {"isAccepted": true, "localizedPolicyVersionId": "wAw5GdxpvLfa4b4h", "policyId": "TaZBGdX66DqPTdur", "policyVersionId": "R3MYda0Y0BCO4qPn"}], "code": "vxERWjKasq5zQ6uZ", "country": "NwKjnX7vDIqpcjma", "dateOfBirth": "q5KBCsHlwNrfKJrk", "displayName": "zwR40tfd9GFXChtx", "emailAddress": "B10d4Q8nlBthUSu4", "password": "WNfTvD5UcES1eLMZ", "reachMinimumAge": true, "uniqueDisplayName": "sqQW8HSrEm5Y7jI2", "username": "32SjktijiNzTUe8K", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 447 'PublicUpgradeHeadlessWithCodeV4Forward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE