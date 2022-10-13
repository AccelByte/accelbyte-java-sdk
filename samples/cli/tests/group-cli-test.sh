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
    --limit '90' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "97DmPPmi", "description": "jNcCn1uo", "globalRules": [{"allowedAction": "PbNQgA8J", "ruleDetail": [{"ruleAttribute": "1aPC3FjK", "ruleCriteria": "MINIMUM", "ruleValue": 0.33821273972795507}, {"ruleAttribute": "txGvbR4f", "ruleCriteria": "EQUAL", "ruleValue": 0.46269004291976845}, {"ruleAttribute": "jV0mVG7O", "ruleCriteria": "MINIMUM", "ruleValue": 0.0833366942520043}]}, {"allowedAction": "eYumKpk4", "ruleDetail": [{"ruleAttribute": "umZ1czij", "ruleCriteria": "EQUAL", "ruleValue": 0.14820344862423607}, {"ruleAttribute": "3XPKGr7Q", "ruleCriteria": "EQUAL", "ruleValue": 0.8765847381814708}, {"ruleAttribute": "MUFmaSBy", "ruleCriteria": "EQUAL", "ruleValue": 0.6781875909093291}]}, {"allowedAction": "cRLLXMy8", "ruleDetail": [{"ruleAttribute": "0fTd8EES", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3002888712408557}, {"ruleAttribute": "EfJuZi1h", "ruleCriteria": "MINIMUM", "ruleValue": 0.1929725556014511}, {"ruleAttribute": "aSzBOqWJ", "ruleCriteria": "MINIMUM", "ruleValue": 0.8049552421346178}]}], "groupAdminRoleId": "rtu3JQnz", "groupMaxMember": 26, "groupMemberRoleId": "hWSb5j3A", "name": "7yhj2zcP"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'otN624Ny' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'OqsHgkI0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'rqnxpAk2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Dqe5qAtD", "groupMaxMember": 72, "name": "L8kGvedq"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '8EHR5Fgd' \
    --configurationCode 'BIhPdaYf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "P6LwIO7P", "ruleCriteria": "MINIMUM", "ruleValue": 0.4585812774654098}, {"ruleAttribute": "NOF1ivSb", "ruleCriteria": "EQUAL", "ruleValue": 0.6422421447667223}, {"ruleAttribute": "ySBwQmtV", "ruleCriteria": "EQUAL", "ruleValue": 0.23931636020013458}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'LXD5ZBbQ' \
    --configurationCode '0Ikhbjth' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'bf5n8z7P' \
    --groupName 'rVT0oT2Q' \
    --groupRegion 'eFUSMVgQ' \
    --limit '23' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'KK9nSOoY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'lQfO0VgJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'J6kER4ti' \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '43' \
    --order 'OpBXBUzo' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "GLtgBko6", "memberRolePermissions": [{"action": 35, "resourceName": "ZdsoQ55w"}, {"action": 45, "resourceName": "qWinFh12"}, {"action": 53, "resourceName": "glzn4xfz"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'GICIUXh0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId '8eoD7G3I' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'YdyZWiCC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "h7wBfRZS"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId '3u7teHLL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 22, "resourceName": "ViO2QPyJ"}, {"action": 65, "resourceName": "jJjmce4U"}, {"action": 93, "resourceName": "oCUx75Fl"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName '9VYS5imz' \
    --groupRegion 'vXRFhCTC' \
    --limit '30' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "zT9SuSme", "customAttributes": {"Ee7MwVUu": {}, "P7l7BuNj": {}, "lAX9d1yQ": {}}, "groupDescription": "zDkJrOA1", "groupIcon": "Pu782Av1", "groupMaxMember": 4, "groupName": "PJgkeJXv", "groupRegion": "lCpBdnCI", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "JlBud41g", "ruleDetail": [{"ruleAttribute": "GwEwAR2J", "ruleCriteria": "EQUAL", "ruleValue": 0.742013191762985}, {"ruleAttribute": "wvtjw5JM", "ruleCriteria": "MAXIMUM", "ruleValue": 0.26381600202719446}, {"ruleAttribute": "Y7xdNYtM", "ruleCriteria": "EQUAL", "ruleValue": 0.5846597649758674}]}, {"allowedAction": "k7xXMxJ9", "ruleDetail": [{"ruleAttribute": "JBjT2mpo", "ruleCriteria": "EQUAL", "ruleValue": 0.46813535478245816}, {"ruleAttribute": "Lgg3sO7r", "ruleCriteria": "MINIMUM", "ruleValue": 0.6846654156873053}, {"ruleAttribute": "pPeWHWMw", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7650229301666414}]}, {"allowedAction": "cADrprd0", "ruleDetail": [{"ruleAttribute": "xnIb79Qc", "ruleCriteria": "EQUAL", "ruleValue": 0.49342856689379877}, {"ruleAttribute": "voWl7w90", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5921864753294122}, {"ruleAttribute": "QDMe8qYR", "ruleCriteria": "MINIMUM", "ruleValue": 0.4667341976500572}]}]}, "groupType": "0lWb3USO"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'Mo05RaaK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'YGrMJJKK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "seqzQvog", "groupIcon": "gh3VosTV", "groupName": "hcoLNO64", "groupRegion": "y33pEBzz", "groupType": "MAKfMd1l"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'cMKjD4mT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'nNRZmcdk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "OFozmHOH", "groupIcon": "jHR8YIoc", "groupName": "iMDKdPzx", "groupRegion": "qpCSSaIP", "groupType": "E1pl06eg"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'snENucAn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"tBxhFbvq": {}, "DFIZ81zq": {}, "rL4GS9Tr": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'h9e5Ce2b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'Ys0SCpyw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'wki5qidj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId '8065yqeT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'AhYPpObB' \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'Ue0EUTA0' \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '95' \
    --order 'GyzVb2Vb' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'WdFEF5ug' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"RUWeiZsk": {}, "US1SU1ad": {}, "83iNZXbl": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'Q36QX4cE' \
    --groupId '6sDc6h0p' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "LXRYrEXs", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5748653735449025}, {"ruleAttribute": "ShihGF5n", "ruleCriteria": "MAXIMUM", "ruleValue": 0.324816914535499}, {"ruleAttribute": "zZ4dB4Bv", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8871224564715419}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'q2qiBWbq' \
    --groupId 'knbX9Ngv' \
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
    --limit '31' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId '0CA7CYZo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "Cr4dybBd"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId '0qlDtW75' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "VaUv8HTD"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WcGopBiL' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LDLxcQfd' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '2SxBVRiX' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yP0PvLSS' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '156DrwK0' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE