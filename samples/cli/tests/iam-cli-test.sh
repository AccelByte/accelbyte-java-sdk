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
    --body '[{"field": "OTR9LS3V", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "blockedWord": ["rpcWxoGd", "pJcRS67L", "cAAxgOh5"], "description": [{"language": "v4xpyUQz", "message": ["arNLXyNV", "NSkt9L4t", "H79qehPM"]}, {"language": "6jA4RHTF", "message": ["eF09hfCz", "lOfPTV8p", "qUxEkh64"]}, {"language": "uIyvS5lt", "message": ["gFdR3LQi", "TtzsDIz1", "ivc9pRsy"]}], "isCustomRegex": false, "letterCase": "Xk4HD3zD", "maxLength": 79, "maxRepeatingAlphaNum": 68, "maxRepeatingSpecialCharacter": 20, "minCharType": 65, "minLength": 58, "regex": "ZlpR6bqT", "specialCharacterLocation": "DCkRFjLu", "specialCharacters": ["TVq1aREh", "136h82MA", "f6GdTOSb"]}}, {"field": "5VplPEvL", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "blockedWord": ["BkTKGvIA", "0QFdbs2i", "X1OQ4ymq"], "description": [{"language": "lndX3TcC", "message": ["fhWtthAw", "jIxw5FGK", "MA6DH2sd"]}, {"language": "eFXHXTyl", "message": ["jGdamWyy", "6Rt7mIp1", "YuNcnPJS"]}, {"language": "QXAXqJIP", "message": ["D6XtFXTg", "bmvSmBuo", "NAOqyyB0"]}], "isCustomRegex": true, "letterCase": "lEaKHQ1G", "maxLength": 21, "maxRepeatingAlphaNum": 11, "maxRepeatingSpecialCharacter": 80, "minCharType": 65, "minLength": 10, "regex": "HHn0aGm3", "specialCharacterLocation": "qa2g4stQ", "specialCharacters": ["UEWjY1yF", "rh19d6b2", "A7ngTlL9"]}}, {"field": "av44BNAY", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "blockedWord": ["t3S6IKqX", "Ti4DilMq", "Dc9YSCbL"], "description": [{"language": "j3OS1Sv8", "message": ["gRWoCrx4", "3gihl0Bi", "ebYSLi7x"]}, {"language": "lA6bYiWF", "message": ["sfsTfP4l", "oZGdP4Rx", "RzSOf7dN"]}, {"language": "ebUYWCdn", "message": ["180V4Jhk", "Bmb5Rgv6", "nSuSyNDN"]}], "isCustomRegex": false, "letterCase": "7ebJc30Y", "maxLength": 46, "maxRepeatingAlphaNum": 92, "maxRepeatingSpecialCharacter": 37, "minCharType": 91, "minLength": 84, "regex": "U5OmGXEm", "specialCharacterLocation": "cdM287Sy", "specialCharacters": ["sKo79LbA", "bRAEcy0h", "XKDwLorQ"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'wyXa2sFd' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after '5lajQi6P' \
    --before 'oqGkxL1M' \
    --limit '18' \
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
    --body '{"ageRestriction": 90, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'JOaGNCrY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 41}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'mX2LZeli' \
    --limit '52' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "UFN98OJ8", "comment": "7w6QrAF0", "endDate": "8dRwohGu", "reason": "iuwgysGW", "skipNotif": false, "userIds": ["CVJnoVj8", "cLjedLz6", "FkLb0weK"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "yIFxkTjE", "userId": "UAziHGN3"}, {"banId": "WMnSGuti", "userId": "yVfgSeoQ"}, {"banId": "TGrQ0MGc", "userId": "oVsk1R2Z"}]}' \
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
    --clientId 'FngZIKap' \
    --clientName 'kQj73oCx' \
    --clientType 'p9bWNIwU' \
    --limit '40' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["uS0vmdeb", "pEeVmjuk", "ljF2qd2U"], "baseUri": "gsioKhYr", "clientId": "tGVtYBnZ", "clientName": "0pU7prmP", "clientPermissions": [{"action": 55, "resource": "myPLZPO4", "schedAction": 96, "schedCron": "3UycNRsb", "schedRange": ["6KNIKRCb", "Tcqr5Z9i", "nTYz1GuQ"]}, {"action": 84, "resource": "aHotgzKM", "schedAction": 72, "schedCron": "MBMLkLed", "schedRange": ["R1mIIF56", "fcOf4EBE", "fnr6joKF"]}, {"action": 22, "resource": "sUYTpiDo", "schedAction": 89, "schedCron": "fllPR0Sn", "schedRange": ["XO39fvDH", "B65o0P2J", "XgBJ8Dvw"]}], "clientPlatform": "UQSFrQd2", "deletable": true, "description": "UGCTU6FP", "namespace": "VJeISSL5", "oauthAccessTokenExpiration": 64, "oauthAccessTokenExpirationTimeUnit": "U5Pp8sUn", "oauthClientType": "m5mlDVE2", "oauthRefreshTokenExpiration": 26, "oauthRefreshTokenExpirationTimeUnit": "2YPhPRsG", "parentNamespace": "1sWU4zuK", "redirectUri": "c0y9qMBs", "scopes": ["uTIWu2d7", "B8EUcpBS", "HG59JBN2"], "secret": "2kpMAmAO", "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'dN84jNts' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'yaeEzLls' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'rpRVCdHB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["EwMu9Tq1", "adZGIXI5", "jIYU3oOX"], "baseUri": "MNPlhzoo", "clientName": "ePGry0WO", "clientPermissions": [{"action": 57, "resource": "YgNsKM8J", "schedAction": 9, "schedCron": "NVT2kah1", "schedRange": ["HntysSxH", "aNDdIBWb", "Xc7srj3L"]}, {"action": 61, "resource": "N1k2fIgd", "schedAction": 22, "schedCron": "Dl12b4eL", "schedRange": ["PxoeCy11", "0jmPL0A4", "h9YlcRxZ"]}, {"action": 82, "resource": "B0YCGjSw", "schedAction": 81, "schedCron": "PLc1tVmQ", "schedRange": ["gkDQplaJ", "1ln2YtnX", "Emkgf4lz"]}], "clientPlatform": "btyh6to0", "deletable": false, "description": "jmk3H2Zz", "namespace": "7KSkRkVL", "oauthAccessTokenExpiration": 36, "oauthAccessTokenExpirationTimeUnit": "TdDGVQlp", "oauthRefreshTokenExpiration": 10, "oauthRefreshTokenExpirationTimeUnit": "4BjJ55Dn", "redirectUri": "SS45IEFk", "scopes": ["1qRFDPDw", "k3pRzUhi", "LNRSBGcX"], "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'xpOWdzGA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 83, "resource": "PfN5xeSe"}, {"action": 91, "resource": "iXBqh7if"}, {"action": 35, "resource": "C3FORbhc"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'yNjdh0NI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 58, "resource": "fdBaAp6p"}, {"action": 63, "resource": "XJ2cQpPu"}, {"action": 75, "resource": "Sc33nhyJ"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '71' \
    --clientId 'OqSEWDsU' \
    --namespace "$AB_NAMESPACE" \
    --resource 'WYqkAlBI' \
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
    --limit '92' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'd90LnQIx' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xStOvfZ1' \
    --body '{"ACSURL": "bsGbyZxc", "AWSCognitoRegion": "0x1BzlD8", "AWSCognitoUserPool": "tjhTQGKw", "AllowedClients": ["3o68i4Uk", "jWbNEHyj", "XTc4A89I"], "AppId": "khiYXEW3", "AuthorizationEndpoint": "4mvZYzpt", "ClientId": "SFHRDj4u", "Environment": "1p42SdEb", "FederationMetadataURL": "jO1xYPHu", "GenericOauthFlow": false, "IsActive": false, "Issuer": "G0ikExQf", "JWKSEndpoint": "0xTkdIFp", "KeyID": "XPk4xfe6", "NetflixCertificates": {"encryptedPrivateKey": "fCauq9Xf", "encryptedPrivateKeyName": "bfIKE9eh", "publicCertificate": "EOjOyU5G", "publicCertificateName": "Z60eC6UX", "rootCertificate": "XaVJGj3z", "rootCertificateName": "sT1YOuW5"}, "OrganizationId": "Q8qJjYfG", "PlatformName": "PUQqvn4h", "RedirectUri": "ddGhZGx2", "RegisteredDomains": [{"affectedClientIDs": ["SwOMYAWB", "ZQiYlx8I", "lObThuJx"], "domain": "6j5XaGKK", "namespaces": ["H20dzLGR", "7WsFcr3v", "vsY2rp2H"], "roleId": "9DXIc9IM"}, {"affectedClientIDs": ["CdNcFQQC", "du9dejmt", "Pnvb5taM"], "domain": "NCkka103", "namespaces": ["N2vWEltg", "KvYJa40h", "wZjbc8Mi"], "roleId": "821F6RTl"}, {"affectedClientIDs": ["iOvkkawE", "UOEBMQ1P", "Tk8XsYdj"], "domain": "NVBREr7r", "namespaces": ["K6LhjH7X", "IRUElQqM", "oW2Sq5f0"], "roleId": "bG3pPSLb"}], "Secret": "hDySA6DZ", "TeamID": "ImxTfDQw", "TokenAuthenticationType": "kjrsyf10", "TokenClaimsMapping": {"pNqB10pZ": "hhP16ncL", "ElLjQ5MU": "3ArSZ652", "4mIsBN47": "hgw7lZ6a"}, "TokenEndpoint": "jFaz3682", "scopes": ["F7W2pQa1", "j1jyZCef", "EuCdZcik"]}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wLujH2wV' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XZXH4EN9' \
    --body '{"ACSURL": "K0m4lwiU", "AWSCognitoRegion": "9RYhfHaL", "AWSCognitoUserPool": "q0lPQAre", "AllowedClients": ["Np3sK281", "lSXtJy7U", "jWNU3pV2"], "AppId": "6XGfAC9Q", "AuthorizationEndpoint": "mT3yfLCh", "ClientId": "upA6wt27", "Environment": "rzzaDqT5", "FederationMetadataURL": "PGVhdUWu", "GenericOauthFlow": true, "IsActive": false, "Issuer": "banQAy9D", "JWKSEndpoint": "IpHYCCkR", "KeyID": "TXS5GUuc", "NetflixCertificates": {"encryptedPrivateKey": "riPQLAYe", "encryptedPrivateKeyName": "lzY9Af4K", "publicCertificate": "4BipH52T", "publicCertificateName": "oRb1yhXo", "rootCertificate": "J4cFgb0h", "rootCertificateName": "DYEIvYIS"}, "OrganizationId": "e12DOzOa", "PlatformName": "wkfvjFVl", "RedirectUri": "a7qjXoWG", "RegisteredDomains": [{"affectedClientIDs": ["9r7bbvGp", "y2Unwlps", "OldGdy7b"], "domain": "8BS8ZvHk", "namespaces": ["yXx62lKv", "3AgGUKEb", "xWk1APC7"], "roleId": "gzxmRjbS"}, {"affectedClientIDs": ["M5G0D4Vn", "YFaPVWUE", "keguqsYX"], "domain": "tqny7j0N", "namespaces": ["DcfpEJb7", "iKK0DfQO", "PVuuV7MR"], "roleId": "siOdcmZP"}, {"affectedClientIDs": ["5rJEWlNP", "aukxAL6w", "64UKx340"], "domain": "b4eAIbAs", "namespaces": ["10LIhoTQ", "48fAVhDY", "kHnkeiDh"], "roleId": "5h1KiOpp"}], "Secret": "i7BrtQ98", "TeamID": "w6A2w0bi", "TokenAuthenticationType": "DxnkYAJC", "TokenClaimsMapping": {"fD0czHFR": "pCCmTK5w", "xBz4Owcz": "FEroM0BQ", "ZhOA1T48": "wc8acPqi"}, "TokenEndpoint": "7th2DqnH", "scopes": ["tqANp3iH", "ajRkFSNo", "l48E8Wu2"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vjIG2ufJ' \
    --body '{"affectedClientIDs": ["ZplMA0vw", "LEGDtSCJ", "V2sLMCwu"], "assignedNamespaces": ["4cvZUk2Q", "aMvn1t6M", "D30AG3Cj"], "domain": "1ElcbzSX", "roleId": "AagilOUn"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'eYP9SAbu' \
    --body '{"domain": "6V59WDcC"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '7oPlINSK' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YdCraSny' \
    --body '{"acsUrl": "hA06i2br", "apiKey": "m97EMMM0", "appId": "4YRIpytF", "federationMetadataUrl": "PXa4QQOg", "isActive": true, "redirectUri": "YMzrgGpH", "secret": "WhNppvgt", "ssoUrl": "fNaeXurd"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Z6SW3WlY' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ul8CJeqH' \
    --body '{"acsUrl": "RxvkVWNF", "apiKey": "03vwD9IS", "appId": "kHjQYLsB", "federationMetadataUrl": "rhlk79Fc", "isActive": true, "redirectUri": "ZlOrGAgM", "secret": "3shsEUe8", "ssoUrl": "eXLcAC5M"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '7EdH7fu5' \
    --platformUserId 'cbACCtla' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '6ihh3Atw' \
    --after '48' \
    --before '79' \
    --limit '28' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'ZrcPiGiA' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["yvjYo2k4", "oajYsaGk", "CRoUrd4y"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["0mM9GJlu", "sHLwIMSk", "E3dFMZuj"], "isAdmin": true, "namespace": "g1PhV3vl", "roles": ["947rdC51", "TfQ8nh6s", "NS9oBIMG"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '22' \
    --platformUserId 'SQqhAv2G' \
    --platformId 'DPwa9a1V' \
    > test.out 2>&1
eval_tap $? 146 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 147 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 147 'AdminListUsersV3' test.out

#- 148 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '9fSkhCmn' \
    --endDate 'mI0aB8PV' \
    --limit '99' \
    --offset '61' \
    --platformBy '9pymCyDb' \
    --platformId 'gUlYupRQ' \
    --query 'mpcY9ugX' \
    --startDate 'vYzcYL1y' \
    > test.out 2>&1
eval_tap $? 148 'AdminSearchUserV3' test.out

#- 149 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["4cIvqgva", "NZgAaHTo", "AIZFSQia"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetBulkUserByEmailAddressV3' test.out

#- 150 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GKw2jz0D' \
    > test.out 2>&1
eval_tap $? 150 'AdminGetUserByUserIdV3' test.out

#- 151 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OiYH03yi' \
    --body '{"avatarUrl": "9rVT72Ap", "country": "gr1ZifFF", "dateOfBirth": "GLL0db3o", "displayName": "JnN5mJMX", "languageTag": "Ejfjks8Z", "userName": "DpnoNjPm"}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserV3' test.out

#- 152 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uQoA1D6y' \
    --activeOnly  \
    --after 'qpkQfDlP' \
    --before 'pBuRjEUH' \
    --limit '12' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetUserBanV3' test.out

#- 153 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Et85N68n' \
    --body '{"ban": "eWzsm4EN", "comment": "C7PYOfiB", "endDate": "nAQ7XGpL", "reason": "w6p9y6RI", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 153 'AdminBanUserV3' test.out

#- 154 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'qaZc5v6a' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ySBbRRsf' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 154 'AdminUpdateUserBanV3' test.out

#- 155 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ynmU2mYi' \
    --body '{"context": "XOhExUmL", "emailAddress": "IVShzcbM", "languageTag": "a61h6FIj"}' \
    > test.out 2>&1
eval_tap $? 155 'AdminSendVerificationCodeV3' test.out

#- 156 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cZSvyEmO' \
    --body '{"Code": "qKLCRlC2", "ContactType": "bShBzf1G", "LanguageTag": "TbQleMjl", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 156 'AdminVerifyAccountV3' test.out

#- 157 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'HX3mslCK' \
    > test.out 2>&1
eval_tap $? 157 'GetUserVerificationCode' test.out

#- 158 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LY0TkiIP' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserDeletionStatusV3' test.out

#- 159 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'b1QAQKA1' \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpdateUserDeletionStatusV3' test.out

#- 160 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AvnaDRp1' \
    --body '{"code": "7H3EidpK", "country": "ajTeubNB", "dateOfBirth": "ysBCF8k8", "displayName": "6ViquuMf", "emailAddress": "XJkxWo5o", "password": "9j0dLyN5", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpgradeHeadlessAccountV3' test.out

#- 161 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZhcyahIy' \
    > test.out 2>&1
eval_tap $? 161 'AdminDeleteUserInformationV3' test.out

#- 162 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RSHj9eKC' \
    --after '0.2874779085335938' \
    --before '0.5488889251971565' \
    --limit '86' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetUserLoginHistoriesV3' test.out

#- 163 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CVYumrBu' \
    --body '{"languageTag": "lxI6uRuB", "newPassword": "9dtA20DT", "oldPassword": "ttYtV21i"}' \
    > test.out 2>&1
eval_tap $? 163 'AdminResetPasswordV3' test.out

#- 164 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HPa6PkdU' \
    --body '{"Permissions": [{"Action": 67, "Resource": "ohPH0vMN", "SchedAction": 7, "SchedCron": "1Q6Ypyw5", "SchedRange": ["IBXipMKz", "dH7nNfug", "8vzinD2z"]}, {"Action": 100, "Resource": "k01p5fRx", "SchedAction": 39, "SchedCron": "Jtke24ZV", "SchedRange": ["z5MgO5rV", "cTpRQldk", "0dd2cqMZ"]}, {"Action": 65, "Resource": "JN9eAKLY", "SchedAction": 25, "SchedCron": "VxL0mOBW", "SchedRange": ["DEWsGxjX", "T5RlWx57", "8u9jKNTy"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserPermissionV3' test.out

#- 165 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MesMsnJW' \
    --body '{"Permissions": [{"Action": 97, "Resource": "gwBa6L6e", "SchedAction": 6, "SchedCron": "oQ0EYfPO", "SchedRange": ["VVjrB3qb", "2b2u1jLw", "8XJgi6xr"]}, {"Action": 40, "Resource": "ipefsOxx", "SchedAction": 50, "SchedCron": "HvN8pn6E", "SchedRange": ["GbLsKHqy", "FtqUw82w", "9ZWSX1qo"]}, {"Action": 33, "Resource": "7tzjEhhX", "SchedAction": 40, "SchedCron": "txPk5KVc", "SchedRange": ["9w0tP4By", "qlzDfKfi", "axKUSV4L"]}]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminAddUserPermissionsV3' test.out

#- 166 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '75DvgXj9' \
    --body '[{"Action": 13, "Resource": "QsKnA2bG"}, {"Action": 93, "Resource": "UGUY1VKY"}, {"Action": 4, "Resource": "e4vAYstm"}]' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionBulkV3' test.out

#- 167 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '30' \
    --namespace "$AB_NAMESPACE" \
    --resource 'gVOqAvkv' \
    --userId 'cukdcSK2' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserPermissionV3' test.out

#- 168 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aYeHZiGn' \
    --after '3dT2z6sx' \
    --before 'xSPE77sC' \
    --limit '18' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserPlatformAccountsV3' test.out

#- 169 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '1Lrfmfe9' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetListJusticePlatformAccounts' test.out

#- 170 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'sp0DmHWI' \
    --userId 'mPI6QbXC' \
    > test.out 2>&1
eval_tap $? 170 'AdminGetUserMapping' test.out

#- 171 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'VqkdsTNc' \
    --userId 'Lo0DF4Vj' \
    > test.out 2>&1
eval_tap $? 171 'AdminCreateJusticeUser' test.out

#- 172 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '7UjqhMsR' \
    --body '{"platformId": "lidDxIx1", "platformUserId": "9SrVnGJH"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminLinkPlatformAccount' test.out

#- 173 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mSDo29Yx' \
    --userId '7eO0GYYZ' \
    --body '{"platformNamespace": "1RAn21fg"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformUnlinkV3' test.out

#- 174 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yBIhRNvy' \
    --userId 'xD7j8YIT' \
    --ticket 'gUzBFE6y' \
    > test.out 2>&1
eval_tap $? 174 'AdminPlatformLinkV3' test.out

#- 175 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pY3S5h8b' \
    --userId 'LIPfYgr7' \
    --platformToken 'fmrPRA3v' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 176 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'e31lxZT0' \
    --body '["66d50qD0", "sm8KAaUN", "LLVe6TUw"]' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserRolesV3' test.out

#- 177 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LKkQY8ng' \
    --body '[{"namespace": "DZeabrmf", "roleId": "4WZNScqZ"}, {"namespace": "FffU1ACG", "roleId": "BLx3L5ir"}, {"namespace": "IsGMGZGX", "roleId": "XaFcK2ba"}]' \
    > test.out 2>&1
eval_tap $? 177 'AdminSaveUserRoleV3' test.out

#- 178 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'l1mAm8Fn' \
    --userId 'x7BU6Sq0' \
    > test.out 2>&1
eval_tap $? 178 'AdminAddUserRoleV3' test.out

#- 179 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'GB01BO5a' \
    --userId 'BBjbEdUj' \
    > test.out 2>&1
eval_tap $? 179 'AdminDeleteUserRoleV3' test.out

#- 180 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JFmypHUe' \
    --body '{"enabled": false, "reason": "bKxDeOY5"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateUserStatusV3' test.out

#- 181 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VUQqNFgj' \
    > test.out 2>&1
eval_tap $? 181 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 182 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'Sm3M2LG9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "49ngy9W4"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateClientSecretV3' test.out

#- 183 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after '4JKbkjDt' \
    --before 'c7HUveFV' \
    --isWildcard  \
    --limit '50' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRolesV3' test.out

#- 184 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "managers": [{"displayName": "aqoUgNEN", "namespace": "XqebqBdf", "userId": "00Rtzsan"}, {"displayName": "f9FoYeeg", "namespace": "4DCwG4j0", "userId": "rVqq6twm"}, {"displayName": "9X5ZXZ2W", "namespace": "lxbymFQB", "userId": "STh0lBOo"}], "members": [{"displayName": "gVD2ZNjW", "namespace": "oIo3ovF4", "userId": "aXzEZLLV"}, {"displayName": "c8ZpuxgE", "namespace": "2Sphfsoe", "userId": "1YgKiHIP"}, {"displayName": "TF9cx7hp", "namespace": "84WiCf6p", "userId": "s9Z93Zh4"}], "permissions": [{"action": 86, "resource": "CrwGYfbd", "schedAction": 57, "schedCron": "BcytIFHS", "schedRange": ["eBtRmsws", "dEck9fyQ", "SqoCzot9"]}, {"action": 69, "resource": "hyeCrSZ6", "schedAction": 82, "schedCron": "zOm3v0CB", "schedRange": ["VAQjMQk4", "Sn3y4TCK", "Q09HzjxA"]}, {"action": 0, "resource": "LLtLLhJI", "schedAction": 57, "schedCron": "v4rGSpsz", "schedRange": ["ewArhovb", "G8JgzSYC", "lurKtgo4"]}], "roleName": "VKNXYhhS"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminCreateRoleV3' test.out

#- 185 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'iLNHmlS4' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleV3' test.out

#- 186 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'SNgnOG3m' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteRoleV3' test.out

#- 187 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'F170p9OI' \
    --body '{"deletable": false, "isWildcard": false, "roleName": "hMhffB2F"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateRoleV3' test.out

#- 188 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'gZQp7q6o' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleAdminStatusV3' test.out

#- 189 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'JjC28WDR' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpdateAdminRoleStatusV3' test.out

#- 190 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'BsmY65Zy' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleAdminV3' test.out

#- 191 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'tI2ejKZu' \
    --after 'dDuHutCq' \
    --before '9IZmZAP5' \
    --limit '78' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetRoleManagersV3' test.out

#- 192 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'zBmfEMKK' \
    --body '{"managers": [{"displayName": "RvI04oxT", "namespace": "HdksRsEs", "userId": "FHY1nMmp"}, {"displayName": "qW1q5sbH", "namespace": "mBi5QSub", "userId": "D9cEXD8s"}, {"displayName": "IHSIEZNu", "namespace": "S3cPheQT", "userId": "UFjed4AW"}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRoleManagersV3' test.out

#- 193 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'DuHPIB9n' \
    --body '{"managers": [{"displayName": "A1V7Xciv", "namespace": "pbDDJmLB", "userId": "4eAVdJdp"}, {"displayName": "xP0l6ygl", "namespace": "qm4PH8jL", "userId": "qM5ZbOvq"}, {"displayName": "s4TWfL1R", "namespace": "CZ9azP0l", "userId": "Pt8TYLPa"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminRemoveRoleManagersV3' test.out

#- 194 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'bc0V960Z' \
    --after 'Ga2mmtIs' \
    --before 'c6gJAsZ6' \
    --limit '82' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetRoleMembersV3' test.out

#- 195 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'snliuM79' \
    --body '{"members": [{"displayName": "5lYD3HRQ", "namespace": "LLHLoPiT", "userId": "FVU2OPXy"}, {"displayName": "n0xepUdc", "namespace": "m9IciEzc", "userId": "VCiiwANu"}, {"displayName": "AylVhSwu", "namespace": "wJrOpR9f", "userId": "wpiWKUtQ"}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddRoleMembersV3' test.out

#- 196 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'BzFGhRgD' \
    --body '{"members": [{"displayName": "WdazqST0", "namespace": "Az3QyCdn", "userId": "zSG0EIQb"}, {"displayName": "dKSpUsKL", "namespace": "lymToihb", "userId": "sSdxACFp"}, {"displayName": "nLHoNvrG", "namespace": "z4AJnpG3", "userId": "XiyleS5f"}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminRemoveRoleMembersV3' test.out

#- 197 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'grj690a2' \
    --body '{"permissions": [{"action": 4, "resource": "PnwFwK38", "schedAction": 22, "schedCron": "EgJlll8P", "schedRange": ["qh6z0Ez4", "ogLMxewD", "w7iMz8s9"]}, {"action": 24, "resource": "kRApejml", "schedAction": 72, "schedCron": "XInhLYac", "schedRange": ["LTOCC4PJ", "HKbfwcKW", "30LI5pVK"]}, {"action": 91, "resource": "BbJq9zHA", "schedAction": 19, "schedCron": "lKhzZpOw", "schedRange": ["MXHbNZ98", "NMunjjZJ", "O1hEPWlc"]}]}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateRolePermissionsV3' test.out

#- 198 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'qt1bkR9C' \
    --body '{"permissions": [{"action": 25, "resource": "Wj0MuY4j", "schedAction": 80, "schedCron": "h5JR02v8", "schedRange": ["mTmD0NlJ", "gBc3Lvc8", "c4ebm2B8"]}, {"action": 86, "resource": "pYsQvlLY", "schedAction": 95, "schedCron": "YlU314IM", "schedRange": ["Aze4SCac", "3Nbm4kaI", "TapUvnGk"]}, {"action": 91, "resource": "qj2ayOaG", "schedAction": 8, "schedCron": "aTfdVB0U", "schedRange": ["IaN1XaYg", "slRw8nea", "DSCIPaZx"]}]}' \
    > test.out 2>&1
eval_tap $? 198 'AdminAddRolePermissionsV3' test.out

#- 199 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'kGVQaqN0' \
    --body '["tBxGmwuf", "rpBF5usL", "sJJDrRZP"]' \
    > test.out 2>&1
eval_tap $? 199 'AdminDeleteRolePermissionsV3' test.out

#- 200 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '69' \
    --resource 'jqNaa3LK' \
    --roleId 'PvShghVR' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteRolePermissionV3' test.out

#- 201 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 201 'AdminGetMyUserV3' test.out

#- 202 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'vrdDJXW4' \
    --extendExp  \
    --redirectUri '6X3jA7KR' \
    --password 'Uwt6BUK6' \
    --requestId '2hqLes90' \
    --userName 'L7LXDO30' \
    > test.out 2>&1
eval_tap $? 202 'UserAuthenticationV3' test.out

#- 203 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '9TKxRNqb' \
    --linkingToken 'LKdbZZzl' \
    --password 'NZ9Byv2t' \
    --username 'bfWxjOr5' \
    > test.out 2>&1
eval_tap $? 203 'AuthenticationWithPlatformLinkV3' test.out

#- 204 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'bl2Bs8no' \
    > test.out 2>&1
eval_tap $? 204 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 205 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'igW9cw9Y' \
    > test.out 2>&1
eval_tap $? 205 'RequestOneTimeLinkingCodeV3' test.out

#- 206 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'fngp1Me0' \
    > test.out 2>&1
eval_tap $? 206 'ValidateOneTimeLinkingCodeV3' test.out

#- 207 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --clientId 'h6HZl6YW' \
    --oneTimeLinkCode '8tMWnHAA' \
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
    --clientId 'gdFKS4ef' \
    > test.out 2>&1
eval_tap $? 210 'RequestGameTokenCodeResponseV3' test.out

#- 211 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oIrrlTEy' \
    --userId 'T2BFmxnQ' \
    > test.out 2>&1
eval_tap $? 211 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 212 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wP8Kofx6' \
    > test.out 2>&1
eval_tap $? 212 'RevokeUserV3' test.out

#- 213 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'GzAKEkGL' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'szjD3IEQ' \
    --redirectUri 'J6GWzYof' \
    --scope 'ErE5zuTv' \
    --state 'VOh9V5tb' \
    --targetAuthPage 'h6kEoWYV' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'a2zyTZeF' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 213 'AuthorizeV3' test.out

#- 214 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'iiHRiL2s' \
    > test.out 2>&1
eval_tap $? 214 'TokenIntrospectionV3' test.out

#- 215 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 215 'GetJWKSV3' test.out

#- 216 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'bLHZcNIs' \
    --factor 'RU3fAuMp' \
    --mfaToken 'wLfyfvj9' \
    > test.out 2>&1
eval_tap $? 216 'SendMFAAuthenticationCode' test.out

#- 217 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'XdHWMKAP' \
    --mfaToken '3ipivHsD' \
    > test.out 2>&1
eval_tap $? 217 'Change2faMethod' test.out

#- 218 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'MbwuHjSk' \
    --factor '89THdCII' \
    --mfaToken '5GCgZddx' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 218 'Verify2faCode' test.out

#- 219 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BdrRiyNm' \
    --userId '8PG3MJUG' \
    > test.out 2>&1
eval_tap $? 219 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 220 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'pXEYTR1F' \
    --clientId 'Qa1eNmOi' \
    --redirectUri 'K2HkS06k' \
    --requestId 'RgyfQur0' \
    > test.out 2>&1
eval_tap $? 220 'AuthCodeRequestV3' test.out

#- 221 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'ZianywrJ' \
    --clientId 'FzKtM7Vy' \
    --createHeadless  \
    --deviceId 'SAUlNjjo' \
    --macAddress 'oCNjXImm' \
    --platformToken '119ZHtBO' \
    > test.out 2>&1
eval_tap $? 221 'PlatformTokenGrantV3' test.out

#- 222 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 222 'GetRevocationListV3' test.out

#- 223 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token '5c4uPqnF' \
    > test.out 2>&1
eval_tap $? 223 'TokenRevocationV3' test.out

#- 224 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId '4HtsWCEG' \
    --code 'txPft4DF' \
    --codeVerifier '7I1cbIiI' \
    --extendExp  \
    --password 'uwvDjHQH' \
    --redirectUri '5Vjt2TCZ' \
    --refreshToken 'iFy88TZB' \
    --username 'Eb6sCzoi' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 224 'TokenGrantV3' test.out

#- 225 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token '1zsvHX24' \
    > test.out 2>&1
eval_tap $? 225 'VerifyTokenV3' test.out

#- 226 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'BpFeJguq' \
    --code 'bdgLNuzr' \
    --error 'QoqWDwzV' \
    --openidAssocHandle 'NqoePPWo' \
    --openidClaimedId 'UzEhf0ti' \
    --openidIdentity 'LXIrO68R' \
    --openidMode '6WwN6Fyk' \
    --openidNs 'mlqjeWFP' \
    --openidOpEndpoint 'vqc8ZL5N' \
    --openidResponseNonce 'j3mIiF93' \
    --openidReturnTo 'vzxD8EsV' \
    --openidSig 'e9LbCO8Z' \
    --openidSigned 'HkfWJLdi' \
    --state '2hvwPQvQ' \
    > test.out 2>&1
eval_tap $? 226 'PlatformAuthenticationV3' test.out

#- 227 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'mOwEvyzR' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetInputValidations' test.out

#- 228 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode '75qldioj' \
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
    --clientId 'PkrD8J7W' \
    > test.out 2>&1
eval_tap $? 230 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 231 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'G37QxvVr' \
    --body '{"platformUserIds": ["LkOysdey", "CLnfCXbL", "YtwV8iHC"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 232 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rPiH0exq' \
    --platformUserId 'CPLve0DB' \
    > test.out 2>&1
eval_tap $? 232 'PublicGetUserByPlatformUserIDV3' test.out

#- 233 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'uPOeFFrl' \
    > test.out 2>&1
eval_tap $? 233 'PublicGetAsyncStatus' test.out

#- 234 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'tijaU8Wl' \
    --limit '88' \
    --offset '41' \
    --query '6e4vT0If' \
    > test.out 2>&1
eval_tap $? 234 'PublicSearchUserV3' test.out

#- 235 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "kLgxi0Vr", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "cA0Cu4fJ", "policyId": "l8U2ZfgG", "policyVersionId": "kIBsdIr1"}, {"isAccepted": false, "localizedPolicyVersionId": "MYeQET4M", "policyId": "MfJdh6qx", "policyVersionId": "nrgEhzgR"}, {"isAccepted": true, "localizedPolicyVersionId": "4rZQmwOH", "policyId": "3ukduSpg", "policyVersionId": "3ccMtRY4"}], "authType": "SiVsaJ1Z", "code": "rPdKOjEd", "country": "SmyQfvOS", "dateOfBirth": "N5pxY6t8", "displayName": "bVoEen3q", "emailAddress": "gKRnaUeM", "password": "ItKqhV76", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 235 'PublicCreateUserV3' test.out

#- 236 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'zy7TJlPX' \
    --query 'X2EzVuLo' \
    > test.out 2>&1
eval_tap $? 236 'CheckUserAvailability' test.out

#- 237 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["AT0C3uWM", "ORlvm7Aq", "rbVdd6lN"]}' \
    > test.out 2>&1
eval_tap $? 237 'PublicBulkGetUsers' test.out

#- 238 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "fzWwPU68", "languageTag": "Ojt5SKgh"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicSendRegistrationCode' test.out

#- 239 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ooFkWq4W", "emailAddress": "5qQFfKV7"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicVerifyRegistrationCode' test.out

#- 240 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "w4Pc2CqT", "languageTag": "KHeqD8sS"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicForgotPasswordV3' test.out

#- 241 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'N9Nseqw1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'GetAdminInvitationV3' test.out

#- 242 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'zaYPBIf7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "Bbg2l5bI", "policyId": "e3rtRBrq", "policyVersionId": "t4IhT7LJ"}, {"isAccepted": false, "localizedPolicyVersionId": "X96YDv6H", "policyId": "WbhOdRAo", "policyVersionId": "tF6msS7y"}, {"isAccepted": false, "localizedPolicyVersionId": "B0X7GjlK", "policyId": "z8NvgOYD", "policyVersionId": "aIjYcdoj"}], "authType": "EMAILPASSWD", "country": "UvLhiO9R", "dateOfBirth": "6jHF9TKQ", "displayName": "ySnU6xrm", "password": "JFfTY17I", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 242 'CreateUserFromInvitationV3' test.out

#- 243 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "hwAUXcGr", "country": "fXchT40H", "dateOfBirth": "KYbz0YY7", "displayName": "BuiUqM73", "languageTag": "vV5zvU0H", "userName": "D8mATtLx"}' \
    > test.out 2>&1
eval_tap $? 243 'UpdateUserV3' test.out

#- 244 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "2OCk9Grw", "country": "rvrBka2m", "dateOfBirth": "jWrxGwlm", "displayName": "wtprNPaI", "languageTag": "gGo5PP3C", "userName": "LMXrwrv5"}' \
    > test.out 2>&1
eval_tap $? 244 'PublicPartialUpdateUserV3' test.out

#- 245 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "Sv08ajzR", "emailAddress": "UGF2WvkG", "languageTag": "A9iEyEed"}' \
    > test.out 2>&1
eval_tap $? 245 'PublicSendVerificationCodeV3' test.out

#- 246 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "qfWMrTQS", "contactType": "qHIVXAGX", "languageTag": "wBQCIerF", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 246 'PublicUserVerificationV3' test.out

#- 247 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "P3Dsh15D", "country": "RnVaH0By", "dateOfBirth": "oTi9qRm6", "displayName": "HgfcENml", "emailAddress": "nHjQ2r8p", "password": "JlIyWPjX", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 247 'PublicUpgradeHeadlessAccountV3' test.out

#- 248 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "X2tYYvIy", "password": "EuyxyRUI"}' \
    > test.out 2>&1
eval_tap $? 248 'PublicVerifyHeadlessAccountV3' test.out

#- 249 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "iWsQQUod", "newPassword": "OiLxQLap", "oldPassword": "tYQymyBP"}' \
    > test.out 2>&1
eval_tap $? 249 'PublicUpdatePasswordV3' test.out

#- 250 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'AV0IFhCO' \
    > test.out 2>&1
eval_tap $? 250 'PublicCreateJusticeUser' test.out

#- 251 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'x0omD0TQ' \
    --redirectUri 'RfcP6Ext' \
    --ticket 'FxgkT4Ej' \
    > test.out 2>&1
eval_tap $? 251 'PublicPlatformLinkV3' test.out

#- 252 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TR2xczyH' \
    --body '{"platformNamespace": "Uhlch9cT"}' \
    > test.out 2>&1
eval_tap $? 252 'PublicPlatformUnlinkV3' test.out

#- 253 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'km16Ise5' \
    > test.out 2>&1
eval_tap $? 253 'PublicPlatformUnlinkAllV3' test.out

#- 254 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mIMMUtdc' \
    --ticket 'dCDxmw8r' \
    > test.out 2>&1
eval_tap $? 254 'PublicForcePlatformLinkV3' test.out

#- 255 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId '6slnDW8t' \
    --clientId 'opOWO1vM' \
    --redirectUri 'J4U0AmE9' \
    > test.out 2>&1
eval_tap $? 255 'PublicWebLinkPlatform' test.out

#- 256 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CFry5XiQ' \
    --state 'njetV5nh' \
    > test.out 2>&1
eval_tap $? 256 'PublicWebLinkPlatformEstablish' test.out

#- 257 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "S8S6MMjn", "emailAddress": "gj2esPyE", "newPassword": "SHZxM7nU"}' \
    > test.out 2>&1
eval_tap $? 257 'ResetPasswordV3' test.out

#- 258 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6ecQV0in' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetUserByUserIdV3' test.out

#- 259 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QS5hup8I' \
    --activeOnly  \
    --after 'iPpaEwbH' \
    --before 'idZ8nLUx' \
    --limit '100' \
    > test.out 2>&1
eval_tap $? 259 'PublicGetUserBanHistoryV3' test.out

#- 260 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CTAJnp7G' \
    > test.out 2>&1
eval_tap $? 260 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 261 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7jvz6t43' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetUserInformationV3' test.out

#- 262 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q6lqSo69' \
    --after '0.37645188420851516' \
    --before '0.3632034768743996' \
    --limit '8' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetUserLoginHistoriesV3' test.out

#- 263 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BlHT2p5P' \
    --after 'VlYFz1Pe' \
    --before 'YwbBmcvL' \
    --limit '41' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetUserPlatformAccountsV3' test.out

#- 264 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7sHQiZTx' \
    > test.out 2>&1
eval_tap $? 264 'PublicListJusticePlatformAccountsV3' test.out

#- 265 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'GgyOsYFN' \
    --body '{"platformId": "3msOS4pa", "platformUserId": "v9QsX3pJ"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicLinkPlatformAccount' test.out

#- 266 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'at897lWL' \
    --body '{"chosenNamespaces": ["l0YZJnAj", "hxnCg1LA", "e7jStXVw"], "requestId": "9a38mxlB"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicForceLinkPlatformWithProgression' test.out

#- 267 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'L0MKgi0A' \
    > test.out 2>&1
eval_tap $? 267 'PublicGetPublisherUserV3' test.out

#- 268 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MGCqpM2u' \
    --password 'sGTqhnlX' \
    > test.out 2>&1
eval_tap $? 268 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 269 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'GCKTk0Mh' \
    --before 'qJqD67Nm' \
    --isWildcard  \
    --limit '94' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetRolesV3' test.out

#- 270 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'XgCWCiij' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetRoleV3' test.out

#- 271 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 271 'PublicGetMyUserV3' test.out

#- 272 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'LuuNYEsA' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 273 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["HKpolSrp", "8j0tOEp4", "Y0d8VjUf"], "oneTimeLinkCode": "hBt9goFN"}' \
    > test.out 2>&1
eval_tap $? 273 'LinkHeadlessAccountToMyAccountV3' test.out

#- 274 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "zm1S3HW2"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicSendVerificationLinkV3' test.out

#- 275 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'FctNpY16' \
    > test.out 2>&1
eval_tap $? 275 'PublicVerifyUserByLinkV3' test.out

#- 276 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'UOijF20b' \
    --code 'vZ98GG0A' \
    --error 'Uro5wAaq' \
    --state '1fBGF8hi' \
    > test.out 2>&1
eval_tap $? 276 'PlatformAuthenticateSAMLV3Handler' test.out

#- 277 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId '77zhSKwb' \
    --payload 'bJMyTjVM' \
    > test.out 2>&1
eval_tap $? 277 'LoginSSOClient' test.out

#- 278 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'TuZ8w6IF' \
    > test.out 2>&1
eval_tap $? 278 'LogoutSSOClient' test.out

#- 279 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code '0dQWnZTq' \
    > test.out 2>&1
eval_tap $? 279 'RequestGameTokenResponseV3' test.out

#- 280 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lqbiw6up' \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDevicesByUserV4' test.out

#- 281 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'hqhzBL98' \
    --endDate 'rtEqGXhY' \
    --limit '37' \
    --offset '91' \
    --startDate '1k3kBFVh' \
    > test.out 2>&1
eval_tap $? 281 'AdminGetBannedDevicesV4' test.out

#- 282 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BYBlrCzb' \
    > test.out 2>&1
eval_tap $? 282 'AdminGetUserDeviceBansV4' test.out

#- 283 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "ZoPloFRc", "deviceId": "4GkUtpVu", "deviceType": "uWvi0Ncz", "enabled": true, "endDate": "RkYbAMp9", "ext": {"wpCRQaD8": {}, "eSpHr7aj": {}, "WEAwvj3L": {}}, "reason": "u17kHb1E"}' \
    > test.out 2>&1
eval_tap $? 283 'AdminBanDeviceV4' test.out

#- 284 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'v625KenT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'AdminGetDeviceBanV4' test.out

#- 285 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId '4OUlU6Z3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 285 'AdminUpdateDeviceBanV4' test.out

#- 286 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'SxOlCK5t' \
    --startDate '9zpbNXwd' \
    --deviceType 'T9fsloh5' \
    > test.out 2>&1
eval_tap $? 286 'AdminGenerateReportV4' test.out

#- 287 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 287 'AdminGetDeviceTypesV4' test.out

#- 288 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '4XDMRlI1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 288 'AdminGetDeviceBansV4' test.out

#- 289 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'f1Wa5MrQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 289 'AdminDecryptDeviceV4' test.out

#- 290 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'PeNkxdDp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'AdminUnbanDeviceV4' test.out

#- 291 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'BJkyQw37' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'AdminGetUsersByDeviceV4' test.out

#- 292 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 52}' \
    > test.out 2>&1
eval_tap $? 292 'AdminCreateTestUsersV4' test.out

#- 293 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["xMcqF7HJ", "im0yLlIF", "nWYmqQ8T"]}' \
    > test.out 2>&1
eval_tap $? 293 'AdminBulkCheckValidUserIDV4' test.out

#- 294 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ainhnqJU' \
    --body '{"avatarUrl": "Po1zo17Z", "country": "QxUnLvsw", "dateOfBirth": "m2AWw69d", "displayName": "i5bMkWWR", "languageTag": "F4f3glsb", "userName": "vA5TonVZ"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminUpdateUserV4' test.out

#- 295 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aR4a6M5f' \
    --body '{"code": "p5xxtzEs", "emailAddress": "5YItv4vd"}' \
    > test.out 2>&1
eval_tap $? 295 'AdminUpdateUserEmailAddressV4' test.out

#- 296 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QUoyocpt' \
    > test.out 2>&1
eval_tap $? 296 'AdminDisableUserMFAV4' test.out

#- 297 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FFAbkszF' \
    > test.out 2>&1
eval_tap $? 297 'AdminListUserRolesV4' test.out

#- 298 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rCtodBkJ' \
    --body '{"assignedNamespaces": ["50RPuLZ2", "jEMrFeuw", "d7LPAkNJ"], "roleId": "pd2VPoDx"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateUserRoleV4' test.out

#- 299 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wYzsxiHU' \
    --body '{"assignedNamespaces": ["pryav2Du", "iBP2lJco", "AkMsmMBM"], "roleId": "kM90hPlV"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminAddUserRoleV4' test.out

#- 300 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '82RLeeoO' \
    --body '{"assignedNamespaces": ["Tufw9Hb6", "MofZJdv6", "vrO3USHr"], "roleId": "nYImU4mZ"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminRemoveUserRoleV4' test.out

#- 301 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '22' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 301 'AdminGetRolesV4' test.out

#- 302 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "Lhsg3znh"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminCreateRoleV4' test.out

#- 303 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'BwGkuYQe' \
    > test.out 2>&1
eval_tap $? 303 'AdminGetRoleV4' test.out

#- 304 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'CP7JGxti' \
    > test.out 2>&1
eval_tap $? 304 'AdminDeleteRoleV4' test.out

#- 305 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'VmL9iKNJ' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "l4qXiSID"}' \
    > test.out 2>&1
eval_tap $? 305 'AdminUpdateRoleV4' test.out

#- 306 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'tZLDGuHt' \
    --body '{"permissions": [{"action": 38, "resource": "671PJaB3", "schedAction": 12, "schedCron": "ly3nBWAq", "schedRange": ["IXDDnxLJ", "RxrmwcDL", "NOPttoKA"]}, {"action": 56, "resource": "MPEB0J6Y", "schedAction": 63, "schedCron": "sm7Eh824", "schedRange": ["TOpVeZEY", "5XROyZ1C", "VIwMdton"]}, {"action": 17, "resource": "TTBEq78I", "schedAction": 19, "schedCron": "2AdxTfYE", "schedRange": ["6JgYqkn3", "0w0dR18g", "qLt3y8ja"]}]}' \
    > test.out 2>&1
eval_tap $? 306 'AdminUpdateRolePermissionsV4' test.out

#- 307 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'VkfQ7bmR' \
    --body '{"permissions": [{"action": 39, "resource": "lGuf71vY", "schedAction": 34, "schedCron": "NjM8806x", "schedRange": ["sQjxpcdC", "hwcGN3jK", "VZl0Mitk"]}, {"action": 57, "resource": "8JbLKaYg", "schedAction": 80, "schedCron": "Q8W542YU", "schedRange": ["QEMZXz91", "NzPOt5Dx", "4UlPdjFe"]}, {"action": 100, "resource": "Pw34r2or", "schedAction": 4, "schedCron": "RRFYrnE7", "schedRange": ["AnUy4Wrt", "U6eflxvx", "BolDaZRe"]}]}' \
    > test.out 2>&1
eval_tap $? 307 'AdminAddRolePermissionsV4' test.out

#- 308 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'fiLUQGSh' \
    --body '["mkuhXxZ1", "Bz0g7yBb", "U88lS2Fm"]' \
    > test.out 2>&1
eval_tap $? 308 'AdminDeleteRolePermissionsV4' test.out

#- 309 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'uTE8DADU' \
    --after '44ovsQqB' \
    --before '42tKQcH7' \
    --limit '43' \
    > test.out 2>&1
eval_tap $? 309 'AdminListAssignedUsersV4' test.out

#- 310 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'QfhUAjmo' \
    --body '{"assignedNamespaces": ["y2jCzpUo", "9mXFRike", "gTI9Wv2e"], "namespace": "QZkL3df7", "userId": "uZWP83ue"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminAssignUserToRoleV4' test.out

#- 311 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'GKTZ0Fyf' \
    --body '{"namespace": "VIRgPJC9", "userId": "DVjPVMr0"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminRevokeUserFromRoleV4' test.out

#- 312 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "gg2JbWbB", "country": "ezWY36UK", "dateOfBirth": "3rjlm5np", "displayName": "mqskmf74", "languageTag": "03ks9KI8", "userName": "WzXmEQly"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateMyUserV4' test.out

#- 313 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 313 'AdminDisableMyAuthenticatorV4' test.out

#- 314 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'fnzsD2fs' \
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
    --code 'MZKpH6ST' \
    > test.out 2>&1
eval_tap $? 323 'AdminEnableMyEmailV4' test.out

#- 324 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 324 'AdminGetMyEnabledFactorsV4' test.out

#- 325 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'uO4p82Kh' \
    > test.out 2>&1
eval_tap $? 325 'AdminMakeFactorMyDefaultV4' test.out

#- 326 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["jfeONZHd", "zigNnfQq", "GO7R8k9J"], "emailAddresses": ["sOxmsDLX", "p7u1hO63", "WkBFSQUT"], "isAdmin": false, "namespace": "v2aCDBM9", "roleId": "HlMKFlAG"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminInviteUserV4' test.out

#- 327 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "ppztJBF1", "policyId": "lUaWZ9gH", "policyVersionId": "ZZcEjkaq"}, {"isAccepted": false, "localizedPolicyVersionId": "RvyYQnYm", "policyId": "7ONLf4BT", "policyVersionId": "JYCxQBzZ"}, {"isAccepted": false, "localizedPolicyVersionId": "qx60Vlsb", "policyId": "RKk3PzdW", "policyVersionId": "7YFH08Ck"}], "authType": "EMAILPASSWD", "country": "z6ZilI2G", "dateOfBirth": "HRWvlqwH", "displayName": "1emPaizr", "emailAddress": "iXxnBPtZ", "password": "4v1g321T", "passwordMD5Sum": "SbTuXbBi", "username": "LRRMChjs", "verified": true}' \
    > test.out 2>&1
eval_tap $? 327 'PublicCreateTestUserV4' test.out

#- 328 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "yfRAQBYg", "policyId": "mS6jvJYp", "policyVersionId": "aLuQXJPC"}, {"isAccepted": true, "localizedPolicyVersionId": "7G7IsPLC", "policyId": "V3v2NgvT", "policyVersionId": "AZXHdYHM"}, {"isAccepted": true, "localizedPolicyVersionId": "Rf0HImw3", "policyId": "bbdM43qK", "policyVersionId": "ShutlFXv"}], "authType": "EMAILPASSWD", "code": "ty0cxaDL", "country": "S6MWmT8F", "dateOfBirth": "gUWhYd6O", "displayName": "9ZeTIZ1N", "emailAddress": "6NFETbaj", "password": "g7mxHJDi", "passwordMD5Sum": "iALSs1O1", "reachMinimumAge": true, "username": "A0pgkFhZ"}' \
    > test.out 2>&1
eval_tap $? 328 'PublicCreateUserV4' test.out

#- 329 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'BmwqgyMW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "fZbqWcLf", "policyId": "ZP5RxRkf", "policyVersionId": "sLtWHBrG"}, {"isAccepted": true, "localizedPolicyVersionId": "ntnilO42", "policyId": "eh53qj0Z", "policyVersionId": "kfGbvGzW"}, {"isAccepted": true, "localizedPolicyVersionId": "nPNhkxLq", "policyId": "qpl6MxcO", "policyVersionId": "QPjg9397"}], "authType": "EMAILPASSWD", "country": "V0iIZNZN", "dateOfBirth": "A99CyIB3", "displayName": "BL3ebYoA", "password": "CDpOX2Yj", "reachMinimumAge": false, "username": "PiMD84cY"}' \
    > test.out 2>&1
eval_tap $? 329 'CreateUserFromInvitationV4' test.out

#- 330 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "UwXASFrN", "country": "GZimMYoa", "dateOfBirth": "GWWiASqK", "displayName": "oB64Dqsy", "languageTag": "VJbOlvwk", "userName": "77BDnfvS"}' \
    > test.out 2>&1
eval_tap $? 330 'PublicUpdateUserV4' test.out

#- 331 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "lPTLIdu1", "emailAddress": "ZSjKTakJ"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicUpdateUserEmailAddressV4' test.out

#- 332 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "g3awlP9x", "country": "foNXKN44", "dateOfBirth": "Il8qtFES", "displayName": "1jtfpT4k", "emailAddress": "IDhcYV2b", "password": "KCHfej3c", "reachMinimumAge": true, "username": "raTmrTdj", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 332 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 333 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "rhAp0T2l", "password": "b4kePqKA", "username": "ECLYVRDg"}' \
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
    --code 'C7X8cKEf' \
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
    --deviceToken 'b1YCZfIV' \
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
    --code 'MXkFhLEi' \
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
    --factor 'LEUrEO8n' \
    > test.out 2>&1
eval_tap $? 347 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE