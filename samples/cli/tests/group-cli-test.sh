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
    --limit '100' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "Lbl1z0y5", "description": "1lfmmRT0", "globalRules": [{"allowedAction": "Yedbk4c1", "ruleDetail": [{"ruleAttribute": "l9H98YUv", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7061007327454425}, {"ruleAttribute": "q4pEBKpD", "ruleCriteria": "EQUAL", "ruleValue": 0.9343311807449968}, {"ruleAttribute": "Jp4EGU1h", "ruleCriteria": "MINIMUM", "ruleValue": 0.7391327190853186}]}, {"allowedAction": "ylmhSw4y", "ruleDetail": [{"ruleAttribute": "QtU0nxll", "ruleCriteria": "MINIMUM", "ruleValue": 0.6186720710312751}, {"ruleAttribute": "8tdUell8", "ruleCriteria": "MAXIMUM", "ruleValue": 0.23869792052159078}, {"ruleAttribute": "MsYynJYS", "ruleCriteria": "MAXIMUM", "ruleValue": 0.08864767302867682}]}, {"allowedAction": "cOfnvqBz", "ruleDetail": [{"ruleAttribute": "mDDkhXxZ", "ruleCriteria": "EQUAL", "ruleValue": 0.5880089517407525}, {"ruleAttribute": "57DdrWUR", "ruleCriteria": "MINIMUM", "ruleValue": 0.08007658873276202}, {"ruleAttribute": "dXaB7jwp", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6170931173289196}]}], "groupAdminRoleId": "GTwZl9nl", "groupMaxMember": 63, "groupMemberRoleId": "WcPis2rI", "name": "taPckRCz"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'XXKgdu8M' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'JLmTu2eY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'RGJ3Jb2N' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "CPHL8LgL", "groupMaxMember": 53, "name": "ySDyqbCj"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'DL12DBL8' \
    --configurationCode 'IQ51AYwz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "FtaOWbSy", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8611787728040833}, {"ruleAttribute": "OLRll6rH", "ruleCriteria": "EQUAL", "ruleValue": 0.2978361933372017}, {"ruleAttribute": "ttpUf3Ji", "ruleCriteria": "EQUAL", "ruleValue": 0.19377844292359503}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'Gjnqt4lS' \
    --configurationCode '9Y7i7qLK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode '9pjr3MyZ' \
    --groupName 'P40jAJG1' \
    --groupRegion 'YMmecV8q' \
    --limit '31' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'S15zVIds' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'eUyRHW4m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId '7NkY1ddQ' \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '44' \
    --order 'KdCQ16Pu' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "p3fHnJpS", "memberRolePermissions": [{"action": 23, "resourceName": "fhuiR9KY"}, {"action": 21, "resourceName": "yM9YwLQp"}, {"action": 37, "resourceName": "FL12TDSi"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'lTuCNQyR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'GdV0c6vg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'un1Ov7OV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "peaODwSC"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'e4XwuXy5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 82, "resourceName": "5ob9y7Iy"}, {"action": 48, "resourceName": "dlluOgIJ"}, {"action": 21, "resourceName": "9MPLedLB"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'C3mKLjw7' \
    --groupRegion 'mMvVaSYK' \
    --limit '70' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "e3voCz5I", "customAttributes": {"TyqwwkgL": {}, "48Ppqg8X": {}, "gtKDfHdq": {}}, "groupDescription": "brtoCZrN", "groupIcon": "a2z8Jxke", "groupMaxMember": 81, "groupName": "uz6SSAGb", "groupRegion": "rkLdUsOp", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "KJ43tEmC", "ruleDetail": [{"ruleAttribute": "FBkOiC85", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4364675519878938}, {"ruleAttribute": "olS3ayt2", "ruleCriteria": "MINIMUM", "ruleValue": 0.14434951035160293}, {"ruleAttribute": "5xCYe50a", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3655141147211921}]}, {"allowedAction": "Zn5r3kCq", "ruleDetail": [{"ruleAttribute": "pUHhGnIn", "ruleCriteria": "MINIMUM", "ruleValue": 0.40921300874588207}, {"ruleAttribute": "HVJCl8Xe", "ruleCriteria": "EQUAL", "ruleValue": 0.17834422117291415}, {"ruleAttribute": "aMYN5F1e", "ruleCriteria": "EQUAL", "ruleValue": 0.4336892677224462}]}, {"allowedAction": "L21gPM8P", "ruleDetail": [{"ruleAttribute": "lXKbES77", "ruleCriteria": "MINIMUM", "ruleValue": 0.06077804978710388}, {"ruleAttribute": "3cMezhTv", "ruleCriteria": "MINIMUM", "ruleValue": 0.820068834224882}, {"ruleAttribute": "NLbVkbsr", "ruleCriteria": "EQUAL", "ruleValue": 0.4519051107978994}]}]}, "groupType": "ZLeBhShP"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'oC3BlTae' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'dMxOvUPY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "kVO5UYXj", "groupIcon": "2EQfNp2H", "groupName": "PYyOrjWD", "groupRegion": "luHh3XVM", "groupType": "NpqMBhbK"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'SPlRyX59' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'P9GS3kVm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "Oid6KCGG", "groupIcon": "il7uyI9F", "groupName": "eKKfqOd7", "groupRegion": "k2m8ffrB", "groupType": "W0M3K9Bz"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'rtwzK5GC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"r1hG3KGN": {}, "oh8LZH10": {}, "Ey0gNzOx": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'CV57PtW4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'FosjVACr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId '04ClyAEO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'qwCcanDv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'sIN5yf7m' \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'gDA8SELs' \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '38' \
    --order '22iQ81ml' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'zOhTr4K0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"lNtjhbF5": {}, "sgpxXBd5": {}, "KqlCwR66": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'guAjev9v' \
    --groupId 'LO9DFpg8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "dLo3MAcl", "ruleCriteria": "EQUAL", "ruleValue": 0.4318934382033389}, {"ruleAttribute": "1yUd6B60", "ruleCriteria": "MAXIMUM", "ruleValue": 0.05948785603348683}, {"ruleAttribute": "A4MjcBkf", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3140193530822436}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'S4NiXfuX' \
    --groupId '9vDxwJK8' \
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
    --limit '88' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'qQh3nLPa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "b8NxtOGy"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'cqPwYfPz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "8YyHoZv9"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EsaBs71R' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DDssQMyM' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'f7cMdSlV' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kJIQChRt' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sldk6DPb' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE