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
    --limit '56' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "h8LELR2B", "description": "kmAem3w8", "globalRules": [{"allowedAction": "loMeDl3b", "ruleDetail": [{"ruleAttribute": "qACVrdho", "ruleCriteria": "MINIMUM", "ruleValue": 0.006161141200059839}, {"ruleAttribute": "8le31OMB", "ruleCriteria": "EQUAL", "ruleValue": 0.19074339968605503}, {"ruleAttribute": "TCzgkoPk", "ruleCriteria": "MINIMUM", "ruleValue": 0.9295864084305449}]}, {"allowedAction": "yumlzFQv", "ruleDetail": [{"ruleAttribute": "Kjdnztwn", "ruleCriteria": "EQUAL", "ruleValue": 0.12965669360654863}, {"ruleAttribute": "RNrrzND8", "ruleCriteria": "EQUAL", "ruleValue": 0.07815365438933641}, {"ruleAttribute": "y9F5bpZu", "ruleCriteria": "EQUAL", "ruleValue": 0.5616227345546444}]}, {"allowedAction": "qLPC96Q4", "ruleDetail": [{"ruleAttribute": "OST4E9nM", "ruleCriteria": "EQUAL", "ruleValue": 0.6332947823457036}, {"ruleAttribute": "rUczHP4z", "ruleCriteria": "MAXIMUM", "ruleValue": 0.23765292250427805}, {"ruleAttribute": "KraGRxGR", "ruleCriteria": "MINIMUM", "ruleValue": 0.07162603897850417}]}], "groupAdminRoleId": "MWLmGSdS", "groupMaxMember": 96, "groupMemberRoleId": "Fksp6muX", "name": "FUA8bm3a"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'kNbz9KNe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'ITewohBu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'BlcdIZf3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "tGxmyrjc", "groupMaxMember": 90, "name": "koZPRzns"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'DZKUPDdg' \
    --configurationCode 'Hwiokegd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "GvUxPlCN", "ruleCriteria": "MINIMUM", "ruleValue": 0.8875538952762545}, {"ruleAttribute": "TYh1WiQR", "ruleCriteria": "EQUAL", "ruleValue": 0.9424305417372485}, {"ruleAttribute": "nAnOAVPo", "ruleCriteria": "EQUAL", "ruleValue": 0.7124031011655624}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'KhLXPaye' \
    --configurationCode 'Ugyk3SBe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'h7H4RJZo' \
    --groupName 'jsg25NdQ' \
    --groupRegion 'VrMNXqGM' \
    --limit '40' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'XAno0wXE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'oJbHei1l' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'GyR5XCX0' \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '12' \
    --order 'QnNRg1m9' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "hZmInFzi", "memberRolePermissions": [{"action": 59, "resourceName": "Qp5KtSGs"}, {"action": 51, "resourceName": "73D3BgHu"}, {"action": 62, "resourceName": "WqHXMrF4"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'RevCRoRC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'kaAyOHFt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId '3PttFlHC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "spKOgoLx"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'GbIamRIY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 3, "resourceName": "PMwMfH0J"}, {"action": 92, "resourceName": "ydZbTFna"}, {"action": 3, "resourceName": "gBz66nLG"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'uYpglHYj' \
    --groupRegion 'QoNjifXT' \
    --limit '91' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "aDSTdloE", "customAttributes": {"2uG4al7J": {}, "HOSUflcU": {}, "dVNMacsr": {}}, "groupDescription": "JKIQzqva", "groupIcon": "M31jqvhw", "groupMaxMember": 72, "groupName": "nMkbqxdg", "groupRegion": "38rN67mK", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "gtBK8sFL", "ruleDetail": [{"ruleAttribute": "cOrwLBoB", "ruleCriteria": "MINIMUM", "ruleValue": 0.6643363909552886}, {"ruleAttribute": "7CRW1eKp", "ruleCriteria": "EQUAL", "ruleValue": 0.32703798200822354}, {"ruleAttribute": "c5V4o3Kp", "ruleCriteria": "MINIMUM", "ruleValue": 0.5875147272739142}]}, {"allowedAction": "Rq07U10e", "ruleDetail": [{"ruleAttribute": "xE8YcoGu", "ruleCriteria": "MINIMUM", "ruleValue": 0.1632687671602504}, {"ruleAttribute": "B9N6pP8m", "ruleCriteria": "MINIMUM", "ruleValue": 0.9027861385814555}, {"ruleAttribute": "hOLTqw7j", "ruleCriteria": "MINIMUM", "ruleValue": 0.8649001638759474}]}, {"allowedAction": "Ch7K5o3T", "ruleDetail": [{"ruleAttribute": "I9WHWdBa", "ruleCriteria": "MAXIMUM", "ruleValue": 0.39087371083436506}, {"ruleAttribute": "br6ZBuM9", "ruleCriteria": "EQUAL", "ruleValue": 0.033074346030319335}, {"ruleAttribute": "LeKPv5sT", "ruleCriteria": "MINIMUM", "ruleValue": 0.6780570636355874}]}]}, "groupType": "jwDNtlQC"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId '45pZqYad' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'lwXKJfXr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "daObcLGj", "groupIcon": "c4vcbJwy", "groupName": "m1YJCNef", "groupRegion": "V03Nb3Xj", "groupType": "sXofrrjf"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'VJjj4kYF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'xky8vXCt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "PPXsDzzX", "groupIcon": "T5VfPHEH", "groupName": "M6qWhvxk", "groupRegion": "z1TuYmsZ", "groupType": "deADvbi8"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'P1Ve0OLc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"jpBrmHIC": {}, "nOd1Ad3P": {}, "b43hi41A": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'tHyM7wbR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'AVQsKJXe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'wHendCqX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'm0U96qgX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'AvHJ4es2' \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'qa0q3YgR' \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '78' \
    --order 'eh2RaBLR' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId '8nfsErB5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"V9g4AREZ": {}, "iqPJz60S": {}, "oiDiKh3h": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'fDi38Ctv' \
    --groupId 'Ck2JRNN9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "45r34INy", "ruleCriteria": "EQUAL", "ruleValue": 0.7278697503492647}, {"ruleAttribute": "aVndi1SF", "ruleCriteria": "MINIMUM", "ruleValue": 0.9132363366654654}, {"ruleAttribute": "mgmkGbrR", "ruleCriteria": "EQUAL", "ruleValue": 0.9824825577165576}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'hCgNdRT2' \
    --groupId 'CVWYOKcJ' \
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
    --limit '6' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'rMOK3tKz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "n2y9npnV"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'J60BoMNd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "FNY9nlNl"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IaW6Y25e' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hSBhxbg9' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'K6xVQaG3' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '8jyvTSE3' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YAkl1H5E' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE