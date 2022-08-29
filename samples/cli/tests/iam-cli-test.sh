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
echo "1..314"

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
./ng net.accelbyte.sdk.cli.Main iam adminGetAgeRestrictionStatusV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 80 'AdminGetAgeRestrictionStatusV2' test.out

#- 81 AdminUpdateAgeRestrictionConfigV2
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAgeRestrictionConfigV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"AgeRestriction": 63, "Enable": false}' \
    > test.out 2>&1
eval_tap $? 81 'AdminUpdateAgeRestrictionConfigV2' test.out

#- 82 GetListCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam getListCountryAgeRestriction \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'GetListCountryAgeRestriction' test.out

#- 83 UpdateCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam updateCountryAgeRestriction \
    --countryCode 'mHzwvw2y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"AgeRestriction": 95}' \
    > test.out 2>&1
eval_tap $? 83 'UpdateCountryAgeRestriction' test.out

#- 84 AdminSearchUsersV2
./ng net.accelbyte.sdk.cli.Main iam adminSearchUsersV2 \
    --namespace "$AB_NAMESPACE" \
    --after '1fcrru8L' \
    --before 'BHtBW17h' \
    --displayName 's5mhh2mE' \
    --limit '34' \
    --loginId 'kgHk0qJJ' \
    --platformUserId 'm8rj5b6M' \
    --roleId '8p5ccMcO' \
    --userId '3L7XqW10' \
    --platformId 'KcW9Wa7H' \
    > test.out 2>&1
eval_tap $? 84 'AdminSearchUsersV2' test.out

#- 85 AdminGetUserByUserIdV2
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '65XM7NSI' \
    > test.out 2>&1
eval_tap $? 85 'AdminGetUserByUserIdV2' test.out

#- 86 AdminUpdateUserV2
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vcpRfmDy' \
    --body '{"Country": "CVaZxiLr", "DateOfBirth": "aqjusa7H", "DisplayName": "IRkOgsjx", "LanguageTag": "2j4d2jff"}' \
    > test.out 2>&1
eval_tap $? 86 'AdminUpdateUserV2' test.out

#- 87 AdminBanUserV2
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'seoGUeRn' \
    --body '{"ban": "Y8MOtSe6", "comment": "QlAXsR5x", "endDate": "qlsd8h4X", "reason": "6rMx5WB3", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 87 'AdminBanUserV2' test.out

#- 88 AdminGetUserBanV2
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RouVqvBK' \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 88 'AdminGetUserBanV2' test.out

#- 89 AdminDisableUserV2
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sGWpqXGL' \
    --body '{"Reason": "ezSgrTLy"}' \
    > test.out 2>&1
eval_tap $? 89 'AdminDisableUserV2' test.out

#- 90 AdminEnableUserV2
./ng net.accelbyte.sdk.cli.Main iam adminEnableUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '3NkJESkZ' \
    > test.out 2>&1
eval_tap $? 90 'AdminEnableUserV2' test.out

#- 91 AdminResetPasswordV2
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ieg5zvkx' \
    --body '{"LanguageTag": "rgqmpFE9", "NewPassword": "Z70MwaB0", "OldPassword": "DzghsAeO"}' \
    > test.out 2>&1
eval_tap $? 91 'AdminResetPasswordV2' test.out

#- 92 AdminDeletePlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam adminDeletePlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'b65lF7Kt' \
    --userId 'uJm7jIaR' \
    --platformNamespace 'BhC0Nmra' \
    > test.out 2>&1
eval_tap $? 92 'AdminDeletePlatformLinkV2' test.out

#- 93 AdminPutUserRolesV2
./ng net.accelbyte.sdk.cli.Main iam adminPutUserRolesV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jwipKIdU' \
    --body '["WbPv3qSu", "pplUF7E3", "VraBx5pc"]' \
    > test.out 2>&1
eval_tap $? 93 'AdminPutUserRolesV2' test.out

#- 94 AdminCreateUserRolesV2
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserRolesV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SkmxUqKN' \
    --body '["Mg2e3TzZ", "gkhb65vV", "AkPMdWMd"]' \
    > test.out 2>&1
eval_tap $? 94 'AdminCreateUserRolesV2' test.out

#- 95 PublicGetCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestriction \
    --countryCode 'aAT2hF5I' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'PublicGetCountryAgeRestriction' test.out

#- 96 PublicCreateUserV2
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"AuthType": "ZjioA5AO", "Country": "R5pC6T2P", "DisplayName": "qBNx7DqM", "LoginId": "zrPMgH3l", "Password": "fFuTSfoS", "PasswordMD5Sum": "ovZeoKrR"}' \
    > test.out 2>&1
eval_tap $? 96 'PublicCreateUserV2' test.out

#- 97 PublicForgotPasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"Context": "SnpE1Q3k", "LanguageTag": "QHo3bqCy", "LoginID": "3jB3u1Jv"}' \
    > test.out 2>&1
eval_tap $? 97 'PublicForgotPasswordV2' test.out

#- 98 PublicResetPasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicResetPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"Code": "MqZHYxzs", "LoginID": "rGn2SIZS", "NewPassword": "C5lOeyhh"}' \
    > test.out 2>&1
eval_tap $? 98 'PublicResetPasswordV2' test.out

#- 99 PublicGetUserByUserIDV2
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '5J8bR6L6' \
    > test.out 2>&1
eval_tap $? 99 'PublicGetUserByUserIDV2' test.out

#- 100 PublicUpdateUserV2
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'W8daAWbV' \
    --body '{"Country": "h8IpyPOA", "DateOfBirth": "U7AHh7TF", "DisplayName": "zX5lp15L", "LanguageTag": "Fti5dbdv"}' \
    > test.out 2>&1
eval_tap $? 100 'PublicUpdateUserV2' test.out

#- 101 PublicGetUserBan
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBan \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lc5AAs4K' \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 101 'PublicGetUserBan' test.out

#- 102 PublicUpdatePasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '44VpmDNO' \
    --body '{"LanguageTag": "MdiPoQJX", "NewPassword": "21m7Mf6U", "OldPassword": "DDuRQOD8"}' \
    > test.out 2>&1
eval_tap $? 102 'PublicUpdatePasswordV2' test.out

#- 103 GetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam getListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'h3iUJ4fA' \
    > test.out 2>&1
eval_tap $? 103 'GetListJusticePlatformAccounts' test.out

#- 104 PublicPlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2uU07hYT' \
    --userId 'JWxW0HAH' \
    --ticket '6gSQ67Fq' \
    > test.out 2>&1
eval_tap $? 104 'PublicPlatformLinkV2' test.out

#- 105 PublicDeletePlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam publicDeletePlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oyEr8IMt' \
    --userId 'qucmi7r1' \
    --platformNamespace 'YmdEshJJ' \
    > test.out 2>&1
eval_tap $? 105 'PublicDeletePlatformLinkV2' test.out

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
    --body '[{"field": "eoAz16GJ", "validation": {"allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "description": [{"language": "jSTn9iBs", "message": ["JUqCwsFB", "x1WF7vAU", "ZIktzjEb"]}, {"language": "6ZqAcxu2", "message": ["OTe3HB8e", "GcKqwLuL", "l8CiG0gx"]}, {"language": "uJ8xj1hV", "message": ["jPbnHuPB", "hUIwVQDg", "ozJ9eBvb"]}], "isCustomRegex": false, "letterCase": "vtCsR9TB", "maxLength": 47, "maxRepeatingAlphaNum": 72, "maxRepeatingSpecialCharacter": 96, "minCharType": 89, "minLength": 38, "regex": "JUSTOjxZ", "specialCharacterLocation": "u8osuNYZ", "specialCharacters": ["DsJFXN5C", "7mRnr5M3", "ZjGNjKYQ"]}}, {"field": "Xa8KgXnK", "validation": {"allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "description": [{"language": "dnYb8HXG", "message": ["9Pb9S9Y2", "VglGbj07", "m24jnSgA"]}, {"language": "ZoWOg0Gd", "message": ["8vCpOhpf", "5cMo0fC5", "0Cc3UufC"]}, {"language": "53hrg1Yz", "message": ["P9kWGMaX", "5GY7IPpK", "OxyA76Vq"]}], "isCustomRegex": true, "letterCase": "FuxqySHB", "maxLength": 96, "maxRepeatingAlphaNum": 54, "maxRepeatingSpecialCharacter": 13, "minCharType": 45, "minLength": 84, "regex": "z8DLZYSK", "specialCharacterLocation": "FFST2VbB", "specialCharacters": ["lZWypB9C", "w489fT9J", "QXRS3gec"]}}, {"field": "GArOhd5i", "validation": {"allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "description": [{"language": "oliHwpJY", "message": ["FrDyVhRo", "YRuAC8xR", "05A0bMDx"]}, {"language": "cWzewIdr", "message": ["BDSChhr3", "gWpzkiWF", "V44r1agF"]}, {"language": "Y6gPp8yl", "message": ["iiOzXutU", "2seHZnYJ", "pcRALhkQ"]}], "isCustomRegex": false, "letterCase": "EVyuBSV3", "maxLength": 39, "maxRepeatingAlphaNum": 50, "maxRepeatingSpecialCharacter": 72, "minCharType": 14, "minLength": 58, "regex": "8vX89lCX", "specialCharacterLocation": "zGqsp2r9", "specialCharacters": ["L8LmHv9d", "kdYMB392", "3LfvEAMw"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'eU2rcuch' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'wA9Ch5Zq' \
    --before 'ZMGZmJtz' \
    --limit '78' \
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
    --body '{"ageRestriction": 41, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'Ti7z69H0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 43}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType '0Ozbp5IM' \
    --limit '79' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 116 'AdminGetBannedUsersV3' test.out

#- 117 AdminGetBansTypeWithNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBansTypeWithNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 117 'AdminGetBansTypeWithNamespaceV3' test.out

#- 118 AdminGetClientsByNamespaceV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsByNamespaceV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 118 'AdminGetClientsByNamespaceV3' test.out

#- 119 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["OgApQUtY", "1qDc4xqU", "FmjGFIrY"], "baseUri": "OjVWP4im", "clientId": "ZTN1yr94", "clientName": "sXPivIXh", "clientPermissions": [{"action": 95, "resource": "aK2E8GEE", "schedAction": 38, "schedCron": "DvOc74B0", "schedRange": ["uoBHs3HN", "HaO4D83A", "HcQ9rXYx"]}, {"action": 86, "resource": "V8WRkdgx", "schedAction": 40, "schedCron": "7y1tHT33", "schedRange": ["CLg3rwF8", "50gZOYh9", "TrYPwBlP"]}, {"action": 74, "resource": "Je2GIZsn", "schedAction": 52, "schedCron": "7n3lzWMP", "schedRange": ["mwAZttU8", "miMqwCeI", "hlMmgsFh"]}], "clientPlatform": "nDsRyPjn", "deletable": false, "namespace": "vnPK7cR7", "oauthClientType": "465vUVHM", "redirectUri": "dZqafE4c", "secret": "sv9TrTOH"}' \
    > test.out 2>&1
eval_tap $? 119 'AdminCreateClientV3' test.out

#- 120 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'CP6xUuVy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 121 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'ZinIHVeM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'AdminDeleteClientV3' test.out

#- 122 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId '93QLx53B' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["AqUD1Ldw", "ZHCuiA5V", "hSu9yKE4"], "baseUri": "COdqeA8b", "clientName": "ixq18GGT", "clientPermissions": [{"action": 71, "resource": "GsVYgXXa", "schedAction": 2, "schedCron": "APg4DFS9", "schedRange": ["kk95cbek", "VaYSxHk6", "fEBzXrmZ"]}, {"action": 59, "resource": "4VvhqTQc", "schedAction": 50, "schedCron": "QJp9FTem", "schedRange": ["JoOx7NX0", "qs6p0twe", "Qjyogx7p"]}, {"action": 61, "resource": "P75RzyM3", "schedAction": 1, "schedCron": "BIam2NNY", "schedRange": ["vTfysKDi", "QUvXTxr3", "pSxGdOy9"]}], "clientPlatform": "0YjsXmtU", "deletable": false, "namespace": "N9W9Tlbk", "redirectUri": "vaNP3Rgk"}' \
    > test.out 2>&1
eval_tap $? 122 'AdminUpdateClientV3' test.out

#- 123 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'lf97Jps4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 94, "resource": "UW5XC75p"}, {"action": 95, "resource": "l350xsEu"}, {"action": 22, "resource": "aL8MLInL"}]}' \
    > test.out 2>&1
eval_tap $? 123 'AdminUpdateClientPermissionV3' test.out

#- 124 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'IBXIQaqy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 39, "resource": "qupVSRb5"}, {"action": 81, "resource": "OfigJLUd"}, {"action": 78, "resource": "mhyrTQry"}]}' \
    > test.out 2>&1
eval_tap $? 124 'AdminAddClientPermissionsV3' test.out

#- 125 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '33' \
    --clientId 'iDNM2AzW' \
    --namespace "$AB_NAMESPACE" \
    --resource '3gVja4lC' \
    > test.out 2>&1
eval_tap $? 125 'AdminDeleteClientPermissionV3' test.out

#- 126 RetrieveAllThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 126 'RetrieveAllThirdPartyLoginPlatformCredentialV3' test.out

#- 127 RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 127 'RetrieveAllActiveThirdPartyLoginPlatformCredentialV3' test.out

#- 128 RetrieveAllSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 128 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 129 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'i2Wdlary' \
    > test.out 2>&1
eval_tap $? 129 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 130 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Nij3UfjE' \
    --body '{"ACSURL": "AJibXLr7", "AWSCognitoRegion": "pQjI0jXh", "AWSCognitoUserPool": "DdTYIbaL", "AllowedClients": ["S0xN9aN9", "EEC37JEC", "GBGFxvnz"], "AppId": "EpoNDyTH", "AuthorizationEndpoint": "aa2jmhWH", "ClientId": "PtEcGWsC", "Environment": "T591mYvq", "FederationMetadataURL": "6w5MRFIV", "GenericOauthFlow": false, "IsActive": false, "Issuer": "RC0qCajS", "JWKSEndpoint": "tV9hqxJ0", "KeyID": "KwiMzLjP", "NetflixCertificates": {"encryptedPrivateKey": "5Pxx3F2M", "encryptedPrivateKeyName": "LbyqLwUC", "publicCertificate": "NAcSYdxY", "publicCertificateName": "fW6M3T7F", "rootCertificate": "I219iYmo", "rootCertificateName": "5b0uaOeV"}, "OrganizationId": "Ao2Jg4fr", "PlatformName": "CmLkMLKV", "RedirectUri": "d8oDQ3l2", "RegisteredDomains": [{"affectedClientIDs": ["pAeWfQhJ", "C5WdGaX6", "BBAO8hcy"], "domain": "8wQr33Dp", "namespaces": ["3ZMbNufo", "Hr9slDc3", "BkIHeyPE"], "roleId": "oPY6ET3H"}, {"affectedClientIDs": ["GeeABYAD", "FeAy2qQS", "7GtEHARq"], "domain": "mAarsSFM", "namespaces": ["idja3Ep3", "Mmlx49dL", "KcxtmYmy"], "roleId": "3pz5Egxp"}, {"affectedClientIDs": ["Db1u90pU", "XLj6caVl", "Ef3Cbjdu"], "domain": "ym21QqNT", "namespaces": ["WDxR2OfY", "NozZuDTP", "78THsEn2"], "roleId": "AApEdmCu"}], "Secret": "oiHOrUMv", "TeamID": "kE0N01ed", "TokenAuthenticationType": "C7Nr6qAr", "TokenClaimsMapping": {"8gN7byht": "CX6g0Ns5", "ffJo5qP0": "pJpm9YBt", "w1l4cPiA": "qNIdW1zr"}, "TokenEndpoint": "R1utVS8y"}' \
    > test.out 2>&1
eval_tap $? 130 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 131 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0OKBY57m' \
    > test.out 2>&1
eval_tap $? 131 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 132 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4bQ3Y2NH' \
    --body '{"ACSURL": "ytslOVbf", "AWSCognitoRegion": "vRTeTnge", "AWSCognitoUserPool": "V3Btdvhz", "AllowedClients": ["SvLWCGSC", "jYXrG3fa", "rbQ2PNxg"], "AppId": "eWFSgjsC", "AuthorizationEndpoint": "CU9wwwnf", "ClientId": "XuLAciag", "Environment": "NQw3NdeM", "FederationMetadataURL": "PhgBJKUS", "GenericOauthFlow": true, "IsActive": false, "Issuer": "GW1VigY8", "JWKSEndpoint": "Pmbo4aMu", "KeyID": "GQVmPjJa", "NetflixCertificates": {"encryptedPrivateKey": "JHSAJdBc", "encryptedPrivateKeyName": "jXG2d3kV", "publicCertificate": "auP0YVLy", "publicCertificateName": "AItNC6O5", "rootCertificate": "anqIpLZt", "rootCertificateName": "zcAyBKu2"}, "OrganizationId": "AgK59ocB", "PlatformName": "zMBHCgUT", "RedirectUri": "LGfhPNfc", "RegisteredDomains": [{"affectedClientIDs": ["k8Paot2F", "p8Wm195h", "xFQQkfSn"], "domain": "47Dp9PoX", "namespaces": ["yTloMYMZ", "qckzesEO", "Z749I7LG"], "roleId": "S9AiLvF9"}, {"affectedClientIDs": ["7qSC7fxr", "cLOMtlBm", "tlb7mMLs"], "domain": "clyXZSvx", "namespaces": ["NCFiWNGz", "R1TLf2zw", "M3GX8c6r"], "roleId": "XJgsTr0R"}, {"affectedClientIDs": ["ZdjMAHMa", "QtGaS6eK", "ncdsk5pL"], "domain": "7lrTPKKc", "namespaces": ["j6YPt5Sl", "42NZLXIE", "RT03RNAJ"], "roleId": "7j4ieJvf"}], "Secret": "5foQmmP8", "TeamID": "9E3EbyuP", "TokenAuthenticationType": "S1JkM3Jf", "TokenClaimsMapping": {"ZigcjnN0": "cAa1LN4V", "CrIieQJr": "PWX5qGop", "vUlTO5cX": "O5eQjtWl"}, "TokenEndpoint": "JBMsvA3q"}' \
    > test.out 2>&1
eval_tap $? 132 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 133 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OLUVU689' \
    --body '{"affectedClientIDs": ["90gABTXS", "6J1auexk", "1DveriUI"], "assignedNamespaces": ["KcsFeiAa", "W9ey42hA", "wTzAbagM"], "domain": "I2dDNZ52", "roleId": "61mWjuaj"}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 134 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mYBBQQnA' \
    --body '{"domain": "tYupjQ9U"}' \
    > test.out 2>&1
eval_tap $? 134 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 135 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'O9MBDF6N' \
    > test.out 2>&1
eval_tap $? 135 'RetrieveSSOLoginPlatformCredential' test.out

#- 136 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZZrtoZRW' \
    --body '{"acsUrl": "ikzJjC8x", "apiKey": "9LLh6x4X", "appId": "Glm9kyw1", "federationMetadataUrl": "1w8YQBzK", "isActive": false, "redirectUri": "3mVHibNP", "secret": "gF9jvQQM", "ssoUrl": "oNk4FG2s"}' \
    > test.out 2>&1
eval_tap $? 136 'AddSSOLoginPlatformCredential' test.out

#- 137 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KdGDJtUa' \
    > test.out 2>&1
eval_tap $? 137 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 138 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'haTLAArN' \
    --body '{"acsUrl": "V0N8mJcO", "apiKey": "Fhi3tyfR", "appId": "3T4IOAMb", "federationMetadataUrl": "AsFfJZ6n", "isActive": false, "redirectUri": "kRQbVaPL", "secret": "8kRbCwGv", "ssoUrl": "jJ0AvoG2"}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateSSOPlatformCredential' test.out

#- 139 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'H6Vjkbl7' \
    --platformUserId 'ulET1zBB' \
    > test.out 2>&1
eval_tap $? 139 'AdminGetUserByPlatformUserIDV3' test.out

#- 140 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'XCNGWNO3' \
    --after '42' \
    --before '41' \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 140 'GetAdminUsersByRoleIdV3' test.out

#- 141 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'fAsIYogw' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByEmailAddressV3' test.out

#- 142 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["uUo3XCEv", "bHKvVfkl", "SySt4k1F"]}' \
    > test.out 2>&1
eval_tap $? 142 'AdminListUserIDByUserIDsV3' test.out

#- 143 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["oZLUK2us", "5kB9YIHo", "bDoFGDzp"], "isAdmin": false, "roles": ["iDcfospy", "Ip9aAAA7", "04WvA1EQ"]}' \
    > test.out 2>&1
eval_tap $? 143 'AdminInviteUserV3' test.out

#- 144 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUsersV3' test.out

#- 145 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'SAHcXQd1' \
    --endDate 'zKghWf1g' \
    --limit '2' \
    --offset '95' \
    --platformBy '5u9KeSeo' \
    --platformId 'F2HAin3B' \
    --query 'W4HB73o6' \
    --startDate 'Rjtqf3KU' \
    > test.out 2>&1
eval_tap $? 145 'AdminSearchUserV3' test.out

#- 146 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["azkF8GZQ", "IsG4z5nJ", "jBRiKu8j"]}' \
    > test.out 2>&1
eval_tap $? 146 'AdminGetBulkUserByEmailAddressV3' test.out

#- 147 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TdsveA8Q' \
    > test.out 2>&1
eval_tap $? 147 'AdminGetUserByUserIdV3' test.out

#- 148 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NXwyrZx7' \
    --body '{"avatarUrl": "riqRpNQ7", "country": "PHN3EeQr", "dateOfBirth": "NlVL3qj8", "displayName": "QEtNSumd", "languageTag": "dfQBLqpS", "userName": "ET6jeYZi"}' \
    > test.out 2>&1
eval_tap $? 148 'AdminUpdateUserV3' test.out

#- 149 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ubae5Zqs' \
    --activeOnly  \
    --after 'bGEiwY9X' \
    --before '0lkX5fTz' \
    --limit '51' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserBanV3' test.out

#- 150 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GnG28F3j' \
    --body '{"ban": "sooSQMmb", "comment": "rRnkWIsp", "endDate": "W1i1gqSD", "reason": "SnEtyA3C", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 150 'AdminBanUserV3' test.out

#- 151 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'pAMRbegr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rD3MLNNU' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserBanV3' test.out

#- 152 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'r13u2FND' \
    --body '{"context": "R8sHOexR", "emailAddress": "jSR1W1Ya", "languageTag": "j9xhGn3t"}' \
    > test.out 2>&1
eval_tap $? 152 'AdminSendVerificationCodeV3' test.out

#- 153 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YL18KAjc' \
    --body '{"Code": "6S2SMtTL", "ContactType": "HkSW1M5W", "LanguageTag": "iz4yv2bX", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 153 'AdminVerifyAccountV3' test.out

#- 154 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'G5Rwoqzd' \
    > test.out 2>&1
eval_tap $? 154 'GetUserVerificationCode' test.out

#- 155 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2l9RA43r' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetUserDeletionStatusV3' test.out

#- 156 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '70bY8zgL' \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 156 'AdminUpdateUserDeletionStatusV3' test.out

#- 157 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rMK2kJXx' \
    --body '{"code": "4Vydcs4J", "country": "jyMD7piD", "dateOfBirth": "YMo0g3Vw", "displayName": "yfbxXSHt", "emailAddress": "bXxwe9vP", "password": "M9VmJCvJ", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 157 'AdminUpgradeHeadlessAccountV3' test.out

#- 158 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LOxpPAN5' \
    > test.out 2>&1
eval_tap $? 158 'AdminDeleteUserInformationV3' test.out

#- 159 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fiiFTK31' \
    --after '0.1134425045660089' \
    --before '0.20494057462835835' \
    --limit '86' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetUserLoginHistoriesV3' test.out

#- 160 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dvgLqoTn' \
    --body '{"Permissions": [{"Action": 73, "Resource": "mnpjg9Wn", "SchedAction": 41, "SchedCron": "LWuHfEkW", "SchedRange": ["yFrxg98G", "qdOTrr1k", "34lZSy7C"]}, {"Action": 33, "Resource": "hSGXrrgT", "SchedAction": 70, "SchedCron": "8kvJAcji", "SchedRange": ["xfSXY0TI", "o8cHkoFg", "mo9Ytsgb"]}, {"Action": 57, "Resource": "3fOmHjgZ", "SchedAction": 93, "SchedCron": "0OzfnwCH", "SchedRange": ["i4KN6CdQ", "yCOUZgvO", "wfeRUfHR"]}]}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpdateUserPermissionV3' test.out

#- 161 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oOrEnj3R' \
    --body '{"Permissions": [{"Action": 36, "Resource": "HiZy6I9h", "SchedAction": 36, "SchedCron": "uO5oFlRa", "SchedRange": ["9bApxrbJ", "QLrUsI6Q", "LhXpCJWm"]}, {"Action": 32, "Resource": "tl98jDBB", "SchedAction": 52, "SchedCron": "dntBKT1C", "SchedRange": ["6sapp3YS", "KNjDjvNY", "tnLg9eh5"]}, {"Action": 84, "Resource": "9irqkrJu", "SchedAction": 72, "SchedCron": "REUmYAtf", "SchedRange": ["hNHC5o0J", "PmjaDqyG", "nDfPGw7W"]}]}' \
    > test.out 2>&1
eval_tap $? 161 'AdminAddUserPermissionsV3' test.out

#- 162 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EOgSny3D' \
    --body '[{"Action": 0, "Resource": "9QzMGcaH"}, {"Action": 17, "Resource": "DxWGLfM3"}, {"Action": 40, "Resource": "GTXV7nkq"}]' \
    > test.out 2>&1
eval_tap $? 162 'AdminDeleteUserPermissionBulkV3' test.out

#- 163 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '97' \
    --namespace "$AB_NAMESPACE" \
    --resource '1u59Y3R4' \
    --userId 'T9Gkz8zo' \
    > test.out 2>&1
eval_tap $? 163 'AdminDeleteUserPermissionV3' test.out

#- 164 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wRKdJw66' \
    --after 'QbOwV133' \
    --before 'MyTixjae' \
    --limit '51' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetUserPlatformAccountsV3' test.out

#- 165 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'N5mMLzvK' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetListJusticePlatformAccounts' test.out

#- 166 AdminGetUserMapping
./ng net.accelbyte.sdk.cli.Main iam adminGetUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'z2YOhwid' \
    --userId 'A6v9rvos' \
    > test.out 2>&1
eval_tap $? 166 'AdminGetUserMapping' test.out

#- 167 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'kH4n4eEr' \
    --userId 'xiKHko7K' \
    > test.out 2>&1
eval_tap $? 167 'AdminCreateJusticeUser' test.out

#- 168 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '0vnx7OJo' \
    --body '{"platformId": "4v6xRmwZ", "platformUserId": "5HqAU8cg"}' \
    > test.out 2>&1
eval_tap $? 168 'AdminLinkPlatformAccount' test.out

#- 169 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GhwADyAP' \
    --userId 'O5nm0OHR' \
    --body '{"platformNamespace": "5dHbdZi3"}' \
    > test.out 2>&1
eval_tap $? 169 'AdminPlatformUnlinkV3' test.out

#- 170 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PWiR52uH' \
    --userId 'IxVLfPvN' \
    --ticket '2cHrlUv9' \
    > test.out 2>&1
eval_tap $? 170 'AdminPlatformLinkV3' test.out

#- 171 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'U3dh4SuT' \
    --body '["WRCGbs9O", "X4YXto6d", "qGi6G21M"]' \
    > test.out 2>&1
eval_tap $? 171 'AdminDeleteUserRolesV3' test.out

#- 172 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GE0LwMcS' \
    --body '[{"namespace": "Vdu7CqwH", "roleId": "DuOy8aGR"}, {"namespace": "TLnVlK1v", "roleId": "yTVCQavh"}, {"namespace": "CwndqSk7", "roleId": "SdX01yUr"}]' \
    > test.out 2>&1
eval_tap $? 172 'AdminSaveUserRoleV3' test.out

#- 173 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'qTOz2YQC' \
    --userId 'ofZLvqLP' \
    > test.out 2>&1
eval_tap $? 173 'AdminAddUserRoleV3' test.out

#- 174 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'YgfPz484' \
    --userId 'L3NShJUT' \
    > test.out 2>&1
eval_tap $? 174 'AdminDeleteUserRoleV3' test.out

#- 175 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oV2fkXdp' \
    --body '{"enabled": true, "reason": "3Gb0WCrg"}' \
    > test.out 2>&1
eval_tap $? 175 'AdminUpdateUserStatusV3' test.out

#- 176 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '42zi3fLO' \
    > test.out 2>&1
eval_tap $? 176 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 177 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId '0HySCo3D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "WU2QxlqM"}' \
    > test.out 2>&1
eval_tap $? 177 'AdminUpdateClientSecretV3' test.out

#- 178 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'oSZ4VwZ2' \
    --before 'f48sJHdl' \
    --isWildcard  \
    --limit '18' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetRolesV3' test.out

#- 179 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "managers": [{"displayName": "7pVNiYxM", "namespace": "NeblxeWA", "userId": "WoAhnPsb"}, {"displayName": "P0qEi4AY", "namespace": "gGjopUA0", "userId": "qm9Y3WtA"}, {"displayName": "ygFZp3aQ", "namespace": "Ad4SrriW", "userId": "FRthFa4T"}], "members": [{"displayName": "TEc3acwX", "namespace": "2mP3fhNa", "userId": "OrrJGGaH"}, {"displayName": "H6HKp2Fq", "namespace": "qUKx1Bbx", "userId": "dwYhVM1A"}, {"displayName": "6ljAIwd0", "namespace": "bB3DryOa", "userId": "fE8PNSPg"}], "permissions": [{"action": 11, "resource": "RDuKEVxU", "schedAction": 77, "schedCron": "FQvl7OOt", "schedRange": ["6qhrHQtM", "MKXPG2hx", "syi19LpW"]}, {"action": 31, "resource": "Pgi5isNO", "schedAction": 27, "schedCron": "63uitGl6", "schedRange": ["8v4apqgq", "BotgOsF7", "bDs1cmQG"]}, {"action": 90, "resource": "ps9BHoAj", "schedAction": 93, "schedCron": "pfFgrtSt", "schedRange": ["ma6Vrd0h", "I7W2Up2m", "CEV80c0B"]}], "roleName": "Ya8nRkk7"}' \
    > test.out 2>&1
eval_tap $? 179 'AdminCreateRoleV3' test.out

#- 180 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId '0ozRBWK6' \
    > test.out 2>&1
eval_tap $? 180 'AdminGetRoleV3' test.out

#- 181 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'TwdGykJE' \
    > test.out 2>&1
eval_tap $? 181 'AdminDeleteRoleV3' test.out

#- 182 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'J1xJT6CW' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "8XT8Zqyk"}' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateRoleV3' test.out

#- 183 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'BmmmD6V5' \
    > test.out 2>&1
eval_tap $? 183 'AdminGetRoleAdminStatusV3' test.out

#- 184 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId '7V7AhKFH' \
    > test.out 2>&1
eval_tap $? 184 'AdminUpdateAdminRoleStatusV3' test.out

#- 185 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'ZLohLBkv' \
    > test.out 2>&1
eval_tap $? 185 'AdminRemoveRoleAdminV3' test.out

#- 186 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'agjlbHhn' \
    --after 'v8zkPTV1' \
    --before 'ism63gU2' \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 186 'AdminGetRoleManagersV3' test.out

#- 187 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'CkoPVlb9' \
    --body '{"managers": [{"displayName": "OJcaGKSV", "namespace": "PqKnmo4M", "userId": "FvHd4WrO"}, {"displayName": "YTr9YxNt", "namespace": "HPZgba53", "userId": "RrKYdJQw"}, {"displayName": "sNroEdX6", "namespace": "18NAD33T", "userId": "GQRQGNO7"}]}' \
    > test.out 2>&1
eval_tap $? 187 'AdminAddRoleManagersV3' test.out

#- 188 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId '5BF2b4hp' \
    --body '{"managers": [{"displayName": "VhBa3BS5", "namespace": "OyMxeBXN", "userId": "m35mtYky"}, {"displayName": "uDWe6J4P", "namespace": "nwMYFvZs", "userId": "bx6CE66b"}, {"displayName": "PGWaAWHp", "namespace": "NLpmqIMR", "userId": "K4esFJ6O"}]}' \
    > test.out 2>&1
eval_tap $? 188 'AdminRemoveRoleManagersV3' test.out

#- 189 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'pwrW9ZJA' \
    --after 'OvifZOOx' \
    --before 'Y9zrmb5g' \
    --limit '32' \
    > test.out 2>&1
eval_tap $? 189 'AdminGetRoleMembersV3' test.out

#- 190 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'Nk6QCdlE' \
    --body '{"members": [{"displayName": "daAwM3Ss", "namespace": "IRPdASPE", "userId": "U3oV1dwX"}, {"displayName": "HAlnRuXz", "namespace": "vTzJRuMF", "userId": "5JbOhDLp"}, {"displayName": "M5JmwOng", "namespace": "JrO8n0zc", "userId": "9SiPHPtn"}]}' \
    > test.out 2>&1
eval_tap $? 190 'AdminAddRoleMembersV3' test.out

#- 191 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'Kx6D5edC' \
    --body '{"members": [{"displayName": "0PK09gu0", "namespace": "3IHNgh6a", "userId": "dSBExCxZ"}, {"displayName": "oqudSxxh", "namespace": "JWr3tF9J", "userId": "6edcB9t8"}, {"displayName": "TtSO9RfG", "namespace": "fyviKVYC", "userId": "0WSlanNO"}]}' \
    > test.out 2>&1
eval_tap $? 191 'AdminRemoveRoleMembersV3' test.out

#- 192 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'P6CGG2pA' \
    --body '{"permissions": [{"action": 28, "resource": "kzYJO6bm", "schedAction": 90, "schedCron": "qtZ7igAi", "schedRange": ["cl9PiVmz", "FlYUe03B", "Bw8fVyXx"]}, {"action": 74, "resource": "IlOvAkWH", "schedAction": 100, "schedCron": "ht7j3tBd", "schedRange": ["2Y4zj3tt", "UxsStRni", "d0tUSTRH"]}, {"action": 58, "resource": "swoi9WtE", "schedAction": 98, "schedCron": "x5hELD9Y", "schedRange": ["I1ISAmkj", "8j696ObM", "Tddxpzev"]}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminUpdateRolePermissionsV3' test.out

#- 193 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'kvxnR2L6' \
    --body '{"permissions": [{"action": 46, "resource": "W5YWqvsQ", "schedAction": 92, "schedCron": "PaMk2bHP", "schedRange": ["F0TWMZ1m", "p8NMYQwX", "I3L1lNDt"]}, {"action": 9, "resource": "MnHfcANR", "schedAction": 7, "schedCron": "h0AgbxBB", "schedRange": ["uMpsIVYB", "2e23hwL4", "CU6MFVS5"]}, {"action": 79, "resource": "Rs2rXNMp", "schedAction": 19, "schedCron": "aabYMF68", "schedRange": ["4B6FCooL", "XkuyC54Y", "xJxLh33n"]}]}' \
    > test.out 2>&1
eval_tap $? 193 'AdminAddRolePermissionsV3' test.out

#- 194 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId '7ZCbrBCP' \
    --body '["KFRQQTVa", "5G1SPsNG", "Xse8qyDl"]' \
    > test.out 2>&1
eval_tap $? 194 'AdminDeleteRolePermissionsV3' test.out

#- 195 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '75' \
    --resource 'ZZczxJJn' \
    --roleId '61yVwnfd' \
    > test.out 2>&1
eval_tap $? 195 'AdminDeleteRolePermissionV3' test.out

#- 196 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 196 'AdminGetMyUserV3' test.out

#- 197 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'qCIPr5q3' \
    --extendExp  \
    --redirectUri 'Xtv1CJkO' \
    --password 'G8BxD1zf' \
    --requestId '9ZQuT6Cf' \
    --userName 'GG8cJvAZ' \
    > test.out 2>&1
eval_tap $? 197 'UserAuthenticationV3' test.out

#- 198 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'AjAwhcxs' \
    --linkingToken 'wkfCTfVi' \
    --password 'UR9oZlyQ' \
    --username 'uX1d1uNZ' \
    > test.out 2>&1
eval_tap $? 198 'AuthenticationWithPlatformLinkV3' test.out

#- 199 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'OvFl2vo9' \
    > test.out 2>&1
eval_tap $? 199 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 200 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 200 'GetCountryLocationV3' test.out

#- 201 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 201 'Logout' test.out

#- 202 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1IsEkf5c' \
    --userId 'xgPcoQMX' \
    > test.out 2>&1
eval_tap $? 202 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 203 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UUPs6lxd' \
    > test.out 2>&1
eval_tap $? 203 'RevokeUserV3' test.out

#- 204 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'uzqzVX8O' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --redirectUri 'kGlMs6rm' \
    --scope 'saYHgbbF' \
    --state 'OmSw1ERf' \
    --targetAuthPage '0XWBSBD5' \
    --clientId 'XXTa1zGZ' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 204 'AuthorizeV3' test.out

#- 205 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'BuYHP6uC' \
    > test.out 2>&1
eval_tap $? 205 'TokenIntrospectionV3' test.out

#- 206 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 206 'GetJWKSV3' test.out

#- 207 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor '1UMjBWVE' \
    --mfaToken '7FISGtSD' \
    > test.out 2>&1
eval_tap $? 207 'Change2faMethod' test.out

#- 208 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'ZWkx3NBL' \
    --factor '16qfODz6' \
    --mfaToken 'YntYLVgb' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 208 'Verify2faCode' test.out

#- 209 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SocHw8ZF' \
    --userId 'Kt41SZ1N' \
    > test.out 2>&1
eval_tap $? 209 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 210 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'Acez5gH4' \
    --clientId 'GpUykOYf' \
    --redirectUri 'cdDcuJvP' \
    --requestId 'TIbXyDUK' \
    > test.out 2>&1
eval_tap $? 210 'AuthCodeRequestV3' test.out

#- 211 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'duVzI9rW' \
    --clientId 'jVvi9fxt' \
    --createHeadless  \
    --deviceId 'CbCoOBT7' \
    --platformToken 'HuIiPR7U' \
    > test.out 2>&1
eval_tap $? 211 'PlatformTokenGrantV3' test.out

#- 212 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 212 'GetRevocationListV3' test.out

#- 213 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token '8kHg7gaq' \
    > test.out 2>&1
eval_tap $? 213 'TokenRevocationV3' test.out

#- 214 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'AsmBUh9E' \
    --code 'yqLK2gOc' \
    --codeVerifier 'QRLCeGeB' \
    --extendExp  \
    --password 'kqphJ16j' \
    --redirectUri 'tmfXSgne' \
    --refreshToken 'bVuKWoRs' \
    --username '1RlVLybw' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 214 'TokenGrantV3' test.out

#- 215 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'i6KGABwr' \
    > test.out 2>&1
eval_tap $? 215 'VerifyTokenV3' test.out

#- 216 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'q8EmbhjI' \
    --code 'FQ9adqSw' \
    --error 'oONJa0VP' \
    --openidAssocHandle 'C0nwXAbV' \
    --openidClaimedId 'ovQhDgso' \
    --openidIdentity 'QdUJUang' \
    --openidMode 'mkcTrjlN' \
    --openidNs '1m5n216f' \
    --openidOpEndpoint 'Oa3e2C83' \
    --openidResponseNonce 'H6MyOjLd' \
    --openidReturnTo 'AdiDyw30' \
    --openidSig 'Igt3fa1x' \
    --openidSigned 'v23vnMuv' \
    --state 'K8C1Kwal' \
    > test.out 2>&1
eval_tap $? 216 'PlatformAuthenticationV3' test.out

#- 217 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'S0HpRPLz' \
    > test.out 2>&1
eval_tap $? 217 'PublicGetInputValidations' test.out

#- 218 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 218 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 219 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId '3BDDJS3l' \
    > test.out 2>&1
eval_tap $? 219 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 220 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'y0IlP7aF' \
    --body '{"platformUserIds": ["LyUf5D2F", "OY0SITki", "NElAoM6o"]}' \
    > test.out 2>&1
eval_tap $? 220 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 221 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BnRv8ZD6' \
    --platformUserId 'DLV6bLpv' \
    > test.out 2>&1
eval_tap $? 221 'PublicGetUserByPlatformUserIDV3' test.out

#- 222 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'RFmM32xq' \
    > test.out 2>&1
eval_tap $? 222 'PublicGetAsyncStatus' test.out

#- 223 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '8kdDYCj3' \
    --limit '83' \
    --offset '47' \
    --query 'zvrNauKj' \
    > test.out 2>&1
eval_tap $? 223 'PublicSearchUserV3' test.out

#- 224 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "O0oqauDW", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "aCM0i0RW", "policyId": "mJAzAKCP", "policyVersionId": "ReSdbcmE"}, {"isAccepted": true, "localizedPolicyVersionId": "ZlHvHIhn", "policyId": "n4tb5xzU", "policyVersionId": "wPKeRWI2"}, {"isAccepted": true, "localizedPolicyVersionId": "mUihOAsI", "policyId": "R1kc38FK", "policyVersionId": "AJq1Nboe"}], "authType": "XcdkQ0fC", "code": "GQLc94bn", "country": "yMb6CY25", "dateOfBirth": "PrzHigGC", "displayName": "OAOOt6lV", "emailAddress": "eXmMYGyN", "password": "TP00s9Bm", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 224 'PublicCreateUserV3' test.out

#- 225 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'YErB8HWa' \
    --query 'G5s3CrcE' \
    > test.out 2>&1
eval_tap $? 225 'CheckUserAvailability' test.out

#- 226 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["FhBdmBil", "8RdKCbjw", "HIxz4b3u"]}' \
    > test.out 2>&1
eval_tap $? 226 'PublicBulkGetUsers' test.out

#- 227 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "6hxlPgyy", "languageTag": "KLMvGUAj"}' \
    > test.out 2>&1
eval_tap $? 227 'PublicSendRegistrationCode' test.out

#- 228 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "IYiq96T3", "emailAddress": "ntcHyd3O"}' \
    > test.out 2>&1
eval_tap $? 228 'PublicVerifyRegistrationCode' test.out

#- 229 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "ZhkiDvGR", "languageTag": "nE5wHFtM"}' \
    > test.out 2>&1
eval_tap $? 229 'PublicForgotPasswordV3' test.out

#- 230 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'WdOabISR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 230 'GetAdminInvitationV3' test.out

#- 231 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'aNenRI4T' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "7s6uXzBL", "policyId": "qM6R1XAh", "policyVersionId": "nKTBj3ni"}, {"isAccepted": false, "localizedPolicyVersionId": "tjoHSlr4", "policyId": "ky6UUpsN", "policyVersionId": "A8mNxoeE"}, {"isAccepted": false, "localizedPolicyVersionId": "QxdnFIhK", "policyId": "EzXfrPXM", "policyVersionId": "W40EabeC"}], "authType": "EMAILPASSWD", "country": "7uQYHVgh", "dateOfBirth": "QSfrsVlx", "displayName": "wxyprYr2", "password": "0EiTKJSM", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 231 'CreateUserFromInvitationV3' test.out

#- 232 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "uOQxAtlr", "country": "K9U64QGT", "dateOfBirth": "sNFRbSDz", "displayName": "SFum8QLA", "languageTag": "aHWYdj5o", "userName": "1qLumCJY"}' \
    > test.out 2>&1
eval_tap $? 232 'UpdateUserV3' test.out

#- 233 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "h9zvhxrs", "country": "2v5Z2PN9", "dateOfBirth": "mzqwIJkb", "displayName": "xHJwKB8u", "languageTag": "sakxeKhI", "userName": "9edFOAZj"}' \
    > test.out 2>&1
eval_tap $? 233 'PublicPartialUpdateUserV3' test.out

#- 234 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "5UWH81fY", "emailAddress": "rj3gFacv", "languageTag": "furihhYq"}' \
    > test.out 2>&1
eval_tap $? 234 'PublicSendVerificationCodeV3' test.out

#- 235 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "y0hKKCmP", "contactType": "1aTIouRl", "languageTag": "8DEiUKtY", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 235 'PublicUserVerificationV3' test.out

#- 236 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "QsgKRvYb", "country": "KbzKiSRj", "dateOfBirth": "92y5RapQ", "displayName": "feuGWh9D", "emailAddress": "Uy9FRwrY", "password": "Ro81Vc8r", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 236 'PublicUpgradeHeadlessAccountV3' test.out

#- 237 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "qS1I0CAU", "password": "smywimRR"}' \
    > test.out 2>&1
eval_tap $? 237 'PublicVerifyHeadlessAccountV3' test.out

#- 238 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "b8GoYuqP", "newPassword": "u9ijzChs", "oldPassword": "0TCnGsCA"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicUpdatePasswordV3' test.out

#- 239 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '35YCtNvd' \
    > test.out 2>&1
eval_tap $? 239 'PublicCreateJusticeUser' test.out

#- 240 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'v3NIKXEl' \
    --redirectUri 'gVjfh0vu' \
    --ticket 'iHyYajbL' \
    > test.out 2>&1
eval_tap $? 240 'PublicPlatformLinkV3' test.out

#- 241 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YPWOwGgg' \
    --body '{"platformNamespace": "22Cc8bFP"}' \
    > test.out 2>&1
eval_tap $? 241 'PublicPlatformUnlinkV3' test.out

#- 242 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'phQ6qda2' \
    > test.out 2>&1
eval_tap $? 242 'PublicPlatformUnlinkAllV3' test.out

#- 243 PublicForcePlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicForcePlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZKoXzfkP' \
    --ticket 'Nix965Gd' \
    > test.out 2>&1
eval_tap $? 243 'PublicForcePlatformLinkV3' test.out

#- 244 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'nd7Ue6ra' \
    --clientId '04p6O8kZ' \
    --redirectUri 'LViOccOk' \
    > test.out 2>&1
eval_tap $? 244 'PublicWebLinkPlatform' test.out

#- 245 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'VYJIATg3' \
    --state '4zAq3s9O' \
    > test.out 2>&1
eval_tap $? 245 'PublicWebLinkPlatformEstablish' test.out

#- 246 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "bei47AzQ", "emailAddress": "kuvVP68f", "newPassword": "w5lOvdJS"}' \
    > test.out 2>&1
eval_tap $? 246 'ResetPasswordV3' test.out

#- 247 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IDCrFvA6' \
    > test.out 2>&1
eval_tap $? 247 'PublicGetUserByUserIdV3' test.out

#- 248 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RncBm9m5' \
    --activeOnly  \
    --after 'UOSpQwLP' \
    --before 'fLMMuqSY' \
    --limit '49' \
    > test.out 2>&1
eval_tap $? 248 'PublicGetUserBanHistoryV3' test.out

#- 249 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rWGeyQc4' \
    > test.out 2>&1
eval_tap $? 249 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 250 PublicGetUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pmsHN584' \
    > test.out 2>&1
eval_tap $? 250 'PublicGetUserInformationV3' test.out

#- 251 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jb5xqifG' \
    --after '0.21346599571530345' \
    --before '0.6390140024120333' \
    --limit '31' \
    > test.out 2>&1
eval_tap $? 251 'PublicGetUserLoginHistoriesV3' test.out

#- 252 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'n87gwysb' \
    --after 'sqfIBoqC' \
    --before 'k81biyIA' \
    --limit '22' \
    > test.out 2>&1
eval_tap $? 252 'PublicGetUserPlatformAccountsV3' test.out

#- 253 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'UeWKgdDu' \
    --body '{"platformId": "VU8rcRMT", "platformUserId": "h5EdONbL"}' \
    > test.out 2>&1
eval_tap $? 253 'PublicLinkPlatformAccount' test.out

#- 254 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'tVwDo9FX' \
    --body '{"chosenNamespaces": ["sG4ikbrA", "BgicSgLZ", "T7eHpUN4"], "requestId": "zLkRBy5v"}' \
    > test.out 2>&1
eval_tap $? 254 'PublicForceLinkPlatformWithProgression' test.out

#- 255 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'o2Lnt1y7' \
    > test.out 2>&1
eval_tap $? 255 'PublicGetPublisherUserV3' test.out

#- 256 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '18nx8WxN' \
    --password 'hpE6pp5p' \
    > test.out 2>&1
eval_tap $? 256 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 257 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'DCaAar5l' \
    --before 'T1PfWpKN' \
    --isWildcard  \
    --limit '61' \
    > test.out 2>&1
eval_tap $? 257 'PublicGetRolesV3' test.out

#- 258 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'LQXDsgnU' \
    > test.out 2>&1
eval_tap $? 258 'PublicGetRoleV3' test.out

#- 259 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 259 'PublicGetMyUserV3' test.out

#- 260 PublicSendVerificationLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationLinkV3 \
    --body '{"languageTag": "wPytwlJA"}' \
    > test.out 2>&1
eval_tap $? 260 'PublicSendVerificationLinkV3' test.out

#- 261 PublicVerifyUserByLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyUserByLinkV3 \
    --code 'Ny0yBcZ6' \
    > test.out 2>&1
eval_tap $? 261 'PublicVerifyUserByLinkV3' test.out

#- 262 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'RV05YYNj' \
    --code 'AfPd6grw' \
    --error 'F5kbeyXu' \
    --state 'SLjaswKR' \
    > test.out 2>&1
eval_tap $? 262 'PlatformAuthenticateSAMLV3Handler' test.out

#- 263 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'PdGd1Rg7' \
    --payload 'KVHfxnfL' \
    > test.out 2>&1
eval_tap $? 263 'LoginSSOClient' test.out

#- 264 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'plGXdPLB' \
    > test.out 2>&1
eval_tap $? 264 'LogoutSSOClient' test.out

#- 265 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 52}' \
    > test.out 2>&1
eval_tap $? 265 'AdminCreateTestUsersV4' test.out

#- 266 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["AtUB2I03", "HmOcRgZ1", "uULMwGL4"]}' \
    > test.out 2>&1
eval_tap $? 266 'AdminBulkCheckValidUserIDV4' test.out

#- 267 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'voQWEY1Y' \
    --body '{"avatarUrl": "1IN1gWsk", "country": "450yk9zF", "dateOfBirth": "XC8hjL4r", "displayName": "BAHm2CN4", "languageTag": "H5umIC0w", "userName": "zmC0tFCC"}' \
    > test.out 2>&1
eval_tap $? 267 'AdminUpdateUserV4' test.out

#- 268 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gdwXQNcE' \
    --body '{"code": "wjyPPRZI", "emailAddress": "ruCrIkXU"}' \
    > test.out 2>&1
eval_tap $? 268 'AdminUpdateUserEmailAddressV4' test.out

#- 269 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BJcSPkZq' \
    > test.out 2>&1
eval_tap $? 269 'AdminDisableUserMFAV4' test.out

#- 270 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uRQdIFN5' \
    > test.out 2>&1
eval_tap $? 270 'AdminListUserRolesV4' test.out

#- 271 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WNhrHg47' \
    --body '{"assignedNamespaces": ["s8ncN9sG", "EKGoHyCP", "dXI88Lg1"], "roleId": "joxcZ4lz"}' \
    > test.out 2>&1
eval_tap $? 271 'AdminUpdateUserRoleV4' test.out

#- 272 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dJl1N0Z2' \
    --body '{"assignedNamespaces": ["YCzHQDeB", "DhevMyrT", "6dQmrYI9"], "roleId": "L8S5doOR"}' \
    > test.out 2>&1
eval_tap $? 272 'AdminAddUserRoleV4' test.out

#- 273 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sU8G5ahX' \
    --body '{"assignedNamespaces": ["B5u3emOb", "VzlvVkly", "LrqAN7ut"], "roleId": "RGRs3Xwh"}' \
    > test.out 2>&1
eval_tap $? 273 'AdminRemoveUserRoleV4' test.out

#- 274 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '17' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 274 'AdminGetRolesV4' test.out

#- 275 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "lRPHMpoQ"}' \
    > test.out 2>&1
eval_tap $? 275 'AdminCreateRoleV4' test.out

#- 276 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'Vx3Sjd4D' \
    > test.out 2>&1
eval_tap $? 276 'AdminGetRoleV4' test.out

#- 277 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'FPd0UeZn' \
    > test.out 2>&1
eval_tap $? 277 'AdminDeleteRoleV4' test.out

#- 278 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'F7voR7WI' \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "roleName": "FUWd7zQW"}' \
    > test.out 2>&1
eval_tap $? 278 'AdminUpdateRoleV4' test.out

#- 279 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'dbQQQtOf' \
    --body '{"permissions": [{"action": 51, "resource": "bWTZdI1t", "schedAction": 20, "schedCron": "IOTh6Yzb", "schedRange": ["YvRe7JNn", "ZeoORRtB", "QjZjU3BB"]}, {"action": 88, "resource": "Y3zyWNsK", "schedAction": 1, "schedCron": "KLBvpPhx", "schedRange": ["30ZxtV15", "TDCmUniL", "miTjqh1Z"]}, {"action": 91, "resource": "yHGWGsqu", "schedAction": 80, "schedCron": "D89vONXy", "schedRange": ["Nz7szMhu", "IO9XwXvo", "FvAxZHYP"]}]}' \
    > test.out 2>&1
eval_tap $? 279 'AdminUpdateRolePermissionsV4' test.out

#- 280 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId '1XKprqOb' \
    --body '{"permissions": [{"action": 97, "resource": "bcQeKZkQ", "schedAction": 57, "schedCron": "KxEQCr0A", "schedRange": ["CrFEo86x", "L3ScCLey", "MrovVlT1"]}, {"action": 72, "resource": "pJQuUr5L", "schedAction": 53, "schedCron": "BvhNDU6k", "schedRange": ["uXsbk8he", "cON9T36s", "quuw01S0"]}, {"action": 1, "resource": "H9LoxXNG", "schedAction": 74, "schedCron": "dPx8mxpR", "schedRange": ["pWd2PKnv", "KL5tZrRX", "QETRWzzH"]}]}' \
    > test.out 2>&1
eval_tap $? 280 'AdminAddRolePermissionsV4' test.out

#- 281 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'LyqBqcq3' \
    --body '["TLmBVZe1", "BHWkcSZc", "oux5AoKq"]' \
    > test.out 2>&1
eval_tap $? 281 'AdminDeleteRolePermissionsV4' test.out

#- 282 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId '1fH0LlDs' \
    --after 'mJFF1evT' \
    --before 'pg12UMiV' \
    --limit '43' \
    > test.out 2>&1
eval_tap $? 282 'AdminListAssignedUsersV4' test.out

#- 283 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'gMwVm3x2' \
    --body '{"assignedNamespaces": ["EtZuj7xD", "dulEoRX8", "Ch0FHXsS"], "namespace": "nA4te02v", "userId": "Xpe0sUKa"}' \
    > test.out 2>&1
eval_tap $? 283 'AdminAssignUserToRoleV4' test.out

#- 284 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'CobOHw8a' \
    --body '{"namespace": "sTEh3F3R", "userId": "nrTDwrQt"}' \
    > test.out 2>&1
eval_tap $? 284 'AdminRevokeUserFromRoleV4' test.out

#- 285 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "j3NtJWfo", "country": "h1gYXPC5", "dateOfBirth": "IIOrtiMK", "displayName": "usG3zhIL", "languageTag": "5vge2GKg", "userName": "JH5yFDf2"}' \
    > test.out 2>&1
eval_tap $? 285 'AdminUpdateMyUserV4' test.out

#- 286 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 286 'AdminDisableMyAuthenticatorV4' test.out

#- 287 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '3rCqRuQA' \
    > test.out 2>&1
eval_tap $? 287 'AdminEnableMyAuthenticatorV4' test.out

#- 288 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 288 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 289 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 289 'AdminGetMyBackupCodesV4' test.out

#- 290 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 290 'AdminGenerateMyBackupCodesV4' test.out

#- 291 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 291 'AdminDisableMyBackupCodesV4' test.out

#- 292 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 292 'AdminDownloadMyBackupCodesV4' test.out

#- 293 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 293 'AdminEnableMyBackupCodesV4' test.out

#- 294 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 294 'AdminGetMyEnabledFactorsV4' test.out

#- 295 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'EaY9evOi' \
    > test.out 2>&1
eval_tap $? 295 'AdminMakeFactorMyDefaultV4' test.out

#- 296 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["7wFXp9y0", "KIEmxiCh", "aBjNguQf"], "emailAddresses": ["L54PYLqU", "CifUBuNS", "yYsdslZH"], "isAdmin": true, "roleId": "HV6mWMCR"}' \
    > test.out 2>&1
eval_tap $? 296 'AdminInviteUserV4' test.out

#- 297 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "PieoUL2g", "policyId": "w7R866MT", "policyVersionId": "0HJUDf7Z"}, {"isAccepted": false, "localizedPolicyVersionId": "wXz3jPS8", "policyId": "ZWiJSVT5", "policyVersionId": "PM1jgM5o"}, {"isAccepted": false, "localizedPolicyVersionId": "PgzpdBS0", "policyId": "0J1yX7TT", "policyVersionId": "LUnInZS3"}], "authType": "EMAILPASSWD", "country": "oYUg6U7x", "dateOfBirth": "zi207oh5", "displayName": "aZfU57Oi", "emailAddress": "aJyf43kn", "password": "Dqmg6le4", "passwordMD5Sum": "fKf14UW3", "username": "KLgkMW42", "verified": true}' \
    > test.out 2>&1
eval_tap $? 297 'PublicCreateTestUserV4' test.out

#- 298 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "pTk6BbQI", "policyId": "k2gKcpSj", "policyVersionId": "OVxRFeis"}, {"isAccepted": true, "localizedPolicyVersionId": "abPo7QW5", "policyId": "XbEoc0bD", "policyVersionId": "MpFSk99C"}, {"isAccepted": true, "localizedPolicyVersionId": "GvLKViFF", "policyId": "xY3Xd69y", "policyVersionId": "sTcSwCxS"}], "authType": "EMAILPASSWD", "code": "IGlQSxJy", "country": "eKcvB3C0", "dateOfBirth": "T47zjdpo", "displayName": "xpNyaRFn", "emailAddress": "r4zNKHg4", "password": "GKRsotJD", "passwordMD5Sum": "yAfI99MD", "reachMinimumAge": false, "username": "oRmq9UvN"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicCreateUserV4' test.out

#- 299 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'pwcJ5QY4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "A7zQZyw7", "policyId": "qahdm6V0", "policyVersionId": "k1hWejr5"}, {"isAccepted": true, "localizedPolicyVersionId": "3gDmCFf5", "policyId": "48b9tSM6", "policyVersionId": "YG18sQ4Q"}, {"isAccepted": true, "localizedPolicyVersionId": "gz1DUYR2", "policyId": "IFSNkkDd", "policyVersionId": "kk1hhEed"}], "authType": "EMAILPASSWD", "country": "fQ2yUPNe", "dateOfBirth": "aalAXj2L", "displayName": "K7GEvE3T", "password": "NSXc4Jvd", "reachMinimumAge": false, "username": "mMkwkQzL"}' \
    > test.out 2>&1
eval_tap $? 299 'CreateUserFromInvitationV4' test.out

#- 300 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "JszKzzgi", "country": "39rPXEDD", "dateOfBirth": "0BJN9BTJ", "displayName": "6Ujh8DR4", "languageTag": "f7xjk1ek", "userName": "8d0bSKuN"}' \
    > test.out 2>&1
eval_tap $? 300 'PublicUpdateUserV4' test.out

#- 301 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "KeDOdJjO", "emailAddress": "E1OWHNlA"}' \
    > test.out 2>&1
eval_tap $? 301 'PublicUpdateUserEmailAddressV4' test.out

#- 302 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "mwOyOcBt", "country": "QxMTBxOt", "dateOfBirth": "NgCNcYqE", "displayName": "7E3pYLLo", "emailAddress": "bK6uP0tj", "password": "GJkyFOke", "reachMinimumAge": false, "username": "pXb2xHoD", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 302 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 303 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "L4hPVLV8", "password": "V1vBpIpG", "username": "e3tpZcEy"}' \
    > test.out 2>&1
eval_tap $? 303 'PublicUpgradeHeadlessAccountV4' test.out

#- 304 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 304 'PublicDisableMyAuthenticatorV4' test.out

#- 305 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'heUnexeX' \
    > test.out 2>&1
eval_tap $? 305 'PublicEnableMyAuthenticatorV4' test.out

#- 306 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 306 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 307 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 307 'PublicGetMyBackupCodesV4' test.out

#- 308 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 308 'PublicGenerateMyBackupCodesV4' test.out

#- 309 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 309 'PublicDisableMyBackupCodesV4' test.out

#- 310 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 310 'PublicDownloadMyBackupCodesV4' test.out

#- 311 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 311 'PublicEnableMyBackupCodesV4' test.out

#- 312 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'TemGQUrP' \
    > test.out 2>&1
eval_tap $? 312 'PublicRemoveTrustedDeviceV4' test.out

#- 313 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 313 'PublicGetMyEnabledFactorsV4' test.out

#- 314 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'PiIvk5tL' \
    > test.out 2>&1
eval_tap $? 314 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE