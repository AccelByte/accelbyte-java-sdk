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
    --body '[{"field": "mfSVR20F", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "blockedWord": ["eet45wk1", "ilL3NHz5", "7htzJXQl"], "description": [{"language": "mRKVOIbj", "message": ["1J8hCCM9", "c8q58XJk", "6iiM90d0"]}, {"language": "WUcyhR0F", "message": ["iyoGvk0q", "erAGjYfV", "lF5Q2DJ4"]}, {"language": "7cC8OGDH", "message": ["r9vUtDUE", "v0p9Fwnf", "wl7bEYGv"]}], "isCustomRegex": true, "letterCase": "MAdD75bj", "maxLength": 1, "maxRepeatingAlphaNum": 44, "maxRepeatingSpecialCharacter": 8, "minCharType": 25, "minLength": 7, "regex": "Woe44yOx", "specialCharacterLocation": "ijylleSJ", "specialCharacters": ["ULTqO10v", "1W4ocBP6", "H3k1L8SP"]}}, {"field": "MIPXZ67a", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "blockedWord": ["PbakufUn", "MmTj5ZOI", "t1W0xWZ9"], "description": [{"language": "Ljwthpt5", "message": ["uiKEyRwX", "3nPm0Gn5", "DuUHtLzj"]}, {"language": "C6QuhDPX", "message": ["CBJ7lJ4B", "WOKlzXRv", "qun2sygd"]}, {"language": "iNwyy8HP", "message": ["hD2OHXAc", "IFfSiLtI", "s4JHlP6A"]}], "isCustomRegex": true, "letterCase": "tMkaQJxj", "maxLength": 21, "maxRepeatingAlphaNum": 17, "maxRepeatingSpecialCharacter": 0, "minCharType": 60, "minLength": 2, "regex": "5ENtXYep", "specialCharacterLocation": "JGZ4lfyb", "specialCharacters": ["UC1U053v", "VACo6CWZ", "muqDkeJv"]}}, {"field": "tIzVUTvK", "validation": {"allowAllSpecialCharacters": false, "allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "blockedWord": ["4Pz8AqcU", "PeQCDE2c", "OocasjYW"], "description": [{"language": "cJ5KlYFB", "message": ["J5cFyBSX", "BXvYW7Bd", "qOucliig"]}, {"language": "13KBZzEt", "message": ["b5EHRaXB", "AC3UmJTr", "ePYAqyom"]}, {"language": "eRed7IlW", "message": ["Uj64a4G4", "QsvTa4H0", "a59yt7Aa"]}], "isCustomRegex": false, "letterCase": "pZrLBhoN", "maxLength": 72, "maxRepeatingAlphaNum": 85, "maxRepeatingSpecialCharacter": 70, "minCharType": 82, "minLength": 72, "regex": "CYP6H3w1", "specialCharacterLocation": "chBX57rM", "specialCharacters": ["IpbXqPeH", "XKbhUoFr", "pioCpNWl"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'M935cowW' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'bwkp3c7m' \
    --before 'tXDj197s' \
    --limit '49' \
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
    --body '{"ageRestriction": 56, "enable": true}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'DbZXPRkm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 45}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'TSlPxeQf' \
    --limit '83' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminBanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"ban": "j2k6djF3", "comment": "tmqMfBU5", "endDate": "ePvvm8PX", "reason": "Ojv8XysD", "skipNotif": true, "userIds": ["4jndeCVw", "ftbSKLcw", "aVtLTvSd"]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminBanUserBulkV3' test.out

#- 118 AdminUnbanUserBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminUnbanUserBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"bans": [{"banId": "RqitmYBR", "userId": "bWq0AaAx"}, {"banId": "j7vkwEie", "userId": "lCsxWrKb"}, {"banId": "J3wXAqPQ", "userId": "L4vCWL9w"}]}' \
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
    --clientId '0XN0JpJ5' \
    --clientName 'udX4PwEf' \
    --clientType 'Dv1BhqQv' \
    --limit '45' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsByNamespaceV3' test.out

#- 121 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["ixCMi3be", "yhCINaBy", "ebZi12Pm"], "baseUri": "NpdCO1E2", "clientId": "wNkACv1y", "clientName": "f97TF1AD", "clientPermissions": [{"action": 2, "resource": "lRzDwPls", "schedAction": 75, "schedCron": "UIimXdXE", "schedRange": ["T6YlJb8I", "9EoU8Sde", "ursxhysn"]}, {"action": 71, "resource": "C6to97V2", "schedAction": 79, "schedCron": "d5zLinvG", "schedRange": ["VpsuDYK0", "czAf4Qcn", "v3QM0PC6"]}, {"action": 49, "resource": "OLLFq6hm", "schedAction": 50, "schedCron": "yuv2EEFz", "schedRange": ["f2D2ZgTG", "oKdtSnKp", "Ow0o4U3M"]}], "clientPlatform": "THCASXrs", "deletable": true, "description": "CzcRm9aI", "namespace": "lgiQBtdi", "oauthAccessTokenExpiration": 39, "oauthAccessTokenExpirationTimeUnit": "gdILGk7Z", "oauthClientType": "VGRvDzI1", "oauthRefreshTokenExpiration": 35, "oauthRefreshTokenExpirationTimeUnit": "bVv2y91h", "parentNamespace": "KLJklyZU", "redirectUri": "z3DeKZPb", "scopes": ["07RKVYIA", "XcvpXC6W", "SDCzz3uf"], "secret": "eP627XGi", "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 121 'AdminCreateClientV3' test.out

#- 122 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'fof4skOX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 123 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'h0MWgXr5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminDeleteClientV3' test.out

#- 124 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'Pmtx1hcy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["lboa7KVX", "IzA3Ci2s", "hp5Fjhor"], "baseUri": "Vvm1bMPM", "clientName": "8CCfbA6s", "clientPermissions": [{"action": 87, "resource": "0i729AB7", "schedAction": 19, "schedCron": "H25DMJXV", "schedRange": ["6xSv357e", "ZyjU4ojM", "KNwZ7WLv"]}, {"action": 60, "resource": "mcYyKZcM", "schedAction": 77, "schedCron": "La3cPykq", "schedRange": ["bnU1DiKD", "p8K6xBvh", "sy7EErIE"]}, {"action": 63, "resource": "1IBPkJPy", "schedAction": 85, "schedCron": "IIhXrbbu", "schedRange": ["VhC3FzNF", "RSSeRPs9", "4AZjhDoh"]}], "clientPlatform": "ITRCY4d4", "deletable": true, "description": "yQrpKq0d", "namespace": "EaGipPeO", "oauthAccessTokenExpiration": 62, "oauthAccessTokenExpirationTimeUnit": "dcC7o0ed", "oauthRefreshTokenExpiration": 20, "oauthRefreshTokenExpirationTimeUnit": "ZPizoNAi", "redirectUri": "yUEXzsHB", "scopes": ["oFxye5y8", "N6trFRrc", "eUR6HFqf"], "twoFactorEnabled": true}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateClientV3' test.out

#- 125 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'UFzJlnKy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 64, "resource": "Og2jlezt"}, {"action": 24, "resource": "PtS3DlOu"}, {"action": 72, "resource": "V217p8Ne"}]}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateClientPermissionV3' test.out

#- 126 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'RxQIVDlD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 92, "resource": "KM8UNk1q"}, {"action": 76, "resource": "m6zhVJkj"}, {"action": 17, "resource": "h2BLlJLd"}]}' \
    > test.out 2>&1
eval_tap $? 126 'AdminAddClientPermissionsV3' test.out

#- 127 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '8' \
    --clientId '4kd6z563' \
    --namespace "$AB_NAMESPACE" \
    --resource 'pcghCU6n' \
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
    --limit '81' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 130 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 131 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xUbNlQk3' \
    > test.out 2>&1
eval_tap $? 131 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 132 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1Pgud4d6' \
    --body '{"ACSURL": "ZnBFVOpZ", "AWSCognitoRegion": "GG2qErrn", "AWSCognitoUserPool": "Cj2fFndx", "AllowedClients": ["RpftlsHz", "h2GXTGjG", "xZDqk7Cf"], "AppId": "3lwxtOCJ", "AuthorizationEndpoint": "k8QaybkU", "ClientId": "tQbhIelp", "Environment": "0ivbWrYf", "FederationMetadataURL": "d6tEvdj3", "GenericOauthFlow": false, "IsActive": true, "Issuer": "4mp5GGiJ", "JWKSEndpoint": "JTrq3E5s", "KeyID": "B0yUEP6Z", "NetflixCertificates": {"encryptedPrivateKey": "p7FiWSOG", "encryptedPrivateKeyName": "ci5foiLC", "publicCertificate": "LrEZRDJt", "publicCertificateName": "kKg06nT6", "rootCertificate": "laiZepGv", "rootCertificateName": "7fZeBH07"}, "OrganizationId": "f4lsaqVi", "PlatformName": "JjM5gbT3", "RedirectUri": "27hoWRIy", "RegisteredDomains": [{"affectedClientIDs": ["JmFyTjPP", "oklg3G02", "NZvWIyEg"], "domain": "RqSTAPF5", "namespaces": ["mnhYwESE", "cyo1u9Hk", "7RcVR50v"], "roleId": "VGfpYYki"}, {"affectedClientIDs": ["w2ez9ES8", "VNYDiATD", "1eRcsO6X"], "domain": "FCjnBCue", "namespaces": ["2os5MiqS", "FqmJjOfz", "VRLF8JID"], "roleId": "4DYp99DE"}, {"affectedClientIDs": ["Hl9iu0xA", "DMG9SJm5", "WnI6oVuD"], "domain": "YJZb2rQB", "namespaces": ["hQkIpEzE", "mWXKRKe0", "MXKsrmgm"], "roleId": "3aHYBDCA"}], "Secret": "ddqp6CGU", "TeamID": "ShIc7LK0", "TokenAuthenticationType": "yCu9Qd4j", "TokenClaimsMapping": {"9WwNKr3P": "LoLkLGH3", "daAdX9Cj": "SQQdSLVK", "6WofvFbP": "anRHrcZn"}, "TokenEndpoint": "CrCL55uT", "scopes": ["7dDLIEYu", "vy0h0IT1", "J3bUsBEK"]}' \
    > test.out 2>&1
eval_tap $? 132 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 133 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rToABuwF' \
    > test.out 2>&1
eval_tap $? 133 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 134 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yn9j8WFt' \
    --body '{"ACSURL": "d1hE9fbs", "AWSCognitoRegion": "G6Hd4Llx", "AWSCognitoUserPool": "iGjNvI7a", "AllowedClients": ["TGG0KQPn", "kx9BHwbU", "QkgeSPc6"], "AppId": "QwkN4t0D", "AuthorizationEndpoint": "2lS4r4ID", "ClientId": "nhUGEXnY", "Environment": "y4L2J6vu", "FederationMetadataURL": "TdZJknCO", "GenericOauthFlow": false, "IsActive": true, "Issuer": "fxahicMn", "JWKSEndpoint": "dRLNuaUK", "KeyID": "pL9QPWmb", "NetflixCertificates": {"encryptedPrivateKey": "zwNnEt9B", "encryptedPrivateKeyName": "bsAer88C", "publicCertificate": "S9dHB5SE", "publicCertificateName": "Nvd2yLGI", "rootCertificate": "ykAY8iou", "rootCertificateName": "fIYQ52Bx"}, "OrganizationId": "3Nso0eOU", "PlatformName": "y3rEEFMO", "RedirectUri": "IVSbvV28", "RegisteredDomains": [{"affectedClientIDs": ["0fwLOivJ", "Lf1a24uI", "wm6x4Yfj"], "domain": "IshE6p00", "namespaces": ["8DmqSELT", "WUdT5CE7", "uVJoU2G1"], "roleId": "aqRqJKDO"}, {"affectedClientIDs": ["XYAicbN9", "rOpmKq4t", "fyKKzs4T"], "domain": "4wU4zJOX", "namespaces": ["TdcDqFDF", "8sheDO2M", "8uOoKaPh"], "roleId": "QVIvcmvg"}, {"affectedClientIDs": ["BpiWTv1Q", "PhrxPxbO", "JllwFA6b"], "domain": "migSatei", "namespaces": ["CPyvpXiJ", "9kLYI3y4", "b3XwEi3D"], "roleId": "4at3BQ66"}], "Secret": "3xNZjEeW", "TeamID": "isDmdA2P", "TokenAuthenticationType": "KjexU23a", "TokenClaimsMapping": {"aDbqREKI": "ROkQRd7X", "009Ctjqt": "36sRsUul", "M7Rgaxo1": "lVFKU1g5"}, "TokenEndpoint": "iu7C6HT1", "scopes": ["gy5q4qjx", "Xdv3wcAy", "d7zOIaQV"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 135 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oGT58eYy' \
    --body '{"affectedClientIDs": ["RPORXPqD", "rB2EEb8J", "Rcw9P9aV"], "assignedNamespaces": ["IE3XHsmM", "398sMnyu", "fHkhYY5U"], "domain": "A6hgnCzw", "roleId": "JjbrkE0r"}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 136 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WLhB75FB' \
    --body '{"domain": "S8M0RjcB"}' \
    > test.out 2>&1
eval_tap $? 136 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 137 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tzVHQir1' \
    > test.out 2>&1
eval_tap $? 137 'RetrieveSSOLoginPlatformCredential' test.out

#- 138 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LnpPyfhD' \
    --body '{"acsUrl": "spjLdD78", "apiKey": "GsnSRdSo", "appId": "qcqk422y", "federationMetadataUrl": "A4muTDcM", "isActive": true, "redirectUri": "WgMDQ3DU", "secret": "y7OVMU6a", "ssoUrl": "uWu0R3Wb"}' \
    > test.out 2>&1
eval_tap $? 138 'AddSSOLoginPlatformCredential' test.out

#- 139 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TYwxVdzY' \
    > test.out 2>&1
eval_tap $? 139 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 140 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GJNIlTlx' \
    --body '{"acsUrl": "xtTmWimU", "apiKey": "nfm4ZX9Z", "appId": "jz87YYlq", "federationMetadataUrl": "OcQCfBqe", "isActive": true, "redirectUri": "OM93hzWG", "secret": "eghEokv0", "ssoUrl": "ZJ7D6A6d"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateSSOPlatformCredential' test.out

#- 141 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PnhqNW2J' \
    --platformUserId 'bADGziIo' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByPlatformUserIDV3' test.out

#- 142 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'EK1nbad3' \
    --after '72' \
    --before '85' \
    --limit '34' \
    > test.out 2>&1
eval_tap $? 142 'GetAdminUsersByRoleIdV3' test.out

#- 143 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'drYBsDfF' \
    > test.out 2>&1
eval_tap $? 143 'AdminGetUserByEmailAddressV3' test.out

#- 144 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["P8s841sO", "azw3H2Wk", "2Qha0EGp"]}' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUserIDByUserIDsV3' test.out

#- 145 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["I8PbD8Yo", "b9CT8shh", "5E41bS6S"], "isAdmin": true, "namespace": "cY26zuL1", "roles": ["cg8CydC5", "h2THLJl6", "ElJY1X4i"]}' \
    > test.out 2>&1
eval_tap $? 145 'AdminInviteUserV3' test.out

#- 146 AdminQueryThirdPlatformLinkHistoryV3
./ng net.accelbyte.sdk.cli.Main iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '100' \
    --platformUserId 'NJ1ZuQgA' \
    --platformId 'oVrvdSyO' \
    > test.out 2>&1
eval_tap $? 146 'AdminQueryThirdPlatformLinkHistoryV3' test.out

#- 147 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 147 'AdminListUsersV3' test.out

#- 148 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'z9N0zwHZ' \
    --endDate 'wY6TeR8u' \
    --limit '76' \
    --offset '39' \
    --platformBy 'nK3XaWc1' \
    --platformId 'UJ0uqIv8' \
    --query '1q0hhqlP' \
    --startDate 'YW9elNWy' \
    > test.out 2>&1
eval_tap $? 148 'AdminSearchUserV3' test.out

#- 149 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["wUu5w09P", "IfGIQxf7", "WfIqF7HU"]}' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetBulkUserByEmailAddressV3' test.out

#- 150 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qCtcv5ER' \
    > test.out 2>&1
eval_tap $? 150 'AdminGetUserByUserIdV3' test.out

#- 151 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TVPJD9YP' \
    --body '{"avatarUrl": "Mg2LgHSB", "country": "bEqyaqvz", "dateOfBirth": "kz8q76ds", "displayName": "nFV9l011", "languageTag": "tmKllUnA", "userName": "fYrHRcb4"}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserV3' test.out

#- 152 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MHUDqTkl' \
    --activeOnly  \
    --after 'MiPUkKpx' \
    --before 'XQGTL7ox' \
    --limit '70' \
    > test.out 2>&1
eval_tap $? 152 'AdminGetUserBanV3' test.out

#- 153 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qea7JjJ8' \
    --body '{"ban": "nv83SM02", "comment": "AZjoJv8q", "endDate": "UcivlnNE", "reason": "GO9SR6Mf", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 153 'AdminBanUserV3' test.out

#- 154 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'LMcWpOap' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gyfytZeZ' \
    --body '{"enabled": true, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 154 'AdminUpdateUserBanV3' test.out

#- 155 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4uae9y6H' \
    --body '{"context": "lNMMnlCX", "emailAddress": "LUtPJjdJ", "languageTag": "CLhXesLJ"}' \
    > test.out 2>&1
eval_tap $? 155 'AdminSendVerificationCodeV3' test.out

#- 156 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tbbzDbq3' \
    --body '{"Code": "HY0eQxi3", "ContactType": "mDMuddpU", "LanguageTag": "W7H5cYIq", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 156 'AdminVerifyAccountV3' test.out

#- 157 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'jTvBO4vk' \
    > test.out 2>&1
eval_tap $? 157 'GetUserVerificationCode' test.out

#- 158 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rzjX6uQF' \
    > test.out 2>&1
eval_tap $? 158 'AdminGetUserDeletionStatusV3' test.out

#- 159 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CxX8DcA3' \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 159 'AdminUpdateUserDeletionStatusV3' test.out

#- 160 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9l64nQHE' \
    --body '{"code": "mZOBVo18", "country": "F3Hi6twj", "dateOfBirth": "LIpe2XFB", "displayName": "lwEgOTBe", "emailAddress": "wVMGj3ZL", "password": "1Gza0xfO", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpgradeHeadlessAccountV3' test.out

#- 161 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rcni4Q4l' \
    > test.out 2>&1
eval_tap $? 161 'AdminDeleteUserInformationV3' test.out

#- 162 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8FMgmhsY' \
    --after '0.4969660692511475' \
    --before '0.9561671403631351' \
    --limit '67' \
    > test.out 2>&1
eval_tap $? 162 'AdminGetUserLoginHistoriesV3' test.out

#- 163 AdminResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'w3OqC5oJ' \
    --body '{"languageTag": "8MYBnwkF", "newPassword": "hzwHJnIr", "oldPassword": "sGWxqP2n"}' \
    > test.out 2>&1
eval_tap $? 163 'AdminResetPasswordV3' test.out

#- 164 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9YsFBWcC' \
    --body '{"Permissions": [{"Action": 64, "Resource": "20G7axtE", "SchedAction": 71, "SchedCron": "rlaT2eu4", "SchedRange": ["h955FdvB", "GYWv7u8D", "qpHe26AU"]}, {"Action": 2, "Resource": "NIxnZEvv", "SchedAction": 100, "SchedCron": "o4JfVBl9", "SchedRange": ["rNAPFddo", "Cnrc00H1", "oiM5PBjM"]}, {"Action": 1, "Resource": "2ETaKmqM", "SchedAction": 92, "SchedCron": "wHkSOqJz", "SchedRange": ["j3cE90HD", "rPCUSkjZ", "bGpVLmKH"]}]}' \
    > test.out 2>&1
eval_tap $? 164 'AdminUpdateUserPermissionV3' test.out

#- 165 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ML0idBv2' \
    --body '{"Permissions": [{"Action": 89, "Resource": "VCqZoqBM", "SchedAction": 19, "SchedCron": "552oMXVS", "SchedRange": ["Ufm0CNb8", "qtvxfwHM", "Rv12OhsO"]}, {"Action": 45, "Resource": "J7XClJU5", "SchedAction": 9, "SchedCron": "VPEA2gBL", "SchedRange": ["rqCxNvs1", "RjWvrPYL", "oo9RhBhV"]}, {"Action": 92, "Resource": "Mi5GBvCk", "SchedAction": 93, "SchedCron": "fRAsAth4", "SchedRange": ["GIq77YbV", "OCgFjYgV", "Ti6yr8o1"]}]}' \
    > test.out 2>&1
eval_tap $? 165 'AdminAddUserPermissionsV3' test.out

#- 166 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ODAFsrmo' \
    --body '[{"Action": 57, "Resource": "sXTGZu80"}, {"Action": 21, "Resource": "YOpgYhth"}, {"Action": 86, "Resource": "sc8cjCVe"}]' \
    > test.out 2>&1
eval_tap $? 166 'AdminDeleteUserPermissionBulkV3' test.out

#- 167 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '23' \
    --namespace "$AB_NAMESPACE" \
    --resource 'mue0We8G' \
    --userId 'a4qrgxle' \
    > test.out 2>&1
eval_tap $? 167 'AdminDeleteUserPermissionV3' test.out

#- 168 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BoQMLgEd' \
    --after 'P9OUcEsf' \
    --before 'sRzERS9R' \
    --limit '90' \
    > test.out 2>&1
eval_tap $? 168 'AdminGetUserPlatformAccountsV3' test.out

#- 169 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'yoycb0Sd' \
    > test.out 2>&1
eval_tap $? 169 'AdminGetListJusticePlatformAccounts' test.out

#- 170 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '9oO3lFtz' \
    --userId '7op5BDxB' \
    > test.out 2>&1
eval_tap $? 170 'AdminGetUserMapping' test.out

#- 171 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'k5lNQ4VQ' \
    --userId '1aw9VSB0' \
    > test.out 2>&1
eval_tap $? 171 'AdminCreateJusticeUser' test.out

#- 172 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'PD4uwOf6' \
    --body '{"platformId": "cE96Ejq4", "platformUserId": "xVRwXvco"}' \
    > test.out 2>&1
eval_tap $? 172 'AdminLinkPlatformAccount' test.out

#- 173 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8pnpj48g' \
    --userId 'ZnigQ1vi' \
    --body '{"platformNamespace": "MZdH9Qat"}' \
    > test.out 2>&1
eval_tap $? 173 'AdminPlatformUnlinkV3' test.out

#- 174 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gSAhpOS8' \
    --userId 't4CUkKxU' \
    --ticket '4SYk6xSp' \
    > test.out 2>&1
eval_tap $? 174 'AdminPlatformLinkV3' test.out

#- 175 AdminGetThirdPartyPlatformTokenLinkStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HioBY8Xn' \
    --userId 'OkUObCzj' \
    --platformToken 'MGDgo8Cf' \
    > test.out 2>&1
eval_tap $? 175 'AdminGetThirdPartyPlatformTokenLinkStatusV3' test.out

#- 176 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'u8XZiUf1' \
    --body '["3g6Xka47", "VMpgs3Ds", "vmtTOkcA"]' \
    > test.out 2>&1
eval_tap $? 176 'AdminDeleteUserRolesV3' test.out

#- 177 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NbEvP0xL' \
    --body '[{"namespace": "hQ89A8F7", "roleId": "lBvugvip"}, {"namespace": "spRjZtC1", "roleId": "xMwyBRMu"}, {"namespace": "ZigUmA95", "roleId": "dEwFr2YA"}]' \
    > test.out 2>&1
eval_tap $? 177 'AdminSaveUserRoleV3' test.out

#- 178 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'xoC3plOF' \
    --userId 'XY6Ltn4V' \
    > test.out 2>&1
eval_tap $? 178 'AdminAddUserRoleV3' test.out

#- 179 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId '9yYMhqK4' \
    --userId '408mf2ME' \
    > test.out 2>&1
eval_tap $? 179 'AdminDeleteUserRoleV3' test.out

#- 180 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6e6NnuB4' \
    --body '{"enabled": false, "reason": "kLIOysGd"}' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateUserStatusV3' test.out

#- 181 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'B07VW1Aq' \
    > test.out 2>&1
eval_tap $? 181 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 182 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'SvOQbiVy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "h3lhd2gu"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateClientSecretV3' test.out

#- 183 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'C8RXUMXP' \
    --before 't76mU7Wd' \
    --isWildcard  \
    --limit '99' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRolesV3' test.out

#- 184 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "managers": [{"displayName": "eeQ18Knh", "namespace": "e2tOXxwC", "userId": "4PTU8RaQ"}, {"displayName": "atNq0lkE", "namespace": "9fLhNfxJ", "userId": "VJXzW7uj"}, {"displayName": "ktYF2wbE", "namespace": "zqIDBiaB", "userId": "f8AkH0Bz"}], "members": [{"displayName": "basViamf", "namespace": "VOJ3DSBF", "userId": "jz25HH5Q"}, {"displayName": "PALFzYX7", "namespace": "ukGZJqxQ", "userId": "RNDzWhjs"}, {"displayName": "EvLZOjRG", "namespace": "7d13M4gd", "userId": "Qbkb85ML"}], "permissions": [{"action": 78, "resource": "8mTfWXLO", "schedAction": 6, "schedCron": "0YlidO8r", "schedRange": ["bZPWIWOy", "sGS8otX6", "KPFn1d3k"]}, {"action": 24, "resource": "k9GEfN8d", "schedAction": 18, "schedCron": "Tl7fDIUN", "schedRange": ["AmWGnHW8", "Q8FinsQf", "FJXKzhh5"]}, {"action": 22, "resource": "KnjcUCCt", "schedAction": 31, "schedCron": "ZmAjYkLn", "schedRange": ["QdjrjWeo", "7i6KMRwV", "0D1BCGLh"]}], "roleName": "XEaFM1ke"}' \
    > test.out 2>&1
eval_tap $? 184 'AdminCreateRoleV3' test.out

#- 185 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId '6bNL3AA2' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleV3' test.out

#- 186 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'ytgm42CC' \
    > test.out 2>&1
eval_tap $? 186 'AdminDeleteRoleV3' test.out

#- 187 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'YPLWuAPN' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "HUzpySXO"}' \
    > test.out 2>&1
eval_tap $? 187 'AdminUpdateRoleV3' test.out

#- 188 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'Wfea6T9A' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleAdminStatusV3' test.out

#- 189 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId '87VtdZoh' \
    > test.out 2>&1
eval_tap $? 189 'AdminUpdateAdminRoleStatusV3' test.out

#- 190 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'M6fNotJq' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleAdminV3' test.out

#- 191 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'weqZHC4e' \
    --after 'v65KqzPU' \
    --before 'BBoLQAS8' \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 191 'AdminGetRoleManagersV3' test.out

#- 192 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'v21grsCO' \
    --body '{"managers": [{"displayName": "RFUzhsYH", "namespace": "7FC8vOvT", "userId": "stfpxZgJ"}, {"displayName": "jMc64OXa", "namespace": "9yocFq9Q", "userId": "HUaq8c9V"}, {"displayName": "197hQj9u", "namespace": "5E6SvX41", "userId": "lzq9WOA3"}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRoleManagersV3' test.out

#- 193 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'TX3fmGB2' \
    --body '{"managers": [{"displayName": "bmmEPkeC", "namespace": "Z59GYDDF", "userId": "LFir3WYv"}, {"displayName": "R2mlKLsA", "namespace": "n060vjAY", "userId": "hML0Kjvj"}, {"displayName": "O3Xg8W4X", "namespace": "pew3IdWW", "userId": "tCWemyAu"}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminRemoveRoleManagersV3' test.out

#- 194 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'SeRbGBSL' \
    --after 'nhurNjvO' \
    --before 'pgTtrItt' \
    --limit '78' \
    > test.out 2>&1
eval_tap $? 194 'AdminGetRoleMembersV3' test.out

#- 195 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'wnNlUZ3o' \
    --body '{"members": [{"displayName": "9xiFDLbk", "namespace": "M9T8CbXB", "userId": "S1Gc80ub"}, {"displayName": "CygkDPl7", "namespace": "XXcV0Hqz", "userId": "Fa0kQcoQ"}, {"displayName": "BARRp9nl", "namespace": "ccykP2kz", "userId": "8GwJlyDk"}]}' \
    > test.out 2>&1
eval_tap $? 195 'AdminAddRoleMembersV3' test.out

#- 196 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'Sfu7mriB' \
    --body '{"members": [{"displayName": "w4iAfD6n", "namespace": "yxjJunZK", "userId": "OrATrr6X"}, {"displayName": "wyrHhDAZ", "namespace": "C3u3zav0", "userId": "FueLq4cy"}, {"displayName": "81TUpTqN", "namespace": "VeYTxLcS", "userId": "sTZTZv0z"}]}' \
    > test.out 2>&1
eval_tap $? 196 'AdminRemoveRoleMembersV3' test.out

#- 197 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'FL8SK3Ht' \
    --body '{"permissions": [{"action": 70, "resource": "gOLPr82I", "schedAction": 33, "schedCron": "nAJKUsNT", "schedRange": ["ooB4TQS7", "ZO37BduP", "8x996ykl"]}, {"action": 81, "resource": "6zYwo3ak", "schedAction": 53, "schedCron": "i2DKKbPI", "schedRange": ["3dCNXfvo", "KWxOUpfj", "XLHo5aFx"]}, {"action": 20, "resource": "q25a01zF", "schedAction": 30, "schedCron": "JWHrruxJ", "schedRange": ["Cqiu8DVx", "NZ5POPsP", "YB63Ogin"]}]}' \
    > test.out 2>&1
eval_tap $? 197 'AdminUpdateRolePermissionsV3' test.out

#- 198 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'Qyh3tflw' \
    --body '{"permissions": [{"action": 52, "resource": "ygjGX0bm", "schedAction": 30, "schedCron": "0ucEFbQM", "schedRange": ["HEJ5IfGL", "8g0RalkL", "sSv96VyP"]}, {"action": 52, "resource": "Dxmz8tlD", "schedAction": 37, "schedCron": "k27mDT8q", "schedRange": ["VeYluESV", "yFS61Wdo", "qgouWokx"]}, {"action": 42, "resource": "0LK6RINH", "schedAction": 55, "schedCron": "gpYMztmZ", "schedRange": ["EvO7tpOx", "CKiRSpvs", "6H0U1Wdt"]}]}' \
    > test.out 2>&1
eval_tap $? 198 'AdminAddRolePermissionsV3' test.out

#- 199 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId '5HkEtdFL' \
    --body '["OViHgk2B", "mUQrjjTG", "fFxxz2n3"]' \
    > test.out 2>&1
eval_tap $? 199 'AdminDeleteRolePermissionsV3' test.out

#- 200 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '29' \
    --resource 'pgUKQpfS' \
    --roleId '4H8GNCPy' \
    > test.out 2>&1
eval_tap $? 200 'AdminDeleteRolePermissionV3' test.out

#- 201 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 201 'AdminGetMyUserV3' test.out

#- 202 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'I6kzXerS' \
    --extendExp  \
    --redirectUri 'ZVwWG6QN' \
    --password 'MGM4aAKD' \
    --requestId 'vjzuqV4j' \
    --userName 'HvoxWdEm' \
    > test.out 2>&1
eval_tap $? 202 'UserAuthenticationV3' test.out

#- 203 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'CqcCXOG6' \
    --linkingToken '46wITHI2' \
    --password 'rJPuLxh2' \
    --username 'iDu2ZkZY' \
    > test.out 2>&1
eval_tap $? 203 'AuthenticationWithPlatformLinkV3' test.out

#- 204 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'aB9gtZY3' \
    > test.out 2>&1
eval_tap $? 204 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 205 RequestOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam requestOneTimeLinkingCodeV3 \
    --platformId 'dlCDbWHx' \
    > test.out 2>&1
eval_tap $? 205 'RequestOneTimeLinkingCodeV3' test.out

#- 206 ValidateOneTimeLinkingCodeV3
./ng net.accelbyte.sdk.cli.Main iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode 'qyQrnuOo' \
    > test.out 2>&1
eval_tap $? 206 'ValidateOneTimeLinkingCodeV3' test.out

#- 207 RequestTokenByOneTimeLinkCodeResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestTokenByOneTimeLinkCodeResponseV3 \
    --clientId '5rMVB7zf' \
    --oneTimeLinkCode 'mqn0DAks' \
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
    --clientId 'U3Z619ss' \
    > test.out 2>&1
eval_tap $? 210 'RequestGameTokenCodeResponseV3' test.out

#- 211 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jKwerKUl' \
    --userId 'Pkcxpjgy' \
    > test.out 2>&1
eval_tap $? 211 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 212 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ee0gxEdB' \
    > test.out 2>&1
eval_tap $? 212 'RevokeUserV3' test.out

#- 213 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'Xsdykhgx' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --oneTimeLinkCode 'LVsFHIb4' \
    --redirectUri 'hd1qJUK9' \
    --scope 'Qr4JuJpq' \
    --state 'M6KUHloj' \
    --targetAuthPage 'kyOizNLb' \
    --useRedirectUriAsLoginUrlWhenLocked  \
    --clientId '6EqdUj5C' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 213 'AuthorizeV3' test.out

#- 214 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'F6GyZaS3' \
    > test.out 2>&1
eval_tap $? 214 'TokenIntrospectionV3' test.out

#- 215 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 215 'GetJWKSV3' test.out

#- 216 SendMFAAuthenticationCode
./ng net.accelbyte.sdk.cli.Main iam sendMFAAuthenticationCode \
    --clientId '65gzIl9n' \
    --factor 'VJfRrM4Z' \
    --mfaToken 'uKAoIacy' \
    > test.out 2>&1
eval_tap $? 216 'SendMFAAuthenticationCode' test.out

#- 217 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'XsSSr9hn' \
    --mfaToken 'MbLNO3id' \
    > test.out 2>&1
eval_tap $? 217 'Change2faMethod' test.out

#- 218 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code '7oRwk4y8' \
    --factor 'sYzFpjFo' \
    --mfaToken 'boQnJIKQ' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 218 'Verify2faCode' test.out

#- 219 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yAiqz9t8' \
    --userId 'agnbLrMi' \
    > test.out 2>&1
eval_tap $? 219 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 220 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'X9C9Ya11' \
    --clientId 'tnup6kJa' \
    --redirectUri 'sNmx11Mq' \
    --requestId 'fyNS98Qs' \
    > test.out 2>&1
eval_tap $? 220 'AuthCodeRequestV3' test.out

#- 221 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'jKaSackP' \
    --clientId 'CRLeU5p0' \
    --createHeadless  \
    --deviceId '9OvjBDAt' \
    --macAddress 'bEc73ywW' \
    --platformToken 'huWMzTBN' \
    > test.out 2>&1
eval_tap $? 221 'PlatformTokenGrantV3' test.out

#- 222 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 222 'GetRevocationListV3' test.out

#- 223 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token '6eFbiB3D' \
    > test.out 2>&1
eval_tap $? 223 'TokenRevocationV3' test.out

#- 224 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'ajyqSSol' \
    --code '4NdHf44y' \
    --codeVerifier '89c9URg6' \
    --extendExp  \
    --password 'MTBRkEza' \
    --redirectUri 'EBKmQNNV' \
    --refreshToken 'X4OQzkvg' \
    --username 'WHwrgJrB' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 224 'TokenGrantV3' test.out

#- 225 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token '9dVX4VSV' \
    > test.out 2>&1
eval_tap $? 225 'VerifyTokenV3' test.out

#- 226 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'hc0NEJkR' \
    --code 'gRjNCIzr' \
    --error 'iNtkinQH' \
    --openidAssocHandle '4v9rbLji' \
    --openidClaimedId 'oc8V4WpN' \
    --openidIdentity 'CQxPpx62' \
    --openidMode 'h4pQhQwH' \
    --openidNs 'UpOjy7ge' \
    --openidOpEndpoint 'GrpLOQFf' \
    --openidResponseNonce 'kExqmOP1' \
    --openidReturnTo 'wQGlnQVp' \
    --openidSig 'N6Xj9QmH' \
    --openidSigned 'I5yN1I8c' \
    --state 'q51BBAaZ' \
    > test.out 2>&1
eval_tap $? 226 'PlatformAuthenticationV3' test.out

#- 227 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode '4n9LwweH' \
    > test.out 2>&1
eval_tap $? 227 'PublicGetInputValidations' test.out

#- 228 PublicGetCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestrictionV3 \
    --countryCode '6YFFY4rf' \
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
    --clientId 'JQgUhaVD' \
    > test.out 2>&1
eval_tap $? 230 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 231 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '3Pt8rw50' \
    --body '{"platformUserIds": ["XlndmNGb", "NA5SXVhe", "sbtQ7CvW"]}' \
    > test.out 2>&1
eval_tap $? 231 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 232 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'h20NYg0Z' \
    --platformUserId 'rxzkzium' \
    > test.out 2>&1
eval_tap $? 232 'PublicGetUserByPlatformUserIDV3' test.out

#- 233 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'gTCoyifh' \
    > test.out 2>&1
eval_tap $? 233 'PublicGetAsyncStatus' test.out

#- 234 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '1uHCT1uc' \
    --limit '75' \
    --offset '31' \
    --query 'PhRdkDxw' \
    > test.out 2>&1
eval_tap $? 234 'PublicSearchUserV3' test.out

#- 235 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "J7D4Bynh", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "671zIRrj", "policyId": "89KesuKl", "policyVersionId": "eie64Ion"}, {"isAccepted": false, "localizedPolicyVersionId": "Td4M8AP4", "policyId": "6pNwxonu", "policyVersionId": "HE0glszg"}, {"isAccepted": false, "localizedPolicyVersionId": "EYVwrYFx", "policyId": "livCWZSO", "policyVersionId": "QduWa6QR"}], "authType": "JNCUKc3c", "code": "svJ9yT8v", "country": "7ZIIBEqN", "dateOfBirth": "ifeNmm74", "displayName": "He66m3x6", "emailAddress": "DKwoVNBE", "password": "cfEkY7T1", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 235 'PublicCreateUserV3' test.out

#- 236 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'TRnOJ2Qf' \
    --query 'TkWnB4RK' \
    > test.out 2>&1
eval_tap $? 236 'CheckUserAvailability' test.out

#- 237 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["0BWAcU7D", "eSvSrAV5", "EGmOWYWG"]}' \
    > test.out 2>&1
eval_tap $? 237 'PublicBulkGetUsers' test.out

#- 238 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "qRb2QRlG", "languageTag": "6o8YIJQA"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicSendRegistrationCode' test.out

#- 239 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Lf97ZJLj", "emailAddress": "iqtHEpmx"}' \
    > test.out 2>&1
eval_tap $? 239 'PublicVerifyRegistrationCode' test.out

#- 240 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "xSP6kIiF", "languageTag": "PXERtaJP"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicForgotPasswordV3' test.out

#- 241 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId '0pkX1RqR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'GetAdminInvitationV3' test.out

#- 242 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'c9F6OpDK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "CphYkssG", "policyId": "iwPprjMN", "policyVersionId": "6EGYhUW4"}, {"isAccepted": false, "localizedPolicyVersionId": "JaFcsudh", "policyId": "4Dy9JO5e", "policyVersionId": "ws0bgyaN"}, {"isAccepted": true, "localizedPolicyVersionId": "LXVZCFKg", "policyId": "nVrimn8Y", "policyVersionId": "JJ04exyA"}], "authType": "EMAILPASSWD", "country": "9vSkewEG", "dateOfBirth": "Dkf2ieWx", "displayName": "8OOHzuyx", "password": "k7fa8lKB", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 242 'CreateUserFromInvitationV3' test.out

#- 243 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "cvnwol68", "country": "oOkyMeKs", "dateOfBirth": "1gGt5dKC", "displayName": "waU9oR1H", "languageTag": "eUQQffts", "userName": "EV27xPqa"}' \
    > test.out 2>&1
eval_tap $? 243 'UpdateUserV3' test.out

#- 244 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "4zrmAEpB", "country": "EtzV16oG", "dateOfBirth": "ZNkvladG", "displayName": "3yaICZge", "languageTag": "rGfnMzOI", "userName": "4Nk6dfJb"}' \
    > test.out 2>&1
eval_tap $? 244 'PublicPartialUpdateUserV3' test.out

#- 245 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "mzCts9Fe", "emailAddress": "30C8G2c1", "languageTag": "f4MeF07w"}' \
    > test.out 2>&1
eval_tap $? 245 'PublicSendVerificationCodeV3' test.out

#- 246 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "mMAC2SPK", "contactType": "TYcuPz1K", "languageTag": "A4ToOLLa", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 246 'PublicUserVerificationV3' test.out

#- 247 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "KYQGjgY9", "country": "tVeGojR2", "dateOfBirth": "BLhrNSCy", "displayName": "YYKcszco", "emailAddress": "xGJr8KZ8", "password": "xGq53Hvn", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 247 'PublicUpgradeHeadlessAccountV3' test.out

#- 248 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "NWdJCkAL", "password": "uv592awD"}' \
    > test.out 2>&1
eval_tap $? 248 'PublicVerifyHeadlessAccountV3' test.out

#- 249 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "Ei4pIQAR", "newPassword": "X4V37IK1", "oldPassword": "AYqo4sFN"}' \
    > test.out 2>&1
eval_tap $? 249 'PublicUpdatePasswordV3' test.out

#- 250 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'PNzZ9bOo' \
    > test.out 2>&1
eval_tap $? 250 'PublicCreateJusticeUser' test.out

#- 251 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JWNX5U3i' \
    --redirectUri 'NwQ9q0Kz' \
    --ticket 'E4gt171n' \
    > test.out 2>&1
eval_tap $? 251 'PublicPlatformLinkV3' test.out

#- 252 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'APfQIHXk' \
    --body '{"platformNamespace": "vAXwgBrn"}' \
    > test.out 2>&1
eval_tap $? 252 'PublicPlatformUnlinkV3' test.out

#- 253 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DGdUI0Bw' \
    > test.out 2>&1
eval_tap $? 253 'PublicPlatformUnlinkAllV3' test.out

#- 254 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TUdbl4k1' \
    --ticket 'flsj6uHE' \
    > test.out 2>&1
eval_tap $? 254 'PublicForcePlatformLinkV3' test.out

#- 255 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'MwFR9iwO' \
    --clientId 'OBsIwYB9' \
    --redirectUri 'pUnkpdFa' \
    > test.out 2>&1
eval_tap $? 255 'PublicWebLinkPlatform' test.out

#- 256 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId '6ICCJp7E' \
    --state 'y1mQ12i1' \
    > test.out 2>&1
eval_tap $? 256 'PublicWebLinkPlatformEstablish' test.out

#- 257 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "mHGms4Vq", "emailAddress": "0TPeFTr7", "newPassword": "IejUzOki"}' \
    > test.out 2>&1
eval_tap $? 257 'ResetPasswordV3' test.out

#- 258 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'q2p5RXaI' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetUserByUserIdV3' test.out

#- 259 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SapYgJAk' \
    --activeOnly  \
    --after 'i2LoeTH1' \
    --before 'WV7btJke' \
    --limit '48' \
    > test.out 2>&1
eval_tap $? 259 'PublicGetUserBanHistoryV3' test.out

#- 260 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TfKfPqfS' \
    > test.out 2>&1
eval_tap $? 260 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 261 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OTd5LWku' \
    > test.out 2>&1
eval_tap $? 261 'PublicGetUserInformationV3' test.out

#- 262 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zWNlH90B' \
    --after '0.8933567257193098' \
    --before '0.017316286239519085' \
    --limit '1' \
    > test.out 2>&1
eval_tap $? 262 'PublicGetUserLoginHistoriesV3' test.out

#- 263 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0abu82Wb' \
    --after 'SBEjS0mi' \
    --before 'YSEWKr45' \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 263 'PublicGetUserPlatformAccountsV3' test.out

#- 264 PublicListJusticePlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicListJusticePlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zvqtidP3' \
    > test.out 2>&1
eval_tap $? 264 'PublicListJusticePlatformAccountsV3' test.out

#- 265 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fk2Bk86v' \
    --body '{"platformId": "DKqqtVXI", "platformUserId": "DyNo6sYU"}' \
    > test.out 2>&1
eval_tap $? 265 'PublicLinkPlatformAccount' test.out

#- 266 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '06ciGmcQ' \
    --body '{"chosenNamespaces": ["l61UTOMI", "LnQBxF4l", "XwqSwFe8"], "requestId": "nl3WkXjH"}' \
    > test.out 2>&1
eval_tap $? 266 'PublicForceLinkPlatformWithProgression' test.out

#- 267 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'X1jkGwAI' \
    > test.out 2>&1
eval_tap $? 267 'PublicGetPublisherUserV3' test.out

#- 268 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ukq1uPfW' \
    --password '3wEOusDj' \
    > test.out 2>&1
eval_tap $? 268 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 269 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'jpGV00BR' \
    --before 'v5DhCxrD' \
    --isWildcard  \
    --limit '56' \
    > test.out 2>&1
eval_tap $? 269 'PublicGetRolesV3' test.out

#- 270 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'GIEtkfcP' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetRoleV3' test.out

#- 271 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 271 'PublicGetMyUserV3' test.out

#- 272 PublicGetLinkHeadlessAccountToMyAccountConflictV3
./ng net.accelbyte.sdk.cli.Main iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode 'd0jqEFNU' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetLinkHeadlessAccountToMyAccountConflictV3' test.out

#- 273 LinkHeadlessAccountToMyAccountV3
./ng net.accelbyte.sdk.cli.Main iam linkHeadlessAccountToMyAccountV3 \
    --body '{"chosenNamespaces": ["3CWc23YI", "sqF76CUJ", "Ga0tKCfd"], "oneTimeLinkCode": "p18uwb6I"}' \
    > test.out 2>&1
eval_tap $? 273 'LinkHeadlessAccountToMyAccountV3' test.out

#- 274 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "6IXS1NNB"}' \
    > test.out 2>&1
eval_tap $? 274 'PublicSendVerificationLinkV3' test.out

#- 275 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code '3NzTtcyF' \
    > test.out 2>&1
eval_tap $? 275 'PublicVerifyUserByLinkV3' test.out

#- 276 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'R6YqGTW1' \
    --code 'LYohVJ9U' \
    --error 'mrgI6THA' \
    --state '3rtoFgzp' \
    > test.out 2>&1
eval_tap $? 276 'PlatformAuthenticateSAMLV3Handler' test.out

#- 277 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'IQJzvIHQ' \
    --payload 'JnfBtzef' \
    > test.out 2>&1
eval_tap $? 277 'LoginSSOClient' test.out

#- 278 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'b6FVvkGO' \
    > test.out 2>&1
eval_tap $? 278 'LogoutSSOClient' test.out

#- 279 RequestGameTokenResponseV3
./ng net.accelbyte.sdk.cli.Main iam requestGameTokenResponseV3 \
    --code 'mrX3GFzW' \
    > test.out 2>&1
eval_tap $? 279 'RequestGameTokenResponseV3' test.out

#- 280 AdminGetDevicesByUserV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDevicesByUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'w01o5mEz' \
    > test.out 2>&1
eval_tap $? 280 'AdminGetDevicesByUserV4' test.out

#- 281 AdminGetBannedDevicesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedDevicesV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'VhAht66T' \
    --endDate 'kHwEtK2v' \
    --limit '80' \
    --offset '91' \
    --startDate 'yjfoNdD8' \
    > test.out 2>&1
eval_tap $? 281 'AdminGetBannedDevicesV4' test.out

#- 282 AdminGetUserDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeviceBansV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TcCiC2Pm' \
    > test.out 2>&1
eval_tap $? 282 'AdminGetUserDeviceBansV4' test.out

#- 283 AdminBanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminBanDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "su7VUBaH", "deviceId": "eoqgPcL3", "deviceType": "ezYs05T2", "enabled": true, "endDate": "QiXBDGvG", "ext": {"X1HC0IWF": {}, "UAPjjCSL": {}, "OvwyIghh": {}}, "reason": "rjuyQy7w"}' \
    > test.out 2>&1
eval_tap $? 283 'AdminBanDeviceV4' test.out

#- 284 AdminGetDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBanV4 \
    --banId 'pm7VZQMD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'AdminGetDeviceBanV4' test.out

#- 285 AdminUpdateDeviceBanV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateDeviceBanV4 \
    --banId '91Hj3vBI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 285 'AdminUpdateDeviceBanV4' test.out

#- 286 AdminGenerateReportV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateReportV4 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'l3FSV1ue' \
    --startDate 'RhpHXFHp' \
    --deviceType 'lfvafKv4' \
    > test.out 2>&1
eval_tap $? 286 'AdminGenerateReportV4' test.out

#- 287 AdminGetDeviceTypesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceTypesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 287 'AdminGetDeviceTypesV4' test.out

#- 288 AdminGetDeviceBansV4
./ng net.accelbyte.sdk.cli.Main iam adminGetDeviceBansV4 \
    --deviceId 'TtQb2FuO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 288 'AdminGetDeviceBansV4' test.out

#- 289 AdminDecryptDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminDecryptDeviceV4 \
    --deviceId 'UhQ08wYk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 289 'AdminDecryptDeviceV4' test.out

#- 290 AdminUnbanDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminUnbanDeviceV4 \
    --deviceId 'rn0oJAlu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'AdminUnbanDeviceV4' test.out

#- 291 AdminGetUsersByDeviceV4
./ng net.accelbyte.sdk.cli.Main iam adminGetUsersByDeviceV4 \
    --deviceId 'VKw2YbXC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'AdminGetUsersByDeviceV4' test.out

#- 292 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 57}' \
    > test.out 2>&1
eval_tap $? 292 'AdminCreateTestUsersV4' test.out

#- 293 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["wU9azt00", "0zKExC7Z", "uhzjDj3f"]}' \
    > test.out 2>&1
eval_tap $? 293 'AdminBulkCheckValidUserIDV4' test.out

#- 294 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A5JPCIO2' \
    --body '{"avatarUrl": "Vx2HzR43", "country": "1hau2tpc", "dateOfBirth": "97WyRNbU", "displayName": "IHOHo1bO", "languageTag": "h040fJVQ", "userName": "pubxUKiD"}' \
    > test.out 2>&1
eval_tap $? 294 'AdminUpdateUserV4' test.out

#- 295 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lMs4qJfP' \
    --body '{"code": "7xLyxBUk", "emailAddress": "G1TMKaad"}' \
    > test.out 2>&1
eval_tap $? 295 'AdminUpdateUserEmailAddressV4' test.out

#- 296 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sHKoSgt2' \
    > test.out 2>&1
eval_tap $? 296 'AdminDisableUserMFAV4' test.out

#- 297 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CmUccbEw' \
    > test.out 2>&1
eval_tap $? 297 'AdminListUserRolesV4' test.out

#- 298 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GgzoA8Qg' \
    --body '{"assignedNamespaces": ["5pYNBwhV", "Vx57GYRf", "hJeFLwYf"], "roleId": "3xD3zqdE"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminUpdateUserRoleV4' test.out

#- 299 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sotOrqEv' \
    --body '{"assignedNamespaces": ["KCaIrvZd", "8HhbgTKv", "PTgicouQ"], "roleId": "PgEVZ6hq"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminAddUserRoleV4' test.out

#- 300 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JlpRpqGF' \
    --body '{"assignedNamespaces": ["dfAgznXw", "Zd9NFhmz", "GQQFqv7K"], "roleId": "yyhm0IWv"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminRemoveUserRoleV4' test.out

#- 301 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '24' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 301 'AdminGetRolesV4' test.out

#- 302 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "QfUboMbV"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminCreateRoleV4' test.out

#- 303 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'gwhIVE0b' \
    > test.out 2>&1
eval_tap $? 303 'AdminGetRoleV4' test.out

#- 304 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'BkwM08H1' \
    > test.out 2>&1
eval_tap $? 304 'AdminDeleteRoleV4' test.out

#- 305 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'EfIX5YTH' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "s88hMfOh"}' \
    > test.out 2>&1
eval_tap $? 305 'AdminUpdateRoleV4' test.out

#- 306 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'AuoblUZJ' \
    --body '{"permissions": [{"action": 91, "resource": "eBETOkAM", "schedAction": 36, "schedCron": "PnW7s5LX", "schedRange": ["cOlxNC5M", "gGw7yhjX", "1UP4Xdut"]}, {"action": 27, "resource": "u1SID50A", "schedAction": 93, "schedCron": "Rofxmu24", "schedRange": ["ri1MHHNJ", "H7LghLDq", "BXhngZRR"]}, {"action": 99, "resource": "eYpAVgN2", "schedAction": 91, "schedCron": "6dGsnetA", "schedRange": ["L32NoSqQ", "ubUXwNnJ", "m7DG9S4P"]}]}' \
    > test.out 2>&1
eval_tap $? 306 'AdminUpdateRolePermissionsV4' test.out

#- 307 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'EuEqLzBG' \
    --body '{"permissions": [{"action": 91, "resource": "PbMPTXWF", "schedAction": 8, "schedCron": "3tO3wr5j", "schedRange": ["uK6aEY5G", "rqRTTKIW", "pAexoiGE"]}, {"action": 61, "resource": "5qLh5Z1e", "schedAction": 23, "schedCron": "VtHu4t1n", "schedRange": ["wmlwFHPx", "GRXjpMri", "23QT2OM8"]}, {"action": 60, "resource": "hWnTXduD", "schedAction": 2, "schedCron": "ubNIHf7a", "schedRange": ["TvtNqjMZ", "I2McdDUl", "mKxlZiMO"]}]}' \
    > test.out 2>&1
eval_tap $? 307 'AdminAddRolePermissionsV4' test.out

#- 308 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'jalFMRAx' \
    --body '["HWhzAuY3", "gDV0YyxT", "4Tu2eiXo"]' \
    > test.out 2>&1
eval_tap $? 308 'AdminDeleteRolePermissionsV4' test.out

#- 309 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId '1p6vZMK4' \
    --after '609UVNEE' \
    --before '5C3cD6qg' \
    --limit '39' \
    > test.out 2>&1
eval_tap $? 309 'AdminListAssignedUsersV4' test.out

#- 310 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'E9VYHPE9' \
    --body '{"assignedNamespaces": ["X8ZC80jB", "VkqkTiKE", "x9VbLn9Q"], "namespace": "k8DlEvZK", "userId": "ye8w6bCI"}' \
    > test.out 2>&1
eval_tap $? 310 'AdminAssignUserToRoleV4' test.out

#- 311 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'V1VOuePk' \
    --body '{"namespace": "EMjD0Or0", "userId": "3yLvu8y1"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminRevokeUserFromRoleV4' test.out

#- 312 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "aHNq5R0Y", "country": "VJ89H82L", "dateOfBirth": "LsQ5lEYd", "displayName": "fPVKLHmk", "languageTag": "baBxc20y", "userName": "9c2ZH5Ml"}' \
    > test.out 2>&1
eval_tap $? 312 'AdminUpdateMyUserV4' test.out

#- 313 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 313 'AdminDisableMyAuthenticatorV4' test.out

#- 314 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'rkXDSoSm' \
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
    --code 'Nzmn8Qys' \
    > test.out 2>&1
eval_tap $? 323 'AdminEnableMyEmailV4' test.out

#- 324 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 324 'AdminGetMyEnabledFactorsV4' test.out

#- 325 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'z9x31p1g' \
    > test.out 2>&1
eval_tap $? 325 'AdminMakeFactorMyDefaultV4' test.out

#- 326 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["Ktbd54eS", "mqxrJ3qv", "iFfRh83N"], "emailAddresses": ["6IgxaaQe", "uTw7bo4Y", "PvoXbKTM"], "isAdmin": true, "namespace": "cK2Jt2j5", "roleId": "pK9wWFIL"}' \
    > test.out 2>&1
eval_tap $? 326 'AdminInviteUserV4' test.out

#- 327 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "UioGxY4a", "policyId": "1uXgEJ2j", "policyVersionId": "lB1M29kj"}, {"isAccepted": false, "localizedPolicyVersionId": "DQmn6Tgo", "policyId": "RMSN2jyh", "policyVersionId": "NbPtpSrI"}, {"isAccepted": false, "localizedPolicyVersionId": "tQRWjRJX", "policyId": "TI0OVvag", "policyVersionId": "grxSMqbb"}], "authType": "EMAILPASSWD", "country": "0rq5Ac91", "dateOfBirth": "3Ilz3T8z", "displayName": "MrYmdfU6", "emailAddress": "rEauEdHB", "password": "CPXleO4X", "passwordMD5Sum": "rlGhhaFD", "username": "9w8NEBoH", "verified": true}' \
    > test.out 2>&1
eval_tap $? 327 'PublicCreateTestUserV4' test.out

#- 328 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "snIQLCTn", "policyId": "5eBMYk1p", "policyVersionId": "BSYCpvrl"}, {"isAccepted": true, "localizedPolicyVersionId": "Q9ZRMNND", "policyId": "5znw5KNa", "policyVersionId": "UdxG9VNr"}, {"isAccepted": true, "localizedPolicyVersionId": "IYgvW39G", "policyId": "2KEEMPmP", "policyVersionId": "MlZi4IZe"}], "authType": "EMAILPASSWD", "code": "NhWyY0HU", "country": "1R1fmioP", "dateOfBirth": "ZZFowBUm", "displayName": "g6rJydrv", "emailAddress": "teLwlWXt", "password": "Ug5TrqVu", "passwordMD5Sum": "02ahvs6A", "reachMinimumAge": false, "username": "eMPz2D3R"}' \
    > test.out 2>&1
eval_tap $? 328 'PublicCreateUserV4' test.out

#- 329 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'AtOOdEJK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "6EzPwk1C", "policyId": "IKvT2FW1", "policyVersionId": "wXQUvSwB"}, {"isAccepted": true, "localizedPolicyVersionId": "DIeRYdA4", "policyId": "Ony6Ljwn", "policyVersionId": "zJ7sWHJh"}, {"isAccepted": true, "localizedPolicyVersionId": "alBsBScg", "policyId": "Ya5wmcbb", "policyVersionId": "io3eHQiD"}], "authType": "EMAILPASSWD", "country": "AaaK4E40", "dateOfBirth": "X4Wz6nI8", "displayName": "sUiJHaXG", "password": "6usxhEvj", "reachMinimumAge": true, "username": "DyRPxciy"}' \
    > test.out 2>&1
eval_tap $? 329 'CreateUserFromInvitationV4' test.out

#- 330 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "xXO6Xv85", "country": "DgdotC87", "dateOfBirth": "SRI9MWvu", "displayName": "7tvVgpsq", "languageTag": "2guAgMp6", "userName": "f6O81f1S"}' \
    > test.out 2>&1
eval_tap $? 330 'PublicUpdateUserV4' test.out

#- 331 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "dVKWM4Fg", "emailAddress": "ZpunCMuM"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicUpdateUserEmailAddressV4' test.out

#- 332 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "VGMKz2IW", "country": "Zm3q9w69", "dateOfBirth": "x0l1Jr6p", "displayName": "UHEMamZS", "emailAddress": "Yx32a9RR", "password": "Jj5Wf1Sj", "reachMinimumAge": false, "username": "qwPERF1k", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 332 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 333 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "tasIBmjo", "password": "13Ytd4v4", "username": "WIi4yntP"}' \
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
    --code 'skFcb8bL' \
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
    --deviceToken 'ZjUBRmsh' \
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
    --code 'CK0y17Zp' \
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
    --factor 'lzPyYTEO' \
    > test.out 2>&1
eval_tap $? 347 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE