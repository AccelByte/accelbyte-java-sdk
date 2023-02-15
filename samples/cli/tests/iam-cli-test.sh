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
    --body '[{"field": "JUAvfISX", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "blockedWord": ["dIxcI5Uu", "9Oxlk0C3", "vZooLSz7"], "description": [{"language": "YMQVYupa", "message": ["kmcsqjFP", "o55KlYo0", "stjBSvaj"]}, {"language": "V51WcMTP", "message": ["MrrHNxkE", "y65g4J7e", "Hp9WZUTc"]}, {"language": "wEIj8i9i", "message": ["7lbShQCT", "0dquLnZW", "LUxG8SUu"]}], "isCustomRegex": false, "letterCase": "CMgEuOw9", "maxLength": 96, "maxRepeatingAlphaNum": 46, "maxRepeatingSpecialCharacter": 87, "minCharType": 69, "minLength": 19, "regex": "EIk377NE", "specialCharacterLocation": "ucDSKnRh", "specialCharacters": ["jY04ABxP", "F9hTlr4d", "okPcU59x"]}}, {"field": "rO2ayoDs", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "blockedWord": ["HnWzUt8H", "vzRoAxbW", "gm63VDuV"], "description": [{"language": "XdNFbTOZ", "message": ["lgZYFQ2c", "YCbaRDlw", "ULf5e7Tt"]}, {"language": "l6Q2gEku", "message": ["V6GnP9r7", "OhQ4WCBc", "mjFEpDZt"]}, {"language": "bB8bsESp", "message": ["0V1PlvOb", "nCxecXBe", "hGHXIxEw"]}], "isCustomRegex": true, "letterCase": "drkJp0dO", "maxLength": 53, "maxRepeatingAlphaNum": 4, "maxRepeatingSpecialCharacter": 2, "minCharType": 56, "minLength": 83, "regex": "q4FsaR8R", "specialCharacterLocation": "CWK9IhOQ", "specialCharacters": ["SSC6kSwm", "UNAbBrrT", "jSVMQpZF"]}}, {"field": "Qm0BqTfg", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "blockedWord": ["0JX6o80W", "SgiEpuL4", "4T8awXfH"], "description": [{"language": "CKwAkBs1", "message": ["pB8bybQA", "8v7h1W1T", "KrwughMc"]}, {"language": "MOj87Zwp", "message": ["cuZ1x5ta", "afVPirOX", "e3FA6Zei"]}, {"language": "mwG7WT6m", "message": ["pgzgtrtw", "s4paJlOG", "THpH8ihg"]}], "isCustomRegex": false, "letterCase": "ZD6cFWX0", "maxLength": 33, "maxRepeatingAlphaNum": 21, "maxRepeatingSpecialCharacter": 53, "minCharType": 38, "minLength": 41, "regex": "K6NSiBUf", "specialCharacterLocation": "Pugazgi4", "specialCharacters": ["HWKj2VvO", "ZqDfg30t", "Isne4Hxz"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'sCXmo5SU' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'XXYyBMGv' \
    --before 'jQvgu2Xt' \
    --limit '32' \
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
    --body '{"ageRestriction": 25, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'BXEDOZBf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 73}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'A0grGAAR' \
    --limit '38' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "7rCie239", "comment": "4gqlWxNi", "endDate": "9GJRPxjZ", "reason": "excpvyad", "skipNotif": false, "userIds": ["TnaafliE", "2AvODLWW", "ksFde0wi"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "tZMvO6sb", "userId": "v82ndUYm"}, {"banId": "xBUchrML", "userId": "w8Hm3piz"}, {"banId": "ekBpesgZ", "userId": "A0dcVI5x"}]}' \
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
    --clientId 'k6irx7OY' \
    --clientName 'ysFITSYZ' \
    --clientType '1QtioPOl' \
    --limit '59' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["OUHouW3M", "KPnlx7YR", "xdwgig6I"], "baseUri": "pV3NXyKw", "clientId": "1QVB6NQn", "clientName": "Mo3TpDDD", "clientPermissions": [{"action": 20, "resource": "z2bCURbk", "schedAction": 98, "schedCron": "iY03tbvm", "schedRange": ["nPciF17w", "cP9yjScd", "knOIG3Nj"]}, {"action": 4, "resource": "iOBXTCos", "schedAction": 58, "schedCron": "39jiOrdO", "schedRange": ["kX6LUlSR", "TTGf355Q", "yCr5lNIo"]}, {"action": 70, "resource": "eiGcHZqr", "schedAction": 38, "schedCron": "8VnTuPIJ", "schedRange": ["3azC3L0c", "KMuvOwHO", "4Rn5rREj"]}], "clientPlatform": "1AYNesQb", "deletable": false, "description": "ylVHG9MN", "namespace": "XolJGMi7", "oauthAccessTokenExpiration": 41, "oauthAccessTokenExpirationTimeUnit": "eCGny4pL", "oauthClientType": "JmWZARc5", "oauthRefreshTokenExpiration": 26, "oauthRefreshTokenExpirationTimeUnit": "IUNpIfay", "parentNamespace": "jgh5dU4c", "redirectUri": "quz27Vey", "scopes": ["C2ukBFYP", "IaGQmzpi", "pgbmch5u"], "secret": "Q3W2JjJY", "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId '9cosydSS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'aQMhPCDY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId '56lidbcF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["wM87bHUI", "INIQzwpi", "kaZCdZtg"], "baseUri": "jC8nbYpj", "clientName": "0jyUlWGW", "clientPermissions": [{"action": 75, "resource": "fVzZNZn9", "schedAction": 60, "schedCron": "0Bbl7pqF", "schedRange": ["A61qJ6a0", "pIF1BumS", "XvtNPPDk"]}, {"action": 46, "resource": "pLEayOlW", "schedAction": 34, "schedCron": "mFmDMZxf", "schedRange": ["56b9hSKZ", "nvq4QCho", "eZojoKTU"]}, {"action": 49, "resource": "LowmFMmN", "schedAction": 4, "schedCron": "fxFDj4hO", "schedRange": ["7lpDOp2v", "HyPzG5QS", "4Cjt6zTr"]}], "clientPlatform": "Q8871S5R", "deletable": true, "description": "mtVQgj2c", "namespace": "zvT5WdhF", "oauthAccessTokenExpiration": 88, "oauthAccessTokenExpirationTimeUnit": "CPweT5GH", "oauthRefreshTokenExpiration": 55, "oauthRefreshTokenExpirationTimeUnit": "l95ZqZii", "redirectUri": "6dvoNglm", "scopes": ["ayi3cWXb", "Q08Y0RSu", "WUBcg01u"], "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'QCdVqR5F' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 0, "resource": "cfL829lW"}, {"action": 17, "resource": "9rV5JIPQ"}, {"action": 5, "resource": "OFuAlSew"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 's8U6KpgH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 17, "resource": "Xbjejei3"}, {"action": 8, "resource": "Lx5xsDmm"}, {"action": 24, "resource": "42kXKzR7"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '23' \
    --clientId 'sAQqvgWY' \
    --namespace "$AB_NAMESPACE" \
    --resource 'KE7Rv7hi' \
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
    --limit '70' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LMRqBcq7' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rrLrDiM6' \
    --body '{"ACSURL": "XvRR5NP6", "AWSCognitoRegion": "fmlvbtxV", "AWSCognitoUserPool": "F9riXDM7", "AllowedClients": ["bcA47myK", "GGRetuxG", "cCrk1DmE"], "AppId": "oarVP97D", "AuthorizationEndpoint": "bc6EXIhi", "ClientId": "JlzlJdxe", "Environment": "wuLNo3Jj", "FederationMetadataURL": "6HUQrkc2", "GenericOauthFlow": false, "IsActive": false, "Issuer": "XkBb7vvG", "JWKSEndpoint": "OAZM03rb", "KeyID": "pVP3BNce", "NetflixCertificates": {"encryptedPrivateKey": "HSJuATWH", "encryptedPrivateKeyName": "Ny3dzRIy", "publicCertificate": "crjzVYLS", "publicCertificateName": "iS0jwrYH", "rootCertificate": "RXDHTN2t", "rootCertificateName": "qu2p1DVd"}, "OrganizationId": "9M3vcmyM", "PlatformName": "huMKlLgQ", "RedirectUri": "nwLXYwMw", "RegisteredDomains": [{"affectedClientIDs": ["cL7iFBk5", "fU0jKoR1", "dlhkBs7O"], "domain": "NK6URGO8", "namespaces": ["uotIEWk5", "m8wRYg0D", "bJ1fpN2v"], "roleId": "RUxNvFt0"}, {"affectedClientIDs": ["nuFSbSgQ", "ytl5q9ww", "nyMCzY6z"], "domain": "OG4AuCZI", "namespaces": ["IjWrsali", "dfhbiBdg", "vWl71Fgn"], "roleId": "Pkl2d7Ue"}, {"affectedClientIDs": ["0y6bKIK1", "QMqZqJqk", "M3wrp4Bj"], "domain": "NgAiG34q", "namespaces": ["5nAkCRUw", "XzgMRlEe", "F5ZItrbD"], "roleId": "9a0CGXEt"}], "Secret": "0kz1oiTe", "TeamID": "ljmTuxis", "TokenAuthenticationType": "wC8EOYWU", "TokenClaimsMapping": {"ejxDDqWB": "UUzLRpYK", "8NLFRsXQ": "kG37sMWv", "qR7M4t2d": "lxkZEL67"}, "TokenEndpoint": "nqDOixS2", "scopes": ["BMLwFGQK", "kTUB1VQE", "j6JfLrzN"]}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AYaHzmzR' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rjMkP675' \
    --body '{"ACSURL": "uBNwnRyn", "AWSCognitoRegion": "qrkG4upk", "AWSCognitoUserPool": "NZIizXxv", "AllowedClients": ["pTzH416Y", "nk98BmPd", "P3iUwFrj"], "AppId": "UsssSliJ", "AuthorizationEndpoint": "eJTlOSng", "ClientId": "Tw6vD1aj", "Environment": "4PDy8KSu", "FederationMetadataURL": "gRz3O8ic", "GenericOauthFlow": true, "IsActive": true, "Issuer": "ActUQuYW", "JWKSEndpoint": "xrMHZF3K", "KeyID": "vMkv6HHY", "NetflixCertificates": {"encryptedPrivateKey": "alpXKaqB", "encryptedPrivateKeyName": "JTreDLge", "publicCertificate": "7Jq715oc", "publicCertificateName": "kYqG2wBv", "rootCertificate": "LnZqC26n", "rootCertificateName": "AFcABB9a"}, "OrganizationId": "r6USC4RJ", "PlatformName": "V6DgONEq", "RedirectUri": "cgwYrJhV", "RegisteredDomains": [{"affectedClientIDs": ["Ds8O0NH6", "2sfRVHCI", "p6ZaWezv"], "domain": "GnilqFqv", "namespaces": ["XHGqRFgE", "uTvjW4PI", "0VpIAcIO"], "roleId": "oQFOmvR4"}, {"affectedClientIDs": ["57bdcbj7", "XXAm2Wnm", "wN2RzNxP"], "domain": "7AtMIxjN", "namespaces": ["ebbt8vtD", "zNAr46AT", "EREdzI6n"], "roleId": "9aAi7ot2"}, {"affectedClientIDs": ["l3abOtsh", "dTMxXDUE", "kESrwDr0"], "domain": "Rd9W1CCC", "namespaces": ["iTa9LPFV", "LjlHM0X1", "CbSMaA7W"], "roleId": "W1jX4PEQ"}], "Secret": "yeVqZAVQ", "TeamID": "v7DatSCt", "TokenAuthenticationType": "cNHWzSzl", "TokenClaimsMapping": {"9ebJz9G3": "nKoM87Kp", "Xp2JJ0FI": "lFEn1pY5", "KczXXhzO": "G09zgJ2E"}, "TokenEndpoint": "4KPxSHlU", "scopes": ["XE7gmgrv", "xLnlVlys", "XTHVQdnz"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mdXovdw4' \
    --body '{"affectedClientIDs": ["8J1iw0La", "H48KTTzi", "ydGyLSUo"], "assignedNamespaces": ["1YwaeNJI", "uozXRU99", "eGNMmoQO"], "domain": "gGPPJEiB", "roleId": "O6auMqwA"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CahHfpIX' \
    --body '{"domain": "JMI2lPCO"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '16efm1pR' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zIgTIi8v' \
    --body '{"acsUrl": "lacY1p9F", "apiKey": "QRXx96Ad", "appId": "i0VlIJvm", "federationMetadataUrl": "71shmyAH", "isActive": true, "redirectUri": "yugkgonv", "secret": "UA7XYr2l", "ssoUrl": "zbO1LuoG"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zxLFsjxY' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'efwFXO9V' \
    --body '{"acsUrl": "PgPvusyB", "apiKey": "Mmw08sEi", "appId": "Py01r9ml", "federationMetadataUrl": "hp0f7mTg", "isActive": false, "redirectUri": "MD2T9pAp", "secret": "VOHA262w", "ssoUrl": "99c6wVDu"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rtBiuSMx' \
    --platformUserId 'qoM7imry' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'Qqrp12JO' \
    --after '31' \
    --before '90' \
    --limit '98' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'qLJ6QVcX' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["mOqIhQy5", "wzxSz9Jk", "Zdq8jJYD"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["s42EN3Nt", "VGhocXhV", "jp8gJmEg"], "isAdmin": false, "namespace": "GPlHt0MA", "roles": ["1VYjvQml", "ezhDucyL", "JINlytNa"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '5' \
    --platformUserId 'yUAunWPM' \
    --platformId 'na4i14G5' \
    > test.out 2>&1
eval_tap $? 146 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 147 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 147 'AdminListUsersV3' test.out

#- 148 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '7hAR1YFo' \
    --endDate 'DgFjZ0Es' \
    --limit '58' \
    --offset '40' \
    --platformBy 'M7kzn2mj' \
    --platformId 'MNwOkBAk' \
    --query 'mn1LBRS0' \
    --startDate 'kHVcStlO' \
    > test.out 2>&1
eval_tap $? 148 'AdminSearchUserV3' test.out

#- 149 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["ujY61IYX", "ZEvZB9ig", "NG157FW9"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetBulkUserByEmailAddressV3' test.out

#- 150 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pu3gANVC' \
    > test.out 2>&1
eval_tap $? 150 'AdminGetUserByUserIdV3' test.out

#- 151 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lrjQNE0y' \
    --body '{"avatarUrl": "WRVydu1Z", "country": "PEZ3OZX0", "dateOfBirth": "Ge3HnAJq", "displayName": "aPiKEt4K", "languageTag": "JgOsOzjG", "userName": "l0ZFhJtE"}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserV3' test.out

#- 152 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MXEKWZ98' \
    --activeOnly  \
    --after 'aUDFQYiY' \
    --before 'A5JwffBi' \
    --limit '6' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetUserBanV3' test.out

#- 153 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9fAEX5lK' \
    --body '{"ban": "KCVrWXNw", "comment": "p0bF826w", "endDate": "lbhrkD25", "reason": "kyPDdsYx", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 153 'AdminBanUserV3' test.out

#- 154 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'NBUrSKqm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TaBrq5IR' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 154 'AdminUpdateUserBanV3' test.out

#- 155 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kWMZVzBf' \
    --body '{"context": "3lW30Jzv", "emailAddress": "iX4UcGCu", "languageTag": "6dCZKr6p"}' \
    > test.out 2>&1
eval_tap $? 155 'AdminSendVerificationCodeV3' test.out

#- 156 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rmGUWMIA' \
    --body '{"Code": "lz2qmGlG", "ContactType": "L3Z29hZZ", "LanguageTag": "OFTWthyv", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 156 'AdminVerifyAccountV3' test.out

#- 157 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'MJzGhAUy' \
    > test.out 2>&1
eval_tap $? 157 'GetUserVerificationCode' test.out

#- 158 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EYgTanTE' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserDeletionStatusV3' test.out

#- 159 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YWQRo3x9' \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpdateUserDeletionStatusV3' test.out

#- 160 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'V9GYxVq1' \
    --body '{"code": "2TPuCdmu", "country": "h40sg7nF", "dateOfBirth": "0DpiwWDh", "displayName": "QyHXFyGt", "emailAddress": "ax1Y4o4J", "password": "KlOok4jC", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpgradeHeadlessAccountV3' test.out

#- 161 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5EtVztXX' \
    > test.out 2>&1
eval_tap $? 161 'AdminDeleteUserInformationV3' test.out

#- 162 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nME5b3Ky' \
    --after '0.7171828073656022' \
    --before '0.0009250947574956925' \
    --limit '20' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetUserLoginHistoriesV3' test.out

#- 163 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KZXsBjH8' \
    --body '{"languageTag": "de459mPG", "newPassword": "TUFyJLQI", "oldPassword": "S4WV8ezd"}' \
    > test.out 2>&1
eval_tap $? 163 'AdminResetPasswordV3' test.out

#- 164 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'w3P9l3OS' \
    --body '{"Permissions": [{"Action": 75, "Resource": "QfnFgxQw", "SchedAction": 97, "SchedCron": "BaTYDhcm", "SchedRange": ["h3FFMkv4", "4SpVz6Nb", "zt65SdFi"]}, {"Action": 39, "Resource": "HOnAcxro", "SchedAction": 22, "SchedCron": "Ht81RE4V", "SchedRange": ["GiVkMLUo", "ayK1d8TK", "nKHtybXF"]}, {"Action": 41, "Resource": "kzANAJwr", "SchedAction": 55, "SchedCron": "NvnqzQQ2", "SchedRange": ["6XgxAHsa", "HVFGkpmb", "IxZ66Lls"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserPermissionV3' test.out

#- 165 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SPLnXIRQ' \
    --body '{"Permissions": [{"Action": 23, "Resource": "vVLDGKCK", "SchedAction": 41, "SchedCron": "6QyOvpQY", "SchedRange": ["GCyajNrL", "Bkox4IQQ", "RN3BRjeH"]}, {"Action": 6, "Resource": "pMBqgsXY", "SchedAction": 5, "SchedCron": "cOL9tUsd", "SchedRange": ["ANuBHDaj", "pMSNBlmN", "O7clkO1T"]}, {"Action": 77, "Resource": "60X0FSW7", "SchedAction": 44, "SchedCron": "xX8fbenU", "SchedRange": ["2lyv7XKt", "pLYJOUcj", "TVNmiiGK"]}]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminAddUserPermissionsV3' test.out

#- 166 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nCq7hfJN' \
    --body '[{"Action": 91, "Resource": "vAzki0jP"}, {"Action": 98, "Resource": "Eb4gMrwZ"}, {"Action": 19, "Resource": "SzReAdie"}]' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionBulkV3' test.out

#- 167 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '15' \
    --namespace "$AB_NAMESPACE" \
    --resource 'eRT0Id4X' \
    --userId '2agAtPgO' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserPermissionV3' test.out

#- 168 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0gAkDqyS' \
    --after 'CHlMkFQR' \
    --before 'xoGq3XE2' \
    --limit '30' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserPlatformAccountsV3' test.out

#- 169 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'MeSqKVvc' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetListJusticePlatformAccounts' test.out

#- 170 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'kUMKKMqj' \
    --userId 'xFSwa8aN' \
    > test.out 2>&1
eval_tap $? 170 'AdminGetUserMapping' test.out

#- 171 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'JrGbsn6X' \
    --userId 'HPTNRiiA' \
    > test.out 2>&1
eval_tap $? 171 'AdminCreateJusticeUser' test.out

#- 172 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'zOBuO0Rf' \
    --body '{"platformId": "iCplrvd1", "platformUserId": "juVm5Ppb"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminLinkPlatformAccount' test.out

#- 173 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tqY09bjZ' \
    --userId 'BzjcMYva' \
    --body '{"platformNamespace": "kJqs5Zic"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformUnlinkV3' test.out

#- 174 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5BA9NNXm' \
    --userId 'aOYC2DqD' \
    --ticket 'toWMoHdV' \
    > test.out 2>&1
eval_tap $? 174 'AdminPlatformLinkV3' test.out

#- 175 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zIFLx3Jg' \
    --userId 'sWkjWvVZ' \
    --platformToken 'JYHgGc3L' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 176 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2KP7Jy2h' \
    --body '["oEaKlkdK", "jUslnZTB", "nwQk3LDe"]' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserRolesV3' test.out

#- 177 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'm0dn77I1' \
    --body '[{"namespace": "pMaHDewR", "roleId": "Qx9Xd3Yl"}, {"namespace": "Fn5pTIW4", "roleId": "Q9iPJZH0"}, {"namespace": "OZUuUYkR", "roleId": "69sKkbzT"}]' \
    > test.out 2>&1
eval_tap $? 177 'AdminSaveUserRoleV3' test.out

#- 178 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'qvIguLQ4' \
    --userId 'YfLO7lwq' \
    > test.out 2>&1
eval_tap $? 178 'AdminAddUserRoleV3' test.out

#- 179 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'ImqJp6Uj' \
    --userId 'pcmcYBAP' \
    > test.out 2>&1
eval_tap $? 179 'AdminDeleteUserRoleV3' test.out

#- 180 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dKnORPrP' \
    --body '{"enabled": false, "reason": "hGGZFIiX"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateUserStatusV3' test.out

#- 181 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'p2fo1Pnu' \
    > test.out 2>&1
eval_tap $? 181 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 182 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'BHGp9ox5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "6qXSAsLu"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateClientSecretV3' test.out

#- 183 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'lvb7H8Xi' \
    --before 'HcJQoY5f' \
    --isWildcard  \
    --limit '62' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRolesV3' test.out

#- 184 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "managers": [{"displayName": "Yr0YQpNZ", "namespace": "mfctZ8e6", "userId": "apjZOh1y"}, {"displayName": "MaBanQ2E", "namespace": "zU0oEhpR", "userId": "XdIXmqn2"}, {"displayName": "XbHRWSLV", "namespace": "ZN5s8AZr", "userId": "NDTd6ZJ3"}], "members": [{"displayName": "YQlCxRNy", "namespace": "jrYQtOCc", "userId": "uL3lqTRw"}, {"displayName": "peE6f3ZE", "namespace": "2cHobJuF", "userId": "uGSn9aRr"}, {"displayName": "B8vZjYnF", "namespace": "kwFrJi37", "userId": "5LqohBRa"}], "permissions": [{"action": 2, "resource": "qKKb7ZYh", "schedAction": 90, "schedCron": "EJeEcM3M", "schedRange": ["4jlcH7Va", "7v9MbvQN", "EXXNY4B0"]}, {"action": 46, "resource": "UzO1ICQ8", "schedAction": 10, "schedCron": "0eRrt53u", "schedRange": ["wkHAEBvl", "Z61MJU6D", "iEmm2Rd7"]}, {"action": 8, "resource": "TDWXqndo", "schedAction": 48, "schedCron": "zPMGbBdL", "schedRange": ["rSa6kqxv", "kWqxBWyu", "UTQjKKJ1"]}], "roleName": "O83ePVXw"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminCreateRoleV3' test.out

#- 185 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'fJRWyufz' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleV3' test.out

#- 186 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId '2ouuv1Nd' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteRoleV3' test.out

#- 187 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'I8xPLiYS' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "Btdv3ojX"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateRoleV3' test.out

#- 188 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId '9txtuN1T' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleAdminStatusV3' test.out

#- 189 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'pn8SD8GO' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpdateAdminRoleStatusV3' test.out

#- 190 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'U0NA2rHk' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleAdminV3' test.out

#- 191 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId '3zf9oTeU' \
    --after '0peTsqo5' \
    --before 'Fs44r3nE' \
    --limit '0' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetRoleManagersV3' test.out

#- 192 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'p2liAgt7' \
    --body '{"managers": [{"displayName": "zw68WZ96", "namespace": "9SwLlyHO", "userId": "kl5yeJKP"}, {"displayName": "24gdl2gS", "namespace": "PM9LfGy3", "userId": "wq8ZTOby"}, {"displayName": "tlKpt0Pr", "namespace": "bCWK1utW", "userId": "HDVKPocE"}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRoleManagersV3' test.out

#- 193 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'efCyUpoi' \
    --body '{"managers": [{"displayName": "8QM9tBJx", "namespace": "zZCiJQho", "userId": "j69wTqGW"}, {"displayName": "EseZWsLS", "namespace": "bYeCz4ex", "userId": "C8I0BDQn"}, {"displayName": "ogqNykcR", "namespace": "7FWKU2Rl", "userId": "0OHonBOG"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminRemoveRoleManagersV3' test.out

#- 194 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'MpJnDdLO' \
    --after 'zMAtyrxt' \
    --before 'uXm3kyQq' \
    --limit '64' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetRoleMembersV3' test.out

#- 195 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'qjKtprUx' \
    --body '{"members": [{"displayName": "Yihz6QKd", "namespace": "7xA6Akdb", "userId": "6SN8q2WP"}, {"displayName": "6RKWdVya", "namespace": "gEgedjMb", "userId": "0xYnCoWL"}, {"displayName": "e7TbDmOH", "namespace": "5GE04m46", "userId": "48rXjQc8"}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddRoleMembersV3' test.out

#- 196 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'PyNzCVn8' \
    --body '{"members": [{"displayName": "FhNRY3ez", "namespace": "NkxJz1Tx", "userId": "hjIDjjLR"}, {"displayName": "d4DOAY6T", "namespace": "ngj2DNKp", "userId": "x2iMd9p0"}, {"displayName": "4vK8b81y", "namespace": "NCcecirP", "userId": "U2v435nT"}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminRemoveRoleMembersV3' test.out

#- 197 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'psJ7aQsb' \
    --body '{"permissions": [{"action": 6, "resource": "oJGLtAl1", "schedAction": 64, "schedCron": "2s37BGax", "schedRange": ["uJS1JABI", "33ETGeLF", "iBaEkS1t"]}, {"action": 93, "resource": "2UFsUsaT", "schedAction": 13, "schedCron": "Z7IQtmjq", "schedRange": ["Y9PsqmLt", "bn7xNjQZ", "TuW7x1Sv"]}, {"action": 49, "resource": "sRgYPC9U", "schedAction": 1, "schedCron": "hGZwfExp", "schedRange": ["9wWJqa3B", "5ceKdZV1", "u34Gmxqm"]}]}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateRolePermissionsV3' test.out

#- 198 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'yLEQZJOp' \
    --body '{"permissions": [{"action": 76, "resource": "4H4ayax0", "schedAction": 93, "schedCron": "09CyYhc0", "schedRange": ["Ne06iSMo", "rgGvm3Em", "IvHCD7BB"]}, {"action": 9, "resource": "ONwBEkjD", "schedAction": 17, "schedCron": "CNbyG17b", "schedRange": ["mF4nc2j1", "12z9Yxsa", "j4K80v7r"]}, {"action": 57, "resource": "6YOM0wMi", "schedAction": 39, "schedCron": "yECA8vAc", "schedRange": ["98cHpDDm", "WSkmHHzg", "avtkYlSN"]}]}' \
    > test.out 2>&1
eval_tap $? 198 'AdminAddRolePermissionsV3' test.out

#- 199 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'YgCWpkbw' \
    --body '["VXsWdsJ4", "md5XhGEM", "W7nAf1rB"]' \
    > test.out 2>&1
eval_tap $? 199 'AdminDeleteRolePermissionsV3' test.out

#- 200 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '60' \
    --resource '6W15rQb7' \
    --roleId 'KVj1yZxb' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteRolePermissionV3' test.out

#- 201 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 201 'AdminGetMyUserV3' test.out

#- 202 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'TFDQPE9D' \
    --extendExp  \
    --redirectUri '6drq0pt3' \
    --password 'Iu7Us8Eb' \
    --requestId 'RwpMRdfL' \
    --userName '05vpyyzY' \
    > test.out 2>&1
eval_tap $? 202 'UserAuthenticationV3' test.out

#- 203 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'g73L9crK' \
    --linkingToken '3ovLKGWG' \
    --password 'RUM2Gf3v' \
    --username 'cwmurvOm' \
    > test.out 2>&1
eval_tap $? 203 'AuthenticationWithPlatformLinkV3' test.out

#- 204 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'ZxFHh2Aa' \
    > test.out 2>&1
eval_tap $? 204 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 205 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'NNmjZpUE' \
    > test.out 2>&1
eval_tap $? 205 'RequestOneTimeLinkingCodeV3' test.out

#- 206 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode '1Auroky0' \
    > test.out 2>&1
eval_tap $? 206 'ValidateOneTimeLinkingCodeV3' test.out

#- 207 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --clientId '7R6o2IRO' \
    --oneTimeLinkCode '8glKWedH' \
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
    --clientId 'kuth66RG' \
    > test.out 2>&1
eval_tap $? 210 'RequestGameTokenCodeResponseV3' test.out

#- 211 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MMUHmeL8' \
    --userId 'QcZ0Aja7' \
    > test.out 2>&1
eval_tap $? 211 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 212 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YqNJ27pN' \
    > test.out 2>&1
eval_tap $? 212 'RevokeUserV3' test.out

#- 213 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'f9Ys6lV0' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'C5TuJzpZ' \
    --redirectUri 'KHxkOSUD' \
    --scope 'WHfN2XLr' \
    --state 'TQIo7Ocs' \
    --targetAuthPage 'QdQ90Xmx' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'r4SQeFsV' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 213 'AuthorizeV3' test.out

#- 214 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'RhonhLgp' \
    > test.out 2>&1
eval_tap $? 214 'TokenIntrospectionV3' test.out

#- 215 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 215 'GetJWKSV3' test.out

#- 216 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId '2z2DhmGF' \
    --factor '6ijdHqHQ' \
    --mfaToken 'YWbQTdNb' \
    > test.out 2>&1
eval_tap $? 216 'SendMFAAuthenticationCode' test.out

#- 217 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'd8kvvDhk' \
    --mfaToken 'NK8Pa6nk' \
    > test.out 2>&1
eval_tap $? 217 'Change2faMethod' test.out

#- 218 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'q3UhPJQn' \
    --factor 'N6GVVKSC' \
    --mfaToken '39zeBCgp' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 218 'Verify2faCode' test.out

#- 219 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KzUE9vIC' \
    --userId '4fvPVC3A' \
    > test.out 2>&1
eval_tap $? 219 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 220 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'y5hFULvP' \
    --clientId 'OUkoS2wx' \
    --redirectUri 'OeGRrdgG' \
    --requestId 'G6lQ4cCS' \
    > test.out 2>&1
eval_tap $? 220 'AuthCodeRequestV3' test.out

#- 221 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'ejMiAduX' \
    --clientId 'HzPcWXth' \
    --createHeadless  \
    --deviceId 'trxDajLd' \
    --macAddress '4PNx6vOj' \
    --platformToken '4mEjzVVO' \
    > test.out 2>&1
eval_tap $? 221 'PlatformTokenGrantV3' test.out

#- 222 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 222 'GetRevocationListV3' test.out

#- 223 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'L8aDCCiu' \
    > test.out 2>&1
eval_tap $? 223 'TokenRevocationV3' test.out

#- 224 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'hRAm9cSH' \
    --code 'VebcX9gO' \
    --codeVerifier '44M2Bosj' \
    --extendExp  \
    --password 'Zb5Mkjtz' \
    --redirectUri 'FN6kFDIb' \
    --refreshToken 'lWV8Z0E2' \
    --username 'IvLPx2C9' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 224 'TokenGrantV3' test.out

#- 225 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'Ge8W014W' \
    > test.out 2>&1
eval_tap $? 225 'VerifyTokenV3' test.out

#- 226 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'kZhXV9py' \
    --code 'KJQYiGfv' \
    --error 'DcoOUZau' \
    --openidAssocHandle 'PxWHRI1Y' \
    --openidClaimedId 'sObJszOx' \
    --openidIdentity 'M8Gpz3V2' \
    --openidMode 'wn5iSvEl' \
    --openidNs 'geS88YZL' \
    --openidOpEndpoint 'kgcdvSeg' \
    --openidResponseNonce 'gjSMjP5q' \
    --openidReturnTo '5ACKcpd3' \
    --openidSig '9vMYsxqX' \
    --openidSigned 'C8u0MiHo' \
    --state 'xUkDglPq' \
    > test.out 2>&1
eval_tap $? 226 'PlatformAuthenticationV3' test.out

#- 227 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'pJkwNGeE' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetInputValidations' test.out

#- 228 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode '9zkbo0Ae' \
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
    --clientId 'bzIY6M5m' \
    > test.out 2>&1
eval_tap $? 230 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 231 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'faaP0pJh' \
    --body '{"platformUserIds": ["uTyfH6Q9", "HPSI3aQm", "23AFILLg"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 232 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AvRxZye1' \
    --platformUserId '732z70ES' \
    > test.out 2>&1
eval_tap $? 232 'PublicGetUserByPlatformUserIDV3' test.out

#- 233 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId '2SlWzgS3' \
    > test.out 2>&1
eval_tap $? 233 'PublicGetAsyncStatus' test.out

#- 234 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'qAE3W5As' \
    --limit '89' \
    --offset '37' \
    --query 'YM1XKcPA' \
    > test.out 2>&1
eval_tap $? 234 'PublicSearchUserV3' test.out

#- 235 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "T56QR7Gi", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "whBfj4FH", "policyId": "IJNDdjks", "policyVersionId": "A9J5xrGK"}, {"isAccepted": false, "localizedPolicyVersionId": "Dtu2LnQ9", "policyId": "riM8FRFT", "policyVersionId": "k0I0MB7U"}, {"isAccepted": false, "localizedPolicyVersionId": "hSkTJE3E", "policyId": "fpcNk2hR", "policyVersionId": "heS3yI5P"}], "authType": "xTfde9sh", "code": "PQqZgfPL", "country": "fvqLOWW8", "dateOfBirth": "V0vCIM9g", "displayName": "45grUh4z", "emailAddress": "Tz13cEqJ", "password": "FqOwRSCw", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 235 'PublicCreateUserV3' test.out

#- 236 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'Y6eBnmJE' \
    --query 'Pndppqy6' \
    > test.out 2>&1
eval_tap $? 236 'CheckUserAvailability' test.out

#- 237 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["JASYtMeR", "HT9r8mmp", "3vzgdYNO"]}' \
    > test.out 2>&1
eval_tap $? 237 'PublicBulkGetUsers' test.out

#- 238 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "hIJaGOfW", "languageTag": "HreeVOLJ"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicSendRegistrationCode' test.out

#- 239 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "CZUEhwYG", "emailAddress": "HGM1TNbk"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicVerifyRegistrationCode' test.out

#- 240 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "1SPVWZRm", "languageTag": "CsTuztro"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicForgotPasswordV3' test.out

#- 241 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'PsjZYZiz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'GetAdminInvitationV3' test.out

#- 242 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'yKxb9r8U' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "JA5t2py6", "policyId": "N52E1kDK", "policyVersionId": "g3dAViiQ"}, {"isAccepted": true, "localizedPolicyVersionId": "0JoRSuZb", "policyId": "WJ3Y8pl8", "policyVersionId": "gByG2tJJ"}, {"isAccepted": true, "localizedPolicyVersionId": "BtYyaGhR", "policyId": "vxGg3UcN", "policyVersionId": "WbB3uHXa"}], "authType": "EMAILPASSWD", "country": "81uSHBma", "dateOfBirth": "6br7kMjZ", "displayName": "6rpR6AqX", "password": "cVobxzss", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 242 'CreateUserFromInvitationV3' test.out

#- 243 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "B4kwXSUl", "country": "HJx84oCm", "dateOfBirth": "xh6S1dYR", "displayName": "CaJMsEuy", "languageTag": "mQaNfkrG", "userName": "XMt0unK8"}' \
    > test.out 2>&1
eval_tap $? 243 'UpdateUserV3' test.out

#- 244 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "m03jvhgE", "country": "Y2dzXo1V", "dateOfBirth": "K6rAvENr", "displayName": "4dcV4geC", "languageTag": "jtxys5vG", "userName": "ZWqALYIi"}' \
    > test.out 2>&1
eval_tap $? 244 'PublicPartialUpdateUserV3' test.out

#- 245 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "WDSb9vhN", "emailAddress": "EywHnTvd", "languageTag": "UK7TxYFs"}' \
    > test.out 2>&1
eval_tap $? 245 'PublicSendVerificationCodeV3' test.out

#- 246 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "W3THYDWK", "contactType": "R3xUeMZd", "languageTag": "n47gv5JI", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 246 'PublicUserVerificationV3' test.out

#- 247 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "g92zWKjz", "country": "j9cF9bxV", "dateOfBirth": "eQdMUMzU", "displayName": "dQvXHKDg", "emailAddress": "MevXyCud", "password": "DNJiRySs", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 247 'PublicUpgradeHeadlessAccountV3' test.out

#- 248 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "RreZNBfi", "password": "U7O6EGCs"}' \
    > test.out 2>&1
eval_tap $? 248 'PublicVerifyHeadlessAccountV3' test.out

#- 249 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "hodNSqhE", "newPassword": "XEzgApDa", "oldPassword": "PEW12y4l"}' \
    > test.out 2>&1
eval_tap $? 249 'PublicUpdatePasswordV3' test.out

#- 250 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'kEwAprCG' \
    > test.out 2>&1
eval_tap $? 250 'PublicCreateJusticeUser' test.out

#- 251 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hvZa4vqo' \
    --redirectUri '9Xmoxsw3' \
    --ticket 'vicPcE2O' \
    > test.out 2>&1
eval_tap $? 251 'PublicPlatformLinkV3' test.out

#- 252 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'L7nroceT' \
    --body '{"platformNamespace": "PRppPuU8"}' \
    > test.out 2>&1
eval_tap $? 252 'PublicPlatformUnlinkV3' test.out

#- 253 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qMXokkka' \
    > test.out 2>&1
eval_tap $? 253 'PublicPlatformUnlinkAllV3' test.out

#- 254 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MMVDjelF' \
    --ticket '33L1CZaj' \
    > test.out 2>&1
eval_tap $? 254 'PublicForcePlatformLinkV3' test.out

#- 255 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId '4iqGSHxM' \
    --clientId 'eIsxYREf' \
    --redirectUri 'zihPHEWw' \
    > test.out 2>&1
eval_tap $? 255 'PublicWebLinkPlatform' test.out

#- 256 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JBIuHwII' \
    --state 'lQkJrgbG' \
    > test.out 2>&1
eval_tap $? 256 'PublicWebLinkPlatformEstablish' test.out

#- 257 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "vgQ36VzP", "emailAddress": "csEUFREF", "newPassword": "X4Q98TZ3"}' \
    > test.out 2>&1
eval_tap $? 257 'ResetPasswordV3' test.out

#- 258 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HN1tMnkG' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetUserByUserIdV3' test.out

#- 259 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pBtlJ0Yi' \
    --activeOnly  \
    --after 'ADZodwkO' \
    --before 'opJo6VjQ' \
    --limit '50' \
    > test.out 2>&1
eval_tap $? 259 'PublicGetUserBanHistoryV3' test.out

#- 260 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VqmF2ARp' \
    > test.out 2>&1
eval_tap $? 260 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 261 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cm8lJt1l' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetUserInformationV3' test.out

#- 262 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y2CqSkSV' \
    --after '0.6444330378574566' \
    --before '0.12018267486061351' \
    --limit '35' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetUserLoginHistoriesV3' test.out

#- 263 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3IDEyZjt' \
    --after 'fiWtgcAl' \
    --before 'gpFkBFzd' \
    --limit '16' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetUserPlatformAccountsV3' test.out

#- 264 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5oKNkIMZ' \
    > test.out 2>&1
eval_tap $? 264 'PublicListJusticePlatformAccountsV3' test.out

#- 265 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '6QSMF1Jo' \
    --body '{"platformId": "YvVrtqdo", "platformUserId": "4ZdFKIet"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicLinkPlatformAccount' test.out

#- 266 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'X24QOsXI' \
    --body '{"chosenNamespaces": ["gbVvw3uo", "yiayDqvD", "52hkLVv9"], "requestId": "sBurKAFy"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicForceLinkPlatformWithProgression' test.out

#- 267 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '41HEtW8f' \
    > test.out 2>&1
eval_tap $? 267 'PublicGetPublisherUserV3' test.out

#- 268 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gylJ8cXK' \
    --password 'OvrdhYuE' \
    > test.out 2>&1
eval_tap $? 268 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 269 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'BTg2zKMH' \
    --before 'cVcGZBKt' \
    --isWildcard  \
    --limit '14' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetRolesV3' test.out

#- 270 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId '05FfciSi' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetRoleV3' test.out

#- 271 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 271 'PublicGetMyUserV3' test.out

#- 272 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'mUInLqki' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 273 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["k5xPljEW", "Jl0a1Bau", "G7GXpD63"], "oneTimeLinkCode": "QnzMLExJ"}' \
    > test.out 2>&1
eval_tap $? 273 'LinkHeadlessAccountToMyAccountV3' test.out

#- 274 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "Zjr4LKQj"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicSendVerificationLinkV3' test.out

#- 275 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code '7GI5Cy7I' \
    > test.out 2>&1
eval_tap $? 275 'PublicVerifyUserByLinkV3' test.out

#- 276 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'qNVz27nb' \
    --code 'GkKTnh32' \
    --error 'LXULUjUE' \
    --state 'rnLv66X0' \
    > test.out 2>&1
eval_tap $? 276 'PlatformAuthenticateSAMLV3Handler' test.out

#- 277 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'W3M7OSFR' \
    --payload 'yBTRtfDa' \
    > test.out 2>&1
eval_tap $? 277 'LoginSSOClient' test.out

#- 278 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'JUdaDHSn' \
    > test.out 2>&1
eval_tap $? 278 'LogoutSSOClient' test.out

#- 279 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'zI9wPWtU' \
    > test.out 2>&1
eval_tap $? 279 'RequestGameTokenResponseV3' test.out

#- 280 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dnbXrqVN' \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDevicesByUserV4' test.out

#- 281 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'DlIeGiRl' \
    --endDate '3FISy4Xr' \
    --limit '84' \
    --offset '31' \
    --startDate 'KiHVBkyh' \
    > test.out 2>&1
eval_tap $? 281 'AdminGetBannedDevicesV4' test.out

#- 282 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'InfO9ouK' \
    > test.out 2>&1
eval_tap $? 282 'AdminGetUserDeviceBansV4' test.out

#- 283 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "s9Tx6i8X", "deviceId": "kqaF9xRU", "deviceType": "AUueyN21", "enabled": false, "endDate": "66cDmsYH", "ext": {"pC6sfmeU": {}, "Z1wZ0wL7": {}, "Sq6dfY53": {}}, "reason": "xpRyk33V"}' \
    > test.out 2>&1
eval_tap $? 283 'AdminBanDeviceV4' test.out

#- 284 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'Ud6KiKKv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'AdminGetDeviceBanV4' test.out

#- 285 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'SNirs447' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 285 'AdminUpdateDeviceBanV4' test.out

#- 286 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'RkOpgsng' \
    --startDate 'DKQahMHB' \
    --deviceType 'Gq5wfwy7' \
    > test.out 2>&1
eval_tap $? 286 'AdminGenerateReportV4' test.out

#- 287 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 287 'AdminGetDeviceTypesV4' test.out

#- 288 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId '5x46cUJo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 288 'AdminGetDeviceBansV4' test.out

#- 289 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'Kg0dWwY2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 289 'AdminDecryptDeviceV4' test.out

#- 290 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'tDR64XY3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'AdminUnbanDeviceV4' test.out

#- 291 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'YqDG1IZw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'AdminGetUsersByDeviceV4' test.out

#- 292 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 6}' \
    > test.out 2>&1
eval_tap $? 292 'AdminCreateTestUsersV4' test.out

#- 293 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["GxCqVprY", "nWkLVm2r", "z8IzDm9h"]}' \
    > test.out 2>&1
eval_tap $? 293 'AdminBulkCheckValidUserIDV4' test.out

#- 294 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lUz8jYti' \
    --body '{"avatarUrl": "iwirLyw8", "country": "uLkLPzFF", "dateOfBirth": "0LMAejWI", "displayName": "O99HAE9p", "languageTag": "qjL1Zmo6", "userName": "fzQWRvD9"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminUpdateUserV4' test.out

#- 295 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mENvOmhb' \
    --body '{"code": "Vvvni5gQ", "emailAddress": "rhY8fMHg"}' \
    > test.out 2>&1
eval_tap $? 295 'AdminUpdateUserEmailAddressV4' test.out

#- 296 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'v3SMegbs' \
    > test.out 2>&1
eval_tap $? 296 'AdminDisableUserMFAV4' test.out

#- 297 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '81DqS0Iw' \
    > test.out 2>&1
eval_tap $? 297 'AdminListUserRolesV4' test.out

#- 298 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MNGiAAaK' \
    --body '{"assignedNamespaces": ["4taHFj32", "65YF6elp", "lGo1nac3"], "roleId": "52uHcZfp"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateUserRoleV4' test.out

#- 299 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HKI6hMcb' \
    --body '{"assignedNamespaces": ["xIlA8XeJ", "x8gMdORA", "nEfwJYRV"], "roleId": "WYWYDBjw"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminAddUserRoleV4' test.out

#- 300 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qxROPNBd' \
    --body '{"assignedNamespaces": ["QQoakGsZ", "Kz0P6Rhr", "nmNwCIKw"], "roleId": "jraILg0g"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminRemoveUserRoleV4' test.out

#- 301 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '69' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 301 'AdminGetRolesV4' test.out

#- 302 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "roleName": "RTFDVt5S"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminCreateRoleV4' test.out

#- 303 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId '1hLPAQ7O' \
    > test.out 2>&1
eval_tap $? 303 'AdminGetRoleV4' test.out

#- 304 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'HGMgGgeT' \
    > test.out 2>&1
eval_tap $? 304 'AdminDeleteRoleV4' test.out

#- 305 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId '99TsOKFp' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "EJ8NyUBE"}' \
    > test.out 2>&1
eval_tap $? 305 'AdminUpdateRoleV4' test.out

#- 306 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'i73CZl03' \
    --body '{"permissions": [{"action": 48, "resource": "i0EMbWbj", "schedAction": 11, "schedCron": "hwizJSi2", "schedRange": ["vfh09Y5e", "IyN3G8Q1", "Cvz9gXNe"]}, {"action": 96, "resource": "xs33HtES", "schedAction": 51, "schedCron": "IEUEk4rk", "schedRange": ["brqnaMOb", "xf1pm9R9", "nXurn2qT"]}, {"action": 56, "resource": "Uv1ga0pu", "schedAction": 47, "schedCron": "361Jg7XQ", "schedRange": ["RVJaMPDd", "xO3vSVTu", "EG9rU4m4"]}]}' \
    > test.out 2>&1
eval_tap $? 306 'AdminUpdateRolePermissionsV4' test.out

#- 307 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'ZilP5vHn' \
    --body '{"permissions": [{"action": 34, "resource": "7KYU7aPh", "schedAction": 99, "schedCron": "6ZkXTbRq", "schedRange": ["lXFRD2I2", "eKFN3aVO", "O7ziUGou"]}, {"action": 85, "resource": "bKTj7Pgq", "schedAction": 91, "schedCron": "lIS4M1S2", "schedRange": ["sHsjfJjs", "TnPUwfYW", "GVrIT72k"]}, {"action": 31, "resource": "OQvS06Qo", "schedAction": 41, "schedCron": "Rv6o3ASm", "schedRange": ["DYOrzUsZ", "YO7nud0G", "Pl0eiJsE"]}]}' \
    > test.out 2>&1
eval_tap $? 307 'AdminAddRolePermissionsV4' test.out

#- 308 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'h5xXC6qg' \
    --body '["IET7SUmo", "0DmmJqRI", "rPuBaoII"]' \
    > test.out 2>&1
eval_tap $? 308 'AdminDeleteRolePermissionsV4' test.out

#- 309 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'wh3qvBQt' \
    --after 'oRbnoVx7' \
    --before 'oNK2mvJP' \
    --limit '98' \
    > test.out 2>&1
eval_tap $? 309 'AdminListAssignedUsersV4' test.out

#- 310 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'ZVvd57Mh' \
    --body '{"assignedNamespaces": ["ktLvr5kj", "JCds7yjY", "iKAyg777"], "namespace": "6GmfX6wK", "userId": "siZmOdtg"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminAssignUserToRoleV4' test.out

#- 311 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId '1xH6NDjk' \
    --body '{"namespace": "SO4R9SQN", "userId": "GrWdUfA9"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminRevokeUserFromRoleV4' test.out

#- 312 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "pF6SthXj", "country": "OIcb2sHG", "dateOfBirth": "eCIZsLDQ", "displayName": "guvSCTn5", "languageTag": "NNWpIIOW", "userName": "vrNAzCrd"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateMyUserV4' test.out

#- 313 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 313 'AdminDisableMyAuthenticatorV4' test.out

#- 314 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'aRSDflwm' \
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
    --code 'japP0YLv' \
    > test.out 2>&1
eval_tap $? 323 'AdminEnableMyEmailV4' test.out

#- 324 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 324 'AdminGetMyEnabledFactorsV4' test.out

#- 325 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor '19naV0p4' \
    > test.out 2>&1
eval_tap $? 325 'AdminMakeFactorMyDefaultV4' test.out

#- 326 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["WqRs2zw1", "YlgT0ZJC", "KzzyJHhk"], "emailAddresses": ["9u9xkfKO", "Xy8K5yN0", "oczZlTZJ"], "isAdmin": false, "namespace": "pF2IewT7", "roleId": "hUKYK4b5"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminInviteUserV4' test.out

#- 327 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "TD2agDG3", "policyId": "PCobrjPO", "policyVersionId": "MKHoshNy"}, {"isAccepted": false, "localizedPolicyVersionId": "KGXvBHk0", "policyId": "A4hP5Rn2", "policyVersionId": "7evsx8jN"}, {"isAccepted": true, "localizedPolicyVersionId": "oBxQbRSZ", "policyId": "kVZzKpzA", "policyVersionId": "0lzlTah2"}], "authType": "EMAILPASSWD", "country": "DczmlMJA", "dateOfBirth": "XzEiDhRg", "displayName": "jEsTppLk", "emailAddress": "cjCh9dVj", "password": "VypBPgRd", "passwordMD5Sum": "sAOnuvwU", "username": "6BS9W38O", "verified": true}' \
    > test.out 2>&1
eval_tap $? 327 'PublicCreateTestUserV4' test.out

#- 328 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "GQkrodlu", "policyId": "TNNm7XSj", "policyVersionId": "1opLzmv7"}, {"isAccepted": true, "localizedPolicyVersionId": "wa5YyGtw", "policyId": "MB8RrGKb", "policyVersionId": "YeSwMteL"}, {"isAccepted": false, "localizedPolicyVersionId": "hx0bHmxa", "policyId": "POjmRvSo", "policyVersionId": "luRx6dNs"}], "authType": "EMAILPASSWD", "code": "jv3y46f6", "country": "0ol9BdxG", "dateOfBirth": "KYF7GTcg", "displayName": "jGG6MnZd", "emailAddress": "VezJ0pKq", "password": "XdTJtLj9", "passwordMD5Sum": "mIJ44wej", "reachMinimumAge": false, "username": "FVZivDqu"}' \
    > test.out 2>&1
eval_tap $? 328 'PublicCreateUserV4' test.out

#- 329 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'tspUUB76' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "CZqrDjig", "policyId": "6kuXz7G8", "policyVersionId": "qBmU57ia"}, {"isAccepted": true, "localizedPolicyVersionId": "ZwBfyOoY", "policyId": "tqQA920R", "policyVersionId": "MH8z2Gr0"}, {"isAccepted": false, "localizedPolicyVersionId": "3fKvzAkA", "policyId": "j54bgzof", "policyVersionId": "8RjfaTnO"}], "authType": "EMAILPASSWD", "country": "126awDdm", "dateOfBirth": "PksTHkC7", "displayName": "zreLXP6D", "password": "0rUG1Sow", "reachMinimumAge": true, "username": "2MSYlJgt"}' \
    > test.out 2>&1
eval_tap $? 329 'CreateUserFromInvitationV4' test.out

#- 330 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "okoOgU6c", "country": "HrYWLeqG", "dateOfBirth": "z5eq4z9A", "displayName": "2KvI7r90", "languageTag": "DFYiaQjs", "userName": "6KSoB7vN"}' \
    > test.out 2>&1
eval_tap $? 330 'PublicUpdateUserV4' test.out

#- 331 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "CTJLwHkc", "emailAddress": "7qnvmaQc"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicUpdateUserEmailAddressV4' test.out

#- 332 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "vSbrgtBw", "country": "72BNElXo", "dateOfBirth": "Tn5qBuCF", "displayName": "r9j6kKXp", "emailAddress": "J2WiV3Uh", "password": "fHD0yTkY", "reachMinimumAge": true, "username": "FhoOQdIW", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 332 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 333 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "Dh1P3lb6", "password": "csu2B0hW", "username": "HTGLAPUJ"}' \
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
    --code '3tu3Urqt' \
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
    --deviceToken 'gbppxXM1' \
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
    --code 'AhACSVun' \
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
    --factor 'hhaeRCKf' \
    > test.out 2>&1
eval_tap $? 347 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE