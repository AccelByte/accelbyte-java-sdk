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
    --after '62' \
    --before '45' \
    --limit '31' \
    --roleId 'Ii5pnVhT' \
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
    --userId '2vcdpMon' \
    > test.out 2>&1
eval_tap $? 34 'GetUserInformation' test.out

#- 35 DeleteUserInformation
eval_tap 0 35 'DeleteUserInformation # SKIP deprecated' test.out

#- 36 GetUserLoginHistories
./ng net.accelbyte.sdk.cli.Main iam getUserLoginHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'rx2n1cqd' \
    --after '0.6186476693978767' \
    --before '0.21798633353169383' \
    --limit '45' \
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
    --userId 'g1ueTJdZ' \
    > test.out 2>&1
eval_tap $? 41 'GetUserPlatformAccounts' test.out

#- 42 GetUserMapping
./ng net.accelbyte.sdk.cli.Main iam getUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '8rzSQPO3' \
    --userId 'Y1TlOgLW' \
    > test.out 2>&1
eval_tap $? 42 'GetUserMapping' test.out

#- 43 GetUserJusticePlatformAccount
eval_tap 0 43 'GetUserJusticePlatformAccount # SKIP deprecated' test.out

#- 44 PlatformLink
./ng net.accelbyte.sdk.cli.Main iam platformLink \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jAUFJY53' \
    --userId 'I55EpK4d' \
    --ticket 'H0wxoROB' \
    > test.out 2>&1
eval_tap $? 44 'PlatformLink' test.out

#- 45 PlatformUnlink
./ng net.accelbyte.sdk.cli.Main iam platformUnlink \
    --namespace "$AB_NAMESPACE" \
    --platformId 'eCSalyI0' \
    --userId 'qWKKkfyf' \
    --platformNamespace 'ADwvPmmw' \
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
    --userId 'MRuLYEfn' \
    --body '{"LoginID": "u7o9yNIr", "Password": "cwGxLna9"}' \
    > test.out 2>&1
eval_tap $? 50 'UpgradeHeadlessAccount' test.out

#- 51 UpgradeHeadlessAccountWithVerificationCode
./ng net.accelbyte.sdk.cli.Main iam upgradeHeadlessAccountWithVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'gkncyTSn' \
    --body '{"Code": "iw6xbWlW", "Password": "tS4PST0s", "loginId": "W3ued4x6"}' \
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
    --body '{"AgeRestriction": 19, "Enable": false}' \
    > test.out 2>&1
eval_tap $? 81 'AdminUpdateAgeRestrictionConfigV2' test.out

#- 82 GetListCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam getListCountryAgeRestriction \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'GetListCountryAgeRestriction' test.out

#- 83 UpdateCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam updateCountryAgeRestriction \
    --countryCode 'RI1izCOQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"AgeRestriction": 4}' \
    > test.out 2>&1
eval_tap $? 83 'UpdateCountryAgeRestriction' test.out

#- 84 AdminSearchUsersV2
./ng net.accelbyte.sdk.cli.Main iam adminSearchUsersV2 \
    --namespace "$AB_NAMESPACE" \
    --after 'K9AVARPy' \
    --before 'W4UELVDS' \
    --displayName '5wPMPJg0' \
    --limit '34' \
    --loginId '11KgkCBY' \
    --platformUserId 'BTXaYeZB' \
    --roleId 'WH2Rp03j' \
    --userId 'YUtUMnAZ' \
    --platformId '86ZHJ9QK' \
    > test.out 2>&1
eval_tap $? 84 'AdminSearchUsersV2' test.out

#- 85 AdminGetUserByUserIdV2
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '8hgr9gLZ' \
    > test.out 2>&1
eval_tap $? 85 'AdminGetUserByUserIdV2' test.out

#- 86 AdminUpdateUserV2
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eHAebcVa' \
    --body '{"Country": "2FbNxRZk", "DateOfBirth": "ROmKwp5w", "DisplayName": "dJa0TuBR", "LanguageTag": "uCj4judl"}' \
    > test.out 2>&1
eval_tap $? 86 'AdminUpdateUserV2' test.out

#- 87 AdminBanUserV2
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A6nhA7DO' \
    --body '{"ban": "ctsrrJkF", "comment": "NHQfiocQ", "endDate": "ZXmq5lVc", "reason": "wCq4EIs2", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 87 'AdminBanUserV2' test.out

#- 88 AdminGetUserBanV2
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '3YUfC9sB' \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 88 'AdminGetUserBanV2' test.out

#- 89 AdminDisableUserV2
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '3RVYZ7xp' \
    --body '{"Reason": "CyzLlxnx"}' \
    > test.out 2>&1
eval_tap $? 89 'AdminDisableUserV2' test.out

#- 90 AdminEnableUserV2
./ng net.accelbyte.sdk.cli.Main iam adminEnableUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AXXIE8sP' \
    > test.out 2>&1
eval_tap $? 90 'AdminEnableUserV2' test.out

#- 91 AdminResetPasswordV2
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hQ60HJVp' \
    --body '{"LanguageTag": "MXRQYfel", "NewPassword": "el0RWB8w", "OldPassword": "oJnmxTs5"}' \
    > test.out 2>&1
eval_tap $? 91 'AdminResetPasswordV2' test.out

#- 92 AdminDeletePlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam adminDeletePlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'y7W55lcC' \
    --userId 'u7sk9zYm' \
    --platformNamespace 'u1wZ5idx' \
    > test.out 2>&1
eval_tap $? 92 'AdminDeletePlatformLinkV2' test.out

#- 93 AdminPutUserRolesV2
./ng net.accelbyte.sdk.cli.Main iam adminPutUserRolesV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NWKti3tI' \
    --body '["JdJM6XRs", "7iWH8kE6", "kIox7lTI"]' \
    > test.out 2>&1
eval_tap $? 93 'AdminPutUserRolesV2' test.out

#- 94 AdminCreateUserRolesV2
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserRolesV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hMcgXN5u' \
    --body '["XhgaBrzp", "fpde68bo", "LWBUmjEe"]' \
    > test.out 2>&1
eval_tap $? 94 'AdminCreateUserRolesV2' test.out

#- 95 PublicGetCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestriction \
    --countryCode 'S7AshNGW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'PublicGetCountryAgeRestriction' test.out

#- 96 PublicCreateUserV2
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"AuthType": "3YykWA3D", "Country": "zHGIeJLI", "DisplayName": "xwksqQYY", "LoginId": "5tpITIj3", "Password": "6QGiiI0A", "PasswordMD5Sum": "LbgxJIpd"}' \
    > test.out 2>&1
eval_tap $? 96 'PublicCreateUserV2' test.out

#- 97 PublicForgotPasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"Context": "PO5vcQW8", "LanguageTag": "ibN4ortL", "LoginID": "kd58x6fc"}' \
    > test.out 2>&1
eval_tap $? 97 'PublicForgotPasswordV2' test.out

#- 98 PublicResetPasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicResetPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"Code": "eW2YLOm6", "LoginID": "Rp8cte5m", "NewPassword": "D72EizHM"}' \
    > test.out 2>&1
eval_tap $? 98 'PublicResetPasswordV2' test.out

#- 99 PublicGetUserByUserIDV2
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '9BmFpb6e' \
    > test.out 2>&1
eval_tap $? 99 'PublicGetUserByUserIDV2' test.out

#- 100 PublicUpdateUserV2
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xHWrDXge' \
    --body '{"Country": "KxZvr2QQ", "DateOfBirth": "JeRE7ubx", "DisplayName": "Yz3Bdrzh", "LanguageTag": "63GTg5Nx"}' \
    > test.out 2>&1
eval_tap $? 100 'PublicUpdateUserV2' test.out

#- 101 PublicGetUserBan
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBan \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sivb0ATD' \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 101 'PublicGetUserBan' test.out

#- 102 PublicUpdatePasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mH2aPBNf' \
    --body '{"LanguageTag": "OeixIDo9", "NewPassword": "b8XnQOb7", "OldPassword": "DKfFRAPD"}' \
    > test.out 2>&1
eval_tap $? 102 'PublicUpdatePasswordV2' test.out

#- 103 GetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam getListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'QYfOLc8o' \
    > test.out 2>&1
eval_tap $? 103 'GetListJusticePlatformAccounts' test.out

#- 104 PublicPlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XX286tE6' \
    --userId 'sDdF89oz' \
    --ticket 'V26Bo9aq' \
    > test.out 2>&1
eval_tap $? 104 'PublicPlatformLinkV2' test.out

#- 105 PublicDeletePlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam publicDeletePlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RuSTXERL' \
    --userId 'J3w9QuPf' \
    --platformNamespace 'S1k8KOPn' \
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
    --body '[{"field": "Qyq2nnFg", "validation": {"allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "description": [{"language": "QpGWEhGT", "message": ["54z18IFJ", "OK7GrP19", "LpBgTbey"]}, {"language": "RMxFL8tR", "message": ["MrVHMbK4", "Lmdptxgi", "2AK2RWpc"]}, {"language": "7kNLRrC8", "message": ["BUIurwl8", "EzEsRpEn", "13AJPLsE"]}], "isCustomRegex": false, "letterCase": "iptACEKI", "maxLength": 57, "maxRepeatingAlphaNum": 54, "maxRepeatingSpecialCharacter": 17, "minCharType": 93, "minLength": 80, "regex": "gXmbgJU6", "specialCharacterLocation": "UeHUjijS", "specialCharacters": ["Tg80Itpb", "uf6aof2T", "ErTRSPtI"]}}, {"field": "skCch7zm", "validation": {"allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "description": [{"language": "yUbAQl5N", "message": ["KzHFmjYD", "sME6Y0dk", "8pNDGzdv"]}, {"language": "6TRofCvy", "message": ["1wi8lwHv", "Bkdo02LN", "iz4aHBEM"]}, {"language": "RpM7wYLC", "message": ["MaAqi3Gs", "LXafp51y", "4zWFVAtp"]}], "isCustomRegex": true, "letterCase": "a6AZxmMk", "maxLength": 56, "maxRepeatingAlphaNum": 64, "maxRepeatingSpecialCharacter": 62, "minCharType": 93, "minLength": 59, "regex": "x4Pd8IeU", "specialCharacterLocation": "ML7BJyW7", "specialCharacters": ["scfP02Dm", "olVXeS6L", "GuXTA4lh"]}}, {"field": "Ja6wqNXU", "validation": {"allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "description": [{"language": "HDQZBWZj", "message": ["Fn28ixPg", "zPGOIUo0", "lLsU7OtB"]}, {"language": "NMVYwasc", "message": ["s9xLnDQi", "nSYAjm4P", "LiPMXokW"]}, {"language": "swH87X2u", "message": ["zWPmJTHm", "4MM8XuHk", "J0GOLGZi"]}], "isCustomRegex": false, "letterCase": "TIQO3eAl", "maxLength": 84, "maxRepeatingAlphaNum": 13, "maxRepeatingSpecialCharacter": 67, "minCharType": 97, "minLength": 31, "regex": "E6xsaxOw", "specialCharacterLocation": "ibuZx9RP", "specialCharacters": ["62dF6vmI", "nGYkC1zp", "NrgaSPSP"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field '7wd6TBgw' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'koUfKYN2' \
    --before 'b8Us6kIe' \
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
    --body '{"ageRestriction": 45, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'iPXMzdgU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 1}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'HbtY8sUH' \
    --limit '92' \
    --offset '65' \
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
    --limit '1' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 118 'AdminGetClientsByNamespaceV3' test.out

#- 119 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["3HX3dG6d", "CXFYKqrz", "iectElfl"], "baseUri": "D9VDu8xv", "clientId": "eWLz3Hr5", "clientName": "9smOIpcp", "clientPermissions": [{"action": 2, "resource": "g32lw8Rd", "schedAction": 14, "schedCron": "X1izPVZa", "schedRange": ["YwHQ8Zzs", "D0qFv3KO", "iQA7ls0h"]}, {"action": 98, "resource": "HpwRuDof", "schedAction": 60, "schedCron": "M60VsGz0", "schedRange": ["v3XCGIOh", "RkIv3fZ2", "YbIs9gds"]}, {"action": 37, "resource": "j4OiXYT1", "schedAction": 59, "schedCron": "XyEBqwey", "schedRange": ["TFDGB3CV", "8lMBpot4", "4kMkoegr"]}], "clientPlatform": "bCZpXrz7", "deletable": false, "namespace": "R1JDRM5Y", "oauthClientType": "gLCRG862", "redirectUri": "TJ8xCFg6", "secret": "lKbXSOLR"}' \
    > test.out 2>&1
eval_tap $? 119 'AdminCreateClientV3' test.out

#- 120 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'hlC4mnjc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 121 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'JiRowgjA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'AdminDeleteClientV3' test.out

#- 122 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'mf5jpi6h' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["XkhhNt0a", "41znCGaT", "ooHDPkAG"], "baseUri": "phEeFln3", "clientName": "ImQIEOEn", "clientPermissions": [{"action": 59, "resource": "rd62HcF4", "schedAction": 85, "schedCron": "c5ek0x1x", "schedRange": ["5OVhznuc", "aoqud5OG", "kuTKnFoG"]}, {"action": 83, "resource": "KLSpAxyk", "schedAction": 62, "schedCron": "FvuFdbnc", "schedRange": ["c7fGsl7d", "rXiuolVK", "cC3z8M0e"]}, {"action": 20, "resource": "UpWoasfb", "schedAction": 82, "schedCron": "kzoNEozH", "schedRange": ["u9rXEefw", "N6PBgjq0", "SdcXpE0W"]}], "clientPlatform": "MXt9NdZt", "deletable": true, "namespace": "BHou9f4t", "redirectUri": "Rz7WDr39"}' \
    > test.out 2>&1
eval_tap $? 122 'AdminUpdateClientV3' test.out

#- 123 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'g587Cery' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 44, "resource": "KlKfQU88"}, {"action": 62, "resource": "lTjc9C6q"}, {"action": 3, "resource": "yLTH8fLF"}]}' \
    > test.out 2>&1
eval_tap $? 123 'AdminUpdateClientPermissionV3' test.out

#- 124 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'gXs2ZmIZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 94, "resource": "w75MT5Dn"}, {"action": 87, "resource": "8cFxXF3r"}, {"action": 30, "resource": "D52gmrJ6"}]}' \
    > test.out 2>&1
eval_tap $? 124 'AdminAddClientPermissionsV3' test.out

#- 125 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '100' \
    --clientId 'j9S2jgVp' \
    --namespace "$AB_NAMESPACE" \
    --resource 'mkbn9zhH' \
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
    --limit '35' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 128 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 129 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yqZ6lNCM' \
    > test.out 2>&1
eval_tap $? 129 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 130 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'O7QJssd2' \
    --body '{"ACSURL": "bgJ9tWLx", "AWSCognitoRegion": "PWxj66GH", "AWSCognitoUserPool": "HYbo8UWS", "AllowedClients": ["tGGgQlVX", "xfI8MKiD", "xAFaHCvY"], "AppId": "LWVmvwA9", "AuthorizationEndpoint": "MxQMqZo1", "ClientId": "bBlctykZ", "Environment": "xTiYbRWK", "FederationMetadataURL": "kR8RoAP2", "GenericOauthFlow": false, "IsActive": false, "Issuer": "WkevnqrH", "JWKSEndpoint": "Ij73oB8t", "KeyID": "hphLRl4K", "NetflixCertificates": {"encryptedPrivateKey": "MACtNBxA", "encryptedPrivateKeyName": "yhnmOj7f", "publicCertificate": "WegNSwlY", "publicCertificateName": "ryPSMSyo", "rootCertificate": "Yam0U3Yr", "rootCertificateName": "TQlKfrA6"}, "OrganizationId": "at8IzuoE", "PlatformName": "f6A4dzVg", "RedirectUri": "lBC81hvY", "RegisteredDomains": [{"affectedClientIDs": ["UT2Gb35x", "2S7IN83j", "GloKzcv1"], "domain": "dpTUYDvo", "namespaces": ["WQCoT6ZO", "0rIKEz8P", "ql65N2E4"], "roleId": "pNRIA4Ia"}, {"affectedClientIDs": ["r4DddFuD", "uBTGKk4L", "JhsxuOk9"], "domain": "b34wFkbl", "namespaces": ["uHfXmSqN", "QPfdHzW1", "OxYM3kA2"], "roleId": "8miWIhhm"}, {"affectedClientIDs": ["7gN12tkS", "PUnOSvZD", "PzQBY9v3"], "domain": "4IJ3lq6H", "namespaces": ["Z0CIG9rS", "JljxyZr7", "hg99lofl"], "roleId": "RzqseKCx"}], "Secret": "EhEkzqnt", "TeamID": "wy7s8ZjK", "TokenAuthenticationType": "qLSOcGI6", "TokenClaimsMapping": {"wsWlbqOU": "HXt2AyZH", "hHfbsLsv": "0FOf8pDN", "Th7GG7rM": "ApFWDQxm"}, "TokenEndpoint": "VfeBUwD0"}' \
    > test.out 2>&1
eval_tap $? 130 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 131 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HKFrcxB9' \
    > test.out 2>&1
eval_tap $? 131 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 132 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'qOwextKK' \
    --body '{"ACSURL": "XBwBLkhi", "AWSCognitoRegion": "BfMdu3tr", "AWSCognitoUserPool": "ZIQVWBJg", "AllowedClients": ["tMFUPH2Y", "WIjaHJg8", "UYoeX14F"], "AppId": "o97oAQIf", "AuthorizationEndpoint": "g6zqXCnf", "ClientId": "F6OvVjFt", "Environment": "zBKeHKu8", "FederationMetadataURL": "qT0pPXXj", "GenericOauthFlow": true, "IsActive": true, "Issuer": "SqfGOdyI", "JWKSEndpoint": "ilQ1OJpj", "KeyID": "E0151BZP", "NetflixCertificates": {"encryptedPrivateKey": "v9if8V9P", "encryptedPrivateKeyName": "yuYf0mNs", "publicCertificate": "YfV6DvTf", "publicCertificateName": "8WXHiEs5", "rootCertificate": "EudBiUdK", "rootCertificateName": "ScF6PJbD"}, "OrganizationId": "FBIqXfnT", "PlatformName": "oSWzLuCy", "RedirectUri": "BHjFDsaU", "RegisteredDomains": [{"affectedClientIDs": ["EqnyySgG", "XlXY8I1r", "PPnku9vY"], "domain": "PiqnX5LX", "namespaces": ["swFkypOc", "uqDjERdD", "EQy9s1AI"], "roleId": "g81SxS6N"}, {"affectedClientIDs": ["2aPwZ3SD", "0pe9r4xs", "mqRXZ40c"], "domain": "axNwJjZn", "namespaces": ["ODmpmh7C", "dMhJCWPB", "BTD4JrTM"], "roleId": "wZm9HvWa"}, {"affectedClientIDs": ["ACf9YrQp", "BxlLfs7u", "3ziHd9cm"], "domain": "FGe9kPaL", "namespaces": ["9ODz8Sa9", "OSXyqftk", "eQZ1F2Y8"], "roleId": "URbveUJh"}], "Secret": "RuAkAiVR", "TeamID": "IwXPgTbk", "TokenAuthenticationType": "nG8WutMb", "TokenClaimsMapping": {"lTAVgYQy": "XHD2m4t6", "e00hIfr8": "7o9Y8v1L", "la9oLNYX": "axTrpfCC"}, "TokenEndpoint": "Hzl7TMYX"}' \
    > test.out 2>&1
eval_tap $? 132 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 133 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2tnzvulg' \
    --body '{"affectedClientIDs": ["gnyiyLYP", "UNBSAF7L", "tdLooNdt"], "assignedNamespaces": ["Tqswz3sd", "RI7sJ3zj", "eYDmFMRp"], "domain": "LQFHwn9z", "roleId": "TIE6AQPV"}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 134 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JCLBryGh' \
    --body '{"domain": "tGznTv3W"}' \
    > test.out 2>&1
eval_tap $? 134 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 135 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'lPQrnJk4' \
    > test.out 2>&1
eval_tap $? 135 'RetrieveSSOLoginPlatformCredential' test.out

#- 136 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YdrKk1KY' \
    --body '{"acsUrl": "s1eFFo06", "apiKey": "kMPiCYt2", "appId": "pcwI4o2T", "federationMetadataUrl": "GIqeu99z", "isActive": false, "redirectUri": "Tt53GvFI", "secret": "PPgNbU0i", "ssoUrl": "Cfp7ndbQ"}' \
    > test.out 2>&1
eval_tap $? 136 'AddSSOLoginPlatformCredential' test.out

#- 137 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2iKdle2c' \
    > test.out 2>&1
eval_tap $? 137 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 138 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xLb9uXJ9' \
    --body '{"acsUrl": "GnznWjbh", "apiKey": "eJftUPVQ", "appId": "C31kmcOS", "federationMetadataUrl": "p7mxZfiA", "isActive": true, "redirectUri": "QaVKJuoA", "secret": "wASE9SNv", "ssoUrl": "UAUIBhGN"}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateSSOPlatformCredential' test.out

#- 139 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gVaXeUSX' \
    --platformUserId 'kxLogqvB' \
    > test.out 2>&1
eval_tap $? 139 'AdminGetUserByPlatformUserIDV3' test.out

#- 140 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'UxuSajNq' \
    --after '48' \
    --before '93' \
    --limit '83' \
    > test.out 2>&1
eval_tap $? 140 'GetAdminUsersByRoleIdV3' test.out

#- 141 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'HrzDuLll' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByEmailAddressV3' test.out

#- 142 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["0U7Nqixb", "4Tn67Auv", "M4bcR4aR"]}' \
    > test.out 2>&1
eval_tap $? 142 'AdminListUserIDByUserIDsV3' test.out

#- 143 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["xAlwhoIT", "TYEc22iU", "AWJSlr9Y"], "isAdmin": true, "roles": ["4r4dckcw", "OJlUcNtf", "rnwgFS7j"]}' \
    > test.out 2>&1
eval_tap $? 143 'AdminInviteUserV3' test.out

#- 144 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUsersV3' test.out

#- 145 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'OZ1INUcz' \
    --endDate '12wtAfvb' \
    --limit '68' \
    --offset '23' \
    --platformBy '7EZMolwu' \
    --platformId 'cboODSkn' \
    --query 'WVX8Xfiq' \
    --startDate 'oTh2qJPH' \
    > test.out 2>&1
eval_tap $? 145 'AdminSearchUserV3' test.out

#- 146 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["rhufG2DY", "fgOPeEUi", "C0ZcwXF7"]}' \
    > test.out 2>&1
eval_tap $? 146 'AdminGetBulkUserByEmailAddressV3' test.out

#- 147 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TyJALQEl' \
    > test.out 2>&1
eval_tap $? 147 'AdminGetUserByUserIdV3' test.out

#- 148 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'z9ZeaMyr' \
    --body '{"avatarUrl": "0mad9BfK", "country": "BlCJeIgO", "dateOfBirth": "Oq3LLd8P", "displayName": "KDqolKeT", "languageTag": "n07sY9Va", "userName": "WMAhwz5X"}' \
    > test.out 2>&1
eval_tap $? 148 'AdminUpdateUserV3' test.out

#- 149 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VeoRSSk1' \
    --activeOnly  \
    --after 'xZvSGisj' \
    --before 'GOim2XSC' \
    --limit '90' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserBanV3' test.out

#- 150 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PZa9E9PS' \
    --body '{"ban": "YlMCyKno", "comment": "mIg3c56c", "endDate": "ZTCaZ1dR", "reason": "sRrGBUoL", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 150 'AdminBanUserV3' test.out

#- 151 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'i8TLXo0j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TH21AcBD' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserBanV3' test.out

#- 152 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7ughAaRU' \
    --body '{"context": "aCRu4AhI", "emailAddress": "jtvoBK5a", "languageTag": "kEM9uNop"}' \
    > test.out 2>&1
eval_tap $? 152 'AdminSendVerificationCodeV3' test.out

#- 153 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qFoPATDK' \
    --body '{"Code": "yincDkMR", "ContactType": "TxclUiEj", "LanguageTag": "FJqR7yYl", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 153 'AdminVerifyAccountV3' test.out

#- 154 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'xvVWPdiF' \
    > test.out 2>&1
eval_tap $? 154 'GetUserVerificationCode' test.out

#- 155 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AnjodS8n' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetUserDeletionStatusV3' test.out

#- 156 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'x7bQsje0' \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 156 'AdminUpdateUserDeletionStatusV3' test.out

#- 157 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'O8JIOKqB' \
    --body '{"code": "G2yqqJrR", "country": "F1KEfp2O", "dateOfBirth": "cu3ayA2A", "displayName": "qIxl3R9j", "emailAddress": "LoxW6GUh", "password": "I6FGnn4e", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 157 'AdminUpgradeHeadlessAccountV3' test.out

#- 158 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fCLhekGU' \
    > test.out 2>&1
eval_tap $? 158 'AdminDeleteUserInformationV3' test.out

#- 159 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dPc1rgJH' \
    --after '0.27268850399359634' \
    --before '0.7245143357608274' \
    --limit '23' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetUserLoginHistoriesV3' test.out

#- 160 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1LqZXsnd' \
    --body '{"Permissions": [{"Action": 47, "Resource": "N4CwHdJq", "SchedAction": 8, "SchedCron": "9HtGTT1B", "SchedRange": ["pQX3gbDx", "huVOfOmv", "Hh07tAZ1"]}, {"Action": 11, "Resource": "iChktUtG", "SchedAction": 99, "SchedCron": "XAKyMp5X", "SchedRange": ["8MiQK5bb", "Sg8QE0Cz", "duXktGRj"]}, {"Action": 38, "Resource": "jAs9iXJJ", "SchedAction": 4, "SchedCron": "1tfMu30W", "SchedRange": ["69mTd6vc", "jp1OED8B", "u7RHRfBf"]}]}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpdateUserPermissionV3' test.out

#- 161 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xxkd3b6m' \
    --body '{"Permissions": [{"Action": 84, "Resource": "XKiW0Jif", "SchedAction": 75, "SchedCron": "0OVlf65X", "SchedRange": ["SHrA9YS4", "yovWB4dG", "D5wVFr1O"]}, {"Action": 90, "Resource": "1lS6OnXF", "SchedAction": 26, "SchedCron": "DkCqFwsz", "SchedRange": ["NuJajjW8", "9WxDx3Ca", "zfpysN6Q"]}, {"Action": 33, "Resource": "F2gr6Ry7", "SchedAction": 94, "SchedCron": "uduAGAFB", "SchedRange": ["O7ZLkIxR", "maElcdwd", "8R72xujB"]}]}' \
    > test.out 2>&1
eval_tap $? 161 'AdminAddUserPermissionsV3' test.out

#- 162 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DzfnOZfm' \
    --body '[{"Action": 57, "Resource": "mTzN07cR"}, {"Action": 87, "Resource": "LfwPDMDh"}, {"Action": 22, "Resource": "BGjK0OZt"}]' \
    > test.out 2>&1
eval_tap $? 162 'AdminDeleteUserPermissionBulkV3' test.out

#- 163 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '30' \
    --namespace "$AB_NAMESPACE" \
    --resource '8M1OlWO3' \
    --userId 'vJNtXCkc' \
    > test.out 2>&1
eval_tap $? 163 'AdminDeleteUserPermissionV3' test.out

#- 164 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cuDYSuF1' \
    --after 'hFGFZnfE' \
    --before 'kroBtlC5' \
    --limit '36' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetUserPlatformAccountsV3' test.out

#- 165 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'VqtQexDc' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetListJusticePlatformAccounts' test.out

#- 166 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'jIXNuz4k' \
    --userId 'btWIHXCn' \
    > test.out 2>&1
eval_tap $? 166 'AdminCreateJusticeUser' test.out

#- 167 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lro9ftG2' \
    --body '{"platformId": "yVlXjlpB", "platformUserId": "RHJdEhHB"}' \
    > test.out 2>&1
eval_tap $? 167 'AdminLinkPlatformAccount' test.out

#- 168 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QF29hXZB' \
    --userId 'hKTf64pK' \
    --body '{"platformNamespace": "ER6wsQRv"}' \
    > test.out 2>&1
eval_tap $? 168 'AdminPlatformUnlinkV3' test.out

#- 169 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fxx2ATEj' \
    --userId 'Qkt1bwvM' \
    --ticket 'KzCHp95P' \
    > test.out 2>&1
eval_tap $? 169 'AdminPlatformLinkV3' test.out

#- 170 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vL2e87pM' \
    --body '["JM5Izznd", "C5272dnT", "qICP09pG"]' \
    > test.out 2>&1
eval_tap $? 170 'AdminDeleteUserRolesV3' test.out

#- 171 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WkOS5k1U' \
    --body '[{"namespace": "ae4v5eSw", "roleId": "RymfVBv9"}, {"namespace": "LERVsUop", "roleId": "BDmxrq6B"}, {"namespace": "G38mcOiN", "roleId": "TwrlFNaH"}]' \
    > test.out 2>&1
eval_tap $? 171 'AdminSaveUserRoleV3' test.out

#- 172 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'iqtLJyV5' \
    --userId 'Wxk1saZx' \
    > test.out 2>&1
eval_tap $? 172 'AdminAddUserRoleV3' test.out

#- 173 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'ErO9tiTG' \
    --userId 'K9SlvMlA' \
    > test.out 2>&1
eval_tap $? 173 'AdminDeleteUserRoleV3' test.out

#- 174 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Te22phMD' \
    --body '{"enabled": false, "reason": "r0euWJX2"}' \
    > test.out 2>&1
eval_tap $? 174 'AdminUpdateUserStatusV3' test.out

#- 175 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YdoIOe1R' \
    > test.out 2>&1
eval_tap $? 175 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 176 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId '4gtQpMlt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "Wp50slln"}' \
    > test.out 2>&1
eval_tap $? 176 'AdminUpdateClientSecretV3' test.out

#- 177 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after '402QlrEj' \
    --before 'tRXZBx4d' \
    --isWildcard  \
    --limit '29' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetRolesV3' test.out

#- 178 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "managers": [{"displayName": "p7DcCfUH", "namespace": "2eh3I7NX", "userId": "Or0zX2B3"}, {"displayName": "GOK36Opf", "namespace": "jOzJf91R", "userId": "XZCSd7Qk"}, {"displayName": "Cu89j4Qs", "namespace": "NSogkJFD", "userId": "KZySmOKL"}], "members": [{"displayName": "rP89zfhU", "namespace": "wCopI4VL", "userId": "mRILgQSL"}, {"displayName": "PNKfVC1m", "namespace": "TJJvbvCP", "userId": "dzjGzAUR"}, {"displayName": "dH2KFm3h", "namespace": "32Lsoyv5", "userId": "ttPvorPx"}], "permissions": [{"action": 0, "resource": "hAn4nwpU", "schedAction": 26, "schedCron": "xLDSaT6o", "schedRange": ["8lKcRswu", "yW7COFpn", "kl0HOTpR"]}, {"action": 74, "resource": "k66LVCLW", "schedAction": 28, "schedCron": "yqcFSy5s", "schedRange": ["nDZbZbJH", "GqQbzN5h", "1vJzCYiX"]}, {"action": 91, "resource": "w4mAm2a7", "schedAction": 65, "schedCron": "IYGZs1TW", "schedRange": ["RLKGn9cV", "Y8wV2paR", "HSNfJcV3"]}], "roleName": "kwu59Lbl"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminCreateRoleV3' test.out

#- 179 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'fAEm2fH3' \
    > test.out 2>&1
eval_tap $? 179 'AdminGetRoleV3' test.out

#- 180 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'jC0elgPm' \
    > test.out 2>&1
eval_tap $? 180 'AdminDeleteRoleV3' test.out

#- 181 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'BaSSOAGk' \
    --body '{"deletable": true, "isWildcard": false, "roleName": "KtlGq9hs"}' \
    > test.out 2>&1
eval_tap $? 181 'AdminUpdateRoleV3' test.out

#- 182 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'Q4Ulnivi' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetRoleAdminStatusV3' test.out

#- 183 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'UmLr0dbp' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateAdminRoleStatusV3' test.out

#- 184 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'W0cyAE0D' \
    > test.out 2>&1
eval_tap $? 184 'AdminRemoveRoleAdminV3' test.out

#- 185 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'jKjMb7dk' \
    --after 'Q8m3HVWv' \
    --before 'ju6Anc7Y' \
    --limit '74' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleManagersV3' test.out

#- 186 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'JHGMcgIt' \
    --body '{"managers": [{"displayName": "80l7fwqk", "namespace": "DeT7iPh1", "userId": "cTtKYFEI"}, {"displayName": "ReMHaioG", "namespace": "V7q2JYvA", "userId": "UxLDOMSG"}, {"displayName": "tf26RYz5", "namespace": "DB3r2jdS", "userId": "wr2rzxSz"}]}' \
    > test.out 2>&1
eval_tap $? 186 'AdminAddRoleManagersV3' test.out

#- 187 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'dSZcL5Jb' \
    --body '{"managers": [{"displayName": "V5BcxPue", "namespace": "5mIxdmky", "userId": "G3WE2raI"}, {"displayName": "S8tCMuOG", "namespace": "lenKPHBL", "userId": "Ly3c9OzA"}, {"displayName": "TsUIAI42", "namespace": "VXFbmCS1", "userId": "FHBnIGKd"}]}' \
    > test.out 2>&1
eval_tap $? 187 'AdminRemoveRoleManagersV3' test.out

#- 188 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'mVdBtXb6' \
    --after '1mzPowt4' \
    --before 'vgnYWFEk' \
    --limit '56' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleMembersV3' test.out

#- 189 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'J78Jyc2O' \
    --body '{"members": [{"displayName": "t53Wty1k", "namespace": "raWlvRzl", "userId": "QraxqOrA"}, {"displayName": "5t8ydCIZ", "namespace": "Ri9mVxNt", "userId": "ig76m0Ws"}, {"displayName": "YhHyuqKX", "namespace": "RW9RZ96q", "userId": "Gas19vJk"}]}' \
    > test.out 2>&1
eval_tap $? 189 'AdminAddRoleMembersV3' test.out

#- 190 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'CfmTSiAt' \
    --body '{"members": [{"displayName": "h3v7pPUE", "namespace": "otrbwqWt", "userId": "qJQvkFol"}, {"displayName": "HfIjIg9z", "namespace": "ImjwMdB0", "userId": "edeD3v7W"}, {"displayName": "5Qx3x4KZ", "namespace": "s4MShyFA", "userId": "ZI7t3COQ"}]}' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleMembersV3' test.out

#- 191 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId '7bhALUgD' \
    --body '{"permissions": [{"action": 17, "resource": "hf7Taoks", "schedAction": 74, "schedCron": "UWsoaQnU", "schedRange": ["Az5HLQkM", "MYZmQUy5", "kPZUlIbI"]}, {"action": 82, "resource": "O6Yej9HV", "schedAction": 96, "schedCron": "GGvV9AP1", "schedRange": ["6jf44Y1v", "obzqbjlp", "WNOdEeqM"]}, {"action": 28, "resource": "QjTeMeWh", "schedAction": 16, "schedCron": "pmtzADBu", "schedRange": ["MSfQdtBA", "UqVheWjl", "FPbloXdr"]}]}' \
    > test.out 2>&1
eval_tap $? 191 'AdminUpdateRolePermissionsV3' test.out

#- 192 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'YMBS0qWe' \
    --body '{"permissions": [{"action": 18, "resource": "CzqMnozP", "schedAction": 70, "schedCron": "otoeGVe7", "schedRange": ["x4gYggVN", "nImWF93R", "K7iImHpO"]}, {"action": 17, "resource": "zO0hTmPJ", "schedAction": 42, "schedCron": "bCW4geR6", "schedRange": ["xogOKB2o", "67c6daNS", "SPG9jnNv"]}, {"action": 97, "resource": "Yl9umpZw", "schedAction": 60, "schedCron": "MijnK8Km", "schedRange": ["jRB3nzT0", "1T1Qdk0c", "SWSgbYiZ"]}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRolePermissionsV3' test.out

#- 193 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'Rqkl6fGP' \
    --body '["VWSf2DTr", "JufcqU5S", "5264azs2"]' \
    > test.out 2>&1
eval_tap $? 193 'AdminDeleteRolePermissionsV3' test.out

#- 194 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '97' \
    --resource 'VY8XkW6i' \
    --roleId 'EhIj4CpW' \
    > test.out 2>&1
eval_tap $? 194 'AdminDeleteRolePermissionV3' test.out

#- 195 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 195 'AdminGetMyUserV3' test.out

#- 196 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'X1LCiDfu' \
    --extendExp  \
    --redirectUri 'bmcQDxB1' \
    --password 'YA1OguGG' \
    --requestId '2qLzGLxN' \
    --userName '9VBZpOKf' \
    > test.out 2>&1
eval_tap $? 196 'UserAuthenticationV3' test.out

#- 197 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'kl6SDBBH' \
    --linkingToken 'xREG5dHl' \
    --password 'CR3VlAqB' \
    --username '1YEPXj7t' \
    > test.out 2>&1
eval_tap $? 197 'AuthenticationWithPlatformLinkV3' test.out

#- 198 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'ilDwmokl' \
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
    --platformId 'QslYnC2d' \
    --userId 'RidiP1m9' \
    > test.out 2>&1
eval_tap $? 201 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 202 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xapjjfoE' \
    > test.out 2>&1
eval_tap $? 202 'RevokeUserV3' test.out

#- 203 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'MzQhslta' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --redirectUri 'wKKxOJVz' \
    --scope 'lGceYYvH' \
    --state '5KL8kZES' \
    --targetAuthPage 'XrWoVmNs' \
    --clientId 'NPkoOPXc' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 203 'AuthorizeV3' test.out

#- 204 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'GH2BqrP7' \
    > test.out 2>&1
eval_tap $? 204 'TokenIntrospectionV3' test.out

#- 205 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 205 'GetJWKSV3' test.out

#- 206 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'VI72CZZi' \
    --mfaToken 'LD4Ydz5E' \
    > test.out 2>&1
eval_tap $? 206 'Change2faMethod' test.out

#- 207 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'RJfLqsBZ' \
    --factor 'sCS8O3Ea' \
    --mfaToken '6QbN5Czu' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 207 'Verify2faCode' test.out

#- 208 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '8Y8HxQFU' \
    --userId 'Pb1ejmKE' \
    > test.out 2>&1
eval_tap $? 208 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 209 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'po8jCEP6' \
    --clientId 'Fh6Rgi28' \
    --redirectUri 'g4U0k7E7' \
    --requestId 'aKcZzEyY' \
    > test.out 2>&1
eval_tap $? 209 'AuthCodeRequestV3' test.out

#- 210 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'Wn5GLz75' \
    --clientId '6dXhaQuD' \
    --createHeadless  \
    --deviceId 'LUWhmlPE' \
    --platformToken 'cj4dMJ3Q' \
    > test.out 2>&1
eval_tap $? 210 'PlatformTokenGrantV3' test.out

#- 211 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 211 'GetRevocationListV3' test.out

#- 212 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'EkJ8ARHY' \
    > test.out 2>&1
eval_tap $? 212 'TokenRevocationV3' test.out

#- 213 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'HyLmw1T7' \
    --code 'kU7jNejY' \
    --codeVerifier 'WjSEuFYl' \
    --extendExp  \
    --password '80MdwoyR' \
    --redirectUri '8QLGryy9' \
    --refreshToken 'rMKqWRqX' \
    --username 'QVupUfay' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 213 'TokenGrantV3' test.out

#- 214 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token 'b140JdHn' \
    > test.out 2>&1
eval_tap $? 214 'VerifyTokenV3' test.out

#- 215 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'mKg3CDBB' \
    --code 'YXFInnF1' \
    --error '0PPes3IO' \
    --openidAssocHandle '9GzIMar0' \
    --openidClaimedId 'XQ8EcF8w' \
    --openidIdentity 'WtM8KJr8' \
    --openidMode 'B5cAXeQx' \
    --openidNs 'xbCU921n' \
    --openidOpEndpoint 'VRwUYILQ' \
    --openidResponseNonce 'rSG93Glo' \
    --openidReturnTo 'ECYjcet3' \
    --openidSig 'MInk6UcT' \
    --openidSigned 'YfPW9T9g' \
    --state 'HWucz9mn' \
    > test.out 2>&1
eval_tap $? 215 'PlatformAuthenticationV3' test.out

#- 216 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode '0TRCV9jw' \
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
    --clientId 'USlBAfTV' \
    > test.out 2>&1
eval_tap $? 218 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 219 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BOpEuoRA' \
    --body '{"platformUserIds": ["MNG9xewi", "Kc8NgOpy", "Uke81Vxb"]}' \
    > test.out 2>&1
eval_tap $? 219 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 220 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '7SQsgqO1' \
    --platformUserId 'RrOzn04j' \
    > test.out 2>&1
eval_tap $? 220 'PublicGetUserByPlatformUserIDV3' test.out

#- 221 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'PdaIrh5y' \
    > test.out 2>&1
eval_tap $? 221 'PublicGetAsyncStatus' test.out

#- 222 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '5Jd8CePy' \
    --limit '97' \
    --offset '9' \
    --query '6gTppeav' \
    > test.out 2>&1
eval_tap $? 222 'PublicSearchUserV3' test.out

#- 223 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "PYh58VIu", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "NT9eTodI", "policyId": "EghQd0kP", "policyVersionId": "Hj34m2yw"}, {"isAccepted": false, "localizedPolicyVersionId": "4qzztK5L", "policyId": "JLBoMWj9", "policyVersionId": "dcYSBYPc"}, {"isAccepted": false, "localizedPolicyVersionId": "ViqCwHbg", "policyId": "8jajJGFd", "policyVersionId": "03iyIjiW"}], "authType": "SjdeMLFA", "code": "eM5iSsFJ", "country": "eIuzQJ6C", "dateOfBirth": "1bSuITTL", "displayName": "0JY10Gpr", "emailAddress": "OZl7JNbj", "password": "4QO6hwo1", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 223 'PublicCreateUserV3' test.out

#- 224 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field '77CgK3v8' \
    --query '7tBZChJR' \
    > test.out 2>&1
eval_tap $? 224 'CheckUserAvailability' test.out

#- 225 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["s3xSm5lw", "PrC3Xuvx", "qKCuC9cw"]}' \
    > test.out 2>&1
eval_tap $? 225 'PublicBulkGetUsers' test.out

#- 226 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "3zQ8U22U", "languageTag": "ttYb5uVA"}' \
    > test.out 2>&1
eval_tap $? 226 'PublicSendRegistrationCode' test.out

#- 227 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "HJHEPGNT", "emailAddress": "TCsC9puf"}' \
    > test.out 2>&1
eval_tap $? 227 'PublicVerifyRegistrationCode' test.out

#- 228 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "mtLPWLHj", "languageTag": "PIDY81DS"}' \
    > test.out 2>&1
eval_tap $? 228 'PublicForgotPasswordV3' test.out

#- 229 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'qlnR9UaI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 229 'GetAdminInvitationV3' test.out

#- 230 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'Seicc2WQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "3CdvB6jl", "policyId": "NsLHzKzI", "policyVersionId": "bLgg6EO2"}, {"isAccepted": true, "localizedPolicyVersionId": "LgajqPNu", "policyId": "kXvKorzx", "policyVersionId": "uom48JBV"}, {"isAccepted": true, "localizedPolicyVersionId": "siRk6b2d", "policyId": "HIEEu1Iq", "policyVersionId": "tw2vEADb"}], "authType": "EMAILPASSWD", "country": "LlB77l7r", "dateOfBirth": "vKKCefN0", "displayName": "I8ximyb2", "password": "q7klZnbD", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 230 'CreateUserFromInvitationV3' test.out

#- 231 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "I0c7d0wY", "country": "X71yJTfj", "dateOfBirth": "09A77Nsz", "displayName": "hRXHqv6F", "languageTag": "1YR4VODl", "userName": "LpQS3gpd"}' \
    > test.out 2>&1
eval_tap $? 231 'UpdateUserV3' test.out

#- 232 PublicPartialUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicPartialUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "hmCYYFXl", "country": "xBpspoLd", "dateOfBirth": "3MBkhTl9", "displayName": "InI8ptMd", "languageTag": "d0eSQ4Jf", "userName": "MUMMJEdR"}' \
    > test.out 2>&1
eval_tap $? 232 'PublicPartialUpdateUserV3' test.out

#- 233 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "0lv162aD", "emailAddress": "eW2IN2Sc", "languageTag": "d7BxYXlm"}' \
    > test.out 2>&1
eval_tap $? 233 'PublicSendVerificationCodeV3' test.out

#- 234 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "324wr0eH", "contactType": "OemJD0cR", "languageTag": "k5H5TrMZ", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 234 'PublicUserVerificationV3' test.out

#- 235 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "cOYBzsFL", "country": "2rOtyvmv", "dateOfBirth": "Jgy5DeiN", "displayName": "hsrRwNzT", "emailAddress": "oHu4tBGN", "password": "ZZXSPoSw", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 235 'PublicUpgradeHeadlessAccountV3' test.out

#- 236 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "sRuRI43P", "password": "IBNnOQ2I"}' \
    > test.out 2>&1
eval_tap $? 236 'PublicVerifyHeadlessAccountV3' test.out

#- 237 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "X5YNZjaK", "newPassword": "4F539bJN", "oldPassword": "zDqF84rF"}' \
    > test.out 2>&1
eval_tap $? 237 'PublicUpdatePasswordV3' test.out

#- 238 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'OcJiCKoy' \
    > test.out 2>&1
eval_tap $? 238 'PublicCreateJusticeUser' test.out

#- 239 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WhLApPPk' \
    --redirectUri 'FXIMMlx9' \
    --ticket '2Xd70KKK' \
    > test.out 2>&1
eval_tap $? 239 'PublicPlatformLinkV3' test.out

#- 240 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'B5Ru6Vh8' \
    --body '{"platformNamespace": "8CKU6CjK"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicPlatformUnlinkV3' test.out

#- 241 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2rEsqBnw' \
    > test.out 2>&1
eval_tap $? 241 'PublicPlatformUnlinkAllV3' test.out

#- 242 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'b7XNfhNk' \
    --clientId 'oABMcNhd' \
    --redirectUri 'ZZQdCZpP' \
    > test.out 2>&1
eval_tap $? 242 'PublicWebLinkPlatform' test.out

#- 243 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'X1Tu5lFI' \
    --state 'q2YrFrBa' \
    > test.out 2>&1
eval_tap $? 243 'PublicWebLinkPlatformEstablish' test.out

#- 244 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "D6Fd3Y7p", "emailAddress": "eepyEjjp", "newPassword": "SJisPjyo"}' \
    > test.out 2>&1
eval_tap $? 244 'ResetPasswordV3' test.out

#- 245 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jYpfeJxd' \
    > test.out 2>&1
eval_tap $? 245 'PublicGetUserByUserIdV3' test.out

#- 246 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yU13Kz0M' \
    --activeOnly  \
    --after '8cbDq4w7' \
    --before '4ogBaqNH' \
    --limit '26' \
    > test.out 2>&1
eval_tap $? 246 'PublicGetUserBanHistoryV3' test.out

#- 247 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iXWl0UdM' \
    > test.out 2>&1
eval_tap $? 247 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 248 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KOd4ANsG' \
    --after '0.013441010936730557' \
    --before '0.16745725149555923' \
    --limit '30' \
    > test.out 2>&1
eval_tap $? 248 'PublicGetUserLoginHistoriesV3' test.out

#- 249 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ki3FiWgP' \
    --after 'B7OrWnMc' \
    --before 'EXxQXDBL' \
    --limit '7' \
    > test.out 2>&1
eval_tap $? 249 'PublicGetUserPlatformAccountsV3' test.out

#- 250 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'UoyFWfPV' \
    --body '{"platformId": "okKatsMW", "platformUserId": "29Q8z2Eo"}' \
    > test.out 2>&1
eval_tap $? 250 'PublicLinkPlatformAccount' test.out

#- 251 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '3CveWu7o' \
    --body '{"chosenNamespaces": ["x7aQXSej", "1nN6XvHL", "VTwd46cV"], "requestId": "jmAWjuZw"}' \
    > test.out 2>&1
eval_tap $? 251 'PublicForceLinkPlatformWithProgression' test.out

#- 252 PublicGetPublisherUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetPublisherUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xwFJP7Hj' \
    > test.out 2>&1
eval_tap $? 252 'PublicGetPublisherUserV3' test.out

#- 253 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lh9ULR5f' \
    --password 'McCyYluU' \
    > test.out 2>&1
eval_tap $? 253 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 254 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after '16CPPGjf' \
    --before 'xw1gshdL' \
    --isWildcard  \
    --limit '4' \
    > test.out 2>&1
eval_tap $? 254 'PublicGetRolesV3' test.out

#- 255 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'ih8nkaZq' \
    > test.out 2>&1
eval_tap $? 255 'PublicGetRoleV3' test.out

#- 256 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 256 'PublicGetMyUserV3' test.out

#- 257 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'leC40zSv' \
    --code 'q0EeKOuB' \
    --error 'OvRCCVPV' \
    --state 'Z1RaMBE5' \
    > test.out 2>&1
eval_tap $? 257 'PlatformAuthenticateSAMLV3Handler' test.out

#- 258 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'VNHIAIfF' \
    --payload '9s0sI8H8' \
    > test.out 2>&1
eval_tap $? 258 'LoginSSOClient' test.out

#- 259 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'ofnCxMbl' \
    > test.out 2>&1
eval_tap $? 259 'LogoutSSOClient' test.out

#- 260 AdminCreateTestUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateTestUsersV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 2}' \
    > test.out 2>&1
eval_tap $? 260 'AdminCreateTestUsersV4' test.out

#- 261 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["J5zT2rir", "sDnLU1CF", "tjYRKXI5"]}' \
    > test.out 2>&1
eval_tap $? 261 'AdminBulkCheckValidUserIDV4' test.out

#- 262 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tOYCTqNE' \
    --body '{"avatarUrl": "TnIMgmI0", "country": "6N2XSq7S", "dateOfBirth": "MFbyFyOu", "displayName": "EcYhBinE", "languageTag": "KrgLGmNM", "userName": "aBv00Yi7"}' \
    > test.out 2>&1
eval_tap $? 262 'AdminUpdateUserV4' test.out

#- 263 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yd2ptFWQ' \
    --body '{"code": "9Nr1msRo", "emailAddress": "IoKmv4Pg"}' \
    > test.out 2>&1
eval_tap $? 263 'AdminUpdateUserEmailAddressV4' test.out

#- 264 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '3ZvziH5l' \
    > test.out 2>&1
eval_tap $? 264 'AdminDisableUserMFAV4' test.out

#- 265 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yydGa8IO' \
    > test.out 2>&1
eval_tap $? 265 'AdminListUserRolesV4' test.out

#- 266 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UWfMjIQC' \
    --body '{"assignedNamespaces": ["2VEDPDhj", "zbmoGIG6", "QSctoJh5"], "roleId": "hUoKTXQe"}' \
    > test.out 2>&1
eval_tap $? 266 'AdminUpdateUserRoleV4' test.out

#- 267 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'x1KUqosw' \
    --body '{"assignedNamespaces": ["5AUoz6ar", "1zBSBp2v", "FCi1SuXr"], "roleId": "bb6fCb1I"}' \
    > test.out 2>&1
eval_tap $? 267 'AdminAddUserRoleV4' test.out

#- 268 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'u870Z23o' \
    --body '{"assignedNamespaces": ["oQAEOinF", "R2DfHUwE", "E7Z9EFYK"], "roleId": "1IOeyXBm"}' \
    > test.out 2>&1
eval_tap $? 268 'AdminRemoveUserRoleV4' test.out

#- 269 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '3' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 269 'AdminGetRolesV4' test.out

#- 270 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "Aa1wozly"}' \
    > test.out 2>&1
eval_tap $? 270 'AdminCreateRoleV4' test.out

#- 271 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId '8LR9GRVb' \
    > test.out 2>&1
eval_tap $? 271 'AdminGetRoleV4' test.out

#- 272 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'IyOEP4vK' \
    > test.out 2>&1
eval_tap $? 272 'AdminDeleteRoleV4' test.out

#- 273 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'pb0jQccK' \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "roleName": "UXBIGA3J"}' \
    > test.out 2>&1
eval_tap $? 273 'AdminUpdateRoleV4' test.out

#- 274 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'dpcN2aD5' \
    --body '{"permissions": [{"action": 92, "resource": "jVyiTXD6", "schedAction": 16, "schedCron": "OmzQqh4F", "schedRange": ["VV5Y3OEe", "oj22nvqB", "O34PaYFP"]}, {"action": 54, "resource": "mV5t2jUd", "schedAction": 23, "schedCron": "gbYmX6EC", "schedRange": ["5ZMYJRxE", "ffDAork6", "xccoop8u"]}, {"action": 73, "resource": "CdldNy54", "schedAction": 21, "schedCron": "mIswXgmg", "schedRange": ["Uxseq0HW", "HC0MtijS", "VCRdc1rZ"]}]}' \
    > test.out 2>&1
eval_tap $? 274 'AdminUpdateRolePermissionsV4' test.out

#- 275 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'JlaYM5oO' \
    --body '{"permissions": [{"action": 63, "resource": "UDbFYYnX", "schedAction": 30, "schedCron": "S7Vf05aI", "schedRange": ["nd820RV0", "uIRrWfYP", "qYIyIfgH"]}, {"action": 15, "resource": "nlhSQB5v", "schedAction": 52, "schedCron": "cPDwD4AA", "schedRange": ["fuhWYRaR", "awe2pOwZ", "8zThyL3a"]}, {"action": 22, "resource": "hNC1k5yf", "schedAction": 20, "schedCron": "33kN2saM", "schedRange": ["0TNLE5pb", "RmaWkSjV", "nSqC2yce"]}]}' \
    > test.out 2>&1
eval_tap $? 275 'AdminAddRolePermissionsV4' test.out

#- 276 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId '8wqh2bOa' \
    --body '["A4Qh3OMs", "mDfYaPX8", "GgZqqvic"]' \
    > test.out 2>&1
eval_tap $? 276 'AdminDeleteRolePermissionsV4' test.out

#- 277 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'z7thB0P5' \
    --after 'tXUTYkI9' \
    --before 'l6I8gxpE' \
    --limit '38' \
    > test.out 2>&1
eval_tap $? 277 'AdminListAssignedUsersV4' test.out

#- 278 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'UUCsOcE7' \
    --body '{"assignedNamespaces": ["D0UV4ZTe", "yJyjVR3G", "mkHpSgFq"], "namespace": "eeluzqu1", "userId": "aCA7Pu1g"}' \
    > test.out 2>&1
eval_tap $? 278 'AdminAssignUserToRoleV4' test.out

#- 279 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'aVRzdjMm' \
    --body '{"namespace": "6TS9ZbwW", "userId": "bRsoP9p2"}' \
    > test.out 2>&1
eval_tap $? 279 'AdminRevokeUserFromRoleV4' test.out

#- 280 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "i3LnWpcU", "country": "jwZjuKMK", "dateOfBirth": "NLoBDNim", "displayName": "dHPNL3BK", "languageTag": "eVP0Pkdb", "userName": "G2OcUe3w"}' \
    > test.out 2>&1
eval_tap $? 280 'AdminUpdateMyUserV4' test.out

#- 281 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 281 'AdminDisableMyAuthenticatorV4' test.out

#- 282 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'qQiw4M4Z' \
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
    --factor 'ZEaH8VMA' \
    > test.out 2>&1
eval_tap $? 290 'AdminMakeFactorMyDefaultV4' test.out

#- 291 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["qXDHPwGp", "uOUzk2wg", "xxQK0GKJ"], "emailAddresses": ["oOf0PB8R", "JzNbtytT", "TCa1UOjD"], "isAdmin": false, "roleId": "sylDNNbI"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminInviteUserV4' test.out

#- 292 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "hP2fYMA5", "policyId": "foJzT7Ye", "policyVersionId": "nRZKYbPZ"}, {"isAccepted": false, "localizedPolicyVersionId": "nE9w9EmE", "policyId": "SHnwxxMp", "policyVersionId": "5Oum9RQj"}, {"isAccepted": false, "localizedPolicyVersionId": "lxkkMz5a", "policyId": "lxZJwshq", "policyVersionId": "knmbQtrq"}], "authType": "EMAILPASSWD", "country": "NP0uFGzX", "dateOfBirth": "mATYvlKM", "displayName": "RmUhcz1m", "emailAddress": "iSnar8cW", "password": "ksHl5EzI", "passwordMD5Sum": "DrTWmfqf", "username": "n2jH1D1U", "verified": false}' \
    > test.out 2>&1
eval_tap $? 292 'PublicCreateTestUserV4' test.out

#- 293 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "iJPBNT2p", "policyId": "NzPLoiSx", "policyVersionId": "TkUjRWy3"}, {"isAccepted": true, "localizedPolicyVersionId": "FvXw6A7D", "policyId": "pxPCnXGu", "policyVersionId": "UAHS3Y6O"}, {"isAccepted": false, "localizedPolicyVersionId": "tfnhmfuc", "policyId": "qVrnVUoS", "policyVersionId": "htdOf9s6"}], "authType": "EMAILPASSWD", "code": "3Qyrifs3", "country": "dr9wXcd4", "dateOfBirth": "bkk5fiJg", "displayName": "5dKUTWbW", "emailAddress": "Iqzhmnpm", "password": "n1DVgboU", "passwordMD5Sum": "cSaqXZbz", "reachMinimumAge": false, "username": "1aQPVN0Y"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicCreateUserV4' test.out

#- 294 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'otDcigaa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "uCpod3f3", "policyId": "H3C9T4XI", "policyVersionId": "iOyxAl4B"}, {"isAccepted": true, "localizedPolicyVersionId": "oFl1qGqi", "policyId": "4FUfQewG", "policyVersionId": "WKLE4Msw"}, {"isAccepted": false, "localizedPolicyVersionId": "3wEyfkjc", "policyId": "kZA0Pz5a", "policyVersionId": "Jr0fnuyA"}], "authType": "EMAILPASSWD", "country": "o3OTmPO9", "dateOfBirth": "BfMxs3wE", "displayName": "w2AJM23k", "password": "Rn1KmiMx", "reachMinimumAge": false, "username": "HEnD9pzz"}' \
    > test.out 2>&1
eval_tap $? 294 'CreateUserFromInvitationV4' test.out

#- 295 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "AWkik7cQ", "country": "fSjt2NwQ", "dateOfBirth": "aOuZPqDC", "displayName": "Y433m8v6", "languageTag": "KjqFcNuC", "userName": "m2ndizbu"}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUpdateUserV4' test.out

#- 296 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "jWieEgWe", "emailAddress": "cqpHKcZf"}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpdateUserEmailAddressV4' test.out

#- 297 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "seW67v9k", "country": "fDYTaXyx", "dateOfBirth": "Px8Ahoj9", "displayName": "xMJ1YVpi", "emailAddress": "FE6bnF84", "password": "dbT8Omol", "reachMinimumAge": false, "username": "a1cjafZb", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 297 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 298 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "ntFoKvO2", "password": "rhjh88T2", "username": "C0Nq36p9"}' \
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
    --code 'srd93hcO' \
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
    --deviceToken 'CkgNj69B' \
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
    --factor 'ixcaaxFK' \
    > test.out 2>&1
eval_tap $? 309 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE