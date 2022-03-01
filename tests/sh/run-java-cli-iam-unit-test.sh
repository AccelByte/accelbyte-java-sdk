#!/bin/bash

#Copyright (c) 2022 AccelByte Inc. All Rights Reserved
#This is licensed software from AccelByte Inc, for limitations
#and restrictions contact your company contract manager.

#Meta:
#- random seed: 256
#- template file: java-cli-unit-test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH="${MODULE_PATH:-../../samples/cli}"
JAR_PATH="${MODULE_PATH}/build/libs/cli.jar"
TEMP_FILE='file.tmp'

OPERATIONS_COUNT=270

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
    --body '{"Code": "vguauw1x", "ContactType": "T7eMwSl9", "LanguageTag": "MLH0NnTJ"}' \
    --namespace "test" \
    --userId '2ulNzBvw' \
    >$TEMP_FILE 2>&1
update_status $? 'UserVerification'
delete_file $TEMP_FILE

#- 52 SendVerificationCode
java -jar ${JAR_PATH} iam sendVerificationCode \
    --body '{"Context": "JaQa547J", "LanguageTag": "llvA8RWS", "LoginID": "pabUt7xk"}' \
    --namespace "test" \
    --userId '6QxyWhfq' \
    >$TEMP_FILE 2>&1
update_status $? 'SendVerificationCode'
delete_file $TEMP_FILE

#- 53 Authorization
java -jar ${JAR_PATH} iam authorization \
    --clientId 'oWfJw2o8' \
    --redirectUri 'oWUqvPCZ' \
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

#- 94 PublicCreateUserV2
java -jar ${JAR_PATH} iam publicCreateUserV2 \
    --body '{"AuthType": "PBtkZMio", "Country": "4wcyhloV", "DisplayName": "S3rYp8Qt", "LoginId": "cEmCEVc7", "Password": "5UfeypWj", "PasswordMD5Sum": "DNhzCL5s"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCreateUserV2'
delete_file $TEMP_FILE

#- 95 PublicForgotPasswordV2
java -jar ${JAR_PATH} iam publicForgotPasswordV2 \
    --body '{"Context": "WS2qwO76", "LanguageTag": "3iEklkzL", "LoginID": "m88LpLuY"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicForgotPasswordV2'
delete_file $TEMP_FILE

#- 96 PublicResetPasswordV2
java -jar ${JAR_PATH} iam publicResetPasswordV2 \
    --body '{"Code": "RO3C55yH", "LoginID": "pwK2Jaqe", "NewPassword": "nDGn7a2N"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicResetPasswordV2'
delete_file $TEMP_FILE

#- 97 PublicGetUserByUserIDV2
java -jar ${JAR_PATH} iam publicGetUserByUserIDV2 \
    --namespace "test" \
    --userId 'UplWiLjq' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserByUserIDV2'
delete_file $TEMP_FILE

#- 98 PublicUpdateUserV2
java -jar ${JAR_PATH} iam publicUpdateUserV2 \
    --body '{"Country": "06n6a0rW", "DateOfBirth": "8EfkpaXt", "DisplayName": "wYZJaQ4W", "LanguageTag": "bwNmsFYe"}' \
    --namespace "test" \
    --userId 'tjEurH8e' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdateUserV2'
delete_file $TEMP_FILE

#- 99 PublicGetUserBan
java -jar ${JAR_PATH} iam publicGetUserBan \
    --namespace "test" \
    --userId 'loJzNKtR' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserBan'
delete_file $TEMP_FILE

#- 100 PublicUpdatePasswordV2
java -jar ${JAR_PATH} iam publicUpdatePasswordV2 \
    --body '{"LanguageTag": "UaTz1ETd", "NewPassword": "smwzjkkn", "OldPassword": "9oiQl05g"}' \
    --namespace "test" \
    --userId '7cO3ZMb6' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdatePasswordV2'
delete_file $TEMP_FILE

#- 101 GetListJusticePlatformAccounts
java -jar ${JAR_PATH} iam getListJusticePlatformAccounts \
    --namespace "test" \
    --userId 'Ojlo6DMN' \
    >$TEMP_FILE 2>&1
update_status $? 'GetListJusticePlatformAccounts'
delete_file $TEMP_FILE

#- 102 PublicPlatformLinkV2
java -jar ${JAR_PATH} iam publicPlatformLinkV2 \
    --ticket 'pP2qMrTQ' \
    --namespace "test" \
    --platformId '1UpjfU6w' \
    --userId 'Jhy1jOVk' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicPlatformLinkV2'
delete_file $TEMP_FILE

#- 103 PublicDeletePlatformLinkV2
java -jar ${JAR_PATH} iam publicDeletePlatformLinkV2 \
    --namespace "test" \
    --platformId 'kUlS7952' \
    --userId '7EZ25Ia8' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicDeletePlatformLinkV2'
delete_file $TEMP_FILE

#- 104 AdminGetBansTypeV3
java -jar ${JAR_PATH} iam adminGetBansTypeV3 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetBansTypeV3'
delete_file $TEMP_FILE

#- 105 AdminGetListBanReasonV3
java -jar ${JAR_PATH} iam adminGetListBanReasonV3 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetListBanReasonV3'
delete_file $TEMP_FILE

#- 106 AdminGetInputValidations
java -jar ${JAR_PATH} iam adminGetInputValidations \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetInputValidations'
delete_file $TEMP_FILE

#- 107 AdminUpdateInputValidations
java -jar ${JAR_PATH} iam adminUpdateInputValidations \
    --body '[{"field": "uCeZFlLt", "validation": {"allowDigit": true, "allowLetter": false, "allowSpace": true, "allowUnicode": true, "description": [{"language": "EbA82jy7", "message": ["4lq0pDE5"]}], "isCustomRegex": true, "letterCase": "Rwh5b45e", "maxLength": 3, "maxRepeatingAlphaNum": 30, "maxRepeatingSpecialCharacter": 5, "minCharType": 77, "minLength": 88, "regex": "cSs3UOpA", "specialCharacterLocation": "wIp9rRtn", "specialCharacters": ["1PcCxdbu"]}}]' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateInputValidations'
delete_file $TEMP_FILE

#- 108 AdminResetInputValidations
java -jar ${JAR_PATH} iam adminResetInputValidations \
    --field 'meYgOdEB' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminResetInputValidations'
delete_file $TEMP_FILE

#- 109 ListAdminsV3
java -jar ${JAR_PATH} iam listAdminsV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListAdminsV3'
delete_file $TEMP_FILE

#- 110 AdminGetAgeRestrictionStatusV3
java -jar ${JAR_PATH} iam adminGetAgeRestrictionStatusV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetAgeRestrictionStatusV3'
delete_file $TEMP_FILE

#- 111 AdminUpdateAgeRestrictionConfigV3
java -jar ${JAR_PATH} iam adminUpdateAgeRestrictionConfigV3 \
    --body '{"ageRestriction": 96, "enable": false}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateAgeRestrictionConfigV3'
delete_file $TEMP_FILE

#- 112 AdminGetListCountryAgeRestrictionV3
java -jar ${JAR_PATH} iam adminGetListCountryAgeRestrictionV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetListCountryAgeRestrictionV3'
delete_file $TEMP_FILE

#- 113 AdminUpdateCountryAgeRestrictionV3
java -jar ${JAR_PATH} iam adminUpdateCountryAgeRestrictionV3 \
    --body '{"ageRestriction": 97}' \
    --countryCode '3KFfU8ic' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateCountryAgeRestrictionV3'
delete_file $TEMP_FILE

#- 114 AdminGetBannedUsersV3
java -jar ${JAR_PATH} iam adminGetBannedUsersV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetBannedUsersV3'
delete_file $TEMP_FILE

#- 115 AdminGetBansTypeWithNamespaceV3
java -jar ${JAR_PATH} iam adminGetBansTypeWithNamespaceV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetBansTypeWithNamespaceV3'
delete_file $TEMP_FILE

#- 116 AdminGetClientsByNamespaceV3
java -jar ${JAR_PATH} iam adminGetClientsByNamespaceV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetClientsByNamespaceV3'
delete_file $TEMP_FILE

#- 117 AdminCreateClientV3
java -jar ${JAR_PATH} iam adminCreateClientV3 \
    --body '{"audiences": ["H4081gRB"], "baseUri": "1GyLfLg4", "clientId": "RYuEbgUD", "clientName": "EcJyIvsP", "clientPermissions": [{"action": 44, "resource": "Or0BmV5i", "schedAction": 63, "schedCron": "vfwFjTSm", "schedRange": ["IEqoLyLe"]}], "namespace": "UGmomGX9", "oauthClientType": "sXTZ0v8p", "redirectUri": "qLfc5SwG", "secret": "nReUULDX"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateClientV3'
delete_file $TEMP_FILE

#- 118 AdminGetClientsbyNamespacebyIDV3
java -jar ${JAR_PATH} iam adminGetClientsbyNamespacebyIDV3 \
    --clientId '4QUIbb5n' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetClientsbyNamespacebyIDV3'
delete_file $TEMP_FILE

#- 119 AdminDeleteClientV3
java -jar ${JAR_PATH} iam adminDeleteClientV3 \
    --clientId 'h68ZnyUt' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteClientV3'
delete_file $TEMP_FILE

#- 120 AdminUpdateClientV3
java -jar ${JAR_PATH} iam adminUpdateClientV3 \
    --body '{"audiences": ["RvW9hNBS"], "baseUri": "FTtFrOmj", "clientName": "kFrFVA8t", "clientPermissions": [{"action": 47, "resource": "F34Xpt6Z", "schedAction": 23, "schedCron": "TTic0kr2", "schedRange": ["a0nI2oo7"]}], "namespace": "UHCJK5sp", "redirectUri": "0aCvIq3a"}' \
    --clientId 'HVYIlewL' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateClientV3'
delete_file $TEMP_FILE

#- 121 AdminUpdateClientPermissionV3
java -jar ${JAR_PATH} iam adminUpdateClientPermissionV3 \
    --body '{"permissions": [{"action": 86, "resource": "uHY83bGj"}]}' \
    --clientId '0HTeeWXl' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateClientPermissionV3'
delete_file $TEMP_FILE

#- 122 AdminAddClientPermissionsV3
java -jar ${JAR_PATH} iam adminAddClientPermissionsV3 \
    --body '{"permissions": [{"action": 69, "resource": "cRidqctD"}]}' \
    --clientId 'pygY0ax4' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddClientPermissionsV3'
delete_file $TEMP_FILE

#- 123 AdminDeleteClientPermissionV3
java -jar ${JAR_PATH} iam adminDeleteClientPermissionV3 \
    --action '61' \
    --clientId 'D4MMO9Tw' \
    --namespace "test" \
    --resource '2JH0qhWI' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteClientPermissionV3'
delete_file $TEMP_FILE

#- 124 RetrieveAllThirdPartyLoginPlatformCredentialV3
java -jar ${JAR_PATH} iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAllThirdPartyLoginPlatformCredentialV3'
delete_file $TEMP_FILE

#- 125 RetrieveAllActiveThirdPartyLoginPlatformCredentialV3
java -jar ${JAR_PATH} iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAllActiveThirdPartyLoginPlatformCredentialV3'
delete_file $TEMP_FILE

#- 126 RetrieveAllSSOLoginPlatformCredentialV3
java -jar ${JAR_PATH} iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAllSSOLoginPlatformCredentialV3'
delete_file $TEMP_FILE

#- 127 RetrieveThirdPartyLoginPlatformCredentialV3
java -jar ${JAR_PATH} iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace "test" \
    --platformId 'wHWTgzJF' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveThirdPartyLoginPlatformCredentialV3'
delete_file $TEMP_FILE

#- 128 AddThirdPartyLoginPlatformCredentialV3
java -jar ${JAR_PATH} iam addThirdPartyLoginPlatformCredentialV3 \
    --body '{"ACSURL": "RYw6t1IK", "AWSCognitoRegion": "ZLO6V4Od", "AWSCognitoUserPool": "e46QmCid", "AppId": "gdpP7RTC", "ClientId": "587lmUmB", "Environment": "ziPZBnpO", "FederationMetadataURL": "fkllxfq0", "IsActive": true, "KeyID": "rSjw5Hog", "OrganizationId": "0blM1d5M", "RedirectUri": "StYGczLI", "Secret": "NlEC0OEs", "TeamID": "E3yzIsUP"}' \
    --namespace "test" \
    --platformId '0NjluOrG' \
    >$TEMP_FILE 2>&1
update_status $? 'AddThirdPartyLoginPlatformCredentialV3'
delete_file $TEMP_FILE

#- 129 DeleteThirdPartyLoginPlatformCredentialV3
java -jar ${JAR_PATH} iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace "test" \
    --platformId 'ZTzsLW7F' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteThirdPartyLoginPlatformCredentialV3'
delete_file $TEMP_FILE

#- 130 UpdateThirdPartyLoginPlatformCredentialV3
java -jar ${JAR_PATH} iam updateThirdPartyLoginPlatformCredentialV3 \
    --body '{"ACSURL": "jfs9nIkc", "AWSCognitoRegion": "Z38fUEan", "AWSCognitoUserPool": "jKHbXfk1", "AppId": "zxdzxg0U", "ClientId": "XcRyHi3u", "Environment": "8BzVWu1t", "FederationMetadataURL": "OmhUtCgc", "IsActive": false, "KeyID": "vGrEbcZU", "OrganizationId": "DExH1tay", "RedirectUri": "OGXIHzMR", "Secret": "jMCtOJsE", "TeamID": "ijlrbpyy"}' \
    --namespace "test" \
    --platformId 'EcQxVgJI' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateThirdPartyLoginPlatformCredentialV3'
delete_file $TEMP_FILE

#- 131 UpdateThirdPartyLoginPlatformDomainV3
java -jar ${JAR_PATH} iam updateThirdPartyLoginPlatformDomainV3 \
    --body '{"affectedClientIDs": ["jMZqcWfM"], "assignedNamespaces": ["l6dqrpD4"], "domain": "tnc3ZRB3", "roleId": "IkdtPfAJ"}' \
    --namespace "test" \
    --platformId 'EomwenJv' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateThirdPartyLoginPlatformDomainV3'
delete_file $TEMP_FILE

#- 132 DeleteThirdPartyLoginPlatformDomainV3
java -jar ${JAR_PATH} iam deleteThirdPartyLoginPlatformDomainV3 \
    --body '{"domain": "Q8grtQSv"}' \
    --namespace "test" \
    --platformId '6EcALcMI' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteThirdPartyLoginPlatformDomainV3'
delete_file $TEMP_FILE

#- 133 RetrieveSSOLoginPlatformCredential
java -jar ${JAR_PATH} iam retrieveSSOLoginPlatformCredential \
    --namespace "test" \
    --platformId 'Pms5bT51' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveSSOLoginPlatformCredential'
delete_file $TEMP_FILE

#- 134 AddSSOLoginPlatformCredential
java -jar ${JAR_PATH} iam addSSOLoginPlatformCredential \
    --body '{"acsUrl": "M4yko8S0", "apiKey": "EnGLvGvf", "appId": "uSyCTyjj", "federationMetadataUrl": "4mCaiuMG", "isActive": true, "redirectUri": "5GJJooSX", "secret": "Ul3YU35Q", "ssoUrl": "HGpBABnO"}' \
    --namespace "test" \
    --platformId 'lxDznICQ' \
    >$TEMP_FILE 2>&1
update_status $? 'AddSSOLoginPlatformCredential'
delete_file $TEMP_FILE

#- 135 DeleteSSOLoginPlatformCredentialV3
java -jar ${JAR_PATH} iam deleteSSOLoginPlatformCredentialV3 \
    --namespace "test" \
    --platformId 'VyqBg34W' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteSSOLoginPlatformCredentialV3'
delete_file $TEMP_FILE

#- 136 UpdateSSOPlatformCredential
java -jar ${JAR_PATH} iam updateSSOPlatformCredential \
    --body '{"acsUrl": "TtDkn0rt", "apiKey": "n6t0Yx4z", "appId": "12EaQ1rU", "federationMetadataUrl": "QYCNTiDX", "isActive": false, "redirectUri": "E3M2IsTH", "secret": "u8QwNyOl", "ssoUrl": "XfIWd0mc"}' \
    --namespace "test" \
    --platformId 'q5T4SUc7' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateSSOPlatformCredential'
delete_file $TEMP_FILE

#- 137 AdminGetUserByPlatformUserIDV3
java -jar ${JAR_PATH} iam adminGetUserByPlatformUserIDV3 \
    --namespace "test" \
    --platformId 'cWfCKK6D' \
    --platformUserId 'ij1gFcen' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserByPlatformUserIDV3'
delete_file $TEMP_FILE

#- 138 GetAdminUsersByRoleIdV3
java -jar ${JAR_PATH} iam getAdminUsersByRoleIdV3 \
    --namespace "test" \
    --roleId 'EMySPfhx' \
    >$TEMP_FILE 2>&1
update_status $? 'GetAdminUsersByRoleIdV3'
delete_file $TEMP_FILE

#- 139 AdminGetUserByEmailAddressV3
java -jar ${JAR_PATH} iam adminGetUserByEmailAddressV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserByEmailAddressV3'
delete_file $TEMP_FILE

#- 140 AdminListUserIDByUserIDsV3
java -jar ${JAR_PATH} iam adminListUserIDByUserIDsV3 \
    --body '{"userIds": ["BenDiTiA"]}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminListUserIDByUserIDsV3'
delete_file $TEMP_FILE

#- 141 AdminInviteUserV3
java -jar ${JAR_PATH} iam adminInviteUserV3 \
    --body '{"emailAddresses": ["qFYmFKja"], "isAdmin": true, "roles": ["Lmmll6oe"]}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminInviteUserV3'
delete_file $TEMP_FILE

#- 142 AdminListUsersV3
java -jar ${JAR_PATH} iam adminListUsersV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminListUsersV3'
delete_file $TEMP_FILE

#- 143 AdminSearchUserV3
java -jar ${JAR_PATH} iam adminSearchUserV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminSearchUserV3'
delete_file $TEMP_FILE

#- 144 AdminGetBulkUserByEmailAddressV3
java -jar ${JAR_PATH} iam adminGetBulkUserByEmailAddressV3 \
    --body '{"listEmailAddressRequest": ["xId1OKGU"]}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetBulkUserByEmailAddressV3'
delete_file $TEMP_FILE

#- 145 AdminGetUserByUserIdV3
java -jar ${JAR_PATH} iam adminGetUserByUserIdV3 \
    --namespace "test" \
    --userId 'N2Uznd7u' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserByUserIdV3'
delete_file $TEMP_FILE

#- 146 AdminUpdateUserV3
java -jar ${JAR_PATH} iam adminUpdateUserV3 \
    --body '{"country": "Va7t14yv", "dateOfBirth": "SYSV52bH", "displayName": "ifCIf4ts", "languageTag": "uu6Pkam6", "userName": "tFSYFt4Z"}' \
    --namespace "test" \
    --userId 'xA2PzZFR' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserV3'
delete_file $TEMP_FILE

#- 147 AdminGetUserBanV3
java -jar ${JAR_PATH} iam adminGetUserBanV3 \
    --namespace "test" \
    --userId 'kBNlg6hn' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserBanV3'
delete_file $TEMP_FILE

#- 148 AdminBanUserV3
java -jar ${JAR_PATH} iam adminBanUserV3 \
    --body '{"ban": "5qusKyZA", "comment": "uV6uUvqM", "endDate": "0lV6UZMl", "reason": "EbxHNgJR", "skipNotif": false}' \
    --namespace "test" \
    --userId 'QExaunjd' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminBanUserV3'
delete_file $TEMP_FILE

#- 149 AdminUpdateUserBanV3
java -jar ${JAR_PATH} iam adminUpdateUserBanV3 \
    --body '{"enabled": true, "skipNotif": true}' \
    --banId 'nHUz44tx' \
    --namespace "test" \
    --userId '4O6hamPw' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserBanV3'
delete_file $TEMP_FILE

#- 150 AdminSendVerificationCodeV3
java -jar ${JAR_PATH} iam adminSendVerificationCodeV3 \
    --body '{"context": "Noi071ez", "emailAddress": "DK56JFIG", "languageTag": "e1IMUCLc"}' \
    --namespace "test" \
    --userId 'N0DsaD5F' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminSendVerificationCodeV3'
delete_file $TEMP_FILE

#- 151 AdminVerifyAccountV3
java -jar ${JAR_PATH} iam adminVerifyAccountV3 \
    --body '{"Code": "yBsFe9OY", "ContactType": "EJVsYffm", "LanguageTag": "hyx6J25P"}' \
    --namespace "test" \
    --userId 'rM4S3cB8' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminVerifyAccountV3'
delete_file $TEMP_FILE

#- 152 GetUserVerificationCode
java -jar ${JAR_PATH} iam getUserVerificationCode \
    --namespace "test" \
    --userId 'm17hEeLL' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserVerificationCode'
delete_file $TEMP_FILE

#- 153 AdminGetUserDeletionStatusV3
java -jar ${JAR_PATH} iam adminGetUserDeletionStatusV3 \
    --namespace "test" \
    --userId 'goaYth6z' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserDeletionStatusV3'
delete_file $TEMP_FILE

#- 154 AdminUpdateUserDeletionStatusV3
java -jar ${JAR_PATH} iam adminUpdateUserDeletionStatusV3 \
    --body '{"enabled": false}' \
    --namespace "test" \
    --userId 'f8eA45OM' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserDeletionStatusV3'
delete_file $TEMP_FILE

#- 155 AdminUpgradeHeadlessAccountV3
java -jar ${JAR_PATH} iam adminUpgradeHeadlessAccountV3 \
    --body '{"code": "vObWejo9", "country": "LfGeegJM", "dateOfBirth": "aBGR6D1Z", "displayName": "oZEZQkJ8", "emailAddress": "DSqFnhdK", "password": "vjFCFbSF"}' \
    --namespace "test" \
    --userId 'lEWoMPdg' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpgradeHeadlessAccountV3'
delete_file $TEMP_FILE

#- 156 AdminDeleteUserInformationV3
java -jar ${JAR_PATH} iam adminDeleteUserInformationV3 \
    --namespace "test" \
    --userId 'K5zn62mh' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteUserInformationV3'
delete_file $TEMP_FILE

#- 157 AdminGetUserLoginHistoriesV3
java -jar ${JAR_PATH} iam adminGetUserLoginHistoriesV3 \
    --namespace "test" \
    --userId 'nFSpCTlD' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserLoginHistoriesV3'
delete_file $TEMP_FILE

#- 158 AdminUpdateUserPermissionV3
java -jar ${JAR_PATH} iam adminUpdateUserPermissionV3 \
    --body '{"Permissions": [{"Action": 78, "Resource": "BOcygvv2", "SchedAction": 75, "SchedCron": "AgfBGVza", "SchedRange": ["nbKYsB0g"]}]}' \
    --namespace "test" \
    --userId 'qJ8VhYSi' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserPermissionV3'
delete_file $TEMP_FILE

#- 159 AdminAddUserPermissionsV3
java -jar ${JAR_PATH} iam adminAddUserPermissionsV3 \
    --body '{"Permissions": [{"Action": 21, "Resource": "Jl2p9rBx", "SchedAction": 79, "SchedCron": "5egapqxD", "SchedRange": ["y4cLfNjz"]}]}' \
    --namespace "test" \
    --userId 'zEZYA8jI' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddUserPermissionsV3'
delete_file $TEMP_FILE

#- 160 AdminDeleteUserPermissionBulkV3
java -jar ${JAR_PATH} iam adminDeleteUserPermissionBulkV3 \
    --body '[{"Action": 20, "Resource": "MJb7cZ2b"}]' \
    --namespace "test" \
    --userId 'PsaLLpEB' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteUserPermissionBulkV3'
delete_file $TEMP_FILE

#- 161 AdminDeleteUserPermissionV3
java -jar ${JAR_PATH} iam adminDeleteUserPermissionV3 \
    --action '95' \
    --namespace "test" \
    --resource 'EMk5AsKa' \
    --userId 'F2P44lXk' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteUserPermissionV3'
delete_file $TEMP_FILE

#- 162 AdminGetUserPlatformAccountsV3
java -jar ${JAR_PATH} iam adminGetUserPlatformAccountsV3 \
    --namespace "test" \
    --userId 'I3zdiRiC' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserPlatformAccountsV3'
delete_file $TEMP_FILE

#- 163 AdminGetListJusticePlatformAccounts
java -jar ${JAR_PATH} iam adminGetListJusticePlatformAccounts \
    --namespace "test" \
    --userId '5IbPit71' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetListJusticePlatformAccounts'
delete_file $TEMP_FILE

#- 164 AdminCreateJusticeUser
java -jar ${JAR_PATH} iam adminCreateJusticeUser \
    --namespace "test" \
    --targetNamespace 'JWlYCoi4' \
    --userId 'nDfPu5V6' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateJusticeUser'
delete_file $TEMP_FILE

#- 165 AdminLinkPlatformAccount
java -jar ${JAR_PATH} iam adminLinkPlatformAccount \
    --body '{"platformId": "QSYxEVOr", "platformUserId": "yVuZYmgU"}' \
    --namespace "test" \
    --userId 'eEPB5AGP' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminLinkPlatformAccount'
delete_file $TEMP_FILE

#- 166 AdminPlatformUnlinkV3
java -jar ${JAR_PATH} iam adminPlatformUnlinkV3 \
    --body '{"platformNamespace": "gvk0Ztha"}' \
    --namespace "test" \
    --platformId 'j0EBA4az' \
    --userId 'Rz0d56sm' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPlatformUnlinkV3'
delete_file $TEMP_FILE

#- 167 AdminPlatformLinkV3
java -jar ${JAR_PATH} iam adminPlatformLinkV3 \
    --ticket 'obor4p1P' \
    --namespace "test" \
    --platformId 'lgQB9EcN' \
    --userId 'GOeBRY6G' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminPlatformLinkV3'
delete_file $TEMP_FILE

#- 168 AdminDeleteUserRolesV3
java -jar ${JAR_PATH} iam adminDeleteUserRolesV3 \
    --body '["5ae07deD"]' \
    --namespace "test" \
    --userId 'LaZ8JCvb' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteUserRolesV3'
delete_file $TEMP_FILE

#- 169 AdminSaveUserRoleV3
java -jar ${JAR_PATH} iam adminSaveUserRoleV3 \
    --body '[{"namespace": "eTfW0hgz", "roleId": "rabLJxEw"}]' \
    --namespace "test" \
    --userId 'JrEBmQ64' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminSaveUserRoleV3'
delete_file $TEMP_FILE

#- 170 AdminAddUserRoleV3
java -jar ${JAR_PATH} iam adminAddUserRoleV3 \
    --namespace "test" \
    --roleId 'haNOzlGu' \
    --userId '68UYyupj' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddUserRoleV3'
delete_file $TEMP_FILE

#- 171 AdminDeleteUserRoleV3
java -jar ${JAR_PATH} iam adminDeleteUserRoleV3 \
    --namespace "test" \
    --roleId 'dDetnoT0' \
    --userId 'rfWtVPwQ' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteUserRoleV3'
delete_file $TEMP_FILE

#- 172 AdminUpdateUserStatusV3
java -jar ${JAR_PATH} iam adminUpdateUserStatusV3 \
    --body '{"enabled": false, "reason": "q6V92gbf"}' \
    --namespace "test" \
    --userId 'PouNdmP7' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserStatusV3'
delete_file $TEMP_FILE

#- 173 AdminVerifyUserWithoutVerificationCodeV3
java -jar ${JAR_PATH} iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace "test" \
    --userId 'fckVnuDG' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminVerifyUserWithoutVerificationCodeV3'
delete_file $TEMP_FILE

#- 174 AdminGetRolesV3
java -jar ${JAR_PATH} iam adminGetRolesV3 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetRolesV3'
delete_file $TEMP_FILE

#- 175 AdminCreateRoleV3
java -jar ${JAR_PATH} iam adminCreateRoleV3 \
    --body '{"adminRole": true, "isWildcard": false, "managers": [{"displayName": "1p5tcR5z", "namespace": "8ZJLjSHc", "userId": "aR3X4tZm"}], "members": [{"displayName": "wr0QmOns", "namespace": "Eg49eXp0", "userId": "xQkZ2Jju"}], "permissions": [{"action": 44, "resource": "WWy0tU11", "schedAction": 82, "schedCron": "CeSrvejU", "schedRange": ["KwVfF37V"]}], "roleName": "r7mkDzFB"}' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateRoleV3'
delete_file $TEMP_FILE

#- 176 AdminGetRoleV3
java -jar ${JAR_PATH} iam adminGetRoleV3 \
    --roleId 'I1VwhkVS' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetRoleV3'
delete_file $TEMP_FILE

#- 177 AdminDeleteRoleV3
java -jar ${JAR_PATH} iam adminDeleteRoleV3 \
    --roleId 'KDlNFOUH' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteRoleV3'
delete_file $TEMP_FILE

#- 178 AdminUpdateRoleV3
java -jar ${JAR_PATH} iam adminUpdateRoleV3 \
    --body '{"isWildcard": true, "roleName": "JsvTsqk9"}' \
    --roleId 'hg4hj6nU' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateRoleV3'
delete_file $TEMP_FILE

#- 179 AdminGetRoleAdminStatusV3
java -jar ${JAR_PATH} iam adminGetRoleAdminStatusV3 \
    --roleId 'debW6Usk' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetRoleAdminStatusV3'
delete_file $TEMP_FILE

#- 180 AdminUpdateAdminRoleStatusV3
java -jar ${JAR_PATH} iam adminUpdateAdminRoleStatusV3 \
    --roleId 'bPkkZAk0' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateAdminRoleStatusV3'
delete_file $TEMP_FILE

#- 181 AdminRemoveRoleAdminV3
java -jar ${JAR_PATH} iam adminRemoveRoleAdminV3 \
    --roleId '1f1KxCtW' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRemoveRoleAdminV3'
delete_file $TEMP_FILE

#- 182 AdminGetRoleManagersV3
java -jar ${JAR_PATH} iam adminGetRoleManagersV3 \
    --roleId 'ADU2guN6' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetRoleManagersV3'
delete_file $TEMP_FILE

#- 183 AdminAddRoleManagersV3
java -jar ${JAR_PATH} iam adminAddRoleManagersV3 \
    --body '{"managers": [{"displayName": "U9w13W1K", "namespace": "9TZQ4qRL", "userId": "Ei5wowE3"}]}' \
    --roleId '6rfmM0CC' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddRoleManagersV3'
delete_file $TEMP_FILE

#- 184 AdminRemoveRoleManagersV3
java -jar ${JAR_PATH} iam adminRemoveRoleManagersV3 \
    --body '{"managers": [{"displayName": "s35TPUPL", "namespace": "msY8WgwS", "userId": "x1DI5GH9"}]}' \
    --roleId 'bv9ZTo2H' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRemoveRoleManagersV3'
delete_file $TEMP_FILE

#- 185 AdminGetRoleMembersV3
java -jar ${JAR_PATH} iam adminGetRoleMembersV3 \
    --roleId 'pA6pzjHp' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetRoleMembersV3'
delete_file $TEMP_FILE

#- 186 AdminAddRoleMembersV3
java -jar ${JAR_PATH} iam adminAddRoleMembersV3 \
    --body '{"members": [{"displayName": "ZO0E9iLg", "namespace": "RPJK3nBa", "userId": "e3GOgbQr"}]}' \
    --roleId 'qra0Ptkf' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddRoleMembersV3'
delete_file $TEMP_FILE

#- 187 AdminRemoveRoleMembersV3
java -jar ${JAR_PATH} iam adminRemoveRoleMembersV3 \
    --body '{"members": [{"displayName": "vOpY2ram", "namespace": "p5lnBn6x", "userId": "mBkfMtC6"}]}' \
    --roleId '6hFq0kPO' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRemoveRoleMembersV3'
delete_file $TEMP_FILE

#- 188 AdminUpdateRolePermissionsV3
java -jar ${JAR_PATH} iam adminUpdateRolePermissionsV3 \
    --body '{"permissions": [{"action": 21, "resource": "ORm2XjlN", "schedAction": 60, "schedCron": "E5ecPzAm", "schedRange": ["i0ySJHfP"]}]}' \
    --roleId 'loP1XkYK' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateRolePermissionsV3'
delete_file $TEMP_FILE

#- 189 AdminAddRolePermissionsV3
java -jar ${JAR_PATH} iam adminAddRolePermissionsV3 \
    --body '{"permissions": [{"action": 76, "resource": "gIsDSFMP", "schedAction": 48, "schedCron": "Mhyw1OLZ", "schedRange": ["PVwwxH4B"]}]}' \
    --roleId 'IDJuDoSh' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddRolePermissionsV3'
delete_file $TEMP_FILE

#- 190 AdminDeleteRolePermissionsV3
java -jar ${JAR_PATH} iam adminDeleteRolePermissionsV3 \
    --body '["MMftll8N"]' \
    --roleId '0VvChHz9' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteRolePermissionsV3'
delete_file $TEMP_FILE

#- 191 AdminDeleteRolePermissionV3
java -jar ${JAR_PATH} iam adminDeleteRolePermissionV3 \
    --action '40' \
    --resource 'rmt7QWvE' \
    --roleId '8s6Uz8BR' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteRolePermissionV3'
delete_file $TEMP_FILE

#- 192 AdminGetMyUserV3
java -jar ${JAR_PATH} iam adminGetMyUserV3 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetMyUserV3'
delete_file $TEMP_FILE

#- 193 UserAuthenticationV3
java -jar ${JAR_PATH} iam userAuthenticationV3 \
    --password 'uYWDTtL6' \
    --requestId 'MTTRkCbb' \
    --userName '9S5Q1IVH' \
    >$TEMP_FILE 2>&1
update_status $? 'UserAuthenticationV3'
delete_file $TEMP_FILE

#- 194 GetCountryLocationV3
java -jar ${JAR_PATH} iam getCountryLocationV3 \
    >$TEMP_FILE 2>&1
update_status $? 'GetCountryLocationV3'
delete_file $TEMP_FILE

#- 195 Logout
java -jar ${JAR_PATH} iam logout \
    >$TEMP_FILE 2>&1
update_status $? 'Logout'
delete_file $TEMP_FILE

#- 196 AdminRetrieveUserThirdPartyPlatformTokenV3
java -jar ${JAR_PATH} iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace "test" \
    --platformId 'GT88prRE' \
    --userId 'BgYOWdHJ' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRetrieveUserThirdPartyPlatformTokenV3'
delete_file $TEMP_FILE

#- 197 RevokeUserV3
java -jar ${JAR_PATH} iam revokeUserV3 \
    --namespace "test" \
    --userId '9JumohtU' \
    >$TEMP_FILE 2>&1
update_status $? 'RevokeUserV3'
delete_file $TEMP_FILE

#- 198 AuthorizeV3
java -jar ${JAR_PATH} iam authorizeV3 \
    --clientId '13gf7TRi' \
    --responseType 'code' \
    >$TEMP_FILE 2>&1
update_status $? 'AuthorizeV3'
delete_file $TEMP_FILE

#- 199 TokenIntrospectionV3
java -jar ${JAR_PATH} iam tokenIntrospectionV3 \
    --token 'NZj5w5y3' \
    >$TEMP_FILE 2>&1
update_status $? 'TokenIntrospectionV3'
delete_file $TEMP_FILE

#- 200 GetJWKSV3
java -jar ${JAR_PATH} iam getJWKSV3 \
    >$TEMP_FILE 2>&1
update_status $? 'GetJWKSV3'
delete_file $TEMP_FILE

#- 201 RetrieveUserThirdPartyPlatformTokenV3
java -jar ${JAR_PATH} iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace "test" \
    --platformId 'HmK8QVOa' \
    --userId '62eQZtbL' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveUserThirdPartyPlatformTokenV3'
delete_file $TEMP_FILE

#- 202 AuthCodeRequestV3
java -jar ${JAR_PATH} iam authCodeRequestV3 \
    --platformId 'LcF671WL' \
    --requestId 'tv38Hecc' \
    >$TEMP_FILE 2>&1
update_status $? 'AuthCodeRequestV3'
delete_file $TEMP_FILE

#- 203 PlatformTokenGrantV3
java -jar ${JAR_PATH} iam platformTokenGrantV3 \
    --platformId 'zopFmeRw' \
    >$TEMP_FILE 2>&1
update_status $? 'PlatformTokenGrantV3'
delete_file $TEMP_FILE

#- 204 GetRevocationListV3
java -jar ${JAR_PATH} iam getRevocationListV3 \
    >$TEMP_FILE 2>&1
update_status $? 'GetRevocationListV3'
delete_file $TEMP_FILE

#- 205 TokenRevocationV3
java -jar ${JAR_PATH} iam tokenRevocationV3 \
    --token 'pcJBZyi3' \
    >$TEMP_FILE 2>&1
update_status $? 'TokenRevocationV3'
delete_file $TEMP_FILE

#- 206 TokenGrantV3
java -jar ${JAR_PATH} iam tokenGrantV3 \
    --grantType 'client_credentials' \
    >$TEMP_FILE 2>&1
update_status $? 'TokenGrantV3'
delete_file $TEMP_FILE

#- 207 PlatformAuthenticationV3
java -jar ${JAR_PATH} iam platformAuthenticationV3 \
    --platformId 'LC4Kzeki' \
    --state 'SzeyolnO' \
    >$TEMP_FILE 2>&1
update_status $? 'PlatformAuthenticationV3'
delete_file $TEMP_FILE

#- 208 PublicGetInputValidations
java -jar ${JAR_PATH} iam publicGetInputValidations \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetInputValidations'
delete_file $TEMP_FILE

#- 209 RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3
java -jar ${JAR_PATH} iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3'
delete_file $TEMP_FILE

#- 210 PublicListUserIDByPlatformUserIDsV3
java -jar ${JAR_PATH} iam publicListUserIDByPlatformUserIDsV3 \
    --body '{"platformUserIds": ["Qt0joVHg"]}' \
    --namespace "test" \
    --platformId 'CytC6lRG' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicListUserIDByPlatformUserIDsV3'
delete_file $TEMP_FILE

#- 211 PublicGetUserByPlatformUserIDV3
java -jar ${JAR_PATH} iam publicGetUserByPlatformUserIDV3 \
    --namespace "test" \
    --platformId '98YxnHbR' \
    --platformUserId 'doTKKeuS' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserByPlatformUserIDV3'
delete_file $TEMP_FILE

#- 212 PublicGetAsyncStatus
java -jar ${JAR_PATH} iam publicGetAsyncStatus \
    --namespace "test" \
    --requestId 'jfZe9i1o' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetAsyncStatus'
delete_file $TEMP_FILE

#- 213 PublicSearchUserV3
java -jar ${JAR_PATH} iam publicSearchUserV3 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicSearchUserV3'
delete_file $TEMP_FILE

#- 214 PublicCreateUserV3
java -jar ${JAR_PATH} iam publicCreateUserV3 \
    --body '{"PasswordMD5Sum": "sghF1hzi", "acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "47syJ5ib", "policyId": "zSHZeCLI", "policyVersionId": "vWPVRsdE"}], "authType": "qA61yTrM", "country": "gsycTgmP", "dateOfBirth": "zc20EuO5", "displayName": "dMqGDlSZ", "emailAddress": "PY07rEVS", "password": "jzHjL6Zb"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCreateUserV3'
delete_file $TEMP_FILE

#- 215 CheckUserAvailability
java -jar ${JAR_PATH} iam checkUserAvailability \
    --namespace "test" \
    --field 'XjG6DSmp' \
    --query 'p3op8hta' \
    >$TEMP_FILE 2>&1
update_status $? 'CheckUserAvailability'
delete_file $TEMP_FILE

#- 216 PublicBulkGetUsers
java -jar ${JAR_PATH} iam publicBulkGetUsers \
    --body '{"userIds": ["RLxtW4Pv"]}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicBulkGetUsers'
delete_file $TEMP_FILE

#- 217 PublicForgotPasswordV3
java -jar ${JAR_PATH} iam publicForgotPasswordV3 \
    --body '{"emailAddress": "FkESTULa", "languageTag": "t5F1Le7c"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicForgotPasswordV3'
delete_file $TEMP_FILE

#- 218 GetAdminInvitationV3
java -jar ${JAR_PATH} iam getAdminInvitationV3 \
    --invitationId 'R7q6PWhZ' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetAdminInvitationV3'
delete_file $TEMP_FILE

#- 219 CreateUserFromInvitationV3
java -jar ${JAR_PATH} iam createUserFromInvitationV3 \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "mKz41i1T", "policyId": "p78FipJH", "policyVersionId": "ahViJvLY"}], "authType": "W0kdmlk2", "country": "luqSOOA2", "dateOfBirth": "VOZBoNbB", "displayName": "98PuSGyk", "password": "qFzPwSMX"}' \
    --invitationId 'T53bBuL3' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateUserFromInvitationV3'
delete_file $TEMP_FILE

#- 220 UpdateUserV3
java -jar ${JAR_PATH} iam updateUserV3 \
    --body '{"country": "8beOYDVu", "dateOfBirth": "HZQ9LYt6", "displayName": "w23Wf8iE", "languageTag": "Qo72sH0a", "userName": "RdcDlDyG"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateUserV3'
delete_file $TEMP_FILE

#- 221 PublicUpdateUserV3
java -jar ${JAR_PATH} iam publicUpdateUserV3 \
    --body '{"country": "csfIuI4D", "dateOfBirth": "v5lEJpK1", "displayName": "AyRlzsrR", "languageTag": "XEFZivQO", "userName": "HG6wVicN"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdateUserV3'
delete_file $TEMP_FILE

#- 222 PublicSendVerificationCodeV3
java -jar ${JAR_PATH} iam publicSendVerificationCodeV3 \
    --body '{"context": "ratsvvHL", "emailAddress": "mIohfNIS", "languageTag": "LXMDWDdm"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicSendVerificationCodeV3'
delete_file $TEMP_FILE

#- 223 PublicUserVerificationV3
java -jar ${JAR_PATH} iam publicUserVerificationV3 \
    --body '{"code": "5FE4lliQ", "contactType": "MnutJbpE", "languageTag": "o4mUNHFt"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUserVerificationV3'
delete_file $TEMP_FILE

#- 224 PublicUpgradeHeadlessAccountV3
java -jar ${JAR_PATH} iam publicUpgradeHeadlessAccountV3 \
    --body '{"code": "dml2xNvi", "country": "WacJc3Fm", "dateOfBirth": "7Z548uuK", "displayName": "goCBqS5u", "emailAddress": "IdCbwCee", "password": "q9ouEdDt"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpgradeHeadlessAccountV3'
delete_file $TEMP_FILE

#- 225 PublicVerifyHeadlessAccountV3
java -jar ${JAR_PATH} iam publicVerifyHeadlessAccountV3 \
    --body '{"emailAddress": "jOgsypLk", "password": "m2ZYew5H"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicVerifyHeadlessAccountV3'
delete_file $TEMP_FILE

#- 226 PublicUpdatePasswordV3
java -jar ${JAR_PATH} iam publicUpdatePasswordV3 \
    --body '{"languageTag": "7Zm0gnYy", "newPassword": "j6MXf9G1", "oldPassword": "ntyebvoe"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdatePasswordV3'
delete_file $TEMP_FILE

#- 227 PublicCreateJusticeUser
java -jar ${JAR_PATH} iam publicCreateJusticeUser \
    --namespace "test" \
    --targetNamespace 'HenAALKt' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCreateJusticeUser'
delete_file $TEMP_FILE

#- 228 PublicPlatformLinkV3
java -jar ${JAR_PATH} iam publicPlatformLinkV3 \
    --ticket '7EfxIH44' \
    --namespace "test" \
    --platformId '6oUnP2S7' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicPlatformLinkV3'
delete_file $TEMP_FILE

#- 229 PublicPlatformUnlinkV3
java -jar ${JAR_PATH} iam publicPlatformUnlinkV3 \
    --body '{"platformNamespace": "4unXwg0J"}' \
    --namespace "test" \
    --platformId 'KqVWW1rj' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicPlatformUnlinkV3'
delete_file $TEMP_FILE

#- 230 PublicWebLinkPlatform
java -jar ${JAR_PATH} iam publicWebLinkPlatform \
    --namespace "test" \
    --platformId 'K1epwkAv' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicWebLinkPlatform'
delete_file $TEMP_FILE

#- 231 PublicWebLinkPlatformEstablish
java -jar ${JAR_PATH} iam publicWebLinkPlatformEstablish \
    --namespace "test" \
    --platformId 'csYvbgfB' \
    --state 'VPpTa8Yu' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicWebLinkPlatformEstablish'
delete_file $TEMP_FILE

#- 232 ResetPasswordV3
java -jar ${JAR_PATH} iam resetPasswordV3 \
    --body '{"code": "q7TKiNXm", "emailAddress": "z7eMrMD5", "newPassword": "TbaUxTCT"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ResetPasswordV3'
delete_file $TEMP_FILE

#- 233 PublicGetUserByUserIdV3
java -jar ${JAR_PATH} iam publicGetUserByUserIdV3 \
    --namespace "test" \
    --userId 'ng0xjtdB' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserByUserIdV3'
delete_file $TEMP_FILE

#- 234 PublicGetUserBanHistoryV3
java -jar ${JAR_PATH} iam publicGetUserBanHistoryV3 \
    --namespace "test" \
    --userId 'rjs3Kiyk' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserBanHistoryV3'
delete_file $TEMP_FILE

#- 235 PublicGetUserLoginHistoriesV3
java -jar ${JAR_PATH} iam publicGetUserLoginHistoriesV3 \
    --namespace "test" \
    --userId 't2Ck2gOl' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserLoginHistoriesV3'
delete_file $TEMP_FILE

#- 236 PublicGetUserPlatformAccountsV3
java -jar ${JAR_PATH} iam publicGetUserPlatformAccountsV3 \
    --namespace "test" \
    --userId 'SatECZ2U' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserPlatformAccountsV3'
delete_file $TEMP_FILE

#- 237 PublicLinkPlatformAccount
java -jar ${JAR_PATH} iam publicLinkPlatformAccount \
    --body '{"platformId": "gwQLqDqY", "platformUserId": "SxTPuVlB"}' \
    --namespace "test" \
    --userId 'qirdp3yx' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicLinkPlatformAccount'
delete_file $TEMP_FILE

#- 238 PublicValidateUserByUserIDAndPasswordV3
java -jar ${JAR_PATH} iam publicValidateUserByUserIDAndPasswordV3 \
    --password 'nsETl1Sv' \
    --namespace "test" \
    --userId 'hQudsjIh' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicValidateUserByUserIDAndPasswordV3'
delete_file $TEMP_FILE

#- 239 PublicGetRolesV3
java -jar ${JAR_PATH} iam publicGetRolesV3 \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetRolesV3'
delete_file $TEMP_FILE

#- 240 PublicGetRoleV3
java -jar ${JAR_PATH} iam publicGetRoleV3 \
    --roleId 'XdxiSoWp' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetRoleV3'
delete_file $TEMP_FILE

#- 241 PublicGetMyUserV3
java -jar ${JAR_PATH} iam publicGetMyUserV3 \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetMyUserV3'
delete_file $TEMP_FILE

#- 242 PlatformAuthenticateSAMLV3Handler
java -jar ${JAR_PATH} iam platformAuthenticateSAMLV3Handler \
    --platformId 'nnxgX7BC' \
    --state 'PMqzQIxi' \
    >$TEMP_FILE 2>&1
update_status $? 'PlatformAuthenticateSAMLV3Handler'
delete_file $TEMP_FILE

#- 243 LoginSSOClient
java -jar ${JAR_PATH} iam loginSSOClient \
    --platformId 'bhpNYsHt' \
    >$TEMP_FILE 2>&1
update_status $? 'LoginSSOClient'
delete_file $TEMP_FILE

#- 244 LogoutSSOClient
java -jar ${JAR_PATH} iam logoutSSOClient \
    --platformId 'dB3Ikjua' \
    >$TEMP_FILE 2>&1
update_status $? 'LogoutSSOClient'
delete_file $TEMP_FILE

#- 245 AdminUpdateUserV4
java -jar ${JAR_PATH} iam adminUpdateUserV4 \
    --body '{"country": "ZqhJilrZ", "dateOfBirth": "kSSKgP5r", "displayName": "xCR77G9d", "languageTag": "5CA1GORS", "userName": "bL9n0dbW"}' \
    --namespace "test" \
    --userId 'DEupmdLQ' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserV4'
delete_file $TEMP_FILE

#- 246 AdminUpdateUserEmailAddressV4
java -jar ${JAR_PATH} iam adminUpdateUserEmailAddressV4 \
    --body '{"code": "zPnNfBAc", "emailAddress": "WArbkCfd"}' \
    --namespace "test" \
    --userId 'HIZb03ot' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserEmailAddressV4'
delete_file $TEMP_FILE

#- 247 AdminListUserRolesV4
java -jar ${JAR_PATH} iam adminListUserRolesV4 \
    --namespace "test" \
    --userId 'qmBuS9V2' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminListUserRolesV4'
delete_file $TEMP_FILE

#- 248 AdminUpdateUserRoleV4
java -jar ${JAR_PATH} iam adminUpdateUserRoleV4 \
    --body '{"assignedNamespaces": ["pCZ23UHm"], "roleId": "k0lpJ4JL"}' \
    --namespace "test" \
    --userId 'l01qi7L2' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateUserRoleV4'
delete_file $TEMP_FILE

#- 249 AdminAddUserRoleV4
java -jar ${JAR_PATH} iam adminAddUserRoleV4 \
    --body '{"assignedNamespaces": ["oDUoVRUb"], "roleId": "39j22P4S"}' \
    --namespace "test" \
    --userId 'p09cKmjR' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddUserRoleV4'
delete_file $TEMP_FILE

#- 250 AdminRemoveUserRoleV4
java -jar ${JAR_PATH} iam adminRemoveUserRoleV4 \
    --body '{"assignedNamespaces": ["UbZVBVS7"], "roleId": "OK2Zrdcs"}' \
    --namespace "test" \
    --userId 'ckMekROW' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRemoveUserRoleV4'
delete_file $TEMP_FILE

#- 251 AdminGetRolesV4
java -jar ${JAR_PATH} iam adminGetRolesV4 \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetRolesV4'
delete_file $TEMP_FILE

#- 252 AdminCreateRoleV4
java -jar ${JAR_PATH} iam adminCreateRoleV4 \
    --body '{"adminRole": true, "isWildcard": false, "roleName": "K2eFaGLo"}' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminCreateRoleV4'
delete_file $TEMP_FILE

#- 253 AdminGetRoleV4
java -jar ${JAR_PATH} iam adminGetRoleV4 \
    --roleId 'SmEEPbLy' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetRoleV4'
delete_file $TEMP_FILE

#- 254 AdminDeleteRoleV4
java -jar ${JAR_PATH} iam adminDeleteRoleV4 \
    --roleId 'wJsyUie6' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteRoleV4'
delete_file $TEMP_FILE

#- 255 AdminUpdateRoleV4
java -jar ${JAR_PATH} iam adminUpdateRoleV4 \
    --body '{"adminRole": false, "isWildcard": false, "roleName": "LllUPsO8"}' \
    --roleId 'lg46Si70' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateRoleV4'
delete_file $TEMP_FILE

#- 256 AdminUpdateRolePermissionsV4
java -jar ${JAR_PATH} iam adminUpdateRolePermissionsV4 \
    --body '{"permissions": [{"action": 42, "resource": "L2w4aajD", "schedAction": 53, "schedCron": "Ox0iJjYl", "schedRange": ["eaktqv2W"]}]}' \
    --roleId 'kljQuD5m' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateRolePermissionsV4'
delete_file $TEMP_FILE

#- 257 AdminAddRolePermissionsV4
java -jar ${JAR_PATH} iam adminAddRolePermissionsV4 \
    --body '{"permissions": [{"action": 26, "resource": "JONqHGq8", "schedAction": 24, "schedCron": "B7mF2lMF", "schedRange": ["caghFXJI"]}]}' \
    --roleId 'JflRHFcs' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAddRolePermissionsV4'
delete_file $TEMP_FILE

#- 258 AdminDeleteRolePermissionsV4
java -jar ${JAR_PATH} iam adminDeleteRolePermissionsV4 \
    --body '["IqCy4xDi"]' \
    --roleId 'fSSQ5On2' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminDeleteRolePermissionsV4'
delete_file $TEMP_FILE

#- 259 AdminListAssignedUsersV4
java -jar ${JAR_PATH} iam adminListAssignedUsersV4 \
    --roleId 'ccEcl3xe' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminListAssignedUsersV4'
delete_file $TEMP_FILE

#- 260 AdminAssignUserToRoleV4
java -jar ${JAR_PATH} iam adminAssignUserToRoleV4 \
    --body '{"assignedNamespaces": ["iO4bwF5J"], "namespace": "OjGoGxKM", "userId": "3qMce5tf"}' \
    --roleId 'LcpjFZMK' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminAssignUserToRoleV4'
delete_file $TEMP_FILE

#- 261 AdminRevokeUserFromRoleV4
java -jar ${JAR_PATH} iam adminRevokeUserFromRoleV4 \
    --body '{"namespace": "Cbp0pEbL", "userId": "CLFpHxMY"}' \
    --roleId 'F836075x' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRevokeUserFromRoleV4'
delete_file $TEMP_FILE

#- 262 AdminUpdateMyUserV4
java -jar ${JAR_PATH} iam adminUpdateMyUserV4 \
    --body '{"country": "EpzdnYtp", "dateOfBirth": "ja5ig2is", "displayName": "QZga6Vy7", "languageTag": "6izPiQRj", "userName": "Ya8fv5fI"}' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminUpdateMyUserV4'
delete_file $TEMP_FILE

#- 263 AdminInviteUserV4
java -jar ${JAR_PATH} iam adminInviteUserV4 \
    --body '{"assignedNamespaces": ["t22tIZhj"], "emailAddresses": ["hgkigW22"], "isAdmin": true, "roleId": "XMWXfbcM"}' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminInviteUserV4'
delete_file $TEMP_FILE

#- 264 PublicCreateTestUserV4
java -jar ${JAR_PATH} iam publicCreateTestUserV4 \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "LIbFCQgB", "policyId": "cLNT6iOQ", "policyVersionId": "VYx5rW2g"}], "authType": "MsI1aYBi", "country": "tSn3UDeK", "dateOfBirth": "j97I4WYX", "displayName": "LqjN7ktO", "emailAddress": "BTraBxWR", "password": "TVuYEqGl", "passwordMD5Sum": "KDwTKXBr", "username": "XiQcd9IW", "verified": false}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCreateTestUserV4'
delete_file $TEMP_FILE

#- 265 PublicCreateUserV4
java -jar ${JAR_PATH} iam publicCreateUserV4 \
    --body '{"acceptedPolicies": [{"isAccepted": false, "localizedPolicyVersionId": "CKeQJWZB", "policyId": "vcq1ETvW", "policyVersionId": "BxYZJh7B"}], "authType": "8gbnSu9M", "country": "2OxD2uda", "dateOfBirth": "eYpCXYSM", "displayName": "iy87CTqE", "emailAddress": "QBg36my3", "password": "sY2clrDc", "passwordMD5Sum": "ain0cOVF", "username": "1zHwDTI0"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCreateUserV4'
delete_file $TEMP_FILE

#- 266 CreateUserFromInvitationV4
java -jar ${JAR_PATH} iam createUserFromInvitationV4 \
    --body '{"acceptedPolicies": [{"isAccepted": true, "localizedPolicyVersionId": "J1Q0kphM", "policyId": "TggSP2SL", "policyVersionId": "cuAP7vU9"}], "authType": "71Czw2nb", "country": "g8C7Mvyw", "dateOfBirth": "hu6MjOju", "displayName": "Gzo1Fz4t", "password": "U0aSn98N", "username": "8qOUA0z9"}' \
    --invitationId '2RaDe8ng' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateUserFromInvitationV4'
delete_file $TEMP_FILE

#- 267 PublicUpdateUserV4
java -jar ${JAR_PATH} iam publicUpdateUserV4 \
    --body '{"country": "T8LRQkMn", "dateOfBirth": "G1LZyF2m", "displayName": "dYY6ZMfu", "languageTag": "TYTKsue4", "userName": "8qBEBNAV"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdateUserV4'
delete_file $TEMP_FILE

#- 268 PublicUpdateUserEmailAddressV4
java -jar ${JAR_PATH} iam publicUpdateUserEmailAddressV4 \
    --body '{"code": "5BTe6ec1", "emailAddress": "zA92URCL"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdateUserEmailAddressV4'
delete_file $TEMP_FILE

#- 269 PublicUpgradeHeadlessAccountWithVerificationCodeV4
java -jar ${JAR_PATH} iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --body '{"code": "SGPmRBZW", "country": "unHW7MYv", "dateOfBirth": "r6QA7Ppe", "displayName": "pc92HA94", "emailAddress": "eACdeyfU", "password": "pgiPpf8n", "username": "xKJ3dnmt"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpgradeHeadlessAccountWithVerificationCodeV4'
delete_file $TEMP_FILE

#- 270 PublicUpgradeHeadlessAccountV4
java -jar ${JAR_PATH} iam publicUpgradeHeadlessAccountV4 \
    --body '{"emailAddress": "Pwa64Y4g", "password": "PEKMhhu9", "username": "a6f3xJNt"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpgradeHeadlessAccountV4'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT