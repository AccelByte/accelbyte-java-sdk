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
echo "1..347"

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

#- 108 AdminGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminGetInputValidations \
    > test.out 2>&1
eval_tap $? 108 'AdminGetInputValidations' test.out

#- 109 AdminUpdateInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminUpdateInputValidations \
    --body '[{"field": "TtHG1qDi", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "blockedWord": ["ISmX5bVg", "9z7t3LDa", "yL2EweXt"], "description": [{"language": "PVlet7ID", "message": ["gRtRxlmJ", "WYvHhFpL", "ylJ1C2im"]}, {"language": "LCxSbSIk", "message": ["RpKpBFs2", "XNK81uyX", "oxmMqqR7"]}, {"language": "wQWriCRA", "message": ["DcCbpwa6", "ynQgRZsZ", "okPjYY0Z"]}], "isCustomRegex": false, "letterCase": "0SeungXt", "maxLength": 43, "maxRepeatingAlphaNum": 41, "maxRepeatingSpecialCharacter": 75, "minCharType": 0, "minLength": 57, "regex": "Rzcj4YEs", "specialCharacterLocation": "jtwWF7fr", "specialCharacters": ["tRtZnXjA", "MLNHU1gn", "2mhVsBBo"]}}, {"field": "UAzY3VgF", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "blockedWord": ["K3Y8IcRA", "IT09zl79", "WIM5V6F8"], "description": [{"language": "b9ZRIwEk", "message": ["z4XIjxvT", "7nNgd39l", "Z3ZLWPOs"]}, {"language": "zDZDdtFw", "message": ["Pi1rH5ta", "mHX62ilw", "gGW9hydB"]}, {"language": "oIPFQup2", "message": ["4MOphwK4", "cNQjs4Pk", "JyuzkjwK"]}], "isCustomRegex": false, "letterCase": "FtBzSpJ7", "maxLength": 84, "maxRepeatingAlphaNum": 0, "maxRepeatingSpecialCharacter": 45, "minCharType": 61, "minLength": 15, "regex": "DXHiKvNx", "specialCharacterLocation": "4wGoWKPl", "specialCharacters": ["fu5jr06T", "uPAb6NGV", "7Q7MnOAl"]}}, {"field": "jhOdQboF", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "blockedWord": ["S8BpGEYD", "0kqn87uo", "7qxpQ1QY"], "description": [{"language": "iBa43hT6", "message": ["wt17cHQx", "E5EDe61g", "usl17ycy"]}, {"language": "zYwXHR80", "message": ["b18mhlwE", "3XXFY4lB", "AtxcYRSq"]}, {"language": "t7djZEIP", "message": ["ji1dLWe7", "63ZQWvrC", "c0b8SdKU"]}], "isCustomRegex": false, "letterCase": "UHGxnYeH", "maxLength": 48, "maxRepeatingAlphaNum": 19, "maxRepeatingSpecialCharacter": 43, "minCharType": 94, "minLength": 77, "regex": "TyFun2fS", "specialCharacterLocation": "GlHiImrs", "specialCharacters": ["u2q4HGNe", "9hwmm8Lf", "tUAnMDB1"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'lU6JzdVl' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'kC8APjwY' \
    --before 'mllNshzs' \
    --limit '8' \
    > test.out 2>&1
eval_tap $? 111 'ListAdminsV3' test.out

#- 112 AdminGetAgeRestrictionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetAgeRestrictionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'AdminGetAgeRestrictionStatusV3' test.out

#- 113 AdminUpdateAgeRestrictionConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAgeRestrictionConfigV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 59, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'DCHw6vZq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 18}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'kL4mZ2kX' \
    --limit '95' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "VrIPzcLe", "comment": "zeIqYyvE", "endDate": "gFAKUj26", "reason": "CdOBbS2I", "skipNotif": true, "userIds": ["0pC0L7xy", "Pe6pJzaJ", "CluXlKvg"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "6GVZri5f", "userId": "DDTnKy1Z"}, {"banId": "9G2nePU3", "userId": "QMesRnsK"}, {"banId": "zu4UJcRg", "userId": "Ob0qjLzB"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUnbanUserBulkV3' test.out

#- 119 AdminGetBansTypeWithNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBansTypeWithNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'AdminGetBansTypeWithNamespaceV3' test.out

#- 120 AdminGetClientsByNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsByNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'SxJLSM6Z' \
    --clientName 'cdh6sbLP' \
    --clientType 'IQSDR8g4' \
    --limit '13' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["tKZhk2Jw", "bnaV3xxe", "Dzsp9ZUj"], "baseUri": "4QqmPnp0", "clientId": "SBIN5ZQP", "clientName": "BfUpNnQt", "clientPermissions": [{"action": 51, "resource": "SckYLZVF", "schedAction": 78, "schedCron": "ENRCXCIC", "schedRange": ["PcdZr5q5", "2ExwOnzE", "ezIzcOK3"]}, {"action": 59, "resource": "diEukHwm", "schedAction": 46, "schedCron": "Gzzd30O1", "schedRange": ["yu20pYm9", "HxVcIzV0", "Y1oemjjZ"]}, {"action": 54, "resource": "NX1HEbX1", "schedAction": 49, "schedCron": "obpYsZr2", "schedRange": ["DXXEN7WL", "CMTweNOu", "ugX2cdc7"]}], "clientPlatform": "ZqorUMjH", "deletable": true, "description": "LKraTuk0", "namespace": "17J9ktiP", "oauthAccessTokenExpiration": 99, "oauthAccessTokenExpirationTimeUnit": "uuENdr1g", "oauthClientType": "cKL4RvQi", "oauthRefreshTokenExpiration": 20, "oauthRefreshTokenExpirationTimeUnit": "Xl9B7vSO", "parentNamespace": "HwBdEOya", "redirectUri": "u2mayXCn", "scopes": ["RoQfYQ19", "vqTzJggF", "zJ3CKyWY"], "secret": "oDEKWbEX", "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'sYlGubuv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'EY1BFnrS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 't4mMQo4v' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["XRFICrQd", "gGi498L4", "8KzUAVZ5"], "baseUri": "lWUmFPW2", "clientName": "ufEgInpx", "clientPermissions": [{"action": 69, "resource": "LJVHipEX", "schedAction": 80, "schedCron": "SSDGPFwV", "schedRange": ["KZGVt9Dq", "Gkr7hhAy", "e4FuXwkD"]}, {"action": 41, "resource": "k6rowvwQ", "schedAction": 55, "schedCron": "SkayDgfw", "schedRange": ["W9bZfi8o", "5y0W0ZPf", "ARIpjqJ0"]}, {"action": 91, "resource": "HHRckbC6", "schedAction": 65, "schedCron": "qrjBI2f4", "schedRange": ["18UoJcq9", "eMy0QeIb", "YUaFdB1C"]}], "clientPlatform": "4U8DaELz", "deletable": true, "description": "b1WtbUQz", "namespace": "Vmi6G67i", "oauthAccessTokenExpiration": 42, "oauthAccessTokenExpirationTimeUnit": "c1n7HPed", "oauthRefreshTokenExpiration": 7, "oauthRefreshTokenExpirationTimeUnit": "CUDhtHYg", "redirectUri": "FFmdD7zP", "scopes": ["vSIoHzPm", "s1rI9rOK", "UzEkNN1T"], "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'bvOCOvj8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 13, "resource": "N9tAK50n"}, {"action": 21, "resource": "MyTSnZOv"}, {"action": 60, "resource": "guKQuDsV"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'nFi07aEb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 55, "resource": "h59i8cu6"}, {"action": 32, "resource": "WHLRnUHe"}, {"action": 23, "resource": "LRBqhkhp"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '51' \
    --clientId 'dNhQlH1k' \
    --namespace "$AB_NAMESPACE" \
    --resource 'mbHxiMAb' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteClientPermissionV3' test.out

#- 128 RetrieveAllThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'RetrieveAllThirdPartyLoginPlatformCredentialV3' test.out

#- 129 RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 129 'RetrieveAllActiveThirdPartyLoginPlatformCredentialV3' test.out

#- 130 RetrieveAllSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GzlefnzK' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0zXvGK4M' \
    --body '{"ACSURL": "gHwVeN4r", "AWSCognitoRegion": "dhzISlsB", "AWSCognitoUserPool": "SjA6gxFs", "AllowedClients": ["jXZTqIbg", "mX8QbECd", "YJeJ8wh2"], "AppId": "nghpik8D", "AuthorizationEndpoint": "g04tlsTz", "ClientId": "JbukQjxa", "Environment": "vOkJs7VQ", "FederationMetadataURL": "oVmK7aLs", "GenericOauthFlow": false, "IsActive": true, "Issuer": "KHZYsnvR", "JWKSEndpoint": "NdABFYit", "KeyID": "FQHM0YzS", "NetflixCertificates": {"encryptedPrivateKey": "jWAxsoo1", "encryptedPrivateKeyName": "LUjOwXbL", "publicCertificate": "2oenl2jM", "publicCertificateName": "mcEquZki", "rootCertificate": "y8o45S2m", "rootCertificateName": "p4FmUM1C"}, "OrganizationId": "sDH9MWGB", "PlatformName": "9IWRFgQK", "RedirectUri": "7V8Pmc0n", "RegisteredDomains": [{"affectedClientIDs": ["zvviJQCH", "pK30bppb", "3ARKHztD"], "domain": "kXP3GYy9", "namespaces": ["f68j88oq", "7fR51qlM", "ynAZI7Ws"], "roleId": "TacW6yAX"}, {"affectedClientIDs": ["iWDR065y", "L7DeCA4b", "HV2qQ4e7"], "domain": "FbPjDOng", "namespaces": ["mqtCU0rh", "wh7xpPR9", "eOcdO333"], "roleId": "bmgguKhk"}, {"affectedClientIDs": ["EE5M4Ht0", "OmWmqvL5", "4cHlS9N9"], "domain": "dIHej3LS", "namespaces": ["5QLQYfTi", "9q01wa4H", "WwLRmgtH"], "roleId": "083y1T8U"}], "Secret": "68LAWHAw", "TeamID": "OeXGICB3", "TokenAuthenticationType": "5o0kgqu0", "TokenClaimsMapping": {"VFqLwVmP": "kCZWcaJz", "iBQkgwRC": "0VSxeFbY", "gpjcgkYL": "xZJSupee"}, "TokenEndpoint": "1bexhzHi", "UserInfoEndpoint": "L1xiW9Kk", "UserInfoHTTPMethod": "9KVyFraz", "scopes": ["pAX5B7NX", "VsOWD0QJ", "IitJcZdS"]}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8MwDda8D' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'df5FOk9I' \
    --body '{"ACSURL": "KWXi2dDC", "AWSCognitoRegion": "VWAwv2En", "AWSCognitoUserPool": "ObbBJTf2", "AllowedClients": ["Ud7Drxls", "5GoY0Lcb", "9ysVPSOS"], "AppId": "9bpmQnwQ", "AuthorizationEndpoint": "3D9XJV8h", "ClientId": "LHWwQYvU", "Environment": "NvPfCURn", "FederationMetadataURL": "JlNE8kaV", "GenericOauthFlow": false, "IsActive": true, "Issuer": "arqwsT3L", "JWKSEndpoint": "SRLaCDMb", "KeyID": "6ZpF04ux", "NetflixCertificates": {"encryptedPrivateKey": "Yf080qU9", "encryptedPrivateKeyName": "uoTSiP5S", "publicCertificate": "Fpm7yWUK", "publicCertificateName": "SudwI8mK", "rootCertificate": "HndJOnUz", "rootCertificateName": "45WS6R39"}, "OrganizationId": "xAJanwSJ", "PlatformName": "pmHKZAWZ", "RedirectUri": "S3xUU9Q2", "RegisteredDomains": [{"affectedClientIDs": ["AzjaDijh", "htRbfFj0", "XiobbD7f"], "domain": "VWlJT9ge", "namespaces": ["zjwb0PdV", "YXLTAoto", "UWIMrIO1"], "roleId": "SMaiwiRV"}, {"affectedClientIDs": ["uODKSYjV", "gpgTfzy1", "kOqc5MyX"], "domain": "8ADnsFjn", "namespaces": ["qpQGiqVJ", "e6KaHq1C", "WgjLodRh"], "roleId": "ewuY440A"}, {"affectedClientIDs": ["PIFynrHX", "yiyHaxd0", "axsTjHDq"], "domain": "LaBB7TuY", "namespaces": ["e2ok0dC9", "Gpq6t0FT", "Er0fkOsC"], "roleId": "xnhXoGbt"}], "Secret": "V80uwbn6", "TeamID": "TCPRIWEo", "TokenAuthenticationType": "eC0trlX8", "TokenClaimsMapping": {"8ERPNQdn": "JKGxQeWU", "e1RGK1VK": "JSdjcuUm", "hczHqwL1": "KJpcInkH"}, "TokenEndpoint": "tlvoSKbK", "UserInfoEndpoint": "JDWiZfDY", "UserInfoHTTPMethod": "98wl4ZZE", "scopes": ["bIn62f8y", "DVWkR0eT", "luhj34pz"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tSQdG3Ua' \
    --body '{"affectedClientIDs": ["4THihqgr", "qmXdHPLk", "aL3lVPZf"], "assignedNamespaces": ["QyMjrPQZ", "zsT0cPfz", "x6jrFWQS"], "domain": "td9wJRa5", "roleId": "SoWrcSMp"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0oJ1eFjh' \
    --body '{"domain": "l8v14eBF"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ecJjiJBC' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'a6evMrDx' \
    --body '{"acsUrl": "eMyzTMOf", "apiKey": "tE6MPnkH", "appId": "7nJ9wlwN", "federationMetadataUrl": "URncl2lL", "isActive": true, "redirectUri": "0mMt3811", "secret": "1RwruQAd", "ssoUrl": "2KCJvE0k"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YIvz9fIU' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '6ZGNBIFI' \
    --body '{"acsUrl": "EIylm9cR", "apiKey": "MYlbNsvk", "appId": "uu2z2rmA", "federationMetadataUrl": "isM1iqCw", "isActive": true, "redirectUri": "moYJXILh", "secret": "CqudEv9K", "ssoUrl": "REhvD7Gf"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BtJQW6Qp' \
    --platformUserId 'ARAie0l0' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'zAPRav02' \
    --after '24' \
    --before '30' \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress '12DSq0M1' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["F5mzko3i", "PQuS5fjo", "HN4yxg52"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["LmlzOBqp", "YkWZMApb", "hqUXAmWA"], "isAdmin": true, "namespace": "aSkQFjmv", "roles": ["ZamsWm70", "qHjRQSpc", "RExoIfFo"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '44' \
    --platformUserId 'cDUII3vk' \
    --platformId 'yoGmu1en' \
    > test.out 2>&1
eval_tap $? 146 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 147 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 147 'AdminListUsersV3' test.out

#- 148 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'vRFm3DGY' \
    --endDate 'GyiNrbIG' \
    --limit '90' \
    --offset '72' \
    --platformBy 'JtHxoOpK' \
    --platformId 'wSZFbwaX' \
    --query 'qVt7zChQ' \
    --startDate 'T6SS3qAB' \
    > test.out 2>&1
eval_tap $? 148 'AdminSearchUserV3' test.out

#- 149 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["gUo5RVjD", "NDMqJfu2", "9HgTEr63"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetBulkUserByEmailAddressV3' test.out

#- 150 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ioyU7BNs' \
    > test.out 2>&1
eval_tap $? 150 'AdminGetUserByUserIdV3' test.out

#- 151 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wNIPCMu5' \
    --body '{"avatarUrl": "Q8T6d9Mf", "country": "hg3eTmEj", "dateOfBirth": "UMK3Adje", "displayName": "dqfLvtpU", "languageTag": "FneVyr0E", "userName": "lTurz7pd"}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserV3' test.out

#- 152 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pFnDU49L' \
    --activeOnly  \
    --after 'M0Wk1Ve0' \
    --before 'marasvb6' \
    --limit '45' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetUserBanV3' test.out

#- 153 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VcUxzNJF' \
    --body '{"ban": "0TsjNh65", "comment": "OyszpIgX", "endDate": "yInErKa3", "reason": "3IPIPXmS", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 153 'AdminBanUserV3' test.out

#- 154 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId '0X3Pq8T8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kkzzPU8E' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 154 'AdminUpdateUserBanV3' test.out

#- 155 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'swbK8WGf' \
    --body '{"context": "IOfTeyri", "emailAddress": "3Tl5yoAN", "languageTag": "CCNAKZrW"}' \
    > test.out 2>&1
eval_tap $? 155 'AdminSendVerificationCodeV3' test.out

#- 156 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jSPPIIFL' \
    --body '{"Code": "fFfPUfTm", "ContactType": "X6FjCTNY", "LanguageTag": "8xpt9B3M", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 156 'AdminVerifyAccountV3' test.out

#- 157 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'HDPYS0zE' \
    > test.out 2>&1
eval_tap $? 157 'GetUserVerificationCode' test.out

#- 158 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DlxQK8ZJ' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserDeletionStatusV3' test.out

#- 159 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8oSlkORL' \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpdateUserDeletionStatusV3' test.out

#- 160 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RamITZ5M' \
    --body '{"code": "hOHrmatK", "country": "jkhwTYDK", "dateOfBirth": "FOCle0Ri", "displayName": "m9t1EWAV", "emailAddress": "XvgrMQh8", "password": "VdtBC4Jt", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpgradeHeadlessAccountV3' test.out

#- 161 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0yhfHUAQ' \
    > test.out 2>&1
eval_tap $? 161 'AdminDeleteUserInformationV3' test.out

#- 162 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dVgIzCzt' \
    --after '0.6918573763763071' \
    --before '0.39576196481566484' \
    --limit '44' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetUserLoginHistoriesV3' test.out

#- 163 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GQJw4L79' \
    --body '{"languageTag": "x9U1T0Gq", "newPassword": "xqjBPd0t", "oldPassword": "LXbXdgS1"}' \
    > test.out 2>&1
eval_tap $? 163 'AdminResetPasswordV3' test.out

#- 164 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NWtIYIan' \
    --body '{"Permissions": [{"Action": 73, "Resource": "mhFVojmK", "SchedAction": 93, "SchedCron": "sxRVazQX", "SchedRange": ["Ct5fa6sO", "epm7sHLp", "7WErJe66"]}, {"Action": 77, "Resource": "ybEBl58q", "SchedAction": 63, "SchedCron": "2ohoIG7A", "SchedRange": ["BbpPvXwP", "WvVfO3iw", "auL0PTvD"]}, {"Action": 79, "Resource": "Pqr0axKc", "SchedAction": 25, "SchedCron": "61j09lT8", "SchedRange": ["lFFmSKGB", "cllNFd1O", "eUw2aJfY"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserPermissionV3' test.out

#- 165 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VLBB8Ibr' \
    --body '{"Permissions": [{"Action": 69, "Resource": "ALDPYdsY", "SchedAction": 23, "SchedCron": "H6GGIVPo", "SchedRange": ["evj5A1Yk", "YdhuQnMN", "aREkurC8"]}, {"Action": 33, "Resource": "grsf2EkL", "SchedAction": 85, "SchedCron": "L8jULmFa", "SchedRange": ["EQf68Vlh", "fNjDLRwX", "xVlmvh31"]}, {"Action": 74, "Resource": "ao8KYpyd", "SchedAction": 35, "SchedCron": "1qJtmCQ4", "SchedRange": ["N07o5ACB", "bjlp5h13", "nMQZchZ0"]}]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminAddUserPermissionsV3' test.out

#- 166 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eqiKYLW4' \
    --body '[{"Action": 50, "Resource": "d9tQOMuX"}, {"Action": 41, "Resource": "GIqxjmOX"}, {"Action": 56, "Resource": "K9dv98i7"}]' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionBulkV3' test.out

#- 167 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '25' \
    --namespace "$AB_NAMESPACE" \
    --resource 'DLGKIW8m' \
    --userId 'jRWMXVsR' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserPermissionV3' test.out

#- 168 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zzZnDvWn' \
    --after 'VkdZQkfZ' \
    --before 'RgSqpeZe' \
    --limit '5' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserPlatformAccountsV3' test.out

#- 169 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'KHRoX1ya' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetListJusticePlatformAccounts' test.out

#- 170 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'gwp4bkFr' \
    --userId 'sfRqrmRN' \
    > test.out 2>&1
eval_tap $? 170 'AdminGetUserMapping' test.out

#- 171 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'mdNdVesU' \
    --userId 'S5hX8tmd' \
    > test.out 2>&1
eval_tap $? 171 'AdminCreateJusticeUser' test.out

#- 172 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'NLM53CSd' \
    --body '{"platformId": "lf7kI75j", "platformUserId": "LeXI6dw5"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminLinkPlatformAccount' test.out

#- 173 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6Dhos9q0' \
    --userId 'Yo3E4k27' \
    --body '{"platformNamespace": "0RGmLRS0"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformUnlinkV3' test.out

#- 174 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AmPojn9R' \
    --userId 'JlVm0MHN' \
    --ticket '03NRP7T8' \
    > test.out 2>&1
eval_tap $? 174 'AdminPlatformLinkV3' test.out

#- 175 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'E8kY6hPh' \
    --userId 'Bjll8MGV' \
    --platformToken '6RhUHFjp' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 176 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PFaFjrmx' \
    --body '["H8TJJX2g", "Mg0fxvLW", "faSKMUe1"]' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserRolesV3' test.out

#- 177 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JZYi7ao2' \
    --body '[{"namespace": "1Oy2PnmH", "roleId": "kpGPhqoh"}, {"namespace": "Lr8af31c", "roleId": "3iYNUQeh"}, {"namespace": "EMI5psb3", "roleId": "KbiUZk5e"}]' \
    > test.out 2>&1
eval_tap $? 177 'AdminSaveUserRoleV3' test.out

#- 178 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'LTk3ZICd' \
    --userId '1d9cyvkv' \
    > test.out 2>&1
eval_tap $? 178 'AdminAddUserRoleV3' test.out

#- 179 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'JHJ2HyFY' \
    --userId 'esCAQ06E' \
    > test.out 2>&1
eval_tap $? 179 'AdminDeleteUserRoleV3' test.out

#- 180 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'N8SIFRAW' \
    --body '{"enabled": false, "reason": "acIwCXKG"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateUserStatusV3' test.out

#- 181 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'grWXVBue' \
    > test.out 2>&1
eval_tap $? 181 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 182 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'GQqQObXW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "RCxhoYui"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateClientSecretV3' test.out

#- 183 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'YqtRrsPX' \
    --before 'rP7JLisl' \
    --isWildcard  \
    --limit '62' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRolesV3' test.out

#- 184 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "managers": [{"displayName": "7HNBEjOT", "namespace": "ytyf0oM2", "userId": "gLIzqSAV"}, {"displayName": "B6MP5hlC", "namespace": "uMHVxvMl", "userId": "XcyNaIVh"}, {"displayName": "uVNqnotn", "namespace": "MUVHTVXp", "userId": "uys05bOq"}], "members": [{"displayName": "eGga094o", "namespace": "LoH9hVw6", "userId": "aHxmSiH0"}, {"displayName": "m4k13V58", "namespace": "PZbB5Q8n", "userId": "C479kgFX"}, {"displayName": "VSAd6VzC", "namespace": "mwmEq7NF", "userId": "DLV8BiJB"}], "permissions": [{"action": 15, "resource": "zBbCCD5r", "schedAction": 29, "schedCron": "9X7nYkny", "schedRange": ["TFqLXkRE", "MSKpyXoj", "WtMPdh3K"]}, {"action": 56, "resource": "aou4Zt78", "schedAction": 89, "schedCron": "wZy2YJLb", "schedRange": ["qWHFPVxv", "MKpSG6Xe", "Pg29SqPA"]}, {"action": 95, "resource": "j6c0iNlH", "schedAction": 25, "schedCron": "PhxESbMH", "schedRange": ["yrLITMfY", "Z4LwjaQs", "rcc2n3SG"]}], "roleName": "ZlXtF3o2"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminCreateRoleV3' test.out

#- 185 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'D9OQq9QN' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleV3' test.out

#- 186 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'zGQmTknA' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteRoleV3' test.out

#- 187 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId '8kmd0HjM' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "C5SbIHS6"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateRoleV3' test.out

#- 188 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId '456yL1Aa' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleAdminStatusV3' test.out

#- 189 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'rFgoZnos' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpdateAdminRoleStatusV3' test.out

#- 190 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'p9xm8dMc' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleAdminV3' test.out

#- 191 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'dF66Oq2A' \
    --after 'sOPL0pCz' \
    --before 'Y3Y4l3sY' \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetRoleManagersV3' test.out

#- 192 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'A8kehtqi' \
    --body '{"managers": [{"displayName": "vcr01J7C", "namespace": "W02ksnv1", "userId": "FYyF0QQv"}, {"displayName": "O4AQ9FV8", "namespace": "1c8eYRdO", "userId": "gwEHQVgt"}, {"displayName": "2EauTIkV", "namespace": "GaEJ4W89", "userId": "wTrEXoLU"}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRoleManagersV3' test.out

#- 193 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'igooej9c' \
    --body '{"managers": [{"displayName": "TeuyWEJ7", "namespace": "esJzwbsF", "userId": "KopXW43H"}, {"displayName": "Ak7im0D1", "namespace": "d1dHvSP3", "userId": "gIibvrRx"}, {"displayName": "9aHaHbGg", "namespace": "UvzukUwY", "userId": "TFVB3PZb"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminRemoveRoleManagersV3' test.out

#- 194 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'xoaBtp0Q' \
    --after '7BljvRlI' \
    --before 'hFRlL4Ne' \
    --limit '14' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetRoleMembersV3' test.out

#- 195 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'IWiPhxhS' \
    --body '{"members": [{"displayName": "yS0OAEzg", "namespace": "73rBWsSH", "userId": "hu3kV3Kw"}, {"displayName": "iLkxifTh", "namespace": "rFcfmICN", "userId": "vw53RDIX"}, {"displayName": "vof1Rsy9", "namespace": "kXlgFsMO", "userId": "hzimu7NB"}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddRoleMembersV3' test.out

#- 196 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'f4FTaub3' \
    --body '{"members": [{"displayName": "9N9ZCrma", "namespace": "55GJnNAG", "userId": "yIxkW7jo"}, {"displayName": "gaIPcDSc", "namespace": "aVTdtskf", "userId": "8oetKCKu"}, {"displayName": "loRvZesz", "namespace": "oJvsTbEN", "userId": "CSdIxkRW"}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminRemoveRoleMembersV3' test.out

#- 197 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId '8qjF36WH' \
    --body '{"permissions": [{"action": 69, "resource": "VRuxsPfa", "schedAction": 89, "schedCron": "NbLBIRyU", "schedRange": ["B2jbgIah", "TGJgwuK6", "DVpXbYzA"]}, {"action": 86, "resource": "kMJmGycb", "schedAction": 85, "schedCron": "uluROASz", "schedRange": ["y2WjXP2c", "LszEZwHX", "ZJBvOLvT"]}, {"action": 17, "resource": "i64AjbIQ", "schedAction": 85, "schedCron": "VsJy5ooZ", "schedRange": ["hg4nwDC2", "Ey7jBmr9", "5pWfLlNz"]}]}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateRolePermissionsV3' test.out

#- 198 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'oZJzsLs3' \
    --body '{"permissions": [{"action": 13, "resource": "vxhyM4LN", "schedAction": 0, "schedCron": "yGYEq1t9", "schedRange": ["flGyNwsZ", "Aot2Yzwp", "XAuMPCfd"]}, {"action": 47, "resource": "EfrF4v2t", "schedAction": 30, "schedCron": "DTHGyfSH", "schedRange": ["fwrxTLnP", "vkeMTd4j", "KtkVJvWS"]}, {"action": 64, "resource": "k6EdKvhy", "schedAction": 95, "schedCron": "IepPPSg0", "schedRange": ["YHurVXqf", "DRCdwEHm", "m8lpZF8Q"]}]}' \
    > test.out 2>&1
eval_tap $? 198 'AdminAddRolePermissionsV3' test.out

#- 199 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'zNaiEGWt' \
    --body '["29e84wp7", "fcUJhTiF", "T7SrrhwV"]' \
    > test.out 2>&1
eval_tap $? 199 'AdminDeleteRolePermissionsV3' test.out

#- 200 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '32' \
    --resource 'dQfFhlbU' \
    --roleId 'JoZY6mbd' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteRolePermissionV3' test.out

#- 201 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 201 'AdminGetMyUserV3' test.out

#- 202 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'HzfSrFl7' \
    --extendExp  \
    --redirectUri 'nLzG1aKB' \
    --password 'x3vMamwf' \
    --requestId 'jCgkoOAG' \
    --userName 'xtOMND50' \
    > test.out 2>&1
eval_tap $? 202 'UserAuthenticationV3' test.out

#- 203 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'Os4pu9Iw' \
    --linkingToken 'zdWsmUqG' \
    --password 'u0gkcGwD' \
    --username 'NQRs0Sel' \
    > test.out 2>&1
eval_tap $? 203 'AuthenticationWithPlatformLinkV3' test.out

#- 204 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'Z5oEDhi3' \
    > test.out 2>&1
eval_tap $? 204 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 205 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'R4XoPqDC' \
    > test.out 2>&1
eval_tap $? 205 'RequestOneTimeLinkingCodeV3' test.out

#- 206 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'WAaigDNF' \
    > test.out 2>&1
eval_tap $? 206 'ValidateOneTimeLinkingCodeV3' test.out

#- 207 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --clientId 'HuvYq2Ug' \
    --oneTimeLinkCode 'ZrvZprrR' \
    > test.out 2>&1
eval_tap $? 207 'RequestTokenByOneTimeLinkCodeResponseV3' test.out

#- 208 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 208 'GetCountryLocationV3' test.out

#- 209 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 209 'Logout' test.out

#- 210 RequestGameTokenCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenCodeResponseV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'pwqbzzS6' \
    > test.out 2>&1
eval_tap $? 210 'RequestGameTokenCodeResponseV3' test.out

#- 211 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'H5QXDlGP' \
    --userId '5dDqWOav' \
    > test.out 2>&1
eval_tap $? 211 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 212 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'K19AREmC' \
    > test.out 2>&1
eval_tap $? 212 'RevokeUserV3' test.out

#- 213 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'rTG484pq' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'UbhuNlyT' \
    --redirectUri 'lMWw4MrV' \
    --scope 'ZIsSXDIQ' \
    --state 'lFT4O6LG' \
    --targetAuthPage 'jb73N5RH' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId '3D4Id9rd' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 213 'AuthorizeV3' test.out

#- 214 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token '8q4ix7Cv' \
    > test.out 2>&1
eval_tap $? 214 'TokenIntrospectionV3' test.out

#- 215 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 215 'GetJWKSV3' test.out

#- 216 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'u502QR20' \
    --factor 'c4gGvl2g' \
    --mfaToken 'fedEFXDP' \
    > test.out 2>&1
eval_tap $? 216 'SendMFAAuthenticationCode' test.out

#- 217 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'wwH9KbdV' \
    --mfaToken 'A4M4Bcbg' \
    > test.out 2>&1
eval_tap $? 217 'Change2faMethod' test.out

#- 218 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'gjSWSGef' \
    --factor 'wUBWiFfb' \
    --mfaToken 'fyPZ3E0h' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 218 'Verify2faCode' test.out

#- 219 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LYMzqmKB' \
    --userId 'ZaaC7JGV' \
    > test.out 2>&1
eval_tap $? 219 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 220 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId '18wj2Lvn' \
    --clientId 'wwtPPfDm' \
    --redirectUri 'xZasJH7x' \
    --requestId 'P3FSStAB' \
    > test.out 2>&1
eval_tap $? 220 'AuthCodeRequestV3' test.out

#- 221 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'oWb3Wm7y' \
    --clientId 'h9VoOQmo' \
    --createHeadless  \
    --deviceId 'uiVhrKrG' \
    --macAddress 'Ld1FW3iT' \
    --platformToken 'K18UQ9sl' \
    > test.out 2>&1
eval_tap $? 221 'PlatformTokenGrantV3' test.out

#- 222 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 222 'GetRevocationListV3' test.out

#- 223 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 's68cJFxY' \
    > test.out 2>&1
eval_tap $? 223 'TokenRevocationV3' test.out

#- 224 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'X0QUHhJs' \
    --code 'MmBkyGoE' \
    --codeVerifier 'BwiSX6vw' \
    --extendExp  \
    --password 'oTq3p3oQ' \
    --redirectUri '9OrFzxPK' \
    --refreshToken 'AO5BVRv3' \
    --username 'aJE4z3TE' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 224 'TokenGrantV3' test.out

#- 225 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'Hw2X8gnN' \
    > test.out 2>&1
eval_tap $? 225 'VerifyTokenV3' test.out

#- 226 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'KNLGnBlX' \
    --code 'j9RAsDvO' \
    --error '6FhRZwh2' \
    --openidAssocHandle 'PSqbN6fk' \
    --openidClaimedId 'OcQqI0an' \
    --openidIdentity 'UhGIafYj' \
    --openidMode 'zMcoqvjj' \
    --openidNs '0gqJdmIt' \
    --openidOpEndpoint 'YgPLzrz4' \
    --openidResponseNonce 'RNhwW4BU' \
    --openidReturnTo 'w6oEsrcb' \
    --openidSig '26mGWw3t' \
    --openidSigned 'z5A7NqLZ' \
    --state 'Q464EeoP' \
    > test.out 2>&1
eval_tap $? 226 'PlatformAuthenticationV3' test.out

#- 227 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'yimKdYOn' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetInputValidations' test.out

#- 228 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'HdE2GcaN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 228 'PublicGetCountryAgeRestrictionV3' test.out

#- 229 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 229 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 230 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'Tqj4H85R' \
    > test.out 2>&1
eval_tap $? 230 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 231 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bkxHXPFx' \
    --body '{"platformUserIds": ["Pfn4JiPS", "TV9KSkni", "HUosJUV7"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 232 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'T6Ed8GJI' \
    --platformUserId 'c9IFM1St' \
    > test.out 2>&1
eval_tap $? 232 'PublicGetUserByPlatformUserIDV3' test.out

#- 233 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'mos20W9a' \
    > test.out 2>&1
eval_tap $? 233 'PublicGetAsyncStatus' test.out

#- 234 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '6vRG9McK' \
    --limit '72' \
    --offset '25' \
    --query 'l4xnAGtH' \
    > test.out 2>&1
eval_tap $? 234 'PublicSearchUserV3' test.out

#- 235 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "3lXs3ssa", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "peFqbasP", "policyId": "1Jg2y2Uk", "policyVersionId": "PiDAXj16"}, {"isAccepted": true, "localizedPolicyVersionId": "RrXZmamE", "policyId": "lVwIMr7k", "policyVersionId": "dg8e2joT"}, {"isAccepted": false, "localizedPolicyVersionId": "jFNZ0YRV", "policyId": "eGuHkGSL", "policyVersionId": "NDXnRvQQ"}], "authType": "cvYaILic", "code": "4m5O7FFa", "country": "xIN59j6d", "dateOfBirth": "VseddGWr", "displayName": "0yPCOcUh", "emailAddress": "20jvYy8R", "password": "tHbdwKCW", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 235 'PublicCreateUserV3' test.out

#- 236 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'tzXSPQ2T' \
    --query 'fLS5h7Mv' \
    > test.out 2>&1
eval_tap $? 236 'CheckUserAvailability' test.out

#- 237 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["ciHiD6Jv", "zBz8IkY4", "aCjvAuFL"]}' \
    > test.out 2>&1
eval_tap $? 237 'PublicBulkGetUsers' test.out

#- 238 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "mJ8u0fw0", "languageTag": "wetLUHPV"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicSendRegistrationCode' test.out

#- 239 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "VqWku76H", "emailAddress": "jaOipYAz"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicVerifyRegistrationCode' test.out

#- 240 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "auCkpVhX", "languageTag": "sKP4AckX"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicForgotPasswordV3' test.out

#- 241 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'kqO7hN9o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'GetAdminInvitationV3' test.out

#- 242 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'qziNjeN3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "WWgXllSN", "policyId": "bVGCTIZF", "policyVersionId": "4p8fyilf"}, {"isAccepted": false, "localizedPolicyVersionId": "S2AoGYuu", "policyId": "cSf7zlmi", "policyVersionId": "bdQGvJKA"}, {"isAccepted": true, "localizedPolicyVersionId": "K9hLwQId", "policyId": "fY3MXDQy", "policyVersionId": "A3wYNQOD"}], "authType": "EMAILPASSWD", "country": "6EfC7Kkz", "dateOfBirth": "zTBhXI56", "displayName": "szcaCZrC", "password": "kPLFSZN5", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 242 'CreateUserFromInvitationV3' test.out

#- 243 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "QTORWbWT", "country": "UryRf3J1", "dateOfBirth": "aU2708iu", "displayName": "h6H5iNW2", "languageTag": "Kbprp7Km", "userName": "WTICuWYx"}' \
    > test.out 2>&1
eval_tap $? 243 'UpdateUserV3' test.out

#- 244 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "WV0igAnD", "country": "U0glgKaL", "dateOfBirth": "6B8IeKtm", "displayName": "bezMFMNM", "languageTag": "l8UJy6gK", "userName": "J7gcaRNZ"}' \
    > test.out 2>&1
eval_tap $? 244 'PublicPartialUpdateUserV3' test.out

#- 245 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "Xyp2BF3s", "emailAddress": "fn4RPuAN", "languageTag": "BRbkOrKn"}' \
    > test.out 2>&1
eval_tap $? 245 'PublicSendVerificationCodeV3' test.out

#- 246 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "uSCXvsz5", "contactType": "G9BMOc68", "languageTag": "kRuijePJ", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 246 'PublicUserVerificationV3' test.out

#- 247 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ExdCnUfr", "country": "iyXREAzr", "dateOfBirth": "zu9735Tq", "displayName": "8KojHqNe", "emailAddress": "qOXqp3gS", "password": "taojMz8X", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 247 'PublicUpgradeHeadlessAccountV3' test.out

#- 248 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "tvHJxR4A", "password": "BQEaZGne"}' \
    > test.out 2>&1
eval_tap $? 248 'PublicVerifyHeadlessAccountV3' test.out

#- 249 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "1I7w60Xm", "newPassword": "cPjpsVSM", "oldPassword": "8beEPW10"}' \
    > test.out 2>&1
eval_tap $? 249 'PublicUpdatePasswordV3' test.out

#- 250 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'WoNFAE21' \
    > test.out 2>&1
eval_tap $? 250 'PublicCreateJusticeUser' test.out

#- 251 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'iVtOIXqq' \
    --redirectUri '6i3CGD1g' \
    --ticket 'MQg2fl9K' \
    > test.out 2>&1
eval_tap $? 251 'PublicPlatformLinkV3' test.out

#- 252 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'EYbd1hpw' \
    --body '{"platformNamespace": "JyuHXl8Z"}' \
    > test.out 2>&1
eval_tap $? 252 'PublicPlatformUnlinkV3' test.out

#- 253 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MueouneB' \
    > test.out 2>&1
eval_tap $? 253 'PublicPlatformUnlinkAllV3' test.out

#- 254 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AuG2GWdA' \
    --ticket 'XJDFg5an' \
    > test.out 2>&1
eval_tap $? 254 'PublicForcePlatformLinkV3' test.out

#- 255 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZY5I2UYl' \
    --clientId 'L4AEytHa' \
    --redirectUri 'fLwnQRiF' \
    > test.out 2>&1
eval_tap $? 255 'PublicWebLinkPlatform' test.out

#- 256 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'J3pFsNMR' \
    --state '9UEDQ9fJ' \
    > test.out 2>&1
eval_tap $? 256 'PublicWebLinkPlatformEstablish' test.out

#- 257 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "SYTgoyLp", "emailAddress": "fsaJyRB8", "newPassword": "YnHhviZK"}' \
    > test.out 2>&1
eval_tap $? 257 'ResetPasswordV3' test.out

#- 258 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'P2sr0zOw' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetUserByUserIdV3' test.out

#- 259 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ac5roKrp' \
    --activeOnly  \
    --after 'kqzY4MiQ' \
    --before 'bsRRLeIT' \
    --limit '20' \
    > test.out 2>&1
eval_tap $? 259 'PublicGetUserBanHistoryV3' test.out

#- 260 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DhyYCJ7u' \
    > test.out 2>&1
eval_tap $? 260 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 261 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mlq7yjTP' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetUserInformationV3' test.out

#- 262 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uqLMuoYz' \
    --after '0.41494939141995524' \
    --before '0.9461849689887275' \
    --limit '10' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetUserLoginHistoriesV3' test.out

#- 263 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oIdInsxO' \
    --after '6zC2x5fE' \
    --before 'LEwQeorz' \
    --limit '10' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetUserPlatformAccountsV3' test.out

#- 264 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zA6NliEZ' \
    > test.out 2>&1
eval_tap $? 264 'PublicListJusticePlatformAccountsV3' test.out

#- 265 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'IsB6cual' \
    --body '{"platformId": "4XFSiLS8", "platformUserId": "ornq2VS7"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicLinkPlatformAccount' test.out

#- 266 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'q2oTVvVk' \
    --body '{"chosenNamespaces": ["KZJzFWXF", "8fVtIySJ", "FLllj62b"], "requestId": "XRB9SsRj"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicForceLinkPlatformWithProgression' test.out

#- 267 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SmVw6TWR' \
    > test.out 2>&1
eval_tap $? 267 'PublicGetPublisherUserV3' test.out

#- 268 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gVe3suId' \
    --password '2JhbbHpd' \
    > test.out 2>&1
eval_tap $? 268 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 269 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'GpzZE7gI' \
    --before 'AOWS1ui8' \
    --isWildcard  \
    --limit '98' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetRolesV3' test.out

#- 270 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'yJNfVypj' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetRoleV3' test.out

#- 271 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 271 'PublicGetMyUserV3' test.out

#- 272 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'Alq5P5CS' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 273 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["4SedWOCZ", "J2JqUHCG", "CMEw1Z0n"], "oneTimeLinkCode": "yAhhUTV0"}' \
    > test.out 2>&1
eval_tap $? 273 'LinkHeadlessAccountToMyAccountV3' test.out

#- 274 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "PamCo8na"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicSendVerificationLinkV3' test.out

#- 275 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'c6T000xV' \
    > test.out 2>&1
eval_tap $? 275 'PublicVerifyUserByLinkV3' test.out

#- 276 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'Dwp30eD4' \
    --code 'GuIj9A0g' \
    --error 'Bkl8mGwg' \
    --state 'IGiUjhPa' \
    > test.out 2>&1
eval_tap $? 276 'PlatformAuthenticateSAMLV3Handler' test.out

#- 277 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'twKUlWOt' \
    --payload 'tTvcUpVS' \
    > test.out 2>&1
eval_tap $? 277 'LoginSSOClient' test.out

#- 278 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'gRqNRTLw' \
    > test.out 2>&1
eval_tap $? 278 'LogoutSSOClient' test.out

#- 279 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'TfooA3oG' \
    > test.out 2>&1
eval_tap $? 279 'RequestGameTokenResponseV3' test.out

#- 280 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vpzCZqSL' \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDevicesByUserV4' test.out

#- 281 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'kXjWZYww' \
    --endDate 'btw1q2N3' \
    --limit '70' \
    --offset '25' \
    --startDate 'ytDgbMTg' \
    > test.out 2>&1
eval_tap $? 281 'AdminGetBannedDevicesV4' test.out

#- 282 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LsBXJ4dO' \
    > test.out 2>&1
eval_tap $? 282 'AdminGetUserDeviceBansV4' test.out

#- 283 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "DTkoY3dK", "deviceId": "kkeE6vby", "deviceType": "xhevLT9o", "enabled": true, "endDate": "eIsyEQcG", "ext": {"nzadYhG5": {}, "WpEL3abH": {}, "jaAgwPCR": {}}, "reason": "Ve2UJzId"}' \
    > test.out 2>&1
eval_tap $? 283 'AdminBanDeviceV4' test.out

#- 284 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId '5fgzNHYV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'AdminGetDeviceBanV4' test.out

#- 285 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'iufCJIrY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 285 'AdminUpdateDeviceBanV4' test.out

#- 286 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'yCdOAE8V' \
    --startDate '4NOogOep' \
    --deviceType 'nUIaSrId' \
    > test.out 2>&1
eval_tap $? 286 'AdminGenerateReportV4' test.out

#- 287 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 287 'AdminGetDeviceTypesV4' test.out

#- 288 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'dmifMwmv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 288 'AdminGetDeviceBansV4' test.out

#- 289 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'po7XiOpj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 289 'AdminDecryptDeviceV4' test.out

#- 290 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'ZZe2wImi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'AdminUnbanDeviceV4' test.out

#- 291 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'Y8nSFBMt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'AdminGetUsersByDeviceV4' test.out

#- 292 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 97}' \
    > test.out 2>&1
eval_tap $? 292 'AdminCreateTestUsersV4' test.out

#- 293 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["oa5sbm7h", "ifbMb8YX", "tVZJ6RMD"]}' \
    > test.out 2>&1
eval_tap $? 293 'AdminBulkCheckValidUserIDV4' test.out

#- 294 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZWJTgJ4b' \
    --body '{"avatarUrl": "jnBxnDF2", "country": "qLPiBLVm", "dateOfBirth": "hUjHiMjG", "displayName": "yJ4XNPZr", "languageTag": "EQgz9zBd", "userName": "Lh4Akyml"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminUpdateUserV4' test.out

#- 295 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ADwbJowI' \
    --body '{"code": "O8Olqg8d", "emailAddress": "RnO16HWO"}' \
    > test.out 2>&1
eval_tap $? 295 'AdminUpdateUserEmailAddressV4' test.out

#- 296 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '9VxvOKS0' \
    > test.out 2>&1
eval_tap $? 296 'AdminDisableUserMFAV4' test.out

#- 297 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zLiMefKZ' \
    > test.out 2>&1
eval_tap $? 297 'AdminListUserRolesV4' test.out

#- 298 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'r9bUlLXn' \
    --body '{"assignedNamespaces": ["ifiFV8Ss", "DqupmYYm", "SPkkcKB2"], "roleId": "3N0KvaMz"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateUserRoleV4' test.out

#- 299 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MB25npPp' \
    --body '{"assignedNamespaces": ["TXhncVG7", "87WbaYO9", "hcbR7R9G"], "roleId": "HNjAxY56"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminAddUserRoleV4' test.out

#- 300 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TpTomtZd' \
    --body '{"assignedNamespaces": ["gKbZEq2J", "KJnBiy0F", "0Z3N6Ade"], "roleId": "LGRvrQ6m"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminRemoveUserRoleV4' test.out

#- 301 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '48' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 301 'AdminGetRolesV4' test.out

#- 302 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "9eXxbZeL"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminCreateRoleV4' test.out

#- 303 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'iYkIzP3H' \
    > test.out 2>&1
eval_tap $? 303 'AdminGetRoleV4' test.out

#- 304 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'EHRQtsde' \
    > test.out 2>&1
eval_tap $? 304 'AdminDeleteRoleV4' test.out

#- 305 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'F7RI5XGb' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "zWOLgTqE"}' \
    > test.out 2>&1
eval_tap $? 305 'AdminUpdateRoleV4' test.out

#- 306 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId '67sOcdJD' \
    --body '{"permissions": [{"action": 22, "resource": "7Gm8rY5q", "schedAction": 2, "schedCron": "vRj0E4Qw", "schedRange": ["bYcGiEwC", "RoXEbjsW", "whGy65mh"]}, {"action": 54, "resource": "wbPUu1AV", "schedAction": 32, "schedCron": "9cKAGjKj", "schedRange": ["lebp7ckg", "aFT6PukJ", "XTF6e2gg"]}, {"action": 63, "resource": "RRKPSs4b", "schedAction": 53, "schedCron": "ZZeMnWEz", "schedRange": ["BQh000nu", "KX99XRMK", "m66QsF4f"]}]}' \
    > test.out 2>&1
eval_tap $? 306 'AdminUpdateRolePermissionsV4' test.out

#- 307 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId '3OBflRf6' \
    --body '{"permissions": [{"action": 36, "resource": "PSHz7zAx", "schedAction": 37, "schedCron": "oIROKnqb", "schedRange": ["BCQTuB9D", "7BTY43YZ", "kGFaGp9l"]}, {"action": 76, "resource": "6xjK15eD", "schedAction": 89, "schedCron": "7NoXzR11", "schedRange": ["KrVgVxSE", "JDM9Mjdf", "yHRXxh20"]}, {"action": 18, "resource": "Hj6UXA5u", "schedAction": 23, "schedCron": "k3Nkj1Tt", "schedRange": ["b33rllpt", "ORMxjVUZ", "fKdFxxqW"]}]}' \
    > test.out 2>&1
eval_tap $? 307 'AdminAddRolePermissionsV4' test.out

#- 308 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'fjqYyQ3a' \
    --body '["Ilkd8ccX", "IkqHdheJ", "iJTr5mGn"]' \
    > test.out 2>&1
eval_tap $? 308 'AdminDeleteRolePermissionsV4' test.out

#- 309 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'W17uH4gB' \
    --after 'BuFxOzOr' \
    --before 'uqohv5mx' \
    --limit '75' \
    > test.out 2>&1
eval_tap $? 309 'AdminListAssignedUsersV4' test.out

#- 310 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'esI2N1YD' \
    --body '{"assignedNamespaces": ["VN3APp1L", "WWx2HmRK", "V9rtyBh3"], "namespace": "9Yh5ibp7", "userId": "eZxK3cVD"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminAssignUserToRoleV4' test.out

#- 311 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'ySkeoL2o' \
    --body '{"namespace": "cXQj2ud1", "userId": "5PZeV2el"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminRevokeUserFromRoleV4' test.out

#- 312 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "k0yUrVRA", "country": "6yu6WMhT", "dateOfBirth": "RIh7XATB", "displayName": "mi07a24I", "languageTag": "7I8JbOdN", "userName": "0Dwn3JAo"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateMyUserV4' test.out

#- 313 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 313 'AdminDisableMyAuthenticatorV4' test.out

#- 314 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'CdQ6pDFq' \
    > test.out 2>&1
eval_tap $? 314 'AdminEnableMyAuthenticatorV4' test.out

#- 315 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 315 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 316 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 316 'AdminGetMyBackupCodesV4' test.out

#- 317 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 317 'AdminGenerateMyBackupCodesV4' test.out

#- 318 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 318 'AdminDisableMyBackupCodesV4' test.out

#- 319 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 319 'AdminDownloadMyBackupCodesV4' test.out

#- 320 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 320 'AdminEnableMyBackupCodesV4' test.out

#- 321 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 321 'AdminSendMyMFAEmailCodeV4' test.out

#- 322 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 322 'AdminDisableMyEmailV4' test.out

#- 323 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'sUXwNM3U' \
    > test.out 2>&1
eval_tap $? 323 'AdminEnableMyEmailV4' test.out

#- 324 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 324 'AdminGetMyEnabledFactorsV4' test.out

#- 325 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor '9BiMldlF' \
    > test.out 2>&1
eval_tap $? 325 'AdminMakeFactorMyDefaultV4' test.out

#- 326 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["tmFgUSV8", "ad4axKjs", "qL9l3CYs"], "emailAddresses": ["vzwAKCJs", "zJLkscXz", "YL8cFT4V"], "isAdmin": false, "namespace": "AdIcE6Mj", "roleId": "z0IS2JKU"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminInviteUserV4' test.out

#- 327 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "yYKFZTi1", "policyId": "pMVi1FMl", "policyVersionId": "wdQ8gseh"}, {"isAccepted": true, "localizedPolicyVersionId": "bcqydEsn", "policyId": "PCsGN58w", "policyVersionId": "UbJMi8gr"}, {"isAccepted": true, "localizedPolicyVersionId": "oo1rkSEA", "policyId": "lqQc0SW2", "policyVersionId": "kv77Me2E"}], "authType": "EMAILPASSWD", "country": "nl9RVSyt", "dateOfBirth": "CmxLaSMt", "displayName": "YWqL1rJF", "emailAddress": "NkXXEsAa", "password": "d1ZSAFLH", "passwordMD5Sum": "lPDRgAjM", "username": "wbpVs8H2", "verified": false}' \
    > test.out 2>&1
eval_tap $? 327 'PublicCreateTestUserV4' test.out

#- 328 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "f0LAUJTq", "policyId": "BfHAddXP", "policyVersionId": "pxeZm7Od"}, {"isAccepted": false, "localizedPolicyVersionId": "MtsFm9eS", "policyId": "MGW7nFSe", "policyVersionId": "G9sYxYaG"}, {"isAccepted": true, "localizedPolicyVersionId": "D28PvfiW", "policyId": "EcltqJsR", "policyVersionId": "UIUaNw3M"}], "authType": "EMAILPASSWD", "code": "r0oMka3e", "country": "lJeHgIwR", "dateOfBirth": "qBa87kX9", "displayName": "zJdleylu", "emailAddress": "tRh565w0", "password": "e4l1qICB", "passwordMD5Sum": "xc5apBFi", "reachMinimumAge": true, "username": "ZTbEJd6A"}' \
    > test.out 2>&1
eval_tap $? 328 'PublicCreateUserV4' test.out

#- 329 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'RAwO1e8O' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "KJ8urXUM", "policyId": "21qIvGEI", "policyVersionId": "71BbT94P"}, {"isAccepted": true, "localizedPolicyVersionId": "J1en3IpG", "policyId": "zAxaTVq7", "policyVersionId": "E55Gj5ab"}, {"isAccepted": true, "localizedPolicyVersionId": "HPPLy9se", "policyId": "ldOdNuh2", "policyVersionId": "Rlygl3A8"}], "authType": "EMAILPASSWD", "country": "k0xGdfCj", "dateOfBirth": "sHmY9Zlk", "displayName": "lKkOXOxh", "password": "6nkyXuvT", "reachMinimumAge": false, "username": "AmsgtlZv"}' \
    > test.out 2>&1
eval_tap $? 329 'CreateUserFromInvitationV4' test.out

#- 330 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "jdXZd187", "country": "Q10uZ5VO", "dateOfBirth": "1C9rxRw0", "displayName": "IGaoGSZB", "languageTag": "Fga0dl9v", "userName": "pOCU4ros"}' \
    > test.out 2>&1
eval_tap $? 330 'PublicUpdateUserV4' test.out

#- 331 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "7K5hyVQh", "emailAddress": "j5OBPw9Q"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicUpdateUserEmailAddressV4' test.out

#- 332 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "vD2IuYKa", "country": "SAH9dBWr", "dateOfBirth": "RZ2Rlrab", "displayName": "hcSRHgPr", "emailAddress": "EaM8RXrX", "password": "EZdVflKC", "reachMinimumAge": false, "username": "oWwNom2W", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 332 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 333 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "IEwL2A4M", "password": "30RlOSoJ", "username": "EotlgXn6"}' \
    > test.out 2>&1
eval_tap $? 333 'PublicUpgradeHeadlessAccountV4' test.out

#- 334 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 334 'PublicDisableMyAuthenticatorV4' test.out

#- 335 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code '65ELPjOS' \
    > test.out 2>&1
eval_tap $? 335 'PublicEnableMyAuthenticatorV4' test.out

#- 336 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 336 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 337 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 337 'PublicGetMyBackupCodesV4' test.out

#- 338 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 338 'PublicGenerateMyBackupCodesV4' test.out

#- 339 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 339 'PublicDisableMyBackupCodesV4' test.out

#- 340 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 340 'PublicDownloadMyBackupCodesV4' test.out

#- 341 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 341 'PublicEnableMyBackupCodesV4' test.out

#- 342 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'p2yp65cl' \
    > test.out 2>&1
eval_tap $? 342 'PublicRemoveTrustedDeviceV4' test.out

#- 343 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 343 'PublicSendMyMFAEmailCodeV4' test.out

#- 344 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 344 'PublicDisableMyEmailV4' test.out

#- 345 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'vPu435SI' \
    > test.out 2>&1
eval_tap $? 345 'PublicEnableMyEmailV4' test.out

#- 346 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'PublicGetMyEnabledFactorsV4' test.out

#- 347 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor '1y174odW' \
    > test.out 2>&1
eval_tap $? 347 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE