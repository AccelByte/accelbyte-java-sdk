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
echo "1..299"

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
    --body '{"audiences": ["GyLfLg4R"], "baseUri": "YuEbgUDE", "clientId": "cJyIvsPw", "clientName": "Or0BmV5i", "clientPermissions": [{"action": 63, "resource": "vfwFjTSm", "schedAction": 69, "schedCron": "EqoLyLeU", "schedRange": ["GmomGX9s"]}], "deletable": true, "namespace": "8pqLfc5S", "oauthClientType": "wGnReUUL", "redirectUri": "DX4QUIbb", "secret": "5nh68Zny"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'AdminCreateClientV3' test.out

#- 120 AdminGetClientsbyNamespacebyIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'UtRvW9hN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'AdminGetClientsbyNamespacebyIDV3' test.out

#- 121 AdminDeleteClientV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientV3 \
    --clientId 'BSFTtFrO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'AdminDeleteClientV3' test.out

#- 122 AdminUpdateClientV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientV3 \
    --body '{"audiences": ["mjkFrFVA"], "baseUri": "8t0xF34X", "clientName": "pt6ZlTTi", "clientPermissions": [{"action": 4, "resource": "0kr2a0nI", "schedAction": 28, "schedCron": "o7UHCJK5", "schedRange": ["sp0aCvIq"]}], "deletable": false, "namespace": "HVYIlewL", "redirectUri": "RuHY83bG"}' \
    --clientId 'j0HTeeWX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminUpdateClientV3' test.out

#- 123 AdminUpdateClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateClientPermissionV3 \
    --body '{"permissions": [{"action": 23, "resource": "IcRidqct"}]}' \
    --clientId 'DpygY0ax' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminUpdateClientPermissionV3' test.out

#- 124 AdminAddClientPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddClientPermissionsV3 \
    --body '{"permissions": [{"action": 61, "resource": "D4MMO9Tw"}]}' \
    --clientId '2JH0qhWI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 124 'AdminAddClientPermissionsV3' test.out

#- 125 AdminDeleteClientPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteClientPermissionV3 \
    --action '45' \
    --clientId 'HWTgzJFR' \
    --namespace "$AB_NAMESPACE" \
    --resource 'Yw6t1IKZ' \
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
    --platformId 'LO6V4Ode' \
    > test.out 2>&1
eval_tap $? 129 'RetrieveThirdPartyLoginPlatformCredentialV3' test.out

#- 130 AddThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam addThirdPartyLoginPlatformCredentialV3 \
    --body '{"ACSURL": "46QmCidg", "AWSCognitoRegion": "dpP7RTC5", "AWSCognitoUserPool": "87lmUmBz", "AppId": "iPZBnpOf", "ClientId": "kllxfq0N", "Environment": "srSjw5Ho", "FederationMetadataURL": "g0blM1d5", "GenericOauthFlow": true, "IsActive": false, "Issuer": "zLINlEC0", "JWKSEndpoint": "OEsE3yzI", "KeyID": "sUP0Njlu", "OrganizationId": "OrGZTzsL", "PlatformName": "W7Fjfs9n", "RedirectUri": "IkcZ38fU", "Secret": "EanjKHbX", "TeamID": "fk1zxdzx", "TokenAuthenticationType": "g0UXcRyH", "TokenClaimsMapping": {"i3u8BzVW": "u1tOmhUt"}}' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'CgcpvGrE' \
    > test.out 2>&1
eval_tap $? 130 'AddThirdPartyLoginPlatformCredentialV3' test.out

#- 131 DeleteThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'bcZUDExH' \
    > test.out 2>&1
eval_tap $? 131 'DeleteThirdPartyLoginPlatformCredentialV3' test.out

#- 132 UpdateThirdPartyLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformCredentialV3 \
    --body '{"ACSURL": "1tayOGXI", "AWSCognitoRegion": "HzMRjMCt", "AWSCognitoUserPool": "OJsEijlr", "AppId": "bpyyEcQx", "ClientId": "VgJIjMZq", "Environment": "cWfMl6dq", "FederationMetadataURL": "rpD4tnc3", "GenericOauthFlow": true, "IsActive": false, "Issuer": "dtPfAJEo", "JWKSEndpoint": "mwenJvQ8", "KeyID": "grtQSv6E", "OrganizationId": "cALcMIPm", "PlatformName": "s5bT51M4", "RedirectUri": "yko8S0En", "Secret": "GLvGvfuS", "TeamID": "yCTyjj4m", "TokenAuthenticationType": "CaiuMGKO", "TokenClaimsMapping": {"F5GJJooS": "XUl3YU35"}}' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'QHGpBABn' \
    > test.out 2>&1
eval_tap $? 132 'UpdateThirdPartyLoginPlatformCredentialV3' test.out

#- 133 UpdateThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam updateThirdPartyLoginPlatformDomainV3 \
    --body '{"affectedClientIDs": ["OlxDznIC"], "assignedNamespaces": ["QVyqBg34"], "domain": "WTtDkn0r", "roleId": "tn6t0Yx4"}' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'z12EaQ1r' \
    > test.out 2>&1
eval_tap $? 133 'UpdateThirdPartyLoginPlatformDomainV3' test.out

#- 134 DeleteThirdPartyLoginPlatformDomainV3
./ng net.accelbyte.sdk.cli.Main iam deleteThirdPartyLoginPlatformDomainV3 \
    --body '{"domain": "UQYCNTiD"}' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'X4jE3M2I' \
    > test.out 2>&1
eval_tap $? 134 'DeleteThirdPartyLoginPlatformDomainV3' test.out

#- 135 RetrieveSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam retrieveSSOLoginPlatformCredential \
    --namespace "$AB_NAMESPACE" \
    --platformId 'sTHu8QwN' \
    > test.out 2>&1
eval_tap $? 135 'RetrieveSSOLoginPlatformCredential' test.out

#- 136 AddSSOLoginPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam addSSOLoginPlatformCredential \
    --body '{"acsUrl": "yOlXfIWd", "apiKey": "0mcq5T4S", "appId": "Uc7cWfCK", "federationMetadataUrl": "K6Dij1gF", "isActive": false, "redirectUri": "enEMySPf", "secret": "hxBenDiT", "ssoUrl": "iAqFYmFK"}' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'jaELmmll' \
    > test.out 2>&1
eval_tap $? 136 'AddSSOLoginPlatformCredential' test.out

#- 137 DeleteSSOLoginPlatformCredentialV3
./ng net.accelbyte.sdk.cli.Main iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId '6oexId1O' \
    > test.out 2>&1
eval_tap $? 137 'DeleteSSOLoginPlatformCredentialV3' test.out

#- 138 UpdateSSOPlatformCredential
./ng net.accelbyte.sdk.cli.Main iam updateSSOPlatformCredential \
    --body '{"acsUrl": "KGUN2Uzn", "apiKey": "d7uVa7t1", "appId": "4yvSYSV5", "federationMetadataUrl": "2bHifCIf", "isActive": true, "redirectUri": "suu6Pkam", "secret": "6tFSYFt4", "ssoUrl": "ZxA2PzZF"}' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'RkBNlg6h' \
    > test.out 2>&1
eval_tap $? 138 'UpdateSSOPlatformCredential' test.out

#- 139 AdminGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'n5qusKyZ' \
    --platformUserId 'AuV6uUvq' \
    > test.out 2>&1
eval_tap $? 139 'AdminGetUserByPlatformUserIDV3' test.out

#- 140 GetAdminUsersByRoleIdV3
./ng net.accelbyte.sdk.cli.Main iam getAdminUsersByRoleIdV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'M0lV6UZM' \
    > test.out 2>&1
eval_tap $? 140 'GetAdminUsersByRoleIdV3' test.out

#- 141 AdminGetUserByEmailAddressV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByEmailAddressV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'AdminGetUserByEmailAddressV3' test.out

#- 142 AdminListUserIDByUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam adminListUserIDByUserIDsV3 \
    --body '{"userIds": ["lEbxHNgJ"]}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'AdminListUserIDByUserIDsV3' test.out

#- 143 AdminInviteUserV3
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV3 \
    --body '{"emailAddresses": ["RiQExaun"], "isAdmin": false, "roles": ["dAqnHUz4"]}' \
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
    --body '{"listEmailAddressRequest": ["4tx4O6ha"]}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 146 'AdminGetBulkUserByEmailAddressV3' test.out

#- 147 AdminGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mPwNoi07' \
    > test.out 2>&1
eval_tap $? 147 'AdminGetUserByUserIdV3' test.out

#- 148 AdminUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV3 \
    --body '{"country": "1ezDK56J", "dateOfBirth": "FIGe1IMU", "displayName": "CLcN0Dsa", "languageTag": "D5FyBsFe", "userName": "9OYEJVsY"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ffmhyx6J' \
    > test.out 2>&1
eval_tap $? 148 'AdminUpdateUserV3' test.out

#- 149 AdminGetUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserBanV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '25PrM4S3' \
    > test.out 2>&1
eval_tap $? 149 'AdminGetUserBanV3' test.out

#- 150 AdminBanUserV3
./ng net.accelbyte.sdk.cli.Main iam adminBanUserV3 \
    --body '{"ban": "cB8m17hE", "comment": "eLLgoaYt", "endDate": "h6zcf8eA", "reason": "45OMvObW", "skipNotif": false}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jo9LfGee' \
    > test.out 2>&1
eval_tap $? 150 'AdminBanUserV3' test.out

#- 151 AdminUpdateUserBanV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserBanV3 \
    --body '{"enabled": false, "skipNotif": false}' \
    --banId 'BGR6D1Zo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZEZQkJ8D' \
    > test.out 2>&1
eval_tap $? 151 'AdminUpdateUserBanV3' test.out

#- 152 AdminSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminSendVerificationCodeV3 \
    --body '{"context": "SqFnhdKv", "emailAddress": "jFCFbSFl", "languageTag": "EWoMPdgK"}' \
    --namespace "$AB_NAMESPACE" \
    --userId '5zn62mhn' \
    > test.out 2>&1
eval_tap $? 152 'AdminSendVerificationCodeV3' test.out

#- 153 AdminVerifyAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyAccountV3 \
    --body '{"Code": "FSpCTlDN", "ContactType": "BOcygvv2", "LanguageTag": "LAgfBGVz", "validateOnly": false}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nbKYsB0g' \
    > test.out 2>&1
eval_tap $? 153 'AdminVerifyAccountV3' test.out

#- 154 GetUserVerificationCode
./ng net.accelbyte.sdk.cli.Main iam getUserVerificationCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'qJ8VhYSi' \
    > test.out 2>&1
eval_tap $? 154 'GetUserVerificationCode' test.out

#- 155 AdminGetUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserDeletionStatusV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kJl2p9rB' \
    > test.out 2>&1
eval_tap $? 155 'AdminGetUserDeletionStatusV3' test.out

#- 156 AdminUpdateUserDeletionStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserDeletionStatusV3 \
    --body '{"enabled": true}' \
    --namespace "$AB_NAMESPACE" \
    --userId '8N5egapq' \
    > test.out 2>&1
eval_tap $? 156 'AdminUpdateUserDeletionStatusV3' test.out

#- 157 AdminUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam adminUpgradeHeadlessAccountV3 \
    --body '{"code": "xDy4cLfN", "country": "jzzEZYA8", "dateOfBirth": "jIkMJb7c", "displayName": "Z2bPsaLL", "emailAddress": "pEBVEMk5", "password": "AsKaF2P4", "validateOnly": false}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XkI3zdiR' \
    > test.out 2>&1
eval_tap $? 157 'AdminUpgradeHeadlessAccountV3' test.out

#- 158 AdminDeleteUserInformationV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserInformationV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iC5IbPit' \
    > test.out 2>&1
eval_tap $? 158 'AdminDeleteUserInformationV3' test.out

#- 159 AdminGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '71JWlYCo' \
    > test.out 2>&1
eval_tap $? 159 'AdminGetUserLoginHistoriesV3' test.out

#- 160 AdminUpdateUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserPermissionV3 \
    --body '{"Permissions": [{"Action": 16, "Resource": "4nDfPu5V", "SchedAction": 85, "SchedCron": "SYxEVOry", "SchedRange": ["VuZYmgUe"]}]}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EPB5AGPg' \
    > test.out 2>&1
eval_tap $? 160 'AdminUpdateUserPermissionV3' test.out

#- 161 AdminAddUserPermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserPermissionsV3 \
    --body '{"Permissions": [{"Action": 42, "Resource": "k0Zthaj0", "SchedAction": 60, "SchedCron": "BA4azRz0", "SchedRange": ["d56smobo"]}]}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'r4p1PlgQ' \
    > test.out 2>&1
eval_tap $? 161 'AdminAddUserPermissionsV3' test.out

#- 162 AdminDeleteUserPermissionBulkV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionBulkV3 \
    --body '[{"Action": 55, "Resource": "9EcNGOeB"}]' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RY6G5ae0' \
    > test.out 2>&1
eval_tap $? 162 'AdminDeleteUserPermissionBulkV3' test.out

#- 163 AdminDeleteUserPermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserPermissionV3 \
    --action '7' \
    --namespace "$AB_NAMESPACE" \
    --resource 'eDLaZ8JC' \
    --userId 'vbeTfW0h' \
    > test.out 2>&1
eval_tap $? 163 'AdminDeleteUserPermissionV3' test.out

#- 164 AdminGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam adminGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gzrabLJx' \
    > test.out 2>&1
eval_tap $? 164 'AdminGetUserPlatformAccountsV3' test.out

#- 165 AdminGetListJusticePlatformAccounts
./ng net.accelbyte.sdk.cli.Main iam adminGetListJusticePlatformAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'EwJrEBmQ' \
    > test.out 2>&1
eval_tap $? 165 'AdminGetListJusticePlatformAccounts' test.out

#- 166 AdminCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam adminCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace '64haNOzl' \
    --userId 'Gu68UYyu' \
    > test.out 2>&1
eval_tap $? 166 'AdminCreateJusticeUser' test.out

#- 167 AdminLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam adminLinkPlatformAccount \
    --body '{"platformId": "pjdDetno", "platformUserId": "T0rfWtVP"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wQfq6V92' \
    > test.out 2>&1
eval_tap $? 167 'AdminLinkPlatformAccount' test.out

#- 168 AdminPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformUnlinkV3 \
    --body '{"platformNamespace": "gbfPouNd"}' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mP7fckVn' \
    --userId 'uDGvYIb1' \
    > test.out 2>&1
eval_tap $? 168 'AdminPlatformUnlinkV3' test.out

#- 169 AdminPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam adminPlatformLinkV3 \
    --ticket 'p5tcR5z8' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ZJLjSHca' \
    --userId 'R3X4tZmw' \
    > test.out 2>&1
eval_tap $? 169 'AdminPlatformLinkV3' test.out

#- 170 AdminDeleteUserRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRolesV3 \
    --body '["r0QmOnsE"]' \
    --namespace "$AB_NAMESPACE" \
    --userId 'g49eXp0x' \
    > test.out 2>&1
eval_tap $? 170 'AdminDeleteUserRolesV3' test.out

#- 171 AdminSaveUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminSaveUserRoleV3 \
    --body '[{"namespace": "QkZ2Jjuw", "roleId": "WWy0tU11"}]' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PCeSrvej' \
    > test.out 2>&1
eval_tap $? 171 'AdminSaveUserRoleV3' test.out

#- 172 AdminAddUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'UKwVfF37' \
    --userId 'Vr7mkDzF' \
    > test.out 2>&1
eval_tap $? 172 'AdminAddUserRoleV3' test.out

#- 173 AdminDeleteUserRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteUserRoleV3 \
    --namespace "$AB_NAMESPACE" \
    --roleId 'BI1VwhkV' \
    --userId 'SKDlNFOU' \
    > test.out 2>&1
eval_tap $? 173 'AdminDeleteUserRoleV3' test.out

#- 174 AdminUpdateUserStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserStatusV3 \
    --body '{"enabled": true, "reason": "JsvTsqk9"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hg4hj6nU' \
    > test.out 2>&1
eval_tap $? 174 'AdminUpdateUserStatusV3' test.out

#- 175 AdminVerifyUserWithoutVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'debW6Usk' \
    > test.out 2>&1
eval_tap $? 175 'AdminVerifyUserWithoutVerificationCodeV3' test.out

#- 176 AdminGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV3 \
    > test.out 2>&1
eval_tap $? 176 'AdminGetRolesV3' test.out

#- 177 AdminCreateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "managers": [{"displayName": "ZAk01f1K", "namespace": "xCtWADU2", "userId": "guN6U9w1"}], "members": [{"displayName": "3W1K9TZQ", "namespace": "4qRLEi5w", "userId": "owE36rfm"}], "permissions": [{"action": 76, "resource": "0CCs35TP", "schedAction": 92, "schedCron": "PLmsY8Wg", "schedRange": ["wSx1DI5G"]}], "roleName": "H9bv9ZTo"}' \
    > test.out 2>&1
eval_tap $? 177 'AdminCreateRoleV3' test.out

#- 178 AdminGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV3 \
    --roleId '2HpA6pzj' \
    > test.out 2>&1
eval_tap $? 178 'AdminGetRoleV3' test.out

#- 179 AdminDeleteRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV3 \
    --roleId 'HpZO0E9i' \
    > test.out 2>&1
eval_tap $? 179 'AdminDeleteRoleV3' test.out

#- 180 AdminUpdateRoleV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV3 \
    --body '{"deletable": false, "isWildcard": false, "roleName": "Bae3GOgb"}' \
    --roleId 'Qrqra0Pt' \
    > test.out 2>&1
eval_tap $? 180 'AdminUpdateRoleV3' test.out

#- 181 AdminGetRoleAdminStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleAdminStatusV3 \
    --roleId 'kfvOpY2r' \
    > test.out 2>&1
eval_tap $? 181 'AdminGetRoleAdminStatusV3' test.out

#- 182 AdminUpdateAdminRoleStatusV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateAdminRoleStatusV3 \
    --roleId 'amp5lnBn' \
    > test.out 2>&1
eval_tap $? 182 'AdminUpdateAdminRoleStatusV3' test.out

#- 183 AdminRemoveRoleAdminV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleAdminV3 \
    --roleId '6xmBkfMt' \
    > test.out 2>&1
eval_tap $? 183 'AdminRemoveRoleAdminV3' test.out

#- 184 AdminGetRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleManagersV3 \
    --roleId 'C66hFq0k' \
    > test.out 2>&1
eval_tap $? 184 'AdminGetRoleManagersV3' test.out

#- 185 AdminAddRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleManagersV3 \
    --body '{"managers": [{"displayName": "POkORm2X", "namespace": "jlNEE5ec", "userId": "PzAmi0yS"}]}' \
    --roleId 'JHfPloP1' \
    > test.out 2>&1
eval_tap $? 185 'AdminAddRoleManagersV3' test.out

#- 186 AdminRemoveRoleManagersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleManagersV3 \
    --body '{"managers": [{"displayName": "XkYK4MgI", "namespace": "sDSFMPyM", "userId": "hyw1OLZP"}]}' \
    --roleId 'VwwxH4BI' \
    > test.out 2>&1
eval_tap $? 186 'AdminRemoveRoleManagersV3' test.out

#- 187 AdminGetRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleMembersV3 \
    --roleId 'DJuDoShM' \
    > test.out 2>&1
eval_tap $? 187 'AdminGetRoleMembersV3' test.out

#- 188 AdminAddRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRoleMembersV3 \
    --body '{"members": [{"displayName": "Mftll8N0", "namespace": "VvChHz9u", "userId": "rmt7QWvE"}]}' \
    --roleId '8s6Uz8BR' \
    > test.out 2>&1
eval_tap $? 188 'AdminAddRoleMembersV3' test.out

#- 189 AdminRemoveRoleMembersV3
./ng net.accelbyte.sdk.cli.Main iam adminRemoveRoleMembersV3 \
    --body '{"members": [{"displayName": "uYWDTtL6", "namespace": "MTTRkCbb", "userId": "9S5Q1IVH"}]}' \
    --roleId 'GT88prRE' \
    > test.out 2>&1
eval_tap $? 189 'AdminRemoveRoleMembersV3' test.out

#- 190 AdminUpdateRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV3 \
    --body '{"permissions": [{"action": 54, "resource": "gYOWdHJ9", "schedAction": 70, "schedCron": "umohtU13", "schedRange": ["gf7TRigN"]}]}' \
    --roleId 'Zj5w5y3H' \
    > test.out 2>&1
eval_tap $? 190 'AdminUpdateRolePermissionsV3' test.out

#- 191 AdminAddRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV3 \
    --body '{"permissions": [{"action": 25, "resource": "K8QVOa62", "schedAction": 9, "schedCron": "QZtbLLcF", "schedRange": ["671WLtv3"]}]}' \
    --roleId '8Hecczop' \
    > test.out 2>&1
eval_tap $? 191 'AdminAddRolePermissionsV3' test.out

#- 192 AdminDeleteRolePermissionsV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV3 \
    --body '["FmeRwpcJ"]' \
    --roleId 'BZyi3mLC' \
    > test.out 2>&1
eval_tap $? 192 'AdminDeleteRolePermissionsV3' test.out

#- 193 AdminDeleteRolePermissionV3
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionV3 \
    --action '72' \
    --resource 'zekiSzey' \
    --roleId 'olnOQt0j' \
    > test.out 2>&1
eval_tap $? 193 'AdminDeleteRolePermissionV3' test.out

#- 194 AdminGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam adminGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 194 'AdminGetMyUserV3' test.out

#- 195 UserAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam userAuthenticationV3 \
    --password 'oVHgCytC' \
    --requestId '6lRG98Yx' \
    --userName 'nHbRdoTK' \
    > test.out 2>&1
eval_tap $? 195 'UserAuthenticationV3' test.out

#- 196 GetCountryLocationV3
./ng net.accelbyte.sdk.cli.Main iam getCountryLocationV3 \
    > test.out 2>&1
eval_tap $? 196 'GetCountryLocationV3' test.out

#- 197 Logout
./ng net.accelbyte.sdk.cli.Main iam logout \
    > test.out 2>&1
eval_tap $? 197 'Logout' test.out

#- 198 AdminRetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'KeuSjfZe' \
    --userId '9i1osghF' \
    > test.out 2>&1
eval_tap $? 198 'AdminRetrieveUserThirdPartyPlatformTokenV3' test.out

#- 199 RevokeUserV3
./ng net.accelbyte.sdk.cli.Main iam revokeUserV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1hzi1Nl4' \
    > test.out 2>&1
eval_tap $? 199 'RevokeUserV3' test.out

#- 200 AuthorizeV3
./ng net.accelbyte.sdk.cli.Main iam authorizeV3 \
    --clientId '7syJ5ibz' \
    --responseType 'code' \
    > test.out 2>&1
eval_tap $? 200 'AuthorizeV3' test.out

#- 201 TokenIntrospectionV3
./ng net.accelbyte.sdk.cli.Main iam tokenIntrospectionV3 \
    --token 'CLIvWPVR' \
    > test.out 2>&1
eval_tap $? 201 'TokenIntrospectionV3' test.out

#- 202 GetJWKSV3
./ng net.accelbyte.sdk.cli.Main iam getJWKSV3 \
    > test.out 2>&1
eval_tap $? 202 'GetJWKSV3' test.out

#- 203 Change2faMethod
./ng net.accelbyte.sdk.cli.Main iam change2faMethod \
    --factor 'sdEqA61y' \
    --mfaToken 'TrMgsycT' \
    > test.out 2>&1
eval_tap $? 203 'Change2faMethod' test.out

#- 204 Verify2faCode
./ng net.accelbyte.sdk.cli.Main iam verify2faCode \
    --code 'gmPzc20E' \
    --factor 'uO5dMqGD' \
    --mfaToken 'lSZPY07r' \
    --rememberDevice
    > test.out 2>&1
eval_tap $? 204 'Verify2faCode' test.out

#- 205 RetrieveUserThirdPartyPlatformTokenV3
./ng net.accelbyte.sdk.cli.Main iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'EVSjzHjL' \
    --userId '6ZbXjG6D' \
    > test.out 2>&1
eval_tap $? 205 'RetrieveUserThirdPartyPlatformTokenV3' test.out

#- 206 AuthCodeRequestV3
./ng net.accelbyte.sdk.cli.Main iam authCodeRequestV3 \
    --platformId 'Smpp3op8' \
    --requestId 'htaRLxtW' \
    > test.out 2>&1
eval_tap $? 206 'AuthCodeRequestV3' test.out

#- 207 PlatformTokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam platformTokenGrantV3 \
    --platformId '4PvFkEST' \
    > test.out 2>&1
eval_tap $? 207 'PlatformTokenGrantV3' test.out

#- 208 GetRevocationListV3
./ng net.accelbyte.sdk.cli.Main iam getRevocationListV3 \
    > test.out 2>&1
eval_tap $? 208 'GetRevocationListV3' test.out

#- 209 TokenRevocationV3
./ng net.accelbyte.sdk.cli.Main iam tokenRevocationV3 \
    --token 'ULat5F1L' \
    > test.out 2>&1
eval_tap $? 209 'TokenRevocationV3' test.out

#- 210 TokenGrantV3
./ng net.accelbyte.sdk.cli.Main iam tokenGrantV3 \
    --grantType 'authorization_code' \
    > test.out 2>&1
eval_tap $? 210 'TokenGrantV3' test.out

#- 211 PlatformAuthenticationV3
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticationV3 \
    --platformId '7cR7q6PW' \
    --state 'hZmmKz41' \
    > test.out 2>&1
eval_tap $? 211 'PlatformAuthenticationV3' test.out

#- 212 PublicGetInputValidations
./ng net.accelbyte.sdk.cli.Main iam publicGetInputValidations \
    > test.out 2>&1
eval_tap $? 212 'PublicGetInputValidations' test.out

#- 213 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
./ng net.accelbyte.sdk.cli.Main iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 213 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3' test.out

#- 214 PublicListUserIDByPlatformUserIDsV3
./ng net.accelbyte.sdk.cli.Main iam publicListUserIDByPlatformUserIDsV3 \
    --body '{"platformUserIds": ["i1Tp78Fi"]}' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'pJHahViJ' \
    > test.out 2>&1
eval_tap $? 214 'PublicListUserIDByPlatformUserIDsV3' test.out

#- 215 PublicGetUserByPlatformUserIDV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByPlatformUserIDV3 \
    --namespace "$AB_NAMESPACE" \
    --platformId 'vLYW0kdm' \
    --platformUserId 'lk2luqSO' \
    > test.out 2>&1
eval_tap $? 215 'PublicGetUserByPlatformUserIDV3' test.out

#- 216 PublicGetAsyncStatus
./ng net.accelbyte.sdk.cli.Main iam publicGetAsyncStatus \
    --namespace "$AB_NAMESPACE" \
    --requestId 'OA2VOZBo' \
    > test.out 2>&1
eval_tap $? 216 'PublicGetAsyncStatus' test.out

#- 217 PublicSearchUserV3
./ng net.accelbyte.sdk.cli.Main iam publicSearchUserV3 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 217 'PublicSearchUserV3' test.out

#- 218 PublicCreateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV3 \
    --body '{"PasswordMD5Sum": "NbB98PuS", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "kqFzPwSM", "policyId": "XT53bBuL", "policyVersionId": "38beOYDV"}], "authType": "uHZQ9LYt", "code": "6w23Wf8i", "country": "EQo72sH0", "dateOfBirth": "aRdcDlDy", "displayName": "GcsfIuI4", "emailAddress": "Dv5lEJpK", "password": "1AyRlzsr", "reachMinimumAge": true}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 218 'PublicCreateUserV3' test.out

#- 219 CheckUserAvailability
./ng net.accelbyte.sdk.cli.Main iam checkUserAvailability \
    --namespace "$AB_NAMESPACE" \
    --field 'FZivQOHG' \
    --query '6wVicNra' \
    > test.out 2>&1
eval_tap $? 219 'CheckUserAvailability' test.out

#- 220 PublicBulkGetUsers
./ng net.accelbyte.sdk.cli.Main iam publicBulkGetUsers \
    --body '{"userIds": ["tsvvHLmI"]}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 220 'PublicBulkGetUsers' test.out

#- 221 PublicSendRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicSendRegistrationCode \
    --body '{"emailAddress": "ohfNISLX", "languageTag": "MDWDdm5F"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 221 'PublicSendRegistrationCode' test.out

#- 222 PublicVerifyRegistrationCode
./ng net.accelbyte.sdk.cli.Main iam publicVerifyRegistrationCode \
    --body '{"code": "E4lliQMn", "emailAddress": "utJbpEo4"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 222 'PublicVerifyRegistrationCode' test.out

#- 223 PublicForgotPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicForgotPasswordV3 \
    --body '{"emailAddress": "mUNHFtdm", "languageTag": "l2xNviWa"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 223 'PublicForgotPasswordV3' test.out

#- 224 GetAdminInvitationV3
./ng net.accelbyte.sdk.cli.Main iam getAdminInvitationV3 \
    --invitationId 'cJc3Fm7Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 224 'GetAdminInvitationV3' test.out

#- 225 CreateUserFromInvitationV3
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV3 \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "uKgoCBqS", "policyId": "5uIdCbwC", "policyVersionId": "eeq9ouEd"}], "authType": "DtjOgsyp", "country": "Lkm2ZYew", "dateOfBirth": "5H7Zm0gn", "displayName": "Yyj6MXf9", "password": "G1ntyebv", "reachMinimumAge": false}' \
    --invitationId 'eHenAALK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 225 'CreateUserFromInvitationV3' test.out

#- 226 UpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam updateUserV3 \
    --body '{"country": "t7EfxIH4", "dateOfBirth": "46oUnP2S", "displayName": "74unXwg0", "languageTag": "JKqVWW1r", "userName": "jK1epwkA"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 226 'UpdateUserV3' test.out

#- 227 PublicUpdateUserV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV3 \
    --body '{"country": "vcsYvbgf", "dateOfBirth": "BVPpTa8Y", "displayName": "uq7TKiNX", "languageTag": "mz7eMrMD", "userName": "5TbaUxTC"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 227 'PublicUpdateUserV3' test.out

#- 228 PublicSendVerificationCodeV3
./ng net.accelbyte.sdk.cli.Main iam publicSendVerificationCodeV3 \
    --body '{"context": "Tng0xjtd", "emailAddress": "Brjs3Kiy", "languageTag": "kt2Ck2gO"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 228 'PublicSendVerificationCodeV3' test.out

#- 229 PublicUserVerificationV3
./ng net.accelbyte.sdk.cli.Main iam publicUserVerificationV3 \
    --body '{"code": "lSatECZ2", "contactType": "UgwQLqDq", "languageTag": "YSxTPuVl", "validateOnly": true}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 229 'PublicUserVerificationV3' test.out

#- 230 PublicUpgradeHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV3 \
    --body '{"code": "qirdp3yx", "country": "nsETl1Sv", "dateOfBirth": "hQudsjIh", "displayName": "XdxiSoWp", "emailAddress": "nnxgX7BC", "password": "PMqzQIxi", "validateOnly": false}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 230 'PublicUpgradeHeadlessAccountV3' test.out

#- 231 PublicVerifyHeadlessAccountV3
./ng net.accelbyte.sdk.cli.Main iam publicVerifyHeadlessAccountV3 \
    --body '{"emailAddress": "hpNYsHtd", "password": "B3IkjuaZ"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 231 'PublicVerifyHeadlessAccountV3' test.out

#- 232 PublicUpdatePasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicUpdatePasswordV3 \
    --body '{"languageTag": "qhJilrZk", "newPassword": "SSKgP5rx", "oldPassword": "CR77G9d5"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 232 'PublicUpdatePasswordV3' test.out

#- 233 PublicCreateJusticeUser
./ng net.accelbyte.sdk.cli.Main iam publicCreateJusticeUser \
    --namespace "$AB_NAMESPACE" \
    --targetNamespace 'CA1GORSb' \
    > test.out 2>&1
eval_tap $? 233 'PublicCreateJusticeUser' test.out

#- 234 PublicPlatformLinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformLinkV3 \
    --ticket 'L9n0dbWD' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'EupmdLQz' \
    > test.out 2>&1
eval_tap $? 234 'PublicPlatformLinkV3' test.out

#- 235 PublicPlatformUnlinkV3
./ng net.accelbyte.sdk.cli.Main iam publicPlatformUnlinkV3 \
    --body '{"platformNamespace": "PnNfBAcW"}' \
    --namespace "$AB_NAMESPACE" \
    --platformId 'ArbkCfdH' \
    > test.out 2>&1
eval_tap $? 235 'PublicPlatformUnlinkV3' test.out

#- 236 PublicWebLinkPlatform
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatform \
    --namespace "$AB_NAMESPACE" \
    --platformId 'IZb03otq' \
    > test.out 2>&1
eval_tap $? 236 'PublicWebLinkPlatform' test.out

#- 237 PublicWebLinkPlatformEstablish
./ng net.accelbyte.sdk.cli.Main iam publicWebLinkPlatformEstablish \
    --namespace "$AB_NAMESPACE" \
    --platformId 'mBuS9V2p' \
    --state 'CZ23UHmk' \
    > test.out 2>&1
eval_tap $? 237 'PublicWebLinkPlatformEstablish' test.out

#- 238 ResetPasswordV3
./ng net.accelbyte.sdk.cli.Main iam resetPasswordV3 \
    --body '{"code": "0lpJ4JLl", "emailAddress": "01qi7L2o", "newPassword": "DUoVRUb3"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 238 'ResetPasswordV3' test.out

#- 239 PublicGetUserByUserIdV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserByUserIdV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '9j22P4Sp' \
    > test.out 2>&1
eval_tap $? 239 'PublicGetUserByUserIdV3' test.out

#- 240 PublicGetUserBanHistoryV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserBanHistoryV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '09cKmjRU' \
    > test.out 2>&1
eval_tap $? 240 'PublicGetUserBanHistoryV3' test.out

#- 241 PublicGetUserLoginHistoriesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserLoginHistoriesV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bZVBVS7O' \
    > test.out 2>&1
eval_tap $? 241 'PublicGetUserLoginHistoriesV3' test.out

#- 242 PublicGetUserPlatformAccountsV3
./ng net.accelbyte.sdk.cli.Main iam publicGetUserPlatformAccountsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'K2Zrdcsc' \
    > test.out 2>&1
eval_tap $? 242 'PublicGetUserPlatformAccountsV3' test.out

#- 243 PublicLinkPlatformAccount
./ng net.accelbyte.sdk.cli.Main iam publicLinkPlatformAccount \
    --body '{"platformId": "kMekROWZ", "platformUserId": "2KUTqkK2"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eFaGLoSm' \
    > test.out 2>&1
eval_tap $? 243 'PublicLinkPlatformAccount' test.out

#- 244 PublicValidateUserByUserIDAndPasswordV3
./ng net.accelbyte.sdk.cli.Main iam publicValidateUserByUserIDAndPasswordV3 \
    --password 'EEPbLywJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'syUie6fZ' \
    > test.out 2>&1
eval_tap $? 244 'PublicValidateUserByUserIDAndPasswordV3' test.out

#- 245 PublicGetRolesV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRolesV3 \
    > test.out 2>&1
eval_tap $? 245 'PublicGetRolesV3' test.out

#- 246 PublicGetRoleV3
./ng net.accelbyte.sdk.cli.Main iam publicGetRoleV3 \
    --roleId 'gLllUPsO' \
    > test.out 2>&1
eval_tap $? 246 'PublicGetRoleV3' test.out

#- 247 PublicGetMyUserV3
./ng net.accelbyte.sdk.cli.Main iam publicGetMyUserV3 \
    > test.out 2>&1
eval_tap $? 247 'PublicGetMyUserV3' test.out

#- 248 PlatformAuthenticateSAMLV3Handler
./ng net.accelbyte.sdk.cli.Main iam platformAuthenticateSAMLV3Handler \
    --platformId '8lg46Si7' \
    --state '006vL2w4' \
    > test.out 2>&1
eval_tap $? 248 'PlatformAuthenticateSAMLV3Handler' test.out

#- 249 LoginSSOClient
./ng net.accelbyte.sdk.cli.Main iam loginSSOClient \
    --platformId 'aajDAOx0' \
    > test.out 2>&1
eval_tap $? 249 'LoginSSOClient' test.out

#- 250 LogoutSSOClient
./ng net.accelbyte.sdk.cli.Main iam logoutSSOClient \
    --platformId 'iJjYleak' \
    > test.out 2>&1
eval_tap $? 250 'LogoutSSOClient' test.out

#- 251 AdminBulkCheckValidUserIDV4
./ng net.accelbyte.sdk.cli.Main iam adminBulkCheckValidUserIDV4 \
    --body '{"userIds": ["tqv2Wklj"]}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 251 'AdminBulkCheckValidUserIDV4' test.out

#- 252 AdminUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserV4 \
    --body '{"country": "QuD5mnJO", "dateOfBirth": "NqHGq8mB", "displayName": "7mF2lMFc", "languageTag": "aghFXJIJ", "userName": "flRHFcsI"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qCy4xDif' \
    > test.out 2>&1
eval_tap $? 252 'AdminUpdateUserV4' test.out

#- 253 AdminUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserEmailAddressV4 \
    --body '{"code": "SSQ5On2c", "emailAddress": "cEcl3xei"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O4bwF5JO' \
    > test.out 2>&1
eval_tap $? 253 'AdminUpdateUserEmailAddressV4' test.out

#- 254 AdminDisableUserMFAV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableUserMFAV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jGoGxKM3' \
    > test.out 2>&1
eval_tap $? 254 'AdminDisableUserMFAV4' test.out

#- 255 AdminListUserRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminListUserRolesV4 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qMce5tfL' \
    > test.out 2>&1
eval_tap $? 255 'AdminListUserRolesV4' test.out

#- 256 AdminUpdateUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateUserRoleV4 \
    --body '{"assignedNamespaces": ["cpjFZMKC"], "roleId": "bp0pEbLC"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LFpHxMYF' \
    > test.out 2>&1
eval_tap $? 256 'AdminUpdateUserRoleV4' test.out

#- 257 AdminAddUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAddUserRoleV4 \
    --body '{"assignedNamespaces": ["836075xE"], "roleId": "pzdnYtpj"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'a5ig2isQ' \
    > test.out 2>&1
eval_tap $? 257 'AdminAddUserRoleV4' test.out

#- 258 AdminRemoveUserRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRemoveUserRoleV4 \
    --body '{"assignedNamespaces": ["Zga6Vy76"], "roleId": "izPiQRjY"}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'a8fv5fIt' \
    > test.out 2>&1
eval_tap $? 258 'AdminRemoveUserRoleV4' test.out

#- 259 AdminGetRolesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRolesV4 \
    > test.out 2>&1
eval_tap $? 259 'AdminGetRolesV4' test.out

#- 260 AdminCreateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "hgkigW22"}' \
    > test.out 2>&1
eval_tap $? 260 'AdminCreateRoleV4' test.out

#- 261 AdminGetRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminGetRoleV4 \
    --roleId 'zXMWXfbc' \
    > test.out 2>&1
eval_tap $? 261 'AdminGetRoleV4' test.out

#- 262 AdminDeleteRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRoleV4 \
    --roleId 'M0GIALIb' \
    > test.out 2>&1
eval_tap $? 262 'AdminDeleteRoleV4' test.out

#- 263 AdminUpdateRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "BcLNT6iO"}' \
    --roleId 'QVYx5rW2' \
    > test.out 2>&1
eval_tap $? 263 'AdminUpdateRoleV4' test.out

#- 264 AdminUpdateRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateRolePermissionsV4 \
    --body '{"permissions": [{"action": 13, "resource": "MsI1aYBi", "schedAction": 38, "schedCron": "Sn3UDeKj", "schedRange": ["97I4WYXL"]}]}' \
    --roleId 'qjN7ktOB' \
    > test.out 2>&1
eval_tap $? 264 'AdminUpdateRolePermissionsV4' test.out

#- 265 AdminAddRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminAddRolePermissionsV4 \
    --body '{"permissions": [{"action": 91, "resource": "raBxWRTV", "schedAction": 41, "schedCron": "YEqGlKDw", "schedRange": ["TKXBrXiQ"]}]}' \
    --roleId 'cd9IW8ki' \
    > test.out 2>&1
eval_tap $? 265 'AdminAddRolePermissionsV4' test.out

#- 266 AdminDeleteRolePermissionsV4
./ng net.accelbyte.sdk.cli.Main iam adminDeleteRolePermissionsV4 \
    --body '["CKeQJWZB"]' \
    --roleId 'vcq1ETvW' \
    > test.out 2>&1
eval_tap $? 266 'AdminDeleteRolePermissionsV4' test.out

#- 267 AdminListAssignedUsersV4
./ng net.accelbyte.sdk.cli.Main iam adminListAssignedUsersV4 \
    --roleId 'BxYZJh7B' \
    > test.out 2>&1
eval_tap $? 267 'AdminListAssignedUsersV4' test.out

#- 268 AdminAssignUserToRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminAssignUserToRoleV4 \
    --body '{"assignedNamespaces": ["8gbnSu9M"], "namespace": "2OxD2uda", "userId": "eYpCXYSM"}' \
    --roleId 'iy87CTqE' \
    > test.out 2>&1
eval_tap $? 268 'AdminAssignUserToRoleV4' test.out

#- 269 AdminRevokeUserFromRoleV4
./ng net.accelbyte.sdk.cli.Main iam adminRevokeUserFromRoleV4 \
    --body '{"namespace": "QBg36my3", "userId": "sY2clrDc"}' \
    --roleId 'ain0cOVF' \
    > test.out 2>&1
eval_tap $? 269 'AdminRevokeUserFromRoleV4' test.out

#- 270 AdminUpdateMyUserV4
./ng net.accelbyte.sdk.cli.Main iam adminUpdateMyUserV4 \
    --body '{"country": "1zHwDTI0", "dateOfBirth": "sJ1Q0kph", "displayName": "MTggSP2S", "languageTag": "LcuAP7vU", "userName": "971Czw2n"}' \
    > test.out 2>&1
eval_tap $? 270 'AdminUpdateMyUserV4' test.out

#- 271 AdminDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 271 'AdminDisableMyAuthenticatorV4' test.out

#- 272 AdminEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyAuthenticatorV4 \
    > test.out 2>&1
eval_tap $? 272 'AdminEnableMyAuthenticatorV4' test.out

#- 273 AdminGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyAuthenticatorKeyV4 \
    > test.out 2>&1
eval_tap $? 273 'AdminGenerateMyAuthenticatorKeyV4' test.out

#- 274 AdminGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 274 'AdminGetMyBackupCodesV4' test.out

#- 275 AdminGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminGenerateMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 275 'AdminGenerateMyBackupCodesV4' test.out

#- 276 AdminDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDisableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 276 'AdminDisableMyBackupCodesV4' test.out

#- 277 AdminDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminDownloadMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 277 'AdminDownloadMyBackupCodesV4' test.out

#- 278 AdminEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam adminEnableMyBackupCodesV4 \
    > test.out 2>&1
eval_tap $? 278 'AdminEnableMyBackupCodesV4' test.out

#- 279 AdminGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam adminGetMyEnabledFactorsV4 \
    > test.out 2>&1
eval_tap $? 279 'AdminGetMyEnabledFactorsV4' test.out

#- 280 AdminMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam adminMakeFactorMyDefaultV4 \
    --factor 'bg8C7Mvy' \
    > test.out 2>&1
eval_tap $? 280 'AdminMakeFactorMyDefaultV4' test.out

#- 281 AdminInviteUserV4
./ng net.accelbyte.sdk.cli.Main iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["whu6MjOj"], "emailAddresses": ["uGzo1Fz4"], "isAdmin": true, "roleId": "U0aSn98N"}' \
    > test.out 2>&1
eval_tap $? 281 'AdminInviteUserV4' test.out

#- 282 PublicCreateTestUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateTestUserV4 \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "OUA0z92R", "policyId": "aDe8ngT8", "policyVersionId": "LRQkMnG1"}], "authType": "LZyF2mdY", "country": "Y6ZMfuTY", "dateOfBirth": "TKsue48q", "displayName": "BEBNAV5B", "emailAddress": "Te6ec1zA", "password": "92URCLSG", "passwordMD5Sum": "PmRBZWun", "username": "HW7MYvr6", "verified": true}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 282 'PublicCreateTestUserV4' test.out

#- 283 PublicCreateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicCreateUserV4 \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "epc92HA9", "policyId": "4eACdeyf", "policyVersionId": "UpgiPpf8"}], "authType": "nxKJ3dnm", "code": "tPwa64Y4", "country": "gPEKMhhu", "dateOfBirth": "9a6f3xJN", "displayName": "tUlKLlII", "emailAddress": "AeHbm5M6", "password": "LsY1VMuI", "passwordMD5Sum": "EcRls68M", "reachMinimumAge": true, "username": "epyyMz6z"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 283 'PublicCreateUserV4' test.out

#- 284 CreateUserFromInvitationV4
./ng net.accelbyte.sdk.cli.Main iam createUserFromInvitationV4 \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "R1pvTYYt", "policyId": "DOiEi4Ru", "policyVersionId": "EcHCSGhp"}], "authType": "OZQFlwOi", "country": "uKGDFgK4", "dateOfBirth": "9YuKnXks", "displayName": "0m8ANrcR", "password": "al7ta3fo", "reachMinimumAge": false, "username": "A3h4MMW3"}' \
    --invitationId 'AJ5zlsFB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'CreateUserFromInvitationV4' test.out

#- 285 PublicUpdateUserV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserV4 \
    --body '{"country": "wjvLYvmg", "dateOfBirth": "6avudQFF", "displayName": "1CPNY9u2", "languageTag": "dVYdglOO", "userName": "oCeK0kPK"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 285 'PublicUpdateUserV4' test.out

#- 286 PublicUpdateUserEmailAddressV4
./ng net.accelbyte.sdk.cli.Main iam publicUpdateUserEmailAddressV4 \
    --body '{"code": "mBqVux3l", "emailAddress": "XcD8aert"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 286 'PublicUpdateUserEmailAddressV4' test.out

#- 287 PublicUpgradeHeadlessAccountWithVerificationCodeV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --body '{"code": "AVCqs8XT", "country": "8xy3nJ06", "dateOfBirth": "KkseA0AR", "displayName": "j9ricfay", "emailAddress": "vnhi8MDd", "password": "Y4WLHoaU", "reachMinimumAge": false, "username": "YnQp5egd", "validateOnly": false}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 287 'PublicUpgradeHeadlessAccountWithVerificationCodeV4' test.out

#- 288 PublicUpgradeHeadlessAccountV4
./ng net.accelbyte.sdk.cli.Main iam publicUpgradeHeadlessAccountV4 \
    --body '{"emailAddress": "VE8ImivN", "password": "tQxqWRKH", "username": "ohODoWOr"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 288 'PublicUpgradeHeadlessAccountV4' test.out

#- 289 PublicDisableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 289 'PublicDisableMyAuthenticatorV4' test.out

#- 290 PublicEnableMyAuthenticatorV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyAuthenticatorV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'PublicEnableMyAuthenticatorV4' test.out

#- 291 PublicGenerateMyAuthenticatorKeyV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 291 'PublicGenerateMyAuthenticatorKeyV4' test.out

#- 292 PublicGetMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 292 'PublicGetMyBackupCodesV4' test.out

#- 293 PublicGenerateMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicGenerateMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 293 'PublicGenerateMyBackupCodesV4' test.out

#- 294 PublicDisableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDisableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 294 'PublicDisableMyBackupCodesV4' test.out

#- 295 PublicDownloadMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicDownloadMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 295 'PublicDownloadMyBackupCodesV4' test.out

#- 296 PublicEnableMyBackupCodesV4
./ng net.accelbyte.sdk.cli.Main iam publicEnableMyBackupCodesV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 296 'PublicEnableMyBackupCodesV4' test.out

#- 297 PublicRemoveTrustedDeviceV4
./ng net.accelbyte.sdk.cli.Main iam publicRemoveTrustedDeviceV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 297 'PublicRemoveTrustedDeviceV4' test.out

#- 298 PublicGetMyEnabledFactorsV4
./ng net.accelbyte.sdk.cli.Main iam publicGetMyEnabledFactorsV4 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 298 'PublicGetMyEnabledFactorsV4' test.out

#- 299 PublicMakeFactorMyDefaultV4
./ng net.accelbyte.sdk.cli.Main iam publicMakeFactorMyDefaultV4 \
    --factor '98kjBUas' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 299 'PublicMakeFactorMyDefaultV4' test.out


rm -f "tmp.dat"

exit $EXIT_CODE