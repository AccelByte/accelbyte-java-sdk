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
    --limit '71' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "kFOJD0OL", "description": "zB5aERJJ", "globalRules": [{"allowedAction": "aJcfTeHE", "ruleDetail": [{"ruleAttribute": "a9qCj778", "ruleCriteria": "EQUAL", "ruleValue": 0.8109854522370007}, {"ruleAttribute": "T7XXOMGN", "ruleCriteria": "EQUAL", "ruleValue": 0.381874997204839}, {"ruleAttribute": "azrA2RX5", "ruleCriteria": "MINIMUM", "ruleValue": 0.3265368671758613}]}, {"allowedAction": "ksZq1W5m", "ruleDetail": [{"ruleAttribute": "6HxkAThz", "ruleCriteria": "MINIMUM", "ruleValue": 0.29702515072324465}, {"ruleAttribute": "2dfsQmy6", "ruleCriteria": "EQUAL", "ruleValue": 0.6657580294864719}, {"ruleAttribute": "T6xxtECy", "ruleCriteria": "MAXIMUM", "ruleValue": 0.33068418199025484}]}, {"allowedAction": "rooW5txT", "ruleDetail": [{"ruleAttribute": "3IRw46iT", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6202877795494779}, {"ruleAttribute": "0a9A1w8O", "ruleCriteria": "EQUAL", "ruleValue": 0.8230566261561192}, {"ruleAttribute": "gwecLXrJ", "ruleCriteria": "MINIMUM", "ruleValue": 0.40393533305208984}]}], "groupAdminRoleId": "9eS8PyA8", "groupMaxMember": 17, "groupMemberRoleId": "HRhnU6St", "name": "zt504UE0"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'uhnw3jWU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'tAwkicKN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode '67craLY3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "bL6nJHFN", "groupMaxMember": 86, "name": "q0JtiVgV"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'VzPJ5atc' \
    --configurationCode 'WTkR1xAd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "BhowxZsf", "ruleCriteria": "EQUAL", "ruleValue": 0.6201310627191332}, {"ruleAttribute": "f1tV9fwR", "ruleCriteria": "EQUAL", "ruleValue": 0.29684624129381165}, {"ruleAttribute": "NenQ8WSS", "ruleCriteria": "MINIMUM", "ruleValue": 0.005712096421640389}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'YLqHCLoF' \
    --configurationCode 'hkXGNAux' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'oN3UJO8v' \
    --groupName '3Myo7PL9' \
    --groupRegion 'BTD1g1v5' \
    --limit '84' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'TTbU53gO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'CDZCd6GO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'sdbSzZbP' \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '15' \
    --order 'LAXo9tnt' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "QYBDMEjQ", "memberRolePermissions": [{"action": 59, "resourceName": "QHyJ0aVA"}, {"action": 93, "resourceName": "ldjCqH0L"}, {"action": 21, "resourceName": "zyv6CiPV"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'skZbDwuY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'ANl1sZJx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'nX8bxtbC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "r1CqTlOv"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'kKZap7xa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 13, "resourceName": "UvS0Nehw"}, {"action": 75, "resourceName": "otmgPmA9"}, {"action": 81, "resourceName": "vJksT1qG"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'VaeoJ3xM' \
    --groupRegion 'wMFKYBPq' \
    --limit '11' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "yH9oi31W", "customAttributes": {"KfrjRWCQ": {}, "lhmWdVse": {}, "zMXKV7UZ": {}}, "groupDescription": "U4jijjkp", "groupIcon": "RBHg2k46", "groupMaxMember": 21, "groupName": "OcwYpb3u", "groupRegion": "YmUjbq5p", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "M6aL0zHv", "ruleDetail": [{"ruleAttribute": "eDMC6J5N", "ruleCriteria": "EQUAL", "ruleValue": 0.08179877122352297}, {"ruleAttribute": "Yv0JAi4I", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9843038865607511}, {"ruleAttribute": "naoJphgF", "ruleCriteria": "EQUAL", "ruleValue": 0.7419237112529258}]}, {"allowedAction": "PUVR9pyk", "ruleDetail": [{"ruleAttribute": "PJXmmR5c", "ruleCriteria": "MAXIMUM", "ruleValue": 0.44697928419400956}, {"ruleAttribute": "hpNCLPWk", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9563035586686811}, {"ruleAttribute": "8bCo05Mq", "ruleCriteria": "EQUAL", "ruleValue": 0.5376691855527619}]}, {"allowedAction": "iJknoNjz", "ruleDetail": [{"ruleAttribute": "htXGa8qW", "ruleCriteria": "MINIMUM", "ruleValue": 0.7816165821995493}, {"ruleAttribute": "p1egxOej", "ruleCriteria": "EQUAL", "ruleValue": 0.4345466931952201}, {"ruleAttribute": "FjJpXsk7", "ruleCriteria": "MAXIMUM", "ruleValue": 0.145129290585418}]}]}, "groupType": "mOTIALIg"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'hDaRihq6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'wp0Al69z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "n88f8lA4", "groupIcon": "50gbplkr", "groupName": "DrKrC9IZ", "groupRegion": "2OUHwr6p", "groupType": "bbTqDA0f"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'Q5RkPob3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'VQYk1FvZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "A1tPGVt9", "groupIcon": "rIBrm9f3", "groupName": "rHxzf7cY", "groupRegion": "fhqwY1ki", "groupType": "4NBIqrWv"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'EVBuPQl9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"TbuTFSn9": {}, "m1Zfpbi0": {}, "r3reZeGl": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'eseK03G4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'Q7ISJRQx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId '4gYPycIC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'rOht14bF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId '5hnSQmG9' \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'mHCz5gW5' \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '67' \
    --order 'DHlWU4ld' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'FoVJxP7F' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"RHf445Ml": {}, "JE29NL4M": {}, "aafsJou6": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'qvRVrMVg' \
    --groupId 'ZLhWl6w0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "eD6zb3e4", "ruleCriteria": "EQUAL", "ruleValue": 0.5733258971596478}, {"ruleAttribute": "C1L24ue4", "ruleCriteria": "MINIMUM", "ruleValue": 0.8061444621708433}, {"ruleAttribute": "JXErAOk8", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8172386427562244}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'bZMAofaL' \
    --groupId 'H9o0Gbyh' \
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
    --limit '8' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'ch8QCU44' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "O4s1lAiF"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'X9xxVoiw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "PPcnVV0Y"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ivopAFnY' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KkNK1cCh' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RRlIsk9q' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q0RrcUVw' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cBRgWS87' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE