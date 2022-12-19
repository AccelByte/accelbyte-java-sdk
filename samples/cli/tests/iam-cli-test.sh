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
    --body '[{"field": "9r4HC23Z", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "blockedWord": ["jjBfFmbs", "dugzvgl8", "QatcCeZo"], "description": [{"language": "JRy2fmBr", "message": ["1q1pgAjk", "fY6F9LES", "dovxrX7t"]}, {"language": "g23V2w52", "message": ["8JD3phwU", "cyjvC9b8", "UBrLm1Yt"]}, {"language": "KzliniHT", "message": ["55QXPy5K", "GBAogmR8", "cwpBtbO6"]}], "isCustomRegex": false, "letterCase": "nopjvfjm", "maxLength": 37, "maxRepeatingAlphaNum": 51, "maxRepeatingSpecialCharacter": 70, "minCharType": 93, "minLength": 0, "regex": "T0oEqd9V", "specialCharacterLocation": "IHRfkHRn", "specialCharacters": ["PzlSfGkt", "qmGktmtu", "Y4ToA0v1"]}}, {"field": "3MRpeWco", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "blockedWord": ["nR4bO6Qb", "we7sX85m", "PJxTeRMw"], "description": [{"language": "woHeIjA0", "message": ["yHMzVWfY", "R4Fqcy8G", "rWUt5oXM"]}, {"language": "2KJouuqK", "message": ["IavEorYc", "KLoelMAc", "RYV1ISms"]}, {"language": "rafAfGHL", "message": ["FHGoPLWK", "qdZDsgS9", "YkP8Oc51"]}], "isCustomRegex": true, "letterCase": "nBpAfpGj", "maxLength": 6, "maxRepeatingAlphaNum": 56, "maxRepeatingSpecialCharacter": 98, "minCharType": 66, "minLength": 4, "regex": "Fy8wU6yv", "specialCharacterLocation": "jZDiUlEM", "specialCharacters": ["ncYAuYKR", "NFb3vARg", "ZI70rKgQ"]}}, {"field": "twzKu7EU", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "blockedWord": ["Y0ynOZmu", "noyRcirk", "NpCsbZIq"], "description": [{"language": "Au576Wv8", "message": ["WuxHJzo7", "VWCaxdcS", "BPjRhX5d"]}, {"language": "6IhOBskS", "message": ["qVAL8IK0", "0zgP4kxA", "jyZ7Rcqh"]}, {"language": "CSu8ggIC", "message": ["QpRlclPQ", "4Ujo3SkV", "NVCGHMhz"]}], "isCustomRegex": true, "letterCase": "vmie7fVH", "maxLength": 77, "maxRepeatingAlphaNum": 30, "maxRepeatingSpecialCharacter": 43, "minCharType": 97, "minLength": 26, "regex": "Ft5X2hJd", "specialCharacterLocation": "vXew2PrQ", "specialCharacters": ["vlfCDojY", "YHU8UwrZ", "lnVUjtbA"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'e5cNfwff' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'rQOyoSFw' \
    --before 'J8NEt0TQ' \
    --limit '88' \
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
    --body '{"ageRestriction": 16, "enable": true}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'ohNFsYsM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 81}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'jZOqVpO3' \
    --limit '59' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "GujpTJjb", "comment": "eNEXxg7u", "endDate": "PXIjyD56", "reason": "IqcCCYas", "skipNotif": true, "userIds": ["Gz2Zs3Hf", "S9AADBDS", "8J88AnwW"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "zLfIlIpH", "userId": "X1CxgTuc"}, {"banId": "juJU0RTr", "userId": "wV7NktbL"}, {"banId": "iXJHQiI6", "userId": "gHTMwHTI"}]}' \
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
    --clientId '7j1TQAdW' \
    --clientName 'uOb0FfOJ' \
    --clientType 'DlHFY2l7' \
    --limit '80' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["SnYDET8c", "tcFjhCcI", "wmbD4Qhl"], "baseUri": "P8098C9u", "clientId": "WE6OREPm", "clientName": "2wzK1loL", "clientPermissions": [{"action": 90, "resource": "3yCsi4DT", "schedAction": 60, "schedCron": "kYwbeMhK", "schedRange": ["hx75QcpT", "KJcxdXd1", "EjGOz5GG"]}, {"action": 92, "resource": "obyoFR9G", "schedAction": 62, "schedCron": "WsW1Z0I0", "schedRange": ["4GIv9pwU", "Qm91nRI5", "YN0ulhdN"]}, {"action": 11, "resource": "eIkYgUI7", "schedAction": 97, "schedCron": "OEh5EEpl", "schedRange": ["nDRxbEkn", "EiAJe3cL", "0fD5SbA0"]}], "clientPlatform": "yNbXGH7D", "deletable": false, "description": "Xz8kLSHz", "namespace": "7QFAK0XG", "oauthAccessTokenExpiration": 19, "oauthAccessTokenExpirationTimeUnit": "sAZOVdnV", "oauthClientType": "xoQPDRnd", "oauthRefreshTokenExpiration": 56, "oauthRefreshTokenExpirationTimeUnit": "SMO0pBhp", "redirectUri": "AJBrYxEQ", "scopes": ["11CeiBsv", "PJHuzkmA", "cQwQORwk"], "secret": "naVddOhE", "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'vLOnrjtm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'afJvgjMU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId '64NBsFwh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["U79GUpNe", "NOv06v0N", "kTL68IKC"], "baseUri": "dTey06VC", "clientName": "oWUgfsUq", "clientPermissions": [{"action": 8, "resource": "2CA0Bvrg", "schedAction": 41, "schedCron": "Wx8raIPD", "schedRange": ["TzK7xXIu", "SrMw4Vti", "ei1OYOyL"]}, {"action": 98, "resource": "gYLiMcQS", "schedAction": 8, "schedCron": "ev8iUOAT", "schedRange": ["MEuBmltJ", "2WvzFZC8", "9zJIW7rR"]}, {"action": 21, "resource": "jTWv3wAw", "schedAction": 48, "schedCron": "vIoJoeW4", "schedRange": ["gIcsvyHX", "Z5LHpqEh", "ClbhCloq"]}], "clientPlatform": "HZMkexow", "deletable": true, "description": "koELmj9x", "namespace": "4F9rb6sF", "oauthAccessTokenExpiration": 53, "oauthAccessTokenExpirationTimeUnit": "x0eAbX79", "oauthRefreshTokenExpiration": 80, "oauthRefreshTokenExpirationTimeUnit": "qU3BSsWU", "redirectUri": "W2aZ4za4", "scopes": ["UO7KfTFB", "tLgjtSvP", "GmsyB8iq"], "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'MVkGYlZe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 47, "resource": "YgV5635l"}, {"action": 82, "resource": "SlawdDDE"}, {"action": 85, "resource": "DIR7U2ZB"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'VW5Wtuvz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 22, "resource": "hYAqOi1K"}, {"action": 78, "resource": "zINkjpA6"}, {"action": 22, "resource": "k0pRHM7C"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '16' \
    --clientId 'G44Jiw3y' \
    --namespace "$AB_NAMESPACE" \
    --resource 'u4RfcFf0' \
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
    --limit '8' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZpJA6tfz' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1SYOynA9' \
    --body '{"ACSURL": "1PUgVxtn", "AWSCognitoRegion": "dL7dR6jq", "AWSCognitoUserPool": "aTgGbyTI", "AllowedClients": ["DUMDhX6h", "FSNq7woc", "NkST28al"], "AppId": "TkoqTVlA", "AuthorizationEndpoint": "wAVfMtFr", "ClientId": "b6tVFh6H", "Environment": "cV5Siq7C", "FederationMetadataURL": "L5odRgif", "GenericOauthFlow": false, "IsActive": false, "Issuer": "H1AP95bj", "JWKSEndpoint": "V00J7UQH", "KeyID": "5n6iPo1N", "NetflixCertificates": {"encryptedPrivateKey": "dwEVkjV1", "encryptedPrivateKeyName": "DEKdPVFN", "publicCertificate": "HFiuvRXU", "publicCertificateName": "ZnzmqAn2", "rootCertificate": "qvMVGqd7", "rootCertificateName": "FAwE5n8Y"}, "OrganizationId": "jvjf8K9k", "PlatformName": "pAimRZYj", "RedirectUri": "IpIOxj6X", "RegisteredDomains": [{"affectedClientIDs": ["gOBO8jUo", "QGdfyhKs", "bFU9nAQA"], "domain": "DK62RkFZ", "namespaces": ["Cq0JkYau", "bp7G7yt7", "wv1S65Tc"], "roleId": "AS4ay5j5"}, {"affectedClientIDs": ["JlUKHwY1", "Gilq40KO", "eGmpZsli"], "domain": "8fIV0Emq", "namespaces": ["PIHjq4Q9", "QAstA8uL", "lsD60BPI"], "roleId": "QirAA3sa"}, {"affectedClientIDs": ["b4FpEhW5", "h2XMPjvp", "eq9u3dFw"], "domain": "vHcTWaWQ", "namespaces": ["bx92oYLb", "dKOfBCih", "2YzA1296"], "roleId": "4TZ0Yo4K"}], "Secret": "l698IGXr", "TeamID": "Lk72pzHc", "TokenAuthenticationType": "uMqMJftH", "TokenClaimsMapping": {"hCXpf28j": "zAWnAHyO", "m54gLgg7": "RIrEUNVA", "LbPKLXiC": "hPC8jgtz"}, "TokenEndpoint": "SMktNI80", "scopes": ["16pKdPXY", "UQ6nprFM", "FNW4YP7u"]}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'x006TI35' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5giUk116' \
    --body '{"ACSURL": "8W3AIQPN", "AWSCognitoRegion": "nUkPg27A", "AWSCognitoUserPool": "p8DBr943", "AllowedClients": ["68V0MrNp", "CYFIwZID", "4CKDdFSg"], "AppId": "7UrcWMcY", "AuthorizationEndpoint": "eDenpEtH", "ClientId": "qZNs2h6O", "Environment": "Jk0EpZ4U", "FederationMetadataURL": "VTUexOJB", "GenericOauthFlow": false, "IsActive": true, "Issuer": "EKg4IvKO", "JWKSEndpoint": "d1HMhaU8", "KeyID": "uPwTJuHc", "NetflixCertificates": {"encryptedPrivateKey": "HyPaZ0Ab", "encryptedPrivateKeyName": "StPOZZx5", "publicCertificate": "0O12Fsds", "publicCertificateName": "csAP9rSw", "rootCertificate": "1RMOl2dz", "rootCertificateName": "8Ze8yTbv"}, "OrganizationId": "wzbDSdHL", "PlatformName": "9P1U0dvd", "RedirectUri": "Ge1Zwwn3", "RegisteredDomains": [{"affectedClientIDs": ["6aQjedZ9", "Yj8CLgmE", "nmX6lPkK"], "domain": "3EhLVo64", "namespaces": ["CzruyFnI", "O5XQYlQD", "euy1cppx"], "roleId": "QfVTE5DO"}, {"affectedClientIDs": ["cU54K3ij", "IlRaeU7x", "4derRkAw"], "domain": "d6WZAe01", "namespaces": ["MkY2tUkB", "r0h93sPC", "2AIMWCAW"], "roleId": "Reynz1i8"}, {"affectedClientIDs": ["0uFY4VA7", "6uQBpS8T", "wI6ZTNAm"], "domain": "u88Sw68w", "namespaces": ["aS91KjGK", "l6QErYi4", "QPzuWdBu"], "roleId": "2uBYVcid"}], "Secret": "bHffRxUx", "TeamID": "zRR5sfdl", "TokenAuthenticationType": "ndlNeITm", "TokenClaimsMapping": {"SbklhgYI": "u3KrN2Bn", "YfZ492XP": "N1NREL74", "dsZ23GLi": "z1P73v22"}, "TokenEndpoint": "Qn5kkuIU", "scopes": ["U8dXARnQ", "CAvlwa3d", "rLwLr7BI"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'q1ZHu5Ju' \
    --body '{"affectedClientIDs": ["s5W88vQt", "x461KeIR", "BY4Dbi4m"], "assignedNamespaces": ["8bvR1FKW", "GT45hEck", "oRtJ47KQ"], "domain": "8QwFvaOX", "roleId": "3za9GazW"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ufjZOEWr' \
    --body '{"domain": "6zdYkb1n"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'k4o9PTTx' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bp0QQTmU' \
    --body '{"acsUrl": "4EaqnuHN", "apiKey": "sYRuB1ko", "appId": "XzJcH0qS", "federationMetadataUrl": "l8PAAj5l", "isActive": false, "redirectUri": "B5ly0oo5", "secret": "rr4iBf9Y", "ssoUrl": "J7w41wR8"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3uyl2BU7' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KO0oe6aY' \
    --body '{"acsUrl": "9ic1S7Ug", "apiKey": "HQ05Dt3u", "appId": "zBb87T7b", "federationMetadataUrl": "GP26fouh", "isActive": true, "redirectUri": "x0AyUIPZ", "secret": "HrJ1KKLS", "ssoUrl": "DyFqwhTt"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vXZBwKfx' \
    --platformUserId 'xJgBQrTC' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'l87Ffu98' \
    --after '92' \
    --before '9' \
    --limit '40' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'PpWRGLdj' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["X6vfQLS4", "S82NIlSv", "W7ClVxvm"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["P2sqcDTK", "4g5MZ0oa", "ecZqwRgx"], "isAdmin": false, "roles": ["7r5sWc9X", "IVTaXRmK", "ao8XwAuP"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '41' \
    --platformUserId 'oUnTfMdv' \
    --platformId 'SxLUrnkH' \
    > test.out 2>&1
eval_tap $? 146 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 147 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 147 'AdminListUsersV3' test.out

#- 148 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'tM0dIQa7' \
    --endDate '8vGjp1W7' \
    --limit '89' \
    --offset '28' \
    --platformBy '4wauT9AN' \
    --platformId 'PCRZ2kSk' \
    --query '69nHg8x6' \
    --startDate '6ntALYYa' \
    > test.out 2>&1
eval_tap $? 148 'AdminSearchUserV3' test.out

#- 149 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["ZrbHa9zz", "Bpzmvaxd", "S61ddLDP"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetBulkUserByEmailAddressV3' test.out

#- 150 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9PpGgiA9' \
    > test.out 2>&1
eval_tap $? 150 'AdminGetUserByUserIdV3' test.out

#- 151 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4PeJ2bJd' \
    --body '{"avatarUrl": "iJWEIeDy", "country": "iOwTItVY", "dateOfBirth": "0ERCyjNn", "displayName": "qi1uAG4d", "languageTag": "wn1UhWk4", "userName": "VZvZDUBT"}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserV3' test.out

#- 152 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vlUZjpmm' \
    --activeOnly  \
    --after 'dEEgd1Yx' \
    --before 'bgECVTa3' \
    --limit '73' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetUserBanV3' test.out

#- 153 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'C3zvg4Y1' \
    --body '{"ban": "nU8XuWIz", "comment": "vrlIVXWK", "endDate": "fNhQJ3uQ", "reason": "On6xoXHC", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 153 'AdminBanUserV3' test.out

#- 154 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'zTJ0YYAe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b6kC2Cmd' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 154 'AdminUpdateUserBanV3' test.out

#- 155 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BJStcm9B' \
    --body '{"context": "2uwk1kbO", "emailAddress": "fmXLTYiH", "languageTag": "BfR90PrL"}' \
    > test.out 2>&1
eval_tap $? 155 'AdminSendVerificationCodeV3' test.out

#- 156 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GUGhto1o' \
    --body '{"Code": "KvqeY4yU", "ContactType": "kJ48GRqq", "LanguageTag": "4uOqNzO0", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 156 'AdminVerifyAccountV3' test.out

#- 157 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'GRUDdWaE' \
    > test.out 2>&1
eval_tap $? 157 'GetUserVerificationCode' test.out

#- 158 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DfxGJZhV' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserDeletionStatusV3' test.out

#- 159 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vnMsluon' \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpdateUserDeletionStatusV3' test.out

#- 160 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RWVkmpif' \
    --body '{"code": "VCmehxrt", "country": "Hu3tsJSZ", "dateOfBirth": "lTYSMNG7", "displayName": "YzhQVKZs", "emailAddress": "IV01Guem", "password": "tOWZqQIM", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpgradeHeadlessAccountV3' test.out

#- 161 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IZg9kmnx' \
    > test.out 2>&1
eval_tap $? 161 'AdminDeleteUserInformationV3' test.out

#- 162 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OUZkA5El' \
    --after '0.39192210410149875' \
    --before '0.5540666295531501' \
    --limit '70' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetUserLoginHistoriesV3' test.out

#- 163 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8FZ56rRd' \
    --body '{"languageTag": "GbtaSqnk", "newPassword": "bA4u9LeH", "oldPassword": "SBq39ZEF"}' \
    > test.out 2>&1
eval_tap $? 163 'AdminResetPasswordV3' test.out

#- 164 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'em9f2p11' \
    --body '{"Permissions": [{"Action": 95, "Resource": "E0AgSDIe", "SchedAction": 56, "SchedCron": "6srRWPmO", "SchedRange": ["6m83V9Lp", "Yc1cMjgV", "DBFgVGsB"]}, {"Action": 2, "Resource": "saaQMvOV", "SchedAction": 8, "SchedCron": "pe1U7RMw", "SchedRange": ["QFWUfJzA", "h7EVT9C2", "rZtREJlU"]}, {"Action": 17, "Resource": "jFwq3W1q", "SchedAction": 97, "SchedCron": "VbAWolL0", "SchedRange": ["VYBOIIqE", "TRy5qKri", "cqvRKLg0"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserPermissionV3' test.out

#- 165 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SrBLvMy4' \
    --body '{"Permissions": [{"Action": 89, "Resource": "s1i3XzYf", "SchedAction": 100, "SchedCron": "IsWXl6Qo", "SchedRange": ["wAUzlIf1", "VUNy6Wm2", "5sGRMXg7"]}, {"Action": 35, "Resource": "6JDKwiMN", "SchedAction": 56, "SchedCron": "5dB5Ij0A", "SchedRange": ["ksXLedK9", "QZcMcdQe", "5YXOEOcn"]}, {"Action": 90, "Resource": "2C8gweR4", "SchedAction": 74, "SchedCron": "VfpezRk8", "SchedRange": ["1HRKapjS", "t9G4zU6j", "88Axc0A7"]}]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminAddUserPermissionsV3' test.out

#- 166 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yRtKfw5Y' \
    --body '[{"Action": 72, "Resource": "nLb4emAF"}, {"Action": 50, "Resource": "kIZ9RYgG"}, {"Action": 79, "Resource": "yaW33mFl"}]' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionBulkV3' test.out

#- 167 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '78' \
    --namespace "$AB_NAMESPACE" \
    --resource 'VWkBOZAl' \
    --userId 'QeLrDVMi' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserPermissionV3' test.out

#- 168 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jHVyibMB' \
    --after 'SVjl2XsV' \
    --before 'VcebHgih' \
    --limit '57' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserPlatformAccountsV3' test.out

#- 169 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'jkNegcaq' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetListJusticePlatformAccounts' test.out

#- 170 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'inXdjljq' \
    --userId 'wK713GVq' \
    > test.out 2>&1
eval_tap $? 170 'AdminGetUserMapping' test.out

#- 171 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'ajWbmMWO' \
    --userId 'jOyKuKqQ' \
    > test.out 2>&1
eval_tap $? 171 'AdminCreateJusticeUser' test.out

#- 172 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'CXKlLR31' \
    --body '{"platformId": "zMlT8S9P", "platformUserId": "mQ0JSDdl"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminLinkPlatformAccount' test.out

#- 173 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SM7e0255' \
    --userId '0l2gSrCd' \
    --body '{"platformNamespace": "5qU1R6Od"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformUnlinkV3' test.out

#- 174 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fhMvYvkD' \
    --userId 'ZjsmGggF' \
    --ticket 'AbkuUlD1' \
    > test.out 2>&1
eval_tap $? 174 'AdminPlatformLinkV3' test.out

#- 175 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hel7ACIT' \
    --userId 'MZMsMkfC' \
    --platformToken 'VtBZnTH8' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 176 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9PdZ7rrp' \
    --body '["4C0x4i8l", "Jts55PCI", "28ybZDfx"]' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserRolesV3' test.out

#- 177 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GN8DGLC3' \
    --body '[{"namespace": "hOPW8g5Z", "roleId": "8X91iPUV"}, {"namespace": "NghY2D3V", "roleId": "wiXGAaGR"}, {"namespace": "XqPG5RR0", "roleId": "RQVm3tWU"}]' \
    > test.out 2>&1
eval_tap $? 177 'AdminSaveUserRoleV3' test.out

#- 178 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'Eiw853gd' \
    --userId 'M9b17pTs' \
    > test.out 2>&1
eval_tap $? 178 'AdminAddUserRoleV3' test.out

#- 179 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '3J5zuVi2' \
    --userId '6nqoyY32' \
    > test.out 2>&1
eval_tap $? 179 'AdminDeleteUserRoleV3' test.out

#- 180 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FJIqtOaD' \
    --body '{"enabled": false, "reason": "SoMaW8j1"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateUserStatusV3' test.out

#- 181 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'u8ScAPbO' \
    > test.out 2>&1
eval_tap $? 181 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 182 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'o9AUiunk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "Y0AkTJs8"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateClientSecretV3' test.out

#- 183 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'wRAn9xo3' \
    --before 'bk9dpz0d' \
    --isWildcard  \
    --limit '76' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRolesV3' test.out

#- 184 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "managers": [{"displayName": "k7xWk7dc", "namespace": "XmNycEkv", "userId": "6VKBP9d5"}, {"displayName": "tQkKxrKr", "namespace": "w65oQN2w", "userId": "RHGd2bAe"}, {"displayName": "qVVB0fC9", "namespace": "cFM7Gwj8", "userId": "v95OPMiG"}], "members": [{"displayName": "jOdBR0nd", "namespace": "9yUsu9M4", "userId": "Geh57Xjr"}, {"displayName": "2q3ndqMm", "namespace": "ZdlqBm9u", "userId": "tIAGgfJo"}, {"displayName": "mfLMJILi", "namespace": "iGeZSYVL", "userId": "WcwI0mFK"}], "permissions": [{"action": 85, "resource": "gChJ6aRP", "schedAction": 73, "schedCron": "WmaWSOmw", "schedRange": ["NgDV8Okh", "ANVAud6g", "M7ch3OmE"]}, {"action": 31, "resource": "5J83x9tp", "schedAction": 60, "schedCron": "GpAwMGj5", "schedRange": ["x9nFfir5", "ZDPEwwOV", "zfZ0HxXs"]}, {"action": 85, "resource": "jPxRJkWl", "schedAction": 62, "schedCron": "AkBYEdGP", "schedRange": ["dkt0Nqyd", "Lpkheb8Q", "LxjKU284"]}], "roleName": "uQn9384n"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminCreateRoleV3' test.out

#- 185 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'wkYp3EPX' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleV3' test.out

#- 186 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'R6IlLhxt' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteRoleV3' test.out

#- 187 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'iPO7AWp2' \
    --body '{"deletable": false, "isWildcard": false, "roleName": "NfiIT2Wv"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateRoleV3' test.out

#- 188 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'btvXXisM' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleAdminStatusV3' test.out

#- 189 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'wzaEOXaG' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpdateAdminRoleStatusV3' test.out

#- 190 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '3jXEberC' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleAdminV3' test.out

#- 191 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'PLVC9jgg' \
    --after '4bO67lCK' \
    --before 'ToWNncR7' \
    --limit '6' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetRoleManagersV3' test.out

#- 192 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'S16sWDgT' \
    --body '{"managers": [{"displayName": "ZXNw8seK", "namespace": "W3j1gq2p", "userId": "ex7Cu4WG"}, {"displayName": "nTqxphuc", "namespace": "UoDzO5rz", "userId": "AqgJ2mTP"}, {"displayName": "dmHrp1CJ", "namespace": "2yONxPba", "userId": "KrRoZjQQ"}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRoleManagersV3' test.out

#- 193 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'PJbwrfPw' \
    --body '{"managers": [{"displayName": "vySCj8X8", "namespace": "2oAVjBnK", "userId": "rMNQFjlx"}, {"displayName": "E8FMM1Zn", "namespace": "FODPPTic", "userId": "miWCpfob"}, {"displayName": "brMt2mQA", "namespace": "yratURw8", "userId": "HEQqVU9n"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminRemoveRoleManagersV3' test.out

#- 194 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'KnTtuE5L' \
    --after 'HTcv18dM' \
    --before 'as7ObY37' \
    --limit '11' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetRoleMembersV3' test.out

#- 195 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'BKJFH3lP' \
    --body '{"members": [{"displayName": "ctGMGnka", "namespace": "7cNVnEfe", "userId": "avAAy7FF"}, {"displayName": "BHyWNLiQ", "namespace": "d1jWQyCG", "userId": "LD80dAbR"}, {"displayName": "oPkcfTY4", "namespace": "fGCd24Dl", "userId": "RrGRfguj"}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddRoleMembersV3' test.out

#- 196 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'qYVgIXXI' \
    --body '{"members": [{"displayName": "uWPTszZI", "namespace": "JdpqWESB", "userId": "qmtr1vXo"}, {"displayName": "gia3LX8Q", "namespace": "eFLsX0mq", "userId": "Sd7Hyqe4"}, {"displayName": "p5GUwwLD", "namespace": "73KqP823", "userId": "sZ7HWViA"}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminRemoveRoleMembersV3' test.out

#- 197 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'vA5teZad' \
    --body '{"permissions": [{"action": 62, "resource": "1EP8kYi6", "schedAction": 34, "schedCron": "jVKPcZMY", "schedRange": ["CMYVOLkm", "Wz9uKbtC", "fqFuNpYL"]}, {"action": 74, "resource": "TG8kaiqg", "schedAction": 52, "schedCron": "HLWF46yq", "schedRange": ["ovRX5FQH", "NS2Y63y1", "5Fi2Rpn8"]}, {"action": 10, "resource": "FbacmpUD", "schedAction": 80, "schedCron": "pVcfTnQS", "schedRange": ["91EbmjSm", "iWEkE8Ta", "lwtykfTS"]}]}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateRolePermissionsV3' test.out

#- 198 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'gSPu1KfC' \
    --body '{"permissions": [{"action": 8, "resource": "luFUSQQV", "schedAction": 84, "schedCron": "zVmmjeg0", "schedRange": ["8b4A7Yqr", "hEMX2fiQ", "SxF7ZBKw"]}, {"action": 54, "resource": "r3o39esN", "schedAction": 45, "schedCron": "2m4rRt6w", "schedRange": ["ejQ2oXIK", "JVFb26X7", "otgU0T1U"]}, {"action": 64, "resource": "g6nypDOg", "schedAction": 16, "schedCron": "plvhT5hh", "schedRange": ["kHsbAFfu", "GPNZ5ckt", "Z0JglfTm"]}]}' \
    > test.out 2>&1
eval_tap $? 198 'AdminAddRolePermissionsV3' test.out

#- 199 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'KXulWQSY' \
    --body '["n8m3uru0", "AeNwL4ql", "chOc2dBk"]' \
    > test.out 2>&1
eval_tap $? 199 'AdminDeleteRolePermissionsV3' test.out

#- 200 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '49' \
    --resource 'xn6n4gzI' \
    --roleId '4U5RTG7G' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteRolePermissionV3' test.out

#- 201 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 201 'AdminGetMyUserV3' test.out

#- 202 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId '7X3q2fsJ' \
    --extendExp  \
    --redirectUri '8mYGzObn' \
    --password 'X7GIZHk1' \
    --requestId 'vRoZF2YW' \
    --userName '1ZAohke3' \
    > test.out 2>&1
eval_tap $? 202 'UserAuthenticationV3' test.out

#- 203 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'nSTzdcHJ' \
    --linkingToken 'tFXvRDYv' \
    --password 'Pib48E0o' \
    --username 'rrtHNCrU' \
    > test.out 2>&1
eval_tap $? 203 'AuthenticationWithPlatformLinkV3' test.out

#- 204 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'ahMqKC4H' \
    > test.out 2>&1
eval_tap $? 204 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 205 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId '3rtaAKue' \
    > test.out 2>&1
eval_tap $? 205 'RequestOneTimeLinkingCodeV3' test.out

#- 206 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'gD1yk3vM' \
    > test.out 2>&1
eval_tap $? 206 'ValidateOneTimeLinkingCodeV3' test.out

#- 207 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --clientId 'OzozFhKN' \
    --oneTimeLinkCode 'ujEKJwL7' \
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
    --clientId 'BekW2QwI' \
    > test.out 2>&1
eval_tap $? 210 'RequestGameTokenCodeResponseV3' test.out

#- 211 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FX9Sf7eM' \
    --userId 'DQqReWaf' \
    > test.out 2>&1
eval_tap $? 211 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 212 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qpRUdGMh' \
    > test.out 2>&1
eval_tap $? 212 'RevokeUserV3' test.out

#- 213 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'CEDfGbdf' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'NZpWR9eq' \
    --redirectUri 'ULYWbgh0' \
    --scope 'xPlPTnlS' \
    --state 'HIrvbm7h' \
    --targetAuthPage 'h76Juenp' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'eRQrtuID' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 213 'AuthorizeV3' test.out

#- 214 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'h2CBWsbZ' \
    > test.out 2>&1
eval_tap $? 214 'TokenIntrospectionV3' test.out

#- 215 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 215 'GetJWKSV3' test.out

#- 216 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId '94AZdwPn' \
    --factor 'u99djxu5' \
    --mfaToken 'lFH6irtu' \
    > test.out 2>&1
eval_tap $? 216 'SendMFAAuthenticationCode' test.out

#- 217 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'fi32l2wj' \
    --mfaToken 'hPs9B6RM' \
    > test.out 2>&1
eval_tap $? 217 'Change2faMethod' test.out

#- 218 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'engoZWYg' \
    --factor 'nLgyudI9' \
    --mfaToken 'MlntDcd2' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 218 'Verify2faCode' test.out

#- 219 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Dge0Qiia' \
    --userId 'qQvbTirD' \
    > test.out 2>&1
eval_tap $? 219 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 220 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId '0WW1FvkL' \
    --clientId 'ofmBOdKn' \
    --redirectUri 'kJ4kekMj' \
    --requestId 'vCI99jHk' \
    > test.out 2>&1
eval_tap $? 220 'AuthCodeRequestV3' test.out

#- 221 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'cABSPxIP' \
    --clientId 'ufPc8zOn' \
    --createHeadless  \
    --deviceId 'IsNA70VX' \
    --macAddress 'cZT0nUZl' \
    --platformToken '4W1H8H8a' \
    > test.out 2>&1
eval_tap $? 221 'PlatformTokenGrantV3' test.out

#- 222 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 222 'GetRevocationListV3' test.out

#- 223 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token '30R24We1' \
    > test.out 2>&1
eval_tap $? 223 'TokenRevocationV3' test.out

#- 224 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId '9L1MISKn' \
    --code 'BhSdBDfr' \
    --codeVerifier 'S7P04Sq9' \
    --extendExp  \
    --password 'bkZNaqLu' \
    --redirectUri 'qFZJ53EY' \
    --refreshToken 'tt5vEjdn' \
    --username 'CgDbMxFC' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 224 'TokenGrantV3' test.out

#- 225 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'kuneEljU' \
    > test.out 2>&1
eval_tap $? 225 'VerifyTokenV3' test.out

#- 226 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'swdB9zP9' \
    --code '8CgNC2Is' \
    --error 'JeByTaxz' \
    --openidAssocHandle 'NrY2bhun' \
    --openidClaimedId 'H1fWErBv' \
    --openidIdentity 'OqS0Kusg' \
    --openidMode '8QyoS9D1' \
    --openidNs 'v2tceJTK' \
    --openidOpEndpoint '2Aa88vuL' \
    --openidResponseNonce 'GeHAr5K0' \
    --openidReturnTo 'wiWE7i1g' \
    --openidSig '8Ul9Sof8' \
    --openidSigned 'zGztXpHg' \
    --state '1R7upl6s' \
    > test.out 2>&1
eval_tap $? 226 'PlatformAuthenticationV3' test.out

#- 227 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode '2mDYpcVY' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetInputValidations' test.out

#- 228 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'P9dH224a' \
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
    --clientId 'JD4Felns' \
    > test.out 2>&1
eval_tap $? 230 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 231 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ed2VEh4j' \
    --body '{"platformUserIds": ["thUluT0X", "IQ8tuW1v", "6frIonFo"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 232 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'y9wTVvqD' \
    --platformUserId 'yca6c4Wn' \
    > test.out 2>&1
eval_tap $? 232 'PublicGetUserByPlatformUserIDV3' test.out

#- 233 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'ql33eIK9' \
    > test.out 2>&1
eval_tap $? 233 'PublicGetAsyncStatus' test.out

#- 234 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'TIaNUoqs' \
    --limit '98' \
    --offset '65' \
    --query 'g6JzHmJV' \
    > test.out 2>&1
eval_tap $? 234 'PublicSearchUserV3' test.out

#- 235 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "9sCdOYlF", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "9tA1Cllr", "policyId": "kElOShk6", "policyVersionId": "pPjH77nQ"}, {"isAccepted": false, "localizedPolicyVersionId": "VTOb7Lh2", "policyId": "xSJet04D", "policyVersionId": "xDgUHvu0"}, {"isAccepted": true, "localizedPolicyVersionId": "rs00fzUX", "policyId": "qSRRIgZM", "policyVersionId": "9hgkfpeq"}], "authType": "skx8n37c", "code": "bU16CzxK", "country": "Iuj1CpY5", "dateOfBirth": "q8xIRZ5E", "displayName": "dni70Aag", "emailAddress": "6niaT0gn", "password": "JWZQ5RRx", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 235 'PublicCreateUserV3' test.out

#- 236 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'YDucfhYd' \
    --query 'ao1j8TIe' \
    > test.out 2>&1
eval_tap $? 236 'CheckUserAvailability' test.out

#- 237 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["2zmzqPWU", "32JvxaIf", "z0swfjw5"]}' \
    > test.out 2>&1
eval_tap $? 237 'PublicBulkGetUsers' test.out

#- 238 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "4wnZnkM7", "languageTag": "UssKF8M4"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicSendRegistrationCode' test.out

#- 239 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "pau56M2y", "emailAddress": "xAcQo4JF"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicVerifyRegistrationCode' test.out

#- 240 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "zD0r7AYH", "languageTag": "LZDJmqDb"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicForgotPasswordV3' test.out

#- 241 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'se7g5ju8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'GetAdminInvitationV3' test.out

#- 242 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'FkFM8dnZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "q24dDi2Z", "policyId": "wkM76ppV", "policyVersionId": "p8ecwDEN"}, {"isAccepted": true, "localizedPolicyVersionId": "kVur3Kyi", "policyId": "FshXZqun", "policyVersionId": "4rEuFSvi"}, {"isAccepted": true, "localizedPolicyVersionId": "KiK7klWR", "policyId": "TlyWI04f", "policyVersionId": "yXqjSb7d"}], "authType": "EMAILPASSWD", "country": "je1WCHP6", "dateOfBirth": "x7IUU8Qw", "displayName": "GHDHBAzx", "password": "BZMp7Lqq", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 242 'CreateUserFromInvitationV3' test.out

#- 243 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "EhPogzFO", "country": "DxeThQ49", "dateOfBirth": "i62trWd2", "displayName": "3jzTOtC8", "languageTag": "5AIAcWCi", "userName": "46Gw7UG2"}' \
    > test.out 2>&1
eval_tap $? 243 'UpdateUserV3' test.out

#- 244 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "BpKLamUU", "country": "u9IO59Wj", "dateOfBirth": "4uosKCSC", "displayName": "V5aiQjTl", "languageTag": "FN9SN5o1", "userName": "vpyFSVb3"}' \
    > test.out 2>&1
eval_tap $? 244 'PublicPartialUpdateUserV3' test.out

#- 245 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "c7OS1kmy", "emailAddress": "vzaHAb9N", "languageTag": "LqE9KxDV"}' \
    > test.out 2>&1
eval_tap $? 245 'PublicSendVerificationCodeV3' test.out

#- 246 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "REwS6sxq", "contactType": "47xNh636", "languageTag": "o9fLo2bX", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 246 'PublicUserVerificationV3' test.out

#- 247 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "V2a9nPo0", "country": "Rv2Hejlp", "dateOfBirth": "UJiIs1ih", "displayName": "HF7ptGZi", "emailAddress": "IgD6nQJZ", "password": "1k4ZT01F", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 247 'PublicUpgradeHeadlessAccountV3' test.out

#- 248 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "p5ulw2LO", "password": "3TeNvPhm"}' \
    > test.out 2>&1
eval_tap $? 248 'PublicVerifyHeadlessAccountV3' test.out

#- 249 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "RDcYlQ1M", "newPassword": "FFd7N92n", "oldPassword": "ysfr9WJ5"}' \
    > test.out 2>&1
eval_tap $? 249 'PublicUpdatePasswordV3' test.out

#- 250 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '0GacdA40' \
    > test.out 2>&1
eval_tap $? 250 'PublicCreateJusticeUser' test.out

#- 251 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wZZY2jNf' \
    --redirectUri 'QmBz1erx' \
    --ticket 'g4YLTEYg' \
    > test.out 2>&1
eval_tap $? 251 'PublicPlatformLinkV3' test.out

#- 252 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OSY4EY6D' \
    --body '{"platformNamespace": "moBkCiWm"}' \
    > test.out 2>&1
eval_tap $? 252 'PublicPlatformUnlinkV3' test.out

#- 253 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kQT2Gzet' \
    > test.out 2>&1
eval_tap $? 253 'PublicPlatformUnlinkAllV3' test.out

#- 254 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'O8cwOcVG' \
    --ticket 'DFRR3YUC' \
    > test.out 2>&1
eval_tap $? 254 'PublicForcePlatformLinkV3' test.out

#- 255 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PyMBmKlZ' \
    --clientId 'q4H2WztQ' \
    --redirectUri 'Hb2Bcabw' \
    > test.out 2>&1
eval_tap $? 255 'PublicWebLinkPlatform' test.out

#- 256 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'b0X62lmi' \
    --state 'bFadEASf' \
    > test.out 2>&1
eval_tap $? 256 'PublicWebLinkPlatformEstablish' test.out

#- 257 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "R9TSmR3y", "emailAddress": "D1VaUR7E", "newPassword": "ZQ0AUtiT"}' \
    > test.out 2>&1
eval_tap $? 257 'ResetPasswordV3' test.out

#- 258 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CZFn2jID' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetUserByUserIdV3' test.out

#- 259 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0hudyy3x' \
    --activeOnly  \
    --after '8FLgI6Tx' \
    --before 'f4PZY0vD' \
    --limit '82' \
    > test.out 2>&1
eval_tap $? 259 'PublicGetUserBanHistoryV3' test.out

#- 260 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MjzHWQJO' \
    > test.out 2>&1
eval_tap $? 260 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 261 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'w2rZudKI' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetUserInformationV3' test.out

#- 262 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zfUkHTQT' \
    --after '0.07765688870433463' \
    --before '0.48950364007035696' \
    --limit '12' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetUserLoginHistoriesV3' test.out

#- 263 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9P2cfEMB' \
    --after '2s0ROzL2' \
    --before 'kjRvHsAH' \
    --limit '89' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetUserPlatformAccountsV3' test.out

#- 264 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kKS0qpoP' \
    > test.out 2>&1
eval_tap $? 264 'PublicListJusticePlatformAccountsV3' test.out

#- 265 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'b6yWRMry' \
    --body '{"platformId": "lo8X96hf", "platformUserId": "Frk1pFf7"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicLinkPlatformAccount' test.out

#- 266 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'kCuENseP' \
    --body '{"chosenNamespaces": ["vBHfgGHN", "cbtBPiuX", "Dc3yGahs"], "requestId": "baJ3uOiG"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicForceLinkPlatformWithProgression' test.out

#- 267 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eCfZ9xrL' \
    > test.out 2>&1
eval_tap $? 267 'PublicGetPublisherUserV3' test.out

#- 268 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rFZVu2Gz' \
    --password 'I9xm6Zdn' \
    > test.out 2>&1
eval_tap $? 268 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 269 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'e1uvtsDB' \
    --before '97FFCMh5' \
    --isWildcard  \
    --limit '100' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetRolesV3' test.out

#- 270 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'sMi0kWEb' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetRoleV3' test.out

#- 271 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 271 'PublicGetMyUserV3' test.out

#- 272 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'kofDkiUx' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 273 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["tv7UhFxj", "ynHTMyyJ", "SUuqGL0v"], "oneTimeLinkCode": "uzv5KjtT"}' \
    > test.out 2>&1
eval_tap $? 273 'LinkHeadlessAccountToMyAccountV3' test.out

#- 274 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "wwX4Ofco"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicSendVerificationLinkV3' test.out

#- 275 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'HJ1I1UY4' \
    > test.out 2>&1
eval_tap $? 275 'PublicVerifyUserByLinkV3' test.out

#- 276 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'qj68AtW2' \
    --code 'DYGlODI7' \
    --error '6lmVVVJa' \
    --state 'VBkIlcgJ' \
    > test.out 2>&1
eval_tap $? 276 'PlatformAuthenticateSAMLV3Handler' test.out

#- 277 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'xDBNMSdJ' \
    --payload 'VItGTIZJ' \
    > test.out 2>&1
eval_tap $? 277 'LoginSSOClient' test.out

#- 278 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'KRbMnK6x' \
    > test.out 2>&1
eval_tap $? 278 'LogoutSSOClient' test.out

#- 279 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'TcvOc3uC' \
    > test.out 2>&1
eval_tap $? 279 'RequestGameTokenResponseV3' test.out

#- 280 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '0Cbh5Ytj' \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDevicesByUserV4' test.out

#- 281 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType '57gyXGan' \
    --endDate 'KBwiqLcD' \
    --limit '58' \
    --offset '12' \
    --startDate 'sz4gZwLm' \
    > test.out 2>&1
eval_tap $? 281 'AdminGetBannedDevicesV4' test.out

#- 282 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nKRFMjxG' \
    > test.out 2>&1
eval_tap $? 282 'AdminGetUserDeviceBansV4' test.out

#- 283 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "7XQ8WXgH", "deviceId": "JUPdXY0N", "deviceType": "xJYVaQ0h", "enabled": true, "endDate": "tvEOE6a5", "ext": {"ECEfZNyB": {}, "8G5thGs6": {}, "rTkZI1gP": {}}, "reason": "GlaVQlbO"}' \
    > test.out 2>&1
eval_tap $? 283 'AdminBanDeviceV4' test.out

#- 284 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'e9CfShRs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'AdminGetDeviceBanV4' test.out

#- 285 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'mzMLgGeQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 285 'AdminUpdateDeviceBanV4' test.out

#- 286 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'WLzcIfWo' \
    --startDate 'vVROqEIo' \
    --deviceType 'RFMfD11G' \
    > test.out 2>&1
eval_tap $? 286 'AdminGenerateReportV4' test.out

#- 287 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 287 'AdminGetDeviceTypesV4' test.out

#- 288 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '50UuRf9F' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 288 'AdminGetDeviceBansV4' test.out

#- 289 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId '6loVcBWd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 289 'AdminDecryptDeviceV4' test.out

#- 290 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId '7gb83Zfy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'AdminUnbanDeviceV4' test.out

#- 291 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'gkDImn0a' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'AdminGetUsersByDeviceV4' test.out

#- 292 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 77}' \
    > test.out 2>&1
eval_tap $? 292 'AdminCreateTestUsersV4' test.out

#- 293 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["kg6hCIWS", "959tz92E", "HZOBeesg"]}' \
    > test.out 2>&1
eval_tap $? 293 'AdminBulkCheckValidUserIDV4' test.out

#- 294 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fCcSI167' \
    --body '{"avatarUrl": "YsGLsM8z", "country": "G52bsIdZ", "dateOfBirth": "KbHaewQ0", "displayName": "Bkca7pVU", "languageTag": "xhBrifTa", "userName": "tjaNKi11"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminUpdateUserV4' test.out

#- 295 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q2rS01qj' \
    --body '{"code": "1KmoMZZN", "emailAddress": "32eUI54v"}' \
    > test.out 2>&1
eval_tap $? 295 'AdminUpdateUserEmailAddressV4' test.out

#- 296 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '4WMOv6IJ' \
    > test.out 2>&1
eval_tap $? 296 'AdminDisableUserMFAV4' test.out

#- 297 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '84Q8bX7u' \
    > test.out 2>&1
eval_tap $? 297 'AdminListUserRolesV4' test.out

#- 298 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gBJXrQb6' \
    --body '{"assignedNamespaces": ["drrYAxCb", "bBowrB8f", "Hp7gVerR"], "roleId": "8Wh4zC9w"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateUserRoleV4' test.out

#- 299 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bCFQ6TKF' \
    --body '{"assignedNamespaces": ["iYVH6vzj", "s9f9z8Bn", "JFhM7FIM"], "roleId": "plKn0ZD1"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminAddUserRoleV4' test.out

#- 300 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BS9Cia0g' \
    --body '{"assignedNamespaces": ["Ayp7xEgK", "2AwbzNnj", "G9iT92nu"], "roleId": "KU1vHyH7"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminRemoveUserRoleV4' test.out

#- 301 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '26' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 301 'AdminGetRolesV4' test.out

#- 302 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "XxiA7v2U"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminCreateRoleV4' test.out

#- 303 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'ZCTdZnwk' \
    > test.out 2>&1
eval_tap $? 303 'AdminGetRoleV4' test.out

#- 304 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'EGMof3sC' \
    > test.out 2>&1
eval_tap $? 304 'AdminDeleteRoleV4' test.out

#- 305 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'OztG6UjQ' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "NtQm5E4u"}' \
    > test.out 2>&1
eval_tap $? 305 'AdminUpdateRoleV4' test.out

#- 306 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId '0iz12fM9' \
    --body '{"permissions": [{"action": 51, "resource": "FilRxSXe", "schedAction": 8, "schedCron": "vdK4OiXC", "schedRange": ["v66SO3gJ", "mZv5UMx3", "Z6Gfvzqo"]}, {"action": 70, "resource": "Iyu4O2u9", "schedAction": 26, "schedCron": "nzAtlQub", "schedRange": ["8S2uqmQ1", "kUnM5PiO", "FHYrJWMJ"]}, {"action": 41, "resource": "EWdkdxWP", "schedAction": 91, "schedCron": "MwwCR64a", "schedRange": ["ggIEwiQK", "7t5jMZ21", "30pr8GT8"]}]}' \
    > test.out 2>&1
eval_tap $? 306 'AdminUpdateRolePermissionsV4' test.out

#- 307 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'vhycFMFj' \
    --body '{"permissions": [{"action": 88, "resource": "Zc5SBF57", "schedAction": 1, "schedCron": "ZQbkhxDS", "schedRange": ["nttNEKXB", "dSfv86EU", "7xCKiV5X"]}, {"action": 24, "resource": "xzgWGkYU", "schedAction": 77, "schedCron": "GuQ0z9IW", "schedRange": ["bETCtglx", "JRM2NZEG", "6psAlY2G"]}, {"action": 16, "resource": "6Yfy8ooC", "schedAction": 85, "schedCron": "wsh5eRNL", "schedRange": ["lyK7gZZD", "CrUg7yke", "atleCZ5v"]}]}' \
    > test.out 2>&1
eval_tap $? 307 'AdminAddRolePermissionsV4' test.out

#- 308 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'QhWWOsrR' \
    --body '["fpaOhiP7", "1mqOr4lc", "lBalq3h0"]' \
    > test.out 2>&1
eval_tap $? 308 'AdminDeleteRolePermissionsV4' test.out

#- 309 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'mM5suYv7' \
    --after '4YOxa74q' \
    --before 'QWEogfQX' \
    --limit '97' \
    > test.out 2>&1
eval_tap $? 309 'AdminListAssignedUsersV4' test.out

#- 310 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'AhOEGn2r' \
    --body '{"assignedNamespaces": ["TLTJGsUm", "hqaovPYn", "ThhPAVdB"], "namespace": "cH2Fo8AH", "userId": "gziMMIuW"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminAssignUserToRoleV4' test.out

#- 311 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId '9IiCBW2P' \
    --body '{"namespace": "0EFnJjcS", "userId": "jsvR4Hfi"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminRevokeUserFromRoleV4' test.out

#- 312 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "OCcFG9g5", "country": "taeLYHXe", "dateOfBirth": "HYOJtMWY", "displayName": "dyKTXoxX", "languageTag": "L81Ap0GC", "userName": "fcW3MT9l"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateMyUserV4' test.out

#- 313 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 313 'AdminDisableMyAuthenticatorV4' test.out

#- 314 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'I3zLiiOB' \
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
    --code 'nIRJ0RqB' \
    > test.out 2>&1
eval_tap $? 323 'AdminEnableMyEmailV4' test.out

#- 324 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 324 'AdminGetMyEnabledFactorsV4' test.out

#- 325 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'E1lggwZT' \
    > test.out 2>&1
eval_tap $? 325 'AdminMakeFactorMyDefaultV4' test.out

#- 326 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["iZWpfIaU", "l55IIxXO", "bEaF85VV"], "emailAddresses": ["ZFeRwJPF", "Hd2v4etg", "qSH3BJ93"], "isAdmin": true, "roleId": "42bGHLhe"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminInviteUserV4' test.out

#- 327 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "KPCSU6su", "policyId": "t5YeQ0yw", "policyVersionId": "Pm2iVyce"}, {"isAccepted": false, "localizedPolicyVersionId": "tokYXCGb", "policyId": "0Z4GN7Yt", "policyVersionId": "fqYy4O5y"}, {"isAccepted": false, "localizedPolicyVersionId": "ng2o5gQz", "policyId": "1l02qNWH", "policyVersionId": "LDX5Js9e"}], "authType": "EMAILPASSWD", "country": "29hagPw1", "dateOfBirth": "0Sl0SPlp", "displayName": "kGHVaFZO", "emailAddress": "do4Gu94z", "password": "E33IBSnr", "passwordMD5Sum": "BwhHCedR", "username": "sXWRuQpZ", "verified": false}' \
    > test.out 2>&1
eval_tap $? 327 'PublicCreateTestUserV4' test.out

#- 328 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "SS4u6YGB", "policyId": "PgQiH0eY", "policyVersionId": "GooAKmUh"}, {"isAccepted": true, "localizedPolicyVersionId": "7oRdcOah", "policyId": "pXwY6BoJ", "policyVersionId": "zXtQmv7G"}, {"isAccepted": false, "localizedPolicyVersionId": "9RgzdAKD", "policyId": "soJcPYG6", "policyVersionId": "zX7x4RoE"}], "authType": "EMAILPASSWD", "code": "mTJLVK8O", "country": "vHt7L48M", "dateOfBirth": "1evOFcyc", "displayName": "kduuZDum", "emailAddress": "eAJdaaou", "password": "mBnJoZIy", "passwordMD5Sum": "O7N3OBmD", "reachMinimumAge": false, "username": "ZkLsBW3F"}' \
    > test.out 2>&1
eval_tap $? 328 'PublicCreateUserV4' test.out

#- 329 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'kx24NU7B' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "7ZspPChE", "policyId": "dnSFbudQ", "policyVersionId": "xnbDzqAV"}, {"isAccepted": true, "localizedPolicyVersionId": "MEWluEJ4", "policyId": "1OR0ob8R", "policyVersionId": "CCGsE6Yk"}, {"isAccepted": false, "localizedPolicyVersionId": "H2r7oNvE", "policyId": "R3wgAiKh", "policyVersionId": "m4j9r5Kq"}], "authType": "EMAILPASSWD", "country": "IBflVLFL", "dateOfBirth": "EkbcFZvR", "displayName": "8NMzvTTb", "password": "lOCDFWaa", "reachMinimumAge": false, "username": "zt7e4rGR"}' \
    > test.out 2>&1
eval_tap $? 329 'CreateUserFromInvitationV4' test.out

#- 330 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "5Ig2rrPn", "country": "eT5MzHMB", "dateOfBirth": "n6C19bse", "displayName": "IffAM64b", "languageTag": "jVKe4ln7", "userName": "AxUn0eBx"}' \
    > test.out 2>&1
eval_tap $? 330 'PublicUpdateUserV4' test.out

#- 331 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "TPIXv3jA", "emailAddress": "jT1HtMKz"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicUpdateUserEmailAddressV4' test.out

#- 332 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "mNdpXWcI", "country": "VUqtTGiU", "dateOfBirth": "kkkYAxpi", "displayName": "DMjPE5Dr", "emailAddress": "U9XEy30x", "password": "5CI9qx9R", "reachMinimumAge": true, "username": "gHBMjacE", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 332 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 333 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "gaMXmzuA", "password": "4AOGZlGj", "username": "rY8frR8M"}' \
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
    --code 'apByuz2s' \
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
    --deviceToken 'hI2JFu0V' \
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
    --code 'VJ4SzuZv' \
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
    --factor '2aM9yJqz' \
    > test.out 2>&1
eval_tap $? 347 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE