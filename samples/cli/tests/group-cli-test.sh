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
    --limit '75' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "XEg3OfS7", "description": "Lumj5Ejq", "globalRules": [{"allowedAction": "XP4jXTjP", "ruleDetail": [{"ruleAttribute": "0SuGo3xg", "ruleCriteria": "EQUAL", "ruleValue": 0.8291630823922702}, {"ruleAttribute": "l6iM0F50", "ruleCriteria": "EQUAL", "ruleValue": 0.9165734697310324}, {"ruleAttribute": "RxDcsq4v", "ruleCriteria": "MAXIMUM", "ruleValue": 0.785852500737683}]}, {"allowedAction": "2edhZ2jF", "ruleDetail": [{"ruleAttribute": "1yp10cWW", "ruleCriteria": "MAXIMUM", "ruleValue": 0.24340635395726362}, {"ruleAttribute": "SIovrooJ", "ruleCriteria": "EQUAL", "ruleValue": 0.20856794203644946}, {"ruleAttribute": "eMK3d5h2", "ruleCriteria": "MINIMUM", "ruleValue": 0.9191139998506029}]}, {"allowedAction": "ZpnJCwVN", "ruleDetail": [{"ruleAttribute": "YP612Wui", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8875950576205391}, {"ruleAttribute": "2E9v5mmt", "ruleCriteria": "EQUAL", "ruleValue": 0.8379674415022059}, {"ruleAttribute": "bFinordA", "ruleCriteria": "EQUAL", "ruleValue": 0.41873351790037583}]}], "groupAdminRoleId": "g91m7szL", "groupMaxMember": 90, "groupMemberRoleId": "JGG96u9b", "name": "YZdYrb1l"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'sYE5AzQq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'FFhyPOYg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode '7rdBDmXc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "VSmfJUGL", "groupMaxMember": 25, "name": "Gx9SGpla"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '4Fx61cDd' \
    --configurationCode 'YGozCHrh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "oVQD17lH", "ruleCriteria": "MINIMUM", "ruleValue": 0.5374083324642587}, {"ruleAttribute": "ShCexnxm", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6190752873817733}, {"ruleAttribute": "UwdUmSWo", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9531640337839149}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'JLNzShgy' \
    --configurationCode 'NYy8TERu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'VBGxDOay' \
    --groupName '1PXCyVJp' \
    --groupRegion 'DIg1PkGY' \
    --limit '68' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'mLtqbOON' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'iuiSPegz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'NrMQ3Ozy' \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '70' \
    --order 'lL8XYWIf' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "ekHod3Uu", "memberRolePermissions": [{"action": 57, "resourceName": "NMEx2h0A"}, {"action": 1, "resourceName": "kG4nvuan"}, {"action": 92, "resourceName": "wFIU3pv1"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'haARLV15' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'Wt0aZ2Yr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'sBPhBwqW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "Wz9feOwZ"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'XF3AAQfi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 28, "resourceName": "QdcM61X8"}, {"action": 97, "resourceName": "u5Iz1utD"}, {"action": 24, "resourceName": "8uKlg8cU"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'hQQdpQ0F' \
    --groupRegion 'ZCK1J733' \
    --limit '97' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "yPW4u3qK", "customAttributes": {"0xdG6IeB": {}, "4nWEznMM": {}, "sAX1JqyR": {}}, "groupDescription": "DgAdOw8S", "groupIcon": "yZBhX4wX", "groupMaxMember": 4, "groupName": "3zhwUh1h", "groupRegion": "5gYtVnFo", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "nYhQ6mth", "ruleDetail": [{"ruleAttribute": "ZjMNXR2j", "ruleCriteria": "MINIMUM", "ruleValue": 0.9227678867931064}, {"ruleAttribute": "O3x930N3", "ruleCriteria": "MINIMUM", "ruleValue": 0.3841641214940803}, {"ruleAttribute": "ukk8yYBZ", "ruleCriteria": "EQUAL", "ruleValue": 0.49952146016290844}]}, {"allowedAction": "clVPDzAA", "ruleDetail": [{"ruleAttribute": "NAOd9kI4", "ruleCriteria": "MINIMUM", "ruleValue": 0.7293639078933449}, {"ruleAttribute": "PYfRjWuI", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8932782359201524}, {"ruleAttribute": "ubPwx5kd", "ruleCriteria": "MINIMUM", "ruleValue": 0.7969504501342917}]}, {"allowedAction": "CrQTowO3", "ruleDetail": [{"ruleAttribute": "gQDeUaxP", "ruleCriteria": "MINIMUM", "ruleValue": 0.4260532515402977}, {"ruleAttribute": "t8ozYA9C", "ruleCriteria": "MAXIMUM", "ruleValue": 0.639866884559705}, {"ruleAttribute": "QFu4cG3H", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7464491152771289}]}]}, "groupType": "zZEfpMma"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'J3G6SHds' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'i2DicEIk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "Tq0UBWIX", "groupIcon": "pAmmK3Zf", "groupName": "dLhKZwJl", "groupRegion": "G8jTvGtw", "groupType": "ytkcEk31"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'iPcxkU6Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'stwQnzv6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "Y0JUeHIN", "groupIcon": "W66aiGjI", "groupName": "1zySLnzH", "groupRegion": "A8W3uMxS", "groupType": "ET33aNxw"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'vpzvPslx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"q6pcyZty": {}, "wGVNpvYb": {}, "EYA5GuQD": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'aVEhktWz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'F2kRRVf1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'ukuS6rfu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'eB0AEgLh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'icnystyn' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'sI4C25rs' \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '68' \
    --order 'gjuxwkqZ' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'OWgIKzxJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"eEW9epf4": {}, "8T5fPPx2": {}, "sMiz6m7O": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'JLxZ5hOq' \
    --groupId 'vwNIcoTU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "NyM8czS6", "ruleCriteria": "MINIMUM", "ruleValue": 0.49175059250291986}, {"ruleAttribute": "PBkOPeSA", "ruleCriteria": "EQUAL", "ruleValue": 0.6865968353361276}, {"ruleAttribute": "28zqNFBp", "ruleCriteria": "MINIMUM", "ruleValue": 0.4594240259871627}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'FKxE0Sh9' \
    --groupId 'oaxG8VAw' \
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
    --offset '0' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'aismFlZE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "CC3WBbpG"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'xwNygUaz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "MQJzFPtC"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Va8yrkL1' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'B99gejzP' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TC0cxG5E' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'birRMq6g' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jZaUCGp7' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE