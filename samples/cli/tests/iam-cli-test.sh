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
    --body '[{"field": "B2Zd98c0", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "blockedWord": ["u10lC2T1", "5GuvmIQA", "lQoRs4jQ"], "description": [{"language": "wApEqe39", "message": ["u5gyK4MQ", "fMZ5RNxH", "ei6Vmulk"]}, {"language": "Z8WlWV05", "message": ["UGXJXrOK", "WveHGhlY", "B9uxf3Pu"]}, {"language": "OL064MNZ", "message": ["1mlADc6T", "sUswbIpx", "Npxloaul"]}], "isCustomRegex": false, "letterCase": "ntGGxPLR", "maxLength": 44, "maxRepeatingAlphaNum": 20, "maxRepeatingSpecialCharacter": 72, "minCharType": 85, "minLength": 43, "regex": "Hj1dQA5B", "specialCharacterLocation": "7KnDel6H", "specialCharacters": ["Ej7naORw", "1wFFLKM9", "M7Nxy671"]}}, {"field": "ucAJiuHZ", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "blockedWord": ["dspeCbvs", "GuOMIkXm", "syx5yVsH"], "description": [{"language": "BRNT1dTb", "message": ["lUOm3wXK", "kCkIZVbZ", "k2SZcLH0"]}, {"language": "8EfzinHK", "message": ["Nt2juKc0", "iniRa3fR", "EJyOlOwK"]}, {"language": "feSuWDrZ", "message": ["t2jQGNUP", "twy8cSXQ", "IJcIpfpG"]}], "isCustomRegex": false, "letterCase": "2QOw8SNU", "maxLength": 98, "maxRepeatingAlphaNum": 93, "maxRepeatingSpecialCharacter": 44, "minCharType": 0, "minLength": 6, "regex": "D7AnvwtJ", "specialCharacterLocation": "PKWYGRUV", "specialCharacters": ["xzd4MDCH", "YtdLM5s9", "WkGpHSWE"]}}, {"field": "4ThZAT9D", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "blockedWord": ["r3v8ABnM", "tg58x8jE", "l6I05Bpb"], "description": [{"language": "HmNLNx4j", "message": ["CUSDc4iG", "JGmJfErj", "IUpIiTHJ"]}, {"language": "ObSMNsJj", "message": ["FNyAws8x", "FJuJ0LWI", "efulpwyM"]}, {"language": "KC5ab7E4", "message": ["xypjA1hp", "2jke09CU", "z24ZzE7Z"]}], "isCustomRegex": false, "letterCase": "dwoW1l7Z", "maxLength": 76, "maxRepeatingAlphaNum": 7, "maxRepeatingSpecialCharacter": 90, "minCharType": 58, "minLength": 99, "regex": "2vEHgCxx", "specialCharacterLocation": "2q2d3754", "specialCharacters": ["VfdLvqhA", "Cgz0WCgH", "sh5B5sGv"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'c9wpB9d5' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'BKDox1gZ' \
    --before '5eEcwXTY' \
    --limit '50' \
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
    --body '{"ageRestriction": 84, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode '2oGZySeZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 22}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 't491tLUJ' \
    --limit '45' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "nZecJvQh", "comment": "pNT4LOni", "endDate": "mY2IXpBV", "reason": "SRwe68rQ", "skipNotif": true, "userIds": ["BO0Bs4aT", "aU8fbahr", "EggmIj64"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "S60O0KM8", "userId": "0UdXlB58"}, {"banId": "rs87o019", "userId": "v9aexta7"}, {"banId": "X61GwV46", "userId": "YowqDLJr"}]}' \
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
    --clientId 'DGW6k7wi' \
    --clientName 'FPbin5ed' \
    --clientType 'OB1taDGK' \
    --limit '7' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["qbRAFK1Z", "ZNjQfuRj", "K2cC9cI5"], "baseUri": "pBuwMViw", "clientId": "1TLqCU8n", "clientName": "nc3XZ0y7", "clientPermissions": [{"action": 14, "resource": "id5WyHwt", "schedAction": 96, "schedCron": "GSFEY5mn", "schedRange": ["NGzwojNW", "9n9oQ7j7", "wWHoFLHr"]}, {"action": 11, "resource": "WzKQVCrT", "schedAction": 97, "schedCron": "PPtqyTO0", "schedRange": ["76Z5xOIE", "6r9VZFLW", "K4WUG0B4"]}, {"action": 66, "resource": "j3X5AZaw", "schedAction": 75, "schedCron": "kFL98DzM", "schedRange": ["GZmnaDsn", "AzY5bclK", "2oS3U1OG"]}], "clientPlatform": "U57A95Je", "deletable": true, "description": "sD9QzeyK", "namespace": "4cJ3HaT2", "oauthAccessTokenExpiration": 59, "oauthAccessTokenExpirationTimeUnit": "6seCchFQ", "oauthClientType": "WajSvpfn", "oauthRefreshTokenExpiration": 62, "oauthRefreshTokenExpirationTimeUnit": "sExDKBNn", "parentNamespace": "nseo5w75", "redirectUri": "9ZqBJRWa", "scopes": ["7gGYpRQ5", "M51YfGaE", "0ab3F8o4"], "secret": "6IaZCvzM", "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId '0WFzIaHG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId '0MoRu9og' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'EoaKLI2l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["7x3h1BF2", "K5vHwwrN", "GMvvFLGK"], "baseUri": "xtqymY99", "clientName": "mPkAuFr9", "clientPermissions": [{"action": 0, "resource": "o1UKxd4C", "schedAction": 36, "schedCron": "nKUPKogn", "schedRange": ["xMGBFp6v", "i9rXhayh", "MwUy9hzG"]}, {"action": 30, "resource": "qKzKor18", "schedAction": 94, "schedCron": "r3h56OTJ", "schedRange": ["kx8zvQUi", "sVtZQrpM", "MudZO48e"]}, {"action": 52, "resource": "rVviCGFL", "schedAction": 92, "schedCron": "kzHz1BYd", "schedRange": ["g5Vr997o", "gHHZOBha", "xQ20Ez4r"]}], "clientPlatform": "pLigOBRA", "deletable": false, "description": "ZDhZrcjU", "namespace": "kVpuzX78", "oauthAccessTokenExpiration": 54, "oauthAccessTokenExpirationTimeUnit": "3JAnfq5j", "oauthRefreshTokenExpiration": 82, "oauthRefreshTokenExpirationTimeUnit": "4CUov1vi", "redirectUri": "oqT3Rkp5", "scopes": ["EWas83tb", "15GOdlxf", "R9oWLR6o"], "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'ez7bmNzx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 44, "resource": "lvcBDHTm"}, {"action": 0, "resource": "jj1GYb1W"}, {"action": 30, "resource": "gCTKOr8B"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'MticiSIF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 45, "resource": "364lGUud"}, {"action": 26, "resource": "RNRtSyUP"}, {"action": 28, "resource": "Vr1GzAHE"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '5' \
    --clientId '0mk1dfom' \
    --namespace "$AB_NAMESPACE" \
    --resource '7s8Zf9nW' \
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
    --limit '31' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CE69EH5r' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0iXlIEDb' \
    --body '{"ACSURL": "6ouaDZ3e", "AWSCognitoRegion": "A2wxTbnV", "AWSCognitoUserPool": "BhYMBIi3", "AllowedClients": ["QPc9sjYi", "4bLb26SZ", "dpvaHwja"], "AppId": "2P10tFpe", "AuthorizationEndpoint": "KYOaoWzQ", "ClientId": "Y14BucQT", "Environment": "eSxxn1FL", "FederationMetadataURL": "RqcIDjuQ", "GenericOauthFlow": false, "IsActive": false, "Issuer": "VxFAQUmk", "JWKSEndpoint": "3PYHDCxp", "KeyID": "yNJr2q4B", "NetflixCertificates": {"encryptedPrivateKey": "1hKYxTvS", "encryptedPrivateKeyName": "YeknCVzb", "publicCertificate": "70iUHOR4", "publicCertificateName": "QeSBCmnl", "rootCertificate": "DwyIdBDZ", "rootCertificateName": "seEzOYGE"}, "OrganizationId": "JjJ2Rxez", "PlatformName": "bDtsVZnL", "RedirectUri": "aCmWt0Xe", "RegisteredDomains": [{"affectedClientIDs": ["0dK9r4Z4", "riiVCFIP", "ZO5IkvxV"], "domain": "1azzYnFt", "namespaces": ["Clg4F30w", "cv4Scy2H", "2ywFgHEH"], "roleId": "mcb07eR8"}, {"affectedClientIDs": ["kmB4c3Mw", "hwAZKGz3", "hrz8POvE"], "domain": "x4iLz8Ps", "namespaces": ["iMVC8SHY", "QJMsslOv", "dyneAHFD"], "roleId": "r2WWsNxV"}, {"affectedClientIDs": ["NODhUypr", "LhjvSl7H", "DOGYjDP6"], "domain": "ZLgblphj", "namespaces": ["toDEHEkt", "tdMm5TZ5", "CluUF7hl"], "roleId": "flGJpnyv"}], "Secret": "SE5QRCOJ", "TeamID": "U6diUFcp", "TokenAuthenticationType": "Gi3QhPCu", "TokenClaimsMapping": {"REOPsTQr": "TyWYFm0V", "qRaph4kr": "4GNUVekJ", "Nc3ajJgI": "gw8JeDCr"}, "TokenEndpoint": "4yJGXLzn", "scopes": ["BG8bhbjq", "UCZEEWUe", "jveoqcZW"]}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yPyv6VlD' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yqlZOapL' \
    --body '{"ACSURL": "XG393Js3", "AWSCognitoRegion": "GHi5VZlD", "AWSCognitoUserPool": "YMCSC2QJ", "AllowedClients": ["ObVutZEA", "8FF44jJb", "UkfpHE63"], "AppId": "FcUBfbNS", "AuthorizationEndpoint": "jJZJ9BA6", "ClientId": "uDRpfBbC", "Environment": "xVTrCI0t", "FederationMetadataURL": "ZEr8Bzoa", "GenericOauthFlow": false, "IsActive": true, "Issuer": "jDN9O2G7", "JWKSEndpoint": "PFUiEsYw", "KeyID": "5HrjQxZt", "NetflixCertificates": {"encryptedPrivateKey": "WBZbGMP8", "encryptedPrivateKeyName": "kv2kZQLj", "publicCertificate": "iUUVROBx", "publicCertificateName": "vb7zTmDv", "rootCertificate": "vtUs7u14", "rootCertificateName": "07Yh9vNk"}, "OrganizationId": "5PmJCVkc", "PlatformName": "b5K7ZkAC", "RedirectUri": "TJGR8c0V", "RegisteredDomains": [{"affectedClientIDs": ["LfW3xwjY", "iJpHF8XQ", "b7J7RlZX"], "domain": "pZZoXnwz", "namespaces": ["bM91OQ5i", "8wtFmi3S", "b9AyF6em"], "roleId": "d7OSFI8Z"}, {"affectedClientIDs": ["fFU86nO3", "WCt9DV1I", "Q0Ip1JtA"], "domain": "meFuxd9N", "namespaces": ["KubCVEir", "QpnkZDwy", "cNKZUUdS"], "roleId": "t1ZALQwD"}, {"affectedClientIDs": ["w9z6kerI", "OyUeGgOQ", "6RXBAGTA"], "domain": "Lxd09RvG", "namespaces": ["vKaPpbDq", "VFfO9lmb", "s14IF5ye"], "roleId": "RlxeepkN"}], "Secret": "3WkN3RSP", "TeamID": "IhgfzluE", "TokenAuthenticationType": "y61HTG8d", "TokenClaimsMapping": {"tnN4lbMs": "X2Gb487j", "zb59AA7H": "u7NnWgE3", "MFBT7B43": "HocNVBgO"}, "TokenEndpoint": "KB5rCc0I", "scopes": ["W28JJen2", "eRRYFT2T", "WSJu1S7z"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'roddH8GQ' \
    --body '{"affectedClientIDs": ["LaS9TxnK", "KFIOwQqx", "n2IJHyhm"], "assignedNamespaces": ["TCDEcE6Z", "bCNbCAlv", "uJKNnTix"], "domain": "ASzRL14j", "roleId": "VoZCqPil"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XBlm9u32' \
    --body '{"domain": "cTmKGPLa"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'EvItCK8s' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '9UbDi248' \
    --body '{"acsUrl": "F1HN4Dvn", "apiKey": "7tCgB3qh", "appId": "FNg4AeJS", "federationMetadataUrl": "NJKqXWfg", "isActive": false, "redirectUri": "ENtyRkis", "secret": "YUbvdrnk", "ssoUrl": "U9b7iHvl"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xL2ZxjIv' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '3kIV5oLq' \
    --body '{"acsUrl": "CLmc4asd", "apiKey": "5gTXxRzs", "appId": "voAtXmHG", "federationMetadataUrl": "zUNAofQz", "isActive": true, "redirectUri": "9zi2y3G7", "secret": "4VvXdg8f", "ssoUrl": "uvyBycdZ"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'NY2Zaj1F' \
    --platformUserId 'lhyApqQG' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'PiwvIekf' \
    --after '68' \
    --before '0' \
    --limit '21' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'shUun7mW' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["gSLJ60Wp", "lTf50Zoi", "nGpiD5jv"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["KWy7RC4v", "0sfvAWR9", "kZz5xaXV"], "isAdmin": true, "namespace": "oGY3VPsw", "roles": ["kYocOdjG", "PmNAg7zz", "uZv4rzvJ"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '10' \
    --platformUserId 'pUVDtsUd' \
    --platformId 'DrPqmuVt' \
    > test.out 2>&1
eval_tap $? 146 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 147 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 147 'AdminListUsersV3' test.out

#- 148 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'pma6CiC1' \
    --endDate 'Dya2Bqn6' \
    --limit '42' \
    --offset '56' \
    --platformBy '09fZOZ10' \
    --platformId 'Dolnxh7g' \
    --query 'NBBAF7Hf' \
    --startDate 'ZyREIXdj' \
    > test.out 2>&1
eval_tap $? 148 'AdminSearchUserV3' test.out

#- 149 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["oW5X8rGk", "sXR1bRFb", "w9EgQuhW"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetBulkUserByEmailAddressV3' test.out

#- 150 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vN4DlW9p' \
    > test.out 2>&1
eval_tap $? 150 'AdminGetUserByUserIdV3' test.out

#- 151 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2fhUL8SZ' \
    --body '{"avatarUrl": "f7j7JMWK", "country": "xeHm4SSu", "dateOfBirth": "WYXjohMM", "displayName": "CBvw8NM3", "languageTag": "8zEZIGgf", "userName": "5MGQEpif"}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserV3' test.out

#- 152 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ixpACN6w' \
    --activeOnly  \
    --after 'UDIAV0LQ' \
    --before '8cYpyhFa' \
    --limit '64' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetUserBanV3' test.out

#- 153 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CHhcCS64' \
    --body '{"ban": "wj65irIo", "comment": "Q5oUAi0D", "endDate": "A4TDpl2d", "reason": "TRxpb01g", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 153 'AdminBanUserV3' test.out

#- 154 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'wPnqaLRm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cMyQxBOE' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 154 'AdminUpdateUserBanV3' test.out

#- 155 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5RLeH9Yg' \
    --body '{"context": "zQFufcSZ", "emailAddress": "VeDiSAqV", "languageTag": "UvbGvQ2r"}' \
    > test.out 2>&1
eval_tap $? 155 'AdminSendVerificationCodeV3' test.out

#- 156 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kNXejiUG' \
    --body '{"Code": "5mNuhnsJ", "ContactType": "MLFC6Z35", "LanguageTag": "YxGfNRfA", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 156 'AdminVerifyAccountV3' test.out

#- 157 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'KJL5hUXf' \
    > test.out 2>&1
eval_tap $? 157 'GetUserVerificationCode' test.out

#- 158 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gyksdNFx' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserDeletionStatusV3' test.out

#- 159 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bRUbjn0J' \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpdateUserDeletionStatusV3' test.out

#- 160 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MWG2FPUs' \
    --body '{"code": "FTOz6DFM", "country": "xejVTILp", "dateOfBirth": "WJyudpp9", "displayName": "ZEUj7Z4n", "emailAddress": "XjnONI6F", "password": "UZFisYos", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpgradeHeadlessAccountV3' test.out

#- 161 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'w9YcM5yB' \
    > test.out 2>&1
eval_tap $? 161 'AdminDeleteUserInformationV3' test.out

#- 162 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q04UXZOt' \
    --after '0.4905516784747971' \
    --before '0.13770108827508432' \
    --limit '85' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetUserLoginHistoriesV3' test.out

#- 163 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VScurLV9' \
    --body '{"languageTag": "dvFCcP9V", "newPassword": "qsqLmV5o", "oldPassword": "Nj3Re9zR"}' \
    > test.out 2>&1
eval_tap $? 163 'AdminResetPasswordV3' test.out

#- 164 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 't3dByfOC' \
    --body '{"Permissions": [{"Action": 13, "Resource": "NwA6s1l1", "SchedAction": 76, "SchedCron": "W7Z13AYK", "SchedRange": ["H2Tydqnq", "nk9e76FZ", "a30tC57M"]}, {"Action": 83, "Resource": "CJFwLKqR", "SchedAction": 82, "SchedCron": "0ucmYytc", "SchedRange": ["6iHcFzUK", "M4LOQBtx", "nEDtbzzm"]}, {"Action": 30, "Resource": "CFJOTs0D", "SchedAction": 45, "SchedCron": "HrWDjRE5", "SchedRange": ["S0xhcqPW", "lNn9MJHA", "kDWMNQ2N"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserPermissionV3' test.out

#- 165 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wsSZYxm8' \
    --body '{"Permissions": [{"Action": 23, "Resource": "KYugBze4", "SchedAction": 79, "SchedCron": "airaiOUo", "SchedRange": ["bqzQZipy", "uayBMDep", "mpWXXZ9p"]}, {"Action": 78, "Resource": "XdxoHwsI", "SchedAction": 55, "SchedCron": "90lU0UhY", "SchedRange": ["A4yLUYFF", "Jm1FSoVK", "uTAySnfP"]}, {"Action": 78, "Resource": "ZY2uC4Ai", "SchedAction": 99, "SchedCron": "s4hFK933", "SchedRange": ["3vxn6UmM", "adytFEDO", "jK330bIj"]}]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminAddUserPermissionsV3' test.out

#- 166 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CrNxL1tP' \
    --body '[{"Action": 14, "Resource": "tRgvhZ0o"}, {"Action": 22, "Resource": "1Peo5FJY"}, {"Action": 67, "Resource": "0Ixn6z3J"}]' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionBulkV3' test.out

#- 167 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '57' \
    --namespace "$AB_NAMESPACE" \
    --resource 'WWT80Bcs' \
    --userId '7hzrDp3o' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserPermissionV3' test.out

#- 168 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TrTaL5jF' \
    --after 'QbgwCDW6' \
    --before 'aeCTIzOt' \
    --limit '85' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserPlatformAccountsV3' test.out

#- 169 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'AOcWlmdV' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetListJusticePlatformAccounts' test.out

#- 170 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'sCiqWa3m' \
    --userId 'M9AzWKc3' \
    > test.out 2>&1
eval_tap $? 170 'AdminGetUserMapping' test.out

#- 171 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '23DFYipS' \
    --userId 'i842di85' \
    > test.out 2>&1
eval_tap $? 171 'AdminCreateJusticeUser' test.out

#- 172 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'uyNG4IJp' \
    --body '{"platformId": "LNZgSpue", "platformUserId": "s90sWroJ"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminLinkPlatformAccount' test.out

#- 173 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '22tOQnVi' \
    --userId '2zqN2eVY' \
    --body '{"platformNamespace": "m4Qmv2SU"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformUnlinkV3' test.out

#- 174 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'K97CcWDE' \
    --userId 'v8Jr8Wz1' \
    --ticket 'KJ9f5MKg' \
    > test.out 2>&1
eval_tap $? 174 'AdminPlatformLinkV3' test.out

#- 175 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GF58sFCg' \
    --userId 't7gkGLPy' \
    --platformToken 'VIvUrwpx' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 176 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BTm7a5EH' \
    --body '["09y4bRRP", "PbP8X5I8", "WRF2IUKC"]' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserRolesV3' test.out

#- 177 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KbRMssDP' \
    --body '[{"namespace": "8TMKjdWA", "roleId": "hPWApzDe"}, {"namespace": "tDAMypW3", "roleId": "EqKF2Cle"}, {"namespace": "TOXoRHi4", "roleId": "k0eGJIQr"}]' \
    > test.out 2>&1
eval_tap $? 177 'AdminSaveUserRoleV3' test.out

#- 178 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'x2HbuHgN' \
    --userId 'bvYAtWNY' \
    > test.out 2>&1
eval_tap $? 178 'AdminAddUserRoleV3' test.out

#- 179 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'yfmC9ASc' \
    --userId 'sjb4khy4' \
    > test.out 2>&1
eval_tap $? 179 'AdminDeleteUserRoleV3' test.out

#- 180 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0ZmVCrcZ' \
    --body '{"enabled": false, "reason": "cP67NWjo"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateUserStatusV3' test.out

#- 181 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'drfvZObC' \
    > test.out 2>&1
eval_tap $? 181 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 182 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'bm6fCmxs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "keJPZd7D"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateClientSecretV3' test.out

#- 183 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after '5uMXj9PQ' \
    --before 'lSjDlwoc' \
    --isWildcard  \
    --limit '33' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRolesV3' test.out

#- 184 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "managers": [{"displayName": "tTFJJzE4", "namespace": "opKGJ5lR", "userId": "hIdNRtEJ"}, {"displayName": "qGLbcBep", "namespace": "apqbPk9E", "userId": "SCarpxmS"}, {"displayName": "IhRrFccd", "namespace": "2Dz9H61i", "userId": "PQWe8qok"}], "members": [{"displayName": "Pz466Ued", "namespace": "K7z0sD8K", "userId": "lJ4zYE5W"}, {"displayName": "tXqsDJMm", "namespace": "12zYYVZ9", "userId": "gG2UBTaL"}, {"displayName": "nkuC8woz", "namespace": "yDLBOXVA", "userId": "bBoaPqhg"}], "permissions": [{"action": 17, "resource": "gMKnMuwa", "schedAction": 70, "schedCron": "VG0dDTh8", "schedRange": ["jaXmaruJ", "im1ePMtu", "c8KX9fbM"]}, {"action": 49, "resource": "w6jMRSt5", "schedAction": 84, "schedCron": "vpaiAk5s", "schedRange": ["tn6tMvUd", "i3U2xVVC", "U9PFaEV0"]}, {"action": 64, "resource": "NlLJ5yk3", "schedAction": 29, "schedCron": "pW7XVB3M", "schedRange": ["PkhvJAcm", "fvxN24os", "ADOlf1dc"]}], "roleName": "hVhfPCgb"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminCreateRoleV3' test.out

#- 185 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'P6evB1QA' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleV3' test.out

#- 186 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'vufTjcsj' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteRoleV3' test.out

#- 187 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'CFf7iS8R' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "qAIxFddW"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateRoleV3' test.out

#- 188 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'vrNw1mkp' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleAdminStatusV3' test.out

#- 189 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'VfnmCnpo' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpdateAdminRoleStatusV3' test.out

#- 190 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'OLgytmrU' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleAdminV3' test.out

#- 191 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'H7N4f89v' \
    --after 'VjsmZmvN' \
    --before 'u98ny16G' \
    --limit '31' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetRoleManagersV3' test.out

#- 192 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'x8Kn7bES' \
    --body '{"managers": [{"displayName": "gKI5Hv7F", "namespace": "J4tEPknz", "userId": "DxSqhe7I"}, {"displayName": "Y9eF0aX6", "namespace": "HRkSMUct", "userId": "Slw9Wg0v"}, {"displayName": "WHnBTdwd", "namespace": "lFrx0MuX", "userId": "KPMzkHDd"}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRoleManagersV3' test.out

#- 193 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'IL0QQiwk' \
    --body '{"managers": [{"displayName": "xtAoxnxZ", "namespace": "BCjzG5p7", "userId": "FIi6IWv1"}, {"displayName": "YhEPlgM4", "namespace": "UN2EQVt5", "userId": "z6yVJv8H"}, {"displayName": "8qbqNmNY", "namespace": "OAbG1bwi", "userId": "H098OqzX"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminRemoveRoleManagersV3' test.out

#- 194 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'NDyTDPtQ' \
    --after 'cjwutP21' \
    --before 'He9pqloF' \
    --limit '26' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetRoleMembersV3' test.out

#- 195 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'Khceiwyq' \
    --body '{"members": [{"displayName": "TGtpWMLu", "namespace": "rZwEBp48", "userId": "apmIzaLk"}, {"displayName": "SVn3plY0", "namespace": "lA7sGyJ2", "userId": "XmM7iH4q"}, {"displayName": "oUL3RuP7", "namespace": "3uoApmIX", "userId": "xKJe3tSh"}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddRoleMembersV3' test.out

#- 196 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'l1oZd8jW' \
    --body '{"members": [{"displayName": "dvWt9spc", "namespace": "mz9GiG1F", "userId": "QhDla9rV"}, {"displayName": "Ojf9aTq4", "namespace": "s5I9vzlf", "userId": "BfWDGcDf"}, {"displayName": "zVnHbSCM", "namespace": "Ccpu8YEV", "userId": "H5xRUKN6"}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminRemoveRoleMembersV3' test.out

#- 197 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'OJaFKETA' \
    --body '{"permissions": [{"action": 47, "resource": "ipAQLOIK", "schedAction": 100, "schedCron": "ycx5qp3T", "schedRange": ["imEMHKOI", "R9Etcs6W", "4CVj5UHW"]}, {"action": 4, "resource": "gMSZnBES", "schedAction": 70, "schedCron": "jTMcFAxi", "schedRange": ["3aoxicof", "W2tV3Jqn", "cFdKh7WI"]}, {"action": 99, "resource": "PPJCUsxm", "schedAction": 54, "schedCron": "uHYV3UZ4", "schedRange": ["EBbfrGh0", "otUZbtYH", "MuCcqyTf"]}]}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateRolePermissionsV3' test.out

#- 198 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'u46ALvZz' \
    --body '{"permissions": [{"action": 68, "resource": "C49YU3hx", "schedAction": 79, "schedCron": "fg7x9Y15", "schedRange": ["RQFapokv", "ras7rCa1", "7Zp0oIJ5"]}, {"action": 75, "resource": "J0eqL3K9", "schedAction": 99, "schedCron": "AI2DaHtv", "schedRange": ["Y5JgOyJA", "EC7FTOpT", "srRlpQ1K"]}, {"action": 81, "resource": "eBlpMJ79", "schedAction": 93, "schedCron": "aXj6tO8W", "schedRange": ["z4QoNRYs", "EIdFiiel", "QfRbOc9N"]}]}' \
    > test.out 2>&1
eval_tap $? 198 'AdminAddRolePermissionsV3' test.out

#- 199 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'H1Xe5H3l' \
    --body '["nTz5Jt2W", "8fpLKBR7", "yUPKux28"]' \
    > test.out 2>&1
eval_tap $? 199 'AdminDeleteRolePermissionsV3' test.out

#- 200 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '84' \
    --resource 'mB5oEVLo' \
    --roleId '0PqSzVj6' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteRolePermissionV3' test.out

#- 201 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 201 'AdminGetMyUserV3' test.out

#- 202 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'cwE8BpHY' \
    --extendExp  \
    --redirectUri 'sSGzx7gU' \
    --password 'syv6I9sd' \
    --requestId 'gFM4Pb2E' \
    --userName '415vNYOm' \
    > test.out 2>&1
eval_tap $? 202 'UserAuthenticationV3' test.out

#- 203 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '04q7I6SG' \
    --linkingToken 'FjmREigL' \
    --password 'Cp4F9AMb' \
    --username 'tUanUhdl' \
    > test.out 2>&1
eval_tap $? 203 'AuthenticationWithPlatformLinkV3' test.out

#- 204 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken '8VvZ9YvA' \
    > test.out 2>&1
eval_tap $? 204 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 205 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'wObxZ0Zc' \
    > test.out 2>&1
eval_tap $? 205 'RequestOneTimeLinkingCodeV3' test.out

#- 206 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'hKwK6NUc' \
    > test.out 2>&1
eval_tap $? 206 'ValidateOneTimeLinkingCodeV3' test.out

#- 207 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --clientId 'FzWJoMgj' \
    --oneTimeLinkCode 'C0gNftJh' \
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
    --clientId 'vxgutcNx' \
    > test.out 2>&1
eval_tap $? 210 'RequestGameTokenCodeResponseV3' test.out

#- 211 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'okTH0bMS' \
    --userId 'nrFIWpmb' \
    > test.out 2>&1
eval_tap $? 211 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 212 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hy8cDJeP' \
    > test.out 2>&1
eval_tap $? 212 'RevokeUserV3' test.out

#- 213 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'BjttlNIo' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'K7KJJX57' \
    --redirectUri '41HYHoDM' \
    --scope '3L5kZiTW' \
    --state 'NUQN4tlu' \
    --targetAuthPage 'zYY2D1Ih' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'O9Y71O0K' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 213 'AuthorizeV3' test.out

#- 214 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'KtqWgtwy' \
    > test.out 2>&1
eval_tap $? 214 'TokenIntrospectionV3' test.out

#- 215 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 215 'GetJWKSV3' test.out

#- 216 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'XLzKNMDx' \
    --factor 'VTTnMfoY' \
    --mfaToken 'TcP7vJcz' \
    > test.out 2>&1
eval_tap $? 216 'SendMFAAuthenticationCode' test.out

#- 217 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'lWId6HYN' \
    --mfaToken 'unIldcQA' \
    > test.out 2>&1
eval_tap $? 217 'Change2faMethod' test.out

#- 218 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'kSUWUemq' \
    --factor 'yexB2jtr' \
    --mfaToken 'rShq5iDd' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 218 'Verify2faCode' test.out

#- 219 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kYE0xQLx' \
    --userId 'fRVF9nhL' \
    > test.out 2>&1
eval_tap $? 219 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 220 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'lljebeO7' \
    --clientId 'OFDI8jYy' \
    --redirectUri 'ocv4hcAh' \
    --requestId 'xkhfdsCR' \
    > test.out 2>&1
eval_tap $? 220 'AuthCodeRequestV3' test.out

#- 221 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'Up4VmuaU' \
    --clientId 'ZM2T1nUf' \
    --createHeadless  \
    --deviceId 'UVRsfjje' \
    --macAddress 'Ocdqfp1m' \
    --platformToken 'gLIzxIHu' \
    > test.out 2>&1
eval_tap $? 221 'PlatformTokenGrantV3' test.out

#- 222 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 222 'GetRevocationListV3' test.out

#- 223 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token '9VdOYBoR' \
    > test.out 2>&1
eval_tap $? 223 'TokenRevocationV3' test.out

#- 224 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId '8B5cxINf' \
    --code 'CH6goiZ9' \
    --codeVerifier 'aULWyjus' \
    --extendExp  \
    --password 'eI9UrnDO' \
    --redirectUri 'PqMWLBWp' \
    --refreshToken 'fbKgnVLr' \
    --username 'aUJoAZCy' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 224 'TokenGrantV3' test.out

#- 225 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'hDpwN3Cw' \
    > test.out 2>&1
eval_tap $? 225 'VerifyTokenV3' test.out

#- 226 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'WJ9zwSXH' \
    --code 'iVHBDkJe' \
    --error 'vjKJ9lbd' \
    --openidAssocHandle '8O3UoOxe' \
    --openidClaimedId 'wGxRXAtk' \
    --openidIdentity 'klYXabzw' \
    --openidMode 'itEt4iYs' \
    --openidNs 'UIUAVWiI' \
    --openidOpEndpoint 'bA7aexez' \
    --openidResponseNonce 'VxBIiYvp' \
    --openidReturnTo 'C3UbgxKV' \
    --openidSig '0tY2gSSR' \
    --openidSigned 'OztRhZBw' \
    --state '47UBxEND' \
    > test.out 2>&1
eval_tap $? 226 'PlatformAuthenticationV3' test.out

#- 227 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'EMqWc3oL' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetInputValidations' test.out

#- 228 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'ydTi4hvw' \
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
    --clientId 'upcOVhR8' \
    > test.out 2>&1
eval_tap $? 230 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 231 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oH0VyvB4' \
    --body '{"platformUserIds": ["ljHdUC7j", "eo4yaCR6", "6LYpRbIV"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 232 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DYJ3bo5K' \
    --platformUserId '5q3B776c' \
    > test.out 2>&1
eval_tap $? 232 'PublicGetUserByPlatformUserIDV3' test.out

#- 233 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'Uw8Heyo1' \
    > test.out 2>&1
eval_tap $? 233 'PublicGetAsyncStatus' test.out

#- 234 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'VBgfM1sz' \
    --limit '12' \
    --offset '37' \
    --query 'UnkYOsy5' \
    > test.out 2>&1
eval_tap $? 234 'PublicSearchUserV3' test.out

#- 235 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "SkSMZNtq", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "SH5C2H6L", "policyId": "HkjANL2c", "policyVersionId": "eGmRMMUM"}, {"isAccepted": false, "localizedPolicyVersionId": "B8kSIW8O", "policyId": "2gOAEpvf", "policyVersionId": "xUTl3xgB"}, {"isAccepted": true, "localizedPolicyVersionId": "O0X2c2N2", "policyId": "uaNvBSsn", "policyVersionId": "2Ih4jfU8"}], "authType": "IFwtLf7U", "code": "ngYIxx6l", "country": "yLeEzb0K", "dateOfBirth": "VDllUxEL", "displayName": "WBqMFvRH", "emailAddress": "scYnRS7j", "password": "RjsyDbqz", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 235 'PublicCreateUserV3' test.out

#- 236 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'pUgmwUm8' \
    --query 'JizwE4n0' \
    > test.out 2>&1
eval_tap $? 236 'CheckUserAvailability' test.out

#- 237 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Hm4xh25q", "iamPSMbe", "rzwsQuEI"]}' \
    > test.out 2>&1
eval_tap $? 237 'PublicBulkGetUsers' test.out

#- 238 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "Z95RpAbU", "languageTag": "0LiylZ6p"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicSendRegistrationCode' test.out

#- 239 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "UnV6glLG", "emailAddress": "j3UdtXOJ"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicVerifyRegistrationCode' test.out

#- 240 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "f1RMUBzL", "languageTag": "gLMNvD9A"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicForgotPasswordV3' test.out

#- 241 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'hDvDjeg3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'GetAdminInvitationV3' test.out

#- 242 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'EtlsusCo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "9eNNe8f2", "policyId": "QdWsA40S", "policyVersionId": "DatIgJ47"}, {"isAccepted": false, "localizedPolicyVersionId": "UscblbhY", "policyId": "aaiehiLK", "policyVersionId": "XPNcL8uL"}, {"isAccepted": true, "localizedPolicyVersionId": "DhCbnK3f", "policyId": "irAc45tM", "policyVersionId": "hlajvJjE"}], "authType": "EMAILPASSWD", "country": "nkcfik8w", "dateOfBirth": "Ppdt6EHK", "displayName": "vmFsUgSR", "password": "xK0xqyng", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 242 'CreateUserFromInvitationV3' test.out

#- 243 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "OEfOwAq2", "country": "Sc6BgmNU", "dateOfBirth": "fy1ZUMOb", "displayName": "jx9EbPo5", "languageTag": "LJIYk3Jb", "userName": "ZFORbxBj"}' \
    > test.out 2>&1
eval_tap $? 243 'UpdateUserV3' test.out

#- 244 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "eD9F718h", "country": "oUf0RoI0", "dateOfBirth": "iUHd2LP9", "displayName": "BvJFCJBw", "languageTag": "EOhXMMio", "userName": "44edVEBg"}' \
    > test.out 2>&1
eval_tap $? 244 'PublicPartialUpdateUserV3' test.out

#- 245 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "c737BeOu", "emailAddress": "5pONSWWQ", "languageTag": "YModfOpt"}' \
    > test.out 2>&1
eval_tap $? 245 'PublicSendVerificationCodeV3' test.out

#- 246 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "9B74Ra7L", "contactType": "4fWls4KD", "languageTag": "OkG8j80e", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 246 'PublicUserVerificationV3' test.out

#- 247 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "mOyzScud", "country": "jGrm3PiG", "dateOfBirth": "ZVTcC0L1", "displayName": "zttxnl3z", "emailAddress": "Znji9chF", "password": "TDVKJxqc", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 247 'PublicUpgradeHeadlessAccountV3' test.out

#- 248 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "5aVOFIIe", "password": "tcLUvjXy"}' \
    > test.out 2>&1
eval_tap $? 248 'PublicVerifyHeadlessAccountV3' test.out

#- 249 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "xHXX1AS9", "newPassword": "OsYqg33B", "oldPassword": "vzkqNZVK"}' \
    > test.out 2>&1
eval_tap $? 249 'PublicUpdatePasswordV3' test.out

#- 250 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'mV79XPGd' \
    > test.out 2>&1
eval_tap $? 250 'PublicCreateJusticeUser' test.out

#- 251 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RHFANU6V' \
    --redirectUri 'gfMbwsPy' \
    --ticket '0UWXfWZT' \
    > test.out 2>&1
eval_tap $? 251 'PublicPlatformLinkV3' test.out

#- 252 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QaDHJRME' \
    --body '{"platformNamespace": "KXvLlHOM"}' \
    > test.out 2>&1
eval_tap $? 252 'PublicPlatformUnlinkV3' test.out

#- 253 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rKQ8niVt' \
    > test.out 2>&1
eval_tap $? 253 'PublicPlatformUnlinkAllV3' test.out

#- 254 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vgPjMLm4' \
    --ticket 'SUdqNmfM' \
    > test.out 2>&1
eval_tap $? 254 'PublicForcePlatformLinkV3' test.out

#- 255 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZRCn1J76' \
    --clientId 'CFM0jQil' \
    --redirectUri '9AzboCjm' \
    > test.out 2>&1
eval_tap $? 255 'PublicWebLinkPlatform' test.out

#- 256 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dXBVvbLJ' \
    --state 'FX5Ay9LU' \
    > test.out 2>&1
eval_tap $? 256 'PublicWebLinkPlatformEstablish' test.out

#- 257 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "iyCH1394", "emailAddress": "rRcPz81k", "newPassword": "EQvBD9hi"}' \
    > test.out 2>&1
eval_tap $? 257 'ResetPasswordV3' test.out

#- 258 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VWPkrXqb' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetUserByUserIdV3' test.out

#- 259 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TlDxAAxm' \
    --activeOnly  \
    --after 'rf6gfHsO' \
    --before 'Gxez2u2e' \
    --limit '30' \
    > test.out 2>&1
eval_tap $? 259 'PublicGetUserBanHistoryV3' test.out

#- 260 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dCd4nETX' \
    > test.out 2>&1
eval_tap $? 260 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 261 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XvJQLzH3' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetUserInformationV3' test.out

#- 262 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xnk2Mdk2' \
    --after '0.6931172617362332' \
    --before '0.9862122195018063' \
    --limit '84' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetUserLoginHistoriesV3' test.out

#- 263 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9qwgeXmf' \
    --after 'bftrt9hI' \
    --before 'F9zAoVwV' \
    --limit '63' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetUserPlatformAccountsV3' test.out

#- 264 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qpqpmYmr' \
    > test.out 2>&1
eval_tap $? 264 'PublicListJusticePlatformAccountsV3' test.out

#- 265 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '9J2a3alD' \
    --body '{"platformId": "fnPftvyY", "platformUserId": "fsMHjr8t"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicLinkPlatformAccount' test.out

#- 266 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'TvdwTRO7' \
    --body '{"chosenNamespaces": ["oVfiLfxW", "WftzkIEv", "6aBt7hLi"], "requestId": "zn4nuxVz"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicForceLinkPlatformWithProgression' test.out

#- 267 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GnewzIqj' \
    > test.out 2>&1
eval_tap $? 267 'PublicGetPublisherUserV3' test.out

#- 268 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'S44naHhb' \
    --password 'RsMe9ot1' \
    > test.out 2>&1
eval_tap $? 268 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 269 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'Uj25Pl66' \
    --before 'vroVjqfk' \
    --isWildcard  \
    --limit '93' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetRolesV3' test.out

#- 270 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'AKDqRj2i' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetRoleV3' test.out

#- 271 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 271 'PublicGetMyUserV3' test.out

#- 272 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'nwrV5bJM' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 273 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["lweoEGPq", "CutLixdP", "V47XqfTm"], "oneTimeLinkCode": "Sfmusx8O"}' \
    > test.out 2>&1
eval_tap $? 273 'LinkHeadlessAccountToMyAccountV3' test.out

#- 274 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "2yUA9LEB"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicSendVerificationLinkV3' test.out

#- 275 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'AGbiCRkP' \
    > test.out 2>&1
eval_tap $? 275 'PublicVerifyUserByLinkV3' test.out

#- 276 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'TDr0xt56' \
    --code 'w9N0RSfs' \
    --error 'dqWzqJHd' \
    --state '4AJj4PjY' \
    > test.out 2>&1
eval_tap $? 276 'PlatformAuthenticateSAMLV3Handler' test.out

#- 277 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'Qdjr6Adz' \
    --payload 'NuJ3YUk6' \
    > test.out 2>&1
eval_tap $? 277 'LoginSSOClient' test.out

#- 278 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'hUEnEPi4' \
    > test.out 2>&1
eval_tap $? 278 'LogoutSSOClient' test.out

#- 279 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'Sp3MI8W3' \
    > test.out 2>&1
eval_tap $? 279 'RequestGameTokenResponseV3' test.out

#- 280 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ev74V9pB' \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDevicesByUserV4' test.out

#- 281 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'K6V8RI8M' \
    --endDate '6D9uINyY' \
    --limit '100' \
    --offset '25' \
    --startDate 'Q35wO8JG' \
    > test.out 2>&1
eval_tap $? 281 'AdminGetBannedDevicesV4' test.out

#- 282 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'K7KU6uHu' \
    > test.out 2>&1
eval_tap $? 282 'AdminGetUserDeviceBansV4' test.out

#- 283 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "51Z8Sh5E", "deviceId": "NzZn5HYB", "deviceType": "TCX5teYK", "enabled": false, "endDate": "C6HhH2PI", "ext": {"hkcRqCWf": {}, "3R4rpsWd": {}, "P4Lbt8hl": {}}, "reason": "7ygSmpGI"}' \
    > test.out 2>&1
eval_tap $? 283 'AdminBanDeviceV4' test.out

#- 284 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'bmRFy9yx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'AdminGetDeviceBanV4' test.out

#- 285 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'g8P4FDoV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 285 'AdminUpdateDeviceBanV4' test.out

#- 286 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'Fm5c9XC8' \
    --startDate 'TF0mPEu8' \
    --deviceType 'nabOh3y6' \
    > test.out 2>&1
eval_tap $? 286 'AdminGenerateReportV4' test.out

#- 287 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 287 'AdminGetDeviceTypesV4' test.out

#- 288 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'siUXotxG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 288 'AdminGetDeviceBansV4' test.out

#- 289 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId '3kNXaQRz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 289 'AdminDecryptDeviceV4' test.out

#- 290 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'h1u1u5NT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'AdminUnbanDeviceV4' test.out

#- 291 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'uC05eSMR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'AdminGetUsersByDeviceV4' test.out

#- 292 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 73}' \
    > test.out 2>&1
eval_tap $? 292 'AdminCreateTestUsersV4' test.out

#- 293 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["NlEeFwCy", "ovfD9nkP", "YJ1UZle5"]}' \
    > test.out 2>&1
eval_tap $? 293 'AdminBulkCheckValidUserIDV4' test.out

#- 294 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YzEmwAe6' \
    --body '{"avatarUrl": "ibjo1fYm", "country": "n2PKOvHj", "dateOfBirth": "7i9OILKJ", "displayName": "An3vVKBl", "languageTag": "8ERjVBZj", "userName": "xxFQRm1v"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminUpdateUserV4' test.out

#- 295 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nDCNsUfk' \
    --body '{"code": "kL1P8IQA", "emailAddress": "cyHcKTUe"}' \
    > test.out 2>&1
eval_tap $? 295 'AdminUpdateUserEmailAddressV4' test.out

#- 296 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BDReA3ZN' \
    > test.out 2>&1
eval_tap $? 296 'AdminDisableUserMFAV4' test.out

#- 297 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'usMTI3QS' \
    > test.out 2>&1
eval_tap $? 297 'AdminListUserRolesV4' test.out

#- 298 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '9fIbuBnw' \
    --body '{"assignedNamespaces": ["DK2ZRLU3", "qL9dcTsX", "TJXky372"], "roleId": "vvhZcpRr"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateUserRoleV4' test.out

#- 299 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '5uyNnJJ5' \
    --body '{"assignedNamespaces": ["NnO2c6pC", "Iedv7Ard", "KawqqxuC"], "roleId": "DAn0mX4S"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminAddUserRoleV4' test.out

#- 300 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eFlF3Qgq' \
    --body '{"assignedNamespaces": ["RDB1PkLN", "XI5q80VY", "f1BvYoEN"], "roleId": "qmWPig1a"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminRemoveUserRoleV4' test.out

#- 301 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '32' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 301 'AdminGetRolesV4' test.out

#- 302 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "cL8R5Xag"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminCreateRoleV4' test.out

#- 303 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'MyMRn3rK' \
    > test.out 2>&1
eval_tap $? 303 'AdminGetRoleV4' test.out

#- 304 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId '86YNUD8A' \
    > test.out 2>&1
eval_tap $? 304 'AdminDeleteRoleV4' test.out

#- 305 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'sqRzrgHX' \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "7HA2DE2I"}' \
    > test.out 2>&1
eval_tap $? 305 'AdminUpdateRoleV4' test.out

#- 306 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'JsNwH1r1' \
    --body '{"permissions": [{"action": 89, "resource": "SelYw4Yr", "schedAction": 7, "schedCron": "3zQUKgOI", "schedRange": ["mNmsL44f", "05hck0Mb", "LtK9O0ug"]}, {"action": 32, "resource": "vRANudU6", "schedAction": 86, "schedCron": "khlNz76T", "schedRange": ["2xuzWmyx", "i60Xfucm", "VNSZXSYa"]}, {"action": 71, "resource": "0CTrWkrx", "schedAction": 7, "schedCron": "HNCPkpWQ", "schedRange": ["FC1bfqph", "YsOJMxZ7", "ykTErVHl"]}]}' \
    > test.out 2>&1
eval_tap $? 306 'AdminUpdateRolePermissionsV4' test.out

#- 307 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'tXHAVkJq' \
    --body '{"permissions": [{"action": 92, "resource": "8MXQky0J", "schedAction": 22, "schedCron": "xyxp5j7A", "schedRange": ["NxQAOd6A", "kboh1j1X", "ZN0ApvKD"]}, {"action": 37, "resource": "fZvRazk1", "schedAction": 28, "schedCron": "Ws6yImm5", "schedRange": ["1Y8ol4D0", "b0v1at2Z", "0PrWD4zu"]}, {"action": 14, "resource": "QXzvg17v", "schedAction": 54, "schedCron": "3DKrV8Ss", "schedRange": ["jpvJwroP", "f5m4O51S", "QRf2iCLX"]}]}' \
    > test.out 2>&1
eval_tap $? 307 'AdminAddRolePermissionsV4' test.out

#- 308 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'EMHOACwG' \
    --body '["k8SMKnCj", "tUl5Du6J", "B8wI7SuM"]' \
    > test.out 2>&1
eval_tap $? 308 'AdminDeleteRolePermissionsV4' test.out

#- 309 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'fFvthsgJ' \
    --after 'zURvE6Hm' \
    --before '4Drrmz8o' \
    --limit '42' \
    > test.out 2>&1
eval_tap $? 309 'AdminListAssignedUsersV4' test.out

#- 310 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'm21mlsru' \
    --body '{"assignedNamespaces": ["CgKF2Od1", "PTYl92M8", "AAfdCOh3"], "namespace": "69NB7gAM", "userId": "5ThIyR8O"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminAssignUserToRoleV4' test.out

#- 311 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'dS95PfxZ' \
    --body '{"namespace": "TOB5yVVy", "userId": "ty9jkY1u"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminRevokeUserFromRoleV4' test.out

#- 312 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "nzpdiN6A", "country": "gOcrkZUQ", "dateOfBirth": "cawr7RFO", "displayName": "ZhbxcVfm", "languageTag": "Xd0lwLGW", "userName": "nnHU4ouG"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateMyUserV4' test.out

#- 313 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 313 'AdminDisableMyAuthenticatorV4' test.out

#- 314 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'r1LnPIk1' \
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
    --code 'v0ZlDqYN' \
    > test.out 2>&1
eval_tap $? 323 'AdminEnableMyEmailV4' test.out

#- 324 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 324 'AdminGetMyEnabledFactorsV4' test.out

#- 325 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'vDXgQahr' \
    > test.out 2>&1
eval_tap $? 325 'AdminMakeFactorMyDefaultV4' test.out

#- 326 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["FLWLyiox", "9K4wFQDc", "mbyBaYOV"], "emailAddresses": ["9AXwl7Wg", "cCzB3iHU", "lKbePVHS"], "isAdmin": false, "namespace": "pT6mQUk9", "roleId": "wYmbRgtA"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminInviteUserV4' test.out

#- 327 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "vbQO4NNf", "policyId": "Lalt55UF", "policyVersionId": "mRd19NR5"}, {"isAccepted": true, "localizedPolicyVersionId": "y9aui2RT", "policyId": "fpVLpTmy", "policyVersionId": "OYkPdXkV"}, {"isAccepted": true, "localizedPolicyVersionId": "OcvMtdlc", "policyId": "iNC5LxfS", "policyVersionId": "7hZxo3lY"}], "authType": "EMAILPASSWD", "country": "AolrxbEJ", "dateOfBirth": "OBmFgRHf", "displayName": "CGiq8UQ9", "emailAddress": "hffU4JY8", "password": "ShVwti7H", "passwordMD5Sum": "MWViN7sZ", "username": "yAJstBp6", "verified": false}' \
    > test.out 2>&1
eval_tap $? 327 'PublicCreateTestUserV4' test.out

#- 328 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "z5vD2bXX", "policyId": "pZexooO1", "policyVersionId": "uinDdY78"}, {"isAccepted": false, "localizedPolicyVersionId": "spI2VYNZ", "policyId": "LaCSyYAd", "policyVersionId": "AJdvUtVO"}, {"isAccepted": false, "localizedPolicyVersionId": "MMZBDA5b", "policyId": "fuFG61fj", "policyVersionId": "NwBnM4jv"}], "authType": "EMAILPASSWD", "code": "JFcx3279", "country": "g839YTcT", "dateOfBirth": "YNFkJ2E7", "displayName": "qa1WRGC5", "emailAddress": "AY1sH87Q", "password": "Patghy88", "passwordMD5Sum": "vs0GbQFt", "reachMinimumAge": true, "username": "X1VsM81i"}' \
    > test.out 2>&1
eval_tap $? 328 'PublicCreateUserV4' test.out

#- 329 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'hNObWjK7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "X64drUj2", "policyId": "5OrcfLaX", "policyVersionId": "6zKcwFeo"}, {"isAccepted": true, "localizedPolicyVersionId": "jfzhBiPD", "policyId": "YgusrJcv", "policyVersionId": "W8oqhP8M"}, {"isAccepted": true, "localizedPolicyVersionId": "Z8TQJIfH", "policyId": "C6TWELsI", "policyVersionId": "X06OMzvI"}], "authType": "EMAILPASSWD", "country": "i5rS4TIA", "dateOfBirth": "dAeiVFvO", "displayName": "PHNwk2kQ", "password": "WPnBwA7r", "reachMinimumAge": false, "username": "Yoreax6q"}' \
    > test.out 2>&1
eval_tap $? 329 'CreateUserFromInvitationV4' test.out

#- 330 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "OXFXrEeh", "country": "kkAAdo3i", "dateOfBirth": "5q3Vqfnk", "displayName": "F1SiVPgf", "languageTag": "r3TRFrXc", "userName": "Ml4I2vLI"}' \
    > test.out 2>&1
eval_tap $? 330 'PublicUpdateUserV4' test.out

#- 331 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Ti8CjOAO", "emailAddress": "1QPPXxW4"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicUpdateUserEmailAddressV4' test.out

#- 332 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "EI9IjM9u", "country": "6GaAwXn0", "dateOfBirth": "GmydEmzz", "displayName": "lHQvkdzx", "emailAddress": "hU8TJugz", "password": "97QluPkK", "reachMinimumAge": false, "username": "HMLvMV2h", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 332 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 333 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "UU0DN4UV", "password": "G8Ljkig9", "username": "7gI0TCki"}' \
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
    --code 'p0NrbxM3' \
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
    --deviceToken 'vUufhiPv' \
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
    --code 'PrgsXnKd' \
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
    --factor 'yVcmzhVl' \
    > test.out 2>&1
eval_tap $? 347 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE