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
echo "1..307"

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
./ng net.accelbyte.sdk.cli.Main iam createUser \
    --namespace "$AB_NAMESPACE" \
    --body '{"AuthType": "ArovP62I", "Country": "XmlbyQVK", "DisplayName": "ZcpYJe8V", "LoginId": "OY4c8ZoC", "Password": "SyxoYcqe", "PasswordMD5Sum": "rp9oBxJJ"}' \
    > test.out 2>&1
eval_tap $? 16 'CreateUser' test.out

#- 17 GetAdminUsersByRoleID
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleID \
    --namespace "$AB_NAMESPACE" \
    --after '11' \
    --before '40' \
    --limit '71' \
    --roleId 'huRmC8b0' \
    > test.out 2>&1
eval_tap $? 17 'GetAdminUsersByRoleID' test.out

#- 18 GetUserByLoginID
./ng net.accelbyte.sdk.cli.Main iam getUserByLoginID \
    --namespace "$AB_NAMESPACE" \
    --loginId 'OwrgYZki' \
    > test.out 2>&1
eval_tap $? 18 'GetUserByLoginID' test.out

#- 19 GetUserByPlatformUserID
./ng net.accelbyte.sdk.cli.Main iam getUserByPlatformUserID \
    --namespace "$AB_NAMESPACE" \
    --platformID 'zNvDlLVc' \
    --platformUserID 'lDldreCU' \
    > test.out 2>&1
eval_tap $? 19 'GetUserByPlatformUserID' test.out

#- 20 ForgotPassword
./ng net.accelbyte.sdk.cli.Main iam forgotPassword \
    --namespace "$AB_NAMESPACE" \
    --body '{"Context": "vep2YYeV", "LanguageTag": "3VHhH8ed", "LoginID": "CggN7J6n"}' \
    > test.out 2>&1
eval_tap $? 20 'ForgotPassword' test.out

#- 21 GetUsersByLoginIds
./ng net.accelbyte.sdk.cli.Main iam getUsersByLoginIds \
    --namespace "$AB_NAMESPACE" \
    --loginIds 'ChuYbiqT' \
    > test.out 2>&1
eval_tap $? 21 'GetUsersByLoginIds' test.out

#- 22 ResetPassword
./ng net.accelbyte.sdk.cli.Main iam resetPassword \
    --namespace "$AB_NAMESPACE" \
    --body '{"Code": "0IGfQHgP", "LoginID": "P19nRFtt", "NewPassword": "P2avvLSU"}' \
    > test.out 2>&1
eval_tap $? 22 'ResetPassword' test.out

#- 23 SearchUser
eval_tap 0 23 'SearchUser # SKIP deprecated' test.out

#- 24 GetUserByUserID
./ng net.accelbyte.sdk.cli.Main iam getUserByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'rGFjqgeT' \
    > test.out 2>&1
eval_tap $? 24 'GetUserByUserID' test.out

#- 25 UpdateUser
./ng net.accelbyte.sdk.cli.Main iam updateUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'z10wWFSz' \
    --body '{"Country": "fNQeMU0k", "DateOfBirth": "3OuNgfUh", "DisplayName": "bZSXqVIX", "LanguageTag": "nLCHqq8R"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateUser' test.out

#- 26 DeleteUser
./ng net.accelbyte.sdk.cli.Main iam deleteUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'EwsZL6fK' \
    > test.out 2>&1
eval_tap $? 26 'DeleteUser' test.out

#- 27 BanUser
./ng net.accelbyte.sdk.cli.Main iam banUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'aSJAsvC1' \
    --body '{"ban": "Tnp1loN2", "comment": "T10nNp8q", "endDate": "jHSpXJhn", "reason": "28NrRooW", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 27 'BanUser' test.out

#- 28 GetUserBanHistory
./ng net.accelbyte.sdk.cli.Main iam getUserBanHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'iYAOFLMS' \
    > test.out 2>&1
eval_tap $? 28 'GetUserBanHistory' test.out

#- 29 DisableUserBan
./ng net.accelbyte.sdk.cli.Main iam disableUserBan \
    --banId 'uwryaNTR' \
    --namespace "$AB_NAMESPACE" \
    --userId '9znr4hsi' \
    > test.out 2>&1
eval_tap $? 29 'DisableUserBan' test.out

#- 30 EnableUserBan
./ng net.accelbyte.sdk.cli.Main iam enableUserBan \
    --banId 'EzqdPYVb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oVJblTN2' \
    > test.out 2>&1
eval_tap $? 30 'EnableUserBan' test.out

#- 31 ListCrossNamespaceAccountLink
eval_tap 0 31 'ListCrossNamespaceAccountLink # SKIP deprecated' test.out

#- 32 DisableUser
eval_tap 0 32 'DisableUser # SKIP deprecated' test.out

#- 33 EnableUser
eval_tap 0 33 'EnableUser # SKIP deprecated' test.out

#- 34 GetUserInformation
./ng net.accelbyte.sdk.cli.Main iam getUserInformation \
    --namespace "$AB_NAMESPACE" \
    --userId 'SRwfCTaW' \
    > test.out 2>&1
eval_tap $? 34 'GetUserInformation' test.out

#- 35 DeleteUserInformation
./ng net.accelbyte.sdk.cli.Main iam deleteUserInformation \
    --namespace "$AB_NAMESPACE" \
    --userId 'olq03vLc' \
    > test.out 2>&1
eval_tap $? 35 'DeleteUserInformation' test.out

#- 36 GetUserLoginHistories
./ng net.accelbyte.sdk.cli.Main iam getUserLoginHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'trl0qo6K' \
    --after '0.5208038665900475' \
    --before '0.4946427485614334' \
    --limit '68' \
    > test.out 2>&1
eval_tap $? 36 'GetUserLoginHistories' test.out

#- 37 UpdatePassword
eval_tap 0 37 'UpdatePassword # SKIP deprecated' test.out

#- 38 SaveUserPermission
./ng net.accelbyte.sdk.cli.Main iam saveUserPermission \
    --namespace "$AB_NAMESPACE" \
    --userId 'qjMBt6be' \
    --body '{"Permissions": [{"Action": 96, "Resource": "dYqx1aZj", "SchedAction": 64, "SchedCron": "YNdyNYor", "SchedRange": ["4WQuXFHi", "a1dZM4Rk", "hmmYZNLP"]}, {"Action": 83, "Resource": "ZLKzwkWr", "SchedAction": 70, "SchedCron": "5a3ajoHj", "SchedRange": ["ZbE1eN6E", "IsuLwhvR", "ZMrWh2iE"]}, {"Action": 58, "Resource": "nVduUsac", "SchedAction": 76, "SchedCron": "icg8kAPD", "SchedRange": ["q0bHjVQV", "vSksxDMo", "lnhFF8AJ"]}]}' \
    > test.out 2>&1
eval_tap $? 38 'SaveUserPermission' test.out

#- 39 AddUserPermission
./ng net.accelbyte.sdk.cli.Main iam addUserPermission \
    --action '6' \
    --namespace "$AB_NAMESPACE" \
    --resource 'CZaXR9a8' \
    --userId 'ff6AJJq0' \
    --body '{"SchedAction": 22, "SchedCron": "j8EHqcW4", "SchedRange": ["Thsu8su6", "NJCS68DF", "LAk8kyVl"]}' \
    > test.out 2>&1
eval_tap $? 39 'AddUserPermission' test.out

#- 40 DeleteUserPermission
./ng net.accelbyte.sdk.cli.Main iam deleteUserPermission \
    --action '100' \
    --namespace "$AB_NAMESPACE" \
    --resource 'ihCOmx88' \
    --userId 'dEPuxKfM' \
    > test.out 2>&1
eval_tap $? 40 'DeleteUserPermission' test.out

#- 41 GetUserPlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam getUserPlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'vKMYtfIu' \
    > test.out 2>&1
eval_tap $? 41 'GetUserPlatformAccounts' test.out

#- 42 GetUserMapping
./ng net.accelbyte.sdk.cli.Main iam getUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'NkJf56FI' \
    --userId 'rVaRmPLv' \
    > test.out 2>&1
eval_tap $? 42 'GetUserMapping' test.out

#- 43 GetUserJusticePlatformAccount
eval_tap 0 43 'GetUserJusticePlatformAccount # SKIP deprecated' test.out

#- 44 PlatformLink
./ng net.accelbyte.sdk.cli.Main iam platformLink \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BPCEfUBi' \
    --userId 'LCbBwOOV' \
    --ticket 'pJuUik6n' \
    > test.out 2>&1
eval_tap $? 44 'PlatformLink' test.out

#- 45 PlatformUnlink
./ng net.accelbyte.sdk.cli.Main iam platformUnlink \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DX51HJnQ' \
    --userId 'tXBeRp13' \
    --platformNamespace 'j5mMrlZp' \
    > test.out 2>&1
eval_tap $? 45 'PlatformUnlink' test.out

#- 46 GetPublisherUser
./ng net.accelbyte.sdk.cli.Main iam getPublisherUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wqo9JX3n' \
    > test.out 2>&1
eval_tap $? 46 'GetPublisherUser' test.out

#- 47 SaveUserRoles
./ng net.accelbyte.sdk.cli.Main iam saveUserRoles \
    --namespace "$AB_NAMESPACE" \
    --userId 'LpqPYiLW' \
    --body '["pjEGzH4K", "zRovjRGv", "vYGtchmB"]' \
    > test.out 2>&1
eval_tap $? 47 'SaveUserRoles' test.out

#- 48 AddUserRole
./ng net.accelbyte.sdk.cli.Main iam addUserRole \
    --namespace "$AB_NAMESPACE" \
    --roleId '8tMzlsdv' \
    --userId 'BrolE9nD' \
    > test.out 2>&1
eval_tap $? 48 'AddUserRole' test.out

#- 49 DeleteUserRole
./ng net.accelbyte.sdk.cli.Main iam deleteUserRole \
    --namespace "$AB_NAMESPACE" \
    --roleId 'O4tZoTxM' \
    --userId 'qUDHbUAo' \
    > test.out 2>&1
eval_tap $? 49 'DeleteUserRole' test.out

#- 50 UpgradeHeadlessAccount
./ng net.accelbyte.sdk.cli.Main iam upgradeHeadlessAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'FRnmznxR' \
    --body '{"LoginID": "GQiUNmCt", "Password": "A2MfCFni"}' \
    > test.out 2>&1
eval_tap $? 50 'UpgradeHeadlessAccount' test.out

#- 51 UpgradeHeadlessAccountWithVerificationCode
./ng net.accelbyte.sdk.cli.Main iam upgradeHeadlessAccountWithVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'PSeBMxEb' \
    --body '{"Code": "vVdRqv1U", "Password": "GdDCxZu6", "loginId": "Gdu27UtQ"}' \
    > test.out 2>&1
eval_tap $? 51 'UpgradeHeadlessAccountWithVerificationCode' test.out

#- 52 UserVerification
./ng net.accelbyte.sdk.cli.Main iam userVerification \
    --namespace "$AB_NAMESPACE" \
    --userId 'BMX6SVss' \
    --body '{"Code": "I1pf7Jyx", "ContactType": "Gyk1icsv", "LanguageTag": "8ndMnWLE", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 52 'UserVerification' test.out

#- 53 SendVerificationCode
./ng net.accelbyte.sdk.cli.Main iam sendVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'lubf73dX' \
    --body '{"Context": "rAEDgIA7", "LanguageTag": "xGv0aPgj", "LoginID": "D5GGnPLh"}' \
    > test.out 2>&1
eval_tap $? 53 'SendVerificationCode' test.out

#- 54 Authorization
./ng net.accelbyte.sdk.cli.Main iam authorization \
    --login 'WohmH6Of' \
    --password 'jjB1YX2S' \
    --scope 'jJD0d5hA' \
    --state 'sgWYFkcQ' \
    --clientId 'FsNmcvBU' \
    --redirectUri 'JZa1MLkd' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 54 'Authorization' test.out

#- 55 GetJWKS
./ng net.accelbyte.sdk.cli.Main iam getJWKS \
    > test.out 2>&1
eval_tap $? 55 'GetJWKS' test.out

#- 56 PlatformTokenRequestHandler
./ng net.accelbyte.sdk.cli.Main iam platformTokenRequestHandler \
    --namespace "$AB_NAMESPACE" \
    --platformId 'oM8kw6rY' \
    --deviceId 'lyAKP6cU' \
    --platformToken 'bb8q8qAd' \
    > test.out 2>&1
eval_tap $? 56 'PlatformTokenRequestHandler' test.out

#- 57 RevokeUser
./ng net.accelbyte.sdk.cli.Main iam revokeUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'n7Zps5CK' \
    > test.out 2>&1
eval_tap $? 57 'RevokeUser' test.out

#- 58 GetRevocationList
./ng net.accelbyte.sdk.cli.Main iam getRevocationList \
    > test.out 2>&1
eval_tap $? 58 'GetRevocationList' test.out

#- 59 RevokeToken
./ng net.accelbyte.sdk.cli.Main iam revokeToken \
    --token 'm4pu4pS3' \
    > test.out 2>&1
eval_tap $? 59 'RevokeToken' test.out

#- 60 RevokeAUser
./ng net.accelbyte.sdk.cli.Main iam revokeAUser \
    --userID 'AhLy9MDO' \
    > test.out 2>&1
eval_tap $? 60 'RevokeAUser' test.out

#- 61 TokenGrant
./ng net.accelbyte.sdk.cli.Main iam tokenGrant \
    --code 'Ui0PZQtD' \
    --extendExp  \
    --namespace "$AB_NAMESPACE" \
    --password 'dPOJiVLN' \
    --redirectUri '6CkMijP9' \
    --refreshToken 't1rtg0F9' \
    --username 'gkNTqx1Y' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 61 'TokenGrant' test.out

#- 62 VerifyToken
./ng net.accelbyte.sdk.cli.Main iam verifyToken \
    --token 'VzjvxjP4' \
    > test.out 2>&1
eval_tap $? 62 'VerifyToken' test.out

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
    --body '{"AgeRestriction": 93, "Enable": true}' \
    > test.out 2>&1
eval_tap $? 81 'AdminUpdateAgeRestrictionConfigV2' test.out

#- 82 GetListCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam getListCountryAgeRestriction \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'GetListCountryAgeRestriction' test.out

#- 83 UpdateCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam updateCountryAgeRestriction \
    --countryCode 'QN5Hl4j8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"AgeRestriction": 88}' \
    > test.out 2>&1
eval_tap $? 83 'UpdateCountryAgeRestriction' test.out

#- 84 AdminSearchUsersV2
./ng net.accelbyte.sdk.cli.Main iam adminSearchUsersV2 \
    --namespace "$AB_NAMESPACE" \
    --after '2623z0Yb' \
    --before 'LrIqMTA3' \
    --displayName 'UXDD0Y9Q' \
    --limit '21' \
    --loginId 'SZjIrmV1' \
    --platformUserId 'iiZ2Gl2N' \
    --roleId 'ND6Tv5fC' \
    --userId 'Y4eBJC0A' \
    --platformId 'NC7dpa5G' \
    > test.out 2>&1
eval_tap $? 84 'AdminSearchUsersV2' test.out

#- 85 AdminGetUserByUserIdV2
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iqN1ZNRL' \
    > test.out 2>&1
eval_tap $? 85 'AdminGetUserByUserIdV2' test.out

#- 86 AdminUpdateUserV2
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '5e6Hizso' \
    --body '{"Country": "ZbwDHaaL", "DateOfBirth": "UlIVxvtj", "DisplayName": "JioGNjCE", "LanguageTag": "61lNVn6i"}' \
    > test.out 2>&1
eval_tap $? 86 'AdminUpdateUserV2' test.out

#- 87 AdminBanUserV2
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '6JfSlo0G' \
    --body '{"ban": "yzWSY66z", "comment": "FBlVJXnS", "endDate": "X89sWIuQ", "reason": "eeUcaNEj", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 87 'AdminBanUserV2' test.out

#- 88 AdminGetUserBanV2
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aPqsizZg' \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 88 'AdminGetUserBanV2' test.out

#- 89 AdminDisableUserV2
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sAK7Flxc' \
    --body '{"Reason": "LCxx4JCe"}' \
    > test.out 2>&1
eval_tap $? 89 'AdminDisableUserV2' test.out

#- 90 AdminEnableUserV2
./ng net.accelbyte.sdk.cli.Main iam adminEnableUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'faxbE6mD' \
    > test.out 2>&1
eval_tap $? 90 'AdminEnableUserV2' test.out

#- 91 AdminResetPasswordV2
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '5gILnsUb' \
    --body '{"LanguageTag": "BKlddMiL", "NewPassword": "ZCZl0wu7", "OldPassword": "zyhuLeSl"}' \
    > test.out 2>&1
eval_tap $? 91 'AdminResetPasswordV2' test.out

#- 92 AdminDeletePlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam adminDeletePlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'BEkz8jcV' \
    --userId 'cDNKbzRQ' \
    --platformNamespace 'cEDnDlJ7' \
    > test.out 2>&1
eval_tap $? 92 'AdminDeletePlatformLinkV2' test.out

#- 93 AdminPutUserRolesV2
./ng net.accelbyte.sdk.cli.Main iam adminPutUserRolesV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tlXZ6Fjp' \
    --body '["V8uflIZh", "SuyoUkCf", "NzTF4bHX"]' \
    > test.out 2>&1
eval_tap $? 93 'AdminPutUserRolesV2' test.out

#- 94 AdminCreateUserRolesV2
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserRolesV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'duyJqC5g' \
    --body '["BOtNR2AM", "4iIY9Jq5", "okA7IbpJ"]' \
    > test.out 2>&1
eval_tap $? 94 'AdminCreateUserRolesV2' test.out

#- 95 PublicGetCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestriction \
    --countryCode 'xs7LmNIK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'PublicGetCountryAgeRestriction' test.out

#- 96 PublicCreateUserV2
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"AuthType": "iTZSJTWY", "Country": "5Us7xlS8", "DisplayName": "tC39kkol", "LoginId": "x6O5dUMQ", "Password": "pyY89jrd", "PasswordMD5Sum": "v7kjCw0y"}' \
    > test.out 2>&1
eval_tap $? 96 'PublicCreateUserV2' test.out

#- 97 PublicForgotPasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"Context": "awxqNqkS", "LanguageTag": "miQ2jn5d", "LoginID": "IbtLvqcr"}' \
    > test.out 2>&1
eval_tap $? 97 'PublicForgotPasswordV2' test.out

#- 98 PublicResetPasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicResetPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"Code": "3LfE2wll", "LoginID": "9h7ULKRN", "NewPassword": "fGxove4t"}' \
    > test.out 2>&1
eval_tap $? 98 'PublicResetPasswordV2' test.out

#- 99 PublicGetUserByUserIDV2
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FdqOaad8' \
    > test.out 2>&1
eval_tap $? 99 'PublicGetUserByUserIDV2' test.out

#- 100 PublicUpdateUserV2
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TRc6xN4Z' \
    --body '{"Country": "a4zeoGS7", "DateOfBirth": "TW9J9upW", "DisplayName": "bkx4p4jV", "LanguageTag": "jLSACyhg"}' \
    > test.out 2>&1
eval_tap $? 100 'PublicUpdateUserV2' test.out

#- 101 PublicGetUserBan
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBan \
    --namespace "$AB_NAMESPACE" \
    --userId 'YYUbhfIT' \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 101 'PublicGetUserBan' test.out

#- 102 PublicUpdatePasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '7eR0vxEF' \
    --body '{"LanguageTag": "g0LAP0Ve", "NewPassword": "OkGDrHql", "OldPassword": "WcHywIfX"}' \
    > test.out 2>&1
eval_tap $? 102 'PublicUpdatePasswordV2' test.out

#- 103 GetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam getListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '3YHNnWlq' \
    > test.out 2>&1
eval_tap $? 103 'GetListJusticePlatformAccounts' test.out

#- 104 PublicPlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId '2PYztA1o' \
    --userId 'Z4sCXutH' \
    --ticket 'Fl7iH0rt' \
    > test.out 2>&1
eval_tap $? 104 'PublicPlatformLinkV2' test.out

#- 105 PublicDeletePlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam publicDeletePlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XrmVlSkR' \
    --userId 'nvmo2zyQ' \
    --platformNamespace 'JqrryZfg' \
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
    --body '[{"field": "eBWfGBVZ", "validation": {"allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "description": [{"language": "i0JhbP6V", "message": ["wM9dIEbE", "MmbAJseu", "kTsOUjwA"]}, {"language": "6xBH6yW9", "message": ["zwrEw2Eo", "s5xwQqjO", "i3cX9R1d"]}, {"language": "JUOTcuGC", "message": ["PjFxlKkb", "VJ30IIsY", "Nl9MpMmz"]}], "isCustomRegex": true, "letterCase": "osNrE6uD", "maxLength": 76, "maxRepeatingAlphaNum": 13, "maxRepeatingSpecialCharacter": 46, "minCharType": 81, "minLength": 33, "regex": "2m287zVw", "specialCharacterLocation": "OArLICwl", "specialCharacters": ["zsuMM9LR", "DZRFLv2J", "kKwlID6C"]}}, {"field": "EVybzmZy", "validation": {"allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "description": [{"language": "kKlhv2CH", "message": ["dyzOVNzS", "8bXrfumL", "ANbZBe7a"]}, {"language": "lBSv4eh6", "message": ["vMXoxpVe", "tWoaeEst", "6Xzg5AUG"]}, {"language": "LCG4wWcu", "message": ["DFWWWsmb", "ZuNtebIi", "sXIzawnp"]}], "isCustomRegex": false, "letterCase": "34vcJv9T", "maxLength": 24, "maxRepeatingAlphaNum": 64, "maxRepeatingSpecialCharacter": 71, "minCharType": 65, "minLength": 3, "regex": "zin9A5sH", "specialCharacterLocation": "mhzhA4Ei", "specialCharacters": ["FiZ3CBHc", "pRO5aBeh", "M29hr1WW"]}}, {"field": "qsLTXbNv", "validation": {"allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "description": [{"language": "bXcsZ1zH", "message": ["ZGIxHeL8", "dRrnHyhs", "DhOsjqdY"]}, {"language": "aKpT5zGX", "message": ["Wc4A7eCx", "8XMzvgzz", "TdMdVMtN"]}, {"language": "XTbyj7cv", "message": ["0i5WDjRU", "lQZm6gyr", "b7gCLrCv"]}], "isCustomRegex": false, "letterCase": "77MdOPvA", "maxLength": 7, "maxRepeatingAlphaNum": 5, "maxRepeatingSpecialCharacter": 58, "minCharType": 64, "minLength": 89, "regex": "H9xNayof", "specialCharacterLocation": "MTk5YV5a", "specialCharacters": ["jHO6UUEc", "dYfe6gNZ", "mCKexWSw"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'qm31Oljo' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after '1V9rrCeC' \
    --before 'hIuTRldW' \
    --limit '61' \
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
    --body '{"ageRestriction": 20, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'l50L0d5s' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 35}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'msE0zdvA' \
    --limit '96' \
    --offset '3' \
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
    --limit '64' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 118 'AdminGetClientsByNamespaceV3' test.out

#- 119 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["5c8wFewL", "tvWck7Mx", "ZqhLxGAr"], "baseUri": "ujNJC3Pm", "clientId": "sGodHnQz", "clientName": "G77lGOHa", "clientPermissions": [{"action": 51, "resource": "MHYZuaYS", "schedAction": 55, "schedCron": "IrQXvHPq", "schedRange": ["A5SmAMGQ", "zqgi1MZw", "NB0YSz7l"]}, {"action": 7, "resource": "1P6FpP52", "schedAction": 18, "schedCron": "UFiEFopU", "schedRange": ["21Tp9SRe", "fr1X6AT2", "62YTiOJ7"]}, {"action": 54, "resource": "nOtoOoJk", "schedAction": 41, "schedCron": "iXV2erMB", "schedRange": ["vewlqKTz", "gCbYNag5", "1ghtur04"]}], "clientPlatform": "PIOxdtLt", "deletable": true, "namespace": "Uex3O7jd", "oauthClientType": "aF2NSKKP", "redirectUri": "TnT0cPUd", "secret": "6JW9qlMC"}' \
    > test.out 2>&1
eval_tap $? 119 'AdminCreateClientV3' test.out

#- 120 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'tjnq8dEc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 121 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId '96gj9Hbh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'AdminDeleteClientV3' test.out

#- 122 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'HwVe65cC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["kFeug1W5", "5BwavNQR", "5DEUHddV"], "baseUri": "MpKhLuf5", "clientName": "MmvjvF3N", "clientPermissions": [{"action": 26, "resource": "FQvJFZWy", "schedAction": 43, "schedCron": "xFp8Knvm", "schedRange": ["VwVkBKij", "LajIJcCE", "pRK6PUX6"]}, {"action": 51, "resource": "Ug87adoi", "schedAction": 46, "schedCron": "M58KMWOZ", "schedRange": ["wIH3HTLl", "nkMoL6Zg", "2Ks7GgXw"]}, {"action": 46, "resource": "lT3TR925", "schedAction": 60, "schedCron": "0uznhr48", "schedRange": ["rj93ELnB", "lsw5eYsN", "aOP4Gndm"]}], "clientPlatform": "etcbGxTg", "deletable": true, "namespace": "AMjFBkK3", "redirectUri": "ViJfnwpK"}' \
    > test.out 2>&1
eval_tap $? 122 'AdminUpdateClientV3' test.out

#- 123 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId '8sYXVHvl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 36, "resource": "qMsO2Qvp"}, {"action": 98, "resource": "A8xCApnN"}, {"action": 62, "resource": "VcoLbsXt"}]}' \
    > test.out 2>&1
eval_tap $? 123 'AdminUpdateClientPermissionV3' test.out

#- 124 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'Ep0QjwMr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 34, "resource": "7TAJiHgS"}, {"action": 3, "resource": "PomZiuCd"}, {"action": 1, "resource": "9CkgLCMO"}]}' \
    > test.out 2>&1
eval_tap $? 124 'AdminAddClientPermissionsV3' test.out

#- 125 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '86' \
    --clientId 'z7RmkwdU' \
    --namespace "$AB_NAMESPACE" \
    --resource 'vlI9XTsz' \
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
    --limit '75' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 128 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 129 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Dlb3IhH2' \
    > test.out 2>&1
eval_tap $? 129 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 130 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'd7Q02EVM' \
    --body '{"ACSURL": "EmXbftNc", "AWSCognitoRegion": "tsqlQQdj", "AWSCognitoUserPool": "ZWMjlESx", "AllowedClients": ["NPYpIDrM", "rdwS2JoN", "e2g06fiH"], "AppId": "bYtC9HEn", "AuthorizationEndpoint": "SDJK46bp", "ClientId": "Jb4mE2wZ", "Environment": "f4QEtFMd", "FederationMetadataURL": "174lNwlc", "GenericOauthFlow": true, "IsActive": false, "Issuer": "aafaP5xj", "JWKSEndpoint": "sLWlNBUr", "KeyID": "y546qX7G", "NetflixCertificates": {"encryptedPrivateKey": "EQbSBorJ", "encryptedPrivateKeyName": "HW5SV2re", "publicCertificate": "cmSizztg", "publicCertificateName": "nZoGFcJy", "rootCertificate": "db1q9Wzz", "rootCertificateName": "LgRkHNHD"}, "OrganizationId": "58RZDjjY", "PlatformName": "RSjc78Wu", "RedirectUri": "QRy0Nica", "RegisteredDomains": [{"affectedClientIDs": ["g7z7arFP", "B4EcE8Yd", "3IWRTJZa"], "domain": "31xVE7gN", "namespaces": ["BqGniTGU", "Tj88edBs", "NIN7MdBt"], "roleId": "REH4wiTB"}, {"affectedClientIDs": ["cozdljUi", "wq3KBnxg", "DD8K3OWy"], "domain": "MapsoIPD", "namespaces": ["sNa6brc1", "RQg8Txqb", "zQIka697"], "roleId": "3IsmW0Lj"}, {"affectedClientIDs": ["mOgdpAQ3", "XKAUsYfK", "k9w8TnD8"], "domain": "KypLfU0f", "namespaces": ["CQSUmLkQ", "rRUAdaJh", "5yTjcwLV"], "roleId": "C1GVtSzs"}], "Secret": "2fEqCR1t", "TeamID": "ManpEUOk", "TokenAuthenticationType": "lBSLR9ob", "TokenClaimsMapping": {"iA0442GB": "IlZX3A8u", "VYF3Lyzs": "XLkreK3u", "qXAPBZpl": "9nkWclwD"}, "TokenEndpoint": "J17aSD3g"}' \
    > test.out 2>&1
eval_tap $? 130 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 131 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '9KaJJzcT' \
    > test.out 2>&1
eval_tap $? 131 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 132 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vlafItay' \
    --body '{"ACSURL": "ffh8hx8F", "AWSCognitoRegion": "d24cb9jn", "AWSCognitoUserPool": "BZyTxWj7", "AllowedClients": ["y0LvJvcB", "exDff9Qg", "lCxXMDW0"], "AppId": "PHRZVbpB", "AuthorizationEndpoint": "r3Y48Pz9", "ClientId": "s7m95BI1", "Environment": "HiHlvqzP", "FederationMetadataURL": "sPVYD6YY", "GenericOauthFlow": true, "IsActive": true, "Issuer": "upZP1CH6", "JWKSEndpoint": "RDfIT6U5", "KeyID": "XgSwcbL1", "NetflixCertificates": {"encryptedPrivateKey": "zc6YxDdi", "encryptedPrivateKeyName": "0HpVOSfc", "publicCertificate": "OpzQAfrX", "publicCertificateName": "X4qmM9lR", "rootCertificate": "hLY83VR4", "rootCertificateName": "srkkgFkI"}, "OrganizationId": "lcSvzPW5", "PlatformName": "eezO6Jk5", "RedirectUri": "d9K0NWUL", "RegisteredDomains": [{"affectedClientIDs": ["rG47A2qo", "j1A6Y9mR", "OfIn985e"], "domain": "UPr6L9Aj", "namespaces": ["hGG0LD9u", "nkIGBdGt", "tQS5jvl8"], "roleId": "F2jVwmwg"}, {"affectedClientIDs": ["9eF9fClc", "JocJDlMl", "BUJf0OoX"], "domain": "jbLbvNvm", "namespaces": ["WtK8SY35", "7hKD9gCF", "l1FOKqDD"], "roleId": "TipAqH3X"}, {"affectedClientIDs": ["1EctT6Le", "NsZ5oF9R", "E8xSRhOj"], "domain": "6YtsSz8d", "namespaces": ["JDJpmW1I", "PQeePNyi", "K2Ft2Xvc"], "roleId": "tVx0jL2U"}], "Secret": "pDNtcLAX", "TeamID": "YgcTnpzf", "TokenAuthenticationType": "cnEaR8eJ", "TokenClaimsMapping": {"EHYkT1Dw": "jiDIhKeF", "75BwiRNr": "DvqwNXvV", "5QEqUY4p": "Cf3frZta"}, "TokenEndpoint": "xteGnGxU"}' \
    > test.out 2>&1
eval_tap $? 132 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 133 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DV9EZ3xl' \
    --body '{"affectedClientIDs": ["NZq51PxM", "5zwxqxt4", "U3X4Pfiw"], "assignedNamespaces": ["uooz3ePQ", "WQWK1MDt", "oBMcZok0"], "domain": "d045X5zn", "roleId": "6fIdcNhH"}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 134 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bgL7GdUQ' \
    --body '{"domain": "VP6L6i3r"}' \
    > test.out 2>&1
eval_tap $? 134 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 135 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '4EbNaFGu' \
    > test.out 2>&1
eval_tap $? 135 'RetrieveSSOLoginPlatformCredential' test.out

#- 136 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId '4WgEgT3l' \
    --body '{"acsUrl": "8zQw5hTf", "apiKey": "2AvaYZSU", "appId": "wZzAgQAW", "federationMetadataUrl": "LEshBa3A", "isActive": true, "redirectUri": "VFUpwLje", "secret": "y8ZzDYep", "ssoUrl": "3ZOlUEVV"}' \
    > test.out 2>&1
eval_tap $? 136 'AddSSOLoginPlatformCredential' test.out

#- 137 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gSTXypZR' \
    > test.out 2>&1
eval_tap $? 137 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 138 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Ccm0zW9L' \
    --body '{"acsUrl": "PR6tujWh", "apiKey": "wZt9wCL1", "appId": "e665C5Q8", "federationMetadataUrl": "457OIUkL", "isActive": false, "redirectUri": "XnJie4nS", "secret": "vZO75jF4", "ssoUrl": "jZh9kroC"}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateSSOPlatformCredential' test.out

#- 139 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'tziceK2K' \
    --platformUserId 'icydAj8P' \
    > test.out 2>&1
eval_tap $? 139 'AdminGetUserByPlatformUserIDV3' test.out

#- 140 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'vdzFFYag' \
    --after '99' \
    --before '91' \
    --limit '10' \
    > test.out 2>&1
eval_tap $? 140 'GetAdminUsersByRoleIdV3' test.out

#- 141 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress '2RPF4RmQ' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByEmailAddressV3' test.out

#- 142 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["b7RGZU7P", "70mqrQZh", "ZX6t1l5R"]}' \
    > test.out 2>&1
eval_tap $? 142 'AdminListUserIDByUserIDsV3' test.out

#- 143 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["UmfR4JTG", "eNDZ26dY", "K27DtlkP"], "isAdmin": false, "roles": ["UPEF8cGn", "ryL6iiZx", "uMYWFGv2"]}' \
    > test.out 2>&1
eval_tap $? 143 'AdminInviteUserV3' test.out

#- 144 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUsersV3' test.out

#- 145 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by '38bJmfdk' \
    --endDate 'gr3ucqz9' \
    --limit '100' \
    --offset '21' \
    --platformBy 'o08iN8Sq' \
    --platformId 'kkoA3CV1' \
    --query 'nVaTfwAq' \
    --startDate 'T5NSGtdO' \
    > test.out 2>&1
eval_tap $? 145 'AdminSearchUserV3' test.out

#- 146 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["swWwA71L", "HocJXjy9", "YllU3JkS"]}' \
    > test.out 2>&1
eval_tap $? 146 'AdminGetBulkUserByEmailAddressV3' test.out

#- 147 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SYGbQUcf' \
    > test.out 2>&1
eval_tap $? 147 'AdminGetUserByUserIdV3' test.out

#- 148 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '8GXIbGTP' \
    --body '{"avatarUrl": "UnWyl1iJ", "country": "g6v1MjOU", "dateOfBirth": "leHNzgab", "displayName": "6PHVI8Mm", "languageTag": "pi5NbTad", "userName": "1e2J3I7Y"}' \
    > test.out 2>&1
eval_tap $? 148 'AdminUpdateUserV3' test.out

#- 149 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'U7j04H3i' \
    --activeOnly  \
    --after '8I0TdRMk' \
    --before '4g1t2NdT' \
    --limit '31' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserBanV3' test.out

#- 150 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'v5KkDOtw' \
    --body '{"ban": "oKi689V9", "comment": "HvCXAvZF", "endDate": "cxBuTAgo", "reason": "GqewoYVN", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 150 'AdminBanUserV3' test.out

#- 151 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId '35C9Xvoz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LWtOSRos' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserBanV3' test.out

#- 152 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YcqpCkJ4' \
    --body '{"context": "08eliGD3", "emailAddress": "AHbhrKUW", "languageTag": "9xFw7Sjv"}' \
    > test.out 2>&1
eval_tap $? 152 'AdminSendVerificationCodeV3' test.out

#- 153 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mOy9Wi8f' \
    --body '{"Code": "22995qTX", "ContactType": "HayJb0bQ", "LanguageTag": "s6Fjwj1x", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 153 'AdminVerifyAccountV3' test.out

#- 154 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'GZ7ygYH4' \
    > test.out 2>&1
eval_tap $? 154 'GetUserVerificationCode' test.out

#- 155 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'y0gzRcH0' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetUserDeletionStatusV3' test.out

#- 156 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bp9LurY3' \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 156 'AdminUpdateUserDeletionStatusV3' test.out

#- 157 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yhuWlxdg' \
    --body '{"code": "1Boc5L8C", "country": "IyWyLf3x", "dateOfBirth": "zJ9DA6td", "displayName": "EsUNkVAz", "emailAddress": "4p76mTTv", "password": "SHjPyM58", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 157 'AdminUpgradeHeadlessAccountV3' test.out

#- 158 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3mDxetS1' \
    > test.out 2>&1
eval_tap $? 158 'AdminDeleteUserInformationV3' test.out

#- 159 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nAHzRerD' \
    --after '0.543196247276315' \
    --before '0.02958891372312844' \
    --limit '99' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetUserLoginHistoriesV3' test.out

#- 160 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6mu95Nxy' \
    --body '{"Permissions": [{"Action": 63, "Resource": "VN7jusQ9", "SchedAction": 27, "SchedCron": "vsN7ugIx", "SchedRange": ["sgckiOd3", "OD0OF8NY", "E801jJxd"]}, {"Action": 81, "Resource": "L3LSkxdX", "SchedAction": 49, "SchedCron": "9aF5wdFI", "SchedRange": ["rxvigkkV", "1MhSWhAC", "TkvhqWwX"]}, {"Action": 52, "Resource": "nMeNcXYm", "SchedAction": 37, "SchedCron": "BeQU847o", "SchedRange": ["oydeLNEt", "ebKpWf9M", "l2zW6eiT"]}]}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpdateUserPermissionV3' test.out

#- 161 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DXONR6Cb' \
    --body '{"Permissions": [{"Action": 26, "Resource": "lUn2Ami7", "SchedAction": 87, "SchedCron": "egay4yZW", "SchedRange": ["RXMBLZJk", "ronL26zw", "b1JF9WXM"]}, {"Action": 78, "Resource": "3EJXQluu", "SchedAction": 48, "SchedCron": "EaWM9pkT", "SchedRange": ["UBJwpWno", "inY1DjUO", "WnM8Rq07"]}, {"Action": 4, "Resource": "cvTHLL2A", "SchedAction": 95, "SchedCron": "ZcEj4kVV", "SchedRange": ["vaOz68LU", "yzetAbjR", "hPQug6hq"]}]}' \
    > test.out 2>&1
eval_tap $? 161 'AdminAddUserPermissionsV3' test.out

#- 162 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6LBNFqbD' \
    --body '[{"Action": 18, "Resource": "HJUq9T01"}, {"Action": 100, "Resource": "8iWfeLiZ"}, {"Action": 81, "Resource": "cNgiUrAh"}]' \
    > test.out 2>&1
eval_tap $? 162 'AdminDeleteUserPermissionBulkV3' test.out

#- 163 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '69' \
    --namespace "$AB_NAMESPACE" \
    --resource '8CwKN3D2' \
    --userId 'JS4CBrNK' \
    > test.out 2>&1
eval_tap $? 163 'AdminDeleteUserPermissionV3' test.out

#- 164 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'f8XohVAQ' \
    --after 'Xqh8jL4B' \
    --before 'RpJVua7v' \
    --limit '27' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetUserPlatformAccountsV3' test.out

#- 165 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kb1TAwQo' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetListJusticePlatformAccounts' test.out

#- 166 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'd796iHm6' \
    --userId 'xHiWFKwY' \
    > test.out 2>&1
eval_tap $? 166 'AdminCreateJusticeUser' test.out

#- 167 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '1qlUDR7B' \
    --body '{"platformId": "YnI1tJNs", "platformUserId": "7GYmYhkQ"}' \
    > test.out 2>&1
eval_tap $? 167 'AdminLinkPlatformAccount' test.out

#- 168 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WquZQVOn' \
    --userId 'TpMTm0Be' \
    --body '{"platformNamespace": "RyG5el2R"}' \
    > test.out 2>&1
eval_tap $? 168 'AdminPlatformUnlinkV3' test.out

#- 169 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Il9qyLNs' \
    --userId 'qDlJJK5l' \
    --ticket 'KIihKk1b' \
    > test.out 2>&1
eval_tap $? 169 'AdminPlatformLinkV3' test.out

#- 170 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'R5288lqG' \
    --body '["EZ1vjAVt", "WSsiA74a", "Lf9MwVOg"]' \
    > test.out 2>&1
eval_tap $? 170 'AdminDeleteUserRolesV3' test.out

#- 171 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cvd6YqUm' \
    --body '[{"namespace": "LXF2eww3", "roleId": "bYsgbuAU"}, {"namespace": "nOPu1IsR", "roleId": "BO9blGag"}, {"namespace": "7ALgys8p", "roleId": "fd6e5fnt"}]' \
    > test.out 2>&1
eval_tap $? 171 'AdminSaveUserRoleV3' test.out

#- 172 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'OtddH9Bx' \
    --userId 'HwahZtn3' \
    > test.out 2>&1
eval_tap $? 172 'AdminAddUserRoleV3' test.out

#- 173 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'HfJYYCbo' \
    --userId 'JbkK8ZeF' \
    > test.out 2>&1
eval_tap $? 173 'AdminDeleteUserRoleV3' test.out

#- 174 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'a6aU5TWh' \
    --body '{"enabled": true, "reason": "iGDNT2UX"}' \
    > test.out 2>&1
eval_tap $? 174 'AdminUpdateUserStatusV3' test.out

#- 175 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eQwD622F' \
    > test.out 2>&1
eval_tap $? 175 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 176 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'ORJSqACh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "sz95ZVW0"}' \
    > test.out 2>&1
eval_tap $? 176 'AdminUpdateClientSecretV3' test.out

#- 177 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after '17fcBGAE' \
    --before 'K2PBzF8h' \
    --isWildcard  \
    --limit '43' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetRolesV3' test.out

#- 178 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": true, "managers": [{"displayName": "16rYTDkM", "namespace": "kogqFMUa", "userId": "xAaEQeNM"}, {"displayName": "SnC0I0fM", "namespace": "yrlYLSTM", "userId": "hYQjtgF6"}, {"displayName": "1q5tMY4u", "namespace": "dYgKgAxu", "userId": "jBOmuKOD"}], "members": [{"displayName": "jxqn2sVE", "namespace": "V5xcuc2w", "userId": "rub920Jz"}, {"displayName": "PsCpALAd", "namespace": "inhsWOMg", "userId": "oXkByYaA"}, {"displayName": "Kcxr6fMJ", "namespace": "xkF7Y4Wt", "userId": "AaB7qj4y"}], "permissions": [{"action": 49, "resource": "LNDHfZ90", "schedAction": 59, "schedCron": "DjzJnWm8", "schedRange": ["HxsJTD30", "N7xgLWiv", "oQMxTGLi"]}, {"action": 33, "resource": "klA1OquQ", "schedAction": 38, "schedCron": "Lz3ayiKI", "schedRange": ["jdmDlaaq", "ib6LPdYs", "7RhS7iA3"]}, {"action": 8, "resource": "AGXs9Goy", "schedAction": 79, "schedCron": "QH4G2TUu", "schedRange": ["KCjW8S7t", "0GO1mrIS", "nKypL94Z"]}], "roleName": "r1FsB6y2"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminCreateRoleV3' test.out

#- 179 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'P6lzE6Is' \
    > test.out 2>&1
eval_tap $? 179 'AdminGetRoleV3' test.out

#- 180 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'bEZPrl2d' \
    > test.out 2>&1
eval_tap $? 180 'AdminDeleteRoleV3' test.out

#- 181 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'Dyw1JZBH' \
    --body '{"deletable": false, "isWildcard": false, "roleName": "U0JbH7fV"}' \
    > test.out 2>&1
eval_tap $? 181 'AdminUpdateRoleV3' test.out

#- 182 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'g8qLr8Di' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetRoleAdminStatusV3' test.out

#- 183 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'XMLXwTl6' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateAdminRoleStatusV3' test.out

#- 184 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '175Rfl4R' \
    > test.out 2>&1
eval_tap $? 184 'AdminRemoveRoleAdminV3' test.out

#- 185 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'P2sJLvwt' \
    --after 'MTOOAsKR' \
    --before 'RtUl23U8' \
    --limit '84' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleManagersV3' test.out

#- 186 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'XlO4Ywa9' \
    --body '{"managers": [{"displayName": "yBQC24mV", "namespace": "Gcmiyry5", "userId": "gY0K0GMd"}, {"displayName": "8ZsBxQwj", "namespace": "EKtW3vqJ", "userId": "YQwqnjMA"}, {"displayName": "5Dpm3SwC", "namespace": "ZFA7TckY", "userId": "O5x6nxcP"}]}' \
    > test.out 2>&1
eval_tap $? 186 'AdminAddRoleManagersV3' test.out

#- 187 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'cyYiaD0n' \
    --body '{"managers": [{"displayName": "eDQgUboE", "namespace": "cCy04fGr", "userId": "BRaZyHnC"}, {"displayName": "j7pTPpIj", "namespace": "Jz1mcP9M", "userId": "A0D4gqpc"}, {"displayName": "HBabGGWZ", "namespace": "6bpW2GnJ", "userId": "ImZxt21y"}]}' \
    > test.out 2>&1
eval_tap $? 187 'AdminRemoveRoleManagersV3' test.out

#- 188 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId '3jbnclEx' \
    --after '4IaugPkR' \
    --before '238vjNGF' \
    --limit '8' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleMembersV3' test.out

#- 189 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'RK6nPlCt' \
    --body '{"members": [{"displayName": "NEEfeWtB", "namespace": "mk9fj36z", "userId": "vq8iUds4"}, {"displayName": "dtsP4AYb", "namespace": "W4JTCZLB", "userId": "qHcTGs5c"}, {"displayName": "rZ5JLnEq", "namespace": "r26UYyce", "userId": "hwmByw4P"}]}' \
    > test.out 2>&1
eval_tap $? 189 'AdminAddRoleMembersV3' test.out

#- 190 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'hySPWuk8' \
    --body '{"members": [{"displayName": "WWCPwguT", "namespace": "T1651buZ", "userId": "2sVPSk5P"}, {"displayName": "0arAekYj", "namespace": "9tVtxXQ6", "userId": "KkZV9T0F"}, {"displayName": "VvH1piyO", "namespace": "gyoUftiG", "userId": "LmjOjbQU"}]}' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleMembersV3' test.out

#- 191 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'Kv7yF67j' \
    --body '{"permissions": [{"action": 59, "resource": "zO2ZUeIq", "schedAction": 82, "schedCron": "DgRHHmYa", "schedRange": ["TI7JYr9q", "2ZzyAlcY", "o9jHT1y0"]}, {"action": 10, "resource": "W5BaY9y2", "schedAction": 68, "schedCron": "yI1DEL0r", "schedRange": ["9kJoAVGu", "qBIGmq7q", "dDdVdRhD"]}, {"action": 80, "resource": "iubOHtc7", "schedAction": 11, "schedCron": "s1EpYm2N", "schedRange": ["pu0w7OGf", "Frpj4MRq", "eELw3TMh"]}]}' \
    > test.out 2>&1
eval_tap $? 191 'AdminUpdateRolePermissionsV3' test.out

#- 192 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'AdpzYrzY' \
    --body '{"permissions": [{"action": 100, "resource": "7cTOmWf6", "schedAction": 20, "schedCron": "WtIMXFw0", "schedRange": ["sKRymf1b", "chzZou5W", "bFgQLCdJ"]}, {"action": 34, "resource": "tTazfYT1", "schedAction": 34, "schedCron": "VdJQzTs0", "schedRange": ["8C3PQtG7", "x9ix6zEg", "If3oDj7E"]}, {"action": 80, "resource": "2x3SwftR", "schedAction": 43, "schedCron": "cyXTPDNS", "schedRange": ["gU8rC3Oq", "tbK2VVn7", "AFLgoRZ0"]}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRolePermissionsV3' test.out

#- 193 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'ymYnTKWk' \
    --body '["R2DnFEo5", "Xxe79Mz7", "PbXakD81"]' \
    > test.out 2>&1
eval_tap $? 193 'AdminDeleteRolePermissionsV3' test.out

#- 194 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '46' \
    --resource 'MFTnsAft' \
    --roleId '3ug5UcqD' \
    > test.out 2>&1
eval_tap $? 194 'AdminDeleteRolePermissionV3' test.out

#- 195 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 195 'AdminGetMyUserV3' test.out

#- 196 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'memqreED' \
    --extendExp  \
    --redirectUri 'pDLIAxt8' \
    --password 'yMFGgLY5' \
    --requestId 'GwuhajMI' \
    --userName 'gjgwYmVa' \
    > test.out 2>&1
eval_tap $? 196 'UserAuthenticationV3' test.out

#- 197 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId '2XsfwZ6s' \
    --linkingToken 'kl0yNDLL' \
    --password 'SXILMkhL' \
    --username 'xpO9vOY7' \
    > test.out 2>&1
eval_tap $? 197 'AuthenticationWithPlatformLinkV3' test.out

#- 198 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'uQSar7cz' \
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
    --platformId 'd9cKLtY1' \
    --userId 'KBt9niyL' \
    > test.out 2>&1
eval_tap $? 201 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 202 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'B4QYLMFI' \
    > test.out 2>&1
eval_tap $? 202 'RevokeUserV3' test.out

#- 203 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'NIsQnJ2Q' \
    --codeChallengeMethod 'plain' \
    --createHeadless  \
    --redirectUri 'pB7ClQ6T' \
    --scope 'cV5qVxCg' \
    --state 'SuywAJn5' \
    --targetAuthPage 'rCDWlCPE' \
    --clientId '6TIa5L9Q' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 203 'AuthorizeV3' test.out

#- 204 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'zEdIKFqM' \
    > test.out 2>&1
eval_tap $? 204 'TokenIntrospectionV3' test.out

#- 205 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 205 'GetJWKSV3' test.out

#- 206 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'MDiHEKP2' \
    --mfaToken 'ud0AslTY' \
    > test.out 2>&1
eval_tap $? 206 'Change2faMethod' test.out

#- 207 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code '6xZjbSu1' \
    --factor 'Q8luKnbM' \
    --mfaToken '43mvYETT' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 207 'Verify2faCode' test.out

#- 208 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WBMUU2Jc' \
    --userId 'uC3DfMRD' \
    > test.out 2>&1
eval_tap $? 208 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 209 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'Fn7BbfcN' \
    --clientId '00uE3Klp' \
    --redirectUri 'qKaQ2uTz' \
    --requestId 'f2XD5zy8' \
    > test.out 2>&1
eval_tap $? 209 'AuthCodeRequestV3' test.out

#- 210 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'hVYaW7CU' \
    --clientId 'lWQifxxo' \
    --createHeadless  \
    --deviceId 'uhPJgHjU' \
    --platformToken 'GqJz0EEu' \
    > test.out 2>&1
eval_tap $? 210 'PlatformTokenGrantV3' test.out

#- 211 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 211 'GetRevocationListV3' test.out

#- 212 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'i0erm7w2' \
    > test.out 2>&1
eval_tap $? 212 'TokenRevocationV3' test.out

#- 213 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId '0EQITKJR' \
    --code 'Z640HzO8' \
    --codeVerifier 'V6BTxx1M' \
    --extendExp  \
    --password 'UJJ2BiDi' \
    --redirectUri 'NRhrUv2n' \
    --refreshToken 'm0RKn51m' \
    --username 'XoZUoS0k' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 213 'TokenGrantV3' test.out

#- 214 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token '5nEjS022' \
    > test.out 2>&1
eval_tap $? 214 'VerifyTokenV3' test.out

#- 215 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'cu2fxuKG' \
    --code '3UiVzfoi' \
    --error 'YjwKzyl6' \
    --openidAssocHandle 'pzWlYbxd' \
    --openidClaimedId 'ErqWS8jA' \
    --openidIdentity 's0XFaACi' \
    --openidMode 'uWGLAK9o' \
    --openidNs '5XCVfNGg' \
    --openidOpEndpoint '8FcnQoMu' \
    --openidResponseNonce 'QAM4TOFC' \
    --openidReturnTo 'IHZCgjlW' \
    --openidSig 'B5qymeUs' \
    --openidSigned 'uQyiLIuu' \
    --state 'rdNoB2QS' \
    > test.out 2>&1
eval_tap $? 215 'PlatformAuthenticationV3' test.out

#- 216 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'wMWnryFh' \
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
    --clientId 'chlAKrZ6' \
    > test.out 2>&1
eval_tap $? 218 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 219 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'YtuRaE2i' \
    --body '{"platformUserIds": ["Ym96g0ND", "rmF3fITi", "ATmtUggx"]}' \
    > test.out 2>&1
eval_tap $? 219 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 220 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '0EeLn49Q' \
    --platformUserId 'GdN5Yly9' \
    > test.out 2>&1
eval_tap $? 220 'PublicGetUserByPlatformUserIDV3' test.out

#- 221 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'wNtD6WqK' \
    > test.out 2>&1
eval_tap $? 221 'PublicGetAsyncStatus' test.out

#- 222 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'iTU9Kqjv' \
    --limit '80' \
    --offset '9' \
    --query 'm73OuHjJ' \
    > test.out 2>&1
eval_tap $? 222 'PublicSearchUserV3' test.out

#- 223 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "hixe4vEw", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "Z4J9VHdE", "policyId": "cDOidRNB", "policyVersionId": "LaDVVG4z"}, {"isAccepted": false, "localizedPolicyVersionId": "CkUSlJzk", "policyId": "tZ7ryiJt", "policyVersionId": "pf2sgqWE"}, {"isAccepted": false, "localizedPolicyVersionId": "fSzBIM1A", "policyId": "N84eJNjz", "policyVersionId": "cyaGCvPq"}], "authType": "LCwQKjeh", "code": "hUZfzlvH", "country": "F2Mzljrf", "dateOfBirth": "L4ryEVmM", "displayName": "iuGxebqZ", "emailAddress": "qOQkz6eo", "password": "rXVFHL4x", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 223 'PublicCreateUserV3' test.out

#- 224 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'qYOxdHFk' \
    --query 'NnragsWM' \
    > test.out 2>&1
eval_tap $? 224 'CheckUserAvailability' test.out

#- 225 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["cLWkzFWr", "JjWlvBRd", "rAw8eg4g"]}' \
    > test.out 2>&1
eval_tap $? 225 'PublicBulkGetUsers' test.out

#- 226 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "iopsUGAA", "languageTag": "krdKkRvD"}' \
    > test.out 2>&1
eval_tap $? 226 'PublicSendRegistrationCode' test.out

#- 227 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "91tURv6h", "emailAddress": "NjTU81QJ"}' \
    > test.out 2>&1
eval_tap $? 227 'PublicVerifyRegistrationCode' test.out

#- 228 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "gccNTxwN", "languageTag": "vPnkS1Wp"}' \
    > test.out 2>&1
eval_tap $? 228 'PublicForgotPasswordV3' test.out

#- 229 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'tTbAuAI7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 229 'GetAdminInvitationV3' test.out

#- 230 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'RS2F4l3L' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "TRzt5PXv", "policyId": "NwhpSUOj", "policyVersionId": "UnCXrKwi"}, {"isAccepted": true, "localizedPolicyVersionId": "eRaXG4Xj", "policyId": "stPE1q2d", "policyVersionId": "qloNruJu"}, {"isAccepted": true, "localizedPolicyVersionId": "z1sY90y9", "policyId": "1t24nlim", "policyVersionId": "1s0XAwH8"}], "authType": "EMAILPASSWD", "country": "z5KyY1mk", "dateOfBirth": "mBxaIGMC", "displayName": "JS8Jg2j3", "password": "obDYnbTq", "reachMinimumAge": false}' \
    > test.out 2>&1
eval_tap $? 230 'CreateUserFromInvitationV3' test.out

#- 231 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "s0nlaWsi", "country": "7xF9st4h", "dateOfBirth": "dhkNdjCK", "displayName": "zjd56AwP", "languageTag": "XjZvt8MR", "userName": "YIzFAeIO"}' \
    > test.out 2>&1
eval_tap $? 231 'UpdateUserV3' test.out

#- 232 PublicUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "jpdAe2Pz", "country": "ecp3k3nh", "dateOfBirth": "e5tqA870", "displayName": "A4Ns0Gag", "languageTag": "dcOhSIbK", "userName": "ow1JFll0"}' \
    > test.out 2>&1
eval_tap $? 232 'PublicUpdateUserV3' test.out

#- 233 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "0Z8FTHu1", "emailAddress": "4manaxmV", "languageTag": "fewwcG4E"}' \
    > test.out 2>&1
eval_tap $? 233 'PublicSendVerificationCodeV3' test.out

#- 234 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "cf5DBlzP", "contactType": "GYNHUSBf", "languageTag": "7Lj5jRDW", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 234 'PublicUserVerificationV3' test.out

#- 235 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "J37i47YF", "country": "k5PRfArN", "dateOfBirth": "rLt4hSEz", "displayName": "PY05WXhf", "emailAddress": "DrGsNG3a", "password": "T4biLmSF", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 235 'PublicUpgradeHeadlessAccountV3' test.out

#- 236 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "u2DVnNLc", "password": "moWN57a0"}' \
    > test.out 2>&1
eval_tap $? 236 'PublicVerifyHeadlessAccountV3' test.out

#- 237 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "CSHGF1Oo", "newPassword": "VFWCwgBT", "oldPassword": "XZOXj4Qm"}' \
    > test.out 2>&1
eval_tap $? 237 'PublicUpdatePasswordV3' test.out

#- 238 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'WW3HKZk9' \
    > test.out 2>&1
eval_tap $? 238 'PublicCreateJusticeUser' test.out

#- 239 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wQhDGuCw' \
    --redirectUri 'n3E7dDGT' \
    --ticket 'RGYLQPa0' \
    > test.out 2>&1
eval_tap $? 239 'PublicPlatformLinkV3' test.out

#- 240 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WgPRDGX7' \
    --body '{"platformNamespace": "eClaFyfu"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicPlatformUnlinkV3' test.out

#- 241 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Zf3eIuos' \
    > test.out 2>&1
eval_tap $? 241 'PublicPlatformUnlinkAllV3' test.out

#- 242 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'h5zXOV7q' \
    --clientId '2KsMJW6R' \
    --redirectUri 'vhwHNU6j' \
    > test.out 2>&1
eval_tap $? 242 'PublicWebLinkPlatform' test.out

#- 243 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xhg9dcGI' \
    --state 'B26gTJkn' \
    > test.out 2>&1
eval_tap $? 243 'PublicWebLinkPlatformEstablish' test.out

#- 244 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "YSWcM6Kv", "emailAddress": "n2zqlkIr", "newPassword": "VaWwM5bc"}' \
    > test.out 2>&1
eval_tap $? 244 'ResetPasswordV3' test.out

#- 245 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WC6Pc9mX' \
    > test.out 2>&1
eval_tap $? 245 'PublicGetUserByUserIdV3' test.out

#- 246 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qSCByPiJ' \
    --activeOnly  \
    --after 'fAzanCim' \
    --before '9MY0GEEs' \
    --limit '69' \
    > test.out 2>&1
eval_tap $? 246 'PublicGetUserBanHistoryV3' test.out

#- 247 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0sGjdWI1' \
    > test.out 2>&1
eval_tap $? 247 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 248 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VxKx1KY3' \
    --after '0.7652276125310276' \
    --before '0.4670177951989414' \
    --limit '24' \
    > test.out 2>&1
eval_tap $? 248 'PublicGetUserLoginHistoriesV3' test.out

#- 249 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cN7CtApE' \
    --after 'LGIQ377r' \
    --before 'pHqaheY7' \
    --limit '6' \
    > test.out 2>&1
eval_tap $? 249 'PublicGetUserPlatformAccountsV3' test.out

#- 250 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'uhj15fnL' \
    --body '{"platformId": "Aj2CZwD0", "platformUserId": "joI7C2hn"}' \
    > test.out 2>&1
eval_tap $? 250 'PublicLinkPlatformAccount' test.out

#- 251 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'yFpSgLbV' \
    --body '{"chosenNamespaces": ["N2XXBI6Y", "Ge3V4lae", "2AoAWOQq"], "requestId": "k8fPHd0o"}' \
    > test.out 2>&1
eval_tap $? 251 'PublicForceLinkPlatformWithProgression' test.out

#- 252 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TzRMEFtO' \
    --password 'WcSbUPz7' \
    > test.out 2>&1
eval_tap $? 252 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 253 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'b8IeRwAW' \
    --before 'nnVge5ih' \
    --isWildcard  \
    --limit '78' \
    > test.out 2>&1
eval_tap $? 253 'PublicGetRolesV3' test.out

#- 254 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'sOvvIzDt' \
    > test.out 2>&1
eval_tap $? 254 'PublicGetRoleV3' test.out

#- 255 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 255 'PublicGetMyUserV3' test.out

#- 256 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'lFRqCAor' \
    --code 'QdHyB8Xp' \
    --error 'Tuhi1qYD' \
    --state 'e1n5Igbs' \
    > test.out 2>&1
eval_tap $? 256 'PlatformAuthenticateSAMLV3Handler' test.out

#- 257 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId '438UW2X7' \
    --payload 'TBF413eK' \
    > test.out 2>&1
eval_tap $? 257 'LoginSSOClient' test.out

#- 258 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'HWcADvBx' \
    > test.out 2>&1
eval_tap $? 258 'LogoutSSOClient' test.out

#- 259 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["X2wNCgeK", "8zpRLGhr", "ueZ3mm14"]}' \
    > test.out 2>&1
eval_tap $? 259 'AdminBulkCheckValidUserIDV4' test.out

#- 260 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '7wdGFb2r' \
    --body '{"avatarUrl": "tKtA38d5", "country": "SPGPb0cw", "dateOfBirth": "LB1C63Z6", "displayName": "bAkFP9cG", "languageTag": "74RIWy8o", "userName": "jAD2fsYh"}' \
    > test.out 2>&1
eval_tap $? 260 'AdminUpdateUserV4' test.out

#- 261 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '3CFmCm9k' \
    --body '{"code": "kHhh29UL", "emailAddress": "twFA75Dy"}' \
    > test.out 2>&1
eval_tap $? 261 'AdminUpdateUserEmailAddressV4' test.out

#- 262 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '6SInjEgs' \
    > test.out 2>&1
eval_tap $? 262 'AdminDisableUserMFAV4' test.out

#- 263 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WYSxzRCp' \
    > test.out 2>&1
eval_tap $? 263 'AdminListUserRolesV4' test.out

#- 264 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MkQpXQwa' \
    --body '{"assignedNamespaces": ["pFbXed37", "C4x8K9rq", "cL37ZevG"], "roleId": "DfZQa56O"}' \
    > test.out 2>&1
eval_tap $? 264 'AdminUpdateUserRoleV4' test.out

#- 265 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '7dwLMYjv' \
    --body '{"assignedNamespaces": ["301umnw1", "Y7v1RBHA", "hPxTXBqY"], "roleId": "KlwOj7Fv"}' \
    > test.out 2>&1
eval_tap $? 265 'AdminAddUserRoleV4' test.out

#- 266 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NziyRKaj' \
    --body '{"assignedNamespaces": ["8ovSdAGH", "KrZYHO3L", "hXcikgy8"], "roleId": "przGUtwd"}' \
    > test.out 2>&1
eval_tap $? 266 'AdminRemoveUserRoleV4' test.out

#- 267 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '0' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 267 'AdminGetRolesV4' test.out

#- 268 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "roleName": "xQxef8vq"}' \
    > test.out 2>&1
eval_tap $? 268 'AdminCreateRoleV4' test.out

#- 269 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId '4Sv7pzzP' \
    > test.out 2>&1
eval_tap $? 269 'AdminGetRoleV4' test.out

#- 270 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'rAQ7F2Gz' \
    > test.out 2>&1
eval_tap $? 270 'AdminDeleteRoleV4' test.out

#- 271 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'wh4jlgtH' \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "aVBm4hlj"}' \
    > test.out 2>&1
eval_tap $? 271 'AdminUpdateRoleV4' test.out

#- 272 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'Q0OYKnbB' \
    --body '{"permissions": [{"action": 4, "resource": "42z3jp4F", "schedAction": 44, "schedCron": "SpgXRw9i", "schedRange": ["qcMz9inM", "pQl9LQy1", "JbPpnNjf"]}, {"action": 97, "resource": "87qDSRbd", "schedAction": 86, "schedCron": "PB98iu12", "schedRange": ["pdhgtg1t", "ylJyIEVi", "LqRVTUOS"]}, {"action": 55, "resource": "0DnEknFM", "schedAction": 64, "schedCron": "Jo8E7Fdj", "schedRange": ["4xyhpbp2", "faG5i9by", "jhbJ5zv5"]}]}' \
    > test.out 2>&1
eval_tap $? 272 'AdminUpdateRolePermissionsV4' test.out

#- 273 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'iO7f6rTv' \
    --body '{"permissions": [{"action": 43, "resource": "6hHpxc3r", "schedAction": 44, "schedCron": "wgTsbtKj", "schedRange": ["zWzDUhLC", "Yuf7NDit", "sGjb4oCe"]}, {"action": 48, "resource": "HngjVARR", "schedAction": 89, "schedCron": "LgguqU2d", "schedRange": ["3asHaOIO", "utAEqak1", "d4x6iINT"]}, {"action": 17, "resource": "kDAZEjb7", "schedAction": 72, "schedCron": "G9R0bPw1", "schedRange": ["WqF5iEGr", "KjleSIcJ", "YnyIjjvx"]}]}' \
    > test.out 2>&1
eval_tap $? 273 'AdminAddRolePermissionsV4' test.out

#- 274 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId '8u4buerF' \
    --body '["lAKITQbu", "HX6oxJk0", "GoMJzNFo"]' \
    > test.out 2>&1
eval_tap $? 274 'AdminDeleteRolePermissionsV4' test.out

#- 275 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId '0oClRR0D' \
    --after 'vegGFU8j' \
    --before '7EctFCcQ' \
    --limit '6' \
    > test.out 2>&1
eval_tap $? 275 'AdminListAssignedUsersV4' test.out

#- 276 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'Q4XJbBlI' \
    --body '{"assignedNamespaces": ["UHTA2Ev2", "uLGBTXkc", "P1s22Vu9"], "namespace": "ktjHyiO3", "userId": "J3IGb2Q4"}' \
    > test.out 2>&1
eval_tap $? 276 'AdminAssignUserToRoleV4' test.out

#- 277 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'ZSyTayWW' \
    --body '{"namespace": "APs242O6", "userId": "fQFlz0xr"}' \
    > test.out 2>&1
eval_tap $? 277 'AdminRevokeUserFromRoleV4' test.out

#- 278 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "pLC1ZaoT", "country": "EolDf8KY", "dateOfBirth": "KikE0ubY", "displayName": "un50jfKa", "languageTag": "rqUcDc04", "userName": "DFvytw00"}' \
    > test.out 2>&1
eval_tap $? 278 'AdminUpdateMyUserV4' test.out

#- 279 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 279 'AdminDisableMyAuthenticatorV4' test.out

#- 280 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code '5KQJlsad' \
    > test.out 2>&1
eval_tap $? 280 'AdminEnableMyAuthenticatorV4' test.out

#- 281 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 281 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 282 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 282 'AdminGetMyBackupCodesV4' test.out

#- 283 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 283 'AdminGenerateMyBackupCodesV4' test.out

#- 284 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 284 'AdminDisableMyBackupCodesV4' test.out

#- 285 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 285 'AdminDownloadMyBackupCodesV4' test.out

#- 286 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 286 'AdminEnableMyBackupCodesV4' test.out

#- 287 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 287 'AdminGetMyEnabledFactorsV4' test.out

#- 288 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'SF5lgYqX' \
    > test.out 2>&1
eval_tap $? 288 'AdminMakeFactorMyDefaultV4' test.out

#- 289 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["SDDuN43P", "CtXHolhA", "PmM1y2my"], "emailAddresses": ["L2Aem5rS", "ivCVTMDk", "BnFmLfhT"], "isAdmin": false, "roleId": "p3PP9qEW"}' \
    > test.out 2>&1
eval_tap $? 289 'AdminInviteUserV4' test.out

#- 290 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "Sag4CHkn", "policyId": "3fXg9Stn", "policyVersionId": "4QS9kQSW"}, {"isAccepted": false, "localizedPolicyVersionId": "AwNzneKG", "policyId": "78lVaEiU", "policyVersionId": "8oIRfiqh"}, {"isAccepted": true, "localizedPolicyVersionId": "FzHMVEDP", "policyId": "VVZ3hbI8", "policyVersionId": "U7bAnpSi"}], "authType": "EMAILPASSWD", "country": "87JVJeYF", "dateOfBirth": "VVERJEJs", "displayName": "ZZGLOmbG", "emailAddress": "nwoMKcbe", "password": "jepH5CyZ", "passwordMD5Sum": "uHkGJPyR", "username": "n5dd1xzy", "verified": true}' \
    > test.out 2>&1
eval_tap $? 290 'PublicCreateTestUserV4' test.out

#- 291 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "bPlAcHYG", "policyId": "iUkvby3p", "policyVersionId": "ipGjOR7D"}, {"isAccepted": false, "localizedPolicyVersionId": "7QBLVrC1", "policyId": "zgUNYtSg", "policyVersionId": "TLR7KLvd"}, {"isAccepted": true, "localizedPolicyVersionId": "Qtzbx1sY", "policyId": "0GIpbEDN", "policyVersionId": "5MrQBa8b"}], "authType": "EMAILPASSWD", "code": "d1hRo99S", "country": "Z7STzCyp", "dateOfBirth": "bUUeXSwR", "displayName": "bidCGDKB", "emailAddress": "bV3MeWfO", "password": "nKhj5wt1", "passwordMD5Sum": "uy9KOfH1", "reachMinimumAge": true, "username": "icBMc1zd"}' \
    > test.out 2>&1
eval_tap $? 291 'PublicCreateUserV4' test.out

#- 292 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'fcFIRciX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "zs4sZyFt", "policyId": "K1tkNdBz", "policyVersionId": "iEEkZ4eE"}, {"isAccepted": true, "localizedPolicyVersionId": "uvhJWrHH", "policyId": "8dJDXhCH", "policyVersionId": "92m7WhDD"}, {"isAccepted": false, "localizedPolicyVersionId": "kxnuJi3G", "policyId": "bcZUsgKF", "policyVersionId": "Bf4wUUFH"}], "authType": "EMAILPASSWD", "country": "LrfG537P", "dateOfBirth": "sO9XL8fU", "displayName": "P4hdQg7A", "password": "luynwIvu", "reachMinimumAge": true, "username": "J22x9NMg"}' \
    > test.out 2>&1
eval_tap $? 292 'CreateUserFromInvitationV4' test.out

#- 293 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "Ff2YedFg", "country": "EJJNqFJM", "dateOfBirth": "yL0bC1B4", "displayName": "UwXMtexh", "languageTag": "uR09kzo6", "userName": "BvnGQhuP"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicUpdateUserV4' test.out

#- 294 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "HKBrL1jT", "emailAddress": "39J54EAa"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicUpdateUserEmailAddressV4' test.out

#- 295 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "LHGa3jeX", "country": "DHLOhAAq", "dateOfBirth": "hjcpZz1C", "displayName": "pLcsAL54", "emailAddress": "0VEK4HDp", "password": "lVDJiOdr", "reachMinimumAge": true, "username": "hA3IICQJ", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 296 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "pMACnchk", "password": "ta7eeA2q", "username": "DqIyPl5P"}' \
    > test.out 2>&1
eval_tap $? 296 'PublicUpgradeHeadlessAccountV4' test.out

#- 297 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 297 'PublicDisableMyAuthenticatorV4' test.out

#- 298 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'UFyZHc1T' \
    > test.out 2>&1
eval_tap $? 298 'PublicEnableMyAuthenticatorV4' test.out

#- 299 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 299 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 300 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 300 'PublicGetMyBackupCodesV4' test.out

#- 301 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 301 'PublicGenerateMyBackupCodesV4' test.out

#- 302 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 302 'PublicDisableMyBackupCodesV4' test.out

#- 303 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 303 'PublicDownloadMyBackupCodesV4' test.out

#- 304 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 304 'PublicEnableMyBackupCodesV4' test.out

#- 305 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken 'y34uAVjm' \
    > test.out 2>&1
eval_tap $? 305 'PublicRemoveTrustedDeviceV4' test.out

#- 306 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 306 'PublicGetMyEnabledFactorsV4' test.out

#- 307 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'VvZ36Tjc' \
    > test.out 2>&1
eval_tap $? 307 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE