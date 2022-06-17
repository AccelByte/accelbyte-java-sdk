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
echo "1..304"

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
./ng net.accelbyte.sdk.cli.Main iam getBansType \
    > test.out 2>&1
eval_tap $? 2 'GetBansType' test.out

#- 3 GetListBanReason
./ng net.accelbyte.sdk.cli.Main iam getListBanReason \
    > test.out 2>&1
eval_tap $? 3 'GetListBanReason' test.out

#- 4 GetClients
eval_tap 0 4 'GetClients # SKIP deprecated' test.out

#- 5 CreateClient
eval_tap 0 5 'CreateClient # SKIP deprecated' test.out

#- 6 GetClient
./ng net.accelbyte.sdk.cli.Main iam getClient \
    --clientId 'FtBxyZcD' \
    > test.out 2>&1
eval_tap $? 6 'GetClient' test.out

#- 7 UpdateClient
./ng net.accelbyte.sdk.cli.Main iam updateClient \
    --body '{"ClientName": "XBpGlsQu", "RedirectUri": "Ju8vMf0I"}' \
    --clientId 'sJkTrd8I' \
    > test.out 2>&1
eval_tap $? 7 'UpdateClient' test.out

#- 8 DeleteClient
eval_tap 0 8 'DeleteClient # SKIP deprecated' test.out

#- 9 UpdateClientPermission
./ng net.accelbyte.sdk.cli.Main iam updateClientPermission \
    --body '{"Permissions": [{"Action": 59, "Resource": "cV2zXnTK"}]}' \
    --clientId 'jXY1bPqa' \
    > test.out 2>&1
eval_tap $? 9 'UpdateClientPermission' test.out

#- 10 AddClientPermission
./ng net.accelbyte.sdk.cli.Main iam addClientPermission \
    --action '24' \
    --clientId 'iBxx9Cs1' \
    --resource '8EY84ekI' \
    > test.out 2>&1
eval_tap $? 10 'AddClientPermission' test.out

#- 11 DeleteClientPermission
./ng net.accelbyte.sdk.cli.Main iam deleteClientPermission \
    --action '39' \
    --clientId 'qRzHU1oh' \
    --resource '570KQBVa' \
    > test.out 2>&1
eval_tap $? 11 'DeleteClientPermission' test.out

#- 12 UpdateClientSecret
./ng net.accelbyte.sdk.cli.Main iam updateClientSecret \
    --body '{"NewSecret": "ewc72krS"}' \
    --clientId 'ha68n3Yn' \
    > test.out 2>&1
eval_tap $? 12 'UpdateClientSecret' test.out

#- 13 GetClientsbyNamespace
./ng net.accelbyte.sdk.cli.Main iam getClientsbyNamespace \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'GetClientsbyNamespace' test.out

#- 14 CreateClientByNamespace
./ng net.accelbyte.sdk.cli.Main iam createClientByNamespace \
    --body '{"ClientId": "ozp1C2Km", "ClientName": "IQTuBdNE", "ClientPermissions": [{"Action": 93, "Resource": "sxFb8CJ1", "SchedAction": 76, "SchedCron": "7DJZaMSx", "SchedRange": ["ECbZbygy"]}], "Namespace": "oarORoeN", "RedirectUri": "HSb8Rh3k", "Secret": "gs9qqJbn"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'CreateClientByNamespace' test.out

#- 15 DeleteClientByNamespace
./ng net.accelbyte.sdk.cli.Main iam deleteClientByNamespace \
    --clientId 'QsoBgiVp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DeleteClientByNamespace' test.out

#- 16 CreateUser
./ng net.accelbyte.sdk.cli.Main iam createUser \
    --body '{"AuthType": "P8Cm3yvA", "Country": "SUoxdxxF", "DisplayName": "qmAGTJ8I", "LoginId": "EdagEtp4", "Password": "w29KOu9c", "PasswordMD5Sum": "19R6XDqW"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'CreateUser' test.out

#- 17 GetAdminUsersByRoleID
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleID \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetAdminUsersByRoleID' test.out

#- 18 GetUserByLoginID
./ng net.accelbyte.sdk.cli.Main iam getUserByLoginID \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetUserByLoginID' test.out

#- 19 GetUserByPlatformUserID
./ng net.accelbyte.sdk.cli.Main iam getUserByPlatformUserID \
    --namespace "$AB_NAMESPACE" \
    --platformID 'HkkP8npL' \
    --platformUserID 'EKMfjiX7' \
    > test.out 2>&1
eval_tap $? 19 'GetUserByPlatformUserID' test.out

#- 20 ForgotPassword
./ng net.accelbyte.sdk.cli.Main iam forgotPassword \
    --body '{"Context": "jpkVZk3I", "LanguageTag": "aQYEmqGo", "LoginID": "dOEGt9gP"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'ForgotPassword' test.out

#- 21 GetUsersByLoginIds
./ng net.accelbyte.sdk.cli.Main iam getUsersByLoginIds \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetUsersByLoginIds' test.out

#- 22 ResetPassword
./ng net.accelbyte.sdk.cli.Main iam resetPassword \
    --body '{"Code": "Oj0c6i0J", "LoginID": "kvIas73u", "NewPassword": "cYnFAJ3D"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'ResetPassword' test.out

#- 23 SearchUser
eval_tap 0 23 'SearchUser # SKIP deprecated' test.out

#- 24 GetUserByUserID
./ng net.accelbyte.sdk.cli.Main iam getUserByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'K5T4Eogg' \
    > test.out 2>&1
eval_tap $? 24 'GetUserByUserID' test.out

#- 25 UpdateUser
./ng net.accelbyte.sdk.cli.Main iam updateUser \
    --body '{"Country": "0Y39UoYl", "DateOfBirth": "pv5bVAgt", "DisplayName": "sDhUTDUs", "LanguageTag": "cbQDjbTQ"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uPMz2PTR' \
    > test.out 2>&1
eval_tap $? 25 'UpdateUser' test.out

#- 26 DeleteUser
./ng net.accelbyte.sdk.cli.Main iam deleteUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'lkyU89ZP' \
    > test.out 2>&1
eval_tap $? 26 'DeleteUser' test.out

#- 27 BanUser
./ng net.accelbyte.sdk.cli.Main iam banUser \
    --body '{"ban": "Ow6zPFJ4", "comment": "2cwmzBBS", "endDate": "MNcoAAOj", "reason": "KNjfcYHm", "skipNotif": false}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YgBU1sqj' \
    > test.out 2>&1
eval_tap $? 27 'BanUser' test.out

#- 28 GetUserBanHistory
./ng net.accelbyte.sdk.cli.Main iam getUserBanHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'yK0XH45P' \
    > test.out 2>&1
eval_tap $? 28 'GetUserBanHistory' test.out

#- 29 DisableUserBan
./ng net.accelbyte.sdk.cli.Main iam disableUserBan \
    --banId 'aRSOFQBt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'u23REZ8h' \
    > test.out 2>&1
eval_tap $? 29 'DisableUserBan' test.out

#- 30 EnableUserBan
./ng net.accelbyte.sdk.cli.Main iam enableUserBan \
    --banId 'RVX7LGOv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DdYiQS9i' \
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
    --userId '7mV1C91p' \
    > test.out 2>&1
eval_tap $? 34 'GetUserInformation' test.out

#- 35 DeleteUserInformation
./ng net.accelbyte.sdk.cli.Main iam deleteUserInformation \
    --namespace "$AB_NAMESPACE" \
    --userId 'jG9gpxL6' \
    > test.out 2>&1
eval_tap $? 35 'DeleteUserInformation' test.out

#- 36 GetUserLoginHistories
./ng net.accelbyte.sdk.cli.Main iam getUserLoginHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'ycTQdvln' \
    > test.out 2>&1
eval_tap $? 36 'GetUserLoginHistories' test.out

#- 37 UpdatePassword
eval_tap 0 37 'UpdatePassword # SKIP deprecated' test.out

#- 38 SaveUserPermission
./ng net.accelbyte.sdk.cli.Main iam saveUserPermission \
    --body '{"Permissions": [{"Action": 74, "Resource": "AuSQWEXL", "SchedAction": 74, "SchedCron": "FE1YHo9m", "SchedRange": ["126ZWc8h"]}]}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HtWvbNYq' \
    > test.out 2>&1
eval_tap $? 38 'SaveUserPermission' test.out

#- 39 AddUserPermission
./ng net.accelbyte.sdk.cli.Main iam addUserPermission \
    --body '{"SchedAction": 12, "SchedCron": "UqslArFP", "SchedRange": ["iHUIvaCv"]}' \
    --action '20' \
    --namespace "$AB_NAMESPACE" \
    --resource 'U9dBBpds' \
    --userId 'JLhsVyEx' \
    > test.out 2>&1
eval_tap $? 39 'AddUserPermission' test.out

#- 40 DeleteUserPermission
./ng net.accelbyte.sdk.cli.Main iam deleteUserPermission \
    --action '35' \
    --namespace "$AB_NAMESPACE" \
    --resource 'kxoot0B7' \
    --userId 'WOfercZd' \
    > test.out 2>&1
eval_tap $? 40 'DeleteUserPermission' test.out

#- 41 GetUserPlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam getUserPlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'pMci37Ds' \
    > test.out 2>&1
eval_tap $? 41 'GetUserPlatformAccounts' test.out

#- 42 GetUserMapping
./ng net.accelbyte.sdk.cli.Main iam getUserMapping \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '7YSfExaI' \
    --userId '3uzLteMb' \
    > test.out 2>&1
eval_tap $? 42 'GetUserMapping' test.out

#- 43 GetUserJusticePlatformAccount
eval_tap 0 43 'GetUserJusticePlatformAccount # SKIP deprecated' test.out

#- 44 PlatformLink
./ng net.accelbyte.sdk.cli.Main iam platformLink \
    --ticket 'FAlt4hr7' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'HmOYiBA5' \
    --userId 'ltAOXmlG' \
    > test.out 2>&1
eval_tap $? 44 'PlatformLink' test.out

#- 45 PlatformUnlink
./ng net.accelbyte.sdk.cli.Main iam platformUnlink \
    --namespace "$AB_NAMESPACE" \
    --platformId '6eh1dTdo' \
    --userId 'TFpBIcuC' \
    > test.out 2>&1
eval_tap $? 45 'PlatformUnlink' test.out

#- 46 GetPublisherUser
./ng net.accelbyte.sdk.cli.Main iam getPublisherUser \
    --namespace "$AB_NAMESPACE" \
    --userId '1dQY93OJ' \
    > test.out 2>&1
eval_tap $? 46 'GetPublisherUser' test.out

#- 47 SaveUserRoles
./ng net.accelbyte.sdk.cli.Main iam saveUserRoles \
    --body '["nJ6Te9vD"]' \
    --namespace "$AB_NAMESPACE" \
    --userId '8ldz7Hu8' \
    > test.out 2>&1
eval_tap $? 47 'SaveUserRoles' test.out

#- 48 AddUserRole
./ng net.accelbyte.sdk.cli.Main iam addUserRole \
    --namespace "$AB_NAMESPACE" \
    --roleId 'AD79kdWu' \
    --userId 'nvizU0q1' \
    > test.out 2>&1
eval_tap $? 48 'AddUserRole' test.out

#- 49 DeleteUserRole
./ng net.accelbyte.sdk.cli.Main iam deleteUserRole \
    --namespace "$AB_NAMESPACE" \
    --roleId 'pHyhhERo' \
    --userId 'GgdrysMi' \
    > test.out 2>&1
eval_tap $? 49 'DeleteUserRole' test.out

#- 50 UpgradeHeadlessAccount
./ng net.accelbyte.sdk.cli.Main iam upgradeHeadlessAccount \
    --body '{"LoginID": "zBGSRdP2", "Password": "l7DNSZ8A"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'q0XiPLQX' \
    > test.out 2>&1
eval_tap $? 50 'UpgradeHeadlessAccount' test.out

#- 51 UpgradeHeadlessAccountWithVerificationCode
./ng net.accelbyte.sdk.cli.Main iam upgradeHeadlessAccountWithVerificationCode \
    --body '{"Code": "Se07ZddO", "Password": "GTMlJjBw", "loginId": "j9HJHQKs"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eEdSXRDS' \
    > test.out 2>&1
eval_tap $? 51 'UpgradeHeadlessAccountWithVerificationCode' test.out

#- 52 UserVerification
./ng net.accelbyte.sdk.cli.Main iam userVerification \
    --body '{"Code": "vguauw1x", "ContactType": "T7eMwSl9", "LanguageTag": "MLH0NnTJ", "validateOnly": true}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lNzBvwJa' \
    > test.out 2>&1
eval_tap $? 52 'UserVerification' test.out

#- 53 SendVerificationCode
./ng net.accelbyte.sdk.cli.Main iam sendVerificationCode \
    --body '{"Context": "Qa547Jll", "LanguageTag": "vA8RWSpa", "LoginID": "bUt7xk6Q"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xyWhfqoW' \
    > test.out 2>&1
eval_tap $? 53 'SendVerificationCode' test.out

#- 54 Authorization
./ng net.accelbyte.sdk.cli.Main iam authorization \
    --clientId 'fJw2o8oW' \
    --redirectUri 'UqvPCZ2H' \
    --responseType 'token' \
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
    --userId 'T7NXmWDl' \
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
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 61 'TokenGrant' test.out

#- 62 VerifyToken
./ng net.accelbyte.sdk.cli.Main iam verifyToken \
    --token 'uNIdQJR5' \
    > test.out 2>&1
eval_tap $? 62 'VerifyToken' test.out

#- 63 GetRoles
./ng net.accelbyte.sdk.cli.Main iam getRoles \
    > test.out 2>&1
eval_tap $? 63 'GetRoles' test.out

#- 64 CreateRole
./ng net.accelbyte.sdk.cli.Main iam createRole \
    --body '{"AdminRole": false, "Managers": [{"DisplayName": "sNOlvkfw", "Namespace": "aSbnsuLC", "UserId": "gToxuVTe"}], "Members": [{"DisplayName": "kJgvg6h5", "Namespace": "HIpH0Dvi", "UserId": "plEk4vj3"}], "Permissions": [{"Action": 75, "Resource": "Dp4yqDt8", "SchedAction": 85, "SchedCron": "UZDpxlHa", "SchedRange": ["sinGcjrk"]}], "RoleName": "mRMttgjD"}' \
    > test.out 2>&1
eval_tap $? 64 'CreateRole' test.out

#- 65 GetRole
./ng net.accelbyte.sdk.cli.Main iam getRole \
    --roleId 'SaIVBmft' \
    > test.out 2>&1
eval_tap $? 65 'GetRole' test.out

#- 66 UpdateRole
./ng net.accelbyte.sdk.cli.Main iam updateRole \
    --body '{"RoleName": "3Udg7p9P"}' \
    --roleId 'GmY2H5kX' \
    > test.out 2>&1
eval_tap $? 66 'UpdateRole' test.out

#- 67 DeleteRole
./ng net.accelbyte.sdk.cli.Main iam deleteRole \
    --roleId '4MsisSX2' \
    > test.out 2>&1
eval_tap $? 67 'DeleteRole' test.out

#- 68 GetRoleAdminStatus
./ng net.accelbyte.sdk.cli.Main iam getRoleAdminStatus \
    --roleId '8nARxWRp' \
    > test.out 2>&1
eval_tap $? 68 'GetRoleAdminStatus' test.out

#- 69 SetRoleAsAdmin
./ng net.accelbyte.sdk.cli.Main iam setRoleAsAdmin \
    --roleId 'v5ou5xtv' \
    > test.out 2>&1
eval_tap $? 69 'SetRoleAsAdmin' test.out

#- 70 RemoveRoleAdmin
./ng net.accelbyte.sdk.cli.Main iam removeRoleAdmin \
    --roleId 'd28OUfCt' \
    > test.out 2>&1
eval_tap $? 70 'RemoveRoleAdmin' test.out

#- 71 GetRoleManagers
./ng net.accelbyte.sdk.cli.Main iam getRoleManagers \
    --roleId '8UJC5flN' \
    > test.out 2>&1
eval_tap $? 71 'GetRoleManagers' test.out

#- 72 AddRoleManagers
./ng net.accelbyte.sdk.cli.Main iam addRoleManagers \
    --body '{"Managers": [{"DisplayName": "yj6HsTtX", "Namespace": "8P3llnaa", "UserId": "S9lqyygP"}]}' \
    --roleId 'cfkJIxfQ' \
    > test.out 2>&1
eval_tap $? 72 'AddRoleManagers' test.out

#- 73 RemoveRoleManagers
./ng net.accelbyte.sdk.cli.Main iam removeRoleManagers \
    --body '{"Managers": [{"DisplayName": "Zza8kNVb", "Namespace": "DxVMq7HJ", "UserId": "k0F89xAc"}]}' \
    --roleId '3YVfaENt' \
    > test.out 2>&1
eval_tap $? 73 'RemoveRoleManagers' test.out

#- 74 GetRoleMembers
./ng net.accelbyte.sdk.cli.Main iam getRoleMembers \
    --roleId 'rl0pTKZT' \
    > test.out 2>&1
eval_tap $? 74 'GetRoleMembers' test.out

#- 75 AddRoleMembers
./ng net.accelbyte.sdk.cli.Main iam addRoleMembers \
    --body '{"Members": [{"DisplayName": "XqzHuBMY", "Namespace": "QSA2jz1Z", "UserId": "OpdOjSyM"}]}' \
    --roleId 'ddB41JuM' \
    > test.out 2>&1
eval_tap $? 75 'AddRoleMembers' test.out

#- 76 RemoveRoleMembers
./ng net.accelbyte.sdk.cli.Main iam removeRoleMembers \
    --body '{"Members": [{"DisplayName": "f7RUyBHR", "Namespace": "j8IiRimR", "UserId": "llHT6Dc4"}]}' \
    --roleId '0vFFA6gp' \
    > test.out 2>&1
eval_tap $? 76 'RemoveRoleMembers' test.out

#- 77 UpdateRolePermissions
./ng net.accelbyte.sdk.cli.Main iam updateRolePermissions \
    --body '{"Permissions": [{"Action": 93, "Resource": "7EW3x1dC", "SchedAction": 30, "SchedCron": "m55gOeqQ", "SchedRange": ["IqcJVKmB"]}]}' \
    --roleId 'M1J1IbuT' \
    > test.out 2>&1
eval_tap $? 77 'UpdateRolePermissions' test.out

#- 78 AddRolePermission
./ng net.accelbyte.sdk.cli.Main iam addRolePermission \
    --body '{"SchedAction": 35, "SchedCron": "rkbmuT1w", "SchedRange": ["hOqmEnDX"]}' \
    --action '69' \
    --resource 'WrBPlSay' \
    --roleId '46mv71BA' \
    > test.out 2>&1
eval_tap $? 78 'AddRolePermission' test.out

#- 79 DeleteRolePermission
./ng net.accelbyte.sdk.cli.Main iam deleteRolePermission \
    --action '53' \
    --resource 'OjtFJ2vm' \
    --roleId 'Tj7tT7TZ' \
    > test.out 2>&1
eval_tap $? 79 'DeleteRolePermission' test.out

#- 80 AdminGetAgeRestrictionStatusV2
./ng net.accelbyte.sdk.cli.Main iam adminGetAgeRestrictionStatusV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 80 'AdminGetAgeRestrictionStatusV2' test.out

#- 81 AdminUpdateAgeRestrictionConfigV2
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAgeRestrictionConfigV2 \
    --body '{"AgeRestriction": 67, "Enable": true}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'AdminUpdateAgeRestrictionConfigV2' test.out

#- 82 GetListCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam getListCountryAgeRestriction \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'GetListCountryAgeRestriction' test.out

#- 83 UpdateCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam updateCountryAgeRestriction \
    --body '{"AgeRestriction": 6}' \
    --countryCode 'CkIsZoAr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'UpdateCountryAgeRestriction' test.out

#- 84 AdminSearchUsersV2
./ng net.accelbyte.sdk.cli.Main iam adminSearchUsersV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WwPHcyFA' \
    > test.out 2>&1
eval_tap $? 84 'AdminSearchUsersV2' test.out

#- 85 AdminGetUserByUserIdV2
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dAtYciLI' \
    > test.out 2>&1
eval_tap $? 85 'AdminGetUserByUserIdV2' test.out

#- 86 AdminUpdateUserV2
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV2 \
    --body '{"Country": "gRwFRr0g", "DateOfBirth": "wB9tz3vp", "DisplayName": "99XVlV8r", "LanguageTag": "K3tE6n0s"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mip1tw3L' \
    > test.out 2>&1
eval_tap $? 86 'AdminUpdateUserV2' test.out

#- 87 AdminBanUserV2
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV2 \
    --body '{"ban": "7cUd9pqt", "comment": "v6JfPZwc", "endDate": "CVOXcVa8", "reason": "0TmCwtD2", "skipNotif": false}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AH01o6Nd' \
    > test.out 2>&1
eval_tap $? 87 'AdminBanUserV2' test.out

#- 88 AdminGetUserBanV2
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cBIgzrDy' \
    > test.out 2>&1
eval_tap $? 88 'AdminGetUserBanV2' test.out

#- 89 AdminDisableUserV2
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserV2 \
    --body '{"Reason": "WpFBYGmm"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BawMyoKy' \
    > test.out 2>&1
eval_tap $? 89 'AdminDisableUserV2' test.out

#- 90 AdminEnableUserV2
./ng net.accelbyte.sdk.cli.Main iam adminEnableUserV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NpdAasm8' \
    > test.out 2>&1
eval_tap $? 90 'AdminEnableUserV2' test.out

#- 91 AdminResetPasswordV2
./ng net.accelbyte.sdk.cli.Main iam adminResetPasswordV2 \
    --body '{"LanguageTag": "xwUfzOlQ", "NewPassword": "iZY4NbOQ", "OldPassword": "XJ7uOTzN"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mvuq2tNl' \
    > test.out 2>&1
eval_tap $? 91 'AdminResetPasswordV2' test.out

#- 92 AdminDeletePlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam adminDeletePlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId '4CX4IjiK' \
    --userId '4DEUJRVK' \
    > test.out 2>&1
eval_tap $? 92 'AdminDeletePlatformLinkV2' test.out

#- 93 AdminPutUserRolesV2
./ng net.accelbyte.sdk.cli.Main iam adminPutUserRolesV2 \
    --body '["3l9Eb0R1"]' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XRb0RH8v' \
    > test.out 2>&1
eval_tap $? 93 'AdminPutUserRolesV2' test.out

#- 94 AdminCreateUserRolesV2
./ng net.accelbyte.sdk.cli.Main iam adminCreateUserRolesV2 \
    --body '["S1smeOln"]' \
    --namespace "$AB_NAMESPACE" \
    --userId 'grdTXCza' \
    > test.out 2>&1
eval_tap $? 94 'AdminCreateUserRolesV2' test.out

#- 95 PublicGetCountryAgeRestriction
./ng net.accelbyte.sdk.cli.Main iam publicGetCountryAgeRestriction \
    --countryCode 'PBtkZMio' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'PublicGetCountryAgeRestriction' test.out

#- 96 PublicCreateUserV2
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV2 \
    --body '{"AuthType": "4wcyhloV", "Country": "S3rYp8Qt", "DisplayName": "cEmCEVc7", "LoginId": "5UfeypWj", "Password": "DNhzCL5s", "PasswordMD5Sum": "WS2qwO76"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'PublicCreateUserV2' test.out

#- 97 PublicForgotPasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV2 \
    --body '{"Context": "3iEklkzL", "LanguageTag": "m88LpLuY", "LoginID": "RO3C55yH"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 97 'PublicForgotPasswordV2' test.out

#- 98 PublicResetPasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicResetPasswordV2 \
    --body '{"Code": "pwK2Jaqe", "LoginID": "nDGn7a2N", "NewPassword": "UplWiLjq"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'PublicResetPasswordV2' test.out

#- 99 PublicGetUserByUserIDV2
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '06n6a0rW' \
    > test.out 2>&1
eval_tap $? 99 'PublicGetUserByUserIDV2' test.out

#- 100 PublicUpdateUserV2
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV2 \
    --body '{"Country": "8EfkpaXt", "DateOfBirth": "wYZJaQ4W", "DisplayName": "bwNmsFYe", "LanguageTag": "tjEurH8e"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'loJzNKtR' \
    > test.out 2>&1
eval_tap $? 100 'PublicUpdateUserV2' test.out

#- 101 PublicGetUserBan
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBan \
    --namespace "$AB_NAMESPACE" \
    --userId 'UaTz1ETd' \
    > test.out 2>&1
eval_tap $? 101 'PublicGetUserBan' test.out

#- 102 PublicUpdatePasswordV2
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV2 \
    --body '{"LanguageTag": "smwzjkkn", "NewPassword": "9oiQl05g", "OldPassword": "7cO3ZMb6"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ojlo6DMN' \
    > test.out 2>&1
eval_tap $? 102 'PublicUpdatePasswordV2' test.out

#- 103 GetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam getListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'pP2qMrTQ' \
    > test.out 2>&1
eval_tap $? 103 'GetListJusticePlatformAccounts' test.out

#- 104 PublicPlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV2 \
    --ticket '1UpjfU6w' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Jhy1jOVk' \
    --userId 'kUlS7952' \
    > test.out 2>&1
eval_tap $? 104 'PublicPlatformLinkV2' test.out

#- 105 PublicDeletePlatformLinkV2
./ng net.accelbyte.sdk.cli.Main iam publicDeletePlatformLinkV2 \
    --namespace "$AB_NAMESPACE" \
    --platformId '7EZ25Ia8' \
    --userId 'uCeZFlLt' \
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
    --body '[{"field": "EVpDAEbA", "validation": {"allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "description": [{"language": "0pDE5xRw", "message": ["h5b45ebp"]}], "isCustomRegex": false, "letterCase": "M7ScSs3U", "maxLength": 80, "maxRepeatingAlphaNum": 30, "maxRepeatingSpecialCharacter": 53, "minCharType": 44, "minLength": 68, "regex": "p9rRtn1P", "specialCharacterLocation": "cCxdbume", "specialCharacters": ["YgOdEBWR"]}}]' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateInputValidations' test.out

#- 110 AdminResetInputValidations
./ng net.accelbyte.sdk.cli.Main iam adminResetInputValidations \
    --field 'QiW3KFfU' \
    > test.out 2>&1
eval_tap $? 110 'AdminResetInputValidations' test.out

#- 111 ListAdminsV3
./ng net.accelbyte.sdk.cli.Main iam listAdminsV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 111 'ListAdminsV3' test.out

#- 112 AdminGetAgeRestrictionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetAgeRestrictionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'AdminGetAgeRestrictionStatusV3' test.out

#- 113 AdminUpdateAgeRestrictionConfigV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAgeRestrictionConfigV3 \
    --body '{"ageRestriction": 16, "enable": false}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'AdminUpdateAgeRestrictionConfigV3' test.out

#- 114 AdminGetListCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminGetListCountryAgeRestrictionV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetListCountryAgeRestrictionV3' test.out

#- 115 AdminUpdateCountryAgeRestrictionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateCountryAgeRestrictionV3 \
    --body '{"ageRestriction": 67}' \
    --countryCode '4081gRB1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminUpdateCountryAgeRestrictionV3' test.out

#- 116 AdminGetBannedUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBannedUsersV3 \
    --namespace "$AB_NAMESPACE" \
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
    > test.out 2>&1
eval_tap $? 118 'AdminGetClientsByNamespaceV3' test.out

#- 119 AdminCreateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateClientV3 \
    --body '{"audiences": ["GyLfLg4R"], "baseUri": "YuEbgUDE", "clientId": "cJyIvsPw", "clientName": "Or0BmV5i", "clientPermissions": [{"action": 63, "resource": "vfwFjTSm", "schedAction": 69, "schedCron": "EqoLyLeU", "schedRange": ["GmomGX9s"]}], "clientPlatform": "XTZ0v8pq", "deletable": false, "namespace": "c5SwGnRe", "oauthClientType": "UULDX4QU", "redirectUri": "Ibb5nh68", "secret": "ZnyUtRvW"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'AdminCreateClientV3' test.out

#- 120 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId '9hNBSFTt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 121 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'FrOmjkFr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'AdminDeleteClientV3' test.out

#- 122 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --body '{"audiences": ["FVA8t0xF"], "baseUri": "34Xpt6Zl", "clientName": "TTic0kr2", "clientPermissions": [{"action": 1, "resource": "0nI2oo7U", "schedAction": 67, "schedCron": "CJK5sp0a", "schedRange": ["CvIq3aHV"]}], "clientPlatform": "YIlewLRu", "deletable": false, "namespace": "Gj0HTeeW", "redirectUri": "XlIcRidq"}' \
    --clientId 'ctDpygY0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminUpdateClientV3' test.out

#- 123 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --body '{"permissions": [{"action": 0, "resource": "x476ED4M"}]}' \
    --clientId 'MO9Tw2JH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminUpdateClientPermissionV3' test.out

#- 124 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --body '{"permissions": [{"action": 33, "resource": "hWIwHWTg"}]}' \
    --clientId 'zJFRYw6t' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 124 'AdminAddClientPermissionsV3' test.out

#- 125 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '68' \
    --clientId 'KZLO6V4O' \
    --namespace "$AB_NAMESPACE" \
    --resource 'de46QmCi' \
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
    > test.out 2>&1
eval_tap $? 128 'RetrieveAllSSOLoginPlatformCredentialV3' test.out

#- 129 RetrieveThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'dgdpP7RT' \
    > test.out 2>&1
eval_tap $? 129 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 130 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --body '{"ACSURL": "C587lmUm", "AWSCognitoRegion": "BziPZBnp", "AWSCognitoUserPool": "Ofkllxfq", "AppId": "0NsrSjw5", "ClientId": "Hog0blM1", "Environment": "d5MStYGc", "FederationMetadataURL": "zLINlEC0", "GenericOauthFlow": true, "IsActive": true, "Issuer": "E3yzIsUP", "JWKSEndpoint": "0NjluOrG", "KeyID": "ZTzsLW7F", "NetflixCertificates": {"encryptedPrivateKey": "jfs9nIkc", "publicCertificate": "Z38fUEan", "rootCertificate": "jKHbXfk1"}, "OrganizationId": "zxdzxg0U", "PlatformName": "XcRyHi3u", "RedirectUri": "8BzVWu1t", "Secret": "OmhUtCgc", "TeamID": "pvGrEbcZ", "TokenAuthenticationType": "UDExH1ta", "TokenClaimsMapping": {"yOGXIHzM": "RjMCtOJs"}}' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Eijlrbpy' \
    > test.out 2>&1
eval_tap $? 130 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 131 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'yEcQxVgJ' \
    > test.out 2>&1
eval_tap $? 131 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 132 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --body '{"ACSURL": "IjMZqcWf", "AWSCognitoRegion": "Ml6dqrpD", "AWSCognitoUserPool": "4tnc3ZRB", "AppId": "3IkdtPfA", "ClientId": "JEomwenJ", "Environment": "vQ8grtQS", "FederationMetadataURL": "v6EcALcM", "GenericOauthFlow": false, "IsActive": true, "Issuer": "5bT51M4y", "JWKSEndpoint": "ko8S0EnG", "KeyID": "LvGvfuSy", "NetflixCertificates": {"encryptedPrivateKey": "CTyjj4mC", "publicCertificate": "aiuMGKOF", "rootCertificate": "5GJJooSX"}, "OrganizationId": "Ul3YU35Q", "PlatformName": "HGpBABnO", "RedirectUri": "lxDznICQ", "Secret": "VyqBg34W", "TeamID": "TtDkn0rt", "TokenAuthenticationType": "n6t0Yx4z", "TokenClaimsMapping": {"12EaQ1rU": "QYCNTiDX"}}' \
    --namespace "$AB_NAMESPACE" \
    --platformId '4jE3M2Is' \
    > test.out 2>&1
eval_tap $? 132 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 133 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --body '{"affectedClientIDs": ["THu8QwNy"], "assignedNamespaces": ["OlXfIWd0"], "domain": "mcq5T4SU", "roleId": "c7cWfCKK"}' \
    --namespace "$AB_NAMESPACE" \
    --platformId '6Dij1gFc' \
    > test.out 2>&1
eval_tap $? 133 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 134 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --body '{"domain": "enEMySPf"}' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'hxBenDiT' \
    > test.out 2>&1
eval_tap $? 134 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 135 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'iAqFYmFK' \
    > test.out 2>&1
eval_tap $? 135 'RetrieveSSOLoginPlatformCredential' test.out

#- 136 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --body '{"acsUrl": "jaELmmll", "apiKey": "6oexId1O", "appId": "KGUN2Uzn", "federationMetadataUrl": "d7uVa7t1", "isActive": true, "redirectUri": "vSYSV52b", "secret": "HifCIf4t", "ssoUrl": "suu6Pkam"}' \
    --namespace "$AB_NAMESPACE" \
    --platformId '6tFSYFt4' \
    > test.out 2>&1
eval_tap $? 136 'AddSSOLoginPlatformCredential' test.out

#- 137 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZxA2PzZF' \
    > test.out 2>&1
eval_tap $? 137 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 138 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --body '{"acsUrl": "RkBNlg6h", "apiKey": "n5qusKyZ", "appId": "AuV6uUvq", "federationMetadataUrl": "M0lV6UZM", "isActive": false, "redirectUri": "EbxHNgJR", "secret": "iQExaunj", "ssoUrl": "dAqnHUz4"}' \
    --namespace "$AB_NAMESPACE" \
    --platformId '4tx4O6ha' \
    > test.out 2>&1
eval_tap $? 138 'UpdateSSOPlatformCredential' test.out

#- 139 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mPwNoi07' \
    --platformUserId '1ezDK56J' \
    > test.out 2>&1
eval_tap $? 139 'AdminGetUserByPlatformUserIDV3' test.out

#- 140 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'FIGe1IMU' \
    > test.out 2>&1
eval_tap $? 140 'GetAdminUsersByRoleIdV3' test.out

#- 141 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByEmailAddressV3' test.out

#- 142 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --body '{"userIds": ["CLcN0Dsa"]}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'AdminListUserIDByUserIDsV3' test.out

#- 143 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --body '{"emailAddresses": ["D5FyBsFe"], "isAdmin": true, "roles": ["JVsYffmh"]}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 143 'AdminInviteUserV3' test.out

#- 144 AdminListUsersV3
./ng net.accelbyte.sdk.cli.Main iam adminListUsersV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 144 'AdminListUsersV3' test.out

#- 145 AdminSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam adminSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 145 'AdminSearchUserV3' test.out

#- 146 AdminGetBulkUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetBulkUserByEmailAddressV3 \
    --body '{"listEmailAddressRequest": ["yx6J25Pr"]}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 146 'AdminGetBulkUserByEmailAddressV3' test.out

#- 147 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M4S3cB8m' \
    > test.out 2>&1
eval_tap $? 147 'AdminGetUserByUserIdV3' test.out

#- 148 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --body '{"avatarUrl": "17hEeLLg", "country": "oaYth6zc", "dateOfBirth": "f8eA45OM", "displayName": "vObWejo9", "languageTag": "LfGeegJM", "userName": "aBGR6D1Z"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oZEZQkJ8' \
    > test.out 2>&1
eval_tap $? 148 'AdminUpdateUserV3' test.out

#- 149 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DSqFnhdK' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserBanV3' test.out

#- 150 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --body '{"ban": "vjFCFbSF", "comment": "lEWoMPdg", "endDate": "K5zn62mh", "reason": "nFSpCTlD", "skipNotif": true}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ocygvv2L' \
    > test.out 2>&1
eval_tap $? 150 'AdminBanUserV3' test.out

#- 151 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --body '{"enabled": true, "skipNotif": false}' \
    --banId 'fBGVzanb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KYsB0gqJ' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserBanV3' test.out

#- 152 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --body '{"context": "8VhYSikJ", "emailAddress": "l2p9rBx8", "languageTag": "N5egapqx"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dy4cLfNj' \
    > test.out 2>&1
eval_tap $? 152 'AdminSendVerificationCodeV3' test.out

#- 153 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --body '{"Code": "zzEZYA8j", "ContactType": "IkMJb7cZ", "LanguageTag": "2bPsaLLp", "validateOnly": true}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BVEMk5As' \
    > test.out 2>&1
eval_tap $? 153 'AdminVerifyAccountV3' test.out

#- 154 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'KaF2P44l' \
    > test.out 2>&1
eval_tap $? 154 'GetUserVerificationCode' test.out

#- 155 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XkI3zdiR' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetUserDeletionStatusV3' test.out

#- 156 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --body '{"enabled": false}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'C5IbPit7' \
    > test.out 2>&1
eval_tap $? 156 'AdminUpdateUserDeletionStatusV3' test.out

#- 157 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --body '{"code": "1JWlYCoi", "country": "4nDfPu5V", "dateOfBirth": "6QSYxEVO", "displayName": "ryVuZYmg", "emailAddress": "UeEPB5AG", "password": "Pgvk0Zth", "validateOnly": false}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j0EBA4az' \
    > test.out 2>&1
eval_tap $? 157 'AdminUpgradeHeadlessAccountV3' test.out

#- 158 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rz0d56sm' \
    > test.out 2>&1
eval_tap $? 158 'AdminDeleteUserInformationV3' test.out

#- 159 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'obor4p1P' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetUserLoginHistoriesV3' test.out

#- 160 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --body '{"Permissions": [{"Action": 22, "Resource": "gQB9EcNG", "SchedAction": 80, "SchedCron": "eBRY6G5a", "SchedRange": ["e07deDLa"]}]}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z8JCvbeT' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpdateUserPermissionV3' test.out

#- 161 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --body '{"Permissions": [{"Action": 11, "Resource": "W0hgzrab", "SchedAction": 74, "SchedCron": "JxEwJrEB", "SchedRange": ["mQ64haNO"]}]}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zlGu68UY' \
    > test.out 2>&1
eval_tap $? 161 'AdminAddUserPermissionsV3' test.out

#- 162 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --body '[{"Action": 48, "Resource": "upjdDetn"}]' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oT0rfWtV' \
    > test.out 2>&1
eval_tap $? 162 'AdminDeleteUserPermissionBulkV3' test.out

#- 163 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '82' \
    --namespace "$AB_NAMESPACE" \
    --resource 'wQfq6V92' \
    --userId 'gbfPouNd' \
    > test.out 2>&1
eval_tap $? 163 'AdminDeleteUserPermissionV3' test.out

#- 164 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mP7fckVn' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetUserPlatformAccountsV3' test.out

#- 165 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'uDGvYIb1' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetListJusticePlatformAccounts' test.out

#- 166 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'p5tcR5z8' \
    --userId 'ZJLjSHca' \
    > test.out 2>&1
eval_tap $? 166 'AdminCreateJusticeUser' test.out

#- 167 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --body '{"platformId": "R3X4tZmw", "platformUserId": "r0QmOnsE"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'g49eXp0x' \
    > test.out 2>&1
eval_tap $? 167 'AdminLinkPlatformAccount' test.out

#- 168 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --body '{"platformNamespace": "QkZ2Jjuw"}' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'WWy0tU11' \
    --userId 'PCeSrvej' \
    > test.out 2>&1
eval_tap $? 168 'AdminPlatformUnlinkV3' test.out

#- 169 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --ticket 'UKwVfF37' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Vr7mkDzF' \
    --userId 'BI1VwhkV' \
    > test.out 2>&1
eval_tap $? 169 'AdminPlatformLinkV3' test.out

#- 170 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --body '["SKDlNFOU"]' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HBJsvTsq' \
    > test.out 2>&1
eval_tap $? 170 'AdminDeleteUserRolesV3' test.out

#- 171 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --body '[{"namespace": "k9hg4hj6", "roleId": "nUdebW6U"}]' \
    --namespace "$AB_NAMESPACE" \
    --userId 'skbPkkZA' \
    > test.out 2>&1
eval_tap $? 171 'AdminSaveUserRoleV3' test.out

#- 172 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'k01f1KxC' \
    --userId 'tWADU2gu' \
    > test.out 2>&1
eval_tap $? 172 'AdminAddUserRoleV3' test.out

#- 173 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'N6U9w13W' \
    --userId '1K9TZQ4q' \
    > test.out 2>&1
eval_tap $? 173 'AdminDeleteUserRoleV3' test.out

#- 174 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --body '{"enabled": true, "reason": "i5wowE36"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rfmM0CCs' \
    > test.out 2>&1
eval_tap $? 174 'AdminUpdateUserStatusV3' test.out

#- 175 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '35TPUPLm' \
    > test.out 2>&1
eval_tap $? 175 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 176 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    > test.out 2>&1
eval_tap $? 176 'AdminGetRolesV3' test.out

#- 177 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": true, "managers": [{"displayName": "Sx1DI5GH", "namespace": "9bv9ZTo2", "userId": "HpA6pzjH"}], "members": [{"displayName": "pZO0E9iL", "namespace": "gRPJK3nB", "userId": "ae3GOgbQ"}], "permissions": [{"action": 34, "resource": "qra0Ptkf", "schedAction": 43, "schedCron": "OpY2ramp", "schedRange": ["5lnBn6xm"]}], "roleName": "BkfMtC66"}' \
    > test.out 2>&1
eval_tap $? 177 'AdminCreateRoleV3' test.out

#- 178 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId 'hFq0kPOk' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetRoleV3' test.out

#- 179 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'ORm2XjlN' \
    > test.out 2>&1
eval_tap $? 179 'AdminDeleteRoleV3' test.out

#- 180 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --body '{"deletable": true, "isWildcard": true, "roleName": "5ecPzAmi"}' \
    --roleId '0ySJHfPl' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateRoleV3' test.out

#- 181 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'oP1XkYK4' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetRoleAdminStatusV3' test.out

#- 182 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'MgIsDSFM' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateAdminRoleStatusV3' test.out

#- 183 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId 'PyMhyw1O' \
    > test.out 2>&1
eval_tap $? 183 'AdminRemoveRoleAdminV3' test.out

#- 184 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'LZPVwwxH' \
    > test.out 2>&1
eval_tap $? 184 'AdminGetRoleManagersV3' test.out

#- 185 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --body '{"managers": [{"displayName": "4BIDJuDo", "namespace": "ShMMftll", "userId": "8N0VvChH"}]}' \
    --roleId 'z9urmt7Q' \
    > test.out 2>&1
eval_tap $? 185 'AdminAddRoleManagersV3' test.out

#- 186 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --body '{"managers": [{"displayName": "WvE8s6Uz", "namespace": "8BRuYWDT", "userId": "tL6MTTRk"}]}' \
    --roleId 'Cbb9S5Q1' \
    > test.out 2>&1
eval_tap $? 186 'AdminRemoveRoleManagersV3' test.out

#- 187 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'IVHGT88p' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetRoleMembersV3' test.out

#- 188 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --body '{"members": [{"displayName": "rREBgYOW", "namespace": "dHJ9Jumo", "userId": "htU13gf7"}]}' \
    --roleId 'TRigNZj5' \
    > test.out 2>&1
eval_tap $? 188 'AdminAddRoleMembersV3' test.out

#- 189 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --body '{"members": [{"displayName": "w5y3HmK8", "namespace": "QVOa62eQ", "userId": "ZtbLLcF6"}]}' \
    --roleId '71WLtv38' \
    > test.out 2>&1
eval_tap $? 189 'AdminRemoveRoleMembersV3' test.out

#- 190 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --body '{"permissions": [{"action": 67, "resource": "ecczopFm", "schedAction": 9, "schedCron": "RwpcJBZy", "schedRange": ["i3mLC4Kz"]}]}' \
    --roleId 'ekiSzeyo' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpdateRolePermissionsV3' test.out

#- 191 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --body '{"permissions": [{"action": 23, "resource": "nOQt0joV", "schedAction": 67, "schedCron": "gCytC6lR", "schedRange": ["G98YxnHb"]}]}' \
    --roleId 'RdoTKKeu' \
    > test.out 2>&1
eval_tap $? 191 'AdminAddRolePermissionsV3' test.out

#- 192 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --body '["SjfZe9i1"]' \
    --roleId 'osghF1hz' \
    > test.out 2>&1
eval_tap $? 192 'AdminDeleteRolePermissionsV3' test.out

#- 193 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '16' \
    --resource '1Nl47syJ' \
    --roleId '5ibzSHZe' \
    > test.out 2>&1
eval_tap $? 193 'AdminDeleteRolePermissionV3' test.out

#- 194 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 194 'AdminGetMyUserV3' test.out

#- 195 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --password 'CLIvWPVR' \
    --requestId 'sdEqA61y' \
    --userName 'TrMgsycT' \
    > test.out 2>&1
eval_tap $? 195 'UserAuthenticationV3' test.out

#- 196 AuthenticationWithPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam authenticationWithPlatformLinkV3 \
    --clientId 'gmPzc20E' \
    --linkingToken 'uO5dMqGD' \
    --password 'lSZPY07r' \
    --username 'EVSjzHjL' \
    > test.out 2>&1
eval_tap $? 196 'AuthenticationWithPlatformLinkV3' test.out

#- 197 GenerateTokenByNewHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam generateTokenByNewHeadlessAccountV3 \
    --linkingToken '6ZbXjG6D' \
    > test.out 2>&1
eval_tap $? 197 'GenerateTokenByNewHeadlessAccountV3' test.out

#- 198 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 198 'GetCountryLocationV3' test.out

#- 199 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 199 'Logout' test.out

#- 200 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Smpp3op8' \
    --userId 'htaRLxtW' \
    > test.out 2>&1
eval_tap $? 200 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 201 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '4PvFkEST' \
    > test.out 2>&1
eval_tap $? 201 'RevokeUserV3' test.out

#- 202 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --clientId 'ULat5F1L' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 202 'AuthorizeV3' test.out

#- 203 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token '7cR7q6PW' \
    > test.out 2>&1
eval_tap $? 203 'TokenIntrospectionV3' test.out

#- 204 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 204 'GetJWKSV3' test.out

#- 205 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'hZmmKz41' \
    --mfaToken 'i1Tp78Fi' \
    > test.out 2>&1
eval_tap $? 205 'Change2faMethod' test.out

#- 206 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'pJHahViJ' \
    --factor 'vLYW0kdm' \
    --mfaToken 'lk2luqSO' \
    --rememberDevice
    > test.out 2>&1
eval_tap $? 206 'Verify2faCode' test.out

#- 207 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'OA2VOZBo' \
    --userId 'NbB98PuS' \
    > test.out 2>&1
eval_tap $? 207 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 208 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'GykqFzPw' \
    --requestId 'SMXT53bB' \
    > test.out 2>&1
eval_tap $? 208 'AuthCodeRequestV3' test.out

#- 209 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId 'uL38beOY' \
    > test.out 2>&1
eval_tap $? 209 'PlatformTokenGrantV3' test.out

#- 210 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 210 'GetRevocationListV3' test.out

#- 211 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'DVuHZQ9L' \
    > test.out 2>&1
eval_tap $? 211 'TokenRevocationV3' test.out

#- 212 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --grantType 'password' \
    > test.out 2>&1
eval_tap $? 212 'TokenGrantV3' test.out

#- 213 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId '6w23Wf8i' \
    --state 'EQo72sH0' \
    > test.out 2>&1
eval_tap $? 213 'PlatformAuthenticationV3' test.out

#- 214 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    > test.out 2>&1
eval_tap $? 214 'PublicGetInputValidations' test.out

#- 215 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 215 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 216 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --body '{"platformUserIds": ["aRdcDlDy"]}' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'GcsfIuI4' \
    > test.out 2>&1
eval_tap $? 216 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 217 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'Dv5lEJpK' \
    --platformUserId '1AyRlzsr' \
    > test.out 2>&1
eval_tap $? 217 'PublicGetUserByPlatformUserIDV3' test.out

#- 218 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'RXEFZivQ' \
    > test.out 2>&1
eval_tap $? 218 'PublicGetAsyncStatus' test.out

#- 219 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 219 'PublicSearchUserV3' test.out

#- 220 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --body '{"PasswordMD5Sum": "OHG6wVic", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "atsvvHLm", "policyId": "IohfNISL", "policyVersionId": "XMDWDdm5"}], "authType": "FE4lliQM", "code": "nutJbpEo", "country": "4mUNHFtd", "dateOfBirth": "ml2xNviW", "displayName": "acJc3Fm7", "emailAddress": "Z548uuKg", "password": "oCBqS5uI", "reachMinimumAge": false}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 220 'PublicCreateUserV3' test.out

#- 221 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'CbwCeeq9' \
    --query 'ouEdDtjO' \
    > test.out 2>&1
eval_tap $? 221 'CheckUserAvailability' test.out

#- 222 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --body '{"userIds": ["gsypLkm2"]}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 222 'PublicBulkGetUsers' test.out

#- 223 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --body '{"emailAddress": "ZYew5H7Z", "languageTag": "m0gnYyj6"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 223 'PublicSendRegistrationCode' test.out

#- 224 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --body '{"code": "MXf9G1nt", "emailAddress": "yebvoeHe"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 224 'PublicVerifyRegistrationCode' test.out

#- 225 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --body '{"emailAddress": "nAALKt7E", "languageTag": "fxIH446o"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 225 'PublicForgotPasswordV3' test.out

#- 226 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'UnP2S74u' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 226 'GetAdminInvitationV3' test.out

#- 227 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "Xwg0JKqV", "policyId": "WW1rjK1e", "policyVersionId": "pwkAvcsY"}], "authType": "EMAILPASSWD", "country": "bgfBVPpT", "dateOfBirth": "a8Yuq7TK", "displayName": "iNXmz7eM", "password": "rMD5TbaU", "reachMinimumAge": true}' \
    --invitationId 'TCTng0xj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 227 'CreateUserFromInvitationV3' test.out

#- 228 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --body '{"avatarUrl": "tdBrjs3K", "country": "iykt2Ck2", "dateOfBirth": "gOlSatEC", "displayName": "Z2UgwQLq", "languageTag": "DqYSxTPu", "userName": "VlBqirdp"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 228 'UpdateUserV3' test.out

#- 229 PublicUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV3 \
    --body '{"avatarUrl": "3yxnsETl", "country": "1SvhQuds", "dateOfBirth": "jIhXdxiS", "displayName": "oWpnnxgX", "languageTag": "7BCPMqzQ", "userName": "IxibhpNY"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 229 'PublicUpdateUserV3' test.out

#- 230 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --body '{"context": "sHtdB3Ik", "emailAddress": "juaZqhJi", "languageTag": "lrZkSSKg"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 230 'PublicSendVerificationCodeV3' test.out

#- 231 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --body '{"code": "P5rxCR77", "contactType": "G9d5CA1G", "languageTag": "ORSbL9n0", "validateOnly": false}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 231 'PublicUserVerificationV3' test.out

#- 232 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --body '{"code": "bWDEupmd", "country": "LQzPnNfB", "dateOfBirth": "AcWArbkC", "displayName": "fdHIZb03", "emailAddress": "otqmBuS9", "password": "V2pCZ23U", "validateOnly": false}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 232 'PublicUpgradeHeadlessAccountV3' test.out

#- 233 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --body '{"emailAddress": "k0lpJ4JL", "password": "l01qi7L2"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 233 'PublicVerifyHeadlessAccountV3' test.out

#- 234 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --body '{"languageTag": "oDUoVRUb", "newPassword": "39j22P4S", "oldPassword": "p09cKmjR"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 234 'PublicUpdatePasswordV3' test.out

#- 235 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'UbZVBVS7' \
    > test.out 2>&1
eval_tap $? 235 'PublicCreateJusticeUser' test.out

#- 236 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --ticket 'OK2Zrdcs' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ckMekROW' \
    > test.out 2>&1
eval_tap $? 236 'PublicPlatformLinkV3' test.out

#- 237 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --body '{"platformNamespace": "Z2KUTqkK"}' \
    --namespace "$AB_NAMESPACE" \
    --platformId '2eFaGLoS' \
    > test.out 2>&1
eval_tap $? 237 'PublicPlatformUnlinkV3' test.out

#- 238 PublicPlatformUnlinkAllV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkAllV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mEEPbLyw' \
    > test.out 2>&1
eval_tap $? 238 'PublicPlatformUnlinkAllV3' test.out

#- 239 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'JsyUie6f' \
    > test.out 2>&1
eval_tap $? 239 'PublicWebLinkPlatform' test.out

#- 240 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZgLllUPs' \
    --state 'O8lg46Si' \
    > test.out 2>&1
eval_tap $? 240 'PublicWebLinkPlatformEstablish' test.out

#- 241 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --body '{"code": "7006vL2w", "emailAddress": "4aajDAOx", "newPassword": "0iJjYlea"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'ResetPasswordV3' test.out

#- 242 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ktqv2Wkl' \
    > test.out 2>&1
eval_tap $? 242 'PublicGetUserByUserIdV3' test.out

#- 243 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jQuD5mnJ' \
    > test.out 2>&1
eval_tap $? 243 'PublicGetUserBanHistoryV3' test.out

#- 244 PublicListUserAllPlatformAccountsDistinctV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ONqHGq8m' \
    > test.out 2>&1
eval_tap $? 244 'PublicListUserAllPlatformAccountsDistinctV3' test.out

#- 245 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'B7mF2lMF' \
    > test.out 2>&1
eval_tap $? 245 'PublicGetUserLoginHistoriesV3' test.out

#- 246 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'caghFXJI' \
    > test.out 2>&1
eval_tap $? 246 'PublicGetUserPlatformAccountsV3' test.out

#- 247 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --body '{"platformId": "JflRHFcs", "platformUserId": "IqCy4xDi"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fSSQ5On2' \
    > test.out 2>&1
eval_tap $? 247 'PublicLinkPlatformAccount' test.out

#- 248 PublicForceLinkPlatformWithProgression
./ng net.accelbyte.sdk.cli.Main iam publicForceLinkPlatformWithProgression \
    --body '{"chosenNamespaces": ["ccEcl3xe"], "requestId": "iO4bwF5J"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OjGoGxKM' \
    > test.out 2>&1
eval_tap $? 248 'PublicForceLinkPlatformWithProgression' test.out

#- 249 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --password '3qMce5tf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LcpjFZMK' \
    > test.out 2>&1
eval_tap $? 249 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 250 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    > test.out 2>&1
eval_tap $? 250 'PublicGetRolesV3' test.out

#- 251 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'Cbp0pEbL' \
    > test.out 2>&1
eval_tap $? 251 'PublicGetRoleV3' test.out

#- 252 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 252 'PublicGetMyUserV3' test.out

#- 253 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId 'CLFpHxMY' \
    --state 'F836075x' \
    > test.out 2>&1
eval_tap $? 253 'PlatformAuthenticateSAMLV3Handler' test.out

#- 254 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'EpzdnYtp' \
    > test.out 2>&1
eval_tap $? 254 'LoginSSOClient' test.out

#- 255 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'ja5ig2is' \
    > test.out 2>&1
eval_tap $? 255 'LogoutSSOClient' test.out

#- 256 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --body '{"userIds": ["QZga6Vy7"]}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 256 'AdminBulkCheckValidUserIDV4' test.out

#- 257 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --body '{"avatarUrl": "6izPiQRj", "country": "Ya8fv5fI", "dateOfBirth": "t22tIZhj", "displayName": "hgkigW22", "languageTag": "zXMWXfbc", "userName": "M0GIALIb"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FCQgBcLN' \
    > test.out 2>&1
eval_tap $? 257 'AdminUpdateUserV4' test.out

#- 258 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --body '{"code": "T6iOQVYx", "emailAddress": "5rW2gMsI"}' \
    --namespace "$AB_NAMESPACE" \
    --userId '1aYBitSn' \
    > test.out 2>&1
eval_tap $? 258 'AdminUpdateUserEmailAddressV4' test.out

#- 259 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId '3UDeKj97' \
    > test.out 2>&1
eval_tap $? 259 'AdminDisableUserMFAV4' test.out

#- 260 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'I4WYXLqj' \
    > test.out 2>&1
eval_tap $? 260 'AdminListUserRolesV4' test.out

#- 261 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --body '{"assignedNamespaces": ["N7ktOBTr"], "roleId": "aBxWRTVu"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YEqGlKDw' \
    > test.out 2>&1
eval_tap $? 261 'AdminUpdateUserRoleV4' test.out

#- 262 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --body '{"assignedNamespaces": ["TKXBrXiQ"], "roleId": "cd9IW8ki"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CKeQJWZB' \
    > test.out 2>&1
eval_tap $? 262 'AdminAddUserRoleV4' test.out

#- 263 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --body '{"assignedNamespaces": ["vcq1ETvW"], "roleId": "BxYZJh7B"}' \
    --namespace "$AB_NAMESPACE" \
    --userId '8gbnSu9M' \
    > test.out 2>&1
eval_tap $? 263 'AdminRemoveUserRoleV4' test.out

#- 264 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    > test.out 2>&1
eval_tap $? 264 'AdminGetRolesV4' test.out

#- 265 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": true, "roleName": "daeYpCXY"}' \
    > test.out 2>&1
eval_tap $? 265 'AdminCreateRoleV4' test.out

#- 266 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'SMiy87CT' \
    > test.out 2>&1
eval_tap $? 266 'AdminGetRoleV4' test.out

#- 267 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'qEQBg36m' \
    > test.out 2>&1
eval_tap $? 267 'AdminDeleteRoleV4' test.out

#- 268 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "lrDcain0"}' \
    --roleId 'cOVF1zHw' \
    > test.out 2>&1
eval_tap $? 268 'AdminUpdateRoleV4' test.out

#- 269 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --body '{"permissions": [{"action": 58, "resource": "TI0sJ1Q0", "schedAction": 21, "schedCron": "phMTggSP", "schedRange": ["2SLcuAP7"]}]}' \
    --roleId 'vU971Czw' \
    > test.out 2>&1
eval_tap $? 269 'AdminUpdateRolePermissionsV4' test.out

#- 270 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --body '{"permissions": [{"action": 26, "resource": "bg8C7Mvy", "schedAction": 44, "schedCron": "hu6MjOju", "schedRange": ["Gzo1Fz4t"]}]}' \
    --roleId 'U0aSn98N' \
    > test.out 2>&1
eval_tap $? 270 'AdminAddRolePermissionsV4' test.out

#- 271 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --body '["8qOUA0z9"]' \
    --roleId '2RaDe8ng' \
    > test.out 2>&1
eval_tap $? 271 'AdminDeleteRolePermissionsV4' test.out

#- 272 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'T8LRQkMn' \
    > test.out 2>&1
eval_tap $? 272 'AdminListAssignedUsersV4' test.out

#- 273 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --body '{"assignedNamespaces": ["G1LZyF2m"], "namespace": "dYY6ZMfu", "userId": "TYTKsue4"}' \
    --roleId '8qBEBNAV' \
    > test.out 2>&1
eval_tap $? 273 'AdminAssignUserToRoleV4' test.out

#- 274 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --body '{"namespace": "5BTe6ec1", "userId": "zA92URCL"}' \
    --roleId 'SGPmRBZW' \
    > test.out 2>&1
eval_tap $? 274 'AdminRevokeUserFromRoleV4' test.out

#- 275 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"avatarUrl": "unHW7MYv", "country": "r6QA7Ppe", "dateOfBirth": "pc92HA94", "displayName": "eACdeyfU", "languageTag": "pgiPpf8n", "userName": "xKJ3dnmt"}' \
    > test.out 2>&1
eval_tap $? 275 'AdminUpdateMyUserV4' test.out

#- 276 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 276 'AdminDisableMyAuthenticatorV4' test.out

#- 277 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 277 'AdminEnableMyAuthenticatorV4' test.out

#- 278 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 278 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 279 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 279 'AdminGetMyBackupCodesV4' test.out

#- 280 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 280 'AdminGenerateMyBackupCodesV4' test.out

#- 281 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 281 'AdminDisableMyBackupCodesV4' test.out

#- 282 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 282 'AdminDownloadMyBackupCodesV4' test.out

#- 283 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 283 'AdminEnableMyBackupCodesV4' test.out

#- 284 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 284 'AdminGetMyEnabledFactorsV4' test.out

#- 285 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'Pwa64Y4g' \
    > test.out 2>&1
eval_tap $? 285 'AdminMakeFactorMyDefaultV4' test.out

#- 286 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["PEKMhhu9"], "emailAddresses": ["a6f3xJNt"], "isAdmin": false, "roleId": "KLlIIAeH"}' \
    > test.out 2>&1
eval_tap $? 286 'AdminInviteUserV4' test.out

#- 287 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "m5M6LsY1", "policyId": "VMuIEcRl", "policyVersionId": "s68M3MPM"}], "authType": "EMAILPASSWD", "country": "epyyMz6z", "dateOfBirth": "fR1pvTYY", "displayName": "tDOiEi4R", "emailAddress": "uEcHCSGh", "password": "pOZQFlwO", "passwordMD5Sum": "iuKGDFgK", "username": "49YuKnXk", "verified": true}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 287 'PublicCreateTestUserV4' test.out

#- 288 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "8ANrcRal", "policyId": "7ta3fojA", "policyVersionId": "3h4MMW3A"}], "authType": "EMAILPASSWD", "code": "lsFBwjvL", "country": "Yvmg6avu", "dateOfBirth": "dQFF1CPN", "displayName": "Y9u2dVYd", "emailAddress": "glOOoCeK", "password": "0kPKmBqV", "passwordMD5Sum": "ux3lXcD8", "reachMinimumAge": false, "username": "ertAVCqs"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 288 'PublicCreateUserV4' test.out

#- 289 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "y3nJ06Kk", "policyId": "seA0ARj9", "policyVersionId": "ricfayvn"}], "authType": "EMAILPASSWD", "country": "i8MDdY4W", "dateOfBirth": "LHoaUkYn", "displayName": "Qp5egdmV", "password": "E8ImivNt", "reachMinimumAge": true, "username": "qWRKHohO"}' \
    --invitationId 'DoWOr98k' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 289 'CreateUserFromInvitationV4' test.out

#- 290 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --body '{"avatarUrl": "jBUas9jj", "country": "z2FrgiaG", "dateOfBirth": "rcB7dIOV", "displayName": "KIPSJJHo", "languageTag": "5W8tKH8o", "userName": "u9SdbxSX"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'PublicUpdateUserV4' test.out

#- 291 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --body '{"code": "crEFCwqe", "emailAddress": "GNLdIBRd"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'PublicUpdateUserEmailAddressV4' test.out

#- 292 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --body '{"code": "liFQVMKE", "country": "zVUWlUWD", "dateOfBirth": "s2x1EQU0", "displayName": "oepEvcja", "emailAddress": "SgEh6jJn", "password": "FxinIHJ1", "reachMinimumAge": false, "username": "7aq5Zznd", "validateOnly": false}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 292 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 293 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --body '{"emailAddress": "acobTsuR", "password": "lhreQVFI", "username": "D3o8hJWV"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 293 'PublicUpgradeHeadlessAccountV4' test.out

#- 294 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 294 'PublicDisableMyAuthenticatorV4' test.out

#- 295 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 295 'PublicEnableMyAuthenticatorV4' test.out

#- 296 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 296 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 297 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 297 'PublicGetMyBackupCodesV4' test.out

#- 298 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 298 'PublicGenerateMyBackupCodesV4' test.out

#- 299 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 299 'PublicDisableMyBackupCodesV4' test.out

#- 300 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 300 'PublicDownloadMyBackupCodesV4' test.out

#- 301 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 301 'PublicEnableMyBackupCodesV4' test.out

#- 302 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 302 'PublicRemoveTrustedDeviceV4' test.out

#- 303 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 303 'PublicGetMyEnabledFactorsV4' test.out

#- 304 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --factor 'jKIOAw70' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 304 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE