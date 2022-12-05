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
    --limit '6' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "dsazvldp", "description": "QAc7GmE6", "globalRules": [{"allowedAction": "bM2GKJ6u", "ruleDetail": [{"ruleAttribute": "1gRlI5JB", "ruleCriteria": "EQUAL", "ruleValue": 0.8969098577758777}, {"ruleAttribute": "wP7Regai", "ruleCriteria": "EQUAL", "ruleValue": 0.9021658091558096}, {"ruleAttribute": "ElVildvX", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6413236558488699}]}, {"allowedAction": "SOlt12wV", "ruleDetail": [{"ruleAttribute": "buJp9gI5", "ruleCriteria": "EQUAL", "ruleValue": 0.788458627869241}, {"ruleAttribute": "tgr6at3b", "ruleCriteria": "MINIMUM", "ruleValue": 0.1101532986492959}, {"ruleAttribute": "UzL8msrk", "ruleCriteria": "MINIMUM", "ruleValue": 0.4050914939355511}]}, {"allowedAction": "pThPKWAf", "ruleDetail": [{"ruleAttribute": "50S1cJkx", "ruleCriteria": "EQUAL", "ruleValue": 0.07774289998551343}, {"ruleAttribute": "5pgmmdHf", "ruleCriteria": "EQUAL", "ruleValue": 0.3323995140501994}, {"ruleAttribute": "aBaMRsei", "ruleCriteria": "MINIMUM", "ruleValue": 0.37980283835324635}]}], "groupAdminRoleId": "ymtlY0QJ", "groupMaxMember": 93, "groupMemberRoleId": "ejPkCxcD", "name": "iHy438dC"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'xOeUbzYO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'bAVEl5HD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'kyQPVtGZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "kYGraLLF", "groupMaxMember": 94, "name": "BZfqjBnZ"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'iFX0L9yo' \
    --configurationCode '48R6aZq4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "0tuGHltm", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4342417414982074}, {"ruleAttribute": "z6f1FmE3", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8857050656395933}, {"ruleAttribute": "Xu4YO93E", "ruleCriteria": "MINIMUM", "ruleValue": 0.4708391657752624}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'xvDBusOj' \
    --configurationCode '5px4N8v9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'sbWAsYHV' \
    --groupName 'aZV7e8CP' \
    --groupRegion 'bFhBXbay' \
    --limit '88' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'llYtfoAA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'YoBcB7Nj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId '6bV6f9Hr' \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '37' \
    --order 'zfCfT8si' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "Ga80l4IT", "memberRolePermissions": [{"action": 27, "resourceName": "ZeLL9swi"}, {"action": 21, "resourceName": "zAXgPw8O"}, {"action": 82, "resourceName": "Bw9HfbGO"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'KMYXwa1f' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'BUYfum6w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'vuDTkQyY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "SuqRSabW"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'jnzn1KFt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 86, "resourceName": "pFAXBJoX"}, {"action": 45, "resourceName": "tzE7Dsou"}, {"action": 43, "resourceName": "jsQE6TqL"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'YdH6GRHD' \
    --groupRegion 'DrL79Kw7' \
    --limit '30' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "fm7gcorf", "customAttributes": {"jUHOCJAH": {}, "eYQzbXTD": {}, "HrzqvnWG": {}}, "groupDescription": "ZIiLPgl1", "groupIcon": "aXxJHAEg", "groupMaxMember": 31, "groupName": "LhgJvhex", "groupRegion": "p4cTQAlJ", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "QorlQzLM", "ruleDetail": [{"ruleAttribute": "dnMqgsl5", "ruleCriteria": "MINIMUM", "ruleValue": 0.18750772551130745}, {"ruleAttribute": "MM35m4cc", "ruleCriteria": "MAXIMUM", "ruleValue": 0.12754940859118258}, {"ruleAttribute": "cfRrQgoZ", "ruleCriteria": "MINIMUM", "ruleValue": 0.5197921484760385}]}, {"allowedAction": "FppZ5gCF", "ruleDetail": [{"ruleAttribute": "xEXcB8rR", "ruleCriteria": "EQUAL", "ruleValue": 0.011058853911439903}, {"ruleAttribute": "vd96zDA1", "ruleCriteria": "MAXIMUM", "ruleValue": 0.852837001162262}, {"ruleAttribute": "dCBaynxm", "ruleCriteria": "MINIMUM", "ruleValue": 0.9480993068244247}]}, {"allowedAction": "cYwYQvEC", "ruleDetail": [{"ruleAttribute": "EXJ621YR", "ruleCriteria": "MINIMUM", "ruleValue": 0.3482536942726603}, {"ruleAttribute": "k4sLg2sJ", "ruleCriteria": "EQUAL", "ruleValue": 0.6949951365210917}, {"ruleAttribute": "0tm7wmUT", "ruleCriteria": "MINIMUM", "ruleValue": 0.48810279179041294}]}]}, "groupType": "FM54cASB"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'ZDsGBROH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'BkOGZz70' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "5fSRgrlw", "groupIcon": "sIV5PUJq", "groupName": "LNlXOr6X", "groupRegion": "hpp9UwK9", "groupType": "ZEwobEEm"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'QsAOxg6c' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'GFh8AwiM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "Bj5DAhfo", "groupIcon": "BaXH85Tp", "groupName": "Mj0Sk1Om", "groupRegion": "zmX94lrb", "groupType": "9xPU4BbZ"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'ww5L1NQK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"YNs017Nx": {}, "ZqgxdtQ8": {}, "8eIJfalQ": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'TEBilp39' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'eBeVb7El' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'g6Zcy8Py' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'furCj9Op' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'hAGQLrqC' \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'a4qTMkgO' \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '57' \
    --order 'iRYlYsTB' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'O0aX6Fpv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"yZ2dcics": {}, "RQM6rEvj": {}, "k4olBAIa": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'KHoC7aKZ' \
    --groupId 'osl959y3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "IYjuoPAk", "ruleCriteria": "EQUAL", "ruleValue": 0.05915579220285583}, {"ruleAttribute": "13FZxdt0", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5415869706353517}, {"ruleAttribute": "JG5qbL6R", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7699255238017305}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'ij1Kgu2J' \
    --groupId 'su9ihg6g' \
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
    --limit '28' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'mHAjjLOy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "LUTPHDmm"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'Hkqbh1xH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "7iZjDQge"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EAlNNMp2' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xHoyxpO7' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'h0jLDVVy' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'E1PCOQJA' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '3gloplrd' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE