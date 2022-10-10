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
    --body '[{"field": "nkjp3AzQ", "validation": {"allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "blockedWord": ["RlQcOzDM", "FHf7avTG", "xsmEQL7N"], "description": [{"language": "VC8QnQH1", "message": ["plqn2eIk", "RV15YFYW", "DLBLlwam"]}, {"language": "BQG47wso", "message": ["6rSRjRGH", "rt6W7UxD", "dLXRwLBh"]}, {"language": "tjoGUZjZ", "message": ["7Oc8tCQW", "rCH8ztUc", "N2BOupPh"]}], "isCustomRegex": false, "letterCase": "dbyxZXRQ", "maxLength": 92, "maxRepeatingAlphaNum": 18, "maxRepeatingSpecialCharacter": 25, "minCharType": 14, "minLength": 0, "regex": "jdUCX0NZ", "specialCharacterLocation": "nODeY5l7", "specialCharacters": ["2T48jTGY", "nV2neNvL", "bFCSmEgS"]}}, {"field": "8lhgtdt3", "validation": {"allowDigit": false, "allowLetter": false, "allowSpace": false, "allowUnicode": true, "blockedWord": ["TMP4gBO8", "1yDL9NZY", "tFUpVNoP"], "description": [{"language": "NtmsuU6a", "message": ["Pffu40Xu", "YHVtnOXv", "lq6jIKpn"]}, {"language": "Dt7X7D5g", "message": ["9ShSxwqz", "VFBXKQRb", "CzxKI5SY"]}, {"language": "NRUadqME", "message": ["D1uBme5m", "ebw2s4R2", "Xtq3mXck"]}], "isCustomRegex": false, "letterCase": "cRys3NBO", "maxLength": 89, "maxRepeatingAlphaNum": 24, "maxRepeatingSpecialCharacter": 67, "minCharType": 42, "minLength": 80, "regex": "HnDT6Frd", "specialCharacterLocation": "C8pUtyyz", "specialCharacters": ["C29uEUK5", "2SwyXiwe", "2dG1Y4wv"]}}, {"field": "Uyvc4jwU", "validation": {"allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "blockedWord": ["DTBK3AJz", "iC66kgzC", "Jkypmxb5"], "description": [{"language": "6dBTwthc", "message": ["ZdUpjwgZ", "mtvMcMy8", "PuTpc7Fb"]}, {"language": "LjaB50up", "message": ["BdlpYYbE", "aOvH6XJX", "85wAMHXW"]}, {"language": "xGPtkIm2", "message": ["RRHmeFo3", "CgRlppHD", "NL7lnKOB"]}], "isCustomRegex": true, "letterCase": "znXU4nc6", "maxLength": 37, "maxRepeatingAlphaNum": 78, "maxRepeatingSpecialCharacter": 95, "minCharType": 64, "minLength": 3, "regex": "pzn08OXV", "specialCharacterLocation": "hlk14mN3", "specialCharacters": ["YOaJXgcF", "xaNxMm2L", "8qFdk8GB"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'LVyBSQgr' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'pKdPo4y7' \
    --before 'AHEAiyEa' \
    --limit '90' \
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
    --body '{"ageRestriction": 18, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'zQV41dDu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 54}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'QhWudu8x' \
    --limit '93' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "0dNPDTxA", "comment": "Xbg93lAc", "endDate": "aOlNy3Js", "reason": "MKvhzfR0", "skipNotif": false, "userIds": ["O0HfuVE3", "vO6ahmUk", "ucNqt1Ga"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "uOqZvn2x", "userId": "mf4pvzUT"}, {"banId": "mN7GhWfF", "userId": "rBJOxsTh"}, {"banId": "P14cYaeX", "userId": "frtdnber"}]}' \
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
    --limit '33' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["e9YXcyA8", "ghJG9UHX", "Hl5kX4Yx"], "baseUri": "MezMmeNS", "clientId": "iFey45fI", "clientName": "BjIPq8Y0", "clientPermissions": [{"action": 33, "resource": "FtPmQVzV", "schedAction": 43, "schedCron": "Tb4texuQ", "schedRange": ["tUXKMGHn", "PXZWjjKU", "dEprsVgv"]}, {"action": 95, "resource": "cv1yl54m", "schedAction": 76, "schedCron": "VZKSeeuD", "schedRange": ["KCdCIowg", "4m7WJHMA", "yZfS1LkT"]}, {"action": 97, "resource": "GSFCq5wu", "schedAction": 79, "schedCron": "okGjsCoa", "schedRange": ["iJ6QTGIR", "Z5cSjtXV", "9TO12LTd"]}], "clientPlatform": "YqcDNmea", "deletable": true, "namespace": "9IeUscKx", "oauthClientType": "D9eBs1vk", "redirectUri": "rLWqCRsO", "secret": "XybBJB3V", "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'c0VmTSaT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'TxCfoLCL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'N5LrT2Ga' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["hSfWMhmV", "QsREGTPa", "chnecLxX"], "baseUri": "lCrJacYg", "clientName": "fo4THOpR", "clientPermissions": [{"action": 5, "resource": "pQHRuzuz", "schedAction": 2, "schedCron": "1vNr3tWv", "schedRange": ["ojOoBeU2", "HE9Ypma4", "e0zftCab"]}, {"action": 0, "resource": "RxZhaVAp", "schedAction": 55, "schedCron": "cUftOWkb", "schedRange": ["wyb5xzGD", "KVG43YFa", "qJPwH6EL"]}, {"action": 7, "resource": "mcNrWa9b", "schedAction": 62, "schedCron": "CsSSWfAj", "schedRange": ["y4NeUbnl", "9qCmL1eE", "vjTwwbBr"]}], "clientPlatform": "YXqHMnjt", "deletable": true, "namespace": "TcR0ZFAt", "redirectUri": "3VE09XKZ", "twoFactorEnabled": false}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'g8Cw0j7c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 72, "resource": "qDf6NF2R"}, {"action": 71, "resource": "stcUFpqc"}, {"action": 60, "resource": "aeDsLHtf"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'ZNAEpBnS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 24, "resource": "yKHOMcl6"}, {"action": 60, "resource": "IYMuVj30"}, {"action": 73, "resource": "rYOjjyuv"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '77' \
    --clientId 'y0a7hvzj' \
    --namespace "$AB_NAMESPACE" \
    --resource 'v1NBDG1D' \
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
    --limit '90' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0prI8JEJ' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OP9JltI3' \
    --body '{"ACSURL": "PnPK8V29", "AWSCognitoRegion": "1mgaI94u", "AWSCognitoUserPool": "CuK0hQk5", "AllowedClients": ["hjqbIEDG", "oNCNTJUJ", "VgYk55qi"], "AppId": "GqgPO5hn", "AuthorizationEndpoint": "Y5gF4o8N", "ClientId": "L6f8WKdo", "Environment": "Bl4eukmW", "FederationMetadataURL": "cDqgkCOO", "GenericOauthFlow": false, "IsActive": false, "Issuer": "u0rAfxr3", "JWKSEndpoint": "RzRIX0Ri", "KeyID": "kX45dBHd", "NetflixCertificates": {"encryptedPrivateKey": "FUyjsqRL", "encryptedPrivateKeyName": "eCU24ECb", "publicCertificate": "C1tle0Pq", "publicCertificateName": "evS8DmkB", "rootCertificate": "N6Oo7tZe", "rootCertificateName": "lsj9Y58h"}, "OrganizationId": "4CI9O6nu", "PlatformName": "l9zxxITZ", "RedirectUri": "4QuLBoUy", "RegisteredDomains": [{"affectedClientIDs": ["reUlLTZY", "7WmHATiG", "CEvAil6R"], "domain": "SZjsY5zK", "namespaces": ["pp3kgJA0", "hOoUmVq5", "Fk0AWo2e"], "roleId": "XLgS4ont"}, {"affectedClientIDs": ["vH4hdoIL", "F7XVqYlK", "yXEnQhYi"], "domain": "Ws1GnKPH", "namespaces": ["6wtGNn7Z", "VtBBPKgE", "5e32qfuZ"], "roleId": "aOpN9Pse"}, {"affectedClientIDs": ["bLLb10Om", "tkCsalCR", "hCozWnum"], "domain": "1h8VRlao", "namespaces": ["NmD9TOIM", "CXawQvi4", "v1yxvfI8"], "roleId": "twdLsJz3"}], "Secret": "KEFGIO39", "TeamID": "ouqbKsnr", "TokenAuthenticationType": "UCwH3kd6", "TokenClaimsMapping": {"yuEC7fHM": "mNkUDaZt", "3FwGpeKQ": "sFLxb2lJ", "xT1tJPXE": "FEgkYsWr"}, "TokenEndpoint": "ADPloNzH"}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rJjoDzuE' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mi7Hs1UR' \
    --body '{"ACSURL": "GfRfOaFO", "AWSCognitoRegion": "raSM27xL", "AWSCognitoUserPool": "Xn8iMzIZ", "AllowedClients": ["7Rc3iRUD", "rKSVibWB", "vPpVSM3j"], "AppId": "q4JpkDum", "AuthorizationEndpoint": "z4tADwsm", "ClientId": "V0FbcnZQ", "Environment": "XXWpc7NI", "FederationMetadataURL": "A12AU6Wa", "GenericOauthFlow": false, "IsActive": true, "Issuer": "oVmMpSkK", "JWKSEndpoint": "pe3Dp0YW", "KeyID": "Lmhn8Dwx", "NetflixCertificates": {"encryptedPrivateKey": "Y9GGh7DT", "encryptedPrivateKeyName": "xj0ZmTzS", "publicCertificate": "mxY0GVS4", "publicCertificateName": "UneQVvuB", "rootCertificate": "FPA2jSYR", "rootCertificateName": "M7yrBvwu"}, "OrganizationId": "C74D729m", "PlatformName": "iTVUJ993", "RedirectUri": "xXmOoErH", "RegisteredDomains": [{"affectedClientIDs": ["pF2MOoyJ", "9UWcgxkr", "671l6UGa"], "domain": "FlLCq3XM", "namespaces": ["Lo4oU6hf", "z9n9eQ3j", "5uvivsH2"], "roleId": "JE34PKzB"}, {"affectedClientIDs": ["VhJ5dkhz", "YloUeW3p", "QsLVdTvm"], "domain": "90cDlhbl", "namespaces": ["eCbq7QXN", "dST4Qwen", "OTJTeTjk"], "roleId": "P2Ex3sCc"}, {"affectedClientIDs": ["oQWVbJrM", "xI1rIwEI", "3GIGlWPf"], "domain": "LvdMR7rY", "namespaces": ["8MFMAS6G", "lcCLb9xX", "JR2SGZu8"], "roleId": "f42d3sBg"}], "Secret": "0tjeJrBq", "TeamID": "UFgowBa9", "TokenAuthenticationType": "bHnyAvat", "TokenClaimsMapping": {"aBpvEt9j": "ioV4XjSU", "OCeJqlJv": "2vSY450M", "y9D5jAnj": "nseFKVQV"}, "TokenEndpoint": "VVW37w4S"}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jDagy3Da' \
    --body '{"affectedClientIDs": ["KDkg2BKR", "ejWh3DdQ", "NCNi4CYT"], "assignedNamespaces": ["x7VdFwzG", "xftIaATA", "SmlEdrww"], "domain": "Oqvthn7z", "roleId": "MPbL88sG"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YVxELD8a' \
    --body '{"domain": "hiwTVTq7"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OzWqcvcg' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fVNrIIXz' \
    --body '{"acsUrl": "z8qRqvR6", "apiKey": "B4ex8snl", "appId": "ERJfUQuH", "federationMetadataUrl": "PvazJw0D", "isActive": true, "redirectUri": "yh549HAy", "secret": "w9ol9BPl", "ssoUrl": "SaG08reJ"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RjbKaEtP' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dp1WE0QV' \
    --body '{"acsUrl": "t6WPvpSS", "apiKey": "G0HRMtSA", "appId": "ZNEswtXH", "federationMetadataUrl": "MECg5vFQ", "isActive": false, "redirectUri": "svR6CDxS", "secret": "FKfjLqeh", "ssoUrl": "6xqNyP6M"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'X6ABZXwc' \
    --platformUserId 'cCtWG3mq' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'TrvDUHul' \
    --after '93' \
    --before '79' \
    --limit '40' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'fmkKw4Id' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["zrHMC6OC", "vwm8sSf9", "VZG7vw7t"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["GyeAI4IJ", "kFbKUxXS", "6MTweipi"], "isAdmin": true, "roles": ["rzvSO6B1", "OGBGq3Bt", "VxwXtiYV"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 146 'AdminListUsersV3' test.out

#- 147 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'YilhybXw' \
    --endDate 'BPojeXFt' \
    --limit '87' \
    --offset '58' \
    --platformBy 'wQYvw3hR' \
    --platformId 'sEA8vhIa' \
    --query 'z38Tg6wf' \
    --startDate 'Wum4Jnpk' \
    > test.out 2>&1
eval_tap $? 147 'AdminSearchUserV3' test.out

#- 148 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["OE6hdAB4", "z3Mp9gzF", "vApCXChe"]}' \
    > test.out 2>&1
eval_tap $? 148 'AdminGetBulkUserByEmailAddressV3' test.out

#- 149 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6AmUsoK0' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserByUserIdV3' test.out

#- 150 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oG5HaGVh' \
    --body '{"avatarUrl": "zDHsCrNn", "country": "8peU0k8V", "dateOfBirth": "klsdBfTo", "displayName": "MUVmQMkD", "languageTag": "RD26PQUg", "userName": "wZt8HFiR"}' \
    > test.out 2>&1
eval_tap $? 150 'AdminUpdateUserV3' test.out

#- 151 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IycAr7oF' \
    --activeOnly  \
    --after 'U30M4cmc' \
    --before 'WWFCx53R' \
    --limit '47' \
    > test.out 2>&1
eval_tap $? 151 'AdminGetUserBanV3' test.out

#- 152 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'v9AW6yvd' \
    --body '{"ban": "0VpcmrBp", "comment": "KbGQWBPM", "endDate": "n3CbnkGy", "reason": "eNZtIhhi", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 152 'AdminBanUserV3' test.out

#- 153 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'z78Py4SE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gVW0Pws2' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 153 'AdminUpdateUserBanV3' test.out

#- 154 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TRGgvlwH' \
    --body '{"context": "NWLEV6AE", "emailAddress": "N3C8KXA1", "languageTag": "vuqkHEez"}' \
    > test.out 2>&1
eval_tap $? 154 'AdminSendVerificationCodeV3' test.out

#- 155 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'F8ctlwxY' \
    --body '{"Code": "w1s1jyHe", "ContactType": "bBYYpRit", "LanguageTag": "cX2lkLlN", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 155 'AdminVerifyAccountV3' test.out

#- 156 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId '0OAhQocT' \
    > test.out 2>&1
eval_tap $? 156 'GetUserVerificationCode' test.out

#- 157 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ykmqeBKx' \
    > test.out 2>&1
eval_tap $? 157 'AdminGetUserDeletionStatusV3' test.out

#- 158 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FoFUG7lS' \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 158 'AdminUpdateUserDeletionStatusV3' test.out

#- 159 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1XgR07ew' \
    --body '{"code": "xIF2HBbO", "country": "lDA3B6Gl", "dateOfBirth": "Sff7uVRS", "displayName": "UH7HEMZk", "emailAddress": "FXQfqAMJ", "password": "uJOUIjTD", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpgradeHeadlessAccountV3' test.out

#- 160 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dfQWpp0L' \
    > test.out 2>&1
eval_tap $? 160 'AdminDeleteUserInformationV3' test.out

#- 161 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'atvkHg6p' \
    --after '0.8501359191568179' \
    --before '0.9028582419972403' \
    --limit '84' \
    > test.out 2>&1
eval_tap $? 161 'AdminGetUserLoginHistoriesV3' test.out

#- 162 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CemdAlj0' \
    --body '{"languageTag": "vTAxsLgD", "newPassword": "jgW3Dtya", "oldPassword": "R1tcpMv5"}' \
    > test.out 2>&1
eval_tap $? 162 'AdminResetPasswordV3' test.out

#- 163 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MIBEpmXy' \
    --body '{"Permissions": [{"Action": 76, "Resource": "YFKqmTNr", "SchedAction": 54, "SchedCron": "3vae9Thn", "SchedRange": ["ElNHdd5y", "eCVGrHtv", "AoDH74AX"]}, {"Action": 17, "Resource": "wwvVxX6u", "SchedAction": 43, "SchedCron": "KFaC7EvB", "SchedRange": ["Y9ffFDnl", "jSfWD523", "LeDDusfJ"]}, {"Action": 57, "Resource": "2qNLBrtC", "SchedAction": 11, "SchedCron": "pN0gPh1H", "SchedRange": ["DfX43bBr", "tiYVk0Z8", "PLk2WtIO"]}]}' \
    > test.out 2>&1
eval_tap $? 163 'AdminUpdateUserPermissionV3' test.out

#- 164 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ffndymu7' \
    --body '{"Permissions": [{"Action": 86, "Resource": "PUeVrBlx", "SchedAction": 18, "SchedCron": "i3MdUQ1D", "SchedRange": ["YjFmqx7x", "R9E3Jmxh", "MOOHbufN"]}, {"Action": 66, "Resource": "uyOgz9sb", "SchedAction": 36, "SchedCron": "GUgJ5thT", "SchedRange": ["QT4lphy4", "YCIEaJ5n", "T3t0DsGO"]}, {"Action": 90, "Resource": "o1x9Dddt", "SchedAction": 32, "SchedCron": "41Wy04q9", "SchedRange": ["RR04xgBD", "g00qyOIX", "CU1NWtFs"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminAddUserPermissionsV3' test.out

#- 165 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZjxMLKum' \
    --body '[{"Action": 39, "Resource": "E8AeyBUv"}, {"Action": 21, "Resource": "kRdAEchs"}, {"Action": 24, "Resource": "57OWH00d"}]' \
    > test.out 2>&1
eval_tap $? 165 'AdminDeleteUserPermissionBulkV3' test.out

#- 166 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '34' \
    --namespace "$AB_NAMESPACE" \
    --resource 'OSH6mC8l' \
    --userId 'rPW2meGe' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionV3' test.out

#- 167 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VH6yADmH' \
    --after 'fhWyyXFW' \
    --before '86MAb87W' \
    --limit '97' \
    > test.out 2>&1
eval_tap $? 167 'AdminGetUserPlatformAccountsV3' test.out

#- 168 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'oRdKSpEm' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetListJusticePlatformAccounts' test.out

#- 169 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'C6X68ZHM' \
    --userId 'k7jCYWtr' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetUserMapping' test.out

#- 170 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'x68ht8b7' \
    --userId 'bMC2muS0' \
    > test.out 2>&1
eval_tap $? 170 'AdminCreateJusticeUser' test.out

#- 171 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'wRlXnURJ' \
    --body '{"platformId": "itmqehdo", "platformUserId": "qarQcrnW"}' \
    > test.out 2>&1
eval_tap $? 171 'AdminLinkPlatformAccount' test.out

#- 172 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hYO7KVXr' \
    --userId 'TUadmSuU' \
    --body '{"platformNamespace": "iDOZd54h"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminPlatformUnlinkV3' test.out

#- 173 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HTsZXYcB' \
    --userId 'ClLrMRss' \
    --ticket 'ow0GyzWB' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformLinkV3' test.out

#- 174 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'O9IbxkEs' \
    --body '["MLmjYvY0", "up7GszaS", "C0jrtKQc"]' \
    > test.out 2>&1
eval_tap $? 174 'AdminDeleteUserRolesV3' test.out

#- 175 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'b16BrADk' \
    --body '[{"namespace": "yKViCUOk", "roleId": "Ohb2URjy"}, {"namespace": "VyX51pY6", "roleId": "DpNu8Wnv"}, {"namespace": "OyOoSbaQ", "roleId": "FQryU0OC"}]' \
    > test.out 2>&1
eval_tap $? 175 'AdminSaveUserRoleV3' test.out

#- 176 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'psQwKkEz' \
    --userId 'YUsCWl6g' \
    > test.out 2>&1
eval_tap $? 176 'AdminAddUserRoleV3' test.out

#- 177 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'SNq4FRwC' \
    --userId '37Dd1HJy' \
    > test.out 2>&1
eval_tap $? 177 'AdminDeleteUserRoleV3' test.out

#- 178 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QO3DA9x1' \
    --body '{"enabled": false, "reason": "W0hJ4Hm1"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminUpdateUserStatusV3' test.out

#- 179 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7z4Dhgd4' \
    > test.out 2>&1
eval_tap $? 179 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 180 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId '2qJE9myy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "RRwueSZY"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateClientSecretV3' test.out

#- 181 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after '93XLJvGp' \
    --before '4BCPuIyG' \
    --isWildcard  \
    --limit '25' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetRolesV3' test.out

#- 182 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "managers": [{"displayName": "x4KyPc9n", "namespace": "WeGYICQa", "userId": "fuV2824q"}, {"displayName": "Fb4AttlJ", "namespace": "GLmJO6P4", "userId": "K212Rd43"}, {"displayName": "Oo4DFrtx", "namespace": "myRIUgxn", "userId": "w7fI2GVh"}], "members": [{"displayName": "ncBA2uyj", "namespace": "m3mSV4eJ", "userId": "aYt8NOWb"}, {"displayName": "rvBwkXV7", "namespace": "mTqf3rHX", "userId": "cmEtsDQV"}, {"displayName": "11CssVzz", "namespace": "M7lQ7Htv", "userId": "pQmEmqp0"}], "permissions": [{"action": 65, "resource": "9xwfLrDP", "schedAction": 78, "schedCron": "RaRRz9i5", "schedRange": ["xEC9LGnq", "rrIKdmoQ", "p7zlBAbX"]}, {"action": 64, "resource": "eOr01kH0", "schedAction": 96, "schedCron": "sgRs2AVx", "schedRange": ["6BR7qnJi", "qMuuQP8W", "GqX87gjw"]}, {"action": 10, "resource": "mhuT9kuh", "schedAction": 94, "schedCron": "BCi5SoXk", "schedRange": ["INrTboae", "NUNxnAC8", "GZjb6v4C"]}], "roleName": "c3uR1nNT"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminCreateRoleV3' test.out

#- 183 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'fovjKWBG' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRoleV3' test.out

#- 184 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId '1MYKXcZt' \
    > test.out 2>&1
eval_tap $? 184 'AdminDeleteRoleV3' test.out

#- 185 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'o6YVgWRq' \
    --body '{"deletable": false, "isWildcard": true, "roleName": "oRMwFf1C"}' \
    > test.out 2>&1
eval_tap $? 185 'AdminUpdateRoleV3' test.out

#- 186 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'U33175gY' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetRoleAdminStatusV3' test.out

#- 187 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'KNbKagkh' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateAdminRoleStatusV3' test.out

#- 188 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'Vi3WeMum' \
    > test.out 2>&1
eval_tap $? 188 'AdminRemoveRoleAdminV3' test.out

#- 189 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'fYwuuk6o' \
    --after 'ps3qAY8w' \
    --before 'ccR0rPKg' \
    --limit '53' \
    > test.out 2>&1
eval_tap $? 189 'AdminGetRoleManagersV3' test.out

#- 190 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'RYGdI5EF' \
    --body '{"managers": [{"displayName": "1nIG68V7", "namespace": "8aWeJPvU", "userId": "IEaw8i2P"}, {"displayName": "mehhHdkZ", "namespace": "FKTHmitB", "userId": "yDVAr3YM"}, {"displayName": "EEuQAbQd", "namespace": "5PGMX4De", "userId": "NaPXGfsz"}]}' \
    > test.out 2>&1
eval_tap $? 190 'AdminAddRoleManagersV3' test.out

#- 191 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'zUn5bHmf' \
    --body '{"managers": [{"displayName": "m11cbHUI", "namespace": "fTah2zhA", "userId": "ZuYEFGC9"}, {"displayName": "yHynMQXR", "namespace": "E5sIOCiD", "userId": "HHF3GOye"}, {"displayName": "b9odJME7", "namespace": "rcx2lx4m", "userId": "xF7kzOpG"}]}' \
    > test.out 2>&1
eval_tap $? 191 'AdminRemoveRoleManagersV3' test.out

#- 192 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId '4OiUyriW' \
    --after 'truSDpvl' \
    --before 'QrqE3sj2' \
    --limit '42' \
    > test.out 2>&1
eval_tap $? 192 'AdminGetRoleMembersV3' test.out

#- 193 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'LKdVDFSc' \
    --body '{"members": [{"displayName": "31h6sA86", "namespace": "ILFUsG7x", "userId": "cOqhf3oX"}, {"displayName": "MozD4Yg2", "namespace": "27RNvYY3", "userId": "5yX18JJI"}, {"displayName": "MRlU22ct", "namespace": "HIAdW8eZ", "userId": "LaKaXZGL"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminAddRoleMembersV3' test.out

#- 194 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'trm2dFRZ' \
    --body '{"members": [{"displayName": "AdYNiiHL", "namespace": "7UFUMhxY", "userId": "AOBWQO3i"}, {"displayName": "Sxc733fh", "namespace": "dkHVz4ld", "userId": "AVPzwayE"}, {"displayName": "mIw3qAbo", "namespace": "tZx3RDhZ", "userId": "a7NbBond"}]}' \
    > test.out 2>&1
eval_tap $? 194 'AdminRemoveRoleMembersV3' test.out

#- 195 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'INZ4iHPn' \
    --body '{"permissions": [{"action": 34, "resource": "d8QmqMZN", "schedAction": 10, "schedCron": "j2e962om", "schedRange": ["wq6I1QdA", "sbGgcZta", "UFtMaYZ7"]}, {"action": 48, "resource": "hGshxSLB", "schedAction": 66, "schedCron": "R3AuMlNz", "schedRange": ["bH6587XZ", "nKoG14ur", "TojEwNZq"]}, {"action": 84, "resource": "YbApEzHl", "schedAction": 15, "schedCron": "Drd2Cowv", "schedRange": ["cTFamAPf", "zQvsuLVm", "TlJwmVCS"]}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminUpdateRolePermissionsV3' test.out

#- 196 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'hrm1uBIY' \
    --body '{"permissions": [{"action": 79, "resource": "xwt2CjWA", "schedAction": 93, "schedCron": "49KuSTwr", "schedRange": ["uy4pRFB1", "4RgPWYh9", "bpF2cAV3"]}, {"action": 91, "resource": "VBJ46m8k", "schedAction": 44, "schedCron": "tfSoYEqr", "schedRange": ["6sbg8gnF", "JedCM36P", "5IhA8Wtn"]}, {"action": 51, "resource": "RHSG5Jvy", "schedAction": 98, "schedCron": "KUdrheDL", "schedRange": ["gwJrF1Sd", "CczYepJD", "baUblqqj"]}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminAddRolePermissionsV3' test.out

#- 197 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId '9KaFarzY' \
    --body '["ouHvmtQJ", "UUWigcUT", "FK2MHCNz"]' \
    > test.out 2>&1
eval_tap $? 197 'AdminDeleteRolePermissionsV3' test.out

#- 198 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '49' \
    --resource 'ld0407tK' \
    --roleId 'Rhc0mJaC' \
    > test.out 2>&1
eval_tap $? 198 'AdminDeleteRolePermissionV3' test.out

#- 199 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 199 'AdminGetMyUserV3' test.out

#- 200 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'hs4M5R6M' \
    --extendExp  \
    --redirectUri 'sZzfwFwL' \
    --password 'bfJawoxN' \
    --requestId 'YLsz3n1u' \
    --userName 'I2L4XoEH' \
    > test.out 2>&1
eval_tap $? 200 'UserAuthenticationV3' test.out

#- 201 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'GbkKtmAJ' \
    --linkingToken '6DWZYvnB' \
    --password 'IyInyhWS' \
    --username 'FDJb2yaZ' \
    > test.out 2>&1
eval_tap $? 201 'AuthenticationWithPlatformLinkV3' test.out

#- 202 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'ckhswQ0H' \
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
    --clientId '1UFj4xQc' \
    > test.out 2>&1
eval_tap $? 205 'RequestGameTokenCodeResponseV3' test.out

#- 206 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1WFr6gTh' \
    --userId 'E5yQIn2h' \
    > test.out 2>&1
eval_tap $? 206 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 207 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EWz8WvAZ' \
    > test.out 2>&1
eval_tap $? 207 'RevokeUserV3' test.out

#- 208 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'zx5absji' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --redirectUri 'GPa8Wda8' \
    --scope '5rrFcgDu' \
    --state 'vcio2Vz1' \
    --targetAuthPage 'TYVYgUrV' \
    --clientId 'SBkrvCIw' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 208 'AuthorizeV3' test.out

#- 209 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'dKSPPamL' \
    > test.out 2>&1
eval_tap $? 209 'TokenIntrospectionV3' test.out

#- 210 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 210 'GetJWKSV3' test.out

#- 211 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor '010GtqmW' \
    --mfaToken 'lSuifHqb' \
    > test.out 2>&1
eval_tap $? 211 'Change2faMethod' test.out

#- 212 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'tguzLQfH' \
    --factor 'b6LVD1vN' \
    --mfaToken 'CQtX1KsT' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 212 'Verify2faCode' test.out

#- 213 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '90CBR2Zq' \
    --userId 'PQXRD0Lc' \
    > test.out 2>&1
eval_tap $? 213 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 214 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'UfXEQxXj' \
    --clientId '782iojT1' \
    --redirectUri '5oBAI6Pj' \
    --requestId '6KMDb7LQ' \
    > test.out 2>&1
eval_tap $? 214 'AuthCodeRequestV3' test.out

#- 215 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'dVUyM44u' \
    --clientId '8sdgBBTG' \
    --createHeadless  \
    --deviceId 'HX9rM70O' \
    --macAddress 'mWQBtc3k' \
    --platformToken 'Qqw9wbFx' \
    > test.out 2>&1
eval_tap $? 215 'PlatformTokenGrantV3' test.out

#- 216 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 216 'GetRevocationListV3' test.out

#- 217 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'oDl5OuIK' \
    > test.out 2>&1
eval_tap $? 217 'TokenRevocationV3' test.out

#- 218 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'Lkf3czEU' \
    --code 'ZX5dIDDu' \
    --codeVerifier 'VbFLct2g' \
    --extendExp  \
    --password 'KbzU8HOi' \
    --redirectUri 'ziEX5Vs1' \
    --refreshToken '7HNHzN4Q' \
    --username 'eyGnWZvJ' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 218 'TokenGrantV3' test.out

#- 219 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token '6zwQ5KYB' \
    > test.out 2>&1
eval_tap $? 219 'VerifyTokenV3' test.out

#- 220 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'TrtQQC8k' \
    --code 'CF2tlLvw' \
    --error '2TRug2U6' \
    --openidAssocHandle 'PSWzrH1Q' \
    --openidClaimedId '2BKR5Pso' \
    --openidIdentity 'QgtqhpJz' \
    --openidMode 'D4ATsTlC' \
    --openidNs 'rDYqiGja' \
    --openidOpEndpoint 'Q2PXR9mf' \
    --openidResponseNonce 'MjCBA9vu' \
    --openidReturnTo 'MJ5Bk8hL' \
    --openidSig '0mODmZMB' \
    --openidSigned 'bIKdB5Lb' \
    --state '0pX8vsnh' \
    > test.out 2>&1
eval_tap $? 220 'PlatformAuthenticationV3' test.out

#- 221 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'spMe6r3U' \
    > test.out 2>&1
eval_tap $? 221 'PublicGetInputValidations' test.out

#- 222 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'xGWb4cl8' \
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
    --clientId 'MHaa8KcP' \
    > test.out 2>&1
eval_tap $? 224 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 225 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'z9wLAwRy' \
    --body '{"platformUserIds": ["8QeqnXsI", "ntDBzX8y", "WyFMugVu"]}' \
    > test.out 2>&1
eval_tap $? 225 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 226 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dnSpErp9' \
    --platformUserId 'yCAHICzN' \
    > test.out 2>&1
eval_tap $? 226 'PublicGetUserByPlatformUserIDV3' test.out

#- 227 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'g2liAmzM' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetAsyncStatus' test.out

#- 228 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'URVhDR7T' \
    --limit '15' \
    --offset '27' \
    --query 'CAkVtBn8' \
    > test.out 2>&1
eval_tap $? 228 'PublicSearchUserV3' test.out

#- 229 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "MMuu1EiJ", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "E8JZl5E0", "policyId": "t9XEXOyR", "policyVersionId": "tdgeFe3m"}, {"isAccepted": false, "localizedPolicyVersionId": "s2eMNPul", "policyId": "8aiIwoQI", "policyVersionId": "EtYWxNwy"}, {"isAccepted": false, "localizedPolicyVersionId": "1ZVQxJ3g", "policyId": "Dg4l8hHj", "policyVersionId": "kn6hqjJs"}], "authType": "WW8Ubvac", "code": "KQpATxYo", "country": "f3fvXZ4P", "dateOfBirth": "ijPxvm02", "displayName": "Z0an4jkd", "emailAddress": "h7hr3UcH", "password": "0EaFXLzs", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 229 'PublicCreateUserV3' test.out

#- 230 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'sjUkIeYn' \
    --query '6yoQCBVD' \
    > test.out 2>&1
eval_tap $? 230 'CheckUserAvailability' test.out

#- 231 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["EXRcpHst", "fKvGCiHZ", "JdV1Ft8H"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicBulkGetUsers' test.out

#- 232 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "QqWCG1tW", "languageTag": "3BUXyjx7"}' \
    > test.out 2>&1
eval_tap $? 232 'PublicSendRegistrationCode' test.out

#- 233 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "wnNSXqIN", "emailAddress": "HvJpEYpq"}' \
    > test.out 2>&1
eval_tap $? 233 'PublicVerifyRegistrationCode' test.out

#- 234 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "cGSHZ8Hz", "languageTag": "JGWuCCkG"}' \
    > test.out 2>&1
eval_tap $? 234 'PublicForgotPasswordV3' test.out

#- 235 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId '9Ai3X9T5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 235 'GetAdminInvitationV3' test.out

#- 236 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'bNTp5D44' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "sTnOXgQh", "policyId": "Q8sS4Q8J", "policyVersionId": "2wIsrHJE"}, {"isAccepted": false, "localizedPolicyVersionId": "oAiqWeOR", "policyId": "Op7MLEIv", "policyVersionId": "bsFwj0gW"}, {"isAccepted": false, "localizedPolicyVersionId": "mNglAQxd", "policyId": "iSf70jnd", "policyVersionId": "rrLUkkYX"}], "authType": "EMAILPASSWD", "country": "GqAhHwZf", "dateOfBirth": "kdAzTB6r", "displayName": "r9wyoEsg", "password": "GEnEplFm", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 236 'CreateUserFromInvitationV3' test.out

#- 237 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "5cynUfgP", "country": "y10Tgeny", "dateOfBirth": "fy00uZQV", "displayName": "bju96AfY", "languageTag": "76uuqekA", "userName": "fUu3kkv0"}' \
    > test.out 2>&1
eval_tap $? 237 'UpdateUserV3' test.out

#- 238 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "YD2JAo30", "country": "OOisWOuH", "dateOfBirth": "XnwYBWgE", "displayName": "AxR9XpxJ", "languageTag": "9tXWR2Jk", "userName": "G7ke9YCz"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicPartialUpdateUserV3' test.out

#- 239 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "Z8ID1YLG", "emailAddress": "J049LzJ6", "languageTag": "GWT0LEE2"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicSendVerificationCodeV3' test.out

#- 240 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "jjU2DXfQ", "contactType": "mYH4hSuh", "languageTag": "K4XBYjlq", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 240 'PublicUserVerificationV3' test.out

#- 241 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Xt7DbERT", "country": "R2L9KJ9S", "dateOfBirth": "0NWQwaAH", "displayName": "uRbyKcWD", "emailAddress": "JGVdXEjw", "password": "6QNcllQG", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 241 'PublicUpgradeHeadlessAccountV3' test.out

#- 242 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "r8QlLcBg", "password": "dC09UkBo"}' \
    > test.out 2>&1
eval_tap $? 242 'PublicVerifyHeadlessAccountV3' test.out

#- 243 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "ugDnmvu2", "newPassword": "vlxaY317", "oldPassword": "OZTRKU4m"}' \
    > test.out 2>&1
eval_tap $? 243 'PublicUpdatePasswordV3' test.out

#- 244 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'nLNmo2tK' \
    > test.out 2>&1
eval_tap $? 244 'PublicCreateJusticeUser' test.out

#- 245 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'j1apuXec' \
    --redirectUri 'AQlJM2bO' \
    --ticket 'YODJVFtE' \
    > test.out 2>&1
eval_tap $? 245 'PublicPlatformLinkV3' test.out

#- 246 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'K8X5BxZb' \
    --body '{"platformNamespace": "tosDmbRv"}' \
    > test.out 2>&1
eval_tap $? 246 'PublicPlatformUnlinkV3' test.out

#- 247 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gw2t5DhX' \
    > test.out 2>&1
eval_tap $? 247 'PublicPlatformUnlinkAllV3' test.out

#- 248 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MebOCKts' \
    --ticket 'BLRfDGXI' \
    > test.out 2>&1
eval_tap $? 248 'PublicForcePlatformLinkV3' test.out

#- 249 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qJLFCLel' \
    --clientId 'DMjMy7eC' \
    --redirectUri '4p09AoYA' \
    > test.out 2>&1
eval_tap $? 249 'PublicWebLinkPlatform' test.out

#- 250 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sfLLnmPt' \
    --state 'EAqH5z8J' \
    > test.out 2>&1
eval_tap $? 250 'PublicWebLinkPlatformEstablish' test.out

#- 251 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "4N6U1rpa", "emailAddress": "4QhIgwnH", "newPassword": "AAk1g0jW"}' \
    > test.out 2>&1
eval_tap $? 251 'ResetPasswordV3' test.out

#- 252 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'L4MudDvx' \
    > test.out 2>&1
eval_tap $? 252 'PublicGetUserByUserIdV3' test.out

#- 253 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fncrw6g6' \
    --activeOnly  \
    --after 'ufOWWawi' \
    --before 'WbPRZ9Qu' \
    --limit '54' \
    > test.out 2>&1
eval_tap $? 253 'PublicGetUserBanHistoryV3' test.out

#- 254 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8Eoa5qJt' \
    > test.out 2>&1
eval_tap $? 254 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 255 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cl15o2ZM' \
    > test.out 2>&1
eval_tap $? 255 'PublicGetUserInformationV3' test.out

#- 256 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YideueAd' \
    --after '0.46431967282727227' \
    --before '0.9764968902486104' \
    --limit '19' \
    > test.out 2>&1
eval_tap $? 256 'PublicGetUserLoginHistoriesV3' test.out

#- 257 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sK8TcHbK' \
    --after 'kAEVS0lk' \
    --before 'eWcaJ3A9' \
    --limit '42' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetUserPlatformAccountsV3' test.out

#- 258 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6Mg4TQG9' \
    > test.out 2>&1
eval_tap $? 258 'PublicListJusticePlatformAccountsV3' test.out

#- 259 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zc0r99tJ' \
    --body '{"platformId": "wDXwGPUj", "platformUserId": "VFsI68CZ"}' \
    > test.out 2>&1
eval_tap $? 259 'PublicLinkPlatformAccount' test.out

#- 260 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '4ZNnKARS' \
    --body '{"chosenNamespaces": ["mSxGfsow", "v4wT1q5y", "Yp2ICSu5"], "requestId": "Sw06CAs8"}' \
    > test.out 2>&1
eval_tap $? 260 'PublicForceLinkPlatformWithProgression' test.out

#- 261 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sFuB0SGA' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetPublisherUserV3' test.out

#- 262 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'v9nBc1Vu' \
    --password '6bNzG3PW' \
    > test.out 2>&1
eval_tap $? 262 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 263 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after '9nG8oOG2' \
    --before 'ZDJwDsjG' \
    --isWildcard  \
    --limit '100' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetRolesV3' test.out

#- 264 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'DwGTdkbc' \
    > test.out 2>&1
eval_tap $? 264 'PublicGetRoleV3' test.out

#- 265 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 265 'PublicGetMyUserV3' test.out

#- 266 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "9nzx8xic"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicSendVerificationLinkV3' test.out

#- 267 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'b0Mih6Sn' \
    > test.out 2>&1
eval_tap $? 267 'PublicVerifyUserByLinkV3' test.out

#- 268 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 's6uAwnMF' \
    --code 'Zrjtqh6z' \
    --error 'YCMiyZIr' \
    --state 'BR1UAFY6' \
    > test.out 2>&1
eval_tap $? 268 'PlatformAuthenticateSAMLV3Handler' test.out

#- 269 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'D4mvVUgO' \
    --payload 'IMrjZqry' \
    > test.out 2>&1
eval_tap $? 269 'LoginSSOClient' test.out

#- 270 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'QRwTn2lB' \
    > test.out 2>&1
eval_tap $? 270 'LogoutSSOClient' test.out

#- 271 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'dGG47W5x' \
    > test.out 2>&1
eval_tap $? 271 'RequestGameTokenResponseV3' test.out

#- 272 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'V593xudC' \
    > test.out 2>&1
eval_tap $? 272 'AdminGetDevicesByUserV4' test.out

#- 273 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'FckiIsJg' \
    --endDate 'PigYvAtQ' \
    --limit '77' \
    --offset '76' \
    --startDate 'Bq04vA4b' \
    > test.out 2>&1
eval_tap $? 273 'AdminGetBannedDevicesV4' test.out

#- 274 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tfy3oLCA' \
    > test.out 2>&1
eval_tap $? 274 'AdminGetUserDeviceBansV4' test.out

#- 275 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "p7izllxc", "deviceId": "kBAZdn8b", "deviceType": "2yPfiGRB", "enabled": true, "endDate": "QaElZspN", "ext": {"8UzA5RqJ": {}, "bXGeWYfT": {}, "fDoo0maC": {}}, "reason": "ukQ9QjA2"}' \
    > test.out 2>&1
eval_tap $? 275 'AdminBanDeviceV4' test.out

#- 276 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId '7sH9ThNu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 276 'AdminGetDeviceBanV4' test.out

#- 277 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'E1ncJlMD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 277 'AdminUpdateDeviceBanV4' test.out

#- 278 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'NbFosv5z' \
    --startDate 'bAeNNZ8s' \
    --deviceType 'ZtEbNL4F' \
    > test.out 2>&1
eval_tap $? 278 'AdminGenerateReportV4' test.out

#- 279 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 279 'AdminGetDeviceTypesV4' test.out

#- 280 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'hjz9oLRC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDeviceBansV4' test.out

#- 281 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'rRtaM6h8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 281 'AdminDecryptDeviceV4' test.out

#- 282 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'eqBbOhL0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 282 'AdminUnbanDeviceV4' test.out

#- 283 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'F4cRIW3C' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 283 'AdminGetUsersByDeviceV4' test.out

#- 284 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 100}' \
    > test.out 2>&1
eval_tap $? 284 'AdminCreateTestUsersV4' test.out

#- 285 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["cWP3Coyp", "JnTd4PYF", "wSvCQXru"]}' \
    > test.out 2>&1
eval_tap $? 285 'AdminBulkCheckValidUserIDV4' test.out

#- 286 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fjDwccWM' \
    --body '{"avatarUrl": "cnawMhe5", "country": "oJtNezdt", "dateOfBirth": "bFgN8rKH", "displayName": "bBfTSC7C", "languageTag": "n6tyEwiD", "userName": "pAecWMFv"}' \
    > test.out 2>&1
eval_tap $? 286 'AdminUpdateUserV4' test.out

#- 287 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '9J72Ep2g' \
    --body '{"code": "uByWBWFR", "emailAddress": "6DvUUDFI"}' \
    > test.out 2>&1
eval_tap $? 287 'AdminUpdateUserEmailAddressV4' test.out

#- 288 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'L9CvhDVG' \
    > test.out 2>&1
eval_tap $? 288 'AdminDisableUserMFAV4' test.out

#- 289 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uygz5g42' \
    > test.out 2>&1
eval_tap $? 289 'AdminListUserRolesV4' test.out

#- 290 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yEE32ABH' \
    --body '{"assignedNamespaces": ["qXhJGQTZ", "Dg0HWk64", "slnFrpWn"], "roleId": "zVbNypzH"}' \
    > test.out 2>&1
eval_tap $? 290 'AdminUpdateUserRoleV4' test.out

#- 291 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'u6jBqk6s' \
    --body '{"assignedNamespaces": ["1wAkhQ1T", "v94KYws0", "eax2T6Ke"], "roleId": "zAMnqnJn"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminAddUserRoleV4' test.out

#- 292 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AJYhHc2U' \
    --body '{"assignedNamespaces": ["My3HIoGB", "MLUts5AT", "jmt5ElIZ"], "roleId": "mDKwY0rX"}' \
    > test.out 2>&1
eval_tap $? 292 'AdminRemoveUserRoleV4' test.out

#- 293 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '36' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 293 'AdminGetRolesV4' test.out

#- 294 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "jYfcsWEP"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminCreateRoleV4' test.out

#- 295 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'rjPtA1B3' \
    > test.out 2>&1
eval_tap $? 295 'AdminGetRoleV4' test.out

#- 296 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'csFmYERN' \
    > test.out 2>&1
eval_tap $? 296 'AdminDeleteRoleV4' test.out

#- 297 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId '9W3im7JK' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "xvcZlCJ3"}' \
    > test.out 2>&1
eval_tap $? 297 'AdminUpdateRoleV4' test.out

#- 298 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'MFr7nt7g' \
    --body '{"permissions": [{"action": 15, "resource": "yMv0ulOn", "schedAction": 76, "schedCron": "tJDkl39y", "schedRange": ["v5AM5EUF", "biB8gJNq", "0xT8efRA"]}, {"action": 16, "resource": "q2SNI5tG", "schedAction": 56, "schedCron": "cPUIYd3b", "schedRange": ["xxXvhiFj", "dhjEOgBo", "Xu4lnK7k"]}, {"action": 56, "resource": "eXSRLqtd", "schedAction": 27, "schedCron": "KOBGqLu1", "schedRange": ["phKjjnBt", "6KxPR6s0", "oXoHDgCE"]}]}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateRolePermissionsV4' test.out

#- 299 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'LULcxlxd' \
    --body '{"permissions": [{"action": 67, "resource": "FfUysxXn", "schedAction": 10, "schedCron": "ZqxyYJxs", "schedRange": ["UIMCQqJa", "W9LwbCes", "m7lwPSI7"]}, {"action": 83, "resource": "SeE4YfuQ", "schedAction": 92, "schedCron": "NnQoh2au", "schedRange": ["brWWw7NM", "lkqzy6vT", "pfqpjYem"]}, {"action": 99, "resource": "YDIDPwJv", "schedAction": 86, "schedCron": "M0epWPyJ", "schedRange": ["95tR6b2f", "082I5daa", "cfp4S8Yr"]}]}' \
    > test.out 2>&1
eval_tap $? 299 'AdminAddRolePermissionsV4' test.out

#- 300 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'LjuM64gL' \
    --body '["lDNZRVRx", "0b2AMQzM", "JT1uEWMg"]' \
    > test.out 2>&1
eval_tap $? 300 'AdminDeleteRolePermissionsV4' test.out

#- 301 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'zpFXIVv7' \
    --after 'eSIxM1Vl' \
    --before 'DZ78ACT6' \
    --limit '98' \
    > test.out 2>&1
eval_tap $? 301 'AdminListAssignedUsersV4' test.out

#- 302 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'OVlNUbjT' \
    --body '{"assignedNamespaces": ["SybZuzuM", "4NlB2Ath", "nohLWHrF"], "namespace": "nOMO2gAn", "userId": "ns7aMhCQ"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminAssignUserToRoleV4' test.out

#- 303 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'IrS74p9L' \
    --body '{"namespace": "pnb74hkB", "userId": "L3UYIK9j"}' \
    > test.out 2>&1
eval_tap $? 303 'AdminRevokeUserFromRoleV4' test.out

#- 304 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "cAOF0DBn", "country": "50q9Zo1b", "dateOfBirth": "dRol1OT5", "displayName": "5U8MGvr5", "languageTag": "PGWrZ7xy", "userName": "3ZKd0Sf3"}' \
    > test.out 2>&1
eval_tap $? 304 'AdminUpdateMyUserV4' test.out

#- 305 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 305 'AdminDisableMyAuthenticatorV4' test.out

#- 306 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'MpMp5s6x' \
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
    --factor 'f3XH5MKg' \
    > test.out 2>&1
eval_tap $? 314 'AdminMakeFactorMyDefaultV4' test.out

#- 315 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["RcjOVJFX", "AR0npgaO", "calHmhPT"], "emailAddresses": ["q2tyiT8U", "vBDd3wXD", "h2FnpEZZ"], "isAdmin": false, "roleId": "RdfCQpUe"}' \
    > test.out 2>&1
eval_tap $? 315 'AdminInviteUserV4' test.out

#- 316 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "8Z9FT7w0", "policyId": "0tAw3Fg0", "policyVersionId": "QzcAPoVP"}, {"isAccepted": false, "localizedPolicyVersionId": "pLGFptaH", "policyId": "FvNcN4J1", "policyVersionId": "oPRn6Ubq"}, {"isAccepted": false, "localizedPolicyVersionId": "JdHKnJXY", "policyId": "9BFwRhpM", "policyVersionId": "6ewWgcbY"}], "authType": "EMAILPASSWD", "country": "HV4TCo2m", "dateOfBirth": "35dbW10w", "displayName": "m4LYuLKs", "emailAddress": "dqr8Kv4T", "password": "H4DTinng", "passwordMD5Sum": "UvqJK0I7", "username": "MvGsGOrZ", "verified": false}' \
    > test.out 2>&1
eval_tap $? 316 'PublicCreateTestUserV4' test.out

#- 317 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "lLjLcckw", "policyId": "6dnRp12f", "policyVersionId": "5hO8YSOk"}, {"isAccepted": false, "localizedPolicyVersionId": "aP5xFVuC", "policyId": "2TYE2XzI", "policyVersionId": "9F6RP8E6"}, {"isAccepted": true, "localizedPolicyVersionId": "l2JjGdGG", "policyId": "JpmM1st1", "policyVersionId": "23f176Kg"}], "authType": "EMAILPASSWD", "code": "QN2bW50L", "country": "fLOcSckO", "dateOfBirth": "wvWYWOpk", "displayName": "RSKy0dSb", "emailAddress": "VudGSZNY", "password": "lziacN7y", "passwordMD5Sum": "0l8NbO2N", "reachMinimumAge": true, "username": "LoLYAicH"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicCreateUserV4' test.out

#- 318 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'aqgLBk2f' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "6T1MlZGg", "policyId": "oMJgZAbd", "policyVersionId": "c6xxOfXo"}, {"isAccepted": true, "localizedPolicyVersionId": "okB4D0BQ", "policyId": "MuPTlhDW", "policyVersionId": "MBhQW1cu"}, {"isAccepted": false, "localizedPolicyVersionId": "8qqbeC1n", "policyId": "aScms5fH", "policyVersionId": "ozFN4t2w"}], "authType": "EMAILPASSWD", "country": "uIQhbYNk", "dateOfBirth": "o6R9Ai6b", "displayName": "elWCt8tW", "password": "wS3AwSAM", "reachMinimumAge": true, "username": "YXDfHJWZ"}' \
    > test.out 2>&1
eval_tap $? 318 'CreateUserFromInvitationV4' test.out

#- 319 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "dXfxI5ie", "country": "XT5wpS0I", "dateOfBirth": "1Hb9SXIP", "displayName": "F39FmJNf", "languageTag": "AzRn40I3", "userName": "8UVdu1rd"}' \
    > test.out 2>&1
eval_tap $? 319 'PublicUpdateUserV4' test.out

#- 320 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ufIUC1qU", "emailAddress": "CVJFD9VC"}' \
    > test.out 2>&1
eval_tap $? 320 'PublicUpdateUserEmailAddressV4' test.out

#- 321 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "xPpck7Pi", "country": "wjDBzlb7", "dateOfBirth": "0KWYKIbh", "displayName": "M9Cnd45u", "emailAddress": "RTG8uqzj", "password": "Trf3WR5H", "reachMinimumAge": false, "username": "98FaayP3", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 321 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 322 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "lBqkftkx", "password": "B95vlNtP", "username": "J5lWVcut"}' \
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
    --code 'CUOsUpwN' \
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
    --deviceToken 'WsGRA4Gp' \
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
    --factor 'IAmPXs5V' \
    > test.out 2>&1
eval_tap $? 333 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE