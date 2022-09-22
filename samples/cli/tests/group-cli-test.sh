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
echo "1..45"

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
    --limit '16' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "oHLU3yEH", "description": "8pWg93YI", "globalRules": [{"allowedAction": "ky8LXSR0", "ruleDetail": [{"ruleAttribute": "3hct6DRq", "ruleCriteria": "EQUAL", "ruleValue": 0.8286052026687009}, {"ruleAttribute": "HiCxCdDU", "ruleCriteria": "MINIMUM", "ruleValue": 0.8460695743959671}, {"ruleAttribute": "FPVaAYQw", "ruleCriteria": "MAXIMUM", "ruleValue": 0.11558080041326269}]}, {"allowedAction": "9Z2zu04q", "ruleDetail": [{"ruleAttribute": "7fg9f0eW", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8489124430680579}, {"ruleAttribute": "7ypE7TNp", "ruleCriteria": "MINIMUM", "ruleValue": 0.18027143854128647}, {"ruleAttribute": "rL0t2NOu", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4681906941910057}]}, {"allowedAction": "mJXwHWJn", "ruleDetail": [{"ruleAttribute": "yeP9gidn", "ruleCriteria": "MINIMUM", "ruleValue": 0.012555004355215948}, {"ruleAttribute": "Viw4FHNw", "ruleCriteria": "EQUAL", "ruleValue": 0.10279661177501065}, {"ruleAttribute": "cykgH6CA", "ruleCriteria": "MINIMUM", "ruleValue": 0.8544017091761801}]}], "groupAdminRoleId": "PzdPojFC", "groupMaxMember": 14, "groupMemberRoleId": "1zRlFTkL", "name": "ZlTXBvPp"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode '8xw12kiQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'aXVaahbr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'mWxFaTRf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "VdeeYPkQ", "groupMaxMember": 78, "name": "6NI9sjxa"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'Rebc2Xm6' \
    --configurationCode 'EcmoaEyq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "IVGe0jPy", "ruleCriteria": "MINIMUM", "ruleValue": 0.790462702198497}, {"ruleAttribute": "tHhYOLst", "ruleCriteria": "EQUAL", "ruleValue": 0.14589513894063877}, {"ruleAttribute": "T4s4dvQI", "ruleCriteria": "MAXIMUM", "ruleValue": 0.008752959408489636}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'O9DpEJSf' \
    --configurationCode 'zudmcVHD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'K8JH6fFa' \
    --groupName 'qfEivtAj' \
    --groupRegion '4akI13qo' \
    --limit '92' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'VJp4UGkc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'd6k8Mhdw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId '7GkzEEH0' \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '0' \
    --order '0TgIx5mT' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "kwY1TQQF", "memberRolePermissions": [{"action": 13, "resourceName": "n8glu8Gt"}, {"action": 26, "resourceName": "Gi5bYpPi"}, {"action": 88, "resourceName": "CL6GC26m"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'QrK8HeDS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'JtR6w7Db' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'HczhOM6u' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "kggTDPDb"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'Zxdw4j3D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 81, "resourceName": "238tBLqs"}, {"action": 79, "resourceName": "3rd0zry8"}, {"action": 30, "resourceName": "XjvBMqaR"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'gjHbAUXX' \
    --groupRegion 'W7ynp6vF' \
    --limit '89' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "sIsaLu9e", "customAttributes": {"nxfhHJtF": {}, "n7AEvDOJ": {}, "kv3s1FW3": {}}, "groupDescription": "EAWLaKpz", "groupIcon": "RbZnT4da", "groupMaxMember": 76, "groupName": "m3e1Ct0p", "groupRegion": "0raOErs5", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "hSjskwZH", "ruleDetail": [{"ruleAttribute": "HVLs3G1u", "ruleCriteria": "EQUAL", "ruleValue": 0.8173221332753506}, {"ruleAttribute": "EWMJUZkZ", "ruleCriteria": "MINIMUM", "ruleValue": 0.48331874603210856}, {"ruleAttribute": "QETrd9nS", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9163852932969992}]}, {"allowedAction": "FRs17Myc", "ruleDetail": [{"ruleAttribute": "QOifcAyL", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5846405378763007}, {"ruleAttribute": "NZmBvOor", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4558474116575256}, {"ruleAttribute": "NzBaDFz3", "ruleCriteria": "MINIMUM", "ruleValue": 0.3276632354005926}]}, {"allowedAction": "GVcizGFV", "ruleDetail": [{"ruleAttribute": "7ruPOyIM", "ruleCriteria": "MINIMUM", "ruleValue": 0.6401742303845347}, {"ruleAttribute": "h7a78L18", "ruleCriteria": "EQUAL", "ruleValue": 0.14633875480982694}, {"ruleAttribute": "fGbZjcn3", "ruleCriteria": "EQUAL", "ruleValue": 0.89803523039464}]}]}, "groupType": "7SnOpU9d"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'Z7Zz7rSm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'jvSDjRiB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "qqKI0ihj", "groupIcon": "EAl5fu2a", "groupName": "vRfyBdVO", "groupRegion": "VGMTLZ7H", "groupType": "F4N8jrBg"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId '3wu1CWJB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'X8JalitF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "DC2w03XM", "groupIcon": "LA42krfI", "groupName": "7B1V8iG7", "groupRegion": "37R02CzW", "groupType": "vM3KD8kJ"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'cafXYMTK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"ZkEGvvMP": {}, "6AIEYLTv": {}, "K7f4ZIWp": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'AxZogsy5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'KNEWSgWC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'QpWM2VET' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'PXT2uWUf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'nUyQsRDc' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId '2pwblENE' \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '52' \
    --order '9rEhwcSR' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'tesakCb5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"bggGiaVe": {}, "lAwGPLF2": {}, "ffGcCAFv": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction '4iGLL659' \
    --groupId 'PbtMiIl1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "L84dyOaH", "ruleCriteria": "MAXIMUM", "ruleValue": 0.16088973010233532}, {"ruleAttribute": "i0QQYqq4", "ruleCriteria": "MINIMUM", "ruleValue": 0.7805851431443466}, {"ruleAttribute": "PwbGl7z7", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6044440300999897}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'AW6iZxaF' \
    --groupId 'BiCM6MyZ' \
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
    --limit '94' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'lEnRZYpU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "R2lFjcYC"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'YVawbapl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "gcHpGoYM"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KEv6gTKJ' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GNhzPoGq' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'C1fzNFtw' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nFsfPj3b' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GDXXLpzC' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE