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

OPERATIONS_COUNT=44

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

#- 1 ListGroupConfigurationAdminV1
java -jar ${JAR_PATH} group listGroupConfigurationAdminV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'ListGroupConfigurationAdminV1'
delete_file $TEMP_FILE

#- 2 CreateGroupConfigurationAdminV1
java -jar ${JAR_PATH} group createGroupConfigurationAdminV1 \
    --body '{"configurationCode": "FtBxyZcD", "description": "XBpGlsQu", "globalRules": [{"allowedAction": "Ju8vMf0I", "ruleDetail": [{"ruleAttribute": "sJkTrd8I", "ruleCriteria": "MINIMUM", "ruleValue": 0.9953468146489199}]}], "groupAdminRoleId": "V2zXnTKj", "groupMaxMember": 99, "groupMemberRoleId": "Y1bPqami", "name": "Bxx9Cs18"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateGroupConfigurationAdminV1'
delete_file $TEMP_FILE

#- 3 InitiateGroupConfigurationAdminV1
java -jar ${JAR_PATH} group initiateGroupConfigurationAdminV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'InitiateGroupConfigurationAdminV1'
delete_file $TEMP_FILE

#- 4 GetGroupConfigurationAdminV1
java -jar ${JAR_PATH} group getGroupConfigurationAdminV1 \
    --configurationCode 'EY84ekIt' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetGroupConfigurationAdminV1'
delete_file $TEMP_FILE

#- 5 DeleteGroupConfigurationV1
java -jar ${JAR_PATH} group deleteGroupConfigurationV1 \
    --configurationCode 'qRzHU1oh' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteGroupConfigurationV1'
delete_file $TEMP_FILE

#- 6 UpdateGroupConfigurationAdminV1
java -jar ${JAR_PATH} group updateGroupConfigurationAdminV1 \
    --body '{"description": "570KQBVa", "groupMaxMember": 8, "name": "wc72krSh"}' \
    --configurationCode 'a68n3Yno' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateGroupConfigurationAdminV1'
delete_file $TEMP_FILE

#- 7 UpdateGroupConfigurationGlobalRuleAdminV1
java -jar ${JAR_PATH} group updateGroupConfigurationGlobalRuleAdminV1 \
    --body '{"ruleDetail": [{"ruleAttribute": "zp1C2KmI", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7164070183072041}]}' \
    --allowedAction 'BdNEUsxF' \
    --configurationCode 'b8CJ17M7' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateGroupConfigurationGlobalRuleAdminV1'
delete_file $TEMP_FILE

#- 8 DeleteGroupConfigurationGlobalRuleAdminV1
java -jar ${JAR_PATH} group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'DJZaMSxE' \
    --configurationCode 'CbZbygyo' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteGroupConfigurationGlobalRuleAdminV1'
delete_file $TEMP_FILE

#- 9 GetGroupListAdminV1
java -jar ${JAR_PATH} group getGroupListAdminV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetGroupListAdminV1'
delete_file $TEMP_FILE

#- 10 GetSingleGroupAdminV1
java -jar ${JAR_PATH} group getSingleGroupAdminV1 \
    --groupId 'arORoeNH' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetSingleGroupAdminV1'
delete_file $TEMP_FILE

#- 11 DeleteGroupAdminV1
java -jar ${JAR_PATH} group deleteGroupAdminV1 \
    --groupId 'Sb8Rh3kg' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteGroupAdminV1'
delete_file $TEMP_FILE

#- 12 GetGroupMembersListAdminV1
java -jar ${JAR_PATH} group getGroupMembersListAdminV1 \
    --groupId 's9qqJbnQ' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetGroupMembersListAdminV1'
delete_file $TEMP_FILE

#- 13 GetMemberRolesListAdminV1
java -jar ${JAR_PATH} group getMemberRolesListAdminV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetMemberRolesListAdminV1'
delete_file $TEMP_FILE

#- 14 CreateMemberRoleAdminV1
java -jar ${JAR_PATH} group createMemberRoleAdminV1 \
    --body '{"memberRoleName": "soBgiVpP", "memberRolePermissions": [{"action": 56, "resourceName": "m3yvASUo"}]}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateMemberRoleAdminV1'
delete_file $TEMP_FILE

#- 15 GetSingleMemberRoleAdminV1
java -jar ${JAR_PATH} group getSingleMemberRoleAdminV1 \
    --memberRoleId 'xdxxFqmA' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetSingleMemberRoleAdminV1'
delete_file $TEMP_FILE

#- 16 DeleteMemberRoleAdminV1
java -jar ${JAR_PATH} group deleteMemberRoleAdminV1 \
    --memberRoleId 'GTJ8IEda' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteMemberRoleAdminV1'
delete_file $TEMP_FILE

#- 17 UpdateMemberRoleAdminV1
java -jar ${JAR_PATH} group updateMemberRoleAdminV1 \
    --body '{"memberRoleName": "gEtp4w29"}' \
    --memberRoleId 'KOu9c19R' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateMemberRoleAdminV1'
delete_file $TEMP_FILE

#- 18 UpdateMemberRolePermissionAdminV1
java -jar ${JAR_PATH} group updateMemberRolePermissionAdminV1 \
    --body '{"memberRolePermissions": [{"action": 98, "resourceName": "DqWHkkP8"}]}' \
    --memberRoleId 'npLEKMfj' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateMemberRolePermissionAdminV1'
delete_file $TEMP_FILE

#- 19 GetGroupListPublicV1
java -jar ${JAR_PATH} group getGroupListPublicV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetGroupListPublicV1'
delete_file $TEMP_FILE

#- 20 CreateNewGroupPublicV1
java -jar ${JAR_PATH} group createNewGroupPublicV1 \
    --body '{"configurationCode": "iX7jpkVZ", "customAttributes": {"k3IaQYEm": {}}, "groupDescription": "qGodOEGt", "groupIcon": "9gPOj0c6", "groupMaxMember": 16, "groupName": "0JkvIas7", "groupRegion": "3ucYnFAJ", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "3DK5T4Eo", "ruleDetail": [{"ruleAttribute": "gg0Y39Uo", "ruleCriteria": "EQUAL", "ruleValue": 0.2433158706293611}]}]}, "groupType": "5bVAgtsD"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateNewGroupPublicV1'
delete_file $TEMP_FILE

#- 21 GetSingleGroupPublicV1
java -jar ${JAR_PATH} group getSingleGroupPublicV1 \
    --groupId 'hUTDUscb' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetSingleGroupPublicV1'
delete_file $TEMP_FILE

#- 22 UpdateSingleGroupV1
java -jar ${JAR_PATH} group updateSingleGroupV1 \
    --body '{"customAttributes": {}, "groupDescription": "QDjbTQuP", "groupIcon": "Mz2PTRlk", "groupName": "yU89ZPOw", "groupRegion": "6zPFJ42c", "groupType": "wmzBBSMN"}' \
    --groupId 'coAAOjKN' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateSingleGroupV1'
delete_file $TEMP_FILE

#- 23 DeleteGroupPublicV1
java -jar ${JAR_PATH} group deleteGroupPublicV1 \
    --groupId 'jfcYHm09' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteGroupPublicV1'
delete_file $TEMP_FILE

#- 24 UpdatePatchSingleGroupPublicV1
java -jar ${JAR_PATH} group updatePatchSingleGroupPublicV1 \
    --body '{"customAttributes": {}, "groupDescription": "3aYgBU1s", "groupIcon": "qjyK0XH4", "groupName": "5PaRSOFQ", "groupRegion": "Btu23REZ", "groupType": "8hRVX7LG"}' \
    --groupId 'OvDdYiQS' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePatchSingleGroupPublicV1'
delete_file $TEMP_FILE

#- 25 UpdateGroupCustomAttributesPublicV1
java -jar ${JAR_PATH} group updateGroupCustomAttributesPublicV1 \
    --body '{"customAttributes": {"9i7mV1C9": {}}}' \
    --groupId '1pjG9gpx' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateGroupCustomAttributesPublicV1'
delete_file $TEMP_FILE

#- 26 AcceptGroupInvitationPublicV1
java -jar ${JAR_PATH} group acceptGroupInvitationPublicV1 \
    --groupId 'L6ycTQdv' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AcceptGroupInvitationPublicV1'
delete_file $TEMP_FILE

#- 27 RejectGroupInvitationPublicV1
java -jar ${JAR_PATH} group rejectGroupInvitationPublicV1 \
    --groupId 'ln2LAuSQ' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RejectGroupInvitationPublicV1'
delete_file $TEMP_FILE

#- 28 JoinGroupV1
java -jar ${JAR_PATH} group joinGroupV1 \
    --groupId 'WEXL6LFE' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'JoinGroupV1'
delete_file $TEMP_FILE

#- 29 CancelGroupJoinRequestV1
java -jar ${JAR_PATH} group cancelGroupJoinRequestV1 \
    --groupId '1YHo9m12' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CancelGroupJoinRequestV1'
delete_file $TEMP_FILE

#- 30 GetGroupJoinRequestPublicV1
java -jar ${JAR_PATH} group getGroupJoinRequestPublicV1 \
    --groupId '6ZWc8hHt' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetGroupJoinRequestPublicV1'
delete_file $TEMP_FILE

#- 31 GetGroupMembersListPublicV1
java -jar ${JAR_PATH} group getGroupMembersListPublicV1 \
    --groupId 'WvbNYqgU' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetGroupMembersListPublicV1'
delete_file $TEMP_FILE

#- 32 UpdateGroupCustomRulePublicV1
java -jar ${JAR_PATH} group updateGroupCustomRulePublicV1 \
    --body '{"groupCustomRule": {"qslArFPi": {}}}' \
    --groupId 'HUIvaCv8' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateGroupCustomRulePublicV1'
delete_file $TEMP_FILE

#- 33 UpdateGroupPredefinedRulePublicV1
java -jar ${JAR_PATH} group updateGroupPredefinedRulePublicV1 \
    --body '{"ruleDetail": [{"ruleAttribute": "kU9dBBpd", "ruleCriteria": "MINIMUM", "ruleValue": 0.5572810812875463}]}' \
    --allowedAction 'hsVyExrk' \
    --groupId 'xoot0B7W' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateGroupPredefinedRulePublicV1'
delete_file $TEMP_FILE

#- 34 DeleteGroupPredefinedRulePublicV1
java -jar ${JAR_PATH} group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'OfercZdp' \
    --groupId 'Mci37Ds7' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteGroupPredefinedRulePublicV1'
delete_file $TEMP_FILE

#- 35 LeaveGroupPublicV1
java -jar ${JAR_PATH} group leaveGroupPublicV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'LeaveGroupPublicV1'
delete_file $TEMP_FILE

#- 36 GetMemberRolesListPublicV1
java -jar ${JAR_PATH} group getMemberRolesListPublicV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetMemberRolesListPublicV1'
delete_file $TEMP_FILE

#- 37 UpdateMemberRolePublicV1
java -jar ${JAR_PATH} group updateMemberRolePublicV1 \
    --body '{"userId": "YSfExaI3"}' \
    --memberRoleId 'uzLteMbF' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateMemberRolePublicV1'
delete_file $TEMP_FILE

#- 38 DeleteMemberRolePublicV1
java -jar ${JAR_PATH} group deleteMemberRolePublicV1 \
    --body '{"userId": "Alt4hr7H"}' \
    --memberRoleId 'mOYiBA5l' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteMemberRolePublicV1'
delete_file $TEMP_FILE

#- 39 GetGroupInvitationRequestPublicV1
java -jar ${JAR_PATH} group getGroupInvitationRequestPublicV1 \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetGroupInvitationRequestPublicV1'
delete_file $TEMP_FILE

#- 40 GetUserGroupInformationPublicV1
java -jar ${JAR_PATH} group getUserGroupInformationPublicV1 \
    --namespace "test" \
    --userId 'tAOXmlG6' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserGroupInformationPublicV1'
delete_file $TEMP_FILE

#- 41 InviteGroupPublicV1
java -jar ${JAR_PATH} group inviteGroupPublicV1 \
    --namespace "test" \
    --userId 'eh1dTdoT' \
    >$TEMP_FILE 2>&1
update_status $? 'InviteGroupPublicV1'
delete_file $TEMP_FILE

#- 42 AcceptGroupJoinRequestPublicV1
java -jar ${JAR_PATH} group acceptGroupJoinRequestPublicV1 \
    --namespace "test" \
    --userId 'FpBIcuC1' \
    >$TEMP_FILE 2>&1
update_status $? 'AcceptGroupJoinRequestPublicV1'
delete_file $TEMP_FILE

#- 43 RejectGroupJoinRequestPublicV1
java -jar ${JAR_PATH} group rejectGroupJoinRequestPublicV1 \
    --namespace "test" \
    --userId 'dQY93OJn' \
    >$TEMP_FILE 2>&1
update_status $? 'RejectGroupJoinRequestPublicV1'
delete_file $TEMP_FILE

#- 44 KickGroupMemberPublicV1
java -jar ${JAR_PATH} group kickGroupMemberPublicV1 \
    --namespace "test" \
    --userId 'J6Te9vD8' \
    >$TEMP_FILE 2>&1
update_status $? 'KickGroupMemberPublicV1'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT