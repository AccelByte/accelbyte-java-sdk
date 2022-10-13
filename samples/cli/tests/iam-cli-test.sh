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
echo "1..333"

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
    --body '[{"field": "qj0GIgAv", "validation": {"allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "blockedWord": ["wJCq8Pmr", "GsBqEK1d", "QSkqo1Ta"], "description": [{"language": "Gb0xyu8z", "message": ["d0DfCN4m", "eZBiJA3J", "uu2eu8GY"]}, {"language": "hr7HjyZg", "message": ["yrLELQxI", "cYbsKHg9", "VETlNizN"]}, {"language": "jIuJ9O44", "message": ["As1DItMc", "THRnlxGa", "CWxyd3zR"]}], "isCustomRegex": true, "letterCase": "0XBqRxrN", "maxLength": 44, "maxRepeatingAlphaNum": 72, "maxRepeatingSpecialCharacter": 89, "minCharType": 26, "minLength": 50, "regex": "nKVGAnZR", "specialCharacterLocation": "XkM26MeT", "specialCharacters": ["MEJXliPu", "3OOEEejC", "ffJsLPjp"]}}, {"field": "2aJAnzg7", "validation": {"allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": true, "blockedWord": ["PMH4mKXt", "VVXpEKTV", "jaIlLfGD"], "description": [{"language": "MDbl7IxL", "message": ["FU5N7rqV", "sljNFvxo", "8P9T3qGZ"]}, {"language": "f7mgoGtk", "message": ["eqftz5a5", "rLKCeszB", "3AgbEO4v"]}, {"language": "JtvLbjr7", "message": ["t9NZcI97", "0mOCxKPi", "ZusbN0Bj"]}], "isCustomRegex": true, "letterCase": "jSRUxmis", "maxLength": 12, "maxRepeatingAlphaNum": 85, "maxRepeatingSpecialCharacter": 10, "minCharType": 0, "minLength": 84, "regex": "YSARUqze", "specialCharacterLocation": "XzErhWMw", "specialCharacters": ["4nNVFneh", "s7898w2L", "YppRpO9a"]}}, {"field": "hmbxhbYb", "validation": {"allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "blockedWord": ["1JrNVBcY", "idTusml6", "0FRLjUzl"], "description": [{"language": "ssstfFaX", "message": ["gIFdgn2Z", "FGjULezi", "KFFrR1l6"]}, {"language": "5plmXuDZ", "message": ["FcgnmMA5", "fgcBcnPt", "qecZdgnH"]}, {"language": "q1sDCqcN", "message": ["TC1S7RSe", "l9lsro4o", "SLON3EEJ"]}], "isCustomRegex": true, "letterCase": "94V7yNDA", "maxLength": 62, "maxRepeatingAlphaNum": 12, "maxRepeatingSpecialCharacter": 13, "minCharType": 49, "minLength": 29, "regex": "GZHOAKyv", "specialCharacterLocation": "8oAnoCZ2", "specialCharacters": ["HJ50uMch", "uw9ZoYHR", "kMajr8ek"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'VuaHgh79' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after '5bBmei5X' \
    --before 'M8vB65Gz' \
    --limit '47' \
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
    --body '{"ageRestriction": 82, "enable": true}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'H4Ss8x2F' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 83}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType '3FShjMZY' \
    --limit '100' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "7PQ4ab75", "comment": "3uV7k1VC", "endDate": "TSOqX5Vs", "reason": "zp1MqhUR", "skipNotif": true, "userIds": ["VNmvSqbx", "UifYNzuH", "NxY2kVGD"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "nLZZnAKd", "userId": "T2WAwSbi"}, {"banId": "9GuAr1kS", "userId": "y6U4Q4Fk"}, {"banId": "iKRe7TDD", "userId": "coqze5sY"}]}' \
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
    --limit '74' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["xAnNPLED", "rYfE14xc", "QKJoeL1Q"], "baseUri": "tbBIWYJV", "clientId": "xErRqLI1", "clientName": "XZIvOLAa", "clientPermissions": [{"action": 7, "resource": "IwhE7xCI", "schedAction": 78, "schedCron": "hxK5VTWi", "schedRange": ["lZRtQaYD", "qyerUDrs", "glw5YRi3"]}, {"action": 97, "resource": "3XxWTeOK", "schedAction": 23, "schedCron": "Mp0faMHN", "schedRange": ["hvfkEvhP", "wRnbAzxc", "2AA9MbQv"]}, {"action": 52, "resource": "xXvTaZAJ", "schedAction": 43, "schedCron": "LfLNqcfE", "schedRange": ["zqTjkP14", "ad5ll5hy", "q55m3jA2"]}], "clientPlatform": "ZjrwennO", "deletable": false, "namespace": "7pCoNQJ8", "oauthClientType": "cNvcroov", "redirectUri": "sV0Pn0KC", "secret": "I4FaaH3c", "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'kvquPnEb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'zk7zMlxU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'kVZx9Ptj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["VOiytC22", "pBvfn8Af", "pBZpg0X3"], "baseUri": "C7OV36w4", "clientName": "ZhaWZpT7", "clientPermissions": [{"action": 50, "resource": "lUra7FPX", "schedAction": 78, "schedCron": "QG5MVBHU", "schedRange": ["p0unEJ5m", "fK1Xm8ki", "ZflEe0AC"]}, {"action": 11, "resource": "4frdd1fo", "schedAction": 70, "schedCron": "xsK82Vjv", "schedRange": ["a2h46MNV", "cQJjWJ4V", "bE882DlP"]}, {"action": 48, "resource": "oyXRsXJv", "schedAction": 28, "schedCron": "anhAJ04X", "schedRange": ["Tvy7VSwl", "YF2bnPJL", "AghMu4SF"]}], "clientPlatform": "AZXBzH3l", "deletable": false, "namespace": "ePx3KuMh", "redirectUri": "P47FZlCp", "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId '9wVPxKQc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 88, "resource": "XpBwUCu7"}, {"action": 29, "resource": "mhejWggV"}, {"action": 79, "resource": "ondNbkIZ"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'eUp3DWLm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 22, "resource": "Pa6qMhkE"}, {"action": 18, "resource": "BNn49l3R"}, {"action": 81, "resource": "TOPykjct"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '84' \
    --clientId 'mIPgR3Gb' \
    --namespace "$AB_NAMESPACE" \
    --resource 'hscnGF2w' \
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
    --limit '88' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'p2HPPbdu' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ri8SFM2Z' \
    --body '{"ACSURL": "QiGsdDOT", "AWSCognitoRegion": "KdSf3wlC", "AWSCognitoUserPool": "y0CgHgHr", "AllowedClients": ["cj1QrV7X", "KOXa5yK8", "VcjEmwZ8"], "AppId": "gcoQ6afD", "AuthorizationEndpoint": "ExCsHFOm", "ClientId": "2NO9RzrF", "Environment": "oOlR4aGl", "FederationMetadataURL": "yVl0gIfm", "GenericOauthFlow": false, "IsActive": false, "Issuer": "N6vAuqeW", "JWKSEndpoint": "DgXDOFCw", "KeyID": "pJDZCcUS", "NetflixCertificates": {"encryptedPrivateKey": "07BxYUZx", "encryptedPrivateKeyName": "4O9xjZE7", "publicCertificate": "sqKL0UaZ", "publicCertificateName": "W6M77bfJ", "rootCertificate": "wgfMk4fy", "rootCertificateName": "CdlUjmx3"}, "OrganizationId": "r1kw6yCc", "PlatformName": "gCDB3N99", "RedirectUri": "8CtVVRSy", "RegisteredDomains": [{"affectedClientIDs": ["PUf2lJcH", "sdfSwNux", "PQVCOZb8"], "domain": "PbabFxw2", "namespaces": ["AJa9LRHa", "beVbJVQ2", "JzMw0hSR"], "roleId": "WZmj6g62"}, {"affectedClientIDs": ["qGjVNAt4", "UZnkU5iM", "ASyy3ot7"], "domain": "qTMfLr3H", "namespaces": ["ts8An6aF", "66aS2kLb", "bJXlUg03"], "roleId": "sRTApr42"}, {"affectedClientIDs": ["oL9y4ZMM", "KCsgV41i", "kysTpTqw"], "domain": "cOjhxy94", "namespaces": ["cKadmMeO", "GgrdsKmI", "0Cs9bBxC"], "roleId": "cKjlHz2Q"}], "Secret": "qi8qQ1I1", "TeamID": "0WswApYs", "TokenAuthenticationType": "EAidYm3D", "TokenClaimsMapping": {"ap7Pocvc": "mm9VzqUt", "Lskqolxc": "SQPt0MUD", "YZaoI8EZ": "vlAFh8wL"}, "TokenEndpoint": "50xG4pps"}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BEgeqTC8' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hRntcLqm' \
    --body '{"ACSURL": "6Gq2SAn1", "AWSCognitoRegion": "pZmGHg1B", "AWSCognitoUserPool": "UT415SX6", "AllowedClients": ["BJfsRP6b", "lacDYlmr", "hDktriKh"], "AppId": "3YbREH4i", "AuthorizationEndpoint": "yK6jkxzV", "ClientId": "TxbJgUog", "Environment": "3OSuPT6s", "FederationMetadataURL": "OJTVES0D", "GenericOauthFlow": true, "IsActive": true, "Issuer": "qWX2jgNb", "JWKSEndpoint": "ddyopjjB", "KeyID": "3R3w3Tm1", "NetflixCertificates": {"encryptedPrivateKey": "ghf1KyXo", "encryptedPrivateKeyName": "pqwaprvn", "publicCertificate": "IDPWVdfs", "publicCertificateName": "t1YCIe1u", "rootCertificate": "LtLXN4R8", "rootCertificateName": "To1DiHIC"}, "OrganizationId": "5Bb98P31", "PlatformName": "0xkpImF7", "RedirectUri": "pBXlgi67", "RegisteredDomains": [{"affectedClientIDs": ["zyb7GUyY", "HeLsR9hq", "VEXM3z30"], "domain": "jqyGpkz3", "namespaces": ["LxgnAvVC", "CSbVy9yA", "Te4Eiqvi"], "roleId": "mJiRblBr"}, {"affectedClientIDs": ["0W8jx27H", "cQ3DmYyJ", "rIAdXhwl"], "domain": "KhHLM94T", "namespaces": ["zlLfPC3L", "CwrclX4a", "0VnrHe2d"], "roleId": "oulOeDFm"}, {"affectedClientIDs": ["6CrVX3hF", "qqhD2vjw", "02iPJXcv"], "domain": "K06GW7MT", "namespaces": ["j1om078S", "RFm5Vjno", "K2vfDV6M"], "roleId": "miM1UHT1"}], "Secret": "gXiYJBKi", "TeamID": "75Xbg2e7", "TokenAuthenticationType": "OSN455Iq", "TokenClaimsMapping": {"GrYuIxqR": "3FVx3aSj", "ai696vVF": "vO6wyr1L", "imcWKmcV": "1usBb6qg"}, "TokenEndpoint": "NlzGZrRE"}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QygI4dX4' \
    --body '{"affectedClientIDs": ["pqRURyEj", "hKnbqi6b", "LGEq3t1j"], "assignedNamespaces": ["YghvPnPF", "j41CQAHN", "7UdqaWla"], "domain": "0qBBZNSo", "roleId": "CIQNFifz"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dexgpn30' \
    --body '{"domain": "vpbw6eai"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GBl4RfGg' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'P6A8twhD' \
    --body '{"acsUrl": "dk1Yglz6", "apiKey": "ckTHn88f", "appId": "kC3CihRk", "federationMetadataUrl": "bwI5Bp6j", "isActive": true, "redirectUri": "mAaaOhJg", "secret": "4CqA3ib6", "ssoUrl": "uw72gJyW"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VdBTzxIf' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tKbOUymz' \
    --body '{"acsUrl": "n0QdHa6f", "apiKey": "Px3B8Yb3", "appId": "3VZd4ZkN", "federationMetadataUrl": "7liTFwYQ", "isActive": true, "redirectUri": "HklzLxIE", "secret": "WRutRZh1", "ssoUrl": "aQWNUJbh"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QBMxtxAB' \
    --platformUserId 'K0ToLEhB' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'cCtkDa4J' \
    --after '52' \
    --before '28' \
    --limit '84' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'kD0XdNQG' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["YrZ10tEh", "gHXPwND4", "LqmXFTmm"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["yoDRzoXH", "DQyffTFP", "xTpkkv9U"], "isAdmin": true, "roles": ["3aY9ET2N", "X4nKwrND", "lyqwmsKD"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 146 'AdminListUsersV3' test.out

#- 147 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'nEhWASHC' \
    --endDate 'q7EaCt1Z' \
    --limit '19' \
    --offset '39' \
    --platformBy 'O78lprbe' \
    --platformId 'kp6XzNbY' \
    --query 'm16eCG06' \
    --startDate 'bMPDPV9d' \
    > test.out 2>&1
eval_tap $? 147 'AdminSearchUserV3' test.out

#- 148 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["mbRWXOzd", "0ijJlgFU", "rJdfe7yV"]}' \
    > test.out 2>&1
eval_tap $? 148 'AdminGetBulkUserByEmailAddressV3' test.out

#- 149 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OV1K1M5I' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserByUserIdV3' test.out

#- 150 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2UANK7EG' \
    --body '{"avatarUrl": "MYVOs2qB", "country": "CQCy5W8N", "dateOfBirth": "4gerPPLP", "displayName": "yIp8iaEJ", "languageTag": "A553EZvA", "userName": "2uPFSNfL"}' \
    > test.out 2>&1
eval_tap $? 150 'AdminUpdateUserV3' test.out

#- 151 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EElFr5Us' \
    --activeOnly  \
    --after '12KVCL5v' \
    --before 'Dqh4nlu6' \
    --limit '13' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserBanV3' test.out

#- 152 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zoXLK0mI' \
    --body '{"ban": "x8fjMAc1", "comment": "UGXQB5m4", "endDate": "nhlYVU2N", "reason": "11pwYmv5", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 152 'AdminBanUserV3' test.out

#- 153 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'S6ZC9b93' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mlv4oz6e' \
    --body '{"enabled": false, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 153 'AdminUpdateUserBanV3' test.out

#- 154 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eLgss7KO' \
    --body '{"context": "UGV6KUlT", "emailAddress": "pucGm9CD", "languageTag": "hmGZc3op"}' \
    > test.out 2>&1
eval_tap $? 154 'AdminSendVerificationCodeV3' test.out

#- 155 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'y3uOk6At' \
    --body '{"Code": "ngSGNjjQ", "ContactType": "Ed2ClZ3z", "LanguageTag": "TvtWgqe7", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 155 'AdminVerifyAccountV3' test.out

#- 156 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'vC9bsAiz' \
    > test.out 2>&1
eval_tap $? 156 'GetUserVerificationCode' test.out

#- 157 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KRwFB1q8' \
    > test.out 2>&1
eval_tap $? 157 'AdminGetUserDeletionStatusV3' test.out

#- 158 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'B6Cmcgv1' \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 158 'AdminUpdateUserDeletionStatusV3' test.out

#- 159 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qbdJEdCC' \
    --body '{"code": "k1ZPA3uD", "country": "j55QOhUS", "dateOfBirth": "8QSS1aFx", "displayName": "beBVRN2A", "emailAddress": "OtutmdH9", "password": "NujarZWi", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpgradeHeadlessAccountV3' test.out

#- 160 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wbxay8tZ' \
    > test.out 2>&1
eval_tap $? 160 'AdminDeleteUserInformationV3' test.out

#- 161 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zIiMdOyA' \
    --after '0.8347725135359982' \
    --before '0.28394006023532403' \
    --limit '91' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetUserLoginHistoriesV3' test.out

#- 162 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nTmNsED0' \
    --body '{"languageTag": "O7RiQHvZ", "newPassword": "WTk7A8u7", "oldPassword": "UsYfWdog"}' \
    > test.out 2>&1
eval_tap $? 162 'AdminResetPasswordV3' test.out

#- 163 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Iu76QqZU' \
    --body '{"Permissions": [{"Action": 99, "Resource": "ZhJDRoo9", "SchedAction": 58, "SchedCron": "Y9PL52Lk", "SchedRange": ["6mOTRyOf", "AW5qy81o", "XSX3uvPR"]}, {"Action": 30, "Resource": "8ndJDOxP", "SchedAction": 32, "SchedCron": "0mPrtIQ8", "SchedRange": ["WPQEWktO", "xNthEWx6", "9xHZMafn"]}, {"Action": 91, "Resource": "ybhWzpNE", "SchedAction": 66, "SchedCron": "IyBtUtys", "SchedRange": ["If3IFTc8", "EbTjfgEq", "NXtTyY7Q"]}]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminUpdateUserPermissionV3' test.out

#- 164 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eqYYt0xa' \
    --body '{"Permissions": [{"Action": 96, "Resource": "BypMHyqR", "SchedAction": 95, "SchedCron": "iBvJ1Lwb", "SchedRange": ["O25C15ha", "bDVfHSU0", "TEllDJSH"]}, {"Action": 30, "Resource": "nZ4PByJs", "SchedAction": 99, "SchedCron": "qiQi14h0", "SchedRange": ["uzyOnkBy", "MYUCowGw", "ioaPz691"]}, {"Action": 95, "Resource": "S9zAP95H", "SchedAction": 3, "SchedCron": "u3ES49yN", "SchedRange": ["ybCE16fI", "d9pQaToG", "ErGA0IDW"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminAddUserPermissionsV3' test.out

#- 165 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9ZHyGohm' \
    --body '[{"Action": 17, "Resource": "TkuY7I4R"}, {"Action": 68, "Resource": "yIa1IHhU"}, {"Action": 79, "Resource": "HkYXGCcX"}]' \
    > test.out 2>&1
eval_tap $? 165 'AdminDeleteUserPermissionBulkV3' test.out

#- 166 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '95' \
    --namespace "$AB_NAMESPACE" \
    --resource 'JwYNXxWt' \
    --userId 'k74SxFwS' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionV3' test.out

#- 167 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QKVvvMKM' \
    --after 'RQ7HYMjR' \
    --before 'qF1G19cs' \
    --limit '97' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserPlatformAccountsV3' test.out

#- 168 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'n1d43rzV' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetListJusticePlatformAccounts' test.out

#- 169 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'U0Une3zF' \
    --userId '0u5JciHe' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetUserMapping' test.out

#- 170 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '0p1sFuFf' \
    --userId 'p6zgCjr5' \
    > test.out 2>&1
eval_tap $? 170 'AdminCreateJusticeUser' test.out

#- 171 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'kV7RF9Nu' \
    --body '{"platformId": "0PGiaqOt", "platformUserId": "z11GVNt4"}' \
    > test.out 2>&1
eval_tap $? 171 'AdminLinkPlatformAccount' test.out

#- 172 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1ggLtky1' \
    --userId 'siWUVkdQ' \
    --body '{"platformNamespace": "S4OAxGy8"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminPlatformUnlinkV3' test.out

#- 173 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8irFQNQF' \
    --userId 'bj4q17M1' \
    --ticket 'z78g42Dd' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformLinkV3' test.out

#- 174 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'srOvkwis' \
    --body '["wlxiw610", "izcRrjRz", "7Ignpr4m"]' \
    > test.out 2>&1
eval_tap $? 174 'AdminDeleteUserRolesV3' test.out

#- 175 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CF2jsytH' \
    --body '[{"namespace": "f1hnPM11", "roleId": "JSWyMN6W"}, {"namespace": "rx4T79Il", "roleId": "AQ7vNexP"}, {"namespace": "POJn2MMk", "roleId": "tKJP96fs"}]' \
    > test.out 2>&1
eval_tap $? 175 'AdminSaveUserRoleV3' test.out

#- 176 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'igtkrE8d' \
    --userId '9YZIdPlk' \
    > test.out 2>&1
eval_tap $? 176 'AdminAddUserRoleV3' test.out

#- 177 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'jkfZ9LuE' \
    --userId 'Hg5pfxkd' \
    > test.out 2>&1
eval_tap $? 177 'AdminDeleteUserRoleV3' test.out

#- 178 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pZBumZu2' \
    --body '{"enabled": false, "reason": "Yj6OXtbo"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserStatusV3' test.out

#- 179 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 's6LzTrog' \
    > test.out 2>&1
eval_tap $? 179 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 180 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'AtqFQ8rB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "KTae5Fbw"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateClientSecretV3' test.out

#- 181 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'j9UoLMRY' \
    --before 'MerjAjjF' \
    --isWildcard  \
    --limit '33' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetRolesV3' test.out

#- 182 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "managers": [{"displayName": "rYGjoe4k", "namespace": "3CmKhCP0", "userId": "Bkq4ifPv"}, {"displayName": "Ulp4eLMb", "namespace": "n6FxqAST", "userId": "2Stw7EJd"}, {"displayName": "AsHd38yS", "namespace": "6jlKz8ds", "userId": "JViIVs4f"}], "members": [{"displayName": "2Vi6lg5M", "namespace": "99d52B6K", "userId": "KG9IZIa6"}, {"displayName": "imSRUs2C", "namespace": "h700SVcf", "userId": "N9W5OSVd"}, {"displayName": "BrlmYIa4", "namespace": "FfQaPh11", "userId": "F4tZH47m"}], "permissions": [{"action": 22, "resource": "rmx5GBtP", "schedAction": 28, "schedCron": "C8Cu7e8p", "schedRange": ["GviBMRjy", "deZWwgV2", "iFudxpiO"]}, {"action": 80, "resource": "VP5l7sp9", "schedAction": 34, "schedCron": "XAzdMugP", "schedRange": ["Dkj4EXWy", "7NxT1Akd", "gFld3dgy"]}, {"action": 32, "resource": "byxW4Mxv", "schedAction": 38, "schedCron": "d8NFJi2v", "schedRange": ["ro9Jy0P4", "5fiDAzy8", "eUCx5iJC"]}], "roleName": "FDAAelvB"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminCreateRoleV3' test.out

#- 183 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'EQ3KpQor' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRoleV3' test.out

#- 184 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'nN9jfn8J' \
    > test.out 2>&1
eval_tap $? 184 'AdminDeleteRoleV3' test.out

#- 185 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'yfmqDDXA' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "jLoQjEkg"}' \
    > test.out 2>&1
eval_tap $? 185 'AdminUpdateRoleV3' test.out

#- 186 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'y8itj2Tf' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetRoleAdminStatusV3' test.out

#- 187 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'WfK0rYJ8' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateAdminRoleStatusV3' test.out

#- 188 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'yk4Y5zWD' \
    > test.out 2>&1
eval_tap $? 188 'AdminRemoveRoleAdminV3' test.out

#- 189 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'Y7EqNPlA' \
    --after 'yHSkoP9w' \
    --before 'B3TTeUNV' \
    --limit '43' \
    > test.out 2>&1
eval_tap $? 189 'AdminGetRoleManagersV3' test.out

#- 190 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'lPoQSFWo' \
    --body '{"managers": [{"displayName": "hnIq7Pu7", "namespace": "UQd8akd8", "userId": "LsMAz7Py"}, {"displayName": "DKRRfpph", "namespace": "weIV2wdp", "userId": "yKyVUDBq"}, {"displayName": "fs9CFFYh", "namespace": "AdARWtTZ", "userId": "jNO27PiK"}]}' \
    > test.out 2>&1
eval_tap $? 190 'AdminAddRoleManagersV3' test.out

#- 191 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'qbQaA3Kp' \
    --body '{"managers": [{"displayName": "PZUvBAJe", "namespace": "UJI2yffo", "userId": "MTj5QH52"}, {"displayName": "SepWgT4M", "namespace": "YJwIpe95", "userId": "onC1eabg"}, {"displayName": "DB4YIOTn", "namespace": "5xav6HZJ", "userId": "ku5gNC1H"}]}' \
    > test.out 2>&1
eval_tap $? 191 'AdminRemoveRoleManagersV3' test.out

#- 192 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'QW9bvmXZ' \
    --after 'EVoLLpJv' \
    --before 'wBbUDUDg' \
    --limit '71' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetRoleMembersV3' test.out

#- 193 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'eHvzBOf8' \
    --body '{"members": [{"displayName": "3397ZsAf", "namespace": "J3JkFjbw", "userId": "xPIy6aXC"}, {"displayName": "sAkgxsN9", "namespace": "1DHL3GMH", "userId": "lR8aF6bA"}, {"displayName": "JZOQYdmI", "namespace": "uv2volrJ", "userId": "eSe2xU2I"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminAddRoleMembersV3' test.out

#- 194 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId '9ukEK650' \
    --body '{"members": [{"displayName": "W7R57FTQ", "namespace": "ND4PhxIH", "userId": "Hc32KI3U"}, {"displayName": "uJv5Cqxb", "namespace": "OSGWxY9G", "userId": "dgdMSVEm"}, {"displayName": "BEUjJN5c", "namespace": "tz7roSuQ", "userId": "5wP76Dic"}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminRemoveRoleMembersV3' test.out

#- 195 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'lMsfLcOK' \
    --body '{"permissions": [{"action": 76, "resource": "EWUTTy04", "schedAction": 44, "schedCron": "ZAEfZHHo", "schedRange": ["zYRE6jEB", "THcifztJ", "BmmkqgU3"]}, {"action": 20, "resource": "LUUPYRZ6", "schedAction": 33, "schedCron": "VKeybTxN", "schedRange": ["Z3Fwivsl", "fXm571zI", "35Dj2YVt"]}, {"action": 47, "resource": "E7QJYscR", "schedAction": 67, "schedCron": "eZ1mwXoK", "schedRange": ["Mu4rz5e9", "bsFDATCW", "XQjDG3wY"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminUpdateRolePermissionsV3' test.out

#- 196 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'JuDn1mal' \
    --body '{"permissions": [{"action": 100, "resource": "dLih2wms", "schedAction": 100, "schedCron": "bvkEvoIy", "schedRange": ["ohFHhJlF", "sJ1Ysdbd", "I7PnUuVm"]}, {"action": 37, "resource": "fsl46Uzm", "schedAction": 8, "schedCron": "8sBRkfGB", "schedRange": ["R5AC2tLh", "pTvmVJGT", "WDFbxJwA"]}, {"action": 81, "resource": "4KM7vYWl", "schedAction": 54, "schedCron": "zMHbWdTJ", "schedRange": ["hzxJduUJ", "v2oZXk56", "eplN5gg9"]}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminAddRolePermissionsV3' test.out

#- 197 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'YKAVAcPc' \
    --body '["zSxWyGk7", "pc09IYTm", "8Oz52LyY"]' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteRolePermissionsV3' test.out

#- 198 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '39' \
    --resource 'PcPaQUs5' \
    --roleId 'uRchAOWw' \
    > test.out 2>&1
eval_tap $? 198 'AdminDeleteRolePermissionV3' test.out

#- 199 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 199 'AdminGetMyUserV3' test.out

#- 200 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'Wk3bpTOn' \
    --extendExp  \
    --redirectUri 'Li3SkKyR' \
    --password 'CWB9hXZT' \
    --requestId 'wiTEQu1T' \
    --userName 'QJ8fHBNL' \
    > test.out 2>&1
eval_tap $? 200 'UserAuthenticationV3' test.out

#- 201 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'huE7V8mv' \
    --linkingToken '2jtTVGjj' \
    --password 'U5rcqY0c' \
    --username 'JihyeAN0' \
    > test.out 2>&1
eval_tap $? 201 'AuthenticationWithPlatformLinkV3' test.out

#- 202 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'jVkWGzJC' \
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
    --clientId 'VPBG5s7j' \
    > test.out 2>&1
eval_tap $? 205 'RequestGameTokenCodeResponseV3' test.out

#- 206 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TGJt5MFb' \
    --userId '8flExgmG' \
    > test.out 2>&1
eval_tap $? 206 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 207 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IxndaqLn' \
    > test.out 2>&1
eval_tap $? 207 'RevokeUserV3' test.out

#- 208 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'UhNeUJZL' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --redirectUri 'roRTjMki' \
    --scope 'Sx5QQ9xE' \
    --state 'AWj3mqNg' \
    --targetAuthPage 'YCXUUdlC' \
    --clientId 'zpkC8tEx' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 208 'AuthorizeV3' test.out

#- 209 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'KJcl2sFv' \
    > test.out 2>&1
eval_tap $? 209 'TokenIntrospectionV3' test.out

#- 210 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 210 'GetJWKSV3' test.out

#- 211 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'GeLVepJa' \
    --mfaToken 'wRmyTYko' \
    > test.out 2>&1
eval_tap $? 211 'Change2faMethod' test.out

#- 212 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code '4xyNvhbb' \
    --factor '2HO5fJKS' \
    --mfaToken 'LryIEmyD' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 212 'Verify2faCode' test.out

#- 213 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'grGQ6Lfk' \
    --userId 'PWgYhPfV' \
    > test.out 2>&1
eval_tap $? 213 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 214 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'GOQkbgoL' \
    --clientId 'ol6hZdth' \
    --redirectUri '6xRolsIP' \
    --requestId 'xd6ASnGf' \
    > test.out 2>&1
eval_tap $? 214 'AuthCodeRequestV3' test.out

#- 215 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'IFrRKOU1' \
    --clientId 'oFLmDs0f' \
    --createHeadless  \
    --deviceId 'DvRru7gs' \
    --macAddress 'KEK4z8t6' \
    --platformToken 'DQ79R0sb' \
    > test.out 2>&1
eval_tap $? 215 'PlatformTokenGrantV3' test.out

#- 216 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 216 'GetRevocationListV3' test.out

#- 217 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'ik0XQI7k' \
    > test.out 2>&1
eval_tap $? 217 'TokenRevocationV3' test.out

#- 218 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'fC0wHUN1' \
    --code 'tnDam9Rf' \
    --codeVerifier 'Zk3yH3Ma' \
    --extendExp  \
    --password 'W1iAn7IL' \
    --redirectUri 'Xif0OJ8I' \
    --refreshToken 'y8HLW8fU' \
    --username 'OiVigCz8' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 218 'TokenGrantV3' test.out

#- 219 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'hdCQwTJL' \
    > test.out 2>&1
eval_tap $? 219 'VerifyTokenV3' test.out

#- 220 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'NA2XSLTJ' \
    --code 'e17VrDyk' \
    --error 'l4QpZP3v' \
    --openidAssocHandle 'bkDEaflu' \
    --openidClaimedId 'ZVmHL2Gp' \
    --openidIdentity 'UFfOnut6' \
    --openidMode 'piwoSWFD' \
    --openidNs '3XKh9ZT2' \
    --openidOpEndpoint 'uVe8VxhG' \
    --openidResponseNonce 'CFu4IDUH' \
    --openidReturnTo '7aILoGuI' \
    --openidSig '80u85GZg' \
    --openidSigned 'PuwfngfV' \
    --state 'qOu6iUr5' \
    > test.out 2>&1
eval_tap $? 220 'PlatformAuthenticationV3' test.out

#- 221 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode '1ZjDGMN0' \
    > test.out 2>&1
eval_tap $? 221 'PublicGetInputValidations' test.out

#- 222 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'y6Ef8iyE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 222 'PublicGetCountryAgeRestrictionV3' test.out

#- 223 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 223 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 224 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'OaW85x7y' \
    > test.out 2>&1
eval_tap $? 224 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 225 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dBCgqXrR' \
    --body '{"platformUserIds": ["LI4tiISo", "PI0bLAO6", "WRXgGjHz"]}' \
    > test.out 2>&1
eval_tap $? 225 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 226 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mAieJ5Gq' \
    --platformUserId 'DZ9br8wN' \
    > test.out 2>&1
eval_tap $? 226 'PublicGetUserByPlatformUserIDV3' test.out

#- 227 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'cKlOp13U' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetAsyncStatus' test.out

#- 228 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'KejaGoi0' \
    --limit '51' \
    --offset '78' \
    --query 'fG4saW5d' \
    > test.out 2>&1
eval_tap $? 228 'PublicSearchUserV3' test.out

#- 229 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "9lvhopOw", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "ydsjdFpY", "policyId": "EkKDiDQk", "policyVersionId": "gZEyRWag"}, {"isAccepted": false, "localizedPolicyVersionId": "pSTre8mf", "policyId": "2ephF6fA", "policyVersionId": "w9wMcnl9"}, {"isAccepted": false, "localizedPolicyVersionId": "yiBak7rx", "policyId": "mVuyHpu7", "policyVersionId": "pchGtB8D"}], "authType": "TwrA37Zq", "code": "JZZpornm", "country": "YimR9DAf", "dateOfBirth": "sdtCKCf8", "displayName": "wrWQXk9I", "emailAddress": "wunKj4WW", "password": "k70jqE24", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 229 'PublicCreateUserV3' test.out

#- 230 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'Bd7kmffp' \
    --query 'wA1AL1sp' \
    > test.out 2>&1
eval_tap $? 230 'CheckUserAvailability' test.out

#- 231 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["oG4nDbd0", "VcRZLxc6", "dz4UOpNm"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicBulkGetUsers' test.out

#- 232 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "ycTPTogb", "languageTag": "50BFM7lt"}' \
    > test.out 2>&1
eval_tap $? 232 'PublicSendRegistrationCode' test.out

#- 233 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "wEYIG6OW", "emailAddress": "WpSnk4HD"}' \
    > test.out 2>&1
eval_tap $? 233 'PublicVerifyRegistrationCode' test.out

#- 234 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "vCnMuwyb", "languageTag": "g8te2R5B"}' \
    > test.out 2>&1
eval_tap $? 234 'PublicForgotPasswordV3' test.out

#- 235 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'vlxUcicF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 235 'GetAdminInvitationV3' test.out

#- 236 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'liS8Tkre' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "Lh7xCmL2", "policyId": "EggWGUCy", "policyVersionId": "KhLQCYJe"}, {"isAccepted": true, "localizedPolicyVersionId": "30mRSDlB", "policyId": "YBX3eXPT", "policyVersionId": "0h0r3zki"}, {"isAccepted": true, "localizedPolicyVersionId": "gIp4Olob", "policyId": "7FKxVxh7", "policyVersionId": "9KAquF33"}], "authType": "EMAILPASSWD", "country": "9WlXOpe6", "dateOfBirth": "ClDq43J5", "displayName": "CLjFA3Lu", "password": "8CG3z9R9", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 236 'CreateUserFromInvitationV3' test.out

#- 237 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "ZzMo43gs", "country": "wDmllaIk", "dateOfBirth": "VsTtS3rp", "displayName": "F7AagJuA", "languageTag": "XDJErAWX", "userName": "t8b0Zl0i"}' \
    > test.out 2>&1
eval_tap $? 237 'UpdateUserV3' test.out

#- 238 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "5f4XPUnO", "country": "rHOXf1PB", "dateOfBirth": "54Fl4mgN", "displayName": "J4eW0pjV", "languageTag": "OMzEJKnV", "userName": "PRLXcpuu"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicPartialUpdateUserV3' test.out

#- 239 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "mZOKwV6b", "emailAddress": "21gDakkQ", "languageTag": "1y4OYUxt"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicSendVerificationCodeV3' test.out

#- 240 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "SGjNoDNY", "contactType": "g6pIkn3C", "languageTag": "7Y0Lgegz", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 240 'PublicUserVerificationV3' test.out

#- 241 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "eaKZ3ShZ", "country": "USNZTiG8", "dateOfBirth": "fY9XxbOW", "displayName": "01BlidoZ", "emailAddress": "de12Yt3Q", "password": "hiOlW4vS", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 241 'PublicUpgradeHeadlessAccountV3' test.out

#- 242 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "IkXJohVb", "password": "r9afKxt2"}' \
    > test.out 2>&1
eval_tap $? 242 'PublicVerifyHeadlessAccountV3' test.out

#- 243 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "l1QRTjSU", "newPassword": "K62TeRGf", "oldPassword": "SHPtWCP4"}' \
    > test.out 2>&1
eval_tap $? 243 'PublicUpdatePasswordV3' test.out

#- 244 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'WiUzNaQN' \
    > test.out 2>&1
eval_tap $? 244 'PublicCreateJusticeUser' test.out

#- 245 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zNoiZPT3' \
    --redirectUri 'y7ibo10f' \
    --ticket '3VmIr90B' \
    > test.out 2>&1
eval_tap $? 245 'PublicPlatformLinkV3' test.out

#- 246 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VPaCh0JK' \
    --body '{"platformNamespace": "wiD3mHqB"}' \
    > test.out 2>&1
eval_tap $? 246 'PublicPlatformUnlinkV3' test.out

#- 247 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'eErmtDpj' \
    > test.out 2>&1
eval_tap $? 247 'PublicPlatformUnlinkAllV3' test.out

#- 248 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zpUvyLg8' \
    --ticket 'JZYdGVap' \
    > test.out 2>&1
eval_tap $? 248 'PublicForcePlatformLinkV3' test.out

#- 249 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'u7xqVxu7' \
    --clientId 'uZOeTPA3' \
    --redirectUri 'UT9yA4wu' \
    > test.out 2>&1
eval_tap $? 249 'PublicWebLinkPlatform' test.out

#- 250 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'j7XR4vUZ' \
    --state '9qqtmTVB' \
    > test.out 2>&1
eval_tap $? 250 'PublicWebLinkPlatformEstablish' test.out

#- 251 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "66pxhx2x", "emailAddress": "SkPCHxOo", "newPassword": "19UEE3Tf"}' \
    > test.out 2>&1
eval_tap $? 251 'ResetPasswordV3' test.out

#- 252 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SNYIxVPN' \
    > test.out 2>&1
eval_tap $? 252 'PublicGetUserByUserIdV3' test.out

#- 253 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gb4UfjLA' \
    --activeOnly  \
    --after 'KlNTCHQs' \
    --before '21rET8tO' \
    --limit '64' \
    > test.out 2>&1
eval_tap $? 253 'PublicGetUserBanHistoryV3' test.out

#- 254 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 't3C2eIXF' \
    > test.out 2>&1
eval_tap $? 254 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 255 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TuDMKd1X' \
    > test.out 2>&1
eval_tap $? 255 'PublicGetUserInformationV3' test.out

#- 256 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zb41iT9b' \
    --after '0.5129202758735634' \
    --before '0.5657574300591635' \
    --limit '69' \
    > test.out 2>&1
eval_tap $? 256 'PublicGetUserLoginHistoriesV3' test.out

#- 257 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oInoKioZ' \
    --after 'cS0AZUP7' \
    --before '0pqJB9gJ' \
    --limit '8' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetUserPlatformAccountsV3' test.out

#- 258 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qQAAg8X6' \
    > test.out 2>&1
eval_tap $? 258 'PublicListJusticePlatformAccountsV3' test.out

#- 259 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'JsLbbeIy' \
    --body '{"platformId": "mGr7cKvM", "platformUserId": "RjdRG5gt"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicLinkPlatformAccount' test.out

#- 260 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'a7egA9oQ' \
    --body '{"chosenNamespaces": ["xSc5fd4y", "KqColdSL", "7dzO0442"], "requestId": "nG8H3qNe"}' \
    > test.out 2>&1
eval_tap $? 260 'PublicForceLinkPlatformWithProgression' test.out

#- 261 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HKBZHOWF' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetPublisherUserV3' test.out

#- 262 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JMRO0qbM' \
    --password 'vBOo6CRX' \
    > test.out 2>&1
eval_tap $? 262 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 263 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'x7EWSiUs' \
    --before 'Eb8LOoVC' \
    --isWildcard  \
    --limit '66' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetRolesV3' test.out

#- 264 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'ih7TtpzB' \
    > test.out 2>&1
eval_tap $? 264 'PublicGetRoleV3' test.out

#- 265 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 265 'PublicGetMyUserV3' test.out

#- 266 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "i23y6Wwk"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicSendVerificationLinkV3' test.out

#- 267 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code '9Qegq7VP' \
    > test.out 2>&1
eval_tap $? 267 'PublicVerifyUserByLinkV3' test.out

#- 268 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId '8dvDrmys' \
    --code 'AoC6o4kZ' \
    --error 'Qbh9qrGj' \
    --state 'Fiu3T9n0' \
    > test.out 2>&1
eval_tap $? 268 'PlatformAuthenticateSAMLV3Handler' test.out

#- 269 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId '6VrmSMfl' \
    --payload '5262n0rz' \
    > test.out 2>&1
eval_tap $? 269 'LoginSSOClient' test.out

#- 270 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId '5N8NRury' \
    > test.out 2>&1
eval_tap $? 270 'LogoutSSOClient' test.out

#- 271 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'sT92dVL5' \
    > test.out 2>&1
eval_tap $? 271 'RequestGameTokenResponseV3' test.out

#- 272 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZYzoDtAh' \
    > test.out 2>&1
eval_tap $? 272 'AdminGetDevicesByUserV4' test.out

#- 273 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType '5o103gSY' \
    --endDate 'Bs8XG4CV' \
    --limit '70' \
    --offset '37' \
    --startDate '3rU0JoEl' \
    > test.out 2>&1
eval_tap $? 273 'AdminGetBannedDevicesV4' test.out

#- 274 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LNZbydnF' \
    > test.out 2>&1
eval_tap $? 274 'AdminGetUserDeviceBansV4' test.out

#- 275 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "qL5iL2i2", "deviceId": "1ILiML6v", "deviceType": "gEBOyQQD", "enabled": true, "endDate": "pqbNcixf", "ext": {"2CAjMhfF": {}, "4zCN23F5": {}, "xr6TzG1i": {}}, "reason": "lUhVuq2e"}' \
    > test.out 2>&1
eval_tap $? 275 'AdminBanDeviceV4' test.out

#- 276 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'Qxzd3aYv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 276 'AdminGetDeviceBanV4' test.out

#- 277 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId '2Yk688iv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 277 'AdminUpdateDeviceBanV4' test.out

#- 278 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'cBobMk48' \
    --startDate 'cGGuowKC' \
    --deviceType 'NpEPUyvk' \
    > test.out 2>&1
eval_tap $? 278 'AdminGenerateReportV4' test.out

#- 279 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 279 'AdminGetDeviceTypesV4' test.out

#- 280 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'DPgRZhVo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDeviceBansV4' test.out

#- 281 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'YZyAIIHH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 281 'AdminDecryptDeviceV4' test.out

#- 282 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'eQTu8dfJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 282 'AdminUnbanDeviceV4' test.out

#- 283 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'g9hWLLyR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 283 'AdminGetUsersByDeviceV4' test.out

#- 284 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 1}' \
    > test.out 2>&1
eval_tap $? 284 'AdminCreateTestUsersV4' test.out

#- 285 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["SAMGWirB", "SFGZAPv4", "srFAn8Uc"]}' \
    > test.out 2>&1
eval_tap $? 285 'AdminBulkCheckValidUserIDV4' test.out

#- 286 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OdHEM8yg' \
    --body '{"avatarUrl": "Rn3yTR6g", "country": "APfIRDwy", "dateOfBirth": "YieXcC36", "displayName": "MBBrttaM", "languageTag": "Df0zwYjP", "userName": "wusH0zcD"}' \
    > test.out 2>&1
eval_tap $? 286 'AdminUpdateUserV4' test.out

#- 287 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wJVfoY25' \
    --body '{"code": "5OZeemPx", "emailAddress": "hBRQmcwy"}' \
    > test.out 2>&1
eval_tap $? 287 'AdminUpdateUserEmailAddressV4' test.out

#- 288 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KqRUUqVy' \
    > test.out 2>&1
eval_tap $? 288 'AdminDisableUserMFAV4' test.out

#- 289 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'I2Vc0PYI' \
    > test.out 2>&1
eval_tap $? 289 'AdminListUserRolesV4' test.out

#- 290 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vQWyBrZj' \
    --body '{"assignedNamespaces": ["qzs8jn68", "mgummvAW", "k5M4zyBQ"], "roleId": "GWTfxN18"}' \
    > test.out 2>&1
eval_tap $? 290 'AdminUpdateUserRoleV4' test.out

#- 291 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UFVyVrib' \
    --body '{"assignedNamespaces": ["goM9aZsH", "CjPBNUBV", "H0qDxnFx"], "roleId": "SpKIN9FA"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminAddUserRoleV4' test.out

#- 292 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RxFznxyF' \
    --body '{"assignedNamespaces": ["kisideg5", "zE2J0OHv", "OkoZLcNz"], "roleId": "4gk6sHlI"}' \
    > test.out 2>&1
eval_tap $? 292 'AdminRemoveUserRoleV4' test.out

#- 293 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '8' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 293 'AdminGetRolesV4' test.out

#- 294 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "roleName": "8UuLSBuk"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminCreateRoleV4' test.out

#- 295 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'QzgZj3pE' \
    > test.out 2>&1
eval_tap $? 295 'AdminGetRoleV4' test.out

#- 296 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'gYVSbUGl' \
    > test.out 2>&1
eval_tap $? 296 'AdminDeleteRoleV4' test.out

#- 297 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId '7FWgpvJ4' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "Tsipvb9p"}' \
    > test.out 2>&1
eval_tap $? 297 'AdminUpdateRoleV4' test.out

#- 298 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'tU3IFwtJ' \
    --body '{"permissions": [{"action": 3, "resource": "er6yqM2B", "schedAction": 100, "schedCron": "98yPL3Em", "schedRange": ["wSm0aNOF", "9TMMjnFw", "f0bL6mz7"]}, {"action": 44, "resource": "LeGf60ZL", "schedAction": 67, "schedCron": "Ap4xeKNQ", "schedRange": ["H1kmincb", "w1DHDw0n", "M8L4OI5k"]}, {"action": 37, "resource": "KU5XvgWB", "schedAction": 76, "schedCron": "QEDNjL19", "schedRange": ["u1qEX3eH", "LXCzA2QS", "QR5jS8tT"]}]}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateRolePermissionsV4' test.out

#- 299 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'J0pp291y' \
    --body '{"permissions": [{"action": 92, "resource": "tssqFVuY", "schedAction": 33, "schedCron": "oZztvFvd", "schedRange": ["2mUBw1LE", "j25qrWAc", "e2jpENPk"]}, {"action": 85, "resource": "WBV7UJjk", "schedAction": 14, "schedCron": "qTJNOZ8E", "schedRange": ["UYGsNZBa", "vVsiugGD", "PrgPt0io"]}, {"action": 17, "resource": "poi0dTDd", "schedAction": 11, "schedCron": "7ifa7C80", "schedRange": ["uKhfAoAD", "Ot8sA4rE", "7ZieEard"]}]}' \
    > test.out 2>&1
eval_tap $? 299 'AdminAddRolePermissionsV4' test.out

#- 300 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'VsjMTRH4' \
    --body '["kPxyNd7g", "Fr3vSjzs", "d6EIIROz"]' \
    > test.out 2>&1
eval_tap $? 300 'AdminDeleteRolePermissionsV4' test.out

#- 301 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'cVU5aGwu' \
    --after 'Y9ICEqNV' \
    --before '2hXMXgGB' \
    --limit '49' \
    > test.out 2>&1
eval_tap $? 301 'AdminListAssignedUsersV4' test.out

#- 302 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId '7WD7akqt' \
    --body '{"assignedNamespaces": ["zWmJNnZj", "DmEMOVwO", "6spGMqIc"], "namespace": "52sXNS7i", "userId": "RElumjRw"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminAssignUserToRoleV4' test.out

#- 303 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'EVDhcRBp' \
    --body '{"namespace": "NdhN8Yn7", "userId": "7YnfCidI"}' \
    > test.out 2>&1
eval_tap $? 303 'AdminRevokeUserFromRoleV4' test.out

#- 304 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "qNSwICCT", "country": "wdvbJIqX", "dateOfBirth": "RWoPEX7m", "displayName": "keWtp16L", "languageTag": "teGFiQ05", "userName": "nQe9Hw3O"}' \
    > test.out 2>&1
eval_tap $? 304 'AdminUpdateMyUserV4' test.out

#- 305 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 305 'AdminDisableMyAuthenticatorV4' test.out

#- 306 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'pQtzMF98' \
    > test.out 2>&1
eval_tap $? 306 'AdminEnableMyAuthenticatorV4' test.out

#- 307 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 307 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 308 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 308 'AdminGetMyBackupCodesV4' test.out

#- 309 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 309 'AdminGenerateMyBackupCodesV4' test.out

#- 310 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 310 'AdminDisableMyBackupCodesV4' test.out

#- 311 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 311 'AdminDownloadMyBackupCodesV4' test.out

#- 312 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 312 'AdminEnableMyBackupCodesV4' test.out

#- 313 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 313 'AdminGetMyEnabledFactorsV4' test.out

#- 314 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'vBXPazKY' \
    > test.out 2>&1
eval_tap $? 314 'AdminMakeFactorMyDefaultV4' test.out

#- 315 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["sS4WbrSd", "cdQquwPs", "b0tDspZF"], "emailAddresses": ["CVT2f4Rh", "OH5azgBC", "033F1TsI"], "isAdmin": true, "roleId": "EhgNLFs8"}' \
    > test.out 2>&1
eval_tap $? 315 'AdminInviteUserV4' test.out

#- 316 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "B4F0gC82", "policyId": "koQAOs8Q", "policyVersionId": "8yckEWPt"}, {"isAccepted": true, "localizedPolicyVersionId": "M40s8M6P", "policyId": "3jdIE0XI", "policyVersionId": "0iHf3Wz4"}, {"isAccepted": true, "localizedPolicyVersionId": "8slzfW3e", "policyId": "cMrVbgcA", "policyVersionId": "OB9p56ft"}], "authType": "EMAILPASSWD", "country": "kHXpBWbV", "dateOfBirth": "vB3n4Ub8", "displayName": "vs8oWuOj", "emailAddress": "BvmSZayK", "password": "ZqnkZUwS", "passwordMD5Sum": "DKFPN7UH", "username": "MFtyFVrx", "verified": true}' \
    > test.out 2>&1
eval_tap $? 316 'PublicCreateTestUserV4' test.out

#- 317 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "mLniV9K5", "policyId": "M5ruEklJ", "policyVersionId": "DjKQ4k50"}, {"isAccepted": false, "localizedPolicyVersionId": "hVzbKmAD", "policyId": "tZPhIBM9", "policyVersionId": "VyvXtgEI"}, {"isAccepted": false, "localizedPolicyVersionId": "jGeZZE2U", "policyId": "PqlMXFcC", "policyVersionId": "DiZDnDjE"}], "authType": "EMAILPASSWD", "code": "fuCPF2Gq", "country": "iYPQKEig", "dateOfBirth": "K3VVBPzZ", "displayName": "3nsmkUK3", "emailAddress": "0C6SebPG", "password": "MUiIC67b", "passwordMD5Sum": "f22YjcZp", "reachMinimumAge": false, "username": "bX9Q1335"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicCreateUserV4' test.out

#- 318 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'AiB96DQL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "rxjmGVpH", "policyId": "Esy5vi8V", "policyVersionId": "YbiRMk85"}, {"isAccepted": true, "localizedPolicyVersionId": "MUir39sb", "policyId": "HPZDkQDm", "policyVersionId": "8CJ4H5RM"}, {"isAccepted": false, "localizedPolicyVersionId": "1FiRozZN", "policyId": "omOv5Kid", "policyVersionId": "houhC253"}], "authType": "EMAILPASSWD", "country": "fUGvnsVz", "dateOfBirth": "LhBt7TlK", "displayName": "8LshO5gK", "password": "MceZFpZF", "reachMinimumAge": true, "username": "kWpZN0BT"}' \
    > test.out 2>&1
eval_tap $? 318 'CreateUserFromInvitationV4' test.out

#- 319 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "Rl4gJyKL", "country": "bjG5oC4d", "dateOfBirth": "8wBwXvhs", "displayName": "ajJrRPWk", "languageTag": "1D4Ri6wq", "userName": "lJyPXQaV"}' \
    > test.out 2>&1
eval_tap $? 319 'PublicUpdateUserV4' test.out

#- 320 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "KkvPfxhn", "emailAddress": "Nk3MYOjK"}' \
    > test.out 2>&1
eval_tap $? 320 'PublicUpdateUserEmailAddressV4' test.out

#- 321 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ErjtTMHG", "country": "ccj37s5Z", "dateOfBirth": "fA3SQesd", "displayName": "dFAQPZH6", "emailAddress": "L823hS0h", "password": "pFMls1Yj", "reachMinimumAge": true, "username": "NzD5Xegk", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 321 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 322 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "xoK5e05i", "password": "LmoQIZ0O", "username": "ktRDkwAC"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicUpgradeHeadlessAccountV4' test.out

#- 323 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 323 'PublicDisableMyAuthenticatorV4' test.out

#- 324 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code '2onhkIEK' \
    > test.out 2>&1
eval_tap $? 324 'PublicEnableMyAuthenticatorV4' test.out

#- 325 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 325 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 326 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 326 'PublicGetMyBackupCodesV4' test.out

#- 327 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 327 'PublicGenerateMyBackupCodesV4' test.out

#- 328 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 328 'PublicDisableMyBackupCodesV4' test.out

#- 329 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 329 'PublicDownloadMyBackupCodesV4' test.out

#- 330 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 330 'PublicEnableMyBackupCodesV4' test.out

#- 331 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'P0W7ZFcZ' \
    > test.out 2>&1
eval_tap $? 331 'PublicRemoveTrustedDeviceV4' test.out

#- 332 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 332 'PublicGetMyEnabledFactorsV4' test.out

#- 333 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'mZIXNkob' \
    > test.out 2>&1
eval_tap $? 333 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE