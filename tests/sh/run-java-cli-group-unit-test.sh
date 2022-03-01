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
    --body '{"configurationCode": "FtBxyZcD", "description": "XBpGlsQu", "globalRules": [{"allowedAction": "Ju8vMf0I", "ruleDetail": [{"ruleAttribute": "sJkTrd8I", "ruleCriteria": "DcV2zXnT", "ruleValue": 0.5626513595937684}]}], "groupAdminRoleId": "XY1bPqam", "groupMaxMember": 17, "groupMemberRoleId": "Bxx9Cs18", "name": "EY84ekIt"}' \
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
    --configurationCode 'qRzHU1oh' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetGroupConfigurationAdminV1'
delete_file $TEMP_FILE

#- 5 DeleteGroupConfigurationV1
java -jar ${JAR_PATH} group deleteGroupConfigurationV1 \
    --configurationCode '570KQBVa' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteGroupConfigurationV1'
delete_file $TEMP_FILE

#- 6 UpdateGroupConfigurationAdminV1
java -jar ${JAR_PATH} group updateGroupConfigurationAdminV1 \
    --body '{"description": "ewc72krS", "groupMaxMember": 14, "name": "a68n3Yno"}' \
    --configurationCode 'zp1C2KmI' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateGroupConfigurationAdminV1'
delete_file $TEMP_FILE

#- 7 UpdateGroupConfigurationGlobalRuleAdminV1
java -jar ${JAR_PATH} group updateGroupConfigurationGlobalRuleAdminV1 \
    --body '{"ruleDetail": [{"ruleAttribute": "QTuBdNEU", "ruleCriteria": "sxFb8CJ1", "ruleValue": 0.9261416017879885}]}' \
    --allowedAction '7DJZaMSx' \
    --configurationCode 'ECbZbygy' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateGroupConfigurationGlobalRuleAdminV1'
delete_file $TEMP_FILE

#- 8 DeleteGroupConfigurationGlobalRuleAdminV1
java -jar ${JAR_PATH} group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'oarORoeN' \
    --configurationCode 'HSb8Rh3k' \
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
    --groupId 'gs9qqJbn' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetSingleGroupAdminV1'
delete_file $TEMP_FILE

#- 11 DeleteGroupAdminV1
java -jar ${JAR_PATH} group deleteGroupAdminV1 \
    --groupId 'QsoBgiVp' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteGroupAdminV1'
delete_file $TEMP_FILE

#- 12 GetGroupMembersListAdminV1
java -jar ${JAR_PATH} group getGroupMembersListAdminV1 \
    --groupId 'P8Cm3yvA' \
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
    --body '{"memberRoleName": "SUoxdxxF", "memberRolePermissions": [{"action": 32, "resourceName": "mAGTJ8IE"}]}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateMemberRoleAdminV1'
delete_file $TEMP_FILE

#- 15 GetSingleMemberRoleAdminV1
java -jar ${JAR_PATH} group getSingleMemberRoleAdminV1 \
    --memberRoleId 'dagEtp4w' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetSingleMemberRoleAdminV1'
delete_file $TEMP_FILE

#- 16 DeleteMemberRoleAdminV1
java -jar ${JAR_PATH} group deleteMemberRoleAdminV1 \
    --memberRoleId '29KOu9c1' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteMemberRoleAdminV1'
delete_file $TEMP_FILE

#- 17 UpdateMemberRoleAdminV1
java -jar ${JAR_PATH} group updateMemberRoleAdminV1 \
    --body '{"memberRoleName": "9R6XDqWH"}' \
    --memberRoleId 'kkP8npLE' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateMemberRoleAdminV1'
delete_file $TEMP_FILE

#- 18 UpdateMemberRolePermissionAdminV1
java -jar ${JAR_PATH} group updateMemberRolePermissionAdminV1 \
    --body '{"memberRolePermissions": [{"action": 73, "resourceName": "MfjiX7jp"}]}' \
    --memberRoleId 'kVZk3IaQ' \
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
    --body '{"configurationCode": "YEmqGodO", "customAttributes": {"EGt9gPOj": {}}, "groupDescription": "0c6i0Jkv", "groupIcon": "Ias73ucY", "groupMaxMember": 27, "groupName": "FAJ3DK5T", "groupRegion": "4Eogg0Y3", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "9UoYlpv5", "ruleDetail": [{"ruleAttribute": "bVAgtsDh", "ruleCriteria": "UTDUscbQ", "ruleValue": 0.4674496065247328}]}]}, "groupType": "bTQuPMz2"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CreateNewGroupPublicV1'
delete_file $TEMP_FILE

#- 21 GetSingleGroupPublicV1
java -jar ${JAR_PATH} group getSingleGroupPublicV1 \
    --groupId 'PTRlkyU8' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetSingleGroupPublicV1'
delete_file $TEMP_FILE

#- 22 UpdateSingleGroupV1
java -jar ${JAR_PATH} group updateSingleGroupV1 \
    --body '{"customAttributes": {}, "groupDescription": "9ZPOw6zP", "groupIcon": "FJ42cwmz", "groupName": "BBSMNcoA", "groupRegion": "AOjKNjfc", "groupType": "YHm093aY"}' \
    --groupId 'gBU1sqjy' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateSingleGroupV1'
delete_file $TEMP_FILE

#- 23 DeleteGroupPublicV1
java -jar ${JAR_PATH} group deleteGroupPublicV1 \
    --groupId 'K0XH45Pa' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteGroupPublicV1'
delete_file $TEMP_FILE

#- 24 UpdatePatchSingleGroupPublicV1
java -jar ${JAR_PATH} group updatePatchSingleGroupPublicV1 \
    --body '{"customAttributes": {}, "groupDescription": "RSOFQBtu", "groupIcon": "23REZ8hR", "groupName": "VX7LGOvD", "groupRegion": "dYiQS9i7", "groupType": "mV1C91pj"}' \
    --groupId 'G9gpxL6y' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePatchSingleGroupPublicV1'
delete_file $TEMP_FILE

#- 25 UpdateGroupCustomAttributesPublicV1
java -jar ${JAR_PATH} group updateGroupCustomAttributesPublicV1 \
    --body '{"customAttributes": {"cTQdvln2": {}}}' \
    --groupId 'LAuSQWEX' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateGroupCustomAttributesPublicV1'
delete_file $TEMP_FILE

#- 26 AcceptGroupInvitationPublicV1
java -jar ${JAR_PATH} group acceptGroupInvitationPublicV1 \
    --groupId 'L6LFE1YH' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'AcceptGroupInvitationPublicV1'
delete_file $TEMP_FILE

#- 27 RejectGroupInvitationPublicV1
java -jar ${JAR_PATH} group rejectGroupInvitationPublicV1 \
    --groupId 'o9m126ZW' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RejectGroupInvitationPublicV1'
delete_file $TEMP_FILE

#- 28 JoinGroupV1
java -jar ${JAR_PATH} group joinGroupV1 \
    --groupId 'c8hHtWvb' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'JoinGroupV1'
delete_file $TEMP_FILE

#- 29 CancelGroupJoinRequestV1
java -jar ${JAR_PATH} group cancelGroupJoinRequestV1 \
    --groupId 'NYqgUqsl' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'CancelGroupJoinRequestV1'
delete_file $TEMP_FILE

#- 30 GetGroupJoinRequestPublicV1
java -jar ${JAR_PATH} group getGroupJoinRequestPublicV1 \
    --groupId 'ArFPiHUI' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetGroupJoinRequestPublicV1'
delete_file $TEMP_FILE

#- 31 GetGroupMembersListPublicV1
java -jar ${JAR_PATH} group getGroupMembersListPublicV1 \
    --groupId 'vaCv8kU9' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetGroupMembersListPublicV1'
delete_file $TEMP_FILE

#- 32 UpdateGroupCustomRulePublicV1
java -jar ${JAR_PATH} group updateGroupCustomRulePublicV1 \
    --body '{"groupCustomRule": {"dBBpdsJL": {}}}' \
    --groupId 'hsVyExrk' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateGroupCustomRulePublicV1'
delete_file $TEMP_FILE

#- 33 UpdateGroupPredefinedRulePublicV1
java -jar ${JAR_PATH} group updateGroupPredefinedRulePublicV1 \
    --body '{"ruleDetail": [{"ruleAttribute": "xoot0B7W", "ruleCriteria": "OfercZdp", "ruleValue": 0.5953687134744807}]}' \
    --allowedAction 'i37Ds7YS' \
    --groupId 'fExaI3uz' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateGroupPredefinedRulePublicV1'
delete_file $TEMP_FILE

#- 34 DeleteGroupPredefinedRulePublicV1
java -jar ${JAR_PATH} group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'LteMbFAl' \
    --groupId 't4hr7HmO' \
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
    --body '{"userId": "YiBA5ltA"}' \
    --memberRoleId 'OXmlG6eh' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateMemberRolePublicV1'
delete_file $TEMP_FILE

#- 38 DeleteMemberRolePublicV1
java -jar ${JAR_PATH} group deleteMemberRolePublicV1 \
    --body '{"userId": "1dTdoTFp"}' \
    --memberRoleId 'BIcuC1dQ' \
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
    --userId 'Y93OJnJ6' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserGroupInformationPublicV1'
delete_file $TEMP_FILE

#- 41 InviteGroupPublicV1
java -jar ${JAR_PATH} group inviteGroupPublicV1 \
    --namespace "test" \
    --userId 'Te9vD8ld' \
    >$TEMP_FILE 2>&1
update_status $? 'InviteGroupPublicV1'
delete_file $TEMP_FILE

#- 42 AcceptGroupJoinRequestPublicV1
java -jar ${JAR_PATH} group acceptGroupJoinRequestPublicV1 \
    --namespace "test" \
    --userId 'z7Hu8AD7' \
    >$TEMP_FILE 2>&1
update_status $? 'AcceptGroupJoinRequestPublicV1'
delete_file $TEMP_FILE

#- 43 RejectGroupJoinRequestPublicV1
java -jar ${JAR_PATH} group rejectGroupJoinRequestPublicV1 \
    --namespace "test" \
    --userId '9kdWunvi' \
    >$TEMP_FILE 2>&1
update_status $? 'RejectGroupJoinRequestPublicV1'
delete_file $TEMP_FILE

#- 44 KickGroupMemberPublicV1
java -jar ${JAR_PATH} group kickGroupMemberPublicV1 \
    --namespace "test" \
    --userId 'zU0q1pHy' \
    >$TEMP_FILE 2>&1
update_status $? 'KickGroupMemberPublicV1'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT