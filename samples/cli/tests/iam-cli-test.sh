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
echo "1..349"

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
    --body '[{"field": "EAxcVpFrttufHIRd", "validation": {"allowAllSpecialCharacters": true, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "blockedWord": ["W0Oaiw9B0D7eHpzS", "n3ZPUdc0qh4n8mzZ", "0m8SAMTwE6I56IaR"], "description": [{"language": "DBXxyaNoMR6hkspI", "message": ["nrAip6lyzSxwElFH", "Hdgs21Jub74CUkNm", "KJfh5pUkHODpoMF7"]}, {"language": "8NY4YkHs1cnz1JSD", "message": ["gY1TXp38zsCTCrbC", "bPOyNQkT7NvyE3cw", "yALczNIicXm7agSr"]}, {"language": "jJW2OQNOs1PXhT5F", "message": ["vdiRilZ7oFgx4c8O", "umKtPDKJDXn7Z4U6", "8su8XfqlqNiTvB6S"]}], "isCustomRegex": false, "letterCase": "AorKsxwkosAVerXp", "maxLength": 5, "maxRepeatingAlphaNum": 17, "maxRepeatingSpecialCharacter": 58, "minCharType": 36, "minLength": 88, "regex": "fwHuKeb9l3rGN9A3", "specialCharacterLocation": "sNm84hddSpHt0P7M", "specialCharacters": ["IIR7CkyF6C7duuyZ", "0GhDogqrhBRd8lDR", "6qVNPRZYdFLIAjGG"]}}, {"field": "JddVCvu9vx5KQ7KY", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "blockedWord": ["uI9a2I9u6Vpbsx5w", "8hqUI06UpOXGSLmC", "VuHOPlLlkvR8sKgn"], "description": [{"language": "uRkgghGoYupD391C", "message": ["2qtPYokahFjkQsfC", "aTmt1d67FXGk2s9Q", "0mPVo3twu0MesTCf"]}, {"language": "9x4rt69lna7qxNeI", "message": ["xPz6MbwL6IY69z1U", "aLqYSYWytLPziZMd", "jxcBZufQxGiHPllG"]}, {"language": "4cYEzfTD1ZBm3MqH", "message": ["cUmLZZbSqb8RwNmn", "9HrNQy4uZAAiE0mi", "t9RGCCHYzUOcEdsc"]}], "isCustomRegex": false, "letterCase": "PEqgA8yu7Vk6Jt4Y", "maxLength": 25, "maxRepeatingAlphaNum": 16, "maxRepeatingSpecialCharacter": 30, "minCharType": 38, "minLength": 44, "regex": "9Jcdos4fYcTVU6RB", "specialCharacterLocation": "t0zYoMcHyCUEXlAv", "specialCharacters": ["xJMdalwSyliWMNW5", "NyLu0M3VHh2EI8Jl", "DbPWbQ6Q9lNmqRBa"]}}, {"field": "AkLnvxkT1X68cmDc", "validation": {"allowAllSpecialCharacters": false, "allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "blockedWord": ["8MyKrQpM4hkkK6KK", "XNB3Gv0IqmF51Tkh", "jYnaq6foWvXa3bMr"], "description": [{"language": "XsDr6kILsSSyDdmy", "message": ["kmoPYgc2L4jk4Lo0", "LSP0pf4IxjUkl535", "X3ateEKDpADz1x3p"]}, {"language": "oD3Qgb3boLQQ1MzH", "message": ["7Qm8bwbmXgdAPh1E", "ThG96gAFKK2WDgCc", "xvONZm3EeERmDnye"]}, {"language": "FoF7VSZ6pf3vneSD", "message": ["2Tb3g7mSQUhAEtrm", "jqU6YE3p4lSck0ZH", "n5GI39YBHqaTHeKt"]}], "isCustomRegex": false, "letterCase": "8iGeUlc9d9sogWa2", "maxLength": 61, "maxRepeatingAlphaNum": 59, "maxRepeatingSpecialCharacter": 76, "minCharType": 76, "minLength": 80, "regex": "7vIYhGGSyEW4ZJJ4", "specialCharacterLocation": "2d3PBddN8S48l9ly", "specialCharacters": ["NApflxqMrj3oZk03", "QXcKMDYDDxHSZjtq", "XyJ58f7Gc26SaiGV"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'kydwYWQG26yUZNmT' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'BcvrbYCwZtxFHyPL' \
    --before 'tI8ilbyDPUIj88ce' \
    --limit '22' \
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
    --body '{"ageRestriction": 6, "enable": true}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'qCt81P1ktfIovmv9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 13}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'rOvDz9KOsb392k6Y' \
    --limit '26' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "JFfRByjlBiuFM3FI", "comment": "oVk8T3GpAnkCmBUq", "endDate": "g2SCnqntX9y1aZSW", "reason": "MiVi10sG6vxkfUcm", "skipNotif": true, "userIds": ["33T5UBJCjfcnLRfx", "eCSz9WEi8KlloeH0", "JT1yduat2vQR3biB"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "fsu4jmsRE2w1yEkL", "userId": "gh3tIYt4SqYUTLDx"}, {"banId": "9gIiDandpGT2t24a", "userId": "OMh5eC3IHeHSKLCa"}, {"banId": "3xreNDUWehwH3q31", "userId": "A806DJgas4b6z3LN"}]}' \
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
    --clientId 'Uj7fdgLA84Z8YYk6' \
    --clientName 'QEgJjBbEDoNf3n0h' \
    --clientType 'EoRCAcf80zfFyabW' \
    --limit '55' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["q6hRkloqxM3gpwxc", "fMy9XzjjI5YbsKoA", "DkzJEN2VHzih3bit"], "baseUri": "0VWn3CO39PXDNxtX", "clientId": "geO3FgkXhjDzaQY3", "clientName": "snn2ZkP7cFdP43e5", "clientPermissions": [{"action": 7, "resource": "eKa699bRVhyaKwwr", "schedAction": 54, "schedCron": "m4hMzF4TxodenSrU", "schedRange": ["TvfqU0bfoMm5cTtF", "WbotQyXJRcQWsmqP", "Ns92epxk0i8VxsZN"]}, {"action": 9, "resource": "RujIUE1Tq5jyAZvk", "schedAction": 88, "schedCron": "JkETAsSp7gh4TeUT", "schedRange": ["kOkAYfJB8AT9t4Tv", "207Y2QD3oD5fLCr3", "OOlXVv8ZGF7uYnGz"]}, {"action": 31, "resource": "zGYY7KQI1AeFgPqa", "schedAction": 83, "schedCron": "tfNWql4nmwAft4gq", "schedRange": ["kNNlWkD9eOziYRFO", "n0jJLHC9LxhvNXTw", "GBCtohLtl9Zuhytm"]}], "clientPlatform": "5UDrT6QXCs5SPBbR", "deletable": false, "description": "rDgMdIIlhS1fSiM9", "namespace": "331m7Ta1PsKc50Kv", "oauthAccessTokenExpiration": 67, "oauthAccessTokenExpirationTimeUnit": "ecnEevcAx2K2zkRe", "oauthClientType": "nmPZnGBt4P7WnbdS", "oauthRefreshTokenExpiration": 72, "oauthRefreshTokenExpirationTimeUnit": "eQediogEhhM2rIiz", "parentNamespace": "GdKvOPdq5xrgxSmy", "redirectUri": "1DN9LFkYW5DQyj4b", "scopes": ["j5Ro2ogaKt2ujQSa", "3Zdb65UXmy0Zp6iI", "aTIKUkmkk9QM0NBM"], "secret": "A9ORxpzwLR2AK6eX", "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'GPJsw1fiP80G9Pcl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'xcft2ulIJzPyrVEi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'OG4UcqsuGKHhMRWL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["Vd3DlhLuIpomM8sm", "1MiaI1mX2tJoARtd", "bBe7udsMrok0WvGY"], "baseUri": "Ynx4V709xbnGezKs", "clientName": "DwG2omOR2nvYI9TV", "clientPermissions": [{"action": 34, "resource": "jZpjvsugAOS7u8Ri", "schedAction": 99, "schedCron": "l5LL4bTxBmZjdrrI", "schedRange": ["xsB0NRsB1fPqqRRu", "lpqpymDkQhtrHWwR", "VnwVBOqOHi8pWGd1"]}, {"action": 20, "resource": "japIkY9Rf4wP57dB", "schedAction": 65, "schedCron": "NR88YbCtmKy8M9zV", "schedRange": ["rjfGXZnqAQUoY1Gj", "lIIk0iKoTTS1j02o", "7JjTXAQN0qdskdQV"]}, {"action": 73, "resource": "TqI8EFnmDbxIxi4Y", "schedAction": 74, "schedCron": "lSs6g4iY9u02aCNY", "schedRange": ["IWekp18lOC3mNqF7", "Bl0LcghVHfPEspxw", "hRON0bc1eMbEIjow"]}], "clientPlatform": "Lqc3ecjXJbZDKKox", "deletable": true, "description": "645xpdXpai0rYaT5", "namespace": "hOPjaf3H0tYighU0", "oauthAccessTokenExpiration": 98, "oauthAccessTokenExpirationTimeUnit": "LVbLFzHEP8cM4NTw", "oauthRefreshTokenExpiration": 35, "oauthRefreshTokenExpirationTimeUnit": "VgsZXiR1DJ7HVWqM", "redirectUri": "kNSawQUWDFJvJBWi", "scopes": ["c7UkBeIXuqDuAXI6", "6bQ71w0deoV9Lx5R", "DA1l2XcrciYNEzvS"], "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'IPkhSgORcz5S5Bvm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 13, "resource": "65uvuKNuy0ytZQ7M"}, {"action": 33, "resource": "Nzy1adnSKOLFKx1d"}, {"action": 77, "resource": "fRSse6AAz3S4czz0"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'QKFlAVmVLu4AOec0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 52, "resource": "73zdxTgOfnwIdlNa"}, {"action": 100, "resource": "9fDLh741IslKHzGl"}, {"action": 77, "resource": "4sZKHcl5LLLOexL4"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '10' \
    --clientId 'QpRWCiiPDGQhNPEw' \
    --namespace "$AB_NAMESPACE" \
    --resource 'iJCf2XJVrlzqQls1' \
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
    --limit '28' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'zhLVA3kE8jKvgatO' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'EBM70TdlNBJYOmpu' \
    --body '{"ACSURL": "1VCarzBsV6xnZ5Jr", "AWSCognitoRegion": "zzjrcaug6CWVG8SW", "AWSCognitoUserPool": "P3glU6muswVJnNnN", "AllowedClients": ["7kAa7j0riFc5HTHQ", "IoVsGo7dwV9DBqFK", "HQkETJyTlUrwDTno"], "AppId": "ujQD4IEiH9Z5qXn3", "AuthorizationEndpoint": "aoRtlqOECohViHA5", "ClientId": "CzgFSy8X1A3PrIfa", "Environment": "pq5AAeMe4L3mDWOR", "FederationMetadataURL": "BVXTIIJM9XsYIIZx", "GenericOauthFlow": false, "IsActive": false, "Issuer": "XNMR9BgaWcFX3SUB", "JWKSEndpoint": "hyoTsMWPAxUMkawa", "KeyID": "GpAyrIwMif3BOdko", "NetflixCertificates": {"encryptedPrivateKey": "cVTd4BxqGWV6mTJ0", "encryptedPrivateKeyName": "sQs6XNbjvqhnUVLW", "publicCertificate": "u8olKdxL6ozRmDD0", "publicCertificateName": "jJvlfV5OemPYdYT7", "rootCertificate": "DROCjtuzFMbAG9YI", "rootCertificateName": "89hmguB8FOTjMLo4"}, "OrganizationId": "b9rIzqYkEpstyVTB", "PlatformName": "crM8rG0rH0zcswwV", "RedirectUri": "eMK6MbGIVIu8vvwL", "RegisteredDomains": [{"affectedClientIDs": ["c7KY3uVoJXTIMtpg", "kieDyF97lGdMiHKx", "bWCYzo8yO2KTK9tm"], "domain": "mOnYnOpas6ghP1y4", "namespaces": ["Zi7s7QBlk44Z44B1", "GZgKg4uKxaCgcGLu", "C3brWdTYCfHkIySo"], "roleId": "k5DiXZtLW87rGysr"}, {"affectedClientIDs": ["yod3dNQrmsApRA6H", "X3RwrKt2ecozL0TO", "g54vCE48L5oLF6M4"], "domain": "lNa4JUMSHNgqRqCV", "namespaces": ["7usamANkZlOX9Sfo", "95HgXqKhTPkwfLM9", "uSybRzWek2gZvRrv"], "roleId": "r0n9d9lvccKMLhrT"}, {"affectedClientIDs": ["rcBE2ItBS3KtKZWe", "8aoFzAyBME74HUti", "pUWYhWV1qx8CzPML"], "domain": "52faXUr9Sk4lq2fa", "namespaces": ["BcAXXKlhvyH8paOJ", "txqMPpcVfRwNj547", "fH0XrKEDpEY8Vnoc"], "roleId": "GAjci0V3tBf2jnHG"}], "Secret": "KXphn50c9tNLDljh", "TeamID": "Z2jxLRX3z46OCaGB", "TokenAuthenticationType": "eMfPlNos4yBRjrER", "TokenClaimsMapping": {"HEonAZR8GmEu0q1p": "6QCyY6vSkVFWdsbY", "uVEGVxYheR3j5mNZ": "6vwv7K8Asvt1j1Rx", "59hesNWy2NvZ85DD": "KDAF8KDsBZOuYQJ0"}, "TokenEndpoint": "3BAHZ7c53q7akMpc", "UserInfoEndpoint": "mnnx6RVBrop9v7aZ", "UserInfoHTTPMethod": "K3h65hbN15zfQSfQ", "scopes": ["rtfF3TQN0OcNDLr3", "6vzohZyjMQAg5mPY", "hrLTyU8OhgfY9JQY"]}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GF4bYXEcENx9xZlA' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'chob44lONDDwMvgI' \
    --body '{"ACSURL": "0HlyPR7wZNiVsF6x", "AWSCognitoRegion": "G2mXEQdbzIVy8aln", "AWSCognitoUserPool": "cV7vWgSHdfo07Uct", "AllowedClients": ["PErqxyMyOK06MqQB", "ErxgjVBycvU4PbmR", "Dcrg0DjQjBECXvea"], "AppId": "7H1m2lJFRZ3ZprZ6", "AuthorizationEndpoint": "0zMjhTHeh94TSenE", "ClientId": "5hCFkIf5weqZ18MH", "Environment": "57l2Zsrh90ETtYmG", "FederationMetadataURL": "ukz3MnlrjcHp6B8V", "GenericOauthFlow": false, "IsActive": true, "Issuer": "rXFgDnDkdZ9bpjb1", "JWKSEndpoint": "tdA3QhjCMW64f4Xh", "KeyID": "IjSoTB2NMKtezapP", "NetflixCertificates": {"encryptedPrivateKey": "r2QEPx3zTxBGtEJI", "encryptedPrivateKeyName": "YppuUSsKoHw2hyd1", "publicCertificate": "2uSE7BEv3aevq6io", "publicCertificateName": "hU1cg4W1IS3Uv1Bp", "rootCertificate": "WoJBaqdg2FHcunsS", "rootCertificateName": "1lnaO2m9vqjhbeK2"}, "OrganizationId": "qN8g6x2PyYDo5R3h", "PlatformName": "LiD5sf5y1JsxJNGm", "RedirectUri": "yt0SQDUDoWBZVGLl", "RegisteredDomains": [{"affectedClientIDs": ["kUetzCAWc9x1aMjg", "Gim51T107XIZRZ7t", "ZdIs0xf4czdt7zqm"], "domain": "SKxOEQlVcx6GqsBq", "namespaces": ["8vdhWVnuYLgpZehK", "0G2nmyuViB9kRTcS", "QdTnNYGeAfYFG3wS"], "roleId": "kHKufBdS3ZOokZB4"}, {"affectedClientIDs": ["cXnAXyuGz6LlxHv8", "SwyagYvDJ3w3UNgI", "Gj2jZtEYT8sIPSE1"], "domain": "XXPzySa0sZoFS6xC", "namespaces": ["OWMpyh9pMsQgb64E", "LbzDMwyo4nIRysQd", "bufXjYnSoIFeouC2"], "roleId": "m38kXrDZWlGVE9sJ"}, {"affectedClientIDs": ["4NpUtKp6M9I6nEwn", "ZhsjwJeGwaPSDMZz", "95OYKiqaZD63xe5r"], "domain": "ruJVfLGea0ZtlzUc", "namespaces": ["uHAXz0UV31MfuGaX", "sAuGsZaSHevO0TQN", "EI3kfabxJWWSI1EC"], "roleId": "Uo1NPpeFhUztXDgB"}], "Secret": "7n4C97uAPP8PATLp", "TeamID": "UpxeJlsBJT6Hh3OM", "TokenAuthenticationType": "jAjq2mK8lbSEEelx", "TokenClaimsMapping": {"nb5QxWG2HFnZlA6H": "KWW4fI1IQcoBQELc", "NlZkqTZrKgXNwvm4": "e5GX6H742OixhtAo", "KiVm6URT95XhnUcv": "WB28MpusuhhDJ5sl"}, "TokenEndpoint": "zgiWZEtyd56Lfxnb", "UserInfoEndpoint": "Y97jjYgXchCbkXX2", "UserInfoHTTPMethod": "6uEdCfQaMAQuTKfC", "scopes": ["0I2kNjCMDtDMrent", "gn3DhqciwIeShF9R", "Kb9vvxuJlhXbWhbw"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PwToC6knjVwVnzaq' \
    --body '{"affectedClientIDs": ["SfJiQFC2gXoda0kg", "16yUSpSOAjHJWwfC", "jYwWkLob9gKLqs2n"], "assignedNamespaces": ["EZhpByfHZinxNfgP", "AwkMBsznlBUqnLT4", "AbGptKaWNvPbpg7y"], "domain": "rRvXfZ6rvgvEY3Hh", "roleId": "t1SwqTsKKKo37NHD"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OQe91Ps3ztUIV0dS' \
    --body '{"domain": "6hIH9c4VfkyrwpuX"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xbaERbfgPmi0eHkt' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '1mr9EOIFg0dnWIYN' \
    --body '{"acsUrl": "2NVL70Iw157g00jr", "apiKey": "9b8MuYmmeKTmBNvG", "appId": "YxEQdf3ewoGGoY7x", "federationMetadataUrl": "mFNAmjDDCvs78mcM", "isActive": false, "redirectUri": "EfkoYjY2o6ouRW9U", "secret": "tNquwC3WgumrIz4N", "ssoUrl": "hGztZpr4U4fwQIiL"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XgmRasvjO4lj8m3X' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'EwP2b4gd3xOeii8J' \
    --body '{"acsUrl": "nmssep2xD2NY0kAB", "apiKey": "eGs9yxahld1pO0Gy", "appId": "f5PO3COyMvczgEpz", "federationMetadataUrl": "Z3FbtxfhcRC7IVYa", "isActive": true, "redirectUri": "iZ5uFRYNn3SHiWxF", "secret": "0YbuU5ar5qTLWUCy", "ssoUrl": "0Afgc050XIZRW491"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'e94mQjVOOBnIWhun' \
    --platformUserId 'ElqZUodp3IhtCSHy' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '1ei1fIrPvfHnRN06' \
    --after '63' \
    --before '19' \
    --limit '19' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'RwEQlNapJRfk4f9Z' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["cw1pEHAyNFxcVTKu", "AQTGh5BxjWOozGoD", "tsUuYo5p8ED5QZAu"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["fwNa8lzfjv9oYMXM", "jlVHY1AHwF3vGoav", "7MK0PcLnEkcokKwc"], "isAdmin": false, "namespace": "0baDT9OyJ2h23GUS", "roles": ["2amU7syGlElXdEAO", "rVSnLocLVVYamQc4", "wcG5nDBLJoJHbiQ5"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '75' \
    --platformUserId 'uE5p4cfs2E41cK8Q' \
    --platformId 'TwiIAvxSvNDlmM5n' \
    > test.out 2>&1
eval_tap $? 146 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 147 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 147 'AdminListUsersV3' test.out

#- 148 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'FMGzs7fzjgyc44mE' \
    --endDate 'h9tRk8knYSV30lnr' \
    --limit '30' \
    --offset '56' \
    --platformBy 'QehMDli6t9unQLYX' \
    --platformId 'xm09wpGAbpEmDY9v' \
    --query 'Lh3u6EDsUmrV6kH4' \
    --startDate 'OotKwG3UC6XCnnZx' \
    > test.out 2>&1
eval_tap $? 148 'AdminSearchUserV3' test.out

#- 149 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["F8CmQr17W65br34r", "BBN9tU6TDm5GloFS", "KWM1eym5ydC6p25x"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetBulkUserByEmailAddressV3' test.out

#- 150 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CWTqUOYZENJ1QHZQ' \
    > test.out 2>&1
eval_tap $? 150 'AdminGetUserByUserIdV3' test.out

#- 151 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xPRXH7uxBJEECQE1' \
    --body '{"avatarUrl": "li3Bg7Jxc9pUnZmv", "country": "hidwCkZwqjYLfTiC", "dateOfBirth": "O1NDBvQvRPnAz4Vz", "displayName": "W0CpoBCbyJsF5IjF", "languageTag": "1c0W338HS6CBgVRy", "userName": "ihYNZ84CVhziXV8H"}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserV3' test.out

#- 152 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wSmvcvcDKF19yVRa' \
    --activeOnly  \
    --after 'fCjOuSYht83AdvBa' \
    --before 'agTiRJ8daGTVX3Bb' \
    --limit '31' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetUserBanV3' test.out

#- 153 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jlz5IfHgKjI9mwJS' \
    --body '{"ban": "rN8jkIykR2zbaI6P", "comment": "D7fEscShnGUGUtV9", "endDate": "GJ279GDbLNwjm3FK", "reason": "0nnX2poMfZ1hDHtb", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 153 'AdminBanUserV3' test.out

#- 154 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'CKUh5RD9vNAp4jin' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FpnQ5xF9wwbvMZye' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 154 'AdminUpdateUserBanV3' test.out

#- 155 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A3HTovFi4tPAGfle' \
    --body '{"context": "yCA6jEtcqsnzoVIL", "emailAddress": "jkwW61duF87aUyrd", "languageTag": "t4XSpWBAetsanzqP"}' \
    > test.out 2>&1
eval_tap $? 155 'AdminSendVerificationCodeV3' test.out

#- 156 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8oxfrtbECD1CYPwa' \
    --body '{"Code": "iBAxfYL8Avt70ZUT", "ContactType": "2fSk3LL0calqxEew", "LanguageTag": "uGS469k2hG0WKt4s", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 156 'AdminVerifyAccountV3' test.out

#- 157 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'manYxM0UHZVNYzGM' \
    > test.out 2>&1
eval_tap $? 157 'GetUserVerificationCode' test.out

#- 158 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NIpWoSLkUrfuf4U3' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserDeletionStatusV3' test.out

#- 159 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WeYeA9t2ENKKWrFt' \
    --body '{"deletionDate": 68, "enabled": true}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpdateUserDeletionStatusV3' test.out

#- 160 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ii1CMgKAOG5iDcCR' \
    --body '{"code": "5PbCvDLil8wj9cKM", "country": "3Ar6MF35hCER4nGm", "dateOfBirth": "WGgTJfHlJl4tHGa4", "displayName": "XfZcd9CVnGqMX9Fi", "emailAddress": "eeEssWEUl07bhwnt", "password": "CVqiYOJf5KwMZQjz", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpgradeHeadlessAccountV3' test.out

#- 161 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'X3LLaGPGdqLE8Soh' \
    > test.out 2>&1
eval_tap $? 161 'AdminDeleteUserInformationV3' test.out

#- 162 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hhuiTnJarYYkHBDd' \
    --after '0.7119676838673834' \
    --before '0.4047003592441377' \
    --limit '57' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetUserLoginHistoriesV3' test.out

#- 163 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z9TGVPmv34h6T7Es' \
    --body '{"languageTag": "ufmfxKYB4LM6H6QX", "newPassword": "mpZ9X3fUSR1l9xLP", "oldPassword": "BsmAUrD9L1IiD6Ml"}' \
    > test.out 2>&1
eval_tap $? 163 'AdminResetPasswordV3' test.out

#- 164 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cEPhMDFzjHZ3sIhz' \
    --body '{"Permissions": [{"Action": 83, "Resource": "MHX6AgMep90AyyUJ", "SchedAction": 50, "SchedCron": "9n8D2eLMe3lt9qfx", "SchedRange": ["2UDcgVE7L9FK6e0M", "rPc4vtxk9hVKlG56", "HlzGr7XjdyRJunZP"]}, {"Action": 21, "Resource": "TGAak7Kaol01DK97", "SchedAction": 60, "SchedCron": "yQ7XdIszGRj46COP", "SchedRange": ["ipH1MWVTHG0qHJCW", "EfOJpZm9yEYWNGMy", "2pgSGSUOK68eqGJt"]}, {"Action": 49, "Resource": "f1Ybgg8rdwY9bmrv", "SchedAction": 68, "SchedCron": "lHXrUSA6sMJzA5mt", "SchedRange": ["qISQ83TTbtefXWzn", "De4LQdXfFBii2RAM", "EX5RMjBFVZGYzQqV"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserPermissionV3' test.out

#- 165 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8d9mDdUIoiIJFNxu' \
    --body '{"Permissions": [{"Action": 81, "Resource": "8fS79En3wYowBdka", "SchedAction": 7, "SchedCron": "3y6i38XQjLDRqkpi", "SchedRange": ["FK5BtiQ272Uo9UBJ", "WodpdwsX1jorcyR0", "x3YiHF8ITGPRQBCg"]}, {"Action": 70, "Resource": "bS4AdlNzwog2IhEr", "SchedAction": 22, "SchedCron": "Th4gUoj8u2WRcLiE", "SchedRange": ["tzVlnkflfn7pHY48", "F1dl1q92m3iRlfnB", "Ak0CwiAsR65yQ9ss"]}, {"Action": 41, "Resource": "srs3CUYATdqnQGbq", "SchedAction": 16, "SchedCron": "zGbruNB72HHMkjzy", "SchedRange": ["BB4UFKiaoV0VOem2", "yqPsMFxKybPkbuS6", "x9cLJ1APnNlsa2bR"]}]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminAddUserPermissionsV3' test.out

#- 166 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Br27fVMWuAfDqLMR' \
    --body '[{"Action": 13, "Resource": "19IZPKOKiAVQXXOm"}, {"Action": 34, "Resource": "q2OspCZbt3Uta5I0"}, {"Action": 42, "Resource": "nbC5CphgMweexsIA"}]' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionBulkV3' test.out

#- 167 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '84' \
    --namespace "$AB_NAMESPACE" \
    --resource 'ETRpABAmO2EGvJ4U' \
    --userId 'MS93yOxNInDByhno' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserPermissionV3' test.out

#- 168 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'luO6ti0QP2ssiJ66' \
    --after 'OzOj84O6tgohjtC7' \
    --before 'bzjPpucddXJ5zifF' \
    --limit '32' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserPlatformAccountsV3' test.out

#- 169 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'y959anrNSleywHbH' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetListJusticePlatformAccounts' test.out

#- 170 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'ig6IKWVZ77KeRWdE' \
    --userId 'CaFGzfZ2hxcJ2Fne' \
    > test.out 2>&1
eval_tap $? 170 'AdminGetUserMapping' test.out

#- 171 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'mn7M23SzUo4hNBDh' \
    --userId '9ZFP1OW0nXOErQPS' \
    > test.out 2>&1
eval_tap $? 171 'AdminCreateJusticeUser' test.out

#- 172 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '4VsRoYIK69yg9ADC' \
    --body '{"platformId": "GiXaLs2xjHkinOD9", "platformUserId": "75nARHCmhNHSXuqI"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminLinkPlatformAccount' test.out

#- 173 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HsxvaUoXDmwWsukx' \
    --userId 'ncuD3QxCXMd00YBW' \
    --body '{"platformNamespace": "CaVVmM45mfIZsWhk"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformUnlinkV3' test.out

#- 174 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'S476dGGJwJ00UH19' \
    --userId '7MJ6zU7JLMQyMWzY' \
    --ticket 'QCAaPJgoxGJoJaSz' \
    > test.out 2>&1
eval_tap $? 174 'AdminPlatformLinkV3' test.out

#- 175 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UtY4ZD0Xtb0U4pH1' \
    --userId '6NUsVY21NVIs7NRe' \
    --platformToken 'n2Y3Ns0QJQeaWytP' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 176 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fds1BYx0EaURydf8' \
    --body '["ZyyZeHAWGgJUbUJR", "MbkcTglbU86FyOjA", "pNHBVfNOURcjY3YY"]' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserRolesV3' test.out

#- 177 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'T9oTynmfIuBWgJTN' \
    --body '[{"namespace": "FfM8M0IW4oe8KDgy", "roleId": "0xZfAcNg14Ws8TIP"}, {"namespace": "1LKiFQoLDvumfqrg", "roleId": "Sfnx2h61X9dN1MGR"}, {"namespace": "XBJ6mVV7JS9qjNLw", "roleId": "vI8JdiY3RRiLilmO"}]' \
    > test.out 2>&1
eval_tap $? 177 'AdminSaveUserRoleV3' test.out

#- 178 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'GF6dLLIeIVIjMcdl' \
    --userId 'bdRXTGIrdNL5gJPq' \
    > test.out 2>&1
eval_tap $? 178 'AdminAddUserRoleV3' test.out

#- 179 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'TAjgqaTHf1ANTJ9Y' \
    --userId 'k997XkGOdC6ItxDT' \
    > test.out 2>&1
eval_tap $? 179 'AdminDeleteUserRoleV3' test.out

#- 180 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8p4n4XCFkD1AJLCw' \
    --body '{"enabled": true, "reason": "oLuPakQN1MpOs1RV"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateUserStatusV3' test.out

#- 181 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Frcg2CXxepx78fvs' \
    > test.out 2>&1
eval_tap $? 181 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 182 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'yhE2BKtyTDSIM7mk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "mvZ7Cmsh4US8o4jf"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateClientSecretV3' test.out

#- 183 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'MANPpmZDdMiCxmuC' \
    --before 'CVuFjS1GC1d2b92B' \
    --isWildcard  \
    --limit '53' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRolesV3' test.out

#- 184 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "managers": [{"displayName": "YBTxaTIz0jcgDI8P", "namespace": "kz96vd80msqIm5bu", "userId": "fnBqrpLeqhwVhjnn"}, {"displayName": "jKMEmtbiWsAQHbMr", "namespace": "KYi0Zxs5SWCqZXHL", "userId": "La31oQf7BULnZDhu"}, {"displayName": "tDM6BqguqD5xxGxB", "namespace": "WtnTKUe2znsqPzPk", "userId": "wCBo2SwCUsTag4ML"}], "members": [{"displayName": "Ao3m61P2xaNfmn8O", "namespace": "nb1a9gMz0F2UBRmM", "userId": "hAbUWmFhdYLWzMuv"}, {"displayName": "3zkUY0n0BAZkwbYk", "namespace": "BLyO6A0FqfhnaB3Y", "userId": "xKNdOTacCcJfIfXs"}, {"displayName": "huLUk5WdpxjZx5no", "namespace": "XPhPUTKbonoucNmz", "userId": "wOZOK56sDkci5rZ8"}], "permissions": [{"action": 16, "resource": "KJdlt7rjF5RaJwvk", "schedAction": 100, "schedCron": "J7NrTb1XTB9YQzUJ", "schedRange": ["9XlYJ8BzP6EUmUXG", "M5anIloyj9lhbvuQ", "dW2jwKUckc794ryY"]}, {"action": 50, "resource": "1lX8DD4MYXlrJ81l", "schedAction": 68, "schedCron": "5weXJl7PeiMH8z8d", "schedRange": ["Vej8N2yv6VTnOK7x", "AvM7tuL81lsR7xxS", "Vp3Gd2TK0HzYviTg"]}, {"action": 4, "resource": "mx82JVBRLPZ6Iz8t", "schedAction": 26, "schedCron": "GiTCVsXsygWbjE2o", "schedRange": ["pXtdsJQeJ1too0qv", "xphTLEEBGTtZyTjd", "KNKgYazujsmSmylT"]}], "roleName": "1YtxIq73aMb48jIS"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminCreateRoleV3' test.out

#- 185 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'd97KORRhxSWLWLNf' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleV3' test.out

#- 186 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'HRD3V15QaGGL46Lu' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteRoleV3' test.out

#- 187 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'xJF3sbeqWBdQuWfg' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "AKx27MSBqabUXOGk"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateRoleV3' test.out

#- 188 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'koMUZn1YXj5zFZeO' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleAdminStatusV3' test.out

#- 189 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'COR9NvBQZSJPOIKr' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpdateAdminRoleStatusV3' test.out

#- 190 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'RBrYVzi9ui3lvozT' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleAdminV3' test.out

#- 191 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 't9TsH7A0TuU2aL4b' \
    --after 'Pkk11sys6GdkDcos' \
    --before '5uVJ0BJfZ0jvA54C' \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetRoleManagersV3' test.out

#- 192 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'RWf6T3by2kYSCdnF' \
    --body '{"managers": [{"displayName": "KLc0xcTjqjdcEfU6", "namespace": "1OJYMnW49rWynp1c", "userId": "k1vT90C6o86cSRL9"}, {"displayName": "cgbUmulhe98oaFKl", "namespace": "QicdrxVhrtwSd9QW", "userId": "VMYz7TU1TsxsChSc"}, {"displayName": "lSkb5aBi9K9zyv6g", "namespace": "FZXI5nXJ7hLi6Hwe", "userId": "weRmyo91dIn7QqXB"}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRoleManagersV3' test.out

#- 193 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'DXJcrqKmXDwoEV6t' \
    --body '{"managers": [{"displayName": "Cdrxw1KOPhuvHuYr", "namespace": "GWDK41uMOC0mRvSo", "userId": "aGk4ktF5wnJDg9Q3"}, {"displayName": "WXiydCOInVolsr6C", "namespace": "Hmj763vLwtYEJTSi", "userId": "XjcY5ZPkv90lyKST"}, {"displayName": "WLxSFZ0LpupEi5Db", "namespace": "kVs3qFTi1t530Wj1", "userId": "WfzIvc3VlSXrA3XU"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminRemoveRoleManagersV3' test.out

#- 194 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'Gud4tVjmxEf4XvVh' \
    --after 'FJTxFHITBg9x4unq' \
    --before '3eOMHIKeTyBG5dCU' \
    --limit '30' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetRoleMembersV3' test.out

#- 195 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'EaqbzHvDDl1jiLw3' \
    --body '{"members": [{"displayName": "XMGBA6JXDpA1tIC4", "namespace": "5C0oaGouFu4hXONg", "userId": "UwJnUpryDeRcpUvl"}, {"displayName": "rw2MwC1uuokpaIjL", "namespace": "0Vxe5n9Lx3QcFo9g", "userId": "xOgvDc7xMrRKvw8I"}, {"displayName": "SP2WKmCRRXBxlalC", "namespace": "HtWlKxLpS8fLWoQ5", "userId": "nuJhatQPxR7dvBVC"}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddRoleMembersV3' test.out

#- 196 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId '5zgOKLTDmHe8c1eJ' \
    --body '{"members": [{"displayName": "9sde7Ryt4udIv22M", "namespace": "18uux9xBomQFPFWy", "userId": "5cwNPI6aFo0MVwDZ"}, {"displayName": "CIXFNEL3uWVRz3V7", "namespace": "YbJM3bNLWHAbCZix", "userId": "e2cQ6O30lpzcBQMA"}, {"displayName": "EcNcJqrKxnMzSYoc", "namespace": "4ZjiMY4H34B6wVd8", "userId": "ipcKDwQeUWtjCC2U"}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminRemoveRoleMembersV3' test.out

#- 197 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'H6jzMO3AfmOS5mQN' \
    --body '{"permissions": [{"action": 51, "resource": "M6vtT27xv85K5MU2", "schedAction": 34, "schedCron": "KmZhCZxxPPdPwOtE", "schedRange": ["uWBSO2jJepUnEEgj", "a2mIE2kLTnJwc5Xm", "kCuL5W4tKt6G3j9L"]}, {"action": 73, "resource": "dG7xVPqBqe9RDQMB", "schedAction": 91, "schedCron": "AxnKBfBfDlrQQuAc", "schedRange": ["10DjjwMv4vrIPRtv", "hQIyLarjaLOKnX51", "yAB8Pa3uNGKhaLlJ"]}, {"action": 53, "resource": "A0h4G1LZ1HaX5UBM", "schedAction": 2, "schedCron": "UX1B9oVuzG2CnYX2", "schedRange": ["YBF2g7TVtzYEHUod", "h3iUfBthbepUCTWi", "Z1uqh7GAi4FEIu44"]}]}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateRolePermissionsV3' test.out

#- 198 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'u83ZLRxYlYqlpq03' \
    --body '{"permissions": [{"action": 57, "resource": "JmUL0uzElixc023d", "schedAction": 70, "schedCron": "JOBy6lsj1AKGBjnH", "schedRange": ["maAu4YK87DYAWWcb", "cbGWmKgE8CZ4AELr", "5lraa5v5P5Cj8hgF"]}, {"action": 37, "resource": "iwKadEoIVmprwPsa", "schedAction": 67, "schedCron": "YD92CX0rITajpwHI", "schedRange": ["TGeHTnqRbzBB9ZFg", "JbQ3Fj1umx4ItzkM", "J7cudf4r916GPrhn"]}, {"action": 71, "resource": "etVIQvRkQJAtDUH9", "schedAction": 40, "schedCron": "oQ980ywmg1pWpWit", "schedRange": ["1QC7FKe0fnHUlmU1", "unGKM0tgfeWy47bb", "wMI4gGmvK9gW596F"]}]}' \
    > test.out 2>&1
eval_tap $? 198 'AdminAddRolePermissionsV3' test.out

#- 199 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'wBNrFXt3TAuKBwBc' \
    --body '["D12ae6r3hHwya4Np", "dOzg3hr6ucHf7dbh", "2iKNUl0qJqzoKMRM"]' \
    > test.out 2>&1
eval_tap $? 199 'AdminDeleteRolePermissionsV3' test.out

#- 200 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '68' \
    --resource 'OlscRIWw82k5K5VT' \
    --roleId 'kdubkOFldMCQ98JH' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteRolePermissionV3' test.out

#- 201 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 201 'AdminGetMyUserV3' test.out

#- 202 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId '4n0JtgqzZv5kVu4S' \
    --extendExp  \
    --redirectUri '95mj8YRvae4f4lhB' \
    --password 'PbarbWEm8bVtZcfV' \
    --requestId 'CPdQhim9QKUAFTVY' \
    --userName 'elIlGJg9wdc8bihh' \
    > test.out 2>&1
eval_tap $? 202 'UserAuthenticationV3' test.out

#- 203 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'WjfZpfcFBUsnnDJl' \
    --linkingToken 'mD1iEokbUiYzCQh2' \
    --password 'iNTwtnohddMzMTQ9' \
    --username 'P7sYLDWAJOA75K4B' \
    > test.out 2>&1
eval_tap $? 203 'AuthenticationWithPlatformLinkV3' test.out

#- 204 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'YJ2fkqYJoF2FI3vy' \
    > test.out 2>&1
eval_tap $? 204 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 205 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'yqRzc20O7FdsJP1G' \
    > test.out 2>&1
eval_tap $? 205 'RequestOneTimeLinkingCodeV3' test.out

#- 206 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode '9tyBTfERXdvgD1Qf' \
    > test.out 2>&1
eval_tap $? 206 'ValidateOneTimeLinkingCodeV3' test.out

#- 207 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --isTransient  \
    --clientId '7Ot2DkUt3yexZBRv' \
    --oneTimeLinkCode 'xYnEBhXtAVxCd3me' \
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
    --clientId 'TrT7cF9oVCh89wNO' \
    > test.out 2>&1
eval_tap $? 210 'RequestGameTokenCodeResponseV3' test.out

#- 211 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kKYssVejcL3kR3hC' \
    --userId 'GNgaJmuALlMQl9RL' \
    > test.out 2>&1
eval_tap $? 211 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 212 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rthbfp0VgweLlT2s' \
    > test.out 2>&1
eval_tap $? 212 'RevokeUserV3' test.out

#- 213 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'Y3SsTnDQY7kKU2u0' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'wV3zDuqVlVTypcYP' \
    --redirectUri 'K8IxrSZuxWl0Je4f' \
    --scope 'JIyFAm3DQht4JwnP' \
    --state 'S2urJqerobWMZGVL' \
    --targetAuthPage '5KLTxahWlS6XdBaK' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId 'SLCgOOPXM6XTUh2d' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 213 'AuthorizeV3' test.out

#- 214 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token '90yqHDNacl4F9G6D' \
    > test.out 2>&1
eval_tap $? 214 'TokenIntrospectionV3' test.out

#- 215 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 215 'GetJWKSV3' test.out

#- 216 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId 'l5TFwBY6HKXAblkT' \
    --factor '8VGgSH8MGZGwiVj7' \
    --mfaToken 'eDTaka9ABfX1IByP' \
    > test.out 2>&1
eval_tap $? 216 'SendMFAAuthenticationCode' test.out

#- 217 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'EOuPhGspRi3bhPQv' \
    --mfaToken 'BBJI5JxytpcubN4A' \
    > test.out 2>&1
eval_tap $? 217 'Change2faMethod' test.out

#- 218 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'UUPFPscZsXeJOD4D' \
    --factor 'MtqfIGiGJovgWSRx' \
    --mfaToken 'Z8N4UQ2fg3V1o2x0' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 218 'Verify2faCode' test.out

#- 219 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hL5DuBDqMyIAzWze' \
    --userId '94MEdJFAy2JTllJk' \
    > test.out 2>&1
eval_tap $? 219 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 220 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'RGB8jqJEd6eqqsBV' \
    --clientId 'yONV0JRtozI0jpli' \
    --redirectUri 'CFQ6WgJpGPigdc5V' \
    --requestId 'yC4qvWjVac1cQvSx' \
    > test.out 2>&1
eval_tap $? 220 'AuthCodeRequestV3' test.out

#- 221 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'gTNIUzxDgBlIbuzm' \
    --clientId '7DzJ20NFRJIhFXR2' \
    --createHeadless  \
    --deviceId 'dYprPmbpuptECGd5' \
    --macAddress 'cdXC2Sesc6y68whN' \
    --platformToken 'BYl9iCqfW6rqGOQn' \
    --skipSetCookie  \
    > test.out 2>&1
eval_tap $? 221 'PlatformTokenGrantV3' test.out

#- 222 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 222 'GetRevocationListV3' test.out

#- 223 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'y4ij4ysYPonb59gQ' \
    > test.out 2>&1
eval_tap $? 223 'TokenRevocationV3' test.out

#- 224 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'ffkNOmubxEJr2qEA' \
    --code 'uJbpZSrcbc4LWfKa' \
    --codeVerifier 'Y5c1tP5TDuI5f6m4' \
    --extendExp  \
    --password 'KC07CnsZe32hqEcB' \
    --redirectUri '1ExYMBb3ckvoaJYd' \
    --refreshToken 'MqGegcg3eRvBZXN3' \
    --username 'cjIXmFWRJnj8xN7H' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 224 'TokenGrantV3' test.out

#- 225 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'a6Zuxk6u6HXXdiC9' \
    > test.out 2>&1
eval_tap $? 225 'VerifyTokenV3' test.out

#- 226 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'ZDj4E4mv12FNXypo' \
    --code 'OLl13j84P0KqirJ4' \
    --error 'PkMFtsnFfz8Ew0X8' \
    --openidAssocHandle 'fBuBSKLSQ4GvLtz5' \
    --openidClaimedId '0D3rpBfBovqLwXBu' \
    --openidIdentity 'T30EYeRj17xGhaBK' \
    --openidMode 'oUfiHjGmCyPsKCJT' \
    --openidNs 'v1ic9gvagF2cSuzt' \
    --openidOpEndpoint 'sJ5tj64gV7nmDk29' \
    --openidResponseNonce 'mcjSuz9vbNStqPtQ' \
    --openidReturnTo 'mQN6eKAGiZFCftT0' \
    --openidSig 'RWECdjWYrnulxcCK' \
    --openidSigned 'Aru8pOaAVLDB4k3J' \
    --state 'wkdaxR7GJpYmuYCP' \
    > test.out 2>&1
eval_tap $? 226 'PlatformAuthenticationV3' test.out

#- 227 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'G181q9GA5DydC2D8' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetInputValidations' test.out

#- 228 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode 'UT6KOc4VPDUR9aya' \
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
    --clientId 'zqXRqegIUicYXXzx' \
    > test.out 2>&1
eval_tap $? 230 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 231 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sBFrUs9BYp6TgCej' \
    --rawPUID  \
    --body '{"platformUserIds": ["Bd5o7iTST7R3KbbQ", "GERMNpqWb51y5RUz", "vMfTkPy0fGvTGgfL"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 232 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ksg0b1Bq78cE5O5p' \
    --platformUserId 'mPnbiPJ9j4vxmbH3' \
    > test.out 2>&1
eval_tap $? 232 'PublicGetUserByPlatformUserIDV3' test.out

#- 233 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'rVaauufxkPHElug4' \
    > test.out 2>&1
eval_tap $? 233 'PublicGetAsyncStatus' test.out

#- 234 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '8TgfNu0rqXUOyToL' \
    --limit '86' \
    --offset '84' \
    --query 'IREGIKlJt3EP9kKw' \
    > test.out 2>&1
eval_tap $? 234 'PublicSearchUserV3' test.out

#- 235 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "kENQ8VOHGwbADMfu", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "mh0lciRhVZ2DeoOD", "policyId": "XMzLSrzoiBnYi5UW", "policyVersionId": "s3tYlYeMoCimJySo"}, {"isAccepted": false, "localizedPolicyVersionId": "vfJuje5cPnmGjTvY", "policyId": "a5Pqx1K7qcAoijBP", "policyVersionId": "Ap6EPb988NzxrDKV"}, {"isAccepted": true, "localizedPolicyVersionId": "yxf6MLZJ2jZfZbpT", "policyId": "JezzriCDWXT59SRu", "policyVersionId": "0YqUxKDc84OMIzvT"}], "authType": "ScdbKBsAyJMz4ILN", "code": "DvhB4Eoes9a6XaJe", "country": "RbzTPwD3jxF7vxRU", "dateOfBirth": "Y0ilrNoFT98SgtJd", "displayName": "4Z5f8nfaKqdZFLbZ", "emailAddress": "EHxsDxeR6d7r1SQw", "password": "80JfMpPrSqYypRUn", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 235 'PublicCreateUserV3' test.out

#- 236 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'q5lQo2jy29EJigqY' \
    --query 'hyVhURx1yPeczRpd' \
    > test.out 2>&1
eval_tap $? 236 'CheckUserAvailability' test.out

#- 237 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["k0HATGylx2JG2KNG", "fhzfCTxxrsRRLee3", "TcJ7DQIi45aCDHN9"]}' \
    > test.out 2>&1
eval_tap $? 237 'PublicBulkGetUsers' test.out

#- 238 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "mVug2zkVf6KgpKOc", "languageTag": "n3tMD9UT67bOwugF"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicSendRegistrationCode' test.out

#- 239 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Da6wUQvehKqwCh86", "emailAddress": "XmRkCEcfHDCdl59W"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicVerifyRegistrationCode' test.out

#- 240 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "p9A3tXGve6DdK6uv", "languageTag": "g8f2cIoByk9fxtvs"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicForgotPasswordV3' test.out

#- 241 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'geAxo57nKAbZpsbJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'GetAdminInvitationV3' test.out

#- 242 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId '4Iu5KJ0ynxGBlacD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "WpKKdzxoufCNlFoO", "policyId": "cWQQy4bjmQeEweoB", "policyVersionId": "HTdwAk7ZQnbqY1cQ"}, {"isAccepted": true, "localizedPolicyVersionId": "dOwNESzCEW9dUVhZ", "policyId": "jLftC3sCS8CpLCqP", "policyVersionId": "D9CeDEdCnnL6Kt1B"}, {"isAccepted": false, "localizedPolicyVersionId": "Fr8CDapjwNOl4k8r", "policyId": "VNrm8drv8QD2JOe2", "policyVersionId": "Ntz7EFvowPgIGuet"}], "authType": "EMAILPASSWD", "country": "GDt47f9GWRlE9hqz", "dateOfBirth": "6rjDNo4rhjxUdMM8", "displayName": "3WekqfWv04vvn9bk", "password": "5qr8qs2mqtnGAqXU", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 242 'CreateUserFromInvitationV3' test.out

#- 243 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "Lc1eI9w3JEhxPGbE", "country": "k7s7gw07FlounC3v", "dateOfBirth": "JKBC7SwgoViPeIB4", "displayName": "Ehy0Y5aSJVDginxA", "languageTag": "M77eY9C14FbfiI2N", "userName": "Pvl1kCY5bEokxXxk"}' \
    > test.out 2>&1
eval_tap $? 243 'UpdateUserV3' test.out

#- 244 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "WZbjf7GZxaossQmj", "country": "o69wohJFyTNk5FGU", "dateOfBirth": "PhR4LEZvz3EjFR79", "displayName": "96Ug5m4axDV5uTcY", "languageTag": "soahUrELQ1btjJOq", "userName": "QMgZWAU6E92nHJzv"}' \
    > test.out 2>&1
eval_tap $? 244 'PublicPartialUpdateUserV3' test.out

#- 245 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "w7tnYtGfv0EJyjBu", "emailAddress": "4EzwRjD7jmQJeFPg", "languageTag": "hqamSc5y0X48eT7M"}' \
    > test.out 2>&1
eval_tap $? 245 'PublicSendVerificationCodeV3' test.out

#- 246 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "luexk87b9Z5BTsEA", "contactType": "3EdmW8saabP4xRow", "languageTag": "fNojzPXI2v0prR3O", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 246 'PublicUserVerificationV3' test.out

#- 247 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "mPDKFS6u9FHuv1M3", "country": "qfch4SqIV6LQPHla", "dateOfBirth": "eYl4csFq65cU66yJ", "displayName": "aj4ovoKWE4EW0sw8", "emailAddress": "v5peiuxoBJATauyD", "password": "3XCXVMiyEvMf9yil", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 247 'PublicUpgradeHeadlessAccountV3' test.out

#- 248 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --needVerificationCode  \
    --body '{"emailAddress": "Eujk6oqYo1HQYTFz", "password": "wdOMdupwD4O3uNbc"}' \
    > test.out 2>&1
eval_tap $? 248 'PublicVerifyHeadlessAccountV3' test.out

#- 249 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "IDcIyvZbOy1T4hfw", "newPassword": "kuVykH4RpfmjIXFG", "oldPassword": "Z5PKdbabJIkNnt9P"}' \
    > test.out 2>&1
eval_tap $? 249 'PublicUpdatePasswordV3' test.out

#- 250 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '1Tkm08luh4dpPRMD' \
    > test.out 2>&1
eval_tap $? 250 'PublicCreateJusticeUser' test.out

#- 251 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bUXBWTbpAogG2wlZ' \
    --redirectUri 'kLhuU5FI8NijFI0G' \
    --ticket 'KwJ3vfXlsAMy2Zp2' \
    > test.out 2>&1
eval_tap $? 251 'PublicPlatformLinkV3' test.out

#- 252 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UAGxHnmSxvkG9UR5' \
    --body '{"platformNamespace": "q9neoW6JBcGp9Rx2"}' \
    > test.out 2>&1
eval_tap $? 252 'PublicPlatformUnlinkV3' test.out

#- 253 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RfcRhXpmeeHdvpha' \
    > test.out 2>&1
eval_tap $? 253 'PublicPlatformUnlinkAllV3' test.out

#- 254 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 's9S7ivHEoLbUMM47' \
    --ticket 'f1UreUpxEkXIbE1E' \
    > test.out 2>&1
eval_tap $? 254 'PublicForcePlatformLinkV3' test.out

#- 255 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TzRJZKMavu4Ul2Ia' \
    --clientId 'ieEbPSE7TGkeHsYs' \
    --redirectUri 'W9oGBN1pYMBwbPZT' \
    > test.out 2>&1
eval_tap $? 255 'PublicWebLinkPlatform' test.out

#- 256 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lMlUvFEiGprcNSQ9' \
    --state 'kEeXBZ6FVrBzyhyh' \
    > test.out 2>&1
eval_tap $? 256 'PublicWebLinkPlatformEstablish' test.out

#- 257 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "oS6a9oe0JaXFpff2", "emailAddress": "8uYbe4Cf2HEHvVev", "newPassword": "hISjbtBJUK5fE3Ou"}' \
    > test.out 2>&1
eval_tap $? 257 'ResetPasswordV3' test.out

#- 258 PublicGetUserByUserIdV3
eval_tap 0 258 'PublicGetUserByUserIdV3 # SKIP deprecated' test.out

#- 259 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fPSX3PdOU2V9yw94' \
    --activeOnly  \
    --after 'oa8UJ34TIedV3Hyo' \
    --before 'X4VnO2LpBU08wfnl' \
    --limit '70' \
    > test.out 2>&1
eval_tap $? 259 'PublicGetUserBanHistoryV3' test.out

#- 260 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aDllwzTRHak1MXxj' \
    > test.out 2>&1
eval_tap $? 260 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 261 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7Esrg7900nml5Bid' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetUserInformationV3' test.out

#- 262 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sK9dCEzhVnOv0PQb' \
    --after '0.7715185003940139' \
    --before '0.560502890742333' \
    --limit '1' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetUserLoginHistoriesV3' test.out

#- 263 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '89QNmI17UDb19R6H' \
    --after '7r1ta3m7jK5pxe82' \
    --before 'pgFiAS6piIzmc8rK' \
    --limit '36' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetUserPlatformAccountsV3' test.out

#- 264 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RucL1jwRXzfjDZZB' \
    > test.out 2>&1
eval_tap $? 264 'PublicListJusticePlatformAccountsV3' test.out

#- 265 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'mOau6syme06c6SKL' \
    --body '{"platformId": "c2mEC3IXl5XCbkOf", "platformUserId": "HaGr5kdazlypvt6l"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicLinkPlatformAccount' test.out

#- 266 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'SLfU7HByGXPMqxj4' \
    --body '{"chosenNamespaces": ["hBgVY3YAxZLKbcOd", "yjqf6Q4oiwoJcaRM", "Eb15LBlTVufc5ZyO"], "requestId": "DR2NVyn4PRqf3eRb"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicForceLinkPlatformWithProgression' test.out

#- 267 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZqBAoKGcVCdMiSNV' \
    > test.out 2>&1
eval_tap $? 267 'PublicGetPublisherUserV3' test.out

#- 268 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4qBrt1kcLmRv6EJt' \
    --password 'l5xWnsb8oWq94RIm' \
    > test.out 2>&1
eval_tap $? 268 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 269 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'NWVIJnhhwFDV1Vit' \
    --before 'aomvWTzdsW4N70wY' \
    --isWildcard  \
    --limit '90' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetRolesV3' test.out

#- 270 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId '1HgAnZV4IOglVLqb' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetRoleV3' test.out

#- 271 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 271 'PublicGetMyUserV3' test.out

#- 272 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode '9lGAJUg21Lt7Jwgw' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 273 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["MUSuC3Bajy3BcEMC", "tQs2FcEcvVAyId6C", "p85HVDsZBQgOnXuX"], "oneTimeLinkCode": "sGThYZrmm0wrFMnP"}' \
    > test.out 2>&1
eval_tap $? 273 'LinkHeadlessAccountToMyAccountV3' test.out

#- 274 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "pWgrQD4hEk0OLjYs"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicSendVerificationLinkV3' test.out

#- 275 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'nignE7KcMF7fuDbz' \
    > test.out 2>&1
eval_tap $? 275 'PublicVerifyUserByLinkV3' test.out

#- 276 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'RRYMNXWUsp1tOibJ' \
    --code 'Y9aL9ie6vvMbiNUR' \
    --error 'rlm88QlKyuoya4Jg' \
    --state 'akZyUV7t73VnSFbu' \
    > test.out 2>&1
eval_tap $? 276 'PlatformAuthenticateSAMLV3Handler' test.out

#- 277 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'xd4KYZ0jk0UZdhtn' \
    --payload 'Ku9oTc8pVkiyGsj5' \
    > test.out 2>&1
eval_tap $? 277 'LoginSSOClient' test.out

#- 278 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'JdXzRxfNEjUMTs8W' \
    > test.out 2>&1
eval_tap $? 278 'LogoutSSOClient' test.out

#- 279 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'IObJBTsvsw76uISR' \
    > test.out 2>&1
eval_tap $? 279 'RequestGameTokenResponseV3' test.out

#- 280 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'X0bKVoWtoUW1P7oc' \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDevicesByUserV4' test.out

#- 281 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'uBAldDSUS7Haa6un' \
    --endDate 'q1yQOSRvyiLBRVtI' \
    --limit '60' \
    --offset '18' \
    --startDate 'OfCzdQCXMAWnf87Y' \
    > test.out 2>&1
eval_tap $? 281 'AdminGetBannedDevicesV4' test.out

#- 282 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PNOe9Eevf1fhMg1E' \
    > test.out 2>&1
eval_tap $? 282 'AdminGetUserDeviceBansV4' test.out

#- 283 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "2k7QLFrVgtX7y0fP", "deviceId": "OieDCow2zXyFFVpM", "deviceType": "87yqEwEacQMTlqN4", "enabled": false, "endDate": "KkxJ5v3SBafnKNiM", "ext": {"PbFkFGA85W3HJkqg": {}, "S2B37wwoPYOHiIsx": {}, "msLBPBJuNLnWRrtW": {}}, "reason": "870qD88ZcduZSe7W"}' \
    > test.out 2>&1
eval_tap $? 283 'AdminBanDeviceV4' test.out

#- 284 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId '20UZcDaiq0nEZ7Py' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'AdminGetDeviceBanV4' test.out

#- 285 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId 'hqFJkDClOsKmfsgJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 285 'AdminUpdateDeviceBanV4' test.out

#- 286 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'LMlHi8i9gOVqajUW' \
    --startDate 'rgEsWDtaKzn8dZwn' \
    --deviceType 'nGeZsZVgbPzPFbrO' \
    > test.out 2>&1
eval_tap $? 286 'AdminGenerateReportV4' test.out

#- 287 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 287 'AdminGetDeviceTypesV4' test.out

#- 288 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'MZMgWkFN7Tpkx6Gc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 288 'AdminGetDeviceBansV4' test.out

#- 289 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'fyOg6ZUrrp9ubg9m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 289 'AdminDecryptDeviceV4' test.out

#- 290 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'ndW2JKmQafUs2bxY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'AdminUnbanDeviceV4' test.out

#- 291 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'ztOEyVbKIf1ZbzgU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'AdminGetUsersByDeviceV4' test.out

#- 292 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 47}' \
    > test.out 2>&1
eval_tap $? 292 'AdminCreateTestUsersV4' test.out

#- 293 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["ffjJJxlgjzIhpgOo", "IOD74V21HWDAfvXw", "dxbyp4HAPbBbNPSt"]}' \
    > test.out 2>&1
eval_tap $? 293 'AdminBulkCheckValidUserIDV4' test.out

#- 294 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VBUpKgOssFkz0F36' \
    --body '{"avatarUrl": "piDYXeHZ7FHls3ny", "country": "vconqbHQqKLQKe3x", "dateOfBirth": "mj6s0GqsWncp5Lrq", "displayName": "biKudv9z75SzoCV8", "languageTag": "ZMi2o1nR482D6gNC", "userName": "lk9c87hosaPFC5zB"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminUpdateUserV4' test.out

#- 295 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'W3ZgVZCj9ObVGT0S' \
    --body '{"code": "cwl4kNmCi15XTJTg", "emailAddress": "CNNH7RtG5Xmo9Q0W"}' \
    > test.out 2>&1
eval_tap $? 295 'AdminUpdateUserEmailAddressV4' test.out

#- 296 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'b07N17fkxZSc6VbE' \
    > test.out 2>&1
eval_tap $? 296 'AdminDisableUserMFAV4' test.out

#- 297 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '0AGcekjMNHuPXtz8' \
    > test.out 2>&1
eval_tap $? 297 'AdminListUserRolesV4' test.out

#- 298 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tXxrmzafMUguyDoN' \
    --body '{"assignedNamespaces": ["91uc28HoSpGt1g0G", "GbT4Hf2PPKOldkbg", "X9CWJKwXXSbv5eg9"], "roleId": "q86IaDFjjx6uZerW"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateUserRoleV4' test.out

#- 299 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'btwTX9gNRByjbE8l' \
    --body '{"assignedNamespaces": ["OLAfTXKLzbrddqcK", "La7LevxNHOSEhQRZ", "Ip693lRwtc43atCu"], "roleId": "CFxbfbz4aQERziPL"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminAddUserRoleV4' test.out

#- 300 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '4dHhOqG5KDdUvk0L' \
    --body '{"assignedNamespaces": ["Ei26Ls7mjRxNmvvN", "tjJNQepUTGhwlY4l", "PzlsCR5rVsyfcH7W"], "roleId": "jP7HuGz3b5WAEvdR"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminRemoveUserRoleV4' test.out

#- 301 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '64' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 301 'AdminGetRolesV4' test.out

#- 302 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "Fguhh3bvadRthdbV"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminCreateRoleV4' test.out

#- 303 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'ApebRA09rW8i8krF' \
    > test.out 2>&1
eval_tap $? 303 'AdminGetRoleV4' test.out

#- 304 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'WJhe03coRFok5d3A' \
    > test.out 2>&1
eval_tap $? 304 'AdminDeleteRoleV4' test.out

#- 305 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'yGrZO8GuoXNSoVEB' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "bBPUWipz9C05YabF"}' \
    > test.out 2>&1
eval_tap $? 305 'AdminUpdateRoleV4' test.out

#- 306 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'X4FCK5ucTFsAFzaO' \
    --body '{"permissions": [{"action": 78, "resource": "yJpA3KMxBlrRytER", "schedAction": 12, "schedCron": "qdTelFAadM9y66Dr", "schedRange": ["f4SSGGt3MiBKohow", "3kKoaP1K4CDuH1mM", "IfOCDyVAHrHncR5d"]}, {"action": 90, "resource": "XqQ1oHFJ9Q0vqsL9", "schedAction": 90, "schedCron": "hrPpK2q8kxR4BuEk", "schedRange": ["sS2A9VOA8H9VeHv0", "L2Acm960EYQEuGJV", "l8xs1WId9Wlalqsh"]}, {"action": 65, "resource": "CR6XOMXwKdfqk8T4", "schedAction": 88, "schedCron": "kyuT3MgzReRq0112", "schedRange": ["ISArROIodcmM6v2A", "EozWWaYvBLE46bpu", "Jip8JyxJ39vrtuWW"]}]}' \
    > test.out 2>&1
eval_tap $? 306 'AdminUpdateRolePermissionsV4' test.out

#- 307 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'rqTZbSqBSKp8Amgw' \
    --body '{"permissions": [{"action": 15, "resource": "Y8CNyT4k3DIbfT22", "schedAction": 66, "schedCron": "HpnUCGBVfpctNFUs", "schedRange": ["UQ6ZXQcb2o1J5euL", "AbBgejqc0apxqZ20", "9BySn8aUaGlAyvIs"]}, {"action": 23, "resource": "SQdwec1m8BusV9tU", "schedAction": 15, "schedCron": "qUZXkjHvcUOTlxNf", "schedRange": ["09pefgFIiJssShBK", "sQjXvfQgQDt6ce8N", "DMErA82FrR1GSogk"]}, {"action": 8, "resource": "OikIxXKKIR6kPmsw", "schedAction": 24, "schedCron": "AJOTCbx7J3gNLIlT", "schedRange": ["k3Bpclrk4hIRn0zn", "IKzAEAHQpBOgHEP5", "l94s7CbIJ7eHnVWO"]}]}' \
    > test.out 2>&1
eval_tap $? 307 'AdminAddRolePermissionsV4' test.out

#- 308 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'boMkyB7FTexsOZ0b' \
    --body '["2p3b63KrcwIcXMhG", "y83Xit6boOLGCcg1", "6DqwdQPQ9HkSSV8e"]' \
    > test.out 2>&1
eval_tap $? 308 'AdminDeleteRolePermissionsV4' test.out

#- 309 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId '1MgTTLS2FgarY903' \
    --after 'INGIyEfRBEj7qms9' \
    --before 'AGQExPhgr9gGfC0G' \
    --limit '20' \
    > test.out 2>&1
eval_tap $? 309 'AdminListAssignedUsersV4' test.out

#- 310 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'bcOpR45VDlvSc0Mr' \
    --body '{"assignedNamespaces": ["7ImwCwGqOf0bNs97", "KvKyj3MqS7Dcmtfh", "50eObbrmgjhWK0x0"], "namespace": "ZidAJ1CU1eD1La16", "userId": "Bw3JbUnUDh5yGjjv"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminAssignUserToRoleV4' test.out

#- 311 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId '4Mwrv2vancmR6Z7r' \
    --body '{"namespace": "b21A2E9pX0BWCMqP", "userId": "sRk5htdM5T3fDSrS"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminRevokeUserFromRoleV4' test.out

#- 312 AdminInviteUserNewV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserNewV4 \
    --body '{"assignedNamespaces": ["Hrkoqv2mM6soMaTv", "Qq2a9YdFNtRVSO0j", "s0hG9xmSnzd7zgUx"], "emailAddresses": ["AogcnGkXk17QPkJH", "RhmLKQuQVFSKiXl8", "G2uf6E8EajXLSAS8"], "isAdmin": false, "namespace": "UqWHBW78XREZCiTN", "roleId": "Axq26gZrPqCsSDsp"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminInviteUserNewV4' test.out

#- 313 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "vgM16sZ6rjnkH4Ex", "country": "ObppC6CMYDm5ge65", "dateOfBirth": "9UDEOF6gp5Ufmjti", "displayName": "VbqJnZcrqrPye7fC", "languageTag": "wi7Il2wIFlHm9N6o", "userName": "wMHMtJy1Oqn59tEG"}' \
    > test.out 2>&1
eval_tap $? 313 'AdminUpdateMyUserV4' test.out

#- 314 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 314 'AdminDisableMyAuthenticatorV4' test.out

#- 315 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'm9NYeUT5P0nx8TqS' \
    > test.out 2>&1
eval_tap $? 315 'AdminEnableMyAuthenticatorV4' test.out

#- 316 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 316 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 317 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 317 'AdminGetMyBackupCodesV4' test.out

#- 318 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 318 'AdminGenerateMyBackupCodesV4' test.out

#- 319 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 319 'AdminDisableMyBackupCodesV4' test.out

#- 320 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 320 'AdminDownloadMyBackupCodesV4' test.out

#- 321 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 321 'AdminEnableMyBackupCodesV4' test.out

#- 322 AdminSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam adminSendMyMFAEmailCodeV4 \
    > test.out 2>&1
eval_tap $? 322 'AdminSendMyMFAEmailCodeV4' test.out

#- 323 AdminDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyEmailV4 \
    > test.out 2>&1
eval_tap $? 323 'AdminDisableMyEmailV4' test.out

#- 324 AdminEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyEmailV4 \
    --code 'ZdZ5C8mFI9TnvzEq' \
    > test.out 2>&1
eval_tap $? 324 'AdminEnableMyEmailV4' test.out

#- 325 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 325 'AdminGetMyEnabledFactorsV4' test.out

#- 326 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'BNMF9CZvPxT5zbre' \
    > test.out 2>&1
eval_tap $? 326 'AdminMakeFactorMyDefaultV4' test.out

#- 327 AdminInviteUserV4
eval_tap 0 327 'AdminInviteUserV4 # SKIP deprecated' test.out

#- 328 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "c9fBoU3RHNDFjLKF", "policyId": "repy56eW1kmb15Qe", "policyVersionId": "IQF51c4MqJzDSvEL"}, {"isAccepted": false, "localizedPolicyVersionId": "lJGI2YYb6ajBjgq6", "policyId": "eY4PBNHKPx62tHxD", "policyVersionId": "b06ZFy3uglSp2Uxv"}, {"isAccepted": false, "localizedPolicyVersionId": "uLXWilRD7HD6LCgd", "policyId": "FxRGj00RT6LvcnGM", "policyVersionId": "JbJIYLssMvy9gkfT"}], "authType": "EMAILPASSWD", "country": "RrXVRcAVRDX6gmDf", "dateOfBirth": "NfPGYYSTunMgt3C8", "displayName": "hEguCqlMHiQN3HWJ", "emailAddress": "w9zIWsiP2JQ24meD", "password": "rwEuTyM2qohglzO8", "passwordMD5Sum": "AEl6A9sh2x2ur2cc", "username": "p7R7OqPqIjS4i0N9", "verified": true}' \
    > test.out 2>&1
eval_tap $? 328 'PublicCreateTestUserV4' test.out

#- 329 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "6TGh4UdEweeBsJEv", "policyId": "BbAvCmlh6Z1oz9Ba", "policyVersionId": "ixUUvmzbajE2gjoo"}, {"isAccepted": false, "localizedPolicyVersionId": "a280S5RNB5dVCsB7", "policyId": "xL4axSPgPCiwLxCF", "policyVersionId": "LDixZwVtt3RVTl0t"}, {"isAccepted": false, "localizedPolicyVersionId": "00oQgcHdGGK3x76U", "policyId": "1EIcklttmrpgF5sz", "policyVersionId": "l0sMY8es36r1FgR7"}], "authType": "EMAILPASSWD", "code": "ol1qqbalgizL97yc", "country": "JV5YqE2myQzl7X9f", "dateOfBirth": "Hr6WvBxmBvNj3kta", "displayName": "Df9B22HGgxakPt7I", "emailAddress": "YzaZUTmvsEzLPnnG", "password": "snfmBerp84qjwzWp", "passwordMD5Sum": "CF1vyamjsEzwtLPx", "reachMinimumAge": false, "username": "os4qR8LaQzEb39sZ"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicCreateUserV4' test.out

#- 330 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'TdFfC8x5aHLsXHlm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "RJTTy9JrNz1K5M1q", "policyId": "gFddYvifGHawNx6y", "policyVersionId": "hniEHLbEQKc0aUvr"}, {"isAccepted": false, "localizedPolicyVersionId": "DIjYC4df9qswSlpC", "policyId": "I8DhjlxUyrs3OSes", "policyVersionId": "E5p0DwUj2HKUvPYU"}, {"isAccepted": false, "localizedPolicyVersionId": "8aWn65Co0vdCk8so", "policyId": "6JSaZAIadKDEZywo", "policyVersionId": "nA2SrEdN2tmGuX6r"}], "authType": "EMAILPASSWD", "country": "gBVUUeKKlPKtE6gn", "dateOfBirth": "YxmkmCWbs5qugklB", "displayName": "US6uwWrCQt86Jrg8", "password": "tLAJWpcyNkUvqn6e", "reachMinimumAge": false, "username": "r6FNbKJ05Orya6LS"}' \
    > test.out 2>&1
eval_tap $? 330 'CreateUserFromInvitationV4' test.out

#- 331 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "SUlugIAknXcSaVYc", "country": "AYp7qSiDvsfMUOpW", "dateOfBirth": "v46sXvpOjrpRo4mY", "displayName": "rCeQUnYoID2UqO0i", "languageTag": "AXA9dB4ib8HDOJ8T", "userName": "NiP8KgEAj3dbRTI0"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicUpdateUserV4' test.out

#- 332 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "i6dO3zkbDseh4tJd", "emailAddress": "oGcwMBmegqVUaWMJ"}' \
    > test.out 2>&1
eval_tap $? 332 'PublicUpdateUserEmailAddressV4' test.out

#- 333 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "BjrV0p9A7tcHrV0M", "country": "bJGr4drgkDuWS05m", "dateOfBirth": "0pGzazM2BUXnzUEW", "displayName": "TiKMJAf6AgbiEDMf", "emailAddress": "CckWogE5gcfF8AMG", "password": "Z2FBS93Mg6TKwdRM", "reachMinimumAge": true, "username": "cUml3KuoMKh7tprn", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 333 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 334 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "UNIbJMJ9ABbKVWO2", "password": "YEDiqkwKbpdk7wlD", "username": "ngNiPPjpSAlZwFGp"}' \
    > test.out 2>&1
eval_tap $? 334 'PublicUpgradeHeadlessAccountV4' test.out

#- 335 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 335 'PublicDisableMyAuthenticatorV4' test.out

#- 336 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'ea5ObBB49Km4ClIQ' \
    > test.out 2>&1
eval_tap $? 336 'PublicEnableMyAuthenticatorV4' test.out

#- 337 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 337 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 338 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 338 'PublicGetMyBackupCodesV4' test.out

#- 339 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 339 'PublicGenerateMyBackupCodesV4' test.out

#- 340 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 340 'PublicDisableMyBackupCodesV4' test.out

#- 341 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 341 'PublicDownloadMyBackupCodesV4' test.out

#- 342 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 342 'PublicEnableMyBackupCodesV4' test.out

#- 343 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'mkIdLCvNhZ6P8aqZ' \
    > test.out 2>&1
eval_tap $? 343 'PublicRemoveTrustedDeviceV4' test.out

#- 344 PublicSendMyMFAEmailCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicSendMyMFAEmailCodeV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 344 'PublicSendMyMFAEmailCodeV4' test.out

#- 345 PublicDisableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 345 'PublicDisableMyEmailV4' test.out

#- 346 PublicEnableMyEmailV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyEmailV4 \
    --namespace "$AB_NAMESPACE" \
    --code '2yfrC1V7ZpJZPHCM' \
    > test.out 2>&1
eval_tap $? 346 'PublicEnableMyEmailV4' test.out

#- 347 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 347 'PublicGetMyEnabledFactorsV4' test.out

#- 348 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'qvcYmeDLYEzs2SQU' \
    > test.out 2>&1
eval_tap $? 348 'PublicMakeFactorMyDefaultV4' test.out

#- 349 PublicInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam publicInviteUserV4 \
    --body '{"emailAddress": "dKr6vgqkjycqclNl", "namespace": "BORlC8ZkjsxYtgxp", "namespaceDisplayName": "lHTPLzynjFZgF3er"}' \
    > test.out 2>&1
eval_tap $? 349 'PublicInviteUserV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE