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
    --body '{"AuthType": "VCs9t9CL", "Country": "tTOzehgb", "DisplayName": "VBUBth9P", "LoginId": "Aho53Bxb", "Password": "XOH2oSSv", "PasswordMD5Sum": "rVldr1wb"}' \
    > test.out 2>&1
eval_tap $? 16 'CreateUser' test.out

#- 17 GetAdminUsersByRoleID
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleID \
    --namespace "$AB_NAMESPACE" \
    --after '86' \
    --before '18' \
    --limit '60' \
    --roleId 'Tj4JlRma' \
    > test.out 2>&1
eval_tap $? 17 'GetAdminUsersByRoleID' test.out

#- 18 GetUserByLoginID
./ng net.accelbyte.sdk.cli.Main iam getUserByLoginID \
    --namespace "$AB_NAMESPACE" \
    --loginId 'HtsfAETh' \
    > test.out 2>&1
eval_tap $? 18 'GetUserByLoginID' test.out

#- 19 GetUserByPlatformUserID
./ng net.accelbyte.sdk.cli.Main iam getUserByPlatformUserID \
    --namespace "$AB_NAMESPACE" \
    --platformID 'ddBG2PaR' \
    --platformUserID 'jGPXQN1d' \
    > test.out 2>&1
eval_tap $? 19 'GetUserByPlatformUserID' test.out

#- 20 ForgotPassword
./ng net.accelbyte.sdk.cli.Main iam forgotPassword \
    --namespace "$AB_NAMESPACE" \
    --body '{"Context": "t36FEkA6", "LanguageTag": "9FJDz9I0", "LoginID": "AbIu0G5y"}' \
    > test.out 2>&1
eval_tap $? 20 'ForgotPassword' test.out

#- 21 GetUsersByLoginIds
./ng net.accelbyte.sdk.cli.Main iam getUsersByLoginIds \
    --namespace "$AB_NAMESPACE" \
    --loginIds 'Okw5WNYX' \
    > test.out 2>&1
eval_tap $? 21 'GetUsersByLoginIds' test.out

#- 22 ResetPassword
./ng net.accelbyte.sdk.cli.Main iam resetPassword \
    --namespace "$AB_NAMESPACE" \
    --body '{"Code": "XEWcg03O", "LoginID": "2Qc6cwZk", "NewPassword": "OWuxqFtr"}' \
    > test.out 2>&1
eval_tap $? 22 'ResetPassword' test.out

#- 23 SearchUser
eval_tap 0 23 'SearchUser # SKIP deprecated' test.out

#- 24 GetUserByUserID
./ng net.accelbyte.sdk.cli.Main iam getUserByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'GrhSSUCJ' \
    > test.out 2>&1
eval_tap $? 24 'GetUserByUserID' test.out

#- 25 UpdateUser
./ng net.accelbyte.sdk.cli.Main iam updateUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'YVkiDjXS' \
    --body '{"Country": "l0DMHYZY", "DateOfBirth": "OlGpr8T1", "DisplayName": "K5HZBz6m", "LanguageTag": "unPbixw5"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateUser' test.out

#- 26 DeleteUser
./ng net.accelbyte.sdk.cli.Main iam deleteUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'p1agAW7P' \
    > test.out 2>&1
eval_tap $? 26 'DeleteUser' test.out

#- 27 BanUser
./ng net.accelbyte.sdk.cli.Main iam banUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'YwOGEM4U' \
    --body '{"ban": "Zmw4Lzei", "comment": "kFtOFMPc", "endDate": "ZCEGVzzB", "reason": "1WWggavD", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 27 'BanUser' test.out

#- 28 GetUserBanHistory
./ng net.accelbyte.sdk.cli.Main iam getUserBanHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'p59lY209' \
    > test.out 2>&1
eval_tap $? 28 'GetUserBanHistory' test.out

#- 29 DisableUserBan
./ng net.accelbyte.sdk.cli.Main iam disableUserBan \
    --banId 'QVa6cYGJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aylZYYJT' \
    > test.out 2>&1
eval_tap $? 29 'DisableUserBan' test.out

#- 30 EnableUserBan
./ng net.accelbyte.sdk.cli.Main iam enableUserBan \
    --banId 'H1xuzVpr' \
    --namespace "$AB_NAMESPACE" \
    --userId '0JLDXU9m' \
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
    --userId 'neUa1wpr' \
    > test.out 2>&1
eval_tap $? 34 'GetUserInformation' test.out

#- 35 DeleteUserInformation
./ng net.accelbyte.sdk.cli.Main iam deleteUserInformation \
    --namespace "$AB_NAMESPACE" \
    --userId 'CMUrKSCv' \
    > test.out 2>&1
eval_tap $? 35 'DeleteUserInformation' test.out

#- 36 GetUserLoginHistories
./ng net.accelbyte.sdk.cli.Main iam getUserLoginHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'bgBT3lLh' \
    --after '0.03437155770156919' \
    --before '0.37803349521634455' \
    --limit '22' \
    > test.out 2>&1
eval_tap $? 36 'GetUserLoginHistories' test.out

#- 37 UpdatePassword
eval_tap 0 37 'UpdatePassword # SKIP deprecated' test.out

#- 38 SaveUserPermission
./ng net.accelbyte.sdk.cli.Main iam saveUserPermission \
    --namespace "$AB_NAMESPACE" \
    --userId '9A18CPJx' \
    --body '{"Permissions": [{"Action": 43, "Resource": "oC28Vs7c", "SchedAction": 70, "SchedCron": "YnF6qyM4", "SchedRange": ["0AeA05RV", "dqxMOH5W", "1PRrf4Le"]}, {"Action": 78, "Resource": "HSWuwWJq", "SchedAction": 18, "SchedCron": "iJYf3b4Q", "SchedRange": ["05BEfoxp", "Bx72GDde", "GDglju0D"]}, {"Action": 92, "Resource": "PaumlNGV", "SchedAction": 78, "SchedCron": "JtFkZqke", "SchedRange": ["ZmZ3MsZG", "t6kyCHrN", "JcAFBi0n"]}]}' \
    > test.out 2>&1
eval_tap $? 38 'SaveUserPermission' test.out

#- 39 AddUserPermission
./ng net.accelbyte.sdk.cli.Main iam addUserPermission \
    --action '7' \
    --namespace "$AB_NAMESPACE" \
    --resource 'MZFaR21V' \
    --userId 'dU3hw6Gx' \
    --body '{"SchedAction": 84, "SchedCron": "wlbK7iS5", "SchedRange": ["VRRNy0b1", "Nh9o07FZ", "hAa8MSyN"]}' \
    > test.out 2>&1
eval_tap $? 39 'AddUserPermission' test.out

#- 40 DeleteUserPermission
./ng net.accelbyte.sdk.cli.Main iam deleteUserPermission \
    --action '45' \
    --namespace "$AB_NAMESPACE" \
    --resource 'cOBYxzWc' \
    --userId 'KariPmnu' \
    > test.out 2>&1
eval_tap $? 40 'DeleteUserPermission' test.out

#- 41 GetUserPlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam getUserPlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'BMdLy9Ud' \
    > test.out 2>&1
eval_tap $? 41 'GetUserPlatformAccounts' test.out

#- 42 GetUserMapping
./ng net.accelbyte.sdk.cli.Main iam getUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'KWyhRv6M' \
    --userId 'mpWmyB7A' \
    > test.out 2>&1
eval_tap $? 42 'GetUserMapping' test.out

#- 43 GetUserJusticePlatformAccount
eval_tap 0 43 'GetUserJusticePlatformAccount # SKIP deprecated' test.out

#- 44 PlatformLink
./ng net.accelbyte.sdk.cli.Main iam platformLink \
    --namespace "$AB_NAMESPACE" \
    --platformId 'H8ES372x' \
    --userId 'bZdePK7V' \
    --ticket 'xUDhxqbK' \
    > test.out 2>&1
eval_tap $? 44 'PlatformLink' test.out

#- 45 PlatformUnlink
./ng net.accelbyte.sdk.cli.Main iam platformUnlink \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Nv2A3XaV' \
    --userId 'Ge73BBNn' \
    --platformNamespace 'vzFgAn8j' \
    > test.out 2>&1
eval_tap $? 45 'PlatformUnlink' test.out

#- 46 GetPublisherUser
./ng net.accelbyte.sdk.cli.Main iam getPublisherUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'McaEoMpD' \
    > test.out 2>&1
eval_tap $? 46 'GetPublisherUser' test.out

#- 47 SaveUserRoles
./ng net.accelbyte.sdk.cli.Main iam saveUserRoles \
    --namespace "$AB_NAMESPACE" \
    --userId 'KcGydJdI' \
    --body '["UVlaH9Bu", "DAUKkzB6", "Hdxcemwt"]' \
    > test.out 2>&1
eval_tap $? 47 'SaveUserRoles' test.out

#- 48 AddUserRole
./ng net.accelbyte.sdk.cli.Main iam addUserRole \
    --namespace "$AB_NAMESPACE" \
    --roleId 'DlWL3NtR' \
    --userId '8sFVhdG3' \
    > test.out 2>&1
eval_tap $? 48 'AddUserRole' test.out

#- 49 DeleteUserRole
./ng net.accelbyte.sdk.cli.Main iam deleteUserRole \
    --namespace "$AB_NAMESPACE" \
    --roleId 'cLMHZwyU' \
    --userId 'tkLFmohh' \
    > test.out 2>&1
eval_tap $? 49 'DeleteUserRole' test.out

#- 50 UpgradeHeadlessAccount
./ng net.accelbyte.sdk.cli.Main iam upgradeHeadlessAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'hy2cKvyV' \
    --body '{"LoginID": "ihFXAgIK", "Password": "36S2oCwt"}' \
    > test.out 2>&1
eval_tap $? 50 'UpgradeHeadlessAccount' test.out

#- 51 UpgradeHeadlessAccountWithVerificationCode
./ng net.accelbyte.sdk.cli.Main iam upgradeHeadlessAccountWithVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId '33VtxA25' \
    --body '{"Code": "XtPQXxS8", "Password": "8rDobELw", "loginId": "ANtSVBss"}' \
    > test.out 2>&1
eval_tap $? 51 'UpgradeHeadlessAccountWithVerificationCode' test.out

#- 52 UserVerification
./ng net.accelbyte.sdk.cli.Main iam userVerification \
    --namespace "$AB_NAMESPACE" \
    --userId 'lnBz3Zh4' \
    --body '{"Code": "vC2mNkE0", "ContactType": "uiAHXtY9", "LanguageTag": "MfSRsFyO", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 52 'UserVerification' test.out

#- 53 SendVerificationCode
./ng net.accelbyte.sdk.cli.Main iam sendVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId '763Uj4N0' \
    --body '{"Context": "7ppOxS0t", "LanguageTag": "8Wf7AD02", "LoginID": "nQojA7GW"}' \
    > test.out 2>&1
eval_tap $? 53 'SendVerificationCode' test.out

#- 54 Authorization
./ng net.accelbyte.sdk.cli.Main iam authorization \
    --login 'JgLKnCN3' \
    --password 'RB9oq9QI' \
    --scope 'JBVdCsgZ' \
    --state 'SAq6KvMo' \
    --clientId 'MRxaz5W0' \
    --redirectUri 'EKTgvhTe' \
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
    --platformId '0qHs4r5K' \
    --deviceId 'UgNoUQMk' \
    --platformToken 'sDvNn9UN' \
    > test.out 2>&1
eval_tap $? 56 'PlatformTokenRequestHandler' test.out

#- 57 RevokeUser
./ng net.accelbyte.sdk.cli.Main iam revokeUser \
    --namespace "$AB_NAMESPACE" \
    --userId '1p1ybWAI' \
    > test.out 2>&1
eval_tap $? 57 'RevokeUser' test.out

#- 58 GetRevocationList
./ng net.accelbyte.sdk.cli.Main iam getRevocationList \
    > test.out 2>&1
eval_tap $? 58 'GetRevocationList' test.out

#- 59 RevokeToken
./ng net.accelbyte.sdk.cli.Main iam revokeToken \
    --token 'WKJpIbvJ' \
    > test.out 2>&1
eval_tap $? 59 'RevokeToken' test.out

#- 60 RevokeAUser
./ng net.accelbyte.sdk.cli.Main iam revokeAUser \
    --userID 'lz2FvR3S' \
    > test.out 2>&1
eval_tap $? 60 'RevokeAUser' test.out

#- 61 TokenGrant
./ng net.accelbyte.sdk.cli.Main iam tokenGrant \
    --code 'uflJCta0' \
    --extendExp  \
    --namespace "$AB_NAMESPACE" \
    --password 'mne9hF1F' \
    --redirectUri 'd3GEzuGN' \
    --refreshToken 'L7MJHbPo' \
    --username 'LGl0RKAR' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 61 'TokenGrant' test.out

#- 62 VerifyToken
./ng net.accelbyte.sdk.cli.Main iam verifyToken \
    --token 'kaZp1X0t' \
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
    --body '{"AgeRestriction": 59, "Enable": false}' \
    > test.out 2>&1
eval_tap $? 81 'AdminUpdateAgeRestrictionConfigV2' test.out

#- 82 GetListCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam getListCountryAgeRestriction \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'GetListCountryAgeRestriction' test.out

#- 83 UpdateCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam updateCountryAgeRestriction \
    --countryCode 'WdijtrEm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"AgeRestriction": 26}' \
    > test.out 2>&1
eval_tap $? 83 'UpdateCountryAgeRestriction' test.out

#- 84 AdminSearchUsersV2
./ng net.accelbyte.sdk.cli.Main iam adminSearchUsersV2 \
    --namespace "$AB_NAMESPACE" \
    --after 'IHD9lAdK' \
    --before '6vbn7S1X' \
    --displayName 'kxrRrPNY' \
    --limit '67' \
    --loginId 'uWBnU8JS' \
    --platformUserId 'GrKE4FYG' \
    --roleId 'DzAG5mc5' \
    --userId 'a09osf7G' \
    --platformId 'lRLJhSbj' \
    > test.out 2>&1
eval_tap $? 84 'AdminSearchUsersV2' test.out

#- 85 AdminGetUserByUserIdV2
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xiw26Dly' \
    > test.out 2>&1
eval_tap $? 85 'AdminGetUserByUserIdV2' test.out

#- 86 AdminUpdateUserV2
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y8VPS1kO' \
    --body '{"Country": "Pqu7S11P", "DateOfBirth": "wECJqYFr", "DisplayName": "DYpEsJTP", "LanguageTag": "dRxUGmO1"}' \
    > test.out 2>&1
eval_tap $? 86 'AdminUpdateUserV2' test.out

#- 87 AdminBanUserV2
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UYcev4ul' \
    --body '{"ban": "KWLDspcp", "comment": "ImLPeRw4", "endDate": "iYikSviN", "reason": "HD4kp10r", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 87 'AdminBanUserV2' test.out

#- 88 AdminGetUserBanV2
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '74A4EZn2' \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 88 'AdminGetUserBanV2' test.out

#- 89 AdminDisableUserV2
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '093Q6XAB' \
    --body '{"Reason": "96uDjVv5"}' \
    > test.out 2>&1
eval_tap $? 89 'AdminDisableUserV2' test.out

#- 90 AdminEnableUserV2
./ng net.accelbyte.sdk.cli.Main iam adminEnableUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '8YuxTiM6' \
    > test.out 2>&1
eval_tap $? 90 'AdminEnableUserV2' test.out

#- 91 AdminResetPasswordV2
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WzXRvSFW' \
    --body '{"LanguageTag": "lnXi1E15", "NewPassword": "jxYSrfPm", "OldPassword": "vEGlSaOv"}' \
    > test.out 2>&1
eval_tap $? 91 'AdminResetPasswordV2' test.out

#- 92 AdminDeletePlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam adminDeletePlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pALSV2cW' \
    --userId 'OC6uNskZ' \
    --platformNamespace 'K8H0OlVq' \
    > test.out 2>&1
eval_tap $? 92 'AdminDeletePlatformLinkV2' test.out

#- 93 AdminPutUserRolesV2
./ng net.accelbyte.sdk.cli.Main iam adminPutUserRolesV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HFKSEu5M' \
    --body '["41rnMoc7", "uzwVRivu", "2JkZoPUd"]' \
    > test.out 2>&1
eval_tap $? 93 'AdminPutUserRolesV2' test.out

#- 94 AdminCreateUserRolesV2
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserRolesV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rJAn2P3l' \
    --body '["d2dvXPMf", "nOYOJKrM", "fsBCqVqA"]' \
    > test.out 2>&1
eval_tap $? 94 'AdminCreateUserRolesV2' test.out

#- 95 PublicGetCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestriction \
    --countryCode 'JQT3t5sf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'PublicGetCountryAgeRestriction' test.out

#- 96 PublicCreateUserV2
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"AuthType": "5DUwZlPy", "Country": "4RPPpnmG", "DisplayName": "HshsYA7K", "LoginId": "rW6big3L", "Password": "uIoyT6RR", "PasswordMD5Sum": "YykzAlvj"}' \
    > test.out 2>&1
eval_tap $? 96 'PublicCreateUserV2' test.out

#- 97 PublicForgotPasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"Context": "A9sMogtm", "LanguageTag": "qGfZzieo", "LoginID": "6VatJa5s"}' \
    > test.out 2>&1
eval_tap $? 97 'PublicForgotPasswordV2' test.out

#- 98 PublicResetPasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicResetPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"Code": "Df9jSC0I", "LoginID": "tHy7LZfV", "NewPassword": "1uP1VJbD"}' \
    > test.out 2>&1
eval_tap $? 98 'PublicResetPasswordV2' test.out

#- 99 PublicGetUserByUserIDV2
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zLsJaj1S' \
    > test.out 2>&1
eval_tap $? 99 'PublicGetUserByUserIDV2' test.out

#- 100 PublicUpdateUserV2
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'C02cFvBi' \
    --body '{"Country": "RJF5HDYq", "DateOfBirth": "NQp59wKh", "DisplayName": "Nwy246Py", "LanguageTag": "8KonEGYE"}' \
    > test.out 2>&1
eval_tap $? 100 'PublicUpdateUserV2' test.out

#- 101 PublicGetUserBan
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBan \
    --namespace "$AB_NAMESPACE" \
    --userId 'L5tRCzA9' \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 101 'PublicGetUserBan' test.out

#- 102 PublicUpdatePasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DYlm5agF' \
    --body '{"LanguageTag": "mWu3yVea", "NewPassword": "Mjxq2Eym", "OldPassword": "2wTPqdRW"}' \
    > test.out 2>&1
eval_tap $? 102 'PublicUpdatePasswordV2' test.out

#- 103 GetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam getListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'INoUdtx4' \
    > test.out 2>&1
eval_tap $? 103 'GetListJusticePlatformAccounts' test.out

#- 104 PublicPlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yiUyVJMs' \
    --userId 'NDmeYjyV' \
    --ticket 'WL0CVeuH' \
    > test.out 2>&1
eval_tap $? 104 'PublicPlatformLinkV2' test.out

#- 105 PublicDeletePlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam publicDeletePlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4gmatGVm' \
    --userId 'OP069unb' \
    --platformNamespace '1VrUlsl8' \
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
    --body '[{"field": "mK3xtNWf", "validation": {"allowDigit": false, "allowLetter": true, "allowSpace": true, "allowUnicode": false, "description": [{"language": "u8xfTt9f", "message": ["BWy5bouv", "2JFewTZn", "aYrIbJim"]}, {"language": "bnVDSfuH", "message": ["UByKeLKF", "FwD5zaxN", "ZssnEur3"]}, {"language": "cL8COIap", "message": ["WRrzlayc", "EbBVZbOm", "GIxkUzGH"]}], "isCustomRegex": true, "letterCase": "HvJ7Baqb", "maxLength": 26, "maxRepeatingAlphaNum": 39, "maxRepeatingSpecialCharacter": 95, "minCharType": 32, "minLength": 85, "regex": "9QZt9xTa", "specialCharacterLocation": "j6Yu8sgO", "specialCharacters": ["jyEKP1hx", "TPulQGeV", "mWj3P6O8"]}}, {"field": "OSru6k9h", "validation": {"allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": false, "description": [{"language": "cGHJZ0qj", "message": ["jinw8kba", "VgNGvqd6", "QEAPKp4y"]}, {"language": "7Eak2MXb", "message": ["nWHrpCyh", "p7oSjoSR", "rueOOvpy"]}, {"language": "TqqjrVjH", "message": ["YrVh1TKx", "4pyrC8qK", "pCzQkam1"]}], "isCustomRegex": true, "letterCase": "lyoFmyPn", "maxLength": 73, "maxRepeatingAlphaNum": 10, "maxRepeatingSpecialCharacter": 24, "minCharType": 99, "minLength": 82, "regex": "bDV5ZHNM", "specialCharacterLocation": "ECiF7sSL", "specialCharacters": ["nhq2Uph5", "wxq3d34w", "KzgVjUu1"]}}, {"field": "wsV1aTWf", "validation": {"allowDigit": true, "allowLetter": true, "allowSpace": false, "allowUnicode": false, "description": [{"language": "cACcu5LE", "message": ["2EyD7d1m", "tGdkya9L", "m3vYO9Xb"]}, {"language": "RzgKMkLs", "message": ["cJTTeVM0", "47WcEc5n", "XdhxDMH8"]}, {"language": "FPZm8Nhs", "message": ["pnh8fKdE", "GtON998n", "EvXmpOIJ"]}], "isCustomRegex": false, "letterCase": "RMotqVgn", "maxLength": 63, "maxRepeatingAlphaNum": 47, "maxRepeatingSpecialCharacter": 88, "minCharType": 65, "minLength": 68, "regex": "15umM32U", "specialCharacterLocation": "ToCqdjbk", "specialCharacters": ["cskuDgRN", "5eO87NYz", "1X3kdpHO"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'UllBkvps' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'j1OelKqA' \
    --before 'C9ArwKNh' \
    --limit '57' \
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
    --body '{"ageRestriction": 52, "enable": true}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode 'd10dnjBB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 23}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'p936EveL' \
    --limit '38' \
    --offset '12' \
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
    --limit '73' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 118 'AdminGetClientsByNamespaceV3' test.out

#- 119 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["jtnL9CY4", "UmTdMVAt", "9nWHs3nW"], "baseUri": "0dTxZgLL", "clientId": "mMvOKWVe", "clientName": "PjHTAnh3", "clientPermissions": [{"action": 92, "resource": "cJLYqopq", "schedAction": 82, "schedCron": "hVYp3hvR", "schedRange": ["EdwaZIs4", "iCcQhJVN", "1FgQfkgJ"]}, {"action": 100, "resource": "307vszuc", "schedAction": 18, "schedCron": "4S9upM3j", "schedRange": ["tVj7wpU4", "HeuDkjBi", "gcsKCOiT"]}, {"action": 91, "resource": "Xysz5b36", "schedAction": 23, "schedCron": "XfYmlD9f", "schedRange": ["zR5V8Vgs", "WSXpxTST", "7ZHzSesJ"]}], "clientPlatform": "ceQXsZux", "deletable": false, "namespace": "gCAi9Wog", "oauthClientType": "uQHFGp3T", "redirectUri": "SzlRmqoj", "secret": "lW7GKajb"}' \
    > test.out 2>&1
eval_tap $? 119 'AdminCreateClientV3' test.out

#- 120 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'Xt1oqpfm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 121 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'A1GCAObv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'AdminDeleteClientV3' test.out

#- 122 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'wjk5Gfyt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["2NjZnPP0", "ZVHGNSsF", "4pTP71yy"], "baseUri": "lGtf02xO", "clientName": "VGODS4ev", "clientPermissions": [{"action": 57, "resource": "rz0MDKN4", "schedAction": 11, "schedCron": "XxHUnlgo", "schedRange": ["ysHtFuG4", "udksXgh2", "LbjyE7cD"]}, {"action": 90, "resource": "KZjwyDHM", "schedAction": 28, "schedCron": "9jv2lOsa", "schedRange": ["GSPf3RTi", "kmUm4KQH", "qYz59awd"]}, {"action": 22, "resource": "Vrtcnlns", "schedAction": 21, "schedCron": "ptITIkK2", "schedRange": ["GDgAHM7q", "VHIfwTnG", "8UVqXqO5"]}], "clientPlatform": "IsA7LCjM", "deletable": true, "namespace": "MYC1YDqX", "redirectUri": "VzVndc7n"}' \
    > test.out 2>&1
eval_tap $? 122 'AdminUpdateClientV3' test.out

#- 123 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'W5UUzz62' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 22, "resource": "UXpQqmd7"}, {"action": 81, "resource": "6r5iEXX7"}, {"action": 2, "resource": "JjlBhAKD"}]}' \
    > test.out 2>&1
eval_tap $? 123 'AdminUpdateClientPermissionV3' test.out

#- 124 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'phiQY4cS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 95, "resource": "PghkwUIi"}, {"action": 42, "resource": "qNnbVtwV"}, {"action": 11, "resource": "K9db2wf2"}]}' \
    > test.out 2>&1
eval_tap $? 124 'AdminAddClientPermissionsV3' test.out

#- 125 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '60' \
    --clientId 'q9tgZxBH' \
    --namespace "$AB_NAMESPACE" \
    --resource '47BP2iGQ' \
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
    --limit '47' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 128 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 129 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'LAVDkxjs' \
    > test.out 2>&1
eval_tap $? 129 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 130 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'kirpjPz0' \
    --body '{"ACSURL": "o9sd1qld", "AWSCognitoRegion": "xdNwkUb4", "AWSCognitoUserPool": "Ux190OHU", "AllowedClients": ["cnjMmc8K", "9Cqz9Wz2", "YmQeXVQE"], "AppId": "w0xdfMvR", "AuthorizationEndpoint": "fw9PP31W", "ClientId": "J5bYDDrR", "Environment": "mP0NdhFR", "FederationMetadataURL": "xNTy53vC", "GenericOauthFlow": false, "IsActive": true, "Issuer": "B1MZWpID", "JWKSEndpoint": "tDfADOEK", "KeyID": "YgCywm8N", "NetflixCertificates": {"encryptedPrivateKey": "w1chcvz3", "encryptedPrivateKeyName": "Qy6bPg2m", "publicCertificate": "L3L7l2T6", "publicCertificateName": "PKWQ1Jj0", "rootCertificate": "owe4JRmG", "rootCertificateName": "1vZz3oPI"}, "OrganizationId": "ourau9dh", "PlatformName": "tbRAY424", "RedirectUri": "DOD8K4PL", "RegisteredDomains": [{"affectedClientIDs": ["FcEymXkN", "qTz7iL1J", "qIXimCmK"], "domain": "dZpTqBmg", "namespaces": ["uVhO23VU", "lVLrG0KI", "BUvX3Dyv"], "roleId": "7UQlE2Cw"}, {"affectedClientIDs": ["T5jh2snf", "bUtfV4wA", "7ul6JdK2"], "domain": "2WlCLHyT", "namespaces": ["GURyxv3B", "ucPHF9qX", "r9PYuMTR"], "roleId": "BXETtJnH"}, {"affectedClientIDs": ["ZNBvKX1S", "YCM5ziik", "WGucjNqK"], "domain": "QIgDOfn7", "namespaces": ["dpMkPcN4", "CLkrpreT", "oKGfhf29"], "roleId": "XAY5gAty"}], "Secret": "84DGhuay", "TeamID": "XK3g3V69", "TokenAuthenticationType": "iPrzvkQc", "TokenClaimsMapping": {"7aXizj0D": "1gLQeEEf", "ffLmjYbb": "MUrC0jjq", "KnUxlLSf": "UMqV8QiV"}, "TokenEndpoint": "kZ41wMcn"}' \
    > test.out 2>&1
eval_tap $? 130 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 131 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 't8fxZr1i' \
    > test.out 2>&1
eval_tap $? 131 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 132 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rzSGbG2l' \
    --body '{"ACSURL": "AFq6CskD", "AWSCognitoRegion": "Nzl28b20", "AWSCognitoUserPool": "kFf2jQgW", "AllowedClients": ["oIZ8F3Wm", "cj3Gv7b1", "2bsfgV61"], "AppId": "FZBJrdQB", "AuthorizationEndpoint": "55sHKXUN", "ClientId": "WhFX64Hc", "Environment": "MrFtZhLt", "FederationMetadataURL": "FHatVSmT", "GenericOauthFlow": true, "IsActive": false, "Issuer": "Qmr0RTwR", "JWKSEndpoint": "jHkLl0gg", "KeyID": "3n9nrHSm", "NetflixCertificates": {"encryptedPrivateKey": "uNvoJDJ7", "encryptedPrivateKeyName": "Fcj2JJXE", "publicCertificate": "ArxDrMi7", "publicCertificateName": "QF77hc5d", "rootCertificate": "tzvaApYp", "rootCertificateName": "V7wMlrnw"}, "OrganizationId": "GNtFFLru", "PlatformName": "FGPdFYS0", "RedirectUri": "s22atJJp", "RegisteredDomains": [{"affectedClientIDs": ["fyEZWnmK", "IQG6Vwd8", "7amBvvgU"], "domain": "o5wJ1i9m", "namespaces": ["CrHv98K2", "7i7cXQRE", "kuKJoR6c"], "roleId": "atlymRhN"}, {"affectedClientIDs": ["t8it2Hyq", "u4vSJGHu", "CqHkVleH"], "domain": "mWkrXr6L", "namespaces": ["id6OKuke", "hls8lxrI", "LmUDXjg0"], "roleId": "kzub6zUt"}, {"affectedClientIDs": ["3d1PDNsR", "uGWSmhIJ", "cEvgEJZz"], "domain": "N1teQTok", "namespaces": ["V9gfbSvK", "6RIQkq9o", "7YAyk20r"], "roleId": "HagrZsFl"}], "Secret": "MG80HVu3", "TeamID": "vxVLHIBP", "TokenAuthenticationType": "Knw00Ur1", "TokenClaimsMapping": {"UT4o6hun": "D8MNVTei", "0ouREHRa": "IaXPHSNg", "5RZHtoH7": "jpvBjcdB"}, "TokenEndpoint": "hOc8GdEM"}' \
    > test.out 2>&1
eval_tap $? 132 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 133 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XTdukslI' \
    --body '{"affectedClientIDs": ["OGC2qTJn", "WLndYE4N", "b61fZjTd"], "assignedNamespaces": ["lTJjTbDI", "bu8kpgUH", "fntgw9jr"], "domain": "l29x1dn9", "roleId": "nOApIJz2"}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 134 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rizXgYYb' \
    --body '{"domain": "AuW3BYKY"}' \
    > test.out 2>&1
eval_tap $? 134 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 135 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mSdHr23C' \
    > test.out 2>&1
eval_tap $? 135 'RetrieveSSOLoginPlatformCredential' test.out

#- 136 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fVRWiYup' \
    --body '{"acsUrl": "U0iEz2oC", "apiKey": "t3baxWk1", "appId": "OTDPoMYx", "federationMetadataUrl": "w5CABXft", "isActive": false, "redirectUri": "9OPBn9g9", "secret": "viJ4pel5", "ssoUrl": "AMRYp1Oi"}' \
    > test.out 2>&1
eval_tap $? 136 'AddSSOLoginPlatformCredential' test.out

#- 137 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'skmBx7qD' \
    > test.out 2>&1
eval_tap $? 137 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 138 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UllHPqMv' \
    --body '{"acsUrl": "iSXq6syY", "apiKey": "33UqD9g6", "appId": "PdP6ZGDP", "federationMetadataUrl": "alxBWZqu", "isActive": true, "redirectUri": "AHlPhzoa", "secret": "Sc6hxOlg", "ssoUrl": "ATkhACsU"}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateSSOPlatformCredential' test.out

#- 139 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '1nphSqrN' \
    --platformUserId 'qKju9O3E' \
    > test.out 2>&1
eval_tap $? 139 'AdminGetUserByPlatformUserIDV3' test.out

#- 140 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'NzBkqcxT' \
    --after '21' \
    --before '39' \
    --limit '52' \
    > test.out 2>&1
eval_tap $? 140 'GetAdminUsersByRoleIdV3' test.out

#- 141 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'VFrKJZ42' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByEmailAddressV3' test.out

#- 142 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["U2rU9QuW", "2vkpWZxj", "5GldXUvF"]}' \
    > test.out 2>&1
eval_tap $? 142 'AdminListUserIDByUserIDsV3' test.out

#- 143 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["PnJpYYnR", "D3eZSAuY", "b58OsrSm"], "isAdmin": true, "roles": ["2FGSmcOW", "ZEloHlHc", "dlJAw9j1"]}' \
    > test.out 2>&1
eval_tap $? 143 'AdminInviteUserV3' test.out

#- 144 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUsersV3' test.out

#- 145 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'jFj9Tfhk' \
    --endDate 'FWQDcGPp' \
    --limit '51' \
    --offset '25' \
    --platformBy 'u3adqVJQ' \
    --platformId 'o0tEVyjD' \
    --query '9aVep4tH' \
    --startDate 'ylcpn0iY' \
    > test.out 2>&1
eval_tap $? 145 'AdminSearchUserV3' test.out

#- 146 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["77v14tx7", "i4xhQbfy", "MVSh9pue"]}' \
    > test.out 2>&1
eval_tap $? 146 'AdminGetBulkUserByEmailAddressV3' test.out

#- 147 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '29qQqMm2' \
    > test.out 2>&1
eval_tap $? 147 'AdminGetUserByUserIdV3' test.out

#- 148 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WhqSVq76' \
    --body '{"avatarUrl": "ozLSVFlY", "country": "tXJFWWow", "dateOfBirth": "qrEcRAT5", "displayName": "AYJaqcUS", "languageTag": "FBJm93pw", "userName": "2qV7cW3E"}' \
    > test.out 2>&1
eval_tap $? 148 'AdminUpdateUserV3' test.out

#- 149 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '04p8UCtf' \
    --activeOnly  \
    --after 'RhqxBM0k' \
    --before 'etg6BR20' \
    --limit '31' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserBanV3' test.out

#- 150 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vQ2MIRSC' \
    --body '{"ban": "0VPfrcYs", "comment": "SZX14FLU", "endDate": "K1lHFh2l", "reason": "zKkK7MYg", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 150 'AdminBanUserV3' test.out

#- 151 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'VGWy3Fnr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kPgmTKoW' \
    --body '{"enabled": true, "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserBanV3' test.out

#- 152 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oSCx9col' \
    --body '{"context": "Sj2nlHxJ", "emailAddress": "qe1a9JJq", "languageTag": "6arSgosb"}' \
    > test.out 2>&1
eval_tap $? 152 'AdminSendVerificationCodeV3' test.out

#- 153 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '36lH9CHR' \
    --body '{"Code": "qWWNuUHy", "ContactType": "E9l8dU4z", "LanguageTag": "2X0X1Gq2", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 153 'AdminVerifyAccountV3' test.out

#- 154 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'O9BClBZH' \
    > test.out 2>&1
eval_tap $? 154 'GetUserVerificationCode' test.out

#- 155 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Spw4zzzU' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetUserDeletionStatusV3' test.out

#- 156 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RHTLD6Sv' \
    --body '{"enabled": false}' \
    > test.out 2>&1
eval_tap $? 156 'AdminUpdateUserDeletionStatusV3' test.out

#- 157 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eMlvqMuy' \
    --body '{"code": "6juqhJZe", "country": "4FI2ysK5", "dateOfBirth": "xC1Ivhr4", "displayName": "ELGoebW6", "emailAddress": "PvnoMDpV", "password": "BCoVRSif", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 157 'AdminUpgradeHeadlessAccountV3' test.out

#- 158 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1anLX2H0' \
    > test.out 2>&1
eval_tap $? 158 'AdminDeleteUserInformationV3' test.out

#- 159 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qwRp7aOd' \
    --after '0.09505769156550603' \
    --before '0.8638747542704277' \
    --limit '76' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetUserLoginHistoriesV3' test.out

#- 160 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GiY98D89' \
    --body '{"Permissions": [{"Action": 53, "Resource": "c3qGNEKk", "SchedAction": 25, "SchedCron": "kNhoWeel", "SchedRange": ["b7wABXD9", "PSJck6Po", "4StOTt0U"]}, {"Action": 1, "Resource": "X9jcYtjR", "SchedAction": 11, "SchedCron": "Hgsq2oAN", "SchedRange": ["uux20Oz1", "HeCf6Yyn", "znoHNvjK"]}, {"Action": 51, "Resource": "PLYSnpwA", "SchedAction": 19, "SchedCron": "Vy4wxEIC", "SchedRange": ["5b0fAqAt", "UDJj1ZRA", "QKOb5VXA"]}]}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpdateUserPermissionV3' test.out

#- 161 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5bOUDtkE' \
    --body '{"Permissions": [{"Action": 57, "Resource": "f4i0Y7j4", "SchedAction": 14, "SchedCron": "wtmdegdr", "SchedRange": ["Fya3joxV", "dpFOnGCP", "ZS6txdnu"]}, {"Action": 20, "Resource": "oE9YzPiw", "SchedAction": 81, "SchedCron": "QC5rgvCA", "SchedRange": ["gIwueri0", "IYc6qzJ4", "lmWK5mb8"]}, {"Action": 76, "Resource": "gYare8wD", "SchedAction": 30, "SchedCron": "ca86mumh", "SchedRange": ["pbc1qDgp", "AzQbIiYW", "BthLlXdD"]}]}' \
    > test.out 2>&1
eval_tap $? 161 'AdminAddUserPermissionsV3' test.out

#- 162 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'behy0G1x' \
    --body '[{"Action": 51, "Resource": "N0ljcvb9"}, {"Action": 82, "Resource": "0RRfKOec"}, {"Action": 45, "Resource": "e1MlsWvn"}]' \
    > test.out 2>&1
eval_tap $? 162 'AdminDeleteUserPermissionBulkV3' test.out

#- 163 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '69' \
    --namespace "$AB_NAMESPACE" \
    --resource 'ZnC10yrP' \
    --userId 'apCl7j98' \
    > test.out 2>&1
eval_tap $? 163 'AdminDeleteUserPermissionV3' test.out

#- 164 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kqqXdtZp' \
    --after 'YqJll8zg' \
    --before 'xVRkpVr8' \
    --limit '17' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetUserPlatformAccountsV3' test.out

#- 165 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZFrwr0sg' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetListJusticePlatformAccounts' test.out

#- 166 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'aMvGG8mK' \
    --userId '49fiOBhT' \
    > test.out 2>&1
eval_tap $? 166 'AdminCreateJusticeUser' test.out

#- 167 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId '55kyJkse' \
    --body '{"platformId": "3oACdHQe", "platformUserId": "aC6sJDwS"}' \
    > test.out 2>&1
eval_tap $? 167 'AdminLinkPlatformAccount' test.out

#- 168 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rH6Tnjnm' \
    --userId 'R9sr90yz' \
    --body '{"platformNamespace": "AFYlDfeR"}' \
    > test.out 2>&1
eval_tap $? 168 'AdminPlatformUnlinkV3' test.out

#- 169 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'O9PWC9ax' \
    --userId '8QMxSjQN' \
    --ticket '6cP181IR' \
    > test.out 2>&1
eval_tap $? 169 'AdminPlatformLinkV3' test.out

#- 170 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'B9rdSUEd' \
    --body '["HmUsvx6c", "tdAq33TO", "OTlekZwG"]' \
    > test.out 2>&1
eval_tap $? 170 'AdminDeleteUserRolesV3' test.out

#- 171 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZvtC4WUd' \
    --body '[{"namespace": "5y8A43FX", "roleId": "f4NxZQNk"}, {"namespace": "6lZ79fWR", "roleId": "MAHa548T"}, {"namespace": "n734gFMo", "roleId": "OgXFqHUz"}]' \
    > test.out 2>&1
eval_tap $? 171 'AdminSaveUserRoleV3' test.out

#- 172 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'kNlX5jcB' \
    --userId 'cvzGZSvK' \
    > test.out 2>&1
eval_tap $? 172 'AdminAddUserRoleV3' test.out

#- 173 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'BwVQsm41' \
    --userId 'CjOJE8SS' \
    > test.out 2>&1
eval_tap $? 173 'AdminDeleteUserRoleV3' test.out

#- 174 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'T6VE2Iln' \
    --body '{"enabled": false, "reason": "dtPAztaM"}' \
    > test.out 2>&1
eval_tap $? 174 'AdminUpdateUserStatusV3' test.out

#- 175 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9bvL96RW' \
    > test.out 2>&1
eval_tap $? 175 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 176 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'A4aBTDiu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "uJXt5NYY"}' \
    > test.out 2>&1
eval_tap $? 176 'AdminUpdateClientSecretV3' test.out

#- 177 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'DMebiR3l' \
    --before 'U5n6Vyp3' \
    --isWildcard  \
    --limit '33' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetRolesV3' test.out

#- 178 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "managers": [{"displayName": "yFImDWm2", "namespace": "UBYQSnj2", "userId": "taNcW4JY"}, {"displayName": "dRYVkFRH", "namespace": "2yBDu8yd", "userId": "og6F44GV"}, {"displayName": "RWkOFiRp", "namespace": "7pIqCXaR", "userId": "pkxzIaqN"}], "members": [{"displayName": "8lBE3D7N", "namespace": "G8IaqPTO", "userId": "3JN84QNq"}, {"displayName": "NtvIlI4d", "namespace": "09F12SwB", "userId": "n0a3lUAs"}, {"displayName": "5oolPtHj", "namespace": "bhLphHLn", "userId": "li7mHDwl"}], "permissions": [{"action": 89, "resource": "AJuLgWVW", "schedAction": 65, "schedCron": "q6Rk8foQ", "schedRange": ["KDWOrIEb", "WWi577GS", "9TDeEZwx"]}, {"action": 31, "resource": "eaPmGkp4", "schedAction": 84, "schedCron": "T9KmZ7e5", "schedRange": ["nJCVEpGX", "f4hUD6Fd", "46Rt7mq9"]}, {"action": 44, "resource": "Znc024I7", "schedAction": 78, "schedCron": "CvMv2g26", "schedRange": ["Pcr5suib", "4m6PjLRH", "vOaNRZDe"]}], "roleName": "MUPgJUKJ"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminCreateRoleV3' test.out

#- 179 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'uP8Yuanx' \
    > test.out 2>&1
eval_tap $? 179 'AdminGetRoleV3' test.out

#- 180 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'TqtBVV6s' \
    > test.out 2>&1
eval_tap $? 180 'AdminDeleteRoleV3' test.out

#- 181 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'm8nc7zPw' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "OiVfOYyG"}' \
    > test.out 2>&1
eval_tap $? 181 'AdminUpdateRoleV3' test.out

#- 182 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'WWwMN8Lq' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetRoleAdminStatusV3' test.out

#- 183 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'mare6n62' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateAdminRoleStatusV3' test.out

#- 184 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'q50GbgpS' \
    > test.out 2>&1
eval_tap $? 184 'AdminRemoveRoleAdminV3' test.out

#- 185 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'KkYq4L4P' \
    --after 'wKU0bIB7' \
    --before '18p5hwPM' \
    --limit '89' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleManagersV3' test.out

#- 186 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'xXWQVbdy' \
    --body '{"managers": [{"displayName": "ExwZaWzU", "namespace": "F6oMZotE", "userId": "YtFEmhtR"}, {"displayName": "Ux4msFtv", "namespace": "Afix5Zhx", "userId": "CeZ7CEg6"}, {"displayName": "VwjzHxeT", "namespace": "WWD0HyCQ", "userId": "w6i0tFXb"}]}' \
    > test.out 2>&1
eval_tap $? 186 'AdminAddRoleManagersV3' test.out

#- 187 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'GiB01mqt' \
    --body '{"managers": [{"displayName": "MccfJxop", "namespace": "97LlAoma", "userId": "Kyzw5WVC"}, {"displayName": "0uIGPrIv", "namespace": "SNqjXvNI", "userId": "fxwxB2T2"}, {"displayName": "kByprMYm", "namespace": "xdY9QfyJ", "userId": "KHdCRmcz"}]}' \
    > test.out 2>&1
eval_tap $? 187 'AdminRemoveRoleManagersV3' test.out

#- 188 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'WBtEE1J0' \
    --after 'fs2XIY0y' \
    --before 'gR4RSNok' \
    --limit '58' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleMembersV3' test.out

#- 189 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'ozLZDxZR' \
    --body '{"members": [{"displayName": "jLOuecw0", "namespace": "OZaYfSAO", "userId": "dKP6iNiP"}, {"displayName": "pOBXMfB1", "namespace": "HdCvnNsH", "userId": "n3P1SK5X"}, {"displayName": "gK37lhck", "namespace": "qyf4KyUO", "userId": "0pvyxJTO"}]}' \
    > test.out 2>&1
eval_tap $? 189 'AdminAddRoleMembersV3' test.out

#- 190 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId '8u0YV1Q8' \
    --body '{"members": [{"displayName": "RNb2LxmJ", "namespace": "pbQyY2Gp", "userId": "WqMsP7Yh"}, {"displayName": "4zTeK1Xz", "namespace": "KSxYPBXC", "userId": "XtaGt9kX"}, {"displayName": "ZqNs0UrN", "namespace": "2rYqapWZ", "userId": "2LhB5KET"}]}' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleMembersV3' test.out

#- 191 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'dRVa90mE' \
    --body '{"permissions": [{"action": 82, "resource": "Yc2hUWiw", "schedAction": 94, "schedCron": "Th9D5qKd", "schedRange": ["p40oroe2", "cvHBY685", "UehblEPx"]}, {"action": 86, "resource": "idJW5wYD", "schedAction": 48, "schedCron": "84WhdP7j", "schedRange": ["Nw18buRK", "ZkQAtPdm", "DPU3MjtM"]}, {"action": 58, "resource": "CGnW9q72", "schedAction": 49, "schedCron": "BWzc7qzD", "schedRange": ["cykA37Ae", "mNkBsWSY", "YB0mZ0vz"]}]}' \
    > test.out 2>&1
eval_tap $? 191 'AdminUpdateRolePermissionsV3' test.out

#- 192 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'GXMntVWr' \
    --body '{"permissions": [{"action": 53, "resource": "4fv2lrBo", "schedAction": 6, "schedCron": "wDjBm6i7", "schedRange": ["usZhrKUr", "e7JOEY26", "FjrggE9h"]}, {"action": 67, "resource": "z7LPfhzf", "schedAction": 87, "schedCron": "N6k7YUQs", "schedRange": ["eC5Yf6o1", "yzSbwm2T", "dXolYWsA"]}, {"action": 10, "resource": "9v7qKMmf", "schedAction": 23, "schedCron": "oUPMRtfx", "schedRange": ["vHS2UHvF", "Mh4ALSL7", "nMsRFGgn"]}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRolePermissionsV3' test.out

#- 193 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'KPpVhUB9' \
    --body '["qEXIGwX5", "RKGYevKr", "8Ci7tmwL"]' \
    > test.out 2>&1
eval_tap $? 193 'AdminDeleteRolePermissionsV3' test.out

#- 194 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '86' \
    --resource 'tFIvApad' \
    --roleId 'n2DHg94J' \
    > test.out 2>&1
eval_tap $? 194 'AdminDeleteRolePermissionV3' test.out

#- 195 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 195 'AdminGetMyUserV3' test.out

#- 196 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId '6l9U9UL9' \
    --extendExp  \
    --redirectUri 'fNiHACdi' \
    --password 'C4bwdUZy' \
    --requestId 'sTFE6c2U' \
    --userName 'SbxXfbZc' \
    > test.out 2>&1
eval_tap $? 196 'UserAuthenticationV3' test.out

#- 197 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'otAp3eS0' \
    --linkingToken 'tOQk4cRQ' \
    --password 'Tyenw5Zz' \
    --username 'spCXhiri' \
    > test.out 2>&1
eval_tap $? 197 'AuthenticationWithPlatformLinkV3' test.out

#- 198 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'uOI4mOTi' \
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
    --platformId 'p7F8oAbs' \
    --userId 'LbFxgXsd' \
    > test.out 2>&1
eval_tap $? 201 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 202 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '5hCReHED' \
    > test.out 2>&1
eval_tap $? 202 'RevokeUserV3' test.out

#- 203 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'kjVj3LbZ' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --redirectUri 'mrUuron8' \
    --scope '22AC1Bef' \
    --state 'LK5MKENZ' \
    --targetAuthPage 'QpHH8Wbs' \
    --clientId 'K7FXPkbY' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 203 'AuthorizeV3' test.out

#- 204 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'ZWE8v54a' \
    > test.out 2>&1
eval_tap $? 204 'TokenIntrospectionV3' test.out

#- 205 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 205 'GetJWKSV3' test.out

#- 206 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'RJ0FuWLa' \
    --mfaToken 'eWtxWlwc' \
    > test.out 2>&1
eval_tap $? 206 'Change2faMethod' test.out

#- 207 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'ce9cRynJ' \
    --factor 'RDGOmZbA' \
    --mfaToken 'uMwOg4dJ' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 207 'Verify2faCode' test.out

#- 208 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jGiomnIZ' \
    --userId 'y5411laL' \
    > test.out 2>&1
eval_tap $? 208 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 209 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'OpnDQYGD' \
    --clientId 'dsTFHU0q' \
    --redirectUri 'JX29VWml' \
    --requestId 'UBNHJAXL' \
    > test.out 2>&1
eval_tap $? 209 'AuthCodeRequestV3' test.out

#- 210 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId '2J3pXSMl' \
    --clientId '0lZ30Q4v' \
    --createHeadless  \
    --deviceId 'oAzfZZpS' \
    --platformToken 'iishMOFm' \
    > test.out 2>&1
eval_tap $? 210 'PlatformTokenGrantV3' test.out

#- 211 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 211 'GetRevocationListV3' test.out

#- 212 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'rhRRSAlG' \
    > test.out 2>&1
eval_tap $? 212 'TokenRevocationV3' test.out

#- 213 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId 'QrGNJmob' \
    --code 'ViPW9TI3' \
    --codeVerifier 'BPVT8neD' \
    --extendExp  \
    --password '6NVEsH2Q' \
    --redirectUri 'bhENpgM5' \
    --refreshToken 'hHj1aVYj' \
    --username 'ebAoKYfn' \
    --grantType 'client_credentials' \
    > test.out 2>&1
eval_tap $? 213 'TokenGrantV3' test.out

#- 214 VerifyTokenV3
./ng net.accelbyte.sdk.cli.Main iam verifyTokenV3 \
    --token '1aUoRq58' \
    > test.out 2>&1
eval_tap $? 214 'VerifyTokenV3' test.out

#- 215 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId '8QkW0wFH' \
    --code 'fzY2zfJM' \
    --error 'xOIBjUEk' \
    --openidAssocHandle 'YZsn3VpS' \
    --openidClaimedId '4wXbo2YZ' \
    --openidIdentity 'HEdqtAuj' \
    --openidMode 'O4LXDlvP' \
    --openidNs '2IJcqnFT' \
    --openidOpEndpoint '4lhdYesu' \
    --openidResponseNonce 'xDr8gYLj' \
    --openidReturnTo 'MO2K5tBT' \
    --openidSig '9FqhfZeB' \
    --openidSigned 'bfGX4ajQ' \
    --state 'P8a78KvN' \
    > test.out 2>&1
eval_tap $? 215 'PlatformAuthenticationV3' test.out

#- 216 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'CYOlOi51' \
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
    --clientId 'uXmypk2m' \
    > test.out 2>&1
eval_tap $? 218 'RetrieveActiveOIDCClientsPublicV3' test.out

#- 219 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DEo92PNq' \
    --body '{"platformUserIds": ["XHMTxEDd", "gVwaAvb6", "xN7Lq9RX"]}' \
    > test.out 2>&1
eval_tap $? 219 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 220 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rBWaIAMV' \
    --platformUserId '1EJ7lH3n' \
    > test.out 2>&1
eval_tap $? 220 'PublicGetUserByPlatformUserIDV3' test.out

#- 221 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'fVRJBqqr' \
    > test.out 2>&1
eval_tap $? 221 'PublicGetAsyncStatus' test.out

#- 222 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'kSFGalxV' \
    --limit '52' \
    --offset '54' \
    --query 'loNWEfgT' \
    > test.out 2>&1
eval_tap $? 222 'PublicSearchUserV3' test.out

#- 223 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "inLsuqZK", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "xfY6gTJX", "policyId": "z60nF2eE", "policyVersionId": "toeZUPJc"}, {"isAccepted": false, "localizedPolicyVersionId": "SFVmo4Ky", "policyId": "wOUf0bhp", "policyVersionId": "kKtTqgND"}, {"isAccepted": true, "localizedPolicyVersionId": "i0aZPRgF", "policyId": "Izca33k4", "policyVersionId": "OZse2o05"}], "authType": "ibUXaojz", "code": "1Fsz7udm", "country": "KHeiWAzA", "dateOfBirth": "f9YVSxSv", "displayName": "6Irh3gsH", "emailAddress": "QJrrIICb", "password": "MUUUCQ2R", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 223 'PublicCreateUserV3' test.out

#- 224 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field '3vi5HcVF' \
    --query 'hWc4M4MO' \
    > test.out 2>&1
eval_tap $? 224 'CheckUserAvailability' test.out

#- 225 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["4YxJVdY4", "00Ci3e5F", "E4jFPyVA"]}' \
    > test.out 2>&1
eval_tap $? 225 'PublicBulkGetUsers' test.out

#- 226 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "cJPfNkcT", "languageTag": "GzTAUplM"}' \
    > test.out 2>&1
eval_tap $? 226 'PublicSendRegistrationCode' test.out

#- 227 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "dHVHzduG", "emailAddress": "JwoNlvs4"}' \
    > test.out 2>&1
eval_tap $? 227 'PublicVerifyRegistrationCode' test.out

#- 228 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "yL1ZM4ly", "languageTag": "f97q83TO"}' \
    > test.out 2>&1
eval_tap $? 228 'PublicForgotPasswordV3' test.out

#- 229 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'W8MEmQqW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 229 'GetAdminInvitationV3' test.out

#- 230 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'P4OMyO3H' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "YQFknZYs", "policyId": "CFEOBwyd", "policyVersionId": "BNBPhz3I"}, {"isAccepted": false, "localizedPolicyVersionId": "pRMbgdwJ", "policyId": "jmZkRBOu", "policyVersionId": "n0qA5UOf"}, {"isAccepted": true, "localizedPolicyVersionId": "igJWgL1Q", "policyId": "2ZhwgmH8", "policyVersionId": "LygQLxZO"}], "authType": "EMAILPASSWD", "country": "COjmBJCh", "dateOfBirth": "1ByGA4U7", "displayName": "xbYHgn8r", "password": "XwdHoLzX", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 230 'CreateUserFromInvitationV3' test.out

#- 231 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "NXjPm1gs", "country": "l6gCLVCH", "dateOfBirth": "ha6Uz5EM", "displayName": "1vZfoVMD", "languageTag": "8iT7dNPS", "userName": "xSweCUVK"}' \
    > test.out 2>&1
eval_tap $? 231 'UpdateUserV3' test.out

#- 232 PublicUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "oaJwUxhg", "country": "FIXxkTvQ", "dateOfBirth": "9BOUwxUm", "displayName": "GTbrXJyr", "languageTag": "yJq5WvL7", "userName": "YmZ9QJEm"}' \
    > test.out 2>&1
eval_tap $? 232 'PublicUpdateUserV3' test.out

#- 233 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "CgDTLIEa", "emailAddress": "UABFGYfE", "languageTag": "3pLqCn9t"}' \
    > test.out 2>&1
eval_tap $? 233 'PublicSendVerificationCodeV3' test.out

#- 234 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "4bpCjjv9", "contactType": "Oxj2XREI", "languageTag": "ngHVBMXk", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 234 'PublicUserVerificationV3' test.out

#- 235 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "FV4Ka64a", "country": "8pSkeDCs", "dateOfBirth": "2lkjdsi5", "displayName": "eVR19bR7", "emailAddress": "LYFBt04f", "password": "rWGcHZ0L", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 235 'PublicUpgradeHeadlessAccountV3' test.out

#- 236 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "WrL00HTj", "password": "yRt1gNA1"}' \
    > test.out 2>&1
eval_tap $? 236 'PublicVerifyHeadlessAccountV3' test.out

#- 237 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "dVjsAe3z", "newPassword": "8scLRT5j", "oldPassword": "ssqj4C1m"}' \
    > test.out 2>&1
eval_tap $? 237 'PublicUpdatePasswordV3' test.out

#- 238 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'R7m1HB1I' \
    > test.out 2>&1
eval_tap $? 238 'PublicCreateJusticeUser' test.out

#- 239 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Q5pQG7xD' \
    --redirectUri 'UGzQzz8l' \
    --ticket 'sPbq2mcA' \
    > test.out 2>&1
eval_tap $? 239 'PublicPlatformLinkV3' test.out

#- 240 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GsWfde8N' \
    --body '{"platformNamespace": "K3SfXqfE"}' \
    > test.out 2>&1
eval_tap $? 240 'PublicPlatformUnlinkV3' test.out

#- 241 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'iNvU7pxu' \
    > test.out 2>&1
eval_tap $? 241 'PublicPlatformUnlinkAllV3' test.out

#- 242 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'v777Elht' \
    --clientId 'cyYizUaR' \
    --redirectUri 'eeHcpftv' \
    > test.out 2>&1
eval_tap $? 242 'PublicWebLinkPlatform' test.out

#- 243 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId '5mHcG1KJ' \
    --state 'VPNzaPUN' \
    > test.out 2>&1
eval_tap $? 243 'PublicWebLinkPlatformEstablish' test.out

#- 244 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "9xG6ovuT", "emailAddress": "SjDQZ5r1", "newPassword": "9WUnSXVh"}' \
    > test.out 2>&1
eval_tap $? 244 'ResetPasswordV3' test.out

#- 245 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'i0Hd6s6E' \
    > test.out 2>&1
eval_tap $? 245 'PublicGetUserByUserIdV3' test.out

#- 246 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HZ6CZ0U9' \
    --activeOnly  \
    --after 'xnegh7HC' \
    --before 'KvUbQ9Mh' \
    --limit '47' \
    > test.out 2>&1
eval_tap $? 246 'PublicGetUserBanHistoryV3' test.out

#- 247 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dROfwiOT' \
    > test.out 2>&1
eval_tap $? 247 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 248 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XTmdfnyb' \
    --after '0.4740439932555134' \
    --before '0.15568210078731004' \
    --limit '62' \
    > test.out 2>&1
eval_tap $? 248 'PublicGetUserLoginHistoriesV3' test.out

#- 249 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'y3e6fPrk' \
    --after 'hrcMb0tx' \
    --before 'jtjjxE5s' \
    --limit '40' \
    > test.out 2>&1
eval_tap $? 249 'PublicGetUserPlatformAccountsV3' test.out

#- 250 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'oyzMWU7e' \
    --body '{"platformId": "Ky7ytvvm", "platformUserId": "IwxZ0aFz"}' \
    > test.out 2>&1
eval_tap $? 250 'PublicLinkPlatformAccount' test.out

#- 251 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'iXWqFRre' \
    --body '{"chosenNamespaces": ["ZBpFgl7G", "D3aYuVHt", "ZyNJ6y4h"], "requestId": "5m8qVjad"}' \
    > test.out 2>&1
eval_tap $? 251 'PublicForceLinkPlatformWithProgression' test.out

#- 252 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GLSFkOdZ' \
    --password 'UIy3A7xJ' \
    > test.out 2>&1
eval_tap $? 252 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 253 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'HHIv1AA5' \
    --before '8fYKLvQM' \
    --isWildcard  \
    --limit '34' \
    > test.out 2>&1
eval_tap $? 253 'PublicGetRolesV3' test.out

#- 254 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'dw4gIqkU' \
    > test.out 2>&1
eval_tap $? 254 'PublicGetRoleV3' test.out

#- 255 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 255 'PublicGetMyUserV3' test.out

#- 256 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'R65xq7zE' \
    --code 'h6LDnquQ' \
    --error 'xnGj9EYC' \
    --state 'mJIiAQ3f' \
    > test.out 2>&1
eval_tap $? 256 'PlatformAuthenticateSAMLV3Handler' test.out

#- 257 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'LFQ8jw6Z' \
    --payload 'QwANC69M' \
    > test.out 2>&1
eval_tap $? 257 'LoginSSOClient' test.out

#- 258 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'R0XfNdhl' \
    > test.out 2>&1
eval_tap $? 258 'LogoutSSOClient' test.out

#- 259 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["tyVC0GBE", "WboOu3md", "6WIA1pu1"]}' \
    > test.out 2>&1
eval_tap $? 259 'AdminBulkCheckValidUserIDV4' test.out

#- 260 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oF81rySt' \
    --body '{"avatarUrl": "Mt24PRE2", "country": "hSmlMYsm", "dateOfBirth": "qJ7tdO5e", "displayName": "OkNvrlRl", "languageTag": "g56QQtd6", "userName": "dhK6yXNl"}' \
    > test.out 2>&1
eval_tap $? 260 'AdminUpdateUserV4' test.out

#- 261 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cvwa44tz' \
    --body '{"code": "hsg3Istv", "emailAddress": "mppchQXB"}' \
    > test.out 2>&1
eval_tap $? 261 'AdminUpdateUserEmailAddressV4' test.out

#- 262 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'huNKhTPs' \
    > test.out 2>&1
eval_tap $? 262 'AdminDisableUserMFAV4' test.out

#- 263 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AV4oL5HH' \
    > test.out 2>&1
eval_tap $? 263 'AdminListUserRolesV4' test.out

#- 264 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wDIuWnqV' \
    --body '{"assignedNamespaces": ["1NMcX9eL", "CMPz6NSN", "F3hJ56RH"], "roleId": "K6wfBn7O"}' \
    > test.out 2>&1
eval_tap $? 264 'AdminUpdateUserRoleV4' test.out

#- 265 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fmWHsWnw' \
    --body '{"assignedNamespaces": ["KKD2KOW7", "gGY6fbVb", "8jcjp9hi"], "roleId": "lC2EIsrw"}' \
    > test.out 2>&1
eval_tap $? 265 'AdminAddUserRoleV4' test.out

#- 266 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lGFoGGQN' \
    --body '{"assignedNamespaces": ["viZIQpJQ", "IpRf3R78", "p1wnhDTK"], "roleId": "fZdBrBx3"}' \
    > test.out 2>&1
eval_tap $? 266 'AdminRemoveUserRoleV4' test.out

#- 267 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '61' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 267 'AdminGetRolesV4' test.out

#- 268 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "roleName": "k3PgqOwW"}' \
    > test.out 2>&1
eval_tap $? 268 'AdminCreateRoleV4' test.out

#- 269 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'vQEZdnUA' \
    > test.out 2>&1
eval_tap $? 269 'AdminGetRoleV4' test.out

#- 270 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'Rsv5o4Ab' \
    > test.out 2>&1
eval_tap $? 270 'AdminDeleteRoleV4' test.out

#- 271 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId '66WWNcae' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": true, "roleName": "kBIKnaew"}' \
    > test.out 2>&1
eval_tap $? 271 'AdminUpdateRoleV4' test.out

#- 272 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'MTobuWgr' \
    --body '{"permissions": [{"action": 43, "resource": "Ho12JtWf", "schedAction": 62, "schedCron": "r0gZkT5Q", "schedRange": ["BxQ1FPQd", "XRj22PL2", "aC4u6hj3"]}, {"action": 95, "resource": "RZZN9wGD", "schedAction": 90, "schedCron": "4hK5o4FK", "schedRange": ["8eHbtz8v", "QaT6KZ0p", "8tBOIeOm"]}, {"action": 58, "resource": "NZyW5dW0", "schedAction": 90, "schedCron": "DgKCRxsN", "schedRange": ["za3NgtUL", "148tvpgM", "jYnGXDvg"]}]}' \
    > test.out 2>&1
eval_tap $? 272 'AdminUpdateRolePermissionsV4' test.out

#- 273 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId '7hx5MF81' \
    --body '{"permissions": [{"action": 13, "resource": "KYhP77kv", "schedAction": 8, "schedCron": "R19cC20n", "schedRange": ["hFLDys4V", "0WhEN48g", "FHvMaIb9"]}, {"action": 24, "resource": "fSQStxhV", "schedAction": 47, "schedCron": "Obqm6xWl", "schedRange": ["NTmopIfV", "wutk7Awc", "X41FmXzL"]}, {"action": 70, "resource": "EYyV1tuM", "schedAction": 79, "schedCron": "qikYxTRH", "schedRange": ["ykg9ZwTc", "uYiGE186", "M2jItNja"]}]}' \
    > test.out 2>&1
eval_tap $? 273 'AdminAddRolePermissionsV4' test.out

#- 274 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'UtGMn2cj' \
    --body '["xjROV87l", "UGts6icx", "LeDKLsXs"]' \
    > test.out 2>&1
eval_tap $? 274 'AdminDeleteRolePermissionsV4' test.out

#- 275 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'DpX97LBK' \
    --after 'IvWdvO0K' \
    --before '4qe4r175' \
    --limit '5' \
    > test.out 2>&1
eval_tap $? 275 'AdminListAssignedUsersV4' test.out

#- 276 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'dSU5wgn2' \
    --body '{"assignedNamespaces": ["yMnXjRLG", "YcwlOi7E", "GDk3YtV8"], "namespace": "S54UBS3W", "userId": "quuI9JAi"}' \
    > test.out 2>&1
eval_tap $? 276 'AdminAssignUserToRoleV4' test.out

#- 277 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'PrzYsUBL' \
    --body '{"namespace": "IEYswFhf", "userId": "0ApNXb9v"}' \
    > test.out 2>&1
eval_tap $? 277 'AdminRevokeUserFromRoleV4' test.out

#- 278 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "5z00ypiK", "country": "TJzgNEf3", "dateOfBirth": "jmce7l2y", "displayName": "99AfHo3z", "languageTag": "BHwSLPco", "userName": "feFJCQqw"}' \
    > test.out 2>&1
eval_tap $? 278 'AdminUpdateMyUserV4' test.out

#- 279 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 279 'AdminDisableMyAuthenticatorV4' test.out

#- 280 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'fwqbUXkD' \
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
    --factor 'GMCNaC4c' \
    > test.out 2>&1
eval_tap $? 288 'AdminMakeFactorMyDefaultV4' test.out

#- 289 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["5Oe4Shgo", "1Yes5Dew", "20lgQLWJ"], "emailAddresses": ["GEqyQ5Jn", "jKO4doBH", "BOsx4ovP"], "isAdmin": true, "roleId": "dR3Jsbp6"}' \
    > test.out 2>&1
eval_tap $? 289 'AdminInviteUserV4' test.out

#- 290 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "a0jimpDm", "policyId": "zn7RapFJ", "policyVersionId": "0EX0qyOx"}, {"isAccepted": false, "localizedPolicyVersionId": "AuvqwkzW", "policyId": "Y8mpnJUy", "policyVersionId": "K6Ahm19n"}, {"isAccepted": false, "localizedPolicyVersionId": "yaZDP7sH", "policyId": "qUzYVbH2", "policyVersionId": "GjQS4JVL"}], "authType": "EMAILPASSWD", "country": "R2XeKGqm", "dateOfBirth": "WnuwWo14", "displayName": "oMlrBKa7", "emailAddress": "lG7F2yuS", "password": "9sgmzVqp", "passwordMD5Sum": "sVT4wmmN", "username": "3M1fkaG0", "verified": false}' \
    > test.out 2>&1
eval_tap $? 290 'PublicCreateTestUserV4' test.out

#- 291 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "F5oQ1B7K", "policyId": "Znogf6jW", "policyVersionId": "Bv9cxfbc"}, {"isAccepted": false, "localizedPolicyVersionId": "40Uumok2", "policyId": "bgXc22HH", "policyVersionId": "sNeYTrLo"}, {"isAccepted": true, "localizedPolicyVersionId": "hZhJ5vUG", "policyId": "KqbMgwiT", "policyVersionId": "XeL8hGVp"}], "authType": "EMAILPASSWD", "code": "ABpRksGX", "country": "YmuU34eu", "dateOfBirth": "QBM5HrRz", "displayName": "5NUkXLSg", "emailAddress": "YzLET18i", "password": "HZ4z6xwV", "passwordMD5Sum": "5E0o7YRk", "reachMinimumAge": false, "username": "Uyf6MQhi"}' \
    > test.out 2>&1
eval_tap $? 291 'PublicCreateUserV4' test.out

#- 292 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'tRWNq151' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "FDk2X0Lc", "policyId": "9NGTiJsr", "policyVersionId": "7K61T7MD"}, {"isAccepted": false, "localizedPolicyVersionId": "EkK4c1Z7", "policyId": "pok17DSy", "policyVersionId": "zJ8O6AyS"}, {"isAccepted": false, "localizedPolicyVersionId": "SXqtKHEv", "policyId": "rUa6TGUc", "policyVersionId": "YIRcrKLd"}], "authType": "EMAILPASSWD", "country": "RbNQIUnK", "dateOfBirth": "6Ao3J5Nb", "displayName": "Eu3wWyj6", "password": "ZTcWUi1R", "reachMinimumAge": true, "username": "wCDF3B5K"}' \
    > test.out 2>&1
eval_tap $? 292 'CreateUserFromInvitationV4' test.out

#- 293 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "7Ww5Kgr7", "country": "wrrvrPN6", "dateOfBirth": "6ry8Wc2W", "displayName": "NuW6GMwQ", "languageTag": "NjhsgE1M", "userName": "n2NIYM86"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicUpdateUserV4' test.out

#- 294 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "47daXPWs", "emailAddress": "EaI67rZG"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicUpdateUserEmailAddressV4' test.out

#- 295 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "p37c3CB3", "country": "l4KVUe1G", "dateOfBirth": "7nV0mszV", "displayName": "WGwi52P3", "emailAddress": "lf5takOC", "password": "chAnOyVz", "reachMinimumAge": true, "username": "Rto1bctk", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 295 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 296 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "G1picDA2", "password": "risN3rGI", "username": "AAVOe1kW"}' \
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
    --code 'dlwlVsTT' \
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
    --deviceToken 'H8jNQhg8' \
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
    --factor 'Zm4FZeRW' \
    > test.out 2>&1
eval_tap $? 307 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE