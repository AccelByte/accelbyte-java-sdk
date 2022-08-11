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
echo "1..309"

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
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleID \
    --namespace "$AB_NAMESPACE" \
    --after '26' \
    --before '11' \
    --limit '24' \
    --roleId 'muyKXkII' \
    > test.out 2>&1
eval_tap $? 17 'GetAdminUsersByRoleID' test.out

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
./ng net.accelbyte.sdk.cli.Main iam getUserInformation \
    --namespace "$AB_NAMESPACE" \
    --userId 'xc7FAIej' \
    > test.out 2>&1
eval_tap $? 34 'GetUserInformation' test.out

#- 35 DeleteUserInformation
eval_tap 0 35 'DeleteUserInformation # SKIP deprecated' test.out

#- 36 GetUserLoginHistories
./ng net.accelbyte.sdk.cli.Main iam getUserLoginHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'bdf8Gz46' \
    --after '0.34139271193133114' \
    --before '0.7682288737424855' \
    --limit '83' \
    > test.out 2>&1
eval_tap $? 36 'GetUserLoginHistories' test.out

#- 37 UpdatePassword
eval_tap 0 37 'UpdatePassword # SKIP deprecated' test.out

#- 38 SaveUserPermission
eval_tap 0 38 'SaveUserPermission # SKIP deprecated' test.out

#- 39 AddUserPermission
eval_tap 0 39 'AddUserPermission # SKIP deprecated' test.out

#- 40 DeleteUserPermission
eval_tap 0 40 'DeleteUserPermission # SKIP deprecated' test.out

#- 41 GetUserPlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam getUserPlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'myjxrzj0' \
    > test.out 2>&1
eval_tap $? 41 'GetUserPlatformAccounts' test.out

#- 42 GetUserMapping
./ng net.accelbyte.sdk.cli.Main iam getUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'lkcex8Dz' \
    --userId 'OxIWgPFy' \
    > test.out 2>&1
eval_tap $? 42 'GetUserMapping' test.out

#- 43 GetUserJusticePlatformAccount
eval_tap 0 43 'GetUserJusticePlatformAccount # SKIP deprecated' test.out

#- 44 PlatformLink
./ng net.accelbyte.sdk.cli.Main iam platformLink \
    --namespace "$AB_NAMESPACE" \
    --platformId '5TDcPXBc' \
    --userId '0OYoG5nt' \
    --ticket '0lho0JKE' \
    > test.out 2>&1
eval_tap $? 44 'PlatformLink' test.out

#- 45 PlatformUnlink
./ng net.accelbyte.sdk.cli.Main iam platformUnlink \
    --namespace "$AB_NAMESPACE" \
    --platformId '0fWrpWL8' \
    --userId 'oqjj3axE' \
    --platformNamespace 'Ns7QwopE' \
    > test.out 2>&1
eval_tap $? 45 'PlatformUnlink' test.out

#- 46 GetPublisherUser
eval_tap 0 46 'GetPublisherUser # SKIP deprecated' test.out

#- 47 SaveUserRoles
eval_tap 0 47 'SaveUserRoles # SKIP deprecated' test.out

#- 48 AddUserRole
eval_tap 0 48 'AddUserRole # SKIP deprecated' test.out

#- 49 DeleteUserRole
eval_tap 0 49 'DeleteUserRole # SKIP deprecated' test.out

#- 50 UpgradeHeadlessAccount
./ng net.accelbyte.sdk.cli.Main iam upgradeHeadlessAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'w15lhdVO' \
    --body '{"LoginID": "rA6Iiruy", "Password": "i26KmTqB"}' \
    > test.out 2>&1
eval_tap $? 50 'UpgradeHeadlessAccount' test.out

#- 51 UpgradeHeadlessAccountWithVerificationCode
./ng net.accelbyte.sdk.cli.Main iam upgradeHeadlessAccountWithVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId '6XzrOxNU' \
    --body '{"Code": "Vd79TVXs", "Password": "86f7vn9l", "loginId": "DOSlXmeC"}' \
    > test.out 2>&1
eval_tap $? 51 'UpgradeHeadlessAccountWithVerificationCode' test.out

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
    --body '{"AgeRestriction": 1, "Enable": false}' \
    > test.out 2>&1
eval_tap $? 81 'AdminUpdateAgeRestrictionConfigV2' test.out

#- 82 GetListCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam getListCountryAgeRestriction \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'GetListCountryAgeRestriction' test.out

#- 83 UpdateCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam updateCountryAgeRestriction \
    --countryCode 'hdIEFwJI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"AgeRestriction": 85}' \
    > test.out 2>&1
eval_tap $? 83 'UpdateCountryAgeRestriction' test.out

#- 84 AdminSearchUsersV2
./ng net.accelbyte.sdk.cli.Main iam adminSearchUsersV2 \
    --namespace "$AB_NAMESPACE" \
    --after 'ecuVgEog' \
    --before 'lPes7pdc' \
    --displayName 'G6tizVIk' \
    --limit '22' \
    --loginId 'JrrJiVpR' \
    --platformUserId 'Dj2hcjIT' \
    --roleId 'P4Fs3glz' \
    --userId 'o6JeB2vS' \
    --platformId 'v7SpVeUc' \
    > test.out 2>&1
eval_tap $? 84 'AdminSearchUsersV2' test.out

#- 85 AdminGetUserByUserIdV2
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '72rmRXZE' \
    > test.out 2>&1
eval_tap $? 85 'AdminGetUserByUserIdV2' test.out

#- 86 AdminUpdateUserV2
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YIipySwd' \
    --body '{"Country": "mhRFLK1U", "DateOfBirth": "Vpf7BETl", "DisplayName": "Nv1qOPxl", "LanguageTag": "z6PF5MtN"}' \
    > test.out 2>&1
eval_tap $? 86 'AdminUpdateUserV2' test.out

#- 87 AdminBanUserV2
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'imVsPwrh' \
    --body '{"ban": "suyEmuBj", "comment": "Nrc0CfRr", "endDate": "Q9HBzFk8", "reason": "bSRBBV0K", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 87 'AdminBanUserV2' test.out

#- 88 AdminGetUserBanV2
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XIeTeezn' \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 88 'AdminGetUserBanV2' test.out

#- 89 AdminDisableUserV2
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '1UBbS9OE' \
    --body '{"Reason": "YcTjN1No"}' \
    > test.out 2>&1
eval_tap $? 89 'AdminDisableUserV2' test.out

#- 90 AdminEnableUserV2
./ng net.accelbyte.sdk.cli.Main iam adminEnableUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HYODGMM5' \
    > test.out 2>&1
eval_tap $? 90 'AdminEnableUserV2' test.out

#- 91 AdminResetPasswordV2
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '9A7gE8b8' \
    --body '{"LanguageTag": "vnP68Xty", "NewPassword": "hUsp1g3m", "OldPassword": "Yf5Pw4Kq"}' \
    > test.out 2>&1
eval_tap $? 91 'AdminResetPasswordV2' test.out

#- 92 AdminDeletePlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam adminDeletePlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OOvRYkmc' \
    --userId 'eKR42k1G' \
    --platformNamespace '4wnJ02sf' \
    > test.out 2>&1
eval_tap $? 92 'AdminDeletePlatformLinkV2' test.out

#- 93 AdminPutUserRolesV2
./ng net.accelbyte.sdk.cli.Main iam adminPutUserRolesV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Oe3OBtHN' \
    --body '["SSe1QZ2x", "YOIfB5OI", "5fCoJrO7"]' \
    > test.out 2>&1
eval_tap $? 93 'AdminPutUserRolesV2' test.out

#- 94 AdminCreateUserRolesV2
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserRolesV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '8R5CxxTP' \
    --body '["DVTS80sk", "hB4bBR4G", "umLiLqzr"]' \
    > test.out 2>&1
eval_tap $? 94 'AdminCreateUserRolesV2' test.out

#- 95 PublicGetCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestriction \
    --countryCode '3RAzCzNK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'PublicGetCountryAgeRestriction' test.out

#- 96 PublicCreateUserV2
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"AuthType": "2XeXTuy7", "Country": "yOGmQ5SB", "DisplayName": "KBX9MTrt", "LoginId": "Hu0BYDFC", "Password": "gssX8D8c", "PasswordMD5Sum": "WC1XguyZ"}' \
    > test.out 2>&1
eval_tap $? 96 'PublicCreateUserV2' test.out

#- 97 PublicForgotPasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"Context": "l65IyIdU", "LanguageTag": "oVbq7pZ5", "LoginID": "CDKs79Cv"}' \
    > test.out 2>&1
eval_tap $? 97 'PublicForgotPasswordV2' test.out

#- 98 PublicResetPasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicResetPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"Code": "n23tktMH", "LoginID": "xsy9hira", "NewPassword": "YgB1Su73"}' \
    > test.out 2>&1
eval_tap $? 98 'PublicResetPasswordV2' test.out

#- 99 PublicGetUserByUserIDV2
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xU0Vat6l' \
    > test.out 2>&1
eval_tap $? 99 'PublicGetUserByUserIDV2' test.out

#- 100 PublicUpdateUserV2
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fJbkYrZJ' \
    --body '{"Country": "cGYviaAF", "DateOfBirth": "0EBaqFgn", "DisplayName": "YNnHMJ2y", "LanguageTag": "INfDxSnB"}' \
    > test.out 2>&1
eval_tap $? 100 'PublicUpdateUserV2' test.out

#- 101 PublicGetUserBan
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBan \
    --namespace "$AB_NAMESPACE" \
    --userId '1gyDEuAK' \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 101 'PublicGetUserBan' test.out

#- 102 PublicUpdatePasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KJzOMkcn' \
    --body '{"LanguageTag": "PU9e33k6", "NewPassword": "NwDzCwwe", "OldPassword": "amaFfOgi"}' \
    > test.out 2>&1
eval_tap $? 102 'PublicUpdatePasswordV2' test.out

#- 103 GetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam getListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'txYqtoXS' \
    > test.out 2>&1
eval_tap $? 103 'GetListJusticePlatformAccounts' test.out

#- 104 PublicPlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'l27B6HZQ' \
    --userId '60Zl5nJ4' \
    --ticket 'SwubE7Qg' \
    > test.out 2>&1
eval_tap $? 104 'PublicPlatformLinkV2' test.out

#- 105 PublicDeletePlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam publicDeletePlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tolngor4' \
    --userId '9nFs21Pr' \
    --platformNamespace 'qi9AYubg' \
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
    --body '[{"field": "srejufAY", "validation": {"allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "description": [{"language": "bMsFAU7Y", "message": ["P28EWc3a", "jNcI7s6x", "FEu2sDDL"]}, {"language": "Q8FTwNrS", "message": ["dKTUQDKj", "DRUFJzm3", "IXu8laLv"]}, {"language": "AppViai0", "message": ["ZEjr4QXB", "b4p9EjQZ", "njZqFHtV"]}], "isCustomRegex": true, "letterCase": "TwctfJVK", "maxLength": 50, "maxRepeatingAlphaNum": 44, "maxRepeatingSpecialCharacter": 13, "minCharType": 92, "minLength": 63, "regex": "wefcA2KZ", "specialCharacterLocation": "mimtfk2v", "specialCharacters": ["7xZ2DKVL", "btKcUdrO", "nrppBh2V"]}}, {"field": "P09DL2Tb", "validation": {"allowDigit": true, "allowLetter": false, "allowSpace": false, "allowUnicode": false, "description": [{"language": "8m3CF4C1", "message": ["yWXGHG8I", "1aeBv2Vq", "e14lz36b"]}, {"language": "aRCZAATu", "message": ["WhU9w3Tu", "hr2GSaEG", "uEJnLSdf"]}, {"language": "PgkiSbrR", "message": ["KVAlCJEI", "6kXo24QH", "VIb4UVoS"]}], "isCustomRegex": true, "letterCase": "hM3R323a", "maxLength": 49, "maxRepeatingAlphaNum": 85, "maxRepeatingSpecialCharacter": 25, "minCharType": 7, "minLength": 11, "regex": "TXecf6za", "specialCharacterLocation": "HHpueAoi", "specialCharacters": ["nRL7iJw1", "JDVhFQHu", "c9IYC5zo"]}}, {"field": "H93viwxY", "validation": {"allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "description": [{"language": "6coTe5eT", "message": ["AnCM7v2b", "7EPZTDKd", "pQYiBsF7"]}, {"language": "inEEq7NW", "message": ["lqiYUS8J", "WRtfgj6G", "q5Bq69s4"]}, {"language": "1t7rA63S", "message": ["L1aLi1PM", "YxgZRtes", "ZxnJmy3O"]}], "isCustomRegex": false, "letterCase": "uW7aRIiZ", "maxLength": 46, "maxRepeatingAlphaNum": 63, "maxRepeatingSpecialCharacter": 4, "minCharType": 97, "minLength": 89, "regex": "JV5fgjB2", "specialCharacterLocation": "kAjBVROy", "specialCharacters": ["kYmh0uIO", "M9bQE9hZ", "IZBJphO1"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'fHZU6Fv3' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'zGlDAna3' \
    --before '5IES8SaY' \
    --limit '95' \
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
    --body '{"ageRestriction": 13, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'O6hYjzut' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 23}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'rAkHXTdI' \
    --limit '19' \
    --offset '0' \
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
    --limit '12' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 118 'AdminGetClientsByNamespaceV3' test.out

#- 119 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["Ok34V0zS", "n2PCBglA", "TTw209k4"], "baseUri": "0UemKfpW", "clientId": "9cl6AfNG", "clientName": "w4Z729gT", "clientPermissions": [{"action": 35, "resource": "tGe7WV5A", "schedAction": 60, "schedCron": "tPhciHkd", "schedRange": ["27Sal9EM", "6rvFmbjd", "MTYs4GHL"]}, {"action": 7, "resource": "SEBsv7Nt", "schedAction": 2, "schedCron": "35Uu15Lc", "schedRange": ["isd8G9KB", "NtSJs47Q", "KoOMSWgz"]}, {"action": 52, "resource": "BGOoIsOw", "schedAction": 57, "schedCron": "vVPDsLpU", "schedRange": ["lF71yiSu", "PcKLfvtH", "cDw3T8sS"]}], "clientPlatform": "93LaHpVa", "deletable": true, "namespace": "fAUQOwlf", "oauthClientType": "EwjeWeCs", "redirectUri": "9mDs4OBG", "secret": "MQRzLleg"}' \
    > test.out 2>&1
eval_tap $? 119 'AdminCreateClientV3' test.out

#- 120 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId '5HyENKL4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 121 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId '3XE2TKBr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'AdminDeleteClientV3' test.out

#- 122 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'DCFTQyuP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["qFo18g0o", "eMOm94Gu", "5jv0fdNh"], "baseUri": "7nzs2rEG", "clientName": "qY87qjLg", "clientPermissions": [{"action": 26, "resource": "39dpjSPU", "schedAction": 14, "schedCron": "LEfPMUli", "schedRange": ["VN7lFOjb", "ygKYNPiA", "2jdq3pBH"]}, {"action": 38, "resource": "9Sv1hwMc", "schedAction": 58, "schedCron": "Rf8MdX16", "schedRange": ["ca2XsLfp", "RfwbOveC", "b8EjWdvR"]}, {"action": 13, "resource": "QArXCHqW", "schedAction": 12, "schedCron": "6Vjc1Qer", "schedRange": ["6tifFznD", "V9xG8gCg", "rBPTwKd0"]}], "clientPlatform": "ekBiFbMA", "deletable": false, "namespace": "uzqdsHVy", "redirectUri": "QGRlyJY5"}' \
    > test.out 2>&1
eval_tap $? 122 'AdminUpdateClientV3' test.out

#- 123 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'HM1BChVu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 3, "resource": "iodzNguD"}, {"action": 28, "resource": "5JcA6eZ4"}, {"action": 85, "resource": "yUqDI5hZ"}]}' \
    > test.out 2>&1
eval_tap $? 123 'AdminUpdateClientPermissionV3' test.out

#- 124 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'WxFqP3qt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 26, "resource": "Ww88aIdq"}, {"action": 0, "resource": "dONyX5Y0"}, {"action": 34, "resource": "NXJhnzqd"}]}' \
    > test.out 2>&1
eval_tap $? 124 'AdminAddClientPermissionsV3' test.out

#- 125 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '43' \
    --clientId 'Ji1f81dL' \
    --namespace "$AB_NAMESPACE" \
    --resource 'eHZxOSxl' \
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
    --limit '33' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 128 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 129 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Fqx4LJus' \
    > test.out 2>&1
eval_tap $? 129 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 130 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wuQEgk2q' \
    --body '{"ACSURL": "U3k8bFcw", "AWSCognitoRegion": "zwiFanar", "AWSCognitoUserPool": "yJOKxI7e", "AllowedClients": ["hzb6gUMh", "lYAdEzYT", "inrgfNIj"], "AppId": "W63EUMS5", "AuthorizationEndpoint": "LPU3IukW", "ClientId": "U29yGhZU", "Environment": "XsDEXwkk", "FederationMetadataURL": "Gj0x3r27", "GenericOauthFlow": false, "IsActive": true, "Issuer": "g7A9YDoM", "JWKSEndpoint": "dqzYsL0H", "KeyID": "7JERwise", "NetflixCertificates": {"encryptedPrivateKey": "naWhmDS9", "encryptedPrivateKeyName": "1YWAOwnk", "publicCertificate": "eRxZ4tdc", "publicCertificateName": "ymdIsO5b", "rootCertificate": "7jHAojPu", "rootCertificateName": "aZGsXaF2"}, "OrganizationId": "H8CzU7U6", "PlatformName": "JSuD4MKB", "RedirectUri": "1x1zJwAx", "RegisteredDomains": [{"affectedClientIDs": ["inUb1XA9", "Q6gbvw2w", "JCzxo4KP"], "domain": "GYetik1w", "namespaces": ["jiznljaW", "YelDtOyN", "z6NaMotv"], "roleId": "5MnJSqPs"}, {"affectedClientIDs": ["4rqOUiZS", "64wwK1yu", "rm4trIZA"], "domain": "kSCwzRrS", "namespaces": ["JCBb9tGP", "ioU702pP", "vB7Bt7DI"], "roleId": "IKcYWZHI"}, {"affectedClientIDs": ["TtyzOH00", "caVyIACg", "IE5LPYpF"], "domain": "OvEQCXOt", "namespaces": ["PlK240Ha", "95rRu1pJ", "BQ6Gm2qT"], "roleId": "1fwaneQU"}], "Secret": "XR27JUwx", "TeamID": "nIbHyNCR", "TokenAuthenticationType": "KpZHcr2f", "TokenClaimsMapping": {"VU0pyoGr": "Pumhme2r", "fKqLWAYs": "S0mGsTi9", "oB3eCcOa": "J6gxUCWf"}, "TokenEndpoint": "GeVyxJnF"}' \
    > test.out 2>&1
eval_tap $? 130 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 131 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5JDQbeSc' \
    > test.out 2>&1
eval_tap $? 131 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 132 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CPaq4etR' \
    --body '{"ACSURL": "moHOgC3q", "AWSCognitoRegion": "Upa1A1Sp", "AWSCognitoUserPool": "sH0xvXNw", "AllowedClients": ["uwsV46fH", "uZtCRxmf", "tjLUuY4p"], "AppId": "cMPP6o51", "AuthorizationEndpoint": "8snvagk3", "ClientId": "FA866lur", "Environment": "WuM1CGF0", "FederationMetadataURL": "WjsGyNYx", "GenericOauthFlow": false, "IsActive": true, "Issuer": "Okswxnmk", "JWKSEndpoint": "34P6v8NT", "KeyID": "aZWXyap0", "NetflixCertificates": {"encryptedPrivateKey": "NS8Q2iu2", "encryptedPrivateKeyName": "ohUgU8FP", "publicCertificate": "JeQPKsF4", "publicCertificateName": "0Rwd72E0", "rootCertificate": "Zv2C3dyp", "rootCertificateName": "n9Kh3WQp"}, "OrganizationId": "NTgsjdoG", "PlatformName": "Z98Ka8vC", "RedirectUri": "MKf4af2F", "RegisteredDomains": [{"affectedClientIDs": ["akkQ7n0X", "KSqkBWUS", "UVlAfXdP"], "domain": "SJT5psDI", "namespaces": ["wwTpeoDB", "HIhjYp2k", "Pu9DSG72"], "roleId": "e1QkoyOX"}, {"affectedClientIDs": ["6AqihULY", "88tRc621", "pIAZeOYp"], "domain": "84Y8wQai", "namespaces": ["7R6WjRh6", "5oHpsoEv", "fQWmtltx"], "roleId": "fIOe9ZUp"}, {"affectedClientIDs": ["3SlvUvdF", "2ZdYoi0Z", "8sLmFH9M"], "domain": "HaWWNYuH", "namespaces": ["B78EXgA2", "VOPjIxEX", "RaeE3zNT"], "roleId": "5v1TrqZu"}], "Secret": "DalUvBDV", "TeamID": "1KIQ9t2y", "TokenAuthenticationType": "sDKbymWE", "TokenClaimsMapping": {"zLYAQ30g": "oRnoeAV4", "p9z9hwaY": "mhEVccAW", "sYcrZYnF": "WcCPDr3e"}, "TokenEndpoint": "b6oT4yLA"}' \
    > test.out 2>&1
eval_tap $? 132 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 133 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '7gj0XB06' \
    --body '{"affectedClientIDs": ["oo9hg0RP", "HZ6qvITk", "YjBgPjKj"], "assignedNamespaces": ["w7BMX8cX", "sq6Dpleo", "MSdsB915"], "domain": "Mxfg1s05", "roleId": "BnO4UIve"}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 134 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WKgU9CWa' \
    --body '{"domain": "EqCNyI2f"}' \
    > test.out 2>&1
eval_tap $? 134 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 135 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wjWyui1V' \
    > test.out 2>&1
eval_tap $? 135 'RetrieveSSOLoginPlatformCredential' test.out

#- 136 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yDMV98JG' \
    --body '{"acsUrl": "XQ441tOi", "apiKey": "QtOH2Bmj", "appId": "Q592yqmZ", "federationMetadataUrl": "yn5n6qxX", "isActive": true, "redirectUri": "Sbjgz6W5", "secret": "atgH2A0z", "ssoUrl": "9WorucIK"}' \
    > test.out 2>&1
eval_tap $? 136 'AddSSOLoginPlatformCredential' test.out

#- 137 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TO0Albz6' \
    > test.out 2>&1
eval_tap $? 137 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 138 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '5csDuECs' \
    --body '{"acsUrl": "YTD40sCL", "apiKey": "hZfjjh6X", "appId": "prC3YD1W", "federationMetadataUrl": "6Grqzpyt", "isActive": true, "redirectUri": "kiSwKRSk", "secret": "gj3sJYWA", "ssoUrl": "7rj0Oj3z"}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateSSOPlatformCredential' test.out

#- 139 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'SsSOqUkW' \
    --platformUserId 'KhcEqH1t' \
    > test.out 2>&1
eval_tap $? 139 'AdminGetUserByPlatformUserIDV3' test.out

#- 140 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'ETWBDJgq' \
    --after '32' \
    --before '0' \
    --limit '32' \
    > test.out 2>&1
eval_tap $? 140 'GetAdminUsersByRoleIdV3' test.out

#- 141 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress '3pGHXg5z' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByEmailAddressV3' test.out

#- 142 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["5xQP7exL", "geiaAYmw", "qr3JIU5r"]}' \
    > test.out 2>&1
eval_tap $? 142 'AdminListUserIDByUserIDsV3' test.out

#- 143 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["7ocZYApg", "r2QCqn9b", "Sv0E8Saz"], "isAdmin": true, "roles": ["lvS4bihT", "KcFHdSEp", "i4rg3Zyh"]}' \
    > test.out 2>&1
eval_tap $? 143 'AdminInviteUserV3' test.out

#- 144 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUsersV3' test.out

#- 145 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'o2AlV3U8' \
    --endDate 'u7E671vL' \
    --limit '12' \
    --offset '73' \
    --platformBy 'Epv2Prys' \
    --platformId 'HjWuD7mr' \
    --query 'bu4SW15p' \
    --startDate '1P1pKsna' \
    > test.out 2>&1
eval_tap $? 145 'AdminSearchUserV3' test.out

#- 146 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["gDXdjrMy", "Kli60OHl", "gLJGxuY4"]}' \
    > test.out 2>&1
eval_tap $? 146 'AdminGetBulkUserByEmailAddressV3' test.out

#- 147 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KG7m77O2' \
    > test.out 2>&1
eval_tap $? 147 'AdminGetUserByUserIdV3' test.out

#- 148 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gt7bk6sV' \
    --body '{"avatarUrl": "Sz3aRiJl", "country": "pojBEV0T", "dateOfBirth": "aI19dPx9", "displayName": "BsiW8w8N", "languageTag": "ZKHtKlEc", "userName": "QlXsIqOX"}' \
    > test.out 2>&1
eval_tap $? 148 'AdminUpdateUserV3' test.out

#- 149 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7Kk4E7Dw' \
    --activeOnly  \
    --after 'KJRfl8RS' \
    --before 'VcrpV7f1' \
    --limit '83' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserBanV3' test.out

#- 150 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z9kBKEcH' \
    --body '{"ban": "5bCqpScr", "comment": "bWLufkKt", "endDate": "3WmYAQ26", "reason": "jihTMgwx", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 150 'AdminBanUserV3' test.out

#- 151 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId '3E4iPp7c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vKl9buye' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserBanV3' test.out

#- 152 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bmwdg1wf' \
    --body '{"context": "cCHVutGd", "emailAddress": "CPcgIZ4T", "languageTag": "mJE6EDx1"}' \
    > test.out 2>&1
eval_tap $? 152 'AdminSendVerificationCodeV3' test.out

#- 153 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0o7XQMIz' \
    --body '{"Code": "0i42pZtX", "ContactType": "pfbXFWLS", "LanguageTag": "6owQcUmN", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 153 'AdminVerifyAccountV3' test.out

#- 154 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'JaVc8IZB' \
    > test.out 2>&1
eval_tap $? 154 'GetUserVerificationCode' test.out

#- 155 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rEtXNgqJ' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetUserDeletionStatusV3' test.out

#- 156 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RLC91phL' \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 156 'AdminUpdateUserDeletionStatusV3' test.out

#- 157 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'auQCh49m' \
    --body '{"code": "k6lXBYbP", "country": "ZWmaouqF", "dateOfBirth": "ewfrlXYQ", "displayName": "7Z0smGqW", "emailAddress": "qTKPvMAU", "password": "OC905Xe6", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 157 'AdminUpgradeHeadlessAccountV3' test.out

#- 158 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IG15FhMi' \
    > test.out 2>&1
eval_tap $? 158 'AdminDeleteUserInformationV3' test.out

#- 159 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'so0RM9un' \
    --after '0.851342108836537' \
    --before '0.7310110238899649' \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetUserLoginHistoriesV3' test.out

#- 160 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0cRNJlit' \
    --body '{"Permissions": [{"Action": 20, "Resource": "aST0gHX1", "SchedAction": 37, "SchedCron": "Q2vn68Nz", "SchedRange": ["6E8LHnPG", "GezBt0mT", "ty0Zb1zC"]}, {"Action": 43, "Resource": "7xLuszEo", "SchedAction": 61, "SchedCron": "AsKnOq61", "SchedRange": ["pYJ0fHty", "f0uIKY25", "2TQlrULG"]}, {"Action": 94, "Resource": "sK9Mbo7l", "SchedAction": 90, "SchedCron": "F5xK5daz", "SchedRange": ["kHx4hZgj", "McRihVor", "7RmNdgQC"]}]}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpdateUserPermissionV3' test.out

#- 161 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'g5XaW45y' \
    --body '{"Permissions": [{"Action": 29, "Resource": "0DfLHs8n", "SchedAction": 64, "SchedCron": "k6jMIZGS", "SchedRange": ["vBsJELCn", "TVTl1stR", "VqSv7Y5i"]}, {"Action": 7, "Resource": "bXvNNv5L", "SchedAction": 9, "SchedCron": "ytKLjwoP", "SchedRange": ["UjMXXJts", "Ot6Rhjdj", "Fm0IvG2j"]}, {"Action": 32, "Resource": "wFjfrsgV", "SchedAction": 87, "SchedCron": "rnf0oo6V", "SchedRange": ["ZTZw6PxF", "nfB46XUZ", "Wek9Jezk"]}]}' \
    > test.out 2>&1
eval_tap $? 161 'AdminAddUserPermissionsV3' test.out

#- 162 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xg7Nq9xo' \
    --body '[{"Action": 15, "Resource": "9veD87Jq"}, {"Action": 25, "Resource": "5OlvBqDb"}, {"Action": 44, "Resource": "xhXBePEu"}]' \
    > test.out 2>&1
eval_tap $? 162 'AdminDeleteUserPermissionBulkV3' test.out

#- 163 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '77' \
    --namespace "$AB_NAMESPACE" \
    --resource 'wduzeN8q' \
    --userId 'bPXHmAK5' \
    > test.out 2>&1
eval_tap $? 163 'AdminDeleteUserPermissionV3' test.out

#- 164 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uScgJbhN' \
    --after 'oH5wU4t9' \
    --before '59KTQC3I' \
    --limit '2' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetUserPlatformAccountsV3' test.out

#- 165 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'MfLSAiu5' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetListJusticePlatformAccounts' test.out

#- 166 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'MbSlZRNu' \
    --userId 'nliWyxl8' \
    > test.out 2>&1
eval_tap $? 166 'AdminCreateJusticeUser' test.out

#- 167 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'mGa6866a' \
    --body '{"platformId": "9MQg0sYk", "platformUserId": "bcfmJSim"}' \
    > test.out 2>&1
eval_tap $? 167 'AdminLinkPlatformAccount' test.out

#- 168 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '5VGQGiEp' \
    --userId 'duwaedrL' \
    --body '{"platformNamespace": "qNyrNtWY"}' \
    > test.out 2>&1
eval_tap $? 168 'AdminPlatformUnlinkV3' test.out

#- 169 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WvsSpHhz' \
    --userId 'aWX7ZTsF' \
    --ticket 'jbgn4aYd' \
    > test.out 2>&1
eval_tap $? 169 'AdminPlatformLinkV3' test.out

#- 170 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ifUXwcvp' \
    --body '["QPYPx13M", "86VAO74j", "oufxSeZT"]' \
    > test.out 2>&1
eval_tap $? 170 'AdminDeleteUserRolesV3' test.out

#- 171 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pkgl9bWB' \
    --body '[{"namespace": "9lT9WKcB", "roleId": "oqdL4OV8"}, {"namespace": "ZobSlPXo", "roleId": "KIqIzU9x"}, {"namespace": "ph2ohFab", "roleId": "z6HWHes4"}]' \
    > test.out 2>&1
eval_tap $? 171 'AdminSaveUserRoleV3' test.out

#- 172 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'AGJbgI6H' \
    --userId 'Uah6ttXL' \
    > test.out 2>&1
eval_tap $? 172 'AdminAddUserRoleV3' test.out

#- 173 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'hIs7yseu' \
    --userId 'eLmytCIk' \
    > test.out 2>&1
eval_tap $? 173 'AdminDeleteUserRoleV3' test.out

#- 174 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pjEhSC2Z' \
    --body '{"enabled": true, "reason": "wgH9cLQh"}' \
    > test.out 2>&1
eval_tap $? 174 'AdminUpdateUserStatusV3' test.out

#- 175 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'd1kR8BWu' \
    > test.out 2>&1
eval_tap $? 175 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 176 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'U3uQ8wvI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "CGVKDiwI"}' \
    > test.out 2>&1
eval_tap $? 176 'AdminUpdateClientSecretV3' test.out

#- 177 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'rlYCBtkf' \
    --before 'YVBK2j7k' \
    --isWildcard  \
    --limit '15' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetRolesV3' test.out

#- 178 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "managers": [{"displayName": "0QcwHCGe", "namespace": "fWZZ8pb6", "userId": "9Be47pvr"}, {"displayName": "NmZZAcIZ", "namespace": "rRUvNs2f", "userId": "iDZEkNoO"}, {"displayName": "Asts6Bl0", "namespace": "xj8eahAg", "userId": "ndu03SJP"}], "members": [{"displayName": "IjsW5ESm", "namespace": "XeSuJBMv", "userId": "RPQ5zt1x"}, {"displayName": "sM0R6Nrl", "namespace": "Al9QWRhz", "userId": "v4veDbJY"}, {"displayName": "bJvrvHLN", "namespace": "vD6pmXro", "userId": "Ivvo9QQq"}], "permissions": [{"action": 35, "resource": "rFBXQTkZ", "schedAction": 87, "schedCron": "kmJ0Bel0", "schedRange": ["HgcXRMN5", "YfTYdRzb", "aK2bQGO9"]}, {"action": 53, "resource": "mCqX3Otv", "schedAction": 30, "schedCron": "PXkz2REX", "schedRange": ["5lHcoYv1", "vHn5qIx4", "9kKorQ7q"]}, {"action": 28, "resource": "rWCterJ7", "schedAction": 89, "schedCron": "DwFmiu8p", "schedRange": ["aIEOPpLR", "HfeoAAtA", "QCWzF9EO"]}], "roleName": "POpQUoPX"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminCreateRoleV3' test.out

#- 179 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'P0vinsGH' \
    > test.out 2>&1
eval_tap $? 179 'AdminGetRoleV3' test.out

#- 180 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'Lpj0nkc6' \
    > test.out 2>&1
eval_tap $? 180 'AdminDeleteRoleV3' test.out

#- 181 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'Hx7ym5S7' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "gRYaQ77F"}' \
    > test.out 2>&1
eval_tap $? 181 'AdminUpdateRoleV3' test.out

#- 182 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'GF0okJhQ' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetRoleAdminStatusV3' test.out

#- 183 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'DRmlOh3n' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateAdminRoleStatusV3' test.out

#- 184 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'KP5FwR04' \
    > test.out 2>&1
eval_tap $? 184 'AdminRemoveRoleAdminV3' test.out

#- 185 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'xIIhJBCl' \
    --after 'hlzcyCmx' \
    --before 'eJWtwjh0' \
    --limit '55' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleManagersV3' test.out

#- 186 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'DQe4S1U2' \
    --body '{"managers": [{"displayName": "Pj0kIzKW", "namespace": "rnkJJDPK", "userId": "Rjm13BsK"}, {"displayName": "RvlLOEVs", "namespace": "fGiYFmCA", "userId": "xSHKXN2h"}, {"displayName": "5FzELBoa", "namespace": "tBizbXeP", "userId": "8F8tcO4I"}]}' \
    > test.out 2>&1
eval_tap $? 186 'AdminAddRoleManagersV3' test.out

#- 187 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'OmUa4i2N' \
    --body '{"managers": [{"displayName": "IhY1nZz1", "namespace": "jBPXBRLM", "userId": "yWhUof7J"}, {"displayName": "k8EDROiZ", "namespace": "zFcTPJzP", "userId": "W64oxIQj"}, {"displayName": "RTUhsxmv", "namespace": "RBtZSTCb", "userId": "piM2xe74"}]}' \
    > test.out 2>&1
eval_tap $? 187 'AdminRemoveRoleManagersV3' test.out

#- 188 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'V1cqvmAD' \
    --after '8RJtZnxh' \
    --before 'BIoYmSKq' \
    --limit '97' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleMembersV3' test.out

#- 189 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'kvqdXM31' \
    --body '{"members": [{"displayName": "w7HzXSpu", "namespace": "JH4gIxRU", "userId": "rAP4IeN0"}, {"displayName": "zELti2tJ", "namespace": "7bJc8a03", "userId": "8ZF8ZTdw"}, {"displayName": "gwHqD1Zu", "namespace": "IgskLUOR", "userId": "7tlKerS3"}]}' \
    > test.out 2>&1
eval_tap $? 189 'AdminAddRoleMembersV3' test.out

#- 190 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'kcJ1lraW' \
    --body '{"members": [{"displayName": "PPvmdUVx", "namespace": "jiVWfDKH", "userId": "pMZ4xBr2"}, {"displayName": "1Hu6iMbY", "namespace": "spGDHLq1", "userId": "jdRR5t7a"}, {"displayName": "q3S1GaoF", "namespace": "dmDbTUIe", "userId": "tN3jI5IW"}]}' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleMembersV3' test.out

#- 191 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'LxPxfbWP' \
    --body '{"permissions": [{"action": 73, "resource": "q27xZPmW", "schedAction": 31, "schedCron": "RKLWxyvn", "schedRange": ["RhWtsYun", "KZdFklFL", "QJ4FLoaJ"]}, {"action": 62, "resource": "GF1KVvyK", "schedAction": 79, "schedCron": "GvzX9UnE", "schedRange": ["1dMoyfpR", "6zpmqdG6", "WWtZdeo3"]}, {"action": 33, "resource": "exULjFsC", "schedAction": 27, "schedCron": "HkkWqssT", "schedRange": ["y1roz5IC", "uMjAWGbn", "PL4fqwhl"]}]}' \
    > test.out 2>&1
eval_tap $? 191 'AdminUpdateRolePermissionsV3' test.out

#- 192 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'NBaAYERm' \
    --body '{"permissions": [{"action": 51, "resource": "VhNJQYyX", "schedAction": 45, "schedCron": "gIjAZLVe", "schedRange": ["dmeBHAsH", "TlqcUcv9", "XQIkb6cW"]}, {"action": 30, "resource": "7nvIdvof", "schedAction": 45, "schedCron": "j2dTElwQ", "schedRange": ["WjMf59Wp", "lPqwnNWk", "ld8gbdr3"]}, {"action": 71, "resource": "ml9dLA2g", "schedAction": 51, "schedCron": "UGwNoZrL", "schedRange": ["R35cf1Dd", "PemKqJh3", "FtC19sNy"]}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRolePermissionsV3' test.out

#- 193 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'WgsAt7Z3' \
    --body '["8JqvB3n4", "UvF5gU4E", "euNakxPK"]' \
    > test.out 2>&1
eval_tap $? 193 'AdminDeleteRolePermissionsV3' test.out

#- 194 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '0' \
    --resource 'ieIyhB1U' \
    --roleId 'nIe7X3EU' \
    > test.out 2>&1
eval_tap $? 194 'AdminDeleteRolePermissionV3' test.out

#- 195 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 195 'AdminGetMyUserV3' test.out

#- 196 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'KC8Fstms' \
    --extendExp  \
    --redirectUri 'N7fXJW0c' \
    --password '5EGcRCbl' \
    --requestId 'o2MDY4Dp' \
    --userName 'HglFMDfH' \
    > test.out 2>&1
eval_tap $? 196 'UserAuthenticationV3' test.out

#- 197 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'RBgxcjf9' \
    --linkingToken 'cQkAUbjJ' \
    --password '9NBRtf2b' \
    --username '1s4f9oZW' \
    > test.out 2>&1
eval_tap $? 197 'AuthenticationWithPlatformLinkV3' test.out

#- 198 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'fXA7CIaN' \
    > test.out 2>&1
eval_tap $? 198 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 199 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 199 'GetCountryLocationV3' test.out

#- 200 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 200 'Logout' test.out

#- 201 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'TEgnT5Sy' \
    --userId 'Iyfb0zJk' \
    > test.out 2>&1
eval_tap $? 201 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 202 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'x3aP7V0k' \
    > test.out 2>&1
eval_tap $? 202 'RevokeUserV3' test.out

#- 203 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'tPeKW5IE' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --redirectUri 'PjQO3FnJ' \
    --scope '9AswWgNO' \
    --state 'zbFprgJT' \
    --targetAuthPage '5qnHB22O' \
    --clientId 'b7gCd8RA' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 203 'AuthorizeV3' test.out

#- 204 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'YwIjqPKe' \
    > test.out 2>&1
eval_tap $? 204 'TokenIntrospectionV3' test.out

#- 205 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 205 'GetJWKSV3' test.out

#- 206 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'wsBA1eGa' \
    --mfaToken 'Hw7rGdeG' \
    > test.out 2>&1
eval_tap $? 206 'Change2faMethod' test.out

#- 207 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'WXUxH7gp' \
    --factor 'QNw74bRj' \
    --mfaToken 'WOh3tVPX' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 207 'Verify2faCode' test.out

#- 208 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'y2P3gk6F' \
    --userId 'TgVOtBTL' \
    > test.out 2>&1
eval_tap $? 208 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 209 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'UaThDADF' \
    --clientId 'x35g5AH9' \
    --redirectUri 'YbqWu7wi' \
    --requestId '37PKCEmE' \
    > test.out 2>&1
eval_tap $? 209 'AuthCodeRequestV3' test.out

#- 210 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId '4UP609tp' \
    --clientId 'ER4n5UXi' \
    --createHeadless  \
    --deviceId '2CjnNnew' \
    --platformToken 'XHjstIqf' \
    > test.out 2>&1
eval_tap $? 210 'PlatformTokenGrantV3' test.out

#- 211 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 211 'GetRevocationListV3' test.out

#- 212 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'LGviwDWt' \
    > test.out 2>&1
eval_tap $? 212 'TokenRevocationV3' test.out

#- 213 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId '0khuDK2o' \
    --code '72TBn7e8' \
    --codeVerifier 'O5AhGSNC' \
    --extendExp  \
    --password 'cZYPHDIW' \
    --redirectUri 'r6FMMOmE' \
    --refreshToken 'CVh6TtgD' \
    --username 'PmyTm4Zz' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 213 'TokenGrantV3' test.out

#- 214 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token '9soKrzGu' \
    > test.out 2>&1
eval_tap $? 214 'VerifyTokenV3' test.out

#- 215 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'Gvudz5bN' \
    --code 'PNNAtsYI' \
    --error 'tZ1btRIm' \
    --openidAssocHandle 'H5EM9aWx' \
    --openidClaimedId 'mHgLrTf9' \
    --openidIdentity 'vkecMCNP' \
    --openidMode 'SBmFr2Aa' \
    --openidNs 'SnJAenGE' \
    --openidOpEndpoint 'QpElvAoQ' \
    --openidResponseNonce '8zRGbXj8' \
    --openidReturnTo 'GpUqLuoQ' \
    --openidSig 'QZ7YleSV' \
    --openidSigned 'MQWFSQUh' \
    --state 'zeiV2Ljr' \
    > test.out 2>&1
eval_tap $? 215 'PlatformAuthenticationV3' test.out

#- 216 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'nUAxI4Y7' \
    > test.out 2>&1
eval_tap $? 216 'PublicGetInputValidations' test.out

#- 217 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 217 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 218 RetrieveActiveOIDCClientsPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveActiveOIDCClientsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --clientId 'sp5bOBes' \
    > test.out 2>&1
eval_tap $? 218 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 219 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ToTWWsWK' \
    --body '{"platformUserIds": ["ipljZBoZ", "emIuhQ2y", "DO1CjFk6"]}' \
    > test.out 2>&1
eval_tap $? 219 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 220 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0RzrD2kI' \
    --platformUserId 'LnDNasKW' \
    > test.out 2>&1
eval_tap $? 220 'PublicGetUserByPlatformUserIDV3' test.out

#- 221 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'Aq2uoIJ7' \
    > test.out 2>&1
eval_tap $? 221 'PublicGetAsyncStatus' test.out

#- 222 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'L3gMqhUS' \
    --limit '10' \
    --offset '6' \
    --query 'fhPQfaQ5' \
    > test.out 2>&1
eval_tap $? 222 'PublicSearchUserV3' test.out

#- 223 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "ziRI4XUR", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "ckcDVOFj", "policyId": "uep4CF1x", "policyVersionId": "gwupEget"}, {"isAccepted": true, "localizedPolicyVersionId": "hG9SsrBa", "policyId": "WtY174ng", "policyVersionId": "r0BhEGtS"}, {"isAccepted": false, "localizedPolicyVersionId": "RRPJXriO", "policyId": "BDQlmyYA", "policyVersionId": "8ZaU1xoN"}], "authType": "1jpi5ZpD", "code": "eKrf8rGr", "country": "Uh3z3OqN", "dateOfBirth": "orZMzmJr", "displayName": "X5tXX8GE", "emailAddress": "CzKW7m60", "password": "76BSBT8d", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 223 'PublicCreateUserV3' test.out

#- 224 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field '4sYujKdC' \
    --query 'TE6JFVrV' \
    > test.out 2>&1
eval_tap $? 224 'CheckUserAvailability' test.out

#- 225 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["f603DxBZ", "IIhyUOy6", "ijPAJO36"]}' \
    > test.out 2>&1
eval_tap $? 225 'PublicBulkGetUsers' test.out

#- 226 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "CeawPTdH", "languageTag": "vYjDZxP1"}' \
    > test.out 2>&1
eval_tap $? 226 'PublicSendRegistrationCode' test.out

#- 227 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "FwOF5gUo", "emailAddress": "eVegkEzQ"}' \
    > test.out 2>&1
eval_tap $? 227 'PublicVerifyRegistrationCode' test.out

#- 228 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "FUrkBdeO", "languageTag": "5nl9fWmY"}' \
    > test.out 2>&1
eval_tap $? 228 'PublicForgotPasswordV3' test.out

#- 229 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'HxOL4cbd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 229 'GetAdminInvitationV3' test.out

#- 230 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId '7kFTxeHS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "atx8dv5W", "policyId": "jGuAFBdx", "policyVersionId": "ut1IQhXE"}, {"isAccepted": false, "localizedPolicyVersionId": "ZbA8Ks2U", "policyId": "JZpJkLhO", "policyVersionId": "XHoHOTyR"}, {"isAccepted": true, "localizedPolicyVersionId": "Bcvbp2vf", "policyId": "CAHmLwhq", "policyVersionId": "AhIyvG0G"}], "authType": "EMAILPASSWD", "country": "fpmx1RKa", "dateOfBirth": "woVb67qx", "displayName": "LQmWWpxS", "password": "nw1Q3epk", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 230 'CreateUserFromInvitationV3' test.out

#- 231 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "WJXRm70i", "country": "KuL5hc5a", "dateOfBirth": "qGy86ydh", "displayName": "u88HbPuQ", "languageTag": "0UrMMEmd", "userName": "M8wR9hst"}' \
    > test.out 2>&1
eval_tap $? 231 'UpdateUserV3' test.out

#- 232 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "RMLykorV", "country": "yuEJmvv1", "dateOfBirth": "24vS964e", "displayName": "S0J97M7g", "languageTag": "K42lbhOv", "userName": "KClBM16e"}' \
    > test.out 2>&1
eval_tap $? 232 'PublicPartialUpdateUserV3' test.out

#- 233 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "ltoV1VRA", "emailAddress": "pPKhDz5T", "languageTag": "wiDcciel"}' \
    > test.out 2>&1
eval_tap $? 233 'PublicSendVerificationCodeV3' test.out

#- 234 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "nPQrmKHb", "contactType": "BLG9dZC0", "languageTag": "cuh1bpw8", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 234 'PublicUserVerificationV3' test.out

#- 235 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "xUy1w7zb", "country": "Os7PPTLd", "dateOfBirth": "8jo7ypZX", "displayName": "NRuluLhI", "emailAddress": "wZ144Zkv", "password": "dRMilAPI", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 235 'PublicUpgradeHeadlessAccountV3' test.out

#- 236 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "tjTXkiUg", "password": "ZQEsBiVP"}' \
    > test.out 2>&1
eval_tap $? 236 'PublicVerifyHeadlessAccountV3' test.out

#- 237 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "wdFrczfv", "newPassword": "Ixfs0Qcy", "oldPassword": "E7D8Cnqw"}' \
    > test.out 2>&1
eval_tap $? 237 'PublicUpdatePasswordV3' test.out

#- 238 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'hDD79Gpj' \
    > test.out 2>&1
eval_tap $? 238 'PublicCreateJusticeUser' test.out

#- 239 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0yb6puFN' \
    --redirectUri 'ZueuImsO' \
    --ticket 'pgRKWmH1' \
    > test.out 2>&1
eval_tap $? 239 'PublicPlatformLinkV3' test.out

#- 240 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'trv6TXHT' \
    --body '{"platformNamespace": "UJehJYY4"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicPlatformUnlinkV3' test.out

#- 241 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yJcduJ6J' \
    > test.out 2>&1
eval_tap $? 241 'PublicPlatformUnlinkAllV3' test.out

#- 242 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId '7wXqtLOQ' \
    --clientId 'WtuBJPAv' \
    --redirectUri 'WvpR3BEV' \
    > test.out 2>&1
eval_tap $? 242 'PublicWebLinkPlatform' test.out

#- 243 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'R7mkX3M3' \
    --state 'LFunK6ER' \
    > test.out 2>&1
eval_tap $? 243 'PublicWebLinkPlatformEstablish' test.out

#- 244 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "pmV5a6FG", "emailAddress": "VkIr4Zdf", "newPassword": "9htPqjGi"}' \
    > test.out 2>&1
eval_tap $? 244 'ResetPasswordV3' test.out

#- 245 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LSg8mNBc' \
    > test.out 2>&1
eval_tap $? 245 'PublicGetUserByUserIdV3' test.out

#- 246 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'emEdra9j' \
    --activeOnly  \
    --after '2zbOrfGP' \
    --before 'lLHV3PoY' \
    --limit '18' \
    > test.out 2>&1
eval_tap $? 246 'PublicGetUserBanHistoryV3' test.out

#- 247 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ViZYSJ0j' \
    > test.out 2>&1
eval_tap $? 247 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 248 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pXZ6z0b8' \
    --after '0.22746907794804117' \
    --before '0.6543401399243001' \
    --limit '69' \
    > test.out 2>&1
eval_tap $? 248 'PublicGetUserLoginHistoriesV3' test.out

#- 249 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KVY612xJ' \
    --after 'UkEobYB0' \
    --before 'bogwRzdZ' \
    --limit '91' \
    > test.out 2>&1
eval_tap $? 249 'PublicGetUserPlatformAccountsV3' test.out

#- 250 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'XWhhlBuU' \
    --body '{"platformId": "9cV3f8Fd", "platformUserId": "j8FOcUMH"}' \
    > test.out 2>&1
eval_tap $? 250 'PublicLinkPlatformAccount' test.out

#- 251 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'SRg0VfpD' \
    --body '{"chosenNamespaces": ["pEMY3DLN", "eLqI6P0P", "TxEzMjRH"], "requestId": "Tf5uZ8b5"}' \
    > test.out 2>&1
eval_tap $? 251 'PublicForceLinkPlatformWithProgression' test.out

#- 252 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GR5Wgh3A' \
    > test.out 2>&1
eval_tap $? 252 'PublicGetPublisherUserV3' test.out

#- 253 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hL6QpVTK' \
    --password 'A7mUGs9V' \
    > test.out 2>&1
eval_tap $? 253 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 254 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'Lwkuwt7c' \
    --before 'X9vJINZY' \
    --isWildcard  \
    --limit '24' \
    > test.out 2>&1
eval_tap $? 254 'PublicGetRolesV3' test.out

#- 255 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'JDmfUkdl' \
    > test.out 2>&1
eval_tap $? 255 'PublicGetRoleV3' test.out

#- 256 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 256 'PublicGetMyUserV3' test.out

#- 257 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'pqrWmvyj' \
    --code 'WVt9YAx1' \
    --error 'cmH0UtH3' \
    --state 'u8X8xqQc' \
    > test.out 2>&1
eval_tap $? 257 'PlatformAuthenticateSAMLV3Handler' test.out

#- 258 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'RoNfSpd3' \
    --payload 'yo6eK403' \
    > test.out 2>&1
eval_tap $? 258 'LoginSSOClient' test.out

#- 259 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'EN0sJ7i2' \
    > test.out 2>&1
eval_tap $? 259 'LogoutSSOClient' test.out

#- 260 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 46}' \
    > test.out 2>&1
eval_tap $? 260 'AdminCreateTestUsersV4' test.out

#- 261 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["PLl7Ipdt", "GbLWAc7W", "e4wWPzwN"]}' \
    > test.out 2>&1
eval_tap $? 261 'AdminBulkCheckValidUserIDV4' test.out

#- 262 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PTGoC1vo' \
    --body '{"avatarUrl": "YDbbTUWT", "country": "5p59cVXu", "dateOfBirth": "oYb4fkTx", "displayName": "W0VF1INN", "languageTag": "HDp1BIQU", "userName": "YKeWQaeY"}' \
    > test.out 2>&1
eval_tap $? 262 'AdminUpdateUserV4' test.out

#- 263 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xh3y2j9M' \
    --body '{"code": "XFdpCbz2", "emailAddress": "6rJJ0o1f"}' \
    > test.out 2>&1
eval_tap $? 263 'AdminUpdateUserEmailAddressV4' test.out

#- 264 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WQqjBp9i' \
    > test.out 2>&1
eval_tap $? 264 'AdminDisableUserMFAV4' test.out

#- 265 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aqPJzzEv' \
    > test.out 2>&1
eval_tap $? 265 'AdminListUserRolesV4' test.out

#- 266 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '5CsII0e1' \
    --body '{"assignedNamespaces": ["vWacuOek", "eAhJ0cqE", "cHB1jCml"], "roleId": "7iheyYWm"}' \
    > test.out 2>&1
eval_tap $? 266 'AdminUpdateUserRoleV4' test.out

#- 267 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EJUHLZwW' \
    --body '{"assignedNamespaces": ["oBLmM6sX", "JHucY5Mx", "kqmstcoC"], "roleId": "obEEKKTL"}' \
    > test.out 2>&1
eval_tap $? 267 'AdminAddUserRoleV4' test.out

#- 268 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IgvvEiIX' \
    --body '{"assignedNamespaces": ["bKeabSde", "7poxR17Q", "3KXIa2vg"], "roleId": "Lx7iOlK7"}' \
    > test.out 2>&1
eval_tap $? 268 'AdminRemoveUserRoleV4' test.out

#- 269 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '1' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 269 'AdminGetRolesV4' test.out

#- 270 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "roleName": "1P0chvp3"}' \
    > test.out 2>&1
eval_tap $? 270 'AdminCreateRoleV4' test.out

#- 271 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 't2k19xci' \
    > test.out 2>&1
eval_tap $? 271 'AdminGetRoleV4' test.out

#- 272 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'HQKfRotT' \
    > test.out 2>&1
eval_tap $? 272 'AdminDeleteRoleV4' test.out

#- 273 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'ms7YFwWP' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "8r2Q2I1O"}' \
    > test.out 2>&1
eval_tap $? 273 'AdminUpdateRoleV4' test.out

#- 274 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId '6qXvzwWk' \
    --body '{"permissions": [{"action": 96, "resource": "4TByxue7", "schedAction": 1, "schedCron": "DkjC7IlJ", "schedRange": ["rODlkBnf", "0fnfqp4E", "BV69jxby"]}, {"action": 8, "resource": "1toQFRI8", "schedAction": 94, "schedCron": "sXrJMTgG", "schedRange": ["OTfp6EpR", "FtVAjnh7", "mv0togys"]}, {"action": 68, "resource": "FrCVhJiz", "schedAction": 99, "schedCron": "Toh2qMXK", "schedRange": ["BUOPZdvD", "kpe47iXA", "XklaEwmo"]}]}' \
    > test.out 2>&1
eval_tap $? 274 'AdminUpdateRolePermissionsV4' test.out

#- 275 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'E2PwZfWL' \
    --body '{"permissions": [{"action": 62, "resource": "N3BpcezD", "schedAction": 48, "schedCron": "MbazRjLk", "schedRange": ["vIC1omZC", "w4P6EPvA", "d0qqvskQ"]}, {"action": 54, "resource": "u8svy8oC", "schedAction": 54, "schedCron": "1NFGuGTm", "schedRange": ["E2D7483N", "qtsF68ij", "IyT8qZ1c"]}, {"action": 45, "resource": "PucUbgPO", "schedAction": 66, "schedCron": "N9FAtNYE", "schedRange": ["AULpH4oU", "HS9KMCy3", "pZAmdXFN"]}]}' \
    > test.out 2>&1
eval_tap $? 275 'AdminAddRolePermissionsV4' test.out

#- 276 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'sRXfIf1R' \
    --body '["EBeuk8kY", "dYKSp0oI", "VbWK7jGh"]' \
    > test.out 2>&1
eval_tap $? 276 'AdminDeleteRolePermissionsV4' test.out

#- 277 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'gxIqfxJq' \
    --after 'T1yztFsv' \
    --before 'EnM3uHmy' \
    --limit '89' \
    > test.out 2>&1
eval_tap $? 277 'AdminListAssignedUsersV4' test.out

#- 278 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'NuBQ2jqF' \
    --body '{"assignedNamespaces": ["vL6RNnCN", "v1XzjoLl", "W25HFuxH"], "namespace": "yPsDzyWS", "userId": "6UBrw9Sf"}' \
    > test.out 2>&1
eval_tap $? 278 'AdminAssignUserToRoleV4' test.out

#- 279 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'voKER97T' \
    --body '{"namespace": "WHsbx7G2", "userId": "zOMn4ydt"}' \
    > test.out 2>&1
eval_tap $? 279 'AdminRevokeUserFromRoleV4' test.out

#- 280 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "MeNMpXUs", "country": "uYLJfQ5S", "dateOfBirth": "9SM90YKr", "displayName": "ZSGOOXE5", "languageTag": "qfhZ1747", "userName": "nOE6Vovp"}' \
    > test.out 2>&1
eval_tap $? 280 'AdminUpdateMyUserV4' test.out

#- 281 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 281 'AdminDisableMyAuthenticatorV4' test.out

#- 282 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'PsVSIcGg' \
    > test.out 2>&1
eval_tap $? 282 'AdminEnableMyAuthenticatorV4' test.out

#- 283 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 283 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 284 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 284 'AdminGetMyBackupCodesV4' test.out

#- 285 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 285 'AdminGenerateMyBackupCodesV4' test.out

#- 286 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 286 'AdminDisableMyBackupCodesV4' test.out

#- 287 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 287 'AdminDownloadMyBackupCodesV4' test.out

#- 288 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 288 'AdminEnableMyBackupCodesV4' test.out

#- 289 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 289 'AdminGetMyEnabledFactorsV4' test.out

#- 290 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'komW0pS4' \
    > test.out 2>&1
eval_tap $? 290 'AdminMakeFactorMyDefaultV4' test.out

#- 291 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["xCaaHQlI", "1IgbKQex", "0gXlXaWk"], "emailAddresses": ["KyjmvrCE", "Auhk3WAs", "tYpnOLlo"], "isAdmin": true, "roleId": "STwOio8E"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminInviteUserV4' test.out

#- 292 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "DPnkfKdh", "policyId": "roCefrPK", "policyVersionId": "Pyi5OzvP"}, {"isAccepted": false, "localizedPolicyVersionId": "HUBOltbK", "policyId": "DsfzRcEA", "policyVersionId": "SkaZRiSH"}, {"isAccepted": true, "localizedPolicyVersionId": "0muX8fuQ", "policyId": "bOSaCt7w", "policyVersionId": "P5btS95N"}], "authType": "EMAILPASSWD", "country": "CZik26bB", "dateOfBirth": "xNtFiXjT", "displayName": "1yZ47NJu", "emailAddress": "cmq7Q9MA", "password": "UX4msOOW", "passwordMD5Sum": "v33nywAO", "username": "eKJan4fG", "verified": false}' \
    > test.out 2>&1
eval_tap $? 292 'PublicCreateTestUserV4' test.out

#- 293 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "9xN6KqRH", "policyId": "wLwfKMQz", "policyVersionId": "wldeMHmv"}, {"isAccepted": false, "localizedPolicyVersionId": "azdFSO63", "policyId": "VkCjJZE3", "policyVersionId": "sYyB8h4z"}, {"isAccepted": true, "localizedPolicyVersionId": "oFL5515t", "policyId": "6KSsoHhq", "policyVersionId": "H19rj3a0"}], "authType": "EMAILPASSWD", "code": "iqyhs7NX", "country": "h2ESGzpI", "dateOfBirth": "2I9FFGsE", "displayName": "1yczfLKG", "emailAddress": "XiTWRIHd", "password": "CrHzltkG", "passwordMD5Sum": "s20eolVh", "reachMinimumAge": true, "username": "i9Exmeyn"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicCreateUserV4' test.out

#- 294 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId '20S3HNRb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "xHzrOB6D", "policyId": "nkc46EDF", "policyVersionId": "15HIU2X3"}, {"isAccepted": false, "localizedPolicyVersionId": "bqxMLzbF", "policyId": "BxwD4iGK", "policyVersionId": "fFGSRjf9"}, {"isAccepted": false, "localizedPolicyVersionId": "6Au08wBM", "policyId": "5b2Fy5zv", "policyVersionId": "eP5vzwC8"}], "authType": "EMAILPASSWD", "country": "eQ9uVSrU", "dateOfBirth": "Q8J8UQdU", "displayName": "YXLQzFCR", "password": "FSPhXemO", "reachMinimumAge": false, "username": "mhL6EZj8"}' \
    > test.out 2>&1
eval_tap $? 294 'CreateUserFromInvitationV4' test.out

#- 295 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "ZpUgTuib", "country": "QTBcUpZ6", "dateOfBirth": "UUQTXED6", "displayName": "8LDqsBiI", "languageTag": "FjYE7mIO", "userName": "EsEKgnUA"}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUpdateUserV4' test.out

#- 296 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "rzR3RYEF", "emailAddress": "aWevhNl6"}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpdateUserEmailAddressV4' test.out

#- 297 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Cr7lqngU", "country": "7vRmrOoJ", "dateOfBirth": "5ELYgbQ9", "displayName": "hGv8bDac", "emailAddress": "JSbv4gw4", "password": "i3yf9CQ3", "reachMinimumAge": false, "username": "p6oYuuxd", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 297 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 298 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "NOP3zQTa", "password": "ruPCNQDx", "username": "uJyrdjKe"}' \
    > test.out 2>&1
eval_tap $? 298 'PublicUpgradeHeadlessAccountV4' test.out

#- 299 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 299 'PublicDisableMyAuthenticatorV4' test.out

#- 300 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'o3LTd828' \
    > test.out 2>&1
eval_tap $? 300 'PublicEnableMyAuthenticatorV4' test.out

#- 301 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 301 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 302 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 302 'PublicGetMyBackupCodesV4' test.out

#- 303 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 303 'PublicGenerateMyBackupCodesV4' test.out

#- 304 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 304 'PublicDisableMyBackupCodesV4' test.out

#- 305 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 305 'PublicDownloadMyBackupCodesV4' test.out

#- 306 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 306 'PublicEnableMyBackupCodesV4' test.out

#- 307 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'WbJnnQE1' \
    > test.out 2>&1
eval_tap $? 307 'PublicRemoveTrustedDeviceV4' test.out

#- 308 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 308 'PublicGetMyEnabledFactorsV4' test.out

#- 309 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'WqgtaSRX' \
    > test.out 2>&1
eval_tap $? 309 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE