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
echo "1..341"

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
    --body '[{"field": "GzZMpcf1", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "blockedWord": ["iw3ccRVA", "1G6EKqsD", "pi59wlPs"], "description": [{"language": "DWYnwt0M", "message": ["b468fR5V", "yA3nebXt", "mwGPyW8d"]}, {"language": "csW84CMY", "message": ["HXrT262u", "Lu0kSOJ3", "05vwRXqg"]}, {"language": "ZkjDbhQj", "message": ["LntdRyf5", "Kl9Z3CCs", "ongXxO3Q"]}], "isCustomRegex": true, "letterCase": "qWaPM61t", "maxLength": 7, "maxRepeatingAlphaNum": 78, "maxRepeatingSpecialCharacter": 50, "minCharType": 38, "minLength": 39, "regex": "2Q1rxQIq", "specialCharacterLocation": "dzWASa6K", "specialCharacters": ["xzYs5imh", "2d5lCtEt", "SmkY22an"]}}, {"field": "k3NngqUF", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": true, "blockedWord": ["sc4cGXog", "oyubMna4", "vD6GYdxo"], "description": [{"language": "aLjGnku9", "message": ["qq5wnCNx", "OLMdkzL9", "rZnQgZus"]}, {"language": "cDnXeRHn", "message": ["ZWY68u3H", "wMK2wfKA", "tbPMuCJ8"]}, {"language": "MxvMlpr3", "message": ["H5hY3OLa", "E8BYeUY1", "3FUaaYuD"]}], "isCustomRegex": false, "letterCase": "eoZ2Q4B9", "maxLength": 95, "maxRepeatingAlphaNum": 98, "maxRepeatingSpecialCharacter": 38, "minCharType": 50, "minLength": 32, "regex": "aEQyHmvp", "specialCharacterLocation": "LmoPoJkQ", "specialCharacters": ["zWQBeBRb", "LQpDjaOA", "I713DpeU"]}}, {"field": "cCZLvWkC", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "blockedWord": ["7YpInpK9", "ZEpz8CSJ", "kmrmnbd2"], "description": [{"language": "zncIN1qb", "message": ["ho778qwm", "e6HbFAvM", "hGG8Mzg6"]}, {"language": "5ZY9OHSN", "message": ["977yRPBv", "PG7FMZ6d", "ytoyNCIv"]}, {"language": "2SzCWSpf", "message": ["CKyDLHP7", "OIlRGhMy", "TWk4Rw9Q"]}], "isCustomRegex": true, "letterCase": "nYVmFtZT", "maxLength": 8, "maxRepeatingAlphaNum": 30, "maxRepeatingSpecialCharacter": 51, "minCharType": 90, "minLength": 31, "regex": "fTHLRTFz", "specialCharacterLocation": "ejQ3FPbh", "specialCharacters": ["lPtffXk7", "aLW0jJlz", "rJkFrPuy"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'N0JVAFAo' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'HUudPzru' \
    --before '1CIsTmpF' \
    --limit '33' \
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
    --body '{"ageRestriction": 25, "enable": true}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'MwjBsQbp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 7}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'gHgejDVw' \
    --limit '9' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "ACRZdxaS", "comment": "DCLFv4di", "endDate": "JMXTUPbb", "reason": "84ZCKJas", "skipNotif": true, "userIds": ["R5Hhc93c", "mRc8mYsj", "M047w07o"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "UhVrE3cL", "userId": "XPNg2Q3g"}, {"banId": "lGOmlyta", "userId": "c6RWL5NG"}, {"banId": "HmF1lNpn", "userId": "T589ELv4"}]}' \
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
    --clientId 'sctVpwxy' \
    --clientName 'KcY89jnr' \
    --clientType 'BLTU2gfu' \
    --limit '18' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["lpNX9wIs", "l2oOrjqT", "Na4cI16p"], "baseUri": "CjK9y0at", "clientId": "Y7UYryN1", "clientName": "H7r1NJfd", "clientPermissions": [{"action": 5, "resource": "xBq5V4Nc", "schedAction": 45, "schedCron": "tG5KfJg0", "schedRange": ["Z2PZZ1Rh", "ZECoDmED", "l7hLoQQZ"]}, {"action": 44, "resource": "6ZEPciMt", "schedAction": 69, "schedCron": "uxcFVSAc", "schedRange": ["cHKIDPht", "YMQo6S63", "UXEi47XM"]}, {"action": 6, "resource": "1wof1Tmp", "schedAction": 34, "schedCron": "cHtcKXu8", "schedRange": ["XsOpoWFb", "NtOq3n4O", "DZyDFZBe"]}], "clientPlatform": "oqRoF9rD", "deletable": false, "description": "JMu0rrZd", "namespace": "AZfgxmHZ", "oauthAccessTokenExpiration": 62, "oauthAccessTokenExpirationTimeUnit": "R0KMKEGK", "oauthClientType": "EflYBJjs", "oauthRefreshTokenExpiration": 40, "oauthRefreshTokenExpirationTimeUnit": "WiFNSliX", "redirectUri": "iNovO9C6", "scopes": ["bSlW0Ser", "fEdvIpe0", "JOlAOaOQ"], "secret": "0RLPvNJT", "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'NqnwYJoY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'cORLFQTC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'RFDbS3XT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["xBzure97", "MXw34TJS", "XiWBc15W"], "baseUri": "c9ScISQ6", "clientName": "h4CXnYGG", "clientPermissions": [{"action": 74, "resource": "N4qAA2wq", "schedAction": 43, "schedCron": "uSncmb8D", "schedRange": ["fJVEPgG0", "mInhtP3K", "m9pFykVk"]}, {"action": 23, "resource": "QmvGhy9a", "schedAction": 42, "schedCron": "piLd8rON", "schedRange": ["dbsfHijy", "dAWnEDkR", "qoqLvDg2"]}, {"action": 80, "resource": "ZuCI6T3k", "schedAction": 100, "schedCron": "zKR3huFF", "schedRange": ["rIFa48zq", "WRvy3cVZ", "jRds3zyP"]}], "clientPlatform": "XRhAtZoC", "deletable": false, "description": "3qwML6AF", "namespace": "fJsWGCJc", "oauthAccessTokenExpiration": 49, "oauthAccessTokenExpirationTimeUnit": "YRi0f9WP", "oauthRefreshTokenExpiration": 58, "oauthRefreshTokenExpirationTimeUnit": "3HPpXF36", "redirectUri": "V4lT2heC", "scopes": ["XfzezKfv", "lbmWiE6q", "QGFr2UAd"], "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'ai63raGJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 26, "resource": "mpkGx4Yy"}, {"action": 0, "resource": "NlKWxrvC"}, {"action": 30, "resource": "9FMHG0ZP"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'aYYR1fNf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 79, "resource": "oUty84T9"}, {"action": 78, "resource": "aM1Kuoad"}, {"action": 56, "resource": "kXMqb6df"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '0' \
    --clientId 'Ix3kwNt0' \
    --namespace "$AB_NAMESPACE" \
    --resource 'ajXEt9VC' \
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
    --limit '10' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'G2fimtAr' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hqao7NAA' \
    --body '{"ACSURL": "VB0oUqHj", "AWSCognitoRegion": "9BDaY34u", "AWSCognitoUserPool": "4XghRgFM", "AllowedClients": ["ce734YHt", "7Yz9SKRJ", "ThSaMf0f"], "AppId": "nZ2kSbV6", "AuthorizationEndpoint": "TS5o4IL6", "ClientId": "9mQN5SZR", "Environment": "nRtaJdpL", "FederationMetadataURL": "CxlwLB57", "GenericOauthFlow": true, "IsActive": false, "Issuer": "rBl0XIQB", "JWKSEndpoint": "G7tLp6sm", "KeyID": "858rSTGS", "NetflixCertificates": {"encryptedPrivateKey": "bxLHzcNe", "encryptedPrivateKeyName": "59pXIrSB", "publicCertificate": "F42GEa1T", "publicCertificateName": "ACXXQjkV", "rootCertificate": "4U13DSKS", "rootCertificateName": "Kx5JDa6N"}, "OrganizationId": "8L2xEPa7", "PlatformName": "rqypfVTt", "RedirectUri": "OOQiE6XX", "RegisteredDomains": [{"affectedClientIDs": ["UI9IExJH", "KPO7vxFy", "mWkQ3BYF"], "domain": "n5IEqtjK", "namespaces": ["iKwFGgWW", "5gr2IGDT", "SNUUx2jI"], "roleId": "fKLtT2kD"}, {"affectedClientIDs": ["qAkPK2BO", "lf17odDT", "fqbXS79u"], "domain": "gnnuq7Tw", "namespaces": ["z9RO3ZKN", "KijXA5Kf", "uktfRAJJ"], "roleId": "D4B1EzVR"}, {"affectedClientIDs": ["BkKH2MCX", "fYbBm7vK", "5KEJvsqQ"], "domain": "qswRcVCg", "namespaces": ["voWul7GZ", "yoVmhFus", "QJUriFq6"], "roleId": "vnohwg55"}], "Secret": "swxj5hTZ", "TeamID": "zkt5eGuI", "TokenAuthenticationType": "5qApyEXr", "TokenClaimsMapping": {"I9TtzOOt": "9n71bE3U", "kEl6n0NO": "9ECuPnJ6", "3dHqjx8n": "WsDtCZxP"}, "TokenEndpoint": "U9K5UUc4", "scopes": ["ZWoO0kQ6", "c8wRoGAn", "7V0ZTCrf"]}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lMJVWgru' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LmuloKlt' \
    --body '{"ACSURL": "kbIDNgJ8", "AWSCognitoRegion": "UUpcilIt", "AWSCognitoUserPool": "x0lLcudC", "AllowedClients": ["a96seIWA", "c3Ahbsiq", "xffjNEl5"], "AppId": "Qi9wJ8I3", "AuthorizationEndpoint": "olaTYA0e", "ClientId": "Hn7NrziX", "Environment": "6yktDGYc", "FederationMetadataURL": "LIRsRnNw", "GenericOauthFlow": true, "IsActive": false, "Issuer": "CzRfgFGt", "JWKSEndpoint": "Gbzjmlqc", "KeyID": "QMeyVoOQ", "NetflixCertificates": {"encryptedPrivateKey": "2Dinck0M", "encryptedPrivateKeyName": "VakpX61p", "publicCertificate": "GjjXttEE", "publicCertificateName": "IGIEDqex", "rootCertificate": "5ze1BY1c", "rootCertificateName": "LD6fVmMU"}, "OrganizationId": "NlqlhPGI", "PlatformName": "NHDW8PsU", "RedirectUri": "wV50QqYg", "RegisteredDomains": [{"affectedClientIDs": ["EKpqOWSW", "ydU2qcG3", "NjHTh1T1"], "domain": "SpS4UVE9", "namespaces": ["Qcm5grWQ", "0uma6t9P", "gNRC8Jfn"], "roleId": "rYUEPb6K"}, {"affectedClientIDs": ["ihkY2Ff2", "9WYMdqlU", "ZGVkQJ2P"], "domain": "XQ24cMYC", "namespaces": ["yndZKCdy", "kHqTWmNA", "gikSZxFj"], "roleId": "WgTWnMTr"}, {"affectedClientIDs": ["ENe1KGi1", "9ZhC9jfG", "bWhRjnMc"], "domain": "Pr8yCD9U", "namespaces": ["TYKKUOoF", "4v7KCpOA", "KU6slqwS"], "roleId": "3Yocg1wf"}], "Secret": "8H39e3Hl", "TeamID": "gJmPWPs3", "TokenAuthenticationType": "8PZnOcza", "TokenClaimsMapping": {"MMB5Rqof": "DsGB8uj2", "uQPXfHz9": "sMWSmT94", "XA11BeZz": "zlPYv034"}, "TokenEndpoint": "hPR8EXzc", "scopes": ["mg2zkG86", "aKn5ogQL", "6n0aROg8"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PABr95Wc' \
    --body '{"affectedClientIDs": ["VgK6LfSe", "2ewX8mnc", "HriWiQGM"], "assignedNamespaces": ["xkL8tmqF", "Mj2SchUI", "jj2V6B2m"], "domain": "6NwE6gXr", "roleId": "6VJDvTuE"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'A5Dpvh1l' \
    --body '{"domain": "DEo7YqoI"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Z9nKi1rx' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'S9sBtT2U' \
    --body '{"acsUrl": "MUCXov4d", "apiKey": "t2R4zDY5", "appId": "qaxJwGB5", "federationMetadataUrl": "f6iwgxfY", "isActive": true, "redirectUri": "m7GzYhKF", "secret": "Z7Nv0C8D", "ssoUrl": "dSDTpekL"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'unlg4Tnx' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '4oy50Qn8' \
    --body '{"acsUrl": "X5QKZ1kX", "apiKey": "oFkAMaCS", "appId": "dSODLust", "federationMetadataUrl": "DFK76RJT", "isActive": false, "redirectUri": "GPsrxoZr", "secret": "O12mIVS5", "ssoUrl": "tPXwCqQA"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3XoFkcqB' \
    --platformUserId 'HXohtSn1' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'BU8ox51x' \
    --after '92' \
    --before '59' \
    --limit '78' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'Hb4TH4JZ' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["4PZ3xxSS", "90PLqziw", "MItgTq9a"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["kuyEctTy", "QstSh5NO", "H2cQqBte"], "isAdmin": true, "roles": ["0f6zm91I", "rSqWc5qC", "WPSjfHHc"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 146 'AdminListUsersV3' test.out

#- 147 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'Mholi1Tg' \
    --endDate '5fBDx8oN' \
    --limit '56' \
    --offset '18' \
    --platformBy 'pvsC14wg' \
    --platformId 'Y6QL1XwG' \
    --query '8YTDeM7D' \
    --startDate 'XwOgU8kG' \
    > test.out 2>&1
eval_tap $? 147 'AdminSearchUserV3' test.out

#- 148 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["s3uT5ckl", "YICN2E9A", "2s69zhSV"]}' \
    > test.out 2>&1
eval_tap $? 148 'AdminGetBulkUserByEmailAddressV3' test.out

#- 149 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZS08qDIT' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserByUserIdV3' test.out

#- 150 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aFiE4EMV' \
    --body '{"avatarUrl": "KdFALKtT", "country": "h4Qcl7vt", "dateOfBirth": "0IQkX5ZK", "displayName": "pplxGKec", "languageTag": "HbI04AUh", "userName": "VKPKP0VH"}' \
    > test.out 2>&1
eval_tap $? 150 'AdminUpdateUserV3' test.out

#- 151 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '77yYxtmD' \
    --activeOnly  \
    --after 'QBX4VIdh' \
    --before 'EsUZAR8c' \
    --limit '94' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserBanV3' test.out

#- 152 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yduqwZRD' \
    --body '{"ban": "ikdoQKHJ", "comment": "0Z9HelwB", "endDate": "FY2z4jbF", "reason": "z0uZJkiu", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 152 'AdminBanUserV3' test.out

#- 153 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'CRN1NWmJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wl5ySBtW' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 153 'AdminUpdateUserBanV3' test.out

#- 154 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3v0aHKzp' \
    --body '{"context": "1bk6bzPH", "emailAddress": "uFGfHRoG", "languageTag": "Z0sMY0Zd"}' \
    > test.out 2>&1
eval_tap $? 154 'AdminSendVerificationCodeV3' test.out

#- 155 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PWrhjsEY' \
    --body '{"Code": "nKNXhOQG", "ContactType": "vjThXEMK", "LanguageTag": "A7xlRyzA", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 155 'AdminVerifyAccountV3' test.out

#- 156 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'mziVaqh2' \
    > test.out 2>&1
eval_tap $? 156 'GetUserVerificationCode' test.out

#- 157 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bpxO5KXp' \
    > test.out 2>&1
eval_tap $? 157 'AdminGetUserDeletionStatusV3' test.out

#- 158 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'knzl7dnC' \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 158 'AdminUpdateUserDeletionStatusV3' test.out

#- 159 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yi1Jl34U' \
    --body '{"code": "I7mtyJkI", "country": "xZJXPfAE", "dateOfBirth": "xqksLI3g", "displayName": "2atEKS0Y", "emailAddress": "U4on7QSg", "password": "Vd9Ft9mJ", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpgradeHeadlessAccountV3' test.out

#- 160 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eDP8xwS2' \
    > test.out 2>&1
eval_tap $? 160 'AdminDeleteUserInformationV3' test.out

#- 161 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bh5hF6o7' \
    --after '0.263119398130204' \
    --before '0.2338510100747644' \
    --limit '96' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetUserLoginHistoriesV3' test.out

#- 162 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EF8Sy1zd' \
    --body '{"languageTag": "g4VoRiUR", "newPassword": "ts7PXRlH", "oldPassword": "nUnKhLZ3"}' \
    > test.out 2>&1
eval_tap $? 162 'AdminResetPasswordV3' test.out

#- 163 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'spAMi7de' \
    --body '{"Permissions": [{"Action": 10, "Resource": "aKuviMHL", "SchedAction": 68, "SchedCron": "eV4EG5k5", "SchedRange": ["uELXzvSt", "8uASlaxv", "QEKxWIGX"]}, {"Action": 0, "Resource": "rwP8bEWg", "SchedAction": 88, "SchedCron": "wyvLxSBs", "SchedRange": ["Qq5RE5O3", "BmJU8J0u", "HAeqnw3x"]}, {"Action": 22, "Resource": "Vmyqm5bi", "SchedAction": 56, "SchedCron": "7JnSuNNC", "SchedRange": ["hPt1e0AS", "OOesiSCf", "tQgJDHM3"]}]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminUpdateUserPermissionV3' test.out

#- 164 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zJRwORfX' \
    --body '{"Permissions": [{"Action": 8, "Resource": "0NoYfZxN", "SchedAction": 44, "SchedCron": "HLCh4eJw", "SchedRange": ["3oJoubrD", "YzmiPzv2", "Sot5lKmZ"]}, {"Action": 78, "Resource": "74mAb6fo", "SchedAction": 51, "SchedCron": "QoX0kg5m", "SchedRange": ["mx940uEy", "V6MRtrlB", "Oot5l4qc"]}, {"Action": 24, "Resource": "nGtUkCTX", "SchedAction": 55, "SchedCron": "KrksceeZ", "SchedRange": ["A8nTwbOy", "O4sgrf3q", "N2JU72Te"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminAddUserPermissionsV3' test.out

#- 165 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VvNLSSpk' \
    --body '[{"Action": 42, "Resource": "AHONQXNa"}, {"Action": 10, "Resource": "5cwdbCCJ"}, {"Action": 18, "Resource": "FiUTTpSQ"}]' \
    > test.out 2>&1
eval_tap $? 165 'AdminDeleteUserPermissionBulkV3' test.out

#- 166 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '21' \
    --namespace "$AB_NAMESPACE" \
    --resource 'CNCuOOJs' \
    --userId 'j1MS3xom' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionV3' test.out

#- 167 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9e8ZKdoh' \
    --after '6rBfCPBD' \
    --before 'LBAQKVJq' \
    --limit '43' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserPlatformAccountsV3' test.out

#- 168 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '5ORDd8va' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetListJusticePlatformAccounts' test.out

#- 169 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '0HgTKKMl' \
    --userId 'rwSHSpOn' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetUserMapping' test.out

#- 170 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'ZlUzLJhC' \
    --userId 'uz01J1W4' \
    > test.out 2>&1
eval_tap $? 170 'AdminCreateJusticeUser' test.out

#- 171 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'r8jcUjN3' \
    --body '{"platformId": "1bSTsAQz", "platformUserId": "h04WhNhX"}' \
    > test.out 2>&1
eval_tap $? 171 'AdminLinkPlatformAccount' test.out

#- 172 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pkacY7IA' \
    --userId 'eJigP9XB' \
    --body '{"platformNamespace": "JEKEodfg"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminPlatformUnlinkV3' test.out

#- 173 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CXbLd5Fy' \
    --userId '7CnzMDpr' \
    --ticket 'WTKYtZUz' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformLinkV3' test.out

#- 174 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xXgIzPxy' \
    --userId 'GT4uSgzI' \
    --platformToken 'WMZ7pi6J' \
    > test.out 2>&1
eval_tap $? 174 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 175 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RxH9B5Xj' \
    --body '["uuEhlae9", "Dlh80uMX", "ARUN92JR"]' \
    > test.out 2>&1
eval_tap $? 175 'AdminDeleteUserRolesV3' test.out

#- 176 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6gbJlKE2' \
    --body '[{"namespace": "Em23VSd9", "roleId": "EnUO7zXb"}, {"namespace": "pI1TYdOg", "roleId": "hUogJoug"}, {"namespace": "YrdTzbAy", "roleId": "vHlBORLy"}]' \
    > test.out 2>&1
eval_tap $? 176 'AdminSaveUserRoleV3' test.out

#- 177 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'vImoRjOC' \
    --userId 'Z6NPt9EG' \
    > test.out 2>&1
eval_tap $? 177 'AdminAddUserRoleV3' test.out

#- 178 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'PKmRo0no' \
    --userId 'NXHMGgDc' \
    > test.out 2>&1
eval_tap $? 178 'AdminDeleteUserRoleV3' test.out

#- 179 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 's7ctUBbk' \
    --body '{"enabled": true, "reason": "WKiFhxqN"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminUpdateUserStatusV3' test.out

#- 180 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5evS428Q' \
    > test.out 2>&1
eval_tap $? 180 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 181 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'jZHr7fp6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "hjYKaQHW"}' \
    > test.out 2>&1
eval_tap $? 181 'AdminUpdateClientSecretV3' test.out

#- 182 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'wtbi8QXg' \
    --before 'ucNu19bt' \
    --isWildcard  \
    --limit '11' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetRolesV3' test.out

#- 183 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "managers": [{"displayName": "BEXYh2Cj", "namespace": "hVjUHYN4", "userId": "Kw2DqKu7"}, {"displayName": "SspJXt1N", "namespace": "DsVWrvN5", "userId": "iN8z2kDS"}, {"displayName": "AosaNbL5", "namespace": "hleZzYGe", "userId": "75KKkG0S"}], "members": [{"displayName": "xIMLbhbV", "namespace": "z34RxDH3", "userId": "eO8oEeGs"}, {"displayName": "3P8H9L3V", "namespace": "rxG3OIKF", "userId": "iepemgHI"}, {"displayName": "TdVwjxaG", "namespace": "Qf5a8dK7", "userId": "AUTodBH2"}], "permissions": [{"action": 45, "resource": "tSlopNRR", "schedAction": 9, "schedCron": "pb7QCApo", "schedRange": ["bwQKndyY", "1Gn7Mq6q", "GAAZSY5l"]}, {"action": 2, "resource": "5pLvbX6u", "schedAction": 44, "schedCron": "bW6talWM", "schedRange": ["wg4juxhl", "9UkT0vAi", "P31CutGa"]}, {"action": 89, "resource": "tIbjlRhR", "schedAction": 81, "schedCron": "n13dRMO3", "schedRange": ["bKi24e3h", "IELCNqNf", "2cKX7ZDk"]}], "roleName": "ELQjrFXG"}' \
    > test.out 2>&1
eval_tap $? 183 'AdminCreateRoleV3' test.out

#- 184 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'BipUZhiD' \
    > test.out 2>&1
eval_tap $? 184 'AdminGetRoleV3' test.out

#- 185 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'EPEna20O' \
    > test.out 2>&1
eval_tap $? 185 'AdminDeleteRoleV3' test.out

#- 186 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'gr1t9DlP' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "4X5rKbab"}' \
    > test.out 2>&1
eval_tap $? 186 'AdminUpdateRoleV3' test.out

#- 187 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'q7ZeFIx8' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetRoleAdminStatusV3' test.out

#- 188 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId '4Mr2lWWl' \
    > test.out 2>&1
eval_tap $? 188 'AdminUpdateAdminRoleStatusV3' test.out

#- 189 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'ZdaP6AsC' \
    > test.out 2>&1
eval_tap $? 189 'AdminRemoveRoleAdminV3' test.out

#- 190 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId '65rSwMwn' \
    --after 'Hhbxn6SN' \
    --before '7wcbEwZn' \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 190 'AdminGetRoleManagersV3' test.out

#- 191 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'K2dSPOnR' \
    --body '{"managers": [{"displayName": "0Sw7fb0U", "namespace": "ZuJHQHwn", "userId": "EHU3JHJV"}, {"displayName": "lbi91uxi", "namespace": "MOa8jZn1", "userId": "IRDp5xz4"}, {"displayName": "kFzJZAUj", "namespace": "uWEY8tyJ", "userId": "jJI8QPDW"}]}' \
    > test.out 2>&1
eval_tap $? 191 'AdminAddRoleManagersV3' test.out

#- 192 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'R4FDoS7b' \
    --body '{"managers": [{"displayName": "OedBr0aP", "namespace": "ZCNHneaS", "userId": "BTfY6X23"}, {"displayName": "VwnIv1Eu", "namespace": "xBPQn5tI", "userId": "9VwBWwt9"}, {"displayName": "NObwGWB3", "namespace": "DLW0mhEt", "userId": "UWX85Iit"}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminRemoveRoleManagersV3' test.out

#- 193 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId '3jQhClLi' \
    --after 'UNHf88In' \
    --before 'wqmwPklh' \
    --limit '70' \
    > test.out 2>&1
eval_tap $? 193 'AdminGetRoleMembersV3' test.out

#- 194 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'u65hkkEf' \
    --body '{"members": [{"displayName": "jD3lwDuA", "namespace": "Mw45Vwws", "userId": "DolGXBu4"}, {"displayName": "bux8hytI", "namespace": "qC26Vx1C", "userId": "fk3UYZbQ"}, {"displayName": "d6B69mzm", "namespace": "GKxsZ6Kf", "userId": "9OAecpRp"}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminAddRoleMembersV3' test.out

#- 195 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'NSfTF9y5' \
    --body '{"members": [{"displayName": "zAoyNXnF", "namespace": "zIhU0oaZ", "userId": "uaBcAmzU"}, {"displayName": "PB6JYCF2", "namespace": "P3BjEs0i", "userId": "BKtYYmNE"}, {"displayName": "oPFQmC45", "namespace": "FCKHpDaK", "userId": "Nq6MPjEq"}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminRemoveRoleMembersV3' test.out

#- 196 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'ePaJ5eGS' \
    --body '{"permissions": [{"action": 11, "resource": "hgFFApoT", "schedAction": 16, "schedCron": "HfFmYHie", "schedRange": ["5VMaV507", "f48twkMx", "M4p43rr2"]}, {"action": 11, "resource": "w6fj72KB", "schedAction": 62, "schedCron": "NiD5IngW", "schedRange": ["ap6LFInj", "ZmmDxyZE", "UEZJdgpe"]}, {"action": 72, "resource": "iIpqTaMf", "schedAction": 69, "schedCron": "lxcnYsjD", "schedRange": ["J4Cf01QR", "R4oC1ZZx", "OyDHMoiq"]}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminUpdateRolePermissionsV3' test.out

#- 197 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'rQYy0mym' \
    --body '{"permissions": [{"action": 87, "resource": "u4sK7CSr", "schedAction": 39, "schedCron": "8T5FT3TP", "schedRange": ["hg735voc", "iDc51Tm9", "pUsPSDHd"]}, {"action": 45, "resource": "LbWaFNFX", "schedAction": 43, "schedCron": "bhgDFP8m", "schedRange": ["X68F6G9i", "vDnKYKDD", "cmbVLIiH"]}, {"action": 50, "resource": "6gKo73iZ", "schedAction": 68, "schedCron": "3VAX5WqT", "schedRange": ["v4w1AqsY", "yi9HjETW", "fAx3bppz"]}]}' \
    > test.out 2>&1
eval_tap $? 197 'AdminAddRolePermissionsV3' test.out

#- 198 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'irc1xeJ1' \
    --body '["tkWSQMug", "AJd1IvPA", "nQN2aOLw"]' \
    > test.out 2>&1
eval_tap $? 198 'AdminDeleteRolePermissionsV3' test.out

#- 199 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '70' \
    --resource 'OMKcEkVV' \
    --roleId 'ZmuBsa95' \
    > test.out 2>&1
eval_tap $? 199 'AdminDeleteRolePermissionV3' test.out

#- 200 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 200 'AdminGetMyUserV3' test.out

#- 201 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId '6eovMYlT' \
    --extendExp  \
    --redirectUri 'i4mfiCzk' \
    --password 'KRqjT2GI' \
    --requestId 'E3980GT6' \
    --userName 'PCj5zA4O' \
    > test.out 2>&1
eval_tap $? 201 'UserAuthenticationV3' test.out

#- 202 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'rUnjxckK' \
    --linkingToken 'gQyTKrAH' \
    --password 'Y4u3hTQA' \
    --username 'WIrh5ZCq' \
    > test.out 2>&1
eval_tap $? 202 'AuthenticationWithPlatformLinkV3' test.out

#- 203 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken '7onv9D0g' \
    > test.out 2>&1
eval_tap $? 203 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 204 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 204 'GetCountryLocationV3' test.out

#- 205 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 205 'Logout' test.out

#- 206 RequestGameTokenCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenCodeResponseV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'VwqcDkPN' \
    > test.out 2>&1
eval_tap $? 206 'RequestGameTokenCodeResponseV3' test.out

#- 207 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oUduaiKn' \
    --userId 'x9zsGrGX' \
    > test.out 2>&1
eval_tap $? 207 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 208 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mxZ6aEeJ' \
    > test.out 2>&1
eval_tap $? 208 'RevokeUserV3' test.out

#- 209 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'opydL6bn' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --redirectUri '0UTCkLco' \
    --scope '8X747OuI' \
    --state 'rmTh5j4J' \
    --targetAuthPage '649DTL3Q' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'VpVmlM9F' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 209 'AuthorizeV3' test.out

#- 210 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'UkGCY55k' \
    > test.out 2>&1
eval_tap $? 210 'TokenIntrospectionV3' test.out

#- 211 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 211 'GetJWKSV3' test.out

#- 212 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId '35MoQzyN' \
    --factor 'd529TRHN' \
    --mfaToken 'UwwOKt9a' \
    > test.out 2>&1
eval_tap $? 212 'SendMFAAuthenticationCode' test.out

#- 213 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'wnGeyxCb' \
    --mfaToken '9VZOkJ5w' \
    > test.out 2>&1
eval_tap $? 213 'Change2faMethod' test.out

#- 214 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'w03d8cM2' \
    --factor '5Lmp5Nmb' \
    --mfaToken 'IXmot6Bv' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 214 'Verify2faCode' test.out

#- 215 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '31O1lXqI' \
    --userId 'Wye73aXJ' \
    > test.out 2>&1
eval_tap $? 215 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 216 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId '2s1crNiD' \
    --clientId 'zOPExvcy' \
    --redirectUri 'ez0bGuVV' \
    --requestId 'swDNPMXM' \
    > test.out 2>&1
eval_tap $? 216 'AuthCodeRequestV3' test.out

#- 217 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'nJAdjrfC' \
    --clientId 'ciRwrgkw' \
    --createHeadless  \
    --deviceId 'ap136WzD' \
    --macAddress 'Vr9dg0Fn' \
    --platformToken 'gGEWBCVB' \
    > test.out 2>&1
eval_tap $? 217 'PlatformTokenGrantV3' test.out

#- 218 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 218 'GetRevocationListV3' test.out

#- 219 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'Fy77Dxym' \
    > test.out 2>&1
eval_tap $? 219 'TokenRevocationV3' test.out

#- 220 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'kTkHd0xV' \
    --code 'Eb6eE3QU' \
    --codeVerifier 'sYjG3TxL' \
    --extendExp  \
    --password 'Ao8KyLN1' \
    --redirectUri 'CQYGIGqb' \
    --refreshToken 'MtfgJSz2' \
    --username 'j3x0xFzJ' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 220 'TokenGrantV3' test.out

#- 221 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'Cm5Tyvcd' \
    > test.out 2>&1
eval_tap $? 221 'VerifyTokenV3' test.out

#- 222 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'gcmKBswE' \
    --code 'FvhDRplv' \
    --error 'lBVq6UYL' \
    --openidAssocHandle 'J6Bazddg' \
    --openidClaimedId 'CnSjuhPt' \
    --openidIdentity '3f68gGUJ' \
    --openidMode '4hGsCfK1' \
    --openidNs 'FesDkVqn' \
    --openidOpEndpoint 'Bdcc2aU2' \
    --openidResponseNonce 'QT3biuQu' \
    --openidReturnTo 'wuIueHHX' \
    --openidSig '69kN9ABP' \
    --openidSigned '7zZfAMLa' \
    --state 'Ib5huqQO' \
    > test.out 2>&1
eval_tap $? 222 'PlatformAuthenticationV3' test.out

#- 223 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'vJQ4Qtf1' \
    > test.out 2>&1
eval_tap $? 223 'PublicGetInputValidations' test.out

#- 224 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'UvRXJajV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 224 'PublicGetCountryAgeRestrictionV3' test.out

#- 225 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 225 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 226 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'EdzrHCNj' \
    > test.out 2>&1
eval_tap $? 226 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 227 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'NwYguszT' \
    --body '{"platformUserIds": ["cMP6q8Pd", "4nwKDDyM", "uGs9covg"]}' \
    > test.out 2>&1
eval_tap $? 227 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 228 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XhBXcRTo' \
    --platformUserId 'yHq1jStX' \
    > test.out 2>&1
eval_tap $? 228 'PublicGetUserByPlatformUserIDV3' test.out

#- 229 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'obYI8ywl' \
    > test.out 2>&1
eval_tap $? 229 'PublicGetAsyncStatus' test.out

#- 230 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '7805CQbd' \
    --limit '70' \
    --offset '5' \
    --query 'VYuBQxoF' \
    > test.out 2>&1
eval_tap $? 230 'PublicSearchUserV3' test.out

#- 231 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "Amy5Sm7n", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "4FjJE5Vr", "policyId": "CelXId45", "policyVersionId": "7YYcIPOW"}, {"isAccepted": false, "localizedPolicyVersionId": "nb2eiWHK", "policyId": "85DmKpBq", "policyVersionId": "eutBMBo2"}, {"isAccepted": true, "localizedPolicyVersionId": "Bwoi2iey", "policyId": "aVXKrd1S", "policyVersionId": "qDxJummh"}], "authType": "aDjLcbfw", "code": "3aPDeMhM", "country": "M18Rzyk6", "dateOfBirth": "7K57uAQs", "displayName": "TCPlT2Su", "emailAddress": "UY1w6zxk", "password": "VsIuJ29p", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 231 'PublicCreateUserV3' test.out

#- 232 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'wwbJK252' \
    --query 'AnEjQegg' \
    > test.out 2>&1
eval_tap $? 232 'CheckUserAvailability' test.out

#- 233 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["3Hs6bFhY", "7r3xSRgr", "ZXiFME9I"]}' \
    > test.out 2>&1
eval_tap $? 233 'PublicBulkGetUsers' test.out

#- 234 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "hd8hQ425", "languageTag": "CIXMt5Nf"}' \
    > test.out 2>&1
eval_tap $? 234 'PublicSendRegistrationCode' test.out

#- 235 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "tA32U9kF", "emailAddress": "DBf2P7wi"}' \
    > test.out 2>&1
eval_tap $? 235 'PublicVerifyRegistrationCode' test.out

#- 236 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "9J6D45G6", "languageTag": "v1gQlYGL"}' \
    > test.out 2>&1
eval_tap $? 236 'PublicForgotPasswordV3' test.out

#- 237 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'AJ4jUjhZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 237 'GetAdminInvitationV3' test.out

#- 238 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'iunDjJn4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "9TfHGwSu", "policyId": "Ic4WdcB1", "policyVersionId": "Ls9v7JHt"}, {"isAccepted": false, "localizedPolicyVersionId": "sJo9ZRx9", "policyId": "pONGXAVg", "policyVersionId": "OUhMfT0v"}, {"isAccepted": true, "localizedPolicyVersionId": "lsGVXLx7", "policyId": "rD29XkIf", "policyVersionId": "f6NuPbqV"}], "authType": "EMAILPASSWD", "country": "9meNy6S7", "dateOfBirth": "lhncN8Pq", "displayName": "D2iqJHZo", "password": "2I3bGrIm", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 238 'CreateUserFromInvitationV3' test.out

#- 239 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "IrED5UUg", "country": "KMXteqVR", "dateOfBirth": "UlnhYxYo", "displayName": "uVR9HtOj", "languageTag": "RLdAoUe9", "userName": "EqPxrDwi"}' \
    > test.out 2>&1
eval_tap $? 239 'UpdateUserV3' test.out

#- 240 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "XkYNP7dU", "country": "SG61Kicp", "dateOfBirth": "xPffdzcH", "displayName": "3wq6lrIN", "languageTag": "9cKyNiOG", "userName": "qLsy8wU2"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicPartialUpdateUserV3' test.out

#- 241 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "r94ASNVn", "emailAddress": "TmmWCOWT", "languageTag": "uWvlGF12"}' \
    > test.out 2>&1
eval_tap $? 241 'PublicSendVerificationCodeV3' test.out

#- 242 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "EFvENaYT", "contactType": "Hlg0eZsy", "languageTag": "4XNsrPAH", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 242 'PublicUserVerificationV3' test.out

#- 243 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "0ckXMO9v", "country": "qGYscQ0n", "dateOfBirth": "QQi3vx5q", "displayName": "cicOpDAH", "emailAddress": "zDDyr6kN", "password": "jiSaFGMr", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 243 'PublicUpgradeHeadlessAccountV3' test.out

#- 244 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "ryR0czvf", "password": "wfDtkScK"}' \
    > test.out 2>&1
eval_tap $? 244 'PublicVerifyHeadlessAccountV3' test.out

#- 245 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "RWq3mcGa", "newPassword": "v3ViiWAl", "oldPassword": "0FEROApN"}' \
    > test.out 2>&1
eval_tap $? 245 'PublicUpdatePasswordV3' test.out

#- 246 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'YIu62Ppx' \
    > test.out 2>&1
eval_tap $? 246 'PublicCreateJusticeUser' test.out

#- 247 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dLM4Qycx' \
    --redirectUri 'y15FwDUu' \
    --ticket 'wscz9CVP' \
    > test.out 2>&1
eval_tap $? 247 'PublicPlatformLinkV3' test.out

#- 248 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XGtKAXBo' \
    --body '{"platformNamespace": "fGCxQtvh"}' \
    > test.out 2>&1
eval_tap $? 248 'PublicPlatformUnlinkV3' test.out

#- 249 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PvvvqENd' \
    > test.out 2>&1
eval_tap $? 249 'PublicPlatformUnlinkAllV3' test.out

#- 250 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xfaNCRTA' \
    --ticket '6I3MCjDB' \
    > test.out 2>&1
eval_tap $? 250 'PublicForcePlatformLinkV3' test.out

#- 251 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wlyvEQdk' \
    --clientId 'AhpVAQ5U' \
    --redirectUri 'pBACiA1m' \
    > test.out 2>&1
eval_tap $? 251 'PublicWebLinkPlatform' test.out

#- 252 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wG8rHXI2' \
    --state 'gwqqSDbh' \
    > test.out 2>&1
eval_tap $? 252 'PublicWebLinkPlatformEstablish' test.out

#- 253 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "NcTXMjHe", "emailAddress": "g6YLXDip", "newPassword": "BqiI6Dvc"}' \
    > test.out 2>&1
eval_tap $? 253 'ResetPasswordV3' test.out

#- 254 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hLqV4qYt' \
    > test.out 2>&1
eval_tap $? 254 'PublicGetUserByUserIdV3' test.out

#- 255 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GYOAvt33' \
    --activeOnly  \
    --after 'OHHfjUUd' \
    --before 'WOmFEGxG' \
    --limit '5' \
    > test.out 2>&1
eval_tap $? 255 'PublicGetUserBanHistoryV3' test.out

#- 256 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'K4lXVbrr' \
    > test.out 2>&1
eval_tap $? 256 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 257 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eWYPmEMB' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetUserInformationV3' test.out

#- 258 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'X4P2YPzb' \
    --after '0.8583060510631237' \
    --before '0.379631102474575' \
    --limit '84' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetUserLoginHistoriesV3' test.out

#- 259 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HEmkklsm' \
    --after '8PWfQFon' \
    --before 'GnjalUzr' \
    --limit '61' \
    > test.out 2>&1
eval_tap $? 259 'PublicGetUserPlatformAccountsV3' test.out

#- 260 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tQcLUXhx' \
    > test.out 2>&1
eval_tap $? 260 'PublicListJusticePlatformAccountsV3' test.out

#- 261 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'H4kTune5' \
    --body '{"platformId": "i00oJYij", "platformUserId": "I5ecVjEr"}' \
    > test.out 2>&1
eval_tap $? 261 'PublicLinkPlatformAccount' test.out

#- 262 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'CMrUn23b' \
    --body '{"chosenNamespaces": ["0IDIX3mN", "imFCI6RN", "KadDJ42G"], "requestId": "X6FaU2HI"}' \
    > test.out 2>&1
eval_tap $? 262 'PublicForceLinkPlatformWithProgression' test.out

#- 263 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'czQqt8q3' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetPublisherUserV3' test.out

#- 264 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'g11Gs5DS' \
    --password 'hHqYnTbY' \
    > test.out 2>&1
eval_tap $? 264 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 265 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'MiGIW5jp' \
    --before 'gAc4GawA' \
    --isWildcard  \
    --limit '5' \
    > test.out 2>&1
eval_tap $? 265 'PublicGetRolesV3' test.out

#- 266 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'klbU4gXN' \
    > test.out 2>&1
eval_tap $? 266 'PublicGetRoleV3' test.out

#- 267 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 267 'PublicGetMyUserV3' test.out

#- 268 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "ZVTZL0Tn"}' \
    > test.out 2>&1
eval_tap $? 268 'PublicSendVerificationLinkV3' test.out

#- 269 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'ceGuWnwV' \
    > test.out 2>&1
eval_tap $? 269 'PublicVerifyUserByLinkV3' test.out

#- 270 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'QPuzjxUa' \
    --code 'FrNwfvpr' \
    --error '5kVpyB2O' \
    --state 'XqxwIeMa' \
    > test.out 2>&1
eval_tap $? 270 'PlatformAuthenticateSAMLV3Handler' test.out

#- 271 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'cM3abQS9' \
    --payload 'bPSExZyw' \
    > test.out 2>&1
eval_tap $? 271 'LoginSSOClient' test.out

#- 272 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'Q19LzRHU' \
    > test.out 2>&1
eval_tap $? 272 'LogoutSSOClient' test.out

#- 273 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'QYG8SA2C' \
    > test.out 2>&1
eval_tap $? 273 'RequestGameTokenResponseV3' test.out

#- 274 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '49Hmu1aX' \
    > test.out 2>&1
eval_tap $? 274 'AdminGetDevicesByUserV4' test.out

#- 275 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'bFVAzNZg' \
    --endDate 'CbNYaC7C' \
    --limit '46' \
    --offset '19' \
    --startDate 'OgeXiGIu' \
    > test.out 2>&1
eval_tap $? 275 'AdminGetBannedDevicesV4' test.out

#- 276 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '8N0xzN97' \
    > test.out 2>&1
eval_tap $? 276 'AdminGetUserDeviceBansV4' test.out

#- 277 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "dH0BWNm9", "deviceId": "7Z7EhAiz", "deviceType": "RGqOFzI3", "enabled": true, "endDate": "XwVvU6fA", "ext": {"t8spIGm3": {}, "fogJHZwX": {}, "EJWW1jwv": {}}, "reason": "RnKu0iB0"}' \
    > test.out 2>&1
eval_tap $? 277 'AdminBanDeviceV4' test.out

#- 278 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'FRKFUy3l' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 278 'AdminGetDeviceBanV4' test.out

#- 279 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'cb7RjF29' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 279 'AdminUpdateDeviceBanV4' test.out

#- 280 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'sl31tbqB' \
    --startDate 'MbQAyzSc' \
    --deviceType 'AKfaF7oE' \
    > test.out 2>&1
eval_tap $? 280 'AdminGenerateReportV4' test.out

#- 281 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 281 'AdminGetDeviceTypesV4' test.out

#- 282 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'CSZCwOsH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 282 'AdminGetDeviceBansV4' test.out

#- 283 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'npMIv6jM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 283 'AdminDecryptDeviceV4' test.out

#- 284 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'gA0QzUMB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'AdminUnbanDeviceV4' test.out

#- 285 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'ao9qE6g7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 285 'AdminGetUsersByDeviceV4' test.out

#- 286 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 29}' \
    > test.out 2>&1
eval_tap $? 286 'AdminCreateTestUsersV4' test.out

#- 287 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["QKCphP6R", "T8OZj4O6", "ky6B2Ve6"]}' \
    > test.out 2>&1
eval_tap $? 287 'AdminBulkCheckValidUserIDV4' test.out

#- 288 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OYJuXBQi' \
    --body '{"avatarUrl": "tncmWSqz", "country": "ArM81gTY", "dateOfBirth": "wkBazhWv", "displayName": "vbwPzf9L", "languageTag": "n88xufEB", "userName": "QVk4neOp"}' \
    > test.out 2>&1
eval_tap $? 288 'AdminUpdateUserV4' test.out

#- 289 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lnqsGmhb' \
    --body '{"code": "RKK4Ed0b", "emailAddress": "elFfTsPi"}' \
    > test.out 2>&1
eval_tap $? 289 'AdminUpdateUserEmailAddressV4' test.out

#- 290 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qrJvL2c0' \
    > test.out 2>&1
eval_tap $? 290 'AdminDisableUserMFAV4' test.out

#- 291 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mIQ2xdcC' \
    > test.out 2>&1
eval_tap $? 291 'AdminListUserRolesV4' test.out

#- 292 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'v9P5Pvwn' \
    --body '{"assignedNamespaces": ["U6Z5GO3N", "8X9OadLm", "maQc0MWa"], "roleId": "VftvkcFe"}' \
    > test.out 2>&1
eval_tap $? 292 'AdminUpdateUserRoleV4' test.out

#- 293 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LeaZQLIO' \
    --body '{"assignedNamespaces": ["gJlvga8W", "ECLl1l16", "3l5V3Lv8"], "roleId": "dZ2rN7sj"}' \
    > test.out 2>&1
eval_tap $? 293 'AdminAddUserRoleV4' test.out

#- 294 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xFkK2ysd' \
    --body '{"assignedNamespaces": ["GJzAYT2N", "XIeaQtSO", "aKsK6pI7"], "roleId": "rk0p8i8Y"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminRemoveUserRoleV4' test.out

#- 295 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '92' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 295 'AdminGetRolesV4' test.out

#- 296 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "eZ7NTgvl"}' \
    > test.out 2>&1
eval_tap $? 296 'AdminCreateRoleV4' test.out

#- 297 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'jhv1YZBt' \
    > test.out 2>&1
eval_tap $? 297 'AdminGetRoleV4' test.out

#- 298 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'bgJmzclZ' \
    > test.out 2>&1
eval_tap $? 298 'AdminDeleteRoleV4' test.out

#- 299 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'MpYTp910' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "qf4Hu4Rm"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminUpdateRoleV4' test.out

#- 300 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'iz86vWt1' \
    --body '{"permissions": [{"action": 88, "resource": "GnHtlpVG", "schedAction": 99, "schedCron": "SZya3nDb", "schedRange": ["1Cfcna6q", "Hpav05Io", "MhKziEgw"]}, {"action": 70, "resource": "cjbzkNHr", "schedAction": 29, "schedCron": "UjEkyBlO", "schedRange": ["Yt2aejfc", "fclow6ZH", "MrNHSJAT"]}, {"action": 41, "resource": "k3htr4Bz", "schedAction": 54, "schedCron": "1V7zr8Qy", "schedRange": ["47CPql96", "rTDN7ZJr", "zQCG3lpu"]}]}' \
    > test.out 2>&1
eval_tap $? 300 'AdminUpdateRolePermissionsV4' test.out

#- 301 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'I7uePIzK' \
    --body '{"permissions": [{"action": 30, "resource": "APvEBpGa", "schedAction": 70, "schedCron": "5Yw2ZIy7", "schedRange": ["gKkIm4rX", "C5JOIn2z", "MZlkk3Ui"]}, {"action": 86, "resource": "KngrQ0Kd", "schedAction": 66, "schedCron": "GXPeL6v2", "schedRange": ["QgzFPeqx", "wWylNFv7", "IZzVWgRa"]}, {"action": 3, "resource": "KPQX13ZU", "schedAction": 91, "schedCron": "6fbbxOX5", "schedRange": ["WuvYdvDr", "olnowRGU", "XyUSMxG4"]}]}' \
    > test.out 2>&1
eval_tap $? 301 'AdminAddRolePermissionsV4' test.out

#- 302 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'h90a6V5k' \
    --body '["xVS0ddL7", "om4i7Z8d", "BbUcyY5q"]' \
    > test.out 2>&1
eval_tap $? 302 'AdminDeleteRolePermissionsV4' test.out

#- 303 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId '1tmMAHsD' \
    --after 'UOtd4G54' \
    --before 'pTjnhi0S' \
    --limit '39' \
    > test.out 2>&1
eval_tap $? 303 'AdminListAssignedUsersV4' test.out

#- 304 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'qKSYFHP0' \
    --body '{"assignedNamespaces": ["uh3pdhjb", "mfFeVzpm", "jAUo15pd"], "namespace": "LPG4Vr3r", "userId": "SVrk3pki"}' \
    > test.out 2>&1
eval_tap $? 304 'AdminAssignUserToRoleV4' test.out

#- 305 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'Rkhrb9kt' \
    --body '{"namespace": "NfYN8X2k", "userId": "4tdbWrxF"}' \
    > test.out 2>&1
eval_tap $? 305 'AdminRevokeUserFromRoleV4' test.out

#- 306 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "TOHV3U1B", "country": "5TCap09R", "dateOfBirth": "qQLsw0Fl", "displayName": "3JIcBMgr", "languageTag": "TYOKBLQ8", "userName": "Bv5G1EBX"}' \
    > test.out 2>&1
eval_tap $? 306 'AdminUpdateMyUserV4' test.out

#- 307 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 307 'AdminDisableMyAuthenticatorV4' test.out

#- 308 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'ZjiNHk9f' \
    > test.out 2>&1
eval_tap $? 308 'AdminEnableMyAuthenticatorV4' test.out

#- 309 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 309 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 310 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 310 'AdminGetMyBackupCodesV4' test.out

#- 311 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 311 'AdminGenerateMyBackupCodesV4' test.out

#- 312 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 312 'AdminDisableMyBackupCodesV4' test.out

#- 313 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 313 'AdminDownloadMyBackupCodesV4' test.out

#- 314 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 314 'AdminEnableMyBackupCodesV4' test.out

#- 315 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 315 'AdminSendMyMFAEmailCodeV4' test.out

#- 316 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 316 'AdminDisableMyEmailV4' test.out

#- 317 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'fqUxtLgu' \
    > test.out 2>&1
eval_tap $? 317 'AdminEnableMyEmailV4' test.out

#- 318 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 318 'AdminGetMyEnabledFactorsV4' test.out

#- 319 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'mllyFhBD' \
    > test.out 2>&1
eval_tap $? 319 'AdminMakeFactorMyDefaultV4' test.out

#- 320 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["TPo0Feg7", "ILJrvIfq", "1zaE1uMq"], "emailAddresses": ["x5hUGaqm", "g8URSOKp", "ACUIvutI"], "isAdmin": true, "roleId": "28qOayVK"}' \
    > test.out 2>&1
eval_tap $? 320 'AdminInviteUserV4' test.out

#- 321 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "Zwfq6sLA", "policyId": "HOOcYBbw", "policyVersionId": "uDn8J4R8"}, {"isAccepted": false, "localizedPolicyVersionId": "cu7s4MTR", "policyId": "Jika1v8X", "policyVersionId": "TFqcUjIW"}, {"isAccepted": false, "localizedPolicyVersionId": "1bjK1eIM", "policyId": "XzV8b9VZ", "policyVersionId": "LMIqxrGS"}], "authType": "EMAILPASSWD", "country": "KGzpsUlS", "dateOfBirth": "TxbnpmFq", "displayName": "zhhc73uT", "emailAddress": "tAFXs7ym", "password": "GIW8RWdb", "passwordMD5Sum": "RcA0q7U3", "username": "i7RVjAJk", "verified": false}' \
    > test.out 2>&1
eval_tap $? 321 'PublicCreateTestUserV4' test.out

#- 322 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "mmIaz7G7", "policyId": "cT32sLy9", "policyVersionId": "3iKbOZfa"}, {"isAccepted": true, "localizedPolicyVersionId": "S4P5SbA1", "policyId": "m4lIlnaJ", "policyVersionId": "u08191XQ"}, {"isAccepted": false, "localizedPolicyVersionId": "ypfeZwxk", "policyId": "ahv8cbgO", "policyVersionId": "LvQ7oI2v"}], "authType": "EMAILPASSWD", "code": "k7f2yvKU", "country": "w9GoJQ7r", "dateOfBirth": "mFVtOAKI", "displayName": "VkYUanyD", "emailAddress": "xHbCGa8j", "password": "HM5ueZlD", "passwordMD5Sum": "LK0OaZgV", "reachMinimumAge": true, "username": "LmnDgUac"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicCreateUserV4' test.out

#- 323 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'u78jdmsP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "ZzR1AmVF", "policyId": "NCFp5sEG", "policyVersionId": "o2vbSzlM"}, {"isAccepted": true, "localizedPolicyVersionId": "IJmXvDX1", "policyId": "GZHpXEAP", "policyVersionId": "dIu9qhZj"}, {"isAccepted": false, "localizedPolicyVersionId": "62bRmvCZ", "policyId": "7VOBfqNn", "policyVersionId": "p1f150Xl"}], "authType": "EMAILPASSWD", "country": "3ffXixsH", "dateOfBirth": "2DSzrRru", "displayName": "TcTuUhPK", "password": "8hBhkxNI", "reachMinimumAge": true, "username": "NRrI7pjP"}' \
    > test.out 2>&1
eval_tap $? 323 'CreateUserFromInvitationV4' test.out

#- 324 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "Sf5KjzQM", "country": "W7YdcETt", "dateOfBirth": "IR1ocA6R", "displayName": "FifJVqWO", "languageTag": "ch1l0Chs", "userName": "saNwGXCM"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicUpdateUserV4' test.out

#- 325 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "s463XJd0", "emailAddress": "2nIRJpo6"}' \
    > test.out 2>&1
eval_tap $? 325 'PublicUpdateUserEmailAddressV4' test.out

#- 326 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "MMv4L4pg", "country": "gJTJTTAT", "dateOfBirth": "9yIE5eIm", "displayName": "tUpg7DJk", "emailAddress": "2Bgr3DjV", "password": "8vIegLJa", "reachMinimumAge": false, "username": "hWh8ahfm", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 326 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 327 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "thzzsGcO", "password": "Ek2ytesM", "username": "0HfLwQfp"}' \
    > test.out 2>&1
eval_tap $? 327 'PublicUpgradeHeadlessAccountV4' test.out

#- 328 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 328 'PublicDisableMyAuthenticatorV4' test.out

#- 329 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'MMsg71pC' \
    > test.out 2>&1
eval_tap $? 329 'PublicEnableMyAuthenticatorV4' test.out

#- 330 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 330 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 331 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 331 'PublicGetMyBackupCodesV4' test.out

#- 332 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 332 'PublicGenerateMyBackupCodesV4' test.out

#- 333 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 333 'PublicDisableMyBackupCodesV4' test.out

#- 334 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 334 'PublicDownloadMyBackupCodesV4' test.out

#- 335 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 335 'PublicEnableMyBackupCodesV4' test.out

#- 336 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'U6rD1AYI' \
    > test.out 2>&1
eval_tap $? 336 'PublicRemoveTrustedDeviceV4' test.out

#- 337 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 337 'PublicSendMyMFAEmailCodeV4' test.out

#- 338 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 338 'PublicDisableMyEmailV4' test.out

#- 339 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'tts258et' \
    > test.out 2>&1
eval_tap $? 339 'PublicEnableMyEmailV4' test.out

#- 340 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 340 'PublicGetMyEnabledFactorsV4' test.out

#- 341 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'XHPfrY8P' \
    > test.out 2>&1
eval_tap $? 341 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE