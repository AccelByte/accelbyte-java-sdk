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
    --offset '34' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "JKiJNlU9", "description": "sp64wXAf", "globalRules": [{"allowedAction": "0W85ZGRX", "ruleDetail": [{"ruleAttribute": "HGD4P8ba", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9841463614090484}, {"ruleAttribute": "SSLI9zDn", "ruleCriteria": "MINIMUM", "ruleValue": 0.4619205010829526}, {"ruleAttribute": "ZAWiYonn", "ruleCriteria": "MAXIMUM", "ruleValue": 0.04481436718699727}]}, {"allowedAction": "qZBtsU42", "ruleDetail": [{"ruleAttribute": "pJJVv6Cs", "ruleCriteria": "MAXIMUM", "ruleValue": 0.42878222444773206}, {"ruleAttribute": "6Dzy7bkh", "ruleCriteria": "MINIMUM", "ruleValue": 0.6098607315721197}, {"ruleAttribute": "ig0QFVa1", "ruleCriteria": "MINIMUM", "ruleValue": 0.7533432286282633}]}, {"allowedAction": "LXPv2gn7", "ruleDetail": [{"ruleAttribute": "c3jRycC7", "ruleCriteria": "MINIMUM", "ruleValue": 0.9855607261334238}, {"ruleAttribute": "a53r0dQC", "ruleCriteria": "MAXIMUM", "ruleValue": 0.03652208635314336}, {"ruleAttribute": "mDcOMM6C", "ruleCriteria": "EQUAL", "ruleValue": 0.030911036330222075}]}], "groupAdminRoleId": "wH1XU4K1", "groupMaxMember": 81, "groupMemberRoleId": "swPrmaer", "name": "Um9BsQHa"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'AFfaBp8T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'xX1WGiCN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'QQxOEtBF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "8oMiph5E", "groupMaxMember": 88, "name": "u4xNwMqe"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'zH4Blhey' \
    --configurationCode 'GBq0c5Vy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "gZtSvtT2", "ruleCriteria": "MAXIMUM", "ruleValue": 0.12910997491048404}, {"ruleAttribute": "G9U0cTFG", "ruleCriteria": "MINIMUM", "ruleValue": 0.48463567436685495}, {"ruleAttribute": "UOPjeSf6", "ruleCriteria": "MINIMUM", "ruleValue": 0.7085007413625004}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'BpuLhMSa' \
    --configurationCode 'Akz85EK5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'I7I65GVn' \
    --groupName 'Xwrqzvw9' \
    --groupRegion 'O3djcWGL' \
    --limit '62' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'zmvvadOF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'LDWDyiIf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'MVW8JHfN' \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '58' \
    --order 'yXNe3f9N' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "GwO1whwK", "memberRolePermissions": [{"action": 32, "resourceName": "WHLQ922O"}, {"action": 7, "resourceName": "PUDGGxO9"}, {"action": 92, "resourceName": "du4VCEUA"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId '7EsZz2ty' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'kn3OGE3U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'TdgWU2Sp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "nnH5VIrV"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId '6Y855HOA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 73, "resourceName": "UF2FXPLz"}, {"action": 9, "resourceName": "JImWrPox"}, {"action": 63, "resourceName": "SnygPCqv"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'BMDTGcGf' \
    --groupRegion 'dSVJSJ1Z' \
    --limit '57' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "sflshihg", "customAttributes": {"eRlESbHa": {}, "r7iUpOJI": {}, "vx4gSBjs": {}}, "groupDescription": "QlisG7hQ", "groupIcon": "y4xMAbDI", "groupMaxMember": 21, "groupName": "x4SIyju3", "groupRegion": "5GVlM9m3", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "c0olS48P", "ruleDetail": [{"ruleAttribute": "QU2jwBFa", "ruleCriteria": "EQUAL", "ruleValue": 0.7617660314106465}, {"ruleAttribute": "lT6U1KR1", "ruleCriteria": "MINIMUM", "ruleValue": 0.7880912841975153}, {"ruleAttribute": "QmhCPLMd", "ruleCriteria": "EQUAL", "ruleValue": 0.7119126858155097}]}, {"allowedAction": "VrAkx4HF", "ruleDetail": [{"ruleAttribute": "CsniIvDG", "ruleCriteria": "EQUAL", "ruleValue": 0.15912034115913243}, {"ruleAttribute": "vJDFVrDk", "ruleCriteria": "MINIMUM", "ruleValue": 0.5502642782854601}, {"ruleAttribute": "l0TFhHs0", "ruleCriteria": "MINIMUM", "ruleValue": 0.9497159933637674}]}, {"allowedAction": "GahbzLLf", "ruleDetail": [{"ruleAttribute": "bcNsPqn3", "ruleCriteria": "EQUAL", "ruleValue": 0.2378966136979398}, {"ruleAttribute": "PW7qWfiD", "ruleCriteria": "EQUAL", "ruleValue": 0.32560122826839466}, {"ruleAttribute": "bEh5ozlD", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7938996876571427}]}]}, "groupType": "nEC1QMtL"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'VymU26Y8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'CTTxEdxg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "Y7a1QpEJ", "groupIcon": "59QKGdxN", "groupName": "cOxSJlsq", "groupRegion": "GZX2HGb4", "groupType": "1RR18jSs"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'qDMmXmA1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId '0xUywY5g' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "ywfXGZSZ", "groupIcon": "MiqOWidK", "groupName": "bZFWRsTw", "groupRegion": "tRQTUsJ4", "groupType": "MGZaBJUG"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'BTAFQiiW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"CIvb1GBF": {}, "BmaTg5hc": {}, "Gf3X2jLP": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'LwVSCf1t' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'M8oC7cJ2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'NeYoo8Yr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'yhKFH9Se' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId '70q0BbNr' \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'ViRvayhT' \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '32' \
    --order 'w0tb9Kax' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'zWaNlPRe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"NlHB0lqf": {}, "0JbZAR0l": {}, "QdxWDic8": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'HsWUcPS3' \
    --groupId 'BLRXCoSn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "iccWs6Ej", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9023515682469249}, {"ruleAttribute": "HQ5JXI8y", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7054325245308404}, {"ruleAttribute": "ruNgueiC", "ruleCriteria": "MINIMUM", "ruleValue": 0.7859674887630025}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'F4jf44n1' \
    --groupId '3L6fuGdS' \
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
    --limit '98' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'IVPcj14n' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "0K9Ecd7k"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'yonNnbQJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "xKINNvQ8"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rrhmv5Cd' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'z2XFTSS3' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '6PCj8m6e' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DKQ3J6uI' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'D0CGQpsI' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE