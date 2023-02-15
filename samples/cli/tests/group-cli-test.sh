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
echo "1..72"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ListGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group listGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": false, "configurationCode": "Sm6UY4eK", "description": "0CjGyblZ", "globalRules": [{"allowedAction": "34WdV7Hn", "ruleDetail": [{"ruleAttribute": "z8RaHVXg", "ruleCriteria": "MINIMUM", "ruleValue": 0.012693048102411897}, {"ruleAttribute": "wNrUd0DC", "ruleCriteria": "EQUAL", "ruleValue": 0.8560646408222219}, {"ruleAttribute": "JB1I4wbq", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8445399216746415}]}, {"allowedAction": "SMlcYg20", "ruleDetail": [{"ruleAttribute": "i1Ks8G13", "ruleCriteria": "MINIMUM", "ruleValue": 0.7995581278900038}, {"ruleAttribute": "NCmP9vVN", "ruleCriteria": "MINIMUM", "ruleValue": 0.9577324322576332}, {"ruleAttribute": "L0lhGKla", "ruleCriteria": "MAXIMUM", "ruleValue": 0.0007442502154122455}]}, {"allowedAction": "7aIkBXLH", "ruleDetail": [{"ruleAttribute": "paXe26fU", "ruleCriteria": "EQUAL", "ruleValue": 0.17503281104092516}, {"ruleAttribute": "P69Epram", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8339418997536624}, {"ruleAttribute": "madpUCms", "ruleCriteria": "EQUAL", "ruleValue": 0.8392930060558861}]}], "groupAdminRoleId": "4YnGhYQI", "groupMaxMember": 17, "groupMemberRoleId": "QDVMKeG6", "name": "ZNbbHJzg"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'NRCrD7Pm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 't3SWDZJl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'LDg89vrF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "MnM2CYJ6", "groupMaxMember": 77, "name": "w54OKO3b"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '09MqWKho' \
    --configurationCode 'vkL4KQdA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "18hcyWNS", "ruleCriteria": "MAXIMUM", "ruleValue": 0.054269718987718485}, {"ruleAttribute": "vhp4y1DR", "ruleCriteria": "MINIMUM", "ruleValue": 0.7833799967700361}, {"ruleAttribute": "bxExwRHu", "ruleCriteria": "EQUAL", "ruleValue": 0.5149142746022818}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'vRs1Bz8G' \
    --configurationCode '3A9l8M8N' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 's5ZIwLVR' \
    --groupName '6ZCxKaVt' \
    --groupRegion 'wLOeYGFT' \
    --limit '73' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId '7IDRBNHX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'JxqHkueD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'Co6lBK9W' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '55' \
    --order 'ocJNcEdA' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "CECpdS9r", "memberRolePermissions": [{"action": 53, "resourceName": "fKyQNVy1"}, {"action": 17, "resourceName": "e8ucOhJq"}, {"action": 51, "resourceName": "RvI7rHKh"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'puJnroNX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'F48E2lB4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId '2dyO7nPu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "JbDqVYOv"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'zyEfuSzV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 28, "resourceName": "4FRfIl7L"}, {"action": 58, "resourceName": "LUWz40ms"}, {"action": 4, "resourceName": "HrRPwKJ8"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'myHihI3b' \
    --groupRegion '8ubckjEC' \
    --limit '40' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "yTgGStZc", "customAttributes": {"S5DePEo0": {}, "f2TdtPVf": {}, "jPLuaSv2": {}}, "groupDescription": "jD0s2AV4", "groupIcon": "3pIhP3Jz", "groupMaxMember": 84, "groupName": "LDH0tMZA", "groupRegion": "cIaXemBu", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "UXbmXx99", "ruleDetail": [{"ruleAttribute": "NDPGrkNp", "ruleCriteria": "MINIMUM", "ruleValue": 0.41027638169779257}, {"ruleAttribute": "M46La3Jx", "ruleCriteria": "EQUAL", "ruleValue": 0.4082295617625906}, {"ruleAttribute": "GKF7I6MR", "ruleCriteria": "MINIMUM", "ruleValue": 0.2610363923792459}]}, {"allowedAction": "gEwn0ANu", "ruleDetail": [{"ruleAttribute": "MD8NgiX9", "ruleCriteria": "EQUAL", "ruleValue": 0.2750367573894509}, {"ruleAttribute": "Nzk952Pf", "ruleCriteria": "EQUAL", "ruleValue": 0.4713758525866689}, {"ruleAttribute": "hELZs8Hq", "ruleCriteria": "EQUAL", "ruleValue": 0.8121804802350573}]}, {"allowedAction": "nB5kBG88", "ruleDetail": [{"ruleAttribute": "VH00MALi", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3839360844909766}, {"ruleAttribute": "VXd5d7Pm", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7947965121428101}, {"ruleAttribute": "d5GJ2IYX", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3986853173243844}]}]}, "groupType": "HspAiCTp"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'RhaE2uxJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId '1YNdWPzg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "KZ407MP0", "groupIcon": "AAwPdGws", "groupName": "JlZF0oj9", "groupRegion": "CZyn0XIB", "groupType": "9Yha9cAa"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'MLB5RQ6q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'x75Y6pBb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "NdwtlcW2", "groupIcon": "4gTOi1QE", "groupName": "gHRCWRe1", "groupRegion": "bEoa4rTy", "groupType": "QpYQyi4b"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId '826Mrkrf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"syVWJ640": {}, "dLV10gQc": {}, "ZdFqWtXw": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId '6J9kw79z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'INgypSfH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId '20uqOhF1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'PJpxadzJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'QJWCBv7F' \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'FQ7wSVai' \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '20' \
    --order '7vyOw7BB' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'IBCjHM0m' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"xW0m665z": {}, "o5fH4mY1": {}, "ZESiyUJz": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction '8ZMWtT54' \
    --groupId 'neJiBD7o' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "lMpDaZxe", "ruleCriteria": "MINIMUM", "ruleValue": 0.8362455990265766}, {"ruleAttribute": "uLuWmhxy", "ruleCriteria": "EQUAL", "ruleValue": 0.5577347858365409}, {"ruleAttribute": "gsZBA1A5", "ruleCriteria": "MINIMUM", "ruleValue": 0.722364090166382}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction '3eP0ZVd6' \
    --groupId 'aQnjlKVt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteGroupPredefinedRulePublicV1' test.out

#- 36 LeaveGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'LeaveGroupPublicV1' test.out

#- 37 GetMemberRolesListPublicV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'WcZQveL2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "RRnQbDwK"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'fzRWU0Tz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "XIKkNe8u"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TNYa46fb' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JbPISTpV' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VYb9DADx' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DLaxUXUd' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'igZp7TsW' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '4dwc0PJU' \
    --limit '24' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 46 'GetUserJoinedGroupInformationPublicV2' test.out

#- 47 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "U3xciDAc", "customAttributes": {"qq1W35BD": {}, "3K6UUZQq": {}, "6JEHilOc": {}}, "groupDescription": "kUJdjywQ", "groupIcon": "Cdd41BYr", "groupMaxMember": 82, "groupName": "PJfbmWv9", "groupRegion": "cPHez71r", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "2fCRd96x", "ruleDetail": [{"ruleAttribute": "g4EyKDdi", "ruleCriteria": "MAXIMUM", "ruleValue": 0.49590933524616376}, {"ruleAttribute": "DXaZC4Il", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9149608869621217}, {"ruleAttribute": "NwEFI9Nh", "ruleCriteria": "MAXIMUM", "ruleValue": 0.06199926159265279}]}, {"allowedAction": "ze9qICHY", "ruleDetail": [{"ruleAttribute": "Om6NFz8J", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6731925480764896}, {"ruleAttribute": "aZtIRZKc", "ruleCriteria": "EQUAL", "ruleValue": 0.8810109690809473}, {"ruleAttribute": "cykMoFEf", "ruleCriteria": "MAXIMUM", "ruleValue": 0.800434393111657}]}, {"allowedAction": "enM7An92", "ruleDetail": [{"ruleAttribute": "GEXoigOv", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7568401640787158}, {"ruleAttribute": "MSDtfQGw", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3548447595145293}, {"ruleAttribute": "SbuUy9EF", "ruleCriteria": "MINIMUM", "ruleValue": 0.17736044282290442}]}]}, "groupType": "9GBAbfpX"}' \
    > test.out 2>&1
eval_tap $? 47 'CreateNewGroupPublicV2' test.out

#- 48 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["4pXaeysm", "uF3q0HQr", "v01g4gC9"]}' \
    > test.out 2>&1
eval_tap $? 48 'GetListGroupByIDsV2' test.out

#- 49 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'W3fU7kij' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "T2kVOlow", "groupIcon": "5wxQyi5y", "groupName": "SJcyDZMn", "groupRegion": "7N5h50vW", "groupType": "plNIZMtF"}' \
    > test.out 2>&1
eval_tap $? 49 'UpdatePutSingleGroupPublicV2' test.out

#- 50 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'fSMkjwXC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteGroupPublicV2' test.out

#- 51 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId '8nRHzfxR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "NhO9Nluu", "groupIcon": "DHrQFQDX", "groupName": "whODECUC", "groupRegion": "Ubl1IDMY", "groupType": "3FCX7NGx"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePatchSingleGroupPublicV2' test.out

#- 52 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'wVigJoHv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"HoXNqMzw": {}, "cvE46YfE": {}, "WiCO8BQz": {}}}' \
    > test.out 2>&1
eval_tap $? 52 'UpdateGroupCustomAttributesPublicV2' test.out

#- 53 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'oAtiqU9T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'AcceptGroupInvitationPublicV2' test.out

#- 54 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'sj6lPaCk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'RejectGroupInvitationPublicV2' test.out

#- 55 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'Ou5YTM6S' \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 55 'GetGroupInviteRequestPublicV2' test.out

#- 56 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'lgr8eoPG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'JoinGroupV2' test.out

#- 57 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'p4hmkm6W' \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupJoinRequestPublicV2' test.out

#- 58 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'K4hvCKJV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'LeaveGroupPublicV2' test.out

#- 59 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'fk5QH2Pf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"VuFNHvIq": {}, "gVClCf9N": {}, "bQfj3Hui": {}}}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateGroupCustomRulePublicV2' test.out

#- 60 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'w9z6SkUV' \
    --groupId 'p8C4azBE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "JsLJsOSj", "ruleCriteria": "MINIMUM", "ruleValue": 0.08612626427617376}, {"ruleAttribute": "muqE1zZM", "ruleCriteria": "EQUAL", "ruleValue": 0.4806659467191222}, {"ruleAttribute": "r4jbwMPX", "ruleCriteria": "EQUAL", "ruleValue": 0.6531243214698782}]}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateGroupPredefinedRulePublicV2' test.out

#- 61 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'aVAyL23y' \
    --groupId 'XoQ4fLFL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'DeleteGroupPredefinedRulePublicV2' test.out

#- 62 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 62 'GetMemberRolesListPublicV2' test.out

#- 63 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId '86FYfTO5' \
    --memberRoleId 'hRHKca9t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "HUULoF5K"}' \
    > test.out 2>&1
eval_tap $? 63 'UpdateMemberRolePublicV2' test.out

#- 64 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'gTmg7MAS' \
    --memberRoleId 'HSuBpgxi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "7wquIXql"}' \
    > test.out 2>&1
eval_tap $? 64 'DeleteMemberRolePublicV2' test.out

#- 65 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 65 'GetUserGroupInformationPublicV2' test.out

#- 66 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 66 'GetMyGroupJoinRequestV2' test.out

#- 67 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId '2rQhL0Z1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NoP63bhF' \
    > test.out 2>&1
eval_tap $? 67 'InviteGroupPublicV2' test.out

#- 68 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'uaqpz7LL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QHy46eoe' \
    > test.out 2>&1
eval_tap $? 68 'CancelInvitationGroupMemberV2' test.out

#- 69 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'NDnGK2XH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BWo9u00a' \
    > test.out 2>&1
eval_tap $? 69 'AcceptGroupJoinRequestPublicV2' test.out

#- 70 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'Yb64HXU2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BiHm9VRr' \
    > test.out 2>&1
eval_tap $? 70 'RejectGroupJoinRequestPublicV2' test.out

#- 71 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'HXAoEAI4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YualxKAG' \
    > test.out 2>&1
eval_tap $? 71 'KickGroupMemberPublicV2' test.out

#- 72 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'ZET8uHXv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qxnp6026' \
    > test.out 2>&1
eval_tap $? 72 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE