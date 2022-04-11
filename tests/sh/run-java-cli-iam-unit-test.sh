#!/bin/bash

#Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
#This is licensed software from AccelByte Inc, for limitations
#and restrictions contact your company contract manager.

#Meta:
#- random seed: 256
#- template file: cli_test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH="${MODULE_PATH:-../../samples/cli}"
JAR_PATH="${MODULE_PATH}/build/libs/cli.jar"
TEMP_FILE='file.tmp'

OPERATIONS_COUNT=298

FINISHED_COUNT=0
SUCCESS_COUNT=0
FAILED_COUNT=0

export AB_BASE_URL="http://0.0.0.0:8080"
export AB_CLIENT_ID="admin"
export AB_CLIENT_SECRET="admin"
export AB_NAMESPACE="test"

get_current_year() { echo $(date +'%Y'); }
get_adult_birthday() { echo "$(( $(get_current_year) - 22))-01-01"; }

get_random_int() { echo $(( $1 + ( RANDOM % (($2 - $1)) ) )); }
get_random_bool() { ( (( (RANDOM % 2) == 1)) && echo "true" ) || ( echo "false" ) }
get_random_element() { declare -a a=("$@"); r=$((RANDOM % ${#a[@]})); echo ${a[$r]}; }

create_file() {
    touch $1
}

delete_file() {
    [ ! -e $1 ] || rm $1
}

update_status() {
    return_code=$1
    operation_name=$2

    FINISHED_COUNT=$(( $FINISHED_COUNT + 1 ))

    if [ $return_code == 0 ]
    then
        SUCCESS_COUNT=$(( $SUCCESS_COUNT + 1 ))
        echo "ok $FINISHED_COUNT $operation_name"
    else
        FAILED_COUNT=$(( $FAILED_COUNT + 1 ))
        echo "not ok $FINISHED_COUNT - $operation_name"
        echo '  ---'
        echo '  error: |-'
        while read line; do
          echo "    $line" | tr '\n' ' '
        echo $line
        done < $TEMP_FILE
    fi
}

create_file 'tmp.dat'

echo 'TAP version 13'
echo "1..$OPERATIONS_COUNT"

java -jar ${JAR_PATH} loginClient

#- 1 GetBansType
java -jar ${JAR_PATH} iam getBansType \
    >$TEMP_FILE 2>&1
update_status $? 'GetBansType'
delete_file $TEMP_FILE

#- 2 GetListBanReason
java -jar ${JAR_PATH} iam getListBanReason \
    >$TEMP_FILE 2>&1
update_status $? 'GetListBanReason'
delete_file $TEMP_FILE

#- 3 GetClients
update_status 0 'GetClients (skipped deprecated)'

#- 4 CreateClient
update_status 0 'CreateClient (skipped deprecated)'

#- 5 GetClient
java -jar ${JAR_PATH} iam getClient \
    --clientId 'FtBxyZcD' \
    >$TEMP_FILE 2>&1
update_status $? 'GetClient'
delete_file $TEMP_FILE

#- 6 UpdateClient
java -jar ${JAR_PATH} iam updateClient \
    --body '{"ClientName": "XBpGlsQu", "RedirectUri": "Ju8vMf0I"}' \
    --clientId 'sJkTrd8I' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateClient'
delete_file $TEMP_FILE

#- 7 DeleteClient
update_status 0 'DeleteClient (skipped deprecated)'

#- 8 UpdateClientPermission
java -jar ${JAR_PATH} iam updateClientPermission \
    --body '{"Permissions": [{"Action": 59, "Resource": "cV2zXnTK"}]}' \
    --clientId 'jXY1bPqa' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateClientPermission'
delete_file $TEMP_FILE

#- 9 AddClientPermission
java -jar ${JAR_PATH} iam addClientPermission \
    --action '24' \
    --clientId 'iBxx9Cs1' \
    --resource '8EY84ekI' \
    >$TEMP_FILE 2>&1
update_status $? 'AddClientPermission'
delete_file $TEMP_FILE

#- 10 DeleteClientPermission
java -jar ${JAR_PATH} iam deleteClientPermission \
    --action '39' \
    --clientId 'qRzHU1oh' \
    --resource '570KQBVa' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteClientPermission'
delete_file $TEMP_FILE

#- 11 UpdateClientSecret
java -jar ${JAR_PATH} iam updateClientSecret \
    --body '{"NewSecret": "ewc72krS"}' \
    --clientId 'ha68n3Yn' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateClientSecret'
delete_file $TEMP_FILE

#- 12 GetClientsbyNamespace
java -jar ${JAR_PATH} iam getClientsbyNamespace \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetClientsbyNamespace'
delete_file $TEMP_FILE

#- 13 CreateClientByNamespace
java -jar ${JAR_PATH} iam createClientByNamespace \
    --body '{"ClientId": "ozp1C2Km", "ClientName": "IQTuBdNE", "ClientPermissions": [{"Action": 93, "Resource": "sxFb8CJ1", "SchedAction": 76, "SchedCron": "7DJZaMSx", "SchedRange": ["ECbZbygy"]}], "Namespace": "oarORoeN", "RedirectUri": "HSb8Rh3k", "Secret": "gs9qqJbn"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateClientByNamespace'
delete_file $TEMP_FILE

#- 14 DeleteClientByNamespace
java -jar ${JAR_PATH} iam deleteClientByNamespace \
    --clientId 'QsoBgiVp' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteClientByNamespace'
delete_file $TEMP_FILE

#- 15 CreateUser
java -jar ${JAR_PATH} iam createUser \
    --body '{"AuthType": "P8Cm3yvA", "Country": "SUoxdxxF", "DisplayName": "qmAGTJ8I", "LoginId": "EdagEtp4", "Password": "w29KOu9c", "PasswordMD5Sum": "19R6XDqW"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateUser'
delete_file $TEMP_FILE

#- 16 GetAdminUsersByRoleID
java -jar ${JAR_PATH} iam getAdminUsersByRoleID \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetAdminUsersByRoleID'
delete_file $TEMP_FILE

#- 17 GetUserByLoginID
java -jar ${JAR_PATH} iam getUserByLoginID \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserByLoginID'
delete_file $TEMP_FILE

#- 18 GetUserByPlatformUserID
java -jar ${JAR_PATH} iam getUserByPlatformUserID \
    --namespace "test" \
    --platformID 'HkkP8npL' \
    --platformUserID 'EKMfjiX7' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserByPlatformUserID'
delete_file $TEMP_FILE

#- 19 ForgotPassword
java -jar ${JAR_PATH} iam forgotPassword \
    --body '{"Context": "jpkVZk3I", "LanguageTag": "aQYEmqGo", "LoginID": "dOEGt9gP"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ForgotPassword'
delete_file $TEMP_FILE

#- 20 GetUsersByLoginIds
java -jar ${JAR_PATH} iam getUsersByLoginIds \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetUsersByLoginIds'
delete_file $TEMP_FILE

#- 21 ResetPassword
java -jar ${JAR_PATH} iam resetPassword \
    --body '{"Code": "Oj0c6i0J", "LoginID": "kvIas73u", "NewPassword": "cYnFAJ3D"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ResetPassword'
delete_file $TEMP_FILE

#- 22 SearchUser
update_status 0 'SearchUser (skipped deprecated)'

#- 23 GetUserByUserID
java -jar ${JAR_PATH} iam getUserByUserID \
    --namespace "test" \
    --userId 'K5T4Eogg' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserByUserID'
delete_file $TEMP_FILE

#- 24 UpdateUser
java -jar ${JAR_PATH} iam updateUser \
    --body '{"Country": "0Y39UoYl", "DateOfBirth": "pv5bVAgt", "DisplayName": "sDhUTDUs", "LanguageTag": "cbQDjbTQ"}' \
    --namespace "test" \
    --userId 'uPMz2PTR' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateUser'
delete_file $TEMP_FILE

#- 25 DeleteUser
java -jar ${JAR_PATH} iam deleteUser \
    --namespace "test" \
    --userId 'lkyU89ZP' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteUser'
delete_file $TEMP_FILE

#- 26 BanUser
java -jar ${JAR_PATH} iam banUser \
    --body '{"ban": "Ow6zPFJ4", "comment": "2cwmzBBS", "endDate": "MNcoAAOj", "reason": "KNjfcYHm", "skipNotif": false}' \
    --namespace "test" \
    --userId 'YgBU1sqj' \
    >$TEMP_FILE 2>&1
update_status $? 'BanUser'
delete_file $TEMP_FILE

#- 27 GetUserBanHistory
java -jar ${JAR_PATH} iam getUserBanHistory \
    --namespace "test" \
    --userId 'yK0XH45P' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserBanHistory'
delete_file $TEMP_FILE

#- 28 DisableUserBan
java -jar ${JAR_PATH} iam disableUserBan \
    --banId 'aRSOFQBt' \
    --namespace "test" \
    --userId 'u23REZ8h' \
    >$TEMP_FILE 2>&1
update_status $? 'DisableUserBan'
delete_file $TEMP_FILE

#- 29 EnableUserBan
java -jar ${JAR_PATH} iam enableUserBan \
    --banId 'RVX7LGOv' \
    --namespace "test" \
    --userId 'DdYiQS9i' \
    >$TEMP_FILE 2>&1
update_status $? 'EnableUserBan'
delete_file $TEMP_FILE

#- 30 ListCrossNamespaceAccountLink
update_status 0 'ListCrossNamespaceAccountLink (skipped deprecated)'

#- 31 DisableUser
update_status 0 'DisableUser (skipped deprecated)'

#- 32 EnableUser
update_status 0 'EnableUser (skipped deprecated)'

#- 33 GetUserInformation
java -jar ${JAR_PATH} iam getUserInformation \
    --namespace "test" \
    --userId '7mV1C91p' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserInformation'
delete_file $TEMP_FILE

#- 34 DeleteUserInformation
java -jar ${JAR_PATH} iam deleteUserInformation \
    --namespace "test" \
    --userId 'jG9gpxL6' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteUserInformation'
delete_file $TEMP_FILE

#- 35 GetUserLoginHistories
java -jar ${JAR_PATH} iam getUserLoginHistories \
    --namespace "test" \
    --userId 'ycTQdvln' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserLoginHistories'
delete_file $TEMP_FILE

#- 36 UpdatePassword
update_status 0 'UpdatePassword (skipped deprecated)'

#- 37 SaveUserPermission
java -jar ${JAR_PATH} iam saveUserPermission \
    --body '{"Permissions": [{"Action": 74, "Resource": "AuSQWEXL", "SchedAction": 74, "SchedCron": "FE1YHo9m", "SchedRange": ["126ZWc8h"]}]}' \
    --namespace "test" \
    --userId 'HtWvbNYq' \
    >$TEMP_FILE 2>&1
update_status $? 'SaveUserPermission'
delete_file $TEMP_FILE

#- 38 AddUserPermission
java -jar ${JAR_PATH} iam addUserPermission \
    --body '{"SchedAction": 12, "SchedCron": "UqslArFP", "SchedRange": ["iHUIvaCv"]}' \
    --action '20' \
    --namespace "test" \
    --resource 'U9dBBpds' \
    --userId 'JLhsVyEx' \
    >$TEMP_FILE 2>&1
update_status $? 'AddUserPermission'
delete_file $TEMP_FILE

#- 39 DeleteUserPermission
java -jar ${JAR_PATH} iam deleteUserPermission \
    --action '35' \
    --namespace "test" \
    --resource 'kxoot0B7' \
    --userId 'WOfercZd' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteUserPermission'
delete_file $TEMP_FILE

#- 40 GetUserPlatformAccounts
java -jar ${JAR_PATH} iam getUserPlatformAccounts \
    --namespace "test" \
    --userId 'pMci37Ds' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserPlatformAccounts'
delete_file $TEMP_FILE

#- 41 GetUserMapping
java -jar ${JAR_PATH} iam getUserMapping \
    --namespace "test" \
    --targetNamespace '7YSfExaI' \
    --userId '3uzLteMb' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserMapping'
delete_file $TEMP_FILE

#- 42 GetUserJusticePlatformAccount
update_status 0 'GetUserJusticePlatformAccount (skipped deprecated)'

#- 43 PlatformLink
java -jar ${JAR_PATH} iam platformLink \
    --ticket 'FAlt4hr7' \
    --namespace "test" \
    --platformId 'HmOYiBA5' \
    --userId 'ltAOXmlG' \
    >$TEMP_FILE 2>&1
update_status $? 'PlatformLink'
delete_file $TEMP_FILE

#- 44 PlatformUnlink
java -jar ${JAR_PATH} iam platformUnlink \
    --namespace "test" \
    --platformId '6eh1dTdo' \
    --userId 'TFpBIcuC' \
    >$TEMP_FILE 2>&1
update_status $? 'PlatformUnlink'
delete_file $TEMP_FILE

#- 45 GetPublisherUser
java -jar ${JAR_PATH} iam getPublisherUser \
    --namespace "test" \
    --userId '1dQY93OJ' \
    >$TEMP_FILE 2>&1
update_status $? 'GetPublisherUser'
delete_file $TEMP_FILE

#- 46 SaveUserRoles
java -jar ${JAR_PATH} iam saveUserRoles \
    --body '["nJ6Te9vD"]' \
    --namespace "test" \
    --userId '8ldz7Hu8' \
    >$TEMP_FILE 2>&1
update_status $? 'SaveUserRoles'
delete_file $TEMP_FILE

#- 47 AddUserRole
java -jar ${JAR_PATH} iam addUserRole \
    --namespace "test" \
    --roleId 'AD79kdWu' \
    --userId 'nvizU0q1' \
    >$TEMP_FILE 2>&1
update_status $? 'AddUserRole'
delete_file $TEMP_FILE

#- 48 DeleteUserRole
java -jar ${JAR_PATH} iam deleteUserRole \
    --namespace "test" \
    --roleId 'pHyhhERo' \
    --userId 'GgdrysMi' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteUserRole'
delete_file $TEMP_FILE

#- 49 UpgradeHeadlessAccount
java -jar ${JAR_PATH} iam upgradeHeadlessAccount \
    --body '{"LoginID": "zBGSRdP2", "Password": "l7DNSZ8A"}' \
    --namespace "test" \
    --userId 'q0XiPLQX' \
    >$TEMP_FILE 2>&1
update_status $? 'UpgradeHeadlessAccount'
delete_file $TEMP_FILE

#- 50 UpgradeHeadlessAccountWithVerificationCode
java -jar ${JAR_PATH} iam upgradeHeadlessAccountWithVerificationCode \
    --body '{"Code": "Se07ZddO", "Password": "GTMlJjBw", "loginId": "j9HJHQKs"}' \
    --namespace "test" \
    --userId 'eEdSXRDS' \
    >$TEMP_FILE 2>&1
update_status $? 'UpgradeHeadlessAccountWithVerificationCode'
delete_file $TEMP_FILE

#- 51 UserVerification
java -jar ${JAR_PATH} iam userVerification \
    --body '{"Code": "vguauw1x", "ContactType": "T7eMwSl9", "LanguageTag": "MLH0NnTJ", "validateOnly": true}' \
    --namespace "test" \
    --userId 'lNzBvwJa' \
    >$TEMP_FILE 2>&1
update_status $? 'UserVerification'
delete_file $TEMP_FILE

#- 52 SendVerificationCode
java -jar ${JAR_PATH} iam sendVerificationCode \
    --body '{"Context": "Qa547Jll", "LanguageTag": "vA8RWSpa", "LoginID": "bUt7xk6Q"}' \
    --namespace "test" \
    --userId 'xyWhfqoW' \
    >$TEMP_FILE 2>&1
update_status $? 'SendVerificationCode'
delete_file $TEMP_FILE

#- 53 Authorization
java -jar ${JAR_PATH} iam authorization \
    --clientId 'fJw2o8oW' \
    --redirectUri 'UqvPCZ2H' \
    --responseType 'token' \
    >$TEMP_FILE 2>&1
update_status $? 'Authorization'
delete_file $TEMP_FILE

#- 54 GetJWKS
java -jar ${JAR_PATH} iam getJWKS \
    >$TEMP_FILE 2>&1
update_status $? 'GetJWKS'
delete_file $TEMP_FILE

#- 55 PlatformTokenRequestHandler
update_status 0 'PlatformTokenRequestHandler (skipped deprecated)'

#- 56 RevokeUser
java -jar ${JAR_PATH} iam revokeUser \
    --namespace "test" \
    --userId 'T7NXmWDl' \
    >$TEMP_FILE 2>&1
update_status $? 'RevokeUser'
delete_file $TEMP_FILE

#- 57 GetRevocationList
java -jar ${JAR_PATH} iam getRevocationList \
    >$TEMP_FILE 2>&1
update_status $? 'GetRevocationList'
delete_file $TEMP_FILE

#- 58 RevokeToken
update_status 0 'RevokeToken (skipped deprecated)'

#- 59 RevokeAUser
update_status 0 'RevokeAUser (skipped deprecated)'

#- 60 TokenGrant
java -jar ${JAR_PATH} iam tokenGrant \
    --grantType 'password' \
    >$TEMP_FILE 2>&1
update_status $? 'TokenGrant'
delete_file $TEMP_FILE

#- 61 VerifyToken
java -jar ${JAR_PATH} iam verifyToken \
    --token 'uNIdQJR5' \
    >$TEMP_FILE 2>&1
update_status $? 'VerifyToken'
delete_file $TEMP_FILE

#- 62 GetRoles
java -jar ${JAR_PATH} iam getRoles \
    >$TEMP_FILE 2>&1
update_status $? 'GetRoles'
delete_file $TEMP_FILE

#- 63 CreateRole
java -jar ${JAR_PATH} iam createRole \
    --body '{"AdminRole": false, "Managers": [{"DisplayName": "sNOlvkfw", "Namespace": "aSbnsuLC", "UserId": "gToxuVTe"}], "Members": [{"DisplayName": "kJgvg6h5", "Namespace": "HIpH0Dvi", "UserId": "plEk4vj3"}], "Permissions": [{"Action": 75, "Resource": "Dp4yqDt8", "SchedAction": 85, "SchedCron": "UZDpxlHa", "SchedRange": ["sinGcjrk"]}], "RoleName": "mRMttgjD"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateRole'
delete_file $TEMP_FILE

#- 64 GetRole
java -jar ${JAR_PATH} iam getRole \
    --roleId 'SaIVBmft' \
    >$TEMP_FILE 2>&1
update_status $? 'GetRole'
delete_file $TEMP_FILE

#- 65 UpdateRole
java -jar ${JAR_PATH} iam updateRole \
    --body '{"RoleName": "3Udg7p9P"}' \
    --roleId 'GmY2H5kX' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateRole'
delete_file $TEMP_FILE

#- 66 DeleteRole
java -jar ${JAR_PATH} iam deleteRole \
    --roleId '4MsisSX2' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteRole'
delete_file $TEMP_FILE

#- 67 GetRoleAdminStatus
java -jar ${JAR_PATH} iam getRoleAdminStatus \
    --roleId '8nARxWRp' \
    >$TEMP_FILE 2>&1
update_status $? 'GetRoleAdminStatus'
delete_file $TEMP_FILE

#- 68 SetRoleAsAdmin
java -jar ${JAR_PATH} iam setRoleAsAdmin \
    --roleId 'v5ou5xtv' \
    >$TEMP_FILE 2>&1
update_status $? 'SetRoleAsAdmin'
delete_file $TEMP_FILE

#- 69 RemoveRoleAdmin
java -jar ${JAR_PATH} iam removeRoleAdmin \
    --roleId 'd28OUfCt' \
    >$TEMP_FILE 2>&1
update_status $? 'RemoveRoleAdmin'
delete_file $TEMP_FILE

#- 70 GetRoleManagers
java -jar ${JAR_PATH} iam getRoleManagers \
    --roleId '8UJC5flN' \
    >$TEMP_FILE 2>&1
update_status $? 'GetRoleManagers'
delete_file $TEMP_FILE

#- 71 AddRoleManagers
java -jar ${JAR_PATH} iam addRoleManagers \
    --body '{"Managers": [{"DisplayName": "yj6HsTtX", "Namespace": "8P3llnaa", "UserId": "S9lqyygP"}]}' \
    --roleId 'cfkJIxfQ' \
    >$TEMP_FILE 2>&1
update_status $? 'AddRoleManagers'
delete_file $TEMP_FILE

#- 72 RemoveRoleManagers
java -jar ${JAR_PATH} iam removeRoleManagers \
    --body '{"Managers": [{"DisplayName": "Zza8kNVb", "Namespace": "DxVMq7HJ", "UserId": "k0F89xAc"}]}' \
    --roleId '3YVfaENt' \
    >$TEMP_FILE 2>&1
update_status $? 'RemoveRoleManagers'
delete_file $TEMP_FILE

#- 73 GetRoleMembers
java -jar ${JAR_PATH} iam getRoleMembers \
    --roleId 'rl0pTKZT' \
    >$TEMP_FILE 2>&1
update_status $? 'GetRoleMembers'
delete_file $TEMP_FILE

#- 74 AddRoleMembers
java -jar ${JAR_PATH} iam addRoleMembers \
    --body '{"Members": [{"DisplayName": "XqzHuBMY", "Namespace": "QSA2jz1Z", "UserId": "OpdOjSyM"}]}' \
    --roleId 'ddB41JuM' \
    >$TEMP_FILE 2>&1
update_status $? 'AddRoleMembers'
delete_file $TEMP_FILE

#- 75 RemoveRoleMembers
java -jar ${JAR_PATH} iam removeRoleMembers \
    --body '{"Members": [{"DisplayName": "f7RUyBHR", "Namespace": "j8IiRimR", "UserId": "llHT6Dc4"}]}' \
    --roleId '0vFFA6gp' \
    >$TEMP_FILE 2>&1
update_status $? 'RemoveRoleMembers'
delete_file $TEMP_FILE

#- 76 UpdateRolePermissions
java -jar ${JAR_PATH} iam updateRolePermissions \
    --body '{"Permissions": [{"Action": 93, "Resource": "7EW3x1dC", "SchedAction": 30, "SchedCron": "m55gOeqQ", "SchedRange": ["IqcJVKmB"]}]}' \
    --roleId 'M1J1IbuT' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateRolePermissions'
delete_file $TEMP_FILE

#- 77 AddRolePermission
java -jar ${JAR_PATH} iam addRolePermission \
    --body '{"SchedAction": 35, "SchedCron": "rkbmuT1w", "SchedRange": ["hOqmEnDX"]}' \
    --action '69' \
    --resource 'WrBPlSay' \
    --roleId '46mv71BA' \
    >$TEMP_FILE 2>&1
update_status $? 'AddRolePermission'
delete_file $TEMP_FILE

#- 78 DeleteRolePermission
java -jar ${JAR_PATH} iam deleteRolePermission \
    --action '53' \
    --resource 'OjtFJ2vm' \
    --roleId 'Tj7tT7TZ' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteRolePermission'
delete_file $TEMP_FILE

#- 79 AdminGetAgeRestrictionStatusV2
java -jar ${JAR_PATH} iam adminGetAgeRestrictionStatusV2 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetAgeRestrictionStatusV2'
delete_file $TEMP_FILE

#- 80 AdminUpdateAgeRestrictionConfigV2
java -jar ${JAR_PATH} iam adminUpdateAgeRestrictionConfigV2 \
    --body '{"AgeRestriction": 67, "Enable": true}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateAgeRestrictionConfigV2'
delete_file $TEMP_FILE

#- 81 GetListCountryAgeRestriction
java -jar ${JAR_PATH} iam getListCountryAgeRestriction \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetListCountryAgeRestriction'
delete_file $TEMP_FILE

#- 82 UpdateCountryAgeRestriction
java -jar ${JAR_PATH} iam updateCountryAgeRestriction \
    --body '{"AgeRestriction": 6}' \
    --countryCode 'CkIsZoAr' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateCountryAgeRestriction'
delete_file $TEMP_FILE

#- 83 AdminSearchUsersV2
java -jar ${JAR_PATH} iam adminSearchUsersV2 \
    --namespace "test" \
    --platformId 'WwPHcyFA' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminSearchUsersV2'
delete_file $TEMP_FILE

#- 84 AdminGetUserByUserIdV2
java -jar ${JAR_PATH} iam adminGetUserByUserIdV2 \
    --namespace "test" \
    --userId 'dAtYciLI' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserByUserIdV2'
delete_file $TEMP_FILE

#- 85 AdminUpdateUserV2
java -jar ${JAR_PATH} iam adminUpdateUserV2 \
    --body '{"Country": "gRwFRr0g", "DateOfBirth": "wB9tz3vp", "DisplayName": "99XVlV8r", "LanguageTag": "K3tE6n0s"}' \
    --namespace "test" \
    --userId 'mip1tw3L' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserV2'
delete_file $TEMP_FILE

#- 86 AdminBanUserV2
java -jar ${JAR_PATH} iam adminBanUserV2 \
    --body '{"ban": "7cUd9pqt", "comment": "v6JfPZwc", "endDate": "CVOXcVa8", "reason": "0TmCwtD2", "skipNotif": false}' \
    --namespace "test" \
    --userId 'AH01o6Nd' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminBanUserV2'
delete_file $TEMP_FILE

#- 87 AdminGetUserBanV2
java -jar ${JAR_PATH} iam adminGetUserBanV2 \
    --namespace "test" \
    --userId 'cBIgzrDy' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserBanV2'
delete_file $TEMP_FILE

#- 88 AdminDisableUserV2
java -jar ${JAR_PATH} iam adminDisableUserV2 \
    --body '{"Reason": "WpFBYGmm"}' \
    --namespace "test" \
    --userId 'BawMyoKy' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDisableUserV2'
delete_file $TEMP_FILE

#- 89 AdminEnableUserV2
java -jar ${JAR_PATH} iam adminEnableUserV2 \
    --namespace "test" \
    --userId 'NpdAasm8' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminEnableUserV2'
delete_file $TEMP_FILE

#- 90 AdminResetPasswordV2
java -jar ${JAR_PATH} iam adminResetPasswordV2 \
    --body '{"LanguageTag": "xwUfzOlQ", "NewPassword": "iZY4NbOQ", "OldPassword": "XJ7uOTzN"}' \
    --namespace "test" \
    --userId 'Mvuq2tNl' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminResetPasswordV2'
delete_file $TEMP_FILE

#- 91 AdminDeletePlatformLinkV2
java -jar ${JAR_PATH} iam adminDeletePlatformLinkV2 \
    --namespace "test" \
    --platformId '4CX4IjiK' \
    --userId '4DEUJRVK' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeletePlatformLinkV2'
delete_file $TEMP_FILE

#- 92 AdminPutUserRolesV2
java -jar ${JAR_PATH} iam adminPutUserRolesV2 \
    --body '["3l9Eb0R1"]' \
    --namespace "test" \
    --userId 'XRb0RH8v' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPutUserRolesV2'
delete_file $TEMP_FILE

#- 93 AdminCreateUserRolesV2
java -jar ${JAR_PATH} iam adminCreateUserRolesV2 \
    --body '["S1smeOln"]' \
    --namespace "test" \
    --userId 'grdTXCza' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateUserRolesV2'
delete_file $TEMP_FILE

#- 94 PublicGetCountryAgeRestriction
java -jar ${JAR_PATH} iam publicGetCountryAgeRestriction \
    --countryCode 'PBtkZMio' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetCountryAgeRestriction'
delete_file $TEMP_FILE

#- 95 PublicCreateUserV2
java -jar ${JAR_PATH} iam publicCreateUserV2 \
    --body '{"AuthType": "4wcyhloV", "Country": "S3rYp8Qt", "DisplayName": "cEmCEVc7", "LoginId": "5UfeypWj", "Password": "DNhzCL5s", "PasswordMD5Sum": "WS2qwO76"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCreateUserV2'
delete_file $TEMP_FILE

#- 96 PublicForgotPasswordV2
java -jar ${JAR_PATH} iam publicForgotPasswordV2 \
    --body '{"Context": "3iEklkzL", "LanguageTag": "m88LpLuY", "LoginID": "RO3C55yH"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicForgotPasswordV2'
delete_file $TEMP_FILE

#- 97 PublicResetPasswordV2
java -jar ${JAR_PATH} iam publicResetPasswordV2 \
    --body '{"Code": "pwK2Jaqe", "LoginID": "nDGn7a2N", "NewPassword": "UplWiLjq"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicResetPasswordV2'
delete_file $TEMP_FILE

#- 98 PublicGetUserByUserIDV2
java -jar ${JAR_PATH} iam publicGetUserByUserIDV2 \
    --namespace "test" \
    --userId '06n6a0rW' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserByUserIDV2'
delete_file $TEMP_FILE

#- 99 PublicUpdateUserV2
java -jar ${JAR_PATH} iam publicUpdateUserV2 \
    --body '{"Country": "8EfkpaXt", "DateOfBirth": "wYZJaQ4W", "DisplayName": "bwNmsFYe", "LanguageTag": "tjEurH8e"}' \
    --namespace "test" \
    --userId 'loJzNKtR' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdateUserV2'
delete_file $TEMP_FILE

#- 100 PublicGetUserBan
java -jar ${JAR_PATH} iam publicGetUserBan \
    --namespace "test" \
    --userId 'UaTz1ETd' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserBan'
delete_file $TEMP_FILE

#- 101 PublicUpdatePasswordV2
java -jar ${JAR_PATH} iam publicUpdatePasswordV2 \
    --body '{"LanguageTag": "smwzjkkn", "NewPassword": "9oiQl05g", "OldPassword": "7cO3ZMb6"}' \
    --namespace "test" \
    --userId 'Ojlo6DMN' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdatePasswordV2'
delete_file $TEMP_FILE

#- 102 GetListJusticePlatformAccounts
java -jar ${JAR_PATH} iam getListJusticePlatformAccounts \
    --namespace "test" \
    --userId 'pP2qMrTQ' \
    >$TEMP_FILE 2>&1
update_status $? 'GetListJusticePlatformAccounts'
delete_file $TEMP_FILE

#- 103 PublicPlatformLinkV2
java -jar ${JAR_PATH} iam publicPlatformLinkV2 \
    --ticket '1UpjfU6w' \
    --namespace "test" \
    --platformId 'Jhy1jOVk' \
    --userId 'kUlS7952' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicPlatformLinkV2'
delete_file $TEMP_FILE

#- 104 PublicDeletePlatformLinkV2
java -jar ${JAR_PATH} iam publicDeletePlatformLinkV2 \
    --namespace "test" \
    --platformId '7EZ25Ia8' \
    --userId 'uCeZFlLt' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicDeletePlatformLinkV2'
delete_file $TEMP_FILE

#- 105 AdminGetBansTypeV3
java -jar ${JAR_PATH} iam adminGetBansTypeV3 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetBansTypeV3'
delete_file $TEMP_FILE

#- 106 AdminGetListBanReasonV3
java -jar ${JAR_PATH} iam adminGetListBanReasonV3 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetListBanReasonV3'
delete_file $TEMP_FILE

#- 107 AdminGetInputValidations
java -jar ${JAR_PATH} iam adminGetInputValidations \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetInputValidations'
delete_file $TEMP_FILE

#- 108 AdminUpdateInputValidations
java -jar ${JAR_PATH} iam adminUpdateInputValidations \
    --body '[{"field": "EVpDAEbA", "validation": {"allowDigit": false, "allowLetter": true, "allowSpace": false, "allowUnicode": true, "description": [{"language": "0pDE5xRw", "message": ["h5b45ebp"]}], "isCustomRegex": false, "letterCase": "M7ScSs3U", "maxLength": 80, "maxRepeatingAlphaNum": 30, "maxRepeatingSpecialCharacter": 53, "minCharType": 44, "minLength": 68, "regex": "p9rRtn1P", "specialCharacterLocation": "cCxdbume", "specialCharacters": ["YgOdEBWR"]}}]' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateInputValidations'
delete_file $TEMP_FILE

#- 109 AdminResetInputValidations
java -jar ${JAR_PATH} iam adminResetInputValidations \
    --field 'QiW3KFfU' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminResetInputValidations'
delete_file $TEMP_FILE

#- 110 ListAdminsV3
java -jar ${JAR_PATH} iam listAdminsV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListAdminsV3'
delete_file $TEMP_FILE

#- 111 AdminGetAgeRestrictionStatusV3
java -jar ${JAR_PATH} iam adminGetAgeRestrictionStatusV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetAgeRestrictionStatusV3'
delete_file $TEMP_FILE

#- 112 AdminUpdateAgeRestrictionConfigV3
java -jar ${JAR_PATH} iam adminUpdateAgeRestrictionConfigV3 \
    --body '{"ageRestriction": 16, "enable": false}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateAgeRestrictionConfigV3'
delete_file $TEMP_FILE

#- 113 AdminGetListCountryAgeRestrictionV3
java -jar ${JAR_PATH} iam adminGetListCountryAgeRestrictionV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetListCountryAgeRestrictionV3'
delete_file $TEMP_FILE

#- 114 AdminUpdateCountryAgeRestrictionV3
java -jar ${JAR_PATH} iam adminUpdateCountryAgeRestrictionV3 \
    --body '{"ageRestriction": 67}' \
    --countryCode '4081gRB1' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateCountryAgeRestrictionV3'
delete_file $TEMP_FILE

#- 115 AdminGetBannedUsersV3
java -jar ${JAR_PATH} iam adminGetBannedUsersV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetBannedUsersV3'
delete_file $TEMP_FILE

#- 116 AdminGetBansTypeWithNamespaceV3
java -jar ${JAR_PATH} iam adminGetBansTypeWithNamespaceV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetBansTypeWithNamespaceV3'
delete_file $TEMP_FILE

#- 117 AdminGetClientsByNamespaceV3
java -jar ${JAR_PATH} iam adminGetClientsByNamespaceV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetClientsByNamespaceV3'
delete_file $TEMP_FILE

#- 118 AdminCreateClientV3
java -jar ${JAR_PATH} iam adminCreateClientV3 \
    --body '{"audiences": ["GyLfLg4R"], "baseUri": "YuEbgUDE", "clientId": "cJyIvsPw", "clientName": "Or0BmV5i", "clientPermissions": [{"action": 63, "resource": "vfwFjTSm", "schedAction": 69, "schedCron": "EqoLyLeU", "schedRange": ["GmomGX9s"]}], "deletable": true, "namespace": "8pqLfc5S", "oauthClientType": "wGnReUUL", "redirectUri": "DX4QUIbb", "secret": "5nh68Zny"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateClientV3'
delete_file $TEMP_FILE

#- 119 AdminGetClientsbyNamespacebyIDV3
java -jar ${JAR_PATH} iam adminGetClientsbyNamespacebyIDV3 \
    --clientId 'UtRvW9hN' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetClientsbyNamespacebyIDV3'
delete_file $TEMP_FILE

#- 120 AdminDeleteClientV3
java -jar ${JAR_PATH} iam adminDeleteClientV3 \
    --clientId 'BSFTtFrO' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteClientV3'
delete_file $TEMP_FILE

#- 121 AdminUpdateClientV3
java -jar ${JAR_PATH} iam adminUpdateClientV3 \
    --body '{"audiences": ["mjkFrFVA"], "baseUri": "8t0xF34X", "clientName": "pt6ZlTTi", "clientPermissions": [{"action": 4, "resource": "0kr2a0nI", "schedAction": 28, "schedCron": "o7UHCJK5", "schedRange": ["sp0aCvIq"]}], "deletable": false, "namespace": "HVYIlewL", "redirectUri": "RuHY83bG"}' \
    --clientId 'j0HTeeWX' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateClientV3'
delete_file $TEMP_FILE

#- 122 AdminUpdateClientPermissionV3
java -jar ${JAR_PATH} iam adminUpdateClientPermissionV3 \
    --body '{"permissions": [{"action": 23, "resource": "IcRidqct"}]}' \
    --clientId 'DpygY0ax' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateClientPermissionV3'
delete_file $TEMP_FILE

#- 123 AdminAddClientPermissionsV3
java -jar ${JAR_PATH} iam adminAddClientPermissionsV3 \
    --body '{"permissions": [{"action": 61, "resource": "D4MMO9Tw"}]}' \
    --clientId '2JH0qhWI' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddClientPermissionsV3'
delete_file $TEMP_FILE

#- 124 AdminDeleteClientPermissionV3
java -jar ${JAR_PATH} iam adminDeleteClientPermissionV3 \
    --action '45' \
    --clientId 'HWTgzJFR' \
    --namespace "test" \
    --resource 'Yw6t1IKZ' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteClientPermissionV3'
delete_file $TEMP_FILE

#- 125 RetrieveAllThirdPartyLoginPlatformCredentialV3
java -jar ${JAR_PATH} iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAllThirdPartyLoginPlatformCredentialV3'
delete_file $TEMP_FILE

#- 126 RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
java -jar ${JAR_PATH} iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAllActiveThirdPartyLoginPlatformCredentialV3'
delete_file $TEMP_FILE

#- 127 RetrieveAllSSOLoginPlatformCredentialV3
java -jar ${JAR_PATH} iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAllSSOLoginPlatformCredentialV3'
delete_file $TEMP_FILE

#- 128 RetrieveThirdPartyLoginPlatformCredentialV3
java -jar ${JAR_PATH} iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "test" \
    --platformId 'LO6V4Ode' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveThirdPartyLoginPlatformCredentialV3'
delete_file $TEMP_FILE

#- 129 AddThirdPartyLoginPlatformCredentialV3
java -jar ${JAR_PATH} iam addThirdPartyLoginPlatformCredentialV3 \
    --body '{"ACSURL": "46QmCidg", "AWSCognitoRegion": "dpP7RTC5", "AWSCognitoUserPool": "87lmUmBz", "AppId": "iPZBnpOf", "ClientId": "kllxfq0N", "Environment": "srSjw5Ho", "FederationMetadataURL": "g0blM1d5", "GenericOauthFlow": true, "IsActive": false, "Issuer": "zLINlEC0", "JWKSEndpoint": "OEsE3yzI", "KeyID": "sUP0Njlu", "OrganizationId": "OrGZTzsL", "PlatformName": "W7Fjfs9n", "RedirectUri": "IkcZ38fU", "Secret": "EanjKHbX", "TeamID": "fk1zxdzx", "TokenAuthenticationType": "g0UXcRyH", "TokenClaimsMapping": {"i3u8BzVW": "u1tOmhUt"}}' \
    --namespace "test" \
    --platformId 'CgcpvGrE' \
    >$TEMP_FILE 2>&1
update_status $? 'AddThirdPartyLoginPlatformCredentialV3'
delete_file $TEMP_FILE

#- 130 DeleteThirdPartyLoginPlatformCredentialV3
java -jar ${JAR_PATH} iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "test" \
    --platformId 'bcZUDExH' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteThirdPartyLoginPlatformCredentialV3'
delete_file $TEMP_FILE

#- 131 UpdateThirdPartyLoginPlatformCredentialV3
java -jar ${JAR_PATH} iam updateThirdPartyLoginPlatformCredentialV3 \
    --body '{"ACSURL": "1tayOGXI", "AWSCognitoRegion": "HzMRjMCt", "AWSCognitoUserPool": "OJsEijlr", "AppId": "bpyyEcQx", "ClientId": "VgJIjMZq", "Environment": "cWfMl6dq", "FederationMetadataURL": "rpD4tnc3", "GenericOauthFlow": true, "IsActive": false, "Issuer": "dtPfAJEo", "JWKSEndpoint": "mwenJvQ8", "KeyID": "grtQSv6E", "OrganizationId": "cALcMIPm", "PlatformName": "s5bT51M4", "RedirectUri": "yko8S0En", "Secret": "GLvGvfuS", "TeamID": "yCTyjj4m", "TokenAuthenticationType": "CaiuMGKO", "TokenClaimsMapping": {"F5GJJooS": "XUl3YU35"}}' \
    --namespace "test" \
    --platformId 'QHGpBABn' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateThirdPartyLoginPlatformCredentialV3'
delete_file $TEMP_FILE

#- 132 UpdateThirdPartyLoginPlatformDomainV3
java -jar ${JAR_PATH} iam updateThirdPartyLoginPlatformDomainV3 \
    --body '{"affectedClientIDs": ["OlxDznIC"], "assignedNamespaces": ["QVyqBg34"], "domain": "WTtDkn0r", "roleId": "tn6t0Yx4"}' \
    --namespace "test" \
    --platformId 'z12EaQ1r' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateThirdPartyLoginPlatformDomainV3'
delete_file $TEMP_FILE

#- 133 DeleteThirdPartyLoginPlatformDomainV3
java -jar ${JAR_PATH} iam deleteThirdPartyLoginPlatformDomainV3 \
    --body '{"domain": "UQYCNTiD"}' \
    --namespace "test" \
    --platformId 'X4jE3M2I' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteThirdPartyLoginPlatformDomainV3'
delete_file $TEMP_FILE

#- 134 RetrieveSSOLoginPlatformCredential
java -jar ${JAR_PATH} iam retrieveSSOLoginPlatformCredential \
    --namespace "test" \
    --platformId 'sTHu8QwN' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveSSOLoginPlatformCredential'
delete_file $TEMP_FILE

#- 135 AddSSOLoginPlatformCredential
java -jar ${JAR_PATH} iam addSSOLoginPlatformCredential \
    --body '{"acsUrl": "yOlXfIWd", "apiKey": "0mcq5T4S", "appId": "Uc7cWfCK", "federationMetadataUrl": "K6Dij1gF", "isActive": false, "redirectUri": "enEMySPf", "secret": "hxBenDiT", "ssoUrl": "iAqFYmFK"}' \
    --namespace "test" \
    --platformId 'jaELmmll' \
    >$TEMP_FILE 2>&1
update_status $? 'AddSSOLoginPlatformCredential'
delete_file $TEMP_FILE

#- 136 DeleteSSOLoginPlatformCredentialV3
java -jar ${JAR_PATH} iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "test" \
    --platformId '6oexId1O' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteSSOLoginPlatformCredentialV3'
delete_file $TEMP_FILE

#- 137 UpdateSSOPlatformCredential
java -jar ${JAR_PATH} iam updateSSOPlatformCredential \
    --body '{"acsUrl": "KGUN2Uzn", "apiKey": "d7uVa7t1", "appId": "4yvSYSV5", "federationMetadataUrl": "2bHifCIf", "isActive": true, "redirectUri": "suu6Pkam", "secret": "6tFSYFt4", "ssoUrl": "ZxA2PzZF"}' \
    --namespace "test" \
    --platformId 'RkBNlg6h' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateSSOPlatformCredential'
delete_file $TEMP_FILE

#- 138 AdminGetUserByPlatformUserIDV3
java -jar ${JAR_PATH} iam adminGetUserByPlatformUserIDV3 \
    --namespace "test" \
    --platformId 'n5qusKyZ' \
    --platformUserId 'AuV6uUvq' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserByPlatformUserIDV3'
delete_file $TEMP_FILE

#- 139 GetAdminUsersByRoleIdV3
java -jar ${JAR_PATH} iam getAdminUsersByRoleIdV3 \
    --namespace "test" \
    --roleId 'M0lV6UZM' \
    >$TEMP_FILE 2>&1
update_status $? 'GetAdminUsersByRoleIdV3'
delete_file $TEMP_FILE

#- 140 AdminGetUserByEmailAddressV3
java -jar ${JAR_PATH} iam adminGetUserByEmailAddressV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserByEmailAddressV3'
delete_file $TEMP_FILE

#- 141 AdminListUserIDByUserIDsV3
java -jar ${JAR_PATH} iam adminListUserIDByUserIDsV3 \
    --body '{"userIds": ["lEbxHNgJ"]}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminListUserIDByUserIDsV3'
delete_file $TEMP_FILE

#- 142 AdminInviteUserV3
java -jar ${JAR_PATH} iam adminInviteUserV3 \
    --body '{"emailAddresses": ["RiQExaun"], "isAdmin": false, "roles": ["dAqnHUz4"]}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminInviteUserV3'
delete_file $TEMP_FILE

#- 143 AdminListUsersV3
java -jar ${JAR_PATH} iam adminListUsersV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminListUsersV3'
delete_file $TEMP_FILE

#- 144 AdminSearchUserV3
java -jar ${JAR_PATH} iam adminSearchUserV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminSearchUserV3'
delete_file $TEMP_FILE

#- 145 AdminGetBulkUserByEmailAddressV3
java -jar ${JAR_PATH} iam adminGetBulkUserByEmailAddressV3 \
    --body '{"listEmailAddressRequest": ["4tx4O6ha"]}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetBulkUserByEmailAddressV3'
delete_file $TEMP_FILE

#- 146 AdminGetUserByUserIdV3
java -jar ${JAR_PATH} iam adminGetUserByUserIdV3 \
    --namespace "test" \
    --userId 'mPwNoi07' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserByUserIdV3'
delete_file $TEMP_FILE

#- 147 AdminUpdateUserV3
java -jar ${JAR_PATH} iam adminUpdateUserV3 \
    --body '{"country": "1ezDK56J", "dateOfBirth": "FIGe1IMU", "displayName": "CLcN0Dsa", "languageTag": "D5FyBsFe", "userName": "9OYEJVsY"}' \
    --namespace "test" \
    --userId 'ffmhyx6J' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserV3'
delete_file $TEMP_FILE

#- 148 AdminGetUserBanV3
java -jar ${JAR_PATH} iam adminGetUserBanV3 \
    --namespace "test" \
    --userId '25PrM4S3' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserBanV3'
delete_file $TEMP_FILE

#- 149 AdminBanUserV3
java -jar ${JAR_PATH} iam adminBanUserV3 \
    --body '{"ban": "cB8m17hE", "comment": "eLLgoaYt", "endDate": "h6zcf8eA", "reason": "45OMvObW", "skipNotif": false}' \
    --namespace "test" \
    --userId 'jo9LfGee' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminBanUserV3'
delete_file $TEMP_FILE

#- 150 AdminUpdateUserBanV3
java -jar ${JAR_PATH} iam adminUpdateUserBanV3 \
    --body '{"enabled": false, "skipNotif": false}' \
    --banId 'BGR6D1Zo' \
    --namespace "test" \
    --userId 'ZEZQkJ8D' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserBanV3'
delete_file $TEMP_FILE

#- 151 AdminSendVerificationCodeV3
java -jar ${JAR_PATH} iam adminSendVerificationCodeV3 \
    --body '{"context": "SqFnhdKv", "emailAddress": "jFCFbSFl", "languageTag": "EWoMPdgK"}' \
    --namespace "test" \
    --userId '5zn62mhn' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminSendVerificationCodeV3'
delete_file $TEMP_FILE

#- 152 AdminVerifyAccountV3
java -jar ${JAR_PATH} iam adminVerifyAccountV3 \
    --body '{"Code": "FSpCTlDN", "ContactType": "BOcygvv2", "LanguageTag": "LAgfBGVz", "validateOnly": false}' \
    --namespace "test" \
    --userId 'nbKYsB0g' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminVerifyAccountV3'
delete_file $TEMP_FILE

#- 153 GetUserVerificationCode
java -jar ${JAR_PATH} iam getUserVerificationCode \
    --namespace "test" \
    --userId 'qJ8VhYSi' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserVerificationCode'
delete_file $TEMP_FILE

#- 154 AdminGetUserDeletionStatusV3
java -jar ${JAR_PATH} iam adminGetUserDeletionStatusV3 \
    --namespace "test" \
    --userId 'kJl2p9rB' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserDeletionStatusV3'
delete_file $TEMP_FILE

#- 155 AdminUpdateUserDeletionStatusV3
java -jar ${JAR_PATH} iam adminUpdateUserDeletionStatusV3 \
    --body '{"enabled": true}' \
    --namespace "test" \
    --userId '8N5egapq' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserDeletionStatusV3'
delete_file $TEMP_FILE

#- 156 AdminUpgradeHeadlessAccountV3
java -jar ${JAR_PATH} iam adminUpgradeHeadlessAccountV3 \
    --body '{"code": "xDy4cLfN", "country": "jzzEZYA8", "dateOfBirth": "jIkMJb7c", "displayName": "Z2bPsaLL", "emailAddress": "pEBVEMk5", "password": "AsKaF2P4", "validateOnly": false}' \
    --namespace "test" \
    --userId 'XkI3zdiR' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpgradeHeadlessAccountV3'
delete_file $TEMP_FILE

#- 157 AdminDeleteUserInformationV3
java -jar ${JAR_PATH} iam adminDeleteUserInformationV3 \
    --namespace "test" \
    --userId 'iC5IbPit' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteUserInformationV3'
delete_file $TEMP_FILE

#- 158 AdminGetUserLoginHistoriesV3
java -jar ${JAR_PATH} iam adminGetUserLoginHistoriesV3 \
    --namespace "test" \
    --userId '71JWlYCo' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserLoginHistoriesV3'
delete_file $TEMP_FILE

#- 159 AdminUpdateUserPermissionV3
java -jar ${JAR_PATH} iam adminUpdateUserPermissionV3 \
    --body '{"Permissions": [{"Action": 16, "Resource": "4nDfPu5V", "SchedAction": 85, "SchedCron": "SYxEVOry", "SchedRange": ["VuZYmgUe"]}]}' \
    --namespace "test" \
    --userId 'EPB5AGPg' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserPermissionV3'
delete_file $TEMP_FILE

#- 160 AdminAddUserPermissionsV3
java -jar ${JAR_PATH} iam adminAddUserPermissionsV3 \
    --body '{"Permissions": [{"Action": 42, "Resource": "k0Zthaj0", "SchedAction": 60, "SchedCron": "BA4azRz0", "SchedRange": ["d56smobo"]}]}' \
    --namespace "test" \
    --userId 'r4p1PlgQ' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddUserPermissionsV3'
delete_file $TEMP_FILE

#- 161 AdminDeleteUserPermissionBulkV3
java -jar ${JAR_PATH} iam adminDeleteUserPermissionBulkV3 \
    --body '[{"Action": 55, "Resource": "9EcNGOeB"}]' \
    --namespace "test" \
    --userId 'RY6G5ae0' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteUserPermissionBulkV3'
delete_file $TEMP_FILE

#- 162 AdminDeleteUserPermissionV3
java -jar ${JAR_PATH} iam adminDeleteUserPermissionV3 \
    --action '7' \
    --namespace "test" \
    --resource 'eDLaZ8JC' \
    --userId 'vbeTfW0h' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteUserPermissionV3'
delete_file $TEMP_FILE

#- 163 AdminGetUserPlatformAccountsV3
java -jar ${JAR_PATH} iam adminGetUserPlatformAccountsV3 \
    --namespace "test" \
    --userId 'gzrabLJx' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserPlatformAccountsV3'
delete_file $TEMP_FILE

#- 164 AdminGetListJusticePlatformAccounts
java -jar ${JAR_PATH} iam adminGetListJusticePlatformAccounts \
    --namespace "test" \
    --userId 'EwJrEBmQ' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetListJusticePlatformAccounts'
delete_file $TEMP_FILE

#- 165 AdminCreateJusticeUser
java -jar ${JAR_PATH} iam adminCreateJusticeUser \
    --namespace "test" \
    --targetNamespace '64haNOzl' \
    --userId 'Gu68UYyu' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateJusticeUser'
delete_file $TEMP_FILE

#- 166 AdminLinkPlatformAccount
java -jar ${JAR_PATH} iam adminLinkPlatformAccount \
    --body '{"platformId": "pjdDetno", "platformUserId": "T0rfWtVP"}' \
    --namespace "test" \
    --userId 'wQfq6V92' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminLinkPlatformAccount'
delete_file $TEMP_FILE

#- 167 AdminPlatformUnlinkV3
java -jar ${JAR_PATH} iam adminPlatformUnlinkV3 \
    --body '{"platformNamespace": "gbfPouNd"}' \
    --namespace "test" \
    --platformId 'mP7fckVn' \
    --userId 'uDGvYIb1' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPlatformUnlinkV3'
delete_file $TEMP_FILE

#- 168 AdminPlatformLinkV3
java -jar ${JAR_PATH} iam adminPlatformLinkV3 \
    --ticket 'p5tcR5z8' \
    --namespace "test" \
    --platformId 'ZJLjSHca' \
    --userId 'R3X4tZmw' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPlatformLinkV3'
delete_file $TEMP_FILE

#- 169 AdminDeleteUserRolesV3
java -jar ${JAR_PATH} iam adminDeleteUserRolesV3 \
    --body '["r0QmOnsE"]' \
    --namespace "test" \
    --userId 'g49eXp0x' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteUserRolesV3'
delete_file $TEMP_FILE

#- 170 AdminSaveUserRoleV3
java -jar ${JAR_PATH} iam adminSaveUserRoleV3 \
    --body '[{"namespace": "QkZ2Jjuw", "roleId": "WWy0tU11"}]' \
    --namespace "test" \
    --userId 'PCeSrvej' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminSaveUserRoleV3'
delete_file $TEMP_FILE

#- 171 AdminAddUserRoleV3
java -jar ${JAR_PATH} iam adminAddUserRoleV3 \
    --namespace "test" \
    --roleId 'UKwVfF37' \
    --userId 'Vr7mkDzF' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddUserRoleV3'
delete_file $TEMP_FILE

#- 172 AdminDeleteUserRoleV3
java -jar ${JAR_PATH} iam adminDeleteUserRoleV3 \
    --namespace "test" \
    --roleId 'BI1VwhkV' \
    --userId 'SKDlNFOU' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteUserRoleV3'
delete_file $TEMP_FILE

#- 173 AdminUpdateUserStatusV3
java -jar ${JAR_PATH} iam adminUpdateUserStatusV3 \
    --body '{"enabled": true, "reason": "JsvTsqk9"}' \
    --namespace "test" \
    --userId 'hg4hj6nU' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserStatusV3'
delete_file $TEMP_FILE

#- 174 AdminVerifyUserWithoutVerificationCodeV3
java -jar ${JAR_PATH} iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "test" \
    --userId 'debW6Usk' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminVerifyUserWithoutVerificationCodeV3'
delete_file $TEMP_FILE

#- 175 AdminGetRolesV3
java -jar ${JAR_PATH} iam adminGetRolesV3 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetRolesV3'
delete_file $TEMP_FILE

#- 176 AdminCreateRoleV3
java -jar ${JAR_PATH} iam adminCreateRoleV3 \
    --body '{"adminRole": false, "deletable": false, "isWildcard": false, "managers": [{"displayName": "ZAk01f1K", "namespace": "xCtWADU2", "userId": "guN6U9w1"}], "members": [{"displayName": "3W1K9TZQ", "namespace": "4qRLEi5w", "userId": "owE36rfm"}], "permissions": [{"action": 76, "resource": "0CCs35TP", "schedAction": 92, "schedCron": "PLmsY8Wg", "schedRange": ["wSx1DI5G"]}], "roleName": "H9bv9ZTo"}' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateRoleV3'
delete_file $TEMP_FILE

#- 177 AdminGetRoleV3
java -jar ${JAR_PATH} iam adminGetRoleV3 \
    --roleId '2HpA6pzj' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetRoleV3'
delete_file $TEMP_FILE

#- 178 AdminDeleteRoleV3
java -jar ${JAR_PATH} iam adminDeleteRoleV3 \
    --roleId 'HpZO0E9i' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteRoleV3'
delete_file $TEMP_FILE

#- 179 AdminUpdateRoleV3
java -jar ${JAR_PATH} iam adminUpdateRoleV3 \
    --body '{"deletable": false, "isWildcard": false, "roleName": "Bae3GOgb"}' \
    --roleId 'Qrqra0Pt' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateRoleV3'
delete_file $TEMP_FILE

#- 180 AdminGetRoleAdminStatusV3
java -jar ${JAR_PATH} iam adminGetRoleAdminStatusV3 \
    --roleId 'kfvOpY2r' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetRoleAdminStatusV3'
delete_file $TEMP_FILE

#- 181 AdminUpdateAdminRoleStatusV3
java -jar ${JAR_PATH} iam adminUpdateAdminRoleStatusV3 \
    --roleId 'amp5lnBn' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateAdminRoleStatusV3'
delete_file $TEMP_FILE

#- 182 AdminRemoveRoleAdminV3
java -jar ${JAR_PATH} iam adminRemoveRoleAdminV3 \
    --roleId '6xmBkfMt' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRemoveRoleAdminV3'
delete_file $TEMP_FILE

#- 183 AdminGetRoleManagersV3
java -jar ${JAR_PATH} iam adminGetRoleManagersV3 \
    --roleId 'C66hFq0k' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetRoleManagersV3'
delete_file $TEMP_FILE

#- 184 AdminAddRoleManagersV3
java -jar ${JAR_PATH} iam adminAddRoleManagersV3 \
    --body '{"managers": [{"displayName": "POkORm2X", "namespace": "jlNEE5ec", "userId": "PzAmi0yS"}]}' \
    --roleId 'JHfPloP1' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddRoleManagersV3'
delete_file $TEMP_FILE

#- 185 AdminRemoveRoleManagersV3
java -jar ${JAR_PATH} iam adminRemoveRoleManagersV3 \
    --body '{"managers": [{"displayName": "XkYK4MgI", "namespace": "sDSFMPyM", "userId": "hyw1OLZP"}]}' \
    --roleId 'VwwxH4BI' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRemoveRoleManagersV3'
delete_file $TEMP_FILE

#- 186 AdminGetRoleMembersV3
java -jar ${JAR_PATH} iam adminGetRoleMembersV3 \
    --roleId 'DJuDoShM' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetRoleMembersV3'
delete_file $TEMP_FILE

#- 187 AdminAddRoleMembersV3
java -jar ${JAR_PATH} iam adminAddRoleMembersV3 \
    --body '{"members": [{"displayName": "Mftll8N0", "namespace": "VvChHz9u", "userId": "rmt7QWvE"}]}' \
    --roleId '8s6Uz8BR' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddRoleMembersV3'
delete_file $TEMP_FILE

#- 188 AdminRemoveRoleMembersV3
java -jar ${JAR_PATH} iam adminRemoveRoleMembersV3 \
    --body '{"members": [{"displayName": "uYWDTtL6", "namespace": "MTTRkCbb", "userId": "9S5Q1IVH"}]}' \
    --roleId 'GT88prRE' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRemoveRoleMembersV3'
delete_file $TEMP_FILE

#- 189 AdminUpdateRolePermissionsV3
java -jar ${JAR_PATH} iam adminUpdateRolePermissionsV3 \
    --body '{"permissions": [{"action": 54, "resource": "gYOWdHJ9", "schedAction": 70, "schedCron": "umohtU13", "schedRange": ["gf7TRigN"]}]}' \
    --roleId 'Zj5w5y3H' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateRolePermissionsV3'
delete_file $TEMP_FILE

#- 190 AdminAddRolePermissionsV3
java -jar ${JAR_PATH} iam adminAddRolePermissionsV3 \
    --body '{"permissions": [{"action": 25, "resource": "K8QVOa62", "schedAction": 9, "schedCron": "QZtbLLcF", "schedRange": ["671WLtv3"]}]}' \
    --roleId '8Hecczop' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddRolePermissionsV3'
delete_file $TEMP_FILE

#- 191 AdminDeleteRolePermissionsV3
java -jar ${JAR_PATH} iam adminDeleteRolePermissionsV3 \
    --body '["FmeRwpcJ"]' \
    --roleId 'BZyi3mLC' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteRolePermissionsV3'
delete_file $TEMP_FILE

#- 192 AdminDeleteRolePermissionV3
java -jar ${JAR_PATH} iam adminDeleteRolePermissionV3 \
    --action '72' \
    --resource 'zekiSzey' \
    --roleId 'olnOQt0j' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteRolePermissionV3'
delete_file $TEMP_FILE

#- 193 AdminGetMyUserV3
java -jar ${JAR_PATH} iam adminGetMyUserV3 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetMyUserV3'
delete_file $TEMP_FILE

#- 194 UserAuthenticationV3
java -jar ${JAR_PATH} iam userAuthenticationV3 \
    --password 'oVHgCytC' \
    --requestId '6lRG98Yx' \
    --userName 'nHbRdoTK' \
    >$TEMP_FILE 2>&1
update_status $? 'UserAuthenticationV3'
delete_file $TEMP_FILE

#- 195 GetCountryLocationV3
java -jar ${JAR_PATH} iam getCountryLocationV3 \
    >$TEMP_FILE 2>&1
update_status $? 'GetCountryLocationV3'
delete_file $TEMP_FILE

#- 196 Logout
java -jar ${JAR_PATH} iam logout \
    >$TEMP_FILE 2>&1
update_status $? 'Logout'
delete_file $TEMP_FILE

#- 197 AdminRetrieveUserThirdPartyPlatformTokenV3
java -jar ${JAR_PATH} iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "test" \
    --platformId 'KeuSjfZe' \
    --userId '9i1osghF' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRetrieveUserThirdPartyPlatformTokenV3'
delete_file $TEMP_FILE

#- 198 RevokeUserV3
java -jar ${JAR_PATH} iam revokeUserV3 \
    --namespace "test" \
    --userId '1hzi1Nl4' \
    >$TEMP_FILE 2>&1
update_status $? 'RevokeUserV3'
delete_file $TEMP_FILE

#- 199 AuthorizeV3
java -jar ${JAR_PATH} iam authorizeV3 \
    --clientId '7syJ5ibz' \
    --responseType 'code' \
    >$TEMP_FILE 2>&1
update_status $? 'AuthorizeV3'
delete_file $TEMP_FILE

#- 200 TokenIntrospectionV3
java -jar ${JAR_PATH} iam tokenIntrospectionV3 \
    --token 'CLIvWPVR' \
    >$TEMP_FILE 2>&1
update_status $? 'TokenIntrospectionV3'
delete_file $TEMP_FILE

#- 201 GetJWKSV3
java -jar ${JAR_PATH} iam getJWKSV3 \
    >$TEMP_FILE 2>&1
update_status $? 'GetJWKSV3'
delete_file $TEMP_FILE

#- 202 Change2faMethod
java -jar ${JAR_PATH} iam change2faMethod \
    --factor 'sdEqA61y' \
    --mfaToken 'TrMgsycT' \
    >$TEMP_FILE 2>&1
update_status $? 'Change2faMethod'
delete_file $TEMP_FILE

#- 203 Verify2faCode
java -jar ${JAR_PATH} iam verify2faCode \
    --code 'gmPzc20E' \
    --factor 'uO5dMqGD' \
    --mfaToken 'lSZPY07r' \
    --rememberDevice
    >$TEMP_FILE 2>&1
update_status $? 'Verify2faCode'
delete_file $TEMP_FILE

#- 204 RetrieveUserThirdPartyPlatformTokenV3
java -jar ${JAR_PATH} iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "test" \
    --platformId 'EVSjzHjL' \
    --userId '6ZbXjG6D' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveUserThirdPartyPlatformTokenV3'
delete_file $TEMP_FILE

#- 205 AuthCodeRequestV3
java -jar ${JAR_PATH} iam authCodeRequestV3 \
    --platformId 'Smpp3op8' \
    --requestId 'htaRLxtW' \
    >$TEMP_FILE 2>&1
update_status $? 'AuthCodeRequestV3'
delete_file $TEMP_FILE

#- 206 PlatformTokenGrantV3
java -jar ${JAR_PATH} iam platformTokenGrantV3 \
    --platformId '4PvFkEST' \
    >$TEMP_FILE 2>&1
update_status $? 'PlatformTokenGrantV3'
delete_file $TEMP_FILE

#- 207 GetRevocationListV3
java -jar ${JAR_PATH} iam getRevocationListV3 \
    >$TEMP_FILE 2>&1
update_status $? 'GetRevocationListV3'
delete_file $TEMP_FILE

#- 208 TokenRevocationV3
java -jar ${JAR_PATH} iam tokenRevocationV3 \
    --token 'ULat5F1L' \
    >$TEMP_FILE 2>&1
update_status $? 'TokenRevocationV3'
delete_file $TEMP_FILE

#- 209 TokenGrantV3
java -jar ${JAR_PATH} iam tokenGrantV3 \
    --grantType 'authorization_code' \
    >$TEMP_FILE 2>&1
update_status $? 'TokenGrantV3'
delete_file $TEMP_FILE

#- 210 PlatformAuthenticationV3
java -jar ${JAR_PATH} iam platformAuthenticationV3 \
    --platformId '7cR7q6PW' \
    --state 'hZmmKz41' \
    >$TEMP_FILE 2>&1
update_status $? 'PlatformAuthenticationV3'
delete_file $TEMP_FILE

#- 211 PublicGetInputValidations
java -jar ${JAR_PATH} iam publicGetInputValidations \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetInputValidations'
delete_file $TEMP_FILE

#- 212 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
java -jar ${JAR_PATH} iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3'
delete_file $TEMP_FILE

#- 213 PublicListUserIDByPlatformUserIDsV3
java -jar ${JAR_PATH} iam publicListUserIDByPlatformUserIDsV3 \
    --body '{"platformUserIds": ["i1Tp78Fi"]}' \
    --namespace "test" \
    --platformId 'pJHahViJ' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicListUserIDByPlatformUserIDsV3'
delete_file $TEMP_FILE

#- 214 PublicGetUserByPlatformUserIDV3
java -jar ${JAR_PATH} iam publicGetUserByPlatformUserIDV3 \
    --namespace "test" \
    --platformId 'vLYW0kdm' \
    --platformUserId 'lk2luqSO' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserByPlatformUserIDV3'
delete_file $TEMP_FILE

#- 215 PublicGetAsyncStatus
java -jar ${JAR_PATH} iam publicGetAsyncStatus \
    --namespace "test" \
    --requestId 'OA2VOZBo' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetAsyncStatus'
delete_file $TEMP_FILE

#- 216 PublicSearchUserV3
java -jar ${JAR_PATH} iam publicSearchUserV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicSearchUserV3'
delete_file $TEMP_FILE

#- 217 PublicCreateUserV3
java -jar ${JAR_PATH} iam publicCreateUserV3 \
    --body '{"PasswordMD5Sum": "NbB98PuS", "acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "kqFzPwSM", "policyId": "XT53bBuL", "policyVersionId": "38beOYDV"}], "authType": "uHZQ9LYt", "code": "6w23Wf8i", "country": "EQo72sH0", "dateOfBirth": "aRdcDlDy", "displayName": "GcsfIuI4", "emailAddress": "Dv5lEJpK", "password": "1AyRlzsr", "reachMinimumAge": true}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCreateUserV3'
delete_file $TEMP_FILE

#- 218 CheckUserAvailability
java -jar ${JAR_PATH} iam checkUserAvailability \
    --namespace "test" \
    --field 'FZivQOHG' \
    --query '6wVicNra' \
    >$TEMP_FILE 2>&1
update_status $? 'CheckUserAvailability'
delete_file $TEMP_FILE

#- 219 PublicBulkGetUsers
java -jar ${JAR_PATH} iam publicBulkGetUsers \
    --body '{"userIds": ["tsvvHLmI"]}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicBulkGetUsers'
delete_file $TEMP_FILE

#- 220 PublicSendRegistrationCode
java -jar ${JAR_PATH} iam publicSendRegistrationCode \
    --body '{"emailAddress": "ohfNISLX", "languageTag": "MDWDdm5F"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicSendRegistrationCode'
delete_file $TEMP_FILE

#- 221 PublicVerifyRegistrationCode
java -jar ${JAR_PATH} iam publicVerifyRegistrationCode \
    --body '{"code": "E4lliQMn", "emailAddress": "utJbpEo4"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicVerifyRegistrationCode'
delete_file $TEMP_FILE

#- 222 PublicForgotPasswordV3
java -jar ${JAR_PATH} iam publicForgotPasswordV3 \
    --body '{"emailAddress": "mUNHFtdm", "languageTag": "l2xNviWa"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicForgotPasswordV3'
delete_file $TEMP_FILE

#- 223 GetAdminInvitationV3
java -jar ${JAR_PATH} iam getAdminInvitationV3 \
    --invitationId 'cJc3Fm7Z' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetAdminInvitationV3'
delete_file $TEMP_FILE

#- 224 CreateUserFromInvitationV3
java -jar ${JAR_PATH} iam createUserFromInvitationV3 \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "uKgoCBqS", "policyId": "5uIdCbwC", "policyVersionId": "eeq9ouEd"}], "authType": "DtjOgsyp", "country": "Lkm2ZYew", "dateOfBirth": "5H7Zm0gn", "displayName": "Yyj6MXf9", "password": "G1ntyebv", "reachMinimumAge": false}' \
    --invitationId 'eHenAALK' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateUserFromInvitationV3'
delete_file $TEMP_FILE

#- 225 UpdateUserV3
java -jar ${JAR_PATH} iam updateUserV3 \
    --body '{"country": "t7EfxIH4", "dateOfBirth": "46oUnP2S", "displayName": "74unXwg0", "languageTag": "JKqVWW1r", "userName": "jK1epwkA"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateUserV3'
delete_file $TEMP_FILE

#- 226 PublicUpdateUserV3
java -jar ${JAR_PATH} iam publicUpdateUserV3 \
    --body '{"country": "vcsYvbgf", "dateOfBirth": "BVPpTa8Y", "displayName": "uq7TKiNX", "languageTag": "mz7eMrMD", "userName": "5TbaUxTC"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdateUserV3'
delete_file $TEMP_FILE

#- 227 PublicSendVerificationCodeV3
java -jar ${JAR_PATH} iam publicSendVerificationCodeV3 \
    --body '{"context": "Tng0xjtd", "emailAddress": "Brjs3Kiy", "languageTag": "kt2Ck2gO"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicSendVerificationCodeV3'
delete_file $TEMP_FILE

#- 228 PublicUserVerificationV3
java -jar ${JAR_PATH} iam publicUserVerificationV3 \
    --body '{"code": "lSatECZ2", "contactType": "UgwQLqDq", "languageTag": "YSxTPuVl", "validateOnly": true}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUserVerificationV3'
delete_file $TEMP_FILE

#- 229 PublicUpgradeHeadlessAccountV3
java -jar ${JAR_PATH} iam publicUpgradeHeadlessAccountV3 \
    --body '{"code": "qirdp3yx", "country": "nsETl1Sv", "dateOfBirth": "hQudsjIh", "displayName": "XdxiSoWp", "emailAddress": "nnxgX7BC", "password": "PMqzQIxi", "validateOnly": false}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpgradeHeadlessAccountV3'
delete_file $TEMP_FILE

#- 230 PublicVerifyHeadlessAccountV3
java -jar ${JAR_PATH} iam publicVerifyHeadlessAccountV3 \
    --body '{"emailAddress": "hpNYsHtd", "password": "B3IkjuaZ"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicVerifyHeadlessAccountV3'
delete_file $TEMP_FILE

#- 231 PublicUpdatePasswordV3
java -jar ${JAR_PATH} iam publicUpdatePasswordV3 \
    --body '{"languageTag": "qhJilrZk", "newPassword": "SSKgP5rx", "oldPassword": "CR77G9d5"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdatePasswordV3'
delete_file $TEMP_FILE

#- 232 PublicCreateJusticeUser
java -jar ${JAR_PATH} iam publicCreateJusticeUser \
    --namespace "test" \
    --targetNamespace 'CA1GORSb' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCreateJusticeUser'
delete_file $TEMP_FILE

#- 233 PublicPlatformLinkV3
java -jar ${JAR_PATH} iam publicPlatformLinkV3 \
    --ticket 'L9n0dbWD' \
    --namespace "test" \
    --platformId 'EupmdLQz' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicPlatformLinkV3'
delete_file $TEMP_FILE

#- 234 PublicPlatformUnlinkV3
java -jar ${JAR_PATH} iam publicPlatformUnlinkV3 \
    --body '{"platformNamespace": "PnNfBAcW"}' \
    --namespace "test" \
    --platformId 'ArbkCfdH' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicPlatformUnlinkV3'
delete_file $TEMP_FILE

#- 235 PublicWebLinkPlatform
java -jar ${JAR_PATH} iam publicWebLinkPlatform \
    --namespace "test" \
    --platformId 'IZb03otq' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicWebLinkPlatform'
delete_file $TEMP_FILE

#- 236 PublicWebLinkPlatformEstablish
java -jar ${JAR_PATH} iam publicWebLinkPlatformEstablish \
    --namespace "test" \
    --platformId 'mBuS9V2p' \
    --state 'CZ23UHmk' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicWebLinkPlatformEstablish'
delete_file $TEMP_FILE

#- 237 ResetPasswordV3
java -jar ${JAR_PATH} iam resetPasswordV3 \
    --body '{"code": "0lpJ4JLl", "emailAddress": "01qi7L2o", "newPassword": "DUoVRUb3"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ResetPasswordV3'
delete_file $TEMP_FILE

#- 238 PublicGetUserByUserIdV3
java -jar ${JAR_PATH} iam publicGetUserByUserIdV3 \
    --namespace "test" \
    --userId '9j22P4Sp' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserByUserIdV3'
delete_file $TEMP_FILE

#- 239 PublicGetUserBanHistoryV3
java -jar ${JAR_PATH} iam publicGetUserBanHistoryV3 \
    --namespace "test" \
    --userId '09cKmjRU' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserBanHistoryV3'
delete_file $TEMP_FILE

#- 240 PublicGetUserLoginHistoriesV3
java -jar ${JAR_PATH} iam publicGetUserLoginHistoriesV3 \
    --namespace "test" \
    --userId 'bZVBVS7O' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserLoginHistoriesV3'
delete_file $TEMP_FILE

#- 241 PublicGetUserPlatformAccountsV3
java -jar ${JAR_PATH} iam publicGetUserPlatformAccountsV3 \
    --namespace "test" \
    --userId 'K2Zrdcsc' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserPlatformAccountsV3'
delete_file $TEMP_FILE

#- 242 PublicLinkPlatformAccount
java -jar ${JAR_PATH} iam publicLinkPlatformAccount \
    --body '{"platformId": "kMekROWZ", "platformUserId": "2KUTqkK2"}' \
    --namespace "test" \
    --userId 'eFaGLoSm' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicLinkPlatformAccount'
delete_file $TEMP_FILE

#- 243 PublicValidateUserByUserIDAndPasswordV3
java -jar ${JAR_PATH} iam publicValidateUserByUserIDAndPasswordV3 \
    --password 'EEPbLywJ' \
    --namespace "test" \
    --userId 'syUie6fZ' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicValidateUserByUserIDAndPasswordV3'
delete_file $TEMP_FILE

#- 244 PublicGetRolesV3
java -jar ${JAR_PATH} iam publicGetRolesV3 \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetRolesV3'
delete_file $TEMP_FILE

#- 245 PublicGetRoleV3
java -jar ${JAR_PATH} iam publicGetRoleV3 \
    --roleId 'gLllUPsO' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetRoleV3'
delete_file $TEMP_FILE

#- 246 PublicGetMyUserV3
java -jar ${JAR_PATH} iam publicGetMyUserV3 \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetMyUserV3'
delete_file $TEMP_FILE

#- 247 PlatformAuthenticateSAMLV3Handler
java -jar ${JAR_PATH} iam platformAuthenticateSAMLV3Handler \
    --platformId '8lg46Si7' \
    --state '006vL2w4' \
    >$TEMP_FILE 2>&1
update_status $? 'PlatformAuthenticateSAMLV3Handler'
delete_file $TEMP_FILE

#- 248 LoginSSOClient
java -jar ${JAR_PATH} iam loginSSOClient \
    --platformId 'aajDAOx0' \
    >$TEMP_FILE 2>&1
update_status $? 'LoginSSOClient'
delete_file $TEMP_FILE

#- 249 LogoutSSOClient
java -jar ${JAR_PATH} iam logoutSSOClient \
    --platformId 'iJjYleak' \
    >$TEMP_FILE 2>&1
update_status $? 'LogoutSSOClient'
delete_file $TEMP_FILE

#- 250 AdminBulkCheckValidUserIDV4
java -jar ${JAR_PATH} iam adminBulkCheckValidUserIDV4 \
    --body '{"userIds": ["tqv2Wklj"]}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminBulkCheckValidUserIDV4'
delete_file $TEMP_FILE

#- 251 AdminUpdateUserV4
java -jar ${JAR_PATH} iam adminUpdateUserV4 \
    --body '{"country": "QuD5mnJO", "dateOfBirth": "NqHGq8mB", "displayName": "7mF2lMFc", "languageTag": "aghFXJIJ", "userName": "flRHFcsI"}' \
    --namespace "test" \
    --userId 'qCy4xDif' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserV4'
delete_file $TEMP_FILE

#- 252 AdminUpdateUserEmailAddressV4
java -jar ${JAR_PATH} iam adminUpdateUserEmailAddressV4 \
    --body '{"code": "SSQ5On2c", "emailAddress": "cEcl3xei"}' \
    --namespace "test" \
    --userId 'O4bwF5JO' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserEmailAddressV4'
delete_file $TEMP_FILE

#- 253 AdminDisableUserMFAV4
java -jar ${JAR_PATH} iam adminDisableUserMFAV4 \
    --namespace "test" \
    --userId 'jGoGxKM3' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDisableUserMFAV4'
delete_file $TEMP_FILE

#- 254 AdminListUserRolesV4
java -jar ${JAR_PATH} iam adminListUserRolesV4 \
    --namespace "test" \
    --userId 'qMce5tfL' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminListUserRolesV4'
delete_file $TEMP_FILE

#- 255 AdminUpdateUserRoleV4
java -jar ${JAR_PATH} iam adminUpdateUserRoleV4 \
    --body '{"assignedNamespaces": ["cpjFZMKC"], "roleId": "bp0pEbLC"}' \
    --namespace "test" \
    --userId 'LFpHxMYF' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserRoleV4'
delete_file $TEMP_FILE

#- 256 AdminAddUserRoleV4
java -jar ${JAR_PATH} iam adminAddUserRoleV4 \
    --body '{"assignedNamespaces": ["836075xE"], "roleId": "pzdnYtpj"}' \
    --namespace "test" \
    --userId 'a5ig2isQ' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddUserRoleV4'
delete_file $TEMP_FILE

#- 257 AdminRemoveUserRoleV4
java -jar ${JAR_PATH} iam adminRemoveUserRoleV4 \
    --body '{"assignedNamespaces": ["Zga6Vy76"], "roleId": "izPiQRjY"}' \
    --namespace "test" \
    --userId 'a8fv5fIt' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRemoveUserRoleV4'
delete_file $TEMP_FILE

#- 258 AdminGetRolesV4
java -jar ${JAR_PATH} iam adminGetRolesV4 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetRolesV4'
delete_file $TEMP_FILE

#- 259 AdminCreateRoleV4
java -jar ${JAR_PATH} iam adminCreateRoleV4 \
    --body '{"adminRole": true, "deletable": false, "isWildcard": false, "roleName": "hgkigW22"}' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateRoleV4'
delete_file $TEMP_FILE

#- 260 AdminGetRoleV4
java -jar ${JAR_PATH} iam adminGetRoleV4 \
    --roleId 'zXMWXfbc' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetRoleV4'
delete_file $TEMP_FILE

#- 261 AdminDeleteRoleV4
java -jar ${JAR_PATH} iam adminDeleteRoleV4 \
    --roleId 'M0GIALIb' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteRoleV4'
delete_file $TEMP_FILE

#- 262 AdminUpdateRoleV4
java -jar ${JAR_PATH} iam adminUpdateRoleV4 \
    --body '{"adminRole": true, "deletable": true, "isWildcard": false, "roleName": "BcLNT6iO"}' \
    --roleId 'QVYx5rW2' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateRoleV4'
delete_file $TEMP_FILE

#- 263 AdminUpdateRolePermissionsV4
java -jar ${JAR_PATH} iam adminUpdateRolePermissionsV4 \
    --body '{"permissions": [{"action": 13, "resource": "MsI1aYBi", "schedAction": 38, "schedCron": "Sn3UDeKj", "schedRange": ["97I4WYXL"]}]}' \
    --roleId 'qjN7ktOB' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateRolePermissionsV4'
delete_file $TEMP_FILE

#- 264 AdminAddRolePermissionsV4
java -jar ${JAR_PATH} iam adminAddRolePermissionsV4 \
    --body '{"permissions": [{"action": 91, "resource": "raBxWRTV", "schedAction": 41, "schedCron": "YEqGlKDw", "schedRange": ["TKXBrXiQ"]}]}' \
    --roleId 'cd9IW8ki' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddRolePermissionsV4'
delete_file $TEMP_FILE

#- 265 AdminDeleteRolePermissionsV4
java -jar ${JAR_PATH} iam adminDeleteRolePermissionsV4 \
    --body '["CKeQJWZB"]' \
    --roleId 'vcq1ETvW' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteRolePermissionsV4'
delete_file $TEMP_FILE

#- 266 AdminListAssignedUsersV4
java -jar ${JAR_PATH} iam adminListAssignedUsersV4 \
    --roleId 'BxYZJh7B' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminListAssignedUsersV4'
delete_file $TEMP_FILE

#- 267 AdminAssignUserToRoleV4
java -jar ${JAR_PATH} iam adminAssignUserToRoleV4 \
    --body '{"assignedNamespaces": ["8gbnSu9M"], "namespace": "2OxD2uda", "userId": "eYpCXYSM"}' \
    --roleId 'iy87CTqE' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAssignUserToRoleV4'
delete_file $TEMP_FILE

#- 268 AdminRevokeUserFromRoleV4
java -jar ${JAR_PATH} iam adminRevokeUserFromRoleV4 \
    --body '{"namespace": "QBg36my3", "userId": "sY2clrDc"}' \
    --roleId 'ain0cOVF' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRevokeUserFromRoleV4'
delete_file $TEMP_FILE

#- 269 AdminUpdateMyUserV4
java -jar ${JAR_PATH} iam adminUpdateMyUserV4 \
    --body '{"country": "1zHwDTI0", "dateOfBirth": "sJ1Q0kph", "displayName": "MTggSP2S", "languageTag": "LcuAP7vU", "userName": "971Czw2n"}' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateMyUserV4'
delete_file $TEMP_FILE

#- 270 AdminDisableMyAuthenticatorV4
java -jar ${JAR_PATH} iam adminDisableMyAuthenticatorV4 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDisableMyAuthenticatorV4'
delete_file $TEMP_FILE

#- 271 AdminEnableMyAuthenticatorV4
java -jar ${JAR_PATH} iam adminEnableMyAuthenticatorV4 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminEnableMyAuthenticatorV4'
delete_file $TEMP_FILE

#- 272 AdminGenerateMyAuthenticatorKeyV4
java -jar ${JAR_PATH} iam adminGenerateMyAuthenticatorKeyV4 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGenerateMyAuthenticatorKeyV4'
delete_file $TEMP_FILE

#- 273 AdminGetMyBackupCodesV4
java -jar ${JAR_PATH} iam adminGetMyBackupCodesV4 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetMyBackupCodesV4'
delete_file $TEMP_FILE

#- 274 AdminGenerateMyBackupCodesV4
java -jar ${JAR_PATH} iam adminGenerateMyBackupCodesV4 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGenerateMyBackupCodesV4'
delete_file $TEMP_FILE

#- 275 AdminDisableMyBackupCodesV4
java -jar ${JAR_PATH} iam adminDisableMyBackupCodesV4 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDisableMyBackupCodesV4'
delete_file $TEMP_FILE

#- 276 AdminDownloadMyBackupCodesV4
java -jar ${JAR_PATH} iam adminDownloadMyBackupCodesV4 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDownloadMyBackupCodesV4'
delete_file $TEMP_FILE

#- 277 AdminEnableMyBackupCodesV4
java -jar ${JAR_PATH} iam adminEnableMyBackupCodesV4 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminEnableMyBackupCodesV4'
delete_file $TEMP_FILE

#- 278 AdminGetMyEnabledFactorsV4
java -jar ${JAR_PATH} iam adminGetMyEnabledFactorsV4 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetMyEnabledFactorsV4'
delete_file $TEMP_FILE

#- 279 AdminMakeFactorMyDefaultV4
java -jar ${JAR_PATH} iam adminMakeFactorMyDefaultV4 \
    --factor 'bg8C7Mvy' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminMakeFactorMyDefaultV4'
delete_file $TEMP_FILE

#- 280 AdminInviteUserV4
java -jar ${JAR_PATH} iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["whu6MjOj"], "emailAddresses": ["uGzo1Fz4"], "isAdmin": true, "roleId": "U0aSn98N"}' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminInviteUserV4'
delete_file $TEMP_FILE

#- 281 PublicCreateTestUserV4
java -jar ${JAR_PATH} iam publicCreateTestUserV4 \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "OUA0z92R", "policyId": "aDe8ngT8", "policyVersionId": "LRQkMnG1"}], "authType": "LZyF2mdY", "country": "Y6ZMfuTY", "dateOfBirth": "TKsue48q", "displayName": "BEBNAV5B", "emailAddress": "Te6ec1zA", "password": "92URCLSG", "passwordMD5Sum": "PmRBZWun", "username": "HW7MYvr6", "verified": true}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCreateTestUserV4'
delete_file $TEMP_FILE

#- 282 PublicCreateUserV4
java -jar ${JAR_PATH} iam publicCreateUserV4 \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "epc92HA9", "policyId": "4eACdeyf", "policyVersionId": "UpgiPpf8"}], "authType": "nxKJ3dnm", "code": "tPwa64Y4", "country": "gPEKMhhu", "dateOfBirth": "9a6f3xJN", "displayName": "tUlKLlII", "emailAddress": "AeHbm5M6", "password": "LsY1VMuI", "passwordMD5Sum": "EcRls68M", "reachMinimumAge": true, "username": "epyyMz6z"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCreateUserV4'
delete_file $TEMP_FILE

#- 283 CreateUserFromInvitationV4
java -jar ${JAR_PATH} iam createUserFromInvitationV4 \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "R1pvTYYt", "policyId": "DOiEi4Ru", "policyVersionId": "EcHCSGhp"}], "authType": "OZQFlwOi", "country": "uKGDFgK4", "dateOfBirth": "9YuKnXks", "displayName": "0m8ANrcR", "password": "al7ta3fo", "reachMinimumAge": false, "username": "A3h4MMW3"}' \
    --invitationId 'AJ5zlsFB' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateUserFromInvitationV4'
delete_file $TEMP_FILE

#- 284 PublicUpdateUserV4
java -jar ${JAR_PATH} iam publicUpdateUserV4 \
    --body '{"country": "wjvLYvmg", "dateOfBirth": "6avudQFF", "displayName": "1CPNY9u2", "languageTag": "dVYdglOO", "userName": "oCeK0kPK"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdateUserV4'
delete_file $TEMP_FILE

#- 285 PublicUpdateUserEmailAddressV4
java -jar ${JAR_PATH} iam publicUpdateUserEmailAddressV4 \
    --body '{"code": "mBqVux3l", "emailAddress": "XcD8aert"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdateUserEmailAddressV4'
delete_file $TEMP_FILE

#- 286 PublicUpgradeHeadlessAccountWithVerificationCodeV4
java -jar ${JAR_PATH} iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --body '{"code": "AVCqs8XT", "country": "8xy3nJ06", "dateOfBirth": "KkseA0AR", "displayName": "j9ricfay", "emailAddress": "vnhi8MDd", "password": "Y4WLHoaU", "reachMinimumAge": false, "username": "YnQp5egd", "validateOnly": false}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpgradeHeadlessAccountWithVerificationCodeV4'
delete_file $TEMP_FILE

#- 287 PublicUpgradeHeadlessAccountV4
java -jar ${JAR_PATH} iam publicUpgradeHeadlessAccountV4 \
    --body '{"emailAddress": "VE8ImivN", "password": "tQxqWRKH", "username": "ohODoWOr"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpgradeHeadlessAccountV4'
delete_file $TEMP_FILE

#- 288 PublicDisableMyAuthenticatorV4
java -jar ${JAR_PATH} iam publicDisableMyAuthenticatorV4 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicDisableMyAuthenticatorV4'
delete_file $TEMP_FILE

#- 289 PublicEnableMyAuthenticatorV4
java -jar ${JAR_PATH} iam publicEnableMyAuthenticatorV4 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicEnableMyAuthenticatorV4'
delete_file $TEMP_FILE

#- 290 PublicGenerateMyAuthenticatorKeyV4
java -jar ${JAR_PATH} iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGenerateMyAuthenticatorKeyV4'
delete_file $TEMP_FILE

#- 291 PublicGetMyBackupCodesV4
java -jar ${JAR_PATH} iam publicGetMyBackupCodesV4 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetMyBackupCodesV4'
delete_file $TEMP_FILE

#- 292 PublicGenerateMyBackupCodesV4
java -jar ${JAR_PATH} iam publicGenerateMyBackupCodesV4 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGenerateMyBackupCodesV4'
delete_file $TEMP_FILE

#- 293 PublicDisableMyBackupCodesV4
java -jar ${JAR_PATH} iam publicDisableMyBackupCodesV4 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicDisableMyBackupCodesV4'
delete_file $TEMP_FILE

#- 294 PublicDownloadMyBackupCodesV4
java -jar ${JAR_PATH} iam publicDownloadMyBackupCodesV4 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicDownloadMyBackupCodesV4'
delete_file $TEMP_FILE

#- 295 PublicEnableMyBackupCodesV4
java -jar ${JAR_PATH} iam publicEnableMyBackupCodesV4 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicEnableMyBackupCodesV4'
delete_file $TEMP_FILE

#- 296 PublicRemoveTrustedDeviceV4
java -jar ${JAR_PATH} iam publicRemoveTrustedDeviceV4 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicRemoveTrustedDeviceV4'
delete_file $TEMP_FILE

#- 297 PublicGetMyEnabledFactorsV4
java -jar ${JAR_PATH} iam publicGetMyEnabledFactorsV4 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetMyEnabledFactorsV4'
delete_file $TEMP_FILE

#- 298 PublicMakeFactorMyDefaultV4
java -jar ${JAR_PATH} iam publicMakeFactorMyDefaultV4 \
    --factor '98kjBUas' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicMakeFactorMyDefaultV4'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT