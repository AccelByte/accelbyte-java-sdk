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
echo "1..321"

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
    --body '[{"field": "7ADTRauF", "validation": {"allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "blockedWord": ["SWzfBo7V", "KHEAgEdQ", "Y0eG5iN3"], "description": [{"language": "OiHdYPJ7", "message": ["hXJXPRaJ", "fRDdIZ9w", "NJvKb06v"]}, {"language": "vGyEP0Xc", "message": ["efAFNRQe", "YO42nRvv", "7Sb4N1zZ"]}, {"language": "vMuKcjYP", "message": ["LywDSlfR", "x0hMtehi", "UIWMNmYz"]}], "isCustomRegex": false, "letterCase": "AmlWFZKF", "maxLength": 74, "maxRepeatingAlphaNum": 97, "maxRepeatingSpecialCharacter": 96, "minCharType": 42, "minLength": 79, "regex": "ZV2LJzv6", "specialCharacterLocation": "55stMrP2", "specialCharacters": ["BT2sI2h6", "nSyPK0UC", "ZQR2HFVo"]}}, {"field": "rZ56i2jQ", "validation": {"allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "blockedWord": ["PPyQOpzr", "Y4nupaj6", "4FYBer40"], "description": [{"language": "VJkO0prg", "message": ["rfENQ7dM", "0iU10LOH", "00ToCtcn"]}, {"language": "MWm0M4YW", "message": ["Hh1hQK7a", "M8zEzPq8", "GGFwRXua"]}, {"language": "D1z54HlM", "message": ["TPIWTtpA", "bEzYKTR4", "X45c1MTR"]}], "isCustomRegex": false, "letterCase": "a0AzNM34", "maxLength": 45, "maxRepeatingAlphaNum": 84, "maxRepeatingSpecialCharacter": 34, "minCharType": 42, "minLength": 57, "regex": "refy90Fq", "specialCharacterLocation": "00cYOW5E", "specialCharacters": ["iNNtcRq9", "9XdjPoWF", "Yn7KZ6ts"]}}, {"field": "n20kwWXc", "validation": {"allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "blockedWord": ["2OCePPaN", "BVW33CCc", "IXCgOr3H"], "description": [{"language": "guY0ckHE", "message": ["XTJdDEsw", "Qt1NoUc9", "Z1yollTa"]}, {"language": "q1l5fAPr", "message": ["mhPRLYyW", "sSj1KQeA", "K2KSwvda"]}, {"language": "pwUF8NO9", "message": ["HFFdcN5O", "rvJw25wD", "Fjase5ea"]}], "isCustomRegex": false, "letterCase": "Gj5Cbos4", "maxLength": 63, "maxRepeatingAlphaNum": 94, "maxRepeatingSpecialCharacter": 73, "minCharType": 94, "minLength": 11, "regex": "FexT2qNK", "specialCharacterLocation": "s8goYHBe", "specialCharacters": ["7phrB9NG", "jbPT4ISI", "HNK5TINH"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'BjF0fokS' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'FoKrdjW4' \
    --before '9tXWkSvL' \
    --limit '37' \
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
    --body '{"ageRestriction": 55, "enable": true}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'qxj2LHJo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 74}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'qlsQq4PT' \
    --limit '34' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "F0PwkQ9n", "comment": "CMfKbBeK", "endDate": "ElykjCEn", "reason": "ry4kf5oM", "skipNotif": false, "userIds": ["2ypjNvHH", "gTwTD551", "h1NamevD"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "uYTlUqp1", "userId": "2H6lxhtZ"}, {"banId": "K5LZyxle", "userId": "l3ORDOcb"}, {"banId": "5CY9JsqZ", "userId": "uW4kYolT"}]}' \
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
    --limit '23' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["UbFAhM46", "Dz57gtIk", "gOlpy8Mi"], "baseUri": "BvGEf5el", "clientId": "xJXVriB5", "clientName": "aC0PGH7i", "clientPermissions": [{"action": 44, "resource": "7Fa9fQs3", "schedAction": 33, "schedCron": "fV6JIsrM", "schedRange": ["gVGzkm62", "sSCbo1DR", "XuXJoBkF"]}, {"action": 93, "resource": "IfKQ7qr9", "schedAction": 57, "schedCron": "4mqHqKo1", "schedRange": ["YGWAJ5V1", "KL9kowjF", "eB5nHQ9J"]}, {"action": 77, "resource": "Kyt03XOT", "schedAction": 54, "schedCron": "2L8Xc1Fp", "schedRange": ["7S4FFfoN", "KiZo0zJW", "n2sPXDgS"]}], "clientPlatform": "4HLqGGIa", "deletable": false, "namespace": "LFccWqa4", "oauthClientType": "9YgH0hBt", "redirectUri": "8J5HG9XW", "secret": "aEKSC0qH"}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'iLzf8i1H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'evd08qPN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'FmuMiYyv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["TgeToSPW", "Xq1ezRfC", "dv8rCtaY"], "baseUri": "m3VbPah9", "clientName": "OKDg0fUA", "clientPermissions": [{"action": 87, "resource": "V80I64v0", "schedAction": 95, "schedCron": "shezszyS", "schedRange": ["a9XZzw3L", "FgrFHN1k", "4GqeTjcl"]}, {"action": 12, "resource": "hAbvjonV", "schedAction": 65, "schedCron": "CVsMIsMt", "schedRange": ["IOykdiTW", "MoCsQz9q", "k60qfale"]}, {"action": 87, "resource": "5VDYLwKN", "schedAction": 91, "schedCron": "sow7wLuw", "schedRange": ["e86X5109", "2nAcWDUx", "nwkCh5fI"]}], "clientPlatform": "Xd52sMUS", "deletable": true, "namespace": "tbQHAt66", "redirectUri": "Wl35rHUu"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'WsDO7w7H' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 46, "resource": "jkMoMnnZ"}, {"action": 90, "resource": "VBgT4A56"}, {"action": 83, "resource": "s17hhagR"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'Ucsp4JuT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 82, "resource": "70OKS1Ez"}, {"action": 10, "resource": "gr3kBBsW"}, {"action": 77, "resource": "mkE7UVbw"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '85' \
    --clientId 'aKDcTjiT' \
    --namespace "$AB_NAMESPACE" \
    --resource 'SQgJVBTC' \
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
    --limit '51' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gGGLny04' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2FECysAX' \
    --body '{"ACSURL": "k4hpUNVi", "AWSCognitoRegion": "sFZzs8fP", "AWSCognitoUserPool": "mlTvTqx7", "AllowedClients": ["cFnwf185", "JipCuPZg", "SAxT27yK"], "AppId": "HKzB8EtS", "AuthorizationEndpoint": "848YVr8b", "ClientId": "kVZXuk3x", "Environment": "yqVetNzm", "FederationMetadataURL": "VfaOOhOz", "GenericOauthFlow": true, "IsActive": false, "Issuer": "Bpbq7cbi", "JWKSEndpoint": "w2S7trde", "KeyID": "9j8ZNAIu", "NetflixCertificates": {"encryptedPrivateKey": "odQfmjuc", "encryptedPrivateKeyName": "cVm1BIIH", "publicCertificate": "1eybI6eh", "publicCertificateName": "2xWFcYcN", "rootCertificate": "S9ihTSqE", "rootCertificateName": "vf3gMDUx"}, "OrganizationId": "M8o304hh", "PlatformName": "ne91F8pU", "RedirectUri": "uQhwAWUs", "RegisteredDomains": [{"affectedClientIDs": ["0I8a9I33", "fwIgP85N", "Wpx1HtkM"], "domain": "jFPPJWMS", "namespaces": ["8dn01phg", "jjp565qr", "uNM79QdM"], "roleId": "CDB7KKa8"}, {"affectedClientIDs": ["4tLJZH78", "NeP0vbFm", "BZMdPR0E"], "domain": "qqAjmrVj", "namespaces": ["RfZTtMmM", "omXZhMnS", "aHft24fq"], "roleId": "ovcKqzyV"}, {"affectedClientIDs": ["7gULuHLo", "gNuLoHzx", "Hn96dDGL"], "domain": "1xWmkfGz", "namespaces": ["0Ex7JPis", "gy1JeXYY", "ybFQDczj"], "roleId": "KmT8Ebd9"}], "Secret": "RPSmCQUK", "TeamID": "wFmW8heR", "TokenAuthenticationType": "Y2p9dGxG", "TokenClaimsMapping": {"liDbpNJ3": "SikRyiCv", "w4eEtOEK": "qeLhpVYW", "QOtyJnKJ": "5WxThrhy"}, "TokenEndpoint": "4cYjDD2X"}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OHKl8U0H' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8quVDYQa' \
    --body '{"ACSURL": "6ByYDwHQ", "AWSCognitoRegion": "ACEvOE8A", "AWSCognitoUserPool": "iMK9dxbt", "AllowedClients": ["0MIXPron", "g22XbtPF", "bIKGkq5H"], "AppId": "S32uGsGt", "AuthorizationEndpoint": "hekCZQnU", "ClientId": "xqfvaTHn", "Environment": "eu0qfMvX", "FederationMetadataURL": "SPOP3Jnw", "GenericOauthFlow": true, "IsActive": true, "Issuer": "1MtVTBRf", "JWKSEndpoint": "JJTM9mxZ", "KeyID": "Vkytxpax", "NetflixCertificates": {"encryptedPrivateKey": "4YMFA0ml", "encryptedPrivateKeyName": "YlppANbr", "publicCertificate": "RqnXTbDQ", "publicCertificateName": "zLsucg0X", "rootCertificate": "dn6VwzNc", "rootCertificateName": "OWIuzftz"}, "OrganizationId": "bU2G4v3i", "PlatformName": "Ndut8XeO", "RedirectUri": "32BjGlYS", "RegisteredDomains": [{"affectedClientIDs": ["dWRykw2G", "JTgDLWyM", "PT64qagY"], "domain": "q3JbJdEt", "namespaces": ["0zaOoh6D", "ESi2QMWJ", "wRrb7xzG"], "roleId": "VqkRAe8r"}, {"affectedClientIDs": ["Efk9jaej", "sPWk3I6p", "YuiEROcJ"], "domain": "OTtKRel1", "namespaces": ["WXWxnLNq", "P4lAq7Za", "quYPfq70"], "roleId": "fnMORVAE"}, {"affectedClientIDs": ["dash94uG", "TytvrU4l", "9qA9aTyp"], "domain": "X0LrSwis", "namespaces": ["CVzwMwfe", "iq2nQc7R", "ejJm7wLb"], "roleId": "HRXLY0ww"}], "Secret": "12gTgh8N", "TeamID": "Jb0d4fHJ", "TokenAuthenticationType": "6Mzxxis2", "TokenClaimsMapping": {"3I11aVj6": "2XexYD0w", "Crstw0uD": "PR00Ngad", "6FY0yUXU": "BfgjW78o"}, "TokenEndpoint": "IzKnhcrP"}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dVGr1CRB' \
    --body '{"affectedClientIDs": ["KDXzPbJq", "3MvXv06j", "rpbzObm3"], "assignedNamespaces": ["oLTa30Lf", "IcQzGIzc", "gbzX9YEa"], "domain": "I6s4XYqR", "roleId": "NgVyZn9v"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9w03eVS7' \
    --body '{"domain": "vyNXKSSh"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QiT1AO8v' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pD7S6XLq' \
    --body '{"acsUrl": "jvDnLf9X", "apiKey": "hJY3mxMX", "appId": "0TU9TRU1", "federationMetadataUrl": "gLEbUwDJ", "isActive": true, "redirectUri": "DngIicTT", "secret": "7vMdjzXa", "ssoUrl": "aSsvbaNL"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fsEX9xj4' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gHxWt7a4' \
    --body '{"acsUrl": "KPecHQOU", "apiKey": "eOS3KJEq", "appId": "YQRUJOqa", "federationMetadataUrl": "E9IGm10h", "isActive": true, "redirectUri": "YmDOj9Yl", "secret": "iZcCoIro", "ssoUrl": "oRlUFaHm"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZvO90V0s' \
    --platformUserId 'ZR8LvfJW' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'rOijA2Gd' \
    --after '28' \
    --before '83' \
    --limit '96' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'SZjVOg1k' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["nKkt3Hw4", "YtvNFrxl", "x5nAXw7r"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["xRKdvd3K", "l6FXacSU", "GMSW3LiL"], "isAdmin": false, "roles": ["ql2nhJJn", "xysRKJSo", "bUh533u1"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 146 'AdminListUsersV3' test.out

#- 147 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'vzwoO9ms' \
    --endDate 'pPq54ZfG' \
    --limit '3' \
    --offset '6' \
    --platformBy 'pCU8pSEx' \
    --platformId 'MHXv4B6D' \
    --query 'qj8E2OmM' \
    --startDate 'JuAezshM' \
    > test.out 2>&1
eval_tap $? 147 'AdminSearchUserV3' test.out

#- 148 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["Z1a52Jbw", "lUYU1ZKL", "nKKEl4al"]}' \
    > test.out 2>&1
eval_tap $? 148 'AdminGetBulkUserByEmailAddressV3' test.out

#- 149 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IDESHseN' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserByUserIdV3' test.out

#- 150 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BoXusUTp' \
    --body '{"avatarUrl": "HVv4szBQ", "country": "D3nnIDC1", "dateOfBirth": "b586GYke", "displayName": "NCOgM6gr", "languageTag": "6qarf1HW", "userName": "xhOmjXGG"}' \
    > test.out 2>&1
eval_tap $? 150 'AdminUpdateUserV3' test.out

#- 151 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vhxSlKyF' \
    --activeOnly  \
    --after 'SZZKgSsG' \
    --before 'BiDCS9Kj' \
    --limit '56' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserBanV3' test.out

#- 152 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TvRziFln' \
    --body '{"ban": "IR6Z7q1B", "comment": "g7o0FL9h", "endDate": "lzFYiWog", "reason": "Jod7DKQ4", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 152 'AdminBanUserV3' test.out

#- 153 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'Hi59occe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IYpkY6th' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 153 'AdminUpdateUserBanV3' test.out

#- 154 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UBjt3NaJ' \
    --body '{"context": "f5ppRHUS", "emailAddress": "xQhI6NmB", "languageTag": "QvuNCo9g"}' \
    > test.out 2>&1
eval_tap $? 154 'AdminSendVerificationCodeV3' test.out

#- 155 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cM93ujow' \
    --body '{"Code": "UwuD4r2b", "ContactType": "pTqXtYSI", "LanguageTag": "tAz3t5Go", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 155 'AdminVerifyAccountV3' test.out

#- 156 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'QS7zdQ0u' \
    > test.out 2>&1
eval_tap $? 156 'GetUserVerificationCode' test.out

#- 157 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VMd31foc' \
    > test.out 2>&1
eval_tap $? 157 'AdminGetUserDeletionStatusV3' test.out

#- 158 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2J2orWsX' \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 158 'AdminUpdateUserDeletionStatusV3' test.out

#- 159 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tnrF87hj' \
    --body '{"code": "9n7x3TiJ", "country": "KG3CBY9s", "dateOfBirth": "sxAd442u", "displayName": "qHWXZ2tt", "emailAddress": "cDUYt5JO", "password": "3O2VCPxn", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpgradeHeadlessAccountV3' test.out

#- 160 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eGZYv27s' \
    > test.out 2>&1
eval_tap $? 160 'AdminDeleteUserInformationV3' test.out

#- 161 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NiWfcGkg' \
    --after '0.8933598125889594' \
    --before '0.34939957454273274' \
    --limit '99' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetUserLoginHistoriesV3' test.out

#- 162 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kUJbODSx' \
    --body '{"languageTag": "ZrZ2uEN6", "newPassword": "6CeBfvQT", "oldPassword": "EHee5VWJ"}' \
    > test.out 2>&1
eval_tap $? 162 'AdminResetPasswordV3' test.out

#- 163 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'H5o0QvAE' \
    --body '{"Permissions": [{"Action": 66, "Resource": "8qG9aDDj", "SchedAction": 8, "SchedCron": "ZpCYgRtj", "SchedRange": ["4nSDGicB", "HktKzkMy", "PSm2FxAN"]}, {"Action": 85, "Resource": "stN3vgn4", "SchedAction": 51, "SchedCron": "UaL91JQr", "SchedRange": ["s5G8ohs3", "LUe5yx30", "qwJM2atu"]}, {"Action": 88, "Resource": "R18dTptb", "SchedAction": 55, "SchedCron": "LNXvFUi9", "SchedRange": ["tPSQb7WN", "s218tJej", "51cL2XLr"]}]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminUpdateUserPermissionV3' test.out

#- 164 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bo4emKQx' \
    --body '{"Permissions": [{"Action": 91, "Resource": "Ku381i8l", "SchedAction": 74, "SchedCron": "N3F193aK", "SchedRange": ["YRrVihaz", "4obJDQ79", "kgdZMMMf"]}, {"Action": 26, "Resource": "173AREKk", "SchedAction": 56, "SchedCron": "GHWGhJ2e", "SchedRange": ["z0tBXpbQ", "xfGvYAUZ", "WLvwwJ0F"]}, {"Action": 3, "Resource": "oEO6HICw", "SchedAction": 20, "SchedCron": "dCf2tP2b", "SchedRange": ["ElxyeSEC", "4ftV0fVh", "y1WnDgii"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminAddUserPermissionsV3' test.out

#- 165 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6E41SORO' \
    --body '[{"Action": 49, "Resource": "oR8mIlYf"}, {"Action": 75, "Resource": "5VgivHBE"}, {"Action": 92, "Resource": "vc1bQYZe"}]' \
    > test.out 2>&1
eval_tap $? 165 'AdminDeleteUserPermissionBulkV3' test.out

#- 166 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '54' \
    --namespace "$AB_NAMESPACE" \
    --resource 'cEJ2k4w3' \
    --userId 'QVf3fFrN' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionV3' test.out

#- 167 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HCtWGmdZ' \
    --after 'PsMn5zFi' \
    --before 'CYv0tPYh' \
    --limit '35' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserPlatformAccountsV3' test.out

#- 168 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'D4zi8tyc' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetListJusticePlatformAccounts' test.out

#- 169 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '1QPjI2Bp' \
    --userId 'DcGXdZ6K' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetUserMapping' test.out

#- 170 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'QjHe9ajT' \
    --userId 'FBDtbZ35' \
    > test.out 2>&1
eval_tap $? 170 'AdminCreateJusticeUser' test.out

#- 171 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'fiyTnJ5W' \
    --body '{"platformId": "CY2MMzxV", "platformUserId": "guXceapD"}' \
    > test.out 2>&1
eval_tap $? 171 'AdminLinkPlatformAccount' test.out

#- 172 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nIPHf91t' \
    --userId 'tYakpGd3' \
    --body '{"platformNamespace": "l7xiJpXQ"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminPlatformUnlinkV3' test.out

#- 173 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'x35Rz5kQ' \
    --userId 'OCmiF0Tz' \
    --ticket '7uR3KrO5' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformLinkV3' test.out

#- 174 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9FtxKd2r' \
    --body '["zU304EFu", "qFZauYCa", "el1bGR1Q"]' \
    > test.out 2>&1
eval_tap $? 174 'AdminDeleteUserRolesV3' test.out

#- 175 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vw2qdE2U' \
    --body '[{"namespace": "mgvRHe0w", "roleId": "DIv50ila"}, {"namespace": "8AZ88q7y", "roleId": "Fi1Ivfk6"}, {"namespace": "aku2Ul1g", "roleId": "z0s2nNXO"}]' \
    > test.out 2>&1
eval_tap $? 175 'AdminSaveUserRoleV3' test.out

#- 176 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '16HuNfeY' \
    --userId 'EYa3ycYd' \
    > test.out 2>&1
eval_tap $? 176 'AdminAddUserRoleV3' test.out

#- 177 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'KJIrDIyO' \
    --userId 'dqrtXLvn' \
    > test.out 2>&1
eval_tap $? 177 'AdminDeleteUserRoleV3' test.out

#- 178 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mRaRbZX1' \
    --body '{"enabled": true, "reason": "BcDQyWnl"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserStatusV3' test.out

#- 179 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DWpjbpR2' \
    > test.out 2>&1
eval_tap $? 179 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 180 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'Pr6UNNkM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "kShxFgvO"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateClientSecretV3' test.out

#- 181 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after '3cz0fXND' \
    --before 'Ko6EIRCG' \
    --isWildcard  \
    --limit '55' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetRolesV3' test.out

#- 182 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "managers": [{"displayName": "P6MLTPwA", "namespace": "Sl2tPbWm", "userId": "EiQwHsiq"}, {"displayName": "h83BeI32", "namespace": "PSUjx06J", "userId": "T607d4sY"}, {"displayName": "9e6Vxm5l", "namespace": "dLJAanm3", "userId": "3B4ebzM4"}], "members": [{"displayName": "gw9TgAb9", "namespace": "V2tV673q", "userId": "vQIIf9yB"}, {"displayName": "cR4HAjYF", "namespace": "NNi05IEE", "userId": "ehZfxYi7"}, {"displayName": "b4FaKACq", "namespace": "YW6X1vSb", "userId": "FWLd54xV"}], "permissions": [{"action": 54, "resource": "u4KXG8yb", "schedAction": 56, "schedCron": "UCv3fMLE", "schedRange": ["vgOa57mx", "d2rdJ1DY", "iL7jm0bC"]}, {"action": 57, "resource": "9DNh5Sif", "schedAction": 40, "schedCron": "cjxlNUFh", "schedRange": ["Q47n12fS", "4hkbJcea", "561Dye9x"]}, {"action": 69, "resource": "tvZciQfu", "schedAction": 10, "schedCron": "hSFWcuk8", "schedRange": ["SreARr7E", "fxBDsYl0", "xDhvFsvY"]}], "roleName": "aPRuf1fl"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminCreateRoleV3' test.out

#- 183 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'L4Kzj2DU' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRoleV3' test.out

#- 184 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'v8MuaTiC' \
    > test.out 2>&1
eval_tap $? 184 'AdminDeleteRoleV3' test.out

#- 185 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'E0LlH86S' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "H2PCnzTB"}' \
    > test.out 2>&1
eval_tap $? 185 'AdminUpdateRoleV3' test.out

#- 186 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'FL9qCzXm' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetRoleAdminStatusV3' test.out

#- 187 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'dO6l4D5v' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateAdminRoleStatusV3' test.out

#- 188 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '3UStD0O3' \
    > test.out 2>&1
eval_tap $? 188 'AdminRemoveRoleAdminV3' test.out

#- 189 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'PWFuOGWK' \
    --after 'BPkliu9I' \
    --before 'LCkqlrIl' \
    --limit '60' \
    > test.out 2>&1
eval_tap $? 189 'AdminGetRoleManagersV3' test.out

#- 190 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'jHFC6Yaq' \
    --body '{"managers": [{"displayName": "6RRVeELF", "namespace": "kwXZmI5j", "userId": "mgLHFiPr"}, {"displayName": "Y8Iybbm0", "namespace": "mf9p3JO9", "userId": "mjAfatcQ"}, {"displayName": "YDSvnVLj", "namespace": "6uo7zki3", "userId": "2q3z0Xv7"}]}' \
    > test.out 2>&1
eval_tap $? 190 'AdminAddRoleManagersV3' test.out

#- 191 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'TeE6rT3Y' \
    --body '{"managers": [{"displayName": "SLMcJso5", "namespace": "57NJDwD3", "userId": "mHK9l3Zq"}, {"displayName": "yHCd0JSU", "namespace": "JZWyOPYT", "userId": "pp8UIcuE"}, {"displayName": "ecqCmnez", "namespace": "2gCMLqMO", "userId": "GBJz6wRn"}]}' \
    > test.out 2>&1
eval_tap $? 191 'AdminRemoveRoleManagersV3' test.out

#- 192 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId '2VS8QKmT' \
    --after 'iDnka09t' \
    --before 'L3AcNYGf' \
    --limit '7' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetRoleMembersV3' test.out

#- 193 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId '0bEOhPgi' \
    --body '{"members": [{"displayName": "seEmwS9m", "namespace": "HyQlAXup", "userId": "2pKiLkb4"}, {"displayName": "xxQgJ7Bj", "namespace": "8NB7EhEV", "userId": "V8GmBrOS"}, {"displayName": "Dvt7RGTP", "namespace": "T1o5V9lK", "userId": "9NZKhMoI"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminAddRoleMembersV3' test.out

#- 194 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'kUjMvVoe' \
    --body '{"members": [{"displayName": "QuvBeMmO", "namespace": "snE9q0s8", "userId": "xoQChU4F"}, {"displayName": "FBnvYZDJ", "namespace": "qGdnb4gi", "userId": "CriRkQ3a"}, {"displayName": "KSAs5jDK", "namespace": "eNtysl2r", "userId": "fuOrijwt"}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminRemoveRoleMembersV3' test.out

#- 195 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'mlOL9HuQ' \
    --body '{"permissions": [{"action": 93, "resource": "PUBSIaWQ", "schedAction": 49, "schedCron": "t0EpujRW", "schedRange": ["QGwptWdV", "RxZQoZ5E", "9H3njMp1"]}, {"action": 83, "resource": "cmSUMTFm", "schedAction": 6, "schedCron": "NQJWeUrp", "schedRange": ["FybX4wD6", "4ZmlID8m", "saIUUTLS"]}, {"action": 11, "resource": "yX6QGww6", "schedAction": 6, "schedCron": "hHVElsxj", "schedRange": ["wDVs755a", "sdB8y90T", "EZnNR8fd"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminUpdateRolePermissionsV3' test.out

#- 196 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'PXcdfnzs' \
    --body '{"permissions": [{"action": 66, "resource": "gs9Njcjk", "schedAction": 100, "schedCron": "QFEs1zUW", "schedRange": ["4IlolqBA", "mujybwhX", "esYTfZfI"]}, {"action": 34, "resource": "GoYmKSD5", "schedAction": 38, "schedCron": "LwilfVkT", "schedRange": ["9ggxUDN3", "aUzxhKeD", "SEavaOQk"]}, {"action": 95, "resource": "1gPUQYxP", "schedAction": 62, "schedCron": "5UYaou3B", "schedRange": ["sCNdiT7y", "Ve6egqkp", "bsCd0kec"]}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminAddRolePermissionsV3' test.out

#- 197 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'klYY71RO' \
    --body '["OQH6X2ha", "PMuRoj0t", "q5mAiliR"]' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteRolePermissionsV3' test.out

#- 198 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '21' \
    --resource 'qRDFb5li' \
    --roleId 'cYzT8uzm' \
    > test.out 2>&1
eval_tap $? 198 'AdminDeleteRolePermissionV3' test.out

#- 199 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 199 'AdminGetMyUserV3' test.out

#- 200 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'Pqv0gVQu' \
    --extendExp  \
    --redirectUri 'FGY6Loy2' \
    --password 'vrhByjcU' \
    --requestId 'hAb1P01p' \
    --userName 'GQIuBrCm' \
    > test.out 2>&1
eval_tap $? 200 'UserAuthenticationV3' test.out

#- 201 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'v3eXInYb' \
    --linkingToken 'w9sMUYN9' \
    --password 'nh2xlUW5' \
    --username 'BndVdhwq' \
    > test.out 2>&1
eval_tap $? 201 'AuthenticationWithPlatformLinkV3' test.out

#- 202 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'roco63qH' \
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
    --clientId 'ChVQNej5' \
    > test.out 2>&1
eval_tap $? 205 'RequestGameTokenCodeResponseV3' test.out

#- 206 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'J4GCKRTF' \
    --userId 'MSL1FdsS' \
    > test.out 2>&1
eval_tap $? 206 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 207 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ezdmbsoP' \
    > test.out 2>&1
eval_tap $? 207 'RevokeUserV3' test.out

#- 208 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'KTWru1AQ' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --redirectUri '9REr4OcE' \
    --scope 'CrSrimkc' \
    --state 'jqOiCljb' \
    --targetAuthPage 'fLmCgovQ' \
    --clientId 'yjy5JVZq' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 208 'AuthorizeV3' test.out

#- 209 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'oaE7hf6i' \
    > test.out 2>&1
eval_tap $? 209 'TokenIntrospectionV3' test.out

#- 210 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 210 'GetJWKSV3' test.out

#- 211 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'ygXAuCJs' \
    --mfaToken 'EarSsh3P' \
    > test.out 2>&1
eval_tap $? 211 'Change2faMethod' test.out

#- 212 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code '2bKLBscl' \
    --factor 'zEnhNzCd' \
    --mfaToken '4AWA1D5t' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 212 'Verify2faCode' test.out

#- 213 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'iqcyldzp' \
    --userId 'BjMJo0aq' \
    > test.out 2>&1
eval_tap $? 213 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 214 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'KC7PhmkO' \
    --clientId 'Vvr7IBtL' \
    --redirectUri 'hj3n0PRI' \
    --requestId 'Yqv6bnv9' \
    > test.out 2>&1
eval_tap $? 214 'AuthCodeRequestV3' test.out

#- 215 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'nAMNRQOb' \
    --clientId 'VogxSoSd' \
    --createHeadless  \
    --deviceId 'QRAApwk2' \
    --platformToken 'a4fHE5Rk' \
    > test.out 2>&1
eval_tap $? 215 'PlatformTokenGrantV3' test.out

#- 216 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 216 'GetRevocationListV3' test.out

#- 217 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'YxeWfZik' \
    > test.out 2>&1
eval_tap $? 217 'TokenRevocationV3' test.out

#- 218 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'hxF9r0u2' \
    --code 'pj4RpBnx' \
    --codeVerifier 'A7vfffOi' \
    --extendExp  \
    --password '7QmSIYvm' \
    --redirectUri 'KmbkyyrU' \
    --refreshToken 'TvgI63Y8' \
    --username 'xWFTwcNQ' \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 218 'TokenGrantV3' test.out

#- 219 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'lNXzpnV3' \
    > test.out 2>&1
eval_tap $? 219 'VerifyTokenV3' test.out

#- 220 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'BGcd6xoi' \
    --code '2DhaLTL5' \
    --error '4KxSYixg' \
    --openidAssocHandle 'CpSQATmY' \
    --openidClaimedId 'KjY8K7xv' \
    --openidIdentity '5ABvC3BZ' \
    --openidMode 'xnvoscau' \
    --openidNs 'UysoGciu' \
    --openidOpEndpoint 'bg3i3hJw' \
    --openidResponseNonce 'DmIZvkTe' \
    --openidReturnTo 'u1UCY64i' \
    --openidSig 'ZbjIYlnJ' \
    --openidSigned 'SS2U1Iu5' \
    --state 'rIsMOpHR' \
    > test.out 2>&1
eval_tap $? 220 'PlatformAuthenticationV3' test.out

#- 221 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'FqSOlcdN' \
    > test.out 2>&1
eval_tap $? 221 'PublicGetInputValidations' test.out

#- 222 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'JUT1OPOj' \
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
    --clientId 'OfxlLhXj' \
    > test.out 2>&1
eval_tap $? 224 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 225 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'iozSZ4mW' \
    --body '{"platformUserIds": ["tu1tHziq", "IvJ1b6p2", "SOaUmNXL"]}' \
    > test.out 2>&1
eval_tap $? 225 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 226 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'spKCfuqC' \
    --platformUserId 'g4K8G1hc' \
    > test.out 2>&1
eval_tap $? 226 'PublicGetUserByPlatformUserIDV3' test.out

#- 227 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'zMSq3ARw' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetAsyncStatus' test.out

#- 228 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '2T8o3WMl' \
    --limit '62' \
    --offset '66' \
    --query 'iMg5XqlE' \
    > test.out 2>&1
eval_tap $? 228 'PublicSearchUserV3' test.out

#- 229 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "Aj9Beolj", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "bMM89tBr", "policyId": "vjJKorgo", "policyVersionId": "US0zoiko"}, {"isAccepted": false, "localizedPolicyVersionId": "H2fCphj4", "policyId": "llZM6Lnn", "policyVersionId": "STT7KIWn"}, {"isAccepted": true, "localizedPolicyVersionId": "pBwPLKOL", "policyId": "rgWFKq6t", "policyVersionId": "l68TvPFv"}], "authType": "bAewrhuB", "code": "HEC3MC1I", "country": "Y6zeEA5q", "dateOfBirth": "KXqcTOLu", "displayName": "46IHfC6M", "emailAddress": "RGLCXvjl", "password": "oAW90hPV", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 229 'PublicCreateUserV3' test.out

#- 230 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'z3ChfRsP' \
    --query 'Zy2NYo0N' \
    > test.out 2>&1
eval_tap $? 230 'CheckUserAvailability' test.out

#- 231 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["h28aHM36", "UH1bqfhA", "sOBX8kYD"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicBulkGetUsers' test.out

#- 232 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "ew3fHgWc", "languageTag": "EDuF13NP"}' \
    > test.out 2>&1
eval_tap $? 232 'PublicSendRegistrationCode' test.out

#- 233 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "95jJGpeg", "emailAddress": "PTWsJm2q"}' \
    > test.out 2>&1
eval_tap $? 233 'PublicVerifyRegistrationCode' test.out

#- 234 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "rD0FqCpw", "languageTag": "GcrOOJf7"}' \
    > test.out 2>&1
eval_tap $? 234 'PublicForgotPasswordV3' test.out

#- 235 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId '4IZgP01i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 235 'GetAdminInvitationV3' test.out

#- 236 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'cAyGmfo1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "0c8uTXQA", "policyId": "PYcfmdhb", "policyVersionId": "0ONxPPM4"}, {"isAccepted": false, "localizedPolicyVersionId": "XxNNniuV", "policyId": "OpASEdcN", "policyVersionId": "NnR7hMJB"}, {"isAccepted": true, "localizedPolicyVersionId": "CXh1wsDR", "policyId": "hbwYMfgH", "policyVersionId": "qoy10tFi"}], "authType": "EMAILPASSWD", "country": "baJJwOgU", "dateOfBirth": "nEecLEBB", "displayName": "FuXGmJTz", "password": "1s2aFR6Q", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 236 'CreateUserFromInvitationV3' test.out

#- 237 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "6SL0NdCA", "country": "zzqGULs4", "dateOfBirth": "59uqwotv", "displayName": "kxEml3TP", "languageTag": "QDqlsr0O", "userName": "yekSJjck"}' \
    > test.out 2>&1
eval_tap $? 237 'UpdateUserV3' test.out

#- 238 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "T49aWc0f", "country": "5tzuf6Ay", "dateOfBirth": "25UakijK", "displayName": "r9F8VCE9", "languageTag": "CCUQgSeF", "userName": "WA97uRhx"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicPartialUpdateUserV3' test.out

#- 239 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "qc6aV3eW", "emailAddress": "vvxoj1Aa", "languageTag": "cIaAXShp"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicSendVerificationCodeV3' test.out

#- 240 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "4mI28Rcj", "contactType": "usF4moUI", "languageTag": "y3SGiPOY", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 240 'PublicUserVerificationV3' test.out

#- 241 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "uj6lyXvC", "country": "FrTwBJGD", "dateOfBirth": "hJzyX3mK", "displayName": "4VAsrdea", "emailAddress": "8azJ9LE8", "password": "6fNbIB6M", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 241 'PublicUpgradeHeadlessAccountV3' test.out

#- 242 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "UwqhthXS", "password": "WyIt6qZt"}' \
    > test.out 2>&1
eval_tap $? 242 'PublicVerifyHeadlessAccountV3' test.out

#- 243 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "h1icGPKN", "newPassword": "4KSU4azq", "oldPassword": "nKD8l8jj"}' \
    > test.out 2>&1
eval_tap $? 243 'PublicUpdatePasswordV3' test.out

#- 244 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'hIt1CTdv' \
    > test.out 2>&1
eval_tap $? 244 'PublicCreateJusticeUser' test.out

#- 245 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'luzcctbi' \
    --redirectUri 'ui75ceuX' \
    --ticket 'Bgdl1IPq' \
    > test.out 2>&1
eval_tap $? 245 'PublicPlatformLinkV3' test.out

#- 246 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4YnS6eM2' \
    --body '{"platformNamespace": "QU24tItP"}' \
    > test.out 2>&1
eval_tap $? 246 'PublicPlatformUnlinkV3' test.out

#- 247 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9HnILQKw' \
    > test.out 2>&1
eval_tap $? 247 'PublicPlatformUnlinkAllV3' test.out

#- 248 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VO5t4m4C' \
    --ticket '3h3ldw5J' \
    > test.out 2>&1
eval_tap $? 248 'PublicForcePlatformLinkV3' test.out

#- 249 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XE7CYHxI' \
    --clientId 'NwSjwGCj' \
    --redirectUri '0DVE2QES' \
    > test.out 2>&1
eval_tap $? 249 'PublicWebLinkPlatform' test.out

#- 250 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FQV39M3J' \
    --state 'UB8ffArO' \
    > test.out 2>&1
eval_tap $? 250 'PublicWebLinkPlatformEstablish' test.out

#- 251 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "vJFcujC7", "emailAddress": "ul6grGu0", "newPassword": "irQkvxBF"}' \
    > test.out 2>&1
eval_tap $? 251 'ResetPasswordV3' test.out

#- 252 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DN5DcB8d' \
    > test.out 2>&1
eval_tap $? 252 'PublicGetUserByUserIdV3' test.out

#- 253 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HkJ7irvO' \
    --activeOnly  \
    --after 'H17MR8xo' \
    --before 'vb23QIGX' \
    --limit '73' \
    > test.out 2>&1
eval_tap $? 253 'PublicGetUserBanHistoryV3' test.out

#- 254 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2NHbuWjR' \
    > test.out 2>&1
eval_tap $? 254 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 255 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qxu772qH' \
    > test.out 2>&1
eval_tap $? 255 'PublicGetUserInformationV3' test.out

#- 256 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'V1pUP5tp' \
    --after '0.3088660150780893' \
    --before '0.30093615798861884' \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 256 'PublicGetUserLoginHistoriesV3' test.out

#- 257 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rpJW0Udz' \
    --after 'OMpfevba' \
    --before 'LjzsNpvs' \
    --limit '9' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetUserPlatformAccountsV3' test.out

#- 258 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HQKNjlBU' \
    > test.out 2>&1
eval_tap $? 258 'PublicListJusticePlatformAccountsV3' test.out

#- 259 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'SScntY9C' \
    --body '{"platformId": "nnWqCy6F", "platformUserId": "KJnVneXq"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicLinkPlatformAccount' test.out

#- 260 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'r1OMFSpl' \
    --body '{"chosenNamespaces": ["I61Oi5vG", "qZCBEQ7b", "1lPKhjEU"], "requestId": "ppIzPWGn"}' \
    > test.out 2>&1
eval_tap $? 260 'PublicForceLinkPlatformWithProgression' test.out

#- 261 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ve4J8ARE' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetPublisherUserV3' test.out

#- 262 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y5HVi1EK' \
    --password 'lteKIG6u' \
    > test.out 2>&1
eval_tap $? 262 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 263 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'bYCv5kIr' \
    --before '2u9Nu7Bx' \
    --isWildcard  \
    --limit '4' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetRolesV3' test.out

#- 264 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'TfFu5AIL' \
    > test.out 2>&1
eval_tap $? 264 'PublicGetRoleV3' test.out

#- 265 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 265 'PublicGetMyUserV3' test.out

#- 266 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "b8tIMReR"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicSendVerificationLinkV3' test.out

#- 267 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'jbmA3KWR' \
    > test.out 2>&1
eval_tap $? 267 'PublicVerifyUserByLinkV3' test.out

#- 268 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'roT7AwZa' \
    --code 'kkTXEV8w' \
    --error 'COtF7Ldw' \
    --state '2eGNJe7E' \
    > test.out 2>&1
eval_tap $? 268 'PlatformAuthenticateSAMLV3Handler' test.out

#- 269 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId '8U5NYGA1' \
    --payload 'WqQlFsxS' \
    > test.out 2>&1
eval_tap $? 269 'LoginSSOClient' test.out

#- 270 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'bDkqwIqa' \
    > test.out 2>&1
eval_tap $? 270 'LogoutSSOClient' test.out

#- 271 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'uZB9GRus' \
    > test.out 2>&1
eval_tap $? 271 'RequestGameTokenResponseV3' test.out

#- 272 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 61}' \
    > test.out 2>&1
eval_tap $? 272 'AdminCreateTestUsersV4' test.out

#- 273 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["0Oi0BVxc", "ajaqCT1U", "yQYEb5bs"]}' \
    > test.out 2>&1
eval_tap $? 273 'AdminBulkCheckValidUserIDV4' test.out

#- 274 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hxCQeZT9' \
    --body '{"avatarUrl": "JoaehXZJ", "country": "E8BC6hVw", "dateOfBirth": "fg9JGFgP", "displayName": "zT8CIT9h", "languageTag": "4QgpEUHD", "userName": "r0MBwJJE"}' \
    > test.out 2>&1
eval_tap $? 274 'AdminUpdateUserV4' test.out

#- 275 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'H6kMVnrQ' \
    --body '{"code": "d17bDsvo", "emailAddress": "rQamd1gT"}' \
    > test.out 2>&1
eval_tap $? 275 'AdminUpdateUserEmailAddressV4' test.out

#- 276 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qCIvcFd8' \
    > test.out 2>&1
eval_tap $? 276 'AdminDisableUserMFAV4' test.out

#- 277 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ACbHH4bU' \
    > test.out 2>&1
eval_tap $? 277 'AdminListUserRolesV4' test.out

#- 278 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'a054IFrv' \
    --body '{"assignedNamespaces": ["aew71a32", "5MqXB1Dc", "GEjmagBD"], "roleId": "H0PvPlxW"}' \
    > test.out 2>&1
eval_tap $? 278 'AdminUpdateUserRoleV4' test.out

#- 279 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '4vzvVSL5' \
    --body '{"assignedNamespaces": ["QReywYu9", "eyeVc4eM", "6wJKvVTK"], "roleId": "r06B3xcI"}' \
    > test.out 2>&1
eval_tap $? 279 'AdminAddUserRoleV4' test.out

#- 280 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dKJNxPlN' \
    --body '{"assignedNamespaces": ["c388TzmZ", "HEWeUeya", "iMibYjOV"], "roleId": "WWIamjwv"}' \
    > test.out 2>&1
eval_tap $? 280 'AdminRemoveUserRoleV4' test.out

#- 281 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '47' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 281 'AdminGetRolesV4' test.out

#- 282 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "hp1jHtvx"}' \
    > test.out 2>&1
eval_tap $? 282 'AdminCreateRoleV4' test.out

#- 283 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId '7RfSEGSp' \
    > test.out 2>&1
eval_tap $? 283 'AdminGetRoleV4' test.out

#- 284 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId '1oXbwEkq' \
    > test.out 2>&1
eval_tap $? 284 'AdminDeleteRoleV4' test.out

#- 285 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId '9S7FmeQp' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "y3rlhgfg"}' \
    > test.out 2>&1
eval_tap $? 285 'AdminUpdateRoleV4' test.out

#- 286 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'mLu79dXi' \
    --body '{"permissions": [{"action": 97, "resource": "nNlysLc1", "schedAction": 81, "schedCron": "2ZWuy5hW", "schedRange": ["iCdF87eY", "G2KVqTbo", "M4vMBb5Z"]}, {"action": 68, "resource": "9yH3c9AJ", "schedAction": 43, "schedCron": "CuuS7xvq", "schedRange": ["6hHR9qNp", "AwMYy1Sy", "Gu5IolNG"]}, {"action": 61, "resource": "fB9WZzfU", "schedAction": 91, "schedCron": "U7saGhap", "schedRange": ["DVxTTf5l", "1wlpya5S", "Tc3Zy80g"]}]}' \
    > test.out 2>&1
eval_tap $? 286 'AdminUpdateRolePermissionsV4' test.out

#- 287 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'J4jL66cV' \
    --body '{"permissions": [{"action": 75, "resource": "74eieMH0", "schedAction": 6, "schedCron": "fzCFSWJX", "schedRange": ["TqKa5Uuq", "A6EpaMSb", "KCrnHHJY"]}, {"action": 45, "resource": "khx4Gw2t", "schedAction": 16, "schedCron": "HcmrH5YC", "schedRange": ["7rwwCQXc", "cECQtxzT", "vg9PhoRO"]}, {"action": 74, "resource": "JSjOdVQX", "schedAction": 57, "schedCron": "c9hoW8nK", "schedRange": ["cTZGruMC", "xUr92btU", "HRLhHJFR"]}]}' \
    > test.out 2>&1
eval_tap $? 287 'AdminAddRolePermissionsV4' test.out

#- 288 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'CuRmExcE' \
    --body '["21QIyiny", "G2gfJ5xh", "d3Im7OTp"]' \
    > test.out 2>&1
eval_tap $? 288 'AdminDeleteRolePermissionsV4' test.out

#- 289 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId '98vLQLxY' \
    --after 'Y9SbvGHY' \
    --before 'x93NMDj7' \
    --limit '23' \
    > test.out 2>&1
eval_tap $? 289 'AdminListAssignedUsersV4' test.out

#- 290 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'G2ApKYo8' \
    --body '{"assignedNamespaces": ["BYsgOgx9", "KBR7oQCa", "cjr0jOye"], "namespace": "CJ5qGG9f", "userId": "smzAY1Ju"}' \
    > test.out 2>&1
eval_tap $? 290 'AdminAssignUserToRoleV4' test.out

#- 291 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'xcR66OW5' \
    --body '{"namespace": "WvyGFedj", "userId": "1S2vNJgU"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminRevokeUserFromRoleV4' test.out

#- 292 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "ZpWAKMhV", "country": "mO2YcDMt", "dateOfBirth": "e4XDsV79", "displayName": "4rdRKvnf", "languageTag": "PODz7rYq", "userName": "IXuOFXsy"}' \
    > test.out 2>&1
eval_tap $? 292 'AdminUpdateMyUserV4' test.out

#- 293 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 293 'AdminDisableMyAuthenticatorV4' test.out

#- 294 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '9iV2C7ON' \
    > test.out 2>&1
eval_tap $? 294 'AdminEnableMyAuthenticatorV4' test.out

#- 295 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 295 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 296 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 296 'AdminGetMyBackupCodesV4' test.out

#- 297 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 297 'AdminGenerateMyBackupCodesV4' test.out

#- 298 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 298 'AdminDisableMyBackupCodesV4' test.out

#- 299 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 299 'AdminDownloadMyBackupCodesV4' test.out

#- 300 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 300 'AdminEnableMyBackupCodesV4' test.out

#- 301 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 301 'AdminGetMyEnabledFactorsV4' test.out

#- 302 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'tOfvsyKg' \
    > test.out 2>&1
eval_tap $? 302 'AdminMakeFactorMyDefaultV4' test.out

#- 303 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["WjjkDu9z", "IPmnsjoL", "F2x8Rtea"], "emailAddresses": ["B08fmE5Z", "XnXg79Sp", "cp6GHBGU"], "isAdmin": true, "roleId": "F0b9ZLd1"}' \
    > test.out 2>&1
eval_tap $? 303 'AdminInviteUserV4' test.out

#- 304 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "s0cNTTQZ", "policyId": "iD5enBoS", "policyVersionId": "qJttiJj9"}, {"isAccepted": false, "localizedPolicyVersionId": "p0AJKeHh", "policyId": "pTtibcJ5", "policyVersionId": "lszCvxMW"}, {"isAccepted": true, "localizedPolicyVersionId": "nVamCzlM", "policyId": "j4j5W1z6", "policyVersionId": "A2XvABoR"}], "authType": "EMAILPASSWD", "country": "xRVi54AY", "dateOfBirth": "3CtnFuVx", "displayName": "uKNIfiyQ", "emailAddress": "pmhiYFVs", "password": "gFEGWhcw", "passwordMD5Sum": "6DVUMpl7", "username": "BCT3qcVs", "verified": true}' \
    > test.out 2>&1
eval_tap $? 304 'PublicCreateTestUserV4' test.out

#- 305 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "aGDWONjD", "policyId": "oVc0YIhA", "policyVersionId": "vtz31pKF"}, {"isAccepted": false, "localizedPolicyVersionId": "5hEoeroZ", "policyId": "1qPd6UL8", "policyVersionId": "BI1OAAot"}, {"isAccepted": false, "localizedPolicyVersionId": "abzYwJV8", "policyId": "7GMclecw", "policyVersionId": "Y8Fvt6iX"}], "authType": "EMAILPASSWD", "code": "7QGtkrpe", "country": "ZWgm3Vvl", "dateOfBirth": "O9bxGNUH", "displayName": "gW4EDuIQ", "emailAddress": "wbvR3qiL", "password": "SNCJq5OM", "passwordMD5Sum": "0ZJBiEku", "reachMinimumAge": true, "username": "DkdgA8qP"}' \
    > test.out 2>&1
eval_tap $? 305 'PublicCreateUserV4' test.out

#- 306 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'JhepOrUK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "9X5pjuZY", "policyId": "a0cXDvUW", "policyVersionId": "dPhKAJtl"}, {"isAccepted": false, "localizedPolicyVersionId": "RuLm7FAH", "policyId": "3wvo9fKD", "policyVersionId": "IfXxjrD7"}, {"isAccepted": false, "localizedPolicyVersionId": "0Onacv89", "policyId": "mkFrtWjz", "policyVersionId": "ikfgizim"}], "authType": "EMAILPASSWD", "country": "45crMOZh", "dateOfBirth": "oyLi98IS", "displayName": "Dr96JIvS", "password": "3OxMJrdA", "reachMinimumAge": false, "username": "DCQrt1QN"}' \
    > test.out 2>&1
eval_tap $? 306 'CreateUserFromInvitationV4' test.out

#- 307 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "yqDHRq2R", "country": "uXcD7Jva", "dateOfBirth": "UedT752f", "displayName": "iTMYVh3A", "languageTag": "X2JXWzpB", "userName": "plnRFqqg"}' \
    > test.out 2>&1
eval_tap $? 307 'PublicUpdateUserV4' test.out

#- 308 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "NFjTYP6b", "emailAddress": "7dPaiTFS"}' \
    > test.out 2>&1
eval_tap $? 308 'PublicUpdateUserEmailAddressV4' test.out

#- 309 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Rpgghc7T", "country": "8EiXnjr0", "dateOfBirth": "h1KMV2C3", "displayName": "5C3eZqoj", "emailAddress": "Zp2b8ox7", "password": "00MmHwmk", "reachMinimumAge": true, "username": "1rb3xXZe", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 309 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 310 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "g6lk2hRH", "password": "5iDvrMwe", "username": "UKWiQkyQ"}' \
    > test.out 2>&1
eval_tap $? 310 'PublicUpgradeHeadlessAccountV4' test.out

#- 311 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 311 'PublicDisableMyAuthenticatorV4' test.out

#- 312 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'KVtLrraf' \
    > test.out 2>&1
eval_tap $? 312 'PublicEnableMyAuthenticatorV4' test.out

#- 313 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 313 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 314 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 314 'PublicGetMyBackupCodesV4' test.out

#- 315 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 315 'PublicGenerateMyBackupCodesV4' test.out

#- 316 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 316 'PublicDisableMyBackupCodesV4' test.out

#- 317 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 317 'PublicDownloadMyBackupCodesV4' test.out

#- 318 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 318 'PublicEnableMyBackupCodesV4' test.out

#- 319 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'kwmPiDRu' \
    > test.out 2>&1
eval_tap $? 319 'PublicRemoveTrustedDeviceV4' test.out

#- 320 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 320 'PublicGetMyEnabledFactorsV4' test.out

#- 321 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'AICy97aq' \
    > test.out 2>&1
eval_tap $? 321 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE