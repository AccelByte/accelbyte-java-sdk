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
echo "1..348"

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
    --body '[{"field": "EAxcVpFr", "validation": {"allowAllSpecialCharacters": true, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "blockedWord": ["IRdH9UzV", "RiXbqlAw", "7r6W2ktQ"], "description": [{"language": "G0h5JAav", "message": ["5kRa62Wo", "pBJHPtcD", "s8bBZLCX"]}, {"language": "Lx8bbgor", "message": ["QeFbQ1g7", "qbPngUNB", "1vRodwpz"]}, {"language": "S6DaDpv8", "message": ["N7ZQVqGj", "6oDLjWjk", "Y1aXlFcD"]}], "isCustomRegex": true, "letterCase": "78NY4YkH", "maxLength": 37, "maxRepeatingAlphaNum": 40, "maxRepeatingSpecialCharacter": 4, "minCharType": 100, "minLength": 27, "regex": "EIC32ogW", "specialCharacterLocation": "7olvbTgr", "specialCharacters": ["hRTcPiSu", "L0Sly6XM", "4OI18mAQ"]}}, {"field": "LnzjMf8G", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "blockedWord": ["jJW2OQNO", "s1PXhT5F", "vdiRilZ7"], "description": [{"language": "oFgx4c8O", "message": ["umKtPDKJ", "DXn7Z4U6", "8su8Xfql"]}, {"language": "qNiTvB6S", "message": ["dAdIhUDr", "woZ5Mecd", "Ki5r6QEa"]}, {"language": "1ysLEzth", "message": ["6mXhzkzW", "kFeZSoEA", "cBdW19m4"]}], "isCustomRegex": false, "letterCase": "7CkyF6C7", "maxLength": 7, "maxRepeatingAlphaNum": 96, "maxRepeatingSpecialCharacter": 41, "minCharType": 26, "minLength": 42, "regex": "iTqpyhPF", "specialCharacterLocation": "dxLzFQN0", "specialCharacters": ["5MYzYiKW", "e5dNRljv", "7IPrDQQR"]}}, {"field": "gat0Sevk", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "blockedWord": ["uI9a2I9u", "6Vpbsx5w", "8hqUI06U"], "description": [{"language": "pOXGSLmC", "message": ["VuHOPlLl", "kvR8sKgn", "uRkgghGo"]}, {"language": "YupD391C", "message": ["2qtPYoka", "hFjkQsfC", "aTmt1d67"]}, {"language": "FXGk2s9Q", "message": ["0mPVo3tw", "u0MesTCf", "9x4rt69l"]}], "isCustomRegex": false, "letterCase": "aRlxfcjH", "maxLength": 11, "maxRepeatingAlphaNum": 85, "maxRepeatingSpecialCharacter": 51, "minCharType": 0, "minLength": 21, "regex": "MbwL6IY6", "specialCharacterLocation": "9z1UaLqY", "specialCharacters": ["SYWytLPz", "iZMdjxcB", "ZufQxGiH"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'PllG4cYE' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'zfTD1ZBm' \
    --before '3MqHcUmL' \
    --limit '70' \
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
    --body '{"ageRestriction": 69, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'trkmu0hp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 60}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'n9HrNQy4' \
    --limit '43' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "AAiE0mit", "comment": "9RGCCHYz", "endDate": "UOcEdscK", "reason": "HPEqgA8y", "skipNotif": true, "userIds": ["o7TTr1Dm", "rhZv15T7", "quIOvBMc"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "aYmvCkGZ", "userId": "5dAgqxpB"}, {"banId": "FmaLoxoz", "userId": "r6wfNPX2"}, {"banId": "bOItRMvq", "userId": "tlB2jJCS"}]}' \
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
    --clientId 'QT279ZZP' \
    --clientName 'YGu0rdlg' \
    --clientType 'dWyOtXi3' \
    --limit '5' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["hoQrpOsD", "BU5SepjC", "hB3V0v52"], "baseUri": "Dlym6puQ", "clientId": "23xoJ8ae", "clientName": "CnaLpUKp", "clientPermissions": [{"action": 27, "resource": "4YUDjasW", "schedAction": 70, "schedCron": "a3bMrXsD", "schedRange": ["r6kILsSS", "yDdmykmo", "PYgc2L4j"]}, {"action": 22, "resource": "oCMNqq98", "schedAction": 92, "schedCron": "pf4IxjUk", "schedRange": ["l535X3at", "eEKDpADz", "1x3poD3Q"]}, {"action": 14, "resource": "32e8c5cs", "schedAction": 92, "schedCron": "MzH7Qm8b", "schedRange": ["wbmXgdAP", "h1EThG96", "gAFKK2WD"]}], "clientPlatform": "gCcxvONZ", "deletable": false, "description": "ThuwjRHp", "namespace": "KKTlmVr9", "oauthAccessTokenExpiration": 42, "oauthAccessTokenExpirationTimeUnit": "6pf3vneS", "oauthClientType": "D2Tb3g7m", "oauthRefreshTokenExpiration": 92, "oauthRefreshTokenExpirationTimeUnit": "tu7LQREN", "parentNamespace": "jEEztx1W", "redirectUri": "sYSiZqan", "scopes": ["0nSBJroa", "v91GXlvP", "G6bFYReV"], "secret": "HQipcCx9", "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'w5D2L7vI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'YhGGSyEW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId '4ZJJ42d3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["PBddN8S4", "8l9lyNAp", "flxqMrj3"], "baseUri": "oZk03QXc", "clientName": "KMDYDDxH", "clientPermissions": [{"action": 92, "resource": "OMlNFSrU", "schedAction": 63, "schedCron": "8f7Gc26S", "schedRange": ["aiGVkydw", "YWQG26yU", "ZNmTBcvr"]}, {"action": 3, "resource": "cSDG8aMV", "schedAction": 67, "schedCron": "yPLtI8il", "schedRange": ["byDPUIj8", "8cekdqCt", "81P1ktfI"]}, {"action": 29, "resource": "meIP6rOv", "schedAction": 61, "schedCron": "cJcHm3SZ", "schedRange": ["LxoRDFuu", "uySj29a9", "LJE8HoRS"]}], "clientPlatform": "1X2PFAAM", "deletable": true, "description": "CmBUqg2S", "namespace": "CnqntX9y", "oauthAccessTokenExpiration": 60, "oauthAccessTokenExpirationTimeUnit": "aZSWMiVi", "oauthRefreshTokenExpiration": 76, "oauthRefreshTokenExpirationTimeUnit": "0sG6vxkf", "redirectUri": "UcmqRRbc", "scopes": ["eJ5i0EeD", "xOgBnhhq", "ElIaDml4"], "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'wdNFLTm5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 94, "resource": "at2vQR3b"}, {"action": 16, "resource": "fH2rtOa4"}, {"action": 62, "resource": "RE2w1yEk"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'Lgh3tIYt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 40, "resource": "SqYUTLDx"}, {"action": 78, "resource": "gIiDandp"}, {"action": 67, "resource": "8y2wNhmw"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '29' \
    --clientId 'h5eC3IHe' \
    --namespace "$AB_NAMESPACE" \
    --resource 'HSKLCa3x' \
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
    --limit '36' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'eNDUWehw' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'H3q31A80' \
    --body '{"ACSURL": "6DJgas4b", "AWSCognitoRegion": "6z3LNUj7", "AWSCognitoUserPool": "fdgLA84Z", "AllowedClients": ["8YYk6QEg", "JjBbEDoN", "f3n0hEoR"], "AppId": "CAcf80zf", "AuthorizationEndpoint": "FyabWAgI", "ClientId": "UXiI07A6", "Environment": "8eaqC2J9", "FederationMetadataURL": "jyEW6GLb", "GenericOauthFlow": false, "IsActive": false, "Issuer": "NaKDUL3s", "JWKSEndpoint": "a13lk1dQ", "KeyID": "BHO86IlB", "NetflixCertificates": {"encryptedPrivateKey": "hnetU4Rw", "encryptedPrivateKeyName": "TqUXlTDB", "publicCertificate": "zOuYsaZA", "publicCertificateName": "2yyd4mbq", "rootCertificate": "oOfADMMA", "rootCertificateName": "XFaY9eKa"}, "OrganizationId": "699bRVhy", "PlatformName": "aKwwrAP2", "RedirectUri": "aMlu7Wtj", "RegisteredDomains": [{"affectedClientIDs": ["CtoYetOO", "847g8Oud", "OfjnCuHZ"], "domain": "3c46IjGa", "namespaces": ["23YvYmmD", "g7VYPXIu", "vUYTZBRu"], "roleId": "jIUE1Tq5"}, {"affectedClientIDs": ["jyAZvkRC", "MNFIurjh", "2imdb4rb"], "domain": "kXj0ZwsV", "namespaces": ["C0gL97ZV", "JSPqJiwv", "1qlYB1RS"], "roleId": "Ks6gQxC3"}, {"affectedClientIDs": ["Gb7S0o4z", "GYY7KQI1", "AeFgPqaO"], "domain": "kvo1aolB", "namespaces": ["4lkKB4EY", "OkQ1jMD3", "cym8xIfk"], "roleId": "OVW2grRE"}], "Secret": "OLx0KOww", "TeamID": "3HICQLfl", "TokenAuthenticationType": "7MUBG7qt", "TokenClaimsMapping": {"Pu64yAtU": "RKLRkb73", "8HGS6rDg": "MdIIlhS1", "fSiM9331": "m7Ta1PsK"}, "TokenEndpoint": "c50Kv6ec", "UserInfoEndpoint": "nEevcAx2", "UserInfoHTTPMethod": "K2zkRenm", "scopes": ["PZnGBt4P", "7WnbdSJt", "jX7ZshZy"]}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Zl5x4bRX' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BHUTrDzZ' \
    --body '{"ACSURL": "SKscfOcY", "AWSCognitoRegion": "u3dpCROY", "AWSCognitoUserPool": "qUiGKXVF", "AllowedClients": ["Cmpo6sPw", "VOEDSJsE", "K5QpNhlI"], "AppId": "2iS5EpGh", "AuthorizationEndpoint": "hvXYck0u", "ClientId": "pMzUYnb7", "Environment": "6tFkEORV", "FederationMetadataURL": "3bu1bNCt", "GenericOauthFlow": true, "IsActive": true, "Issuer": "0V6Do5sY", "JWKSEndpoint": "adCCFrHH", "KeyID": "C3DpZxkr", "NetflixCertificates": {"encryptedPrivateKey": "QDXuNFvi", "encryptedPrivateKeyName": "Marv8mnf", "publicCertificate": "HK8CCmE2", "publicCertificateName": "lPnsbD3S", "rootCertificate": "GEdlwuUc", "rootCertificateName": "cE536ugB"}, "OrganizationId": "p3HBvepn", "PlatformName": "DCjgyJlX", "RedirectUri": "e36mgWjL", "RegisteredDomains": [{"affectedClientIDs": ["fFmteue9", "nzJ6fH24", "T805tVg8"], "domain": "JqU0jZpj", "namespaces": ["vsugAOS7", "u8RiWyer", "CSa8SRgw"], "roleId": "sAj1ik1j"}, {"affectedClientIDs": ["glaDXTvK", "CWwNTAhd", "2wrS0uPd"], "domain": "jhdinpng", "namespaces": ["5BLy8wbh", "MssAHjap", "IkY9Rf4w"], "roleId": "P57dBZNR"}, {"affectedClientIDs": ["88YbCtmK", "y8M9zVrj", "fGXZnqAQ"], "domain": "UoY1GjlI", "namespaces": ["Ik0iKoTT", "S1j02o7J", "jTXAQN0q"], "roleId": "dskdQV0T"}], "Secret": "qI8EFnmD", "TeamID": "bxIxi4YK", "TokenAuthenticationType": "lONk2Q5Y", "TokenClaimsMapping": {"4Jvaizwi": "ilatuUjj", "t9lIMGql": "5ElEa9EI", "IlGcHB3C": "fR3ncDlw"}, "TokenEndpoint": "i3v3MFFJ", "UserInfoEndpoint": "1KesKoEL", "UserInfoHTTPMethod": "CpobBEG8", "scopes": ["X645xpdX", "pai0rYaT", "5hOPjaf3"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'H0tYighU' \
    --body '{"affectedClientIDs": ["0VUfcYHJ", "bBfAKSiP", "W3VgsZXi"], "assignedNamespaces": ["R1DJ7HVW", "qMkNSawQ", "UWDFJvJB"], "domain": "Wic7UkBe", "roleId": "IXuqDuAX"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'I66bQ71w' \
    --body '{"domain": "0deoV9Lx"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '5RDA1l2X' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'crciYNEz' \
    --body '{"acsUrl": "vSZIPkhS", "apiKey": "gORcz5S5", "appId": "BvmgBLxh", "federationMetadataUrl": "4ijFnE3T", "isActive": false, "redirectUri": "Q7M6Nzy1", "secret": "adnSKOLF", "ssoUrl": "Kx1dX4Lu"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WJu3pDMU' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'AeeZ97SB' \
    --body '{"acsUrl": "ROPYuG6X", "apiKey": "qP6oo7G7", "appId": "3zdxTgOf", "federationMetadataUrl": "nwIdlNa2", "isActive": false, "redirectUri": "OJhtafxM", "secret": "SJlHeb34", "ssoUrl": "sZKHcl5L"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LLOexL4f' \
    --platformUserId 'ZvWtND2t' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'cBFpX8lN' \
    --after '40' \
    --before '72' \
    --limit '64' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'Cf2XJVrl' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["zqQls1oz", "hLVA3kE8", "jKvgatOE"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["BM70TdlN", "BJYOmpu1", "VCarzBsV"], "isAdmin": true, "namespace": "xnZ5Jrzz", "roles": ["jrcaug6C", "WVG8SWP3", "glU6musw"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '87' \
    --platformUserId 'JnNnN7kA' \
    --platformId 'a7j0riFc' \
    > test.out 2>&1
eval_tap $? 146 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 147 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 147 'AdminListUsersV3' test.out

#- 148 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'NJOIG36I' \
    --endDate '6tRbRcrE' \
    --limit '44' \
    --offset '33' \
    --platformBy 'eMdAdiPK' \
    --platformId 'DUVSC00P' \
    --query 'YeDcaggi' \
    --startDate 'nxnFIna3' \
    > test.out 2>&1
eval_tap $? 148 'AdminSearchUserV3' test.out

#- 149 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["yddcbsPh", "eTH26IUJ", "NvYuGRUv"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetBulkUserByEmailAddressV3' test.out

#- 150 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pZaHCuES' \
    > test.out 2>&1
eval_tap $? 150 'AdminGetUserByUserIdV3' test.out

#- 151 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OiIZsMfB' \
    --body '{"avatarUrl": "4ZH3mtgW", "country": "gU4pCAKx", "dateOfBirth": "eE70Caun", "displayName": "QNxot371", "languageTag": "W9G4AvQk", "userName": "qsGnmyo5"}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserV3' test.out

#- 152 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JJTUVmb8' \
    --activeOnly  \
    --after 'GEXFTlEM' \
    --before 'EsFzYqwg' \
    --limit '75' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetUserBanV3' test.out

#- 153 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dkocVTd4' \
    --body '{"ban": "BxqGWV6m", "comment": "TJ0sQs6X", "endDate": "NbjvqhnU", "reason": "VLWu8olK", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 153 'AdminBanUserV3' test.out

#- 154 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'AKY7Cbgs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WqFWZX7k' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 154 'AdminUpdateUserBanV3' test.out

#- 155 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'emPYdYT7' \
    --body '{"context": "DROCjtuz", "emailAddress": "FMbAG9YI", "languageTag": "89hmguB8"}' \
    > test.out 2>&1
eval_tap $? 155 'AdminSendVerificationCodeV3' test.out

#- 156 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FOTjMLo4' \
    --body '{"Code": "b9rIzqYk", "ContactType": "EpstyVTB", "LanguageTag": "crM8rG0r", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 156 'AdminVerifyAccountV3' test.out

#- 157 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'zcswwVeM' \
    > test.out 2>&1
eval_tap $? 157 'GetUserVerificationCode' test.out

#- 158 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'K6MbGIVI' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserDeletionStatusV3' test.out

#- 159 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'u8vvwLc7' \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpdateUserDeletionStatusV3' test.out

#- 160 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3uVoJXTI' \
    --body '{"code": "MtpgkieD", "country": "yF97lGdM", "dateOfBirth": "iHKxbWCY", "displayName": "zo8yO2KT", "emailAddress": "K9tmmOnY", "password": "nOpas6gh", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpgradeHeadlessAccountV3' test.out

#- 161 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1y4Zi7s7' \
    > test.out 2>&1
eval_tap $? 161 'AdminDeleteUserInformationV3' test.out

#- 162 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QBlk44Z4' \
    --after '0.911447630664417' \
    --before '0.43944147296893965' \
    --limit '85' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetUserLoginHistoriesV3' test.out

#- 163 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GZgKg4uK' \
    --body '{"languageTag": "xaCgcGLu", "newPassword": "C3brWdTY", "oldPassword": "CfHkIySo"}' \
    > test.out 2>&1
eval_tap $? 163 'AdminResetPasswordV3' test.out

#- 164 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'k5DiXZtL' \
    --body '{"Permissions": [{"Action": 99, "Resource": "bvhOrHfl", "SchedAction": 72, "SchedCron": "od3dNQrm", "SchedRange": ["sApRA6HX", "3RwrKt2e", "cozL0TOg"]}, {"Action": 25, "Resource": "vCE48L5o", "SchedAction": 78, "SchedCron": "MA2rG3na", "SchedRange": ["kopAywel", "u01nryEJ", "0NqoTow0"]}, {"Action": 34, "Resource": "9Sfo95Hg", "SchedAction": 21, "SchedCron": "qKhTPkwf", "SchedRange": ["LM9uSybR", "zWek2gZv", "Rrvr0n9d"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserPermissionV3' test.out

#- 165 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9lvccKML' \
    --body '{"Permissions": [{"Action": 16, "Resource": "W9dD1kOm", "SchedAction": 44, "SchedCron": "tBS3KtKZ", "SchedRange": ["We8aoFzA", "yBME74HU", "tipUWYhW"]}, {"Action": 97, "Resource": "vpcLYOWA", "SchedAction": 77, "SchedCron": "NjxOnaEo", "SchedRange": ["k4nOOCzf", "sflhjbng", "JOUn18G5"]}, {"Action": 78, "Resource": "txqMPpcV", "SchedAction": 11, "SchedCron": "40Nlncce", "SchedRange": ["IZSwgAIk", "gzh4pTU0", "Am4DZhl0"]}]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminAddUserPermissionsV3' test.out

#- 166 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bQxFJ3sW' \
    --body '[{"Action": 58, "Resource": "Xphn50c9"}, {"Action": 40, "Resource": "PFMycMSQ"}, {"Action": 20, "Resource": "qfAacR0L"}]' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionBulkV3' test.out

#- 167 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '12' \
    --namespace "$AB_NAMESPACE" \
    --resource 'OCaGBeMf' \
    --userId 'PlNos4yB' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserPermissionV3' test.out

#- 168 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RjrERHEo' \
    --after 'nAZR8GmE' \
    --before 'u0q1p6QC' \
    --limit '51' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserPlatformAccountsV3' test.out

#- 169 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'UBEU1QAO' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetListJusticePlatformAccounts' test.out

#- 170 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'HfZiGhxO' \
    --userId 'dcuDXSxS' \
    > test.out 2>&1
eval_tap $? 170 'AdminGetUserMapping' test.out

#- 171 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'c3aZPV87' \
    --userId 'pna08gxe' \
    > test.out 2>&1
eval_tap $? 171 'AdminCreateJusticeUser' test.out

#- 172 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'fTYKhuxa' \
    --body '{"platformId": "Ec7M4P7U", "platformUserId": "ckSC6ePe"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminLinkPlatformAccount' test.out

#- 173 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'N8i4GrFE' \
    --userId 'S9z7xueH' \
    --body '{"platformNamespace": "pATHccee"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformUnlinkV3' test.out

#- 174 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9GXhKcjm' \
    --userId 'SEwdrkEn' \
    --ticket 'nqKzFsLf' \
    > test.out 2>&1
eval_tap $? 174 'AdminPlatformLinkV3' test.out

#- 175 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YalUlfwE' \
    --userId 'QKjU7eHG' \
    --platformToken 'ebSVu0LQ' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 176 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '40kepEaC' \
    --body '["4dfiOMZf", "EhHr39py", "sFO3Zvc1"]' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserRolesV3' test.out

#- 177 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BZG99Lyv' \
    --body '[{"namespace": "fvHEsJKQ", "roleId": "QewVLMUo"}, {"namespace": "AnaRcYp7", "roleId": "FUjfIGaf"}, {"namespace": "foflEIBy", "roleId": "YqeKN0me"}]' \
    > test.out 2>&1
eval_tap $? 177 'AdminSaveUserRoleV3' test.out

#- 178 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'GelYF5wW' \
    --userId 'aDhukU4k' \
    > test.out 2>&1
eval_tap $? 178 'AdminAddUserRoleV3' test.out

#- 179 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'hGG4vZFT' \
    --userId 'YnPkmSu4' \
    > test.out 2>&1
eval_tap $? 179 'AdminDeleteUserRoleV3' test.out

#- 180 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PWam1jxR' \
    --body '{"enabled": true, "reason": "ETWjteoc"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateUserStatusV3' test.out

#- 181 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8fgvZDDh' \
    > test.out 2>&1
eval_tap $? 181 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 182 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'oO05oKqy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "mxLD1Lcv"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateClientSecretV3' test.out

#- 183 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'w6T6mZEi' \
    --before 'wxxElpMY' \
    --isWildcard  \
    --limit '91' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRolesV3' test.out

#- 184 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "managers": [{"displayName": "jhTHeh94", "namespace": "TSenE5hC", "userId": "FkIf5weq"}, {"displayName": "Z18MH57l", "namespace": "2Zsrh90E", "userId": "TtYmGukz"}, {"displayName": "3MnlrjcH", "namespace": "p6B8Vj7r", "userId": "XFgDnDkd"}], "members": [{"displayName": "Z9bpjb1t", "namespace": "dA3QhjCM", "userId": "W64f4XhI"}, {"displayName": "jSoTB2NM", "namespace": "KtezapPr", "userId": "2QEPx3zT"}, {"displayName": "xBGtEJIY", "namespace": "ppuUSsKo", "userId": "Hw2hyd12"}], "permissions": [{"action": 41, "resource": "GO0dW8rX", "schedAction": 8, "schedCron": "MVUGKSZ4", "schedRange": ["GcLkt4pK", "32sJxlZc", "CTpTdRtC"]}, {"action": 69, "resource": "cunsS1ln", "schedAction": 0, "schedCron": "mSLyn50s", "schedRange": ["igBVZxiK", "dV57GvRy", "d9UuL02L"]}, {"action": 8, "resource": "sf5y1Jsx", "schedAction": 72, "schedCron": "d4M1F5qR", "schedRange": ["IblS7Nz8", "1GRazPAA", "NjfBoldF"]}], "roleName": "OyqA2clJ"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminCreateRoleV3' test.out

#- 185 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId '5gEOaCgM' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleV3' test.out

#- 186 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId '6Yn6Rugb' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteRoleV3' test.out

#- 187 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'NEIpGBFU' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "On5mM7k8"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateRoleV3' test.out

#- 188 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'nbLzvtCI' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleAdminStatusV3' test.out

#- 189 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'W5ynMKqu' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpdateAdminRoleStatusV3' test.out

#- 190 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'UicAeIVX' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleAdminV3' test.out

#- 191 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'toWAXhMl' \
    --after 'W4tLqX7O' \
    --before 'ICf5oD1e' \
    --limit '67' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetRoleManagersV3' test.out

#- 192 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'oI9FmYel' \
    --body '{"managers": [{"displayName": "0kOw72o8", "namespace": "Zkgk0jS6", "userId": "rDWUwfhK"}, {"displayName": "vrf2AaH4", "namespace": "yCWrHSpp", "userId": "nIZkNnTn"}, {"displayName": "3rzH5NvA", "namespace": "tcvNedgS", "userId": "1fUfKmih"}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRoleManagersV3' test.out

#- 193 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'Dbmu8ePW' \
    --body '{"managers": [{"displayName": "lQMVDXEH", "namespace": "eiGTnwyE", "userId": "w6hIWDZr"}, {"displayName": "pP7rz3IS", "namespace": "W510kHr4", "userId": "isTKWjmv"}, {"displayName": "67nuHCXW", "namespace": "fwnwGioV", "userId": "wVzmmBVV"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminRemoveRoleManagersV3' test.out

#- 194 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'Ffpqx1Ae' \
    --after 'LtzcPJ3j' \
    --before 'tDYBo4FU' \
    --limit '94' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetRoleMembersV3' test.out

#- 195 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'z95OYKiq' \
    --body '{"members": [{"displayName": "aZD63xe5", "namespace": "rruJVfLG", "userId": "ea0ZtlzU"}, {"displayName": "cuHAXz0U", "namespace": "V31MfuGa", "userId": "XsAuGsZa"}, {"displayName": "SHevO0TQ", "namespace": "NEI3kfab", "userId": "xJWWSI1E"}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddRoleMembersV3' test.out

#- 196 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'CUo1NPpe' \
    --body '{"members": [{"displayName": "FhUztXDg", "namespace": "B7n4C97u", "userId": "APP8PATL"}, {"displayName": "pUpxeJls", "namespace": "BJT6Hh3O", "userId": "MjAjq2mK"}, {"displayName": "8lbSEEel", "namespace": "xnb5QxWG", "userId": "2HFnZlA6"}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminRemoveRoleMembersV3' test.out

#- 197 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'HKWW4fI1' \
    --body '{"permissions": [{"action": 70, "resource": "JMdtwCVU", "schedAction": 36, "schedCron": "NlZkqTZr", "schedRange": ["KgXNwvm4", "e5GX6H74", "2OixhtAo"]}, {"action": 74, "resource": "X9UcOvhP", "schedAction": 50, "schedCron": "5XhnUcvW", "schedRange": ["B28Mpusu", "hhDJ5slz", "giWZEtyd"]}, {"action": 58, "resource": "6LfxnbY9", "schedAction": 93, "schedCron": "jjYgXchC", "schedRange": ["bkXX26uE", "dCfQaMAQ", "uTKfC0I2"]}]}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateRolePermissionsV3' test.out

#- 198 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'kNjCMDtD' \
    --body '{"permissions": [{"action": 79, "resource": "2DbPcaoM", "schedAction": 6, "schedCron": "hqciwIeS", "schedRange": ["hF9RKb9v", "vxuJlhXb", "WhbwPwTo"]}, {"action": 58, "resource": "Bg0tTJg4", "schedAction": 52, "schedCron": "IewOXE2A", "schedRange": ["kCh3QIZs", "Uf8lGFXc", "mwTERHcl"]}, {"action": 83, "resource": "fCjYwWkL", "schedAction": 29, "schedCron": "e18rNdb8", "schedRange": ["Otq6j1mq", "Uav7k05H", "AQltnSoj"]}]}' \
    > test.out 2>&1
eval_tap $? 198 'AdminAddRolePermissionsV3' test.out

#- 199 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'V4jT65yc' \
    --body '["lX2FtAz0", "vJjFIYWO", "aNdsimmk"]' \
    > test.out 2>&1
eval_tap $? 199 'AdminDeleteRolePermissionsV3' test.out

#- 200 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '100' \
    --resource 'rvgvEY3H' \
    --roleId 'ht1SwqTs' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteRolePermissionV3' test.out

#- 201 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 201 'AdminGetMyUserV3' test.out

#- 202 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'KKKo37NH' \
    --extendExp  \
    --redirectUri 'DOQe91Ps' \
    --password '3ztUIV0d' \
    --requestId 'S6hIH9c4' \
    --userName 'Vfkyrwpu' \
    > test.out 2>&1
eval_tap $? 202 'UserAuthenticationV3' test.out

#- 203 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'XxbaERbf' \
    --linkingToken 'gPmi0eHk' \
    --password 't1mr9EOI' \
    --username 'Fg0dnWIY' \
    > test.out 2>&1
eval_tap $? 203 'AuthenticationWithPlatformLinkV3' test.out

#- 204 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'N2NVL70I' \
    > test.out 2>&1
eval_tap $? 204 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 205 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'w157g00j' \
    > test.out 2>&1
eval_tap $? 205 'RequestOneTimeLinkingCodeV3' test.out

#- 206 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'r9b8MuYm' \
    > test.out 2>&1
eval_tap $? 206 'ValidateOneTimeLinkingCodeV3' test.out

#- 207 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --clientId 'meKTmBNv' \
    --oneTimeLinkCode 'GYxEQdf3' \
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
    --clientId 'ewoGGoY7' \
    > test.out 2>&1
eval_tap $? 210 'RequestGameTokenCodeResponseV3' test.out

#- 211 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xmFNAmjD' \
    --userId 'DCvs78mc' \
    > test.out 2>&1
eval_tap $? 211 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 212 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MdiS76YA' \
    > test.out 2>&1
eval_tap $? 212 'RevokeUserV3' test.out

#- 213 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'pGJ9ufwL' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --oneTimeLinkCode 'tNquwC3W' \
    --redirectUri 'gumrIz4N' \
    --scope 'hGztZpr4' \
    --state 'U4fwQIiL' \
    --targetAuthPage 'XgmRasvj' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'O4lj8m3X' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 213 'AuthorizeV3' test.out

#- 214 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'X8qwU1cT' \
    > test.out 2>&1
eval_tap $? 214 'TokenIntrospectionV3' test.out

#- 215 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 215 'GetJWKSV3' test.out

#- 216 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'uHHPB5S3' \
    --factor 'DvPRCzBr' \
    --mfaToken 'VUxmDOj3' \
    > test.out 2>&1
eval_tap $? 216 'SendMFAAuthenticationCode' test.out

#- 217 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'cvRFaTC1' \
    --mfaToken '1W0TGTCm' \
    > test.out 2>&1
eval_tap $? 217 'Change2faMethod' test.out

#- 218 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code '4fZWuk6p' \
    --factor 'QxDQpKqx' \
    --mfaToken 'LGeMvr9T' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 218 'Verify2faCode' test.out

#- 219 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'svcMQ7dB' \
    --userId 'saIecRxI' \
    > test.out 2>&1
eval_tap $? 219 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 220 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'sZvD6rmz' \
    --clientId 'Vr5XT1Nx' \
    --redirectUri 'w0v1dMQ9' \
    --requestId 'Rrbk6C2c' \
    > test.out 2>&1
eval_tap $? 220 'AuthCodeRequestV3' test.out

#- 221 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'VWf6ttvb' \
    --clientId 'U1PO6ApC' \
    --createHeadless  \
    --deviceId 'D2VXidT7' \
    --macAddress 'w0Oc15N8' \
    --platformToken 'WXBPp17P' \
    > test.out 2>&1
eval_tap $? 221 'PlatformTokenGrantV3' test.out

#- 222 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 222 'GetRevocationListV3' test.out

#- 223 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'AewqSm5x' \
    > test.out 2>&1
eval_tap $? 223 'TokenRevocationV3' test.out

#- 224 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId '3B4t7WQn' \
    --code 'p8jXZedg' \
    --codeVerifier 't5cyNe27' \
    --extendExp  \
    --password 'HLtwtVOa' \
    --redirectUri 'xgP6Jbct' \
    --refreshToken '8puMybYG' \
    --username 'xD9IPmms' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 224 'TokenGrantV3' test.out

#- 225 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'mu3kaPj0' \
    > test.out 2>&1
eval_tap $? 225 'VerifyTokenV3' test.out

#- 226 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'O4zd8Tb7' \
    --code 'cUNGPTBx' \
    --error 'iFFCrn7d' \
    --openidAssocHandle 'jjs69FTF' \
    --openidClaimedId 'VGUVhvKh' \
    --openidIdentity 'JCmeisql' \
    --openidMode '14mUHVbM' \
    --openidNs 'PimNhcZs' \
    --openidOpEndpoint 'U3VAdMDc' \
    --openidResponseNonce 'b4qlkiFA' \
    --openidReturnTo 'amqvZI2K' \
    --openidSig 'wjqPBiWX' \
    --openidSigned 'ade41s3r' \
    --state 'H34mB2yP' \
    > test.out 2>&1
eval_tap $? 226 'PlatformAuthenticationV3' test.out

#- 227 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'lRpWjmHZ' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetInputValidations' test.out

#- 228 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'AAvKTH8M' \
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
    --clientId 'uqIg0Czk' \
    > test.out 2>&1
eval_tap $? 230 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 231 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'guwuJCW7' \
    --body '{"platformUserIds": ["EEFB67AO", "Dbi9Bzup", "BsFpYc77"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 232 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GtRUcCFe' \
    --platformUserId 'Y5g4XgBs' \
    > test.out 2>&1
eval_tap $? 232 'PublicGetUserByPlatformUserIDV3' test.out

#- 233 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'bfzqxBPN' \
    > test.out 2>&1
eval_tap $? 233 'PublicGetAsyncStatus' test.out

#- 234 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'e8ae1Il4' \
    --limit '1' \
    --offset '28' \
    --query 'AtEbu4Ij' \
    > test.out 2>&1
eval_tap $? 234 'PublicSearchUserV3' test.out

#- 235 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "GdqthRxT", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "DY9vLh3u", "policyId": "6EDsUmrV", "policyVersionId": "6kH4OotK"}, {"isAccepted": true, "localizedPolicyVersionId": "2I03dIjv", "policyId": "BbA6bfbY", "policyVersionId": "aJCJjfk2"}, {"isAccepted": true, "localizedPolicyVersionId": "rBBN9tU6", "policyId": "TDm5GloF", "policyVersionId": "SKWM1eym"}], "authType": "5ydC6p25", "code": "xCWTqUOY", "country": "ZENJ1QHZ", "dateOfBirth": "QxPRXH7u", "displayName": "xBJEECQE", "emailAddress": "1li3Bg7J", "password": "xc9pUnZm", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 235 'PublicCreateUserV3' test.out

#- 236 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'nrgidKup' \
    --query 'vXO6aj4h' \
    > test.out 2>&1
eval_tap $? 236 'CheckUserAvailability' test.out

#- 237 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["CmTC34jx", "W4pIDwdq", "XpmRmut9"]}' \
    > test.out 2>&1
eval_tap $? 237 'PublicBulkGetUsers' test.out

#- 238 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "H9XyWI8b", "languageTag": "p8fQxRuX"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicSendRegistrationCode' test.out

#- 239 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "91uYmtrH", "emailAddress": "JbEGTUj7"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicVerifyRegistrationCode' test.out

#- 240 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "YjERL1rE", "languageTag": "QG02zccA"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicForgotPasswordV3' test.out

#- 241 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId '8wvLsWUN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'GetAdminInvitationV3' test.out

#- 242 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'd6lPKvqD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "t83AdvBa", "policyId": "agTiRJ8d", "policyVersionId": "aGTVX3Bb"}, {"isAccepted": false, "localizedPolicyVersionId": "jlz5IfHg", "policyId": "KjI9mwJS", "policyVersionId": "rN8jkIyk"}, {"isAccepted": true, "localizedPolicyVersionId": "zbaI6PD7", "policyId": "fEscShnG", "policyVersionId": "UGUtV9GJ"}], "authType": "EMAILPASSWD", "country": "9GDbLNwj", "dateOfBirth": "m3FK0nnX", "displayName": "2poMfZ1h", "password": "DHtbh4Ht", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 242 'CreateUserFromInvitationV3' test.out

#- 243 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "RD9vNAp4", "country": "jinFpnQ5", "dateOfBirth": "xF9wwbvM", "displayName": "ZyeDeRnV", "languageTag": "fPUa6xVV", "userName": "Bcq3wZpF"}' \
    > test.out 2>&1
eval_tap $? 243 'UpdateUserV3' test.out

#- 244 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "IYeAg79H", "country": "cLJXJ7mp", "dateOfBirth": "VI6eTYAj", "displayName": "dPlCiQQC", "languageTag": "35cj4KyO", "userName": "VgvnWbfR"}' \
    > test.out 2>&1
eval_tap $? 244 'PublicPartialUpdateUserV3' test.out

#- 245 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "JtsB7cUQ", "emailAddress": "Z2QUAxJr", "languageTag": "INPXppPN"}' \
    > test.out 2>&1
eval_tap $? 245 'PublicSendVerificationCodeV3' test.out

#- 246 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "O3AfmXcg", "contactType": "wC3IN6tv", "languageTag": "KgLB9QmJ", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 246 'PublicUserVerificationV3' test.out

#- 247 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "k2hG0WKt", "country": "4sUmanYx", "dateOfBirth": "M0UHZVNY", "displayName": "zGMNIpWo", "emailAddress": "SLkUrfuf", "password": "4U3WeYeA", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 247 'PublicUpgradeHeadlessAccountV3' test.out

#- 248 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "t2ENKKWr", "password": "FtHIi1CM"}' \
    > test.out 2>&1
eval_tap $? 248 'PublicVerifyHeadlessAccountV3' test.out

#- 249 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "gKAOG5iD", "newPassword": "cCR5PbCv", "oldPassword": "DLil8wj9"}' \
    > test.out 2>&1
eval_tap $? 249 'PublicUpdatePasswordV3' test.out

#- 250 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'cKM3Ar6M' \
    > test.out 2>&1
eval_tap $? 250 'PublicCreateJusticeUser' test.out

#- 251 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'F35hCER4' \
    --redirectUri 'nGmWGgTJ' \
    --ticket 'fHlJl4tH' \
    > test.out 2>&1
eval_tap $? 251 'PublicPlatformLinkV3' test.out

#- 252 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ga4XfZcd' \
    --body '{"platformNamespace": "9CVnGqMX"}' \
    > test.out 2>&1
eval_tap $? 252 'PublicPlatformUnlinkV3' test.out

#- 253 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9FieeEss' \
    > test.out 2>&1
eval_tap $? 253 'PublicPlatformUnlinkAllV3' test.out

#- 254 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WEUl07bh' \
    --ticket 'wntCVqiY' \
    > test.out 2>&1
eval_tap $? 254 'PublicForcePlatformLinkV3' test.out

#- 255 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OJf5KwMZ' \
    --clientId 'QjzvjSoz' \
    --redirectUri 'v6CTRDl0' \
    > test.out 2>&1
eval_tap $? 255 'PublicWebLinkPlatform' test.out

#- 256 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zp9CzHFw' \
    --state 'inkBNi4g' \
    > test.out 2>&1
eval_tap $? 256 'PublicWebLinkPlatformEstablish' test.out

#- 257 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "vqgl6TZ9", "emailAddress": "TGVPmv34", "newPassword": "h6T7Esuf"}' \
    > test.out 2>&1
eval_tap $? 257 'ResetPasswordV3' test.out

#- 258 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mfxKYB4L' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetUserByUserIdV3' test.out

#- 259 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M6H6QXmp' \
    --activeOnly  \
    --after 'Z9X3fUSR' \
    --before '1l9xLPBs' \
    --limit '25' \
    > test.out 2>&1
eval_tap $? 259 'PublicGetUserBanHistoryV3' test.out

#- 260 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nlUnqxT1' \
    > test.out 2>&1
eval_tap $? 260 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 261 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WsRNMZcA' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetUserInformationV3' test.out

#- 262 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '92hzC7MN' \
    --after '0.013703613652524482' \
    --before '0.9730317689086105' \
    --limit '45' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetUserLoginHistoriesV3' test.out

#- 263 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IhzOx2CX' \
    --after 'KlvIomU3' \
    --before 'pIxM9n8D' \
    --limit '90' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetUserPlatformAccountsV3' test.out

#- 264 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eLMe3lt9' \
    > test.out 2>&1
eval_tap $? 264 'PublicListJusticePlatformAccountsV3' test.out

#- 265 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'qfx2UDcg' \
    --body '{"platformId": "VE7L9FK6", "platformUserId": "e0MrPc4v"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicLinkPlatformAccount' test.out

#- 266 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'txk9hVKl' \
    --body '{"chosenNamespaces": ["G56HlzGr", "7XjdyRJu", "nZPkp6cc"], "requestId": "IBnWyPw8"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicForceLinkPlatformWithProgression' test.out

#- 267 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mj7gyQ7X' \
    > test.out 2>&1
eval_tap $? 267 'PublicGetPublisherUserV3' test.out

#- 268 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dIszGRj4' \
    --password '6COPipH1' \
    > test.out 2>&1
eval_tap $? 268 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 269 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'MWVTHG0q' \
    --before 'HJCWEfOJ' \
    --isWildcard  \
    --limit '32' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetRolesV3' test.out

#- 270 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'KDqebm83' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetRoleV3' test.out

#- 271 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 271 'PublicGetMyUserV3' test.out

#- 272 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'raNBJ5y7' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 273 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["axEkvI4o", "xZEDxGiB", "nNbn0zaf"], "oneTimeLinkCode": "7CaOSlHX"}' \
    > test.out 2>&1
eval_tap $? 273 'LinkHeadlessAccountToMyAccountV3' test.out

#- 274 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "rUSA6sMJ"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicSendVerificationLinkV3' test.out

#- 275 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'zA5mtqIS' \
    > test.out 2>&1
eval_tap $? 275 'PublicVerifyUserByLinkV3' test.out

#- 276 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'Q83TTbte' \
    --code 'fXWznDe4' \
    --error 'LQdXfFBi' \
    --state 'i2RAMEX5' \
    > test.out 2>&1
eval_tap $? 276 'PlatformAuthenticateSAMLV3Handler' test.out

#- 277 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'RMjBFVZG' \
    --payload 'YzQqV8d9' \
    > test.out 2>&1
eval_tap $? 277 'LoginSSOClient' test.out

#- 278 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'mDdUIoiI' \
    > test.out 2>&1
eval_tap $? 278 'LogoutSSOClient' test.out

#- 279 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'JFNxuNOm' \
    > test.out 2>&1
eval_tap $? 279 'RequestGameTokenResponseV3' test.out

#- 280 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'USWw18T1' \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDevicesByUserV4' test.out

#- 281 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'IxVWCxdv' \
    --endDate 'PL9e4P01' \
    --limit '44' \
    --offset '60' \
    --startDate 'xP8xj1Ly' \
    > test.out 2>&1
eval_tap $? 281 'AdminGetBannedDevicesV4' test.out

#- 282 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EirURERn' \
    > test.out 2>&1
eval_tap $? 282 'AdminGetUserDeviceBansV4' test.out

#- 283 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "EMzpImW6", "deviceId": "sjAHyCK5", "deviceType": "tNanGBrk", "enabled": true, "endDate": "iHF8ITGP", "ext": {"RQBCgIs1": {}, "Q2lzxl0y": {}, "F5m77TTh": {}}, "reason": "4gUoj8u2"}' \
    > test.out 2>&1
eval_tap $? 283 'AdminBanDeviceV4' test.out

#- 284 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'WRcLiEtz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'AdminGetDeviceBanV4' test.out

#- 285 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'Vlnkflfn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 285 'AdminUpdateDeviceBanV4' test.out

#- 286 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'pHY48F1d' \
    --startDate 'l1q92m3i' \
    --deviceType 'RlfnBAk0' \
    > test.out 2>&1
eval_tap $? 286 'AdminGenerateReportV4' test.out

#- 287 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 287 'AdminGetDeviceTypesV4' test.out

#- 288 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'CwiAsR65' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 288 'AdminGetDeviceBansV4' test.out

#- 289 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'yQ9ssuHd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 289 'AdminDecryptDeviceV4' test.out

#- 290 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'GmxncCEr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'AdminUnbanDeviceV4' test.out

#- 291 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId '0KcgeqzG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'AdminGetUsersByDeviceV4' test.out

#- 292 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 3}' \
    > test.out 2>&1
eval_tap $? 292 'AdminCreateTestUsersV4' test.out

#- 293 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["kNeATj7e", "Gjodd7Cc", "JUrI6MAu"]}' \
    > test.out 2>&1
eval_tap $? 293 'AdminBulkCheckValidUserIDV4' test.out

#- 294 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gK5kypNr' \
    --body '{"avatarUrl": "p2nFe9Fm", "country": "N86sK5LO", "dateOfBirth": "q4ft5jGc", "displayName": "MICPUYnf", "languageTag": "G6jl9U4j", "userName": "ReteIMgz"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminUpdateUserV4' test.out

#- 295 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ISomCsod' \
    --body '{"code": "JrhQW41q", "emailAddress": "2OspCZbt"}' \
    > test.out 2>&1
eval_tap $? 295 'AdminUpdateUserEmailAddressV4' test.out

#- 296 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '3Uta5I0u' \
    > test.out 2>&1
eval_tap $? 296 'AdminDisableUserMFAV4' test.out

#- 297 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GcL1koyH' \
    > test.out 2>&1
eval_tap $? 297 'AdminListUserRolesV4' test.out

#- 298 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jCH5olYL' \
    --body '{"assignedNamespaces": ["ETRpABAm", "O2EGvJ4U", "MS93yOxN"], "roleId": "InDByhno"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateUserRoleV4' test.out

#- 299 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'luO6ti0Q' \
    --body '{"assignedNamespaces": ["P2ssiJ66", "OzOj84O6", "tgohjtC7"], "roleId": "bzjPpucd"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminAddUserRoleV4' test.out

#- 300 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dXJ5zifF' \
    --body '{"assignedNamespaces": ["8y959anr", "NSleywHb", "Hig6IKWV"], "roleId": "Z77KeRWd"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminRemoveUserRoleV4' test.out

#- 301 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '62' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 301 'AdminGetRolesV4' test.out

#- 302 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "b39ukcR6"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminCreateRoleV4' test.out

#- 303 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'c2E2r3vk' \
    > test.out 2>&1
eval_tap $? 303 'AdminGetRoleV4' test.out

#- 304 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId '3IfAKEbq' \
    > test.out 2>&1
eval_tap $? 304 'AdminDeleteRoleV4' test.out

#- 305 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'cNXSGCCv' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "W0nXOErQ"}' \
    > test.out 2>&1
eval_tap $? 305 'AdminUpdateRoleV4' test.out

#- 306 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'PS4VsRoY' \
    --body '{"permissions": [{"action": 71, "resource": "mulP4tQ6", "schedAction": 90, "schedCron": "CGiXaLs2", "schedRange": ["xjHkinOD", "975nARHC", "mhNHSXuq"]}, {"action": 72, "resource": "NX3ahvxw", "schedAction": 60, "schedCron": "gwwhTnjN", "schedRange": ["6wKZGW4y", "3f0R9s2k", "ndhhZhwA"]}, {"action": 17, "resource": "fIZsWhkS", "schedAction": 60, "schedCron": "76dGGJwJ", "schedRange": ["00UH197M", "J6zU7JLM", "QyMWzYQC"]}]}' \
    > test.out 2>&1
eval_tap $? 306 'AdminUpdateRolePermissionsV4' test.out

#- 307 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'AaPJgoxG' \
    --body '{"permissions": [{"action": 73, "resource": "wIc895Im", "schedAction": 34, "schedCron": "4ZD0Xtb0", "schedRange": ["U4pH16NU", "sVY21NVI", "s7NRen2Y"]}, {"action": 9, "resource": "Ns0QJQea", "schedAction": 100, "schedCron": "OL0QQpxs", "schedRange": ["uD8PGqku", "59eFJrOX", "yDYz9vMU"]}, {"action": 83, "resource": "UJRMbkcT", "schedAction": 13, "schedCron": "QbF7gHPT", "schedRange": ["PQbvLt2N", "RqJGIKzL", "yH1y72L1"]}]}' \
    > test.out 2>&1
eval_tap $? 307 'AdminAddRolePermissionsV4' test.out

#- 308 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId '3Ornyx34' \
    --body '["luLdvtsT", "KXMjiw6g", "YPvfn2Qt"]' \
    > test.out 2>&1
eval_tap $? 308 'AdminDeleteRolePermissionsV4' test.out

#- 309 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId '9iyq3Nyk' \
    --after '8ncu2Z3e' \
    --before 'DHH9WaVO' \
    --limit '35' \
    > test.out 2>&1
eval_tap $? 309 'AdminListAssignedUsersV4' test.out

#- 310 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'iKhDcJ7T' \
    --body '{"assignedNamespaces": ["CcNIsQ3P", "uppUxDSK", "8aOTGMud"], "namespace": "cxlCV4cN", "userId": "bJGQ57lP"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminAssignUserToRoleV4' test.out

#- 311 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'dinpjS2D' \
    --body '{"namespace": "RfGt9Gly", "userId": "ZVQ4X67t"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminRevokeUserFromRoleV4' test.out

#- 312 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "PZSTpPq3", "country": "xjrElvvD", "dateOfBirth": "gw0ag7kS", "displayName": "WE0Hiqm5", "languageTag": "IuLryiEX", "userName": "qvUWDjU1"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateMyUserV4' test.out

#- 313 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 313 'AdminDisableMyAuthenticatorV4' test.out

#- 314 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'G0EVjVZw' \
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
    --code '1ToLuPak' \
    > test.out 2>&1
eval_tap $? 323 'AdminEnableMyEmailV4' test.out

#- 324 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 324 'AdminGetMyEnabledFactorsV4' test.out

#- 325 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'QN1MpOs1' \
    > test.out 2>&1
eval_tap $? 325 'AdminMakeFactorMyDefaultV4' test.out

#- 326 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["RVFrcg2C", "Xxepx78f", "vsyhE2BK"], "emailAddresses": ["tyTDSIM7", "mkmvZ7Cm", "sh4US8o4"], "isAdmin": false, "namespace": "C9Mfuc8V", "roleId": "OsnmnlVl"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminInviteUserV4' test.out

#- 327 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "CCVuFjS1", "policyId": "GC1d2b92", "policyVersionId": "B4vEgj3H"}, {"isAccepted": false, "localizedPolicyVersionId": "Iz0jcgDI", "policyId": "8Pkz96vd", "policyVersionId": "80msqIm5"}, {"isAccepted": false, "localizedPolicyVersionId": "0lNUBDSh", "policyId": "HD32vvL2", "policyVersionId": "8FPwTiXf"}], "authType": "EMAILPASSWD", "country": "cxDC9Ynd", "dateOfBirth": "02mECIQh", "displayName": "fIhHtADU", "emailAddress": "Q9zimQTQ", "password": "T95pFJUA", "passwordMD5Sum": "JsyAfeKO", "username": "ufV4f15N", "verified": false}' \
    > test.out 2>&1
eval_tap $? 327 'PublicCreateTestUserV4' test.out

#- 328 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "tnTKUe2z", "policyId": "nsqPzPkw", "policyVersionId": "CBo2SwCU"}, {"isAccepted": true, "localizedPolicyVersionId": "0ih2EQfY", "policyId": "3XCv4hdO", "policyVersionId": "a6FdZhNM"}, {"isAccepted": false, "localizedPolicyVersionId": "1a9gMz0F", "policyId": "2UBRmMhA", "policyVersionId": "bUWmFhdY"}], "authType": "EMAILPASSWD", "code": "WzMuv3zk", "country": "UY0n0BAZ", "dateOfBirth": "kwbYkBLy", "displayName": "O6A0Fqfh", "emailAddress": "naB3YxKN", "password": "dOTacCcJ", "passwordMD5Sum": "fIfXshuL", "reachMinimumAge": false, "username": "WrZ05sxe"}' \
    > test.out 2>&1
eval_tap $? 328 'PublicCreateUserV4' test.out

#- 329 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId '6A6RpmKD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "TKbonouc", "policyId": "NmzwOZOK", "policyVersionId": "56sDkci5"}, {"isAccepted": true, "localizedPolicyVersionId": "e6zKJdlt", "policyId": "7rjF5RaJ", "policyVersionId": "wvkWVco2"}, {"isAccepted": false, "localizedPolicyVersionId": "To5ijlvD", "policyId": "F8qBWCQ9", "policyVersionId": "dLWYyS8z"}], "authType": "EMAILPASSWD", "country": "XGM5anIl", "dateOfBirth": "oyj9lhbv", "displayName": "uQdW2jwK", "password": "Uckc794r", "reachMinimumAge": true, "username": "NKy59X8i"}' \
    > test.out 2>&1
eval_tap $? 329 'CreateUserFromInvitationV4' test.out

#- 330 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "Og2sVBiC", "country": "oeC5weXJ", "dateOfBirth": "l7PeiMH8", "displayName": "z8dVej8N", "languageTag": "2yv6VTnO", "userName": "K7xAvM7t"}' \
    > test.out 2>&1
eval_tap $? 330 'PublicUpdateUserV4' test.out

#- 331 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "uL81lsR7", "emailAddress": "xxSVp3Gd"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicUpdateUserEmailAddressV4' test.out

#- 332 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "2TK0HzYv", "country": "iTgYmx82", "dateOfBirth": "JVBRLPZ6", "displayName": "Iz8tne5d", "emailAddress": "bguBF6Gs", "password": "vvdl8jHz", "reachMinimumAge": true, "username": "x7XZIjU4", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 332 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 333 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "9lOLaZaM", "password": "phKCqTq3", "username": "EVheJjoE"}' \
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
    --code 'EXBLIxGn' \
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
    --deviceToken 'NuhoJM3W' \
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
    --code 'WPvvCiCf' \
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
    --factor '33ViEdqQ' \
    > test.out 2>&1
eval_tap $? 347 'PublicMakeFactorMyDefaultV4' test.out

#- 348 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"emailAddress": "poGkUWNi", "namespace": "zk5UcPAG", "namespaceDisplayName": "v6c1ESC6"}' \
    > test.out 2>&1
eval_tap $? 348 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE