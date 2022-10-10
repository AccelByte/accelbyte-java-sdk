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
    --limit '42' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "r9Z1JTNz", "description": "SEW6J4jW", "globalRules": [{"allowedAction": "7GUKrFkX", "ruleDetail": [{"ruleAttribute": "NcN75KsR", "ruleCriteria": "EQUAL", "ruleValue": 0.656263439098098}, {"ruleAttribute": "lGLHEQBp", "ruleCriteria": "MINIMUM", "ruleValue": 0.09049702026300566}, {"ruleAttribute": "2LYgV1kn", "ruleCriteria": "MINIMUM", "ruleValue": 0.3304995750702041}]}, {"allowedAction": "CEhOwkz1", "ruleDetail": [{"ruleAttribute": "21YPOk0O", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6255913486223069}, {"ruleAttribute": "IFM45Qk7", "ruleCriteria": "EQUAL", "ruleValue": 0.7030846882063029}, {"ruleAttribute": "BorbMvVb", "ruleCriteria": "MINIMUM", "ruleValue": 0.652284965639397}]}, {"allowedAction": "T1s9b83m", "ruleDetail": [{"ruleAttribute": "11uioxBU", "ruleCriteria": "MAXIMUM", "ruleValue": 0.517425349753432}, {"ruleAttribute": "jFyB9x52", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3498896347069803}, {"ruleAttribute": "lsbygy3p", "ruleCriteria": "MINIMUM", "ruleValue": 0.29765407918131837}]}], "groupAdminRoleId": "qBoIgwAj", "groupMaxMember": 97, "groupMemberRoleId": "yKC7Xe7A", "name": "rDDNl2Tn"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'Alq3Rv05' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'UN5znag0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 't913ZcQI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "tjZQ83Bh", "groupMaxMember": 55, "name": "lQ4META9"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'PrCK6UiQ' \
    --configurationCode 'ZbygLlDz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "cQZ63RB1", "ruleCriteria": "MINIMUM", "ruleValue": 0.4456156663777322}, {"ruleAttribute": "P0uw0OXk", "ruleCriteria": "MAXIMUM", "ruleValue": 0.060547420378792016}, {"ruleAttribute": "dcZYblLG", "ruleCriteria": "EQUAL", "ruleValue": 0.07991664165896317}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'FWdQov2Z' \
    --configurationCode 'DKIesDSf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode '3sx8jPxF' \
    --groupName 'GfKHa1bZ' \
    --groupRegion 'hKNBT3j4' \
    --limit '67' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId '1dsDaEJv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'SXnSCf7I' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'LBDLfQ62' \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '45' \
    --order 'OOOdaQ4b' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "Uln57w8o", "memberRolePermissions": [{"action": 56, "resourceName": "obJtFf8l"}, {"action": 39, "resourceName": "xHJCgERx"}, {"action": 13, "resourceName": "Ovh0MuTV"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId '2TupVk7d' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'O2tWwxes' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'FcpAfyeJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "AMA2STPY"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'oLcBpxnc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 29, "resourceName": "pwYIFVOa"}, {"action": 42, "resourceName": "i7gxr1sZ"}, {"action": 80, "resourceName": "7OhBnKk5"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'Xm5Mm4TQ' \
    --groupRegion 'QVo7Ptf2' \
    --limit '40' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "amnaGe6P", "customAttributes": {"0bqGJIrT": {}, "0y9hlomY": {}, "xzU1HA6F": {}}, "groupDescription": "Pb5W5QwE", "groupIcon": "4xzIOdJd", "groupMaxMember": 97, "groupName": "XRK3IJvx", "groupRegion": "q8ZGexnt", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "71albnsN", "ruleDetail": [{"ruleAttribute": "rwWaYS3r", "ruleCriteria": "MINIMUM", "ruleValue": 0.2651702129739486}, {"ruleAttribute": "UQhFSJnJ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8219358055860079}, {"ruleAttribute": "cd6B4bUV", "ruleCriteria": "MINIMUM", "ruleValue": 0.46144475190550927}]}, {"allowedAction": "4pdwxTeD", "ruleDetail": [{"ruleAttribute": "QbUwifrU", "ruleCriteria": "EQUAL", "ruleValue": 0.1324992632798614}, {"ruleAttribute": "NnmCUvwv", "ruleCriteria": "MINIMUM", "ruleValue": 0.1778492061771889}, {"ruleAttribute": "w9bTnmxK", "ruleCriteria": "MINIMUM", "ruleValue": 0.31148416152359226}]}, {"allowedAction": "5nzNvAf4", "ruleDetail": [{"ruleAttribute": "hgzh9UKi", "ruleCriteria": "MINIMUM", "ruleValue": 0.9512575795293686}, {"ruleAttribute": "IKdrnqYo", "ruleCriteria": "EQUAL", "ruleValue": 0.7290899151185446}, {"ruleAttribute": "VC0xQqXG", "ruleCriteria": "EQUAL", "ruleValue": 0.1538284516411309}]}]}, "groupType": "g3HtBAJg"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId '1pdeHcy5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'lRaWAeeB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "dTjJBo1a", "groupIcon": "PtEHZAbh", "groupName": "USGuCkEn", "groupRegion": "kDpxn1nH", "groupType": "KY5YcQzc"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'WwrbAIKX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'YUs4lYfF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "9BWHgfPj", "groupIcon": "3AzZsDTX", "groupName": "5LKGiSJy", "groupRegion": "38zqzlsy", "groupType": "jubkOngF"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'ufM6rydU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"U41PykB3": {}, "RIpBMmNG": {}, "j44eIt05": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'li3cGCSZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'hfb1vRa4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId '9L2a66de' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'aZUF24kQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId '6kKefXxu' \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'Z4AV8Zxe' \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '91' \
    --order 'B5CTncW5' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId '4QjFhdKk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"e0xrpaC2": {}, "mHi75dmc": {}, "4tdsFlI0": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction '2ZcH3FIr' \
    --groupId 'eNdNgXLv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "5d5SkGVl", "ruleCriteria": "MINIMUM", "ruleValue": 0.41237381965449316}, {"ruleAttribute": "81ESfMcJ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.250957017629294}, {"ruleAttribute": "AzeTVqsH", "ruleCriteria": "MAXIMUM", "ruleValue": 0.15620066741615746}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'aO3uD4su' \
    --groupId 'Nz4aVO3f' \
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
    --limit '29' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'DIw648lI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "6Nyhq2JG"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 's0rQolsy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "whsWbaeK"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rlqQaZIk' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '2pirkIUy' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '8mOs6jiu' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GenFlOYV' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PKeCc5bH' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE