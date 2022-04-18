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

echo "TAP version 13"
echo "1..45"

#- 1 Login
build/install/cli/bin/cli loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ListGroupConfigurationAdminV1
build/install/cli/bin/cli group listGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
build/install/cli/bin/cli group createGroupConfigurationAdminV1 \
    --body '{"configurationCode": "FtBxyZcD", "description": "XBpGlsQu", "globalRules": [{"allowedAction": "Ju8vMf0I", "ruleDetail": [{"ruleAttribute": "sJkTrd8I", "ruleCriteria": "MINIMUM", "ruleValue": 0.9953468146489199}]}], "groupAdminRoleId": "V2zXnTKj", "groupMaxMember": 99, "groupMemberRoleId": "Y1bPqami", "name": "Bxx9Cs18"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
build/install/cli/bin/cli group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
build/install/cli/bin/cli group getGroupConfigurationAdminV1 \
    --configurationCode 'EY84ekIt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
build/install/cli/bin/cli group deleteGroupConfigurationV1 \
    --configurationCode 'qRzHU1oh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
build/install/cli/bin/cli group updateGroupConfigurationAdminV1 \
    --body '{"description": "570KQBVa", "groupMaxMember": 8, "name": "wc72krSh"}' \
    --configurationCode 'a68n3Yno' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
build/install/cli/bin/cli group updateGroupConfigurationGlobalRuleAdminV1 \
    --body '{"ruleDetail": [{"ruleAttribute": "zp1C2KmI", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7164070183072041}]}' \
    --allowedAction 'BdNEUsxF' \
    --configurationCode 'b8CJ17M7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
build/install/cli/bin/cli group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'DJZaMSxE' \
    --configurationCode 'CbZbygyo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
build/install/cli/bin/cli group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
build/install/cli/bin/cli group getSingleGroupAdminV1 \
    --groupId 'arORoeNH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
build/install/cli/bin/cli group deleteGroupAdminV1 \
    --groupId 'Sb8Rh3kg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
build/install/cli/bin/cli group getGroupMembersListAdminV1 \
    --groupId 's9qqJbnQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
build/install/cli/bin/cli group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
build/install/cli/bin/cli group createMemberRoleAdminV1 \
    --body '{"memberRoleName": "soBgiVpP", "memberRolePermissions": [{"action": 56, "resourceName": "m3yvASUo"}]}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
build/install/cli/bin/cli group getSingleMemberRoleAdminV1 \
    --memberRoleId 'xdxxFqmA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
build/install/cli/bin/cli group deleteMemberRoleAdminV1 \
    --memberRoleId 'GTJ8IEda' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
build/install/cli/bin/cli group updateMemberRoleAdminV1 \
    --body '{"memberRoleName": "gEtp4w29"}' \
    --memberRoleId 'KOu9c19R' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
build/install/cli/bin/cli group updateMemberRolePermissionAdminV1 \
    --body '{"memberRolePermissions": [{"action": 98, "resourceName": "DqWHkkP8"}]}' \
    --memberRoleId 'npLEKMfj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
build/install/cli/bin/cli group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
build/install/cli/bin/cli group createNewGroupPublicV1 \
    --body '{"configurationCode": "iX7jpkVZ", "customAttributes": {"k3IaQYEm": {}}, "groupDescription": "qGodOEGt", "groupIcon": "9gPOj0c6", "groupMaxMember": 16, "groupName": "0JkvIas7", "groupRegion": "3ucYnFAJ", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "3DK5T4Eo", "ruleDetail": [{"ruleAttribute": "gg0Y39Uo", "ruleCriteria": "EQUAL", "ruleValue": 0.2433158706293611}]}]}, "groupType": "5bVAgtsD"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
build/install/cli/bin/cli group getSingleGroupPublicV1 \
    --groupId 'hUTDUscb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
build/install/cli/bin/cli group updateSingleGroupV1 \
    --body '{"customAttributes": {}, "groupDescription": "QDjbTQuP", "groupIcon": "Mz2PTRlk", "groupName": "yU89ZPOw", "groupRegion": "6zPFJ42c", "groupType": "wmzBBSMN"}' \
    --groupId 'coAAOjKN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
build/install/cli/bin/cli group deleteGroupPublicV1 \
    --groupId 'jfcYHm09' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
build/install/cli/bin/cli group updatePatchSingleGroupPublicV1 \
    --body '{"customAttributes": {}, "groupDescription": "3aYgBU1s", "groupIcon": "qjyK0XH4", "groupName": "5PaRSOFQ", "groupRegion": "Btu23REZ", "groupType": "8hRVX7LG"}' \
    --groupId 'OvDdYiQS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
build/install/cli/bin/cli group updateGroupCustomAttributesPublicV1 \
    --body '{"customAttributes": {"9i7mV1C9": {}}}' \
    --groupId '1pjG9gpx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
build/install/cli/bin/cli group acceptGroupInvitationPublicV1 \
    --groupId 'L6ycTQdv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
build/install/cli/bin/cli group rejectGroupInvitationPublicV1 \
    --groupId 'ln2LAuSQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
build/install/cli/bin/cli group joinGroupV1 \
    --groupId 'WEXL6LFE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
build/install/cli/bin/cli group cancelGroupJoinRequestV1 \
    --groupId '1YHo9m12' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
build/install/cli/bin/cli group getGroupJoinRequestPublicV1 \
    --groupId '6ZWc8hHt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
build/install/cli/bin/cli group getGroupMembersListPublicV1 \
    --groupId 'WvbNYqgU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
build/install/cli/bin/cli group updateGroupCustomRulePublicV1 \
    --body '{"groupCustomRule": {"qslArFPi": {}}}' \
    --groupId 'HUIvaCv8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
build/install/cli/bin/cli group updateGroupPredefinedRulePublicV1 \
    --body '{"ruleDetail": [{"ruleAttribute": "kU9dBBpd", "ruleCriteria": "MINIMUM", "ruleValue": 0.5572810812875463}]}' \
    --allowedAction 'hsVyExrk' \
    --groupId 'xoot0B7W' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
build/install/cli/bin/cli group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'OfercZdp' \
    --groupId 'Mci37Ds7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteGroupPredefinedRulePublicV1' test.out

#- 36 LeaveGroupPublicV1
build/install/cli/bin/cli group leaveGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'LeaveGroupPublicV1' test.out

#- 37 GetMemberRolesListPublicV1
build/install/cli/bin/cli group getMemberRolesListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
build/install/cli/bin/cli group updateMemberRolePublicV1 \
    --body '{"userId": "YSfExaI3"}' \
    --memberRoleId 'uzLteMbF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
build/install/cli/bin/cli group deleteMemberRolePublicV1 \
    --body '{"userId": "Alt4hr7H"}' \
    --memberRoleId 'mOYiBA5l' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
build/install/cli/bin/cli group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
build/install/cli/bin/cli group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tAOXmlG6' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
build/install/cli/bin/cli group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eh1dTdoT' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
build/install/cli/bin/cli group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FpBIcuC1' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
build/install/cli/bin/cli group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dQY93OJn' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
build/install/cli/bin/cli group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'J6Te9vD8' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE