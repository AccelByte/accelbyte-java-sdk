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
echo "1..305"

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
    --body '{"AuthType": "FtBxyZcD", "Country": "XBpGlsQu", "DisplayName": "Ju8vMf0I", "LoginId": "sJkTrd8I", "Password": "DcV2zXnT", "PasswordMD5Sum": "KjXY1bPq"}' \
    > test.out 2>&1
eval_tap $? 16 'CreateUser' test.out

#- 17 GetAdminUsersByRoleID
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleID \
    --namespace "$AB_NAMESPACE" \
    --after '1' \
    --before '24' \
    --limit '17' \
    --roleId 'Bxx9Cs18' \
    > test.out 2>&1
eval_tap $? 17 'GetAdminUsersByRoleID' test.out

#- 18 GetUserByLoginID
./ng net.accelbyte.sdk.cli.Main iam getUserByLoginID \
    --namespace "$AB_NAMESPACE" \
    --loginId 'EY84ekIt' \
    > test.out 2>&1
eval_tap $? 18 'GetUserByLoginID' test.out

#- 19 GetUserByPlatformUserID
./ng net.accelbyte.sdk.cli.Main iam getUserByPlatformUserID \
    --namespace "$AB_NAMESPACE" \
    --platformID 'qRzHU1oh' \
    --platformUserID '570KQBVa' \
    > test.out 2>&1
eval_tap $? 19 'GetUserByPlatformUserID' test.out

#- 20 ForgotPassword
./ng net.accelbyte.sdk.cli.Main iam forgotPassword \
    --namespace "$AB_NAMESPACE" \
    --body '{"Context": "ewc72krS", "LanguageTag": "ha68n3Yn", "LoginID": "ozp1C2Km"}' \
    > test.out 2>&1
eval_tap $? 20 'ForgotPassword' test.out

#- 21 GetUsersByLoginIds
./ng net.accelbyte.sdk.cli.Main iam getUsersByLoginIds \
    --namespace "$AB_NAMESPACE" \
    --loginIds 'IQTuBdNE' \
    > test.out 2>&1
eval_tap $? 21 'GetUsersByLoginIds' test.out

#- 22 ResetPassword
./ng net.accelbyte.sdk.cli.Main iam resetPassword \
    --namespace "$AB_NAMESPACE" \
    --body '{"Code": "UsxFb8CJ", "LoginID": "17M7DJZa", "NewPassword": "MSxECbZb"}' \
    > test.out 2>&1
eval_tap $? 22 'ResetPassword' test.out

#- 23 SearchUser
eval_tap 0 23 'SearchUser # SKIP deprecated' test.out

#- 24 GetUserByUserID
./ng net.accelbyte.sdk.cli.Main iam getUserByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'ygyoarOR' \
    > test.out 2>&1
eval_tap $? 24 'GetUserByUserID' test.out

#- 25 UpdateUser
./ng net.accelbyte.sdk.cli.Main iam updateUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'oeNHSb8R' \
    --body '{"Country": "h3kgs9qq", "DateOfBirth": "JbnQsoBg", "DisplayName": "iVpP8Cm3", "LanguageTag": "yvASUoxd"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateUser' test.out

#- 26 DeleteUser
./ng net.accelbyte.sdk.cli.Main iam deleteUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'xxFqmAGT' \
    > test.out 2>&1
eval_tap $? 26 'DeleteUser' test.out

#- 27 BanUser
./ng net.accelbyte.sdk.cli.Main iam banUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'J8IEdagE' \
    --body '{"ban": "tp4w29KO", "comment": "u9c19R6X", "endDate": "DqWHkkP8", "reason": "npLEKMfj", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 27 'BanUser' test.out

#- 28 GetUserBanHistory
./ng net.accelbyte.sdk.cli.Main iam getUserBanHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'X7jpkVZk' \
    > test.out 2>&1
eval_tap $? 28 'GetUserBanHistory' test.out

#- 29 DisableUserBan
./ng net.accelbyte.sdk.cli.Main iam disableUserBan \
    --banId '3IaQYEmq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GodOEGt9' \
    > test.out 2>&1
eval_tap $? 29 'DisableUserBan' test.out

#- 30 EnableUserBan
./ng net.accelbyte.sdk.cli.Main iam enableUserBan \
    --banId 'gPOj0c6i' \
    --namespace "$AB_NAMESPACE" \
    --userId '0JkvIas7' \
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
    --userId '3ucYnFAJ' \
    > test.out 2>&1
eval_tap $? 34 'GetUserInformation' test.out

#- 35 DeleteUserInformation
./ng net.accelbyte.sdk.cli.Main iam deleteUserInformation \
    --namespace "$AB_NAMESPACE" \
    --userId '3DK5T4Eo' \
    > test.out 2>&1
eval_tap $? 35 'DeleteUserInformation' test.out

#- 36 GetUserLoginHistories
./ng net.accelbyte.sdk.cli.Main iam getUserLoginHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'gg0Y39Uo' \
    --after '0.7948632253789333' \
    --before '0.2433158706293611' \
    --limit '3' \
    > test.out 2>&1
eval_tap $? 36 'GetUserLoginHistories' test.out

#- 37 UpdatePassword
eval_tap 0 37 'UpdatePassword # SKIP deprecated' test.out

#- 38 SaveUserPermission
./ng net.accelbyte.sdk.cli.Main iam saveUserPermission \
    --namespace "$AB_NAMESPACE" \
    --userId 'VAgtsDhU' \
    --body '{"Permissions": [{"Action": 90, "Resource": "DUscbQDj", "SchedAction": 3, "SchedCron": "TQuPMz2P", "SchedRange": ["TRlkyU89"]}]}' \
    > test.out 2>&1
eval_tap $? 38 'SaveUserPermission' test.out

#- 39 AddUserPermission
./ng net.accelbyte.sdk.cli.Main iam addUserPermission \
    --action '82' \
    --namespace "$AB_NAMESPACE" \
    --resource 'Ow6zPFJ4' \
    --userId '2cwmzBBS' \
    --body '{"SchedAction": 76, "SchedCron": "NcoAAOjK", "SchedRange": ["NjfcYHm0"]}' \
    > test.out 2>&1
eval_tap $? 39 'AddUserPermission' test.out

#- 40 DeleteUserPermission
./ng net.accelbyte.sdk.cli.Main iam deleteUserPermission \
    --action '0' \
    --namespace "$AB_NAMESPACE" \
    --resource 'YgBU1sqj' \
    --userId 'yK0XH45P' \
    > test.out 2>&1
eval_tap $? 40 'DeleteUserPermission' test.out

#- 41 GetUserPlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam getUserPlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'aRSOFQBt' \
    > test.out 2>&1
eval_tap $? 41 'GetUserPlatformAccounts' test.out

#- 42 GetUserMapping
./ng net.accelbyte.sdk.cli.Main iam getUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'u23REZ8h' \
    --userId 'RVX7LGOv' \
    > test.out 2>&1
eval_tap $? 42 'GetUserMapping' test.out

#- 43 GetUserJusticePlatformAccount
eval_tap 0 43 'GetUserJusticePlatformAccount # SKIP deprecated' test.out

#- 44 PlatformLink
./ng net.accelbyte.sdk.cli.Main iam platformLink \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DdYiQS9i' \
    --userId '7mV1C91p' \
    --ticket 'jG9gpxL6' \
    > test.out 2>&1
eval_tap $? 44 'PlatformLink' test.out

#- 45 PlatformUnlink
./ng net.accelbyte.sdk.cli.Main iam platformUnlink \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ycTQdvln' \
    --userId '2LAuSQWE' \
    --platformNamespace 'XL6LFE1Y' \
    > test.out 2>&1
eval_tap $? 45 'PlatformUnlink' test.out

#- 46 GetPublisherUser
./ng net.accelbyte.sdk.cli.Main iam getPublisherUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ho9m126Z' \
    > test.out 2>&1
eval_tap $? 46 'GetPublisherUser' test.out

#- 47 SaveUserRoles
./ng net.accelbyte.sdk.cli.Main iam saveUserRoles \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wc8hHtWv' \
    --body '["bNYqgUqs"]' \
    > test.out 2>&1
eval_tap $? 47 'SaveUserRoles' test.out

#- 48 AddUserRole
./ng net.accelbyte.sdk.cli.Main iam addUserRole \
    --namespace "$AB_NAMESPACE" \
    --roleId 'lArFPiHU' \
    --userId 'IvaCv8kU' \
    > test.out 2>&1
eval_tap $? 48 'AddUserRole' test.out

#- 49 DeleteUserRole
./ng net.accelbyte.sdk.cli.Main iam deleteUserRole \
    --namespace "$AB_NAMESPACE" \
    --roleId '9dBBpdsJ' \
    --userId 'LhsVyExr' \
    > test.out 2>&1
eval_tap $? 49 'DeleteUserRole' test.out

#- 50 UpgradeHeadlessAccount
./ng net.accelbyte.sdk.cli.Main iam upgradeHeadlessAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'kxoot0B7' \
    --body '{"LoginID": "WOfercZd", "Password": "pMci37Ds"}' \
    > test.out 2>&1
eval_tap $? 50 'UpgradeHeadlessAccount' test.out

#- 51 UpgradeHeadlessAccountWithVerificationCode
./ng net.accelbyte.sdk.cli.Main iam upgradeHeadlessAccountWithVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId '7YSfExaI' \
    --body '{"Code": "3uzLteMb", "Password": "FAlt4hr7", "loginId": "HmOYiBA5"}' \
    > test.out 2>&1
eval_tap $? 51 'UpgradeHeadlessAccountWithVerificationCode' test.out

#- 52 UserVerification
./ng net.accelbyte.sdk.cli.Main iam userVerification \
    --namespace "$AB_NAMESPACE" \
    --userId 'ltAOXmlG' \
    --body '{"Code": "6eh1dTdo", "ContactType": "TFpBIcuC", "LanguageTag": "1dQY93OJ", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 52 'UserVerification' test.out

#- 53 SendVerificationCode
./ng net.accelbyte.sdk.cli.Main iam sendVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'J6Te9vD8' \
    --body '{"Context": "ldz7Hu8A", "LanguageTag": "D79kdWun", "LoginID": "vizU0q1p"}' \
    > test.out 2>&1
eval_tap $? 53 'SendVerificationCode' test.out

#- 54 Authorization
./ng net.accelbyte.sdk.cli.Main iam authorization \
    --login 'HyhhERoG' \
    --password 'gdrysMiz' \
    --scope 'BGSRdP2l' \
    --state '7DNSZ8Aq' \
    --clientId '0XiPLQXS' \
    --redirectUri 'e07ZddOG' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 54 'Authorization' test.out

#- 55 GetJWKS
./ng net.accelbyte.sdk.cli.Main iam getJWKS \
    > test.out 2>&1
eval_tap $? 55 'GetJWKS' test.out

#- 56 PlatformTokenRequestHandler
eval_tap 0 56 'PlatformTokenRequestHandler # SKIP deprecated' test.out

#- 57 RevokeUser
./ng net.accelbyte.sdk.cli.Main iam revokeUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'JjBwj9HJ' \
    > test.out 2>&1
eval_tap $? 57 'RevokeUser' test.out

#- 58 GetRevocationList
./ng net.accelbyte.sdk.cli.Main iam getRevocationList \
    > test.out 2>&1
eval_tap $? 58 'GetRevocationList' test.out

#- 59 RevokeToken
eval_tap 0 59 'RevokeToken # SKIP deprecated' test.out

#- 60 RevokeAUser
eval_tap 0 60 'RevokeAUser # SKIP deprecated' test.out

#- 61 TokenGrant
./ng net.accelbyte.sdk.cli.Main iam tokenGrant \
    --code 'HQKseEdS' \
    --extendExp  \
    --namespace "$AB_NAMESPACE" \
    --password 'XRDSvgua' \
    --redirectUri 'uw1xT7eM' \
    --refreshToken 'wSl9MLH0' \
    --username 'NnTJ2ulN' \
    --grantType 'refresh_token' \
    > test.out 2>&1
eval_tap $? 61 'TokenGrant' test.out

#- 62 VerifyToken
./ng net.accelbyte.sdk.cli.Main iam verifyToken \
    --token 'BvwJaQa5' \
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
    --body '{"AgeRestriction": 71, "Enable": false}' \
    > test.out 2>&1
eval_tap $? 81 'AdminUpdateAgeRestrictionConfigV2' test.out

#- 82 GetListCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam getListCountryAgeRestriction \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'GetListCountryAgeRestriction' test.out

#- 83 UpdateCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam updateCountryAgeRestriction \
    --countryCode 'lvA8RWSp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"AgeRestriction": 0}' \
    > test.out 2>&1
eval_tap $? 83 'UpdateCountryAgeRestriction' test.out

#- 84 AdminSearchUsersV2
./ng net.accelbyte.sdk.cli.Main iam adminSearchUsersV2 \
    --namespace "$AB_NAMESPACE" \
    --after 'bUt7xk6Q' \
    --before 'xyWhfqoW' \
    --displayName 'fJw2o8oW' \
    --limit '92' \
    --loginId 'qvPCZ2Hz' \
    --platformUserId 'T7NXmWDl' \
    --roleId 'XsuNIdQJ' \
    --userId 'R5lsNOlv' \
    --platformId 'kfwaSbns' \
    > test.out 2>&1
eval_tap $? 84 'AdminSearchUsersV2' test.out

#- 85 AdminGetUserByUserIdV2
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uLCgToxu' \
    > test.out 2>&1
eval_tap $? 85 'AdminGetUserByUserIdV2' test.out

#- 86 AdminUpdateUserV2
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VTekJgvg' \
    --body '{"Country": "6h5HIpH0", "DateOfBirth": "DviplEk4", "DisplayName": "vj3LDp4y", "LanguageTag": "qDt8QUZD"}' \
    > test.out 2>&1
eval_tap $? 86 'AdminUpdateUserV2' test.out

#- 87 AdminBanUserV2
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pxlHasin' \
    --body '{"ban": "GcjrkmRM", "comment": "ttgjDSaI", "endDate": "VBmft3Ud", "reason": "g7p9PGmY", "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 87 'AdminBanUserV2' test.out

#- 88 AdminGetUserBanV2
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'X4MsisSX' \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 88 'AdminGetUserBanV2' test.out

#- 89 AdminDisableUserV2
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '28nARxWR' \
    --body '{"Reason": "pv5ou5xt"}' \
    > test.out 2>&1
eval_tap $? 89 'AdminDisableUserV2' test.out

#- 90 AdminEnableUserV2
./ng net.accelbyte.sdk.cli.Main iam adminEnableUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vd28OUfC' \
    > test.out 2>&1
eval_tap $? 90 'AdminEnableUserV2' test.out

#- 91 AdminResetPasswordV2
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 't8UJC5fl' \
    --body '{"LanguageTag": "Nyj6HsTt", "NewPassword": "X8P3llna", "OldPassword": "aS9lqyyg"}' \
    > test.out 2>&1
eval_tap $? 91 'AdminResetPasswordV2' test.out

#- 92 AdminDeletePlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam adminDeletePlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PcfkJIxf' \
    --userId 'QZza8kNV' \
    --platformNamespace 'bDxVMq7H' \
    > test.out 2>&1
eval_tap $? 92 'AdminDeletePlatformLinkV2' test.out

#- 93 AdminPutUserRolesV2
./ng net.accelbyte.sdk.cli.Main iam adminPutUserRolesV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jk0F89xA' \
    --body '["c3YVfaEN"]' \
    > test.out 2>&1
eval_tap $? 93 'AdminPutUserRolesV2' test.out

#- 94 AdminCreateUserRolesV2
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserRolesV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'trl0pTKZ' \
    --body '["TXqzHuBM"]' \
    > test.out 2>&1
eval_tap $? 94 'AdminCreateUserRolesV2' test.out

#- 95 PublicGetCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestriction \
    --countryCode 'YQSA2jz1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'PublicGetCountryAgeRestriction' test.out

#- 96 PublicCreateUserV2
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"AuthType": "ZOpdOjSy", "Country": "MddB41Ju", "DisplayName": "Mf7RUyBH", "LoginId": "Rj8IiRim", "Password": "RllHT6Dc", "PasswordMD5Sum": "40vFFA6g"}' \
    > test.out 2>&1
eval_tap $? 96 'PublicCreateUserV2' test.out

#- 97 PublicForgotPasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"Context": "pU7EW3x1", "LanguageTag": "dCpm55gO", "LoginID": "eqQIqcJV"}' \
    > test.out 2>&1
eval_tap $? 97 'PublicForgotPasswordV2' test.out

#- 98 PublicResetPasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicResetPasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"Code": "KmBM1J1I", "LoginID": "buTrrkbm", "NewPassword": "uT1whOqm"}' \
    > test.out 2>&1
eval_tap $? 98 'PublicResetPasswordV2' test.out

#- 99 PublicGetUserByUserIDV2
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EnDXIWrB' \
    > test.out 2>&1
eval_tap $? 99 'PublicGetUserByUserIDV2' test.out

#- 100 PublicUpdateUserV2
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PlSay46m' \
    --body '{"Country": "v71BAZAO", "DateOfBirth": "jtFJ2vmT", "DisplayName": "j7tT7TZH", "LanguageTag": "WDdCkIsZ"}' \
    > test.out 2>&1
eval_tap $? 100 'PublicUpdateUserV2' test.out

#- 101 PublicGetUserBan
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBan \
    --namespace "$AB_NAMESPACE" \
    --userId 'oArWwPHc' \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 101 'PublicGetUserBan' test.out

#- 102 PublicUpdatePasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yFAdAtYc' \
    --body '{"LanguageTag": "iLIgRwFR", "NewPassword": "r0gwB9tz", "OldPassword": "3vp99XVl"}' \
    > test.out 2>&1
eval_tap $? 102 'PublicUpdatePasswordV2' test.out

#- 103 GetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam getListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'V8rK3tE6' \
    > test.out 2>&1
eval_tap $? 103 'GetListJusticePlatformAccounts' test.out

#- 104 PublicPlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'n0smip1t' \
    --userId 'w3L7cUd9' \
    --ticket 'pqtv6JfP' \
    > test.out 2>&1
eval_tap $? 104 'PublicPlatformLinkV2' test.out

#- 105 PublicDeletePlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam publicDeletePlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZwcCVOXc' \
    --userId 'Va80TmCw' \
    --platformNamespace 'tD2lAH01' \
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
    --body '[{"field": "o6NdcBIg", "validation": {"allowDigit": true, "allowLetter": true, "allowSpace": true, "allowUnicode": true, "description": [{"language": "WpFBYGmm", "message": ["BawMyoKy"]}], "isCustomRegex": false, "letterCase": "dAasm8xw", "maxLength": 92, "maxRepeatingAlphaNum": 10, "maxRepeatingSpecialCharacter": 50, "minCharType": 80, "minLength": 23, "regex": "QiZY4NbO", "specialCharacterLocation": "QXJ7uOTz", "specialCharacters": ["NMvuq2tN"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'l4CX4Iji' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    --after 'K4DEUJRV' \
    --before 'K3l9Eb0R' \
    --limit '99' \
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
    --body '{"ageRestriction": 86, "enable": false}' \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode '0RH8vS1s' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ageRestriction": 24}' \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --banType 'eOlngrdT' \
    --limit '99' \
    --offset '56' \
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
    --limit '51' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 118 'AdminGetClientsByNamespaceV3' test.out

#- 119 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["PBtkZMio"], "baseUri": "4wcyhloV", "clientId": "S3rYp8Qt", "clientName": "cEmCEVc7", "clientPermissions": [{"action": 92, "resource": "feypWjDN", "schedAction": 15, "schedCron": "zCL5sWS2", "schedRange": ["qwO763iE"]}], "clientPlatform": "klkzLm88", "deletable": false, "namespace": "LuYRO3C5", "oauthClientType": "5yHpwK2J", "redirectUri": "aqenDGn7", "secret": "a2NUplWi"}' \
    > test.out 2>&1
eval_tap $? 119 'AdminCreateClientV3' test.out

#- 120 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'Ljq06n6a' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 121 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId '0rW8Efkp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'AdminDeleteClientV3' test.out

#- 122 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --clientId 'aXtwYZJa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"audiences": ["Q4WbwNms"], "baseUri": "FYetjEur", "clientName": "H8eloJzN", "clientPermissions": [{"action": 72, "resource": "tRUaTz1E", "schedAction": 90, "schedCron": "dsmwzjkk", "schedRange": ["n9oiQl05"]}], "clientPlatform": "g7cO3ZMb", "deletable": false, "namespace": "lo6DMNpP", "redirectUri": "2qMrTQ1U"}' \
    > test.out 2>&1
eval_tap $? 122 'AdminUpdateClientV3' test.out

#- 123 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --clientId 'pjfU6wJh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 49, "resource": "1jOVkkUl"}]}' \
    > test.out 2>&1
eval_tap $? 123 'AdminUpdateClientPermissionV3' test.out

#- 124 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --clientId 'S79527EZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"permissions": [{"action": 69, "resource": "a8uCeZFl"}]}' \
    > test.out 2>&1
eval_tap $? 124 'AdminAddClientPermissionsV3' test.out

#- 125 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '75' \
    --clientId 'tEVpDAEb' \
    --namespace "$AB_NAMESPACE" \
    --resource 'A82jy74l' \
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
    --limit '32' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 128 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 129 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'DE5xRwh5' \
    > test.out 2>&1
eval_tap $? 129 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 130 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'b45ebpcM' \
    --body '{"ACSURL": "7ScSs3UO", "AWSCognitoRegion": "pAwIp9rR", "AWSCognitoUserPool": "tn1PcCxd", "AppId": "bumeYgOd", "ClientId": "EBWRQiW3", "Environment": "KFfU8icH", "FederationMetadataURL": "4081gRB1", "GenericOauthFlow": true, "IsActive": false, "Issuer": "Lg4RYuEb", "JWKSEndpoint": "gUDEcJyI", "KeyID": "vsPwOr0B", "NetflixCertificates": {"encryptedPrivateKey": "mV5iFvfw", "encryptedPrivateKeyName": "FjTSmIEq", "publicCertificate": "oLyLeUGm", "publicCertificateName": "omGX9sXT", "rootCertificate": "Z0v8pqLf", "rootCertificateName": "c5SwGnRe"}, "OrganizationId": "UULDX4QU", "PlatformName": "Ibb5nh68", "RedirectUri": "ZnyUtRvW", "Secret": "9hNBSFTt", "TeamID": "FrOmjkFr", "TokenAuthenticationType": "FVA8t0xF", "TokenClaimsMapping": {"34Xpt6Zl": "TTic0kr2"}}' \
    > test.out 2>&1
eval_tap $? 130 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 131 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'a0nI2oo7' \
    > test.out 2>&1
eval_tap $? 131 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 132 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UHCJK5sp' \
    --body '{"ACSURL": "0aCvIq3a", "AWSCognitoRegion": "HVYIlewL", "AWSCognitoUserPool": "RuHY83bG", "AppId": "j0HTeeWX", "ClientId": "lIcRidqc", "Environment": "tDpygY0a", "FederationMetadataURL": "x476ED4M", "GenericOauthFlow": true, "IsActive": true, "Issuer": "hWIwHWTg", "JWKSEndpoint": "zJFRYw6t", "KeyID": "1IKZLO6V", "NetflixCertificates": {"encryptedPrivateKey": "4Ode46Qm", "encryptedPrivateKeyName": "CidgdpP7", "publicCertificate": "RTC587lm", "publicCertificateName": "UmBziPZB", "rootCertificate": "npOfkllx", "rootCertificateName": "fq0NsrSj"}, "OrganizationId": "w5Hog0bl", "PlatformName": "M1d5MStY", "RedirectUri": "GczLINlE", "Secret": "C0OEsE3y", "TeamID": "zIsUP0Nj", "TokenAuthenticationType": "luOrGZTz", "TokenClaimsMapping": {"sLW7Fjfs": "9nIkcZ38"}}' \
    > test.out 2>&1
eval_tap $? 132 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 133 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'fUEanjKH' \
    --body '{"affectedClientIDs": ["bXfk1zxd"], "assignedNamespaces": ["zxg0UXcR"], "domain": "yHi3u8Bz", "roleId": "VWu1tOmh"}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 134 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'UtCgcpvG' \
    --body '{"domain": "rEbcZUDE"}' \
    > test.out 2>&1
eval_tap $? 134 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 135 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'xH1tayOG' \
    > test.out 2>&1
eval_tap $? 135 'RetrieveSSOLoginPlatformCredential' test.out

#- 136 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XIHzMRjM' \
    --body '{"acsUrl": "CtOJsEij", "apiKey": "lrbpyyEc", "appId": "QxVgJIjM", "federationMetadataUrl": "ZqcWfMl6", "isActive": false, "redirectUri": "qrpD4tnc", "secret": "3ZRB3Ikd", "ssoUrl": "tPfAJEom"}' \
    > test.out 2>&1
eval_tap $? 136 'AddSSOLoginPlatformCredential' test.out

#- 137 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'wenJvQ8g' \
    > test.out 2>&1
eval_tap $? 137 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 138 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'rtQSv6Ec' \
    --body '{"acsUrl": "ALcMIPms", "apiKey": "5bT51M4y", "appId": "ko8S0EnG", "federationMetadataUrl": "LvGvfuSy", "isActive": true, "redirectUri": "Tyjj4mCa", "secret": "iuMGKOF5", "ssoUrl": "GJJooSXU"}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateSSOPlatformCredential' test.out

#- 139 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'l3YU35QH' \
    --platformUserId 'GpBABnOl' \
    > test.out 2>&1
eval_tap $? 139 'AdminGetUserByPlatformUserIDV3' test.out

#- 140 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'xDznICQV' \
    --after '48' \
    --before '33' \
    --limit '55' \
    > test.out 2>&1
eval_tap $? 140 'GetAdminUsersByRoleIdV3' test.out

#- 141 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'g34WTtDk' \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByEmailAddressV3' test.out

#- 142 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["n0rtn6t0"]}' \
    > test.out 2>&1
eval_tap $? 142 'AdminListUserIDByUserIDsV3' test.out

#- 143 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddresses": ["Yx4z12Ea"], "isAdmin": true, "roles": ["UQYCNTiD"]}' \
    > test.out 2>&1
eval_tap $? 143 'AdminInviteUserV3' test.out

#- 144 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 144 'AdminListUsersV3' test.out

#- 145 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'E3M2IsTH' \
    --endDate 'u8QwNyOl' \
    --limit '99' \
    --offset '10' \
    --platformBy 'IWd0mcq5' \
    --platformId 'T4SUc7cW' \
    --query 'fCKK6Dij' \
    --startDate '1gFcenEM' \
    > test.out 2>&1
eval_tap $? 145 'AdminSearchUserV3' test.out

#- 146 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"listEmailAddressRequest": ["ySPfhxBe"]}' \
    > test.out 2>&1
eval_tap $? 146 'AdminGetBulkUserByEmailAddressV3' test.out

#- 147 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nDiTiAqF' \
    > test.out 2>&1
eval_tap $? 147 'AdminGetUserByUserIdV3' test.out

#- 148 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YmFKjaEL' \
    --body '{"avatarUrl": "mmll6oex", "country": "Id1OKGUN", "dateOfBirth": "2Uznd7uV", "displayName": "a7t14yvS", "languageTag": "YSV52bHi", "userName": "fCIf4tsu"}' \
    > test.out 2>&1
eval_tap $? 148 'AdminUpdateUserV3' test.out

#- 149 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'u6Pkam6t' \
    --activeOnly  \
    --after 'FSYFt4Zx' \
    --before 'A2PzZFRk' \
    --limit '55' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserBanV3' test.out

#- 150 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nlg6hn5q' \
    --body '{"ban": "usKyZAuV", "comment": "6uUvqM0l", "endDate": "V6UZMlEb", "reason": "xHNgJRiQ", "skipNotif": true}' \
    > test.out 2>&1
eval_tap $? 150 'AdminBanUserV3' test.out

#- 151 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --banId 'xaunjdAq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nHUz44tx' \
    --body '{"enabled": false, "skipNotif": false}' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserBanV3' test.out

#- 152 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mPwNoi07' \
    --body '{"context": "1ezDK56J", "emailAddress": "FIGe1IMU", "languageTag": "CLcN0Dsa"}' \
    > test.out 2>&1
eval_tap $? 152 'AdminSendVerificationCodeV3' test.out

#- 153 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'D5FyBsFe' \
    --body '{"Code": "9OYEJVsY", "ContactType": "ffmhyx6J", "LanguageTag": "25PrM4S3", "validateOnly": false}' \
    > test.out 2>&1
eval_tap $? 153 'AdminVerifyAccountV3' test.out

#- 154 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'B8m17hEe' \
    > test.out 2>&1
eval_tap $? 154 'GetUserVerificationCode' test.out

#- 155 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LLgoaYth' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetUserDeletionStatusV3' test.out

#- 156 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6zcf8eA4' \
    --body '{"enabled": true}' \
    > test.out 2>&1
eval_tap $? 156 'AdminUpdateUserDeletionStatusV3' test.out

#- 157 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ObWejo9L' \
    --body '{"code": "fGeegJMa", "country": "BGR6D1Zo", "dateOfBirth": "ZEZQkJ8D", "displayName": "SqFnhdKv", "emailAddress": "jFCFbSFl", "password": "EWoMPdgK", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 157 'AdminUpgradeHeadlessAccountV3' test.out

#- 158 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'n62mhnFS' \
    > test.out 2>&1
eval_tap $? 158 'AdminDeleteUserInformationV3' test.out

#- 159 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pCTlDNBO' \
    --after '0.03858691737877895' \
    --before '0.09558144465134844' \
    --limit '43' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetUserLoginHistoriesV3' test.out

#- 160 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2LAgfBGV' \
    --body '{"Permissions": [{"Action": 50, "Resource": "anbKYsB0", "SchedAction": 12, "SchedCron": "qJ8VhYSi", "SchedRange": ["kJl2p9rB"]}]}' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpdateUserPermissionV3' test.out

#- 161 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'x8N5egap' \
    --body '{"Permissions": [{"Action": 33, "Resource": "xDy4cLfN", "SchedAction": 18, "SchedCron": "zzEZYA8j", "SchedRange": ["IkMJb7cZ"]}]}' \
    > test.out 2>&1
eval_tap $? 161 'AdminAddUserPermissionsV3' test.out

#- 162 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2bPsaLLp' \
    --body '[{"Action": 61, "Resource": "BVEMk5As"}]' \
    > test.out 2>&1
eval_tap $? 162 'AdminDeleteUserPermissionBulkV3' test.out

#- 163 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '73' \
    --namespace "$AB_NAMESPACE" \
    --resource 'aF2P44lX' \
    --userId 'kI3zdiRi' \
    > test.out 2>&1
eval_tap $? 163 'AdminDeleteUserPermissionV3' test.out

#- 164 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'C5IbPit7' \
    --after '1JWlYCoi' \
    --before '4nDfPu5V' \
    --limit '85' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetUserPlatformAccountsV3' test.out

#- 165 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'SYxEVOry' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetListJusticePlatformAccounts' test.out

#- 166 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'VuZYmgUe' \
    --userId 'EPB5AGPg' \
    > test.out 2>&1
eval_tap $? 166 'AdminCreateJusticeUser' test.out

#- 167 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'vk0Zthaj' \
    --body '{"platformId": "0EBA4azR", "platformUserId": "z0d56smo"}' \
    > test.out 2>&1
eval_tap $? 167 'AdminLinkPlatformAccount' test.out

#- 168 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bor4p1Pl' \
    --userId 'gQB9EcNG' \
    --body '{"platformNamespace": "OeBRY6G5"}' \
    > test.out 2>&1
eval_tap $? 168 'AdminPlatformUnlinkV3' test.out

#- 169 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ae07deDL' \
    --userId 'aZ8JCvbe' \
    --ticket 'TfW0hgzr' \
    > test.out 2>&1
eval_tap $? 169 'AdminPlatformLinkV3' test.out

#- 170 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'abLJxEwJ' \
    --body '["rEBmQ64h"]' \
    > test.out 2>&1
eval_tap $? 170 'AdminDeleteUserRolesV3' test.out

#- 171 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aNOzlGu6' \
    --body '[{"namespace": "8UYyupjd", "roleId": "DetnoT0r"}]' \
    > test.out 2>&1
eval_tap $? 171 'AdminSaveUserRoleV3' test.out

#- 172 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'fWtVPwQf' \
    --userId 'q6V92gbf' \
    > test.out 2>&1
eval_tap $? 172 'AdminAddUserRoleV3' test.out

#- 173 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'PouNdmP7' \
    --userId 'fckVnuDG' \
    > test.out 2>&1
eval_tap $? 173 'AdminDeleteUserRoleV3' test.out

#- 174 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vYIb1p5t' \
    --body '{"enabled": false, "reason": "R5z8ZJLj"}' \
    > test.out 2>&1
eval_tap $? 174 'AdminUpdateUserStatusV3' test.out

#- 175 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SHcaR3X4' \
    > test.out 2>&1
eval_tap $? 175 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 176 AdminUpdateClientSecretV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientSecretV3 \
    --clientId 'tZmwr0Qm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newSecret": "OnsEg49e"}' \
    > test.out 2>&1
eval_tap $? 176 'AdminUpdateClientSecretV3' test.out

#- 177 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    --after 'Xp0xQkZ2' \
    --before 'JjuwWWy0' \
    --isWildcard  \
    --limit '38' \
    > test.out 2>&1
eval_tap $? 177 'AdminGetRolesV3' test.out

#- 178 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "managers": [{"displayName": "vejUKwVf", "namespace": "F37Vr7mk", "userId": "DzFBI1Vw"}], "members": [{"displayName": "hkVSKDlN", "namespace": "FOUHBJsv", "userId": "Tsqk9hg4"}], "permissions": [{"action": 15, "resource": "j6nUdebW", "schedAction": 93, "schedCron": "skbPkkZA", "schedRange": ["k01f1KxC"]}], "roleName": "tWADU2gu"}' \
    > test.out 2>&1
eval_tap $? 178 'AdminCreateRoleV3' test.out

#- 179 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'N6U9w13W' \
    > test.out 2>&1
eval_tap $? 179 'AdminGetRoleV3' test.out

#- 180 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId '1K9TZQ4q' \
    > test.out 2>&1
eval_tap $? 180 'AdminDeleteRoleV3' test.out

#- 181 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --roleId 'RLEi5wow' \
    --body '{"deletable": true, "isWildcard": true, "roleName": "fmM0CCs3"}' \
    > test.out 2>&1
eval_tap $? 181 'AdminUpdateRoleV3' test.out

#- 182 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId '5TPUPLms' \
    > test.out 2>&1
eval_tap $? 182 'AdminGetRoleAdminStatusV3' test.out

#- 183 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'Y8WgwSx1' \
    > test.out 2>&1
eval_tap $? 183 'AdminUpdateAdminRoleStatusV3' test.out

#- 184 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'DI5GH9bv' \
    > test.out 2>&1
eval_tap $? 184 'AdminRemoveRoleAdminV3' test.out

#- 185 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId '9ZTo2HpA' \
    --after '6pzjHpZO' \
    --before '0E9iLgRP' \
    --limit '70' \
    > test.out 2>&1
eval_tap $? 185 'AdminGetRoleManagersV3' test.out

#- 186 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --roleId 'K3nBae3G' \
    --body '{"managers": [{"displayName": "OgbQrqra", "namespace": "0PtkfvOp", "userId": "Y2ramp5l"}]}' \
    > test.out 2>&1
eval_tap $? 186 'AdminAddRoleManagersV3' test.out

#- 187 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --roleId 'nBn6xmBk' \
    --body '{"managers": [{"displayName": "fMtC66hF", "namespace": "q0kPOkOR", "userId": "m2XjlNEE"}]}' \
    > test.out 2>&1
eval_tap $? 187 'AdminRemoveRoleManagersV3' test.out

#- 188 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId '5ecPzAmi' \
    --after '0ySJHfPl' \
    --before 'oP1XkYK4' \
    --limit '76' \
    > test.out 2>&1
eval_tap $? 188 'AdminGetRoleMembersV3' test.out

#- 189 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --roleId 'gIsDSFMP' \
    --body '{"members": [{"displayName": "yMhyw1OL", "namespace": "ZPVwwxH4", "userId": "BIDJuDoS"}]}' \
    > test.out 2>&1
eval_tap $? 189 'AdminAddRoleMembersV3' test.out

#- 190 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --roleId 'hMMftll8' \
    --body '{"members": [{"displayName": "N0VvChHz", "namespace": "9urmt7QW", "userId": "vE8s6Uz8"}]}' \
    > test.out 2>&1
eval_tap $? 190 'AdminRemoveRoleMembersV3' test.out

#- 191 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --roleId 'BRuYWDTt' \
    --body '{"permissions": [{"action": 75, "resource": "6MTTRkCb", "schedAction": 2, "schedCron": "9S5Q1IVH", "schedRange": ["GT88prRE"]}]}' \
    > test.out 2>&1
eval_tap $? 191 'AdminUpdateRolePermissionsV3' test.out

#- 192 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --roleId 'BgYOWdHJ' \
    --body '{"permissions": [{"action": 70, "resource": "umohtU13", "schedAction": 12, "schedCron": "f7TRigNZ", "schedRange": ["j5w5y3Hm"]}]}' \
    > test.out 2>&1
eval_tap $? 192 'AdminAddRolePermissionsV3' test.out

#- 193 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --roleId 'K8QVOa62' \
    --body '["eQZtbLLc"]' \
    > test.out 2>&1
eval_tap $? 193 'AdminDeleteRolePermissionsV3' test.out

#- 194 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '63' \
    --resource '671WLtv3' \
    --roleId '8Hecczop' \
    > test.out 2>&1
eval_tap $? 194 'AdminDeleteRolePermissionV3' test.out

#- 195 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 195 'AdminGetMyUserV3' test.out

#- 196 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --clientId 'FmeRwpcJ' \
    --extendExp  \
    --redirectUri 'BZyi3mLC' \
    --password '4KzekiSz' \
    --requestId 'eyolnOQt' \
    --userName '0joVHgCy' \
    > test.out 2>&1
eval_tap $? 196 'UserAuthenticationV3' test.out

#- 197 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --extendExp  \
    --clientId 'tC6lRG98' \
    --linkingToken 'YxnHbRdo' \
    --password 'TKKeuSjf' \
    --username 'Ze9i1osg' \
    > test.out 2>&1
eval_tap $? 197 'AuthenticationWithPlatformLinkV3' test.out

#- 198 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --extendExp  \
    --linkingToken 'hF1hzi1N' \
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
    --platformId 'l47syJ5i' \
    --userId 'bzSHZeCL' \
    > test.out 2>&1
eval_tap $? 201 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 202 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IvWPVRsd' \
    > test.out 2>&1
eval_tap $? 202 'RevokeUserV3' test.out

#- 203 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --codeChallenge 'EqA61yTr' \
    --codeChallengeMethod 'S256' \
    --createHeadless  \
    --redirectUri 'sycTgmPz' \
    --scope 'c20EuO5d' \
    --state 'MqGDlSZP' \
    --targetAuthPage 'Y07rEVSj' \
    --clientId 'zHjL6ZbX' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 203 'AuthorizeV3' test.out

#- 204 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'G6DSmpp3' \
    > test.out 2>&1
eval_tap $? 204 'TokenIntrospectionV3' test.out

#- 205 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 205 'GetJWKSV3' test.out

#- 206 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'op8htaRL' \
    --mfaToken 'xtW4PvFk' \
    > test.out 2>&1
eval_tap $? 206 'Change2faMethod' test.out

#- 207 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'ESTULat5' \
    --factor 'F1Le7cR7' \
    --mfaToken 'q6PWhZmm' \
    --rememberDevice  \
    > test.out 2>&1
eval_tap $? 207 'Verify2faCode' test.out

#- 208 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Kz41i1Tp' \
    --userId '78FipJHa' \
    > test.out 2>&1
eval_tap $? 208 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 209 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'hViJvLYW' \
    --clientId '0kdmlk2l' \
    --redirectUri 'uqSOOA2V' \
    --requestId 'OZBoNbB9' \
    > test.out 2>&1
eval_tap $? 209 'AuthCodeRequestV3' test.out

#- 210 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId '8PuSGykq' \
    --clientId 'FzPwSMXT' \
    --createHeadless  \
    --deviceId '53bBuL38' \
    --platformToken 'beOYDVuH' \
    > test.out 2>&1
eval_tap $? 210 'PlatformTokenGrantV3' test.out

#- 211 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 211 'GetRevocationListV3' test.out

#- 212 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'ZQ9LYt6w' \
    > test.out 2>&1
eval_tap $? 212 'TokenRevocationV3' test.out

#- 213 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --clientId '23Wf8iEQ' \
    --code 'o72sH0aR' \
    --codeVerifier 'dcDlDyGc' \
    --extendExp  \
    --password 'sfIuI4Dv' \
    --redirectUri '5lEJpK1A' \
    --refreshToken 'yRlzsrRX' \
    --username 'EFZivQOH' \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 213 'TokenGrantV3' test.out

#- 214 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId 'VicNrats' \
    --code 'vvHLmIoh' \
    --error 'fNISLXMD' \
    --openidAssocHandle 'WDdm5FE4' \
    --openidClaimedId 'lliQMnut' \
    --openidIdentity 'JbpEo4mU' \
    --openidMode 'NHFtdml2' \
    --openidNs 'xNviWacJ' \
    --openidOpEndpoint 'c3Fm7Z54' \
    --openidResponseNonce '8uuKgoCB' \
    --openidReturnTo 'qS5uIdCb' \
    --openidSig 'wCeeq9ou' \
    --openidSigned 'EdDtjOgs' \
    --state 'ypLkm2ZY' \
    > test.out 2>&1
eval_tap $? 214 'PlatformAuthenticationV3' test.out

#- 215 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    --defaultOnEmpty  \
    --languageCode 'ew5H7Zm0' \
    > test.out 2>&1
eval_tap $? 215 'PublicGetInputValidations' test.out

#- 216 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 216 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 217 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'gnYyj6MX' \
    --body '{"platformUserIds": ["f9G1ntye"]}' \
    > test.out 2>&1
eval_tap $? 217 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 218 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bvoeHenA' \
    --platformUserId 'ALKt7Efx' \
    > test.out 2>&1
eval_tap $? 218 'PublicGetUserByPlatformUserIDV3' test.out

#- 219 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'IH446oUn' \
    > test.out 2>&1
eval_tap $? 219 'PublicGetAsyncStatus' test.out

#- 220 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    --by 'P2S74unX' \
    --limit '44' \
    --offset '13' \
    --query '0JKqVWW1' \
    > test.out 2>&1
eval_tap $? 220 'PublicSearchUserV3' test.out

#- 221 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"PasswordMD5Sum": "rjK1epwk", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "vcsYvbgf", "policyId": "BVPpTa8Y", "policyVersionId": "uq7TKiNX"}], "authType": "mz7eMrMD", "code": "5TbaUxTC", "country": "Tng0xjtd", "dateOfBirth": "Brjs3Kiy", "displayName": "kt2Ck2gO", "emailAddress": "lSatECZ2", "password": "UgwQLqDq", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 221 'PublicCreateUserV3' test.out

#- 222 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'TPuVlBqi' \
    --query 'rdp3yxns' \
    > test.out 2>&1
eval_tap $? 222 'CheckUserAvailability' test.out

#- 223 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["ETl1SvhQ"]}' \
    > test.out 2>&1
eval_tap $? 223 'PublicBulkGetUsers' test.out

#- 224 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "udsjIhXd", "languageTag": "xiSoWpnn"}' \
    > test.out 2>&1
eval_tap $? 224 'PublicSendRegistrationCode' test.out

#- 225 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "xgX7BCPM", "emailAddress": "qzQIxibh"}' \
    > test.out 2>&1
eval_tap $? 225 'PublicVerifyRegistrationCode' test.out

#- 226 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "pNYsHtdB", "languageTag": "3IkjuaZq"}' \
    > test.out 2>&1
eval_tap $? 226 'PublicForgotPasswordV3' test.out

#- 227 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'hJilrZkS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 227 'GetAdminInvitationV3' test.out

#- 228 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --invitationId 'SKgP5rxC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "5CA1GORS", "policyId": "bL9n0dbW", "policyVersionId": "DEupmdLQ"}], "authType": "EMAILPASSWD", "country": "PnNfBAcW", "dateOfBirth": "ArbkCfdH", "displayName": "IZb03otq", "password": "mBuS9V2p", "reachMinimumAge": true}' \
    > test.out 2>&1
eval_tap $? 228 'CreateUserFromInvitationV3' test.out

#- 229 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "Z23UHmk0", "country": "lpJ4JLl0", "dateOfBirth": "1qi7L2oD", "displayName": "UoVRUb39", "languageTag": "j22P4Sp0", "userName": "9cKmjRUb"}' \
    > test.out 2>&1
eval_tap $? 229 'UpdateUserV3' test.out

#- 230 PublicUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "ZVBVS7OK", "country": "2Zrdcsck", "dateOfBirth": "MekROWZ2", "displayName": "KUTqkK2e", "languageTag": "FaGLoSmE", "userName": "EPbLywJs"}' \
    > test.out 2>&1
eval_tap $? 230 'PublicUpdateUserV3' test.out

#- 231 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"context": "yUie6fZg", "emailAddress": "LllUPsO8", "languageTag": "lg46Si70"}' \
    > test.out 2>&1
eval_tap $? 231 'PublicSendVerificationCodeV3' test.out

#- 232 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "06vL2w4a", "contactType": "ajDAOx0i", "languageTag": "JjYleakt", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 232 'PublicUserVerificationV3' test.out

#- 233 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "v2WkljQu", "country": "D5mnJONq", "dateOfBirth": "HGq8mB7m", "displayName": "F2lMFcag", "emailAddress": "hFXJIJfl", "password": "RHFcsIqC", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 233 'PublicUpgradeHeadlessAccountV3' test.out

#- 234 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "4xDifSSQ", "password": "5On2ccEc"}' \
    > test.out 2>&1
eval_tap $? 234 'PublicVerifyHeadlessAccountV3' test.out

#- 235 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"languageTag": "l3xeiO4b", "newPassword": "wF5JOjGo", "oldPassword": "GxKM3qMc"}' \
    > test.out 2>&1
eval_tap $? 235 'PublicUpdatePasswordV3' test.out

#- 236 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'e5tfLcpj' \
    > test.out 2>&1
eval_tap $? 236 'PublicCreateJusticeUser' test.out

#- 237 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'FZMKCbp0' \
    --redirectUri 'pEbLCLFp' \
    --ticket 'HxMYF836' \
    > test.out 2>&1
eval_tap $? 237 'PublicPlatformLinkV3' test.out

#- 238 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '075xEpzd' \
    --body '{"platformNamespace": "nYtpja5i"}' \
    > test.out 2>&1
eval_tap $? 238 'PublicPlatformUnlinkV3' test.out

#- 239 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'g2isQZga' \
    > test.out 2>&1
eval_tap $? 239 'PublicPlatformUnlinkAllV3' test.out

#- 240 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId '6Vy76izP' \
    --clientId 'iQRjYa8f' \
    --redirectUri 'v5fIt22t' \
    > test.out 2>&1
eval_tap $? 240 'PublicWebLinkPlatform' test.out

#- 241 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'IZhjhgki' \
    --state 'gW22zXMW' \
    > test.out 2>&1
eval_tap $? 241 'PublicWebLinkPlatformEstablish' test.out

#- 242 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "XfbcM0GI", "emailAddress": "ALIbFCQg", "newPassword": "BcLNT6iO"}' \
    > test.out 2>&1
eval_tap $? 242 'ResetPasswordV3' test.out

#- 243 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QVYx5rW2' \
    > test.out 2>&1
eval_tap $? 243 'PublicGetUserByUserIdV3' test.out

#- 244 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gMsI1aYB' \
    --activeOnly  \
    --after 'itSn3UDe' \
    --before 'Kj97I4WY' \
    --limit '99' \
    > test.out 2>&1
eval_tap $? 244 'PublicGetUserBanHistoryV3' test.out

#- 245 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LqjN7ktO' \
    > test.out 2>&1
eval_tap $? 245 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 246 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BTraBxWR' \
    --after '0.7065994795237186' \
    --before '0.3223408966322733' \
    --limit '60' \
    > test.out 2>&1
eval_tap $? 246 'PublicGetUserLoginHistoriesV3' test.out

#- 247 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qGlKDwTK' \
    --after 'XBrXiQcd' \
    --before '9IW8kiCK' \
    --limit '9' \
    > test.out 2>&1
eval_tap $? 247 'PublicGetUserPlatformAccountsV3' test.out

#- 248 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --namespace "$AB_NAMESPACE" \
    --userId 'QJWZBvcq' \
    --body '{"platformId": "1ETvWBxY", "platformUserId": "ZJh7B8gb"}' \
    > test.out 2>&1
eval_tap $? 248 'PublicLinkPlatformAccount' test.out

#- 249 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'nSu9M2Ox' \
    --body '{"chosenNamespaces": ["D2udaeYp"], "requestId": "CXYSMiy8"}' \
    > test.out 2>&1
eval_tap $? 249 'PublicForceLinkPlatformWithProgression' test.out

#- 250 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7CTqEQBg' \
    --password '36my3sY2' \
    > test.out 2>&1
eval_tap $? 250 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 251 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    --after 'clrDcain' \
    --before '0cOVF1zH' \
    --isWildcard  \
    --limit '45' \
    > test.out 2>&1
eval_tap $? 251 'PublicGetRolesV3' test.out

#- 252 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'DTI0sJ1Q' \
    > test.out 2>&1
eval_tap $? 252 'PublicGetRoleV3' test.out

#- 253 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 253 'PublicGetMyUserV3' test.out

#- 254 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId '0kphMTgg' \
    --code 'SP2SLcuA' \
    --error 'P7vU971C' \
    --state 'zw2nbg8C' \
    > test.out 2>&1
eval_tap $? 254 'PlatformAuthenticateSAMLV3Handler' test.out

#- 255 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId '7Mvywhu6' \
    --payload 'MjOjuGzo' \
    > test.out 2>&1
eval_tap $? 255 'LoginSSOClient' test.out

#- 256 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId '1Fz4tU0a' \
    > test.out 2>&1
eval_tap $? 256 'LogoutSSOClient' test.out

#- 257 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Sn98N8qO"]}' \
    > test.out 2>&1
eval_tap $? 257 'AdminBulkCheckValidUserIDV4' test.out

#- 258 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UA0z92Ra' \
    --body '{"avatarUrl": "De8ngT8L", "country": "RQkMnG1L", "dateOfBirth": "ZyF2mdYY", "displayName": "6ZMfuTYT", "languageTag": "Ksue48qB", "userName": "EBNAV5BT"}' \
    > test.out 2>&1
eval_tap $? 258 'AdminUpdateUserV4' test.out

#- 259 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'e6ec1zA9' \
    --body '{"code": "2URCLSGP", "emailAddress": "mRBZWunH"}' \
    > test.out 2>&1
eval_tap $? 259 'AdminUpdateUserEmailAddressV4' test.out

#- 260 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'W7MYvr6Q' \
    > test.out 2>&1
eval_tap $? 260 'AdminDisableUserMFAV4' test.out

#- 261 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A7Ppepc9' \
    > test.out 2>&1
eval_tap $? 261 'AdminListUserRolesV4' test.out

#- 262 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '2HA94eAC' \
    --body '{"assignedNamespaces": ["deyfUpgi"], "roleId": "Ppf8nxKJ"}' \
    > test.out 2>&1
eval_tap $? 262 'AdminUpdateUserRoleV4' test.out

#- 263 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '3dnmtPwa' \
    --body '{"assignedNamespaces": ["64Y4gPEK"], "roleId": "Mhhu9a6f"}' \
    > test.out 2>&1
eval_tap $? 263 'AdminAddUserRoleV4' test.out

#- 264 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '3xJNtUlK' \
    --body '{"assignedNamespaces": ["LlIIAeHb"], "roleId": "m5M6LsY1"}' \
    > test.out 2>&1
eval_tap $? 264 'AdminRemoveUserRoleV4' test.out

#- 265 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    --adminRole  \
    --isWildcard  \
    --limit '95' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 265 'AdminGetRolesV4' test.out

#- 266 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "Rls68M3M"}' \
    > test.out 2>&1
eval_tap $? 266 'AdminCreateRoleV4' test.out

#- 267 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'PMRPBepy' \
    > test.out 2>&1
eval_tap $? 267 'AdminGetRoleV4' test.out

#- 268 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'yMz6zfR1' \
    > test.out 2>&1
eval_tap $? 268 'AdminDeleteRoleV4' test.out

#- 269 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --roleId 'pvTYYtDO' \
    --body '{"adminRole": false, "deletable": true, "isWildcard": false, "roleName": "4RuEcHCS"}' \
    > test.out 2>&1
eval_tap $? 269 'AdminUpdateRoleV4' test.out

#- 270 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --roleId 'GhpOZQFl' \
    --body '{"permissions": [{"action": 45, "resource": "OiuKGDFg", "schedAction": 73, "schedCron": "49YuKnXk", "schedRange": ["s0m8ANrc"]}]}' \
    > test.out 2>&1
eval_tap $? 270 'AdminUpdateRolePermissionsV4' test.out

#- 271 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --roleId 'Ral7ta3f' \
    --body '{"permissions": [{"action": 28, "resource": "jA3h4MMW", "schedAction": 53, "schedCron": "J5zlsFBw", "schedRange": ["jvLYvmg6"]}]}' \
    > test.out 2>&1
eval_tap $? 271 'AdminAddRolePermissionsV4' test.out

#- 272 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --roleId 'avudQFF1' \
    --body '["CPNY9u2d"]' \
    > test.out 2>&1
eval_tap $? 272 'AdminDeleteRolePermissionsV4' test.out

#- 273 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'VYdglOOo' \
    --after 'CeK0kPKm' \
    --before 'BqVux3lX' \
    --limit '5' \
    > test.out 2>&1
eval_tap $? 273 'AdminListAssignedUsersV4' test.out

#- 274 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --roleId 'D8aertAV' \
    --body '{"assignedNamespaces": ["Cqs8XT8x"], "namespace": "y3nJ06Kk", "userId": "seA0ARj9"}' \
    > test.out 2>&1
eval_tap $? 274 'AdminAssignUserToRoleV4' test.out

#- 275 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --roleId 'ricfayvn' \
    --body '{"namespace": "hi8MDdY4", "userId": "WLHoaUkY"}' \
    > test.out 2>&1
eval_tap $? 275 'AdminRevokeUserFromRoleV4' test.out

#- 276 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "nQp5egdm", "country": "VE8ImivN", "dateOfBirth": "tQxqWRKH", "displayName": "ohODoWOr", "languageTag": "98kjBUas", "userName": "9jjz2Frg"}' \
    > test.out 2>&1
eval_tap $? 276 'AdminUpdateMyUserV4' test.out

#- 277 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 277 'AdminDisableMyAuthenticatorV4' test.out

#- 278 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    --code 'iaGrcB7d' \
    > test.out 2>&1
eval_tap $? 278 'AdminEnableMyAuthenticatorV4' test.out

#- 279 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 279 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 280 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 280 'AdminGetMyBackupCodesV4' test.out

#- 281 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 281 'AdminGenerateMyBackupCodesV4' test.out

#- 282 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 282 'AdminDisableMyBackupCodesV4' test.out

#- 283 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 283 'AdminDownloadMyBackupCodesV4' test.out

#- 284 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 284 'AdminEnableMyBackupCodesV4' test.out

#- 285 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 285 'AdminGetMyEnabledFactorsV4' test.out

#- 286 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'IOVKIPSJ' \
    > test.out 2>&1
eval_tap $? 286 'AdminMakeFactorMyDefaultV4' test.out

#- 287 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["JHo5W8tK"], "emailAddresses": ["H8ou9Sdb"], "isAdmin": true, "roleId": "SXcrEFCw"}' \
    > test.out 2>&1
eval_tap $? 287 'AdminInviteUserV4' test.out

#- 288 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "eGNLdIBR", "policyId": "dliFQVMK", "policyVersionId": "EzVUWlUW"}], "authType": "EMAILPASSWD", "country": "s2x1EQU0", "dateOfBirth": "oepEvcja", "displayName": "SgEh6jJn", "emailAddress": "FxinIHJ1", "password": "o7aq5Zzn", "passwordMD5Sum": "d5eacobT", "username": "suRlhreQ", "verified": true}' \
    > test.out 2>&1
eval_tap $? 288 'PublicCreateTestUserV4' test.out

#- 289 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "3o8hJWVj", "policyId": "KIOAw70D", "policyVersionId": "vAHhSGWU"}], "authType": "EMAILPASSWD", "code": "zq1Za3IB", "country": "C4vQFsUJ", "dateOfBirth": "PfiaJp1r", "displayName": "t7OBgBCe", "emailAddress": "6N0eI65M", "password": "n5tngEYX", "passwordMD5Sum": "gPVT5CqX", "reachMinimumAge": true, "username": "ZBVMJyJe"}' \
    > test.out 2>&1
eval_tap $? 289 'PublicCreateUserV4' test.out

#- 290 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --invitationId 'KFO92YDt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "ZvJoKS0O", "policyId": "xyipZuO4", "policyVersionId": "N9S2YCgH"}], "authType": "EMAILPASSWD", "country": "6XBcvGRY", "dateOfBirth": "k5rUtWHC", "displayName": "nhmzzppV", "password": "7tKNKYUQ", "reachMinimumAge": true, "username": "XymWcNlH"}' \
    > test.out 2>&1
eval_tap $? 290 'CreateUserFromInvitationV4' test.out

#- 291 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarUrl": "aFxYaGHU", "country": "pmBFyOrF", "dateOfBirth": "KtxGNAi0", "displayName": "fq4xChPL", "languageTag": "d2lOopc7", "userName": "XoVpdd6r"}' \
    > test.out 2>&1
eval_tap $? 291 'PublicUpdateUserV4' test.out

#- 292 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "CpyMrnH9", "emailAddress": "YHXh7KnC"}' \
    > test.out 2>&1
eval_tap $? 292 'PublicUpdateUserEmailAddressV4' test.out

#- 293 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "VOKY2zsB", "country": "RGtd8QY2", "dateOfBirth": "OLbijrvf", "displayName": "r8hknjWU", "emailAddress": "WdMUXHvw", "password": "4pNlGLjd", "reachMinimumAge": true, "username": "xLM079pD", "validateOnly": true}' \
    > test.out 2>&1
eval_tap $? 293 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 294 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --namespace "$AB_NAMESPACE" \
    --body '{"emailAddress": "bTgmsEYE", "password": "q2GkYK1v", "username": "Ym9flXQ7"}' \
    > test.out 2>&1
eval_tap $? 294 'PublicUpgradeHeadlessAccountV4' test.out

#- 295 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 295 'PublicDisableMyAuthenticatorV4' test.out

#- 296 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    --code 'CQoemnQG' \
    > test.out 2>&1
eval_tap $? 296 'PublicEnableMyAuthenticatorV4' test.out

#- 297 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 297 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 298 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 298 'PublicGetMyBackupCodesV4' test.out

#- 299 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 299 'PublicGenerateMyBackupCodesV4' test.out

#- 300 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 300 'PublicDisableMyBackupCodesV4' test.out

#- 301 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 301 'PublicDownloadMyBackupCodesV4' test.out

#- 302 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 302 'PublicEnableMyBackupCodesV4' test.out

#- 303 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    --deviceToken '0dH0NVM9' \
    > test.out 2>&1
eval_tap $? 303 'PublicRemoveTrustedDeviceV4' test.out

#- 304 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 304 'PublicGetMyEnabledFactorsV4' test.out

#- 305 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --namespace "$AB_NAMESPACE" \
    --factor 'VEHTPqDh' \
    > test.out 2>&1
eval_tap $? 305 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE