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
    --limit '39' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "u1Emw93d", "description": "uLdEz7kg", "globalRules": [{"allowedAction": "KBR1L5Ty", "ruleDetail": [{"ruleAttribute": "PRJbm2pC", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8479900011969338}, {"ruleAttribute": "kCAhRz3O", "ruleCriteria": "EQUAL", "ruleValue": 0.4626277305016303}, {"ruleAttribute": "7443aCZC", "ruleCriteria": "EQUAL", "ruleValue": 0.2162072762418351}]}, {"allowedAction": "uEvjRxfl", "ruleDetail": [{"ruleAttribute": "55gxG5QJ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.16738922100206732}, {"ruleAttribute": "VwF54Ofj", "ruleCriteria": "MAXIMUM", "ruleValue": 0.13045623535947481}, {"ruleAttribute": "XoFLkLZs", "ruleCriteria": "MINIMUM", "ruleValue": 0.42255567285513396}]}, {"allowedAction": "Ov4IJ3Sj", "ruleDetail": [{"ruleAttribute": "oyQnyX4P", "ruleCriteria": "MAXIMUM", "ruleValue": 0.09990697218973699}, {"ruleAttribute": "W5YjrnjP", "ruleCriteria": "MAXIMUM", "ruleValue": 0.1342144706267847}, {"ruleAttribute": "NjxA5HWN", "ruleCriteria": "MINIMUM", "ruleValue": 0.25878178951762465}]}], "groupAdminRoleId": "hPwaFs9t", "groupMaxMember": 23, "groupMemberRoleId": "vLBzYdKW", "name": "bzs0vnqo"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'WqXW9iHm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'h6sfMO8i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'I9lNKJqg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "b1QMCO6S", "groupMaxMember": 5, "name": "z5MeiAl3"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '2EV266tT' \
    --configurationCode 'R6Ju1QWB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "suVj0kSI", "ruleCriteria": "MINIMUM", "ruleValue": 0.7637038273661565}, {"ruleAttribute": "XWQTX60W", "ruleCriteria": "EQUAL", "ruleValue": 0.07069508769027633}, {"ruleAttribute": "mHQj3IaA", "ruleCriteria": "EQUAL", "ruleValue": 0.21728454322751456}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'Cvt9EDBc' \
    --configurationCode 'IxppLY2S' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'w9gbkqie' \
    --groupName 'QqLkAvX7' \
    --groupRegion '0f1FurAz' \
    --limit '18' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'ar88NvOP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'rOGsXX3h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'lNrTALDU' \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '13' \
    --order '4GVKgakv' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "S2GMpypW", "memberRolePermissions": [{"action": 5, "resourceName": "SnGVHuTF"}, {"action": 39, "resourceName": "SHsJ3rxI"}, {"action": 50, "resourceName": "smojAd1V"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'BkCuzsBn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'kB4YDWmj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'JEwYrryZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "gnkEhMBy"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'RtH61vI9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 93, "resourceName": "vjLAwOaQ"}, {"action": 21, "resourceName": "Zh98FR09"}, {"action": 61, "resourceName": "B65HMH8h"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName '8CuwUudz' \
    --groupRegion 'NwsQ8Nif' \
    --limit '10' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "VVsHJ1Vj", "customAttributes": {"KVCeUOmw": {}, "4iiODUnG": {}, "Amhv2EiO": {}}, "groupDescription": "9k5u3zUG", "groupIcon": "hyx8m6fj", "groupMaxMember": 30, "groupName": "PWs07SDr", "groupRegion": "TXUDZ7Co", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "1nLyIb6k", "ruleDetail": [{"ruleAttribute": "bXWAriq2", "ruleCriteria": "MAXIMUM", "ruleValue": 0.054163102707217914}, {"ruleAttribute": "xUTvkMew", "ruleCriteria": "MINIMUM", "ruleValue": 0.7381930775806858}, {"ruleAttribute": "bJasyxVD", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5205014935010482}]}, {"allowedAction": "wL3CzKfV", "ruleDetail": [{"ruleAttribute": "iAWPIRtm", "ruleCriteria": "EQUAL", "ruleValue": 0.5409191944970432}, {"ruleAttribute": "AvxMlKsl", "ruleCriteria": "MAXIMUM", "ruleValue": 0.27152567457723886}, {"ruleAttribute": "d6ZpE1nq", "ruleCriteria": "EQUAL", "ruleValue": 0.42801486622854923}]}, {"allowedAction": "Iaqqu1mr", "ruleDetail": [{"ruleAttribute": "xmavix7c", "ruleCriteria": "MINIMUM", "ruleValue": 0.2830191732452991}, {"ruleAttribute": "zFgilofs", "ruleCriteria": "MINIMUM", "ruleValue": 0.6415232598598047}, {"ruleAttribute": "YwRndZMV", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4446931966265808}]}]}, "groupType": "RpabnKGT"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'fzGg8N2c' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId '5wFTXQk3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "kjNWKl6P", "groupIcon": "KgpeCshp", "groupName": "0Y1vJ1tU", "groupRegion": "sHy9rZDR", "groupType": "azkt6Mdx"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'AsjALotS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'eeVph8ez' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "XO8z4AMA", "groupIcon": "XOioubHJ", "groupName": "oiaXgJa7", "groupRegion": "aGZ4Iiy6", "groupType": "twoXZNGm"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'APbkcwmo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"0s0WznxN": {}, "YNCivD0e": {}, "RTsDU7Cs": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'BdmyYQEr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'Yg8OhdTz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'fYdVvOWr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'Ry9ZI3rF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'cGIb6iT7' \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId '0O9iOBHF' \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '74' \
    --order '4uBs74kD' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'iiqx2iuH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"ax3RttRW": {}, "Rowch8iD": {}, "PDZnFvfb": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'vMfWjZTO' \
    --groupId '1PILCXeJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "bRjUO2NT", "ruleCriteria": "MINIMUM", "ruleValue": 0.8232981436297213}, {"ruleAttribute": "txX1u9Ix", "ruleCriteria": "MINIMUM", "ruleValue": 0.659951366292976}, {"ruleAttribute": "t3VJ1UKb", "ruleCriteria": "MAXIMUM", "ruleValue": 0.46340240013516565}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'KaJuT6kN' \
    --groupId 'DDS6hp3v' \
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
    --limit '63' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId '0c0SqRnL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "8X0yCUDa"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'SKlxrPOM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "FD0qAgje"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'shr9j2Vb' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MDOJNwIR' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eGMsmxF4' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'loQ13zWP' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zAiW0tBZ' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE