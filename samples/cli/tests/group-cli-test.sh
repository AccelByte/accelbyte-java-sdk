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
    --limit '7' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "Rh1hdk26", "description": "lIbDewe3", "globalRules": [{"allowedAction": "vZLjK0sm", "ruleDetail": [{"ruleAttribute": "iG8jZDKj", "ruleCriteria": "EQUAL", "ruleValue": 0.8201786990568891}, {"ruleAttribute": "i3o3csUI", "ruleCriteria": "EQUAL", "ruleValue": 0.5110731746986749}, {"ruleAttribute": "htEAfebe", "ruleCriteria": "EQUAL", "ruleValue": 0.44793890100155376}]}, {"allowedAction": "XIVMsTpL", "ruleDetail": [{"ruleAttribute": "6P4Nrgz4", "ruleCriteria": "MINIMUM", "ruleValue": 0.5748022141660118}, {"ruleAttribute": "RcrYBJC1", "ruleCriteria": "MINIMUM", "ruleValue": 0.14028205182528686}, {"ruleAttribute": "UVT5cNtN", "ruleCriteria": "EQUAL", "ruleValue": 0.1785214116175009}]}, {"allowedAction": "O4l7oyMt", "ruleDetail": [{"ruleAttribute": "xByF3thD", "ruleCriteria": "EQUAL", "ruleValue": 0.04835349636612907}, {"ruleAttribute": "VmHzhrOX", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5183306358768632}, {"ruleAttribute": "VcXEqgl4", "ruleCriteria": "MINIMUM", "ruleValue": 0.786010448129068}]}], "groupAdminRoleId": "7tjr545w", "groupMaxMember": 27, "groupMemberRoleId": "TFvkSTQ1", "name": "hf0GcX7t"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'aslvFlVK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'Q0movRBj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'xcrXI7LI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "9R4VxHcm", "groupMaxMember": 7, "name": "jxPvS0nI"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '1kafXmUZ' \
    --configurationCode 'NnzJiyUh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "9mdij4FH", "ruleCriteria": "MINIMUM", "ruleValue": 0.5354882497056963}, {"ruleAttribute": "pR9rE8MC", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7551572533814433}, {"ruleAttribute": "3r3skdYW", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8683857775703943}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'LMWXvzhA' \
    --configurationCode '9XfYdzpa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'KTjDiU53' \
    --groupName 'KMf7FNXr' \
    --groupRegion '4z7kfeFE' \
    --limit '89' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'qnSMLvsq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'fjxwCleW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'V1MHlLr3' \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '59' \
    --order 'm7fefcoa' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "nfBEJWZB", "memberRolePermissions": [{"action": 97, "resourceName": "KqdjYHqo"}, {"action": 32, "resourceName": "gpzgyz9S"}, {"action": 83, "resourceName": "Yg8U5o7h"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'XKBz2gVB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'sVmBIpek' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'YQmBbCu0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "mZyPlek0"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'xvHsWsjs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 30, "resourceName": "Ycd1N83N"}, {"action": 7, "resourceName": "vJIFXxk5"}, {"action": 55, "resourceName": "ys7ZRgNq"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'oH8J0Cii' \
    --groupRegion 'Iy25iNEa' \
    --limit '83' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "hmBqt8NN", "customAttributes": {"IDexr7RK": {}, "8VsCphCd": {}, "pPBQTX09": {}}, "groupDescription": "RYx3oNMc", "groupIcon": "nN90DaJx", "groupMaxMember": 75, "groupName": "C5j0UsQK", "groupRegion": "jfu9HzMD", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "HbfJmhtp", "ruleDetail": [{"ruleAttribute": "GN7Rec0G", "ruleCriteria": "EQUAL", "ruleValue": 0.46779106989267893}, {"ruleAttribute": "WTh6esmq", "ruleCriteria": "MINIMUM", "ruleValue": 0.0409811259704258}, {"ruleAttribute": "o9X1Xcq9", "ruleCriteria": "MINIMUM", "ruleValue": 0.3462660136555078}]}, {"allowedAction": "OxudFLwJ", "ruleDetail": [{"ruleAttribute": "knkYFsPu", "ruleCriteria": "MINIMUM", "ruleValue": 0.49921446792495816}, {"ruleAttribute": "d9VlBsBt", "ruleCriteria": "MINIMUM", "ruleValue": 0.06462774554197748}, {"ruleAttribute": "Om2gQY7k", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5739812696535987}]}, {"allowedAction": "66lfHitW", "ruleDetail": [{"ruleAttribute": "186M1QI2", "ruleCriteria": "EQUAL", "ruleValue": 0.5202402640128264}, {"ruleAttribute": "rhad5xjY", "ruleCriteria": "EQUAL", "ruleValue": 0.9947490554404376}, {"ruleAttribute": "Xu17QdEe", "ruleCriteria": "EQUAL", "ruleValue": 0.7483898010032195}]}]}, "groupType": "kGSGhPPx"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'Unm4XgsT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'pJYZrl52' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "hluV9ZoU", "groupIcon": "7rTkqeUA", "groupName": "5lJWmEor", "groupRegion": "vYaIXUKI", "groupType": "SwNyosKC"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'iogLmXyr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'dlZ8A5Ve' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "yhzOloiP", "groupIcon": "NJuTNEai", "groupName": "OUad3kI3", "groupRegion": "y8KTnTUd", "groupType": "cGe5IEU2"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'a2SeRuhJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"ghny36Gb": {}, "0CTczDye": {}, "nOgBnl7i": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'uWF7BzJS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'kcj3n0BW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'miwL3TxE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'yz3Os6hB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'OgVqs5ft' \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'aum8UnTs' \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '63' \
    --order 'GWJfgyNO' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'wSqK8yfC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"O1czTxtg": {}, "zDXhQtMU": {}, "DGsIBp6U": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'jJH36pNW' \
    --groupId 'HR9nUJel' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "XwWxWETT", "ruleCriteria": "MINIMUM", "ruleValue": 0.8747084631039135}, {"ruleAttribute": "sHvI3Pkn", "ruleCriteria": "EQUAL", "ruleValue": 0.7942858445803922}, {"ruleAttribute": "O23iAuxa", "ruleCriteria": "MINIMUM", "ruleValue": 0.4136219654737312}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction '2t9XuZLU' \
    --groupId 'W4vBrLkJ' \
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
    --limit '73' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'UdzGxg9j' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "eNcrwgjp"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'zp7egTUr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "LG9OxmBe"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bb7h7SAW' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tn53EBuf' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WzD1XoKs' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5BEvWKBM' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UyTjqrbH' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE