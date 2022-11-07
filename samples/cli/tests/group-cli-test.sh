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
    --limit '55' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "tlWID2Fu", "description": "R8tpHkdX", "globalRules": [{"allowedAction": "yFCuQ7Mk", "ruleDetail": [{"ruleAttribute": "GYV0adbi", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8519406263283092}, {"ruleAttribute": "pV6c18L8", "ruleCriteria": "MINIMUM", "ruleValue": 0.8580085101604187}, {"ruleAttribute": "b72CJg1X", "ruleCriteria": "MINIMUM", "ruleValue": 0.8292007277084796}]}, {"allowedAction": "5Lfi82fk", "ruleDetail": [{"ruleAttribute": "7fNwSvQH", "ruleCriteria": "EQUAL", "ruleValue": 0.851117426498754}, {"ruleAttribute": "xgN8wkLh", "ruleCriteria": "EQUAL", "ruleValue": 0.09528742268347645}, {"ruleAttribute": "mq4HlkCl", "ruleCriteria": "EQUAL", "ruleValue": 0.04547224870824207}]}, {"allowedAction": "fUxy12n4", "ruleDetail": [{"ruleAttribute": "wQqqPn0y", "ruleCriteria": "MINIMUM", "ruleValue": 0.8267132021972716}, {"ruleAttribute": "vd8dI0NN", "ruleCriteria": "EQUAL", "ruleValue": 0.7875572187729462}, {"ruleAttribute": "Nys1zwrV", "ruleCriteria": "EQUAL", "ruleValue": 0.8057978055621803}]}], "groupAdminRoleId": "OKKXtElQ", "groupMaxMember": 97, "groupMemberRoleId": "4rJDPVoi", "name": "Nzm5beH1"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'DElWBhLG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode '8efizCYc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'dqZVcy6t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "B147C55P", "groupMaxMember": 46, "name": "tMD5AydS"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'VTh8yU33' \
    --configurationCode 'r0QLsSQj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "RYFpnlkb", "ruleCriteria": "EQUAL", "ruleValue": 0.45723037141923883}, {"ruleAttribute": "suPAqlh6", "ruleCriteria": "MINIMUM", "ruleValue": 0.9785263373949116}, {"ruleAttribute": "XNYnQVHl", "ruleCriteria": "MINIMUM", "ruleValue": 0.15631988128920693}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'MYDvwu24' \
    --configurationCode 'nClXtexE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'Xazebz9C' \
    --groupName 'XFeJzOkV' \
    --groupRegion 'RnHF4CFk' \
    --limit '99' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId '5yn9k0RX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'MH5Ls4Yh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'Tzd3LV4E' \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '66' \
    --order 'JSLaun2H' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "lQx157da", "memberRolePermissions": [{"action": 17, "resourceName": "kPkAAJYb"}, {"action": 30, "resourceName": "Mtj34Ogm"}, {"action": 28, "resourceName": "FPpPyxUX"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId '85RixL3f' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'zZKSURRO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'YoiVRkZl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "ZdeM4RvC"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'l3h2nZc5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 31, "resourceName": "vb9yr7nV"}, {"action": 63, "resourceName": "NImxfTvo"}, {"action": 44, "resourceName": "wbbWotAG"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'puJ1wgZA' \
    --groupRegion 'FWed6k6e' \
    --limit '55' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "vavwtSu7", "customAttributes": {"vh58fux6": {}, "Iz8xAHp2": {}, "Pj11uRAW": {}}, "groupDescription": "sZglNPhd", "groupIcon": "ZsuArsEN", "groupMaxMember": 79, "groupName": "ukxVMUze", "groupRegion": "1w35Nj2i", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "yHZZ46RV", "ruleDetail": [{"ruleAttribute": "eLCZU4zD", "ruleCriteria": "EQUAL", "ruleValue": 0.8915671305764319}, {"ruleAttribute": "FwZgwgTJ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2891320320697701}, {"ruleAttribute": "YORMm3w9", "ruleCriteria": "EQUAL", "ruleValue": 0.5716198283059155}]}, {"allowedAction": "dOYeX9Cj", "ruleDetail": [{"ruleAttribute": "9q012jgn", "ruleCriteria": "MINIMUM", "ruleValue": 0.48337467048989746}, {"ruleAttribute": "RDBd1gdN", "ruleCriteria": "MINIMUM", "ruleValue": 0.4101916844491392}, {"ruleAttribute": "UljayvU7", "ruleCriteria": "EQUAL", "ruleValue": 0.26579135865431536}]}, {"allowedAction": "WlKujI0c", "ruleDetail": [{"ruleAttribute": "tNMk0IuC", "ruleCriteria": "MINIMUM", "ruleValue": 0.5833748107880599}, {"ruleAttribute": "grpvOhtt", "ruleCriteria": "MINIMUM", "ruleValue": 0.2693373750984641}, {"ruleAttribute": "SKJl8vfL", "ruleCriteria": "EQUAL", "ruleValue": 0.008557821771943197}]}]}, "groupType": "vfM1HEzY"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'avFsRFb9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId '6Ca9WUCu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "qbplFCGP", "groupIcon": "VESV8WkR", "groupName": "VUJlG0X9", "groupRegion": "ljTAhq82", "groupType": "8CtEMAPY"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'KeRKr0Uu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'uZPX1opA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "aWmlXYQj", "groupIcon": "VYBWQglR", "groupName": "s9V7HA5c", "groupRegion": "QgmXmhYh", "groupType": "fzw26Mhs"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'iManKLcf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"KnaaQ4ar": {}, "VkxekNtW": {}, "DZgkBnht": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'Yt9g3JYx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'LlxU9ir2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'rEzLTTIG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 't1LLsaGK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'XbmVooQX' \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'qQxxlUo6' \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '78' \
    --order 'WbnU5B35' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'a4enKzj7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"3he1OjZs": {}, "xEOo3tV6": {}, "7qMy9nOq": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'c2L7GkuQ' \
    --groupId '5md0Bpdo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "quNaZQdz", "ruleCriteria": "MINIMUM", "ruleValue": 0.561175358597246}, {"ruleAttribute": "kyFVkjI9", "ruleCriteria": "EQUAL", "ruleValue": 0.15340441875980726}, {"ruleAttribute": "cdh8RTBA", "ruleCriteria": "MAXIMUM", "ruleValue": 0.09088036001636923}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'mb1KadnD' \
    --groupId 'TcxtWutL' \
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
    --limit '14' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'cF3619b8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "BurnBf8o"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'OdJIscQM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "wl6nnRKa"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qFMrlavE' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '8iWJQ1eE' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kbHCBVbI' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mF1tmnYG' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CGciOC5o' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE