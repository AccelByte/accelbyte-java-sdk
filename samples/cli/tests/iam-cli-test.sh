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
echo "1..340"

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
    --body '[{"field": "9Xz25ecD", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "blockedWord": ["61i1zeGY", "oOMIGzGS", "UKhMafVZ"], "description": [{"language": "HpCU32cg", "message": ["G1I8H1Gc", "FpfMlzaE", "3TifDrKD"]}, {"language": "h7R3gomQ", "message": ["uroQ7oZT", "0mj6F1Ht", "IYHi9xYQ"]}, {"language": "3lgMz6vR", "message": ["ye9He150", "YZVkVOMI", "nzXHic4l"]}], "isCustomRegex": false, "letterCase": "8sdSyMQA", "maxLength": 45, "maxRepeatingAlphaNum": 30, "maxRepeatingSpecialCharacter": 19, "minCharType": 96, "minLength": 73, "regex": "hNmCxYQB", "specialCharacterLocation": "POf1IVsv", "specialCharacters": ["86nJjSDJ", "3HFdxYqo", "ZVOFV3Yt"]}}, {"field": "xfxuiFHu", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "blockedWord": ["yaBLXdoY", "lypxVq3E", "LmTz5FkS"], "description": [{"language": "XoJvWyW2", "message": ["LZK5c6GF", "3YVSAzxO", "LnezUFLP"]}, {"language": "yiATMHfo", "message": ["mZm5ZKnS", "vm9946XC", "N50mCGS7"]}, {"language": "h24TKqjZ", "message": ["4bEgqNRc", "qKrCYmqh", "iBdXPMKs"]}], "isCustomRegex": true, "letterCase": "7vtgaXdt", "maxLength": 98, "maxRepeatingAlphaNum": 88, "maxRepeatingSpecialCharacter": 84, "minCharType": 60, "minLength": 49, "regex": "gQoBIRDF", "specialCharacterLocation": "K13Hb1VL", "specialCharacters": ["1ogC7Pwd", "axY94hkm", "bMu5VjlW"]}}, {"field": "EUZE1BTG", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "blockedWord": ["7Pc5c4Y1", "nlt8u4pC", "XQsQEY9j"], "description": [{"language": "mgsIFmli", "message": ["XyLA8HG3", "hS4ACeky", "8pYWNOK6"]}, {"language": "q0Z5m8Cr", "message": ["coKStoAQ", "hL1APA0N", "4PBdNSfx"]}, {"language": "NUi77DdI", "message": ["FphGpdQb", "canAltmG", "xSw4okNl"]}], "isCustomRegex": false, "letterCase": "FhcmfxKv", "maxLength": 61, "maxRepeatingAlphaNum": 7, "maxRepeatingSpecialCharacter": 76, "minCharType": 100, "minLength": 70, "regex": "M1qcOx83", "specialCharacterLocation": "WYyYXiuO", "specialCharacters": ["Y31DDLqE", "PfnHd1jp", "M6t1iGht"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'GauBhySF' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'K0dMbcJ3' \
    --before 'subCn5sN' \
    --limit '25' \
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
    --body '{"ageRestriction": 78, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode '4TowEx5e' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 21}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'urhfNTgd' \
    --limit '83' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "dNa7b5ps", "comment": "Bf3YqFv9", "endDate": "ZAZWZxib", "reason": "klZgX2Sy", "skipNotif": true, "userIds": ["xPu1wvRH", "xr8XHxXO", "XZXypdpy"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "ryICJLaO", "userId": "lxVWOBwp"}, {"banId": "WJas7S3j", "userId": "rBN6iYNX"}, {"banId": "8sGsNM4Y", "userId": "aYgQOCjs"}]}' \
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
    --clientId 'NVjc9fby' \
    --clientName 'YSOY4siS' \
    --clientType 'oFOpHD8L' \
    --limit '81' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["idIZlhBd", "UrFQU6ed", "g05IykBp"], "baseUri": "KyNnk3gU", "clientId": "sJNdfmvD", "clientName": "rdmCEiMK", "clientPermissions": [{"action": 59, "resource": "KqzyNmPv", "schedAction": 35, "schedCron": "0mb8CeIh", "schedRange": ["UdUEQAUx", "ttikWL6X", "ReOWAf78"]}, {"action": 1, "resource": "sSxU2eSP", "schedAction": 65, "schedCron": "tVSpiSTi", "schedRange": ["lF5WK0eB", "PuSlXT4D", "jVUYLHsW"]}, {"action": 81, "resource": "v29H1fLc", "schedAction": 87, "schedCron": "H80coKUD", "schedRange": ["WTdVri8s", "Ye0Hb9Si", "uOLZHo8g"]}], "clientPlatform": "DwGLpL4M", "deletable": true, "description": "vEAtaZk6", "namespace": "f1fDJzxo", "oauthAccessTokenExpiration": 35, "oauthAccessTokenExpirationTimeUnit": "MxlBkyGZ", "oauthClientType": "jW4h32MO", "oauthRefreshTokenExpiration": 52, "oauthRefreshTokenExpirationTimeUnit": "37lnZvIg", "redirectUri": "xloMEr01", "scopes": ["xlIKWbxj", "RMj60uSs", "9KTkukyw"], "secret": "c78vOK15", "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'dVwS7XEA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'y2YtcC58' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId '1UttdpiT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["PjPMlTr3", "1gaR2hnw", "5HuPApum"], "baseUri": "bfcazeOc", "clientName": "A3WZWRuf", "clientPermissions": [{"action": 41, "resource": "5epSelw5", "schedAction": 10, "schedCron": "MhYLR8bV", "schedRange": ["gE2VQZ9F", "kvxRV5dz", "ErsUT0gM"]}, {"action": 35, "resource": "XCureUeE", "schedAction": 81, "schedCron": "0phv4d0a", "schedRange": ["ldtsmf7f", "yAkCAq3x", "w5GztBDW"]}, {"action": 28, "resource": "5a2bd4ay", "schedAction": 31, "schedCron": "pXtAnOPP", "schedRange": ["N1J8tFpb", "ztKYQggM", "5KgoPKIn"]}], "clientPlatform": "Sdx8EfkG", "deletable": true, "description": "RNgkgSQD", "namespace": "1R2EflcC", "oauthAccessTokenExpiration": 98, "oauthAccessTokenExpirationTimeUnit": "W1A6FJTn", "oauthRefreshTokenExpiration": 57, "oauthRefreshTokenExpirationTimeUnit": "HIVUuMxj", "redirectUri": "J4hooOzX", "scopes": ["GXZHuDeu", "AE2bOVQd", "n52Ka0Wh"], "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'dPK40ov8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 30, "resource": "ILUTVDmD"}, {"action": 77, "resource": "Y6bs0kQO"}, {"action": 69, "resource": "10sIEnNR"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId '2DcpudIJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 44, "resource": "FFnscIF4"}, {"action": 17, "resource": "SOBHpWxQ"}, {"action": 53, "resource": "OXaITv3n"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '35' \
    --clientId 'zCDk5kbB' \
    --namespace "$AB_NAMESPACE" \
    --resource 'qhplYd3w' \
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
    --offset '77' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gNyfZp2u' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'f2heyfwH' \
    --body '{"ACSURL": "nPvhZc9O", "AWSCognitoRegion": "GvzODQqQ", "AWSCognitoUserPool": "OaU0we22", "AllowedClients": ["L8eSGUXM", "4b3DY6It", "ddTn52uM"], "AppId": "y2gaL990", "AuthorizationEndpoint": "vRWSg7W1", "ClientId": "i26N6wd1", "Environment": "43DVZiNb", "FederationMetadataURL": "fjG8ip4H", "GenericOauthFlow": false, "IsActive": true, "Issuer": "0r29K3D5", "JWKSEndpoint": "PNossnE2", "KeyID": "jbNYJ486", "NetflixCertificates": {"encryptedPrivateKey": "bDtlJzKy", "encryptedPrivateKeyName": "auhDxZyx", "publicCertificate": "Hw3RCCNV", "publicCertificateName": "kRCO1jQE", "rootCertificate": "av6I0BWR", "rootCertificateName": "Ez8QNpDd"}, "OrganizationId": "QbFdG6ZY", "PlatformName": "DxW0fskm", "RedirectUri": "bORGCMaq", "RegisteredDomains": [{"affectedClientIDs": ["oGIbNVqW", "T2lVyGTh", "ou4On02C"], "domain": "mEP3SGfJ", "namespaces": ["6ypcgImc", "PM0cETUk", "sKodcXr5"], "roleId": "WlwXO51q"}, {"affectedClientIDs": ["Z3N25cpf", "zkPLJraX", "5Y0g6MnR"], "domain": "6fXpyLkI", "namespaces": ["PwYGyAU3", "XqLkRDtk", "AWWHHZmo"], "roleId": "xSIfDsCA"}, {"affectedClientIDs": ["8MYzDVEo", "ZvryrFEC", "cZ1gfiRo"], "domain": "6Du4zh9C", "namespaces": ["lgRXzOJl", "RHLWmoE1", "K3OSLcyL"], "roleId": "PqllSP0Y"}], "Secret": "ZVGtoK91", "TeamID": "UcVRkrVd", "TokenAuthenticationType": "PVbyEtoA", "TokenClaimsMapping": {"tPlQESzY": "98LhwqCx", "1hDLQx1I": "gQ7vPkqQ", "GqJGfYmV": "fyc0IHJg"}, "TokenEndpoint": "qHRlZ8bN", "scopes": ["9Lm6qr9d", "EMcbAhLQ", "ojXVO3bJ"]}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RRBtcQkF' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mVOlgeeH' \
    --body '{"ACSURL": "ONXFhKrE", "AWSCognitoRegion": "iTE2bZSH", "AWSCognitoUserPool": "wXlL6BrA", "AllowedClients": ["UzuIRaGl", "xaPfPA8I", "PZePhRRs"], "AppId": "tisR6h92", "AuthorizationEndpoint": "ECq2Anj6", "ClientId": "HYlT4P5A", "Environment": "fad6vxRS", "FederationMetadataURL": "vyQTowsm", "GenericOauthFlow": false, "IsActive": false, "Issuer": "bJBUluG7", "JWKSEndpoint": "YnnKKz4j", "KeyID": "Gp3Wy41K", "NetflixCertificates": {"encryptedPrivateKey": "xOF8lmT4", "encryptedPrivateKeyName": "O1gyNnZK", "publicCertificate": "FhLAso2A", "publicCertificateName": "Pvoz1YHD", "rootCertificate": "H5kRz77X", "rootCertificateName": "st9MIC57"}, "OrganizationId": "VCM3BdCk", "PlatformName": "hYyIjjJP", "RedirectUri": "TrFUZ4wz", "RegisteredDomains": [{"affectedClientIDs": ["liLdMTGK", "G1kSp3AD", "wjbJ2Eac"], "domain": "VHQzia1b", "namespaces": ["jzRJ8yIC", "MMyPbcMc", "BCzFV32c"], "roleId": "NgW5reAk"}, {"affectedClientIDs": ["JoGXxJD5", "Novou4Kw", "zLI0LQRo"], "domain": "huO6YLJp", "namespaces": ["lAb4jelT", "uzM5w792", "6GT28kCB"], "roleId": "L91kOXYj"}, {"affectedClientIDs": ["pFEEU9af", "uGkkSC2H", "CuIjQZnx"], "domain": "YckXU60G", "namespaces": ["ycZ1YBbg", "xmVz923o", "cuCXq2ba"], "roleId": "ameHweej"}], "Secret": "HrlyJA8P", "TeamID": "bDmMtHOX", "TokenAuthenticationType": "leFNWoPq", "TokenClaimsMapping": {"Up5Z8TYW": "Yfyz4lSj", "9nuIpIa5": "JBKnumnz", "pIoivo7B": "Ffl7Akct"}, "TokenEndpoint": "WzGFIphI", "scopes": ["zA1DvaAy", "QEHq6cOj", "fbSPaWYG"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Dnm5o6s8' \
    --body '{"affectedClientIDs": ["hZmFXNiR", "9zZSZ9Zr", "6748g125"], "assignedNamespaces": ["COB68Oys", "NFc2Wsgs", "GNQKWtQ7"], "domain": "6aaurZqW", "roleId": "o1eySr42"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xWgSnbgI' \
    --body '{"domain": "M6UEaAs3"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GM19JAqB' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'H20LFXdu' \
    --body '{"acsUrl": "Fk2Hbozc", "apiKey": "NgtyGNSC", "appId": "A7lYjAHL", "federationMetadataUrl": "hRfPkRTB", "isActive": true, "redirectUri": "JwUoZzQs", "secret": "IMEqcwdA", "ssoUrl": "mFoWr80V"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xldHSkPb' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AiELQKf8' \
    --body '{"acsUrl": "rsO8sh5U", "apiKey": "Huua15HF", "appId": "qbgBh1rJ", "federationMetadataUrl": "qWVYae7F", "isActive": true, "redirectUri": "mn91aEUv", "secret": "xQESsmjO", "ssoUrl": "GbcvP36C"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZZ3SuCxp' \
    --platformUserId 'S0s81nJX' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'TePWQOmU' \
    --after '86' \
    --before '19' \
    --limit '3' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'AOhr2xLi' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["HarVYLjt", "zJmn62kB", "1olxDgWt"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["U3S4oNpW", "sNB96rRl", "s5ZFVW5e"], "isAdmin": false, "roles": ["CFTaopEW", "s8eT4Xkf", "HI2gVoBX"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 146 'AdminListUsersV3' test.out

#- 147 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'b8Q1vq6n' \
    --endDate 'WZyzu1Jo' \
    --limit '60' \
    --offset '98' \
    --platformBy 'Xp7Gdcno' \
    --platformId '6YsxdAtr' \
    --query 'KDYYtDYB' \
    --startDate 'XAoQ9pcF' \
    > test.out 2>&1
eval_tap $? 147 'AdminSearchUserV3' test.out

#- 148 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["J1OKGBS9", "Z9s0FHB1", "brH7WKiO"]}' \
    > test.out 2>&1
eval_tap $? 148 'AdminGetBulkUserByEmailAddressV3' test.out

#- 149 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QUKLzVdd' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserByUserIdV3' test.out

#- 150 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'adKuvN4w' \
    --body '{"avatarUrl": "q2SkRD7L", "country": "JAtlSe4K", "dateOfBirth": "uspXrBVp", "displayName": "xpLqC37g", "languageTag": "cpZzVHNn", "userName": "6g2MKBPK"}' \
    > test.out 2>&1
eval_tap $? 150 'AdminUpdateUserV3' test.out

#- 151 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QojOuqxP' \
    --activeOnly  \
    --after 'KMXQZKEx' \
    --before 'GgLBKNQB' \
    --limit '99' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserBanV3' test.out

#- 152 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LuJcrP3h' \
    --body '{"ban": "513G3D3Y", "comment": "Psw0HOwN", "endDate": "hQQK3tx3", "reason": "c8TEHfzd", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 152 'AdminBanUserV3' test.out

#- 153 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'n3Bosh8w' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zBIWkbSW' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 153 'AdminUpdateUserBanV3' test.out

#- 154 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rUBE2CZP' \
    --body '{"context": "wfOLErDV", "emailAddress": "lbNbzOzH", "languageTag": "xhgdYc6j"}' \
    > test.out 2>&1
eval_tap $? 154 'AdminSendVerificationCodeV3' test.out

#- 155 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hTq2SQdb' \
    --body '{"Code": "5V8oUsks", "ContactType": "Ds8WvoCC", "LanguageTag": "GivfY3yn", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 155 'AdminVerifyAccountV3' test.out

#- 156 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'u93IJV0t' \
    > test.out 2>&1
eval_tap $? 156 'GetUserVerificationCode' test.out

#- 157 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sC7WQW1f' \
    > test.out 2>&1
eval_tap $? 157 'AdminGetUserDeletionStatusV3' test.out

#- 158 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YjxIS1Sx' \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 158 'AdminUpdateUserDeletionStatusV3' test.out

#- 159 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LWwM8bgc' \
    --body '{"code": "8vWcjnvz", "country": "yMH8SEfv", "dateOfBirth": "e0KbnJMZ", "displayName": "rMtY3dnz", "emailAddress": "ADWrmZFs", "password": "SQjlO0vP", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpgradeHeadlessAccountV3' test.out

#- 160 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nvAK4NIh' \
    > test.out 2>&1
eval_tap $? 160 'AdminDeleteUserInformationV3' test.out

#- 161 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SJa1LatM' \
    --after '0.6964099361163906' \
    --before '0.10345458481887393' \
    --limit '19' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetUserLoginHistoriesV3' test.out

#- 162 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9l4pha56' \
    --body '{"languageTag": "gYZ6mL5z", "newPassword": "flwwxdT8", "oldPassword": "AOBPpBX2"}' \
    > test.out 2>&1
eval_tap $? 162 'AdminResetPasswordV3' test.out

#- 163 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ii7YLPLb' \
    --body '{"Permissions": [{"Action": 16, "Resource": "ZjQp1ZIe", "SchedAction": 54, "SchedCron": "wJ3yEeIj", "SchedRange": ["g8xZrOkf", "TBvWI8Zg", "gKFcWHot"]}, {"Action": 5, "Resource": "ivAeb81S", "SchedAction": 52, "SchedCron": "SuPAIELB", "SchedRange": ["JK4dLbIR", "F5J5TWHq", "MPgEUQdS"]}, {"Action": 38, "Resource": "cBfye2I0", "SchedAction": 99, "SchedCron": "zA3WDqq2", "SchedRange": ["kt3v7GPK", "byaNqImH", "sPSJ4Ray"]}]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminUpdateUserPermissionV3' test.out

#- 164 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'r1jibDMC' \
    --body '{"Permissions": [{"Action": 69, "Resource": "T1J8fsmS", "SchedAction": 91, "SchedCron": "W2sRZsQb", "SchedRange": ["JLoQKi98", "odErRDY1", "ZnzICdf6"]}, {"Action": 22, "Resource": "oaMywqR2", "SchedAction": 39, "SchedCron": "3mnxADFu", "SchedRange": ["KYzBj1MU", "olC8jplC", "cs5NpyzT"]}, {"Action": 56, "Resource": "lhJOgDmY", "SchedAction": 49, "SchedCron": "m46i25VB", "SchedRange": ["qPmmleww", "7PG1iTmj", "WruE54Gc"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminAddUserPermissionsV3' test.out

#- 165 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pw9zXT7K' \
    --body '[{"Action": 53, "Resource": "7BMthUOh"}, {"Action": 97, "Resource": "hgxsIeUe"}, {"Action": 77, "Resource": "fGC5ZOc8"}]' \
    > test.out 2>&1
eval_tap $? 165 'AdminDeleteUserPermissionBulkV3' test.out

#- 166 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '82' \
    --namespace "$AB_NAMESPACE" \
    --resource '24u7IkK6' \
    --userId 'fgVdqvJE' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionV3' test.out

#- 167 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fmz0UBed' \
    --after 'Lq4qiuxj' \
    --before 'ysmUSjJa' \
    --limit '72' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserPlatformAccountsV3' test.out

#- 168 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'BQUQnw7I' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetListJusticePlatformAccounts' test.out

#- 169 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'FBfsPkPl' \
    --userId 'glXVPGpm' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetUserMapping' test.out

#- 170 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'NfvPVWXt' \
    --userId 'u6j4QJ1X' \
    > test.out 2>&1
eval_tap $? 170 'AdminCreateJusticeUser' test.out

#- 171 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'TfWzxUUN' \
    --body '{"platformId": "XsgEkoSW", "platformUserId": "NKfUW29d"}' \
    > test.out 2>&1
eval_tap $? 171 'AdminLinkPlatformAccount' test.out

#- 172 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'IPUuxScB' \
    --userId '0YpQoPni' \
    --body '{"platformNamespace": "a0TY0647"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminPlatformUnlinkV3' test.out

#- 173 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'l3cHPp36' \
    --userId '9Rt6H1r3' \
    --ticket 'gFfDly0j' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformLinkV3' test.out

#- 174 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6WHXN0Pl' \
    --body '["ae0gegz1", "QfNu21wt", "X3LtZJkI"]' \
    > test.out 2>&1
eval_tap $? 174 'AdminDeleteUserRolesV3' test.out

#- 175 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TpHXuA79' \
    --body '[{"namespace": "50Gwffhw", "roleId": "i3nD1SXr"}, {"namespace": "NsGRFPG2", "roleId": "efm0cNbI"}, {"namespace": "Xy8U04H0", "roleId": "teIgAFoW"}]' \
    > test.out 2>&1
eval_tap $? 175 'AdminSaveUserRoleV3' test.out

#- 176 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'mol1A7uF' \
    --userId '19DBmSuU' \
    > test.out 2>&1
eval_tap $? 176 'AdminAddUserRoleV3' test.out

#- 177 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '8xi0YtzN' \
    --userId 'Svf1jt0a' \
    > test.out 2>&1
eval_tap $? 177 'AdminDeleteUserRoleV3' test.out

#- 178 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'I3nxweNh' \
    --body '{"enabled": false, "reason": "wJsjHcVv"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserStatusV3' test.out

#- 179 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1737hOK1' \
    > test.out 2>&1
eval_tap $? 179 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 180 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'wax4HCFT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "9HyLwFdV"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateClientSecretV3' test.out

#- 181 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'iAhN5b3q' \
    --before 'fmPZARMP' \
    --isWildcard  \
    --limit '64' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetRolesV3' test.out

#- 182 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "managers": [{"displayName": "I927TQ34", "namespace": "LRVultst", "userId": "fBTBbU8R"}, {"displayName": "fxH3xgij", "namespace": "tSBqsX1u", "userId": "A0ASsOTO"}, {"displayName": "Ys1Tnf0c", "namespace": "3pw46hbp", "userId": "u5PBT8aG"}], "members": [{"displayName": "Lp0WQlov", "namespace": "gkADA9wT", "userId": "UlTYrN83"}, {"displayName": "n9OtOh2y", "namespace": "19sm5Arz", "userId": "yhDp8DNF"}, {"displayName": "16ygbkb3", "namespace": "SY8RpMrH", "userId": "IrqZ3fJC"}], "permissions": [{"action": 43, "resource": "UddPUYeF", "schedAction": 7, "schedCron": "Eohan9nr", "schedRange": ["pnWWbpLk", "OayRoIOu", "oUfvYvVG"]}, {"action": 87, "resource": "FydaiaSs", "schedAction": 70, "schedCron": "9Uhs67VO", "schedRange": ["1gE05CC3", "SSIYvPkW", "9Ewm3f1u"]}, {"action": 4, "resource": "eAIUm648", "schedAction": 16, "schedCron": "x1AyDznz", "schedRange": ["xAKdPWne", "1Bb3e55G", "c5kaSoWG"]}], "roleName": "5rX8zeEd"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminCreateRoleV3' test.out

#- 183 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'aJ4MALtx' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRoleV3' test.out

#- 184 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId '972qXg4K' \
    > test.out 2>&1
eval_tap $? 184 'AdminDeleteRoleV3' test.out

#- 185 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'GQE6j6Ea' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "bV2iNkuM"}' \
    > test.out 2>&1
eval_tap $? 185 'AdminUpdateRoleV3' test.out

#- 186 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'aNzjG1iS' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetRoleAdminStatusV3' test.out

#- 187 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'PqwXZo1A' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateAdminRoleStatusV3' test.out

#- 188 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '2aEZPV4t' \
    > test.out 2>&1
eval_tap $? 188 'AdminRemoveRoleAdminV3' test.out

#- 189 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'yVeVyNXW' \
    --after 'jyiHAGEK' \
    --before 'ygvFpza2' \
    --limit '18' \
    > test.out 2>&1
eval_tap $? 189 'AdminGetRoleManagersV3' test.out

#- 190 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'YKXHUyqy' \
    --body '{"managers": [{"displayName": "F0vDBOxg", "namespace": "4ymDILNC", "userId": "X1537PsJ"}, {"displayName": "TvGKdh3P", "namespace": "Mncxy1lt", "userId": "FF8OYP4d"}, {"displayName": "LwQEBFsr", "namespace": "SzQwWaN4", "userId": "9ScTwOKy"}]}' \
    > test.out 2>&1
eval_tap $? 190 'AdminAddRoleManagersV3' test.out

#- 191 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'zyINX0rm' \
    --body '{"managers": [{"displayName": "lLYnSDtW", "namespace": "0laW9N7f", "userId": "c5z16XCU"}, {"displayName": "YP1PHI3H", "namespace": "Yh7rb3Ya", "userId": "p0f5Yyam"}, {"displayName": "wt131FPV", "namespace": "oBTXiira", "userId": "rFqakyzB"}]}' \
    > test.out 2>&1
eval_tap $? 191 'AdminRemoveRoleManagersV3' test.out

#- 192 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'Py7XKXUc' \
    --after 'IyOXyDWS' \
    --before '9WpYQLja' \
    --limit '35' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetRoleMembersV3' test.out

#- 193 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'stnZ5o3x' \
    --body '{"members": [{"displayName": "dvJCC3Yt", "namespace": "XtvQWFxk", "userId": "F9DsDgxw"}, {"displayName": "PeNFw8q4", "namespace": "6221AjqA", "userId": "V2kPzPlv"}, {"displayName": "5Jj8LCqi", "namespace": "4lvppTBi", "userId": "IbNpnDVP"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminAddRoleMembersV3' test.out

#- 194 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'lfEPrpmd' \
    --body '{"members": [{"displayName": "SOh30EhU", "namespace": "vRoZFNfd", "userId": "IdWjlCmg"}, {"displayName": "GoXwprps", "namespace": "YF9tNEnb", "userId": "2Xs51pOY"}, {"displayName": "lWks5A5C", "namespace": "ZPIF5IrV", "userId": "k6p7VbMS"}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminRemoveRoleMembersV3' test.out

#- 195 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'OAh8N5xz' \
    --body '{"permissions": [{"action": 70, "resource": "Lfx1HC7Z", "schedAction": 43, "schedCron": "aY4ZN8v7", "schedRange": ["pwXPs4h2", "ByWAjpvV", "nn6m3x96"]}, {"action": 75, "resource": "XXUMqJix", "schedAction": 89, "schedCron": "iirMLFVx", "schedRange": ["s8nuDmPD", "EmCcGxPS", "6JOxZVxk"]}, {"action": 55, "resource": "WQrfiEr0", "schedAction": 30, "schedCron": "gBxKR34t", "schedRange": ["P6vNKI3L", "7lDQ55rV", "qpKMJLwh"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminUpdateRolePermissionsV3' test.out

#- 196 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'zMJRlLBG' \
    --body '{"permissions": [{"action": 88, "resource": "amA5bFgP", "schedAction": 59, "schedCron": "GkWiEmq4", "schedRange": ["Fgf4nkyV", "ah6L8MaL", "BSKATCAi"]}, {"action": 91, "resource": "LSf9cnMQ", "schedAction": 3, "schedCron": "S3KKaTJw", "schedRange": ["aiNWuEBf", "ie3T3QVR", "HTi6zv4g"]}, {"action": 80, "resource": "1TeLhnWx", "schedAction": 32, "schedCron": "YMCBVoNI", "schedRange": ["WqTstUr6", "YScalUN4", "a1RmMVrB"]}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminAddRolePermissionsV3' test.out

#- 197 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'jUrOSKc6' \
    --body '["WuexLKfJ", "5fnKO7i9", "DJo8Rhk0"]' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteRolePermissionsV3' test.out

#- 198 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '69' \
    --resource '0wpXxovk' \
    --roleId '3XgLHIkR' \
    > test.out 2>&1
eval_tap $? 198 'AdminDeleteRolePermissionV3' test.out

#- 199 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 199 'AdminGetMyUserV3' test.out

#- 200 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId '2wrq7mym' \
    --extendExp  \
    --redirectUri 'nnBf1aby' \
    --password 'kipVVtO8' \
    --requestId 'PhU57l8y' \
    --userName 'ZaQhkatO' \
    > test.out 2>&1
eval_tap $? 200 'UserAuthenticationV3' test.out

#- 201 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '5896YAIS' \
    --linkingToken 'H6yMNfxK' \
    --password 'oO2aWGy3' \
    --username 'Qz20TsUj' \
    > test.out 2>&1
eval_tap $? 201 'AuthenticationWithPlatformLinkV3' test.out

#- 202 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'p0wTWnZB' \
    > test.out 2>&1
eval_tap $? 202 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 203 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 203 'GetCountryLocationV3' test.out

#- 204 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 204 'Logout' test.out

#- 205 RequestGameTokenCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenCodeResponseV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'tCyhoXxC' \
    > test.out 2>&1
eval_tap $? 205 'RequestGameTokenCodeResponseV3' test.out

#- 206 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9ZCoDc8g' \
    --userId 'X81qyI7r' \
    > test.out 2>&1
eval_tap $? 206 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 207 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '88nU4GYa' \
    > test.out 2>&1
eval_tap $? 207 'RevokeUserV3' test.out

#- 208 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'alaaBJvG' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --redirectUri '93jN8QUS' \
    --scope '1fe4RGbc' \
    --state '3Ye8Rkv3' \
    --targetAuthPage 'vu3ufAdl' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'uPIeq99q' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 208 'AuthorizeV3' test.out

#- 209 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'BYVotQWI' \
    > test.out 2>&1
eval_tap $? 209 'TokenIntrospectionV3' test.out

#- 210 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 210 'GetJWKSV3' test.out

#- 211 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'DI7xK3Al' \
    --factor '46RVvPS1' \
    --mfaToken 'lvzCc4z7' \
    > test.out 2>&1
eval_tap $? 211 'SendMFAAuthenticationCode' test.out

#- 212 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'ed9h7CeP' \
    --mfaToken 'lrygv9LC' \
    > test.out 2>&1
eval_tap $? 212 'Change2faMethod' test.out

#- 213 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'sfYUoe4V' \
    --factor 'CSKiVZhc' \
    --mfaToken '3gVYr7YU' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 213 'Verify2faCode' test.out

#- 214 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'W17zexWU' \
    --userId 'ZbjvSc68' \
    > test.out 2>&1
eval_tap $? 214 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 215 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'afne3dUZ' \
    --clientId 'o9XOSgsQ' \
    --redirectUri '9YdAk3jl' \
    --requestId 'fKStXTE8' \
    > test.out 2>&1
eval_tap $? 215 'AuthCodeRequestV3' test.out

#- 216 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId '5qjWxXl5' \
    --clientId 'z5uO3wMp' \
    --createHeadless  \
    --deviceId 'RwNOjQlJ' \
    --macAddress 'kHewa91t' \
    --platformToken 'gVECHWHV' \
    > test.out 2>&1
eval_tap $? 216 'PlatformTokenGrantV3' test.out

#- 217 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 217 'GetRevocationListV3' test.out

#- 218 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'Rchb6naQ' \
    > test.out 2>&1
eval_tap $? 218 'TokenRevocationV3' test.out

#- 219 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'YwDEJgY4' \
    --code 'tYS37Ltm' \
    --codeVerifier 'nBaV6gun' \
    --extendExp  \
    --password '6gRXkY2K' \
    --redirectUri '4oP8pVaH' \
    --refreshToken '5dPiUPkP' \
    --username '76HBZKmN' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 219 'TokenGrantV3' test.out

#- 220 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'egQxM1O6' \
    > test.out 2>&1
eval_tap $? 220 'VerifyTokenV3' test.out

#- 221 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'y1B8kK4a' \
    --code 'hWbWciPY' \
    --error 'pO82SyWW' \
    --openidAssocHandle 'qsWRXiou' \
    --openidClaimedId 'cWyMe5cm' \
    --openidIdentity 't0KvUjbx' \
    --openidMode 'OQdesrhm' \
    --openidNs 'fQPMamwW' \
    --openidOpEndpoint 'yvWgkmRV' \
    --openidResponseNonce 'ihwiOOaJ' \
    --openidReturnTo 'v7s9G7eJ' \
    --openidSig 'GFXzVUQb' \
    --openidSigned 'XPj0FUIb' \
    --state 'KSxkyhSw' \
    > test.out 2>&1
eval_tap $? 221 'PlatformAuthenticationV3' test.out

#- 222 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'y0vwE4ri' \
    > test.out 2>&1
eval_tap $? 222 'PublicGetInputValidations' test.out

#- 223 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'PXOvVzyi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 223 'PublicGetCountryAgeRestrictionV3' test.out

#- 224 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 224 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 225 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'hIHLR5P2' \
    > test.out 2>&1
eval_tap $? 225 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 226 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'osPxSJKS' \
    --body '{"platformUserIds": ["qcLTd5Hh", "PxLEmfVs", "5HDDGd0Z"]}' \
    > test.out 2>&1
eval_tap $? 226 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 227 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OVB4B4sR' \
    --platformUserId 'WEAXv6qH' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetUserByPlatformUserIDV3' test.out

#- 228 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'DecjuO9y' \
    > test.out 2>&1
eval_tap $? 228 'PublicGetAsyncStatus' test.out

#- 229 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'r4NfiGGs' \
    --limit '80' \
    --offset '21' \
    --query 'GVukhusm' \
    > test.out 2>&1
eval_tap $? 229 'PublicSearchUserV3' test.out

#- 230 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "Xvt0huCz", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "ozdEL8AG", "policyId": "vuTwrVuI", "policyVersionId": "W5Hzlb8H"}, {"isAccepted": true, "localizedPolicyVersionId": "NgSMroVi", "policyId": "GXTGwP45", "policyVersionId": "BkdIzToA"}, {"isAccepted": false, "localizedPolicyVersionId": "irs5Oq0J", "policyId": "Ml8eB8IJ", "policyVersionId": "F8fdLVNk"}], "authType": "PyLvBFSd", "code": "EOAo2k3Y", "country": "0uPaa8wo", "dateOfBirth": "BUc6Fj0A", "displayName": "bFyEecOn", "emailAddress": "92HYNxXg", "password": "uZKzCZNs", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 230 'PublicCreateUserV3' test.out

#- 231 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'Q4Q45ycc' \
    --query '4aDVrLxA' \
    > test.out 2>&1
eval_tap $? 231 'CheckUserAvailability' test.out

#- 232 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["ucymXmOR", "adTmvPjl", "2xJR2bZ6"]}' \
    > test.out 2>&1
eval_tap $? 232 'PublicBulkGetUsers' test.out

#- 233 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "6pG1dgTE", "languageTag": "qCukejB5"}' \
    > test.out 2>&1
eval_tap $? 233 'PublicSendRegistrationCode' test.out

#- 234 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "MZTcdjfD", "emailAddress": "upPQbd8H"}' \
    > test.out 2>&1
eval_tap $? 234 'PublicVerifyRegistrationCode' test.out

#- 235 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "FNmoE3YM", "languageTag": "21XdsvI2"}' \
    > test.out 2>&1
eval_tap $? 235 'PublicForgotPasswordV3' test.out

#- 236 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'vJKeVwJb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 236 'GetAdminInvitationV3' test.out

#- 237 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId '3Pl51cKE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "QDVdGtlu", "policyId": "50mXrdeQ", "policyVersionId": "Hxqzd74p"}, {"isAccepted": true, "localizedPolicyVersionId": "IjXFYffP", "policyId": "cFRHeIIv", "policyVersionId": "hz9EwISC"}, {"isAccepted": false, "localizedPolicyVersionId": "G0khGlCh", "policyId": "NqOfBYhA", "policyVersionId": "Lq5pRg7i"}], "authType": "EMAILPASSWD", "country": "eHBwqQsQ", "dateOfBirth": "SMZTMKx2", "displayName": "O33CQpR2", "password": "9EfxBj1f", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 237 'CreateUserFromInvitationV3' test.out

#- 238 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "qR46PMse", "country": "5aZTHx9y", "dateOfBirth": "dSwcqckw", "displayName": "43e9yomQ", "languageTag": "ToQ3yxVn", "userName": "rVMWGSVq"}' \
    > test.out 2>&1
eval_tap $? 238 'UpdateUserV3' test.out

#- 239 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "4JwN1SnW", "country": "FDDdOcQG", "dateOfBirth": "U9PTWUds", "displayName": "SIhimiH1", "languageTag": "ruXPf3RI", "userName": "whWtanod"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicPartialUpdateUserV3' test.out

#- 240 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "KMH1YWsc", "emailAddress": "KAajy8HS", "languageTag": "xlfvY60j"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicSendVerificationCodeV3' test.out

#- 241 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "aaXxHh3w", "contactType": "oBb1ApPu", "languageTag": "b1LqRZ2z", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 241 'PublicUserVerificationV3' test.out

#- 242 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "jyw3WCC8", "country": "Yb5A6mTo", "dateOfBirth": "BAQ581Dq", "displayName": "W4ppvPzq", "emailAddress": "Yyvg2BIl", "password": "TMDioPzs", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 242 'PublicUpgradeHeadlessAccountV3' test.out

#- 243 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "0TKQMekd", "password": "f8GMYhGM"}' \
    > test.out 2>&1
eval_tap $? 243 'PublicVerifyHeadlessAccountV3' test.out

#- 244 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "cddUU38n", "newPassword": "ZNkTh4ae", "oldPassword": "r126ot42"}' \
    > test.out 2>&1
eval_tap $? 244 'PublicUpdatePasswordV3' test.out

#- 245 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'evgOlKrd' \
    > test.out 2>&1
eval_tap $? 245 'PublicCreateJusticeUser' test.out

#- 246 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1UNorFf1' \
    --redirectUri 'P4j4Z8mo' \
    --ticket 'gCnMil55' \
    > test.out 2>&1
eval_tap $? 246 'PublicPlatformLinkV3' test.out

#- 247 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'eqsz8Ims' \
    --body '{"platformNamespace": "wW2vcs3L"}' \
    > test.out 2>&1
eval_tap $? 247 'PublicPlatformUnlinkV3' test.out

#- 248 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0CT5D6M7' \
    > test.out 2>&1
eval_tap $? 248 'PublicPlatformUnlinkAllV3' test.out

#- 249 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3mUj4lNm' \
    --ticket 'PEcRic4U' \
    > test.out 2>&1
eval_tap $? 249 'PublicForcePlatformLinkV3' test.out

#- 250 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LtH6b8vn' \
    --clientId 'IeIT0RYO' \
    --redirectUri '44U5uRpI' \
    > test.out 2>&1
eval_tap $? 250 'PublicWebLinkPlatform' test.out

#- 251 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PkWznFNQ' \
    --state 'SYN4tnca' \
    > test.out 2>&1
eval_tap $? 251 'PublicWebLinkPlatformEstablish' test.out

#- 252 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "l3bRM4ma", "emailAddress": "K4mFMJvt", "newPassword": "UtTcHTF2"}' \
    > test.out 2>&1
eval_tap $? 252 'ResetPasswordV3' test.out

#- 253 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yiBJQ4jN' \
    > test.out 2>&1
eval_tap $? 253 'PublicGetUserByUserIdV3' test.out

#- 254 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'R6nfgHeC' \
    --activeOnly  \
    --after 'Cn73Mrzh' \
    --before 'b4wyYigt' \
    --limit '66' \
    > test.out 2>&1
eval_tap $? 254 'PublicGetUserBanHistoryV3' test.out

#- 255 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 's5mjMkB1' \
    > test.out 2>&1
eval_tap $? 255 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 256 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oW07UZpE' \
    > test.out 2>&1
eval_tap $? 256 'PublicGetUserInformationV3' test.out

#- 257 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qWTuJKpz' \
    --after '0.3277015473096564' \
    --before '0.36416847392327545' \
    --limit '48' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetUserLoginHistoriesV3' test.out

#- 258 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AidO3mAA' \
    --after 'MaCbmNPZ' \
    --before 'kbHlXAGA' \
    --limit '73' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetUserPlatformAccountsV3' test.out

#- 259 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dKEW3o89' \
    > test.out 2>&1
eval_tap $? 259 'PublicListJusticePlatformAccountsV3' test.out

#- 260 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'eaoKuqjw' \
    --body '{"platformId": "X4GyPz8v", "platformUserId": "s7Emer4P"}' \
    > test.out 2>&1
eval_tap $? 260 'PublicLinkPlatformAccount' test.out

#- 261 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'WSb5Aiv1' \
    --body '{"chosenNamespaces": ["OC5JpgSg", "2BB8eiaH", "CR9JjhVp"], "requestId": "WmoJ8Ppr"}' \
    > test.out 2>&1
eval_tap $? 261 'PublicForceLinkPlatformWithProgression' test.out

#- 262 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pfmlx3Mj' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetPublisherUserV3' test.out

#- 263 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'H8OD34cg' \
    --password 'EG7UkWZ6' \
    > test.out 2>&1
eval_tap $? 263 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 264 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'ByZVQH5z' \
    --before 'RwtcKWwf' \
    --isWildcard  \
    --limit '73' \
    > test.out 2>&1
eval_tap $? 264 'PublicGetRolesV3' test.out

#- 265 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'dzx94SjX' \
    > test.out 2>&1
eval_tap $? 265 'PublicGetRoleV3' test.out

#- 266 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 266 'PublicGetMyUserV3' test.out

#- 267 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "tCsfi97K"}' \
    > test.out 2>&1
eval_tap $? 267 'PublicSendVerificationLinkV3' test.out

#- 268 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'yHb24K44' \
    > test.out 2>&1
eval_tap $? 268 'PublicVerifyUserByLinkV3' test.out

#- 269 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'mQpQsxqm' \
    --code 'mQGdzkzX' \
    --error 'T9RL9kXr' \
    --state 'IhqUQ4uZ' \
    > test.out 2>&1
eval_tap $? 269 'PlatformAuthenticateSAMLV3Handler' test.out

#- 270 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId '7WySTXEd' \
    --payload 'RT7YDCu0' \
    > test.out 2>&1
eval_tap $? 270 'LoginSSOClient' test.out

#- 271 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'AzEz5hoM' \
    > test.out 2>&1
eval_tap $? 271 'LogoutSSOClient' test.out

#- 272 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code '9j40aBIr' \
    > test.out 2>&1
eval_tap $? 272 'RequestGameTokenResponseV3' test.out

#- 273 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VBZkzfPt' \
    > test.out 2>&1
eval_tap $? 273 'AdminGetDevicesByUserV4' test.out

#- 274 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'RUTqA5hl' \
    --endDate 'QFWM2zeK' \
    --limit '72' \
    --offset '26' \
    --startDate 'OeyVbj5X' \
    > test.out 2>&1
eval_tap $? 274 'AdminGetBannedDevicesV4' test.out

#- 275 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DlQwZamc' \
    > test.out 2>&1
eval_tap $? 275 'AdminGetUserDeviceBansV4' test.out

#- 276 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "UX5iTzDR", "deviceId": "S6dj0srR", "deviceType": "OdCUY9Ev", "enabled": true, "endDate": "0p4W2epx", "ext": {"2Ce72OIq": {}, "hobBji7k": {}, "JTFaryQk": {}}, "reason": "uBJoKRwi"}' \
    > test.out 2>&1
eval_tap $? 276 'AdminBanDeviceV4' test.out

#- 277 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'YrFbFTXJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 277 'AdminGetDeviceBanV4' test.out

#- 278 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'XrWOnq7t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 278 'AdminUpdateDeviceBanV4' test.out

#- 279 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'D1pxqZ5Q' \
    --startDate 'IHHsWS2h' \
    --deviceType 'UBgIjhSg' \
    > test.out 2>&1
eval_tap $? 279 'AdminGenerateReportV4' test.out

#- 280 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDeviceTypesV4' test.out

#- 281 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'mTn5Pdz8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 281 'AdminGetDeviceBansV4' test.out

#- 282 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'MzhAwggO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 282 'AdminDecryptDeviceV4' test.out

#- 283 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'nlmnSaYE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 283 'AdminUnbanDeviceV4' test.out

#- 284 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'zpVRd1Wc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'AdminGetUsersByDeviceV4' test.out

#- 285 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 49}' \
    > test.out 2>&1
eval_tap $? 285 'AdminCreateTestUsersV4' test.out

#- 286 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["hY7kU7cP", "QIeqG6Y9", "pGYRN2Za"]}' \
    > test.out 2>&1
eval_tap $? 286 'AdminBulkCheckValidUserIDV4' test.out

#- 287 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xxu9Aei7' \
    --body '{"avatarUrl": "eyAjb1bM", "country": "aHqGzpmR", "dateOfBirth": "t4vsjx9m", "displayName": "JvItuDmO", "languageTag": "z2OyFzJV", "userName": "AJC4pysk"}' \
    > test.out 2>&1
eval_tap $? 287 'AdminUpdateUserV4' test.out

#- 288 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'q2Jl3VYq' \
    --body '{"code": "ctMpgUi2", "emailAddress": "058Lx1Fe"}' \
    > test.out 2>&1
eval_tap $? 288 'AdminUpdateUserEmailAddressV4' test.out

#- 289 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M62YEXVx' \
    > test.out 2>&1
eval_tap $? 289 'AdminDisableUserMFAV4' test.out

#- 290 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 's8dJAnud' \
    > test.out 2>&1
eval_tap $? 290 'AdminListUserRolesV4' test.out

#- 291 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hhp47P38' \
    --body '{"assignedNamespaces": ["CgVVM2dB", "9NIsJx2Q", "FcddVPUO"], "roleId": "VYVK0EPs"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminUpdateUserRoleV4' test.out

#- 292 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PGr2Lw8c' \
    --body '{"assignedNamespaces": ["OqdnNEww", "TaOXF4id", "oswLfoPU"], "roleId": "SdUuw6VJ"}' \
    > test.out 2>&1
eval_tap $? 292 'AdminAddUserRoleV4' test.out

#- 293 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zc94kGbo' \
    --body '{"assignedNamespaces": ["Piglb7pg", "LwANMTUd", "4YEwsbIA"], "roleId": "yAX5qB0b"}' \
    > test.out 2>&1
eval_tap $? 293 'AdminRemoveUserRoleV4' test.out

#- 294 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '21' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 294 'AdminGetRolesV4' test.out

#- 295 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "I84dYvyr"}' \
    > test.out 2>&1
eval_tap $? 295 'AdminCreateRoleV4' test.out

#- 296 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'FfYYN0Ye' \
    > test.out 2>&1
eval_tap $? 296 'AdminGetRoleV4' test.out

#- 297 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'ZbY2rSnY' \
    > test.out 2>&1
eval_tap $? 297 'AdminDeleteRoleV4' test.out

#- 298 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'OelOsKLf' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "WpJLAslU"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateRoleV4' test.out

#- 299 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'rjwRwjwT' \
    --body '{"permissions": [{"action": 37, "resource": "yR0Dxw1J", "schedAction": 7, "schedCron": "qQeZcdWH", "schedRange": ["wLYbVu7q", "sSphOqZe", "slZHfx9p"]}, {"action": 79, "resource": "v6BYd2iZ", "schedAction": 11, "schedCron": "qGYwp2vg", "schedRange": ["kyS0DsrC", "f0IZ6MOt", "F4cqKJnL"]}, {"action": 78, "resource": "i7PfJmY1", "schedAction": 54, "schedCron": "SzS5j0Nx", "schedRange": ["LSfJfJpr", "bPL4Lg00", "xw7Z2LPy"]}]}' \
    > test.out 2>&1
eval_tap $? 299 'AdminUpdateRolePermissionsV4' test.out

#- 300 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'bUjR7jvy' \
    --body '{"permissions": [{"action": 40, "resource": "rk35mg4D", "schedAction": 53, "schedCron": "ILTd4REK", "schedRange": ["MaDzIFid", "M1dWFjoh", "uhKePsdp"]}, {"action": 7, "resource": "4uapyaIf", "schedAction": 24, "schedCron": "WrLruqXc", "schedRange": ["WhAlIGwQ", "W8ZcoECN", "HAizvr5z"]}, {"action": 83, "resource": "9WsOPcAl", "schedAction": 89, "schedCron": "Tr5nfUwb", "schedRange": ["7Mh7OKdc", "FLx8122N", "PRUJSZI7"]}]}' \
    > test.out 2>&1
eval_tap $? 300 'AdminAddRolePermissionsV4' test.out

#- 301 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'MsV3PDWG' \
    --body '["qrPrIrtm", "VikjZJFJ", "gfyibZYD"]' \
    > test.out 2>&1
eval_tap $? 301 'AdminDeleteRolePermissionsV4' test.out

#- 302 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'IFzMHz2A' \
    --after '7wixvP35' \
    --before 'BbFZih27' \
    --limit '36' \
    > test.out 2>&1
eval_tap $? 302 'AdminListAssignedUsersV4' test.out

#- 303 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'BtDcB93v' \
    --body '{"assignedNamespaces": ["2sp2pavk", "vIi7u8Bp", "cRZ1GoPo"], "namespace": "6QmVwWRj", "userId": "jh0splzJ"}' \
    > test.out 2>&1
eval_tap $? 303 'AdminAssignUserToRoleV4' test.out

#- 304 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'bimKhhPK' \
    --body '{"namespace": "g2fbwY6x", "userId": "ky7C6OVr"}' \
    > test.out 2>&1
eval_tap $? 304 'AdminRevokeUserFromRoleV4' test.out

#- 305 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "5QW7raI7", "country": "xK0QFj1q", "dateOfBirth": "TSDpAX2L", "displayName": "PAHzLyNQ", "languageTag": "YALVb4UV", "userName": "syqpxFv8"}' \
    > test.out 2>&1
eval_tap $? 305 'AdminUpdateMyUserV4' test.out

#- 306 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 306 'AdminDisableMyAuthenticatorV4' test.out

#- 307 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '6htowswt' \
    > test.out 2>&1
eval_tap $? 307 'AdminEnableMyAuthenticatorV4' test.out

#- 308 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 308 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 309 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 309 'AdminGetMyBackupCodesV4' test.out

#- 310 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 310 'AdminGenerateMyBackupCodesV4' test.out

#- 311 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 311 'AdminDisableMyBackupCodesV4' test.out

#- 312 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 312 'AdminDownloadMyBackupCodesV4' test.out

#- 313 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 313 'AdminEnableMyBackupCodesV4' test.out

#- 314 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 314 'AdminSendMyMFAEmailCodeV4' test.out

#- 315 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 315 'AdminDisableMyEmailV4' test.out

#- 316 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'X5qiGRB3' \
    > test.out 2>&1
eval_tap $? 316 'AdminEnableMyEmailV4' test.out

#- 317 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 317 'AdminGetMyEnabledFactorsV4' test.out

#- 318 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'KoWfbSXM' \
    > test.out 2>&1
eval_tap $? 318 'AdminMakeFactorMyDefaultV4' test.out

#- 319 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["7cA3YPlp", "3l1e5lU9", "nVcF2YFH"], "emailAddresses": ["WzbDeZvZ", "cQCxi7zb", "gVcH05F0"], "isAdmin": true, "roleId": "xCyQ2pJN"}' \
    > test.out 2>&1
eval_tap $? 319 'AdminInviteUserV4' test.out

#- 320 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "wkbwcoag", "policyId": "68Xr9OwK", "policyVersionId": "QV2qjpov"}, {"isAccepted": false, "localizedPolicyVersionId": "3XfNd9Xj", "policyId": "5nuvwN15", "policyVersionId": "2BYADgZJ"}, {"isAccepted": true, "localizedPolicyVersionId": "fHQYOLqO", "policyId": "BjvJ7It5", "policyVersionId": "v5nSAajP"}], "authType": "EMAILPASSWD", "country": "nhWMYvZH", "dateOfBirth": "S6b47f5V", "displayName": "hxjVoRvp", "emailAddress": "nOmDvRtB", "password": "WWb6y5uL", "passwordMD5Sum": "gl4YUkgw", "username": "wSkl5aTx", "verified": true}' \
    > test.out 2>&1
eval_tap $? 320 'PublicCreateTestUserV4' test.out

#- 321 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "6VopqknK", "policyId": "HYAbOLjG", "policyVersionId": "wl3acCaN"}, {"isAccepted": true, "localizedPolicyVersionId": "hRHnB4sE", "policyId": "xMY83YcK", "policyVersionId": "7pDoBLHl"}, {"isAccepted": false, "localizedPolicyVersionId": "Pj2VzHdO", "policyId": "PEjCefpI", "policyVersionId": "nvNgmlgr"}], "authType": "EMAILPASSWD", "code": "QiFWgtGo", "country": "Lqo4M6H5", "dateOfBirth": "rcHXNPro", "displayName": "lhXsDHmQ", "emailAddress": "1MZ3UJC3", "password": "7YfDtb6o", "passwordMD5Sum": "KEpxH7L6", "reachMinimumAge": false, "username": "BnUkhC6f"}' \
    > test.out 2>&1
eval_tap $? 321 'PublicCreateUserV4' test.out

#- 322 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'sKN1wonG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "rMIRYKpN", "policyId": "6gjo4T2T", "policyVersionId": "hKFOr3HV"}, {"isAccepted": true, "localizedPolicyVersionId": "9AOx4f4s", "policyId": "eXFH2Pom", "policyVersionId": "3G82YtHs"}, {"isAccepted": true, "localizedPolicyVersionId": "GoU2jC1P", "policyId": "duIiyrfy", "policyVersionId": "O7Zgmx5X"}], "authType": "EMAILPASSWD", "country": "7BYiGuh9", "dateOfBirth": "zNENIa13", "displayName": "s7u6HdbH", "password": "thNnzSc2", "reachMinimumAge": true, "username": "GCvs1YeS"}' \
    > test.out 2>&1
eval_tap $? 322 'CreateUserFromInvitationV4' test.out

#- 323 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "sArYHX8R", "country": "KLHbQ5G5", "dateOfBirth": "cquUBBHO", "displayName": "ekrD89dY", "languageTag": "MnrOUdfX", "userName": "5IM2MKkm"}' \
    > test.out 2>&1
eval_tap $? 323 'PublicUpdateUserV4' test.out

#- 324 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "6lkP9b3t", "emailAddress": "8XndK8SX"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicUpdateUserEmailAddressV4' test.out

#- 325 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "2UF0V2QE", "country": "dBe4yXfh", "dateOfBirth": "YKWpAr0Q", "displayName": "fNU7fnDJ", "emailAddress": "8DPYCq3u", "password": "jwLIyePO", "reachMinimumAge": true, "username": "Ble5bqoz", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 325 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 326 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "XNyf54jA", "password": "XwH1LXfX", "username": "uOqG52Wk"}' \
    > test.out 2>&1
eval_tap $? 326 'PublicUpgradeHeadlessAccountV4' test.out

#- 327 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 327 'PublicDisableMyAuthenticatorV4' test.out

#- 328 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'BmAF8CbF' \
    > test.out 2>&1
eval_tap $? 328 'PublicEnableMyAuthenticatorV4' test.out

#- 329 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 329 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 330 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 330 'PublicGetMyBackupCodesV4' test.out

#- 331 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 331 'PublicGenerateMyBackupCodesV4' test.out

#- 332 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 332 'PublicDisableMyBackupCodesV4' test.out

#- 333 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 333 'PublicDownloadMyBackupCodesV4' test.out

#- 334 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 334 'PublicEnableMyBackupCodesV4' test.out

#- 335 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'vdG4moVi' \
    > test.out 2>&1
eval_tap $? 335 'PublicRemoveTrustedDeviceV4' test.out

#- 336 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 336 'PublicSendMyMFAEmailCodeV4' test.out

#- 337 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 337 'PublicDisableMyEmailV4' test.out

#- 338 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'zc6RyG0b' \
    > test.out 2>&1
eval_tap $? 338 'PublicEnableMyEmailV4' test.out

#- 339 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 339 'PublicGetMyEnabledFactorsV4' test.out

#- 340 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'Wx3WTLcI' \
    > test.out 2>&1
eval_tap $? 340 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE