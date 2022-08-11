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
    --limit '85' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "sBjzB3qU", "description": "ydCCgh3n", "globalRules": [{"allowedAction": "YigCGeDw", "ruleDetail": [{"ruleAttribute": "9SBRq5Yz", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3699745644448851}, {"ruleAttribute": "Z6SxacTX", "ruleCriteria": "EQUAL", "ruleValue": 0.853870292814455}, {"ruleAttribute": "hFNfxLcC", "ruleCriteria": "MINIMUM", "ruleValue": 0.6403970747975516}]}, {"allowedAction": "okG5n1hc", "ruleDetail": [{"ruleAttribute": "Gsy8FpOP", "ruleCriteria": "MINIMUM", "ruleValue": 0.06788585706199923}, {"ruleAttribute": "tsdRUYmI", "ruleCriteria": "EQUAL", "ruleValue": 0.6469691714624956}, {"ruleAttribute": "c3chlypN", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7646967152398779}]}, {"allowedAction": "aR2JcBXq", "ruleDetail": [{"ruleAttribute": "au89V5cr", "ruleCriteria": "EQUAL", "ruleValue": 0.5295842959604297}, {"ruleAttribute": "9pjQdZso", "ruleCriteria": "MINIMUM", "ruleValue": 0.3342451544229278}, {"ruleAttribute": "mJUBwj40", "ruleCriteria": "MINIMUM", "ruleValue": 0.007735273961604894}]}], "groupAdminRoleId": "sel2ExO4", "groupMaxMember": 97, "groupMemberRoleId": "xFkkXWxZ", "name": "fzZTzBCt"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'zhuYmPj5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'iCaqyAn4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'kXk8v7xc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "117LgBSy", "groupMaxMember": 17, "name": "2r3wHRly"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '6pnq27cR' \
    --configurationCode 'WujNR3ce' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "qnjl72bP", "ruleCriteria": "EQUAL", "ruleValue": 0.25204593077836945}, {"ruleAttribute": "UaROIm2B", "ruleCriteria": "EQUAL", "ruleValue": 0.44102212155829146}, {"ruleAttribute": "bOSZwla9", "ruleCriteria": "MINIMUM", "ruleValue": 0.5463601933519491}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'bk0thBbd' \
    --configurationCode '7d0IkMVK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'oHLq48hn' \
    --groupName 'TllSJ0R1' \
    --groupRegion 'NdqLgeQM' \
    --limit '65' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'qiN6O1NC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'UEDyTxkI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'jedtZxcP' \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '39' \
    --order 'EW8C0E7T' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "iZUMfeXX", "memberRolePermissions": [{"action": 75, "resourceName": "1oTmdPGc"}, {"action": 3, "resourceName": "hiXo4wN8"}, {"action": 82, "resourceName": "SfatK1AN"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'iwk5BRkp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'zmHwfrjs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'HjZkmxU1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "Ke1WFont"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'e5QfqK22' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 62, "resourceName": "4lk07rQZ"}, {"action": 92, "resourceName": "oAZfDY9l"}, {"action": 5, "resourceName": "XAzlumGa"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName '5PmSY2LI' \
    --groupRegion '3M9ORDgp' \
    --limit '70' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "bVKH0HaA", "customAttributes": {"shNyHxUR": {}, "W36Mi9qr": {}, "7Yv7CokG": {}}, "groupDescription": "41S0PP0C", "groupIcon": "EZhobNjf", "groupMaxMember": 11, "groupName": "USEcenh4", "groupRegion": "VqW9rkLT", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "Xes8hVmd", "ruleDetail": [{"ruleAttribute": "p2eK3soi", "ruleCriteria": "EQUAL", "ruleValue": 0.14047615193290852}, {"ruleAttribute": "UpfSUpP5", "ruleCriteria": "MINIMUM", "ruleValue": 0.48152291528744473}, {"ruleAttribute": "oHvnEHHG", "ruleCriteria": "EQUAL", "ruleValue": 0.23119503111884931}]}, {"allowedAction": "wYbuiJ82", "ruleDetail": [{"ruleAttribute": "hoCI70VG", "ruleCriteria": "MAXIMUM", "ruleValue": 0.31022721793815944}, {"ruleAttribute": "mi8FlxuC", "ruleCriteria": "MINIMUM", "ruleValue": 0.9926523186713548}, {"ruleAttribute": "4IsFobgp", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7766179211291306}]}, {"allowedAction": "jUYcnSf7", "ruleDetail": [{"ruleAttribute": "VIZsexwA", "ruleCriteria": "MINIMUM", "ruleValue": 0.11250220144910039}, {"ruleAttribute": "KHQY3nWL", "ruleCriteria": "MAXIMUM", "ruleValue": 0.050575166644222236}, {"ruleAttribute": "d697GfVf", "ruleCriteria": "MINIMUM", "ruleValue": 0.7523202660249148}]}]}, "groupType": "DKSOa0AA"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'odOKRJq4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'btfUFqPC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "MCRvQ3iO", "groupIcon": "9bWKoT1C", "groupName": "CB4kH4ft", "groupRegion": "iHyXhfbW", "groupType": "m6AwL8wS"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'lboqrsN2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'xjjfO4Jw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "BG6dXACu", "groupIcon": "eKSQ285C", "groupName": "kqxzckru", "groupRegion": "eMOrVLdK", "groupType": "PEQo5s0W"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'ViQNbzNb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"yZWVJUzf": {}, "Dk1321TD": {}, "h30PEz6e": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId '0HXD1idA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'NyOMyvaP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'QQJYiQsk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'zkJgpKh0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'M0KioCuh' \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'EVvIzwoa' \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '85' \
    --order 'CrE8us0l' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'm8bH7o0R' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"9dJSlAdM": {}, "H5hXsHX0": {}, "CQmyCEFr": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 't5c6JqrB' \
    --groupId 'O967VuTf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "rsjmQQzm", "ruleCriteria": "EQUAL", "ruleValue": 0.8461366438279703}, {"ruleAttribute": "6u0ZONbV", "ruleCriteria": "EQUAL", "ruleValue": 0.5339611636496254}, {"ruleAttribute": "zOYoVk7l", "ruleCriteria": "EQUAL", "ruleValue": 0.9232241211858988}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'VWcfr5oi' \
    --groupId 'y8a66KM4' \
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
    --limit '89' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'JilWRvRY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "xCwc95k5"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'yHddQY1M' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "IxqzPRpe"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FuO0KgzO' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'N2o8owaU' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OeO4eiX9' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QjTNSAPt' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '6ceSD9Eb' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE