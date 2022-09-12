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
    --limit '24' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "oMFmLnIH", "description": "CnBes6W7", "globalRules": [{"allowedAction": "C2CRFvpv", "ruleDetail": [{"ruleAttribute": "offjGwkp", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9829559907656717}, {"ruleAttribute": "bxgE7179", "ruleCriteria": "MINIMUM", "ruleValue": 0.5306905801229147}, {"ruleAttribute": "tRQzahRc", "ruleCriteria": "MINIMUM", "ruleValue": 0.36269275426449776}]}, {"allowedAction": "ds8wPFCj", "ruleDetail": [{"ruleAttribute": "Wo3M87dR", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5185074882065802}, {"ruleAttribute": "1IYFliVz", "ruleCriteria": "MINIMUM", "ruleValue": 0.7583841487626216}, {"ruleAttribute": "jFnIIK6K", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8339698813174179}]}, {"allowedAction": "iAEtVVJ8", "ruleDetail": [{"ruleAttribute": "5JEPecIh", "ruleCriteria": "MINIMUM", "ruleValue": 0.5635515677455846}, {"ruleAttribute": "3mzMgh6a", "ruleCriteria": "EQUAL", "ruleValue": 0.8710560256099517}, {"ruleAttribute": "q8iXZmNv", "ruleCriteria": "MINIMUM", "ruleValue": 0.2594637593081466}]}], "groupAdminRoleId": "0PJFNEBn", "groupMaxMember": 58, "groupMemberRoleId": "QeZrK7A3", "name": "Dx28HHAd"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'uKeoDzHo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'VTPKJw6D' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'WcfeTJUF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "lzlZdiCJ", "groupMaxMember": 46, "name": "oSr4DMfG"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'dpat2umM' \
    --configurationCode 'rq1FTbGT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "D3EFFan8", "ruleCriteria": "EQUAL", "ruleValue": 0.5127244162253591}, {"ruleAttribute": "YIn9qEuZ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.18727570497928936}, {"ruleAttribute": "GzjPMHcK", "ruleCriteria": "EQUAL", "ruleValue": 0.8935627417473835}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'cReDlQA8' \
    --configurationCode 'Pe867hDP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'uSx5K0bk' \
    --groupName '7Q8VXOL8' \
    --groupRegion 'NQ1Z35yc' \
    --limit '63' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId '4dYjw89h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'smCfHP5K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'S8jBIRHi' \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '48' \
    --order 'I3Y7ZqqB' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "OTYOr9h8", "memberRolePermissions": [{"action": 39, "resourceName": "baRc7S7L"}, {"action": 68, "resourceName": "Q9sA55RK"}, {"action": 70, "resourceName": "qc2HEDJq"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId '5CbXd6HE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId '5L6d5ULx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'zu6B70S6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "gYC5f2e0"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'AiItqtdM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 0, "resourceName": "RFKn3rgv"}, {"action": 60, "resourceName": "nV2il9cq"}, {"action": 37, "resourceName": "OG6VUeyu"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'o30QDXnd' \
    --groupRegion 'CYLRdLGM' \
    --limit '9' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "GfHbJDEP", "customAttributes": {"vZUS9gPX": {}, "SaJ78sfG": {}, "H9OoyUCE": {}}, "groupDescription": "EhWoUxUI", "groupIcon": "DymGO44S", "groupMaxMember": 26, "groupName": "CicVOkJP", "groupRegion": "CB72zDhq", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "8Kk0vSxC", "ruleDetail": [{"ruleAttribute": "xznKQCIU", "ruleCriteria": "MINIMUM", "ruleValue": 0.27170010098884423}, {"ruleAttribute": "dySNKHPf", "ruleCriteria": "EQUAL", "ruleValue": 0.924273100700188}, {"ruleAttribute": "1pAIBISb", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6926314694064192}]}, {"allowedAction": "7P7Gf1x9", "ruleDetail": [{"ruleAttribute": "gpsfgo1o", "ruleCriteria": "EQUAL", "ruleValue": 0.796637649902092}, {"ruleAttribute": "TwpiSzRt", "ruleCriteria": "MAXIMUM", "ruleValue": 0.47114196777153494}, {"ruleAttribute": "12NungdL", "ruleCriteria": "EQUAL", "ruleValue": 0.8228345863473344}]}, {"allowedAction": "ePBsEI0G", "ruleDetail": [{"ruleAttribute": "iepXIJjf", "ruleCriteria": "EQUAL", "ruleValue": 0.6869260803813174}, {"ruleAttribute": "kjrN8bAO", "ruleCriteria": "MINIMUM", "ruleValue": 0.6527588325756989}, {"ruleAttribute": "yiCxsb0K", "ruleCriteria": "EQUAL", "ruleValue": 0.18118608308198392}]}]}, "groupType": "GboeXbV9"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'mag66HwO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'fklGx6MN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "N5sh04nI", "groupIcon": "spfrlTb5", "groupName": "nPDTr77K", "groupRegion": "qJ0oWgyE", "groupType": "6mx63oLH"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId '2KEG5xwe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId '2SNPBTCO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "Rckbazlr", "groupIcon": "tFvJsS08", "groupName": "F9XOaIo0", "groupRegion": "gtcXIF5x", "groupType": "dncuY7gm"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'eo1NmL9Y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"GfbojEWd": {}, "adYiSIfy": {}, "IXB8JbSX": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'IIPQa0Wg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'IVLROR3b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'CXvwQKBs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'eDiE19pw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'Fwg0QIFA' \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'oOl05CfH' \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '27' \
    --order 'm7naCftn' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'VVy1j3Qg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"AG5XAt70": {}, "ypnAB9oR": {}, "YRayl7cx": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction '1wMLAFGK' \
    --groupId 'XWKgiRNC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "bjUNZhP2", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2559242655249375}, {"ruleAttribute": "IRRHFkIF", "ruleCriteria": "MAXIMUM", "ruleValue": 0.23990995516152502}, {"ruleAttribute": "iZ6SoKTO", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9333797009404751}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'B1U6vHgh' \
    --groupId '1iprVRgp' \
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
    --limit '55' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'fOZZkdja' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "ZmG5r9BO"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'Jl57ZyJe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "U25ooMKT"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pRAwxUjK' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '06qmr8ex' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MnJ9W03L' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rOu3AYAe' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '8FtoaRx8' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE