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
    --body '[{"field": "TbnzioQT", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "blockedWord": ["HsQydLn3", "T1pNppJ0", "U8qQkcYC"], "description": [{"language": "MvbSiPSv", "message": ["YkSeVGlu", "YYBJy8GH", "SO3QArKf"]}, {"language": "WRB2jIsT", "message": ["CHE5toB1", "YpBWgqYS", "JwvBBGCv"]}, {"language": "f8gwcSxa", "message": ["KF5LMaew", "nBFaFGvF", "akcz7ykd"]}], "isCustomRegex": true, "letterCase": "PkhXaQTe", "maxLength": 58, "maxRepeatingAlphaNum": 65, "maxRepeatingSpecialCharacter": 12, "minCharType": 100, "minLength": 79, "regex": "qs8p1pgL", "specialCharacterLocation": "SeHHgOxs", "specialCharacters": ["ajc8Jj46", "DAkVf4JV", "LxWErDmm"]}}, {"field": "0aA2NGgM", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "blockedWord": ["LCCeoBhs", "31kiQFsZ", "xOilfvZL"], "description": [{"language": "Jd9dYmj1", "message": ["OWV5yfay", "yTPFKdrH", "jJrOsdz9"]}, {"language": "0EYQAPtw", "message": ["dLLZ8nDy", "NSKichDC", "Ovvq1RyZ"]}, {"language": "JkeVMSek", "message": ["PsB18hva", "x63HCkUq", "ei2fJESW"]}], "isCustomRegex": true, "letterCase": "iRNyeF7o", "maxLength": 14, "maxRepeatingAlphaNum": 96, "maxRepeatingSpecialCharacter": 75, "minCharType": 77, "minLength": 62, "regex": "WsGe50en", "specialCharacterLocation": "h8HqvvBw", "specialCharacters": ["ZGO4nn4X", "rmS8Ugjw", "I0K7EPRm"]}}, {"field": "DfzBYz1W", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "blockedWord": ["lRGH4ua4", "saUQq4RI", "QhFjIGUY"], "description": [{"language": "IlqgJ4o1", "message": ["bw6tWMuD", "GKuH0ewE", "zRh0VWWC"]}, {"language": "ogHqvjrt", "message": ["1KILZoDO", "56D0eAIv", "RUMWT2zO"]}, {"language": "vzsqEtj1", "message": ["liMZ6aY2", "ZWKYA2C0", "mJKrmI9S"]}], "isCustomRegex": true, "letterCase": "xozs8oPf", "maxLength": 6, "maxRepeatingAlphaNum": 74, "maxRepeatingSpecialCharacter": 81, "minCharType": 72, "minLength": 23, "regex": "ZqcPrNvt", "specialCharacterLocation": "Lp6u31dB", "specialCharacters": ["6VJe4lpZ", "eo9eAws0", "Ic2c3KDf"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'flAN7jKa' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'oe8SMtb0' \
    --before 'KHCf1qC2' \
    --limit '27' \
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
    --body '{"ageRestriction": 8, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'ZjDKLvCc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 69}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'GA5oG3EN' \
    --limit '3' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "hdN8M1Oq", "comment": "8dJBVtEQ", "endDate": "Jcwq6Jlq", "reason": "pjAvgUqV", "skipNotif": true, "userIds": ["0ngPcb5Z", "C1Z1ggf5", "tStdEMZS"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "66UC7PT3", "userId": "lJ1UbeFv"}, {"banId": "pkLnzbNw", "userId": "EoXk3Udg"}, {"banId": "fRqK5U9o", "userId": "GIlc3KCF"}]}' \
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
    --clientId 'vC2vIPvO' \
    --clientName 'YbW1cQ5b' \
    --clientType 'yPWVo4AY' \
    --limit '29' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["T98JKMc0", "4Uw6iz2T", "g5vloxtQ"], "baseUri": "hMzke3fr", "clientId": "v1m4gSdb", "clientName": "xJ6depwz", "clientPermissions": [{"action": 97, "resource": "vUPj8Pra", "schedAction": 0, "schedCron": "VtxUtmgJ", "schedRange": ["XhF0At0z", "wAc8FCjU", "H3ihv1Io"]}, {"action": 97, "resource": "ioCtKaUi", "schedAction": 30, "schedCron": "lG80cjlO", "schedRange": ["SOOXnvRh", "S3ioKziJ", "mig7b8ky"]}, {"action": 97, "resource": "LbOzNOIO", "schedAction": 38, "schedCron": "26y3Ln91", "schedRange": ["ubwKq6lI", "7CfBByUL", "9QXxZ3iN"]}], "clientPlatform": "4WmK5QNq", "deletable": false, "description": "1jWU3L9A", "namespace": "Exrrj240", "oauthAccessTokenExpiration": 95, "oauthAccessTokenExpirationTimeUnit": "F9gpU62M", "oauthClientType": "J9o8eQLL", "oauthRefreshTokenExpiration": 91, "oauthRefreshTokenExpirationTimeUnit": "2lRKlJVP", "redirectUri": "Crm2xALA", "scopes": ["JwG81FWR", "6bk8CmX1", "Tfyllj5c"], "secret": "w8AElnTL", "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'uJmhNzuz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'nrYsai8G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'CLcIsVBO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["6LCzr096", "nIVnThWF", "YiwCEeZF"], "baseUri": "YL9JjHUj", "clientName": "hV3a4q74", "clientPermissions": [{"action": 23, "resource": "bECR7chF", "schedAction": 52, "schedCron": "LzsFcTji", "schedRange": ["GYJVtOkt", "4GiacR97", "uTAyYFwW"]}, {"action": 72, "resource": "wx4RaZNa", "schedAction": 78, "schedCron": "M5eGmA16", "schedRange": ["huBqu4f3", "Xu8wMe44", "g2TVcxiq"]}, {"action": 92, "resource": "SeK3CwCx", "schedAction": 86, "schedCron": "joM550FS", "schedRange": ["DBrjAiuz", "WvAvGDc0", "tm4nKQUY"]}], "clientPlatform": "VDs3i65c", "deletable": false, "description": "bdsRuTsn", "namespace": "ls0NhH5A", "oauthAccessTokenExpiration": 33, "oauthAccessTokenExpirationTimeUnit": "NEycEqqQ", "oauthRefreshTokenExpiration": 1, "oauthRefreshTokenExpirationTimeUnit": "TSV7mmY4", "redirectUri": "zBDDh3hd", "scopes": ["CRpKWlY7", "f4QlCNOZ", "d8oZjO5A"], "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'BHLSi1j4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 2, "resource": "swMYtuU6"}, {"action": 11, "resource": "2ANHC4xK"}, {"action": 14, "resource": "puAUl0V2"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'zApuISN4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 61, "resource": "LO9chRXE"}, {"action": 98, "resource": "BFOtOHUQ"}, {"action": 5, "resource": "zCZi3kFQ"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '60' \
    --clientId 'GrYMbohY' \
    --namespace "$AB_NAMESPACE" \
    --resource 'yLf0xkUs' \
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
    --limit '95' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'J6Rx2EnW' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TTRU1IsU' \
    --body '{"ACSURL": "mnFEKAky", "AWSCognitoRegion": "sR0ARHJ9", "AWSCognitoUserPool": "DiqIETEo", "AllowedClients": ["18o7aiPM", "XNXgozPe", "Mtz2CDSn"], "AppId": "BlciqCID", "AuthorizationEndpoint": "zJsKU4sc", "ClientId": "eHsI3bUl", "Environment": "qrMYmNJi", "FederationMetadataURL": "Z9gBS9Fg", "GenericOauthFlow": true, "IsActive": true, "Issuer": "7LCGFf3w", "JWKSEndpoint": "bTzQJdy6", "KeyID": "MeiRvrWp", "NetflixCertificates": {"encryptedPrivateKey": "8q1sjwLg", "encryptedPrivateKeyName": "mQcTCjCh", "publicCertificate": "trNuTOqg", "publicCertificateName": "foA0n5WQ", "rootCertificate": "wbHTXL7c", "rootCertificateName": "yTfwe1gO"}, "OrganizationId": "OK8J06yt", "PlatformName": "1kmAY21T", "RedirectUri": "20ARciAx", "RegisteredDomains": [{"affectedClientIDs": ["s1zuylva", "81MVlD2O", "8fTUBnl2"], "domain": "ablHViu1", "namespaces": ["47kjL9Db", "F9ZMruPI", "tWhMquyO"], "roleId": "lGSvGpBJ"}, {"affectedClientIDs": ["gRmnMkNr", "dOLY9EDA", "G96cNPhn"], "domain": "AEskDW5p", "namespaces": ["NZY9Js0F", "gj94t4mC", "H9Kd067O"], "roleId": "hnnBn5Bt"}, {"affectedClientIDs": ["armx0KjH", "fE3Sf1ck", "vz7fByZ1"], "domain": "Q2Ko0Hjt", "namespaces": ["lXeVP5JR", "OhAqGG5B", "mz5D5wc4"], "roleId": "eaCxiy1x"}], "Secret": "7zvdQKJs", "TeamID": "npTf2Fi8", "TokenAuthenticationType": "aUXrLSoP", "TokenClaimsMapping": {"BYRN92uM": "7wW7Ba98", "1vVB3cyh": "gxygGLcG", "RQt770mf": "e22afMfV"}, "TokenEndpoint": "MCKq6GgD", "scopes": ["RxBSOnt5", "aASTFGqi", "G0YYGkUl"]}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'eKqEzuBx' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6nSFOHRa' \
    --body '{"ACSURL": "DQEUXUJB", "AWSCognitoRegion": "xcq0GF7X", "AWSCognitoUserPool": "PYlEkitZ", "AllowedClients": ["chmtCxah", "MDJSvz9i", "5H5tgjnr"], "AppId": "mwH4u9ld", "AuthorizationEndpoint": "sxXonRRR", "ClientId": "XTMLD7MD", "Environment": "YG8dGYnp", "FederationMetadataURL": "9HSeRrTO", "GenericOauthFlow": true, "IsActive": false, "Issuer": "sPlD8qlv", "JWKSEndpoint": "Dc3gtlM3", "KeyID": "fZvoPaFW", "NetflixCertificates": {"encryptedPrivateKey": "2ttRafdP", "encryptedPrivateKeyName": "2iO26yo5", "publicCertificate": "Tt1OE8lM", "publicCertificateName": "m4a8cQdw", "rootCertificate": "eggWVGfT", "rootCertificateName": "hdmHigjZ"}, "OrganizationId": "RaXbNhzJ", "PlatformName": "SA7xyfKy", "RedirectUri": "T9COAeeG", "RegisteredDomains": [{"affectedClientIDs": ["L18qyIQx", "hUK1rb03", "zCRNgl5L"], "domain": "4TvdPKq4", "namespaces": ["ZQw816nl", "w4ss8cJk", "4gK5zJRu"], "roleId": "HHawDuQL"}, {"affectedClientIDs": ["TAmeJWfC", "V2Dx0Rtl", "xHYYQpTl"], "domain": "k6ND5Wid", "namespaces": ["C3Y1RaDS", "GtbQBoDw", "QYbt5pi3"], "roleId": "fhQPISxr"}, {"affectedClientIDs": ["6MWxuyF5", "1048j8ro", "qqV9SNJc"], "domain": "QnmbncDa", "namespaces": ["qmQkFjxc", "9rUTfzf4", "TBtbB5bn"], "roleId": "28OJZm5K"}], "Secret": "CbuAnulo", "TeamID": "Jjzu91wG", "TokenAuthenticationType": "5pnKJmD8", "TokenClaimsMapping": {"CwXfYnt4": "xP3gk2rz", "6UvtDji9": "zFX36h2Q", "Hc2a1rYK": "pjRrOjCS"}, "TokenEndpoint": "DsjFzDBW", "scopes": ["lRWpGsGY", "7sXocXqV", "RnbESd32"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Spn6rUhS' \
    --body '{"affectedClientIDs": ["vPk5leHY", "e0Qk0Ed7", "3rxJlvfX"], "assignedNamespaces": ["qhtzewXZ", "lwR21EOo", "zMeHdCZG"], "domain": "d7RlrWwn", "roleId": "kqT4dEP7"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zC8pI22N' \
    --body '{"domain": "awkfw5cG"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZfxJCfJw' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '2tjpUpvi' \
    --body '{"acsUrl": "OckxxT8f", "apiKey": "BMkOyQgB", "appId": "1ywjQST5", "federationMetadataUrl": "MPEsOlPv", "isActive": true, "redirectUri": "uPMtMLwC", "secret": "aO587VBc", "ssoUrl": "wjysSblN"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gIG3xiNl' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xsnFb6Rc' \
    --body '{"acsUrl": "bGk0HMQ0", "apiKey": "VrAhTZgp", "appId": "d1ciL7WK", "federationMetadataUrl": "B40bR1DW", "isActive": false, "redirectUri": "QZJX7OOj", "secret": "u3hyJ3U2", "ssoUrl": "9aRD4aKv"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5gKOwq9m' \
    --platformUserId 'Mox2pqWp' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'Opjfna1C' \
    --after '57' \
    --before '18' \
    --limit '68' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'ol9p0IJD' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["RmXPnRVX", "NwFFHd1m", "34x4MzkH"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["qLREvo6v", "XgV9FRvQ", "8rSHfElb"], "isAdmin": true, "roles": ["5uuOHO7y", "dWCwFokl", "ISd7JEHe"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '61' \
    --platformUserId 'nIllPnNC' \
    --platformId 'ObrjomHi' \
    > test.out 2>&1
eval_tap $? 146 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 147 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 147 'AdminListUsersV3' test.out

#- 148 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '49RIQwr6' \
    --endDate '6wxgBkiY' \
    --limit '58' \
    --offset '2' \
    --platformBy 'iPJ0c5fE' \
    --platformId 'kHHZnRm9' \
    --query '1M7afutL' \
    --startDate '40640gsy' \
    > test.out 2>&1
eval_tap $? 148 'AdminSearchUserV3' test.out

#- 149 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["WzFZcvlq", "wqOtRfv4", "AEm6iTQ3"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetBulkUserByEmailAddressV3' test.out

#- 150 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oJB46KOV' \
    > test.out 2>&1
eval_tap $? 150 'AdminGetUserByUserIdV3' test.out

#- 151 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VTIailSO' \
    --body '{"avatarUrl": "hqkC20wR", "country": "kR43vKO1", "dateOfBirth": "e0LwTRM0", "displayName": "q9AfoBS9", "languageTag": "cGSuIKlU", "userName": "MLNgmdQn"}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserV3' test.out

#- 152 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8JM2YDhD' \
    --activeOnly  \
    --after 'KoK6PJkC' \
    --before 'IAi09YNN' \
    --limit '65' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetUserBanV3' test.out

#- 153 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AlqymOcR' \
    --body '{"ban": "mSr1Nz9x", "comment": "KfzYFzva", "endDate": "n99tcWP2", "reason": "GwdQqRL3", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 153 'AdminBanUserV3' test.out

#- 154 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'LCHz5RgG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'H2QqdCTi' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 154 'AdminUpdateUserBanV3' test.out

#- 155 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qi2D4kxz' \
    --body '{"context": "VAeXf164", "emailAddress": "9oUZ6q5M", "languageTag": "rogNQWEe"}' \
    > test.out 2>&1
eval_tap $? 155 'AdminSendVerificationCodeV3' test.out

#- 156 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3G0uuyJU' \
    --body '{"Code": "ajIaF5PY", "ContactType": "eoxxiO3Y", "LanguageTag": "ZHNapyL1", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 156 'AdminVerifyAccountV3' test.out

#- 157 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'fm1LsB9U' \
    > test.out 2>&1
eval_tap $? 157 'GetUserVerificationCode' test.out

#- 158 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SE4ipNeA' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserDeletionStatusV3' test.out

#- 159 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jK7zA0Z0' \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpdateUserDeletionStatusV3' test.out

#- 160 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JPcq11Yk' \
    --body '{"code": "cdMTfNsh", "country": "f3eozpyz", "dateOfBirth": "GwDDjD2k", "displayName": "OHQgq9Vz", "emailAddress": "3TYK3GcK", "password": "2fq2qSpw", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpgradeHeadlessAccountV3' test.out

#- 161 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UuWhTItu' \
    > test.out 2>&1
eval_tap $? 161 'AdminDeleteUserInformationV3' test.out

#- 162 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5hlkeQqU' \
    --after '0.07577317074227541' \
    --before '0.24844904112926514' \
    --limit '23' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetUserLoginHistoriesV3' test.out

#- 163 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eTYO0oy0' \
    --body '{"languageTag": "sc0ZhmBL", "newPassword": "mawaxGY8", "oldPassword": "q2rJQcxP"}' \
    > test.out 2>&1
eval_tap $? 163 'AdminResetPasswordV3' test.out

#- 164 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ItnxabUR' \
    --body '{"Permissions": [{"Action": 24, "Resource": "SERj1mMy", "SchedAction": 87, "SchedCron": "OO5BweuJ", "SchedRange": ["lxyUSlih", "Sy63TRNQ", "7jTxHTLh"]}, {"Action": 78, "Resource": "vc4J7OE8", "SchedAction": 29, "SchedCron": "Kb4qYttz", "SchedRange": ["gMxejtZT", "EGOek8Rr", "69XEzF8k"]}, {"Action": 44, "Resource": "9B6J9uwE", "SchedAction": 8, "SchedCron": "uLgoIeQT", "SchedRange": ["vgLLCAFo", "OsW4bpXB", "2RBlM0FL"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserPermissionV3' test.out

#- 165 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RSwUZKGg' \
    --body '{"Permissions": [{"Action": 63, "Resource": "2zqs6rtM", "SchedAction": 59, "SchedCron": "x6A8kRUg", "SchedRange": ["HNnT1PlH", "hFQNlI6y", "vEl2Z81g"]}, {"Action": 27, "Resource": "sTrpsLBm", "SchedAction": 48, "SchedCron": "Aedm3w2o", "SchedRange": ["J7sK5TG7", "wbpD1tL5", "bAofnOCJ"]}, {"Action": 8, "Resource": "eFVgR2yS", "SchedAction": 30, "SchedCron": "GLqUeiuF", "SchedRange": ["vT54TRGz", "BnNGzN0x", "yTWqz2ZR"]}]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminAddUserPermissionsV3' test.out

#- 166 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'prfKiwFk' \
    --body '[{"Action": 44, "Resource": "z5w0dtI9"}, {"Action": 10, "Resource": "iqpo9htU"}, {"Action": 96, "Resource": "pXHQ8ma5"}]' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionBulkV3' test.out

#- 167 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '51' \
    --namespace "$AB_NAMESPACE" \
    --resource 'VvaEBiI3' \
    --userId 'HUjRY6tR' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserPermissionV3' test.out

#- 168 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iJE7i4Xq' \
    --after 'nTe75WWC' \
    --before '099aP8os' \
    --limit '36' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserPlatformAccountsV3' test.out

#- 169 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'jHpl0ePo' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetListJusticePlatformAccounts' test.out

#- 170 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'UqiSAcCo' \
    --userId 'xx1Xv26A' \
    > test.out 2>&1
eval_tap $? 170 'AdminGetUserMapping' test.out

#- 171 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'nbiQCTGo' \
    --userId '4RP7fPHk' \
    > test.out 2>&1
eval_tap $? 171 'AdminCreateJusticeUser' test.out

#- 172 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'HX1Wcffy' \
    --body '{"platformId": "wKf5OpVa", "platformUserId": "Zy25Do8w"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminLinkPlatformAccount' test.out

#- 173 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ntQ4kzJ8' \
    --userId 'lOYJc0Pp' \
    --body '{"platformNamespace": "b3IjGiHt"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformUnlinkV3' test.out

#- 174 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pDVYIhK9' \
    --userId '8Qht00gZ' \
    --ticket 'vyKm6VAM' \
    > test.out 2>&1
eval_tap $? 174 'AdminPlatformLinkV3' test.out

#- 175 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'cJp1IJUy' \
    --userId '5ps5wZpg' \
    --platformToken 'niFwD3J3' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 176 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'i3GV3rSB' \
    --body '["ehs0yxuy", "GIDNDhiv", "rhP5LYQM"]' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserRolesV3' test.out

#- 177 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rb0aTFsf' \
    --body '[{"namespace": "uqvj4vtb", "roleId": "TwQwxpDX"}, {"namespace": "gzYAwPNU", "roleId": "YQ5EkftB"}, {"namespace": "mohj1SB1", "roleId": "2sdlAkh9"}]' \
    > test.out 2>&1
eval_tap $? 177 'AdminSaveUserRoleV3' test.out

#- 178 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'mI1DxdWJ' \
    --userId '8kdHX5Ft' \
    > test.out 2>&1
eval_tap $? 178 'AdminAddUserRoleV3' test.out

#- 179 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'PqfK2p15' \
    --userId 'Ai6DHusv' \
    > test.out 2>&1
eval_tap $? 179 'AdminDeleteUserRoleV3' test.out

#- 180 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'y6CE8Nk4' \
    --body '{"enabled": true, "reason": "4CtqHzuq"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateUserStatusV3' test.out

#- 181 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'b9js6ZHe' \
    > test.out 2>&1
eval_tap $? 181 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 182 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'I89ZMKaX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "l6j1qv5R"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateClientSecretV3' test.out

#- 183 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'CftMJUCp' \
    --before 'VeHZsTJZ' \
    --isWildcard  \
    --limit '52' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRolesV3' test.out

#- 184 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "managers": [{"displayName": "ya5tf4ds", "namespace": "68r87CW2", "userId": "xpnFTQyR"}, {"displayName": "jnl8e2kz", "namespace": "JKMfYYWl", "userId": "ju94D1xX"}, {"displayName": "4BP4Yonr", "namespace": "GEPHwU11", "userId": "vbSNjLM0"}], "members": [{"displayName": "2OYukHhR", "namespace": "OPhccx80", "userId": "0PeqVZ4k"}, {"displayName": "0EbAeOPu", "namespace": "u6nYggtt", "userId": "4RFNKnZC"}, {"displayName": "8rzfQoKm", "namespace": "WfYxUdYV", "userId": "PjV6fFwe"}], "permissions": [{"action": 90, "resource": "YyNvLs2D", "schedAction": 46, "schedCron": "tSn6zI4r", "schedRange": ["NIcDJl0q", "YZNZToUv", "e23V07iZ"]}, {"action": 42, "resource": "c9LovUCH", "schedAction": 69, "schedCron": "hkCv0V9p", "schedRange": ["5ZKzi4eP", "OUnPM8ZD", "p4GDVIvQ"]}, {"action": 80, "resource": "qEyLpK09", "schedAction": 54, "schedCron": "5SdQ9GI9", "schedRange": ["LPXVtxfw", "pgda8wcj", "SRLiuJqC"]}], "roleName": "ZiHDwAqA"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminCreateRoleV3' test.out

#- 185 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'VxZVyZjn' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleV3' test.out

#- 186 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'fXahVLz1' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteRoleV3' test.out

#- 187 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'Q3P5oiDv' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "znsh2XTK"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateRoleV3' test.out

#- 188 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'ldIxFKSy' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleAdminStatusV3' test.out

#- 189 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId '2900Ujba' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpdateAdminRoleStatusV3' test.out

#- 190 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'W1K814Fr' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleAdminV3' test.out

#- 191 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'pbXBCit8' \
    --after 'xPoQpIeb' \
    --before 'suGeMGFw' \
    --limit '62' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetRoleManagersV3' test.out

#- 192 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'sbpr6f7U' \
    --body '{"managers": [{"displayName": "u9o9Fhdg", "namespace": "5ZiY6GYd", "userId": "xKkoovyX"}, {"displayName": "Uv8BG0cl", "namespace": "8arIiukN", "userId": "f7saCebv"}, {"displayName": "nhrW8LGL", "namespace": "ctqpw7Al", "userId": "QPdoqNst"}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRoleManagersV3' test.out

#- 193 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId '5Q2vppGC' \
    --body '{"managers": [{"displayName": "XRNuyeGW", "namespace": "UC7lK8YO", "userId": "DwOPnzJE"}, {"displayName": "lv06YazT", "namespace": "2PnVluv8", "userId": "bAgkEXs8"}, {"displayName": "SELZihV4", "namespace": "h35ssPzH", "userId": "988PuRoc"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminRemoveRoleManagersV3' test.out

#- 194 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'VW5oAP0q' \
    --after '3m7r2GZa' \
    --before 'F5GzQBri' \
    --limit '75' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetRoleMembersV3' test.out

#- 195 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'SHUQRCip' \
    --body '{"members": [{"displayName": "a3xHzMKA", "namespace": "9SHn0dfc", "userId": "APQitvNE"}, {"displayName": "fmFbxagp", "namespace": "s86gKFwE", "userId": "UCtvbRXO"}, {"displayName": "E02pGkxi", "namespace": "EVqfEBZp", "userId": "Mk6izQvt"}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddRoleMembersV3' test.out

#- 196 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId '0JEVzanU' \
    --body '{"members": [{"displayName": "1Di4gSfU", "namespace": "V2KpT6Xb", "userId": "CxAoety3"}, {"displayName": "bL8uFKp9", "namespace": "sRKhinIT", "userId": "6AgBPmdJ"}, {"displayName": "NfG4adBz", "namespace": "9WQ80Of6", "userId": "ssL26em9"}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminRemoveRoleMembersV3' test.out

#- 197 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId '3kuWW8mb' \
    --body '{"permissions": [{"action": 8, "resource": "Gq4VHPd4", "schedAction": 71, "schedCron": "mr1TC7SJ", "schedRange": ["aTmUYW3i", "PFTXpchX", "UOE7uakc"]}, {"action": 66, "resource": "OxTqGxe1", "schedAction": 22, "schedCron": "ZNZb9imu", "schedRange": ["X4RubB48", "wvQI593B", "hq7r56ep"]}, {"action": 34, "resource": "K1efJCDF", "schedAction": 20, "schedCron": "OOWvO8zv", "schedRange": ["LMfGugAP", "RJpNRxFm", "xL1mzF5X"]}]}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateRolePermissionsV3' test.out

#- 198 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'gJiUrNA9' \
    --body '{"permissions": [{"action": 62, "resource": "D0AOXvyT", "schedAction": 0, "schedCron": "OSrzs6II", "schedRange": ["TXscybWm", "DwpFhL1m", "qfEQZgiM"]}, {"action": 65, "resource": "QjhMgues", "schedAction": 94, "schedCron": "7SFGe6Vi", "schedRange": ["XpQoh76S", "0Oi91vWX", "7LgZkH6z"]}, {"action": 65, "resource": "Evaowyak", "schedAction": 29, "schedCron": "DGsyfYug", "schedRange": ["GsT2660f", "kMVc2b2I", "AUHLCHdE"]}]}' \
    > test.out 2>&1
eval_tap $? 198 'AdminAddRolePermissionsV3' test.out

#- 199 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'q544FAeS' \
    --body '["UCsoyrdi", "miI87gpx", "vFnS2w60"]' \
    > test.out 2>&1
eval_tap $? 199 'AdminDeleteRolePermissionsV3' test.out

#- 200 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '83' \
    --resource 'MSPCe183' \
    --roleId 'GxL9AEwf' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteRolePermissionV3' test.out

#- 201 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 201 'AdminGetMyUserV3' test.out

#- 202 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'oF7diLh8' \
    --extendExp  \
    --redirectUri 'ApqjMNk8' \
    --password 'xoWDZoH9' \
    --requestId 'FvW9ah0p' \
    --userName 'e70Du0r9' \
    > test.out 2>&1
eval_tap $? 202 'UserAuthenticationV3' test.out

#- 203 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'RaycwnRK' \
    --linkingToken 'sygjz5Wp' \
    --password 'SuARIK60' \
    --username 'YdbAbECT' \
    > test.out 2>&1
eval_tap $? 203 'AuthenticationWithPlatformLinkV3' test.out

#- 204 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken '2M0yh1HA' \
    > test.out 2>&1
eval_tap $? 204 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 205 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'YiLvSqq3' \
    > test.out 2>&1
eval_tap $? 205 'RequestOneTimeLinkingCodeV3' test.out

#- 206 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'BbwPAAGW' \
    > test.out 2>&1
eval_tap $? 206 'ValidateOneTimeLinkingCodeV3' test.out

#- 207 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --clientId 'iWtW7bTe' \
    --oneTimeLinkCode '2nVgj3J0' \
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
    --clientId '9Bqz7eLu' \
    > test.out 2>&1
eval_tap $? 210 'RequestGameTokenCodeResponseV3' test.out

#- 211 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'eI0TwD61' \
    --userId 'KRCrQZTf' \
    > test.out 2>&1
eval_tap $? 211 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 212 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'J66QT7Cp' \
    > test.out 2>&1
eval_tap $? 212 'RevokeUserV3' test.out

#- 213 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'Qh6MpZ5f' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'lh5tUaVF' \
    --redirectUri 'jdK5b8uD' \
    --scope 'P2xCUQyU' \
    --state 'uQkRyR1p' \
    --targetAuthPage 'mk8MkQgF' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'M7Mz2DPG' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 213 'AuthorizeV3' test.out

#- 214 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'MLGAZMFw' \
    > test.out 2>&1
eval_tap $? 214 'TokenIntrospectionV3' test.out

#- 215 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 215 'GetJWKSV3' test.out

#- 216 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'XkE2wHAH' \
    --factor 'bUDCkpam' \
    --mfaToken 'pp2GoNmj' \
    > test.out 2>&1
eval_tap $? 216 'SendMFAAuthenticationCode' test.out

#- 217 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor '7kPytfWB' \
    --mfaToken 'HKAWXmUF' \
    > test.out 2>&1
eval_tap $? 217 'Change2faMethod' test.out

#- 218 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'PfPoi1W0' \
    --factor 'tc1BY4OX' \
    --mfaToken 'K0sFwXaO' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 218 'Verify2faCode' test.out

#- 219 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'J0X1N7Oi' \
    --userId '4fM8TOoI' \
    > test.out 2>&1
eval_tap $? 219 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 220 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'bxNS2fLS' \
    --clientId '5cDYbpVH' \
    --redirectUri '5j6Anuwk' \
    --requestId 'bo5JaHET' \
    > test.out 2>&1
eval_tap $? 220 'AuthCodeRequestV3' test.out

#- 221 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'AZzDH2BU' \
    --clientId 'v5HGixmG' \
    --createHeadless  \
    --deviceId 'u8bq5sqi' \
    --macAddress 'T4ubpdCg' \
    --platformToken '5vTAerxU' \
    > test.out 2>&1
eval_tap $? 221 'PlatformTokenGrantV3' test.out

#- 222 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 222 'GetRevocationListV3' test.out

#- 223 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token '7YZxC7Mo' \
    > test.out 2>&1
eval_tap $? 223 'TokenRevocationV3' test.out

#- 224 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId '8GOIB0u5' \
    --code '1cnLB3RH' \
    --codeVerifier 'oFWAMaaq' \
    --extendExp  \
    --password 'XzinWnyg' \
    --redirectUri 'FWXlh1B2' \
    --refreshToken 'HJ2vutt7' \
    --username 'pp8R9aev' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 224 'TokenGrantV3' test.out

#- 225 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token '3m20PgoZ' \
    > test.out 2>&1
eval_tap $? 225 'VerifyTokenV3' test.out

#- 226 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'X9IXjK72' \
    --code 'vN1SYokv' \
    --error 'J8cQR3F7' \
    --openidAssocHandle 'hfgMW44I' \
    --openidClaimedId 'vrWabhIb' \
    --openidIdentity '4E1YElt3' \
    --openidMode '9VaJS4Di' \
    --openidNs 'jl4efQhM' \
    --openidOpEndpoint 'JrevMzao' \
    --openidResponseNonce '90Y2ihND' \
    --openidReturnTo 'ab9y8iWM' \
    --openidSig 'DV2Rmtr9' \
    --openidSigned 'Z2XBHnkV' \
    --state 'oDNcFYoj' \
    > test.out 2>&1
eval_tap $? 226 'PlatformAuthenticationV3' test.out

#- 227 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode '0H3EMWa7' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetInputValidations' test.out

#- 228 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 't5MVKGqu' \
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
    --clientId 'Z6GyIveB' \
    > test.out 2>&1
eval_tap $? 230 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 231 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'O9guwyom' \
    --body '{"platformUserIds": ["Wz60jVkK", "0Yb7drJS", "c8H6wpjR"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 232 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MJcYHTOg' \
    --platformUserId 'j7ueJV1m' \
    > test.out 2>&1
eval_tap $? 232 'PublicGetUserByPlatformUserIDV3' test.out

#- 233 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId '1bb1Ncp5' \
    > test.out 2>&1
eval_tap $? 233 'PublicGetAsyncStatus' test.out

#- 234 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'hPDn8MpG' \
    --limit '41' \
    --offset '89' \
    --query 'HuTHzIfo' \
    > test.out 2>&1
eval_tap $? 234 'PublicSearchUserV3' test.out

#- 235 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "5oPKaRt6", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "KdWMKvtp", "policyId": "DB6fwShQ", "policyVersionId": "8zTgQcK4"}, {"isAccepted": false, "localizedPolicyVersionId": "kfxM5nak", "policyId": "JDM9B0Lm", "policyVersionId": "ORUkEUun"}, {"isAccepted": false, "localizedPolicyVersionId": "RWCmj4hN", "policyId": "qkLzHQs9", "policyVersionId": "qoagi3iy"}], "authType": "69N9Nt8b", "code": "sVH27D7V", "country": "5eNhJBib", "dateOfBirth": "fSjeOOhM", "displayName": "CVOhVUqC", "emailAddress": "995J7vsf", "password": "R2PmjygD", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 235 'PublicCreateUserV3' test.out

#- 236 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'QuzRfxae' \
    --query 'PgnEmMuQ' \
    > test.out 2>&1
eval_tap $? 236 'CheckUserAvailability' test.out

#- 237 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["BnbUgJLH", "TZfDVnQ3", "ACzPJMcg"]}' \
    > test.out 2>&1
eval_tap $? 237 'PublicBulkGetUsers' test.out

#- 238 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "GmY1YfUN", "languageTag": "KYnu7laj"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicSendRegistrationCode' test.out

#- 239 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Ph58uelI", "emailAddress": "ZfNWC9Jf"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicVerifyRegistrationCode' test.out

#- 240 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "5LVz9Ic3", "languageTag": "fTQwgKuL"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicForgotPasswordV3' test.out

#- 241 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'XOMCgvN8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'GetAdminInvitationV3' test.out

#- 242 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'PQH21eny' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "xDiloBRS", "policyId": "qjdzg1hM", "policyVersionId": "JPLI9kHq"}, {"isAccepted": false, "localizedPolicyVersionId": "3Pjz4Xgy", "policyId": "thqXxoST", "policyVersionId": "lvdfIWJO"}, {"isAccepted": true, "localizedPolicyVersionId": "0kd3YbM7", "policyId": "pnLsdNye", "policyVersionId": "XOn77Y9p"}], "authType": "EMAILPASSWD", "country": "ou5rPfum", "dateOfBirth": "G94n96NF", "displayName": "x548qCti", "password": "qeXMFbGJ", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 242 'CreateUserFromInvitationV3' test.out

#- 243 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "SB6d2878", "country": "ivIMPFaE", "dateOfBirth": "CTjJvFuZ", "displayName": "BrX13sJm", "languageTag": "zQUywtqP", "userName": "lOrrLjg6"}' \
    > test.out 2>&1
eval_tap $? 243 'UpdateUserV3' test.out

#- 244 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "h6PwfGfE", "country": "TCDBlNRF", "dateOfBirth": "jzCHHu6D", "displayName": "bD8JTgds", "languageTag": "vBTlLd9C", "userName": "nKZWPem0"}' \
    > test.out 2>&1
eval_tap $? 244 'PublicPartialUpdateUserV3' test.out

#- 245 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "cMzgO3qO", "emailAddress": "PnGZVHSR", "languageTag": "xb7DkCww"}' \
    > test.out 2>&1
eval_tap $? 245 'PublicSendVerificationCodeV3' test.out

#- 246 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "w2kZOpe5", "contactType": "yv4grG22", "languageTag": "3bDoz4y4", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 246 'PublicUserVerificationV3' test.out

#- 247 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "SKlec863", "country": "BxxAAnO4", "dateOfBirth": "Z689pkYe", "displayName": "3u3n8498", "emailAddress": "CpfejPgA", "password": "P6ppSNyg", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 247 'PublicUpgradeHeadlessAccountV3' test.out

#- 248 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "vDALZxl7", "password": "MpB01g9n"}' \
    > test.out 2>&1
eval_tap $? 248 'PublicVerifyHeadlessAccountV3' test.out

#- 249 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "5jXtdjdW", "newPassword": "xUCyDAMy", "oldPassword": "47WBCeRy"}' \
    > test.out 2>&1
eval_tap $? 249 'PublicUpdatePasswordV3' test.out

#- 250 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'HFKnbzdD' \
    > test.out 2>&1
eval_tap $? 250 'PublicCreateJusticeUser' test.out

#- 251 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Rhd3UgK9' \
    --redirectUri 'S7NG8aUQ' \
    --ticket '3usGMHqk' \
    > test.out 2>&1
eval_tap $? 251 'PublicPlatformLinkV3' test.out

#- 252 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '48GEUN3H' \
    --body '{"platformNamespace": "WqkG93Yo"}' \
    > test.out 2>&1
eval_tap $? 252 'PublicPlatformUnlinkV3' test.out

#- 253 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tUekZKeB' \
    > test.out 2>&1
eval_tap $? 253 'PublicPlatformUnlinkAllV3' test.out

#- 254 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dtNb6JSC' \
    --ticket 'VSFZpeyE' \
    > test.out 2>&1
eval_tap $? 254 'PublicForcePlatformLinkV3' test.out

#- 255 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'i5n882BK' \
    --clientId 'T5Tc3UND' \
    --redirectUri 'U0otHj77' \
    > test.out 2>&1
eval_tap $? 255 'PublicWebLinkPlatform' test.out

#- 256 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jLpFWlRj' \
    --state '1KbhGWZL' \
    > test.out 2>&1
eval_tap $? 256 'PublicWebLinkPlatformEstablish' test.out

#- 257 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "8iJPDNQW", "emailAddress": "2bOrdd1y", "newPassword": "TsRzN6a4"}' \
    > test.out 2>&1
eval_tap $? 257 'ResetPasswordV3' test.out

#- 258 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9zwVvMWy' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetUserByUserIdV3' test.out

#- 259 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'geUqs1uI' \
    --activeOnly  \
    --after 'euLkyQli' \
    --before 'QVekKefF' \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 259 'PublicGetUserBanHistoryV3' test.out

#- 260 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hYUEyO70' \
    > test.out 2>&1
eval_tap $? 260 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 261 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'H0fwudLa' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetUserInformationV3' test.out

#- 262 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CX07Jw9o' \
    --after '0.6286900533470764' \
    --before '0.7949597354877517' \
    --limit '2' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetUserLoginHistoriesV3' test.out

#- 263 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kcmhi7wo' \
    --after 'SqHTy7B9' \
    --before 'kCbk62T5' \
    --limit '45' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetUserPlatformAccountsV3' test.out

#- 264 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0Wl1a6n3' \
    > test.out 2>&1
eval_tap $? 264 'PublicListJusticePlatformAccountsV3' test.out

#- 265 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'ljoAtV23' \
    --body '{"platformId": "uOBZj72v", "platformUserId": "gWr9eEnD"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicLinkPlatformAccount' test.out

#- 266 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'tmWRhAlv' \
    --body '{"chosenNamespaces": ["qUacONaX", "E5o8lQzZ", "uuOhtAtE"], "requestId": "nTjh3nHS"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicForceLinkPlatformWithProgression' test.out

#- 267 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GDahdZ93' \
    > test.out 2>&1
eval_tap $? 267 'PublicGetPublisherUserV3' test.out

#- 268 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wm2ml2zN' \
    --password 'G9bnlVNa' \
    > test.out 2>&1
eval_tap $? 268 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 269 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'j4oZnY94' \
    --before 'UjgwN7MA' \
    --isWildcard  \
    --limit '94' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetRolesV3' test.out

#- 270 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId '6hLVdfSk' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetRoleV3' test.out

#- 271 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 271 'PublicGetMyUserV3' test.out

#- 272 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'SRPojlXu' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 273 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["aIT4yNwY", "FCRqP6wv", "zKdTAFNe"], "oneTimeLinkCode": "BQxjepLO"}' \
    > test.out 2>&1
eval_tap $? 273 'LinkHeadlessAccountToMyAccountV3' test.out

#- 274 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "7qcIdWw2"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicSendVerificationLinkV3' test.out

#- 275 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code '8ijnW24R' \
    > test.out 2>&1
eval_tap $? 275 'PublicVerifyUserByLinkV3' test.out

#- 276 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId '98kIsXsw' \
    --code 'GuhiLUWj' \
    --error 'Z7L6wdbq' \
    --state 'WP4ddu2R' \
    > test.out 2>&1
eval_tap $? 276 'PlatformAuthenticateSAMLV3Handler' test.out

#- 277 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'i0hOymkG' \
    --payload 'YNxqGheR' \
    > test.out 2>&1
eval_tap $? 277 'LoginSSOClient' test.out

#- 278 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'gtG530Wh' \
    > test.out 2>&1
eval_tap $? 278 'LogoutSSOClient' test.out

#- 279 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'm5f3JT52' \
    > test.out 2>&1
eval_tap $? 279 'RequestGameTokenResponseV3' test.out

#- 280 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'S9pFap28' \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDevicesByUserV4' test.out

#- 281 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'YirRH9Hc' \
    --endDate 'jSHOBS74' \
    --limit '81' \
    --offset '65' \
    --startDate 'RZBCQkbY' \
    > test.out 2>&1
eval_tap $? 281 'AdminGetBannedDevicesV4' test.out

#- 282 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tja3IQAs' \
    > test.out 2>&1
eval_tap $? 282 'AdminGetUserDeviceBansV4' test.out

#- 283 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "KRKd97Yf", "deviceId": "VaIHRi8O", "deviceType": "X2Vs3SDs", "enabled": true, "endDate": "IkfZ3ivz", "ext": {"088fCiyN": {}, "jK4ZCeI7": {}, "K42T1sGD": {}}, "reason": "BEB8YCbO"}' \
    > test.out 2>&1
eval_tap $? 283 'AdminBanDeviceV4' test.out

#- 284 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId '4RO44v3m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'AdminGetDeviceBanV4' test.out

#- 285 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId '5fYibphv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 285 'AdminUpdateDeviceBanV4' test.out

#- 286 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'wRXV3F6k' \
    --startDate 'lMqkNrlE' \
    --deviceType 'Vw14hIMM' \
    > test.out 2>&1
eval_tap $? 286 'AdminGenerateReportV4' test.out

#- 287 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 287 'AdminGetDeviceTypesV4' test.out

#- 288 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'sINvRYAX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 288 'AdminGetDeviceBansV4' test.out

#- 289 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'xOlJesCU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 289 'AdminDecryptDeviceV4' test.out

#- 290 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'uPUqhz0n' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'AdminUnbanDeviceV4' test.out

#- 291 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'rBgKsckA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'AdminGetUsersByDeviceV4' test.out

#- 292 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 20}' \
    > test.out 2>&1
eval_tap $? 292 'AdminCreateTestUsersV4' test.out

#- 293 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["WiRy5upG", "vxdYicPM", "ZRkNpO0L"]}' \
    > test.out 2>&1
eval_tap $? 293 'AdminBulkCheckValidUserIDV4' test.out

#- 294 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kOSpDQki' \
    --body '{"avatarUrl": "FRkcP3EW", "country": "VcUYXPTm", "dateOfBirth": "ZS2zInj9", "displayName": "BQexCUU1", "languageTag": "asBXESOz", "userName": "mKhjQprb"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminUpdateUserV4' test.out

#- 295 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'r9tr9KbT' \
    --body '{"code": "dssVP2gJ", "emailAddress": "4q0JOOZ8"}' \
    > test.out 2>&1
eval_tap $? 295 'AdminUpdateUserEmailAddressV4' test.out

#- 296 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SrxSreMf' \
    > test.out 2>&1
eval_tap $? 296 'AdminDisableUserMFAV4' test.out

#- 297 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mz61rZWY' \
    > test.out 2>&1
eval_tap $? 297 'AdminListUserRolesV4' test.out

#- 298 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'N7R0q2oo' \
    --body '{"assignedNamespaces": ["98iZorHW", "4kZ105Ux", "x8JfNRZY"], "roleId": "EpXmJ9iR"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateUserRoleV4' test.out

#- 299 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dlTEuoqh' \
    --body '{"assignedNamespaces": ["IzqxAiIT", "1oY31as0", "SudLAFgB"], "roleId": "a0DZFJJZ"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminAddUserRoleV4' test.out

#- 300 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '0NXVbEK3' \
    --body '{"assignedNamespaces": ["Cg4cLtGH", "SNoIZY0e", "oPFunk7h"], "roleId": "3koGlfko"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminRemoveUserRoleV4' test.out

#- 301 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '31' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 301 'AdminGetRolesV4' test.out

#- 302 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "yzMvSMv2"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminCreateRoleV4' test.out

#- 303 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'cSbMqgAA' \
    > test.out 2>&1
eval_tap $? 303 'AdminGetRoleV4' test.out

#- 304 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'biD68pWG' \
    > test.out 2>&1
eval_tap $? 304 'AdminDeleteRoleV4' test.out

#- 305 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId '44GQ47NW' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "9YccRU89"}' \
    > test.out 2>&1
eval_tap $? 305 'AdminUpdateRoleV4' test.out

#- 306 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'RyvvKDEX' \
    --body '{"permissions": [{"action": 62, "resource": "eksKCd7B", "schedAction": 20, "schedCron": "9wPmFGhB", "schedRange": ["dADu2Ib0", "9QE5iTrm", "a6KxfIjs"]}, {"action": 68, "resource": "kxxWQlmY", "schedAction": 51, "schedCron": "XgbbAqSd", "schedRange": ["1yGRTA70", "ZgQiBjvX", "ouOgSZyg"]}, {"action": 91, "resource": "Vhta7zpg", "schedAction": 75, "schedCron": "o1YPu3ID", "schedRange": ["O51hR44z", "KX1f5DSj", "TrgeOf9c"]}]}' \
    > test.out 2>&1
eval_tap $? 306 'AdminUpdateRolePermissionsV4' test.out

#- 307 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'dtQZnOSB' \
    --body '{"permissions": [{"action": 96, "resource": "gTcy70a6", "schedAction": 39, "schedCron": "uSDRwHak", "schedRange": ["1O878UkC", "6fa0hkHA", "NkpG25Vk"]}, {"action": 32, "resource": "33alLnjP", "schedAction": 32, "schedCron": "Jb570SH0", "schedRange": ["EeNWLrxo", "cqskfq0Q", "epErjTV9"]}, {"action": 37, "resource": "Jca71QvR", "schedAction": 52, "schedCron": "2fsYl7G6", "schedRange": ["w2CVSCrB", "0rNqzNOq", "WnOVJTB3"]}]}' \
    > test.out 2>&1
eval_tap $? 307 'AdminAddRolePermissionsV4' test.out

#- 308 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'OVgxvP4x' \
    --body '["hOiqTywc", "y6URt2e9", "XrmP7z5D"]' \
    > test.out 2>&1
eval_tap $? 308 'AdminDeleteRolePermissionsV4' test.out

#- 309 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'FEghTjwA' \
    --after 'te2k915r' \
    --before 'sdFaPFsI' \
    --limit '15' \
    > test.out 2>&1
eval_tap $? 309 'AdminListAssignedUsersV4' test.out

#- 310 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'vBmq4kQd' \
    --body '{"assignedNamespaces": ["eBCwVZU2", "i5XMtSEy", "GrbSSvs8"], "namespace": "oGj4AFoO", "userId": "nOz0qPUW"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminAssignUserToRoleV4' test.out

#- 311 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId '9WfiqLXR' \
    --body '{"namespace": "16TIozS0", "userId": "M9UXGUGf"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminRevokeUserFromRoleV4' test.out

#- 312 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "rE1p1ngJ", "country": "jgA9suhK", "dateOfBirth": "dPpbXmPH", "displayName": "m2M3XQzg", "languageTag": "BAAcsTd6", "userName": "I7iX0drE"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateMyUserV4' test.out

#- 313 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 313 'AdminDisableMyAuthenticatorV4' test.out

#- 314 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'qMFCxP8d' \
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
    --code 'v4tgzFzz' \
    > test.out 2>&1
eval_tap $? 323 'AdminEnableMyEmailV4' test.out

#- 324 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 324 'AdminGetMyEnabledFactorsV4' test.out

#- 325 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'Xscbg3bp' \
    > test.out 2>&1
eval_tap $? 325 'AdminMakeFactorMyDefaultV4' test.out

#- 326 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["b6Qmoq5e", "vxYs0JxZ", "E3qHiU72"], "emailAddresses": ["Fnfh7lt9", "tU0tksHM", "Je5ey3mV"], "isAdmin": false, "roleId": "WDdlYlM8"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminInviteUserV4' test.out

#- 327 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "F4KNz09D", "policyId": "w07yhC57", "policyVersionId": "QJ9jBe7x"}, {"isAccepted": true, "localizedPolicyVersionId": "txpQCyrp", "policyId": "mr28Rsyv", "policyVersionId": "iSeFhMbh"}, {"isAccepted": true, "localizedPolicyVersionId": "BkuNxAc2", "policyId": "edLnUQLs", "policyVersionId": "0IeczUwR"}], "authType": "EMAILPASSWD", "country": "gzABDFgl", "dateOfBirth": "sszPHpdj", "displayName": "yYXOciBH", "emailAddress": "bGkxkapw", "password": "wwe73NwU", "passwordMD5Sum": "MBeZIYMP", "username": "EtbfDGyN", "verified": false}' \
    > test.out 2>&1
eval_tap $? 327 'PublicCreateTestUserV4' test.out

#- 328 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "Rp6lLxjo", "policyId": "4RUSI9cu", "policyVersionId": "r3cciT4v"}, {"isAccepted": true, "localizedPolicyVersionId": "iVicGuoN", "policyId": "ODxBJdf1", "policyVersionId": "RwGjM4jG"}, {"isAccepted": false, "localizedPolicyVersionId": "S6gYxvBZ", "policyId": "lRgPXVwR", "policyVersionId": "1GnbABbq"}], "authType": "EMAILPASSWD", "code": "0WuOlZ5m", "country": "dEZtHo1E", "dateOfBirth": "nBWJqUpO", "displayName": "LFTJ6bO2", "emailAddress": "HXRHsini", "password": "SicwLbyA", "passwordMD5Sum": "KdeIH2Xu", "reachMinimumAge": false, "username": "gWkGIuws"}' \
    > test.out 2>&1
eval_tap $? 328 'PublicCreateUserV4' test.out

#- 329 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'vaE3hw2o' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "StIOOfuJ", "policyId": "Vk7UVgtR", "policyVersionId": "WmvepSMJ"}, {"isAccepted": true, "localizedPolicyVersionId": "HtCCu7Dn", "policyId": "Cz83PEJI", "policyVersionId": "V26NwgRB"}, {"isAccepted": false, "localizedPolicyVersionId": "KMIbKoGV", "policyId": "5DQC0sPJ", "policyVersionId": "hzVBv39h"}], "authType": "EMAILPASSWD", "country": "x4A95j33", "dateOfBirth": "e2OrIyFO", "displayName": "jbHiAiBD", "password": "sCxZWeE7", "reachMinimumAge": false, "username": "Mcc1i7uW"}' \
    > test.out 2>&1
eval_tap $? 329 'CreateUserFromInvitationV4' test.out

#- 330 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "PNtIHJut", "country": "gC6WT3ZE", "dateOfBirth": "o72vLBVP", "displayName": "ZXkJao3g", "languageTag": "86jNDvG2", "userName": "MYHdHkl3"}' \
    > test.out 2>&1
eval_tap $? 330 'PublicUpdateUserV4' test.out

#- 331 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "bq6ZoFRh", "emailAddress": "zVVtiiiD"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicUpdateUserEmailAddressV4' test.out

#- 332 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "j82Ip1Qj", "country": "rBCYslRM", "dateOfBirth": "KuEXjRRY", "displayName": "hWESGiOa", "emailAddress": "rqwWBMiR", "password": "oNNvVODO", "reachMinimumAge": false, "username": "mkJ0oeqS", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 332 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 333 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "obi57PmH", "password": "NhG26TJ7", "username": "EBsHXmzz"}' \
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
    --code 'wWegOoGW' \
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
    --deviceToken 'i7NYZeJt' \
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
    --code 'kYcMy8hn' \
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
    --factor '4df7sIvE' \
    > test.out 2>&1
eval_tap $? 347 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE